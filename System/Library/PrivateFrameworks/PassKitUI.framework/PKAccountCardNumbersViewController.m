@implementation PKAccountCardNumbersViewController

- (PKAccountCardNumbersViewController)initWithPass:(id)a3 accountService:(id)a4 account:(id)a5 cardCredentials:(id)a6 virtualCard:(id)a7 physicalCard:(id)a8 context:(int64_t)a9
{
  id v16;
  id v17;
  PKAccountCardNumbersViewController *v18;
  PKAccountCardNumbersViewController *v19;
  PKVirtualCardCredentials **p_cardCredentials;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v16 = a3;
  v17 = a4;
  v27 = a5;
  v28 = a6;
  v29 = a7;
  v26 = a8;
  v30.receiver = self;
  v30.super_class = (Class)PKAccountCardNumbersViewController;
  v18 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v30, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 4);
  v19 = v18;
  if (v18)
  {
    p_cardCredentials = &v18->_cardCredentials;
    objc_storeStrong((id *)&v18->_cardCredentials, a6);
    objc_storeStrong((id *)&v19->_virtualCard, a7);
    objc_storeStrong((id *)&v19->_accountService, a4);
    objc_storeStrong((id *)&v19->_account, a5);
    objc_storeStrong((id *)&v19->_pass, a3);
    v19->_accountFeatureIdentifier = -[PKAccount feature](v19->_account, "feature");
    v19->_context = a9;
    objc_storeStrong((id *)&v19->_physicalCard, a8);
    v19->_redactSensitiveDetails = 0;
    if (v19->_virtualCard && objc_msgSend(v29, "state") == 1 && *p_cardCredentials)
    {
      v21 = (void *)objc_msgSend(v29, "copy");
      PKLocalizedFeatureString();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDisplayName:", v22);

      objc_msgSend(v21, "setKeychainCardCredentials:", v28);
      -[PKAccountService writeVirtualCardToKeychain:completion:](v19->_accountService, "writeVirtualCardToKeychain:completion:", v21, 0);

    }
    -[PKAccountCardNumbersViewController _setupNotifications](v19, "_setupNotifications", v17, v16);
    v17 = v24;
    v16 = v25;
  }

  return v19;
}

- (PKAccountCardNumbersViewController)initWithPass:(id)a3 accountService:(id)a4 account:(id)a5 physicalCard:(id)a6 context:(int64_t)a7
{
  return -[PKAccountCardNumbersViewController initWithPass:accountService:account:cardCredentials:virtualCard:physicalCard:context:](self, "initWithPass:accountService:account:cardCredentials:virtualCard:physicalCard:context:", a3, a4, a5, 0, 0, a6, a7);
}

- (PKAccountCardNumbersViewController)initWithPass:(id)a3 localAuthenticationContext:(id)a4 virtualCard:(id)a5 context:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  PKAccountCardNumbersViewController *v14;
  PKAccountCardNumbersViewController *v15;
  PKPaymentService *v16;
  PKPaymentService *paymentService;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKAccountCardNumbersViewController;
  v14 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v19, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 4);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_pass, a3);
    objc_storeStrong((id *)&v15->_virtualCard, a5);
    v15->_context = a6;
    v15->_accountFeatureIdentifier = objc_msgSend(v11, "associatedAccountFeatureIdentifier");
    v15->_redactSensitiveDetails = 0;
    v16 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E0D672B0]);
    paymentService = v15->_paymentService;
    v15->_paymentService = v16;

    objc_storeStrong((id *)&v15->_localAuthenticationContext, a4);
    -[PKAccountCardNumbersViewController _setupNotifications](v15, "_setupNotifications");
    -[PKAccountCardNumbersViewController _retrieveCardCredentials](v15, "_retrieveCardCredentials");
  }

  return v15;
}

- (void)_setupNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_applicationWillResignActive_, *MEMORY[0x1E0DC4868], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, *MEMORY[0x1E0DC4750], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_applicationWillDeactivate_, *MEMORY[0x1E0DC5760], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__willHideUIMenuController_, *MEMORY[0x1E0DC5048], 0);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKAccountCardNumbersViewController;
  -[PKSectionTableViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[PKAccountCardNumbersViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsSelection:", 1);
  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  -[PKAccountCardNumbersViewController _tableHeaderView](self, "_tableHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTableHeaderView:", v4);

  -[PKAccountCardNumbersViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  -[PKAccountCardNumbersViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D679E8]);

}

- (void)viewWillAppear:(BOOL)a3
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
  v9.super_class = (Class)PKAccountCardNumbersViewController;
  -[PKAccountCardNumbersViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  if (-[PKVirtualCard type](self->_virtualCard, "type") == 2)
  {
    -[PKAccountCardNumbersViewController _beginReportingIfNecessary](self, "_beginReportingIfNecessary");
    v4 = (void *)MEMORY[0x1E0D66A58];
    v5 = *MEMORY[0x1E0D69910];
    v6 = *MEMORY[0x1E0D68F50];
    v10[0] = *MEMORY[0x1E0D68AA0];
    v10[1] = v6;
    v7 = *MEMORY[0x1E0D68900];
    v11[0] = *MEMORY[0x1E0D68C50];
    v11[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subject:sendEvent:", v5, v8);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAccountCardNumbersViewController;
  -[PKAccountCardNumbersViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (-[PKVirtualCard type](self->_virtualCard, "type") == 2)
    -[PKAccountCardNumbersViewController _endReportingIfNecessary](self, "_endReportingIfNecessary");
}

- (void)_beginReportingIfNecessary
{
  uint64_t v3;
  void *v4;

  v3 = *MEMORY[0x1E0D69910];
  objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D69910]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    self->_didBeginPassManagementSubject = 1;
    objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v3);
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginPassManagementSubject)
  {
    self->_didBeginPassManagementSubject = 0;
    objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", *MEMORY[0x1E0D69910]);
  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKAccountCardNumbersViewController;
  -[PKAccountCardNumbersViewController viewWillLayoutSubviews](&v10, sel_viewWillLayoutSubviews);
  -[PKAccountCardNumbersViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "bounds");
    v6 = v5;
    objc_msgSend(v4, "frame");
    v8 = v7;
    objc_msgSend(v4, "sizeThatFits:", v6, 1.79769313e308);
    if (v8 != v9)
    {
      objc_msgSend(v3, "_rectForTableHeaderView");
      objc_msgSend(v4, "setFrame:");
      objc_msgSend(v3, "setTableHeaderView:", 0);
      objc_msgSend(v3, "setTableHeaderView:", v4);
    }
  }

}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;

  switch(a3)
  {
    case 0uLL:
      if (self->_loadingCredentials)
        return 1;
      objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = PKVirtualCardEnabledWithWebService()
        && -[PKVirtualCard type](self->_virtualCard, "type") == 2
        && self->_cardCredentials == 0;
      goto LABEL_18;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!PKVirtualCardEnabledWithWebService())
      {

        return -[PKAccount supportsShowVirtualCard](self->_account, "supportsShowVirtualCard");
      }
      v7 = -[PKVirtualCard type](self->_virtualCard, "type");

      if (v7 != 2)
        return -[PKAccount supportsShowVirtualCard](self->_account, "supportsShowVirtualCard");
      return self->_cardCredentials || self->_loadingCredentials;
    case 2uLL:
      return -[PKAccount supportsDynamicSecurityCodes](self->_account, "supportsDynamicSecurityCodes");
    case 3uLL:
      -[PKPaymentPass devicePaymentApplications](self->_pass, "devicePaymentApplications");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "count"))
        v5 = 1;
      else
        v5 = self->_physicalCard != 0;
LABEL_18:

      return v5;
    default:
      return 0;
  }
}

- (void)applicationDidBecomeActive:(id)a3
{
  -[PKAccountCardNumbersViewController setRedactSensitiveDetails:](self, "setRedactSensitiveDetails:", 0);
}

- (void)applicationWillResignActive:(id)a3
{
  -[PKAccountCardNumbersViewController setRedactSensitiveDetails:](self, "setRedactSensitiveDetails:", 1);
}

- (void)applicationDidEnterBackground:(id)a3
{
  -[PKAccountCardNumbersViewController setRedactSensitiveDetails:](self, "setRedactSensitiveDetails:", 1);
}

- (void)applicationWillDeactivate:(id)a3
{
  -[PKAccountCardNumbersViewController setRedactSensitiveDetails:](self, "setRedactSensitiveDetails:", 1);
}

- (void)setRedactSensitiveDetails:(BOOL)a3
{
  id v3;

  if (self->_redactSensitiveDetails != a3)
  {
    self->_redactSensitiveDetails = a3;
    -[PKAccountCardNumbersViewController tableView](self, "tableView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;

  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4))
  {
    case 0uLL:
    case 2uLL:
    case 3uLL:
      result = 1;
      break;
    case 1uLL:
      if (!self->_virtualCard)
        goto LABEL_5;
      result = -[PKAccountCardNumbersViewController _numberOfVirtualCardCredentialDetailsRowsEnabled](self, "_numberOfVirtualCardCredentialDetailsRowsEnabled");
      break;
    default:
LABEL_5:
      result = 0;
      break;
  }
  return result;
}

- (int64_t)_numberOfVirtualCardCredentialDetailsRowsEnabled
{
  uint64_t v3;
  int64_t v4;

  v3 = 0;
  v4 = 0;
  do
    v4 += -[PKAccountCardNumbersViewController _virtualCardCredentialDetailsRowIsEnabled:](self, "_virtualCardCredentialDetailsRowIsEnabled:", v3++);
  while (v3 != 6);
  return v4;
}

- (BOOL)_virtualCardCredentialDetailsRowIsEnabled:(unint64_t)a3
{
  BOOL v4;
  void *v5;
  uint64_t v6;
  PKVirtualCard *virtualCard;
  void *v8;
  PKVirtualCard *v9;
  PKVirtualCard *v10;
  void *v12;
  void *v13;

  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!PKVirtualCardEnabledWithWebService())
      {

        goto LABEL_19;
      }
      v6 = -[PKVirtualCard type](self->_virtualCard, "type");

      if (v6 != 2)
        goto LABEL_19;
      virtualCard = self->_virtualCard;
      if (!virtualCard)
        goto LABEL_21;
      -[PKVirtualCard cardholderName](virtualCard, "cardholderName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        v4 = !self->_loadingCredentials;
      else
        v4 = 0;

      return v4;
    case 1uLL:
    case 3uLL:
      if (!self->_cardCredentials && !self->_loadingReplacementCard)
        goto LABEL_21;
      return !self->_loadingCredentials;
    case 2uLL:
LABEL_19:
      v10 = self->_virtualCard;
      if (!v10 || self->_loadingCredentials)
        goto LABEL_21;
      -[PKVirtualCard expiration](v10, "expiration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v4 = 1;
      }
      else
      {
        -[PKVirtualCardCredentials expiration](self->_cardCredentials, "expiration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v13 != 0;

      }
      goto LABEL_32;
    case 4uLL:
      if (self->_cardCredentials || self->_loadingReplacementCard || self->_loadingCredentials)
        return 1;
      objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = PKVirtualCardEnabledWithWebService()
        && -[PKPaymentPass hasActiveVirtualCard](self->_pass, "hasActiveVirtualCard")
        && self->_cardCredentials == 0;
LABEL_32:

      return v4;
    case 5uLL:
      v9 = self->_virtualCard;
      if (!v9 || -[PKVirtualCard state](v9, "state") == 3 || self->_loadingCredentials)
        goto LABEL_21;
      v4 = self->_cardCredentials != 0;
      break;
    default:
LABEL_21:
      v4 = 0;
      break;
  }
  return v4;
}

- (unint64_t)_virtualCardCredentialDetailsRowForRowIndex:(int64_t)a3
{
  unint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  do
  {
    if (-[PKAccountCardNumbersViewController _virtualCardCredentialDetailsRowIsEnabled:](self, "_virtualCardCredentialDetailsRowIsEnabled:", v5))
    {
      if (v6 == a3)
        return v5;
      ++v6;
    }
    ++v5;
  }
  while (v5 != 6);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v7, "section")))
  {
    case 0uLL:
      -[PKAccountCardNumbersViewController _loadingCellForRowIndex:tableView:](self, "_loadingCellForRowIndex:tableView:", objc_msgSend(v7, "row"), v6);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      -[PKAccountCardNumbersViewController _cardCredentialsCellForRowIndex:tableView:](self, "_cardCredentialsCellForRowIndex:tableView:", objc_msgSend(v7, "row"), v6);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      -[PKAccountCardNumbersViewController _dynamicSecurityCodeCellForRowIndex:tableView:](self, "_dynamicSecurityCodeCellForRowIndex:tableView:", objc_msgSend(v7, "row"), v6);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3uLL:
      -[PKAccountCardNumbersViewController _otherNumbersCellForRowIndex:tableView:](self, "_otherNumbersCellForRowIndex:tableView:", objc_msgSend(v7, "row"), v6);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v9 = (void *)v8;
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  unint64_t v5;
  void *v6;
  char v7;
  void *v8;

  v5 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  if (v5 == 3)
  {
    -[PKAccountCardNumbersViewController _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("ACCOUNT_SERVICE_CARD_NUMBERS_OTHER_FOOTER"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    return v8;
  }
  if (v5 != 1)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKVirtualCardEnabledWithWebService())
  {
    v7 = -[PKPaymentPass hasActiveVirtualCard](self->_pass, "hasActiveVirtualCard");

    if ((v7 & 1) != 0)
    {
LABEL_5:
      v8 = 0;
      return v8;
    }
  }
  else
  {

  }
  if (self->_virtualCard)
    -[PKAccountCardNumbersViewController _virtualCardStateFooter](self, "_virtualCardStateFooter");
  else
    PKLocalizedFeatureString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id *v10;
  id v11;

  v5 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  if (v5 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!PKVirtualCardEnabledWithWebService())
    {
      v8 = 0;
      goto LABEL_13;
    }
    v9 = -[PKPaymentPass hasActiveVirtualCard](self->_pass, "hasActiveVirtualCard");

    if (v9)
    {
      PKLocalizedVirtualCardString(CFSTR("CARD_NUMBERS_DYNAMIC_CVC_FOOTER_LINK"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedVirtualCardString(CFSTR("CARD_NUMBERS_DYNAMIC_CVC_FOOTER"), CFSTR("%@"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_accountFeatureIdentifier == 1)
        v10 = (id *)MEMORY[0x1E0D69B50];
      else
        v10 = (id *)MEMORY[0x1E0D6BC88];
      v11 = *v10;
      -[PKAccountCardNumbersViewController _hyperlinkViewWithLinkText:footerText:urlString:](self, "_hyperlinkViewWithLinkText:footerText:urlString:", v6, v7, v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
  }
  else if (v5 == 2)
  {
    PKLocalizedFeatureString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountCardNumbersViewController _hyperlinkViewWithLinkText:footerText:urlString:](self, "_hyperlinkViewWithLinkText:footerText:urlString:", v6, v7, CFSTR("https://support.apple.com/ht212328?cid=mc-ols-applecard-article_h212328-wallet_ui-04242021"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

LABEL_13:
    return v8;
  }
  v8 = 0;
  return v8;
}

- (id)_hyperlinkViewWithLinkText:(id)a3 footerText:(id)a4 urlString:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKFooterHyperlinkView *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(PKFooterHyperlinkView);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PKAttributedStringByAddingLinkToSubstring(v9, v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFooterHyperlinkView setAttributedText:](v11, "setAttributedText:", v13);

  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__PKAccountCardNumbersViewController__hyperlinkViewWithLinkText_footerText_urlString___block_invoke;
  v15[3] = &unk_1E3E73920;
  objc_copyWeak(&v16, &location);
  -[PKFooterHyperlinkView setAction:](v11, "setAction:", v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

void __86__PKAccountCardNumbersViewController__hyperlinkViewWithLinkText_footerText_urlString___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[1185] = 1;
    objc_msgSend(WeakRetained, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadData");

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "openURL:options:completionHandler:", v7, MEMORY[0x1E0C9AA70], &__block_literal_global_180);

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  PKAccountOtherCardNumbersViewController *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  void *v20;
  unint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v7, "section"));
  if (v9 == 3)
  {
    if (!-[PKAccountCardNumbersViewController shouldMapSection:](self, "shouldMapSection:", 3))
      goto LABEL_19;
    v10 = -[PKAccountOtherCardNumbersViewController initWithPhysicalCard:paymentPass:account:context:preferDefaultTitle:]([PKAccountOtherCardNumbersViewController alloc], "initWithPhysicalCard:paymentPass:account:context:preferDefaultTitle:", self->_physicalCard, self->_pass, self->_account, self->_context, 0);
    -[PKAccountCardNumbersViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pushViewController:animated:", v10, 1);

    if (-[PKVirtualCard type](self->_virtualCard, "type") == 2)
    {
      v12 = (void *)MEMORY[0x1E0D66A58];
      v13 = *MEMORY[0x1E0D69910];
      v14 = *MEMORY[0x1E0D68B18];
      v15 = *MEMORY[0x1E0D68F50];
      v31[0] = *MEMORY[0x1E0D68AA0];
      v31[1] = v15;
      v16 = *MEMORY[0x1E0D68900];
      v32[0] = v14;
      v32[1] = v16;
      v31[2] = *MEMORY[0x1E0D68858];
      v32[2] = CFSTR("additionalCardInfo");
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = v32;
      v19 = v31;
LABEL_9:
      objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subject:sendEvent:", v13, v20);

    }
LABEL_10:

    goto LABEL_19;
  }
  if (v9 != 1)
  {
    if (!v9 && !self->_loadingCredentials)
      -[PKAccountCardNumbersViewController _retryCardCredentials](self, "_retryCardCredentials");
    goto LABEL_19;
  }
  v21 = -[PKAccountCardNumbersViewController _virtualCardCredentialDetailsRowForRowIndex:](self, "_virtualCardCredentialDetailsRowForRowIndex:", objc_msgSend(v7, "row"));
  if (!v8)
    goto LABEL_19;
  if (v21 >= 5)
  {
    if (v21 != 5)
      goto LABEL_19;
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
    if (!-[PKAccountCardNumbersViewController canReplaceCard](self, "canReplaceCard"))
      goto LABEL_19;
    -[PKAccountCardNumbersViewController _replaceCardAlertFromIndexPath:](self, "_replaceCardAlertFromIndexPath:", v7);
    v10 = (PKAccountOtherCardNumbersViewController *)objc_claimAutoreleasedReturnValue();
    -[PKAccountCardNumbersViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
    if (-[PKVirtualCard type](self->_virtualCard, "type") == 2)
    {
      v12 = (void *)MEMORY[0x1E0D66A58];
      v13 = *MEMORY[0x1E0D69910];
      v27 = *MEMORY[0x1E0D68B18];
      v28 = *MEMORY[0x1E0D68F50];
      v33[0] = *MEMORY[0x1E0D68AA0];
      v33[1] = v28;
      v29 = *MEMORY[0x1E0D68900];
      v34[0] = v27;
      v34[1] = v29;
      v33[2] = *MEMORY[0x1E0D68858];
      v34[2] = *MEMORY[0x1E0D69408];
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = v34;
      v19 = v33;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v22 = objc_alloc(MEMORY[0x1E0DC39E8]);
  PKLocalizedString(CFSTR("MENU_ACTION_COPY"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithTitle:action:", v23, sel__copyCardDetails);

  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMenuItems:", v26);

    objc_msgSend(v8, "frame");
    objc_msgSend(v25, "showMenuFromView:rect:", v6);

  }
LABEL_19:

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  BOOL v7;

  v5 = a4;
  v6 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v5, "section"));
  if (v6 == 3)
    goto LABEL_7;
  if (v6 == 1)
  {
    if (-[PKAccountCardNumbersViewController _virtualCardCredentialDetailsRowForRowIndex:](self, "_virtualCardCredentialDetailsRowForRowIndex:", objc_msgSend(v5, "row")) == 5)
    {
      v7 = -[PKAccountCardNumbersViewController canReplaceCard](self, "canReplaceCard");
      goto LABEL_9;
    }
LABEL_7:
    v7 = 1;
    goto LABEL_9;
  }
  if (v6)
    v7 = 0;
  else
    v7 = !self->_loadingCredentials;
LABEL_9:

  return v7;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)_willHideUIMenuController:(id)a3
{
  void *v3;
  id v4;

  -[PKAccountCardNumbersViewController tableView](self, "tableView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForSelectedRow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deselectRowAtIndexPath:animated:", v3, 1);

}

- (void)_copyCardDetails
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[PKAccountCardNumbersViewController tableView](self, "tableView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathForSelectedRow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForRowAtIndexPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  switch(-[PKAccountCardNumbersViewController _virtualCardCredentialDetailsRowForRowIndex:](self, "_virtualCardCredentialDetailsRowForRowIndex:", objc_msgSend(v3, "row")))
  {
    case 0uLL:
    case 3uLL:
    case 4uLL:
      objc_msgSend(v4, "detailText");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        goto LABEL_3;
      break;
    case 1uLL:
      objc_msgSend(v4, "detailText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E3E7D690);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      objc_msgSend(v4, "detailText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKShortExpiration();
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v5 = (void *)v8;

      if (v5)
      {
LABEL_3:
        objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setString:", v5);

      }
      break;
    default:
      break;
  }

}

- (id)_loadingCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  if (self->_loadingCredentials)
    v6 = CFSTR("CARD_NUMBERS_VIRTUAL_LOADING");
  else
    v6 = CFSTR("CARD_NUMBERS_VIRTUAL_UNAVAILABLE");
  PKLocalizedCardNumbersString(&v6->isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_loadingCredentials)
  {
    v8 = 0;
  }
  else
  {
    PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_VIRTUAL_TRY_AGAIN"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PKAccountCardNumbersViewController _credentialsCellWithPrimaryText:detailText:detailImage:forSection:forTableView:](self, "_credentialsCellWithPrimaryText:detailText:detailImage:forSection:forTableView:", v7, v8, 0, 0, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitleTextColor:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDetailTextColor:", v11);

  objc_msgSend(v9, "setShowsActionSpinner:", self->_loadingCredentials);
  return v9;
}

- (id)_cardCredentialsCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __CFString *v20;
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

  v6 = a4;
  switch(-[PKAccountCardNumbersViewController _virtualCardCredentialDetailsRowForRowIndex:](self, "_virtualCardCredentialDetailsRowForRowIndex:", a3))
  {
    case 0uLL:
      PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_VIRTUAL_CARDHOLDER_NAME_TITLE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKVirtualCard cardholderName](self->_virtualCard, "cardholderName");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[PKAccountCardNumbersViewController _credentialsCellWithPrimaryText:detailText:forTableView:](self, "_credentialsCellWithPrimaryText:detailText:forTableView:", v7, v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = (_QWORD *)MEMORY[0x1E0D679F0];
      goto LABEL_31;
    case 1uLL:
      PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_VIRTUAL_NUMBER_TITLE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!self->_redactSensitiveDetails)
      {
        -[PKVirtualCardCredentials primaryAccountNumber](self->_cardCredentials, "primaryAccountNumber");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:
        PKFormattedStringForPAN();
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      -[PKVirtualCard FPANSuffix](self->_virtualCard, "FPANSuffix");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        v14 = -[PKVirtualCard type](self->_virtualCard, "type");

        if (v14 != 2)
        {
          v26 = (void *)MEMORY[0x1E0CB3940];
          PKPANMask();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          PKPANMask();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          PKPANMask();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKVirtualCard FPANSuffix](self->_virtualCard, "FPANSuffix");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("%@%@%@%@"), v27, v28, v29, v30);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_28;
        }
      }
      -[PKVirtualCardCredentials primaryAccountNumber](self->_cardCredentials, "primaryAccountNumber");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        goto LABEL_30;
      -[PKVirtualCardCredentials primaryAccountNumber](self->_cardCredentials, "primaryAccountNumber");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PKFPANSuffixFromFPAN();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PKMaskedPaymentPAN();
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_29:
LABEL_30:
      -[PKAccountCardNumbersViewController _credentialsCellWithPrimaryText:detailText:forTableView:](self, "_credentialsCellWithPrimaryText:detailText:forTableView:", v7, v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = (_QWORD *)MEMORY[0x1E0D679E0];
LABEL_31:
      objc_msgSend(v9, "setAccessibilityIdentifier:", *v11);
LABEL_32:

      return v10;
    case 2uLL:
      PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_VIRTUAL_EXPIRATION_TITLE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKVirtualCard expiration](self->_virtualCard, "expiration");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!PKVirtualCardEnabledWithWebService())
        goto LABEL_12;
      v18 = -[PKPaymentPass hasActiveVirtualCard](self->_pass, "hasActiveVirtualCard");

      if (v18)
      {
        -[PKVirtualCardCredentials formattedExpiration](self->_cardCredentials, "formattedExpiration");
        v17 = v8;
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:

      }
      -[PKAccountCardNumbersViewController _credentialsCellWithPrimaryText:detailText:forTableView:](self, "_credentialsCellWithPrimaryText:detailText:forTableView:", v7, v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = (_QWORD *)MEMORY[0x1E0D67B88];
      goto LABEL_31;
    case 3uLL:
      PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_VIRTUAL_CARD_SECURITY_CODE_TITLE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_redactSensitiveDetails)
      {
        v19 = 0;
        v8 = CFSTR("•••");
      }
      else
      {
        -[PKVirtualCardCredentials cardSecurityCode](self->_cardCredentials, "cardSecurityCode");
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (-[PKVirtualCard hasDynamicSecurityCode](self->_virtualCard, "hasDynamicSecurityCode"))
        {
          v22 = (void *)MEMORY[0x1E0DC3888];
          objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "configurationWithFont:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("clock.arrow.2.circlepath"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "imageWithSymbolConfiguration:", v24);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v19 = 0;
        }
      }
      -[PKAccountCardNumbersViewController _credentialsCellWithPrimaryText:detailText:detailImage:forTableView:](self, "_credentialsCellWithPrimaryText:detailText:detailImage:forTableView:", v7, v8, v19, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAccessibilityIdentifier:", *MEMORY[0x1E0D679A0]);

      goto LABEL_32;
    case 4uLL:
      PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_VIRTUAL_PAYMENT_NETWORK_TITLE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[PKVirtualCardCredentials cardType](self->_cardCredentials, "cardType"))
        -[PKVirtualCard credentialType](self->_virtualCard, "credentialType");
      PKDisplayablePaymentNetworkNameForPaymentCredentialType();
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[PKAccountCardNumbersViewController _credentialsCellWithPrimaryText:detailText:forTableView:](self, "_credentialsCellWithPrimaryText:detailText:forTableView:", v7, v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = (_QWORD *)MEMORY[0x1E0D67D88];
      goto LABEL_31;
    case 5uLL:
      if (self->_loadingReplacementCard)
        v20 = CFSTR("CARD_NUMBERS_VIRTUAL_REPLACING_TITLE");
      else
        v20 = CFSTR("CARD_NUMBERS_VIRTUAL_REPLACE_TITLE");
      PKLocalizedCardNumbersString(&v20->isa);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountCardNumbersViewController _buttonCellForRowIndex:text:cellStyle:forTableView:](self, "_buttonCellForRowIndex:text:cellStyle:forTableView:", a3, v21, 0, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F70]);

      goto LABEL_23;
    default:
      v10 = 0;
LABEL_23:
      v8 = 0;
      v7 = 0;
      goto LABEL_32;
  }
}

- (id)_dynamicSecurityCodeCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v5;
  void *v6;
  PKSettingTableCell *v7;
  PKSettingTableCell *dynamicSecurityCodeCell;
  PKSettingTableCell *v9;
  void *v10;
  PKSettingTableCell *v11;
  PKSettingTableCell *v12;
  PKSettingTableCell *v13;

  v5 = a4;
  -[PKAccountCardNumbersViewController _reuseIdentifierForSection:](self, "_reuseIdentifierForSection:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", v6);
  v7 = (PKSettingTableCell *)objc_claimAutoreleasedReturnValue();

  dynamicSecurityCodeCell = self->_dynamicSecurityCodeCell;
  self->_dynamicSecurityCodeCell = v7;

  v9 = self->_dynamicSecurityCodeCell;
  if (!v9)
  {
    PKLocalizedFeatureString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKSettingTableCell initWithTitle:target:action:]([PKSettingTableCell alloc], "initWithTitle:target:action:", v10, self, sel__toggleDynamicSecurityCodeSetting);
    v12 = self->_dynamicSecurityCodeCell;
    self->_dynamicSecurityCodeCell = v11;

    v9 = self->_dynamicSecurityCodeCell;
  }
  -[PKSettingTableCell setOn:](v9, "setOn:", -[PKVirtualCard hasDynamicSecurityCode](self->_virtualCard, "hasDynamicSecurityCode"));
  -[PKSettingTableCell setAccessibilityIdentifier:](self->_dynamicSecurityCodeCell, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67B28]);
  v13 = self->_dynamicSecurityCodeCell;

  return v13;
}

- (id)_otherNumbersCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  PKStackedLabelCell *v8;

  v5 = a4;
  PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_OTHER_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountCardNumbersViewController _reuseIdentifierForSection:](self, "_reuseIdentifierForSection:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", v7);
  v8 = (PKStackedLabelCell *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    v8 = -[PKStackedLabelCell initWithReuseIdentifier:]([PKStackedLabelCell alloc], "initWithReuseIdentifier:", v7);
  -[PKStackedLabelCell setTitleText:](v8, "setTitleText:", v6);
  -[PKStackedLabelCell setAccessoryType:](v8, "setAccessoryType:", 1);
  -[PKStackedLabelCell setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67870]);

  return v8;
}

- (id)_credentialsCellWithPrimaryText:(id)a3 detailText:(id)a4 forTableView:(id)a5
{
  return -[PKAccountCardNumbersViewController _credentialsCellWithPrimaryText:detailText:detailImage:forTableView:](self, "_credentialsCellWithPrimaryText:detailText:detailImage:forTableView:", a3, a4, 0, a5);
}

- (id)_credentialsCellWithPrimaryText:(id)a3 detailText:(id)a4 detailImage:(id)a5 forTableView:(id)a6
{
  return -[PKAccountCardNumbersViewController _credentialsCellWithPrimaryText:detailText:detailImage:forSection:forTableView:](self, "_credentialsCellWithPrimaryText:detailText:detailImage:forSection:forTableView:", a3, a4, a5, 1, a6);
}

- (id)_credentialsCellWithPrimaryText:(id)a3 detailText:(id)a4 detailImage:(id)a5 forSection:(unint64_t)a6 forTableView:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  PKStackedLabelCell *v17;

  v12 = a3;
  v13 = a7;
  v14 = a5;
  v15 = a4;
  -[PKAccountCardNumbersViewController _reuseIdentifierForSection:](self, "_reuseIdentifierForSection:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dequeueReusableCellWithIdentifier:", v16);
  v17 = (PKStackedLabelCell *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    v17 = -[PKStackedLabelCell initWithReuseIdentifier:]([PKStackedLabelCell alloc], "initWithReuseIdentifier:", v16);
  -[PKStackedLabelCell setTitleText:](v17, "setTitleText:", v12);
  -[PKStackedLabelCell setDetailText:](v17, "setDetailText:", v15);

  -[PKStackedLabelCell setDetailImage:](v17, "setDetailImage:", v14);
  -[UIView pkui_setExcludedFromScreenCapture:andBroadcasting:](v17, "pkui_setExcludedFromScreenCapture:andBroadcasting:", self->_redactSensitiveDetails, 1);
  -[PKStackedLabelCell setAccessibilityIdentifier:](v17, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67A50]);

  return v17;
}

- (id)_buttonCellForRowIndex:(int64_t)a3 text:(id)a4 cellStyle:(int64_t)a5 forTableView:(id)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  PKTableViewCell *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = a6;
  v11 = a4;
  -[PKAccountCardNumbersViewController _reuseIdentifierForSection:](self, "_reuseIdentifierForSection:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@-%@"), v12, CFSTR("Button"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "dequeueReusableCellWithIdentifier:", v13);
  v14 = (PKTableViewCell *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v14 = -[PKTableViewCell initWithStyle:reuseIdentifier:]([PKTableViewCell alloc], "initWithStyle:reuseIdentifier:", a5, v13);
    -[PKTableViewCell setUserInteractionEnabled:](v14, "setUserInteractionEnabled:", 1);
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PKAccountCardNumbersViewController canReplaceCard](self, "canReplaceCard"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  -[PKTableViewCell setShowsActionSpinner:](v14, "setShowsActionSpinner:", self->_loadingReplacementCard);
  -[PKTableViewCell textLabel](v14, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextColor:", v15);
  objc_msgSend(v17, "setText:", v11);

  objc_msgSend(v17, "setNumberOfLines:", 0);
  return v14;
}

- (BOOL)canReplaceCard
{
  uint64_t v4;
  PKVirtualCard *virtualCard;

  if (self->_loadingCredentials || self->_hasReplacedCredentials)
    return 0;
  v4 = -[PKVirtualCard type](self->_virtualCard, "type");
  virtualCard = self->_virtualCard;
  if (v4 != 2)
  {
    if (-[PKVirtualCard type](virtualCard, "type") != 1)
      return 0;
    virtualCard = self->_account;
  }
  return -[PKVirtualCard state](virtualCard, "state") == 1;
}

- (id)_tableHeaderView
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3D78]);
  objc_msgSend(MEMORY[0x1E0DC39A8], "groupedHeaderConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_VIRTUAL_HEADER_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

  objc_msgSend(v3, "textProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineBreakMode:", 0);

  objc_msgSend(v3, "setDirectionalLayoutMargins:", 20.0, 16.0, 8.0, 0.0);
  objc_msgSend(v2, "setContentConfiguration:", v3);

  return v2;
}

- (id)_reuseIdentifierForSection:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Section-%zd"), a3);
}

- (id)_virtualCardStateFooter
{
  void *v3;

  if (-[PKAccount state](self->_account, "state") == 1)
  {
    switch(-[PKVirtualCard state](self->_virtualCard, "state"))
    {
      case 1:
        PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_VIRTUAL_FOOTER"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 2:
      case 3:
      case 4:
        goto LABEL_4;
      default:
        v3 = 0;
        break;
    }
  }
  else
  {
LABEL_4:
    PKLocalizedFeatureString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_replaceCardAlertFromIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v4 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_VIRTUAL_REPLACE_ALERT_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_VIRTUAL_REPLACE_ALERT_MESSAGE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_VIRTUAL_REPLACE_ALERT_CANCEL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_VIRTUAL_REPLACE_ALERT_CONFIRM"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke;
  v15[3] = &unk_1E3E61D68;
  v15[4] = self;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAction:", v10);
  objc_msgSend(v7, "addAction:", v13);

  return v7;
}

void __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1144) = 1;
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKVirtualCardEnabledWithWebService())
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "type");

    if (v3 == 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "_replaceVirtualCard");
      return;
    }
  }
  else
  {

  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1096);
  *(_QWORD *)(v4 + 1096) = 0;

  objc_msgSend(*(id *)(a1 + 32), "reloadData");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 1104);
  objc_msgSend(*(id *)(v6 + 1088), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "accountIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke_2;
  v10[3] = &unk_1E3E75450;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "performVirtualCardAction:forVirtualCardIdentifier:forAccountIdentifier:completion:", 3, v8, v9, v10);

}

void __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;

  v6 = a2;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke_3;
  block[3] = &unk_1E3E61400;
  v11 = v6;
  v12 = v7;
  v13 = *(_QWORD *)(a1 + 32);
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke_3(id *a1)
{
  void *v2;
  char v3;
  id v4;
  _QWORD v5[5];
  id v6;

  if (a1[4]
    && (objc_msgSend(a1[5], "domain"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB2F90]),
        v2,
        (v3 & 1) == 0))
  {
    objc_storeStrong((id *)a1[6] + 136, a1[4]);
    objc_msgSend(a1[6], "reloadData");
    v4 = a1[4];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke_4;
    v5[3] = &unk_1E3E75428;
    v5[4] = a1[6];
    v6 = v4;
    +[PKAccountCardNumbersPresenter authAndDecryptWithVirtualCard:completion:](PKAccountCardNumbersPresenter, "authAndDecryptWithVirtualCard:completion:", v6, v5);

  }
  else
  {
    objc_msgSend(a1[6], "_handleReplacementError:", a1[5]);
  }
}

void __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke_5;
  block[3] = &unk_1E3E62398;
  v10 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v16 = v10;
  v17 = v7;
  v18 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1144) = 0;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);
    objc_msgSend(*(id *)(a1 + 32), "transitionCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke_6;
    v10[3] = &unk_1E3E75400;
    v5 = *(id *)(a1 + 64);
    v6 = *(_QWORD *)(a1 + 32);
    v11 = v5;
    v12 = v6;
    v13 = v2;
    v7 = v2;
    objc_msgSend(v4, "animateAlongsideTransition:completion:", 0, v10);

  }
  else
  {
    v7 = (id)objc_msgSend(*(id *)(a1 + 48), "copy");
    objc_msgSend(v7, "setKeychainCardCredentials:", *(_QWORD *)(a1 + 56));
    PKLocalizedFeatureString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisplayName:", v8);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "writeVirtualCardToKeychain:completion:", v7, 0);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1096), *(id *)(a1 + 56));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1161) = 1;
  }

  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

void __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke_6(uint64_t a1)
{
  id v2;
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    PKAccountDisplayableError();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v2 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v2, 1, 0);

  }
}

- (void)_replaceVirtualCard
{
  NSObject *v3;
  void *v4;
  PKPaymentAuthorizationViewController *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  if (PKVirtualCardSecureRefreshEnabled()
    && -[PKVirtualCard refreshType](self->_virtualCard, "refreshType") == 1)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Presenting virtual card refresh Oslo sheet", buf, 2u);
    }

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67788]), "initRefreshRequestWithPaymentPass:", self->_pass);
    v5 = -[PKPaymentAuthorizationViewController initWithPaymentRequest:]([PKPaymentAuthorizationViewController alloc], "initWithPaymentRequest:", v4);
    -[PKPaymentAuthorizationViewController setDelegate:](v5, "setDelegate:", self);
    -[PKAccountCardNumbersViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__PKAccountCardNumbersViewController__replaceVirtualCard__block_invoke;
    v6[3] = &unk_1E3E754A0;
    v6[4] = self;
    +[PKCardNumbersAuthentication authenticationContextLocationBased:completion:](PKCardNumbersAuthentication, "authenticationContextLocationBased:completion:", 1, v6);
  }
}

void __57__PKAccountCardNumbersViewController__replaceVirtualCard__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[6];
  _QWORD block[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__PKAccountCardNumbersViewController__replaceVirtualCard__block_invoke_4;
    v14[3] = &unk_1E3E61388;
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v14);
    v13 = v15;
  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__49;
    v22 = __Block_byref_object_dispose__49;
    v23 = v5;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1160) = 1;
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PKAccountCardNumbersViewController__replaceVirtualCard__block_invoke_149;
    block[3] = &unk_1E3E612E8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 1112);
    v11 = *(_QWORD *)(v9 + 1088);
    objc_msgSend((id)v19[5], "externalizedContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __57__PKAccountCardNumbersViewController__replaceVirtualCard__block_invoke_2;
    v16[3] = &unk_1E3E75478;
    v16[4] = *(_QWORD *)(a1 + 32);
    v16[5] = &v18;
    objc_msgSend(v10, "regenerateVPANCardCredentialsForVirtualCard:authorization:completion:", v11, v12, v16);

    _Block_object_dispose(&v18, 8);
    v13 = v23;
  }

}

void __57__PKAccountCardNumbersViewController__replaceVirtualCard__block_invoke_149(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend((id)objc_opt_class(), "_virtualCardSections");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "recomputeMappedSectionsAndReloadSections:", v2);

}

void __57__PKAccountCardNumbersViewController__replaceVirtualCard__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PKAccountCardNumbersViewController__replaceVirtualCard__block_invoke_3;
  block[3] = &unk_1E3E61400;
  block[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __57__PKAccountCardNumbersViewController__replaceVirtualCard__block_invoke_3(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  id v5;
  id v6;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1144) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1160) = 0;
  v2 = *(void **)(a1 + 40);
  v3 = (id *)(*(_QWORD *)(a1 + 32) + 1096);
  if (v2)
  {
    objc_storeStrong(v3, v2);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1161) = 1;
    v4 = *(void **)(a1 + 32);
    objc_msgSend((id)objc_opt_class(), "_virtualCardSections");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recomputeMappedSectionsAndReloadSections:", v6);

  }
  else
  {
    v5 = *v3;
    *v3 = 0;

    objc_msgSend(*(id *)(a1 + 32), "_handleReplacementError:", *(_QWORD *)(a1 + 48));
  }
}

void __57__PKAccountCardNumbersViewController__replaceVirtualCard__block_invoke_4(uint64_t a1)
{
  id v2;
  id v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1144) = 0;
  if ((objc_msgSend(*(id *)(a1 + 40), "pk_shouldSuppressAfterAuthenticationPolicyWasLocationBased:", 1) & 1) == 0)
  {
    +[PKCardNumbersAuthentication genericDisplayableVirtualCardError](PKCardNumbersAuthentication, "genericDisplayableVirtualCardError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v2 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v2, 1, 0);

  }
}

- (void)_handleReplacementError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  unint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  self->_loadingReplacementCard = 0;
  v16 = v4;
  if (!v4)
    goto LABEL_14;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6BCB8]);

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (PKVirtualCardEnabledWithWebService())
    {
      v11 = -[PKVirtualCard type](self->_virtualCard, "type");

      if (v11 == 2)
      {
        -[PKAccountCardNumbersViewController _genericDisplayableError:](self, "_genericDisplayableError:", v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
        v13 = v12;
        v8 = PKAlertForDisplayableErrorWithHandlers(v12, 0, 0, 0);

        -[PKAccountCardNumbersViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
        goto LABEL_13;
      }
    }
    else
    {

    }
    +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", v16, self->_accountFeatureIdentifier, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v7 = objc_msgSend(v16, "code");
  if (v7 <= 5)
  {
    if (v7 == 3)
    {
      -[PKAccountCardNumbersViewController _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("ACCOUNT_SERVICE_CARD_NUMBERS_VIRTUAL_RATE_LIMIT_ERROR_TITLE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountCardNumbersViewController _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("ACCOUNT_SERVICE_CARD_NUMBERS_VIRTUAL_RATE_LIMIT_ERROR_MESSAGE"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustom();
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (!v8)
        goto LABEL_14;
      goto LABEL_6;
    }
    -[PKAccountCardNumbersViewController _genericDisplayableError:](self, "_genericDisplayableError:", v16);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
LABEL_6:
      v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);
      -[PKAccountCardNumbersViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

LABEL_13:
    }
  }
LABEL_14:
  -[PKSectionTableViewController reloadData](self, "reloadData");

}

- (id)_genericDisplayableError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_VIRTUAL_REPLACE_GENERIC_ERROR_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_VIRTUAL_REPLACE_GENERIC_ERROR_MESSAGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKDisplayableErrorCustom();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_toggleDynamicSecurityCodeSetting
{
  uint64_t v3;
  PKAccountService *accountService;
  void *v5;
  void *v6;
  _QWORD v7[5];

  if (-[PKVirtualCard hasDynamicSecurityCode](self->_virtualCard, "hasDynamicSecurityCode"))
    v3 = 7;
  else
    v3 = 6;
  -[PKSettingTableCell showSpinner:](self->_dynamicSecurityCodeCell, "showSpinner:", 1);
  accountService = self->_accountService;
  -[PKVirtualCard identifier](self->_virtualCard, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__PKAccountCardNumbersViewController__toggleDynamicSecurityCodeSetting__block_invoke;
  v7[3] = &unk_1E3E75450;
  v7[4] = self;
  -[PKAccountService performVirtualCardAction:forVirtualCardIdentifier:forAccountIdentifier:completion:](accountService, "performVirtualCardAction:forVirtualCardIdentifier:forAccountIdentifier:completion:", v3, v5, v6, v7);

}

void __71__PKAccountCardNumbersViewController__toggleDynamicSecurityCodeSetting__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a2;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PKAccountCardNumbersViewController__toggleDynamicSecurityCodeSetting__block_invoke_2;
  block[3] = &unk_1E3E61400;
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __71__PKAccountCardNumbersViewController__toggleDynamicSecurityCodeSetting__block_invoke_2(uint64_t a1)
{
  void *v2;
  BOOL v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "showSpinner:", 0);
  v2 = *(void **)(a1 + 40);
  if (v2)
    v3 = *(_QWORD *)(a1 + 48) == 0;
  else
    v3 = 0;
  if (v3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1088), v2);
    v6 = *(void **)(a1 + 32);
    objc_msgSend((id)objc_opt_class(), "_virtualCardSections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recomputeMappedSectionsAndReloadSections:", v7);

    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 1104);
    objc_msgSend(*(id *)(v8 + 1088), "securityCodeIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "accountIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "noteSecurityCodeActivityWithAction:forSecurityCodeIdentifier:forVirtualCardIdentifier:forAccountIdentifier:completion:", 1, v5, v10, v11, &__block_literal_global_162_0);

  }
  else
  {
    +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);

    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v5, 1, 0);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setOn:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "hasDynamicSecurityCode"));
}

void __71__PKAccountCardNumbersViewController__toggleDynamicSecurityCodeSetting__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = a3;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Called noteSecurityCodeActivityWithAction after enabling dynamic security code with error: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (id)_localizedStringForKey:(id)a3
{
  id v4;
  unint64_t accountFeatureIdentifier;
  NSString *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  accountFeatureIdentifier = self->_accountFeatureIdentifier;
  if (accountFeatureIdentifier == 1)
  {
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("ACCOUNT_SERVICE_"), "length"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCashVPANString(v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (accountFeatureIdentifier)
    {
      PKLocalizedFeatureString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("ACCOUNT_SERVICE_"), "length"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedVirtualCardString(v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

LABEL_7:
  return v8;
}

- (void)_retryCardCredentials
{
  void *v3;
  _QWORD v4[5];

  if (-[LAContext checkContextValidWithError:](self->_localAuthenticationContext, "checkContextValidWithError:", 0))
  {
    -[PKAccountCardNumbersViewController _retrieveCardCredentials](self, "_retrieveCardCredentials");
  }
  else
  {
    self->_loadingCredentials = 1;
    objc_msgSend((id)objc_opt_class(), "_virtualCardSections");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSectionTableViewController recomputeMappedSectionsAndReloadSections:](self, "recomputeMappedSectionsAndReloadSections:", v3);

    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __59__PKAccountCardNumbersViewController__retryCardCredentials__block_invoke;
    v4[3] = &unk_1E3E754A0;
    v4[4] = self;
    +[PKCardNumbersAuthentication authenticationContextLocationBased:completion:](PKCardNumbersAuthentication, "authenticationContextLocationBased:completion:", 1, v4);
  }
}

void __59__PKAccountCardNumbersViewController__retryCardCredentials__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PKAccountCardNumbersViewController__retryCardCredentials__block_invoke_2;
  block[3] = &unk_1E3E61400;
  v10 = v5;
  v11 = v6;
  v12 = *(_QWORD *)(a1 + 32);
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __59__PKAccountCardNumbersViewController__retryCardCredentials__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
    v4 = v2 == 0;
  else
    v4 = 0;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 1176), v3);
    objc_msgSend(*(id *)(a1 + 48), "_retrieveCardCredentials");
  }
  else
  {
    if ((objc_msgSend(v2, "pk_shouldSuppressAfterAuthenticationPolicyWasLocationBased:", 1) & 1) == 0)
    {
      +[PKCardNumbersAuthentication genericDisplayableVirtualCardError](PKCardNumbersAuthentication, "genericDisplayableVirtualCardError");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v6, 1, 0);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 48) + 1160) = 0;
  }
}

- (void)_retrieveCardCredentials
{
  void *v3;
  void *v4;
  id v5;
  PKVirtualCard *virtualCard;
  _QWORD v7[5];

  -[LAContext externalizedContext](self->_localAuthenticationContext, "externalizedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (PKUIOnlyDemoModeEnabled() & 1) == 0)
  {
    self->_loadingCredentials = 1;
    objc_msgSend((id)objc_opt_class(), "_virtualCardSections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSectionTableViewController recomputeMappedSectionsAndReloadSections:](self, "recomputeMappedSectionsAndReloadSections:", v4);

    v5 = objc_alloc_init(MEMORY[0x1E0D67790]);
    virtualCard = self->_virtualCard;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __62__PKAccountCardNumbersViewController__retrieveCardCredentials__block_invoke;
    v7[3] = &unk_1E3E75508;
    v7[4] = self;
    objc_msgSend(v5, "credentialsForVirtualCard:authorization:options:merchantHost:completion:", virtualCard, v3, 3, 0, v7);

  }
}

void __62__PKAccountCardNumbersViewController__retrieveCardCredentials__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1160) = 0;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 1176);
  *(_QWORD *)(v7 + 1176) = 0;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKAccountCardNumbersViewController__retrieveCardCredentials__block_invoke_2;
  block[3] = &unk_1E3E61400;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v15 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __62__PKAccountCardNumbersViewController__retrieveCardCredentials__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = v2;
    v5 = *(void **)(v3 + 1096);
    *(_QWORD *)(v3 + 1096) = v4;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D6BCB8]);

    if (v7 && objc_msgSend(*(id *)(a1 + 48), "code") == 3)
    {
      +[PKCardNumbersAuthentication rateLimitDisplayableVirtualCardError](PKCardNumbersAuthentication, "rateLimitDisplayableVirtualCardError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[PKCardNumbersAuthentication genericDisplayableVirtualCardError](PKCardNumbersAuthentication, "genericDisplayableVirtualCardError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;
    v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v9, 1, 0);

  }
  v10 = *(void **)(a1 + 40);
  objc_msgSend((id)objc_opt_class(), "_virtualCardSections");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recomputeMappedSectionsAndReloadSections:", v11);

}

+ (id)_virtualCardSections
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v2, "addIndex:", 0);
  objc_msgSend(v2, "addIndex:", 1);
  objc_msgSend(v2, "addIndex:", 2);
  return v2;
}

- (void)paymentAuthorizationViewController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  void (**v5)(id, void *);
  NSObject *v6;
  id v7;
  void *v8;
  uint8_t v9[16];

  v5 = (void (**)(id, void *))a5;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Finished virtual card refresh", v9, 2u);
  }

  v7 = objc_alloc(MEMORY[0x1E0D670A8]);
  v8 = (void *)objc_msgSend(v7, "initWithStatus:errors:", 0, MEMORY[0x1E0C9AA60]);
  v5[2](v5, v8);

}

- (void)paymentAuthorizationViewControllerDidFinish:(id)a3
{
  self->_loadingReplacementCard = 0;
  -[PKAccountCardNumbersViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)redactSensitiveDetails
{
  return self->_redactSensitiveDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_dynamicSecurityCodeCell, 0);
  objc_storeStrong((id *)&self->_physicalCard, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_cardCredentials, 0);
  objc_storeStrong((id *)&self->_virtualCard, 0);
}

@end
