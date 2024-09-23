@implementation PKPayLaterFinancingPlanInStoreReturnSectionController

- (PKPayLaterFinancingPlanInStoreReturnSectionController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 delegate:(id)a5
{
  id v9;
  PKPayLaterFinancingPlanInStoreReturnSectionController *v10;
  PKPayLaterFinancingPlanInStoreReturnSectionController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  PKPayLaterFinancingPlanInStoreReturnSectionController *v17;
  id v18;
  id v19;
  uint64_t v20;
  NSDictionary *sectionIcons;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, uint64_t);
  void *v26;
  id v27;
  id v28;
  PKPayLaterFinancingPlanInStoreReturnSectionController *v29;
  objc_super v30;
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKPayLaterFinancingPlanInStoreReturnSectionController;
  v10 = -[PKPayLaterSectionController initWithPayLaterAccount:dynamicContentPage:viewControllerDelegate:](&v30, sel_initWithPayLaterAccount_dynamicContentPage_viewControllerDelegate_, a4, 0, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_financingPlan, a3);
    v31[0] = CFSTR("kTappingPaymentMethodSection");
    v31[1] = CFSTR("kPANSection");
    v32[0] = CFSTR("wave.3.right.circle.fill");
    v32[1] = CFSTR("creditcard.and.123");
    v31[2] = CFSTR("kStoreCreditSection");
    v32[2] = CFSTR("giftcard");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0DC3888];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B48], (void *)*MEMORY[0x1E0DC4918], 2, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configurationWithFont:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __104__PKPayLaterFinancingPlanInStoreReturnSectionController_initWithFinancingPlan_payLaterAccount_delegate___block_invoke;
    v26 = &unk_1E3E614C8;
    v27 = v15;
    v28 = v16;
    v17 = v11;
    v29 = v17;
    v18 = v16;
    v19 = v15;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", &v23);
    v20 = objc_msgSend(v18, "copy", v23, v24, v25, v26);
    sectionIcons = v17->_sectionIcons;
    v17->_sectionIcons = (NSDictionary *)v20;

  }
  return v11;
}

void __104__PKPayLaterFinancingPlanInStoreReturnSectionController_initWithFinancingPlan_payLaterAccount_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0DC3870];
  v6 = a2;
  objc_msgSend(v5, "systemImageNamed:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithConfiguration:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithTintColor:renderingMode:", v9, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "safelySetObject:forKey:", v11, v6);
  objc_msgSend(v11, "size");
  *(double *)(*(_QWORD *)(a1 + 48) + 104) = fmax(v10, *(double *)(*(_QWORD *)(a1 + 48) + 104));

}

- (id)identifiers
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("kLearnMoreSection");
  v3[1] = CFSTR("kTappingPaymentMethodSection");
  v3[2] = CFSTR("kPANSection");
  v3[3] = CFSTR("kStoreCreditSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __CFString *v16;
  __CFString *v17;
  double v18;
  char v19;
  __CFString *v20;
  __CFString *v21;
  int v22;
  objc_super v24;

  v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PKPayLaterFinancingPlanInStoreReturnSectionController;
  -[PKPayLaterSectionController layoutWithLayoutEnvironment:sectionIdentifier:](&v24, sel_layoutWithLayoutEnvironment_sectionIdentifier_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (__CFString *)v6;
  v17 = v16;
  v18 = 16.0;
  if (v16 != CFSTR("kLearnMoreSection"))
  {
    if (v16)
    {
      v19 = objc_msgSend(CFSTR("kLearnMoreSection"), "isEqualToString:", v16);

      if ((v19 & 1) == 0)
      {
        v20 = v17;
        if (v20 == CFSTR("kTappingPaymentMethodSection")
          || (v21 = v20,
              v22 = objc_msgSend(CFSTR("kTappingPaymentMethodSection"), "isEqualToString:", v20),
              v21,
              v18 = v9,
              v22))
        {
          v18 = 32.0;
        }
      }
    }
    else
    {
      v18 = v9;
    }
  }
  objc_msgSend(v7, "setContentInsets:", v18, v11, v13, v15);

  return v7;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  __CFString *v11;
  __CFString *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  int v16;
  __CFString *v17;
  __CFString *v18;
  int v19;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == CFSTR("kLearnMoreSection"))
    goto LABEL_4;
  if (v7)
  {
    v9 = objc_msgSend(CFSTR("kLearnMoreSection"), "isEqualToString:", v7);

    if (v9)
    {
LABEL_4:
      -[PKPayLaterFinancingPlanInStoreReturnSectionController _configureLearnMoreSection:](self, "_configureLearnMoreSection:", v6);
      goto LABEL_5;
    }
    v11 = v8;
    if (v11 == CFSTR("kTappingPaymentMethodSection")
      || (v12 = v11,
          v13 = objc_msgSend(CFSTR("kTappingPaymentMethodSection"), "isEqualToString:", v11),
          v12,
          v13))
    {
      -[PKPayLaterFinancingPlanInStoreReturnSectionController _configureTappingPaymentMethodSection:](self, "_configureTappingPaymentMethodSection:", v6);
    }
    else
    {
      v14 = v12;
      if (v14 == CFSTR("kPANSection")
        || (v15 = v14, v16 = objc_msgSend(CFSTR("kPANSection"), "isEqualToString:", v14), v15, v16))
      {
        -[PKPayLaterFinancingPlanInStoreReturnSectionController _configurePANSection:](self, "_configurePANSection:", v6);
      }
      else
      {
        v17 = v15;
        if (v17 == CFSTR("kStoreCreditSection")
          || (v18 = v17,
              v19 = objc_msgSend(CFSTR("kStoreCreditSection"), "isEqualToString:", v17),
              v18,
              v19))
        {
          -[PKPayLaterFinancingPlanInStoreReturnSectionController _configureStoreCreditSection:](self, "_configureStoreCreditSection:", v6);
        }
      }
    }
  }
LABEL_5:

  return v6;
}

- (void)_configureLearnMoreSection:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  PKPayLaterTitleDetailRow *v7;
  void *v8;
  PKPayLaterTitleDetailRow *v9;
  void *v10;
  PKPayLaterButtonRow *v11;
  void *v12;
  PKPayLaterButtonRow *v13;
  void *v14;
  _QWORD v15[5];

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = [PKPayLaterTitleDetailRow alloc];
  PKLocalizedCocoonString(CFSTR("IN_STORE_RETURN_CARD_LEARN_MORE_DETAIL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKPayLaterTitleDetailRow initWithTitle:detail:selectionHandler:](v7, "initWithTitle:detail:selectionHandler:", v8, 0, 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterTitleDetailRow setTitleColor:](v9, "setTitleColor:", v10);

  objc_msgSend(v6, "safelyAddObject:", v9);
  v11 = [PKPayLaterButtonRow alloc];
  PKLocalizedCocoonString(CFSTR("IN_STORE_RETURN_CARD_LEARN_MORE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__PKPayLaterFinancingPlanInStoreReturnSectionController__configureLearnMoreSection___block_invoke;
  v15[3] = &unk_1E3E612E8;
  v15[4] = self;
  v13 = -[PKPayLaterButtonRow initWithTitle:selectionHandler:](v11, "initWithTitle:selectionHandler:", v12, v15);

  objc_msgSend(v6, "safelyAddObject:", v13);
  v14 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v5, "appendItems:", v14);

}

void __84__PKPayLaterFinancingPlanInStoreReturnSectionController__configureLearnMoreSection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/ht212964?cid=mc-ols-applepay-article_ht212964-wallet_ui-12072021"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D68858];
  v8[0] = *MEMORY[0x1E0D68AA0];
  v8[1] = v4;
  v5 = *MEMORY[0x1E0D68DB0];
  v9[0] = *MEMORY[0x1E0D68B18];
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportAnalyticsEvent:", v6);

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "openSensitiveURL:withOptions:", v2, 0);

}

- (void)_configureTappingPaymentMethodSection:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v10 = objc_alloc_init(v4);
  PKLocalizedCocoonString(CFSTR("IN_STORE_RETURN_TAPPING_PAYMENT_METHOD_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCocoonString(CFSTR("IN_STORE_RETURN_TAPPING_PAYMENT_METHOD_DETAIL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanInStoreReturnSectionController _iconTitleDetailRowForSectionIdentifier:title:detail:](self, "_iconTitleDetailRowForSectionIdentifier:title:detail:", CFSTR("kTappingPaymentMethodSection"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safelyAddObject:", v8);

  v9 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v5, "appendItems:", v9);

}

- (void)_configurePANSection:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PKPayLaterTitleDetailRow *v12;
  void *v13;
  PKPayLaterTitleDetailRow *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v17 = objc_alloc_init(v4);
  PKLocalizedCocoonString(CFSTR("IN_STORE_RETURN_PAN_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCocoonString(CFSTR("IN_STORE_RETURN_PAN_DETAIL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanInStoreReturnSectionController _iconTitleDetailRowForSectionIdentifier:title:detail:](self, "_iconTitleDetailRowForSectionIdentifier:title:detail:", CFSTR("kPANSection"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "safelyAddObject:", v8);

  -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "panSuffix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    PKMaskedPaymentPAN();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  v12 = [PKPayLaterTitleDetailRow alloc];
  PKLocalizedCocoonString(CFSTR("IN_STORE_RETURN_CARD_NUMBER"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKPayLaterTitleDetailRow initWithTitle:detail:selectionHandler:](v12, "initWithTitle:detail:selectionHandler:", v13, v11, 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterTitleDetailRow setDetailColor:](v14, "setDetailColor:", v15);

  objc_msgSend(v17, "safelyAddObject:", v14);
  v16 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v5, "appendItems:", v16);

}

- (void)_configureStoreCreditSection:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v10 = objc_alloc_init(v4);
  PKLocalizedCocoonString(CFSTR("IN_STORE_RETURN_RECEIVED_STORE_CREDIT_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCocoonString(CFSTR("IN_STORE_RETURN_RECEIVED_STORE_CREDIT_DETAIL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanInStoreReturnSectionController _iconTitleDetailRowForSectionIdentifier:title:detail:](self, "_iconTitleDetailRowForSectionIdentifier:title:detail:", CFSTR("kStoreCreditSection"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safelyAddObject:", v8);

  v9 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v5, "appendItems:", v9);

}

- (id)_iconTitleDetailRowForSectionIdentifier:(id)a3 title:(id)a4 detail:(id)a5
{
  NSDictionary *sectionIcons;
  id v9;
  id v10;
  void *v11;
  PKPayLaterTileDetailIconRow *v12;
  void *v13;
  double maxIconWidth;
  double v15;

  sectionIcons = self->_sectionIcons;
  v9 = a5;
  v10 = a4;
  -[NSDictionary objectForKey:](sectionIcons, "objectForKey:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PKPayLaterTileDetailIconRow initWithTitle:detail:iconImage:]([PKPayLaterTileDetailIconRow alloc], "initWithTitle:detail:iconImage:", v10, v9, v11);

  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4918], 2, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterTileDetailIconRow setTitleFont:](v12, "setTitleFont:", v13);

  maxIconWidth = self->_maxIconWidth;
  objc_msgSend(v11, "size");
  -[PKPayLaterTileDetailIconRow setAdditionalIconPadding:](v12, "setAdditionalIconPadding:", fmax(maxIconWidth - v15, 0.0));

  return v12;
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (void)setFinancingPlan:(id)a3
{
  objc_storeStrong((id *)&self->_financingPlan, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIcons, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end
