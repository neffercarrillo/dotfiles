;;-*-mode:elisp-byte-code-*-


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; package manager config
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; theme
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-theme 'wheatgrass)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; vars
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq *my-custom-home-dir-windows* "c:/workspace")
(setq *my-custom-home-dir-linux* "~/workspace")
(setq *my-custom-home-dir* "")
(defun my/set-custom-home-dir()
    (if (eq system-type 'windows-nt)
	(setq *my-custom-home-dir* *my-custom-home-dir-windows*)
        (setq *my-custom-home-dir* *my-custom-home-dir-linux*)))
(my/set-custom-home-dir)
(setq *my-repos-dir* (concat *my-custom-home-dir* "/repos"))
(setq *my-notes-dir* (concat *my-repos-dir* "/local/notes"))
(setq *my-lists-dir* (concat *my-repos-dir* "/local/lists"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; functions
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun /gh ()
  (interactive)
  (dired (concat *my-repos-dir* "/github/neffercarrillo")))

(defun /l ()
  (interactive)
  (dired *my-lists-dir*))

(defun /n ()
  (interactive)
  (dired *my-notes-dir*))

(defun create-org-file-with-timestamp ()
  "Create a new org file with the current date and time in the filename, in ISO format without spaces or colons, and switch to the new buffer."
  (interactive)
  (let* ((current-time (format-time-string "%Y-%m-%dT%H-%M-%S"))
         (filename (concat current-time ".org"))
         (filepath (concat *my-notes-dir* "/" filename)))
    (find-file filepath) ;; Open or create the new file and switch to it
    (insert "#+title: " "\n" "#+author: Neffer Carrillo" "\n" "#+date: " current-time "\n" "#+filetags: "  "\n\n"))) ;; Insert the title and stay in the new bufferx

(defun nn ()
  (interactive)
  (create-org-file-with-timestamp))

(defun cb()
  (interactive)
  (insert "#+name: \n#+begin_src\n\n\n#+end_src"))

(defun ee()
  (interactive)
  (find-file "~/.emacs"))

(defun eb()
  (interactive)
  (find-file "~/.bashrc"))
  
(defun my/reload-dot-emacs()
  (interactive)
  (load-file "~/.emacs"))

(defun my/templates/date/today-short()
  "Insert string for today's date formatted in ISO standard format."
  (interactive)                 
  (insert (format-time-string "%Y-%m-%d")))

(defun my/templates/date/today-long()
  "Insert string for today's date including day of the week."
  (interactive)                 
  (insert (format-time-string "%A, %B %d, %Y")))

(defun my/goto-dir(dir)
  (dired dir))

(defun my/goto-repos()
  (interactive)
  (my/goto-dir my/repos-dir))

(defun my/goto-home()
  (interactive)
  (my/goto-dir (my/get-user-root-dir)))

(defun new-note()
  (find-file (concat *my-notes-dir* "/" (format-time-string "%Y-%m-%d_%H-%M-%S") ".org")))

(defun new-info()
  (interactive)
  (new-note)
  (insert "* {{TITLE HERE}} :info:"))

(defun new-howto()
  (interactive)
  (new-note)
  (insert "* {{TITLE HERE}} :howto: \n** Steps\n\n** References\n\n** Notes\n\n"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; keybindings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(define-key key-translation-map (kbd "ESC") (kbd "C-g"))                        ;; use escape instead of C-g
(global-set-key (kbd "C-S-l") 'my/today-long)
(global-set-key (kbd "C-S-k") 'my/today-short)
(global-set-key (kbd "C-c t") 'my/get-todo-file)
(global-set-key (kbd "C-S-i") 'new-info)                                        ;; create a new info note
(global-set-key (kbd "C-S-h") 'new-howto)                                       ;; create a new howto note


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; misc
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(cua-mode t)                                                                    ;; enable copy-paste via "usual" commands
(setq inhibit-startup-message t)                                                ;; no startup message
(setq make-backup-files nil)                                                    ;; disable backup files
(setq auto-save-default nil)                                                    ;; disable auto save
(setq debug-on-error t)                                                         ;; debug messages on
(setq-default indent-tabs-mode nil)                                             ;; don't use tabs
(setq-default tab-always-indent 'complete)                                      ;; make tab key do indent first then completion.
(setq initial-frame-alist '((fullscreen . maximized)))                          ;; maximize screen on start
(setq column-number-mode t)                                                     ;; show column numbers
(display-battery-mode)                                                          ;; show battery percentage
(setq confirm-nonexistent-file-or-buffer nil)                                   ;; turn off confirmation of new buffer/file
(if (eq system-type 'windows-nt)
  (setq explicit-shell-file-name "C:/Program Files/Git/bin/bash.exe")
  (setq explicit-shell-file-name "/bin/bash"))                                  ;; set default shell
(tool-bar-mode -1)                                                              ;; disable toolbar at the top of buffers

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; packages
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; dired
(setq dired-listing-switches "-la --group-directories-first")

;; edif
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;; electric-pair-mode
(electric-pair-mode t)

;; hi-lock-mode
(global-hi-lock-mode 1)

;; ido mode
(ido-mode t)
(setq ido-use-virtual-buffers t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)
;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
(defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)

;; show-paren mode
(show-paren-mode 1)                         ;; highlight matching parens
(setq show-paren-style 'parenthesis)

;; vc-mode
(setq vc-follow-symlinks t)

;; set word wrapping for all buffers w/ global-visual-line-mode
(global-visual-line-mode t)

;; TODO: check what this does.
;; (wrap-region-global-mode t)

;; fix backspace issue
(normal-erase-is-backspace-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tsdh-dark))
 '(custom-safe-themes
   '("a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" default))
 '(org-agenda-files nil)
 '(package-selected-packages '(markdown-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
