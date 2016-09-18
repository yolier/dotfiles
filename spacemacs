;;AUTHOR: Steffen Schmid
;;DATE: 18.09.2016
;;TITLE: Spacemacs Config
; =====================================================================================================

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     auto-completion
     better-defaults
     c-c++
     emacs-lisp
     elfeed
     eyebrowse
     git
     github
     haskell
     html
     ibuffer
     javascript
     latex
     markdown
     org
     ranger
     search-engine
     shell
     speed-reading
     spell-checking
     sql
     syntax-checking
     themes-megapack
     )
   dotspacemacs-additional-packages '(
                                      ox-reveal
                                      ox-twbs
                                      )
   dotspacemacs-excluded-packages '()
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '(recents projects)

   dotspacemacs-themes '(
                         gruvbox
                         monokai
                         spacemacs-light
                        )

   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Consolas"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup t
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup "trailing"
   ))

(defun dotspacemacs/user-init ()
  ;(setq ranger-override-dired t)
  (setq ranger-cleanup-on-disable t)
  (setq ranger-show-dotfiles nil)
)

(defun dotspacemacs/user-config ()

  (setq powerline-default-separator 'slant)

  (elfeed-org)
  (setq rmh-elfeed-org-files (list "~/.emacs.d/private/elfeed.org"))

; definition of custome search engines for engine-mode
  (push '(hoogle
          :name "Hoogle Search"
          :url "https://www.haskell.org/hoogle/?hoogle=%s")
        search-engine-alist)

  (push '(hackage
          :name "Hackage Search"
          :url "https://hackage.haskell.org/packages/search?terms=%s")
        search-engine-alist)

; Org Mode Config

; define general org mode keybindings
  (spacemacs/declare-prefix "o" "Org Mode Global")
  (spacemacs/set-leader-keys "oa" 'org-agenda)
  (spacemacs/set-leader-keys "oc" 'org-capture)

; more general settings
  (setq org-ellipsis "⤵")
  (setq org-src-fontify-natively t)
  (setq org-log-done 'time)
  (setq org-timer-default-timer 30)

; Load additional org exporter
  (setq org-reveal-root "file:///home/sschmid/devenv/src/extern/reveal.js")
  (load-library "ox-reveal")
  (load-library "ox-twbs")
  (load-library "ox-beamer")

; utility function to turn org filepath into absolute path
  (defun org-file-path (filename)
    "Return the absolute address of an org file, given its relative name."
    (concat (file-name-as-directory org-directory) filename))

; Setup org directory and some special files
  (setq org-directory "~/Dropbox/doc/org")
  (setq org-index-file (org-file-path "index.org"))
  (spacemacs/set-leader-keys "ot" (lambda() (interactive)(find-file org-index-file)))

; list of files to include in agenda
  (setq org-agenda-files (list org-index-file))

; same archived items to archive.org
  (setq org-archive-location
      (concat (org-file-path "archive.org") "::* From %s"))

; custome org-capture templates
  (setq org-capture-templates
        '(
          ("g" "Groceries"
           checkitem
           (file (org-file-path "groceries.org")))

          ("r" "Reading"
           checkitem
           (file (org-file-path "to_read.org")))

          ("d" "Mixed Dump"
           entry
           (file (org-file-path "misc_dump.org"))
           "* %?\n")

          ("j" "Journal entry"
           entry (file+datetree (org-file-path "journal.org"))
           "**** %T %^{Title}\n%?")

          ("t" "Todo"
           entry
           (file org-index-file)
           "* TODO %?\n")

          ("w" "Wanna Do"
           entry
           (file (org-file-path "wanna_do.org"))
           "* WANNADO %?\n")
          ))

; start org-capture in insert mode
  (add-hook 'org-capture-mode-hook 'evil-insert-state)

;Custom designed Keywords/States for org-Mode
  (setq org-todo-keywords
        '((sequence "TODO" "WAITING" "|" "DONE")
          (sequence "WANNADO" "|" "DONE")
          (sequence "OPEN" "FEEDBACK" "VERIFY" "|" "COMPLETE")
          (sequence "APPOINTMENT" "MEETING" "|" "OVER" "CANCELED")))

; Custom Keybindings

  (define-key global-map (kbd "C-c a") 'org-agenda-list) ; Org Weekly Agenda
  (define-key global-map (kbd "C-c e") 'term); Emacs Shell
  (define-key global-map (kbd "C-c s") 'magit-status); Git status

;Show time and date in the minibuffer
  (setq display-time-day-and-date t
        display-time-24hr-format t)
  (display-time)
  
; use fancy symbols
  (global-prettify-symbols-mode t)

;Insert date in current buffer
;Copied from http://www.emacswiki.org/emacs/InsertDate
  (defun insert-date (prefix)
    "Insert the current date. With prefix-argument, use ISO format. With two prefix arguments, write out the day and month name."
    (interactive "P")
    (let ((format (cond
                   ((not prefix) "%d.%m.%Y")
                   ((equal prefix '(4)) "%Y-%m-%d")
                   ((equal prefix '(16)) "%A, %d. %B %Y")))
          (system-time-locale "de_DE"))
      (insert (format-time-string format))))
  (define-key global-map (kbd "C-c d") 'insert-date)

)


;; ====================================================================================================
