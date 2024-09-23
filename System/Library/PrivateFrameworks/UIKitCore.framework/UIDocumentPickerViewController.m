@implementation UIDocumentPickerViewController

- (UIDocumentPickerViewController)initWithDocumentTypes:(NSArray *)allowedUTIs inMode:(UIDocumentPickerMode)mode
{
  NSArray *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  UIDocumentPickerViewController *v12;
  UIDocumentPickerViewController *v13;
  void *v15;
  void *v16;
  objc_super v17;

  v7 = allowedUTIs;
  if (mode >= UIDocumentPickerModeExportToService)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerViewController.m"), 115, CFSTR("%s can only be called with mode Import or Open"), "-[UIDocumentPickerViewController initWithDocumentTypes:inMode:]");

  }
  if (-[NSArray count](v7, "count") == 1)
  {
    v8 = (void *)MEMORY[0x1E0CEC3F8];
    -[NSArray firstObject](v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "typeWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", *MEMORY[0x1E0CEC4F0]);

    if (mode != UIDocumentPickerModeOpen)
    {
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerViewController.m"), 118, CFSTR("%s folder import is not supported, use open"), "-[UIDocumentPickerViewController initWithDocumentTypes:inMode:]");

      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)UIDocumentPickerViewController;
  v12 = -[UIViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    -[UIDocumentPickerViewController setDocumentPickerMode:](v12, "setDocumentPickerMode:", mode);
    -[UIDocumentPickerViewController _commonInitWithDocumentTypes:](v13, v7);
  }

  return v13;
}

- (void)_commonInitWithDocumentTypes:(void *)a1
{
  id DOCConfigurationClass;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  id v21;

  v21 = a2;
  objc_msgSend(a1, "_setAutomaticallyDismissesAfterCompletion:", 1);
  objc_msgSend(a1, "setDocumentTypes:", v21);
  switch(objc_msgSend(a1, "documentPickerMode"))
  {
    case 0:
      DOCConfigurationClass = getDOCConfigurationClass();
      v4 = v21;
      v5 = 0;
      goto LABEL_10;
    case 1:
      if (objc_msgSend(v21, "count") != 1)
        goto LABEL_9;
      v13 = (void *)MEMORY[0x1E0CEC3F8];
      objc_msgSend(v21, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "typeWithIdentifier:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqual:", *MEMORY[0x1E0CEC4F0]);

      if (v16)
      {
        objc_msgSend(getDOCConfigurationClass(), "configurationForFolderPicking");
        v17 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_9:
        DOCConfigurationClass = getDOCConfigurationClass();
        v4 = v21;
        v5 = 1;
LABEL_10:
        objc_msgSend(DOCConfigurationClass, "configurationForImportingDocumentsWithContentTypes:mode:", v4, v5);
        v17 = objc_claimAutoreleasedReturnValue();
      }
      v7 = (void *)v17;
      objc_msgSend(a1, "setConfiguration:", v17);
      goto LABEL_12;
    case 2:
      v6 = getDOCConfigurationClass();
      objc_msgSend(a1, "uploadURLs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = 2;
      goto LABEL_5;
    case 3:
      v11 = getDOCConfigurationClass();
      objc_msgSend(a1, "uploadURLs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v11;
      v9 = v7;
      v10 = 3;
LABEL_5:
      objc_msgSend(v8, "configurationForExportingDocumentsToURLs:mode:", v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setConfiguration:", v12);

LABEL_12:
      break;
    default:
      break;
  }
  objc_msgSend(a1, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setForPickingDocuments:", 1);

  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "userInterfaceIdiom") != 0;

    objc_msgSend(a1, "setModalPresentationStyle:", v20);
  }

}

- (UIDocumentPickerViewController)initForOpeningContentTypes:(NSArray *)contentTypes asCopy:(BOOL)asCopy
{
  _BOOL4 v4;
  NSArray *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  int v16;
  UIDocumentPickerViewController *v18;
  UIDocumentPickerViewController *v19;
  void *v21;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v4 = asCopy;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = contentTypes;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](v7, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v7;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v13), "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v8, "firstObject");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v16 = UTTypeEqual(v15, (CFStringRef)*MEMORY[0x1E0CA5B58]);

    if (v16 && v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerViewController.m"), 149, CFSTR("%s folder import is not supported, use asCopy:false"), "-[UIDocumentPickerViewController initForOpeningContentTypes:asCopy:]");

    }
  }
  v22.receiver = self;
  v22.super_class = (Class)UIDocumentPickerViewController;
  v18 = -[UIViewController initWithNibName:bundle:](&v22, sel_initWithNibName_bundle_, 0, 0);
  v19 = v18;
  if (v18)
  {
    -[UIDocumentPickerViewController setDocumentPickerMode:](v18, "setDocumentPickerMode:", !v4);
    -[UIDocumentPickerViewController _commonInitWithDocumentTypes:](v19, v8);
  }

  return v19;
}

- (UIDocumentPickerViewController)initForOpeningContentTypes:(NSArray *)contentTypes
{
  return -[UIDocumentPickerViewController initForOpeningContentTypes:asCopy:](self, "initForOpeningContentTypes:asCopy:", contentTypes, 0);
}

- (UIDocumentPickerViewController)initWithCoder:(NSCoder *)coder
{
  UIDocumentPickerViewController *v3;
  UIDocumentPickerViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIDocumentPickerViewController;
  v3 = -[UIViewController initWithCoder:](&v6, sel_initWithCoder_, coder);
  v4 = v3;
  if (v3)
    -[UIDocumentPickerViewController _setAutomaticallyDismissesAfterCompletion:](v3, "_setAutomaticallyDismissesAfterCompletion:", 1);
  return v4;
}

- (UIDocumentPickerViewController)initWithURL:(NSURL *)url inMode:(UIDocumentPickerMode)mode
{
  NSURL *v7;
  NSURL *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  id v12;
  id v13;
  UIDocumentPickerViewController *v14;
  UIDocumentPickerViewController *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  id v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = url;
  v8 = v7;
  if ((mode & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerViewController.m"), 175, CFSTR("%s can only be called with mode Export or Move"), "-[UIDocumentPickerViewController initWithURL:inMode:]");

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerViewController.m"), 176, CFSTR("%s must be called with a valid URL"), "-[UIDocumentPickerViewController initWithURL:inMode:]");

LABEL_3:
  -[NSURL lastPathComponent](v8, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerViewController.m"), 177, CFSTR("%s must be called with a URL pointing to a file"), "-[UIDocumentPickerViewController initWithURL:inMode:]");

  }
  v24 = 0;
  v10 = *MEMORY[0x1E0C99A90];
  v23 = 0;
  v11 = -[NSURL getPromisedItemResourceValue:forKey:error:](v8, "getPromisedItemResourceValue:forKey:error:", &v24, v10, &v23);
  v12 = v24;
  v13 = v23;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerViewController.m"), 181, CFSTR("%s must be called with a URL pointing to an existing file: %@"), "-[UIDocumentPickerViewController initWithURL:inMode:]", v13);

  }
  v22.receiver = self;
  v22.super_class = (Class)UIDocumentPickerViewController;
  v14 = -[UIViewController initWithNibName:bundle:](&v22, sel_initWithNibName_bundle_, 0, 0);
  v15 = v14;
  if (v14)
  {
    -[UIDocumentPickerViewController setDocumentPickerMode:](v14, "setDocumentPickerMode:", mode);
    v25[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentPickerViewController setUploadURLs:](v15, "setUploadURLs:", v16);

    -[UIDocumentPickerViewController _commonInitWithDocumentTypes:](v15, MEMORY[0x1E0C9AA60]);
  }

  return v15;
}

- (UIDocumentPickerViewController)initWithURLs:(NSArray *)urls inMode:(UIDocumentPickerMode)mode
{
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  UIDocumentPickerViewController *v22;
  UIDocumentPickerViewController *v23;
  void *v25;
  void *v26;
  UIDocumentPickerMode v27;
  objc_super v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = urls;
  v6 = v5;
  v27 = mode;
  if ((mode & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerViewController.m"), 196, CFSTR("%s can only be called with mode Export or Move"), "-[UIDocumentPickerViewController initWithURLs:inMode:]");

    if (v6)
      goto LABEL_3;
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerViewController.m"), 197, CFSTR("%s must be called with a valid URL"), "-[UIDocumentPickerViewController initWithURLs:inMode:]");

    goto LABEL_3;
  }
  if (!v5)
    goto LABEL_22;
LABEL_3:
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = v6;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v8)
    goto LABEL_18;
  v9 = v8;
  v10 = *(_QWORD *)v34;
  v11 = *MEMORY[0x1E0C99A90];
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v34 != v10)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v12);
      v14 = objc_msgSend(v13, "startAccessingSecurityScopedResource");
      objc_msgSend(v13, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerViewController.m"), 202, CFSTR("%s must be called with a URL pointing to a file"), "-[UIDocumentPickerViewController initWithURLs:inMode:]");

      }
      v31 = 0;
      v32 = 0;
      v16 = objc_msgSend(v13, "getPromisedItemResourceValue:forKey:error:", &v32, v11, &v31);
      v17 = v32;
      v18 = v31;
      if ((v16 & 1) != 0)
      {
        if (!v14)
          goto LABEL_13;
LABEL_12:
        objc_msgSend(v13, "stopAccessingSecurityScopedResource");
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerViewController.m"), 206, CFSTR("%s must be called with a URL pointing to an existing file: %@"), "-[UIDocumentPickerViewController initWithURLs:inMode:]", v18);

      if (v14)
        goto LABEL_12;
LABEL_13:

      ++v12;
    }
    while (v9 != v12);
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    v9 = v21;
  }
  while (v21);
LABEL_18:

  v30.receiver = self;
  v30.super_class = (Class)UIDocumentPickerViewController;
  v22 = -[UIViewController initWithNibName:bundle:](&v30, sel_initWithNibName_bundle_, 0, 0);
  v23 = v22;
  if (v22)
  {
    -[UIDocumentPickerViewController setDocumentPickerMode:](v22, "setDocumentPickerMode:", v27);
    -[UIDocumentPickerViewController setUploadURLs:](v23, "setUploadURLs:", v7);
    -[UIDocumentPickerViewController _commonInitWithDocumentTypes:](v23, MEMORY[0x1E0C9AA60]);
  }

  return v23;
}

- (UIDocumentPickerViewController)initForExportingURLs:(NSArray *)urls asCopy:(BOOL)asCopy
{
  _BOOL4 v4;
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  UIDocumentPickerViewController *v23;
  UIDocumentPickerViewController *v24;
  void *v26;
  uint64_t v27;
  objc_super v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v4 = asCopy;
  v38 = *MEMORY[0x1E0C80C00];
  v5 = urls;
  v6 = v5;
  v7 = 2;
  if (!v4)
    v7 = 3;
  v27 = v7;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerViewController.m"), 230, CFSTR("%s must be called with a valid URL"), "-[UIDocumentPickerViewController initForExportingURLs:asCopy:]");

  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = v6;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    v12 = *MEMORY[0x1E0C99A90];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v13);
        v15 = objc_msgSend(v14, "startAccessingSecurityScopedResource");
        objc_msgSend(v14, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerViewController.m"), 235, CFSTR("%s must be called with a URL pointing to a file"), "-[UIDocumentPickerViewController initForExportingURLs:asCopy:]");

        }
        v31 = 0;
        v32 = 0;
        v17 = objc_msgSend(v14, "getPromisedItemResourceValue:forKey:error:", &v32, v12, &v31);
        v18 = v32;
        v19 = v31;
        if ((v17 & 1) != 0)
        {
          if (!v15)
            goto LABEL_15;
LABEL_14:
          objc_msgSend(v14, "stopAccessingSecurityScopedResource");
          goto LABEL_15;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerViewController.m"), 239, CFSTR("%s must be called with a URL pointing to an existing file: %@"), "-[UIDocumentPickerViewController initForExportingURLs:asCopy:]", v19);

        if (v15)
          goto LABEL_14;
LABEL_15:

        ++v13;
      }
      while (v10 != v13);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v10 = v22;
    }
    while (v22);
  }

  v30.receiver = self;
  v30.super_class = (Class)UIDocumentPickerViewController;
  v23 = -[UIViewController initWithNibName:bundle:](&v30, sel_initWithNibName_bundle_, 0, 0);
  v24 = v23;
  if (v23)
  {
    -[UIDocumentPickerViewController setDocumentPickerMode:](v23, "setDocumentPickerMode:", v27);
    -[UIDocumentPickerViewController setUploadURLs:](v24, "setUploadURLs:", v8);
    -[UIDocumentPickerViewController _commonInitWithDocumentTypes:](v24, MEMORY[0x1E0C9AA60]);
  }

  return v24;
}

- (UIDocumentPickerViewController)initForExportingURLs:(NSArray *)urls
{
  return -[UIDocumentPickerViewController initForExportingURLs:asCopy:](self, "initForExportingURLs:asCopy:", urls, 0);
}

- (id)_initForImportingDocumentsWithConversionRules:(id)a3
{
  id v4;
  UIDocumentPickerViewController *v5;
  UIDocumentPickerViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIDocumentPickerViewController;
  v5 = -[UIViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[UIDocumentPickerViewController setDocumentPickerMode:](v5, "setDocumentPickerMode:", 0);
    -[UIDocumentPickerViewController _setAutomaticallyDismissesAfterCompletion:](v6, "_setAutomaticallyDismissesAfterCompletion:", 1);
    objc_msgSend(getDOCConfigurationClass(), "configurationForImportingDocumentsWithConversionRules:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentPickerViewController setConfiguration:](v6, "setConfiguration:", v7);

    -[UIDocumentPickerViewController configuration](v6, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setForPickingDocuments:", 1);

    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "userInterfaceIdiom") != 0;

      -[UIViewController setModalPresentationStyle:](v6, "setModalPresentationStyle:", v10);
    }
  }

  return v6;
}

- (void)setAllowsMultipleSelection:(BOOL)allowsMultipleSelection
{
  _BOOL8 v3;
  id v4;

  v3 = allowsMultipleSelection;
  self->_allowsMultipleSelection = allowsMultipleSelection;
  -[UIDocumentPickerViewController _childViewController](self, "_childViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsPickingMultipleItems:", v3);

}

- (BOOL)shouldShowFileExtensions
{
  void *v2;
  char v3;

  -[UIDocumentPickerViewController _childViewController](self, "_childViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldShowFileExtensions");

  return v3;
}

- (void)setShouldShowFileExtensions:(BOOL)shouldShowFileExtensions
{
  _BOOL8 v3;
  id v4;

  v3 = shouldShowFileExtensions;
  -[UIDocumentPickerViewController _childViewController](self, "_childViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldShowFileExtensions:", v3);

}

- (unint64_t)pickerUserInterfaceStyle
{
  void *v2;
  uint64_t v3;

  -[UIDocumentPickerViewController _childViewController](self, "_childViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "browserUserInterfaceStyle");

  return v3 == 1;
}

- (void)setPickerUserInterfaceStyle:(unint64_t)a3
{
  uint64_t v3;
  id v4;

  if (a3 == 2)
    v3 = 2;
  else
    v3 = a3 == 1;
  -[UIDocumentPickerViewController _childViewController](self, "_childViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBrowserUserInterfaceStyle:", v3);

}

- (id)_initIgnoringApplicationEntitlementForImportOfTypes:(id)a3
{
  return -[UIDocumentPickerViewController initWithDocumentTypes:inMode:](self, "initWithDocumentTypes:inMode:", a3, 0);
}

- (void)documentBrowser:(id)a3 didPickDocumentURLs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  _QWORD v14[5];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7 || !objc_msgSend(v7, "count"))
  {
    _UIDocumentLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = (id)objc_opt_class();
      v13 = v16;
      _os_log_error_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "%@ : didPickDocumentURLs called with nil or 0 URLS", buf, 0xCu);

    }
    -[UIViewController presentingViewController](self, "presentingViewController");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10
      && (v11 = (void *)v10,
          v12 = -[UIDocumentPickerViewController _automaticallyDismissesAfterCompletion](self, "_automaticallyDismissesAfterCompletion"), v11, v12))
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __70__UIDocumentPickerViewController_documentBrowser_didPickDocumentURLs___block_invoke;
      v14[3] = &unk_1E16B1B28;
      v14[4] = self;
      -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v14);
    }
    else
    {
      -[UIDocumentPickerViewController _tellDelegateDocumentPickerWasCancelled](self, "_tellDelegateDocumentPickerWasCancelled");
    }
  }
  if (objc_msgSend(v8, "count"))
    -[UIDocumentPickerViewController _callDelegateWithSelectedURLsAndDismiss:](self, "_callDelegateWithSelectedURLsAndDismiss:", v8);

}

uint64_t __70__UIDocumentPickerViewController_documentBrowser_didPickDocumentURLs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tellDelegateDocumentPickerWasCancelled");
}

- (UIDocumentPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99778];
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = objc_opt_class();
  NSStringFromSelector(sel_initWithDocumentTypes_inMode_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithURL_inMode_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("You cannot initialize a %@ except by the %@ and %@ initializers."), v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v13, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v14);
}

- (void)_setIsContentManaged:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_isContentManaged = a3;
  -[UIDocumentPickerViewController configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _UIShimSetIsContentManaged(v4, v3);

}

- (void)_setForPickingDownloadsFolder:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v3 = a3;
  -[UIDocumentPickerViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[UIDocumentPickerViewController configuration](self, "configuration");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v7, CFSTR("forPickingDownloadsFolder"));

  }
}

- (BOOL)_forPickingDownloadsFolder
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;

  -[UIDocumentPickerViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[UIDocumentPickerViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("forPickingDownloadsFolder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (int64_t)modalPresentationStyle
{
  return 2;
}

- (void)viewDidLoad
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  UIBarButtonItem *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)UIDocumentPickerViewController;
  -[UIViewController viewDidLoad](&v11, sel_viewDidLoad);
  if (!self->_childViewController)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v3 = (void *)qword_1ECD79D68;
    v16 = qword_1ECD79D68;
    if (!qword_1ECD79D68)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getUIDocumentBrowserViewControllerClass_block_invoke;
      v12[3] = &unk_1E16B14C0;
      v12[4] = &v13;
      __getUIDocumentBrowserViewControllerClass_block_invoke((uint64_t)v12);
      v3 = (void *)v14[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v13, 8);
    v5 = [v4 alloc];
    -[UIDocumentPickerViewController configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithConfiguration:", v6);

    objc_msgSend(v7, "setAllowsDocumentCreation:", 0);
    objc_msgSend(v7, "setDelegate:", self);
    v8 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 1, self, sel__didTapCancel);
    objc_msgSend(v7, "setAllowsPickingMultipleItems:", self->_allowsMultipleSelection);
    v17[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAdditionalTrailingNavigationBarButtonItems:", v9);

    -[UIDocumentPickerViewController _setChildViewController:](self, "_setChildViewController:", v7);
    -[UIViewController presentationController](self, "presentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", self);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIDocumentPickerViewController;
  -[UIViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[UIDocumentPickerViewController directoryURL](self, "directoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIDocumentPickerViewController _childViewController](self, "_childViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentPickerViewController directoryURL](self, "directoryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "revealDocumentAtURL:importIfNeeded:completion:", v6, 0, &__block_literal_global_155);

  }
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *securityScopedURLs;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_securityScopedURLs;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "stopAccessingSecurityScopedResource");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  securityScopedURLs = self->_securityScopedURLs;
  self->_securityScopedURLs = 0;

  -[UIDocumentPickerViewController setDelegate:](self, "setDelegate:", 0);
  v9.receiver = self;
  v9.super_class = (Class)UIDocumentPickerViewController;
  -[UIViewController dealloc](&v9, sel_dealloc);
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  void *v3;

  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_1EDED45C0))
  {
    -[UIViewController _containedRemoteViewController](self->_childViewController, "_containedRemoteViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (_UIRemoteViewController *)v3;
}

- (void)_setChildViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *childViewController;
  UIViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;

  v5 = (UIViewController *)a3;
  if (self->_childViewController)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentPickerViewController.m"), 607, CFSTR("%s: remote view controller can only be set once"), "-[UIDocumentPickerViewController _setChildViewController:]");

    childViewController = self->_childViewController;
  }
  else
  {
    childViewController = 0;
  }
  self->_childViewController = v5;
  v7 = v5;

  -[UIViewController beginAppearanceTransition:animated:](self->_childViewController, "beginAppearanceTransition:animated:", 1, 0);
  -[UIViewController addChildViewController:](self, "addChildViewController:", self->_childViewController);
  -[UIViewController view](self->_childViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_childViewController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  -[UIViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D156E0];
  -[UIViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_childViewController, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 7, 0, v14, 7, 1.0, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addConstraint:", v15);

  -[UIViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0D156E0];
  -[UIViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_childViewController, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 8, 0, v19, 8, 1.0, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addConstraint:", v20);

  -[UIViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0D156E0];
  -[UIViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_childViewController, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 1, 0, v24, 1, 1.0, 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addConstraint:", v25);

  -[UIViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x1E0D156E0];
  -[UIViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_childViewController, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v28, 3, 0, v29, 3, 1.0, 0.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addConstraint:", v30);

  -[UIViewController didMoveToParentViewController:](self->_childViewController, "didMoveToParentViewController:", self);
  -[UIViewController endAppearanceTransition](self->_childViewController, "endAppearanceTransition");
  -[UIViewController preferredContentSize](self->_childViewController, "preferredContentSize");
  v32 = v31;
  v34 = v33;

  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", v32, v34);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIDocumentPickerViewController;
  v4 = a3;
  -[UIViewController preferredContentSizeDidChangeForChildContentContainer:](&v9, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  v6 = v5;
  v8 = v7;

  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)_tellDelegateDocumentPickerWasCancelled
{
  void *v3;
  id v4;

  -[UIDocumentPickerViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "documentPickerWasCancelled:", self);
  -[UIDocumentPickerViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "documentPickerWasCancelled:completion:", self, &__block_literal_global_109_0);

}

- (void)_callDelegateWithSelectedURLsAndDismiss:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void (**v14)(_QWORD);
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  void (**v24)(_QWORD);
  _QWORD aBlock[5];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIViewController presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((dyld_program_sdk_at_least() & 1) == 0
    && -[UIDocumentPickerViewController documentPickerMode](self, "documentPickerMode") == UIDocumentPickerModeOpen)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v28;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v10);
          v12 = (void *)MEMORY[0x186DC9484]();
          -[UIDocumentPickerViewController _consumeSandboxExtensionForURL:](self, "_consumeSandboxExtensionForURL:", v11);
          objc_autoreleasePoolPop(v12);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v8);
    }

  }
  if (!dyld_program_sdk_at_least())
  {
    -[UIDocumentPickerViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    -[UIDocumentPickerViewController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if ((v16 & 1) != 0)
    {
      objc_msgSend(v17, "documentPicker:didPickDocumentsAtURLs:", self, v4);
    }
    else
    {
      v19 = objc_opt_respondsToSelector();

      if ((v19 & 1) == 0)
      {
LABEL_20:
        objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
        goto LABEL_26;
      }
      -[UIDocumentPickerViewController delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "documentPicker:didPickDocumentAtURL:", self, v20);

    }
    goto LABEL_20;
  }
  if (v5)
  {
    v13 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__UIDocumentPickerViewController__callDelegateWithSelectedURLsAndDismiss___block_invoke;
    aBlock[3] = &unk_1E16B1B50;
    aBlock[4] = self;
    v26 = v4;
    v14 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (-[UIDocumentPickerViewController _automaticallyDismissesAfterCompletion](self, "_automaticallyDismissesAfterCompletion"))
    {
      v23[0] = v13;
      v23[1] = 3221225472;
      v23[2] = __74__UIDocumentPickerViewController__callDelegateWithSelectedURLsAndDismiss___block_invoke_2;
      v23[3] = &unk_1E16B1BF8;
      v24 = v14;
      objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v23);

    }
    else
    {
      v14[2](v14);
    }

  }
  else
  {
    -[UIDocumentPickerViewController delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "documentPicker:didPickDocumentAtURL:completion:", self, v22, &__block_literal_global_116);

    }
  }
LABEL_26:

}

void __74__UIDocumentPickerViewController__callDelegateWithSelectedURLsAndDismiss___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "documentPicker:didPickDocumentsAtURLs:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "documentPicker:didPickDocumentAtURL:", v6, v7);

  }
}

uint64_t __74__UIDocumentPickerViewController__callDelegateWithSelectedURLsAndDismiss___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_didTapCancel
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  _QWORD v6[5];

  -[UIViewController presentingViewController](self, "presentingViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        v5 = -[UIDocumentPickerViewController _automaticallyDismissesAfterCompletion](self, "_automaticallyDismissesAfterCompletion"), v4, v5))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__UIDocumentPickerViewController__didTapCancel__block_invoke;
    v6[3] = &unk_1E16B1B28;
    v6[4] = self;
    -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v6);
  }
  else
  {
    -[UIDocumentPickerViewController _tellDelegateDocumentPickerWasCancelled](self, "_tellDelegateDocumentPickerWasCancelled");
  }
}

uint64_t __47__UIDocumentPickerViewController__didTapCancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tellDelegateDocumentPickerWasCancelled");
}

- (void)_consumeSandboxExtensionForURL:(id)a3
{
  NSMutableArray *securityScopedURLs;
  NSMutableArray *v5;
  NSMutableArray *v6;
  void *v7;
  id v8;

  v8 = a3;
  securityScopedURLs = self->_securityScopedURLs;
  if (!securityScopedURLs)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = self->_securityScopedURLs;
    self->_securityScopedURLs = v5;

    securityScopedURLs = self->_securityScopedURLs;
  }
  if ((unint64_t)-[NSMutableArray count](securityScopedURLs, "count") >= 0xA)
  {
    do
    {
      -[NSMutableArray firstObject](self->_securityScopedURLs, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stopAccessingSecurityScopedResource");

      -[NSMutableArray removeObjectAtIndex:](self->_securityScopedURLs, "removeObjectAtIndex:", 0);
    }
    while ((unint64_t)-[NSMutableArray count](self->_securityScopedURLs, "count") > 9);
  }
  if (objc_msgSend(v8, "startAccessingSecurityScopedResource"))
    -[NSMutableArray addObject:](self->_securityScopedURLs, "addObject:", v8);

}

- (NSMutableArray)_securityScopedURLs
{
  return self->_securityScopedURLs;
}

- (void)set_securityScopedURLs:(id)a3
{
  objc_storeStrong((id *)&self->_securityScopedURLs, a3);
}

- (BOOL)_ignoreApplicationEntitlementForImport
{
  return self->_ignoreApplicationEntitlementForImport;
}

- (void)_setIgnoreApplicationEntitlementForImport:(BOOL)a3
{
  self->_ignoreApplicationEntitlementForImport = a3;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (UIDocumentPickerMode)documentPickerMode
{
  return self->_documentPickerMode;
}

- (void)setDocumentPickerMode:(unint64_t)a3
{
  self->_documentPickerMode = a3;
}

- (BOOL)allowsMultipleSelection
{
  return self->_allowsMultipleSelection;
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (void)setDirectoryURL:(NSURL *)directoryURL
{
  objc_setProperty_nonatomic_copy(self, a2, directoryURL, 1008);
}

- (NSArray)documentTypes
{
  return self->_documentTypes;
}

- (void)setDocumentTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (UIViewController)_childViewController
{
  return self->_childViewController;
}

- (NSArray)uploadURLs
{
  return self->_uploadURLs;
}

- (void)setUploadURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (DOCConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (BOOL)_isContentManaged
{
  return self->_isContentManaged;
}

- (BOOL)_automaticallyDismissesAfterCompletion
{
  return self->_automaticallyDismissesAfterCompletion;
}

- (void)_setAutomaticallyDismissesAfterCompletion:(BOOL)a3
{
  self->_automaticallyDismissesAfterCompletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_uploadURLs, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_documentTypes, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_securityScopedURLs, 0);
  objc_storeStrong((id *)&self->_weak_delegate, 0);
}

@end
