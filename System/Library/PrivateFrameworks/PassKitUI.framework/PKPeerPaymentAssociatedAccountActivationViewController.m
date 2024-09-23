@implementation PKPeerPaymentAssociatedAccountActivationViewController

- (PKPeerPaymentAssociatedAccountActivationViewController)initWithPeerPaymentSetupFlowController:(id)a3
{
  id v5;
  PKPeerPaymentAssociatedAccountActivationViewController *v6;
  PKPeerPaymentAssociatedAccountActivationViewController *v7;
  id *p_controller;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  PKFamilyMember *familyMember;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPeerPaymentAssociatedAccountActivationViewController;
  v6 = -[PKExplanationViewController initWithContext:](&v21, sel_initWithContext_, objc_msgSend(v5, "context"));
  v7 = v6;
  if (v6)
  {
    p_controller = (id *)&v6->_controller;
    objc_storeStrong((id *)&v6->_controller, a3);
    objc_msgSend(*p_controller, "deviceCapabiltiesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerObserver:", v7);

    objc_msgSend(*p_controller, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "peerPaymentSetupConfigurationType");

    if (v11 == 1)
    {
      objc_msgSend(*p_controller, "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "familyMember");
      v13 = objc_claimAutoreleasedReturnValue();
      familyMember = v7->_familyMember;
      v7->_familyMember = (PKFamilyMember *)v13;

      objc_msgSend(v12, "associatedAccountSetupDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v7->_delegate, v15);

      v7->_setupType = objc_msgSend(v12, "setupType");
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0D6B2B8];
    objc_msgSend(*p_controller, "peerPaymentWebService");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "targetDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v7, sel__handlePeerPaymentAccountDidChangeNotification, v17, v19);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PKPeerPaymentSetupFlowController deviceCapabiltiesManager](self->_controller, "deviceCapabiltiesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentAssociatedAccountActivationViewController;
  -[PKPeerPaymentAssociatedAccountActivationViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  PKPeerPaymentAccount *v10;
  PKPeerPaymentAccount *account;
  PKPeerPaymentIconEducationView *v12;
  PKPeerPaymentIconEducationView *iconEducationView;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentAssociatedAccountActivationViewController;
  -[PKExplanationViewController viewDidLoad](&v14, sel_viewDidLoad);
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  -[PKPeerPaymentAssociatedAccountActivationViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidesBackButton:", 1);

  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setForceShowSetupLaterButton:", 0);
  objc_msgSend(v4, "setShowPrivacyView:", 0);
  -[PKExplanationViewController context](self, "context");
  if ((PKPaymentSetupContextIsBridge() & 1) == 0)
  {
    PKPassKitUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("AppleCashIcon"), CFSTR("pdf"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = PKUIScreenScale();
    PKUIImageFromPDF(v6, 80.0, 80.0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setImage:", v8);
    objc_msgSend(v4, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClipsToBounds:", 1);
    objc_msgSend(v9, "_setContinuousCornerRadius:", 20.0);
    objc_msgSend(v4, "setTopMargin:", 30.0);

  }
  -[PKPeerPaymentSetupFlowController peerPaymentAccount](self->_controller, "peerPaymentAccount");
  v10 = (PKPeerPaymentAccount *)objc_claimAutoreleasedReturnValue();
  account = self->_account;
  self->_account = v10;

  v12 = objc_alloc_init(PKPeerPaymentIconEducationView);
  iconEducationView = self->_iconEducationView;
  self->_iconEducationView = v12;

  -[PKPeerPaymentAssociatedAccountActivationViewController _setState:](self, "_setState:", 1);
}

- (void)_setState:(unint64_t)a3
{
  unint64_t state;
  NSObject *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
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
  PKPeerPaymentSetupFlowController *controller;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
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
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int64_t setupType;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t IsSetupAssistant;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  id v81;
  _QWORD v82[5];
  _QWORD v83[5];
  _QWORD v84[4];
  id v85;
  PKPeerPaymentAssociatedAccountActivationViewController *v86;
  _QWORD aBlock[4];
  id v88;
  id v89;
  id v90;
  PKPeerPaymentAssociatedAccountActivationViewController *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint8_t buf[4];
  const __CFString *v97;
  __int16 v98;
  const __CFString *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (state != a3)
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (state > 9)
        v7 = CFSTR("unknown");
      else
        v7 = off_1E3E75590[state];
      if (a3 > 9)
        v8 = CFSTR("unknown");
      else
        v8 = off_1E3E75590[a3];
      *(_DWORD *)buf = 138412546;
      v97 = v7;
      v98 = 2112;
      v99 = v8;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentAssociatedAccountActivationViewController transitioning from state %@ to state %@", buf, 0x16u);
    }

    self->_state = a3;
    -[PKFamilyMember firstName](self->_familyMember, "firstName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExplanationViewController explanationView](self, "explanationView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dockView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "footerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__PKPeerPaymentAssociatedAccountActivationViewController__setState___block_invoke;
    aBlock[3] = &unk_1E3E75570;
    v14 = v10;
    v88 = v14;
    v15 = v11;
    v89 = v15;
    v16 = v12;
    v90 = v16;
    v91 = self;
    v17 = _Block_copy(aBlock);
    v84[0] = v13;
    v84[1] = 3221225472;
    v84[2] = __68__PKPeerPaymentAssociatedAccountActivationViewController__setState___block_invoke_2;
    v84[3] = &unk_1E3E619E0;
    v18 = v15;
    v85 = v18;
    v86 = self;
    v19 = _Block_copy(v84);
    v20 = v19;
    switch(self->_state)
    {
      case 1uLL:
        (*((void (**)(void *, uint64_t))v19 + 2))(v19, 1);
        -[PKPeerPaymentIconEducationView removeFromSuperview](self->_iconEducationView, "removeFromSuperview");
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACTIVATING"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTitleText:", v29);

        PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_PERSON_SETTING_UP_ACCOUNT"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setBodyText:", v30);

        controller = self->_controller;
        v83[0] = v13;
        v83[1] = 3221225472;
        v83[2] = __68__PKPeerPaymentAssociatedAccountActivationViewController__setState___block_invoke_3;
        v83[3] = &unk_1E3E63138;
        v83[4] = self;
        -[PKPeerPaymentSetupFlowController nextViewControllerAfterPerfomingOperations:completion:](controller, "nextViewControllerAfterPerfomingOperations:completion:", 128, v83);
        goto LABEL_35;
      case 2uLL:
        (*((void (**)(void *, uint64_t))v19 + 2))(v19, 1);
        -[PKPeerPaymentSetupFlowController peerPaymentService](self->_controller, "peerPaymentService");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v82[0] = v13;
        v82[1] = 3221225472;
        v82[2] = __68__PKPeerPaymentAssociatedAccountActivationViewController__setState___block_invoke_4;
        v82[3] = &unk_1E3E654F8;
        v82[4] = self;
        objc_msgSend(v32, "updateAccountAndAssociatedAccountsWithCompletion:", v82);
        goto LABEL_22;
      case 3uLL:
      case 4uLL:
        v81 = v16;
        v21 = v9;
        (*((void (**)(void *, _QWORD))v19 + 2))(v19, 0);
        PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_PENDING"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPeerPaymentAccount supportsFamilySharingFeatureDescriptor](self->_account, "supportsFamilySharingFeatureDescriptor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "osVersionRange");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "minimum");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "iphone");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "minimum");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "watch");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26 && v28)
          PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_PENDING_REQUIRED_VERSION_DESCRIPTION"), CFSTR("%@%@%@%@"), v21, v26, v28, v21);
        else
          PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_PENDING_DESCRIPTION"), CFSTR("%@"), v21);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(void *, void *, void *, _QWORD, uint64_t, _QWORD))v17 + 2))(v17, v22, v65, 0, 1, 0);

        v9 = v21;
        goto LABEL_34;
      case 5uLL:
        (*((void (**)(void *, _QWORD))v19 + 2))(v19, 0);
        PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_PENDING_REASON_MANATEE"));
        v76 = objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_PENDING_REASON_MANATEE_LINK"));
        v78 = objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_PENDING_REASON_MANATEE_DESCRIPTION"), CFSTR("%@%@"), v9, v78);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v74, "rangeOfString:", v78);
        v71 = v34;
        v72 = v33;
        v35 = objc_alloc(MEMORY[0x1E0CB3778]);
        v94 = *MEMORY[0x1E0DC1140];
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v36 = v16;
        v37 = v9;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v35, "initWithString:attributes:", v74, v39);

        v9 = v37;
        v16 = v36;
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/102660"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "pk_addLinkURL:toRange:withColor:isUnderlined:", v41, v72, v71, v42, 0);

        v43 = (void *)objc_msgSend(v40, "copy");
        v44 = (void *)v76;
        (*((void (**)(void *, uint64_t, _QWORD, void *, uint64_t, _QWORD))v17 + 2))(v17, v76, 0, v43, 1, 0);

        v45 = (void *)v78;
        goto LABEL_19;
      case 6uLL:
        (*((void (**)(void *, _QWORD))v19 + 2))(v19, 0);
        PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_PENDING_REASON_REGION"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_PENDING_REASON_REGION_DESCRIPTION"), CFSTR("%@"), v9);
        goto LABEL_21;
      case 7uLL:
        (*((void (**)(void *, _QWORD))v19 + 2))(v19, 0);
        PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_PENDING_REASON_UNKNOWN"));
        v79 = objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_PENDING_REASON_UNKNOWN_DESCRIPTION_LINK"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_PENDING_REASON_UNKNOWN_DESCRIPTION"), CFSTR("%@%@"), v9, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_PENDING_REASON_UNKNOWN_DESCRIPTION_LINK"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v47;
        v73 = v47;
        v50 = objc_msgSend(v47, "rangeOfString:", v48);
        v75 = v51;
        v77 = v50;

        v52 = objc_alloc(MEMORY[0x1E0CB3778]);
        v92 = *MEMORY[0x1E0DC1140];
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = v53;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
        v54 = v16;
        v55 = v9;
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (void *)objc_msgSend(v52, "initWithString:attributes:", v49, v56);

        v9 = v55;
        v16 = v54;

        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/kb/HT211324"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "pk_addLinkURL:toRange:withColor:isUnderlined:", v58, v77, v75, v59, 0);

        v60 = (void *)objc_msgSend(v57, "copy");
        v44 = (void *)v79;
        (*((void (**)(void *, uint64_t, _QWORD, void *, uint64_t, _QWORD))v17 + 2))(v17, v79, 0, v60, 1, 0);

        v45 = v73;
LABEL_19:

        goto LABEL_35;
      case 8uLL:
        (*((void (**)(void *, _QWORD))v19 + 2))(v19, 0);
        PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_PENDING"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_PENDING_NOTIFY_USER_DESCRIPTION"), CFSTR("%@"), v9);
LABEL_21:
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(void *, void *, void *, _QWORD, uint64_t, _QWORD))v17 + 2))(v17, v32, v61, 0, 1, 0);

LABEL_22:
        goto LABEL_35;
      case 9uLL:
        (*((void (**)(void *, _QWORD))v19 + 2))(v19, 0);
        PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_TURNED_ON"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        setupType = self->_setupType;
        v80 = v9;
        v81 = v16;
        if (setupType == 1)
        {
          PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_TURNED_ON_DESCRIPTION"), CFSTR("%@%@"), v9, v9);
          v64 = objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        }
        if (!setupType)
        {
          PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_TURNED_ON_DESCRIPTION"), CFSTR("%@"), v9);
          v64 = objc_claimAutoreleasedReturnValue();
LABEL_29:
          v66 = (void *)v64;
          goto LABEL_31;
        }
        v66 = 0;
LABEL_31:
        -[PKExplanationViewController context](self, "context");
        IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
        if ((IsSetupAssistant & 1) == 0)
        {
          objc_msgSend(v16, "manualEntryButton");
          v68 = v62;
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_SEND_MONEY_NOW"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setTitle:forState:", v70, 0);

          objc_msgSend(v69, "addTarget:action:forControlEvents:", self, sel__sendMoneyInMessages, 64);
          v62 = v68;
        }
        objc_msgSend(v14, "setTitleLineBreakStrategy:", 1);
        objc_msgSend(v14, "showCheckmark:animated:", 1, 1);
        (*((void (**)(void *, void *, void *, _QWORD, uint64_t, uint64_t))v17 + 2))(v17, v62, v66, 0, IsSetupAssistant, 1);

        v9 = v80;
LABEL_34:
        v16 = v81;
LABEL_35:

        break;
      default:
        goto LABEL_35;
    }
  }
}

void __68__PKPeerPaymentAssociatedAccountActivationViewController__setState___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, int a5, int a6)
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  id v18;

  v18 = a3;
  v11 = a4;
  objc_msgSend(*(id *)(a1 + 32), "setTitleText:", a2);
  v12 = *(void **)(a1 + 32);
  if (v18)
    objc_msgSend(v12, "setBodyText:");
  else
    objc_msgSend(v12, "setAttributedBodyText:", v11);
  objc_msgSend(*(id *)(a1 + 40), "primaryButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_DONE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:forState:", v14, 0);

  objc_msgSend(*(id *)(a1 + 48), "setSkipCardButton:", 0);
  if (a5)
    objc_msgSend(*(id *)(a1 + 48), "setManualEntryButton:", 0);
  objc_msgSend(*(id *)(a1 + 48), "setSetupLaterButton:", 0);
  v15 = *(void **)(*(_QWORD *)(a1 + 56) + 1072);
  if (a6)
  {
    objc_msgSend(v15, "setShowIconsView:", 1);
    v16 = *(_QWORD **)(a1 + 56);
    v17 = (void *)v16[134];
    objc_msgSend(v16, "context");
    objc_msgSend(v17, "setShowWatchView:", PKPaymentSetupContextIsBridge());
    objc_msgSend(*(id *)(a1 + 32), "setBodyView:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 1072));
  }
  else
  {
    objc_msgSend(v15, "removeFromSuperview");
  }

}

uint64_t __68__PKPeerPaymentAssociatedAccountActivationViewController__setState___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setHidden:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "_showSpinner:", a2);
}

void __68__PKPeerPaymentAssociatedAccountActivationViewController__setState___block_invoke_3(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "_presentDisplayableError:", v7);
  }
  else if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1048));
    objc_msgSend(WeakRetained, "addPeerPaymentAssociatedAccountSetupCompletedWithSucess:updatedAccount:forFamilyMember:", 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040));

  }
  else
  {
    v9 = *(void **)(a1 + 32);
    if (v11)
    {
      objc_msgSend(v9, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pk_presentPaymentSetupViewController:animated:completion:", v11, 1, 0);

    }
    else
    {
      objc_msgSend(v9, "_setState:", 2);
    }
  }

}

void __68__PKPeerPaymentAssociatedAccountActivationViewController__setState___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PKPeerPaymentAssociatedAccountActivationViewController__setState___block_invoke_5;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __68__PKPeerPaymentAssociatedAccountActivationViewController__setState___block_invoke_5(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1080), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_checkFamilyMemberAppleCashCapabilities");
}

- (BOOL)_isAssociatedAccountPending
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[PKFamilyMember altDSID](self->_familyMember, "altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAccount peerPaymentAccountWithAltDSID:](self->_account, "peerPaymentAccountWithAltDSID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAccount accountInvitationWithAltDSID:](self->_account, "accountInvitationWithAltDSID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = v5 && objc_msgSend(v5, "status") == 1 || v4 == 0;

  return v7;
}

- (void)_cancelTimer
{
  NSObject *timer;

  timer = self->_timer;
  if (timer)
    dispatch_source_cancel(timer);
}

- (void)_startTimerIfNeccessary
{
  OS_dispatch_source *v3;
  OS_dispatch_source *timer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];
  _QWORD v12[5];
  _QWORD handler[5];

  if (!self->_timer && !self->_timerHasFired)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    timer = self->_timer;
    self->_timer = v3;

    v5 = self->_timer;
    v6 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v7 = self->_timer;
    v8 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __81__PKPeerPaymentAssociatedAccountActivationViewController__startTimerIfNeccessary__block_invoke;
    handler[3] = &unk_1E3E612E8;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    v9 = self->_timer;
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __81__PKPeerPaymentAssociatedAccountActivationViewController__startTimerIfNeccessary__block_invoke_79;
    v12[3] = &unk_1E3E612E8;
    v12[4] = self;
    dispatch_source_set_cancel_handler(v9, v12);
    dispatch_resume((dispatch_object_t)self->_timer);
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Starting timer to wait for IDS responses for apple cash capabilities.", v11, 2u);
    }

  }
}

uint64_t __81__PKPeerPaymentAssociatedAccountActivationViewController__startTimerIfNeccessary__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 1088))
  {
    v1 = result;
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Apple cash capabilities fetch timer fired.", v5, 2u);
    }

    v3 = *(_QWORD *)(v1 + 32);
    v4 = *(void **)(v3 + 1088);
    *(_QWORD *)(v3 + 1088) = 0;

    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 1096) = 1;
    return objc_msgSend(*(id *)(v1 + 32), "_checkFamilyMemberAppleCashCapabilities");
  }
  return result;
}

void __81__PKPeerPaymentAssociatedAccountActivationViewController__startTimerIfNeccessary__block_invoke_79(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1088);
  *(_QWORD *)(v2 + 1088) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1096) = 1;
}

- (void)_checkFamilyMemberAppleCashCapabilities
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  unint64_t v16;
  unint64_t state;
  unsigned __int8 v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentAssociatedAccountActivationViewController: Checking family member apple cash capabilities", buf, 2u);
  }

  if (self->_state - 3 <= 6)
  {
    -[PKPeerPaymentAssociatedAccountActivationViewController _cancelTimer](self, "_cancelTimer");
    return;
  }
  if (!-[PKPeerPaymentAssociatedAccountActivationViewController _isAssociatedAccountPending](self, "_isAssociatedAccountPending")|| -[PKExplanationViewController context](self, "context") == 5)
  {
    -[PKPeerPaymentAssociatedAccountActivationViewController _cancelTimer](self, "_cancelTimer");
    -[PKPeerPaymentAssociatedAccountActivationViewController _setState:](self, "_setState:", 9);
    return;
  }
  -[PKPeerPaymentSetupFlowController deviceCapabiltiesManager](self->_controller, "deviceCapabiltiesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFamilyMember appleID](self->_familyMember, "appleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentFetchStatusForAppleID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "deviceCountFetchInProgress")
    || objc_msgSend(v6, "secondsPassedSinceFetchStart") < 11)
  {
    -[PKPeerPaymentAssociatedAccountActivationViewController _startTimerIfNeccessary](self, "_startTimerIfNeccessary");
    if (!self->_timerHasFired && (objc_msgSend(v6, "deviceCountFetchInProgress") & 1) != 0)
      goto LABEL_34;
    -[PKFamilyMember appleID](self->_familyMember, "appleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      if (objc_msgSend(v6, "allPossibleCapabilitiesFetched"))
      {
        v16 = -[PKPeerPaymentAssociatedAccountActivationViewController _nextStateAfterCheckingFamilyMemberAppleCashCapabilities:](self, "_nextStateAfterCheckingFamilyMemberAppleCashCapabilities:", 0);
      }
      else
      {
        v18 = 0;
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Not all apple cash device capabilities have been fetched yet. Checking if one of the existing ones it capable.", buf, 2u);
        }

        v16 = -[PKPeerPaymentAssociatedAccountActivationViewController _nextStateAfterCheckingFamilyMemberAppleCashCapabilities:](self, "_nextStateAfterCheckingFamilyMemberAppleCashCapabilities:", &v18);
        if (!(self->_timerHasFired | v18))
        {
          state = self->_state;
          goto LABEL_33;
        }
      }
      state = v16;
      goto LABEL_33;
    }
    objc_msgSend(v8, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)*MEMORY[0x1E0D34028];
    v12 = v10;
    v13 = v11;
    if (v12 == v13)
    {

    }
    else
    {
      v14 = v13;
      if (!v12 || !v13)
      {

LABEL_27:
        state = 7;
LABEL_33:
        -[PKPeerPaymentAssociatedAccountActivationViewController _setState:](self, "_setState:", state);

        goto LABEL_34;
      }
      v15 = objc_msgSend(v12, "isEqualToString:", v13);

      if (!v15)
        goto LABEL_27;
    }
    if (objc_msgSend(v9, "code") == 3)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v7;
        _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "The handle %@ is not registered with IDS which means they dont have a device signed in", buf, 0xCu);
      }

      state = 3;
      goto LABEL_33;
    }
    goto LABEL_27;
  }
  -[PKPeerPaymentAssociatedAccountActivationViewController _cancelTimer](self, "_cancelTimer");
  -[PKPeerPaymentAssociatedAccountActivationViewController _setState:](self, "_setState:", 7);
LABEL_34:

}

- (unint64_t)_nextStateAfterCheckingFamilyMemberAppleCashCapabilities:(BOOL *)a3
{
  __CFString *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  const char *v32;
  void *v33;
  const __CFString *v34;
  const __CFString *v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  char v39;
  NSObject *v40;
  BOOL *v42;
  void *v43;
  __CFString *v44;
  uint64_t v45;
  void *v46;
  char v47;
  id obj;
  PKPeerPaymentAssociatedAccountActivationViewController *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  const __CFString *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  -[PKFamilyMember appleID](self->_familyMember, "appleID");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v49 = self;
  -[PKPeerPaymentSetupFlowController deviceCapabiltiesManager](self->_controller, "deviceCapabiltiesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentFetchStatusForAppleID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "deviceCountFetchInProgress"))
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v5;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "The initial IDS fetch is still progress for %@. Handling this as an unknown error", buf, 0xCu);
    }

    v9 = 7;
    goto LABEL_79;
  }
  objc_msgSend(v7, "fetchedCapabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {
    PKLogFacilityTypeGetObject();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v5;
      _os_log_impl(&dword_19D178000, v40, OS_LOG_TYPE_DEFAULT, "The handle %@ has no devices", buf, 0xCu);
    }

    if (a3)
      *a3 = 0;
    v9 = 3;
    goto LABEL_79;
  }
  -[PKPeerPaymentAccount supportsFamilySharingFeatureDescriptor](v49->_account, "supportsFamilySharingFeatureDescriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "osVersionRange");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v46, "asDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v56 = v5;
    v57 = 2112;
    v58 = v14;
    _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Checking apple cash capabilites for %@ using required OS range %@", buf, 0x16u);

  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v7, "fetchedCapabilities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (!v16)
  {

    v37 = 0;
    v9 = 7;
    goto LABEL_76;
  }
  v17 = v16;
  obj = v15;
  v42 = a3;
  v43 = v7;
  v44 = v5;
  v45 = 0;
  v47 = 0;
  v18 = *(_QWORD *)v51;
LABEL_10:
  v19 = 0;
  while (1)
  {
    if (*(_QWORD *)v51 != v18)
      objc_enumerationMutation(obj);
    v20 = *(__CFString **)(*((_QWORD *)&v50 + 1) + 8 * v19);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v20;
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Checking apple cash device capabilities for %@", buf, 0xCu);
    }

    -[__CFString fromDeviceVersion](v20, "fromDeviceVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString deviceRegion](v20, "deviceRegion");
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentSetupFlowController paymentWebService](v49->_controller, "paymentWebService");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "context");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "configuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v25, "peerPaymentEnabledForRegion:", v22) & 1) == 0)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v22;
        _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "This devices apple cash capabilities are not supported since %@ is not an eligible region", buf, 0xCu);
      }
      v47 = 1;
      goto LABEL_42;
    }
    if ((-[__CFString supportsManatee](v20, "supportsManatee") & 1) == 0)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "This devices apple cash capabilities are not supported since its not manatee capable", buf, 2u);
      }
      BYTE4(v45) = 1;
      goto LABEL_42;
    }
    if (v21)
      break;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v31 = v13;
      v32 = "Cannot check apple cash device capabilities for nil fromDeviceVersion";
LABEL_40:
      _os_log_impl(&dword_19D178000, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 2u);
    }
LABEL_41:
    LOBYTE(v45) = 1;
LABEL_42:

LABEL_43:
    if (v17 == ++v19)
    {
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      v17 = v36;
      if (!v36)
      {

        v37 = 0;
        v38 = 5;
        v39 = BYTE4(v45);
        goto LABEL_67;
      }
      goto LABEL_10;
    }
  }
  if (!v46 && (PKPeerPaymentSkipFamilySharingVersionCheck() & 1) == 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v31 = v13;
      v32 = "Cannot check apple cash device capabilities for nil requiredOSVersionRange. The osVersionRequirement is prob"
            "ably not set on the supported feature";
      goto LABEL_40;
    }
    goto LABEL_41;
  }
  objc_msgSend(v21, "iphone");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    objc_msgSend(v21, "ipad");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      LODWORD(v27) = objc_msgSend(v46, "versionMeetsRequirements:deviceClass:", v21, CFSTR("iPad"));
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        goto LABEL_51;
      v34 = CFSTR("NO");
      if ((_DWORD)v27)
        v34 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v56 = v34;
      v29 = v13;
      v30 = "Compared version requirements for ipad. Meets requirements %@";
    }
    else
    {
      objc_msgSend(v21, "watch");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
        goto LABEL_52;
      LODWORD(v27) = objc_msgSend(v46, "versionMeetsRequirements:deviceClass:", v21, CFSTR("Watch"));
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        goto LABEL_51;
      v35 = CFSTR("NO");
      if ((_DWORD)v27)
        v35 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v56 = v35;
      v29 = v13;
      v30 = "Compared version requirements for watch. Meets requirements %@";
    }
LABEL_50:
    _os_log_impl(&dword_19D178000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);
    goto LABEL_51;
  }
  LODWORD(v27) = objc_msgSend(v46, "versionMeetsRequirements:deviceClass:", v21, CFSTR("iPhone"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v28 = CFSTR("NO");
    if ((_DWORD)v27)
      v28 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v56 = v28;
    v29 = v13;
    v30 = "Compared version requirements for phone. Meets requirements %@";
    goto LABEL_50;
  }
LABEL_51:

LABEL_52:
  if (!PKPeerPaymentSkipFamilySharingVersionCheck())
  {
    if ((_DWORD)v27)
      goto LABEL_66;
    LOBYTE(v45) = 1;
    goto LABEL_43;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Skipping family sharing required version check", buf, 2u);
  }

LABEL_66:
  v37 = 1;
  v38 = 8;
  v39 = 1;
LABEL_67:
  if ((v47 & 1) != 0)
  {
    a3 = v42;
    if ((v45 & 1) == 0)
    {
      v9 = 6;
      goto LABEL_74;
    }
LABEL_71:
    v7 = v43;
    v5 = v44;
    if ((v39 & 1) == 0)
    {
      v9 = 4;
      goto LABEL_76;
    }
LABEL_75:
    v9 = v38;
  }
  else
  {
    a3 = v42;
    if ((v45 & 1) != 0)
      goto LABEL_71;
    v9 = 7;
LABEL_74:
    v7 = v43;
    v5 = v44;
    if ((v39 & 1) != 0)
      goto LABEL_75;
  }
LABEL_76:
  if (a3)
    *a3 = v37;

LABEL_79:
  return v9;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id WeakRetained;
  PKPeerPaymentAccount *account;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  account = self->_account;
  v7 = WeakRetained;
  if (account)
  {
    objc_msgSend(WeakRetained, "addPeerPaymentAssociatedAccountSetupCompletedWithSucess:updatedAccount:forFamilyMember:", 1, account, self->_familyMember);
  }
  else
  {
    -[PKPeerPaymentSetupFlowController peerPaymentAccount](self->_controller, "peerPaymentAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addPeerPaymentAssociatedAccountSetupCompletedWithSucess:updatedAccount:forFamilyMember:", 1, v6, self->_familyMember);

  }
}

- (void)deviceSharingCapabilitiesUpdated:(id)a3 newSharingCapabilties:(id)a4 forAppleID:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  PKPeerPaymentAssociatedAccountActivationViewController *v14;

  v7 = a3;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __124__PKPeerPaymentAssociatedAccountActivationViewController_deviceSharingCapabilitiesUpdated_newSharingCapabilties_forAppleID___block_invoke;
  block[3] = &unk_1E3E61400;
  v12 = v8;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __124__PKPeerPaymentAssociatedAccountActivationViewController_deviceSharingCapabilitiesUpdated_newSharingCapabilties_forAppleID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentAssociatedAccountActivationViewController deviceSharingCapabilitiesUpdated:newSharingCapabilties called for handle %@, %@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 48), "_checkFamilyMemberAppleCashCapabilities");
}

- (void)deviceSharingCapabilitiesUpdated:(id)a3 maximumPossibleDevices:(int64_t)a4 forAppleID:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  PKPeerPaymentAssociatedAccountActivationViewController *v14;

  v7 = a3;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __125__PKPeerPaymentAssociatedAccountActivationViewController_deviceSharingCapabilitiesUpdated_maximumPossibleDevices_forAppleID___block_invoke;
  block[3] = &unk_1E3E61400;
  v12 = v8;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __125__PKPeerPaymentAssociatedAccountActivationViewController_deviceSharingCapabilitiesUpdated_maximumPossibleDevices_forAppleID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentAssociatedAccountActivationViewController deviceSharingCapabilitiesUpdated:maximumPossibleDevices called for handle %@, %@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 48), "_checkFamilyMemberAppleCashCapabilities");
}

- (void)_handlePeerPaymentAccountDidChangeNotification
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__PKPeerPaymentAssociatedAccountActivationViewController__handlePeerPaymentAccountDidChangeNotification__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __104__PKPeerPaymentAssociatedAccountActivationViewController__handlePeerPaymentAccountDidChangeNotification__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t v9[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentAssociatedAccountActivationViewController _handlePeerPaymentAccountDidChangeNotification", v9, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "peerPaymentWebService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 1080);
  *(_QWORD *)(v6 + 1080) = v5;

  return objc_msgSend(*(id *)(a1 + 32), "_checkFamilyMemberAppleCashCapabilities");
}

- (void)_sendMoneyInMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PKFamilyMember appleID](self->_familyMember, "appleID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentSetupFlowController peerPaymentAccount](self->_controller, "peerPaymentAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentBalance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PKPeerPaymentGetSendPaymentSensitiveURL();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "openSensitiveURL:withOptions:", v7, 0);

  }
}

- (void)_presentDisplayableError:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__PKPeerPaymentAssociatedAccountActivationViewController__presentDisplayableError___block_invoke;
  v6[3] = &unk_1E3E612E8;
  v6[4] = self;
  v4 = PKAlertForDisplayableErrorWithHandlers(a3, 0, v6, 0);
  if (v4)
  {
    -[PKPeerPaymentAssociatedAccountActivationViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

  }
  else
  {
    -[PKPeerPaymentAssociatedAccountActivationViewController _terminateAddAssociatedAccountFlowWithSucces:updatedAccount:](self, "_terminateAddAssociatedAccountFlowWithSucces:updatedAccount:", 0, 0);
  }

}

uint64_t __83__PKPeerPaymentAssociatedAccountActivationViewController__presentDisplayableError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminateAddAssociatedAccountFlowWithSucces:updatedAccount:", 0, 0);
}

- (void)_terminateAddAssociatedAccountFlowWithSucces:(BOOL)a3 updatedAccount:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  v6 = a4;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Terminating peer payment add associated account", v10, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "addPeerPaymentAssociatedAccountSetupCompletedWithSucess:updatedAccount:forFamilyMember:", v4, v6, self->_familyMember);
  else
    -[PKPeerPaymentAssociatedAccountActivationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_showSpinner:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowSpinner:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childAppleCashCapabilities, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_iconEducationView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
