@implementation PKPayLaterSetupViewController

- (PKPayLaterSetupViewController)initWithSetupFlowController:(id)a3 dynamicContentPageType:(unint64_t)a4
{
  id v7;
  PKPayLaterSetupViewController *v8;
  PKPayLaterSetupViewController *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PKPayLaterDynamicContentPage *dynamicContentPage;
  objc_super v18;

  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPayLaterSetupViewController;
  v8 = -[PKPaymentSetupOptionsViewController initWithProvisioningController:context:delegate:](&v18, sel_initWithProvisioningController_context_delegate_, 0, objc_msgSend(v7, "setupContext"), 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_setupController, a3);
    v9->_dynamicContentPageType = a4;
    objc_msgSend(v7, "financingController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dynamicContent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "selectedProductType");
    objc_msgSend(v7, "selectedFinancingOption");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dynamicContentPageForPageType:productType:optionIdentifier:", a4, v12, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    dynamicContentPage = v9->_dynamicContentPage;
    v9->_dynamicContentPage = (PKPayLaterDynamicContentPage *)v15;

    -[PKPayLaterSetupViewController setRightBarButton:](v9, "setRightBarButton:", 1);
    -[PKPayLaterSetupViewController setModalInPresentation:](v9, "setModalInPresentation:", 1);
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char **v17;
  char *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  PKMultiHyperlinkView *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, void *);
  void *v35;
  id v36;
  id location;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)PKPayLaterSetupViewController;
  -[PKPaymentSetupOptionsViewController viewDidLoad](&v38, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setHeaderBackgroundColor:](self, "setHeaderBackgroundColor:", v3);

  -[PKPaymentSetupOptionsViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleAccessoriesEnabled:", 0);
  objc_msgSend(v4, "setAdditionalBottomPadding:", 8.0);
  -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPayLaterSetupFlowController controllerContext](self->_setupController, "controllerContext") != 4)
  {
    if (self->_previousViewControllerIsApplyFlow)
      goto LABEL_4;
    -[PKPayLaterSetupViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = PKEqualObjects();

    if (v9)
LABEL_4:
      -[PKPayLaterSetupViewController setLeftBarButton:](self, "setLeftBarButton:", 3);
  }
  if ((unint64_t)(-[PKPayLaterSetupFlowController controllerContext](self->_setupController, "controllerContext")- 1) <= 2&& self->_dynamicContentPageType == 11)
  {
    objc_msgSend(v5, "footerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterSetupViewController setLeftBarButton:](self, "setLeftBarButton:", 0);
    -[PKPayLaterSetupViewController setRightBarButton:](self, "setRightBarButton:", 0);
    -[PKPayLaterSetupViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidesBackButton:", 1);

    v12 = -[PKPayLaterSetupFlowController hasPayLaterPass](self->_setupController, "hasPayLaterPass");
    -[PKPayLaterSetupViewController dynamicContentPage](self, "dynamicContentPage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
      objc_msgSend(v13, "primaryActionTitle");
    else
      objc_msgSend(v13, "altPrimaryActionTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v5, "primaryButton");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTitle:forState:", v15, 0);

      v17 = &selRef_provisionPayLaterPassFromApprovalScreen;
      if (v12)
        v17 = &selRef_doneButtonTapped;
      v18 = *v17;
      objc_msgSend(v5, "primaryButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addTarget:action:forControlEvents:", self, v18, 64);

      if (v12)
        goto LABEL_18;
    }
    else
    {
      objc_msgSend(v5, "setPrimaryButton:", 0);
      if (v12)
        goto LABEL_18;
    }
    objc_msgSend(v14, "secondaryActionTitle");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      objc_msgSend(v10, "manualEntryButton");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTitle:forState:", v21, 0);

      objc_msgSend(v10, "manualEntryButton");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addTarget:action:forControlEvents:", self, sel_cancelButtonTapped, 64);

LABEL_19:
      objc_msgSend(v10, "setSetupLaterButton:", 0);

      goto LABEL_20;
    }
LABEL_18:
    objc_msgSend(v10, "setManualEntryButton:", 0);
    goto LABEL_19;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterSetupViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBackgroundColor:", v24);

  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setBackgroundColor:", v24);

  -[PKPayLaterDynamicContentPage footerContent](self->_dynamicContentPage, "footerContent");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "footerText");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v27 && v28)
  {
    objc_initWeak(&location, self);
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __44__PKPayLaterSetupViewController_viewDidLoad__block_invoke;
    v35 = &unk_1E3E62DF8;
    objc_copyWeak(&v36, &location);
    +[PKTextRangeHyperlink hyperlinkSourcesFromApplyFooter:linkTapped:](PKTextRangeHyperlink, "hyperlinkSourcesFromApplyFooter:linkTapped:", v27, &v32);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_alloc_init(PKMultiHyperlinkView);
    -[PKMultiHyperlinkView setText:](v31, "setText:", v29, v32, v33, v34, v35);
    -[PKMultiHyperlinkView setTextAlignment:](v31, "setTextAlignment:", 1);
    -[PKMultiHyperlinkView setSources:](v31, "setSources:", v30);
    objc_msgSend(v5, "setAdditionalLinkView:", v31);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

}

void __44__PKPayLaterSetupViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "didTapHyperLink:", v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterSetupViewController;
  -[PKPaymentSetupOptionsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  self->_nextStepButtonTapped = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterSetupViewController;
  -[PKPaymentSetupOptionsViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKPayLaterSetupViewController _reportViewDidAppear:](self, "_reportViewDidAppear:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterSetupViewController;
  -[PKPayLaterSetupViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PKPayLaterSetupViewController _reportViewDidAppear:](self, "_reportViewDidAppear:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  if (!self->_nextStepButtonTapped)
  {
    -[PKPayLaterSetupViewController _reportAnalyticsBackPressed](self, "_reportAnalyticsBackPressed", a3);
    -[PKPayLaterSetupFlowController endSetupFlowFromViewController:shouldDismiss:](self->_setupController, "endSetupFlowFromViewController:shouldDismiss:", self, 0);
  }
}

- (void)_reportViewDidAppear:(BOOL)a3
{
  id *v4;
  objc_class *v5;
  id v6;
  id v7;

  v4 = (id *)MEMORY[0x1E0D68C50];
  if (!a3)
    v4 = (id *)MEMORY[0x1E0D68C58];
  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = *v4;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setObject:forKey:", v6, *MEMORY[0x1E0D68AA0]);

  -[PKPayLaterSetupViewController reportAnalyticsEvent:](self, "reportAnalyticsEvent:", v7);
}

- (void)_reportAnalyticsBackPressed
{
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D68858];
  v5[0] = *MEMORY[0x1E0D687C0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterSetupViewController reportAnalyticsEvent:](self, "reportAnalyticsEvent:", v3);

}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  if (a3)
  {
    v4 = a4;
    v6 = a3;
    -[PKPayLaterSetupViewController navigationController](self, "navigationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v6, v4);

  }
}

- (id)navigationControllerViewControllers
{
  void *v2;
  void *v3;

  -[PKPayLaterSetupViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;

  v3 = a3;
  -[PKPayLaterSetupViewController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", v3);

}

- (void)reportAnalyticsEvent:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  PKPayLaterSetupFlowController *setupController;
  void *v8;
  void *v9;
  id v10;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v10 = objc_alloc_init(v4);
  objc_msgSend(v10, "addEntriesFromDictionary:", v5);

  -[PKPayLaterSetupViewController additionalAnalyticsDictionary](self, "additionalAnalyticsDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addEntriesFromDictionary:", v6);

  setupController = self->_setupController;
  -[PKPayLaterSetupViewController pageTag](self, "pageTag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterSetupViewController additionalAnalyticsSubjects](self, "additionalAnalyticsSubjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterSetupFlowController reportAnalyticsEventForPageTag:dictionary:additionalAnalyticsSubjects:](setupController, "reportAnalyticsEventForPageTag:dictionary:additionalAnalyticsSubjects:", v8, v10, v9);

}

- (id)additionalAnalyticsSubjects
{
  return 0;
}

- (id)pageTag
{
  void *dynamicContentPageType;

  dynamicContentPageType = (void *)self->_dynamicContentPageType;
  if (dynamicContentPageType)
  {
    PKPayLaterDynamicContentPageTypeToString();
    dynamicContentPageType = (void *)objc_claimAutoreleasedReturnValue();
  }
  return dynamicContentPageType;
}

- (id)additionalAnalyticsDictionary
{
  return 0;
}

- (void)didTapHyperLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKPayLaterSetupFlowController *setupController;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[2];
  _QWORD v20[2];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "linkURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "termsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterSetupFlowController financingController](self->_setupController, "financingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "payLaterAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (v5)
    {
      objc_msgSend(v5, "scheme");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsString:", CFSTR("http"));

      if (v11)
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5600]), "initWithURL:", v5);
        objc_msgSend(v12, "setModalPresentationStyle:", 2);
        -[PKPayLaterSetupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "openSensitiveURL:withOptions:", v5, 0);
      }

    }
    goto LABEL_11;
  }
  if (v8)
  {
    setupController = self->_setupController;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __49__PKPayLaterSetupViewController_didTapHyperLink___block_invoke;
    v18[3] = &unk_1E3E63BA0;
    v18[4] = self;
    -[PKPayLaterSetupFlowController termsViewControllerForTermsIdentifier:completion:](setupController, "termsViewControllerForTermsIdentifier:completion:", v6, v18);
LABEL_11:
    objc_msgSend(v4, "analyticsIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    v13 = v14;
    if (v14)
    {
      v15 = *MEMORY[0x1E0D68B18];
      v16 = *MEMORY[0x1E0D68858];
      v19[0] = *MEMORY[0x1E0D68AA0];
      v19[1] = v16;
      v20[0] = v15;
      v20[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterSetupViewController reportAnalyticsEvent:](self, "reportAnalyticsEvent:", v17);

    }
    goto LABEL_13;
  }
  PKLogFacilityTypeGetObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v6;
    _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Error: there is no account on PKApplyController in order to open termsIdentifier %@", buf, 0xCu);
  }
LABEL_13:

}

uint64_t __49__PKPayLaterSetupViewController_didTapHyperLink___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "presentViewController:animated:completion:", a2, 1, 0);
  return result;
}

- (void)setRightBarButton:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_rightBarButton != a3)
  {
    self->_rightBarButton = a3;
    -[PKPayLaterSetupViewController _buttonForBarButtonType:](self, "_buttonForBarButtonType:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    PKAXIDForBarButton(self->_rightBarButton);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityIdentifier:", v4);

    -[PKPayLaterSetupViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRightBarButtonItem:", v6);

  }
}

- (void)setLeftBarButton:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_leftBarButton != a3)
  {
    self->_leftBarButton = a3;
    -[PKPayLaterSetupViewController _buttonForBarButtonType:](self, "_buttonForBarButtonType:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    PKAXIDForBarButton(self->_leftBarButton);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityIdentifier:", v4);

    -[PKPayLaterSetupViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLeftBarButtonItem:", v6);

  }
}

- (void)setDisableRightBarButton:(BOOL)a3
{
  void *v4;
  id v5;

  self->_disableRightBarButton = a3;
  -[PKPayLaterSetupViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", !self->_disableRightBarButton);

}

- (void)setDisableLeftBarButton:(BOOL)a3
{
  void *v4;
  id v5;

  self->_disableLeftBarButton = a3;
  -[PKPayLaterSetupViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leftBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", !self->_disableLeftBarButton);

}

- (void)nextButtonTapped
{
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  self->_nextStepButtonTapped = 1;
  v4 = *MEMORY[0x1E0D68858];
  v5[0] = *MEMORY[0x1E0D68E58];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterSetupViewController reportAnalyticsEvent:](self, "reportAnalyticsEvent:", v3);

}

- (void)doneButtonTapped
{
  uint64_t v3;
  void (**v4)(void *, _QWORD *);
  _QWORD v5[5];
  _QWORD aBlock[5];

  self->_nextStepButtonTapped = 1;
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PKPayLaterSetupViewController_doneButtonTapped__block_invoke;
  aBlock[3] = &unk_1E3E63C08;
  aBlock[4] = self;
  v4 = (void (**)(void *, _QWORD *))_Block_copy(aBlock);
  if ((unint64_t)(-[PKPayLaterSetupFlowController controllerContext](self->_setupController, "controllerContext")- 1) <= 2&& self->_dynamicContentPageType == 11)
  {
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __49__PKPayLaterSetupViewController_doneButtonTapped__block_invoke_2;
    v5[3] = &unk_1E3E612E8;
    v5[4] = self;
    v4[2](v4, v5);
  }
  else
  {
    v4[2](v4, 0);
  }

}

void __49__PKPayLaterSetupViewController_doneButtonTapped__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v7 = *MEMORY[0x1E0D68858];
  v8[0] = *MEMORY[0x1E0D68A68];
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a2;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportAnalyticsEvent:", v6);

  objc_msgSend(*(id *)(a1 + 32), "dismissSetupFlowWithCompletion:", v5);
}

uint64_t __49__PKPayLaterSetupViewController_doneButtonTapped__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePostApprovalScreenSteps");
}

- (void)cancelButtonTapped
{
  uint64_t v3;
  void (**v4)(_QWORD);
  _QWORD v5[5];
  _QWORD v6[4];
  void (**v7)(_QWORD);
  _QWORD aBlock[5];

  self->_nextStepButtonTapped = 1;
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PKPayLaterSetupViewController_cancelButtonTapped__block_invoke;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = self;
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((unint64_t)(-[PKPayLaterSetupFlowController controllerContext](self->_setupController, "controllerContext")- 1) <= 2&& self->_dynamicContentPageType == 11)
  {
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __51__PKPayLaterSetupViewController_cancelButtonTapped__block_invoke_2;
    v6[3] = &unk_1E3E61590;
    v7 = v4;
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __51__PKPayLaterSetupViewController_cancelButtonTapped__block_invoke_3;
    v5[3] = &unk_1E3E612E8;
    v5[4] = self;
    -[PKPayLaterSetupViewController _showCancelAddingToWalletAlertWithCancelBlock:continueBlock:](self, "_showCancelAddingToWalletAlertWithCancelBlock:continueBlock:", v6, v5);

  }
  else
  {
    v4[2](v4);
  }

}

uint64_t __51__PKPayLaterSetupViewController_cancelButtonTapped__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v5 = *MEMORY[0x1E0D68858];
  v6[0] = *MEMORY[0x1E0D688E8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportAnalyticsEvent:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "dismissSetupFlowWithCompletion:", 0);
}

uint64_t __51__PKPayLaterSetupViewController_cancelButtonTapped__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__PKPayLaterSetupViewController_cancelButtonTapped__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "provisionPayLaterPassFromApprovalScreen");
}

- (void)_handlePostApprovalScreenSteps
{
  int v3;
  int64_t v4;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v3 = PKHidePayLaterOptions();
  if ((v3 & 1) == 0)
    PKSetShouldSeePayLaterEnablementAlert();
  v4 = -[PKPayLaterSetupFlowController controllerContext](self->_setupController, "controllerContext");
  if (v4 == 1 || v4 == 3)
  {
    if (v3)
    {
      PKLogFacilityTypeGetObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Presenting pay later enablement alert", v17, 2u);
      }

      PKCreateAlertControllerForPayLaterEnablement();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKUIKeyWindow();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rootViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPayLaterSetupViewController traitCollection](self, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "userInterfaceIdiom");

      if (!v11)
      {
        objc_msgSend(v9, "presentedViewController");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v12)
          v14 = (void *)v12;
        else
          v14 = v9;
        v15 = v14;

        v9 = v15;
      }
      objc_msgSend(v9, "presentViewController:animated:completion:", v7, 1, &__block_literal_global_24);

    }
  }
  else if (v4 == 2)
  {
    if (v3)
    {
      PKLogFacilityTypeGetObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "The user has pay later options turned off in settings. Turning on the preference to present the alert", buf, 2u);
      }

      PKSetShouldSeePayLaterEnablementAlert();
    }
    -[PKPayLaterSetupViewController _presentPayLaterPassIfNecessaryWithCompletion:](self, "_presentPayLaterPassIfNecessaryWithCompletion:", 0);
  }
}

uint64_t __63__PKPayLaterSetupViewController__handlePostApprovalScreenSteps__block_invoke()
{
  return PKSetShouldSeePayLaterEnablementAlert();
}

- (void)provisionPayLaterPassFromApprovalScreen
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id location;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  self->_nextStepButtonTapped = 1;
  v8 = *MEMORY[0x1E0D68858];
  v9[0] = *MEMORY[0x1E0D68738];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterSetupViewController reportAnalyticsEvent:](self, "reportAnalyticsEvent:", v3);

  -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", 1);
  objc_initWeak(&location, self);
  -[PKPayLaterSetupViewController setupController](self, "setupController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke;
  v5[3] = &unk_1E3E625E8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  objc_msgSend(v4, "provisionPayLaterPassWithCompletion:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  char v12;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_2;
  v8[3] = &unk_1E3E625C0;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v12 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

  objc_destroyWeak(&v11);
}

void __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_initWeak(location, *(id *)(a1 + 40));
      objc_msgSend(WeakRetained, "setupController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 40);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_33;
      v10[3] = &unk_1E3E63C50;
      objc_copyWeak(&v12, location);
      v11 = *(id *)(a1 + 32);
      objc_msgSend(v3, "nextViewControllerFromState:parentViewController:completion:", 9, v4, v10);

      objc_destroyWeak(&v12);
      objc_destroyWeak(location);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(void **)(a1 + 32);
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v6;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Failed to provision pay later pass %@", (uint8_t *)location, 0xCu);
      }

      PKAccountDisplayableError();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);

      if (v8)
      {
        objc_msgSend(WeakRetained, "navigationController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);

      }
      objc_msgSend(WeakRetained, "setShowNavigationBarSpinner:", 0);

    }
  }

}

void __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(WeakRetained, "navigationController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_2_34;
      v16[3] = &unk_1E3E62288;
      v16[4] = v8;
      objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v16);
    }
    else
    {
      if (!v6)
      {
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_5;
        v12[3] = &unk_1E3E61310;
        objc_copyWeak(&v13, (id *)(a1 + 40));
        objc_msgSend(v8, "dismissSetupFlowWithCompletion:", v12);
        objc_destroyWeak(&v13);
        goto LABEL_5;
      }
      PKAccountDisplayableError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = PKAlertForDisplayableErrorWithHandlers(v10, 0, 0, 0);

      if (v9)
      {
        objc_msgSend(v8, "navigationController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_3;
        v15[3] = &unk_1E3E612E8;
        v15[4] = v8;
        objc_msgSend(v11, "presentViewController:animated:completion:", v9, 1, v15);

      }
      else
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_4;
        v14[3] = &unk_1E3E612E8;
        v14[4] = v8;
        objc_msgSend(v8, "dismissSetupFlowWithCompletion:", v14);
      }
    }

  }
LABEL_5:

}

uint64_t __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_2_34(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
}

uint64_t __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
}

uint64_t __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
}

void __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setShowNavigationBarSpinner:", 0);
    objc_msgSend(v2, "_handlePostApprovalScreenSteps");
    WeakRetained = v2;
  }

}

- (void)dismissSetupFlowWithCompletion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PKPayLaterSetupFlowController endSetupFlowFromViewController:shouldDismiss:](self->_setupController, "endSetupFlowFromViewController:shouldDismiss:", self, 1);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (void)_showCancelAddingToWalletAlertWithCancelBlock:(id)a3 continueBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;

  v6 = a3;
  v23 = a4;
  -[PKPayLaterSetupFlowController financingController](self->_setupController, "financingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "payLaterAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKApplyController preferredLanguageForFeatureIdentifier:account:](PKApplyController, "preferredLanguageForFeatureIdentifier:account:", objc_msgSend(v8, "feature"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedCocoonString(CFSTR("CANCEL_ADD_TO_WALLET_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCocoonString(CFSTR("CANCEL_ADD_TO_WALLET_MESSAGE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v11, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedApplyFeatureString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __93__PKPayLaterSetupViewController__showCancelAddingToWalletAlertWithCancelBlock_continueBlock___block_invoke;
  v27[3] = &unk_1E3E61CA8;
  v28 = v6;
  v17 = v6;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addAction:", v18);
  objc_msgSend(v13, "setPreferredAction:", v18);
  v19 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedApplyFeatureString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  v25[1] = 3221225472;
  v25[2] = __93__PKPayLaterSetupViewController__showCancelAddingToWalletAlertWithCancelBlock_continueBlock___block_invoke_2;
  v25[3] = &unk_1E3E61CA8;
  v26 = v23;
  v21 = v23;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 0, v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addAction:", v22);
  -[PKPayLaterSetupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);

}

uint64_t __93__PKPayLaterSetupViewController__showCancelAddingToWalletAlertWithCancelBlock_continueBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __93__PKPayLaterSetupViewController__showCancelAddingToWalletAlertWithCancelBlock_continueBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_presentPayLaterPassIfNecessaryWithCompletion:(id)a3
{
  PKPayLaterSetupFlowController *setupController;
  id v5;
  void *v6;
  id v7;

  setupController = self->_setupController;
  v5 = a3;
  -[PKPayLaterSetupFlowController payLaterPassUniqueIdentifier](setupController, "payLaterPassUniqueIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterSetupFlowController setupViewControllerDelegate](self->_setupController, "setupViewControllerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewController:requestPresentPassUniqueIdentifier:completion:", self, v7, v5);

}

- (id)_buttonForBarButtonType:(int64_t)a3
{
  UIBarButtonItem **p_cancelButton;
  UIBarButtonItem *cancelButton;
  id v6;
  void *v7;
  char *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  UIBarButtonItem *v15;
  UIBarButtonItem *v16;

  switch(a3)
  {
    case 3:
      p_cancelButton = &self->_cancelButton;
      cancelButton = self->_cancelButton;
      if (!cancelButton)
      {
        v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonTapped);
        v7 = *p_cancelButton;
        *p_cancelButton = (UIBarButtonItem *)v12;
LABEL_11:

        cancelButton = *p_cancelButton;
      }
      break;
    case 2:
      p_cancelButton = &self->_doneButton;
      cancelButton = self->_doneButton;
      if (!cancelButton)
      {
        v13 = objc_alloc(MEMORY[0x1E0DC34F0]);
        PKLocalizedString(CFSTR("DONE"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = sel_doneButtonTapped;
        v9 = v13;
        v10 = v7;
        v11 = 2;
        goto LABEL_10;
      }
      break;
    case 1:
      p_cancelButton = &self->_nextButton;
      cancelButton = self->_nextButton;
      if (!cancelButton)
      {
        v6 = objc_alloc(MEMORY[0x1E0DC34F0]);
        PKLocalizedPaymentString(CFSTR("NEXT"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = sel_nextButtonTapped;
        v9 = v6;
        v10 = v7;
        v11 = 0;
LABEL_10:
        v14 = objc_msgSend(v9, "initWithTitle:style:target:action:", v10, v11, self, v8);
        v15 = *p_cancelButton;
        *p_cancelButton = (UIBarButtonItem *)v14;

        goto LABEL_11;
      }
      break;
    default:
      v16 = 0;
      return v16;
  }
  v16 = cancelButton;
  return v16;
}

- (PKPayLaterSetupFlowController)setupController
{
  return self->_setupController;
}

- (PKPayLaterDynamicContentPage)dynamicContentPage
{
  return self->_dynamicContentPage;
}

- (int64_t)rightBarButton
{
  return self->_rightBarButton;
}

- (int64_t)leftBarButton
{
  return self->_leftBarButton;
}

- (BOOL)disableRightBarButton
{
  return self->_disableRightBarButton;
}

- (BOOL)disableLeftBarButton
{
  return self->_disableLeftBarButton;
}

- (BOOL)previousViewControllerIsApplyFlow
{
  return self->_previousViewControllerIsApplyFlow;
}

- (void)setPreviousViewControllerIsApplyFlow:(BOOL)a3
{
  self->_previousViewControllerIsApplyFlow = a3;
}

- (BOOL)nextStepButtonTapped
{
  return self->_nextStepButtonTapped;
}

- (void)setNextStepButtonTapped:(BOOL)a3
{
  self->_nextStepButtonTapped = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicContentPage, 0);
  objc_storeStrong((id *)&self->_setupController, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
}

@end
