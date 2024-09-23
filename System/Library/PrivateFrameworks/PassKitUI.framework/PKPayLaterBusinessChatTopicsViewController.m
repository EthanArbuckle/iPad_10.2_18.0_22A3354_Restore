@implementation PKPayLaterBusinessChatTopicsViewController

- (PKPayLaterBusinessChatTopicsViewController)initWithPayLaterAccount:(id)a3 payLaterPass:(id)a4 financingPlan:(id)a5 installment:(id)a6 payment:(id)a7 topics:(id)a8 businessChatContext:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  PKPayLaterBusinessChatTopicsViewController *v21;
  PKPayLaterBusinessChatTopicsViewController *v22;
  PKPayLaterBusinessChatTopicsSectionController *v23;
  PKPayLaterBusinessChatTopicsSectionController *sectionController;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  id v31;
  objc_super v32;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  obj = a7;
  v19 = a7;
  v31 = a8;
  v20 = a8;
  v32.receiver = self;
  v32.super_class = (Class)PKPayLaterBusinessChatTopicsViewController;
  v21 = -[PKPayLaterViewController initWithPayLaterAccount:](&v32, sel_initWithPayLaterAccount_, v15);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_financingPlan, a5);
    objc_storeStrong((id *)&v22->_payLaterPass, a4);
    objc_storeStrong((id *)&v22->_installment, a6);
    objc_storeStrong((id *)&v22->_payment, obj);
    objc_storeStrong((id *)&v22->_topics, v31);
    v22->_businessChatContext = a9;
    v23 = -[PKPayLaterBusinessChatTopicsSectionController initWithPayLaterAccount:payLaterPass:financingPlan:installment:payment:topics:businessChatContext:delegate:]([PKPayLaterBusinessChatTopicsSectionController alloc], "initWithPayLaterAccount:payLaterPass:financingPlan:installment:payment:topics:businessChatContext:delegate:", v15, v16, v17, v18, v19, v20, a9, v22);
    sectionController = v22->_sectionController;
    v22->_sectionController = v23;

    -[PKPayLaterSectionController setDynamicCollectionDelegate:](v22->_sectionController, "setDynamicCollectionDelegate:", v22);
    -[PKPayLaterBusinessChatTopicsViewController navigationItem](v22, "navigationItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v22, sel__cancelTapped);
    objc_msgSend(v25, "setLeftBarButtonItem:", v26);

    if (a9 - 1 > 2)
    {
      v27 = 0;
    }
    else
    {
      PKLocalizedCocoonString(&off_1E3E75DB8[a9 - 1]->isa);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PKPayLaterBusinessChatTopicsViewController navigationItem](v22, "navigationItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTitle:", v27);

    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v22, "setUseItemIdentityWhenUpdating:", 1);
  }

  return v22;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PKPayLaterBusinessChatTopicsViewController;
  -[PKPayLaterViewController viewDidLoad](&v8, sel_viewDidLoad);
  if (self->_businessChatContext == 1)
  {
    -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "primaryButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCocoonString(CFSTR("CONTINUE_TO_CHAT"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:forState:", v5, 0);

    objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__continueToChat, 0x2000);
    objc_msgSend(v3, "footerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setForceShowSetupLaterButton:", 1);
    objc_msgSend(v6, "setManualEntryButton:", 0);
    objc_msgSend(v6, "setSetupLaterButton:", 0);

  }
  v9[0] = self->_sectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v7, 0);

}

- (void)openBusinessChatForTopic:(id)a3
{
  id v4;
  PKBusinessChatController *businessChatController;
  PKBusinessChatController *v6;
  PKBusinessChatController *v7;
  PKBusinessChatPayLaterContext *v8;
  void *v9;
  PKBusinessChatPayLaterContext *v10;
  PKBusinessChatController *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  businessChatController = self->_businessChatController;
  if (businessChatController)
    v6 = businessChatController;
  else
    v6 = objc_alloc_init(PKBusinessChatController);
  v7 = self->_businessChatController;
  self->_businessChatController = v6;

  objc_initWeak(&location, self);
  v8 = [PKBusinessChatPayLaterContext alloc];
  -[PKPayLaterViewController payLaterAccount](self, "payLaterAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKBusinessChatPayLaterContext initWithPayLaterAccount:paymentPass:topic:financingPlan:installment:payment:dispute:](v8, "initWithPayLaterAccount:paymentPass:topic:financingPlan:installment:payment:dispute:", v9, self->_payLaterPass, v4, self->_financingPlan, self->_installment, self->_payment, 0);

  v11 = self->_businessChatController;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__PKPayLaterBusinessChatTopicsViewController_openBusinessChatForTopic___block_invoke;
  v12[3] = &unk_1E3E61DB8;
  objc_copyWeak(&v13, &location);
  -[PKBusinessChatController openBusinessChatWithContext:completion:](v11, "openBusinessChatWithContext:completion:", v10, v12);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
}

void __71__PKPayLaterBusinessChatTopicsViewController_openBusinessChatForTopic___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__PKPayLaterBusinessChatTopicsViewController_openBusinessChatForTopic___block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __71__PKPayLaterBusinessChatTopicsViewController_openBusinessChatForTopic___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
    {
      PKAccountDisplayableError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

      if (v4)
        objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);
      objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

    }
    else
    {
      objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
    }
    WeakRetained = v5;
  }

}

- (id)pageTag
{
  return (id)*MEMORY[0x1E0D68F60];
}

- (BOOL)disablesAutomaticDismissalUponEnteringBackground
{
  return 0;
}

- (void)_continueToChat
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D68B18];
  v6[0] = *MEMORY[0x1E0D68878];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterViewController reportAnalyticsEvent:](self, "reportAnalyticsEvent:", v3);

  objc_msgSend(MEMORY[0x1E0D66FD8], "genericBusinessChatTopicForContext:", self->_businessChatContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterBusinessChatTopicsViewController openBusinessChatForTopic:](self, "openBusinessChatForTopic:", v4);

}

- (void)_cancelTapped
{
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D68B18];
  v5[0] = *MEMORY[0x1E0D688E8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterViewController reportAnalyticsEvent:](self, "reportAnalyticsEvent:", v3);

  -[PKPayLaterBusinessChatTopicsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_installment, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end
