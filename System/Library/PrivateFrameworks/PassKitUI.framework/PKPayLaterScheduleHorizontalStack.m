@implementation PKPayLaterScheduleHorizontalStack

- (PKPayLaterScheduleHorizontalStack)initWithLeadingText:(id)a3 trailingText:(id)a4 stackIndex:(unint64_t)a5
{
  id v9;
  id v10;
  PKPayLaterScheduleHorizontalStack *v11;
  PKPayLaterScheduleHorizontalStack *v12;
  NSMutableArray *v13;
  NSMutableArray *allViews;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterScheduleHorizontalStack;
  v11 = -[PKPayLaterScheduleHorizontalStack init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_leadingText, a3);
    objc_storeStrong((id *)&v12->_trailingText, a4);
    v12->_stackIndex = a5;
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    allViews = v12->_allViews;
    v12->_allViews = v13;

    -[PKPayLaterScheduleHorizontalStack _configureViews](v12, "_configureViews");
  }

  return v12;
}

- (id)allViews
{
  return (id)-[NSMutableArray copy](self->_allViews, "copy");
}

- (double)minimumLeadingLabelWidth
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0DC1138];
  -[UILabel font](self->_leadingLabel, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSString sizeWithAttributes:](self->_leadingText, "sizeWithAttributes:", v4);
  v6 = v5;

  return v6;
}

- (void)_configureViews
{
  UILabel *v3;
  UILabel *leadingLabel;
  UILabel *v5;
  UILabel *trailingLabel;
  unint64_t stackIndex;
  void *v8;
  void *v9;
  PKConnectedCircleView *v10;
  PKConnectedCircleView *circleView;
  id v12;

  -[NSMutableArray removeAllObjects](self->_allViews, "removeAllObjects");
  __52__PKPayLaterScheduleHorizontalStack__configureViews__block_invoke(self->_leadingText, 1);
  v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
  leadingLabel = self->_leadingLabel;
  self->_leadingLabel = v3;

  -[UILabel setAccessibilityIdentifier:](self->_leadingLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67CD8]);
  -[NSMutableArray safelyAddObject:](self->_allViews, "safelyAddObject:", self->_leadingLabel);
  __52__PKPayLaterScheduleHorizontalStack__configureViews__block_invoke(self->_trailingText, 0);
  v5 = (UILabel *)objc_claimAutoreleasedReturnValue();
  trailingLabel = self->_trailingLabel;
  self->_trailingLabel = v5;

  -[UILabel setAccessibilityIdentifier:](self->_trailingLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68128]);
  -[NSMutableArray safelyAddObject:](self->_allViews, "safelyAddObject:", self->_trailingLabel);
  stackIndex = self->_stackIndex;
  if (stackIndex == 2)
  {
    -[PKPayLaterScheduleHorizontalStack _greyGradientConnector](self, "_greyGradientConnector");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    PKPayLaterPaymentScheduleConnectedCircleEmptyView();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  else if (stackIndex == 1)
  {
    -[PKPayLaterScheduleHorizontalStack _greyGradientConnector](self, "_greyGradientConnector");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterScheduleHorizontalStack _greyGradientConnector](self, "_greyGradientConnector");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    PKPayLaterPaymentScheduleConnectedCircleEmptyView();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (stackIndex)
  {
    v12 = 0;
    v8 = 0;
    v9 = 0;
  }
  else
  {
    -[PKPayLaterScheduleHorizontalStack _greyGradientConnector](self, "_greyGradientConnector");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKPayLaterPaymentScheduleConnectedCircleTargetView();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
  }
  v10 = objc_alloc_init(PKConnectedCircleView);
  circleView = self->_circleView;
  self->_circleView = v10;

  -[PKConnectedCircleView setTopConnector:](self->_circleView, "setTopConnector:", v12);
  -[PKConnectedCircleView setBottomConnector:](self->_circleView, "setBottomConnector:", v8);
  -[PKConnectedCircleView setTargetView:](self->_circleView, "setTargetView:", v9);
  -[PKConnectedCircleView setNeedsDisplay](self->_circleView, "setNeedsDisplay");
  -[NSMutableArray safelyAddObject:](self->_allViews, "safelyAddObject:", self->_circleView);

}

id __52__PKPayLaterScheduleHorizontalStack__configureViews__block_invoke(void *a1, int a2)
{
  objc_class *v3;
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (a1)
  {
    v3 = (objc_class *)MEMORY[0x1E0DC3990];
    v4 = a1;
    v5 = objc_alloc_init(v3);
    v6 = objc_msgSend(v5, "_shouldReverseLayoutDirection");
    v7 = 2;
    if (v6)
      v8 = 2;
    else
      v8 = 0;
    if (v6)
      v7 = 0;
    if (a2)
      v9 = v8;
    else
      v9 = v7;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v10);

    objc_msgSend(v5, "setTextAlignment:", v9);
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], (NSString *)*MEMORY[0x1E0DC48D0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v11);

    objc_msgSend(v5, "setNumberOfLines:", 0);
    objc_msgSend(v5, "setText:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_greyGradientConnector
{
  PKGradientVerticalConnector *v2;
  void *v3;
  void *v4;
  PKGradientVerticalConnector *v5;

  v2 = [PKGradientVerticalConnector alloc];
  PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKGradientVerticalConnector initWithTopGradientColor:bottomGradientColor:](v2, "initWithTopGradientColor:bottomGradientColor:", v3, v4);

  return v5;
}

- (UILabel)leadingLabel
{
  return self->_leadingLabel;
}

- (void)setLeadingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_leadingLabel, a3);
}

- (UILabel)trailingLabel
{
  return self->_trailingLabel;
}

- (void)setTrailingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_trailingLabel, a3);
}

- (PKConnectedCircleView)circleView
{
  return self->_circleView;
}

- (void)setCircleView:(id)a3
{
  objc_storeStrong((id *)&self->_circleView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleView, 0);
  objc_storeStrong((id *)&self->_trailingLabel, 0);
  objc_storeStrong((id *)&self->_leadingLabel, 0);
  objc_storeStrong((id *)&self->_allViews, 0);
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_leadingText, 0);
}

@end
