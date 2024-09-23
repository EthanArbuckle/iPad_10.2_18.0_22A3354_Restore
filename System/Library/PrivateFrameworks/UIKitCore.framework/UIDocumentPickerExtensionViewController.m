@implementation UIDocumentPickerExtensionViewController

- (void)dismissGrantingAccessToURL:(NSURL *)url
{
  NSURL *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSURL *v22;

  v5 = url;
  v22 = v5;
  if (v5)
  {
    if (!-[NSURL isFileURL](v5, "isFileURL"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerExtensionViewController.m"), 44, CFSTR("Can only grant access to file URLs"));

    }
    -[UIDocumentPickerExtensionViewController documentStorageURL](self, "documentStorageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[NSURL absoluteString](v22, "absoluteString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDocumentPickerExtensionViewController documentStorageURL](self, "documentStorageURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "absoluteString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "hasPrefix:", v9);

      if ((v10 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIDocumentPickerExtensionViewController documentStorageURL](self, "documentStorageURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerExtensionViewController.m"), 47, CFSTR("%@ dismissed with a URL (%@) not contained in its documentStorageURL (%@)"), self, v22, v21);

      }
    }
    if (-[UIDocumentPickerExtensionViewController documentPickerMode](self, "documentPickerMode") == UIDocumentPickerModeMoveToService
      || -[UIDocumentPickerExtensionViewController documentPickerMode](self, "documentPickerMode") == UIDocumentPickerModeExportToService)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL path](v22, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v12, 0);

      if ((v13 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerExtensionViewController.m"), 52, CFSTR("%@ was dismissed with a nonexistent URL (%@) in Move or Export mode"), self, v22);

      }
    }
    v15 = (self->_documentPickerMode & 0xFFFFFFFFFFFFFFFDLL) != 1;
    -[UIViewController navigationController](self, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_remoteViewControllerProxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDocumentPickerNSURLWrapper wrapperWithURL:createSandboxIfNoneAttached:](_UIDocumentPickerNSURLWrapper, "wrapperWithURL:createSandboxIfNoneAttached:", v22, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_didSelectURLWrapper:", v18);

  }
  else
  {
    -[UIViewController navigationController](self, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_remoteViewControllerProxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_dismissViewController");
  }

}

- (void)_setTintColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v4);

}

+ (id)_exportedInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDEFB670);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel__prepareWithExtensionInfo_completionHandler_, 0, 0);

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDEFD780);
}

- (void)_setUploadURLWrapper:(id)a3
{
  id v4;

  objc_msgSend(a3, "url");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIDocumentPickerExtensionViewController _setUploadURL:](self, "_setUploadURL:", v4);

}

- (void)_setUploadURL:(id)a3
{
  NSURL *v4;
  NSURL *originalURL;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_originalURL) & 1) == 0)
  {
    -[NSURL stopAccessingSecurityScopedResource](self->_originalURL, "stopAccessingSecurityScopedResource");
    v4 = (NSURL *)objc_msgSend(v6, "copy");
    originalURL = self->_originalURL;
    self->_originalURL = v4;

    -[NSURL startAccessingSecurityScopedResource](self->_originalURL, "startAccessingSecurityScopedResource");
  }

}

- (void)_prepareWithExtensionInfo:(id)a3 completionHandler:(id)a4
{
  void (**v7)(id, _QWORD);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int has_internal_diagnostics;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  unint64_t v33;
  NSObject *v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD))a4;
  v8 = a3;
  objc_msgSend(v8, "objectForKey:", CFSTR("documentGroup"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("documentStorageURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentPickerExtensionViewController _setDocumentStorageURL:](self, "_setDocumentStorageURL:", v10);

  objc_msgSend(v8, "objectForKey:", CFSTR("providerIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentPickerExtensionViewController _setProviderIdentifier:](self, "_setProviderIdentifier:", v11);

  objc_msgSend(v8, "objectForKey:", CFSTR("localizedName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v12);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "containerURLForSecurityApplicationGroupIdentifier:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerExtensionViewController.m"), 122, CFSTR("Could not access the group container with identifier %@. Is the necessary entitlement set?"), v9);

    }
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v17 = CheckSandboxAccess(v15);
    if (has_internal_diagnostics)
    {
      if (!v17)
      {
        __UIFaultDebugAssertLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v15;
          _os_log_fault_impl(&dword_185066000, v32, OS_LOG_TYPE_FAULT, "No access to group container %@, even though we just got it from NSFileManager.", buf, 0xCu);
        }

      }
    }
    else if (!v17)
    {
      v33 = _prepareWithExtensionInfo_completionHandler____s_category;
      if (!_prepareWithExtensionInfo_completionHandler____s_category)
      {
        v33 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v33, (unint64_t *)&_prepareWithExtensionInfo_completionHandler____s_category);
      }
      v34 = *(NSObject **)(v33 + 8);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v15;
        _os_log_impl(&dword_185066000, v34, OS_LOG_TYPE_ERROR, "No access to group container %@, even though we just got it from NSFileManager.", buf, 0xCu);
      }
    }

  }
  -[UIDocumentPickerExtensionViewController documentStorageURL](self, "documentStorageURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentPickerExtensionViewController documentStorageURL](self, "documentStorageURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v21, 1, 0, 0);

  }
  if (-[UIDocumentPickerExtensionViewController documentPickerMode](self, "documentPickerMode") == UIDocumentPickerModeMoveToService
    || -[UIDocumentPickerExtensionViewController documentPickerMode](self, "documentPickerMode") == UIDocumentPickerModeOpen)
  {
    -[UIDocumentPickerExtensionViewController documentStorageURL](self, "documentStorageURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerExtensionViewController.m"), 136, CFSTR("documentStorageURL is nil in Open or Move mode."));

    }
    -[UIDocumentPickerExtensionViewController documentStorageURL](self, "documentStorageURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = CheckSandboxAccess(v23);

    if (!v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDocumentPickerExtensionViewController documentStorageURL](self, "documentStorageURL");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "containerURLForSecurityApplicationGroupIdentifier:", v9);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerExtensionViewController.m"), 142, CFSTR("No access to documentStorageURL %@; group container is at %@."),
          v27,
          v29);

      }
      else
      {
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerExtensionViewController.m"), 147, CFSTR("No access to documentStorageURL %@; no NSExtensionFileProviderDocumentGroup found."),
          v26);
      }

    }
  }
  -[UIDocumentPickerExtensionViewController prepareForPresentationInMode:](self, "prepareForPresentationInMode:", -[UIDocumentPickerExtensionViewController documentPickerMode](self, "documentPickerMode"));
  -[UIViewController view](self, "view");

  v7[2](v7, _UIApplicationLinkedOnVersion);
}

- (UIDocumentPickerMode)documentPickerMode
{
  return self->_documentPickerMode;
}

- (void)_setPickerMode:(unint64_t)a3
{
  self->_documentPickerMode = a3;
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (NSArray)validTypes
{
  return self->_validTypes;
}

- (void)_setPickableTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void)_setProviderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (NSURL)documentStorageURL
{
  return self->_documentStorageURL;
}

- (void)_setDocumentStorageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentStorageURL, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_validTypes, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
}

@end
