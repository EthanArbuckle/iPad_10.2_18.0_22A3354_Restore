@implementation RCFolderViewController

- (BOOL)_shouldDisplaySiriTipView
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned __int8 v6;
  unsigned int v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  v4 = objc_msgSend(v3, "assistantIsEnabled");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("RCSiriTipViewWasDismissed"));

  v7 = -[RCFolderViewController supportsRecording](self, "supportsRecording");
  if (v7)
    LOBYTE(v7) = v4 & (v6 ^ 1);
  return v7;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RCFolderViewController;
  -[RCFolderViewController viewDidLayoutSubviews](&v10, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController navigationItem](self, "navigationItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchController"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingsCollectionViewController](self, "recordingsCollectionViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchController"));

    objc_msgSend(v3, "setSearchController:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v8 = objc_msgSend(v7, "pinsSearchBarInLibrary");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v9, "setHidesSearchBarWhenScrolling:", 0);

    }
  }

}

- (void)_commonInit
{
  RCRecordingViewController *v3;

  v3 = objc_opt_new(RCRecordingViewController);
  -[RCFolderViewController setRecordingViewController:](self, "setRecordingViewController:", v3);
  -[RCFolderViewController setShouldDisplaySiriTipView:](self, "setShouldDisplaySiriTipView:", -[RCFolderViewController _shouldDisplaySiriTipView](self, "_shouldDisplaySiriTipView"));

}

- (void)setFolderTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *folderTitle;
  id v7;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  folderTitle = self->_folderTitle;
  self->_folderTitle = v5;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v7, "setTitle:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCFolderViewController;
  -[RCFolderViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController navigationItem](self, "navigationItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_bottomPalette"));

  if (v5)
    objc_msgSend(v5, "setMinimumHeight:", 0.0);

}

- (void)setLibraryActionHandler:(id)a3
{
  RCLibraryActionHandler **p_libraryActionHandler;
  id v5;
  id v6;

  p_libraryActionHandler = &self->_libraryActionHandler;
  v5 = a3;
  objc_storeWeak((id *)p_libraryActionHandler, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingsCollectionViewController](self, "recordingsCollectionViewController"));
  objc_msgSend(v6, "setLibraryActionHandler:", v5);

}

- (void)setRecordingViewControllerDelegate:(id)a3
{
  RCRecordingViewControllerDelegate **p_recordingViewControllerDelegate;
  id v5;
  id v6;

  p_recordingViewControllerDelegate = &self->_recordingViewControllerDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_recordingViewControllerDelegate, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingViewController](self, "recordingViewController"));
  objc_msgSend(v6, "setRecordingViewControllerDelegate:", v5);

}

- (void)setRecordingViewController:(id)a3
{
  void *v5;
  id v6;

  objc_storeStrong((id *)&self->_recordingViewController, a3);
  v6 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingViewControllerDelegate](self, "recordingViewControllerDelegate"));
  objc_msgSend(v6, "setRecordingViewControllerDelegate:", v5);

  -[RCFolderViewController addChildViewController:](self, "addChildViewController:", v6);
  objc_msgSend(v6, "didMoveToParentViewController:", self);

}

- (void)setRecordingsCollectionViewController:(id)a3
{
  RCRecordingsCollectionViewController **p_recordingsCollectionViewController;
  id v6;
  id v7;

  p_recordingsCollectionViewController = &self->_recordingsCollectionViewController;
  objc_storeStrong((id *)&self->_recordingsCollectionViewController, a3);
  v6 = a3;
  objc_msgSend(v6, "willMoveToParentViewController:", self);
  -[RCFolderViewController addChildViewController:](self, "addChildViewController:", v6);
  objc_msgSend(v6, "didMoveToParentViewController:", self);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderViewController libraryActionHandler](self, "libraryActionHandler"));
  -[RCRecordingsCollectionViewController setLibraryActionHandler:](*p_recordingsCollectionViewController, "setLibraryActionHandler:", v7);

}

- (RCFolderViewController)initWithBuiltInFolderType:(int64_t)a3 folderUUID:(id)a4
{
  id v6;
  RCFolderViewController *v7;
  RCFolderViewController *v8;
  NSString *v9;
  NSString *folderUUID;
  RCRecentlyDeletedRecordingsCollectionViewController *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  RCRecordingsCollectionViewController *v34;
  objc_super v36;

  v6 = a4;
  v36.receiver = self;
  v36.super_class = (Class)RCFolderViewController;
  v7 = -[RCFolderViewController init](&v36, "init");
  v8 = v7;
  if (v7)
  {
    v7->_folderType = a3;
    v9 = (NSString *)objc_msgSend(v6, "copy");
    folderUUID = v8->_folderUUID;
    v8->_folderUUID = v9;

    -[RCFolderViewController _commonInit](v8, "_commonInit");
    if (a3 == 3)
    {
      v11 = objc_alloc_init(RCRecentlyDeletedRecordingsCollectionViewController);
      -[RCFolderViewController setRecordingsCollectionViewController:](v8, "setRecordingsCollectionViewController:", v11);

      v12 = objc_alloc((Class)UIBarButtonItem);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("RECOVER_ALL"), &stru_1001B2BC0, 0));
      v15 = objc_msgSend(v12, "initWithTitle:style:target:action:", v14, 0, v8, "_handleRecoverAll:");
      -[RCFolderViewController setRecoverRecordingsButton:](v8, "setRecoverRecordingsButton:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("RECOVER_ALL"), &stru_1001B2BC0, 0));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("RECOVER"), &stru_1001B2BC0, 0));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, v19, 0));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recoverRecordingsButton](v8, "recoverRecordingsButton"));
      objc_msgSend(v21, "setPossibleTitles:", v20);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recoverRecordingsButton](v8, "recoverRecordingsButton"));
      objc_msgSend(v22, "setEnabled:", 1);

      v23 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, v8, 0);
      -[RCFolderViewController setFlexBarItem:](v8, "setFlexBarItem:", v23);

      v24 = objc_alloc((Class)UIBarButtonItem);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("DELETE_ALL"), &stru_1001B2BC0, 0));
      v27 = objc_msgSend(v24, "initWithTitle:style:target:action:", v26, 0, v8, "_handleEraseAll:");
      -[RCFolderViewController setEraseRecordingsButton:](v8, "setEraseRecordingsButton:", v27);

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("DELETE_ALL"), &stru_1001B2BC0, 0));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1001B2BC0, 0));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v29, v31, 0));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController eraseRecordingsButton](v8, "eraseRecordingsButton"));
      objc_msgSend(v33, "setPossibleTitles:", v32);

      v34 = (RCRecordingsCollectionViewController *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController eraseRecordingsButton](v8, "eraseRecordingsButton"));
      -[RCRecordingsCollectionViewController setEnabled:](v34, "setEnabled:", 1);
    }
    else
    {
      v34 = -[RCRecordingsCollectionViewController initWithBuiltInFolderType:folderUUID:]([RCRecordingsCollectionViewController alloc], "initWithBuiltInFolderType:folderUUID:", a3, v6);
      -[RCFolderViewController setRecordingsCollectionViewController:](v8, "setRecordingsCollectionViewController:", v34);
    }

  }
  return v8;
}

- (void)_setupNavigationBarPalette
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _TtC10VoiceMemos22RCSiriTipContainerView *v14;
  id v15;
  id v16;

  v16 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderViewController navigationItem](self, "navigationItem"));
  if (-[RCFolderViewController shouldDisplaySiriTipView](self, "shouldDisplaySiriTipView"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_bottomPalette"));

    if (!v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController navigationController](self, "navigationController"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationBar"));
      objc_msgSend(v5, "frame");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;

      v14 = -[RCSiriTipContainerView initWithFrame:]([_TtC10VoiceMemos22RCSiriTipContainerView alloc], "initWithFrame:", v7, v9, v11, v13);
      -[RCSiriTipContainerView setDelegate:](v14, "setDelegate:", self);
      v15 = objc_msgSend(objc_alloc((Class)_UINavigationBarPalette), "initWithContentView:", v14);
      objc_msgSend(v16, "_setBottomPalette:", v15);
      objc_msgSend(v15, "_setLayoutPriority:", 2);
      objc_msgSend(v15, "_setContentViewMarginType:", 1);
      -[RCFolderViewController _updateNavigationBarPaletteHeightIfNeeded](self, "_updateNavigationBarPaletteHeightIfNeeded");

    }
  }

}

- (BOOL)isSetup
{
  return self->_isSetup;
}

- (void)_updateNavigationBarPaletteHeightIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController navigationItem](self, "navigationItem"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_bottomPalette"));

  v3 = v12;
  if (v12)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentView"));
    v6 = objc_opt_class(_TtC10VoiceMemos22RCSiriTipContainerView, v5);
    isKindOfClass = objc_opt_isKindOfClass(v4, v6);

    v3 = v12;
    if ((isKindOfClass & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentView"));
      objc_msgSend(v8, "preferredHeight");
      v10 = v9;
      objc_msgSend(v12, "preferredHeight");
      if (v11 != v10)
        objc_msgSend(v12, "setPreferredHeight:", v10);

      v3 = v12;
    }
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void (**v5)(void);
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RCFolderViewController;
  -[RCFolderViewController viewWillAppear:](&v10, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController setupBlock](self, "setupBlock"));

  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[RCFolderViewController setupBlock](self, "setupBlock"));
    v5[2]();

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController folderTitle](self, "folderTitle"));
  v7 = objc_claimAutoreleasedReturnValue(-[RCFolderViewController navigationItem](self, "navigationItem"));
  objc_msgSend((id)v7, "setTitle:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  LOBYTE(v7) = objc_msgSend(v8, "usesLargeTitles");

  if ((v7 & 1) == 0 && (id)-[RCFolderViewController folderType](self, "folderType") == (id)3)
  {
    -[RCFolderViewController _setupRecentlyDeletedToolbarItemsWithCount:](self, "_setupRecentlyDeletedToolbarItemsWithCount:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController navigationController](self, "navigationController"));
    objc_msgSend(v9, "setToolbarHidden:animated:", 0, 1);

  }
  -[RCFolderViewController setIsInactive:](self, "setIsInactive:", 0);
}

- (id)setupBlock
{
  return self->_setupBlock;
}

- (void)updateNavBarTitleAndDeleteButtonForRecordingsCount:(unint64_t)a3 isEditMode:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a4;
  v19 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v19, "_setSupportsTwoLineLargeTitles:", 1);
  if (v4)
  {
    if (a3)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%lu Selected"), &stru_1001B2BC0, 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, a3));
      objc_msgSend(v19, "setTitle:", v9);

    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController folderTitle](self, "folderTitle"));
      objc_msgSend(v19, "setTitle:", v7);
    }

    -[RCFolderViewController _updateToolbarItemsWithCount:](self, "_updateToolbarItemsWithCount:", a3);
  }
  else if (-[RCFolderViewController hideNavigationTitle](self, "hideNavigationTitle"))
  {
    objc_msgSend(v19, "setTitle:", &stru_1001B2BC0);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v11 = objc_msgSend(v10, "usesLargeTitles");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController folderTitle](self, "folderTitle"));
      objc_msgSend(v19, "setTitle:", v12);

    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingsCollectionViewController](self, "recordingsCollectionViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "editButtonItem"));
  if (objc_msgSend(v14, "isEnabled"))
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "editButtonItem"));
  else
    v15 = 0;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController navigationItem](self, "navigationItem"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "rightBarButtonItem"));

  if (v15 != v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v18, "setRightBarButtonItem:animated:", v15, 1);

  }
}

- (BOOL)isInactive
{
  return self->_isInactive;
}

- (void)viewDidLoad
{
  RCFolderView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)RCFolderViewController;
  -[RCFolderViewController viewDidLoad](&v18, "viewDidLoad");
  v3 = objc_opt_new(RCFolderView);
  -[RCFolderView setDelegate:](v3, "setDelegate:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingsCollectionViewController](self, "recordingsCollectionViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  -[RCFolderView setRecordingsCollectionViewControllerWrapperView:](v3, "setRecordingsCollectionViewControllerWrapperView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingsCollectionViewController](self, "recordingsCollectionViewController"));
  objc_msgSend(v6, "setEditStateHandler:", v3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingViewController](self, "recordingViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  -[RCFolderView setRecordingView:](v3, "setRecordingView:", v8);
  objc_msgSend(v8, "setAllowsNewRecordings:", -[RCFolderViewController supportsRecording](self, "supportsRecording"));
  objc_msgSend(v8, "reset");
  -[RCFolderViewController setView:](self, "setView:", v3);
  -[RCFolderView setNeedsUpdateConstraints](v3, "setNeedsUpdateConstraints");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v10 = objc_msgSend(v9, "usesLargeTitles");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingsCollectionViewController](self, "recordingsCollectionViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editButtonItem"));
    v13 = objc_msgSend(v12, "isEnabled");

    if (v13)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingsCollectionViewController](self, "recordingsCollectionViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editButtonItem"));
    }
    else
    {
      v14 = 0;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v15, "setRightBarButtonItem:", v14);

    if (v13)
    {

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v16, "setLargeTitleDisplayMode:", 1);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v17, "_setSupportsTwoLineLargeTitles:", 1);

  }
  -[RCFolderViewController _setupNavigationBarPalette](self, "_setupNavigationBarPalette");

}

- (RCRecordingsCollectionViewController)recordingsCollectionViewController
{
  return self->_recordingsCollectionViewController;
}

- (BOOL)supportsRecording
{
  return (-[RCFolderViewController folderType](self, "folderType") & 0xFFFFFFFFFFFFFFFELL) != 2;
}

- (int64_t)folderType
{
  return self->_folderType;
}

- (BOOL)shouldDisplaySiriTipView
{
  return self->_shouldDisplaySiriTipView;
}

- (void)setUndoManager:(id)a3
{
  objc_storeWeak((id *)&self->_undoManager, a3);
}

- (void)setTeardownBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setShouldDisplaySiriTipView:(BOOL)a3
{
  self->_shouldDisplaySiriTipView = a3;
}

- (void)setSetupBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setIsSetup:(BOOL)a3
{
  self->_isSetup = a3;
}

- (void)setIsInactive:(BOOL)a3
{
  self->_isInactive = a3;
}

- (RCRecordingViewController)recordingViewController
{
  return self->_recordingViewController;
}

- (RCRecordingViewControllerDelegate)recordingViewControllerDelegate
{
  return (RCRecordingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_recordingViewControllerDelegate);
}

- (RCLibraryActionHandler)libraryActionHandler
{
  return (RCLibraryActionHandler *)objc_loadWeakRetained((id *)&self->_libraryActionHandler);
}

- (BOOL)hideNavigationTitle
{
  return self->_hideNavigationTitle;
}

- (NSString)folderTitle
{
  return self->_folderTitle;
}

- (RCFolderViewController)initWithUserFolderNamed:(id)a3 folderUUID:(id)a4
{
  id v6;
  id v7;
  RCFolderViewController *v8;
  RCFolderViewController *v9;
  NSString *v10;
  NSString *folderUUID;
  RCRecordingsCollectionViewController *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RCFolderViewController;
  v8 = -[RCFolderViewController init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    v8->_folderType = 4;
    v10 = (NSString *)objc_msgSend(v7, "copy");
    folderUUID = v9->_folderUUID;
    v9->_folderUUID = v10;

    v12 = -[RCRecordingsCollectionViewController initWithUserFolderNamed:folderUUID:]([RCRecordingsCollectionViewController alloc], "initWithUserFolderNamed:folderUUID:", v6, v7);
    -[RCFolderViewController setRecordingsCollectionViewController:](v9, "setRecordingsCollectionViewController:", v12);

    -[RCFolderViewController _commonInit](v9, "_commonInit");
  }

  return v9;
}

- (BOOL)isRecordButtonVisible
{
  void *v3;
  unsigned int v4;

  if (-[RCFolderViewController supportsRecording](self, "supportsRecording"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController view](self, "view"));
    v4 = objc_msgSend(v3, "isRecordingViewHidden") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(void);
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController teardownBlock](self, "teardownBlock"));

  if (v5)
  {
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[RCFolderViewController teardownBlock](self, "teardownBlock"));
    v6[2]();

  }
  v7.receiver = self;
  v7.super_class = (Class)RCFolderViewController;
  -[RCFolderViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
  -[RCFolderViewController setIsInactive:](self, "setIsInactive:", 1);
}

- (id)undoManager
{
  return objc_loadWeakRetained((id *)&self->_undoManager);
}

- (id)_selectedUUIDForPlayback
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingsCollectionViewController](self, "recordingsCollectionViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuidOfSelectedRecording"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingViewController](self, "recordingViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuidBeingDisplayed"));

  }
  return v4;
}

- (void)_updateToolbarItemsWithCount:(unint64_t)a3
{
  if ((id)-[RCFolderViewController folderType](self, "folderType") == (id)3)
    -[RCFolderViewController _setupRecentlyDeletedToolbarItemsWithCount:](self, "_setupRecentlyDeletedToolbarItemsWithCount:", a3);
  else
    -[RCFolderViewController _setupDeletableToolbarItemsWithCount:](self, "_setupDeletableToolbarItemsWithCount:", a3);
}

- (void)_setupRecentlyDeletedToolbarItemsWithCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char **v14;
  char **v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[3];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingsCollectionViewController](self, "recordingsCollectionViewController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionView"));

  if (objc_msgSend(v5, "isEditing")
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathsForSelectedItems")),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("RECOVER"), &stru_1001B2BC0, 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recoverRecordingsButton](self, "recoverRecordingsButton"));
    objc_msgSend(v10, "setTitle:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1001B2BC0, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController eraseRecordingsButton](self, "eraseRecordingsButton"));
    objc_msgSend(v13, "setTitle:", v12);
    v14 = &selRef__handleEraseSelected_;
    v15 = &selRef__handleRecoverSelected_;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("RECOVER_ALL"), &stru_1001B2BC0, 0));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recoverRecordingsButton](self, "recoverRecordingsButton"));
    objc_msgSend(v18, "setTitle:", v17);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DELETE_ALL"), &stru_1001B2BC0, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController eraseRecordingsButton](self, "eraseRecordingsButton"));
    objc_msgSend(v13, "setTitle:", v12);
    v14 = &selRef__handleEraseAll_;
    v15 = &selRef__handleRecoverAll_;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recoverRecordingsButton](self, "recoverRecordingsButton"));
  objc_msgSend(v19, "setAction:", *v15);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController eraseRecordingsButton](self, "eraseRecordingsButton"));
  objc_msgSend(v20, "setAction:", *v14);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recoverRecordingsButton](self, "recoverRecordingsButton"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController flexBarItem](self, "flexBarItem", v21));
  v25[1] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController eraseRecordingsButton](self, "eraseRecordingsButton"));
  v25[2] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 3));
  -[RCFolderViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v24, 1);

}

- (void)_setupDeletableToolbarItemsWithCount:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v6 = objc_alloc((Class)UIBarButtonItem);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shareToolbarMenuImage"));
  v8 = objc_msgSend(v6, "initWithImage:style:target:action:", v7, 0, self, "_performShareRows:");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AX_SHARE_BUTTON"), &stru_1001B2BC0, 0));
  objc_msgSend(v8, "setAccessibilityLabel:", v10);

  v11 = a3 != 0;
  objc_msgSend(v8, "setEnabled:", v11);
  v12 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, self, 0);
  v13 = objc_alloc((Class)UIBarButtonItem);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trashBottomToolbarImage"));
  v15 = objc_msgSend(v13, "initWithImage:style:target:action:", v14, 0, self, "_performDeleteItems:");

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("AX_DELETE"), &stru_1001B2BC0, 0));
  objc_msgSend(v15, "setAccessibilityLabel:", v17);

  objc_msgSend(v15, "setEnabled:", v11);
  v19[0] = v8;
  v19[1] = v12;
  v19[2] = v15;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 3));
  -[RCFolderViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v18, 0);

}

- (void)_clearNavigationBarPalette
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderViewController navigationItem](self, "navigationItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_bottomPalette"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "frame");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingsCollectionViewController](self, "recordingsCollectionViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionView"));

    objc_msgSend(v8, "contentOffset");
    v10 = v9;
    v12 = v6 + v11;
    objc_msgSend(v14, "_setBottomPalette:", 0);
    objc_msgSend(v8, "setContentOffset:animated:", 0, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingsCollectionViewController](self, "recordingsCollectionViewController"));
    objc_msgSend(v13, "scrollToTop");

  }
}

- (void)_performShareRows:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderViewController libraryActionHandler](self, "libraryActionHandler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingsCollectionViewController](self, "recordingsCollectionViewController"));
  objc_msgSend(v6, "performAction:atPosition:forUUID:sourceController:source:", 30, 0, v5, v4, 0.0);

}

- (void)_performDeleteItems:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingsCollectionViewController](self, "recordingsCollectionViewController", a3));
  objc_msgSend(v3, "deleteSelectedItems");

}

- (void)_handleRecoverSelected:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderViewController libraryActionHandler](self, "libraryActionHandler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingsCollectionViewController](self, "recordingsCollectionViewController"));
  objc_msgSend(v6, "performAction:atPosition:forUUID:sourceController:source:", 21, 0, v5, v4, 0.0);

}

- (void)_handleRecoverAll:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderViewController libraryActionHandler](self, "libraryActionHandler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingsCollectionViewController](self, "recordingsCollectionViewController"));
  objc_msgSend(v6, "performAction:atPosition:forUUID:sourceController:source:", 22, 0, v5, v4, 0.0);

}

- (void)_handleEraseAll:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderViewController libraryActionHandler](self, "libraryActionHandler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingsCollectionViewController](self, "recordingsCollectionViewController"));
  objc_msgSend(v6, "performAction:atPosition:forUUID:sourceController:source:", 19, 0, v5, v4, 0.0);

}

- (void)_handleEraseSelected:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderViewController libraryActionHandler](self, "libraryActionHandler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingsCollectionViewController](self, "recordingsCollectionViewController"));
  objc_msgSend(v6, "performAction:atPosition:forUUID:sourceController:source:", 18, 0, v5, v4, 0.0);

}

- (void)_styleView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSAttributedStringKey v11;
  void *v12;
  NSAttributedStringKey v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (objc_msgSend(v3, "toolbarButtonsShouldHaveNonDefaultColor"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recentlyDeletedNonDefaultButtonTextColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recoverRecordingsButton](self, "recoverRecordingsButton"));
    v13 = NSForegroundColorAttributeName;
    v14 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    objc_msgSend(v5, "setTitleTextAttributes:forState:", v6, 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController eraseRecordingsButton](self, "eraseRecordingsButton"));
    v11 = NSForegroundColorAttributeName;
    v12 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    objc_msgSend(v7, "setTitleTextAttributes:forState:", v8, 0);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recoverRecordingsButton](self, "recoverRecordingsButton"));
    objc_msgSend(v9, "setTitleTextAttributes:forState:", 0, 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController eraseRecordingsButton](self, "eraseRecordingsButton"));
    objc_msgSend(v4, "setTitleTextAttributes:forState:", 0, 0);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingsCollectionViewController](self, "recordingsCollectionViewController"));
  objc_msgSend(v10, "restyle");

}

- (void)finishedTransitionToEditing:(BOOL)a3
{
  int v3;
  void *v5;
  unsigned __int8 v6;
  unsigned int v7;
  id v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v6 = objc_msgSend(v5, "alwaysShowsRecordingsCollectionViewToolbarInRecentlyDeleted");

  if ((v6 & 1) == 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderViewController navigationController](self, "navigationController"));
    v7 = objc_msgSend(v8, "isToolbarHidden");
    if (v7 == v3)
      objc_msgSend(v8, "setToolbarHidden:animated:", v7 & v3 ^ 1, 1);

  }
}

- (void)didDismissSiriTipView
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "setBool:forKey:", 1, CFSTR("RCSiriTipViewWasDismissed"));

  -[RCFolderViewController _clearNavigationBarPalette](self, "_clearNavigationBarPalette");
}

- (id)teardownBlock
{
  return self->_teardownBlock;
}

- (void)setFolderType:(int64_t)a3
{
  self->_folderType = a3;
}

- (NSString)folderUUID
{
  return self->_folderUUID;
}

- (void)setHideNavigationTitle:(BOOL)a3
{
  self->_hideNavigationTitle = a3;
}

- (UIBarButtonItem)recoverRecordingsButton
{
  return self->_recoverRecordingsButton;
}

- (void)setRecoverRecordingsButton:(id)a3
{
  objc_storeStrong((id *)&self->_recoverRecordingsButton, a3);
}

- (UIBarButtonItem)flexBarItem
{
  return self->_flexBarItem;
}

- (void)setFlexBarItem:(id)a3
{
  objc_storeStrong((id *)&self->_flexBarItem, a3);
}

- (UIBarButtonItem)eraseRecordingsButton
{
  return self->_eraseRecordingsButton;
}

- (void)setEraseRecordingsButton:(id)a3
{
  objc_storeStrong((id *)&self->_eraseRecordingsButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eraseRecordingsButton, 0);
  objc_storeStrong((id *)&self->_flexBarItem, 0);
  objc_storeStrong((id *)&self->_recoverRecordingsButton, 0);
  objc_storeStrong((id *)&self->_folderUUID, 0);
  objc_storeStrong((id *)&self->_folderTitle, 0);
  objc_destroyWeak((id *)&self->_libraryActionHandler);
  objc_destroyWeak((id *)&self->_recordingViewControllerDelegate);
  objc_storeStrong((id *)&self->_recordingsCollectionViewController, 0);
  objc_storeStrong((id *)&self->_recordingViewController, 0);
  objc_storeStrong(&self->_teardownBlock, 0);
  objc_storeStrong(&self->_setupBlock, 0);
  objc_destroyWeak((id *)&self->_undoManager);
}

@end
