@implementation PKFamilyMemberTransactionsViewController

- (PKFamilyMemberTransactionsViewController)initWithFamilyMember:(id)a3 familyCollection:(id)a4 transactionSource:(id)a5 account:(id)a6 peerPaymentAccount:(id)a7 peerPaymentWebService:(id)a8 detailViewStyle:(int64_t)a9 paymentServiceDataProvider:(id)a10 mode:(unint64_t)a11
{
  id v18;
  id v19;
  id v20;
  PKFamilyMemberTransactionsViewController *v21;
  PKFamilyMemberTransactionsViewController *v22;
  PKPaymentDataProvider **p_paymentServiceDataProvider;
  void *v24;
  int v25;
  id *v26;
  uint64_t v27;
  PKTransactionSourceCollection *transactionSourceCollection;
  uint64_t v29;
  PKDashboardTransactionFetcher *transactionFetcher;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  PKContactResolver *contactResolver;
  PKPaymentTransactionCellController *v36;
  PKPaymentTransactionCellController *transactionCellController;
  PKPaymentTransactionDetailsFactory *v38;
  PKPaymentTransactionDetailsFactory *transactionDetailsFactory;
  NSDateFormatter *v40;
  NSDateFormatter *formatterYear;
  NSDateFormatter *v42;
  id v43;
  void *v44;
  id v46;
  id v47;
  id v48;
  id v49;
  objc_super v50;

  v18 = a3;
  v19 = a4;
  v49 = a5;
  v20 = a6;
  v48 = a7;
  v47 = a8;
  v46 = a10;
  v50.receiver = self;
  v50.super_class = (Class)PKFamilyMemberTransactionsViewController;
  v21 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v50, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 3);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_familyMember, a3);
    objc_storeStrong((id *)&v22->_familyCollection, a4);
    v22->_detailViewStyle = a9;
    objc_storeStrong((id *)&v22->_peerPaymentAccount, a7);
    objc_storeStrong((id *)&v22->_peerPaymentWebService, a8);
    p_paymentServiceDataProvider = &v22->_paymentServiceDataProvider;
    objc_storeStrong((id *)&v22->_paymentServiceDataProvider, a10);
    -[PKFamilyMemberCollection currentUser](v22->_familyCollection, "currentUser");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isOrganizer");
    v26 = (id *)MEMORY[0x1E0D68C80];
    if (!v25)
      v26 = (id *)MEMORY[0x1E0D68C88];
    objc_storeStrong((id *)&v22->_viewerFamilyMemberTypeAnalyticsKey, *v26);

    v22->_mode = a11;
    objc_storeStrong((id *)&v22->_account, a6);
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0D67738]), "initWithTransactionSource:", v49);
    transactionSourceCollection = v22->_transactionSourceCollection;
    v22->_transactionSourceCollection = (PKTransactionSourceCollection *)v27;

    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66C98]), "initWithTransactionSourceCollection:paymentDataProvider:", v22->_transactionSourceCollection, *p_paymentServiceDataProvider);
    transactionFetcher = v22->_transactionFetcher;
    v22->_transactionFetcher = (PKDashboardTransactionFetcher *)v29;

    -[PKDashboardTransactionFetcher setDelegate:](v22->_transactionFetcher, "setDelegate:", v22);
    v31 = objc_alloc(MEMORY[0x1E0D66C60]);
    v32 = objc_alloc_init(MEMORY[0x1E0C97298]);
    -[PKFamilyMemberTransactionsViewController _contactKeysToFetch](v22, "_contactKeysToFetch");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v31, "initWithContactStore:keysToFetch:", v32, v33);
    contactResolver = v22->_contactResolver;
    v22->_contactResolver = (PKContactResolver *)v34;

    v36 = -[PKPaymentTransactionCellController initWithContactResolver:]([PKPaymentTransactionCellController alloc], "initWithContactResolver:", v22->_contactResolver);
    transactionCellController = v22->_transactionCellController;
    v22->_transactionCellController = v36;

    v38 = -[PKPaymentTransactionDetailsFactory initWithContactResolver:peerPaymentWebService:paymentServiceDataProvider:detailViewStyle:]([PKPaymentTransactionDetailsFactory alloc], "initWithContactResolver:peerPaymentWebService:paymentServiceDataProvider:detailViewStyle:", v22->_contactResolver, v22->_peerPaymentWebService, *p_paymentServiceDataProvider, v22->_detailViewStyle);
    transactionDetailsFactory = v22->_transactionDetailsFactory;
    v22->_transactionDetailsFactory = v38;

    v40 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    formatterYear = v22->_formatterYear;
    v22->_formatterYear = v40;

    v42 = v22->_formatterYear;
    v43 = objc_alloc(MEMORY[0x1E0C99D48]);
    v44 = (void *)objc_msgSend(v43, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    -[NSDateFormatter setCalendar:](v42, "setCalendar:", v44);

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v22->_formatterYear, "setLocalizedDateFormatFromTemplate:", CFSTR("y"));
  }

  return v22;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKFamilyMemberTransactionsViewController;
  -[PKSectionTableViewController viewDidLoad](&v8, sel_viewDidLoad);
  PKLocalizedPaymentString(CFSTR("TRANSACTIONS_HEADER"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFamilyMemberTransactionsViewController setTitle:](self, "setTitle:", v3);

  -[PKFamilyMemberTransactionsViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionTableCellReuseIdentifier"));
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionStatementTableCellReuseIdentifier"));
  objc_msgSend(v4, "setEstimatedRowHeight:", 76.0);
  objc_msgSend(v4, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v4, "pkui_setupForReadableContentGuide");
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__PKFamilyMemberTransactionsViewController_viewDidLoad__block_invoke;
  v5[3] = &unk_1E3E61C58;
  objc_copyWeak(&v6, &location);
  -[PKFamilyMemberTransactionsViewController _fetchDataWithCompletion:](self, "_fetchDataWithCompletion:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __55__PKFamilyMemberTransactionsViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1216] = 1;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "updateSectionVisibilityAndReloadIfNecessaryForSections:", &unk_1E3FAE920);
    WeakRetained = v2;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKFamilyMemberTransactionsViewController;
  -[PKFamilyMemberTransactionsViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if (self->_mode == 1)
  {
    v4 = *MEMORY[0x1E0D698D8];
    objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D698D8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      self->_didBeginReporter = 1;
      objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v4);
    }
  }
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
  v10.super_class = (Class)PKFamilyMemberTransactionsViewController;
  -[PKFamilyMemberTransactionsViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  if (self->_mode == 1)
  {
    v4 = (void *)MEMORY[0x1E0D66A58];
    v5 = *MEMORY[0x1E0D698D8];
    v6 = *MEMORY[0x1E0D68C50];
    v7 = *MEMORY[0x1E0D68F50];
    v11[0] = *MEMORY[0x1E0D68AA0];
    v11[1] = v7;
    v8 = *MEMORY[0x1E0D69790];
    v12[0] = v6;
    v12[1] = v8;
    v11[2] = *MEMORY[0x1E0D68C78];
    v12[2] = self->_viewerFamilyMemberTypeAnalyticsKey;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subject:sendEvent:", v5, v9);

  }
}

- (void)viewDidDisappear:(BOOL)a3
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
  v10.super_class = (Class)PKFamilyMemberTransactionsViewController;
  -[PKFamilyMemberTransactionsViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, a3);
  if (self->_mode == 1)
  {
    v4 = (void *)MEMORY[0x1E0D66A58];
    v5 = *MEMORY[0x1E0D698D8];
    v6 = *MEMORY[0x1E0D68C58];
    v7 = *MEMORY[0x1E0D68F50];
    v11[0] = *MEMORY[0x1E0D68AA0];
    v11[1] = v7;
    v8 = *MEMORY[0x1E0D69790];
    v12[0] = v6;
    v12[1] = v8;
    v11[2] = *MEMORY[0x1E0D68C78];
    v12[2] = self->_viewerFamilyMemberTypeAnalyticsKey;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subject:sendEvent:", v5, v9);

    if (self->_didBeginReporter)
    {
      objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", v5);
      self->_didBeginReporter = 0;
    }
  }
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;

  if (a3 != 2)
  {
    if (a3 == 1)
    {
      if (self->_allContentIsLoaded)
      {
        v4 = 1200;
        return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v4), "count") != 0;
      }
    }
    else if (!a3 && self->_allContentIsLoaded)
    {
      v4 = 1208;
      return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v4), "count") != 0;
    }
    return 0;
  }
  -[PKFamilyMemberCollection currentUser](self->_familyCollection, "currentUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isOrganizer"))
    v5 = self->_mode == 1;
  else
    v5 = 0;

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5;
  uint64_t v6;

  v5 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  switch(v5)
  {
    case 3uLL:
      return 0;
    case 1uLL:
      if (self->_allContentIsLoaded)
      {
        v6 = 1200;
        return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v6), "count");
      }
      return 0;
    case 0uLL:
      if (self->_allContentIsLoaded)
      {
        v6 = 1208;
        return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v6), "count");
      }
      return 0;
  }
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSDateFormatter *formatterYear;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  PKTransactionSourceCollection *transactionSourceCollection;
  void *v29;
  void *v30;
  _BOOL4 sentStatement;
  void *v32;

  v6 = a3;
  v7 = a4;
  v8 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v7, "section"));
  switch(v8)
  {
    case 2uLL:
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKPaymentTransactionStatementTableCellReuseIdentifier"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_EMAIL_STATEMENT"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", v10);
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTextColor:", v15);

      if (self->_requestingStatement)
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
        objc_msgSend(v16, "startAnimating");
        objc_msgSend(v9, "setAccessoryView:", v16);
        objc_msgSend(v9, "textLabel");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setTextColor:", v18);

        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_STATEMENT_SENDING_STATEMENT"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setText:", v19);

      }
      else
      {
        sentStatement = self->_sentStatement;
        objc_msgSend(v9, "setAccessoryView:", 0);
        v26 = v9;
        if (!sentStatement)
        {
          v27 = 0;
LABEL_11:
          objc_msgSend(v26, "setAccessoryType:", v27);
LABEL_18:

          goto LABEL_19;
        }
        objc_msgSend(v9, "setAccessoryType:", 3);
        objc_msgSend(v9, "textLabel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTextColor:", v32);

        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_STATEMENT_SENT_STATEMENT"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setText:", v17);
      }

      goto LABEL_18;
    case 1uLL:
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionForYearTableCellReuseIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("PKPaymentTransactionForYearTableCellReuseIdentifier"));
      -[NSArray objectAtIndexedSubscript:](self->_transactionGroups, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      formatterYear = self->_formatterYear;
      objc_msgSend(v10, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](formatterYear, "stringFromDate:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_TRANSACTIONS_IN_YEAR_FORMAT"), CFSTR("%@"), v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "textLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setText:", v14);

      objc_msgSend(v9, "detailTextLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v10, "transactionCount"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setText:", v25);

      v26 = v9;
      v27 = 1;
      goto LABEL_11;
    case 0uLL:
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKPaymentTransactionTableCellReuseIdentifier"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_transactions, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentDataProvider deviceName](self->_paymentServiceDataProvider, "deviceName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        PKDeviceName();
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v13;

      transactionSourceCollection = self->_transactionSourceCollection;
      objc_msgSend(v10, "transactionSourceIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTransactionSourceCollection transactionSourceForTransactionSourceIdentifier:](transactionSourceCollection, "transactionSourceForTransactionSourceIdentifier:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPaymentTransactionCellController configureCell:forTransaction:transactionSource:familyMember:account:detailStyle:deviceName:avatarViewDelegate:](self->_transactionCellController, "configureCell:forTransaction:transactionSource:familyMember:account:detailStyle:deviceName:avatarViewDelegate:", v9, v10, v30, self->_familyMember, self->_account, self->_detailViewStyle, v14, self);
      goto LABEL_18;
  }
  v9 = 0;
LABEL_19:

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;

  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4) == 1)
  {
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_TRANSACTIONS_BY_YEAR_SECTION_HEADER"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v12, 1);
  v6 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v12, "section"));
  if (v6 == 2)
  {
    -[PKFamilyMemberTransactionsViewController _didSelectRequestStatementAtIndexPath:](self, "_didSelectRequestStatementAtIndexPath:", v12);
LABEL_8:
    v7 = v12;
    goto LABEL_9;
  }
  if (v6 == 1)
  {
    -[NSArray objectAtIndexedSubscript:](self->_transactionGroups, "objectAtIndexedSubscript:", objc_msgSend(v12, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFamilyMemberTransactionsViewController _viewControllerForTransactionGroup:](self, "_viewControllerForTransactionGroup:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v7 = v12;
  if (!v6)
  {
    -[NSArray objectAtIndexedSubscript:](self->_transactions, "objectAtIndexedSubscript:", objc_msgSend(v12, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFamilyMemberTransactionsViewController _transactionDetailViewControllerForTransaction:](self, "_transactionDetailViewControllerForTransaction:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = (void *)v9;
    -[PKFamilyMemberTransactionsViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pushViewController:animated:", v10, 1);

    goto LABEL_8;
  }
LABEL_9:

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  unint64_t v5;

  v5 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(a4, "section", a3));
  if (v5 == 3)
    return 0;
  if (v5 != 2)
    return 1;
  if (self->_requestingStatement)
    return 0;
  return !self->_sentStatement;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v10, "section")))
  {
    v11 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_transactions, "objectAtIndexedSubscript:", objc_msgSend(v10, "row"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForRowAtIndexPath:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
      v15 = v13 == 0;
    else
      v15 = 1;
    if (!v15
      && (objc_msgSend(v13, "transactionView"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "shouldShowTransactionPreviewForTouchAtPoint:inView:", v9, x, y),
          v16,
          v17)
      && (-[PKFamilyMemberTransactionsViewController _transactionDetailViewControllerForTransaction:](self, "_transactionDetailViewControllerForTransaction:", v12), (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v19 = (void *)MEMORY[0x1E0DC36B8];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __102__PKFamilyMemberTransactionsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
      v22[3] = &unk_1E3E6A350;
      v23 = v18;
      v20 = v18;
      objc_msgSend(v19, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v22, &__block_literal_global_188);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

id __102__PKFamilyMemberTransactionsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __102__PKFamilyMemberTransactionsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2()
{
  return 0;
}

- (void)transactionsChanged:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__PKFamilyMemberTransactionsViewController_transactionsChanged___block_invoke;
  v3[3] = &unk_1E3E62288;
  v3[4] = self;
  -[PKFamilyMemberTransactionsViewController _fetchDataWithCompletion:](self, "_fetchDataWithCompletion:", v3);
}

uint64_t __64__PKFamilyMemberTransactionsViewController_transactionsChanged___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "updateSectionVisibilityAndReloadIfNecessaryForSections:", &unk_1E3FAE938);
  return result;
}

- (void)_didSelectRequestStatementAtIndexPath:(id)a3
{
  PKPeerPaymentAccount *peerPaymentAccount;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  peerPaymentAccount = self->_peerPaymentAccount;
  -[PKFamilyMember altDSID](self->_familyMember, "altDSID", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAccount peerPaymentAccountWithAltDSID:](peerPaymentAccount, "peerPaymentAccountWithAltDSID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_STATEMENT_ALERT_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKPrimaryAppleAccountFormattedUsername();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_STATEMENT_ALERT_MESSAGE"), CFSTR("%@"), v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_STATEMENT_ALERT_CANCEL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_STATEMENT_ALERT_SEND"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __82__PKFamilyMemberTransactionsViewController__didSelectRequestStatementAtIndexPath___block_invoke;
    v21[3] = &unk_1E3E61D90;
    v21[4] = self;
    v22 = v7;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addAction:", v14);
    objc_msgSend(v11, "addAction:", v17);
    objc_msgSend(v11, "setPreferredAction:", v17);
    PKAccessibilityIDAlertSet(v11, (void *)*MEMORY[0x1E0D67A28]);
    -[PKFamilyMemberTransactionsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v6;
      _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "Cannot request statement for family member if the account identifier is not defined for accounts %@", buf, 0xCu);
    }

    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_EMAIL_STATEMENT_ERROR_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_EMAIL_STATEMENT_ERROR_MESSAGE"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustom();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);
    -[PKFamilyMemberTransactionsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
  }

}

void __82__PKFamilyMemberTransactionsViewController__didSelectRequestStatementAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1218) = 1;
  objc_msgSend(*(id *)(a1 + 32), "updateSectionVisibilityAndReloadIfNecessaryForSection:", 2);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1104);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__PKFamilyMemberTransactionsViewController__didSelectRequestStatementAtIndexPath___block_invoke_2;
  v6[3] = &unk_1E3E75DF8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "peerPaymentRequestStatementForAccountIdentifier:withCompletion:", v4, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __82__PKFamilyMemberTransactionsViewController__didSelectRequestStatementAtIndexPath___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PKFamilyMemberTransactionsViewController__didSelectRequestStatementAtIndexPath___block_invoke_3;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __82__PKFamilyMemberTransactionsViewController__didSelectRequestStatementAtIndexPath___block_invoke_3(uint64_t a1)
{
  _BYTE *WeakRetained;
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    WeakRetained[1218] = 0;
    if (*(_QWORD *)(a1 + 32))
      v3 = *(_QWORD *)(a1 + 40) == 0;
    else
      v3 = 0;
    v9 = WeakRetained;
    if (v3)
    {
      WeakRetained[1219] = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!*(_QWORD *)(a1 + 40))
      {
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_EMAIL_STATEMENT_ERROR_TITLE"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_EMAIL_STATEMENT_ERROR_MESSAGE"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        PKDisplayableErrorCustom();
        v7 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v7;
      }
      v8 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
      objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);

    }
    objc_msgSend(v9, "updateSectionVisibilityAndReloadIfNecessaryForSection:", 2);
    WeakRetained = v9;
  }

}

- (id)_viewControllerForTransactionGroup:(id)a3
{
  id v4;
  PKPaymentTransactionsInYearTableViewController *v5;
  void *v6;
  void *v7;
  PKPaymentTransactionsInYearTableViewController *v8;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 3)
  {
    v5 = [PKPaymentTransactionsInYearTableViewController alloc];
    objc_msgSend(v4, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKPaymentTransactionsInYearTableViewController initWithDateFromYear:calendar:transactionSourceCollection:familyCollection:detailViewStyle:paymentServiceDataProvider:contactResolver:peerPaymentWebService:account:](v5, "initWithDateFromYear:calendar:transactionSourceCollection:familyCollection:detailViewStyle:paymentServiceDataProvider:contactResolver:peerPaymentWebService:account:", v6, v7, self->_transactionSourceCollection, self->_familyCollection, self->_detailViewStyle, self->_paymentServiceDataProvider, self->_contactResolver, self->_peerPaymentWebService, self->_account);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_transactionDetailViewControllerForTransaction:(id)a3
{
  id v4;
  PKDashboardTransactionFetcher *transactionFetcher;
  void *v6;
  void *v7;
  id v8;
  PKTransactionHistoryViewController *v9;
  uint64_t v10;
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "transactionType") == 9)
  {
    transactionFetcher = self->_transactionFetcher;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    -[PKDashboardTransactionFetcher cashbackGroupForTransactionWithIdentifier:cashbackTransactionSourceCollection:](transactionFetcher, "cashbackGroupForTransactionWithIdentifier:cashbackTransactionSourceCollection:", v6, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;

    v9 = -[PKTransactionHistoryViewController initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:]([PKTransactionHistoryViewController alloc], "initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:", v7, v8, self->_familyCollection, 0, 0, 0, 0, 0, self->_detailViewStyle);
  }
  else
  {
    if (-[PKPaymentTransactionDetailsFactory canShowTransactionHistoryForTransaction:transactionSourceCollection:](self->_transactionDetailsFactory, "canShowTransactionHistoryForTransaction:transactionSourceCollection:", v4, self->_transactionSourceCollection)&& !self->_detailViewStyle)
    {
      -[PKPaymentTransactionDetailsFactory historyViewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:](self->_transactionDetailsFactory, "historyViewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:", v4, self->_transactionSourceCollection, self->_familyCollection, 0, 0, 0);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PKPaymentTransactionDetailsFactory detailViewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:](self->_transactionDetailsFactory, "detailViewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:", v4, self->_transactionSourceCollection, self->_familyCollection, 0, 0, 0, 0);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (PKTransactionHistoryViewController *)v10;
  }

  return v9;
}

- (void)_fetchDataWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD v13[4];
  NSObject *v14;
  _QWORD *v15;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  _QWORD v19[3];
  char v20;

  v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__PKFamilyMemberTransactionsViewController__fetchDataWithCompletion___block_invoke;
  v16[3] = &unk_1E3E67580;
  v18 = v19;
  v7 = v5;
  v17 = v7;
  -[PKFamilyMemberTransactionsViewController _reloadTransactionsWithCompletion:](self, "_reloadTransactionsWithCompletion:", v16);
  dispatch_group_enter(v7);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __69__PKFamilyMemberTransactionsViewController__fetchDataWithCompletion___block_invoke_2;
  v13[3] = &unk_1E3E67580;
  v15 = v19;
  v8 = v7;
  v14 = v8;
  -[PKFamilyMemberTransactionsViewController _reloadTransactionGroupsWithCompletion:](self, "_reloadTransactionGroupsWithCompletion:", v13);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __69__PKFamilyMemberTransactionsViewController__fetchDataWithCompletion___block_invoke_3;
  v10[3] = &unk_1E3E69918;
  v11 = v4;
  v12 = v19;
  v9 = v4;
  dispatch_group_notify(v8, MEMORY[0x1E0C80D38], v10);

  _Block_object_dispose(v19, 8);
}

void __69__PKFamilyMemberTransactionsViewController__fetchDataWithCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  BOOL v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = (a2 & 1) != 0 || *(_BYTE *)(v2 + 24) != 0;
  *(_BYTE *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __69__PKFamilyMemberTransactionsViewController__fetchDataWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v2;
  BOOL v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = (a2 & 1) != 0 || *(_BYTE *)(v2 + 24) != 0;
  *(_BYTE *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __69__PKFamilyMemberTransactionsViewController__fetchDataWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  return result;
}

- (void)_reloadTransactionsWithCompletion:(id)a3
{
  id v4;
  PKDashboardTransactionFetcher *transactionFetcher;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  transactionFetcher = self->_transactionFetcher;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__PKFamilyMemberTransactionsViewController__reloadTransactionsWithCompletion___block_invoke;
  v7[3] = &unk_1E3E61878;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PKDashboardTransactionFetcher reloadTransactionsWithCompletion:](transactionFetcher, "reloadTransactionsWithCompletion:", v7);

}

void __78__PKFamilyMemberTransactionsViewController__reloadTransactionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PKFamilyMemberTransactionsViewController__reloadTransactionsWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E65388;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __78__PKFamilyMemberTransactionsViewController__reloadTransactionsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_updateWithTransactions:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

- (void)_reloadTransactionGroupsWithCompletion:(id)a3
{
  id v4;
  PKDashboardTransactionFetcher *transactionFetcher;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  transactionFetcher = self->_transactionFetcher;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__PKFamilyMemberTransactionsViewController__reloadTransactionGroupsWithCompletion___block_invoke;
  v7[3] = &unk_1E3E61878;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PKDashboardTransactionFetcher transactionCountByPeriod:withCompletion:](transactionFetcher, "transactionCountByPeriod:withCompletion:", 4, v7);

}

void __83__PKFamilyMemberTransactionsViewController__reloadTransactionGroupsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__PKFamilyMemberTransactionsViewController__reloadTransactionGroupsWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E65388;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __83__PKFamilyMemberTransactionsViewController__reloadTransactionGroupsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_updateWithTransactionGroups:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

- (BOOL)_updateWithTransactions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSArray *v7;
  NSArray *transactions;

  v4 = a3;
  v5 = v4;
  if (self->_transactions)
    v6 = objc_msgSend(v4, "isEqualToArray:") ^ 1;
  else
    LOBYTE(v6) = 1;
  v7 = (NSArray *)objc_msgSend(v5, "copy");
  transactions = self->_transactions;
  self->_transactions = v7;

  return v6;
}

- (BOOL)_updateWithTransactionGroups:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSArray *v7;
  NSArray *transactionGroups;

  v4 = a3;
  v5 = v4;
  if (self->_transactionGroups)
    v6 = objc_msgSend(v4, "isEqualToArray:") ^ 1;
  else
    LOBYTE(v6) = 1;
  v7 = (NSArray *)objc_msgSend(v5, "copy");
  transactionGroups = self->_transactionGroups;
  self->_transactionGroups = v7;

  return v6;
}

- (id)_contactKeysToFetch
{
  void *v2;
  Class v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v3 = _MergedGlobals_9_0();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v3, "descriptorForRequiredKeysWithThreeDTouchEnabled:", objc_msgSend(v4, "_supportsForceTouch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend((Class)off_1EE4C5F78(), "descriptorForRequiredKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend((Class)off_1EE4C5F80(), "descriptorForRequiredKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C966A8];
  v11[3] = v7;
  v11[4] = v8;
  v11[5] = *MEMORY[0x1E0C967C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_transactionGroups, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_viewerFamilyMemberTypeAnalyticsKey, 0);
  objc_storeStrong((id *)&self->_formatterYear, 0);
  objc_storeStrong((id *)&self->_transactionCellController, 0);
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_transactionDetailsFactory, 0);
  objc_storeStrong((id *)&self->_transactionFetcher, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end
