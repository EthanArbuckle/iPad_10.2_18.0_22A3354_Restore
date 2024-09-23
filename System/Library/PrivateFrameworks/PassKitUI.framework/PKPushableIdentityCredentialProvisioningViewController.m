@implementation PKPushableIdentityCredentialProvisioningViewController

- (PKPushableIdentityCredentialProvisioningViewController)initWithContext:(int64_t)a3 credentials:(id)a4 configuration:(id)a5 reporter:(id)a6
{
  id v8;
  id v11;
  id v12;
  id v13;
  PKPushableIdentityCredentialProvisioningViewController *v14;
  PKPushableIdentityCredentialProvisioningViewController *v15;
  void *v16;
  unint64_t v17;
  objc_super v19;

  v8 = a4;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PKPushableIdentityCredentialProvisioningViewController;
  v14 = -[PKPassShareRedemptionViewController init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_context = a3;
    objc_storeStrong((id *)&v14->_credentials, v8);
    objc_storeStrong((id *)&v15->_configuration, a5);
    objc_storeStrong((id *)&v15->_reporter, a6);
    v15->_isRunningInForeground = 1;
    v15->_isUnifiedAccessPass = -[PKPushableIdentityCredentialProvisioningViewController _unifiedAccessPassStatus](v15, "_unifiedAccessPassStatus");
    -[NSArray firstObject](v15->_credentials, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "cardType");
    if (v17 <= 4)
      v8 = **((id **)&unk_1E3E6D890 + v17);

    -[PKProvisioningAnalyticsSessionUIReporter setProductType:subtype:](v15->_reporter, "setProductType:subtype:", v8, 0);
  }

  return v15;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPushableIdentityCredentialProvisioningViewController;
  -[PKPassShareRedemptionViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PKPushableIdentityCredentialProvisioningViewController showStartingUI](self, "showStartingUI");
  -[PKPushableIdentityCredentialProvisioningViewController _loadPassThumbnail](self, "_loadPassThumbnail");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPushableIdentityCredentialProvisioningViewController;
  -[PKPaymentSetupOptionsViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPushableIdentityCredentialProvisioningViewController;
  -[PKPushableIdentityCredentialProvisioningViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  if (-[PKPushableIdentityCredentialProvisioningViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))-[PKProvisioningAnalyticsSessionUIReporter resetProductTypes](self->_reporter, "resetProductTypes");
}

- (BOOL)_unifiedAccessPassStatus
{
  return -[NSArray pk_containsObjectPassingTest:](self->_credentials, "pk_containsObjectPassingTest:", &__block_literal_global_106);
}

BOOL __82__PKPushableIdentityCredentialProvisioningViewController__unifiedAccessPassStatus__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "source") == 5;
}

- (void)cancelButtonPressed
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPushableIdentityCredentialProvisioningViewController;
  -[PKPassShareRedemptionViewController cancelButtonPressed](&v4, sel_cancelButtonPressed);
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 2);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D682D8], 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPushableIdentityCredentialProvisioningViewController _terminateSetupFlowWithPasses:error:](self, "_terminateSetupFlowWithPasses:error:", 0, v3);

}

- (void)continueButtonPressed
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPushableIdentityCredentialProvisioningViewController;
  -[PKPassShareRedemptionViewController continueButtonPressed](&v3, sel_continueButtonPressed);
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0);
  if (self->_hasConfiguredCredential)
    -[PKPushableIdentityCredentialProvisioningViewController _continueProvisioning](self, "_continueProvisioning");
  else
    -[PKPushableIdentityCredentialProvisioningViewController _startProvisioning](self, "_startProvisioning");
}

- (void)_startProvisioning
{
  NSObject *v3;
  id WeakRetained;
  id v5;
  char v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  id buf[2];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Pushable Identity Credential VC - starting provisioning", (uint8_t *)buf, 2u);
  }

  if (-[NSArray count](self->_credentials, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
    objc_msgSend(WeakRetained, "startProvisioningWithCredentials:", self->_credentials);

  }
  else if (self->_configuration)
  {
    -[PKPushableIdentityCredentialProvisioningViewController showLoadingUI](self, "showLoadingUI");
    objc_initWeak(buf, self);
    v5 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    v6 = -[PKAddIdentityDocumentConfiguration hasRequiredDataForProvisioning](self->_configuration, "hasRequiredDataForProvisioning");
    v7 = MEMORY[0x1E0C809B0];
    if ((v6 & 1) == 0)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke;
      v12[3] = &unk_1E3E677A0;
      v12[4] = self;
      objc_copyWeak(&v13, buf);
      objc_msgSend(v5, "addOperation:", v12);
      objc_destroyWeak(&v13);
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke_5;
    v10[3] = &unk_1E3E6D800;
    objc_copyWeak(&v11, buf);
    v10[4] = self;
    v9 = (id)objc_msgSend(v5, "evaluateWithInput:completion:", v8, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
  else
  {
    -[PKPushableIdentityCredentialProvisioningViewController showStartingUI](self, "showStartingUI");
  }
}

void __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(v11 + 1368);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke_2;
  v15[3] = &unk_1E3E6D7D8;
  v15[4] = v11;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  v13 = v9;
  v17 = v13;
  v14 = v8;
  v16 = v14;
  objc_msgSend(v10, "configurePushProvisioningConfigurationV2:completion:", v12, v15);

  objc_destroyWeak(&v18);
}

void __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;

  v5 = a3;
  objc_msgSend(a2, "identityDocumentConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id *)(*(_QWORD *)(a1 + 32) + 1368);
  if (v5 || !v6)
  {
    v8 = *v7;
    *v7 = 0;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke_3;
    block[3] = &unk_1E3E68C58;
    v10 = v5;
    objc_copyWeak(&v12, (id *)(a1 + 56));
    v11 = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v12);

  }
  else
  {
    objc_storeStrong(v7, v6);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;

  PKSharingDisplayableError(*(NSError **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke_4;
  v8 = &unk_1E3E61B68;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v3 = v2;
  v9 = v3;
  v4 = PKAlertForDisplayableErrorWithHandlers(v3, &v5, 0, 0);
  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v4, 1, 0, v5, v6, v7, v8);

  objc_destroyWeak(&v10);
}

void __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_terminateSetupFlowWithPasses:error:", 0, *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v5 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke_6;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v11);
}

void __76__PKPushableIdentityCredentialProvisioningViewController__startProvisioning__block_invoke_6(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) != 0)
    {
      objc_msgSend(v4, "showStartingUI");
    }
    else
    {
      *((_BYTE *)v4 + 1385) = 1;
      v3 = objc_loadWeakRetained(v4 + 177);
      objc_msgSend(v3, "startProvisioningWithConfiguration:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1368));

    }
    WeakRetained = v4;
  }

}

- (void)_continueProvisioning
{
  NSObject *v3;
  id WeakRetained;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Pushable Identity Credential VC - continuing provisioning", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  objc_msgSend(WeakRetained, "continueProvisioning");

}

- (void)_loadPassThumbnail
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *provisioningTemplateIdentifier;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  _QWORD aBlock[5];

  -[PKPassShareRedemptionViewController cardHeaderView](self, "cardHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showLoadingContent");
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKPushableIdentityCredentialProvisioningViewController__loadPassThumbnail__block_invoke;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  v6 = v5;
  if (self->_provisioningTemplateIdentifier)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    provisioningTemplateIdentifier = self->_provisioningTemplateIdentifier;
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __76__PKPushableIdentityCredentialProvisioningViewController__loadPassThumbnail__block_invoke_3;
    v9[3] = &unk_1E3E6D850;
    objc_copyWeak(&v11, &location);
    v10 = v6;
    objc_msgSend(v7, "cardArtworkForTemplateIdentifier:completion:", provisioningTemplateIdentifier, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(void *))v5 + 2))(v5);
  }

}

void __76__PKPushableIdentityCredentialProvisioningViewController__loadPassThumbnail__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[171];
  if (v3)
  {
    objc_msgSend(v3, "metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "underlyingPreview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "thumbnailURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "passThumbnailImage");
    if (v6)
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __76__PKPushableIdentityCredentialProvisioningViewController__loadPassThumbnail__block_invoke_2;
      v15[3] = &unk_1E3E6D828;
      objc_copyWeak(&v16, &location);
      PKCommonCachedImageFromURL(v6, v15);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      v11 = *(void **)(a1 + 32);
      if (v7)
      {
        v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", v7);
      }
      else
      {
        PKUIImageNamed(CFSTR("Generic-Shared-Key"));
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v13 = (void *)v12;
      objc_msgSend(v11, "setPassThumbnailImage:", v12);

    }
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0DC3870]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1360), "firstObject");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "passThumbnailImageData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithData:", v9);
    objc_msgSend(v2, "setPassThumbnailImage:", v10);

  }
}

void __76__PKPushableIdentityCredentialProvisioningViewController__loadPassThumbnail__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setPassThumbnailImage:", v4);

}

void __76__PKPushableIdentityCredentialProvisioningViewController__loadPassThumbnail__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v6);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithData:", v3);
    objc_msgSend(WeakRetained, "setPassThumbnailImage:", v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)setPassThumbnailImage:(id)a3
{
  UIImage **p_passThumbnailImage;
  id v6;
  id v7;

  p_passThumbnailImage = &self->_passThumbnailImage;
  objc_storeStrong((id *)&self->_passThumbnailImage, a3);
  v6 = a3;
  -[PKPassShareRedemptionViewController cardHeaderView](self, "cardHeaderView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCardImage:", *p_passThumbnailImage);

  objc_msgSend(v7, "hideLoadingContent");
}

- (void)showStartingUI
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPushableIdentityCredentialProvisioningViewController;
  -[PKPassShareRedemptionViewController showStartingUI](&v6, sel_showStartingUI);
  objc_msgSend(MEMORY[0x1E0D65190], "pk_privacyLinkForContext:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setPrivacyLink:](self, "setPrivacyLink:", v3);
  -[PKPushableIdentityCredentialProvisioningViewController _setTitleAndBodyText](self, "_setTitleAndBodyText");
  -[PKPushableIdentityCredentialProvisioningViewController _setContinueButtonText](self, "_setContinueButtonText");
  -[PKPushableIdentityCredentialProvisioningViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

}

- (void)_setTitleAndBodyText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "provisioningString:templateIdentifier:", CFSTR("PROVISION_PUSHABLE_IDENTITY_PASS_TITLE"), self->_provisioningTemplateIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    PKLocalizedIdentityString(CFSTR("PROVISION_PUSHABLE_IDENTITY_PASS_TITLE"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v6;

  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v12);
  objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "provisioningString:templateIdentifier:", CFSTR("PROVISION_PUSHABLE_IDENTITY_PASS_BODY"), self->_provisioningTemplateIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    PKLocalizedIdentityString(CFSTR("PROVISION_PUSHABLE_IDENTITY_PASS_BODY"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v11);
}

- (void)_setContinueButtonText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "provisioningString:templateIdentifier:", CFSTR("ADD_PUSHABLE_IDENTITY_PASS_CONTINUE_TITLE"), self->_provisioningTemplateIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    PKLocalizedIdentityString(CFSTR("ADD_PUSHABLE_IDENTITY_PASS_CONTINUE_TITLE"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  -[PKPassShareRedemptionViewController setContinueButtonText:](self, "setContinueButtonText:", v7);
}

- (void)_showExitingLostModeUI
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[PKPushableIdentityCredentialProvisioningViewController showLoadingUI](self, "showLoadingUI");
  objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "provisioningString:templateIdentifier:", CFSTR("EXITING_LOST_MODE_SHAREABLE_CREDENTIAL_PASS"), self->_provisioningTemplateIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    PKLocalizedShareableCredentialString(CFSTR("EXITING_LOST_MODE_SHAREABLE_CREDENTIAL_PASS"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v7);
}

- (void)showLoadingUI
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPushableIdentityCredentialProvisioningViewController;
  -[PKPassShareRedemptionViewController showLoadingUI](&v10, sel_showLoadingUI);
  objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "provisioningString:templateIdentifier:", CFSTR("ADDING_SHAREABLE_CREDENTIAL_PASS"), self->_provisioningTemplateIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    PKLocalizedShareableCredentialString(CFSTR("ADDING_SHAREABLE_CREDENTIAL_PASS"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v7);
  -[PKPushableIdentityCredentialProvisioningViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leftBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 0);

}

- (void)showSuccessUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[PKPassShareRedemptionViewController analyticsReporter](self, "analyticsReporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D697F0];
  v8[0] = *MEMORY[0x1E0D68BE8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendEventForPage:specifics:", 2, v4);

  -[PKPaymentSetupOptionsViewController setShowHeaderSpinner:](self, "setShowHeaderSpinner:", 0);
  -[PKPaymentSetupOptionsViewController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowCheckmark:", 1);

  PKLocalizedShareableCredentialString(CFSTR("DONE_ADDING_SHAREABLE_CREDENTIAL_PASS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v6);

}

- (void)showWithProvisioningError:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = v4;
  if ((objc_msgSend(v4, "hasLocalizedTitleAndMessage") & 1) == 0)
  {
    v6 = (double)-[NSArray count](self->_credentials, "count");
    -[PKAddIdentityDocumentConfiguration metadataProviders](self->_configuration, "metadataProviders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (unint64_t)fmax(v6, (double)(unint64_t)objc_msgSend(v7, "count"));

    objc_msgSend(v4, "underlyingError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPushableIdentityCredentialProvisioningViewController _provisioningErrorWithNumberOfPassesFailed:error:](self, "_provisioningErrorWithNumberOfPassesFailed:error:", v8, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10 = (void *)MEMORY[0x1E0DC3450];
  v13[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__PKPushableIdentityCredentialProvisioningViewController_showWithProvisioningError___block_invoke_2;
  v14[3] = &unk_1E3E61388;
  v14[4] = self;
  v15 = v4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__PKPushableIdentityCredentialProvisioningViewController_showWithProvisioningError___block_invoke_3;
  v13[3] = &unk_1E3E612E8;
  v11 = v4;
  objc_msgSend(v10, "alertForErrorWithError:acknowledgeButtonText:exitButtonText:onAcknowledge:onExit:onTryAgain:", v11, 0, 0, &__block_literal_global_79, v14, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPushableIdentityCredentialProvisioningViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

}

void __84__PKPushableIdentityCredentialProvisioningViewController_showWithProvisioningError___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "analyticsReporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "underlyingError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v4 = *(void **)(a1 + 40);
  v7 = *MEMORY[0x1E0D697F0];
  v8[0] = *MEMORY[0x1E0D68BE0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendEventForPage:error:specifics:", 2, v4, v5);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1416));
  objc_msgSend(WeakRetained, "cancel");

}

uint64_t __84__PKPushableIdentityCredentialProvisioningViewController_showWithProvisioningError___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "continueButtonPressed");
}

- (void)didTransitionTo:(int64_t)a3 loading:(BOOL)a4
{
  if (a4)
  {
    if (a3 == 1)
      -[PKPushableIdentityCredentialProvisioningViewController _showExitingLostModeUI](self, "_showExitingLostModeUI");
    else
      -[PKPushableIdentityCredentialProvisioningViewController showLoadingUI](self, "showLoadingUI");
  }
  else if (a3 == 8)
  {
    -[PKPushableIdentityCredentialProvisioningViewController showSuccessUI](self, "showSuccessUI");
  }
  else
  {
    -[PKPushableIdentityCredentialProvisioningViewController showStartingUI](self, "showStartingUI");
  }
}

- (void)_terminateSetupFlowWithPasses:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  uint64_t *v11;
  void *v12;
  id WeakRetained;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v17 = objc_msgSend(v6, "count");
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Pushable Identity Credential VC - Terminating setup flow with passes: %lu error: %@", buf, 0x16u);
  }

  -[PKPassShareRedemptionViewController analyticsReporter](self, "analyticsReporter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v10 = 1;
  else
    v10 = v6 == 0;
  v14 = *MEMORY[0x1E0D697F0];
  if (v10)
    v11 = (uint64_t *)MEMORY[0x1E0D68BE0];
  else
    v11 = (uint64_t *)MEMORY[0x1E0D68BE8];
  v15 = *v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendEventForPage:error:specifics:", 2, v7, v12, v14);

  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  objc_msgSend(WeakRetained, "pushableViewController:didFailWithError:", self, v7);

}

- (int64_t)_accessPassType
{
  return 0;
}

- (id)_provisioningErrorWithNumberOfPassesFailed:(int64_t)a3 error:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  char v16;

  v6 = a4;
  v16 = 1;
  v7 = -[PKPushableIdentityCredentialProvisioningViewController _accessPassType](self, "_accessPassType");
  PKAddSEPassDisplayableError(v6, a3, v7, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    PKAddSEPassGenericDisplayableError(a3, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  if (v16)
    v12 = 5;
  else
    v12 = 4;
  if (v11)
    v13 = v11;
  else
    v13 = v6;
  objc_msgSend(MEMORY[0x1E0D67548], "errorWithUnderlyingError:defaultSeverity:", v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  -[PKPushableIdentityCredentialProvisioningViewController _terminateSetupFlowWithPasses:error:](self, "_terminateSetupFlowWithPasses:error:", 0, 0);
}

- (PKPushableCredentialProvisioningViewControllerCoordinator)coordinator
{
  return (PKPushableCredentialProvisioningViewControllerCoordinator *)objc_loadWeakRetained((id *)&self->_coordinator);
}

- (void)setCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_coordinator, a3);
}

- (BOOL)isRunningInForeground
{
  return self->_isRunningInForeground;
}

- (void)setIsRunningInForeground:(BOOL)a3
{
  self->_isRunningInForeground = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong((id *)&self->_passThumbnailImage, 0);
  objc_storeStrong((id *)&self->_provisioningTemplateIdentifier, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
}

@end
