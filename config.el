(setq user-full-name "Alexander Derevianko"
      user-mail-address "alexander0derevianko@gmail.com")
(setq doom-font (font-spec :family "Fira Code" :size 18)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 18))
(setq doom-theme 'doom-gruvbox)
(setq display-line-numbers-type `relative)
(setq org-directory "~/org/")
(general-auto-unbind-keys)
(map! :leader
      (:prefix ("m" . "my")
               "c" #'comment-dwim
               (:prefix ("d" . "dap")
                        "c" #'dap-java-run-test-class
                        "m" #'dap-java-run-test-method
                        "n" #'dap-next
                        "i" #'dap-step-in
                        "C" #'dap-continue
                        "k" #'dap-disconnect
                        "r" #'dap-debug-restart
                        (:prefix ("b" . "breakpoint")
                                 "a" #'dap-breakpoint-add
                                 "d" #'dap-breakpoint-delete
                                 "A" #'dap-breakpoint-delete-all
                                 )
                        (:prefix ("d" . "debug")
                                 "c" #'dap-java-debug-test-class
                                 "m" #'dap-java-debug-test-method
                                 )
                        )
               (:prefix ("l" . "lsp")
                        "j" #'lsp-jt-browser
                        "i" #'lsp-java-organize-imports
                        "r" #'lsp-rename
                        "g d" #'lsp-goto-type-definition
                        )
               )
      )

(setq git-commit-summary-max-length 1000)

(after! lsp-java
  (require 'lsp-java-boot)
  (require 'dap-java)

  ;; to enable the lenses
  (add-hook 'lsp-mode-hook #'lsp-lens-mode)
  (add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)
  (add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)
  (lsp-register-client
    (make-lsp-client :new-connection (lsp-stdio-connection "nixd")
                     :major-modes '(nix-mode)
                     :priority 0
                     :server-id 'nixd))
  )

(add-to-list 'safe-local-variable-values #'stringp)
(advice-add 'risky-local-variable-p :override #'ignore)
