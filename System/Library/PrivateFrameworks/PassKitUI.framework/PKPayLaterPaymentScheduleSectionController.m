@implementation PKPayLaterPaymentScheduleSectionController

- (PKPayLaterPaymentScheduleSectionController)initWithSetupFlowController:(id)a3 dynamicContentPage:(id)a4 selectedFinancingOption:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  PKPayLaterPaymentScheduleSectionController *v17;
  NSDateFormatter *v18;
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v20;
  void *v21;
  objc_super v23;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a4;
  objc_msgSend(v11, "financingController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "payLaterAccount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v23.receiver = self;
  v23.super_class = (Class)PKPayLaterPaymentScheduleSectionController;
  v17 = -[PKPayLaterSectionController initWithPayLaterAccount:dynamicContentPage:viewControllerDelegate:](&v23, sel_initWithPayLaterAccount_dynamicContentPage_viewControllerDelegate_, v16, v14, 0);

  if (v17)
  {
    objc_storeStrong((id *)&v17->_setupController, a3);
    objc_storeStrong((id *)&v17->_selectedFinancingOption, a5);
    objc_storeWeak((id *)&v17->_delegate, v13);
    v18 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v17->_dateFormatter;
    v17->_dateFormatter = v18;

    v20 = v17->_dateFormatter;
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v20, "setCalendar:", v21);

    -[NSDateFormatter setDateStyle:](v17->_dateFormatter, "setDateStyle:", 3);
    -[NSDateFormatter setTimeStyle:](v17->_dateFormatter, "setTimeStyle:", 0);
  }

  return v17;
}

- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  void *v11;
  double v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPayLaterPaymentScheduleSectionController;
  -[PKPayLaterSectionController listLayoutConfigurationWithLayoutEnvironment:sectionIdentifier:](&v14, sel_listLayoutConfigurationWithLayoutEnvironment_sectionIdentifier_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (__CFString *)v6;
  v9 = v8;
  if (v8 == CFSTR("kPaymentsSection")
    || v8
    && (v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("kPaymentsSection")), v9, v10))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39B8]), "initWithListAppearance:", 2);
    +[PKConnectedCollectionViewCell textInsetWithOuterRadius:](PKConnectedCollectionViewCell, "textInsetWithOuterRadius:", 12.0);
    objc_msgSend(v11, "setBottomSeparatorInsets:", 0.0, v12, 0.0, 0.0);
    objc_msgSend(v7, "setSeparatorConfiguration:", v11);

  }
  return v7;
}

- (void)didTapHyperLink:(id)a3
{
  PKPayLaterPaymentScheduleSectionControllerDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "didTapHyperLink:", v4);

}

- (void)configureCellForRegistration:(id)a3 item:(id)a4
{
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterPaymentScheduleSectionController;
  v5 = a3;
  -[PKPayLaterSectionController configureCellForRegistration:item:](&v6, sel_configureCellForRegistration_item_, v5, a4);
  PKPayLaterConfigureCollectionViewCellWithGreyBackgroundForCell(v5);

}

- (id)identifiers
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[PKPayLaterSectionController dynamicContentPage](self, "dynamicContentPage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v7[0] = CFSTR("kPaymentsSection");
    v7[1] = CFSTR("kTotalAmountSection");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v5;
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

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == CFSTR("kPaymentsSection"))
    goto LABEL_4;
  if (v7)
  {
    v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kPaymentsSection"));

    if (v9)
    {
LABEL_4:
      -[PKPayLaterPaymentScheduleSectionController _configurePaymentsSectionSnapshot:](self, "_configurePaymentsSectionSnapshot:", v6);
      goto LABEL_5;
    }
    v11 = v8;
    if (v11 == CFSTR("kTotalAmountSection")
      || (v12 = v11,
          v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("kTotalAmountSection")),
          v12,
          v13))
    {
      -[PKPayLaterPaymentScheduleSectionController _configureTotalAmountSection:](self, "_configureTotalAmountSection:", v6);
    }
  }
LABEL_5:

  return v6;
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 != CFSTR("kPaymentsSection"))
  {
    if (!v4)
      goto LABEL_6;
    v6 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("kPaymentsSection"));

    if (!v6)
      goto LABEL_6;
  }
  -[PKPayLaterSectionController dynamicContentPage](self, "dynamicContentPage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "productSectionForType:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "contentTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v9, "uppercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = *MEMORY[0x1E0DC1138];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AB8], (void *)*MEMORY[0x1E0DC4918], 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    v17[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v10, "initWithString:attributes:", v11, v14);

  }
  else
  {
LABEL_6:
    v15 = 0;
  }

  return v15;
}

- (void)_configurePaymentsSectionSnapshot:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0DC1350];
  v5 = *MEMORY[0x1E0DC4A88];
  v6 = a3;
  objc_msgSend(v4, "preferredFontForTextStyle:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointSize");
  objc_msgSend(v4, "systemFontOfSize:weight:");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPayLaterFinancingOption installments](self->_selectedFinancingOption, "installments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[PKPayLaterSectionController dynamicContentPage](self, "dynamicContentPage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPayLaterProgressRow progressRowsWithInstallmentCount:firstRowFont:dynamicContentPage:](PKPayLaterProgressRow, "progressRowsWithInstallmentCount:firstRowFont:dynamicContentPage:", v9, v13, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v6, "appendItems:", v12);

}

- (void)_configureTotalAmountSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  PKMultiKeyValueCellKeyValueSource *v14;
  void *v15;
  void *v16;
  PKMultiKeyValueCellKeyValueSource *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  PKMultiKeyValueRow *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPayLaterSectionController dynamicContentPage](self, "dynamicContentPage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v25 = v4;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v7, "rows");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = 0;
      do
      {
        objc_msgSend(v7, "rows");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = [PKMultiKeyValueCellKeyValueSource alloc];
        objc_msgSend(v13, "contentTitle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "contentDetailTrailing");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[PKMultiKeyValueCellKeyValueSource initWithTitle:subtitle:](v14, "initWithTitle:subtitle:", v15, v16);

        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMultiKeyValueCellKeyValueSource setSubtitleTextColor:](v17, "setSubtitleTextColor:", v18);

        -[PKMultiKeyValueCellKeyValueSource setBold:](v17, "setBold:", ++v11 == objc_msgSend(v6, "count"));
        objc_msgSend(v8, "addObject:", v17);

        objc_msgSend(v7, "rows");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

      }
      while (v11 < v20);
    }
    v21 = [PKMultiKeyValueRow alloc];
    v22 = (void *)objc_msgSend(v8, "copy");
    v23 = -[PKMultiKeyValueRow initKeyValueSources:](v21, "initKeyValueSources:", v22);

    v4 = v25;
    objc_msgSend(v25, "addObject:", v23);
    v24 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v26, "appendItems:", v24);

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_selectedFinancingOption, 0);
  objc_storeStrong((id *)&self->_setupController, 0);
}

@end
