(require 'package)

;; System-type definition
(defun system-is-linux()
  (string-equal system-type "gnu/linux"))
(defun system-is-windows()
    (string-equal system-type "windows-nt"))
(defun distro-is-nixos()
    (string-equal system-name "nixos"))

;; Special settings when running in NixOS
(when (distro-is-nixos)
    (load "~/.emacs.d/nixos-conf.el"))

(load "~/.emacs.d/style.el"   )
(load "~/.emacs.d/commons.el" )

;; Open .v files with Proof General's Coq mode
(require 'proof-site "~/.emacs.d/lisp/PG/generic/proof-site")
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("5f27195e3f4b85ac50c1e2fac080f0dd6535440891c54fcfa62cdcefedf56b1b" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
