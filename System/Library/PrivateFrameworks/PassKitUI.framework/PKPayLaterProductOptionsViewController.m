@implementation PKPayLaterProductOptionsViewController

- (PKPayLaterProductOptionsViewController)initWithSetupFlowController:(id)a3 dynamicContentPageType:(unint64_t)a4
{
  id v6;
  PKPayLaterProductOptionsViewController *v7;
  PKPayLaterProductOptionsViewController *v8;
  PKPayLaterProductOptionsSectionController *v9;
  void *v10;
  uint64_t v11;
  PKPayLaterProductOptionsSectionController *sectionController;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPayLaterProductOptionsViewController;
  v7 = -[PKPayLaterSetupViewController initWithSetupFlowController:dynamicContentPageType:](&v14, sel_initWithSetupFlowController_dynamicContentPageType_, v6, a4);
  v8 = v7;
  if (v7)
  {
    v7->_pageType = a4;
    v9 = [PKPayLaterProductOptionsSectionController alloc];
    -[PKPayLaterSetupViewController dynamicContentPage](v8, "dynamicContentPage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKPayLaterProductOptionsSectionController initWithSetupFlowController:dynamicContentPage:delegate:](v9, "initWithSetupFlowController:dynamicContentPage:delegate:", v6, v10, v8);
    sectionController = v8->_sectionController;
    v8->_sectionController = (PKPayLaterProductOptionsSectionController *)v11;

    -[PKPayLaterSectionController setDynamicCollectionDelegate:](v8->_sectionController, "setDynamicCollectionDelegate:", v8);
  }

  return v8;
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
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)PKPayLaterProductOptionsViewController;
  -[PKPayLaterSetupViewController viewDidLoad](&v21, sel_viewDidLoad);
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
  -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "footerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_pageType == 6)
  {
    -[PKPayLaterSetupViewController setupController](self, "setupController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "financingController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assessmentCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "eligibleProductAssessments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    -[PKPayLaterSetupViewController setupController](self, "setupController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "controllerContext");

    if ((unint64_t)(v15 - 1) <= 2 && self->_pageType == 6)
      objc_msgSend(v7, "setAdditionalLinkView:", 0);
    if (v13 < 2)
    {
      -[PKPayLaterSetupViewController dynamicContentPage](self, "dynamicContentPage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "primaryActionTitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v7, "primaryButton");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTitle:forState:", v17, 0);

        objc_msgSend(v7, "primaryButton");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel__selectedEligibleAssessment, 64);

      }
      else
      {
        objc_msgSend(v7, "setPrimaryButton:", 0);
      }
      objc_msgSend(v8, "setManualEntryButton:", 0);

    }
    else
    {
      -[PKPaymentSetupOptionsViewController removeSetupDockView](self, "removeSetupDockView");
    }

  }
  v22[0] = self->_sectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v20, 0);

}

- (void)reloadAllSectionsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _QWORD v6[2];

  v3 = a3;
  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = self->_sectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v5, v3);

}

- (void)productOptionsSectionController:(id)a3 didSelectFinancingOption:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v7;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "User selected pay later financing option identifier: %@", (uint8_t *)&v13, 0xCu);

  }
  objc_msgSend(v5, "productType");
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  PKPayLaterAccountProductTypeToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, *MEMORY[0x1E0D68BD0]);

  -[PKPayLaterSetupViewController setupController](self, "setupController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "controllerContext");

  -[PKPayLaterSetupViewController setupController](self, "setupController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reportAnalyticsEvent:", v8);

  -[PKPayLaterSetupViewController setupController](self, "setupController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSelectedFinancingOption:", v5);

  -[PKPayLaterProductOptionsViewController _loadNextViewController](self, "_loadNextViewController");
}

- (void)productOptionsSectionController:(id)a3 didSelectPreliminaryAssessment:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "productType");
  PKPayLaterAccountProductTypeToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "User selected pay later preliminary assessment type: %@", buf, 0xCu);
  }

  -[PKPayLaterSetupViewController setupController](self, "setupController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D68BD0];
  v12 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportAnalyticsEvent:", v9);

  -[PKPayLaterSetupViewController setupController](self, "setupController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSelectedPreliminaryAssessment:", v5);

  -[PKPayLaterProductOptionsViewController _loadNextViewController](self, "_loadNextViewController");
}

- (void)_loadNextViewController
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", 1);
  objc_initWeak(&location, self);
  -[PKPayLaterSetupViewController setupController](self, "setupController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__PKPayLaterProductOptionsViewController__loadNextViewController__block_invoke;
  v4[3] = &unk_1E3E62598;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "nextViewControllerFromState:parentViewController:completion:", 4, self, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __65__PKPayLaterProductOptionsViewController__loadNextViewController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(WeakRetained, "navigationController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __65__PKPayLaterProductOptionsViewController__loadNextViewController__block_invoke_2;
      v13[3] = &unk_1E3E62288;
      v13[4] = v8;
      objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v13);
    }
    else
    {
      if (!v6)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __65__PKPayLaterProductOptionsViewController__loadNextViewController__block_invoke_5;
        v11[3] = &unk_1E3E612E8;
        v11[4] = WeakRetained;
        objc_msgSend(WeakRetained, "dismissSetupFlowWithCompletion:", v11);
        goto LABEL_5;
      }
      PKAccountDisplayableError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __65__PKPayLaterProductOptionsViewController__loadNextViewController__block_invoke_3;
      v12[3] = &unk_1E3E612E8;
      v12[4] = v8;
      v9 = PKAlertForDisplayableErrorWithHandlers(v10, 0, v12, 0);

      if (v9)
        objc_msgSend(v8, "presentViewController:animated:completion:", v9, 1, 0);
    }

  }
LABEL_5:

}

uint64_t __65__PKPayLaterProductOptionsViewController__loadNextViewController__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
}

uint64_t __65__PKPayLaterProductOptionsViewController__loadNextViewController__block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__PKPayLaterProductOptionsViewController__loadNextViewController__block_invoke_4;
  v3[3] = &unk_1E3E612E8;
  v3[4] = v1;
  return objc_msgSend(v1, "dismissSetupFlowWithCompletion:", v3);
}

uint64_t __65__PKPayLaterProductOptionsViewController__loadNextViewController__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
}

uint64_t __65__PKPayLaterProductOptionsViewController__loadNextViewController__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
}

- (void)_selectedEligibleAssessment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  PKPayLaterProductOptionsSectionController *sectionController;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PKPayLaterSetupViewController setupController](self, "setupController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "financingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assessmentCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "eligibleProductAssessments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preliminaryAssessment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[PKPayLaterProductOptionsViewController productOptionsSectionController:didSelectPreliminaryAssessment:](self, "productOptionsSectionController:didSelectPreliminaryAssessment:", self->_sectionController, v8);
    }
    else
    {
      objc_msgSend(v7, "financingOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11 == 1)
      {
        sectionController = self->_sectionController;
        objc_msgSend(v7, "financingOptions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterProductOptionsViewController productOptionsSectionController:didSelectFinancingOption:](self, "productOptionsSectionController:didSelectFinancingOption:", sectionController, v14);

      }
      else
      {
        PKLogFacilityTypeGetObject();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412290;
          v19 = v7;
          _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "Error: There is no preliminaryAssessment or financingOption to select %@", (uint8_t *)&v18, 0xCu);
        }

        PKAccountDisplayableError();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = PKAlertForDisplayableErrorWithHandlers(v16, 0, 0, 0);

        if (v17)
          -[PKPayLaterProductOptionsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);

      }
    }

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "There are no eligible pay later assessments to display to the user %@", (uint8_t *)&v18, 0xCu);
    }

    -[PKPayLaterSetupViewController doneButtonTapped](self, "doneButtonTapped");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionController, 0);
}

@end
