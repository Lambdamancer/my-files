;; ================================
;;|| Here is appearance settings. ||
;; ================================

(add-to-list 'default-frame-alist
             '(font . "terminus-14"))

(set-frame-parameter (selected-frame) 'alpha '(85 50))
(add-to-list 'default-frame-alist '(alpha 85 50))

(load-theme  'monokai t)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(defun my-nov-font-setup ()
  (face-remap-add-relative 'variable-pitch :family "Liberation Serif"
                                           :height 1.0))
(add-hook 'nov-mode-hook 'my-nov-font-setup)
