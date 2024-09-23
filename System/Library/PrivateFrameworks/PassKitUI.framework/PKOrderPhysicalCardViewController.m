@implementation PKOrderPhysicalCardViewController

- (PKOrderPhysicalCardViewController)initWithController:(id)a3
{
  id v5;
  PKOrderPhysicalCardViewController *v6;
  uint64_t v7;
  NSString *nameOnCard;
  uint64_t v9;
  PKPhysicalCardArtworkOption *artworkOption;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKOrderPhysicalCardViewController;
  v6 = -[PKExplanationViewController init](&v12, sel_init);
  if (v6)
  {
    v6->_context = objc_msgSend(v5, "paymentSetupContext");
    objc_storeStrong((id *)&v6->_controller, a3);
    v6->_featureIdentifier = objc_msgSend(v5, "featureIdentifier");
    objc_msgSend(v5, "nameOnCard");
    v7 = objc_claimAutoreleasedReturnValue();
    nameOnCard = v6->_nameOnCard;
    v6->_nameOnCard = (NSString *)v7;

    objc_msgSend(v5, "selectedArtworkOption");
    v9 = objc_claimAutoreleasedReturnValue();
    artworkOption = v6->_artworkOption;
    v6->_artworkOption = (PKPhysicalCardArtworkOption *)v9;

    v6->_unavailableToOrder = -[PKPhysicalCardArtworkOption optionUnavailable](v6->_artworkOption, "optionUnavailable");
  }

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  PKOrderPhysicalCardHeroView *v5;
  PKOrderPhysicalCardHeroView *physicalCardHeroView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *titleOverride;
  NSString *v16;
  NSString *bodyOverride;
  NSString *v18;
  NSString *primaryButtonTitleOverride;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *secondaryButtonTitleOverride;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)PKOrderPhysicalCardViewController;
  -[PKExplanationViewController viewDidLoad](&v29, sel_viewDidLoad);
  -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 0);
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  -[PKOrderPhysicalCardViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidesBackButton:animated:", 1, 0);

  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setShowPrivacyView:", 0);
  objc_msgSend(v4, "setForceShowSetupLaterButton:", 1);
  objc_msgSend(v4, "setTitleHyphenationFactor:", 0.1);
  objc_msgSend(v4, "setImageIgnoresTopSafeArea:", 1);
  v5 = objc_alloc_init(PKOrderPhysicalCardHeroView);
  physicalCardHeroView = self->_physicalCardHeroView;
  self->_physicalCardHeroView = v5;

  -[PKOrderPhysicalCardHeroView artworkView](self->_physicalCardHeroView, "artworkView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKOrderPhysicalCardController nameOnCard](self->_controller, "nameOnCard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNameOnCard:", v8);

  v9 = (void *)MEMORY[0x1E0DC3870];
  -[PKPhysicalCardArtworkOption frontFaceImage](self->_artworkOption, "frontFaceImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithPKImage:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setArtworkImage:", v11);

  objc_msgSend(v4, "setHeroView:", self->_physicalCardHeroView);
  if (self->_unavailableToOrder)
  {
    PKLocalizedFeatureString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    PKLocalizedFeatureString();
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  titleOverride = self->_titleOverride;
  if (titleOverride)
  {
    v16 = titleOverride;
  }
  else
  {
    PKLocalizedFeatureString();
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v16;
  bodyOverride = self->_bodyOverride;
  if (bodyOverride)
  {
    v18 = bodyOverride;
  }
  else
  {
    PKLocalizedFeatureString();
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v18;
  primaryButtonTitleOverride = self->_primaryButtonTitleOverride;
  if (!primaryButtonTitleOverride)
    goto LABEL_3;
  v14 = primaryButtonTitleOverride;
LABEL_12:
  v20 = v14;
  objc_msgSend(v4, "setTitleText:", v12);
  objc_msgSend(v4, "setBodyText:", v13);
  objc_msgSend(v4, "dockView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "primaryButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTitle:forState:", v20, 0);

  objc_msgSend(v4, "dockView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "footerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setSkipCardButton:", 0);
  objc_msgSend(v24, "setManualEntryButton:", 0);
  objc_msgSend(v24, "setForceShowSetupLaterButton:", !self->_unavailableToOrder);
  if (!self->_unavailableToOrder)
  {
    objc_msgSend(v24, "setupLaterButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    secondaryButtonTitleOverride = self->_secondaryButtonTitleOverride;
    if (secondaryButtonTitleOverride)
    {
      objc_msgSend(v25, "setTitle:forState:", secondaryButtonTitleOverride, 0);
    }
    else
    {
      PKLocalizedFeatureString();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTitle:forState:", v28, 0);

    }
  }

}

- (void)explanationViewDidSelectContinue:(id)a3
{
  PKOrderPhysicalCardAddressConfirmationViewController *v4;
  id WeakRetained;
  void *v6;
  _QWORD v7[5];

  if (self->_unavailableToOrder)
  {
    -[PKOrderPhysicalCardViewController _handleNextStep](self, "_handleNextStep", a3);
  }
  else
  {
    v4 = -[PKOrderPhysicalCardAddressConfirmationViewController initWithOrderPhysicalCardController:]([PKOrderPhysicalCardAddressConfirmationViewController alloc], "initWithOrderPhysicalCardController:", self->_controller);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[PKOrderPhysicalCardAddressConfirmationViewController setDelegate:](v4, "setDelegate:", WeakRetained);

    -[PKOrderPhysicalCardViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__PKOrderPhysicalCardViewController_explanationViewDidSelectContinue___block_invoke;
    v7[3] = &unk_1E3E62288;
    v7[4] = self;
    objc_msgSend(v6, "pk_presentPaymentSetupViewController:animated:completion:", v4, 1, v7);

  }
}

uint64_t __70__PKOrderPhysicalCardViewController_explanationViewDidSelectContinue___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "_handleNextStep");
  return result;
}

- (void)_handleNextStep
{
  PKOrderPhysicalCardController *controller;
  _QWORD v4[5];

  -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
  controller = self->_controller;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__PKOrderPhysicalCardViewController__handleNextStep__block_invoke;
  v4[3] = &unk_1E3E62260;
  v4[4] = self;
  -[PKOrderPhysicalCardController nextViewControllerWithCompletion:](controller, "nextViewControllerWithCompletion:", v4);
}

void __52__PKOrderPhysicalCardViewController__handleNextStep__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "pk_paymentSetupSetHideSetupLaterButton:", 1);
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__PKOrderPhysicalCardViewController__handleNextStep__block_invoke_2;
    v6[3] = &unk_1E3E62288;
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "pk_presentPaymentSetupViewController:animated:completion:", v4, 1, v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_terminateSetupFlow");
  }

}

uint64_t __52__PKOrderPhysicalCardViewController__handleNextStep__block_invoke_2(uint64_t a1, char a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 0);
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_terminateSetupFlow");
  return result;
}

- (void)_terminateSetupFlow
{
  id WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKOrderPhysicalCardViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  PKPhysicalCardArtworkOption *artworkOption;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  artworkOption = self->_artworkOption;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__PKOrderPhysicalCardViewController_preflightWithCompletion___block_invoke;
  v8[3] = &unk_1E3E62328;
  v9 = v4;
  v6 = v4;
  v7 = -[PKPhysicalCardArtworkOption artworkImage:](artworkOption, "artworkImage:", v8);

}

void __61__PKOrderPhysicalCardViewController_preflightWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__PKOrderPhysicalCardViewController_preflightWithCompletion___block_invoke_2;
    block[3] = &unk_1E3E61590;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __61__PKOrderPhysicalCardViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (PKPaymentSetupViewControllerDelegate)delegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)titleOverride
{
  return self->_titleOverride;
}

- (void)setTitleOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (NSString)bodyOverride
{
  return self->_bodyOverride;
}

- (void)setBodyOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (NSString)primaryButtonTitleOverride
{
  return self->_primaryButtonTitleOverride;
}

- (void)setPrimaryButtonTitleOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1112);
}

- (NSString)secondaryButtonTitleOverride
{
  return self->_secondaryButtonTitleOverride;
}

- (void)setSecondaryButtonTitleOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButtonTitleOverride, 0);
  objc_storeStrong((id *)&self->_primaryButtonTitleOverride, 0);
  objc_storeStrong((id *)&self->_bodyOverride, 0);
  objc_storeStrong((id *)&self->_titleOverride, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_physicalCardHeroView, 0);
  objc_storeStrong((id *)&self->_artworkOption, 0);
  objc_storeStrong((id *)&self->_nameOnCard, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
