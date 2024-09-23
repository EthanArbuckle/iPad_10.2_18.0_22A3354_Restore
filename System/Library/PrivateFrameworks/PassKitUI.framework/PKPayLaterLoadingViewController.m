@implementation PKPayLaterLoadingViewController

- (PKPayLaterLoadingViewController)initWithSetupFlowController:(id)a3
{
  PKPayLaterLoadingViewController *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterLoadingViewController;
  result = -[PKPayLaterSetupViewController initWithSetupFlowController:dynamicContentPageType:](&v4, sel_initWithSetupFlowController_dynamicContentPageType_, a3, 3);
  if (result)
    result->_minimumDelayNanoSeconds = 1500000000.0;
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterLoadingViewController;
  -[PKPayLaterSetupViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[PKPayLaterSetupViewController dynamicContentPage](self, "dynamicContentPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v4);

  -[PKPayLaterSetupViewController dynamicContentPage](self, "dynamicContentPage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headerSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v6);

  -[PKPaymentSetupOptionsViewController setShowSearchBar:](self, "setShowSearchBar:", 0);
  -[PKPayLaterSetupViewController setRightBarButton:](self, "setRightBarButton:", 0);
  -[PKPayLaterSetupViewController setLeftBarButton:](self, "setLeftBarButton:", 3);
  -[PKPaymentSetupOptionsViewController setShowHeaderSpinner:](self, "setShowHeaderSpinner:", 1);
  -[PKPayLaterLoadingViewController _updateHeaderSubtitleWithAltTextIfNecessary](self, "_updateHeaderSubtitleWithAltTextIfNecessary");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  _QWORD v8[5];
  id v9[2];
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterLoadingViewController;
  -[PKPayLaterSetupViewController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  if (!self->_didRequestNextViewController)
  {
    self->_didRequestNextViewController = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSince1970");
    v6 = v5;

    objc_initWeak(&location, self);
    -[PKPayLaterSetupViewController setupController](self, "setupController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__PKPayLaterLoadingViewController_viewWillAppear___block_invoke;
    v8[3] = &unk_1E3E78BB8;
    objc_copyWeak(v9, &location);
    *(double *)&v9[1] = v6 * 1000000000.0;
    v8[4] = self;
    objc_msgSend(v7, "nextViewControllerFromState:parentViewController:completion:", 1, self, v8);

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

void __50__PKPayLaterLoadingViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  _QWORD v15[5];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSince1970");
      v11 = v10 * 1000000000.0;

      v12 = fmax(*(double *)(*(_QWORD *)(a1 + 32) + 1352) - vabdd_f64(v11, *(double *)(a1 + 48)), 0.0);
      objc_msgSend(v8, "setNextStepButtonTapped:", 1);
      objc_msgSend(v8, "navigationController");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pk_presentPaymentSetupViewController:animated:delay:completion:", v5, 1, (uint64_t)v12, 0);
    }
    else
    {
      if (!v6)
      {
        objc_msgSend(WeakRetained, "dismissSetupFlowWithCompletion:", 0);
        goto LABEL_5;
      }
      PKAccountDisplayableError();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __50__PKPayLaterLoadingViewController_viewWillAppear___block_invoke_2;
      v15[3] = &unk_1E3E612E8;
      v15[4] = v8;
      v13 = PKAlertForDisplayableErrorWithHandlers(v14, 0, v15, 0);

      if (v13)
        objc_msgSend(v8, "presentViewController:animated:completion:", v13, 1, 0);
    }

  }
LABEL_5:

}

uint64_t __50__PKPayLaterLoadingViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissSetupFlowWithCompletion:", 0);
}

- (id)additionalAnalyticsDictionary
{
  void *v3;
  void *v4;
  void *v5;

  -[PKPayLaterSetupViewController pageTag](self, "pageTag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterSetupViewController setupController](self, "setupController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPayLaterExplanationViewController analyticsDictionaryWithAdditionalDictionary:pageTag:setupController:](PKPayLaterExplanationViewController, "analyticsDictionaryWithAdditionalDictionary:pageTag:setupController:", 0, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateHeaderSubtitleWithAltTextIfNecessary
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

  -[PKPayLaterSetupViewController dynamicContentPage](self, "dynamicContentPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "altHeaderSubtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPayLaterSetupViewController dynamicContentPage](self, "dynamicContentPage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "altHeaderSubtitleTimeInterval");

  if (v4 && v6 >= 1)
  {
    objc_initWeak(&location, self);
    v7 = dispatch_time(0, 1000000000 * v6);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__PKPayLaterLoadingViewController__updateHeaderSubtitleWithAltTextIfNecessary__block_invoke;
    block[3] = &unk_1E3E61B68;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __78__PKPayLaterLoadingViewController__updateHeaderSubtitleWithAltTextIfNecessary__block_invoke(uint64_t a1)
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

@end
