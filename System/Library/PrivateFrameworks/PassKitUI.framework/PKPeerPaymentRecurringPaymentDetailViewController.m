@implementation PKPeerPaymentRecurringPaymentDetailViewController

- (PKPeerPaymentRecurringPaymentDetailViewController)initWithRecurringPayment:(id)a3 recipientAddress:(id)a4 mode:(unint64_t)a5 context:(int64_t)a6 peerPaymentController:(id)a7 remoteMessagesComposer:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  PKPeerPaymentRecurringPaymentDetailViewController *v18;

  v14 = a8;
  v15 = a7;
  v16 = a3;
  -[PKPeerPaymentRecurringPaymentDetailViewController _composeRecipientForAddress:](self, "_composeRecipientForAddress:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PKPeerPaymentRecurringPaymentDetailViewController initWithRecurringPayment:recipient:mode:context:peerPaymentController:remoteMessagesComposer:](self, "initWithRecurringPayment:recipient:mode:context:peerPaymentController:remoteMessagesComposer:", v16, v17, a5, a6, v15, v14);

  return v18;
}

- (PKPeerPaymentRecurringPaymentDetailViewController)initWithRecurringPayment:(id)a3 recipient:(id)a4 mode:(unint64_t)a5 context:(int64_t)a6 peerPaymentController:(id)a7 remoteMessagesComposer:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  PKPeerPaymentRecurringPaymentDetailViewController *v19;
  PKPeerPaymentRecurringPaymentDetailViewController *v20;
  id *p_recurringPayment;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  PKPaymentPass *selectedPass;
  PKAvatarView *v27;
  PKAvatarView *avatarView;
  void *v29;
  PKPeerPaymentRequest *v30;
  PKPeerPaymentRequest *paymentRequest;
  PKPeerPaymentRequest *v32;
  void *v33;
  PKPeerPaymentRequest *v34;
  void *v35;
  PKPeerPaymentRequest *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  PKPeerPaymentRemoteMessagesComposer *v41;
  PKPeerPaymentRemoteMessagesComposer *remoteMessagesComposer;
  uint64_t v43;
  PKPeerPaymentService *peerPaymentService;
  unint64_t mode;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  PKPeerPaymentRecurringPaymentDetailAmountSectionController *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  PKPeerPaymentRecurringPaymentDetailAmountSectionController *amountSectionController;
  PKDashboardMessageSectionController *v55;
  void *v56;
  uint64_t v57;
  PKDashboardMessageSectionController *messageSectionController;
  PKPeerPaymentRecurringPaymentDetailSectionController *v59;
  id v60;
  void *v61;
  uint64_t v62;
  PKPeerPaymentRecurringPaymentDetailSectionController *detailSectionController;
  PKPeerPaymentRecurringPaymentDetailSectionController *v64;
  void *v65;
  PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController *fundingSourceSectionController;
  char v71;
  uint64_t v72;
  PKPeerPaymentRecurringPaymentDetailActionSectionController *v73;
  PKPeerPaymentRecurringPaymentDetailActionSectionController *pauseSectionController;
  PKPeerPaymentRecurringPaymentDetailActionSectionController *v75;
  PKPeerPaymentRecurringPaymentDetailActionSectionController *cancelSectionController;
  PKPeerPaymentRecurringPaymentMemoSectionController *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  PKPeerPaymentRecurringPaymentMemoSectionController *memoSectionController;
  void *v82;
  void *v84;
  id v85;
  id v86;
  id obj;
  objc_super v88;

  v15 = a3;
  v16 = a4;
  v17 = a7;
  obj = a8;
  v18 = a8;
  v88.receiver = self;
  v88.super_class = (Class)PKPeerPaymentRecurringPaymentDetailViewController;
  v19 = -[PKDynamicCollectionViewController init](&v88, sel_init);
  v20 = v19;
  if (v19)
  {
    v85 = v17;
    p_recurringPayment = (id *)&v19->_recurringPayment;
    objc_storeStrong((id *)&v19->_recurringPayment, a3);
    objc_storeStrong((id *)&v20->_recipient, a4);
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v15;
    objc_msgSend(v15, "fundingSource");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fpanIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "passWithFPANIdentifier:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    selectedPass = v20->_selectedPass;
    v20->_selectedPass = (PKPaymentPass *)v25;

    v20->_mode = a5;
    v20->_context = a6;
    objc_storeStrong((id *)&v20->_peerPaymentController, a7);
    v27 = objc_alloc_init(PKAvatarView);
    avatarView = v20->_avatarView;
    v20->_avatarView = v27;

    -[PKPeerPaymentController account](v20->_peerPaymentController, "account");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "recurringPaymentsFeatureDescriptor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (PKPeerPaymentRequest *)objc_alloc_init(MEMORY[0x1E0D67460]);
    paymentRequest = v20->_paymentRequest;
    v20->_paymentRequest = v30;

    v32 = v20->_paymentRequest;
    objc_msgSend(v29, "merchantIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRequest setMerchantIdentifier:](v32, "setMerchantIdentifier:", v33);

    v34 = v20->_paymentRequest;
    objc_msgSend(v29, "supportedNetworks");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRequest setSupportedNetworks:](v34, "setSupportedNetworks:", v35);

    -[PKPeerPaymentRequest setMerchantCapabilities:](v20->_paymentRequest, "setMerchantCapabilities:", objc_msgSend(v29, "merchantCapabilities"));
    v36 = v20->_paymentRequest;
    v37 = (void *)MEMORY[0x1E0C99E60];
    -[PKPeerPaymentController account](v20->_peerPaymentController, "account");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "countryCode");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setWithObject:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRequest setSupportedCountries:](v36, "setSupportedCountries:", v40);

    if (v18)
    {
      objc_storeStrong((id *)&v20->_remoteMessagesComposer, obj);
      -[PKPeerPaymentRemoteMessagesComposer setActionType:](v20->_remoteMessagesComposer, "setActionType:", 2);
    }
    else
    {
      v41 = -[PKPeerPaymentRemoteMessagesComposer initWithPeerPaymentController:presentingViewController:actionType:sourceType:]([PKPeerPaymentRemoteMessagesComposer alloc], "initWithPeerPaymentController:presentingViewController:actionType:sourceType:", v20->_peerPaymentController, v20, 2, 0);
      remoteMessagesComposer = v20->_remoteMessagesComposer;
      v20->_remoteMessagesComposer = v41;

    }
    objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
    v43 = objc_claimAutoreleasedReturnValue();
    peerPaymentService = v20->_peerPaymentService;
    v20->_peerPaymentService = (PKPeerPaymentService *)v43;

    -[PKPeerPaymentService registerObserver:](v20->_peerPaymentService, "registerObserver:", v20);
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v20, "setUseItemIdentityWhenUpdating:", 1);
    mode = v20->_mode;
    if (!mode || mode == 2)
    {
      v20->_allowEdits = 0;
    }
    else if (mode == 1)
    {
      v20->_allowEdits = 1;
      objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "associatedPassUniqueID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "passWithUniqueID:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "paymentPass");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*p_recurringPayment, "setUsesAppleCashBalance:", (objc_msgSend(v49, "settings") & 0x800) == 0);
    }
    v50 = [PKPeerPaymentRecurringPaymentDetailAmountSectionController alloc];
    objc_msgSend(*p_recurringPayment, "amount");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_recurringPayment, "currency");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[PKPeerPaymentRecurringPaymentDetailAmountSectionController initWithAmount:currency:delegate:](v50, "initWithAmount:currency:delegate:", v51, v52, v20);
    amountSectionController = v20->_amountSectionController;
    v20->_amountSectionController = (PKPeerPaymentRecurringPaymentDetailAmountSectionController *)v53;

    v55 = [PKDashboardMessageSectionController alloc];
    -[PKPeerPaymentRecurringPaymentDetailViewController _dashboardMessages](v20, "_dashboardMessages");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[PKDashboardMessageSectionController initWithMessages:delegate:](v55, "initWithMessages:delegate:", v56, v20);
    messageSectionController = v20->_messageSectionController;
    v20->_messageSectionController = (PKDashboardMessageSectionController *)v57;

    v59 = [PKPeerPaymentRecurringPaymentDetailSectionController alloc];
    v60 = *p_recurringPayment;
    objc_msgSend(v29, "productTimeZone");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = -[PKPeerPaymentRecurringPaymentDetailSectionController initWithRecurringPayment:productTimeZone:mode:delegate:](v59, "initWithRecurringPayment:productTimeZone:mode:delegate:", v60, v61, v20->_mode, v20);
    detailSectionController = v20->_detailSectionController;
    v20->_detailSectionController = (PKPeerPaymentRecurringPaymentDetailSectionController *)v62;

    v64 = v20->_detailSectionController;
    objc_msgSend(v29, "frequencyOptions");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPaymentDetailSectionController setFrequencyOptions:](v64, "setFrequencyOptions:", v65);

    -[PKPeerPaymentRecurringPaymentDetailSectionController setIsEditable:](v20->_detailSectionController, "setIsEditable:", v20->_allowEdits);
    v66 = [PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController alloc];
    objc_msgSend(*p_recurringPayment, "fundingSource");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "name");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = -[PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController initWithFundingSource:useAppleCashBalance:delegate:](v66, "initWithFundingSource:useAppleCashBalance:delegate:", v68, objc_msgSend(*p_recurringPayment, "usesAppleCashBalance"), v20);
    fundingSourceSectionController = v20->_fundingSourceSectionController;
    v20->_fundingSourceSectionController = (PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController *)v69;

    -[PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController setIsEditable:](v20->_fundingSourceSectionController, "setIsEditable:", v20->_allowEdits);
    if ((PKIsVision() & 1) == 0)
    {
      v71 = objc_msgSend(*p_recurringPayment, "actions");
      v72 = objc_msgSend(*p_recurringPayment, "status");
      if ((v71 & 1) != 0)
      {
        v73 = -[PKPeerPaymentRecurringPaymentDetailActionSectionController initWithAction:delegate:]([PKPeerPaymentRecurringPaymentDetailActionSectionController alloc], "initWithAction:delegate:", 1, v20);
        pauseSectionController = v20->_pauseSectionController;
        v20->_pauseSectionController = v73;

        -[PKPeerPaymentRecurringPaymentDetailActionSectionController setStatus:](v20->_pauseSectionController, "setStatus:", v72);
      }
      if ((v71 & 2) != 0)
      {
        v75 = -[PKPeerPaymentRecurringPaymentDetailActionSectionController initWithAction:delegate:]([PKPeerPaymentRecurringPaymentDetailActionSectionController alloc], "initWithAction:delegate:", 2, v20);
        cancelSectionController = v20->_cancelSectionController;
        v20->_cancelSectionController = v75;

        -[PKPeerPaymentRecurringPaymentDetailActionSectionController setStatus:](v20->_cancelSectionController, "setStatus:", v72);
      }
    }
    v77 = [PKPeerPaymentRecurringPaymentMemoSectionController alloc];
    objc_msgSend(*p_recurringPayment, "memo");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipient contact](v20->_recipient, "contact");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = -[PKPeerPaymentRecurringPaymentMemoSectionController initWithRecurringPaymentMemo:contact:delegate:](v77, "initWithRecurringPaymentMemo:contact:delegate:", v78, v79, v20);
    memoSectionController = v20->_memoSectionController;
    v20->_memoSectionController = (PKPeerPaymentRecurringPaymentMemoSectionController *)v80;

    -[PKPeerPaymentRecurringPaymentMemoSectionController setIsEditable:](v20->_memoSectionController, "setIsEditable:", v20->_allowEdits);
    -[PKPeerPaymentRecurringPaymentDetailViewController _updateSections](v20, "_updateSections");
    -[PKPeerPaymentRecurringPaymentDetailViewController _setUpNavigationBar](v20, "_setUpNavigationBar");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "addObserver:selector:name:object:", v20, sel__keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);
    objc_msgSend(v82, "addObserver:selector:name:object:", v20, sel__keyboardWillChange_, *MEMORY[0x1E0DC4FD8], 0);
    objc_msgSend(v82, "addObserver:selector:name:object:", v20, sel__keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

    v15 = v86;
    v17 = v85;
  }

  return v20;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentRecurringPaymentDetailViewController;
  -[PKPeerPaymentRecurringPaymentDetailViewController dealloc](&v4, sel_dealloc);
}

- (void)setShowActivityIndicator:(BOOL)a3
{
  self->_showActivityIndicator = a3;
  -[PKPeerPaymentRecurringPaymentDetailViewController _updateBarButtonItems](self, "_updateBarButtonItems");
}

- (void)setShowCancelButton:(BOOL)a3
{
  if (self->_showCancelButton != a3)
  {
    self->_showCancelButton = a3;
    -[PKPeerPaymentRecurringPaymentDetailViewController _setUpNavigationBar](self, "_setUpNavigationBar");
  }
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentRecurringPaymentDetailViewController;
  -[PKDynamicCollectionViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PKPeerPaymentRecurringPaymentDetailViewController _configureAvatarView](self, "_configureAvatarView");
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setKeyboardDismissMode:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPeerPaymentRecurringPaymentDetailViewController;
  -[PKDynamicCollectionViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[PKPeerPaymentRecurringPaymentDetailViewController _setUpNavigationBar](self, "_setUpNavigationBar");
  v4 = -[PKPeerPaymentRecurringPaymentDetailViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle");
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == 2)
    +[PKPeerPaymentTheme backgroundColor](PKPeerPaymentTheme, "backgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

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
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentRecurringPaymentDetailViewController;
  -[PKDynamicCollectionViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  -[PKPeerPaymentRecurringPaymentDetailViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentInset");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v3, "bounds");
  if (self->_keyboardVisible)
    v13 = fmax(v11 + v12 - self->_keyboardFrame.origin.y, 0.0);
  else
    v13 = 0.0;
  objc_msgSend(v4, "setContentInset:", v6, v8, v13, v10);

}

- (void)viewDidDisappear:(BOOL)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentRecurringPaymentDetailViewController;
  -[PKPeerPaymentRecurringPaymentDetailViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      -[PKPeerPaymentRecurringPaymentDetailViewController _pendingRecurringPayment](self, "_pendingRecurringPayment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "recurringPaymentDetailViewControllerDidDisappearWithRecurringPayment:", v9);

    }
  }
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
  v7[2] = __71__PKPeerPaymentRecurringPaymentDetailViewController__keyboardWillShow___block_invoke;
  v7[3] = &unk_1E3E618F0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PKPeerPaymentRecurringPaymentDetailViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v7);

}

BOOL __71__PKPeerPaymentRecurringPaymentDetailViewController__keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double *v18;
  double *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  CGRect v27;

  v2 = *(_QWORD *)(a1 + 32);
  v4 = *(double *)(v2 + 1128);
  v3 = *(double *)(v2 + 1136);
  v6 = *(double *)(v2 + 1144);
  v5 = *(double *)(v2 + 1152);
  *(_BYTE *)(v2 + 1160) = 1;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    objc_msgSend(v7, "CGRectValue");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }
  else
  {
    v9 = *MEMORY[0x1E0C9D628];
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  objc_msgSend(*(id *)(a1 + 32), "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *(double **)(a1 + 32);
  v19 = v18 + 141;
  if (v17)
  {
    objc_msgSend(v18, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertRect:fromWindow:", 0, v9, v11, v13, v15);
    objc_msgSend(v20, "convertRect:fromView:", 0);
    *(_QWORD *)v19 = v21;
    *((_QWORD *)v19 + 1) = v22;
    *((_QWORD *)v19 + 2) = v23;
    *((_QWORD *)v19 + 3) = v24;

  }
  else
  {
    *v19 = v9;
    v18[142] = v11;
    v18[143] = v13;
    v18[144] = v15;
  }
  v27.origin.x = v4;
  v27.origin.y = v3;
  v27.size.width = v6;
  v27.size.height = v5;
  v25 = !CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1128), v27);

  return v25;
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
      v7[2] = __73__PKPeerPaymentRecurringPaymentDetailViewController__keyboardWillChange___block_invoke;
      v7[3] = &unk_1E3E618F0;
      v7[4] = self;
      v8 = v6;
      -[PKPeerPaymentRecurringPaymentDetailViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v7);

      v5 = v6;
    }

  }
}

BOOL __73__PKPeerPaymentRecurringPaymentDetailViewController__keyboardWillChange___block_invoke(uint64_t a1)
{
  double *v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double *v17;
  double *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  CGRect v26;

  v2 = *(double **)(a1 + 32);
  v4 = v2[141];
  v3 = v2[142];
  v6 = v2[143];
  v5 = v2[144];
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "CGRectValue");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v2 = *(double **)(a1 + 32);
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D628];
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  objc_msgSend(v2, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *(double **)(a1 + 32);
  v18 = v17 + 141;
  if (v16)
  {
    objc_msgSend(v17, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "convertRect:fromWindow:", 0, v8, v10, v12, v14);
    objc_msgSend(v19, "convertRect:fromView:", 0);
    *(_QWORD *)v18 = v20;
    *((_QWORD *)v18 + 1) = v21;
    *((_QWORD *)v18 + 2) = v22;
    *((_QWORD *)v18 + 3) = v23;

  }
  else
  {
    *v18 = v8;
    v17[142] = v10;
    v17[143] = v12;
    v17[144] = v14;
  }
  v26.origin.x = v4;
  v26.origin.y = v3;
  v26.size.width = v6;
  v26.size.height = v5;
  v24 = !CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1128), v26);

  return v24;
}

- (void)_keyboardWillHide:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__PKPeerPaymentRecurringPaymentDetailViewController__keyboardWillHide___block_invoke;
  v3[3] = &unk_1E3E61918;
  v3[4] = self;
  -[PKPeerPaymentRecurringPaymentDetailViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v3);
}

BOOL __71__PKPeerPaymentRecurringPaymentDetailViewController__keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _OWORD *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGRect v8;

  v1 = *(_QWORD *)(a1 + 32);
  v8 = *(CGRect *)(v1 + 1128);
  *(_BYTE *)(v1 + 1160) = 0;
  v2 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 1128);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *v2 = *MEMORY[0x1E0C9D628];
  v2[1] = v3;
  *(_QWORD *)&v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1136);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1144);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1152);
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
    -[PKPeerPaymentRecurringPaymentDetailViewController viewIfLoaded](self, "viewIfLoaded");
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
        v8[2] = __84__PKPeerPaymentRecurringPaymentDetailViewController__updateLayoutForKeyboardAction___block_invoke;
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

uint64_t __84__PKPeerPaymentRecurringPaymentDetailViewController__updateLayoutForKeyboardAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_updateSections
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __68__PKPeerPaymentRecurringPaymentDetailViewController__updateSections__block_invoke;
  v2[3] = &unk_1E3E61310;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __68__PKPeerPaymentRecurringPaymentDetailViewController__updateSections__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  void *v3;
  id *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id *v12;
  id v13;
  id *v14;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v14 = WeakRetained;
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v14[131], "status") == 2)
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v14;
    if (v14[156] == (id)1)
    {
      objc_msgSend(v14[148], "setHideAmount:", 1);
      objc_msgSend(v2, "addObject:", v14[146]);
      v4 = v14;
    }
    if (objc_msgSend(v4, "_shouldShowDashboardMessages"))
    {
      v5 = v14[147];
      objc_msgSend(v14, "_dashboardMessages");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "updateWithMessages:currentMessageIndex:", v6, 0);

      objc_msgSend(v2, "addObject:", v14[147]);
    }
    objc_msgSend(v14[148], "updateWithRecurringPayment:", v14[131]);
    objc_msgSend(v14[148], "setIsEditable:", *((unsigned __int8 *)v14 + 1224));
    objc_msgSend(v14[148], "setTitleColor:", v3);
    objc_msgSend(v2, "addObject:", v14[148]);
    if (v14[156] == (id)2)
    {
      objc_msgSend(v14[148], "setHideAmount:", 0);
      v7 = v14[149];
      objc_msgSend(v14[131], "fundingSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFundingSource:", v9);

      objc_msgSend(v14[149], "setUseAppleCashBalance:", objc_msgSend(v14[131], "usesAppleCashBalance"));
      objc_msgSend(v14[149], "setIsEditable:", *((unsigned __int8 *)v14 + 1224));
      objc_msgSend(v14[149], "setTitleColor:", v3);
      objc_msgSend(v2, "addObject:", v14[149]);
    }
    objc_msgSend(v14[152], "setIsEditable:", *((unsigned __int8 *)v14 + 1224));
    objc_msgSend(v14[152], "setMemoTextColor:", v3);
    v10 = v14[152];
    objc_msgSend(v14[131], "memo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRecurringPaymentMemo:", v11);

    objc_msgSend(v2, "addObject:", v14[152]);
    v12 = v14;
    v13 = v14[150];
    if (v13 && !*((_BYTE *)v14 + 1224))
    {
      objc_msgSend(v13, "setStatus:", objc_msgSend(v14[131], "status"));
      objc_msgSend(v2, "addObject:", v14[150]);
      v12 = v14;
    }
    if (v12[151])
      objc_msgSend(v2, "addObject:");
    objc_msgSend(v14, "setSections:animated:", v2, 1);
    objc_msgSend(v14, "_updateDetailSectionFooter");
    objc_msgSend(v14, "_updatePauseSectionFooter");
    objc_msgSend(v14, "_updateCancelSectionFooter");

    WeakRetained = v14;
  }

}

- (id)_composeRecipientForAddress:(id)a3
{
  id v4;
  id v5;
  void *v6;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C97298]);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAvatarView descriptorForRequiredKeys](self->_avatarView, "descriptorForRequiredKeys");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
    {
      v27[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v9);

    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C60]), "initWithContactStore:keysToFetch:", v5, v6);
    objc_msgSend(v10, "contactForHandle:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contactFormatConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C50]), "initWithConfiguration:", v15);
    if ((objc_msgSend(v16, "emailAddressIsValid:", v4) & 1) != 0)
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v4);
      v26 = v12;
      v19 = v11;
      v20 = v10;
      v21 = v8;
      v22 = v6;
      v23 = v5;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "phoneNumberIsValid:forCountryCode:", v24, 0))
        v17 = 1;
      else
        v17 = 5;

      v5 = v23;
      v6 = v22;
      v8 = v21;
      v10 = v20;
      v11 = v19;
      v12 = v26;
    }
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13688]), "initWithContact:address:kind:", v11, v4, v17);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)_configureAvatarView
{
  id v3;
  id v4;

  -[CNComposeRecipient contact](self->_recipient, "contact");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKAvatarView setShowsName:](self->_avatarView, "setShowsName:", self->_mode == 2);
    -[PKAvatarView setContact:](self->_avatarView, "setContact:", v4);
  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(v3, "setContactType:", 0);
    -[PKAvatarView setContact:](self->_avatarView, "setContact:", v3);

  }
}

- (void)_setUpNavigationBar
{
  void *v3;
  id v4;

  -[PKPeerPaymentRecurringPaymentDetailViewController navigationItem](self, "navigationItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackButtonDisplayMode:", 2);
  if (self->_context != 9)
  {
    -[PKPeerPaymentRecurringPaymentDetailViewController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitleView:", self->_avatarView);

  }
  -[PKPeerPaymentRecurringPaymentDetailViewController _updateBarButtonItems](self, "_updateBarButtonItems");

}

- (void)_updateBarButtonItems
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __74__PKPeerPaymentRecurringPaymentDetailViewController__updateBarButtonItems__block_invoke;
  v2[3] = &unk_1E3E61310;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __74__PKPeerPaymentRecurringPaymentDetailViewController__updateBarButtonItems__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_33;
  v20 = WeakRetained;
  if (!*((_BYTE *)WeakRetained + 1113))
  {
    v7 = WeakRetained[156];
    if (v7 != (id)2)
    {
      if (v7 == (id)1)
      {
        PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_PAYMENT_SEND"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20[148], "amount");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "amount");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = v9 && objc_msgSend(v20[154], "compare:", v9) != 1 && objc_msgSend(v20[155], "compare:", v9) != -1;
        if (*((_BYTE *)v20 + 1225))
        {
          v13 = objc_alloc(MEMORY[0x1E0DC34F0]);
          PKLocalizedString(CFSTR("CANCEL"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = (void *)objc_msgSend(v13, "initWithTitle:style:target:action:", v14, 0, v20, sel__dismissViewController_);

        }
        else
        {
          v5 = 0;
        }
        v12 = 2;
        goto LABEL_25;
      }
LABEL_10:
      v5 = 0;
      v3 = 0;
      v6 = 0;
      v4 = 1;
      goto LABEL_29;
    }
    if ((PKIsVision() & 1) != 0)
      goto LABEL_10;
    if (*((_BYTE *)v20 + 1224))
    {
      PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_PAYMENT_DONE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PKLocalizedString(CFSTR("CANCEL"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v10, "initWithTitle:style:target:action:", v11, 0, v20, sel__cancelEdits_);
      v12 = 2;
    }
    else
    {
      PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_PAYMENT_EDIT"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v20;
      if (!*((_BYTE *)v20 + 1225))
      {
        v12 = 0;
        v5 = 0;
        goto LABEL_21;
      }
      v16 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PKLocalizedString(CFSTR("CANCEL"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v16, "initWithTitle:style:target:action:", v11, 0, v20, sel__dismissViewController_);
      v12 = 0;
    }

    v15 = v20;
LABEL_21:
    objc_msgSend(v15[148], "amount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "amount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v9 && objc_msgSend(v20[154], "compare:", v9) != 1 && objc_msgSend(v20[155], "compare:", v9) != -1;
LABEL_25:

    if (v6 && objc_msgSend(v20[131], "status") != 2)
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v6, v12, v20, sel__rightBarButtonPressed_);
    else
      v3 = 0;
    goto LABEL_29;
  }
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v2, "startAnimating");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v2);

  v4 = 0;
  v5 = 0;
  v6 = 0;
LABEL_29:
  objc_msgSend(v3, "setEnabled:", v4);
  objc_msgSend(v20, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setRightBarButtonItem:", v3);
  if (v5)
    v19 = v5;
  else
    v19 = 0;
  objc_msgSend(v18, "setLeftBarButtonItem:", v19);
  objc_msgSend(v18, "setHidesBackButton:", v5 != 0);

  WeakRetained = v20;
LABEL_33:

}

- (void)_updateDetailSectionFooter
{
  void *v3;
  void *v4;
  int v5;
  PKPeerPaymentRecurringPaymentDetailSectionController *detailSectionController;
  NSString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD block[4];
  id v16;
  id location;

  objc_initWeak(&location, self);
  if (self->_mode == 1)
  {
    -[PKPeerPaymentRecurringPaymentDetailSectionController startDate](self->_detailSectionController, "startDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDateInToday:", v3);

    detailSectionController = self->_detailSectionController;
    if (v5)
    {
      switch(-[PKPeerPaymentRecurringPaymentDetailSectionController frequency](detailSectionController, "frequency"))
      {
        case 1uLL:
        case 2uLL:
          goto LABEL_4;
        case 3uLL:
          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "component:fromDate:", 16, v3);

          PKOrdinalStringForInteger();
          v7 = (NSString *)objc_claimAutoreleasedReturnValue();
          PKMediumDateString();
          if (v12 > 28)
          {
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedPeerPaymentRecurringString(CFSTR("CREATE_FREQUENCY_TODAY_MONTHLY_FOOTER_TEXT_END_OF_MONTH"), CFSTR("%@,%@"), v7, v8);
          }
          else
          {
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedPeerPaymentRecurringString(CFSTR("CREATE_FREQUENCY_TODAY_MONTHLY_FOOTER_TEXT"), CFSTR("%@,%@"), v7, v8);
          }
          goto LABEL_10;
        case 4uLL:
          PKLocalizedPeerPaymentRecurringString(CFSTR("CREATE_FREQUENCY_TODAY_DAILY_FOOTER_TEXT"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        default:
          goto LABEL_7;
      }
    }
    else
    {
      switch(-[PKPeerPaymentRecurringPaymentDetailSectionController frequency](detailSectionController, "frequency"))
      {
        case 1uLL:
        case 2uLL:
LABEL_4:
          PKLocalizedWeekdaySpecificStringKeyForKey();
          v7 = (NSString *)objc_claimAutoreleasedReturnValue();
          PKMediumDateString();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPeerPaymentRecurringString(v7, CFSTR("%@"), v8);
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        case 3uLL:
          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "component:fromDate:", 16, v3);

          PKOrdinalStringForInteger();
          v7 = (NSString *)objc_claimAutoreleasedReturnValue();
          PKMediumDateString();
          if (v14 > 28)
          {
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedPeerPaymentRecurringString(CFSTR("CREATE_FREQUENCY_MONTHLY_FOOTER_TEXT_END_OF_MONTH"), CFSTR("%@,%@"), v7, v8);
          }
          else
          {
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedPeerPaymentRecurringString(CFSTR("CREATE_FREQUENCY_MONTHLY_FOOTER_TEXT"), CFSTR("%@,%@"), v7, v8);
          }
LABEL_10:
          v9 = objc_claimAutoreleasedReturnValue();
LABEL_17:
          v10 = (void *)v9;

          goto LABEL_18;
        case 4uLL:
          PKMediumDateString();
          v7 = (NSString *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPeerPaymentRecurringString(CFSTR("CREATE_FREQUENCY_DAILY_FOOTER_TEXT"), CFSTR("%@"), v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

          break;
        default:
LABEL_7:
          v10 = 0;
          break;
      }
    }

  }
  else
  {
    v10 = 0;
  }
  -[PKDynamicListSectionController setFooterText:](self->_detailSectionController, "setFooterText:", v10);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PKPeerPaymentRecurringPaymentDetailViewController__updateDetailSectionFooter__block_invoke;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v16, &location);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

void __79__PKPeerPaymentRecurringPaymentDetailViewController__updateDetailSectionFooter__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[148], "identifiers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reconfigureHeaderAndFooterForSectionIdentifier:", v3);

    WeakRetained = v4;
  }

}

- (void)_updatePauseSectionFooter
{
  void *v3;
  void *v4;
  _QWORD block[4];
  id v6;
  id location;

  if (self->_pauseSectionController)
  {
    objc_initWeak(&location, self);
    if (-[PKPeerPaymentRecurringPayment status](self->_recurringPayment, "status") == 2)
    {
      -[PKPeerPaymentRecurringPaymentDetailViewController _recipientName](self, "_recipientName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentRecurringString(CFSTR("PAUSE_SECTION_FOOTER"), CFSTR("%@"), v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
    -[PKDynamicListSectionController setFooterText:](self->_pauseSectionController, "setFooterText:", v4);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__PKPeerPaymentRecurringPaymentDetailViewController__updatePauseSectionFooter__block_invoke;
    block[3] = &unk_1E3E61310;
    objc_copyWeak(&v6, &location);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v6);

    objc_destroyWeak(&location);
  }
}

void __78__PKPeerPaymentRecurringPaymentDetailViewController__updatePauseSectionFooter__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "reloadDataForSection:animated:", WeakRetained[150], 1);
    objc_msgSend(v4[150], "identifiers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reconfigureHeaderAndFooterForSectionIdentifier:", v3);

    WeakRetained = v4;
  }

}

- (void)_updateCancelSectionFooter
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (self->_cancelSectionController)
  {
    objc_initWeak(&location, self);
    if (-[PKPeerPaymentRecurringPayment status](self->_recurringPayment, "status") == 1)
    {
      PKLocalizedPeerPaymentRecurringString(CFSTR("CANCEL_SECTION_FOOTER"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
    -[PKDynamicListSectionController setFooterText:](self->_cancelSectionController, "setFooterText:", v3);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __79__PKPeerPaymentRecurringPaymentDetailViewController__updateCancelSectionFooter__block_invoke;
    v4[3] = &unk_1E3E61310;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v4);
    objc_destroyWeak(&v5);

    objc_destroyWeak(&location);
  }
}

void __79__PKPeerPaymentRecurringPaymentDetailViewController__updateCancelSectionFooter__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[151], "identifiers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reconfigureHeaderAndFooterForSectionIdentifier:", v3);

    WeakRetained = v4;
  }

}

- (void)_cancelEdits:(id)a3
{
  id v4;
  PKPeerPaymentService *peerPaymentService;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  self->_allowEdits = 0;
  objc_initWeak(&location, self);
  peerPaymentService = self->_peerPaymentService;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PKPeerPaymentRecurringPaymentDetailViewController__cancelEdits___block_invoke;
  v6[3] = &unk_1E3E61BE0;
  objc_copyWeak(&v7, &location);
  -[PKPeerPaymentService recurringPaymentsWithCompletion:](peerPaymentService, "recurringPaymentsWithCompletion:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __66__PKPeerPaymentRecurringPaymentDetailViewController__cancelEdits___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_reloadWithPayments:", v5);

}

- (void)_dismissViewController:(id)a3
{
  id v3;

  -[PKPeerPaymentRecurringPaymentDetailViewController presentingViewController](self, "presentingViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_rightBarButtonPressed:(id)a3
{
  id v4;
  unint64_t mode;
  id WeakRetained;
  void *v7;
  id v8;
  char v9;
  PKPeerPaymentRecurringPayment *v10;
  PKPeerPaymentRecurringPayment *recurringPayment;
  id v12;
  PKPeerPaymentRecurringPayment *v13;
  id *v14;
  uint64_t v15;
  void (**v16)(_QWORD);
  void *v17;
  PKPeerPaymentRemoteMessagesComposer *remoteMessagesComposer;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  void (**v23)(_QWORD);
  _QWORD aBlock[5];
  _QWORD v25[4];
  id v26;
  id location;

  v4 = a3;
  if (self->_performingAction)
    goto LABEL_2;
  -[PKPeerPaymentRecurringPaymentDetailViewController setShowActivityIndicator:](self, "setShowActivityIndicator:", 1);
  self->_performingAction = 1;
  mode = self->_mode;
  if (mode == 2)
  {
    objc_initWeak(&location, self);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke_6;
    v20[3] = &unk_1E3E61C58;
    objc_copyWeak(&v21, &location);
    -[PKPeerPaymentRecurringPaymentDetailViewController _processEditsIfNeededWithCompletion:](self, "_processEditsIfNeededWithCompletion:", v20);
    v14 = &v21;
    goto LABEL_10;
  }
  if (mode != 1)
  {
    self->_performingAction = 0;
    -[PKPeerPaymentRecurringPaymentDetailViewController setShowActivityIndicator:](self, "setShowActivityIndicator:", 0);
    goto LABEL_2;
  }
  if (self->_context == 9)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!WeakRetained)
      goto LABEL_2;
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0)
      goto LABEL_2;
    objc_initWeak(&location, self);
    -[PKPeerPaymentRecurringPaymentDetailViewController _pendingRecurringPayment](self, "_pendingRecurringPayment");
    v10 = (PKPeerPaymentRecurringPayment *)objc_claimAutoreleasedReturnValue();
    recurringPayment = self->_recurringPayment;
    self->_recurringPayment = v10;

    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    v13 = self->_recurringPayment;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke;
    v25[3] = &unk_1E3E61310;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v12, "stageRecurringPayment:completion:", v13, v25);

    v14 = &v26;
LABEL_10:
    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
    goto LABEL_2;
  }
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke_2;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = self;
  v16 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[PKPeerPaymentController recipient](self->_peerPaymentController, "recipient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v16[2](v16);
  }
  else
  {
    remoteMessagesComposer = self->_remoteMessagesComposer;
    -[CNComposeRecipient address](self->_recipient, "address");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke_5;
    v22[3] = &unk_1E3E614F0;
    v23 = v16;
    -[PKPeerPaymentRemoteMessagesComposer validateRecipientWithAddress:completion:](remoteMessagesComposer, "validateRecipientWithAddress:completion:", v19, v22);

  }
LABEL_2:

}

void __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1112] = 0;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setShowActivityIndicator:", 0);
    WeakRetained = v2;
  }

}

void __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_pendingRecurringPayment");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1048);
  *(_QWORD *)(v3 + 1048) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 1096);
  v7 = *(_QWORD *)(v5 + 1048);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke_3;
  v8[3] = &unk_1E3E61C58;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v6, "presentRemoteMessageComposerWithRecurringPayment:overViewController:completion:", v7, v5, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke_3(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke_4;
  v3[3] = &unk_1E3E61C08;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

void __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke_4(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  _BYTE *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(WeakRetained, "_didCompleteSetupFlow");
    }
    else
    {
      objc_msgSend(WeakRetained, "presentingViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

    }
    v4[1112] = 0;
    objc_msgSend(v4, "setShowActivityIndicator:", 0);
    WeakRetained = v4;
  }

}

uint64_t __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke_5(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke_6(uint64_t a1, int a2)
{
  _BYTE *WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (a2)
    {
      WeakRetained[1224] ^= 1u;
      objc_msgSend(WeakRetained, "_updateSections");
      objc_msgSend(v4, "_updateBarButtonItems");
      WeakRetained = v4;
    }
    WeakRetained[1112] = 0;
    objc_msgSend(v4, "setShowActivityIndicator:", 0);
    WeakRetained = v4;
  }

}

- (void)_processEditsIfNeededWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  id *v27;
  id *v28;
  char v29;
  id v30;
  _QWORD v31[5];
  void (**v32)(_QWORD, _QWORD);
  id v33;
  _QWORD v34[6];
  void (**v35)(_QWORD, _QWORD);
  id v36;
  id location;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->_allowEdits)
  {
    objc_initWeak(&location, self);
    -[PKPeerPaymentRecurringPaymentDetailViewController _pendingRecurringPayment](self, "_pendingRecurringPayment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPayment memo](self->_recurringPayment, "memo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v30 = v7;
    else
      v30 = objc_alloc_init(MEMORY[0x1E0D67458]);

    -[PKPeerPaymentRecurringPayment fundingSource](self->_recurringPayment, "fundingSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fpanIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fundingSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fpanIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    v14 = v12;
    v15 = v14;
    if (v13 == v14)
    {

    }
    else
    {
      if (!v13 || !v14)
      {

LABEL_15:
        v18 = 1;
LABEL_16:

        -[PKPeerPaymentRecurringPayment amount](self->_recurringPayment, "amount");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "amount");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v19, "compare:", v20))
        {
          -[PKPeerPaymentRecurringPayment upcomingPaymentDates](self->_recurringPayment, "upcomingPaymentDates");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "firstObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "startDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (PKEqualObjects())
          {
            v24 = -[PKPeerPaymentRecurringPayment frequency](self->_recurringPayment, "frequency");
            if (v24 == objc_msgSend(v6, "frequency"))
            {
              objc_msgSend(v6, "memo");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = PKEqualObjects();

              if ((v29 & 1) != 0)
              {
                if (!v18)
                {
                  if (v5)
                    v5[2](v5, 1);
                  goto LABEL_26;
                }
                v31[0] = MEMORY[0x1E0C809B0];
                v31[1] = 3221225472;
                v31[2] = __89__PKPeerPaymentRecurringPaymentDetailViewController__processEditsIfNeededWithCompletion___block_invoke_4;
                v31[3] = &unk_1E3E61968;
                v26 = v31;
                v27 = &v33;
                objc_copyWeak(&v33, &location);
                v32 = v5;
                v31[4] = v6;
                -[PKPeerPaymentRecurringPaymentDetailViewController _validatePaymentEditsWithCompletion:](self, "_validatePaymentEditsWithCompletion:", v31);
                v28 = (id *)&v32;
LABEL_25:

                objc_destroyWeak(v27);
LABEL_26:

                objc_destroyWeak(&location);
                goto LABEL_27;
              }
LABEL_24:
              v34[0] = MEMORY[0x1E0C809B0];
              v34[1] = 3221225472;
              v34[2] = __89__PKPeerPaymentRecurringPaymentDetailViewController__processEditsIfNeededWithCompletion___block_invoke;
              v34[3] = &unk_1E3E61990;
              v26 = v34;
              v27 = &v36;
              objc_copyWeak(&v36, &location);
              v35 = v5;
              v34[4] = v6;
              v34[5] = self;
              -[PKPeerPaymentRecurringPaymentDetailViewController _validatePaymentEditsWithCompletion:](self, "_validatePaymentEditsWithCompletion:", v34);
              v28 = (id *)&v35;
              goto LABEL_25;
            }
          }

        }
        goto LABEL_24;
      }
      v16 = objc_msgSend(v13, "isEqualToString:", v14);

      if (!v16)
        goto LABEL_15;
    }
    v17 = -[PKPeerPaymentRecurringPayment usesAppleCashBalance](self->_recurringPayment, "usesAppleCashBalance");
    v18 = v17 ^ objc_msgSend(v6, "usesAppleCashBalance");
    goto LABEL_16;
  }
  if (v4)
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
LABEL_27:

}

void __89__PKPeerPaymentRecurringPaymentDetailViewController__processEditsIfNeededWithCompletion___block_invoke(uint64_t a1, char a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v4 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && (a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "fundingSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fpanIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1072), "primaryAccountIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    if (v9 == v10)
    {

    }
    else
    {
      v11 = v10;
      if (v9 && v10)
      {
        v12 = objc_msgSend(v9, "isEqualToString:", v10);

        if ((v12 & 1) != 0)
          goto LABEL_14;
      }
      else
      {

      }
      v14 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0D67450], "fundingSourceWithPass:", *((_QWORD *)WeakRetained + 134));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFundingSource:", v6);
    }

LABEL_14:
    objc_msgSend(*((id *)WeakRetained + 136), "updatePreservePeerPaymentBalanceSetting:", objc_msgSend(*(id *)(a1 + 32), "usesAppleCashBalance") ^ 1);
    v15 = (void *)*((_QWORD *)WeakRetained + 137);
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __89__PKPeerPaymentRecurringPaymentDetailViewController__processEditsIfNeededWithCompletion___block_invoke_2;
    v18[3] = &unk_1E3E61968;
    objc_copyWeak(&v21, v4);
    v20 = *(id *)(a1 + 48);
    v19 = *(id *)(a1 + 32);
    objc_msgSend(v15, "presentRemoteMessageComposerWithRecurringPayment:overViewController:completion:", v16, v17, v18);

    objc_destroyWeak(&v21);
    goto LABEL_15;
  }
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);
LABEL_15:

}

void __89__PKPeerPaymentRecurringPaymentDetailViewController__processEditsIfNeededWithCompletion___block_invoke_2(id *a1, int a2)
{
  id *v4;
  id *WeakRetained;
  id *v6;
  void (**v7)(id, _QWORD);
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v4 = a1 + 6;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
      objc_storeStrong(WeakRetained + 131, a1[4]);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__PKPeerPaymentRecurringPaymentDetailViewController__processEditsIfNeededWithCompletion___block_invoke_3;
    block[3] = &unk_1E3E61940;
    objc_copyWeak(&v10, v4);
    v9 = a1[5];
    v11 = a2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v10);
  }
  else
  {
    v7 = (void (**)(id, _QWORD))a1[5];
    if (v7)
      v7[2](v7, 0);
  }

}

void __89__PKPeerPaymentRecurringPaymentDetailViewController__processEditsIfNeededWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

    v3 = v6;
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(unsigned __int8 *)(a1 + 48));
      v3 = v6;
    }
  }

}

void __89__PKPeerPaymentRecurringPaymentDetailViewController__processEditsIfNeededWithCompletion___block_invoke_4(id *a1, char a2)
{
  id *v4;
  id WeakRetained;
  void (**v6)(id, _QWORD);
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v4 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && (a2 & 1) != 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __89__PKPeerPaymentRecurringPaymentDetailViewController__processEditsIfNeededWithCompletion___block_invoke_5;
    v7[3] = &unk_1E3E61968;
    objc_copyWeak(&v10, v4);
    v9 = a1[5];
    v8 = a1[4];
    objc_msgSend(WeakRetained, "_authorizeRecurringPaymentWithCompletion:", v7);

    objc_destroyWeak(&v10);
  }
  else
  {
    v6 = (void (**)(id, _QWORD))a1[5];
    if (v6)
      v6[2](v6, 0);
  }

}

void __89__PKPeerPaymentRecurringPaymentDetailViewController__processEditsIfNeededWithCompletion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id *v5;
  uint64_t v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  v7 = WeakRetained;
  if (WeakRetained && (_DWORD)a2)
  {
    objc_storeStrong(WeakRetained + 131, *(id *)(a1 + 32));
    v5 = v7;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id *))(v6 + 16))(v6, a2, v5);
    v5 = v7;
  }

}

- (void)_validatePaymentEditsWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  __CFString *v12;
  int IsBridge;
  void *v14;
  NSString *v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  __CFString *v30;
  void *v31;
  _QWORD block[4];
  id v33;
  id v34;
  id location;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  PKPeerPaymentRecurringPaymentDetailViewController *v40;
  id v41;
  id v42;
  _QWORD aBlock[5];
  id v44;

  v4 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKPeerPaymentRecurringPaymentDetailViewController__validatePaymentEditsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E3E61850;
  aBlock[4] = self;
  v5 = v4;
  v44 = v5;
  v6 = _Block_copy(aBlock);
  v7 = v6;
  if (self->_selectedPass)
  {
    (*((void (**)(void *))v6 + 2))(v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_defaultPaymentPassForPaymentRequest:", self->_paymentRequest);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKPeerPaymentRecurringPayment status](self->_recurringPayment, "status");
    v10 = CFSTR("DEBIT_CARD_REQUIRED_MESSAGE_EDIT_SELECT_CARD");
    if (!v8)
      v10 = CFSTR("DEBIT_CARD_REQUIRED_MESSAGE_EDIT_NO_CARDS");
    v11 = CFSTR("DEBIT_CARD_REQUIRED_MESSAGE_RESUME_SELECT_CARD");
    if (v8)
    {
      v12 = CFSTR("DEBIT_CARD_REQUIRED_ACTION_CONTINUE");
    }
    else
    {
      v11 = CFSTR("DEBIT_CARD_REQUIRED_MESSAGE_RESUME_NO_CARDS");
      v12 = CFSTR("DEBIT_CARD_REQUIRED_ACTION_ADD_CARD");
    }
    if (v9 == 2)
      v10 = (__CFString *)v11;
    v30 = v10;
    IsBridge = PKPaymentSetupContextIsBridge();
    v14 = (void *)MEMORY[0x1E0DC3450];
    v15 = v12;
    PKLocalizedPeerPaymentRecurringString(CFSTR("DEBIT_CARD_REQUIRED_TITLE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKDeviceSpecificLocalizedStringKeyForKey(v30, IsBridge);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentRecurringString(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", v16, v18, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPeerPaymentRecurringString(v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __89__PKPeerPaymentRecurringPaymentDetailViewController__validatePaymentEditsWithCompletion___block_invoke_3;
    v38[3] = &unk_1E3E619B8;
    v39 = v8;
    v40 = self;
    v41 = v7;
    v23 = v5;
    v42 = v23;
    v24 = v8;
    objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, v38);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPeerPaymentRecurringString(CFSTR("DEBIT_CARD_REQUIRED_ACTION_CANCEL"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v22;
    v36[1] = 3221225472;
    v36[2] = __89__PKPeerPaymentRecurringPaymentDetailViewController__validatePaymentEditsWithCompletion___block_invoke_4;
    v36[3] = &unk_1E3E61CA8;
    v37 = v23;
    objc_msgSend(v26, "actionWithTitle:style:handler:", v27, 1, v36);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "addAction:", v25);
    objc_msgSend(v19, "addAction:", v28);
    objc_msgSend(v19, "setPreferredAction:", v25);
    objc_initWeak(&location, self);
    block[0] = v22;
    block[1] = 3221225472;
    block[2] = __89__PKPeerPaymentRecurringPaymentDetailViewController__validatePaymentEditsWithCompletion___block_invoke_5;
    block[3] = &unk_1E3E61B68;
    objc_copyWeak(&v34, &location);
    v33 = v19;
    v29 = v19;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);

  }
}

void __89__PKPeerPaymentRecurringPaymentDetailViewController__validatePaymentEditsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1096);
  objc_msgSend(*(id *)(v2 + 1064), "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89__PKPeerPaymentRecurringPaymentDetailViewController__validatePaymentEditsWithCompletion___block_invoke_2;
  v5[3] = &unk_1E3E614F0;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "validateRecipientWithAddress:completion:", v4, v5);

}

uint64_t __89__PKPeerPaymentRecurringPaymentDetailViewController__validatePaymentEditsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __89__PKPeerPaymentRecurringPaymentDetailViewController__validatePaymentEditsWithCompletion___block_invoke_3(_QWORD *a1)
{
  id *v2;
  void *v3;
  uint64_t result;

  v3 = (void *)a1[4];
  v2 = (id *)a1[5];
  if (v3)
  {
    objc_storeStrong(v2 + 134, v3);
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
  else
  {
    objc_msgSend(v2, "_openPaymentSetupWithNetworkWhitelist:paymentSetupMode:", 0, 0);
    result = a1[7];
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __89__PKPeerPaymentRecurringPaymentDetailViewController__validatePaymentEditsWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __89__PKPeerPaymentRecurringPaymentDetailViewController__validatePaymentEditsWithCompletion___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);
    WeakRetained = v3;
  }

}

- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 paymentSetupMode:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = objc_alloc(MEMORY[0x1E0D67230]);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithWebService:", v8);

  objc_msgSend(v9, "setAllowedPaymentNetworks:", v6);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  objc_msgSend(v9, "setAllowedFeatureIdentifiers:", v10);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __108__PKPeerPaymentRecurringPaymentDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke;
  v12[3] = &unk_1E3E61A30;
  objc_copyWeak(v14, &location);
  v11 = v9;
  v13 = v11;
  v14[1] = (id)a4;
  objc_msgSend(v11, "preflightWithCompletion:", v12);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

}

void __108__PKPeerPaymentRecurringPaymentDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11[2];
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108__PKPeerPaymentRecurringPaymentDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2;
  block[3] = &unk_1E3E61A08;
  objc_copyWeak(v11, a1 + 5);
  v12 = a2;
  v6 = a1[4];
  v11[1] = a1[6];
  v9 = v6;
  v10 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v11);
}

void __108__PKPeerPaymentRecurringPaymentDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(WeakRetained, "_paymentSetupNavigationControllerForProvisioningController:", *(_QWORD *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPaymentSetupMode:", *(_QWORD *)(a1 + 56));
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __108__PKPeerPaymentRecurringPaymentDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3;
      v10[3] = &unk_1E3E619E0;
      v10[4] = v3;
      v11 = v4;
      v5 = v4;
      objc_msgSend(v5, "preflightWithCompletion:", v10);

    }
    else
    {
      v6 = *(void **)(a1 + 40);
      if (v6)
      {
        v7 = v6;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = v7;
      +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:](PKPaymentSetupNavigationController, "viewControllerForPresentingPaymentError:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);

    }
  }

}

void __108__PKPeerPaymentRecurringPaymentDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  id v4;
  PKPaymentSetupNavigationController *v5;

  v4 = a3;
  v5 = -[PKPaymentSetupNavigationController initWithProvisioningController:context:]([PKPaymentSetupNavigationController alloc], "initWithProvisioningController:context:", v4, self->_context);

  -[PKNavigationController setCustomFormSheetPresentationStyleForiPad](v5, "setCustomFormSheetPresentationStyleForiPad");
  -[PKPaymentSetupNavigationController setSetupDelegate:](v5, "setSetupDelegate:", self);
  -[PKPaymentSetupNavigationController setShowsWelcomeViewController:](v5, "setShowsWelcomeViewController:", 0);
  return v5;
}

- (void)paymentSetupDidFinish:(id)a3
{
  id v3;

  -[PKPeerPaymentRecurringPaymentDetailViewController navigationController](self, "navigationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_authorizeRecurringPaymentWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  PKPeerPaymentController *peerPaymentController;
  PKPaymentPass *selectedPass;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  -[PKPeerPaymentRecurringPaymentDetailSectionController amount](self->_detailSectionController, "amount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = -[PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController useAppleCashBalance](self->_fundingSourceSectionController, "useAppleCashBalance");
  if (v6)
    v7 = 2;
  else
    v7 = 1;
  -[PKPeerPaymentController updatePreservePeerPaymentBalanceSetting:](self->_peerPaymentController, "updatePreservePeerPaymentBalanceSetting:", !v6);
  -[PKPeerPaymentController selectMode:](self->_peerPaymentController, "selectMode:", 1);
  peerPaymentController = self->_peerPaymentController;
  selectedPass = self->_selectedPass;
  -[PKPeerPaymentRecurringPayment identifier](self->_recurringPayment, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PKPeerPaymentRecurringPaymentDetailSectionController frequency](self->_detailSectionController, "frequency");
  -[PKPeerPaymentRecurringPaymentDetailSectionController startDate](self->_detailSectionController, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __94__PKPeerPaymentRecurringPaymentDetailViewController__authorizeRecurringPaymentWithCompletion___block_invoke;
  v14[3] = &unk_1E3E61AA8;
  objc_copyWeak(&v16, &location);
  v13 = v4;
  v15 = v13;
  -[PKPeerPaymentController quoteWithAmount:source:requestToken:alternateFundingSource:preserveCurrentBalance:recurringPaymentIdentifier:frequency:startDate:threshold:completion:](peerPaymentController, "quoteWithAmount:source:requestToken:alternateFundingSource:preserveCurrentBalance:recurringPaymentIdentifier:frequency:startDate:threshold:completion:", v5, 3, 0, selectedPass, v7, v10, v11, v12, 0, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __94__PKPeerPaymentRecurringPaymentDetailViewController__authorizeRecurringPaymentWithCompletion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _QWORD *WeakRetained;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  char v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (a2)
    {
      PKLogFacilityTypeGetObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentRecurringPaymentDetailViewController: quoteWithAmount successful", buf, 2u);
      }

      v11 = (void *)WeakRetained[136];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __94__PKPeerPaymentRecurringPaymentDetailViewController__authorizeRecurringPaymentWithCompletion___block_invoke_132;
      v16[3] = &unk_1E3E61A80;
      objc_copyWeak(&v18, (id *)(a1 + 40));
      v17 = *(id *)(a1 + 32);
      objc_msgSend(v11, "performQuote:completion:", v7, v16);

      objc_destroyWeak(&v18);
    }
    else
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __94__PKPeerPaymentRecurringPaymentDetailViewController__authorizeRecurringPaymentWithCompletion___block_invoke_2;
      v13[3] = &unk_1E3E61A58;
      v14 = *(id *)(a1 + 32);
      v15 = 0;
      objc_msgSend(WeakRetained, "_showAlertForError:completion:", v8, v13);

    }
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);
  }

}

void __94__PKPeerPaymentRecurringPaymentDetailViewController__authorizeRecurringPaymentWithCompletion___block_invoke_132(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id WeakRetained;
  uint64_t v11;
  void (*v12)(void);
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  char v16;
  uint8_t buf[4];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v18 = a2;
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentRecurringPaymentDetailViewController: performQuote completed with success: %d", buf, 8u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (a2)
    {
      v11 = *(_QWORD *)(a1 + 32);
      if (v11)
      {
        v12 = *(void (**)(void))(v11 + 16);
LABEL_11:
        v12();
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if (v8)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __94__PKPeerPaymentRecurringPaymentDetailViewController__authorizeRecurringPaymentWithCompletion___block_invoke_133;
      v14[3] = &unk_1E3E61A58;
      v15 = *(id *)(a1 + 32);
      v16 = 0;
      objc_msgSend(WeakRetained, "_showAlertForError:completion:", v8, v14);

      goto LABEL_12;
    }
  }
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
  {
    v12 = *(void (**)(void))(v13 + 16);
    goto LABEL_11;
  }
LABEL_12:

}

uint64_t __94__PKPeerPaymentRecurringPaymentDetailViewController__authorizeRecurringPaymentWithCompletion___block_invoke_133(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

uint64_t __94__PKPeerPaymentRecurringPaymentDetailViewController__authorizeRecurringPaymentWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (void)_showConfirmationAlertIfNeededForAction:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  id location;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;

  v6 = a4;
  if (a3 == 2)
  {
    v22 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedPeerPaymentRecurringString(CFSTR("CANCEL_ALERT_TITLE"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPaymentDetailViewController _recipientName](self, "_recipientName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentRecurringString(CFSTR("CANCEL_ALERT_MESSAGE"), CFSTR("%@"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "alertControllerWithTitle:message:preferredStyle:", v23, v25, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPeerPaymentRecurringString(CFSTR("CANCEL_ALERT_CONFIRM"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __104__PKPeerPaymentRecurringPaymentDetailViewController__showConfirmationAlertIfNeededForAction_completion___block_invoke_3;
    v39[3] = &unk_1E3E61CA8;
    v15 = &v40;
    v29 = v6;
    v40 = v29;
    objc_msgSend(v26, "actionWithTitle:style:handler:", v27, 2, v39);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPeerPaymentRecurringString(CFSTR("CANCEL_ALERT_CANCEL"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v28;
    v37[1] = 3221225472;
    v37[2] = __104__PKPeerPaymentRecurringPaymentDetailViewController__showConfirmationAlertIfNeededForAction_completion___block_invoke_4;
    v37[3] = &unk_1E3E61CA8;
    v20 = &v38;
    v38 = v29;
    objc_msgSend(v30, "actionWithTitle:style:handler:", v31, 1, v37);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addAction:", v17);
    objc_msgSend(v11, "addAction:", v21);
  }
  else
  {
    if (a3 != 1 || -[PKPeerPaymentRecurringPayment status](self->_recurringPayment, "status") != 1)
      goto LABEL_8;
    v7 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedPeerPaymentRecurringString(CFSTR("PAUSE_ALERT_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPaymentDetailViewController _recipientName](self, "_recipientName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentRecurringString(CFSTR("PAUSE_ALERT_MESSAGE"), CFSTR("%@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPeerPaymentRecurringString(CFSTR("PAUSE_ALERT_CONFIRM"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __104__PKPeerPaymentRecurringPaymentDetailViewController__showConfirmationAlertIfNeededForAction_completion___block_invoke;
    v43[3] = &unk_1E3E61CA8;
    v15 = &v44;
    v16 = v6;
    v44 = v16;
    objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v43);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPeerPaymentRecurringString(CFSTR("PAUSE_ALERT_CANCEL"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v14;
    v41[1] = 3221225472;
    v41[2] = __104__PKPeerPaymentRecurringPaymentDetailViewController__showConfirmationAlertIfNeededForAction_completion___block_invoke_2;
    v41[3] = &unk_1E3E61CA8;
    v20 = &v42;
    v42 = v16;
    objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 1, v41);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addAction:", v17);
    objc_msgSend(v11, "addAction:", v21);
    objc_msgSend(v11, "setPreferredAction:", v17);
  }

  if (v11)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__PKPeerPaymentRecurringPaymentDetailViewController__showConfirmationAlertIfNeededForAction_completion___block_invoke_5;
    block[3] = &unk_1E3E61B68;
    objc_copyWeak(&v35, &location);
    v34 = v11;
    v32 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);

    goto LABEL_10;
  }
LABEL_8:
  if (v6)
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
LABEL_10:

}

uint64_t __104__PKPeerPaymentRecurringPaymentDetailViewController__showConfirmationAlertIfNeededForAction_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __104__PKPeerPaymentRecurringPaymentDetailViewController__showConfirmationAlertIfNeededForAction_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __104__PKPeerPaymentRecurringPaymentDetailViewController__showConfirmationAlertIfNeededForAction_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __104__PKPeerPaymentRecurringPaymentDetailViewController__showConfirmationAlertIfNeededForAction_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __104__PKPeerPaymentRecurringPaymentDetailViewController__showConfirmationAlertIfNeededForAction_completion___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);
    WeakRetained = v3;
  }

}

- (id)_recipientName
{
  void *v3;
  void *v4;

  -[CNComposeRecipient contact](self->_recipient, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "givenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[CNComposeRecipient address](self->_recipient, "address");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)_showAlertForError:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__PKPeerPaymentRecurringPaymentDetailViewController__showAlertForError_completion___block_invoke;
  v10[3] = &unk_1E3E61B90;
  objc_copyWeak(&v13, &location);
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __83__PKPeerPaymentRecurringPaymentDetailViewController__showAlertForError_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __83__PKPeerPaymentRecurringPaymentDetailViewController__showAlertForError_completion___block_invoke_2;
    v6[3] = &unk_1E3E61590;
    v3 = *(void **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, v6, 0);
    if (v4)
    {
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v4, 1, 0);
    }
    else
    {
      v5 = *(_QWORD *)(a1 + 40);
      if (v5)
        (*(void (**)(void))(v5 + 16))();
    }

  }
}

uint64_t __83__PKPeerPaymentRecurringPaymentDetailViewController__showAlertForError_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_didCompleteSetupFlow
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __74__PKPeerPaymentRecurringPaymentDetailViewController__didCompleteSetupFlow__block_invoke;
  v2[3] = &unk_1E3E61310;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __74__PKPeerPaymentRecurringPaymentDetailViewController__didCompleteSetupFlow__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "presentingViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

    WeakRetained = v3;
  }

}

- (void)_updateRecurringPaymentsWithCompletion:(id)a3
{
  id v4;
  PKPeerPaymentService *peerPaymentService;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  peerPaymentService = self->_peerPaymentService;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__PKPeerPaymentRecurringPaymentDetailViewController__updateRecurringPaymentsWithCompletion___block_invoke;
  v7[3] = &unk_1E3E61BB8;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[PKPeerPaymentService updateRecurringPaymentsWithCompletion:](peerPaymentService, "updateRecurringPaymentsWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __92__PKPeerPaymentRecurringPaymentDetailViewController__updateRecurringPaymentsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void (*v11)(void);
  uint64_t v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_6;
  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentRecurringPaymentDetailViewController: Failed to update recurring payments with error %@", (uint8_t *)&v13, 0xCu);
    }

LABEL_6:
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      v11 = *(void (**)(void))(v10 + 16);
LABEL_10:
      v11();
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  objc_msgSend(WeakRetained, "_reloadWithPayments:", v5);
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
  {
    v11 = *(void (**)(void))(v12 + 16);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)_reloadWithPayments:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id location;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_mode == 2)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v16 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPeerPaymentRecurringPayment identifier](self->_recurringPayment, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if ((v14 & 1) != 0)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v15 = v11;

      if (!v15)
        goto LABEL_14;
      v5 = v16;
      if (objc_msgSend(v15, "status"))
      {
        objc_storeStrong((id *)&self->_recurringPayment, v11);
        -[PKPeerPaymentRecurringPaymentDetailViewController _updateSections](self, "_updateSections");
        -[PKPeerPaymentRecurringPaymentDetailViewController _updateBarButtonItems](self, "_updateBarButtonItems");
        goto LABEL_16;
      }
    }
    else
    {
LABEL_10:

      v15 = 0;
LABEL_14:
      v5 = v16;
    }
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__PKPeerPaymentRecurringPaymentDetailViewController__reloadWithPayments___block_invoke;
    block[3] = &unk_1E3E61310;
    objc_copyWeak(&v18, &location);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
LABEL_16:

  }
}

void __73__PKPeerPaymentRecurringPaymentDetailViewController__reloadWithPayments___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "popViewControllerAnimated:", 1);

}

- (id)_pendingRecurringPayment
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PKPeerPaymentRecurringPayment fundingSource](self->_recurringPayment, "fundingSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_selectedPass)
  {
    objc_msgSend(MEMORY[0x1E0D67450], "fundingSourceWithPass:");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  v5 = (void *)-[PKPeerPaymentRecurringPayment copy](self->_recurringPayment, "copy");
  -[PKPeerPaymentRecurringPaymentDetailSectionController amount](self->_detailSectionController, "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "amount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAmount:", v7);

  -[PKPeerPaymentRecurringPaymentDetailSectionController startDate](self->_detailSectionController, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStartDate:", v8);

  objc_msgSend(v5, "setFrequency:", -[PKPeerPaymentRecurringPaymentDetailSectionController frequency](self->_detailSectionController, "frequency"));
  -[PKPeerPaymentRecurringPaymentMemoSectionController recurringPaymentMemo](self->_memoSectionController, "recurringPaymentMemo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMemo:", v9);

  objc_msgSend(v5, "setFundingSource:", v3);
  objc_msgSend(v5, "setUsesAppleCashBalance:", -[PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController useAppleCashBalance](self->_fundingSourceSectionController, "useAppleCashBalance"));

  return v5;
}

- (BOOL)_shouldShowDashboardMessages
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;

  v3 = -[PKPeerPaymentRecurringPayment status](self->_recurringPayment, "status");
  -[PKPeerPaymentRecurringPayment lastExecutedTransaction](self->_recurringPayment, "lastExecutedTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)(v3 - 3) <= 1 && objc_msgSend(v4, "status") == 3)
    v6 = -[PKPeerPaymentRecurringPayment lastExecutedTransactionAppearsInHistory](self->_recurringPayment, "lastExecutedTransactionAppearsInHistory") ^ 1;
  else
    LOBYTE(v6) = 0;

  return v6;
}

- (id)_dashboardMessages
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  PKDashboardPassMessage *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;

  -[PKPeerPaymentRecurringPayment lastExecutedTransaction](self->_recurringPayment, "lastExecutedTransaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "errorCode");
  objc_msgSend(v3, "executionDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v7 = objc_alloc_init(PKDashboardPassMessage);
  objc_msgSend(v3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setIdentifier:](v7, "setIdentifier:", v8);

  -[PKPeerPaymentRecurringPaymentDetailViewController _titleForErrorCode:](self, "_titleForErrorCode:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setTitle:](v7, "setTitle:", v9);

  -[PKPeerPaymentRecurringPaymentDetailViewController _messageForErrorCode:paymentDate:](self, "_messageForErrorCode:paymentDate:", v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setMessage:](v7, "setMessage:", v10);

  if (objc_msgSend(v3, "exceedsAppleCashLimits"))
  {
    PKLocalizedPeerPaymentRecurringString(CFSTR("PAYMENT_ERROR_LEARN_MORE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setButtonTitle:](v7, "setButtonTitle:", v11);

    -[PKDashboardPassMessage setActionOnButtonPress:](v7, "setActionOnButtonPress:", &__block_literal_global_1);
  }
  PKPassKitUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLForResource:withExtension:", CFSTR("MessageAlert"), CFSTR("pdf"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = PKUIScreenScale();
  PKUIImageFromPDF(v13, 45.0, 45.0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setImage:](v7, "setImage:", v15);
  objc_msgSend(v6, "addObject:", v7);
  v16 = (void *)objc_msgSend(v6, "copy");

  return v16;
}

void __71__PKPeerPaymentRecurringPaymentDetailViewController__dashboardMessages__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/en-us/HT207884"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openURL:configuration:completionHandler:", v0, 0, 0);

}

- (id)_titleForErrorCode:(unint64_t)a3
{
  __CFString *v3;

  if (a3 == 40338)
    v3 = CFSTR("PAYMENT_ERROR_PAYMENT_PAUSED_TITLE");
  else
    v3 = CFSTR("PAYMENT_ERROR_PROBLEM_WITH_PAYMENT_TITLE");
  PKLocalizedPeerPaymentRecurringString(&v3->isa);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_messageForErrorCode:(unint64_t)a3 paymentDate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v14;

  v6 = a4;
  switch(a3)
  {
    case 0x9D91uLL:
    case 0x9D99uLL:
      -[CNComposeRecipient contact](self->_recipient, "contact");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "givenName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        -[CNComposeRecipient address](self->_recipient, "address");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;

      PKMediumDayAndMonthStringFromDate();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentRecurringString(CFSTR("PAYMENT_ERROR_INVALID_RECIPIENT_MESSAGE"), CFSTR("%@%@"), v14, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    case 0x9D92uLL:
      PKLocalizedPeerPaymentRecurringString(CFSTR("PAYMENT_ERROR_CONSECUTIVE_FAILURE_LIMIT_REACHED_MESSAGE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 0x9D93uLL:
      goto LABEL_8;
    case 0x9D94uLL:
      PKMediumDayAndMonthStringFromDate();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentRecurringString(CFSTR("PAYMENT_ERROR_CARD_FRAUDULENT_MESSAGE"), CFSTR("%@"), v11);
      goto LABEL_14;
    case 0x9D95uLL:
      PKMediumDayAndMonthStringFromDate();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentRecurringString(CFSTR("PAYMENT_ERROR_RECIPIENT_PENDING_FRAUD_REVIEW_MESSAGE"), CFSTR("%@"), v11);
      goto LABEL_14;
    case 0x9D96uLL:
      PKMediumDayAndMonthStringFromDate();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentRecurringString(CFSTR("PAYMENT_ERROR_HIGH_SCAM_CONFIDENCE_MESSAGE"), CFSTR("%@"), v11);
      goto LABEL_14;
    case 0x9D97uLL:
      PKMediumDayAndMonthStringFromDate();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentRecurringString(CFSTR("PAYMENT_ERROR_GENERIC_FRAUD_MESSAGE"), CFSTR("%@"), v11);
      goto LABEL_14;
    case 0x9D98uLL:
      goto LABEL_7;
    default:
      if (a3 - 40305 >= 2)
      {
        if (a3 == 40311)
        {
LABEL_7:
          PKMediumDayAndMonthStringFromDate();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPeerPaymentRecurringString(CFSTR("PAYMENT_ERROR_CARD_DECLINED_MESSAGE"), CFSTR("%@"), v11);
        }
        else
        {
LABEL_8:
          PKMediumDayAndMonthStringFromDate();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPeerPaymentRecurringString(CFSTR("PAYMENT_ERROR_GENERIC_FAILURE_MESSAGE"), CFSTR("%@"), v11);
        }
      }
      else
      {
        PKMediumDayAndMonthStringFromDate();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentRecurringString(CFSTR("PAYMENT_ERROR_SENDER_CUMULATIVE_LIMIT_REACHED_MESSAGE"), CFSTR("%@"), v11);
      }
LABEL_14:
      v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

LABEL_16:
      return v12;
  }
}

- (void)makeCellFirstResponderWithItem:(id)a3
{
  id v3;

  -[PKDynamicCollectionViewController cellForItem:](self, "cellForItem:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "canBecomeFirstResponder"))
    objc_msgSend(v3, "becomeFirstResponder");

}

- (void)updateFooterForSectionIdentifier:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a3;
  -[PKPeerPaymentRecurringPaymentDetailSectionController identifiers](self->_detailSectionController, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v13, "isEqualToString:", v5);

  if (v6)
  {
    -[PKPeerPaymentRecurringPaymentDetailViewController _updateDetailSectionFooter](self, "_updateDetailSectionFooter");
  }
  else
  {
    -[PKPeerPaymentRecurringPaymentDetailActionSectionController identifiers](self->_pauseSectionController, "identifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v13, "isEqualToString:", v8);

    if (v9)
    {
      -[PKPeerPaymentRecurringPaymentDetailViewController _updatePauseSectionFooter](self, "_updatePauseSectionFooter");
    }
    else
    {
      -[PKPeerPaymentRecurringPaymentDetailActionSectionController identifiers](self->_cancelSectionController, "identifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v13, "isEqualToString:", v11);

      if (v12)
        -[PKPeerPaymentRecurringPaymentDetailViewController _updateCancelSectionFooter](self, "_updateCancelSectionFooter");
    }
  }

}

- (void)performAction:(unint64_t)a3 startHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16[2];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (self->_performingAction)
  {
    if (v9)
      (*((void (**)(id))v9 + 2))(v9);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      PKPeerPaymentRecurringPaymentActionToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentRecurringPaymentDetailViewController: performing %@ action", buf, 0xCu);

    }
    self->_performingAction = 1;
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __91__PKPeerPaymentRecurringPaymentDetailViewController_performAction_startHandler_completion___block_invoke;
    v13[3] = &unk_1E3E61AF0;
    objc_copyWeak(v16, (id *)buf);
    v14 = v8;
    v16[1] = (id)a3;
    v15 = v10;
    -[PKPeerPaymentRecurringPaymentDetailViewController _showConfirmationAlertIfNeededForAction:completion:](self, "_showConfirmationAlertIfNeededForAction:completion:", a3, v13);

    objc_destroyWeak(v16);
    objc_destroyWeak((id *)buf);
  }

}

void __91__PKPeerPaymentRecurringPaymentDetailViewController_performAction_startHandler_completion___block_invoke(uint64_t a1, int a2)
{
  id *v4;
  _BYTE *WeakRetained;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a2)
    {
      v6 = *(_QWORD *)(a1 + 32);
      if (v6)
        (*(void (**)(void))(v6 + 16))();
      v7 = *(_QWORD *)(a1 + 56);
      if (v7 == 2)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __91__PKPeerPaymentRecurringPaymentDetailViewController_performAction_startHandler_completion___block_invoke_3;
        v11[3] = &unk_1E3E61C80;
        v8 = &v13;
        objc_copyWeak(&v13, v4);
        v12 = *(id *)(a1 + 40);
        objc_msgSend(WeakRetained, "_cancelRecurringPaymentWithCompletion:", v11);
        v9 = v12;
        goto LABEL_11;
      }
      if (v7 == 1)
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __91__PKPeerPaymentRecurringPaymentDetailViewController_performAction_startHandler_completion___block_invoke_2;
        v14[3] = &unk_1E3E61C80;
        v8 = &v16;
        objc_copyWeak(&v16, v4);
        v15 = *(id *)(a1 + 40);
        objc_msgSend(WeakRetained, "_pauseRecurringPaymentWithCompletion:", v14);
        v9 = v15;
LABEL_11:

        objc_destroyWeak(v8);
        goto LABEL_12;
      }
    }
    WeakRetained[1112] = 0;
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(void))(v10 + 16))();
  }
LABEL_12:

}

void __91__PKPeerPaymentRecurringPaymentDetailViewController_performAction_startHandler_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1112) = 0;
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      v5 = v3;
      (*(void (**)(void))(v4 + 16))();
      v3 = v5;
    }
  }

}

void __91__PKPeerPaymentRecurringPaymentDetailViewController_performAction_startHandler_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1112) = 0;
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      v5 = v3;
      (*(void (**)(void))(v4 + 16))();
      v3 = v5;
    }
  }

}

- (void)_pauseRecurringPaymentWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  PKPeerPaymentService *peerPaymentService;
  void *v6;
  id *v7;
  id *v8;
  NSObject *v9;
  PKPeerPaymentRecurringPayment *recurringPayment;
  _QWORD v11[4];
  void (**v12)(_QWORD);
  id v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  id v16;
  id location;
  uint8_t buf[4];
  PKPeerPaymentRecurringPayment *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  objc_initWeak(&location, self);
  switch(-[PKPeerPaymentRecurringPayment status](self->_recurringPayment, "status"))
  {
    case 1:
    case 3:
      peerPaymentService = self->_peerPaymentService;
      -[PKPeerPaymentRecurringPayment identifier](self->_recurringPayment, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __90__PKPeerPaymentRecurringPaymentDetailViewController__pauseRecurringPaymentWithCompletion___block_invoke;
      v14[3] = &unk_1E3E61B18;
      v7 = &v16;
      objc_copyWeak(&v16, &location);
      v15 = v4;
      -[PKPeerPaymentService performRecurringPaymentAction:identifier:completion:](peerPaymentService, "performRecurringPaymentAction:identifier:completion:", 1, v6, v14);

      v8 = (id *)&v15;
      goto LABEL_4;
    case 2:
    case 4:
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __90__PKPeerPaymentRecurringPaymentDetailViewController__pauseRecurringPaymentWithCompletion___block_invoke_2;
      v11[3] = &unk_1E3E61C30;
      v7 = &v13;
      objc_copyWeak(&v13, &location);
      v12 = v4;
      -[PKPeerPaymentRecurringPaymentDetailViewController _validatePaymentEditsWithCompletion:](self, "_validatePaymentEditsWithCompletion:", v11);
      v8 = (id *)&v12;
LABEL_4:

      objc_destroyWeak(v7);
      break;
    default:
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        recurringPayment = self->_recurringPayment;
        *(_DWORD *)buf = 138412290;
        v19 = recurringPayment;
        _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentRecurringPaymentDetailViewController: Unable to perform action, recurring payment is in an ineligible state: %@", buf, 0xCu);
      }

      if (v4)
        v4[2](v4);
      break;
  }
  objc_destroyWeak(&location);

}

void __90__PKPeerPaymentRecurringPaymentDetailViewController__pauseRecurringPaymentWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id *WeakRetained;
  id *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      objc_msgSend(WeakRetained, "_showAlertForError:completion:", v6, *(_QWORD *)(a1 + 32));
      goto LABEL_7;
    }
    objc_storeStrong(WeakRetained + 131, a2);
    *((_BYTE *)v8 + 1224) = 0;
    objc_msgSend(v8, "_updateSections");
    objc_msgSend(v8, "_updateBarButtonItems");
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(void))(v9 + 16))();
LABEL_7:

}

void __90__PKPeerPaymentRecurringPaymentDetailViewController__pauseRecurringPaymentWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  id *v4;
  id WeakRetained;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && (a2 & 1) != 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __90__PKPeerPaymentRecurringPaymentDetailViewController__pauseRecurringPaymentWithCompletion___block_invoke_3;
    v7[3] = &unk_1E3E61C30;
    objc_copyWeak(&v9, v4);
    v8 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_authorizeRecurringPaymentWithCompletion:", v7);

    objc_destroyWeak(&v9);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
  }

}

void __90__PKPeerPaymentRecurringPaymentDetailViewController__pauseRecurringPaymentWithCompletion___block_invoke_3(uint64_t a1, int a2)
{
  id *v4;
  id WeakRetained;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && a2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __90__PKPeerPaymentRecurringPaymentDetailViewController__pauseRecurringPaymentWithCompletion___block_invoke_4;
    v7[3] = &unk_1E3E61C30;
    objc_copyWeak(&v9, v4);
    v8 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_updateRecurringPaymentsWithCompletion:", v7);

    objc_destroyWeak(&v9);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
  }

}

void __90__PKPeerPaymentRecurringPaymentDetailViewController__pauseRecurringPaymentWithCompletion___block_invoke_4(uint64_t a1, int a2)
{
  id *v4;
  id WeakRetained;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained || a2)
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      (*(void (**)(void))(v10 + 16))();
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *((_QWORD *)WeakRetained + 131);
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentRecurringPaymentDetailViewController: Manually updating recurring payment status for recurring payment: %@", buf, 0xCu);
    }

    v8 = (void *)*((_QWORD *)WeakRetained + 138);
    objc_msgSend(*((id *)WeakRetained + 131), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __90__PKPeerPaymentRecurringPaymentDetailViewController__pauseRecurringPaymentWithCompletion___block_invoke_191;
    v11[3] = &unk_1E3E61B40;
    objc_copyWeak(&v13, v4);
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v8, "updateRecurringPaymentStatus:identifier:completion:", 1, v9, v11);

    objc_destroyWeak(&v13);
  }

}

void __90__PKPeerPaymentRecurringPaymentDetailViewController__pauseRecurringPaymentWithCompletion___block_invoke_191(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 131, a2);
    objc_msgSend(v5, "_updateSections");
    objc_msgSend(v5, "_updateBarButtonItems");
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

- (void)_cancelRecurringPaymentWithCompletion:(id)a3
{
  id v4;
  PKPeerPaymentService *peerPaymentService;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  peerPaymentService = self->_peerPaymentService;
  -[PKPeerPaymentRecurringPayment identifier](self->_recurringPayment, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__PKPeerPaymentRecurringPaymentDetailViewController__cancelRecurringPaymentWithCompletion___block_invoke;
  v8[3] = &unk_1E3E61B18;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  -[PKPeerPaymentService performRecurringPaymentAction:identifier:completion:](peerPaymentService, "performRecurringPaymentAction:identifier:completion:", 2, v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __91__PKPeerPaymentRecurringPaymentDetailViewController__cancelRecurringPaymentWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v4)
    {
      objc_msgSend(WeakRetained, "_showAlertForError:completion:", v4, *(_QWORD *)(a1 + 32));
    }
    else
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __91__PKPeerPaymentRecurringPaymentDetailViewController__cancelRecurringPaymentWithCompletion___block_invoke_2;
      v8[3] = &unk_1E3E61C80;
      objc_copyWeak(&v10, (id *)(a1 + 40));
      v9 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], v8);

      objc_destroyWeak(&v10);
    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
  }

}

void __91__PKPeerPaymentRecurringPaymentDetailViewController__cancelRecurringPaymentWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

- (void)memoIconWasTapped
{
  _QWORD block[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKPeerPaymentRecurringPaymentDetailViewController_memoIconWasTapped__block_invoke;
  block[3] = &unk_1E3E61B68;
  objc_copyWeak(&v4, &location);
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __70__PKPeerPaymentRecurringPaymentDetailViewController_memoIconWasTapped__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  PKMemoIconChooserViewController *v4;
  void *v5;
  PKMemoIconChooserViewController *v6;
  PKNavigationController *v7;
  _QWORD *v8;
  uint64_t v9;
  id *v10;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "overrideUserInterfaceStyle");
    v4 = [PKMemoIconChooserViewController alloc];
    objc_msgSend(v10[152], "recurringPaymentMemo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKMemoIconChooserViewController initWithDelegate:memo:context:](v4, "initWithDelegate:memo:context:", v10, v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056));

    -[PKMemoIconChooserViewController setOverrideUserInterfaceStyle:](v6, "setOverrideUserInterfaceStyle:", v3);
    v7 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v6);
    -[PKNavigationController setOverrideUserInterfaceStyle:](v7, "setOverrideUserInterfaceStyle:", v3);
    v8 = *(_QWORD **)(a1 + 32);
    if (v8[132] == 9)
    {
      if ((PKIsPad() & 1) != 0)
      {
        v9 = 0;
        goto LABEL_8;
      }
      v8 = *(_QWORD **)(a1 + 32);
    }
    if (!objc_msgSend(v8, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    {
LABEL_9:
      objc_msgSend(v10, "presentViewController:animated:completion:", v7, 1, 0);

      WeakRetained = v10;
      goto LABEL_10;
    }
    v9 = 16;
LABEL_8:
    -[PKNavigationController setModalPresentationStyle:](v7, "setModalPresentationStyle:", v9);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)memoIconChooserDidChooseMemo:(id)a3
{
  -[PKPeerPaymentRecurringPaymentMemoSectionController setRecurringPaymentMemoWithTextSuggestion:](self->_memoSectionController, "setRecurringPaymentMemoWithTextSuggestion:", a3);
  -[PKDynamicCollectionViewController reloadDataForSection:animated:](self, "reloadDataForSection:animated:", self->_memoSectionController, 1);
  -[PKPeerPaymentRecurringPaymentMemoSectionController requestBecomeFirstResponder](self->_memoSectionController, "requestBecomeFirstResponder");
}

- (void)fundingSourceSectionSelected
{
  void *v3;
  void *v4;
  void *v5;
  PKPaymentPass *v6;
  PKPaymentPass *selectedPass;
  _QWORD v8[4];
  id v9;
  id location;

  if (self->_paymentRequest)
  {
    -[PKPeerPaymentRecurringPayment fundingSource](self->_recurringPayment, "fundingSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fpanIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!self->_selectedPass)
    {
      if (objc_msgSend(v4, "length"))
      {
        objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "passWithFPANIdentifier:", v4);
        v6 = (PKPaymentPass *)objc_claimAutoreleasedReturnValue();
        selectedPass = self->_selectedPass;
        self->_selectedPass = v6;

      }
    }
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __81__PKPeerPaymentRecurringPaymentDetailViewController_fundingSourceSectionSelected__block_invoke;
    v8[3] = &unk_1E3E61310;
    objc_copyWeak(&v9, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);

  }
}

void __81__PKPeerPaymentRecurringPaymentDetailViewController_fundingSourceSectionSelected__block_invoke(uint64_t a1)
{
  PKPaymentMethodSelectionViewController *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PKPaymentMethodSelectionViewController *v8;
  void *v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [PKPaymentMethodSelectionViewController alloc];
    v2 = *((_QWORD *)WeakRetained + 135);
    v3 = *((_QWORD *)WeakRetained + 134);
    objc_msgSend(*((id *)WeakRetained + 131), "fundingSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)WeakRetained + 131), "fundingSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fpanIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKPaymentMethodSelectionViewController initWithPaymentRequest:selectedPass:paymentMethodName:paymentMethodIdentifier:allowAppleCashToggle:useAppleCashBalance:viewStyle:delegate:](v1, "initWithPaymentRequest:selectedPass:paymentMethodName:paymentMethodIdentifier:allowAppleCashToggle:useAppleCashBalance:viewStyle:delegate:", v2, v3, v5, v7, 1, objc_msgSend(*((id *)WeakRetained + 149), "useAppleCashBalance"), 0, WeakRetained);

    objc_msgSend(WeakRetained, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushViewController:animated:", v8, 1);

  }
}

- (void)paymentMethodSelectionViewController:(id)a3 didSelectPaymentMethod:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  char v12;
  PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController *fundingSourceSectionController;
  void *v14;
  id v15;
  id v16;

  v16 = a4;
  -[PKPaymentPass uniqueID](self->_selectedPass, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v7;
  if (v8 == v9)
  {

LABEL_11:
    goto LABEL_12;
  }
  v10 = v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {

LABEL_10:
    objc_storeStrong((id *)&self->_selectedPass, a4);
    fundingSourceSectionController = self->_fundingSourceSectionController;
    -[PKPaymentPass localizedDescription](self->_selectedPass, "localizedDescription");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController setFundingSource:](fundingSourceSectionController, "setFundingSource:", v8);
    goto LABEL_11;
  }
  v12 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v12 & 1) == 0)
    goto LABEL_10;
LABEL_12:
  -[PKPeerPaymentRecurringPaymentDetailViewController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "popViewControllerAnimated:", 1);

}

- (void)paymentMethodSelectionViewController:(id)a3 didToggleUseAppleCashBalance:(BOOL)a4
{
  -[PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController setUseAppleCashBalance:](self->_fundingSourceSectionController, "setUseAppleCashBalance:", a4);
}

- (void)didSelectAmountSection
{
  id v2;
  id v3;

  if (self->_mode == 1)
  {
    -[PKPeerPaymentRecurringPaymentDetailViewController navigationController](self, "navigationController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v2 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

  }
}

- (void)recurringPaymentsChanged
{
  PKPeerPaymentService *peerPaymentService;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  peerPaymentService = self->_peerPaymentService;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__PKPeerPaymentRecurringPaymentDetailViewController_recurringPaymentsChanged__block_invoke;
  v4[3] = &unk_1E3E61BE0;
  objc_copyWeak(&v5, &location);
  -[PKPeerPaymentService recurringPaymentsWithCompletion:](peerPaymentService, "recurringPaymentsWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __77__PKPeerPaymentRecurringPaymentDetailViewController_recurringPaymentsChanged__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_reloadWithPayments:", v5);

}

- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor
{
  _BOOL8 v2;
  int64_t v3;
  $85E40A55691FE2F31975A98F57E3065D result;

  v2 = -[PKPeerPaymentRecurringPaymentDetailViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle") == 2;
  v3 = v2;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NSDecimalNumber)minimumAmount
{
  return self->_minimumAmount;
}

- (void)setMinimumAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1232);
}

- (NSDecimalNumber)maximumAmount
{
  return self->_maximumAmount;
}

- (void)setMaximumAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1240);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (BOOL)allowEdits
{
  return self->_allowEdits;
}

- (void)setAllowEdits:(BOOL)a3
{
  self->_allowEdits = a3;
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (PKPeerPaymentRecurringPaymentDetailViewControllerDelegate)delegate
{
  return (PKPeerPaymentRecurringPaymentDetailViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_maximumAmount, 0);
  objc_storeStrong((id *)&self->_minimumAmount, 0);
  objc_storeStrong((id *)&self->_memoSectionController, 0);
  objc_storeStrong((id *)&self->_cancelSectionController, 0);
  objc_storeStrong((id *)&self->_pauseSectionController, 0);
  objc_storeStrong((id *)&self->_fundingSourceSectionController, 0);
  objc_storeStrong((id *)&self->_detailSectionController, 0);
  objc_storeStrong((id *)&self->_messageSectionController, 0);
  objc_storeStrong((id *)&self->_amountSectionController, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_remoteMessagesComposer, 0);
  objc_storeStrong((id *)&self->_peerPaymentController, 0);
  objc_storeStrong((id *)&self->_paymentRequest, 0);
  objc_storeStrong((id *)&self->_selectedPass, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_recurringPayment, 0);
}

@end
