@implementation PKApplyOfferViewController

- (PKApplyOfferViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 applyPage:(id)a6
{
  id v10;
  PKApplyOfferViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *offerTermsIdentifier;
  uint64_t v17;
  PKPaymentInstallmentConfiguration *installmentConfiguration;
  uint64_t v19;
  void *v20;
  objc_super v22;

  v10 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKApplyOfferViewController;
  v11 = -[PKApplyExplanationViewController initWithController:setupDelegate:context:applyPage:](&v22, sel_initWithController_setupDelegate_context_applyPage_, v10, a4, a5, a6);
  if (v11)
  {
    objc_msgSend(v10, "featureApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "applicationOfferDetails");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "detailsInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "offerTermsIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    offerTermsIdentifier = v11->_offerTermsIdentifier;
    v11->_offerTermsIdentifier = (NSString *)v15;

    objc_msgSend(v10, "installmentConfiguration");
    v17 = objc_claimAutoreleasedReturnValue();
    installmentConfiguration = v11->_installmentConfiguration;
    v11->_installmentConfiguration = (PKPaymentInstallmentConfiguration *)v17;

    if (objc_msgSend(v14, "layout"))
    {
      v19 = objc_msgSend(v14, "layout");
    }
    else if (v11->_installmentConfiguration)
    {
      v19 = 2;
    }
    else
    {
      v19 = 1;
    }
    v11->_layout = v19;
    objc_msgSend(v10, "featureApplication");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_hasSufficientOTBForInstallment = objc_msgSend(v20, "hasSufficientOTBForInstallmentConfiguration:", v11->_installmentConfiguration);

  }
  return v11;
}

- (void)dealloc
{
  CLInUseAssertion *inUseAssertion;
  CLInUseAssertion *v4;
  objc_super v5;

  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    -[CLInUseAssertion invalidate](inUseAssertion, "invalidate");
    v4 = self->_inUseAssertion;
    self->_inUseAssertion = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)PKApplyOfferViewController;
  -[PKApplyOfferViewController dealloc](&v5, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKApplyOfferViewController;
  -[PKApplyExplanationViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[PKApplyExplanationViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "feature");
  if (v5 <= 5)
  {
    if (v5 == 2)
    {
      -[PKApplyOfferViewController _setupForBroadwayApplication:](self, "_setupForBroadwayApplication:", v4);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Error: Unsupported feature cannot present UI", v7, 2u);
      }

    }
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKApplyOfferViewController;
  -[PKApplyExplanationViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[PKApplyExplanationViewController controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "termsShownWithIdentifier:", self->_offerTermsIdentifier);

}

- (void)viewWillDisappear:(BOOL)a3
{
  CLInUseAssertion *inUseAssertion;
  CLInUseAssertion *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKApplyOfferViewController;
  -[PKApplyOfferViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    -[CLInUseAssertion invalidate](inUseAssertion, "invalidate");
    v5 = self->_inUseAssertion;
    self->_inUseAssertion = 0;

  }
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  void (**v12)(void *, void *);
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(void *, void *);
  _QWORD aBlock[5];
  id v20;
  void (**v21)(_QWORD, _QWORD);
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->_heroImage)
  {
    if (v4)
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
  else
  {
    -[PKApplyExplanationViewController currentPage](self, "currentPage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "heroImageURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v10)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "PKApplyOfferViewController preflighting", buf, 2u);
        }

        v11 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __54__PKApplyOfferViewController_preflightWithCompletion___block_invoke;
        aBlock[3] = &unk_1E3E6A748;
        aBlock[4] = self;
        v20 = v7;
        v21 = v5;
        v12 = (void (**)(void *, void *))_Block_copy(aBlock);
        objc_msgSend(MEMORY[0x1E0D66EA8], "sharedImageAssetDownloader");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "cachedDataForURL:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v12[2](v12, v14);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D66EA8], "sharedImageAssetDownloader");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17[0] = v11;
          v17[1] = 3221225472;
          v17[2] = __54__PKApplyOfferViewController_preflightWithCompletion___block_invoke_2;
          v17[3] = &unk_1E3E65260;
          v18 = v12;
          objc_msgSend(v16, "downloadFromUrl:completionHandler:", v8, v17);

        }
      }
      else
      {
        if (v10)
        {
          *(_DWORD *)buf = 138412290;
          v23 = v7;
          _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Could not create valid URL for :%@", buf, 0xCu);
        }

        if (v5)
          v5[2](v5, 1);
      }

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "PKApplyOfferViewController - nothing to preflight", buf, 2u);
      }

      if (v5)
        v5[2](v5, 1);
    }

  }
}

void __54__PKApplyOfferViewController_preflightWithCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  _QWORD block[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = a1[4];
    v6 = *(void **)(v5 + 1232);
    *(_QWORD *)(v5 + 1232) = v4;

    v7 = *(_QWORD *)(a1[4] + 1232);
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        v10 = a1[5];
        *(_DWORD *)buf = 138543362;
        v17 = v10;
        v11 = "Created image for URL: %{public}@";
LABEL_7:
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
      }
    }
    else if (v9)
    {
      v12 = a1[5];
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      v11 = "Failed to create image for URL: %{public}@";
      goto LABEL_7;
    }

  }
  v13 = (void *)a1[6];
  if (v13)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__PKApplyOfferViewController_preflightWithCompletion___block_invoke_16;
    block[3] = &unk_1E3E61590;
    v15 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __54__PKApplyOfferViewController_preflightWithCompletion___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__PKApplyOfferViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  NSObject *v4;
  id v5;
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
  uint8_t v16[8];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Offer terms accepted", v16, 2u);
  }

  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  v6 = *MEMORY[0x1E0D68858];
  v17[0] = *MEMORY[0x1E0D68AA0];
  v17[1] = v6;
  v7 = *MEMORY[0x1E0D68700];
  v18[0] = *MEMORY[0x1E0D68B18];
  v18[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithDictionary:", v8);

  -[PKApplyOfferViewController analyticsAdditionalValues](self, "analyticsAdditionalValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v10);

  -[PKApplyExplanationViewController controller](self, "controller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyExplanationViewController currentPage](self, "currentPage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyOfferViewController analyticsPageTag](self, "analyticsPageTag");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v12, v13, v9);

  -[PKApplyExplanationViewController currentPage](self, "currentPage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "primaryActionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyOfferViewController _termsAccepted:actionIdentifier:](self, "_termsAccepted:actionIdentifier:", 1, v15);

}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PKPaymentInstallmentConfiguration *installmentConfiguration;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  uint8_t v18[8];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0C99E08]);
  v5 = *MEMORY[0x1E0D68858];
  v19[0] = *MEMORY[0x1E0D68AA0];
  v19[1] = v5;
  v6 = *MEMORY[0x1E0D68808];
  v20[0] = *MEMORY[0x1E0D68B18];
  v20[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithDictionary:", v7);

  -[PKApplyOfferViewController analyticsAdditionalValues](self, "analyticsAdditionalValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v9);

  -[PKApplyExplanationViewController controller](self, "controller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyExplanationViewController currentPage](self, "currentPage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyOfferViewController analyticsPageTag](self, "analyticsPageTag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v11, v12, v8);

  installmentConfiguration = self->_installmentConfiguration;
  PKLogFacilityTypeGetObject();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (installmentConfiguration)
  {
    if (v15)
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Dismissing installment apply without declining", v18, 2u);
    }

    -[PKApplyOfferViewController _terminateApplyFlowWithoutDeclining](self, "_terminateApplyFlowWithoutDeclining");
  }
  else
  {
    if (v15)
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Offer terms declined", v18, 2u);
    }

    -[PKApplyExplanationViewController currentPage](self, "currentPage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "secondaryActionIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyOfferViewController _termsAccepted:actionIdentifier:](self, "_termsAccepted:actionIdentifier:", 0, v17);

  }
}

- (id)analyticsPageTag
{
  id *v2;

  if (self->_installmentConfiguration)
    v2 = (id *)MEMORY[0x1E0D68660];
  else
    v2 = (id *)MEMORY[0x1E0D68668];
  return *v2;
}

- (id)analyticsAdditionalValues
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  PKFeatureApplicationOfferDetailsInfoLayoutToString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D68DA8]);

  v4 = (void *)objc_msgSend(v2, "copy");
  return v4;
}

- (void)_setupForBroadwayApplication:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  PKApplyHeroCardView *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  PKApplyOfferCreditCardView *v19;
  PKApplyOfferCreditCardView *offerView;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  __CFString *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  __CFString *v50;
  void *v51;
  void *v52;
  __CFString *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  id location[2];

  v4 = a3;
  -[PKApplyExplanationViewController currentPage](self, "currentPage");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExplanationViewController explanationView](self, "explanationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "feature");
  objc_msgSend(v4, "applicationOfferDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "detailsInfo");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyExplanationViewController controller](self, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredLanguage");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKApplyOfferViewController heroImage](self, "heroImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "applicationType");
  v11 = self->_layout == 2 || v10 == 2;
  v52 = v9;
  if (v11)
  {
    PKFeatureApplicationHeaderImageWithImage(v6, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v12);
    objc_msgSend(v5, "setTopMargin:", 30.0);
  }
  else
  {
    if (v9)
    {
      objc_msgSend(v5, "setImage:", v9);
      goto LABEL_11;
    }
    PKProvisioningSecondaryBackgroundColor();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTopBackgroundColor:", v12);
    v13 = -[PKApplyHeroCardView initWithFeatureIdentifier:]([PKApplyHeroCardView alloc], "initWithFeatureIdentifier:", v6);
    -[PKApplyHeroCardView setBackgroundColor:](v13, "setBackgroundColor:", v12);
    objc_msgSend(v5, "setHeroView:", v13);

  }
LABEL_11:
  objc_msgSend(v7, "aprForPurchase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v15, "setNumberStyle:", 3);
    if ((objc_msgSend(v14, "pk_isIntegralNumber") & 1) == 0)
      objc_msgSend(v15, "setMinimumFractionDigits:", 2);
    objc_msgSend(v15, "stringFromNumber:", v14);
    v53 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v53 = CFSTR("-");
  }
  objc_initWeak(location, self);
  v16 = (void *)MEMORY[0x1E0DC3428];
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __59__PKApplyOfferViewController__setupForBroadwayApplication___block_invoke;
  v60[3] = &unk_1E3E62BD0;
  objc_copyWeak(&v61, location);
  objc_msgSend(v16, "actionWithHandler:", v60);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "disclosureTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v55 = v17;
  }
  else
  {
    PKLocalizedApplyFeatureString();
    v55 = (id)objc_claimAutoreleasedReturnValue();
  }

  v19 = -[PKApplyOfferCreditCardView initWithTermsLinkAction:actionTitle:]([PKApplyOfferCreditCardView alloc], "initWithTermsLinkAction:actionTitle:", v57, v55);
  offerView = self->_offerView;
  self->_offerView = v19;

  objc_msgSend(v56, "body");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_layout != 2)
  {
    objc_msgSend(v7, "currencyCode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PKMutableNumberFormatterForCurrencyCode();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v49, "minimumFractionDigits");
    -[PKApplyOfferCreditCardView creditLimitTitleLabel](self->_offerView, "creditLimitTitleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedApplyFeatureString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v23);

    objc_msgSend(v7, "creditLimit");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = CFSTR("-");
    if (v21 && v51)
    {
      if (objc_msgSend(v51, "pk_isIntegralNumber"))
        v24 = 0;
      else
        v24 = v47;
      objc_msgSend(v49, "setMinimumFractionDigits:", v24);
      objc_msgSend(v49, "stringFromNumber:", v51);
      v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    -[PKApplyOfferCreditCardView creditLimitLabel](self->_offerView, "creditLimitLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", v50);

    -[PKApplyOfferCreditCardView aprForPurchaseTitleLabel](self->_offerView, "aprForPurchaseTitleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedApplyFeatureString();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", v27);

    -[PKApplyOfferCreditCardView aprForPurchaseLabel](self->_offerView, "aprForPurchaseLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setText:", v53);

    v29 = objc_msgSend(v4, "applicationType");
    if (v29 < 2)
    {
      -[PKApplyOfferCreditCardView feeTitleLabel](self->_offerView, "feeTitleLabel");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedApplyFeatureString();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setText:", v34);
      v48 = v21;

      objc_msgSend(v7, "annualFee");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "isEqualToNumber:", v36);

      if (v37)
      {
        PKLocalizedApplyFeatureString();
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v38 = CFSTR("-");
        if (v48 && v35)
        {
          PKMutableNumberFormatterForCurrencyCode();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v35, "pk_isIntegralNumber"))
            v40 = 0;
          else
            v40 = v47;
          objc_msgSend(v39, "setMinimumFractionDigits:", v40);
          objc_msgSend(v39, "stringFromNumber:", v35);
          v38 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
      }
      -[PKApplyOfferCreditCardView feeLabel](self->_offerView, "feeLabel");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setText:", v38);
    }
    else
    {
      if (v29 - 2 > 1)
      {
LABEL_42:

        goto LABEL_43;
      }
      objc_msgSend(v7, "balance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30)
      {
        v32 = v30;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v38 = v32;

      -[PKApplyOfferCreditCardView feeTitleLabel](self->_offerView, "feeTitleLabel");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedApplyFeatureString();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setText:", v43);
      v48 = v21;

      objc_msgSend(v7, "currencyCode");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountMake();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "formattedStringValue");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKApplyOfferCreditCardView feeLabel](self->_offerView, "feeLabel");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setText:", v35);
    }

    v21 = v48;
    goto LABEL_42;
  }
LABEL_43:
  -[PKApplyOfferCreditCardView bodyLabel](self->_offerView, "bodyLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setText:", v54);

  objc_msgSend(v5, "setBodyView:", self->_offerView);
  objc_destroyWeak(&v61);
  objc_destroyWeak(location);

}

void __59__PKApplyOfferViewController__setupForBroadwayApplication___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_openTermsAndConditions");

}

- (void)_openTermsAndConditions
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  PKApplyTermsAndConditionsViewController *v13;
  void *v14;
  void *v15;
  PKApplyTermsAndConditionsViewController *v16;
  void *v17;
  uint8_t v18[8];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v4 = *MEMORY[0x1E0D69438];
  v19[0] = *MEMORY[0x1E0D68AA0];
  v19[1] = v4;
  v5 = *MEMORY[0x1E0D695C8];
  v20[0] = *MEMORY[0x1E0D68C08];
  v20[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithDictionary:", v6);

  -[PKApplyOfferViewController analyticsAdditionalValues](self, "analyticsAdditionalValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v8);

  -[PKApplyExplanationViewController controller](self, "controller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyExplanationViewController currentPage](self, "currentPage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyOfferViewController analyticsPageTag](self, "analyticsPageTag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v10, v11, v7);

  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Opening offer terms and conditions", v18, 2u);
  }

  v13 = [PKApplyTermsAndConditionsViewController alloc];
  -[PKApplyExplanationViewController controller](self, "controller");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyExplanationViewController setupDelegate](self, "setupDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PKApplyTermsAndConditionsViewController initWithController:setupDelegate:context:termsIdentifier:](v13, "initWithController:setupDelegate:context:termsIdentifier:", v14, v15, -[PKExplanationViewController context](self, "context"), self->_offerTermsIdentifier);

  -[PKFeatureTermsAndConditionsViewController setUseModalPresentation:](v16, "setUseModalPresentation:", 1);
  -[PKApplyOfferViewController navigationController](self, "navigationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pk_presentPaymentSetupViewController:animated:completion:", v16, 1, 0);

}

- (void)_terminateApplyFlowWithoutDeclining
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[PKApplyExplanationViewController setupDelegate](self, "setupDelegate");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (self->_installmentConfiguration)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    -[PKApplyExplanationViewController terminateSetupFlow](self, "terminateSetupFlow");
  }
  else
  {
    -[PKApplyExplanationViewController controller](self, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "featureApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKApplyExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__PKApplyOfferViewController__terminateApplyFlowWithoutDeclining__block_invoke;
    v8[3] = &unk_1E3E61310;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "viewController:canProceedWithInstallment:featureApplication:completion:", self, 0, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);

  }
}

void __65__PKApplyOfferViewController__terminateApplyFlowWithoutDeclining__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PKApplyOfferViewController__terminateApplyFlowWithoutDeclining__block_invoke_2;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __65__PKApplyOfferViewController__terminateApplyFlowWithoutDeclining__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "showNavigationBarSpinner:", 0);
    objc_msgSend(v2, "terminateSetupFlow");
    WeakRetained = v2;
  }

}

- (void)_termsAccepted:(BOOL)a3 actionIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  CLInUseAssertion *v9;
  CLInUseAssertion *inUseAssertion;
  void *v11;
  NSString *offerTermsIdentifier;
  _QWORD v13[5];
  id v14;
  BOOL v15;
  id location;

  v4 = a3;
  v6 = a4;
  if (!self->_inUseAssertion)
  {
    v7 = (void *)MEMORY[0x1E0C9E3A8];
    PKPassKitCoreBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (CLInUseAssertion *)objc_msgSend(v7, "newAssertionForBundle:withReason:", v8, CFSTR("Accepting application terms"));
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v9;

  }
  -[PKApplyExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
  objc_initWeak(&location, self);
  -[PKApplyExplanationViewController controller](self, "controller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  offerTermsIdentifier = self->_offerTermsIdentifier;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__PKApplyOfferViewController__termsAccepted_actionIdentifier___block_invoke;
  v13[3] = &unk_1E3E718E0;
  objc_copyWeak(&v14, &location);
  v15 = v4;
  v13[4] = self;
  objc_msgSend(v11, "termsAccepted:termsIdentifier:secondaryIdentifier:actionIdentifier:completion:", v4, offerTermsIdentifier, 0, v6, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __62__PKApplyOfferViewController__termsAccepted_actionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 48) && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1216))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PKSharedCacheSetObjectForKey();

    }
    objc_msgSend(*(id *)(a1 + 32), "setupDelegate");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1216))
      v11 = v9 == 0;
    else
      v11 = 1;
    if (v11 || (objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(WeakRetained, "handleNextViewController:displayableError:", v5, v6);
    }
    else
    {
      objc_msgSend(WeakRetained, "controller");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "featureApplication");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (*(_BYTE *)(a1 + 48))
        v14 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1224) != 0;
      else
        v14 = 0;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __62__PKApplyOfferViewController__termsAccepted_actionIdentifier___block_invoke_2;
      v15[3] = &unk_1E3E61400;
      v16 = WeakRetained;
      v17 = v5;
      v18 = v6;
      objc_msgSend(v10, "viewController:canProceedWithInstallment:featureApplication:completion:", v16, v14, v13, v15);

    }
  }

}

void __62__PKApplyOfferViewController__termsAccepted_actionIdentifier___block_invoke_2(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKApplyOfferViewController__termsAccepted_actionIdentifier___block_invoke_3;
  block[3] = &unk_1E3E61400;
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __62__PKApplyOfferViewController__termsAccepted_actionIdentifier___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNextViewController:displayableError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (UIImage)heroImage
{
  return self->_heroImage;
}

- (void)setHeroImage:(id)a3
{
  objc_storeStrong((id *)&self->_heroImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroImage, 0);
  objc_storeStrong((id *)&self->_installmentConfiguration, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_offerTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_offerView, 0);
  objc_storeStrong((id *)&self->_accountController, 0);
}

@end
