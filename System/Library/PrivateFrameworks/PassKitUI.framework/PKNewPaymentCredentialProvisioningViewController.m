@implementation PKNewPaymentCredentialProvisioningViewController

- (PKNewPaymentCredentialProvisioningViewController)initWithProvisioningController:(id)a3 webService:(id)a4 context:(int64_t)a5 paymentCredential:(id)a6 setupProduct:(id)a7 allowsManualEntry:(BOOL)a8 reporter:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  PKNewPaymentCredentialProvisioningViewController *v19;
  PKNewPaymentCredentialProvisioningViewController *v20;
  id *p_paymentCredential;
  char v22;
  char IsSetupAssistant;
  char IsExpressSetupAssistant;
  int v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  id v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  CGImageRef v63;
  CGImage *v64;
  UIImage *v65;
  UIImage *passSnapshot;
  UIImage *v67;
  id v68;
  void *v69;
  id v71;
  objc_super v72;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v71 = a7;
  v18 = a9;
  v72.receiver = self;
  v72.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
  v19 = -[PKPaymentSetupProvisioningFieldsViewController initWithProvisioningController:context:setupDelegate:](&v72, sel_initWithProvisioningController_context_setupDelegate_, v15, a5, 0);
  v20 = v19;
  if (!v19)
    goto LABEL_50;
  v68 = v18;
  objc_storeStrong((id *)&v19->_provisioningController, a3);
  objc_storeStrong((id *)&v20->_webService, a4);
  objc_msgSend(v15, "addDelegate:", v20);
  objc_storeStrong((id *)&v20->_setupProduct, a7);
  p_paymentCredential = (id *)&v20->_paymentCredential;
  objc_storeStrong((id *)&v20->_paymentCredential, a6);
  v22 = 1;
  v20->_displayType = 1;
  v20->_allowsManualEntry = a8;
  objc_storeStrong((id *)&v20->_reporter, a9);
  IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  IsExpressSetupAssistant = PKPaymentSetupContextIsExpressSetupAssistant();
  if ((objc_msgSend(v17, "isHomeKeyCredential") & 1) == 0)
  {
    if ((objc_msgSend(v17, "isShareableCredential") & 1) != 0
      || (objc_msgSend(v17, "isDigitalIssuanceProductCredential") & 1) != 0
      || (objc_msgSend(v17, "isSafariCredential") & 1) != 0
      || (objc_msgSend(v17, "isPrecursorCredential") & 1) != 0)
    {
      v22 = 1;
    }
    else
    {
      v22 = objc_msgSend(v17, "couldSupportSuperEasyProvisioning") & IsSetupAssistant | IsExpressSetupAssistant;
    }
  }
  v20->_shouldAutoProvision = v22;
  v25 = objc_msgSend(*p_paymentCredential, "isRemoteCredential", v68);
  v26 = *p_paymentCredential;
  if (!v25)
  {
    if (objc_msgSend(v26, "isHomeKeyCredential"))
    {
      v32 = 11;
LABEL_17:
      v20->_credentialProvisioningType = v32;
      v20->_displayType = 0;
      goto LABEL_42;
    }
    if (objc_msgSend(*p_paymentCredential, "isAppleBalanceCredential"))
    {
      v33 = 13;
      goto LABEL_20;
    }
    v34 = objc_msgSend(*p_paymentCredential, "isLocalPassCredential");
    v35 = *p_paymentCredential;
    if (v34)
    {
      objc_msgSend(v35, "localPassCredential");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "paymentPass");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "requiresTransferSerialNumberBasedProvisioning");

      if (!v38)
      {
        v20->_credentialProvisioningType = 0;
        goto LABEL_42;
      }
      v32 = 1;
      goto LABEL_17;
    }
    v39 = objc_msgSend(v35, "isDigitalIssuanceProductCredential");
    v40 = *p_paymentCredential;
    if (v39)
    {
      objc_msgSend(v40, "digitalIssuanceProductCredential");
      v41 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "metadata");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "count");

      if (v43)
        v20->_displayType = 2;
      v20->_credentialProvisioningType = 7;
      goto LABEL_64;
    }
    v45 = objc_msgSend(v40, "isPurchasedProductCredential");
    v46 = *p_paymentCredential;
    if (v45)
    {
      objc_msgSend(v46, "purchasedProductCredential");
      v41 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "purchase");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "state");
      v49 = 8;
      if (v48 == 3)
        v49 = 9;
      v20->_credentialProvisioningType = v49;

      objc_msgSend(v41, "metadata");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "count");

      if (v51)
      {
        v52 = 2;
LABEL_63:
        v20->_displayType = v52;
        goto LABEL_64;
      }
      if (v20->_credentialProvisioningType == 9)
      {
        v52 = 0;
        goto LABEL_63;
      }
    }
    else
    {
      if (!objc_msgSend(v46, "isIssuerProvisioningExtensionCredential"))
      {
        if (objc_msgSend(*p_paymentCredential, "isSafariCredential"))
        {
          v33 = 12;
        }
        else
        {
          if (objc_msgSend(*p_paymentCredential, "isPrecursorCredential"))
          {
            v32 = 14;
            goto LABEL_17;
          }
          v33 = 6;
        }
LABEL_20:
        v20->_credentialProvisioningType = v33;
        goto LABEL_42;
      }
      v20->_credentialProvisioningType = 10;
      v20->_displayType = 2;
      objc_msgSend(*p_paymentCredential, "issuerProvisioningExtensionCredential");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "entry");
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = objc_retainAutorelease(v62);
      v63 = CGImageRetain((CGImageRef)objc_msgSend(v41, "art"));
      if (v63)
      {
        v64 = v63;
        v65 = (UIImage *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", v63);
        CGImageRelease(v64);
        if (v65)
        {
          passSnapshot = v20->_passSnapshot;
          v20->_passSnapshot = v65;
          v67 = v65;

          v20->_passSnapshotNeedsCorners = 1;
          v20->_passSnapshotOverrideSize = (CGSize)DefaultSnapshotSize;

        }
      }
    }
LABEL_64:

    goto LABEL_42;
  }
  objc_msgSend(v26, "remoteCredential");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "metadata");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");

  if (v29)
    v20->_displayType = 2;
  objc_msgSend(v27, "remoteCredential");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "status");

  switch(v31)
  {
    case -1:
    case 0:
    case 3:
    case 4:
      v20->_credentialProvisioningType = 5;
      if (v20->_displayType == 1)
        v20->_displayType = 0;
      -[PKPaymentSetupFieldsViewController _setRightBarButtonItems:animated:](v20, "_setRightBarButtonItems:animated:", 0, 0);
      break;
    case 1:
      if (objc_msgSend(*p_paymentCredential, "credentialType") == 135)
        v44 = 13;
      else
        v44 = 4;
      goto LABEL_40;
    case 2:
      v44 = 3;
      goto LABEL_40;
    case 5:
      v44 = 2;
LABEL_40:
      v20->_credentialProvisioningType = v44;
      break;
    default:
      break;
  }

LABEL_42:
  -[PKPaymentSetupProduct configuration](v20->_setupProduct, "configuration");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v53, "type") == 9 || objc_msgSend(*p_paymentCredential, "credentialType") == 123)
  {

LABEL_45:
    v54 = 2;
    goto LABEL_46;
  }
  objc_msgSend(*p_paymentCredential, "issuerProvisioningExtensionCredential");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "entry");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "addRequestConfiguration");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "isPaymentAccount");

  if (v60)
    goto LABEL_45;
  if (v20->_credentialProvisioningType != 11)
  {
    v20->_category = 0;
    goto LABEL_47;
  }
  v54 = 1;
LABEL_46:
  v20->_category = v54;
LABEL_47:
  v18 = v69;
  -[PKPaymentSetupProvisioningFieldsViewController setIgnoreProgressDescriptionUpdates:](v20, "setIgnoreProgressDescriptionUpdates:", 1);
  v55 = objc_msgSend(*p_paymentCredential, "cardType");
  if (v55 <= 4)
    v53 = **((id **)&unk_1E3E77598 + v55);
  objc_msgSend(v69, "setProductType:subtype:", v53, 0);

LABEL_50:
  return v20;
}

- (void)dealloc
{
  objc_super v3;

  -[PKPaymentProvisioningController removeDelegate:](self->_provisioningController, "removeDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
  -[PKPaymentSetupProvisioningFieldsViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  unint64_t credentialProvisioningType;
  void *v4;
  void *v5;
  void *v7;
  unint64_t category;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  PKPaymentCredentialMetadataTableController *v19;
  void *v20;
  PKPaymentCredentialMetadataTableController *v21;
  PKPaymentCredentialMetadataTableController *metadataController;
  unint64_t v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
  -[PKPaymentSetupTableViewController loadView](&v25, sel_loadView);
  credentialProvisioningType = self->_credentialProvisioningType;
  if (credentialProvisioningType == 7)
    -[PKPaymentSetupFieldsViewController setHidesBackButton:animated:](self, "setHidesBackButton:animated:", 1, 0);
  -[PKPaymentSetupProvisioningFieldsViewController footerView](self, "footerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (credentialProvisioningType == 7 || self->_showSkipButton)
  {
    objc_msgSend(v4, "skipCardButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__skipCard, 0x2000);

    category = self->_category;
    if (category == 2)
    {
      objc_msgSend(v5, "skipCardButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedAquamanString(CFSTR("ADD_ACCOUNT_TO_WALLET_LATER"));
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (category == 1)
      {
        objc_msgSend(v5, "skipCardButton");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("ADD_TO_WALLET_LATER_KEY");
      }
      else
      {
        if (category)
          goto LABEL_15;
        objc_msgSend(v5, "skipCardButton");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("ADD_TO_WALLET_LATER");
      }
      PKLocalizedPaymentString(&v10->isa);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;
    objc_msgSend(v9, "setTitle:forState:", v11, 0);

  }
LABEL_15:
  if (!self->_allowsManualEntry)
  {
    -[PKPaymentSetupProvisioningFieldsViewController suppressFooterViewManualEntryButton](self, "suppressFooterViewManualEntryButton");
    goto LABEL_27;
  }
  v13 = self->_category;
  if (v13 == 2)
  {
    PKLocalizedAquamanString(CFSTR("ADD_A_DIFFERENT_ACCOUNT"));
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v13 == 1)
    {
      v14 = CFSTR("ADD_A_NEW_KEY");
    }
    else
    {
      if (v13)
      {
        v16 = 0;
        goto LABEL_26;
      }
      v14 = CFSTR("ADD_A_NEW_CARD");
    }
    PKLocalizedPaymentString(&v14->isa);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;
LABEL_26:
  objc_msgSend(v5, "manualEntryButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTitle:forState:", v16, 0);

LABEL_27:
  if (self->_displayType == 2)
  {
    if ((self->_credentialProvisioningType & 0xFFFFFFFFFFFFFFFELL) == 8)
      v18 = 3;
    else
      v18 = 1;
    v19 = [PKPaymentCredentialMetadataTableController alloc];
    -[PKPaymentCredential metadata](self->_paymentCredential, "metadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[PKPaymentCredentialMetadataTableController initWithMetadata:setupContext:cellStyle:](v19, "initWithMetadata:setupContext:cellStyle:", v20, -[PKPaymentSetupTableViewController context](self, "context"), v18);
    metadataController = self->_metadataController;
    self->_metadataController = v21;

  }
  if (-[PKPaymentSetupProvisioningFieldsViewController hideSetupLaterButton](self, "hideSetupLaterButton"))
    -[PKPaymentSetupProvisioningFieldsViewController suppressFooterViewSetupLaterButton](self, "suppressFooterViewSetupLaterButton");
  v23 = self->_credentialProvisioningType;
  if (v23 == 9)
  {
    -[PKPaymentSetupFieldsViewController _setRightBarButtonItems:animated:](self, "_setRightBarButtonItems:animated:", 0, 0);
    -[PKPaymentSetupProvisioningFieldsViewController suppressFooterViewSkipCardButton](self, "suppressFooterViewSkipCardButton");
    v23 = self->_credentialProvisioningType;
  }
  if ((v23 & 0xFFFFFFFFFFFFFFFELL) == 8)
  {
    PKLocalizedPaymentString(CFSTR("SETUP_PURCHASE_CONTACT_ISSUER_BANNER_TEXT"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupProvisioningFieldsViewController setNotificationTextInFooterView:](self, "setNotificationTextInFooterView:", v24);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  PKPaymentCredentialProvisioningViewControllerCoordinator *coordinator;
  void *v10;
  uint8_t v11[16];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
  -[PKPaymentSetupProvisioningFieldsViewController viewWillAppear:](&v12, sel_viewWillAppear_, a3);
  if (PKShowFakePaymentSetupFields())
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Showing fake payment setup fields", v11, 2u);
    }

    -[PKPaymentSetupFieldsViewController fieldsModel](self, "fieldsModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D67300], "fakePaymentSetupProvisioningFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateWithPaymentSetupFields:", v6);

  }
  v7 = -[PKNewPaymentCredentialProvisioningViewController isComplete](self, "isComplete");
  -[PKPaymentSetupFieldsViewController _setRightBarButtonItemsEnabled:](self, "_setRightBarButtonItemsEnabled:", v7);
  -[PKPaymentSetupFieldsViewController noteFieldIdentifiersChangedAndUpdateHeaders](self, "noteFieldIdentifiersChangedAndUpdateHeaders");
  -[PKNewPaymentCredentialProvisioningViewController _updatePassSnapshotHeader](self, "_updatePassSnapshotHeader");
  if (v7 && self->_shouldAutoProvision)
  {
    -[PKPaymentCredentialProvisioningViewControllerCoordinator provisionedPass](self->_coordinator, "provisionedPass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      self->_shouldAutoProvision = 0;
      -[PKNewPaymentCredentialProvisioningViewController didTransitionTo:loading:](self, "didTransitionTo:loading:", 4, 1);
      coordinator = self->_coordinator;
      -[PKPaymentSetupFieldsViewController fieldsModel](self, "fieldsModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentCredentialProvisioningViewControllerCoordinator continueWithFieldModel:](coordinator, "continueWithFieldModel:", v10);

    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
  -[PKPaymentSetupFieldsViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
  -[PKNewPaymentCredentialProvisioningViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  if (-[PKNewPaymentCredentialProvisioningViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))-[PKProvisioningAnalyticsSessionUIReporter resetProductTypes](self->_reporter, "resetProductTypes");
}

- (void)addDifferentCard:(id)a3
{
  id v4;

  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 1);
  -[PKPaymentSetupProvisioningFieldsViewController flowItemDelegate](self, "flowItemDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provisioningViewControllerDidSelectManualEntry:", self);

}

- (void)handleNextButtonTapped:(id)a3
{
  PKPaymentCredentialProvisioningViewControllerCoordinator *coordinator;
  id v5;

  -[PKPaymentSetupProvisioningFieldsViewController updateLocationAuthorization](self, "updateLocationAuthorization", a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0);
  coordinator = self->_coordinator;
  -[PKPaymentSetupFieldsViewController fieldsModel](self, "fieldsModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentCredentialProvisioningViewControllerCoordinator continueWithFieldModel:](coordinator, "continueWithFieldModel:", v5);

}

- (void)_skipCard
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Skipping to next credential", v5, 2u);
  }

  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 2);
  -[PKPaymentSetupFieldsViewController showActivitySpinnerWithTitle:subtitle:](self, "showActivitySpinnerWithTitle:subtitle:", 0, 0);
  -[PKPaymentSetupFieldsViewController resetCellStyling](self, "resetCellStyling");
  -[PKPaymentSetupProvisioningFieldsViewController flowItemDelegate](self, "flowItemDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provisioningViewController:didFinishWithSuccess:", self, 0);

}

- (void)setPassSnapshot:(id)a3 needsCorners:(BOOL)a4
{
  objc_storeStrong((id *)&self->_passSnapshot, a3);
  self->_passSnapshotNeedsCorners = a4;
}

- (void)_createPassSnapshotFromPaymentPass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location[2];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      objc_initWeak(location, self);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __98__PKNewPaymentCredentialProvisioningViewController__createPassSnapshotFromPaymentPass_completion___block_invoke;
      v9[3] = &unk_1E3E61B90;
      objc_copyWeak(&v12, location);
      v10 = v6;
      v11 = v7;
      objc_msgSend(v10, "loadImageSetAsync:preheat:withCompletion:", 0, 1, v9);

      objc_destroyWeak(&v12);
      objc_destroyWeak(location);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "No payment pass to generate snapshot", (uint8_t *)location, 2u);
      }

      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }
  }

}

void __98__PKNewPaymentCredentialProvisioningViewController__createPassSnapshotFromPaymentPass_completion___block_invoke(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__PKNewPaymentCredentialProvisioningViewController__createPassSnapshotFromPaymentPass_completion___block_invoke_2;
  block[3] = &unk_1E3E61B90;
  objc_copyWeak(&v5, a1 + 6);
  v3 = a1[4];
  v4 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v5);
}

void __98__PKNewPaymentCredentialProvisioningViewController__createPassSnapshotFromPaymentPass_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  PKPassView *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = -[PKPassView initWithPass:content:suppressedContent:]([PKPassView alloc], "initWithPass:content:suppressedContent:", *(_QWORD *)(a1 + 32), 5, 4087);
    -[PKPassView snapshotOfFrontFace](v3, "snapshotOfFrontFace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    WeakRetained = v5;
  }

}

- (void)_updatePassSnapshotHeader
{
  unint64_t credentialProvisioningType;
  uint64_t v4;
  void *v5;
  UIImage *passSnapshotPlaceHolder;
  UIImage *v9;
  UIImage *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  _QWORD v17[5];
  CGRect v18;

  credentialProvisioningType = self->_credentialProvisioningType;
  -[PKPaymentSetupFieldsViewController headerView](self, "headerView");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (credentialProvisioningType != 12 && v4 != 0)
  {
    passSnapshotPlaceHolder = self->_passSnapshotPlaceHolder;
    if (self->_passSnapshot)
    {
      self->_passSnapshotPlaceHolder = 0;

      if (self->_passSnapshotOverrideSize.width == *MEMORY[0x1E0C9D820]
        && self->_passSnapshotOverrideSize.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        objc_msgSend(v5, "setPassSnapshotUsingDefaultSize:animated:needsCorners:", self->_passSnapshot, passSnapshotPlaceHolder != 0, self->_passSnapshotNeedsCorners);
      }
      else
      {
        objc_msgSend(v5, "setPassSnapshot:withSize:animated:needsCorners:", self->_passSnapshot, passSnapshotPlaceHolder != 0, self->_passSnapshotNeedsCorners);
      }
    }
    else
    {
      if (!passSnapshotPlaceHolder)
      {
        PKUIImageNamed(CFSTR("PlaceholderCardArt_Large"));
        v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
        v10 = self->_passSnapshotPlaceHolder;
        self->_passSnapshotPlaceHolder = v9;

        passSnapshotPlaceHolder = self->_passSnapshotPlaceHolder;
      }
      objc_msgSend(v5, "setImageViewImage:withSize:animated:", passSnapshotPlaceHolder, 0, 130.0, 82.0);
      -[PKPaymentCredential underlyingPaymentPass](self->_paymentCredential, "underlyingPaymentPass");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "targetDevice");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "secureElementIdentifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v11, "remoteAssetsDownloadedForSEIDs:", v14);

        if (v15)
        {
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __77__PKNewPaymentCredentialProvisioningViewController__updatePassSnapshotHeader__block_invoke;
          v17[3] = &unk_1E3E613B0;
          v17[4] = self;
          -[PKNewPaymentCredentialProvisioningViewController _createPassSnapshotFromPaymentPass:completion:](self, "_createPassSnapshotFromPaymentPass:completion:", v11, v17);
        }

      }
    }
    objc_msgSend(v5, "sizeToFit");
    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    objc_msgSend(v16, "_tableHeaderHeightDidChangeToHeight:", CGRectGetHeight(v18));

  }
}

void __77__PKNewPaymentCredentialProvisioningViewController__updatePassSnapshotHeader__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1360), a2);
    objc_msgSend(*(id *)(a1 + 32), "_updatePassSnapshotHeader");
    v4 = v5;
  }

}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  void *v5;
  objc_super v7;

  if (self->_metadataController)
  {
    -[PKPaymentCredentialMetadataTableController tableView:contextMenuConfigurationForRowAtIndexPath:point:](self->_metadataController, "tableView:contextMenuConfigurationForRowAtIndexPath:point:", a3, a4, a5.x, a5.y);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
    -[PKPaymentSetupTableViewController tableView:contextMenuConfigurationForRowAtIndexPath:point:](&v7, sel_tableView_contextMenuConfigurationForRowAtIndexPath_point_, a3, a4, a5.x, a5.y);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v5;

  if (self->_metadataController)
    return -[PKPaymentCredentialMetadataTableController numberOfRowsInSection:](self->_metadataController, "numberOfRowsInSection:", a4);
  v5.receiver = self;
  v5.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
  return -[PKPaymentSetupFieldsViewController tableView:numberOfRowsInSection:](&v5, sel_tableView_numberOfRowsInSection_, a3, a4);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  objc_super v5;

  if (self->_metadataController)
  {
    -[PKPaymentCredentialMetadataTableController willDisplayCell:forRowAtIndexPath:](self->_metadataController, "willDisplayCell:forRowAtIndexPath:", a4, a5);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
    -[PKPaymentSetupFieldsViewController tableView:willDisplayCell:forRowAtIndexPath:](&v5, sel_tableView_willDisplayCell_forRowAtIndexPath_, a3, a4, a5);
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;
  objc_super v5;

  if (self->_metadataController)
    return *MEMORY[0x1E0DC53D8];
  v5.receiver = self;
  v5.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
  -[PKPaymentSetupFieldsViewController tableView:heightForRowAtIndexPath:](&v5, sel_tableView_heightForRowAtIndexPath_, a3, a4);
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  PKPaymentCredentialMetadataTableController *metadataController;
  id v7;
  void *v8;
  void *v9;
  int v10;
  PKPaymentCredential *paymentCredential;
  objc_super v12;

  metadataController = self->_metadataController;
  if (metadataController)
  {
    -[PKPaymentCredentialMetadataTableController cellForRowAtIndexPath:](metadataController, "cellForRowAtIndexPath:", a4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
    -[PKPaymentSetupFieldsViewController tableView:cellForRowAtIndexPath:](&v12, sel_tableView_cellForRowAtIndexPath_, a3, a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paymentSetupField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D6AF00]);

    if (v10)
    {
      paymentCredential = self->_paymentCredential;
      v7 = v7;
      objc_msgSend(v7, "setPaymentCredentialType:", -[PKPaymentCredential credentialType](paymentCredential, "credentialType"));

    }
    return v7;
  }
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  PKPaymentCredential *paymentCredential;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  NSObject *v25;
  _QWORD v26[5];
  id v27;
  NSObject *v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v7;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Preflighting: %{public}@", buf, 0xCu);

  }
  -[PKPaymentCredential localPassCredential](self->_paymentCredential, "localPassCredential");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "paymentPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentCredential isPurchasedProductCredential](self->_paymentCredential, "isPurchasedProductCredential");
  paymentCredential = self->_paymentCredential;
  if (v10)
  {
    -[PKPaymentCredential purchasedProductCredential](paymentCredential, "purchasedProductCredential");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v13 = v12;
    objc_msgSend(v12, "product");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if (-[PKPaymentCredential isDigitalIssuanceProductCredential](paymentCredential, "isDigitalIssuanceProductCredential"))
  {
    -[PKPaymentCredential digitalIssuanceProductCredential](self->_paymentCredential, "digitalIssuanceProductCredential");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v14 = 0;
LABEL_9:
  v15 = dispatch_group_create();
  v16 = objc_msgSend(v9, "isTransitPass");
  v17 = MEMORY[0x1E0C809B0];
  if (v16)
  {
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      dispatch_group_enter(v15);
      objc_msgSend(v9, "uniqueID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v17;
      v26[1] = 3221225472;
      v26[2] = __76__PKNewPaymentCredentialProvisioningViewController_preflightWithCompletion___block_invoke;
      v26[3] = &unk_1E3E6B5D0;
      v26[4] = self;
      v27 = v9;
      v28 = v15;
      objc_msgSend(v18, "plansForPaymentPassWithUniqueIdentifier:completion:", v19, v26);

    }
  }
  if (v14)
  {
    dispatch_group_enter(v15);
    v24[0] = v17;
    v24[1] = 3221225472;
    v24[2] = __76__PKNewPaymentCredentialProvisioningViewController_preflightWithCompletion___block_invoke_2;
    v24[3] = &unk_1E3E631A0;
    v24[4] = self;
    v25 = v15;
    v20 = (id)objc_msgSend(v14, "digitalCardCachedImage:", v24);

  }
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __76__PKNewPaymentCredentialProvisioningViewController_preflightWithCompletion___block_invoke_3;
  v22[3] = &unk_1E3E61590;
  v23 = v4;
  v21 = v4;
  dispatch_group_notify(v15, MEMORY[0x1E0C80D38], v22);

}

void __76__PKNewPaymentCredentialProvisioningViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0D67740];
  v4 = a2;
  v5 = objc_msgSend([v3 alloc], "initWithPass:", *(_QWORD *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 1408);
  *(_QWORD *)(v6 + 1408) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "updateWithDynamicCommutePlans:", v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __76__PKNewPaymentCredentialProvisioningViewController_preflightWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1360), a3);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1368) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __76__PKNewPaymentCredentialProvisioningViewController_preflightWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (id)defaultFields
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)visibleFieldIdentifiers
{
  void *v2;
  void *v3;

  if (self->_displayType == 1)
  {
    -[PKPaymentSetupFieldsViewController fieldsModel](self, "fieldsModel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "visibleSetupFieldIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)readonlyFieldIdentifiers
{
  uint64_t *v2;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (self->_credentialProvisioningType == 13)
  {
    v5[0] = *MEMORY[0x1E0D6AEF0];
    v2 = v5;
  }
  else
  {
    v4 = *MEMORY[0x1E0D6AF00];
    v2 = &v4;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isComplete
{
  unint64_t credentialProvisioningType;
  objc_super v5;

  credentialProvisioningType = self->_credentialProvisioningType;
  if (credentialProvisioningType == 5 || credentialProvisioningType == 9)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
  return -[PKPaymentSetupFieldsViewController isComplete](&v5, sel_isComplete);
}

- (void)didUpdateFieldModel
{
  -[PKPaymentSetupFieldsViewController _setRightBarButtonItemsEnabled:](self, "_setRightBarButtonItemsEnabled:", -[PKNewPaymentCredentialProvisioningViewController isComplete](self, "isComplete"));
  -[PKPaymentSetupFieldsViewController noteFieldIdentifiersChanged](self, "noteFieldIdentifiersChanged");
}

- (void)showWithProvisioningError:(id)a3
{
  id v4;
  unint64_t credentialProvisioningType;
  void *v6;
  uint64_t v7;
  unint64_t category;
  __CFString *v9;
  void *v10;
  unint64_t v11;
  __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v4 = a3;
  credentialProvisioningType = self->_credentialProvisioningType;
  if ((objc_msgSend(v4, "hasLocalizedTitleAndMessage") & 1) == 0)
  {
    if (credentialProvisioningType == 13)
    {
      PKLocalizedLynxString(CFSTR("COULD_NOT_ADD_CARD_TITLE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedLynxString(CFSTR("COULD_NOT_ADD_CARD_MESSAGE"));
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      category = self->_category;
      if (category == 2)
      {
        PKLocalizedAquamanString(CFSTR("COULD_NOT_ADD_ACCOUNT_TITLE"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedAquamanString(CFSTR("COULD_NOT_ADD_ACCOUNT_MESSAGE"));
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (category == 1)
        {
          PKLocalizedPaymentString(CFSTR("COULD_NOT_ADD_KEY_TITLE"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = CFSTR("COULD_NOT_ADD_HOME_KEY_MESSAGE");
        }
        else
        {
          if (category)
          {
            v6 = 0;
            v10 = 0;
            goto LABEL_12;
          }
          PKLocalizedPaymentString(CFSTR("COULD_NOT_ADD_CARD_TITLE"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = CFSTR("COULD_NOT_ADD_CARD_MESSAGE");
        }
        PKLocalizedPaymentString(&v9->isa);
        v7 = objc_claimAutoreleasedReturnValue();
      }
    }
    v10 = (void *)v7;
LABEL_12:
    objc_msgSend(v4, "setLocalizedTitle:", v6);
    objc_msgSend(v4, "setLocalizedMessage:", v10);

  }
  if (self->_hasRemainingCredentialsToProvision)
  {
    v11 = self->_category;
    if (v11 != 2)
    {
      if (v11 == 1)
      {
        v12 = CFSTR("ADD_TO_WALLET_LATER_KEY");
        goto LABEL_25;
      }
      if (!v11)
      {
        v12 = CFSTR("ADD_TO_WALLET_LATER");
LABEL_25:
        PKLocalizedPaymentString(&v12->isa);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      }
LABEL_32:
      v15 = 0;
      goto LABEL_27;
    }
    v14 = CFSTR("ADD_ACCOUNT_TO_WALLET_LATER");
LABEL_23:
    PKLocalizedAquamanString(&v14->isa);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  -[PKPaymentSetupTableViewController context](self, "context");
  if (PKPaymentSetupContextIsSetupAssistant())
  {
    v12 = CFSTR("SET_UP_LATER_BUTTON_TITLE");
    goto LABEL_25;
  }
  if (credentialProvisioningType != 13)
  {
    v17 = self->_category;
    if (v17 != 2)
    {
      if (v17 == 1)
      {
        v12 = CFSTR("COULD_NOT_ADD_KEY_ADD_LATER");
        goto LABEL_25;
      }
      if (!v17)
      {
        v12 = CFSTR("COULD_NOT_ADD_CARD_ADD_LATER");
        goto LABEL_25;
      }
      goto LABEL_32;
    }
    v14 = CFSTR("COULD_NOT_ADD_ACCOUNT_ADD_LATER");
    goto LABEL_23;
  }
  PKLocalizedLynxString(CFSTR("OK_BUTTON_TITLE"));
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_26:
  v15 = (void *)v13;
LABEL_27:
  v18[4] = self;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __78__PKNewPaymentCredentialProvisioningViewController_showWithProvisioningError___block_invoke_2;
  v19[3] = &unk_1E3E612E8;
  v19[4] = self;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__PKNewPaymentCredentialProvisioningViewController_showWithProvisioningError___block_invoke_3;
  v18[3] = &unk_1E3E612E8;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertForErrorWithError:acknowledgeButtonText:exitButtonText:onAcknowledge:onExit:onTryAgain:", v4, 0, v15, &__block_literal_global_197, v19, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKNewPaymentCredentialProvisioningViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);

}

uint64_t __78__PKNewPaymentCredentialProvisioningViewController_showWithProvisioningError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1432), "terminate");
}

void __78__PKNewPaymentCredentialProvisioningViewController_showWithProvisioningError___block_invoke_3(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  id v3;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[179];
  objc_msgSend(v1, "fieldsModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "continueWithFieldModel:", v3);

}

- (void)didTransitionTo:(int64_t)a3 loading:(BOOL)a4
{
  unint64_t credentialProvisioningType;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  unint64_t category;
  __CFString *v13;
  id v14;
  uint64_t v15;
  __CFString *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  id v24;
  id v25;
  id v26;

  if (a4)
  {
    credentialProvisioningType = self->_credentialProvisioningType;
    if ((unint64_t)(a3 - 1) < 5)
    {
      if (credentialProvisioningType - 1 <= 1)
      {
        v6 = CFSTR("SETTINGS_TRANSFER_PASS_MOVING");
LABEL_5:
        PKLocalizedPaymentString(&v6->isa);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v7 = CFSTR("PROGRESS_CONTACTING_ISSUER");
LABEL_6:
        PKLocalizedPaymentString(&v7->isa);
        v8 = objc_claimAutoreleasedReturnValue();
LABEL_23:
        v14 = v24;
        v10 = (void *)v8;
LABEL_41:
        v25 = v14;
        -[PKPaymentSetupFieldsViewController showActivitySpinnerWithTitle:subtitle:](self, "showActivitySpinnerWithTitle:subtitle:", v14, v10);
        goto LABEL_42;
      }
      if (credentialProvisioningType == 13)
      {
LABEL_15:
        PKLocalizedPaymentString(CFSTR("ADDING_CARD"));
        v24 = (id)objc_claimAutoreleasedReturnValue();
        PKLocalizedLynxString(CFSTR("ADDING_CARD_BODY"));
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      category = self->_category;
      if (category != 2)
      {
        if (category == 1)
        {
          PKLocalizedPaymentString(CFSTR("ADDING_KEY"));
          v24 = (id)objc_claimAutoreleasedReturnValue();
          v7 = CFSTR("PROGRESS_CONTACTING_ISSUER_KEY");
          goto LABEL_6;
        }
        if (!category)
        {
          v6 = CFSTR("ADDING_CARD");
          goto LABEL_5;
        }
LABEL_34:
        v10 = 0;
        v14 = 0;
        goto LABEL_41;
      }
      goto LABEL_35;
    }
    if (a3 == 6)
    {
      if (credentialProvisioningType - 1 > 1)
      {
        if (credentialProvisioningType == 13)
          goto LABEL_15;
        v17 = self->_category;
        if (v17 == 2)
        {
LABEL_35:
          PKLocalizedAquamanString(CFSTR("ADDING_ACCOUNT"));
          v26 = (id)objc_claimAutoreleasedReturnValue();
          -[PKPaymentCredential longDescription](self->_paymentCredential, "longDescription");
          v18 = objc_claimAutoreleasedReturnValue();
          v16 = (__CFString *)v18;
          if (v18)
            PKLocalizedAquamanString(CFSTR("PROGRESS_SETTING_UP_ACCOUNT"), CFSTR("%@"), v18);
          else
            PKLocalizedAquamanString(CFSTR("PROGRESS_SETTING_UP_ACCOUNT_GENERIC"));
          v19 = objc_claimAutoreleasedReturnValue();
          goto LABEL_40;
        }
        if (v17 == 1)
        {
          PKLocalizedPaymentString(CFSTR("ADDING_KEY"));
          v26 = (id)objc_claimAutoreleasedReturnValue();
          -[PKPaymentCredential longDescription](self->_paymentCredential, "longDescription");
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPaymentString(CFSTR("SETTUP_UP_PASS"), CFSTR("%@"), v16);
          v19 = objc_claimAutoreleasedReturnValue();
          goto LABEL_40;
        }
        if (v17)
          goto LABEL_34;
        v13 = CFSTR("ADDING_CARD");
      }
      else
      {
        v13 = CFSTR("SETTINGS_TRANSFER_PASS_MOVING");
      }
      PKLocalizedPaymentString(&v13->isa);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      PKCoreLocalizedString(CFSTR("PROGRESS_ENABLING_CARD"));
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    if (a3 != 7)
      goto LABEL_34;
    if (credentialProvisioningType - 1 > 1)
    {
      if (credentialProvisioningType != 13)
      {
        v23 = self->_category;
        if (v23 == 2)
        {
          PKLocalizedAquamanString(CFSTR("ADDING_ACCOUNT"));
          v15 = objc_claimAutoreleasedReturnValue();
LABEL_27:
          v26 = (id)v15;
          if (!self->_category)
          {
            -[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "targetDevice");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "deviceName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("PROGRESS_DOWNLOADING_CARD"), objc_msgSend(v22, "isEqualToString:", CFSTR("Apple Watch")));
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_39;
          }
LABEL_28:
          v16 = CFSTR("PROGRESS_DOWNLOADING_CARD_IPHONE");
LABEL_39:
          PKCoreLocalizedString(&v16->isa);
          v19 = objc_claimAutoreleasedReturnValue();
LABEL_40:
          v10 = (void *)v19;

          v14 = v26;
          goto LABEL_41;
        }
        if (v23 == 1)
        {
          v11 = CFSTR("ADDING_KEY");
          goto LABEL_26;
        }
        if (v23)
        {
          v26 = 0;
          goto LABEL_28;
        }
      }
      v11 = CFSTR("ADDING_CARD");
    }
    else
    {
      v11 = CFSTR("SETTINGS_TRANSFER_PASS_MOVING");
    }
LABEL_26:
    PKLocalizedPaymentString(&v11->isa);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  if (a3 != 8)
  {
    -[PKNewPaymentCredentialProvisioningViewController defaultHeaderViewTitle](self, "defaultHeaderViewTitle");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    -[PKNewPaymentCredentialProvisioningViewController defaultHeaderViewSubTitle](self, "defaultHeaderViewSubTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldsViewController hideActivitySpinnerWithTitle:subtitle:animated:](self, "hideActivitySpinnerWithTitle:subtitle:animated:", v25, v10, 1);
LABEL_42:

    goto LABEL_43;
  }
  -[PKPaymentCredentialProvisioningViewControllerCoordinator provisionedPass](self->_coordinator, "provisionedPass");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "paymentPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupProvisioningFieldsViewController showVerifiedUIForPass:](self, "showVerifiedUIForPass:", v9);

  -[PKPaymentSetupFieldsViewController setHidesBackButton:animated:](self, "setHidesBackButton:animated:", 1, 1);
  -[PKPaymentSetupFieldsViewController _setRightBarButtonItems:animated:](self, "_setRightBarButtonItems:animated:", 0, 0);
LABEL_43:

}

- (id)defaultHeaderViewTitle
{
  unint64_t category;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  switch(self->_credentialProvisioningType)
  {
    case 0uLL:
    case 3uLL:
    case 4uLL:
    case 6uLL:
    case 7uLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      category = self->_category;
      switch(category)
      {
        case 2uLL:
          v8 = CFSTR("ADD_ACCOUNT");
          goto LABEL_10;
        case 1uLL:
          goto LABEL_6;
        case 0uLL:
          v4 = CFSTR("ADD_CARD");
          goto LABEL_20;
      }
      goto LABEL_26;
    case 1uLL:
    case 2uLL:
      if (-[PKTransitBalanceModel hasDeviceBoundCommutePlans](self->_transitBalanceModel, "hasDeviceBoundCommutePlans"))
      {
        -[PKPaymentCredential localPassCredential](self->_paymentCredential, "localPassCredential");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "paymentPass");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        PKPassLocalizedStringWithFormat();
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        return v7;
      }
      v4 = CFSTR("SETTINGS_TRANSFER_PASS_TITLE");
      goto LABEL_20;
    case 5uLL:
      v14 = self->_category;
      if (v14 == 2)
      {
        v8 = CFSTR("ACCOUNT_UNAVAILABLE");
        goto LABEL_10;
      }
      if (v14 == 1)
      {
        v4 = CFSTR("UNABLE_TO_ADD_Key");
      }
      else
      {
        if (v14)
          goto LABEL_26;
        v4 = CFSTR("UNABLE_TO_ADD_CARD");
      }
      goto LABEL_20;
    case 8uLL:
      v4 = CFSTR("PENDING_PURCHASE");
      goto LABEL_20;
    case 9uLL:
      v4 = CFSTR("REFUNDED_PURCHASE");
      goto LABEL_20;
    case 0xAuLL:
      -[PKPaymentCredential issuerProvisioningExtensionCredential](self->_paymentCredential, "issuerProvisioningExtensionCredential");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "entry");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addRequestConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "style");

      if (v13 == 1)
      {
        v4 = CFSTR("ISSUER_ADD_CARD_WALLET");
LABEL_20:
        PKLocalizedPaymentString(&v4->isa);
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_21:
        v7 = (void *)v9;
        return v7;
      }
      v15 = self->_category;
      switch(v15)
      {
        case 2uLL:
          v8 = CFSTR("ISSUER_ADD_ACCOUNT_WALLET");
LABEL_10:
          PKLocalizedAquamanString(&v8->isa);
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_21;
        case 1uLL:
          v4 = CFSTR("ISSUER_ADD_KEY");
          goto LABEL_20;
        case 0uLL:
          v4 = CFSTR("ISSUER_ADD_CARD");
          goto LABEL_20;
      }
LABEL_26:
      v7 = 0;
      return v7;
    case 0xBuLL:
LABEL_6:
      v4 = CFSTR("ADD_KEY");
      goto LABEL_20;
    default:
      goto LABEL_26;
  }
}

- (id)defaultHeaderViewSubTitle
{
  uint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t category;
  __CFString *v17;
  void *v18;
  void *v19;
  int v20;
  void *v22;
  void *v23;

  switch(self->_credentialProvisioningType)
  {
    case 0uLL:
      -[PKNewPaymentCredentialProvisioningViewController _defaultHeaderViewSubTitleForLocalCredential](self, "_defaultHeaderViewSubTitleForLocalCredential");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 1uLL:
      -[PKNewPaymentCredentialProvisioningViewController _defaultHeaderViewSubTitleForLocalCredentialTransfer](self, "_defaultHeaderViewSubTitleForLocalCredentialTransfer");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 2uLL:
      -[PKPaymentCredential remoteCredential](self->_paymentCredential, "remoteCredential");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transferableFromDevices");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPaymentSetupTableViewController context](self, "context");
      if (PKPaymentSetupContextIsBridge())
      {
        if (v8)
        {
          v22 = v8;
          v23 = v8;
          v9 = CFSTR("SETTINGS_TRANSFER_PASS_SUBTITLE_REMOTE_TO_WATCH_NAME");
LABEL_20:
          PKLocalizedPaymentString(&v9->isa, CFSTR("%@%@"), v22, v23);
          goto LABEL_21;
        }
        v17 = CFSTR("SETTINGS_TRANSFER_PASS_SUBTITLE_REMOTE_TO_WATCH");
LABEL_33:
        PKLocalizedPaymentString(&v17->isa);
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_34:
        v4 = (__CFString *)v10;
      }
      else
      {
        if (v8)
        {
          v22 = v8;
          v23 = v8;
          v9 = CFSTR("SETTINGS_TRANSFER_PASS_SUBTITLE_REMOTE_TO_IPHONE_NAME");
          goto LABEL_20;
        }
        -[PKPaymentCredential remoteCredential](self->_paymentCredential, "remoteCredential");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "paymentPass");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "paymentApplications");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "pk_hasObjectPassingTest:", &__block_literal_global_190_0);

        if (v20)
          PKPassLocalizedStringWithFormat();
        else
          PKLocalizedPaymentString(CFSTR("SETTINGS_TRANSFER_PASS_SUBTITLE_REMOTE_TO_IPHONE"));
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_16:
        v4 = (__CFString *)v15;

      }
LABEL_35:

      return v4;
    case 3uLL:
    case 4uLL:
    case 0xBuLL:
    case 0xEuLL:
      -[PKNewPaymentCredentialProvisioningViewController _remoteExistingCredentialDefaultHeaderViewSubTitle](self, "_remoteExistingCredentialDefaultHeaderViewSubTitle");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 5uLL:
      -[PKPaymentCredential remoteCredential](self->_paymentCredential, "remoteCredential");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "statusDescription");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
      v4 = &stru_1E3E7D690;
      return v4;
    case 0xAuLL:
      -[PKPaymentCredential issuerProvisioningExtensionCredential](self->_paymentCredential, "issuerProvisioningExtensionCredential");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "entry");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addRequestConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "length"))
      {
        PKLocalizedPaymentString(CFSTR("ISSUER_ADD_DESCRIPTION"), CFSTR("%@"), v8);
LABEL_21:
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      category = self->_category;
      switch(category)
      {
        case 2uLL:
          PKLocalizedAquamanString(CFSTR("ISSUER_ADD_ACCOUNT_DESCRIPTION_GENERIC"));
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        case 1uLL:
          v17 = CFSTR("ISSUER_ADD_DESCRIPTION_GENERIC_KEY");
          goto LABEL_33;
        case 0uLL:
          v17 = CFSTR("ISSUER_ADD_DESCRIPTION_GENERIC");
          goto LABEL_33;
      }
      v4 = 0;
      goto LABEL_35;
    case 0xCuLL:
      -[PKPaymentCredential longDescription](self->_paymentCredential, "longDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        -[PKPaymentCredential longDescription](self->_paymentCredential, "longDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedVirtualCardString(CFSTR("PROVISIONING_ADD_CARD_BODY"), CFSTR("%@"), v14);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      PKLocalizedVirtualCardString(CFSTR("PROVISIONING_ADD_CARD_BODY_NO_CARD_NAME"));
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    case 0xDuLL:
      PKLocalizedLynxString(CFSTR("ADD_CARD_BODY"));
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_3:
      v4 = (__CFString *)v3;
      return v4;
    default:
      v4 = 0;
      return v4;
  }
}

BOOL __77__PKNewPaymentCredentialProvisioningViewController_defaultHeaderViewSubTitle__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "paymentNetworkIdentifier") == 131;
}

- (id)_remoteExistingCredentialDefaultHeaderViewSubTitle
{
  unint64_t credentialProvisioningType;
  int IsSetupAssistant;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t category;
  const __CFString *v13;
  const __CFString *v14;
  BOOL v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v19;
  unint64_t v20;
  const __CFString *v21;
  BOOL v22;
  BOOL v23;
  const __CFString *v24;
  int v25;
  void *v26;
  int IsBridge;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  __CFString *v32;

  if (self->_displayType != 1)
    return &stru_1E3E7D690;
  credentialProvisioningType = self->_credentialProvisioningType;
  -[PKPaymentSetupTableViewController context](self, "context");
  IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  -[PKNewPaymentCredentialProvisioningViewController visibleFieldIdentifiers](self, "visibleFieldIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKNewPaymentCredentialProvisioningViewController readonlyFieldIdentifiers](self, "readonlyFieldIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_arrayByRemovingObjectsInArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentCredential state](self->_paymentCredential, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requirementsResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requiredPaymentSetupFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (objc_msgSend(v7, "count") == 1 && objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0D6AF08]))
  {
    category = self->_category;
    v13 = CFSTR("ENTER_ON_FILE_CARD_SECURITY_CODE_%@");
    if (IsSetupAssistant)
    {
      v13 = CFSTR("ENTER_ON_FILE_CARD_SECURITY_CODE_SETUP_ASSISTANT_%@");
      v14 = CFSTR("ENTER_ON_FILE_ACCOUNT_SECURITY_CODE_SETUP_ASSISTANT_%@");
    }
    else
    {
      v14 = CFSTR("ENTER_ON_FILE_ACCOUNT_SECURITY_CODE_%@");
    }
    v15 = category >= 2;
    if (category == 2)
      v16 = (__CFString *)v14;
    else
      v16 = 0;
    if (v15)
      v17 = v16;
    else
      v17 = (__CFString *)v13;
  }
  else
  {
    v19 = objc_msgSend(v7, "count");
    v20 = self->_category;
    if (v19)
    {
      v21 = CFSTR("VERIFY_AND_COMPLETE_ON_FILE_CARD_INFO_%@");
      v22 = v20 >= 2;
      v23 = v20 == 2;
      v24 = CFSTR("VERIFY_AND_COMPLETE_ON_FILE_ACCOUNT_INFO_%@");
    }
    else
    {
      if (v20 != 2 && credentialProvisioningType != 3 && !v11)
      {
        v25 = 1;
        v17 = CFSTR("CONFIRM_ADDING_ON_FILE_CARD_INFO_%@");
        goto LABEL_28;
      }
      v21 = CFSTR("VERIFY_ON_FILE_CARD_INFO_%@");
      v22 = v20 >= 2;
      v23 = v20 == 2;
      v24 = CFSTR("VERIFY_ON_FILE_ACCOUNT_INFO_%@");
    }
    if (!v23)
      v24 = 0;
    if (v22)
      v17 = (__CFString *)v24;
    else
      v17 = (__CFString *)v21;
  }
  if (credentialProvisioningType != 3)
  {
    v25 = 0;
LABEL_28:
    -[PKPaymentCredential longDescription](self->_paymentCredential, "longDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      PKStringWithValidatedFormat();
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        -[PKPaymentSetupTableViewController context](self, "context", CFSTR("APPLE_PAY"));
        IsBridge = PKPaymentSetupContextIsBridge();
        PKDeviceSpecificLocalizedStringKeyForKey(v17, IsBridge);
        v28 = objc_claimAutoreleasedReturnValue();

        v17 = (__CFString *)v28;
      }
      v29 = self->_category;
      if (v29 < 2)
      {
        PKLocalizedPaymentString(&v17->isa, CFSTR("%@"), v26);
        v30 = objc_claimAutoreleasedReturnValue();
LABEL_40:
        v32 = (__CFString *)v30;
LABEL_42:

        goto LABEL_43;
      }
      if (v29 == 2)
      {
        PKLocalizedAquamanString(&v17->isa, CFSTR("%@"), v26);
        v30 = objc_claimAutoreleasedReturnValue();
        goto LABEL_40;
      }
    }
    v32 = &stru_1E3E7D690;
    goto LABEL_42;
  }
  PKStringWithValidatedFormat();
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v31 = self->_category;
  if (v31 < 2)
  {
    PKStringWithValidatedFormat();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString((NSString *)v26);
    v30 = objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  if (v31 == 2)
  {
    PKStringWithValidatedFormat();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedAquamanString((NSString *)v26);
    v30 = objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  v32 = &stru_1E3E7D690;
LABEL_43:

  return v32;
}

- (id)_defaultHeaderViewSubTitleForLocalCredentialTransfer
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;

  -[PKPaymentCredential localPassCredential](self->_paymentCredential, "localPassCredential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PKTransitBalanceModel hasDeviceBoundCommutePlans](self->_transitBalanceModel, "hasDeviceBoundCommutePlans");
  objc_msgSend(v4, "devicePrimaryPaymentApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "paymentNetworkIdentifier");

  if (objc_msgSend(v4, "isRemotePass"))
  {
    if (v7 == 131)
      goto LABEL_5;
    v9 = CFSTR("SETTINGS_TRANSFER_PASS_SUBTITLE_WATCH_TO_IPHONE");
LABEL_8:
    PKLocalizedPaymentString(&v9->isa);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!v5)
  {
    v9 = CFSTR("SETTINGS_TRANSFER_PASS_SUBTITLE_IPHONE_TO_WATCH");
    goto LABEL_8;
  }
LABEL_5:
  PKPassLocalizedStringWithFormat();
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v10 = (void *)v8;

  return v10;
}

- (id)_defaultHeaderViewSubTitleForLocalCredential
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  -[PKPaymentCredential credentialType](self->_paymentCredential, "credentialType");
  -[PKNewPaymentCredentialProvisioningViewController visibleFieldIdentifiers](self, "visibleFieldIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKNewPaymentCredentialProvisioningViewController readonlyFieldIdentifiers](self, "readonlyFieldIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pk_arrayByRemovingObjectsInArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 1 && (objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0D6AF08]) & 1) != 0)
  {
    v6 = CFSTR("ENTER_LOCAL_PASS_SECURITY_CODE_APPLE_WATCH");
  }
  else if (objc_msgSend(v5, "count"))
  {
    v6 = CFSTR("VERIFY_AND_COMPLETE_LOCAL_PASS_INFO_APPLE_WATCH");
  }
  else if (objc_msgSend(v3, "count"))
  {
    v6 = CFSTR("VERIFY_LOCAL_PASS_INFO_APPLE_WATCH");
  }
  else
  {
    v6 = CFSTR("CONFIRM_ADDING_LOCAL_PASS_APPLE_WATCH");
  }
  PKDisplayablePaymentNetworkCardNameForPaymentCredentialType();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(&v6->isa, CFSTR("%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)paymentPassUpdatedOnCredential:(id)a3
{
  if (objc_msgSend(a3, "isEqual:", self->_paymentCredential))
    -[PKNewPaymentCredentialProvisioningViewController _updatePassSnapshotHeader](self, "_updatePassSnapshotHeader");
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  if (a3)
    -[PKPaymentSetupFieldsViewController endUserInteraction](self, "endUserInteraction", a3, a4);
}

- (BOOL)hasRemainingCredentialsToProvision
{
  return self->_hasRemainingCredentialsToProvision;
}

- (void)setHasRemainingCredentialsToProvision:(BOOL)a3
{
  self->_hasRemainingCredentialsToProvision = a3;
}

- (BOOL)showSkipButton
{
  return self->_showSkipButton;
}

- (void)setShowSkipButton:(BOOL)a3
{
  self->_showSkipButton = a3;
}

- (PKPaymentCredentialProvisioningViewControllerCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_coordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_passSnapshot, 0);
  objc_storeStrong((id *)&self->_setupProduct, 0);
  objc_storeStrong((id *)&self->_paymentCredential, 0);
  objc_storeStrong((id *)&self->_metadataController, 0);
  objc_storeStrong((id *)&self->_passSnapshotPlaceHolder, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end
