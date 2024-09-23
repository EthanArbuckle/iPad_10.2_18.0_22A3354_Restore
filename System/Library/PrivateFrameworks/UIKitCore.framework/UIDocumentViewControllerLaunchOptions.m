@implementation UIDocumentViewControllerLaunchOptions

- (UIDocumentViewControllerLaunchOptions)init
{
  return (UIDocumentViewControllerLaunchOptions *)-[UIDocumentViewControllerLaunchOptions initWithDocumentViewController:](self, 0);
}

- (id)initWithDocumentViewController:(void *)a1
{
  id *v3;
  id *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  objc_super v15;

  if (!a1)
    return 0;
  v15.receiver = a1;
  v15.super_class = (Class)UIDocumentViewControllerLaunchOptions;
  v3 = (id *)objc_msgSendSuper2(&v15, sel_init);
  v4 = v3;
  if (v3)
  {
    objc_storeWeak(v3 + 15, a2);
    -[UIDocumentViewControllerLaunchOptions defaultBrowserViewController](v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v4[4];
    v4[4] = (id)v5;

    objc_msgSend((id)UIApp, "_localizedApplicationName");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v4[5];
    v4[5] = (id)v7;

    -[UIDocumentViewControllerLaunchOptions defaultBrowserViewController](v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "allowsDocumentCreation") & 1) != 0)
    {
      +[UIDocumentViewControllerLaunchOptions createDocumentActionWithIntent:](UIDocumentViewControllerLaunchOptions, "createDocumentActionWithIntent:", CFSTR("UIDocumentCreationIntentDefault"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v4[6];
      v4[6] = (id)v10;
    }
    else
    {
      v11 = v4[6];
      v4[6] = 0;
    }

    +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v4[10];
    v4[10] = (id)v12;

  }
  return v4;
}

- (id)defaultBrowserViewController
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v2 = a1 + 11;
  v3 = a1[11];
  if (!v3)
  {
    +[_UIApplicationInfoParser mainBundleInfoParser](_UIApplicationInfoParser, "mainBundleInfoParser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewerRoleDocumentUTTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIApplicationInfoParser mainBundleInfoParser](_UIApplicationInfoParser, "mainBundleInfoParser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "editorRoleDocumentUTTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v9 = (void *)qword_1ECD81C28;
    v16 = qword_1ECD81C28;
    if (!qword_1ECD81C28)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getUIDocumentBrowserViewControllerClass_block_invoke_2;
      v12[3] = &unk_1E16B14C0;
      v12[4] = &v13;
      __getUIDocumentBrowserViewControllerClass_block_invoke_2((uint64_t)v12);
      v9 = (void *)v14[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v13, 8);
    v3 = (id)objc_msgSend([v10 alloc], "initForOpeningContentTypes:", v8);
    objc_msgSend(v3, "setAllowsDocumentCreation:", objc_msgSend(v7, "count") != 0);
    objc_msgSend(a1, "_prepareBrowserViewController:", v3);
    objc_storeStrong(v2, v3);

  }
  return v3;
}

- (void)setBrowserViewController:(id)a3
{
  UIDocumentBrowserViewController **p_browserViewController;
  UIDocumentBrowserViewController *browserViewController;

  browserViewController = self->_browserViewController;
  p_browserViewController = &self->_browserViewController;
  if (browserViewController != a3)
  {
    objc_storeStrong((id *)p_browserViewController, a3);
    -[UIDocumentViewControllerLaunchOptions _prepareBrowserViewController:](self, "_prepareBrowserViewController:", a3);
    -[UIDocumentViewControllerLaunchOptions _setNeedsUpdateDocumentUnavailableConfiguration](self, "_setNeedsUpdateDocumentUnavailableConfiguration");
  }
}

- (void)setTitle:(id)a3
{
  NSString *v5;
  NSString *title;

  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    v5 = (NSString *)objc_msgSend(a3, "copy");
    title = self->_title;
    self->_title = v5;

    -[UIDocumentViewControllerLaunchOptions _setNeedsUpdateDocumentUnavailableConfiguration](self, "_setNeedsUpdateDocumentUnavailableConfiguration");
  }
}

- (void)setPrimaryAction:(id)a3
{
  UIAction *v4;
  UIAction *primaryAction;

  if (self->_primaryAction != a3)
  {
    v4 = (UIAction *)objc_msgSend(a3, "copy");
    primaryAction = self->_primaryAction;
    self->_primaryAction = v4;

    -[UIDocumentViewControllerLaunchOptions _setNeedsUpdateDocumentUnavailableConfiguration](self, "_setNeedsUpdateDocumentUnavailableConfiguration");
  }
}

- (void)setSecondaryAction:(id)a3
{
  UIAction *v4;
  UIAction *secondaryAction;

  if (self->_secondaryAction != a3)
  {
    v4 = (UIAction *)objc_msgSend(a3, "copy");
    secondaryAction = self->_secondaryAction;
    self->_secondaryAction = v4;

    -[UIDocumentViewControllerLaunchOptions _setNeedsUpdateDocumentUnavailableConfiguration](self, "_setNeedsUpdateDocumentUnavailableConfiguration");
  }
}

- (void)setDocumentTargetView:(id)a3
{
  UIView **p_documentTargetView;
  UIView *documentTargetView;

  documentTargetView = self->_documentTargetView;
  p_documentTargetView = &self->_documentTargetView;
  if (documentTargetView != a3)
  {
    objc_storeStrong((id *)p_documentTargetView, a3);
    -[UIDocumentViewControllerLaunchOptions _setNeedsUpdateDocumentUnavailableConfiguration](self, "_setNeedsUpdateDocumentUnavailableConfiguration");
  }
  *(_BYTE *)&self->_flags |= 2u;
}

- (UIView)documentTargetView
{
  id WeakRetained;
  UIView *v3;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = self->_documentTargetView;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->__documentViewController);
    objc_msgSend(WeakRetained, "viewIfLoaded");
    v3 = (UIView *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setBackground:(id)a3
{
  UIBackgroundConfiguration **p_background;

  p_background = &self->_background;
  if ((-[UIBackgroundConfiguration _isEqualToConfiguration:]((uint64_t)self->_background, a3) & 1) == 0)
  {
    objc_storeStrong((id *)p_background, a3);
    -[UIDocumentViewControllerLaunchOptions _setNeedsUpdateDocumentUnavailableConfiguration](self, "_setNeedsUpdateDocumentUnavailableConfiguration");
  }
}

- (void)setForegroundAccessoryView:(id)a3
{
  UIView **p_foregroundAccessoryView;
  UIView *foregroundAccessoryView;

  foregroundAccessoryView = self->_foregroundAccessoryView;
  p_foregroundAccessoryView = &self->_foregroundAccessoryView;
  if (foregroundAccessoryView != a3)
  {
    objc_storeStrong((id *)p_foregroundAccessoryView, a3);
    -[UIDocumentViewControllerLaunchOptions _setNeedsUpdateDocumentUnavailableConfiguration](self, "_setNeedsUpdateDocumentUnavailableConfiguration");
  }
}

- (void)setBackgroundAccessoryView:(id)a3
{
  UIView **p_backgroundAccessoryView;
  UIView *backgroundAccessoryView;

  backgroundAccessoryView = self->_backgroundAccessoryView;
  p_backgroundAccessoryView = &self->_backgroundAccessoryView;
  if (backgroundAccessoryView != a3)
  {
    objc_storeStrong((id *)p_backgroundAccessoryView, a3);
    -[UIDocumentViewControllerLaunchOptions _setNeedsUpdateDocumentUnavailableConfiguration](self, "_setNeedsUpdateDocumentUnavailableConfiguration");
  }
}

- (void)_setSecondaryMenu:(id)a3
{
  UIMenu **p_secondaryMenu;
  UIMenu *secondaryMenu;

  secondaryMenu = self->_secondaryMenu;
  p_secondaryMenu = &self->_secondaryMenu;
  if (secondaryMenu != a3)
  {
    objc_storeStrong((id *)p_secondaryMenu, a3);
    -[UIDocumentViewControllerLaunchOptions _setNeedsUpdateDocumentUnavailableConfiguration](self, "_setNeedsUpdateDocumentUnavailableConfiguration");
  }
}

+ (id)createDocumentActionWithIntent:(id)a3
{
  return +[_UIDocumentUnavailableConfiguration createDocumentActionWithIntent:]((uint64_t)_UIDocumentUnavailableConfiguration, a3);
}

- (void)_setNeedsUpdateDocumentUnavailableConfiguration
{
  UIDocumentViewControllerLaunchOptions *v2;

  if (self)
    self = (UIDocumentViewControllerLaunchOptions *)objc_loadWeakRetained((id *)&self->__documentViewController);
  v2 = self;
  -[UIDocumentViewController _setNeedsUpdateDocumentUnavailableConfiguration](self);

}

- (void)_documentDidChange
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  id v8;
  id v9;

  if (a1)
  {
    v9 = a1[4];
    if (objc_msgSend(v9, "isViewLoaded"))
      objc_msgSend(v9, "_endTransitionCoordinatorSession");
    WeakRetained = objc_loadWeakRetained(a1 + 15);
    objc_msgSend(WeakRetained, "document");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v3, "fileURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(a1 + 12, v4);
      if (objc_msgSend(v9, "isViewLoaded"))
        objc_msgSend(v9, "_beginTransitionCoordinatorSessionForDocumentURL:", v4);
      if ((_UIDocumentViewControllerWantsUIPDocumentLanding() & 1) == 0 && (objc_msgSend(v3, "documentState") & 1) == 0)
        objc_msgSend(a1, "_dismissBrowserViewController");

    }
    v5 = a1[13];
    if (v5)
    {
      objc_msgSend(v3, "fileURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqual:", v5);

      if ((v7 & 1) == 0)
      {
        v8 = a1[13];
        a1[13] = 0;

      }
    }

  }
}

- (void)_documentCloseStateDidChange
{
  id WeakRetained;
  id v3;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 15);
    objc_msgSend(WeakRetained, "document");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    if ((_UIDocumentViewControllerWantsUIPDocumentLanding() & 1) == 0 && (objc_msgSend(v3, "documentState") & 1) == 0)
      objc_msgSend(a1, "_dismissBrowserViewController");
    objc_msgSend(a1, "_setNeedsUpdateDocumentUnavailableConfiguration");

  }
}

- (void)_documentProgressStateDidChange
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a1)
  {
    v7 = *(id *)(a1 + 32);
    if (objc_msgSend(v7, "isViewLoaded"))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
      objc_msgSend(WeakRetained, "document");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "fileURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "transitionControllerForDocumentAtURL:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "progress");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setLoadingProgress:", v6);

    }
  }
}

- (void)documentLandingBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  void *v6;
  char v7;
  id v8;

  objc_msgSend(a3, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
  {
    objc_msgSend(a4, "firstObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[UIDocumentViewControllerLaunchOptions _replaceDocumentWithDocumentAtURL:isImport:](self, "_replaceDocumentWithDocumentAtURL:isImport:", v8, 0);

  }
}

- (void)documentLandingBrowser:(id)a3 didRequestDocumentCreationWithHandler:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  unint64_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  unint64_t v35;
  NSObject *v36;
  const char *v37;
  unint64_t v38;
  void *v39;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  const __CFString *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "contentTypesForRecentDocuments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  +[_UIApplicationInfoParser mainBundleInfoParser](_UIApplicationInfoParser, "mainBundleInfoParser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "editorRoleDocumentUTTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (!v13)
  {
LABEL_9:

LABEL_19:
    if (objc_msgSend(v12, "count"))
    {
      v35 = _MergedGlobals_1262;
      if (!_MergedGlobals_1262)
      {
        v35 = __UILogCategoryGetNode("UIDocument", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v35, (unint64_t *)&_MergedGlobals_1262);
      }
      v36 = *(NSObject **)(v35 + 8);
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      *(_WORD *)buf = 0;
      v37 = "Unable to create document. The UIDocumentBrowserViewController supports no content types that have a UIDocum"
            "ent subclass with an editor role defined in the Info.plist's CFBundleDocumentTypes dictionary.";
    }
    else
    {
      v38 = qword_1ECD81C18;
      if (!qword_1ECD81C18)
      {
        v38 = __UILogCategoryGetNode("UIDocument", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v38, (unint64_t *)&qword_1ECD81C18);
      }
      v36 = *(NSObject **)(v38 + 8);
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      *(_WORD *)buf = 0;
      v37 = "Unable to create document. Ensure a UIDocument subclass with an editor role is defined in the Info.plist's C"
            "FBundleDocumentTypes dictionary.";
    }
    _os_log_impl(&dword_185066000, v36, OS_LOG_TYPE_ERROR, v37, buf, 2u);
LABEL_29:
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
    goto LABEL_30;
  }
  v14 = v13;
  v15 = *(_QWORD *)v46;
LABEL_3:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v46 != v15)
      objc_enumerationMutation(v12);
    v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v16);
    if ((objc_msgSend(v11, "containsObject:", v17) & 1) != 0)
      break;
    if (v14 == ++v16)
    {
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v14)
        goto LABEL_3;
      goto LABEL_9;
    }
  }
  v18 = v17;

  if (!v18)
    goto LABEL_19;
  +[_UIApplicationInfoParser mainBundleInfoParser](_UIApplicationInfoParser, "mainBundleInfoParser");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "utTypeToDocumentClassMap");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(v20, "objectForKeyedSubscript:", v18);
  if (!v21 || (objc_msgSend(v21, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentViewControllerLaunchOptions.m"), 256, CFSTR("Expected UIDocument subclass for %@. Received: %@"), v18, v21);

  }
  objc_msgSend(a3, "activeDocumentCreationIntent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("UIDocumentCreationIntentDefault"));

  if ((v23 & 1) == 0)
  {
    v24 = qword_1ECD81C20;
    if (!qword_1ECD81C20)
    {
      v24 = __UILogCategoryGetNode("UIDocument", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v24, (unint64_t *)&qword_1ECD81C20);
    }
    v25 = *(NSObject **)(v24 + 8);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = v25;
      objc_msgSend(a3, "activeDocumentCreationIntent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v50 = CFSTR("UIDocumentCreationIntentDefault");
      v51 = 2112;
      v52 = v27;
      _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_ERROR, "UIDocumentBrowserViewController requested the creation of a document with an app-defined intent. Falling back to creating a document for %@. To control the document created for %@, implement -[UIDocumentBrowserViewControllerDelegate documentBrowser:didRequestDocumentCreationWithHandler:].", buf, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "temporaryDirectory");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  _UILocalizedString(CFSTR("com.apple.documents.untitled.document"), (uint64_t)CFSTR("The default title of a new document."), CFSTR("Untitled"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "URLByAppendingPathComponent:conformingToType:", v30, v18);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)objc_msgSend(objc_alloc((Class)v21), "initWithFileURL:", v31);
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __102__UIDocumentViewControllerLaunchOptions_documentLandingBrowser_didRequestDocumentCreationWithHandler___block_invoke;
  v41[3] = &unk_1E16C3FE0;
  v43 = v31;
  v44 = a4;
  v42 = v32;
  v33 = v31;
  v34 = v32;
  objc_msgSend(v34, "saveToURL:forSaveOperation:completionHandler:", v33, 0, v41);

LABEL_30:
}

void __102__UIDocumentViewControllerLaunchOptions_documentLandingBrowser_didRequestDocumentCreationWithHandler___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __102__UIDocumentViewControllerLaunchOptions_documentLandingBrowser_didRequestDocumentCreationWithHandler___block_invoke_2;
    v5[3] = &unk_1E16C5E00;
    v4 = *(_OWORD *)(a1 + 40);
    v3 = (id)v4;
    v6 = v4;
    objc_msgSend(v2, "closeWithCompletionHandler:", v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __102__UIDocumentViewControllerLaunchOptions_documentLandingBrowser_didRequestDocumentCreationWithHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), 2);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, 0);
}

- (void)documentLandingBrowserWillStartDocumentCreation:(id)a3
{
  char flags;
  void *v6;
  void *v8;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentViewControllerLaunchOptions.m"), 294, CFSTR("UIKit internal inconsistency: attempted to begin document creation session whilst an existing session is active"));

    flags = (char)self->_flags;
  }
  *(_BYTE *)&self->_flags = flags | 1;
  objc_msgSend(a3, "activeDocumentCreationIntent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_documentCreationIntent, v6);

  -[UIDocumentViewControllerLaunchOptions _setNeedsUpdateDocumentUnavailableConfiguration](self, "_setNeedsUpdateDocumentUnavailableConfiguration");
}

- (void)documentLandingBrowserDidEndDocumentCreation:(id)a3 importedURL:(id)a4 canceled:(BOOL)a5 error:(id)a6
{
  unint64_t v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)&self->_flags &= ~1u;
  if (a6)
  {
    v10 = documentLandingBrowserDidEndDocumentCreation_importedURL_canceled_error____s_category;
    if (!documentLandingBrowserDidEndDocumentCreation_importedURL_canceled_error____s_category)
    {
      v10 = __UILogCategoryGetNode("UIDocument", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&documentLandingBrowserDidEndDocumentCreation_importedURL_canceled_error____s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = a6;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Failed to create document. Error: %@", (uint8_t *)&v16, 0xCu);
    }
    objc_msgSend(a3, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0)
      -[UIDocumentViewControllerLaunchOptions _presentAlertForDocumentAtURL:error:isImport:](self, "_presentAlertForDocumentAtURL:error:isImport:", a4, a6, 1);
  }
  objc_storeStrong((id *)&self->_createdDocumentURL, a4);
  -[UIDocumentViewControllerLaunchOptions _setNeedsUpdateDocumentUnavailableConfiguration](self, "_setNeedsUpdateDocumentUnavailableConfiguration");
  if (a4)
  {
    objc_msgSend(a3, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) == 0)
      -[UIDocumentViewControllerLaunchOptions _replaceDocumentWithDocumentAtURL:isImport:](self, "_replaceDocumentWithDocumentAtURL:isImport:", a4, 1);
  }
}

- (void)_replaceDocumentWithDocumentAtURL:(id)a3 isImport:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;
  id WeakRetained;
  id v10;

  v4 = a4;
  v10 = 0;
  +[UIDocument _documentWithContentsOfFileURL:error:](UIDocument, "_documentWithContentsOfFileURL:error:", a3, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  if (v7)
  {
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->__documentViewController);
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "setDocument:", v7);

  }
  else
  {
    -[UIDocumentViewControllerLaunchOptions _presentAlertForDocumentAtURL:error:isImport:](self, "_presentAlertForDocumentAtURL:error:isImport:", a3, v8, v4);
  }

}

- (void)_presentAlertForDocumentAtURL:(id)a3 error:(id)a4 isImport:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v5 = a5;
  v7 = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayNameAtPath:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v5)
  {
    _UILocalizedString(CFSTR("com.apple.documents.error.import.title"), (uint64_t)CFSTR("The title of an alert presented when a document could not be imported."), CFSTR("Unable to Import Document"));
    v31 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      _UILocalizedFormat(CFSTR("com.apple.documents.error.import.message"), (uint64_t)CFSTR("The message of an alert presented when a document could not be imported."), CFSTR("The document “%@” could not be imported."), v11, v12, v13, v14, v15, (uint64_t)v7);
LABEL_8:
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  else
  {
    _UILocalizedString(CFSTR("com.apple.documents.error.open.title"), (uint64_t)CFSTR("The title of an alert presented when a document could not be opened."), CFSTR("Unable to Open Document"));
    v31 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      _UILocalizedFormat(CFSTR("com.apple.documents.error.open.message"), (uint64_t)CFSTR("The message of an alert presented when a document could not be opened."), CFSTR("The document “%@” could not be opened."), v16, v17, v18, v19, v20, (uint64_t)v7);
      goto LABEL_8;
    }
  }
  v21 = 0;
LABEL_10:
  objc_msgSend(a4, "localizedFailureReason");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    v24 = v22;
  }
  else
  {
    objc_msgSend(a4, "localizedDescription");
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;

  if (v21 && objc_msgSend(v25, "length"))
  {
    objc_msgSend(v21, "stringByAppendingFormat:", CFSTR(" %@"), v25);
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = v25;
  }
  v27 = v26;

  +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v31, v27, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  _UILocalizedString(CFSTR("OK"), (uint64_t)CFSTR("Dismiss button of an alert when opening a document failed"), CFSTR("OK"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v29, 1, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addAction:", v30);

  if (self)
    self = (UIDocumentViewControllerLaunchOptions *)objc_loadWeakRetained((id *)&self->__documentViewController);
  -[UIDocumentViewControllerLaunchOptions presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v28, 1, 0);

}

- (id)_documentUnavailableConfiguration
{
  _UIDocumentUnavailableConfiguration *v2;
  void *v3;
  id *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  char v22;
  _BYTE *v23;
  BOOL v24;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  v2 = [_UIDocumentUnavailableConfiguration alloc];
  objc_msgSend((id)a1, "browserViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIDocumentUnavailableConfiguration initWithBrowserViewController:](v2, v3);

  objc_msgSend((id)a1, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v5, v6, 56);

  objc_msgSend((id)a1, "primaryAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v7, v8, 64);

  objc_msgSend((id)a1, "secondaryAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v9, v10, 72);

  objc_msgSend((id)a1, "documentTargetView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentUnavailableConfiguration setDocumentTargetView:]((uint64_t)v4, v11);

  objc_msgSend((id)a1, "background");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBackgroundConfiguration _setStrokeColor:]((uint64_t)v4, v12);

  objc_msgSend((id)a1, "foregroundAccessoryView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionLayoutSectionListSolver setPreferredSizes:]((uint64_t)v4, v13);

  objc_msgSend((id)a1, "backgroundAccessoryView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentUnavailableConfiguration setBackgroundAccessoryView:]((uint64_t)v4, v14);

  objc_msgSend((id)a1, "_secondaryMenu");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentUnavailableConfiguration _setSecondaryMenu:]((uint64_t)v4, v15);

  -[_UICollectionCompositionalLayoutSolverOptions setLayoutAttributesClass:]((uint64_t)v4, *(void **)(a1 + 96));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  objc_msgSend(WeakRetained, "document");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if ((objc_msgSend(v17, "documentState") & 1) != 0)
      v18 = 9;
    else
      v18 = 1;
    objc_msgSend(v17, "fileURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqual:", *(_QWORD *)(a1 + 104));

    if (v20)
      v21 = v18 | 4;
    else
      v21 = v18;
  }
  else
  {
    v21 = 0;
  }
  v22 = *(_BYTE *)(a1 + 8);

  if (v4)
    v4[4] = (id)(v21 | (2 * (v22 & 1)));
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v4, *(void **)(a1 + 112));
  if ((_UIDocumentViewControllerWantsUIPDocumentLanding() & 1) != 0)
  {
    v23 = objc_loadWeakRetained((id *)(a1 + 120));
    if (v23)
    {
      v24 = (v23[968] & 1) == 0;
      if (!v4)
      {
LABEL_22:

        return v4;
      }
    }
    else
    {
      v24 = 1;
      if (!v4)
        goto LABEL_22;
    }
    *((_BYTE *)v4 + 8) = v24;
    goto LABEL_22;
  }
  if (v4)
    *((_BYTE *)v4 + 8) = 0;
  return v4;
}

- (void)_prepareBrowserViewController:(id)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIBarButtonItem *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "documentLandingPresenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "documentLandingPresenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentViewControllerLaunchOptions.m"), 422, CFSTR("Attempted to set browser view controller that is already associated with another launch options instance. Browser view controller: %@; Existing launch options: %@"),
      a3,
      v14);

  }
  objc_msgSend(a3, "setDocumentLandingPresenter:", self);
  if ((_UIDocumentViewControllerWantsUIPDocumentLanding() & 1) == 0)
  {
    objc_msgSend(a3, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setForPickingDocuments:", 1);

    objc_msgSend(a3, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShouldHideCatalystHostWindow:", 0);

    objc_msgSend(a3, "additionalTrailingNavigationBarButtonItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 1, self, sel__dismissBrowserViewController);
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "setAdditionalTrailingNavigationBarButtonItems:", v12);

  }
}

- (void)_dismissBrowserViewController
{
  void *v2;
  void *v3;
  id v4;

  -[UIDocumentViewControllerLaunchOptions browserViewController](self, "browserViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
    objc_msgSend(v4, "activePresentationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_sendDismissalsAsNeeded");

  }
}

- (UIMenu)_secondaryMenu
{
  return self->_secondaryMenu;
}

- (UIDocumentBrowserViewController)browserViewController
{
  return self->_browserViewController;
}

- (NSString)title
{
  return self->_title;
}

- (UIAction)primaryAction
{
  return self->_primaryAction;
}

- (UIAction)secondaryAction
{
  return self->_secondaryAction;
}

- (UIView)foregroundAccessoryView
{
  return self->_foregroundAccessoryView;
}

- (UIView)backgroundAccessoryView
{
  return self->_backgroundAccessoryView;
}

- (UIBackgroundConfiguration)background
{
  return self->_background;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__documentViewController);
  objc_storeStrong((id *)&self->_documentCreationIntent, 0);
  objc_storeStrong((id *)&self->_createdDocumentURL, 0);
  objc_storeStrong((id *)&self->_documentURL, 0);
  objc_storeStrong((id *)&self->_defaultBrowserViewController, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_backgroundAccessoryView, 0);
  objc_storeStrong((id *)&self->_foregroundAccessoryView, 0);
  objc_storeStrong((id *)&self->_secondaryAction, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_browserViewController, 0);
  objc_storeStrong((id *)&self->_secondaryMenu, 0);
  objc_storeStrong((id *)&self->_documentTargetView, 0);
}

@end
