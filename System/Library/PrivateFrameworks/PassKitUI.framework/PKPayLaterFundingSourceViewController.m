@implementation PKPayLaterFundingSourceViewController

- (PKPayLaterFundingSourceViewController)initWithSetupFlowController:(id)a3
{
  id v4;
  PKPayLaterFundingSourceViewController *v5;
  void *v6;
  PKPayLaterPaymentSource *v7;
  void *v8;
  void *v9;
  void *v10;
  PKPayLaterPaymentSource *selectedFundingSource;
  PKPayLaterPaymentSource *v12;
  PKPayLaterFundingSourceSectionController *v13;
  void *v14;
  uint64_t v15;
  PKPayLaterFundingSourceSectionController *sectionController;
  void *v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPayLaterFundingSourceViewController;
  v5 = -[PKPayLaterSetupViewController initWithSetupFlowController:dynamicContentPageType:](&v20, sel_initWithSetupFlowController_dynamicContentPageType_, v4, 5);
  if (v5)
  {
    objc_msgSend(v4, "financingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "payLaterAccount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "peerPaymentAccount");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedFundingSource");
    v7 = (PKPayLaterPaymentSource *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedFinancingOption");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "availableFundingSourcesForFinancingOption:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v7)
    {
      objc_msgSend(v9, "pk_firstObjectPassingTest:", &__block_literal_global_230);
      v7 = (PKPayLaterPaymentSource *)objc_claimAutoreleasedReturnValue();
    }
    v5->_autoPayment = 1;
    selectedFundingSource = v5->_selectedFundingSource;
    v5->_selectedFundingSource = v7;
    v12 = v7;

    v13 = [PKPayLaterFundingSourceSectionController alloc];
    -[PKPayLaterSetupViewController dynamicContentPage](v5, "dynamicContentPage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKPayLaterFundingSourceSectionController initWithPayLaterAccount:dynamicContentPage:peerPaymentAccount:selectedFundingSource:autoPayment:availableFundingSources:setupController:delegate:](v13, "initWithPayLaterAccount:dynamicContentPage:peerPaymentAccount:selectedFundingSource:autoPayment:availableFundingSources:setupController:delegate:", v19, v14, v18, v12, v5->_autoPayment, v10, v4, v5);
    sectionController = v5->_sectionController;
    v5->_sectionController = (PKPayLaterFundingSourceSectionController *)v15;

    -[PKPayLaterSectionController setDynamicCollectionDelegate:](v5->_sectionController, "setDynamicCollectionDelegate:", v5);
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v5, "setUseItemIdentityWhenUpdating:", 1);

  }
  return v5;
}

BOOL __69__PKPayLaterFundingSourceViewController_initWithSetupFlowController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "priority") == 1000;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterFundingSourceViewController;
  -[PKPayLaterSetupViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PKPayLaterFundingSourceViewController _title](self, "_title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v3);

  -[PKPayLaterFundingSourceViewController _subtitle](self, "_subtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v4);

  -[PKPaymentSetupOptionsViewController setShowSearchBar:](self, "setShowSearchBar:", 0);
  v7[0] = self->_sectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v5, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterFundingSourceViewController;
  -[PKPayLaterSetupViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PKPayLaterFundingSourceViewController _updateEnabledButtons](self, "_updateEnabledButtons");
}

- (void)didSelectFundingSource:(id)a3
{
  objc_storeStrong((id *)&self->_selectedFundingSource, a3);
  -[PKPayLaterFundingSourceViewController _updateEnabledButtons](self, "_updateEnabledButtons");
}

- (void)didUpdateAutoPayment:(BOOL)a3
{
  self->_autoPayment = a3;
}

- (void)reloadFundingSources
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PKPayLaterSetupViewController setupController](self, "setupController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "financingController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "refreshAvailableFundingSources");
  -[PKPayLaterSetupViewController setupController](self, "setupController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedFinancingOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "availableFundingSourcesForFinancingOption:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFundingSourceSectionController setAvailableFundingSources:](self->_sectionController, "setAvailableFundingSources:", v6);
  -[PKDynamicCollectionViewController reloadDataAnimated:](self, "reloadDataAnimated:", 1);

}

- (void)nextButtonTapped
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterFundingSourceViewController;
  -[PKPayLaterSetupViewController nextButtonTapped](&v11, sel_nextButtonTapped);
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPayLaterPaymentSource name](self->_selectedFundingSource, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Selected funding source %@ for the financing option", buf, 0xCu);

  }
  -[PKPayLaterSetupViewController setupController](self, "setupController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "financingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectedFundingSource:", self->_selectedFundingSource);

  -[PKPayLaterSetupViewController setupController](self, "setupController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "financingController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutoPaymentOn:", self->_autoPayment);

  -[PKPayLaterFundingSourceViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", 1);
  -[PKPayLaterSetupViewController setupController](self, "setupController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__PKPayLaterFundingSourceViewController_nextButtonTapped__block_invoke;
  v10[3] = &unk_1E3E62260;
  v10[4] = self;
  objc_msgSend(v9, "nextViewControllerFromState:parentViewController:completion:", 7, self, v10);

}

void __57__PKPayLaterFundingSourceViewController_nextButtonTapped__block_invoke(uint64_t a1, void *a2, void *a3)
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
    v15[2] = __57__PKPayLaterFundingSourceViewController_nextButtonTapped__block_invoke_2;
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
    v14[2] = __57__PKPayLaterFundingSourceViewController_nextButtonTapped__block_invoke_3;
    v14[3] = &unk_1E3E612E8;
    v14[4] = v11;
    objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, v14);

  }
  else
  {
    v12 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__PKPayLaterFundingSourceViewController_nextButtonTapped__block_invoke_4;
    v13[3] = &unk_1E3E612E8;
    v13[4] = v12;
    objc_msgSend(v12, "dismissSetupFlowWithCompletion:", v13);
  }

}

uint64_t __57__PKPayLaterFundingSourceViewController_nextButtonTapped__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
}

uint64_t __57__PKPayLaterFundingSourceViewController_nextButtonTapped__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
}

uint64_t __57__PKPayLaterFundingSourceViewController_nextButtonTapped__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
}

- (void)setShowNavigationBarSpinner:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterFundingSourceViewController;
  -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](&v4, sel_setShowNavigationBarSpinner_, a3);
  -[PKPayLaterFundingSourceViewController _updateEnabledButtons](self, "_updateEnabledButtons");
}

- (id)additionalAnalyticsDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[PKPayLaterFundingSourceSectionController availableFundingSources](self->_sectionController, "availableFundingSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pk_containsObjectPassingTest:", &__block_literal_global_20);

  v7[0] = *MEMORY[0x1E0D68CF0];
  PKAnalyticsReportSwitchToggleResultValue();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = *MEMORY[0x1E0D68788];
  v8[0] = v3;
  PKAnalyticsReportSwitchToggleResultValue();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __70__PKPayLaterFundingSourceViewController_additionalAnalyticsDictionary__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  if (objc_msgSend(v2, "type") == 1)
  {
    objc_msgSend(v2, "paymentApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "paymentType") == 1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)additionalAnalyticsSubjects
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0D698F8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_title
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[PKPayLaterSetupViewController dynamicContentPage](self, "dynamicContentPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[PKPayLaterSetupViewController setupController](self, "setupController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredLanguage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedApplyFeatureString();
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_subtitle
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  -[PKPayLaterSetupViewController dynamicContentPage](self, "dynamicContentPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerSubtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[PKPayLaterSetupViewController setupController](self, "setupController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedFinancingOption");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "dueNow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currencyAmount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPayLaterSetupViewController setupController](self, "setupController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferredLanguage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "formattedStringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedApplyFeatureString();
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_updateEnabledButtons
{
  -[PKPayLaterSetupViewController setDisableRightBarButton:](self, "setDisableRightBarButton:", self->_selectedFundingSource == 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_selectedFundingSource, 0);
}

@end
