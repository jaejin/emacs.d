(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'load-path "/Users/1001265/.emacs.d/elpa/ggtags-20150325.2025")
(add-to-list 'load-path "/usr/local/Cellar/erlang/17.4.1/lib/erlang/lib/tools-2.7.1/emacs")
(add-to-list 'custom-theme-load-path "/Users/1001265/.emacs.d/elpa/color-theme-solarized-20150619.1734")

(setq exec-path (cons "/usr/local/bin" exec-path))
(setq exec-path (cons "/opt/local/bin" exec-path))

(load-theme 'solarized t)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; 프레임에 따라서 폰트 적용이 필요해서 이렇게 했음.
(defun my-frame-config (frame)
  "Custom behaviours for new frames."
  (with-selected-frame frame
    (when (display-graphic-p)
      (let ((fontset "fontset-default"))
        (set-fontset-font fontset 'hangul
                          '("NanumGothicOTF" . "unicode-bmp"))
        (set-face-attribute 'default nil
                            :font fontset
                            :height 180)))))

;; run now
(my-frame-config (selected-frame))
;; and later
(add-hook 'after-make-frame-functions 'my-frame-config)


;; erlang

(add-to-list 'load-path "/Users/1001265/.emacs.d/distel/elisp")

(setq erlang-man-root-dir "/usr/local/Cellar/erlang/17.4.1/lib/erlang")
(setq exec-path (cons "/usr/local/Cellar/erlang/17.4.1/lib/erlang/bin" exec-path))
(require 'erlang-start)
(require 'erlang-eunit)
(require 'erlang-flymake)
(add-hook 'erlang-mode-hook
             (lambda ()
            ;; when starting an Erlang shell in Emacs, the node name
            ;; by default should be "emacs"
            (setq inferior-erlang-machine-options '("-sname" "emacs"))
            ;; add Erlang functions to an imenu menu
            (imenu-add-to-menubar "imenu")))

(require 'distel)
(distel-setup)


;; erlang

;; haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(require 'haskell-interactive-mode)
;;(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))
(setenv "PATH" (concat (getenv "PATH") ":/Applications/ghc-7.8.4.app/Contents/bin"))
(setq exec-path (append exec-path '("/Applications/ghc-7.8.4.app/Contents/bin")))

;; haskell


;; python
;; prerequisite : M-x package-install anaconda-mode

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'eldoc-mode)



;; python
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(frame-background-mode (quote dark)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
