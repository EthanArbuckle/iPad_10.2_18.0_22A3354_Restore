@implementation PKPayLaterMoreInformationViewController

- (PKPayLaterMoreInformationViewController)initWithSetupFlowController:(id)a3
{
  id v4;
  PKPayLaterMoreInformationViewController *v5;
  PKPayLaterMoreInformationSectionController *v6;
  void *v7;
  uint64_t v8;
  PKPayLaterMoreInformationSectionController *sectionController;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterMoreInformationViewController;
  v5 = -[PKPayLaterSetupViewController initWithSetupFlowController:dynamicContentPageType:](&v11, sel_initWithSetupFlowController_dynamicContentPageType_, v4, 9);
  if (v5)
  {
    v6 = [PKPayLaterMoreInformationSectionController alloc];
    -[PKPayLaterSetupViewController dynamicContentPage](v5, "dynamicContentPage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKPayLaterMoreInformationSectionController initWithSetupFlowController:dynamicContentPage:](v6, "initWithSetupFlowController:dynamicContentPage:", v4, v7);
    sectionController = v5->_sectionController;
    v5->_sectionController = (PKPayLaterMoreInformationSectionController *)v8;

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
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterMoreInformationViewController;
  -[PKPayLaterSetupViewController viewDidLoad](&v11, sel_viewDidLoad);
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
  -[PKPayLaterSetupViewController setRightBarButton:](self, "setRightBarButton:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterMoreInformationViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v7);

  v12[0] = self->_sectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v10, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterMoreInformationViewController;
  -[PKPayLaterSetupViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[PKPayLaterMoreInformationViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

}

- (void)nextButtonTapped
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterMoreInformationViewController;
  -[PKPayLaterSetupViewController nextButtonTapped](&v7, sel_nextButtonTapped);
  -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", 1);
  objc_initWeak(&location, self);
  -[PKPayLaterSetupViewController setupController](self, "setupController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__PKPayLaterMoreInformationViewController_nextButtonTapped__block_invoke;
  v4[3] = &unk_1E3E62598;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "nextViewControllerFromState:parentViewController:completion:", 2, self, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __59__PKPayLaterMoreInformationViewController_nextButtonTapped__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

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
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __59__PKPayLaterMoreInformationViewController_nextButtonTapped__block_invoke_2;
      v14[3] = &unk_1E3E62288;
      v14[4] = v8;
      objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v14);

    }
    else if (v6)
    {
      PKAccountDisplayableError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = PKAlertForDisplayableErrorWithHandlers(v10, 0, 0, 0);

      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __59__PKPayLaterMoreInformationViewController_nextButtonTapped__block_invoke_3;
      v13[3] = &unk_1E3E612E8;
      v13[4] = v8;
      objc_msgSend(v8, "presentViewController:animated:completion:", v11, 1, v13);

    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __59__PKPayLaterMoreInformationViewController_nextButtonTapped__block_invoke_4;
      v12[3] = &unk_1E3E612E8;
      v12[4] = WeakRetained;
      objc_msgSend(WeakRetained, "dismissSetupFlowWithCompletion:", v12);
    }
  }

}

uint64_t __59__PKPayLaterMoreInformationViewController_nextButtonTapped__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
}

uint64_t __59__PKPayLaterMoreInformationViewController_nextButtonTapped__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
}

uint64_t __59__PKPayLaterMoreInformationViewController_nextButtonTapped__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionController, 0);
}

@end
