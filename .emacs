;;AUTHOR: Steffen Schmid
;;DATE: 2015-02-13
;;TITLE: My GNU Emacs conifg file
;===========================================================================================================

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


(load-theme 'solarized-dark t)
(setq sml/no-confirm-load-theme t)
(sml/setup)
(sml/apply-theme 'dark)


(require 'use-package)


;Enable Windmove to switch buffers more easy
(use-package windmove
  :ensure t
  :bind
  (("C-c <right>" . windmove-right)
   ("C-c <left>" . windmove-left)
   ("C-c <up>" . windmove-up)
   ("C-c <down>" . windmove-down)))


;Enable IDO Mode
(use-package ido
  :ensure t
  :init
  (progn
    (ido-mode 1)
    (ido-everywhere 1)
    (setq ido-create-new-buffer 'always)
    (setq ido-file-extension-order '(".org" ".cpp" ".hpp" ".txt" ".emacs"))
    (setq ido-ignore-extensions t)
    (setq ido-separator "\n")
    (ido-mode (quote both))
    ))

(use-package flx-ido
  :ensure t
  :config
  (flx-ido-mode 1)
  ;; disable ido faces to see flx highlights.
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil)
  )

;Enable IDO Mode for M-x
(global-set-key
 "\M-x"
 (lambda ()
   (interactive)
   (call-interactively
    (intern
     (ido-completing-read
      "M-x "
      (all-completions "" obarray 'commandp))))))


(use-package auto-complete
	     :ensure t)
(require 'auto-complete-config)
(ac-config-default)


;start yasnippet with emacs
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))


;Enable Google-This
(use-package google-this
  :ensure t
  :config
  (google-this-mode 1))


;Enable expand-region
(use-package expand-region
  :ensure t
  :init
  (bind-key "C-c =" 'er/expand-region))


;enable visual regex
(use-package visual-regexp
  :ensure t
  :bind
  (("C-c r" . vr/replace)
   ("C-c q" . vr/query-replace)
   ("C-c m" . vr/mc-mark)))



(use-package multiple-cursors
  :ensure t)


(use-package helm-swoop
  :ensure t
  :bind
  (("M-i" . helm-swoop)
   ("M-I" . helm-swoop-back-to-last-point)
   ("C-c M-i" . helm-multi-swoop)
   ("C-x M-i" . helm-multi-swoop-all)
   )
  :config
  (progn
    (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
    (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop))
  )


;Golden Ration mode to always have the current buffer maximized.
(use-package golden-ratio
  :ensure t
  :config
  (golden-ratio-mode 1))


;Enable Web-Mode for easy HTML, CSS or JS editing.
(use-package web-mode
	     :ensure t
	     :config
	     (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
	     (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
	     (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
	     (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
	     (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
	     (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
	     (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
	     (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
	     (add-to-list 'web-mode-ac-sources-alist
			  '("html" . (ac-source-html-attribute-value
				      ac-source-html-tag
				      ac-source-html-attribute)))
	     )



;Show time and date in the minibuffer
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)

(setq backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-file-name-transforms `((".*" ,"~/.saves" t)))

(global-linum-mode t)

;Yes or No for lazy people
(fset 'yes-or-no-p 'y-or-n-p)

;===========================================================================================================
;Keybindings

(define-key global-map (kbd "C-c a") 'org-agenda-list) ; Org Weekly Agenda
(define-key global-map (kbd "C-c e") 'eshell); Emacs Shell
(define-key global-map (kbd "C-c s") 'magit-status); Git status
(define-key global-map (kbd "C-x C-b") 'ibuffer); Nicer buffer overview

;============================================================================================================

;Org Mode Config
;Custom designed Keywords/States for org-Mode

(setq org-todo-keywords
'((sequence "TODO" "|" "DONE")
(sequence "OPEN" "FEEDBACK" "VERIFY" "|" "COMPLETE")
(sequence "APPOINTMENT" "MEETING" "|" "OVER" "CANCELED")))

;============================================================================================================
;Some custom functions

;When hitting C-a, move the cursor to the first not whitespace charakter
;Copied from http://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.
Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.
If ARG is not nil or 1, move forward ARG - 1 lines first. If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))
  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))
  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))
;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
		'smarter-move-beginning-of-line)

;Makes splitting windows with C-x 2/3 more effective
;Copied from http://www.reddit.com/r/emacs/comments/25v0eo/you_emacs_tips_and_tricks/chldury
(defun vsplit-last-buffer ()
  (interactive)
  (split-window-vertically)
  (other-window 1 nil)
  (switch-to-next-buffer)
  )
(defun hsplit-last-buffer ()
  (interactive)
  (split-window-horizontally)
  (other-window 1 nil)
  (switch-to-next-buffer)
  )
(global-set-key (kbd "C-x 2") 'vsplit-last-buffer)
(global-set-key (kbd "C-x 3") 'hsplit-last-buffer)

;Insert date in current buffer
;Copied from http://www.emacswiki.org/emacs/InsertDate
(defun insert-date (prefix)
  "Insert the current date. With prefix-argument, use ISO format. With
two prefix arguments, write out the day and month name."
  (interactive "P")
  (let ((format (cond
		 ((not prefix) "%d.%m.%Y")
		 ((equal prefix '(4)) "%Y-%m-%d")
		 ((equal prefix '(16)) "%A, %d. %B %Y")))
	(system-time-locale "de_DE"))
    (insert (format-time-string format))))
(define-key global-map (kbd "C-c d") 'insert-date)

;Toggle case of words
;Copied from http://oremacs.com/2014/12/25/ode-to-toggle/
(defun char-upcasep (letter)
  (eq letter (upcase letter)))
(defun capitalize-word-toggle ()
  (interactive)
  (let ((start
	 (car
	  (save-excursion
	    (backward-word)
	    (bounds-of-thing-at-point 'symbol)))))
    (if start
	(save-excursion
	  (goto-char start)
	  (funcall
	   (if (char-upcasep (char-after))
	       'downcase-region
	     'upcase-region)
	   start (1+ start)))
      (capitalize-word -1))))
(define-key global-map (kbd "C-z") 'capitalize-word-toggle)

;Switches the cases of the whole word
;Copied from http://oremacs.com/2014/12/25/ode-to-toggle/
(defun upcase-word-toggle ()
  (interactive)
  (let ((bounds (bounds-of-thing-at-point 'symbol))
	beg end
	(regionp
	 (if (eq this-command last-command)
	     (get this-command 'regionp)
	   (put this-command 'regionp nil))))
    (cond
     ((or (region-active-p) regionp)
      (setq beg (region-beginning)
	    end (region-end))
      (put this-command 'regionp t))
     (bounds
      (setq beg (car bounds)
	    end (cdr bounds)))
     (t
      (setq beg (point)
	    end (1+ beg))))
    (save-excursion
      (goto-char (1- beg))
      (and (re-search-forward "[A-Za-z]" end t)
	   (funcall (if (char-upcasep (char-before))
			'downcase-region
		      'upcase-region)
		    beg end)))))
(define-key global-map (kbd "C->") 'upcase-word-toggle)


;============================================================================================================
;============================================================================================================
