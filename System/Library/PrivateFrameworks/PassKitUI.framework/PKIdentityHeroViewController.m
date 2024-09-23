@implementation PKIdentityHeroViewController

- (PKIdentityHeroViewController)initWithConfiguration:(id)a3
{
  id v5;
  PKIdentityHeroViewController *v6;
  PKIdentityHeroViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKIdentityHeroViewController;
  v6 = -[PKExplanationViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configuration, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  PKPaymentSetupHeroView *v9;
  void *v10;
  PKPaymentSetupHeroView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)PKIdentityHeroViewController;
  -[PKExplanationViewController viewDidLoad](&v21, sel_viewDidLoad);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D65190], "pk_privacyLinkForContext:", 64);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKIdentityHeroViewController addChildViewController:](self, "addChildViewController:", v4);
  objc_msgSend(v3, "setPrivacyLink:", v4);
  objc_msgSend(v3, "setShowPrivacyView:", 1);
  objc_msgSend(v4, "didMoveToParentViewController:", self);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setBodyDataDetectorTypes:", 0);
  -[PKIdentityHeroViewConfiguration title](self->_configuration, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v5);

  -[PKIdentityHeroViewConfiguration subtitle](self->_configuration, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v6);

  -[PKIdentityHeroViewConfiguration image](self->_configuration, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D67138]);
    v9 = [PKPaymentSetupHeroView alloc];
    v22[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKPaymentSetupHeroView initWithContext:heroImageController:heroImages:](v9, "initWithContext:heroImageController:heroImages:", 0, v8, v10);

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v3, "setHeroView:", v11);
  PKProvisioningSecondaryBackgroundColor();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTopBackgroundColor:", v12);

  objc_msgSend(v3, "dockView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "primaryButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKIdentityHeroViewConfiguration primaryButtonTitle](self->_configuration, "primaryButtonTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:forState:", v15, 0);

  objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel_primaryButtonClicked_, 64);
  -[PKIdentityHeroViewConfiguration secondaryButtonTitle](self->_configuration, "secondaryButtonTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v3, "dockView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "footerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "manualEntryButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKIdentityHeroViewConfiguration secondaryButtonTitle](self->_configuration, "secondaryButtonTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTitle:forState:", v20, 0);

    objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel_secondaryButtonClicked_, 64);
  }
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);

}

- (void)primaryButtonClicked:(id)a3
{
  void (**v3)(void);
  void (**v4)(void);

  v3 = (void (**)(void))_Block_copy(self->_primaryButtonClickedBlock);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }

}

- (void)secondaryButtonClicked:(id)a3
{
  void (**v3)(void);
  void (**v4)(void);

  v3 = (void (**)(void))_Block_copy(self->_secondaryButtonClickedBlock);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }

}

- (id)primaryButtonClickedBlock
{
  return self->_primaryButtonClickedBlock;
}

- (void)setPrimaryButtonClickedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (id)secondaryButtonClickedBlock
{
  return self->_secondaryButtonClickedBlock;
}

- (void)setSecondaryButtonClickedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_secondaryButtonClickedBlock, 0);
  objc_storeStrong(&self->_primaryButtonClickedBlock, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
