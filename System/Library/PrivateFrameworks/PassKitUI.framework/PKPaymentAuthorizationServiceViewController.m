@implementation PKPaymentAuthorizationServiceViewController

- (PKPaymentAuthorizationServiceViewController)initWithLayout:(id)a3 presenter:(id)a4
{
  id v7;
  id v8;
  PKPaymentAuthorizationServiceViewController *v9;
  PKPaymentAuthorizationServiceViewController *v10;
  _BOOL4 v11;
  void *v12;
  char v13;
  BOOL *p_allowBiometricPhysicalButtonInstruction;
  BOOL v15;
  CGPoint v16;
  CGSize v17;
  NSMutableSet *v18;
  NSMutableSet *completionHandlers;
  PKPaymentAuthorizationStateMachine *v20;
  PKPaymentAuthorizationStateMachine *stateMachine;
  PKPaymentAuthorizationStateMachine *v22;
  void *v23;
  PKPaymentAuthorizationStateMachine *v24;
  id v25;
  PKPaymentAuthorizationStateMachine *v26;
  id v27;
  PKPaymentAuthorizationStateMachine *v28;
  void *v29;
  PKPaymentAuthorizationStateMachine *v30;
  id v31;
  PKAuthenticator *v32;
  PKAuthenticator *authenticator;
  void *v34;
  void *v35;
  uint64_t v36;
  PKPeerPaymentAccount *peerPaymentAccount;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  PKContactFormatValidator *contactFormatValidator;
  objc_super v45;

  v7 = a3;
  v8 = a4;
  v45.receiver = self;
  v45.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  v9 = -[PKPaymentAuthorizationServiceViewController initWithNibName:bundle:](&v45, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layout, a3);
    v10->_isAMPPayment = objc_msgSend(v7, "isAMPPayment");
    v10->_isInstallment = objc_msgSend(v7, "isInstallment");
    v10->_isPaymentSummaryPinned = objc_msgSend(v7, "isPaymentSummaryPinned");
    v11 = -[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](v10, "pkui_userInterfaceIdiomSupportsLargeLayouts");
    v10->_usingLargeLayout = v11;
    if (v11)
    {
      -[PKPaymentAuthorizationServiceViewController traitCollection](v10, "traitCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "userInterfaceIdiom") == 6 || (PKPearlIsAvailable() & 1) != 0)
        v13 = 0;
      else
        v13 = PKHomeButtonIsAvailable() ^ 1;
      p_allowBiometricPhysicalButtonInstruction = &v10->_allowBiometricPhysicalButtonInstruction;
      v10->_allowBiometricPhysicalButtonInstruction = v13;

    }
    else
    {
      p_allowBiometricPhysicalButtonInstruction = &v10->_allowBiometricPhysicalButtonInstruction;
      v10->_allowBiometricPhysicalButtonInstruction = 0;
    }
    v15 = (PKUserIntentIsAvailable() & 1) != 0 || *p_allowBiometricPhysicalButtonInstruction;
    v10->_allowCompactProcessing = v15;
    v16 = (CGPoint)*MEMORY[0x1E0C9D628];
    v17 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v10->_lastKeyboardFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v10->_lastKeyboardFrame.size = v17;
    v10->_keyboardFrame.origin = v16;
    v10->_keyboardFrame.size = v17;
    objc_storeWeak((id *)&v10->_presenter, v8);
    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    completionHandlers = v10->_completionHandlers;
    v10->_completionHandlers = v18;

    v20 = (PKPaymentAuthorizationStateMachine *)objc_alloc_init(MEMORY[0x1E0D670B0]);
    stateMachine = v10->_stateMachine;
    v10->_stateMachine = v20;

    -[PKPaymentAuthorizationStateMachine setDelegate:](v10->_stateMachine, "setDelegate:", v10);
    v22 = v10->_stateMachine;
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationStateMachine setPaymentWebService:](v22, "setPaymentWebService:", v23);

    v24 = v10->_stateMachine;
    v25 = objc_alloc_init(MEMORY[0x1E0D672B0]);
    -[PKPaymentAuthorizationStateMachine setPaymentService:](v24, "setPaymentService:", v25);

    v26 = v10->_stateMachine;
    v27 = objc_alloc_init(MEMORY[0x1E0D668E8]);
    -[PKPaymentAuthorizationStateMachine setAccountService:](v26, "setAccountService:", v27);

    v28 = v10->_stateMachine;
    objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationStateMachine setPeerPaymentService:](v28, "setPeerPaymentService:", v29);

    v30 = v10->_stateMachine;
    v31 = objc_alloc_init(MEMORY[0x1E0D66A50]);
    -[PKPaymentAuthorizationStateMachine setAggregateDictionary:](v30, "setAggregateDictionary:", v31);

    v32 = (PKAuthenticator *)objc_alloc_init(MEMORY[0x1E0D6BFD8]);
    authenticator = v10->_authenticator;
    v10->_authenticator = v32;

    -[PKAuthenticator setDelegate:](v10->_authenticator, "setDelegate:", v10);
    -[PKPaymentAuthorizationServiceViewController _updateUserIntentStyle](v10, "_updateUserIntentStyle");
    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "peerPaymentService");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "account");
    v36 = objc_claimAutoreleasedReturnValue();
    peerPaymentAccount = v10->_peerPaymentAccount;
    v10->_peerPaymentAccount = (PKPeerPaymentAccount *)v36;

    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "context");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "configuration");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "contactFormatConfiguration");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66C50]), "initWithConfiguration:", v41);
    contactFormatValidator = v10->_contactFormatValidator;
    v10->_contactFormatValidator = (PKContactFormatValidator *)v42;

    -[PKPaymentAuthorizationServiceViewController _createSubviews](v10, "_createSubviews");
  }

  return v10;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  PKPaymentAuthorizationServiceViewController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[PKPaymentAuthorizationStateMachine state](self->_stateMachine, "state");
  if ((PKPaymentAuthorizationStateIsTerminal() & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v6 = self;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationServiceViewController (%{public}p): Deallocating service controller; will cancel",
        buf,
        0xCu);
    }

    -[PKPaymentAuthorizationServiceViewController _didCancel:](self, "_didCancel:", 0);
  }
  -[PKPaymentAuthorizationServiceViewController _removeSimulatorHIDListener](self, "_removeSimulatorHIDListener");
  -[PKAuthenticator invalidate](self->_authenticator, "invalidate");
  -[PKAuthenticator setDelegate:](self->_authenticator, "setDelegate:", 0);
  +[PKPassSnapshotter purgeCache](PKPassSnapshotter, "purgeCache");
  -[PKPaymentAuthorizationServiceViewController _executeCompletionHandlers](self, "_executeCompletionHandlers");
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  -[PKPaymentAuthorizationServiceViewController dealloc](&v4, sel_dealloc);
}

- (void)_createSubviews
{
  UIView *v3;
  UIView *contentView;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UITableView *v10;
  void *v11;
  UITableView *detailTableView;
  PKPaymentAuthorizationSummaryItemsView *v13;
  PKPaymentAuthorizationSummaryItemsView *summaryItemsView;
  PKPaymentAuthorizationTotalView *v15;
  PKPaymentAuthorizationTotalView *totalView;
  PKPaymentAuthorizationFooterView *v17;
  PKPaymentAuthorizationFooterView *footerView;
  uint64_t v19;
  void *v20;
  void *v21;
  PKPaymentAuthorizationPasswordButtonView *v22;
  PKPaymentAuthorizationPasswordButtonView *v23;
  PKPaymentAuthorizationPasswordButtonView *passwordButtonView;
  UIView *v25;
  void *v26;
  UIView *passphraseSeparatorView;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  id v32;
  id location;

  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  contentView = self->_contentView;
  self->_contentView = v3;

  v5 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = (UITableView *)objc_msgSend(v5, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], v7, v8, v9);
  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](v10, "setBackgroundColor:", v11);

  -[UITableView setEstimatedRowHeight:](v10, "setEstimatedRowHeight:", 66.0);
  -[UITableView setRowHeight:](v10, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  -[UITableView setSeparatorStyle:](v10, "setSeparatorStyle:", 0);
  -[UITableView setOpaque:](v10, "setOpaque:", 0);
  detailTableView = self->_detailTableView;
  self->_detailTableView = v10;

  -[UITableView setScrollEnabled:](self->_detailTableView, "setScrollEnabled:", 0);
  if (self->_usingLargeLayout && !self->_isInstallment || self->_isPaymentSummaryPinned)
  {
    v13 = objc_alloc_init(PKPaymentAuthorizationSummaryItemsView);
    summaryItemsView = self->_summaryItemsView;
    self->_summaryItemsView = v13;

    -[PKPaymentAuthorizationSummaryItemsView setShowsTopSeparator:](self->_summaryItemsView, "setShowsTopSeparator:", self->_isPaymentSummaryPinned);
  }
  if (!-[PKPaymentAuthorizationLayout shouldSuppressTotal](self->_layout, "shouldSuppressTotal"))
  {
    v15 = objc_alloc_init(PKPaymentAuthorizationTotalView);
    totalView = self->_totalView;
    self->_totalView = v15;

  }
  v17 = -[PKPaymentAuthorizationFooterView initWithFrame:layout:]([PKPaymentAuthorizationFooterView alloc], "initWithFrame:layout:", self->_layout, v6, v7, v8, v9);
  footerView = self->_footerView;
  self->_footerView = v17;

  -[PKPaymentAuthorizationFooterView setUserIntentStyle:](self->_footerView, "setUserIntentStyle:", self->_userIntentStyle);
  -[PKPaymentAuthorizationFooterView setDelegate:](self->_footerView, "setDelegate:", self);
  if (PKPearlIsAvailable())
    v19 = 3;
  else
    v19 = 0;
  -[PKPaymentAuthorizationServiceViewController setFooterState:string:animated:](self, "setFooterState:string:animated:", v19, 0, 0);
  objc_initWeak(&location, self);
  v20 = (void *)MEMORY[0x1E0DC3428];
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __62__PKPaymentAuthorizationServiceViewController__createSubviews__block_invoke;
  v31 = &unk_1E3E62BD0;
  objc_copyWeak(&v32, &location);
  objc_msgSend(v20, "actionWithHandler:", &v28);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = [PKPaymentAuthorizationPasswordButtonView alloc];
  v23 = -[PKPaymentAuthorizationPasswordButtonView initWithFrame:action:](v22, "initWithFrame:action:", v21, v6, v7, v8, v9, v28, v29, v30, v31);
  passwordButtonView = self->_passwordButtonView;
  self->_passwordButtonView = v23;

  -[PKPaymentAuthorizationPasswordButtonView setHidden:](self->_passwordButtonView, "setHidden:", 1);
  v25 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  PKAuthorizationSeparatorColor();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v25, "setBackgroundColor:", v26);

  passphraseSeparatorView = self->_passphraseSeparatorView;
  self->_passphraseSeparatorView = v25;

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

void __62__PKPaymentAuthorizationServiceViewController__createSubviews__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_payWithPasswordPressed:", v4);
}

- (void)viewDidLoad
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v9;
  void *v10;
  UIBarButtonItem *v11;
  UIBarButtonItem *cancelBarButtonItem;
  PKPaymentAuthorizationSummaryItemsView *summaryItemsView;
  void *totalView;
  PKPaymentAuthorizationFooterView *footerView;
  void *v16;
  PKPaymentAuthorizationTotalView *v17;
  PKPaymentAuthorizationTotalView *v18;
  void *v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *contentViewRightConstraint;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  UIView *contentView;
  void *v32;
  UIView *v33;
  void *v34;
  UIView *v35;
  void *v36;
  UIView *v37;
  void *v38;
  PKPaymentAuthorizationSummaryItemsView *v39;
  UIView *v40;
  void *v41;
  UIView *v42;
  void *v43;
  UIView *v44;
  void *v45;
  void *v46;
  UIView *v47;
  void *v48;
  PKPaymentAuthorizationSummaryItemsView *v49;
  id v50;
  void *v51;
  NSLayoutConstraint *v52;
  NSLayoutConstraint *summaryHeightConstraint;
  PKPaymentAuthorizationTotalView *v54;
  UIView *v55;
  void *v56;
  UIView *v57;
  void *v58;
  UIView *v59;
  PKPaymentAuthorizationTotalView *v60;
  void *v61;
  UIView *v62;
  NSObject *v63;
  UIView *v64;
  void *v65;
  UIView *v66;
  void *v67;
  UIView *v68;
  PKPaymentAuthorizationTotalView *v69;
  void *v70;
  UIView *v71;
  void *v72;
  UIView *v73;
  void *v74;
  UIView *v75;
  void *v76;
  void *v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  UIView *passphraseSeparatorView;
  double v83;
  void *v84;
  void *v85;
  UITableView *v86;
  void *v87;
  void *v88;
  void *v89;
  UITableView *v90;
  uint8_t buf[8];
  objc_super v92;

  v92.receiver = self;
  v92.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  -[PKPaymentAuthorizationServiceViewController viewDidLoad](&v92, sel_viewDidLoad);
  v3 = -[PKPaymentAuthorizationLayout requestType](self->_layout, "requestType");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_keyboardWillChange_, *MEMORY[0x1E0DC4FD8], 0);
  v89 = v4;
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);
  -[PKPaymentAuthorizationServiceViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  -[PKPaymentAuthorizationServiceViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  -[PKPaymentAuthorizationServiceViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_isAMPPayment || v3 == 0)
  {
    v9 = v3 > 0xD || ((1 << v3) & 0x20C0) == 0;
    if (v9
      || !-[PKPaymentAuthorizationServiceViewController _setNavigationItemLeftItemFromNavigationTitle](self, "_setNavigationItemLeftItemFromNavigationTitle"))
    {
      +[PKPaymentAuthorizationNavigationBar applePayBarButtonItem](PKPaymentAuthorizationNavigationBar, "applePayBarButtonItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLeftBarButtonItem:animated:", v10, 0);

    }
  }
  else
  {
    -[PKPaymentAuthorizationServiceViewController _setNavigationItemLeftItemForAMP](self, "_setNavigationItemLeftItemForAMP");
  }
  objc_msgSend(v7, "setLeftItemsSupplementBackButton:", 1);
  v11 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelPressed_);
  cancelBarButtonItem = self->_cancelBarButtonItem;
  self->_cancelBarButtonItem = v11;

  objc_msgSend(v7, "setRightBarButtonItem:animated:", self->_cancelBarButtonItem, 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "addSubview:", self->_contentView);
  if ((!self->_usingLargeLayout || self->_isAMPPayment || self->_isInstallment) && !self->_isPaymentSummaryPinned)
  {
    summaryItemsView = self->_summaryItemsView;
    self->_summaryItemsView = 0;

    totalView = self->_totalView;
    if (!totalView)
      totalView = self->_footerView;
    v90 = totalView;
    v86 = self->_detailTableView;
  }
  else
  {
    -[PKPaymentAuthorizationSummaryItemsView setLayout:](self->_summaryItemsView, "setLayout:", self->_layout);
    -[UIView addSubview:](self->_contentView, "addSubview:", self->_summaryItemsView);
    v86 = self->_summaryItemsView;
    v90 = v86;
  }
  -[UITableView setDataSource:](self->_detailTableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_detailTableView, "setDelegate:", self);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_detailTableView);
  -[PKPaymentAuthorizationFooterView setLayout:](self->_footerView, "setLayout:", self->_layout);
  footerView = self->_footerView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationFooterView setBackgroundColor:](footerView, "setBackgroundColor:", v16);

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_footerView);
  -[PKPaymentAuthorizationPasswordButtonView setTranslatesAutoresizingMaskIntoConstraints:](self->_passwordButtonView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_passwordButtonView);
  objc_msgSend(v5, "addSubview:", self->_passphraseSeparatorView);
  v17 = self->_totalView;
  if (v17)
  {
    -[PKPaymentAuthorizationTotalView setLayout:](v17, "setLayout:", self->_layout);
    v18 = self->_totalView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationTotalView setBackgroundColor:](v18, "setBackgroundColor:", v19);

    -[UIView addSubview:](self->_contentView, "addSubview:", self->_totalView);
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_contentView, 7, 0, v5, 7, 1.0, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConstraint:", v20);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_contentView, 4, 0, v5, 4, 1.0, 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConstraint:", v21);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_contentView, 2, 0, v5, 2, 1.0, 0.0);
  v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentViewRightConstraint = self->_contentViewRightConstraint;
  self->_contentViewRightConstraint = v22;

  objc_msgSend(v5, "addConstraint:", self->_contentViewRightConstraint);
  objc_msgSend(v5, "safeAreaLayoutGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_contentView, 3, 0, v24, 3, 1.0, 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = 1148829696;
  objc_msgSend(v25, "setPriority:", v26);
  objc_msgSend(v5, "addConstraint:", v25);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_contentView, 3, 1, v24, 3, 1.0, 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v28) = 1148846080;
  objc_msgSend(v27, "setPriority:", v28);
  v88 = v27;
  objc_msgSend(v5, "addConstraint:", v27);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_contentView, 4, 0, v24, 4, 1.0, 0.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v30) = 1148846080;
  objc_msgSend(v29, "setPriority:", v30);
  v87 = v29;
  objc_msgSend(v5, "addConstraint:", v29);
  contentView = self->_contentView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_detailTableView, 1, 0, contentView, 1, 1.0, 0.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraint:](contentView, "addConstraint:", v32);

  v33 = self->_contentView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_detailTableView, 2, 0, v33, 2, 1.0, 0.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraint:](v33, "addConstraint:", v34);

  v35 = self->_contentView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_detailTableView, 3, 0, v35, 3, 1.0, 0.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraint:](v35, "addConstraint:", v36);

  v37 = self->_contentView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_detailTableView, 4, 0, v90, 3, 1.0, 0.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraint:](v37, "addConstraint:", v38);

  if (self->_usingLargeLayout || self->_isPaymentSummaryPinned)
  {
    v39 = self->_summaryItemsView;
    if (v39)
    {
      v40 = self->_contentView;
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v39, 1, 0, v40, 1, 1.0, 0.0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addConstraint:](v40, "addConstraint:", v41);

      v42 = self->_contentView;
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_summaryItemsView, 2, 0, v42, 2, 1.0, 0.0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addConstraint:](v42, "addConstraint:", v43);

      v44 = self->_contentView;
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_summaryItemsView, 3, 0, self->_detailTableView, 4, 1.0, 0.0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addConstraint:](v44, "addConstraint:", v45);

      v46 = self->_totalView;
      if (!v46)
        v46 = self->_footerView;
      v47 = self->_contentView;
      v48 = (void *)MEMORY[0x1E0CB3718];
      v49 = self->_summaryItemsView;
      v50 = v46;
      objc_msgSend(v48, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v49, 4, 0, v50, 3, 1.0, 0.0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addConstraint:](v47, "addConstraint:", v51);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_summaryItemsView, 8, 0, 0, 0, 1.0, 0.0);
      v52 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      summaryHeightConstraint = self->_summaryHeightConstraint;
      self->_summaryHeightConstraint = v52;

      -[UIView addConstraint:](self->_contentView, "addConstraint:", self->_summaryHeightConstraint);
    }
  }
  v54 = self->_totalView;
  if (v54)
  {
    v55 = self->_contentView;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v54, 1, 0, v55, 1, 1.0, 0.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v55, "addConstraint:", v56);

    v57 = self->_contentView;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_totalView, 2, 0, v57, 2, 1.0, 0.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v57, "addConstraint:", v58);

    v59 = self->_contentView;
    v60 = (PKPaymentAuthorizationTotalView *)v86;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_totalView, 3, 0, v86, 4, 1.0, 0.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v59, "addConstraint:", v61);

    v62 = self->_contentView;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_totalView, 4, 0, self->_footerView, 3, 1.0, 0.0);
    v63 = objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v62, "addConstraint:", v63);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v63, OS_LOG_TYPE_DEFAULT, "Card on file request suppressing total view", buf, 2u);
    }
    v60 = (PKPaymentAuthorizationTotalView *)v86;
  }

  v64 = self->_contentView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_footerView, 1, 0, v64, 1, 1.0, 0.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraint:](v64, "addConstraint:", v65);

  v66 = self->_contentView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_footerView, 2, 0, v66, 2, 1.0, 0.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraint:](v66, "addConstraint:", v67);

  v68 = self->_contentView;
  if (self->_totalView)
    v69 = self->_totalView;
  else
    v69 = v60;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_footerView, 3, 0, v69, 4, 1.0, 0.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraint:](v68, "addConstraint:", v70);

  v71 = self->_contentView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_passwordButtonView, 1, 0, v71, 1, 1.0, 0.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraint:](v71, "addConstraint:", v72);

  v73 = self->_contentView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_passwordButtonView, 2, 0, v73, 2, 1.0, 0.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraint:](v73, "addConstraint:", v74);

  v75 = self->_contentView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_passwordButtonView, 3, 0, self->_footerView, 4, 1.0, 0.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraint:](v75, "addConstraint:", v76);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_passwordButtonView, 4, 0, self->_contentView, 4, 1.0, 0.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v78) = 1148829696;
  objc_msgSend(v77, "setPriority:", v78);
  -[UIView addConstraint:](self->_contentView, "addConstraint:", v77);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_passphraseSeparatorView, 1, 0, self->_contentView, 2, 1.0, 0.0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConstraint:", v79);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_passphraseSeparatorView, 3, 0, v24, 3, 1.0, 0.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConstraint:", v80);

  v81 = (void *)MEMORY[0x1E0CB3718];
  passphraseSeparatorView = self->_passphraseSeparatorView;
  PKFloatCeilToPixel();
  objc_msgSend(v81, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", passphraseSeparatorView, 7, 0, 0, 0, 1.0, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConstraint:", v84);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_passphraseSeparatorView, 4, 0, v5, 4, 1.0, 0.0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConstraint:", v85);

}

- (BOOL)_setNavigationItemLeftItemFromNavigationTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[PKPaymentAuthorizationServiceViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationLayout localizedNavigationTitle](self->_layout, "localizedNavigationTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v4, 0, 0, 0);
    objc_msgSend(v6, "setEnabled:", 0);
    v12[0] = *MEMORY[0x1E0DC1138];
    v7 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(MEMORY[0x1E0DC1350], "buttonFontSize");
    objc_msgSend(v7, "boldSystemFontOfSize:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v12[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setTitleTextAttributes:forState:", v10, 2);
    objc_msgSend(v6, "setTitleTextAttributes:forState:", v10, 0);
    objc_msgSend(v3, "setLeftBarButtonItem:animated:", v6, 0);

  }
  return v5 != 0;
}

- (void)_setNavigationItemLeftItemForAMP
{
  void *v3;
  id v4;

  if (!-[PKPaymentAuthorizationServiceViewController _setNavigationItemLeftItemFromNavigationTitle](self, "_setNavigationItemLeftItemFromNavigationTitle"))
  {
    -[PKPaymentAuthorizationServiceViewController navigationItem](self, "navigationItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    +[PKPaymentAuthorizationNavigationBar cardOnFileBarButtonItemForRequestor:](PKPaymentAuthorizationNavigationBar, "cardOnFileBarButtonItemForRequestor:", -[PKPaymentAuthorizationLayout requestor](self->_layout, "requestor"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLeftBarButtonItem:animated:", v3, 0);

  }
}

- (void)_setVisibility:(unsigned __int8)a3
{
  id v4;

  if (self->_visibility != a3)
  {
    self->_visibility = a3;
    -[PKPaymentAuthorizationServiceViewController _setVisible:](self, "_setVisible:", PKViewVisibilityStateIsVisible());
    -[PKPaymentAuthorizationServiceViewController viewIfLoaded](self, "viewIfLoaded");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  UIViewController *passphraseViewController;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  -[PKPaymentAuthorizationServiceViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PKPaymentAuthorizationServiceViewController _setVisibility:](self, "_setVisibility:", 1);
  passphraseViewController = self->_passphraseViewController;
  if (passphraseViewController)
    -[UIViewController becomeFirstResponder](passphraseViewController, "becomeFirstResponder");
  -[PKPaymentAuthorizationServiceViewController _startSimulatorHIDListener](self, "_startSimulatorHIDListener");
  -[PKPaymentAuthorizationServiceViewController resumeAndUpdateContentSize](self, "resumeAndUpdateContentSize");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  -[PKPaymentAuthorizationServiceViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  -[PKPaymentAuthorizationServiceViewController _setVisibility:](self, "_setVisibility:", 2);
  -[PKPaymentAuthorizationServiceViewController _showScrollIndicatorIfNeeded](self, "_showScrollIndicatorIfNeeded");
  v4 = (void *)MEMORY[0x1E0D66A58];
  v5 = *MEMORY[0x1E0D698F8];
  v6 = *MEMORY[0x1E0D68C50];
  v7 = *MEMORY[0x1E0D69208];
  v11[0] = *MEMORY[0x1E0D68AA0];
  v11[1] = v7;
  v8 = *MEMORY[0x1E0D68BB8];
  v12[0] = v6;
  v12[1] = v8;
  v11[2] = *MEMORY[0x1E0D68F50];
  v12[2] = *MEMORY[0x1E0D690C0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subject:sendEvent:", v5, v9);

  kdebug_trace();
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  -[PKPaymentAuthorizationServiceViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[UIViewController resignFirstResponder](self->_passphraseViewController, "resignFirstResponder");
  -[PKPaymentAuthorizationServiceViewController _setVisibility:](self, "_setVisibility:", 3);
  -[PKPaymentAuthorizationServiceViewController _removeSimulatorHIDListener](self, "_removeSimulatorHIDListener");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  -[PKPaymentAuthorizationServiceViewController viewDidDisappear:](&v9, sel_viewDidDisappear_, a3);
  -[PKPaymentAuthorizationServiceViewController _setVisibility:](self, "_setVisibility:", 0);
  v4 = (void *)MEMORY[0x1E0D66A58];
  v5 = *MEMORY[0x1E0D698F8];
  v6 = *MEMORY[0x1E0D68F50];
  v10[0] = *MEMORY[0x1E0D68AA0];
  v10[1] = v6;
  v7 = *MEMORY[0x1E0D690C0];
  v11[0] = *MEMORY[0x1E0D68C58];
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subject:sendEvent:", v5, v8);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSLayoutConstraint *passphraseBottomConstraint;
  double v23;
  CGFloat MaxY;
  PKPaymentAuthorizationSummaryItemsView *summaryItemsView;
  NSLayoutConstraint *summaryHeightConstraint;
  void *v27;
  double v28;
  double v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;

  v30.receiver = self;
  v30.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  -[PKPaymentAuthorizationServiceViewController viewWillLayoutSubviews](&v30, sel_viewWillLayoutSubviews);
  ++self->_layoutRecursionCounter;
  -[PKPaymentAuthorizationServiceViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (PKViewVisibilityStateIsVisible())
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    if (!CGRectIsNull(self->_keyboardFrame))
    {
      objc_msgSend(v3, "window");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "convertRect:fromWindow:", 0, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
        objc_msgSend(v3, "convertRect:fromView:", 0);
        x = v18;
        y = v19;
        width = v20;
        height = v21;
      }

    }
  }
  else
  {
    x = self->_lastKeyboardFrame.origin.x;
    y = self->_lastKeyboardFrame.origin.y;
    width = self->_lastKeyboardFrame.size.width;
    height = self->_lastKeyboardFrame.size.height;
  }
  self->_lastKeyboardFrame.origin.x = x;
  self->_lastKeyboardFrame.origin.y = y;
  self->_lastKeyboardFrame.size.width = width;
  self->_lastKeyboardFrame.size.height = height;
  if (self->_passphraseBottomConstraint && self->_needsToAccommodateKeyboard && !self->_usingLargeLayout)
  {
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    if (CGRectIsNull(v31))
    {
      passphraseBottomConstraint = self->_passphraseBottomConstraint;
      v23 = 0.0;
    }
    else
    {
      v32.origin.x = v5;
      v32.origin.y = v7;
      v32.size.width = v9;
      v32.size.height = v11;
      MaxY = CGRectGetMaxY(v32);
      passphraseBottomConstraint = self->_passphraseBottomConstraint;
      v23 = -fmax(MaxY - self->_lastKeyboardFrame.origin.y, 0.0);
    }
    -[NSLayoutConstraint setConstant:](passphraseBottomConstraint, "setConstant:", v23);
  }
  summaryItemsView = self->_summaryItemsView;
  if (summaryItemsView)
  {
    summaryHeightConstraint = self->_summaryHeightConstraint;
    if (summaryHeightConstraint)
    {
      -[PKPaymentAuthorizationServiceViewController view](self, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bounds");
      -[PKPaymentAuthorizationSummaryItemsView sizeThatFits:](summaryItemsView, "sizeThatFits:", v28, 1.79769313e308);
      -[NSLayoutConstraint setConstant:](summaryHeightConstraint, "setConstant:", v29);

    }
  }

}

- (void)viewDidLayoutSubviews
{
  unsigned __int16 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  -[PKPaymentAuthorizationServiceViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  v3 = self->_layoutRecursionCounter - 1;
  self->_layoutRecursionCounter = v3;
  if (!v3)
    -[PKPaymentAuthorizationServiceViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  -[PKPaymentAuthorizationServiceViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v11, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  if (v6)
  {
    -[UITableView beginUpdates](self->_detailTableView, "beginUpdates");
    -[UITableView endUpdates](self->_detailTableView, "endUpdates");
    -[PKPaymentAuthorizationServiceViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
    -[PKPaymentAuthorizationServiceViewController traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if (v8 == 1)
    {
      if (PKPearlIsAvailable())
      {
        v9 = (void *)MEMORY[0x1E0D44448];
        objc_msgSend(v6, "screen");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        self->_faceIDCameraEdge = objc_msgSend(v9, "pkui_cameraEdgeForScreen:", v10);

        -[PKPaymentAuthorizationServiceViewController _updateCoachingState](self, "_updateCoachingState");
      }
    }
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  _QWORD v15[5];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[PKPaymentAuthorizationServiceViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9 == 1)
  {
    if (PKPearlIsAvailable())
    {
      v10 = (void *)MEMORY[0x1E0D44448];
      -[PKPaymentAuthorizationServiceViewController viewIfLoaded](self, "viewIfLoaded");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "screen");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      self->_faceIDCameraEdge = objc_msgSend(v10, "pkui_cameraEdgeForScreen:", v13);

      -[PKPaymentAuthorizationServiceViewController _updateCoachingState](self, "_updateCoachingState");
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __98__PKPaymentAuthorizationServiceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v15[3] = &unk_1E3E62F28;
    v15[4] = self;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v15, 0);
  }
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  -[PKPaymentAuthorizationServiceViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

uint64_t __98__PKPaymentAuthorizationServiceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "updateRotation");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  -[PKPaymentAuthorizationServiceViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PKPaymentAuthorizationSummaryItemsView setNeedsLayout](self->_summaryItemsView, "setNeedsLayout");
  -[PKPaymentAuthorizationTotalView setNeedsUpdateConstraints](self->_totalView, "setNeedsUpdateConstraints");
  -[PKPaymentAuthorizationFooterView setNeedsUpdateConstraints](self->_footerView, "setNeedsUpdateConstraints");
  -[PKPaymentAuthorizationPasswordButtonView setNeedsUpdateConstraints](self->_passwordButtonView, "setNeedsUpdateConstraints");
}

- (void)keyboardWillShow:(id)a3
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
  v7[2] = __64__PKPaymentAuthorizationServiceViewController_keyboardWillShow___block_invoke;
  v7[3] = &unk_1E3E618F0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PKPaymentAuthorizationServiceViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v7);

}

BOOL __64__PKPaymentAuthorizationServiceViewController_keyboardWillShow___block_invoke(uint64_t a1)
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
  v3 = *(double *)(v2 + 1144);
  v4 = *(double *)(v2 + 1152);
  v5 = *(double *)(v2 + 1160);
  v6 = *(double *)(v2 + 1168);
  *(_BYTE *)(v2 + 1136) = 1;
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v9 = (_QWORD *)(v8 + 1144);
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
    *(_OWORD *)(v8 + 1160) = v14;
  }
  v16.origin.x = v3;
  v16.origin.y = v4;
  v16.size.width = v5;
  v16.size.height = v6;
  return !CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1144), v16);
}

- (void)keyboardWillChange:(id)a3
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
      v7[2] = __66__PKPaymentAuthorizationServiceViewController_keyboardWillChange___block_invoke;
      v7[3] = &unk_1E3E618F0;
      v7[4] = self;
      v8 = v6;
      -[PKPaymentAuthorizationServiceViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v7);

      v5 = v6;
    }

  }
}

BOOL __66__PKPaymentAuthorizationServiceViewController_keyboardWillChange___block_invoke(uint64_t a1)
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
  v3 = v2 + 143;
  v4 = *((double *)v2 + 143);
  v5 = *((double *)v2 + 144);
  v6 = *((double *)v2 + 145);
  v7 = *((double *)v2 + 146);
  objc_msgSend(*(id *)(a1 + 40), "CGRectValue");
  *v3 = v8;
  v3[1] = v9;
  v3[2] = v10;
  v3[3] = v11;
  v13.origin.x = v4;
  v13.origin.y = v5;
  v13.size.width = v6;
  v13.size.height = v7;
  return !CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1144), v13);
}

- (void)keyboardWillHide:(id)a3
{
  _QWORD v3[5];

  if (self->_keyboardVisible)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __64__PKPaymentAuthorizationServiceViewController_keyboardWillHide___block_invoke;
    v3[3] = &unk_1E3E61918;
    v3[4] = self;
    -[PKPaymentAuthorizationServiceViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v3);
  }
}

BOOL __64__PKPaymentAuthorizationServiceViewController_keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _OWORD *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGRect v8;

  v1 = *(_QWORD *)(a1 + 32);
  v8 = *(CGRect *)(v1 + 1144);
  *(_BYTE *)(v1 + 1136) = 0;
  v2 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 1144);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *v2 = *MEMORY[0x1E0C9D628];
  v2[1] = v3;
  *(_QWORD *)&v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1144);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1152);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1160);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1168);
  return !CGRectEqualToRect(*(CGRect *)&v3, v8);
}

- (void)_updateLayoutForKeyboardAction:(id)a3
{
  uint64_t (**v4)(_QWORD);
  void *v5;
  int IsVisible;
  int v7;
  int v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = (uint64_t (**)(_QWORD))a3;
  if (v4)
  {
    -[PKPaymentAuthorizationServiceViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    IsVisible = PKViewVisibilityStateIsVisible();
    v7 = IsVisible;
    if (v5 && IsVisible)
      objc_msgSend(v5, "layoutIfNeeded");
    v8 = v4[2](v4);
    if (v5)
    {
      if (v8)
      {
        objc_msgSend(v5, "setNeedsLayout");
        -[PKPaymentAuthorizationServiceViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
        if (v7)
        {
          v9 = (void *)MEMORY[0x1E0DC3F10];
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 3221225472;
          v10[2] = __78__PKPaymentAuthorizationServiceViewController__updateLayoutForKeyboardAction___block_invoke;
          v10[3] = &unk_1E3E612E8;
          v11 = v5;
          objc_msgSend(v9, "_animateUsingDefaultTimingWithOptions:animations:completion:", 134, v10, 0);

        }
      }
    }

  }
}

uint64_t __78__PKPaymentAuthorizationServiceViewController__updateLayoutForKeyboardAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (id)handlePaymentRequest:(id)a3 fromAppWithLocalizedName:(id)a4 andApplicationIdentifier:(id)a5
{
  return -[PKPaymentAuthorizationServiceViewController handlePaymentRequest:relevantPassUniqueID:fromAppWithLocalizedName:applicationIdentifier:bundleIdentifier:teamIdentifier:](self, "handlePaymentRequest:relevantPassUniqueID:fromAppWithLocalizedName:applicationIdentifier:bundleIdentifier:teamIdentifier:", a3, 0, a4, a5, 0, 0);
}

- (id)handlePaymentRequest:(id)a3 relevantPassUniqueID:(id)a4 fromAppWithLocalizedName:(id)a5 applicationIdentifier:(id)a6 bundleIdentifier:(id)a7 teamIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_msgSend(MEMORY[0x1E0D67290], "validatorWithObject:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v21 = objc_msgSend(v20, "isValidWithError:", &v25);
  v22 = v25;

  if ((v21 & 1) != 0)
  {
    -[PKPaymentAuthorizationServiceViewController _setupWithPaymentRequest:relevantPassUniqueID:fromAppWithLocalizedName:applicationIdentifier:bundleIdentifier:teamIdentifier:](self, "_setupWithPaymentRequest:relevantPassUniqueID:fromAppWithLocalizedName:applicationIdentifier:bundleIdentifier:teamIdentifier:", v14, v15, v16, v17, v18, v19);
    if (!v22)
      goto LABEL_8;
    goto LABEL_7;
  }
  PKLogFacilityTypeGetObject();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v27 = v22;
    _os_log_error_impl(&dword_19D178000, v23, OS_LOG_TYPE_ERROR, "Payment is invalid: %{public}@", buf, 0xCu);
  }

  if (v22)
LABEL_7:
    -[PKPaymentAuthorizationStateMachine didEncounterFatalError:](self->_stateMachine, "didEncounterFatalError:", v22);
LABEL_8:

  return v22;
}

- (void)invalidate
{
  -[PKPaymentAuthorizationServiceViewController _suspendAuthenticationAndForceReset:](self, "_suspendAuthenticationAndForceReset:", 0);
  -[PKAuthenticator invalidate](self->_authenticator, "invalidate");
}

- (BOOL)paymentAuthorizationStateMachine:(id)a3 didTransitionFromState:(unint64_t)a4 toState:(unint64_t)a5 withParam:(id)a6
{
  id v8;

  v8 = a6;
  -[PKPaymentAuthorizationServiceViewController _updateCancelButtonEnabledForState:param:](self, "_updateCancelButtonEnabledForState:param:", a5, v8);
  switch(a5)
  {
    case 3uLL:
      -[PKPaymentAuthorizationServiceViewController _invalidPaymentDataWithParam:](self, "_invalidPaymentDataWithParam:", v8);
      break;
    case 5uLL:
      -[PKPaymentAuthorizationServiceViewController _resumeAuthenticationWithPreviousError:animated:](self, "_resumeAuthenticationWithPreviousError:animated:", v8, 1);
      break;
    case 6uLL:
      -[PKPaymentAuthorizationServiceViewController _suspendAuthentication](self, "_suspendAuthentication");
      break;
    case 7uLL:
      -[PKPaymentAuthorizationServiceViewController _processClientCallback:](self, "_processClientCallback:", v8);
      break;
    case 9uLL:
      -[PKPaymentAuthorizationServiceViewController setFooterState:string:animated:](self, "setFooterState:string:animated:", 11, 0, 1);
      break;
    case 0xDuLL:
      -[PKPaymentAuthorizationServiceViewController _didCancel:](self, "_didCancel:", 1);
      break;
    case 0xEuLL:
      -[PKPaymentAuthorizationServiceViewController _didFailWithError:](self, "_didFailWithError:", v8);
      break;
    case 0xFuLL:
      -[PKPaymentAuthorizationServiceViewController _didFailWithFatalError:](self, "_didFailWithFatalError:", v8);
      break;
    case 0x10uLL:
      -[PKPaymentAuthorizationServiceViewController _didSucceedWithAuthorizationStateParam:](self, "_didSucceedWithAuthorizationStateParam:", v8);
      break;
    default:
      break;
  }

  return 1;
}

- (void)_updateCancelButtonEnabledForState:(unint64_t)a3 param:(id)a4
{
  void *v6;
  void *v7;
  BOOL v8;
  _BOOL4 v9;
  BOOL v10;
  id v11;

  v11 = a4;
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paymentRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (objc_msgSend(v7, "isPeerPaymentRequest") & 1) != 0 || objc_msgSend(v7, "APIType") == 3;
  if (a3 == 7)
  {
    v9 = objc_msgSend(v11, "kind") >= 5 && objc_msgSend(v11, "kind") < 9;
  }
  else
  {
    v9 = a3 == 16;
    if (a3 - 9 < 4)
      v9 = 1;
  }
  self->_cancelButtonDisabled = v9;
  -[UIBarButtonItem setEnabled:](self->_cancelBarButtonItem, "setEnabled:", !v9);
  v10 = self->_cancelButtonDisabled && v8;
  self->_blockingHardwareCancels = v10;

}

- (void)_processClientCallback:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PKPaymentAuthorizationServiceViewController setFooterState:string:animated:](self, "setFooterState:string:animated:", 10, 0, 1);
  switch(objc_msgSend(v11, "kind"))
  {
    case 0:
      WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      objc_msgSend(WeakRetained, "authorizationDidRequestMerchantSession");
      goto LABEL_16;
    case 1:
      WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      objc_msgSend(v11, "shippingContact");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "authorizationDidSelectShippingAddress:", v5);
      goto LABEL_15;
    case 2:
      WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      objc_msgSend(v11, "shippingMethod");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "authorizationDidSelectShippingMethod:", v5);
      goto LABEL_15;
    case 3:
      WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      objc_msgSend(v11, "paymentMethod");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "authorizationDidSelectPaymentMethod:", v5);
      goto LABEL_15;
    case 4:
      WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      objc_msgSend(WeakRetained, "authorizationDidAuthorizeContext");
      goto LABEL_16;
    case 5:
      if (self->_isAMPPayment)
      {
        objc_msgSend(v11, "payment");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setBiometricAuthorizationAttempts:", self->_biometryAttempts);

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      objc_msgSend(v11, "payment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "authorizationDidAuthorizePayment:", v5);
      goto LABEL_15;
    case 6:
      WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      objc_msgSend(v11, "purchase");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "authorizationDidAuthorizePurchase:", v5);
      goto LABEL_15;
    case 7:
      WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      objc_msgSend(v11, "authorizedPeerPaymentQuote");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "authorizationDidAuthorizePeerPaymentQuote:", v5);
      goto LABEL_15;
    case 8:
      WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      objc_msgSend(v11, "applePayTrustSignature");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "authorizationDidAuthorizeApplePayTrustSignature:", v5);
      goto LABEL_15;
    case 9:
      WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      objc_msgSend(v11, "accountServicePaymentMethod");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "authorizationDidUpdateAccountServicePaymentMethod:", v5);
      goto LABEL_15;
    case 10:
      WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      objc_msgSend(v11, "couponCode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "authorizationDidChangeCouponCode:", v5);
LABEL_15:

LABEL_16:
      break;
    default:
      break;
  }
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mode");

  if (v8 != 3)
  {
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "paymentErrors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationServiceViewController _updatePreferencesWithErrors:](self, "_updatePreferencesWithErrors:", v10);

  }
}

- (void)_invalidPaymentDataWithParam:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedFailureReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationServiceViewController setFooterState:string:animated:](self, "setFooterState:string:animated:", 13, v6, 1);

  objc_msgSend(v4, "clientErrors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Invalid data with client errors: %@", (uint8_t *)&v9, 0xCu);
  }

  -[PKPaymentAuthorizationServiceViewController _updatePreferencesWithErrors:](self, "_updatePreferencesWithErrors:", v7);
  -[PKPaymentAuthorizationServiceViewController _showUnserviceableAddressAlertForErrors:](self, "_showUnserviceableAddressAlertForErrors:", v7);

}

- (void)_resumeAuthenticationWithPreviousError:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  int64_t v17;
  NSObject *v18;
  void *v19;
  int v20;
  int v21;
  PKPaymentAuthorizationServiceViewController *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paymentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "_isAMPPayment") & 1) != 0
    || objc_msgSend(v8, "requestType") == 7
    || objc_msgSend(v8, "requestType") == 13)
  {
    if (objc_msgSend(v8, "accesssControlRef"))
      v9 = objc_msgSend(MEMORY[0x1E0D6BFD8], "currentStateForAccessControl:", objc_msgSend(v8, "accesssControlRef"));
    else
      v9 = 0;
    v10 = v9 == 0;
    if (objc_msgSend(v8, "_isAMPPayment"))
    {
      -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "mode");

      if (v12 == 1)
      {
        v13 = objc_msgSend(v8, "_isPSD2StyleRequest");
        v14 = objc_msgSend(MEMORY[0x1E0D6BFD8], "currentStateForPolicy:", -[PKPaymentAuthorizationServiceViewController _authenticatorPolicy](self, "_authenticatorPolicy"));
        if (v13)
        {
          v9 &= v14;
          if ((v9 & 0xE) == 0)
          {
            -[PKPaymentAuthorizationServiceViewController _abandonPSD2StyleAMPBuy](self, "_abandonPSD2StyleAMPBuy");
            if ((v9 & 6) == 0)
              goto LABEL_28;
            goto LABEL_24;
          }
        }
        else if ((v9 & v14 & 6) == 0)
        {
          PKLogFacilityTypeGetObject();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v21) = 0;
            _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "Abandoning enrollment due to authenticator policy", (uint8_t *)&v21, 2u);
          }

          -[PKPaymentAuthorizationServiceViewController _abandonActiveEnrollmentAttempts](self, "_abandonActiveEnrollmentAttempts");
        }
      }
    }
  }
  else
  {
    v9 = objc_msgSend(MEMORY[0x1E0D6BFD8], "currentStateForPolicy:", -[PKPaymentAuthorizationServiceViewController _authenticatorPolicy](self, "_authenticatorPolicy"));
    v10 = 0;
  }
  if ((v9 & 1) != 0 || v10)
  {
    if ((v9 & 6) == 0)
    {
      if (v10)
      {
LABEL_28:
        PKLogFacilityTypeGetObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v21) = 0;
          _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "In bypass auth mode and passcode required: dropping authentication and falling back to password auth", (uint8_t *)&v21, 2u);
        }

        -[PKPaymentAuthorizationServiceViewController _suspendAuthentication](self, "_suspendAuthentication");
        -[PKPaymentAuthorizationServiceViewController view](self, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setNeedsUpdateConstraints");

        v20 = 0;
        v17 = 4;
        goto LABEL_35;
      }
      if (PKUserIntentIsAvailable())
        v17 = 3;
      else
        v17 = 4;
LABEL_34:
      v20 = 1;
LABEL_35:
      if (self->_authenticating)
        v17 = -[PKPaymentAuthorizationServiceViewController _progressStateForAuthenticationWithBiometricFailure:](self, "_progressStateForAuthenticationWithBiometricFailure:", 0);
      if (a3)
      {
        PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_TRY_AGAIN"));
        a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      -[PKPaymentAuthorizationServiceViewController setFooterState:string:animated:](self, "setFooterState:string:animated:", v17, a3, v4);
      if (v20)
        -[PKPaymentAuthorizationServiceViewController _startEvaluationWithHasInitialAuthenticatorState:initialAuthenticatorState:](self, "_startEvaluationWithHasInitialAuthenticatorState:initialAuthenticatorState:", 1, v9);

      goto LABEL_42;
    }
LABEL_24:
    if (PKPearlIsAvailable())
      v17 = 3;
    else
      v17 = 0;
    goto LABEL_34;
  }
  PKLogFacilityTypeGetObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 134349056;
    v22 = self;
    _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationServiceViewController (%{public}p): Unable to evaluate policy; will cancel.",
      (uint8_t *)&v21,
      0xCu);
  }

  -[PKPaymentAuthorizationServiceViewController _didCancel:](self, "_didCancel:", 1);
LABEL_42:

}

- (BOOL)_abandonActiveEnrollmentAttempts
{
  void *v2;
  void *v3;
  uint64_t v4;
  BOOL v5;

  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "requestType") != 1)
  {

    goto LABEL_5;
  }
  v4 = objc_msgSend(v2, "mode");

  if (v4 != 1)
  {
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v2, "fallbackToBypassMode");
  v5 = 1;
LABEL_6:

  return v5;
}

- (void)_abandonPSD2StyleAMPBuy
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_isPSD2StyleRequest") & 1) != 0)
  {
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "mode");

    if (v5 != 1)
      return;
    -[PKPaymentAuthorizationServiceViewController _setNavigationItemLeftItemForAMP](self, "_setNavigationItemLeftItemForAMP");
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fallbackToBypassMode");
  }
  else
  {

  }
}

- (void)_suspendAuthentication
{
  -[PKPaymentAuthorizationServiceViewController _suspendAuthenticationAndForceReset:](self, "_suspendAuthenticationAndForceReset:", 1);
}

- (void)_suspendAuthenticationAndForceReset:(BOOL)a3
{
  PKAuthenticator *authenticator;
  uint64_t v5;

  if (self->_authenticating)
  {
    authenticator = self->_authenticator;
    if (a3)
      v5 = 3;
    else
      v5 = 1;
    -[PKAuthenticator cancelEvaluationWithOptions:](authenticator, "cancelEvaluationWithOptions:", v5);
    -[PKPaymentAuthorizationServiceViewController _setAuthenticating:](self, "_setAuthenticating:", 0);
  }
}

- (void)_startEvaluationWithHasInitialAuthenticatorState:(BOOL)a3 initialAuthenticatorState:(unint64_t)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  BOOL v49;
  void *v50;
  uint64_t v51;
  const __CFString *v52;
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
  uint64_t v70;
  const __CFString *v71;
  PKAuthenticator *authenticator;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  _BOOL4 v79;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  _QWORD v86[5];
  id v87;
  id location;
  uint64_t v89;
  _QWORD v90[3];

  v90[1] = *MEMORY[0x1E0C80C00];
  if (self->_authenticating)
    return;
  v79 = a3;
  -[PKPaymentAuthorizationServiceViewController _setAuthenticating:](self, "_setAuthenticating:", 1);
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0D66A58];
  v78 = *MEMORY[0x1E0D68AA0];
  v89 = *MEMORY[0x1E0D68AA0];
  v90[0] = *MEMORY[0x1E0D68C18];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, &v89, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = *MEMORY[0x1E0D698F8];
  objc_msgSend(v5, "subject:sendEvent:");

  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v85 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v7, "currencyCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D69600]);

  objc_msgSend(v7, "totalSummaryItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "type") == 0;

  if (v10)
  {
    objc_msgSend(v7, "transactionAmount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "totalSummaryItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0
      && (objc_msgSend(MEMORY[0x1E0CB3598], "zero"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v14, "isEqual:", v17),
          v17,
          v18))
    {
      PKAnalyticsReportSwitchToggleResultValue();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D695E0]);

      objc_msgSend(v85, "setObject:forKeyedSubscript:", CFSTR("Free"), *MEMORY[0x1E0D695F0]);
    }
    else
    {
      objc_msgSend(v7, "initialTransactionAmount");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "isEqual:", v21);

        if ((v22 & 1) == 0)
        {
          objc_msgSend(v14, "decimalNumberBySubtracting:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v20, "copy");
          objc_msgSend(MEMORY[0x1E0CB3598], "zero");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "compare:", v25) == -1;

          if (v26)
          {
            objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("-1"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "decimalNumberByMultiplyingBy:", v27);
            v28 = objc_claimAutoreleasedReturnValue();

            v24 = (void *)v28;
          }
          objc_msgSend(v23, "decimalNumberByDividingBy:", v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("100"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "decimalNumberByMultiplyingBy:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          v32 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v31, "doubleValue");
          objc_msgSend(v32, "stringWithFormat:", CFSTR("%.2lf"), v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0D695E8]);

        }
      }
      PKAnalyticsReportSwitchToggleResultValue();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "setObject:forKeyedSubscript:", v35, *MEMORY[0x1E0D695E0]);

    }
  }
  else
  {
    objc_msgSend(v7, "totalSummaryItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "type") == 1;

    if (v12)
    {
      PKAnalyticsReportSwitchToggleResultValue();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D695E0]);

      objc_msgSend(v85, "setObject:forKeyedSubscript:", CFSTR("Amount Pending"), *MEMORY[0x1E0D695F0]);
    }
  }
  v36 = v7;
  v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v36, "hasAnyPayLaterOptions");
  v38 = objc_msgSend(v36, "fundingMode");
  if (!v38 || v38 == 2)
  {
    v46 = objc_msgSend(v36, "mode");
    if (v46 == 2)
    {
      objc_msgSend(v36, "remotePaymentInstrument");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "organizationName");
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "remotePaymentInstrument");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "issuerCountryCode");
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "remotePaymentInstrument");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "isCobranded");
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "remotePaymentInstrument");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "cobrandName");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;

    }
    else if (v46 == 1)
    {
      objc_msgSend(v36, "pass");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "pass");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "uniqueID");
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v75, "organizationName");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "issuerCountryCode");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v75, "isCobranded"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "cobrandName");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v36, "fundingMode") == 2)
      {
        objc_msgSend(v36, "selectedPaymentOffer");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v48 == 0;

        v45 = CFSTR("payInFull");
        if (!v49)
        {
          objc_msgSend(v36, "selectedPaymentOffer");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "type");

          v52 = CFSTR("installments");
          if (v51 != 1)
            v52 = CFSTR("payInFull");
          if (v51 == 2)
            v45 = CFSTR("rewards");
          else
            v45 = v52;
        }
      }
      else
      {
        v45 = CFSTR("payInFull");
      }
      objc_msgSend(v36, "paymentOffersController");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "eligiblePaymentOfferCriteriaForPassUniqueID:type:", v74, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v58 != 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v58)
      {
        objc_msgSend(v57, "ineligibleDetailsForCriteria:", v58);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v43 = 0;
      }
      objc_msgSend(v57, "eligiblePaymentOfferCriteriaForPassUniqueID:type:", v74, 2);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v59 != 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v81 = 0;
      v82 = 0;
      v83 = 0;
      v84 = 0;
    }
    objc_msgSend(v36, "paymentApplication");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v60;
    if (v60)
    {
      objc_msgSend(v60, "paymentNetworkIdentifier");
      PKPaymentNetworkNameForPaymentCredentialType();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "paymentType");
      PKPaymentMethodTypeToString();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_43:

      goto LABEL_44;
    }
    goto LABEL_41;
  }
  if (v38 == 1)
  {
    objc_msgSend(v36, "selectedFinancingOption");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v39)
    {
      objc_msgSend(v39, "productType");
      PKPayLaterAccountProductTypeToString();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v81 = 0;
      v82 = 0;
      v83 = 0;
      v84 = 0;
LABEL_42:
      v53 = 0;
      goto LABEL_43;
    }
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    v81 = 0;
    v82 = 0;
    v83 = 0;
    v84 = 0;
LABEL_41:
    v41 = 0;
    goto LABEL_42;
  }
  v42 = 0;
  v43 = 0;
  v44 = 0;
  v45 = 0;
  v81 = 0;
  v82 = 0;
  v83 = 0;
  v84 = 0;
  v41 = 0;
  v53 = 0;
LABEL_44:
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v53, *MEMORY[0x1E0D690E0]);
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0D690D8]);
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v83, *MEMORY[0x1E0D69018]);
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v82, *MEMORY[0x1E0D69010]);
  if (v84)
  {
    objc_msgSend(v84, "BOOLValue");
    PKAnalyticsReportSwitchToggleResultValue();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v61, *MEMORY[0x1E0D69008]);

  }
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v81, *MEMORY[0x1E0D68FA0]);
  PKAnalyticsReportSwitchToggleResultValue();
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v62, *MEMORY[0x1E0D68EE8]);

  PKHideCardBenefitPayLater();
  PKAnalyticsReportSwitchToggleResultValue();
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v63, *MEMORY[0x1E0D69078]);

  PKHidePayLaterOptions();
  PKAnalyticsReportSwitchToggleResultValue();
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v64, *MEMORY[0x1E0D68D58]);

  PKHideCardBenefitRewards();
  PKAnalyticsReportSwitchToggleResultValue();
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v65, *MEMORY[0x1E0D690A0]);

  if (v45)
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v45, *MEMORY[0x1E0D690D0]);
  if (v42)
  {
    objc_msgSend(v42, "BOOLValue");
    PKAnalyticsReportSwitchToggleResultValue();
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v66, *MEMORY[0x1E0D68D50]);

  }
  if (v43)
  {
    objc_msgSend(v43, "analyticsValue");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v67, *MEMORY[0x1E0D68D40]);

  }
  if (v44)
  {
    objc_msgSend(v44, "BOOLValue");
    PKAnalyticsReportSwitchToggleResultValue();
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v68, *MEMORY[0x1E0D69098]);

  }
  if (PKBankConnectEnabled())
  {
    objc_msgSend(v36, "pass");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v36, "connectedCardStateForPass:", v69);

    if (v70)
    {
      if (v70 == 2)
      {
        v71 = CFSTR("false");
      }
      else if (v70 == 1)
      {
        v71 = CFSTR("true");
      }
      else
      {
        v71 = 0;
      }
      objc_msgSend(v37, "setObject:forKeyedSubscript:", v71, *MEMORY[0x1E0D68D60]);
    }
  }

  objc_msgSend(v85, "addEntriesFromDictionary:", v37);
  if (objc_msgSend(v85, "count"))
    objc_msgSend(v85, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68BC8], v78);

  if (objc_msgSend(v85, "count"))
    objc_msgSend(MEMORY[0x1E0D66A58], "subject:sendEvent:", v77, v85);
  authenticator = self->_authenticator;
  -[PKPaymentAuthorizationServiceViewController _evaluationRequestWithHasInitialAuthenticatorState:initialAuthenticatorState:](self, "_evaluationRequestWithHasInitialAuthenticatorState:initialAuthenticatorState:", v79, a4);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = __122__PKPaymentAuthorizationServiceViewController__startEvaluationWithHasInitialAuthenticatorState_initialAuthenticatorState___block_invoke;
  v86[3] = &unk_1E3E63240;
  objc_copyWeak(&v87, &location);
  v86[4] = self;
  -[PKAuthenticator evaluateRequest:withCompletion:](authenticator, "evaluateRequest:withCompletion:", v73, v86);

  objc_destroyWeak(&v87);
  objc_destroyWeak(&location);
}

void __122__PKPaymentAuthorizationServiceViewController__startEvaluationWithHasInitialAuthenticatorState_initialAuthenticatorState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __122__PKPaymentAuthorizationServiceViewController__startEvaluationWithHasInitialAuthenticatorState_initialAuthenticatorState___block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __122__PKPaymentAuthorizationServiceViewController__startEvaluationWithHasInitialAuthenticatorState_initialAuthenticatorState___block_invoke_2(id *a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char IsAuthentication;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  CFAbsoluteTime Current;
  id *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  _QWORD v43[4];
  id v44;
  const __CFString *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  const __CFString *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_setAuthenticating:", 0);
    v4 = objc_msgSend(a1[4], "result");
    switch(v4)
    {
      case 0:
        objc_msgSend(v3, "stateMachine");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "state");
        IsAuthentication = PKPaymentAuthorizationStateIsAuthentication();

        if ((IsAuthentication & 1) != 0)
        {
          v13 = (void *)MEMORY[0x1E0D66A58];
          v61 = *MEMORY[0x1E0D68AA0];
          v62[0] = *MEMORY[0x1E0D68AF8];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "subject:sendEvent:", *MEMORY[0x1E0D698F8], v14);

          v3[163] = (char *)v3[163] + 1;
          PKLogFacilityTypeGetObject();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "Authentication successful.", buf, 2u);
          }

          if (objc_msgSend(a1[4], "biometricMatch"))
          {
            objc_msgSend(MEMORY[0x1E0D6BFF0], "invokeSuccessFeedback");
            objc_msgSend(v3, "setFooterState:string:animated:", 8, 0, 1);
          }
          if ((PKPearlIsAvailable() & 1) == 0)
          {
            objc_msgSend(*((id *)a1[5] + 171), "beginDelayingAuthorizedState");
            objc_initWeak((id *)buf, *((id *)a1[5] + 171));
            v16 = a1[5];
            v43[0] = MEMORY[0x1E0C809B0];
            v43[1] = 3221225472;
            v43[2] = __122__PKPaymentAuthorizationServiceViewController__startEvaluationWithHasInitialAuthenticatorState_initialAuthenticatorState___block_invoke_84;
            v43[3] = &unk_1E3E61C58;
            objc_copyWeak(&v44, (id *)buf);
            objc_msgSend(v16, "setFooterState:string:animated:withCompletion:", 11, 0, 1, v43);
            Current = CFAbsoluteTimeGetCurrent();
            v18 = (id *)a1[5];
            if (*((double *)v18 + 168) - Current + 0.5 > 0.0)
              objc_msgSend(v18[171], "delayAuthorizedStateByDuration:");
            objc_destroyWeak(&v44);
            objc_destroyWeak((id *)buf);
          }
          v19 = objc_loadWeakRetained(v3 + 178);
          objc_msgSend(v19, "authorizationWillStart");

          v20 = v3[171];
          objc_msgSend(a1[4], "credential");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "didAuthenticateWithCredential:", v21);

        }
        else
        {
          PKLogFacilityTypeGetObject();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D178000, v42, OS_LOG_TYPE_DEFAULT, "Authentication successful but in wrong state - discarding credential", buf, 2u);
          }

        }
        break;
      case 1:
        goto LABEL_7;
      case 2:
      case 7:
LABEL_3:
        PKLogFacilityTypeGetObject();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Authentication canceled by app.", buf, 2u);
        }

        v6 = (void *)MEMORY[0x1E0D66A58];
        v57 = *MEMORY[0x1E0D68AA0];
        v58 = *MEMORY[0x1E0D68AD0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "subject:sendEvent:", *MEMORY[0x1E0D698F8], v7);

        break;
      case 3:
      case 6:
        objc_msgSend(a1[5], "_sendDidEncounterAuthorizationEventIfNecessary:", 2);
        if ((objc_msgSend(a1[5], "_abandonActiveEnrollmentAttempts") & 1) != 0)
        {
LABEL_7:
          PKLogFacilityTypeGetObject();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Authentication canceled by user.", buf, 2u);
          }

          v9 = (void *)MEMORY[0x1E0D66A58];
          v59 = *MEMORY[0x1E0D68AA0];
          v60 = *MEMORY[0x1E0D68AD8];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "subject:sendEvent:", *MEMORY[0x1E0D698F8], v10);

          objc_msgSend(v3[171], "didResolveError");
          if (!*((_BYTE *)v3 + 1275))
            objc_msgSend(v3[128], "setHidden:", 1);
        }
        else
        {
          switch(v4)
          {
            case 3:
            case 6:
              goto LABEL_3;
            case 4:
              goto LABEL_22;
            case 5:
              goto LABEL_25;
            default:
              goto LABEL_31;
          }
        }
        break;
      case 4:
LABEL_22:
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "processName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "processIdentifier");
        PKLogFacilityTypeGetObject();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v54 = v23;
          v55 = 2048;
          v56 = v24;
          _os_log_impl(&dword_19D178000, v25, OS_LOG_TYPE_DEFAULT, "Authentication by %@[%ld] preempted by another process.", buf, 0x16u);
        }

        v26 = (void *)MEMORY[0x1E0D66A58];
        v51 = *MEMORY[0x1E0D68AA0];
        v52 = *MEMORY[0x1E0D68AF0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "subject:sendEvent:", *MEMORY[0x1E0D698F8], v27);

        v28 = v3[171];
        v29 = (void *)MEMORY[0x1E0CB35C8];
        v49 = CFSTR("PKAuthenticatorResult");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A758], -1, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "didEncounterFatalError:", v32);

        break;
      case 5:
LABEL_25:
        PKLogFacilityTypeGetObject();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v54 = 0;
          _os_log_impl(&dword_19D178000, v33, OS_LOG_TYPE_DEFAULT, "Failed to authenticate for e-commerce: %@", buf, 0xCu);
        }

        v34 = (void *)MEMORY[0x1E0D66A58];
        v47 = *MEMORY[0x1E0D68AA0];
        v48 = *MEMORY[0x1E0D68AE0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "subject:sendEvent:", *MEMORY[0x1E0D698F8], v35);

        v36 = (void *)MEMORY[0x1E0D67098];
        v37 = (void *)MEMORY[0x1E0CB35C8];
        v45 = CFSTR("PKAuthenticatorResult");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 5);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A758], -1, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "paramWithError:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_didFailWithError:", v41);

        break;
      default:
        break;
    }
  }
LABEL_31:

}

void __122__PKPaymentAuthorizationServiceViewController__startEvaluationWithHasInitialAuthenticatorState_initialAuthenticatorState___block_invoke_84(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "endDelayingAuthorizedState");

}

- (void)_selectOptionsForDataItem:(id)a3
{
  id v4;
  int *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPaymentAuthorizationServiceViewController _suspendAuthentication](self, "_suspendAuthentication");
  switch(objc_msgSend(v4, "type"))
  {
    case 0:
      goto LABEL_20;
    case 2:
      v5 = &OBJC_IVAR___PKPaymentAuthorizationServiceViewController__paymentCardPreferencesController;
      -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "paymentRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "isPeerPaymentRequest") & 1) != 0)
        goto LABEL_5;
      if (objc_msgSend(v7, "requestType") == 2)
      {
        v5 = &OBJC_IVAR___PKPaymentAuthorizationServiceViewController__bankAccountPreferencesController;
LABEL_5:
        v8 = *(id *)((char *)&self->super.super.super.isa + *v5);
      }
      else
      {
        v8 = 0;
      }

      if (v8)
        goto LABEL_15;
      goto LABEL_20;
    case 3:
      v9 = 1104;
      goto LABEL_14;
    case 5:
      v9 = 1088;
      goto LABEL_14;
    case 6:
      v9 = 1080;
      goto LABEL_14;
    case 7:
      v9 = 1096;
      goto LABEL_14;
    case 9:
      v9 = 1112;
      goto LABEL_14;
    case 11:
      v9 = 1120;
LABEL_14:
      v8 = *(id *)((char *)&self->super.super.super.isa + v9);
      if (!v8)
        goto LABEL_20;
LABEL_15:
      -[PKPaymentAuthorizationServiceViewController navigationController](self, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "pushViewController:animated:", v8, 1);
      }
      else
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v8);
        -[PKPaymentAuthorizationServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

      }
      -[PKPaymentAuthorizationStateMachine didResignActive:](self->_stateMachine, "didResignActive:", 0);

LABEL_19:
LABEL_20:

      return;
    default:
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v13 = 138543362;
        v14 = v4;
        _os_log_error_impl(&dword_19D178000, v8, OS_LOG_TYPE_ERROR, "No options view controller is available for selected data item %{public}@", (uint8_t *)&v13, 0xCu);
      }
      goto LABEL_19;
  }
}

- (void)setFooterState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5
{
  -[PKPaymentAuthorizationServiceViewController setFooterState:string:animated:withCompletion:](self, "setFooterState:string:animated:withCompletion:", a3, a4, a5, 0);
}

- (void)setFooterState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL8 v7;
  id v10;
  BOOL v11;
  id v12;

  v7 = a5;
  v12 = a4;
  v10 = a6;
  if (a3 == 3)
  {
    v11 = 1;
LABEL_6:
    self->_allowCompactProcessing = v11;
    goto LABEL_7;
  }
  if (a3 != 10 && self->_allowCompactProcessing)
  {
    v11 = (unint64_t)a3 < 2;
    goto LABEL_6;
  }
LABEL_7:
  -[PKPaymentAuthorizationFooterView setState:string:animated:withCompletion:](self->_footerView, "setState:string:animated:withCompletion:", a3, v12, v7, v10);
  -[PKPaymentAuthorizationServiceViewController _updatePhysicalButtonState](self, "_updatePhysicalButtonState");

}

- (void)_showScrollIndicatorIfNeeded
{
  BOOL v3;

  if (-[UITableView isScrollEnabled](self->_detailTableView, "isScrollEnabled"))
  {
    if (self->_scrollIndicatorShown)
      return;
    -[UITableView flashScrollIndicators](self->_detailTableView, "flashScrollIndicators");
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  self->_scrollIndicatorShown = v3;
}

- (void)handleHostApplicationDidCancel
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  PKPaymentAuthorizationServiceViewController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134349056;
    v6 = self;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationServiceViewController (%{public}p): Presenting remote view controller cancelled payment", (uint8_t *)&v5, 0xCu);
  }

  -[PKPaymentAuthorizationStateMachine didCancel](self->_stateMachine, "didCancel");
  if (self->_needsFinalCallback)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_host);
    objc_msgSend(WeakRetained, "authorizationDidFinishWithError:", 0);

    self->_needsFinalCallback = 0;
  }
}

- (void)handleDismissWithCompletion:(id)a3
{
  id v4;
  id WeakRetained;

  v4 = a3;
  -[PKPaymentAuthorizationServiceViewController _executeCompletionHandlers](self, "_executeCompletionHandlers");
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  objc_msgSend(WeakRetained, "dismissWithReason:error:completion:", 2, 0, v4);

}

- (void)handleHostApplicationWillResignActive:(BOOL)a3
{
  self->_hostApplicationResignedActive = 1;
  -[PKPaymentAuthorizationServiceViewController _updateBackgroundedState:](self, "_updateBackgroundedState:", a3);
}

- (void)handleHostApplicationDidBecomeActive
{
  self->_hostApplicationResignedActive = 0;
  -[PKPaymentAuthorizationServiceViewController _updateBackgroundedState:](self, "_updateBackgroundedState:", 0);
}

- (void)_hostApplicationWillEnterForeground
{
  self->_hostApplicationEnteredBackground = 0;
  -[PKPaymentAuthorizationServiceViewController _updateBackgroundedState:](self, "_updateBackgroundedState:", 0);
}

- (void)_hostApplicationDidEnterBackground
{
  self->_hostApplicationEnteredBackground = 1;
  -[PKPaymentAuthorizationServiceViewController _updateBackgroundedState:](self, "_updateBackgroundedState:", 0);
}

- (void)_updateBackgroundedState:(BOOL)a3
{
  _BOOL4 v3;

  if (self->_hostApplicationEnteredBackground)
  {
    if (self->_hostApplicationResignedActive)
    {
      if (self->_treatingHostAsBackgrounded)
        return;
      self->_treatingHostAsBackgrounded = 1;
      goto LABEL_10;
    }
    if (self->_treatingHostAsBackgrounded)
    {
      self->_treatingHostAsBackgrounded = 0;
LABEL_13:
      -[PKPaymentAuthorizationStateMachine didBecomeActive:](self->_stateMachine, "didBecomeActive:", 1);
    }
  }
  else
  {
    v3 = self->_hostApplicationResignedActive && a3;
    if (((v3 ^ !self->_treatingHostAsBackgrounded) & 1) == 0)
    {
      self->_treatingHostAsBackgrounded = v3;
      if (v3)
      {
LABEL_10:
        -[PKPaymentAuthorizationStateMachine didResignActive:](self->_stateMachine, "didResignActive:", 1);
        return;
      }
      goto LABEL_13;
    }
  }
}

- (void)authorizationDidAuthorizeContextCompleteWithResult:(id)a3
{
  -[PKPaymentAuthorizationStateMachine didReceivePaymentAuthorizationResult:](self->_stateMachine, "didReceivePaymentAuthorizationResult:", a3);
}

- (void)authorizationDidAuthorizePaymentCompleteWithResult:(id)a3
{
  -[PKPaymentAuthorizationStateMachine didReceivePaymentAuthorizationResult:](self->_stateMachine, "didReceivePaymentAuthorizationResult:", a3);
}

- (void)authorizationDidAuthorizePurchaseCompleteWithStatus:(int64_t)a3
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0D670A8]);
  objc_msgSend(v5, "setStatus:", a3);
  -[PKPaymentAuthorizationStateMachine didReceivePaymentAuthorizationResult:](self->_stateMachine, "didReceivePaymentAuthorizationResult:", v5);

}

- (void)authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult:(id)a3
{
  -[PKPaymentAuthorizationStateMachine didReceivePaymentAuthorizationResult:](self->_stateMachine, "didReceivePaymentAuthorizationResult:", a3);
}

- (void)authorizationDidAuthorizeApplePayTrustSignatureCompleteWithResult:(id)a3
{
  -[PKPaymentAuthorizationStateMachine didReceivePaymentAuthorizationResult:](self->_stateMachine, "didReceivePaymentAuthorizationResult:", a3);
}

- (void)authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:(id)a3 signatureRequest:(id)a4
{
  -[PKPaymentAuthorizationStateMachine didReceiveUpdateAccountServicePaymentMethodCompleteWithUpdate:signatureRequest:](self->_stateMachine, "didReceiveUpdateAccountServicePaymentMethodCompleteWithUpdate:signatureRequest:", a3, a4);
}

- (void)authorizationDidRequestMerchantSessionCompleteWithUpdate:(id)a3
{
  -[PKPaymentAuthorizationStateMachine didReceiveMerchantSessionCompleteWithUpdate:](self->_stateMachine, "didReceiveMerchantSessionCompleteWithUpdate:", a3);
}

- (void)authorizationDidSelectShippingMethodCompleteWithUpdate:(id)a3
{
  -[PKPaymentAuthorizationStateMachine didReceiveShippingMethodCompleteWithUpdate:](self->_stateMachine, "didReceiveShippingMethodCompleteWithUpdate:", a3);
}

- (void)authorizationDidSelectShippingAddressCompleteWithUpdate:(id)a3
{
  -[PKPaymentAuthorizationStateMachine didReceiveShippingContactCompleteWithUpdate:](self->_stateMachine, "didReceiveShippingContactCompleteWithUpdate:", a3);
  -[PKPaymentAuthorizationServiceViewController _updateShippingMethods](self, "_updateShippingMethods");
}

- (void)authorizationDidSelectPaymentMethodCompleteWithUpdate:(id)a3
{
  -[PKPaymentAuthorizationStateMachine didReceivePaymentMethodCompleteWithUpdate:](self->_stateMachine, "didReceivePaymentMethodCompleteWithUpdate:", a3);
}

- (void)authorizationDidChangeCouponCodeCompleteWithUpdate:(id)a3
{
  -[PKPaymentAuthorizationStateMachine didReceiveCouponCodeCompleteWithUpdate:](self->_stateMachine, "didReceiveCouponCodeCompleteWithUpdate:", a3);
}

- (void)_executeCompletionHandlers
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableSet copy](self->_completionHandlers, "copy");
  -[NSMutableSet removeAllObjects](self->_completionHandlers, "removeAllObjects");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_didCancel:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;

  v3 = a3;
  -[PKPaymentAuthorizationServiceViewController _suspendAuthenticationAndForceReset:](self, "_suspendAuthenticationAndForceReset:");
  -[PKPaymentAuthorizationStateMachine didCancel](self->_stateMachine, "didCancel");
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_host);
    objc_msgSend(WeakRetained, "authorizationDidFinishWithError:", 0);

  }
}

- (void)_didFailWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
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
  id v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v5;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "In-app payment failed, error: %@", buf, 0xCu);
  }

  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6A758]))
    goto LABEL_20;
  v8 = objc_msgSend(v5, "code") == -2007;

  if (!v8)
    goto LABEL_21;
  objc_msgSend(v5, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "code");
  v12 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D6B0B8]);
  if (v11 == 2)
    v13 = v12;
  else
    v13 = 0;
  if (v13 == 1)
  {
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "paymentRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "originatingURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      PKLocalizedPaymentString(CFSTR("WEB_PAYMENT_ERROR_NOT_AVAILABLE_TITLE"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
    }
    else
    {
      -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "hostAppLocalizedName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_NOT_AVAILABLE_TITLE"), CFSTR("%@"), v22);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_NOT_AVAILABLE_MESSAGE"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v17, v18, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "actionWithTitle:style:handler:", v25, 1, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAction:", v26);

    -[PKPaymentAuthorizationServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v23, 1, 0);
  }
  else
  {
    v19 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D6BCB8]);
    if (v11 == 4)
      v20 = v19;
    else
      v20 = 0;
    if (v20 != 1)
      goto LABEL_19;
    v17 = v5;
    v5 = 0;
  }

LABEL_19:
LABEL_20:

LABEL_21:
  objc_msgSend(v5, "localizedFailureReason");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "paymentRequest");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedErrorMessage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      v32 = v30;
    }
    else
    {
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_NOT_COMPLETED"));
      v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    v27 = v32;

  }
  -[PKPaymentAuthorizationServiceViewController _suspendAuthentication](self, "_suspendAuthentication");
  objc_initWeak((id *)buf, self);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __65__PKPaymentAuthorizationServiceViewController__didFailWithError___block_invoke;
  v33[3] = &unk_1E3E61C58;
  objc_copyWeak(&v34, (id *)buf);
  -[PKPaymentAuthorizationServiceViewController setFooterState:string:animated:withCompletion:](self, "setFooterState:string:animated:withCompletion:", 13, v27, 1, v33);
  objc_destroyWeak(&v34);
  objc_destroyWeak((id *)buf);

}

void __65__PKPaymentAuthorizationServiceViewController__didFailWithError___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 450000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PKPaymentAuthorizationServiceViewController__didFailWithError___block_invoke_2;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

void __65__PKPaymentAuthorizationServiceViewController__didFailWithError___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[171], "didResolveError");
    WeakRetained = v2;
  }

}

- (void)_didFailWithFatalError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  PKPaymentAuthorizationServiceViewController *val;
  void *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  BOOL v49;
  _QWORD aBlock[4];
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  -[PKPaymentAuthorizationServiceViewController _suspendAuthentication](self, "_suspendAuthentication");
  val = self;
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "paymentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedErrorMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v40 = v5;
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_NOT_COMPLETED"));
    v40 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (objc_msgSend(v43, "mode") == 1)
  {
    objc_msgSend(v43, "pass");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v39, "hasAssociatedPeerPaymentAccount") & 1) != 0
      || (objc_msgSend(v39, "associatedAccountServiceAccountIdentifier"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      v8 = objc_alloc_init(MEMORY[0x1E0D672B0]);
      objc_msgSend(v43, "pendingTransactions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v54 != v11)
              objc_enumerationMutation(v9);
            v13 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
            objc_msgSend(v13, "transaction");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "paymentApplication");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "pass");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "uniqueID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            PKLogFacilityTypeGetObject();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v58 = v14;
              v59 = 2112;
              v60 = v17;
              v61 = 2112;
              v62 = v15;
              _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "Inserting transaction: %@ for pass: %@ paymentApplication: %@", buf, 0x20u);
            }

            objc_msgSend(v8, "insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:", v14, v17, v15, 0);
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
        }
        while (v10);
      }

    }
  }
  objc_msgSend(v41, "error");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "domain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D6A758]))
    v21 = objc_msgSend(v19, "code") == -2001;
  else
    v21 = 0;

  objc_initWeak((id *)buf, val);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKPaymentAuthorizationServiceViewController__didFailWithFatalError___block_invoke;
  aBlock[3] = &unk_1E3E61B68;
  objc_copyWeak(&v52, (id *)buf);
  v44 = v41;
  v51 = v44;
  v22 = _Block_copy(aBlock);
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __70__PKPaymentAuthorizationServiceViewController__didFailWithFatalError___block_invoke_2;
  v47[3] = &unk_1E3E74E30;
  v49 = v21;
  v23 = v22;
  v48 = v23;
  -[PKPaymentAuthorizationServiceViewController setFooterState:string:animated:withCompletion:](val, "setFooterState:string:animated:withCompletion:", 13, v40, 1, v47);
  if (v21)
  {
    -[PKPaymentAuthorizationStateMachine model](val->_stateMachine, "model");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "paymentRequest");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v25, "requestType") == 7 || objc_msgSend(v25, "requestType") == 13)
    {
      objc_msgSend(v25, "localizedCallbackErrorTitle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedCallbackErrorMessage");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
      v27 = 0;
    }
    if (objc_msgSend(v26, "length") && objc_msgSend(v27, "length"))
    {
      v28 = v27;
LABEL_36:
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v26, v28, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __70__PKPaymentAuthorizationServiceViewController__didFailWithFatalError___block_invoke_4;
      v45[3] = &unk_1E3E61CA8;
      v46 = v23;
      objc_msgSend(v36, "actionWithTitle:style:handler:", v37, 1, v45);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addAction:", v38);

      -[PKPaymentAuthorizationServiceViewController presentViewController:animated:completion:](val, "presentViewController:animated:completion:", v35, 1, 0);
      goto LABEL_37;
    }
    objc_msgSend(v25, "originatingURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      PKLocalizedPaymentString(CFSTR("WEB_PAYMENT_ERROR_CLIENT_CALLBACK_TITLE"));
      v30 = objc_claimAutoreleasedReturnValue();

      -[PKPaymentAuthorizationStateMachine model](val->_stateMachine, "model");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "merchantName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("WEB_PAYMENT_ERROR_CLIENT_CALLBACK_MESSAGE"), CFSTR("%@"), v32);
      v33 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v25, "isPeerPaymentRequest"))
      {
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_IN_APP_ERROR_CLIENT_CALLBACK_TITLE"));
        v34 = objc_claimAutoreleasedReturnValue();

        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_IN_APP_ERROR_CLIENT_CALLBACK_MESSAGE"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)v34;
LABEL_35:

        goto LABEL_36;
      }
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_CLIENT_CALLBACK_TITLE"));
      v30 = objc_claimAutoreleasedReturnValue();

      -[PKPaymentAuthorizationStateMachine model](val->_stateMachine, "model");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "merchantName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_CLIENT_CALLBACK_MESSAGE"), CFSTR("%@"), v32);
      v33 = objc_claimAutoreleasedReturnValue();
    }
    v28 = (void *)v33;
    v26 = (void *)v30;

    v27 = v31;
    goto LABEL_35;
  }
LABEL_37:

  objc_destroyWeak(&v52);
  objc_destroyWeak((id *)buf);

}

void __70__PKPaymentAuthorizationServiceViewController__didFailWithFatalError___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 178);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "authorizationDidFinishWithError:", v4);

    WeakRetained = v5;
  }

}

void __70__PKPaymentAuthorizationServiceViewController__didFailWithFatalError___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  if (!*(_BYTE *)(a1 + 40))
  {
    v2 = dispatch_time(0, 450000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__PKPaymentAuthorizationServiceViewController__didFailWithFatalError___block_invoke_3;
    block[3] = &unk_1E3E61590;
    v4 = *(id *)(a1 + 32);
    dispatch_after(v2, MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __70__PKPaymentAuthorizationServiceViewController__didFailWithFatalError___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__PKPaymentAuthorizationServiceViewController__didFailWithFatalError___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_didSucceedWithAuthorizationStateParam:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  _QWORD block[4];
  id v12;
  id location;
  _QWORD v14[4];
  NSObject *v15;

  self->_needsFinalCallback = 1;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__PKPaymentAuthorizationServiceViewController__didSucceedWithAuthorizationStateParam___block_invoke;
  v14[3] = &unk_1E3E62288;
  v6 = v4;
  v15 = v6;
  -[PKPaymentAuthorizationServiceViewController setFooterState:string:animated:withCompletion:](self, "setFooterState:string:animated:withCompletion:", 12, 0, 1, v14);
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paymentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isPeerPaymentRequest"))
  {
    objc_msgSend(v8, "originatingURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (_QWORD *)MEMORY[0x1E0D685C8];
    if (v9)
      v10 = (_QWORD *)MEMORY[0x1E0D685E8];
    MEMORY[0x1A1AE3A74](*v10, 0);
  }
  objc_initWeak(&location, self);
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __86__PKPaymentAuthorizationServiceViewController__didSucceedWithAuthorizationStateParam___block_invoke_2;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v12, &location);
  dispatch_group_notify(v6, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __86__PKPaymentAuthorizationServiceViewController__didSucceedWithAuthorizationStateParam___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __86__PKPaymentAuthorizationServiceViewController__didSucceedWithAuthorizationStateParam___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 700000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__PKPaymentAuthorizationServiceViewController__didSucceedWithAuthorizationStateParam___block_invoke_3;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

void __86__PKPaymentAuthorizationServiceViewController__didSucceedWithAuthorizationStateParam___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *((_BYTE *)WeakRetained + 1280))
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 178);
    objc_msgSend(v2, "authorizationDidFinishWithError:", 0);

    WeakRetained = v3;
    *((_BYTE *)v3 + 1280) = 0;
  }

}

- (void)_updatePendingTransaction:(id)a3 withAuthorizationStateParam:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v5 = a4;
  objc_msgSend(v15, "paymentApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dpanIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "peerPaymentTransactionMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "dpanIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v7);

    if (v10)
    {
      objc_msgSend(v15, "transaction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serviceIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setServiceIdentifier:", v12);

      objc_msgSend(v8, "requestDeviceScoreIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setRequestDeviceScoreIdentifier:", v13);

      objc_msgSend(v8, "sendDeviceScoreIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSendDeviceScoreIdentifier:", v14);

    }
  }

}

- (int64_t)_progressStateForAuthenticationWithBiometricFailure:(BOOL)a3
{
  int64_t result;
  int64_t internalAuthenticationEvaluationState;
  int64_t v6;
  int64_t coachingState;

  result = PKPaymentProgressStateBaseStateForAuthenticatorEvaluationState(self->_internalAuthenticationEvaluationState, -[PKPaymentAuthorizationFooterView state](self->_footerView, "state"), self->_idleStateIsPasscode, a3);
  internalAuthenticationEvaluationState = self->_internalAuthenticationEvaluationState;
  if (internalAuthenticationEvaluationState == 2)
  {
LABEL_4:
    if (self->_coachingState == 3)
      return 4;
    return result;
  }
  if (internalAuthenticationEvaluationState != 1)
  {
    if (internalAuthenticationEvaluationState)
      return result;
    goto LABEL_4;
  }
  v6 = 7;
  if (!self->_showPoseOutOfRangeDownCoaching)
    v6 = result;
  coachingState = self->_coachingState;
  if (coachingState == 4)
    v6 = 6;
  if (coachingState == 3)
    return 4;
  else
    return v6;
}

- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4
{
  int64_t var1;
  int64_t var0;
  unint64_t v7;
  BOOL v8;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a4.var1 - 1;
  if (PKPearlIsAvailable())
  {
    v8 = v7 < 2
      || (unint64_t)(self->_internalAuthenticationEvaluationState - 1) < 2
      || var1 == 3 && self->_isAMPPayment;
    self->_idleStateIsPasscode = v8;
  }
  else
  {
    self->_idleStateIsPasscode = 0;
  }
  self->_internalAuthenticationEvaluationState = var0;
  if (var1 == 3 && self->_isAMPPayment)
    -[PKPaymentAuthorizationServiceViewController _sendDidEncounterAuthorizationEventIfNecessary:](self, "_sendDidEncounterAuthorizationEventIfNecessary:", 1);
  -[PKPaymentAuthorizationServiceViewController _updateFooterStateIfAuthenticatingWithBiometricFailure:](self, "_updateFooterStateIfAuthenticatingWithBiometricFailure:", v7 < 2);
}

- (void)authenticator:(id)a3 didTransitionToCoachingState:(int64_t)a4
{
  if (self->_internalCoachingState != a4)
  {
    self->_internalCoachingState = a4;
    -[PKPaymentAuthorizationServiceViewController _updateCoachingState](self, "_updateCoachingState", a3);
  }
}

- (void)biometricAttemptFailed
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[PKPaymentAuthorizationServiceViewController setFooterState:string:animated:](self, "setFooterState:string:animated:", 9, 0, 1);
  ++self->_biometryAttempts;
  if ((PKPearlIsAvailable() & 1) == 0 && self->_isAMPPayment)
  {
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "paymentRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_isPSD2StyleRequest");

    if ((v5 & 1) == 0)
    {
      -[PKPaymentAuthorizationPasswordButtonView setHidden:](self->_passwordButtonView, "setHidden:", 0);
      -[PKPaymentAuthorizationServiceViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setNeedsLayout");

    }
  }
  -[PKPaymentAuthorizationServiceViewController _sendDidEncounterAuthorizationEventIfNecessary:](self, "_sendDidEncounterAuthorizationEventIfNecessary:", 1);
}

- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  id v10;
  _QWORD v11[4];
  void (**v12)(id, uint64_t);

  v8 = a3;
  v9 = (void (**)(id, uint64_t))a4;
  v10 = a5;
  if (self->_passcodeViewController)
  {
    if (v9)
      v9[2](v9, 1);
  }
  else if (-[PKPaymentAuthorizationStateMachine state](self->_stateMachine, "state") == 5)
  {
    if (-[PKPaymentAuthorizationServiceViewController _passcodeAllowed](self, "_passcodeAllowed"))
    {
      -[PKPaymentAuthorizationServiceViewController _setPasscodeViewController:](self, "_setPasscodeViewController:", v8);
      objc_msgSend(v8, "setModalPresentationStyle:", 5);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __101__PKPaymentAuthorizationServiceViewController_presentPasscodeViewController_completionHandler_reply___block_invoke;
      v11[3] = &unk_1E3E61590;
      v12 = v9;
      -[PKPaymentAuthorizationServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, v11);

    }
    else
    {
      if (v9)
        v9[2](v9, 0);
      -[PKPaymentAuthorizationServiceViewController _payWithPasswordPressed:](self, "_payWithPasswordPressed:", 0);
    }
  }
  else if (v9)
  {
    v9[2](v9, 0);
  }

}

uint64_t __101__PKPaymentAuthorizationServiceViewController_presentPasscodeViewController_completionHandler_reply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)dismissPasscodeViewController
{
  UIViewController *passcodeViewController;
  void *v4;

  passcodeViewController = self->_passcodeViewController;
  if (passcodeViewController)
  {
    -[UIViewController presentingViewController](passcodeViewController, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

    -[PKPaymentAuthorizationServiceViewController _setPasscodeViewController:](self, "_setPasscodeViewController:", 0);
  }
}

- (void)dismissPassphraseViewController
{
  -[PKPaymentAuthorizationServiceViewController dismissPassphraseViewControllerWithCompletion:](self, "dismissPassphraseViewControllerWithCompletion:", 0);
}

- (void)dismissPassphraseViewControllerWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  -[PKPaymentAuthorizationStateMachine state](self->_stateMachine, "state");
  if ((PKPaymentAuthorizationStateIsTerminal() & 1) == 0)
    -[PKPaymentAuthorizationServiceViewController _removePassphraseViewFromHierarchyWithCompletionHandler:](self, "_removePassphraseViewFromHierarchyWithCompletionHandler:", v4);

}

- (void)authorizationFooterViewPasscodeButtonPressed:(id)a3
{
  -[PKPaymentAuthorizationServiceViewController _sendDidEncounterAuthorizationEventIfNecessary:](self, "_sendDidEncounterAuthorizationEventIfNecessary:", 7);
  if (-[PKPaymentAuthorizationServiceViewController _passwordRequired](self, "_passwordRequired"))
  {
    -[PKPaymentAuthorizationServiceViewController _payWithPasswordPressed:](self, "_payWithPasswordPressed:", 0);
  }
  else if (-[PKPaymentAuthorizationStateMachine state](self->_stateMachine, "state") == 5)
  {
    if (self->_authenticating)
      -[PKAuthenticator fallbackToSystemPasscodeUI](self->_authenticator, "fallbackToSystemPasscodeUI");
    else
      -[PKPaymentAuthorizationServiceViewController _startEvaluationWithHasInitialAuthenticatorState:initialAuthenticatorState:](self, "_startEvaluationWithHasInitialAuthenticatorState:initialAuthenticatorState:", 0, 0);
  }
}

- (void)authorizationFooterViewWillChangeConstraints:(id)a3
{
  id v3;

  if (self->_viewAppeared)
  {
    -[PKPaymentAuthorizationServiceViewController viewIfLoaded](self, "viewIfLoaded", a3);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutIfNeeded");

  }
}

- (void)authorizationFooterViewDidChangeConstraints:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  if (self->_viewAppeared)
  {
    -[PKPaymentAuthorizationServiceViewController viewIfLoaded](self, "viewIfLoaded", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");
    v5 = (void *)MEMORY[0x1E0DC3F10];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __91__PKPaymentAuthorizationServiceViewController_authorizationFooterViewDidChangeConstraints___block_invoke;
    v7[3] = &unk_1E3E612E8;
    v8 = v4;
    v6 = v4;
    objc_msgSend(v5, "_animateUsingDefaultTimingWithOptions:animations:completion:", 134, v7, 0);
    -[PKPaymentAuthorizationServiceViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");

  }
}

uint64_t __91__PKPaymentAuthorizationServiceViewController_authorizationFooterViewDidChangeConstraints___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (id)dataItemForPaymentAuthorizationCouponCodeEntryViewController:(id)a3
{
  void *v3;
  void *v4;

  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForType:", 11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)paymentAuthorizationCouponCodeEntryViewController:(id)a3 didChangeCouponCode:(id)a4
{
  -[PKPaymentAuthorizationStateMachine didChangeCouponCode:](self->_stateMachine, "didChangeCouponCode:", a4);
}

- (void)paymentAuthorizationCouponCodeEntryViewControllerDidFinish:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  -[PKPaymentAuthorizationServiceViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "topViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "wrappedViewController");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v7;
    }
    if (v6 == v10)
      v8 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

  }
  else
  {
    -[PKPaymentAuthorizationServiceViewController presentedViewController](self, "presentedViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v10)
      -[PKPaymentAuthorizationServiceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  PKPaymentAuthorizationServiceViewController *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __101__PKPaymentAuthorizationServiceViewController_signInViewController_didAuthenticateWithResults_error___block_invoke;
  v14[3] = &unk_1E3E62460;
  v15 = v10;
  v16 = self;
  v17 = v8;
  v18 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

void __101__PKPaymentAuthorizationServiceViewController_signInViewController_didAuthenticateWithResults_error___block_invoke(id *a1)
{
  id v2;
  NSObject *v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if (v2)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v2;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Error authenticating: %@", buf, 0xCu);
    }

    v4 = a1[4];
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CFFF10]);

  if (v6)
  {
    v7 = objc_msgSend(a1[4], "code");
    if (v7 == -7006)
    {
      v8 = a1[5];
      v9 = 5;
      goto LABEL_14;
    }
    if (v7 == -7003)
    {
      v8 = a1[5];
      v9 = 4;
LABEL_14:
      objc_msgSend(v8, "_sendDidEncounterAuthorizationEventIfNecessary:", v9);
      return;
    }
  }
  PKLogFacilityTypeGetObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Did authenticate with results", buf, 2u);
  }

  objc_msgSend(a1[5], "_abandonActiveEnrollmentAttempts");
  objc_msgSend(a1[5], "_abandonPSD2StyleAMPBuy");
  objc_msgSend(*((id *)a1[5] + 128), "setHidden:", 1);
  objc_msgSend(a1[6], "resignFirstResponder");
  v11 = a1[5];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __101__PKPaymentAuthorizationServiceViewController_signInViewController_didAuthenticateWithResults_error___block_invoke_123;
  v12[3] = &unk_1E3E61388;
  v12[4] = v11;
  v13 = a1[7];
  objc_msgSend(v11, "dismissPassphraseViewControllerWithCompletion:", v12);

}

uint64_t __101__PKPaymentAuthorizationServiceViewController_signInViewController_didAuthenticateWithResults_error___block_invoke_123(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1368), "didAuthenticateWithCredential:", *(_QWORD *)(a1 + 40));
}

- (BOOL)signInViewController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6
{
  return 1;
}

- (BOOL)_shouldShowSeparatorForRowAtIndexPath:(id)a3
{
  id v4;
  BOOL v5;
  NSInteger v7;

  v4 = a3;
  if (self->_usingLargeLayout && !self->_isAMPPayment && !self->_isInstallment
    || self->_totalView
    || (-[UITableView isScrollEnabled](self->_detailTableView, "isScrollEnabled") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7 = -[UITableView numberOfRowsInSection:](self->_detailTableView, "numberOfRowsInSection:", objc_msgSend(v4, "section"));
    v5 = objc_msgSend(v4, "row") + 1 != v7;
  }

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v5 = a3;
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!self->_usingLargeLayout
    || self->_isAMPPayment
    || self->_isInstallment
    || (objc_msgSend(v6, "paymentSummaryItems"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v10 < 2))
  {
    if (self->_isPaymentSummaryPinned)
    {
      objc_msgSend(v6, "paymentSummaryItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (unint64_t)objc_msgSend(v11, "count") > 1;

      v8 -= v12;
    }
  }
  else
  {
    --v8;
  }
  objc_msgSend(v6, "paymentRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "requestType") == 1 && objc_msgSend(v6, "mode") == 1)
  {
    objc_msgSend(v6, "pass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;

    v8 -= v15;
  }
  else
  {

  }
  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  id (*v25)(uint64_t);
  void *v26;
  PKPaymentAuthorizationServiceViewController *v27;
  id v28;
  id v29;
  id v30;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "paymentRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[PKPaymentAuthorizationServiceViewController _shouldShowSeparatorForRowAtIndexPath:](self, "_shouldShowSeparatorForRowAtIndexPath:", v7);
  v15 = -[PKPaymentAuthorizationServiceViewController _tableViewClassForDataItem:](self, "_tableViewClassForDataItem:", v11);
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v17 = (void *)objc_msgSend([v15 alloc], "initWithLayout:reuseIdentifier:", self->_layout, v16);
    objc_msgSend(v17, "setSelectionStyle:", 2 * (objc_msgSend(v11, "type") != 8));
  }
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __79__PKPaymentAuthorizationServiceViewController_tableView_cellForRowAtIndexPath___block_invoke;
  v26 = &unk_1E3E74E58;
  v27 = self;
  v28 = v11;
  v29 = v6;
  v30 = v7;
  v18 = v7;
  v19 = v6;
  v20 = v11;
  v21 = _Block_copy(&v23);
  -[objc_class presentCell:withDataItem:shouldShowSeperator:forPaymentRequest:cellProvider:](-[PKPaymentAuthorizationServiceViewController _viewPresenterClassForDataItem:](self, "_viewPresenterClassForDataItem:", v20, v23, v24, v25, v26, v27), "presentCell:withDataItem:shouldShowSeperator:forPaymentRequest:cellProvider:", v17, v20, v14, v13, v21);

  return v17;
}

id __79__PKPaymentAuthorizationServiceViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1368), "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObject:", *(_QWORD *)(a1 + 40));

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v4, objc_msgSend(*(id *)(a1 + 56), "section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return -[PKPaymentAuthorizationStateMachine canSelectPaymentOptions](self->_stateMachine, "canSelectPaymentOptions", a3, a4);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  PKPaymentAuthorizationStateMachine *stateMachine;
  id v5;
  void *v6;
  id v7;

  stateMachine = self->_stateMachine;
  v5 = a4;
  if (-[PKPaymentAuthorizationStateMachine canSelectPaymentOptions](stateMachine, "canSelectPaymentOptions"))v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  const __CFString *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  _QWORD v29[3];
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "paymentRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "requestType");

  v13 = objc_msgSend(v10, "type");
  v14 = (void *)MEMORY[0x1E0D66A58];
  v15 = *MEMORY[0x1E0D698F8];
  v16 = *MEMORY[0x1E0D68C08];
  v17 = *MEMORY[0x1E0D68F50];
  v29[0] = *MEMORY[0x1E0D68AA0];
  v29[1] = v17;
  v18 = *MEMORY[0x1E0D690C0];
  v30[0] = v16;
  v30[1] = v18;
  v29[2] = *MEMORY[0x1E0D69438];
  v19 = objc_msgSend(v10, "type");
  if (v19 > 0x13)
    v20 = CFSTR("unknown");
  else
    v20 = off_1E3E75030[v19];
  v30[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subject:sendEvent:", v15, v21);

  v22 = (v12 < 0xB) & (0x735u >> v12);
  if (-[PKPaymentAuthorizationServiceViewController _shouldShowUsePeerPaymentBalanceToggle](self, "_shouldShowUsePeerPaymentBalanceToggle"))
  {
    objc_msgSend(v7, "peerPaymentQuote");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v13 == 2)
    {
      objc_msgSend(v23, "firstQuoteItemOfType:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25 == 0;

    }
    else
    {
      v26 = 0;
    }

    if ((v22 & 1) != 0)
      goto LABEL_20;
    goto LABEL_23;
  }
  if (v12 == 2 && v13 == 2)
  {
    objc_msgSend(v7, "itemForType:", 9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      if (v22)
      {
        LOBYTE(v26) = 1;
        goto LABEL_20;
      }
LABEL_24:
      -[PKPaymentAuthorizationServiceViewController _selectOptionsForDataItem:](self, "_selectOptionsForDataItem:", v10);
      goto LABEL_25;
    }
  }
  v26 = self->_isAMPPayment && v13 == 5;
  if ((v22 & 1) == 0)
  {
LABEL_23:
    if (!v26)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_20:
  objc_msgSend(v10, "type");
  if ((PKPaymentAuthorizationDataTypeIsSelectable() & 1) != 0 || v26)
    goto LABEL_24;
LABEL_25:

}

- (void)_payWithPasswordPressed:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t v13[8];
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D66A58];
  v5 = *MEMORY[0x1E0D698F8];
  v14 = *MEMORY[0x1E0D68AA0];
  v15[0] = *MEMORY[0x1E0D68AE8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subject:sendEvent:", v5, v6);

  -[PKPaymentAuthorizationServiceViewController setFooterState:string:animated:](self, "setFooterState:string:animated:", 10, 0, 1);
  -[PKPaymentAuthorizationServiceViewController _abandonPSD2StyleAMPBuy](self, "_abandonPSD2StyleAMPBuy");
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paymentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appleIDAuthenticationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PKPaymentAuthorizationServiceViewController _suspendAuthentication](self, "_suspendAuthentication");
    objc_msgSend(v9, "pk_AKAppleIDAuthenticationInAppContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPresentingViewController:", self);
    objc_msgSend(v10, "setDelegate:", self);
    v11 = objc_alloc_init(getAKModalSignInViewControllerClass());
    objc_msgSend(v11, "setDelegate:", self);
    objc_msgSend(v11, "setContext:", v10);
    -[PKPaymentAuthorizationServiceViewController _addPassphraseViewControllerToHierarchy:withCompletion:](self, "_addPassphraseViewControllerToHierarchy:withCompletion:", v11, 0);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Password requested but no authentication context found, bypassing", v13, 2u);
    }

    -[PKPaymentAuthorizationStateMachine didAuthenticateWithCredential:](self->_stateMachine, "didAuthenticateWithCredential:", MEMORY[0x1E0C9AA70]);
  }

}

- (void)cancelPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  int v10;
  PKPaymentAuthorizationServiceViewController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!self->_cancelButtonDisabled)
  {
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isPeerPaymentRequest"))
      MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D685C0], 0);
    if (self->_passphraseViewController)
    {
      -[PKPaymentAuthorizationServiceViewController _sendDidEncounterAuthorizationEventIfNecessary:](self, "_sendDidEncounterAuthorizationEventIfNecessary:", 8);
      -[PKPaymentAuthorizationServiceViewController _suspendAuthentication](self, "_suspendAuthentication");
      -[PKPaymentAuthorizationServiceViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
      -[PKPaymentAuthorizationServiceViewController _resumeAuthenticationWithPreviousError:animated:](self, "_resumeAuthenticationWithPreviousError:animated:", 0, 0);
      -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "paymentRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "_isAMPPayment");

      if (v8)
        -[PKPaymentAuthorizationServiceViewController dismissPassphraseViewController](self, "dismissPassphraseViewController");
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 134349056;
        v11 = self;
        _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationServiceViewController (%{public}p): User pressed cancel button", (uint8_t *)&v10, 0xCu);
      }

      -[PKPaymentAuthorizationStateMachine didCancel](self->_stateMachine, "didCancel");
    }

  }
}

- (void)resumeAndUpdateContentSize
{
  -[PKPaymentAuthorizationStateMachine didBecomeActive:](self->_stateMachine, "didBecomeActive:", 0);
  -[PKPaymentAuthorizationServiceViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)_addPassphraseViewControllerToHierarchy:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *passphraseBottomConstraint;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  void *v22;
  NSLayoutConstraint *contentViewRightConstraint;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[5];
  _QWORD v35[6];

  v35[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_passphraseViewController)
  {
    if (v7)
      (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
  else
  {
    objc_msgSend(v6, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

    -[PKPaymentAuthorizationServiceViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaymentAuthorizationServiceViewController addChildViewController:](self, "addChildViewController:", v6);
    objc_msgSend(v11, "addSubview:", v9);
    objc_msgSend(v9, "bottomAnchor");
    v31 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    passphraseBottomConstraint = self->_passphraseBottomConstraint;
    self->_passphraseBottomConstraint = v14;

    objc_msgSend(v9, "leftAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](self->_passphraseSeparatorView, "rightAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v28;
    objc_msgSend(v9, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safeAreaLayoutGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v17;
    objc_msgSend(v9, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "widthAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = self->_passphraseBottomConstraint;
    v35[2] = v20;
    v35[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addConstraints:", v22);

    v8 = v31;
    objc_opt_class();
    self->_needsToAccommodateKeyboard = (objc_opt_isKindOfClass() & 1) == 0;
    objc_msgSend(v6, "didMoveToParentViewController:", self);
    objc_msgSend(v11, "layoutIfNeeded");
    -[PKPaymentAuthorizationServiceViewController _setPassphraseViewController:](self, "_setPassphraseViewController:", v6);
    objc_msgSend(v9, "setNeedsUpdateConstraints");
    objc_msgSend(v6, "becomeFirstResponder");
    contentViewRightConstraint = self->_contentViewRightConstraint;
    objc_msgSend(v11, "bounds");
    -[NSLayoutConstraint setConstant:](contentViewRightConstraint, "setConstant:", -v24);
    v25 = (void *)MEMORY[0x1E0DC3F10];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __102__PKPaymentAuthorizationServiceViewController__addPassphraseViewControllerToHierarchy_withCompletion___block_invoke;
    v34[3] = &unk_1E3E612E8;
    v34[4] = self;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __102__PKPaymentAuthorizationServiceViewController__addPassphraseViewControllerToHierarchy_withCompletion___block_invoke_2;
    v32[3] = &unk_1E3E614F0;
    v33 = v31;
    objc_msgSend(v25, "animateWithDuration:delay:options:animations:completion:", 4, v34, v32, 0.3, 0.0);

  }
}

void __102__PKPaymentAuthorizationServiceViewController__addPassphraseViewControllerToHierarchy_withCompletion___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

uint64_t __102__PKPaymentAuthorizationServiceViewController__addPassphraseViewControllerToHierarchy_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)_removePassphraseViewFromHierarchyWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSLayoutConstraint *passphraseBottomConstraint;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[5];

  v4 = a3;
  v5 = v4;
  if (self->_passphraseViewController)
  {
    -[PKPaymentAuthorizationServiceViewController _setPassphraseViewController:](self, "_setPassphraseViewController:", 0);
    -[NSLayoutConstraint setConstant:](self->_contentViewRightConstraint, "setConstant:", 0.0);
    passphraseBottomConstraint = self->_passphraseBottomConstraint;
    self->_passphraseBottomConstraint = 0;

    -[PKPaymentAuthorizationServiceViewController childViewControllers](self, "childViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "resignFirstResponder");
    v9 = (void *)MEMORY[0x1E0DC3F10];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __103__PKPaymentAuthorizationServiceViewController__removePassphraseViewFromHierarchyWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E3E612E8;
    v14[4] = self;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __103__PKPaymentAuthorizationServiceViewController__removePassphraseViewFromHierarchyWithCompletionHandler___block_invoke_2;
    v11[3] = &unk_1E3E669E0;
    v12 = v8;
    v13 = v5;
    v10 = v8;
    objc_msgSend(v9, "animateWithDuration:delay:options:animations:completion:", 4, v14, v11, 0.3, 0.0);
    -[PKPaymentAuthorizationServiceViewController _updatePhysicalButtonState](self, "_updatePhysicalButtonState");

  }
  else if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }

}

void __103__PKPaymentAuthorizationServiceViewController__removePassphraseViewFromHierarchyWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

uint64_t __103__PKPaymentAuthorizationServiceViewController__removePassphraseViewFromHierarchyWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "willMoveToParentViewController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (Class)_tableViewClassForDataItem:(id)a3
{
  objc_msgSend(a3, "type");
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (Class)_viewPresenterClassForDataItem:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "type");
  if ((unint64_t)(v3 - 1) > 0xB || ((0xFF7u >> (v3 - 1)) & 1) == 0)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_handleModelUpdate
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PKPaymentAuthorizationSummaryItemsView *summaryItemsView;
  void *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  PKPaymentAuthorizationTotalView *totalView;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  PKPaymentAuthorizationTotalView *v26;
  PKPaymentAuthorizationTotalView *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;

  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "requestType");
  objc_msgSend(v3, "paymentSummaryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v3, "_isAMPPayment");
  -[UITableView reloadData](self->_detailTableView, "reloadData");
  -[UITableView layoutIfNeeded](self->_detailTableView, "layoutIfNeeded");
  objc_msgSend(v36, "itemForType:", 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  summaryItemsView = self->_summaryItemsView;
  if (summaryItemsView)
  {
    if (v7)
    {
      -[PKPaymentAuthorizationSummaryItemsView removeLabelsAndValues](summaryItemsView, "removeLabelsAndValues");
      -[objc_class presentView:withDataItem:forPaymentRequest:](-[PKPaymentAuthorizationServiceViewController _viewPresenterClassForDataItem:](self, "_viewPresenterClassForDataItem:", v7), "presentView:withDataItem:forPaymentRequest:", self->_summaryItemsView, v7, v3);
LABEL_6:
      -[PKPaymentAuthorizationSummaryItemsView layoutIfNeeded](self->_summaryItemsView, "layoutIfNeeded");
      goto LABEL_7;
    }
    if (self->_usingLargeLayout)
    {
      -[PKPaymentAuthorizationSummaryItemsView removeLabelsAndValues](summaryItemsView, "removeLabelsAndValues");
      goto LABEL_6;
    }
  }
LABEL_7:
  objc_msgSend(v36, "merchantName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4 > 8 || ((1 << v4) & 0x121) == 0;
  if (!v10 && ((objc_msgSend(v3, "isPeerPaymentRequest") | v6) & 1) == 0)
  {
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_PAY_TO_FMT"), CFSTR("%@"), v9);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  v12 = v36;
  if (!(_DWORD)v6)
    goto LABEL_17;
  objc_msgSend(v35, "localizedAmount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    goto LABEL_18;
  objc_msgSend(v35, "amount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToNumber:", v15);

  v12 = v36;
  if (v16)
  {
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_AMOUNT_FREE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_17:
    objc_msgSend(v12, "transactionAmount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "currencyCode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PKFormattedCurrencyStringFromNumber();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_18:
  totalView = self->_totalView;
  if (totalView)
  {
    -[PKPaymentAuthorizationTotalView setShowsBoldValueText:](totalView, "setShowsBoldValueText:", v6);
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2
      && (objc_msgSend(MEMORY[0x1E0CB3598], "zero"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v36, "transactionAmount"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v20, "compare:", v21),
          v21,
          v20,
          !v22))
    {
      v26 = self->_totalView;
      v29 = v9;
      v30 = 0;
    }
    else
    {
      objc_msgSend(v3, "paymentSummaryItems");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "type");

      v26 = self->_totalView;
      if (v25)
      {
        -[PKPaymentAuthorizationTotalView setIsPendingTotal:](v26, "setIsPendingTotal:", 1);
        v27 = self->_totalView;
        PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_PENDING_AMOUNT"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentAuthorizationTotalView setLabel:value:](v27, "setLabel:value:", v9, v28);

LABEL_26:
        v31 = objc_msgSend(v3, "isPeerPaymentRequest");
        if (v4 == 2)
          v32 = 1;
        else
          v32 = v31;
        if (v32)
          v33 = 0;
        else
          v33 = 2;
        -[PKPaymentAuthorizationTotalView setLabelNumberOfLines:](self->_totalView, "setLabelNumberOfLines:", v33);
        goto LABEL_33;
      }
      v29 = v9;
      v30 = v13;
    }
    -[PKPaymentAuthorizationTotalView setLabel:value:](v26, "setLabel:value:", v29, v30);
    goto LABEL_26;
  }
LABEL_33:
  if (objc_msgSend(v36, "mode") != 3)
  {
    -[PKPaymentAuthorizationServiceViewController _updateAvailableCardsPreferences](self, "_updateAvailableCardsPreferences");
    objc_msgSend(v36, "allErrors");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationServiceViewController _updatePreferencesWithErrors:](self, "_updatePreferencesWithErrors:", v34);

  }
  -[PKPaymentAuthorizationServiceViewController _updateCouponCodeEntry](self, "_updateCouponCodeEntry");
  -[PKPaymentAuthorizationServiceViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");

}

- (void)_setupWithPaymentRequest:(id)a3 relevantPassUniqueID:(id)a4 fromAppWithLocalizedName:(id)a5 applicationIdentifier:(id)a6 bundleIdentifier:(id)a7 teamIdentifier:(id)a8
{
  id v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  unint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  PKPaymentAuthorizationFooterView *footerView;
  void *v42;
  PKPaymentAuthorizationFooterView *v43;
  void *v44;
  PKPaymentAuthorizationFooterView *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  int v52;
  int v53;
  void *v54;
  BOOL v55;
  void *v56;
  void *v57;
  BOOL v58;
  id *v59;
  id *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id location;
  _QWORD v69[5];
  _QWORD v70[7];

  v70[5] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v65 = a4;
  v64 = a5;
  v63 = a6;
  v62 = a7;
  v61 = a8;
  v15 = objc_msgSend(v14, "requestType");
  self->_isAMPPayment = objc_msgSend(v14, "_isAMPPayment");
  self->_isInstallment = v15 == 5;
  if (self->_isAMPPayment)
  {
    if ((objc_msgSend(v14, "_isPSD2StyleRequest") & 1) != 0)
    {
LABEL_3:
      v16 = 1;
      goto LABEL_10;
    }
    objc_msgSend(v14, "merchantSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      v16 = 1;
    else
      v16 = 3;
  }
  else
  {
    if (v15 > 0xD || ((1 << v15) & 0x20C0) == 0)
      goto LABEL_3;
    v16 = 3;
  }
LABEL_10:
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67090]), "initWithMode:", v16);
  v19 = objc_alloc_init(MEMORY[0x1E0D67470]);
  objc_msgSend(v18, "setPeerPaymentService:", v19);

  -[PKPaymentAuthorizationStateMachine setModel:](self->_stateMachine, "setModel:", v18);
  objc_initWeak(&location, self);
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __172__PKPaymentAuthorizationServiceViewController__setupWithPaymentRequest_relevantPassUniqueID_fromAppWithLocalizedName_applicationIdentifier_bundleIdentifier_teamIdentifier___block_invoke;
  v66[3] = &unk_1E3E61310;
  v59 = &v67;
  objc_copyWeak(&v67, &location);
  objc_msgSend(v18, "setUpdateHandler:", v66);
  objc_msgSend(v18, "beginUpdates");
  objc_msgSend(v18, "setRelevantPassUniqueID:", v65);
  objc_msgSend(v18, "setHostAppLocalizedName:", v64);
  objc_msgSend(v18, "setHostApplicationIdentifier:", v63);
  objc_msgSend(v18, "setBundleIdentifier:", v62);
  objc_msgSend(v18, "setTeamIdentifier:", v61);
  objc_msgSend(v18, "setPaymentRequest:", v14);
  objc_msgSend(v18, "setContactFormatValidator:", self->_contactFormatValidator);
  if (v15 == 5)
  {
    objc_msgSend(v14, "paymentSummaryItems", &v67);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");
    if (v21 >= 2)
    {
      objc_msgSend(v20, "lastObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "amount");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "subarrayWithRange:", 0, v21 - 1);
      v24 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setInstallmentAuthorizationAmount:", v23);
      v20 = (id)v24;
    }
    objc_msgSend(v18, "setPaymentSummaryItems:", v20);
  }
  else
  {
    if ((v15 & 0xFFFFFFFFFFFFFFF7) != 0)
      goto LABEL_26;
    objc_msgSend(v18, "pass", &v67);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0D66A58];
    v27 = *MEMORY[0x1E0D68C20];
    v28 = *MEMORY[0x1E0D68F50];
    v69[0] = *MEMORY[0x1E0D68AA0];
    v69[1] = v28;
    v29 = *MEMORY[0x1E0D690C0];
    v70[0] = v27;
    v70[1] = v29;
    v30 = CFSTR("true");
    if (!v25)
      v30 = CFSTR("false");
    v31 = *MEMORY[0x1E0D69340];
    v69[2] = *MEMORY[0x1E0D69358];
    v69[3] = v31;
    v70[2] = v30;
    v70[3] = CFSTR("card");
    v69[4] = *MEMORY[0x1E0D69110];
    v20 = v25;
    objc_msgSend(v20, "associatedAccountServiceAccountIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = CFSTR("appleCard");
    }
    else if ((objc_msgSend(v20, "hasAssociatedPeerPaymentAccount") & 1) != 0)
    {
      v33 = CFSTR("appleCash");
    }
    else
    {
      objc_msgSend(v20, "devicePrimaryPaymentApplication");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "paymentNetworkIdentifier") == 123;

      if (v35)
        v33 = CFSTR("barcode");
      else
        v33 = CFSTR("other");
    }

    v70[4] = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 5);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "subject:sendEvent:", *MEMORY[0x1E0D698F8], v36);

  }
LABEL_26:
  objc_msgSend(v14, "originatingURL", v59);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  self->_preferencesStyle = 4 * (v37 != 0);
  if (v15 == 3)
  {
    objc_msgSend(v14, "passTypeIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "passSerialNumber");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPaymentPassWithPassTypeIdentifier:serialNumber:", v38, v39);

  }
  if (self->_isAMPPayment)
  {
    if (objc_msgSend(v14, "accesssControlRef"))
    {
      v40 = objc_msgSend(MEMORY[0x1E0D6BFD8], "currentStateForAccessControl:", objc_msgSend(v14, "accesssControlRef"));
      self->_bypassAuthenticator = v40 == 0;
      if (!v40)
        -[PKPaymentAuthorizationServiceViewController _abandonActiveEnrollmentAttempts](self, "_abandonActiveEnrollmentAttempts");
    }
    else
    {
      self->_bypassAuthenticator = 1;
      -[PKPaymentAuthorizationServiceViewController _abandonActiveEnrollmentAttempts](self, "_abandonActiveEnrollmentAttempts");
    }
    -[PKPaymentAuthorizationServiceViewController _updatePhysicalButtonState](self, "_updatePhysicalButtonState");
  }
  if (v15 <= 0xA && ((1 << v15) & 0x721) != 0)
  {
    -[PKPaymentAuthorizationServiceViewController _setupShippingMethods](self, "_setupShippingMethods");
    -[PKPaymentAuthorizationServiceViewController _setupShippingAddress](self, "_setupShippingAddress");
    -[PKPaymentAuthorizationServiceViewController _setupShippingContact](self, "_setupShippingContact");
    -[PKPaymentAuthorizationServiceViewController _setupPaymentPassAndBillingAddress](self, "_setupPaymentPassAndBillingAddress");
  }
  else if (self->_isAMPPayment)
  {
    -[PKPaymentAuthorizationServiceViewController _setupShippingMethods](self, "_setupShippingMethods");
    -[PKPaymentAuthorizationServiceViewController _setupShippingAddress](self, "_setupShippingAddress");
    -[PKPaymentAuthorizationServiceViewController _setupShippingContact](self, "_setupShippingContact");
  }
  -[PKPaymentAuthorizationServiceViewController _setupCouponCodeEntry](self, "_setupCouponCodeEntry");
  if (v15 == 3
    || self->_isAMPPayment
    || (objc_msgSend(v14, "isPeerPaymentRequest") & 1) != 0
    || v15 <= 0xD && ((1 << v15) & 0x20D4) != 0)
  {
    footerView = self->_footerView;
    objc_msgSend(v14, "localizedBiometricConfirmationTitle");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationFooterView setBiometricConfirmationTitle:](footerView, "setBiometricConfirmationTitle:", v42);

    v43 = self->_footerView;
    objc_msgSend(v14, "localizedConfirmationTitle");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationFooterView setConfirmationTitle:](v43, "setConfirmationTitle:", v44);

    -[PKPaymentAuthorizationFooterView setConfirmationStyle:](self->_footerView, "setConfirmationStyle:", objc_msgSend(v14, "confirmationStyle"));
    v45 = self->_footerView;
    objc_msgSend(v14, "localizedAuthorizingTitle");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationFooterView setAuthorizingTitle:](v45, "setAuthorizingTitle:", v46);

    -[PKPaymentAuthorizationFooterView setRequestType:](self->_footerView, "setRequestType:", objc_msgSend(v14, "requestType"));
    objc_msgSend(v14, "localizedPasswordButtonTitle");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v47)
    {
      v49 = v47;
    }
    else
    {
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ENTER_PASSWORD"));
      v49 = (id)objc_claimAutoreleasedReturnValue();
    }
    v50 = v49;
    -[PKPaymentAuthorizationPasswordButtonView setActionTitle:](self->_passwordButtonView, "setActionTitle:", v49);
    if (self->_bypassAuthenticator)
      -[PKPaymentAuthorizationServiceViewController setFooterState:string:animated:](self, "setFooterState:string:animated:", 4, 0, 0);
    if (v15 == 2)
      -[PKPaymentAuthorizationServiceViewController _setupBankAccounts](self, "_setupBankAccounts");
    if (self->_physicalButtonState == 1)
      -[PKPaymentAuthorizationServiceViewController _updatePhysicalButtonInstructionAndNotify:](self, "_updatePhysicalButtonInstructionAndNotify:", 1);

  }
  objc_msgSend(v18, "peerPaymentQuote");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v14, "isPeerPaymentRequest");
  if (v51)
    v53 = v52;
  else
    v53 = 0;
  if (v53 == 1)
  {
    objc_msgSend(v51, "recipient");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v54 == 0;

    if (!v55)
    {
      objc_msgSend(v51, "firstQuoteItemOfType:", 2);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v51, "firstQuoteItemOfType:", 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v57 != 0;

      objc_msgSend(v18, "updatePeerPaymentPromotionForPeerPaymentQuote:", (v56 == 0) & v58);
    }
  }
  objc_msgSend(v18, "endUpdates");
  -[PKPaymentAuthorizationStateMachine start](self->_stateMachine, "start");

  objc_destroyWeak(v60);
  objc_destroyWeak(&location);

}

void __172__PKPaymentAuthorizationServiceViewController__setupWithPaymentRequest_relevantPassUniqueID_fromAppWithLocalizedName_applicationIdentifier_bundleIdentifier_teamIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleModelUpdate");
    WeakRetained = v2;
  }

}

- (void)_setupShippingMethods
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  PKPaymentPreferencesViewController *v12;
  PKPaymentPreferencesViewController *v13;
  PKPaymentPreferencesViewController *shippingMethodPreferencesController;
  id v15;

  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentRequest");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "availableShippingMethods");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "methods");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shippingType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("IN_APP_PAYMENT_OPTIONS_%@_METHOD_VC_TITLE"), v9);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = [PKPaymentPreferencesViewController alloc];
    v13 = -[PKPaymentPreferencesViewController initWithStyle:preferences:title:handler:contactFormatValidator:](v12, "initWithStyle:preferences:title:handler:contactFormatValidator:", self->_preferencesStyle, MEMORY[0x1E0C9AA60], v11, 0, self->_contactFormatValidator);
    shippingMethodPreferencesController = self->_shippingMethodPreferencesController;
    self->_shippingMethodPreferencesController = v13;

    -[PKPaymentAuthorizationServiceViewController _updateShippingMethods](self, "_updateShippingMethods");
  }

}

- (void)_setupShippingAddress
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSString *v51;
  void *v52;
  PKPaymentPreferencesViewController *v53;
  int64_t preferencesStyle;
  void *v55;
  PKPaymentPreferencesViewController *v56;
  PKPaymentPreferencesViewController *shippingAddressPreferencesController;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD aBlock[4];
  id v64;
  id v65;
  id v66;
  id from;
  id location;
  void *v69;
  const __CFString *v70;
  const __CFString *v71;
  _QWORD v72[4];
  _QWORD v73[6];

  v73[4] = *MEMORY[0x1E0C80C00];
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentRequest");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v62, "requiredShippingContactFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0D69BF0]);

  if (v5)
  {
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shippingEditableMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shippingEditableMessage");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shippingType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("IN_APP_PAYMENT_OPTIONS_%@ADDRESSES_GROUP_NAME"), v10);
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(v11);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shippingAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "defaultShippingAddress");
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v61, "safelyAddObject:", v15);
    v58 = v15;
    v17 = (void *)MEMORY[0x1E0D66A58];
    if (v15)
      v18 = 0;
    else
      v18 = 0x7FFFFFFFFFFFFFFFLL;
    v19 = *MEMORY[0x1E0D68C20];
    v20 = *MEMORY[0x1E0D68F50];
    v72[0] = *MEMORY[0x1E0D68AA0];
    v72[1] = v20;
    v21 = *MEMORY[0x1E0D690C0];
    v73[0] = v19;
    v73[1] = v21;
    v22 = *MEMORY[0x1E0D69358];
    v72[2] = *MEMORY[0x1E0D69340];
    v72[3] = v22;
    v23 = CFSTR("true");
    if (!v15)
      v23 = CFSTR("false");
    v73[2] = CFSTR("shippingAddress");
    v73[3] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "subject:sendEvent:", *MEMORY[0x1E0D698F8], v24);

    v25 = objc_alloc(MEMORY[0x1E0D67200]);
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "initWithTitle:preferences:selectedIndex:readOnly:", v60, v61, v18, objc_msgSend(v26, "isShippingEditable") ^ 1);

    v28 = (void *)MEMORY[0x1E0CB3940];
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "shippingType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("IN_APP_PAYMENT_OPTIONS_ADD_NEW_%@ADDRESSES"), v30);
    v31 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAddNewTitle:", v32);

    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ADD_EXISTING_POSTALADDRESSES"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAddExistingTitle:", v33);

    v34 = (void *)MEMORY[0x1E0CB3940];
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "shippingType");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", CFSTR("IN_APP_PAYMENT_OPTIONS_EDIT_EXISTING_%@ADDRESSES"), v36);
    v37 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setEditExistingTitle:", v38);

    objc_msgSend(v27, "setContactKey:", *MEMORY[0x1E0C967F0]);
    objc_msgSend(v27, "setType:", 1);
    objc_msgSend(v62, "requiredShippingContactFields");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setShowPhoneticName:", objc_msgSend(v39, "containsObject:", *MEMORY[0x1E0D69BE8]));

    objc_msgSend(v27, "mergeRecentsAndMeCard");
    objc_msgSend(v27, "preferences");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "firstObject");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setShippingAddress:", v59);

    objc_msgSend(v27, "preferences");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "firstObject");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = objc_msgSend(v43, "contactSource");
    if (v44 > 4)
      v45 = CFSTR("none");
    else
      v45 = off_1E3E75130[v44];
    v70 = CFSTR("source");
    v71 = v45;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D683E8], v46);

    objc_initWeak(&location, self);
    objc_initWeak(&from, v27);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__PKPaymentAuthorizationServiceViewController__setupShippingAddress__block_invoke;
    aBlock[3] = &unk_1E3E74EC0;
    objc_copyWeak(&v65, &location);
    objc_copyWeak(&v66, &from);
    v64 = v62;
    v47 = _Block_copy(aBlock);
    v48 = (void *)MEMORY[0x1E0CB3940];
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "shippingType");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "stringWithFormat:", CFSTR("IN_APP_PAYMENT_OPTIONS_%@_ADDRESS_VC_TITLE"), v50);
    v51 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = [PKPaymentPreferencesViewController alloc];
    preferencesStyle = self->_preferencesStyle;
    v69 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = -[PKPaymentPreferencesViewController initWithStyle:preferences:title:handler:contactFormatValidator:](v53, "initWithStyle:preferences:title:handler:contactFormatValidator:", preferencesStyle, v55, v52, v47, self->_contactFormatValidator);
    shippingAddressPreferencesController = self->_shippingAddressPreferencesController;
    self->_shippingAddressPreferencesController = v56;

    objc_destroyWeak(&v66);
    objc_destroyWeak(&v65);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
}

void __68__PKPaymentAuthorizationServiceViewController__setupShippingAddress__block_invoke(id *a1)
{
  id *WeakRetained;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  _QWORD v24[4];
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 5);
  if (!WeakRetained)
    goto LABEL_12;
  v3 = objc_loadWeakRetained(a1 + 6);
  v4 = objc_msgSend(v3, "selectedIndex");

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(WeakRetained, "stateMachine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didSelectShippingContact:", 0);
    v6 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v7 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v7, "preferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v9, "selectedIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "stateMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didSelectShippingContact:", v6);

  objc_msgSend(a1[4], "requiredBillingContactFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0D69BF0]))
    goto LABEL_8;
  v11 = WeakRetained[138];

  if (v11)
  {
    objc_msgSend(WeakRetained[138], "preferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pk_objectsPassingTest:", &__block_literal_global_177);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "indexOfContact:", v6) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v5, "preferences");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayByAddingObject:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setPreferences:", v15);
    }
    goto LABEL_8;
  }
LABEL_9:
  v16 = (void *)MEMORY[0x1E0D66A58];
  v17 = *MEMORY[0x1E0D698F8];
  v18 = *MEMORY[0x1E0D68C20];
  v19 = *MEMORY[0x1E0D68F50];
  v24[0] = *MEMORY[0x1E0D68AA0];
  v24[1] = v19;
  v20 = *MEMORY[0x1E0D69100];
  v25[0] = v18;
  v25[1] = v20;
  v21 = *MEMORY[0x1E0D69358];
  v24[2] = *MEMORY[0x1E0D69340];
  v24[3] = v21;
  v22 = CFSTR("false");
  if (v6)
    v22 = CFSTR("true");
  v25[2] = CFSTR("shippingAddress");
  v25[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "subject:sendEvent:", v17, v23);

LABEL_12:
}

uint64_t __68__PKPaymentAuthorizationServiceViewController__setupShippingAddress__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  uint64_t v6;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v5, "type"))
  {
    v6 = 1;
    *a4 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_setupShippingContact
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const __CFString *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  PKPaymentPreferencesViewController *v87;
  PKPaymentPreferencesViewController *shippingContactPreferencesController;
  id val;
  void *v90;
  void *v91;
  _QWORD aBlock[4];
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id from;
  id location;
  _QWORD v101[5];
  _QWORD v102[5];
  _QWORD v103[5];
  _QWORD v104[5];
  _QWORD v105[5];
  _QWORD v106[5];
  _QWORD v107[3];

  v107[1] = *MEMORY[0x1E0C80C00];
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentRequest");
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "requiredShippingContactFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0D69BD8]);
  if ((v5 & 1) == 0)
  {
    objc_msgSend(v91, "requiredShippingContactFields");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0D69BE8]) & 1) == 0)
    {

LABEL_10:
      val = 0;
      goto LABEL_17;
    }
  }
  objc_msgSend(v91, "requiredShippingContactFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0D69BF0]);

  if ((v5 & 1) == 0)
  if ((v7 & 1) != 0)
    goto LABEL_10;
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shippingName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "nameComponents");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D671C0], "defaultInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "meCard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nameComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 || !v13)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "defaultContactName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "nameComponents");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v10 = v13;
  }
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_FAMILYNAME_GROUP_NAME"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0D67208]);
  v18 = v17;
  if (v10)
  {
    v107[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    val = (id)objc_msgSend(v18, "initWithTitle:preferences:selectedIndex:readOnly:", v16, v19, 0x7FFFFFFFFFFFFFFFLL, 0);

    objc_msgSend(v91, "requiredShippingContactFields");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(val, "setShowPhoneticName:", objc_msgSend(v20, "containsObject:", *MEMORY[0x1E0D69BE8]));

    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend(val, "preferences");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pkContactWithNameComponents:labeledValues:", v24, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setShippingName:", v25);

    v26 = CFSTR("true");
  }
  else
  {
    val = (id)objc_msgSend(v17, "initWithTitle:preferences:selectedIndex:readOnly:", v16, MEMORY[0x1E0C9AA60], 0x7FFFFFFFFFFFFFFFLL, 0);
    objc_msgSend(v91, "requiredShippingContactFields");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(val, "setShowPhoneticName:", objc_msgSend(v27, "containsObject:", *MEMORY[0x1E0D69BE8]));

    v26 = CFSTR("false");
  }
  v28 = *MEMORY[0x1E0D68C20];
  v29 = *MEMORY[0x1E0D68F50];
  v105[0] = *MEMORY[0x1E0D68AA0];
  v105[1] = v29;
  v30 = *MEMORY[0x1E0D690C0];
  v106[0] = v28;
  v106[1] = v30;
  v31 = *MEMORY[0x1E0D68CA8];
  v105[2] = *MEMORY[0x1E0D69340];
  v105[3] = v31;
  v32 = *MEMORY[0x1E0D68CB0];
  v106[2] = CFSTR("shippingContact");
  v106[3] = v32;
  v33 = (void *)MEMORY[0x1E0D66A58];
  v105[4] = *MEMORY[0x1E0D69358];
  v106[4] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "subject:sendEvent:", *MEMORY[0x1E0D698F8], v34);

  objc_msgSend(v90, "addObject:", val);
LABEL_17:
  objc_msgSend(v91, "requiredShippingContactFields");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "containsObject:", *MEMORY[0x1E0D69BE0]);

  if (v36)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "shippingPhone");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v39)
    {
      v41 = v39;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "defaultContactPhone");
      v41 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v37, "safelyAddObject:", v41);
    if (v41)
      v44 = 0;
    else
      v44 = 0x7FFFFFFFFFFFFFFFLL;
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_PHONENUMBERS_GROUP_NAME"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67200]), "initWithTitle:preferences:selectedIndex:readOnly:", v45, v37, v44, 0);
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ENTER_NEW_PHONENUMBERS"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setAddNewTitle:", v46);

    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ADD_EXISTING_PHONENUMBERS"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setAddExistingTitle:", v47);

    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_EDIT_EXISTING_PHONENUMBERS"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setEditExistingTitle:", v48);

    objc_msgSend(v42, "setContactKey:", *MEMORY[0x1E0C967C0]);
    objc_msgSend(v42, "setType:", 1);
    objc_msgSend(v42, "mergeRecentsAndMeCard");
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "preferences");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "firstObject");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setShippingPhone:", v51);

    v52 = *MEMORY[0x1E0D68C20];
    v53 = *MEMORY[0x1E0D68F50];
    v103[0] = *MEMORY[0x1E0D68AA0];
    v103[1] = v53;
    v54 = *MEMORY[0x1E0D690C0];
    v104[0] = v52;
    v104[1] = v54;
    v55 = *MEMORY[0x1E0D68CA8];
    v103[2] = *MEMORY[0x1E0D69340];
    v103[3] = v55;
    v56 = *MEMORY[0x1E0D68CB8];
    v104[2] = CFSTR("shippingContact");
    v104[3] = v56;
    v103[4] = *MEMORY[0x1E0D69358];
    v57 = CFSTR("true");
    v58 = (void *)MEMORY[0x1E0D66A58];
    if (!v41)
      v57 = CFSTR("false");
    v104[4] = v57;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 5);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "subject:sendEvent:", *MEMORY[0x1E0D698F8], v59);

    objc_msgSend(v90, "addObject:", v42);
  }
  else
  {
    v42 = 0;
  }
  objc_msgSend(v91, "requiredShippingContactFields");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "containsObject:", *MEMORY[0x1E0D69BD0]);

  if (v61)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "shippingEmail");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v64;
    if (v64)
    {
      v66 = v64;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "defaultContactEmail");
      v66 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v62, "safelyAddObject:", v66);
    if (v66)
      v69 = 0;
    else
      v69 = 0x7FFFFFFFFFFFFFFFLL;
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_EMAILADDRESSES_GROUP_NAME"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67200]), "initWithTitle:preferences:selectedIndex:readOnly:", v70, v62, v69, 0);
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ENTER_NEW_EMAILADDRESSES"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setAddNewTitle:", v71);

    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ADD_EXISTING_EMAILADDRESSES"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setAddExistingTitle:", v72);

    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_EDIT_EXISTING_EMAILADDRESSES"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setEditExistingTitle:", v73);

    objc_msgSend(v67, "setContactKey:", *MEMORY[0x1E0C966A8]);
    objc_msgSend(v67, "setType:", 1);
    objc_msgSend(v67, "mergeRecentsAndMeCard");
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "preferences");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "firstObject");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setShippingEmail:", v76);

    v77 = *MEMORY[0x1E0D68C20];
    v78 = *MEMORY[0x1E0D68F50];
    v101[0] = *MEMORY[0x1E0D68AA0];
    v101[1] = v78;
    v79 = *MEMORY[0x1E0D690C0];
    v102[0] = v77;
    v102[1] = v79;
    v80 = *MEMORY[0x1E0D68CA8];
    v101[2] = *MEMORY[0x1E0D69340];
    v101[3] = v80;
    v81 = *MEMORY[0x1E0D68CA0];
    v102[2] = CFSTR("shippingContact");
    v102[3] = v81;
    v101[4] = *MEMORY[0x1E0D69358];
    v82 = CFSTR("true");
    v83 = (void *)MEMORY[0x1E0D66A58];
    if (!v66)
      v82 = CFSTR("false");
    v102[4] = v82;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 5);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "subject:sendEvent:", *MEMORY[0x1E0D698F8], v84);

    objc_msgSend(v90, "addObject:", v67);
  }
  else
  {
    v67 = 0;
  }
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_CONTACT_VC_TITLE"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v90, "count"))
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v67);
    objc_initWeak(&v98, v42);
    objc_initWeak(&v97, val);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__PKPaymentAuthorizationServiceViewController__setupShippingContact__block_invoke;
    aBlock[3] = &unk_1E3E74EE8;
    objc_copyWeak(&v93, &location);
    objc_copyWeak(&v94, &from);
    objc_copyWeak(&v95, &v98);
    objc_copyWeak(&v96, &v97);
    v86 = _Block_copy(aBlock);
    v87 = -[PKPaymentPreferencesViewController initWithStyle:preferences:title:handler:contactFormatValidator:]([PKPaymentPreferencesViewController alloc], "initWithStyle:preferences:title:handler:contactFormatValidator:", self->_preferencesStyle, v90, v85, v86, self->_contactFormatValidator);
    shippingContactPreferencesController = self->_shippingContactPreferencesController;
    self->_shippingContactPreferencesController = v87;

    objc_destroyWeak(&v96);
    objc_destroyWeak(&v95);
    objc_destroyWeak(&v94);
    objc_destroyWeak(&v93);
    objc_destroyWeak(&v97);
    objc_destroyWeak(&v98);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

}

void __68__PKPaymentAuthorizationServiceViewController__setupShippingContact__block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  id v13;
  void *v14;
  unint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  id v30;
  unint64_t v31;
  id v32;
  void *v33;
  unint64_t v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const __CFString *v47;
  void *v48;
  id *v49;
  id v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const __CFString *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD v70[5];
  _QWORD v71[5];
  _QWORD v72[5];
  _QWORD v73[5];
  _QWORD v74[5];
  _QWORD v75[7];

  v75[5] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "stateMachine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shippingEmail");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "stateMachine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shippingPhone");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "stateMachine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shippingName");
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = objc_loadWeakRetained(a1 + 5);
    v12 = objc_msgSend(v11, "selectedIndex");
    v13 = objc_loadWeakRetained(a1 + 5);
    objc_msgSend(v13, "preferences");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    v67 = (void *)v10;
    if (v12 >= v15)
    {
      objc_msgSend(v3, "stateMachine");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "didSelectShippingEmail:", 0);
      v19 = 0;
    }
    else
    {
      v16 = objc_loadWeakRetained(a1 + 5);
      objc_msgSend(v16, "preferences");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_loadWeakRetained(a1 + 5);
      objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v18, "selectedIndex"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "stateMachine");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "didSelectShippingEmail:", v19);
    }

    if (v19 != v69)
    {
      v21 = (void *)MEMORY[0x1E0D66A58];
      v22 = *MEMORY[0x1E0D698F8];
      v23 = *MEMORY[0x1E0D68C20];
      v24 = *MEMORY[0x1E0D68F50];
      v74[0] = *MEMORY[0x1E0D68AA0];
      v74[1] = v24;
      v25 = *MEMORY[0x1E0D69100];
      v75[0] = v23;
      v75[1] = v25;
      v26 = *MEMORY[0x1E0D68CA8];
      v74[2] = *MEMORY[0x1E0D69340];
      v74[3] = v26;
      v27 = *MEMORY[0x1E0D68CA0];
      v75[2] = CFSTR("shippingContact");
      v75[3] = v27;
      v74[4] = *MEMORY[0x1E0D69358];
      if (v19)
        v28 = CFSTR("true");
      else
        v28 = CFSTR("false");
      v75[4] = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 5);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "subject:sendEvent:", v22, v29);

    }
    v30 = objc_loadWeakRetained(a1 + 6);
    v31 = objc_msgSend(v30, "selectedIndex");
    v32 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v32, "preferences");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");

    if (v31 >= v34)
    {
      objc_msgSend(v3, "stateMachine");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "didSelectShippingPhoneNumber:", 0);
      v38 = 0;
    }
    else
    {
      v35 = objc_loadWeakRetained(a1 + 6);
      objc_msgSend(v35, "preferences");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_loadWeakRetained(a1 + 6);
      objc_msgSend(v36, "objectAtIndex:", objc_msgSend(v37, "selectedIndex"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "stateMachine");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "didSelectShippingPhoneNumber:", v38);
    }

    if (v38 != v68)
    {
      v40 = (void *)MEMORY[0x1E0D66A58];
      v41 = *MEMORY[0x1E0D698F8];
      v42 = *MEMORY[0x1E0D68C20];
      v43 = *MEMORY[0x1E0D68F50];
      v72[0] = *MEMORY[0x1E0D68AA0];
      v72[1] = v43;
      v44 = *MEMORY[0x1E0D69100];
      v73[0] = v42;
      v73[1] = v44;
      v45 = *MEMORY[0x1E0D68CA8];
      v72[2] = *MEMORY[0x1E0D69340];
      v72[3] = v45;
      v46 = *MEMORY[0x1E0D68CB8];
      v73[2] = CFSTR("shippingContact");
      v73[3] = v46;
      v72[4] = *MEMORY[0x1E0D69358];
      v47 = CFSTR("false");
      if (v38)
        v47 = CFSTR("true");
      v73[4] = v47;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 5);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "subject:sendEvent:", v41, v48);

    }
    v49 = a1 + 7;
    v50 = objc_loadWeakRetained(v49);
    objc_msgSend(v50, "preferences");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "count");

    if (v52)
    {
      v53 = objc_loadWeakRetained(v49);
      objc_msgSend(v53, "preferences");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "firstObject");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C97200], "pkContactWithNameComponents:labeledValues:", v55, 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stateMachine");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "didSelectShippingName:", v56);

    }
    else
    {
      objc_msgSend(v3, "stateMachine");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "didSelectShippingName:", 0);
      v56 = 0;
    }

    if (v56 != v67)
    {
      v58 = (void *)MEMORY[0x1E0D66A58];
      v59 = *MEMORY[0x1E0D698F8];
      v60 = *MEMORY[0x1E0D68C20];
      v61 = *MEMORY[0x1E0D68F50];
      v70[0] = *MEMORY[0x1E0D68AA0];
      v70[1] = v61;
      v62 = *MEMORY[0x1E0D69100];
      v71[0] = v60;
      v71[1] = v62;
      v63 = *MEMORY[0x1E0D68CA8];
      v70[2] = *MEMORY[0x1E0D69340];
      v70[3] = v63;
      v64 = *MEMORY[0x1E0D68CB0];
      v71[2] = CFSTR("shippingContact");
      v71[3] = v64;
      v70[4] = *MEMORY[0x1E0D69358];
      v65 = CFSTR("false");
      if (v56)
        v65 = CFSTR("true");
      v71[4] = v65;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 5);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "subject:sendEvent:", v59, v66);

    }
  }

}

- (BOOL)_shouldShowUsePeerPaymentBalanceToggle
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;
  BOOL v6;

  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peerPaymentQuote");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "supportsPreservePeerPaymentBalance"))
    v4 = v3 == 0;
  else
    v4 = 1;
  if (v4)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "recipient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  return v6;
}

- (void)_setupBankAccounts
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  PKPaymentPreferencesViewController *v7;
  PKPaymentPreferencesViewController *v8;
  PKPaymentPreferencesViewController *bankAccountPreferencesController;

  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bankAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = [PKPaymentPreferencesViewController alloc];
    v8 = -[PKPaymentPreferencesViewController initWithStyle:preferences:title:handler:contactFormatValidator:](v7, "initWithStyle:preferences:title:handler:contactFormatValidator:", self->_preferencesStyle, MEMORY[0x1E0C9AA60], 0, 0, 0);
    bankAccountPreferencesController = self->_bankAccountPreferencesController;
    self->_bankAccountPreferencesController = v8;

    -[PKPaymentAuthorizationServiceViewController _updateBankAccounts](self, "_updateBankAccounts");
  }
}

- (void)_updateBankAccounts
{
  PKPaymentAuthorizationStateMachine **p_stateMachine;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  int v16;
  int v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  const __CFString *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id val;
  void *v53;
  _QWORD aBlock[4];
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id from;
  id v61;
  _QWORD v62[4];
  id v63;
  PKPaymentAuthorizationServiceViewController *v64;
  id v65;
  id v66;
  id location;
  _QWORD v68[3];

  v68[1] = *MEMORY[0x1E0C80C00];
  if (!self->_bankAccountPreferencesController)
  {
    -[PKPaymentAuthorizationServiceViewController _setupBankAccounts](self, "_setupBankAccounts");
    return;
  }
  p_stateMachine = &self->_stateMachine;
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bankAccounts");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentAuthorizationStateMachine model](*p_stateMachine, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bankAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v53, "indexOfObject:", v7);

  v9 = objc_alloc(MEMORY[0x1E0D671E8]);
  PKLocalizedFeatureString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  val = (id)objc_msgSend(v9, "initWithTitle:preferences:selectedIndex:readOnly:", v10, v53, v8, 0);

  -[PKPaymentAuthorizationStateMachine model](*p_stateMachine, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "peerPaymentPass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationStateMachine model](*p_stateMachine, "model");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "paymentRequest");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "peerPaymentBalance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    objc_msgSend(v51, "amount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v49, "compare:", v14) == -1;

  }
  else
  {
    v15 = 0;
  }
  v16 = objc_msgSend(v50, "deviceSupportsPeerPaymentAccountPayment");
  if (v12)
  {
    v17 = v16;
    if (objc_msgSend(v50, "accountPaymentSupportsPeerPayment"))
    {
      v18 = v17 & v15;
      if ((v17 & v15 & 1) != 0)
      {
        v48 = 0;
      }
      else
      {
        PKLocalizedFeatureString();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v20 = objc_alloc(MEMORY[0x1E0D67218]);
      v68[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v20, "initWithTitle:preferences:selectedIndex:readOnly:", v48, v21, 0x7FFFFFFFFFFFFFFFLL, v18 ^ 1);

      objc_msgSend(v19, "setPeerPaymentPass:", v12);
      objc_msgSend(v19, "setPeerPaymentBalance:", v51);
      objc_msgSend(v19, "setOn:", objc_msgSend(v50, "accountPaymentUsePeerPaymentBalance"));
      objc_msgSend(v19, "setEnabled:", v18);
      if ((v18 & 1) != 0)
        goto LABEL_26;
      v22 = PKPeerPaymentAccountResolutionForAccountAndPeerPaymentPass();
      v46 = -[PKPeerPaymentAccount stage](self->_peerPaymentAccount, "stage");
      v23 = -[PKPeerPaymentAccount state](self->_peerPaymentAccount, "state");
      v24 = v23;
      if (v22 == 2)
      {
        if (v23 == 1)
          -[PKPeerPaymentAccount termsAcceptanceRequired](self->_peerPaymentAccount, "termsAcceptanceRequired");
        goto LABEL_20;
      }
      if (v23 != 1)
        goto LABEL_17;
      v30 = -[PKPeerPaymentAccount termsAcceptanceRequired](self->_peerPaymentAccount, "termsAcceptanceRequired");
      if (v46 == 2)
      {
LABEL_20:
        PKLocalizedFeatureString();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v25;
        PKLocalizedFeatureString();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        PKPeerPaymentGetVerifyIdentitySensitiveURL();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = CFSTR("Apple Cash Resolution: Identity Verification");
        goto LABEL_21;
      }
      if (v30)
      {
        PKLocalizedFeatureString();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v25;
        PKLocalizedFeatureString();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        PKPeerPaymentGetTermsAcceptanceSensitiveURL();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = CFSTR("Apple Cash Resolution: Terms Acceptance");
      }
      else
      {
LABEL_17:
        PKLocalizedFeatureString();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v25;
        PKLocalizedFeatureString();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 == 1)
        {
          v27 = objc_alloc_init(MEMORY[0x1E0D673D8]);
          objc_msgSend(v27, "setRegistrationFlowState:", 0, v25);
          PKPeerPaymentGetSetupSensitiveURLWithConfiguration();
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = CFSTR("Apple Cash Resolution: Activate");
        }
        else
        {
          v42 = v24 != 1 || v46 != 3 || v15;
          if ((v42 & 1) != 0 || v22)
          {
            v43 = (void *)MEMORY[0x1E0CB3940];
            PKPeerPaymentAccountResolutionStateToString();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "stringWithFormat:", CFSTR("Apple Cash Generic Resolution: %@"), v44);
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            v28 = 0;
            if (v26)
              goto LABEL_22;
            goto LABEL_25;
          }
          PKPeerPaymentGetTopUpSensitiveURL();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = CFSTR("Apple Cash Resolution: Top Up");
        }
      }
LABEL_21:
      v47 = (void *)v29;
      if (v26)
      {
LABEL_22:
        objc_msgSend(v19, "setFooter:", v26, v45);
        if (v25)
        {
          v32 = objc_msgSend(v26, "rangeOfString:", v25);
          if (v32 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v33 = v31;
            objc_initWeak(&location, self);
            objc_msgSend(v19, "setFooterLinkRange:", v32, v33);
            v62[0] = MEMORY[0x1E0C809B0];
            v62[1] = 3221225472;
            v62[2] = __66__PKPaymentAuthorizationServiceViewController__updateBankAccounts__block_invoke;
            v62[3] = &unk_1E3E74F10;
            objc_copyWeak(&v66, &location);
            v63 = v28;
            v64 = self;
            v65 = v47;
            objc_msgSend(v19, "setFooterLinkActionBlock:", v62);

            objc_destroyWeak(&v66);
            objc_destroyWeak(&location);
          }
        }
      }
LABEL_25:

LABEL_26:
      objc_msgSend(v19, "footer", v45);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34 == 0;

      if (v35)
      {
        PKLocalizedFeatureString();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setFooter:", v36);

      }
      goto LABEL_29;
    }
  }
  v19 = 0;
LABEL_29:
  objc_initWeak(&location, self);
  objc_initWeak(&v61, val);
  objc_initWeak(&from, v19);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKPaymentAuthorizationServiceViewController__updateBankAccounts__block_invoke_228;
  aBlock[3] = &unk_1E3E74F38;
  objc_copyWeak(&v57, &location);
  v37 = v11;
  v55 = v37;
  objc_copyWeak(&v58, &from);
  v38 = v12;
  v56 = v38;
  objc_copyWeak(&v59, &v61);
  v39 = _Block_copy(aBlock);
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", val, 0);
  objc_msgSend(v40, "safelyAddObject:", v19);
  -[PKPaymentPreferencesViewController setPreferences:](self->_bankAccountPreferencesController, "setPreferences:", v40);
  -[PKPaymentPreferencesViewController setHandler:](self->_bankAccountPreferencesController, "setHandler:", v39);

  objc_destroyWeak(&v59);
  objc_destroyWeak(&v58);

  objc_destroyWeak(&v57);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&location);

}

void __66__PKPaymentAuthorizationServiceViewController__updateBankAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 166);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __66__PKPaymentAuthorizationServiceViewController__updateBankAccounts__block_invoke_2;
    v14 = &unk_1E3E61B68;
    objc_copyWeak(&v16, (id *)(a1 + 56));
    v15 = *(id *)(a1 + 32);
    v7 = _Block_copy(&v11);
    objc_msgSend(v6, "addObject:", v7, v11, v12, v13, v14);

    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134349314;
      v18 = v9;
      v19 = 2114;
      v20 = v10;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationServiceViewController (%{public}p): Cancelling for %{public}@", buf, 0x16u);
    }

    objc_msgSend(v5, "_didCancel:", 1);
    objc_destroyWeak(&v16);
  }

}

void __66__PKPaymentAuthorizationServiceViewController__updateBankAccounts__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id *v4;
  void *v5;
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v4 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "openSensitiveURL:withOptions:", *(_QWORD *)(a1 + 32), 0);
    }
    else
    {
      v4 = (id *)objc_loadWeakRetained(v2);
      objc_msgSend(v4[164], "associatedPassUniqueID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      PKOpenPassDetails();

    }
    WeakRetained = v6;
  }

}

void __66__PKPaymentAuthorizationServiceViewController__updateBankAccounts__block_invoke_228(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "stateMachine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "beginUpdates");
    v5 = objc_loadWeakRetained(a1 + 7);

    if (v5)
    {
      objc_msgSend(v4, "model");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_loadWeakRetained(a1 + 7);
      v8 = objc_msgSend(v7, "isOn");

      objc_msgSend(v6, "paymentRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAccountPaymentUsePeerPaymentBalance:", v8);

      if ((_DWORD)v8)
      {
        objc_msgSend(a1[5], "peerPaymentBalance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      objc_msgSend(v6, "setPeerPaymentBalanceForAccountPayment:", v10);

    }
    objc_msgSend(a1[4], "paymentSummaryItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }
    objc_msgSend(a1[4], "setPaymentSummaryItems:", v11);
    v14 = objc_loadWeakRetained(a1 + 8);
    objc_msgSend(v14, "preferences");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_loadWeakRetained(a1 + 8);
    objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v16, "selectedIndex"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "didSelectBankAccount:", v17);
    objc_msgSend(a1[4], "itemForType:", 9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "peerPaymentPass");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "peerPaymentBalance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPeerPaymentBalance:", v20);

    objc_msgSend(a1[4], "endUpdates");
    v21 = (void *)MEMORY[0x1E0D66A58];
    v22 = *MEMORY[0x1E0D698F8];
    v23 = *MEMORY[0x1E0D68C20];
    v24 = *MEMORY[0x1E0D68F50];
    v27[0] = *MEMORY[0x1E0D68AA0];
    v27[1] = v24;
    v25 = *MEMORY[0x1E0D69100];
    v28[0] = v23;
    v28[1] = v25;
    v27[2] = *MEMORY[0x1E0D69340];
    v28[2] = CFSTR("bankAccount");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "subject:sendEvent:", v22, v26);

  }
}

- (id)_availablePasses
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  BOOL v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  BOOL v41;
  id v42;
  void *v43;
  void *v44;
  char v45;
  id *to;
  void *v48;
  void *v50;
  void *v51;
  id obj;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[5];
  uint64_t v68;
  id location;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v57, "acceptedPasses");
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
  if (v54)
  {
    v53 = *(_QWORD *)v71;
    to = (id *)&v68;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v71 != v53)
        {
          v4 = v3;
          objc_enumerationMutation(obj);
          v3 = v4;
        }
        v55 = v3;
        v5 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v3);
        v6 = objc_alloc_init(MEMORY[0x1E0D671F8]);
        objc_msgSend(v6, "setPass:", v5);
        objc_msgSend(v6, "setShouldShowCardUI:", 1);
        objc_msgSend(v2, "addObject:", v6);
        objc_msgSend(v57, "acceptedPaymentApplicationsForPass:", v5);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "unavailablePaymentApplicationsForPass:", v5);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "paymentRequest");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "requestType") == 5;

        if (v8)
        {
          objc_msgSend(v6, "setPaymentApplication:", 0);
          objc_msgSend(v6, "setIsSelectable:", 1);
          goto LABEL_43;
        }
        if (objc_msgSend(v58, "count") == 1 && !objc_msgSend(v56, "count"))
        {
          objc_msgSend(v58, "firstObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setPaymentApplication:", v24);

          objc_msgSend(v6, "setIsSelectable:", 1);
          objc_msgSend(v5, "uniqueID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "peerPaymentPass");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "uniqueID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = PKEqualObjects();

          if (v28)
          {
            objc_msgSend(v26, "peerPaymentBalance");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "paymentRequest");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "paymentSummaryItems");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "lastObject");
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v50, "currency");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "currencyCode");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v30, "caseInsensitiveCompare:", v31) == 0;

            if (v32)
            {
              objc_msgSend(v50, "amount");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "amount");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v34, "compare:", v35) == -1;

            }
            else
            {
              v33 = 0;
            }
            objc_msgSend(v50, "amount", to);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3598], "zero");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v36, "compare:", v37);

            v39 = objc_msgSend(v51, "requestType");
            if (v33)
            {
              self->_peerPaymentBalanceIsInsufficient = 1;
              goto LABEL_40;
            }
            if (v38)
              v40 = 1;
            else
              v40 = v39 == 3;
            v41 = !v40;
            self->_peerPaymentBalanceIsInsufficient = v41;
            if (!v40)
            {
LABEL_40:
              v42 = objc_alloc_init(MEMORY[0x1E0D671F8]);
              objc_msgSend(v42, "setPass:", v5);
              objc_msgSend(v42, "setIsSelectable:", 1);
              objc_msgSend(v42, "setInsetsSeparatorByTextOffset:", 1);
              objc_msgSend(v42, "setShouldShowCardUI:", 0);
              PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ADD_MONEY_TO_CARD"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "setDisplayName:", v43);

              objc_initWeak(&location, self);
              v67[0] = MEMORY[0x1E0C809B0];
              v67[1] = 3221225472;
              v67[2] = __63__PKPaymentAuthorizationServiceViewController__availablePasses__block_invoke;
              v67[3] = &unk_1E3E61B68;
              objc_copyWeak(to, &location);
              v67[4] = self;
              objc_msgSend(v42, "setActionBlock:", v67);
              objc_msgSend(v2, "addObject:", v42);
              objc_destroyWeak(to);
              objc_destroyWeak(&location);

            }
          }

          goto LABEL_43;
        }
        v9 = objc_msgSend(v58, "count", to);
        if ((unint64_t)(objc_msgSend(v56, "count") + v9) < 2)
        {
          objc_msgSend(v2, "removeObject:", v6);
        }
        else
        {
          objc_msgSend(v6, "setIsSelectable:", 0);
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          v10 = v58;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v64;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v64 != v12)
                  objc_enumerationMutation(v10);
                v14 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v13);
                v15 = objc_alloc_init(MEMORY[0x1E0D671F8]);
                objc_msgSend(v15, "setPass:", v5);
                objc_msgSend(v15, "setPaymentApplication:", v14);
                objc_msgSend(v15, "setIsSelectable:", 1);
                objc_msgSend(v15, "setInsetsSeparatorByTextOffset:", 1);
                objc_msgSend(v15, "setShouldShowCardUI:", 0);
                objc_msgSend(v14, "displayName");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "setDisplayName:", v16);

                objc_msgSend(v2, "addObject:", v15);
                ++v13;
              }
              while (v11 != v13);
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
            }
            while (v11);
          }

          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          v17 = v56;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
          if (v18)
          {
            v19 = *(_QWORD *)v60;
            do
            {
              v20 = 0;
              do
              {
                if (*(_QWORD *)v60 != v19)
                  objc_enumerationMutation(v17);
                v21 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v20);
                v22 = objc_alloc_init(MEMORY[0x1E0D671F8]);
                objc_msgSend(v22, "setPass:", v5);
                objc_msgSend(v22, "setPaymentApplication:", v21);
                objc_msgSend(v22, "setIsSelectable:", 0);
                objc_msgSend(v22, "setInsetsSeparatorByTextOffset:", 1);
                objc_msgSend(v22, "setShouldShowCardUI:", 0);
                objc_msgSend(v21, "displayName");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setDisplayName:", v23);

                objc_msgSend(v2, "addObject:", v22);
                ++v20;
              }
              while (v18 != v20);
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
            }
            while (v18);
          }

        }
LABEL_43:

        v3 = v55 + 1;
      }
      while (v55 + 1 != v54);
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    }
    while (v54);
  }

  objc_msgSend(v57, "paymentRequest");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v44, "requestType"))
    goto LABEL_48;
  v45 = PKHideAddCardInOsloChooseCardsScreen();

  if ((v45 & 1) == 0)
  {
    -[PKPaymentAuthorizationServiceViewController _addCardEntry](self, "_addCardEntry");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v44);
LABEL_48:

  }
  return v2;
}

void __63__PKPaymentAuthorizationServiceViewController__availablePasses__block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD aBlock[4];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (void *)WeakRetained[166];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKPaymentAuthorizationServiceViewController__availablePasses__block_invoke_2;
  aBlock[3] = &unk_1E3E61310;
  objc_copyWeak(&v9, v2);
  v5 = _Block_copy(aBlock);
  objc_msgSend(v4, "addObject:", v5);

  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134349056;
    v11 = v7;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationServiceViewController (%{public}p): Cancelling for insufficient balance", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "_didCancel:", 1);
  objc_destroyWeak(&v9);

}

void __63__PKPaymentAuthorizationServiceViewController__availablePasses__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    PKPeerPaymentGetTopUpSensitiveURL();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "openSensitiveURL:withOptions:", v2, 0);

    WeakRetained = v4;
  }

}

- (id)_addCardEntry
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = objc_alloc_init(MEMORY[0x1E0D671F8]);
  objc_msgSend(v3, "setIsSelectable:", 1);
  objc_msgSend(v3, "setInsetsSeparatorByTextOffset:", 0);
  objc_msgSend(v3, "setShouldShowCardUI:", 0);
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ADD_CARD"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisplayName:", v4);

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__PKPaymentAuthorizationServiceViewController__addCardEntry__block_invoke;
  v6[3] = &unk_1E3E61310;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "setActionBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v3;
}

void __60__PKPaymentAuthorizationServiceViewController__addCardEntry__block_invoke(uint64_t a1)
{
  id v1;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v1 = objc_loadWeakRetained(WeakRetained + 177);
  objc_msgSend(v1, "authorizationViewControllerDidRequestPaymentSetup");

}

- (int64_t)selectedPaymentApplicationIndexFromCardEntries:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  void *v17;

  v4 = a3;
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pass");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "paymentApplication");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "isSelectable");
      objc_msgSend(v17, "pass");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uniqueID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (v9)
      {
        if (!v8 && v13)
          break;
      }
      if (v13)
      {
        objc_msgSend(v17, "paymentApplication");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v8);

        if ((v15 & 1) != 0)
        {

          break;
        }
      }

      if (++v5 >= (unint64_t)objc_msgSend(v4, "count"))
        goto LABEL_9;
    }

  }
  else
  {
LABEL_9:
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (id)_unavailablePasses
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unavailablePasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v4, "count"))
  {
    v15 = v3;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
          v12 = objc_alloc_init(MEMORY[0x1E0D671F8]);
          objc_msgSend(v12, "setPass:", v11);
          objc_msgSend(v12, "setShouldShowCardUI:", 1);
          objc_msgSend(v12, "setIsSelectable:", 0);
          -[PKPaymentAuthorizationServiceViewController _availabilityStringForPass:](self, "_availabilityStringForPass:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setAvailabilityString:", v13);

          objc_msgSend(v5, "addObject:", v12);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    v3 = v15;
  }

  return v5;
}

- (void)_updateAvailableCardsPreferences
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t PreferenceWithClass;
  PKPaymentPreferencesViewController *paymentCardPreferencesController;
  void *v10;
  id v11;

  if (self->_paymentCardPreferencesController)
  {
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_CARD_GROUP_NAME"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationServiceViewController _availablePasses](self, "_availablePasses");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D671F0]), "initWithTitle:preferences:selectedIndex:readOnly:", v11, v3, -[PKPaymentAuthorizationServiceViewController selectedPaymentApplicationIndexFromCardEntries:](self, "selectedPaymentApplicationIndexFromCardEntries:", v3), 0);
    -[PKPaymentPreferencesViewController preferences](self->_paymentCardPreferencesController, "preferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    v7 = objc_opt_class();
    PreferenceWithClass = _IndexOfFirstPreferenceWithClass(v6, v7);
    if (PreferenceWithClass != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v6, "replaceObjectAtIndex:withObject:", PreferenceWithClass, v4);
    paymentCardPreferencesController = self->_paymentCardPreferencesController;
    v10 = (void *)objc_msgSend(v6, "copy");
    -[PKPaymentPreferencesViewController setPreferences:](paymentCardPreferencesController, "setPreferences:", v10);

  }
}

- (void)_setupPaymentPassAndBillingAddress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  PKPaymentPreferencesViewController *v54;
  PKPaymentPreferencesViewController *paymentCardPreferencesController;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD aBlock[4];
  id v62;
  id v63;
  id v64;
  char v65;
  id location;
  _QWORD v67[5];
  _QWORD v68[5];
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentRequest");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationServiceViewController _availablePasses](self, "_availablePasses");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPaymentAuthorizationServiceViewController _shouldShowUsePeerPaymentBalanceToggle](self, "_shouldShowUsePeerPaymentBalanceToggle"))
  {
    objc_msgSend(v3, "peerPaymentPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "peerPaymentBalance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc(MEMORY[0x1E0D67218]);
      v69[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithTitle:preferences:selectedIndex:readOnly:", 0, v9, 0x7FFFFFFFFFFFFFFFLL, 0);

      objc_msgSend(v10, "setPeerPaymentPass:", v6);
      objc_msgSend(v10, "setPeerPaymentBalance:", v7);
      objc_msgSend(v10, "setOn:", objc_msgSend(v3, "usePeerPaymentBalance"));
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "amount");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "compare:", v12) == -1 && objc_msgSend(v60, "count") != 0;
      objc_msgSend(v10, "setEnabled:", v13);

      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_USE_PEER_PAYMENT_BALANCE_FOOTER"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFooter:", v14);

    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v4, "safelyAddObject:", v10);

  }
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_CARD_GROUP_NAME"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D671F0]), "initWithTitle:preferences:selectedIndex:readOnly:", v57, v60, -[PKPaymentAuthorizationServiceViewController selectedPaymentApplicationIndexFromCardEntries:](self, "selectedPaymentApplicationIndexFromCardEntries:", v60), 0);
  objc_msgSend(v4, "addObject:", v56);
  -[PKPaymentAuthorizationServiceViewController _unavailablePasses](self, "_unavailablePasses");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v59, "count"))
  {
    objc_msgSend(v3, "paymentRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "originatingURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      v17 = CFSTR("IN_WEB_PAYMENT_OPTIONS_UNAVAILABLE_CARDS_GROUP_NAME");
    else
      v17 = CFSTR("IN_APP_PAYMENT_OPTIONS_UNAVAILABLE_CARDS_GROUP_NAME");
    PKLocalizedPaymentString(&v17->isa);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D671F0]), "initWithTitle:preferences:selectedIndex:readOnly:", v18, v59, 0x7FFFFFFFFFFFFFFFLL, 1);
    objc_msgSend(v4, "addObject:", v19);

  }
  objc_msgSend(v58, "requiredBillingContactFields");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "containsObject:", *MEMORY[0x1E0D69BF0]);

  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "billingAddress");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pass");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "defaultBillingAddressForPaymentPass:", v28);
      v25 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v22, "safelyAddObject:", v25);
    objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "defaultBillingAddresses");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "allKeys");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObjectsFromArray:", v31);

    v32 = (void *)MEMORY[0x1E0D66A58];
    v33 = *MEMORY[0x1E0D68C20];
    v34 = *MEMORY[0x1E0D68F50];
    v67[0] = *MEMORY[0x1E0D68AA0];
    v67[1] = v34;
    v35 = *MEMORY[0x1E0D690C0];
    v68[0] = v33;
    v68[1] = v35;
    v36 = *MEMORY[0x1E0D69330];
    v37 = *MEMORY[0x1E0D68CA8];
    v67[2] = *MEMORY[0x1E0D69340];
    v67[3] = v37;
    v38 = *MEMORY[0x1E0D68C98];
    v68[2] = v36;
    v68[3] = v38;
    v67[4] = *MEMORY[0x1E0D69358];
    objc_msgSend(v3, "billingAddress");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = CFSTR("true");
    if (!v39)
      v40 = CFSTR("false");
    v68[4] = v40;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 5);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "subject:sendEvent:", *MEMORY[0x1E0D698F8], v41);

    if (v25)
      v42 = 0;
    else
      v42 = 0x7FFFFFFFFFFFFFFFLL;
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_BILLINGADDRESS_GROUP_NAME"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67200]), "initWithTitle:preferences:selectedIndex:readOnly:", v43, v22, v42, 0);
    objc_msgSend(v26, "setContactKey:", *MEMORY[0x1E0C967F0]);
    objc_msgSend(v26, "setType:", 0);
    objc_msgSend(v58, "requiredBillingContactFields");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setShowPhoneticName:", objc_msgSend(v44, "containsObject:", *MEMORY[0x1E0D69BE8]));

    objc_msgSend(v26, "mergeRecentsAndMeCard");
    objc_msgSend(v26, "preferences");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "firstObject");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBillingAddress:", v46);

    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ENTER_NEW_BILLINGADDRESS"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAddNewTitle:", v47);

    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ADD_EXISTING_BILLINGADDRESS"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAddExistingTitle:", v48);

    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_EDIT_EXISTING_BILLINGADDRESS"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setEditExistingTitle:", v49);

    objc_msgSend(v4, "addObject:", v26);
  }
  else
  {
    v26 = 0;
  }
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PKPaymentAuthorizationServiceViewController__setupPaymentPassAndBillingAddress__block_invoke;
  aBlock[3] = &unk_1E3E74F60;
  objc_copyWeak(&v64, &location);
  v65 = v21;
  v50 = v58;
  v62 = v50;
  v51 = v3;
  v63 = v51;
  v52 = _Block_copy(aBlock);
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_PAYMENT_CARD_VC_TITLE"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -[PKPaymentPreferencesViewController initWithStyle:preferences:title:handler:contactFormatValidator:]([PKPaymentPreferencesViewController alloc], "initWithStyle:preferences:title:handler:contactFormatValidator:", self->_preferencesStyle, v4, v53, v52, self->_contactFormatValidator);
  paymentCardPreferencesController = self->_paymentCardPreferencesController;
  self->_paymentCardPreferencesController = v54;

  objc_destroyWeak(&v64);
  objc_destroyWeak(&location);

}

void __81__PKPaymentAuthorizationServiceViewController__setupPaymentPassAndBillingAddress__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t PreferenceWithClass;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  id v37;
  void *v38;
  const __CFString *v39;
  unint64_t v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  id v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  _BOOL8 v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _QWORD v78[4];
  id v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  void *v85;
  _QWORD v86[5];
  _QWORD v87[5];
  _QWORD v88[5];
  _QWORD v89[5];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
    goto LABEL_61;
  v6 = objc_opt_class();
  PreferenceWithClass = _IndexOfFirstPreferenceWithClass(v4, v6);
  if (PreferenceWithClass == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", PreferenceWithClass);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v4, "lastObject");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v75 = 0;
  }
  if (objc_msgSend(WeakRetained, "_shouldShowUsePeerPaymentBalanceToggle"))
  {
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v82;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v82 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v14;
            goto LABEL_20;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
        if (v11)
          continue;
        break;
      }
    }
    v15 = 0;
LABEL_20:

  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v8, "preferences");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v8;
  objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v8, "selectedIndex"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "pass");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v17;
  objc_msgSend(v17, "paymentApplication");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(*(id *)(a1 + 32), "requestType");
  objc_msgSend(WeakRetained, "stateMachine");
  v20 = objc_claimAutoreleasedReturnValue();
  v76 = (void *)v20;
  if (v15)
  {
    v21 = (void *)v20;
    v22 = objc_msgSend(v15, "isOn");
    objc_msgSend(v21, "model");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v22 ^ objc_msgSend(v23, "usePeerPaymentBalance");

  }
  else
  {
    v24 = 0;
    v22 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "pass");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqual:", v18);
  v27 = v26;
  if (v26 && v19 != 5)
  {
    objc_msgSend(*(id *)(a1 + 40), "paymentApplication");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v28, "isEqual:", v77);

  }
  if ((v27 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "setPass:withSelectedPaymentApplication:", v18, v77);
    objc_msgSend(v76, "didSelectPaymentPass:paymentApplication:", v18, v77);
    v30 = (void *)MEMORY[0x1E0D66A58];
    v31 = *MEMORY[0x1E0D698F8];
    v32 = *MEMORY[0x1E0D68C20];
    v33 = *MEMORY[0x1E0D68F50];
    v88[0] = *MEMORY[0x1E0D68AA0];
    v88[1] = v33;
    v34 = *MEMORY[0x1E0D69100];
    v89[0] = v32;
    v89[1] = v34;
    v35 = CFSTR("true");
    if (!v18)
      v35 = CFSTR("false");
    v36 = *MEMORY[0x1E0D69340];
    v88[2] = *MEMORY[0x1E0D69358];
    v88[3] = v36;
    v89[2] = v35;
    v89[3] = CFSTR("card");
    v88[4] = *MEMORY[0x1E0D69110];
    v37 = v18;
    objc_msgSend(v37, "associatedAccountServiceAccountIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = CFSTR("appleCard");
    }
    else if ((objc_msgSend(v37, "hasAssociatedPeerPaymentAccount") & 1) != 0)
    {
      v39 = CFSTR("appleCash");
    }
    else
    {
      objc_msgSend(v37, "devicePrimaryPaymentApplication");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "paymentNetworkIdentifier");

      if (v55 == 123)
        v39 = CFSTR("barcode");
      else
        v39 = CFSTR("other");
    }
    v29 = v74;

    v89[4] = v39;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 5);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "subject:sendEvent:", v31, v56);

    objc_msgSend(*(id *)(a1 + 32), "requiredBillingContactFields");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v56) = objc_msgSend(v57, "containsObject:", *MEMORY[0x1E0D69BF0]);

    if (!(_DWORD)v56)
      goto LABEL_53;
    objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "defaultBillingAddressForPaymentPass:", v37);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v75, "preferences");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __81__PKPaymentAuthorizationServiceViewController__setupPaymentPassAndBillingAddress__block_invoke_2;
      v78[3] = &unk_1E3E72148;
      v60 = v44;
      v79 = v60;
      v61 = v75;
      v80 = v61;
      v62 = objc_msgSend(v59, "indexOfObjectPassingTest:", v78);

      if (v62 == 0x7FFFFFFFFFFFFFFFLL)
        v63 = 0;
      else
        v63 = v60;
      objc_msgSend(v76, "didSelectBillingAddress:", v63);
      objc_msgSend(v61, "setSelectedIndex:", v62);

      v29 = v74;
    }
    goto LABEL_52;
  }
  if (!v24)
  {
    v40 = objc_msgSend(v75, "selectedIndex");
    objc_msgSend(v75, "preferences");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "count");

    if (v40 >= v42)
    {
      v44 = 0;
    }
    else
    {
      objc_msgSend(v75, "preferences");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "objectAtIndex:", objc_msgSend(v75, "selectedIndex"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v29 = v74;
    objc_msgSend(v76, "didSelectBillingAddress:", v44);
    v45 = (void *)MEMORY[0x1E0D66A58];
    v46 = *MEMORY[0x1E0D68C20];
    v47 = *MEMORY[0x1E0D68F50];
    v86[0] = *MEMORY[0x1E0D68AA0];
    v86[1] = v47;
    v48 = *MEMORY[0x1E0D69100];
    v87[0] = v46;
    v87[1] = v48;
    v49 = *MEMORY[0x1E0D68CA8];
    v86[2] = *MEMORY[0x1E0D69340];
    v86[3] = v49;
    v50 = *MEMORY[0x1E0D68C98];
    v87[2] = *MEMORY[0x1E0D69330];
    v87[3] = v50;
    v86[4] = *MEMORY[0x1E0D69358];
    v51 = *MEMORY[0x1E0D698F8];
    if (v44)
      v52 = CFSTR("true");
    else
      v52 = CFSTR("false");
    v87[4] = v52;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 5);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "subject:sendEvent:", v51, v53);

LABEL_52:
    goto LABEL_53;
  }
  objc_msgSend(*(id *)(a1 + 40), "setUsePeerPaymentBalance:", v22);
  objc_msgSend(v76, "didSelectPaymentPass:paymentApplication:", v18, v77);
  v29 = v74;
LABEL_53:
  if (v15)
  {
    objc_msgSend(*(id *)(a1 + 40), "beginUpdates");
    objc_msgSend(*(id *)(a1 + 40), "paymentSummaryItems");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v64, "count"))
    {
      objc_msgSend(v64, "lastObject");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v65;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
      v66 = objc_claimAutoreleasedReturnValue();

      v64 = (void *)v66;
    }
    objc_msgSend(*(id *)(a1 + 40), "setPaymentSummaryItems:", v64);
    objc_msgSend(v64, "lastObject");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "amount");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "peerPaymentBalance");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "amount");
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    v71 = objc_msgSend(v15, "isOn");
    if ((_DWORD)v71)
      v72 = objc_msgSend(v68, "compare:", v70) == 1;
    else
      v72 = 1;
    objc_msgSend(*(id *)(a1 + 40), "showPeerPaymentCardDataItem:withCardDataItem:", v71, v72);
    objc_msgSend(*(id *)(a1 + 40), "endUpdates");

  }
LABEL_61:

}

uint64_t __81__PKPaymentAuthorizationServiceViewController__setupPaymentPassAndBillingAddress__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 32) == a2)
    return 1;
  else
    return objc_msgSend(*(id *)(a1 + 40), "preferenceObject:representsContact:", a2);
}

- (id)_availabilityStringForPass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  BOOL v10;
  int v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  int v21;
  void *v22;
  void *v23;
  const __CFString *v24;

  v4 = a3;
  v5 = v4;
  if (!self->_peerPaymentAccount)
  {
    objc_msgSend(0, "state");
    goto LABEL_12;
  }
  objc_msgSend(v4, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAccount associatedPassUniqueID](self->_peerPaymentAccount, "associatedPassUniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  v9 = -[PKPeerPaymentAccount state](self->_peerPaymentAccount, "state");
  if (v8)
    v10 = v9 == 3;
  else
    v10 = 0;
  if (v10)
  {
    v12 = CFSTR("PEER_PAYMENT_SETTINGS_ACCOUNT_STATE_LOCKED");
    goto LABEL_17;
  }
  if (v9 == 4)
    v11 = v8;
  else
    v11 = 0;
  if (v11 != 1)
  {
    if (v9 == 1)
      v21 = v8;
    else
      v21 = 0;
    if (v21 == 1
      && (objc_msgSend(MEMORY[0x1E0D67428], "peerPaymentPassIsProvisionedOnDeviceForAccount:", self->_peerPaymentAccount) & 1) == 0)
    {
      v12 = CFSTR("PEER_PAYMENT_SETTINGS_REGISTRATION_NOT_SET_UP");
      goto LABEL_17;
    }
LABEL_12:
    objc_msgSend(v5, "deviceInAppPaymentApplications");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      if ((objc_msgSend(v5, "isDevicePrimaryPaymentApplicationPersonalized") & 1) == 0)
      {
        objc_msgSend(v5, "devicePrimaryPaymentApplication");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "state");

        PKDisplayableStringForPaymentApplicationState();
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      objc_msgSend(v5, "devicePrimaryInAppPaymentApplication");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "paymentNetworkIdentifier");

      if (v16 == 100)
      {
        objc_msgSend(v5, "organizationName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_UNAVAILABLE_CARD_REASON_APP_DOES_NOT_SUPPORT_PRIVATE_LABEL"), CFSTR("%@"), v17);
        v18 = objc_claimAutoreleasedReturnValue();
LABEL_35:
        v23 = (void *)v18;

        goto LABEL_36;
      }
      if (self->_preferencesStyle == 4)
        v24 = CFSTR("WEB");
      else
        v24 = CFSTR("APP");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IN_%@_PAYMENT_OPTIONS_UNAVAILABLE_CARD_REASON_DOES_NOT_SUPPORT_NETWORK"), v24);
    }
    else
    {
      if (self->_preferencesStyle == 4)
        v20 = CFSTR("WEB");
      else
        v20 = CFSTR("APP");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IN_%@_PAYMENT_OPTIONS_UNAVAILABLE_CARD_REASON_CARD_NOT_SUPPORTED"), v20);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString((NSString *)v17);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  v12 = CFSTR("PEER_PAYMENT_SETTINGS_ACCOUNT_STATE_CLOSED");
LABEL_17:
  PKLocalizedPeerPaymentString(&v12->isa);
  v19 = objc_claimAutoreleasedReturnValue();
LABEL_29:
  v23 = (void *)v19;
LABEL_36:

  return v23;
}

- (void)_updateShippingMethods
{
  PKPaymentAuthorizationStateMachine **p_stateMachine;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PKPaymentPreferencesViewController *shippingMethodPreferencesController;
  void *v22;
  void *v23;
  _QWORD aBlock[4];
  id v25;
  id v26;
  id from;
  id location;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  if (self->_shippingMethodPreferencesController)
  {
    p_stateMachine = &self->_stateMachine;
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "availableShippingMethods");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "methods");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentAuthorizationStateMachine model](*p_stateMachine, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shippingMethod");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "indexOfObject:", v8);

    v10 = (void *)MEMORY[0x1E0CB3940];
    -[PKPaymentAuthorizationStateMachine model](*p_stateMachine, "model");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shippingType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("IN_APP_PAYMENT_OPTIONS_%@METHOD_GROUP_NAME"), v12);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0D67210]);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      v16 = 0;
    else
      v16 = v9;
    v17 = (void *)objc_msgSend(v15, "initWithTitle:preferences:selectedIndex:readOnly:", v14, v6, v16, 0);
    -[PKPaymentAuthorizationStateMachine model](*p_stateMachine, "model");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "currencyCode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCurrency:", v19);

    objc_initWeak(&location, self);
    objc_initWeak(&from, v17);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__PKPaymentAuthorizationServiceViewController__updateShippingMethods__block_invoke;
    aBlock[3] = &unk_1E3E74F88;
    objc_copyWeak(&v25, &location);
    objc_copyWeak(&v26, &from);
    v20 = _Block_copy(aBlock);
    shippingMethodPreferencesController = self->_shippingMethodPreferencesController;
    v29[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPreferencesViewController setPreferences:](shippingMethodPreferencesController, "setPreferences:", v22);

    -[PKPaymentPreferencesViewController setHandler:](self->_shippingMethodPreferencesController, "setHandler:", v20);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  else
  {
    -[PKPaymentAuthorizationServiceViewController _setupShippingMethods](self, "_setupShippingMethods");
  }
}

void __69__PKPaymentAuthorizationServiceViewController__updateShippingMethods__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = (id *)(a1 + 40);
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v4, "preferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v6, "selectedIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "stateMachine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShippingMethod:", v7);

    objc_msgSend(WeakRetained, "stateMachine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didSelectShippingMethod:", v7);

    v11 = (void *)MEMORY[0x1E0D66A58];
    v12 = *MEMORY[0x1E0D698F8];
    v13 = *MEMORY[0x1E0D68C20];
    v14 = *MEMORY[0x1E0D68F50];
    v20[0] = *MEMORY[0x1E0D68AA0];
    v20[1] = v14;
    v15 = *MEMORY[0x1E0D69100];
    v21[0] = v13;
    v21[1] = v15;
    v20[2] = *MEMORY[0x1E0D69358];
    v16 = objc_loadWeakRetained(v3);
    v17 = objc_msgSend(v16, "selectedIndex");
    v18 = CFSTR("true");
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      v18 = CFSTR("false");
    v20[3] = *MEMORY[0x1E0D69340];
    v21[2] = v18;
    v21[3] = CFSTR("shippingMethod");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subject:sendEvent:", v12, v19);

  }
}

- (void)_updatePreferencesWithErrors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PKPaymentPreferencesViewController *paymentCardPreferencesController;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPaymentPreferencesViewController setErrors:animated:](self->_shippingAddressPreferencesController, "setErrors:animated:", v4, 0);
  -[PKPaymentPreferencesViewController setErrors:animated:](self->_shippingContactPreferencesController, "setErrors:animated:", v4, 0);
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "mode") == 1)
  {
    objc_msgSend(v5, "pass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "peerPaymentPass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v5, "itemForType:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "status") == 5)
    {
      v36 = 0;
      objc_msgSend(v9, "isValidWithError:", &v36);
      v10 = v36;
      v11 = v10;
      if (v10)
      {
        v30 = (void *)MEMORY[0x1E0CB35C8];
        v33 = *MEMORY[0x1E0D6AD28];
        v40 = *MEMORY[0x1E0CB2D50];
        v12 = v40;
        objc_msgSend(v10, "userInfo");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
        v14 = v9;
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", v33, -1001, v15);
        v34 = v6;
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = v14;
        objc_msgSend(v8, "arrayByAddingObject:", v16);
        v17 = objc_claimAutoreleasedReturnValue();

        v6 = v34;
        v8 = (void *)v17;
      }

    }
    -[PKPaymentPreferencesViewController setErrors:selectedPass:animated:](self->_paymentCardPreferencesController, "setErrors:selectedPass:animated:", v8, v6, 0);
    if (!self->_peerPaymentBalanceIsInsufficient || v7 == 0)
    {
      if (!self->_peerPaymentBalanceIsInsufficient && v7 != 0)
        -[PKPaymentPreferencesViewController setErrors:otherPass:animated:](self->_paymentCardPreferencesController, "setErrors:otherPass:animated:", MEMORY[0x1E0C9AA60], v7, 0);
    }
    else
    {
      objc_msgSend(v7, "peerPaymentBalance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "minimalFormattedStringValue");
      v35 = v6;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_INSUFFICIENT_APPLE_CASH_BALANCE_DETAILS"), CFSTR("%@"), v21);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0D6AD28];
      v38 = *MEMORY[0x1E0CB2D50];
      v39 = v32;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v24 = v8;
      v25 = v9;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, -1001, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v25;
      v8 = v24;
      paymentCardPreferencesController = self->_paymentCardPreferencesController;
      v37 = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPreferencesViewController setErrors:otherPass:animated:](paymentCardPreferencesController, "setErrors:otherPass:animated:", v29, v7, 0);

      v6 = v35;
    }

  }
}

- (void)_showUnserviceableAddressAlertForErrors:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
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

  v21 = a3;
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shippingAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualIgnoringIdentifiers:", self->_lastUnserviceableAddress) & 1) == 0
    && objc_msgSend(v21, "pk_containsObjectPassingTest:", &__block_literal_global_277_1))
  {
    objc_storeStrong((id *)&self->_lastUnserviceableAddress, v5);
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shippingType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("IN_APP_PAYMENT_%@_ADDRESS_UNAVAILABLE_ALERT_TITLE"), v8);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "paymentRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "originatingURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      PKLocalizedPaymentString(CFSTR("WEB_PAYMENT_ADDRESS_UNAVAILABLE_ALERT_MESSAGE"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "merchantName");
    }
    else
    {
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ADDRESS_UNAVAILABLE_ALERT_MESSAGE"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hostAppLocalizedName");
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(v9, CFSTR("%@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v16, v13, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "addAction:", v20);
    -[PKPaymentAuthorizationServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);

  }
}

BOOL __87__PKPaymentAuthorizationServiceViewController__showUnserviceableAddressAlertForErrors___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AD28]))
    v4 = objc_msgSend(v2, "code") == 3;
  else
    v4 = 0;

  return v4;
}

- (void)_setupCouponCodeEntry
{
  void *v3;
  PKPaymentAuthorizationCouponCodeEntryViewController *v4;
  PKPaymentAuthorizationCouponCodeEntryViewController *couponCodeEntryViewController;
  id v6;

  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentRequest");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "supportsCouponCode"))
  {
    v4 = -[PKPaymentAuthorizationCouponCodeEntryViewController initWithStyle:]([PKPaymentAuthorizationCouponCodeEntryViewController alloc], "initWithStyle:", self->_preferencesStyle);
    couponCodeEntryViewController = self->_couponCodeEntryViewController;
    self->_couponCodeEntryViewController = v4;

    -[PKPaymentAuthorizationCouponCodeEntryViewController setDelegate:](self->_couponCodeEntryViewController, "setDelegate:", self);
  }

}

- (void)_updateCouponCodeEntry
{
  -[PKPaymentAuthorizationCouponCodeEntryViewController reloadDataItem](self->_couponCodeEntryViewController, "reloadDataItem");
}

- (void)_updatePreferredContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  PKPaymentAuthorizationTotalView *totalView;
  double v15;
  double v16;
  PKPaymentAuthorizationSummaryItemsView *summaryItemsView;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int64_t v27;
  _BOOL8 v28;
  int v29;
  id v30;

  if (!self->_layoutRecursionCounter)
  {
    -[PKPaymentAuthorizationServiceViewController preferredContentSize](self, "preferredContentSize");
    -[PKPaymentAuthorizationServiceViewController viewIfLoaded](self, "viewIfLoaded");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationServiceViewController navigationController](self, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;

    if (self->_passphraseViewController)
    {
      getAKModalSignInViewControllerClass();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[UIViewController view](self->_passphraseViewController, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "subviews");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = 1148846080;
        LODWORD(v13) = 1112014848;
        objc_msgSend(v11, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v6, 0.0, v12, v13);

        if (!self->_usingLargeLayout && !CGRectIsNull(self->_keyboardFrame))
          objc_msgSend(v30, "safeAreaInsets");
      }
    }
    else
    {
      totalView = self->_totalView;
      if (totalView)
      {
        LODWORD(v7) = 1148846080;
        LODWORD(v8) = 1112014848;
        -[PKPaymentAuthorizationTotalView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](totalView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v6, 0.0, v7, v8);
      }
      if (!-[PKPaymentAuthorizationPasswordButtonView isHidden](self->_passwordButtonView, "isHidden"))
      {
        LODWORD(v15) = 1148846080;
        LODWORD(v16) = 1112014848;
        -[PKPaymentAuthorizationPasswordButtonView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_passwordButtonView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v6, 0.0, v15, v16);
      }
      LODWORD(v15) = 1148846080;
      LODWORD(v16) = 1112014848;
      -[PKPaymentAuthorizationFooterView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_footerView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v6, 0.0, v15, v16);
      summaryItemsView = self->_summaryItemsView;
      if (summaryItemsView)
      {
        -[PKPaymentAuthorizationServiceViewController view](self, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bounds");
        -[PKPaymentAuthorizationSummaryItemsView sizeThatFits:](summaryItemsView, "sizeThatFits:", v19, 1.79769313e308);

      }
      -[UITableView contentSize](self->_detailTableView, "contentSize");
    }
    PKSizeRoundToPixel();
    v21 = v20;
    v23 = v22;
    -[PKPaymentAuthorizationServiceViewController preferredContentSize](self, "preferredContentSize");
    if (v21 != v25 || v23 != v24)
      -[PKPaymentAuthorizationServiceViewController setPreferredContentSize:](self, "setPreferredContentSize:", v21, v23);
    v27 = -[PKPaymentAuthorizationServiceViewController _totalViewStyle](self, "_totalViewStyle");
    -[PKPaymentAuthorizationTotalView setStyle:](self->_totalView, "setStyle:", v27);
    v28 = v27 == 2;
    -[PKPaymentAuthorizationSummaryItemsView setOccludesBodyView:](self->_summaryItemsView, "setOccludesBodyView:", v28);
    -[PKPaymentAuthorizationFooterView setOccludesBodyView:](self->_footerView, "setOccludesBodyView:", v28);
    v29 = -[UITableView isScrollEnabled](self->_detailTableView, "isScrollEnabled");
    -[UITableView setScrollEnabled:](self->_detailTableView, "setScrollEnabled:", v28);
    if (v28 != v29)
      -[UITableView reloadData](self->_detailTableView, "reloadData");

  }
}

- (int64_t)_totalViewStyle
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  int64_t v11;

  -[PKPaymentAuthorizationServiceViewController _compactNavigationController](self, "_compactNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_4;
  objc_msgSend(v3, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  -[PKPaymentAuthorizationServiceViewController preferredContentSize](self, "preferredContentSize");
  objc_msgSend(v4, "childViewControllerPreferredContentSizeForSize:isRoot:", 1);
  v7 = v6;
  objc_msgSend(v4, "navigationControllerSizeForChildViewControllerPreferredContentSize:isRoot:", 1);
  objc_msgSend(v4, "childViewControllerSizeForNavigationControllerSize:");
  if (v7 - v8 < PKUIPixelLength())
  {
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "paymentSummaryItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (unint64_t)objc_msgSend(v10, "count") < 2;

  }
  else
  {
LABEL_4:
    v11 = 2;
  }

  return v11;
}

- (id)_compactNavigationController
{
  void *v2;
  void *v3;

  -[PKPaymentAuthorizationServiceViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pkui_compactNavigationContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_authenticatorPolicy
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;

  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "requestType");

  v5 = objc_msgSend(v2, "mode");
  objc_msgSend(v2, "paymentRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "useLocationBasedAuthorization");

  if (v5 == 3)
  {
    if (v4 == 6)
      v12 = 8;
    else
      v12 = 2;
  }
  else if (v5 == 1)
  {
    v8 = objc_msgSend(v2, "praguePolicyRequired");
    v9 = objc_msgSend(v2, "pinRequired");
    v10 = 2;
    if (v7)
      v10 = 4;
    if (v9)
      v10 = 3;
    v11 = 5;
    if (v7)
      v11 = 7;
    if (v9)
      v11 = 6;
    if (v8)
      v12 = v11;
    else
      v12 = v10;
  }
  else
  {
    v12 = 2;
  }

  return v12;
}

- (id)_evaluationRequestWithHasInitialAuthenticatorState:(BOOL)a3 initialAuthenticatorState:(unint64_t)a4
{
  _BOOL4 v5;
  unint64_t v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  uint8_t buf[4];
  __CFString *v26;
  uint64_t v27;

  v5 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v7 = -[PKPaymentAuthorizationServiceViewController _authenticatorPolicy](self, "_authenticatorPolicy");
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v7 > 0xA)
      v9 = 0;
    else
      v9 = off_1E3E75158[v7];
    *(_DWORD *)buf = 138412290;
    v26 = v9;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "New authenticator policy is %@", buf, 0xCu);
  }

  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "paymentRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "requestType");
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6BFE0]), "initWithPolicy:", v7);
  v14 = v13;
  if (v5)
    objc_msgSend(v13, "setInitialAuthenticatorState:", a4);
  if ((objc_msgSend(v11, "_isAMPPayment") & 1) != 0)
    goto LABEL_15;
  if (v12 == 6)
  {
    objc_msgSend(v11, "externalizedContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setExternalizedContext:", v24);

    goto LABEL_16;
  }
  if (v12 == 13 || v12 == 7)
  {
LABEL_15:
    objc_msgSend(v11, "externalizedContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setExternalizedContext:", v16);

    objc_msgSend(v14, "setAccessControlRef:", objc_msgSend(v11, "accesssControlRef"));
  }
LABEL_16:
  if (objc_msgSend(v11, "_isAMPPayment"))
    objc_msgSend(v14, "setMaxBiometryFailures:", *MEMORY[0x1E0D69A60]);
  if (v7 == 6 || v7 == 3)
  {
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pass");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_PIN_CODE_PROMPT_FMT"), CFSTR("%@"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setPINTitle:", v20);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0D69D18]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPINLength:", v21);

  }
  if (objc_msgSend(v11, "confirmationStyle") == 1)
  {
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_PASSCODE_TITLE_CONFIRM"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(v14, "setPasscodeTitle:", v22);

  return v14;
}

- (void)_setVisible:(BOOL)a3
{
  if (((!self->_visible ^ a3) & 1) == 0)
  {
    self->_visible = a3;
    if (a3)
      self->_viewAppeared = 1;
    -[PKPaymentAuthorizationServiceViewController _updatePhysicalButtonState](self, "_updatePhysicalButtonState");
    -[PKPaymentAuthorizationServiceViewController _updateCoachingState](self, "_updateCoachingState");
  }
}

- (void)_setAuthenticating:(BOOL)a3
{
  if (((!self->_authenticating ^ a3) & 1) == 0)
  {
    self->_authenticating = a3;
    -[PKPaymentAuthorizationServiceViewController _updatePhysicalButtonState](self, "_updatePhysicalButtonState");
    -[PKPaymentAuthorizationServiceViewController _updateCoachingState](self, "_updateCoachingState");
  }
}

- (void)_setPasscodeViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *v6;

  v5 = (UIViewController *)a3;
  if (self->_passcodeViewController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_passcodeViewController, a3);
    -[PKPaymentAuthorizationServiceViewController _updatePhysicalButtonState](self, "_updatePhysicalButtonState");
    -[PKPaymentAuthorizationServiceViewController _updateCoachingState](self, "_updateCoachingState");
    v5 = v6;
  }

}

- (void)_setPassphraseViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *v6;

  v5 = (UIViewController *)a3;
  if (self->_passphraseViewController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_passphraseViewController, a3);
    -[PKPaymentAuthorizationServiceViewController _updatePhysicalButtonState](self, "_updatePhysicalButtonState");
    -[PKPaymentAuthorizationServiceViewController _updateCoachingState](self, "_updateCoachingState");
    v5 = v6;
  }

}

- (void)_updateUserIntentStyle
{
  int64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0D6BFD8], "userIntentStyle");
  if (self->_userIntentStyle != v3)
  {
    self->_userIntentStyle = v3;
    -[PKPaymentAuthorizationFooterView setUserIntentStyle:](self->_footerView, "setUserIntentStyle:", v3);
  }
}

- (void)_updatePhysicalButtonState
{
  _BOOL4 v3;
  int v4;
  int64_t v5;
  _BOOL4 physicalButtonVisibleOnce;
  int64_t v7;
  char v8;
  id WeakRetained;
  id v10;
  unint64_t v11;
  int64_t userIntentStyle;
  int v16;
  id v17;

  if (self->_bypassAuthenticator || self->_passphraseViewController)
    goto LABEL_3;
  v11 = -[PKPaymentAuthorizationFooterView state](self->_footerView, "state");
  userIntentStyle = self->_userIntentStyle;
  if (userIntentStyle == 1 && v11 == 3)
  {
    v16 = 0;
    v3 = 0;
    goto LABEL_37;
  }
  if (!self->_allowBiometricPhysicalButtonInstruction || v11 > 5 || ((1 << v11) & 0x25) == 0)
  {
    if (!self->_allowCompactProcessing)
    {
LABEL_3:
      v3 = 0;
      v4 = 0;
      v5 = 0;
      goto LABEL_4;
    }
    if (userIntentStyle == 1)
    {
      v3 = 0;
      if (v11 != 10)
      {
        v5 = 0;
LABEL_42:
        v4 = 0;
        goto LABEL_4;
      }
    }
    else
    {
      v5 = 0;
      v3 = 0;
      if (!self->_allowBiometricPhysicalButtonInstruction || v11 != 10)
        goto LABEL_42;
    }
    v16 = 1;
    goto LABEL_37;
  }
  v16 = 0;
  v3 = 1;
LABEL_37:
  if (self->_visible && self->_authenticating && ((self->_passcodeViewController == 0) & ~v16) != 0)
  {
    v4 = 1;
    v5 = 1;
  }
  else
  {
    v4 = 0;
    v5 = 2;
  }
LABEL_4:
  if (self->_physicalButtonState != v5 || self->_useBiometricPhysicalButtonInstruction != v3)
  {
    self->_physicalButtonState = v5;
    self->_useBiometricPhysicalButtonInstruction = v3;
    physicalButtonVisibleOnce = self->_physicalButtonVisibleOnce;
    if ((self->_physicalButtonVisibleOnce & ~v4) == 0)
    {
      if (v3)
        v7 = 2;
      else
        v7 = 1;
      self->_physicalButtonAnimationStyle = v7;
      v8 = v4 ^ 1;
      if (physicalButtonVisibleOnce)
        v8 = 1;
      if ((v8 & 1) == 0)
        self->_physicalButtonVisibleOnce = 1;
    }
    -[PKPaymentAuthorizationServiceViewController _updatePhysicalButtonInstructionAndNotify:](self, "_updatePhysicalButtonInstructionAndNotify:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v17 = WeakRetained;
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "authorizationViewControllerDidChangePhysicalButtonState:", self);

      WeakRetained = v17;
    }

  }
}

- (void)_updatePhysicalButtonInstructionAndNotify:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __CFString *v12;
  NSString *v13;
  NSString *physicalButtonInstruction;
  id WeakRetained;
  void *v16;
  id v17;
  id v18;

  v3 = a3;
  if (((PKUserIntentIsAvailable() & 1) != 0 || self->_allowBiometricPhysicalButtonInstruction)
    && (self->_physicalButtonState == 1 || !self->_physicalButtonVisibleOnce))
  {
    if (self->_useBiometricPhysicalButtonInstruction)
    {
      PKLocalizedPaymentString(CFSTR("GENERIC_TOUCH_ID"));
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "paymentRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v7, "confirmationStyle");
      objc_msgSend(v7, "localizedBiometricConfirmationTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (!v9)
      {
        switch(v8)
        {
          case 0:
            v12 = CFSTR("IN_APP_PAYMENT_PUSH_BUTTON");
            goto LABEL_21;
          case 1:
            v12 = CFSTR("IN_APP_PAYMENT_PUSH_BUTTON_CONFIRM");
            goto LABEL_21;
          case 2:
            v12 = CFSTR("IN_APP_PAYMENT_PUSH_BUTTON_GET");
            goto LABEL_21;
          case 3:
            v12 = CFSTR("IN_APP_PAYMENT_PUSH_BUTTON_INSTALL");
            goto LABEL_21;
          case 4:
            v12 = CFSTR("IN_APP_PAYMENT_PUSH_BUTTON_RENT");
            goto LABEL_21;
          case 5:
            v12 = CFSTR("IN_APP_PAYMENT_PUSH_BUTTON_REDEEM");
            goto LABEL_21;
          case 6:
            v12 = CFSTR("IN_APP_PAYMENT_PUSH_BUTTON_ADD");
            goto LABEL_21;
          case 7:
            v12 = CFSTR("IN_APP_PAYMENT_PUSH_BUTTON_SUBSCRIBE");
            goto LABEL_21;
          case 8:
            v12 = CFSTR("IN_APP_PAYMENT_PUSH_BUTTON_SUBSCRIBE_AND_INSTALL");
LABEL_21:
            PKLocalizedPearlString(&v12->isa);
            v11 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_22;
          default:
            v17 = 0;
            goto LABEL_23;
        }
      }
      v11 = v9;
LABEL_22:
      v17 = v11;
LABEL_23:

      v5 = (uint64_t)v17;
    }
    v18 = (id)v5;
    if ((PKEqualObjects() & 1) == 0)
    {
      v13 = (NSString *)objc_msgSend(v18, "copy");
      physicalButtonInstruction = self->_physicalButtonInstruction;
      self->_physicalButtonInstruction = v13;

      if (v3)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v16 = WeakRetained;
        if (WeakRetained)
          objc_msgSend(WeakRetained, "authorizationViewControllerDidChangePhysicalButtonState:", self);

      }
    }

  }
}

- (void)_updateCoachingState
{
  int64_t internalCoachingState;
  _BOOL4 v4;
  id WeakRetained;

  if (PKPearlIsAvailable()
    && self->_visible
    && self->_authenticating
    && !self->_passcodeViewController
    && !self->_passphraseViewController)
  {
    internalCoachingState = self->_internalCoachingState;
    v4 = self->_faceIDCameraEdge == 3;
  }
  else
  {
    internalCoachingState = 0;
    v4 = 0;
  }
  if (self->_coachingState == internalCoachingState)
  {
    if (self->_showPoseOutOfRangeDownCoaching != v4)
    {
      self->_coachingState = internalCoachingState;
      self->_showPoseOutOfRangeDownCoaching = v4;
      -[PKPaymentAuthorizationServiceViewController _updateFooterStateIfAuthenticatingWithBiometricFailure:](self, "_updateFooterStateIfAuthenticatingWithBiometricFailure:", 0);
    }
  }
  else
  {
    self->_coachingState = internalCoachingState;
    self->_showPoseOutOfRangeDownCoaching = v4;
    -[PKPaymentAuthorizationServiceViewController _updateFooterStateIfAuthenticatingWithBiometricFailure:](self, "_updateFooterStateIfAuthenticatingWithBiometricFailure:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "authorizationViewControllerDidChangeCoachingState:", self);

  }
}

- (void)_updateFooterStateIfAuthenticatingWithBiometricFailure:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;

  if (self->_authenticating)
  {
    v3 = a3;
    v5 = -[PKPaymentAuthorizationServiceViewController _progressStateForAuthenticationWithBiometricFailure:](self, "_progressStateForAuthenticationWithBiometricFailure:");
    if (-[PKPaymentAuthorizationFooterView state](self->_footerView, "state") != v5)
      -[PKPaymentAuthorizationServiceViewController setFooterState:string:animated:](self, "setFooterState:string:animated:", v5, 0, 1);
    if (v3)
      -[PKPaymentAuthorizationServiceViewController biometricAttemptFailed](self, "biometricAttemptFailed");
  }
}

- (BOOL)_passcodeAllowed
{
  void *v3;
  void *v4;
  char v5;

  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_isAMPPayment)
    v5 = objc_msgSend(v4, "_isPSD2StyleRequest");
  else
    v5 = 1;

  return v5;
}

- (BOOL)_passwordRequired
{
  void *v3;
  void *v4;
  BOOL v5;
  int v6;

  if (!-[PKPaymentAuthorizationServiceViewController _passcodeAllowed](self, "_passcodeAllowed"))
    return 1;
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_isPSD2StyleRequest"))
  {
    if (objc_msgSend(v3, "mode") == 3)
    {
      v5 = 1;
    }
    else
    {
      v6 = objc_msgSend(MEMORY[0x1E0D6BFD8], "currentStateForAccessControl:", objc_msgSend(v4, "accesssControlRef"));
      v5 = (v6 & objc_msgSend(MEMORY[0x1E0D6BFD8], "currentStateForPolicy:", -[PKPaymentAuthorizationServiceViewController _authenticatorPolicy](self, "_authenticatorPolicy")) & 8) == 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_sendDidEncounterAuthorizationEventIfNecessary:(unint64_t)a3
{
  PKPaymentAuthorizationHostProtocol **p_host;
  id WeakRetained;
  char v6;
  id v7;

  if (self->_isAMPPayment)
  {
    p_host = &self->_host;
    WeakRetained = objc_loadWeakRetained((id *)&self->_host);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)p_host);
      objc_msgSend(v7, "didEncounterAuthorizationEvent:", a3);

    }
  }
}

- (void)contextWillBeginPresentingSecondaryUI:(id)a3
{
  -[PKPaymentAuthorizationServiceViewController _sendDidEncounterAuthorizationEventIfNecessary:](self, "_sendDidEncounterAuthorizationEventIfNecessary:", 3);
}

- (PKPaymentAuthorizationStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (PKAuthenticator)authenticator
{
  return self->_authenticator;
}

- (void)setAuthenticator:(id)a3
{
  objc_storeStrong((id *)&self->_authenticator, a3);
}

- (int64_t)physicalButtonState
{
  return self->_physicalButtonState;
}

- (int64_t)physicalButtonAnimationStyle
{
  return self->_physicalButtonAnimationStyle;
}

- (NSString)physicalButtonInstruction
{
  return self->_physicalButtonInstruction;
}

- (int64_t)coachingState
{
  return self->_coachingState;
}

- (PKPaymentAuthorizationServiceViewControllerDelegate)delegate
{
  return (PKPaymentAuthorizationServiceViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPaymentAuthorizationHostProtocol)host
{
  return (PKPaymentAuthorizationHostProtocol *)objc_loadWeakRetained((id *)&self->_host);
}

- (void)setHost:(id)a3
{
  objc_storeWeak((id *)&self->_host, a3);
}

- (BOOL)blockingHardwareCancels
{
  return self->_blockingHardwareCancels;
}

- (PKPaymentAuthorizationPresenter)presenter
{
  return (PKPaymentAuthorizationPresenter *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_destroyWeak((id *)&self->_host);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_physicalButtonInstruction, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_contactFormatValidator, 0);
  objc_storeStrong((id *)&self->_lastUnserviceableAddress, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_passphraseViewController, 0);
  objc_storeStrong((id *)&self->_passcodeViewController, 0);
  objc_storeStrong((id *)&self->_couponCodeEntryViewController, 0);
  objc_storeStrong((id *)&self->_bankAccountPreferencesController, 0);
  objc_storeStrong((id *)&self->_paymentCardPreferencesController, 0);
  objc_storeStrong((id *)&self->_shippingContactPreferencesController, 0);
  objc_storeStrong((id *)&self->_shippingAddressPreferencesController, 0);
  objc_storeStrong((id *)&self->_shippingMethodPreferencesController, 0);
  objc_storeStrong((id *)&self->_contentViewRightConstraint, 0);
  objc_storeStrong((id *)&self->_passphraseSeparatorView, 0);
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_passphraseBottomConstraint, 0);
  objc_storeStrong((id *)&self->_passwordButtonView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_totalView, 0);
  objc_storeStrong((id *)&self->_summaryHeightConstraint, 0);
  objc_storeStrong((id *)&self->_summaryItemsView, 0);
  objc_storeStrong((id *)&self->_detailTableView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
