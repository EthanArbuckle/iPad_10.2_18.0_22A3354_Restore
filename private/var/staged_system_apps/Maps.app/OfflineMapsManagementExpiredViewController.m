@implementation OfflineMapsManagementExpiredViewController

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OfflineMapsManagementExpiredViewController;
  -[ContaineeViewController viewDidLoad](&v3, "viewDidLoad");
  -[OfflineMapsManagementExpiredViewController _setupViews](self, "_setupViews");
  -[OfflineMapsManagementExpiredViewController _setupConstraints](self, "_setupConstraints");
}

- (void)viewWillAppear:(BOOL)a3
{
  OfflineMapsManagementExpiredDataSource *v4;
  void *v5;
  OfflineMapsManagementExpiredDataSource *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OfflineMapsManagementExpiredViewController;
  -[ContaineeViewController viewWillAppear:](&v10, "viewWillAppear:", a3);
  v4 = [OfflineMapsManagementExpiredDataSource alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  v6 = -[OfflineMapsManagementExpiredDataSource initWithCollectionView:updateLocation:](v4, "initWithCollectionView:updateLocation:", v5, 0);
  -[OfflineMapsManagementExpiredViewController setOfflineMapsDataSource:](self, "setOfflineMapsDataSource:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController offlineMapsDataSource](self, "offlineMapsDataSource"));
  objc_msgSend(v7, "setDelegate:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController offlineMapsDataSource](self, "offlineMapsDataSource"));
  objc_msgSend(v8, "setOfflineDelegate:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController offlineMapsDataSource](self, "offlineMapsDataSource"));
  objc_msgSend(v9, "setActive:", 1);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OfflineMapsManagementExpiredViewController;
  -[ContaineeViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController offlineMapsDataSource](self, "offlineMapsDataSource"));
  objc_msgSend(v4, "setActive:", 0);

}

- (void)_setupViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void **v67;
  uint64_t v68;
  id (*v69)(uint64_t, uint64_t, void *);
  void *v70;
  id v71;
  id location;
  _QWORD v73[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "setPresentedModally:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "setTakesAvailableHeight:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController view](self, "view"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = objc_alloc((Class)UIBarButtonItem);
  v8 = sub_1009A992C();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v7, "initWithTitle:style:target:action:", v9, 2, self, "_dismiss");
  -[OfflineMapsManagementExpiredViewController setDoneButtonItem:](self, "setDoneButtonItem:", v10);

  v11 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 2, self, "_toggleEditing");
  -[OfflineMapsManagementExpiredViewController setEditButtonItem:](self, "setEditButtonItem:", v11);

  v12 = objc_alloc((Class)UIBarButtonItem);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Select All"), CFSTR("localized string not found"), CFSTR("Offline")));
  v15 = objc_msgSend(v12, "initWithTitle:style:target:action:", v14, 0, self, "_toggleSelectAll");
  -[OfflineMapsManagementExpiredViewController setSelectAllButtonItem:](self, "setSelectAllButtonItem:", v15);

  v16 = objc_alloc((Class)UIBarButtonItem);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Deselect All"), CFSTR("localized string not found"), CFSTR("Offline")));
  v19 = objc_msgSend(v16, "initWithTitle:style:target:action:", v18, 0, self, "_toggleSelectAll");
  -[OfflineMapsManagementExpiredViewController setDeselectAllButtonItem:](self, "setDeselectAllButtonItem:", v19);

  v20 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_toggleEditing");
  -[OfflineMapsManagementExpiredViewController setCancelButtonItem:](self, "setCancelButtonItem:", v20);

  v21 = objc_alloc((Class)UINavigationItem);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("EXPIRED_MAPS_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));
  v24 = objc_msgSend(v21, "initWithTitle:", v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController doneButtonItem](self, "doneButtonItem"));
  objc_msgSend(v24, "setRightBarButtonItem:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController editButtonItem](self, "editButtonItem"));
  objc_msgSend(v24, "setLeftBarButtonItem:", v26);

  v27 = objc_alloc_init((Class)UINavigationBar);
  -[OfflineMapsManagementExpiredViewController setNavBar:](self, "setNavBar:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController navBar](self, "navBar"));
  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v29 = objc_alloc_init((Class)UINavigationBarAppearance);
  objc_msgSend(v29, "configureWithTransparentBackground");
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController navBar](self, "navBar"));
  objc_msgSend(v30, "setStandardAppearance:", v29);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController navBar](self, "navBar"));
  objc_msgSend(v31, "pushNavigationItem:animated:", v24, 0);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController navBar](self, "navBar"));
  objc_msgSend(v32, "addSubview:", v33);

  objc_initWeak(&location, self);
  v34 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v67 = _NSConcreteStackBlock;
  v68 = 3221225472;
  v69 = sub_100A723D0;
  v70 = &unk_1011B5F50;
  objc_copyWeak(&v71, &location);
  v35 = objc_msgSend(v34, "initWithSectionProvider:", &v67);
  v36 = objc_alloc((Class)UICollectionView);
  v37 = objc_msgSend(v36, "initWithFrame:collectionViewLayout:", v35, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, v67, v68, v69, v70);
  -[OfflineMapsManagementExpiredViewController setCollectionView:](self, "setCollectionView:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  objc_msgSend(v40, "setBackgroundColor:", v39);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  objc_msgSend(v41, "setAllowsSelection:", 1);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  objc_msgSend(v42, "setAllowsSelectionDuringEditing:", 1);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  objc_msgSend(v43, "setAllowsMultipleSelectionDuringEditing:", 1);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  objc_msgSend(v44, "addSubview:", v45);

  v46 = objc_alloc((Class)UIBarButtonItem);
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("Clear"), CFSTR("localized string not found"), CFSTR("Offline")));
  v49 = objc_msgSend(v46, "initWithTitle:style:target:action:", v48, 0, self, "_clearSelectedMaps");
  -[OfflineMapsManagementExpiredViewController setClearButtonItem:](self, "setClearButtonItem:", v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController clearButtonItem](self, "clearButtonItem"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  objc_msgSend(v50, "setTintColor:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController clearButtonItem](self, "clearButtonItem"));
  objc_msgSend(v52, "setEnabled:", 0);

  v53 = objc_alloc((Class)UIBarButtonItem);
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("Restore"), CFSTR("localized string not found"), CFSTR("Offline")));
  v56 = objc_msgSend(v53, "initWithTitle:style:target:action:", v55, 0, self, "_restoreSelectedMaps");
  -[OfflineMapsManagementExpiredViewController setRestoreButtonItem:](self, "setRestoreButtonItem:", v56);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController restoreButtonItem](self, "restoreButtonItem"));
  objc_msgSend(v57, "setEnabled:", 0);

  v58 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v59 = objc_alloc_init((Class)UIToolbar);
  -[OfflineMapsManagementExpiredViewController setToolbar:](self, "setToolbar:", v59);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController toolbar](self, "toolbar"));
  objc_msgSend(v60, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController toolbar](self, "toolbar"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController clearButtonItem](self, "clearButtonItem"));
  v73[0] = v62;
  v73[1] = v58;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController restoreButtonItem](self, "restoreButtonItem"));
  v73[2] = v63;
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v73, 3));
  objc_msgSend(v61, "setItems:", v64);

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController toolbar](self, "toolbar"));
  objc_msgSend(v65, "addSubview:", v66);

  -[OfflineMapsManagementExpiredViewController setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("OfflineMapsExpiredView"));
  objc_destroyWeak(&v71);
  objc_destroyWeak(&location);

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *toolbarHiddenConstraint;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *toolbarVisibleConstraint;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSLayoutConstraint *v25;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
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
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[11];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController toolbar](self, "toolbar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  toolbarHiddenConstraint = self->_toolbarHiddenConstraint;
  self->_toolbarHiddenConstraint = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController toolbar](self, "toolbar"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeAreaLayoutGuide"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
  v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v13));
  toolbarVisibleConstraint = self->_toolbarVisibleConstraint;
  self->_toolbarVisibleConstraint = v14;

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController navBar](self, "navBar"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "topAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "topAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v64));
  v68[0] = v63;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController navBar](self, "navBar"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "leadingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "leadingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v59));
  v68[1] = v58;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController navBar](self, "navBar"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "trailingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "trailingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v54));
  v68[2] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController navBar](self, "navBar"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "bottomAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "bottomAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v68[3] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "topAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "topAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
  v68[4] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
  v68[5] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v68[6] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v68[7] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController toolbar](self, "toolbar"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  v68[8] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController toolbar](self, "toolbar"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
  v25 = self->_toolbarHiddenConstraint;
  v68[9] = v24;
  v68[10] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 11));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

}

- (void)_dismiss
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController delegate](self, "delegate"));
  objc_msgSend(v2, "closeExpiredMapsManagement");

}

- (void)_toggleEditing
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double Height;
  double top;
  double left;
  double right;
  void *v23;
  void *v24;
  _QWORD v25[5];
  char v26;
  CGRect v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  v4 = objc_msgSend(v3, "isEditing") ^ 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  objc_msgSend(v5, "setEditing:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  v7 = objc_msgSend(v6, "isEditing");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController selectAllButtonItem](self, "selectAllButtonItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController navBar](self, "navBar"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topItem"));
    objc_msgSend(v10, "setRightBarButtonItem:", v8);

    v11 = objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController cancelButtonItem](self, "cancelButtonItem"));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController doneButtonItem](self, "doneButtonItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController navBar](self, "navBar"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topItem"));
    objc_msgSend(v14, "setRightBarButtonItem:", v12);

    v11 = objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController editButtonItem](self, "editButtonItem"));
  }
  v15 = (void *)v11;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController navBar](self, "navBar"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topItem"));
  objc_msgSend(v17, "setLeftBarButtonItem:", v15);

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100A72E74;
  v25[3] = &unk_1011ACE58;
  v26 = v7 ^ 1;
  v25[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v25, UINavigationControllerHideShowBarDuration);
  if ((v7 & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController toolbar](self, "toolbar"));
    objc_msgSend(v18, "frame");
    Height = CGRectGetHeight(v27);

    top = 0.0;
    left = 0.0;
    right = 0.0;
  }
  else
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    Height = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  objc_msgSend(v23, "setContentInset:", top, left, Height, right);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  objc_msgSend(v24, "setVerticalScrollIndicatorInsets:", top, left, Height, right);

}

- (void)_toggleSelectAll
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  v4 = (uint64_t)objc_msgSend(v3, "numberOfItemsInSection:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathsForSelectedItems"));
  v7 = objc_msgSend(v6, "count");

  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", i, 0));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
      v11 = v10;
      if (v7 == (id)v4)
        objc_msgSend(v10, "deselectItemAtIndexPath:animated:", v9, 0);
      else
        objc_msgSend(v10, "selectItemAtIndexPath:animated:scrollPosition:", v9, 0, 0);

    }
  }
  -[OfflineMapsManagementExpiredViewController _updateSelectAllButton](self, "_updateSelectAllButton");
  -[OfflineMapsManagementExpiredViewController _updateRestoreButton](self, "_updateRestoreButton");
  -[OfflineMapsManagementExpiredViewController _updateClearButton](self, "_updateClearButton");
}

- (void)_updateSelectAllButton
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  v4 = objc_msgSend(v3, "numberOfItemsInSection:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathsForSelectedItems"));
  v7 = objc_msgSend(v6, "count");

  if (v7 == v4)
    v8 = objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController deselectAllButtonItem](self, "deselectAllButtonItem"));
  else
    v8 = objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController selectAllButtonItem](self, "selectAllButtonItem"));
  v11 = (id)v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController navBar](self, "navBar"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topItem"));
  objc_msgSend(v10, "setRightBarButtonItem:", v11);

}

- (void)_updateRestoreButton
{
  id v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController offlineMapsDataSource](self, "offlineMapsDataSource"));
  v3 = objc_msgSend(v5, "canRestoreSelectedMaps");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController restoreButtonItem](self, "restoreButtonItem"));
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)_updateClearButton
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathsForSelectedItems"));
  v4 = objc_msgSend(v3, "count") != 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController clearButtonItem](self, "clearButtonItem"));
  objc_msgSend(v5, "setEnabled:", v4);

}

- (void)_clearSelectedMaps
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController offlineMapsDataSource](self, "offlineMapsDataSource"));
  objc_msgSend(v2, "clearSelectedMaps");

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 389, 87, 0);
}

- (void)_restoreSelectedMaps
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController offlineMapsDataSource](self, "offlineMapsDataSource"));
  objc_msgSend(v2, "restoreSelectedMaps");

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 388, 87, 0);
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  -[OfflineMapsManagementExpiredViewController _updateSelectAllButton](self, "_updateSelectAllButton", a3, a4);
  -[OfflineMapsManagementExpiredViewController _updateRestoreButton](self, "_updateRestoreButton");
  -[OfflineMapsManagementExpiredViewController _updateClearButton](self, "_updateClearButton");
}

- (void)didSelectRestoreExpiredSubscriptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController delegate](self, "delegate"));
  objc_msgSend(v8, "restoreExpiredSubscriptions:completionHandler:", v7, v6);

}

- (void)dismissExpiredViewControllerIfNecessary
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredViewController collectionView](self, "collectionView"));
  v4 = objc_msgSend(v3, "numberOfItemsInSection:", 0);

  if (!v4)
    -[OfflineMapsManagementExpiredViewController _dismiss](self, "_dismiss");
}

- (OfflineMapsManagementActionCoordination)delegate
{
  return (OfflineMapsManagementActionCoordination *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UINavigationBar)navBar
{
  return self->_navBar;
}

- (void)setNavBar:(id)a3
{
  objc_storeStrong((id *)&self->_navBar, a3);
}

- (UIBarButtonItem)doneButtonItem
{
  return self->_doneButtonItem;
}

- (void)setDoneButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_doneButtonItem, a3);
}

- (UIBarButtonItem)editButtonItem
{
  return self->_editButtonItem;
}

- (void)setEditButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_editButtonItem, a3);
}

- (UIBarButtonItem)selectAllButtonItem
{
  return self->_selectAllButtonItem;
}

- (void)setSelectAllButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_selectAllButtonItem, a3);
}

- (UIBarButtonItem)deselectAllButtonItem
{
  return self->_deselectAllButtonItem;
}

- (void)setDeselectAllButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_deselectAllButtonItem, a3);
}

- (UIBarButtonItem)cancelButtonItem
{
  return self->_cancelButtonItem;
}

- (void)setCancelButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButtonItem, a3);
}

- (UIBarButtonItem)restoreButtonItem
{
  return self->_restoreButtonItem;
}

- (void)setRestoreButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_restoreButtonItem, a3);
}

- (UIBarButtonItem)clearButtonItem
{
  return self->_clearButtonItem;
}

- (void)setClearButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_clearButtonItem, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (OfflineMapsManagementExpiredDataSource)offlineMapsDataSource
{
  return self->_offlineMapsDataSource;
}

- (void)setOfflineMapsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_offlineMapsDataSource, a3);
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
  objc_storeStrong((id *)&self->_toolbar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_offlineMapsDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_clearButtonItem, 0);
  objc_storeStrong((id *)&self->_restoreButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
  objc_storeStrong((id *)&self->_deselectAllButtonItem, 0);
  objc_storeStrong((id *)&self->_selectAllButtonItem, 0);
  objc_storeStrong((id *)&self->_editButtonItem, 0);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_toolbarVisibleConstraint, 0);
  objc_storeStrong((id *)&self->_toolbarHiddenConstraint, 0);
}

@end
