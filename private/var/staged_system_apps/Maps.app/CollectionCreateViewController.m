@implementation CollectionCreateViewController

- (CollectionCreateViewController)initWithEditSession:(id)a3
{
  id v5;
  CollectionCreateViewController *v6;
  CollectionCreateViewController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CollectionHandler *collection;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CollectionCreateViewController;
  v6 = -[CollectionCreateViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_editSession, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v7, "cardPresentationController"));
    objc_msgSend(v8, "setPresentedModally:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v7, "cardPresentationController"));
    objc_msgSend(v9, "setTakesAvailableHeight:", 1);

    -[ContaineeViewController setPreferredPresentationStyle:](v7, "setPreferredPresentationStyle:", 6);
    v10 = objc_claimAutoreleasedReturnValue(+[CollectionHandler collection](CollectionHandler, "collection"));
    collection = v7->_collection;
    v7->_collection = (CollectionHandler *)v10;

    -[CollectionHandler addObserver:](v7->_collection, "addObserver:", v7);
  }

  return v7;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  BOOL v4;
  void *v5;
  objc_super v7;

  if ("createAction:" == a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler stagedTitle](self->_collection, "stagedTitle"));
    v4 = objc_msgSend(v5, "length") != 0;

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CollectionCreateViewController;
    return -[CollectionCreateViewController canPerformAction:withSender:](&v7, "canPerformAction:withSender:");
  }
  return v4;
}

- (id)keyCommands
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CollectionCreateViewController;
  v2 = -[ContaineeViewController keyCommands](&v9, "keyCommands");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Guide] Create"), CFSTR("localized string not found"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v5, 0, "createAction:", CFSTR("\r"), 0x100000, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObject:", v6));

  return v7;
}

- (id)preferredFocusEnvironments
{
  CollectionView *collectionView;

  collectionView = self->_collectionView;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &collectionView, 1));
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  ModalCardHeaderView *v6;
  void *v7;
  ModalCardHeaderView *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CollectionView *v20;
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
  CollectionEditSession *v31;
  uint64_t v32;
  CollectionEditSession *v33;
  CollectionEditSession *v34;
  MapsThemeTableView *v35;
  void *v36;
  MapsThemeTableView *tableView;
  MapsThemeTableView *v38;
  double v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  CollectionDataSource *v49;
  CollectionDataSource *dataSource;
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
  CollectionCreateViewController *v68;
  CollectionEditSession *v69;
  ModalCardHeaderView *v70;
  void *v71;
  CollectionView *v72;
  void *v73;
  objc_super v74;
  _QWORD v75[4];
  _QWORD v76[7];

  v74.receiver = self;
  v74.super_class = (Class)CollectionCreateViewController;
  -[ContaineeViewController viewDidLoad](&v74, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionCreateViewController view](self, "view"));
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("CollectionCreateView"));

  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("CollectionCreateContent"));
  v6 = [ModalCardHeaderView alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration](ModalCardHeaderConfiguration, "defaultModalCardHeaderConfiguration"));
  v8 = -[ModalCardHeaderView initWithConfiguration:](v6, "initWithConfiguration:", v7);

  -[ModalCardHeaderView setUseAdaptiveFont:](v8, "setUseAdaptiveFont:", 1);
  -[ModalCardHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[Guide] New guide"), CFSTR("localized string not found"), 0));
  -[ModalCardHeaderView setTitle:](v8, "setTitle:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingButton](v8, "leadingButton"));
  v12 = sub_1009A98D8();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v11, "setTitle:forState:", v13, 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingButton](v8, "leadingButton"));
  objc_msgSend(v14, "addTarget:action:forControlEvents:", self, "cancelAction:", 64);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](v8, "trailingButton"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("[Collection] Create"), CFSTR("localized string not found"), 0));
  objc_msgSend(v15, "setTitle:forState:", v17, 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](v8, "trailingButton"));
  objc_msgSend(v18, "addTarget:action:forControlEvents:", self, "createAction:", 64);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](v8, "trailingButton"));
  objc_msgSend(v19, "setEnabled:", 0);

  objc_msgSend(v3, "addSubview:", v8);
  v68 = self;
  objc_storeStrong((id *)&self->_modalHeaderView, v8);
  v20 = -[CollectionView initWithCollectionViewSize:]([CollectionView alloc], "initWithCollectionViewSize:", 1);
  -[CollectionView setTranslatesAutoresizingMaskIntoConstraints:](v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CollectionView setEditSession:](v20, "setEditSession:", self->_editSession);
  -[CollectionView setMaxContentSizeCategory:](v20, "setMaxContentSizeCategory:", UIContentSizeCategoryAccessibilityMedium);
  -[CollectionView setAllowAccessibilityTextWrapping:](v20, "setAllowAccessibilityTextWrapping:", 0);
  -[CollectionView setCollectionInfo:](v20, "setCollectionInfo:", self->_collection);
  -[CollectionView setEditing:](v20, "setEditing:", 1);
  objc_msgSend(v4, "addSubview:", v20);
  objc_storeStrong((id *)&self->_collectionView, v20);
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingAnchor](v8, "leadingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v65));
  v76[0] = v63;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView topAnchor](v8, "topAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v59));
  v76[1] = v57;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingAnchor](v8, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v55));
  v76[2] = v54;
  v70 = v8;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView bottomAnchor](v8, "bottomAnchor"));
  v71 = v3;
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
  v76[3] = v51;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView topAnchor](v20, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
  v76[4] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView leadingAnchor](v20, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
  v76[5] = v26;
  v72 = v20;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView trailingAnchor](v20, "trailingAnchor"));
  v73 = v4;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
  v76[6] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v76, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

  v31 = v68->_editSession;
  v32 = objc_opt_class(CollectionSaveSession);
  if ((objc_opt_isKindOfClass(v31, v32) & 1) != 0)
    v33 = v31;
  else
    v33 = 0;
  v34 = v33;

  if (v34)
  {
    v35 = -[MapsThemeTableView initWithFrame:style:]([MapsThemeTableView alloc], "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[MapsThemeTableView setTranslatesAutoresizingMaskIntoConstraints:](v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MapsThemeTableView setBackgroundColor:](v35, "setBackgroundColor:", v36);

    -[MapsThemeTableView setScrollEnabled:](v35, "setScrollEnabled:", 0);
    -[MapsThemeTableView setAccessibilityIdentifier:](v35, "setAccessibilityIdentifier:", CFSTR("CollectionCreateTable"));
    objc_msgSend(v73, "addSubview:", v35);
    tableView = v68->_tableView;
    v68->_tableView = v35;
    v38 = v35;

    v39 = 0.0;
    v40 = -[CollectionView _maps_addHairlineAtTopWithMargin:](v72, "_maps_addHairlineAtTopWithMargin:", 0.0);
    if (sub_1002A8AA0(v68) == 5)
      v39 = 16.0;
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView leadingAnchor](v38, "leadingAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "leadingAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v64, v39));
    v75[0] = v62;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView topAnchor](v38, "topAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView bottomAnchor](v72, "bottomAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:constant:", v58, 10.0));
    v75[1] = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView trailingAnchor](v38, "trailingAnchor"));
    v69 = v34;
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "trailingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, -v39));
    v75[2] = v44;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView bottomAnchor](v38, "bottomAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "bottomAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v46));
    v75[3] = v47;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v75, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v48);

    v34 = v69;
    v49 = -[CollectionDataSource initWithTableView:collectionEditSession:]([CollectionDataSource alloc], "initWithTableView:collectionEditSession:", v68->_tableView, v69);
    dataSource = v68->_dataSource;
    v68->_dataSource = v49;

    -[CollectionDataSource setShowsHeader:](v68->_dataSource, "setShowsHeader:", 1);
    -[DataSource setDelegate:](v68->_dataSource, "setDelegate:", v68);
    -[MapsThemeTableView setDelegate:](v38, "setDelegate:", v68->_dataSource);
    -[MapsThemeTableView setDataSource:](v38, "setDataSource:", v68->_dataSource);
    -[CollectionDataSource setActive:](v68->_dataSource, "setActive:", 1);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CollectionCreateViewController;
  -[CollectionCreateViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[CollectionView becomeFirstResponder](self->_collectionView, "becomeFirstResponder");
}

- (void)createAction:(id)a3
{
  id v4;
  CollectionEditSession *editSession;
  CollectionHandler *collection;
  id *v7;
  id *v8;
  uint64_t target;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  editSession = self->_editSession;
  collection = self->_collection;
  if (editSession)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10035B5E0;
    v13[3] = &unk_1011B2260;
    v7 = &v15;
    objc_copyWeak(&v15, &location);
    v14 = v4;
    -[CollectionEditSession applyToCollection:completion:](editSession, "applyToCollection:completion:", collection, v13);
    v8 = &v14;
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10035B61C;
    v10[3] = &unk_1011B2260;
    v7 = &v12;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    -[CollectionHandler createCollection:](collection, "createCollection:", v10);
    v8 = &v11;
  }

  objc_destroyWeak(v7);
  target = self->_target;
  if ((_DWORD)target)
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2072, target, 0);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2072, 0, 0);
  objc_destroyWeak(&location);

}

- (void)collectionHandlerInfoUpdated:(id)a3
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stagedTitle"));
  v4 = objc_msgSend(v6, "length") != 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](self->_modalHeaderView, "trailingButton"));
  objc_msgSend(v5, "setEnabled:", v4);

}

- (void)dataSourceUpdated:(id)a3
{
  -[MapsThemeTableView reloadData](self->_tableView, "reloadData", a3);
}

- (int)target
{
  return self->_target;
}

- (void)setTarget:(int)a3
{
  self->_target = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_editSession, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_modalHeaderView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
