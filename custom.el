(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(canlock-password "b2d1ae48850d174e4d137e0622c9a93a71245977")
 '(gnus-select-method '(nnnil))
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(package-selected-packages
   '(display-wttr wttrin circe-notifications circe rcirc-styles vimrc-mode tide bazel minimap elfeed exwm emojify persistent-soft beacon))
 '(send-mail-function 'smtpmail-send-it))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; elfeed
 '(elfeed-feeds
   '("http://syndication.thedailywtf.com/TheDailyWtf" "http://lambda-the-ultimate.org/rss.xml" "http://feeds.feedburner.com/codinghorror"
     "https://solar.lowtechmagazine.com/feeds/all-en.atom.xml" "http://feeds.feedburner.com/techtarget/tsscom/home"
     "http://martinfowler.com/bliki/bliki.atom" "http://lessig.org/blog/atom.xml"))

  (use-package elfeed
    :ensure t
    :config
    (setq elfeed-db-directory (expand-file-name "elfeed" user-emacs-directory)
          elfeed-show-entry-switch 'display-buffer)
    :bind
    ("C-x w" . elfeed ))

;; Minimap on right side
(setq minimap-window-location 'right)
(global-set-key "tm" 'minimap-mode)

;; Use org-bullets
(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Fortune cookies !!!
;; (require 'fortune)
(setq fortune-dir "/usr/share/games/fortunes"
      fortune-file "/usr/share/games/fortunes/fortunes")

;; Neotree
(setq neo-window-fixed-size nil)
;; Show all files, including hidden files
(setq-default neo-show-hidden-files t)
;; Open / Close Neotree
(global-set-key (kbd "C-<") 'neotree-toggle)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Time in modeline gets cut off, scale icons to fit
(setq all-the-icons-scale-factor 0.8)

;; Fix Centaur Tabs problem
;;(after! centaur-tabs
;;  (centaur-tabs-group-by-projectile-project))

;; replace 'a' and 'A' with '4'  C-c 4
(require 'replace-a-with-4)
