;;; $doomdir/config.el -*- lexical-binding: t; -*-

;; place your private configuration here! remember, you do not need to run 'doom
;; sync' after modifying this file!


;; some functionality uses this to identify you, e.g. gpg configuration, email
;; clients, file templates and snippets. it is optional.
;; (setq user-full-name "john doe"
;;       user-mail-address "john@doe.com")

;; doom exposes five (optional) variables for controlling fonts in doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; see 'c-h v doom-font' for documentation and more examples of what they
;; accept. for example:
;;
;;(setq doom-font (font-spec :family "fira code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "fira sans" :size 13))
;;
;; if you or emacs can't find your font, use 'm-x describe-font' to look them
;; up, `m-x eval-region' to execute elisp code, and 'm-x doom/reload-font' to
;; refresh your font settings. if emacs still can't find your font, it likely
;; wasn't installed correctly. font issues are rarely doom issues!

;; there are two ways to load a theme. both assume the theme is installed and
;; available. you can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. this is the default:
;; (setq doom-theme 'doom-one)

;; this determines the style of line numbers in effect. if set to `nil', line
;; numbers are disabled. for relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type t)

;; if you use `org' and don't want your org files in the default location below,
;; change `org-directory'. it must be set before org loads!
;; (setq org-directory "~/org/")


;; whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise doom's defaults may override your settings. e.g.
;;
;;   (after! package
;;     (setq x y))
;;
;; the exceptions to this rule:
;;
;;   - setting file/directory variables (like `org-directory')
;;   - setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'c-h v variable' to look up their documentation).
;;   - setting doom variables (which start with 'doom-' or '+').
;;
;; here are some additional functions/macros that will help you configure doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; to get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'k' (non-evil users must press 'c-c c k').
;; this will open documentation for it, including demos of how they are used.
;; alternatively, use `c-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; you can also try 'gd' (or 'c-c c d') to jump to their definition and see how
;; they are implemented.


;; ===============================================================
;;
;;                      Universal Configuration
;;
;; ===============================================================

(setq doom-theme 'doom-one)                 ;; set the theme
(setq display-line-numbers-type t)          ;; set the line number
(setq org-directory "~/org/")               ;; set the org directory

;; --------------------
;; reset the escape key
;; --------------------
(use-package! key-chord
  :after evil
  :config
  (setq key-chord-two-keys-delay 0.1) ;; jj must be completed within 0.1 s
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (key-chord-define evil-visual-state-map "jj" 'evil-normal-state))


;; ===================================================================
;;
;;                       Mac OS Configuration
;;
;; ===================================================================
(when (eq system-type 'darwin)
  ;; -------------------------
  ;; mac os keyboard setting
  ;; -------------------------
  (setq doom-font (font-spec :family "monaco" :size 13))  ;; set the font
  (setq mac-right-option-modifier 'meta)                  ;; map the key
  (setq mac-left-option-modifier 'none)

  ;; ----------------------------------------------------------
  ;; org-agenda configuration only on mac (daily usage machine)
  ;; ----------------------------------------------------------
  (after! org
    ;; list where to find the org agenda
    (setq org-agenda-files
          '("~/org/inbox.org"
            "~/org/agenda.org"
            "~/org/study/toefl/vocab.org"))

    ;; map the inactive timestamp
    (with-eval-after-load 'org
      (define-key org-mode-map (kbd "C-c t") #'org-timestamp-inactive))

  )
)
