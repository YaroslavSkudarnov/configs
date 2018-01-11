; path with needed-to-be-preloaded libs
(add-to-list 'load-path "~/.emacs.d/libs/")

(require 'highlight-parentheses)
(require 'package)
(require 'jinja2-mode)

; some more useful remapping
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-o") 'find-file)
(global-set-key (kbd "C-r") 'query-replace)
(global-set-key (kbd "C-f") 'search-forward)
(global-set-key (kbd "C-M-f") 'search-backward)
(global-set-key (kbd "C-M-<next>") 'next-buffer)
(global-set-key (kbd "C-M-<prior>") 'previous-buffer)
(global-set-key (kbd "<C-end>") 'end-of-buffer)
(global-set-key (kbd "<C-home>") 'beginning-of-buffer)
(global-set-key (kbd "RET") 'electric-indent-just-newline)
(global-set-key (kbd "C-q") 'kill-this-buffer)
(global-set-key (kbd "C-d") 'show-file-name)
(global-set-key (kbd "M-/") 'comment-dwim)
(global-set-key (kbd "C-j") 'dumb-jump-go)

; change place for backups
(setq backup-directory-alist `(("." . "~/.emacs_backups")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs_backups/" t)))

; enables parentheses highlighting
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(package-initialize)

; normal keyboard shortcuts
(cua-mode 1)
; line numbers by default on
(global-linum-mode 1)
(setq linum-format "%d ")
; display time in mode line
(display-time-mode 1)
(setq display-time-default-load-average nil)
; autosave sessions
(desktop-save-mode 1)
; display column in mode line
(column-number-mode 1)
; turn off buttons in GUI
(tool-bar-mode -1)
; jump to definition
(dumb-jump-mode 1)
; highlight words
(global-hi-lock-mode 1) ;;; M-s h . — highlight symbol at cursor, M-s h u [RET] — unhighlight
;cmake-mode
(setq load-path (cons (expand-file-name "/dir/with/cmake-mode") load-path))
(require 'cmake-mode)

; add showing filename
(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name))
;  (kill-new (file-truename buffer-file-name))
)

; Disables logging
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

; Kills *Completions* buffer when completion is finished
(add-hook 'minibuffer-exit-hook 
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
            (kill-buffer buffer)))))

; bridges emacs' copy/paste and system's copy/paste
(load-file "~/.emacs.d/xclip.el")

(setq-default indent-tabs-mode nil)
