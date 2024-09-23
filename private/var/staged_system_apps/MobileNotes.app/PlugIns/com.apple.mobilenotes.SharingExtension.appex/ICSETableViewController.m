@implementation ICSETableViewController

- (NSString)accountPickerBackButtonTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Location"), &stru_1000DAF38, 0));

  return (NSString *)v3;
}

- (NSString)folderPickerTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Choose Folder"), &stru_1000DAF38, 0));

  return (NSString *)v3;
}

- (NSString)folderPickerBackButtonTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Folders"), &stru_1000DAF38, 0));

  return (NSString *)v3;
}

- (void)viewDidLoad
{
  id v3;
  ICSEFolderListViewState *v4;
  void *v5;
  void *v6;
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
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  objc_class *v65;
  NSString *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  objc_class *v72;
  NSString *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  objc_class *v79;
  NSString *v80;
  void *v81;
  id *v82;
  void *v83;
  void *v84;
  _QWORD v85[4];
  id v86;
  id location;
  objc_super v88;
  _QWORD v89[2];
  _QWORD v90[3];

  v88.receiver = self;
  v88.super_class = (Class)ICSETableViewController;
  -[ICSETableViewController viewDidLoad](&v88, "viewDidLoad");
  v3 = objc_msgSend(objc_alloc((Class)ICScrollViewKeyboardResizer), "initWithDelegate:", self);
  -[ICSETableViewController setScrollViewResizer:](self, "setScrollViewResizer:", v3);

  v4 = objc_alloc_init(ICSEFolderListViewState);
  -[ICSETableViewController setFolderListViewState:](self, "setFolderListViewState:", v4);

  if (UIAccessibilityDarkerSystemColorsEnabled())
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ICDarkenedTintColor](UIColor, "ICDarkenedTintColor"));
  else
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ICTintColor](UIColor, "ICTintColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController view](self, "view"));
  objc_msgSend(v5, "setTintColor:", v84);

  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIShape capsuleShape](UIShape, "capsuleShape"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shapeByApplyingInset:", -8.0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIHoverStyle styleWithShape:](UIHoverStyle, "styleWithShape:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchCancelButton](self, "searchCancelButton"));
    objc_msgSend(v9, "setHoverStyle:", v8);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController navigationController](self, "navigationController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationBar"));
  objc_msgSend(v11, "setForceFullHeightInLandscape:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v12, "setHidesBackButton:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v13, "setLeftItemsSupplementBackButton:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
  +[ICSETableViewItem configureTableViewNibs:](ICSETableViewItem, "configureTableViewNibs:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
  objc_msgSend(v16, "setBackgroundColor:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController view](self, "view"));
  objc_msgSend(v18, "setBackgroundColor:", v17);

  -[ICSETableViewController setTableViewHidesEmptyCells:](self, "setTableViewHidesEmptyCells:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
  objc_msgSend(v19, "setDelegate:", self);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
  objc_msgSend(v20, "setDataSource:", self);

  v21 = objc_alloc_init((Class)UIView);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
  objc_msgSend(v22, "setBackgroundView:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
  objc_msgSend(v24, "setSeparatorColor:", v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
  objc_msgSend(v25, "setRowHeight:", UITableViewAutomaticDimension);

  if (ICAccessibilityAccessibilityLargerTextSizesEnabled(v26, v27))
    v28 = 88.0;
  else
    v28 = 44.0;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
  objc_msgSend(v29, "setEstimatedRowHeight:", v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
  objc_msgSend(v30, "setSectionHeaderHeight:", UITableViewAutomaticDimension);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController navigationController](self, "navigationController"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "navigationBar"));
  objc_msgSend(v33, "setBackgroundColor:", v31);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController navigationController](self, "navigationController"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "navigationBar"));
  objc_msgSend(v35, "_setHidesShadow:", 1);

  v36 = +[ICSearchQueryOperation newOperationQueueWithName:](ICSearchQueryOperation, "newOperationQueueWithName:", CFSTR("com.apple.notes.sharing-extension-query-operation-queue"));
  -[ICSETableViewController setQueryOperationQueue:](self, "setQueryOperationQueue:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController backBarButtonItem](self, "backBarButtonItem"));
  objc_msgSend(v37, "_setShowsBackButtonIndicator:", 1);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchBar](self, "searchBar"));
  objc_msgSend(v38, "setDelegate:", self);

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v39, "addObserver:selector:name:object:", self, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController backBarButtonItem](self, "backBarButtonItem"));
  objc_msgSend(v40, "setTitlePositionAdjustment:forBarMetrics:", 0, 16.0, 0.0);

  v41 = +[UIDevice ic_isVision](UIDevice, "ic_isVision");
  if ((v41 & 1) != 0)
    v42 = 0;
  else
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController createNewNoteToolbar](self, "createNewNoteToolbar"));
  objc_msgSend(v43, "setBarTintColor:", v42);

  if ((v41 & 1) == 0)
  objc_initWeak(&location, self);
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_100015458;
  v85[3] = &unk_1000D6188;
  objc_copyWeak(&v86, &location);
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v85));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration ic_filledTintedButtonConfiguration](UIButtonConfiguration, "ic_filledTintedButtonConfiguration"));
  objc_msgSend(v44, "setCornerStyle:", 3);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("Create New Note"), &stru_1000DAF38, 0));
  objc_msgSend(v44, "setTitle:", v46);

  objc_msgSend(v44, "setTitleTextAttributesTransformer:", &stru_1000D61C8);
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v44, v83));
  objc_msgSend(v47, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v48 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController createNewNoteToolbar](self, "createNewNoteToolbar"));
  v50 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:menu:", 5, 0);
  v90[0] = v50;
  v90[1] = v48;
  v51 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:menu:", 5, 0);
  v90[2] = v51;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v90, 3));
  objc_msgSend(v49, "setItems:", v52);

  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
    v53 = 85.0;
  else
    v53 = 50.0;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "widthAnchor", &v86));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintGreaterThanOrEqualToConstant:", 360.0));
  v89[0] = v55;
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "heightAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintGreaterThanOrEqualToConstant:", v53));
  v89[1] = v57;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v89, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v58);

  -[ICSETableViewController setCreateNewNoteButton:](self, "setCreateNewNoteButton:", v47);
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController createNewNoteToolbarHeightConstraint](self, "createNewNoteToolbarHeightConstraint"));
  objc_msgSend(v59, "setConstant:", v53 + 16.0);

  if (+[ICDeviceSupport deviceIsVision](ICDeviceSupport, "deviceIsVision"))
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController createNewNoteToolbarBottomConstraint](self, "createNewNoteToolbarBottomConstraint"));
    objc_msgSend(v60, "setConstant:", -8.0);
  }
  else
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController createNewNoteToolbarBottomConstraint](self, "createNewNoteToolbarBottomConstraint"));
    objc_msgSend(v60, "setConstant:", 0.0);
  }

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
  v63 = objc_opt_class(UITableViewHeaderFooterView, v62);
  v65 = (objc_class *)objc_opt_class(UITableViewHeaderFooterView, v64);
  v66 = NSStringFromClass(v65);
  v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
  objc_msgSend(v61, "registerClass:forHeaderFooterViewReuseIdentifier:", v63, v67);

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
  v70 = objc_opt_class(ICSETableViewHeaderView, v69);
  v72 = (objc_class *)objc_opt_class(ICSETableViewHeaderView, v71);
  v73 = NSStringFromClass(v72);
  v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
  objc_msgSend(v68, "registerClass:forHeaderFooterViewReuseIdentifier:", v70, v74);

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
  v77 = objc_opt_class(UITableViewCell, v76);
  v79 = (objc_class *)objc_opt_class(UITableViewCell, v78);
  v80 = NSStringFromClass(v79);
  v81 = (void *)objc_claimAutoreleasedReturnValue(v80);
  objc_msgSend(v75, "registerClass:forCellReuseIdentifier:", v77, v81);

  objc_destroyWeak(v82);
  objc_destroyWeak(&location);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICSETableViewController;
  -[ICSETableViewController dealloc](&v4, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  ICNavigationTitleView *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)ICSETableViewController;
  -[ICSETableViewController viewWillAppear:](&v30, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "notesContextRefreshNotification:", ICNotesContextRefreshNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "extensionHostDidBecomeActive:", NSExtensionHostDidBecomeActiveNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchBar](self, "searchBar"));
  objc_msgSend(v6, "resignFirstResponder");

  -[ICSETableViewController setUpForIsShowingSearchResults:animated:](self, "setUpForIsShowingSearchResults:animated:", -[ICSETableViewController isShowingSearchResults](self, "isShowingSearchResults"), 0);
  if (!-[ICSETableViewController isNotePickerController](self, "isNotePickerController"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v20, "setLeftBarButtonItem:", 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController backBarButtonItem](self, "backBarButtonItem"));
    v21 = (ICNavigationTitleView *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController navigationItem](self, "navigationItem"));
    -[ICNavigationTitleView setLeftBarButtonItem:](v21, "setLeftBarButtonItem:", v19);
LABEL_14:

    goto LABEL_15;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController navigationController](self, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationItem"));
  objc_msgSend(v8, "setLeftBarButtonItems:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController representedItem](self, "representedItem"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "folder"));
  if (v10)
  {
    v11 = (void *)v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController representedItem](self, "representedItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "folder"));
    v14 = objc_msgSend(v13, "isSharedViaICloud");

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController representedItem](self, "representedItem"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "folder"));
      v17 = objc_msgSend(v16, "isOwnedByCurrentUser");

      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Shared by Me"), &stru_1000DAF38, 0));
      }
      else
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController representedItem](self, "representedItem"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "folder"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sharedOwnerName"));

        if (objc_msgSend(v18, "length"))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Shared by %@"), &stru_1000DAF38, 0));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v25, v18));

        }
        else
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Shared to Me"), &stru_1000DAF38, 0));
        }

      }
      v21 = objc_alloc_init(ICNavigationTitleView);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController title](self, "title"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICNavigationTitleView titleLabel](v21, "titleLabel"));
      objc_msgSend(v27, "setText:", v26);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICNavigationTitleView subtitleLabel](v21, "subtitleLabel"));
      objc_msgSend(v28, "setText:", v19);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v29, "setTitleView:", v21);

      goto LABEL_14;
    }
  }
  else
  {

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v19, "setTitleView:", 0);
LABEL_15:

  -[ICSETableViewController refreshTableView](self, "refreshTableView");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICSETableViewController;
  -[ICSETableViewController viewDidLayoutSubviews](&v8, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController view](self, "view"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController scrollViewResizer](self, "scrollViewResizer"));
    v7 = objc_msgSend(v6, "isAutoResizing");

    if ((v7 & 1) != 0)
      return;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController scrollViewResizer](self, "scrollViewResizer"));
    objc_msgSend(v3, "startAutoResizing");
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICSETableViewController;
  -[ICSETableViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  -[ICSETableViewController showOrHideCreateNewNoteButton](self, "showOrHideCreateNewNoteButton");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICSETableViewController;
  -[ICSETableViewController viewWillDisappear:](&v8, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController scrollViewResizer](self, "scrollViewResizer"));
  objc_msgSend(v4, "stopAutoResizing");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchBar](self, "searchBar"));
  objc_msgSend(v5, "resignFirstResponder");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, ICNotesContextRefreshNotification, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "removeObserver:name:object:", self, NSExtensionHostDidBecomeActiveNotification, 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICSETableViewController;
  -[ICSETableViewController viewDidDisappear:](&v6, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchBar](self, "searchBar"));
  objc_msgSend(v4, "resignFirstResponder");

  -[ICSETableViewController setInhibitSearchCancelAnimation:](self, "setInhibitSearchCancelAnimation:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchBar](self, "searchBar"));
  objc_msgSend(v5, "resignFirstResponder");

}

- (void)willAppearInContainer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchBar](self, "searchBar", a3));
  objc_msgSend(v4, "resignFirstResponder");

  if (-[ICSETableViewController isNotePickerController](self, "isNotePickerController"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController navigationController](self, "navigationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationItem"));
    objc_msgSend(v6, "setLeftBarButtonItems:", 0);

  }
  -[ICSETableViewController refreshTableView](self, "refreshTableView");
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ICSETableViewController view](self, "view"));
  objc_msgSend(v7, "layoutIfNeeded");

}

- (void)didDisppearInContainer:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchBar](self, "searchBar", a3));
  objc_msgSend(v4, "resignFirstResponder");

  -[ICSETableViewController setInhibitSearchCancelAnimation:](self, "setInhibitSearchCancelAnimation:", 0);
}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICSETableViewController;
  -[ICSETableViewController viewSafeAreaInsetsDidChange](&v4, "viewSafeAreaInsetsDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController scrollViewResizer](self, "scrollViewResizer"));
  objc_msgSend(v3, "reapplyInsets");

}

- (BOOL)isRootController
{
  ICSETableViewController *v2;
  void *v3;
  void *v4;
  ICSETableViewController *v5;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController navigationController](self, "navigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllers"));
  v5 = (ICSETableViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  LOBYTE(v2) = v5 == v2;

  return (char)v2;
}

- (BOOL)isAccountPickerController
{
  return -[ICSETableViewController tableViewType](self, "tableViewType") == 0;
}

- (BOOL)isFolderPickerController
{
  return (id)-[ICSETableViewController tableViewType](self, "tableViewType") == (id)1;
}

- (BOOL)isNotePickerController
{
  return (id)-[ICSETableViewController tableViewType](self, "tableViewType") == (id)2;
}

- (void)cancelButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchBar](self, "searchBar", a3));
  objc_msgSend(v4, "resignFirstResponder");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ICSETableViewController containerViewController](self, "containerViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootViewController"));
  objc_msgSend(v5, "setIsShowingSearchResults:animated:", 0, 1);

}

- (void)backButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchBar](self, "searchBar", a3));
  objc_msgSend(v4, "resignFirstResponder");

  if (-[ICSETableViewController isRootController](self, "isRootController"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[ICSETableViewController containerViewController](self, "containerViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootViewController"));
    objc_msgSend(v5, "setIsShowingSearchResults:animated:", 0, 1);

  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[ICSETableViewController navigationController](self, "navigationController"));
    v6 = objc_msgSend(v7, "popViewControllerAnimated:", 1);
  }

}

- (void)setTableViewItems:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewItems, a3);
  -[ICSETableViewController showOrHideEmptyTableCellsIfNecessary](self, "showOrHideEmptyTableCellsIfNecessary");
}

- (void)setAccounts:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ICSETableViewItem *v10;
  ICSETableViewItem *representedItem;
  ICSETableViewItem *v12;
  ICSETableViewItem *v13;
  id v14;

  v14 = a3;
  objc_storeStrong((id *)&self->_accounts, a3);
  if (!-[ICSETableViewController tableViewType](self, "tableViewType") && objc_msgSend(v14, "count") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 0));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController delegate](self, "delegate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentSelectedNoteForTableViewController:", self));

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController delegate](self, "delegate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentSelectedFolderForTableViewController:", self));

      if (objc_msgSend(v5, "hasAnyCustomFoldersIncludingSystem:", 1))
      {
        -[ICSETableViewController setTableViewType:](self, "setTableViewType:", 1);
        v10 = (ICSETableViewItem *)objc_claimAutoreleasedReturnValue(+[ICSETableViewItem tableViewItemFromObject:selectedNote:selectedFolder:isSearchResult:isAccountPicker:](ICSETableViewItem, "tableViewItemFromObject:selectedNote:selectedFolder:isSearchResult:isAccountPicker:", v5, v7, v9, 0, 0));
        representedItem = self->_representedItem;
        self->_representedItem = v10;
      }
      else
      {
        -[ICSETableViewController setTableViewType:](self, "setTableViewType:", 2);
        representedItem = (ICSETableViewItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultFolder"));
        v12 = (ICSETableViewItem *)objc_claimAutoreleasedReturnValue(+[ICSETableViewItem tableViewItemFromObject:selectedNote:selectedFolder:isSearchResult:isAccountPicker:](ICSETableViewItem, "tableViewItemFromObject:selectedNote:selectedFolder:isSearchResult:isAccountPicker:", representedItem, v7, v9, 0, 0));
        v13 = self->_representedItem;
        self->_representedItem = v12;

      }
    }

  }
  -[ICSETableViewController refreshTableView](self, "refreshTableView");

}

- (void)setRepresentedItem:(id)a3
{
  objc_storeStrong((id *)&self->_representedItem, a3);
  -[ICSETableViewController refreshTableView](self, "refreshTableView");
}

- (void)setTableViewHidesEmptyCells:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_tableViewHidesEmptyCells != a3)
  {
    v3 = a3;
    self->_tableViewHidesEmptyCells = a3;
    if (a3)
      v6 = objc_alloc_init((Class)UIView);
    else
      v6 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
    objc_msgSend(v5, "setTableFooterView:", v6);

    if (v3)
  }
}

- (void)setSearchBarHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  float v6;
  void *v7;
  double v8;
  id v9;

  v3 = a3;
  self->_searchBarHidden = a3;
  v5 = -[ICSETableViewController view](self, "view");
  if (self->_searchBarHidden)
    v6 = 999.0;
  else
    v6 = 1.0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchBarZeroHeightConstraint](self, "searchBarZeroHeightConstraint"));
  *(float *)&v8 = v6;
  objc_msgSend(v7, "setPriority:", v8);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchCancelButton](self, "searchCancelButton"));
  objc_msgSend(v9, "setHidden:", v3);

}

- (void)showOrHideEmptyTableCellsIfNecessary
{
  _BOOL8 v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController itemsForSection:](self, "itemsForSection:", 1));
  v5 = objc_msgSend(v4, "count");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController itemsForSection:](self, "itemsForSection:", 0));
  v7 = (uint64_t)objc_msgSend(v6, "count");

  if (-[ICSETableViewController isShowingSearchResults](self, "isShowingSearchResults") && v5 == (id)-v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchBar](self, "searchBar"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ic_trimmedString"));
    v3 = objc_msgSend(v10, "length") != 0;

  }
  -[ICSETableViewController setTableViewHidesEmptyCells:](self, "setTableViewHidesEmptyCells:", v3);
}

- (void)rebuildTableItems
{
  ICSETableViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char *v25;
  char *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  ICSETableViewItem *v35;
  void *v36;
  void *v37;
  void *v38;
  char *v39;
  char *i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char *v47;
  void *v48;
  void *v49;
  char *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  char *v64;
  ICSETableViewItem *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  ICSETableViewController *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSelectedNoteForTableViewController:", v2));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController delegate](v2, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentSelectedFolderForTableViewController:", v2));

  v7 = &ICTTAttributeNameUnderline_ptr;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[ICSETableViewController setFolderTableViewItems:](v2, "setFolderTableViewItems:", v8);

  -[ICSETableViewController setPinnedNoteItems:](v2, "setPinnedNoteItems:", 0);
  -[ICSETableViewController setNonPinnedNoteItems:](v2, "setNonPinnedNoteItems:", 0);
  v70 = v2;
  if (-[ICSETableViewController isAccountPickerController](v2, "isAccountPickerController"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController accounts](v2, "accounts"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v76;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v76 != v13)
            objc_enumerationMutation(v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICSETableViewItem tableViewItemFromObject:selectedNote:selectedFolder:isSearchResult:isAccountPicker:](ICSETableViewItem, "tableViewItemFromObject:selectedNote:selectedFolder:isSearchResult:isAccountPicker:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)v14), v4, v6, 0, 1));
          objc_msgSend(v9, "addObject:", v15);

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
      }
      while (v12);
    }

    v2 = v70;
  }
  else if (-[ICSETableViewController isFolderPickerController](v2, "isFolderPickerController"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController folderListViewState](v2, "folderListViewState"));
    objc_msgSend(v16, "removeAccounts");

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController accounts](v2, "accounts"));
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v72;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v72 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController folderListViewState](v2, "folderListViewState"));
          objc_msgSend(v23, "addAccount:", v22);

          v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
      }
      while (v19);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController folderListViewState](v2, "folderListViewState"));
    v25 = (char *)objc_msgSend(v24, "countOfAccounts");

    if (v25)
    {
      v26 = 0;
      v64 = v25;
      do
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[105], "array"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController folderListViewState](v2, "folderListViewState"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "accountItemAtIndex:", v26));

        v30 = objc_opt_class(ICAccount, v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "noteContainer"));
        v32 = ICCheckedDynamicCast(v30, v31);
        v33 = objc_claimAutoreleasedReturnValue(v32);

        if (v25 != (char *)1)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[ICSETableViewHeaderItem headerItemWithAccount:](ICSETableViewHeaderItem, "headerItemWithAccount:", v33));
          objc_msgSend(v34, "setFolderListItem:", v28);
          objc_msgSend(v34, "setIsInFolderList:", 1);
          objc_msgSend(v9, "addObject:", v34);

        }
        v67 = v28;
        v35 = objc_alloc_init(ICSETableViewItem);
        v66 = (void *)v33;
        -[ICSETableViewItem setAccount:](v35, "setAccount:", v33);
        -[ICSETableViewItem setIsSystemPaperFolder:](v35, "setIsSystemPaperFolder:", 1);
        -[ICSETableViewItem setSelectedNote:](v35, "setSelectedNote:", v4);
        -[ICSETableViewItem setSelectedFolder:](v35, "setSelectedFolder:", v6);
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Quick Notes"), &stru_1000DAF38, 0));
        -[ICSETableViewItem setTitle:](v35, "setTitle:", v37);

        -[ICSETableViewItem setIsInFolderList:](v35, "setIsInFolderList:", 1);
        objc_msgSend(v9, "addObject:", v35);
        v65 = v35;
        objc_msgSend(v68, "addObject:", v35);
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController folderListViewState](v2, "folderListViewState"));
        v39 = (char *)objc_msgSend(v38, "countOfItemsInAccountAtIndex:", v26);

        if (v39)
        {
          for (i = 0; i != v39; ++i)
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", i, v26));
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController folderListViewState](v2, "folderListViewState"));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "itemAtIndexPath:", v41));

            v44 = (void *)objc_claimAutoreleasedReturnValue(+[ICSETableViewItem tableViewItemFromObject:selectedNote:selectedFolder:isSearchResult:isAccountPicker:](ICSETableViewItem, "tableViewItemFromObject:selectedNote:selectedFolder:isSearchResult:isAccountPicker:", v43, v4, v6, 0, 0));
            if (objc_msgSend(v43, "isAccount"))
            {
              objc_msgSend(v44, "setIsAccountFolder:", 1);
              objc_msgSend(v44, "setIsAccountHeader:", 0);
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "account"));
              v69 = v41;
              v46 = v9;
              v47 = v39;
              v48 = v6;
              v49 = v4;
              v50 = v26;
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "allItemsFolderLocalizedTitle"));
              objc_msgSend(v44, "setTitle:", v51);

              v26 = v50;
              v4 = v49;
              v6 = v48;
              v39 = v47;
              v9 = v46;
              v41 = v69;

            }
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "title"));

            if (v52)
            {
              objc_msgSend(v44, "setIsInFolderList:", 1);
              objc_msgSend(v9, "addObject:", v44);
              objc_msgSend(v68, "addObject:", v44);
            }

            v2 = v70;
          }
        }
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController folderTableViewItems](v2, "folderTableViewItems"));
        objc_msgSend(v53, "addObject:", v68);

        ++v26;
        v25 = v64;
        v7 = &ICTTAttributeNameUnderline_ptr;
      }
      while (v26 != v64);
    }
  }
  else
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController representedItem](v2, "representedItem"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "folder"));

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController representedItem](v2, "representedItem"));
    v57 = v56;
    if (v55)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "folder"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController representedItem](v2, "representedItem"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController noteItemsForContainer:hideNonSystemPaperNotes:](v2, "noteItemsForContainer:hideNonSystemPaperNotes:", v58, objc_msgSend(v59, "isSystemPaperFolder")));

    }
    else
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "account"));

      if (v60)
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController representedItem](v2, "representedItem"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "account"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController representedItem](v2, "representedItem"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController noteItemsForContainer:hideNonSystemPaperNotes:](v2, "noteItemsForContainer:hideNonSystemPaperNotes:", v62, objc_msgSend(v63, "isSystemPaperFolder")));

      }
      else
      {
        v9 = &__NSArray0__struct;
      }
    }
  }
  -[ICSETableViewController setTableViewItems:](v2, "setTableViewItems:", v9);

}

- (void)refreshTableView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  objc_msgSend(v3, "refreshAll");

  if (!-[ICSETableViewController isShowingSearchResults](self, "isShowingSearchResults"))
  {
    -[ICSETableViewController rebuildTableItems](self, "rebuildTableItems");
    if (-[ICSETableViewController isNotePickerController](self, "isNotePickerController")
      && -[ICSETableViewController isRootController](self, "isRootController"))
    {
      v7 = 0;
      v8 = 1;
    }
    else
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController cancelButton](self, "cancelButton"));
      v10 = v3;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
      v8 = 0;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v9, "setRightBarButtonItems:", v7);

    if ((v8 & 1) == 0)
    {

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
    objc_msgSend(v6, "reloadData");
    goto LABEL_11;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchString](self, "searchString"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchString](self, "searchString"));
    -[ICSETableViewController performSearchForString:](self, "performSearchForString:", v6);
LABEL_11:

  }
  -[ICSETableViewController showOrHideCreateNewNoteButton](self, "showOrHideCreateNewNoteButton");
}

- (void)showOrHideCreateNewNoteButton
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double top;
  double v12;
  double v13;
  double v14;
  double left;
  double bottom;
  double right;
  void *v18;
  id v19;

  v3 = -[ICSETableViewController isNotePickerController](self, "isNotePickerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController createNewNoteToolbar](self, "createNewNoteToolbar"));
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setHidden:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController createNewNoteToolbar](self, "createNewNoteToolbar"));
    objc_msgSend(v6, "bounds");
    v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
    objc_msgSend(v9, "setContentInset:", 0.0, 0.0, v8, 0.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
    top = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    v19 = v10;
    v14 = v8;
  }
  else
  {
    objc_msgSend(v4, "setHidden:", 1);

    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
    objc_msgSend(v18, "setContentInset:", UIEdgeInsetsZero.top, left, bottom, right);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
    v19 = v10;
    top = UIEdgeInsetsZero.top;
    v12 = left;
    v14 = bottom;
    v13 = right;
  }
  objc_msgSend(v10, "setScrollIndicatorInsets:", top, v12, v14, v13);

}

- (id)noteItemsForContainer:(id)a3 hideNonSystemPaperNotes:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController delegate](self, "delegate"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentSelectedNoteForTableViewController:", self));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController delegate](self, "delegate"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentSelectedFolderForTableViewController:", self));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "visibleNotes"));
  v10 = v9;
  if (v4)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ic_objectsPassingTest:", &stru_1000D6208));

    v10 = (void *)v11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "customNoteSortType"));
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_claimAutoreleasedReturnValue(+[ICFolderCustomNoteSortType noteSortTypeDefaultAscending](ICFolderCustomNoteSortType, "noteSortTypeDefaultAscending"));
  v15 = v14;

  v33 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteListSortUtilities sortDescriptorsForCurrentTypeIncludingPinnedNotes:folderNoteSortType:](ICNoteListSortUtilities, "sortDescriptorsForCurrentTypeIncludingPinnedNotes:folderNoteSortType:", 1, v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortedArrayUsingDescriptors:", v16));

  v18 = objc_alloc_init((Class)NSMutableArray);
  v19 = objc_alloc_init((Class)NSMutableArray);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v20 = v17;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v25, "isPinned"))
          v26 = v18;
        else
          v26 = v19;
        objc_msgSend(v26, "addObject:", v25);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v22);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[ICSETableViewItem tableViewItemsForObjects:selectedNote:selectedFolder:isSearchResult:noteContainer:isAccountPicker:](ICSETableViewItem, "tableViewItemsForObjects:selectedNote:selectedFolder:isSearchResult:noteContainer:isAccountPicker:", v18, v35, v34, 0, v6, 0));
  v28 = objc_msgSend(v27, "copy");
  -[ICSETableViewController setPinnedNoteItems:](self, "setPinnedNoteItems:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[ICSETableViewItem tableViewItemsForObjects:selectedNote:selectedFolder:isSearchResult:noteContainer:isAccountPicker:](ICSETableViewItem, "tableViewItemsForObjects:selectedNote:selectedFolder:isSearchResult:noteContainer:isAccountPicker:", v19, v35, v34, 0, v6, 0));
  v30 = objc_msgSend(v29, "copy");
  -[ICSETableViewController setNonPinnedNoteItems:](self, "setNonPinnedNoteItems:", v30);

  v31 = v27;
  objc_msgSend(v31, "addObjectsFromArray:", v29);

  return v31;
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView", a3, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleCells"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "contentSizeCategoryDidChange") & 1) != 0)
          objc_msgSend(v10, "contentSizeCategoryDidChange");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
  objc_msgSend(v11, "reloadData");

}

- (NSArray)folderSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("accountNameForAccountListSorting"), 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:selector:](NSSortDescriptor, "sortDescriptorWithKey:ascending:selector:", CFSTR("sortOrder"), 1, "compare:", v2));
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:selector:](NSSortDescriptor, "sortDescriptorWithKey:ascending:selector:", CFSTR("nestedTitleForSorting"), 1, "localizedStandardCompare:"));
  v7[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 3));

  return (NSArray *)v5;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  id v33;
  void *v35;
  uint64_t v36;
  objc_class *v37;
  NSString *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  objc_class *v47;
  NSString *v48;
  void *v49;

  if (-[ICSETableViewController isShowingSearchResults](self, "isShowingSearchResults", a3))
  {
    if (a4 == 1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("Notes");
    }
    else
    {
      if (a4)
      {
        v17 = &stru_1000DAF38;
        goto LABEL_17;
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("Folders");
    }
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1000DAF38, 0));

LABEL_17:
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
    v21 = (objc_class *)objc_opt_class(ICSETableViewHeaderView, v20);
    v22 = NSStringFromClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dequeueReusableHeaderFooterViewWithIdentifier:", v23));

    objc_msgSend(v10, "setTypeLabelText:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("%ld Found"), &stru_1000DAF38, 0));

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchTableViewItems](self, "searchTableViewItems"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndexedSubscript:", a4));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v25, objc_msgSend(v27, "count")));
    objc_msgSend(v10, "setCountLabelText:", v28);

    goto LABEL_18;
  }
  if (-[ICSETableViewController isAccountPickerController](self, "isAccountPickerController")
    && !-[ICSETableViewController isShowingSearchResults](self, "isShowingSearchResults"))
  {
    if (a4 == 1)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v30 = v29;
      v31 = CFSTR("Save To Location:");
    }
    else
    {
      if (a4)
      {
        v44 = 0;
LABEL_31:
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedUppercaseString"));

        if (!v17 || !-[__CFString length](v17, "length"))
        {
          v10 = 0;
          goto LABEL_19;
        }
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
        v47 = (objc_class *)objc_opt_class(UITableViewHeaderFooterView, v46);
        v48 = NSStringFromClass(v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "dequeueReusableHeaderFooterViewWithIdentifier:", v49));

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
        objc_msgSend(v25, "setText:", v17);
LABEL_18:

LABEL_19:
        return v10;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v30 = v29;
      v31 = CFSTR("Save To New Note In:");
    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", v31, &stru_1000DAF38, 0));

    goto LABEL_31;
  }
  if (-[ICSETableViewController isFolderPickerController](self, "isFolderPickerController")
    && !-[ICSETableViewController isShowingSearchResults](self, "isShowingSearchResults"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController accounts](self, "accounts"));
    v33 = objc_msgSend(v32, "count");

    if (v33 != (id)1)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
      v37 = (objc_class *)objc_opt_class(ICSETableViewHeaderView, v36);
      v38 = NSStringFromClass(v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "dequeueReusableHeaderFooterViewWithIdentifier:", v39));

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController accounts](self, "accounts"));
      v41 = objc_msgSend(v40, "count");

      if ((unint64_t)v41 <= a4)
        return v10;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController accounts](self, "accounts"));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndexedSubscript:", a4));

      v43 = objc_claimAutoreleasedReturnValue(-[__CFString localizedName](v17, "localizedName"));
      goto LABEL_37;
    }
LABEL_24:
    v10 = 0;
    return v10;
  }
  if (!-[ICSETableViewController isNotePickerController](self, "isNotePickerController"))
    goto LABEL_24;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController pinnedNoteItems](self, "pinnedNoteItems"));
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
    v13 = (objc_class *)objc_opt_class(ICSETableViewHeaderView, v12);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dequeueReusableHeaderFooterViewWithIdentifier:", v15));

    if (a4 == 1)
    {
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = v16;
      v18 = CFSTR("Notes");
      goto LABEL_36;
    }
    if (!a4)
    {
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = v16;
      v18 = CFSTR("Pinned");
LABEL_36:
      v43 = objc_claimAutoreleasedReturnValue(-[__CFString localizedStringForKey:value:table:](v16, "localizedStringForKey:value:table:", v18, &stru_1000DAF38, 0));
LABEL_37:
      v25 = (void *)v43;
      objc_msgSend(v10, "setTypeLabelText:", v43);
      goto LABEL_18;
    }
  }
  return v10;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001770C;
  v6[3] = &unk_1000D5D10;
  v7 = a4;
  v5 = v7;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v6);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  int64_t v5;
  void *v6;

  if (-[ICSETableViewController isShowingSearchResults](self, "isShowingSearchResults", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchTableViewItems](self, "searchTableViewItems"));
    goto LABEL_7;
  }
  if (!-[ICSETableViewController isAccountPickerController](self, "isAccountPickerController"))
  {
    if (!-[ICSETableViewController isFolderPickerController](self, "isFolderPickerController"))
    {
      if (!-[ICSETableViewController isNotePickerController](self, "isNotePickerController"))
        return 1;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController pinnedNoteItems](self, "pinnedNoteItems"));
      if (objc_msgSend(v6, "count"))
        v5 = 2;
      else
        v5 = 1;
      goto LABEL_8;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController accounts](self, "accounts"));
LABEL_7:
    v6 = v4;
    v5 = (int64_t)objc_msgSend(v4, "count");
LABEL_8:

    return v5;
  }
  return 2;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView", a3, a4));
  v5 = (uint64_t)objc_msgSend(v4, "numberOfSections");

  if (v5 < 2)
    return UITableViewAutomaticDimension;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
  objc_msgSend(v6, "pointSize");
  v8 = v7 * 3.0;

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.1;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  double v6;
  void *v7;
  double v8;

  v5 = a4;
  if (!-[ICSETableViewController isShowingSearchResults](self, "isShowingSearchResults")
    && -[ICSETableViewController isAccountPickerController](self, "isAccountPickerController")
    && objc_msgSend(v5, "section") == (id)1
    || -[ICSETableViewController isFolderPickerController](self, "isFolderPickerController"))
  {
    v6 = UITableViewAutomaticDimension;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController itemForIndexPath:](self, "itemForIndexPath:", v5));
    objc_msgSend(v7, "cellHeight");
    v6 = v8;

  }
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v6;
  id v7;
  id v8;
  unsigned __int8 v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if (-[ICSETableViewController isShowingSearchResults](self, "isShowingSearchResults", a3))
  {
LABEL_2:
    v6 = objc_claimAutoreleasedReturnValue(-[ICSETableViewController itemsForSection:](self, "itemsForSection:", a4));
LABEL_3:
    v7 = (id)v6;
LABEL_4:
    v8 = objc_msgSend(v7, "count");

    return (int64_t)v8;
  }
  v10 = -[ICSETableViewController isAccountPickerController](self, "isAccountPickerController");
  if (a4 == 1 && (v10 & 1) != 0)
    return 1;
  if (-[ICSETableViewController isFolderPickerController](self, "isFolderPickerController"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController folderTableViewItems](self, "folderTableViewItems"));
    v12 = objc_msgSend(v11, "count");

    if ((unint64_t)v12 > a4)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController folderTableViewItems](self, "folderTableViewItems"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", a4));
      v7 = objc_msgSend(v14, "copy");

      goto LABEL_4;
    }
  }
  if (!-[ICSETableViewController isNotePickerController](self, "isNotePickerController"))
    goto LABEL_2;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController pinnedNoteItems](self, "pinnedNoteItems"));
  v16 = objc_msgSend(v15, "count");

  if (!v16 || a4 == 1)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[ICSETableViewController nonPinnedNoteItems](self, "nonPinnedNoteItems"));
    goto LABEL_3;
  }
  if (!a4)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[ICSETableViewController pinnedNoteItems](self, "pinnedNoteItems"));
    goto LABEL_3;
  }
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;

  v6 = a3;
  v7 = a4;
  if (-[ICSETableViewController isShowingSearchResults](self, "isShowingSearchResults")
    || !-[ICSETableViewController isAccountPickerController](self, "isAccountPickerController"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController itemForIndexPath:](self, "itemForIndexPath:", v7));
    if (objc_msgSend(v16, "isSearchResult"))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "folder"));

      if (v21 || (v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "note")), v22, v22))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cellIdentifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v23, v7));

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController accounts](self, "accounts"));
        objc_msgSend(v13, "setShowAccountName:", (unint64_t)objc_msgSend(v24, "count") > 1);

        objc_msgSend(v13, "setItem:", v16);
      }
      else
      {
        v39 = os_log_create("com.apple.notes", "SharingExtension");
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          sub_10009E80C(v39);

        v13 = 0;
      }
LABEL_39:

      if (!v13)
        goto LABEL_40;
      goto LABEL_28;
    }
    v25 = v16;
    if (-[ICSETableViewController isFolderPickerController](self, "isFolderPickerController"))
    {
      v26 = objc_msgSend(v7, "section");
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController folderTableViewItems](self, "folderTableViewItems"));
      if (v26 >= objc_msgSend(v27, "count"))
      {

      }
      else
      {
        v28 = -[ICSETableViewController isShowingSearchResults](self, "isShowingSearchResults");

        if ((v28 & 1) == 0)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController folderTableViewItems](self, "folderTableViewItems"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));

LABEL_34:
          v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));

          v25 = (id)v40;
          goto LABEL_35;
        }
      }
    }
    if (-[ICSETableViewController isNotePickerController](self, "isNotePickerController")
      && !-[ICSETableViewController isShowingSearchResults](self, "isShowingSearchResults"))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController pinnedNoteItems](self, "pinnedNoteItems"));
      v32 = objc_msgSend(v31, "count");

      if (!v32 || (v33 = objc_msgSend(v7, "section"), v33 == (id)1))
      {
        v34 = objc_claimAutoreleasedReturnValue(-[ICSETableViewController nonPinnedNoteItems](self, "nonPinnedNoteItems"));
        goto LABEL_33;
      }
      if (!v33)
      {
        v34 = objc_claimAutoreleasedReturnValue(-[ICSETableViewController pinnedNoteItems](self, "pinnedNoteItems"));
LABEL_33:
        v30 = (void *)v34;
        goto LABEL_34;
      }
    }
LABEL_35:
    if (v25)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "cellIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v41, v7));

      objc_msgSend(v13, "setTableViewItem:", v25);
      objc_msgSend(v13, "setDelegate:", self);
      objc_msgSend(v13, "setNeedsUpdateConstraints");
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_39;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
  v10 = (objc_class *)objc_opt_class(UITableViewCell, v9);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", v12));

  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ICTintColor](UIColor, "ICTintColor"));
    objc_msgSend(v13, "setTintColor:", v14);

  }
  v15 = objc_msgSend(v7, "section");
  if (v15 == (id)1)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Choose Note or Folder"), &stru_1000DAF38, 0));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "textLabel"));
    objc_msgSend(v37, "setText:", v36);

    objc_msgSend(v13, "setAccessoryType:", 1);
  }
  else if (!v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController itemForIndexPath:](self, "itemForIndexPath:", v7));
    if (objc_msgSend(v16, "isChecked"))
      v17 = 3;
    else
      v17 = 0;
    objc_msgSend(v13, "setAccessoryType:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "account"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedName"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "textLabel"));
    objc_msgSend(v20, "setText:", v19);

    goto LABEL_39;
  }
  if (!v13)
  {
LABEL_40:
    v38 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
    goto LABEL_41;
  }
LABEL_28:
  v38 = v13;
LABEL_41:
  v42 = v38;

  return v42;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;

  v5 = a4;
  if (-[ICSETableViewController isAccountPickerController](self, "isAccountPickerController")
    && !-[ICSETableViewController isShowingSearchResults](self, "isShowingSearchResults"))
  {
    v7 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController itemForIndexPath:](self, "itemForIndexPath:", v5));
    v7 = objc_msgSend(v6, "isSelectable");

  }
  return v7;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  if (-[ICSETableViewController tableView:shouldHighlightRowAtIndexPath:](self, "tableView:shouldHighlightRowAtIndexPath:", a3, v6))
  {
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (void)selectNote:(id)a3 orFolder:(id)a4 prefersSystemPaper:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[ICSETableViewController setInhibitSearchCancelAnimation:](self, "setInhibitSearchCancelAnimation:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchBar](self, "searchBar"));
  objc_msgSend(v10, "resignFirstResponder");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController delegate](self, "delegate"));
  objc_msgSend(v11, "tableController:didSelectNote:folder:prefersSystemPaper:", self, v9, v8, v5);

  v13 = (id)objc_claimAutoreleasedReturnValue(-[ICSETableViewController containerViewController](self, "containerViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rootViewController"));
  objc_msgSend(v12, "setIsShowingSearchResults:animated:", 0, 1);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;

  v6 = a4;
  v7 = a3;
  v27 = (id)objc_claimAutoreleasedReturnValue(-[ICSETableViewController itemForIndexPath:](self, "itemForIndexPath:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "note"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "note"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "folder"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "note"));
    -[ICSETableViewController selectNote:orFolder:prefersSystemPaper:](self, "selectNote:orFolder:prefersSystemPaper:", v9, v10, objc_msgSend(v11, "isSystemPaper"));

    goto LABEL_20;
  }
  if (objc_msgSend(v27, "isAccountPicker"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "account"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "defaultFolder"));
    -[ICSETableViewController selectNote:orFolder:prefersSystemPaper:](self, "selectNote:orFolder:prefersSystemPaper:", 0, v10, 0);
    goto LABEL_20;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController storyboard](self, "storyboard"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "instantiateViewControllerWithIdentifier:", CFSTR("tableController")));

  objc_msgSend(v9, "setRepresentedItem:", v27);
  if (v27 || !-[ICSETableViewController isAccountPickerController](self, "isAccountPickerController"))
  {
    objc_msgSend(v9, "setTableViewType:", 2);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "title"));
  }
  else
  {
    objc_msgSend(v9, "setTableViewType:", 1);
    v13 = objc_claimAutoreleasedReturnValue(-[ICSETableViewController folderPickerTitle](self, "folderPickerTitle"));
  }
  v14 = (void *)v13;
  objc_msgSend(v9, "setTitle:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController containerViewController](self, "containerViewController"));
  objc_msgSend(v9, "setContainerViewController:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController delegate](self, "delegate"));
  objc_msgSend(v9, "setDelegate:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController accounts](self, "accounts"));
  objc_msgSend(v9, "setAccounts:", v17);

  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "folder"));
  if (v18)
  {
    v19 = (void *)v18;
    v20 = -[ICSETableViewController isShowingSearchResults](self, "isShowingSearchResults");

    if (v20)
      objc_msgSend(v9, "setSearchBarHidden:", 1);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController title](self, "title"));
  if (-[ICSETableViewController isAccountPickerController](self, "isAccountPickerController"))
  {
    v21 = objc_claimAutoreleasedReturnValue(-[ICSETableViewController accountPickerBackButtonTitle](self, "accountPickerBackButtonTitle"));
LABEL_16:
    v22 = (void *)v21;

    v10 = v22;
    goto LABEL_17;
  }
  if (-[ICSETableViewController isFolderPickerController](self, "isFolderPickerController"))
  {
    v21 = objc_claimAutoreleasedReturnValue(-[ICSETableViewController folderPickerBackButtonTitle](self, "folderPickerBackButtonTitle"));
    goto LABEL_16;
  }
LABEL_17:
  if (-[ICSETableViewController isShowingSearchResults](self, "isShowingSearchResults"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Search"), &stru_1000DAF38, 0));

    v10 = (void *)v24;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "backBarButtonItem"));
  objc_msgSend(v25, "setTitle:", v10);

  -[ICSETableViewController setInhibitSearchCancelAnimation:](self, "setInhibitSearchCancelAnimation:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController navigationController](self, "navigationController"));
  objc_msgSend(v26, "pushViewController:animated:", v9, 1);

LABEL_20:
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (void)pushFolderViewForNote:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  int v9;
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
  id v31;

  if (a3)
  {
    v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "folder"));
    if (-[ICSETableViewController isShowingSearchResults](self, "isShowingSearchResults"))
    {
LABEL_18:

      return;
    }
    if (-[ICSETableViewController isAccountPickerController](self, "isAccountPickerController"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController accounts](self, "accounts"));
      if ((unint64_t)objc_msgSend(v4, "count") >= 2)
      {

LABEL_8:
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController storyboard](self, "storyboard"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "instantiateViewControllerWithIdentifier:", CFSTR("tableController")));

        v9 = 1;
        objc_msgSend(v8, "setTableViewType:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController folderPickerTitle](self, "folderPickerTitle"));
        objc_msgSend(v8, "setTitle:", v10);

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController containerViewController](self, "containerViewController"));
        objc_msgSend(v8, "setContainerViewController:", v11);

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController delegate](self, "delegate"));
        objc_msgSend(v8, "setDelegate:", v12);

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController accounts](self, "accounts"));
        objc_msgSend(v8, "setAccounts:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController accountPickerBackButtonTitle](self, "accountPickerBackButtonTitle"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "backBarButtonItem"));
        objc_msgSend(v15, "setTitle:", v14);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController navigationController](self, "navigationController"));
        objc_msgSend(v16, "pushViewController:animated:", v8, 0);

LABEL_10:
        if (v31
          && (-[ICSETableViewController isFolderPickerController](self, "isFolderPickerController")
           || -[ICSETableViewController isAccountPickerController](self, "isAccountPickerController")))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController delegate](self, "delegate"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentSelectedNoteForTableViewController:", self));

          v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController delegate](self, "delegate"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currentSelectedFolderForTableViewController:", self));

          v21 = (void *)objc_claimAutoreleasedReturnValue(+[ICSETableViewItem tableViewItemFromObject:selectedNote:selectedFolder:isSearchResult:isAccountPicker:](ICSETableViewItem, "tableViewItemFromObject:selectedNote:selectedFolder:isSearchResult:isAccountPicker:", v31, v18, v20, 0, 0));
          if (v21)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController storyboard](self, "storyboard"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "instantiateViewControllerWithIdentifier:", CFSTR("tableController")));

            v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController containerViewController](self, "containerViewController"));
            objc_msgSend(v23, "setContainerViewController:", v24);

            objc_msgSend(v23, "setTableViewType:", 2);
            objc_msgSend(v23, "setRepresentedItem:", v21);
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "title"));
            objc_msgSend(v23, "setTitle:", v25);

            v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController delegate](self, "delegate"));
            objc_msgSend(v23, "setDelegate:", v26);

            v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController accounts](self, "accounts"));
            objc_msgSend(v23, "setAccounts:", v27);

            if ((v9 | -[ICSETableViewController isFolderPickerController](self, "isFolderPickerController")) == 1)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController folderPickerBackButtonTitle](self, "folderPickerBackButtonTitle"));
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "backBarButtonItem"));
              objc_msgSend(v29, "setTitle:", v28);

            }
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController navigationController](self, "navigationController"));
            objc_msgSend(v30, "pushViewController:animated:", v23, 0);

          }
        }
        goto LABEL_18;
      }
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "account"));
      v6 = objc_msgSend(v5, "hasAnyCustomFoldersIncludingSystem:", 1);

      if (v6)
        goto LABEL_8;
    }
    v9 = 0;
    goto LABEL_10;
  }
}

- (id)itemForIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  void *v15;
  id v16;

  v4 = a3;
  if (-[ICSETableViewController isFolderPickerController](self, "isFolderPickerController")
    && !-[ICSETableViewController isShowingSearchResults](self, "isShowingSearchResults"))
  {
    v5 = objc_msgSend(v4, "section");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController folderTableViewItems](self, "folderTableViewItems"));
    if (v5 >= objc_msgSend(v6, "count"))
    {

    }
    else
    {
      v7 = objc_msgSend(v4, "row");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController folderTableViewItems](self, "folderTableViewItems"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "section")));
      v10 = objc_msgSend(v9, "count");

      if (v7 < v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController folderTableViewItems](self, "folderTableViewItems"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v4, "section")));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

        goto LABEL_13;
      }
    }
  }
  v14 = (char *)objc_msgSend(v4, "row");
  if (!-[ICSETableViewController isShowingSearchResults](self, "isShowingSearchResults")
    && objc_msgSend(v4, "section") == (id)1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
    v16 = objc_msgSend(v15, "numberOfRowsInSection:", 0);

    v14 = &v14[(_QWORD)v16];
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController itemsForSection:](self, "itemsForSection:", objc_msgSend(v4, "section")));
  if (v14 >= objc_msgSend(v11, "count"))
    v13 = 0;
  else
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v14));
LABEL_13:

  return v13;
}

- (id)itemsForSection:(unint64_t)a3
{
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = -[ICSETableViewController isShowingSearchResults](self, "isShowingSearchResults");
  if (a3 <= 1 && v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchTableViewItems](self, "searchTableViewItems"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));

  }
  else if (!a3
         || a3 == 1
         && -[ICSETableViewController isNotePickerController](self, "isNotePickerController")
         && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController pinnedNoteItems](self, "pinnedNoteItems")),
             v8,
             v8))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableViewItems](self, "tableViewItems"));
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)tableViewCell:(id)a3 setCollapsed:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForCell:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tableViewItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "folderListItem"));

  if (v10 && v9)
  {
    if (v4)
      -[ICSETableViewController collapseFolderListItem:atIndexPath:](self, "collapseFolderListItem:atIndexPath:", v9, v10);
    else
      -[ICSETableViewController expandFolderListItem:atIndexPath:](self, "expandFolderListItem:atIndexPath:", v9, v10);
  }

}

- (void)collapseFolderListItem:(id)a3 atIndexPath:(id)a4
{
  id v6;
  char *v7;
  void *v8;
  void *v9;
  char *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if ((objc_msgSend(v14, "isCollapsible") & 1) == 0)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "item.isCollapsible", "-[ICSETableViewController collapseFolderListItem:atIndexPath:]", 1, 0, CFSTR("Trying to collapse item that is not collapsible"));
  if (objc_msgSend(v14, "isCollapsible") && (objc_msgSend(v14, "isCollapsed") & 1) == 0)
  {
    v7 = (char *)objc_msgSend(v14, "countOfVisibleDescendants");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
    objc_msgSend(v8, "beginUpdates");

    objc_msgSend(v14, "setCollapsed:", 1);
    -[ICSETableViewController rebuildTableItems](self, "rebuildTableItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    for (i = (char *)objc_msgSend(v6, "row") + 1; i <= &v7[(_QWORD)objc_msgSend(v6, "row")]; ++i)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", i, objc_msgSend(v6, "section")));
      objc_msgSend(v9, "addObject:", v11);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
    objc_msgSend(v12, "deleteRowsAtIndexPaths:withRowAnimation:", v9, 3);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
    objc_msgSend(v13, "endUpdates");

  }
}

- (void)expandFolderListItem:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  char *v8;
  void *v9;
  char *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if ((objc_msgSend(v14, "isCollapsible") & 1) == 0)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "item.isCollapsible", "-[ICSETableViewController expandFolderListItem:atIndexPath:]", 1, 0, CFSTR("Trying to expand item that is not collapsible"));
  if (objc_msgSend(v14, "isCollapsible") && objc_msgSend(v14, "isCollapsed"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
    objc_msgSend(v7, "beginUpdates");

    objc_msgSend(v14, "setCollapsed:", 0);
    -[ICSETableViewController rebuildTableItems](self, "rebuildTableItems");
    v8 = (char *)objc_msgSend(v14, "countOfVisibleDescendants");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    for (i = (char *)objc_msgSend(v6, "row") + 1; i <= &v8[(_QWORD)objc_msgSend(v6, "row")]; ++i)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", i, objc_msgSend(v6, "section")));
      objc_msgSend(v9, "addObject:", v11);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
    objc_msgSend(v12, "insertRowsAtIndexPaths:withRowAnimation:", v9, 3);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
    objc_msgSend(v13, "endUpdates");

  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "ic_trimmedString", a3));
  if (objc_msgSend(v6, "length"))
  {
    -[ICSETableViewController performSearchForString:](self, "performSearchForString:", v6);
  }
  else
  {
    -[ICSETableViewController setSearchTableViewItems:](self, "setSearchTableViewItems:", &off_1000DCE28);
    -[ICSETableViewController showOrHideEmptyTableCellsIfNecessary](self, "showOrHideEmptyTableCellsIfNecessary");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
    objc_msgSend(v5, "reloadData");

  }
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  -[ICSETableViewController setIsShowingSearchResults:](self, "setIsShowingSearchResults:", 1);
  return 1;
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchBar](self, "searchBar", a3));
  objc_msgSend(v3, "resignFirstResponder");

}

- (void)searchCancelButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchBar](self, "searchBar", a3));
  objc_msgSend(v4, "resignFirstResponder");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchBar](self, "searchBar"));
  objc_msgSend(v5, "setText:", &stru_1000DAF38);

  -[ICSETableViewController setIsShowingSearchResults:](self, "setIsShowingSearchResults:", 0);
  -[ICSETableViewController setSearchTableViewItems:](self, "setSearchTableViewItems:", &off_1000DCE40);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
  objc_msgSend(v6, "reloadData");

}

- (void)setIsShowingSearchResults:(BOOL)a3
{
  -[ICSETableViewController setIsShowingSearchResults:animated:](self, "setIsShowingSearchResults:animated:", a3, 1);
}

- (void)setIsShowingSearchResults:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;

  if (self->_isShowingSearchResults != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_isShowingSearchResults = a3;
    if (!-[ICSETableViewController inhibitSearchCancelAnimation](self, "inhibitSearchCancelAnimation"))
      -[ICSETableViewController setUpForIsShowingSearchResults:animated:](self, "setUpForIsShowingSearchResults:animated:", v5, v4);
  }
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)setUpForIsShowingSearchResults:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  BOOL v18;
  BOOL v19;

  v4 = a4;
  self->_isShowingSearchResults = a3;
  if (a3)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
    objc_msgSend(v7, "setTableFooterView:", 0);
    v8 = 16.0;
    v9 = 10.0;
    v10 = 500.0;
  }
  else
  {
    v7 = objc_alloc_init((Class)UIView);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
    objc_msgSend(v11, "setTableFooterView:", v7);

    v8 = 8.0;
    v10 = 0.0;
    v9 = -2.0;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
  objc_msgSend(v12, "reloadData");

  if (v4)
    v13 = 0.25;
  else
    v13 = 0.0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchCancelTrailingConstraint](self, "searchCancelTrailingConstraint"));
  objc_msgSend(v14, "setConstant:", v8);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchCancelButtonMaxWidthConstraint](self, "searchCancelButtonMaxWidthConstraint"));
  objc_msgSend(v15, "setConstant:", v10);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController searchBarActiveTopConstraint](self, "searchBarActiveTopConstraint"));
  objc_msgSend(v16, "setConstant:", v9);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000190E4;
  v17[3] = &unk_1000D6230;
  v17[4] = self;
  v18 = a3;
  v19 = v4;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v17, v13);
  -[ICSETableViewController showOrHideEmptyTableCellsIfNecessary](self, "showOrHideEmptyTableCellsIfNecessary");
}

- (void)performSearchForString:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  char *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSString *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id from;
  _BYTE location[12];
  __int16 v27;
  ICSETableViewController *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;

  v5 = a3;
  v6 = os_log_create("com.apple.notes", "SharingExtension");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v16 = (void *)objc_opt_class(self, v7);
    v17 = v16;
    v18 = NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    *(_DWORD *)location = 138413314;
    *(_QWORD *)&location[4] = v16;
    v27 = 2048;
    v28 = self;
    v29 = 2112;
    v30 = v19;
    v31 = 2048;
    v32 = objc_msgSend(v5, "hash");
    v33 = 2048;
    v34 = objc_msgSend(v5, "length");
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%@(%p) %@] Search query string: hash=%lu, length=%lu", location, 0x34u);

  }
  if (!v5)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((searchString) != nil)", "-[ICSETableViewController performSearchForString:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "searchString");
  -[ICSETableViewController setSearchString:](self, "setSearchString:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController queryOperationQueue](self, "queryOperationQueue"));
  objc_msgSend(v8, "cancelAllOperations");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));

  v11 = objc_msgSend(objc_alloc((Class)ICSearchQueryOperation), "initWithSearchSuggestionsResponder:searchString:performNLSearch:performTopHitSearch:tokens:modernResultsOnly:", 0, v5, 1, 0, &__NSArray0__struct, 0);
  v12 = (char *)-[ICSETableViewController queryRequestIndex](self, "queryRequestIndex") + 1;
  -[ICSETableViewController setQueryRequestIndex:](self, "setQueryRequestIndex:", v12);
  objc_msgSend(v11, "setRequestIndex:", v12);
  objc_initWeak((id *)location, v11);
  objc_initWeak(&from, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000194B4;
  v20[3] = &unk_1000D6280;
  objc_copyWeak(&v23, (id *)location);
  v20[4] = self;
  v13 = v10;
  v21 = v13;
  objc_copyWeak(&v24, &from);
  v14 = v5;
  v22 = v14;
  objc_msgSend(v11, "setCompletionBlock:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController queryOperationQueue](self, "queryOperationQueue"));
  objc_msgSend(v15, "addOperation:", v11);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&from);
  objc_destroyWeak((id *)location);

}

- (void)setupSearchResultsWithSearchString:(id)a3 notes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentSelectedNoteForTableViewController:", self));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController delegate](self, "delegate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentSelectedFolderForTableViewController:", self));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController matchingFoldersForString:](self, "matchingFoldersForString:", v7));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICSETableViewItem tableViewItemsForObjects:selectedNote:selectedFolder:isSearchResult:noteContainer:isAccountPicker:](ICSETableViewItem, "tableViewItemsForObjects:selectedNote:selectedFolder:isSearchResult:noteContainer:isAccountPicker:", v12, v9, v11, 1, 0, 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICSETableViewItem tableViewItemsForObjects:selectedNote:selectedFolder:isSearchResult:noteContainer:isAccountPicker:](ICSETableViewItem, "tableViewItemsForObjects:selectedNote:selectedFolder:isSearchResult:noteContainer:isAccountPicker:", v6, v9, v11, 1, 0, 0));

  v17[0] = v13;
  v17[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
  -[ICSETableViewController setSearchTableViewItems:](self, "setSearchTableViewItems:", v15);

  -[ICSETableViewController showOrHideEmptyTableCellsIfNecessary](self, "showOrHideEmptyTableCellsIfNecessary");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController tableView](self, "tableView"));
  objc_msgSend(v16, "reloadData");

}

- (NSArray)allFolders
{
  NSArray *allFolders;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSArray *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  allFolders = self->_allFolders;
  if (!allFolders)
  {
    self->_allFolders = (NSArray *)&__NSArray0__struct;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController accounts](self, "accounts", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v9 = self->_allFolders;
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8), "visibleFolders"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ic_objectsPassingTest:", &stru_1000D62C0));
          v12 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray ic_arrayByAddingObjectsFromNonNilArray:](v9, "ic_arrayByAddingObjectsFromNonNilArray:", v11));
          v13 = self->_allFolders;
          self->_allFolders = v12;

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

    allFolders = self->_allFolders;
  }
  return allFolders;
}

- (id)matchingFoldersForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController allFolders](self, "allFolders"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100019C9C;
    v8[3] = &unk_1000D62E8;
    v9 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_objectsPassingTest:", v8));

  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((string) != nil)", "-[ICSETableViewController matchingFoldersForString:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "string");
    v6 = &__NSArray0__struct;
  }

  return v6;
}

- (double)consumedBottomAreaForResizer:(id)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController view](self, "view", a3));
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;

  return v5;
}

- (double)topInsetForResizer:(id)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewController view](self, "view", a3));
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;

  return v5;
}

- (BOOL)keyboardResizerAutoscrollAboveKeyboard
{
  return 1;
}

- (ICSETableViewControllerDelegate)delegate
{
  return (ICSETableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ICSEContainerViewController)containerViewController
{
  return (ICSEContainerViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (void)setContainerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_containerViewController, a3);
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (unint64_t)tableViewType
{
  return self->_tableViewType;
}

- (void)setTableViewType:(unint64_t)a3
{
  self->_tableViewType = a3;
}

- (BOOL)isShowingSearchResults
{
  return self->_isShowingSearchResults;
}

- (UISearchBar)searchBar
{
  return (UISearchBar *)objc_loadWeakRetained((id *)&self->_searchBar);
}

- (void)setSearchBar:(id)a3
{
  objc_storeWeak((id *)&self->_searchBar, a3);
}

- (BOOL)searchBarHidden
{
  return self->_searchBarHidden;
}

- (UIToolbar)createNewNoteToolbar
{
  return (UIToolbar *)objc_loadWeakRetained((id *)&self->_createNewNoteToolbar);
}

- (void)setCreateNewNoteToolbar:(id)a3
{
  objc_storeWeak((id *)&self->_createNewNoteToolbar, a3);
}

- (NSLayoutConstraint)createNewNoteToolbarHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_createNewNoteToolbarHeightConstraint);
}

- (void)setCreateNewNoteToolbarHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_createNewNoteToolbarHeightConstraint, a3);
}

- (NSLayoutConstraint)createNewNoteToolbarBottomConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_createNewNoteToolbarBottomConstraint);
}

- (void)setCreateNewNoteToolbarBottomConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_createNewNoteToolbarBottomConstraint, a3);
}

- (UIButton)createNewNoteButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_createNewNoteButton);
}

- (void)setCreateNewNoteButton:(id)a3
{
  objc_storeWeak((id *)&self->_createNewNoteButton, a3);
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UIButton)searchCancelButton
{
  return self->_searchCancelButton;
}

- (void)setSearchCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_searchCancelButton, a3);
}

- (NSLayoutConstraint)searchCancelButtonMaxWidthConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_searchCancelButtonMaxWidthConstraint);
}

- (void)setSearchCancelButtonMaxWidthConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_searchCancelButtonMaxWidthConstraint, a3);
}

- (NSLayoutConstraint)searchBarActiveTopConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_searchBarActiveTopConstraint);
}

- (void)setSearchBarActiveTopConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_searchBarActiveTopConstraint, a3);
}

- (NSLayoutConstraint)searchBarZeroHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_searchBarZeroHeightConstraint);
}

- (void)setSearchBarZeroHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_searchBarZeroHeightConstraint, a3);
}

- (NSLayoutConstraint)searchCancelTrailingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_searchCancelTrailingConstraint);
}

- (void)setSearchCancelTrailingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_searchCancelTrailingConstraint, a3);
}

- (BOOL)tableViewHidesEmptyCells
{
  return self->_tableViewHidesEmptyCells;
}

- (BOOL)inhibitSearchCancelAnimation
{
  return self->_inhibitSearchCancelAnimation;
}

- (void)setInhibitSearchCancelAnimation:(BOOL)a3
{
  self->_inhibitSearchCancelAnimation = a3;
}

- (UIBarButtonItem)backBarButtonItem
{
  return self->_backBarButtonItem;
}

- (void)setBackBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_backBarButtonItem, a3);
}

- (ICSETableViewItem)representedItem
{
  return self->_representedItem;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (NSOperationQueue)queryOperationQueue
{
  return self->_queryOperationQueue;
}

- (void)setQueryOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queryOperationQueue, a3);
}

- (int64_t)queryRequestIndex
{
  return self->_queryRequestIndex;
}

- (void)setQueryRequestIndex:(int64_t)a3
{
  self->_queryRequestIndex = a3;
}

- (void)setAllFolders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSMutableArray)folderTableViewItems
{
  return self->_folderTableViewItems;
}

- (void)setFolderTableViewItems:(id)a3
{
  objc_storeStrong((id *)&self->_folderTableViewItems, a3);
}

- (NSArray)pinnedNoteItems
{
  return self->_pinnedNoteItems;
}

- (void)setPinnedNoteItems:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedNoteItems, a3);
}

- (NSArray)nonPinnedNoteItems
{
  return self->_nonPinnedNoteItems;
}

- (void)setNonPinnedNoteItems:(id)a3
{
  objc_storeStrong((id *)&self->_nonPinnedNoteItems, a3);
}

- (NSArray)tableViewItems
{
  return self->_tableViewItems;
}

- (NSArray)searchTableViewItems
{
  return self->_searchTableViewItems;
}

- (void)setSearchTableViewItems:(id)a3
{
  objc_storeStrong((id *)&self->_searchTableViewItems, a3);
}

- (ICSEFolderListViewState)folderListViewState
{
  return self->_folderListViewState;
}

- (void)setFolderListViewState:(id)a3
{
  objc_storeStrong((id *)&self->_folderListViewState, a3);
}

- (ICScrollViewKeyboardResizer)scrollViewResizer
{
  return self->_scrollViewResizer;
}

- (void)setScrollViewResizer:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewResizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollViewResizer, 0);
  objc_storeStrong((id *)&self->_folderListViewState, 0);
  objc_storeStrong((id *)&self->_searchTableViewItems, 0);
  objc_storeStrong((id *)&self->_tableViewItems, 0);
  objc_storeStrong((id *)&self->_nonPinnedNoteItems, 0);
  objc_storeStrong((id *)&self->_pinnedNoteItems, 0);
  objc_storeStrong((id *)&self->_folderTableViewItems, 0);
  objc_storeStrong((id *)&self->_allFolders, 0);
  objc_storeStrong((id *)&self->_queryOperationQueue, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_representedItem, 0);
  objc_storeStrong((id *)&self->_backBarButtonItem, 0);
  objc_destroyWeak((id *)&self->_searchCancelTrailingConstraint);
  objc_destroyWeak((id *)&self->_searchBarZeroHeightConstraint);
  objc_destroyWeak((id *)&self->_searchBarActiveTopConstraint);
  objc_destroyWeak((id *)&self->_searchCancelButtonMaxWidthConstraint);
  objc_storeStrong((id *)&self->_searchCancelButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_destroyWeak((id *)&self->_createNewNoteButton);
  objc_destroyWeak((id *)&self->_createNewNoteToolbarBottomConstraint);
  objc_destroyWeak((id *)&self->_createNewNoteToolbarHeightConstraint);
  objc_destroyWeak((id *)&self->_createNewNoteToolbar);
  objc_destroyWeak((id *)&self->_searchBar);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
