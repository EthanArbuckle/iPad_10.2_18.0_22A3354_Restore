@implementation PKSpendingSummaryPresenter

- (PKSpendingSummaryPresenter)init
{
  PKSpendingSummaryPresenter *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKSpendingSummaryPresenter;
  v2 = -[PKSpendingSummaryPresenter init](&v7, sel_init);
  if (v2)
  {
    PKPassKitUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("ArrowDown"), CFSTR("pdf"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("ArrowUp"), CFSTR("pdf"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v2->_needsSizing = 1;
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
  v3 = CFSTR("spendingPresenter");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  PKSpendingSummaryView *v11;
  PKSpendingSummaryView *v12;
  void *v13;

  v8 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("spendingPresenter"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hostedContentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = [PKSpendingSummaryView alloc];
    v12 = -[PKSpendingSummaryView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v9, "setHostedContentView:", v12);

  }
  objc_msgSend(v9, "hostedContentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSpendingSummaryPresenter _configureView:item:presentationStyle:](self, "_configureView:item:presentationStyle:", v13, v8, 0);

  return v9;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  objc_msgSend(v10, "hostedContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSpendingSummaryPresenter _configureView:item:presentationStyle:](self, "_configureView:item:presentationStyle:", v9, v8, 1);

}

- (void)swapSummaryInCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  objc_msgSend(v10, "hostedContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSpendingSummaryPresenter _configureView:item:presentationStyle:](self, "_configureView:item:presentationStyle:", v9, v8, 2);

}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKSpendingSummaryView *sampleView;
  PKSpendingSummaryView *v12;
  PKSpendingSummaryView *v13;
  PKSpendingSummaryView *v14;
  PKSpendingSummaryView *v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat width;
  CGFloat v21;
  CGFloat height;
  double v23;
  double v24;
  CGSize result;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_needsSizing)
  {
    sampleView = self->_sampleView;
    if (!sampleView)
    {
      v12 = [PKSpendingSummaryView alloc];
      v13 = -[PKSpendingSummaryView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v14 = self->_sampleView;
      self->_sampleView = v13;

      sampleView = self->_sampleView;
    }
    -[PKSpendingSummaryPresenter _configureView:item:presentationStyle:](self, "_configureView:item:presentationStyle:", sampleView, v8, 0);
    v15 = self->_sampleView;
    objc_msgSend(v9, "bounds");
    v17 = v16;
    +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
    -[PKSpendingSummaryView sizeThatFits:](v15, "sizeThatFits:", v17 + v18 * -2.0, 3.40282347e38);
    width = v19;
    height = v21;
    self->_summarySize.width = v19;
    self->_summarySize.height = v21;
  }
  else
  {
    width = self->_summarySize.width;
    height = self->_summarySize.height;
  }

  v23 = width;
  v24 = height;
  result.height = v24;
  result.width = v23;
  return result;
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v7;
  NSString *v8;
  NSString *v9;
  NSComparisonResult v10;
  PKSpendingSummaryView *v11;
  PKSpendingSummaryView *v12;
  PKSpendingSummaryView *sampleView;

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
      self->_needsSizing = 1;
      v11 = [PKSpendingSummaryView alloc];
      v12 = -[PKSpendingSummaryView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      sampleView = self->_sampleView;
      self->_sampleView = v12;

    }
  }
}

- (void)_configureView:(id)a3 item:(id)a4 presentationStyle:(unint64_t)a5
{
  id v7;
  id v8;

  if (a3)
  {
    v7 = a3;
    objc_msgSend(a4, "spendingSummary");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configureWithSummary:presentationStyle:", v8, a5);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleView, 0);
}

@end
