@implementation PKVehicleInitiatedPairingViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (void)vehicleInitiatedPairingViewControllerForConfiguration:(id)a3 paymentService:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if ((objc_msgSend(v7, "ownerKeyPairingAvailable") & 1) == 0)
    v9[2](v9, 0);
  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __123__PKVehicleInitiatedPairingViewController_vehicleInitiatedPairingViewControllerForConfiguration_paymentService_completion___block_invoke;
  v14[3] = &unk_1E3E749C8;
  v16 = v8;
  v17 = v9;
  v15 = v7;
  v11 = v8;
  v12 = v7;
  v13 = v9;
  objc_msgSend(v10, "canAddCarKeyPassWithConfiguration:completion:", v12, v14);

}

void __123__PKVehicleInitiatedPairingViewController_vehicleInitiatedPairingViewControllerForConfiguration_paymentService_completion___block_invoke(id *a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  _QWORD aBlock[4];
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v8;
      v10 = "PKVehicleInitiatedPairingViewController: CarKey support check failed: %@";
LABEL_8:
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if ((a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = a1[4];
      *(_DWORD *)buf = 138412290;
      v26 = v15;
      v10 = "PKVehicleInitiatedPairingViewController: CarKey not supported for configuration: %@";
      goto LABEL_8;
    }
LABEL_9:

    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_10;
  }
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __123__PKVehicleInitiatedPairingViewController_vehicleInitiatedPairingViewControllerForConfiguration_paymentService_completion___block_invoke_15;
  aBlock[3] = &unk_1E3E61388;
  v23 = a1[5];
  v24 = a1[4];
  v12 = _Block_copy(aBlock);
  objc_msgSend(a1[4], "setReferralSource:", 3);
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __123__PKVehicleInitiatedPairingViewController_vehicleInitiatedPairingViewControllerForConfiguration_paymentService_completion___block_invoke_2;
  block[3] = &unk_1E3E749A0;
  v17 = v7;
  v13 = a1[4];
  v21 = 3;
  v18 = v13;
  v19 = v12;
  v20 = a1[6];
  v14 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], block);

LABEL_10:
}

void __123__PKVehicleInitiatedPairingViewController_vehicleInitiatedPairingViewControllerForConfiguration_paymentService_completion___block_invoke_15(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
    v3 = v2;
  else
    v3 = objc_alloc_init(MEMORY[0x1E0D672B0]);
  v5 = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67490]), "initWithCarKeyConfiguration:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "addPendingProvisioning:", v4);

}

void __123__PKVehicleInitiatedPairingViewController_vehicleInitiatedPairingViewControllerForConfiguration_paymentService_completion___block_invoke_2(uint64_t a1)
{
  PKVehicleInitiatedPairingViewController *v2;
  uint64_t v3;
  void *v4;
  PKVehicleInitiatedPairingViewController *v5;

  v2 = [PKVehicleInitiatedPairingViewController alloc];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "vehicleInitiatedPairingLaunchURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKVehicleInitiatedPairingViewController initWithSupportedTerminal:launchURL:referralSource:didDismiss:](v2, "initWithSupportedTerminal:launchURL:referralSource:didDismiss:", v3, v4, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (PKVehicleInitiatedPairingViewController)initWithSupportedTerminal:(id)a3 launchURL:(id)a4 referralSource:(unint64_t)a5 didDismiss:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKVehicleInitiatedPairingViewController *v13;
  PKVehicleInitiatedPairingViewController *v14;
  void *v15;
  id didDismiss;
  uint64_t v17;
  NSString *partnerIdentifier;
  void *v19;
  PRXLabel *v20;
  PRXLabel *subtitleLabel;
  PRXLabel *v22;
  void *v23;
  PRXLabel *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  PRXAction *placeholderAction;
  id v36;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  id location;
  objc_super v43;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v43.receiver = self;
  v43.super_class = (Class)PKVehicleInitiatedPairingViewController;
  v13 = -[PKVehicleInitiatedPairingViewController init](&v43, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_launchURL, a4);
    v14->_referralSource = a5;
    v15 = _Block_copy(v12);
    didDismiss = v14->_didDismiss;
    v14->_didDismiss = v15;

    objc_msgSend(v10, "partnerIdentifier");
    v17 = objc_claimAutoreleasedReturnValue();
    partnerIdentifier = v14->_partnerIdentifier;
    v14->_partnerIdentifier = (NSString *)v17;

    PKLocalizedCredentialString(CFSTR("VEHICLE_INITIATED_PAIRING_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKVehicleInitiatedPairingViewController setTitle:](v14, "setTitle:", v19);

    v20 = (PRXLabel *)objc_alloc_init(MEMORY[0x1E0D83150]);
    subtitleLabel = v14->_subtitleLabel;
    v14->_subtitleLabel = v20;

    -[PRXLabel setNumberOfLines:](v14->_subtitleLabel, "setNumberOfLines:", 0);
    v22 = v14->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 15.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXLabel setFont:](v22, "setFont:", v23);

    -[PRXLabel setTextAlignment:](v14->_subtitleLabel, "setTextAlignment:", 1);
    v24 = v14->_subtitleLabel;
    PKLocalizedCredentialString(CFSTR("VEHICLE_INITIATED_PAIRING_SUBTITLE"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXLabel setText:](v24, "setText:", v25);

    -[PKVehicleInitiatedPairingViewController contentView](v14, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSubtitleLabel:", v14->_subtitleLabel);

    -[PKVehicleInitiatedPairingViewController setDismissalType:](v14, "setDismissalType:", 3);
    objc_initWeak(&location, v14);
    v27 = (void *)MEMORY[0x1E0D83140];
    PKLocalizedCredentialString(CFSTR("CAR_KEY_ENTER_CODE_ACTION"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __105__PKVehicleInitiatedPairingViewController_initWithSupportedTerminal_launchURL_referralSource_didDismiss___block_invoke;
    v40[3] = &unk_1E3E749F0;
    objc_copyWeak(&v41, &location);
    objc_msgSend(v27, "actionWithTitle:style:handler:", v28, 0, v40);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (id)-[PKVehicleInitiatedPairingViewController addAction:](v14, "addAction:", v30);

    v32 = (void *)MEMORY[0x1E0D83140];
    v38[0] = v29;
    v38[1] = 3221225472;
    v38[2] = __105__PKVehicleInitiatedPairingViewController_initWithSupportedTerminal_launchURL_referralSource_didDismiss___block_invoke_2;
    v38[3] = &unk_1E3E749F0;
    objc_copyWeak(&v39, &location);
    objc_msgSend(v32, "actionWithTitle:style:handler:", &stru_1E3E7D690, 0, v38);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKVehicleInitiatedPairingViewController setDismissButtonAction:](v14, "setDismissButtonAction:", v33);

    objc_msgSend(MEMORY[0x1E0D83140], "actionWithTitle:style:handler:", &stru_1E3E7D690, 1, &__block_literal_global_173);
    v34 = objc_claimAutoreleasedReturnValue();
    placeholderAction = v14->_placeholderAction;
    v14->_placeholderAction = (PRXAction *)v34;

    v36 = (id)-[PKVehicleInitiatedPairingViewController addAction:](v14, "addAction:", v14->_placeholderAction);
    -[PKVehicleInitiatedPairingViewController _configureLinkedApplicationForTerminal:](v14, "_configureLinkedApplicationForTerminal:", v10);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __105__PKVehicleInitiatedPairingViewController_initWithSupportedTerminal_launchURL_referralSource_didDismiss___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleEnterCode");

}

void __105__PKVehicleInitiatedPairingViewController_initWithSupportedTerminal_launchURL_referralSource_didDismiss___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)loadView
{
  UILabel *v3;
  UILabel *bodyLabel;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  UIImageView *v13;
  UIImageView *artworkView;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKVehicleInitiatedPairingViewController;
  -[PKVehicleInitiatedPairingViewController loadView](&v17, sel_loadView);
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  bodyLabel = self->_bodyLabel;
  self->_bodyLabel = v3;

  -[UILabel setNumberOfLines:](self->_bodyLabel, "setNumberOfLines:", 0);
  v5 = self->_bodyLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 15.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v5, "setFont:", v6);

  PKLocalizedCredentialString(CFSTR("VEHICLE_INITIATED_PAIRING_BODY_PLACEHOLDER"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_referralSource != 2)
  {
    PKLocalizedCredentialString(CFSTR("VEHICLE_INITIATED_PAIRING_WALLET_REMINDERS"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" %@"), v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  -[UILabel setText:](self->_bodyLabel, "setText:", v7);
  -[UILabel setTextAlignment:](self->_bodyLabel, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_bodyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = (void *)MEMORY[0x1E0DC3870];
  PKPassKitUIBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageNamed:inBundle:", CFSTR("CarKeyVehicleInitiated"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v12);
  artworkView = self->_artworkView;
  self->_artworkView = v13;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_artworkView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PKVehicleInitiatedPairingViewController contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self->_bodyLabel);

  -[PKVehicleInitiatedPairingViewController contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", self->_artworkView);

  -[PKVehicleInitiatedPairingViewController _updateViewState](self, "_updateViewState");
}

- (void)updateViewConstraints
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSArray *v38;
  NSArray *layoutConstraints;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  objc_super v55;
  _QWORD v56[13];

  v56[11] = *MEMORY[0x1E0C80C00];
  v55.receiver = self;
  v55.super_class = (Class)PKVehicleInitiatedPairingViewController;
  -[PKVehicleInitiatedPairingViewController updateViewConstraints](&v55, sel_updateViewConstraints);
  if (!self->_layoutConstraints)
  {
    -[UIImageView image](self->_artworkView, "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "size");
    v5 = v4;
    v7 = v6;

    -[PKVehicleInitiatedPairingViewController contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mainContentGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PRXLabel widthAnchor](self->_subtitleLabel, "widthAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "widthAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:multiplier:", v11, 0.85);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = v12;
    LODWORD(v13) = 1148829696;
    objc_msgSend(v12, "setPriority:", v13);
    -[UILabel widthAnchor](self->_bodyLabel, "widthAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "widthAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:multiplier:", v15, 0.85);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = v16;
    LODWORD(v17) = 1148829696;
    objc_msgSend(v16, "setPriority:", v17);
    -[UIImageView widthAnchor](self->_artworkView, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "widthAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:multiplier:", v19, 0.37);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v20) = 1148829696;
    objc_msgSend(v54, "setPriority:", v20);
    -[UIImageView bottomAnchor](self->_artworkView, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -20.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v24) = 1148813312;
    v45 = v23;
    objc_msgSend(v23, "setPriority:", v24);
    -[UIImageView bottomAnchor](self->_artworkView, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintLessThanOrEqualToAnchor:constant:", v26, -20.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v27;
    v44 = v27;
    LODWORD(v29) = 1148829696;
    objc_msgSend(v27, "setPriority:", v29);
    v56[0] = v12;
    -[PRXLabel centerXAnchor](self->_subtitleLabel, "centerXAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerXAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v49;
    -[UILabel topAnchor](self->_bodyLabel, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 0.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v56[2] = v46;
    v56[3] = v16;
    -[UILabel centerXAnchor](self->_bodyLabel, "centerXAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerXAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v56[4] = v41;
    -[UIImageView topAnchor](self->_artworkView, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_bodyLabel, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v30, 30.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v56[5] = v31;
    v56[6] = v23;
    v56[7] = v28;
    v56[8] = v54;
    -[UIImageView heightAnchor](self->_artworkView, "heightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView widthAnchor](self->_artworkView, "widthAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:multiplier:", v33, v7 / v5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v56[9] = v34;
    -[UIImageView centerXAnchor](self->_artworkView, "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerXAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v56[10] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 11);
    v38 = (NSArray *)objc_claimAutoreleasedReturnValue();
    layoutConstraints = self->_layoutConstraints;
    self->_layoutConstraints = v38;

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_layoutConstraints);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  PKProvisioningAnalyticsSession *v6;
  PKProvisioningAnalyticsSession *analyticsSession;
  id v8;
  id v9;
  PKProvisioningAnalyticsSessionUIReporter *v10;
  PKProvisioningAnalyticsSessionUIReporter *reporter;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKVehicleInitiatedPairingViewController;
  -[PKVehicleInitiatedPairingViewController viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  v4 = (void *)MEMORY[0x1E0D67530];
  PKSubcredentialPairingReferralSourceToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startAnalyticsSessionForEnvironment:intent:referralSource:", CFSTR("first_party.wallet"), CFSTR("provision"), v5);
  v6 = (PKProvisioningAnalyticsSession *)objc_claimAutoreleasedReturnValue();
  analyticsSession = self->_analyticsSession;
  self->_analyticsSession = v6;

  -[PKProvisioningAnalyticsSession setProductType:subtype:](self->_analyticsSession, "setProductType:subtype:", *MEMORY[0x1E0D69498], CFSTR("cars"));
  v8 = objc_alloc_init(MEMORY[0x1E0D67310]);
  v9 = objc_alloc_init(MEMORY[0x1E0D67320]);
  objc_msgSend(v9, "setType:", 11);
  objc_msgSend(v9, "setPartnerIdentifier:", self->_partnerIdentifier);
  objc_msgSend(v9, "setProductIdentifier:", *MEMORY[0x1E0D6B000]);
  objc_msgSend(v8, "setConfiguration:", v9);
  -[PKProvisioningAnalyticsSession setSetupProduct:](self->_analyticsSession, "setSetupProduct:", v8);
  -[PKProvisioningAnalyticsSession createViewReporterForPage:](self->_analyticsSession, "createViewReporterForPage:", *MEMORY[0x1E0D69718]);
  v10 = (PKProvisioningAnalyticsSessionUIReporter *)objc_claimAutoreleasedReturnValue();
  reporter = self->_reporter;
  self->_reporter = v10;

  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)_configureLinkedApplicationForTerminal:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  PKLinkedApplication *v12;
  PKLinkedApplication *linkedApplication;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "associatedApplicationIdentifiers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "integerValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = -[PKLinkedApplication initWithStoreIDs:defaultLaunchURL:]([PKLinkedApplication alloc], "initWithStoreIDs:defaultLaunchURL:", v5, 0);
  linkedApplication = self->_linkedApplication;
  self->_linkedApplication = v12;

  -[PKLinkedApplication addObserver:](self->_linkedApplication, "addObserver:", self);
  -[PKLinkedApplication reloadApplicationStateIfNecessary](self->_linkedApplication, "reloadApplicationStateIfNecessary");
  -[PKVehicleInitiatedPairingViewController showActivityIndicatorWithStatus:](self, "showActivityIndicatorWithStatus:", &stru_1E3E7D690);

}

- (void)_updateViewState
{
  PKLinkedApplication *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PRXAction *placeholderAction;
  _BOOL4 v13;
  __CFString *v14;
  NSString *v15;
  NSString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  if (-[PKVehicleInitiatedPairingViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = self->_linkedApplication;
    v4 = -[PKLinkedApplication state](v3, "state");
    if (v4)
    {
      v5 = v4;
      -[PKLinkedApplication displayName](v3, "displayName");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (__CFString *)v6;
      v8 = CFSTR("partner");
      if (v6)
        v8 = (const __CFString *)v6;
      PKLocalizedCredentialString(CFSTR("VEHICLE_INITIATED_PAIRING_BODY"), CFSTR("%@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_referralSource != 2)
      {
        PKLocalizedCredentialString(CFSTR("VEHICLE_INITIATED_PAIRING_WALLET_REMINDERS"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(" %@"), v10);
        v11 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v11;
      }
      -[UILabel setText:](self->_bodyLabel, "setText:", v9);
      if (self->_placeholderAction)
      {
        -[PKVehicleInitiatedPairingViewController removeAction:](self, "removeAction:");
        placeholderAction = self->_placeholderAction;
        self->_placeholderAction = 0;

        if (v5 == 1)
        {
          objc_initWeak(&location, self);
          v13 = -[PKLinkedApplication isInstalled](v3, "isInstalled");
          v14 = CFSTR("CAR_KEY_GET_PARTNER_APP_ACTION");
          if (v13)
            v14 = CFSTR("CAR_KEY_OPEN_PARTNER_APP_ACTION");
          v15 = v14;
          v16 = v15;
          v17 = CFSTR("Partner");
          if (v7)
            v17 = v7;
          PKLocalizedCredentialString(v15, CFSTR("%@"), v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)MEMORY[0x1E0D83140];
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __59__PKVehicleInitiatedPairingViewController__updateViewState__block_invoke;
          v22[3] = &unk_1E3E749F0;
          objc_copyWeak(&v23, &location);
          objc_msgSend(v19, "actionWithTitle:style:handler:", v18, 1, v22);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (id)-[PKVehicleInitiatedPairingViewController addAction:](self, "addAction:", v20);

          objc_destroyWeak(&v23);
          objc_destroyWeak(&location);
        }
        -[PKVehicleInitiatedPairingViewController hideActivityIndicator](self, "hideActivityIndicator");
      }

    }
  }
}

void __59__PKVehicleInitiatedPairingViewController__updateViewState__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleOpenApp");

}

- (void)linkedApplicationDidChangeState:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = objc_msgSend(v4, "state");
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKVehicleInitiatedPairingViewController: linkedApplicationDidChangeState: %ld", (uint8_t *)&v6, 0xCu);
  }

  if (objc_msgSend(v4, "state"))
    -[PKVehicleInitiatedPairingViewController _updateViewState](self, "_updateViewState");
  else
    objc_msgSend(v4, "reloadApplicationStateIfNecessary");

}

- (void)_handleEnterCode
{
  _QWORD v2[5];

  self->_exitedWithOtherDestination = 1;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __59__PKVehicleInitiatedPairingViewController__handleEnterCode__block_invoke;
  v2[3] = &unk_1E3E612E8;
  v2[4] = self;
  -[PKVehicleInitiatedPairingViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
}

void __59__PKVehicleInitiatedPairingViewController__handleEnterCode__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D22D88];
  v21[0] = *MEMORY[0x1E0D22DA8];
  v21[1] = v2;
  v22[0] = MEMORY[0x1E0C9AAB0];
  v22[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1064), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "archivedParentToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLBase64EncodedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "queryItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    v10 = objc_alloc(MEMORY[0x1E0CB39D8]);
    v11 = (void *)objc_msgSend(v10, "initWithName:value:", *MEMORY[0x1E0D6BB50], v7);
    objc_msgSend(v9, "addObject:", v11);

    objc_msgSend(v5, "setQueryItems:", v9);
  }
  objc_msgSend(v5, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v4, "openURL:withOptions:error:", v12, v3, &v16);
  v13 = v16;
  v14 = *(void **)(*(_QWORD *)(a1 + 32) + 1144);
  if (v13)
  {
    objc_msgSend(v14, "reportOtherError:context:", *MEMORY[0x1E0D68968], 0);
  }
  else
  {
    objc_msgSend(v14, "reportOtherButtonPressed:", *MEMORY[0x1E0D68960]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "stop");
  }
  PKLogFacilityTypeGetObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "PKVehicleInitiatedPairingViewController: Launched Wallet app with URL %@, error: %@", buf, 0x16u);
  }

}

- (void)_handleOpenApp
{
  PKLinkedApplication *v3;
  PKLinkedApplication *v4;
  NSObject *v5;
  _QWORD v6[5];
  PKLinkedApplication *v7;
  uint8_t buf[16];

  v3 = self->_linkedApplication;
  v4 = v3;
  if (v3)
  {
    self->_exitedWithOtherDestination = 1;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__PKVehicleInitiatedPairingViewController__handleOpenApp__block_invoke;
    v6[3] = &unk_1E3E61388;
    v6[4] = self;
    v7 = v3;
    -[PKVehicleInitiatedPairingViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v6);

  }
  else
  {
    -[PKProvisioningAnalyticsSessionUIReporter reportOtherError:context:](self->_reporter, "reportOtherError:context:", *MEMORY[0x1E0D68ED8], 0);
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKVehicleInitiatedPairingViewController: Failed to open, linkedApplication was nil.", buf, 2u);
    }

  }
}

uint64_t __57__PKVehicleInitiatedPairingViewController__handleOpenApp__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "reportOtherButtonPressed:", *MEMORY[0x1E0D68ED0]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "stop");
  return objc_msgSend(*(id *)(a1 + 40), "openApplication:withLaunchOptions:", 0, 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void (**didDismiss)(void);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKVehicleInitiatedPairingViewController;
  -[PKVehicleInitiatedPairingViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  didDismiss = (void (**)(void))self->_didDismiss;
  if (didDismiss)
    didDismiss[2]();
  if (!self->_exitedWithOtherDestination)
  {
    -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 2);
    -[PKProvisioningAnalyticsSession stop](self->_analyticsSession, "stop");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partnerIdentifier, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_analyticsSession, 0);
  objc_storeStrong(&self->_didDismiss, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_placeholderAction, 0);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
}

@end
