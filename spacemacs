(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     c-c++
     html
     java
     javascript
     latex
     markdown
     sql
     eyebrowse
     ranger
     auto-completion
     better-defaults
     emacs-lisp
     git
     org
     spell-checking
     syntax-checking
     git
     github
     rcirc
     search-engine
     gnus
     themes-megapack
     )
   dotspacemacs-additional-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-themes '(darktooth
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup t
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   ranger-override-dired t
   ))

(defun dotspacemacs/user-init ()
  ;(setq ranger-override-dired t)
  (setq ranger-cleanup-on-disable t)
)

(defun dotspacemacs/user-config ()

  ;; Get email, and store in nnml
  (setq gnus-secondary-select-methods
        '(
          (nntp "gmane"
                (nntp-address "news.gmane.org"))
          (nntp "news.eternal-september.org")
          (nntp "nntp.aioe.org")
          (nntp "news.gwene.org")
          ))

  (setq rcirc-server-alist
        '(("irc.freenode.net"
           :user ""
           :port "6667"
           :password ""
           :channels (""))))

;Org Mode Config
;Custom designed Keywords/States for org-Mode

  (setq org-todo-keywords
        '((sequence "TODO" "|" "DONE")
          (sequence "OPEN" "FEEDBACK" "VERIFY" "|" "COMPLETE")
          (sequence "APPOINTMENT" "MEETING" "|" "OVER" "CANCELED")))

; Custom Keybindings

  (define-key global-map (kbd "C-c a") 'org-agenda-list) ; Org Weekly Agenda
  (define-key global-map (kbd "C-c e") 'eshell); Emacs Shell
  (define-key global-map (kbd "C-c s") 'magit-status); Git status

;Show time and date in the minibuffer
  (setq display-time-day-and-date t
        display-time-24hr-format t)
  (display-time)
)


;; ===============================================================================================================================================================================================
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
