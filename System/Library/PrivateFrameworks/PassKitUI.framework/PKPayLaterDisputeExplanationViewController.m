@implementation PKPayLaterDisputeExplanationViewController

- (PKPayLaterDisputeExplanationViewController)initWithFinancingPlan:(id)a3 dispute:(id)a4 payLaterAccount:(id)a5 payLaterPass:(id)a6 layout:(unint64_t)a7 dynamicContentPage:(id)a8
{
  void *v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  PKPayLaterDisputeExplanationViewController *v21;
  PKPayLaterDisputeExplanationViewController *v22;
  void *v23;
  void *v24;
  PKPayLaterDisputeExplanationSectionController *v25;
  PKPayLaterDisputeExplanationSectionController *sectionController;
  void *v28;
  objc_super v29;

  v13 = a3;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = v19;
  if (a7 == 1 && !v19)
  {
    objc_msgSend((id)objc_opt_class(), "dynamicContentPageForEvidenceRequiredForDispute:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29.receiver = self;
  v29.super_class = (Class)PKPayLaterDisputeExplanationViewController;
  v21 = -[PKPayLaterViewController initWithPayLaterAccount:](&v29, sel_initWithPayLaterAccount_, v17);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_financingPlan, v13);
    objc_storeStrong((id *)&v22->_dynamicContentPage, v20);
    objc_storeStrong((id *)&v22->_dispute, a4);
    v22->_layout = a7;
    v23 = v18;
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "associatedPassUniqueID");
      a7 = objc_claimAutoreleasedReturnValue();
      v28 = v24;
      objc_msgSend(v24, "passWithUniqueID:", a7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "paymentPass");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v22->_payLaterPass, v23);
    if (!v18)
    {

    }
    v25 = -[PKPayLaterDisputeExplanationSectionController initWithFinancingPlan:payLaterAccount:layout:dynamicContentPage:viewControllerDelegate:]([PKPayLaterDisputeExplanationSectionController alloc], "initWithFinancingPlan:payLaterAccount:layout:dynamicContentPage:viewControllerDelegate:", v15, v17, v22->_layout, v20, v22);
    sectionController = v22->_sectionController;
    v22->_sectionController = v25;

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
  v8.super_class = (Class)PKPayLaterDisputeExplanationViewController;
  -[PKPayLaterViewController viewDidLoad](&v8, sel_viewDidLoad);
  if (self->_layout == 1)
  {
    -[PKPayLaterDynamicContentPage primaryActionTitle](self->_dynamicContentPage, "primaryActionTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "footerView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setManualEntryButton:", 0);
      objc_msgSend(v5, "setSetupLaterButton:", 0);
      objc_msgSend(v4, "setPrimaryButton:", 0);
      objc_msgSend(v4, "primaryButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTitle:forState:", v3, 0);
      objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__resendEmailTapped, 0x2000);

    }
  }
  v9[0] = self->_sectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v7, 0);

}

- (void)_resendEmailTapped
{
  void *v3;
  PKBusinessChatPayLaterContext *v4;
  void *v5;
  PKBusinessChatPayLaterContext *v6;
  PKBusinessChatController *businessChatController;
  PKBusinessChatController *v8;
  PKBusinessChatController *v9;
  PKBusinessChatController *v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66FD8]), "initWithContext:topicType:", 2, 11);
  v4 = [PKBusinessChatPayLaterContext alloc];
  -[PKPayLaterViewController payLaterAccount](self, "payLaterAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKBusinessChatPayLaterContext initWithPayLaterAccount:paymentPass:topic:financingPlan:installment:payment:dispute:](v4, "initWithPayLaterAccount:paymentPass:topic:financingPlan:installment:payment:dispute:", v5, self->_payLaterPass, v3, self->_financingPlan, 0, 0, self->_dispute);

  businessChatController = self->_businessChatController;
  if (businessChatController)
    v8 = businessChatController;
  else
    v8 = objc_alloc_init(PKBusinessChatController);
  v9 = self->_businessChatController;
  self->_businessChatController = v8;

  objc_initWeak(&location, self);
  -[PKPayLaterDisputeExplanationViewController _showSpinner:](self, "_showSpinner:", 1);
  v10 = self->_businessChatController;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__PKPayLaterDisputeExplanationViewController__resendEmailTapped__block_invoke;
  v11[3] = &unk_1E3E61DB8;
  objc_copyWeak(&v12, &location);
  -[PKBusinessChatController openBusinessChatWithContext:completion:](v10, "openBusinessChatWithContext:completion:", v6, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __64__PKPayLaterDisputeExplanationViewController__resendEmailTapped__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PKPayLaterDisputeExplanationViewController__resendEmailTapped__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __64__PKPayLaterDisputeExplanationViewController__resendEmailTapped__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "_showSpinner:", 0);
    v3 = v6;
    if (*(_QWORD *)(a1 + 32))
    {
      PKAccountDisplayableError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);

      if (v5)
        objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);
      objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

      v3 = v6;
    }
  }

}

- (void)_showSpinner:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtonsEnabled:", v3 ^ 1);

  -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", v3);
}

+ (id)dynamicContentPageForEvidenceRequiredForDispute:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = _MergedGlobals_3_3;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_MergedGlobals_3_3, &__block_literal_global_58);
  v5 = objc_alloc_init(MEMORY[0x1E0D66FE0]);
  PKLocalizedCocoonString(CFSTR("DISPUTE_EVIDENCE_REQUIRED_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHeaderTitle:", v6);

  PKLocalizedCocoonString(CFSTR("DISPUTE_EVIDENCE_REQUIRED_BUTTON"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrimaryActionTitle:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0D66FE8]);
  objc_msgSend(v4, "emailAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)qword_1EE4F9070;
  objc_msgSend(v4, "deadlineDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)qword_1EE4F9070;
  objc_msgSend(v4, "lastUpdated");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringFromDate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedCocoonString(CFSTR("DISPUTE_EVIDENCE_REQUIRED_MESSAGE"), CFSTR("%@%@%@"), v9, v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentTitle:", v16);

  v17 = objc_alloc_init(MEMORY[0x1E0D66FF0]);
  v22[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRows:", v18);

  v21 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSections:", v19);

  return v5;
}

uint64_t __94__PKPayLaterDisputeExplanationViewController_dynamicContentPageForEvidenceRequiredForDispute___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1EE4F9070;
  qword_1EE4F9070 = (uint64_t)v0;

  v2 = (void *)qword_1EE4F9070;
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCalendar:", v3);

  return objc_msgSend((id)qword_1EE4F9070, "setDateStyle:", 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_dynamicContentPage, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_dispute, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end
