;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;; ------------------------------------------------------------------------
;; @ load-path

;; load-pathの追加関数
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))


(setq initial-scratch-message "")

(set-frame-parameter(selected-frame) 'alpha '(85 50))


;; load-pathに追加するフォルダ
;; 2つ以上フォルダを指定する場合の引数 => (add-to-load-path "elisp" "xxx" "xxx")
(add-to-list 'load-path "~/.emacs.d/elisp")

;; 行番号表示
(if (not window-system)
(global-linum-mode t)
(set-face-attribute 'linum nil
                    :foreground "#800"
                    :height 0.9)
)

;;tramp
(require 'tramp)
(setq tramp-default-method "ssh")

;; バックアップファイルを作らない
(setq backup-inhibited t)

;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;; 対応する括弧をハイライトする
(show-paren-mode 1)

;; ウィンドウに収まらない時だけ括弧内を光らせる
(setq show-paren-style 'mixed)

;;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;; カーソル位置の行数をモードライン行に表示する
(line-number-mode 1)

;; 予約語を色分けする
(global-font-lock-mode t)

;; bufferの最後でカーソルを動かそうとしても音をならなくする
(defun next-line (arg)
  (interactive "p")
  (condition-case nil
      (line-move arg)
    (end-of-buffer)))

;; エラー音をならなくする
(setq ring-bell-function 'ignore)

;; ocamlについて
;;(load "~/tuareg-2.0.7/tuareg-site-file.el")

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; coffee-modeを読み込む
(require 'coffee-mode)
;; coffee scriptファイルを開いたとき、coffee-modeをメインモードにする
(add-to-list 'auto-mode-alist '("\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
;; 保存したとき、拡張子以外同名のjsバッファをリロードする
(defun revert-compiled-coffee ()
  (interactive)
  (with-current-buffer
      (concat (file-name-sans-extension (buffer-name (current-buffer))) ".js")
    (revert-buffer nil t)))
(add-hook 'coffee-mode-hook
	  (lambda ()
	    (add-hook 'after-save-hook 'revert-compiled-coffee nil t)))

;;php用
;;(autoload 'php-mode "php-mode")
;;(setq auto-mode-alist
;;      (cons '("\\.php\\'" . php-mode) auto-mode-alist))
;;(setq php-mode-force-pear t)
;;(add-hook 'php-mode-user-hook
;;	  '(lambda ()
;;	     (setq php-manual-path "/usr/local/share/")
;;(setq php-manual-url "http://www.phppro.jp/phpmanual/")))

;;php用(更新)
(defun my-setup-php ()
  ;; enable web mode
  (web-mode)

  ;; make these variables local
  (make-local-variable 'web-mode-code-indent-offset)
  (make-local-variable 'web-mode-markup-indent-offset)
  (make-local-variable 'web-mode-css-indent-offset)

  ;; set indentation, can set different indentation level for different code type
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-markup-indent-offset 2))

(add-to-list 'auto-mode-alist '("\\.php$" . my-setup-php))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.ctp\\'"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; web-modeの設定
(defun web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-engines-alist
	'(("php"    . "\\.ctp\\'"))
	)
    )

(add-hook 'web-mode-hook  'web-mode-hook)

(custom-set-faces
 '(web-mode-doctype-face
   ((t (:foreground "#82AE46"))))
 '(web-mode-html-tag-face
   ((t (:foreground "#E6B422" :weight bold))))
 '(web-mode-html-attr-name-face
   ((t (:foreground "#C97586"))))
 '(web-mode-html-attr-value-face
   ((t (:foreground "#82AE46"))))
 '(web-mode-comment-face
   ((t (:foreground "#D9333F"))))
 '(web-mode-server-comment-face
   ((t (:foreground "#D9333F"))))
 '(web-mode-css-rule-face
   ((t (:foreground "#A0D8EF"))))
 '(web-mode-css-pseudo-class-face
   ((t (:foreground "#FF7F00"))))
 '(web-mode-css-at-rule-face
   ((t (:foreground "#FF7F00"))))
 )

;;システムコール課題用
;;(defun my-indent-style ()
  ;;(setq c-basic-offset 8)
  ;;)
;;(add-hook 'c-mode-hook 'my-indent-style)

;;scala mode
(require 'scala-mode2)

;; OCaml
(require 'tuareg)
;; Add opam emacs directory to the load-path
(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
;; Load merlin-mode
(require 'merlin)
;; Start merlin on ocaml files
(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)
;; Enable auto-complete
(setq merlin-use-auto-complete-mode 'easy)
;; Use opam switch to lookup ocamlmerlin binary
(setq merlin-command 'opam)

(define-key merlin-mode-map (kbd "C-c t") 'merlin-type-enclosing)

;;Projectile
(projectile-global-mode)
;;(setq projectile-completion-system 'helm)
;;(helm-projectile-on)

;;Ruby
(smartparens-global-mode)
(sp-local-pair 'web-mode "<" ">")
(sp-local-pair 'web-mode "<%" "%>")
