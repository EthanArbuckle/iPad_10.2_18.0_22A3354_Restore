@implementation PKPaymentReaderModeDetailsViewController

- (PKPaymentReaderModeDetailsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 product:(id)a5
{
  id v8;
  id v9;
  PKPaymentReaderModeDetailsViewController *v10;
  PKPaymentReaderModeDetailsViewController *v11;
  id *p_product;
  PKPaymentReaderModeDetailsViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *titleText;
  uint64_t v20;
  NSString *subtitleText;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  dispatch_group_t v35;
  OS_dispatch_group *nextScreenGroup;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  objc_super v55;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend((id)objc_opt_class(), "readerModeProvisioningIsSupported"))
  {
    v55.receiver = self;
    v55.super_class = (Class)PKPaymentReaderModeDetailsViewController;
    v10 = -[PKPaymentSetupProvisioningFieldsViewController initWithProvisioningController:context:setupDelegate:](&v55, sel_initWithProvisioningController_context_setupDelegate_, v8, a4, 0);
    v11 = v10;
    if (v10)
    {
      p_product = (id *)&v10->_product;
      objc_storeStrong((id *)&v10->_product, a5);
      objc_msgSend(*p_product, "provisioningMethodMetadataForType:", *MEMORY[0x1E0D6AE40]);
      v13 = (PKPaymentReaderModeDetailsViewController *)objc_claimAutoreleasedReturnValue();
      self = v13;
      v38 = v9;
      if (v13)
      {
        -[PKPaymentReaderModeDetailsViewController requiredFields](v13, "requiredFields");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentReaderModeDetailsViewController readerModeResources](self, "readerModeResources");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AE60]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("welcome"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AE38]);
        v18 = objc_claimAutoreleasedReturnValue();
        titleText = v11->_titleText;
        v11->_titleText = (NSString *)v18;

        objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AE30]);
        v20 = objc_claimAutoreleasedReturnValue();
        subtitleText = v11->_subtitleText;
        v11->_subtitleText = (NSString *)v20;

      }
      else
      {
        objc_msgSend(*p_product, "requiredFields");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v14);
      v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v51 = 0;
      v52 = &v51;
      v53 = 0x2020000000;
      v54 = 0;
      v47 = 0;
      v48 = &v47;
      v49 = 0x2020000000;
      v50 = 0;
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __91__PKPaymentReaderModeDetailsViewController_initWithProvisioningController_context_product___block_invoke;
      v39[3] = &unk_1E3E66AD0;
      v26 = v25;
      v40 = v26;
      v27 = v22;
      v41 = v27;
      v28 = v23;
      v42 = v28;
      v29 = v24;
      v43 = v29;
      v45 = &v51;
      v30 = v14;
      v44 = v30;
      v46 = &v47;
      objc_msgSend(v30, "enumerateObjectsUsingBlock:", v39);
      if (!*((_BYTE *)v52 + 24))
      {
        v31 = (void *)objc_msgSend(v26, "copy");
        objc_msgSend(v28, "addObject:", v31);

      }
      if (*((_BYTE *)v48 + 24))
      {
        -[PKPaymentSetupFieldsViewController fieldsModel](v11, "fieldsModel");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v27, "copy");
        objc_msgSend(v32, "updateWithPaymentSetupFields:footerFields:", v29, v33);

        -[PKPaymentSetupFieldsViewController setSectionIdentifiers:](v11, "setSectionIdentifiers:", v28);
      }
      else
      {
        -[PKPaymentSetupFieldsViewController fieldsModel](v11, "fieldsModel");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "updateWithPaymentSetupFields:", v30);

      }
      v35 = dispatch_group_create();
      nextScreenGroup = v11->_nextScreenGroup;
      v11->_nextScreenGroup = (OS_dispatch_group *)v35;

      -[PKPaymentReaderModeDetailsViewController _prepareForProvisioningViewController](v11, "_prepareForProvisioningViewController");
      _Block_object_dispose(&v47, 8);
      _Block_object_dispose(&v51, 8);

      v9 = v38;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __91__PKPaymentReaderModeDetailsViewController_initWithProvisioningController_context_product___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(v5, "isFieldTypeLabel"))
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = *(void **)(a1 + 40);
      v22[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:forKey:", v9, v7);

      v10 = *(void **)(a1 + 48);
      v11 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
      objc_msgSend(v10, "addObject:", v11);

      objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
      objc_msgSend(*(id *)(a1 + 56), "removeObject:", v5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 64), "count") - 1 == a3;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 48), "count"))
      {
        objc_msgSend(*(id *)(a1 + 48), "lastObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
      if (objc_msgSend(v14, "count")
        && (objc_msgSend(v14, "firstObject"), (v15 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v7 = (void *)v15;
        v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v16, "initWithArray:", v17);

        objc_msgSend(v18, "addObject:", v5);
        v19 = *(void **)(a1 + 40);
        v20 = (void *)objc_msgSend(v18, "copy");
        objc_msgSend(v19, "setValue:forKey:", v20, v7);

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 64), "count") - 1 == a3;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      }
      else
      {
        v21 = *(void **)(a1 + 32);
        objc_msgSend(v5, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v18);
        v7 = 0;
      }

    }
  }
  else if ((objc_msgSend(v5, "isFieldTypeFooter") & 1) == 0)
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v5, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

  }
}

+ (BOOL)readerModeProvisioningIsSupported
{
  return objc_msgSend(MEMORY[0x1E0D66C68], "isSupported");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentReaderModeDetailsViewController;
  -[PKPaymentSetupFieldsViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentReaderModeDetailsViewController;
  -[PKPaymentReaderModeDetailsViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  -[PKPaymentReaderModeDetailsViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", self);

  if ((v6 & 1) == 0)
  {
    -[PKPaymentSetupFieldsViewController fieldsModel](self, "fieldsModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resetAllPaymentSetupFieldValues");

  }
}

- (void)handleNextButtonTapped:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0);
  -[PKPaymentSetupProvisioningFieldsViewController paymentProvisioningController](self, "paymentProvisioningController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetForNewProvisioning");
  objc_msgSend(v4, "resolveRequirementsUsingProduct:", self->_product);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__PKPaymentReaderModeDetailsViewController_handleNextButtonTapped___block_invoke;
  v5[3] = &unk_1E3E65130;
  v5[4] = self;
  -[PKPaymentReaderModeDetailsViewController _registerLocalDeviceWithCompletion:](self, "_registerLocalDeviceWithCompletion:", v5);

}

void __67__PKPaymentReaderModeDetailsViewController_handleNextButtonTapped___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = *(id **)(a1 + 32);
  v10 = v5;
  if (a2)
  {
    objc_msgSend(v6, "_showTerms");
  }
  else
  {
    objc_msgSend(v6[165], "reportError:context:", v5, 0);
    objc_msgSend(*(id *)(a1 + 32), "paymentProvisioningController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alertForDisplayableError:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);

  }
}

- (void)_registerLocalDeviceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  PKPaymentReaderModeDetailsViewController *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "needsRegistration"))
    {
      -[PKPaymentSetupFieldsViewController showActivitySpinnerWithTitle:subtitle:](self, "showActivitySpinnerWithTitle:subtitle:", 0, 0);
      v6 = (void *)MEMORY[0x1E0D67248];
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __79__PKPaymentReaderModeDetailsViewController__registerLocalDeviceWithCompletion___block_invoke;
      v7[3] = &unk_1E3E66B48;
      v8 = v5;
      v9 = self;
      v10 = v4;
      objc_msgSend(v6, "configureWebServiceIfNecessary:completion:", v8, v7);

    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
    }

  }
}

void __79__PKPaymentReaderModeDetailsViewController__registerLocalDeviceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "registrationSetupSupportedInRegion"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", *(_QWORD *)(a1 + 32));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __79__PKPaymentReaderModeDetailsViewController__registerLocalDeviceWithCompletion___block_invoke_2;
    v9[3] = &unk_1E3E66B20;
    v5 = *(void **)(a1 + 48);
    v9[4] = *(_QWORD *)(a1 + 40);
    v10 = v4;
    v11 = v5;
    v6 = v4;
    objc_msgSend(v6, "validatePreconditionsAndRegister:", v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "hideActivitySpinner");
    v7 = *(_QWORD *)(a1 + 48);
    PKDisplayableErrorForCommonType();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

  }
}

void __79__PKPaymentReaderModeDetailsViewController__registerLocalDeviceWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PKPaymentReaderModeDetailsViewController__registerLocalDeviceWithCompletion___block_invoke_3;
  block[3] = &unk_1E3E66AF8;
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  v12 = a2;
  v11 = v6;
  v9 = v5;
  v10 = *(id *)(a1 + 40);
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __79__PKPaymentReaderModeDetailsViewController__registerLocalDeviceWithCompletion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "hideActivitySpinner");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_showTerms
{
  void *v3;
  void *v4;
  NSObject *nextScreenGroup;
  _QWORD block[4];
  id v7;
  PKPaymentReaderModeDetailsViewController *v8;
  _QWORD v9[5];

  -[PKPaymentSetupProduct termsURL](self->_product, "termsURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && !self->_termsAccepted)
  {
    -[PKPaymentSetupFieldsViewController showActivitySpinnerWithTitle:subtitle:](self, "showActivitySpinnerWithTitle:subtitle:", 0, 0);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__PKPaymentReaderModeDetailsViewController__showTerms__block_invoke;
    v9[3] = &unk_1E3E65130;
    v9[4] = self;
    -[PKPaymentSetupProvisioningFieldsViewController displayTermsForTermsURL:withCompletionHandler:](self, "displayTermsForTermsURL:withCompletionHandler:", v4, v9);
  }
  else
  {
    nextScreenGroup = self->_nextScreenGroup;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__PKPaymentReaderModeDetailsViewController__showTerms__block_invoke_5;
    block[3] = &unk_1E3E61388;
    v7 = v3;
    v8 = self;
    dispatch_group_notify(nextScreenGroup, MEMORY[0x1E0C80D38], block);

  }
}

void __54__PKPaymentReaderModeDetailsViewController__showTerms__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  char v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 1288);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PKPaymentReaderModeDetailsViewController__showTerms__block_invoke_2;
  block[3] = &unk_1E3E64908;
  v11 = a2;
  block[4] = v6;
  v10 = v5;
  v8 = v5;
  dispatch_group_notify(v7, MEMORY[0x1E0C80D38], block);

}

void __54__PKPaymentReaderModeDetailsViewController__showTerms__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1320);
  v3 = *MEMORY[0x1E0D68AA0];
  v15[0] = *MEMORY[0x1E0D68C30];
  v4 = *MEMORY[0x1E0D695C0];
  v14[0] = v3;
  v14[1] = v4;
  PKAnalyticsReportSwitchToggleResultValue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportEvent:", v6);

  if (*(_BYTE *)(a1 + 48))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1280) = 1;
    v7 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__PKPaymentReaderModeDetailsViewController__showTerms__block_invoke_3;
    v13[3] = &unk_1E3E612E8;
    v13[4] = v7;
    objc_msgSend(v7, "_pushReaderModeProvisioningWithCompletion:", v13);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(v8, "paymentProvisioningController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "displayableErrorForError:", *(_QWORD *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1320), "reportError:context:", v10, 0);
      objc_msgSend(v9, "alertForDisplayableError:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "navigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "presentViewController:animated:completion:", v11, 1, 0);

      objc_msgSend(*(id *)(a1 + 32), "hideActivitySpinner");
    }
    else
    {
      objc_msgSend(v8, "hideActivitySpinner");
    }
  }
}

void __54__PKPaymentReaderModeDetailsViewController__showTerms__block_invoke_3(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PKPaymentReaderModeDetailsViewController__showTerms__block_invoke_4;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __54__PKPaymentReaderModeDetailsViewController__showTerms__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideActivitySpinner");
}

uint64_t __54__PKPaymentReaderModeDetailsViewController__showTerms__block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (!*(_QWORD *)(a1 + 32))
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Skipping Terms & Conditions because no termsURL was set", v4, 2u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 40), "_pushReaderModeProvisioningWithCompletion:", 0);
}

- (void)_prepareForProvisioningViewController
{
  _QWORD v3[5];

  dispatch_group_enter((dispatch_group_t)self->_nextScreenGroup);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__PKPaymentReaderModeDetailsViewController__prepareForProvisioningViewController__block_invoke;
  v3[3] = &unk_1E3E62288;
  v3[4] = self;
  -[PKPaymentReaderModeDetailsViewController _downloadCardArtIfNecessary:](self, "_downloadCardArtIfNecessary:", v3);
}

void __81__PKPaymentReaderModeDetailsViewController__prepareForProvisioningViewController__block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  uint8_t v4[16];

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 1288));
  if ((a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Failed to load either digital/plastic card images", v4, 2u);
    }

  }
}

- (void)_pushReaderModeProvisioningWithCompletion:(id)a3
{
  id v4;

  if (a3)
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  -[PKProvisioningAnalyticsSessionUIReporter reportPageCompleted:context:](self->_reporter, "reportPageCompleted:context:", 1, 0);
  -[PKPaymentSetupProvisioningFieldsViewController flowItemDelegate](self, "flowItemDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provisioningViewController:didFinishWithSuccess:", self, 1);

}

- (void)_downloadCardArtIfNecessary:(id)a3
{
  id v4;
  NSObject *v5;
  PKPaymentSetupProduct *product;
  uint64_t v7;
  NSObject *v8;
  id v9;
  PKPaymentSetupProduct *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD v18[4];
  NSObject *v19;

  v4 = a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  product = self->_product;
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__PKPaymentReaderModeDetailsViewController__downloadCardArtIfNecessary___block_invoke;
  v18[3] = &unk_1E3E64B48;
  v8 = v5;
  v19 = v8;
  v9 = -[PKPaymentSetupProduct plasticCardCachedImage:](product, "plasticCardCachedImage:", v18);
  dispatch_group_enter(v8);
  v10 = self->_product;
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __72__PKPaymentReaderModeDetailsViewController__downloadCardArtIfNecessary___block_invoke_2;
  v16[3] = &unk_1E3E64B48;
  v17 = v8;
  v11 = v8;
  v12 = -[PKPaymentSetupProduct digitalCardCachedImage:](v10, "digitalCardCachedImage:", v16);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __72__PKPaymentReaderModeDetailsViewController__downloadCardArtIfNecessary___block_invoke_3;
  v14[3] = &unk_1E3E618A0;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  dispatch_group_notify(v11, MEMORY[0x1E0C80D38], v14);

}

void __72__PKPaymentReaderModeDetailsViewController__downloadCardArtIfNecessary___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __72__PKPaymentReaderModeDetailsViewController__downloadCardArtIfNecessary___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __72__PKPaymentReaderModeDetailsViewController__downloadCardArtIfNecessary___block_invoke_3(uint64_t result)
{
  uint64_t v1;
  void *v2;
  void *v3;

  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 1312), "imageAssets");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "digitalCardImage"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 1312), "imageAssets");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "plasticCardImage");

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
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

  -[PKPaymentSetupFieldsViewController fieldsModel](self, "fieldsModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleSetupFieldIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)defaultHeaderViewTitle
{
  NSString *titleText;
  NSString *v3;
  void *v4;

  titleText = self->_titleText;
  if (titleText)
  {
    v3 = titleText;
  }
  else
  {
    -[PKPaymentSetupProduct displayName](self->_product, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("READER_MODE_DETAILS_TITLE_FORMAT"), CFSTR("%@"), v4);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)defaultHeaderViewSubTitle
{
  NSString *subtitleText;

  subtitleText = self->_subtitleText;
  if (subtitleText)
    return subtitleText;
  PKLocalizedPaymentString(CFSTR("READER_MODE_DETAILS_SUBTITLE"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)footerView
{
  return 0;
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_nextScreenGroup, 0);
}

@end
