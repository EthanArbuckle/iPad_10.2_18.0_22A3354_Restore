@implementation ContactSearchViewController

- (ContactSearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ContactSearchViewController *v4;
  ContactSearchViewController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *destinationsToContactValues;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *meCardIdentifier;
  SharedTripSuggestionsDataSource *v14;
  SharedTripSuggestionsDataSource *suggestionDataSource;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)ContactSearchViewController;
  v4 = -[ContactSearchViewController initWithNibName:bundle:](&v18, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v4, "cardPresentationController"));
    objc_msgSend(v6, "setPresentedModally:", 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v7, "setTakesAvailableHeight:", 1);

    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    destinationsToContactValues = v5->_destinationsToContactValues;
    v5->_destinationsToContactValues = (NSMutableDictionary *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "meCard"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    meCardIdentifier = v5->_meCardIdentifier;
    v5->_meCardIdentifier = (NSString *)v12;

    v14 = -[SharedTripSuggestionsDataSource initWithSoftCellCap:includeActiveContacts:]([SharedTripSuggestionsDataSource alloc], "initWithSoftCellCap:includeActiveContacts:", GEOConfigGetUInteger(MapsConfig_SharedTripMaximumNumberOfSuggestionsFromPeopleSuggester, off_1014B5618), 0);
    suggestionDataSource = v5->_suggestionDataSource;
    v5->_suggestionDataSource = v14;

    -[SharedTripSuggestionsDataSource setDelegate:](v5->_suggestionDataSource, "setDelegate:", v5);
    v5->_userInteracted = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher"));
    objc_msgSend(v16, "registerObserver:", v5);

  }
  return v5;
}

- (ContactSearchViewController)initWithShortcutEditSession:(id)a3
{
  id v5;
  ContactSearchViewController *v6;
  ContactSearchViewController *v7;
  uint64_t v8;
  NSArray *initialContactValues;

  v5 = a3;
  v6 = -[ContactSearchViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_shortcutEditSession, a3);
    v8 = objc_claimAutoreleasedReturnValue(-[ShortcutEditSession contacts](v7->_shortcutEditSession, "contacts"));
    initialContactValues = v7->_initialContactValues;
    v7->_initialContactValues = (NSArray *)v8;

  }
  return v7;
}

- (ContactSearchViewController)initWithInitialContacts:(id)a3 selectionHandler:(id)a4
{
  id v7;
  id v8;
  ContactSearchViewController *v9;
  ContactSearchViewController *v10;
  id v11;
  id selectionHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ContactSearchViewController;
  v9 = -[ContactSearchViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_initialContactValues, a3);
    v11 = objc_msgSend(v8, "copy");
    selectionHandler = v10->_selectionHandler;
    v10->_selectionHandler = v11;

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (!self->_userInteracted)
    -[SharedTripSuggestionsDataSource abandon](self->_suggestionDataSource, "abandon");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher"));
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ContactSearchViewController;
  -[ContactSearchViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  UISearchBar *v4;
  UISearchBar *searchBar;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  UITextField *v11;
  UITextField *searchField;
  id v13;
  double y;
  double width;
  double height;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  NSString *v26;
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
  void *v83;
  objc_super v84;
  _QWORD v85[14];

  v84.receiver = self;
  v84.super_class = (Class)ContactSearchViewController;
  -[ContaineeViewController viewDidLoad](&v84, "viewDidLoad");
  -[ContactSearchViewController loadContaineeHeaderView](self, "loadContaineeHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("ContactSearchView"));

  v4 = (UISearchBar *)objc_alloc_init((Class)UISearchBar);
  searchBar = self->_searchBar;
  self->_searchBar = v4;

  -[UISearchBar setTranslatesAutoresizingMaskIntoConstraints:](self->_searchBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController view](self, "view"));
  objc_msgSend(v6, "addSubview:", self->_searchBar);

  -[UISearchBar setDelegate:](self->_searchBar, "setDelegate:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UISearchBar setBackgroundColor:](self->_searchBar, "setBackgroundColor:", v7);

  v8 = objc_alloc_init((Class)UIImage);
  -[UISearchBar setBackgroundImage:](self->_searchBar, "setBackgroundImage:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[Share ETA] Search"), CFSTR("localized string not found"), 0));
  -[UISearchBar setPlaceholder:](self->_searchBar, "setPlaceholder:", v10);

  -[UISearchBar setTranslucent:](self->_searchBar, "setTranslucent:", 1);
  -[UISearchBar setOpaque:](self->_searchBar, "setOpaque:", 0);
  -[UISearchBar _setBackdropStyle:](self->_searchBar, "_setBackdropStyle:", 2005);
  v11 = (UITextField *)objc_claimAutoreleasedReturnValue(-[UISearchBar searchTextField](self->_searchBar, "searchTextField"));
  searchField = self->_searchField;
  self->_searchField = v11;

  -[UITextField setAccessibilityIdentifier:](self->_searchField, "setAccessibilityIdentifier:", CFSTR("ContactsSearchField"));
  v13 = objc_alloc((Class)MKViewWithHairline);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v17 = objc_msgSend(v13, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v17, "setTopHairlineHidden:", 1);
  objc_msgSend(v17, "setBottomHairlineHidden:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController view](self, "view"));
  objc_msgSend(v18, "addSubview:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v19, "nativeScale");
  v21 = v20;

  v22 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 0, CGRectZero.origin.x, y, width, height);
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v22, "setRowHeight:", UITableViewAutomaticDimension);
  objc_msgSend(v22, "setEstimatedRowHeight:", 76.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v22, "setBackgroundColor:", v23);

  objc_msgSend(v22, "setPreservesSuperviewLayoutMargins:", 1);
  v24 = objc_opt_class(ContactValueTableViewCell);
  v25 = (objc_class *)objc_opt_class(ContactValueTableViewCell);
  v26 = NSStringFromClass(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  objc_msgSend(v22, "registerClass:forCellReuseIdentifier:", v24, v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController view](self, "view"));
  objc_msgSend(v28, "addSubview:", v22);

  -[ContactSearchViewController setTableView:](self, "setTableView:", v22);
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_titleHeaderView, "topAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController view](self, "view"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "topAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:", v81));
  v85[0] = v80;
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_titleHeaderView, "leadingAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController view](self, "view"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "leadingAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v77));
  v85[1] = v76;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_titleHeaderView, "trailingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController view](self, "view"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "trailingAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v73));
  v85[2] = v72;
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_titleHeaderView, "bottomAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar topAnchor](self->_searchBar, "topAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v70));
  v85[3] = v69;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar leadingAnchor](self->_searchBar, "leadingAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController view](self, "view"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "leadingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:constant:", v65, 4.0));
  v85[4] = v64;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar trailingAnchor](self->_searchBar, "trailingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController view](self, "view"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "trailingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, -4.0));
  v85[5] = v60;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar bottomAnchor](self->_searchBar, "bottomAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:constant:", v57, -12.0));
  v85[6] = v56;
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "heightAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToConstant:", 1.0 / v21));
  v85[7] = v54;
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController view](self, "view"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "leadingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v51));
  v85[8] = v50;
  v66 = v17;
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController view](self, "view"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "trailingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
  v85[9] = v46;
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
  v85[10] = v43;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController view](self, "view"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v85[11] = v39;
  v59 = v22;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController view](self, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v31));
  v85[12] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController view](self, "view"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v35));
  v85[13] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v85, 14));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController view](self, "view"));
  objc_msgSend(v38, "layoutIfNeeded");

  -[ContactSearchViewController prepopulate](self, "prepopulate");
  +[KeyboardAvoidingView startObservingKeyboard](KeyboardAvoidingView, "startObservingKeyboard");
  -[ContactSearchViewController updateTheme](self, "updateTheme");
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);

}

- (void)suggestionsDataSourceDidUpdateContactsForDisplay:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_searchField, "text", a3));
  v5 = objc_msgSend(v4, "length");

  if (!v5)
    -[ContactSearchViewController prepopulate](self, "prepopulate");
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchBarPlaceHolderColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField _placeholderLabel](self->_searchField, "_placeholderLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController theme](self, "theme"));
  -[UITextField setKeyboardAppearance:](self->_searchField, "setKeyboardAppearance:", objc_msgSend(v6, "textFieldKeyboardAppearance"));

  tableView = self->_tableView;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController theme](self, "theme"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hairlineColor"));
  -[UITableView setSeparatorColor:](tableView, "setSeparatorColor:", v8);

}

- (id)modalHeaderView
{
  UIView *titleHeaderView;
  uint64_t v4;
  UIView *v5;

  titleHeaderView = self->_titleHeaderView;
  v4 = objc_opt_class(ModalCardHeaderView);
  if ((objc_opt_isKindOfClass(titleHeaderView, v4) & 1) != 0)
    v5 = self->_titleHeaderView;
  else
    v5 = 0;
  return v5;
}

- (void)loadContaineeHeaderView
{
  ModalCardHeaderView *v3;
  void *v4;
  UIView *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  UIView *titleHeaderView;
  UIView *v18;
  id v19;

  v3 = [ModalCardHeaderView alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration](ModalCardHeaderConfiguration, "defaultModalCardHeaderConfiguration"));
  v5 = -[ModalCardHeaderView initWithConfiguration:](v3, "initWithConfiguration:", v4);

  -[UIView setUseAdaptiveFont:](v5, "setUseAdaptiveFont:", 1);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Share ETA] Add Person"), CFSTR("localized string not found"), 0));
  -[UIView setTitle:](v5, "setTitle:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingButton](v5, "leadingButton"));
  v9 = sub_1009A98D8();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v8, "setTitle:forState:", v10, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingButton](v5, "leadingButton"));
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, "_cancelAction:", 64);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingButton](v5, "trailingButton"));
  v13 = sub_1009A992C();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v12, "setTitle:forState:", v14, 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingButton](v5, "trailingButton"));
  objc_msgSend(v15, "addTarget:action:forControlEvents:", self, "_doneAction:", 64);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingButton](v5, "trailingButton"));
  objc_msgSend(v16, "setEnabled:", 0);

  titleHeaderView = self->_titleHeaderView;
  self->_titleHeaderView = v5;
  v18 = v5;

  v19 = (id)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController view](self, "view"));
  objc_msgSend(v19, "addSubview:", v18);

}

- (void)_cancelAction:(id)a3
{
  id v4;

  v4 = a3;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 4, 735, 0);
  -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", v4);

}

- (void)_doneAction:(id)a3
{
  id v4;

  v4 = a3;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 41, 735, 0);
  -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", v4);

}

- (void)prepopulate
{
  NSArray *v3;
  NSArray *contactValues;

  v3 = (NSArray *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource contactsForDisplay](self->_suggestionDataSource, "contactsForDisplay"));
  contactValues = self->_contactValues;
  self->_contactValues = v3;

  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)clear
{
  NSArray *contactValues;

  contactValues = self->_contactValues;
  self->_contactValues = 0;

  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)fetchContacts
{
  NSArray *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSArray *v21;
  NSArray *contactValues;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;

  v3 = self->_initialContactValues;
  v4 = sub_10039DCD4(v3, &stru_1011E0E80);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sharingIdentity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "aliases"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contactStore"));

  v11 = objc_alloc((Class)CNContactFetchRequest);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "properties"));
  v14 = objc_msgSend(v11, "initWithKeysToFetch:", v13);

  if (-[NSString length](self->_searchQuery, "length") >= 3)
    v15 = 1;
  else
    v15 = 3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact predicateForContactsMatchingName:options:](CNContact, "predicateForContactsMatchingName:options:", self->_searchQuery, v15));
  objc_msgSend(v14, "setPredicate:", v16);

  objc_msgSend(v14, "setSortOrder:", 1);
  v27 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100A6F29C;
  v23[3] = &unk_1011DD3C0;
  v23[4] = self;
  v24 = v8;
  v25 = v5;
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = v26;
  v18 = v5;
  v19 = v8;
  objc_msgSend(v10, "enumerateContactsWithFetchRequest:error:usingBlock:", v14, &v27, v23);
  v20 = v27;
  v21 = (NSArray *)objc_msgSend(v17, "copy");
  contactValues = self->_contactValues;
  self->_contactValues = v21;

  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)_contactValuesSelected:(id)a3
{
  void *v4;
  void *v5;
  ShortcutEditSession *shortcutEditSession;
  id selectionHandler;
  void (**v8)(id, id);
  id v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController modalHeaderView](self, "modalHeaderView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingButton"));
  objc_msgSend(v5, "setEnabled:", 1);

  shortcutEditSession = self->_shortcutEditSession;
  if (shortcutEditSession)
  {
    -[ShortcutEditSession addSharing:](shortcutEditSession, "addSharing:", v10);
  }
  else
  {
    selectionHandler = self->_selectionHandler;
    if (selectionHandler)
    {
      v8 = (void (**)(id, id))objc_retainBlock(selectionHandler);
      v8[2](v8, v10);
      v9 = self->_selectionHandler;
      self->_selectionHandler = 0;

    }
  }
  -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", 0);

}

- (void)capabilityLevelFetcher:(id)a3 didUpdateCapabilityLevelsForHandles:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController tableView](self, "tableView", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "visibleCells"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contactValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringValue"));
        v15 = objc_msgSend(v5, "containsObject:", v14);

        if (v15)
          -[ContactSearchViewController updateCapabilityLevelForCell:](self, "updateCapabilityLevelForCell:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = objc_opt_class(ContactValueTableViewCell);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactValue"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher"));
      v10 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
      objc_msgSend(v8, "requestCapabilityLevelsForContacts:", v9);

    }
  }

}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v5 = objc_opt_class(ContactValueTableViewCell);
  isKindOfClass = objc_opt_isKindOfClass(v10, v5);
  v7 = v10;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contactValue"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher"));
      objc_msgSend(v9, "cancelCapabilityLevelRequestForContact:", v8);

    }
    v7 = v10;
  }

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  NSArray *contactValues;
  id v7;
  id v8;
  id v9;

  self->_userInteracted = 1;
  contactValues = self->_contactValues;
  v7 = a4;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](contactValues, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
  -[ContactSearchViewController _contactValuesSelected:](self, "_contactValuesSelected:", v9);
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v7, 1);

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9025, 735, 0);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_contactValues, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  UITableView *tableView;
  id v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSArray *contactValues;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  tableView = self->_tableView;
  v6 = a4;
  v7 = (objc_class *)objc_opt_class(ContactValueTableViewCell);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView dequeueReusableCellWithIdentifier:](tableView, "dequeueReusableCellWithIdentifier:", v9));

  contactValues = self->_contactValues;
  v12 = objc_msgSend(v6, "row");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](contactValues, "objectAtIndexedSubscript:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contact"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v14, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contactNameLabel"));
  objc_msgSend(v16, "setText:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "labeledValue"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "label"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CNLabeledValue localizedStringForLabel:](CNLabeledValue, "localizedStringForLabel:", v18));

  if (objc_msgSend(v19, "length"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringValue"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v19, v20));
    objc_msgSend(v10, "setContactHandle:", v21);

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringValue"));
    objc_msgSend(v10, "setContactHandle:", v20);
  }

  objc_msgSend(v10, "setContactValue:", v13);
  -[ContactSearchViewController updateCapabilityLevelForCell:](self, "updateCapabilityLevelForCell:", v10);

  return v10;
}

- (void)updateCapabilityLevelForCell:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contactValue"));
  v5 = objc_msgSend(v3, "capabilityLevelForContact:", v4);

  switch((unint64_t)v5)
  {
    case 0uLL:
    case 1uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      objc_msgSend(v14, "setCapabilityColor:", v6);

      objc_msgSend(v14, "setUserInteractionEnabled:", 0);
      break;
    case 2uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
      objc_msgSend(v14, "setCapabilityColor:", v7);

      objc_msgSend(v14, "setUserInteractionEnabled:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("share eta contact search SMS");
      goto LABEL_6;
    case 3uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
      objc_msgSend(v14, "setCapabilityColor:", v11);

      objc_msgSend(v14, "setUserInteractionEnabled:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("share eta contact search iMessage");
      goto LABEL_6;
    case 4uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
      objc_msgSend(v14, "setCapabilityColor:", v12);

      objc_msgSend(v14, "setUserInteractionEnabled:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("share eta contact search Maps");
LABEL_6:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));
      objc_msgSend(v14, "setContactCapability:", v13);

      break;
    default:
      break;
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ContactSearchViewController;
  -[ContaineeViewController scrollViewDidScroll:](&v5, "scrollViewDidScroll:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController view](self, "view"));
  objc_msgSend(v4, "endEditing:", 1);

}

- (void)performAutocompleteSearch
{
  NSString *v3;
  NSString *v4;
  unsigned __int8 v5;
  NSString *v6;
  NSString *searchQuery;
  NSString *v8;

  v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[UISearchBar text](self->_searchBar, "text"));
  v4 = v3;
  if (v3 != self->_searchQuery)
  {
    v8 = v3;
    v5 = -[NSString isEqualToString:](v3, "isEqualToString:");
    v4 = v8;
    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      searchQuery = self->_searchQuery;
      self->_searchQuery = v6;

      -[ContactSearchViewController fetchContacts](self, "fetchContacts");
      v4 = v8;
    }
  }

}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  return 1;
}

- (BOOL)searchBarShouldEndEditing:(id)a3
{
  return 1;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v6;
  id v7;
  NSTimer *v8;
  NSTimer *autocompleteDelayTimer;
  _QWORD v10[4];
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  -[NSTimer invalidate](self->_autocompleteDelayTimer, "invalidate");
  if (objc_msgSend(v7, "length"))
  {
    -[ContactSearchViewController clear](self, "clear");
    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100A6FFB4;
    v10[3] = &unk_1011ADF20;
    objc_copyWeak(&v11, &location);
    v8 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v10, 0.5));
    autocompleteDelayTimer = self->_autocompleteDelayTimer;
    self->_autocompleteDelayTimer = v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    -[ContactSearchViewController prepopulate](self, "prepopulate");
  }

}

- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  return 1;
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
}

- (SharedTripSuggestionsDataSource)suggestionDataSource
{
  return self->_suggestionDataSource;
}

- (void)setSuggestionDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionDataSource, a3);
}

- (NSArray)contactValues
{
  return self->_contactValues;
}

- (void)setContactValues:(id)a3
{
  objc_storeStrong((id *)&self->_contactValues, a3);
}

- (UIView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_titleHeaderView, a3);
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
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_suggestionDataSource, 0);
  objc_storeStrong((id *)&self->_meCardIdentifier, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_shortcutEditSession, 0);
  objc_storeStrong((id *)&self->_contactValues, 0);
  objc_storeStrong((id *)&self->_initialContactValues, 0);
  objc_storeStrong((id *)&self->_destinationsToContactValues, 0);
  objc_storeStrong((id *)&self->_autocompleteDelayTimer, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_searchField, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
}

@end
