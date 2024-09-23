@implementation PKDataReleaseContentViewController

- (PKDataReleaseContentViewController)initWithRequest:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  PKDataReleaseContentViewController *v9;
  PKAuthenticator *v10;
  PKAuthenticator *authenticator;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PKTransactionReleasedData *v18;
  PKTransactionReleasedData *dataToRelease;
  PKPaymentTransactionIconGenerator *v20;
  PKPaymentTransactionIconGenerator *iconGenerator;
  void *v22;
  id v23;
  void *v24;
  UIImage *v25;
  UIImage *merchantIcon;
  BOOL v27;
  PKDataReleaseEntityResolver *v28;
  PKDataReleaseEntityResolver *entityResolver;
  PKDataReleaseEntityResolver *v30;
  void *v31;
  PKDataReleaseContentViewController *v32;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  BOOL v38;
  id location;
  id v40;
  id v41;
  id v42;
  objc_super v43;

  v7 = a3;
  v8 = a4;
  if (!v7)
    goto LABEL_12;
  v43.receiver = self;
  v43.super_class = (Class)PKDataReleaseContentViewController;
  v9 = -[PKDataReleaseContentViewController init](&v43, sel_init);
  self = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeWeak((id *)&self->_delegate, v8);
    v10 = (PKAuthenticator *)objc_alloc_init(MEMORY[0x1E0D6BFD8]);
    authenticator = self->_authenticator;
    self->_authenticator = v10;

    -[PKAuthenticator setDelegate:](self->_authenticator, "setDelegate:", self);
    objc_msgSend(v7, "dataElements");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "elements");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v42 = 0;
    v40 = 0;
    PKISO180135AcceptedFieldsFromElements(v13, 0, &v42, &v41, &v40);
    v14 = v42;
    v35 = v42;
    v15 = v41;
    v34 = v41;
    v16 = v40;
    v17 = v40;

    objc_storeStrong((id *)&self->_intentRetainElements, v14);
    objc_storeStrong((id *)&self->_intentDoNotRetainElements, v15);
    objc_storeStrong((id *)&self->_intentDisplayOnlyElements, v16);
    objc_msgSend(v7, "dataElements");
    v18 = (PKTransactionReleasedData *)objc_claimAutoreleasedReturnValue();
    dataToRelease = self->_dataToRelease;
    self->_dataToRelease = v18;

    v20 = -[PKPaymentTransactionIconGenerator initWithCache:scale:]([PKPaymentTransactionIconGenerator alloc], "initWithCache:scale:", 1, PKUIScreenScale());
    iconGenerator = self->_iconGenerator;
    self->_iconGenerator = v20;

    objc_msgSend(v7, "iconData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = objc_alloc(MEMORY[0x1E0DC3870]);
      objc_msgSend(v7, "iconData", v34, v35);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (UIImage *)objc_msgSend(v23, "initWithData:", v24);
      merchantIcon = self->_merchantIcon;
      self->_merchantIcon = v25;

      v27 = self->_merchantIcon != 0;
    }
    else
    {
      v27 = 0;
    }
    objc_initWeak(&location, self);
    v28 = objc_alloc_init(PKDataReleaseEntityResolver);
    entityResolver = self->_entityResolver;
    self->_entityResolver = v28;

    v30 = self->_entityResolver;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __63__PKDataReleaseContentViewController_initWithRequest_delegate___block_invoke;
    v36[3] = &unk_1E3E75760;
    objc_copyWeak(&v37, &location);
    v38 = v27;
    -[PKDataReleaseEntityResolver resolveEntityForRequest:completion:](v30, "resolveEntityForRequest:completion:", v7, v36);
    if (!PKIdentityPresentmentV2Enabled())
      goto LABEL_9;
    -[PKDataReleaseContentViewController _updateDataReleaseConfiguration](self, "_updateDataReleaseConfiguration");
    -[PKIdentityDataReleaseConfiguration recognizedElements](self->_dataReleaseConfiguration, "recognizedElements");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "count"))
    {
      -[PKTransactionReleasedData setElements:](self->_dataToRelease, "setElements:", v31);

LABEL_9:
      objc_destroyWeak(&v37);
      objc_destroyWeak(&location);

      goto LABEL_10;
    }

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);

LABEL_12:
    v32 = 0;
    goto LABEL_13;
  }
LABEL_10:
  self = self;
  v32 = self;
LABEL_13:

  return v32;
}

void __63__PKDataReleaseContentViewController_initWithRequest_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKDataReleaseContentViewController_initWithRequest_delegate___block_invoke_2;
  block[3] = &unk_1E3E67148;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v8 = *(_BYTE *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v7);
}

void __63__PKDataReleaseContentViewController_initWithRequest_delegate___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id *v20;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    v4 = WeakRetained[141];
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "displayName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "displayName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {
        v10 = 0;
      }
      else
      {
        v10 = 1;
        if (v7 && v8)
          v10 = objc_msgSend(v7, "isEqualToString:", v8) ^ 1;
      }

    }
    else
    {
      v10 = 0;
    }
    objc_storeStrong(v3 + 141, *(id *)(a1 + 32));
    if (objc_msgSend(*(id *)(a1 + 32), "isValid"))
    {
      v11 = objc_loadWeakRetained(v3 + 123);
      objc_msgSend(v11, "dataReleaseContentViewController:didResolveToMerchant:", v3, *(_QWORD *)(a1 + 32));

    }
    if (*(_BYTE *)(a1 + 48))
    {
      if (!v10)
        goto LABEL_20;
    }
    else
    {
      v12 = v3[140];
      v13 = v3[138];
      v14 = *(_QWORD *)(a1 + 32);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __63__PKDataReleaseContentViewController_initWithRequest_delegate___block_invoke_3;
      v19[3] = &unk_1E3E75738;
      v20 = v3;
      v15 = v12;
      objc_msgSend(v13, "iconForMerchant:size:ignoreLogoURL:requestType:iconHandler:", v14, 0, 0, v19, 54.0, 54.0);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v3[140];
      v3[140] = (id)v16;

      if (v10)
      {

      }
      else
      {
        v18 = v3[140];

        if (v15 == v18)
        {
LABEL_20:

          goto LABEL_21;
        }
      }
    }
    objc_msgSend(v3, "_reloadMerchantHeader");
    goto LABEL_20;
  }
LABEL_21:

}

void __63__PKDataReleaseContentViewController_initWithRequest_delegate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __63__PKDataReleaseContentViewController_initWithRequest_delegate___block_invoke_4;
    v4[3] = &unk_1E3E61388;
    v5 = *(id *)(a1 + 32);
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

uint64_t __63__PKDataReleaseContentViewController_initWithRequest_delegate___block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1120), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_reloadMerchantHeader");
}

- (void)dealloc
{
  __SecAccessControl *accessControl;
  void *v4;
  objc_super v5;

  -[PKAuthenticator invalidate](self->_authenticator, "invalidate");
  -[PKAuthenticator setDelegate:](self->_authenticator, "setDelegate:", 0);
  -[PKDataReleaseContentViewController setIdleTimerDisabled:](self, "setIdleTimerDisabled:", 0);
  accessControl = self->_accessControl;
  if (accessControl)
    CFRelease(accessControl);
  -[LAContext invalidate](self->_localAuthenticationContext, "invalidate");
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pkui_resetSharedRootAuthenticationContext");

  v5.receiver = self;
  v5.super_class = (Class)PKDataReleaseContentViewController;
  -[PKDataReleaseContentViewController dealloc](&v5, sel_dealloc);
}

- (void)setIdleTimerDisabled:(BOOL)a3
{
  PKIdleTimerAssertion *idleTimerAssertion;
  PKIdleTimerAssertion *v5;
  PKIdleTimerAssertion *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *idleTimer;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  PKIdleTimerAssertion *v12;
  NSObject *v13;
  OS_dispatch_source *v14;
  _QWORD handler[5];

  idleTimerAssertion = self->_idleTimerAssertion;
  if (a3)
  {
    if (!idleTimerAssertion)
    {
      v5 = -[PKIdleTimerAssertion initWithReason:]([PKIdleTimerAssertion alloc], "initWithReason:", CFSTR("ID Presentment"));
      v6 = self->_idleTimerAssertion;
      self->_idleTimerAssertion = v5;

    }
    v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    idleTimer = self->_idleTimer;
    self->_idleTimer = v7;

    v9 = self->_idleTimer;
    v10 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v11 = self->_idleTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __59__PKDataReleaseContentViewController_setIdleTimerDisabled___block_invoke;
    handler[3] = &unk_1E3E612E8;
    handler[4] = self;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_resume((dispatch_object_t)self->_idleTimer);
  }
  else
  {
    -[PKIdleTimerAssertion invalidate](idleTimerAssertion, "invalidate");
    v12 = self->_idleTimerAssertion;
    self->_idleTimerAssertion = 0;

    v13 = self->_idleTimer;
    if (v13)
    {
      dispatch_source_cancel(v13);
      v14 = self->_idleTimer;
      self->_idleTimer = 0;

    }
  }
}

uint64_t __59__PKDataReleaseContentViewController_setIdleTimerDisabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIdleTimerDisabled:", 0);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UITableView *v13;
  UITableView *tableViewReleaseData;
  UITableView *v15;
  void *v16;
  UITableView *v17;
  void *v18;
  PKDataReleaseHeader *v19;
  PKDataReleaseHeader *header;
  UIView *v21;
  UIView *bottomSeparator;
  UIView *v23;
  void *v24;
  void *v25;
  UIVisualEffectView *v26;
  UIVisualEffectView *footerMaterial;
  PKPaymentAuthorizationLayout *v28;
  PKPaymentAuthorizationFooterView *v29;
  PKPaymentAuthorizationFooterView *footerView;
  PKPaymentAuthorizationFooterView *v31;
  uint64_t v32;
  PKPaymentAuthorizationFooterView *v33;
  void *v34;
  PKPaymentAuthorizationFooterView *v35;
  void *v36;
  PKPaymentAuthorizationFooterView *v37;
  void *v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)PKDataReleaseContentViewController;
  -[PKDataReleaseContentViewController viewDidLoad](&v39, sel_viewDidLoad);
  -[PKDataReleaseContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3658];
  PKPassKitUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("color/sheetBackground"), v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setBackgroundColor:", v6);
  if (PKIdentityPresentmentV2Enabled())
    v7 = 0;
  else
    v7 = 2;
  v8 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v9 = *MEMORY[0x1E0C9D648];
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v13 = (UITableView *)objc_msgSend(v8, "initWithFrame:style:", v7, *MEMORY[0x1E0C9D648], v10, v11, v12);
  tableViewReleaseData = self->_tableViewReleaseData;
  self->_tableViewReleaseData = v13;

  v15 = self->_tableViewReleaseData;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](v15, "setBackgroundColor:", v16);

  -[UITableView setDelegate:](self->_tableViewReleaseData, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableViewReleaseData, "setDataSource:", self);
  -[UITableView registerClass:forHeaderFooterViewReuseIdentifier:](self->_tableViewReleaseData, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("merchantCellIdentifier"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableViewReleaseData, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("dataReleaseElementsCellIdentifier"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableViewReleaseData, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("requestedDataCellIdentifier"));
  -[UITableView setContentInset:](self->_tableViewReleaseData, "setContentInset:", 0.0, 0.0, 0.0, 0.0);
  -[UITableView setScrollEnabled:](self->_tableViewReleaseData, "setScrollEnabled:", 0);
  v17 = self->_tableViewReleaseData;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setSeparatorColor:](v17, "setSeparatorColor:", v18);

  -[UITableView _setBottomPadding:](self->_tableViewReleaseData, "_setBottomPadding:", 0.0);
  objc_msgSend(v3, "addSubview:", self->_tableViewReleaseData);
  -[UITableView reloadData](self->_tableViewReleaseData, "reloadData");
  v19 = -[PKDataReleaseHeader initWithDelegate:]([PKDataReleaseHeader alloc], "initWithDelegate:", self);
  header = self->_header;
  self->_header = v19;

  objc_msgSend(v3, "addSubview:", self->_header);
  v21 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  bottomSeparator = self->_bottomSeparator;
  self->_bottomSeparator = v21;

  v23 = self->_bottomSeparator;
  objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v23, "setBackgroundColor:", v24);

  -[UIView setClipsToBounds:](self->_bottomSeparator, "setClipsToBounds:", 0);
  -[UIView setAlpha:](self->_bottomSeparator, "setAlpha:", 0.0);
  objc_msgSend(v3, "addSubview:", self->_bottomSeparator);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v25);
  footerMaterial = self->_footerMaterial;
  self->_footerMaterial = v26;

  objc_msgSend(v3, "addSubview:", self->_footerMaterial);
  v28 = -[PKPaymentAuthorizationLayout initWithStyle:paymentRequest:]([PKPaymentAuthorizationLayout alloc], "initWithStyle:paymentRequest:", 1, 0);
  v29 = -[PKPaymentAuthorizationFooterView initWithFrame:layout:]([PKPaymentAuthorizationFooterView alloc], "initWithFrame:layout:", v28, v9, v10, v11, v12);
  footerView = self->_footerView;
  self->_footerView = v29;

  -[PKPaymentAuthorizationFooterView setCompletionStyle:](self->_footerView, "setCompletionStyle:", 1);
  -[PKPaymentAuthorizationFooterView setUserIntentStyle:](self->_footerView, "setUserIntentStyle:", objc_msgSend(MEMORY[0x1E0D6BFD8], "userIntentStyle"));
  -[PKPaymentAuthorizationFooterView setDelegate:](self->_footerView, "setDelegate:", self);
  v31 = self->_footerView;
  if (PKPearlIsAvailable())
    v32 = 3;
  else
    v32 = 0;
  -[PKPaymentAuthorizationFooterView setState:string:animated:](v31, "setState:string:animated:", v32, 0, 0);
  v33 = self->_footerView;
  PKLocalizedIdentityString(CFSTR("PRESENTMENT_FOOTER_CONFIRM_TOUCHID"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationFooterView setBiometricConfirmationTitle:](v33, "setBiometricConfirmationTitle:", v34);

  v35 = self->_footerView;
  PKLocalizedIdentityString(CFSTR("PRESENTMENT_FOOTER_PASSCODE"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationFooterView setConfirmationTitle:](v35, "setConfirmationTitle:", v36);

  v37 = self->_footerView;
  PKLocalizedIdentityString(CFSTR("PRESENTMENT_FOOTER_SHARING"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationFooterView setAuthorizingTitle:](v37, "setAuthorizingTitle:", v38);

  -[PKDataReleaseContentViewController _configureFooterViewConfirmationTitle](self, "_configureFooterViewConfirmationTitle");
  -[PKPaymentAuthorizationFooterView setTranslatesAutoresizingMaskIntoConstraints:](self->_footerView, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  -[PKPaymentAuthorizationFooterView setHidesSeparatorView:](self->_footerView, "setHidesSeparatorView:", 1);
  -[PKPaymentAuthorizationFooterView setPreventPasscodeFallbackForBiometricFailure:](self->_footerView, "setPreventPasscodeFallbackForBiometricFailure:", 1);
  objc_msgSend(v3, "addSubview:", self->_footerView);
  -[PKDataReleaseContentViewController _startInitialEvaluation](self, "_startInitialEvaluation");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDataReleaseContentViewController;
  -[PKDataReleaseContentViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PKDataReleaseContentViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  int v5;
  char v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  const __CFString *v15;
  __CFString **v16;
  __CFString **v17;
  void *v18;
  uint64_t v19;
  void *v20;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)PKDataReleaseContentViewController;
  -[PKDataReleaseContentViewController viewDidAppear:](&v21, sel_viewDidAppear_, a3);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68C50], *MEMORY[0x1E0D68AA0]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68950], *MEMORY[0x1E0D68F50]);
  v5 = -[PKISO18013DataReleaseRequest isTrustedRelyingParty](self->_request, "isTrustedRelyingParty");
  v6 = v5;
  if (v5)
    v7 = CFSTR("true");
  else
    v7 = CFSTR("false");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("authenticatedTerminal"));
  if (PKLocationServicesEnabled())
    v8 = CFSTR("true");
  else
    v8 = CFSTR("false");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("locationSet"));
  if ((v6 & 1) == 0)
  {
    -[PKISO18013DataReleaseRequest analyticsIdentifier](self->_request, "analyticsIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("relyingPartyID"));

    -[PKISO18013DataReleaseRequest analyticsOrganizationName](self->_request, "analyticsOrganizationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("relyingPartyName"));

  }
  -[PKISO18013DataReleaseRequest dataElements](self->_request, "dataElements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "certificateData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    v14 = -[NSArray count](self->_intentDisplayOnlyElements, "count")
       && !-[NSArray count](self->_intentRetainElements, "count")
       && -[NSArray count](self->_intentDoNotRetainElements, "count") == 0;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("tapToVerify"), CFSTR("presentmentReaderType"));
    v17 = PKAnalyticsReportDataTransferTypeDisplayOnly;
    if (!v14)
      v17 = &PKAnalyticsReportDataTransferTypeDataTransfer;
    v15 = *v17;
    v16 = PKAnalyticsReportDataTransferTypeKey;
  }
  else
  {
    v15 = CFSTR("other");
    v16 = PKAnalyticsReportPresentmentReaderTypeKey;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, *v16);
  v18 = (void *)MEMORY[0x1E0D66A58];
  v19 = *MEMORY[0x1E0D69940];
  v22[0] = *MEMORY[0x1E0D698E8];
  v22[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "subjects:sendEvent:", v20, v4);

  -[PKDataReleaseContentViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
  if (-[UITableView isScrollEnabled](self->_tableViewReleaseData, "isScrollEnabled"))
    -[UITableView flashScrollIndicators](self->_tableViewReleaseData, "flashScrollIndicators");
  -[PKDataReleaseContentViewController setIdleTimerDisabled:](self, "setIdleTimerDisabled:", 1);
  if (!self->_hasPlayedHaptics)
  {
    AudioServicesPlaySystemSound(0x487u);
    self->_hasPlayedHaptics = 1;
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint64_t v9;
  const __CFString *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PKDataReleaseContentViewController;
  -[PKDataReleaseContentViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  -[PKDataReleaseContentViewController setIdleTimerDisabled:](self, "setIdleTimerDisabled:", 0);
  if (-[PKPaymentAuthorizationFooterView state](self->_footerView, "state") != 12
    && -[PKPaymentAuthorizationFooterView state](self->_footerView, "state") != 13)
  {
    v4 = (void *)MEMORY[0x1E0D66A58];
    v5 = *MEMORY[0x1E0D69940];
    v11[0] = *MEMORY[0x1E0D698E8];
    v11[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D68A90];
    v10 = CFSTR("userCancelled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subjects:sendEvent:", v6, v7);

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  _BOOL8 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKDataReleaseContentViewController;
  -[PKDataReleaseContentViewController viewWillLayoutSubviews](&v9, sel_viewWillLayoutSubviews);
  ++self->_layoutRecursionCounter;
  -[PKDataReleaseContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKDataReleaseContentViewController _layoutWithBounds:](self, "_layoutWithBounds:");

  -[PKDataReleaseContentViewController _updateSeparators](self, "_updateSeparators");
  -[PKDataReleaseContentViewController _compactNavigationController](self, "_compactNavigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKDataReleaseContentViewController preferredContentSize](self, "preferredContentSize");
    objc_msgSend(v4, "childViewControllerPreferredContentSizeForSize:isRoot:", 1);
    v6 = v5;
    objc_msgSend(v4, "navigationControllerSizeForChildViewControllerPreferredContentSize:isRoot:", 1);
    objc_msgSend(v4, "childViewControllerSizeForNavigationControllerSize:");
    v8 = v6 - v7 >= PKUIPixelLength();
  }
  else
  {
    v8 = 1;
  }
  if (v8 != -[UITableView isScrollEnabled](self->_tableViewReleaseData, "isScrollEnabled"))
  {
    -[UITableView setScrollEnabled:](self->_tableViewReleaseData, "setScrollEnabled:", v8);
    -[PKDataReleaseContentViewController _updateSeparators](self, "_updateSeparators");
  }

}

- (void)viewDidLayoutSubviews
{
  int64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDataReleaseContentViewController;
  -[PKDataReleaseContentViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  v3 = self->_layoutRecursionCounter - 1;
  self->_layoutRecursionCounter = v3;
  if (!v3)
    -[PKDataReleaseContentViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)_startInitialEvaluation
{
  uint64_t v3;
  void *v4;
  int IsAvailable;
  __SecAccessControl *v6;
  LAContext *v7;
  LAContext *localAuthenticationContext;
  LAContext *v9;
  __SecAccessControl *accessControl;
  _QWORD v11[4];
  id v12;
  id location;

  -[PKISO18013DataReleaseRequest externalizedAuthenticationContext](self->_request, "externalizedAuthenticationContext");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3 && (v4 = (void *)v3, IsAvailable = PKUserIntentIsAvailable(), v4, IsAvailable))
  {
    v6 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFTypeRef)*MEMORY[0x1E0CD68B0], 0x40000000uLL, 0);
    SecAccessControlSetConstraints();
    self->_accessControl = v6;
    v7 = (LAContext *)objc_alloc_init(MEMORY[0x1E0CC12A0]);
    localAuthenticationContext = self->_localAuthenticationContext;
    self->_localAuthenticationContext = v7;

    -[LAContext setUiDelegate:](self->_localAuthenticationContext, "setUiDelegate:", self);
    objc_initWeak(&location, self);
    v9 = self->_localAuthenticationContext;
    accessControl = self->_accessControl;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__PKDataReleaseContentViewController__startInitialEvaluation__block_invoke;
    v11[3] = &unk_1E3E6EC58;
    objc_copyWeak(&v12, &location);
    -[LAContext evaluateAccessControl:operation:options:reply:](v9, "evaluateAccessControl:operation:options:reply:", accessControl, 3, 0, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PKDataReleaseContentViewController _startEvaluationWithExternalizedContext:](self, "_startEvaluationWithExternalizedContext:", 0);
  }
}

void __61__PKDataReleaseContentViewController__startInitialEvaluation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_finishedRemovingDoublePressCredentialWithError:", v4);

}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v7;

  v7 = a5;
  if (a3 == 5)
    -[PKDataReleaseContentViewController _finishedRemovingDoublePressCredentialWithError:](self, "_finishedRemovingDoublePressCredentialWithError:", 0);
  (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA70], 0);

}

- (void)_finishedRemovingDoublePressCredentialWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__PKDataReleaseContentViewController__finishedRemovingDoublePressCredentialWithError___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __86__PKDataReleaseContentViewController__finishedRemovingDoublePressCredentialWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1168);
  if (!v2)
    return;
  objc_msgSend(v2, "invalidate");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1168);
  *(_QWORD *)(v3 + 1168) = 0;

  v5 = *(const void **)(*(_QWORD *)(a1 + 32) + 1176);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1176) = 0;
  }
  v6 = *(_QWORD *)(a1 + 40);
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)v13 = 138412290;
      *(_QWORD *)&v13[4] = v6;
      v9 = "Finished cleaning double press with error: %@";
      v10 = v7;
      v11 = 12;
LABEL_9:
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, v9, v13, v11);
    }
  }
  else if (v8)
  {
    *(_WORD *)v13 = 0;
    v9 = "Successfully finished cleaning double press";
    v10 = v7;
    v11 = 2;
    goto LABEL_9;
  }

  if (*(_QWORD *)(a1 + 40))
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "externalizedAuthenticationContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setExternalizedAuthenticationContext:", 0, *(_OWORD *)v13);
  objc_msgSend(*(id *)(a1 + 32), "_startEvaluationWithExternalizedContext:", v12);

}

- (void)_startEvaluationWithExternalizedContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  PKAuthenticator *authenticator;
  _QWORD v13[4];
  id v14[2];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_authenticating = 1;
  self->_isInBioLockout = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6BFE0]), "initWithPolicy:", 9);
  objc_msgSend(v5, "setExternalizedContext:", v4);
  PKLocalizedIdentityString(CFSTR("PRESENTMENT_FOOTER_PASSCODE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPasscodeTitle:", v6);

  -[PKISO18013DataReleaseRequest authenticationACL](self->_request, "authenticationACL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "No custom ACL provided for data release", buf, 2u);
    }
    goto LABEL_12;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Using custom ACL for data release", buf, 2u);
  }

  v14[1] = 0;
  v10 = SecAccessControlCreateFromData();
  v11 = v10;
  if (!v10)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = 0;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Could not create access control ref from provided data with error %@", buf, 0xCu);
    }
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v5, "setAccessControlRef:", v10);
  if ((objc_msgSend(MEMORY[0x1E0D6BFD8], "currentStateForAccessControl:", v11) & 6) == 0)
    -[PKPaymentAuthorizationFooterView setPreventBiometricStateFallbacks:](self->_footerView, "setPreventBiometricStateFallbacks:", 1);
LABEL_13:
  objc_initWeak((id *)buf, self);
  authenticator = self->_authenticator;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__PKDataReleaseContentViewController__startEvaluationWithExternalizedContext___block_invoke;
  v13[3] = &unk_1E3E75788;
  objc_copyWeak(v14, (id *)buf);
  -[PKAuthenticator evaluateRequest:withCompletion:](authenticator, "evaluateRequest:withCompletion:", v5, v13);
  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);

}

void __78__PKDataReleaseContentViewController__startEvaluationWithExternalizedContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__PKDataReleaseContentViewController__startEvaluationWithExternalizedContext___block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __78__PKDataReleaseContentViewController__startEvaluationWithExternalizedContext___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[2];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[2];
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[2];
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[2];
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[3];

  v60[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1136) = 0;
    switch(objc_msgSend(*(id *)(a1 + 32), "result"))
    {
      case 0:
        PKLogFacilityTypeGetObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Authentication successful.", buf, 2u);
        }

        v12 = (void *)MEMORY[0x1E0D66A58];
        v13 = *MEMORY[0x1E0D69940];
        v60[0] = *MEMORY[0x1E0D698E8];
        v60[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = *MEMORY[0x1E0D68AA0];
        v59 = *MEMORY[0x1E0D68AF8];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "subjects:sendEvent:", v14, v15);

        if ((objc_msgSend(*(id *)(a1 + 32), "biometricMatch") & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0D6BFF0], "invokeSuccessFeedback");
          if (PKSystemApertureIsAvailable())
            v16 = 10;
          else
            v16 = 8;
          objc_msgSend(v3[126], "setState:", v16);
        }
        objc_msgSend(v3[126], "setState:", 11);
        v37 = objc_loadWeakRetained(v3 + 123);
        objc_msgSend(*(id *)(a1 + 32), "credential");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "dataReleaseContentViewController:didAuthorizeWithExternalAuthorizationData:dataToRelease:", v3, v38, v3[137]);

        break;
      case 1:
        PKLogFacilityTypeGetObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "Authentication canceled by user.", buf, 2u);
        }

        v18 = (void *)MEMORY[0x1E0D66A58];
        v19 = *MEMORY[0x1E0D69940];
        v57[0] = *MEMORY[0x1E0D698E8];
        v57[1] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = *MEMORY[0x1E0D68AA0];
        v56 = *MEMORY[0x1E0D68AD8];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "subjects:sendEvent:", v20, v21);

        objc_msgSend(v3, "_startEvaluationWithExternalizedContext:", 0);
        break;
      case 2:
      case 3:
        PKLogFacilityTypeGetObject();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Authentication canceled by app.", buf, 2u);
        }

        v5 = (void *)MEMORY[0x1E0D66A58];
        v6 = *MEMORY[0x1E0D69940];
        v54[0] = *MEMORY[0x1E0D698E8];
        v54[1] = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = *MEMORY[0x1E0D68AA0];
        v53 = *MEMORY[0x1E0D68AD0];
        v8 = (void *)MEMORY[0x1E0C99D80];
        v9 = &v53;
        v10 = &v52;
        goto LABEL_27;
      case 4:
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
          v46 = v23;
          v47 = 2048;
          v48 = v24;
          _os_log_impl(&dword_19D178000, v25, OS_LOG_TYPE_DEFAULT, "Authentication by %@[%ld] preempted by another process.", buf, 0x16u);
        }

        v26 = (void *)MEMORY[0x1E0D66A58];
        v27 = *MEMORY[0x1E0D69940];
        v44[0] = *MEMORY[0x1E0D698E8];
        v44[1] = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = *MEMORY[0x1E0D68AA0];
        v43 = *MEMORY[0x1E0D68AF0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "subjects:sendEvent:", v28, v29);

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKDataReleaseErrorDomain"), 1, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "dataReleaseCompletedWithError:", v30);

        goto LABEL_28;
      case 5:
        PKLogFacilityTypeGetObject();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v31, OS_LOG_TYPE_DEFAULT, "Failed to authenticate", buf, 2u);
        }

        v5 = (void *)MEMORY[0x1E0D66A58];
        v32 = *MEMORY[0x1E0D69940];
        v41[0] = *MEMORY[0x1E0D698E8];
        v41[1] = v32;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = *MEMORY[0x1E0D68AA0];
        v40 = *MEMORY[0x1E0D68AE0];
        v8 = (void *)MEMORY[0x1E0C99D80];
        v9 = &v40;
        v10 = &v39;
        goto LABEL_27;
      case 6:
        PKLogFacilityTypeGetObject();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v33, OS_LOG_TYPE_DEFAULT, "Authentication biolockout occured, prompting for passcode", buf, 2u);
        }

        objc_msgSend(v3[126], "setState:", 4);
        *((_BYTE *)v3 + 1138) = 1;
        objc_msgSend(v3, "_updatePhysicalButtonState");
        if (*((_BYTE *)v3 + 1137))
        {
          *((_BYTE *)v3 + 1137) = 0;
          objc_msgSend(v3, "presentPasscodeToExitLockout");
        }
        break;
      case 7:
        PKLogFacilityTypeGetObject();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v34, OS_LOG_TYPE_DEFAULT, "Authentication selected fallback - this is not supported", buf, 2u);
        }

        v5 = (void *)MEMORY[0x1E0D66A58];
        v35 = *MEMORY[0x1E0D69940];
        v51[0] = *MEMORY[0x1E0D698E8];
        v51[1] = v35;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = *MEMORY[0x1E0D68AA0];
        v50 = *MEMORY[0x1E0D68AD0];
        v8 = (void *)MEMORY[0x1E0C99D80];
        v9 = &v50;
        v10 = &v49;
LABEL_27:
        objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1, v39, v40);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "subjects:sendEvent:", v7, v36);

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKDataReleaseErrorDomain"), 1, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "dataReleaseCompletedWithError:", v22);
LABEL_28:

        break;
      default:
        break;
    }
  }

}

- (BOOL)shouldShowPhysicalButton
{
  if (self->_isInBioLockout || objc_msgSend(MEMORY[0x1E0D6BFD8], "userIntentStyle") != 1)
    return 0;
  if (-[PKAuthenticator evaluationState](self->_authenticator, "evaluationState") == 3)
    return 1;
  return -[PKPaymentAuthorizationFooterView state](self->_footerView, "state") == 3;
}

- (void)_updatePhysicalButtonState
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "dataReleaseContentViewControllerDidChangePhysicalButtonState:", self);
    WeakRetained = v4;
  }

}

- (id)_compactNavigationController
{
  void *v2;
  void *v3;

  -[PKDataReleaseContentViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pkui_compactNavigationContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updatePreferredContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (!self->_layoutRecursionCounter)
  {
    self->_isTemplateLayout = 1;
    -[PKDataReleaseContentViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    -[PKDataReleaseContentViewController _layoutWithBounds:](self, "_layoutWithBounds:");
    v5 = v4;
    v7 = v6;

    self->_isTemplateLayout = 0;
    -[PKDataReleaseContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5, v7);
  }
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect remainder;
  CGRect slice;
  CGSize result;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PKDataReleaseHeader sizeThatFits:](self->_header, "sizeThatFits:", a3.size.width, 1.79769313e308);
  v9 = v8;
  -[UITableView sizeThatFits:](self->_tableViewReleaseData, "sizeThatFits:", width, 1.79769313e308);
  v11 = v10;
  -[PKPaymentAuthorizationFooterView systemLayoutSizeFittingSize:](self->_footerView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v13 = v12;
  v14 = PKUIPixelLength();
  if (!self->_isTemplateLayout)
  {
    v23 = v11;
    remainder.origin.x = x;
    memset(&slice, 0, sizeof(slice));
    remainder.origin.y = y;
    remainder.size.width = width;
    remainder.size.height = height;
    -[UITableView setFrame:](self->_tableViewReleaseData, "setFrame:", x, y, width, height);
    -[PKDataReleaseContentViewController _compactNavigationController](self, "_compactNavigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "safeAreaInsets");
    v18 = v17;

    if (v18 > 0.0)
    {
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      CGRectDivide(v27, &slice, &remainder, v18, CGRectMaxYEdge);
    }
    v19 = v9 + PKUIPixelLength();
    CGRectDivide(remainder, &slice, &remainder, v19, CGRectMinYEdge);
    -[PKDataReleaseHeader setFrame:](self->_header, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    CGRectDivide(remainder, &slice, &remainder, v13, CGRectMaxYEdge);
    -[PKPaymentAuthorizationFooterView setFrame:](self->_footerView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[UIVisualEffectView setFrame:](self->_footerMaterial, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, v18 + slice.size.height);
    v20 = PKUIPixelLength();
    CGRectDivide(remainder, &slice, &remainder, v20, CGRectMaxYEdge);
    -[UIView setFrame:](self->_bottomSeparator, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[UITableView setContentInset:](self->_tableViewReleaseData, "setContentInset:", v9, 0.0, v13, 0.0);
    -[UITableView setVerticalScrollIndicatorInsets:](self->_tableViewReleaseData, "setVerticalScrollIndicatorInsets:", v9, 0.0, v13, 0.0);
    v11 = v23;
  }
  v21 = v9 + 0.0 + v11 + v13 + v14 * 2.0;
  v22 = width;
  result.height = v21;
  result.width = v22;
  return result;
}

- (void)dataReleaseCompletedWithError:(id)a3
{
  id v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  PKPaymentAuthorizationFooterView *footerView;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  if (v4)
    v5 = 13;
  else
    v5 = 12;
  objc_msgSend(v4, "domain");
  v6 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("PKDataReleaseErrorDomain");
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

LABEL_13:
      v10 = 0;
      v11 = CFSTR("other");
      goto LABEL_14;
    }
    v9 = -[__CFString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v9)
      goto LABEL_13;
  }
  switch(objc_msgSend(v4, "code"))
  {
    case 1:
      PKLocalizedIdentityString(CFSTR("PRESENTMENT_FOOTER_AUTHENTICATION_FAILED"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("authenticationFailed");
      break;
    case 2:
      v10 = 0;
      v11 = CFSTR("userCancelled");
      break;
    case 3:
      PKLocalizedIdentityString(CFSTR("PRESENTMENT_FOOTER_CONNECTION_FAILED"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("transactionFailed");
      break;
    case 4:
      PKLocalizedIdentityString(CFSTR("PRESENTMENT_FOOTER_CONNECTION_FAILED"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("sessionFailed");
      break;
    default:
      goto LABEL_13;
  }
LABEL_14:
  v12 = (void *)MEMORY[0x1E0D66A58];
  v13 = *MEMORY[0x1E0D69940];
  v28[0] = *MEMORY[0x1E0D698E8];
  v28[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR("failure");
  if (!v4)
    v15 = CFSTR("success");
  v16 = *MEMORY[0x1E0D68BC0];
  v17 = *MEMORY[0x1E0D690B8];
  v26[0] = *MEMORY[0x1E0D68AA0];
  v26[1] = v17;
  v27[0] = v16;
  v27[1] = v15;
  v18 = *MEMORY[0x1E0D68A90];
  v26[2] = *MEMORY[0x1E0D68F50];
  v26[3] = v18;
  v27[2] = v17;
  v27[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subjects:sendEvent:", v14, v19);

  footerView = self->_footerView;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __68__PKDataReleaseContentViewController_dataReleaseCompletedWithError___block_invoke;
  v22[3] = &unk_1E3E62FA0;
  objc_copyWeak(&v24, &location);
  v21 = v4;
  v23 = v21;
  -[PKPaymentAuthorizationFooterView setState:string:animated:withCompletion:](footerView, "setState:string:animated:withCompletion:", v5, v10, 1, v22);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __68__PKDataReleaseContentViewController_dataReleaseCompletedWithError___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = dispatch_time(0, 500000000);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__PKDataReleaseContentViewController_dataReleaseCompletedWithError___block_invoke_2;
  v3[3] = &unk_1E3E61B68;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], v3);

  objc_destroyWeak(&v5);
}

void __68__PKDataReleaseContentViewController_dataReleaseCompletedWithError___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 123);
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "dataReleaseContentViewController:didFinishWithError:", v4, *(_QWORD *)(a1 + 32));
    else
      objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

    WeakRetained = v4;
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_configureFooterViewConfirmationTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  const void *v6;
  uint64_t v7;

  if (self->_footerView)
  {
    PKLocalizedIdentityString(CFSTR("PRESENTMENT_FOOTER_PASSCODE"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKISO18013DataReleaseRequest authenticationACL](self->_request, "authenticationACL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = SecAccessControlCreateFromData();
      if (v5)
      {
        v6 = (const void *)v5;
        if ((objc_msgSend(MEMORY[0x1E0D6BFD8], "currentStateForAccessControl:", v5) & 8) != 0)
        {
          PKLocalizedIdentityString(CFSTR("PRESENTMENT_FOOTER_CONFIRM_WITH_PASSCODE"));
          v7 = objc_claimAutoreleasedReturnValue();

          v3 = (void *)v7;
        }
        CFRelease(v6);
      }
    }
    -[PKPaymentAuthorizationFooterView setConfirmationTitle:](self->_footerView, "setConfirmationTitle:", v3);

  }
}

- (void)_updateDataReleaseConfiguration
{
  void *v3;
  UIImage *merchantIcon;
  UIImage *v5;
  double v6;
  UIImage *v7;
  _TtC9PassKitUI34PKIdentityDataReleaseConfiguration *v8;
  void *v9;
  void *v10;
  void *v11;
  UIImage *v12;
  _TtC9PassKitUI34PKIdentityDataReleaseConfiguration *v13;
  _TtC9PassKitUI34PKIdentityDataReleaseConfiguration *dataReleaseConfiguration;
  id v15;

  if (PKIdentityPresentmentV2Enabled())
  {
    -[PKMerchant displayName](self->_merchant, "displayName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
      -[PKMerchant displayName](self->_merchant, "displayName");
    else
      -[PKISO18013DataReleaseRequest organizationName](self->_request, "organizationName");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    merchantIcon = self->_merchantIcon;
    if (merchantIcon)
    {
      v5 = merchantIcon;
    }
    else
    {
      v6 = PKUIScreenScale();
      PKIconForMerchant(0, 0, 0, 0, 54.0, 54.0, v6);
      v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v5;
    v8 = [_TtC9PassKitUI34PKIdentityDataReleaseConfiguration alloc];
    -[PKISO18013DataReleaseRequest documentType](self->_request, "documentType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKISO18013DataReleaseRequest dataElements](self->_request, "dataElements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "elements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_retainAutorelease(v7);
    v13 = -[PKIdentityDataReleaseConfiguration initWithDocumentType:elements:relyingPartyName:relyingPartyLogo:](v8, "initWithDocumentType:elements:relyingPartyName:relyingPartyLogo:", v9, v11, v15, -[UIImage CGImage](v12, "CGImage"));
    dataReleaseConfiguration = self->_dataReleaseConfiguration;
    self->_dataReleaseConfiguration = v13;

  }
}

- (void)_updateSeparators
{
  double v3;
  double v4;
  double v5;
  double v6;
  PKDataReleaseHeader *header;
  double v8;
  double v9;
  UIView *bottomSeparator;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  if (!-[UITableView isScrollEnabled](self->_tableViewReleaseData, "isScrollEnabled"))
  {
    v9 = 0.0;
    -[PKDataReleaseHeader setBackgroundViewAlpha:](self->_header, "setBackgroundViewAlpha:", 0.0);
    bottomSeparator = self->_bottomSeparator;
    goto LABEL_15;
  }
  -[UITableView layoutIfNeeded](self->_tableViewReleaseData, "layoutIfNeeded");
  -[UITableView contentOffset](self->_tableViewReleaseData, "contentOffset");
  v4 = v3;
  -[UITableView pkui_naturalRestingBounds](self->_tableViewReleaseData, "pkui_naturalRestingBounds");
  v6 = v4 - v5;
  if (v4 - v5 > 4.0 || v6 <= 0.0)
  {
    header = self->_header;
    if (v6 <= 4.0)
      v8 = 0.0;
    else
      v8 = 1.0;
  }
  else
  {
    header = self->_header;
    v8 = v6 * 0.25;
  }
  -[PKDataReleaseHeader setBackgroundViewAlpha:](header, "setBackgroundViewAlpha:", v8);
  -[UITableView bounds](self->_tableViewReleaseData, "bounds");
  v12 = v11;
  -[UITableView adjustedContentInset](self->_tableViewReleaseData, "adjustedContentInset");
  v14 = v12 - v13;
  -[UITableView adjustedContentInset](self->_tableViewReleaseData, "adjustedContentInset");
  v16 = v14 - v15;
  -[UITableView contentSize](self->_tableViewReleaseData, "contentSize");
  v18 = v17 - v6 - v16;
  bottomSeparator = self->_bottomSeparator;
  if (v18 > 4.0 || v18 <= 0.0)
  {
    if (v18 > 4.0)
    {
      v9 = 1.0;
      v19 = 1.0;
      goto LABEL_16;
    }
    v9 = 0.0;
LABEL_15:
    v19 = 0.0;
    goto LABEL_16;
  }
  v9 = v18 * 0.25;
  v19 = v18 * 0.25;
LABEL_16:
  -[UIView setAlpha:](bottomSeparator, "setAlpha:", v19);
  -[UIVisualEffectView setAlpha:](self->_footerMaterial, "setAlpha:", v9);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  if (PKIdentityPresentmentV2Enabled())
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("dataReleaseElementsCellIdentifier"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setDataReleaseConfiguration:", self->_dataReleaseConfiguration);
  }
  else
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("requestedDataCellIdentifier"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKMerchant displayName](self->_merchant, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "length"))
    {
      -[PKISO18013DataReleaseRequest organizationName](self->_request, "organizationName");
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    if (-[NSArray count](self->_intentRetainElements, "count"))
    {
      if (objc_msgSend(v9, "length"))
        PKLocalizedIdentityString(CFSTR("PRESENTMENT_DATA_INTENT_RETAIN"), CFSTR("%@"), v9);
      else
        PKLocalizedIdentityString(CFSTR("PRESENTMENT_DATA_INTENT_RETAIN_NO_NAME"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    if (-[NSArray count](self->_intentDoNotRetainElements, "count"))
    {
      if (objc_msgSend(v9, "length"))
        PKLocalizedIdentityString(CFSTR("PRESENTMENT_DATA_INTENT_WILL_NOT_RETAIN"), CFSTR("%@"), v9);
      else
        PKLocalizedIdentityString(CFSTR("PRESENTMENT_DATA_INTENT_WILL_NOT_RETAIN_NO_NAME"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    if (-[NSArray count](self->_intentDisplayOnlyElements, "count"))
    {
      if (objc_msgSend(v9, "length"))
        PKLocalizedIdentityString(CFSTR("PRESENTMENT_DATA_INTENT_DISPLAY_ONLY"), CFSTR("%@"), v9);
      else
        PKLocalizedIdentityString(CFSTR("PRESENTMENT_DATA_INTENT_DISPLAY_ONLY_NO_NAME"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    PKLocalizedIdentityString(CFSTR("PRESENTMENT_DATA_REQUESTED"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v14);

    objc_msgSend(v8, "setIntentRetainElements:", self->_intentRetainElements);
    objc_msgSend(v8, "setIntentRetainTitle:", v11);
    objc_msgSend(v8, "setIntentDoNotRetainElements:", self->_intentDoNotRetainElements);
    objc_msgSend(v8, "setIntentDoNotRetainTitle:", v12);
    objc_msgSend(v8, "setIntentDisplayOnlyElements:", self->_intentDisplayOnlyElements);
    objc_msgSend(v8, "setIntentDisplayOnlyTitle:", v13);

  }
  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  if ((PKIdentityPresentmentV2Enabled() & 1) == 0)
  {
    -[PKISO18013DataReleaseRequest rpIdentifier](self->_request, "rpIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_6;
    -[PKISO18013DataReleaseRequest organizationName](self->_request, "organizationName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      objc_msgSend(v5, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("merchantCellIdentifier"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDataReleaseContentViewController _updateMerchantHeaderView:animated:](self, "_updateMerchantHeaderView:animated:", v6, 0);
      goto LABEL_6;
    }
  }
  v6 = 0;
LABEL_6:

  return v6;
}

- (BOOL)tableView:(id)a3 wantsHeaderForSection:(int64_t)a4
{
  return PKIdentityPresentmentV2Enabled() ^ 1;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)_reloadMerchantHeader
{
  UITableView *tableViewReleaseData;
  _QWORD v4[5];
  _QWORD v5[5];

  -[PKDataReleaseContentViewController _updateDataReleaseConfiguration](self, "_updateDataReleaseConfiguration");
  tableViewReleaseData = self->_tableViewReleaseData;
  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PKDataReleaseContentViewController__reloadMerchantHeader__block_invoke;
  v5[3] = &unk_1E3E612E8;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__PKDataReleaseContentViewController__reloadMerchantHeader__block_invoke_2;
  v4[3] = &unk_1E3E62288;
  -[UITableView performBatchUpdates:completion:](tableViewReleaseData, "performBatchUpdates:completion:", v5, v4);
}

void __59__PKDataReleaseContentViewController__reloadMerchantHeader__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 992);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadSections:withRowAnimation:", v2, 0);

}

uint64_t __59__PKDataReleaseContentViewController__reloadMerchantHeader__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePreferredContentSize");
}

- (void)_updateMerchantHeaderView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  PKMerchant *merchant;
  id v7;
  uint64_t v8;
  UIImage *v9;
  double v10;
  id v11;

  v4 = a4;
  merchant = self->_merchant;
  v7 = a3;
  -[PKMerchant displayName](merchant, "displayName");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "length"))
  {
    -[PKISO18013DataReleaseRequest organizationName](self->_request, "organizationName");
    v8 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v8;
  }
  v9 = self->_merchantIcon;
  if (!v9)
  {
    v10 = PKUIScreenScale();
    PKIconForMerchant(0, 0, 0, 0, 54.0, 54.0, v10);
    v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setTitle:", v11);
  objc_msgSend(v7, "setImage:animated:", v9, v4);

}

- (void)presentPasscodeToExitLockout
{
  void *v3;
  void *v4;
  PKAuthenticator *authenticator;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6BFE0]), "initWithPolicy:", 1);
  objc_msgSend(v3, "setPasscodeOnly:", 1);
  PKLocalizedIdentityString(CFSTR("PRESENTMENT_FOOTER_PASSCODE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPasscodeTitle:", v4);

  authenticator = self->_authenticator;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PKDataReleaseContentViewController_presentPasscodeToExitLockout__block_invoke;
  v6[3] = &unk_1E3E75788;
  objc_copyWeak(&v7, &location);
  -[PKAuthenticator evaluateRequest:withCompletion:](authenticator, "evaluateRequest:withCompletion:", v3, v6);
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
}

void __66__PKDataReleaseContentViewController_presentPasscodeToExitLockout__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__PKDataReleaseContentViewController_presentPasscodeToExitLockout__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __66__PKDataReleaseContentViewController_presentPasscodeToExitLockout__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (objc_msgSend(*(id *)(a1 + 32), "result"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKDataReleaseErrorDomain"), 1, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dataReleaseCompletedWithError:", v3);

    }
    else
    {
      objc_msgSend(v4, "_startEvaluationWithExternalizedContext:", 0);
    }
    WeakRetained = v4;
  }

}

- (void)dataReleaseHeaderDidTapDismiss
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D66A58];
  v4 = *MEMORY[0x1E0D69940];
  v14[0] = *MEMORY[0x1E0D698E8];
  v14[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D68B18];
  v7 = *MEMORY[0x1E0D68858];
  v12[0] = *MEMORY[0x1E0D68AA0];
  v12[1] = v7;
  v8 = *MEMORY[0x1E0D68A60];
  v13[0] = v6;
  v13[1] = v8;
  v12[2] = *MEMORY[0x1E0D68F50];
  v13[2] = *MEMORY[0x1E0D68950];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subjects:sendEvent:", v5, v9);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKDataReleaseErrorDomain"), 2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "dataReleaseContentViewController:didFinishWithError:", self, v11);

  }
}

- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v7;
  BOOL *p_lastFailureWasUnboundBiometric;
  _BOOL4 lastFailureWasUnboundBiometric;
  _BOOL4 v10;
  BOOL *p_hasFailedBiometrics;
  unint64_t v12;
  int IsAvailable;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  PKPaymentAuthorizationFooterView *footerView;
  _QWORD v19[4];
  id v20[2];
  id location;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a3;
  p_lastFailureWasUnboundBiometric = &self->_lastFailureWasUnboundBiometric;
  lastFailureWasUnboundBiometric = self->_lastFailureWasUnboundBiometric;
  v10 = lastFailureWasUnboundBiometric;
  if (var0 == 2)
  {
    v10 = 0;
    *p_lastFailureWasUnboundBiometric = 0;
  }
  p_hasFailedBiometrics = &self->_lastFailureWasUnboundBiometric;
  if (var1 == 2)
    goto LABEL_14;
  if (var1 == 1 && !v10)
  {
    *p_lastFailureWasUnboundBiometric = 0;
    p_hasFailedBiometrics = &self->_hasFailedBiometrics;
LABEL_14:
    *p_hasFailedBiometrics = 1;
    if (PKPearlIsAvailable())
    {
      PKLocalizedPearlString(CFSTR("GENERIC_PEARL_FAILURE"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AudioServicesPlaySystemSound(0x573u);
      v12 = 13;
    }
    else
    {
      v15 = 0;
      v12 = 9;
    }
    goto LABEL_17;
  }
  v12 = PKPaymentProgressStateBaseStateForAuthenticatorEvaluationState(var0, -[PKPaymentAuthorizationFooterView state](self->_footerView, "state"), 0, 0);
  IsAvailable = PKSystemApertureIsAvailable();
  v14 = 10;
  if (((0x1E5u >> v12) & 1) == 0)
    v14 = v12;
  if (v12 > 8)
    v14 = v12;
  v15 = 0;
  if (IsAvailable)
    v12 = v14;
LABEL_17:
  if ((PKPearlIsAvailable() & 1) == 0 && *p_lastFailureWasUnboundBiometric)
  {
    if (lastFailureWasUnboundBiometric)
      v16 = CFSTR("PRESENTMENT_FOOTER_CONFIRM_TOUCHID_IDENTITY_FINGERPRINT");
    else
      v16 = CFSTR("PRESENTMENT_FOOTER_TOUCHID_WRONG_FINGERPRINT");
    PKLocalizedIdentityString(&v16->isa);
    v17 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v17;
  }
  objc_initWeak(&location, self);
  footerView = self->_footerView;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __92__PKDataReleaseContentViewController_authenticator_didTransitionToEvaluationStateWithEvent___block_invoke;
  v19[3] = &unk_1E3E757B0;
  objc_copyWeak(v20, &location);
  v20[1] = (id)v12;
  -[PKPaymentAuthorizationFooterView setState:string:animated:withCompletion:](footerView, "setState:string:animated:withCompletion:", v12, v15, 1, v19);
  -[PKDataReleaseContentViewController _updatePhysicalButtonState](self, "_updatePhysicalButtonState");
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

}

void __92__PKDataReleaseContentViewController_authenticator_didTransitionToEvaluationStateWithEvent___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(_QWORD *)(a1 + 40) == 13)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[126], "setState:string:animated:", 3, 0, 1);
    objc_msgSend(v3, "_updatePhysicalButtonState");
    WeakRetained = v3;
  }

}

- (void)authorizationFooterViewPasscodeButtonPressed:(id)a3
{
  if (self->_authenticating)
    -[PKAuthenticator fallbackToSystemPasscodeUI](self->_authenticator, "fallbackToSystemPasscodeUI", a3);
  else
    -[PKDataReleaseContentViewController presentPasscodeToExitLockout](self, "presentPasscodeToExitLockout", a3);
}

- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t);
  id WeakRetained;
  _QWORD v10[4];
  void (**v11)(id, uint64_t);

  v7 = a3;
  v8 = (void (**)(id, uint64_t))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeViewController);

  if (WeakRetained)
  {
    if (v8)
      v8[2](v8, 1);
  }
  else
  {
    objc_storeWeak((id *)&self->_passcodeViewController, v7);
    objc_msgSend(v7, "setModalPresentationStyle:", 5);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __92__PKDataReleaseContentViewController_presentPasscodeViewController_completionHandler_reply___block_invoke;
    v10[3] = &unk_1E3E61590;
    v11 = v8;
    -[PKDataReleaseContentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, v10);

  }
}

uint64_t __92__PKDataReleaseContentViewController_presentPasscodeViewController_completionHandler_reply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)dismissPasscodeViewController
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeViewController);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_idleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_merchantIcon, 0);
  objc_storeStrong((id *)&self->_entityResolver, 0);
  objc_storeStrong((id *)&self->_iconGenerator, 0);
  objc_storeStrong((id *)&self->_dataToRelease, 0);
  objc_storeStrong((id *)&self->_intentDisplayOnlyElements, 0);
  objc_storeStrong((id *)&self->_intentDoNotRetainElements, 0);
  objc_storeStrong((id *)&self->_intentRetainElements, 0);
  objc_destroyWeak((id *)&self->_passcodeViewController);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_bottomSeparator, 0);
  objc_storeStrong((id *)&self->_footerMaterial, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_tableViewReleaseData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataReleaseConfiguration, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
