@implementation PKPayLaterEligibleSpendViewController

- (PKPayLaterEligibleSpendViewController)initWithPayLaterAccount:(id)a3
{
  id v4;
  PKPayLaterEligibleSpendViewController *v5;
  PKPayLaterEligibleSpendSectionController *v6;
  PKPayLaterEligibleSpendSectionController *sectionController;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterEligibleSpendViewController;
  v5 = -[PKPayLaterViewController initWithPayLaterAccount:](&v9, sel_initWithPayLaterAccount_, v4);
  if (v5)
  {
    v6 = -[PKPayLaterEligibleSpendSectionController initWithPayLaterAccount:dynamicContentPage:viewControllerDelegate:]([PKPayLaterEligibleSpendSectionController alloc], "initWithPayLaterAccount:dynamicContentPage:viewControllerDelegate:", v4, 0, v5);
    sectionController = v5->_sectionController;
    v5->_sectionController = v6;

    -[PKPayLaterSectionController setDynamicCollectionDelegate:](v5->_sectionController, "setDynamicCollectionDelegate:", v5);
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v5, "setUseItemIdentityWhenUpdating:", 1);
  }

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterEligibleSpendViewController;
  -[PKPayLaterViewController viewDidLoad](&v4, sel_viewDidLoad);
  v5[0] = self->_sectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v3, 0);

}

- (id)pageTag
{
  return (id)*MEMORY[0x1E0D68F18];
}

- (void)didUpdatePayLaterAccount:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PKPayLaterEligibleSpendViewController_didUpdatePayLaterAccount___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __66__PKPayLaterEligibleSpendViewController_didUpdatePayLaterAccount___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1320), "setPayLaterAccount:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "reloadDataAnimated:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionController, 0);
}

@end
