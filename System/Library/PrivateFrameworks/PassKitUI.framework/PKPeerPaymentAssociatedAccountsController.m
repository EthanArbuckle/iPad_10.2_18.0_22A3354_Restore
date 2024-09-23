@implementation PKPeerPaymentAssociatedAccountsController

- (PKPeerPaymentAssociatedAccountsController)initWithFamilyMembers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  PKContactAvatarManager *v15;
  void *v16;
  id v17;
  PKContactAvatarManager *v18;
  id v19;
  PKPeerPaymentAssociatedAccountsController *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10);
        v12 = objc_alloc(MEMORY[0x1E0D66D80]);
        v13 = (void *)objc_msgSend(v12, "initWithFAFamilyMember:", v11, (_QWORD)v22);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66D88]), "initWithFamilyMembers:", v5);
  v15 = [PKContactAvatarManager alloc];
  objc_msgSend(MEMORY[0x1E0D66C60], "defaultContactResolver");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x1E0D67100]);
  v18 = -[PKContactAvatarManager initWithContactResolver:paymentDataProvider:](v15, "initWithContactResolver:paymentDataProvider:", v16, v17);

  v19 = objc_alloc_init(MEMORY[0x1E0D66F18]);
  v20 = -[PKPeerPaymentAssociatedAccountsController initWithFamilyCollection:avatarManager:passLibraryDataProvider:context:](self, "initWithFamilyCollection:avatarManager:passLibraryDataProvider:context:", v14, v18, v19, 3);

  return v20;
}

- (PKPeerPaymentAssociatedAccountsController)initWithFamilyCollection:(id)a3 avatarManager:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  PKPeerPaymentAssociatedAccountsController *v14;
  PKPaymentService *v15;
  PKPaymentService *paymentService;
  uint64_t v17;
  PKPeerPaymentService *peerPaymentService;
  uint64_t v19;
  PKPeerPaymentAccount *account;
  void *v21;
  int v22;
  id *v23;
  void *v24;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PKPeerPaymentAssociatedAccountsController;
  v14 = -[PKPeerPaymentAssociatedAccountsController init](&v26, sel_init);
  if (v14)
  {
    v15 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E0D672B0]);
    paymentService = v14->_paymentService;
    v14->_paymentService = v15;

    objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
    v17 = objc_claimAutoreleasedReturnValue();
    peerPaymentService = v14->_peerPaymentService;
    v14->_peerPaymentService = (PKPeerPaymentService *)v17;

    -[PKPeerPaymentService account](v14->_peerPaymentService, "account");
    v19 = objc_claimAutoreleasedReturnValue();
    account = v14->_account;
    v14->_account = (PKPeerPaymentAccount *)v19;

    objc_storeStrong((id *)&v14->_familyCollection, a3);
    objc_storeStrong((id *)&v14->_avatarManager, a4);
    v14->_context = a6;
    objc_storeStrong((id *)&v14->_passLibraryDataProvider, a5);
    -[PKFamilyMemberCollection currentUser](v14->_familyCollection, "currentUser");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isOrganizer");
    v23 = (id *)MEMORY[0x1E0D68C80];
    if (!v22)
      v23 = (id *)MEMORY[0x1E0D68C88];
    objc_storeStrong((id *)&v14->_viewerFamilyMemberTypeAnalyticsKey, *v23);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v14, sel__peerPaymentAccountChanged_, *MEMORY[0x1E0D6B288], v14->_peerPaymentService);

  }
  return v14;
}

- (void)presentAssociatedAccountsFlowWithPresentationContext:(id)a3 fromNavigationController:(id)a4
{
  id v7;
  id v8;
  PKPeerPaymentAccount *account;
  id *p_presentationContext;
  NSObject *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  PKPeerPaymentAssociatedAccountControllerDoneTapHelper *v21;
  PKPeerPaymentAssociatedAccountControllerDoneTapHelper *doneTapHelper;
  PKPeerPaymentAssociatedAccountViewController *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  int v33;
  _BOOL4 v34;
  PKPeerPaymentFamilyCircleViewController *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int HasDisabledPeerPayment;
  BOOL v52;
  __CFString *v53;
  __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
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
  PKPeerPaymentAddAssociatedAccountViewController *v75;
  void *v76;
  PKPeerPaymentAddAssociatedAccountViewController *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  PKFamilyMemberCollection *familyCollection;
  _QWORD v86[3];
  _QWORD v87[3];
  _QWORD v88[3];
  uint8_t buf[4];
  id v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    PKLogFacilityTypeGetObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Error: no navigation controller defined.", buf, 2u);
    }
    goto LABEL_62;
  }
  account = self->_account;
  if (!account)
  {
    PKLogFacilityTypeGetObject();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v43, OS_LOG_TYPE_DEFAULT, "There is no peer payment account. Guide user to setup apple cash prior to viewing children.", buf, 2u);
    }

    if (PKPassbookIsCurrentlyDeletedByUser())
    {
      v13 = PKCreateAlertControllerForWalletUninstalled(0);
    }
    else
    {
      HasDisabledPeerPayment = PKUserHasDisabledPeerPayment();
      v52 = HasDisabledPeerPayment == 0;
      if (HasDisabledPeerPayment)
        v53 = CFSTR("PEER_PAYMENT_ERROR_APPLE_CASH_REENABLE_TITLE");
      else
        v53 = CFSTR("PEER_PAYMENT_ERROR_APPLE_CASH_NOT_ENABLED_TITLE");
      if (v52)
        v54 = CFSTR("PEER_PAYMENT_ERROR_APPLE_CASH_NOT_ENABLED_MESSAGE");
      else
        v54 = CFSTR("PEER_PAYMENT_ERROR_APPLE_CASH_REENABLE_MESSAGE");
      PKLocalizedPeerPaymentLexingtonString(&v53->isa);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentLexingtonString(&v54->isa);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v55, v56, 1);
      v13 = objc_claimAutoreleasedReturnValue();
      v57 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ERROR_OPEN_SETTINGS_BUTTON"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "actionWithTitle:style:handler:", v58, 0, &__block_literal_global_102);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject addAction:](v13, "addAction:", v59);
    }
    objc_msgSend(v8, "presentViewController:animated:completion:", v13, 1, 0);
    goto LABEL_62;
  }
  if ((-[PKPeerPaymentAccount supportsFamilySharing](account, "supportsFamilySharing") & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v44, OS_LOG_TYPE_DEFAULT, "Peer Payment family sharing feature not supported.", buf, 2u);
    }

    v45 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_FEATURE_NOT_SUPPORTED_TITLE"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_FEATURE_NOT_SUPPORTED_MESSAGE"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "alertControllerWithTitle:message:preferredStyle:", v46, v47, 1);
    v13 = objc_claimAutoreleasedReturnValue();

    v48 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("OK"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "actionWithTitle:style:handler:", v49, 0, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject addAction:](v13, "addAction:", v50);
    objc_msgSend(v8, "presentViewController:animated:completion:", v13, 1, 0);

    goto LABEL_62;
  }
  objc_storeStrong((id *)&self->_navigationController, a4);
  p_presentationContext = (id *)&self->_presentationContext;
  objc_storeStrong((id *)&self->_presentationContext, a3);
  PKLogFacilityTypeGetObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *p_presentationContext;
    *(_DWORD *)buf = 138412290;
    v90 = v12;
    _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Presenting peer payment associated account view with configuration %@", buf, 0xCu);
  }

  objc_msgSend(*p_presentationContext, "member");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(*p_presentationContext, "setupType");
  if (!v13)
  {
    v35 = -[PKPeerPaymentFamilyCircleViewController initWithFamilyCollection:avatarManager:passLibraryDataProvider:context:]([PKPeerPaymentFamilyCircleViewController alloc], "initWithFamilyCollection:avatarManager:passLibraryDataProvider:context:", self->_familyCollection, self->_avatarManager, self->_passLibraryDataProvider, self->_context);
    if (v35)
      goto LABEL_60;
    v13 = 0;
    goto LABEL_62;
  }
  v15 = v14;
  -[NSObject altDSID](v13, "altDSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAccount peerPaymentAccountWithAltDSID:](self->_account, "peerPaymentAccountWithAltDSID:", v16);
  v17 = objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAccount accountInvitationWithAltDSID:](self->_account, "accountInvitationWithAltDSID:", v16);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (!(v17 | v18))
  {
    -[PKFamilyMemberCollection currentUser](self->_familyCollection, "currentUser");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "isOrganizer");

    if (v61)
    {
      if (v15 == 1)
      {
        v75 = [PKPeerPaymentAddAssociatedAccountViewController alloc];
        familyCollection = self->_familyCollection;
        objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 1;
        v77 = -[PKPeerPaymentAddAssociatedAccountViewController initWithFamilyMember:familyCollection:webService:passLibraryDataProvider:delegate:context:setupType:](v75, "initWithFamilyMember:familyCollection:webService:passLibraryDataProvider:delegate:context:setupType:", v13, familyCollection, v76, self->_passLibraryDataProvider, self, self->_context, 1);

        v35 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v77);
        -[PKPeerPaymentFamilyCircleViewController setModalInPresentation:](v35, "setModalInPresentation:", 1);

      }
      else if (v15)
      {
        v33 = 0;
        v35 = 0;
      }
      else
      {
        v35 = -[PKPeerPaymentTurnOnAssociatedAccountViewController initWithFamilyMember:familyCollection:delegate:passLibraryDataProvider:context:setupType:]([PKPeerPaymentTurnOnAssociatedAccountViewController alloc], "initWithFamilyMember:familyCollection:delegate:passLibraryDataProvider:context:setupType:", v13, self->_familyCollection, self, self->_passLibraryDataProvider, self->_context, 0);
        v33 = 0;
      }
      goto LABEL_57;
    }
    v62 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_CANNOT_TURN_ON_ACCOUNT_TITLE"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_CANNOT_TURN_ON_ACCOUNT_MESSAGE"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "alertControllerWithTitle:message:preferredStyle:", v63, v64, 1);
    v35 = (PKPeerPaymentFamilyCircleViewController *)objc_claimAutoreleasedReturnValue();

    v65 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "actionWithTitle:style:handler:", v66, 0, 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentFamilyCircleViewController addAction:](v35, "addAction:", v67);

LABEL_48:
    v33 = 1;
    goto LABEL_57;
  }
  if (!v17)
  {
    v68 = (void *)v18;
    v69 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_ERROR_TITLE"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_ERROR_MESSAGE"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "alertControllerWithTitle:message:preferredStyle:", v70, v71, 1);
    v35 = (PKPeerPaymentFamilyCircleViewController *)objc_claimAutoreleasedReturnValue();

    v72 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "actionWithTitle:style:handler:", v73, 0, 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentFamilyCircleViewController addAction:](v35, "addAction:", v74);

    v19 = v68;
    goto LABEL_48;
  }
  objc_msgSend(*p_presentationContext, "transaction");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v81 = v16;
    v82 = v17;
    v83 = v19;
    v21 = -[PKPeerPaymentAssociatedAccountControllerDoneTapHelper initWithNavigationController:]([PKPeerPaymentAssociatedAccountControllerDoneTapHelper alloc], "initWithNavigationController:", self->_navigationController);
    doneTapHelper = self->_doneTapHelper;
    self->_doneTapHelper = v21;

    v23 = -[PKPeerPaymentAssociatedAccountViewController initWithFamilyMember:familyCollection:account:context:]([PKPeerPaymentAssociatedAccountViewController alloc], "initWithFamilyMember:familyCollection:account:context:", v13, self->_familyCollection, self->_account, self->_context);
    -[PKPeerPaymentAssociatedAccountViewController navigationItem](v23, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self->_doneTapHelper);
    objc_msgSend(v24, "setRightBarButtonItem:", v25);

    -[PKPeerPaymentAssociatedAccountViewController familyMemberTransactionViewController](v23, "familyMemberTransactionViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v20;
    objc_msgSend(v26, "transactionViewControllerForTransaction:", v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "navigationItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self->_doneTapHelper, sel_doneTapped);
    objc_msgSend(v28, "setRightBarButtonItem:", v29);

    v30 = v26;
    if (v23)
      v31 = v26 == 0;
    else
      v31 = 1;
    v33 = !v31 && v27 != 0;
    v34 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v33 == 1)
    {
      if (v34)
      {
        *(_DWORD *)buf = 138412290;
        v90 = v84;
        _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Presenting associated account transaction %@", buf, 0xCu);
      }

      v35 = objc_alloc_init(PKNavigationController);
      v88[0] = v23;
      v88[1] = v30;
      v88[2] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 3);
      v79 = v30;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPeerPaymentFamilyCircleViewController setViewControllers:](v35, "setViewControllers:", v36);

      -[PKPeerPaymentAssociatedAccountsController _begingReportingIfNecessary](self, "_begingReportingIfNecessary");
      v78 = (void *)MEMORY[0x1E0D66A58];
      v37 = *MEMORY[0x1E0D698D8];
      v38 = *MEMORY[0x1E0D68F50];
      v86[0] = *MEMORY[0x1E0D68AA0];
      v86[1] = v38;
      v39 = *MEMORY[0x1E0D69790];
      v87[0] = *MEMORY[0x1E0D69788];
      v87[1] = v39;
      v86[2] = *MEMORY[0x1E0D68C78];
      v87[2] = self->_viewerFamilyMemberTypeAnalyticsKey;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 3);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "subject:sendEvent:", v37, v40);

      -[PKPeerPaymentAssociatedAccountsController _endReportingSessionIfNecessary](self, "_endReportingSessionIfNecessary");
      v41 = v27;
      v19 = v83;
      v20 = v84;
      v42 = v79;
      v17 = v82;
    }
    else
    {
      v80 = v27;
      v42 = v30;
      v20 = v84;
      if (v34)
      {
        *(_DWORD *)buf = 138412290;
        v90 = v84;
        _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Cannot presenting associated account transaction for a nil view controllers %@", buf, 0xCu);
      }

      v35 = 0;
      v17 = v82;
      v19 = v83;
      v41 = v80;
    }

    v16 = v81;
  }
  else
  {
    v35 = -[PKPeerPaymentAssociatedAccountViewController initWithFamilyMember:familyCollection:account:context:]([PKPeerPaymentAssociatedAccountViewController alloc], "initWithFamilyMember:familyCollection:account:context:", v13, self->_familyCollection, self->_account, self->_context);
    v33 = 0;
  }

LABEL_57:
  if (v35)
  {
    if (v33)
    {
      objc_msgSend(v8, "presentViewController:animated:completion:", v35, 1, 0);
LABEL_61:

      goto LABEL_62;
    }
LABEL_60:
    objc_msgSend(v8, "pushViewController:animated:", v35, 1);
    goto LABEL_61;
  }
LABEL_62:

}

void __123__PKPeerPaymentAssociatedAccountsController_presentAssociatedAccountsFlowWithPresentationContext_fromNavigationController___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=PASSBOOK"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, 0);

}

- (void)addPeerPaymentAssociatedAccountSetupCompletedWithSucess:(BOOL)a3 updatedAccount:(id)a4 forFamilyMember:(id)a5
{
  _BOOL4 v7;
  id v9;
  id v10;
  NSObject *v11;
  PKPeerPaymentAccount *account;
  void *v13;
  void *v14;
  PKPeerPaymentAssociatedAccountViewController *v15;
  PKPeerPaymentAssociatedAccountViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  UINavigationController *navigationController;
  void *v21;
  uint8_t v22[16];

  v7 = a3;
  v9 = a4;
  v10 = a5;
  PKLogFacilityTypeGetObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentAssociatedAccountsController addPeerPaymentAssociatedAccountSetupCompletedWithSucess: called", v22, 2u);
  }

  if (!v7)
  {
    -[UINavigationController dismissViewControllerAnimated:completion:](self->_navigationController, "dismissViewControllerAnimated:completion:", 1, 0);
    goto LABEL_17;
  }
  if (v9)
    objc_storeStrong((id *)&self->_account, a4);
  account = self->_account;
  objc_msgSend(v10, "altDSID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAccount peerPaymentAccountWithAltDSID:](account, "peerPaymentAccountWithAltDSID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = -[PKPeerPaymentAssociatedAccountViewController initWithFamilyMember:familyCollection:account:context:]([PKPeerPaymentAssociatedAccountViewController alloc], "initWithFamilyMember:familyCollection:account:context:", v10, self->_familyCollection, self->_account, self->_context);
  }
  else
  {
    if (!self->_context)
    {
      v16 = 0;
      goto LABEL_12;
    }
    v15 = -[PKPeerPaymentFamilyCircleViewController initWithFamilyCollection:avatarManager:passLibraryDataProvider:context:]([PKPeerPaymentFamilyCircleViewController alloc], "initWithFamilyCollection:avatarManager:passLibraryDataProvider:context:", self->_familyCollection, self->_avatarManager, self->_passLibraryDataProvider, self->_context);
  }
  v16 = v15;
LABEL_12:
  -[UINavigationController viewControllers](self->_navigationController, "viewControllers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(v18, "lastObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v18, "removeLastObject");
  if (v16)
    objc_msgSend(v18, "addObject:", v16);
  navigationController = self->_navigationController;
  v21 = (void *)objc_msgSend(v18, "copy");
  -[UINavigationController setViewControllers:](navigationController, "setViewControllers:", v21);

  -[UINavigationController dismissViewControllerAnimated:completion:](self->_navigationController, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_17:

}

- (void)_endReportingSessionIfNecessary
{
  if (self->_didBeginReporter)
    objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", *MEMORY[0x1E0D698D8]);
}

- (void)_begingReportingIfNecessary
{
  uint64_t v3;
  void *v4;

  v3 = *MEMORY[0x1E0D698D8];
  objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D698D8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    self->_didBeginReporter = 1;
    objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v3);
  }
}

- (void)_peerPaymentAccountChanged:(id)a3
{
  PKPeerPaymentService *peerPaymentService;
  _QWORD v4[5];

  peerPaymentService = self->_peerPaymentService;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__PKPeerPaymentAssociatedAccountsController__peerPaymentAccountChanged___block_invoke;
  v4[3] = &unk_1E3E654F8;
  v4[4] = self;
  -[PKPeerPaymentService updateAccountWithCompletion:](peerPaymentService, "updateAccountWithCompletion:", v4);
}

void __72__PKPeerPaymentAssociatedAccountsController__peerPaymentAccountChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__PKPeerPaymentAssociatedAccountsController__peerPaymentAccountChanged___block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __72__PKPeerPaymentAssociatedAccountsController__peerPaymentAccountChanged___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_storeStrong((id *)&self->_viewerFamilyMemberTypeAnalyticsKey, 0);
  objc_storeStrong((id *)&self->_doneTapHelper, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end
