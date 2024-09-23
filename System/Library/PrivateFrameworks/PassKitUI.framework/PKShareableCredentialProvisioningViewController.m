@implementation PKShareableCredentialProvisioningViewController

- (PKShareableCredentialProvisioningViewController)initWithContext:(int64_t)a3 credentials:(id)a4 configuration:(id)a5 reporter:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKShareableCredentialProvisioningViewController *v14;
  PKShareableCredentialProvisioningViewController *v15;
  id *p_credentials;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSString *provisioningTemplateIdentifier;
  id v22;
  void *v23;
  unint64_t v24;
  objc_super v26;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PKShareableCredentialProvisioningViewController;
  v14 = -[PKPassShareRedemptionViewController init](&v26, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_context = a3;
    p_credentials = (id *)&v14->_credentials;
    objc_storeStrong((id *)&v14->_credentials, a4);
    objc_storeStrong((id *)&v15->_configuration, a5);
    objc_storeStrong((id *)&v15->_reporter, a6);
    v15->_isRunningInForeground = 1;
    -[PKAddShareablePassConfiguration credentialsMetadata](v15->_configuration, "credentialsMetadata");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v17, "firstObject");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v18, "preview");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "provisioningTemplateIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    provisioningTemplateIdentifier = v15->_provisioningTemplateIdentifier;
    v15->_provisioningTemplateIdentifier = (NSString *)v20;

    LOBYTE(v17) = objc_msgSend(*p_credentials, "pk_containsObjectPassingTest:", &__block_literal_global_231);
    -[PKAddShareablePassConfiguration credentialsMetadata](v15->_configuration, "credentialsMetadata");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = objc_msgSend(v22, "pk_containsObjectPassingTest:", &__block_literal_global_37);

    v15->_isUnifiedAccessPass = v17 | v18;
    objc_msgSend(*p_credentials, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "cardType");
    if (v24 <= 4)
      v22 = **((id **)&unk_1E3E7A330 + v24);

    -[PKProvisioningAnalyticsSessionUIReporter setProductType:subtype:](v15->_reporter, "setProductType:subtype:", v22, 0);
  }

  return v15;
}

BOOL __102__PKShareableCredentialProvisioningViewController_initWithContext_credentials_configuration_reporter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "source") == 5;
}

BOOL __102__PKShareableCredentialProvisioningViewController_initWithContext_credentials_configuration_reporter___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "accountHash");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKShareableCredentialProvisioningViewController;
  -[PKPassShareRedemptionViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PKShareableCredentialProvisioningViewController showStartingUI](self, "showStartingUI");
  -[PKShareableCredentialProvisioningViewController _loadPassThumbnail](self, "_loadPassThumbnail");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKShareableCredentialProvisioningViewController;
  -[PKPaymentSetupOptionsViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKShareableCredentialProvisioningViewController;
  -[PKShareableCredentialProvisioningViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  if (-[PKShareableCredentialProvisioningViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))-[PKProvisioningAnalyticsSessionUIReporter resetProductTypes](self->_reporter, "resetProductTypes");
}

- (void)setInvitation:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  void *v11;
  unint64_t v12;
  __CFString *v13;
  id v14;

  v14 = a3;
  objc_storeStrong((id *)&self->_invitation, a3);
  -[PKSharingPushProvisioningInvitation activationOptions](self->_invitation, "activationOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareRedemptionViewController setActivationOptions:](self, "setActivationOptions:", v5);

  -[PKSharingPushProvisioningInvitation proprietaryData](self->_invitation, "proprietaryData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayableSharedEntitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareRedemptionViewController setDisplayableSharedEntitlements:](self, "setDisplayableSharedEntitlements:", v7);

  -[PKPassShareRedemptionViewController setAnalyticsEnabled:](self, "setAnalyticsEnabled:", 1);
  -[PKSharingPushProvisioningInvitation proprietaryData](self->_invitation, "proprietaryData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "accessType");

  -[PKPassShareRedemptionViewController analyticsReporter](self, "analyticsReporter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessPassType:", v9);

  -[NSArray firstObject](self->_credentials, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "cardType");
  if (v12 <= 4)
    v10 = **((id **)&unk_1E3E7A330 + v12);

  if (v9 >= 7)
    v13 = (__CFString *)(id)*MEMORY[0x1E0D69618];
  else
    v13 = off_1E3E7A358[v9];
  -[PKProvisioningAnalyticsSessionUIReporter setProductType:subtype:](self->_reporter, "setProductType:subtype:", v10, v13);

}

- (void)cancelButtonPressed
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKShareableCredentialProvisioningViewController;
  -[PKPassShareRedemptionViewController cancelButtonPressed](&v4, sel_cancelButtonPressed);
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 2);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D682D8], 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKShareableCredentialProvisioningViewController _terminateSetupFlowWithPasses:error:](self, "_terminateSetupFlowWithPasses:error:", 0, v3);

}

- (void)continueButtonPressed
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKShareableCredentialProvisioningViewController;
  -[PKPassShareRedemptionViewController continueButtonPressed](&v3, sel_continueButtonPressed);
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0);
  if (self->_hasConfiguredCredential)
    -[PKShareableCredentialProvisioningViewController _continueProvisioning](self, "_continueProvisioning");
  else
    -[PKShareableCredentialProvisioningViewController _startProvisioning](self, "_startProvisioning");
}

- (void)activationCodeDidChangeToCode:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PKAddShareablePassConfiguration credentialsMetadata](self->_configuration, "credentialsMetadata", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "provisioningTarget");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setVerificationCode:", v4);

        self->_hasConfiguredCredential = 0;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_startProvisioning
{
  NSObject *v3;
  PKShareableCredentialsMessageComposeViewController *v4;
  PKShareableCredentialsMessageComposeViewController *messageComposeViewController;
  id WeakRetained;
  id v7;
  char v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  id buf[2];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Shareable Credential VC - starting provisioning", (uint8_t *)buf, 2u);
  }

  if (-[PKAddShareablePassConfiguration primaryAction](self->_configuration, "primaryAction"))
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Shareable Credential VC - presenting PKShareableCredentialsMessageComposeViewController", (uint8_t *)buf, 2u);
    }

    v4 = -[PKShareableCredentialsMessageComposeViewController initWithConfiguration:]([PKShareableCredentialsMessageComposeViewController alloc], "initWithConfiguration:", self->_configuration);
    messageComposeViewController = self->_messageComposeViewController;
    self->_messageComposeViewController = v4;

    -[PKShareableCredentialsMessageComposeViewController setDelegate:](self->_messageComposeViewController, "setDelegate:", self);
    -[PKShareableCredentialProvisioningViewController showStartingUI](self, "showStartingUI");
    -[PKShareableCredentialProvisioningViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_messageComposeViewController, 1, 0);
  }
  else if (-[NSArray count](self->_credentials, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
    objc_msgSend(WeakRetained, "startProvisioningWithCredentials:", self->_credentials);

  }
  else if (self->_configuration)
  {
    -[PKShareableCredentialProvisioningViewController showLoadingUI](self, "showLoadingUI");
    objc_initWeak(buf, self);
    v7 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    v8 = -[PKAddShareablePassConfiguration hasRequiredDataForProvisioning](self->_configuration, "hasRequiredDataForProvisioning");
    v9 = MEMORY[0x1E0C809B0];
    if ((v8 & 1) == 0)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke;
      v14[3] = &unk_1E3E677A0;
      v14[4] = self;
      objc_copyWeak(&v15, buf);
      objc_msgSend(v7, "addOperation:", v14);
      objc_destroyWeak(&v15);
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke_5;
    v12[3] = &unk_1E3E6D800;
    objc_copyWeak(&v13, buf);
    v12[4] = self;
    v11 = (id)objc_msgSend(v7, "evaluateWithInput:completion:", v10, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
  else
  {
    -[PKShareableCredentialProvisioningViewController showStartingUI](self, "showStartingUI");
  }
}

void __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
  v15[2] = __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke_2;
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

void __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  objc_msgSend(a2, "shareablePassConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id *)(*(_QWORD *)(a1 + 32) + 1368);
  if (v5 || !v6)
  {
    v8 = *v7;
    *v7 = 0;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke_3;
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

void __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke_3(uint64_t a1)
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
  v7 = __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke_4;
  v8 = &unk_1E3E61B68;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v3 = v2;
  v9 = v3;
  v4 = PKAlertForDisplayableErrorWithHandlers(v3, &v5, 0, 0);
  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v4, 1, 0, v5, v6, v7, v8);

  objc_destroyWeak(&v10);
}

void __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke_4(uint64_t a1)
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

void __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
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
  block[2] = __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke_6;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v11);
}

void __69__PKShareableCredentialProvisioningViewController__startProvisioning__block_invoke_6(uint64_t a1)
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
      *((_BYTE *)v4 + 1377) = 1;
      v3 = objc_loadWeakRetained(v4 + 178);
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
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Shareable Credential VC - continuing provisioning", v5, 2u);
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
  aBlock[2] = __69__PKShareableCredentialProvisioningViewController__loadPassThumbnail__block_invoke;
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
    v9[2] = __69__PKShareableCredentialProvisioningViewController__loadPassThumbnail__block_invoke_3;
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

void __69__PKShareableCredentialProvisioningViewController__loadPassThumbnail__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[171];
  if (v3)
  {
    objc_msgSend(v3, "credentialsMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "preview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "thumbnailURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "preview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "passThumbnailImage");

    if (v7)
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __69__PKShareableCredentialProvisioningViewController__loadPassThumbnail__block_invoke_2;
      v17[3] = &unk_1E3E6D828;
      objc_copyWeak(&v18, &location);
      PKCommonCachedImageFromURL(v7, v17);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      v13 = *(void **)(a1 + 32);
      if (v9)
      {
        v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", v9);
      }
      else
      {
        PKUIImageNamed(CFSTR("Generic-Shared-Key"));
        v14 = objc_claimAutoreleasedReturnValue();
      }
      v15 = (void *)v14;
      objc_msgSend(v13, "setPassThumbnailImage:", v14);

    }
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0DC3870]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1360), "firstObject");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "passThumbnailImageData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithData:", v11);
    objc_msgSend(v2, "setPassThumbnailImage:", v12);

  }
}

void __69__PKShareableCredentialProvisioningViewController__loadPassThumbnail__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setPassThumbnailImage:", v4);

}

void __69__PKShareableCredentialProvisioningViewController__loadPassThumbnail__block_invoke_3(uint64_t a1, void *a2)
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
  PKAddShareablePassConfigurationPrimaryAction v3;
  PKAddShareablePassConfiguration *configuration;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *provisioningTemplateIdentifier;
  void *v12;
  void *v13;
  id v14;
  PKSharingPushProvisioningInvitation *invitation;
  void *v16;
  void *v17;
  unint64_t v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  NSString *v49;
  void *v50;
  __CFString *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  unint64_t v56;
  PKAddShareablePassConfigurationPrimaryAction v57;
  unint64_t v58;
  objc_super v59;

  v59.receiver = self;
  v59.super_class = (Class)PKShareableCredentialProvisioningViewController;
  -[PKPassShareRedemptionViewController showStartingUI](&v59, sel_showStartingUI);
  v3 = -[PKAddShareablePassConfiguration primaryAction](self->_configuration, "primaryAction");
  configuration = self->_configuration;
  if (configuration)
  {
    -[PKAddShareablePassConfiguration credentialsMetadata](configuration, "credentialsMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

  }
  else
  {
    v6 = -[NSArray count](self->_credentials, "count");
  }
  -[PKAddShareablePassConfiguration credentialsMetadata](self->_configuration, "credentialsMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v3 == PKAddShareablePassConfigurationPrimaryActionShare)
  {
    objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    provisioningTemplateIdentifier = self->_provisioningTemplateIdentifier;
    if (v6 < 2)
    {
      objc_msgSend(v9, "provisioningString:templateIdentifier:", CFSTR("SHARE_ONE_SHAREABLE_CREDENTIAL_PASS"), provisioningTemplateIdentifier);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = v6;
      if (v21)
      {
        v24 = v21;
      }
      else
      {
        PKLocalizedShareableCredentialString(CFSTR("SHARE_ONE_SHAREABLE_CREDENTIAL_PASS"));
        v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      v36 = v24;

      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "preview");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "ownerDisplayName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      PKStringWithValidatedFormat();
      v40 = v8;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v41, v39);

      v8 = v40;
      v6 = v23;
    }
    else
    {
      objc_msgSend(v9, "provisioningString:templateIdentifier:", CFSTR("SHARE_CREDENTIAL_MULTIPLE_PASS_TITLE"), provisioningTemplateIdentifier);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        PKLocalizedShareableCredentialString(CFSTR("SHARE_CREDENTIAL_MULTIPLE_PASS_TITLE"));
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v36 = v14;

      PKStringWithValidatedFormat();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v37, v6);
    }

    objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "provisioningString:templateIdentifier:", CFSTR("SHARE_CREDENTIAL_EXPLANATION"), self->_provisioningTemplateIdentifier);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v43)
    {
      v45 = v43;
    }
    else
    {
      PKLocalizedShareableCredentialString(CFSTR("SHARE_CREDENTIAL_EXPLANATION"));
      v45 = (id)objc_claimAutoreleasedReturnValue();
    }
    v29 = v45;

    v56 = v6;
    PKStringWithValidatedFormat();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    invitation = self->_invitation;
    v57 = v3;
    v58 = v6;
    v16 = (void *)v7;
    if (invitation)
    {
      -[PKSharingPushProvisioningInvitation proprietaryData](invitation, "proprietaryData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "accessType");

      if (v18 >= 7)
      {
        v19 = 0;
        v20 = 0;
      }
      else
      {
        v19 = off_1E3E7A390[v18];
        v20 = off_1E3E7A3C8[v18];
      }
    }
    else
    {
      if (v6 == 1)
        v19 = CFSTR("ADD_SHAREABLE_CREDENTIAL_PASS_TITLE");
      else
        v19 = CFSTR("ADD_SHAREABLE_CREDENTIAL_PASS");
      if (v6 == 1)
        v20 = CFSTR("ADD_TO_WALLET_EXPLANATION");
      else
        v20 = CFSTR("ADD_TO_WALLET_EXPLANATION_MULTIPLE");
    }
    objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "provisioningString:templateIdentifier:", v19, self->_provisioningTemplateIdentifier);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      v28 = v26;
    }
    else
    {
      PKLocalizedShareableCredentialString(&v19->isa);
      v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    v29 = v28;

    if (invitation)
    {
      -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v29);
    }
    else
    {
      PKStringWithValidatedFormat();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v30, v58);

    }
    v8 = v16;
    v3 = v57;
    objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "provisioningString:templateIdentifier:", v20, self->_provisioningTemplateIdentifier);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
    {
      v34 = v32;
    }
    else
    {
      PKLocalizedShareableCredentialString(&v20->isa);
      v34 = (id)objc_claimAutoreleasedReturnValue();
    }
    v35 = v34;

    v6 = v58;
  }
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v35, v56);

  objc_msgSend(MEMORY[0x1E0D65190], "pk_privacyLinkForContext:", 8);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setPrivacyLink:](self, "setPrivacyLink:", v46);
  if (v3 == PKAddShareablePassConfigurationPrimaryActionShare)
  {
    objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    v49 = self->_provisioningTemplateIdentifier;
    if (v6 < 2)
    {
      objc_msgSend(v47, "provisioningString:templateIdentifier:", CFSTR("SHARE_SHAREABLE_CREDENTIAL_PASS_TITLE"), v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v50)
      {
        v51 = CFSTR("SHARE_SHAREABLE_CREDENTIAL_PASS_TITLE");
        goto LABEL_47;
      }
    }
    else
    {
      objc_msgSend(v47, "provisioningString:templateIdentifier:", CFSTR("SHARE_SHAREABLE_CREDENTIAL_PASSES_TITLE"), v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v50)
      {
        v51 = CFSTR("SHARE_SHAREABLE_CREDENTIAL_PASSES_TITLE");
LABEL_47:
        PKLocalizedShareableCredentialString(&v51->isa);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 0;
        goto LABEL_48;
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "provisioningString:templateIdentifier:", CFSTR("ADD_SHAREABLE_CREDENTIAL_PASS_CONTINUE_TITLE"), self->_provisioningTemplateIdentifier);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v50)
    {
      v51 = CFSTR("ADD_SHAREABLE_CREDENTIAL_PASS_CONTINUE_TITLE");
      goto LABEL_47;
    }
  }
  v52 = v50;
  v53 = v52;
LABEL_48:

  -[PKPassShareRedemptionViewController setContinueButtonText:](self, "setContinueButtonText:", v53);
  -[PKShareableCredentialProvisioningViewController navigationItem](self, "navigationItem");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "leftBarButtonItem");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setEnabled:", 1);

}

- (void)_showExitingLostModeUI
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[PKShareableCredentialProvisioningViewController showLoadingUI](self, "showLoadingUI");
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
  PKAddShareablePassConfiguration *configuration;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  NSString *provisioningTemplateIdentifier;
  void *v9;
  __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKShareableCredentialProvisioningViewController;
  -[PKPassShareRedemptionViewController showLoadingUI](&v15, sel_showLoadingUI);
  configuration = self->_configuration;
  if (configuration)
  {
    -[PKAddShareablePassConfiguration credentialsMetadata](configuration, "credentialsMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

  }
  else
  {
    v5 = -[NSArray count](self->_credentials, "count");
  }
  objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  provisioningTemplateIdentifier = self->_provisioningTemplateIdentifier;
  if (v5 < 2)
  {
    objc_msgSend(v6, "provisioningString:templateIdentifier:", CFSTR("ADDING_SHAREABLE_CREDENTIAL_PASS"), provisioningTemplateIdentifier);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v10 = CFSTR("ADDING_SHAREABLE_CREDENTIAL_PASS");
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(v6, "provisioningString:templateIdentifier:", CFSTR("ADDING_SHAREABLE_CREDENTIAL_PASSES"), provisioningTemplateIdentifier);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v10 = CFSTR("ADDING_SHAREABLE_CREDENTIAL_PASSES");
LABEL_10:
      PKLocalizedShareableCredentialString(&v10->isa);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      goto LABEL_11;
    }
  }
  v11 = v9;
  v12 = v11;
LABEL_11:

  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v12);
  -[PKShareableCredentialProvisioningViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leftBarButtonItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEnabled:", 0);

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
    -[PKAddShareablePassConfiguration credentialsMetadata](self->_configuration, "credentialsMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (unint64_t)fmax(v6, (double)(unint64_t)objc_msgSend(v7, "count"));

    objc_msgSend(v4, "underlyingError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKShareableCredentialProvisioningViewController _provisioningErrorWithNumberOfPassesFailed:error:](self, "_provisioningErrorWithNumberOfPassesFailed:error:", v8, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10 = (void *)MEMORY[0x1E0DC3450];
  v13[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__PKShareableCredentialProvisioningViewController_showWithProvisioningError___block_invoke_2;
  v14[3] = &unk_1E3E61388;
  v14[4] = self;
  v15 = v4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__PKShareableCredentialProvisioningViewController_showWithProvisioningError___block_invoke_3;
  v13[3] = &unk_1E3E612E8;
  v11 = v4;
  objc_msgSend(v10, "alertForErrorWithError:acknowledgeButtonText:exitButtonText:onAcknowledge:onExit:onTryAgain:", v11, 0, 0, &__block_literal_global_122_0, v14, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKShareableCredentialProvisioningViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

}

void __77__PKShareableCredentialProvisioningViewController_showWithProvisioningError___block_invoke_2(uint64_t a1)
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

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1424));
  objc_msgSend(WeakRetained, "cancel");

}

uint64_t __77__PKShareableCredentialProvisioningViewController_showWithProvisioningError___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "continueButtonPressed");
}

- (void)didTransitionTo:(int64_t)a3 loading:(BOOL)a4
{
  if (a4)
  {
    if (a3 == 1)
      -[PKShareableCredentialProvisioningViewController _showExitingLostModeUI](self, "_showExitingLostModeUI");
    else
      -[PKShareableCredentialProvisioningViewController showLoadingUI](self, "showLoadingUI");
  }
  else if (a3 == 8)
  {
    -[PKShareableCredentialProvisioningViewController showSuccessUI](self, "showSuccessUI");
  }
  else
  {
    -[PKShareableCredentialProvisioningViewController showStartingUI](self, "showStartingUI");
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
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Shareable Credential VC - Terminating setup flow with passes: %lu error: %@", buf, 0x16u);
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

- (id)_provisioningErrorWithNumberOfPassesFailed:(int64_t)a3 error:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  char v17;

  v6 = a4;
  v17 = 1;
  -[PKSharingPushProvisioningInvitation proprietaryData](self->_invitation, "proprietaryData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "accessType");

  PKAddSEPassDisplayableError(v6, a3, v8, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    PKAddSEPassGenericDisplayableError(a3, v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  if (v17)
    v13 = 5;
  else
    v13 = 4;
  if (v12)
    v14 = v12;
  else
    v14 = v6;
  objc_msgSend(MEMORY[0x1E0D67548], "errorWithUnderlyingError:defaultSeverity:", v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)messageComposeViewControllerDidFinishWithResult:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Shareable Credential VC - Terminate Setup flow", v7, 2u);
  }

  if (a3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D682D8], 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PKShareableCredentialProvisioningViewController _terminateSetupFlowWithPasses:error:](self, "_terminateSetupFlowWithPasses:error:", 0, v6);

}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  -[PKShareableCredentialProvisioningViewController _terminateSetupFlowWithPasses:error:](self, "_terminateSetupFlowWithPasses:error:", 0, 0);
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

- (PKSharingPushProvisioningInvitation)invitation
{
  return self->_invitation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong((id *)&self->_messageComposeViewController, 0);
  objc_storeStrong((id *)&self->_passThumbnailImage, 0);
  objc_storeStrong((id *)&self->_provisioningTemplateIdentifier, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
}

@end
