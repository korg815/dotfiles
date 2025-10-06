;; Copyright (C) 2023  emacs-neophyte
;; This code is released under the GNU GPLv3 license.
;; See https://www.gnu.org/licenses/gpl-3.0.en.html for the license text.

;; Usage:
;;  M-x conceal-mode

;; The appearance of a buffer before activating conceal-mode:
;;
;;   Hello world!
;;     This is text.
;;
;; The appearance of a buffer after activating conceal-mode:
;;
;;   ***** ******
;;     **** ** *****

(defun conceal--printable-p (c)
  (not (or (= c ?\s)
	   (= c ?\n)
	   (= c ?\f)
	   (= c ?\t)
	   (= c ?\v))))

(defvar conceal--overlay-properties
  '((category . conceal)
    (priority . 1000)
    (evaporate . t))
  "Properties to attach to each concealment overlay, except 'display.")

(defvar conceal--display-character
  ?*
  "Character to use for concealing the actual text of a buffer.")

(defun conceal--apply-overlay-props (overlay alist)
  (dolist (pair alist)
    (let ((property (car pair))
	  (value (cdr pair)))
      (overlay-put overlay property value))))

(defun conceal--hide (start end)
  (save-excursion
    (goto-char start)
    (while (< (point) end)
      (let* ((pt (point))
	     (overlay (make-overlay pt (+ 1 pt) (current-buffer) t)))
	(when (conceal--printable-p (following-char))
	  (overlay-put overlay 'display
		       (string conceal--display-character)))
	(conceal--apply-overlay-props overlay
					conceal--overlay-properties))
      (forward-char))))

(defun conceal--show (start end)
  (remove-overlays start end 'category 'conceal))

(defun conceal--after-change (start end length-before-change)
  (conceal--hide start end))

(define-minor-mode conceal-mode
  "Toggle Conceal mode."
  :lighter " Conceal"
  (save-excursion
    (if conceal-mode
	(progn
	  (add-hook 'after-change-functions #'conceal--after-change 0 t)
	  (conceal--hide (point-min) (point-max)))
      (remove-hook 'after-change-functions #'conceal--after-change t)
      (conceal--show (point-min) (point-max)))))
