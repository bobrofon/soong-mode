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

;;;###autoload
(define-derived-mode soong-mode prog-mode "Soong"
  "Major mode for editing Soong build files.")

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.bp\\'" . soong-mode))

(provide 'soong-mode)
;;; soong-mode.el ends here
