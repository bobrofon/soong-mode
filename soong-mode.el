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
     . 'font-lock-constant-face)
    ;; Well-known attribute names
    (,(regexp-opt '("aaptflags"
                    "aapt_include_all_resources"
                    "additional_certificates"
                    "additional_manifests"
                    "address"
                    "aidl"
                    "all"
                    "allow_undefined_symbols"
                    "android_libs"
                    "android_license_conditions"
                    "android_license_files"
                    "android_license_kinds"
                    "android_static_libs"
                    "app_image"
                    "arch"
                    "arm"
                    "arm64"
                    "asflags"
                    "asset_dirs"
                    "auto_gen_config"
                    "certificate"
                    "cfi"
                    "cflags"
                    "check_elf_files"
                    "clang"
                    "clang_asflags"
                    "clang_cflags"
                    "compile_multilib"
                    "conlyflags"
                    "cppflags"
                    "darwin"
                    "data"
                    "device_specific"
                    "dex_preopt"
                    "diag"
                    "dont_merge_manifests"
                    "dxflags"
                    "enabled"
                    "enforce_uses_libs"
                    "errorprone"
                    "exclude_filter"
                    "exclude_srcs"
                    "export_header_lib_headers"
                    "export_include_dirs"
                    "export_package_resources"
                    "export_shared_lib_headers"
                    "export_static_lib_headers"
                    "fixed"
                    "flags"
                    "fuzzer"
                    "generated_sources"
                    "header_libs"
                    "host"
                    "host_ldlibs"
                    "host_required"
                    "include_dirs"
                    "include_filter"
                    "init_rc"
                    "installable"
                    "instruction_set"
                    "instrumentation_for"
                    "jacoco"
                    "jarjar_rules"
                    "javacflags"
                    "java_resource_dirs"
                    "java_resources"
                    "java_version"
                    "jetifier"
                    "jni_libs"
                    "keep_symbols"
                    "ldflags"
                    "lib32"
                    "lib64"
                    "libs"
                    "lineage"
                    "linux_glibc"
                    "local_include_dirs"
                    "local_module_path"
                    "logtags"
                    "manifest"
                    "min_sdk_version"
                    "multilib"
                    "name"
                    "native_coverage"
                    "never"
                    "no_aapt_flags"
                    "nocrt"
                    "none"
                    "not_darwin"
                    "not_linux_glibc"
                    "not_windows"
                    "obfuscate"
                    "optimize"
                    "optional"
                    "optional_uses_libs"
                    "overrides"
                    "owner"
                    "package_splits"
                    "pack_relocations"
                    "pdk"
                    "platform_apis"
                    "plugins"
                    "prebuilt"
                    "preprocessed"
                    "privileged"
                    "product_specific"
                    "product_variables"
                    "profile"
                    "profile_guided"
                    "proguard_flags"
                    "proguard_flags_files"
                    "proprietary"
                    "proto"
                    "recover"
                    "relative_install_path"
                    "renderscript"
                    "required"
                    "resource_dirs"
                    "rtti"
                    "sanitize"
                    "sdk_version"
                    "shared_libs"
                    "srcs"
                    "static_executable"
                    "static_libs"
                    "stem"
                    "stl"
                    "strip"
                    "suffix"
                    "system_ext_specific"
                    "system_shared_libs"
                    "tags"
                    "target"
                    "target_api"
                    "target_required"
                    "test_config"
                    "test_suites"
                    "theme"
                    "thread"
                    "tidy"
                    "tidy_checks"
                    "tidy_flags"
                    "type"
                    "unbundled_build"
                    "undefined"
                    "unit_test"
                    "use_clang_lld"
                    "use_embedded_dex"
                    "use_embedded_native_libs"
                    "uses_libs"
                    "vendor"
                    "version"
                    "version_script"
                    "vintf_fragments"
                    "whole_static_libs"
                    "windows"
                    "x86"
                    "x86_64"
                    "yacc")
                  'symbols)
     . 'font-lock-keyword-face))
  "Value of `font-lock-keywords' in `soong-mode' on font lock level 2.")

(defconst soong-font-lock-keywords-3
  `(,@soong-font-lock-keywords-2
    ;; builtin function names
    ;; Builtin target type names
    (,(regexp-opt '("android_app"
                    "android_app_import"
                    "cc_benchmark"
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
                    "cc_test_library"
                    "cts_host_java_library"
                    "cts_package"
                    "cts_support_package"
                    "cts_target_java_library"
                    "java_import"
                    "java_library"
                    "java_library_host"
                    "java_library_host_dalvik"
                    "java_library_installable"
                    "prebuilt_etc"
                    "runtime_resource_overlay")
                  'symbols)
     . 'font-lock-builtin-face))
  "Value of `font-lock-keywords' in `soong-mode' on font lock level 3.")

(defconst soong-font-lock-keywords soong-font-lock-keywords-3
  "Default value of `font-lock-keywords' in `soong-mode'.")

(defconst soong-mode-syntax-table
  (let ((table (make-syntax-table)))
    ;; C++ style comments
    (modify-syntax-entry ?/ ". 124b" table)
    (modify-syntax-entry ?* ". 23" table)
    (modify-syntax-entry ?\n "> b" table)
    table)
  "Syntax table for `soong-mode'.")

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
