@implementation PKPayLaterBusinessChatTopicExplanationViewController

- (PKPayLaterBusinessChatTopicExplanationViewController)initWithPayLaterAccount:(id)a3 payLaterPass:(id)a4 financingPlan:(id)a5 installment:(id)a6 payment:(id)a7 topic:(id)a8 dynamicContent:(id)a9
{
  id v15;
  id v16;
  id v17;
  PKPayLaterBusinessChatTopicExplanationViewController *v18;
  PKPayLaterBusinessChatTopicExplanationViewController *v19;
  uint64_t v20;
  PKPayLaterDynamicContentPage *dynamicContentPage;
  PKPayLaterBusinessChatTopicExplanationSectionController *v22;
  PKPayLaterBusinessChatTopicExplanationSectionController *sectionController;
  void *v24;
  void *v25;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v15 = a3;
  v30 = a4;
  v29 = a5;
  v28 = a6;
  v27 = a7;
  v16 = a8;
  v17 = a9;
  v31.receiver = self;
  v31.super_class = (Class)PKPayLaterBusinessChatTopicExplanationViewController;
  v18 = -[PKPayLaterViewController initWithPayLaterAccount:](&v31, sel_initWithPayLaterAccount_, v15);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_financingPlan, a5);
    objc_storeStrong((id *)&v19->_payLaterPass, a4);
    objc_storeStrong((id *)&v19->_installment, a6);
    objc_storeStrong((id *)&v19->_payment, a7);
    objc_storeStrong((id *)&v19->_topic, a8);
    objc_msgSend(v17, "dynamicContentPageForPageType:", 12);
    v20 = objc_claimAutoreleasedReturnValue();
    dynamicContentPage = v19->_dynamicContentPage;
    v19->_dynamicContentPage = (PKPayLaterDynamicContentPage *)v20;

    v22 = -[PKPayLaterBusinessChatTopicExplanationSectionController initWithPayLaterAccount:payLaterPass:financingPlan:installment:payment:topic:dynamicContentPage:delegate:]([PKPayLaterBusinessChatTopicExplanationSectionController alloc], "initWithPayLaterAccount:payLaterPass:financingPlan:installment:payment:topic:dynamicContentPage:delegate:", v15, v30, v29, v28, v27, v16, v19->_dynamicContentPage, v19);
    sectionController = v19->_sectionController;
    v19->_sectionController = v22;

    -[PKPayLaterSectionController setDynamicCollectionDelegate:](v19->_sectionController, "setDynamicCollectionDelegate:", v19);
    -[PKPayLaterBusinessChatTopicExplanationViewController navigationItem](v19, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCocoonString(CFSTR("REPORT_AN_ISSUE"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTitle:", v25);

  }
  return v19;
}

- (id)pageTag
{
  return (id)*MEMORY[0x1E0D68F20];
}

- (id)additionalAnalyticsDictionary
{
  id v3;
  void *v4;
  PKPayLaterFinancingPlan *financingPlan;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKPayLaterBusinessChatTopic analyticsIdentifier](self->_topic, "analyticsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelySetObject:forKey:", v4, *MEMORY[0x1E0D69050]);

  financingPlan = self->_financingPlan;
  if (financingPlan)
  {
    -[PKPayLaterFinancingPlan productType](financingPlan, "productType");
    PKPayLaterAccountProductTypeToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, *MEMORY[0x1E0D68BD0]);

  }
  if (objc_msgSend(v3, "count"))
    v7 = (void *)objc_msgSend(v3, "copy");
  else
    v7 = 0;

  return v7;
}

- (BOOL)disablesAutomaticDismissalUponEnteringBackground
{
  return 0;
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
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterBusinessChatTopicExplanationViewController;
  -[PKPayLaterViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[PKPayLaterDynamicContentPage headerTitle](self->_dynamicContentPage, "headerTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v3);

  -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterDynamicContentPage primaryActionTitle](self->_dynamicContentPage, "primaryActionTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v6, 0);

  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__openBusinessChat, 0x2000);
  objc_msgSend(v4, "footerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setForceShowSetupLaterButton:", 1);
  objc_msgSend(v7, "setSetupLaterButton:", 0);
  -[PKPayLaterDynamicContentPage secondaryActionTitle](self->_dynamicContentPage, "secondaryActionTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "manualEntryButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterDynamicContentPage secondaryActionTitle](self->_dynamicContentPage, "secondaryActionTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:forState:", v10, 0);

    objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__cancelTapped, 64);
  }
  else
  {
    objc_msgSend(v7, "setManualEntryButton:", 0);
  }
  v13[0] = self->_sectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v11, 0);

}

- (void)_openBusinessChat
{
  PKBusinessChatController *businessChatController;
  PKBusinessChatController *v4;
  PKBusinessChatController *v5;
  void *v6;
  PKBusinessChatPayLaterContext *v7;
  void *v8;
  PKBusinessChatPayLaterContext *v9;
  PKBusinessChatController *v10;
  _QWORD v11[4];
  id v12;
  id location;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  businessChatController = self->_businessChatController;
  if (businessChatController)
    v4 = businessChatController;
  else
    v4 = objc_alloc_init(PKBusinessChatController);
  v5 = self->_businessChatController;
  self->_businessChatController = v4;

  objc_initWeak(&location, self);
  v14 = *MEMORY[0x1E0D68B18];
  v15[0] = *MEMORY[0x1E0D68878];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterViewController reportAnalyticsEvent:](self, "reportAnalyticsEvent:", v6);

  v7 = [PKBusinessChatPayLaterContext alloc];
  -[PKPayLaterViewController payLaterAccount](self, "payLaterAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKBusinessChatPayLaterContext initWithPayLaterAccount:paymentPass:topic:financingPlan:installment:payment:dispute:](v7, "initWithPayLaterAccount:paymentPass:topic:financingPlan:installment:payment:dispute:", v8, self->_payLaterPass, self->_topic, self->_financingPlan, self->_installment, self->_payment, 0);

  v10 = self->_businessChatController;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PKPayLaterBusinessChatTopicExplanationViewController__openBusinessChat__block_invoke;
  v11[3] = &unk_1E3E61DB8;
  objc_copyWeak(&v12, &location);
  -[PKBusinessChatController openBusinessChatWithContext:completion:](v10, "openBusinessChatWithContext:completion:", v9, v11);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

void __73__PKPayLaterBusinessChatTopicExplanationViewController__openBusinessChat__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__PKPayLaterBusinessChatTopicExplanationViewController__openBusinessChat__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __73__PKPayLaterBusinessChatTopicExplanationViewController__openBusinessChat__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    v5 = WeakRetained;
    PKAccountDisplayableError();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

    if (v4)
      objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);
    objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

    WeakRetained = v5;
  }

}

- (void)_cancelTapped
{
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D68B18];
  v5[0] = *MEMORY[0x1E0D688C0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterViewController reportAnalyticsEvent:](self, "reportAnalyticsEvent:", v3);

  -[PKPayLaterBusinessChatTopicExplanationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicContentPage, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_installment, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end
