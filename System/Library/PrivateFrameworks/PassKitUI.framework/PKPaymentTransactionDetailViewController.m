@implementation PKPaymentTransactionDetailViewController

- (PKPaymentTransactionDetailViewController)initWithTransaction:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 bankConnectInstitution:(id)a8 physicalCards:(id)a9 contactResolver:(id)a10 peerPaymentWebService:(id)a11 paymentServiceDataProvider:(id)a12 detailViewStyle:(int64_t)a13 allowTransactionLinks:(BOOL)a14
{
  id v19;
  id v20;
  id v21;
  PKPaymentTransactionDetailViewController *v22;
  PKPaymentTransactionDetailViewController *v23;
  PKPaymentTransactionCellController *v24;
  PKPaymentTransactionCellController *transactionCellController;
  uint64_t v26;
  PKPaymentWebService *webService;
  id *p_account;
  uint64_t v29;
  PKAccountUser *accountUser;
  uint64_t v31;
  NSSet *physicalCards;
  uint64_t v33;
  PKAccountService *accountService;
  uint64_t v35;
  PKPaymentPass *paymentPass;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  PKPaymentPass *v41;
  PKPhysicalCardController *v42;
  PKPhysicalCardController *physicalCardController;
  NSDateFormatter *v44;
  NSDateFormatter *transactionDateFormatter;
  char v46;
  NSDateFormatter *v47;
  NSDateFormatter *monthDayLocalFormatter;
  NSDateFormatter *v49;
  NSDateFormatter *monthDayYearLocalFormatter;
  void *v51;
  char v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  PKDashboardTransactionFetcher *transactionFetcher;
  uint64_t v58;
  NSObject *v59;
  _BOOL4 v60;
  uint64_t v61;
  PKCoarseLocationMonitor *coarseLocationMonitor;
  void *v63;
  PKAccountServiceAccountResolutionController *v64;
  PKAccountServiceAccountResolutionController *accountResolutionController;
  void *v66;
  void *v68;
  id obj;
  id v70;
  PKTransactionSourceCollection **p_transactionSourceCollection;
  id v72;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  uint8_t buf[8];
  objc_super v82;

  v19 = a3;
  obj = a4;
  v79 = a4;
  v78 = a5;
  v70 = a6;
  v77 = a6;
  v72 = a7;
  v76 = a7;
  v75 = a8;
  v20 = a9;
  v21 = a10;
  v74 = a11;
  v80 = a12;
  v82.receiver = self;
  v82.super_class = (Class)PKPaymentTransactionDetailViewController;
  v22 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v82, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 25);
  v23 = v22;
  if (!v22)
    goto LABEL_26;
  v68 = v19;
  objc_storeStrong((id *)&v22->_transactionSourceCollection, obj);
  objc_storeStrong((id *)&v23->_contactResolver, a10);
  v24 = -[PKPaymentTransactionCellController initWithContactResolver:]([PKPaymentTransactionCellController alloc], "initWithContactResolver:", v23->_contactResolver);
  transactionCellController = v23->_transactionCellController;
  v23->_transactionCellController = v24;

  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v26 = objc_claimAutoreleasedReturnValue();
  webService = v23->_webService;
  v23->_webService = (PKPaymentWebService *)v26;

  objc_storeStrong((id *)&v23->_peerPaymentWebService, a11);
  objc_storeStrong((id *)&v23->_paymentServiceDataProvider, a12);
  v23->_detailViewStyle = a13;
  objc_storeStrong((id *)&v23->_familyCollection, a5);
  p_account = (id *)&v23->_account;
  objc_storeStrong((id *)&v23->_account, v70);
  objc_storeStrong((id *)&v23->_accountUserCollection, v72);
  -[PKAccountUserCollection accountUserForTransaction:](v23->_accountUserCollection, "accountUserForTransaction:", v23->_transaction);
  v29 = objc_claimAutoreleasedReturnValue();
  accountUser = v23->_accountUser;
  v23->_accountUser = (PKAccountUser *)v29;

  objc_storeStrong((id *)&v23->_bankConnectInstitution, a8);
  v31 = objc_msgSend(v20, "copy");
  physicalCards = v23->_physicalCards;
  v23->_physicalCards = (NSSet *)v31;

  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v33 = objc_claimAutoreleasedReturnValue();
  accountService = v23->_accountService;
  v23->_accountService = (PKAccountService *)v33;

  -[PKAccountService registerObserver:](v23->_accountService, "registerObserver:", v23);
  p_transactionSourceCollection = &v23->_transactionSourceCollection;
  -[PKTransactionSourceCollection paymentPass](v23->_transactionSourceCollection, "paymentPass");
  v35 = objc_claimAutoreleasedReturnValue();
  paymentPass = v23->_paymentPass;
  v23->_paymentPass = (PKPaymentPass *)v35;

  if (!v23->_paymentPass && *p_account)
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_account, "associatedPassUniqueID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "passWithUniqueID:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "paymentPass");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v23->_paymentPass;
    v23->_paymentPass = (PKPaymentPass *)v40;

  }
  v42 = -[PKPhysicalCardController initWithAccountService:paymentPass:account:accountUser:physicalCards:]([PKPhysicalCardController alloc], "initWithAccountService:paymentPass:account:accountUser:physicalCards:", v23->_accountService, v23->_paymentPass, *p_account, v23->_accountUser, v23->_physicalCards);
  physicalCardController = v23->_physicalCardController;
  v23->_physicalCardController = v42;

  v44 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
  transactionDateFormatter = v23->_transactionDateFormatter;
  v23->_transactionDateFormatter = v44;

  v19 = v68;
  v46 = objc_msgSend(v68, "bankConnectRoundTransactionDate");
  -[NSDateFormatter setDateStyle:](v23->_transactionDateFormatter, "setDateStyle:", 1);
  if ((v46 & 1) == 0)
    -[NSDateFormatter setTimeStyle:](v23->_transactionDateFormatter, "setTimeStyle:", 1);
  v47 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
  monthDayLocalFormatter = v23->_monthDayLocalFormatter;
  v23->_monthDayLocalFormatter = v47;

  -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v23->_monthDayLocalFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM d"));
  v49 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
  monthDayYearLocalFormatter = v23->_monthDayYearLocalFormatter;
  v23->_monthDayYearLocalFormatter = v49;

  -[NSDateFormatter setDateStyle:](v23->_monthDayYearLocalFormatter, "setDateStyle:", 1);
  objc_msgSend(v21, "addDelegate:", v23);
  objc_msgSend(v80, "addDelegate:", v23);
  objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "registerObserver:", v23);

  if (+[PKPaymentNotificationAppURLHelper applicationExistsToHandleNotificationsForPaymentPass:](PKPaymentNotificationAppURLHelper, "applicationExistsToHandleNotificationsForPaymentPass:", v23->_paymentPass))
  {
    v52 = objc_msgSend(v68, "isBankConnectTransaction") ^ 1;
  }
  else
  {
    v52 = 0;
  }
  v23->_issuerAppDeepLinkingEnabled = v52;
  v23->_inBridge = PKBridgeUsesDarkAppearance();
  v23->_allowTransactionLinks = a14;
  -[PKPaymentTransactionDetailViewController setTransaction:](v23, "setTransaction:", v68);
  v53 = objc_msgSend(v68, "transactionType");
  if (v53 == 3)
  {
    if (!objc_msgSend(v68, "peerPaymentStatus"))
    {
      -[PKPaymentTransaction serviceIdentifier](v23->_transaction, "serviceIdentifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v55, "length");
      PKLogFacilityTypeGetObject();
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
      if (v58)
      {
        if (v60)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v59, OS_LOG_TYPE_DEFAULT, "Fetching remote status for pending transaction.", buf, 2u);
        }

        -[PKPaymentTransactionDetailViewController _updatePeerPaymentTransactionStatusWithCompletion:](v23, "_updatePeerPaymentTransactionStatusWithCompletion:", 0);
      }
      else
      {
        if (v60)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v59, OS_LOG_TYPE_DEFAULT, "Not fetching remote status for pending transaction without a service identifier.", buf, 2u);
        }

      }
      goto LABEL_22;
    }
  }
  else if (v53 == 10)
  {
    objc_msgSend(v68, "payments");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "firstObject");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v55, "isCurrentlyCancellable"))
    {
      v56 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66C98]), "initWithTransactionType:transactionSourceCollection:paymentDataProvider:", 10, *p_transactionSourceCollection, 0);
      transactionFetcher = v23->_transactionFetcher;
      v23->_transactionFetcher = (PKDashboardTransactionFetcher *)v56;

      -[PKDashboardTransactionFetcher setDelegate:](v23->_transactionFetcher, "setDelegate:", v23);
    }
LABEL_22:

    v19 = v68;
  }
  objc_msgSend(MEMORY[0x1E0D66C30], "sharedInstance");
  v61 = objc_claimAutoreleasedReturnValue();
  coarseLocationMonitor = v23->_coarseLocationMonitor;
  v23->_coarseLocationMonitor = (PKCoarseLocationMonitor *)v61;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addObserver:selector:name:object:", v23, sel__handleCoarseLocationChangedNotification_, *MEMORY[0x1E0D69B78], v23->_coarseLocationMonitor);

  if (*p_account)
  {
    v64 = -[PKAccountServiceAccountResolutionController initWithAccount:accountUserCollection:transactionSourceCollection:]([PKAccountServiceAccountResolutionController alloc], "initWithAccount:accountUserCollection:transactionSourceCollection:", *p_account, v23->_accountUserCollection, *p_transactionSourceCollection);
    accountResolutionController = v23->_accountResolutionController;
    v23->_accountResolutionController = v64;

    -[PKAccountServiceAccountResolutionController setDelegate:](v23->_accountResolutionController, "setDelegate:", v23);
  }
  -[PKPaymentTransactionDetailViewController navigationItem](v23, "navigationItem");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "pkui_setupScrollEdgeChromelessAppearance");
  objc_msgSend(v66, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);

LABEL_26:
  return v23;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PKAccountService unregisterObserver:](self->_accountService, "unregisterObserver:", self);
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentTransactionDetailViewController;
  -[PKSectionTableViewController dealloc](&v4, sel_dealloc);
}

- (void)setTransaction:(id)a3
{
  id v5;
  PKPeerPaymentStatusResponse *peerPaymentStatusResponse;
  PKPaymentTransaction *associatedTransaction;
  PKTransactionReceipt *associatedReceipt;
  NSString *v9;
  NSString *transactionExplanation;
  void *v11;
  void *v12;
  NSTimeZone *v13;
  NSTimeZone *v14;
  NSDateFormatter *v15;
  NSDateFormatter *monthFormatter;
  NSDateFormatter *v17;
  NSDateFormatter *productTimeZoneMonthDayFormatter;
  void *v19;
  PKAccountService *accountService;
  void *v21;
  void *v22;
  void *v23;
  NSTimeZone *v24;
  NSTimeZone *productTimeZone;
  void *v26;
  NSDateFormatter *v27;
  NSDateFormatter *productTimeZoneFormatter;
  void *v29;
  void *v30;
  PKPaymentDataProvider *paymentServiceDataProvider;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  PKTransactionSourceCollection *transactionSourceCollection;
  void *v37;
  void *v38;
  void *v39;
  PKPaymentDataProvider *v40;
  NSObject *v41;
  PKTransactionSourceCollection *v42;
  void *v43;
  void *v44;
  PKPaymentDataProvider *v45;
  void *v46;
  PKPaymentRewardsBalance *v47;
  PKPaymentRewardsBalance *associatedPaymentRewardsBalance;
  PKPaymentDataProvider *v49;
  uint64_t v50;
  void *v51;
  PKAccountService *v52;
  PKPaymentDataProvider *v53;
  PKPaymentDataProvider *v54;
  PKPaymentTransaction *v55;
  PKPaymentTransaction *v56;
  PKPaymentTransaction **p_transaction;
  id *v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  _BYTE location[12];
  __int16 v76;
  PKTransactionSourceCollection *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_transaction = &self->_transaction;
  objc_storeStrong((id *)&self->_transaction, a3);
  peerPaymentStatusResponse = self->_peerPaymentStatusResponse;
  self->_peerPaymentStatusResponse = 0;

  associatedTransaction = self->_associatedTransaction;
  self->_associatedTransaction = 0;

  associatedReceipt = self->_associatedReceipt;
  self->_associatedReceipt = 0;

  self->_suppressReceiptImages = 0;
  -[PKPaymentTransactionDetailViewController _explanationTextForPaymentTransaction:](self, "_explanationTextForPaymentTransaction:", v5);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  transactionExplanation = self->_transactionExplanation;
  self->_transactionExplanation = v9;

  objc_msgSend(v5, "isMerchantTokenTransaction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v5, "recurringPeerPayment");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v59 = 0;
  }

  -[PKPaymentTransactionDetailViewController _recomputeLineItems](self, "_recomputeLineItems");
  -[PKPaymentTransactionDetailViewController _reloadTableHeaderView](self, "_reloadTableHeaderView");
  -[PKSectionTableViewController reloadData](self, "reloadData");
  if (objc_msgSend(v5, "transactionType") == 10
    && (-[PKPaymentTransaction isBankConnectTransaction](*p_transaction, "isBankConnectTransaction") & 1) == 0)
  {
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "productTimeZone");
    v24 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
    productTimeZone = self->_productTimeZone;
    self->_productTimeZone = v24;

    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    self->_showProductTimeZone = PKEqualObjects() ^ 1;

    if (self->_productTimeZone)
    {
      if (self->_showProductTimeZone)
      {
        v27 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
        productTimeZoneFormatter = self->_productTimeZoneFormatter;
        self->_productTimeZoneFormatter = v27;

        -[NSDateFormatter setDateStyle:](self->_productTimeZoneFormatter, "setDateStyle:", 1);
        -[NSDateFormatter setTimeStyle:](self->_productTimeZoneFormatter, "setTimeStyle:", 1);
        -[NSDateFormatter setTimeZone:](self->_productTimeZoneFormatter, "setTimeZone:", self->_productTimeZone);
        if (self->_showProductTimeZone)
          -[PKPaymentTransactionDetailViewController _reloadTableHeaderView](self, "_reloadTableHeaderView");
      }
    }
  }
  else if (objc_msgSend(v5, "transactionType", p_transaction) == 11 && objc_msgSend(v5, "accountType") == 2)
  {
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "productTimeZone");
    v13 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
    v14 = self->_productTimeZone;
    self->_productTimeZone = v13;

    v15 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    monthFormatter = self->_monthFormatter;
    self->_monthFormatter = v15;

    -[NSDateFormatter setTimeZone:](self->_monthFormatter, "setTimeZone:", self->_productTimeZone);
    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](self->_monthFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM"));
    v17 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    productTimeZoneMonthDayFormatter = self->_productTimeZoneMonthDayFormatter;
    self->_productTimeZoneMonthDayFormatter = v17;

    -[NSDateFormatter setTimeZone:](self->_productTimeZoneMonthDayFormatter, "setTimeZone:", self->_productTimeZone);
    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](self->_productTimeZoneMonthDayFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM d"));
    objc_msgSend(v5, "associatedStatementIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      objc_initWeak((id *)location, self);
      accountService = self->_accountService;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke;
      v73[3] = &unk_1E3E7ADD0;
      objc_copyWeak(&v74, (id *)location);
      -[PKAccountService creditStatementsForStatementIdentifiers:accountIdentifier:completion:](accountService, "creditStatementsForStatementIdentifiers:accountIdentifier:completion:", v21, v22, v73);

      objc_destroyWeak(&v74);
      objc_destroyWeak((id *)location);
    }
    else
    {
      self->_associatedCreditStatementsLoaded = 1;
      -[PKSectionTableViewController reloadData](self, "reloadData");
    }

  }
  objc_msgSend(v5, "identifier", p_transaction);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "associatedReceiptUniqueID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak((id *)location, self);
    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_5;
    v71[3] = &unk_1E3E7ADF8;
    objc_copyWeak(&v72, (id *)location);
    -[PKPaymentDataProvider transactionReceiptForTransactionWithIdentifier:updateIfNecessary:completion:](paymentServiceDataProvider, "transactionReceiptForTransactionWithIdentifier:updateIfNecessary:completion:", v29, 1, v71);
    objc_destroyWeak(&v72);
    objc_destroyWeak((id *)location);
  }
  if (self->_allowTransactionLinks)
  {
    if (objc_msgSend(v5, "adjustmentTypeReason") == 3
      || objc_msgSend(v5, "adjustmentType") == 9
      || objc_msgSend(v5, "adjustmentType") == 14)
    {
      objc_msgSend(v5, "referenceIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transactionSourceIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v33)
      {
        v35 = v33;
      }
      else
      {
        transactionSourceCollection = self->_transactionSourceCollection;
        objc_msgSend(v5, "transactionSourceIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTransactionSourceCollection transactionSourceForTransactionSourceIdentifier:](transactionSourceCollection, "transactionSourceForTransactionSourceIdentifier:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "transactionSourceIdentifiers");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "anyObject");
        v35 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (v32)
      {
        if (v35)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_initWeak((id *)location, self);
            v40 = self->_paymentServiceDataProvider;
            v69[0] = MEMORY[0x1E0C809B0];
            v69[1] = 3221225472;
            v69[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_7;
            v69[3] = &unk_1E3E7AE20;
            objc_copyWeak(&v70, (id *)location);
            -[PKPaymentDataProvider transactionWithServiceIdentifier:transactionSourceIdentifier:completion:](v40, "transactionWithServiceIdentifier:transactionSourceIdentifier:completion:", v32, v35, v69);
            objc_destroyWeak(&v70);
            objc_destroyWeak((id *)location);
          }
        }
        else
        {
          PKLogFacilityTypeGetObject();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = self->_transactionSourceCollection;
            *(_DWORD *)location = 138412546;
            *(_QWORD *)&location[4] = v5;
            v76 = 2112;
            v77 = v42;
            _os_log_impl(&dword_19D178000, v41, OS_LOG_TYPE_DEFAULT, "Error: the transaction source identifier was not defined for transaction %@ and transactionSourceCollection %@", location, 0x16u);
          }

        }
      }

LABEL_34:
      goto LABEL_35;
    }
    if (objc_msgSend(v5, "transactionType") == 1)
    {
      objc_msgSend(v5, "serviceIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_initWeak((id *)location, self);
        v49 = self->_paymentServiceDataProvider;
        v67[0] = MEMORY[0x1E0C809B0];
        v67[1] = 3221225472;
        v67[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_182;
        v67[3] = &unk_1E3E7AE20;
        objc_copyWeak(&v68, (id *)location);
        -[PKPaymentDataProvider transactionWithReferenceIdentifier:completion:](v49, "transactionWithReferenceIdentifier:completion:", v32, v67);
        objc_destroyWeak(&v68);
        objc_destroyWeak((id *)location);
      }
      goto LABEL_34;
    }
    if (!objc_msgSend(v5, "transactionType"))
    {
      objc_msgSend(v5, "referenceIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_initWeak((id *)location, self);
        v53 = self->_paymentServiceDataProvider;
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_3_186;
        v65[3] = &unk_1E3E62B38;
        objc_copyWeak(&v66, (id *)location);
        -[PKPaymentDataProvider installmentPlansWithTransactionReferenceIdentifier:completion:](v53, "installmentPlansWithTransactionReferenceIdentifier:completion:", v32, v65);
        objc_destroyWeak(&v66);
        objc_destroyWeak((id *)location);
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_initWeak((id *)location, self);
        v54 = self->_paymentServiceDataProvider;
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_5_194;
        v63[3] = &unk_1E3E62B38;
        objc_copyWeak(&v64, (id *)location);
        -[PKPaymentDataProvider transactionTagsForTransactionWithIdentifier:completion:](v54, "transactionTagsForTransactionWithIdentifier:completion:", v29, v63);
        objc_destroyWeak(&v64);
        objc_destroyWeak((id *)location);
      }
      if (v59)
      {
        PKPeerPaymentTransactionForRecurringPayment();
        v55 = (PKPaymentTransaction *)objc_claimAutoreleasedReturnValue();
        v56 = self->_associatedTransaction;
        self->_associatedTransaction = v55;

        -[PKSectionTableViewController reloadData](self, "reloadData");
      }
      goto LABEL_34;
    }
    if (objc_msgSend(v5, "transactionType") == 13)
    {
      objc_msgSend(v5, "referenceIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accountIdentifier");
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = (void *)v50;
      if (v32 && v50)
      {
        objc_initWeak((id *)location, self);
        v52 = self->_accountService;
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_7_196;
        v60[3] = &unk_1E3E696E8;
        objc_copyWeak(&v62, (id *)location);
        v61 = v32;
        -[PKAccountService accountWithIdentifier:completion:](v52, "accountWithIdentifier:completion:", v51, v60);

        objc_destroyWeak(&v62);
        objc_destroyWeak((id *)location);
      }

      goto LABEL_34;
    }
  }
LABEL_35:
  if ((PKHideCardBenefitRewards() & 1) == 0)
  {
    objc_msgSend(*v58, "paymentRewardsRedemption");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v43)
    {
      v45 = self->_paymentServiceDataProvider;
      objc_msgSend(v43, "balanceIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentDataProvider paymentRewardsBalanceWithIdentifier:](v45, "paymentRewardsBalanceWithIdentifier:", v46);
      v47 = (PKPaymentRewardsBalance *)objc_claimAutoreleasedReturnValue();
      associatedPaymentRewardsBalance = self->_associatedPaymentRewardsBalance;
      self->_associatedPaymentRewardsBalance = v47;

    }
  }

}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    WeakRetained[1386] = 1;
    v7 = WeakRetained;
    if (!*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 40), "allObjects");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_241);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_170);
      v5 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7[180];
      v7[180] = v5;

    }
    objc_msgSend(v7, "reloadData");
    WeakRetained = v7;
  }

}

BOOL __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  objc_msgSend(v2, "openingDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "closingDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

BOOL __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v4 = a3;
  objc_msgSend(a2, "openingDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openingDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6) == 1;
  return v7;
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_6;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateWithTransactionReceipt:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_8;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && (PKEqualObjects() & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "transactionType") == 14)
    {
      v3 = (void *)*((_QWORD *)WeakRetained + 176);
      objc_msgSend(*(id *)(a1 + 32), "referenceIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_9;
      v5[3] = &unk_1E3E65238;
      v5[4] = WeakRetained;
      objc_msgSend(v3, "installmentPlansWithTransactionReferenceIdentifier:completion:", v4, v5);

    }
    else
    {
      objc_storeStrong((id *)WeakRetained + 141, *(id *)(a1 + 32));
      objc_msgSend(WeakRetained, "_recomputeLineItems");
      objc_msgSend(WeakRetained, "reloadData");
    }
  }

}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_10;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1136);
  *(_QWORD *)(v3 + 1136) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_recomputeLineItems");
  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_182(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_2_183;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_2_183(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  char v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained + 141;
    v5 = WeakRetained;
    v4 = PKEqualObjects();
    WeakRetained = v5;
    if ((v4 & 1) == 0)
    {
      objc_storeStrong(v3, *(id *)(a1 + 32));
      objc_msgSend(v5, "_recomputeLineItems");
      objc_msgSend(v5, "reloadData");
      WeakRetained = v5;
    }
  }

}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_3_186(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_4_187;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_4_187(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("lastUpdated"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (WeakRetained && (PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong(WeakRetained + 142, v6);
    objc_msgSend(WeakRetained, "_recomputeLineItems");
    objc_msgSend(WeakRetained, "reloadData");
  }

}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_5_194(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_6_195;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_6_195(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateWithTransactionTags:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_7_196(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_8_197;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_8_197(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "creditDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installmentPlanWithIdentifier:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v6[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!WeakRetained)
      goto LABEL_7;
  }
  else
  {
    v5 = 0;
    if (!WeakRetained)
      goto LABEL_7;
  }
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong(WeakRetained + 142, v5);
    objc_msgSend(WeakRetained, "_recomputeLineItems");
    objc_msgSend(WeakRetained, "reloadData");
  }
LABEL_7:

}

- (void)_recomputeLineItems
{
  NSArray *v3;
  NSArray *lineItems;
  void *v5;
  void *v6;
  NSDateFormatter *v7;
  NSDateFormatter *v8;
  NSDateFormatter *transactionLocalTimeDateFormatter;
  PKPaymentTransactionDetailAmountLineItemGenerator *v10;

  v10 = objc_alloc_init(PKPaymentTransactionDetailAmountLineItemGenerator);
  -[PKPaymentTransactionDetailAmountLineItemGenerator lineItemsForTransaction:transactionSourceCollection:associatedTransaction:associatedReceipt:](v10, "lineItemsForTransaction:transactionSourceCollection:associatedTransaction:associatedReceipt:", self->_transaction, self->_transactionSourceCollection, self->_associatedTransaction, self->_associatedReceipt);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  lineItems = self->_lineItems;
  self->_lineItems = v3;

  -[PKPaymentTransaction timeZone](self->_transaction, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    self->_showTransactionTimeZone = 0;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_showTransactionTimeZone = PKEqualObjects() ^ 1;

  if (!self->_showTransactionTimeZone)
  {
LABEL_5:
    transactionLocalTimeDateFormatter = self->_transactionLocalTimeDateFormatter;
    self->_transactionLocalTimeDateFormatter = 0;

    goto LABEL_6;
  }
  v7 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
  v8 = self->_transactionLocalTimeDateFormatter;
  self->_transactionLocalTimeDateFormatter = v7;

  -[NSDateFormatter setDateStyle:](self->_transactionLocalTimeDateFormatter, "setDateStyle:", 1);
  -[NSDateFormatter setTimeStyle:](self->_transactionLocalTimeDateFormatter, "setTimeStyle:", 1);
  -[NSDateFormatter setTimeZone:](self->_transactionLocalTimeDateFormatter, "setTimeZone:", v5);
LABEL_6:

}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  PKPaymentTransactionDetailViewController *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;

  v3 = self;
  switch(a3)
  {
    case 0uLL:
      -[PKPaymentTransaction unansweredQuestions](self->_transaction, "unansweredQuestions");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v3) = objc_msgSend(v4, "count") != 0;
      goto LABEL_76;
    case 1uLL:
      v5 = -[PKPaymentTransaction disputeStatus](self->_transaction, "disputeStatus");
      if (!v5
        || v5 == 7 && (-[PKAccount hideEnhancedDisputeDetails](v3->_account, "hideEnhancedDisputeDetails") & 1) != 0)
      {
        goto LABEL_54;
      }
      LODWORD(v3) = -[PKAccount hideDisputeDetails](v3->_account, "hideDisputeDetails") ^ 1;
      return (char)v3;
    case 2uLL:
      -[PKPaymentTransaction altDSID](self->_transaction, "altDSID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[PKPaymentTransaction altDSID](v3->_transaction, "altDSID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        PKCurrentUserAltDSID();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 == v8)
        {
          if (-[PKPhysicalCardController hasExpiredPhysicalCardOnly](v3->_physicalCardController, "hasExpiredPhysicalCardOnly"))
          {
            v9 = -[PKPhysicalCardController canReplacePhysicalCard](v3->_physicalCardController, "canReplacePhysicalCard");
          }
          else
          {
            v9 = 0;
          }
          v8 = v7;
        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = -[PKPhysicalCardController hasExpiredPhysicalCardOnly](v3->_physicalCardController, "hasExpiredPhysicalCardOnly")&& -[PKPhysicalCardController canReplacePhysicalCard](v3->_physicalCardController, "canReplacePhysicalCard");
      }

      LOBYTE(v3) = -[PKPaymentTransaction effectiveTransactionSource](v3->_transaction, "effectiveTransactionSource") == 5
                && v9;
      return (char)v3;
    case 3uLL:
      v10 = -[PKPaymentTransaction transactionType](self->_transaction, "transactionType") == 15;
      goto LABEL_49;
    case 4uLL:
      return -[PKPaymentTransaction deviceScoreIdentifiersRequired](self->_transaction, "deviceScoreIdentifiersRequired");
    case 5uLL:
      LOBYTE(v3) = -[PKPaymentTransaction transactionType](self->_transaction, "transactionType") == 15;
      return (char)v3;
    case 6uLL:
      v12 = -[PKPaymentTransactionDetailViewController _numberOfRecognitionHintsRows](self, "_numberOfRecognitionHintsRows");
      goto LABEL_48;
    case 7uLL:
      -[PKPaymentTransaction preferredLocation](self->_transaction, "preferredLocation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        goto LABEL_57;
      -[PKPaymentTransaction startStationLocation](v3->_transaction, "startStationLocation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        LOBYTE(v3) = 1;
      }
      else
      {
        -[PKPaymentTransaction endStationLocation](v3->_transaction, "endStationLocation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v3) = v18 != 0;

      }
      goto LABEL_75;
    case 8uLL:
      if (-[PKPaymentTransaction effectiveTransactionSource](self->_transaction, "effectiveTransactionSource") != 3)
        goto LABEL_54;
      -[PKPaymentTransaction merchant](v3->_transaction, "merchant");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "originURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_61;
    case 9uLL:
      v10 = self->_associatedTransaction == 0;
      goto LABEL_49;
    case 0xAuLL:
      v15 = 1136;
      goto LABEL_21;
    case 0xBuLL:
      -[PKPaymentTransaction associatedFinancingPlan](self->_transaction, "associatedFinancingPlan");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    case 0xCuLL:
      if (!-[PKPaymentTransaction isIssuerInstallmentTransaction](self->_transaction, "isIssuerInstallmentTransaction"))goto LABEL_54;
      -[PKPaymentTransaction issuerInstallmentManagementURL](v3->_transaction, "issuerInstallmentManagementURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    case 0xDuLL:
      if ((PKHideCardBenefitRewards() & 1) != 0)
        goto LABEL_54;
      -[PKPaymentTransaction paymentRewardsRedemption](v3->_transaction, "paymentRewardsRedemption");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:
      LOBYTE(v3) = v16 != 0;

      return (char)v3;
    case 0xEuLL:
      if ((PKHideCardBenefitRewards() & 1) != 0)
        goto LABEL_54;
      -[PKPaymentTransaction paymentRewardsRedemption](v3->_transaction, "paymentRewardsRedemption");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "statusLink");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_61;
    case 0xFuLL:
      -[PKPaymentTransaction awards](self->_transaction, "awards");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "count"))
        goto LABEL_57;
      -[PKPaymentTransaction barcodeIdentifier](v3->_transaction, "barcodeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v17 = !v3->_issuerAppDeepLinkingEnabled;
        goto LABEL_62;
      }
      LOBYTE(v3) = 0;
      goto LABEL_65;
    case 0x10uLL:
      -[PKRetrieveMerchantTokensResponse merchantTokens](self->_merchantTokenResponse, "merchantTokens");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v4, "count"))
        goto LABEL_66;
      LOBYTE(v3) = v3->_associatedTransaction == 0;
      goto LABEL_76;
    case 0x11uLL:
      if (!PKIsPhone() || v3->_detailViewStyle || !_os_feature_enabled_impl())
        goto LABEL_54;
      v15 = 1288;
      goto LABEL_21;
    case 0x12uLL:
      if (!PKIsPhone() || v3->_detailViewStyle || !_os_feature_enabled_impl())
        goto LABEL_54;
      v15 = 1296;
      goto LABEL_21;
    case 0x13uLL:
      if (!PKIsPhone() || v3->_detailViewStyle || !_os_feature_enabled_impl())
        goto LABEL_54;
      v15 = 1280;
LABEL_21:
      v12 = objc_msgSend(*(id *)((char *)&v3->super.super.super.super.super.isa + v15), "count");
LABEL_48:
      v10 = v12 == 0;
LABEL_49:
      LOBYTE(v3) = !v10;
      return (char)v3;
    case 0x14uLL:
      v12 = -[PKPaymentTransactionDetailViewController _numberOfActionRowsEnabled](self, "_numberOfActionRowsEnabled");
      goto LABEL_48;
    case 0x15uLL:
      if (!+[PKReportIssueViewController canReportIssueForTransaction:bankConnectInstitution:paymentPass:](PKReportIssueViewController, "canReportIssueForTransaction:bankConnectInstitution:paymentPass:", self->_transaction, self->_bankConnectInstitution, self->_paymentPass))goto LABEL_54;
      return -[PKPaymentTransactionDetailViewController _showSeparateReportMerchantInfoButton](v3, "_showSeparateReportMerchantInfoButton");
    case 0x16uLL:
      -[PKPaymentTransaction serviceIdentifier](self->_transaction, "serviceIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v4, "length"))
        goto LABEL_66;
      if ((-[PKPaymentPass hasAssociatedPeerPaymentAccount](v3->_paymentPass, "hasAssociatedPeerPaymentAccount") & 1) != 0)
      {
LABEL_57:
        LOBYTE(v3) = 1;
      }
      else
      {
        -[PKTransactionSourceCollection transactionSourcesForType:](v3->_transactionSourceCollection, "transactionSourcesForType:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v3) = objc_msgSend(v13, "count") != 0;
LABEL_75:

      }
      goto LABEL_76;
    case 0x17uLL:
      return PKTransactionDebugDetailsEnabled();
    case 0x18uLL:
      -[PKPaymentTransactionDetailViewController transaction](self, "transaction");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "transactionType") == 15)
      {
        -[PKPaymentTransaction identifier](v3->_transaction, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_61:
        v17 = v14 == 0;
LABEL_62:
        LOBYTE(v3) = !v17;
LABEL_65:

      }
      else
      {
LABEL_66:
        LOBYTE(v3) = 0;
      }
LABEL_76:

      return (char)v3;
    default:
LABEL_54:
      LOBYTE(v3) = 0;
      return (char)v3;
  }
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentTransactionDetailViewController;
  -[PKSectionTableViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PKPaymentTransactionDetailViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionTitleValueLabelCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionDefaultCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionConfigurationCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionSubtitleCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionLocationMapCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionDetailLineItemCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionDateLineItemCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionReceiptLineItemCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionTransactionCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionQuestionCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionAwardCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionTransactionExplanationCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionRequestedDataReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionRequestedElementsDataReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionMerchantTokenDeletedCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionOrderCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionReceiptCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionBarcodeCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentRewardsRedemptionInfoCellReuseIdentifier"));
  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v3, "setEstimatedRowHeight:", 50.0);
  v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v3, "setTableFooterView:", v4);

  -[PKPaymentTransactionDetailViewController _reloadTableHeaderView](self, "_reloadTableHeaderView");
  -[PKPaymentTransactionDetailViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68138]);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentTransactionDetailViewController;
  -[PKPaymentTransactionDetailViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PKPaymentTransactionDetailViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackButtonDisplayMode:", 0);
  -[PKPaymentTransactionDetailViewController _fetchMerchantToken](self, "_fetchMerchantToken");
  if (PKIsPhone() && !self->_detailViewStyle && _os_feature_enabled_impl())
    -[PKPaymentTransactionDetailViewController _fetchAllApplePayOrderRowViewModels](self, "_fetchAllApplePayOrderRowViewModels");
  -[PKPaymentTransactionDetailViewController _fetchAppPrivacyURL](self, "_fetchAppPrivacyURL");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentTransactionDetailViewController;
  -[PKPaymentTransactionDetailViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (-[PKPaymentTransaction transactionType](self->_transaction, "transactionType") == 15)
  {
    objc_msgSend(MEMORY[0x1E0D66A58], "identityViewDidAppearReportEvent:", self->_transaction);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D66A58], "subject:sendEvent:", *MEMORY[0x1E0D69910], v4);

  }
}

- (void)_updatePeerPaymentTransactionStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PKPaymentTransactionDetailViewController _peerPaymentController](self, "_peerPaymentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction serviceIdentifier](self->_transaction, "serviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__PKPaymentTransactionDetailViewController__updatePeerPaymentTransactionStatusWithCompletion___block_invoke;
  v8[3] = &unk_1E3E7AE48;
  objc_copyWeak(&v10, &location);
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v5, "statusForPaymentIdentifier:withCompletion:", v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __94__PKPaymentTransactionDetailViewController__updatePeerPaymentTransactionStatusWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__PKPaymentTransactionDetailViewController__updatePeerPaymentTransactionStatusWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E6D8E8;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v5;
  v13 = v7;
  v14 = v6;
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v16);
}

void __94__PKPaymentTransactionDetailViewController__updatePeerPaymentTransactionStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  _QWORD v8[6];
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  objc_storeStrong(WeakRetained + 183, *(id *)(a1 + 32));
  if (*(_QWORD *)(a1 + 32))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __94__PKPaymentTransactionDetailViewController__updatePeerPaymentTransactionStatusWithCompletion___block_invoke_3;
    v8[3] = &unk_1E3E61388;
    v3 = *(_QWORD *)(a1 + 40);
    v8[4] = WeakRetained;
    v8[5] = v3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingOptions:animations:completion:", 6, v8, 0);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get updated remote status with error: %@", buf, 0xCu);
    }

  }
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
  {
    if (*(_QWORD *)(a1 + 32))
      v7 = *(_QWORD *)(a1 + 48) == 0;
    else
      v7 = 0;
    (*(void (**)(uint64_t, _BOOL8))(v6 + 16))(v6, v7);
  }

}

uint64_t __94__PKPaymentTransactionDetailViewController__updatePeerPaymentTransactionStatusWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_updateTableHeaderHeight");
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  return objc_msgSend(*(id *)(a1 + 40), "updateSectionVisibilityAndReloadIfNecessaryForSections:", &unk_1E3FAEB00);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  PKPaymentTransactionDetailHeaderView *headerView;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentTransactionDetailViewController;
  -[PKPaymentTransactionDetailViewController viewWillLayoutSubviews](&v7, sel_viewWillLayoutSubviews);
  -[PKPaymentTransactionDetailViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransactionDetailViewController _updateTableHeaderHeight](self, "_updateTableHeaderHeight");
  headerView = self->_headerView;
  -[PKPaymentTransactionDetailViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (headerView)
    objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v5);
  else
    objc_msgSend(v5, "_setManualScrollEdgeAppearanceProgress:", 1.0);

}

- (void)_reloadTableHeaderView
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  __CFString *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  NSDateFormatter *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  int v67;
  PKContactResolver *contactResolver;
  void *v69;
  uint64_t v70;
  double v71;
  void *v72;
  unint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  int v77;
  PKPaymentTransaction *transaction;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  id v83;
  NSDateFormatter *v84;
  void *v85;
  NSDateFormatter *transactionLocalTimeDateFormatter;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  NSDateFormatter *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  id v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  unint64_t v105;
  id v106;
  void *v107;
  id v108;
  id v109;
  NSDateFormatter *productTimeZoneFormatter;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  uint64_t v120;
  PKPaymentTransactionDetailHeaderView *v121;
  PKPaymentTransactionDetailHeaderView *v122;
  void *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  PKPaymentTransactionDetailHeaderView *v127;
  PKPaymentTransactionDetailHeaderView *headerView;
  void *v129;
  void *v130;
  void *v131;
  PKPaymentTransactionIconGenerator *v132;
  PKPaymentTransactionIconGenerator *v133;
  void *v134;
  void *v135;
  void *v136;
  _BOOL8 v137;
  PKPaymentTransactionIconGenerator *iconGenerator;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  BOOL v153;
  void *v154;
  id v155;
  id v156;
  void *v157;
  void *v158;
  NSDateFormatter *transactionDateFormatter;
  void *v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  unsigned int v164;
  void *v165;
  void *v166;
  void *v167;
  _QWORD aBlock[5];
  _QWORD v169[6];

  v3 = -[PKPaymentTransaction transactionType](self->_transaction, "transactionType");
  v4 = v3;
  switch(v3)
  {
    case 0:
      if (-[PKPaymentTransaction accountType](self->_transaction, "accountType") == 1)
      {
        -[PKPaymentTransaction payments](self->_transaction, "payments");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v17)
          goto LABEL_75;
        -[PKPaymentTransaction transfers](self->_transaction, "transfers");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v65, "count"))
        {

          goto LABEL_102;
        }
        -[PKPaymentTransaction referenceIdentifier](self->_transaction, "referenceIdentifier");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v74, "length");

        if (v75)
          goto LABEL_102;
      }
      if (-[PKPaymentTransaction associatedFeatureIdentifier](self->_transaction, "associatedFeatureIdentifier") != 3)
        goto LABEL_2;
      -[PKPaymentTransaction merchant](self->_transaction, "merchant");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "displayName");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v76;
      if (v76)
      {
        v53 = v76;
      }
      else
      {
        PKLocalizedCocoonString(CFSTR("APPLE_PAY_LATER"));
        v53 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_109;
    case 1:
    case 4:
    case 9:
    case 12:
    case 13:
    case 14:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
LABEL_2:
      -[PKPaymentTransaction merchant](self->_transaction, "merchant");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (self->_showRawName && (objc_msgSend(v5, "rawName"), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v8 = (void *)v7;
        objc_msgSend(v6, "rawName");
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v6, "displayName");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (!objc_msgSend(v9, "length"))
      {
        PKLocalizedPaymentString(CFSTR("PAYMENT_SUMMARY_NO_MERCHANT_TITLE"));
        v10 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v10;
      }
      -[PKPaymentTransaction displayLocation](self->_transaction, "displayLocation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      if (v12)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        -[PKPaymentTransaction displayLocation](self->_transaction, "displayLocation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@, %@"), v9, v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v15;
      }

      goto LABEL_111;
    case 2:
      v18 = -[PKPaymentTransaction transitModifiers](self->_transaction, "transitModifiers");
      v19 = -[PKPaymentTransaction transitType](self->_transaction, "transitType");
      v20 = v19;
      v161 = v4;
      v21 = 0;
      if ((v18 & 8) != 0)
      {
        if (v19 > 256)
        {
          v22 = CFSTR("MAGLEV_TRANSACTION_LIST_FARE_ADJUSTMENT");
          switch(v20)
          {
            case 257:
              v22 = CFSTR("SHINKANSEN_TRANSACTION_LIST_FARE_ADJUSTMENT");
              goto LABEL_203;
            case 258:
              goto LABEL_203;
            case 259:
              v22 = CFSTR("TAXI_TRANSACTION_LIST_FARE_ADJUSTMENT");
              goto LABEL_203;
            case 260:
              v22 = CFSTR("FERRY_TRANSACTION_LIST_FARE_ADJUSTMENT");
              goto LABEL_203;
            case 261:
              v22 = CFSTR("BIKE_TRANSACTION_LIST_FARE_ADJUSTMENT");
              goto LABEL_203;
            default:
              if (v20 == 1025)
              {
                v22 = CFSTR("GREEN_CAR_TRANSACTION_LIST_FARE_ADJUSTMENT");
              }
              else
              {
                if (v20 != 1026)
                  goto LABEL_204;
                v22 = CFSTR("METRO_UPGRADE_TRANSACTION_LIST_FARE_ADJUSTMENT");
              }
              break;
          }
          goto LABEL_203;
        }
        switch(v19)
        {
          case 1:
            v22 = CFSTR("TRANSIT_TRANSACTION_LIST_FARE_ADJUSTMENT");
            goto LABEL_203;
          case 2:
            v22 = CFSTR("METRO_TRANSACTION_LIST_FARE_ADJUSTMENT");
            goto LABEL_203;
          case 3:
            v22 = CFSTR("BUS_TRANSACTION_LIST_FARE_ADJUSTMENT");
            goto LABEL_203;
          case 4:
            v22 = CFSTR("TRAIN_TRANSACTION_LIST_FARE_ADJUSTMENT");
            goto LABEL_203;
          case 7:
            v22 = CFSTR("LIGHT_RAIL_TRANSACTION_LIST_FARE_ADJUSTMENT");
            goto LABEL_203;
          case 8:
            v22 = CFSTR("CABLE_CAR_TRANSACTION_LIST_FARE_ADJUSTMENT");
            goto LABEL_203;
          default:
            break;
        }
      }
      else
      {
        if ((v18 & 0x10) == 0)
          goto LABEL_204;
        if (v19 > 256)
        {
          v22 = CFSTR("MAGLEV_TRANSACTION_LIST_FARE_REBATE");
          switch(v20)
          {
            case 257:
              v22 = CFSTR("SHINKANSEN_TRANSACTION_LIST_FARE_REBATE");
              break;
            case 258:
              break;
            case 259:
              v22 = CFSTR("TAXI_TRANSACTION_LIST_FARE_REBATE");
              break;
            case 260:
              v22 = CFSTR("FERRY_TRANSACTION_LIST_FARE_REBATE");
              break;
            case 261:
              v22 = CFSTR("BIKE_TRANSACTION_LIST_FARE_REBATE");
              break;
            default:
              if (v20 == 1025)
              {
                v22 = CFSTR("GREEN_CAR_TRANSACTION_LIST_FARE_REBATE");
              }
              else
              {
                if (v20 != 1026)
                  goto LABEL_204;
                v22 = CFSTR("METRO_UPGRADE_TRANSACTION_LIST_FARE_REBATE");
              }
              break;
          }
LABEL_203:
          PKLocalizedPaymentString(&v22->isa);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_204;
        }
        switch(v19)
        {
          case 1:
            v22 = CFSTR("TRANSIT_TRANSACTION_LIST_FARE_REBATE");
            goto LABEL_203;
          case 2:
            v22 = CFSTR("METRO_TRANSACTION_LIST_FARE_REBATE");
            goto LABEL_203;
          case 3:
            v22 = CFSTR("BUS_TRANSACTION_LIST_FARE_REBATE");
            goto LABEL_203;
          case 4:
            v22 = CFSTR("TRAIN_TRANSACTION_LIST_FARE_REBATE");
            goto LABEL_203;
          case 7:
            v22 = CFSTR("LIGHT_RAIL_TRANSACTION_LIST_FARE_REBATE");
            goto LABEL_203;
          case 8:
            v22 = CFSTR("CABLE_CAR_TRANSACTION_LIST_FARE_REBATE");
            goto LABEL_203;
          default:
            break;
        }
      }
LABEL_204:
      -[PKPaymentTransaction startStation](self->_transaction, "startStation");
      v148 = objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction endStation](self->_transaction, "endStation");
      v149 = objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction displayLocation](self->_transaction, "displayLocation");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction merchant](self->_transaction, "merchant");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "displayName");
      v152 = (void *)objc_claimAutoreleasedReturnValue();

      if (v148)
        v153 = v149 == 0;
      else
        v153 = 1;
      if (!v153)
      {
        PKLocalizedPaymentString(CFSTR("TRANSIT_TRANSACTION_STATIONS_FORMAT"), CFSTR("%1$@%2$@"), v148, v149);
        v155 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_218;
      }
      if (v148 | v149)
      {
        if (v148)
          v154 = (void *)v148;
        else
          v154 = (void *)v149;
        v155 = v154;
LABEL_218:
        v9 = v155;
        if (v21)
          goto LABEL_220;
        goto LABEL_219;
      }
      if (objc_msgSend(v150, "length"))
      {
        v155 = v150;
        goto LABEL_218;
      }
      if (objc_msgSend(v152, "length"))
      {
        v155 = v152;
        goto LABEL_218;
      }
      if (!-[PKPaymentTransaction transactionSource](self->_transaction, "transactionSource")
        && (v20 == 516 || v20 == 513))
      {
        -[PKPaymentPass organizationName](self->_paymentPass, "organizationName");
        v155 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_218;
      }
      v9 = 0;
      if (!v21)
      {
LABEL_219:
        PKPaymentTransactionTransitSubtypeToLocalizedTitle();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
LABEL_220:
      v156 = v21;
      v157 = v156;
      if (v9)
      {
        if (v156)
        {
          if ((-[PKPaymentTransaction shouldSuppressDate](self->_transaction, "shouldSuppressDate") & 1) != 0)
          {
            v167 = 0;
          }
          else
          {
            transactionDateFormatter = self->_transactionDateFormatter;
            -[PKPaymentTransaction transactionDate](self->_transaction, "transactionDate");
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDateFormatter stringFromDate:](transactionDateFormatter, "stringFromDate:", v160);
            v167 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v158 = v157;
        }
        else
        {
          v158 = 0;
          v167 = 0;
        }
      }
      else
      {
        v158 = 0;
        v167 = 0;
        v9 = v156;
      }

      v29 = 0;
      v27 = 1;
      v4 = v161;
      v36 = v158;
      goto LABEL_113;
    case 3:
      v162 = v3;
      -[PKPaymentTransaction peerPaymentMemo](self->_transaction, "peerPaymentMemo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction recurringPeerPayment](self->_transaction, "recurringPeerPayment");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "memo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = v25 == 0;
      if (v25)
      {
        objc_msgSend(v25, "text");
        v28 = objc_claimAutoreleasedReturnValue();

        PKPeerPaymentRecurringPaymentMemoImage(v26, 80.0, 80.0);
        v29 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v28;
      }
      else
      {
        v29 = 0;
      }
      if (objc_msgSend(v23, "length"))
      {
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSACTION_DETAIL_MEMO_FORMAT"), CFSTR("%@"), v23);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          objc_msgSend(v24, "frequency");
          objc_msgSend(v24, "startDate");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          PKPeerPaymentRecurringPaymentFrequencyToLocalizedWeekdayString();
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          if (v50)
          {
            PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_PAYMENT_STATUS_CONCATENATED"), CFSTR("%@%@"), v9, v50);
            v51 = objc_claimAutoreleasedReturnValue();

            v9 = (id)v51;
          }

        }
      }
      else
      {
        -[PKPaymentTransaction peerPaymentCounterpartHandle](self->_transaction, "peerPaymentCounterpartHandle");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[PKPaymentTransaction peerPaymentPaymentMode](self->_transaction, "peerPaymentPaymentMode") == 2)
        {
          v59 = v58;
        }
        else
        {
          v66 = v27;
          v67 = -[PKContactResolver hasCachedResultForHandle:](self->_contactResolver, "hasCachedResultForHandle:", v58);
          contactResolver = self->_contactResolver;
          if (v67)
          {
            -[PKContactResolver contactForHandle:](contactResolver, "contactForHandle:", v58);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v169[0] = MEMORY[0x1E0C809B0];
            v169[1] = 3221225472;
            v169[2] = __66__PKPaymentTransactionDetailViewController__reloadTableHeaderView__block_invoke;
            v169[3] = &unk_1E3E69FC0;
            v169[4] = self;
            -[PKContactResolver contactForHandle:withCompletion:](contactResolver, "contactForHandle:withCompletion:", v58, v169);
            v69 = 0;
          }
          objc_msgSend(MEMORY[0x1E0D67400], "displayNameForCounterpartHandle:contact:", v58, v69);
          v59 = (id)objc_claimAutoreleasedReturnValue();

          v27 = v66;
        }
        v73 = -[PKPaymentTransaction peerPaymentType](self->_transaction, "peerPaymentType") - 1;
        if (v73 > 2)
        {
          v9 = 0;
        }
        else
        {
          PKLocalizedPeerPaymentString(&off_1E3E7B158[v73]->isa, CFSTR("%@"), v59);
          v9 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      v167 = 0;
      v36 = 0;
      v4 = v162;
      goto LABEL_113;
    case 5:
      -[PKPaymentTransaction transfers](self->_transaction, "transfers");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v30, "count"))
        goto LABEL_42;
      v31 = -[PKPaymentTransaction featureIdentifier](self->_transaction, "featureIdentifier");

      if (v31 != 5)
        goto LABEL_43;
      -[PKPaymentTransaction transfers](self->_transaction, "transfers");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "externalAccount");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "type");

      if (v34 == 2 && objc_msgSend(v30, "type") == 3)
      {
        -[PKPaymentTransaction featureIdentifier](self->_transaction, "featureIdentifier");
        PKLocalizedFeatureString();
        v9 = (id)objc_claimAutoreleasedReturnValue();

        if (v9)
          goto LABEL_111;
      }
      else
      {
LABEL_42:

      }
LABEL_43:
      v47 = -[PKPaymentTransaction secondaryFundingSourceType](self->_transaction, "secondaryFundingSourceType");
      if (v47)
      {
        if (v47 == 2)
        {
          v46 = CFSTR("TRANSACTION_TYPE_WITHDRAWAL_DEBIT");
        }
        else
        {
          if (v47 != 1)
            goto LABEL_47;
          v46 = CFSTR("TRANSACTION_TYPE_WITHDRAWAL_BANK_ACCOUNT");
        }
      }
      else
      {
LABEL_102:
        v46 = CFSTR("TRANSACTION_TYPE_WITHDRAWAL_GENERIC");
      }
      goto LABEL_103;
    case 6:
      if (-[PKPaymentTransaction isRecurring](self->_transaction, "isRecurring")
        && -[PKPaymentTransaction accountType](self->_transaction, "accountType") == 1)
      {
        PKLocalizedPeerPaymentRecurringString(CFSTR("TRANSACTION_DETAIL_SUBTITLE_AUTO_RELOAD"));
        v35 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v46 = CFSTR("TRANSACTION_TYPE_TOP_UP");
LABEL_103:
        PKLocalizedPaymentString(&v46->isa);
        v35 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_104;
    case 7:
      PKLocalizedTitleForTransactionWithAdjustment();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      PKLocalizedSubtitleForTransactionWithAdjustment();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v167 = 0;
      goto LABEL_112;
    case 8:
      -[PKPaymentTransaction merchantProvidedDescription](self->_transaction, "merchantProvidedDescription");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
      {
        v9 = v37;
      }
      else
      {
        -[PKPaymentTransaction merchant](self->_transaction, "merchant");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "displayName");
        v53 = (id)objc_claimAutoreleasedReturnValue();
LABEL_109:
        v9 = v53;

      }
      goto LABEL_111;
    case 10:
      if (!-[PKPaymentTransaction isBankConnectTransaction](self->_transaction, "isBankConnectTransaction"))goto LABEL_75;
      PKLocalizedBankConnectString(CFSTR("BANK_CONNECT_TRANSACTION_DETAILS_SUBTITLE_BILL_PAYMENT"));
      v35 = objc_claimAutoreleasedReturnValue();
      goto LABEL_104;
    case 11:
      v39 = -[PKPaymentTransaction accountType](self->_transaction, "accountType");
      if (v39 == 3)
      {
        -[PKPaymentTransaction featureIdentifier](self->_transaction, "featureIdentifier");
      }
      else if (v39 != 2)
      {
LABEL_47:
        v29 = 0;
        v167 = 0;
        v36 = 0;
        v9 = 0;
        goto LABEL_112;
      }
LABEL_75:
      PKLocalizedFeatureString();
      v35 = objc_claimAutoreleasedReturnValue();
LABEL_104:
      v9 = (id)v35;
LABEL_111:
      v29 = 0;
      v167 = 0;
      v36 = 0;
LABEL_112:
      v27 = 1;
      goto LABEL_113;
    case 15:
      v40 = v3;
      -[PKPaymentTransaction merchant](self->_transaction, "merchant");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (self->_showRawName && (objc_msgSend(v41, "rawName"), (v43 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v44 = (void *)v43;
        objc_msgSend(v42, "rawName");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v42, "displayName");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v48 = objc_msgSend(v45, "length");
      if (v48)
      {
        v9 = v45;
      }
      else
      {
        -[PKPaymentTransaction releasedData](self->_transaction, "releasedData");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "verificationType");

        PKTransactionReleasedDataVerificationTypeToLocalizedTitle();
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      -[PKPaymentTransaction displayLocation](self->_transaction, "displayLocation");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "length");

      if (v56)
      {
        -[PKPaymentTransaction displayLocation](self->_transaction, "displayLocation");
        v57 = objc_claimAutoreleasedReturnValue();
LABEL_69:
        v61 = (void *)v57;
        goto LABEL_70;
      }
      if (v48)
      {
        -[PKPaymentTransaction releasedData](self->_transaction, "releasedData");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "verificationType");

        PKTransactionReleasedDataVerificationTypeToLocalizedTitle();
        v57 = objc_claimAutoreleasedReturnValue();
        goto LABEL_69;
      }
      v61 = 0;
LABEL_70:
      if ((-[PKPaymentTransaction shouldSuppressDate](self->_transaction, "shouldSuppressDate") & 1) != 0)
      {
        v167 = 0;
        v36 = v61;
      }
      else
      {
        v62 = self->_transactionDateFormatter;
        -[PKPaymentTransaction transactionDate](self->_transaction, "transactionDate");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDateFormatter stringFromDate:](v62, "stringFromDate:", v63);
        v64 = objc_claimAutoreleasedReturnValue();

        v36 = v61;
        if (objc_msgSend(v61, "length"))
        {
          v167 = (void *)v64;
        }
        else
        {

          v167 = 0;
          v36 = (void *)v64;
        }
      }
      if (v42)
      {
        v70 = 0;
      }
      else
      {
        v71 = PKUIScreenScale();
        PKColorForMerchantCategory(v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        PKUIGenericBusinessIconImage(v72, 80.0, v71);
        v70 = objc_claimAutoreleasedReturnValue();

      }
      v27 = 1;
      v4 = v40;
      v29 = v70;
LABEL_113:
      v77 = -[PKPaymentTransaction isBankConnectTransaction](self->_transaction, "isBankConnectTransaction");
      transaction = self->_transaction;
      v166 = (void *)v29;
      if (v77)
      {
        v165 = v36;
        -[PKPaymentTransaction merchant](transaction, "merchant");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v79;
        if (self->_showRawName && (objc_msgSend(v79, "rawName"), (v81 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v82 = (void *)v81;
          objc_msgSend(v80, "rawName");
          v83 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v80, "displayName");
          v83 = (id)objc_claimAutoreleasedReturnValue();
          v82 = v83;
        }
        v114 = v83;

        -[PKPaymentTransaction localizedTypeDescription](self->_transaction, "localizedTypeDescription");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v164 = v27;
        v163 = v80;
        if (!objc_msgSend(v91, "length")
          || -[PKPaymentTransaction transactionType](self->_transaction, "transactionType") == 16)
        {
          PKLocalizedPaymentString(CFSTR("PAYMENT_SUMMARY_NO_MERCHANT_TITLE"));
          v92 = objc_claimAutoreleasedReturnValue();

          v91 = (void *)v92;
        }
        v93 = self->_transactionDateFormatter;
        -[PKPaymentTransaction transactionDate](self->_transaction, "transactionDate");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDateFormatter stringFromDate:](v93, "stringFromDate:", v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();

        v96 = objc_msgSend(v114, "length");
        if (v96)
          v97 = v114;
        else
          v97 = v91;
        v98 = v97;

        -[PKPaymentTransaction displayLocation](self->_transaction, "displayLocation");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend(v99, "length");

        if (v100)
        {
          v101 = (void *)MEMORY[0x1E0CB3940];
          -[PKPaymentTransaction displayLocation](self->_transaction, "displayLocation");
          v102 = v4;
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "stringWithFormat:", CFSTR("%@, %@"), v98, v103);
          v104 = objc_claimAutoreleasedReturnValue();

          v4 = v102;
          v9 = (id)v104;
        }
        else
        {
          v9 = v98;
        }
        v105 = -[PKPaymentTransaction transactionType](self->_transaction, "transactionType");
        if (v105 <= 0x16 && ((1 << v105) & 0x7EFF7D) != 0 && v96)
        {
          v106 = v91;

          v107 = v167;
          v167 = v95;
        }
        else
        {
          v106 = v95;
          v107 = v165;
        }
        v108 = v95;

        v109 = v106;
        v27 = v164;
        v113 = v163;
      }
      else
      {
        if ((-[PKPaymentTransaction shouldSuppressDate](transaction, "shouldSuppressDate") & 1) != 0)
          goto LABEL_145;
        if (!v36)
        {
          v84 = self->_transactionDateFormatter;
          -[PKPaymentTransaction transactionDate](self->_transaction, "transactionDate");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDateFormatter stringFromDate:](v84, "stringFromDate:", v85);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (v4 != 10 || !self->_showProductTimeZone)
        {
          if (!self->_showTransactionTimeZone)
            goto LABEL_145;
          v109 = v36;
          transactionLocalTimeDateFormatter = self->_transactionLocalTimeDateFormatter;
          -[PKPaymentTransaction transactionDate](self->_transaction, "transactionDate");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDateFormatter stringFromDate:](transactionLocalTimeDateFormatter, "stringFromDate:", v88);
          v89 = objc_claimAutoreleasedReturnValue();

          v113 = (void *)v89;
          -[PKPaymentTransaction timeZone](self->_transaction, "timeZone");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "abbreviation");
          v114 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v113, v114);
        }
        else
        {
          v109 = v36;
          productTimeZoneFormatter = self->_productTimeZoneFormatter;
          -[PKPaymentTransaction transactionDate](self->_transaction, "transactionDate");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDateFormatter stringFromDate:](productTimeZoneFormatter, "stringFromDate:", v111);
          v112 = objc_claimAutoreleasedReturnValue();

          v113 = (void *)v112;
          -[NSTimeZone abbreviation](self->_productTimeZone, "abbreviation");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v112, v114);
        }
        v91 = v167;
        v167 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v36 = v109;
LABEL_145:
      if (-[PKPaymentTransaction isBankConnectTransaction](self->_transaction, "isBankConnectTransaction"))
      {
        -[PKPaymentTransaction formattedBalanceAdjustmentAmount](self->_transaction, "formattedBalanceAdjustmentAmount");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = v166;
        goto LABEL_156;
      }
      v116 = v166;
      if (v4 == 2)
      {
        -[PKPaymentTransactionDetailViewController formattedBalanceAdjustmentAmountWithTransitDescriptors](self, "formattedBalanceAdjustmentAmountWithTransitDescriptors");
        v120 = objc_claimAutoreleasedReturnValue();
LABEL_153:
        v115 = (void *)v120;
        goto LABEL_156;
      }
      if (v4 != 3)
      {
        -[PKPaymentTransaction formattedBalanceAdjustmentAmount](self->_transaction, "formattedBalanceAdjustmentAmount");
        v120 = objc_claimAutoreleasedReturnValue();
        goto LABEL_153;
      }
      -[PKPaymentTransaction formattedBalanceAdjustmentSubtotalAmount](self->_transaction, "formattedBalanceAdjustmentSubtotalAmount");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = v117;
      if (v117)
      {
        v119 = v117;
      }
      else
      {
        -[PKPaymentTransaction formattedBalanceAdjustmentAmount](self->_transaction, "formattedBalanceAdjustmentAmount");
        v119 = (id)objc_claimAutoreleasedReturnValue();
      }
      v115 = v119;

LABEL_156:
      if (!objc_msgSend(v115, "length")
        && -[PKPaymentTransaction transactionType](self->_transaction, "transactionType") != 15)
      {
        headerView = self->_headerView;
        self->_headerView = 0;

        -[PKPaymentTransactionDetailViewController navigationItem](self, "navigationItem");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "setTitle:", v9);

        -[PKPaymentTransactionDetailViewController navigationController](self, "navigationController");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "navigationBar");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v131, "_setTitleOpacity:", 1.0);

        goto LABEL_176;
      }
      v121 = objc_alloc_init(PKPaymentTransactionDetailHeaderView);
      v122 = self->_headerView;
      self->_headerView = v121;

      -[PKPaymentTransactionDetailHeaderView setInBridge:](self->_headerView, "setInBridge:", self->_inBridge);
      -[PKPaymentTransactionDetailHeaderView setUseStroke:](self->_headerView, "setUseStroke:", v27);
      -[PKPaymentTransaction merchant](self->_transaction, "merchant");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "rawName");
      v124 = (void *)objc_claimAutoreleasedReturnValue();

      if (v124)
      {
        v125 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTransactionHeaderTapRecognizer_);
        -[PKPaymentTransactionDetailHeaderView addGestureRecognizer:](self->_headerView, "addGestureRecognizer:", v125);

      }
      v126 = objc_msgSend(v115, "length");
      v127 = self->_headerView;
      if (!v126)
      {
        -[PKPaymentTransactionDetailHeaderView setHasProminentSubtitle:](v127, "setHasProminentSubtitle:", 1);
        if (self->_iconGenerator)
        {
          if (!v116)
          {
LABEL_167:
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __66__PKPaymentTransactionDetailViewController__reloadTableHeaderView__block_invoke_3;
            aBlock[3] = &unk_1E3E75738;
            aBlock[4] = self;
            v134 = _Block_copy(aBlock);
            if (-[PKPaymentTransaction transactionType](self->_transaction, "transactionType") == 15)
            {
              if (-[PKPaymentTransaction transactionSource](self->_transaction, "transactionSource") == 2)
              {
                -[PKPaymentTransaction releasedData](self->_transaction, "releasedData");
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v135, "application");
                v136 = (void *)objc_claimAutoreleasedReturnValue();
                v137 = v136 != 0;

              }
              else
              {
                v137 = 0;
              }
              -[PKPaymentTransactionIconGenerator iconForTransaction:size:ignoreLogoURL:requestType:iconHandler:](self->_iconGenerator, "iconForTransaction:size:ignoreLogoURL:requestType:iconHandler:", self->_transaction, v137, 0, v134, 80.0, 80.0);
              v116 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              iconGenerator = self->_iconGenerator;
              -[PKPaymentTransaction merchant](self->_transaction, "merchant");
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKPaymentTransactionIconGenerator iconForMerchant:size:ignoreLogoURL:requestType:iconHandler:](iconGenerator, "iconForMerchant:size:ignoreLogoURL:requestType:iconHandler:", v139, 0, 0, v134, 80.0, 80.0);
              v116 = (void *)objc_claimAutoreleasedReturnValue();

            }
            if (!v116)
              goto LABEL_175;
          }
        }
        else
        {
          v132 = -[PKPaymentTransactionIconGenerator initWithCache:scale:]([PKPaymentTransactionIconGenerator alloc], "initWithCache:scale:", 1, PKUIScreenScale());
          v133 = self->_iconGenerator;
          self->_iconGenerator = v132;

          if (!v116)
            goto LABEL_167;
        }
        -[PKPaymentTransactionDetailHeaderView setMerchantIcon:](self->_headerView, "setMerchantIcon:", v116);
        goto LABEL_175;
      }
      -[PKPaymentTransactionDetailHeaderView setAmountText:](v127, "setAmountText:", v115);
      -[PKPaymentTransactionDetailHeaderView setMerchantIcon:](self->_headerView, "setMerchantIcon:", v116);
LABEL_175:
      -[PKPaymentTransactionDetailHeaderView setSubtitleText:](self->_headerView, "setSubtitleText:", v9);
      -[PKPaymentTransactionDetailHeaderView setSecondarySubtitleText:](self->_headerView, "setSecondarySubtitleText:", v36);
      -[PKPaymentTransactionDetailHeaderView setTertiarySubtitleText:](self->_headerView, "setTertiarySubtitleText:", v167);
      -[PKPaymentTransactionDetailViewController navigationItem](self, "navigationItem");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "setTitle:", 0);

      -[PKPaymentTransactionDetailViewController navigationItem](self, "navigationItem");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "setLargeTitleDisplayMode:", 2);
LABEL_176:

      if (-[PKPaymentTransaction transactionType](self->_transaction, "transactionType") == 15)
        -[PKPaymentTransactionDetailViewController _fetchDataReleaseTransactionConfiguration](self, "_fetchDataReleaseTransactionConfiguration");
      -[PKPaymentTransactionDetailViewController tableView](self, "tableView");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "setTableHeaderView:", self->_headerView);

      if (os_variant_has_internal_ui()
        && -[PKPaymentTransaction isBankConnectTransaction](self->_transaction, "isBankConnectTransaction"))
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ant.circle"));
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "imageWithRenderingMode:", 2);
        v143 = (void *)objc_claimAutoreleasedReturnValue();

        v144 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithImage:style:target:action:", v143, 0, self, sel__reportRadar);
        objc_msgSend(MEMORY[0x1E0DC3658], "purpleColor");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "setTintColor:", v145);

        -[PKPaymentTransactionDetailViewController navigationItem](self, "navigationItem");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "setRightBarButtonItem:", v144);

      }
      -[PKPaymentTransactionDetailViewController view](self, "view");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "setNeedsLayout");

      return;
    default:
      goto LABEL_47;
  }
}

void __66__PKPaymentTransactionDetailViewController__reloadTableHeaderView__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD block[5];

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__PKPaymentTransactionDetailViewController__reloadTableHeaderView__block_invoke_2;
    block[3] = &unk_1E3E612E8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __66__PKPaymentTransactionDetailViewController__reloadTableHeaderView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadTableHeaderView");
}

void __66__PKPaymentTransactionDetailViewController__reloadTableHeaderView__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__PKPaymentTransactionDetailViewController__reloadTableHeaderView__block_invoke_4;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __66__PKPaymentTransactionDetailViewController__reloadTableHeaderView__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1424), "setMerchantIcon:", *(_QWORD *)(a1 + 40));
}

- (void)_reportRadar
{
  void *v3;
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
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_ui())
  {
    if (-[PKPaymentTransaction isBankConnectTransaction](self->_transaction, "isBankConnectTransaction"))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0CB3940];
      -[PKPaymentTransaction identifier](self->_transaction, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("transaction_%@.txt"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "temporaryDirectory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URLByAppendingPathComponent:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x1E0CB36D8];
      -[PKPaymentTransaction dictionaryRepresentation](self->_transaction, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dataWithJSONObject:options:error:", v10, 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "createFileAtPath:contents:attributes:", v12, v11, 0);

      objc_msgSend(v8, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PKCreateTapToRadarURL();
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "openURL:options:completionHandler:", v15, MEMORY[0x1E0C9AA70], 0);

    }
  }
}

- (id)formattedBalanceAdjustmentAmountWithTransitDescriptors
{
  void *v3;
  PKPaymentTransaction *transaction;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  __CFString *v16;
  id v17;
  id v18;

  -[PKPaymentTransaction amount](self->_transaction, "amount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  transaction = self->_transaction;
  if (!v3)
  {
    -[PKPaymentTransaction amounts](transaction, "amounts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

    }
    else
    {
      -[PKPaymentTransaction plans](self->_transaction, "plans");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_10;
    }
    -[PKPaymentTransaction formattedStringForMultipleAmountsForPass:](self->_transaction, "formattedStringForMultipleAmountsForPass:", self->_paymentPass);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[PKPaymentTransaction formattedBalanceAdjustmentSubtotalAmount](transaction, "formattedBalanceAdjustmentSubtotalAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[PKPaymentTransaction formattedBalanceAdjustmentAmount](self->_transaction, "formattedBalanceAdjustmentAmount");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;

LABEL_10:
  if (-[PKPaymentTransaction isZeroTransaction](self->_transaction, "isZeroTransaction"))
  {
    -[PKPaymentTransaction plans](self->_transaction, "plans");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v12 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v12;
    }
  }
  v13 = -[PKPaymentTransaction transitType](self->_transaction, "transitType");
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v3, "isEqualToNumber:", v14);

  if (!v15
    || ((-[PKPaymentTransaction enRoute](self->_transaction, "enRoute") & 1) == 0
      ? ((-[PKPaymentTransaction transitModifiers](self->_transaction, "transitModifiers") & 1) != 0
       ? (v16 = CFSTR("TRANSIT_TRANSACTION_ANNOTATION_COMMUTE_DISCOUNT"))
       : v13 != 1025
       ? (-[PKPaymentTransaction transactionStatus](self->_transaction, "transactionStatus")
        ? (v16 = CFSTR("TRANSIT_TRANSACTION_FARE_FREE"))
        : (v16 = CFSTR("TRANSIT_TRANSACTION_PENDING")))
       : (v16 = CFSTR("TRANSIT_TRANSACTION_REDEEMED")))
      : (v16 = CFSTR("TRANSIT_TRANSACTION_EN_ROUTE")),
        PKLocalizedPaymentString(&v16->isa),
        (v17 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v17 = v9;
  }
  v18 = v17;

  return v18;
}

- (void)_handleTransactionHeaderTapRecognizer:(id)a3
{
  self->_showRawName ^= 1u;
  -[PKPaymentTransactionDetailViewController _reloadTableHeaderView](self, "_reloadTableHeaderView", a3);
}

- (void)_updateTableHeaderHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  PKPaymentTransactionDetailHeaderView *headerView;
  id v14;

  if (self->_headerView)
  {
    -[PKPaymentTransactionDetailViewController tableView](self, "tableView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v4 = v3;
    -[PKPaymentTransactionDetailHeaderView frame](self->_headerView, "frame");
    v6 = v5;
    v8 = v7;
    -[PKPaymentTransactionDetailHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v4, 1.79769313e308);
    if (v6 != v10 || v8 != v9)
    {
      v12 = v9;
      headerView = self->_headerView;
      objc_msgSend(v14, "_rectForTableHeaderView");
      -[PKPaymentTransactionDetailHeaderView setFrame:](headerView, "setFrame:");
      objc_msgSend(v14, "_tableHeaderHeightDidChangeToHeight:", v12);
    }

  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4))
  {
    case 0uLL:
    case 4uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 16uLL:
    case 21uLL:
    case 22uLL:
    case 24uLL:
      return 1;
    case 1uLL:
    case 2uLL:
    case 23uLL:
      return 2;
    case 3uLL:
      return -[PKPaymentTransactionDetailViewController _numberOfAmountDetailsRows](self, "_numberOfAmountDetailsRows");
    case 5uLL:
      return -[PKPaymentTransactionDetailViewController _numberOfDataReleaseRows](self, "_numberOfDataReleaseRows");
    case 6uLL:
      return -[PKPaymentTransactionDetailViewController _numberOfRecognitionHintsRows](self, "_numberOfRecognitionHintsRows");
    case 10uLL:
      v7 = 1136;
      return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "count");
    case 11uLL:
      -[PKPaymentTransaction associatedFinancingPlan](self->_transaction, "associatedFinancingPlan");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    case 12uLL:
      if (!-[PKPaymentTransaction isIssuerInstallmentTransaction](self->_transaction, "isIssuerInstallmentTransaction"))return 0;
      -[PKPaymentTransaction issuerInstallmentManagementURL](self->_transaction, "issuerInstallmentManagementURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    case 13uLL:
      if ((PKHideCardBenefitRewards() & 1) != 0)
        return 0;
      -[PKPaymentTransaction paymentRewardsRedemption](self->_transaction, "paymentRewardsRedemption");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
      v5 = v8 != 0;

      return v5;
    case 14uLL:
      if ((PKHideCardBenefitRewards() & 1) != 0)
        return 0;
      -[PKPaymentTransaction paymentRewardsRedemption](self->_transaction, "paymentRewardsRedemption");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "statusLink");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10 != 0;

      return v5;
    case 15uLL:
      -[PKPaymentTransaction awards](self->_transaction, "awards");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      return v12 + self->_issuerAppDeepLinkingEnabled;
    case 17uLL:
      v7 = 1288;
      return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "count");
    case 18uLL:
      v7 = 1296;
      return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "count");
    case 19uLL:
      v7 = 1280;
      return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "count");
    case 20uLL:
      return -[PKPaymentTransactionDetailViewController _numberOfActionRowsEnabled](self, "_numberOfActionRowsEnabled");
    default:
      return 0;
  }
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
  PKTransactionSourceCollection *transactionSourceCollection;
  PKPaymentTransaction *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;

  v6 = a3;
  v7 = a4;
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v7, "section")))
  {
    case 0uLL:
      -[PKPaymentTransactionDetailViewController _questionCellForTableView:atIndexPath:](self, "_questionCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 1uLL:
      -[PKPaymentTransactionDetailViewController _disputeStatusCellForTableView:atIndexPath:](self, "_disputeStatusCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 2uLL:
      -[PKPaymentTransactionDetailViewController _expiredPhysicalCardCellForTableView:atIndexPath:](self, "_expiredPhysicalCardCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 3uLL:
      -[PKPaymentTransactionDetailViewController _amountDetailsCellForTableView:atIndexPath:](self, "_amountDetailsCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 4uLL:
      -[PKPaymentTransactionDetailViewController _fraudRiskCellForTableView:](self, "_fraudRiskCellForTableView:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 5uLL:
      -[PKPaymentTransactionDetailViewController _releasedDataCellForTableView:atIndexPath:](self, "_releasedDataCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 6uLL:
      -[PKPaymentTransactionDetailViewController _recognitionHintsCellForTableView:atIndexPath:](self, "_recognitionHintsCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 7uLL:
      -[PKPaymentTransactionDetailViewController _merchantAddressCellForTableView:](self, "_merchantAddressCellForTableView:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 8uLL:
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionDefaultCellReuseIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction merchant](self->_transaction, "merchant");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "originURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "absoluteString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v13);

      objc_msgSend(v9, "setAccessoryType:", 1);
      break;
    case 9uLL:
      transactionSourceCollection = self->_transactionSourceCollection;
      v15 = self->_associatedTransaction;
      -[PKPaymentTransaction transactionSourceIdentifier](v15, "transactionSourceIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTransactionSourceCollection transactionSourceForTransactionSourceIdentifier:](transactionSourceCollection, "transactionSourceForTransactionSourceIdentifier:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKFamilyMemberCollection familyMemberForTransactionSource:](self->_familyCollection, "familyMemberForTransactionSource:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKPaymentTransactionTransactionCellReuseIdentifier"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransactionCellController configureCell:forTransaction:transactionSource:familyMember:account:detailStyle:deviceName:avatarViewDelegate:](self->_transactionCellController, "configureCell:forTransaction:transactionSource:familyMember:account:detailStyle:deviceName:avatarViewDelegate:", v9, v15, v17, v18, self->_account, 0, 0, 0);

      break;
    case 10uLL:
      -[PKPaymentTransactionDetailViewController _associatedInstallmentCellForTableView:atIndexPath:](self, "_associatedInstallmentCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 11uLL:
      -[PKPaymentTransactionDetailViewController _associatedFinancingPlanCellForTableView:atIndexPath:](self, "_associatedFinancingPlanCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 12uLL:
      -[PKPaymentTransactionDetailViewController _tableView:actionButtonCellForSection:](self, "_tableView:actionButtonCellForSection:", v6, 21);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentOffersString(CFSTR("VIEW_PAY_LATER_DETAILS"));
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 13uLL:
      -[PKPaymentTransactionDetailViewController _tableViewCellPaymentRewardsRedemptionInfoForTableView:atIndexPath:](self, "_tableViewCellPaymentRewardsRedemptionInfoForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 14uLL:
      -[PKPaymentTransactionDetailViewController _tableView:actionButtonCellForSection:](self, "_tableView:actionButtonCellForSection:", v6, 14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPayWithPointsString(CFSTR("TRANSACTION_DETAILS_VIEW_REDEMPTION_DETAILS_BUTTON_TITLE"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setText:", v22);

      objc_msgSend(v9, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F58]);
      break;
    case 15uLL:
      -[PKPaymentTransactionDetailViewController _tableView:cellForAwardAtIndex:](self, "_tableView:cellForAwardAtIndex:", v6, objc_msgSend(v7, "row"));
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 16uLL:
      -[PKPaymentTransactionDetailViewController _merchantTokenManagementCellForTableView:](self, "_merchantTokenManagementCellForTableView:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 17uLL:
      -[PKPaymentTransactionDetailViewController _applePayBarcodeRowCellForTableView:atIndexPath:](self, "_applePayBarcodeRowCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 18uLL:
      -[PKPaymentTransactionDetailViewController _applePayReceiptRowCellForTableView:atIndexPath:](self, "_applePayReceiptRowCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 19uLL:
      -[PKPaymentTransactionDetailViewController _applePayOrderRowCellForTableView:atIndexPath:](self, "_applePayOrderRowCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 20uLL:
      -[PKPaymentTransactionDetailViewController _tableView:cellForActionAtIndex:](self, "_tableView:cellForActionAtIndex:", v6, objc_msgSend(v7, "row"));
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 21uLL:
      -[PKPaymentTransactionDetailViewController _tableView:actionButtonCellForSection:](self, "_tableView:actionButtonCellForSection:", v6, 21);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_REPORT_MERCHANT_INFO_TITLE"));
      v20 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v23 = (void *)v20;
      objc_msgSend(v19, "setText:", v20);

      break;
    case 22uLL:
      -[PKPaymentTransactionDetailViewController _transactionIdentifierCellForTableView:](self, "_transactionIdentifierCellForTableView:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 23uLL:
      -[PKPaymentTransactionDetailViewController _debugDetailCellForTableView:atIndexPath:](self, "_debugDetailCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 24uLL:
      -[PKPaymentTransactionDetailViewController _tableViewCellForDeleteTransaction:](self, "_tableViewCellForDeleteTransaction:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_29:
      v9 = (void *)v8;
      break;
    default:
      v9 = 0;
      break;
  }
  if (self->_detailViewStyle == 2)
  {
    v24 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v25 = (void *)objc_msgSend(v24, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    PKBridgeAppearanceGetAppearanceSpecifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "tableViewCellHighlightColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBackgroundColor:", v27);

    objc_msgSend(v9, "setSelectedBackgroundView:", v25);
  }
  else
  {
    objc_msgSend(v9, "setSelectedBackgroundView:", 0);
  }

  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v9, "section")) == 3)
    -[PKPaymentTransactionDetailViewController _tableView:willDisplayAmountDetailsCell:atIndexPath:](self, "_tableView:willDisplayAmountDetailsCell:atIndexPath:", v10, v8, v9);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  PKPaymentTransaction *v11;
  void *v12;
  Class FKOrderDetailsViewControllerProviderClass;
  void *v14;
  void *v15;
  void *v16;
  PKPhysicalCardController *physicalCardController;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  PKPaymentTransactionDetailViewController *v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v7, "section")))
  {
    case 1uLL:
      if (objc_msgSend(v7, "row") == 1)
      {
        if (-[PKPaymentTransaction disputeStatus](self->_transaction, "disputeStatus") != 7
          || (-[PKPaymentTransaction disputeStatusDetails](self->_transaction, "disputeStatusDetails"),
              v8 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v8, "statusReasons"),
              v9 = (void *)objc_claimAutoreleasedReturnValue(),
              v10 = objc_msgSend(v9, "containsObject:", CFSTR("decisioned")),
              v9,
              v8,
              (v10 & 1) != 0))
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/en-us/HT212270"));
          v11 = (PKPaymentTransaction *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5600]), "initWithURL:", v11);
          objc_msgSend(v12, "setModalPresentationStyle:", 2);
          goto LABEL_10;
        }
        if (+[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat"))
        {
          -[PKPaymentTransactionDetailViewController _businessChatContextForUnavailableDisputeStatus](self, "_businessChatContextForUnavailableDisputeStatus");
          v11 = (PKPaymentTransaction *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentTransactionDetailViewController _openBusinessChatControllerForContext:](self, "_openBusinessChatControllerForContext:", v11);
          break;
        }
        -[PKPaymentTransactionDetailViewController _presentContactViewController](self, "_presentContactViewController");
      }
      goto LABEL_40;
    case 2uLL:
      if (objc_msgSend(v7, "row") == 1)
      {
        objc_initWeak(&location, self);
        physicalCardController = self->_physicalCardController;
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __78__PKPaymentTransactionDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke;
        v34[3] = &unk_1E3E798F0;
        objc_copyWeak(&v35, &location);
        -[PKPhysicalCardController replaceFlowViewControllerForReason:content:currentPhysicalCard:completion:](physicalCardController, "replaceFlowViewControllerForReason:content:currentPhysicalCard:completion:", 1, 0, 0, v34);
        objc_destroyWeak(&v35);
        objc_destroyWeak(&location);
      }
      goto LABEL_40;
    case 7uLL:
      -[PKPaymentTransactionDetailViewController _tableView:didSelectMechantAddressAtIndexPath:](self, "_tableView:didSelectMechantAddressAtIndexPath:", v6, v7);
      goto LABEL_40;
    case 8uLL:
      -[PKPaymentTransaction merchant](self->_transaction, "merchant");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "originURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v19, "scheme");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v19, 0);
          objc_msgSend(v21, "setScheme:", CFSTR("https"));
          objc_msgSend(v21, "URL");
          v22 = objc_claimAutoreleasedReturnValue();

          v19 = (void *)v22;
        }
        objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "openURL:configuration:completionHandler:", v19, 0, 0);

        goto LABEL_29;
      }
      goto LABEL_40;
    case 9uLL:
      v11 = self->_associatedTransaction;
      -[PKPaymentTransaction recurringPeerPayment](v11, "recurringPeerPayment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[PKPaymentTransactionDetailViewController _presentRecurringPeerPayment:](self, "_presentRecurringPeerPayment:", v12);
      }
      else
      {
        LOBYTE(v33) = 0;
        v31 = -[PKPaymentTransactionDetailViewController initWithTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:contactResolver:peerPaymentWebService:paymentServiceDataProvider:detailViewStyle:allowTransactionLinks:]([PKPaymentTransactionDetailViewController alloc], "initWithTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:contactResolver:peerPaymentWebService:paymentServiceDataProvider:detailViewStyle:allowTransactionLinks:", v11, self->_transactionSourceCollection, self->_familyCollection, self->_account, self->_accountUserCollection, self->_bankConnectInstitution, self->_physicalCards, self->_contactResolver, self->_peerPaymentWebService, self->_paymentServiceDataProvider, self->_detailViewStyle, v33);
        -[PKPaymentTransactionDetailViewController navigationController](self, "navigationController");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "pushViewController:animated:", v31, 1);

      }
      goto LABEL_38;
    case 10uLL:
      -[NSArray objectAtIndex:](self->_associatedInstallmentPlans, "objectAtIndex:", objc_msgSend(v7, "row"));
      v11 = (PKPaymentTransaction *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransactionDetailViewController _showInstallmentDetailsForAssociatedInstallment:](self, "_showInstallmentDetailsForAssociatedInstallment:", v11);
      break;
    case 11uLL:
      -[PKPaymentTransactionDetailViewController _showAssociatedFinancingPlanDetailsForIndexPath:](self, "_showAssociatedFinancingPlanDetailsForIndexPath:", v7);
      goto LABEL_40;
    case 12uLL:
      -[PKPaymentTransaction issuerInstallmentManagementURL](self->_transaction, "issuerInstallmentManagementURL");
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 14uLL:
      if ((PKHideCardBenefitRewards() & 1) != 0)
        goto LABEL_40;
      -[PKPaymentTransaction paymentRewardsRedemption](self->_transaction, "paymentRewardsRedemption");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "statusLink");
      v11 = (PKPaymentTransaction *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        -[PKPaymentRewardsBalance programURL](self->_associatedPaymentRewardsBalance, "programURL");
        v24 = objc_claimAutoreleasedReturnValue();
LABEL_22:
        v11 = (PKPaymentTransaction *)v24;
      }
      -[PKPaymentTransactionDetailViewController _openURL:](self, "_openURL:", v11);
      break;
    case 15uLL:
      v26 = objc_msgSend(v7, "row");
      -[PKPaymentTransaction awards](self->_transaction, "awards");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count");

      if (v26 >= v28)
      {
        v11 = 0;
      }
      else
      {
        -[PKPaymentTransaction awards](self->_transaction, "awards");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectAtIndex:", v26);
        v11 = (PKPaymentTransaction *)objc_claimAutoreleasedReturnValue();

      }
      -[PKPaymentTransactionDetailViewController _openOfferDetailsInIssuerApp:](self, "_openOfferDetailsInIssuerApp:", v11);
      break;
    case 16uLL:
      -[PKPaymentTransactionDetailViewController _didSelectMerchantTokenManagement](self, "_didSelectMerchantTokenManagement");
      goto LABEL_40;
    case 18uLL:
      -[NSArray objectAtIndexedSubscript:](self->_applePayReceiptRowViewModels, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "didSelectCell");
LABEL_29:

      goto LABEL_40;
    case 19uLL:
      -[NSArray objectAtIndexedSubscript:](self->_applePayOrderRowViewModels, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
      v11 = (PKPaymentTransaction *)objc_claimAutoreleasedReturnValue();
      FKOrderDetailsViewControllerProviderClass = getFKOrderDetailsViewControllerProviderClass();
      -[PKPaymentTransaction orderTypeIdentifier](v11, "orderTypeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction orderIdentifier](v11, "orderIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction fulfillmentIdentifier](v11, "fulfillmentIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class makeViewControllerWithOrderTypeIdentifier:orderIdentifier:fulfillmentIdentifier:](FKOrderDetailsViewControllerProviderClass, "makeViewControllerWithOrderTypeIdentifier:orderIdentifier:fulfillmentIdentifier:", v14, v15, v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
      -[PKPaymentTransactionDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
LABEL_38:

      break;
    case 20uLL:
      -[PKPaymentTransactionDetailViewController _tableView:didSelectActionAtIndexPath:](self, "_tableView:didSelectActionAtIndexPath:", v6, v7);
      goto LABEL_40;
    case 21uLL:
      -[PKPaymentTransactionDetailViewController _presentReportIssue](self, "_presentReportIssue");
      goto LABEL_40;
    case 23uLL:
      if (objc_msgSend(v7, "row") != 1)
        goto LABEL_40;
      v11 = -[PKTransactionDebugDetailsTabBarController initWithTransaction:transactionSourceCollection:]([PKTransactionDebugDetailsTabBarController alloc], "initWithTransaction:transactionSourceCollection:", self->_transaction, self->_transactionSourceCollection);
      -[PKPaymentTransactionDetailViewController navigationController](self, "navigationController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "pushViewController:animated:", v11, 1);

      break;
    case 24uLL:
      if (self->_deleteOverrider)
        -[PKPaymentTransactionDetailViewController _performDeleteOverride](self, "_performDeleteOverride");
      else
        -[PKPaymentTransactionDetailViewController _showDeleteConfirmationSheet](self, "_showDeleteConfirmationSheet");
      goto LABEL_40;
    default:
      goto LABEL_40;
  }

LABEL_40:
}

void __78__PKPaymentTransactionDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  PKNavigationController *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v8)
    {
      v7 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v8);
      -[PKNavigationController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 2);
LABEL_6:
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v7, 1, 0);

      goto LABEL_7;
    }
    if (v5)
    {
      v7 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  unint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  v6 = 0;
  switch(v5)
  {
    case 6uLL:
      v7 = CFSTR("TRANSACTION_SHOWN_ON_STATEMENT_AS_TITLE");
      goto LABEL_5;
    case 9uLL:
      if (-[PKPaymentTransaction transactionType](self->_associatedTransaction, "transactionType") == 1)
      {
        v7 = CFSTR("TRANSACTION_ASSOCIATED_REFUND_TITLE");
LABEL_5:
        PKLocalizedPaymentString(&v7->isa);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[PKPaymentTransaction recurringPeerPayment](self->_transaction, "recurringPeerPayment");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
LABEL_15:
          v6 = 0;
        }
        else
        {
          -[PKPaymentTransaction featureIdentifier](self->_transaction, "featureIdentifier");
          PKLocalizedFeatureString();
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      break;
    case 0xAuLL:
      PKLocalizedBeekmanString(CFSTR("INSTALLMENT_PLAN"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v6;
    case 0xBuLL:
      PKLocalizedCocoonString(CFSTR("PURCHASE_HEADER"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v6;
    case 0xDuLL:
      if ((PKHideCardBenefitRewards() & 1) != 0)
        goto LABEL_15;
      PKLocalizedPayWithPointsString(CFSTR("TRANSACTION_DETAILS_HEADER"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 0xFuLL:
      -[PKPaymentTransaction awards](self->_transaction, "awards");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (!v9)
        goto LABEL_15;
      PKLocalizedAquamanString(CFSTR("OFFERS_TITLE"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 0x13uLL:
      PKLocalizedOrderManagementString(CFSTR("TRANSACTION_ORDERS_TITLE"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v6;
    case 0x17uLL:
      v6 = CFSTR("Debug");
      return v6;
    default:
      return v6;
  }
  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  unint64_t v5;
  void *v6;
  PKPaymentTransaction *associatedTransaction;
  uint64_t v8;
  PKPaymentTransaction *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  BOOL v32;
  void *v33;
  void *v34;
  id v35;
  BOOL v36;
  void *v37;
  id v39;

  v5 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  v6 = 0;
  switch(v5)
  {
    case 3uLL:
      associatedTransaction = self->_associatedTransaction;
      if (!associatedTransaction)
      {
        if (-[PKPaymentTransactionDetailViewController _isPeerPaymentPendingRequestTransaction](self, "_isPeerPaymentPendingRequestTransaction"))
        {
          v13 = CFSTR("TRANSACTION_DETAIL_PENDING_REQUEST_FOOTER_TEXT");
          goto LABEL_9;
        }
        -[PKPaymentTransaction transfers](self->_transaction, "transfers");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "firstObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v26)
        {
          if (!-[PKPaymentPass isAppleCardPass](self->_paymentPass, "isAppleCardPass")
            || !-[PKPaymentTransactionDetailViewController _canShowAppleCardSupportFooterInAmountDetailsSection](self, "_canShowAppleCardSupportFooterInAmountDetailsSection"))
          {
LABEL_56:
            v6 = 0;
            return v6;
          }
          v36 = +[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat");
          -[PKPaymentPass localizedValueForFieldKey:](self->_paymentPass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADE8]);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v37;
          if (!v36 && objc_msgSend(v37, "length"))
          {
            PKLocalizedFeatureString();
            v19 = objc_claimAutoreleasedReturnValue();
            goto LABEL_22;
          }
          v6 = 0;
          goto LABEL_23;
        }
        v27 = -[PKPaymentTransaction transactionType](self->_transaction, "transactionType");
        -[PKPaymentTransaction transfers](self->_transaction, "transfers");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = -[PKPaymentTransaction transactionStatus](self->_transaction, "transactionStatus");
        objc_msgSend(v17, "externalAccount");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "type") != 1)
        {

          goto LABEL_58;
        }
        v31 = -[PKPaymentTransaction featureIdentifier](self->_transaction, "featureIdentifier");

        if (v31 != 5)
          goto LABEL_58;
        if (v27 == 6)
        {
          if (v29 > 1)
            goto LABEL_58;
        }
        else if (v27 != 5 || ((objc_msgSend(v17, "fundsAreAvailable") & 1) != 0 || v29 > 1) && v29 != 1)
        {
LABEL_58:
          v6 = 0;
LABEL_59:

          return v6;
        }
        PKLocalizedFeatureString();
        v18 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      v8 = -[PKPaymentTransaction transactionType](associatedTransaction, "transactionType");
      v9 = self->_associatedTransaction;
      if (v8 == 1)
      {
        -[PKPaymentTransaction merchant](v9, "merchant");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "displayName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("TRANSACTION_ASSOCIATED_REFUND_MESSAGE"), CFSTR("%@"), v11);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_44:

        goto LABEL_45;
      }
      -[PKPaymentTransaction transfers](v9, "transfers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v10, "externalAccount");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fundingDetails");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v11, "fundingDetails");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v24 = 0;
        }
        if (objc_msgSend(v24, "length"))
        {
          -[PKPaymentTransaction featureIdentifier](self->_transaction, "featureIdentifier");
          PKLocalizedFeatureString();
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v6 = 0;
        }

        goto LABEL_44;
      }
      if (-[PKPaymentTransaction featureIdentifier](self->_transaction, "featureIdentifier") == 2)
      {
        -[PKPaymentTransaction featureIdentifier](self->_transaction, "featureIdentifier");
        PKLocalizedFeatureString();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 0;
      }
      else
      {
        v10 = 0;
        v6 = 0;
      }
LABEL_45:

      if (-[PKPaymentPass isAppleCardPass](self->_paymentPass, "isAppleCardPass")
        && -[PKPaymentTransactionDetailViewController _canShowAppleCardSupportFooterInAmountDetailsSection](self, "_canShowAppleCardSupportFooterInAmountDetailsSection"))
      {
        v32 = +[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat");
        -[PKPaymentPass localizedValueForFieldKey:](self->_paymentPass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADE8]);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v33;
        if (!v32 && objc_msgSend(v33, "length"))
        {
          PKLocalizedFeatureString();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v6, "length", v14))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n%@"), v6, v34);
            v35 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v35 = v34;
          }
          v39 = v35;

          v6 = v39;
        }
LABEL_23:

      }
      return v6;
    case 4uLL:
      v13 = CFSTR("TRANSACTION_DETAIL_FRAUD_RISK_FOOTER_TEXT");
LABEL_9:
      PKLocalizedPeerPaymentString(&v13->isa);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 5uLL:
      if (-[PKPaymentTransaction transactionSource](self->_transaction, "transactionSource") != 2)
        goto LABEL_56;
      -[PKPaymentTransaction releasedData](self->_transaction, "releasedData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "application");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "usageDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_23;
    case 6uLL:
      v16 = +[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat");
      -[PKPaymentPass localizedValueForFieldKey:](self->_paymentPass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADE8]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[PKPaymentPass isAppleCardPass](self->_paymentPass, "isAppleCardPass")
        || !-[PKPaymentTransactionDetailViewController _canShowAppleCardSupportFooterInRecognitionHintsSection](self, "_canShowAppleCardSupportFooterInRecognitionHintsSection")|| v16|| !objc_msgSend(v17, "length"))
      {
        goto LABEL_58;
      }
      PKLocalizedFeatureString();
      v18 = objc_claimAutoreleasedReturnValue();
LABEL_16:
      v6 = (void *)v18;
      goto LABEL_59;
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
      return v6;
    case 0xEuLL:
      if ((PKHideCardBenefitRewards() & 1) != 0)
        goto LABEL_56;
      PKLocalizedPayWithPointsString(CFSTR("TRANSACTION_DETAILS_FOOTER"));
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    default:
      if (v5 != 20)
      {
        if (v5 == 21)
        {
          PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_REPORT_MERCHANT_INFO_FOOTER"));
          v12 = objc_claimAutoreleasedReturnValue();
LABEL_19:
          v6 = (void *)v12;
        }
        return v6;
      }
      if (!-[PKPaymentTransactionDetailViewController _actionRowIsEnabled:](self, "_actionRowIsEnabled:", 10))
        goto LABEL_56;
      -[PKPaymentPass organizationName](self->_paymentPass, "organizationName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_CONTACT_ISSUER_FOOTER"), CFSTR("%@"), v14);
      v19 = objc_claimAutoreleasedReturnValue();
LABEL_22:
      v6 = (void *)v19;
      goto LABEL_23;
  }
}

- (id)_coarseLocationHyperlinkFooterView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  PKFooterHyperlinkView *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  PKLocalizedPaymentString(CFSTR("COARSE_LOCATION_ENABLED_FOOTER_FORMAT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("COARSE_LOCATION_ENABLED_FOOTER_LINK_TEXT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKStringWithValidatedFormat();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeOfString:", v4, v4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8 = objc_alloc_init(PKFooterHyperlinkView);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Privacy&path=LOCATION"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKAttributedStringByAddingLinkToRange(v5, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFooterHyperlinkView setAttributedText:](v8, "setAttributedText:", v12);

    v13 = &__block_literal_global_46;
    -[PKFooterHyperlinkView setAction:](v8, "setAction:", &__block_literal_global_46);

    if (self->_detailViewStyle == 2)
    {
      PKBridgeAppearanceGetAppearanceSpecifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "footerHyperlinkColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKFooterHyperlinkView setLinkTextColor:](v8, "setLinkTextColor:", v15);

    }
  }

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4) == 7
    && -[PKCoarseLocationMonitor coarseLocationEnabled](self->_coarseLocationMonitor, "coarseLocationEnabled"))
  {
    -[PKPaymentTransactionDetailViewController _coarseLocationHyperlinkFooterView](self, "_coarseLocationHyperlinkFooterView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPaymentTransactionDetailViewController tableView:titleForFooterInSection:](self, "tableView:titleForFooterInSection:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      v7 = 0;
    }
    else
    {
      v9 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v7 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    }

  }
  return v7;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  double v7;
  void *v8;

  v6 = a3;
  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4) == 7
    && -[PKCoarseLocationMonitor coarseLocationEnabled](self->_coarseLocationMonitor, "coarseLocationEnabled"))
  {
    v7 = *MEMORY[0x1E0DC53D8];
  }
  else
  {
    -[PKPaymentTransactionDetailViewController tableView:titleForFooterInSection:](self, "tableView:titleForFooterInSection:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
      v7 = *MEMORY[0x1E0DC53D8];
    else
      v7 = 0.0;

  }
  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  id v6;

  -[PKPaymentTransactionDetailViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = 0;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v5 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }

  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v4;
  double v5;

  -[PKPaymentTransactionDetailViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    v5 = *MEMORY[0x1E0DC53D8];
  else
    v5 = 16.0;

  return v5;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  BOOL v6;
  BOOL v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = 0;
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v5, "section")))
  {
    case 1uLL:
    case 2uLL:
      v6 = objc_msgSend(v5, "row") == 1;
      break;
    case 7uLL:
      -[PKPaymentTransaction merchant](self->_transaction, "merchant");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "useRawMerchantData") & 1) != 0)
      {
        v6 = 0;
      }
      else
      {
        objc_msgSend(v9, "mapsMerchant");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v10, "identifier") != 0;

      }
      break;
    case 8uLL:
    case 9uLL:
    case 10uLL:
    case 11uLL:
    case 12uLL:
    case 14uLL:
    case 18uLL:
    case 19uLL:
    case 21uLL:
    case 23uLL:
    case 24uLL:
      v6 = 1;
      break;
    case 15uLL:
      v8 = !self->_issuerAppDeepLinkingEnabled;
      goto LABEL_7;
    case 16uLL:
      v8 = self->_merchantTokenResponse == 0;
LABEL_7:
      v6 = !v8;
      break;
    case 20uLL:
      v6 = -[PKPaymentTransactionDetailViewController _shouldHighlightAction:](self, "_shouldHighlightAction:", -[PKPaymentTransactionDetailViewController _actionRowForRowIndex:](self, "_actionRowForRowIndex:", objc_msgSend(v5, "row")));
      break;
    default:
      break;
  }

  return v6;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  void *v6;

  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(a4, "section", a3, a5.x, a5.y)) == 22)
  {
    -[PKPaymentTransactionDetailViewController contextMenuConfigurationForTransactionIdentifier](self, "contextMenuConfigurationForTransactionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)contextMenuConfigurationForTransactionIdentifier
{
  void *v3;
  void *v4;

  -[PKPaymentTransactionDetailViewController _transactionIdentifierDescription](self, "_transactionIdentifierDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransactionDetailViewController contextMenuConfigurationForCopyingText:](self, "contextMenuConfigurationForCopyingText:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)contextMenuConfigurationForCopyingText:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[4];
  id v9;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKPaymentTransactionDetailViewController_contextMenuConfigurationForCopyingText___block_invoke;
  aBlock[3] = &unk_1E3E6D5A8;
  v9 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __83__PKPaymentTransactionDetailViewController_contextMenuConfigurationForCopyingText___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
    return 0;
  v2 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedString(CFSTR("MENU_ACTION_COPY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__PKPaymentTransactionDetailViewController_contextMenuConfigurationForCopyingText___block_invoke_2;
  v9[3] = &unk_1E3E6D580;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, 0, 0, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0DC39D0];
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuWithTitle:children:", &stru_1E3E7D690, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __83__PKPaymentTransactionDetailViewController_contextMenuConfigurationForCopyingText___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setString:", *(_QWORD *)(a1 + 32));

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSComparisonResult v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentTransactionDetailViewController;
  -[PKPaymentTransactionDetailViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[PKPaymentTransactionDetailViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = UIContentSizeCategoryCompareToCategory(v6, v7);

    if (v8)
      -[PKPaymentTransactionDetailViewController _reloadTableHeaderView](self, "_reloadTableHeaderView");
  }

}

- (id)_peerPaymentController
{
  PKPeerPaymentController *lazyPeerPaymentController;
  PKPeerPaymentController *v4;
  PKPeerPaymentController *v5;

  lazyPeerPaymentController = self->_lazyPeerPaymentController;
  if (!lazyPeerPaymentController)
  {
    v4 = (PKPeerPaymentController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D673F8]), "initWithPeerPaymentWebService:", self->_peerPaymentWebService);
    v5 = self->_lazyPeerPaymentController;
    self->_lazyPeerPaymentController = v4;

    lazyPeerPaymentController = self->_lazyPeerPaymentController;
  }
  return lazyPeerPaymentController;
}

- (id)_explanationTextForPaymentTransaction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;

  v4 = a3;
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "transactionType") != 10)
  {
    v8 = 0;
    goto LABEL_42;
  }
  v6 = objc_msgSend(v5, "transactionStatus");
  v7 = v6;
  if (!v6)
  {
    PKDynamicLocalizedAppleCardString(CFSTR("TRANSACTION_DETAIL_BILL_PAYMENT_EXPLANATION_PENDING"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (v6 != 5)
  {
    v8 = 0;
LABEL_9:
    objc_msgSend(v5, "payments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "expectedCreditReleaseDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accountSummary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "availableCredit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "compare:", v14) == -1 || -[PKAccount state](self->_account, "state") == 1;

    }
    else
    {
      v16 = -[PKAccount state](self->_account, "state") == 1;
    }
    if (v7 == 2 || !v16)
      goto LABEL_41;
    if (!v11 || (-[PKAccount hideBillPaymentHoldTime](self->_account, "hideBillPaymentHoldTime") & 1) != 0)
    {
      objc_msgSend(v10, "fundingSource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "type");

      if (v18 != 1)
        goto LABEL_41;
      PKDynamicLocalizedAppleCardString(CFSTR("TRANSACTION_DETAIL_BILL_PAYMENT_EXPLANATION_CREDIT_RELEASE_GENERIC"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
        goto LABEL_41;
LABEL_37:
      objc_msgSend(v8, "stringByAppendingString:", CFSTR(" "));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringByAppendingString:", v19);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      if (v27)
        v29 = (void *)v27;
      else
        v29 = v19;
      v30 = v29;

      v8 = v30;
      goto LABEL_41;
    }
    objc_msgSend(v5, "transactionDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = PKDateRangeNumberOfIntervalsForUnit();

    if (v21 < 1)
    {
LABEL_41:

      goto LABEL_42;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "compare:", v11) != -1)
    {
      -[NSDateFormatter stringFromDate:](self->_monthDayYearLocalFormatter, "stringFromDate:", v11);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      PKDynamicLocalizedAppleCardString(CFSTR("TRANSACTION_DETAIL_BILL_PAYMENT_EXPLANATION_CREDIT_RELEASED"), CFSTR("%1$@"), v23);
LABEL_25:
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_36;
    }
    v24 = PKDateRangeNumberOfIntervalsForUnit();
    if (v24)
    {
      if (v24 <= 5)
      {
        -[NSDateFormatter stringFromDate:](self->_monthDayLocalFormatter, "stringFromDate:", v11);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        PKDynamicLocalizedAppleCardString(CFSTR("TRANSACTION_DETAIL_BILL_PAYMENT_EXPLANATION_CREDIT_RELEASE_DATE"), CFSTR("%1$@"), v23);
        goto LABEL_25;
      }
      if ((unint64_t)v24 > 9)
      {
        if ((unint64_t)v24 > 0x11)
          v25 = CFSTR("TRANSACTION_DETAIL_BILL_PAYMENT_EXPLANATION_CREDIT_RELEASE_GENERIC");
        else
          v25 = CFSTR("TRANSACTION_DETAIL_BILL_PAYMENT_EXPLANATION_CREDIT_RELEASE_HOLD_2");
      }
      else
      {
        v25 = CFSTR("TRANSACTION_DETAIL_BILL_PAYMENT_EXPLANATION_CREDIT_RELEASE_HOLD_1");
      }
    }
    else
    {
      v25 = CFSTR("TRANSACTION_DETAIL_BILL_PAYMENT_EXPLANATION_CREDIT_RELEASE_DATE_TODAY");
    }
    PKDynamicLocalizedAppleCardString(&v25->isa);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:

    if (v19)
      goto LABEL_37;
    goto LABEL_41;
  }
  PKDynamicLocalizedAppleCardString(CFSTR("TRANSACTION_DETAIL_BILL_PAYMENT_EXPLANATION_CANCELED"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_42:

  return v8;
}

- (id)_formattedCounterpartNameForRecurringPayment:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "recipientAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C97298]);
  objc_msgSend(MEMORY[0x1E0D67400], "requiredContactKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C60]), "initWithContactStore:keysToFetch:", v4, v5);
  objc_msgSend(v6, "contactForHandle:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D67400], "displayNameForCounterpartHandle:contact:", v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_transactionIsTaggedAsRecurring
{
  return -[NSSet pk_hasObjectPassingTest:](self->_transactionTags, "pk_hasObjectPassingTest:", &__block_literal_global_468);
}

BOOL __75__PKPaymentTransactionDetailViewController__transactionIsTaggedAsRecurring__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 1;
}

- (void)_updateWithTransactionReceipt:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_associatedReceipt, a3);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v5, "lineItems", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "image");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v12 = 0;
            goto LABEL_12;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
    v12 = 1;
LABEL_12:

    self->_suppressReceiptImages = v12;
    -[PKPaymentTransactionDetailViewController _recomputeLineItems](self, "_recomputeLineItems");
    -[PKSectionTableViewController reloadData](self, "reloadData");
  }

}

- (void)_updateWithTransactionTags:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_transactionTags, a3);
    -[PKSectionTableViewController updateSectionVisibilityAndReloadIfNecessaryForSection:](self, "updateSectionVisibilityAndReloadIfNecessaryForSection:", 6);
  }

}

- (void)_performPeerPaymentAction:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  -[PKPaymentTransaction serviceIdentifier](self->_transaction, "serviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransactionDetailViewController _peerPaymentController](self, "_peerPaymentController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__PKPaymentTransactionDetailViewController__performPeerPaymentAction_withCompletion___block_invoke;
  v13[3] = &unk_1E3E7AED8;
  objc_copyWeak(&v17, &location);
  v10 = v6;
  v14 = v10;
  v11 = v9;
  v15 = v11;
  v12 = v7;
  v16 = v12;
  objc_msgSend(v11, "performAction:withPaymentIdentifier:completion:", v10, v8, v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __85__PKPaymentTransactionDetailViewController__performPeerPaymentAction_withCompletion___block_invoke(id *a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14[2];
  char v15;

  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PKPaymentTransactionDetailViewController__performPeerPaymentAction_withCompletion___block_invoke_2;
  block[3] = &unk_1E3E7AEB0;
  v10 = v7;
  v8 = v7;
  objc_copyWeak(v14, a1 + 7);
  v15 = a2;
  v11 = a1[4];
  v12 = a1[5];
  v13 = a1[6];
  v14[1] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v14);
}

void __85__PKPaymentTransactionDetailViewController__performPeerPaymentAction_withCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = *(id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!*(_BYTE *)(a1 + 80) && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v12, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6B2D8]))
    {
LABEL_12:

      goto LABEL_13;
    }
    v6 = objc_msgSend(v4, "code");

    if (!v6)
    {
      v7 = *(_QWORD *)(a1 + 40);
      if (v7 == *MEMORY[0x1E0D6B0E8])
      {
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACCEPT_MONEY_GENERIC_ERROR_TITLE"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("PEER_PAYMENT_ACCEPT_MONEY_GENERIC_ERROR_MESSAGE");
        goto LABEL_11;
      }
      if (v7 == *MEMORY[0x1E0D6B0F8])
      {
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_REJECT_MONEY_GENERIC_ERROR_TITLE"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("PEER_PAYMENT_REJECT_MONEY_GENERIC_ERROR_MESSAGE");
        goto LABEL_11;
      }
      if (v7 == *MEMORY[0x1E0D6B0F0])
      {
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CANCEL_MONEY_GENERIC_ERROR_TITLE"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("PEER_PAYMENT_CANCEL_MONEY_GENERIC_ERROR_MESSAGE");
LABEL_11:
        PKLocalizedPeerPaymentString(&v8->isa);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        PKDisplayableErrorCustom();
        v10 = objc_claimAutoreleasedReturnValue();

        v12 = (id)v10;
        goto LABEL_12;
      }
    }
LABEL_13:
    objc_msgSend(WeakRetained, "_handlePeerPaymentDisplayableError:withPeerPaymentController:", v12, *(_QWORD *)(a1 + 48));

  }
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v11 + 16))(v11, *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32));

}

- (void)_handlePeerPaymentDisplayableError:(id)a3 withPeerPaymentController:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_msgSend(MEMORY[0x1E0D673F8], "proposedResolutionForError:", v6);
    switch(v8)
    {
      case 1:
        objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = PKAlertForDisplayableErrorWithHandlers(v10, 0, &__block_literal_global_487_0, 0);
        -[PKPaymentTransactionDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

        v6 = v10;
        break;
      case 3:
        PKLogFacilityTypeGetObject();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Displaying identity verification flow...", v14, 2u);
        }

        if ((PKDeviceSupportsPeerPaymentIdentityVerification() & 1) != 0)
        {
          objc_msgSend(v7, "handleIdentityVerificationWithError:completion:", v6, &__block_literal_global_485);
        }
        else
        {
          PKCreateAlertControllerForPeerPaymentIdentityVerificationNotSupported(0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentTransactionDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);

        }
        break;
      case 2:
        PKLogFacilityTypeGetObject();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Displaying terms acceptance flow...", buf, 2u);
        }

        objc_msgSend(v7, "handleTermsAcceptanceRequiredWithError:completion:", v6, &__block_literal_global_483);
        break;
    }
  }

}

void __105__PKPaymentTransactionDetailViewController__handlePeerPaymentDisplayableError_withPeerPaymentController___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Terms acceptance flow appeared with success: %d", (uint8_t *)v4, 8u);
  }

}

void __105__PKPaymentTransactionDetailViewController__handlePeerPaymentDisplayableError_withPeerPaymentController___block_invoke_484(uint64_t a1, int a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Identity verification flow appeared with success: %d", (uint8_t *)v4, 8u);
  }

}

- (void)_fetchMerchantToken
{
  PKRetrieveMerchantTokensResponse *merchantTokenResponse;
  id v4;
  void *v5;
  void *v6;
  PKPaymentWebService *webService;
  id v8;
  _QWORD v9[5];
  id v10;
  id location;

  -[PKPaymentTransaction isMerchantTokenTransaction](self->_transaction, "isMerchantTokenTransaction");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "BOOLValue"))
  {
    merchantTokenResponse = self->_merchantTokenResponse;

    if (!merchantTokenResponse)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0D675B0]);
      -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPass:", v5);

      -[PKPaymentTransaction panIdentifier](self->_transaction, "panIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMerchantTokenId:", v6);

      objc_initWeak(&location, self);
      webService = self->_webService;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __63__PKPaymentTransactionDetailViewController__fetchMerchantToken__block_invoke;
      v9[3] = &unk_1E3E7AF60;
      objc_copyWeak(&v10, &location);
      v9[4] = self;
      -[PKPaymentWebService retrieveMerchantTokensWithRequest:completion:](webService, "retrieveMerchantTokensWithRequest:completion:", v4, v9);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);

    }
  }
  else
  {

  }
}

void __63__PKPaymentTransactionDetailViewController__fetchMerchantToken__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__PKPaymentTransactionDetailViewController__fetchMerchantToken__block_invoke_2;
  v9[3] = &unk_1E3E65CC0;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = v6;
  v11 = v5;
  v12 = *(_QWORD *)(a1 + 32);
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
}

void __63__PKPaymentTransactionDetailViewController__fetchMerchantToken__block_invoke_2(uint64_t a1)
{
  char *WeakRetained;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v14 = WeakRetained;
      PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKEN_TRANSACTION_REQUEST_FAILED_SHEET_TITLE"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKEN_TRANSACTION_REQUEST_FAILED_SHEET_MESSAGE"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKEN_TRANSACTION_REQUEST_FAILED_SHEET_DISMISS"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v6, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAction:", v8);

      if (v7)
        objc_msgSend(v14, "presentViewController:animated:completion:", v7, 1, 0);

      goto LABEL_6;
    }
    v9 = *(void **)(a1 + 40);
    if (v9)
    {
      v10 = (id *)(WeakRetained + 1272);
      if (!v3[159])
      {
        v14 = v3;
        objc_storeStrong(v10, v9);
        objc_msgSend(*(id *)(a1 + 40), "merchantTokens");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12)
          v13 = 16;
        else
          v13 = 3;
        objc_msgSend(*(id *)(a1 + 48), "updateSectionVisibilityAndReloadIfNecessaryForSection:", v13);
LABEL_6:
        v3 = v14;
      }
    }
  }

}

- (void)_fetchAllApplePayOrderRowViewModels
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  -[PKPaymentTransaction paymentHash](self->_transaction, "paymentHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __79__PKPaymentTransactionDetailViewController__fetchAllApplePayOrderRowViewModels__block_invoke;
  v9 = &unk_1E3E7AF88;
  objc_copyWeak(&v10, &location);
  v4 = _Block_copy(&v6);
  v5 = objc_alloc_init(getFKApplePayOrderFetchControllerClass());
  objc_msgSend(v5, "fetchAllRowViewModelsForTransactionWithIdentifier:completionHandler:", v3, v4, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __79__PKPaymentTransactionDetailViewController__fetchAllApplePayOrderRowViewModels__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__PKPaymentTransactionDetailViewController__fetchAllApplePayOrderRowViewModels__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __79__PKPaymentTransactionDetailViewController__fetchAllApplePayOrderRowViewModels__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "orderRowViewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "orderRowViewModel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)WeakRetained[160];
      WeakRetained[160] = v5;

    }
    objc_msgSend(*(id *)(a1 + 32), "barcodeRowViewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "barcodeRowViewModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)WeakRetained[161];
      WeakRetained[161] = v9;

    }
    objc_msgSend(*(id *)(a1 + 32), "receiptRowViewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "receiptRowViewModel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)WeakRetained[162];
      WeakRetained[162] = v13;

    }
    objc_msgSend(WeakRetained, "reloadData");
  }

}

- (BOOL)_showSeparateReportMerchantInfoButton
{
  void *v2;
  _BOOL4 v3;

  -[PKPaymentTransaction accountIdentifier](self->_transaction, "accountIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = !+[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat");
  else
    LOBYTE(v3) = 1;

  return v3;
}

- (void)_presentContactIssuer
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];

  -[PKPaymentPass localizedValueForFieldKey:](self->_paymentPass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADE8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPass organizationName](self->_paymentPass, "organizationName");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    PKLocalizedPaymentString(CFSTR("CONTACT_ISSUER"), CFSTR("%@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v6, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKPaymentTransactionDetailViewController _hasIssuerPhoneNumber](self, "_hasIssuerPhoneNumber"))
    {
      v8 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPaymentString(CFSTR("CALL"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __65__PKPaymentTransactionDetailViewController__presentContactIssuer__block_invoke;
      v19[3] = &unk_1E3E61D68;
      v19[4] = self;
      objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAction:", v10);

    }
    if (-[PKPaymentTransaction isBankConnectTransaction](self->_transaction, "isBankConnectTransaction"))
    {
      -[PKPaymentTransaction bankConnectDigitalServicingURL](self->_transaction, "bankConnectDigitalServicingURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedPaymentString(CFSTR("CHAT"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __65__PKPaymentTransactionDetailViewController__presentContactIssuer__block_invoke_2;
        v18[3] = &unk_1E3E61D68;
        v18[4] = self;
        objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addAction:", v14);

      }
    }
    v15 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("CANCEL"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v17);

    -[PKPaymentTransactionDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  }

}

uint64_t __65__PKPaymentTransactionDetailViewController__presentContactIssuer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callIssuer");
}

uint64_t __65__PKPaymentTransactionDetailViewController__presentContactIssuer__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openBankConnectDigitalServicingURL");
}

- (BOOL)_hasIssuerPhoneNumber
{
  void *v2;
  BOOL v3;

  -[PKPaymentPass localizedValueForFieldKey:](self->_paymentPass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADE8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)_callIssuer
{
  void *v2;
  void *v3;
  id v4;

  -[PKPaymentPass localizedValueForFieldKey:](self->_paymentPass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADE8]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  PKTelephoneURLFromPhoneNumber();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v2, 0);

}

- (BOOL)_isPeerPaymentPendingRequestTransaction
{
  return -[PKPaymentTransaction transactionType](self->_transaction, "transactionType") == 3
      && -[PKPaymentTransaction peerPaymentType](self->_transaction, "peerPaymentType") == 3
      && -[PKPaymentTransaction transactionStatus](self->_transaction, "transactionStatus") == 0;
}

- (BOOL)_canShowAppleCardSupportFooterInAmountDetailsSection
{
  unint64_t v2;

  v2 = -[PKPaymentTransaction transactionType](self->_transaction, "transactionType");
  return (v2 > 0x16) | (0x7FF0u >> v2) & 1;
}

- (BOOL)_canShowAppleCardSupportFooterInRecognitionHintsSection
{
  return (unint64_t)(-[PKPaymentTransaction transactionType](self->_transaction, "transactionType") - 23) < 0xFFFFFFFFFFFFFFEBLL;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[PKPaymentTransactionDetailViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)contactsDidChangeForContactResolver:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PKPaymentTransactionDetailViewController_contactsDidChangeForContactResolver___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __80__PKPaymentTransactionDetailViewController_contactsDidChangeForContactResolver___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isViewLoaded");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "reloadSection:", 3);
  return result;
}

- (id)_associatedInstallmentCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38[2];
  id location;

  v6 = a3;
  v7 = a4;
  v35 = v6;
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKPaymentTransactionTransactionCellReuseIdentifier"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transactionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "row");
  -[NSArray objectAtIndex:](self->_associatedInstallmentPlans, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "product");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "serialNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKSerialNumber();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  v16 = v14;
  v33 = v8;
  v34 = v7;
  v31 = v11;
  if (v15 == v16)
  {

  }
  else
  {
    v17 = v16;
    if (v15)
      v18 = v16 == 0;
    else
      v18 = 1;
    if (v18)
    {

LABEL_10:
      objc_msgSend(v12, "model", v31);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      goto LABEL_12;
    }
    v19 = objc_msgSend(v15, "caseInsensitiveCompare:", v16, v11, v8, v7);

    if (v19)
      goto LABEL_10;
  }
  PKDeviceName();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "model");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  objc_msgSend(v12, "iconURLForScale:suffix:", 0, PKUIScreenScale());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0D66EA8], "sharedImageAssetDownloader");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "cachedDataForURL:", v22);
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
        goto LABEL_21;
    }
    else
    {
      objc_initWeak(&location, self);
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __95__PKPaymentTransactionDetailViewController__associatedInstallmentCellForTableView_atIndexPath___block_invoke;
      v36[3] = &unk_1E3E7AFB0;
      objc_copyWeak(v38, &location);
      v38[1] = v10;
      v37 = v35;
      objc_msgSend(v23, "downloadFromUrl:completionHandler:", v22, v36);

      objc_destroyWeak(v38);
      objc_destroyWeak(&location);

    }
  }
  PKPassKitUIBundle();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "URLForResource:withExtension:", CFSTR("InstallmentsFallback"), CFSTR("pdf"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = PKUIScreenScale();
    PKUIImageFromPDF(v28, 100.0, 100.0, v29);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }

LABEL_21:
  objc_msgSend(v9, "setPrimaryString:", v20, v31);
  objc_msgSend(v9, "setSecondaryString:", v21);
  objc_msgSend(v9, "setShowsDisclosureView:", 1);
  objc_msgSend(v9, "setPrimaryImage:", v26);
  objc_msgSend(v9, "setStrokeImage:", 0);

  return v33;
}

void __95__PKPaymentTransactionDetailViewController__associatedInstallmentCellForTableView_atIndexPath___block_invoke(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9[2];

  if (a2 && !a4)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __95__PKPaymentTransactionDetailViewController__associatedInstallmentCellForTableView_atIndexPath___block_invoke_2;
      v6[3] = &unk_1E3E65C70;
      objc_copyWeak(v9, a1 + 5);
      v9[1] = a1[6];
      v7 = a1[4];
      v8 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v6);

      objc_destroyWeak(v9);
    }

  }
}

void __95__PKPaymentTransactionDetailViewController__associatedInstallmentCellForTableView_atIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", *(_QWORD *)(a1 + 56), objc_msgSend(WeakRetained, "indexForSection:", 10));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cellForRowAtIndexPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transactionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPrimaryImage:animated:", *(_QWORD *)(a1 + 40), 1);

    WeakRetained = v6;
  }

}

- (id)_associatedFinancingPlanCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PKPaymentTransactionIconGenerator *v12;
  PKPaymentTransactionIconGenerator *iconGenerator;
  PKPaymentTransactionIconGenerator *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(id *, void *, char);
  void *v23;
  id v24;
  id v25;
  id v26;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKPaymentTransactionTransactionCellReuseIdentifier"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transactionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction associatedFinancingPlan](self->_transaction, "associatedFinancingPlan");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "merchant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_iconGenerator)
  {
    v12 = -[PKPaymentTransactionIconGenerator initWithCache:scale:]([PKPaymentTransactionIconGenerator alloc], "initWithCache:scale:", 1, PKUIScreenScale());
    iconGenerator = self->_iconGenerator;
    self->_iconGenerator = v12;

  }
  objc_initWeak(&location, self);
  v14 = self->_iconGenerator;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __97__PKPaymentTransactionDetailViewController__associatedFinancingPlanCellForTableView_atIndexPath___block_invoke;
  v23 = &unk_1E3E68620;
  objc_copyWeak(&v26, &location);
  v15 = v6;
  v24 = v15;
  v16 = v7;
  v25 = v16;
  -[PKPaymentTransactionIconGenerator iconForPayLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:](v14, "iconForPayLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:", v11, 0, 0, &v20, 45.0, 45.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayName", v20, v21, v22, v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPrimaryString:", v18);

  objc_msgSend(v9, "setShowsDisclosureView:", 1);
  objc_msgSend(v9, "setPrimaryImage:", v17);
  objc_msgSend(v9, "setStrokeImage:", 0);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v8;
}

void __97__PKPaymentTransactionDetailViewController__associatedFinancingPlanCellForTableView_atIndexPath___block_invoke(id *a1, void *a2, char a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__PKPaymentTransactionDetailViewController__associatedFinancingPlanCellForTableView_atIndexPath___block_invoke_2;
  block[3] = &unk_1E3E799D8;
  objc_copyWeak(&v11, a1 + 6);
  v12 = a3;
  v8 = v5;
  v9 = a1[4];
  v10 = a1[5];
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v11);
}

void __97__PKPaymentTransactionDetailViewController__associatedFinancingPlanCellForTableView_atIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && *(_BYTE *)(a1 + 64) && *(_QWORD *)(a1 + 32))
  {
    v5 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 40), "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "transactionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPrimaryImage:animated:", *(_QWORD *)(a1 + 32), 1);

    WeakRetained = v5;
  }

}

- (void)_showInstallmentDetailsForAssociatedInstallment:(id)a3
{
  id v4;
  void *v5;
  PKTransactionHistoryViewController *v6;

  if (a3)
  {
    v4 = a3;
    v6 = -[PKTransactionHistoryViewController initWithInstallmentPlan:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:]([PKTransactionHistoryViewController alloc], "initWithInstallmentPlan:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:", v4, self->_transactionSourceCollection, self->_familyCollection, self->_account, self->_accountUserCollection, self->_physicalCards);

    -[PKPaymentTransactionDetailViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushViewController:animated:", v6, 1);

  }
}

- (void)_showAssociatedFinancingPlanDetailsForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id location;
  _QWORD v25[5];
  id v26;

  v4 = a3;
  -[PKPaymentTransaction associatedFinancingPlan](self->_transaction, "associatedFinancingPlan");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PKPaymentTransactionDetailViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellForRowAtIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setShowsActionSpinner:", 1);
    v8 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__67;
    v25[4] = __Block_byref_object_dispose__67;
    v26 = 0;
    objc_initWeak(&location, self);
    v9 = MEMORY[0x1E0C809B0];
    if (!self->_associatedPayLaterAccount)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke;
      v21[3] = &unk_1E3E7AFD8;
      v21[4] = self;
      objc_copyWeak(&v23, &location);
      v22 = v5;
      objc_msgSend(v8, "addOperation:", v21);

      objc_destroyWeak(&v23);
    }
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_516;
    v17[3] = &unk_1E3E7B000;
    v17[4] = self;
    v19 = v25;
    v18 = v5;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v8, "addOperation:", v17);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_3_523;
    v13[3] = &unk_1E3E7B028;
    objc_copyWeak(&v16, &location);
    v15 = v25;
    v11 = v7;
    v14 = v11;
    v12 = (id)objc_msgSend(v8, "evaluateWithInput:completion:", v10, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
    _Block_object_dispose(v25, 8);

  }
}

void __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 1256);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_2;
  v13[3] = &unk_1E3E73D70;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  v14 = *(id *)(a1 + 40);
  v11 = v9;
  v16 = v11;
  v12 = v8;
  v15 = v12;
  objc_msgSend(v10, "defaultAccountForFeature:completion:", 3, v13);

  objc_destroyWeak(&v17);
}

void __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_3;
  block[3] = &unk_1E3E643C0;
  objc_copyWeak(&v10, a1 + 7);
  v6 = v3;
  v7 = a1[4];
  v9 = a1[6];
  v8 = a1[5];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v10);
}

void __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 143, *(id *)(a1 + 32));
    v4 = *(_QWORD *)(a1 + 32);
    if (!v4)
    {
      PKLogFacilityTypeGetObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 40);
        v7 = 138412290;
        v8 = v6;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Error: there is no pay later account for associated transaction financing plan %@", (uint8_t *)&v7, 0xCu);
      }

      v4 = *(_QWORD *)(a1 + 32);
    }
    (*(void (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), v4 == 0);
  }

}

void __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_516(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  PKPayLaterFinancingPlanViewController *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;

  v23 = a2;
  v26 = a3;
  v25 = a4;
  v24 = objc_alloc(MEMORY[0x1E0D67048]);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1144);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(v10 + 1096);
  if (v11)
  {
    v12 = *(void **)(v10 + 1096);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
  }
  v13 = *(_QWORD *)(v10 + 1256);
  v14 = objc_alloc_init(MEMORY[0x1E0D672B0]);
  objc_msgSend(v14, "defaultPaymentPassUniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v24, "initWithPayLaterAccount:paymentWebService:passLibrary:peerPaymentWebService:accountService:defaultPassUniqueIdentifier:", v7, v8, v9, v12, v13, v15);

  if (!v11)
  v17 = -[PKPayLaterFinancingPlanViewController initWithFinancingPlan:payLaterAccount:paymentIntentController:merchantIcon:iconGenerator:]([PKPayLaterFinancingPlanViewController alloc], "initWithFinancingPlan:payLaterAccount:paymentIntentController:merchantIcon:iconGenerator:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1144), v16, 0, 0);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_2_521;
  v27[3] = &unk_1E3E61968;
  objc_copyWeak(&v30, (id *)(a1 + 56));
  v21 = v25;
  v29 = v21;
  v22 = v26;
  v28 = v22;
  objc_msgSend(v20, "preflightWithCompletion:", v27);

  objc_destroyWeak(&v30);
}

void __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_2_521(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v3;
  }

}

void __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_3_523(uint64_t a1)
{
  id v2;
  __int128 v3;
  _QWORD block[4];
  __int128 v5;
  id v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_4;
  block[3] = &unk_1E3E6D160;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  v3 = *(_OWORD *)(a1 + 32);
  v2 = (id)v3;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v6);
}

void __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pushViewController:animated:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 1);

    objc_msgSend(*(id *)(a1 + 32), "setShowsActionSpinner:", 0);
    WeakRetained = v4;
  }

}

- (void)accountServiceAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  -[PKPaymentTransactionDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, a5, 0);
}

- (BOOL)_actionRowIsEnabled:(unint64_t)a3
{
  PKTransactionSourceCollection *transactionSourceCollection;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v21;
  void *v24;
  _BOOL4 v25;
  BOOL v26;
  void *v27;
  char v28;
  uint64_t v29;
  void *v30;
  BOOL v31;
  char v32;
  uint64_t v33;

  transactionSourceCollection = self->_transactionSourceCollection;
  -[PKPaymentTransaction transactionSourceIdentifier](self->_transaction, "transactionSourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionSourceCollection transactionSourceForTransactionSourceIdentifier:](transactionSourceCollection, "transactionSourceForTransactionSourceIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a3)
  {
    case 0uLL:
      v8 = !self->_issuerAppDeepLinkingEnabled;
      goto LABEL_51;
    case 1uLL:
      if (-[PKPaymentTransaction transactionType](self->_transaction, "transactionType") != 3
        || !-[PKPaymentTransaction transactionStatus](self->_transaction, "transactionStatus")
        || -[PKPaymentTransaction peerPaymentType](self->_transaction, "peerPaymentType") != 2)
      {
        goto LABEL_70;
      }
      goto LABEL_9;
    case 2uLL:
      if (-[PKPaymentTransaction transactionType](self->_transaction, "transactionType") != 3
        || -[PKPaymentTransaction peerPaymentType](self->_transaction, "peerPaymentType") != 1)
      {
        goto LABEL_70;
      }
LABEL_9:
      -[PKPaymentTransaction peerPaymentCounterpartHandle](self->_transaction, "peerPaymentCounterpartHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "length") || objc_msgSend(v7, "type"))
        goto LABEL_72;
      -[PKPaymentTransaction recurringPeerPayment](self->_transaction, "recurringPeerPayment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        goto LABEL_40;
      LOBYTE(v11) = -[PKPaymentTransaction peerPaymentPaymentMode](self->_transaction, "peerPaymentPaymentMode") != 2;
      goto LABEL_75;
    case 3uLL:
      if (-[PKPaymentTransaction transactionType](self->_transaction, "transactionType") != 3)
        goto LABEL_70;
      -[PKPeerPaymentStatusResponse actions](self->_peerPaymentStatusResponse, "actions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "containsObject:", *MEMORY[0x1E0D6B0E8]))
        goto LABEL_59;
      LOBYTE(v11) = objc_msgSend(v7, "type") == 0;
      goto LABEL_60;
    case 4uLL:
      if (-[PKPaymentTransaction transactionType](self->_transaction, "transactionType") != 3)
        goto LABEL_70;
      -[PKPeerPaymentStatusResponse actions](self->_peerPaymentStatusResponse, "actions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v13;
      v14 = (_QWORD *)MEMORY[0x1E0D6B0F0];
      goto LABEL_20;
    case 5uLL:
      if (-[PKPaymentTransaction transactionType](self->_transaction, "transactionType") != 3)
        goto LABEL_70;
      -[PKPeerPaymentStatusResponse actions](self->_peerPaymentStatusResponse, "actions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v13;
      v14 = (_QWORD *)MEMORY[0x1E0D6B0F8];
LABEL_20:
      if (!objc_msgSend(v13, "containsObject:", *v14) || objc_msgSend(v7, "type"))
        goto LABEL_72;
      LOBYTE(v11) = -[PKPaymentTransaction peerPaymentPaymentMode](self->_transaction, "peerPaymentPaymentMode") != 2;
      break;
    case 6uLL:
      -[PKPaymentTransaction recurringPeerPayment](self->_transaction, "recurringPeerPayment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "status");

      v17 = -[PKPaymentTransaction transactionType](self->_transaction, "transactionType");
      v18 = -[PKPaymentTransaction peerPaymentType](self->_transaction, "peerPaymentType");
      v19 = -[PKPaymentTransaction accountType](self->_transaction, "accountType");
      v21 = v17 == 6 || v18 == 1;
      if (v19 != 1 || v16 == 0 || !v21)
        goto LABEL_70;
      v8 = self->_detailViewStyle == 2;
LABEL_51:
      LOBYTE(v11) = !v8;
      goto LABEL_77;
    case 7uLL:
      if (-[PKPaymentTransaction transactionType](self->_transaction, "transactionType") != 10)
        goto LABEL_70;
      -[PKPaymentTransaction payments](self->_transaction, "payments");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isCurrentlyCancellable")
        && -[PKPaymentTransaction transactionStatus](self->_transaction, "transactionStatus") != 5)
      {
        LOBYTE(v11) = -[PKPaymentTransaction featureIdentifier](self->_transaction, "featureIdentifier") == 2;
      }
      else
      {
LABEL_40:
        LOBYTE(v11) = 0;
      }
LABEL_75:

      break;
    case 8uLL:
      if (+[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat"))
      {
        -[PKPaymentPass businessChatIdentifier](self->_paymentPass, "businessChatIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24 != 0;

      }
      else
      {
        v25 = 0;
      }
      if (!+[PKReportIssueViewController canReportIssueForTransaction:bankConnectInstitution:paymentPass:](PKReportIssueViewController, "canReportIssueForTransaction:bankConnectInstitution:paymentPass:", self->_transaction, self->_bankConnectInstitution, self->_paymentPass)&& !v25)
      {
        goto LABEL_70;
      }
      -[PKPaymentTransaction questions](self->_transaction, "questions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
        goto LABEL_72;
      v11 = !-[PKPaymentTransactionDetailViewController _showSeparateReportMerchantInfoButton](self, "_showSeparateReportMerchantInfoButton");
      break;
    case 9uLL:
      -[PKPaymentTransaction questions](self->_transaction, "questions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v11) = objc_msgSend(v12, "count") != 0;
      goto LABEL_60;
    case 0xAuLL:
      -[PKPaymentTransaction bankConnectDigitalServicingURL](self->_transaction, "bankConnectDigitalServicingURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PKPaymentTransaction isBankConnectTransaction](self->_transaction, "isBankConnectTransaction"))v26 = v9 == 0;
      else
        v26 = 1;
      if (v26
        || (objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            v28 = objc_msgSend(v27, "canOpenURL:", v9),
            v27,
            (v28 & 1) == 0))
      {
        v31 = +[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat");
        v32 = -[PKPaymentPass isAppleCardPass](self->_paymentPass, "isAppleCardPass");
        v33 = -[PKPaymentTransaction transactionType](self->_transaction, "transactionType");
        if (-[PKPaymentTransactionDetailViewController _showSeparateReportMerchantInfoButton](self, "_showSeparateReportMerchantInfoButton"))
        {
          LOBYTE(v11) = 0;
          if (-[PKPaymentTransactionDetailViewController _hasIssuerPhoneNumber](self, "_hasIssuerPhoneNumber") && !v33)
          {
            if ((-[PKPaymentPass isTransitPass](self->_paymentPass, "isTransitPass") & 1) != 0)
              LOBYTE(v11) = 0;
            else
              LOBYTE(v11) = v32 ^ 1 | v31;
          }
        }
        else
        {
LABEL_72:
          LOBYTE(v11) = 0;
        }
      }
      else
      {
        LOBYTE(v11) = 1;
      }
      break;
    case 0xBuLL:
      v8 = self->_privacyURL == 0;
      goto LABEL_51;
    case 0xCuLL:
      LOBYTE(v11) = -[PKPaymentTransactionDetailViewController _isPeerPaymentPendingRequestTransaction](self, "_isPeerPaymentPendingRequestTransaction");
      goto LABEL_77;
    case 0xDuLL:
      -[PKPaymentTransaction bankConnectPostInstallmentURL](self->_transaction, "bankConnectPostInstallmentURL");
      v29 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0xEuLL:
      -[PKPaymentTransaction bankConnectRedeemRewardsURL](self->_transaction, "bankConnectRedeemRewardsURL");
      v29 = objc_claimAutoreleasedReturnValue();
LABEL_57:
      v12 = (void *)v29;
      if (v29)
      {
        objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v11) = objc_msgSend(v30, "canOpenURL:", v12);

      }
      else
      {
LABEL_59:
        LOBYTE(v11) = 0;
      }
LABEL_60:

      goto LABEL_77;
    default:
LABEL_70:
      LOBYTE(v11) = 0;
      goto LABEL_77;
  }

LABEL_77:
  return v11;
}

- (BOOL)_shouldHighlightAction:(unint64_t)a3
{
  return a3 < 0xF;
}

- (int64_t)_numberOfActionRowsEnabled
{
  uint64_t v3;
  int64_t v4;

  v3 = 0;
  v4 = 0;
  do
    v4 += -[PKPaymentTransactionDetailViewController _actionRowIsEnabled:](self, "_actionRowIsEnabled:", v3++);
  while (v3 != 15);
  return v4;
}

- (unint64_t)_actionRowForRowIndex:(int64_t)a3
{
  unint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  do
  {
    if (-[PKPaymentTransactionDetailViewController _actionRowIsEnabled:](self, "_actionRowIsEnabled:", v5))
    {
      if (v6 == a3)
        return v5;
      ++v6;
    }
    ++v5;
  }
  while (v5 != 15);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)_rowIndexForActionRow:(unint64_t)a3
{
  uint64_t v5;
  int64_t v6;

  v5 = 0;
  v6 = 0;
  do
  {
    if (-[PKPaymentTransactionDetailViewController _actionRowIsEnabled:](self, "_actionRowIsEnabled:", v5))
    {
      if (a3 == v5)
        return v6;
      ++v6;
    }
    ++v5;
  }
  while (v5 != 15);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_tableView:(id)a3 cellForAwardAtIndex:(int64_t)a4
{
  PKPaymentTransaction *transaction;
  id v7;
  void *v8;
  void *v9;
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
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;

  transaction = self->_transaction;
  v7 = a3;
  -[PKPaymentTransaction awards](transaction, "awards");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") == a4)
  {
    -[PKPaymentTransactionDetailViewController _tableView:actionButtonCellForSection:](self, "_tableView:actionButtonCellForSection:", v7, 15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentPass organizationName](self->_paymentPass, "organizationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedAquamanString(CFSTR("VIEW_OFFER_DETAILS_IN_ISSUER_APP_FORMAT"), CFSTR("%@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);
  }
  else
  {
    -[PKPaymentTransactionDetailViewController _awardCellForTableView:](self, "_awardCellForTableView:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentTransaction awards](self->_transaction, "awards");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "awardDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "type") == 1)
    {
      objc_msgSend(v11, "amount");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "amount");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "formattedStringValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v11, "localizedAmount");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    PKLocalizedAquamanString(CFSTR("EXPIRED"));
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "claimExpiryDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "redeemExpiryDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    PKLocalizedAquamanString(CFSTR("TRANSACTION_DETAIL_AWARD_DESCRIPTION_FORMAT"), CFSTR("%@%@"), v12, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "detailTextLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v17);
    if ((objc_msgSend(v11, "claimExpired") & 1) == 0 && (objc_msgSend(v11, "redeemExpired") & 1) == 0)
    {
      v26 = v16;
      if (v30)
      {
        objc_msgSend(v28, "earlierDate:", v30);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = v21 == v30;
        v16 = v26;
        if (v22)
          objc_msgSend(v11, "setClaimExpired:", 1);
      }
      if (v29)
      {
        objc_msgSend(v28, "earlierDate:", v29);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = v23 == v29;
        v16 = v26;
        if (v22)
          objc_msgSend(v11, "setRedeemExpired:", 1);
      }
    }
    if ((objc_msgSend(v11, "claimExpired") & 1) != 0 || objc_msgSend(v11, "redeemExpired"))
    {
      v24 = (void *)v27;
      objc_msgSend(v20, "setText:", v27);
      objc_msgSend(v19, "setTextColor:", v18);
      objc_msgSend(v20, "setTextColor:", v18);
    }
    else
    {
      objc_msgSend(v9, "setAccessoryType:", self->_issuerAppDeepLinkingEnabled);
      v24 = (void *)v27;
    }

  }
  return v9;
}

- (id)_tableView:(id)a3 cellForActionAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v28;

  v6 = a3;
  switch(-[PKPaymentTransactionDetailViewController _actionRowForRowIndex:](self, "_actionRowForRowIndex:", a4))
  {
    case 0uLL:
      -[PKPaymentPass organizationName](self->_paymentPass, "organizationName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction awards](self->_transaction, "awards");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
        v9 = CFSTR("TRANSACTION_DETAIL_ACTION_OPEN_TRANSACTION_DETAILS_IN_ISSUER_APP_FORMAT");
      else
        v9 = CFSTR("TRANSACTION_DETAIL_ACTION_VIEW_IN_ISSUER_APP_FORMAT");
      PKLocalizedPeerPaymentString(&v9->isa, CFSTR("%@"), v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    case 1uLL:
      v12 = CFSTR("TRANSACTION_DETAIL_ACTION_REQUEST_AGAIN");
      goto LABEL_13;
    case 2uLL:
      v12 = CFSTR("TRANSACTION_DETAIL_ACTION_SEND_AGAIN");
      goto LABEL_13;
    case 3uLL:
      v12 = CFSTR("TRANSACTION_DETAIL_ACTION_ACCEPT_PENDING");
      goto LABEL_13;
    case 4uLL:
      -[PKPaymentTransaction recurringPeerPayment](self->_transaction, "recurringPeerPayment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = CFSTR("TRANSACTION_DETAIL_ACTION_CANCEL_PENDING");
      if (!v13)
        goto LABEL_13;
      PKLocalizedPeerPaymentRecurringString(CFSTR("TRANSACTION_DETAIL_ACTION_CANCEL_PENDING"));
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 5uLL:
      v12 = CFSTR("TRANSACTION_DETAIL_ACTION_REJECT_PENDING");
LABEL_13:
      PKLocalizedPeerPaymentString(&v12->isa);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 6uLL:
      -[PKPaymentTransaction recurringPeerPayment](self->_transaction, "recurringPeerPayment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "type");
      if (v16 == 1)
      {
        v17 = CFSTR("TRANSACTION_DETAIL_ACTION_VIEW_RECURRING_PAYMENT");
        goto LABEL_39;
      }
      if (v16 == 3)
      {
        v17 = CFSTR("TRANSACTION_DETAIL_ACTION_VIEW_AUTO_RELOAD");
LABEL_39:
        PKLocalizedPeerPaymentRecurringString(&v17->isa);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      }
      v10 = 0;
LABEL_41:

      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionConfigurationCellReuseIdentifier"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "defaultContentConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", v10);
      objc_msgSend(v25, "setAccessoryType:", 1);
      objc_msgSend(v25, "setContentConfiguration:", v11);
LABEL_35:

      return v25;
    case 7uLL:
      PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_CANCEL_PAYMENT_BUTTON_TITLE"));
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 8uLL:
      v19 = CFSTR("TRANSACTION_DETAILS_REPORT_PROBLEM_TITLE");
      goto LABEL_20;
    case 9uLL:
      v19 = CFSTR("TRANSACTION_DETAILS_CONTACT_SUPPORT_TITLE");
LABEL_20:
      PKLocalizedPaymentString(&v19->isa);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 10uLL:
      -[PKPaymentPass organizationName](self->_paymentPass, "organizationName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_CONTACT_ISSUER_TITLE"), CFSTR("%@"), v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

      goto LABEL_31;
    case 11uLL:
      -[PKPaymentTransaction releasedData](self->_transaction, "releasedData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "merchantNameOverride");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        v23 = v21;
      }
      else
      {
        -[PKPaymentTransaction merchant](self->_transaction, "merchant");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "name");
        v23 = (id)objc_claimAutoreleasedReturnValue();

      }
      PKLocalizedIdentityString(CFSTR("TRANSACTION_DETAILS_DEVELOPER_PRIVACY_POLICY"), CFSTR("%@"), v23);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_31;
    case 12uLL:
      PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAIL_ACTION_CANCEL_REQUEST"));
      v18 = objc_claimAutoreleasedReturnValue();
LABEL_26:
      v10 = (void *)v18;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 13uLL:
      v24 = CFSTR("BANK_CONNECT_TRANSACTION_DETAILS_POST_INSTALLMENT");
      goto LABEL_29;
    case 14uLL:
      v24 = CFSTR("BANK_CONNECT_TRANSACTION_DETAILS_REDEEM_REWARDS");
LABEL_29:
      PKLocalizedBankConnectString(&v24->isa);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_30:
      v10 = (void *)v14;
LABEL_31:
      v11 = 0;
      goto LABEL_32;
    default:
      v11 = 0;
      v10 = 0;
LABEL_32:
      -[PKPaymentTransactionDetailViewController _tableView:actionButtonCellForSection:](self, "_tableView:actionButtonCellForSection:", v6, 20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "textLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setText:", v10);
      if (v11)
        objc_msgSend(v26, "setTextColor:", v11);

      goto LABEL_35;
  }
}

- (id)_tableView:(id)a3 actionButtonCellForSection:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionDefaultCellReuseIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_inBridge)
    BPSBridgeTintColor();
  else
    objc_msgSend(v5, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v8);

  objc_msgSend(v7, "setNumberOfLines:", 0);
  objc_msgSend(v6, "setAccessoryType:", 0);
  objc_msgSend(v6, "setSeparatorInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67830]);

  return v6;
}

- (id)_tableViewCellForDeleteTransaction:(id)a3
{
  void *v4;
  void *v5;
  PKPaymentTransactionDetailViewControllerDeleteOverrider *deleteOverrider;
  void *v7;
  void *v8;

  -[PKPaymentTransactionDetailViewController _tableView:actionButtonCellForSection:](self, "_tableView:actionButtonCellForSection:", a3, 20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  deleteOverrider = self->_deleteOverrider;
  if (deleteOverrider)
    -[PKPaymentTransactionDetailViewControllerDeleteOverrider transactionDetailViewControllerDeleteOverriderActionTitle](deleteOverrider, "transactionDetailViewControllerDeleteOverriderActionTitle");
  else
    PKLocalizedIdentityString(CFSTR("TRANSACTION_DELETE_ACTIVITY_REMOVE_BUTTON_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v7);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v8);

  objc_msgSend(v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F60]);
  return v4;
}

- (id)_tableViewCellPaymentRewardsRedemptionInfoForTableView:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKPaymentRewardsRedemptionInfoCellReuseIdentifier"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction paymentRewardsRedemption](self->_transaction, "paymentRewardsRedemption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureWithRewardsRedemption:rewardsBalance:", v6, self->_associatedPaymentRewardsBalance);

  return v5;
}

- (void)_tableView:(id)a3 didSelectActionAtIndexPath:(id)a4
{
  id v6;
  PKPaymentTransactionDetailViewController *v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  switch(-[PKPaymentTransactionDetailViewController _actionRowForRowIndex:](self, "_actionRowForRowIndex:", objc_msgSend(v6, "row")))
  {
    case 0uLL:
      -[PKPaymentTransactionDetailViewController _openTransactionInIssuerApp](self, "_openTransactionInIssuerApp");
      break;
    case 1uLL:
      MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D685A0], 0);
      v7 = self;
      v8 = 1;
      goto LABEL_6;
    case 2uLL:
      MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D685A8], 0);
      v7 = self;
      v8 = 2;
LABEL_6:
      -[PKPaymentTransactionDetailViewController _openMessagesToPresentAction:](v7, "_openMessagesToPresentAction:", v8);
      break;
    case 3uLL:
      v9 = (_QWORD *)MEMORY[0x1E0D6B0E8];
      goto LABEL_10;
    case 4uLL:
      MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68588], 0);
      v9 = (_QWORD *)MEMORY[0x1E0D6B0F0];
      goto LABEL_10;
    case 5uLL:
      MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68598], 0);
      v9 = (_QWORD *)MEMORY[0x1E0D6B0F8];
LABEL_10:
      -[PKPaymentTransactionDetailViewController _tableView:didSelectPeerPaymentAction:atIndexPath:](self, "_tableView:didSelectPeerPaymentAction:atIndexPath:", v10, *v9, v6);
      break;
    case 6uLL:
      -[PKPaymentTransactionDetailViewController _presentRecurringPeerPaymentAtIndexPath:](self, "_presentRecurringPeerPaymentAtIndexPath:", v6);
      break;
    case 7uLL:
      -[PKPaymentTransactionDetailViewController _presentCancelPaymentWithIndexPath:](self, "_presentCancelPaymentWithIndexPath:", v6);
      break;
    case 8uLL:
      -[PKPaymentTransactionDetailViewController _presentReportIssue](self, "_presentReportIssue");
      break;
    case 9uLL:
    case 10uLL:
      -[PKPaymentTransactionDetailViewController _presentContactViewController](self, "_presentContactViewController");
      break;
    case 11uLL:
      -[PKPaymentTransactionDetailViewController _openAppPrivacyURL](self, "_openAppPrivacyURL");
      break;
    case 12uLL:
      -[PKPaymentTransactionDetailViewController _cancelPeerPaymentPendingRequest](self, "_cancelPeerPaymentPendingRequest");
      break;
    case 13uLL:
      -[PKPaymentTransactionDetailViewController _openBankConnectPostInstallmentURL](self, "_openBankConnectPostInstallmentURL");
      break;
    case 14uLL:
      -[PKPaymentTransactionDetailViewController _openBankConnectRedeemRewardsURL](self, "_openBankConnectRedeemRewardsURL");
      break;
    default:
      break;
  }

}

- (void)_tableView:(id)a3 didSelectPeerPaymentAction:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  void (**v42)(_QWORD);
  _QWORD aBlock[4];
  id v44;
  id v45;
  id v46;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "cellForRowAtIndexPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShowsActionSpinner:", 1);
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke;
  aBlock[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v46, location);
  v12 = v9;
  v44 = v12;
  v13 = v10;
  v45 = v13;
  v14 = (void (**)(_QWORD))_Block_copy(aBlock);
  v15 = (void *)*MEMORY[0x1E0D6B0F0];
  v16 = v12;
  v17 = v15;
  if (v17 == v16)
  {

  }
  else
  {
    v18 = v17;
    if (!v16 || !v17)
    {

      goto LABEL_11;
    }
    v19 = objc_msgSend(v16, "isEqualToString:", v17);

    if (!v19)
      goto LABEL_11;
  }
  -[PKPaymentTransaction recurringPeerPayment](self->_transaction, "recurringPeerPayment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
LABEL_11:
    v14[2](v14);
    goto LABEL_14;
  }
  PKLocalizedPeerPaymentRecurringString(CFSTR("TRANSACTION_DETAILS_CANCEL_PAYMENT_TITLE"));
  v21 = objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction peerPaymentCounterpartHandle](self->_transaction, "peerPaymentCounterpartHandle");
  v22 = objc_claimAutoreleasedReturnValue();
  -[PKContactResolver contactForHandle:](self->_contactResolver, "contactForHandle:", v22);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D67400], "displayNameForCounterpartHandle:contact:", v22, v33);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction transactionDate](self->_transaction, "transactionDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  PKMediumDayAndMonthStringFromDate();
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v37, "length"))
    PKLocalizedPeerPaymentRecurringString(CFSTR("TRANSACTION_DETAILS_CANCEL_PAYMENT_BODY"), CFSTR("%@%@"), v36, v37);
  else
    PKLocalizedPeerPaymentRecurringString(CFSTR("TRANSACTION_DETAILS_CANCEL_PAYMENT_BODY_NO_NAME"), CFSTR("%@"), v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentRecurringString(CFSTR("TRANSACTION_DETAILS_CANCEL_PAYMENT_YES_BUTTON"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v22;
  v32 = v8;
  PKLocalizedPeerPaymentRecurringString(CFSTR("TRANSACTION_DETAILS_CANCEL_PAYMENT_NO_BUTTON"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v21;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v21, v35, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0DC3448];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke_5;
  v41[3] = &unk_1E3E61CA8;
  v42 = v14;
  objc_msgSend(v26, "actionWithTitle:style:handler:", v34, 2, v41);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addAction:", v27);

  v28 = (void *)MEMORY[0x1E0DC3448];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke_6;
  v38[3] = &unk_1E3E69FE8;
  objc_copyWeak(&v40, location);
  v39 = v13;
  objc_msgSend(v28, "actionWithTitle:style:handler:", v24, 1, v38);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addAction:", v29);

  -[PKPaymentTransactionDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v25, 1, 0);
  objc_destroyWeak(&v40);

  v8 = v32;
LABEL_14:

  objc_destroyWeak(&v46);
  objc_destroyWeak(location);

}

void __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke_2;
    v5[3] = &unk_1E3E7B050;
    objc_copyWeak(&v7, v2);
    v6 = *(id *)(a1 + 40);
    objc_msgSend(WeakRetained, "_performPeerPaymentAction:withCompletion:", v4, v5);

    objc_destroyWeak(&v7);
  }

}

void __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke_3;
    v7[3] = &unk_1E3E62FA0;
    objc_copyWeak(&v9, (id *)(a1 + 40));
    v8 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_updatePeerPaymentTransactionStatusWithCompletion:", v7);

    objc_destroyWeak(&v9);
  }

}

void __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke_3(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke_4;
  v2[3] = &unk_1E3E61B68;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

void __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    objc_msgSend(v5, "setShowsActionSpinner:", 0);

    WeakRetained = v6;
  }

}

uint64_t __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    objc_msgSend(v5, "setShowsActionSpinner:", 0);

    WeakRetained = v6;
  }

}

- (void)_openMessagesToPresentAction:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PKPaymentTransaction peerPaymentCounterpartHandle](self->_transaction, "peerPaymentCounterpartHandle", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction subtotalAmount](self->_transaction, "subtotalAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PKPaymentTransaction amount](self->_transaction, "amount");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  -[PKPaymentTransaction currencyCode](self->_transaction, "currencyCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKPeerPaymentGetSendPaymentSensitiveURL();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "openSensitiveURL:withOptions:", v9, 0);

  }
}

- (void)_openTransactionInIssuerApp
{
  PKPaymentPass *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = self->_paymentPass;
  -[PKPaymentPass uniqueID](v3, "uniqueID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentDataProvider transactionsAppLaunchTokenForPassWithUniqueIdentifier:](self->_paymentServiceDataProvider, "transactionsAppLaunchTokenForPassWithUniqueIdentifier:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentNotificationAppURLHelper appURLForTransactionNotification:pass:appLaunchToken:](PKPaymentNotificationAppURLHelper, "appURLForTransactionNotification:pass:appLaunchToken:", self->_transaction, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "openURL:configuration:completionHandler:", v5, 0, 0);

  }
}

- (void)_openOfferDetailsInIssuerApp:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  PKPaymentPass *v12;

  v12 = self->_paymentPass;
  v5 = a3;
  -[PKPaymentPass uniqueID](v12, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentDataProvider transactionsAppLaunchTokenForPassWithUniqueIdentifier:](self->_paymentServiceDataProvider, "transactionsAppLaunchTokenForPassWithUniqueIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/offers/%@"), v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("/offers");
  }
  +[PKPaymentNotificationAppURLHelper appURLForTransactionNotification:excludeTransactionIdentifier:pass:pathSuffix:appLaunchToken:](PKPaymentNotificationAppURLHelper, "appURLForTransactionNotification:excludeTransactionIdentifier:pass:pathSuffix:appLaunchToken:", self->_transaction, 0, v12, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "openURL:configuration:completionHandler:", v10, 0, 0);

  }
}

- (BOOL)_transactionHasNonZeroSecondaryFundingSourceAmount
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PKPaymentTransaction secondaryFundingSourceAmount](self->_transaction, "secondaryFundingSourceAmount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "compare:", v3) != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_presentRecurringPeerPaymentAtIndexPath:(id)a3
{
  id v4;

  -[PKPaymentTransaction recurringPeerPayment](self->_transaction, "recurringPeerPayment", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransactionDetailViewController _presentRecurringPeerPayment:](self, "_presentRecurringPeerPayment:", v4);

}

- (void)_presentRecurringPeerPayment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t detailViewStyle;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  PKPeerPaymentRecurringPaymentDetailViewController *v13;
  void *v14;
  PKPeerPaymentRecurringPaymentDetailViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  PKPeerPaymentThresholdTopUpController *thresholdTopUpController;
  PKPeerPaymentThresholdTopUpController *v20;
  PKPaymentPass *paymentPass;
  id v22;
  PKPeerPaymentThresholdTopUpController *v23;
  PKPeerPaymentThresholdTopUpController *v24;
  id v25;

  v25 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D673F8]);
  objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithPeerPaymentWebService:", v5);

  objc_msgSend(v6, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  detailViewStyle = self->_detailViewStyle;
  v9 = 3;
  if (detailViewStyle != 1)
    v9 = 0;
  if (detailViewStyle == 2)
    v10 = 4;
  else
    v10 = v9;
  v11 = objc_msgSend(v25, "type");
  if (v11 == 3)
  {
    thresholdTopUpController = self->_thresholdTopUpController;
    if (!thresholdTopUpController)
    {
      v20 = [PKPeerPaymentThresholdTopUpController alloc];
      paymentPass = self->_paymentPass;
      v22 = objc_alloc_init(MEMORY[0x1E0D66F18]);
      v23 = -[PKPeerPaymentThresholdTopUpController initWithPeerPaymentAccount:pass:context:passLibraryDataProvider:delegate:](v20, "initWithPeerPaymentAccount:pass:context:passLibraryDataProvider:delegate:", v7, paymentPass, v10, v22, self);
      v24 = self->_thresholdTopUpController;
      self->_thresholdTopUpController = v23;

      thresholdTopUpController = self->_thresholdTopUpController;
    }
    -[PKPeerPaymentThresholdTopUpController presentTopUpFlowForRecurringPayment:](thresholdTopUpController, "presentTopUpFlowForRecurringPayment:", v25);
  }
  else if (v11 == 1)
  {
    objc_msgSend(v7, "recurringPaymentsFeatureDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [PKPeerPaymentRecurringPaymentDetailViewController alloc];
    objc_msgSend(v25, "recipientAddress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKPeerPaymentRecurringPaymentDetailViewController initWithRecurringPayment:recipientAddress:mode:context:peerPaymentController:remoteMessagesComposer:](v13, "initWithRecurringPayment:recipientAddress:mode:context:peerPaymentController:remoteMessagesComposer:", v25, v14, 2, v10, v6, 0);

    objc_msgSend(v12, "minimumAmount");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPaymentDetailViewController setMinimumAmount:](v15, "setMinimumAmount:", v16);

    objc_msgSend(v12, "maximumAmount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPaymentDetailViewController setMaximumAmount:](v15, "setMaximumAmount:", v17);

    -[PKPaymentTransactionDetailViewController navigationController](self, "navigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pushViewController:animated:", v15, 1);

  }
}

- (void)_presentCancelPaymentWithIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;

  v4 = a3;
  if (!self->_cancelingPayment)
  {
    self->_cancelingPayment = 1;
    v5 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_CANCEL_PAYMENT_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_CANCEL_PAYMENT_BODY"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_CANCEL_PAYMENT_YES_BUTTON"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __79__PKPaymentTransactionDetailViewController__presentCancelPaymentWithIndexPath___block_invoke;
    v17[3] = &unk_1E3E61D90;
    v17[4] = self;
    v18 = v4;
    objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 2, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v12);

    v13 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_CANCEL_PAYMENT_NO_BUTTON"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __79__PKPaymentTransactionDetailViewController__presentCancelPaymentWithIndexPath___block_invoke_2;
    v16[3] = &unk_1E3E61D68;
    v16[4] = self;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v15);

    -[PKPaymentTransactionDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  }

}

void __79__PKPaymentTransactionDetailViewController__presentCancelPaymentWithIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v5;
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "setShowsActionSpinner:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_cancelPaymentWithCell:", v4);

}

uint64_t __79__PKPaymentTransactionDetailViewController__presentCancelPaymentWithIndexPath___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1320) = 0;
  return result;
}

- (void)_cancelPaymentWithCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PKPaymentWebService *webService;
  PKPaymentWebService *v12;
  PKPaymentWebService *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  -[PKPaymentTransaction payments](self->_transaction, "payments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0D66970]);
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccountIdentifier:", v8);

  -[PKAccount accountBaseURL](self->_account, "accountBaseURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBaseURL:", v9);

  objc_msgSend(v6, "referenceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPaymentReferenceIdentifier:", v10);

  objc_initWeak(&location, self);
  webService = self->_webService;
  if (!webService)
  {
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v12 = (PKPaymentWebService *)objc_claimAutoreleasedReturnValue();
    v13 = self->_webService;
    self->_webService = v12;

    webService = self->_webService;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__PKPaymentTransactionDetailViewController__cancelPaymentWithCell___block_invoke;
  v15[3] = &unk_1E3E68138;
  objc_copyWeak(&v17, &location);
  v14 = v4;
  v16 = v14;
  -[PKPaymentWebService cancelPaymentWithRequest:completion:](webService, "cancelPaymentWithRequest:completion:", v7, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __67__PKPaymentTransactionDetailViewController__cancelPaymentWithCell___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Cancel Payment => %@:%@", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PKPaymentTransactionDetailViewController__cancelPaymentWithCell___block_invoke_586;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  v10 = *(id *)(a1 + 32);
  v11 = v6;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __67__PKPaymentTransactionDetailViewController__cancelPaymentWithCell___block_invoke_586(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[5];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1320) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setShowsActionSpinner:", 0);
    if (*(_QWORD *)(a1 + 40))
    {
      v4 = (void *)MEMORY[0x1E0DC3450];
      PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_CANCEL_PAYMENT_FAILED_TITLE"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_CANCEL_PAYMENT_FAILED_BODY"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (+[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat"))
      {
        v8 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_CANCEL_PAYMENT_FAILED_CONTACT_SUPPORT_BUTTON"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __67__PKPaymentTransactionDetailViewController__cancelPaymentWithCell___block_invoke_2;
        v16[3] = &unk_1E3E61D68;
        v16[4] = v3;
        objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addAction:", v10);

      }
      v11 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_CANCEL_PAYMENT_FAILED_CONTINUE_BUTTON"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAction:", v13);

      objc_msgSend(v3, "presentViewController:animated:completion:", v7, 1, 0);
    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x1E0D672B0]);
      v14 = v3[174];
      objc_msgSend(v14, "setTransactionStatus:", 5);
      objc_msgSend(v14, "transactionSourceIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "insertOrUpdatePaymentTransaction:forTransactionSourceIdentifier:completion:", v14, v15, 0);

    }
  }

}

void __67__PKPaymentTransactionDetailViewController__cancelPaymentWithCell___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_businessChatContextForNonCancellablePayment");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_openBusinessChatControllerForContext:", v2);

}

- (id)_businessChatContextForNonCancellablePayment
{
  PKFamilyMemberCollection *familyCollection;
  void *v4;
  void *v5;
  PKBusinessChatTransactionDisputeContext *v6;
  void *v7;
  PKBusinessChatTransactionDisputeContext *v8;

  familyCollection = self->_familyCollection;
  -[PKAccountUser altDSID](self->_accountUser, "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFamilyMemberCollection familyMemberForAltDSID:](familyCollection, "familyMemberForAltDSID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [PKBusinessChatTransactionDisputeContext alloc];
  -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKBusinessChatTransactionDisputeContext initWithPaymentPass:transaction:account:accountUser:familyMember:physicalCards:intent:](v6, "initWithPaymentPass:transaction:account:accountUser:familyMember:physicalCards:intent:", v7, self->_transaction, self->_account, self->_accountUser, v5, self->_physicalCards, 9);

  return v8;
}

- (id)_businessChatContextForUnavailableDisputeStatus
{
  PKFamilyMemberCollection *familyCollection;
  void *v4;
  void *v5;
  PKBusinessChatTransactionDisputeContext *v6;

  familyCollection = self->_familyCollection;
  -[PKAccountUser altDSID](self->_accountUser, "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFamilyMemberCollection familyMemberForAltDSID:](familyCollection, "familyMemberForAltDSID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PKBusinessChatTransactionDisputeContext initWithPaymentPass:transaction:account:accountUser:familyMember:physicalCards:intent:]([PKBusinessChatTransactionDisputeContext alloc], "initWithPaymentPass:transaction:account:accountUser:familyMember:physicalCards:intent:", self->_paymentPass, self->_transaction, self->_account, self->_accountUser, v5, self->_physicalCards, 10);
  return v6;
}

- (void)_openURL:(id)a3
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __53__PKPaymentTransactionDetailViewController__openURL___block_invoke;
    v5[3] = &unk_1E3E7B078;
    v6 = v3;
    objc_msgSend(v4, "openURL:configuration:completionHandler:", v6, 0, v5);

  }
}

void __53__PKPaymentTransactionDetailViewController__openURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Failed to open url %@ with error: %@", (uint8_t *)&v9, 0x16u);

    }
  }

}

- (void)_presentReportIssue
{
  _BOOL4 v3;
  _BOOL4 v4;
  PKPaymentPass *v5;
  BOOL v6;
  PKReportIssueViewController *v7;
  PKTransactionSupportTopicsViewController *v8;
  void *v9;
  PKReportIssueViewController *v10;
  PKReportIssueViewController *v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  PKFamilyMemberCollection *familyCollection;
  void *v16;
  PKNavigationController *v17;
  char v18;
  PKAccountService *accountService;
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);

    return;
  }
  v3 = +[PKReportIssueViewController canSelectIssueTypeForTransaction:](PKReportIssueViewController, "canSelectIssueTypeForTransaction:", self->_transaction);
  v4 = +[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat");
  v5 = self->_paymentPass;
  if (-[PKPaymentPass isAppleCardPass](v5, "isAppleCardPass"))
    v6 = !v4;
  else
    v6 = 1;
  if (!v6)
  {
    -[PKPaymentPass associatedAccountServiceAccountIdentifier](v5, "associatedAccountServiceAccountIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
    v10 = (PKReportIssueViewController *)(id)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    v7 = v11;
    if (v10 != v11)
    {
      if (v11)
        v12 = v10 == 0;
      else
        v12 = 1;
      if (v12)
      {

      }
      else
      {
        v18 = -[PKReportIssueViewController isEqualToString:](v10, "isEqualToString:", v11);

        if ((v18 & 1) != 0)
          goto LABEL_26;
      }
      objc_initWeak(&location, self);
      accountService = self->_accountService;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __63__PKPaymentTransactionDetailViewController__presentReportIssue__block_invoke;
      v21[3] = &unk_1E3E67670;
      objc_copyWeak(&v22, &location);
      -[PKAccountService accountWithIdentifier:completion:](accountService, "accountWithIdentifier:completion:", v7, v21);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
      goto LABEL_30;
    }

LABEL_26:
    v8 = -[PKTransactionSupportTopicsViewController initWithAccount:transaction:transactionSourceCollection:familyCollection:accountUserCollection:physicalCards:]([PKTransactionSupportTopicsViewController alloc], "initWithAccount:transaction:transactionSourceCollection:familyCollection:accountUserCollection:physicalCards:", self->_account, self->_transaction, self->_transactionSourceCollection, self->_familyCollection, self->_accountUserCollection, self->_physicalCards);
    v17 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v8);
    -[PKPaymentTransactionDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
LABEL_27:

    goto LABEL_28;
  }
  if (!v3)
  {
    -[PKPaymentPass businessChatIdentifier](v5, "businessChatIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      v4 = 0;

    if (!v4)
      goto LABEL_31;
    if (-[PKPaymentTransaction transactionType](self->_transaction, "transactionType") == 10)
      v14 = 9;
    else
      v14 = 5;
    -[PKAccountUserCollection accountUserForTransaction:](self->_accountUserCollection, "accountUserForTransaction:", self->_transaction);
    v7 = (PKReportIssueViewController *)objc_claimAutoreleasedReturnValue();
    familyCollection = self->_familyCollection;
    -[PKReportIssueViewController altDSID](v7, "altDSID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFamilyMemberCollection familyMemberForAltDSID:](familyCollection, "familyMemberForAltDSID:", v16);
    v8 = (PKTransactionSupportTopicsViewController *)objc_claimAutoreleasedReturnValue();

    v17 = -[PKBusinessChatTransactionDisputeContext initWithPaymentPass:transaction:account:accountUser:familyMember:physicalCards:intent:]([PKBusinessChatTransactionDisputeContext alloc], "initWithPaymentPass:transaction:account:accountUser:familyMember:physicalCards:intent:", v5, self->_transaction, self->_account, v7, v8, self->_physicalCards, v14);
    -[PKPaymentTransactionDetailViewController _openBusinessChatControllerForContext:](self, "_openBusinessChatControllerForContext:", v17);
    goto LABEL_27;
  }
  v7 = -[PKReportIssueViewController initWithTransaction:transactionSourceCollection:paymentPass:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:detailViewStyle:context:]([PKReportIssueViewController alloc], "initWithTransaction:transactionSourceCollection:paymentPass:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:detailViewStyle:context:", self->_transaction, self->_transactionSourceCollection, v5, self->_familyCollection, self->_account, self->_accountUserCollection, self->_bankConnectInstitution, self->_physicalCards, self->_detailViewStyle, 0);
  v8 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v7);
  -[PKPaymentTransactionDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
LABEL_28:

LABEL_30:
LABEL_31:

}

void __63__PKPaymentTransactionDetailViewController__presentReportIssue__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__PKPaymentTransactionDetailViewController__presentReportIssue__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __63__PKPaymentTransactionDetailViewController__presentReportIssue__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  PKTransactionSupportTopicsViewController *v3;
  PKNavigationController *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    v5 = WeakRetained;
    v3 = -[PKTransactionSupportTopicsViewController initWithAccount:transaction:transactionSourceCollection:familyCollection:accountUserCollection:physicalCards:]([PKTransactionSupportTopicsViewController alloc], "initWithAccount:transaction:transactionSourceCollection:familyCollection:accountUserCollection:physicalCards:", *(_QWORD *)(a1 + 32), v5[174], v5[175], v5[152], v5[154], v5[156]);
    v4 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v3);
    objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

    WeakRetained = v5;
  }

}

- (void)_presentContactViewController
{
  PKAccountUserCollection *accountUserCollection;
  PKPaymentTransaction *transaction;
  PKPaymentPass *v5;
  PKFamilyMemberCollection *familyCollection;
  void *v7;
  void *v8;
  PKBusinessChatTransactionDisputeContext *v9;
  id v10;
  id v11;

  if (self->_accountResolutionController)
  {
    accountUserCollection = self->_accountUserCollection;
    transaction = self->_transaction;
    v5 = self->_paymentPass;
    -[PKAccountUserCollection accountUserForTransaction:](accountUserCollection, "accountUserForTransaction:", transaction);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    familyCollection = self->_familyCollection;
    objc_msgSend(v11, "altDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFamilyMemberCollection familyMemberForAltDSID:](familyCollection, "familyMemberForAltDSID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[PKBusinessChatTransactionDisputeContext initWithPaymentPass:transaction:account:accountUser:familyMember:physicalCards:intent:]([PKBusinessChatTransactionDisputeContext alloc], "initWithPaymentPass:transaction:account:accountUser:familyMember:physicalCards:intent:", v5, self->_transaction, self->_account, v11, v8, self->_physicalCards, 6);
    v10 = objc_alloc_init(MEMORY[0x1E0D668F0]);
    objc_msgSend(v10, "setBusinessChatContext:", v9);
    -[PKAccountServiceAccountResolutionController presentFlowForAccountResolution:configuration:completion:](self->_accountResolutionController, "presentFlowForAccountResolution:configuration:completion:", 2, v10, 0);

  }
  else
  {
    -[PKPaymentTransactionDetailViewController _presentContactIssuer](self, "_presentContactIssuer");
  }
}

- (void)_cancelPeerPaymentPendingRequest
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  -[PKPaymentTransactionDetailViewController _peerPaymentController](self, "_peerPaymentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction identifier](self->_transaction, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D6B208];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__PKPaymentTransactionDetailViewController__cancelPeerPaymentPendingRequest__block_invoke;
  v7[3] = &unk_1E3E7B0A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v3, "performPendingRequestAction:withRequestToken:completion:", v5, v6, v7);

}

void __76__PKPaymentTransactionDetailViewController__cancelPeerPaymentPendingRequest__block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  char v15;
  id location;

  v6 = a4;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__PKPaymentTransactionDetailViewController__cancelPeerPaymentPendingRequest__block_invoke_2;
  v10[3] = &unk_1E3E799D8;
  objc_copyWeak(&v14, &location);
  v15 = a2;
  v11 = v6;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v7;
  v13 = v8;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __76__PKPaymentTransactionDetailViewController__cancelPeerPaymentPendingRequest__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 64) || (v6 = *(void **)(a1 + 32)) == 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "navigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (id)objc_msgSend(v4, "popToRootViewControllerAnimated:", 1);

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "localizedDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v8;
        _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentTransactionDetailViewController: Error attempting to cancel pending request: %@", buf, 0xCu);

      }
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PENDING_REQUEST_ACTION_ERROR_ALERT_TITLE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, 0, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __76__PKPaymentTransactionDetailViewController__cancelPeerPaymentPendingRequest__block_invoke_604;
      v14[3] = &unk_1E3E73400;
      objc_copyWeak(&v17, v2);
      v15 = *(id *)(a1 + 32);
      v16 = *(id *)(a1 + 40);
      objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "addAction:", v13);
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v10, 1, 0);

      objc_destroyWeak(&v17);
    }
  }

}

void __76__PKPaymentTransactionDetailViewController__cancelPeerPaymentPendingRequest__block_invoke_604(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6B2D8]);

    if (v6)
    {
      v7 = objc_msgSend(v4, "code");
      if ((unint64_t)(v7 - 40314) <= 0x13 && ((1 << (v7 - 122)) & 0xC0003) != 0)
      {
        objc_msgSend(WeakRetained[137], "peerPaymentService");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "deletePeerPaymentPendingRequestsForRequestTokens:", v10);

      }
    }
    objc_msgSend(WeakRetained, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "popToRootViewControllerAnimated:", 1);

  }
}

- (void)_openBusinessChatControllerForContext:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  if (self->_accountResolutionController)
  {
    v4 = (objc_class *)MEMORY[0x1E0D668F0];
    v5 = a3;
    v6 = objc_alloc_init(v4);
    objc_msgSend(v6, "setBusinessChatContext:", v5);

    -[PKAccountServiceAccountResolutionController presentFlowForAccountResolution:configuration:completion:](self->_accountResolutionController, "presentFlowForAccountResolution:configuration:completion:", 3, v6, 0);
  }
}

- (id)_transactionStatusString
{
  PKPeerPaymentStatusResponse *peerPaymentStatusResponse;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;

  peerPaymentStatusResponse = self->_peerPaymentStatusResponse;
  if (!peerPaymentStatusResponse
    || -[PKPeerPaymentStatusResponse status](peerPaymentStatusResponse, "status") == -1
    || (v4 = PKPaymentTransactionStatusFromPeerPaymentStatus(), v4 == -1))
  {
    v5 = -[PKPaymentTransaction transactionStatus](self->_transaction, "transactionStatus");
  }
  else
  {
    v5 = v4;
  }
  if ((unint64_t)(-[PKPaymentTransaction disputeStatus](self->_transaction, "disputeStatus") - 1) > 4)
  {
    v6 = 0;
  }
  else
  {
    PKLocalizedFeatureString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = -[PKPaymentTransaction transactionType](self->_transaction, "transactionType");
  v8 = -[PKPaymentTransaction featureIdentifier](self->_transaction, "featureIdentifier");
  if (v6)
    return v6;
  switch(v5)
  {
    case 0:
    case 8:
      if (v7 != 2)
      {
        if (v8 == 2)
        {
          if (v7 != 10)
            goto LABEL_31;
        }
        else if (v8 != 5)
        {
          goto LABEL_31;
        }
        PKLocalizedFeatureString();
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_36;
      }
      if (-[PKPaymentTransaction enRoute](self->_transaction, "enRoute"))
        goto LABEL_13;
LABEL_31:
      v10 = CFSTR("TRANSACTION_DETAIL_STATUS_VALUE_PENDING");
LABEL_35:
      PKLocalizedPeerPaymentString(&v10->isa);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_36:
      v6 = (void *)v9;
      return v6;
    case 1:
      switch(v7)
      {
        case 1:
          goto LABEL_20;
        case 10:
          break;
        case 3:
          if (-[PKPaymentTransaction peerPaymentStatus](self->_transaction, "peerPaymentStatus") != 1)
          {
LABEL_38:
            -[PKPaymentTransaction transfers](self->_transaction, "transfers");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "firstObject");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              if (!objc_msgSend(v13, "fundsAreAvailable"))
              {
                PKLocalizedFeatureString();
                v14 = objc_claimAutoreleasedReturnValue();
LABEL_46:
                v6 = (void *)v14;

                return v6;
              }
            }
            else
            {
              -[PKPaymentTransaction accountIdentifier](self->_transaction, "accountIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
              {
                v16 = CFSTR("TRANSACTION_DETAIL_STATUS_VALUE_CLEARED");
LABEL_45:
                PKLocalizedPeerPaymentString(&v16->isa);
                v14 = objc_claimAutoreleasedReturnValue();
                goto LABEL_46;
              }
              -[PKPaymentTransaction barcodeIdentifier](self->_transaction, "barcodeIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v17)
              {
                v16 = CFSTR("TRANSACTION_DETAIL_STATUS_VALUE_APPROVED");
                goto LABEL_45;
              }
            }
            v16 = CFSTR("TRANSACTION_DETAIL_STATUS_VALUE_COMPLETED");
            goto LABEL_45;
          }
          break;
        case 2:
          if (-[PKPaymentTransaction enRoute](self->_transaction, "enRoute"))
          {
LABEL_13:
            PKLocalizedPaymentString(CFSTR("TRANSIT_TRANSACTION_STATUS_EN_ROUTE"));
            v9 = objc_claimAutoreleasedReturnValue();
            goto LABEL_36;
          }
          break;
        default:
          goto LABEL_38;
      }
      v10 = CFSTR("TRANSACTION_DETAIL_STATUS_VALUE_COMPLETED");
      goto LABEL_35;
    case 2:
      v10 = CFSTR("TRANSACTION_DETAIL_STATUS_VALUE_DECLINED");
      goto LABEL_35;
    case 3:
LABEL_20:
      v10 = CFSTR("TRANSACTION_DETAIL_STATUS_VALUE_REFUNDED");
      goto LABEL_35;
    case 4:
      v10 = CFSTR("TRANSACTION_DETAIL_STATUS_VALUE_FAILED");
      goto LABEL_35;
    case 5:
      v10 = CFSTR("TRANSACTION_DETAIL_STATUS_VALUE_CANCELED");
      goto LABEL_35;
    case 6:
      v10 = CFSTR("TRANSACTION_DETAIL_STATUS_VALUE_REJECTED");
      goto LABEL_35;
    case 7:
      v10 = CFSTR("TRANSACTION_DETAIL_STATUS_VALUE_EXPIRED");
      goto LABEL_35;
    default:
      v6 = 0;
      return v6;
  }
}

- (void)transactionsChanged:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[PKPaymentTransaction identifier](self->_transaction, "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = PKEqualObjects();

        if (v12)
        {
          -[PKPaymentTransactionDetailViewController setTransaction:](self, "setTransaction:", v9);
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)_merchantAddressCellForTableView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 inBridge;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionLocationMapCellReuseIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTransaction:", self->_transaction);
  if (self->_inBridge)
  {
    PKBridgeAppearanceGetAppearanceSpecifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitleLabelColor:", v6);

    inBridge = self->_inBridge;
  }
  else
  {
    inBridge = 0;
  }
  objc_msgSend(v4, "setUsesDarkMapAppearance:", inBridge);
  return v4;
}

- (id)_mapTilePlaceholderImage
{
  UIImage *mapTilePlaceholderImage;
  UIImage *v4;
  UIImage *v5;

  mapTilePlaceholderImage = self->_mapTilePlaceholderImage;
  if (!mapTilePlaceholderImage)
  {
    PKUIImageNamed(CFSTR("MapTilePlaceholder"));
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v5 = self->_mapTilePlaceholderImage;
    self->_mapTilePlaceholderImage = v4;

    mapTilePlaceholderImage = self->_mapTilePlaceholderImage;
  }
  return mapTilePlaceholderImage;
}

- (void)_tableView:(id)a3 didSelectMechantAddressAtIndexPath:(id)a4
{
  id v6;
  id v7;
  PKPaymentTransaction *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  dispatch_time_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  id location;
  _QWORD handler[4];
  NSObject *v32;
  id v33;
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_transaction;
  -[PKPaymentTransaction merchant](v8, "merchant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mapsMerchant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "identifier");
  v12 = objc_msgSend(v10, "resultProviderIdentifier");
  if (v11)
  {
    v13 = v12;
    v14 = objc_alloc_init(MEMORY[0x1E0CC1808]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setMuids:", v16);

    if ((int)v13 >= 1)
      objc_msgSend(v14, "_setResultProviderID:", v13);
    v17 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    v18 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v19 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __90__PKPaymentTransactionDetailViewController__tableView_didSelectMechantAddressAtIndexPath___block_invoke;
    handler[3] = &unk_1E3E61388;
    v20 = v17;
    v32 = v20;
    v21 = v24;
    v33 = v21;
    dispatch_source_set_event_handler(v20, handler);
    dispatch_resume(v20);
    objc_msgSend(v21, "setUserInteractionEnabled:", 0);
    objc_initWeak(&location, self);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC17F0]), "initWithRequest:", v14);
    v25[0] = v19;
    v25[1] = 3221225472;
    v25[2] = __90__PKPaymentTransactionDetailViewController__tableView_didSelectMechantAddressAtIndexPath___block_invoke_2;
    v25[3] = &unk_1E3E7B0C8;
    v23 = v20;
    v26 = v23;
    objc_copyWeak(&v29, &location);
    v27 = v21;
    v28 = v10;
    objc_msgSend(v22, "startWithCompletionHandler:", v25);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
}

uint64_t __90__PKPaymentTransactionDetailViewController__tableView_didSelectMechantAddressAtIndexPath___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
    dispatch_source_cancel(v2);
  return objc_msgSend(*(id *)(a1 + 40), "setShowsActionSpinner:", 1);
}

void __90__PKPaymentTransactionDetailViewController__tableView_didSelectMechantAddressAtIndexPath___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD *WeakRetained;
  NSObject *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  PKMerchantMapViewController *v16;
  void *v17;
  void *v18;
  PKMerchantMapViewController *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  if (v7)
    dispatch_source_cancel(v7);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (objc_msgSend(WeakRetained, "isViewLoaded"))
  {
    objc_msgSend(*(id *)(a1 + 40), "setShowsActionSpinner:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setUserInteractionEnabled:", 1);
    if (v6
      || (objc_msgSend(v5, "mapItems"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "count"),
          v12,
          !v13))
    {
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_msgSend(*(id *)(a1 + 48), "identifier");
        if (v6)
        {
          objc_msgSend(v6, "localizedDescription");
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = CFSTR("no map items.");
        }
        *(_DWORD *)buf = 134218242;
        v24 = v10;
        v25 = 2112;
        v26 = v11;
        _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "PKPaymentTransactionDetailViewController: MKLocalSearch could not resolve merchant maps for mapsID: %llu. Error: %@", buf, 0x16u);
        if (v6)

      }
    }
    else if (WeakRetained[135] == 2)
    {
      v14 = (void *)MEMORY[0x1E0CC1828];
      objc_msgSend(v5, "mapItems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __90__PKPaymentTransactionDetailViewController__tableView_didSelectMechantAddressAtIndexPath___block_invoke_3;
      v21[3] = &unk_1E3E62288;
      v22 = *(id *)(a1 + 48);
      objc_msgSend(v14, "openMapsWithItems:launchOptions:completionHandler:", v15, 0, v21);

    }
    else
    {
      v16 = [PKMerchantMapViewController alloc];
      objc_msgSend(v5, "mapItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[PKMerchantMapViewController initWithMapItem:configOptions:](v16, "initWithMapItem:configOptions:", v18, 129);

      objc_msgSend(WeakRetained, "navigationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "pushViewController:animated:", v19, 1);

    }
  }

}

void __90__PKPaymentTransactionDetailViewController__tableView_didSelectMechantAddressAtIndexPath___block_invoke_3(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "identifier");
      v5 = 134217984;
      v6 = v4;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Bridge failed to launch Maps with merchant maps identifier: %llu", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)_handleCoarseLocationChangedNotification:(id)a3
{
  PKCoarseLocationMonitor *v4;
  PKCoarseLocationMonitor *coarseLocationMonitor;
  _QWORD block[5];

  objc_msgSend(a3, "object");
  v4 = (PKCoarseLocationMonitor *)objc_claimAutoreleasedReturnValue();
  coarseLocationMonitor = self->_coarseLocationMonitor;

  if (v4 == coarseLocationMonitor)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__PKPaymentTransactionDetailViewController__handleCoarseLocationChangedNotification___block_invoke;
    block[3] = &unk_1E3E612E8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __85__PKPaymentTransactionDetailViewController__handleCoarseLocationChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isSectionMapped:", 7);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "reloadSection:", 7);
  return result;
}

- (unint64_t)_amountDetailsRowForIndex:(unint64_t)a3
{
  unint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  do
  {
    if (-[PKPaymentTransactionDetailViewController _amountDetailsRowIsEnabled:](self, "_amountDetailsRowIsEnabled:", v5))
    {
      if (v6 == a3)
        break;
      ++v6;
    }
    ++v5;
  }
  while (v5 != 5);
  if (v5 >= 4)
    return 4;
  else
    return v5;
}

- (unint64_t)_numberOfAmountDetailsRows
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0;
  v4 = 0;
  while (!-[PKPaymentTransactionDetailViewController _amountDetailsRowIsEnabled:](self, "_amountDetailsRowIsEnabled:", v3))
  {
LABEL_5:
    if (++v3 == 5)
      return v4;
  }
  if (v3 != 4)
  {
    ++v4;
    goto LABEL_5;
  }
  v4 += -[NSArray count](self->_lineItems, "count");
  return v4;
}

- (BOOL)_amountDetailsRowIsEnabled:(unint64_t)a3
{
  void *v4;
  BOOL v5;
  BOOL v7;
  PKRetrieveMerchantTokensResponse *merchantTokenResponse;
  void *v9;

  switch(a3)
  {
    case 0uLL:
      -[PKPaymentTransaction associatedFinancingPlan](self->_transaction, "associatedFinancingPlan");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4 != 0;

      return v5;
    case 1uLL:
      if (-[PKPaymentTransaction transactionType](self->_transaction, "transactionType") == 2)
      {
        -[PKPaymentTransaction transitType](self->_transaction, "transitType");
        return PKPaymentTransactionTransitSubtypeIsPaymentActivity();
      }
      else
      {
        return 1;
      }
    case 2uLL:
      v7 = self->_transactionExplanation == 0;
      return !v7;
    case 3uLL:
      merchantTokenResponse = self->_merchantTokenResponse;
      if (!merchantTokenResponse)
        return 0;
      -[PKRetrieveMerchantTokensResponse merchantTokens](merchantTokenResponse, "merchantTokens");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v9, "count") == 0;

      return v5;
    case 4uLL:
      v7 = -[NSArray count](self->_lineItems, "count") == 0;
      return !v7;
    default:
      return 0;
  }
}

- (unint64_t)_lineItemItemForRowIndex:(unint64_t)a3
{
  unint64_t v5;

  v5 = -[PKPaymentTransactionDetailViewController _numberOfAmountDetailsRows](self, "_numberOfAmountDetailsRows");
  return a3 - v5 + -[NSArray count](self->_lineItems, "count");
}

- (void)_applyAmountDetailSeparatorInsetForTableView:(id)a3 cell:(id)a4
{
  double v4;
  double v5;
  double v6;
  id v7;

  v7 = a4;
  objc_msgSend(v7, "separatorInset");
  v6 = fmax(v4, v5);
  objc_msgSend(v7, "setSeparatorInset:", 0.0, v6, 0.0, v6);

}

- (id)_amountDetailsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  switch(-[PKPaymentTransactionDetailViewController _amountDetailsRowForIndex:](self, "_amountDetailsRowForIndex:", objc_msgSend(v7, "row")))
  {
    case 0uLL:
      -[PKPaymentTransactionDetailViewController _financingPlanDetailsCellForTableView:](self, "_financingPlanDetailsCellForTableView:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1uLL:
      -[PKPaymentTransactionDetailViewController _statusCellForTableView:](self, "_statusCellForTableView:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2uLL:
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKPaymentTransactionTransactionExplanationCellReuseIdentifier"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNumberOfLines:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTextColor:", v11);

      objc_msgSend(v10, "setText:", self->_transactionExplanation);
      objc_msgSend(v10, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
      -[PKPaymentTransactionDetailViewController _applyAmountDetailSeparatorInsetForTableView:cell:](self, "_applyAmountDetailSeparatorInsetForTableView:cell:", v6, v9);

      break;
    case 3uLL:
      -[PKPaymentTransactionDetailViewController _merchantTokenDeletedCellForTableView:atIndexPath:](self, "_merchantTokenDeletedCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4uLL:
      -[PKPaymentTransactionDetailViewController _tableView:cellForAmountDetailLineItemAtIndex:atIndexPath:](self, "_tableView:cellForAmountDetailLineItemAtIndex:atIndexPath:", v6, -[PKPaymentTransactionDetailViewController _lineItemItemForRowIndex:](self, "_lineItemItemForRowIndex:", objc_msgSend(v7, "row")), v7);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v9 = (void *)v8;
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (id)_questionCellForTableView:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKPaymentTransactionQuestionCellReuseIdentifier"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction altDSID](self->_transaction, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
  PKCurrentUserAltDSID();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v7;
  if (v8 == v9)
  {
    v12 = 0;
    v13 = v8;
    v14 = v8;
LABEL_9:

    goto LABEL_10;
  }
  v10 = v9;
  if (!v9)
  {

    goto LABEL_8;
  }
  v11 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v11 & 1) == 0)
  {
LABEL_8:
    -[PKAccountUserCollection accountUserWithAltDSID:](self->_accountUserCollection, "accountUserWithAltDSID:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFamilyMemberCollection familyMemberForAltDSID:](self->_familyCollection, "familyMemberForAltDSID:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0D66C60];
    objc_msgSend(v14, "nameComponents");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contactForFamilyMember:nameComponents:imageData:", v13, v8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_5:
  v12 = 0;
LABEL_10:
  objc_msgSend(v5, "setTransaction:accountUserContact:submittingAnswer:", self->_transaction, v12, self->_submittingAnswer);
  objc_msgSend(v5, "setQuestionDelegate:", self);

  return v5;
}

- (id)_statusCellForTableView:(id)a3
{
  PKPaymentPass *v4;
  void *v5;
  int *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  PKPaymentTransaction *transaction;
  uint64_t v24;
  PKPaymentTransaction *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  __CFString *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  PKPaymentTransaction *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  PKContactResolver *contactResolver;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  id v72;
  void *v73;
  __CFString *v74;
  PKPaymentTransaction *v75;
  NSString *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  PKPaymentTransaction *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  id v105;
  PKPaymentTransactionDetailViewController *v106;
  void *v107;
  void *v108;
  id v109;
  uint64_t v110;
  void *v111;
  int IsBetweenDates;
  char v113;
  int v114;
  void *v115;
  uint64_t v116;
  int v117;
  int v118;
  int v119;
  __CFString *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  void *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  id v148;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  BOOL v153;
  void *v154;
  void *v155;
  uint64_t v156;
  PKTransactionStatusCell *v157;
  PKTransactionStatusCell *v158;
  PKTransactionStatusCell *v159;
  void *v160;
  void *v161;
  void *v162;
  PKPaymentPass *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v173;
  uint64_t v174;
  uint64_t v175;
  NSDateFormatter *productTimeZoneMonthDayFormatter;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  PKPaymentTransactionDetailViewController *v187;
  PKPaymentTransactionDetailViewController *v188;
  uint64_t v189;
  void *v190;
  void *v191;
  id v192;
  PKPaymentPass *v193;
  void *v194;
  void *v195;
  void *v196;
  _QWORD v197[4];
  id v198;
  id location;
  _QWORD v200[6];

  v192 = a3;
  v4 = self->_paymentPass;
  -[PKPaymentPass localizedDescription](v4, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = &OBJC_IVAR___PKExpressTransactionBannerViewController__psuedoShrunkSize;
  if (!v5)
  {
    -[PKTransactionSourceCollection transactionSourcesForType:](self->_transactionSourceCollection, "transactionSourcesForType:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "account");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "associatedPassUniqueID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "passWithUniqueID:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedDescription");
      v14 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v14;
    }
    else
    {
      v5 = 0;
    }
  }
  v193 = v4;
  v15 = -[PKAccount feature](self->_account, "feature");
  if (v5)
    v16 = 0;
  else
    v16 = v15 == 5;
  if (v16)
  {
    PKLocalizedFeatureString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = 0;
  v18 = 0;
  v194 = 0;
  v196 = 0;
  v19 = 0;
  v20 = 0;
  switch(-[PKPaymentTransaction transactionType](self->_transaction, "transactionType"))
  {
    case 0:
    case 17:
      -[PKPaymentTransactionDetailViewController _transactionStatusString](self, "_transactionStatusString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[PKPaymentTransaction transactionStatus](self->_transaction, "transactionStatus");
      transaction = self->_transaction;
      if (v22 == 2)
      {
        v24 = -[PKPaymentTransaction transactionDeclinedReason](transaction, "transactionDeclinedReason");
        v25 = self->_transaction;
        if (v24 == 14)
        {
          v26 = -[PKPaymentTransaction cardType](v25, "cardType");
          if (v26 == 6 || v26 == 5)
          {
            PKLocalizedFeatureString();
            v100 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            PKPaymentTransactionDeclinedReasonLocalizedString();
            v100 = objc_claimAutoreleasedReturnValue();
          }
          v19 = (void *)v100;
          if (v100)
          {
            objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_154;
          }
          goto LABEL_141;
        }
        v56 = v20;
        -[PKPaymentTransaction unansweredQuestions](v25, "unansweredQuestions");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "count");

        if (v58)
        {
          PKLocalizedFeatureString();
          v59 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v56;
          v6 = &OBJC_IVAR___PKExpressTransactionBannerViewController__psuedoShrunkSize;
          v19 = (void *)v59;
          goto LABEL_67;
        }
        -[PKPaymentTransaction questions](self->_transaction, "questions");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v81, "count");

        if (v82)
        {
          if (-[PKPaymentTransaction reviewed](self->_transaction, "reviewed"))
          {
            PKLocalizedFeatureString();
            v17 = 0;
            v20 = v56;
            v6 = &OBJC_IVAR___PKExpressTransactionBannerViewController__psuedoShrunkSize;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_67;
          }
        }
        else
        {
          PKPaymentTransactionDeclinedReasonLocalizedString();
          v133 = objc_claimAutoreleasedReturnValue();
          if (v133)
          {
            v134 = (void *)v133;
            objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = 0;
            v194 = 0;
            v196 = 0;
            v20 = v56;
            v6 = &OBJC_IVAR___PKExpressTransactionBannerViewController__psuedoShrunkSize;
            v19 = v134;
            goto LABEL_156;
          }
        }
        v17 = 0;
        v20 = v56;
        v6 = &OBJC_IVAR___PKExpressTransactionBannerViewController__psuedoShrunkSize;
        goto LABEL_142;
      }
      -[PKPaymentTransaction unansweredQuestions](transaction, "unansweredQuestions");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "count");

      if (v55 || -[PKPaymentTransaction reviewed](self->_transaction, "reviewed"))
      {
        PKLocalizedFeatureString();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[PKPaymentTransaction primaryFundingSourceDescription](self->_transaction, "primaryFundingSourceDescription");
        v97 = (void *)objc_claimAutoreleasedReturnValue();

        v98 = self->_transaction;
        if (!v97)
        {
          -[PKPaymentTransaction transfers](v98, "transfers");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          v136 = objc_msgSend(v135, "count");

          if (!v136)
          {
LABEL_141:
            v17 = 0;
LABEL_142:
            v147 = -[PKPaymentTransaction effectiveTransactionSource](self->_transaction, "effectiveTransactionSource");
            if (v147 == 6 || v147 == 5)
            {
              PKLocalizedFeatureString();
              v148 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v148 = v5;
            }
            v19 = v148;
            -[PKPaymentTransaction cardNumberSuffix](self->_transaction, "cardNumberSuffix");
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            if (v149)
            {
              PKMaskedPaymentPAN();
              v194 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v194 = 0;
            }

            v18 = 0;
            v196 = 0;
            goto LABEL_156;
          }
          v137 = v20;
          -[PKPaymentTransaction transfers](self->_transaction, "transfers");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "firstObject");
          v139 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v139, "externalAccount");
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          v141 = -[PKPaymentTransaction featureIdentifier](self->_transaction, "featureIdentifier");
          v142 = -[PKPaymentTransaction associatedFeatureIdentifier](self->_transaction, "associatedFeatureIdentifier");
          v143 = 0;
          if (v141 == 1 && v142)
          {
            PKLocalizedFeatureString();
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "displayDescription");
            v145 = v5;
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAIL_STATUS_SUBTITLE_WITHDRAW_FROM_TO_FORMAT"), CFSTR("%@%@"), v146, v144);
            v143 = objc_claimAutoreleasedReturnValue();

            v5 = v145;
          }

          v17 = 0;
          v20 = v137;
          v6 = &OBJC_IVAR___PKExpressTransactionBannerViewController__psuedoShrunkSize;
          v19 = (void *)v143;
LABEL_67:
          if (v19)
            goto LABEL_154;
          goto LABEL_142;
        }
        -[PKPaymentTransaction primaryFundingSourceDescription](v98, "primaryFundingSourceDescription");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAIL_STATUS_SUBTITLE_PAID_WITH_FORMAT"), CFSTR("%@"), v99);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v17 = 0;
      goto LABEL_67;
    case 1:
      PKLocalizedPaymentString(CFSTR("REFUNDED_PURCHASE"));
      v27 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 2:
      -[PKPaymentTransactionDetailViewController _transactionStatusString](self, "_transactionStatusString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[PKPaymentTransaction transitModifiers](self->_transaction, "transitModifiers");
      if ((v31 & 1) == 0)
      {
        if ((~v31 & 6) != 0)
        {
          if ((v31 & 2) != 0)
          {
            v32 = CFSTR("TRANSIT_TRANSACTION_TRANSFER");
          }
          else if ((v31 & 4) != 0)
          {
            v32 = CFSTR("TRANSIT_TRANSACTION_ANNOTATION_FARECAPPED_DISCOUNT");
          }
          else
          {
            if (-[PKPaymentTransaction transitType](self->_transaction, "transitType") != 1026)
            {
              -[PKPaymentPass localizedDescription](v4, "localizedDescription");
              v173 = (void *)objc_claimAutoreleasedReturnValue();
              PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAIL_STATUS_SUBTITLE_PAID_WITH_FORMAT"), CFSTR("%@"), v173);
              v174 = objc_claimAutoreleasedReturnValue();

              v17 = 0;
              v18 = 0;
              v194 = 0;
              v196 = 0;
              v19 = 0;
              v20 = (void *)v174;
              goto LABEL_156;
            }
            v32 = CFSTR("TRANSIT_TRANSACTION_ANNOTATION_NO_CHARGE");
          }
        }
        else
        {
          v32 = CFSTR("TRANSIT_TRANSACTION_ANNOTATION_FARECAPPED_TRANSFER_DISCOUNT");
        }
        PKLocalizedPaymentString(&v32->isa);
        v30 = objc_claimAutoreleasedReturnValue();
        goto LABEL_152;
      }
      PKPassLocalizedStringWithFormat();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAIL_STATUS_SUBTITLE_PAID_WITH_FORMAT"), CFSTR("%@"), v28);
      v29 = objc_claimAutoreleasedReturnValue();
LABEL_54:
      v19 = (void *)v29;

      goto LABEL_153;
    case 3:
      v183 = v5;
      -[PKPaymentTransaction peerPaymentCounterpartHandle](self->_transaction, "peerPaymentCounterpartHandle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PKPaymentTransaction peerPaymentPaymentMode](self->_transaction, "peerPaymentPaymentMode") == 2)
      {
        v34 = v33;
        v35 = 0;
      }
      else
      {
        v60 = -[PKContactResolver hasCachedResultForHandle:](self->_contactResolver, "hasCachedResultForHandle:", v33);
        contactResolver = self->_contactResolver;
        if (v60)
        {
          -[PKContactResolver contactForHandle:](contactResolver, "contactForHandle:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v200[0] = MEMORY[0x1E0C809B0];
          v200[1] = 3221225472;
          v200[2] = __68__PKPaymentTransactionDetailViewController__statusCellForTableView___block_invoke;
          v200[3] = &unk_1E3E69FC0;
          v200[4] = self;
          -[PKContactResolver contactForHandle:withCompletion:](contactResolver, "contactForHandle:withCompletion:", v33, v200);
          v35 = 0;
        }
        objc_msgSend(MEMORY[0x1E0D67400], "displayNameForCounterpartHandle:contact:", v33, v35);
        v34 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[PKPaymentTransactionDetailViewController _transactionStatusString](self, "_transactionStatusString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      switch(-[PKPaymentTransaction peerPaymentType](self->_transaction, "peerPaymentType"))
      {
        case 0:
          v72 = v34;
          goto LABEL_85;
        case 1:
          v73 = v20;
          v74 = CFSTR("TRANSACTION_DETAIL_STATUS_SUBTITLE_SENT_TO_CONTACT_NAME_FORMAT");
          if (!v35)
            v74 = CFSTR("TRANSACTION_DETAIL_STATUS_SUBTITLE_SENT_TO_HANDLE_FORMAT");
          v75 = self->_transaction;
          v76 = v74;
          if (-[PKPaymentTransaction isRecurring](v75, "isRecurring"))
          {
            PKLocalizedPeerPaymentRecurringString(v76, CFSTR("%@"), v34);
            v77 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_111:
            v20 = v73;
            v6 = &OBJC_IVAR___PKExpressTransactionBannerViewController__psuedoShrunkSize;
            v19 = v77;
            goto LABEL_114;
          }
          PKLocalizedPeerPaymentString(v76, CFSTR("%@"), v34);
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          if (-[PKPaymentTransaction peerPaymentPaymentMode](self->_transaction, "peerPaymentPaymentMode") != 2)
            goto LABEL_111;
          PKLocalizedNearbyPeerPaymentString(CFSTR("TRANSACTION_DETAIL_STATUS_SUBTITLE_SENT_VIA_NEARBY"), CFSTR("%@"), v77);
          v80 = objc_claimAutoreleasedReturnValue();

LABEL_109:
          v20 = v73;
          v6 = &OBJC_IVAR___PKExpressTransactionBannerViewController__psuedoShrunkSize;
LABEL_110:
          v19 = (void *)v80;
LABEL_114:

LABEL_115:
          v17 = 0;
          v18 = 0;
          v194 = 0;
          v196 = 0;
LABEL_116:
          v5 = v183;
          break;
        case 2:
          if (-[PKPaymentTransaction isRecurring](self->_transaction, "isRecurring"))
          {
            PKLocalizedPeerPaymentRecurringString(CFSTR("TRANSACTION_DETAIL_STATUS_SUBTITLE_SENT_FROM_FORMAT"), CFSTR("%@"), v34);
            v72 = (id)objc_claimAutoreleasedReturnValue();
LABEL_85:
            v19 = v72;
            goto LABEL_114;
          }
          PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAIL_STATUS_SUBTITLE_SENT_FROM_FORMAT"), CFSTR("%@"), v34);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[PKPaymentTransaction peerPaymentPaymentMode](self->_transaction, "peerPaymentPaymentMode") != 2)
            goto LABEL_114;
          PKLocalizedNearbyPeerPaymentString(CFSTR("TRANSACTION_DETAIL_STATUS_SUBTITLE_SENT_VIA_NEARBY"), CFSTR("%@"), v19);
          v80 = objc_claimAutoreleasedReturnValue();

          goto LABEL_110;
        case 3:
          -[PKPaymentTransaction expirationDate](self->_transaction, "expirationDate");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          PKMediumDateString();
          v73 = v20;
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAIL_STATUS_SUBTITLE_REQUEST_TO_FORMAT"), CFSTR("%@%@"), v34, v79);
          v80 = objc_claimAutoreleasedReturnValue();

          goto LABEL_109;
        default:
          v19 = 0;
          goto LABEL_114;
      }
      goto LABEL_156;
    case 4:
      if (-[PKPaymentTransaction isBankConnectTransaction](self->_transaction, "isBankConnectTransaction"))goto LABEL_12;
      PKLocalizedPaymentString(CFSTR("TRANSACTION_TYPE_FEE"));
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 5:
      -[PKPaymentTransactionDetailViewController _transactionStatusString](self, "_transactionStatusString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[PKPaymentTransaction secondaryFundingSourceType](self->_transaction, "secondaryFundingSourceType");
      v37 = self->_transaction;
      if (v36 != 2)
      {
        v62 = v20;
        v184 = v5;
        -[PKPaymentTransaction transfers](v37, "transfers");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "count");

        if (v64)
        {
          -[PKPaymentTransaction transfers](self->_transaction, "transfers");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "firstObject");
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v66, "externalAccount");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = -[PKPaymentTransaction featureIdentifier](self->_transaction, "featureIdentifier");
          v69 = -[PKPaymentTransaction associatedFeatureIdentifier](self->_transaction, "associatedFeatureIdentifier");
          objc_msgSend(v67, "displayDescription");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          if (v68 == 1)
          {
            if (v69)
              PKLocalizedFeatureString();
            else
              PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_SECONDARY_FUNDING_SOURCE_BANK_ACCOUNT_DESCRIPTION_GENERIC"));
            v101 = v70;
            v70 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            PKLocalizedFeatureString();
            v101 = (void *)objc_claimAutoreleasedReturnValue();
          }
          PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAIL_STATUS_SUBTITLE_WITHDRAW_FROM_TO_FORMAT"), CFSTR("%@%@"), v101, v70);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = 0;
          v18 = 0;
          v194 = 0;
          v196 = 0;
          v5 = v184;
          v20 = v62;
          goto LABEL_184;
        }
        v83 = objc_alloc(MEMORY[0x1E0D67730]);
        objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentTransaction secondaryFundingSourceFPANIdentifier](self->_transaction, "secondaryFundingSourceFPANIdentifier");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "passWithFPANIdentifier:", v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = (void *)objc_msgSend(v83, "initWithPaymentPass:", v86);

        objc_msgSend(MEMORY[0x1E0D67390], "secondaryFundingSourceDescriptionForTransaction:secondarySource:includeBankAccountSuffix:useGenericNameIfNoDescriptionAvailable:", self->_transaction, v87, 1, 1);
        v88 = objc_claimAutoreleasedReturnValue();
        v89 = (void *)v88;
        if (v88)
        {
          v5 = v184;
          PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAIL_STATUS_SUBTITLE_WITHDRAW_FROM_TO_FORMAT"), CFSTR("%@%@"), v184, v88);
        }
        else
        {
          v5 = v184;
          if ((-[PKPaymentTransaction isBankConnectTransaction](self->_transaction, "isBankConnectTransaction") & 1) != 0)
          {
            v19 = 0;
LABEL_183:
            v20 = v62;

            v17 = 0;
            v18 = 0;
            v194 = 0;
            v196 = 0;
LABEL_184:
            v6 = &OBJC_IVAR___PKExpressTransactionBannerViewController__psuedoShrunkSize;
            goto LABEL_156;
          }
          PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAIL_STATUS_SUBTITLE_WITHDRAW_FROM_FORMAT"), CFSTR("%@"), v184);
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_183;
      }
      if ((-[PKPaymentTransaction isBankConnectTransaction](v37, "isBankConnectTransaction") & 1) != 0)
      {
LABEL_14:
        v17 = 0;
        v18 = 0;
        v194 = 0;
        v196 = 0;
        v19 = 0;
        goto LABEL_156;
      }
      PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAIL_STATUS_SUBTITLE_WITHDRAW_FROM_FORMAT"), CFSTR("%@"), v5);
LABEL_25:
      v30 = objc_claimAutoreleasedReturnValue();
LABEL_152:
      v19 = (void *)v30;
LABEL_153:
      v17 = 0;
LABEL_154:
      v18 = 0;
      v196 = 0;
LABEL_155:
      v194 = 0;
LABEL_156:
      v150 = -[PKPaymentTransaction disputeStatus](self->_transaction, "disputeStatus");
      v151 = -[PKPaymentTransaction disputeType](self->_transaction, "disputeType");
      v152 = -[PKPaymentTransaction transactionType](self->_transaction, "transactionType");
      if (v150 == 5)
      {
        if (v152)
          v153 = 0;
        else
          v153 = v151 == 1;
        if (v153)
        {
          -[PKPaymentTransaction disputeStatusDetails](self->_transaction, "disputeStatusDetails");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v154, "statusReasons");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v155, "containsObject:", CFSTR("splitLiability"));

        }
      }
      else if (v150 != 4)
      {
        goto LABEL_166;
      }
      PKLocalizedFeatureString();
      v156 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v156;
LABEL_166:
      v157 = [PKTransactionStatusCell alloc];
      v158 = -[PKTransactionStatusCell initWithFrame:](v157, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v159 = v158;
      if (v17)
        -[PKTransactionStatusCell setSecondaryTextOverrideColor:](v158, "setSecondaryTextOverrideColor:", v17);
      if (self->_detailViewStyle == 2)
        -[PKTransactionStatusCell setIsBridge:](v159, "setIsBridge:", 1);
      -[PKTransactionStatusCell setPrimaryText:](v159, "setPrimaryText:", v20);
      if (v18 && objc_msgSend(v196, "length"))
      {
        -[PKTransactionStatusCell setSecondaryTitleLinkText:](v159, "setSecondaryTitleLinkText:", v196);
        -[PKTransactionStatusCell setSecondaryTitleLinkURL:](v159, "setSecondaryTitleLinkURL:", v18);
        objc_initWeak(&location, self);
        v197[0] = MEMORY[0x1E0C809B0];
        v197[1] = 3221225472;
        v197[2] = __68__PKPaymentTransactionDetailViewController__statusCellForTableView___block_invoke_3;
        v197[3] = &unk_1E3E73920;
        objc_copyWeak(&v198, &location);
        -[PKTransactionStatusCell setSecondaryTitleButtonAction:](v159, "setSecondaryTitleButtonAction:", v197);
        objc_destroyWeak(&v198);
        objc_destroyWeak(&location);
      }
      v191 = v20;
      -[PKTransactionStatusCell setSecondaryTitle:](v159, "setSecondaryTitle:", v19);
      -[PKTransactionStatusCell setSecondaryValue:](v159, "setSecondaryValue:", v194);
      v160 = *(Class *)((char *)&self->super.super.super.super.super.isa + v6[468]);
      -[PKPaymentTransaction transactionSourceIdentifier](self->_transaction, "transactionSourceIdentifier");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "transactionSourceForTransactionSourceIdentifier:", v161);
      v162 = (void *)objc_claimAutoreleasedReturnValue();

      v164 = v192;
      v163 = v4;
      if (objc_msgSend(v162, "type") == 2)
      {
        v186 = v5;
        objc_msgSend(v162, "accountUser");
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        v188 = self;
        -[PKFamilyMemberCollection familyMemberForTransactionSource:](self->_familyCollection, "familyMemberForTransactionSource:", v162);
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        v167 = (void *)MEMORY[0x1E0D66C60];
        objc_msgSend(v165, "nameComponents");
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v167, "contactForFamilyMember:nameComponents:imageData:", v166, v168, 0);
        v169 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v169, "givenName");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        if (v170)
        {
          PKLocalizedFeatureString();
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKTransactionStatusCell setTertiaryText:](v159, "setTertiaryText:", v171, v170);

        }
        v164 = v192;
        v163 = v193;
        v5 = v186;
        self = v188;
      }
      -[PKPaymentTransactionDetailViewController _applyAmountDetailSeparatorInsetForTableView:cell:](self, "_applyAmountDetailSeparatorInsetForTableView:cell:", v164, v159);

      return v159;
    case 6:
      v183 = v5;
      -[PKPaymentTransaction transfers](self->_transaction, "transfers");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "count");

      if (v39)
      {
        -[PKPaymentTransactionDetailViewController _transactionStatusString](self, "_transactionStatusString");
        v189 = objc_claimAutoreleasedReturnValue();
        -[PKPaymentTransaction transfers](self->_transaction, "transfers");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "firstObject");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v41, "externalAccount");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = -[PKPaymentTransaction featureIdentifier](self->_transaction, "featureIdentifier");
        v44 = -[PKPaymentTransaction associatedFeatureIdentifier](self->_transaction, "associatedFeatureIdentifier");
        if (v43 == 1)
        {
          v45 = v44;
          objc_msgSend(v42, "displayDescription");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (v45)
            PKLocalizedFeatureString();
          else
            PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_SECONDARY_FUNDING_SOURCE_BANK_ACCOUNT_DESCRIPTION_GENERIC"));
          v47 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          PKLocalizedFeatureString();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "displayDescription");
          v47 = objc_claimAutoreleasedReturnValue();
        }
        v102 = (void *)v47;
        PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAIL_STATUS_SUBTITLE_WITHDRAW_FROM_TO_FORMAT"), CFSTR("%@%@"), v47, v46);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = 0;
        v18 = 0;
        v194 = 0;
        v196 = 0;
        v5 = v183;
        v20 = (void *)v189;
        goto LABEL_156;
      }
      v71 = -[PKPaymentTransaction featureIdentifier](self->_transaction, "featureIdentifier");
      -[PKPaymentTransactionDetailViewController _transactionStatusString](self, "_transactionStatusString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v71 != 4)
      {
        v90 = objc_alloc(MEMORY[0x1E0D67730]);
        objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentTransaction secondaryFundingSourceFPANIdentifier](self->_transaction, "secondaryFundingSourceFPANIdentifier");
        v92 = v20;
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "passWithFPANIdentifier:", v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = (void *)objc_msgSend(v90, "initWithPaymentPass:", v94);

        v20 = v92;
        v6 = &OBJC_IVAR___PKExpressTransactionBannerViewController__psuedoShrunkSize;

        objc_msgSend(MEMORY[0x1E0D67390], "secondaryFundingSourceDescriptionForTransaction:secondarySource:includeBankAccountSuffix:useGenericNameIfNoDescriptionAvailable:", self->_transaction, v95, 1, 1);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAIL_STATUS_SUBTITLE_PAID_FROM_FORMAT"), CFSTR("%@"), v96);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_115;
      }
      if (-[PKPaymentTransaction topUpType](self->_transaction, "topUpType") == 8)
      {
        PKLocalizedLynxString(CFSTR("TRANSACTION_GIFT_CARD_REDEMPTION"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_115;
      }
      v17 = 0;
      v18 = 0;
      v194 = 0;
      v196 = 0;
      v19 = 0;
      goto LABEL_116;
    case 7:
      PKLocalizedTitleForTransactionWithAdjustment();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedSubtitleForTransactionWithAdjustment();
      v30 = objc_claimAutoreleasedReturnValue();
      goto LABEL_152;
    case 8:
      PKLocalizedPaymentString(CFSTR("TRANSACTION_TYPE_DISBURSEMENT"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PKPaymentPass associatedAccountFeatureIdentifier](v4, "associatedAccountFeatureIdentifier") != 2)
        goto LABEL_24;
LABEL_102:
      PKLocalizedFeatureString();
      v30 = objc_claimAutoreleasedReturnValue();
      goto LABEL_152;
    case 9:
    case 12:
      PKLocalizedFeatureString();
      v27 = objc_claimAutoreleasedReturnValue();
LABEL_23:
      v20 = (void *)v27;
LABEL_24:
      PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAIL_STATUS_SUBTITLE_PAID_TO_FORMAT"), CFSTR("%@"), v5);
      goto LABEL_25;
    case 10:
      -[PKPaymentTransactionDetailViewController _transactionStatusString](self, "_transactionStatusString");
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = objc_alloc(MEMORY[0x1E0D67730]);
      objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction secondaryFundingSourceFPANIdentifier](self->_transaction, "secondaryFundingSourceFPANIdentifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "passWithFPANIdentifier:", v51);
      v52 = v5;
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v49, "initWithPaymentPass:", v53);

      v5 = v52;
      v20 = (void *)v48;
      v6 = &OBJC_IVAR___PKExpressTransactionBannerViewController__psuedoShrunkSize;

      objc_msgSend(MEMORY[0x1E0D67390], "secondaryFundingSourceDescriptionForTransaction:secondarySource:includeBankAccountSuffix:useGenericNameIfNoDescriptionAvailable:", self->_transaction, v28, 1, 1);
      v29 = objc_claimAutoreleasedReturnValue();
      goto LABEL_54;
    case 11:
      switch(-[PKPaymentTransaction accountType](self->_transaction, "accountType"))
      {
        case 0:
        case 1:
        case 4:
          if (-[PKPaymentTransaction isBankConnectTransaction](self->_transaction, "isBankConnectTransaction"))goto LABEL_12;
          goto LABEL_47;
        case 2:
          PKDynamicLocalizedAppleCardString(CFSTR("TRANSACTION_DETAIL_INTEREST_CHARGED_TITLE"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          PKDynamicLocalizedAppleCardString(CFSTR("TRANSACTION_DETAIL_INTEREST_CHARGED_LINK_TEXT"));
          v196 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("https://support.apple.com/en-us/HT209230"));
          if ((-[PKAccount hideInterestChargeClarity](self->_account, "hideInterestChargeClarity") & 1) != 0)
          {
            PKDynamicLocalizedAppleCardString(CFSTR("TRANSACTION_DETAIL_INTEREST_CHARGED_SUBTITLE"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = 0;
            goto LABEL_155;
          }
          v182 = v18;
          v185 = v5;
          v190 = v20;
          -[PKAccount creditDetails](self->_account, "creditDetails");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "mergeDate");
          v104 = objc_claimAutoreleasedReturnValue();

          v105 = objc_alloc(MEMORY[0x1E0C99D48]);
          v106 = self;
          v107 = (void *)v104;
          v108 = (void *)objc_msgSend(v105, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
          objc_msgSend(v108, "setTimeZone:", v106->_productTimeZone);
          v109 = objc_alloc_init(MEMORY[0x1E0C99D78]);
          objc_msgSend(v109, "setMonth:", 2);
          objc_msgSend(v108, "dateByAddingComponents:toDate:options:", v109, v104, 0);
          v110 = objc_claimAutoreleasedReturnValue();
          -[PKPaymentTransaction transactionDate](v106->_transaction, "transactionDate");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          v195 = (void *)v110;
          IsBetweenDates = PKDateIsBetweenDates();
          v113 = IsBetweenDates;
          v114 = IsBetweenDates ^ 1;
          -[PKPaymentTransaction associatedStatementIdentifiers](v106->_transaction, "associatedStatementIdentifiers");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          v116 = objc_msgSend(v115, "count");

          v187 = v106;
          v117 = -[PKPaymentTransaction interestReassessment](v106->_transaction, "interestReassessment");
          if (v116)
            v118 = 0;
          else
            v118 = v114;
          v119 = v117 | v118;
          if (v119)
            v120 = CFSTR("TRANSACTION_DETAIL_INTEREST_CHARGED_GENERIC_MESSAGE");
          else
            v120 = CFSTR("TRANSACTION_DETAIL_INTEREST_CHARGED_SUBTITLE_CO_OWNERS_MERGED_RECENTLY");
          if ((v119 & 1) != 0)
          {
            v5 = v185;
            v20 = v190;
            goto LABEL_193;
          }
          v5 = v185;
          v20 = v190;
          if ((v113 & 1) != 0)
            goto LABEL_193;
          if (!v106->_associatedCreditStatementsLoaded)
          {
            v175 = 0;
            goto LABEL_194;
          }
          v180 = v107;
          v181 = v108;
          if (-[NSArray count](v106->_associatedCreditStatements, "count") != v116)
          {
            v120 = CFSTR("TRANSACTION_DETAIL_INTEREST_CHARGED_GENERIC_MESSAGE");
            goto LABEL_193;
          }
          -[NSArray objectAtIndexedSubscript:](v106->_associatedCreditStatements, "objectAtIndexedSubscript:", 0);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "openingDate");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v179 = v121;
          objc_msgSend(v121, "closingDate");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          PKDatesMidpoint();
          v124 = objc_claimAutoreleasedReturnValue();

          v178 = (void *)v124;
          -[NSDateFormatter stringFromDate:](v106->_monthFormatter, "stringFromDate:", v124);
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          if (v116 == 1)
          {
            productTimeZoneMonthDayFormatter = v106->_productTimeZoneMonthDayFormatter;
            objc_msgSend(v121, "paymentDueDate");
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDateFormatter stringFromDate:](productTimeZoneMonthDayFormatter, "stringFromDate:", v177);
            v127 = (void *)objc_claimAutoreleasedReturnValue();

            PKDynamicLocalizedAppleCardString(CFSTR("TRANSACTION_DETAIL_INTEREST_CHARGED_SUBTITLE_ONE_STATEMENT"), CFSTR("%1$@%2$@"), v125, v127);
            v132 = objc_claimAutoreleasedReturnValue();
            v5 = v185;
          }
          else
          {
            v126 = 0;
            v5 = v185;
            if (v116 != 2)
              goto LABEL_191;
            -[NSArray objectAtIndexedSubscript:](v187->_associatedCreditStatements, "objectAtIndexedSubscript:", 1);
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v127, "openingDate");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v127, "closingDate");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            PKDatesMidpoint();
            v130 = (void *)objc_claimAutoreleasedReturnValue();

            v5 = v185;
            -[NSDateFormatter stringFromDate:](v187->_monthFormatter, "stringFromDate:", v130);
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            PKDynamicLocalizedAppleCardString(CFSTR("TRANSACTION_DETAIL_INTEREST_CHARGED_SUBTITLE_TWO_STATEMENTS"), CFSTR("%1$@%2$@"), v125, v131);
            v132 = objc_claimAutoreleasedReturnValue();

          }
          v126 = v132;
LABEL_191:

          v20 = v190;
          v175 = v126;
          v107 = v180;
          v108 = v181;
          if (v126)
            goto LABEL_194;
          v120 = CFSTR("TRANSACTION_DETAIL_INTEREST_CHARGED_GENERIC_MESSAGE");
LABEL_193:
          PKDynamicLocalizedAppleCardString(&v120->isa);
          v175 = objc_claimAutoreleasedReturnValue();
LABEL_194:

          v17 = 0;
          v194 = 0;
          self = v187;
          v6 = &OBJC_IVAR___PKExpressTransactionBannerViewController__psuedoShrunkSize;
          v19 = (void *)v175;
          v18 = v182;
          break;
        case 3:
          PKLocalizedFeatureString();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_102;
        default:
LABEL_47:
          v17 = 0;
          v18 = 0;
          v194 = 0;
          v196 = 0;
          v19 = 0;
          v20 = 0;
          goto LABEL_156;
      }
      goto LABEL_156;
    case 13:
    case 14:
      PKLocalizedBeekmanString(CFSTR("APPLE_CARD_INSTALLMENTS"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction installmentPayment](self->_transaction, "installmentPayment");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedDisplay");
      v29 = objc_claimAutoreleasedReturnValue();
      goto LABEL_54;
    case 15:
      goto LABEL_156;
    case 16:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
LABEL_12:
      -[PKPaymentTransactionDetailViewController _transactionStatusString](self, "_transactionStatusString");
      v21 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v20 = (void *)v21;
      goto LABEL_14;
    default:
      v18 = 0;
      v194 = 0;
      v196 = 0;
      v19 = 0;
      v20 = 0;
      goto LABEL_156;
  }
}

void __68__PKPaymentTransactionDetailViewController__statusCellForTableView___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD block[5];

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__PKPaymentTransactionDetailViewController__statusCellForTableView___block_invoke_2;
    block[3] = &unk_1E3E612E8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __68__PKPaymentTransactionDetailViewController__statusCellForTableView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSection:", 3);
}

void __68__PKPaymentTransactionDetailViewController__statusCellForTableView___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5600]), "initWithURL:", v5);
    objc_msgSend(v4, "setModalPresentationStyle:", 2);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v4, 1, 0);

  }
}

- (id)_financingPlanDetailsCellForTableView:(id)a3
{
  id v4;
  PKTransactionStatusCell *v5;
  PKTransactionStatusCell *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = [PKTransactionStatusCell alloc];
  v6 = -[PKTransactionStatusCell initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PKTransactionStatusCell setIsBridge:](v6, "setIsBridge:", self->_detailViewStyle == 2);
  -[PKPaymentTransaction merchant](self->_transaction, "merchant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PKTransactionStatusCell setPrimaryText:](v6, "setPrimaryText:", v8);
  }
  else
  {
    PKLocalizedCocoonString(CFSTR("APPLE_PAY_LATER"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionStatusCell setPrimaryText:](v6, "setPrimaryText:", v9);

  }
  -[PKPaymentTransaction associatedFinancingPlan](self->_transaction, "associatedFinancingPlan");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "merchant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "displayNamePurchase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionStatusCell setSecondaryTitle:](v6, "setSecondaryTitle:", v12);
  -[PKPaymentTransactionDetailViewController _applyAmountDetailSeparatorInsetForTableView:cell:](self, "_applyAmountDetailSeparatorInsetForTableView:cell:", v4, v6);

  return v6;
}

- (id)_expiredPhysicalCardCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
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
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v6 = a3;
  v7 = objc_msgSend(a4, "row");
  if (v7 == 1)
  {
    -[PKPaymentTransactionDetailViewController _tableView:actionButtonCellForSection:](self, "_tableView:actionButtonCellForSection:", v6, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", v26);

    objc_msgSend(v8, "textLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTextColor:", v28);

    objc_msgSend(v8, "setAccessoryType:", 1);
  }
  else if (v7)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionConfigurationCellReuseIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v10);

    objc_msgSend(v9, "textProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC4938], *MEMORY[0x1E0DC1420]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v12);

    PKLocalizedFeatureString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSecondaryText:", v13);

    objc_msgSend(v9, "secondaryTextProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v15);

    objc_msgSend(v9, "secondaryTextProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setColor:", v17);

    objc_msgSend(v9, "setTextToSecondaryTextVerticalPadding:", 5.0);
    PKPassKitUIBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLForResource:withExtension:", CFSTR("MessageAlert"), CFSTR("pdf"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = PKUIScreenScale();
    PKUIImageFromPDF(v19, 42.0, 42.0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setImage:", v21);
    objc_msgSend(v9, "imageProperties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 42.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPreferredSymbolConfiguration:", v23);

    objc_msgSend(v9, "setImageToTextPadding:", 12.0);
    objc_msgSend(v9, "imageProperties");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setReservedLayoutSize:", 42.0, 42.0);

    objc_msgSend(v9, "setDirectionalLayoutMargins:", 12.0, 20.0, 12.0, 20.0);
    objc_msgSend(v8, "setContentConfiguration:", v9);
    objc_msgSend(v8, "setSeparatorInset:", 0.0, 20.0, 0.0, 0.0);

  }
  return v8;
}

- (id)_disputeStatusCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v6 = a3;
  v7 = objc_msgSend(a4, "row");
  if (v7 == 1)
  {
    -[PKPaymentTransactionDetailViewController _tableView:actionButtonCellForSection:](self, "_tableView:actionButtonCellForSection:", v6, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKPaymentTransaction disputeStatus](self->_transaction, "disputeStatus") == 7)
    {
      -[PKPaymentTransaction disputeStatusDetails](self->_transaction, "disputeStatusDetails");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "statusReasons");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "containsObject:", CFSTR("decisioned"));

    }
    objc_msgSend(v8, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v20);
    goto LABEL_8;
  }
  if (!v7)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionConfigurationCellReuseIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionDetailViewController _disputeStatusTitle](self, "_disputeStatusTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v10);

    objc_msgSend(v9, "textProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC4938], *MEMORY[0x1E0DC1420]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v12);

    -[PKPaymentTransactionDetailViewController _disputeStatusDescription](self, "_disputeStatusDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSecondaryText:", v13);

    objc_msgSend(v9, "secondaryTextProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v15);

    objc_msgSend(v9, "secondaryTextProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setColor:", v17);

    objc_msgSend(v9, "setTextToSecondaryTextVerticalPadding:", 5.0);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("flag.circle.fill"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageWithTintColor:renderingMode:", v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setImage:", v20);
    objc_msgSend(v9, "imageProperties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 50.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPreferredSymbolConfiguration:", v22);

    objc_msgSend(v9, "setImageToTextPadding:", 12.0);
    objc_msgSend(v9, "imageProperties");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setReservedLayoutSize:", 50.0, 50.0);

    objc_msgSend(v9, "setDirectionalLayoutMargins:", 12.0, 20.0, 12.0, 20.0);
    objc_msgSend(v8, "setContentConfiguration:", v9);
    objc_msgSend(v8, "setSeparatorInset:", 0.0, 20.0, 0.0, 0.0);
LABEL_8:

    goto LABEL_9;
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (id)_disputeStatusTitle
{
  void *v3;
  int v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;

  -[PKPaymentTransaction disputeStatusDetails](self->_transaction, "disputeStatusDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKAccount hideEnhancedDisputeDetails](self->_account, "hideEnhancedDisputeDetails");
  v5 = -[PKPaymentTransaction disputeStatus](self->_transaction, "disputeStatus") - 1;
  v6 = CFSTR("DISPUTE_STATUS_NEW_TITLE");
  switch(v5)
  {
    case 0:
      goto LABEL_14;
    case 1:
      v6 = CFSTR("DISPUTE_STATUS_OPEN_TITLE");
      goto LABEL_14;
    case 2:
      objc_msgSend(v3, "statusReasons");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", CFSTR("evidenceRequestedFromCustomer"));

      v10 = v9 ^ 1 | v4;
      v11 = CFSTR("DISPUTE_STATUS_PENDING_EVIDENCE_REQUESTED_TITLE");
      v12 = CFSTR("DISPUTE_STATUS_PENDING_TITLE");
      goto LABEL_7;
    case 3:
      v6 = CFSTR("DISPUTE_STATUS_APPROVED_TITLE");
      goto LABEL_14;
    case 4:
      objc_msgSend(v3, "statusReasons");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsObject:", CFSTR("splitLiability"));

      v10 = v14 ^ 1 | v4;
      v11 = CFSTR("DISPUTE_STATUS_REJECTED_SPLIT_LIABILITY_TITLE");
      v12 = CFSTR("DISPUTE_STATUS_REJECTED_TITLE");
LABEL_7:
      if (v10)
        v6 = (__CFString *)v12;
      else
        v6 = (__CFString *)v11;
      goto LABEL_14;
    case 5:
      v6 = CFSTR("DISPUTE_STATUS_WITHDRAWN_TITLE");
      goto LABEL_14;
    case 6:
      objc_msgSend(v3, "statusReasons");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "containsObject:", CFSTR("decisioned"));

      if (v16)
        v6 = CFSTR("DISPUTE_STATUS_UNAVAILABLE_DECISIONED_TITLE");
      else
        v6 = CFSTR("DISPUTE_STATUS_UNAVAILABLE_TITLE");
LABEL_14:
      PKDynamicLocalizedAppleCardString(&v6->isa);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

- (id)_disputeStatusDescription
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  id v7;
  void (**v8)(void *, const __CFString *);
  void *v9;
  void *v10;
  int v11;
  void (*v12)(void *, const __CFString *);
  const __CFString *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  _QWORD aBlock[5];
  id v20;
  id v21;

  -[PKPaymentTransaction latestDisputeEvent](self->_transaction, "latestDisputeEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction disputeStatusDetails](self->_transaction, "disputeStatusDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKAccount hideEnhancedDisputeDetails](self->_account, "hideEnhancedDisputeDetails");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPaymentTransactionDetailViewController__disputeStatusDescription__block_invoke;
  aBlock[3] = &unk_1E3E7B0F0;
  aBlock[4] = self;
  v6 = v4;
  v20 = v6;
  v7 = v3;
  v21 = v7;
  v8 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
  switch(-[PKPaymentTransaction disputeStatus](self->_transaction, "disputeStatus"))
  {
    case 1:
      v8[2](v8, CFSTR("DISPUTE_STATUS_NEW_DESCRIPTION"));
      goto LABEL_17;
    case 2:
      v8[2](v8, CFSTR("DISPUTE_STATUS_OPEN_DESCRIPTION"));
      goto LABEL_17;
    case 3:
      objc_msgSend(v6, "statusReasons");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsObject:", CFSTR("evidenceRequestedFromCustomer"));

      v12 = v8[2];
      if (((v11 ^ 1 | v5) & 1) != 0)
        v13 = CFSTR("DISPUTE_STATUS_PENDING_DESCRIPTION");
      else
        v13 = CFSTR("DISPUTE_STATUS_PENDING_EVIDENCE_REQUESTED_DESCRIPTION");
      goto LABEL_16;
    case 4:
      v8[2](v8, CFSTR("DISPUTE_STATUS_APPROVED_DESCRIPTION"));
      goto LABEL_17;
    case 5:
      objc_msgSend(v6, "statusReasons");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsObject:", CFSTR("splitLiability"));

      v12 = v8[2];
      if (((v15 ^ 1 | v5) & 1) != 0)
        v13 = CFSTR("DISPUTE_STATUS_REJECTED_DESCRIPTION");
      else
        v13 = CFSTR("DISPUTE_STATUS_REJECTED_SPLIT_LIABILITY_DESCRIPTION");
      goto LABEL_16;
    case 6:
      v8[2](v8, CFSTR("DISPUTE_STATUS_WITHDRAWN_DESCRIPTION"));
      goto LABEL_17;
    case 7:
      objc_msgSend(v6, "statusReasons");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "containsObject:", CFSTR("decisioned"));

      v12 = v8[2];
      if (v17)
        v13 = CFSTR("DISPUTE_STATUS_UNAVAILABLE_DECISIONED_DESCRIPTION");
      else
        v13 = CFSTR("DISPUTE_STATUS_UNAVAILABLE_DESCRIPTION");
LABEL_16:
      v12(v8, v13);
LABEL_17:
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

id __69__PKPaymentTransactionDetailViewController__disputeStatusDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1392);
  v17 = a2;
  objc_msgSend(v3, "disputeOpenDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  PKShortDateString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "customerResponseByDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  PKShortDateString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "merchantResponseByDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PKShortDateString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "partiallyApprovedAmount");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "formattedStringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "resolutionDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PKShortDateString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "claimIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "amount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "formattedStringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "lastUpdatedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKShortDateString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKDynamicLocalizedAppleCardString(v17, CFSTR("%1$@%2$@%3$@%4$@%5$@%6$@%7$@%8$@"), v16, v13, v4, v5, v6, v7, v9, v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_transactionIdentifierDescription
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  -[PKPaymentTransaction serviceIdentifier](self->_transaction, "serviceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v2);

    if (v3)
    {
      objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("-"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastObject");
      v5 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v5;
    }
  }
  return v2;
}

- (id)_transactionIdentifierCellForTableView:(id)a3
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

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionSubtitleCellReuseIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAILS_TRANSACTION_IDENTIFIER_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v7);

  if (self->_inBridge)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v8);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v9);

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  if (self->_inBridge)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v10);

  -[PKPaymentTransactionDetailViewController _transactionIdentifierDescription](self, "_transactionIdentifierDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v11);

  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A90], 0, 0, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v12);

  objc_msgSend(v6, "setNumberOfLines:", 0);
  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D681B8]);
  objc_msgSend(v4, "setSelectionStyle:", 0);

  return v4;
}

- (id)_fraudRiskCellForTableView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionDefaultCellReuseIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectionStyle:", 0);
  objc_msgSend(v3, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "pkui_osloErrorColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAIL_FRAUD_RISK_CELL_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v6);

  objc_msgSend(v4, "setTextColor:", v5);
  return v3;
}

- (unint64_t)_recognitionHintsRowForIndex:(unint64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  char v7;
  char v8;

  v5 = 0;
  v6 = 0;
  v7 = 1;
  do
  {
    v8 = v7;
    if (-[PKPaymentTransactionDetailViewController _recognitionHintsRowIsEnabled:](self, "_recognitionHintsRowIsEnabled:", v5))
    {
      if (v6 == a3)
        return v5;
      ++v6;
    }
    v7 = 0;
    v5 = 1;
  }
  while ((v8 & 1) != 0);
  return 0;
}

- (unint64_t)_numberOfRecognitionHintsRows
{
  unint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  _BOOL4 v7;

  v3 = 0;
  if (-[PKPaymentTransactionDetailViewController _recognitionHintsRowIsEnabled:](self, "_recognitionHintsRowIsEnabled:", 0))
  {
    v4 = 0;
    v3 = 0;
    v5 = 1;
    do
    {
      v6 = v5;
      v7 = -[PKPaymentTransactionDetailViewController _recognitionHintsRowIsEnabled:](self, "_recognitionHintsRowIsEnabled:", v4);
      v5 = 0;
      v3 += v7;
      v4 = 1;
    }
    while ((v6 & 1) != 0);
  }
  return v3;
}

- (BOOL)_recognitionHintsRowIsEnabled:(unint64_t)a3
{
  BOOL v5;
  char v6;
  BOOL v7;
  void *v8;
  void *v10;
  void *v11;

  if (-[PKPaymentTransaction transactionType](self->_transaction, "transactionType"))
    v5 = -[PKPaymentTransaction transactionType](self->_transaction, "transactionType") != 1;
  else
    v5 = 0;
  v6 = -[PKPaymentTransaction isBankConnectTransaction](self->_transaction, "isBankConnectTransaction");
  v7 = 0;
  if (-[PKAccount feature](self->_account, "feature") == 2 && !v5 && (v6 & 1) == 0)
  {
    if (a3 == 1)
      return -[PKPaymentTransactionDetailViewController _transactionIsTaggedAsRecurring](self, "_transactionIsTaggedAsRecurring");
    if (a3)
    {
      return 0;
    }
    else
    {
      -[PKPaymentTransaction unansweredQuestions](self->_transaction, "unansweredQuestions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        v7 = 1;
      }
      else
      {
        -[PKPaymentTransaction merchant](self->_transaction, "merchant");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "rawName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v11, "length") != 0;

      }
    }
  }
  return v7;
}

- (id)_recognitionHintsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionDefaultCellReuseIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "detailTextLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", 0);

  objc_msgSend(v8, "setAccessoryType:", 0);
  objc_msgSend(v8, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberOfLines:", 0);
  -[PKPaymentTransactionDetailViewController _applyAmountDetailSeparatorInsetForTableView:cell:](self, "_applyAmountDetailSeparatorInsetForTableView:cell:", v7, v8);

  v11 = objc_msgSend(v6, "row");
  v12 = -[PKPaymentTransactionDetailViewController _recognitionHintsRowForIndex:](self, "_recognitionHintsRowForIndex:", v11);
  if (v12 != 2)
  {
    if (v12 == 1)
    {
      PKLocalizedPaymentString(CFSTR("TRANSACTION_POSSIBLE_RECURRING_CHARGE"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v17);

      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v12)
      {
LABEL_8:
        v16 = v8;
        goto LABEL_9;
      }
      -[PKPaymentTransaction merchant](self->_transaction, "merchant");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "rawName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v14);

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v15;
    objc_msgSend(v10, "setTextColor:", v15);

    goto LABEL_8;
  }
  v16 = 0;
LABEL_9:

  return v16;
}

- (id)_releasedDataCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;

  v6 = a4;
  v7 = a3;
  if (!PKIdentityPresentmentV2Enabled())
  {
    v38 = v6;
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionRequestedDataReuseIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (NSString *)*MEMORY[0x1E0DC4A88];
    v10 = (NSString *)*MEMORY[0x1E0DC4938];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4938], 2, 0);
    v37 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitleFont:");
    PKFontForDefaultDesign(v9, v10);
    v36 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSubtitleFont:");
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], v10);
    v35 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBodyFont:");
    -[PKPaymentTransaction releasedData](self->_transaction, "releasedData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "elements");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v42 = 0;
    v40 = 0;
    PKISO180135AcceptedFieldsFromElements(v12, 0, &v42, &v41, &v40);
    v13 = v42;
    v14 = v41;
    v15 = v40;

    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v39 = v14;
    v17 = v14;
    v18 = v15;
    objc_msgSend(v16, "addObjectsFromArray:", v17);
    objc_msgSend(v16, "addObjectsFromArray:", v15);
    -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = -[PKPaymentTransaction transactionSource](self->_transaction, "transactionSource");
    if (v21 == 2)
      v22 = CFSTR("TRANSACTION_DETAILS_REQUESTED_DATA_SHARED");
    else
      v22 = CFSTR("TRANSACTION_DETAILS_REQUESTED_DATA_PRESENTED");
    PKLocalizedIdentityString(&v22->isa, CFSTR("%@"), v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v23);

    objc_msgSend(v8, "setIntentRetainElements:", v13);
    objc_msgSend(v8, "setIntentDoNotRetainElements:", v16);
    if (objc_msgSend(v13, "count"))
    {
      if (v21 == 2)
      {
        -[PKPaymentTransaction releasedData](self->_transaction, "releasedData");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "elements");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[PKPaymentTransactionDetailViewController _maximumRetentionPeriodForElements:](self, "_maximumRetentionPeriodForElements:", v25);

        v6 = v38;
        if (v26 < 1)
          PKLocalizedIdentityString(CFSTR("TRANSACTION_DETAILS_SHARED_DATA_STORED"));
        else
          PKLocalizedIdentityString(CFSTR("TRANSACTION_DETAILS_SHARED_DATA_STORED_WITH_RETENTION"), CFSTR("%ld"), v26);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)v36;
        v27 = (void *)v37;
        v29 = (void *)v35;
        objc_msgSend(v8, "setIntentRetainTitle:", v32);

        if (!objc_msgSend(v16, "count"))
          goto LABEL_19;
        goto LABEL_17;
      }
      PKLocalizedIdentityString(CFSTR("TRANSACTION_DETAILS_PRESENTED_DATA_STORED"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setIntentRetainTitle:", v30);

      v28 = (void *)v36;
      v27 = (void *)v37;
      v29 = (void *)v35;
      v6 = v38;
      if (objc_msgSend(v16, "count"))
        goto LABEL_14;
    }
    else
    {
      v28 = (void *)v36;
      v27 = (void *)v37;
      v29 = (void *)v35;
      v6 = v38;
      if (objc_msgSend(v16, "count"))
      {
        if (v21 == 2)
        {
LABEL_17:
          v31 = CFSTR("TRANSACTION_DETAILS_SHARED_DATA_NOT_STORED");
          goto LABEL_18;
        }
LABEL_14:
        v31 = CFSTR("TRANSACTION_DETAILS_PRESENTED_DATA_NOT_STORED");
LABEL_18:
        PKLocalizedIdentityString(&v31->isa);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setIntentDoNotRetainTitle:", v33);

      }
    }
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKPaymentTransactionRequestedElementsDataReuseIdentifier"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDataReleaseConfiguration:", self->_dataReleaseTransactionConfiguration);
LABEL_20:

  return v8;
}

- (int64_t)_maximumRetentionPeriodForElements:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "retentionPeriod") >= 1 && objc_msgSend(v9, "retentionPeriod") > v6)
          v6 = objc_msgSend(v9, "retentionPeriod");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)_numberOfDataReleaseRows
{
  return !PKIdentityPresentmentV2Enabled() || self->_dataReleaseTransactionConfiguration != 0;
}

- (void)_fetchDataReleaseTransactionConfiguration
{
  _TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration *v10;
  _TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration *dataReleaseTransactionConfiguration;

  if (PKIdentityPresentmentV2Enabled())
  {
    if (!self->_dataReleaseTransactionConfiguration)
    {
      v3 = [_TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration alloc];
      -[PKPaymentTransactionDetailViewController _iso18013CredentialDocumentType](self, "_iso18013CredentialDocumentType");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction releasedData](self->_transaction, "releasedData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "elements");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[PKPaymentTransaction transactionSource](self->_transaction, "transactionSource");
      -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PKIdentityDataReleaseTransactionConfiguration initWithDocumentType:elements:transactionSource:passName:](v3, "initWithDocumentType:elements:transactionSource:passName:", v4, v6, v7, v9);
      dataReleaseTransactionConfiguration = self->_dataReleaseTransactionConfiguration;
      self->_dataReleaseTransactionConfiguration = v10;

      -[PKSectionTableViewController reloadData](self, "reloadData");
    }
  }
}

- (id)_iso18013CredentialDocumentType
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PKPaymentPass devicePaymentApplications](self->_paymentPass, "devicePaymentApplications", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(v3);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7), "paymentType") == 1002)
      {
        -[PKPaymentPass devicePrimaryPaymentApplication](self->_paymentPass, "devicePrimaryPaymentApplication");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "paymentNetworkIdentifier");

        if (v9 == 129)
        {
          v11 = (id *)MEMORY[0x1E0D6A1C8];
LABEL_14:
          v10 = *v11;
          goto LABEL_15;
        }
        if (v9 == 138)
        {
          v11 = (id *)MEMORY[0x1E0D6A1D0];
          goto LABEL_14;
        }
      }
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }
  v10 = 0;
LABEL_15:

  return v10;
}

- (id)_merchantTokenManagementCellForTableView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionConfigurationCellReuseIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultContentConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKEN_TRANSACTION_MANAGE_PAYMENT_METHOD"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

  objc_msgSend(v3, "setAccessoryType:", 1);
  objc_msgSend(v3, "setContentConfiguration:", v4);

  return v3;
}

- (id)_merchantTokenDeletedCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionMerchantTokenDeletedCellReuseIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransactionDetailViewController _applyAmountDetailSeparatorInsetForTableView:cell:](self, "_applyAmountDetailSeparatorInsetForTableView:cell:", v5, v6);

  objc_msgSend(v6, "defaultContentConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKEN_TRANSACTION_MERCHANT_TOKEN_DELETED"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  objc_msgSend(v7, "textProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColor:", v10);

  objc_msgSend(v6, "setContentConfiguration:", v7);
  return v6;
}

- (void)_didSelectMerchantTokenManagement
{
  void *v3;
  void *v4;
  PKMerchantTokenDetailViewController *v5;
  PKMerchantTokenDetailViewController *v6;
  _QWORD v7[4];
  PKMerchantTokenDetailViewController *v8;
  PKPaymentTransactionDetailViewController *v9;

  -[PKRetrieveMerchantTokensResponse merchantTokens](self->_merchantTokenResponse, "merchantTokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PKMerchantTokenDetailViewController initWithMerchantToken:]([PKMerchantTokenDetailViewController alloc], "initWithMerchantToken:", v4);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__PKPaymentTransactionDetailViewController__didSelectMerchantTokenManagement__block_invoke;
  v7[3] = &unk_1E3E619E0;
  v8 = v5;
  v9 = self;
  v6 = v5;
  -[PKMerchantTokenDetailViewController preflightWithCompletion:](v6, "preflightWithCompletion:", v7);

}

void __77__PKPaymentTransactionDetailViewController__didSelectMerchantTokenManagement__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__PKPaymentTransactionDetailViewController__didSelectMerchantTokenManagement__block_invoke_2;
  v4[3] = &unk_1E3E61388;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

void __77__PKPaymentTransactionDetailViewController__didSelectMerchantTokenManagement__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "navigationItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackButtonDisplayMode:", 2);
  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushViewController:animated:", *(_QWORD *)(a1 + 32), 1);

}

- (void)merchantTokenDetailViewController:(id)a3 didDeleteMerchantToken:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  PKRetrieveMerchantTokensResponse *merchantTokenResponse;

  v5 = a3;
  -[PKPaymentTransactionDetailViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
  {
    -[PKPaymentTransactionDetailViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 1);

  }
  merchantTokenResponse = self->_merchantTokenResponse;
  self->_merchantTokenResponse = 0;

  -[PKSectionTableViewController updateSectionVisibilityAndReloadIfNecessaryForSection:](self, "updateSectionVisibilityAndReloadIfNecessaryForSection:", 16);
  -[PKPaymentTransactionDetailViewController _fetchMerchantToken](self, "_fetchMerchantToken");
}

- (id)_applePayOrderRowCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  NSArray *applePayOrderRowViewModels;
  uint64_t v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionOrderCellReuseIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  applePayOrderRowViewModels = self->_applePayOrderRowViewModels;
  v9 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndexedSubscript:](applePayOrderRowViewModels, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configureCell:", v7);

  return v7;
}

- (id)_applePayBarcodeRowCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  NSArray *applePayBarcodeRowViewModels;
  uint64_t v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionBarcodeCellReuseIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  applePayBarcodeRowViewModels = self->_applePayBarcodeRowViewModels;
  v9 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndexedSubscript:](applePayBarcodeRowViewModels, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configureCell:", v7);

  return v7;
}

- (id)_applePayReceiptRowCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  NSArray *applePayReceiptRowViewModels;
  uint64_t v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionReceiptCellReuseIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  applePayReceiptRowViewModels = self->_applePayReceiptRowViewModels;
  v9 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndexedSubscript:](applePayReceiptRowViewModels, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configureCell:", v7);

  return v7;
}

- (id)_debugDetailCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(a4, "row");
  if (v7 == 1)
  {
    -[PKPaymentTransactionDetailViewController _tableView:actionButtonCellForSection:](self, "_tableView:actionButtonCellForSection:", v6, 23);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", CFSTR("Transaction Details"));

    objc_msgSend(v8, "setAccessoryType:", 1);
  }
  else if (v7)
  {
    v8 = 0;
  }
  else
  {
    -[PKPaymentTransactionDetailViewController _transactionIdentifierCellForTableView:](self, "_transactionIdentifierCellForTableView:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_awardCellForTableView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionAwardCellReuseIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_inBridge)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v6);

  return v4;
}

- (id)_tableView:(id)a3 cellForAmountDetailLineItemAtIndex:(int64_t)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
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
  id v38;

  v8 = a3;
  v9 = a5;
  -[NSArray objectAtIndexedSubscript:](self->_lineItems, "objectAtIndexedSubscript:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "lineItemType") == 10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = v10;
    objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKPaymentTransactionReceiptLineItemCellReuseIdentifier"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSuppressImage:", self->_suppressReceiptImages);
    objc_msgSend(v11, "label");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPrimaryText:", v13);

    objc_msgSend(v11, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", v14);

    objc_msgSend(v11, "secondaryLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSecondaryText:", v15);

    objc_msgSend(v11, "tertiaryLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTertiaryText:", v16);

    objc_msgSend(v11, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAmountText:", v17);

    v18 = objc_msgSend(v11, "hasTrailingLineSeperator");
    objc_msgSend(v12, "setHasTrailingLineSeparator:", v18);
    -[PKPaymentTransactionDetailViewController _applyAmountDetailSeparatorInsetForTableView:cell:](self, "_applyAmountDetailSeparatorInsetForTableView:cell:", v8, v12);
  }
  else if (objc_msgSend(v10, "lineItemType") == 11)
  {
    objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionDateLineItemCellReuseIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)*MEMORY[0x1E0DC4A88];
    v20 = (void *)*MEMORY[0x1E0DC4938];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4938], 2, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign(v19, v20, 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "detailTextLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "label");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setText:", v25);

    objc_msgSend(v23, "setFont:", v21);
    if (self->_inBridge)
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setText:", v32);

    objc_msgSend(v24, "setTextColor:", v31);
    objc_msgSend(v24, "setFont:", v22);
    objc_msgSend(v12, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67CF0]);

  }
  else
  {
    objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionDetailLineItemCellReuseIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v10, "isEmphasized");
    v27 = (void *)*MEMORY[0x1E0DC4A88];
    v28 = (void *)*MEMORY[0x1E0DC4938];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4938], 0, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign(v27, v28, 2, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v9;
    if (self->_inBridge)
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "label");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHasTrailingLineSeperator:", objc_msgSend(v10, "hasTrailingLineSeperator"));
    if (v26)
      v36 = v30;
    else
      v36 = v29;
    objc_msgSend(v12, "setTitleFont:", v36);
    objc_msgSend(v12, "setTitleColor:", v33);
    objc_msgSend(v12, "setTitleText:", v34);
    objc_msgSend(v12, "setValueFont:", v36);
    objc_msgSend(v12, "setValueColor:", v33);
    objc_msgSend(v12, "setValueText:", v35);
    -[PKPaymentTransactionDetailViewController _applyAmountDetailSeparatorInsetForTableView:cell:](self, "_applyAmountDetailSeparatorInsetForTableView:cell:", v8, v12);

    v9 = v38;
  }

  return v12;
}

- (void)_tableView:(id)a3 willDisplayAmountDetailsCell:(id)a4 atIndexPath:(id)a5
{
  id v7;
  unint64_t v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  if (-[PKPaymentTransactionDetailViewController _amountDetailsRowForIndex:](self, "_amountDetailsRowForIndex:", objc_msgSend(v7, "row")) == 4)
  {
    v8 = -[PKPaymentTransactionDetailViewController _lineItemItemForRowIndex:](self, "_lineItemItemForRowIndex:", objc_msgSend(v7, "row"));
    if (v8 < -[NSArray count](self->_lineItems, "count"))
    {
      -[NSArray objectAtIndexedSubscript:](self->_lineItems, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSeparatorStyle:", objc_msgSend(v9, "hasTrailingLineSeperator"));

    }
  }

}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PKPaymentTransactionDetailViewController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__PKPaymentTransactionDetailViewController_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  v7[3] = &unk_1E3E61388;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __94__PKPaymentTransactionDetailViewController_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1392), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) != 0)
  {
    if (v6)
    {
      v7 = *(void **)(a1 + 32);
      v8 = *(void **)(*(_QWORD *)(a1 + 40) + 1392);
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Transaction currently being viewed, %@, has been updated to transaction %@", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "setTransaction:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v6)
    {
      v9 = 138412546;
      v10 = v2;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Received an update to a different transaction, %@, while viewing transaction details for transaction: %@.", (uint8_t *)&v9, 0x16u);
    }

  }
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __107__PKPaymentTransactionDetailViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __107__PKPaymentTransactionDetailViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1392), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v2))
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Transaction currently being viewed has been deleted. Dismissing transaction details. TransactionID: %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

  }
}

- (void)transactionWithIdentifier:(id)a3 didDownloadTransactionReceipt:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  PKPaymentTransactionDetailViewController *v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PKPaymentTransactionDetailViewController_transactionWithIdentifier_didDownloadTransactionReceipt___block_invoke;
  block[3] = &unk_1E3E61400;
  v11 = v7;
  v12 = v6;
  v13 = self;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __100__PKPaymentTransactionDetailViewController_transactionWithIdentifier_didDownloadTransactionReceipt___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  int v6;
  id v7;

  if (!*(_QWORD *)(a1 + 32))
    return;
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1392), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  if (v4 == v5)
  {

    goto LABEL_8;
  }
  v7 = v5;
  if (!v4 || !v5)
  {

    return;
  }
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
LABEL_8:
    objc_msgSend(*(id *)(a1 + 48), "_updateWithTransactionReceipt:", *(_QWORD *)(a1 + 32));
}

- (void)didUpdateFamilyMembers:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPaymentTransactionDetailViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__PKPaymentTransactionDetailViewController_didUpdateFamilyMembers___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __67__PKPaymentTransactionDetailViewController_didUpdateFamilyMembers___block_invoke(uint64_t a1)
{
  id obj;

  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D66D88]), "initWithFamilyMembers:", *(_QWORD *)(a1 + 32));
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1216), obj);
    objc_msgSend(*(id *)(a1 + 40), "reloadData");
  }

}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  return 1;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v4;
  id v5;

  -[PKPaymentTransactionDetailViewController navigationController](self, "navigationController", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

}

- (void)submitAnswer:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PKPaymentDataProvider *paymentServiceDataProvider;
  void *v10;
  _QWORD v11[5];
  id v12;

  v5 = a3;
  if (!self->_submittingAnswer)
  {
    objc_storeStrong((id *)&self->_submittingAnswer, a3);
    -[PKPaymentTransaction unansweredQuestions](self->_transaction, "unansweredQuestions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "type");

    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    -[PKPaymentTransaction identifier](self->_transaction, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__PKPaymentTransactionDetailViewController_submitAnswer___block_invoke;
    v11[3] = &unk_1E3E7B118;
    v11[4] = self;
    v12 = v5;
    -[PKPaymentDataProvider submitTransactionAnswerForTransaction:questionType:answer:completion:](paymentServiceDataProvider, "submitTransactionAnswerForTransaction:questionType:answer:completion:", v10, v8, v12, v11);

  }
}

void __57__PKPaymentTransactionDetailViewController_submitAnswer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PKPaymentTransactionDetailViewController_submitAnswer___block_invoke_2;
  block[3] = &unk_1E3E65CC0;
  objc_copyWeak(&v11, &location);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __57__PKPaymentTransactionDetailViewController_submitAnswer___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  int v22;
  BOOL v23;
  void *v24;
  void *v25;
  id *v26;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v26 = WeakRetained;
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", v3, 2, 0, 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
      objc_msgSend(v26, "presentViewController:animated:completion:", v5, 1, 0);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(void **)(v6 + 1304);
      *(_QWORD *)(v6 + 1304) = 0;

      objc_msgSend(*(id *)(a1 + 40), "updateSectionVisibilityAndReloadIfNecessaryForSection:", 0);
LABEL_4:

LABEL_5:
      WeakRetained = v26;
      goto LABEL_6;
    }
    v8 = (void *)*MEMORY[0x1E0D6B058];
    v9 = *(id *)(a1 + 48);
    v10 = v8;
    if (v9 == v10)
    {

    }
    else
    {
      v11 = v10;
      if (!v9 || !v10)
      {

        goto LABEL_16;
      }
      v12 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v12)
      {
LABEL_16:
        v20 = (void *)*MEMORY[0x1E0D6B050];
        v4 = *(id *)(a1 + 48);
        v21 = v20;
        if (v4 == v21)
        {

        }
        else
        {
          v5 = v21;
          if (!v4 || !v21)
            goto LABEL_4;
          v22 = objc_msgSend(v4, "isEqualToString:", v21);

          WeakRetained = v26;
          if (!v22)
            goto LABEL_6;
        }
        v23 = objc_msgSend(v26[174], "effectiveTransactionSource") == 6;
        WeakRetained = v26;
        if (!v23)
          goto LABEL_6;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1224), "accountIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        PKCardSetShouldShowVPANReissuedMessage();

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1392), "altDSID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        PKCardSetAltDSIDForVPANReissuedMessage();

        objc_msgSend(v26, "_presentCardNumberUpdatedAlert");
        goto LABEL_5;
      }
    }
    if (objc_msgSend(v26[174], "transactionStatus") == 2)
    {
      v13 = (void *)MEMORY[0x1E0DC3450];
      PKLocalizedFeatureString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "alertControllerWithTitle:message:preferredStyle:", v14, v15, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedFeatureString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addAction:", v19);

      objc_msgSend(v26, "presentViewController:animated:completion:", v16, 1, 0);
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_6:

}

- (void)_presentCardNumberUpdatedAlert
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[PKPaymentTransaction altDSID](self->_transaction, "altDSID");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    PKCurrentUserAltDSID();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v16;
    v5 = v3;
    if (v4 == v5)
    {

    }
    else
    {
      v6 = v5;
      if (!v5)
      {

LABEL_9:
        PKLocalizedMadisonString(CFSTR("TRANSACTION_ANSWER_ALERT_ACTIVITY_REPORTED_CARD_NUMBER_ACCOUNT_USER_BODY"));
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      v7 = objc_msgSend(v4, "isEqualToString:", v5);

      if ((v7 & 1) == 0)
        goto LABEL_9;
    }
  }
  PKLocalizedFeatureString();
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v9 = (void *)v8;
  v10 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedFeatureString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v11, v9, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedFeatureString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v15);

  -[PKPaymentTransactionDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
}

- (void)_loadAppPrivacyURLFromAppStore
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  -[PKPaymentTransaction releasedData](self->_transaction, "releasedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_initWeak(&location, self);
    self->_privacyURLCallInProgress = 1;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __74__PKPaymentTransactionDetailViewController__loadAppPrivacyURLFromAppStore__block_invoke;
    v7[3] = &unk_1E3E73920;
    objc_copyWeak(&v8, &location);
    v6 = PKLookupAppStoreApplicationPrivacyPolicy(v5, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __74__PKPaymentTransactionDetailViewController__loadAppPrivacyURLFromAppStore__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__PKPaymentTransactionDetailViewController__loadAppPrivacyURLFromAppStore__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __74__PKPaymentTransactionDetailViewController__loadAppPrivacyURLFromAppStore__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  _BYTE *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_storeStrong((id *)WeakRetained + 167, v4);
      objc_msgSend(v3, "reloadData");
      v3[1344] = 0;
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentTransactionDetailViewController failed to get privacy policy.", v6, 2u);
      }

    }
  }

}

- (void)_fetchAppPrivacyURL
{
  uint64_t v3;
  void *v4;
  NSURL *v5;
  NSURL *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSURL *v12;
  NSURL *privacyURL;

  if (!self->_privacyURL
    && !self->_privacyURLCallInProgress
    && -[PKPaymentTransaction transactionType](self->_transaction, "transactionType") == 15)
  {
    v3 = -[PKPaymentTransaction transactionSource](self->_transaction, "transactionSource");
    if (v3 == 2)
    {
      -[PKPaymentTransaction releasedData](self->_transaction, "releasedData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "application");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "client");

      if (v9 != 1)
      {
        -[PKPaymentTransactionDetailViewController _loadAppPrivacyURLFromAppStore](self, "_loadAppPrivacyURLFromAppStore");
        return;
      }
      -[PKPaymentTransaction releasedData](self->_transaction, "releasedData");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "privacyPolicyURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = v10;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *MEMORY[0x1E0D699F8]);
        v12 = (NSURL *)objc_claimAutoreleasedReturnValue();
      }
      privacyURL = self->_privacyURL;
      self->_privacyURL = v12;

      goto LABEL_14;
    }
    if (v3 == 1)
    {
      -[PKPaymentTransaction releasedData](self->_transaction, "releasedData");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "privacyPolicyURL");
      v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
      v6 = self->_privacyURL;
      self->_privacyURL = v5;

LABEL_14:
      -[PKSectionTableViewController reloadData](self, "reloadData");
    }
  }
}

- (void)_openBankConnectDigitalServicingURL
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  -[PKPaymentTransaction bankConnectDigitalServicingURL](self->_transaction, "bankConnectDigitalServicingURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __79__PKPaymentTransactionDetailViewController__openBankConnectDigitalServicingURL__block_invoke;
    v4[3] = &unk_1E3E7B078;
    v5 = v2;
    objc_msgSend(v3, "openURL:configuration:completionHandler:", v5, 0, v4);

  }
}

void __79__PKPaymentTransactionDetailViewController__openBankConnectDigitalServicingURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Failed to open digital servicing url: %@ with error: %@", (uint8_t *)&v9, 0x16u);

    }
  }

}

- (void)_openBankConnectPostInstallmentURL
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  -[PKPaymentTransaction bankConnectPostInstallmentURL](self->_transaction, "bankConnectPostInstallmentURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __78__PKPaymentTransactionDetailViewController__openBankConnectPostInstallmentURL__block_invoke;
    v4[3] = &unk_1E3E7B078;
    v5 = v2;
    objc_msgSend(v3, "openURL:configuration:completionHandler:", v5, 0, v4);

  }
}

void __78__PKPaymentTransactionDetailViewController__openBankConnectPostInstallmentURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Failed to open post installment url: %@ with error: %@", (uint8_t *)&v9, 0x16u);

    }
  }

}

- (void)_openBankConnectRedeemRewardsURL
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  -[PKPaymentTransaction bankConnectRedeemRewardsURL](self->_transaction, "bankConnectRedeemRewardsURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __76__PKPaymentTransactionDetailViewController__openBankConnectRedeemRewardsURL__block_invoke;
    v4[3] = &unk_1E3E7B078;
    v5 = v2;
    objc_msgSend(v3, "openURL:configuration:completionHandler:", v5, 0, v4);

  }
}

void __76__PKPaymentTransactionDetailViewController__openBankConnectRedeemRewardsURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Failed to open redeem rewards url: %@ with error: %@", (uint8_t *)&v9, 0x16u);

    }
  }

}

- (void)_openAppPrivacyURL
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSURL *privacyURL;
  _QWORD v13[5];
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  if (self->_privacyURL)
  {
    v3 = (void *)MEMORY[0x1E0D66A58];
    v4 = *MEMORY[0x1E0D69910];
    v5 = *MEMORY[0x1E0D68B18];
    v6 = *MEMORY[0x1E0D68F50];
    v14[0] = *MEMORY[0x1E0D68AA0];
    v14[1] = v6;
    v7 = *MEMORY[0x1E0D68DF0];
    v15[0] = v5;
    v15[1] = v7;
    v8 = *MEMORY[0x1E0D69028];
    v14[2] = *MEMORY[0x1E0D68858];
    v14[3] = v8;
    v9 = *MEMORY[0x1E0D68D28];
    v15[2] = *MEMORY[0x1E0D68E08];
    v15[3] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subject:sendEvent:", v4, v10);

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    privacyURL = self->_privacyURL;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__PKPaymentTransactionDetailViewController__openAppPrivacyURL__block_invoke;
    v13[3] = &unk_1E3E7B078;
    v13[4] = self;
    objc_msgSend(v11, "openURL:configuration:completionHandler:", privacyURL, 0, v13);

  }
}

void __62__PKPaymentTransactionDetailViewController__openAppPrivacyURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1336), "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Failed to re-direct url: %@ to Safari with error: %@", (uint8_t *)&v9, 0x16u);

    }
  }

}

- (void)_showDeleteConfirmationSheet
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  if (self->_inBridge)
    v3 = CFSTR("TRANSACTION_DELETE_ACTIVITY_SHEET_TITLE_WATCH");
  else
    v3 = CFSTR("TRANSACTION_DELETE_ACTIVITY_SHEET_TITLE_IPHONE");
  PKLocalizedIdentityString(&v3->isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __72__PKPaymentTransactionDetailViewController__showDeleteConfirmationSheet__block_invoke;
  v16 = &unk_1E3E63F88;
  objc_copyWeak(&v17, &location);
  v6 = _Block_copy(&v13);
  v7 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedIdentityString(CFSTR("TRANSACTION_DELETE_ACTIVITY_REMOVE_BUTTON_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 2, v6, v13, v14, v15, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedIdentityString(CFSTR("TRANSACTION_DELETE_ACTIVITY_CANCEL_BUTTON_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v9);
  objc_msgSend(v5, "addAction:", v12);
  -[PKPaymentTransactionDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __72__PKPaymentTransactionDetailViewController__showDeleteConfirmationSheet__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_deleteTransaction");
    WeakRetained = v2;
  }

}

- (void)_deleteTransaction
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  PKPaymentTransaction *transaction;
  void *v12;
  BOOL v13;
  char v14;
  PKPaymentDataProvider *paymentServiceDataProvider;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  if (-[PKPaymentTransaction transactionType](self->_transaction, "transactionType") == 15)
  {
    v3 = (void *)MEMORY[0x1E0D66A58];
    v4 = *MEMORY[0x1E0D69910];
    v5 = *MEMORY[0x1E0D68B18];
    v6 = *MEMORY[0x1E0D68F50];
    v23[0] = *MEMORY[0x1E0D68AA0];
    v23[1] = v6;
    v7 = *MEMORY[0x1E0D68DF0];
    v24[0] = v5;
    v24[1] = v7;
    v8 = *MEMORY[0x1E0D69028];
    v23[2] = *MEMORY[0x1E0D68858];
    v23[3] = v8;
    v9 = *MEMORY[0x1E0D68D28];
    v24[2] = *MEMORY[0x1E0D693F8];
    v24[3] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subject:sendEvent:", v4, v10);

  }
  transaction = self->_transaction;
  if (transaction)
  {
    -[PKPaymentTransaction identifier](transaction, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

  }
  else
  {
    v13 = 1;
  }
  v14 = objc_opt_respondsToSelector();
  if (v13 || (v14 & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedIdentityString(CFSTR("TRANSACTION_DELETE_ACTIVITY_FAILURE_TITLE"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedIdentityString(CFSTR("TRANSACTION_DELETE_ACTIVITY_FAILURE_MESSAGE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "alertControllerWithTitle:message:preferredStyle:", v18, v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedIdentityString(CFSTR("TRANSACTION_DELETE_ACTIVITY_OK_BUTTON_TITLE"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAction:", v22);

    -[PKPaymentTransactionDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);
  }
  else
  {
    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    -[PKPaymentTransaction identifier](self->_transaction, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentDataProvider deletePaymentTransactionWithIdentifier:](paymentServiceDataProvider, "deletePaymentTransactionWithIdentifier:", v16);
  }

}

- (void)thresholdTopUpController:(id)a3 requestsPushViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PKPaymentTransactionDetailViewController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v5, 1);

}

- (void)thresholdTopUpController:(id)a3 requestsDismissViewController:(id)a4
{
  -[PKPaymentTransactionDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)thresholdTopUpController:(id)a3 requestsPresentViewController:(id)a4
{
  -[PKPaymentTransactionDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (id)presentationSceneIdentifierForTopUpController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPaymentTransactionDetailViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)thresholdTopUpControllerCompletedSetup:(id)a3
{
  void *v3;
  id v4;

  -[PKPaymentTransactionDetailViewController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)thresholdTopUpController:(id)a3 requestsPopViewController:(id)a4
{
  id v4;
  id v5;

  -[PKPaymentTransactionDetailViewController navigationController](self, "navigationController", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

}

- (void)recurringPaymentsChanged
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __68__PKPaymentTransactionDetailViewController_recurringPaymentsChanged__block_invoke;
  v2[3] = &unk_1E3E61310;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __68__PKPaymentTransactionDetailViewController_recurringPaymentsChanged__block_invoke(uint64_t a1)
{
  id *v1;
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[174];
    objc_msgSend(v4, "recurringPeerPayment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __68__PKPaymentTransactionDetailViewController_recurringPaymentsChanged__block_invoke_2;
      v7[3] = &unk_1E3E665B8;
      objc_copyWeak(&v9, v1);
      v8 = v4;
      objc_msgSend(v6, "recurringPaymentsWithCompletion:", v7);

      objc_destroyWeak(&v9);
    }

  }
}

void __68__PKPaymentTransactionDetailViewController_recurringPaymentsChanged__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PKPaymentTransactionDetailViewController_recurringPaymentsChanged__block_invoke_3;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __68__PKPaymentTransactionDetailViewController_recurringPaymentsChanged__block_invoke_3(id *a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  char v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v18 = WeakRetained;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v4 = a1[4];
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(a1[5], "recurringPeerPayment");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v11;
          v14 = v12;
          if (v13 == v14)
          {

LABEL_19:
            objc_msgSend(a1[5], "setRecurringPeerPayment:", v9);

            goto LABEL_20;
          }
          v15 = v14;
          if (v13)
            v16 = v14 == 0;
          else
            v16 = 1;
          if (v16)
          {

          }
          else
          {
            v17 = objc_msgSend(v13, "isEqualToString:", v14);

            if ((v17 & 1) != 0)
              goto LABEL_19;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v6)
          continue;
        break;
      }
    }

    objc_msgSend(a1[5], "setRecurringPeerPayment:", 0);
LABEL_20:
    v3 = v18;
    objc_msgSend(v18, "setTransaction:", a1[5]);
  }

}

- (void)_performDeleteOverride
{
  PKPaymentTransactionDetailViewControllerDeleteOverrider *deleteOverrider;
  id v4;
  id v5;

  deleteOverrider = self->_deleteOverrider;
  if (deleteOverrider)
  {
    -[PKPaymentTransactionDetailViewControllerDeleteOverrider transactionDetailViewControllerDidDeleteTransaction:](deleteOverrider, "transactionDetailViewControllerDidDeleteTransaction:", self->_transaction);
    -[PKPaymentTransactionDetailViewController navigationController](self, "navigationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

  }
}

- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__PKPaymentTransactionDetailViewController_physicalCardsChanged_forAccountIdentifier___block_invoke;
  v10[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v13, &location);
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __86__PKPaymentTransactionDetailViewController_physicalCardsChanged_forAccountIdentifier___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  int v9;
  int v10;
  id *v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained[153];
  if (v3)
  {
    v11 = WeakRetained;
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "accountIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v7 = v5;
    v8 = v7;
    if (v6 == v7)
    {

    }
    else
    {
      if (!v6 || !v7)
      {

        goto LABEL_11;
      }
      v9 = objc_msgSend(v6, "isEqualToString:", v7);

      if (!v9)
        goto LABEL_11;
    }
    v10 = objc_msgSend(v11, "shouldMapSection:", 2);

    WeakRetained = v11;
    if (v10)
    {
      objc_msgSend(v11[139], "updateWithPhysicalCards:", *(_QWORD *)(a1 + 40));
      v8 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
      objc_msgSend(v11, "recomputeMappedSectionsAndReloadSections:", v8);
LABEL_11:

      WeakRetained = v11;
    }
  }

}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (PKTransactionSourceCollection)transactionSourceCollection
{
  return self->_transactionSourceCollection;
}

- (PKPaymentDataProvider)paymentServiceDataProvider
{
  return self->_paymentServiceDataProvider;
}

- (PKPaymentTransactionDetailViewControllerDeleteOverrider)deleteOverrider
{
  return self->_deleteOverrider;
}

- (void)setDeleteOverrider:(id)a3
{
  objc_storeStrong((id *)&self->_deleteOverrider, a3);
}

- (PKPaymentTransactionDetailHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (PKContactResolver)contactResolver
{
  return self->_contactResolver;
}

- (void)setContactResolver:(id)a3
{
  objc_storeStrong((id *)&self->_contactResolver, a3);
}

- (BOOL)issuerAppDeepLinkingEnabled
{
  return self->_issuerAppDeepLinkingEnabled;
}

- (void)setIssuerAppDeepLinkingEnabled:(BOOL)a3
{
  self->_issuerAppDeepLinkingEnabled = a3;
}

- (BOOL)inBridge
{
  return self->_inBridge;
}

- (void)setInBridge:(BOOL)a3
{
  self->_inBridge = a3;
}

- (BOOL)associatedCreditStatementsLoaded
{
  return self->_associatedCreditStatementsLoaded;
}

- (void)setAssociatedCreditStatementsLoaded:(BOOL)a3
{
  self->_associatedCreditStatementsLoaded = a3;
}

- (NSArray)associatedCreditStatements
{
  return self->_associatedCreditStatements;
}

- (void)setAssociatedCreditStatements:(id)a3
{
  objc_storeStrong((id *)&self->_associatedCreditStatements, a3);
}

- (UIImage)mapTilePlaceholderImage
{
  return self->_mapTilePlaceholderImage;
}

- (void)setMapTilePlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_mapTilePlaceholderImage, a3);
}

- (NSArray)lineItems
{
  return self->_lineItems;
}

- (void)setLineItems:(id)a3
{
  objc_storeStrong((id *)&self->_lineItems, a3);
}

- (PKPeerPaymentStatusResponse)peerPaymentStatusResponse
{
  return self->_peerPaymentStatusResponse;
}

- (void)setPeerPaymentStatusResponse:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentStatusResponse, a3);
}

- (NSDateFormatter)transactionDateFormatter
{
  return self->_transactionDateFormatter;
}

- (void)setTransactionDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_transactionDateFormatter, a3);
}

- (NSDateFormatter)transactionLocalTimeDateFormatter
{
  return self->_transactionLocalTimeDateFormatter;
}

- (void)setTransactionLocalTimeDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_transactionLocalTimeDateFormatter, a3);
}

- (NSDateFormatter)productTimeZoneFormatter
{
  return self->_productTimeZoneFormatter;
}

- (void)setProductTimeZoneFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_productTimeZoneFormatter, a3);
}

- (NSDateFormatter)productTimeZoneMonthDayFormatter
{
  return self->_productTimeZoneMonthDayFormatter;
}

- (void)setProductTimeZoneMonthDayFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_productTimeZoneMonthDayFormatter, a3);
}

- (NSDateFormatter)monthDayLocalFormatter
{
  return self->_monthDayLocalFormatter;
}

- (void)setMonthDayLocalFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_monthDayLocalFormatter, a3);
}

- (NSDateFormatter)monthDayYearLocalFormatter
{
  return self->_monthDayYearLocalFormatter;
}

- (void)setMonthDayYearLocalFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_monthDayYearLocalFormatter, a3);
}

- (NSDateFormatter)monthFormatter
{
  return self->_monthFormatter;
}

- (void)setMonthFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_monthFormatter, a3);
}

- (NSTimeZone)productTimeZone
{
  return self->_productTimeZone;
}

- (void)setProductTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_productTimeZone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productTimeZone, 0);
  objc_storeStrong((id *)&self->_monthFormatter, 0);
  objc_storeStrong((id *)&self->_monthDayYearLocalFormatter, 0);
  objc_storeStrong((id *)&self->_monthDayLocalFormatter, 0);
  objc_storeStrong((id *)&self->_productTimeZoneMonthDayFormatter, 0);
  objc_storeStrong((id *)&self->_productTimeZoneFormatter, 0);
  objc_storeStrong((id *)&self->_transactionLocalTimeDateFormatter, 0);
  objc_storeStrong((id *)&self->_transactionDateFormatter, 0);
  objc_storeStrong((id *)&self->_peerPaymentStatusResponse, 0);
  objc_storeStrong((id *)&self->_lineItems, 0);
  objc_storeStrong((id *)&self->_mapTilePlaceholderImage, 0);
  objc_storeStrong((id *)&self->_associatedCreditStatements, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_deleteOverrider, 0);
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_dataReleaseTransactionConfiguration, 0);
  objc_storeStrong((id *)&self->_associatedPaymentRewardsBalance, 0);
  objc_storeStrong((id *)&self->_bankConnectInstitution, 0);
  objc_storeStrong((id *)&self->_thresholdTopUpController, 0);
  objc_storeStrong((id *)&self->_privacyURL, 0);
  objc_storeStrong((id *)&self->_iconGenerator, 0);
  objc_storeStrong((id *)&self->_transactionFetcher, 0);
  objc_storeStrong((id *)&self->_submittingAnswer, 0);
  objc_storeStrong((id *)&self->_applePayReceiptRowViewModels, 0);
  objc_storeStrong((id *)&self->_applePayBarcodeRowViewModels, 0);
  objc_storeStrong((id *)&self->_applePayOrderRowViewModels, 0);
  objc_storeStrong((id *)&self->_merchantTokenResponse, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_coarseLocationMonitor, 0);
  objc_storeStrong((id *)&self->_accountResolutionController, 0);
  objc_storeStrong((id *)&self->_transactionCellController, 0);
  objc_storeStrong((id *)&self->_transactionExplanation, 0);
  objc_storeStrong((id *)&self->_transactionTags, 0);
  objc_storeStrong((id *)&self->_associatedReceipt, 0);
  objc_storeStrong((id *)&self->_associatedPayLaterAccount, 0);
  objc_storeStrong((id *)&self->_associatedInstallmentPlans, 0);
  objc_storeStrong((id *)&self->_associatedTransaction, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_physicalCardController, 0);
  objc_storeStrong((id *)&self->_lazyPeerPaymentController, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
}

@end
