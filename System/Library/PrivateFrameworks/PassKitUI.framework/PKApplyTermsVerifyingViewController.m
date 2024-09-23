@implementation PKApplyTermsVerifyingViewController

- (PKApplyTermsVerifyingViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 termsIdentifiers:(id)a6 applyPage:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PKApplyTermsVerifyingViewController *v16;
  PKApplyTermsVerifyingViewController *v17;
  uint64_t v18;
  NSSet *termsIdentifiers;
  id WeakRetained;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PKApplyTermsVerifyingViewController;
  v16 = -[PKExplanationViewController initWithContext:](&v22, sel_initWithContext_, a5);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_applyController, v12);
    v18 = objc_msgSend(v14, "copy");
    termsIdentifiers = v17->_termsIdentifiers;
    v17->_termsIdentifiers = (NSSet *)v18;

    objc_storeStrong((id *)&v17->_setupDelegate, a4);
    WeakRetained = objc_loadWeakRetained((id *)&v17->_applyController);
    v17->_featureIdentifier = objc_msgSend(WeakRetained, "featureIdentifier");

    objc_storeStrong((id *)&v17->_applyPage, a7);
  }

  return v17;
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
  v5.super_class = (Class)PKApplyTermsVerifyingViewController;
  -[PKApplyTermsVerifyingViewController dealloc](&v5, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKApplyTermsVerifyingViewController;
  -[PKExplanationViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 0);
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  -[PKApplyTermsVerifyingViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidesBackButton:", 1);

  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowPrivacyView:", 0);
  objc_msgSend(v4, "dockView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrimaryButton:", 0);
  objc_msgSend(v5, "footerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setManualEntryButton:", 0);
  objc_msgSend(v6, "setSetupLaterButton:", 0);
  -[PKApplyTermsVerifyingViewController _showActivationSpinner:](self, "_showActivationSpinner:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
  objc_msgSend(WeakRetained, "preferredLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedApplyFeatureString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleText:", v9);

  PKLocalizedApplyFeatureString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBodyText:", v10);

}

- (void)viewDidAppear:(BOOL)a3
{
  id WeakRetained;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PKApplyTermsVerifyingViewController;
  -[PKApplyTermsVerifyingViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
  objc_msgSend(WeakRetained, "applyFlowDidAppear");

  -[PKApplyTermsVerifyingViewController _processTerms](self, "_processTerms");
  v5 = objc_loadWeakRetained((id *)&self->_applyController);
  v6 = *MEMORY[0x1E0D68680];
  v9 = *MEMORY[0x1E0D68AA0];
  v10[0] = *MEMORY[0x1E0D68C50];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", 0, v6, v7);

}

- (void)viewWillDisappear:(BOOL)a3
{
  CLInUseAssertion *inUseAssertion;
  CLInUseAssertion *v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  objc_super v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)PKApplyTermsVerifyingViewController;
  -[PKApplyTermsVerifyingViewController viewWillDisappear:](&v9, sel_viewWillDisappear_, a3);
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    -[CLInUseAssertion invalidate](inUseAssertion, "invalidate");
    v5 = self->_inUseAssertion;
    self->_inUseAssertion = 0;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
  v7 = *MEMORY[0x1E0D68680];
  v10 = *MEMORY[0x1E0D68AA0];
  v11[0] = *MEMORY[0x1E0D68C58];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", 0, v7, v8);

}

- (void)_processTerms
{
  void *v3;
  void *v4;
  CLInUseAssertion *v5;
  CLInUseAssertion *inUseAssertion;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id *v13;
  PKApplyRequiredFieldsPage *applyPage;
  PKApplyRequiredFieldsPage *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD aBlock[4];
  id v24;
  PKApplyTermsVerifyingViewController *v25;
  id v26;
  id location;

  if (!self->_isProcessingTerms)
  {
    if (!self->_inUseAssertion)
    {
      v3 = (void *)MEMORY[0x1E0C9E3A8];
      PKPassKitCoreBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (CLInUseAssertion *)objc_msgSend(v3, "newAssertionForBundle:withReason:", v4, CFSTR("Acceping application terms"));
      inUseAssertion = self->_inUseAssertion;
      self->_inUseAssertion = v5;

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
    objc_msgSend(WeakRetained, "preferredLanguage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    self->_isProcessingTerms = 1;
    objc_initWeak(&location, self);
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke;
    aBlock[3] = &unk_1E3E780E8;
    objc_copyWeak(&v26, &location);
    v10 = v8;
    v24 = v10;
    v25 = self;
    v11 = _Block_copy(aBlock);
    if (-[NSSet count](self->_termsIdentifiers, "count") < 2)
    {
      applyPage = self->_applyPage;
      v12 = objc_loadWeakRetained((id *)&self->_applyController);
      if (applyPage)
      {
        v15 = self->_applyPage;
        v19[0] = v9;
        v19[1] = 3221225472;
        v19[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_13;
        v19[3] = &unk_1E3E642F8;
        v20 = v11;
        objc_msgSend(v12, "submitFieldsPage:completion:", v15, v19);
        v13 = &v20;
      }
      else
      {
        -[NSSet anyObject](self->_termsIdentifiers, "anyObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v9;
        v17[1] = 3221225472;
        v17[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_15;
        v17[3] = &unk_1E3E642F8;
        v18 = v11;
        objc_msgSend(v12, "termsAccepted:termsIdentifier:secondaryIdentifier:actionIdentifier:completion:", 1, v16, 0, 0, v17);
        v13 = &v18;

      }
    }
    else
    {
      v12 = objc_loadWeakRetained((id *)&self->_applyController);
      v21[0] = v9;
      v21[1] = 3221225472;
      v21[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_11;
      v21[3] = &unk_1E3E642F8;
      v22 = v11;
      objc_msgSend(v12, "nextViewControllerWithCompletion:", v21);
      v13 = &v22;
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  void *v26;
  void *v27;
  id v28;
  dispatch_time_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  dispatch_time_t v34;
  uint64_t v35;
  _QWORD block[4];
  id v37;
  id *v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id *v42;
  _QWORD v43[4];
  id *v44;
  _QWORD v45[4];
  id *v46;
  _QWORD v47[4];
  id *v48;
  _QWORD v49[4];
  id *v50;

  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0D66D00], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "completedDiscoveryItemCTAWithCompletion:", 0);

      v9 = objc_loadWeakRetained(WeakRetained + 129);
      objc_msgSend(v9, "featureApplication");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "applicationState");

      if (v11 != 6)
      {
        objc_msgSend(WeakRetained, "navigationController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_3;
        v47[3] = &unk_1E3E62288;
        v48 = WeakRetained;
        objc_msgSend(v27, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v47);

        v12 = v48;
        goto LABEL_9;
      }
      objc_msgSend(WeakRetained, "explanationView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedApplyFeatureString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTitleText:", v13);

      PKLocalizedApplyFeatureString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBodyText:", v14);

      objc_msgSend(WeakRetained, "_showActivationSpinner:", 0);
      objc_msgSend(WeakRetained, "explanationView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setShowCheckmark:", 1);

      objc_msgSend(WeakRetained, "navigationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_2;
      v49[3] = &unk_1E3E62288;
      v50 = WeakRetained;
      objc_msgSend(v16, "pk_presentPaymentSetupViewController:animated:delay:completion:", v5, 1, 2000000000, v49);

      v17 = v50;
    }
    else if (v6)
    {
      PKTitleForDisplayableError();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x1A1AE46BC](v6);
      v35 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v12, v35, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedApplyFeatureString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_4;
      v45[3] = &unk_1E3E61D68;
      v21 = WeakRetained;
      v46 = v21;
      objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 0, v45);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addAction:", v22);

      v23 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedApplyFeatureString();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_5;
      v43[3] = &unk_1E3E61D68;
      v25 = v21;
      v44 = v25;
      objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 1, v43);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addAction:", v26);

      objc_msgSend(v25, "presentViewController:animated:completion:", v18, 1, 0);
      v17 = (void *)v35;
    }
    else
    {
      v28 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1032));
      objc_msgSend(v28, "account");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        *((_BYTE *)WeakRetained + 1056) = 0;
        objc_msgSend(WeakRetained, "_showActivationSpinner:", 0);
        objc_msgSend(WeakRetained, "_terminateSetupFlow");
        goto LABEL_9;
      }
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1064) != 5)
      {
        objc_msgSend(WeakRetained, "explanationView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedApplyFeatureString();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setTitleText:", v31);

        PKLocalizedApplyFeatureString();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setBodyText:", v32);

        objc_msgSend(WeakRetained, "_showActivationSpinner:", 0);
        objc_msgSend(WeakRetained, "explanationView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setShowCheckmark:", 1);

        v34 = dispatch_time(0, 2000000000);
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_6;
        v41[3] = &unk_1E3E612E8;
        v42 = WeakRetained;
        dispatch_after(v34, MEMORY[0x1E0C80D38], v41);

        goto LABEL_9;
      }
      v29 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_7;
      block[3] = &unk_1E3E685F8;
      v37 = v12;
      objc_copyWeak(&v40, (id *)(a1 + 48));
      v38 = WeakRetained;
      v39 = *(id *)(a1 + 32);
      dispatch_after(v29, MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(&v40);
      v17 = v37;
    }

LABEL_9:
  }

}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1056) = 0;
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "_terminateSetupFlow");
  return result;
}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_3(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1056) = 0;
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "_terminateSetupFlow");
  return result;
}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_4(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1056) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_processTerms");
}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_5(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1056) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_terminateSetupFlow");
}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_6(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1056) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_terminateSetupFlow");
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_7(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;

  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__56;
  v34[4] = __Block_byref_object_dispose__56;
  v35 = 0;
  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKSetLastFraudEventDateForAccountIdentifier();

  v5 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  v6 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_39;
  v30[3] = &unk_1E3E63610;
  v7 = v2;
  v31 = v7;
  v8 = v3;
  v32 = v8;
  v33 = v34;
  objc_msgSend(v5, "addOperation:", v30);
  v26[0] = v6;
  v26[1] = 3221225472;
  v26[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_43;
  v26[3] = &unk_1E3E658E0;
  v29 = v34;
  v9 = v7;
  v27 = v9;
  v10 = v8;
  v28 = v10;
  objc_msgSend(v5, "addOperation:", v26);
  v23[0] = v6;
  v23[1] = 3221225472;
  v23[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_46;
  v23[3] = &unk_1E3E65A40;
  v11 = v9;
  v24 = v11;
  v12 = v10;
  v25 = v12;
  objc_msgSend(v5, "addOperation:", v23);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_2_51;
  v16[3] = &unk_1E3E780C0;
  objc_copyWeak(&v22, a1 + 7);
  v14 = v12;
  v17 = v14;
  v21 = v34;
  v18 = a1[5];
  v19 = a1[6];
  v20 = a1[4];
  v15 = (id)objc_msgSend(v5, "evaluateWithInput:completion:", v13, v16);

  objc_destroyWeak(&v22);
  _Block_object_dispose(v34, 8);

}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_39(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v9 = (void *)a1[4];
  v8 = (void *)a1[5];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_2_40;
  v14[3] = &unk_1E3E77FB8;
  v10 = v8;
  v11 = a1[6];
  v17 = v7;
  v18 = v11;
  v15 = v10;
  v16 = v6;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v9, "accountWithIdentifier:completion:", v10, v14);

}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_2_40(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      v12 = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Created account with identifier %@ is missing on device with error %@", (uint8_t *)&v12, 0x16u);
    }

  }
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  (*(void (**)(void))(a1[6] + 16))();
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_43(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    (*((void (**)(id, id, _QWORD))v9 + 2))(v9, v8, 0);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Updating accounts because the new account is missing on device", buf, 2u);
    }

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_44;
    v15[3] = &unk_1E3E77FE0;
    v12 = *(void **)(a1 + 32);
    v13 = *(id *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v16 = v13;
    v19 = v14;
    v18 = v10;
    v17 = v8;
    objc_msgSend(v12, "updateAccountsWithCompletion:", v15);

  }
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_44(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  BOOL v19;
  int v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v6;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Could not update accounts with error %@", buf, 0xCu);
    }

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v13, "accountIdentifier", (_QWORD)v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)a1[4];
        v16 = v14;
        v17 = v15;
        if (v16 == v17)
        {

LABEL_19:
          v21 = *(_QWORD *)(a1[7] + 8);
          v22 = v13;
          v16 = *(id *)(v21 + 40);
          *(_QWORD *)(v21 + 40) = v22;
LABEL_20:

          continue;
        }
        v18 = v17;
        if (v16)
          v19 = v17 == 0;
        else
          v19 = 1;
        if (v19)
        {

          goto LABEL_20;
        }
        v20 = objc_msgSend(v16, "isEqualToString:", v17);

        if (v20)
          goto LABEL_19;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_46(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v9 = *(void **)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_2_47;
  v12[3] = &unk_1E3E65890;
  v14 = v6;
  v15 = v7;
  v13 = v8;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "updatePaymentFundingSourcesForAccountIdentifier:force:completion:", v13, 1, v12);

}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_2_47(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Could not update bank accounts with error %@", (uint8_t *)&v9, 0xCu);
    }

  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "pk_arrayByApplyingBlock:", &__block_literal_global_206);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKSetFundingSourceIdsMigratedToSavings();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_48(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_2_51(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_3_52;
  v4[3] = &unk_1E3E78098;
  objc_copyWeak(&v10, (id *)(a1 + 72));
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 64);
  v5 = v2;
  v9 = v3;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E0C80D38], v4);

  objc_destroyWeak(&v10);
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_3_52(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKPassPresentationContext *v9;
  id v10;
  PKPassPresentationContext *v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  dispatch_time_t v22;
  _QWORD v23[5];
  _QWORD v24[4];
  PKPassPresentationContext *v25;
  void (**v26)(_QWORD);
  _QWORD v27[4];
  id v28;
  id v29;
  PKPassPresentationContext *v30;
  id v31;
  id v32;
  _QWORD aBlock[6];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    PKSetAccountServiceIsNewAccountWithAccountIdentifier();
    v3 = *(_QWORD *)(a1 + 64);
    if (*(_QWORD *)(*(_QWORD *)(v3 + 8) + 40))
    {
      v4 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_4_53;
      aBlock[3] = &unk_1E3E78048;
      aBlock[4] = v3;
      v5 = _Block_copy(aBlock);
      objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "account");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "currentBalance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(PKPassPresentationContext);
      -[PKPassPresentationContext setPresentationSource:](v9, "setPresentationSource:", 1);
      v27[0] = v4;
      v27[1] = 3221225472;
      v27[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_6_62;
      v27[3] = &unk_1E3E66418;
      v28 = *(id *)(a1 + 40);
      v29 = *(id *)(a1 + 48);
      v10 = v5;
      v32 = v10;
      v11 = v9;
      v30 = v11;
      v31 = WeakRetained;
      v12 = (void (**)(_QWORD))_Block_copy(v27);
      objc_msgSend(v8, "amount");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "compare:", v14);

      if (v15 == 1)
      {
        v16 = objc_alloc_init(MEMORY[0x1E0D669F0]);
        objc_msgSend(*(id *)(a1 + 56), "accountBaseURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBaseURL:", v17);

        objc_msgSend(*(id *)(a1 + 56), "accountIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAccountIdentifier:", v18);

        objc_msgSend(v16, "setType:", 2);
        objc_msgSend(v16, "setCurrencyAmount:", v8);
        objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_8;
        v24[3] = &unk_1E3E78070;
        v25 = v11;
        v26 = v12;
        objc_msgSend(v19, "transferEligibilityWithRequest:completion:", v16, v24);

      }
      else
      {
        v12[2](v12);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "explanationView");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      PKLocalizedApplyFeatureString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTitleText:", v20);

      PKLocalizedApplyFeatureString();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBodyText:", v21);

      objc_msgSend(*(id *)(a1 + 40), "_showActivationSpinner:", 0);
      v22 = dispatch_time(0, 2000000000);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_10;
      v23[3] = &unk_1E3E612E8;
      v23[4] = WeakRetained;
      dispatch_after(v22, MEMORY[0x1E0C80D38], v23);
    }

  }
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_4_53(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  PKAccountViewInterfaceConfiguration *v8;
  void *v9;
  void *v10;
  void *v11;
  PKAccountViewInterfaceConfiguration *v12;
  PKAccountViewInterfaceConfiguration *v13;
  _QWORD v14[4];
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_alloc_init(PKAccountViewInterfaceConfiguration);
    -[PKAccountViewInterfaceConfiguration setAccount:](v8, "setAccount:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    -[PKAccountViewInterfaceConfiguration setDestination:](v8, "setDestination:", 0);
    -[PKAccountViewInterfaceConfiguration setViewStyle:](v8, "setViewStyle:", 0);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_5_56;
    v14[3] = &unk_1E3E62288;
    v15 = v6;
    objc_msgSend(v7, "presentAccountWithConfiguration:presentationContext:animated:completion:", v8, v5, 0, v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rootViewController");
    v8 = (PKAccountViewInterfaceConfiguration *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v8;
    else
      v12 = 0;
    v13 = v12;
    if (v13)
      -[PKAccountViewInterfaceConfiguration presentFeatureSetupOrFeaturePass:referrerIdentifier:presentationContext:completion:](v13, "presentFeatureSetupOrFeaturePass:referrerIdentifier:presentationContext:completion:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "feature"), 0, v5, 0);
    else
      objc_msgSend(v6, "_terminateSetupFlow");

  }
}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_5_56(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminateSetupFlow");
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_6_62(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  id v7;
  uint64_t v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "explanationView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedApplyFeatureString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitleText:", v3);

  PKLocalizedApplyFeatureString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBodyText:", v4);

  objc_msgSend(*(id *)(a1 + 32), "_showActivationSpinner:", 0);
  objc_msgSend(*(id *)(a1 + 32), "explanationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowCheckmark:", 1);

  v6 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_7_63;
  block[3] = &unk_1E3E6A580;
  v12 = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v10 = v7;
  v11 = v8;
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);

}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_7_63(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_9;
  v9[3] = &unk_1E3E622D8;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_9(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "eligibility") == 1 && !*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 48), "setPresentationSource:", 2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminateSetupFlow");
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_12;
  block[3] = &unk_1E3E6A580;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_12(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_14;
  block[3] = &unk_1E3E6A580;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_14(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_16;
  block[3] = &unk_1E3E6A580;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_16(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_showActivationSpinner:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowSpinner:", v3);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setIdleTimerDisabled:forReason:", v3, CFSTR("Submitting Application Terms"));

  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("enabled");
    if (v3)
      v7 = CFSTR("disabled");
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = CFSTR("Submitting Application Terms");
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Idle timer is: %@ for reason: %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v4, "dockView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setButtonsEnabled:", v3 ^ 1);

}

- (void)_terminateSetupFlow
{
  NSObject *v3;
  PKPaymentSetupViewControllerDelegate *setupDelegate;
  void *v5;
  uint8_t v6[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Terminating setup flow", v6, 2u);
  }

  setupDelegate = self->_setupDelegate;
  if (setupDelegate)
  {
    -[PKPaymentSetupViewControllerDelegate viewControllerDidTerminateSetupFlow:](setupDelegate, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKApplyTermsVerifyingViewController presentingViewController](self, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (id)analyticsPageTag
{
  return (id)*MEMORY[0x1E0D68680];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applyPage, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_setupDelegate, 0);
  objc_storeStrong((id *)&self->_termsIdentifiers, 0);
  objc_destroyWeak((id *)&self->_applyController);
}

@end
