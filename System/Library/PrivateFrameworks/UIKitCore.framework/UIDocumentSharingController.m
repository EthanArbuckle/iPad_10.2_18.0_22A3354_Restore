@implementation UIDocumentSharingController

- (UIDocumentSharingController)initWithFileURL:(id)a3
{
  return -[UIDocumentSharingController initWithFileURL:error:](self, "initWithFileURL:error:", a3, 0);
}

- (UIDocumentSharingController)initWithFileURL:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  char v9;
  UIDocumentSharingController *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  UIDocumentSharingController *v23;
  UIDocumentSharingController *v24;
  void *v25;
  int v26;
  UIDocumentSharingController *v27;
  uint64_t v29;
  char v30;
  UIDocumentSharingController *v31;
  UIDocumentSharingController *v32;
  id v33;
  void *v34;
  UIActivityItemsConfiguration *v35;
  void *v36;
  UIActivityItemsConfiguration *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  _QWORD v42[4];
  UIDocumentSharingController *v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  objc_super v54;
  id location;
  uint64_t v56;
  void (*v57)(uint64_t);
  void *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v9 = objc_msgSend(v7, "isFileURL");

    if ((v9 & 1) != 0)
    {
      v54.receiver = self;
      v54.super_class = (Class)UIDocumentSharingController;
      v10 = -[UIViewController init](&v54, sel_init);
      if (!v10)
      {
        self = 0;
LABEL_32:
        self = self;
        v27 = self;
        goto LABEL_18;
      }
      v10->_legacyAppearance = dyld_program_sdk_at_least() ^ 1;
      objc_storeStrong((id *)&v10->_url, a3);
      v60 = 0;
      v61 = &v60;
      v62 = 0x2050000000;
      v11 = (void *)_MergedGlobals_9_14;
      v63 = _MergedGlobals_9_14;
      if (!_MergedGlobals_9_14)
      {
        location = (id)MEMORY[0x1E0C809B0];
        v56 = 3221225472;
        v57 = __getFPItemManagerClass_block_invoke;
        v58 = &unk_1E16B14C0;
        v59 = &v60;
        __getFPItemManagerClass_block_invoke((uint64_t)&location);
        v11 = (void *)v61[3];
      }
      v12 = objc_retainAutorelease(v11);
      _Block_object_dispose(&v60, 8);
      objc_msgSend(v12, "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0;
      objc_msgSend(v13, "itemForURL:error:", v7, &v53);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v53;

      if (v14)
      {
        v16 = objc_msgSend(v14, "isShared");
        if (!IsGelatoEnabled()
          || ((dyld_program_sdk_at_least() ^ 1 | v16) & 1) != 0
          || v10->_legacyAppearance)
        {
          v17 = (void *)MEMORY[0x1E0CB35D8];
          CloudSharingUIExtensionBundleID();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "extensionWithIdentifier:error:", v18, a4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            -[UIViewController _beginDelayingPresentation:cancellationHandler:](v10, "_beginDelayingPresentation:cancellationHandler:", 0, 3.0);
            v60 = 0;
            v61 = &v60;
            v62 = 0x2050000000;
            v20 = (void *)qword_1ECD7AE50;
            v63 = qword_1ECD7AE50;
            if (!qword_1ECD7AE50)
            {
              location = (id)MEMORY[0x1E0C809B0];
              v56 = 3221225472;
              v57 = __getFPSandboxingURLWrapperClass_block_invoke_0;
              v58 = &unk_1E16B14C0;
              v59 = &v60;
              __getFPSandboxingURLWrapperClass_block_invoke_0((uint64_t)&location);
              v20 = (void *)v61[3];
            }
            v21 = objc_retainAutorelease(v20);
            _Block_object_dispose(&v60, 8);
            v45 = 0;
            objc_msgSend(v21, "wrapperWithURL:readonly:error:", v7, 0, &v45);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (UIDocumentSharingController *)v45;
            v24 = v23;
            if (v22)
            {
              v42[0] = MEMORY[0x1E0C809B0];
              v42[1] = 3221225472;
              v42[2] = __53__UIDocumentSharingController_initWithFileURL_error___block_invoke_3;
              v42[3] = &unk_1E16ED678;
              self = v10;
              v43 = self;
              v44 = v22;
              +[_UIResilientRemoteViewContainerViewController instantiateWithExtension:completion:](_UIResilientRemoteViewContainerViewController, "instantiateWithExtension:completion:", v19, v42);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIDocumentSharingController _setChildViewController:](self, "_setChildViewController:", v25);
              -[UIDocumentSharingController _updatePresentationStyleForLegacyAppearance](self, "_updatePresentationStyleForLegacyAppearance");

              v26 = 0;
              v10 = v43;
            }
            else
            {
              NSLog(CFSTR("Failed to create FPSandboxingURLWrapper for URL %@ %@"), v7, v23);
              self = 0;
              if (a4)
                *a4 = objc_retainAutorelease(v24);
              v26 = 1;
            }

            v10 = v24;
          }
          else
          {
            self = 0;
            v26 = 1;
          }

          if (!v26)
            goto LABEL_32;
          goto LABEL_17;
        }
        v52 = 0;
        v29 = *MEMORY[0x1E0C998E0];
        v51 = 0;
        v30 = objc_msgSend(v7, "getResourceValue:forKey:error:", &v52, v29, &v51);
        v41 = v52;
        v31 = (UIDocumentSharingController *)v51;
        v32 = v31;
        if ((v30 & 1) != 0)
        {
          v33 = objc_alloc(MEMORY[0x1E0CB36C8]);
          objc_msgSend(v41, "identifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v33, "initWithItem:typeIdentifier:", v7, v34);

          v35 = [UIActivityItemsConfiguration alloc];
          v64[0] = v40;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = -[UIActivityItemsConfiguration initWithItemProviders:](v35, "initWithItemProviders:", v36);

          objc_initWeak(&location, v10);
          v38 = MEMORY[0x1E0C809B0];
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __53__UIDocumentSharingController_initWithFileURL_error___block_invoke;
          v48[3] = &unk_1E16ED650;
          objc_copyWeak(&v50, &location);
          v49 = v7;
          -[UIActivityItemsConfiguration setMetadataProvider:](v37, "setMetadataProvider:", v48);
          v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D96D28]), "initWithActivityItemsConfiguration:", v37);
          objc_msgSend(v39, "setAllowsEmbedding:", 1);
          objc_msgSend(v39, "setCollaborationMode:", 4);
          v46[0] = v38;
          v46[1] = 3221225472;
          v46[2] = __53__UIDocumentSharingController_initWithFileURL_error___block_invoke_2;
          v46[3] = &unk_1E16ED4C8;
          objc_copyWeak(&v47, &location);
          objc_msgSend(v39, "setCompletionWithItemsHandler:", v46);
          -[UIDocumentSharingController _addResizingChildViewController:](v10, "_addResizingChildViewController:", v39);
          -[UIDocumentSharingController setActivityViewController:](v10, "setActivityViewController:", v39);
          self = v10;
          objc_destroyWeak(&v47);

          objc_destroyWeak(&v50);
          objc_destroyWeak(&location);

          v10 = (UIDocumentSharingController *)v40;
        }
        else
        {
          if (a4)
            *a4 = objc_retainAutorelease(v31);
          NSLog(CFSTR("Unable to get UTI for URL %@: %@"), v7, v32);
          self = 0;
        }

        v10 = v32;
      }
      else
      {
        if (a4)
          *a4 = objc_retainAutorelease(v15);
        NSLog(CFSTR("Unable to get FPItem for URL %@: %@"), v7, v15);
        self = 0;
      }

      v27 = self;
      goto LABEL_18;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("must pass a valid file URL to -[%@ initWithFileURL:]"), objc_opt_class());
LABEL_17:
  v27 = 0;
LABEL_18:

  return v27;
}

id __53__UIDocumentSharingController_initWithFileURL_error___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v15;
  id v16;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_4:
    v6 = 0;
    goto LABEL_10;
  }
  if (CFSTR("title") != v3)
  {
    if (CFSTR("thumbnail") == v3)
    {
      objc_msgSend(WeakRetained, "_thumbnail");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_4;
  }
  v7 = *(void **)(a1 + 32);
  v16 = 0;
  v8 = *MEMORY[0x1E0C99A70];
  v15 = 0;
  v9 = objc_msgSend(v7, "getResourceValue:forKey:error:", &v16, v8, &v15);
  v10 = v16;
  v11 = v15;
  v12 = v11;
  if ((v9 & 1) != 0)
  {
    v6 = v10;
  }
  else
  {
    NSLog(CFSTR("Unable to get display name for URL %@: %@"), *(_QWORD *)(a1 + 32), v11);
    objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByDeletingPathExtension");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_10:

  return v6;
}

void __53__UIDocumentSharingController_initWithFileURL_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didDismiss");

}

void __53__UIDocumentSharingController_initWithFileURL_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
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
  int v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_opt_class();
    NSLog(CFSTR("Remote view controller error while displaying %@: %@"), v8, v7);
  }
  else
  {
    objc_msgSend(v6, "setPublicController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v6, "serviceViewControllerProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setLegacyAppearance:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 971));
    objc_msgSend(*(id *)(a1 + 32), "_thumbnail");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "_thumbnail");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setThumbnail:", v11);

    }
    objc_msgSend(*(id *)(a1 + 32), "_auxiliaryActionTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "_auxiliaryActionTitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setAuxiliaryActionTitle:", v13);

    }
    objc_msgSend(*(id *)(a1 + 32), "_mailTemplate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "_mailSubject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_mailTemplate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setMailSubject:template:", v15, v16);

    }
    objc_msgSend(*(id *)(a1 + 32), "_initialHeaderSubtitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(*(id *)(a1 + 32), "_initialHeaderSubtitle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setInitialHeaderSubtitle:", v18);

    }
    objc_msgSend(*(id *)(a1 + 32), "_headerSubtitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(*(id *)(a1 + 32), "_headerSubtitle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setHeaderSubtitle:", v20);

    }
    objc_msgSend(*(id *)(a1 + 32), "_headerActionTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(*(id *)(a1 + 32), "_headerActionTitle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setHeaderActionTitle:", v22);

    }
    objc_msgSend(*(id *)(a1 + 32), "_messageTemplate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(*(id *)(a1 + 32), "_messageTemplate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setMessageTemplate:", v24);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "_collaborationUIEnabled"))
      objc_msgSend(v9, "_setCollaborationUIEnabled:", objc_msgSend(*(id *)(a1 + 32), "_collaborationUIEnabled"));
    v25 = objc_msgSend(*(id *)(a1 + 32), "_showOnlyAddPeople");
    v26 = *(void **)(a1 + 32);
    if (v25)
    {
      objc_msgSend(v9, "_setShowAddPeople:", objc_msgSend(v26, "_showOnlyAddPeople"));
    }
    else if (objc_msgSend(v26, "_showRootFolder"))
    {
      objc_msgSend(v9, "_setShowRootFolder:", objc_msgSend(*(id *)(a1 + 32), "_showRootFolder"));
    }
    objc_msgSend(*(id *)(a1 + 32), "_appName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setAppName:", v27);

    objc_msgSend(v9, "_setSandboxingURLWrapper:", *(_QWORD *)(a1 + 40));
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __53__UIDocumentSharingController_initWithFileURL_error___block_invoke_4;
    v28[3] = &unk_1E16CBA40;
    v29 = *(id *)(a1 + 32);
    objc_msgSend(v9, "_prepareForDisplayWithCompletion:", v28);

  }
}

uint64_t __53__UIDocumentSharingController_initWithFileURL_error___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:");
  return objc_msgSend(*(id *)(a1 + 32), "_endDelayingPresentation");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIDocumentSharingController _remoteViewController](self, "_remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPublicController:", 0);

  v4.receiver = self;
  v4.super_class = (Class)UIDocumentSharingController;
  -[UIViewController dealloc](&v4, sel_dealloc);
}

- (void)_presentationControllerDidDismiss:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIDocumentSharingController;
  -[UIViewController _presentationControllerDidDismiss:](&v4, sel__presentationControllerDidDismiss_, a3);
  -[UIDocumentSharingController _didDismiss](self, "_didDismiss");
}

- (void)_setLegacyAppearance:(BOOL)a3
{
  if (self->_legacyAppearance != a3)
  {
    self->_legacyAppearance = a3;
    -[UIDocumentSharingController _updatePresentationStyleForLegacyAppearance](self, "_updatePresentationStyleForLegacyAppearance");
  }
}

- (void)_updatePresentationStyleForLegacyAppearance
{
  uint64_t v2;

  if (self->_legacyAppearance)
    v2 = 2;
  else
    v2 = 7;
  -[UIViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", v2);
}

- (_UIShareInvitationRemoteViewController)_remoteViewController
{
  return (_UIShareInvitationRemoteViewController *)-[_UIResilientRemoteViewContainerViewController remoteViewController](self->_childViewController, "remoteViewController");
}

- (NSString)_appName
{
  NSString *appName;

  appName = self->_appName;
  if (appName)
    return appName;
  objc_msgSend((id)UIApp, "_localizedApplicationName");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_setChildViewController:(id)a3
{
  _UIResilientRemoteViewContainerViewController *v5;
  _UIResilientRemoteViewContainerViewController *childViewController;
  void *v7;
  _UIResilientRemoteViewContainerViewController *v8;

  v5 = (_UIResilientRemoteViewContainerViewController *)a3;
  if (self->_childViewController)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentSharingController.m"), 315, CFSTR("%s: remote view controller can only be set once"), "-[UIDocumentSharingController _setChildViewController:]");

    childViewController = self->_childViewController;
  }
  else
  {
    childViewController = 0;
  }
  self->_childViewController = v5;
  v8 = v5;

  -[UIDocumentSharingController _addResizingChildViewController:](self, "_addResizingChildViewController:", v8);
}

- (void)_addResizingChildViewController:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
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
  id v30;

  v4 = a3;
  v5 = v4;
  v30 = v4;
  if (self && ((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 <= 1)
  {
    v6 = 1;
    objc_msgSend(v4, "beginAppearanceTransition:animated:", 1, 0);
    v5 = v30;
  }
  else
  {
    v6 = 0;
  }
  -[UIViewController addChildViewController:](self, "addChildViewController:", v5);
  objc_msgSend(v30, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  -[UIViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D156E0];
  -[UIViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 7, 0, v13, 7, 1.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addConstraint:", v14);

  -[UIViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0D156E0];
  -[UIViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 8, 0, v18, 8, 1.0, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addConstraint:", v19);

  -[UIViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0D156E0];
  -[UIViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v22, 1, 0, v23, 1, 1.0, 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addConstraint:", v24);

  -[UIViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0D156E0];
  -[UIViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v27, 3, 0, v28, 3, 1.0, 0.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addConstraint:", v29);

  objc_msgSend(v30, "didMoveToParentViewController:", self);
  if (v6)
    objc_msgSend(v30, "endAppearanceTransition");

}

- (void)_performAuxiliaryActionWithCompletion:(id)a3
{
  void *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  -[UIDocumentSharingController _privateDelegate](self, "_privateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "_documentSharingControllerPerformAuxiliaryAction:completion:", self, v5);
  }
  else if (self->_legacyAppearance && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "shareInvitationViewControllerPerformAuxiliaryAction:completion:", self, v5);
  }
  else
  {
    v5[2]();
  }

}

- (void)_performHeaderActionWithCompletion:(id)a3
{
  void *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  -[UIDocumentSharingController _privateDelegate](self, "_privateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_legacyAppearance && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "shareInvitationViewControllerPerformHeaderAction:completion:", self, v5);
  else
    v5[2]();

}

- (void)_shareDidChange:(id)a3
{
  void *v4;
  char v5;
  void *v6;

  -[UIDocumentSharingController _privateDelegate](self, "_privateDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "_documentSharingControllerDidModifyShare:", self);
LABEL_6:
    v4 = v6;
    goto LABEL_7;
  }
  v4 = v6;
  if (self->_legacyAppearance)
  {
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "shareInvitationViewControllerDidModifyShare:", self);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)_shareWasMadePrivate
{
  void *v3;
  char v4;
  void *v5;

  -[UIDocumentSharingController _privateDelegate](self, "_privateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "_documentSharingControllerDidStopSharing:", self);
LABEL_6:
    v3 = v5;
    goto LABEL_7;
  }
  v3 = v5;
  if (self->_legacyAppearance)
  {
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "shareInvitationViewControllerDidStopSharing:", self);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)_setMailSubject:(id)a3 template:(id)a4
{
  id v6;

  v6 = a4;
  -[UIDocumentSharingController _setMailSubject:](self, "_setMailSubject:", a3);
  -[UIDocumentSharingController _setMailTemplate:](self, "_setMailTemplate:", v6);

}

- (void)_setAuxiliaryActionTitle:(id)a3
{
  NSString *v4;
  NSString *auxiliaryActionTitle;
  void *v6;
  id v7;

  if (self->_auxiliaryActionTitle != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    auxiliaryActionTitle = self->_auxiliaryActionTitle;
    self->_auxiliaryActionTitle = v4;

    -[UIDocumentSharingController _remoteViewController](self, "_remoteViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serviceViewControllerProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setAuxiliaryActionTitle:", self->_auxiliaryActionTitle);

  }
}

- (void)_setThumbnail:(id)a3
{
  UIImage *v5;
  UIImage **p_thumbnail;
  void *v7;
  void *v8;
  UIImage *v9;

  v5 = (UIImage *)a3;
  p_thumbnail = &self->_thumbnail;
  if (self->_thumbnail != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_thumbnail, a3);
    -[UIDocumentSharingController _remoteViewController](self, "_remoteViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serviceViewControllerProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setThumbnail:", *p_thumbnail);

    v5 = v9;
  }

}

- (void)_didDismiss
{
  int has_internal_diagnostics;
  UIViewController *strongReferenceToOurself;
  UIViewController *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  int v11;
  UIDocumentSharingController *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  strongReferenceToOurself = self->_strongReferenceToOurself;
  if (has_internal_diagnostics)
  {
    if (strongReferenceToOurself)
    {
      __UIFaultDebugAssertLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        v11 = 138412290;
        v12 = self;
        _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Cyclic reference to %@ wasn't cleared out. This means that the view service didn't call us back.", (uint8_t *)&v11, 0xCu);
      }

    }
  }
  else if (strongReferenceToOurself)
  {
    v9 = _didDismiss___s_category_0;
    if (!_didDismiss___s_category_0)
    {
      v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&_didDismiss___s_category_0);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = self;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Cyclic reference to %@ wasn't cleared out. This means that the view service didn't call us back.", (uint8_t *)&v11, 0xCu);
    }
  }
  v5 = self->_strongReferenceToOurself;
  self->_strongReferenceToOurself = 0;

  -[UIDocumentSharingController _childViewController](self, "_childViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[UIDocumentSharingController _privateDelegate](self, "_privateDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "_documentSharingControllerDidDismiss:", self);

}

- (void)_dismissViewControllerWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[UIViewController isBeingDismissed](self, "isBeingDismissed"))
  {
    if (os_variant_has_internal_diagnostics())
    {
      if (v4)
      {
        __UIFaultDebugAssertLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v12 = v4;
          _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "%@ should never get error from service", buf, 0xCu);
        }

      }
    }
    else if (v4)
    {
      v8 = _dismissViewControllerWithError____s_category;
      if (!_dismissViewControllerWithError____s_category)
      {
        v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&_dismissViewControllerWithError____s_category);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v4;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "%@ should never get error from service", buf, 0xCu);
      }
    }
    -[UIViewController presentingViewController](self, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIViewController presentingViewController](self, "presentingViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __63__UIDocumentSharingController__dismissViewControllerWithError___block_invoke;
      v10[3] = &unk_1E16B1B28;
      v10[4] = self;
      objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v10);

    }
    else
    {
      -[UIDocumentSharingController _didDismiss](self, "_didDismiss");
    }
  }

}

uint64_t __63__UIDocumentSharingController__dismissViewControllerWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didDismiss");
}

- (void)_cloudSharingControllerDidUpdateRootFolderURL:(id)a3
{
  if (a3)
    -[UIDocumentSharingController setRootFolderURL:](self, "setRootFolderURL:");
}

- (void)_cloudSharingControllerDidActivateShowActivityController
{
  double MidX;
  void *v4;
  id v5;
  CGRect v6;
  CGRect v7;

  -[UIViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  MidX = CGRectGetMidX(v6);
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UIDocumentSharingController _cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:y:width:height:](self, "_cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:y:width:height:", MidX, CGRectGetMidY(v7), 0.0, 0.0);

}

- (void)_cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id location;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  -[UIDocumentSharingController rootFolderURL](self, "rootFolderURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_2;
  -[UIDocumentSharingController url](self, "url");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentSharingController.m"), 512, CFSTR("%s: Expect a URL while presenting share sheet"), "-[UIDocumentSharingController _cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:y:width:height:]");
LABEL_2:

  }
  -[UIDocumentSharingController rootFolderURL](self, "rootFolderURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    -[UIDocumentSharingController url](self, "url");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  v18 = objc_alloc(MEMORY[0x1E0D96D28]);
  v32[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithActivityItems:applicationActivities:", v19, 0);

  objc_msgSend(v20, "setCollaborationMode:", 4);
  v31 = *MEMORY[0x1E0D96D98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setExcludedActivityTypes:", v21);

  -[UIViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "popoverPresentationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setSourceView:", v22);

  objc_msgSend(v20, "popoverPresentationController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSourceRect:", a3, a4, a5, a6);

  -[UIDocumentSharingController rootFolderURL](self, "rootFolderURL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = objc_opt_respondsToSelector();

    if ((v26 & 1) != 0)
    {
      -[UIDocumentSharingController url](self, "url");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setManagedFileURL:", v27);

    }
  }
  objc_initWeak(&location, self);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __107__UIDocumentSharingController__cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX_y_width_height___block_invoke;
  v28[3] = &unk_1E16ED4C8;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v20, "setCompletionWithItemsHandler:", v28);
  -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

void __107__UIDocumentSharingController__cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX_y_width_height___block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  id *v5;
  id v6;
  id WeakRetained;

  if (a3)
  {
    v5 = (id *)(a1 + 32);
    v6 = a5;
    WeakRetained = objc_loadWeakRetained(v5);
    objc_msgSend(WeakRetained, "_dismissViewControllerWithError:", v6);

  }
}

- (void)_cloudSharingControllerDidChooseTransport:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UIDocumentSharingController _privateDelegate](self, "_privateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "_cloudSharingControllerDidChooseTransport:transport:", self, v5);

}

- (BOOL)_requiresCustomPresentationController
{
  return -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == UIModalPresentationPopover;
}

- (id)_customPresentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UISharingViewPresentationController *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[UIPopoverPresentationController initWithPresentedViewController:presentingViewController:]([_UISharingViewPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v8, v9);
  objc_initWeak(&location, self);
  objc_msgSend(v10, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController setSourceView:](v11, "setSourceView:", v12);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __121__UIDocumentSharingController__customPresentationControllerForPresentedController_presentingController_sourceController___block_invoke;
  v14[3] = &unk_1E16B3F40;
  objc_copyWeak(&v15, &location);
  -[_UISharingViewPresentationController setDismissalHandler:](v11, "setDismissalHandler:", v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

void __121__UIDocumentSharingController__customPresentationControllerForPresentedController_presentingController_sourceController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didDismiss");

}

- (id)_sharingViewPresentationController
{
  void *v2;
  id v3;

  -[UIViewController presentationController](self, "presentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)_dismissForActivityRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[UIViewController presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentSharingController _setOriginalPresentingViewController:](self, "_setOriginalPresentingViewController:", v5);

  -[UIDocumentSharingController _sharingViewPresentationController](self, "_sharingViewPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSuppressDismissalHandlerUnlessDimmingViewTapped:", 1);

  -[UIViewController presentingViewController](self, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__UIDocumentSharingController__dismissForActivityRepresentation___block_invoke;
  v9[3] = &unk_1E16B1D18;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, v9);

}

uint64_t __65__UIDocumentSharingController__dismissForActivityRepresentation___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 992), *(id *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_representFullscreenAfterActivityDismissal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIViewController *strongReferenceToOurself;

  v4 = a3;
  -[UIViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 5);
  -[UIDocumentSharingController _sharingViewPresentationController](self, "_sharingViewPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSuppressDismissalHandlerUnlessDimmingViewTapped:", 0);

  -[UIDocumentSharingController _originalPresentingViewController](self, "_originalPresentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:completion:", self, 0, v4);

  strongReferenceToOurself = self->_strongReferenceToOurself;
  self->_strongReferenceToOurself = 0;

  objc_storeWeak((id *)&self->_originalPresentingViewController, 0);
}

- (_UIResilientRemoteViewContainerViewController)_childViewController
{
  return self->_childViewController;
}

- (UIViewController)_originalPresentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_originalPresentingViewController);
}

- (void)_setOriginalPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_originalPresentingViewController, a3);
}

- (UIViewController)_strongReferenceToOurself
{
  return self->_strongReferenceToOurself;
}

- (void)_setStrongReferenceToOurself:(id)a3
{
  objc_storeStrong((id *)&self->_strongReferenceToOurself, a3);
}

- (UIActivityViewController)activityViewController
{
  return self->_activityViewController;
}

- (void)setActivityViewController:(id)a3
{
  objc_storeStrong((id *)&self->_activityViewController, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSURL)rootFolderURL
{
  return self->_rootFolderURL;
}

- (void)setRootFolderURL:(id)a3
{
  objc_storeStrong((id *)&self->_rootFolderURL, a3);
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (UIImage)_thumbnail
{
  return self->_thumbnail;
}

- (NSString)_auxiliaryActionTitle
{
  return self->_auxiliaryActionTitle;
}

- (NSString)_mailTemplate
{
  return self->_mailTemplate;
}

- (void)_setMailTemplate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (NSString)_messageTemplate
{
  return self->_messageTemplate;
}

- (void)_setMessageTemplate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (NSString)_mailSubject
{
  return self->_mailSubject;
}

- (void)_setMailSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (BOOL)_collaborationUIEnabled
{
  return self->_collaborationUIEnabled;
}

- (void)_setCollaborationUIEnabled:(BOOL)a3
{
  self->_collaborationUIEnabled = a3;
}

- (BOOL)_showOnlyAddPeople
{
  return self->_showOnlyAddPeople;
}

- (void)_setShowOnlyAddPeople:(BOOL)a3
{
  self->_showOnlyAddPeople = a3;
}

- (BOOL)_showRootFolder
{
  return self->_showRootFolder;
}

- (void)_setShowRootFolder:(BOOL)a3
{
  self->_showRootFolder = a3;
}

- (NSString)_initialHeaderSubtitle
{
  return self->_initialHeaderSubtitle;
}

- (void)_setInitialHeaderSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (NSString)_headerSubtitle
{
  return self->_headerSubtitle;
}

- (void)_setHeaderSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (NSString)_headerActionTitle
{
  return self->_headerActionTitle;
}

- (void)_setHeaderActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (void)_setAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (_UIDocumentSharingControllerDelegate_Private)_privateDelegate
{
  return (_UIDocumentSharingControllerDelegate_Private *)objc_loadWeakRetained((id *)&self->__privateDelegate);
}

- (void)_setPrivateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->__privateDelegate, a3);
}

- (BOOL)_legacyAppearance
{
  return self->_legacyAppearance;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__privateDelegate);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_headerActionTitle, 0);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_initialHeaderSubtitle, 0);
  objc_storeStrong((id *)&self->_mailSubject, 0);
  objc_storeStrong((id *)&self->_messageTemplate, 0);
  objc_storeStrong((id *)&self->_mailTemplate, 0);
  objc_storeStrong((id *)&self->_auxiliaryActionTitle, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_rootFolderURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_strongReferenceToOurself, 0);
  objc_destroyWeak((id *)&self->_originalPresentingViewController);
  objc_storeStrong((id *)&self->_childViewController, 0);
}

@end
