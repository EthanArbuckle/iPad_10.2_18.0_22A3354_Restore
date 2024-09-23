@implementation PKPayLaterFinancingPlanInStoreReturnViewController

- (PKPayLaterFinancingPlanInStoreReturnViewController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4
{
  id v7;
  id v8;
  PKPayLaterFinancingPlanInStoreReturnViewController *v9;
  PKPayLaterFinancingPlanInStoreReturnViewController *v10;
  PKPayLaterFinancingPlanInStoreReturnSectionController *v11;
  PKPayLaterFinancingPlanInStoreReturnSectionController *sectionController;
  void *v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterFinancingPlanInStoreReturnViewController;
  v9 = -[PKPayLaterViewController initWithPayLaterAccount:](&v16, sel_initWithPayLaterAccount_, v8);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_financingPlan, a3);
    v11 = -[PKPayLaterFinancingPlanInStoreReturnSectionController initWithFinancingPlan:payLaterAccount:delegate:]([PKPayLaterFinancingPlanInStoreReturnSectionController alloc], "initWithFinancingPlan:payLaterAccount:delegate:", v10->_financingPlan, v8, v10);
    sectionController = v10->_sectionController;
    v10->_sectionController = v11;

    -[PKPayLaterSectionController setDynamicCollectionDelegate:](v10->_sectionController, "setDynamicCollectionDelegate:", v10);
    -[PKPayLaterFinancingPlanInStoreReturnViewController navigationItem](v10, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCocoonString(CFSTR("IN_STORE_RETURN_CARD_TITLE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", v14);

  }
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterFinancingPlanInStoreReturnViewController;
  -[PKPayLaterViewController viewDidLoad](&v4, sel_viewDidLoad);
  v5[0] = self->_sectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v3, 0);

}

- (void)didUpdateFinancingPlan:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "planIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

      goto LABEL_9;
    }
    v10 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_9;
  }
  objc_storeStrong((id *)&self->_financingPlan, a3);
  -[PKPayLaterFinancingPlanInStoreReturnSectionController setFinancingPlan:](self->_sectionController, "setFinancingPlan:", self->_financingPlan);
  -[PKDynamicCollectionViewController reloadDataAnimated:](self, "reloadDataAnimated:", 1);
LABEL_9:

}

- (id)pageTag
{
  return (id)*MEMORY[0x1E0D68F48];
}

- (id)additionalAnalyticsDictionary
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D68CD8];
  -[PKPayLaterFinancingPlan state](self->_financingPlan, "state");
  PKPayLaterFinancingPlanStateToString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end
