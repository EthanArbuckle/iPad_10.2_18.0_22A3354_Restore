@implementation PNPWizardScratchpadToast

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIVisualEffectView *background;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UILabel *label;
  void *v28;
  UILabel *v29;
  void *v30;
  id v31;

  -[PNPWizardScratchpadToast bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIVisualEffectView setFrame:](self->_background, "setFrame:");
  objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 1);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  background = self->_background;
  -[PNPWizardScratchpadToast traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "effectForUserInterfaceStyle:", objc_msgSend(v8, "userInterfaceStyle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setEffect:](background, "setEffect:", v9);

  if (v4 >= v6)
    v10 = v6;
  else
    v10 = v4;
  -[UIVisualEffectView _setContinuousCornerRadius:](self->_background, "_setContinuousCornerRadius:", v10 * 0.5);
  UIRectInset();
  -[PNPWizardScratchpadToast traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  UIRectIntegralWithScale();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[UILabel setFrame:](self->_label, "setFrame:", v13, v15, v17, v19);
  v20 = (void *)MEMORY[0x24BEBB520];
  v21 = *MEMORY[0x24BDF77D0];
  v22 = *MEMORY[0x24BDF7650];
  -[PNPWizardScratchpadToast traitCollection](self, "traitCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_preferredFontForTextStyle:maximumContentSizeCategory:compatibleWithTraitCollection:", v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v24, "pointSize");
  objc_msgSend(v25, "systemFontOfSize:weight:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setFont:](self->_label, "setFont:", v26);
  label = self->_label;
  -[PNPWizardScratchpadToast text](self, "text");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](label, "setText:", v28);

  v29 = self->_label;
  objc_msgSend(MEMORY[0x24BDF6950], "toastLabelTextColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v29, "setTextColor:", v30);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  BOOL v5;
  double v6;
  CGSize result;

  -[UILabel intrinsicContentSize](self->_label, "intrinsicContentSize");
  v4 = v2 + 20.0;
  if (v3 < 25.0)
    v3 = 25.0;
  v5 = v2 < 160.0;
  v6 = 180.0;
  if (!v5)
    v6 = v4;
  result.height = v3;
  result.width = v6;
  return result;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
  -[PNPWizardScratchpadToast setNeedsLayout](self, "setNeedsLayout");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PNPWizardScratchpadToast;
  v4 = a3;
  -[PNPWizardScratchpadToast traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[PNPWizardScratchpadToast traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    -[PNPWizardScratchpadToast setNeedsLayout](self, "setNeedsLayout");
    -[PNPWizardScratchpadToast layoutIfNeeded](self, "layoutIfNeeded");
  }

}

- (PNPWizardScratchpadToast)initWithFrame:(CGRect)a3
{
  PNPWizardScratchpadToast *v3;
  id v4;
  void *v5;
  uint64_t v6;
  UIVisualEffectView *background;
  UILabel *v8;
  UILabel *label;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)PNPWizardScratchpadToast;
  v3 = -[PNPWizardScratchpadToast initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = objc_alloc(MEMORY[0x24BDF6FC8]);
  objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "initWithEffect:", v5);
  background = v3->_background;
  v3->_background = (UIVisualEffectView *)v6;

  v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
  label = v3->_label;
  v3->_label = v8;

  -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](v3->_label, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel layer](v3->_label, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFilters:", v12);

  -[PNPWizardScratchpadToast addSubview:](v3, "addSubview:", v3->_background);
  -[PNPWizardScratchpadToast addSubview:](v3, "addSubview:", v3->_label);

  return v3;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_background, 0);
}

@end
