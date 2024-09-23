@implementation MyShortcutsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MyShortcutsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  MyShortcutsViewController *v4;
  MyShortcutsViewController *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MyShortcutsViewController;
  v4 = -[MyShortcutsViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v4, "cardPresentationController"));
    objc_msgSend(v6, "setPresentedModally:", 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v7, "setTakesAvailableHeight:", 1);

  }
  return v5;
}

- (UIBarButtonItem)titleLabelButton
{
  UIBarButtonItem *titleLabelButton;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *v6;

  titleLabelButton = self->_titleLabelButton;
  if (!titleLabelButton)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController pinnedTitle](self, "pinnedTitle"));
    v5 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(+[LibraryUIUtilities iOSNavbarTitleButtonItemWithTitle:](_TtC4Maps18LibraryUIUtilities, "iOSNavbarTitleButtonItemWithTitle:", v4));
    v6 = self->_titleLabelButton;
    self->_titleLabelButton = v5;

    titleLabelButton = self->_titleLabelButton;
  }
  return titleLabelButton;
}

- (UIBarButtonItem)dismissButton
{
  UIBarButtonItem *dismissButton;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  dismissButton = self->_dismissButton;
  if (!dismissButton)
  {
    v4 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(+[LibraryUIUtilities closeButtonItemWithTarget:action:](_TtC4Maps18LibraryUIUtilities, "closeButtonItemWithTarget:action:", self, "_dismissButtonTapped"));
    v5 = self->_dismissButton;
    self->_dismissButton = v4;

    dismissButton = self->_dismissButton;
  }
  return dismissButton;
}

- (UIBarButtonItem)doneEditingBarButtonItem
{
  UIBarButtonItem *doneEditingBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  doneEditingBarButtonItem = self->_doneEditingBarButtonItem;
  if (!doneEditingBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_doneEditingButtonTapped");
    v5 = self->_doneEditingBarButtonItem;
    self->_doneEditingBarButtonItem = v4;

    doneEditingBarButtonItem = self->_doneEditingBarButtonItem;
  }
  -[UIBarButtonItem setAccessibilityIdentifier:](doneEditingBarButtonItem, "setAccessibilityIdentifier:", CFSTR("DoneEditingBarButton"));
  return self->_doneEditingBarButtonItem;
}

- (UIBarButtonItem)editBarButtonItem
{
  UIBarButtonItem *editBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  editBarButtonItem = self->_editBarButtonItem;
  if (!editBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(+[LibraryUIUtilities editBarButtonItemWithTarget:action:](_TtC4Maps18LibraryUIUtilities, "editBarButtonItemWithTarget:action:", self, "_editButtonTapped"));
    v5 = self->_editBarButtonItem;
    self->_editBarButtonItem = v4;

    editBarButtonItem = self->_editBarButtonItem;
  }
  return editBarButtonItem;
}

- (UIBarButtonItem)addBarButtonItem
{
  UIBarButtonItem *addBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  addBarButtonItem = self->_addBarButtonItem;
  if (!addBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(+[LibraryUIUtilities addBarButtonItemWithTarget:action:](_TtC4Maps18LibraryUIUtilities, "addBarButtonItemWithTarget:action:", self, "_addButtonTapped"));
    v5 = self->_addBarButtonItem;
    self->_addBarButtonItem = v4;

    addBarButtonItem = self->_addBarButtonItem;
  }
  return addBarButtonItem;
}

- (id)pinnedTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Library] Pinned"), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)keyCommands
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MyShortcutsViewController;
  v3 = -[ContaineeViewController keyCommands](&v16, "keyCommands");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController presentedViewController](self, "presentedViewController"));
  if (!v6)
  {
    v7 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    if (v7)
      v10 = CFSTR("[Shortcuts] Add");
    else
      v10 = CFSTR("[Shortcuts] Add Favorite");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v11, 0, "_addShortcutAction", CFSTR("a"), 0x100000, 0));
    objc_msgSend(v5, "addObject:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource keyCommands](self->_myShortcutsDataSource, "keyCommands"));
    objc_msgSend(v5, "addObjectsFromArray:", v13);

  }
  v14 = objc_msgSend(v5, "copy");

  return v14;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  MyShortcutsDataSource *v9;
  id v10;
  MyShortcutsDataSource *v11;
  objc_super v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource keyCommands](self->_myShortcutsDataSource, "keyCommands"));
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (v8)
  {
    v9 = self->_myShortcutsDataSource;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MyShortcutsViewController;
    v10 = -[MyShortcutsViewController targetForAction:withSender:](&v13, "targetForAction:withSender:", a3, v6);
    v9 = (MyShortcutsDataSource *)objc_claimAutoreleasedReturnValue(v10);
  }
  v11 = v9;

  return v11;
}

- (id)preferredFocusEnvironments
{
  MapsThemeTableView *tableView;

  tableView = self->_tableView;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &tableView, 1));
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MapsThemeTableView *v10;
  double y;
  double width;
  double height;
  MapsThemeTableView *v14;
  void *v15;
  ContainerHeaderView *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  ContainerHeaderView *v24;
  void *v25;
  void *v26;
  ContainerHeaderView *titleHeaderView;
  UIView *v28;
  UIView *hideableFooterView;
  ShortcutFooterToolBarView *v30;
  ShortcutFooterToolBarView *footerContentView;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
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
  uint64_t v62;
  unsigned int v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  MapsThemeTableView *v111;
  objc_super v112;
  _QWORD v113[4];
  _QWORD v114[11];
  _QWORD v115[4];

  v112.receiver = self;
  v112.super_class = (Class)MyShortcutsViewController;
  -[ContaineeViewController viewDidLoad](&v112, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController view](self, "view"));
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("MyShortcutsView"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("MyShortcutsHeader"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("MyShortcutsContent"));

  v10 = [MapsThemeTableView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v14 = -[MapsThemeTableView initWithFrame:style:](v10, "initWithFrame:style:", 2, CGRectZero.origin.x, y, width, height);
  -[MapsThemeTableView setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[MapsThemeTableView setBackgroundColor:](v14, "setBackgroundColor:", v15);

  -[MapsThemeTableView _setHeaderAndFooterViewsFloat:](v14, "_setHeaderAndFooterViewsFloat:", 0);
  -[MapsThemeTableView setPreservesSuperviewLayoutMargins:](v14, "setPreservesSuperviewLayoutMargins:", 1);
  -[MapsThemeTableView setAccessibilityIdentifier:](v14, "setAccessibilityIdentifier:", CFSTR("MyShortcutsTable"));
  objc_msgSend(v7, "addSubview:", v14);
  v111 = v14;
  objc_storeStrong((id *)&self->_tableView, v14);
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v16 = (ContainerHeaderView *)objc_msgSend(objc_alloc((Class)UINavigationItem), "initWithTitle:", &stru_1011EB268);
    -[MyShortcutsViewController setCustomNavItem:](self, "setCustomNavItem:", v16);
    -[MyShortcutsViewController _configureNavItemsForEditMode:](self, "_configureNavItemsForEditMode:", 0);
    v17 = objc_alloc_init((Class)UINavigationBar);
    -[MyShortcutsViewController setNavBar:](self, "setNavBar:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController navBar](self, "navBar"));
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController navBar](self, "navBar"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "standardAppearance"));
    objc_msgSend(v20, "configureWithTransparentBackground");

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController navBar](self, "navBar"));
    objc_msgSend(v21, "pushNavigationItem:animated:", v16, 0);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController navBar](self, "navBar"));
    objc_msgSend(v22, "addSubview:", v23);

  }
  else
  {
    v24 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[ContainerHeaderView setAccessibilityIdentifier:](v24, "setAccessibilityIdentifier:", CFSTR("PinsHeader"));
    -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ContainerHeaderView setDelegate:](v24, "setDelegate:", self);
    -[ContainerHeaderView setHeaderSize:](v24, "setHeaderSize:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("[Shortcuts] Favorites"), CFSTR("localized string not found"), 0));
    -[ContainerHeaderView setTitle:](v24, "setTitle:", v26);

    objc_msgSend(v6, "addSubview:", v24);
    titleHeaderView = self->_titleHeaderView;
    self->_titleHeaderView = v24;
    v16 = v24;

    v28 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    hideableFooterView = self->_hideableFooterView;
    self->_hideableFooterView = v28;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_hideableFooterView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAccessibilityIdentifier:](self->_hideableFooterView, "setAccessibilityIdentifier:", CFSTR("MyShortcutsHideableFooter"));
    objc_msgSend(v7, "addSubview:", self->_hideableFooterView);
    v30 = -[FooterToolBarView initWithFrame:]([ShortcutFooterToolBarView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    footerContentView = self->_footerContentView;
    self->_footerContentView = v30;

    -[ShortcutFooterToolBarView setTranslatesAutoresizingMaskIntoConstraints:](self->_footerContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[FooterToolBarView setDelegate:](self->_footerContentView, "setDelegate:", self);
    -[UIView addSubview:](self->_hideableFooterView, "addSubview:", self->_footerContentView);
    -[FooterToolBarView setState:](self->_footerContentView, "setState:", 7);
  }

  v110 = v7;
  v107 = v6;
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController navBar](self, "navBar"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "topAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
    +[LibraryUIUtilities NavBarChromeHeaderTopYOffset](_TtC4Maps18LibraryUIUtilities, "NavBarChromeHeaderTopYOffset");
    v96 = v32;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33));
    v115[0] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController navBar](self, "navBar"));
    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingAnchor"));
    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
    v108 = (void *)v36;
    v38 = (void *)v36;
    v39 = (void *)v37;
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
    v115[1] = v105;
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController navBar](self, "navBar"));
    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "trailingAnchor"));
    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v101 = (void *)v40;
    v42 = (void *)v40;
    v43 = (void *)v41;
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
    v115[2] = v99;
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController navBar](self, "navBar"));
    v44 = v6;
    v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "bottomAnchor"));
    v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bottomAnchor"));
    v97 = (void *)v45;
    v47 = (void *)v45;
    v48 = (void *)v46;
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
    v115[3] = v95;
    v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v115, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:");
  }
  else
  {
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_hideableFooterView, "leadingAnchor"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
    v93 = objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:", v96));
    v114[0] = v93;
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_hideableFooterView, "trailingAnchor"));
    v91 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:", v91));
    v114[1] = v108;
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_hideableFooterView, "bottomAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:"));
    v114[2] = v103;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_titleHeaderView, "topAnchor"));
    v88 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
    v101 = v49;
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v88));
    v114[3] = v99;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_titleHeaderView, "leadingAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
    v98 = v50;
    v84 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v97));
    v114[4] = v84;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_titleHeaderView, "trailingAnchor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v95 = v51;
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v94));
    v114[5] = v89;
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_titleHeaderView, "bottomAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v86));
    v114[6] = v85;
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_hideableFooterView, "topAnchor"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutFooterToolBarView topAnchor](self->_footerContentView, "topAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v82));
    v114[7] = v81;
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_hideableFooterView, "bottomAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutFooterToolBarView bottomAnchor](self->_footerContentView, "bottomAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:", v52));
    v114[8] = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_hideableFooterView, "leadingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutFooterToolBarView leadingAnchor](self->_footerContentView, "leadingAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v55));
    v114[9] = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_hideableFooterView, "trailingAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutFooterToolBarView trailingAnchor](self->_footerContentView, "trailingAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v58));
    v114[10] = v59;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v114, 11));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v60);

    v7 = v110;
    v43 = (void *)v88;

    v35 = (void *)v91;
    v48 = (void *)v84;

    v39 = v90;
    v33 = (void *)v93;

    v34 = v92;
  }

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView topAnchor](v111, "topAnchor"));
  v109 = v61;
  v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v106 = (void *)v62;
  v63 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v64 = 0.0;
  if (v63)
    v64 = 8.0;
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:constant:", v62, v64));
  v113[0] = v104;
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView leadingAnchor](v111, "leadingAnchor"));
  v65 = v7;
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:", v66));
  v113[1] = v67;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView trailingAnchor](v111, "trailingAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "trailingAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v69));
  v113[2] = v70;
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView bottomAnchor](v111, "bottomAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "bottomAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v72));
  v113[3] = v73;
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v113, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v74);

  -[MyShortcutsViewController _updateHeaderHairlineAnimated:](self, "_updateHeaderHairlineAnimated:", 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[LibraryItemsCountManager sharedManager](_TtC4Maps24LibraryItemsCountManager, "sharedManager"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "lastFetchedCounts"));
  v77 = objc_msgSend(v76, "pinnedPlacesCount");

  v78 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), v77));
  objc_msgSend(v78, "captureUserAction:onTarget:eventValue:", 21, 254, v79);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MyShortcutsViewController;
  -[ContaineeViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MyShortcutsViewController loadDataSource](self, "loadDataSource");
}

- (void)willBecomeCurrent:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MyShortcutsViewController;
  -[ContaineeViewController willBecomeCurrent:](&v5, "willBecomeCurrent:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController view](self, "view"));

  if (v4)
    -[MyShortcutsDataSource reloadData](self->_myShortcutsDataSource, "reloadData");
}

- (void)willResignCurrent:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MyShortcutsViewController;
  -[ContaineeViewController willResignCurrent:](&v4, "willResignCurrent:", a3);
  -[MyShortcutsDataSource setEditing:](self->_myShortcutsDataSource, "setEditing:", 0);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MyShortcutsViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[MyShortcutsViewController _updateFooterInset](self, "_updateFooterInset");
}

- (void)didChangeLayout:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MyShortcutsViewController;
  -[ContaineeViewController didChangeLayout:](&v4, "didChangeLayout:", a3);
  -[MyShortcutsViewController _updateFooterInset](self, "_updateFooterInset");
}

- (void)_updateFooterInset
{
  CGRect v3;

  -[UIView frame](self->_hideableFooterView, "frame");
  -[MapsThemeTableView setContentInset:](self->_tableView, "setContentInset:", 0.0, 0.0, CGRectGetHeight(v3) + 16.0, 0.0);
  -[MapsThemeTableView contentInset](self->_tableView, "contentInset");
  -[MapsThemeTableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:");
}

- (void)_updateHeaderHairlineAnimated:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = a3;
  v5 = -[MapsThemeTableView _maps_shouldShowTopHairline](self->_tableView, "_maps_shouldShowTopHairline");
  v6[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10033B4F0;
  v7[3] = &unk_1011B22D8;
  v7[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10033B504;
  v6[3] = &unk_1011B2300;
  +[UIScrollView _maps_updateTopHairlineAlpha:animated:getter:setter:](UIScrollView, "_maps_updateTopHairlineAlpha:animated:getter:setter:", v3, v7, v6, (double)v5);
}

- (void)loadDataSource
{
  MyShortcutsDataSource *v3;
  MyShortcutsDataSource *myShortcutsDataSource;
  void *v5;
  void *v6;

  v3 = -[MyShortcutsDataSource initWithTableView:updateLocation:]([MyShortcutsDataSource alloc], "initWithTableView:updateLocation:", self->_tableView, 0);
  myShortcutsDataSource = self->_myShortcutsDataSource;
  self->_myShortcutsDataSource = v3;

  -[DataSource setDelegate:](self->_myShortcutsDataSource, "setDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appCoordinator"));
  -[MyShortcutsDataSource setShareDelegate:](self->_myShortcutsDataSource, "setShareDelegate:", v6);

  -[MapsThemeTableView setDelegate:](self->_tableView, "setDelegate:", self->_myShortcutsDataSource);
  -[MapsThemeTableView setDataSource:](self->_tableView, "setDataSource:", self->_myShortcutsDataSource);
  -[DataSource setActive:](self->_myShortcutsDataSource, "setActive:", 1);
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MyShortcutsViewController;
  -[ContaineeViewController scrollViewDidScroll:](&v4, "scrollViewDidScroll:", a3);
  -[MyShortcutsViewController _updateHeaderHairlineAnimated:](self, "_updateHeaderHairlineAnimated:", 1);
}

- (void)dataSourceUpdated:(id)a3
{
  if (self->_myShortcutsDataSource == a3)
  {
    -[MapsThemeTableView reloadData](self->_tableView, "reloadData");
    -[MyShortcutsViewController _updateHeaderHairlineAnimated:](self, "_updateHeaderHairlineAnimated:", 0);
  }
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v5 = a4;
  v6 = objc_opt_class(ShortcutEditSession);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shortcut"));
    v9 = objc_msgSend(v8, "type");

    if (v9 == (id)6)
    {
      objc_msgSend(v7, "setMoveToPreferredIndexInFavorites:", 1);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10033B95C;
      v22[3] = &unk_1011AE8F8;
      v23 = v7;
      objc_msgSend(v23, "saveWithCompletion:", v22);

LABEL_15:
      goto LABEL_16;
    }
    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled")
      && (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shortcut")),
          v16 = objc_msgSend(v15, "isSetupPlaceholder"),
          v15,
          v16))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      objc_msgSend(v12, "viewController:showAddShortcut:", self, v7);
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      objc_msgSend(v12, "viewController:editShortcut:", self, v7);
    }
LABEL_14:

    goto LABEL_15;
  }
  v10 = objc_opt_class(MapsSuggestionsShortcut);
  if ((objc_opt_isKindOfClass(v5, v10) & 1) != 0)
  {
    v11 = MapsSuggestionsEntryFromShortcut(v5, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &off_10126CC40, CFSTR("DirectionsSessionInitiatorKey"));
    if (objc_msgSend(v7, "isShortcut"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shortcutIdentifier"));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("ShortcutIdentifier"));

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v14, "viewController:openMapsSuggestionEntry:withUserInfo:", self, v7, v12);

    goto LABEL_14;
  }
  v17 = objc_opt_class(_TtC4Maps16MapsFavoriteItem);
  if ((objc_opt_isKindOfClass(v5, v17) & 1) != 0)
  {
    v18 = v5;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", &off_10126CC40, CFSTR("DirectionsSessionInitiatorKey"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "shortcutIdentifier"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("ShortcutIdentifier"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v21, "viewController:openFavoriteItem:withUserInfo:", self, v18, v19);

    -[MyShortcutsViewController _captureTapActionForFavoriteItem:](self, "_captureTapActionForFavoriteItem:", v18);
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 478, 254, 0);
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2007, 0, 0);

  }
LABEL_16:

}

- (void)_captureTapActionForFavoriteItem:(id)a3
{
  unsigned __int8 v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v3 = objc_msgSend(v7, "isShortcutForSetup");
  v4 = v7;
  if ((v3 & 1) == 0)
  {
    v5 = objc_msgSend(v7, "type");
    if (v5 == (id)2)
    {
      v6 = 2046;
      goto LABEL_6;
    }
    v4 = v7;
    if (v5 == (id)3)
    {
      v6 = 2047;
LABEL_6:
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v6, 254, 0);
      v4 = v7;
    }
  }

}

- (void)view:(id)a3 requestsShortcutAction:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  switch(a4)
  {
    case 2uLL:
      v7 = v6;
      -[MyShortcutsViewController _addShortcutAction](self, "_addShortcutAction");
      goto LABEL_7;
    case 1uLL:
      v7 = v6;
      -[MyShortcutsDataSource setEditing:](self->_myShortcutsDataSource, "setEditing:", 0);
      -[FooterToolBarView setState:](self->_footerContentView, "setState:", 7);
      goto LABEL_7;
    case 0uLL:
      v7 = v6;
      -[MyShortcutsDataSource setEditing:](self->_myShortcutsDataSource, "setEditing:", 1);
      -[FooterToolBarView setState:](self->_footerContentView, "setState:", 8);
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2058, 254, 0);
LABEL_7:
      v6 = v7;
      break;
  }

}

- (void)_addShortcutAction
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession addSession](ShortcutEditSession, "addSession"));
  objc_msgSend(v3, "viewController:showAddShortcut:", self, v4);

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2044, 254, 0);
}

- (void)_dismissButtonTapped
{
  -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", self);
}

- (void)_editButtonTapped
{
  -[MyShortcutsDataSource setEditing:](self->_myShortcutsDataSource, "setEditing:", 1);
  -[MyShortcutsViewController _configureNavItemsForEditMode:](self, "_configureNavItemsForEditMode:", 1);
}

- (void)_doneEditingButtonTapped
{
  -[MyShortcutsDataSource setEditing:](self->_myShortcutsDataSource, "setEditing:", 0);
  -[MyShortcutsViewController _configureNavItemsForEditMode:](self, "_configureNavItemsForEditMode:", 0);
}

- (void)_configureNavItemsForEditMode:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[3];
  void *v19;
  __CFString *v20;
  _QWORD v21[2];
  __CFString *v22;
  void *v23;

  v3 = a3;
  if (sub_1002A8AA0(self) == 5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController pinnedTitle](self, "pinnedTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController customNavItem](self, "customNavItem"));
    objc_msgSend(v6, "setTitle:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController dismissButton](self, "dismissButton"));
    v23 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController customNavItem](self, "customNavItem"));
    objc_msgSend(v9, "setLeftBarButtonItems:", v8);

    if (v3)
    {
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController doneEditingBarButtonItem](self, "doneEditingBarButtonItem"));
      v22 = v10;
      v11 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
      v12 = (void *)v11;
    }
    else
    {
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController editBarButtonItem](self, "editBarButtonItem"));
      v21[0] = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController addBarButtonItem](self, "addBarButtonItem"));
      v21[1] = v12;
      v11 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
    }
    v13 = (void *)v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController customNavItem](self, "customNavItem"));
    objc_msgSend(v14, "setRightBarButtonItems:", v13);

    if (v3)
      goto LABEL_19;
    goto LABEL_18;
  }
  if (v3)
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController pinnedTitle](self, "pinnedTitle"));
  else
    v10 = &stru_1011EB268;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController customNavItem](self, "customNavItem"));
  objc_msgSend(v12, "setTitle:", v10);

  if (v3)
  {

    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController doneEditingBarButtonItem](self, "doneEditingBarButtonItem"));
    v20 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController titleLabelButton](self, "titleLabelButton"));
    v19 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController customNavItem](self, "customNavItem"));
  objc_msgSend(v15, "setLeftBarButtonItems:", v13);

  if (v3)
  {

    v16 = &__NSArray0__struct;
  }
  else
  {

    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController dismissButton](self, "dismissButton"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController editBarButtonItem](self, "editBarButtonItem", v10));
    v18[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController addBarButtonItem](self, "addBarButtonItem"));
    v18[2] = v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 3));
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsViewController customNavItem](self, "customNavItem"));
  objc_msgSend(v17, "setRightBarButtonItems:", v16);

  if (!v3)
  {

LABEL_18:
LABEL_19:

  }
}

- (UINavigationBar)navBar
{
  return self->_navBar;
}

- (void)setNavBar:(id)a3
{
  objc_storeStrong((id *)&self->_navBar, a3);
}

- (UINavigationItem)customNavItem
{
  return self->_customNavItem;
}

- (void)setCustomNavItem:(id)a3
{
  objc_storeStrong((id *)&self->_customNavItem, a3);
}

- (void)setEditBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_editBarButtonItem, a3);
}

- (void)setAddBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_addBarButtonItem, a3);
}

- (void)setDoneEditingBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_doneEditingBarButtonItem, a3);
}

- (void)setTitleLabelButton:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelButton, a3);
}

- (void)setDismissButton:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_titleLabelButton, 0);
  objc_storeStrong((id *)&self->_doneEditingBarButtonItem, 0);
  objc_storeStrong((id *)&self->_addBarButtonItem, 0);
  objc_storeStrong((id *)&self->_editBarButtonItem, 0);
  objc_storeStrong((id *)&self->_customNavItem, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_myShortcutsDataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_footerContentView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_hideableFooterView, 0);
}

@end
