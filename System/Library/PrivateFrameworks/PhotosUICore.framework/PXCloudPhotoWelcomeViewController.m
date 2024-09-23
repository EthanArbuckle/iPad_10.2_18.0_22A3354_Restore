@implementation PXCloudPhotoWelcomeViewController

- (PXCloudPhotoWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudPhotoWelcomeViewController.m"), 79, CFSTR("%s is not available as initializer"), "-[PXCloudPhotoWelcomeViewController initWithTitle:detailText:icon:]");

  abort();
}

- (PXCloudPhotoWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudPhotoWelcomeViewController.m"), 83, CFSTR("%s is not available as initializer"), "-[PXCloudPhotoWelcomeViewController initWithTitle:detailText:icon:contentLayout:]");

  abort();
}

- (PXCloudPhotoWelcomeViewController)initWithDefaultTitle
{
  void *v3;
  void *v4;
  void *v5;
  PXCloudPhotoWelcomeViewController *v6;
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
  void *v20;
  objc_super v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  PXLocalizedStringFromTable(CFSTR("CLOUD_PHOTOS_WELCOME_TITLE"), CFSTR("PhotosUICore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("CLOUD_PHOTOS_WELCOME_BODY"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("Photos_GettingStarted"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)PXCloudPhotoWelcomeViewController;
  v6 = -[PXCloudPhotoWelcomeViewController initWithTitle:detailText:icon:contentLayout:](&v21, sel_initWithTitle_detailText_icon_contentLayout_, v3, v4, v5, 2);
  if (v6)
  {
    PXLocalizedStringFromTable(CFSTR("CLOUD_PHOTOS_WELCOME_LEARN_MORE"), CFSTR("PhotosUICore"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D65158], "accessoryButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:forState:", v20, 0);
    objc_msgSend(v7, "addTarget:action:forControlEvents:", v6, sel__cloudPhotoWelcomeViewLearnMoreTapped_, 0x2000);
    -[PXCloudPhotoWelcomeViewController headerView](v6, "headerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAccessoryButton:", v7);

    -[PXCloudPhotoWelcomeViewController buttonTray](v6, "buttonTray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(CFSTR("ICLOUD_PHOTOS_WELCOME_FINE_PRINT"), CFSTR("PhotosUICore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCaptionText:", v10);

    PXLocalizedStringFromTable(CFSTR("CLOUD_PHOTOS_WELCOME_GO_BUTTON"), CFSTR("PhotosUICore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v12, "setTitle:forState:", v11, 0);
    objc_msgSend(v12, "addTarget:action:forControlEvents:", v6, sel__cloudPhotoWelcomeViewGoButtonTapped_, 0x2000);
    -[PXCloudPhotoWelcomeViewController buttonTray](v6, "buttonTray");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addButton:", v12);

    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel__cloudPhotoWelcomeViewGoButtonTapped_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCloudPhotoWelcomeViewController addKeyCommand:](v6, "addKeyCommand:", v14);

    PXLocalizedStringFromTable(CFSTR("ICLOUD_PHOTOS_WELCOME_NOT_NOW"), CFSTR("PhotosUICore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v16, "setTitle:forState:", v15, 0);
    objc_msgSend(v16, "addTarget:action:forControlEvents:", v6, sel__cloudPhotoWelcomeViewNotNowButtonTapped_, 0x2000);
    -[PXCloudPhotoWelcomeViewController buttonTray](v6, "buttonTray");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addButton:", v16);

    -[PXCloudPhotoWelcomeViewController setModalInPresentation:](v6, "setModalInPresentation:", 1);
    v22[0] = v7;
    v22[1] = v12;
    v22[2] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCloudPhotoWelcomeViewController _setButtons:](v6, "_setButtons:", v18);

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCloudPhotoWelcomeViewController;
  -[OBBaseWelcomeController viewDidLoad](&v4, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__applicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCloudPhotoWelcomeViewController;
  -[PXCloudPhotoWelcomeViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PXCloudPhotoWelcomeViewController _updateCurrentActivity](self, "_updateCurrentActivity");
}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v5 = (void *)getMCProfileConnectionClass_softClass_121542;
  v21 = getMCProfileConnectionClass_softClass_121542;
  if (!getMCProfileConnectionClass_softClass_121542)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = (uint64_t)__getMCProfileConnectionClass_block_invoke_121543;
    v16 = &unk_1E51482E0;
    v17 = &v18;
    __getMCProfileConnectionClass_block_invoke_121543((uint64_t)&v13);
    v5 = (void *)v19[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v18, 8);
  objc_msgSend(v6, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = (uint64_t)&v13;
  v15 = 0x2020000000;
  v8 = (_QWORD *)getMCFeatureCloudPhotoLibraryAllowedSymbolLoc_ptr_121544;
  v16 = (void *)getMCFeatureCloudPhotoLibraryAllowedSymbolLoc_ptr_121544;
  if (!getMCFeatureCloudPhotoLibraryAllowedSymbolLoc_ptr_121544)
  {
    v9 = ManagedConfigurationLibrary_121545();
    v8 = dlsym(v9, "MCFeatureCloudPhotoLibraryAllowed");
    *(_QWORD *)(v14 + 24) = v8;
    getMCFeatureCloudPhotoLibraryAllowedSymbolLoc_ptr_121544 = (uint64_t)v8;
  }
  _Block_object_dispose(&v13, 8);
  if (v8)
  {
    v10 = objc_msgSend(v7, "BOOLRestrictionForFeature:", *v8);

    if (v10 == 2)
      -[PXCloudPhotoWelcomeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMCFeatureCloudPhotoLibraryAllowed(void)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXCloudPhotoWelcomeViewController.m"), 53, CFSTR("%s"), dlerror(), v13);

    __break(1u);
  }
}

- (void)_updateCurrentActivity
{
  if (-[PXCloudPhotoWelcomeViewController _enableOnAppear](self, "_enableOnAppear"))
  {
    -[PXCloudPhotoWelcomeViewController _enableCloudPhotoLibraryWithoutCheck](self, "_enableCloudPhotoLibraryWithoutCheck");
    -[PXCloudPhotoWelcomeViewController _setEnableOnAppear:](self, "_setEnableOnAppear:", 0);
  }
  else
  {
    -[PXCloudPhotoWelcomeViewController _setButtonsEnabled:](self, "_setButtonsEnabled:", 1);
  }
}

- (void)_continueWithoutStoragePurchase:(id)a3
{
  id v4;

  -[PXCloudPhotoWelcomeViewController _setEnableOnAppear:](self, "_setEnableOnAppear:", 1);
  -[PXCloudPhotoWelcomeViewController _offersManager](self, "_offersManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelLoad");

}

- (void)_cloudPhotoWelcomeViewGoButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];

  PLRecordLibrarySizeWithReason();
  -[PXCloudPhotoWelcomeViewController _setButtonsEnabled:](self, "_setButtonsEnabled:", 0);
  objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iTunesSyncedContentInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D71E20]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D71E30]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D71E28]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    v13[4] = self;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__PXCloudPhotoWelcomeViewController__cloudPhotoWelcomeViewGoButtonTapped___block_invoke;
    v14[3] = &unk_1E5149198;
    v14[4] = self;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __74__PXCloudPhotoWelcomeViewController__cloudPhotoWelcomeViewGoButtonTapped___block_invoke_4;
    v13[3] = &unk_1E5149198;
    objc_msgSend(MEMORY[0x1E0DC3450], "px_deleteITunesContentAlertWithAssetCount:includesPhotos:includesVideos:actionHandler:cancelHandler:", v7, v11, v9, v14, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCloudPhotoWelcomeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

  }
  else
  {
    -[PXCloudPhotoWelcomeViewController _enableCloudPhotoLibrary](self, "_enableCloudPhotoLibrary");
  }

}

- (void)_cloudPhotoWelcomeViewNotNowButtonTapped:(id)a3
{
  PLRecordLibrarySizeWithReason();
  -[PXCloudPhotoWelcomeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_cloudPhotoWelcomeViewLearnMoreTapped:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://www.apple.com/ios/photos/"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:options:completionHandler:", v4, MEMORY[0x1E0C9AA70], 0);

}

- (void)_enableCloudPhotoLibrary
{
  void *v2;
  void *v3;

  -[PXCloudPhotoWelcomeViewController _setButtonsEnabled:](self, "_setButtonsEnabled:", 0);
  objc_msgSend(MEMORY[0x1E0D71568], "pl_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedPrimaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  PLCanEnableCloudPhotoLibraryForAccount();
}

- (void)_enableCloudPhotoLibraryWithoutCheck
{
  _QWORD v3[5];

  -[PXCloudPhotoWelcomeViewController _setButtonsEnabled:](self, "_setButtonsEnabled:", 0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__PXCloudPhotoWelcomeViewController__enableCloudPhotoLibraryWithoutCheck__block_invoke;
  v3[3] = &unk_1E5148B78;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D71620], "enableCPL:", v3);
}

- (void)_handleEnableError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PXCloudPhotoWelcomeViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PXCloudPhotoWelcomeViewController__handleEnableError___block_invoke;
  v6[3] = &unk_1E5148D08;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)_setButtonsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PXCloudPhotoWelcomeViewController _buttons](self, "_buttons", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setEnabled:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)manager:(id)a3 willPresentViewController:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PLUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "PXCloudPhotoWelcomeViewController: Up-sell offer will present.", v13, 2u);
  }

  PXLocalizedStringFromTable(CFSTR("ICLOUDPHOTOS_UPGRADE_STORAGE_TITLE"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  if (-[PXCloudPhotoWelcomeViewController _requireStorageUpgrade](self, "_requireStorageUpgrade"))
  {
    objc_msgSend(v5, "px_removeFooterToolbar");
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v9 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PXLocalizedStringFromTable(CFSTR("ICLOUDPHOTOS_CONTINUE_WITHOUT_PURCHASE"), CFSTR("PhotosUICore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithTitle:style:target:action:", v10, 0, self, sel__continueWithoutStoragePurchase_);

    v14[0] = v8;
    v14[1] = v11;
    v14[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_insertFooterToolbarWithItems:", v12);

  }
}

- (void)manager:(id)a3 loadDidFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PLUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "PXCloudPhotoWelcomeViewController: Loading of Up-sell workflow failed with an error: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PXCloudPhotoWelcomeViewController _setButtonsEnabled:](self, "_setButtonsEnabled:", 1);
}

- (void)managerDidCancel:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  PLUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "PXCloudPhotoWelcomeViewController: Up-sell offer was cancelled by the user.", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PXCloudPhotoWelcomeViewController_managerDidCancel___block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__PXCloudPhotoWelcomeViewController_genericTermsRemoteUI_didFinishWithSuccess___block_invoke;
  v4[3] = &unk_1E5144398;
  v5 = a4;
  v4[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

- (NSArray)_buttons
{
  return self->__buttons;
}

- (void)_setButtons:(id)a3
{
  objc_storeStrong((id *)&self->__buttons, a3);
}

- (ICQUICloudStorageOffersManager)_offersManager
{
  return self->__offersManager;
}

- (void)_setOffersManager:(id)a3
{
  objc_storeStrong((id *)&self->__offersManager, a3);
}

- (AAUIGenericTermsRemoteUI)_termsManager
{
  return self->__termsManager;
}

- (void)_setTermsManager:(id)a3
{
  objc_storeStrong((id *)&self->__termsManager, a3);
}

- (BOOL)_requireStorageUpgrade
{
  return self->__requireStorageUpgrade;
}

- (void)_setRequireStorageUpgrade:(BOOL)a3
{
  self->__requireStorageUpgrade = a3;
}

- (BOOL)_enableOnAppear
{
  return self->__enableOnAppear;
}

- (void)_setEnableOnAppear:(BOOL)a3
{
  self->__enableOnAppear = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__termsManager, 0);
  objc_storeStrong((id *)&self->__offersManager, 0);
  objc_storeStrong((id *)&self->__buttons, 0);
}

uint64_t __79__PXCloudPhotoWelcomeViewController_genericTermsRemoteUI_didFinishWithSuccess___block_invoke(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1)
    return objc_msgSend(v2, "_enableCloudPhotoLibrary");
  else
    return objc_msgSend(v2, "_setButtonsEnabled:", 1);
}

uint64_t __54__PXCloudPhotoWelcomeViewController_managerDidCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setButtonsEnabled:", 1);
}

void __56__PXCloudPhotoWelcomeViewController__handleEnableError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  if (objc_msgSend(*(id *)(a1 + 32), "code") == 10)
  {
    objc_msgSend(MEMORY[0x1E0D71568], "pl_sharedAccountStore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "aa_primaryAppleAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v4 = (void *)getAAUIGenericTermsRemoteUIClass_softClass;
    v29 = getAAUIGenericTermsRemoteUIClass_softClass;
    if (!getAAUIGenericTermsRemoteUIClass_softClass)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __getAAUIGenericTermsRemoteUIClass_block_invoke;
      v25[3] = &unk_1E51482E0;
      v25[4] = &v26;
      __getAAUIGenericTermsRemoteUIClass_block_invoke((uint64_t)v25);
      v4 = (void *)v27[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v26, 8);
    v6 = (void *)objc_msgSend([v5 alloc], "initWithAccount:inStore:", v3, v2);
    objc_msgSend(*(id *)(a1 + 40), "_setTermsManager:", v6);

    v7 = *(void **)(a1 + 40);
    objc_msgSend(v7, "_termsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v7);

    objc_msgSend(*(id *)(a1 + 40), "_termsManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentFromViewController:modal:", *(_QWORD *)(a1 + 40), 1);

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0DC3450];
    v11 = *(void **)(a1 + 32);
    v12 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __56__PXCloudPhotoWelcomeViewController__handleEnableError___block_invoke_2;
    v22[3] = &unk_1E5148D08;
    v13 = v11;
    v15 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v23 = v13;
    v24 = v14;
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __56__PXCloudPhotoWelcomeViewController__handleEnableError___block_invoke_3;
    v19[3] = &unk_1E5148D08;
    v16 = v15;
    v17 = *(_QWORD *)(a1 + 40);
    v20 = v16;
    v21 = v17;
    objc_msgSend(v10, "px_alertForCPLEnableError:actionHandler:cancelHandler:", v13, v22, v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v18, 1, 0);

    v2 = v23;
  }

}

void __56__PXCloudPhotoWelcomeViewController__handleEnableError___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v2 = objc_msgSend(*(id *)(a1 + 32), "code");
  v3 = *(void **)(a1 + 40);
  if (v2 == 7)
  {
    objc_msgSend(v3, "_setButtonsEnabled:", 0);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v4 = (void *)getICQUICloudStorageOffersManagerClass_softClass;
    v15 = getICQUICloudStorageOffersManagerClass_softClass;
    if (!getICQUICloudStorageOffersManagerClass_softClass)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __getICQUICloudStorageOffersManagerClass_block_invoke;
      v11[3] = &unk_1E51482E0;
      v11[4] = &v12;
      __getICQUICloudStorageOffersManagerClass_block_invoke((uint64_t)v11);
      v4 = (void *)v13[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v12, 8);
    v6 = objc_alloc_init(v5);
    objc_msgSend(*(id *)(a1 + 40), "_setOffersManager:", v6);

    v7 = *(void **)(a1 + 40);
    objc_msgSend(v7, "_offersManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v7);

    objc_msgSend(*(id *)(a1 + 40), "_offersManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "beginFlowWithNavigationController:modally:", v10, 1);

  }
  else
  {
    objc_msgSend(v3, "_setButtonsEnabled:", 1);
  }
}

uint64_t __56__PXCloudPhotoWelcomeViewController__handleEnableError___block_invoke_3(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "code") == 6 || objc_msgSend(*(id *)(a1 + 32), "code") == 8)
    return objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, 0);
  if (objc_msgSend(*(id *)(a1 + 32), "code") == 7)
    PLRecordLibrarySizeWithReason();
  return objc_msgSend(*(id *)(a1 + 40), "_setButtonsEnabled:", 1);
}

void __73__PXCloudPhotoWelcomeViewController__enableCloudPhotoLibraryWithoutCheck__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  char v9;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PXCloudPhotoWelcomeViewController__enableCloudPhotoLibraryWithoutCheck__block_invoke_2;
  block[3] = &unk_1E51473C0;
  v9 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __73__PXCloudPhotoWelcomeViewController__enableCloudPhotoLibraryWithoutCheck__block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);
  else
    return objc_msgSend(v3, "_handleEnableError:", *(_QWORD *)(a1 + 40));
}

void __61__PXCloudPhotoWelcomeViewController__enableCloudPhotoLibrary__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;

  v5 = a3;
  PLRecordiCPLEnableState();
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_enableCloudPhotoLibraryWithoutCheck");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_setRequireStorageUpgrade:", PLCPLShouldRequireStorageUpgradeForError());
    objc_msgSend(*(id *)(a1 + 32), "_handleEnableError:", v5);
  }

}

void __74__PXCloudPhotoWelcomeViewController__cloudPhotoWelcomeViewGoButtonTapped___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetsdClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "libraryInternalClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__PXCloudPhotoWelcomeViewController__cloudPhotoWelcomeViewGoButtonTapped___block_invoke_2;
  v5[3] = &unk_1E5148B78;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "deleteiTunesSyncedContentWithCompletionHandler:", v5);

}

uint64_t __74__PXCloudPhotoWelcomeViewController__cloudPhotoWelcomeViewGoButtonTapped___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setButtonsEnabled:", 1);
}

void __74__PXCloudPhotoWelcomeViewController__cloudPhotoWelcomeViewGoButtonTapped___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __74__PXCloudPhotoWelcomeViewController__cloudPhotoWelcomeViewGoButtonTapped___block_invoke_3;
  v2[3] = &unk_1E5144398;
  v3 = a2;
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

uint64_t __74__PXCloudPhotoWelcomeViewController__cloudPhotoWelcomeViewGoButtonTapped___block_invoke_3(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_enableCloudPhotoLibrary");
  return result;
}

@end
