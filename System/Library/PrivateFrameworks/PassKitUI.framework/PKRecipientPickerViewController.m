@implementation PKRecipientPickerViewController

- (PKRecipientPickerViewController)initWithTransactionSourceCollection:(id)a3 peerPaymentSendFlowType:(int64_t)a4
{
  return -[PKRecipientPickerViewController initWithTransactionSourceCollection:familyCollection:peerPaymentSendFlowType:](self, "initWithTransactionSourceCollection:familyCollection:peerPaymentSendFlowType:", a3, 0, a4);
}

- (PKRecipientPickerViewController)initWithTransactionSourceCollection:(id)a3 familyCollection:(id)a4 peerPaymentSendFlowType:(int64_t)a5
{
  id v9;
  id v10;
  PKRecipientPickerViewController *v11;
  PKRecipientPickerViewController *v12;
  uint64_t v13;
  NSString *title;
  uint64_t v15;
  PKContactResolver *contactResolver;
  NSNumber *currentTaskID;
  NSArray *autocompleteResults;
  double *v19;
  CGSize v20;
  UIView *v21;
  UIView *containerView;
  CNComposeRecipientTextView *v23;
  CNComposeRecipientTextView *recipientTextView;
  void *v25;
  CNAutocompleteResultsTableViewController *v26;
  CNAutocompleteResultsTableViewController *resultsViewController;
  uint64_t v28;
  CNAutocompleteSearchManager *searchManager;
  NSString *currentRecipientText;
  id v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  UICollectionView *suggestionsView;
  uint64_t v39;
  PKDashboardTransactionFetcher *transactionFetcher;
  PKDashboardTitleHeaderView *v41;
  PKDashboardTitleHeaderView *sampleHeaderView;
  PKThumbnailCollectionViewCell *v43;
  PKThumbnailCollectionViewCell *sampleThumbnailCell;
  PKNearbyPeerPaymentEntryCollectionViewCell *v45;
  PKNearbyPeerPaymentEntryCollectionViewCell *sampleNearbyCell;
  PKNearbyPeerPaymentEntryCollectionViewHeaderView *v47;
  PKNearbyPeerPaymentEntryCollectionViewHeaderView *sampleNearbyHeaderView;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  PKContactFormatValidator *contactFormatValidator;
  void *v55;
  uint64_t v56;
  PKPeerPaymentController *peerPaymentController;
  void *v58;
  void *v59;
  objc_super v61;

  v9 = a3;
  v10 = a4;
  v61.receiver = self;
  v61.super_class = (Class)PKRecipientPickerViewController;
  v11 = -[PKRecipientPickerViewController init](&v61, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_transactionSourceCollection, a3);
    objc_storeStrong((id *)&v12->_familyCollection, a4);
    v12->_peerPaymentSendFlowType = a5;
    if (a5 == 2)
    {
      PKLocalizedPeerPaymentRecurringString(CFSTR("RECIPIENT_PICKER_TITLE"));
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a5 != 1)
      {
LABEL_7:
        objc_msgSend(MEMORY[0x1E0D66C60], "defaultContactResolver");
        v15 = objc_claimAutoreleasedReturnValue();
        contactResolver = v12->_contactResolver;
        v12->_contactResolver = (PKContactResolver *)v15;

        currentTaskID = v12->_currentTaskID;
        v12->_currentTaskID = 0;

        autocompleteResults = v12->_autocompleteResults;
        v12->_autocompleteResults = 0;

        v19 = (double *)MEMORY[0x1E0C9D648];
        v20 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
        v12->_keyboardFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
        v12->_keyboardFrame.size = v20;
        v12->_keyboardVisible = 0;
        v21 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        containerView = v12->_containerView;
        v12->_containerView = v21;

        v23 = (CNComposeRecipientTextView *)objc_alloc_init(MEMORY[0x1E0D136B0]);
        recipientTextView = v12->_recipientTextView;
        v12->_recipientTextView = v23;

        -[CNComposeRecipientTextView setDelegate:](v12->_recipientTextView, "setDelegate:", v12);
        -[CNComposeRecipientTextView setMaxRecipients:](v12->_recipientTextView, "setMaxRecipients:", 1);
        -[CNComposeRecipientTextView textView](v12->_recipientTextView, "textView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setKeyboardAppearance:", 1);

        -[CNComposeRecipientTextView setAccessibilityIdentifier:](v12->_recipientTextView, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F30]);
        v26 = (CNAutocompleteResultsTableViewController *)objc_alloc_init(MEMORY[0x1E0D13640]);
        resultsViewController = v12->_resultsViewController;
        v12->_resultsViewController = v26;

        -[CNAutocompleteResultsTableViewController setDelegate:](v12->_resultsViewController, "setDelegate:", v12);
        v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0D13658]), "initWithAutocompleteSearchType:", 1);
        searchManager = v12->_searchManager;
        v12->_searchManager = (CNAutocompleteSearchManager *)v28;

        -[CNAutocompleteSearchManager setShouldIncludeGroupResults:](v12->_searchManager, "setShouldIncludeGroupResults:", 0);
        -[CNAutocompleteSearchManager setFetchDelegate:](v12->_searchManager, "setFetchDelegate:", v12);
        currentRecipientText = v12->_currentRecipientText;
        v12->_currentRecipientText = (NSString *)&stru_1E3E7D690;

        v31 = objc_alloc_init(MEMORY[0x1E0DC3610]);
        v32 = objc_alloc(MEMORY[0x1E0DC35B8]);
        v33 = *v19;
        v34 = v19[1];
        v35 = v19[2];
        v36 = v19[3];
        v37 = objc_msgSend(v32, "initWithFrame:collectionViewLayout:", v31, *v19, v34, v35, v36);
        suggestionsView = v12->_suggestionsView;
        v12->_suggestionsView = (UICollectionView *)v37;

        -[UICollectionView setDataSource:](v12->_suggestionsView, "setDataSource:", v12);
        -[UICollectionView setDelegate:](v12->_suggestionsView, "setDelegate:", v12);
        v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66C98]), "initWithTransactionType:transactionSourceCollection:paymentDataProvider:", 3, v9, 0);
        transactionFetcher = v12->_transactionFetcher;
        v12->_transactionFetcher = (PKDashboardTransactionFetcher *)v39;

        -[PKDashboardTransactionFetcher setDelegate:](v12->_transactionFetcher, "setDelegate:", v12);
        v41 = -[PKDashboardTitleHeaderView initWithFrame:]([PKDashboardTitleHeaderView alloc], "initWithFrame:", v33, v34, v35, v36);
        sampleHeaderView = v12->_sampleHeaderView;
        v12->_sampleHeaderView = v41;

        v43 = -[PKThumbnailCollectionViewCell initWithFrame:]([PKThumbnailCollectionViewCell alloc], "initWithFrame:", v33, v34, v35, v36);
        sampleThumbnailCell = v12->_sampleThumbnailCell;
        v12->_sampleThumbnailCell = v43;

        v45 = -[PKNearbyPeerPaymentEntryCollectionViewCell initWithFrame:]([PKNearbyPeerPaymentEntryCollectionViewCell alloc], "initWithFrame:", v33, v34, v35, v36);
        sampleNearbyCell = v12->_sampleNearbyCell;
        v12->_sampleNearbyCell = v45;

        v47 = -[PKNearbyPeerPaymentEntryCollectionViewHeaderView initWithFrame:]([PKNearbyPeerPaymentEntryCollectionViewHeaderView alloc], "initWithFrame:", v33, v34, v35, v36);
        sampleNearbyHeaderView = v12->_sampleNearbyHeaderView;
        v12->_sampleNearbyHeaderView = v47;

        objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "context");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "configuration");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "contactFormatConfiguration");
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66C50]), "initWithConfiguration:", v52);
        contactFormatValidator = v12->_contactFormatValidator;
        v12->_contactFormatValidator = (PKContactFormatValidator *)v53;

        objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(objc_alloc(MEMORY[0x1E0D673F8]), "initWithPeerPaymentWebService:", v55);
        peerPaymentController = v12->_peerPaymentController;
        v12->_peerPaymentController = (PKPeerPaymentController *)v56;

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "addObserver:selector:name:object:", v12, sel__keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);
        objc_msgSend(v58, "addObserver:selector:name:object:", v12, sel__keyboardWillChange_, *MEMORY[0x1E0DC4FD8], 0);
        objc_msgSend(v58, "addObserver:selector:name:object:", v12, sel__keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);
        -[PKRecipientPickerViewController setOverrideUserInterfaceStyle:](v12, "setOverrideUserInterfaceStyle:", 2);
        -[PKRecipientPickerViewController _generateSuggestions](v12, "_generateSuggestions");
        objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", *MEMORY[0x1E0D6B138], 0, 1);
        objc_msgSend(v59, "prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", *MEMORY[0x1E0D6B130], 0, 1);

        goto LABEL_8;
      }
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_WALLET_ACTION_HEADER"));
      v13 = objc_claimAutoreleasedReturnValue();
    }
    title = v12->_title;
    v12->_title = (NSString *)v13;

    goto LABEL_7;
  }
LABEL_8:

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unloadDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", *MEMORY[0x1E0D6B138], 0, 1);
  objc_msgSend(v3, "unloadDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", *MEMORY[0x1E0D6B130], 0, 1);

  v4.receiver = self;
  v4.super_class = (Class)PKRecipientPickerViewController;
  -[PKRecipientPickerViewController dealloc](&v4, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKRecipientPickerViewController;
  -[PKRecipientPickerViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[PKRecipientPickerViewController setUpNavigationBar](self, "setUpNavigationBar");
  -[CNComposeRecipientTextView text](self->_recipientTextView, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", self->_currentRecipientText);

  if ((v5 & 1) == 0)
  {
    -[CNComposeRecipientTextView textView](self->_recipientTextView, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", self->_currentRecipientText);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)PKRecipientPickerViewController;
  -[PKRecipientPickerViewController viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  -[CNComposeRecipientTextView becomeFirstResponder](self->_recipientTextView, "becomeFirstResponder");
  if (self->_peerPaymentSendFlowType == 1)
  {
    v4 = (void *)MEMORY[0x1E0D66A58];
    v5 = *MEMORY[0x1E0D698D0];
    v6 = *MEMORY[0x1E0D69298];
    v7 = *MEMORY[0x1E0D68F50];
    v13[0] = *MEMORY[0x1E0D68C90];
    v13[1] = v7;
    v8 = *MEMORY[0x1E0D69308];
    v14[0] = v6;
    v14[1] = v8;
    v9 = *MEMORY[0x1E0D692A8];
    v13[2] = *MEMORY[0x1E0D68AA0];
    v13[3] = v9;
    v10 = *MEMORY[0x1E0D692B0];
    v14[2] = *MEMORY[0x1E0D68C50];
    v14[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subject:sendEvent:", v5, v11);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)PKRecipientPickerViewController;
  -[PKRecipientPickerViewController viewDidDisappear:](&v12, sel_viewDidDisappear_, a3);
  if (self->_peerPaymentSendFlowType == 1)
  {
    v4 = (void *)MEMORY[0x1E0D66A58];
    v5 = *MEMORY[0x1E0D698D0];
    v6 = *MEMORY[0x1E0D69298];
    v7 = *MEMORY[0x1E0D68F50];
    v13[0] = *MEMORY[0x1E0D68C90];
    v13[1] = v7;
    v8 = *MEMORY[0x1E0D69308];
    v14[0] = v6;
    v14[1] = v8;
    v9 = *MEMORY[0x1E0D692A8];
    v13[2] = *MEMORY[0x1E0D68AA0];
    v13[3] = v9;
    v10 = *MEMORY[0x1E0D692B0];
    v14[2] = *MEMORY[0x1E0D68C58];
    v14[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subject:sendEvent:", v5, v11);

  }
}

- (void)loadView
{
  void *v3;
  void *v4;
  CNComposeRecipientTextView *recipientTextView;
  void *v6;
  void *v7;
  void *v8;
  UICollectionView *suggestionsView;
  void *v10;
  UICollectionView *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKRecipientPickerViewController;
  -[PKRecipientPickerViewController loadView](&v17, sel_loadView);
  -[PKRecipientPickerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "addSubview:", self->_containerView);
  recipientTextView = self->_recipientTextView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView setBackgroundColor:](recipientTextView, "setBackgroundColor:", v6);

  -[CNAutocompleteResultsTableViewController view](self->_resultsViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  -[UIView addSubview:](self->_containerView, "addSubview:", self->_recipientTextView);
  -[UIView addSubview:](self->_containerView, "addSubview:", v7);
  -[CNAutocompleteResultsTableViewController didMoveToParentViewController:](self->_resultsViewController, "didMoveToParentViewController:", self);
  -[PKRecipientPickerViewController addChildViewController:](self, "addChildViewController:", self->_resultsViewController);
  suggestionsView = self->_suggestionsView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](suggestionsView, "setBackgroundColor:", v10);

  -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_suggestionsView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PKDashboardRecipientPickerSuggestionsThumbnailCellIdentifier"));
  v11 = self->_suggestionsView;
  v12 = objc_opt_class();
  v13 = *MEMORY[0x1E0DC48A8];
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v11, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v12, *MEMORY[0x1E0DC48A8], CFSTR("PKDashboardRecipientPickerNearbyHeaderIdentifier"));
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_suggestionsView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PKDashboardRecipientPickerNearbyCellIdentifier"));
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](self->_suggestionsView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), v13, CFSTR("PKDashboardRecipientPickerFamilySuggestionsTitleIdentifier"));
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](self->_suggestionsView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), v13, CFSTR("PKDashboardRecipientPickerSuggestionsTitleIdentifier"));
  -[UICollectionView setContentInset:](self->_suggestionsView, "setContentInset:", 8.0, 16.0, 8.0, 16.0);
  -[PKRecipientPickerViewController traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "userInterfaceIdiom");

  if (v15 == 1)
    -[UICollectionView setKeyboardDismissMode:](self->_suggestionsView, "setKeyboardDismissMode:", 1);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_suggestionsView);
  -[PKRecipientPickerViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F38]);

}

- (void)viewDidLayoutSubviews
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
  double v13;
  double v14;
  double v15;
  CNComposeRecipientTextView *recipientTextView;
  double v17;
  double v18;
  double v19;
  CNComposeRecipientTextView *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _BOOL4 v24;
  void *v25;
  double v26;
  double v27;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxY;
  uint64_t v33;
  uint64_t v34;
  UICollectionView *suggestionsView;
  CGFloat v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  -[PKRecipientPickerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (!-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))v11 = v11 - self->_keyboardFrame.size.height;
  -[UIView setFrame:](self->_containerView, "setFrame:", v5, v7, v9, v11);
  -[UIView setPreservesSuperviewLayoutMargins:](self->_containerView, "setPreservesSuperviewLayoutMargins:", 1);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView bounds](self->_containerView, "bounds");
  v13 = v12;
  v15 = v14;
  recipientTextView = self->_recipientTextView;
  -[UIView safeAreaInsets](self->_containerView, "safeAreaInsets");
  v18 = v17;
  objc_msgSend(MEMORY[0x1E0D136B0], "preferredHeight");
  -[CNComposeRecipientTextView setFrame:](recipientTextView, "setFrame:", 0.0, v18, v13, v19);
  v20 = self->_recipientTextView;
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_WALLET_ACTION_RECIPIENT_LABEL"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView setLabel:](v20, "setLabel:", v21);

  -[CNComposeRecipientTextView recipients](self->_recipientTextView, "recipients");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  v24 = -[PKRecipientPickerViewController _isRecipientTextViewEmpty](self, "_isRecipientTextViewEmpty");
  -[CNAutocompleteResultsTableViewController view](self->_resultsViewController, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView safeAreaInsets](self->_containerView, "safeAreaInsets");
  v27 = v26;
  -[CNComposeRecipientTextView frame](self->_recipientTextView, "frame");
  x = v38.origin.x;
  y = v38.origin.y;
  width = v38.size.width;
  height = v38.size.height;
  MaxY = CGRectGetMaxY(v38);
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  objc_msgSend(v25, "setFrame:", 0.0, MaxY, v13, v27 + v15 - CGRectGetMaxY(v39));
  if (v23)
    v33 = 1;
  else
    v33 = v24;
  if (v23)
    v34 = 1;
  else
    v34 = !v24;
  objc_msgSend(v25, "setHidden:", v33);
  suggestionsView = self->_suggestionsView;
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  v36 = CGRectGetMaxY(v40);
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  v42.size.height = v27 + v15 - CGRectGetMaxY(v41);
  v42.origin.x = 0.0;
  v42.origin.y = v36;
  v42.size.width = v13;
  v43 = CGRectInset(v42, 4.0, 0.0);
  -[UICollectionView setFrame:](suggestionsView, "setFrame:", v43.origin.x, v43.origin.y, v43.size.width, v43.size.height);
  -[UICollectionView setHidden:](self->_suggestionsView, "setHidden:", v34);
  v37.receiver = self;
  v37.super_class = (Class)PKRecipientPickerViewController;
  -[PKRecipientPickerViewController viewDidLayoutSubviews](&v37, sel_viewDidLayoutSubviews);

}

- (void)setUpNavigationBar
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PKRecipientPickerViewController setTitle:](self, "setTitle:", self->_title);
  -[PKRecipientPickerViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setOverrideUserInterfaceStyle:", 2);
  -[PKRecipientPickerViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackButtonDisplayMode:", 2);
  v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_WALLET_ACTION_NEXT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 2, self, sel__nextBarButtonPressed_);

  objc_msgSend(v4, "setRightBarButtonItem:", v7);
  objc_msgSend(v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67D98]);
  -[PKRecipientPickerViewController _updateNextBarButtonItem](self, "_updateNextBarButtonItem");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonTapped_);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v9);

  objc_msgSend(v8, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AF8]);
  objc_msgSend(v4, "setLeftBarButtonItem:", v8);

}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PKRecipientPickerViewController__keyboardWillShow___block_invoke;
  v7[3] = &unk_1E3E618F0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PKRecipientPickerViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v7);

}

BOOL __53__PKRecipientPickerViewController__keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  CGRect v16;

  v2 = *(_QWORD *)(a1 + 32);
  v4 = *(double *)(v2 + 1016);
  v3 = *(double *)(v2 + 1024);
  v6 = *(double *)(v2 + 1032);
  v5 = *(double *)(v2 + 1040);
  *(_BYTE *)(v2 + 1048) = 1;
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v9 = (_QWORD *)(v8 + 1016);
  if (v7)
  {
    objc_msgSend(v7, "CGRectValue");
    *v9 = v10;
    v9[1] = v11;
    v9[2] = v12;
    v9[3] = v13;
  }
  else
  {
    v14 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)v9 = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v8 + 1032) = v14;
  }
  v16.origin.x = v4;
  v16.origin.y = v3;
  v16.size.width = v6;
  v16.size.height = v5;
  return !CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1016), v16);
}

- (void)_keyboardWillChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if (self->_keyboardVisible)
  {
    objc_msgSend(a3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v5 = v6;
    if (v6)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __55__PKRecipientPickerViewController__keyboardWillChange___block_invoke;
      v7[3] = &unk_1E3E618F0;
      v7[4] = self;
      v8 = v6;
      -[PKRecipientPickerViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v7);

      v5 = v6;
    }

  }
}

BOOL __55__PKRecipientPickerViewController__keyboardWillChange___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGRect v13;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2 + 127;
  v4 = *((double *)v2 + 127);
  v5 = *((double *)v2 + 128);
  v6 = *((double *)v2 + 129);
  v7 = *((double *)v2 + 130);
  objc_msgSend(*(id *)(a1 + 40), "CGRectValue");
  *v3 = v8;
  v3[1] = v9;
  v3[2] = v10;
  v3[3] = v11;
  v13.origin.x = v4;
  v13.origin.y = v5;
  v13.size.width = v6;
  v13.size.height = v7;
  return !CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1016), v13);
}

- (void)_keyboardWillHide:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__PKRecipientPickerViewController__keyboardWillHide___block_invoke;
  v3[3] = &unk_1E3E61918;
  v3[4] = self;
  -[PKRecipientPickerViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v3);
}

BOOL __53__PKRecipientPickerViewController__keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _OWORD *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGRect v8;

  v1 = *(_QWORD *)(a1 + 32);
  v8 = *(CGRect *)(v1 + 1016);
  *(_BYTE *)(v1 + 1048) = 0;
  v2 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 1016);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *v2 = *MEMORY[0x1E0C9D628];
  v2[1] = v3;
  *(_QWORD *)&v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040);
  return !CGRectEqualToRect(*(CGRect *)&v3, v8);
}

- (void)_updateLayoutForKeyboardAction:(id)a3
{
  unsigned int (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = (unsigned int (**)(_QWORD))a3;
  if (v4)
  {
    -[PKRecipientPickerViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "layoutIfNeeded");
      if (v4[2](v4))
      {
        objc_msgSend(v6, "setNeedsLayout");
        v7 = (void *)MEMORY[0x1E0DC3F10];
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __66__PKRecipientPickerViewController__updateLayoutForKeyboardAction___block_invoke;
        v8[3] = &unk_1E3E612E8;
        v9 = v6;
        objc_msgSend(v7, "_animateUsingDefaultTimingWithOptions:animations:completion:", 134, v8, 0);

      }
    }
    else
    {
      v4[2](v4);
    }

  }
}

uint64_t __66__PKRecipientPickerViewController__updateLayoutForKeyboardAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_nextBarButtonPressed:(id)a3
{
  void *v4;
  id v5;

  -[CNComposeRecipientTextView recipients](self->_recipientTextView, "recipients", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PKRecipientPickerViewController _showNextScreenWithRecipient:](self, "_showNextScreenWithRecipient:", v5);
}

- (void)_cancelButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  -[PKRecipientPickerViewController presentingViewController](self, "presentingViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  if (self->_peerPaymentSendFlowType == 1)
  {
    v5 = (void *)MEMORY[0x1E0D66A58];
    v6 = *MEMORY[0x1E0D698D0];
    v7 = *MEMORY[0x1E0D69298];
    v8 = *MEMORY[0x1E0D68F50];
    v14[0] = *MEMORY[0x1E0D68C90];
    v14[1] = v8;
    v9 = *MEMORY[0x1E0D69308];
    v15[0] = v7;
    v15[1] = v9;
    v10 = *MEMORY[0x1E0D68B18];
    v11 = *MEMORY[0x1E0D68858];
    v14[2] = *MEMORY[0x1E0D68AA0];
    v14[3] = v11;
    v12 = *MEMORY[0x1E0D688C0];
    v15[2] = v10;
    v15[3] = v12;
    v14[4] = *MEMORY[0x1E0D692A8];
    v15[4] = *MEMORY[0x1E0D692B0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subject:sendEvent:", v6, v13);

  }
}

- (void)_updateNextBarButtonItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  _BOOL8 v9;
  id v10;

  -[PKRecipientPickerViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[CNComposeRecipientTextView recipients](self->_recipientTextView, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = -[CNComposeRecipientTextView maxRecipients](self->_recipientTextView, "maxRecipients");

  v7 = -[PKRecipientPickerViewController _isRecipientTextViewEmpty](self, "_isRecipientTextViewEmpty");
  v9 = v5 == v6 && v7 && !self->_performingAction;
  objc_msgSend(v10, "setEnabled:", v9);

}

- (void)_addRecipientFromContactProperty:(id)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v13, "value");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if ((isKindOfClass & 1) != 0)
  {
    v9 = 0;
    if (!v7)
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_opt_class();
  v10 = objc_opt_isKindOfClass();

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v13, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 1;
    if (v8)
    {
LABEL_6:
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13688]), "initWithContact:address:kind:", v4, v8, v9);
      -[PKRecipientPickerViewController _addRecipient:](self, "_addRecipient:", v12);

    }
  }
LABEL_7:

}

- (void)_addRecipient:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CNComposeRecipientTextView recipients](self->_recipientTextView, "recipients", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "address");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "address");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "caseInsensitiveCompare:", v11);

      if (!v12)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    -[CNComposeRecipientTextView addRecipient:](self->_recipientTextView, "addRecipient:", v4);
    -[PKRecipientPickerViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");
  }

}

- (BOOL)_isRecipientTextViewEmpty
{
  void *v2;
  void *v3;
  void *v4;

  -[CNComposeRecipientTextView text](self->_recipientTextView, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "length") == 0;
  return (char)v2;
}

- (void)_clearRecipientTextView
{
  NSString *currentRecipientText;

  currentRecipientText = self->_currentRecipientText;
  self->_currentRecipientText = 0;

  -[CNComposeRecipientTextView clearText](self->_recipientTextView, "clearText");
}

- (unint64_t)_composeAddressKindFromCounterpartHandle:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    if ((-[PKContactFormatValidator emailAddressIsValid:](self->_contactFormatValidator, "emailAddressIsValid:", v4) & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PKContactFormatValidator phoneNumberIsValid:forCountryCode:](self->_contactFormatValidator, "phoneNumberIsValid:forCountryCode:", v6, 0))v5 = 1;
      else
        v5 = 5;

    }
  }
  else
  {
    v5 = 5;
  }

  return v5;
}

- (void)_showNextScreenWithRecipient:(id)a3
{
  id v4;
  uint64_t v5;
  PKPeerPaymentRemoteMessagesComposer *v6;
  void *v7;
  PKPeerPaymentRemoteMessagesComposer *v8;
  _QWORD v9[4];
  PKPeerPaymentRemoteMessagesComposer *v10;
  id v11;
  PKRecipientPickerViewController *v12;
  id v13;
  id location;

  v4 = a3;
  if (!self->_performingAction)
  {
    -[PKRecipientPickerViewController setPerformingAction:](self, "setPerformingAction:", 1);
    if (self->_peerPaymentSendFlowType == 2)
      v5 = 2;
    else
      v5 = 3;
    v6 = -[PKPeerPaymentRemoteMessagesComposer initWithPeerPaymentController:presentingViewController:actionType:sourceType:]([PKPeerPaymentRemoteMessagesComposer alloc], "initWithPeerPaymentController:presentingViewController:actionType:sourceType:", self->_peerPaymentController, self, v5, 1);
    objc_initWeak(&location, self);
    objc_msgSend(v4, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__PKRecipientPickerViewController__showNextScreenWithRecipient___block_invoke;
    v9[3] = &unk_1E3E6CAE8;
    objc_copyWeak(&v13, &location);
    v8 = v6;
    v10 = v8;
    v11 = v4;
    v12 = self;
    -[PKPeerPaymentRemoteMessagesComposer validateRecipientWithAddress:completion:](v8, "validateRecipientWithAddress:completion:", v7, v9);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

id __64__PKRecipientPickerViewController__showNextScreenWithRecipient___block_invoke(uint64_t a1, int a2)
{
  id result;
  void *v4;
  void *v5;
  PKAmountKeypadViewController *v6;

  if (a2)
  {
    result = objc_loadWeakRetained((id *)(a1 + 56));
    if (!result)
      return result;
    v4 = result;
    objc_msgSend(result, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKAmountKeypadViewController initWithRemoteMessagesComposer:recipient:sendFlowType:familyCollection:]([PKAmountKeypadViewController alloc], "initWithRemoteMessagesComposer:recipient:sendFlowType:familyCollection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 984), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 976));
    objc_msgSend(v5, "pushViewController:animated:", v6, 1);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_updateNextBarButtonItem");
  }
  return (id)objc_msgSend(*(id *)(a1 + 48), "setPerformingAction:", 0);
}

- (void)_showNearbyAmountEntry
{
  PKNearbyPeerPaymentViewProvider *nearbyViewProvider;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  PKRecipientPickerViewController *v17;
  id v18;
  id location;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  nearbyViewProvider = self->_nearbyViewProvider;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __57__PKRecipientPickerViewController__showNearbyAmountEntry__block_invoke;
  v16 = &unk_1E3E64790;
  objc_copyWeak(&v18, &location);
  v17 = self;
  -[PKNearbyPeerPaymentViewProvider amountEntryViewWithInitialAmount:initialMemo:dismissAction:](nearbyViewProvider, "amountEntryViewWithInitialAmount:initialMemo:dismissAction:", 0, 0, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecipientPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0, v13, v14, v15, v16);
  if (self->_peerPaymentSendFlowType == 1)
  {
    v5 = (void *)MEMORY[0x1E0D66A58];
    v6 = *MEMORY[0x1E0D69298];
    v7 = *MEMORY[0x1E0D68F50];
    v20[0] = *MEMORY[0x1E0D68C90];
    v20[1] = v7;
    v8 = *MEMORY[0x1E0D69308];
    v21[0] = v6;
    v21[1] = v8;
    v9 = *MEMORY[0x1E0D68B18];
    v10 = *MEMORY[0x1E0D68858];
    v20[2] = *MEMORY[0x1E0D68AA0];
    v20[3] = v10;
    v11 = *MEMORY[0x1E0D69260];
    v21[2] = v9;
    v21[3] = v11;
    v20[4] = *MEMORY[0x1E0D692A8];
    v21[4] = *MEMORY[0x1E0D692B0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subject:sendEvent:", *MEMORY[0x1E0D698D0], v12);

  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __57__PKRecipientPickerViewController__showNearbyAmountEntry__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  if (a2)
  {
    v3 = (void *)MEMORY[0x1E0D67470];
    v4 = a2;
    objc_msgSend(v3, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentSenderFlowWithHost:userInfo:completion:", 0, v4, 0);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recipientPickerViewControllerRequestsDismissViewController:", *(_QWORD *)(a1 + 32));

}

- (void)setPerformingAction:(BOOL)a3
{
  if (self->_performingAction != a3)
  {
    self->_performingAction = a3;
    -[PKRecipientPickerViewController _updateNextBarButtonItem](self, "_updateNextBarButtonItem");
  }
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3500];
  v6 = a4;
  objc_msgSend(v5, "whitespaceCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "length"))
    goto LABEL_11;
  -[PKContactResolver contactForHandle:](self->_contactResolver, "contactForHandle:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = -[PKRecipientPickerViewController _composeAddressKindFromCounterpartHandle:](self, "_composeAddressKindFromCounterpartHandle:", v8);
  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C97360]);
    if (v10 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPhoneNumbers:", v13);

      goto LABEL_7;
    }
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setEmailAddresses:", v12);
LABEL_7:

    }
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13688]), "initWithContact:address:kind:", v9, v8, v10);
  if (v14)
  {
    -[PKRecipientPickerViewController _clearRecipientTextView](self, "_clearRecipientTextView");
    -[PKRecipientPickerViewController _addRecipient:](self, "_addRecipient:", v14);
  }

LABEL_11:
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v6;
  NSNumber *currentTaskID;
  NSArray *autocompleteResults;
  void *v9;
  uint64_t v10;
  NSString *v11;
  NSString *currentRecipientText;
  void *v13;
  id v14;
  NSNumber *v15;
  NSNumber *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  if (self->_currentTaskID)
  {
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_searchManager, "cancelTaskWithID:");
    currentTaskID = self->_currentTaskID;
    self->_currentTaskID = 0;

  }
  autocompleteResults = self->_autocompleteResults;
  self->_autocompleteResults = 0;

  -[CNComposeRecipientTextView recipients](self->_recipientTextView, "recipients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 == -[CNComposeRecipientTextView maxRecipients](self->_recipientTextView, "maxRecipients")
    && objc_msgSend(v6, "length"))
  {
    -[PKRecipientPickerViewController _clearRecipientTextView](self, "_clearRecipientTextView");
  }
  else
  {
    -[CNComposeRecipientTextView text](self->_recipientTextView, "text");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    currentRecipientText = self->_currentRecipientText;
    self->_currentRecipientText = v11;

    -[PKRecipientPickerViewController _updateNextBarButtonItem](self, "_updateNextBarButtonItem");
    if (-[PKRecipientPickerViewController _isRecipientTextViewEmpty](self, "_isRecipientTextViewEmpty"))
    {
      -[CNAutocompleteResultsTableViewController setRecipients:](self->_resultsViewController, "setRecipients:", 0);
      if (!v10)
        -[UICollectionView reloadData](self->_suggestionsView, "reloadData");
    }
    -[PKRecipientPickerViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNeedsLayout");

    v14 = objc_alloc_init(MEMORY[0x1E0D135B0]);
    -[CNAutocompleteSearchManager searchForText:withAutocompleteFetchContext:consumer:](self->_searchManager, "searchForText:withAutocompleteFetchContext:consumer:", v6, v14, self);
    v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v16 = self->_currentTaskID;
    self->_currentTaskID = v15;

  }
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = objc_alloc_init(getCNContactPickerViewControllerClass());
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "setModalPresentationStyle:", 2);
  objc_msgSend(v7, "setOverrideUserInterfaceStyle:", 2);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(emailAddresses.@count > 0) OR (phoneNumbers.@count > 0)"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicateForEnablingContact:", v4);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(emailAddresses.@count + phoneNumbers.@count) == 1"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicateForSelectionOfContact:", v5);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(property == 'emailAddresses') OR (property == 'phoneNumbers')"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicateForSelectionOfProperty:", v6);

  -[PKRecipientPickerViewController setEditing:](self, "setEditing:", 0);
  -[PKRecipientPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3
{
  -[PKRecipientPickerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  id v5;

  -[CNComposeRecipientTextView frame](self->_recipientTextView, "frame", a3, a4.width);
  -[CNComposeRecipientTextView setFrame:](self->_recipientTextView, "setFrame:");
  -[PKRecipientPickerViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)_removeAllRecipients
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CNComposeRecipientTextView recipients](self->_recipientTextView, "recipients", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[CNComposeRecipientTextView removeRecipient:](self->_recipientTextView, "removeRecipient:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[PKRecipientPickerViewController _removeAllRecipients](self, "_removeAllRecipients");
  -[PKRecipientPickerViewController _addRecipientFromContactProperty:](self, "_addRecipientFromContactProperty:", v6);

  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[PKRecipientPickerViewController _removeAllRecipients](self, "_removeAllRecipients");
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  PKComposeRecipientFromContact(v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v9)
  {
    -[PKRecipientPickerViewController _addRecipient:](self, "_addRecipient:", v9);
    v8 = v9;
  }

}

- (void)consumeResults:(id)a3 taskID:(id)a4
{
  id v6;
  void *v7;
  NSArray *autocompleteResults;
  NSArray *v9;
  NSArray *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = v6;
  if (!self->_currentTaskID || objc_msgSend(v6, "isEqualToNumber:"))
  {
    autocompleteResults = self->_autocompleteResults;
    if (autocompleteResults)
    {
      -[NSArray arrayByAddingObjectsFromArray:](autocompleteResults, "arrayByAddingObjectsFromArray:", v12);
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (NSArray *)v12;
    }
    v10 = self->_autocompleteResults;
    self->_autocompleteResults = v9;

    -[CNAutocompleteResultsTableViewController setRecipients:](self->_resultsViewController, "setRecipients:", self->_autocompleteResults);
    -[PKRecipientPickerViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNeedsLayout");

  }
}

- (void)finishedTaskWithID:(id)a3
{
  NSNumber *currentTaskID;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToNumber:", self->_currentTaskID))
  {
    if (!self->_autocompleteResults)
      -[PKRecipientPickerViewController consumeResults:taskID:](self, "consumeResults:taskID:", MEMORY[0x1E0C9AA60], v5);
    currentTaskID = self->_currentTaskID;
    self->_currentTaskID = 0;

  }
}

- (BOOL)getSupplementalGroupsForSearchQuery:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  NSNumber *currentTaskID;
  NSArray *autocompleteResults;
  void *v8;
  id v9;

  v9 = a4;
  if (self->_currentTaskID)
  {
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_searchManager, "cancelTaskWithID:");
    currentTaskID = self->_currentTaskID;
    self->_currentTaskID = 0;

  }
  -[PKRecipientPickerViewController _clearRecipientTextView](self, "_clearRecipientTextView");
  -[CNComposeRecipientTextView setAccessibilityIdentifier:](self->_recipientTextView, "setAccessibilityIdentifier:", CFSTR("AppleCash.RecipientPicker.TextView"));
  -[PKRecipientPickerViewController _addRecipient:](self, "_addRecipient:", v9);
  autocompleteResults = self->_autocompleteResults;
  self->_autocompleteResults = 0;

  -[PKRecipientPickerViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

}

- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[CNComposeRecipientTextView clearText](self->_recipientTextView, "clearText");
  objc_msgSend(v5, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "address");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v7 = 0;
      goto LABEL_13;
    }
    v11 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(v11, "setNamePrefix:", v10);
    objc_msgSend(v11, "setContactType:", 0);
    v12 = objc_msgSend(v5, "kind");
    if (v12 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPhoneNumbers:", v15);

    }
    else
    {
      if (v12)
      {
LABEL_12:
        objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForUnknownContact:", v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
        if (!v7)
          goto LABEL_4;
        goto LABEL_3;
      }
      objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEmailAddresses:", v14);
    }

    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForContact:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
LABEL_3:
    objc_msgSend(v7, "setOverrideUserInterfaceStyle:", 2);
    objc_msgSend(v7, "setAllowsEditing:", 0);
    v16 = *MEMORY[0x1E0C96790];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisplayedPropertyKeys:", v8);

    -[PKRecipientPickerViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushViewController:animated:", v7, 1);

  }
LABEL_4:

}

- (void)autocompleteResultsController:(id)a3 tintColorForRecipient:(id)a4 completion:(id)a5
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0DC3658];
  v7 = a5;
  objc_msgSend(v6, "labelColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v7, v8);

}

- (BOOL)_showFamilySuggestions
{
  return self->_peerPaymentSendFlowType == 2 && -[NSArray count](self->_suggestedFamilyRecipients, "count") != 0;
}

- (BOOL)_showRecentSuggestions
{
  return -[NSArray count](self->_suggestedFamilyRecipients, "count") <= 4
      && -[NSArray count](self->_suggestedRecipients, "count") != 0;
}

- (BOOL)_showNearby
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = PKCashDeviceTapEnabled()
    && objc_msgSend(v4, "supportsDeviceTap")
    && self->_peerPaymentSendFlowType == 1;

  return v5;
}

- (void)_generateSuggestions
{
  PKRequestContactAccessWithCompletion();
}

void __55__PKRecipientPickerViewController__generateSuggestions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[6];
  _QWORD block[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__48;
  v30 = __Block_byref_object_dispose__48;
  v31 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 984) == 2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "familyMembers");
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v23 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v8, "contact");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9 && (objc_msgSend(v8, "isMe") & 1) == 0)
          {
            objc_msgSend(v9, "identifier");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend((id)v27[5], "containsObject:", v10) & 1) == 0)
            {
              PKComposeRecipientFromContact(v9);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (v11)
              {
                objc_msgSend((id)v27[5], "addObject:", v10);
                objc_msgSend(v3, "addObject:", v11);
              }

            }
          }

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      }
      while (v5);
    }

    v12 = objc_msgSend(v3, "copy");
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 1136);
    *(_QWORD *)(v13 + 1136) = v12;

    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "count") >= 5)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_132;
      block[3] = &unk_1E3E612E8;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], block);
      goto LABEL_20;
    }

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 968), "transactionSourceIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "anyObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateByAddingUnit:value:toDate:options:", 8, -6, v4, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 1112);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_2;
  v20[3] = &unk_1E3E75350;
  v20[4] = v18;
  v20[5] = &v26;
  objc_msgSend(v19, "peerPaymentCounterpartHandlesForTransactionSourceIdentifier:startDate:endDate:completion:", v3, v17, v4, v20);

LABEL_20:
  _Block_object_dispose(&v26, 8);

}

uint64_t __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_132(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1128);
  *(_QWORD *)(v2 + 1128) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "reloadData");
}

void __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD block[5];
  _QWORD v24[5];
  id v25;
  _QWORD v26[6];
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(v3, "count"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_7;
    block[3] = &unk_1E3E612E8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0DBD370], "sharedPrivacyManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v21 = v3;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v7)
    goto LABEL_17;
  v8 = v7;
  v9 = *(_QWORD *)v30;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v30 != v9)
        objc_enumerationMutation(v6);
      v11 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * v10);
      if (!objc_msgSend(v11, "length"))
      {

        v15 = 0;
LABEL_14:
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_3;
        v26[3] = &unk_1E3E75300;
        v17 = *(_QWORD *)(a1 + 40);
        v26[4] = *(_QWORD *)(a1 + 32);
        v26[5] = v11;
        v28 = v17;
        v27 = v4;
        objc_msgSend(v5, "addOperation:", v26);

        goto LABEL_15;
      }
      v12 = objc_msgSend(v11, "containsString:", CFSTR("@"));
      v13 = objc_alloc(MEMORY[0x1E0DBD2F8]);
      v14 = v13;
      if (v12)
      {
        v15 = (void *)objc_msgSend(v13, "initWithType:value:", 3, v11);
      }
      else
      {
        PKBestGuessNormalizedPhoneNumber();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "initWithType:value:", 2, v16);

      }
      if (!v15 || (objc_msgSend(v22, "isIncomingCommunicationBlockedForHandle:", v15) & 1) == 0)
        goto LABEL_14;
LABEL_15:

      ++v10;
    }
    while (v8 != v10);
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  }
  while (v8);
LABEL_17:

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_5;
  v24[3] = &unk_1E3E75328;
  v24[4] = *(_QWORD *)(a1 + 32);
  v25 = v4;
  v19 = v4;
  v20 = (id)objc_msgSend(v5, "evaluateWithInput:completion:", v18, v24);

  v3 = v21;
LABEL_19:

}

void __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[6];
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v8 = a1[4];
  v9 = a1[5];
  v10 = *(void **)(v8 + 1104);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_4;
  v14[3] = &unk_1E3E752D8;
  v11 = (void *)a1[6];
  v18 = a1[7];
  v14[4] = v8;
  v14[5] = v9;
  v16 = v6;
  v17 = v7;
  v15 = v11;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v10, "contactForHandle:withCompletion:", v9, v14);

}

void __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (v3)
  {
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "containsObject:", v4) & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v4);
      v5 = objc_msgSend(*(id *)(a1 + 32), "_composeAddressKindFromCounterpartHandle:", *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13688]), "initWithContact:address:kind:", v7, *(_QWORD *)(a1 + 40), v5);
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_5(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_6;
  v2[3] = &unk_1E3E61388;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1128);
  *(_QWORD *)(v3 + 1128) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "reloadData");
}

uint64_t __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1128);
  *(_QWORD *)(v2 + 1128) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "reloadData");
}

- (void)_configureCell:(id)a3 withContact:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v7);

  objc_msgSend(v5, "setWantsCustomAppearance:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v8);

  objc_msgSend(v5, "avatarView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v17[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(v11, "setContactType:", 0);
    v16 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "setContacts:", v10);
  objc_msgSend(v9, "frame");
  objc_msgSend(v9, "setFrame:");
  objc_msgSend(v5, "showAvatarView:", 1);
  objc_msgSend(v6, "emailAddresses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D67400], "displayNameForCounterpartHandle:contact:", v14, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v15);

}

- (BOOL)_hasHeaderForSection:(unint64_t)a3
{
  BOOL v5;

  if (a3 == 2)
  {
    v5 = -[PKRecipientPickerViewController _showRecentSuggestions](self, "_showRecentSuggestions")
      || -[PKRecipientPickerViewController _showFamilySuggestions](self, "_showFamilySuggestions");
    return -[PKRecipientPickerViewController _showNearby](self, "_showNearby") && v5;
  }
  else if (a3 == 1)
  {
    return -[PKRecipientPickerViewController _showRecentSuggestions](self, "_showRecentSuggestions");
  }
  else
  {
    return !a3 && -[PKRecipientPickerViewController _showFamilySuggestions](self, "_showFamilySuggestions");
  }
}

- (void)_configureHeaderView:(id)a3 inSection:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a4 == 1)
  {
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_WALLET_ACTION_RECIPIENT_HEADER_RECENTS"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v6 = 0;
      goto LABEL_7;
    }
    PKLocalizedPeerPaymentRecurringString(CFSTR("RECIPIENT_PICKER_FAMILY_SUGGESTIONS_TITLE"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:
  objc_msgSend(v8, "setTitle:", v6);
  objc_msgSend(v8, "setTitleStyle:", 4);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitleColor:", v7);

  objc_msgSend(v8, "setHorizontalInset:", 0.0);
}

- (id)_recipientForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  int *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (v5)
  {
    if (v5 != 1)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v6 = &OBJC_IVAR___PKRecipientPickerViewController__suggestedRecipients;
  }
  else
  {
    v6 = &OBJC_IVAR___PKRecipientPickerViewController__suggestedFamilyRecipients;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v6), "objectAtIndex:", objc_msgSend(v4, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  PKRecipientPickerViewController *v18;
  void *v19;
  uint64_t v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)*MEMORY[0x1E0DC48A8];
  v12 = v9;
  v13 = v11;
  if (v13 == v12)
  {

  }
  else
  {
    v14 = v13;
    if (!v12 || !v13)
    {

      goto LABEL_12;
    }
    v15 = objc_msgSend(v12, "isEqualToString:", v13);

    if (!v15)
      goto LABEL_12;
  }
  v16 = objc_msgSend(v10, "section");
  switch(v16)
  {
    case 2:
      objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v12, CFSTR("PKDashboardRecipientPickerNearbyHeaderIdentifier"), v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 1:
      objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v12, CFSTR("PKDashboardRecipientPickerSuggestionsTitleIdentifier"), v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = self;
      v19 = v17;
      v20 = 1;
      goto LABEL_15;
    case 0:
      objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v12, CFSTR("PKDashboardRecipientPickerFamilySuggestionsTitleIdentifier"), v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = self;
      v19 = v17;
      v20 = 0;
LABEL_15:
      -[PKRecipientPickerViewController _configureHeaderView:inSection:](v18, "_configureHeaderView:inSection:", v19, v20);
      goto LABEL_16;
  }
LABEL_12:
  v17 = 0;
LABEL_16:

  return v17;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 3;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  uint64_t v7;
  NSArray *suggestedRecipients;
  int64_t v9;
  _BOOL4 v11;
  NSUInteger v12;

  v6 = a3;
  if (a4 == 2)
  {
    v9 = -[PKRecipientPickerViewController _showNearby](self, "_showNearby");
  }
  else
  {
    if (a4 != 1)
    {
      if (!a4 && -[PKRecipientPickerViewController _showFamilySuggestions](self, "_showFamilySuggestions"))
      {
        v7 = 1136;
        if (-[NSArray count](self->_suggestedFamilyRecipients, "count") <= 7)
        {
LABEL_6:
          suggestedRecipients = *(NSArray **)((char *)&self->super.super.super.isa + v7);
LABEL_20:
          v9 = (uint64_t)(double)-[NSArray count](suggestedRecipients, "count");
          goto LABEL_14;
        }
LABEL_21:
        v9 = 8;
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    if (!-[PKRecipientPickerViewController _showRecentSuggestions](self, "_showRecentSuggestions"))
    {
LABEL_13:
      v9 = 0;
      goto LABEL_14;
    }
    if (!-[PKRecipientPickerViewController _showFamilySuggestions](self, "_showFamilySuggestions")
      || -[NSArray count](self->_suggestedFamilyRecipients, "count") > 4)
    {
      v11 = -[PKRecipientPickerViewController _showNearby](self, "_showNearby");
      v12 = -[NSArray count](self->_suggestedRecipients, "count");
      if (v11)
      {
        if (v12 > 3)
        {
          v9 = 4;
          goto LABEL_14;
        }
      }
      else if (v12 > 7)
      {
        goto LABEL_21;
      }
      suggestedRecipients = self->_suggestedRecipients;
      goto LABEL_20;
    }
    v7 = 1128;
    if (-[NSArray count](self->_suggestedRecipients, "count") <= 2)
      goto LABEL_6;
    v9 = 2;
  }
LABEL_14:

  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 >= 2)
  {
    if (v8 == 2)
    {
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PKDashboardRecipientPickerNearbyCellIdentifier"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PKDashboardRecipientPickerSuggestionsThumbnailCellIdentifier"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecipientPickerViewController _recipientForIndexPath:](self, "_recipientForIndexPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKRecipientPickerViewController _configureCell:withContact:](self, "_configureCell:withContact:", v9, v11);
  }

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = objc_msgSend(v7, "section");
  if (v5 >= 2)
  {
    if (v5 == 2)
      -[PKRecipientPickerViewController _showNearbyAmountEntry](self, "_showNearbyAmountEntry");
  }
  else
  {
    -[PKRecipientPickerViewController _recipientForIndexPath:](self, "_recipientForIndexPath:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[PKRecipientPickerViewController _addRecipient:](self, "_addRecipient:", v6);
      -[PKRecipientPickerViewController _showNextScreenWithRecipient:](self, "_showNextScreenWithRecipient:", v6);
    }

  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  id *p_sampleNearbyCell;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "bounds");
  v10 = 75.0;
  if ((v9 + -24.0) * 0.25 < 75.0)
  {
    objc_msgSend(v7, "bounds");
    v10 = (v11 + -24.0) * 0.25;
  }
  if (objc_msgSend(v8, "section") == 2)
  {
    p_sampleNearbyCell = (id *)&self->_sampleNearbyCell;
  }
  else
  {
    p_sampleNearbyCell = (id *)&self->_sampleThumbnailCell;
    -[PKRecipientPickerViewController _configureCell:withContact:](self, "_configureCell:withContact:", self->_sampleThumbnailCell, 0);
  }
  objc_msgSend(*p_sampleNearbyCell, "sizeThatFits:", v10, 3.40282347e38);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7;
  void **p_sampleNearbyHeaderView;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v7 = a3;
  if (-[PKRecipientPickerViewController _hasHeaderForSection:](self, "_hasHeaderForSection:", a5))
  {
    if (a5 == 2)
    {
      p_sampleNearbyHeaderView = (void **)&self->_sampleNearbyHeaderView;
    }
    else
    {
      p_sampleNearbyHeaderView = (void **)&self->_sampleHeaderView;
      -[PKRecipientPickerViewController _configureHeaderView:inSection:](self, "_configureHeaderView:inSection:", self->_sampleHeaderView, a5);
    }
    v11 = *p_sampleNearbyHeaderView;
    objc_msgSend(v7, "bounds");
    objc_msgSend(v11, "sizeThatFits:", v12, 3.40282347e38);
    v9 = v13;
    v10 = v14;
  }
  else
  {
    v9 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v15 = v9;
  v16 = v10;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  double v5;
  double v6;
  CGSize result;

  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v6;
  result.width = v5;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 10.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 8.0;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = 12.0;
  if (a5 == 2)
    v5 = 24.0;
  v6 = 0.0;
  if (a5 != 2)
    v6 = 24.0;
  v7 = 0.0;
  v8 = 0.0;
  result.right = v8;
  result.bottom = v6;
  result.left = v7;
  result.top = v5;
  return result;
}

- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor
{
  _BOOL8 v2;
  int64_t v3;
  $85E40A55691FE2F31975A98F57E3065D result;

  v2 = -[PKRecipientPickerViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle") == 2;
  v3 = v2;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (PKRecipientPickerViewControllerDelegate)delegate
{
  return (PKRecipientPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKNearbyPeerPaymentViewProvider)nearbyViewProvider
{
  return self->_nearbyViewProvider;
}

- (void)setNearbyViewProvider:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyViewProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyViewProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_peerPaymentController, 0);
  objc_storeStrong((id *)&self->_sampleNearbyCell, 0);
  objc_storeStrong((id *)&self->_sampleNearbyHeaderView, 0);
  objc_storeStrong((id *)&self->_sampleThumbnailCell, 0);
  objc_storeStrong((id *)&self->_sampleHeaderView, 0);
  objc_storeStrong((id *)&self->_suggestedFamilyRecipients, 0);
  objc_storeStrong((id *)&self->_suggestedRecipients, 0);
  objc_storeStrong((id *)&self->_suggestionsView, 0);
  objc_storeStrong((id *)&self->_transactionFetcher, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_currentRecipientText, 0);
  objc_storeStrong((id *)&self->_contactFormatValidator, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_resultsViewController, 0);
  objc_storeStrong((id *)&self->_recipientTextView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_autocompleteResults, 0);
  objc_storeStrong((id *)&self->_currentTaskID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
}

@end
