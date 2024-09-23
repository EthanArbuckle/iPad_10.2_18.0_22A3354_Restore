@implementation PKCreditActivityCell

- (PKCreditActivityCell)initWithFrame:(CGRect)a3
{
  PKCreditActivityCell *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCreditActivityCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v3->_isCompactUI = PKUIGetMinScreenWidthType() == 0;
    -[PKCreditActivityCell _createSubviews](v3, "_createSubviews");
  }
  return v3;
}

- (void)_createSubviews
{
  UILabel *v3;
  UILabel *labelTitle;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  UILabel *labelRewardsSummary;
  PKSpendingSummaryChartView *v9;
  PKSpendingSummaryChartView *v10;
  PKSpendingSummaryChartView *chartView;
  id v12;

  -[PKCreditActivityCell contentView](self, "contentView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  labelTitle = self->_labelTitle;
  self->_labelTitle = v3;

  -[UILabel setNumberOfLines:](self->_labelTitle, "setNumberOfLines:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_labelTitle, "setAdjustsFontSizeToFitWidth:", 1);
  v5 = self->_labelTitle;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v5, "setTextColor:", v6);

  -[UILabel setAccessibilityIdentifier:](self->_labelTitle, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  objc_msgSend(v12, "addSubview:", self->_labelTitle);
  v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  labelRewardsSummary = self->_labelRewardsSummary;
  self->_labelRewardsSummary = v7;

  -[UILabel setNumberOfLines:](self->_labelRewardsSummary, "setNumberOfLines:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_labelRewardsSummary, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_labelRewardsSummary, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
  if (PKRewardsCenterEnabled())
    objc_msgSend(v12, "addSubview:", self->_labelRewardsSummary);
  v9 = [PKSpendingSummaryChartView alloc];
  v10 = -[PKSpendingSummaryChartView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  chartView = self->_chartView;
  self->_chartView = v10;

  -[PKSpendingSummaryChartView setShowLegendGraph:](self->_chartView, "setShowLegendGraph:", 0);
  -[PKSpendingSummaryChartView setShowPlaceholders:](self->_chartView, "setShowPlaceholders:", 1);
  -[PKSpendingSummaryChartView setShowLegendLabels:](self->_chartView, "setShowLegendLabels:", 0);
  objc_msgSend(v12, "addSubview:", self->_chartView);
  -[PKCreditActivityCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67840]);

}

- (void)setTitleFont:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel font](self->_labelTitle, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[UILabel setFont:](self->_labelTitle, "setFont:", v6);
    -[PKCreditActivityCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIFont)titleFont
{
  return -[UILabel font](self->_labelTitle, "font");
}

- (void)setRewardsSummaryFont:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel font](self->_labelRewardsSummary, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[UILabel setFont:](self->_labelRewardsSummary, "setFont:", v6);
    -[PKCreditActivityCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIFont)rewardsSummaryFont
{
  return -[UILabel font](self->_labelRewardsSummary, "font");
}

- (void)layoutSubviews
{
  int v3;
  _BOOL4 isCompactUI;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  UILabel *labelTitle;
  UILabel *labelRewardsSummary;
  PKSpendingSummaryChartView *chartView;
  CGRect v21;
  CGRect slice;
  objc_super v23;
  CGRect v24;
  CGRect v25;

  v23.receiver = self;
  v23.super_class = (Class)PKCreditActivityCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v23, sel_layoutSubviews);
  v3 = PKRewardsCenterEnabled();
  isCompactUI = self->_isCompactUI;
  -[PKCreditActivityCell bounds](self, "bounds");
  v9 = 12.0;
  if (isCompactUI)
    v9 = 8.0;
  v10 = v9 + v5;
  v11 = v6 + 8.0;
  v12 = 16.0;
  if (!isCompactUI)
    v12 = 24.0;
  v13 = v7 - v12;
  v14 = v8 + -16.0;
  -[PKCreditActivityCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  memset(&slice, 0, sizeof(slice));
  v21.size.width = v13;
  v21.size.height = v14;
  -[UILabel sizeThatFits:](self->_labelTitle, "sizeThatFits:", v13, v14, *(_QWORD *)&v10, *(_QWORD *)&v11);
  v16 = 2.0;
  if (!v3)
    v16 = 5.0;
  v17 = v16 + v15;
  v24.origin.x = v10;
  v24.origin.y = v11;
  v24.size.width = v13;
  v24.size.height = v14;
  CGRectDivide(v24, &slice, &v21, v17, CGRectMinYEdge);
  labelTitle = self->_labelTitle;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UILabel setFrame:](labelTitle, "setFrame:");
  if (v3)
  {
    -[UILabel sizeThatFits:](self->_labelRewardsSummary, "sizeThatFits:", v21.size.width, v21.size.height);
    v25 = v21;
    CGRectDivide(v21, &slice, &v21, v25.origin.y + 5.0, CGRectMinYEdge);
    labelRewardsSummary = self->_labelRewardsSummary;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](labelRewardsSummary, "setFrame:");
  }
  if (self->_useAccessibilityLayout)
    PKFloatRoundToPixel();
  chartView = self->_chartView;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[PKSpendingSummaryChartView setFrame:](chartView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = PKRewardsCenterEnabled();
  v7 = width + -24.0;
  if (self->_useAccessibilityLayout)
  {
    PKFloatRoundToPixel();
    v7 = v8;
  }
  -[UILabel sizeThatFits:](self->_labelTitle, "sizeThatFits:", width + -24.0, height);
  v10 = 2.0;
  if (!v6)
    v10 = 5.0;
  v11 = v10 + v9 + 16.0;
  if (v6)
  {
    -[UILabel sizeThatFits:](self->_labelRewardsSummary, "sizeThatFits:", width + -24.0, height);
    v11 = v11 + v12 + 5.0;
  }
  -[PKSpendingSummaryChartView sizeThatFits:](self->_chartView, "sizeThatFits:", v7, height);
  v14 = v11 + v13;
  v15 = width;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)setTitle:(id)a3
{
  id v5;
  NSString *title;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  title = self->_title;
  v9 = (NSString *)v5;
  v7 = title;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9 && v7)
    {
      v8 = -[NSString isEqualToString:](v9, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_title, a3);
    -[UILabel setText:](self->_labelTitle, "setText:", self->_title);
    -[PKCreditActivityCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setRewardsSummary:(id)a3
{
  id v5;
  NSString *rewardsSummary;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  rewardsSummary = self->_rewardsSummary;
  v9 = (NSString *)v5;
  v7 = rewardsSummary;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9 && v7)
    {
      v8 = -[NSString isEqualToString:](v9, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_rewardsSummary, a3);
    -[UILabel setText:](self->_labelRewardsSummary, "setText:", self->_rewardsSummary);
    -[PKCreditActivityCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setRewardsSummaryTextColor:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel textColor](self->_labelRewardsSummary, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
    -[UILabel setTextColor:](self->_labelRewardsSummary, "setTextColor:", v6);

}

- (UIColor)rewardsSummaryTextColor
{
  return -[UILabel textColor](self->_labelRewardsSummary, "textColor");
}

- (PKDashboardCreditAccountItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)rewardsSummary
{
  return self->_rewardsSummary;
}

- (PKSpendingSummaryChartView)chartView
{
  return self->_chartView;
}

- (BOOL)useAccessibilityLayout
{
  return self->_useAccessibilityLayout;
}

- (void)setUseAccessibilityLayout:(BOOL)a3
{
  self->_useAccessibilityLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chartView, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_rewardsSummary, 0);
  objc_storeStrong((id *)&self->_labelRewardsSummary, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_labelTitle, 0);
}

@end
