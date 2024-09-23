@implementation PKRewardsSummaryBarViewWrapper

- (PKRewardsSummaryBarViewWrapper)initWithBarView:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  PKRewardsSummaryBarViewWrapper *v9;
  PKRewardsSummaryBarViewWrapper *v10;
  id *p_barView;
  id v12;
  void *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKRewardsSummaryBarViewWrapper;
  v9 = -[PKRewardsSummaryBarViewWrapper init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    p_barView = (id *)&v9->_barView;
    objc_storeStrong((id *)&v9->_barView, a3);
    objc_msgSend(*p_barView, "setRoundBaselineCorners:", 1);
    objc_msgSend(*p_barView, "setUseSmallCornerRadius:", 0);
    objc_msgSend(*p_barView, "setShowPlaceholder:", 1);
    v12 = *p_barView;
    PKRewardsHubIncompleteProgressGrayColor();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPlaceholderColor:", v13);

    -[PKRewardsSummaryBarViewWrapper addSubview:](v10, "addSubview:", *p_barView);
    objc_storeStrong((id *)&v10->_configuration, a4);
  }

  return v10;
}

- (void)layoutSubviews
{
  double v3;
  double v4;

  -[PKRewardsSummaryBarViewWrapper bounds](self, "bounds");
  v4 = v3;
  -[PKSegmentedBarView setFrame:](self->_barView, "setFrame:");
  -[PKSegmentedBarView configureWithBarConfiguration:axis:maximumLength:barLength:synchronous:completion:](self->_barView, "configureWithBarConfiguration:axis:maximumLength:barLength:synchronous:completion:", self->_configuration, 0, 1, &__block_literal_global_136, v4, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_barView, 0);
}

@end
