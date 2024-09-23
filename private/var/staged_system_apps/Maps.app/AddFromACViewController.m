@implementation AddFromACViewController

- (NSString)headerTitle
{
  return (NSString *)&stru_1011EB268;
}

- (int)requestSource
{
  return 7;
}

- (int64_t)shortcutType
{
  return 0;
}

- (AddFromACViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  AddFromACViewController *v4;
  AddFromACViewController *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AddFromACViewController;
  v4 = -[AddFromACViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v4, "cardPresentationController"));
    objc_msgSend(v6, "setPresentedModally:", 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v7, "setTakesAvailableHeight:", 1);

    -[ContaineeViewController setPreferredPresentationStyle:](v5, "setPreferredPresentationStyle:", 6);
    -[AddFromACViewController setPreferredContentSize:](v5, "setPreferredContentSize:", 341.0, 500.0);
  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  ModalCardHeaderView *v4;
  void *v5;
  ModalCardHeaderView *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  PassthruSearchBar *v13;
  void *v14;
  HairlineView *v15;
  HairlineView *headerHairline;
  id v17;
  void *v18;
  MacFooterView *v19;
  MacFooterView *footerView;
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
  void *v38;
  uint64_t v39;
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
  uint64_t v60;
  void *v61;
  ModalCardHeaderView *v62;
  void *v63;
  void *v64;
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
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  PassthruSearchBar *v83;
  void *v84;
  objc_super v85;
  _QWORD v86[9];
  _QWORD v87[2];
  _QWORD v88[5];

  v85.receiver = self;
  v85.super_class = (Class)AddFromACViewController;
  -[ContaineeViewController viewDidLoad](&v85, "viewDidLoad");
  -[AddFromACViewController setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("AddFromACView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v4 = [ModalCardHeaderView alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ModalCardHeaderConfiguration leadingAlignedTitleModalCardHeaderConfiguration](ModalCardHeaderConfiguration, "leadingAlignedTitleModalCardHeaderConfiguration"));
  v6 = -[ModalCardHeaderView initWithConfiguration:](v4, "initWithConfiguration:", v5);

  -[ModalCardHeaderView setUseAdaptiveFont:](v6, "setUseAdaptiveFont:", 1);
  -[ModalCardHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AddFromACViewController headerTitle](self, "headerTitle"));
  -[ModalCardHeaderView setTitle:](v6, "setTitle:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView bottomHairline](v6, "bottomHairline"));
  objc_msgSend(v8, "setHidden:", 1);

  if (sub_1002A8AA0(self) != 5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](v6, "trailingButton"));
    v10 = sub_1009A992C();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v9, "setTitle:forState:", v11, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](v6, "trailingButton"));
    objc_msgSend(v12, "addTarget:action:forControlEvents:", self, "headerViewButtonTapped:buttonType:", 64);

  }
  objc_storeStrong((id *)&self->_modalHeaderView, v6);
  v13 = objc_alloc_init(PassthruSearchBar);
  -[PassthruSearchBar setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v13);
  -[PassthruSearchBar setDelegate:](v13, "setDelegate:", self);
  -[PassthruSearchBar setTextFieldDelegate:](v13, "setTextFieldDelegate:", self);
  objc_storeStrong((id *)&self->_searchBar, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar searchTextField](v13, "searchTextField"));
  objc_msgSend(v14, "setReturnKeyType:", 6);
  v81 = v14;
  objc_storeStrong((id *)&self->_searchField, v14);
  objc_msgSend(v3, "addSubview:", v6);
  v83 = v13;
  v15 = (HairlineView *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar _maps_addHairlineAtBottomWithMargin:](v13, "_maps_addHairlineAtBottomWithMargin:", 0.0));
  headerHairline = self->_headerHairline;
  self->_headerHairline = v15;

  -[HairlineView setAlpha:](self->_headerHairline, "setAlpha:", 0.0);
  v17 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("AddFromACTableView"));
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v17, "setBackgroundColor:", v18);

  objc_msgSend(v17, "_setHeaderAndFooterViewsFloat:", 0);
  objc_msgSend(v17, "setPreservesSuperviewLayoutMargins:", 1);
  objc_msgSend(v17, "setSectionHeaderTopPadding:", 0.0);
  objc_msgSend(v84, "addSubview:", v17);
  -[AddFromACViewController setTableView:](self, "setTableView:", v17);
  v82 = v17;
  if (sub_1002A8AA0(self) == 5)
  {
    v19 = -[MacFooterView initWithRightButtonType:]([MacFooterView alloc], "initWithRightButtonType:", 8);
    footerView = self->_footerView;
    self->_footerView = v19;

    -[MacFooterView setTranslatesAutoresizingMaskIntoConstraints:](self->_footerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MacFooterView setRightButtonEnabled:](self->_footerView, "setRightButtonEnabled:", 1);
    -[MacFooterView setDelegate:](self->_footerView, "setDelegate:", self);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    objc_msgSend(v21, "addSubview:", self->_footerView);

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[MacFooterView bottomAnchor](self->_footerView, "bottomAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[AddFromACViewController view](self, "view"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "bottomAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:"));
    v88[0] = v77;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[MacFooterView leadingAnchor](self->_footerView, "leadingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[AddFromACViewController view](self, "view"));
    v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "leadingAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v60));
    v88[1] = v72;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[MacFooterView trailingAnchor](self->_footerView, "trailingAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[AddFromACViewController view](self, "view"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "trailingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v58));
    v88[2] = v55;
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "leadingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:constant:", v22, 10.0));
    v88[3] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MacFooterView topAnchor](self->_footerView, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
    v88[4] = v26;
    v27 = v3;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v88, 5));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

    v3 = v27;
    v29 = v57;

    v30 = v70;
    v31 = (void *)v60;
    v32 = v63;

    v17 = v82;
    v33 = v75;

  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "leadingAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v33));
    v87[0] = v79;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "bottomAnchor"));
    v77 = v34;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v32));
    v87[1] = v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v87, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);
  }
  v62 = v6;
  v67 = v3;

  v80 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView topAnchor](v6, "topAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:", v78));
  v86[0] = v76;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingAnchor](v6, "leadingAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v73));
  v86[1] = v71;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingAnchor](v6, "trailingAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v66));
  v86[2] = v64;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView bottomAnchor](v6, "bottomAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar topAnchor](v83, "topAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:constant:", v59, 10.0));
  v86[3] = v56;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar leadingAnchor](v83, "leadingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v52));
  v86[4] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar trailingAnchor](v83, "trailingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v86[5] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar bottomAnchor](v83, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v35));
  v86[6] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "topAnchor"));
  v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v38));
  v40 = v17;
  v41 = (void *)v39;
  v86[7] = v39;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v43));
  v86[8] = v44;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v86, 9));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[AddFromACViewController view](self, "view"));
  objc_msgSend(v46, "layoutIfNeeded");

  +[KeyboardAvoidingView startObservingKeyboard](KeyboardAvoidingView, "startObservingKeyboard");
  -[AddFromACViewController updateTheme](self, "updateTheme");
  -[AddFromACViewController updateDataSource](self, "updateDataSource");
  -[AddFromACViewController _setPlaceHolder](self, "_setPlaceHolder");

}

- (void)didBecomeCurrent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AddFromACViewController;
  -[ContaineeViewController didBecomeCurrent](&v3, "didBecomeCurrent");
  -[UITextField becomeFirstResponder](self->_searchField, "becomeFirstResponder");
  -[AddFromACViewController _enableTextFieldNotification:](self, "_enableTextFieldNotification:", 1);
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    -[AddFromACViewController updateDataSource](self, "updateDataSource");
}

- (void)didResignCurrent
{
  DataSource *currentDataSource;
  objc_super v4;

  -[AddFromACViewController _enableTextFieldNotification:](self, "_enableTextFieldNotification:", 0);
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    currentDataSource = self->_currentDataSource;
    self->_currentDataSource = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)AddFromACViewController;
  -[ContaineeViewController didResignCurrent](&v4, "didResignCurrent");
}

- (void)_setPlaceHolder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UITextField *searchField;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if ((+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("__internal__searchBarPlaceholderV2"), v4));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v11));

    searchField = self->_searchField;
    if (v6)
    {
      -[UITextField setPlaceholder:](self->_searchField, "setPlaceholder:", v6);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Search for a place or address"), CFSTR("localized string not found"), 0));
      -[UITextField setPlaceholder:](searchField, "setPlaceholder:", v9);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField _placeholderLabel](self->_searchField, "_placeholderLabel"));
    objc_msgSend(v10, "setAllowsDefaultTighteningForTruncation:", 1);

  }
}

- (void)updateTheme
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UITableView *tableView;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AddFromACViewController theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchBarPlaceHolderColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField _placeholderLabel](self->_searchField, "_placeholderLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AddFromACViewController theme](self, "theme"));
  -[UITextField setKeyboardAppearance:](self->_searchField, "setKeyboardAppearance:", objc_msgSend(v6, "textFieldKeyboardAppearance"));

  tableView = self->_tableView;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[AddFromACViewController theme](self, "theme"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hairlineColor"));
  -[UITableView setSeparatorColor:](tableView, "setSeparatorColor:", v8);

}

- (id)suggestionsDataSource
{
  ShortcutSuggestionsDataSource *suggestionsDataSource;
  ShortcutSuggestionsDataSource *v4;
  void *v5;
  ShortcutSuggestionsDataSource *v6;
  ShortcutSuggestionsDataSource *v7;

  suggestionsDataSource = self->_suggestionsDataSource;
  if (!suggestionsDataSource)
  {
    v4 = [ShortcutSuggestionsDataSource alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AddFromACViewController tableView](self, "tableView"));
    v6 = -[ShortcutSuggestionsDataSource initWithTableView:updateLocation:shortcutType:](v4, "initWithTableView:updateLocation:shortcutType:", v5, 0, -[AddFromACViewController shortcutType](self, "shortcutType"));

    -[DataSource setDelegate:](v6, "setDelegate:", self);
    v7 = self->_suggestionsDataSource;
    self->_suggestionsDataSource = v6;

    suggestionsDataSource = self->_suggestionsDataSource;
  }
  return suggestionsDataSource;
}

- (id)recentlyViewedDataSource
{
  RecentlyViewedDataSource *recentlyViewedDataSource;
  RecentlyViewedDataSource *v4;
  void *v5;
  RecentlyViewedDataSource *v6;
  RecentlyViewedDataSource *v7;

  recentlyViewedDataSource = self->_recentlyViewedDataSource;
  if (!recentlyViewedDataSource)
  {
    v4 = [RecentlyViewedDataSource alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AddFromACViewController tableView](self, "tableView"));
    v6 = -[RecentlyViewedDataSource initWithTableView:updateLocation:](v4, "initWithTableView:updateLocation:", v5, 0);

    -[DataSource setDelegate:](v6, "setDelegate:", self);
    -[RecentlyViewedDataSource setShowAddAccessory:](v6, "setShowAddAccessory:", 1);
    v7 = self->_recentlyViewedDataSource;
    self->_recentlyViewedDataSource = v6;

    recentlyViewedDataSource = self->_recentlyViewedDataSource;
  }
  return recentlyViewedDataSource;
}

- (id)searchDataSource
{
  SearchDataSource *searchDataSource;
  SearchDataSource *v4;
  void *v5;
  SearchDataSource *v6;
  void *v7;
  SearchDataSource *v8;

  searchDataSource = self->_searchDataSource;
  if (!searchDataSource)
  {
    v4 = [SearchDataSource alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AddFromACViewController tableView](self, "tableView"));
    v6 = -[SearchDataSource initWithTableView:](v4, "initWithTableView:", v5);

    -[DataSource setDelegate:](v6, "setDelegate:", self);
    -[SearchDataSource setShowAddAccessory:](v6, "setShowAddAccessory:", 1);
    -[SearchDataSource setAccessoryType:](v6, "setAccessoryType:", -[AddFromACViewController accessoryTypeToShow](self, "accessoryTypeToShow"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource searchDataProvider](v6, "searchDataProvider"));
    objc_msgSend(v7, "setResultTypes:", 3);

    v8 = self->_searchDataSource;
    self->_searchDataSource = v6;

    searchDataSource = self->_searchDataSource;
  }
  return searchDataSource;
}

- (id)emptyStateDataSource
{
  void *v3;

  if (-[AddFromACViewController showsRecents](self, "showsRecents"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AddFromACViewController recentlyViewedDataSource](self, "recentlyViewedDataSource"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AddFromACViewController suggestionsDataSource](self, "suggestionsDataSource"));
  return v3;
}

- (BOOL)showsRecents
{
  return 1;
}

- (int64_t)accessoryTypeToShow
{
  return 1;
}

- (void)updateDataSource
{
  void *v3;
  uint64_t v4;
  DataSource *currentDataSource;
  void *v6;
  void *v7;
  DataSource *obj;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_searchField, "text"));
  if (objc_msgSend(v3, "length"))
    v4 = objc_claimAutoreleasedReturnValue(-[AddFromACViewController searchDataSource](self, "searchDataSource"));
  else
    v4 = objc_claimAutoreleasedReturnValue(-[AddFromACViewController emptyStateDataSource](self, "emptyStateDataSource"));
  obj = (DataSource *)v4;

  currentDataSource = self->_currentDataSource;
  if (currentDataSource != obj)
  {
    -[DataSource setActive:](currentDataSource, "setActive:", 0);
    objc_storeStrong((id *)&self->_currentDataSource, obj);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AddFromACViewController tableView](self, "tableView"));
    objc_msgSend(v6, "setDataSource:", obj);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AddFromACViewController tableView](self, "tableView"));
    objc_msgSend(v7, "setDelegate:", obj);

    -[DataSource setActive:](obj, "setActive:", 1);
  }

}

- (void)_enableTextFieldNotification:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "_textFieldDidChange:", UITextFieldTextDidChangeNotification, self->_searchField);
  else
    objc_msgSend(v5, "removeObserver:name:object:", self, UITextFieldTextDidChangeNotification, self->_searchField);

}

- (void)_updateHeaderHairline
{
  unsigned int v3;
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[AddFromACViewController tableView](self, "tableView"));
  v3 = objc_msgSend(v5, "_maps_shouldShowTopHairline");
  v4 = 0.0;
  if (v3)
    v4 = 1.0;
  -[HairlineView setAlpha:](self->_headerHairline, "setAlpha:", v4);

}

- (void)_handleItem:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  v4 = a3;
  v5 = objc_opt_class(MKLocalSearchCompletion);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      v9 = objc_msgSend(v8, "newTraits");
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultTraits"));
    }
    v13 = v9;

    objc_msgSend(v13, "setSource:", -[AddFromACViewController requestSource](self, "requestSource"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "queryLine"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geoCompletionItem"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ticketForSearchQuery:completionItem:traits:searchSessionData:", v15, v16, v13, 0));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100389300;
    v18[3] = &unk_1011AE168;
    v18[4] = self;
    objc_msgSend(v17, "submitWithHandler:networkActivity:", v18, 0);

  }
  else
  {
    v10 = objc_opt_class(MKMapItem);
    if ((objc_opt_isKindOfClass(v4, v10) & 1) != 0)
    {
      -[AddFromACViewController saveMapItem:](self, "saveMapItem:", v4);
    }
    else
    {
      v11 = objc_opt_class(MapsSuggestionsShortcut);
      if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0
        || (v12 = objc_opt_class(_TtC4Maps16MapsFavoriteItem), (objc_opt_isKindOfClass(v4, v12) & 1) != 0))
      {
        -[AddFromACViewController saveShortcut:](self, "saveShortcut:", v4);
      }
    }
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AddFromACViewController;
  -[ContaineeViewController scrollViewDidScroll:](&v4, "scrollViewDidScroll:", a3);
  -[AddFromACViewController _updateHeaderHairline](self, "_updateHeaderHairline");
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  -[AddFromACViewController _handleItem:](self, "_handleItem:", a4);
}

- (void)searchDataSource:(id)a3 addItem:(id)a4
{
  -[AddFromACViewController _handleItem:](self, "_handleItem:", a4);
}

- (void)dataSourceUpdated:(id)a3
{
  if (self->_currentDataSource == a3)
  {
    -[UITableView reloadData](self->_tableView, "reloadData");
    -[AddFromACViewController _updateHeaderHairline](self, "_updateHeaderHairline");
  }
}

- (BOOL)searchDataSource:(id)a3 shouldFilterItem:(id)a4
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;

  v4 = a4;
  v5 = objc_opt_class(MKLocalSearchCompletion);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
    goto LABEL_7;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
  v8 = objc_msgSend(v7, "_hasHikeInfo");

  if ((v8 & 1) == 0 && objc_msgSend(v6, "_type") != (id)2)
  {
    v9 = objc_msgSend(v6, "_type");

    if (v9 == (id)1)
    {
      v8 = 0;
      goto LABEL_8;
    }
LABEL_7:
    v8 = 1;
    goto LABEL_8;
  }

LABEL_8:
  return v8;
}

- (void)setInputText:(id)a3
{
  NSString *v4;
  NSString *v5;
  unsigned __int8 v6;
  NSString *v7;
  NSString *inputText;
  void *v9;
  id v10;
  void *v11;
  NSString *v12;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_inputText != v4)
  {
    v12 = v4;
    v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v12;
    if ((v6 & 1) == 0)
    {
      v7 = (NSString *)-[NSString copy](v12, "copy");
      inputText = self->_inputText;
      self->_inputText = v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      v10 = objc_msgSend(v9, "newTraits");

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[AddFromACViewController searchDataSource](self, "searchDataSource"));
      objc_msgSend(v11, "setInputText:traits:source:", self->_inputText, v10, 11);

      v5 = v12;
    }
  }

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  -[UITextField resignFirstResponder](self->_searchField, "resignFirstResponder", a3);
  return 0;
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  return 1;
}

- (BOOL)searchBarShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  return 1;
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
}

- (void)_textFieldDidChange:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_searchField, "text", a3));
  -[AddFromACViewController setInputText:](self, "setInputText:", v4);

  -[AddFromACViewController updateDataSource](self, "updateDataSource");
}

- (void)macFooterViewRightButtonTapped:(id)a3
{
  -[AddFromACViewController headerViewButtonTapped:buttonType:](self, "headerViewButtonTapped:buttonType:", 0, 0);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerHairline, 0);
  objc_storeStrong((id *)&self->_suggestionsDataSource, 0);
  objc_storeStrong((id *)&self->_recentlyViewedDataSource, 0);
  objc_storeStrong((id *)&self->_searchDataSource, 0);
  objc_storeStrong((id *)&self->_currentDataSource, 0);
  objc_storeStrong((id *)&self->_searchField, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_modalHeaderView, 0);
  objc_storeStrong((id *)&self->_inputText, 0);
}

@end
