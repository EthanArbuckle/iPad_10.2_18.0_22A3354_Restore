@implementation WGWidgetListEditViewTableHeaderView

- (WGWidgetListEditViewTableHeaderView)initWithReuseIdentifier:(id)a3 forTodayView:(BOOL)a4
{
  _BOOL4 v4;
  WGWidgetListEditViewTableHeaderView *v5;
  UILabel *v6;
  UILabel *headlineLabel;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  char v14;
  void *v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  UILabel *explanationLabel;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  char v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  UILabel *v28;
  void *v29;
  objc_super v31;

  v4 = a4;
  v31.receiver = self;
  v31.super_class = (Class)WGWidgetListEditViewTableHeaderView;
  v5 = -[WGWidgetListEditViewTableHeaderView initWithReuseIdentifier:](&v31, sel_initWithReuseIdentifier_, a3);
  if (v5)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    headlineLabel = v5->_headlineLabel;
    v5->_headlineLabel = v6;

    -[UILabel setNumberOfLines:](v5->_headlineLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v5->_headlineLabel, "setTextAlignment:", 1);
    v8 = v5->_headlineLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "bsui_preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x24BDF7848], 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8, "setFont:", v9);

    v10 = v5->_headlineLabel;
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("WIDGETS_EDIT_TODAY_HEADLINE");
    }
    else
    {
      v14 = _os_feature_enabled_impl();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v14 & 1) != 0)
        v13 = CFSTR("WIDGETS_EDIT_HEADLINE_LEGACY");
      else
        v13 = CFSTR("WIDGETS_EDIT_HEADLINE");
    }
    objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_24D733868, CFSTR("Widgets"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v10, "setText:", v15);

    v16 = v5->_headlineLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "_labelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v16, "setTextColor:", v17);

    -[WGWidgetListEditViewTableHeaderView addSubview:](v5, "addSubview:", v5->_headlineLabel);
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    explanationLabel = v5->_explanationLabel;
    v5->_explanationLabel = v18;

    -[UILabel setNumberOfLines:](v5->_explanationLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v5->_explanationLabel, "setTextAlignment:", 1);
    v20 = v5->_explanationLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "bsui_preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x24BDF77B0], 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v20, "setFont:", v21);

    v22 = v5->_explanationLabel;
    if (v4)
    {
      v23 = _os_feature_enabled_impl();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if ((v23 & 1) != 0)
        v26 = CFSTR("WIDGETS_EDIT_TODAY_EXPLANATION_LEGACY");
      else
        v26 = CFSTR("WIDGETS_EDIT_TODAY_EXPLANATION");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v26 = CFSTR("WIDGETS_EDIT_EXPLANATION");
    }
    objc_msgSend(v24, "localizedStringForKey:value:table:", v26, &stru_24D733868, CFSTR("Widgets"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v22, "setText:", v27);

    v28 = v5->_explanationLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "_labelColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v28, "setTextColor:", v29);

    -[WGWidgetListEditViewTableHeaderView addSubview:](v5, "addSubview:", v5->_explanationLabel);
  }
  return v5;
}

- (WGWidgetListEditViewTableHeaderView)initWithReuseIdentifier:(id)a3
{
  return -[WGWidgetListEditViewTableHeaderView initWithReuseIdentifier:forTodayView:](self, "initWithReuseIdentifier:forTodayView:", a3, 0);
}

- (double)contentMinY
{
  UILabel *headlineLabel;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect v9;

  -[WGWidgetListEditViewTableHeaderView layoutIfNeeded](self, "layoutIfNeeded");
  headlineLabel = self->_headlineLabel;
  -[UILabel bounds](headlineLabel, "bounds");
  -[UILabel textRectForBounds:limitedToNumberOfLines:](headlineLabel, "textRectForBounds:limitedToNumberOfLines:", -[UILabel numberOfLines](self->_headlineLabel, "numberOfLines"), v4, v5, v6, v7);
  -[WGWidgetListEditViewTableHeaderView convertRect:fromView:](self, "convertRect:fromView:", self->_headlineLabel);
  return CGRectGetMinY(v9);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double MaxY;
  double v10;
  CGSize result;
  CGRect v12;

  width = a3.width;
  -[WGWidgetListEditViewTableHeaderView _headlineLabelFrameForBoundsWidth:](self, "_headlineLabelFrameForBoundsWidth:", a3.width, a3.height);
  -[WGWidgetListEditViewTableHeaderView _explanationLabelFrameForBoundsWidth:withHeadlineLabelFrame:](self, "_explanationLabelFrameForBoundsWidth:withHeadlineLabelFrame:", width, v5, v6, v7, v8);
  MaxY = CGRectGetMaxY(v12);
  v10 = width;
  result.height = MaxY;
  result.width = v10;
  return result;
}

- (CGRect)_headlineLabelFrameForBoundsWidth:(double)a3
{
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = a3 + -60.0;
  -[UILabel sizeThatFits:](self->_headlineLabel, "sizeThatFits:", a3 + -60.0, 1.79769313e308);
  -[UILabel setFrame:](self->_headlineLabel, "setFrame:", 30.0, v4, v5, v6);
  -[UILabel font](self->_headlineLabel, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_scaledValueForValue:", 43.0);
  -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_headlineLabel, "_firstLineBaselineOffsetFromBoundsTop");

  _WGMainScreenScale();
  UIRectIntegralWithScale();
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)_explanationLabelFrameForBoundsWidth:(double)a3 withHeadlineLabelFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  UILabel *headlineLabel;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat x;
  CGFloat y;
  double v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  x = a4.origin.x;
  y = a4.origin.y;
  v37 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v7 = a3 + -60.0;
  -[UILabel sizeThatFits:](self->_explanationLabel, "sizeThatFits:", a3 + -60.0, 1.79769313e308);
  v9 = v8;
  -[UILabel font](self->_explanationLabel, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_scaledValueForValue:", 27.0);
  v12 = v11;
  -[UILabel font](self->_explanationLabel, "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descender");
  v15 = v9 + v12 + v14;

  headlineLabel = self->_headlineLabel;
  BSRectWithSize();
  -[UILabel textRectForBounds:limitedToNumberOfLines:](headlineLabel, "textRectForBounds:limitedToNumberOfLines:", -[UILabel numberOfLines](self->_headlineLabel, "numberOfLines"), v17, v18, v19, v20);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  CGRectGetMaxY(v38);
  v39.origin.x = v22;
  v39.origin.y = v24;
  v39.size.width = v26;
  v39.size.height = v28;
  CGRectGetMaxY(v39);
  v40.origin.x = v22;
  v40.origin.y = v24;
  v40.size.width = v26;
  v40.size.height = v28;
  CGRectGetHeight(v40);
  -[UILabel font](self->_explanationLabel, "font");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "descender");

  -[UILabel setFrame:](self->_explanationLabel, "setFrame:", 30.0, v37, v7, v15);
  -[UILabel font](self->_explanationLabel, "font");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_scaledValueForValue:", 26.0);
  -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_explanationLabel, "_firstLineBaselineOffsetFromBoundsTop");

  _WGMainScreenScale();
  UIRectIntegralWithScale();
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)WGWidgetListEditViewTableHeaderView;
  -[WGWidgetListEditViewTableHeaderView layoutSubviews](&v15, sel_layoutSubviews);
  -[WGWidgetListEditViewTableHeaderView bounds](self, "bounds");
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  -[WGWidgetListEditViewTableHeaderView _headlineLabelFrameForBoundsWidth:](self, "_headlineLabelFrameForBoundsWidth:", CGRectGetWidth(v16));
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[UILabel setFrame:](self->_headlineLabel, "setFrame:");
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  -[WGWidgetListEditViewTableHeaderView _explanationLabelFrameForBoundsWidth:withHeadlineLabelFrame:](self, "_explanationLabelFrameForBoundsWidth:withHeadlineLabelFrame:", CGRectGetWidth(v17), v8, v10, v12, v14);
  -[UILabel setFrame:](self->_explanationLabel, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanationLabel, 0);
  objc_storeStrong((id *)&self->_headlineLabel, 0);
}

@end
