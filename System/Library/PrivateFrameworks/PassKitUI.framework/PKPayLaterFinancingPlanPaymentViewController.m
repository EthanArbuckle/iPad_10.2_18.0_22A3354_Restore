@implementation PKPayLaterFinancingPlanPaymentViewController

- (PKPayLaterFinancingPlanPaymentViewController)initWithFinancingPlan:(id)a3 payment:(id)a4 payLaterAccount:(id)a5 paymentIntentController:(id)a6 merchantIcon:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PKPayLaterFinancingPlanPaymentViewController *v18;
  PKPayLaterFinancingPlanPaymentViewController *v19;
  PKPayLaterFinancingPlanPaymentSectionController *v20;
  PKPayLaterFinancingPlanPaymentSectionController *sectionController;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PKPayLaterFinancingPlanPaymentViewController;
  v18 = -[PKPayLaterViewController initWithPayLaterAccount:](&v23, sel_initWithPayLaterAccount_, v15);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_financingPlan, a3);
    objc_storeStrong((id *)&v19->_payment, a4);
    v20 = -[PKPayLaterFinancingPlanPaymentSectionController initWithFinancingPlan:payment:payLaterAccount:paymentIntentController:merchantIcon:delegate:]([PKPayLaterFinancingPlanPaymentSectionController alloc], "initWithFinancingPlan:payment:payLaterAccount:paymentIntentController:merchantIcon:delegate:", v19->_financingPlan, v14, v15, v16, v17, v19);
    sectionController = v19->_sectionController;
    v19->_sectionController = v20;

    -[PKPayLaterSectionController setDynamicCollectionDelegate:](v19->_sectionController, "setDynamicCollectionDelegate:", v19);
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v19, "setUseItemIdentityWhenUpdating:", 1);
  }

  return v19;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterFinancingPlanPaymentViewController;
  -[PKPayLaterViewController viewDidLoad](&v5, sel_viewDidLoad);
  v6[0] = self->_sectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v3, 0);

  -[PKPayLaterFinancingPlanPaymentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C00]);

}

- (void)didUpdateFinancingPlan:(id)a3
{
  void *v5;
  PKPayLaterFinancingPlan **p_financingPlan;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];

  v15 = a3;
  objc_msgSend(v15, "planIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_financingPlan = &self->_financingPlan;
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  v9 = v7;
  if (v8 == v9)
  {

  }
  else
  {
    v10 = v9;
    if (!v8 || !v9)
    {

      goto LABEL_11;
    }
    v11 = objc_msgSend(v8, "isEqualToString:", v9);

    if ((v11 & 1) == 0)
      goto LABEL_11;
  }
  objc_storeStrong((id *)&self->_financingPlan, a3);
  -[PKPayLaterFinancingPlanPaymentSectionController setFinancingPlan:](self->_sectionController, "setFinancingPlan:", *p_financingPlan);
  -[PKPayLaterFinancingPlan scheduleSummary](*p_financingPlan, "scheduleSummary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "payments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__PKPayLaterFinancingPlanPaymentViewController_didUpdateFinancingPlan___block_invoke;
  v16[3] = &unk_1E3E62610;
  v16[4] = self;
  objc_msgSend(v13, "pk_firstObjectPassingTest:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_storeStrong((id *)&self->_payment, v14);
    -[PKPayLaterFinancingPlanPaymentSectionController setPayment:](self->_sectionController, "setPayment:", v14);
  }
  -[PKDynamicCollectionViewController reloadDataAnimated:](self, "reloadDataAnimated:", 1);

LABEL_11:
}

uint64_t __71__PKPayLaterFinancingPlanPaymentViewController_didUpdateFinancingPlan___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "paymentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1328), "paymentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (id)pageTag
{
  return (id)*MEMORY[0x1E0D68F78];
}

- (id)additionalAnalyticsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = *MEMORY[0x1E0D68CD8];
  -[PKPayLaterFinancingPlan state](self->_financingPlan, "state");
  PKPayLaterFinancingPlanStateToString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = *MEMORY[0x1E0D68CD0];
  v8[0] = v3;
  -[PKPayLaterPayment type](self->_payment, "type");
  PKPayLaterPaymentTypeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end
