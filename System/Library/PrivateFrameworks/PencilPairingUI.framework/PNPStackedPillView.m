@implementation PNPStackedPillView

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PNPStackedPillView;
  -[PNPStackedPillView layoutSubviews](&v3, sel_layoutSubviews);
  -[UILabel setText:](self->_topLabel, "setText:", self->_topLabelString);
  -[UILabel setTextAlignment:](self->_topLabel, "setTextAlignment:", 1);
  -[UILabel setText:](self->_bottomLabel, "setText:", self->_bottomLabelString);
  -[UILabel setTextAlignment:](self->_bottomLabel, "setTextAlignment:", 1);
  -[UILabel setTextColor:](self->_bottomLabel, "setTextColor:", self->_bottomLabelColor);
}

- (CGSize)intrinsicContentSize
{
  UILabel *topLabel;
  double v4;
  double v5;
  double v6;
  UILabel *bottomLabel;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  topLabel = self->_topLabel;
  -[UILabel frame](topLabel, "frame");
  -[UILabel sizeThatFits:](topLabel, "sizeThatFits:", v4, 1.79769313e308);
  v6 = v5;
  bottomLabel = self->_bottomLabel;
  -[UILabel frame](bottomLabel, "frame");
  -[UILabel sizeThatFits:](bottomLabel, "sizeThatFits:", v8, 1.79769313e308);
  v10 = fmax(fmax(v6, v9) + 60.0, 188.0);
  v11 = 56.0;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setDeviceState:(id)a3
{
  objc_storeStrong((id *)&self->_deviceState, a3);
  -[PNPStackedPillView setNeedsLayout](self, "setNeedsLayout");
}

- (PNPDeviceState)deviceState
{
  return self->_deviceState;
}

- (PNPStackedPillView)initWithFrame:(CGRect)a3 topString:(id)a4 bottomString:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  NSString *v11;
  NSString *v12;
  PNPStackedPillView *v13;
  UILabel *v14;
  UILabel *topLabel;
  UILabel *v16;
  UILabel *bottomLabel;
  UIView *v18;
  UIView *contentAreaView;
  void *v20;
  void *v21;
  uint64_t v22;
  UIColor *bottomLabelColor;
  NSString *topLabelString;
  NSString *v25;
  NSString *bottomLabelString;
  objc_super v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = (NSString *)a4;
  v12 = (NSString *)a5;
  v28.receiver = self;
  v28.super_class = (Class)PNPStackedPillView;
  v13 = -[PNPStackedPillView initWithFrame:](&v28, sel_initWithFrame_, x, y, width, height);
  v14 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
  topLabel = v13->_topLabel;
  v13->_topLabel = v14;

  v16 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
  bottomLabel = v13->_bottomLabel;
  v13->_bottomLabel = v16;

  v18 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
  contentAreaView = v13->_contentAreaView;
  v13->_contentAreaView = v18;

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 13.0, *MEMORY[0x24BEBB5E8]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v13->_topLabel, "setFont:", v20);
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 12.0, *MEMORY[0x24BEBB600]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v13->_bottomLabel, "setFont:", v21);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v13->_topLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v13->_contentAreaView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v13->_bottomLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "defaultBottomLabelColor");
  v22 = objc_claimAutoreleasedReturnValue();
  bottomLabelColor = v13->_bottomLabelColor;
  v13->_bottomLabelColor = (UIColor *)v22;

  -[PNPStackedPillView addSubview:](v13, "addSubview:", v13->_contentAreaView);
  -[PNPStackedPillView addSubview:](v13, "addSubview:", v13->_topLabel);
  -[PNPStackedPillView addSubview:](v13, "addSubview:", v13->_bottomLabel);
  topLabelString = v13->_topLabelString;
  v13->_topLabelString = v11;
  v25 = v11;

  bottomLabelString = v13->_bottomLabelString;
  v13->_bottomLabelString = v12;

  -[PNPStackedPillView _configureConstraints](v13, "_configureConstraints");
  return v13;
}

- (void)_configureConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_contentAreaView, "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPStackedPillView leadingAnchor](self, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, 30.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v5);

  -[UIView trailingAnchor](self->_contentAreaView, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPStackedPillView trailingAnchor](self, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, -30.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v8);

  -[UIView centerYAnchor](self->_contentAreaView, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPStackedPillView centerYAnchor](self, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v11);

  -[UILabel leadingAnchor](self->_topLabel, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_contentAreaView, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v14);

  -[UILabel trailingAnchor](self->_topLabel, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_contentAreaView, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v17);

  -[UILabel topAnchor](self->_topLabel, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_contentAreaView, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v20);

  -[UILabel lastBaselineAnchor](self->_bottomLabel, "lastBaselineAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel lastBaselineAnchor](self->_topLabel, "lastBaselineAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 16.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v23);

  -[UILabel bottomAnchor](self->_bottomLabel, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_contentAreaView, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v26);

  -[UILabel centerXAnchor](self->_bottomLabel, "centerXAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel centerXAnchor](self->_topLabel, "centerXAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v29);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v30);
}

- (UIColor)bottomLabelColor
{
  return self->_bottomLabelColor;
}

- (void)setBottomLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLabelColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLabelColor, 0);
  objc_storeStrong((id *)&self->_bottomLabelString, 0);
  objc_storeStrong((id *)&self->_topLabelString, 0);
  objc_storeStrong((id *)&self->_bottomLabel, 0);
  objc_storeStrong((id *)&self->_topLabel, 0);
  objc_storeStrong((id *)&self->_contentAreaView, 0);
  objc_storeStrong((id *)&self->_deviceState, 0);
}

@end
