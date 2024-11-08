;;(setq debug-on-error t)

(fringe-mode '(20 . 20))

(ivy-rich-mode -1)

(setq global-whitespace-mode t)
(setq display-line-numbers-type t)

(add-hook 'emacs-lisp-mode-hook 'rainbow-mode)

(setq evil-normal-state-cursor '("green" box))   ; Normal state
(setq evil-insert-state-cursor '("red" bar))   ; Insert state
(setq evil-visual-state-cursor '("yellow" box))   ; Visual state
(setq evil-replace-state-cursor '("royal blue" box))  ; Replace state
(setq evil-motion-state-cursor '("blue" box))   ; Motion state
(setq evil-emacs-state-cursor '("magenta" box))   ; Emacs state

;;(setq spaceline-evil-emacs '("magenta" box))
;;(set-face-attribute 'spaceline-evil-insert)
;;(set-face-attribute 'spaceline-evil-motion)
;;(set-face-attribute 'spaceline-evil-normal)
;;(set-face-attribute 'spaceline-evil-replace)
;;(set-face-attribute 'spaceline-evil-visual)

(setq make-backup-files nil)

(setq ring-bell-function 'ignore)

(show-paren-mode t)
(setq show-paren-style 'parenthesis)

(setq-default truncate-lines t)

(add-hook 'c-mode-common-hook
          (lambda () (subword-mode t)))
(add-hook 'java-mode-common-hook
          (lambda () (subword-mode t)))

(setq sentence-end-double-space nil)

(whitespace-mode -1)

(setq compile-command "mvn install")

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(delete-selection-mode t)

(setq ediff-window-setup-function #'ediff-setup-windows-plain)

(setq warning-minimum-level :emergency)

(setq compilation-scroll-output t)

(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "b")
                        (lambda () (interactive) (find-alternate-file "..")))))


(setq ediff-split-window-function 'split-window-horizontally)

(defun ediff-copy-A-B-C-to-C ()
  (interactive)
  (ediff-copy-diff ediff-current-difference nil 'C nil
                   (concat
                    (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                    (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))
(defun add-f-to-ediff-mode-map () (define-key ediff-mode-map "f" 'ediff-copy-A-B-C-to-C))
(add-hook 'ediff-keymap-setup-hook 'add-f-to-ediff-mode-map)

(evil-set-initial-state 'Info-mode 'emacs)
(evil-set-initial-state 'grep-mode 'emacs)
(evil-set-initial-state 'java-mode 'emacs)
(evil-set-initial-state 'apropos-mode 'emacs)
(evil-set-initial-state 'eshell-mode 'emacs)
(evil-set-initial-state 'shell-mode 'emacs)
(evil-set-initial-state 'eww-mode 'emacs)
(evil-set-initial-state 'Buffer-menu-mode 'emacs)
(evil-set-initial-state 'help-mode 'emacs)
(evil-set-initial-state 'compilation-mode 'emacs)

(setq eww-search-prefix "https://www.google.com/search?q=")

(setq shr-use-fonts  nil) ; No special fonts
(setq shr-use-colors nil) ; No colors
(setq shr-indentation 2) ; Left-side margin
(setq shr-width 80) ; Fold text

(defhydra hydra-code (:hint nil :color red)

  " 
  Code

  ^LSP^             ^Git^           ^Search^                    ^Project^   ^Diff^            ^Build^
  ^^^^^------------------------------------------------------------------------------------------------
  _!_: Add hook     _g_: status     _1_: dired-do-find-regexp   _c_: root   _E_: buffers      _-_: compile
  _@_: Start        _l_: log        _2_: helm-projectile        _f_: files  _A_: directories  _=_: lsp
  _#_: Remove hook  _L_: log file   _3_: helm-git-grep          ^ ^         _n_: branches     ^ ^
  _$_: Shutdown     _b_: blame      _4_: buffers                ^ ^         _m_: magit-diff   ^ ^
  ^ ^               _B_: region     _5_: grep-in-project        ^ ^         ^ ^               ^ ^
  ^ ^               ^ ^             _6_: grep-in-project2       ^ ^         ^ ^               ^ ^
  ^ ^               ^ ^             _7_: grep-in-project-hist   ^ ^         ^ ^               ^ ^
  ^ ^               ^ ^             ^ ^                         ^ ^         ^ ^               ^ ^
  "

  ("!" (my-add-lsp-hook))
  ("@" (lsp))
  ("#" (my-remove-lsp-hook))
  ("$" (lsp-shutdown-workspace))

  ("g" (my-projectile-magit))
  ("l" (magit-log))
  ("L" (magit-log-buffer-file))
  ("b" (magit-blame))
  ("B" (magit-file-dispatch))

  ("1" my-dired-projectile-search)
  ("2" my-helm-projectile-grep)
  ("3" helm-grep-do-git-grep)
  ("4" swiper-all)
  ("5" my-grep-in-project)
  ("6" my-grep-in-project2)
  ("7" my-grep-in-all-project-history)

  ("c" (project-dired))
  ("f" (counsel-projectile))

  ("E" ediff-buffers)
  ("A" ediff-directories)
  ("n" magit-diff-range)
  ("m" magit-diff)

  ("-" compile)
  ("=" lsp-java-build-project)

  ("q" nil "Quit" :color blue))

(defhydra hydra-emacs (:hint nil :color red)

  "
  Emacs

  ^Folders^        ^Files^             ^Update^            ^Themes^
  ^^^^^^^^------------------------------------------------------------------------------------------
  _a_: emacs       _d_: emacs.org      _h_: cp .emacs.d    _1_: Default        _9_: Neon
  _s_: .emacs.d    _f_: chiaro...el    ^ ^                 _2_: Eclipse        _0_: Console Dark
  ^ ^              _g_: linux.el       ^ ^                 _3_: Console Light  _r_: Red
  ^ ^              ^ ^                 ^ ^                 _4_: Color Change L _b_: Casablanca
  ^ ^              ^ ^                 ^ ^                 _5_: High Contrast  _c_: Color Change D
  ^ ^              ^ ^                 ^ ^                 _6_: Gray           ^ ^
  ^ ^              ^ ^                 ^ ^                 _7_: Low Chroma     ^ ^
  ^ ^              ^ ^                 ^ ^                 _8_: Blue           ^ ^
  "

  ("a" (dired "~/source/emacs"))
  ("s" (dired "~/.emacs.d"))

  ("d" (find-file "~/source/emacs/emacs.org"))
  ("f" (find-file "~/source/emacs/chiaroscuro-theme.el"))
  ("g" (find-file "~/source/emacs/linux.el"))

  ("h" (lambda () (interactive)
         (progn
           (shell-command "cd ~/.emacs.d ; cp -r ~/source/emacs/* .")
           (my-open-and-eval-init-file))))

  ("1" (my-set-theme INDEX-DEFAULT))
  ("2" (my-set-theme INDEX-ECLIPSE))
  ("3" (my-set-theme INDEX-CONSOLE-LIGHT))
  ("4" (my-set-theme INDEX-COLOR-CHANGE-LIGHT))
  ("5" (my-set-theme INDEX-HIGH-CONTRAST))
  ("6" (my-set-theme INDEX-GRAY))
  ("7" (my-set-theme INDEX-LOW-CHROMA))
  ("8" (my-set-theme INDEX-BLUE))
  ("9" (my-set-theme INDEX-NEON))
  ("0" (my-set-theme INDEX-CONSOLE-DARK))
  ("r" (my-set-theme INDEX-RED))
  ("b" (my-set-theme INDEX-CASABLANCA))
  ("c" (my-set-theme INDEX-COLOR-CHANGE-DARK))

  ("q" nil "Quit" :color blue))

(defhydra hydra-file (:hint nil :color red)

  "
  File

  ^File^              ^Lsp^             ^Misc^          ^Modify^           ^Project^
  ^^^^^-------------------------------------------------------------------------------------------------
  _l_: line numbers   _i_: imenu        _C_: focus      _c_: cua           _{_: highlight on
  _w_: whitespace     _T_: treemacs     ^ ^             _o_: overwrite     _}_: highlights off
  _s_: spaces         ^ ^               ^ ^             ^ ^                ^ ^
  _t_: tabs           ^ ^               ^ ^             ^ ^                ^ ^
  "

  ("l" (my-toggle-line-numbers))
  ("w" (my-toggle-whitespace))
  ("s" (my-enable-spaces))
  ("t" (my-enable-tabs))

  ("i" (helm-imenu))
  ("T" (treemacs))

  ("C" (my-toggle-focus-mode))

  ("c" (my-toggle-cua-mode))
  ("o" (overwrite-mode))

  ("{" (hlt-highlight))
  ("}" (hlt-unhighlight-region))

  ("q" nil "Quit" :color blue))

(defhydra hydra-master (:color blue)
  ""
  ("a" hydra-emacs/body "Emacs")
  ("f" hydra-file/body "File")
  ("r" hydra-registers/body "Registers")
  ("c" hydra-code/body "Code")
  ("w" hydra-window/body "Window")
  ("k" hydra-custom/body "Custom")
  ("q" nil "Quit" :color red))

(defhydra hydra-registers (:hint nil :color red)

  "
  Registers

  ^Registers^
  ^^^^^---------------------
  _1_: Point to register
  _2_: Jump to register
  _3_: Copy to register
  _4_: Insert register
  _5_: List
  _6_: Helm
  ^ ^
  "

  ("1" point-to-register)
  ("2" jump-to-register)
  ("3" copy-to-register)
  ("4" insert-register)
  ("5" list-registers)
  ("6" (helm-register))

  ("q" nil "Quit" :color blue))

(defhydra hydra-window (:hint nil :color red)

  "
  Window

  ^Split^         ^Horizontally^      ^Vertically^       ^Menu/Tool-bar^
  ^^^^^^^^-------------------------------------------------------------------
  _1_: right      _3_: shrink         _5_: shrink        _7_: menu-bar
  _2_: below      _4_: enlarge        _6_: enlarge
  "
  ("1" split-window-right)
  ("2" split-window-below)

  ("3" shrink-window-horizontally)
  ("4" enlarge-window-horizontally)

  ("5" shrink-window)
  ("6" enlarge-window)

  ("7" my-toggle-menu-bar-tool-bar)

  ("q" nil "Quit" :color blue))

(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))

(setq ibuffer-formats
      '((mark modified read-only " "
              (name 75 75 :left :elide)
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " " filename-and-process)
        (mark " "
              (name 16 -1)
              " " filename)))

(global-set-key (kbd "M-b") 'ivy-switch-buffer)
(global-set-key (kbd "C-<down>") 'my-scroll-down)
(global-set-key (kbd "C-<escape>") 'evil-mode)
(global-set-key (kbd "C-<next>") 'avy-goto-word-1)
(global-set-key (kbd "C-<prior>") 'avy-goto-char-in-line)
(global-set-key (kbd "C-<tab>") 'dabbrev-completion)
(global-set-key (kbd "C-<up>") 'my-scroll-up)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-@") 'my-increase-font-size)
(global-set-key (kbd "C-M-<left>") 'tab-previous)
(global-set-key (kbd "C-M-<next>") #'(lambda() (interactive) (scroll-left 10)))
(global-set-key (kbd "C-M-<prior>") #'(lambda() (interactive) (scroll-right 10)))
(global-set-key (kbd "C-M-<right>") 'tab-next)
(global-set-key (kbd "C-S-M-<left>") 'drag-stuff-left)
(global-set-key (kbd "C-S-M-<right>") 'drag-stuff-right)
(global-set-key (kbd "C-S-o") 'my-reset-font-size)
(global-set-key (kbd "C-^") 'hydra-master/body)
(global-set-key (kbd "C-`") 'hydra-master/body)
(global-set-key (kbd "C-b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c 1") 'my-add-lsp-hook)
(global-set-key (kbd "C-c 2") 'my-remove-lsp-hook)
(global-set-key (kbd "C-c 3") 'lsp-shutdown-workspace)
(global-set-key (kbd "C-c 4") 'my-next-method)
(global-set-key (kbd "C-c 5") 'my-next-method)
(global-set-key (kbd "C-c L") 'my-magit-log)
(global-set-key (kbd "C-c P") 'google-translate-at-point)
(global-set-key (kbd "C-c R") 'google-translate-query-translate-reverse)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'helm-filtered-bookmarks)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c d") 'my-duplicate-line)
(global-set-key (kbd "C-c e") 'my-backward-copy-word)
(global-set-key (kbd "C-c f") 'my-grep-in-project)
(global-set-key (kbd "C-c g") 'my-grep-in-project2)
(global-set-key (kbd "C-c i") 'my-projectile-ibuffer)
(global-set-key (kbd "C-c j") 'yas-insert-snippet)
(global-set-key (kbd "C-c k l") 'my-select-line)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c m") 'my-agenda-view)
(global-set-key (kbd "C-c n") 'my-new-line)
(global-set-key (kbd "C-c o") 'org-switchb)
(global-set-key (kbd "C-c s") 'org-schedule)
(global-set-key (kbd "C-c t") 'my-find-file-at-point-in-project)
(global-set-key (kbd "C-c u") 'my-yank-line-at-point)
(global-set-key (kbd "C-c v") 'my-projectile-magit)
(global-set-key (kbd "C-c y") 'my-copy-line-at-point)
(global-set-key (kbd "C-k") 'helm-show-kill-ring)
(global-set-key (kbd "C-n") 'helm-mini)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-r") 'helm-swoop)
(global-set-key (kbd "C-t") 'my-grep-backward-copy-word-in-project)
(global-set-key (kbd "C-v") 'helm-all-mark-rings)
(global-set-key (kbd "C-x / c") 'my-class-overview)
(global-set-key (kbd "C-x / f") 'find-lisp-find-dired)
(global-set-key (kbd "C-x / i") 'org-insert-link)
(global-set-key (kbd "C-x / l") 'org-store-link)
(global-set-key (kbd "C-x / m") 'c-mark-function)
(global-set-key (kbd "C-x 5 5") 'magit-blame)
(global-set-key (kbd "C-x 5 6") 'magit-log-buffer-file)
(global-set-key (kbd "C-x 6") 'my-theme-down)
(global-set-key (kbd "C-x C-b") 'ivy-switch-buffer)
(global-set-key (kbd "C-x o") 'helm-projectile-find-file)
(global-set-key (kbd "C-x p") 'helm-projectile-switch-project)
(global-set-key (kbd "C-x q") 'goto-last-change)
(global-set-key (kbd "C-x t") 'my-trim-whitespace)
(global-set-key (kbd "C-x y") 'my-get-filename)
(global-set-key (kbd "C-{") 'my-prev-curly-brace)
(global-set-key (kbd "C-}") 'my-next-curly-brace)
(global-set-key (kbd "C-~") 'avy-goto-char-timer)
(global-set-key (kbd "M-,") 'xref-find-definitions)
(global-set-key (kbd "M-<down>") 'drag-stuff-down)
(global-set-key (kbd "M-<next>") 'my-scroll-down-center)
(global-set-key (kbd "M-<prior>") 'my-scroll-up-center)
(global-set-key (kbd "M-<up>") 'drag-stuff-up)
(global-set-key (kbd "M-[") 'backward-paragraph)
(global-set-key (kbd "M-]") 'forward-paragraph)
(global-set-key (kbd "M-g M-g") 'avy-goto-line)
(global-set-key (kbd "M-m") 'xref-pop-marker-stack)
(global-set-key (kbd "M-n") 'evil-first-non-blank)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-s a") 'swiper-all)
(global-set-key (kbd "S-M-<left>") 'indent-rigidly-left)
(global-set-key (kbd "S-M-<right>") 'indent-rigidly-right)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setq blink-cursor-blinks 0)

;;(setq display-line-numbers-type 'absolute)

(display-time)

(fset 'yes-or-no-p 'y-or-n-p)

(setq confirm-kill-emacs 'y-or-n-p)

(defvar regexp-class ".*class.*")
(defvar regexp-member "public.*;\\|protected.*;\\|private.*;")
(defvar regexp-method "public.*(\\|protected.*(\\|private.*(")

(defun my-agenda-view ()
  (interactive)
  (org-agenda t "a")
  (org-agenda-day-view)
  (delete-other-windows)
  (org-agenda-redo-all))

(defun my-avy-goto-line ()
  (interactive)
  (avy-goto-line)
  (evil-first-non-blank))

(defun my-avy-lightning ()
  "Change default text while avy is active."
  (interactive)

  (unwind-protect
      (progn
        ;; Protected forms: code that may raise an error
        (set-face-attribute 'default                           nil  :foreground text-low )
        (set-face-attribute 'font-lock-bracket-face            nil  :foreground text-low )
        (set-face-attribute 'font-lock-builtin-face            nil  :foreground text-low )
        (set-face-attribute 'font-lock-comment-delimiter-face  nil  :foreground text-low )
        (set-face-attribute 'font-lock-comment-face            nil  :foreground text-low )
        (set-face-attribute 'font-lock-constant-face           nil  :foreground text-low )
        (set-face-attribute 'font-lock-doc-face                nil  :foreground text-low )
        (set-face-attribute 'font-lock-function-call-face      nil  :foreground text-low )
        (set-face-attribute 'font-lock-function-name-face      nil  :foreground text-low )
        (set-face-attribute 'font-lock-keyword-face            nil  :foreground text-low )
        (set-face-attribute 'font-lock-number-face             nil  :foreground text-low )
        (set-face-attribute 'font-lock-preprocessor-face       nil  :foreground text-low )
        (set-face-attribute 'font-lock-string-face             nil  :foreground text-low )
        (set-face-attribute 'font-lock-type-face               nil  :foreground text-low )
        (set-face-attribute 'font-lock-variable-name-face      nil  :foreground text-low )
        (set-face-attribute 'font-lock-variable-use-face       nil  :foreground text-low )
        (set-face-attribute 'font-lock-warning-face            nil  :foreground text-low )

        (avy-goto-char-timer)

        (my-avy-lightning-clean-up)
        )
    ;; Cleanup forms: code that will always be executed
    (my-avy-lightning-clean-up)
    ))

(setq avy-timeout-seconds 0.25)

(defun my-avy-lightning-clean-up ()
  (set-face-attribute 'default                          nil :foreground text-normal      )
  (set-face-attribute 'font-lock-bracket-face           nil :foreground text-highlight-1 )
  (set-face-attribute 'font-lock-builtin-face           nil :foreground text-type        )
  (set-face-attribute 'font-lock-comment-delimiter-face nil :foreground text-lower       )
  (set-face-attribute 'font-lock-comment-face           nil :foreground text-lower       )
  (set-face-attribute 'font-lock-constant-face          nil :foreground text-constant    )
  (set-face-attribute 'font-lock-doc-face               nil :foreground text-lower       )
  (set-face-attribute 'font-lock-function-call-face     nil :foreground text-highlight-1 )
  (set-face-attribute 'font-lock-function-name-face     nil :foreground text-function    )
  (set-face-attribute 'font-lock-keyword-face           nil :foreground text-keyword     )
  (set-face-attribute 'font-lock-number-face            nil :foreground text-highlight-1 )
  (set-face-attribute 'font-lock-preprocessor-face      nil :foreground text-preprocessor)
  (set-face-attribute 'font-lock-string-face            nil :foreground text-low         )
  (set-face-attribute 'font-lock-type-face              nil :foreground text-type        )
  (set-face-attribute 'font-lock-variable-name-face     nil :foreground text-variable    )
  (set-face-attribute 'font-lock-variable-use-face      nil :foreground text-constant    )
  (set-face-attribute 'font-lock-warning-face           nil :foreground text-warning     )
  )

(defun my-backward-copy-word ()
  "Copy the word before point."
  (interactive)
  (subword-mode 0)
  (save-excursion
    (let ((end (progn (right-word) (point)))
          (beg (progn (backward-word) (point))))
      (copy-region-as-kill beg end)))
  (subword-mode t))

(setq bs-attributes-list
      '(("" 1 1 left bs--get-marked-string)
        ("M" 1 1 left bs--get-modified-string)
        ("R" 2 2 left bs--get-readonly-string)
        ("Buffer" bs--get-name-length 10 left bs--get-name)))

(defun my-buffers ()
  "Display buffer list of buffers pointing to files"
  (interactive)
  (bs-show nil)
  (delete-other-windows))

(defun my-buffers-list ()
  "Display list of buffers alphabetically (excluding those with '*')."
  (interactive)
  (let ((buffers (mapcar #'buffer-name (buffer-list))))
    ;; Exclude buffers starting with '*'
    (setq buffers (seq-filter (lambda (buf) (not (string-prefix-p " *" buf))) buffers))
    (setq buffers (seq-filter (lambda (buf) (not (string-prefix-p "*" buf))) buffers))
    ;; Sort the remaining buffers alphabetically
    (setq buffers (sort buffers #'string<))
    (let ((chosen-buffer (completing-read "Select buffer: " buffers)))
      (when chosen-buffer
        (switch-to-buffer chosen-buffer)))))

(defun my-c-defun-name-and-limits (near)
  ;; Return a cons of the name and limits (itself a cons) of the current
  ;; top-level declaration or macro, or nil of there is none.
  ;;
  ;; If `c-defun-tactic' is 'go-outward, we return the name and limits of the
  ;; most tightly enclosing declaration or macro.  Otherwise, we return that
  ;; at the file level.
  (save-restriction
    (widen)
    (if (eq c-defun-tactic 'go-outward)
        (c-save-buffer-state ((paren-state (c-parse-state))
                              (orig-point-min (point-min))
                              (orig-point-max (point-max))
                              lim name limits)
                             (setq lim (c-widen-to-enclosing-decl-scope
                                        paren-state orig-point-min orig-point-max))
                             (and lim (setq lim (1- lim)))
                             (c-while-widening-to-decl-block (not (setq name (c-defun-name-1))) t)
                             (when name
                               (setq file-name (file-name-nondirectory (buffer-file-name)))
                               (setq file-name-concat (concat name ".java"))
                               (if (string= file-name-concat file-name)
                                   (setq name "")
                                 (setq name (concat " " name "() ")))
                               (setq limits (c-declaration-limits-1 near))
                               (cons name limits)
                               ))
      (c-save-buffer-state ((name (c-defun-name))
                            (limits (c-declaration-limits near)))
                           (and name limits (cons name limits)))))
  )

(defun my-c-display-defun-name (&optional arg)
  "Return the name of the current CC mode defun.
With a prefix arg, push the name onto the kill ring too."
  (interactive "P")
  (if (eq major-mode 'java-mode)
      (c-with-string-fences
       (save-restriction
         (widen)
         (c-save-buffer-state ((name-and-limits (my-c-defun-name-and-limits nil))
                               (name (car name-and-limits))
                               (limits (cdr name-and-limits))
                               (point-bol (c-point 'bol)))
                              (when name
                                (when arg (kill-new name))
                                (setq my-custom-mode-line-string name)
                                (or name "")))))
    (setq my-custom-mode-line-string "")))

(add-hook 'post-command-hook 'my-c-display-defun-name)

(defun my-change-cursor-color ()
  "Change cursor color when switching between evil-mode modes."
  (if (eq evil-state 'emacs)
      (progn (set-cursor-color "red")))
  (if (eq evil-state 'normal)
      (progn (set-cursor-color "green")))
  (if (eq evil-state 'insert)
      (progn (set-cursor-color "red")))
  (if (eq evil-state 'visual)
      (progn (set-cursor-color "yellow")))
  (if (eq evil-state 'operator)
      (progn (set-cursor-color "orange")))
  (if (eq evil-state 'replace)
      (progn (set-cursor-color "royal blue")))
  (if (eq evil-state 'motion)
      (progn (set-cursor-color "blue")))
  (if (bound-and-true-p cua-mode)
      (progn (set-cursor-color "dark turquoise"))))

;;(add-hook 'post-command-hook 'my-change-cursor-color)

(defun my-change-line-color ()
  "Change line number color when switching between evil-mode modes."
  (if (eq evil-state 'emacs)
      (set-face-attribute 'hl-line nil :foreground "magenta3"))
  (if (eq evil-state 'insert)
      (set-face-attribute 'hl-line nil :foreground "red3"))
  (if (eq evil-state 'motion)
      (set-face-attribute 'hl-line nil :foreground "blue3"))
  (if (eq evil-state 'normal)
      (set-face-attribute 'hl-line nil :foreground "green3"))
  (if (eq evil-state 'operator)
      (set-face-attribute 'hl-line nil :foreground "gray3"))
  (if (eq evil-state 'replace)
      (set-face-attribute 'hl-line nil :foreground "orange3"))
  (if (eq evil-state 'user)
      (set-face-attribute 'hl-line nil :foreground "black"))
  (if (eq evil-state 'visual)
      (set-face-attribute 'hl-line nil :foreground "yellow3"))
   (if (bound-and-true-p cua-mode)
      (set-face-attribute 'hl-line nil :foreground "dark turquoise")))

(add-hook 'post-command-hook 'my-change-line-color)

(defun my-check-if-branch-is-empty (branch)
  "Check if STR is an empty string. If not, add an @ and spaces to the branch."
  (if (string-empty-p (prin1-to-string branch))
      (branch)
    (concat " @" branch " ")))

(defun my-class-overview ()
  "Parse all classes of a project and print the class overview."
  (interactive)
  (let ((project-root (projectile-project-root)))
    (if project-root
        (let ((file-list (my-class-overview-find-files-in-project project-root "java")))
          (message "my-class-overview() Length of the list: %d" (length file-list))

          (my-class-overview-print-data-in-new-buffer file-list))
      (message "Not in a Projectile project or Projectile is not active."))))

(defun my-class-overview-find-files-in-project (directory extension)
  "List files with a specific extension in all subdirectories of DIRECTORY."
  (let ((file-list '()))
    (dolist (file (directory-files-recursively directory (concat "\\." extension "$")))
      (when (file-regular-p file)
        (push file file-list)))
    (message "my-class-overview-find-files-in-project() Length of the list: %d" (length file-list))
    file-list))

(defun my-class-overview-parse-java-file-for-members (file-path)
  "Parse a Java file to extract member types (fields, methods) with variable names."
  (with-temp-buffer
    (insert-file-contents file-path)
    (goto-char (point-min))
    (let ((result ""))
      (while (re-search-forward "^\\s-*\\b\\(?:private\\|public\\|protected\\)\\b[^;\n]*;" nil t)
        (setq result (concat result (buffer-substring-no-properties
                                     (line-beginning-position)
                                     (line-end-position))
                             "\n")))
      result)))

(defun my-class-overview-print-data-in-new-buffer (file-list)
  "Print DATA in a new buffer."
  (let ((new-buffer (get-buffer-create "*ClassOverview*"))
        (content ""))
    (with-current-buffer new-buffer
      (erase-buffer)
      (cl-loop for element in file-list
               for index from 1
               do
               (setq content (concat content (format "%d: %s\n" index (file-name-sans-extension (file-name-nondirectory element)) (my-class-oveview-get-java-parents element))))
               (dolist (element2 (my-class-oveview-get-java-parents element))
                                        ; Parents
                 (if element2
                     (progn
                       (setq content (concat content (format "--------------------------------------------------------------------------------\n")))
                       (setq content (concat content (format "    %s\n" element2)))
                       ))
                                        ; Members
                 (if (my-class-overview-parse-java-file-for-members element)
                     (progn
                       (setq content (concat content (format "--------------------------------------------------------------------------------\n")))
                       (setq content (concat content (my-class-overview-parse-java-file-for-members element)))
                       ))
                 )
               (setq content (concat content (format "________________________________________________________________________________\n\n")))
               )
      )
    (switch-to-buffer new-buffer)
    (insert content)))

(defun my-class-overview-test ()
  "Test function"
  (interactive)
  (my-class-overview-parse-java-file-for-members "/home/computer/source/lsp_sandbox/src/main/java/org/sandbox/observerpattern/ObserverA.java"))

(defun my-class-oveview-get-java-parents (file-path)
  "Parse a Java file to extract its parent classes and implemented interfaces."
  (with-temp-buffer
    (insert-file-contents file-path)
    (goto-char (point-min))
    (let (parents)
      (while (re-search-forward "\\bextends\\s-+\\(\\(?:[[:alnum:]_$]+\\.\\)*[[:alnum:]_$]+\\)\\b" nil t)
        (setq parents (cons (match-string 1) parents)))
      (goto-char (point-min)) ;; Reset cursor position
      (while (re-search-forward "\\bimplements\\s-+\\(\\(?:[[:alnum:]_$]+\\.\\)*[[:alnum:]_$]+\\)\\b" nil t)
        (setq parents (cons (match-string 1) parents)))
      parents)))

(defun my-company-off ()
  "Company off."
  (progn
    (message "Company off")
    (global-company-mode -1)
    ))

(defun my-company-on ()
  "Company on."
  (progn
    (message "Company on")
    (global-company-mode t)
    ))

(defun my-copy-line-at-point ()
  "Copy line at point."
  (interactive)
  (save-excursion
    (let ((begin (line-beginning-position))
          (end (line-end-position)))
      (copy-region-as-kill begin end)))
  (message "Copied line."))

(defun my-decrease-font-size ()
  (interactive)
  (setq font-size (- font-size 20))
  (set-face-attribute 'default nil :height font-size))

(defun my-delete-all-burly-bookmarks ()
  "Delete all burly bookmarks."
  (interactive)
  (bookmark-bmenu-list)
  (let ((bookmarks (burly-bookmark-names)))
    (when bookmarks
      (dolist (item bookmarks)
        (bookmark-delete item)))))

(defun my-dired-hide-details-mode ()
  "Enable dired-hide-details-mode."
  (dired-omit-mode 1)
  (dired-hide-details-mode 1))

(add-hook 'dired-mode-hook #'my-dired-hide-details-mode)

(defun my-dired-projectile-main-folder ()
  (projectile-dired))

(defun my-dired-projectile-search (regexp search-in-subdirs)
  "Use dired-do-find-regexp to search from project root."
  (interactive "sRegexp: \nP")
  (my-dired-projectile-main-folder)
  (dired-up-directory)
  (message regexp)
  (dired-do-find-regexp regexp)
  (delete-other-windows))

(defun my-disable-themes ()
  "Disable themes."
  (interactive)
  (setq loop-index 0)
  (while (< loop-index number-of-themes)
    (disable-theme (nth loop-index themes-list))
    (setq loop-index (+ loop-index 1))))

(defun my-duplicate-line ()
  "Duplicate line at point."
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

(defun my-enable-spaces ()
  "Enable spaces."
  (progn (message "Enable spaces")
         (setq-default indent-tabs-mode nil)
         ))

(defun my-evil-state ()
  "Return string with current evil-state."
  (setq result "")
  (if (eq evil-state 'emacs)
      (setq result " <E> "))
  (if (eq evil-state 'normal)
      (setq result " <N> "))
  (if (eq evil-state 'insert)
      (setq result " <I> "))
  (if (eq evil-state 'visual)
      (setq result " <V> "))
  (if (eq evil-state 'operator)
      (setq result " <O> "))
  (if (eq evil-state 'replace)
      (setq result " <R> "))
  (if (eq evil-state 'motion)
      (setq result " <M> "))
  (if (bound-and-true-p cua-mode)
      (setq result " <C> "))
  result)

(defun my-find-file-at-point-in-project ()
  "Find file at point in project."
  (interactive)
  (subword-mode 0)
  (save-excursion
    (let ((end (progn (right-word) (point)))
          (beg (progn (backward-word) (point))))
      (copy-region-as-kill beg end)

      (find-file (my-find-file-recursively (projectile-project-root) (concat (current-kill 0) ".java")))))
  (subword-mode t))

(defun my-find-file-recursively (directory filename)
  "Recursively search for FILENAME in DIRECTORY and its subdirectories, ignoring hidden files and directories."
  (let ((files (directory-files directory t))
        (result nil))
    (dolist (file files)
      (let ((file-name (file-name-nondirectory file)))
        (unless (string-prefix-p "." file-name)  ; Ignore hidden files/dirs
          (if (file-directory-p file)
              (when (not (member file-name '("." "..")))
                (setq found (my-find-file-recursively file filename))
                (when found
                  (setq result found)))
            (when (string= file-name filename)
              (setq result file))))))
    result))

;; TODO check if this is redundant
(defun my-get-filename ()
  (interactive)
  (dired-jump)
  (dired-copy-filename-as-kill)
  (kill-this-buffer))

(defun my-goto-class ()
  (interactive)
  (beginning-of-buffer)
  (re-search-forward regexp-class nil t)
  (evil-first-non-blank))

(defun my-goto-member ()
  (interactive)
  (beginning-of-buffer)
  (re-search-forward regexp-member nil t)
  (evil-first-non-blank))

(defun my-grep-backward-copy-word-in-project ()
  "Search for a string using vc-git-grep from the project root."
  (interactive)
  (my-backward-copy-word)
  (let ((search-string (current-kill 0)))
    (setq search-string (replace-regexp-in-string "\\s-+" ".*" search-string))
    (project-dired)
    (vc-git-grep search-string "\*" "\*"))
  (quit-window)
  (switch-to-buffer "*grep*")
  (delete-other-windows)
  (beginning-of-buffer))

;;git grep "search string" $(git rev-list --all)

(defun my-grep-in-all-project-history (search-strings)
  "Search for multiple strings in project history using vc-git-grep and display simplified output."
  (interactive "MEnter search strings (space-separated): ")
  (let* ((search-list (split-string search-strings " " t " "))
         (default-directory (vc-git-root default-directory))
         (grep-command (format "git grep -n -E -i -e %s $(git rev-list --all)"
                               (mapconcat 'shell-quote-argument search-list " -e ")))
         (grep-buffer-name "*Git Grep Results*"))
    (compilation-start grep-command 'grep-mode
                       (lambda (mode-name)
                         (format "Search: %s" mode-name)))
    (with-current-buffer grep-buffer-name
      (while (search-forward-regexp (rx bol (group (1+ digit)) ":" (group (1+ not-newline)) eol) nil t)
        (replace-match (format "%s:%s" (file-name-nondirectory (match-string 2)) (match-string 1)))))))

(defun my-grep-in-project (search-strings)
  "Search for multiple strings using vc-git-grep and display simplified output."
  (interactive "MEnter search strings (space-separated): ")
  (let* ((search-list (split-string search-strings " " t " "))
         (default-directory (vc-git-root default-directory))
         (grep-command (format "git --no-pager grep -n -E -i --all-match -e %s"
                               (mapconcat 'shell-quote-argument search-list " --and -e ")))
         (grep-buffer-name "*Git Grep Results*"))
    (compilation-start grep-command 'grep-mode
                       (lambda (mode-name)
                         (format "Search: %s" mode-name)))
    (with-current-buffer grep-buffer-name
      (while (search-forward-regexp (rx bol (group (1+ digit)) ":" (group (1+ not-newline)) eol) nil t)
        (replace-match (format "%s:%s" (file-name-nondirectory (match-string 2)) (match-string 1)))))))

(defun my-grep-in-project2 (search-strings)
  "Search for multiple strings using vc-git-grep and display simplified output."
  (interactive "MEnter search strings (space-separated): ")
  (let* ((search-list (split-string search-strings " " t " "))
         (default-directory (vc-git-root default-directory))
         (grep-command (format "git --no-pager grep -n -E -i -e %s"
                               (mapconcat 'shell-quote-argument search-list " -e ")))
         (grep-buffer-name "*Git Grep Results*"))
    (compilation-start grep-command 'grep-mode
                       (lambda (mode-name)
                         (format "Search: %s" mode-name)))
    (with-current-buffer grep-buffer-name
      (while (search-forward-regexp (rx bol (group (1+ digit)) ":" (group (1+ not-newline)) eol) nil t)
        (replace-match (format "%s:%s" (file-name-nondirectory (match-string 2)) (match-string 1)))))))

(defun my-helm-projectile-grep ()
  "my-helm-projectile-grep"
  (interactive)
  (helm-projectile-grep))

(defun my-increase-font-size ()
  (interactive)
  (setq font-size (+ font-size 20))
  (set-face-attribute 'default nil :height font-size))

(defun my-insert-string-to-mode-line-and-clipboard ()
  "Prompt for a string and copy it to the clipboard."
  (interactive)
  (let ((user-input (read-string "Search for: ")))
    (setq-default mode-line-format (list " " user-input " " mode-line-format))
    (with-temp-buffer
      (insert user-input)
      (clipboard-kill-region (point-min) (point-max)))))

(defun my-kill-init-buffer ()
  "Kill init buffer."
  (interactive)
  (let ((buffer-name "init.el"))
    (when (get-buffer buffer-name)
      (kill-buffer buffer-name))))

(defun my-log ()
  "Log."
  (interactive)
  ;; TODO Open log file
  (my-log-load-logs)

  ;; TODO Isolate log lines (start state - end state)
  (my-log-isolate-logs 'a-log.log)

  ;; TODO Modify lines / delete lines
  ;; TODO Store modified log in file (make name unique (date / state))
  ;; TODO Compare current log with default/previous log
  ;; TODO Print difference like in a unit test
  )

(defun my-log-isolate-logs (buffer-name)
  "Log."
  (interactive)
  (switch-to-buffer (prin1-to-string buffer-name))
  (beginning-of-buffer)

  )

(defun my-keep-lines-containing (search-string)
  "Search the buffer line by line, keeping only lines that contain SEARCH-STRING and deleting others."
  (interactive "sEnter string to keep lines containing: ")
  (goto-char (point-min))  ; Move to the beginning of the buffer
  (while (not (eobp))      ; While not at the end of the buffer
    (let ((line-start (point)))  ; Remember the start of the line
      (forward-line 1)           ; Move to the start of the next line
      (if (not (save-excursion   ; Check if the line contains the search string
                 (goto-char line-start)
                 (search-forward search-string (line-end-position) t)))
          (delete-region line-start (point)))))  ; Delete the line if it doesn't contain the search string
  (message "Lines not containing '%s' have been deleted." search-string))

(defun my-keep-lines-containing-any (search-strings)
  "Search the buffer line by line, keeping only lines that contain any of the SEARCH-STRINGS and deleting others."
  (interactive "sEnter strings to keep lines containing (separated by commas): ")
  (let* ((strings (split-string search-strings ","))
         (regex (mapconcat 'regexp-quote strings "\\|")))
    (goto-char (point-min))  ; Move to the beginning of the buffer
    (while (not (eobp))      ; While not at the end of the buffer
      (let ((line-start (point)))  ; Remember the start of the line
        (forward-line 1)           ; Move to the start of the next line
        (if (not (save-excursion   ; Check if the line contains any of the search strings
                   (goto-char line-start)
                   (re-search-forward regex (line-end-position) t)))
            (delete-region line-start (point)))))  ; Delete the line if it doesn't contain any of the search strings
    (message "Lines not containing any of '%s' have been deleted." search-strings)))

(defun my-log-load-logs ()
  "Log."
  (interactive)
  (find-file "~/logs/a-log.log")
  (find-file "~/logs/b-log.log")
  )

(defun my-magit-log ()
  (interactive)
  (magit-log-current nil nil nil)
  (delete-other-windows))

(defun my-mark-curly-brace-region ()
  "Mark and select the region between the opening and closing curly braces."
  (interactive)
  (let ((original-point (point)))
    (when (search-backward "{" nil t)
      (let ((start-point (point)))
        (when (search-forward "}" nil t)
          (let ((end-point (point)))
            (transient-mark-mode 1)
            (set-mark start-point)
            (goto-char end-point)
            (message "Region marked and selected between curly braces")))))))

(defun my-message (arg)
  "test"
  (interactive "P")
  (clipboard-kill-ring-save arg))

(defun my-mode-line-format ()
  "Customize the mode line."
  (interactive)
  (setq-default mode-line-format
                (list

                 ;; -:--
                 " " mode-line-mule-info mode-line-client mode-line-modified mode-line-remote " "
                 ;;(propertize " %Z%*%+%& " 'face 'font-lock-constant-face) ;;

                 ;; Java method name
                 ;;'(:eval (propertize my-custom-mode-line-string 'face 'font-lock-delimiter-face))

                 ;; buffer name
                 (propertize " %b " 'face 'font-lock-delimiter-face)

                 ;; git branch
                 ;;'(:eval (when vc-mode (propertize (my-check-if-branch-is-empty (substring vc-mode 5)) 'face 'font-lock-delimiter-face)))

                 ;; evil mode state
                 '(:eval (propertize (my-evil-state) 'face 'font-lock-delimiter-face))

                 ;; position
                 (propertize " (%p,%l,%c) " 'face 'font-lock-delimiter-face)

                 ;; date and time
                 '(:eval (propertize (format-time-string " %d.%m.%H:%M ") 'face 'font-lock-delimiter-face))

                 ;; major mode
                 ;;(propertize " %m " 'face 'font-lock-delimiter-face)

                 "  "
                 mode-line-end-spaces)))

;;(my-mode-line-format)

(defun my-new-line ()
  (interactive)
  (move-end-of-line nil)
  (newline)
  (c-indent-line-or-region))

(defun my-next-curly-brace ()
  (interactive)
  (re-search-forward next-curly-brace-regexp nil t))

(defun my-next-java-method ()
  "Jump to next Java method."
  (interactive)
  (re-search-forward java-function-regexp nil t)
  (end-of-line)
  (recenter))

(defvar java-function-regexp
  (concat
   "^[ \t]*"                                   ;; leading white space
   "\\(public\\|private\\|protected\\|"        ;; some of these 8 keywords
   "abstract\\|final\\|static\\|"
   "synchronized\\|native"
   "\\|override"                               ;; C# support
   "\\|[ \t\n\r]\\)*"                          ;; or whitespace
   "[a-zA-Z0-9_$]+"                            ;; return type
   "[ \t\n\r]*[[]?[]]?"                        ;; (could be array)
   "[ \t\n\r]+"                                ;; whitespace
   "\\([a-zA-Z0-9_$]+\\)"                      ;; the name we want!
   "[ \t\n\r]*"                                ;; optional whitespace
   "("                                         ;; open the param list
   "\\([ \t\n\r]*"                             ;; optional whitespace
   "\\<[a-zA-Z0-9_$]+\\>"                      ;; typename
   "[ \t\n\r]*[[]?[]]?"                        ;; (could be array)
   "[ \t\n\r]+"                                ;; whitespace
   "\\<[a-zA-Z0-9_$]+\\>"                      ;; variable name
   "[ \t\n\r]*[[]?[]]?"                        ;; (could be array)
   "[ \t\n\r]*,?\\)*"                          ;; opt whitespace and comma
   "[ \t\n\r]*"                                ;; optional whitespace
   ")"                                         ;; end the param list
   ))

(defun my-next-link-center ()
  (interactive)
  (Info-next-reference)
  (recenter))

(defun my-next-method ()
  (interactive)
  (end-of-line)
  (re-search-forward regexp-method nil t)
  (evil-first-non-blank))

(defun my-open-all-burly-bookmarks ()
  "Open all burly bookmarks."
  (interactive)
  (bookmark-bmenu-list)
  (let ((bookmarks (burly-bookmark-names)))
    (when bookmarks
      (dolist (item bookmarks)
        (tab-new)
        (burly-open-bookmark item)
        (tab-rename item)))))

(defun my-open-and-eval-init-file ()
  "Open and eval init file."
  (interactive)
  (my-kill-init-buffer)
  (find-file "~/.emacs.d/init.el")
  (eval-buffer)
  (kill-buffer))

(defvar my-prefix-map (make-sparse-keymap) "My custom prefix keymap")
(define-key global-map (kbd "C-l") my-prefix-map)

;;(define-key my-prefix-map (kbd ".") 'avy-goto-char-timer)
;;(define-key my-prefix-map (kbd "C-.") 'avy-goto-char-timer)

;;(define-key my-prefix-map (kbd ",") 'avy-goto-word-1)
;;(define-key my-prefix-map (kbd "C-,") 'my-avy-lightning)

;;(define-key my-prefix-map (kbd "/") 'avy-goto-char-in-line)
;;(define-key my-prefix-map (kbd "C-/") 'avy-goto-char-in-line)

(define-key my-prefix-map (kbd "b") 'list-bookmarks)

(define-key my-prefix-map (kbd "|") 'transpose-frame)

(define-key my-prefix-map (kbd "0") 'er/expand-region)
(define-key my-prefix-map (kbd "1") 'swiper-all)
(define-key my-prefix-map (kbd "7") 'global-display-line-numbers-mode)
(define-key my-prefix-map (kbd "8") 'whitespace-mode)
(define-key my-prefix-map (kbd "9") 'helm-semantic-or-imenu)
(define-key my-prefix-map (kbd "<SPC>") 'set-mark-command)

(define-key my-prefix-map (kbd "C-l") 'avy-goto-line)
(define-key my-prefix-map (kbd ";") 'iedit-mode)
;; TODO dabbrev-expand
(define-key my-prefix-map (kbd "l") 'recenter-top-bottom)
(define-key my-prefix-map (kbd "o") 'occur)
(define-key my-prefix-map (kbd "s") 'sort-lines)
(define-key my-prefix-map (kbd "i") 'iedit-mode)
(define-key my-prefix-map (kbd "p") 'counsel-projectile-switch-project)

(define-key my-prefix-map (kbd "t n") 'tab-new)
(define-key my-prefix-map (kbd "t c") 'tab-close)

(define-key my-prefix-map (kbd "a l") 'my-avy-lightning)
(define-key my-prefix-map (kbd "a a") 'avy-goto-word-1)
(define-key my-prefix-map (kbd "a c") 'avy-goto-char-in-line)

(defun my-prev-curly-brace ()
  (interactive)
  (re-search-backward next-curly-brace-regexp nil t))

(defun my-previous-link-center ()
  (interactive)
  (Info-prev-reference)
  (recenter))

(defun my-prev-java-method ()
  "Jump to previous Java method."
  (interactive)
  (re-search-backward java-function-regexp nil t)
  (beginning-of-line)
  (recenter))

(defun my-prev-method ()
  (interactive)
  (beginning-of-line)
  (re-search-backward regexp-method nil t)
  (evil-first-non-blank))

(defun my-projectile-ibuffer ()
  (interactive)
  (projectile-ibuffer nil)
  (delete-other-windows))

(defun my-projectile-magit ()
  (interactive)
  (projectile-vc)
  (delete-other-windows))

(defun my-reset-font-size ()
  (interactive)
  (setq font-size default-font-size)
  (set-face-attribute 'default nil :height font-size))

(defun my-reset-themes-index ()
  "Reset themes index."
  (interactive)
  (setq theme-index 0)
  (setq INDEX-CHIAROSCURO 0)
  (my-disable-themes))

(defun my-save-all-tabs ()
  "Save all tabs to burly bookmarks."
  (interactive)
  ;;(my-delete-all-burly-bookmarks)
  (let ((tabs (tab-bar-tabs)))
    (dolist (tab tabs)
      (if (not (eq (alist-get 'name tab) "*scratch*"))
          (progn
            (tab-bar-switch-to-tab (alist-get 'name tab))
            (burly-bookmark-windows (alist-get 'name tab)))))))

(defun my-scroll-down ()
  "Scroll down."
  (interactive)
  (next-line)
  (evil-first-non-blank)
  (recenter))

(defun my-scroll-down-center ()
  "Scroll down."
  (interactive)
  (next-line 10)
  (recenter))

(defun my-scroll-up ()
  "Scroll up."
  (interactive)
  (previous-line)
  (evil-first-non-blank)
  (recenter))

(defun my-scroll-up-center ()
  "Scroll up."
  (interactive)
  (previous-line 10)
  (recenter))

(defun my-select-line ()
  "Select line at point."
  (interactive)
  (evil-first-non-blank)
  (set-mark (line-end-position)))

(defun my-set-theme (index)
  "Set theme."
  (interactive)
  (setq theme-index index)
  (setq INDEX-CHIAROSCURO index)
  (my-toggle-themes))

(defun my-show-projects ()
  (interactive)
  (switch-to-buffer "*projects*")
  (mark-whole-buffer)
  (cua-delete-region)
  (org-mode)
  (insert "#+TITLE: Projects\n\n")
  (dolist (project (projectile-relevant-known-projects))
    (insert (concat "* " " [[" project "]] " "\n")))
  (goto-char (point-min)))

(defun my-start ()
  "test"
  (interactive)
  (let ((input (read-from-minibuffer "Search for: ")))
    (my-message input)))

(defun my-start-screen ()
  (interactive)
  (my-agenda-view)
  (org-agenda-redo-all)
  (split-window-below)
  (my-show-projects))

(defun my-theme-down ()
  "Theme down."
  (interactive)
  (setq theme-index (- theme-index 1))
  (setq INDEX-CHIAROSCURO (- INDEX-CHIAROSCURO 1))
  (my-toggle-themes))

(defun my-theme-loop ()
  "Loop."
  (interactive)
  (setq loop-index 1)
  (setq themes-list-index 0)
  (while (<= loop-index number-of-themes)
    (if (eq theme-index loop-index)
        (progn
          (load-theme (nth themes-list-index themes-list) t)
          (message "%s" (nth themes-list-index themes-list-names))))
    (setq loop-index (+ loop-index 1))
    (setq themes-list-index (+ themes-list-index 1))))

(defun my-theme-up ()
  "Theme up."
  (interactive)
  (setq theme-index (+ theme-index 1))
  (setq INDEX-CHIAROSCURO (+ INDEX-CHIAROSCURO 1))
  (my-toggle-themes))

(defun my-toggle-cua-mode ()
  "Toggle 'cua-mode'."
  (if cua-mode
      (progn
        (cua-mode -1))
    (progn
      (cua-mode t))))

(defun my-toggle-focus-mode ()
  "Toggle focus-mode."
  (if focus-mode
      (progn
        (focus-mode -1))
    (progn
      (focus-mode t))))

(defun my-toggle-fringe ()
  (if (eq mode-line-fringe -1)
      (progn (fringe-mode '(0 . 0))
             (setq my-fringe 0))
    (progn (fringe-mode '(20 . 20))
           (setq my-fringe 1))))

;;(defun my-toggle-line-numbers ()
;;  "Toggle line numbers."
;;  (if global-display-line-numbers-mode
;;      (progn
;;        (global-display-line-numbers-mode -1))
;;    (progn
;;      (global-display-line-numbers-mode t))))

(defun my-toggle-menu-bar-tool-bar ()
  "Toggle menu-bar and tool-bar."
  (interactive)
  (if (bound-and-true-p tool-bar-mode)
      (progn (tool-bar-mode 0) (menu-bar-mode 0))
    (progn (tool-bar-mode 1) (menu-bar-mode 1))))

(defun my-toggle-mode-line-fringe ()
  "Toggle mode line and fringe."
  (interactive)
  (if (eq mode-line-fringe t)
      (progn
        (setq mode-line-fringe -1))
    (progn
      (setq mode-line-fringe t)))

  (if (eq mode-line-fringe t)
      (global-hide-mode-line-mode -1)
    (global-hide-mode-line-mode t))
  (my-toggle-fringe))

(defun my-toggle-themes ()
  "Toggle themes."
  (interactive)
  (my-disable-themes)

  (if (eq theme-index -1)
      (progn (setq theme-index number-of-themes)))

  (if (eq theme-index 0)
      (progn (message "emacs")
             (setq theme-index 0)
             (setq INDEX-CHIAROSCURO 0)))

  (my-theme-loop)

  (if (> theme-index number-of-themes)
      (progn (message "emacs")
             (setq theme-index 0)
             (setq INDEX-CHIAROSCURO 0))))

(defun my-toggle-whitespace ()
  "Toggle whitespace."
  (if whitespace-mode
      (progn
        (whitespace-mode -1))
    (progn
      (whitespace-mode t))))

(defun my-trim-whitespace ()
  "Trim whitespace."
  (interactive)
  (save-excursion
    (let ((begin (line-beginning-position))
          (end (line-end-position)))
      (whitespace-cleanup-region begin end))))

(defun my-yank-and-search ()
  "test"
  (interactive)
  (let ((search-text (clipboard-yank)))
    (helm-grep-do-git-grep search-text)))

(defun my-yank-line-at-point ()
  "Yank line at point."
  (interactive)
  (fixup-whitespace)
  (yank)
  (c-indent-line-or-region)
  (message "Yanked line."))

(defvar next-curly-brace-regexp "{\\|}")

(setq org-directory "~/source/org-mode/")
(setq org-default-notes-file (concat org-directory "/org-capture.org"))

;;(load (concat EMACS-HOME "agenda"))

(setq org-priority-faces '((?A . (:foreground "white" :background "red3"        :weight 'bold))
                           (?B . (:foreground "white" :background "DarkOrange1" :weight 'bold))
                           (?C . (:foreground "white" :background "green4"      :weight 'bold))))

(setq org-startup-folded 'showeverything)

(setq org-support-shift-select 'always)
(setq org-todo-keywords '((sequence "TODO" "IN-PROGRESS" "|" "DONE")))
(setq org-tags-column 0)
(setq org-adapt-indentation nil)

(setq org-edit-src-content-indentation 0)
(setq org-src-preserve-indentation t)

(setq org-latex-pdf-process '("latexmk -f -pdf %f"))

(setq org-image-actual-width (list 500))

(setq org-agenda-custom-commands '(
                                   ("y" "Yearly Overview" agenda "" (
                                                                     (org-agenda-span 'year)
                                                                     (org-agenda-time-grid nil)
                                                                     (org-agenda-show-all-dates nil)
                                                                     (org-agenda-entry-types '(:deadline))
                                                                     (org-deadline-warning-days 0)))))

(setq org-publish-project-alist
      '(("org-mode-notes-emacs"
         :base-directory "~/source/org-mode/notes/emacs/"
         :base-extension "org"
         :publishing-directory "~/publish/emacs/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-preamble t)

        ("org-mode-notes-emacs-static"
         :base-directory "~/source/org-mode/notes/emacs/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/publish/emacs/"
         :recursive t
         :publishing-function org-publish-attachment)

        ("org-mode-notes-development"
         :base-directory "~/source/org-mode/notes/development/"
         :base-extension "org"
         :publishing-directory "~/publish/development/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-preamble t)

        ("org-mode-notes-development-static"
         :base-directory "~/source/org-mode/notes/development/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/publish/development/"
         :recursive t
         :publishing-function org-publish-attachment)

        ("org" :components ("org-mode-notes-emacs"
                            "org-mode-notes-emacs-static"
                            "org-mode-notes-development"
                            "org-mode-notes-development-static"))))

(setq org-emphasis-alist
      '(("*" (bold :foreground "Orange"))
        ("/" (italic :foreground "Orange"))
        ("_" (underline :foreground "Orange"))
        ("=" (:foreground "Black" :background "Orange"))
        ("~" (:foreground "Black" :background "SpringGreen1"))
        ("+" (:strike-through t :foreground "SpringGreen1"))))

;(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(setq INDEX-DEFAULT             1)
(setq INDEX-ECLIPSE             2)
(setq INDEX-CONSOLE-LIGHT       3)
(setq INDEX-COLOR-CHANGE-LIGHT  4)
(setq INDEX-HIGH-CONTRAST       5)
(setq INDEX-GRAY                6)
(setq INDEX-LOW-CHROMA          7)
(setq INDEX-BLUE                8)
(setq INDEX-NEON                9)
(setq INDEX-CONSOLE-DARK       10)
(setq INDEX-RED                11)
(setq INDEX-CASABLANCA         12)
(setq INDEX-COLOR-CHANGE-DARK  13)

(defvar chiaroscuro-index 0 "Index representing the current theme")
(setq chiaroscuro-index 0)

(setq themes-list '(chiaroscuro
                    chiaroscuro
                    chiaroscuro
                    chiaroscuro
                    chiaroscuro
                    chiaroscuro
                    chiaroscuro
                    chiaroscuro
                    chiaroscuro
                    chiaroscuro
                    chiaroscuro
                    chiaroscuro
                    chiaroscuro))

(setq themes-list-names '("default"
                          "eclipse"
                          "console light"
                          "color change light"
                          "high contrast"
                          "gray"
                          "low chroma"
                          "blue"
                          "neon"
                          "console dark"
                          "red"
                          "casablanca"
                          "color change dark"))

(defvar theme-index 0 "Index representing the current theme")
(setq number-of-themes (length themes-list))

(global-hl-line-mode -1)
(hl-line-mode -1)
(setq global-hl-line-modes t)

(setenv "JAVA_HOME" "/usr/lib/jvm/java-23-openjdk-amd64")
(setq lsp-java-java-path "/usr/lib/jvm/java-1.23.0-openjdk-amd64/bin/java")

(defun my-projectile-run-project ()
  "Set custom projectile-run-project command."
  (projectile-run-project (concat)))
