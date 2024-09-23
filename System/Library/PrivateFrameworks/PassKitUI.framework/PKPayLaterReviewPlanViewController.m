@implementation PKPayLaterReviewPlanViewController

- (PKPayLaterReviewPlanViewController)initWithSetupFlowController:(id)a3
{
  id v4;
  PKPayLaterReviewPlanViewController *v5;
  uint64_t v6;
  PKPayLaterFinancingOption *selectedFinancingOption;
  PKPayLaterReviewPlanSectionController *v8;
  void *v9;
  uint64_t v10;
  PKPayLaterReviewPlanSectionController *sectionController;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPayLaterReviewPlanViewController;
  v5 = -[PKPayLaterSetupViewController initWithSetupFlowController:dynamicContentPageType:](&v13, sel_initWithSetupFlowController_dynamicContentPageType_, v4, 4);
  if (v5)
  {
    objc_msgSend(v4, "selectedFinancingOption");
    v6 = objc_claimAutoreleasedReturnValue();
    selectedFinancingOption = v5->_selectedFinancingOption;
    v5->_selectedFinancingOption = (PKPayLaterFinancingOption *)v6;

    v8 = [PKPayLaterReviewPlanSectionController alloc];
    -[PKPayLaterSetupViewController dynamicContentPage](v5, "dynamicContentPage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PKPayLaterReviewPlanSectionController initWithSetupFlowController:dynamicContentPage:financingOption:delegate:](v8, "initWithSetupFlowController:dynamicContentPage:financingOption:delegate:", v4, v9, v5->_selectedFinancingOption, v5);
    sectionController = v5->_sectionController;
    v5->_sectionController = (PKPayLaterReviewPlanSectionController *)v10;

    -[PKPayLaterSectionController setDynamicCollectionDelegate:](v5->_sectionController, "setDynamicCollectionDelegate:", v5);
  }

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterReviewPlanViewController;
  -[PKPayLaterSetupViewController viewDidLoad](&v9, sel_viewDidLoad);
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
  -[PKPayLaterReviewPlanViewController _createDockView](self, "_createDockView");
  v10[0] = self->_sectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v7, 0);

  -[PKPayLaterSetupViewController setupController](self, "setupController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "controllerContext") == 4;

  -[PKPayLaterSetupViewController setRightBarButton:](self, "setRightBarButton:", 2 * v6);
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
  v9.super_class = (Class)PKPayLaterReviewPlanViewController;
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
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-loan"), v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)nextButtonTapped
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PKPayLaterReviewPlanViewController;
  -[PKPayLaterSetupViewController nextButtonTapped](&v8, sel_nextButtonTapped);
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPayLaterSetupViewController setupController](self, "setupController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedFinancingOption");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "User agreed to financing option %@", buf, 0xCu);

  }
  -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", 1);
  -[PKPayLaterSetupViewController setupController](self, "setupController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__PKPayLaterReviewPlanViewController_nextButtonTapped__block_invoke;
  v7[3] = &unk_1E3E62260;
  v7[4] = self;
  objc_msgSend(v6, "nextViewControllerFromState:parentViewController:completion:", 8, self, v7);

}

void __54__PKPayLaterReviewPlanViewController_nextButtonTapped__block_invoke(uint64_t a1, void *a2, void *a3)
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
    v15[2] = __54__PKPayLaterReviewPlanViewController_nextButtonTapped__block_invoke_2;
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
    v14[2] = __54__PKPayLaterReviewPlanViewController_nextButtonTapped__block_invoke_3;
    v14[3] = &unk_1E3E612E8;
    v14[4] = v11;
    objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, v14);

  }
  else
  {
    v12 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__PKPayLaterReviewPlanViewController_nextButtonTapped__block_invoke_4;
    v13[3] = &unk_1E3E612E8;
    v13[4] = v12;
    objc_msgSend(v12, "dismissSetupFlowWithCompletion:", v13);
  }

}

uint64_t __54__PKPayLaterReviewPlanViewController_nextButtonTapped__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
}

uint64_t __54__PKPayLaterReviewPlanViewController_nextButtonTapped__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
}

uint64_t __54__PKPayLaterReviewPlanViewController_nextButtonTapped__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
}

- (void)_createDockView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PKPayLaterSetupViewController setupController](self, "setupController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "controllerContext");

  if (v4 != 4)
  {
    -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "footerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setManualEntryButton:", 0);
    objc_msgSend(v5, "setSetupLaterButton:", 0);
    objc_msgSend(v10, "primaryButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterSetupViewController dynamicContentPage](self, "dynamicContentPage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "primaryActionTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:forState:", v8, 0);

    objc_msgSend(v10, "primaryButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel_nextButtonTapped, 0x2000);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedFinancingOption, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_selectedFundingSource, 0);
}

@end
