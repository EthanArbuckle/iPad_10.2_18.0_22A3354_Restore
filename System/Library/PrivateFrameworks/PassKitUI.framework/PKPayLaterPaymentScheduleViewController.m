@implementation PKPayLaterPaymentScheduleViewController

- (PKPayLaterPaymentScheduleViewController)initWithSetupFlowController:(id)a3 dynamicContentPageType:(unint64_t)a4
{
  id v6;
  PKPayLaterPaymentScheduleViewController *v7;
  uint64_t v8;
  PKPayLaterFinancingOption *selectedFinancingOption;
  PKPayLaterPaymentScheduleSectionController *v10;
  void *v11;
  uint64_t v12;
  PKPayLaterPaymentScheduleSectionController *sectionController;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterPaymentScheduleViewController;
  v7 = -[PKPayLaterSetupViewController initWithSetupFlowController:dynamicContentPageType:](&v15, sel_initWithSetupFlowController_dynamicContentPageType_, v6, a4);
  if (v7)
  {
    v7->_setupFlowControllerContext = objc_msgSend(v6, "controllerContext");
    objc_msgSend(v6, "selectedFinancingOption");
    v8 = objc_claimAutoreleasedReturnValue();
    selectedFinancingOption = v7->_selectedFinancingOption;
    v7->_selectedFinancingOption = (PKPayLaterFinancingOption *)v8;

    v10 = [PKPayLaterPaymentScheduleSectionController alloc];
    -[PKPayLaterSetupViewController dynamicContentPage](v7, "dynamicContentPage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKPayLaterPaymentScheduleSectionController initWithSetupFlowController:dynamicContentPage:selectedFinancingOption:delegate:](v10, "initWithSetupFlowController:dynamicContentPage:selectedFinancingOption:delegate:", v6, v11, v7->_selectedFinancingOption, v7);
    sectionController = v7->_sectionController;
    v7->_sectionController = (PKPayLaterPaymentScheduleSectionController *)v12;

    -[PKPayLaterSectionController setDynamicCollectionDelegate:](v7->_sectionController, "setDynamicCollectionDelegate:", v7);
  }

  return v7;
}

- (void)nextButtonTapped
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterPaymentScheduleViewController;
  -[PKPayLaterSetupViewController nextButtonTapped](&v5, sel_nextButtonTapped);
  -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", 1);
  -[PKPayLaterSetupViewController setupController](self, "setupController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__PKPayLaterPaymentScheduleViewController_nextButtonTapped__block_invoke;
  v4[3] = &unk_1E3E62260;
  v4[4] = self;
  objc_msgSend(v3, "nextViewControllerFromState:parentViewController:completion:", 6, self, v4);

}

void __59__PKPayLaterPaymentScheduleViewController_nextButtonTapped__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__PKPayLaterPaymentScheduleViewController_nextButtonTapped__block_invoke_2;
    v15[3] = &unk_1E3E62288;
    v15[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v15);

  }
  else if (v6)
  {
    PKAccountDisplayableError();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = PKAlertForDisplayableErrorWithHandlers(v9, 0, 0, 0);

    v11 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__PKPayLaterPaymentScheduleViewController_nextButtonTapped__block_invoke_3;
    v14[3] = &unk_1E3E612E8;
    v14[4] = v11;
    objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, v14);

  }
  else
  {
    v12 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__PKPayLaterPaymentScheduleViewController_nextButtonTapped__block_invoke_4;
    v13[3] = &unk_1E3E612E8;
    v13[4] = v12;
    objc_msgSend(v12, "dismissSetupFlowWithCompletion:", v13);
  }

}

uint64_t __59__PKPayLaterPaymentScheduleViewController_nextButtonTapped__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
}

uint64_t __59__PKPayLaterPaymentScheduleViewController_nextButtonTapped__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
}

uint64_t __59__PKPayLaterPaymentScheduleViewController_nextButtonTapped__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
}

- (id)pageTag
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterPaymentScheduleViewController;
  -[PKPayLaterSetupViewController pageTag](&v9, sel_pageTag);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterSetupViewController dynamicContentPage](self, "dynamicContentPage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "pageType");

  if (v5 == 11)
  {
    v6 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-bnpl"), v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
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
  int64_t setupFlowControllerContext;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterPaymentScheduleViewController;
  -[PKPayLaterSetupViewController viewDidLoad](&v16, sel_viewDidLoad);
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
  v17[0] = self->_sectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v7, 0);

  -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "footerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  setupFlowControllerContext = self->_setupFlowControllerContext;
  if (setupFlowControllerContext == 4)
  {
    -[PKPayLaterSetupViewController setRightBarButton:](self, "setRightBarButton:", 2);
    objc_msgSend(v8, "setPrimaryButton:", 0);
    objc_msgSend(v9, "setManualEntryButton:", 0);
    objc_msgSend(v9, "setSetupLaterButton:", 0);
  }
  else if (!setupFlowControllerContext)
  {
    -[PKPayLaterSetupViewController setRightBarButton:](self, "setRightBarButton:", 0);
    -[PKPayLaterSetupViewController dynamicContentPage](self, "dynamicContentPage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "primaryActionTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v8, "primaryButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTitle:forState:", v12, 0);

      objc_msgSend(v8, "primaryButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel_nextButtonTapped, 64);

    }
    objc_msgSend(v9, "setManualEntryButton:", 0);
    objc_msgSend(v9, "setSetupLaterButton:", 0);

  }
  -[PKPayLaterPaymentScheduleViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FC8]);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterPaymentScheduleViewController;
  -[PKPayLaterSetupViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PKPayLaterSetupViewController setDisableRightBarButton:](self, "setDisableRightBarButton:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedFinancingOption, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
}

@end
