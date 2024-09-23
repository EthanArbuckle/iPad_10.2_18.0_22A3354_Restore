@implementation SearchUIHeroButtonsCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setCountMoreButtonTowardsMaxCount:", 0);
  objc_msgSend(v3, "setFlipsToVerticalAxisForAccessibilityContentSizes:", 1);
  -[SearchUICardSectionView rowModel](self, "rowModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "sectionType") == 3)
    v5 = 6;
  else
    v5 = 1;
  objc_msgSend(v3, "setDistribution:", v5);

  objc_msgSend(MEMORY[0x1E0DBDA50], "defaultLayoutMargins");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  if (TLKSnippetModernizationEnabled())
    v14 = v11;
  else
    v14 = v11 + -8.0;
  objc_msgSend(v3, "setLayoutMargins:", v7, v9, v14, v13);
  objc_msgSend(v3, "setLayoutMarginsRelativeArrangement:", 1);
  return v3;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SearchUIHeroButtonsCardSectionView;
  v4 = a3;
  -[SearchUICardSectionView updateWithRowModel:](&v11, sel_updateWithRowModel_, v4);
  -[SearchUICardSectionView section](self, "section", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "count");

  -[SearchUICardSectionView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionView section](self, "section");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "buttons");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateWithButtonItems:maxButtonItems:buttonItemViewType:rowModel:feedbackDelegate:", v9, 2, 2, v4, v10);

}

@end
