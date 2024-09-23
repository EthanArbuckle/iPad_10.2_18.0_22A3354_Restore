@implementation PKApplyExplanationViewController

- (PKApplyExplanationViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 applyPage:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKApplyExplanationViewController *v14;
  PKApplyExplanationViewController *v15;
  uint64_t v16;
  objc_super v18;
  _QWORD v19[4];
  id v20;
  objc_super v21;
  _QWORD v22[4];
  id v23;
  objc_super v24;
  _QWORD v25[4];
  id v26;
  objc_super v27;
  _QWORD v28[4];
  id v29;
  objc_super v30;
  _QWORD v31[4];
  id v32;
  objc_super v33;
  _QWORD v34[4];
  id v35;
  id location;
  objc_super v37;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v37.receiver = self;
  v37.super_class = (Class)PKApplyExplanationViewController;
  v14 = -[PKDynamicProvisioningPageViewController initWithPage:context:](&v37, sel_initWithPage_context_, v13, a5);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_setupDelegate, v12);
    objc_storeStrong((id *)&v15->_controller, a3);
    objc_initWeak(&location, v15);
    v16 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke;
    v34[3] = &unk_1E3E61310;
    objc_copyWeak(&v35, &location);
    v33.receiver = v15;
    v33.super_class = (Class)PKApplyExplanationViewController;
    -[PKDynamicProvisioningPageViewController setPrimaryButtonAction:](&v33, sel_setPrimaryButtonAction_, v34);
    v31[0] = v16;
    v31[1] = 3221225472;
    v31[2] = __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke_2;
    v31[3] = &unk_1E3E61310;
    objc_copyWeak(&v32, &location);
    v30.receiver = v15;
    v30.super_class = (Class)PKApplyExplanationViewController;
    -[PKDynamicProvisioningPageViewController setSecondaryButtonAction:](&v30, sel_setSecondaryButtonAction_, v31);
    v28[0] = v16;
    v28[1] = 3221225472;
    v28[2] = __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke_3;
    v28[3] = &unk_1E3E61310;
    objc_copyWeak(&v29, &location);
    v27.receiver = v15;
    v27.super_class = (Class)PKApplyExplanationViewController;
    -[PKDynamicProvisioningPageViewController setCancelButtonAction:](&v27, sel_setCancelButtonAction_, v28);
    v25[0] = v16;
    v25[1] = 3221225472;
    v25[2] = __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke_4;
    v25[3] = &unk_1E3E61310;
    objc_copyWeak(&v26, &location);
    v24.receiver = v15;
    v24.super_class = (Class)PKApplyExplanationViewController;
    -[PKDynamicProvisioningPageViewController setDoneButtonAction:](&v24, sel_setDoneButtonAction_, v25);
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke_5;
    v22[3] = &unk_1E3E61310;
    objc_copyWeak(&v23, &location);
    v21.receiver = v15;
    v21.super_class = (Class)PKApplyExplanationViewController;
    -[PKDynamicProvisioningPageViewController setBodyButtonAction:](&v21, sel_setBodyButtonAction_, v22);
    v19[0] = v16;
    v19[1] = 3221225472;
    v19[2] = __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke_6;
    v19[3] = &unk_1E3E62DF8;
    objc_copyWeak(&v20, &location);
    v18.receiver = v15;
    v18.super_class = (Class)PKApplyExplanationViewController;
    -[PKDynamicProvisioningPageViewController setLinkAction:](&v18, sel_setLinkAction_, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_continue");
    WeakRetained = v2;
  }

}

void __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_auxiliary");
    WeakRetained = v2;
  }

}

void __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cancel");
    WeakRetained = v2;
  }

}

void __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_done");
    WeakRetained = v2;
  }

}

void __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_learnMore");
    WeakRetained = v2;
  }

}

void __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke_6(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_linkAction:", v5);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKApplyExplanationViewController;
  -[PKDynamicProvisioningPageViewController viewDidLoad](&v17, sel_viewDidLoad);
  -[PKApplyExplanationViewController currentPage](self, "currentPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (objc_class *)MEMORY[0x1E0C99E60];
    v6 = v4;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithObjects:", CFSTR("newParticipantInvitationAcceptance"), CFSTR("participantToParticipantInvitationAcceptance"), CFSTR("participantToCoOwnerInvitationAcceptance"), CFSTR("newCoOwnerInvitationAcceptance"), CFSTR("ownerToCoOwnerInvitationAcceptance"), 0);
    v8 = objc_msgSend(v7, "containsObject:", v6);

    if (v8)
    {
      -[PKExplanationViewController explanationView](self, "explanationView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setShowPrivacyView:", 1);
      objc_msgSend(MEMORY[0x1E0D65190], "pk_privacyLinkForContext:", 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKExplanationViewController setPrivacyLinkController:](self, "setPrivacyLinkController:", v10);

      -[PKApplyExplanationViewController navigationItem](self, "navigationItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHidesBackButton:", 0);

    }
  }
  -[PKApplyExplanationViewController controller](self, "controller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "applicationType");
  if ((unint64_t)(v13 - 2) < 2)
  {
    -[PKExplanationViewController explanationView](self, "explanationView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "image");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      PKFeatureApplicationHeaderImageWithImage(objc_msgSend(v12, "featureIdentifier"), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setImage:", v16);

    }
    objc_msgSend(v14, "setTopMargin:", 30.0);

    goto LABEL_11;
  }
  if (v13 == 4 && objc_msgSend(v12, "updateUserInfoSubType") == 4)
  {
    -[PKExplanationViewController explanationView](self, "explanationView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImageStyle:", 1);
LABEL_11:

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PKApplyController *controller;
  void *v11;
  void *v12;
  objc_super v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)PKApplyExplanationViewController;
  -[PKApplyExplanationViewController viewDidAppear:](&v13, sel_viewDidAppear_, a3);
  -[PKApplyExplanationViewController controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applyFlowDidAppear");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__featureApplicationUpdated, CFSTR("PKApplyControllerUpdatedNotification"), 0);

  v6 = objc_alloc(MEMORY[0x1E0C99E08]);
  v14 = *MEMORY[0x1E0D68AA0];
  v15[0] = *MEMORY[0x1E0D68C50];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithDictionary:", v7);

  -[PKApplyExplanationViewController analyticsAdditionalValues](self, "analyticsAdditionalValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v9);

  controller = self->_controller;
  -[PKApplyExplanationViewController currentPage](self, "currentPage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyExplanationViewController analyticsPageTag](self, "analyticsPageTag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyController reportAnalyticsDictionaryForPage:pageTag:additionalValues:](controller, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v11, v12, v8);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PKApplyController *controller;
  void *v10;
  void *v11;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)PKApplyExplanationViewController;
  -[PKApplyExplanationViewController viewDidDisappear:](&v12, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("PKApplyControllerUpdatedNotification"), 0);

  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  v13 = *MEMORY[0x1E0D68AA0];
  v14[0] = *MEMORY[0x1E0D68C58];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDictionary:", v6);

  -[PKApplyExplanationViewController analyticsAdditionalValues](self, "analyticsAdditionalValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v8);

  controller = self->_controller;
  -[PKApplyExplanationViewController currentPage](self, "currentPage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyExplanationViewController analyticsPageTag](self, "analyticsPageTag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyController reportAnalyticsDictionaryForPage:pageTag:additionalValues:](controller, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v10, v11, v7);

}

- (id)analyticsPageTag
{
  return (id)*MEMORY[0x1E0D68640];
}

- (id)analyticsAdditionalValues
{
  return 0;
}

- (void)_continue
{
  -[PKApplyExplanationViewController _analyticsReportButtonTap:](self, "_analyticsReportButtonTap:", *MEMORY[0x1E0D68958]);
  -[PKApplyExplanationViewController _performActionForBlock:](self, "_performActionForBlock:", self->_continueAction);
}

- (void)_auxiliary
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  -[PKApplyExplanationViewController _analyticsReportButtonTap:](self, "_analyticsReportButtonTap:", *MEMORY[0x1E0D68790]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("ownerToParticipantImportantInfo"), CFSTR("coOwnerToParticipantImportantInfo"), CFSTR("coOwnerToCoOwnerImportantInfo"), CFSTR("mergeCombinedLimitFailure"), CFSTR("invitationUnavailable"), CFSTR("invitationIneligible"), 0);
  -[PKApplyExplanationViewController currentPage](self, "currentPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "containsObject:", v4);

  if (v5)
    -[PKApplyExplanationViewController _presentInvitationContactSupport](self, "_presentInvitationContactSupport");
  else
    -[PKApplyExplanationViewController _performActionForBlock:](self, "_performActionForBlock:", self->_auxiliaryAction);

}

- (void)_learnMore
{
  -[PKApplyExplanationViewController _analyticsReportButtonTap:](self, "_analyticsReportButtonTap:", *MEMORY[0x1E0D68DB0]);
  -[PKApplyExplanationViewController _performLearnMoreAction](self, "_performLearnMoreAction");
}

- (void)_done
{
  -[PKApplyExplanationViewController _analyticsReportButtonTap:](self, "_analyticsReportButtonTap:", *MEMORY[0x1E0D68A68]);
  -[PKApplyExplanationViewController _performDoneAction:](self, "_performDoneAction:", 1);
}

- (void)_cancel
{
  -[PKApplyExplanationViewController _analyticsReportButtonTap:](self, "_analyticsReportButtonTap:", *MEMORY[0x1E0D688E8]);
  -[PKApplyExplanationViewController _performDoneAction:](self, "_performDoneAction:", 0);
}

- (void)_linkAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKAccountTermsAndConditionsController *v9;
  void *v10;
  PKAccountTermsAndConditionsController *v11;
  PKAccountTermsAndConditionsController *termsController;
  PKAccountTermsAndConditionsController *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "linkURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "termsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyExplanationViewController controller](self, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v8)
    {
      v9 = [PKAccountTermsAndConditionsController alloc];
      objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PKAccountTermsAndConditionsController initWithAccount:webService:context:termsIdentifier:](v9, "initWithAccount:webService:context:termsIdentifier:", v8, v10, -[PKExplanationViewController context](self, "context"), v6);
      termsController = self->_termsController;
      self->_termsController = v11;

      objc_initWeak(location, self);
      v13 = self->_termsController;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __48__PKApplyExplanationViewController__linkAction___block_invoke;
      v19[3] = &unk_1E3E62598;
      objc_copyWeak(&v20, location);
      -[PKAccountTermsAndConditionsController termsViewControllerWithCompletion:](v13, "termsViewControllerWithCompletion:", v19);
      objc_destroyWeak(&v20);
      objc_destroyWeak(location);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v6;
        _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "Error: there is no account on PKApplyController in order to open termsIdentifier %@", (uint8_t *)location, 0xCu);
      }

    }
  }
  else if (v5)
  {
    objc_msgSend(v5, "scheme");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsString:", CFSTR("http"));

    if (v15)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5600]), "initWithURL:", v5);
      objc_msgSend(v16, "setModalPresentationStyle:", 2);
      -[PKApplyExplanationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "openSensitiveURL:withOptions:", v5, 0);

    }
  }

}

void __48__PKApplyExplanationViewController__linkAction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      objc_msgSend(WeakRetained, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);

    }
    else if (v9)
    {
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v9, 1, 0);
    }
  }

}

- (void)_analyticsReportButtonTap:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  PKApplyController *controller;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = *MEMORY[0x1E0D68B18];
  v8 = *MEMORY[0x1E0D68858];
  v15[0] = *MEMORY[0x1E0D68AA0];
  v15[1] = v8;
  v16[0] = v7;
  v16[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithDictionary:", v9);

  -[PKApplyExplanationViewController analyticsAdditionalValues](self, "analyticsAdditionalValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addEntriesFromDictionary:", v11);

  controller = self->_controller;
  -[PKApplyExplanationViewController currentPage](self, "currentPage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyExplanationViewController analyticsPageTag](self, "analyticsPageTag");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyController reportAnalyticsDictionaryForPage:pageTag:additionalValues:](controller, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v13, v14, v10);

}

- (void)_performActionForBlock:(id)a3
{
  uint64_t (**v4)(void);
  int v5;
  uint64_t (**v6)(void);
  uint64_t (**v7)(void);

  v4 = (uint64_t (**)(void))a3;
  v7 = v4;
  if (!v4 || (v5 = v4[2](), v6 = v7, v5))
  {
    -[PKApplyExplanationViewController handleNextStep](self, "handleNextStep");
    v6 = v7;
  }

}

- (void)_performLearnMoreAction
{
  uint64_t (**v3)(void);
  int v4;
  uint64_t (**v5)(void);
  uint64_t (**v6)(void);

  v3 = (uint64_t (**)(void))_Block_copy(self->_learnMoreAction);
  v6 = v3;
  if (!v3 || (v4 = v3[2](), v5 = v6, v4))
  {
    -[PKApplyExplanationViewController _bodyButtonAction](self, "_bodyButtonAction");
    v5 = v6;
  }

}

- (void)_performDoneAction:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t (**v5)(void *, _BOOL8);
  int v6;
  uint64_t (**v7)(void *, _BOOL8);
  uint64_t (**v8)(void *, _BOOL8);

  v3 = a3;
  v5 = (uint64_t (**)(void *, _BOOL8))_Block_copy(self->_doneAction);
  v8 = v5;
  if (!v5 || (v6 = v5[2](v5, v3), v7 = v8, v6))
  {
    -[PKApplyExplanationViewController handleNextStep](self, "handleNextStep");
    v7 = v8;
  }

}

- (void)handleNextStep
{
  PKApplyController *controller;
  _QWORD v4[4];
  id v5;
  id location;

  -[PKApplyExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
  objc_initWeak(&location, self);
  controller = self->_controller;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__PKApplyExplanationViewController_handleNextStep__block_invoke;
  v4[3] = &unk_1E3E62598;
  objc_copyWeak(&v5, &location);
  -[PKApplyController nextViewControllerWithCompletion:](controller, "nextViewControllerWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__PKApplyExplanationViewController_handleNextStep__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleNextViewController:displayableError:", v8, v5);

}

- (void)handleNextViewController:(id)a3 displayableError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    -[PKApplyExplanationViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __78__PKApplyExplanationViewController_handleNextViewController_displayableError___block_invoke;
    v22[3] = &unk_1E3E62288;
    v22[4] = self;
    objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v6, 1, v22);
LABEL_21:

    goto LABEL_22;
  }
  if (v7)
  {
    objc_msgSend(v7, "underlyingErrors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)*MEMORY[0x1E0D69A20];
    v13 = v11;
    v14 = v12;
    if (v13 == v14)
    {

    }
    else
    {
      v15 = v14;
      if (!v13 || !v14)
      {

LABEL_14:
        goto LABEL_15;
      }
      v16 = objc_msgSend(v13, "isEqualToString:", v14);

      if (!v16)
        goto LABEL_14;
    }
    v17 = objc_msgSend(v9, "code");

    if (v17 == 1)
    {
      -[PKApplyExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 0);
      goto LABEL_21;
    }
LABEL_15:
    v18 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);
    if (v18)
    {
      -[PKApplyExplanationViewController navigationController](self, "navigationController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __78__PKApplyExplanationViewController_handleNextViewController_displayableError___block_invoke_2;
      v21[3] = &unk_1E3E612E8;
      v21[4] = self;
      objc_msgSend(v19, "presentViewController:animated:completion:", v18, 1, v21);

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v8;
        _os_log_impl(&dword_19D178000, v20, OS_LOG_TYPE_DEFAULT, "Error could not generate alertController for: %@", buf, 0xCu);
      }

      -[PKApplyExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 0);
      -[PKApplyExplanationViewController terminateSetupFlow](self, "terminateSetupFlow");
    }

    goto LABEL_21;
  }
  -[PKApplyExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 0);
  -[PKApplyExplanationViewController terminateSetupFlow](self, "terminateSetupFlow");
LABEL_22:

}

uint64_t __78__PKApplyExplanationViewController_handleNextViewController_displayableError___block_invoke(uint64_t a1, char a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 0);
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "terminateSetupFlow");
  return result;
}

uint64_t __78__PKApplyExplanationViewController_handleNextViewController_displayableError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 0);
}

- (void)terminateSetupFlow
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint8_t v7[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Terminating setup flow", v7, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKApplyExplanationViewController presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)showNavigationBarSpinner:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  objc_super v8;
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PKApplyExplanationViewController;
  -[PKExplanationViewController showNavigationBarSpinner:](&v8, sel_showNavigationBarSpinner_);
  self->_isLoading = v3;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setIdleTimerDisabled:forReason:", v3, CFSTR("Submitting Application information"));

  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("enabled");
    if (v3)
      v7 = CFSTR("disabled");
    *(_DWORD *)buf = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = CFSTR("Submitting Application information");
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Idle timer is: %@ for reason: %@", buf, 0x16u);
  }

}

- (void)_featureApplicationUpdated
{
  _BOOL4 isLoading;
  NSObject *v4;
  _BOOL4 v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  isLoading = self->_isLoading;
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isLoading)
  {
    if (v5)
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "%@ Application update received but current view controller is loading - skipping update", buf, 0xCu);

    }
  }
  else
  {
    if (v5)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "%@ Application update received presenting next step", buf, 0xCu);

    }
    -[PKApplyExplanationViewController controller](self, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__PKApplyExplanationViewController__featureApplicationUpdated__block_invoke;
    v12[3] = &unk_1E3E612E8;
    v12[4] = self;
    objc_msgSend(v10, "applicationUpdatedAlertControllerWithHandler:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKApplyExplanationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
  }
}

uint64_t __62__PKApplyExplanationViewController__featureApplicationUpdated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNextStep");
}

- (void)_bodyButtonAction
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PKPaymentMoreInformationViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PKNavigationController *v16;
  void *v17;
  id v18;

  -[PKDynamicProvisioningPageViewController page](self, "page");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "learnMore");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "buttonURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "termsIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "openURL:configuration:completionHandler:", v4, 0, 0);

  }
  else if (v5)
  {
    -[PKApplyExplanationViewController _presentTermsWithIdentifier:](self, "_presentTermsWithIdentifier:", v5);
  }
  else
  {
    v8 = -[PKPaymentMoreInformationViewController initWithContext:]([PKPaymentMoreInformationViewController alloc], "initWithContext:", -[PKExplanationViewController context](self, "context"));
    objc_msgSend(v18, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMoreInformationViewController setDetailTitle:](v8, "setDetailTitle:", v9);

    objc_msgSend(v18, "subtitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMoreInformationViewController setDetailSubtitle:](v8, "setDetailSubtitle:", v10);

    objc_msgSend(v18, "body");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMoreInformationViewController setDetailBody:](v8, "setDetailBody:", v11);

    objc_msgSend(v18, "businessChatIntentName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMoreInformationViewController setBusinessChatIntentName:](v8, "setBusinessChatIntentName:", v12);

    objc_msgSend(v18, "businessChatButtonTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMoreInformationViewController setBusinessChatButtonTitle:](v8, "setBusinessChatButtonTitle:", v13);

    -[PKApplyController featureApplication](self->_controller, "featureApplication");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "businessChatIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMoreInformationViewController setBusinessChatIdentifier:](v8, "setBusinessChatIdentifier:", v15);

    v16 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v8);
    -[PKApplyExplanationViewController navigationController](self, "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "presentModalViewController:withPaymentSetupContext:", v16, -[PKExplanationViewController context](self, "context"));

  }
}

- (void)_presentTermsWithIdentifier:(id)a3
{
  id v4;
  PKApplyTermsAndConditionsViewController *v5;
  void *v6;
  void *v7;
  PKApplyTermsAndConditionsViewController *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  -[PKApplyExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
  v5 = [PKApplyTermsAndConditionsViewController alloc];
  -[PKApplyExplanationViewController controller](self, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyExplanationViewController setupDelegate](self, "setupDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKApplyTermsAndConditionsViewController initWithController:setupDelegate:context:termsIdentifier:](v5, "initWithController:setupDelegate:context:termsIdentifier:", v6, v7, -[PKExplanationViewController context](self, "context"), v4);

  -[PKApplyTermsAndConditionsViewController setPreflightPDFTerms:](v8, "setPreflightPDFTerms:", 1);
  -[PKFeatureTermsAndConditionsViewController setUseModalPresentation:](v8, "setUseModalPresentation:", 1);
  objc_initWeak(&location, self);
  -[PKApplyExplanationViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__PKApplyExplanationViewController__presentTermsWithIdentifier___block_invoke;
  v10[3] = &unk_1E3E61C58;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v8, 1, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __64__PKApplyExplanationViewController__presentTermsWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "showNavigationBarSpinner:", 0);
    WeakRetained = v2;
  }

}

- (void)_presentInvitationContactSupport
{
  void *v3;
  void *v4;
  void *v5;
  PKBusinessChatController *v6;
  PKBusinessChatController *businessChatController;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  PKApplyExplanationViewController *v17;
  _QWORD *v18;
  _QWORD *v19;
  id v20;
  id location;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;

  if (+[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat"))
  {
    -[PKApplyExplanationViewController controller](self, "controller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "featureApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "businessChatIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (!self->_businessChatController)
      {
        v6 = objc_alloc_init(PKBusinessChatController);
        businessChatController = self->_businessChatController;
        self->_businessChatController = v6;

      }
      v8 = objc_alloc_init(MEMORY[0x1E0D66B90]);
      v30[0] = 0;
      v30[1] = v30;
      v30[2] = 0x3032000000;
      v30[3] = __Block_byref_object_copy__50;
      v30[4] = __Block_byref_object_dispose__50;
      v31 = 0;
      v9 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke;
      v27[3] = &unk_1E3E64F70;
      v10 = v3;
      v28 = v10;
      v29 = v30;
      objc_msgSend(v8, "addOperation:", v27);
      v25[0] = 0;
      v25[1] = v25;
      v25[2] = 0x3032000000;
      v25[3] = __Block_byref_object_copy__50;
      v25[4] = __Block_byref_object_dispose__50;
      v26 = 0;
      v22[0] = v9;
      v22[1] = 3221225472;
      v22[2] = __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_3;
      v22[3] = &unk_1E3E64F70;
      v11 = v10;
      v23 = v11;
      v24 = v25;
      objc_msgSend(v8, "addOperation:", v22);
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_5;
      v14[3] = &unk_1E3E756E0;
      v15 = v5;
      v18 = v30;
      v19 = v25;
      v16 = v11;
      v17 = self;
      objc_copyWeak(&v20, &location);
      v13 = (id)objc_msgSend(v8, "evaluateWithInput:completion:", v12, v14);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);

      _Block_object_dispose(v25, 8);
      _Block_object_dispose(v30, 8);

    }
  }
}

void __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_2;
  v12[3] = &unk_1E3E63688;
  v9 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v14 = v7;
  v15 = v8;
  v13 = v6;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "accountUserInvitationsWithCompletion:", v12);

}

uint64_t __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_4;
  v12[3] = &unk_1E3E63688;
  v9 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v14 = v7;
  v15 = v8;
  v13 = v6;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "featureApplicationsWithCompletion:", v12);

}

uint64_t __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  PKBusinessChatInvitationContext *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  PKBusinessChatInvitationContext *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = [PKBusinessChatInvitationContext alloc];
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "featureApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PKBusinessChatInvitationContext initWithBusinessChatIdentifier:account:invitation:pendingInvitations:featureApplications:](v8, "initWithBusinessChatIdentifier:account:invitation:pendingInvitations:featureApplications:", v9, v10, v11, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

  v13 = *(void **)(*(_QWORD *)(a1 + 48) + 1104);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_6;
  v14[3] = &unk_1E3E61DB8;
  objc_copyWeak(&v15, (id *)(a1 + 72));
  objc_msgSend(v13, "openBusinessChatWithContext:completion:", v12, v14);
  objc_destroyWeak(&v15);

}

void __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_7;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v5 = WeakRetained;
    if (v3)
    {
      v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

      WeakRetained = v5;
    }
    objc_msgSend(WeakRetained, "_continue");
    WeakRetained = v5;
  }

}

- (PKApplyController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (void)setSetupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_setupDelegate, a3);
}

- (id)continueAction
{
  return self->_continueAction;
}

- (void)setContinueAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1136);
}

- (id)auxiliaryAction
{
  return self->_auxiliaryAction;
}

- (void)setAuxiliaryAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1144);
}

- (id)learnMoreAction
{
  return self->_learnMoreAction;
}

- (void)setLearnMoreAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1152);
}

- (id)doneAction
{
  return self->_doneAction;
}

- (void)setDoneAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1160);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_doneAction, 0);
  objc_storeStrong(&self->_learnMoreAction, 0);
  objc_storeStrong(&self->_auxiliaryAction, 0);
  objc_storeStrong(&self->_continueAction, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
}

@end
