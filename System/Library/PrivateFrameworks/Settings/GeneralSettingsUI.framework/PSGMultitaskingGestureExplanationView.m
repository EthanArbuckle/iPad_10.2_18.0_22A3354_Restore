@implementation PSGMultitaskingGestureExplanationView

- (id)newRegionSampleLabelUnderlined
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BEBD708]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  PreferencesTableViewFooterFont();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  objc_msgSend(v4, "setTextColor:", self->_footerTextColor);
  objc_msgSend(v4, "setLineBreakMode:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v6);

  objc_msgSend(v4, "setNumberOfLines:", 0);
  -[PSGMultitaskingGestureExplanationView addSubview:](self, "addSubview:", v4);
  return v4;
}

- (PSGMultitaskingGestureExplanationView)initWithSpecifier:(id)a3
{
  PSGMultitaskingGestureExplanationView *v3;
  uint64_t v4;
  UIColor *footerTextColor;
  uint64_t i;
  uint64_t v7;
  UILabel *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PSGMultitaskingGestureExplanationView;
  v3 = -[PSGMultitaskingGestureExplanationView initWithFrame:](&v15, sel_initWithFrame_, a3, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v3)
  {
    PreferencesTableViewFooterColor();
    v4 = objc_claimAutoreleasedReturnValue();
    footerTextColor = v3->_footerTextColor;
    v3->_footerTextColor = (UIColor *)v4;

    for (i = 0; i != 4; ++i)
    {
      v7 = -[PSGMultitaskingGestureExplanationView newRegionSampleLabelUnderlined](v3, "newRegionSampleLabelUnderlined");
      v8 = v3->_labels[i];
      v3->_labels[i] = (UILabel *)v7;

    }
    PSG_LocalizedStringForGeneral(CFSTR("Use four or five fingers to:"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_labels[0], "setText:", v9);

    PSG_LocalizedStringForGeneral(CFSTR("Pinch to the Home Screen"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_labels[1], "setText:", v10);

    PSG_LocalizedStringForGeneral(CFSTR("Swipe up to reveal multitasking bar"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_labels[2], "setText:", v11);

    PSG_LocalizedStringForGeneral(CFSTR("Swipe left or right between apps"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_labels[3], "setText:", v12);

    v3->_sized = 0.0;
    -[PSGMultitaskingGestureExplanationView setNeedsLayout](v3, "setNeedsLayout");
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGMultitaskingGestureExplanationView setBackgroundColor:](v3, "setBackgroundColor:", v13);

  }
  return v3;
}

- (double)preferredHeightForWidth:(double)a3
{
  uint64_t v5;
  UILabel **labels;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;
  float v15;
  double v16;
  double v17;
  double result;

  if (self->_width == a3)
    return self->_sized;
  v5 = 0;
  self->_sized = 0.0;
  labels = self->_labels;
  do
  {
    -[UILabel frame](labels[v5], "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    PreferencesTableViewCellLeftPad();
    v14 = v13;
    PreferencesTableViewCellRightPad();
    -[UILabel setFrame:](labels[v5], "setFrame:", v8, v10, a3 - floorf(v14 + v15), v12);
    -[UILabel sizeToFit](labels[v5], "sizeToFit");
    -[UILabel bounds](labels[v5], "bounds");
    v17 = self->_sized + v16 + 1.0;
    self->_sized = v17;
    ++v5;
  }
  while (v5 != 4);
  result = v17 + 10.0;
  self->_sized = result;
  return result;
}

- (BOOL)isRTL
{
  void *v2;

  if ((isRTL_isSet & 1) == 0)
  {
    isRTL_isSet = 1;
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    isRTL_isRTL = objc_msgSend(v2, "userInterfaceLayoutDirection") == 1;

  }
  return isRTL_isRTL;
}

- (void)layoutSubviews
{
  _BOOL4 v3;
  double v4;
  float v5;
  uint64_t v6;
  UILabel **labels;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  float v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  double v25;
  CGRect v26;
  CGRect v27;

  v3 = -[PSGMultitaskingGestureExplanationView isRTL](self, "isRTL");
  -[PSGMultitaskingGestureExplanationView bounds](self, "bounds");
  v5 = v4;
  -[PSGMultitaskingGestureExplanationView preferredHeightForWidth:](self, "preferredHeightForWidth:", v5);
  v6 = 0;
  labels = self->_labels;
  v8 = 5.0;
  v9 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  do
  {
    -[UILabel frame](labels[v6], "frame");
    v13 = v12;
    v15 = v14;
    PreferencesTableViewCellLeftPad();
    v17 = v16;
    if (v3)
    {
      -[PSGMultitaskingGestureExplanationView frame](self, "frame");
      v19 = v18 - v17 - v13;
    }
    else
    {
      v19 = v16;
    }
    v26.origin.x = v9;
    v26.origin.y = v8;
    v26.size.width = v10;
    v26.size.height = v11;
    v8 = CGRectGetMaxY(v26) + 1.0;
    -[UILabel setFrame:](labels[v6++], "setFrame:", v19, v8, v13, v15);
    v9 = v19;
    v10 = v13;
    v11 = v15;
  }
  while (v6 != 4);
  -[PSGUnderlineButton frame](self->_videoLinkButton, "frame");
  v21 = v20;
  v23 = v22;
  PreferencesTableViewCellLeftPad();
  v25 = v24;
  v27.origin.x = v19;
  v27.origin.y = v8;
  v27.size.width = v13;
  v27.size.height = v15;
  -[PSGUnderlineButton setFrame:](self->_videoLinkButton, "setFrame:", v25, CGRectGetMaxY(v27) + 1.0, v21, v23);
}

- (id)_accessibilityLabels
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", self->_labels[0], self->_labels[1], self->_labels[2], self->_labels[3], 0);
}

- (void).cxx_destruct
{
  UILabel **labels;
  uint64_t i;

  objc_storeStrong((id *)&self->_footerTextColor, 0);
  objc_storeStrong((id *)&self->_videoLinkButton, 0);
  labels = self->_labels;
  for (i = 3; i != -1; --i)
    objc_storeStrong((id *)&labels[i], 0);
}

@end
