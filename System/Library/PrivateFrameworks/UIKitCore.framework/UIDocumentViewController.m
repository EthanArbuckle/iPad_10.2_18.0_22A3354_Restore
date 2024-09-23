@implementation UIDocumentViewController

- (UIDocumentViewController)initWithDocument:(UIDocument *)document
{
  UIDocumentViewController *v4;
  UIDocumentViewController *v5;

  v4 = -[UIViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v5 = v4;
  if (v4)
    -[UIDocumentViewController setDocument:](v4, "setDocument:", document);
  return v5;
}

- (void)setDocument:(UIDocument *)document
{
  UIDocument **p_document;
  void *v6;
  void *v7;
  id *v8;
  int v9;

  p_document = &self->_document;
  if (self->_document != document)
  {
    -[UIDocumentViewController _unregisterDocumentObservers](self, "_unregisterDocumentObservers");
    -[UIDocumentViewController _unregisterDocumentAssociation](self, "_unregisterDocumentAssociation");
    -[UIDocumentViewController document](self, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentViewController _closeDocumentIfNecessary:completionHandler:](self, "_closeDocumentIfNecessary:completionHandler:", v6, 0);

    *(_BYTE *)&self->_flags &= ~2u;
    objc_storeStrong((id *)p_document, document);
    -[UIDocumentViewController _registerDocumentObservers](self, "_registerDocumentObservers");
    -[UIDocumentViewController _registerDocumentAssociation](self, "_registerDocumentAssociation");
    -[UIDocumentViewController _updateUndoManagerBinding](self, "_updateUndoManagerBinding");
    -[UIDocument userActivity](document, "userActivity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController setUserActivity:](self, "setUserActivity:", v7);

    -[UIDocumentViewController launchOptions](self, "launchOptions");
    v8 = (id *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentViewControllerLaunchOptions _documentDidChange](v8);

    -[UIDocumentViewController _updateNavigationItem](self, "_updateNavigationItem");
    -[UIDocumentViewController _setNeedsUpdateDocumentUnavailableConfiguration](self);
    v9 = -[UIViewController _appearState](self, "_appearState");
    if (document)
    {
      if ((v9 - 1) <= 1)
        -[UIDocumentViewController openDocumentWithCompletionHandler:](self, "openDocumentWithCompletionHandler:", &__block_literal_global_5_5);
    }
  }
}

- (void)_setNeedsUpdateDocumentUnavailableConfiguration
{
  id v2;

  if (a1)
  {
    if (qword_1ECD7B910 != -1)
      dispatch_once(&qword_1ECD7B910, &__block_literal_global_262);
    if (_MergedGlobals_21_4)
    {
      a1[968] |= 4u;
      objc_msgSend(a1, "view");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setNeedsLayout");

    }
    else
    {
      objc_msgSend(a1, "setNeedsUpdateContentUnavailableConfiguration");
    }
  }
}

- (void)openDocumentWithCompletionHandler:(void *)completionHandler
{
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD *v9;
  _QWORD v10[4];
  id v11;
  void *v12;
  id v13;
  id location;
  _QWORD block[5];
  _QWORD v16[5];

  -[UIDocumentViewController document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__UIDocumentViewController_openDocumentWithCompletionHandler___block_invoke;
    v16[3] = &unk_1E16B1BF8;
    v16[4] = completionHandler;
    v8 = MEMORY[0x1E0C80D38];
    v9 = v16;
LABEL_6:
    dispatch_async(v8, v9);
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "documentState") != 1)
  {
    -[UIDocumentViewController _documentDidOpen](self, "_documentDidOpen");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__UIDocumentViewController_openDocumentWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E16B1BF8;
    block[4] = completionHandler;
    v8 = MEMORY[0x1E0C80D38];
    v9 = block;
    goto LABEL_6;
  }
  objc_initWeak(&location, self);
  -[UIDocumentViewController documentBackgroundQueue]((uint64_t)self);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__UIDocumentViewController_openDocumentWithCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E16C9110;
  v11 = v6;
  objc_copyWeak(&v13, &location);
  v12 = completionHandler;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
LABEL_7:

}

uint64_t __62__UIDocumentViewController_openDocumentWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __62__UIDocumentViewController_openDocumentWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (dispatch_queue_t)documentBackgroundQueue
{
  dispatch_queue_t v2;

  if (a1)
  {
    v2 = (dispatch_queue_t)*(id *)(a1 + 992);
    if (!v2)
    {
      v2 = dispatch_queue_create("com.apple.uikit.documentviewcontroller", 0);
      objc_storeStrong((id *)(a1 + 992), v2);
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __62__UIDocumentViewController_openDocumentWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__UIDocumentViewController_openDocumentWithCompletionHandler___block_invoke_4;
  v5[3] = &unk_1E16C90E8;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "openWithCompletionHandler:", v5);

  objc_destroyWeak(&v8);
}

void __62__UIDocumentViewController_openDocumentWithCompletionHandler___block_invoke_4(uint64_t a1, char a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;
  char v9;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__UIDocumentViewController_openDocumentWithCompletionHandler___block_invoke_5;
  v5[3] = &unk_1E16C90C0;
  v9 = a2;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v8);
}

uint64_t __62__UIDocumentViewController_openDocumentWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t result;

  if (*(_BYTE *)(a1 + 56))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "document");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);

    if (v3 == v4)
      objc_msgSend(WeakRetained, "_documentDidOpen");
    else
      objc_msgSend(WeakRetained, "_closeDocumentIfNecessary:completionHandler:", *(_QWORD *)(a1 + 32), 0);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56));
  return result;
}

- (void)_documentDidOpen
{
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    *(_BYTE *)&self->_flags |= 2u;
    -[UIDocumentViewController documentDidOpen](self, "documentDidOpen");
  }
}

- (void)_closeDocumentIfNecessary:(id)a3 completionHandler:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD block[5];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3 && objc_msgSend(a3, "documentState") != 1)
  {
    objc_getAssociatedObject(a3, &_UIDocumentAssociatedDocumentViewControllers);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          if (*(UIDocumentViewController **)(*((_QWORD *)&v18 + 1) + 8 * v11) != self)
          {
            v17[0] = MEMORY[0x1E0C809B0];
            v17[1] = 3221225472;
            v17[2] = __72__UIDocumentViewController__closeDocumentIfNecessary_completionHandler___block_invoke_2;
            v17[3] = &unk_1E16B1BF8;
            v17[4] = a4;
            dispatch_async(MEMORY[0x1E0C80D38], v17);
            v13 = v7;
            goto LABEL_14;
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v9)
          continue;
        break;
      }
    }

    -[UIDocumentViewController documentBackgroundQueue]((uint64_t)self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __72__UIDocumentViewController__closeDocumentIfNecessary_completionHandler___block_invoke_3;
    v14[3] = &unk_1E16BAD68;
    v14[4] = a3;
    v15 = v12;
    v16 = a4;
    v13 = v12;
    dispatch_async(v13, v14);

LABEL_14:
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__UIDocumentViewController__closeDocumentIfNecessary_completionHandler___block_invoke;
    block[3] = &unk_1E16B1BF8;
    block[4] = a4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __72__UIDocumentViewController__closeDocumentIfNecessary_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __72__UIDocumentViewController__closeDocumentIfNecessary_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __72__UIDocumentViewController__closeDocumentIfNecessary_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  uint64_t v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__UIDocumentViewController__closeDocumentIfNecessary_completionHandler___block_invoke_4;
  v5[3] = &unk_1E16C9138;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "closeWithCompletionHandler:", v5);

}

void __72__UIDocumentViewController__closeDocumentIfNecessary_completionHandler___block_invoke_4(uint64_t a1, char a2)
{
  void *v2;
  id v3;
  _QWORD block[4];
  __int128 v5;
  char v6;

  v2 = *(void **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__UIDocumentViewController__closeDocumentIfNecessary_completionHandler___block_invoke_5;
  block[3] = &unk_1E16BAFE8;
  v6 = a2;
  v5 = *(_OWORD *)(a1 + 40);
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __72__UIDocumentViewController__closeDocumentIfNecessary_completionHandler___block_invoke_5(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  __CFString *v9;
  uint64_t result;
  uint8_t buf[4];
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 48))
  {
    v2 = _UIInternalPreference_ForceDocumentViewControllerDocumentLanding_block_invoke___s_category;
    if (!_UIInternalPreference_ForceDocumentViewControllerDocumentLanding_block_invoke___s_category)
    {
      v2 = __UILogCategoryGetNode("UIDocument", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&_UIInternalPreference_ForceDocumentViewControllerDocumentLanding_block_invoke___s_category);
    }
    v3 = *(id *)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(void **)(a1 + 32);
      if (v4)
      {
        v5 = (void *)MEMORY[0x1E0CB3940];
        v6 = v4;
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p>"), v8, v6);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = CFSTR("(nil)");
      }
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Unable to close document. Reference to this document will be dropped but the document remains open. This might cause state to be lost. Document: %@", buf, 0xCu);

    }
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;
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
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;

  -[UIDocumentViewController document](self, "document", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v5 = *(_BYTE *)&self->_flags & 1;
  else
    v5 = 0;
  if (qword_1ECD7B910 != -1)
    dispatch_once(&qword_1ECD7B910, &__block_literal_global_262);
  v6 = 0;
  if (_MergedGlobals_21_4)
    v7 = 1;
  else
    v7 = v5;
  if ((v7 & 1) == 0 && !v4)
  {
    +[UIContentUnavailableConfiguration emptyConfiguration](UIContentUnavailableConfiguration, "emptyConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("doc"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v8);

    _UILocalizedString(CFSTR("com.apple.documents.empty.title"), (uint64_t)CFSTR("The title of the message showing in a document view controller if there's no document loaded."), CFSTR("No Document"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v9);

    _UILocalizedString(CFSTR("com.apple.documents.empty.message"), (uint64_t)CFSTR("The message showing in a document view controller if there's no document loaded. The button label mentioned in the message should equal the localization key com.apple.documents.backaction"), CFSTR("Select a document by tapping the “Documents” button."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSecondaryText:", v10);

    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "background");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v11);

    -[UIViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13 || objc_msgSend(v13, "isNavigationBarHidden"))
    {
      _UILocalizedString(CFSTR("com.apple.documents.backaction"), (uint64_t)CFSTR("The title of the back button in a document based app that leads back to the document view controller."), CFSTR("Documents"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "button");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTitle:", v15);

      objc_initWeak(&location, self);
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __76__UIDocumentViewController_updateContentUnavailableConfigurationUsingState___block_invoke;
      v22 = &unk_1E16B58D0;
      objc_copyWeak(&v23, &location);
      +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "buttonProperties", v19, v20, v21, v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPrimaryAction:", v17);

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }

  }
  -[UIViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", v6);

}

void __76__UIDocumentViewController_updateContentUnavailableConfigurationUsingState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "open:", 0);

}

- (void)_performDocumentUnavailableConfigurationUpdate
{
  void *v3;
  _UIDocumentLaunchViewController *v4;
  _UIDocumentLaunchViewController *v5;
  void *v6;
  void *v7;
  id v8;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_BYTE *)&self->_flags &= ~4u;
    -[UIDocumentViewController launchOptions](self, "launchOptions");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[UIDocumentViewControllerLaunchOptions _documentUnavailableConfiguration]((uint64_t)v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = self->_launchViewController;
    if (!v4)
    {
      if (qword_1ECD7B910 != -1)
        dispatch_once(&qword_1ECD7B910, &__block_literal_global_262);
      if (!_MergedGlobals_21_4 || (*((_WORD *)&self->super._viewControllerFlags + 4) & 0x80) != 0)
      {
        v4 = 0;
      }
      else
      {
        v5 = [_UIDocumentLaunchViewController alloc];
        -[UIDocumentViewController launchOptions](self, "launchOptions");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIDocumentViewControllerLaunchOptions _documentUnavailableConfiguration]((uint64_t)v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = (_UIDocumentLaunchViewController *)-[_UIDocumentLaunchViewController initWithConfiguration:](v5, (uint64_t)v7);

        -[UIViewController addChildViewController:](self, "addChildViewController:", v4);
        -[_UIDocumentLaunchViewController didMoveToParentViewController:](v4, "didMoveToParentViewController:", self);
        objc_storeStrong((id *)&self->_launchViewController, v4);
      }
    }
    -[_UIDocumentLaunchViewController setConfiguration:]((uint64_t)v4, (uint64_t)v3);

  }
}

- (UIDocumentViewControllerLaunchOptions)launchOptions
{
  UIDocumentViewControllerLaunchOptions **p_launchOptions;
  UIDocumentViewControllerLaunchOptions *v4;

  p_launchOptions = &self->_launchOptions;
  v4 = self->_launchOptions;
  if (!v4)
  {
    if ((*((_WORD *)&self->super._viewControllerFlags + 4) & 0x80) != 0)
    {
      v4 = 0;
    }
    else
    {
      v4 = (UIDocumentViewControllerLaunchOptions *)-[UIDocumentViewControllerLaunchOptions initWithDocumentViewController:]([UIDocumentViewControllerLaunchOptions alloc], self);
      objc_storeStrong((id *)p_launchOptions, v4);
    }
  }
  return v4;
}

- (void)setLaunchOptions:(id)a3
{
  UIDocumentViewControllerLaunchOptions **p_launchOptions;
  UIDocumentViewControllerLaunchOptions *launchOptions;

  p_launchOptions = &self->_launchOptions;
  launchOptions = self->_launchOptions;
  if (launchOptions != a3 && (*((_WORD *)&self->super._viewControllerFlags + 4) & 0x80) == 0)
  {
    if (launchOptions)
      objc_storeWeak((id *)&launchOptions->__documentViewController, 0);
    objc_storeStrong((id *)p_launchOptions, a3);
    if (a3)
      objc_storeWeak((id *)a3 + 15, self);
    -[UIDocumentViewController _setNeedsUpdateDocumentUnavailableConfiguration](self);
  }
}

- (void)_registerDocumentObservers
{
  void *v3;
  void *v4;
  id v5;

  -[UIDocumentViewController document](self, "document");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  self->_lastKnownState = objc_msgSend(v5, "documentState");
  if (v5)
  {
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("undoManager"), 1, &unk_1ECD7B90A);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("fileURL"), 1, &unk_1ECD7B90C);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("userActivity"), 1, &unk_1ECD7B90E);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__documentStateChanged_, CFSTR("UIDocumentStateChangedNotification"), v5);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__localizedNameChanged_, CFSTR("UIDocumentLocalizedNameChangedNotification"), v5);

  }
}

- (void)_unregisterDocumentObservers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UIDocumentViewController document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("undoManager"), &unk_1ECD7B90A);
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("fileURL"), &unk_1ECD7B90C);
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("userActivity"), &unk_1ECD7B90E);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("UIDocumentStateChangedNotification"), v6);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UIDocumentLocalizedNameChangedNotification"), v6);

    v3 = v6;
  }

}

- (void)_documentStateChanged:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t lastKnownState;
  char v10;
  id *v11;
  id *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  -[UIDocumentViewController document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "Received a document state did change notification from a document not associated with this view controller.", buf, 2u);
      }

    }
    else
    {
      v13 = _documentStateChanged____s_category;
      if (!_documentStateChanged____s_category)
      {
        v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v13, (unint64_t *)&_documentStateChanged____s_category);
      }
      v14 = *(NSObject **)(v13 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Received a document state did change notification from a document not associated with this view controller.", v16, 2u);
      }
    }
  }
  objc_msgSend(a3, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
  {
    v8 = objc_msgSend(v5, "documentState");
    if (self)
      lastKnownState = self->_lastKnownState;
    else
      LOBYTE(lastKnownState) = 0;
    self->_lastKnownState = v8;
    v10 = lastKnownState ^ v8;
    -[UIDocumentViewController launchOptions](self, "launchOptions");
    v11 = (id *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((v10 & 1) != 0)
      -[UIDocumentViewControllerLaunchOptions _documentCloseStateDidChange](v11);
    if ((v10 & 0x10) != 0)
      -[UIDocumentViewControllerLaunchOptions _documentProgressStateDidChange]((uint64_t)v12);

  }
}

- (void)_localizedNameChanged:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  -[UIDocumentViewController document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Received a localization name did change notification from a document not associated with this view controller.", buf, 2u);
      }

    }
    else
    {
      v8 = _localizedNameChanged____s_category;
      if (!_localizedNameChanged____s_category)
      {
        v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&_localizedNameChanged____s_category);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Received a localization name did change notification from a document not associated with this view controller.", v11, 2u);
      }
    }
  }
  objc_msgSend(a3, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
    -[UIDocumentViewController _updateNavigationItem](self, "_updateNavigationItem");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void (**v7)(_QWORD);
  _QWORD aBlock[4];
  id v9[2];
  id location;

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__UIDocumentViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
  aBlock[3] = &unk_1E16C0530;
  objc_copyWeak(v9, &location);
  v9[1] = a6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (pthread_main_np() == 1)
    v7[2](v7);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __75__UIDocumentViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = *(void **)(a1 + 40);
  if (v3 == &unk_1ECD7B90A)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateUndoManagerBinding");
LABEL_8:
    WeakRetained = v6;
    goto LABEL_9;
  }
  if (v3 == &unk_1ECD7B90C)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "launchOptions");
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentViewControllerLaunchOptions _documentDidChange](v4);
    goto LABEL_7;
  }
  if (v3 == &unk_1ECD7B90E)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "document");
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userActivity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserActivity:", v5);

LABEL_7:
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_registerDocumentAssociation
{
  void *v3;
  void *v4;
  id object;

  -[UIDocumentViewController document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    object = v3;
    objc_getAssociatedObject(v3, &_UIDocumentAssociatedDocumentViewControllers);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
      objc_setAssociatedObject(object, &_UIDocumentAssociatedDocumentViewControllers, v4, (void *)1);
    }
    objc_msgSend(v4, "addObject:", self);

    v3 = object;
  }

}

- (void)_unregisterDocumentAssociation
{
  void *v3;
  void *v4;
  id v5;

  -[UIDocumentViewController document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_getAssociatedObject(v3, &_UIDocumentAssociatedDocumentViewControllers);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", self);

    v3 = v5;
  }

}

- (void)_updateNavigationItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  UIDocumentProperties *v11;
  void *v12;
  UIDocumentProperties *v13;
  id v14;
  id v15;
  char flags;
  void *v17;
  UIBarButtonItem *v18;
  void *v19;
  UIBarButtonItem *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  char v25;
  id location;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  -[UIDocumentViewController document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStyle:", 2);
  objc_msgSend(v4, "setLargeTitleDisplayMode:", 2);
  objc_msgSend(v4, "setTitleMenuProvider:", &__block_literal_global_47_2);
  v5 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    objc_msgSend(v3, "localizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v6);

    objc_msgSend(v4, "setRenameDelegate:", v3);
    v7 = objc_alloc(MEMORY[0x1E0CB36C8]);
    objc_msgSend(v3, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithContentsOfURL:", v8);

    objc_msgSend(v3, "localizedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSuggestedName:", v10);

    v11 = [UIDocumentProperties alloc];
    objc_msgSend(v3, "fileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[UIDocumentProperties initWithURL:](v11, "initWithURL:", v12);

    v29[0] = v5;
    v29[1] = 3221225472;
    v29[2] = __49__UIDocumentViewController__updateNavigationItem__block_invoke_2;
    v29[3] = &unk_1E16C9180;
    v14 = v9;
    v30 = v14;
    -[UIDocumentProperties setDragItemsProvider:](v13, "setDragItemsProvider:", v29);
    v27[0] = v5;
    v27[1] = 3221225472;
    v27[2] = __49__UIDocumentViewController__updateNavigationItem__block_invoke_3;
    v27[3] = &unk_1E16C91A8;
    v28 = v14;
    v15 = v14;
    -[UIDocumentProperties setActivityViewControllerProvider:](v13, "setActivityViewControllerProvider:", v27);
    objc_msgSend(v4, "setDocumentProperties:", v13);

  }
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_7;
  if (qword_1ECD7B910 != -1)
    dispatch_once(&qword_1ECD7B910, &__block_literal_global_262);
  if (_MergedGlobals_21_4)
  {
LABEL_7:
    objc_initWeak(&location, self);
    v23[0] = v5;
    v23[1] = 3221225472;
    v23[2] = __49__UIDocumentViewController__updateNavigationItem__block_invoke_4;
    v23[3] = &unk_1E16C91F8;
    objc_copyWeak(&v24, &location);
    v25 = flags & 1;
    +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackAction:", v17);

    objc_msgSend(v4, "setLeadingItemGroups:", MEMORY[0x1E0C9AA60]);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v4, "setBackAction:", 0);
    v18 = [UIBarButtonItem alloc];
    _UILocalizedString(CFSTR("com.apple.documents.backaction"), (uint64_t)CFSTR("The title of the back button in a document based app that leads back to the document view controller."), CFSTR("Documents"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[UIBarButtonItem initWithTitle:image:target:action:menu:](v18, "initWithTitle:image:target:action:menu:", v19, 0, self, sel_open_, 0);
    -[UIBarButtonItem creatingFixedGroup](v20, "creatingFixedGroup");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLeadingItemGroups:", v22);

  }
  -[UIDocumentViewController navigationItemDidUpdate](self, "navigationItemDidUpdate");

}

UIMenu *__49__UIDocumentViewController__updateNavigationItem__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", a2);
}

id __49__UIDocumentViewController__updateNavigationItem__block_invoke_2(uint64_t a1)
{
  UIDragItem *v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = -[UIDragItem initWithItemProvider:]([UIDragItem alloc], "initWithItemProvider:", *(_QWORD *)(a1 + 32));
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __49__UIDocumentViewController__updateNavigationItem__block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D96D28]);
  v6[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithActivityItems:applicationActivities:", v3, 0);

  return v4;
}

void __49__UIDocumentViewController__updateNavigationItem__block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  char v9;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__UIDocumentViewController__updateNavigationItem__block_invoke_5;
  v6[3] = &unk_1E16C91D0;
  objc_copyWeak(&v8, v2);
  v5 = v4;
  v7 = v5;
  v9 = *(_BYTE *)(a1 + 40);
  objc_msgSend(WeakRetained, "_closeDocumentIfNecessary:completionHandler:", v5, v6);

  objc_destroyWeak(&v8);
}

void __49__UIDocumentViewController__updateNavigationItem__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);

  if (v2 == v3)
  {
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
    else
      objc_msgSend(WeakRetained, "setDocument:", 0);
  }

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  objc_super v12;

  -[UIDocumentViewController document](self, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (sel_undo_ == a3)
  {
    if (v7)
    {
      objc_msgSend(v7, "undoManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "canUndo"))
      {
LABEL_10:
        v9 = 0;
        goto LABEL_11;
      }
LABEL_7:
      v9 = (objc_msgSend(v8, "documentState") & 8) == 0;
LABEL_11:

      goto LABEL_16;
    }
LABEL_12:
    v9 = 0;
    goto LABEL_16;
  }
  if (sel_redo_ == a3)
  {
    if (v7)
    {
      objc_msgSend(v7, "undoManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "canRedo"))
        goto LABEL_10;
      goto LABEL_7;
    }
    goto LABEL_12;
  }
  if (sel_open_ == a3)
  {
    if (qword_1ECD7B910 != -1)
      dispatch_once(&qword_1ECD7B910, &__block_literal_global_262);
    v9 = _MergedGlobals_21_4 == 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIDocumentViewController;
    v9 = -[UIViewController canPerformAction:withSender:](&v12, sel_canPerformAction_withSender_, a3, a4);
  }
LABEL_16:

  return v9;
}

- (void)undo:(id)a3
{
  void *v3;
  id v4;

  -[UIDocumentViewController document](self, "document", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undo");

}

- (void)redo:(id)a3
{
  void *v3;
  id v4;

  -[UIDocumentViewController document](self, "document", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "redo");

}

- (void)open:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UIDocumentViewController launchOptions](self, "launchOptions", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "browserViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v7)
  {
    objc_msgSend(v7, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v7;
    if (!v6)
    {
      -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
      v5 = v7;
    }
  }

}

- (id)undoManager
{
  void *v2;
  void *v3;

  -[UIDocumentViewController document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIBarButtonItemGroup)undoRedoItemGroup
{
  UIBarButtonItemGroup **p_undoRedoItemGroup;
  UIBarButtonItemGroup *v4;
  UIBarButtonItem *v5;
  void *v6;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;
  void *v10;
  void *v11;
  UIBarButtonItem *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  p_undoRedoItemGroup = &self->_undoRedoItemGroup;
  v4 = self->_undoRedoItemGroup;
  if (!v4)
  {
    v5 = [UIBarButtonItem alloc];
    _UILocalizedString(CFSTR("Undo"), (uint64_t)CFSTR("Undo bar button item title"), CFSTR("Undo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.uturn.backward.circle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[UIBarButtonItem initWithTitle:image:target:action:menu:](v5, "initWithTitle:image:target:action:menu:", v6, v7, self, sel_undo_, 0);

    v9 = [UIBarButtonItem alloc];
    _UILocalizedString(CFSTR("Redo"), (uint64_t)CFSTR("Redo bar button item title"), CFSTR("Redo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.uturn.forward.circle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[UIBarButtonItem initWithTitle:image:target:action:menu:](v9, "initWithTitle:image:target:action:menu:", v10, v11, self, sel_redo_, 0);

    v15[0] = v8;
    v15[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIBarButtonItemGroup optionalGroupWithCustomizationIdentifier:inDefaultCustomization:representativeItem:items:](UIBarButtonItemGroup, "optionalGroupWithCustomizationIdentifier:inDefaultCustomization:representativeItem:items:", CFSTR("com.apple.undoredo"), 1, 0, v13);
    v4 = (UIBarButtonItemGroup *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)p_undoRedoItemGroup, v4);
  }
  return v4;
}

- (void)_updateUndoManagerBinding
{
  _UIBarButtonItemActionBinding *undoManagerBinding;
  _UIBarButtonItemActionBinding *v4;
  _UIBarButtonItemActionBinding **p_undoManagerBinding;
  _UIBarButtonItemActionBinding *v6;
  void *v7;
  void *v8;
  _UIBarButtonItemActionBinding *v9;
  void *v10;
  void *v11;
  _UIBarButtonItemActionBinding *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  void *v16;
  id v17;
  id v18;

  if (self)
    undoManagerBinding = self->_undoManagerBinding;
  else
    undoManagerBinding = 0;
  v4 = undoManagerBinding;
  -[_UIBarButtonItemActionBinding stopMonitoring](v4, "stopMonitoring");
  p_undoManagerBinding = &self->_undoManagerBinding;
  v6 = self->_undoManagerBinding;
  self->_undoManagerBinding = 0;

  -[UIDocumentViewController document](self, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "undoManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = [_UIBarButtonItemActionBinding alloc];
    -[UIDocumentViewController undoRedoItemGroup](self, "undoRedoItemGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "barButtonItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __53__UIDocumentViewController__updateUndoManagerBinding__block_invoke;
    v16 = &unk_1E16C9220;
    v17 = v8;
    v18 = v7;
    v12 = -[_UIBarButtonItemActionBinding initWithBarButtonItems:registerObservers:unregisterObservers:](v9, "initWithBarButtonItems:registerObservers:unregisterObservers:", v11, &v13, &__block_literal_global_82_1);

    objc_storeStrong((id *)p_undoManagerBinding, v12);
    -[_UIBarButtonItemActionBinding startMonitoring](v12, "startMonitoring", v13, v14, v15, v16);

    v4 = v12;
  }

}

void __53__UIDocumentViewController__updateUndoManagerBinding__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", a2, a3, *MEMORY[0x1E0CB33C8], *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "addObserver:selector:name:object:", a2, a3, *MEMORY[0x1E0CB33B0], *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "addObserver:selector:name:object:", a2, a3, *MEMORY[0x1E0CB33D0], *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "addObserver:selector:name:object:", a2, a3, *MEMORY[0x1E0CB33B8], *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "addObserver:selector:name:object:", a2, a3, *MEMORY[0x1E0CB33A0], *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "addObserver:selector:name:object:", a2, a3, CFSTR("UIDocumentStateChangedNotification"), *(_QWORD *)(a1 + 40));

}

void __53__UIDocumentViewController__updateUndoManagerBinding__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", a2);

}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIDocumentViewController;
  -[UIViewController loadView](&v5, sel_loadView);
  +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[UIDocumentViewController _updateNavigationItem](self, "_updateNavigationItem");
}

- (void)setView:(id)a3
{
  id v5;
  objc_super v6;

  -[UIViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)UIDocumentViewController;
  -[UIViewController setView:](&v6, sel_setView_, a3);
  if (v5 != a3)
    -[UIDocumentViewController _setNeedsUpdateDocumentUnavailableConfiguration](self);

}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIDocumentViewController;
  -[UIViewController viewIsAppearing:](&v5, sel_viewIsAppearing_, a3);
  -[UIDocumentViewController _updateIsPresentedFromDocumentBrowser](self, "_updateIsPresentedFromDocumentBrowser");
  -[UIDocumentViewController document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIDocumentViewController openDocumentWithCompletionHandler:](self, "openDocumentWithCompletionHandler:", &__block_literal_global_89_2);
  }
  else
  {
    if (qword_1ECD7B910 != -1)
      dispatch_once(&qword_1ECD7B910, &__block_literal_global_262);
    if (!_MergedGlobals_21_4 && (*(_BYTE *)&self->_flags & 1) == 0)
      -[UIDocumentViewController open:](self, "open:", 0);
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIDocumentViewController;
  -[UIViewController didMoveToParentViewController:](&v6, sel_didMoveToParentViewController_);
  -[UIDocumentViewController _updateIsPresentedFromDocumentBrowser](self, "_updateIsPresentedFromDocumentBrowser");
  if (!a3)
  {
    -[UIDocumentViewController document](self, "document");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "autosaveWithCompletionHandler:", 0);

  }
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIDocumentViewController;
  -[UIViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[UIDocumentViewController _performDocumentUnavailableConfigurationUpdate](self, "_performDocumentUnavailableConfigurationUpdate");
}

- (void)_updateIsPresentedFromDocumentBrowser
{
  UIDocumentViewController *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  $6C13E756B0442098572BF8ED55D18B9C *p_flags;
  char flags;
  char v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v2 = self;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v3 = (void *)qword_1ECD7B918;
  v15 = qword_1ECD7B918;
  if (!qword_1ECD7B918)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getUIDocumentBrowserViewControllerClass_block_invoke_0;
    v11[3] = &unk_1E16B14C0;
    v11[4] = &v12;
    __getUIDocumentBrowserViewControllerClass_block_invoke_0((uint64_t)v11);
    v3 = (void *)v13[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v12, 8);
  v5 = v2;
  while (1)
  {
    objc_msgSend(v5, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
    }

    objc_msgSend(v5, "parentViewController");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
    if (!v7)
    {
      p_flags = &v2->_flags;
      flags = (char)v2->_flags;
      if ((flags & 1) == 0)
        goto LABEL_12;
      v10 = 0;
      goto LABEL_11;
    }
  }

  p_flags = &v2->_flags;
  flags = (char)v2->_flags;
  if ((flags & 1) != 0)
    goto LABEL_12;
  v10 = 1;
LABEL_11:
  *(_BYTE *)p_flags = flags & 0xFE | v10;
  -[UIDocumentViewController _updateNavigationItem](v2, "_updateNavigationItem");
  -[UIDocumentViewController _setNeedsUpdateDocumentUnavailableConfiguration](v2);
LABEL_12:

}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  UIEdgeInsets result;

  -[UIViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    *a4 = 1;
    objc_msgSend(v7, "_contentOverlayInsets");
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)UIDocumentViewController;
    -[UIViewController _edgeInsetsForChildViewController:insetsAreAbsolute:](&v20, sel__edgeInsetsForChildViewController_insetsAreAbsolute_, a3, a4);
  }
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;

  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_UIDocumentLaunchViewController willMoveToParentViewController:](self->_launchViewController, "willMoveToParentViewController:", 0);
  -[UIViewController removeFromParentViewController](self->_launchViewController, "removeFromParentViewController");
  -[UIDocumentViewController _unregisterDocumentObservers](self, "_unregisterDocumentObservers");
  -[UIDocumentViewController _unregisterDocumentAssociation](self, "_unregisterDocumentAssociation");
  -[UIDocumentViewController document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentViewController _closeDocumentIfNecessary:completionHandler:](self, "_closeDocumentIfNecessary:completionHandler:", v3, 0);

  v4.receiver = self;
  v4.super_class = (Class)UIDocumentViewController;
  -[UIViewController dealloc](&v4, sel_dealloc);
}

- (UIDocument)document
{
  return self->_document;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoManagerBinding, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_launchViewController, 0);
  objc_storeStrong((id *)&self->_documentBackgroundQueue, 0);
  objc_storeStrong((id *)&self->_undoRedoItemGroup, 0);
  objc_storeStrong((id *)&self->_launchOptions, 0);
}

@end
