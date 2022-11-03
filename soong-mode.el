;;; soong-mode.el --- Support for the Soong build system -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Sergey Bobrenok <bobrofon@gmail.com>

;; Author: Sergey Bobrenok <bobrofon@gmail.com>
;; Keywords: languages
;; URL: https://github.com/bobrofon/soong-mode
;; Package-Requires: ((emacs "27.1"))
;; Version: 0.1.1-snapshot

;; This file is not part of GNU Emacs.

;; This file is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this file.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This package provides support for Soong build system (used in Android).  See
;; https://android.googlesource.com/platform/build/soong/+/refs/heads/master/README.md
;; for Soong introduction.

;;; Code:

(defconst soong-font-lock-keywords-1
  ;; function declarations, file directives, strings and comments
  `()
  "Value of `font-lock-keywords' in `soong-mode' on font lock level 1.")

(defconst soong-font-lock-keywords-2
  `(,@soong-font-lock-keywords-1
    ;; keywords, type names, named constants
    ;; Constants
    (,(regexp-opt '("true" "false")
                  'symbols)
     . 'font-lock-constant-face))
  "Value of `font-lock-keywords' in `soong-mode' on font lock level 2.")

(defconst soong-font-lock-keywords-3
  `(,@soong-font-lock-keywords-2
    ;; builtin function names
    ;; Builtin target type names
    (,(regexp-opt '("cc_benchmark"
                    "cc_benchmark_host"
                    "cc_binary"
                    "cc_binary_host"
                    "cc_defaults"
                    "cc_genrule"
                    "cc_library"
                    "cc_library_headers"
                    "cc_library_host_shared"
                    "cc_library_host_static"
                    "cc_library_shared"
                    "cc_library_static"
                    "cc_object"
                    "cc_prebuilt_binary"
                    "cc_prebuilt_library_shared"
                    "cc_prebuilt_library_static"
                    "cc_test"
                    "cc_test_host"
                    "cc_test_library")
                  'symbols)
     . 'font-lock-builtin-face))
  "Value of `font-lock-keywords' in `soong-mode' on font lock level 3.")

(defconst soong-font-lock-keywords soong-font-lock-keywords-3
  "Default value of `font-lock-keywords' in `soong-mode'.")

;;;###autoload
(define-derived-mode soong-mode prog-mode "Soong"
  "Major mode for editing Soong build files."
  ;; Soong convention is to use 4 spaces for indentation.
  (setq-local tab-width 4)
  (setq-local indent-tabs-mode nil)
  (setq-local font-lock-defaults '((soong-font-lock-keywords
                                    soong-font-lock-keywords-1
                                    soong-font-lock-keywords-2
                                    soong-font-lock-keywords-3))))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.bp\\'" . soong-mode))

(provide 'soong-mode)
;;; soong-mode.el ends here
