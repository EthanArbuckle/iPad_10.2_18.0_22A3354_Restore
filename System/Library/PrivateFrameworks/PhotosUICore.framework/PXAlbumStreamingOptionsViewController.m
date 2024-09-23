@implementation PXAlbumStreamingOptionsViewController

- (PXAlbumStreamingOptionsViewController)initWithPHAlbum:(id)a3
{
  id v5;
  void *v6;
  PXAlbumStreamingOptionsViewController *v7;
  PXAlbumStreamingOptionsViewController *v8;

  v5 = a3;
  objc_msgSend(v5, "pl_assetContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXAlbumStreamingOptionsViewController initWithAlbum:](self, "initWithAlbum:", v6);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_phAlbum, a3);

  return v8;
}

- (PXAlbumStreamingOptionsViewController)initWithAlbum:(id)a3
{
  id v4;
  PXAlbumStreamingOptionsViewController *v5;
  PXAlbumStreamingOptionsViewController *v6;
  void *v7;
  uint64_t v8;
  NSArray *sharedAlbumRecipients;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *familyProfilePictures;
  uint64_t v13;
  NSOperationQueue *familyRequestQueue;
  uint64_t v15;
  ACAccountStore *familyAccountStore;
  void *v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  uint64_t v21;
  AAUIProfilePictureStore *familyMemberPictureStore;
  void *v23;
  id v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  PXAlbumStreamingOptionsViewController *v31;
  objc_super v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PXAlbumStreamingOptionsViewController;
  v5 = -[PXAlbumStreamingOptionsViewController initWithNibName:bundle:](&v32, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[PXAlbumStreamingOptionsViewController setAlbum:](v5, "setAlbum:", v4);
    objc_msgSend(v4, "localizedTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAlbumStreamingOptionsViewController setAlbumName:](v6, "setAlbumName:", v7);

    -[PXAlbumStreamingOptionsViewController setStreamOwner:](v6, "setStreamOwner:", objc_msgSend(v4, "isOwnedCloudSharedAlbum"));
    -[PXAlbumStreamingOptionsViewController setAlbumIsFamilyStream:](v6, "setAlbumIsFamilyStream:", objc_msgSend(v4, "cloudAlbumSubtype") == 1);
    _PXSharedAlbumRecipientsForAlbumIncludeCurrentUser(v4, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    sharedAlbumRecipients = v6->_sharedAlbumRecipients;
    v6->_sharedAlbumRecipients = (NSArray *)v8;

    objc_msgSend(MEMORY[0x1E0D715F0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addInvitationRecordsObserver:", v6);

    if (objc_msgSend(v4, "isFamilyCloudSharedAlbum"))
    {
      v11 = objc_opt_new();
      familyProfilePictures = v6->_familyProfilePictures;
      v6->_familyProfilePictures = (NSMutableDictionary *)v11;

      v13 = objc_opt_new();
      familyRequestQueue = v6->_familyRequestQueue;
      v6->_familyRequestQueue = (NSOperationQueue *)v13;

      v15 = objc_opt_new();
      familyAccountStore = v6->_familyAccountStore;
      v6->_familyAccountStore = (ACAccountStore *)v15;

      -[ACAccountStore aa_primaryAppleAccount](v6->_familyAccountStore, "aa_primaryAppleAccount");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v34 = 0;
        v35 = &v34;
        v36 = 0x2050000000;
        v18 = (void *)getAAUIProfilePictureStoreClass_softClass;
        v37 = getAAUIProfilePictureStoreClass_softClass;
        v19 = MEMORY[0x1E0C809B0];
        if (!getAAUIProfilePictureStoreClass_softClass)
        {
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __getAAUIProfilePictureStoreClass_block_invoke;
          v33[3] = &unk_1E51482E0;
          v33[4] = &v34;
          __getAAUIProfilePictureStoreClass_block_invoke((uint64_t)v33);
          v18 = (void *)v35[3];
        }
        v20 = objc_retainAutorelease(v18);
        _Block_object_dispose(&v34, 8);
        v21 = objc_msgSend([v20 alloc], "initWithAppleAccount:grandSlamAccount:accountStore:", v17, 0, v6->_familyAccountStore);
        familyMemberPictureStore = v6->_familyMemberPictureStore;
        v6->_familyMemberPictureStore = (AAUIProfilePictureStore *)v21;

        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFAC58]), "initWithAccount:", v17);
        v24 = objc_alloc(MEMORY[0x1E0CFAD10]);
        v27 = v19;
        v28 = 3221225472;
        v29 = __55__PXAlbumStreamingOptionsViewController_initWithAlbum___block_invoke;
        v30 = &unk_1E5128420;
        v31 = v6;
        v25 = (void *)objc_msgSend(v24, "initWithRequest:handler:", v23, &v27);
        -[NSOperationQueue addOperation:](v6->_familyRequestQueue, "addOperation:", v25, v27, v28, v29, v30);

      }
    }
  }

  return v6;
}

- (PXAlbumStreamingOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAlbumStreamingOptionsViewController.m"), 366, CFSTR("%s is not available as initializer"), "-[PXAlbumStreamingOptionsViewController initWithNibName:bundle:]");

  abort();
}

- (PXAlbumStreamingOptionsViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAlbumStreamingOptionsViewController.m"), 370, CFSTR("%s is not available as initializer"), "-[PXAlbumStreamingOptionsViewController initWithCoder:]");

  abort();
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D715F0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_storeWeak((id *)&self->_delegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)PXAlbumStreamingOptionsViewController;
  -[PXAlbumStreamingOptionsViewController dealloc](&v4, sel_dealloc);
}

- (void)setPresentedModally:(BOOL)a3
{
  if (self->_presentedModally != a3)
  {
    self->_presentedModally = a3;
    -[PXAlbumStreamingOptionsViewController _updateNavigationItem](self, "_updateNavigationItem");
  }
}

- (void)_updateAllControls
{
  -[PXAlbumStreamingOptionsViewController _updateWantsPublicWebsiteField](self, "_updateWantsPublicWebsiteField");
  -[PXAlbumStreamingOptionsViewController _updateWantsAcceptCloudNotificationField](self, "_updateWantsAcceptCloudNotificationField");
  -[PXAlbumStreamingOptionsViewController _updateWantsMultipleContributorsField](self, "_updateWantsMultipleContributorsField");
  -[PXAlbumStreamingOptionsViewController _updatePublicURLStateIfNecessaryAnimated:](self, "_updatePublicURLStateIfNecessaryAnimated:", 0);
  -[PXAlbumStreamingOptionsViewController _updateMultipleContributorsState](self, "_updateMultipleContributorsState");
}

- (void)_updateWantsPublicWebsiteField
{
  void *v3;
  id v4;

  -[PXAlbumStreamingOptionsViewController album](self, "album");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudPublicURLEnabledLocal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitch setOn:](self->_wantsPublicWebsiteSwitch, "setOn:", objc_msgSend(v3, "BOOLValue"));

}

- (void)_updateWantsAcceptCloudNotificationField
{
  id v3;

  -[PXAlbumStreamingOptionsViewController album](self, "album");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UISwitch setOn:](self->_wantsAcceptCloudNotificationSwitch, "setOn:", objc_msgSend(v3, "cloudNotificationsEnabled"));

}

- (void)_updateWantsMultipleContributorsField
{
  void *v3;
  id v4;

  -[PXAlbumStreamingOptionsViewController album](self, "album");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudMultipleContributorsEnabledLocal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitch setOn:](self->_wantsMultipleContributorsSwitch, "setOn:", objc_msgSend(v3, "BOOLValue"));

}

- (void)_updateNavigationItem
{
  UIBarButtonItem *doneButton;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  -[PXAlbumStreamingOptionsViewController navigationItem](self, "navigationItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PXAlbumStreamingOptionsViewController isPresentedModally](self, "isPresentedModally"))
  {
    doneButton = self->_doneButton;
    if (!doneButton)
    {
      v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__doneAction_);
      v5 = self->_doneButton;
      self->_doneButton = v4;

      doneButton = self->_doneButton;
    }
  }
  else
  {
    doneButton = 0;
  }
  objc_msgSend(v10, "setRightBarButtonItem:", doneButton);
  -[PXAlbumStreamingOptionsViewController album](self, "album");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isOwnedCloudSharedAlbum");

  if (v7)
  {
    PLServicesLocalizedFrameworkString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v8);
  }
  else
  {
    -[PXAlbumStreamingOptionsViewController album](self, "album");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v9);

  }
  objc_msgSend(v10, "setLeftBarButtonItem:", 0);

}

- (void)loadView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UITableView *v12;
  UITableView *optionsTableView;
  id v14;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D48]), "initWithFrame:style:", 2, v5, v7, v9, v11);
  optionsTableView = self->_optionsTableView;
  self->_optionsTableView = v12;

  -[UITableView setDelegate:](self->_optionsTableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_optionsTableView, "setDataSource:", self);
  -[UITableView setAutoresizingMask:](self->_optionsTableView, "setAutoresizingMask:", 18);
  -[UITableView setSeparatorStyle:](self->_optionsTableView, "setSeparatorStyle:", 1);
  v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v7, v9, v11);
  objc_msgSend(v14, "setAutoresizingMask:", 18);
  objc_msgSend(v14, "addSubview:", self->_optionsTableView);
  -[PXAlbumStreamingOptionsViewController setView:](self, "setView:", v14);

}

- (void)viewWillAppear:(BOOL)a3
{
  UITableView *optionsTableView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXAlbumStreamingOptionsViewController;
  -[PXAlbumStreamingOptionsViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[PXAlbumStreamingOptionsViewController _updateAllControls](self, "_updateAllControls");
  optionsTableView = self->_optionsTableView;
  -[UITableView indexPathForSelectedRow](optionsTableView, "indexPathForSelectedRow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView deselectRowAtIndexPath:animated:](optionsTableView, "deselectRowAtIndexPath:animated:", v5, 1);

  if (!self->_streamOwner)
  {
    v6 = (void *)MEMORY[0x1E0D719E0];
    -[PXAlbumStreamingOptionsViewController album](self, "album");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cloudGUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "refreshSubscriberListForAlbumGUID:", v8);

  }
  -[PXAlbumStreamingOptionsViewController _setShouldScrollToTopOnNextViewLayout:](self, "_setShouldScrollToTopOnNextViewLayout:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXAlbumStreamingOptionsViewController;
  -[PXAlbumStreamingOptionsViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[PXAlbumStreamingOptionsViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackButtonDisplayMode:", 0);

  -[PXAlbumStreamingOptionsViewController _suppressionContexts](self, "_suppressionContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "notificationSuppressionContextManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNotificationSuppressionContexts:", v5);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXAlbumStreamingOptionsViewController;
  -[PXAlbumStreamingOptionsViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "notificationSuppressionContextManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNotificationSuppressionContexts:", 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PXAlbumStreamingOptionsViewController;
  -[PXAlbumStreamingOptionsViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  -[PXAlbumStreamingOptionsViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "lastOperation") == 1)
    objc_msgSend(v5, "setToolbarHidden:animated:", 1, v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXAlbumStreamingOptionsViewController;
  -[PXAlbumStreamingOptionsViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PXAlbumStreamingOptionsViewController _updateNavigationItem](self, "_updateNavigationItem");
  -[UITableView setTableHeaderView:](self->_optionsTableView, "setTableHeaderView:", 0);
  self->_showShareLink = -[PXAlbumStreamingOptionsViewController _publicURLEnabled](self, "_publicURLEnabled");
  -[PXAlbumStreamingOptionsViewController tableView:titleForFooterInSection:](self, "tableView:titleForFooterInSection:", self->_optionsTableView, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAlbumStreamingOptionsViewController _setLastPublicURLSectionFooterTitle:](self, "_setLastPublicURLSectionFooterTitle:", v3);
  -[PXAlbumStreamingOptionsViewController tableView:titleForFooterInSection:](self, "tableView:titleForFooterInSection:", self->_optionsTableView, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAlbumStreamingOptionsViewController _setLastMultiContributorsSectionFooterTitle:](self, "_setLastMultiContributorsSectionFooterTitle:", v4);

}

- (void)viewDidUnload
{
  UIBarButtonItem *doneButton;
  UIBarButtonItem *cancelButton;
  UITableView *optionsTableView;
  UISwitch *wantsPublicWebsiteSwitch;
  UISwitch *wantsMultipleContributorsSwitch;
  objc_super v8;

  doneButton = self->_doneButton;
  self->_doneButton = 0;

  cancelButton = self->_cancelButton;
  self->_cancelButton = 0;

  optionsTableView = self->_optionsTableView;
  self->_optionsTableView = 0;

  wantsPublicWebsiteSwitch = self->_wantsPublicWebsiteSwitch;
  self->_wantsPublicWebsiteSwitch = 0;

  wantsMultipleContributorsSwitch = self->_wantsMultipleContributorsSwitch;
  self->_wantsMultipleContributorsSwitch = 0;

  v8.receiver = self;
  v8.super_class = (Class)PXAlbumStreamingOptionsViewController;
  -[PXAlbumStreamingOptionsViewController viewDidUnload](&v8, sel_viewDidUnload);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAlbumStreamingOptionsViewController;
  -[PXAlbumStreamingOptionsViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  if (-[PXAlbumStreamingOptionsViewController _shouldScrollToTopOnNextViewLayout](self, "_shouldScrollToTopOnNextViewLayout"))
  {
    -[UITableView scrollRectToVisible:animated:](self->_optionsTableView, "scrollRectToVisible:animated:", 0, 0.0, 0.0, 1.0, 1.0);
    -[PXAlbumStreamingOptionsViewController _setShouldScrollToTopOnNextViewLayout:](self, "_setShouldScrollToTopOnNextViewLayout:", 0);
  }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return a3 != 2;
}

- (CGSize)contentSizeForViewInPopover
{
  UITableView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  CGSize result;

  -[PXAlbumStreamingOptionsViewController _updateAllControls](self, "_updateAllControls");
  v3 = self->_optionsTableView;
  -[UITableView frame](v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UITableView setFrame:](v3, "setFrame:");
  -[UITableView layoutIfNeeded](v3, "layoutIfNeeded");
  -[UITableView contentSize](v3, "contentSize");
  v13 = v12;
  v15 = v14;
  -[UITableView setFrame:](v3, "setFrame:", v5, v7, v9, v11);

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (id)_suppressionContexts
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = *MEMORY[0x1E0D74858];
  -[PXAlbumStreamingOptionsViewController album](self, "album");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@%@"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_handleCompletionWithReason:(int)a3
{
  uint64_t v3;
  id WeakRetained;

  v3 = *(_QWORD *)&a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "albumStreamingOptionsViewController:didCompleteWithReason:", self, v3);

}

- (void)_doneAction:(id)a3
{
  -[PXAlbumStreamingOptionsViewController _handleCompletionWithReason:](self, "_handleCompletionWithReason:", 2);
}

- (void)_changeWantsPublicWebsite:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  char v13;

  -[PXAlbumStreamingOptionsViewController album](self, "album", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UISwitch isOn](self->_wantsPublicWebsiteSwitch, "isOn");
  objc_msgSend(v4, "cloudPublicURLEnabledLocal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v5 != v7)
  {
    objc_msgSend(v4, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__PXAlbumStreamingOptionsViewController__changeWantsPublicWebsite___block_invoke;
    v11[3] = &unk_1E5144398;
    v12 = v4;
    v13 = v5;
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __67__PXAlbumStreamingOptionsViewController__changeWantsPublicWebsite___block_invoke_2;
    v10[3] = &unk_1E5149198;
    v10[4] = self;
    objc_msgSend(v8, "performTransaction:completionHandler:", v11, v10);

  }
}

- (void)_changeWantsAcceptCloudNotification:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  char v9;

  -[PXAlbumStreamingOptionsViewController album](self, "album", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UISwitch isOn](self->_wantsAcceptCloudNotificationSwitch, "isOn");
  if (v5 != objc_msgSend(v4, "cloudNotificationsEnabled"))
  {
    objc_msgSend(v4, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__PXAlbumStreamingOptionsViewController__changeWantsAcceptCloudNotification___block_invoke;
    v7[3] = &unk_1E5144398;
    v8 = v4;
    v9 = v5;
    objc_msgSend(v6, "performTransaction:", v7);

  }
}

- (void)_changeWantsMultipleContributors:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  char v13;

  -[PXAlbumStreamingOptionsViewController album](self, "album", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UISwitch isOn](self->_wantsMultipleContributorsSwitch, "isOn");
  objc_msgSend(v4, "cloudMultipleContributorsEnabledLocal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v5 != v7)
  {
    objc_msgSend(v4, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__PXAlbumStreamingOptionsViewController__changeWantsMultipleContributors___block_invoke;
    v11[3] = &unk_1E5144398;
    v12 = v4;
    v13 = v5;
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __74__PXAlbumStreamingOptionsViewController__changeWantsMultipleContributors___block_invoke_2;
    v10[3] = &unk_1E5149198;
    v10[4] = self;
    objc_msgSend(v8, "performTransaction:completionHandler:", v11, v10);

  }
}

- (void)_deletePhotoStream
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  id v11;

  -[PXAlbumStreamingOptionsViewController album](self, "album");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__PXAlbumStreamingOptionsViewController__deletePhotoStream__block_invoke;
    v9[3] = &unk_1E5148D08;
    v10 = v5;
    v11 = v4;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __59__PXAlbumStreamingOptionsViewController__deletePhotoStream__block_invoke_2;
    v8[3] = &unk_1E5149198;
    v8[4] = self;
    v7 = v5;
    objc_msgSend(v7, "performTransaction:completionHandler:", v9, v8);

  }
}

- (void)_displayConfirmationWithMessage:(id)a3 destructiveTitle:(id)a4 actionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v8 = a5;
  v9 = (void *)MEMORY[0x1E0DC3450];
  v10 = a4;
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", 0, a3, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3448];
  PLLocalizedFrameworkString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v14);

  v15 = (void *)MEMORY[0x1E0DC3448];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __104__PXAlbumStreamingOptionsViewController__displayConfirmationWithMessage_destructiveTitle_actionHandler___block_invoke;
  v20[3] = &unk_1E5142658;
  v21 = v8;
  v16 = v8;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v10, 2, v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v17);
  -[PXAlbumStreamingOptionsViewController navigationController](self, "navigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "presentViewController:animated:completion:", v11, 1, 0);
}

- (void)_displayDeleteConfirmation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[PXAlbumStreamingOptionsViewController streamOwner](self, "streamOwner", a3);
  PLServicesLocalizedFrameworkString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAlbumStreamingOptionsViewController album](self, "album");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringWithValidatedFormat();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PLServicesLocalizedFrameworkString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__PXAlbumStreamingOptionsViewController__displayDeleteConfirmation___block_invoke;
  v9[3] = &unk_1E5149198;
  v9[4] = self;
  -[PXAlbumStreamingOptionsViewController _displayConfirmationWithMessage:destructiveTitle:actionHandler:](self, "_displayConfirmationWithMessage:destructiveTitle:actionHandler:", v7, v8, v9, v6);

}

- (void)_displayActivitySheet
{
  void *v3;
  void *v4;
  void *v5;
  PXAlbumStreamingActivityItemSource *v6;
  id v7;
  void *v8;
  void *v9;
  UITableView *v10;
  UITableView *optionsTableView;
  UITableView *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  -[UITableView indexPathForSelectedRow](self->_optionsTableView, "indexPathForSelectedRow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView deselectRowAtIndexPath:animated:](self->_optionsTableView, "deselectRowAtIndexPath:animated:", v3, 1);
  -[PXAlbumStreamingOptionsViewController album](self, "album");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publicURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[PXAlbumStreamingActivityItemSource initWithAlbum:]([PXAlbumStreamingActivityItemSource alloc], "initWithAlbum:", v4);
    v7 = objc_alloc(MEMORY[0x1E0D96D28]);
    v27[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithActivityItems:applicationActivities:", v8, 0);

    -[UITableView cellForRowAtIndexPath:](self->_optionsTableView, "cellForRowAtIndexPath:", v3);
    v10 = (UITableView *)objc_claimAutoreleasedReturnValue();
    optionsTableView = v10;
    if (!v10)
      optionsTableView = self->_optionsTableView;
    v12 = optionsTableView;
    objc_msgSend(v9, "popoverPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSourceView:", v12);

    -[UITableView bounds](v12, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    objc_msgSend(v9, "popoverPresentationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSourceRect:", v15, v17, v19, v21);

    objc_msgSend(v9, "setShowKeyboardAutomatically:", 1);
    v23 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
    objc_msgSend(v4, "localizedTitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTitle:", v24);

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setOriginalURL:", v25);

    objc_msgSend(v9, "setPhotosHeaderMetadata:", v23);
    -[PXAlbumStreamingOptionsViewController navigationController](self, "navigationController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "presentViewController:animated:completion:", v9, 1, 0);

  }
  else
  {
    NSLog(CFSTR("***Error cannot display sharing sheet as the publicURL is nil. "));
  }

}

- (BOOL)_publicURLEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PXAlbumStreamingOptionsViewController album](self, "album");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudPublicURLEnabledLocal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLValue"))
  {
    objc_msgSend(v2, "cloudPublicURLEnabled");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "BOOLValue"))
    {
      objc_msgSend(v2, "publicURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_multipleContributorsEnabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[PXAlbumStreamingOptionsViewController album](self, "album");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudMultipleContributorsEnabledLocal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLValue"))
  {
    objc_msgSend(v2, "cloudMultipleContributorsEnabled");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldShowPublicURLActivitySpinner
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;

  -[PXAlbumStreamingOptionsViewController album](self, "album");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudPublicURLEnabledLocal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  objc_msgSend(v2, "cloudPublicURLEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (!v6 || v4)
  {
    if ((v4 & v6) == 1)
    {
      objc_msgSend(v2, "publicURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v4) = v7 == 0;

    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (void)_setShowingPublicURLActivitySpinner:(BOOL)a3
{
  self->__showingPublicURLActivitySpinner = a3;
  -[UISwitch setUserInteractionEnabled:](self->_wantsPublicWebsiteSwitch, "setUserInteractionEnabled:", !a3);
}

- (void)_setShowingMultipleContributorSpinner:(BOOL)a3
{
  -[UISwitch setUserInteractionEnabled:](self->_wantsMultipleContributorsSwitch, "setUserInteractionEnabled:", !a3);
}

- (void)_updatePublicURLStateIfNecessaryAnimated:(BOOL)a3
{
  uint64_t v4;
  UITableView *optionsTableView;
  void *v6;
  void *v7;
  _BOOL4 v8;
  UITableView *v9;
  void *v10;
  _QWORD v11[6];

  if (a3)
    v4 = 0;
  else
    v4 = 5;
  optionsTableView = self->_optionsTableView;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__PXAlbumStreamingOptionsViewController__updatePublicURLStateIfNecessaryAnimated___block_invoke;
  v11[3] = &unk_1E5144EB8;
  v11[4] = self;
  v11[5] = v4;
  -[UITableView performBatchUpdates:completion:](optionsTableView, "performBatchUpdates:completion:", v11, 0);
  -[PXAlbumStreamingOptionsViewController tableView:titleForFooterInSection:](self, "tableView:titleForFooterInSection:", self->_optionsTableView, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAlbumStreamingOptionsViewController _lastPublicURLSectionFooterTitle](self, "_lastPublicURLSectionFooterTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXAlbumStreamingOptionsViewController _shouldShowPublicURLActivitySpinner](self, "_shouldShowPublicURLActivitySpinner");
  if (v8 != -[PXAlbumStreamingOptionsViewController _showingPublicURLActivitySpinner](self, "_showingPublicURLActivitySpinner")|| v6 != v7 && (objc_msgSend(v7, "isEqualToString:", v6) & 1) == 0)
  {
    v9 = self->_optionsTableView;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView _reloadSectionHeaderFooters:withRowAnimation:](v9, "_reloadSectionHeaderFooters:withRowAnimation:", v10, v4);

    -[PXAlbumStreamingOptionsViewController _setShowingPublicURLActivitySpinner:](self, "_setShowingPublicURLActivitySpinner:", -[PXAlbumStreamingOptionsViewController _shouldShowPublicURLActivitySpinner](self, "_shouldShowPublicURLActivitySpinner"));
    -[PXAlbumStreamingOptionsViewController _setLastPublicURLSectionFooterTitle:](self, "_setLastPublicURLSectionFooterTitle:", v6);
  }

}

- (void)_updateMultipleContributorsState
{
  id v3;
  UITableView *optionsTableView;
  void *v5;
  id v6;

  if (self->_streamOwner)
    -[PXAlbumStreamingOptionsViewController _updateWantsMultipleContributorsField](self, "_updateWantsMultipleContributorsField");
  -[PXAlbumStreamingOptionsViewController tableView:titleForFooterInSection:](self, "tableView:titleForFooterInSection:", self->_optionsTableView, 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXAlbumStreamingOptionsViewController _lastMultiContributorsSectionFooterTitle](self, "_lastMultiContributorsSectionFooterTitle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 != v3 && (objc_msgSend(v3, "isEqualToString:", v6) & 1) == 0)
  {
    optionsTableView = self->_optionsTableView;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView _reloadSectionHeaderFooters:withRowAnimation:](optionsTableView, "_reloadSectionHeaderFooters:withRowAnimation:", v5, 5);

    -[PXAlbumStreamingOptionsViewController _setLastMultiContributorsSectionFooterTitle:](self, "_setLastMultiContributorsSectionFooterTitle:", v6);
  }

}

- (void)_resendInvitationToSelectedSubscriber
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[PXAlbumStreamingOptionsViewController _selectedSubscriberInvitationRecord](self, "_selectedSubscriberInvitationRecord");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "album");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D71640], "resendPendingInvitationWithGUID:albumGUID:", v2, v4);
}

- (void)_displayConfirmationForRemovalOfSelectedSubscriber
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  _QWORD v15[5];

  -[PXAlbumStreamingOptionsViewController _selectedSubscriberInvitationRecord](self, "_selectedSubscriberInvitationRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inviteeDisplayNameIncludingEmail:", 0);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PLServicesLocalizedFrameworkString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAlbumStreamingOptionsViewController album](self, "album");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &stru_1E5149688;
  if (v7)
    v10 = (const __CFString *)v7;
  else
    v10 = &stru_1E5149688;
  if (v4)
    v9 = v4;
  v13 = v10;
  v14 = v9;
  PXStringWithValidatedFormat();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  PLServicesLocalizedFrameworkString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__PXAlbumStreamingOptionsViewController__displayConfirmationForRemovalOfSelectedSubscriber__block_invoke;
  v15[3] = &unk_1E5149198;
  v15[4] = self;
  -[PXAlbumStreamingOptionsViewController _displayConfirmationWithMessage:destructiveTitle:actionHandler:](self, "_displayConfirmationWithMessage:destructiveTitle:actionHandler:", v11, v12, v15, v13, v14);

}

- (void)_removeSelectedSubscriber
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  id v11;

  -[PXAlbumStreamingOptionsViewController _selectedSubscriberInvitationRecord](self, "_selectedSubscriberInvitationRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAlbumStreamingOptionsViewController album](self, "album");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__PXAlbumStreamingOptionsViewController__removeSelectedSubscriber__block_invoke;
  v9[3] = &unk_1E5148D08;
  v10 = v4;
  v11 = v3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PXAlbumStreamingOptionsViewController__removeSelectedSubscriber__block_invoke_2;
  v8[3] = &unk_1E5149198;
  v6 = v3;
  v7 = v4;
  objc_msgSend(v5, "performTransaction:completionHandler:", v9, v8);

}

- (void)invitationRecordsDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PXAlbumStreamingOptionsViewController album](self, "album");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "album");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    objc_msgSend(v4, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "refreshObject:mergeChanges:", v4, 0);

    if (objc_msgSend(v11, "invitationRecordsDidChange"))
    {
      _PXSharedAlbumRecipientsForAlbumIncludeCurrentUser(v4, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAlbumStreamingOptionsViewController setSharedAlbumRecipients:](self, "setSharedAlbumRecipients:", v10);

      -[UITableView reloadData](self->_optionsTableView, "reloadData");
    }
    -[PXAlbumStreamingOptionsViewController _updatePublicURLStateIfNecessaryAnimated:](self, "_updatePublicURLStateIfNecessaryAnimated:", 1);
    -[PXAlbumStreamingOptionsViewController _updateMultipleContributorsState](self, "_updateMultipleContributorsState");
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t showShareLink;
  _BOOL4 streamOwner;
  void *v9;
  uint64_t v10;
  unint64_t v11;

  v6 = a3;
  switch(a4)
  {
    case 0:
      if (-[PXAlbumStreamingOptionsViewController albumIsFamilyStream](self, "albumIsFamilyStream"))
      {
        showShareLink = -[NSArray count](self->_familyMembers, "count");
        self->_addSubscribersRow = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        streamOwner = self->_streamOwner;
        -[PXAlbumStreamingOptionsViewController sharedAlbumRecipients](self, "sharedAlbumRecipients");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");
        if (streamOwner)
        {

          showShareLink = v10 + 1;
          if (v10 == -1)
            v11 = 0;
          else
            v11 = v10;
          self->_addSubscribersRow = v11;
        }
        else
        {

          self->_addSubscribersRow = 0x7FFFFFFFFFFFFFFFLL;
          showShareLink = v10;
        }
      }
      break;
    case 1:
      if (self->_streamOwner
        && !-[PXAlbumStreamingOptionsViewController albumIsFamilyStream](self, "albumIsFamilyStream"))
      {
        goto LABEL_7;
      }
      goto LABEL_6;
    case 2:
      showShareLink = self->_showShareLink;
      if (self->_streamOwner)
      {
        if (self->_showShareLink)
          showShareLink = 2;
        else
          showShareLink = 1;
      }
      break;
    case 3:
LABEL_7:
      showShareLink = 1;
      break;
    case 4:
      showShareLink = -[PXAlbumStreamingOptionsViewController albumIsFamilyStream](self, "albumIsFamilyStream") ^ 1;
      break;
    default:
LABEL_6:
      showShareLink = 0;
      break;
  }

  return showShareLink;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  PXPersonTableViewCell *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  UISwitch *wantsMultipleContributorsSwitch;
  UISwitch *v28;
  UISwitch *v29;
  void *v30;
  void *v31;
  UISwitch *v32;
  UISwitch *wantsPublicWebsiteSwitch;
  void *v34;
  void *v35;
  UISwitch *v36;
  UISwitch *wantsAcceptCloudNotificationSwitch;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  PXPersonTableViewCell *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  __objc2_class *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  _BOOL4 v77;
  const char *v78;
  const char *v79;
  _QWORD v80[4];
  PXPersonTableViewCell *v81;
  uint64_t v82;
  uint64_t v83;
  void (*v84)(uint64_t);
  void *v85;
  PXAlbumStreamingOptionsViewController *v86;
  id v87;
  id v88;
  PXPersonTableViewCell *v89;
  _QWORD v90[2];
  _QWORD v91[4];

  v91[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  switch(objc_msgSend(v8, "section"))
  {
    case 0:
      -[PXAlbumStreamingOptionsViewController album](self, "album");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isFamilyCloudSharedAlbum");

      if (!v10)
      {
        v51 = objc_msgSend(v8, "row");
        if (v51 == self->_addSubscribersRow)
        {
          v11 = (PXPersonTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, 0);
          -[PXPersonTableViewCell setSelectionStyle:](v11, "setSelectionStyle:", 1);
          objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          +[PXPersonTableViewCell avatarHeight](PXPersonTableViewCell, "avatarHeight");
          v53 = v52;
          -[PXPersonTableViewCell defaultContentConfiguration](v11, "defaultContentConfiguration");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setImage:", v38);
          PLServicesLocalizedFrameworkString();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setText:", v54);

          objc_msgSend(v40, "imageProperties");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setReservedLayoutSize:", v53, v53);

          objc_msgSend(MEMORY[0x1E0DC3658], "_systemInteractionTintColor");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "textProperties");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setColor:", v56);

          -[PXPersonTableViewCell setContentConfiguration:](v11, "setContentConfiguration:", v40);
          goto LABEL_21;
        }
        v58 = v51;
        v79 = a2;
        v59 = -[PXPersonTableViewCell initWithStyle:reuseIdentifier:]([PXPersonTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
        -[PXPersonTableViewCell setSelectionStyle:](v59, "setSelectionStyle:", 1);
        -[PXAlbumStreamingOptionsViewController sharedAlbumRecipients](self, "sharedAlbumRecipients");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "objectAtIndex:", v58);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        +[PXPersonTableViewCell avatarHeight](PXPersonTableViewCell, "avatarHeight");
        v62 = v61;
        objc_msgSend(v7, "px_screenScale");
        v64 = v63;
        v77 = objc_msgSend(v7, "effectiveUserInterfaceLayoutDirection") == 1;
        v65 = PXActivityUtilities;
        objc_msgSend(v38, "emailAddressString");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "phoneNumberString");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "firstName");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "lastName");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v80[0] = MEMORY[0x1E0C809B0];
        v80[1] = 3221225472;
        v80[2] = __73__PXAlbumStreamingOptionsViewController_tableView_cellForRowAtIndexPath___block_invoke_3;
        v80[3] = &unk_1E5128448;
        v11 = v59;
        v81 = v11;
        +[PXActivityUtilities requestPersonImageWithTargetSize:displayScale:isRTL:matchingEmail:orPhone:withFirstName:lastName:prefersPhotosImage:withCompletion:](PXActivityUtilities, "requestPersonImageWithTargetSize:displayScale:isRTL:matchingEmail:orPhone:withFirstName:lastName:prefersPhotosImage:withCompletion:", v77, v66, v67, v68, v69, 1, v62, v62, v64, v80);

        objc_msgSend(v38, "displayName");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPersonTableViewCell textLabel](v11, "textLabel");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setText:", v70);

        v72 = objc_msgSend(v38, "state");
        if (v72)
        {
          objc_msgSend(v38, "invitationRecord");
          v65 = (__objc2_class *)objc_claimAutoreleasedReturnValue();
          -[__objc2_class invitationStateDescription](v65, "invitationStateDescription");
        }
        else
        {
          PLServicesLocalizedFrameworkString();
        }
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPersonTableViewCell detailTextLabel](v11, "detailTextLabel");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "setText:", v73);

        a2 = v79;
        if (v72)
        {

          v73 = v65;
        }

        -[PXPersonTableViewCell setAccessoryType:](v11, "setAccessoryType:", 1);
        goto LABEL_22;
      }
      v76 = v7;
      v78 = a2;
      v11 = -[PXPersonTableViewCell initWithStyle:reuseIdentifier:]([PXPersonTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
      -[NSArray objectAtIndexedSubscript:](self->_familyMembers, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appleID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_familyProfilePictures, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        dispatch_get_global_queue(0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = MEMORY[0x1E0C809B0];
        v83 = 3221225472;
        v84 = __73__PXAlbumStreamingOptionsViewController_tableView_cellForRowAtIndexPath___block_invoke;
        v85 = &unk_1E513DD48;
        v86 = self;
        v87 = v12;
        v88 = v13;
        v89 = v11;
        pl_dispatch_async();

      }
      -[PXPersonTableViewCell setPersonIcon:](v11, "setPersonIcon:", v14);
      v16 = objc_alloc_init(MEMORY[0x1E0CB3850]);
      objc_msgSend(v12, "lastName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFamilyName:", v17);

      objc_msgSend(v12, "firstName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setGivenName:", v18);

      v19 = objc_alloc_init(MEMORY[0x1E0CB3858]);
      objc_msgSend(v19, "setStyle:", 0);
      objc_msgSend(v19, "stringFromPersonNameComponents:", v16);
      v75 = v13;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPersonTableViewCell textLabel](v11, "textLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setText:", v20);

      objc_msgSend(v12, "title");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPersonTableViewCell detailTextLabel](v11, "detailTextLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setText:", v22);

      -[PXPersonTableViewCell setSelectionStyle:](v11, "setSelectionStyle:", 0);
      v7 = v76;
      a2 = v78;
      if (!v11)
        goto LABEL_25;
      goto LABEL_23;
    case 1:
      v11 = (PXPersonTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, 0);
      PLServicesLocalizedFrameworkString();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPersonTableViewCell textLabel](v11, "textLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setText:", v24);

      -[PXPersonTableViewCell setSelectionStyle:](v11, "setSelectionStyle:", 0);
      v26 = 1024;
      wantsMultipleContributorsSwitch = self->_wantsMultipleContributorsSwitch;
      if (wantsMultipleContributorsSwitch)
        goto LABEL_16;
      v28 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0DC3D18]);
      v29 = self->_wantsMultipleContributorsSwitch;
      self->_wantsMultipleContributorsSwitch = v28;

      -[UISwitch addTarget:action:forControlEvents:](self->_wantsMultipleContributorsSwitch, "addTarget:action:forControlEvents:", self, sel__changeWantsMultipleContributors_, 4096);
      -[PXAlbumStreamingOptionsViewController _updateWantsMultipleContributorsField](self, "_updateWantsMultipleContributorsField");
      goto LABEL_15;
    case 2:
      if (objc_msgSend(v8, "row") || !-[PXAlbumStreamingOptionsViewController streamOwner](self, "streamOwner"))
      {
        v11 = (PXPersonTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, 0);
        PLServicesLocalizedFrameworkString();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPersonTableViewCell textLabel](v11, "textLabel");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setText:", v47);

        -[PXPersonTableViewCell textLabel](v11, "textLabel");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setTextAlignment:", 1);

        -[PXPersonTableViewCell setSelectionStyle:](v11, "setSelectionStyle:", 1);
        if (v11)
          goto LABEL_23;
        goto LABEL_25;
      }
      v11 = (PXPersonTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, 0);
      PLServicesLocalizedFrameworkString();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPersonTableViewCell textLabel](v11, "textLabel");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setText:", v30);

      -[PXPersonTableViewCell setSelectionStyle:](v11, "setSelectionStyle:", 0);
      v26 = 1016;
      wantsMultipleContributorsSwitch = self->_wantsPublicWebsiteSwitch;
      if (!wantsMultipleContributorsSwitch)
      {
        v32 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0DC3D18]);
        wantsPublicWebsiteSwitch = self->_wantsPublicWebsiteSwitch;
        self->_wantsPublicWebsiteSwitch = v32;

        -[UISwitch addTarget:action:forControlEvents:](self->_wantsPublicWebsiteSwitch, "addTarget:action:forControlEvents:", self, sel__changeWantsPublicWebsite_, 4096);
        -[PXAlbumStreamingOptionsViewController _updateWantsPublicWebsiteField](self, "_updateWantsPublicWebsiteField");
LABEL_15:
        wantsMultipleContributorsSwitch = *(UISwitch **)((char *)&self->super.super.super.isa + v26);
      }
LABEL_16:
      -[PXPersonTableViewCell setAccessoryView:](v11, "setAccessoryView:", wantsMultipleContributorsSwitch);
      if (!v11)
      {
LABEL_25:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAlbumStreamingOptionsViewController.m"), 1137, CFSTR("%@ no cell created for index path %@"), self, v8);

        v11 = 0;
      }
LABEL_23:

      return v11;
    case 3:
      v11 = (PXPersonTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, 0);
      PLServicesLocalizedFrameworkString();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPersonTableViewCell textLabel](v11, "textLabel");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setText:", v34);

      -[PXPersonTableViewCell setSelectionStyle:](v11, "setSelectionStyle:", 0);
      v26 = 1032;
      wantsMultipleContributorsSwitch = self->_wantsAcceptCloudNotificationSwitch;
      if (wantsMultipleContributorsSwitch)
        goto LABEL_16;
      v36 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0DC3D18]);
      wantsAcceptCloudNotificationSwitch = self->_wantsAcceptCloudNotificationSwitch;
      self->_wantsAcceptCloudNotificationSwitch = v36;

      -[UISwitch addTarget:action:forControlEvents:](self->_wantsAcceptCloudNotificationSwitch, "addTarget:action:forControlEvents:", self, sel__changeWantsAcceptCloudNotification_, 4096);
      -[PXAlbumStreamingOptionsViewController _updateWantsAcceptCloudNotificationField](self, "_updateWantsAcceptCloudNotificationField");
      goto LABEL_15;
    case 4:
      -[PXAlbumStreamingOptionsViewController streamOwner](self, "streamOwner");
      PLServicesLocalizedFrameworkString();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(v39, "mutableCopy");

      objc_msgSend(v40, "setAlignment:", 1);
      v41 = objc_alloc(MEMORY[0x1E0CB3498]);
      v90[0] = *MEMORY[0x1E0DC1140];
      objc_msgSend(MEMORY[0x1E0DC3658], "_systemDestructiveTintColor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v90[1] = *MEMORY[0x1E0DC1178];
      v91[0] = v42;
      v91[1] = v40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)objc_msgSend(v41, "initWithString:attributes:", v38, v43);

      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("DeleteStreamReuseIdentifier"));
      v11 = (PXPersonTableViewCell *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        v11 = (PXPersonTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("DeleteStreamReuseIdentifier"));
      -[PXPersonTableViewCell textLabel](v11, "textLabel");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setAttributedText:", v44);

LABEL_21:
LABEL_22:

      if (v11)
        goto LABEL_23;
      goto LABEL_25;
    default:
      goto LABEL_25;
  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 streamOwner;
  _BOOL4 v11;
  void *v12;
  NSString *v13;
  NSString *visiblePublicURL;
  void *v15;

  -[PXAlbumStreamingOptionsViewController album](self, "album", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 1)
  {
    if (!-[PXAlbumStreamingOptionsViewController albumIsFamilyStream](self, "albumIsFamilyStream"))
    {
      streamOwner = self->_streamOwner;
      v11 = -[PXAlbumStreamingOptionsViewController _multipleContributorsEnabled](self, "_multipleContributorsEnabled");
      if (!streamOwner && !v11)
        goto LABEL_5;
    }
    goto LABEL_17;
  }
  if (a4 == 3)
  {
    -[PXAlbumStreamingOptionsViewController albumIsFamilyStream](self, "albumIsFamilyStream");
    goto LABEL_17;
  }
  if (a4 != 2 || -[PXAlbumStreamingOptionsViewController albumIsFamilyStream](self, "albumIsFamilyStream"))
    goto LABEL_5;
  v8 = self->_streamOwner;
  v9 = -[PXAlbumStreamingOptionsViewController _publicURLEnabled](self, "_publicURLEnabled");
  if (v8)
  {
    if (v9)
      goto LABEL_16;
LABEL_17:
    PLServicesLocalizedFrameworkString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (v9)
  {
LABEL_16:
    objc_msgSend(v6, "publicURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (NSString *)objc_msgSend(v12, "copy");
    visiblePublicURL = self->_visiblePublicURL;
    self->_visiblePublicURL = v13;

    PLServicesLocalizedFrameworkString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
LABEL_5:
  v7 = 0;
LABEL_18:

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  PLPublicURLActivityView *v5;
  _BOOL8 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;

  if (a4 == 2 && !-[PXAlbumStreamingOptionsViewController albumIsFamilyStream](self, "albumIsFamilyStream", a3))
  {
    v6 = -[PXAlbumStreamingOptionsViewController _shouldShowPublicURLActivitySpinner](self, "_shouldShowPublicURLActivitySpinner");
    if (v6)
    {
      -[UITableView bounds](self->_optionsTableView, "bounds");
      v8 = v7;
      v10 = v9;
      -[UITableView rowHeight](self->_optionsTableView, "rowHeight");
      v12 = v11;
      -[PXAlbumStreamingOptionsViewController album](self, "album");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cloudPublicURLEnabledLocal");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "BOOLValue");

      v5 = -[PLPublicURLActivityView initWithFrame:turningPublicURLON:]([PLPublicURLActivityView alloc], "initWithFrame:turningPublicURLON:", v15, v8, 0.0, v10, v12);
    }
    else
    {
      v5 = 0;
    }
    -[PXAlbumStreamingOptionsViewController _setShowingPublicURLActivitySpinner:](self, "_setShowingPublicURLActivitySpinner:", v6);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "section");
  -[PXAlbumStreamingOptionsViewController album](self, "album");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 == 4)
  {
    -[PXAlbumStreamingOptionsViewController _displayDeleteConfirmation:](self, "_displayDeleteConfirmation:", 0);
    objc_msgSend(v23, "deselectRowAtIndexPath:animated:", v6, 1);
  }
  else if (v7 == 2)
  {
    v12 = objc_msgSend(v6, "row");
    if (v12 == -[PXAlbumStreamingOptionsViewController streamOwner](self, "streamOwner"))
      -[PXAlbumStreamingOptionsViewController _displayActivitySheet](self, "_displayActivitySheet");
  }
  else if (!v7 && (objc_msgSend(v8, "isFamilyCloudSharedAlbum") & 1) == 0)
  {
    if (objc_msgSend(v6, "row") == self->_addSubscribersRow)
    {
      v10 = (void *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("PUAddSubscribersViewController"))), "initWithSharedAlbum:", v9);
      -[PXAlbumStreamingOptionsViewController navigationController](self, "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pushViewController:animated:", v10, 1);

    }
    else
    {
      -[PXAlbumStreamingOptionsViewController sharedAlbumRecipients](self, "sharedAlbumRecipients");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v6, "row"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "invitationRecord");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 && -[PXAlbumStreamingOptionsViewController streamOwner](self, "streamOwner"))
      {
        objc_msgSend(v14, "invitationState");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "integerValue");

        if (v16 == 2)
          v17 = 0;
        else
          v17 = sel__resendInvitationToSelectedSubscriber;
        v18 = sel__displayConfirmationForRemovalOfSelectedSubscriber;
      }
      else
      {
        v17 = 0;
        v18 = 0;
      }
      -[PXAlbumStreamingOptionsViewController _setSelectedSubscriberInvitationRecord:](self, "_setSelectedSubscriberInvitationRecord:", v14);
      +[PXAlbumStreamingOptionsViewController contactsViewControllerForRecipient:resendInvitationSelector:removeSubscriberSelector:target:](PXAlbumStreamingOptionsViewController, "contactsViewControllerForRecipient:resendInvitationSelector:removeSubscriberSelector:target:", v10, v17, v18, self);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "setHidesBottomBarWhenPushed:", 1);
        -[PXAlbumStreamingOptionsViewController navigationItem](self, "navigationItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setBackButtonDisplayMode:", 1);

        -[PXAlbumStreamingOptionsViewController navigationController](self, "navigationController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "pushViewController:animated:", v20, 1);

      }
    }

  }
}

- (PXAlbumStreamingOptionsViewControllerDelegate)delegate
{
  return (PXAlbumStreamingOptionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PLCloudSharedAlbum)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_album, a3);
}

- (BOOL)isPresentedModally
{
  return self->_presentedModally;
}

- (NSString)albumName
{
  return self->_albumName;
}

- (void)setAlbumName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1112);
}

- (NSArray)sharedAlbumRecipients
{
  return self->_sharedAlbumRecipients;
}

- (void)setSharedAlbumRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_sharedAlbumRecipients, a3);
}

- (BOOL)streamOwner
{
  return self->_streamOwner;
}

- (void)setStreamOwner:(BOOL)a3
{
  self->_streamOwner = a3;
}

- (PLCloudSharedAlbumInvitationRecord)_selectedSubscriberInvitationRecord
{
  return self->__selectedSubscriberInvitationRecord;
}

- (void)_setSelectedSubscriberInvitationRecord:(id)a3
{
  objc_storeStrong((id *)&self->__selectedSubscriberInvitationRecord, a3);
}

- (BOOL)_shouldScrollToTopOnNextViewLayout
{
  return self->__shouldScrollToTopOnNextViewLayout;
}

- (void)_setShouldScrollToTopOnNextViewLayout:(BOOL)a3
{
  self->__shouldScrollToTopOnNextViewLayout = a3;
}

- (NSString)_lastPublicURLSectionFooterTitle
{
  return self->__lastPublicURLSectionFooterTitle;
}

- (void)_setLastPublicURLSectionFooterTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1136);
}

- (NSString)_lastMultiContributorsSectionFooterTitle
{
  return self->__lastMultiContributorsSectionFooterTitle;
}

- (void)_setLastMultiContributorsSectionFooterTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1144);
}

- (BOOL)albumIsFamilyStream
{
  return self->_albumIsFamilyStream;
}

- (void)setAlbumIsFamilyStream:(BOOL)a3
{
  self->_albumIsFamilyStream = a3;
}

- (BOOL)_showingPublicURLActivitySpinner
{
  return self->__showingPublicURLActivitySpinner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__lastMultiContributorsSectionFooterTitle, 0);
  objc_storeStrong((id *)&self->__lastPublicURLSectionFooterTitle, 0);
  objc_storeStrong((id *)&self->__selectedSubscriberInvitationRecord, 0);
  objc_storeStrong((id *)&self->_sharedAlbumRecipients, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_familyProfilePictures, 0);
  objc_storeStrong((id *)&self->_familyMemberPictureStore, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
  objc_storeStrong((id *)&self->_familyAccountStore, 0);
  objc_storeStrong((id *)&self->_familyRequestQueue, 0);
  objc_storeStrong((id *)&self->_wantsAcceptCloudNotificationSwitch, 0);
  objc_storeStrong((id *)&self->_wantsMultipleContributorsSwitch, 0);
  objc_storeStrong((id *)&self->_wantsPublicWebsiteSwitch, 0);
  objc_storeStrong((id *)&self->_optionsTableView, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_phAlbum, 0);
  objc_storeStrong((id *)&self->_visiblePublicURL, 0);
}

void __73__PXAlbumStreamingOptionsViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "profilePictureForFamilyMember:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v3 = v2;
  pl_dispatch_async();

}

void __73__PXAlbumStreamingOptionsViewController_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v7)
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      if (v11)
      {
        v15 = 138412290;
        v16 = v9;
        v12 = "Request for subscriber avatar failed with error: %@";
        v13 = v10;
        v14 = 12;
LABEL_8:
        _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v15, v14);
      }
    }
    else if (v11)
    {
      LOWORD(v15) = 0;
      v12 = "Request for subscriber avatar failed";
      v13 = v10;
      v14 = 2;
      goto LABEL_8;
    }

    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "setPersonIcon:", v7);
LABEL_10:

}

uint64_t __73__PXAlbumStreamingOptionsViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 56), "setPersonIcon:", *(_QWORD *)(a1 + 48));
}

uint64_t __66__PXAlbumStreamingOptionsViewController__removeSelectedSubscriber__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "userDeleteSubscriberRecord:", *(_QWORD *)(a1 + 40));
}

void __66__PXAlbumStreamingOptionsViewController__removeSelectedSubscriber__block_invoke_2(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

uint64_t __91__PXAlbumStreamingOptionsViewController__displayConfirmationForRemovalOfSelectedSubscriber__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeSelectedSubscriber");
}

_BYTE *__82__PXAlbumStreamingOptionsViewController__updatePublicURLStateIfNecessaryAnimated___block_invoke(uint64_t a1)
{
  int v2;
  _BYTE *result;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_publicURLEnabled");
  result = *(_BYTE **)(a1 + 32);
  if (result[976] != v2)
  {
    result[976] = v2;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(*(id *)(a1 + 32), "streamOwner"), 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    if (v2)
      objc_msgSend(v5, "insertRowsAtIndexPaths:withRowAnimation:", v6, v7);
    else
      objc_msgSend(v5, "deleteRowsAtIndexPaths:withRowAnimation:", v6, v7);

    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_reloadSectionHeaderFooters:withRowAnimation:", v9, *(_QWORD *)(a1 + 40));

    result = *(_BYTE **)(a1 + 32);
  }
  if (result[1089])
    return (_BYTE *)objc_msgSend(result, "_updateWantsPublicWebsiteField");
  return result;
}

uint64_t __68__PXAlbumStreamingOptionsViewController__displayDeleteConfirmation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deletePhotoStream");
}

uint64_t __104__PXAlbumStreamingOptionsViewController__displayConfirmationWithMessage_destructiveTitle_actionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__PXAlbumStreamingOptionsViewController__deletePhotoStream__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "userTrashAlbums:", v2);

}

uint64_t __59__PXAlbumStreamingOptionsViewController__deletePhotoStream__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCompletionWithReason:", 3);
}

uint64_t __74__PXAlbumStreamingOptionsViewController__changeWantsMultipleContributors___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCloudMultipleContributorsEnabledLocal:", v2);

  return objc_msgSend(MEMORY[0x1E0D719E0], "updateCloudSharedAlbumMultipleContributorsStateOnServer:", *(_QWORD *)(a1 + 32));
}

uint64_t __74__PXAlbumStreamingOptionsViewController__changeWantsMultipleContributors___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMultipleContributorsState");
}

uint64_t __77__PXAlbumStreamingOptionsViewController__changeWantsAcceptCloudNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCloudNotificationsEnabled:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __67__PXAlbumStreamingOptionsViewController__changeWantsPublicWebsite___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCloudPublicURLEnabledLocal:", v2);

  return objc_msgSend(MEMORY[0x1E0D719E0], "updateCloudSharedAlbumPublicURLStateOnServer:", *(_QWORD *)(a1 + 32));
}

uint64_t __67__PXAlbumStreamingOptionsViewController__changeWantsPublicWebsite___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePublicURLStateIfNecessaryAnimated:", 1);
}

void __55__PXAlbumStreamingOptionsViewController_initWithAlbum___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Error loading family members for family shared album: %@", (uint8_t *)&v12, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v3, "members");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 1064);
    *(_QWORD *)(v8 + 1064) = v7;

    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadSections:withRowAnimation:", v11, 100);

  }
}

+ (id)contactsViewControllerForRecipient:(id)a3 resendInvitationSelector:(SEL)a4 removeSubscriberSelector:(SEL)a5 target:(id)a6
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a6;
  v9 = 0x1E0C97000uLL;
  objc_msgSend(MEMORY[0x1E0C974D8], "descriptorForRequiredKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v44 = 0;
  objc_msgSend(v7, "matchingContactWithKeysToFetch:outMatchingKey:outMatchingIdentifier:", v11, &v44, &v43);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v44;
  v14 = v43;

  PLServicesLocalizedFrameworkString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PLServicesLocalizedFrameworkString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v14;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForContact:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) - 1) <= 1)
      objc_msgSend(v17, "setDisplayMode:", 1);
    objc_msgSend(v17, "setAllowsEditing:", 0);
    objc_msgSend(v17, "setAllowsActions:", 0);
    if (v13 && v14)
      objc_msgSend(v17, "highlightPropertyWithKey:identifier:", v13, v14);
    objc_msgSend(v17, "contentViewController");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cardFooterGroup");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
      objc_msgSend(v18, "addActionWithTitle:target:selector:inGroup:destructive:", v15, v8, a4, v19, 0);
    if (a5)
      objc_msgSend(v18, "addActionWithTitle:target:selector:inGroup:destructive:", v16, v8, a5, v19, 1);
  }
  else
  {
    v39 = v15;
    objc_msgSend(v7, "emailAddressString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {

    }
    else
    {
      objc_msgSend(v7, "phoneNumberString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        v17 = 0;
        v15 = v39;
        goto LABEL_26;
      }
    }
    v18 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(v7, "firstName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setGivenName:", v22);

    objc_msgSend(v7, "lastName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFamilyName:", v23);

    objc_msgSend(v7, "emailAddressString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = objc_alloc(MEMORY[0x1E0C97338]);
      v26 = *MEMORY[0x1E0C96FF8];
      objc_msgSend(v7, "emailAddressString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v25, "initWithLabel:value:", v26, v27);

      v46 = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setEmailAddresses:", v29);

      v9 = 0x1E0C97000;
    }
    objc_msgSend(v7, "phoneNumberString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = (void *)MEMORY[0x1E0C97398];
      objc_msgSend(v7, "phoneNumberString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "phoneNumberWithStringValue:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = objc_alloc(MEMORY[0x1E0C97338]);
      v35 = (void *)objc_msgSend(v34, "initWithLabel:value:", *MEMORY[0x1E0C97058], v33);
      v45 = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPhoneNumbers:", v36);

      v9 = 0x1E0C97000uLL;
    }
    objc_msgSend(*(id *)(v9 + 1240), "viewControllerForUnknownContact:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) - 1) <= 1)
      objc_msgSend(v17, "setDisplayMode:", 1);
    objc_msgSend(v17, "setAllowsActions:", 1);
    objc_msgSend(v17, "contentViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAllowsAddingToAddressBook:", 1);
    objc_msgSend(v19, "cardFooterGroup");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
      objc_msgSend(v19, "addActionWithTitle:target:selector:inGroup:destructive:", v39, v8, a4, v37, 0);
    if (a5)
      objc_msgSend(v19, "addActionWithTitle:target:selector:inGroup:destructive:", v16, v8, a5, v37, 1);

    v15 = v39;
  }

  v14 = v42;
LABEL_26:

  return v17;
}

@end
