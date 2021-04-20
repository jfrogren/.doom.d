;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;;; ~/.config/doom/config.el -*- lexical-binding: t; -*-
;;;
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;; (setenv "PKG_CONFIG_PATH" (concat (shell-command-to-string "printf %s \"$(brew --prefix libffi)\"") "/lib/pkgconfig/"))


(add-to-list 'default-frame-alist '(top . 12))
(add-to-list 'default-frame-alist '(left . 12))
(add-to-list 'default-frame-alist '(width . 148))
(add-to-list 'default-frame-alist '(height . 47))
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(setq frame-resize-pixelwise t
      ns-use-proxy-icon nil)

(setq user-full-name "Joakim Frögren"
      user-mail-address "joakim@frogren.se")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 13 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:


;;--ui-------------------------------------------------------------------------

(setq doom-font (font-spec :family "JetBrains Mono" :size 13)
      doom-big-font (font-spec :family "JetBrains Mono" :size 16)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 12))

(load-theme 'doom-nord-light t)
(custom-theme-set-faces! 'doom-nord-light
  '(default :background nil)
  '(hl-line :background "#f0eee4")
  '(nav-flash-face :foreground nil :background "#e7e7e7" :extend t)
  '(header-line :background "#e7e7e7")
  '(font-lock-comment-face :foreground "#9099ab")
  '(font-lock-function-name-face :foreground "#282a2e" :weight bold)
  '(font-lock-builtin-face :foreground "#282a2e" :weight bold)
  '(font-lock-type-face :foreground "#282a2e" :weight bold)
  '(font-lock-keyword-face :foreground "#282a2e" :weight bold)
  '(git-gutter:deleted :foreground "#bf616a")
  '(org-footnote :foreground "#9099ab")
  '(org-verbatim :foreground "#444")
  '(org-journal-calendar-entry-face :background "#9099ab" :foreground "#f0eee4")
  '(markdown-pre-face :foreground "#444")
  '(markdown-inline-code-face :background nil :inherit 'markdown-pre-face)
  '(markdown-link-face :foreground "#444" :underline (:color "#444"))
  '(mu4e-highlight-face :foreground "#444" :weight bold)
  '(flycheck-error :foreground "#f0eee4" :background "#bf616a" :underline nil)
  '(flycheck-error-overlay :background "#f2dfe1" :underline nil)
  '(flycheck-warning :background "#f2dfe1" :underline nil)
  '(flyspell-duplicate :background nil :underline nil)
  '(flyspell-incorrect :background "#f2dfe1" :underline nil))
;; (require 'doom-themes)
;;

;; Global settings (defaults)
;; (load-theme 'doom-plain t)
;; (custom-theme-set-faces! 'doom-plain
;;   '(default :background nil)
;;   '(hl-line :background "#f0eee4")
;;   '(nav-flash-face :foreground nil :background "#e7e7e7" :extend t)
;;   '(header-line :background "#e7e7e7")
;;   '(font-lock-comment-face :foreground "#9099ab")
;;   '(font-lock-function-name-face :foreground "#282a2e" :weight bold)
;;   '(font-lock-builtin-face :foreground "#282a2e" :weight bold)
;;   '(font-lock-type-face :foreground "#282a2e" :weight bold)
;;   '(font-lock-keyword-face :foreground "#282a2e" :weight bold)
;;   '(git-gutter:deleted :foreground "#bf616a")
;;   '(org-footnote :foreground "#9099ab")
;;   '(org-verbatim :foreground "#444")
;;   '(org-journal-calendar-entry-face :background "#9099ab" :foreground "#f0eee4")
;;   '(markdown-pre-face :foreground "#444")
;;   '(markdown-inline-code-face :background nil :inherit 'markdown-pre-face)
;;   '(markdown-link-face :foreground "#444" :underline (:color "#444"))
;;   '(mu4e-highlight-face :foreground "#444" :weight bold)
;;   '(flycheck-error :foreground "#f0eee4" :background "#bf616a" :underline nil)
;;   '(flycheck-error-overlay :background "#f2dfe1" :underline nil)
;;   '(flycheck-warning :background "#f2dfe1" :underline nil)
;;   '(flyspell-duplicate :background nil :underline nil)
;;   '(flyspell-incorrect :background "#f2dfe1" :underline nil))i

;;-- Websters 1923 dictionary-----------------------------------------------------

(load! "~/.emacs.d/sdcv-mode.el")

;;--------------------------------------------------------------------------------

;; Code to be able to write 'snabel-a' using the right 'Alt' key

(setq ns-right-alternate-modifier 'none)


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;;-------------------------------------------------------------------------------------
;; ispell - hunspell
;;-------------------------------------------------------------------------------------
(setq-default ispell-program-name "/usr/local/bin/hunspell")
  (setq ispell-really-hunspell t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (poly-R pdf-tools pandoc-mode pandoc lua-mode exec-path-from-shell ewal-doom-themes ess))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;------------------------------------------------------------------------------------
;;  org
;;------------------------------------------------------------------------------------
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
 (setq org-directory "~/org/zettelkasten")

;;------------------------------------------------------------------------------------
;;  pdf-tools
;;------------------------------------------------------------------------------------
(use-package! pdf-tools
  :load-path "site-lisp/pdf-tools/lisp"
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install :no-query)
  (setq-default pdf-view-display-size 'fit-page)
  (setq pdf-annot-activate-created-annotations t)
  (setq pdf-view-resize-factor 1.1)
  (setq pdf-view-use-unicode-ligther nil))

;;-------------------------------------------------------------------------------------
;;  deft
;;-------------------------------------------------------------------------------------
(setq deft-directory "/Users/joafr/org/zettelkasten/"
      deft-use-filename-as-title nil)

;;-------------------------------------------------------------------------------------
;;  ivy-bibtex
;;-------------------------------------------------------------------------------------
;; (autoload 'ivy-bibtex "ivy-bibtex" "" t)
;; ivy-bibtex requires ivy's `ivy--regex-ignore-order` regex builder, which
;; ignores the order of regexp tokens when searching for matching candidates.
;; Add something like this to your init file:
(after! ivy-bibtex
  :config
  (setq ivy-re-builders-alist
      '((ivy-bibtex . ivy--regex-ignore-order)
        (t . ivy--regex-plus)))
  (setq bibtex-completion-bibliography "/Users/joafr/Documents/bibfiles/library.bib"
      bibtex-completion-library-path "/Users/joafr/Documents/bibpdfs"
      bibtex-completion-notes-path "/Users/joafr/org/zettelkasten/"
      bibtex-completion-notes-template-multiple-files ""))

(use-package! ivy-hydra
  :demand t)

;;;;;;;;;;UGLY CODE, SHOULD BE PLACED ELSEWHERE BUT DO NOT DARE TO EDIT NOW;;;;;;;;;;
(after! org
  :config
  (setq org-directory "/Users/joafr/org/zettelkasten/"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;------------------------------------------------------------------------------------
;;  org-ref
;;------------------------------------------------------------------------------------
(use-package! org-ref
    :after org
    :commands
    (org-ref-cite-hydra/body
     org-ref-bibtex-hydra/body)
    :init
    (let ((cache-dir (concat doom-cache-dir "org-ref")))
    (unless (file-exists-p cache-dir)
      (make-directory cache-dir t))
    (setq orhc-bibtex-cache-file (concat cache-dir "/orhc-bibtex-cache")))
    :config
    (setq
         org-ref-completion-library 'org-ref-ivy-cite
         org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-helm-bibtex
         org-ref-default-bibliography (list "/Users/joafr/Documents/bibfiles/library.bib")
         org-ref-bibliography-notes "/Users/joafr/org/zettelkasten/"
         org-ref-note-title-format "* TODO %y - %t\n :PROPERTIES:\n  :Custom_ID: %k\n  :NOTER_DOCUMENT: %F\n :ROAM_KEY: cite:%k\n  :AUTHOR: %9a\n  :JOURNAL: %j\n  :YEAR: %y\n  :VOLUME: %v\n  :PAGES: %p\n  :DOI: %D\n  :URL: %U\n :END:\n\n"
         org-ref-notes-directory "/Users/joafr/org/zettelkasten/"
         org-ref-notes-function 'orb-edit-notes
    ))

;;--------------------------------------------------------------------------------------
;;  org-roam
;;--------------------------------------------------------------------------------------
;;(after! org-roam
;;  :hook (org-load . org-roam-mode)
;;  :commands (org-roam-buffer-toggle-display
;;             org-roam-find-file
;;             org-roam-graph
;;             org-roam-insert
;;             org-roam-switch-to-buffer
;;             org-roam-dailies-date
;;             org-roam-dailies-today
;;             org-roam-dailies-tomorrow
;;             org-roam-dailies-yesterday)
;;  :preface
  ;; Set this to nil so we can later detect whether the user has set a custom
  ;; directory for it, and default to `org-directory' if they haven't.
;;  (defvar org-roam-directory nil)
;;  :init
;;  :config
;;  (setq org-roam-directory (expand-file-name (or org-roam-directory "roam")
;;                                             org-directory)
;;        org-roam-verbose nil  ; https://youtu.be/fn4jIlFwuLU
;;        org-roam-buffer-no-delete-other-windows t ; make org-roam buffer sticky
;;        org-roam-completion-system 'default
;;)

  ;; Normally, the org-roam buffer doesn't open until you explicitly call
  ;; `org-roam'. If `+org-roam-open-buffer-on-find-file' is non-nil, the
  ;; org-roam buffer will be opened for you when you use `org-roam-find-file'
  ;; (but not `find-file', to limit the scope of this behavior).
;;  (add-hook 'find-file-hook
;;    (defun +org-roam-open-buffer-maybe-h ()
;;      (and +org-roam-open-buffer-on-find-file
;;           (memq 'org-roam-buffer--update-maybe post-command-hook)
;;           (not (window-parameter nil 'window-side)) ; don't proc for popups
;;           (not (eq 'visible (org-roam-buffer--visibility)))
;;           (with-current-buffer (window-buffer)
;;             (org-roam-buffer--get-create)))))

  ;; Hide the mode line in the org-roam buffer, since it serves no purpose. This
  ;; makes it easier to distinguish among other org buffers.
;;  (add-hook 'org-roam-buffer-prepare-hook #'hide-mode-line-mode))


;; Since the org module lazy loads org-protocol (waits until an org URL is
;; detected), we can safely chain `org-roam-protocol' to it.
;; (use-package org-roam-protocol
;;  :after org-protocol)

;;(use-package company-org-roam
;;  :after org-roam
;;  :config
;;  (set-company-backend! 'org-mode '(company-org-roam company-yasnippet company-dabbrev)))
;;(use-package! org-roam
;;  :config
(after! org-roam
  :config
  (setq org-roam-directory "/Users/joafr/org/zettelkasten/"))

(use-package! org-roam-bibtex
  :after org-roam
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :config
  (require 'org-ref)
  (setq org-roam-bibtex-preformat-keywords
      '("citekey" "title" "url" "file" "author-or-editor" "keywords"))
  (setq orb-templates
        '(("r" "ref" plain (function org-roam-capture--get-point)
           ""
           :file-name "${citekey}"
           :head "#+TITLE: ${citekey}: ${title}\n#+ROAM_KEY: ${ref}

- tags ::
- keywords ::

\n* ${citekey}: ${title}\n  :PROPERTIES:\n  :Custom_ID: ${citekey}\n  :URL: \n  :AUTHOR: ${author}\n  :NOTER_DOCUMENT: ${file}\n  :NOTER_PAGE: \n  :END:\n\n"

           :unnarrowed t))))

;;----------------------------------------------------------------------------------------
;;  org-noter
;;-----------------------------------------------------------------------------------------
(use-package! org-noter
  :after org
  :config
  (setq
   ;; The WM can handle splits - var tidigare "other-frame"
   org-noter-notes-window-location 'horizontal-split
   ;; Please stop opening frames
   org-noter-always-create-frame nil
   ;; I want to see the whole file
   org-noter-hide-other nil
   ;; Everything is relative to the main notes file
   org-noter-notes-search-path (list "/Users/joafr/org/zettelkasten/")
)
   )

;;-----------------------------------------------------------------------------------------
;;  org-capture
;;------------------------------------------------------------------------------------------
;; Actually start using templates
(after! org-capture
  ;; Firefox and Chrome
  (add-to-list 'org-capture-templates
               '("P" "Protocol" entry ; key, name, type
                 (file+headline +org-capture-notes-file "Inbox") ; target
                 "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?"
                 :prepend t ; properties
                 :kill-buffer t))
  (add-to-list 'org-capture-templates
               '("L" "Protocol Link" entry
                 (file+headline +org-capture-notes-file "Inbox")
                 "* %? [[%:link][%(transform-square-brackets-to-round-ones \"%:description\")]]\n"
                 :prepend t
                 :kill-buffer t))
)
