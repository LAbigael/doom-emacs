;;; tools/ein/config.el -*- lexical-binding: t; -*-

;;
;;; Packages

(after! ein
  (defun +ein-buffer-p (buf)
    (or (memq buf (ein:notebook-opened-buffers))
        (memq buf (mapcar #'ein:notebooklist-get-buffer (ein:notebooklist-keys)))))
  (add-to-list 'doom-real-buffer-functions #'+ein-buffer-p nil #'eq)
  (map! :map ein:notebook-mode-map
        "M-s" #'ein:notebook-save-notebook-command-km
        :map ein:notebooklist-mode-map
        "o" #'ein:notebook-open-km))
