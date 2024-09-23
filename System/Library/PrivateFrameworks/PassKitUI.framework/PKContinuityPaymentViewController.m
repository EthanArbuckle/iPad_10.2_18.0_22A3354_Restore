@implementation PKContinuityPaymentViewController

- (PKContinuityPaymentViewController)init
{
  return -[PKContinuityPaymentViewController initWithRemotePaymentRequest:](self, "initWithRemotePaymentRequest:", 0);
}

- (PKContinuityPaymentViewController)initWithRemotePaymentRequest:(id)a3
{
  id v5;
  PKContinuityPaymentViewController *v6;
  PKContinuityPaymentViewController *v7;
  id *p_remoteRequest;
  PKAuthenticator *v9;
  PKAuthenticator *authenticator;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PKPaymentAuthorizationStateMachine *v16;
  PKPaymentAuthorizationStateMachine *stateMachine;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  PKPaymentAuthorizationStateMachine *v22;
  void *v23;
  PKPaymentAuthorizationStateMachine *v24;
  id v25;
  PKPaymentAuthorizationStateMachine *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v39;
  id v40;
  objc_super v41;

  v5 = a3;
  v41.receiver = self;
  v41.super_class = (Class)PKContinuityPaymentViewController;
  v6 = -[PKContinuityPaymentViewController initWithNibName:bundle:](&v41, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    p_remoteRequest = (id *)&v6->_remoteRequest;
    objc_storeStrong((id *)&v6->_remoteRequest, a3);
    v9 = (PKAuthenticator *)objc_alloc_init(MEMORY[0x1E0D6BFD8]);
    authenticator = v7->_authenticator;
    v7->_authenticator = v9;

    -[PKAuthenticator setDelegate:](v7->_authenticator, "setDelegate:", v7);
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contactFormatConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C50]), "initWithConfiguration:", v14);
    v16 = (PKPaymentAuthorizationStateMachine *)objc_alloc_init(MEMORY[0x1E0D670B0]);
    stateMachine = v7->_stateMachine;
    v7->_stateMachine = v16;

    -[PKPaymentAuthorizationStateMachine setDelegate:](v7->_stateMachine, "setDelegate:", v7);
    v18 = objc_alloc_init(MEMORY[0x1E0D67090]);
    objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPeerPaymentService:", v19);

    objc_msgSend(*p_remoteRequest, "paymentRequest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPaymentRequest:", v20);

    objc_msgSend(*p_remoteRequest, "device");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRemoteDevice:", v21);

    objc_msgSend(v18, "setContactFormatValidator:", v15);
    -[PKPaymentAuthorizationStateMachine setModel:](v7->_stateMachine, "setModel:", v18);
    v22 = v7->_stateMachine;
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationStateMachine setPaymentWebService:](v22, "setPaymentWebService:", v23);

    v24 = v7->_stateMachine;
    v25 = objc_alloc_init(MEMORY[0x1E0D672B0]);
    -[PKPaymentAuthorizationStateMachine setPaymentService:](v24, "setPaymentService:", v25);

    v26 = v7->_stateMachine;
    v27 = objc_alloc_init(MEMORY[0x1E0D66A50]);
    -[PKPaymentAuthorizationStateMachine setAggregateDictionary:](v26, "setAggregateDictionary:", v27);

    objc_msgSend(*p_remoteRequest, "selectedApplicationIdentifier");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = (void *)v28;
      v39 = 0;
      v40 = 0;
      objc_msgSend(*p_remoteRequest, "selectedApplicationIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[PKContinuityPaymentViewController paymentPass:paymentApplication:fromAID:selectedPaymentMethodType:](v7, "paymentPass:paymentApplication:fromAID:selectedPaymentMethodType:", &v40, &v39, v30, objc_msgSend(*p_remoteRequest, "selectedPaymentMethodType"));
      v32 = v40;
      v33 = v39;

      if (v31)
      {
        objc_msgSend(v18, "setPass:", v32);
        objc_msgSend(v18, "setPaymentApplication:", v33);
      }
    }
    else
    {
      v33 = 0;
      v32 = 0;
    }
    -[PKContinuityPaymentViewController navigationItem](v7, "navigationItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v35, "configureWithTransparentBackground");
    objc_msgSend(v34, "setStandardAppearance:", v35);
    +[PKPaymentAuthorizationNavigationBar applePayBarButtonItem](PKPaymentAuthorizationNavigationBar, "applePayBarButtonItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setLeftBarButtonItem:animated:", v36, 0);

    objc_msgSend(v34, "setLeftItemsSupplementBackButton:", 1);
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v7, sel_cancelPressed_);
    objc_msgSend(v34, "setRightBarButtonItem:animated:", v37, 0);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PKAuthenticator invalidate](self->_authenticator, "invalidate");
  -[PKAuthenticator setDelegate:](self->_authenticator, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PKContinuityPaymentViewController;
  -[PKContinuityPaymentViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  id v3;
  void *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *backdropView;
  UIView *v7;
  UIView *dimmingBackgroundView;
  UIView *v9;
  void *v10;
  UIView *v11;
  UIView *compactRegion;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  LAUIPhysicalButtonView *v16;
  LAUIPhysicalButtonView *physicalButtonView;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  UILabel *v22;
  UILabel *requestingDeviceLabel;
  UILabel *v24;
  void *v25;
  UILabel *v26;
  void *v27;
  UILabel *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  UILabel *v35;
  void *v36;
  UILabel *v37;
  UILabel *requestingSiteLabel;
  UILabel *v39;
  void *v40;
  UILabel *v41;
  void *v42;
  UILabel *v43;
  void *v44;
  UIView *v45;
  UIView *priceView;
  UILabel *v47;
  UILabel *priceLabel;
  UILabel *v49;
  void *v50;
  UILabel *v51;
  void *v52;
  UILabel *v53;
  UILabel *footnoteLabel;
  UILabel *v55;
  void *v56;
  UILabel *v57;
  void *v58;
  UILabel *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  PKContinuityPaymentFaviconView *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  PKContinuityPaymentFaviconView *v74;
  PKContinuityPaymentFaviconView *faviconImage;
  PKContinuityPaymentFaviconView *v76;
  void *v77;
  id v78;
  UIView *v79;
  UILabel *v80;
  void *v81;
  UIStackView *v82;
  UIStackView *summaryContainerView;
  PKPaymentAuthorizationLayout *v84;
  void *v85;
  PKPaymentAuthorizationLayout *v86;
  PKPaymentAuthorizationFooterView *v87;
  PKPaymentAuthorizationFooterView *authorizationView;
  PKContinuityPaymentCardSummaryView *v89;
  PKContinuityPaymentCardSummaryView *cardView;
  void *v91;
  void *v92;
  uint64_t v93;
  NSString *v94;
  NSString *v95;
  void *v96;
  void *v97;
  objc_super v98;
  _QWORD v99[6];

  v99[4] = *MEMORY[0x1E0C80C00];
  v98.receiver = self;
  v98.super_class = (Class)PKContinuityPaymentViewController;
  -[PKContinuityPaymentViewController loadView](&v98, sel_loadView);
  -[PKContinuityPaymentViewController _updateUserIntentStyle](self, "_updateUserIntentStyle");
  v3 = objc_alloc(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UIVisualEffectView *)objc_msgSend(v3, "initWithEffect:", v4);
  backdropView = self->_backdropView;
  self->_backdropView = v5;

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_backdropView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  dimmingBackgroundView = self->_dimmingBackgroundView;
  self->_dimmingBackgroundView = v7;

  v9 = self->_dimmingBackgroundView;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.06);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_dimmingBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  compactRegion = self->_compactRegion;
  self->_compactRegion = v11;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_compactRegion, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (PKUserIntentIsAvailable())
  {
    -[PKContinuityPaymentViewController traitCollection](self, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceStyle");

    if (v14 == 2)
      v15 = 1;
    else
      v15 = 2;
    v16 = (LAUIPhysicalButtonView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D44460]), "initWithStyle:", v15);
    physicalButtonView = self->_physicalButtonView;
    self->_physicalButtonView = v16;

    PKLocalizedPearlString(CFSTR("IN_APP_PAYMENT_PUSH_BUTTON"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRemotePaymentRequest paymentRequest](self->_remoteRequest, "paymentRequest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "confirmationStyle");

    if (v20 <= 8)
    {
      PKLocalizedPearlString(&off_1E3E62FE8[v20]->isa);
      v21 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v21;
    }
    -[LAUIPhysicalButtonView setInstruction:](self->_physicalButtonView, "setInstruction:", v18);

  }
  v22 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  requestingDeviceLabel = self->_requestingDeviceLabel;
  self->_requestingDeviceLabel = v22;

  v24 = self->_requestingDeviceLabel;
  v95 = (NSString *)*MEMORY[0x1E0DC4AB8];
  v94 = (NSString *)*MEMORY[0x1E0DC48D0];
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], (NSString *)*MEMORY[0x1E0DC48D0]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v24, "setFont:", v25);

  -[UILabel setTextAlignment:](self->_requestingDeviceLabel, "setTextAlignment:", 1);
  v26 = self->_requestingDeviceLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v26, "setBackgroundColor:", v27);

  v28 = self->_requestingDeviceLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v28, "setTextColor:", v29);

  -[UILabel setAlpha:](self->_requestingDeviceLabel, "setAlpha:", 0.42);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_requestingDeviceLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PKRemotePaymentRequest device](self->_remoteRequest, "device");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "deviceName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKRemotePaymentRequest paymentRequest](self->_remoteRequest, "paymentRequest");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "paymentSummaryItems");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "lastObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "label");
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = self->_requestingDeviceLabel;
  PKLocalizedPaymentString(CFSTR("CONTINUITY_PAYMENT_FROM_DEVICE"), CFSTR("%@"), v31);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v35, "setText:", v36);

  v37 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  requestingSiteLabel = self->_requestingSiteLabel;
  self->_requestingSiteLabel = v37;

  v39 = self->_requestingSiteLabel;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B60], (NSString *)*MEMORY[0x1E0DC48C8]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v39, "setFont:", v40);

  -[UILabel setTextAlignment:](self->_requestingSiteLabel, "setTextAlignment:", 1);
  v41 = self->_requestingSiteLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v41, "setBackgroundColor:", v42);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_requestingSiteLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setText:](self->_requestingSiteLabel, "setText:", v97);
  v43 = self->_requestingSiteLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v43, "setTextColor:", v44);

  v45 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  priceView = self->_priceView;
  self->_priceView = v45;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_priceView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v47 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  priceLabel = self->_priceLabel;
  self->_priceLabel = v47;

  v49 = self->_priceLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "_lightSystemFontOfSize:", 42.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v49, "setFont:", v50);

  -[UILabel setTextAlignment:](self->_priceLabel, "setTextAlignment:", 1);
  v51 = self->_priceLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v51, "setBackgroundColor:", v52);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_priceLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_priceView, "addSubview:", self->_priceLabel);
  v53 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  footnoteLabel = self->_footnoteLabel;
  self->_footnoteLabel = v53;

  v55 = self->_footnoteLabel;
  PKFontForDefaultDesign(v95, v94);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v55, "setFont:", v56);

  -[UILabel setTextAlignment:](self->_footnoteLabel, "setTextAlignment:", 1);
  v57 = self->_footnoteLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v57, "setBackgroundColor:", v58);

  v59 = self->_footnoteLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v59, "setTextColor:", v60);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_footnoteLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAlpha:](self->_footnoteLabel, "setAlpha:", 0.8);
  -[PKRemotePaymentRequest paymentRequest](self->_remoteRequest, "paymentRequest");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "paymentSummaryItems");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "lastObject");
  v63 = objc_claimAutoreleasedReturnValue();

  -[PKContinuityPaymentViewController _updatePriceLabelWithTotalSummaryItem:](self, "_updatePriceLabelWithTotalSummaryItem:", v63);
  v96 = (void *)v63;
  -[PKContinuityPaymentViewController _updateFootnoteLabelWithTotalSummaryItem:](self, "_updateFootnoteLabelWithTotalSummaryItem:", v63);
  -[PKRemotePaymentRequest paymentRequest](self->_remoteRequest, "paymentRequest");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "thumbnailURLs");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "firstObject");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKRemotePaymentRequest device](self->_remoteRequest, "device");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "modelIdentifier");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = [PKContinuityPaymentFaviconView alloc];
  v70 = *MEMORY[0x1E0C9D648];
  v71 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v72 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v73 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v74 = -[PKContinuityPaymentFaviconView initWithFrame:URL:modelIdentifier:merchantName:](v69, "initWithFrame:URL:modelIdentifier:merchantName:", v66, v68, v97, *MEMORY[0x1E0C9D648], v71, v72, v73);
  faviconImage = self->_faviconImage;
  self->_faviconImage = v74;

  v76 = self->_faviconImage;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKContinuityPaymentFaviconView setBackgroundColor:](v76, "setBackgroundColor:", v77);

  -[PKContinuityPaymentFaviconView setTranslatesAutoresizingMaskIntoConstraints:](self->_faviconImage, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v78 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v79 = self->_priceView;
  v99[0] = self->_faviconImage;
  v99[1] = v79;
  v80 = self->_footnoteLabel;
  v99[2] = self->_requestingSiteLabel;
  v99[3] = v80;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 4);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (UIStackView *)objc_msgSend(v78, "initWithArrangedSubviews:", v81);
  summaryContainerView = self->_summaryContainerView;
  self->_summaryContainerView = v82;

  -[UIStackView setAlignment:](self->_summaryContainerView, "setAlignment:", 3);
  -[UIStackView setAxis:](self->_summaryContainerView, "setAxis:", 1);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_summaryContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v84 = [PKPaymentAuthorizationLayout alloc];
  -[PKRemotePaymentRequest paymentRequest](self->_remoteRequest, "paymentRequest");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = -[PKPaymentAuthorizationLayout initWithStyle:paymentRequest:](v84, "initWithStyle:paymentRequest:", 0, v85);

  v87 = -[PKPaymentAuthorizationFooterView initWithFrame:layout:]([PKPaymentAuthorizationFooterView alloc], "initWithFrame:layout:", v86, v70, v71, v72, v73);
  authorizationView = self->_authorizationView;
  self->_authorizationView = v87;

  -[PKPaymentAuthorizationFooterView setUserIntentStyle:](self->_authorizationView, "setUserIntentStyle:", self->_userIntentStyle);
  -[PKPaymentAuthorizationFooterView setDelegate:](self->_authorizationView, "setDelegate:", self);
  -[PKPaymentAuthorizationFooterView setTranslatesAutoresizingMaskIntoConstraints:](self->_authorizationView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v89 = -[PKContinuityPaymentCardSummaryView initWithFrame:]([PKContinuityPaymentCardSummaryView alloc], "initWithFrame:", v70, v71, v72, v73);
  cardView = self->_cardView;
  self->_cardView = v89;

  -[PKContinuityPaymentViewController _updateCardView](self, "_updateCardView");
  -[PKContinuityPaymentViewController view](self, "view");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setBackgroundColor:", v92);

  objc_msgSend(v91, "addSubview:", self->_backdropView);
  objc_msgSend(v91, "addSubview:", self->_dimmingBackgroundView);
  objc_msgSend(v91, "addSubview:", self->_compactRegion);
  if (self->_physicalButtonView)
    objc_msgSend(v91, "addSubview:");
  objc_msgSend(v91, "addSubview:", self->_requestingDeviceLabel);
  objc_msgSend(v91, "addSubview:", self->_summaryContainerView);
  objc_msgSend(v91, "addSubview:", self->_authorizationView);
  objc_msgSend(v91, "addSubview:", self->_cardView);
  if (PKPearlIsAvailable())
    v93 = 3;
  else
    v93 = 0;
  -[PKContinuityPaymentViewController setProgressState:string:animated:](self, "setProgressState:string:animated:", v93, 0, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKContinuityPaymentViewController;
  -[PKContinuityPaymentViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (!self->_viewAppeared)
    self->_viewAppeared = 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKContinuityPaymentViewController;
  -[PKContinuityPaymentViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x1E0DC45C0], self->_authorizationView);
  -[PKContinuityPaymentViewController _resetAndScheduleTimeout](self, "_resetAndScheduleTimeout");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKContinuityPaymentViewController;
  -[PKContinuityPaymentViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[NSTimer invalidate](self->_timeoutTimer, "invalidate");
}

- (void)viewDidLoad
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
  void *physicalButtonView;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSArray *v26;
  NSArray *defaultConstraints;
  void *v28;
  void *v29;
  NSArray *v30;
  NSArray *compactConstraints;
  UIStackView *summaryContainerView;
  void *v33;
  UIStackView *v34;
  void *v35;
  UIStackView *v36;
  void *v37;
  UIStackView *v38;
  void *v39;
  UIStackView *v40;
  void *v41;
  UILabel *footnoteLabel;
  void *v43;
  UIStackView *v44;
  void *v45;
  UIStackView *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int IsAvailable;
  double v59;
  void *v60;
  objc_super v61;
  _QWORD v62[2];
  _QWORD v63[3];

  v63[2] = *MEMORY[0x1E0C80C00];
  v61.receiver = self;
  v61.super_class = (Class)PKContinuityPaymentViewController;
  -[PKContinuityPaymentViewController viewDidLoad](&v61, sel_viewDidLoad);
  -[PKContinuityPaymentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_backdropView, 1, 0, v3, 1, 1.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v4);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_backdropView, 2, 0, v3, 2, 1.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v5);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_backdropView, 3, 0, v3, 3, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v6);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_backdropView, 4, 0, v3, 4, 1.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v7);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_dimmingBackgroundView, 1, 0, v3, 1, 1.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v8);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_dimmingBackgroundView, 2, 0, v3, 2, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v9);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_dimmingBackgroundView, 3, 0, v3, 3, 1.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v10);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_compactRegion, 1, 0, self->_dimmingBackgroundView, 1, 1.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v11);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_compactRegion, 2, 0, self->_dimmingBackgroundView, 2, 1.0, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v12);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_compactRegion, 7, 0, self->_dimmingBackgroundView, 7, 1.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v13);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_compactRegion, 4, 0, self->_dimmingBackgroundView, 4, 1.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v14);

  physicalButtonView = self->_physicalButtonView;
  if (physicalButtonView)
  {
    v16 = 1.0;
    v17 = 4;
  }
  else
  {
    physicalButtonView = self->_dimmingBackgroundView;
    v16 = 1.0;
    v17 = 3;
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_compactRegion, 3, 0, physicalButtonView, v17, v16, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v18);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_requestingDeviceLabel, 9, 0, v3, 9, 1.0, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v19);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_requestingDeviceLabel, 4, 0, self->_dimmingBackgroundView, 4, 1.0, -16.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v20);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_requestingDeviceLabel, 1, 0, v3, 1, 1.0, 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v21);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_requestingDeviceLabel, 2, 0, v3, 2, 1.0, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v22);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_summaryContainerView, 7, 0, self->_dimmingBackgroundView, 7, 1.0, 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v23);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_summaryContainerView, 9, 0, self->_dimmingBackgroundView, 9, 1.0, 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v24;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_summaryContainerView, 10, 0, self->_dimmingBackgroundView, 10, 1.0, 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
  v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
  defaultConstraints = self->_defaultConstraints;
  self->_defaultConstraints = v26;

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_summaryContainerView, 9, 0, self->_compactRegion, 9, 1.0, 0.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v28;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_summaryContainerView, 10, 0, self->_compactRegion, 10, 1.0, 0.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
  v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
  compactConstraints = self->_compactConstraints;
  self->_compactConstraints = v30;

  summaryContainerView = self->_summaryContainerView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_priceView, 8, 0, 0, 0, 1.0, 59.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addConstraint:](summaryContainerView, "addConstraint:", v33);

  v34 = self->_summaryContainerView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_priceLabel, 4, 0, self->_priceView, 4, 1.0, 0.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addConstraint:](v34, "addConstraint:", v35);

  v36 = self->_summaryContainerView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_priceLabel, 9, 0, self->_priceView, 9, 1.0, 0.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addConstraint:](v36, "addConstraint:", v37);

  v38 = self->_summaryContainerView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_priceLabel, 5, 1, self->_priceView, 5, 1.0, 0.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addConstraint:](v38, "addConstraint:", v39);

  v40 = self->_summaryContainerView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_priceLabel, 6, -1, self->_priceView, 6, 1.0, 0.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addConstraint:](v40, "addConstraint:", v41);

  footnoteLabel = self->_footnoteLabel;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", footnoteLabel, 8, 0, 0, 0, 1.0, 25.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel addConstraint:](footnoteLabel, "addConstraint:", v43);

  v44 = self->_summaryContainerView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_faviconImage, 7, 0, 0, 0, 1.0, 240.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addConstraint:](v44, "addConstraint:", v45);

  v46 = self->_summaryContainerView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_faviconImage, 8, 0, 0, 0, 1.0, 150.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addConstraint:](v46, "addConstraint:", v47);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_cardView, 1, 0, v3, 1, 1.0, 0.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v48);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_cardView, 2, 0, v3, 2, 1.0, 0.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v49);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_cardView, 3, 0, self->_dimmingBackgroundView, 4, 1.0, 0.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v50);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_cardView, 8, 1, 0, 0, 1.0, 56.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v51);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_authorizationView, 7, 0, v3, 7, 1.0, 0.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v52);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_authorizationView, 3, 0, self->_cardView, 4, 1.0, 0.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v53);

  -[PKPaymentAuthorizationFooterView bottomAnchor](self->_authorizationView, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "bottomAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v57);

  IsAvailable = PKPearlIsAvailable();
  v59 = 257.0;
  if (!IsAvailable)
    v59 = 237.0;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_authorizationView, 4, -1, self->_cardView, 3, 1.0, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v60);

  -[PKContinuityPaymentViewController _updateActiveConstraints](self, "_updateActiveConstraints");
  -[PKPaymentAuthorizationStateMachine start](self->_stateMachine, "start");

}

- (BOOL)_updateActiveConstraints
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  NSArray *v6;
  NSArray **p_activeConstraints;
  NSArray *activeConstraints;

  v3 = -[PKPaymentAuthorizationFooterView isOffscreen](self->_authorizationView, "isOffscreen");
  v4 = 18;
  if (v3)
    v4 = 19;
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKContinuityPaymentViewController__remoteRequest[v4]);
  v6 = v5;
  p_activeConstraints = &self->_activeConstraints;
  activeConstraints = self->_activeConstraints;
  if (activeConstraints != v6)
  {
    if (activeConstraints)
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_activeConstraints);
    objc_storeStrong((id *)p_activeConstraints, v5);
    if (*p_activeConstraints)
      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:");
    -[PKContinuityPaymentViewController _layoutAnimated](self, "_layoutAnimated");
  }

  return activeConstraints != v6;
}

- (void)_layoutAnimated
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  -[PKContinuityPaymentViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setNeedsLayout");
    if (self->_viewAppeared)
    {
      v5 = (void *)MEMORY[0x1E0DC3F10];
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __52__PKContinuityPaymentViewController__layoutAnimated__block_invoke;
      v6[3] = &unk_1E3E612E8;
      v7 = v4;
      objc_msgSend(v5, "_animateUsingDefaultTimingWithOptions:animations:completion:", 134, v6, 0);

    }
    else
    {
      objc_msgSend(v4, "layoutIfNeeded");
    }
  }

}

uint64_t __52__PKContinuityPaymentViewController__layoutAnimated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)viewWillLayoutSubviews
{
  LAUIPhysicalButtonView *physicalButtonView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKContinuityPaymentViewController;
  -[PKContinuityPaymentViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  physicalButtonView = self->_physicalButtonView;
  if (physicalButtonView)
    -[LAUIPhysicalButtonView updateFrame](physicalButtonView, "updateFrame");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;
  _QWORD v9[5];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts")&& PKUserIntentIsAvailable())
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __88__PKContinuityPaymentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v9[3] = &unk_1E3E62F28;
    v9[4] = self;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, 0);
  }
  v8.receiver = self;
  v8.super_class = (Class)PKContinuityPaymentViewController;
  -[PKContinuityPaymentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

uint64_t __88__PKContinuityPaymentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "updateRotation");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKContinuityPaymentViewController;
  -[PKContinuityPaymentViewController traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, a3);
  -[PKContinuityPaymentViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceStyle") == 2)
    v5 = 1;
  else
    v5 = 2;

  -[LAUIPhysicalButtonView setStyle:](self->_physicalButtonView, "setStyle:", v5);
}

- (void)setProgressState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5
{
  -[PKContinuityPaymentViewController setProgressState:string:animated:withCompletion:](self, "setProgressState:string:animated:withCompletion:", a3, a4, a5, 0);
}

- (void)setProgressState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
  -[PKPaymentAuthorizationFooterView setState:string:animated:withCompletion:](self->_authorizationView, "setState:string:animated:withCompletion:", a3, a4, a5, a6);
  -[PKContinuityPaymentViewController _updateUserIntentRequired](self, "_updateUserIntentRequired");
}

- (void)_setAuthenticating:(BOOL)a3
{
  if (self->_authenticating != a3)
  {
    self->_authenticating = a3;
    -[PKContinuityPaymentViewController _updateUserIntentRequired](self, "_updateUserIntentRequired");
    -[PKContinuityPaymentViewController _updateCoachingState](self, "_updateCoachingState");
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
    -[PKContinuityPaymentViewController _updateUserIntentRequired](self, "_updateUserIntentRequired");
    -[PKContinuityPaymentViewController _updateCoachingState](self, "_updateCoachingState");
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
    -[PKContinuityPaymentViewController _updateUserIntentRequired](self, "_updateUserIntentRequired");
    -[PKContinuityPaymentViewController _updateCoachingState](self, "_updateCoachingState");
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
    -[PKPaymentAuthorizationFooterView setUserIntentStyle:](self->_authorizationView, "setUserIntentStyle:", v3);
  }
}

- (void)_updateUserIntentRequired
{
  _BOOL8 v3;

  v3 = PKUserIntentIsAvailable()
    && self->_authenticating
    && -[PKPaymentAuthorizationFooterView state](self->_authorizationView, "state") == 3
    && !self->_passcodeViewController
    && self->_passphraseViewController == 0;
  -[PKContinuityPaymentViewController _setUserIntentRequired:](self, "_setUserIntentRequired:", v3);
}

- (void)_updateCoachingState
{
  int64_t internalCoachingState;

  if (PKPearlIsAvailable()
    && self->_authenticating
    && !self->_passcodeViewController
    && !self->_passphraseViewController)
  {
    internalCoachingState = self->_internalCoachingState;
  }
  else
  {
    internalCoachingState = 0;
  }
  if (self->_coachingState != internalCoachingState)
  {
    self->_coachingState = internalCoachingState;
    -[PKContinuityPaymentViewController _updateProgressStateIfAuthenticatingWithBiometricFailure:](self, "_updateProgressStateIfAuthenticatingWithBiometricFailure:", 0);
  }
}

- (void)_updateProgressStateIfAuthenticatingWithBiometricFailure:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;

  if (self->_authenticating)
  {
    v3 = a3;
    v5 = -[PKContinuityPaymentViewController _progressStateForAuthenticationWithBiometricFailure:](self, "_progressStateForAuthenticationWithBiometricFailure:");
    if (-[PKPaymentAuthorizationFooterView state](self->_authorizationView, "state") != v5)
      -[PKContinuityPaymentViewController setProgressState:string:animated:](self, "setProgressState:string:animated:", v5, 0, 1);
    if (v3)
      -[PKContinuityPaymentViewController setProgressState:string:animated:](self, "setProgressState:string:animated:", 9, 0, 1);
  }
}

- (void)_setUserIntentRequired:(BOOL)a3
{
  if (self->_userIntentRequired != a3)
  {
    self->_userIntentRequired = a3;
    -[LAUIPhysicalButtonView setAnimating:](self->_physicalButtonView, "setAnimating:");
    -[PKContinuityPaymentViewController _updateActiveConstraints](self, "_updateActiveConstraints");
  }
}

- (void)cancelPressed:(id)a3
{
  NSObject *v4;
  int v5;
  PKContinuityPaymentViewController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134349056;
    v6 = self;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "PKContinuityPaymentViewController (%{public}p): User cancelled payment", (uint8_t *)&v5, 0xCu);
  }

  -[PKPaymentAuthorizationStateMachine didCancel](self->_stateMachine, "didCancel");
}

- (void)_cancelPassphrasePressed
{
  -[PKContinuityPaymentViewController _suspendAuthentication](self, "_suspendAuthentication");
  -[PKContinuityPaymentViewController _resumeAuthenticationWithPreviousError:](self, "_resumeAuthenticationWithPreviousError:", 0);
}

- (void)_resetAndScheduleTimeout
{
  NSTimer *timeoutTimer;
  NSTimer *v4;
  NSTimer *v5;

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
    -[NSTimer invalidate](timeoutTimer, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__timeoutFired, 0, 0, 120.0);
  v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v5 = self->_timeoutTimer;
  self->_timeoutTimer = v4;

}

- (void)_timeoutFired
{
  if (!self->_attemptedTimeout
    && (-[PKPaymentAuthorizationStateMachine state](self->_stateMachine, "state") == 10
     || -[PKPaymentAuthorizationStateMachine state](self->_stateMachine, "state") == 11))
  {
    -[PKContinuityPaymentViewController _resetAndScheduleTimeout](self, "_resetAndScheduleTimeout");
    self->_attemptedTimeout = 1;
  }
  else
  {
    -[PKContinuityPaymentViewController _didFailWithFatalError:](self, "_didFailWithFatalError:", 0);
  }
}

- (void)_updateCardView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  uint64_t v30;
  __CFString *v31;
  _QWORD v32[5];

  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PKPassFrontFaceContentSize();
  PKFloatRoundToPixel();
  v6 = v5;
  +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __52__PKContinuityPaymentViewController__updateCardView__block_invoke;
  v32[3] = &unk_1E3E613B0;
  v32[4] = self;
  objc_msgSend(v7, "snapshotWithPass:size:completion:", v4, v32, 41.0, v6);

  v8 = objc_msgSend(v4, "hasAssociatedPeerPaymentAccount");
  if (!(_DWORD)v8)
  {
    objc_msgSend(v4, "localizedDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pk_uppercaseStringForPreferredLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "acceptedPaymentApplicationsForPass:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "unavailablePaymentApplicationsForPass:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "paymentApplication");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v17, "displayName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23 || !objc_msgSend(v9, "count"))
        goto LABEL_9;
      v24 = objc_msgSend(v9, "count");
      v25 = objc_msgSend(v16, "count") + v24;

      if (v25 >= 2)
      {
        v26 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v17, "displayName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("%@ - %@"), v14, v23);
        v27 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v27;
LABEL_9:

      }
    }
    PKSanitizedPrimaryAccountRepresentationForPass();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v28);
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "length");
    v31 = &stru_1E3E7D690;
    if (v30)
      v31 = v29;
    v18 = v31;

    goto LABEL_13;
  }
  objc_msgSend(v4, "peerPaymentBalance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "localizedDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pk_uppercaseStringForPreferredLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minimalFormattedStringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ - %@"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "itemForType:", 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "status") != 5)
  {
    v8 = 0;
    v18 = 0;
    goto LABEL_15;
  }
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_INSUFFICIENT_APPLE_CASH_BALANCE"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pk_uppercaseStringForPreferredLocale");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_13:

LABEL_15:
  -[PKContinuityPaymentCardSummaryView setCardDescription:](self->_cardView, "setCardDescription:", v14);
  -[PKContinuityPaymentCardSummaryView setSubtitle:](self->_cardView, "setSubtitle:", v18);
  -[PKContinuityPaymentCardSummaryView setShowsAlert:](self->_cardView, "setShowsAlert:", v8);
  -[PKContinuityPaymentCardSummaryView setNeedsLayout](self->_cardView, "setNeedsLayout");

}

void __52__PKContinuityPaymentViewController__updateCardView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PKContinuityPaymentViewController__updateCardView__block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __52__PKContinuityPaymentViewController__updateCardView__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "thumbnailView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", *(_QWORD *)(a1 + 40));

}

- (void)_updatePriceLabelWithTotalSummaryItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  -[PKRemotePaymentRequest paymentRequest](self->_remoteRequest, "paymentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currencyCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKFormattedCurrencyStringFromNumber();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v10;
    objc_msgSend(v8, "intervalCount");
    objc_msgSend(v8, "intervalUnit");

    PKLocalizedIntervalTermStringWithAmount();
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  -[UILabel setText:](self->_priceLabel, "setText:", v7);

}

- (void)_updateFootnoteLabelWithTotalSummaryItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v9;
    objc_msgSend(v4, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContinuityPaymentViewController _formattedDateRangeWithStartDate:endDate:](self, "_formattedDateRangeWithStartDate:endDate:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = 0;
      goto LABEL_9;
    }
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_STARTING_FMT"), CFSTR("%@"), v7);
LABEL_6:
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "deferredDate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    PKMediumDateString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ON_FMT"), CFSTR("%@"), v7);
    goto LABEL_6;
  }
  v8 = 0;
LABEL_10:
  -[UILabel setText:](self->_footnoteLabel, "setText:", v8);
  -[UILabel setHidden:](self->_footnoteLabel, "setHidden:", v8 == 0);

}

- (id)_formattedDateRangeWithStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKDateRangeStringFromDateToDate();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    PKDateRangeStringFromDateToDate();
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v5)
    {
      v8 = 0;
      goto LABEL_9;
    }
    PKMediumDateString();
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_9:

  return v8;
}

- (void)updatePaymentWithClientUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[16];

  v4 = a3;
  -[PKPaymentAuthorizationStateMachine state](self->_stateMachine, "state");
  if (PKPaymentAuthorizationStateIsTerminal())
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Received client update but in terminal state", buf, 2u);
    }

  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__PKContinuityPaymentViewController_updatePaymentWithClientUpdate___block_invoke;
    v6[3] = &unk_1E3E61388;
    v6[4] = self;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __67__PKContinuityPaymentViewController_updatePaymentWithClientUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_resetAndScheduleTimeout");
  objc_msgSend(v2, "paymentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 40), "selectedPaymentMethodType");
  objc_msgSend(*(id *)(a1 + 40), "selectedAID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    if (!v4)
    {

LABEL_13:
      v12 = v3;
      goto LABEL_14;
    }
    v7 = objc_msgSend(v3, "paymentType");

    if (v4 == v7)
      goto LABEL_13;
  }
  else
  {

  }
  v25 = v3;
  v26 = 0;
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "selectedAID", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "paymentPass:paymentApplication:fromAID:selectedPaymentMethodType:", &v26, &v25, v9, v4);
  v11 = v26;
  v12 = v25;

  if (v10)
  {
    objc_msgSend(v2, "setPass:withSelectedPaymentApplication:", v11, v12);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "didSelectPaymentPass:paymentApplication:", v11, v12);
    objc_msgSend(*(id *)(a1 + 32), "_updateCardView");
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "selectedAID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PKPaymentMethodTypeToString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v14;
      v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Payment client update provided AID %@, payment type %@, but a match wasn't found", buf, 0x16u);

    }
  }

LABEL_14:
  objc_msgSend(*(id *)(a1 + 40), "paymentSummaryItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentSummaryItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqualToArray:", v17);

  if ((v18 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "paymentSummaryItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setPaymentSummaryItems:", v19);

    objc_msgSend(*(id *)(a1 + 40), "paymentSummaryItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_updatePriceLabelWithTotalSummaryItem:", v21);
    objc_msgSend(*(id *)(a1 + 32), "_updateFootnoteLabelWithTotalSummaryItem:", v21);

  }
  objc_msgSend(*(id *)(a1 + 40), "multiTokenContexts");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMultiTokenContexts:", v22);

  objc_msgSend(*(id *)(a1 + 40), "recurringPaymentRequest");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRecurringPaymentRequest:", v23);

  objc_msgSend(*(id *)(a1 + 40), "automaticReloadPaymentRequest");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAutomaticReloadPaymentRequest:", v24);

}

- (void)invalidate
{
  -[PKContinuityPaymentViewController _suspendAuthentication](self, "_suspendAuthentication");
  -[PKAuthenticator invalidate](self->_authenticator, "invalidate");
}

- (BOOL)paymentAuthorizationStateMachine:(id)a3 didTransitionFromState:(unint64_t)a4 toState:(unint64_t)a5 withParam:(id)a6
{
  id v9;
  id v10;

  v9 = a3;
  v10 = a6;
  switch(a5)
  {
    case 3uLL:
      -[PKContinuityPaymentViewController _invalidPaymentDataWithParam:](self, "_invalidPaymentDataWithParam:", v10);
      break;
    case 5uLL:
      -[PKContinuityPaymentViewController _resumeAuthenticationWithPreviousError:](self, "_resumeAuthenticationWithPreviousError:", v10);
      break;
    case 6uLL:
      -[PKContinuityPaymentViewController _suspendAuthentication](self, "_suspendAuthentication");
      break;
    case 7uLL:
      -[PKContinuityPaymentViewController _processClientCallback:](self, "_processClientCallback:", v10);
      break;
    case 9uLL:
      -[PKContinuityPaymentViewController setProgressState:string:animated:](self, "setProgressState:string:animated:", 11, 0, 1);
      break;
    case 0xDuLL:
      -[PKContinuityPaymentViewController _didCancel](self, "_didCancel");
      break;
    case 0xEuLL:
      -[PKContinuityPaymentViewController _didFailWithError:](self, "_didFailWithError:", v10);
      break;
    case 0xFuLL:
      -[PKContinuityPaymentViewController _didFailWithFatalError:](self, "_didFailWithFatalError:", v10);
      break;
    case 0x10uLL:
      -[PKContinuityPaymentViewController _didSucceedWithAuthorizationStateParam:](self, "_didSucceedWithAuthorizationStateParam:", v10);
      break;
    default:
      break;
  }

  return 1;
}

- (void)_processClientCallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  id v18;

  v18 = a3;
  -[PKContinuityPaymentViewController _suspendAuthentication](self, "_suspendAuthentication");
  switch(objc_msgSend(v18, "kind"))
  {
    case 1:
      v4 = objc_alloc(MEMORY[0x1E0D67280]);
      -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "paymentSummaryItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v4, "initWithPaymentSummaryItems:", v6);

      -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "paymentRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "availableShippingMethods");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAvailableShippingMethods:", v10);

      -[PKPaymentAuthorizationStateMachine didReceiveShippingContactCompleteWithUpdate:](self->_stateMachine, "didReceiveShippingContactCompleteWithUpdate:", v7);
      goto LABEL_7;
    case 2:
      v7 = objc_alloc_init(MEMORY[0x1E0D67288]);
      objc_msgSend(v7, "setStatus:", 0);
      -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "paymentSummaryItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPaymentSummaryItems:", v12);

      -[PKPaymentAuthorizationStateMachine didReceiveShippingMethodCompleteWithUpdate:](self->_stateMachine, "didReceiveShippingMethodCompleteWithUpdate:", v7);
      goto LABEL_7;
    case 3:
      v7 = objc_alloc_init(MEMORY[0x1E0D67278]);
      -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "paymentSummaryItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPaymentSummaryItems:", v14);

      -[PKPaymentAuthorizationStateMachine didReceivePaymentMethodCompleteWithUpdate:](self->_stateMachine, "didReceivePaymentMethodCompleteWithUpdate:", v7);
      goto LABEL_7;
    case 5:
      -[PKContinuityPaymentViewController delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "payment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "authorizationDidAuthorizePayment:", v15);

      goto LABEL_7;
    case 10:
      v7 = objc_alloc_init(MEMORY[0x1E0D67268]);
      -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "paymentSummaryItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPaymentSummaryItems:", v17);

      -[PKPaymentAuthorizationStateMachine didReceiveCouponCodeCompleteWithUpdate:](self->_stateMachine, "didReceiveCouponCodeCompleteWithUpdate:", v7);
LABEL_7:

      break;
    default:
      break;
  }

}

- (void)authorizationDidAuthorizePaymentCompleteWithResult:(id)a3
{
  -[PKPaymentAuthorizationStateMachine didReceivePaymentAuthorizationResult:](self->_stateMachine, "didReceivePaymentAuthorizationResult:", a3);
}

- (void)_resumeAuthenticationWithPreviousError:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int64_t v8;
  void *v9;
  int v10;
  PKContinuityPaymentViewController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(MEMORY[0x1E0D6BFD8], "currentStateForPolicy:", -[PKContinuityPaymentViewController _authenticatorPolicy](self, "_authenticatorPolicy"));
  v6 = v5;
  if ((v5 & 1) != 0)
  {
    if ((v5 & 6) != 0)
    {
      if (PKPearlIsAvailable())
        v8 = 3;
      else
        v8 = 0;
    }
    else if (PKUserIntentIsAvailable())
    {
      v8 = 3;
    }
    else
    {
      v8 = 4;
    }
    if (self->_authenticating)
      v8 = -[PKContinuityPaymentViewController _progressStateForAuthenticationWithBiometricFailure:](self, "_progressStateForAuthenticationWithBiometricFailure:", 0);
    if (v4)
    {
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_TRY_AGAIN"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    -[PKContinuityPaymentViewController setProgressState:string:animated:](self, "setProgressState:string:animated:", v8, v9, 1);
    -[PKContinuityPaymentViewController _startEvaluationWithHasInitialAuthenticatorState:initialAuthenticatorState:](self, "_startEvaluationWithHasInitialAuthenticatorState:initialAuthenticatorState:", 1, v6);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134349056;
      v11 = self;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKContinuityPaymentViewController (%{public}p): Unable to evaluate policy; cancelling payment",
        (uint8_t *)&v10,
        0xCu);
    }

    -[PKPaymentAuthorizationStateMachine didCancel](self->_stateMachine, "didCancel");
  }

}

- (void)_suspendAuthentication
{
  if (self->_authenticating)
  {
    -[PKAuthenticator cancelEvaluationWithOptions:](self->_authenticator, "cancelEvaluationWithOptions:", 1);
    -[PKContinuityPaymentViewController _setAuthenticating:](self, "_setAuthenticating:", 0);
  }
}

- (void)_startEvaluationWithHasInitialAuthenticatorState:(BOOL)a3 initialAuthenticatorState:(unint64_t)a4
{
  _BOOL8 v5;
  PKAuthenticator *authenticator;
  void *v8;
  _QWORD v9[5];
  id v10;
  id location;

  if (!self->_authenticating)
  {
    v5 = a3;
    -[PKContinuityPaymentViewController _setAuthenticating:](self, "_setAuthenticating:", 1);
    objc_initWeak(&location, self);
    authenticator = self->_authenticator;
    -[PKContinuityPaymentViewController _evaluationRequestWithHasInitialAuthenticatorState:initialAuthenticatorState:](self, "_evaluationRequestWithHasInitialAuthenticatorState:initialAuthenticatorState:", v5, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __112__PKContinuityPaymentViewController__startEvaluationWithHasInitialAuthenticatorState_initialAuthenticatorState___block_invoke;
    v9[3] = &unk_1E3E62F78;
    v9[4] = self;
    objc_copyWeak(&v10, &location);
    -[PKAuthenticator evaluateRequest:withCompletion:](authenticator, "evaluateRequest:withCompletion:", v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __112__PKContinuityPaymentViewController__startEvaluationWithHasInitialAuthenticatorState_initialAuthenticatorState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[5];
  id v6;
  id v7;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__PKContinuityPaymentViewController__startEvaluationWithHasInitialAuthenticatorState_initialAuthenticatorState___block_invoke_2;
  block[3] = &unk_1E3E62F50;
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v7);

}

void __112__PKContinuityPaymentViewController__startEvaluationWithHasInitialAuthenticatorState_initialAuthenticatorState___block_invoke_2(id *a1)
{
  uint64_t v2;
  id WeakRetained;
  NSObject *v4;
  const char *v5;
  char IsAuthentication;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "_setAuthenticating:", 0);
  v2 = objc_msgSend(a1[5], "result");
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  switch(v2)
  {
    case 0:
      objc_msgSend(*((id *)a1[4] + 147), "state");
      IsAuthentication = PKPaymentAuthorizationStateIsAuthentication();
      PKLogFacilityTypeGetObject();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if ((IsAuthentication & 1) != 0)
      {
        if (v8)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Authentication successful.", buf, 2u);
        }

        if (objc_msgSend(a1[5], "biometricMatch"))
        {
          objc_msgSend(MEMORY[0x1E0D6BFF0], "invokeSuccessFeedback");
          objc_msgSend(a1[4], "setProgressState:string:animated:", 8, 0, 1);
        }
        v9 = a1[5];
        v10 = (void *)*((_QWORD *)a1[4] + 147);
        objc_msgSend(v9, "credential");
        v7 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "didAuthenticateWithCredential:", v7);
      }
      else if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Authentication successful but in wrong state - discarding credential", buf, 2u);
      }

      break;
    case 1:
      PKLogFacilityTypeGetObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Authentication canceled by user.", buf, 2u);
      }

      objc_msgSend(*((id *)a1[4] + 147), "didResolveError");
      break;
    case 2:
    case 3:
    case 6:
      PKLogFacilityTypeGetObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_WORD *)buf = 0;
      v5 = "Authentication canceled by app.";
      goto LABEL_21;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v4 = objc_claimAutoreleasedReturnValue();
      -[NSObject processName](v4, "processName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[NSObject processIdentifier](v4, "processIdentifier");
      PKLogFacilityTypeGetObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v35 = v12;
        v36 = 2048;
        v37 = v13;
        _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Authentication by %@[%ld] preempted by another process.", buf, 0x16u);
      }

      v15 = (void *)MEMORY[0x1E0D67098];
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0D6A758];
      v32 = CFSTR("PKAuthenticatorResult");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, -1, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "paramWithError:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_didFailWithFatalError:", v21);

      goto LABEL_22;
    case 5:
      PKLogFacilityTypeGetObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = 0;
        _os_log_impl(&dword_19D178000, v22, OS_LOG_TYPE_DEFAULT, "Failed to authenticate for e-commerce: %@", buf, 0xCu);
      }

      v23 = (void *)MEMORY[0x1E0D67098];
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0D6A758];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 5, CFSTR("PKAuthenticatorResult"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, -1, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "paramWithError:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_didFailWithError:", v29);

      break;
    case 7:
      PKLogFacilityTypeGetObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v5 = "Authentication selected fallback - this is not supported.";
LABEL_21:
        _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
      }
LABEL_22:

      break;
    default:
      break;
  }

}

- (int64_t)_authenticatorPolicy
{
  void *v2;
  int64_t v3;

  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "pinRequired"))
    v3 = 3;
  else
    v3 = 2;

  return v3;
}

- (id)_evaluationRequestWithHasInitialAuthenticatorState:(BOOL)a3 initialAuthenticatorState:(unint64_t)a4
{
  _BOOL4 v5;
  unint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  __CFString *v21;
  uint64_t v22;

  v5 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v7 = -[PKContinuityPaymentViewController _authenticatorPolicy](self, "_authenticatorPolicy");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6BFE0]), "initWithPolicy:", v7);
  v9 = v8;
  if (v5)
    objc_msgSend(v8, "setInitialAuthenticatorState:", a4);
  PKLogFacilityTypeGetObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v7 > 0xA)
      v11 = 0;
    else
      v11 = off_1E3E63030[v7];
    *(_DWORD *)buf = 138412290;
    v21 = v11;
    _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "New authenticator policy is %@", buf, 0xCu);
  }

  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "pinRequired");

  if (v13)
  {
    -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_PIN_CODE_PROMPT_FMT"), CFSTR("%@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setPINTitle:", v17);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0D69D18]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPINLength:", v18);

  }
  return v9;
}

- (void)_didSucceedWithAuthorizationStateParam:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  _QWORD v16[4];
  id v17;
  id location;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0D672B0]);
  objc_msgSend(v14, "pendingTransactions");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[PKContinuityPaymentViewController _updatePendingTransaction:withAuthorizationStateParam:](self, "_updatePendingTransaction:withAuthorizationStateParam:", v9, v4, v14);
        objc_msgSend(v9, "transaction");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "paymentApplication");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "pass");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uniqueID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:", v10, v13, v11, 0);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__PKContinuityPaymentViewController__didSucceedWithAuthorizationStateParam___block_invoke;
  v16[3] = &unk_1E3E61C58;
  objc_copyWeak(&v17, &location);
  -[PKContinuityPaymentViewController setProgressState:string:animated:withCompletion:](self, "setProgressState:string:animated:withCompletion:", 12, 0, 1, v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __76__PKContinuityPaymentViewController__didSucceedWithAuthorizationStateParam___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 1200000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PKContinuityPaymentViewController__didSucceedWithAuthorizationStateParam___block_invoke_2;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

void __76__PKContinuityPaymentViewController__didSucceedWithAuthorizationStateParam___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 150);
    objc_msgSend(v2, "authorizationDidFinishWithError:", 0);

    WeakRetained = v3;
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

- (void)_didFailWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  int v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v5;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "In-app payment failed, error: %@", buf, 0xCu);
  }

  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6A758]))
  {
    v8 = objc_msgSend(v5, "code") == -2007;

    if (v8)
    {
      objc_msgSend(v5, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB3388]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "code");
      v13 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D6B0B8]);
      if (v12 == 2)
        v14 = v13;
      else
        v14 = 0;
      if (v14 == 1)
      {
        PKLocalizedPaymentString(CFSTR("WEB_PAYMENT_ERROR_NOT_AVAILABLE_TITLE"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v15, 0, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addAction:", v19);

        -[PKContinuityPaymentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);
      }
      else
      {
        v24 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D6BCB8]);
        if (v12 == 4)
          v25 = v24;
        else
          v25 = 0;
        if (v25 == 1)
        {
          PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_NOT_COMPLETED"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
      }
      v23 = 0;
LABEL_23:

      -[PKContinuityPaymentViewController _suspendAuthentication](self, "_suspendAuthentication");
      if (v23)
        goto LABEL_16;
      goto LABEL_12;
    }
  }
  else
  {

  }
  -[PKContinuityPaymentViewController _suspendAuthentication](self, "_suspendAuthentication");
LABEL_12:
  objc_msgSend(v5, "localizedFailureReason");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_NOT_COMPLETED"));
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = v22;

LABEL_16:
  objc_initWeak((id *)buf, self);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __55__PKContinuityPaymentViewController__didFailWithError___block_invoke;
  v26[3] = &unk_1E3E61C58;
  objc_copyWeak(&v27, (id *)buf);
  -[PKContinuityPaymentViewController setProgressState:string:animated:withCompletion:](self, "setProgressState:string:animated:withCompletion:", 13, v23, 1, v26);
  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);

}

void __55__PKContinuityPaymentViewController__didFailWithError___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 1200000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PKContinuityPaymentViewController__didFailWithError___block_invoke_2;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

void __55__PKContinuityPaymentViewController__didFailWithError___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[147], "didResolveError");
    WeakRetained = v2;
  }

}

- (void)_didFailWithFatalError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  id v20;
  void *v21;
  id v22;
  void *v23;
  PKContinuityPaymentViewController *val;
  _QWORD v25[4];
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  -[PKContinuityPaymentViewController _suspendAuthentication](self, "_suspendAuthentication");
  val = self;
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pass");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v23, "hasAssociatedPeerPaymentAccount") & 1) != 0
    || (objc_msgSend(v23, "associatedAccountServiceAccountIdentifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[PKPaymentAuthorizationStateMachine model](val->_stateMachine, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mode");

    if (v7 == 1)
    {
      -[PKPaymentAuthorizationStateMachine model](val->_stateMachine, "model");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc_init(MEMORY[0x1E0D672B0]);
      objc_msgSend(v21, "pendingTransactions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v29 != v11)
              objc_enumerationMutation(v9);
            v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v13, "transaction", v21);
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
              v33 = v14;
              v34 = 2112;
              v35 = v17;
              v36 = 2112;
              v37 = v15;
              _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "Inserting transaction: %@ for pass: %@ paymentApplication: %@", buf, 0x20u);
            }

            objc_msgSend(v8, "insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:", v14, v17, v15, 0);
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
        }
        while (v10);
      }

    }
  }
  objc_initWeak((id *)buf, val);
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_NOT_COMPLETED"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __60__PKContinuityPaymentViewController__didFailWithFatalError___block_invoke;
  v25[3] = &unk_1E3E62FA0;
  objc_copyWeak(&v27, (id *)buf);
  v20 = v22;
  v26 = v20;
  -[PKContinuityPaymentViewController setProgressState:string:animated:withCompletion:](val, "setProgressState:string:animated:withCompletion:", 13, v19, 1, v25);

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);

}

void __60__PKContinuityPaymentViewController__didFailWithFatalError___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = dispatch_time(0, 1200000000);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__PKContinuityPaymentViewController__didFailWithFatalError___block_invoke_2;
  v3[3] = &unk_1E3E61B68;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], v3);

  objc_destroyWeak(&v5);
}

void __60__PKContinuityPaymentViewController__didFailWithFatalError___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 150);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "authorizationDidFinishWithError:", v4);

    WeakRetained = v5;
  }

}

- (void)_didCancel
{
  id v3;

  -[PKContinuityPaymentViewController _suspendAuthentication](self, "_suspendAuthentication");
  -[PKContinuityPaymentViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authorizationDidFinishWithError:", 0);

}

- (void)_invalidPaymentDataWithParam:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;
  id location;

  v4 = a3;
  -[PKContinuityPaymentViewController _suspendAuthentication](self, "_suspendAuthentication");
  v5 = objc_msgSend(v4, "dataType") != 3 || objc_msgSend(v4, "status") != 5;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedFailureReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PKContinuityPaymentViewController__invalidPaymentDataWithParam___block_invoke;
  v8[3] = &unk_1E3E62FC8;
  v10 = v5;
  objc_copyWeak(&v9, &location);
  -[PKContinuityPaymentViewController setProgressState:string:animated:withCompletion:](self, "setProgressState:string:animated:withCompletion:", 13, v7, 1, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __66__PKContinuityPaymentViewController__invalidPaymentDataWithParam___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  if (*(_BYTE *)(a1 + 40))
  {
    v2 = dispatch_time(0, 1200000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__PKContinuityPaymentViewController__invalidPaymentDataWithParam___block_invoke_2;
    block[3] = &unk_1E3E61310;
    objc_copyWeak(&v4, (id *)(a1 + 32));
    dispatch_after(v2, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v4);
  }
}

void __66__PKContinuityPaymentViewController__invalidPaymentDataWithParam___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_resumeAuthenticationWithPreviousError:", 0);
    objc_msgSend(v2[147], "didResolveError");
    WeakRetained = v2;
  }

}

- (BOOL)paymentPass:(id *)a3 paymentApplication:(id *)a4 fromAID:(id)a5 selectedPaymentMethodType:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v29;
  id *v30;
  id *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  -[PKPaymentAuthorizationStateMachine model](self->_stateMachine, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v11, "acceptedPasses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v33)
  {
    v30 = a3;
    v31 = a4;
    v13 = *(_QWORD *)v41;
    v32 = v11;
    v35 = v12;
    v29 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v12);
        v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v15, "deviceInAppPaymentApplications");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "allObjects");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v15;
        objc_msgSend(v15, "sortedPaymentApplications:ascending:", v17, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v37;
          while (2)
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v37 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
              objc_msgSend(v24, "applicationIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v25, "isEqualToString:", v10))
              {
                if (!a6)
                {

LABEL_23:
                  *v30 = objc_retainAutorelease(v34);
                  *v31 = objc_retainAutorelease(v24);

                  v27 = 1;
                  v11 = v32;
                  v12 = v35;
                  goto LABEL_24;
                }
                v26 = objc_msgSend(v24, "paymentType");

                if (v26 == a6)
                  goto LABEL_23;
              }
              else
              {

              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            if (v21)
              continue;
            break;
          }
        }

        v12 = v35;
        v13 = v29;
      }
      v27 = 0;
      v11 = v32;
      v33 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v33);
  }
  else
  {
    v27 = 0;
  }
LABEL_24:

  return v27;
}

- (int64_t)_progressStateForAuthenticationWithBiometricFailure:(BOOL)a3
{
  int64_t result;
  int64_t internalAuthenticationEvaluationState;
  int64_t coachingState;
  int64_t v7;

  result = PKPaymentProgressStateBaseStateForAuthenticatorEvaluationState(self->_internalAuthenticationEvaluationState, -[PKPaymentAuthorizationFooterView state](self->_authorizationView, "state"), self->_idleStateIsPasscode, a3);
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
  coachingState = self->_coachingState;
  v7 = 6;
  if (coachingState != 4)
    v7 = result;
  if (coachingState == 3)
    return 4;
  else
    return v7;
}

- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4
{
  int64_t var1;
  int64_t var0;
  BOOL v7;

  var1 = a4.var1;
  var0 = a4.var0;
  if (PKPearlIsAvailable())
  {
    v7 = var1 == 1 || (unint64_t)(self->_internalAuthenticationEvaluationState - 1) < 2;
    self->_idleStateIsPasscode = v7;
  }
  else
  {
    self->_idleStateIsPasscode = 0;
  }
  self->_internalAuthenticationEvaluationState = var0;
  -[PKContinuityPaymentViewController _updateProgressStateIfAuthenticatingWithBiometricFailure:](self, "_updateProgressStateIfAuthenticatingWithBiometricFailure:", var1 == 1);
}

- (void)authenticator:(id)a3 didTransitionToCoachingState:(int64_t)a4
{
  if (self->_internalCoachingState != a4)
  {
    self->_internalCoachingState = a4;
    -[PKContinuityPaymentViewController _updateCoachingState](self, "_updateCoachingState", a3);
  }
}

- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  id v10;
  UIViewController *passcodeViewController;
  _QWORD v12[4];
  void (**v13)(id, uint64_t);

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
    -[PKContinuityPaymentViewController _setPasscodeViewController:](self, "_setPasscodeViewController:", v8);
    -[UIViewController setModalPresentationStyle:](self->_passcodeViewController, "setModalPresentationStyle:", 5);
    passcodeViewController = self->_passcodeViewController;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __91__PKContinuityPaymentViewController_presentPasscodeViewController_completionHandler_reply___block_invoke;
    v12[3] = &unk_1E3E61590;
    v13 = v9;
    -[PKContinuityPaymentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", passcodeViewController, 1, v12);

  }
  else if (v9)
  {
    v9[2](v9, 0);
  }

}

uint64_t __91__PKContinuityPaymentViewController_presentPasscodeViewController_completionHandler_reply___block_invoke(uint64_t a1)
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

    -[PKContinuityPaymentViewController _setPasscodeViewController:](self, "_setPasscodeViewController:", 0);
  }
}

- (void)presentPassphraseViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIViewController *passphraseViewController;
  _QWORD v17[4];
  void (**v18)(id, uint64_t);

  v8 = a3;
  v9 = (void (**)(id, uint64_t))a4;
  v10 = a5;
  if (self->_passphraseViewController)
  {
    if (v9)
      v9[2](v9, 1);
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v8);
    objc_msgSend(v11, "setModalPresentationStyle:", 6);
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v13);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelPassphrasePressed);
    objc_msgSend(v8, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRightBarButtonItem:", v14);

    -[PKContinuityPaymentViewController _setPassphraseViewController:](self, "_setPassphraseViewController:", v11);
    passphraseViewController = self->_passphraseViewController;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __93__PKContinuityPaymentViewController_presentPassphraseViewController_completionHandler_reply___block_invoke;
    v17[3] = &unk_1E3E61590;
    v18 = v9;
    -[PKContinuityPaymentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", passphraseViewController, 1, v17);

  }
}

uint64_t __93__PKContinuityPaymentViewController_presentPassphraseViewController_completionHandler_reply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)dismissPassphraseViewController
{
  UIViewController *passphraseViewController;
  void *v4;

  -[PKPaymentAuthorizationStateMachine state](self->_stateMachine, "state");
  if ((PKPaymentAuthorizationStateIsTerminal() & 1) == 0)
  {
    passphraseViewController = self->_passphraseViewController;
    if (passphraseViewController)
    {
      -[UIViewController presentingViewController](passphraseViewController, "presentingViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

      -[PKContinuityPaymentViewController _setPassphraseViewController:](self, "_setPassphraseViewController:", 0);
    }
  }
}

- (void)authorizationFooterViewPasscodeButtonPressed:(id)a3
{
  if (-[PKPaymentAuthorizationStateMachine state](self->_stateMachine, "state", a3) == 5)
  {
    if (self->_authenticating)
      -[PKAuthenticator fallbackToSystemPasscodeUI](self->_authenticator, "fallbackToSystemPasscodeUI");
    else
      -[PKContinuityPaymentViewController _startEvaluationWithHasInitialAuthenticatorState:initialAuthenticatorState:](self, "_startEvaluationWithHasInitialAuthenticatorState:initialAuthenticatorState:", 0, 0);
  }
}

- (void)authorizationFooterViewDidChangeConstraints:(id)a3
{
  id v4;
  BOOL v5;
  id v6;

  v4 = a3;
  if (self->_viewAppeared)
  {
    v6 = v4;
    v5 = -[PKContinuityPaymentViewController _updateActiveConstraints](self, "_updateActiveConstraints");
    v4 = v6;
    if (!v5)
    {
      -[PKContinuityPaymentViewController _layoutAnimated](self, "_layoutAnimated");
      v4 = v6;
    }
  }

}

- (PKPaymentAuthorizationHostProtocol)delegate
{
  return (PKPaymentAuthorizationHostProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKRemotePaymentRequest)remoteRequest
{
  return self->_remoteRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_compactConstraints, 0);
  objc_storeStrong((id *)&self->_defaultConstraints, 0);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_passphraseViewController, 0);
  objc_storeStrong((id *)&self->_passcodeViewController, 0);
  objc_storeStrong((id *)&self->_faviconImage, 0);
  objc_storeStrong((id *)&self->_authorizationView, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_summaryContainerView, 0);
  objc_storeStrong((id *)&self->_priceView, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_priceLabel, 0);
  objc_storeStrong((id *)&self->_requestingSiteLabel, 0);
  objc_storeStrong((id *)&self->_requestingDeviceLabel, 0);
  objc_storeStrong((id *)&self->_physicalButtonView, 0);
  objc_storeStrong((id *)&self->_compactRegion, 0);
  objc_storeStrong((id *)&self->_dimmingBackgroundView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
