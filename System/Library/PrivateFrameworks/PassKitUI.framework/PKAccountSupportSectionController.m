@implementation PKAccountSupportSectionController

- (PKAccountSupportSectionController)initWithAccount:(id)a3
{
  id v5;
  PKAccountSupportSectionController *v6;
  PKAccountSupportSectionController *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t, void *);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKAccountSupportSectionController;
  v6 = -[PKPaymentSetupListSectionController init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    objc_initWeak(&location, v7);
    v8 = (void *)MEMORY[0x1E0DC35C8];
    v9 = objc_opt_class();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __53__PKAccountSupportSectionController_initWithAccount___block_invoke;
    v15 = &unk_1E3E62748;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v8, "registrationWithCellClass:configurationHandler:", v9, &v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupListSectionController setCellRegistration:](v7, "setCellRegistration:", v10, v12, v13, v14, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __53__PKAccountSupportSectionController_initWithAccount___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;

  v9 = a2;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = (id)objc_msgSend(WeakRetained, "_decorateListCell:forRowItem:", v9, v6);

  }
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAccountSupportSectionController;
  -[PKPaymentSetupListSectionController layoutWithLayoutEnvironment:sectionIdentifier:](&v6, sel_layoutWithLayoutEnvironment_sectionIdentifier_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentInsets");
  objc_msgSend(v4, "setContentInsets:", 16.0);
  return v4;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v8[0] = self->_account;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendItems:", v6);

  return v5;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (id)_decorateListCell:(id)a3 forRowItem:(id)a4
{
  id v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "feature") == 5)
  {
    PKPassKitUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("SAVINGS_Icon"), CFSTR("pdf"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "savingsDetails");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountSummary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentBalance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currencyCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountMake();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    PKLocalizedFeatureString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v15);

    objc_msgSend(v7, "textProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AD0], (void *)*MEMORY[0x1E0DC4938], 2, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFont:", v17);

    if (v14)
    {
      objc_msgSend(v14, "formattedStringValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSecondaryText:", v19, v18);

      objc_msgSend(v7, "setTextToSecondaryTextVerticalPadding:", 4.0);
      objc_msgSend(v7, "secondaryTextProperties");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setColor:", v21);

      PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setFont:", v22);

    }
    v23 = PKUIScreenScale();
    PKUIImageFromPDF(v9, 45.0, 45.0, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v24);
    objc_msgSend(v7, "setImageToTextPadding:", 16.0);
    objc_msgSend(v7, "imageProperties");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCornerRadius:", 4.0);
    objc_msgSend(v25, "setAccessibilityIgnoresInvertColors:", 1);
    objc_msgSend(v7, "setDirectionalLayoutMargins:", 16.0, 0.0, 16.0, 0.0);
    objc_msgSend(v5, "setContentConfiguration:", v7);

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
