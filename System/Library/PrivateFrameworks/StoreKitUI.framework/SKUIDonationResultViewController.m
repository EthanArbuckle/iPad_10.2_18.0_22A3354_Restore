@implementation SKUIDonationResultViewController

- (SKUIDonationResultViewController)initWithCharity:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  SKUIDonationResultViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDonationResultViewController initWithCharity:configuration:].cold.1();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIDonationResultViewController;
  v8 = -[SKUIDonationStepViewController initWithCharity:configuration:](&v13, sel_initWithCharity_configuration_, v6, v7);
  if (v8)
  {
    objc_msgSend(v7, "addObserver:", v8);
    objc_msgSend(v7, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "localizedStringForKey:", CFSTR("DONATION_CONFIRM_TITLE"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_CONFIRM_TITLE"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIDonationResultViewController setTitle:](v8, "setTitle:", v11);

  }
  return v8;
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  SKUIDonationResultView *resultView;
  SKUIDonationResultView *v8;
  SKUIDonationResultView *v9;
  SKUIDonationResultView *v10;
  void *v11;
  SKUIDonationResultView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SKUIDonationResultView *v17;
  void *v18;
  void *v19;
  void *v20;
  SKUIDonationResultView *v21;
  void *v22;
  id v23;

  -[SKUIDonationStepViewController donationConfiguration](self, "donationConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientContext");
  v23 = (id)objc_claimAutoreleasedReturnValue();

  -[SKUIDonationResultViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesBackButton:", 1);
  v5 = objc_alloc_init(MEMORY[0x1E0DC34F0]);
  objc_msgSend(v5, "setAction:", sel__doneButtonAction_);
  objc_msgSend(v5, "setStyle:", 2);
  objc_msgSend(v5, "setTarget:", self);
  if (v23)
    objc_msgSend(v23, "localizedStringForKey:", CFSTR("DONATION_CONFIRM_DONE"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_CONFIRM_DONE"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  objc_msgSend(v4, "setRightBarButtonItem:", v5);
  resultView = self->_resultView;
  if (!resultView)
  {
    v8 = objc_alloc_init(SKUIDonationResultView);
    v9 = self->_resultView;
    self->_resultView = v8;

    v10 = self->_resultView;
    objc_msgSend(MEMORY[0x1E0DC3658], "_systemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIDonationResultView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    v12 = self->_resultView;
    -[SKUIDonationStepViewController donationConfiguration](self, "donationConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIDonationStepViewController charity](self, "charity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logoImageForCharity:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIDonationResultView setImage:](v12, "setImage:", v15);

    if (v23)
      objc_msgSend(v23, "localizedStringForKey:", CFSTR("DONATION_CONFIRM_MESSAGE"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_CONFIRM_MESSAGE"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->_resultView;
    v18 = (void *)MEMORY[0x1E0CB3940];
    -[SKUIGiftAmount displayLabel](self->_donationAmount, "displayLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%@"), 0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIDonationResultView setMessage:](v17, "setMessage:", v20);

    v21 = self->_resultView;
    if (v23)
      objc_msgSend(v23, "localizedStringForKey:", CFSTR("DONATION_CONFIRM_THANKS"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_CONFIRM_THANKS"), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIDonationResultView setTitle:](v21, "setTitle:", v22);

    resultView = self->_resultView;
  }
  -[SKUIDonationResultViewController setView:](self, "setView:", resultView);

}

- (void)donationConfigurationController:(id)a3 didLoadLogoForCharity:(id)a4
{
  id v6;
  id v7;
  SKUIDonationResultView *resultView;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[SKUIDonationStepViewController charity](self, "charity");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    resultView = self->_resultView;
    objc_msgSend(v10, "logoImageForCharity:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIDonationResultView setImage:](resultView, "setImage:", v9);

  }
}

- (void)_doneButtonAction:(id)a3
{
  void *v4;
  id v5;

  -[SKUIDonationStepViewController donationViewController](self, "donationViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (SKUIGiftAmount)donationAmount
{
  return self->_donationAmount;
}

- (void)setDonationAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultView, 0);
  objc_storeStrong((id *)&self->_donationAmount, 0);
}

- (void)initWithCharity:configuration:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIDonationResultViewController initWithCharity:configuration:]";
}

@end
