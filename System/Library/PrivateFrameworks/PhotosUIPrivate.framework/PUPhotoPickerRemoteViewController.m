@implementation PUPhotoPickerRemoteViewController

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  PUPhotoPickerRemoteContainerView *v6;
  PUPhotoPickerRemoteContainerView *v7;

  if (MEMORY[0x1AF42B6B0](self, a2))
  {
    -[PUPhotoPickerRemoteViewController extensionContext](self, "extensionContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_auxiliaryConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PLClientApplicationIdentifierFromXPCConnection();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x1AF42B6BC](v5);
  }
  v6 = [PUPhotoPickerRemoteContainerView alloc];
  v7 = -[PUPhotoPickerRemoteContainerView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PUPhotoPickerRemoteContainerView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
  -[PUPhotoPickerRemoteViewController setView:](self, "setView:", v7);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoPickerRemoteViewController;
  -[PUPhotoPickerRemoteViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[PUPhotoPickerRemoteViewController _loadContentViewIfNeeded](self, "_loadContentViewIfNeeded");
}

- (void)_handleViewControllerRequestWithOptions:(id)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "PhotoPicker error: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    -[PUPhotoPickerRemoteViewController setOptions:](self, "setOptions:", a3);
  }

}

- (void)_loadContentViewIfNeeded
{
  void *v4;
  void *v5;
  void *v6;
  PUPickerCoordinator *v7;
  void *v8;
  void *v9;
  void *v10;
  PUPickerCoordinator *v11;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  PUPhotoPickerRemoteViewController *obj;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoPickerRemoteViewController.m"), 128, CFSTR("[PUPhotoPickerRemoteViewController _loadContentViewIfNeeded] must be called on the main thread."));

  }
  obj = self;
  objc_sync_enter(obj);
  -[PUPhotoPickerRemoteViewController options](obj, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PUPhotoPickerRemoteViewController assetPickerCoordinator](obj, "assetPickerCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
LABEL_9:

      goto LABEL_10;
    }
    if (-[PUPhotoPickerRemoteViewController isViewLoaded](obj, "isViewLoaded"))
    {
      -[PUPhotoPickerRemoteViewController assetPickerCoordinator](obj, "assetPickerCoordinator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = [PUPickerCoordinator alloc];
        -[PUPhotoPickerRemoteViewController mediaTypes](obj, "mediaTypes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoPickerRemoteViewController extensionContext](obj, "extensionContext");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_auxiliaryConnection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[PUPickerCoordinator initWithPhotoPicker:mediaTypes:connection:](v7, "initWithPhotoPicker:mediaTypes:connection:", obj, v8, v10);

        -[PUPickerCoordinator configuration](v11, "configuration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "registerChangeObserver:context:", obj, PUPickerConfigurationObservationContext_66589);

        -[PUPhotoPickerRemoteViewController setAssetPickerCoordinator:](obj, "setAssetPickerCoordinator:", v11);
      }
      -[PUPhotoPickerRemoteViewController assetPickerCoordinator](obj, "assetPickerCoordinator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "viewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "preferredContentSize");
      -[PUPhotoPickerRemoteViewController setPreferredContentSize:](obj, "setPreferredContentSize:");
      -[PUPhotoPickerRemoteViewController addChildViewController:](obj, "addChildViewController:", v5);
      -[PUPhotoPickerRemoteViewController view](obj, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v14, "addSubview:", v15);
      objc_msgSend(v14, "topAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "topAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoPickerRemoteViewController setTopConstraint:](obj, "setTopConstraint:", v18);

      objc_msgSend(v14, "bottomAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bottomAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoPickerRemoteViewController setBottomConstraint:](obj, "setBottomConstraint:", v21);

      objc_msgSend(v14, "leadingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "leadingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoPickerRemoteViewController setLeadingConstraint:](obj, "setLeadingConstraint:", v24);

      objc_msgSend(v14, "trailingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "trailingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoPickerRemoteViewController setTrailingConstraint:](obj, "setTrailingConstraint:", v27);

      objc_msgSend(v14, "safeAreaLayoutGuide");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "leadingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "leadingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoPickerRemoteViewController setLeadingSafeAreaConstraint:](obj, "setLeadingSafeAreaConstraint:", v31);

      objc_msgSend(v14, "safeAreaLayoutGuide");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "trailingAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "trailingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoPickerRemoteViewController setTrailingSafeAreaConstraint:](obj, "setTrailingSafeAreaConstraint:", v35);

      objc_msgSend(v14, "setNeedsUpdateConstraints");
      objc_msgSend(v5, "didMoveToParentViewController:", obj);
      objc_msgSend(v14, "window");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setCanResizeToFitContent:", 1);

      objc_msgSend(v14, "layoutIfNeeded");
      goto LABEL_9;
    }
  }
LABEL_10:

  objc_sync_exit(obj);
}

- (void)updateViewConstraints
{
  void *v3;
  uint64_t v4;
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  -[PUPhotoPickerRemoteViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_presentationSemanticContext");
  v5 = v4 == 3;
  v6 = v4 != 3;

  -[PUPhotoPickerRemoteViewController topConstraint](self, "topConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[PUPhotoPickerRemoteViewController bottomConstraint](self, "bottomConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[PUPhotoPickerRemoteViewController leadingConstraint](self, "leadingConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", v6);

  -[PUPhotoPickerRemoteViewController trailingConstraint](self, "trailingConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", v6);

  -[PUPhotoPickerRemoteViewController leadingSafeAreaConstraint](self, "leadingSafeAreaConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", v5);

  -[PUPhotoPickerRemoteViewController trailingSafeAreaConstraint](self, "trailingSafeAreaConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", v5);

  v13.receiver = self;
  v13.super_class = (Class)PUPhotoPickerRemoteViewController;
  -[PUPhotoPickerRemoteViewController updateViewConstraints](&v13, sel_updateViewConstraints);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUPhotoPickerRemoteViewController;
  v4 = a3;
  -[PUPhotoPickerRemoteViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[PUPhotoPickerRemoteViewController traitCollection](self, "traitCollection", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_presentationSemanticContext");
  v7 = objc_msgSend(v4, "_presentationSemanticContext");

  if (v6 != v7)
  {
    -[PUPhotoPickerRemoteViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsUpdateConstraints");

  }
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
  v9.super_class = (Class)PUPhotoPickerRemoteViewController;
  v4 = a3;
  -[PUPhotoPickerRemoteViewController preferredContentSizeDidChangeForChildContentContainer:](&v9, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  v6 = v5;
  v8 = v7;

  -[PUPhotoPickerRemoteViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  -[PUPhotoPickerRemoteViewController setExtensionContext:](self, "setExtensionContext:", v4);
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__PUPhotoPickerRemoteViewController_beginRequestWithExtensionContext___block_invoke;
  v5[3] = &unk_1E58A5810;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "requestedViewControllerOptionsWithCompletionHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (unint64_t)savingOptions
{
  void *v2;
  unint64_t v3;

  -[PUPhotoPickerRemoteViewController options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "savingOptions");

  return v3;
}

- (NSArray)mediaTypes
{
  void *v2;
  void *v3;

  -[PUPhotoPickerRemoteViewController options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)onboardingHeaderDismissedBefore
{
  void *v2;
  char v3;

  -[PUPhotoPickerRemoteViewController options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "onboardingHeaderDismissedBefore");

  return v3;
}

- (BOOL)allowsMultipleSelection
{
  void *v2;
  char v3;

  -[PUPhotoPickerRemoteViewController options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsMultipleSelection");

  return v3;
}

- (unint64_t)multipleSelectionLimit
{
  void *v2;
  unint64_t v3;

  -[PUPhotoPickerRemoteViewController options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "multipleSelectionLimit");

  return v3;
}

- (BOOL)requiresPickingConfirmation
{
  void *v2;
  char v3;

  -[PUPhotoPickerRemoteViewController options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiresPickingConfirmation");

  return v3;
}

- (BOOL)showsFileSizePicker
{
  void *v2;
  char v3;

  -[PUPhotoPickerRemoteViewController options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsFileSizePicker");

  return v3;
}

- (BOOL)showsPrompt
{
  void *v2;
  char v3;

  -[PUPhotoPickerRemoteViewController options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsPrompt");

  return v3;
}

- (BOOL)convertAutoloopsToGIF
{
  void *v2;
  char v3;

  -[PUPhotoPickerRemoteViewController options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "convertAutoloopsToGIF");

  return v3;
}

- (NSDictionary)properties
{
  void *v2;
  void *v3;

  -[PUPhotoPickerRemoteViewController options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoPickerProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)presentViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUPhotoPickerRemoteViewController px_topmostPresentedViewController](self, "px_topmostPresentedViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)cancelPhotoPicker
{
  void *v3;
  id v4;

  -[PUPhotoPickerRemoteViewController extensionContext](self, "extensionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelPhotoPicker");

  -[PUPhotoPickerRemoteViewController assetPickerCoordinator](self, "assetPickerCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emitDidFinishPickingAnalytics");

}

- (void)didDisplayPhotoPickerSourceType:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoPickerRemoteViewController extensionContext](self, "extensionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didDisplayPhotoPickerSourceType:", v5);

}

- (void)didDisplayPhotoPickerPreview
{
  id v2;

  -[PUPhotoPickerRemoteViewController extensionContext](self, "extensionContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didDisplayPhotoPickerPreview");

}

- (void)didSelectMediaWithInfoDictionary:(id)a3 allowedHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__PUPhotoPickerRemoteViewController_didSelectMediaWithInfoDictionary_allowedHandler___block_invoke;
  v11[3] = &unk_1E58A6BF8;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[PUPhotoPickerRemoteViewController _allowSharingSelectionOfInfoDictionaries:completion:](self, "_allowSharingSelectionOfInfoDictionaries:completion:", v8, v11);

}

- (void)didSelectMultipleMediaItemsWithInfoDictionaries:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__PUPhotoPickerRemoteViewController_didSelectMultipleMediaItemsWithInfoDictionaries___block_invoke;
  v6[3] = &unk_1E58AAE08;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PUPhotoPickerRemoteViewController _allowSharingSelectionOfInfoDictionaries:completion:](self, "_allowSharingSelectionOfInfoDictionaries:completion:", v5, v6);

}

- (void)performPhotosSelection
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoPickerRemoteViewController.m"), 294, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (void)performTraitCollectionUpdateUsingData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[PUPhotoPickerRemoteViewController _handlePerformTraitCollectionUpdateUsingData:completion:](self, "_handlePerformTraitCollectionUpdateUsingData:completion:", v6, v7);
  }
  else
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __86__PUPhotoPickerRemoteViewController_performTraitCollectionUpdateUsingData_completion___block_invoke;
    v8[3] = &unk_1E58A5838;
    objc_copyWeak(&v11, &location);
    v9 = v6;
    v10 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

- (void)_handlePerformTraitCollectionUpdateUsingData:(id)a3 completion:(id)a4
{
  void (**v7)(id, void *);
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)MEMORY[0x1E0CB3978];
  v9 = a3;
  if ((objc_msgSend(v8, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoPickerRemoteViewController.m"), 309, CFSTR("[PUPhotoPickerRemoteViewController _handlePerformTraitCollectionUpdateUsingData] must be called on the main thread."));

  }
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v16;
  if (v11)
  {
    PLUIGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[PUPhotoPickerRemoteViewController _handlePerformTraitCollectionUpdateUsingData:completion:]";
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_ERROR, "%s Unable to create trait collection %@", buf, 0x16u);
    }

  }
  -[PUPhotoPickerRemoteViewController parentViewController](self, "parentViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setOverrideTraitCollection:forChildViewController:", v10, self);

  -[PUPhotoPickerRemoteViewController _loadContentViewIfNeeded](self, "_loadContentViewIfNeeded");
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10 != 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v14);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v9 = a3;
  if ((void *)PUPickerConfigurationObservationContext_66589 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoPickerRemoteViewController.m"), 335, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 8) != 0)
  {
    v14 = v9;
    -[PUPhotoPickerRemoteViewController extensionContext](self, "extensionContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoPickerRemoteViewController assetPickerCoordinator](self, "assetPickerCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didSetOnboardingHeaderDismissed:", objc_msgSend(v12, "didDismissOnboardingHeaderView"));

    v9 = v14;
  }

}

- (void)performPhotoPickerPreviewOfFirstAsset
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoPickerRemoteViewController.m"), 343, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (void)_logAssetSelectionIfNeeded:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    v10 = *MEMORY[0x1E0DC58F0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CD1698], "uuidFromLocalIdentifier:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  if (MEMORY[0x1AF42B6B0]())
  {
    v14 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "countOfAssetsWithLocationFromUUIDs:photoLibrary:", v5, v15);

    if (v16)
    {
      -[PUPhotoPickerRemoteViewController extensionContext](self, "extensionContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_auxiliaryConnection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      PLClientApplicationIdentifierFromXPCConnection();
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      plslogGreenTea();
    }
  }

}

- (void)_allowSharingSelectionOfInfoDictionaries:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  id v25;
  PUPhotoPickerRemoteViewController *val;
  _QWORD v27[4];
  id v28;
  void (**v29)(id, uint64_t);
  id v30;
  char v31;
  id location;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  val = self;
  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  if ((objc_msgSend(MEMORY[0x1E0D7B978], "confidentialityCheckRequired") & 1) == 0)
  {
    -[PUPhotoPickerRemoteViewController assetPickerCoordinator](val, "assetPickerCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldShowCommunicationSafetyIntervention");

    if (!v9)
      goto LABEL_26;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v38;
    v14 = *MEMORY[0x1E0DC58F0];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "objectForKeyedSubscript:", v14, val);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v10, "addObject:", v16);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v12);
  }

  if (!objc_msgSend(v10, "count"))
  {

LABEL_26:
    v6[2](v6, 1);
    goto LABEL_27;
  }
  v17 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "librarySpecificFetchOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fetchAssetsWithLocalIdentifiers:options:", v10, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v34;
    while (2)
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(v21);
        if ((objc_msgSend(MEMORY[0x1E0D7B978], "confidentialWarningRequiredForAsset:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j), val) & 1) != 0)
        {
          LOBYTE(v22) = 1;
          goto LABEL_23;
        }
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v22)
        continue;
      break;
    }
  }
LABEL_23:

  if (!v21)
    goto LABEL_26;
  objc_initWeak(&location, val);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __89__PUPhotoPickerRemoteViewController__allowSharingSelectionOfInfoDictionaries_completion___block_invoke;
  v27[3] = &unk_1E58A5860;
  objc_copyWeak(&v30, &location);
  v25 = v21;
  v28 = v25;
  v31 = v22;
  v29 = v6;
  -[PUPhotoPickerRemoteViewController _confirmUserSafetyIntervention:completionHandler:](val, "_confirmUserSafetyIntervention:completionHandler:", v25, v27);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

LABEL_27:
}

- (void)_confirmConfidentialWarning:(id)a3 showConfidentialityAlert:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a4;
  v7 = a5;
  v8 = v7;
  if (v5)
  {
    v9 = (void *)MEMORY[0x1E0D7B978];
    v10 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __108__PUPhotoPickerRemoteViewController__confirmConfidentialWarning_showConfidentialityAlert_completionHandler___block_invoke;
    v17[3] = &unk_1E58AB6C0;
    v18 = v7;
    v12 = v10;
    v13 = 3221225472;
    v14 = __108__PUPhotoPickerRemoteViewController__confirmConfidentialWarning_showConfidentialityAlert_completionHandler___block_invoke_2;
    v15 = &unk_1E58AB6C0;
    v16 = v18;
    objc_msgSend(v9, "confidentialityAlertWithConfirmAction:abortAction:", v17, &v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoPickerRemoteViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0, v12, v13, v14, v15);

  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }

}

- (void)_confirmUserSafetyIntervention:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (v7)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoPickerRemoteViewController.m"), 427, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchResult != nil"));

    if (v8)
      goto LABEL_4;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoPickerRemoteViewController.m"), 426, CFSTR("%s must be called on the main thread"), "-[PUPhotoPickerRemoteViewController _confirmUserSafetyIntervention:completionHandler:]");

  if (!v7)
    goto LABEL_9;
LABEL_3:
  if (v8)
    goto LABEL_4;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoPickerRemoteViewController.m"), 428, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

LABEL_4:
  -[PUPhotoPickerRemoteViewController assetPickerCoordinator](self, "assetPickerCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldShowCommunicationSafetyIntervention");

  if (v11)
  {
    -[PUPhotoPickerRemoteViewController assetPickerCoordinator](self, "assetPickerCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startActivityIndicatorsForAssetsWithFetchResult:", v7);

    v13 = (void *)MEMORY[0x1E0D7B988];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __86__PUPhotoPickerRemoteViewController__confirmUserSafetyIntervention_completionHandler___block_invoke;
    v17[3] = &unk_1E58A6BF8;
    v17[4] = self;
    v18 = v7;
    v19 = v8;
    objc_msgSend(v13, "userSafetyInterventionCheckRequiredBeforeSharingAssets:completion:", v18, v17);

  }
  else
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

}

- (PUPhotoPickerExtensionContext)extensionContext
{
  return (PUPhotoPickerExtensionContext *)objc_loadWeakRetained((id *)&self->_extensionContext);
}

- (void)setExtensionContext:(id)a3
{
  objc_storeWeak((id *)&self->_extensionContext, a3);
}

- (PUPhotoPickerRemoteViewControllerRequestOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (PUPickerCoordinator)assetPickerCoordinator
{
  return self->_assetPickerCoordinator;
}

- (void)setAssetPickerCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_assetPickerCoordinator, a3);
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topConstraint, a3);
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomConstraint, a3);
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingConstraint, a3);
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingConstraint, a3);
}

- (NSLayoutConstraint)leadingSafeAreaConstraint
{
  return self->_leadingSafeAreaConstraint;
}

- (void)setLeadingSafeAreaConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingSafeAreaConstraint, a3);
}

- (NSLayoutConstraint)trailingSafeAreaConstraint
{
  return self->_trailingSafeAreaConstraint;
}

- (void)setTrailingSafeAreaConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingSafeAreaConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_leadingSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_assetPickerCoordinator, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_extensionContext);
}

void __86__PUPhotoPickerRemoteViewController__confirmUserSafetyIntervention_completionHandler___block_invoke(id *a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a1[4], "assetPickerCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "fetchedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopActivityIndicatorsForAssetsWithIdentifiers:", v6);

  if (a2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __86__PUPhotoPickerRemoteViewController__confirmUserSafetyIntervention_completionHandler___block_invoke_3;
    v7[3] = &unk_1E58AA518;
    v8 = a1[6];
    +[PUPickerUtilities presentUserSafetyViewControllerWithCompletionHandler:](PUPickerUtilities, "presentUserSafetyViewControllerWithCompletionHandler:", v7);

  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

uint64_t __86__PUPhotoPickerRemoteViewController__confirmUserSafetyIntervention_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __86__PUPhotoPickerRemoteViewController__confirmUserSafetyIntervention_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

uint64_t __108__PUPhotoPickerRemoteViewController__confirmConfidentialWarning_showConfidentialityAlert_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __108__PUPhotoPickerRemoteViewController__confirmConfidentialWarning_showConfidentialityAlert_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89__PUPhotoPickerRemoteViewController__allowSharingSelectionOfInfoDictionaries_completion___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v4 = *(unsigned __int8 *)(a1 + 56);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __89__PUPhotoPickerRemoteViewController__allowSharingSelectionOfInfoDictionaries_completion___block_invoke_2;
    v6[3] = &unk_1E58AA518;
    v5 = *(_QWORD *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(WeakRetained, "_confirmConfidentialWarning:showConfidentialityAlert:completionHandler:", v5, v4, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __89__PUPhotoPickerRemoteViewController__allowSharingSelectionOfInfoDictionaries_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__PUPhotoPickerRemoteViewController_performTraitCollectionUpdateUsingData_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handlePerformTraitCollectionUpdateUsingData:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __85__PUPhotoPickerRemoteViewController_didSelectMultipleMediaItemsWithInfoDictionaries___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_logAssetSelectionIfNeeded:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "extensionContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didSelectMultipleMediaItemsWithInfoDictionaries:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "assetPickerCoordinator");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emitDidFinishPickingAnalytics");

  }
}

void __85__PUPhotoPickerRemoteViewController_didSelectMediaWithInfoDictionary_allowedHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v2 = a2;
  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  if (v2)
  {
    v5 = *(void **)(a1 + 32);
    v9[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_logAssetSelectionIfNeeded:", v6);

    objc_msgSend(*(id *)(a1 + 32), "extensionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didSelectMediaWithInfoDictionary:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "assetPickerCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "emitDidFinishPickingAnalytics");

  }
}

void __70__PUPhotoPickerRemoteViewController_beginRequestWithExtensionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleViewControllerRequestWithOptions:error:", v6, v5);

}

+ (void)initialize
{
  if (initialize_onceToken_66610 != -1)
    dispatch_once(&initialize_onceToken_66610, &__block_literal_global_66611);
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

uint64_t __47__PUPhotoPickerRemoteViewController_initialize__block_invoke()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0D7B930], "setSuiteName:", CFSTR("com.apple.mobileslideshow"));
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeObjectForKey:", CFSTR("UIBarsApplyChromelessEverywhere"));

  return PXAsynchronousAddDragAndDropFileProviderDomain();
}

@end
