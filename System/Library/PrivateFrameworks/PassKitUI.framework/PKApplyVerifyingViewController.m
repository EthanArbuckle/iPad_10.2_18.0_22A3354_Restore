@implementation PKApplyVerifyingViewController

- (PKApplyVerifyingViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 applyPage:(id)a6 actionIdentifierToSubmit:(id)a7 termsIdentifiersToSubmit:(id)a8 odiAttributesDictionaryToSubmit:(id)a9
{
  id v16;
  id v17;
  PKApplyVerifyingViewController *v18;
  PKApplyVerifyingViewController *v19;
  id v21;
  objc_super v22;

  v21 = a7;
  v16 = a8;
  v17 = a9;
  v22.receiver = self;
  v22.super_class = (Class)PKApplyVerifyingViewController;
  v18 = -[PKApplyCollectionViewController initWithController:setupDelegate:context:applyPage:](&v22, sel_initWithController_setupDelegate_context_applyPage_, a3, a4, a5, a6);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_actionIdentifierToSubmit, a7);
    objc_storeStrong((id *)&v19->_termsIdentifiersToSubmit, a8);
    objc_storeStrong((id *)&v19->_odiAttributesDictionaryToSubmit, a9);
    v19->_minimumDelayNanoSeconds = 1000000000.0;
    -[PKApplyVerifyingViewController _updateSubtitleWithAltTextIfNecessary](v19, "_updateSubtitleWithAltTextIfNecessary");
  }

  return v19;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  NSString *actionIdentifierToSubmit;
  NSSet *termsIdentifiersToSubmit;
  NSDictionary *odiAttributesDictionaryToSubmit;
  _QWORD v10[4];
  id v11[2];
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKApplyVerifyingViewController;
  -[PKApplyCollectionViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  objc_initWeak(&location, self);
  -[PKApplyCollectionViewController controller](self, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  actionIdentifierToSubmit = self->_actionIdentifierToSubmit;
  termsIdentifiersToSubmit = self->_termsIdentifiersToSubmit;
  odiAttributesDictionaryToSubmit = self->_odiAttributesDictionaryToSubmit;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__PKApplyVerifyingViewController_viewDidLoad__block_invoke;
  v10[3] = &unk_1E3E64BC0;
  objc_copyWeak(v11, &location);
  *(double *)&v11[1] = v5 * 1000000000.0;
  objc_msgSend(v6, "submitActionIdentifier:termsIdentifiers:odiAttributesDictionary:completion:", actionIdentifierToSubmit, termsIdentifiersToSubmit, odiAttributesDictionaryToSubmit, v10);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __45__PKApplyVerifyingViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  double *WeakRetained;
  void *v9;
  double v10;
  double v11;
  dispatch_time_t v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    v11 = v10 * 1000000000.0;

    v12 = dispatch_time(0, (uint64_t)(fmax(WeakRetained[166] - vabdd_f64(v11, *(double *)(a1 + 40)), 0.0) * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PKApplyVerifyingViewController_viewDidLoad__block_invoke_2;
    block[3] = &unk_1E3E61EE8;
    objc_copyWeak(&v16, v7);
    v14 = v5;
    v15 = v6;
    dispatch_after(v12, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v16);
  }

}

void __45__PKApplyVerifyingViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "handleNextViewController:displayableError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (id)pageTag
{
  return (id)*MEMORY[0x1E0D68F10];
}

- (BOOL)shouldDisplayErrorOnWithdraw
{
  return 0;
}

- (void)_updateSubtitleWithAltTextIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  dispatch_time_t v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  -[PKApplyCollectionViewController page](self, "page");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "altSubtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKApplyCollectionViewController page](self, "page");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "altSubtitleTimeInterval");

  if (v4 && v6 >= 1)
  {
    objc_initWeak(&location, self);
    v7 = dispatch_time(0, 1000000000 * v6);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__PKApplyVerifyingViewController__updateSubtitleWithAltTextIfNecessary__block_invoke;
    block[3] = &unk_1E3E61B68;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __71__PKApplyVerifyingViewController__updateSubtitleWithAltTextIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setSubtitleText:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiAttributesDictionaryToSubmit, 0);
  objc_storeStrong((id *)&self->_termsIdentifiersToSubmit, 0);
  objc_storeStrong((id *)&self->_actionIdentifierToSubmit, 0);
}

@end
