@implementation PKApplyDocumentSubmissionController

- (PKApplyDocumentSubmissionController)initWithController:(id)a3 setupDelegate:(id)a4 documentPage:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  PKApplyDocumentSubmissionController *v17;
  void *v18;
  void *v20;
  objc_super v21;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  v12 = objc_msgSend(v9, "context");
  v20 = v10;
  objc_msgSend(v10, "acceptableDocuments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "featureIdentifier");
  objc_msgSend(v9, "localizationBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredLanguage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)PKApplyDocumentSubmissionController;
  v17 = -[PKPaymentDocumentSubmissionController initWithSetupDelegate:context:acceptableDocuments:featureIdentifier:localizationBundle:preferredLanguage:](&v21, sel_initWithSetupDelegate_context_acceptableDocuments_featureIdentifier_localizationBundle_preferredLanguage_, v11, v12, v13, v14, v15, v16);

  if (v17)
  {
    objc_storeStrong((id *)&v17->_applyController, a3);
    objc_storeStrong((id *)&v17->_documentPage, a5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v17, sel__featureApplicationUpdated, CFSTR("PKApplyControllerUpdatedNotification"), 0);

  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[PKApplyDocumentSubmissionController removeApplicationUpdateObserver](self, "removeApplicationUpdateObserver");
  v3.receiver = self;
  v3.super_class = (Class)PKApplyDocumentSubmissionController;
  -[PKApplyDocumentSubmissionController dealloc](&v3, sel_dealloc);
}

- (void)removeApplicationUpdateObserver
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("PKApplyControllerUpdatedNotification"), 0);

}

- (id)nextViewController
{
  UIViewController *v3;
  UIViewController *nextViewController;
  objc_super v6;

  v3 = self->_nextViewController;
  nextViewController = self->_nextViewController;
  self->_nextViewController = 0;

  if (!v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)PKApplyDocumentSubmissionController;
    -[PKPaymentDocumentSubmissionController nextViewController](&v6, sel_nextViewController);
    v3 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)uploadID
{
  PKApplyController *applyController;
  PKApplyDocumentUploadPage *documentPage;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id location;

  if (-[PKPaymentDocumentSubmissionController state](self, "state") != 5)
  {
    -[PKPaymentDocumentSubmissionController setState:](self, "setState:", 5);
    self->_isLoading = 1;
    objc_initWeak(&location, self);
    applyController = self->_applyController;
    documentPage = self->_documentPage;
    -[PKPaymentDocumentSubmissionController selectedDocument](self, "selectedDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentDocumentSubmissionController frontID](self, "frontID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentDocumentSubmissionController backID](self, "backID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__PKApplyDocumentSubmissionController_uploadID__block_invoke;
    v8[3] = &unk_1E3E63C50;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    -[PKApplyController submitDocumentPage:selectedDocument:frontImage:backImage:completion:](applyController, "submitDocumentPage:selectedDocument:frontImage:backImage:completion:", documentPage, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __47__PKApplyDocumentSubmissionController_uploadID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id *WeakRetained;
  id *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  id *v17;
  uint64_t v18;
  id *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v26 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = objc_msgSend(WeakRetained, "state");
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIdleTimerDisabled:", 0);

    if (v6)
    {
      objc_msgSend(v6, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *MEMORY[0x1E0CB3388];
      objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CB3388]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D169A8]);

      if (v15)
      {
        v16 = objc_msgSend(v13, "code");
        if (v16 == 40102)
        {
          v17 = v8;
          v18 = 8;
        }
        else if (v16 == 40101)
        {
          v17 = v8;
          v18 = 4;
        }
        else
        {
          v17 = v8;
          v18 = 11;
        }
        objc_msgSend(v17, "setState:", v18);
      }
      else
      {
        objc_msgSend(v6, "userInfo");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKey:", v12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = objc_msgSend(v22, "code");
        v24 = 11;
        if (v23 == 60059)
          v24 = 8;
        if (v23 == 60058)
          v25 = 4;
        else
          v25 = v24;
        objc_msgSend(v8, "setState:", v25);

      }
    }
    else
    {
      if (v26)
      {
        objc_msgSend(v8, "removeApplicationUpdateObserver");
        objc_storeStrong(v8 + 13, a2);
        v19 = v8;
        v20 = 7;
      }
      else
      {
        v19 = v8;
        v20 = 6;
      }
      objc_msgSend(v19, "setState:", v20);
    }
    if (v9 != objc_msgSend(v8, "state"))
      objc_msgSend(v8, "stateChanged");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 128) = 0;
  }

}

- (void)contactApplePressed
{
  void *v3;
  void *v4;
  PKBusinessChatController *v5;
  PKBusinessChatController *businessChatController;
  PKBuinessChatApplyContext *v7;
  PKBusinessChatController *v8;
  _QWORD v9[5];

  if (+[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat"))
  {
    -[PKApplyController featureApplication](self->_applyController, "featureApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "businessChatIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (!self->_businessChatController)
      {
        v5 = objc_alloc_init(PKBusinessChatController);
        businessChatController = self->_businessChatController;
        self->_businessChatController = v5;

      }
      v7 = -[PKBuinessChatApplyContext initWithIdentifier:intent:]([PKBuinessChatApplyContext alloc], "initWithIdentifier:intent:", v4, 2);
      v8 = self->_businessChatController;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __58__PKApplyDocumentSubmissionController_contactApplePressed__block_invoke;
      v9[3] = &unk_1E3E646D0;
      v9[4] = self;
      -[PKBusinessChatController openBusinessChatWithContext:completion:](v8, "openBusinessChatWithContext:completion:", v7, v9);

    }
  }
}

void __58__PKApplyDocumentSubmissionController_contactApplePressed__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__PKApplyDocumentSubmissionController_contactApplePressed__block_invoke_2;
    v7[3] = &unk_1E3E61388;
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v9 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

void __58__PKApplyDocumentSubmissionController_contactApplePressed__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = PKAlertForDisplayableErrorWithHandlers(*(void **)(a1 + 32), 0, 0, 0);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", v3, 1, 0);

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
  PKApplyController *applyController;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  PKApplyDocumentSubmissionController *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
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
      v20 = v7;
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
      v20 = v9;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "%@ Application update received presenting next step", buf, 0xCu);

    }
    -[PKPaymentDocumentSubmissionController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    applyController = self->_applyController;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __65__PKApplyDocumentSubmissionController__featureApplicationUpdated__block_invoke;
    v16 = &unk_1E3E61388;
    v17 = v10;
    v18 = self;
    v4 = v10;
    -[PKApplyController applicationUpdatedAlertControllerWithHandler:](applyController, "applicationUpdatedAlertControllerWithHandler:", &v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject presentViewController:animated:completion:](v4, "presentViewController:animated:completion:", v12, 1, 0, v13, v14, v15, v16);

  }
}

void __65__PKApplyDocumentSubmissionController__featureApplicationUpdated__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "captureController:showLoading:", *(_QWORD *)(a1 + 40), 1);
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 96);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PKApplyDocumentSubmissionController__featureApplicationUpdated__block_invoke_2;
  v6[3] = &unk_1E3E71CE8;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "nextViewControllerWithCompletion:", v6);

}

void __65__PKApplyDocumentSubmissionController__featureApplicationUpdated__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "captureController:showLoading:", *(_QWORD *)(a1 + 40), 0);
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pk_presentPaymentSetupViewController:animated:completion:", v8, 1, 0);

  }
  else if (v5)
  {
    v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v7, 1, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "terminateSetupFlow");
  }

}

- (void)_cancelledConfirmed
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKApplyDocumentSubmissionController;
  -[PKPaymentDocumentSubmissionController userWantsToCancel](&v2, sel_userWantsToCancel);
}

- (void)userWantsToCancel
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  _QWORD aBlock[5];

  if (!self->_isCancelling)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__PKApplyDocumentSubmissionController_userWantsToCancel__block_invoke;
    aBlock[3] = &unk_1E3E612E8;
    aBlock[4] = self;
    v3 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[PKPaymentDocumentSubmissionController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyController cancelAlertWithContinueAction:](self->_applyController, "cancelAlertWithContinueAction:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "presentViewController:animated:completion:", v5, 1, 0);
    else
      v3[2](v3);

  }
}

void __56__PKApplyDocumentSubmissionController_userWantsToCancel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v1 + 96);
  v4 = *(_QWORD *)(v1 + 120);
  v5 = *MEMORY[0x1E0D68858];
  v13[0] = *MEMORY[0x1E0D68AA0];
  v13[1] = v5;
  v6 = *MEMORY[0x1E0D688C0];
  v14[0] = *MEMORY[0x1E0D68B18];
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v4, *MEMORY[0x1E0D68638], v7);

  objc_msgSend(*v2, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "captureController:showLoading:", *v2, 1);

  *((_BYTE *)*v2 + 129) = 1;
  objc_initWeak(&location, *v2);
  v9 = (void *)*((_QWORD *)*v2 + 12);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__PKApplyDocumentSubmissionController_userWantsToCancel__block_invoke_2;
  v10[3] = &unk_1E3E62598;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "withdrawApplicationWithCompletion:", v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __56__PKApplyDocumentSubmissionController_userWantsToCancel__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _BYTE *WeakRetained;
  _BYTE *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "captureController:showLoading:", v7, 0);
    v7[129] = 0;
    if (v10)
    {
      objc_msgSend(v8, "navigationController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v10, 1, 0);
    }
    else
    {
      if (!v5)
      {
        objc_msgSend(v7, "_cancelledConfirmed");
        goto LABEL_7;
      }
      v9 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      objc_msgSend(v8, "presentViewController:animated:completion:", v9, 1, 0);
    }

LABEL_7:
  }

}

- (void)reportAnalyticsEvent:(id)a3 pageTag:(id)a4
{
  -[PKApplyController reportAnalyticsDictionaryForPage:pageTag:additionalValues:](self->_applyController, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", self->_documentPage, a4, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentPage, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_nextViewController, 0);
  objc_storeStrong((id *)&self->_applyController, 0);
}

@end
