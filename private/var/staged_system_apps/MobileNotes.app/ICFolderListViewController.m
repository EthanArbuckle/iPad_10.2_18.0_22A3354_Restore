@implementation ICFolderListViewController

- (void)updateSummaryView
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[ICFolderListViewController availableWidthForSummaryView](self, "availableWidthForSummaryView");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController summaryView](self, "summaryView"));
  objc_msgSend(v5, "setAvailableWidth:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cloudContextDelegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "syncMessage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController summaryView](self, "summaryView"));
  objc_msgSend(v9, "setSyncMessage:", v8);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController summaryView](self, "summaryView"));
  objc_msgSend(v10, "update");

}

- (ICFolderDataSource)folderDataSource
{
  ICFolderDataSource *folderDataSource;
  ICFolderDataSource *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  ICFolderDataSource *v12;
  void *v13;
  void *v14;
  void *v15;
  ICFolderDataSource *v16;
  ICFolderDataSource *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location[2];

  folderDataSource = self->_folderDataSource;
  if (folderDataSource)
  {
    v3 = folderDataSource;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistenceConfiguration"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "legacyViewContext"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persistenceConfiguration"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modernBackgroundContext"));

    objc_initWeak(location, self);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000063EC;
    v29[3] = &unk_100550D80;
    objc_copyWeak(&v30, location);
    v9 = objc_retainBlock(v29);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10004B40C;
    v27[3] = &unk_10054FA60;
    objc_copyWeak(&v28, location);
    v10 = objc_retainBlock(v27);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10004B4DC;
    v25[3] = &unk_10054FF58;
    objc_copyWeak(&v26, location);
    v11 = objc_retainBlock(v25);
    v12 = [ICFolderDataSource alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController overrideContainerIdentifier](self, "overrideContainerIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController unsupportedFolderInfoButtonTapHandler](self, "unsupportedFolderInfoButtonTapHandler"));
    v16 = -[ICFolderDataSource initWithCollectionView:presentingViewController:legacyManagedObjectContext:modernManagedObjectContext:overrideContainerIdentifier:unsupportedFolderInfoButtonTapHandler:accountUpgradeButtonTapHandlerProvider:tagSelectionDidChangeHandler:allowNotificationsCloseHandler:](v12, "initWithCollectionView:presentingViewController:legacyManagedObjectContext:modernManagedObjectContext:overrideContainerIdentifier:unsupportedFolderInfoButtonTapHandler:accountUpgradeButtonTapHandlerProvider:tagSelectionDidChangeHandler:allowNotificationsCloseHandler:", v13, self, v22, v21, v14, v15, v9, v10, v11);
    v17 = self->_folderDataSource;
    self->_folderDataSource = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "workerManagedObjectContext"));
    -[ICFolderDataSource setApplySnapshotModernManagedObjectContext:](self->_folderDataSource, "setApplySnapshotModernManagedObjectContext:", v19);

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10004B550;
    v23[3] = &unk_100550DA8;
    objc_copyWeak(&v24, location);
    -[ICFolderDataSource setWillExpandItemHandler:](self->_folderDataSource, "setWillExpandItemHandler:", v23);
    v3 = self->_folderDataSource;
    objc_destroyWeak(&v24);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);

    objc_destroyWeak(&v30);
    objc_destroyWeak(location);

  }
  return v3;
}

- (void)updateToolbarAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  ICFolderListViewController *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
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
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  ICToolbarSummaryView *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  unsigned int v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController navigationController](self, "navigationController"));
  v6 = (ICFolderListViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));

  if (v6 == self)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController navigationItem](self, "navigationItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchController"));
    v9 = objc_msgSend(v8, "isActive");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController navigationController](self, "navigationController"));
    objc_msgSend(v10, "setToolbarHidden:animated:", v9, v3);

  }
  v56 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController folderDataSource](self, "folderDataSource"));
  v12 = objc_msgSend(v11, "countOfModernAccounts");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController addFolderButton](self, "addFolderButton"));

    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("folder.badge.plus")));
      v15 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithImage:menu:", v14, 0);
      -[ICFolderListViewController setAddFolderButton:](self, "setAddFolderButton:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Create a folder"), &stru_1005704B8, 0));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController addFolderButton](self, "addFolderButton"));
      objc_msgSend(v18, "setTitle:", v17);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("New folder"), &stru_1005704B8, 0));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController addFolderButton](self, "addFolderButton"));
      objc_msgSend(v21, "setAccessibilityLabel:", v20);

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Double tap to add a new folder"), &stru_1005704B8, 0));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController addFolderButton](self, "addFolderButton"));
      objc_msgSend(v24, "setAccessibilityHint:", v23);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController folderDataSource](self, "folderDataSource"));
    v26 = objc_msgSend(v25, "countOfModernAccounts");

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController addFolderButton](self, "addFolderButton"));
    v28 = v27;
    if ((unint64_t)v26 < 2)
    {
      objc_msgSend(v27, "setTarget:", self);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController addFolderButton](self, "addFolderButton"));
      objc_msgSend(v30, "setAction:", "addFolderButtonAction:");
    }
    else
    {
      objc_msgSend(v27, "setTarget:", 0);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController addFolderButton](self, "addFolderButton"));
      objc_msgSend(v29, "setAction:", 0);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController folderCreationController](self, "folderCreationController"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "menu"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController addFolderButton](self, "addFolderButton"));
      objc_msgSend(v32, "setMenu:", v31);

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController addFolderButton](self, "addFolderButton"));
    objc_msgSend(v56, "addObject:", v33);

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem ic_itemWithFlexibleSpace](UIBarButtonItem, "ic_itemWithFlexibleSpace"));
  objc_msgSend(v56, "addObject:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  v36 = objc_msgSend(v35, "hasCompactWidth");

  if (v36)
  {
    v39 = -[ICToolbarSummaryView initWithFrame:]([ICToolbarSummaryView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[ICFolderListViewController setSummaryView:](self, "setSummaryView:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController summaryView](self, "summaryView"));
    objc_msgSend(v40, "setCountsHidden:", 1);

    v41 = objc_alloc((Class)UIBarButtonItem);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController summaryView](self, "summaryView"));
    v43 = objc_msgSend(v41, "initWithCustomView:", v42);

    objc_msgSend(v56, "addObject:", v43);
    -[ICFolderListViewController updateSummaryView](self, "updateSummaryView");
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem ic_itemWithFlexibleSpace](UIBarButtonItem, "ic_itemWithFlexibleSpace"));
    objc_msgSend(v56, "addObject:", v44);

  }
  if (ICDebugModeEnabled(v37, v38))
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("gear")));
    v46 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithImage:style:target:action:", v45, 0, self, "debugButtonPressed:");
    objc_msgSend(v46, "setTitle:", CFSTR("Debug"));
    objc_msgSend(v56, "addObject:", v46);

  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  v48 = objc_msgSend(v47, "hasCompactWidth");

  if (v48)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.pencil")));
    v50 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithImage:style:target:action:", v49, 0, self, "addNoteButtonPressed:event:");
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("New note"), &stru_1005704B8, 0));
    objc_msgSend(v50, "setAccessibilityLabel:", v52);

    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("Double tap to compose a new note."), &stru_1005704B8, 0));
    objc_msgSend(v50, "setAccessibilityHint:", v54);

    objc_msgSend(v56, "addObject:", v50);
  }
  v55 = objc_msgSend(v56, "copy");
  -[ICFolderListViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v55, v3);

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __objc2_class *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;

  v39 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController dataSource](self, "dataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionViewDiffableDataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "itemIdentifierForIndexPath:", v7));

  v12 = objc_opt_class(NSManagedObjectID, v11);
  if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
  {
    v14 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController traitCollection](self, "traitCollection"));
    v16 = (uint64_t)objc_msgSend(v15, "_splitViewControllerContext");

    if (v16 >= 1)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectedContainerItemID"));
      if (objc_msgSend(v14, "isEqual:", v18))
      {
        v19 = -[ICFolderListViewController isEditing](self, "isEditing");

        if ((v19 & 1) == 0)
          objc_msgSend(v39, "setSelected:", 1);
      }
      else
      {

      }
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController recentlyCreatedFolderObjectID](self, "recentlyCreatedFolderObjectID"));
    v31 = objc_msgSend(v14, "isEqual:", v30);

    if (v31)
    {
      v33 = objc_opt_class(ICFolderOutlineCollectionViewCell, v32);
      v34 = ICDynamicCast(v33, v39);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      objc_msgSend(v35, "setRecentlyCreated:", 1);

      -[ICFolderListViewController setRecentlyCreatedFolderObjectID:](self, "setRecentlyCreatedFolderObjectID:", 0);
    }
    goto LABEL_18;
  }
  v20 = objc_opt_class(ICFolderListSectionIdentifier, v13);
  if ((objc_opt_isKindOfClass(v10, v20) & 1) != 0)
  {
    if (objc_msgSend(v10, "sectionType") == (id)8)
    {
      v23 = ICOutlineParentCollectionViewCell;
LABEL_16:
      v37 = objc_opt_class(v23, v22);
      v38 = ICDynamicCast(v37, v39);
      v14 = (id)objc_claimAutoreleasedReturnValue(v38);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "tagSelection"));
      objc_msgSend(v14, "setTagSelection:", v29);
      goto LABEL_17;
    }
  }
  else
  {
    v24 = objc_opt_class(ICTagContainerItemIdentifier, v21);
    if ((objc_opt_isKindOfClass(v10, v24) & 1) != 0)
    {
      v26 = objc_opt_class(ICTagContainerCell, v25);
      v27 = ICDynamicCast(v26, v39);
      v14 = (id)objc_claimAutoreleasedReturnValue(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "tagSelection"));
      objc_msgSend(v14, "selectTagsWithTagSelection:animated:", v29, 0);
LABEL_17:

LABEL_18:
      goto LABEL_19;
    }
    v36 = objc_opt_class(ICTagOperatorCell, v25);
    if ((objc_opt_isKindOfClass(v10, v36) & 1) != 0)
    {
      v23 = ICTagOperatorCell;
      goto LABEL_16;
    }
  }
LABEL_19:

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void **v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  _QWORD *v17;
  _QWORD v18[5];
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ICFolderListViewController;
  -[ICBaseViewController viewWillAppear:](&v19, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController managedObjectContextChangeController](self, "managedObjectContextChangeController"));
  objc_msgSend(v4, "performUpdatesIfNeeded");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController transitionCoordinator](self, "transitionCoordinator"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController transitionCoordinator](self, "transitionCoordinator"));
    if ((objc_msgSend(v6, "isInteractive") & 1) != 0)
    {
      -[ICFolderListViewController updateToolbarAnimated:](self, "updateToolbarAnimated:", 0);
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController transitionCoordinator](self, "transitionCoordinator"));
      -[ICFolderListViewController updateToolbarAnimated:](self, "updateToolbarAnimated:", objc_msgSend(v7, "isCancelled") ^ 1);

    }
  }
  else
  {
    -[ICFolderListViewController updateToolbarAnimated:](self, "updateToolbarAnimated:", 0);
  }

  -[ICFolderListViewController updateNavigationBar](self, "updateNavigationBar");
  -[ICFolderListViewController updateTagOperatorPosition](self, "updateTagOperatorPosition");
  -[ICFolderListViewController updateContainerSelection](self, "updateContainerSelection");
  -[ICFolderListViewController updateAppearanceStyle](self, "updateAppearanceStyle");
  if (-[ICFolderListViewController ic_isBeingRevealedFromPoppingViewController](self, "ic_isBeingRevealedFromPoppingViewController"))
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10004A04C;
    v18[3] = &unk_100550110;
    v18[4] = self;
    v8 = objc_retainBlock(v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController transitionCoordinator](self, "transitionCoordinator"));
    v10 = objc_msgSend(v9, "isInteractive");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController transitionCoordinator](self, "transitionCoordinator"));
      v13 = _NSConcreteStackBlock;
      v14 = 3221225472;
      v15 = sub_10004A160;
      v16 = &unk_100550460;
      v17 = v8;
      objc_msgSend(v11, "notifyWhenInteractionChangesUsingBlock:", &v13);

    }
    else
    {
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
    }

  }
  -[ICFolderListViewController checkIfShouldShowOrHideAllowNotificationsView](self, "checkIfShouldShowOrHideAllowNotificationsView", v13, v14, v15, v16);
  -[ICFolderListViewController updateTagHeadingCell](self, "updateTagHeadingCell");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
  objc_msgSend(v12, "refreshStoresListIfNeeded");

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICFolderListViewController;
  -[ICBaseViewController viewDidLoad](&v3, "viewDidLoad");
  -[ICFolderListViewController updateNavigationTitle](self, "updateNavigationTitle");
  -[ICFolderListViewController addPermanentObservers](self, "addPermanentObservers");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICFolderListViewController;
  -[ICBaseViewController viewDidAppear:](&v9, "viewDidAppear:", a3);
  if (-[ICFolderListViewController canBecomeFirstResponder](self, "canBecomeFirstResponder"))
    -[ICFolderListViewController becomeFirstResponder](self, "becomeFirstResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  objc_msgSend(v4, "didFinishExtendedLaunch");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = objc_msgSend(v5, "isRunningTest");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
    objc_msgSend(v7, "didShowFolderList");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController eventReporter](self, "eventReporter"));
  objc_msgSend(v8, "startFolderListViewEventDurationTracking");

}

- (void)updateTagOperatorPosition
{
  uint64_t v3;
  id v4;

  v3 = ICAccessibilityAccessibilityLargerTextSizesEnabled(self);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController folderDataSource](self, "folderDataSource"));
  objc_msgSend(v4, "setShouldShowTagOperatorOnSeparateLine:", v3);

}

- (void)updateTagHeadingCell
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tagSelection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController folderDataSource](self, "folderDataSource"));
  objc_msgSend(v4, "setTagSelection:", v3);

}

- (void)updateNavigationTitle
{
  void *v2;
  unsigned int v4;
  char v5;
  void *v6;
  id v7;

  v4 = -[ICBaseViewController isShowingActiveSearch](self, "isShowingActiveSearch");
  v5 = v4;
  if (v4)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseViewController searchNavigationTitle](self, "searchNavigationTitle"));
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Folders"), &stru_1005704B8, 0));
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setTitle:", v7);

  if ((v5 & 1) == 0)
  {

    v7 = v2;
  }

}

- (void)updateNavigationBar
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 1);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController editButtonItem](self, "editButtonItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setRightBarButtonItem:", v5);

}

- (void)updateContainerSelection
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
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
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController traitCollection](self, "traitCollection"));
  v4 = (uint64_t)objc_msgSend(v3, "_splitViewControllerContext");

  if (v4 >= 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchController"));
    v7 = objc_msgSend(v6, "isActive");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
      objc_msgSend(v8, "ic_deselectAllItems");

      v29 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
      objc_msgSend(v29, "deselectAllTagsAnimated:", 0);

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedContainerItemID"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tagSelection"));

      if (v10)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
        objc_msgSend(v13, "deselectAllTagsAnimated:", 0);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController dataSource](self, "dataSource"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collectionViewDiffableDataSource"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "indexPathForItemIdentifier:", v10));

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
        v18 = v17;
        if (v16)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "indexPathsForSelectedItems"));

          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v18 = v19;
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v31;
            do
            {
              for (i = 0; i != v21; i = (char *)i + 1)
              {
                if (*(_QWORD *)v31 != v22)
                  objc_enumerationMutation(v18);
                v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
                if ((objc_msgSend(v24, "isEqual:", v16) & 1) == 0)
                {
                  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
                  objc_msgSend(v25, "deselectItemAtIndexPath:animated:", v24, 0);

                }
              }
              v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
            }
            while (v21);
          }

          if ((objc_msgSend(v18, "containsObject:", v16) & 1) == 0)
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
            objc_msgSend(v26, "selectItemAtIndexPath:animated:scrollPosition:", v16, 0, 0);

          }
        }
        else
        {
          objc_msgSend(v17, "ic_deselectAllItems");
        }

      }
      else if (objc_msgSend(v12, "isNonEmpty"))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
        objc_msgSend(v27, "ic_deselectAllItems");

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
        objc_msgSend(v28, "selectTagsWithTagSelection:animated:", v12, 0);

      }
    }
  }
}

- (void)updateAppearanceStyle
{
  void *v3;
  char *v4;
  unint64_t v5;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController traitCollection](self, "traitCollection"));
  v4 = (char *)objc_msgSend(v3, "_splitViewControllerContext");

  v5 = (unint64_t)(v4 - 3);
  v6 = (unint64_t)(v4 - 3) < 0xFFFFFFFFFFFFFFFELL;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController folderDataSource](self, "folderDataSource"));
  objc_msgSend(v7, "setHasGroupInset:", v6);

  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0)
  {
    if (v5 > 0xFFFFFFFFFFFFFFFDLL)
      v8 = objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
    else
      v8 = objc_claimAutoreleasedReturnValue(+[UIColor ICGroupedBackgroundColor](UIColor, "ICGroupedBackgroundColor"));
    v10 = (id)v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
    objc_msgSend(v9, "setBackgroundColor:", v10);

  }
}

- (ICToolbarSummaryView)summaryView
{
  return self->_summaryView;
}

- (void)setSummaryView:(id)a3
{
  objc_storeStrong((id *)&self->_summaryView, a3);
}

- (void)setAddFolderButton:(id)a3
{
  objc_storeStrong((id *)&self->_addFolderButton, a3);
}

- (void)scrollToRecentlyCreatedFolderIfNeeded
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController recentlyCreatedFolderObjectID](self, "recentlyCreatedFolderObjectID"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController recentlyCreatedFolderObjectID](self, "recentlyCreatedFolderObjectID"));
    -[ICFolderListViewController scrollToContainerWithObjectID:](self, "scrollToContainerWithObjectID:", v4);

  }
}

- (void)sceneDidActivate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController viewIfLoaded](self, "viewIfLoaded"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));
  v8 = objc_msgSend(v4, "isEqual:", v7);

  if (v8)
  {
    if (-[ICFolderListViewController ic_isViewVisible](self, "ic_isViewVisible"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController eventReporter](self, "eventReporter"));
      objc_msgSend(v9, "startFolderListViewEventDurationTracking");

    }
    -[ICFolderListViewController checkIfShouldShowOrHideAllowNotificationsView](self, "checkIfShouldShowOrHideAllowNotificationsView");
  }
}

- (void)reloadListWithDataIndexedBlock:(id)a3 dataRenderedBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController dataSource](self, "dataSource"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000155AC;
  v10[3] = &unk_100550160;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "reloadDataAnimated:dataIndexedBlock:dataRenderedBlock:", 0, v7, v10);

}

- (NSManagedObjectID)recentlyCreatedFolderObjectID
{
  return self->_recentlyCreatedFolderObjectID;
}

- (ICManagedObjectContextChangeController)managedObjectContextChangeController
{
  return self->_managedObjectContextChangeController;
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICFolderListViewController;
  -[ICFolderListViewController loadView](&v4, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
  -[ICFolderListViewController setView:](self, "setView:", v3);

}

- (void)dataSourceDataUpdateDidRender:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICFolderListViewController;
  -[ICBaseViewController dataSourceDataUpdateDidRender:](&v4, "dataSourceDataUpdateDidRender:", a3);
  -[ICFolderListViewController updateContainerSelection](self, "updateContainerSelection");
  -[ICFolderListViewController updateToolbarAnimated:](self, "updateToolbarAnimated:", 0);
  -[ICFolderListViewController scrollToRecentlyCreatedFolderIfNeeded](self, "scrollToRecentlyCreatedFolderIfNeeded");
  -[ICFolderListViewController updateTagHeadingCell](self, "updateTagHeadingCell");
}

- (ICFolderListCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)checkIfShouldShowOrHideAllowNotificationsView
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICFolderListViewController checkIfShouldShowOrHideAllowNotificationsView]", 1, 0, CFSTR("Unexpected call from background thread"));
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("DidDismissAllowNotificationsView"));

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
    objc_msgSend(v5, "setShouldShowAllowNotificationsView:", 0);

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100015640;
    v7[3] = &unk_100550DF8;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v6, "checkIfUserNotificationsAllowed:", v7);

    objc_destroyWeak(&v8);
  }
  objc_destroyWeak(&location);
}

- (BOOL)canBecomeFirstResponder
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyboardHandler"));
  v5 = objc_msgSend(v4, "isInHardwareKeyboardMode");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeEditorController"));
    v8 = objc_msgSend(v7, "wantsToRemainFirstResponder") ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (double)availableWidthForSummaryView
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController view](self, "view"));
  objc_msgSend(v2, "bounds");
  v4 = v3 + -150.0;

  return v4;
}

- (void)addPermanentObservers
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cloudContextDelegate"));
  v5 = ICKeyPathFromSelector("syncMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, v6, &off_1005CCAB8);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  objc_msgSend(v7, "ic_addObserver:forKeyPath:context:", self, CFSTR("selectedContainerItemID"), &off_1005CCAB8);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  objc_msgSend(v8, "ic_addObserver:forKeyPath:context:", self, CFSTR("selectedContainerIdentifiers"), &off_1005CCAB8);

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "folderWasCreated:", CFSTR("ICFolderCreationControllerFolderWasCreatedNotification"), 0);

}

- (UIBarButtonItem)addFolderButton
{
  return self->_addFolderButton;
}

- (ICFolderListViewController)initWithViewMode:(int64_t)a3 viewControllerManager:(id)a4 overrideContainerIdentifier:(id)a5
{
  id v9;
  ICFolderListViewController *v10;
  ICFolderListViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  ICManagedObjectContextChangeController *v15;
  ICManagedObjectContextChangeController *managedObjectContextChangeController;
  ICFolderCreationController *v17;
  ICFolderCreationController *folderCreationController;
  ICFolderListCollectionView *v19;
  void *v20;
  void *v21;
  void *v22;
  ICFolderListCollectionView *v23;
  ICFolderListCollectionView *collectionView;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v9 = a5;
  v29.receiver = self;
  v29.super_class = (Class)ICFolderListViewController;
  v10 = -[ICBaseViewController initWithViewMode:viewControllerManager:viewControllerType:](&v29, "initWithViewMode:viewControllerManager:viewControllerType:", a3, a4, 2);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_overrideContainerIdentifier, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController legacyViewContext](v11, "legacyViewContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController modernViewContext](v11, "modernViewContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, v13, 0));

    v15 = (ICManagedObjectContextChangeController *)objc_msgSend(objc_alloc((Class)ICManagedObjectContextChangeController), "initWithManagedObjectContexts:delegate:", v14, v11);
    managedObjectContextChangeController = v11->_managedObjectContextChangeController;
    v11->_managedObjectContextChangeController = v15;

    v17 = -[ICFolderCreationController initWithViewController:noteContainer:creationApproach:]([ICFolderCreationController alloc], "initWithViewController:noteContainer:creationApproach:", v11, 0, 1);
    folderCreationController = v11->_folderCreationController;
    v11->_folderCreationController = v17;

    v19 = [ICFolderListCollectionView alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController legacyViewContext](v11, "legacyViewContext"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController modernViewContext](v11, "modernViewContext"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](v11, "viewControllerManager"));
    v23 = -[ICFolderListCollectionView initWithPresentingViewController:legacyManagedObjectContext:modernManagedObjectContext:viewControllerManager:](v19, "initWithPresentingViewController:legacyManagedObjectContext:modernManagedObjectContext:viewControllerManager:", v11, v20, v21, v22);
    collectionView = v11->_collectionView;
    v11->_collectionView = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController folderDataSource](v11, "folderDataSource"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "collectionViewDiffableDataSource"));
    -[ICCollectionView setDiffableDataSource:](v11->_collectionView, "setDiffableDataSource:", v26);

    -[ICFolderListCollectionView setDelegate:](v11->_collectionView, "setDelegate:", v11);
    -[ICFolderListCollectionView setContentInsetAdjustmentBehavior:](v11->_collectionView, "setContentInsetAdjustmentBehavior:", 0);
    -[ICFolderListViewController updateAppearanceStyle](v11, "updateAppearanceStyle");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v27, "addObserver:selector:name:object:", v11, "sceneDidActivate:", UISceneDidActivateNotification, 0);
    objc_msgSend(v27, "addObserver:selector:name:object:", v11, "sceneWillDeactivate:", UISceneWillDeactivateNotification, 0);
    objc_msgSend(v27, "addObserver:selector:name:object:", v11, "userNotificationRegistrationCompleted:", ICUserNotificationRegistrationCompleted, 0);
    objc_msgSend(v27, "addObserver:selector:name:object:", v11, "keyboardWillShow:", UIKeyboardDidShowNotification, 0);
    -[ICFolderListViewController updateNavigationTitle](v11, "updateNavigationTitle");

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cloudContextDelegate"));
  v6 = ICKeyPathFromSelector("syncMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "ic_removeObserver:forKeyPath:context:", self, v7, &off_1005CCAB8);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  objc_msgSend(v8, "ic_removeObserver:forKeyPath:context:", self, CFSTR("selectedContainerIdentifiers"), &off_1005CCAB8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  objc_msgSend(v9, "ic_removeObserver:forKeyPath:context:", self, CFSTR("selectedContainerItemID"), &off_1005CCAB8);

  v10.receiver = self;
  v10.super_class = (Class)ICFolderListViewController;
  -[ICBaseViewController dealloc](&v10, "dealloc");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  unsigned int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICFolderListViewController;
  -[ICFolderListViewController viewDidLayoutSubviews](&v5, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  if (objc_msgSend(v3, "isRunningTest"))
  {
    v4 = -[ICFolderListViewController _appearState](self, "_appearState");

    if (v4 != 1)
      return;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
    objc_msgSend(v3, "folderListDidLayoutSubviews");
  }

}

- (void)sceneWillDeactivate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController viewIfLoaded](self, "viewIfLoaded"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));
  v8 = objc_msgSend(v4, "isEqual:", v7);

  if (v8)
  {
    if (-[ICFolderListViewController ic_isViewVisible](self, "ic_isViewVisible"))
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController eventReporter](self, "eventReporter"));
      objc_msgSend(v9, "submitFolderListViewEvent");

    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICFolderListViewController;
  -[ICFolderListViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController eventReporter](self, "eventReporter"));
  objc_msgSend(v4, "submitFolderListViewEvent");

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  _QWORD v24[5];
  BOOL v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];

  v4 = a4;
  v5 = a3;
  if (-[ICFolderListViewController isEditing](self, "isEditing") != a3)
  {
    v30.receiver = self;
    v30.super_class = (Class)ICFolderListViewController;
    -[ICBaseViewController setEditing:animated:](&v30, "setEditing:animated:", v5, v4);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathsForVisibleItems"));

    obj = v8;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v12);
          v14 = objc_opt_class(ICFolderOutlineCollectionViewCell);
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cellForItemAtIndexPath:", v13));
          v17 = ICDynamicCast(v14, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

          if ((objc_msgSend(v18, "allowsEditing") & 1) == 0)
            objc_msgSend(v18, "setEditing:", v5);
          if (v5)
            objc_msgSend(v18, "setSelected:", 0);
          objc_msgSend(v18, "setNeedsUpdateConfiguration");

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v10);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController dataSource](self, "dataSource"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "collectionViewDiffableDataSource"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10004A5D4;
    v24[3] = &unk_100550360;
    v24[4] = self;
    v25 = v5;
    objc_msgSend(v20, "_performBatchApplyUsingReloadData:", v24);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
    objc_msgSend(v21, "setEditing:", v5);

    if (v5)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v22, "postNotificationName:object:", CFSTR("ICFolderListViewControllerDidStartEditingNotification"), self);

    }
    else
    {
      -[ICFolderListViewController updateContainerSelection](self, "updateContainerSelection");
    }
  }
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  BOOL v18;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController dataSource](self, "dataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionViewDiffableDataSource"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemIdentifierForIndexPath:", v8));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "snapshot"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sectionIdentifierForSectionContainingItemIdentifier:", v11));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "snapshotForSection:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "childrenOfParent:", v11));
  if (!objc_msgSend(v15, "count"))
  {

    goto LABEL_5;
  }
  v16 = objc_msgSend(v14, "isExpanded:", v11);

  if ((v16 & 1) != 0)
  {
LABEL_5:
    -[ICFolderListViewController setCurrentSpringLoadedInteractionContext:](self, "setCurrentSpringLoadedInteractionContext:", 0);
    v18 = 0;
    goto LABEL_6;
  }
  -[ICFolderListViewController setCurrentSpringLoadedInteractionContext:](self, "setCurrentSpringLoadedInteractionContext:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController currentSpringLoadedInteractionContext](self, "currentSpringLoadedInteractionContext"));
  objc_msgSend(v17, "setTargetItem:", v11);

  v18 = 1;
LABEL_6:

  return v18;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char isKindOfClass;
  uint64_t v12;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionViewDiffableDataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemIdentifierForIndexPath:", v5));

  v9 = objc_opt_class(ICVirtualSmartFolderItemIdentifier);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0
    || (v10 = objc_opt_class(NSManagedObjectID), (objc_opt_isKindOfClass(v8, v10) & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    v12 = objc_opt_class(ICTagAllTagsItemIdentifier);
    isKindOfClass = objc_opt_isKindOfClass(v8, v12);
  }

  return isKindOfClass & 1;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v23;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionViewDiffableDataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemIdentifierForIndexPath:", v5));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController currentSpringLoadedInteractionContext](self, "currentSpringLoadedInteractionContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "targetItem"));
  if ((objc_msgSend(v10, "isEqual:", v8) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController currentSpringLoadedInteractionContext](self, "currentSpringLoadedInteractionContext"));
    v12 = objc_msgSend(v11, "state");

    if (v12 == (id)3)
    {
      -[ICFolderListViewController setCurrentSpringLoadedInteractionContext:](self, "setCurrentSpringLoadedInteractionContext:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController folderDataSource](self, "folderDataSource"));
      v23 = v8;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
      objc_msgSend(v13, "expandItemsWithIdentifiers:completion:", v14, 0);

      v15 = 0;
      goto LABEL_10;
    }
  }
  else
  {

  }
  v16 = objc_opt_class(NSManagedObjectID);
  v17 = ICDynamicCast(v16, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v15 = 1;
  if (objc_msgSend(v18, "ic_isModernFolderType"))
  {
    v19 = objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v19, "managedObjectContext"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "ic_existingObjectWithID:", v18));

    LOBYTE(v19) = objc_msgSend(v21, "isUnsupported");
    if ((v19 & 1) != 0)
      v15 = 0;
  }

LABEL_10:
  return v15;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  -[ICFolderListViewController becomeFirstResponder](self, "becomeFirstResponder");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionViewDiffableDataSource"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemIdentifierForIndexPath:", v5));

  if (v11)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v11));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    objc_msgSend(v8, "selectContainerWithIdentifiers:excludingIdentifiers:usingRootViewController:deferUntilDataLoaded:animated:", v9, v10, 1, 1, 1);

    -[ICFolderListViewController updateTagHeadingCell](self, "updateTagHeadingCell");
  }

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  if (objc_msgSend(v6, "count") == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contextMenuConfigurationForItemsAtIndexPaths:", v6));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contextMenuPreviewForHighlightingMenuWithConfiguration:indexPath:", v8, v7));

  return v10;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contextMenuPreviewForDismissingContextMenuWithConfiguration:indexPath:", v8, v7));

  return v10;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
  objc_msgSend(v9, "contextMenuWillPerformPreviewActionForMenuWithConfiguration:animator:", v8, v7);

}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
  v7 = objc_msgSend(v6, "canFocusItemAtIndexPath:", v5);

  return v7;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (objc_msgSend(v9, "isEditing") && !objc_msgSend(v9, "hasActiveDrag"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController dataSource](self, "dataSource"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "collectionViewDiffableDataSource"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "itemIdentifierForIndexPath:", v10));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "itemIdentifierForIndexPath:", v11));
    v17 = objc_opt_class(NSManagedObjectID);
    v18 = ICDynamicCast(v17, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController noteContainerWithItemIdentifier:](self, "noteContainerWithItemIdentifier:", v15));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController noteContainerWithItemIdentifier:](self, "noteContainerWithItemIdentifier:", v16));
    if (objc_msgSend(v19, "ic_isModernFolderType"))
    {
      v29 = v14;
      v30 = v15;
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "noteContainerAccount"));

      v21 = (void *)v22;
    }
    else
    {
      if (objc_msgSend(v19, "ic_isLegacyFolderType"))
      {
        v12 = v10;
LABEL_13:

        goto LABEL_14;
      }
      v29 = v14;
      v30 = v15;
    }
    v23 = objc_alloc((Class)ICMoveDecision);
    v31 = v20;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
    v25 = v20;
    v26 = objc_msgSend(v23, "initWithSourceObjects:destination:", v24, v21);

    if (objc_msgSend(v26, "shouldMove"))
      v27 = v11;
    else
      v27 = v10;
    v12 = v27;

    v20 = v25;
    v14 = v29;
    v15 = v30;
    goto LABEL_13;
  }
  v12 = v11;
LABEL_14:

  return v12;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  _QWORD block[5];
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((-[ICFolderListViewController ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/UI/Folder/ICFolderListViewController.m") & 1) != 0)
  {
    v13 = -[ICFolderListViewController ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v12, v11, v10);

    if (a6 == &off_1005CCAB8 && (v13 & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cloudContextDelegate"));

      if (v15 == v11)
      {
        v17 = ICKeyPathFromSelector("syncMessage");
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v19 = objc_msgSend(v10, "isEqualToString:", v18);

        if (v19)
          -[ICFolderListViewController updateSummaryView](self, "updateSummaryView");
      }
      else
      {
        v16 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));

        if (v16 == v11)
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10004B0B4;
          block[3] = &unk_100550110;
          block[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        }
      }
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)ICFolderListViewController;
    -[ICFolderListViewController observeValueForKeyPath:ofObject:change:context:](&v21, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);

  }
}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v14.receiver = self;
  v14.super_class = (Class)ICFolderListViewController;
  -[ICBaseViewController registerForTraitChanges](&v14, "registerForTraitChanges");
  objc_initWeak(&location, self);
  v17 = objc_opt_class(UITraitSplitViewControllerContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004B2EC;
  v11[3] = &unk_100550500;
  objc_copyWeak(&v12, &location);
  v4 = -[ICFolderListViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v11);

  v16 = objc_opt_class(UITraitPreferredContentSizeCategory);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  v6 = -[ICFolderListViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v5, "updateTagOperatorPosition");

  v15 = objc_opt_class(UITraitHorizontalSizeClass);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004B390;
  v9[3] = &unk_100550500;
  objc_copyWeak(&v10, &location);
  v8 = -[ICFolderListViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v7, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)noteContainerWithItemIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD *v8;
  id v9;
  _QWORD v11[7];
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = objc_opt_class(NSManagedObjectID);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = sub_10004B7B8;
    v17 = sub_10004B7C8;
    v18 = 0;
    if (objc_msgSend(v6, "ic_isModernContainerType"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController modernViewContext](self, "modernViewContext"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10004B7D0;
      v12[3] = &unk_10054FD20;
      v8 = v12;
      v12[6] = &v13;
      v12[4] = self;
      v12[5] = v6;
      objc_msgSend(v7, "performBlockAndWait:", v12);
    }
    else
    {
      if (!objc_msgSend(v6, "ic_isLegacyContainerType"))
      {
LABEL_8:
        v9 = (id)v14[5];
        _Block_object_dispose(&v13, 8);

        goto LABEL_9;
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController legacyViewContext](self, "legacyViewContext"));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10004B828;
      v11[3] = &unk_10054FD20;
      v8 = v11;
      v11[6] = &v13;
      v11[4] = self;
      v11[5] = v6;
      objc_msgSend(v7, "performBlockAndWait:", v11);
    }

    goto LABEL_8;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (void)addFolderButtonAction:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController folderCreationController](self, "folderCreationController", a3));
  objc_msgSend(v3, "promptToAddFolderAllowingSmartFolder:withCompletionHandler:", 1, 0);

}

- (void)scrollToContainerWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionViewDiffableDataSource"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForItemIdentifier:", v4));

  if (v8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
    objc_msgSend(v7, "scrollToItemAtIndexPath:atScrollPosition:animated:", v8, 2, 1);

  }
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));
  objc_msgSend(v4, "CGRectValue");
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController firstResponder](self, "firstResponder"));
  v8 = objc_opt_class(ICTagEditingTextField);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
    objc_msgSend(v10, "setContentInset:", 0.0, 0.0, v6, 0.0);

  }
}

- (void)userNotificationRegistrationCompleted:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10004BC04;
  v3[3] = &unk_100550110;
  v3[4] = self;
  performBlockOnMainThread(v3);
}

- (ICOutlineParentCollectionViewCell)tagHeadingCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionViewDiffableDataSource"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "snapshot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemIdentifiers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_objectPassingTest:", &stru_100550E18));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathForItemIdentifier:", v7));
  v9 = objc_opt_class(ICOutlineParentCollectionViewCell);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cellForItemAtIndexPath:", v8));
  v12 = ICDynamicCast(v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return (ICOutlineParentCollectionViewCell *)v13;
}

- (void)folderWasCreated:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[5];

  v4 = a3;
  v5 = objc_opt_class(NSManagedObjectID);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));

  v7 = ICDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[ICFolderListViewController setRecentlyCreatedFolderObjectID:](self, "setRecentlyCreatedFolderObjectID:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController modernViewContext](self, "modernViewContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController recentlyCreatedFolderObjectID](self, "recentlyCreatedFolderObjectID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ic_existingObjectWithID:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ancestorFolderObjectIDs"));
  v13 = objc_msgSend(v12, "mutableCopy");

  v14 = objc_msgSend(objc_alloc((Class)ICFolderListSectionIdentifier), "initWithObject:", v11);
  objc_msgSend(v13, "ic_addNonNilObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController folderDataSource](self, "folderDataSource"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10004BEB4;
  v16[3] = &unk_100550110;
  v16[4] = self;
  objc_msgSend(v15, "expandItemsWithIdentifiers:completion:", v13, v16);

}

- (void)managedObjectContextChangeController:(id)a3 performUpdatesForManagedObjectIDs:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController dataSource](self, "dataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionViewDiffableDataSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "snapshot"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemIdentifiers"));
    v10 = objc_msgSend(v9, "ic_objectsOfClass:", objc_opt_class(ICVirtualSmartFolderItemIdentifier));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    objc_msgSend(v13, "unionSet:", v5);
    objc_msgSend(v13, "unionSet:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController dataSource](self, "dataSource"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "associatedCellsForItemIdentifiers:", v13));

    v16 = objc_msgSend(v15, "ic_objectsOfClass:", objc_opt_class(ICFolderOutlineCollectionViewCell));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v22, "updateSubfolderCount");
          objc_msgSend(v22, "updateNoteCount");
          objc_msgSend(v22, "updateTextAndStatus");
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v19);
    }

  }
}

- (id)managedObjectContextChangeController:(id)a3 managedObjectIDsToUpdateForUpdatedManagedObjects:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  ICFolderListViewController *v51;
  id obj;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v54;
    v51 = self;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v54 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)v10);
        v12 = objc_opt_class(ICNoteContainer);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          v13 = v11;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectID"));
          objc_msgSend(v6, "addObject:", v14);

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "noteContainerAccount"));
          if (v15)
          {
            v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "noteContainerAccount"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectID"));
            objc_msgSend(v6, "ic_addNonNilObject:", v17);

            goto LABEL_9;
          }
          goto LABEL_10;
        }
        v21 = objc_opt_class(ICNote);
        if ((objc_opt_isKindOfClass(v11, v21) & 1) != 0)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "changedValues"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allKeys"));
          v24 = ICKeyPathFromSelector("isSystemPaper");
          v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
          v26 = objc_msgSend(v23, "containsObject:", v25);

          self = v51;
          if (v26)
          {
            v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectID"));
            objc_msgSend(v6, "ic_addNonNilObject:", v13);
            goto LABEL_10;
          }
        }
        else
        {
          v27 = objc_opt_class(NoteCollectionObject);
          if ((objc_opt_isKindOfClass(v11, v27) & 1) != 0
            || (v28 = objc_opt_class(NoteObject), (objc_opt_isKindOfClass(v11, v28) & 1) != 0))
          {
            v29 = objc_opt_class(NoteObject);
            if ((objc_opt_isKindOfClass(v11, v29) & 1) != 0 && (v30 = v11) != 0)
            {
              v13 = v30;
              v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "store"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "store"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "account"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "defaultStore"));
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectID"));
              objc_msgSend(v6, "ic_addNonNilObject:", v34);

              self = v51;
              if (!v16)
                goto LABEL_9;
            }
            else
            {
              v35 = objc_opt_class(NoteCollectionObject);
              if ((objc_opt_isKindOfClass(v11, v35) & 1) == 0)
              {
                v16 = 0;
                v13 = 0;
                goto LABEL_9;
              }
              v16 = v11;
              v13 = 0;
              if (!v16)
                goto LABEL_9;
            }
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectID"));
            objc_msgSend(v6, "ic_addNonNilObject:", v36);

            v37 = objc_opt_class(NoteStoreObject);
            if ((objc_opt_isKindOfClass(v16, v37) & 1) != 0)
            {
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "account"));
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectID"));
              objc_msgSend(v6, "ic_addNonNilObject:", v39);

            }
LABEL_9:

LABEL_10:
            goto LABEL_11;
          }
          v40 = objc_opt_class(NoteBodyObject);
          if ((objc_opt_isKindOfClass(v11, v40) & 1) != 0)
          {
            v41 = v11;
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "owner"));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "store"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectID"));
            objc_msgSend(v6, "ic_addNonNilObject:", v44);

            v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "owner"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "store"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "account"));
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectID"));
            objc_msgSend(v6, "ic_addNonNilObject:", v47);

            goto LABEL_10;
          }
        }
LABEL_11:
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController folderDataSource](self, "folderDataSource"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allSmartFolderObjectIDs"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allObjects"));
        objc_msgSend(v6, "ic_addObjectsFromNonNilArray:", v20);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      v8 = v48;
    }
    while (v48);
  }

  v49 = objc_msgSend(v6, "copy");
  return v49;
}

- (void)addNoteButtonPressed:(id)a3 event:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v7 = a4;
  if (-[ICFolderListViewController isEditing](self, "isEditing"))
    -[ICFolderListViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  v6 = objc_msgSend(v5, "showNewNoteWithApproach:sender:animated:", 13, v7, 1);

}

- (void)debugButtonPressed:(id)a3
{
  +[ICDebuggingViewController presentDebugView:](ICDebuggingViewController, "presentDebugView:", self);
}

- (void)confirmSelection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForSelectedItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  -[ICFolderListViewController collectionView:didSelectItemAtIndexPath:](self, "collectionView:didSelectItemAtIndexPath:", v6, v5);

}

- (void)confirmFocusedCellSelection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForFocusedItems"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
    -[ICFolderListViewController collectionView:didSelectItemAtIndexPath:](self, "collectionView:didSelectItemAtIndexPath:", v5, v6);

  }
}

- (void)selectItemWithIdentifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a4;
  v14 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController dataSource](self, "dataSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionViewDiffableDataSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathForItemIdentifier:", v14));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
      objc_msgSend(v10, "selectItemAtIndexPath:animated:scrollPosition:", v9, v4, 0);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderListViewController collectionView](self, "collectionView"));
      objc_msgSend(v12, "collectionView:didSelectItemAtIndexPath:", v13, v9);

    }
  }

}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (void)setFolderDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_folderDataSource, a3);
}

- (ICItemIdentifier)overrideContainerIdentifier
{
  return self->_overrideContainerIdentifier;
}

- (ICFolderCreationController)folderCreationController
{
  return self->_folderCreationController;
}

- (void)setFolderCreationController:(id)a3
{
  objc_storeStrong((id *)&self->_folderCreationController, a3);
}

- (void)setManagedObjectContextChangeController:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContextChangeController, a3);
}

- (void)setRecentlyCreatedFolderObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_recentlyCreatedFolderObjectID, a3);
}

- (UISpringLoadedInteractionContext)currentSpringLoadedInteractionContext
{
  return self->_currentSpringLoadedInteractionContext;
}

- (void)setCurrentSpringLoadedInteractionContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentSpringLoadedInteractionContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSpringLoadedInteractionContext, 0);
  objc_storeStrong((id *)&self->_recentlyCreatedFolderObjectID, 0);
  objc_storeStrong((id *)&self->_managedObjectContextChangeController, 0);
  objc_storeStrong((id *)&self->_folderCreationController, 0);
  objc_storeStrong((id *)&self->_addFolderButton, 0);
  objc_storeStrong((id *)&self->_overrideContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_summaryView, 0);
  objc_storeStrong((id *)&self->_folderDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
