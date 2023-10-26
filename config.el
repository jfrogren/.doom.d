;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
 (setq user-full-name "Joakim Frögren"
       user-mail-address "joakim@frogren.se")

(add-to-list 'default-frame-alist '(top . 12))
(add-to-list 'default-frame-alist '(left . 12))
(add-to-list 'default-frame-alist '(width . 148))
(add-to-list 'default-frame-alist '(height . 47))
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))


;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;; (setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))

(setq doom-font (font-spec :family "JetBrains Mono" :size 13)
      doom-big-font (font-spec :family "JetBrains Mono" :size 16)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 12))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)

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
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Code to be able to write 'snabel-a' using the right 'Alt' key
(setq ns-right-alternate-modifier 'none)

;;--------------------------------------------------------------------------
;; pdf-tools
;;--------------------------------------------------------------------------
(use-package! pdf-tools
  :load-path "site-lisp/pdf-tools/lisp"
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install :no-query)
  (setq-default pdf-view-display-size 'fit-page)
  (setq pdf-annot-activate-created-annotations t)
  (setq pdf-view-resize-factor 1.1)
  (setq pdf-view-use-unicode-ligther nil)
  )
;;--------------------------------------------------------------------------
;;  ivy-bibtex
;;--------------------------------------------------------------------------
(autoload 'ivy-bibtex "ivy-bibtex" "" t)
;; ivy-bibtex requires ivy's `ivy--regex-ignore-order` regex builder, which
;; ignores the order of regexp tokens when searching for matching candidates.
;; Add something like this to your init file:
(setq ivy-re-builders-alist
      '((ivy-bibtex . ivy--regex-ignore-order)
        (t . ivy--regex-plus)))
(setq bibtex-completion-bibliography "/Users/joafr/Documents/bibfiles/library.bib"
      bibtex-completion-library-path "/Users/joafr/Documents/bibpdfs"
      bibtex-completion-notes-path "/Users/joafr/Documents/bibnotes"
      bibtex-completion-notes-extension ".md"
      bibtex-completion-find-additional-pdfs t
      bibtex-completion-notes-template-multiple-files "Notes on ${author-or-editor} (${year}) - ${title}"
      bibtex-completion-notes-template-one-file "# Notes on ${author-or-editor} (${year}): ${title}")
(delete-file "~/Library/Colors/Emacs.clr")

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

;;---------------------------------------------------------------------------
;; easy-hugo (2023-10-20)
;;---------------------------------------------------------------------------
 (use-package! easy-hugo
 :init
 (setq easy-hugo-basedir "~/Documents/hemsidor/joakim/")
 (setq easy-hugo-postdir "content/posts")
 (setq easy-hugo-url "https://frogren.se")
 (setq easy-hugo-sshdomain "~/Dokument/hemsidor/joakim")
 (setq easy-hugo-root "~/Dokument/hemsidor/joakim/"); (setq easy-hugo-previewtime "300")
 :bind ("C-c C-e" . easy-hugo))
