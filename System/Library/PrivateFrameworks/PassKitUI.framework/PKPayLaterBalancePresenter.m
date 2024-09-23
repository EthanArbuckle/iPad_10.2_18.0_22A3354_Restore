@implementation PKPayLaterBalancePresenter

- (PKPayLaterBalancePresenter)init
{
  PKPayLaterBalancePresenter *v2;
  PKDashboardContentHostCollectionViewCell *v3;
  uint64_t v4;
  PKDashboardContentHostCollectionViewCell *sampleCell;
  NSNumberFormatter *v6;
  NSNumberFormatter *numberFormatter;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterBalancePresenter;
  v2 = -[PKPayLaterBalancePresenter init](&v9, sel_init);
  if (v2)
  {
    v3 = [PKDashboardContentHostCollectionViewCell alloc];
    v4 = -[PKDashboardContentHostCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKDashboardContentHostCollectionViewCell *)v4;

    v6 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    numberFormatter = v2->_numberFormatter;
    v2->_numberFormatter = v6;

    -[NSNumberFormatter setNumberStyle:](v2->_numberFormatter, "setNumberStyle:", 1);
  }
  return v2;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("kPayLaterAccountCellIdentifier");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kPayLaterAccountCellIdentifier"), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterBalancePresenter _configureCell:item:collectionView:](self, "_configureCell:item:collectionView:", v10, v9, v8);

  return v10;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  PKDashboardContentHostCollectionViewCell *sampleCell;
  id v8;
  PKDashboardContentHostCollectionViewCell *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  sampleCell = self->_sampleCell;
  v8 = a4;
  -[PKPayLaterBalancePresenter _configureCell:item:collectionView:](self, "_configureCell:item:collectionView:", sampleCell, a3, v8);
  v9 = self->_sampleCell;
  objc_msgSend(v8, "bounds");
  v11 = v10;

  +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
  -[PKDashboardContentHostCollectionViewCell sizeThatFits:](v9, "sizeThatFits:", v11 + v12 * -2.0, 3.40282347e38);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v7;
  NSString *v8;
  NSString *v9;
  NSComparisonResult v10;
  PKDashboardContentHostCollectionViewCell *v11;
  PKDashboardContentHostCollectionViewCell *v12;
  PKDashboardContentHostCollectionViewCell *sampleCell;

  if (a3 && a4)
  {
    v7 = a4;
    objc_msgSend(a3, "preferredContentSizeCategory");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredContentSizeCategory");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

    v10 = UIContentSizeCategoryCompareToCategory(v8, v9);
    if (v10)
    {
      v11 = [PKDashboardContentHostCollectionViewCell alloc];
      v12 = -[PKDashboardContentHostCollectionViewCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      sampleCell = self->_sampleCell;
      self->_sampleCell = v12;

    }
  }
}

- (void)_configureCell:(id)a3 item:(id)a4 collectionView:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  PKFusedDoubleCellView *v12;
  PKFusedDoubleCellView *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      v9 = v14;
      objc_msgSend(v9, "hostedContentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
        v12 = v10;
      else
        v12 = objc_alloc_init(PKFusedDoubleCellView);
      v13 = v12;

      -[PKPayLaterBalancePresenter _configureView:item:](self, "_configureView:item:", v13, v8);
      objc_msgSend(v9, "setHostedContentView:", v13);

    }
  }

}

- (void)_configureView:(id)a3 item:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PKPayLaterBalancePresenter *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "payLaterAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dueNext30Days");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "payLaterDetails");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentBalance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "totalPending");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(v7, "payLaterDetails");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "currencyCode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        PKCurrencyAmountMake();
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }

    }
    v15 = v32;
    objc_msgSend(v15, "beginUpdates");
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], 0, 0x8000, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitleFont:", v16);

    PKLocalizedCocoonString(CFSTR("TOTAL_DUE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLeftTitle:", v17);

    objc_msgSend(v10, "formattedStringValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLeftDetail:", v18);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLeftDetailColor:", v19);

    objc_msgSend(v11, "amount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    if (objc_msgSend(v20, "pk_isPositiveNumber"))
    {
      objc_msgSend(v11, "formattedStringValue");
      v22 = v11;
      v23 = self;
      v24 = v7;
      v25 = v10;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedCocoonString(CFSTR("INSTALLMENT_PENDING_AMOUNT"), CFSTR("%@"), v26);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v25;
      v7 = v24;
      self = v23;
      v11 = v22;
    }

    objc_msgSend(v15, "setLeftSubDetail:", v21);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLeftSubDetailColor:", v27);

    -[NSNumberFormatter stringFromNumber:](self->_numberFormatter, "stringFromNumber:", &unk_1E3FAD330);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCocoonString(CFSTR("NEXT_30_DAYS"), CFSTR("%@"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRightTitle:", v29);

    objc_msgSend(v8, "formattedStringValue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRightDetail:", v30);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRightDetailColor:", v31);

    objc_msgSend(v15, "setRightSubDetail:", 0);
    objc_msgSend(v15, "endUpdates:", 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end
