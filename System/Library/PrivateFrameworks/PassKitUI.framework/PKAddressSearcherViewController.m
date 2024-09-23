@implementation PKAddressSearcherViewController

- (PKAddressSearcherViewController)initWithStyle:(int64_t)a3
{
  return -[PKAddressSearcherViewController initWithIdentityVerificationController:setupDelegate:style:](self, "initWithIdentityVerificationController:setupDelegate:style:", 0, 0, a3);
}

- (PKAddressSearcherViewController)initWithIdentityVerificationController:(id)a3 setupDelegate:(id)a4 style:(int64_t)a5
{
  id v8;
  PKAddressSearcherViewController *v9;
  PKAddressSearchModel *v10;
  PKAddressSearchModel *searchModel;
  uint64_t v12;
  uint64_t v13;
  NSArray *requiredKeys;
  NSDictionary *v15;
  NSDictionary *sectionMapping;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKAddressSearcherViewController;
  v9 = -[PKAddressSearcherViewController initWithNibName:bundle:](&v18, sel_initWithNibName_bundle_, 0, 0);
  if (v9)
  {
    v10 = (PKAddressSearchModel *)objc_alloc_init(MEMORY[0x1E0D66A40]);
    searchModel = v9->_searchModel;
    v9->_searchModel = v10;

    -[PKAddressSearchModel setDelegate:](v9->_searchModel, "setDelegate:", v9);
    v9->_style = a5;
    objc_storeStrong((id *)&v9->_identityVerificationController, a3);
    v12 = *MEMORY[0x1E0C970C8];
    v19[0] = *MEMORY[0x1E0D69BD8];
    v19[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v13 = objc_claimAutoreleasedReturnValue();
    requiredKeys = v9->_requiredKeys;
    v9->_requiredKeys = (NSArray *)v13;

    v9->_supportsSearchBarCancelButton = 1;
    v15 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sectionMapping = v9->_sectionMapping;
    v9->_sectionMapping = v15;

    -[PKAddressSearcherViewController _updateSectionMapping](v9, "_updateSectionMapping");
    -[PKAddressSearcherViewController _updateNavigationButtons](v9, "_updateNavigationButtons");
  }

  return v9;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  PKTableHeaderView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  PKTableHeaderView *v11;
  PKTableHeaderView *headerView;
  void *v13;
  void *v14;
  int v15;
  UISearchBar *v16;
  UISearchBar *searchBar;
  UISearchBar *v18;
  void *v19;
  UISearchBar *v20;
  BOOL v21;
  _BOOL8 supportsSearchBarCancelButton;
  UISearchBar *v23;
  _UINavigationControllerPalette *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  _UINavigationControllerPalette *v31;
  _UINavigationControllerPalette *palette;
  UITableView *v33;
  UITableView *tableView;
  UITableView *v35;
  void *v36;
  UITableView *v37;
  void *v38;
  void *v39;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)PKAddressSearcherViewController;
  -[PKAddressSearcherViewController loadView](&v40, sel_loadView);
  -[PKAddressSearcherViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_backgroundColor)
  {
    objc_msgSend(v3, "setBackgroundColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v5);

  }
  if (self->_headerTitle || self->_headerSubtitle)
  {
    v6 = [PKTableHeaderView alloc];
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = -[PKTableHeaderView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    headerView = self->_headerView;
    self->_headerView = v11;

    if (self->_headerTitle)
    {
      -[PKTableHeaderView titleLabel](self->_headerView, "titleLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", self->_headerTitle);

    }
    if (self->_headerSubtitle)
    {
      -[PKTableHeaderView subtitleLabel](self->_headerView, "subtitleLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", self->_headerSubtitle);

    }
    -[PKTableHeaderView sizeToFit](self->_headerView, "sizeToFit");
    objc_msgSend(v4, "addSubview:", self->_headerView);
    v15 = 1;
  }
  else
  {
    v15 = 0;
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v16 = (UISearchBar *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C38]), "initWithFrame:", v7, v8, v9, v10);
  searchBar = self->_searchBar;
  self->_searchBar = v16;

  -[UISearchBar setAutocorrectionType:](self->_searchBar, "setAutocorrectionType:", 0);
  -[UISearchBar setDelegate:](self->_searchBar, "setDelegate:", self);
  v18 = self->_searchBar;
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_SEARCH_FOR_ADDRESSES"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchBar setPlaceholder:](v18, "setPlaceholder:", v19);

  -[UISearchBar setReturnKeyType:](self->_searchBar, "setReturnKeyType:", 9);
  -[UISearchBar setEnablesReturnKeyAutomatically:](self->_searchBar, "setEnablesReturnKeyAutomatically:", 1);
  -[UISearchBar setTextContentType:](self->_searchBar, "setTextContentType:", *MEMORY[0x1E0DC5430]);
  -[UISearchBar _setAutoDisableCancelButton:](self->_searchBar, "_setAutoDisableCancelButton:", 0);
  -[UISearchBar setSearchBarStyle:](self->_searchBar, "setSearchBarStyle:", 2);
  v20 = self->_searchBar;
  v21 = -[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts");
  supportsSearchBarCancelButton = 0;
  if (!v21)
    supportsSearchBarCancelButton = self->_supportsSearchBarCancelButton;
  -[UISearchBar setShowsCancelButton:](v20, "setShowsCancelButton:", supportsSearchBarCancelButton);
  -[UISearchBar setContentInset:](self->_searchBar, "setContentInset:", 0.0, 15.0, 0.0, 15.0);
  -[UISearchBar sizeToFit](self->_searchBar, "sizeToFit");
  -[UISearchBar setAccessibilityIdentifier:](self->_searchBar, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FD8]);
  v23 = self->_searchBar;
  if (v15)
  {
    v24 = (_UINavigationControllerPalette *)v4;
  }
  else
  {
    -[UISearchBar bounds](self->_searchBar, "bounds");
    v26 = v25;
    -[PKAddressSearcherViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bounds");
    v29 = v28;

    -[PKAddressSearcherViewController navigationController](self, "navigationController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "paletteForEdge:size:", 2, v29, v26);
    v31 = (_UINavigationControllerPalette *)objc_claimAutoreleasedReturnValue();
    palette = self->_palette;
    self->_palette = v31;

    v24 = self->_palette;
    v23 = self->_searchBar;
  }
  -[_UINavigationControllerPalette addSubview:](v24, "addSubview:", v23);
  v33 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D48]), "initWithFrame:style:", 0, v7, v8, v9, v10);
  tableView = self->_tableView;
  self->_tableView = v33;

  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setKeyboardDismissMode:](self->_tableView, "setKeyboardDismissMode:", 1);
  -[UITableView setSectionHeaderHeight:](self->_tableView, "setSectionHeaderHeight:", 32.0);
  v35 = self->_tableView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](v35, "setBackgroundColor:", v36);

  v37 = self->_tableView;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "lineHeight");
  -[UITableView setEstimatedRowHeight:](v37, "setEstimatedRowHeight:");

  -[UITableView setRowHeight:](self->_tableView, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v4, "addSubview:", self->_tableView);
  if (self->_style == 2)
  {
    PKBridgeAppearanceGetAppearanceSpecifier();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    PKAppearanceApplyToContainer(v39, self->_searchBar);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAddressSearcherViewController;
  -[PKAddressSearcherViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (self->_palette)
  {
    -[PKAddressSearcherViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attachPalette:isPinned:", self->_palette, 0);

  }
  -[UISearchBar becomeFirstResponder](self->_searchBar, "becomeFirstResponder");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAddressSearcherViewController;
  -[PKAddressSearcherViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAddressSearcherViewController;
  -[PKAddressSearcherViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[UISearchBar resignFirstResponder](self->_searchBar, "resignFirstResponder");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAddressSearcherViewController;
  -[PKAddressSearcherViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PKAddressSearchModel endSearch](self->_searchModel, "endSearch");
}

- (void)viewWillLayoutSubviews
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
  double v12;
  double x;
  double v14;
  double y;
  double v16;
  double width;
  double v18;
  double height;
  double v20;
  CGFloat v21;
  PKTableHeaderView *headerView;
  double v23;
  CGFloat v24;
  _UINavigationControllerPalette *palette;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect slice;
  CGRect remainder;
  objc_super v32;
  CGRect v33;

  v32.receiver = self;
  v32.super_class = (Class)PKAddressSearcherViewController;
  -[PKAddressSearcherViewController viewWillLayoutSubviews](&v32, sel_viewWillLayoutSubviews);
  -[PKAddressSearcherViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "bounds");
  x = v7 + v12;
  y = v5 + v14;
  width = v16 - (v7 + v11);
  height = v18 - (v5 + v9);
  remainder.origin.x = x;
  remainder.origin.y = y;
  remainder.size.width = width;
  remainder.size.height = height;
  -[UISearchBar bounds](self->_searchBar, "bounds");
  v21 = v20;
  headerView = self->_headerView;
  if (headerView)
  {
    memset(&slice, 0, sizeof(slice));
    -[PKTableHeaderView sizeThatFits:](headerView, "sizeThatFits:", width, height);
    v24 = v23;
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    CGRectDivide(v33, &slice, &remainder, v24, CGRectMinYEdge);
    -[PKTableHeaderView setFrame:](self->_headerView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    memset(&v29, 0, sizeof(v29));
    CGRectDivide(remainder, &v29, &remainder, v21, CGRectMinYEdge);
    -[UISearchBar setContentInset:](self->_searchBar, "setContentInset:", 0.0, 15.0, 0.0, 15.0);
    -[UISearchBar setFrame:](self->_searchBar, "setFrame:", *(_OWORD *)&v29.origin, *(_OWORD *)&v29.size);
    x = remainder.origin.x;
    y = remainder.origin.y;
    width = remainder.size.width;
    height = remainder.size.height;
  }
  else
  {
    palette = self->_palette;
    if (palette)
    {
      -[_UINavigationControllerPalette frame](palette, "frame");
      -[_UINavigationControllerPalette setFrame:isAnimating:](self->_palette, "setFrame:isAnimating:", objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock"), v26, v27, v28, v21 + 0.0);
    }
  }
  -[UITableView setFrame:](self->_tableView, "setFrame:", x, y, width, height);

}

- (void)_handleCancelButtonTapped:(id)a3
{
  id v4;

  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68538], 0, a3);
  -[PKAddressSearcherViewController setupDelegate](self, "setupDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "viewControllerDidCancelSetupFlow:", self);
  else
    -[PKAddressSearcherViewController _terminateFlow](self, "_terminateFlow");

}

- (void)_terminateFlow
{
  void *v3;
  void *v4;
  id v5;

  -[PKAddressSearcherViewController setupDelegate](self, "setupDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKAddressSearcherViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_showAddressEditorWithContact:(id)a3 withContactErrors:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKAddressEditorViewController *v9;
  void *v10;
  void *v11;
  id v12;
  PKAddressEditorViewController *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_identityVerificationController)
  {
    if (-[PKAddressSearcherViewController _validateContact:](self, "_validateContact:", v6))
    {
      -[PKAddressSearcherViewController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addressSearcherViewController:selectedContact:", self, v6);

      -[PKAddressSearcherViewController _processNextViewController](self, "_processNextViewController");
    }
  }
  else
  {
    v9 = [PKAddressEditorViewController alloc];
    -[PKAddressSearcherViewController requiredKeys](self, "requiredKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = *MEMORY[0x1E0D69BD8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v12 = v7;
    else
      v12 = (id)MEMORY[0x1E0C9AA60];
    v13 = -[PKAddressEditorViewController initWithContact:requiredKeys:highlightedKeys:errors:style:](v9, "initWithContact:requiredKeys:highlightedKeys:errors:style:", v6, v10, v11, v12, self->_style);

    -[PKAddressSearcherViewController title](self, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAddressEditorViewController setTitle:](v13, "setTitle:", v14);

    -[PKAddressEditorViewController setDelegate:](v13, "setDelegate:", self);
    -[PKAddressEditorViewController setContactFormatValidator:](v13, "setContactFormatValidator:", self->_contactFormatValidator);
    -[PKAddressSearcherViewController navigationController](self, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pushViewController:animated:", v13, 1);

  }
}

- (BOOL)_validateContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSSet *supportedCountryCodes;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v4 = a3;
  if (v4 && -[NSSet count](self->_supportedCountryCodes, "count"))
  {
    objc_msgSend(v4, "postalAddresses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "ISOCountryCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSSet containsObject:](self->_supportedCountryCodes, "containsObject:", v8);
    if (!v9)
    {
      supportedCountryCodes = self->_supportedCountryCodes;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("US"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(supportedCountryCodes) = -[NSSet isEqualToSet:](supportedCountryCodes, "isEqualToSet:", v11);

      if ((_DWORD)supportedCountryCodes)
      {
        PKLocalizedPaymentString(CFSTR("ADDRESS_NOT_SUPPORTED_TITLE"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("ADDRESS_NOT_SUPPORTED_MESSAGE_US"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        PKDisplayableErrorCustom();
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = PKAlertForDisplayableErrorWithHandlers(v14, 0, 0, 0);
        -[PKAddressSearcherViewController navigationController](self, "navigationController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "presentViewController:animated:completion:", v15, 1, 0);

      }
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)_processNextViewController
{
  PKPeerPaymentIdentityVerificationController *identityVerificationController;
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  identityVerificationController = self->_identityVerificationController;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__PKAddressSearcherViewController__processNextViewController__block_invoke;
  v4[3] = &unk_1E3E61E48;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  -[PKPeerPaymentIdentityVerificationController nextViewControllerWithCompletion:](identityVerificationController, "nextViewControllerWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __61__PKAddressSearcherViewController__processNextViewController__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20[2];

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__PKAddressSearcherViewController__processNextViewController__block_invoke_2;
  v16[3] = &unk_1E3E6FEA8;
  objc_copyWeak(v20, (id *)(a1 + 40));
  v12 = *(_QWORD *)(a1 + 32);
  v20[1] = a5;
  v16[4] = v12;
  v17 = v9;
  v18 = v11;
  v19 = v10;
  v13 = v10;
  v14 = v11;
  v15 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v16);

  objc_destroyWeak(v20);
}

void __61__PKAddressSearcherViewController__processNextViewController__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  dispatch_time_t v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040) = *(_QWORD *)(a1 + 72);
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(WeakRetained, "navigationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = *(_QWORD *)(a1 + 40);
LABEL_4:
      objc_msgSend(v5, "pushViewController:animated:", v7, 1);
LABEL_7:

      goto LABEL_8;
    }
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __61__PKAddressSearcherViewController__processNextViewController__block_invoke_3;
      v19[3] = &unk_1E3E612E8;
      v19[4] = v4;
      v8 = PKAlertForDisplayableErrorWithHandlers(v6, 0, v19, 0);
      objc_msgSend(v4, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);

      goto LABEL_7;
    }
    v10 = *(void **)(a1 + 56);
    if (v10)
    {
      objc_msgSend(v10, "explanationView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDelegate:", v4);

      objc_msgSend(v4, "navigationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = *(_QWORD *)(a1 + 56);
      goto LABEL_4;
    }
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040) == 1)
    {
      objc_msgSend(v4, "headerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "checkmarkLayer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setRevealed:animated:", 1, 0);

      PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_VERIFIED"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHeaderTitle:", v14);

      objc_msgSend(v4, "setHeaderSubtitle:", &stru_1E3E7D690);
      objc_msgSend(v12, "setNeedsLayout");
      objc_msgSend(*(id *)(a1 + 32), "_setNavigationBarEnabled:", 0);
      objc_msgSend(*(id *)(a1 + 32), "_removeNavigationBarButtonItems");
      objc_msgSend(*(id *)(a1 + 32), "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setUserInteractionEnabled:", 0);

      v16 = dispatch_time(0, 1000000000);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __61__PKAddressSearcherViewController__processNextViewController__block_invoke_4;
      v17[3] = &unk_1E3E61310;
      objc_copyWeak(&v18, v2);
      dispatch_after(v16, MEMORY[0x1E0C80D38], v17);
      objc_destroyWeak(&v18);

    }
  }
LABEL_8:

}

uint64_t __61__PKAddressSearcherViewController__processNextViewController__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

void __61__PKAddressSearcherViewController__processNextViewController__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_terminateFlow");
    WeakRetained = v2;
  }

}

- (void)_updateSectionMapping
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *sectionMapping;
  id v9;

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[NSArray count](self->_contactsSearchResults, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", &unk_1E3FAD690, v3);

    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  if (-[NSArray count](self->_completionSearchResults, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", &unk_1E3FAD6A8, v5);

    ++v4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", &unk_1E3FAD6C0, v6);

  v7 = (NSDictionary *)objc_msgSend(v9, "copy");
  sectionMapping = self->_sectionMapping;
  self->_sectionMapping = v7;

}

- (void)setHeaderTitle:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  BOOL v8;
  void *v9;
  NSString *v10;

  v5 = a3;
  v6 = self->_headerTitle;
  v7 = (NSString *)v5;
  v10 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_headerTitle, a3);
    -[PKTableHeaderView titleLabel](self->_headerView, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", self->_headerTitle);

    -[PKTableHeaderView setNeedsLayout](self->_headerView, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setHeaderSubtitle:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  BOOL v8;
  void *v9;
  NSString *v10;

  v5 = a3;
  v6 = self->_headerSubtitle;
  v7 = (NSString *)v5;
  v10 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_headerSubtitle, a3);
    -[PKTableHeaderView subtitleLabel](self->_headerView, "subtitleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", self->_headerSubtitle);

    -[PKTableHeaderView setNeedsLayout](self->_headerView, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setSupportsSearchBarCancelButton:(BOOL)a3
{
  if (self->_supportsSearchBarCancelButton != a3)
  {
    self->_supportsSearchBarCancelButton = a3;
    -[PKAddressSearcherViewController _updateNavigationButtons](self, "_updateNavigationButtons");
  }
}

- (void)_updateNavigationButtons
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[PKAddressSearcherViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (self->_identityVerificationController)
    v5 = 0;
  else
    v5 = (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  if (v5)
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__handleCancelButtonTapped_);
    -[PKAddressSearcherViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItem:", v9);
  }
  else
  {
    if (v4 == 6)
    {
      v6 = objc_alloc(MEMORY[0x1E0DC34F0]);
      v7 = 24;
    }
    else
    {
      if (self->_supportsSearchBarCancelButton)
        return;
      v6 = objc_alloc(MEMORY[0x1E0DC34F0]);
      v7 = 1;
    }
    v9 = (id)objc_msgSend(v6, "initWithBarButtonSystemItem:target:action:", v7, self, sel__handleCancelButtonTapped_);
    -[PKAddressSearcherViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeftBarButtonItem:", v9);
  }

}

- (void)_setNavigationBarEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[PKAddressSearcherViewController navigationController](self, "navigationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

  objc_msgSend(v10, "interactivePopGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

  -[PKAddressSearcherViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3);

  objc_msgSend(v7, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v3);

}

- (void)_removeNavigationBarButtonItems
{
  void *v3;
  void *v4;
  id v5;

  -[PKAddressSearcherViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItem:", 0);

  -[PKAddressSearcherViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", 0);

  -[PKAddressSearcherViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidesBackButton:", 1);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSDictionary count](self->_sectionMapping, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  NSDictionary *sectionMapping;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;

  sectionMapping = self->_sectionMapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](sectionMapping, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "unsignedIntegerValue");
    if (v8)
    {
      if (v8 == 1)
        v9 = -[NSArray count](self->_completionSearchResults, "count");
      else
        v9 = v8 == 2;
    }
    else
    {
      v10 = -[NSArray count](self->_contactsSearchResults, "count");
      if (v10 >= 4)
        v9 = 4;
      else
        v9 = v10;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)tableView:(id)a3 wantsHeaderForSection:(int64_t)a4
{
  NSDictionary *sectionMapping;
  void *v6;
  void *v7;
  uint64_t v8;
  int *v9;
  BOOL v10;

  sectionMapping = self->_sectionMapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](sectionMapping, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "unsignedIntegerValue");
    if (!v8)
    {
      v9 = &OBJC_IVAR___PKAddressSearcherViewController__contactsSearchResults;
      goto LABEL_7;
    }
    if (v8 == 1)
    {
      v9 = &OBJC_IVAR___PKAddressSearcherViewController__completionSearchResults;
LABEL_7:
      v10 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v9), "count") != 0;
      goto LABEL_8;
    }
  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  NSDictionary *sectionMapping;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;

  sectionMapping = self->_sectionMapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](sectionMapping, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
    if (!v7)
    {
      v8 = CFSTR("CONTACTS");
      goto LABEL_7;
    }
    if (v7 == 1)
    {
      v8 = CFSTR("LOCATIONS");
LABEL_7:
      PKLocalizedString(&v8->isa);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  v9 = 0;
LABEL_8:

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 32.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSDictionary *sectionMapping;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void **v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v6 = a3;
  v7 = a4;
  sectionMapping = self->_sectionMapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](sectionMapping, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0DC3D50]);
    goto LABEL_20;
  }
  v11 = objc_msgSend(v10, "unsignedIntegerValue");
  if (v11)
  {
    if (v11 != 1)
    {
      if (v11 == 2)
      {
        objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("Manual"));
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (!v12)
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("Manual"));
        objc_msgSend(v12, "textLabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ENTER_ADDRESS_MANUALLY"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setText:", v14);

        objc_msgSend(v12, "detailTextLabel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setText:", 0);

        PKAccessibilityIDCellSet(v12, (void *)*MEMORY[0x1E0D67B50]);
      }
      else
      {
        v12 = objc_alloc_init(MEMORY[0x1E0DC3D50]);
      }
      goto LABEL_17;
    }
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("Address"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("Address"));
    -[NSArray objectAtIndex:](self->_completionSearchResults, "objectAtIndex:", objc_msgSend(v7, "row"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "title");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v23);

    objc_msgSend(v12, "detailTextLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "subtitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setText:", v25);

    v21 = (void **)MEMORY[0x1E0D67D30];
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("Address"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("Address"));
    -[NSArray objectAtIndex:](self->_contactsSearchResults, "objectAtIndex:", objc_msgSend(v7, "row"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pk_displayName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v18);

    objc_msgSend(v12, "detailTextLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pkSingleLineFormattedContactAddress");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v20);

    v21 = (void **)MEMORY[0x1E0D67A30];
  }
  PKAccessibilityIDCellSet(v12, *v21);

LABEL_17:
  if (self->_style == 2)
  {
    PKBridgeAppearanceGetAppearanceSpecifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PKAppearanceApplyToContainer(v26, v12);

  }
  objc_msgSend(v12, "setAccessoryType:", 1);
  objc_msgSend(v12, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBackgroundColor:", v28);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v29);

LABEL_20:
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSDictionary *sectionMapping;
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
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
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
  uint8_t buf[16];
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  sectionMapping = self->_sectionMapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](sectionMapping, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_msgSend(v10, "unsignedIntegerValue");
    if (v11)
    {
      if (v11 != 1)
      {
        if (v11 == 2)
        {
          -[PKAddressSearchModel endSearch](self->_searchModel, "endSearch");
          if (self->_identityVerificationController)
          {
            v12 = 0;
          }
          else
          {
            v24 = objc_alloc_init(MEMORY[0x1E0C97378]);
            -[UISearchBar text](self->_searchBar, "text");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setStreet:", v25);

            PKCurrentRegion();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setISOCountryCode:", v26);

            objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "ISOCountryCode");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedStringForCountryCode();
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v24, "setCountry:", v29);
            v30 = (void *)MEMORY[0x1E0C97338];
            PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_DEFAULT_ADDRESS_LABEL"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (void *)objc_msgSend(v24, "copy");
            objc_msgSend(v30, "labeledValueWithLabel:value:", v31, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            v34 = (void *)MEMORY[0x1E0C97200];
            v39[0] = v33;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "pkContactWithNameComponents:postalAddresses:emailAddresses:phoneNumbers:", 0, v35, 0, 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

          }
          -[PKAddressSearcherViewController _showAddressEditorWithContact:withContactErrors:](self, "_showAddressEditorWithContact:withContactErrors:", v12, 0);

        }
        goto LABEL_30;
      }
      -[NSArray objectAtIndex:](self->_completionSearchResults, "objectAtIndex:", objc_msgSend(v7, "row"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAddressSearchModel selectMapSearchCompletion:](self->_searchModel, "selectMapSearchCompletion:", v14);
LABEL_29:

LABEL_30:
      objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
      goto LABEL_31;
    }
    -[NSArray objectAtIndex:](self->_contactsSearchResults, "objectAtIndex:", objc_msgSend(v7, "row"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pkContactWithCleanedUpCountryCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "postalAddresses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ISOCountryCode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)-[PKContactFormatValidator checkPostalAddressFormat:](self->_contactFormatValidator, "checkPostalAddressFormat:", v17);
    if (objc_msgSend(v18, "length") == 2)
    {
      v37 = v16;
      if (objc_msgSend(v18, "caseInsensitiveCompare:", CFSTR("cn"))
        || (objc_msgSend(v17, "subLocality"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v21 = objc_msgSend(v20, "length"),
            v20,
            v21))
      {
        if (!v19)
        {
          v16 = v37;
          if (-[PKAddressSearcherViewController _validateContact:](self, "_validateContact:", v14))
          {
            -[PKAddressSearcherViewController delegate](self, "delegate");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "addressSearcherViewController:selectedContact:", self, v14);

            v16 = v37;
            if (self->_identityVerificationController)
              -[PKAddressSearcherViewController _processNextViewController](self, "_processNextViewController");
          }
          goto LABEL_28;
        }
        PKLogFacilityTypeGetObject();
        v22 = objc_claimAutoreleasedReturnValue();
        v16 = v37;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v22, OS_LOG_TYPE_DEFAULT, "Selected address has invalid format", buf, 2u);
        }

        goto LABEL_26;
      }
      PKLogFacilityTypeGetObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v23, OS_LOG_TYPE_DEFAULT, "Selected address was in China and missing a sublocality, redirecting to the edit flow for confirmation", buf, 2u);
      }
      v16 = v37;
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v23, OS_LOG_TYPE_DEFAULT, "Unable to derive a country code, redirecting to the edit flow for confirmation", buf, 2u);
      }
    }

    if (!v19)
    {
LABEL_27:
      -[PKAddressSearcherViewController _showAddressEditorWithContact:withContactErrors:](self, "_showAddressEditorWithContact:withContactErrors:", v14, v19);

LABEL_28:
      goto LABEL_29;
    }
LABEL_26:
    PKContactFormatErrorsFromShippingAddressFormatErrors();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
LABEL_31:

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5;
  void *v6;
  id v7;

  -[PKAddressSearchModel endSearch](self->_searchModel, "endSearch", a3, a4);
  v5 = objc_alloc(MEMORY[0x1E0D66A48]);
  -[UISearchBar text](self->_searchBar, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "initWithFullText:", v6);

  objc_msgSend(v7, "setOutputKey:", *MEMORY[0x1E0C967F0]);
  -[PKAddressSearchModel beginSearch:](self->_searchModel, "beginSearch:", v7);

}

- (void)mapSearchUpdated:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "completionSearchResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Map search updated: %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__PKAddressSearcherViewController_mapSearchUpdated___block_invoke;
  v8[3] = &unk_1E3E61388;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __52__PKAddressSearcherViewController_mapSearchUpdated___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1120), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateSectionMapping");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "reloadData");
}

- (void)contactsSearchUpdated:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "contactsSearchResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Contacts search updated: %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__PKAddressSearcherViewController_contactsSearchUpdated___block_invoke;
  v8[3] = &unk_1E3E61388;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __57__PKAddressSearcherViewController_contactsSearchUpdated___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1128), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateSectionMapping");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "reloadData");
}

- (void)selectedAddress:(id)a3 withError:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Selected address: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PKAddressSearcherViewController _showAddressEditorWithContact:withContactErrors:](self, "_showAddressEditorWithContact:withContactErrors:", v5, 0);
}

- (void)addressEditorViewController:(id)a3 selectedContact:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Editor inputted address: %@", (uint8_t *)&v10, 0xCu);
  }

  if (-[PKAddressSearcherViewController _validateContact:](self, "_validateContact:", v7))
  {
    -[PKAddressSearcherViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addressSearcherViewController:selectedContact:", self, v7);

  }
}

- (void)addressEditorViewControllerDidCancel:(id)a3
{
  id v4;

  -[PKAddressSearcherViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addressSearcherViewControllerDidCancel:", self);

}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  PKPeerPaymentAccountResolutionController *v18;
  NSObject *v19;
  _QWORD v20[5];
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  switch(self->_identityVerificationError)
  {
    case 2uLL:
      PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_TITLE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_MESSAGE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustom();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __68__PKAddressSearcherViewController_explanationViewDidSelectContinue___block_invoke_84;
      v20[3] = &unk_1E3E612E8;
      v20[4] = self;
      v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, v20, 0);
      -[PKAddressSearcherViewController navigationController](self, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "presentViewController:animated:completion:", v9, 1, 0);

      goto LABEL_8;
    case 3uLL:
      objc_msgSend(v4, "dockView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setButtonsEnabled:", 0);

      objc_msgSend(v5, "dockView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "primaryButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setShowSpinner:", 1);

      objc_msgSend(v5, "dockView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "footerView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setButtonsEnabled:", 0);

      -[PKAddressSearcherViewController _processNextViewController](self, "_processNextViewController");
      break;
    case 5uLL:
      -[PKPeerPaymentIdentityVerificationController webService](self->_identityVerificationController, "webService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "peerPaymentService");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "account");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v17 = objc_alloc_init(MEMORY[0x1E0D66F18]);
      v18 = -[PKPeerPaymentAccountResolutionController initWithAccount:webService:context:delegate:passLibraryDataProvider:]([PKPeerPaymentAccountResolutionController alloc], "initWithAccount:webService:context:delegate:passLibraryDataProvider:", v9, v8, -[PKPeerPaymentIdentityVerificationController context](self->_identityVerificationController, "context"), self, v17);
      PKLogFacilityTypeGetObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v19, OS_LOG_TYPE_DEFAULT, "Presenting contact apple support alert...", buf, 2u);
      }

      MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68540], 0);
      -[PKPeerPaymentAccountResolutionController presentFlowForAccountResolution:configuration:completion:](v18, "presentFlowForAccountResolution:configuration:completion:", 3, 0, &__block_literal_global_127);

LABEL_8:
      break;
    default:
      -[PKAddressSearcherViewController _terminateFlow](self, "_terminateFlow");
      break;
  }

}

void __68__PKAddressSearcherViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("NO");
    if (a2)
      v4 = CFSTR("YES");
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Presented contact apple support alert with success %@", (uint8_t *)&v5, 0xCu);
  }

}

uint64_t __68__PKAddressSearcherViewController_explanationViewDidSelectContinue___block_invoke_84(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCancelButtonTapped:", 0);
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  -[PKAddressSearcherViewController _handleCancelButtonTapped:](self, "_handleCancelButtonTapped:", 0);
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  -[PKAddressSearcherViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, a5, 0);
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  -[PKAddressSearcherViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (PKAddressSearcherViewControllerDelegate)delegate
{
  return (PKAddressSearcherViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)requiredKeys
{
  return self->_requiredKeys;
}

- (void)setRequiredKeys:(id)a3
{
  objc_storeStrong((id *)&self->_requiredKeys, a3);
}

- (PKContactFormatValidator)contactFormatValidator
{
  return self->_contactFormatValidator;
}

- (void)setContactFormatValidator:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatValidator, a3);
}

- (NSSet)supportedCountryCodes
{
  return self->_supportedCountryCodes;
}

- (void)setSupportedCountryCodes:(id)a3
{
  objc_storeStrong((id *)&self->_supportedCountryCodes, a3);
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (BOOL)supportsSearchBarCancelButton
{
  return self->_supportsSearchBarCancelButton;
}

- (PKPeerPaymentIdentityVerificationController)identityVerificationController
{
  return self->_identityVerificationController;
}

- (void)setIdentityVerificationController:(id)a3
{
  objc_storeStrong((id *)&self->_identityVerificationController, a3);
}

- (unint64_t)identityVerificationError
{
  return self->_identityVerificationError;
}

- (void)setIdentityVerificationError:(unint64_t)a3
{
  self->_identityVerificationError = a3;
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (void)setSetupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_setupDelegate, a3);
}

- (PKTableHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
{
  objc_storeStrong((id *)&self->_searchBar, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (_UINavigationControllerPalette)palette
{
  return self->_palette;
}

- (void)setPalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);
}

- (PKAddressSearchModel)searchModel
{
  return self->_searchModel;
}

- (void)setSearchModel:(id)a3
{
  objc_storeStrong((id *)&self->_searchModel, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (CNPostalAddress)selectedAddress
{
  return self->_selectedAddress;
}

- (void)setSelectedAddress:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAddress, a3);
}

- (NSDictionary)sectionMapping
{
  return self->_sectionMapping;
}

- (void)setSectionMapping:(id)a3
{
  objc_storeStrong((id *)&self->_sectionMapping, a3);
}

- (NSArray)completionSearchResults
{
  return self->_completionSearchResults;
}

- (void)setCompletionSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_completionSearchResults, a3);
}

- (NSArray)contactsSearchResults
{
  return self->_contactsSearchResults;
}

- (void)setContactsSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_contactsSearchResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsSearchResults, 0);
  objc_storeStrong((id *)&self->_completionSearchResults, 0);
  objc_storeStrong((id *)&self->_sectionMapping, 0);
  objc_storeStrong((id *)&self->_selectedAddress, 0);
  objc_storeStrong((id *)&self->_searchModel, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_identityVerificationController, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_supportedCountryCodes, 0);
  objc_storeStrong((id *)&self->_contactFormatValidator, 0);
  objc_storeStrong((id *)&self->_requiredKeys, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
