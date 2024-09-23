@implementation PKApplyActionExplanationViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PKApplyActionExplanationViewController;
  -[PKApplyExplanationViewController viewDidLoad](&v18, sel_viewDidLoad);
  objc_initWeak(&location, self);
  -[PKApplyExplanationViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyExplanationViewController controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "feature");
  v7 = MEMORY[0x1E0C809B0];
  if (v6 == 2 || objc_msgSend(v3, "featureIdentifier") == 2)
  {
    objc_msgSend(v3, "featureApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "applicationState");

    if (v9 == 7)
    {
      -[PKApplyActionExplanationViewController _configureAppleCardIcon](self, "_configureAppleCardIcon");
      -[PKExplanationViewController explanationView](self, "explanationView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBodyButtonNumberOfLines:", 2);

    }
    else if (objc_msgSend(v3, "applicationType") == 2)
    {
      -[PKApplyActionExplanationViewController _configureAppleCardIcon](self, "_configureAppleCardIcon");
    }
  }
  else if ((objc_msgSend(v5, "applicationState") == 1 || objc_msgSend(v5, "applicationState") == 4)
         && objc_msgSend(v5, "feature") == 3)
  {
    -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 1);
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __53__PKApplyActionExplanationViewController_viewDidLoad__block_invoke;
    v15[3] = &unk_1E3E61310;
    objc_copyWeak(&v16, &location);
    -[PKDynamicProvisioningPageViewController setCancelButtonAction:](self, "setCancelButtonAction:", v15);
    objc_destroyWeak(&v16);
  }
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __53__PKApplyActionExplanationViewController_viewDidLoad__block_invoke_2;
  v13[3] = &unk_1E3E63AE8;
  objc_copyWeak(&v14, &location);
  -[PKApplyExplanationViewController setContinueAction:](self, "setContinueAction:", v13);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __53__PKApplyActionExplanationViewController_viewDidLoad__block_invoke_4;
  v11[3] = &unk_1E3E63AE8;
  objc_copyWeak(&v12, &location);
  -[PKApplyExplanationViewController setAuxiliaryAction:](self, "setAuxiliaryAction:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

void __53__PKApplyActionExplanationViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleCancelTapped");
    WeakRetained = v2;
  }

}

uint64_t __53__PKApplyActionExplanationViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "showNavigationBarSpinner:", 1);
    objc_msgSend(v2, "currentPage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "controller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "primaryActionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "footerContent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "termsIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__PKApplyActionExplanationViewController_viewDidLoad__block_invoke_3;
    v9[3] = &unk_1E3E62260;
    v10 = v2;
    objc_msgSend(v4, "submitActionIdentifier:termsIdentifiers:odiAttributesDictionary:completion:", v5, v7, 0, v9);

  }
  return 0;
}

uint64_t __53__PKApplyActionExplanationViewController_viewDidLoad__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNextViewController:displayableError:", a2, a3);
}

uint64_t __53__PKApplyActionExplanationViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "showNavigationBarSpinner:", 1);
    objc_msgSend(v2, "currentPage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "controller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "secondaryActionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "footerContent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "termsIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__PKApplyActionExplanationViewController_viewDidLoad__block_invoke_5;
    v9[3] = &unk_1E3E62260;
    v10 = v2;
    objc_msgSend(v4, "submitActionIdentifier:termsIdentifiers:odiAttributesDictionary:completion:", v5, v7, 0, v9);

  }
  return 0;
}

uint64_t __53__PKApplyActionExplanationViewController_viewDidLoad__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNextViewController:displayableError:", a2, a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKApplyActionExplanationViewController;
  -[PKApplyExplanationViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  -[PKApplyExplanationViewController controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "declineDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "declinedTermsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "applicationState") == 7 && objc_msgSend(v7, "length"))
    objc_msgSend(v4, "termsShownWithIdentifier:", v7);

}

- (void)_configureAppleCardIcon
{
  void *v3;
  void *v4;
  id v5;

  -[PKApplyExplanationViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKFeatureApplicationHeaderImageWithImage(objc_msgSend(v3, "featureIdentifier"), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v5);
  objc_msgSend(v4, "setTopMargin:", 30.0);

}

- (void)_handleCancelTapped
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PKApplyActionExplanationViewController__handleCancelTapped__block_invoke;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[PKApplyExplanationViewController controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAlertWithContinueAction:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PKApplyActionExplanationViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

  }
  else
  {
    v3[2](v3);
  }

}

uint64_t __61__PKApplyActionExplanationViewController__handleCancelTapped__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "analyticsPageTag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D68858];
  v9[0] = *MEMORY[0x1E0D68AA0];
  v9[1] = v5;
  v6 = *MEMORY[0x1E0D688C0];
  v10[0] = *MEMORY[0x1E0D68B18];
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v3, v4, v7);

  return objc_msgSend(*(id *)(a1 + 32), "_withdrawApplicationTapped");
}

- (void)_withdrawApplicationTapped
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[PKApplyExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
  objc_initWeak(&location, self);
  -[PKApplyExplanationViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__PKApplyActionExplanationViewController__withdrawApplicationTapped__block_invoke;
  v4[3] = &unk_1E3E62598;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "withdrawApplicationWithCompletion:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __68__PKApplyActionExplanationViewController__withdrawApplicationTapped__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(WeakRetained, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __68__PKApplyActionExplanationViewController__withdrawApplicationTapped__block_invoke_2;
      v13[3] = &unk_1E3E62288;
      v14 = v8;
      objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v13);

    }
    else
    {
      objc_msgSend(WeakRetained, "showNavigationBarSpinner:", 0);
      if (v6)
      {
        v10 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
        objc_msgSend(v8, "navigationController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, 0);

      }
      else
      {
        objc_msgSend(v8, "controller");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "endApplyFlow");

        objc_msgSend(v8, "_terminateFlow");
      }
    }
  }

}

uint64_t __68__PKApplyActionExplanationViewController__withdrawApplicationTapped__block_invoke_2(uint64_t a1, char a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 0);
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_terminateFlow");
  return result;
}

- (void)_terminateFlow
{
  void *v3;
  void *v4;
  id v5;

  -[PKApplyExplanationViewController setupDelegate](self, "setupDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKApplyActionExplanationViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

@end
