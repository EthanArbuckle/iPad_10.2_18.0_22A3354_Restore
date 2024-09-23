@implementation _TVRUITabSelectorControlCell

- (_TVRUITabSelectorControlCell)initWithFrame:(CGRect)a3
{
  _TVRUITabSelectorControlCell *v3;
  _TVRUITabSelectorControlCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVRUITabSelectorControlCell;
  v3 = -[_TVRUITabSelectorControlCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_TVRUITabSelectorControlCell _configure](v3, "_configure");
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVRUITabSelectorControlCell;
  -[_TVRUITabSelectorControlCell prepareForReuse](&v4, sel_prepareForReuse);
  -[_TVRUITabSelectorControlCell label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_TVRUITabSelectorControlCell;
  -[_TVRUITabSelectorControlCell setSelected:](&v5, sel_setSelected_);
  -[_TVRUITabSelectorControlCell _updateForSelectedState:](self, "_updateForSelectedState:", v3);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVRUITabSelectorControlCell;
  -[_TVRUITabSelectorControlCell layoutSubviews](&v3, sel_layoutSubviews);
  -[_TVRUITabSelectorControlCell _configureBackgroundCornerRadius](self, "_configureBackgroundCornerRadius");
}

- (void)_configure
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UILabel *label;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _TVRUITabSelectorControlCell *v30;
  id v31;
  id v32;
  void *v33;
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v4, "setBackgroundColor:", v3);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.1, 1.0);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");
  v7 = v4;
  v33 = v4;
  objc_msgSend(v4, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderColor:", v6);

  -[_TVRUITabSelectorControlCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v7);
  v31 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v31, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBorderWidth:", 1.0);

  v32 = objc_retainAutorelease(v3);
  v10 = objc_msgSend(v32, "CGColor");
  objc_msgSend(v31, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBorderColor:", v10);

  v30 = self;
  -[_TVRUITabSelectorControlCell setBackgroundView:](self, "setBackgroundView:", v31);
  -[_TVRUITabSelectorControlCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](v13, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BEBE220], 1024);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v13, "setFont:", v14);

  -[UILabel setAdjustsFontForContentSizeCategory:](v13, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v12, "addSubview:", v13);
  v24 = (void *)MEMORY[0x24BDD1628];
  -[UILabel leadingAnchor](v13, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, 11.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v27;
  -[UILabel trailingAnchor](v13, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, -11.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v15;
  -[UILabel topAnchor](v13, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 5.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v18;
  -[UILabel bottomAnchor](v13, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -5.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activateConstraints:", v22);

  label = v30->_label;
  v30->_label = v13;

  -[_TVRUITabSelectorControlCell _updateForSelectedState:](v30, "_updateForSelectedState:", 0);
}

- (void)_configureBackgroundCornerRadius
{
  void *v3;
  id v4;

  -[_TVRUITabSelectorControlCell backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setContinuousCornerRadius:", 7.0);

  -[_TVRUITabSelectorControlCell selectedBackgroundView](self, "selectedBackgroundView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setContinuousCornerRadius:", 7.0);

}

- (void)_updateForSelectedState:(BOOL)a3
{
  void *v4;
  id v5;

  if (a3)
    objc_msgSend(MEMORY[0x24BEBD4B8], "darkTextColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_TVRUITabSelectorControlCell label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
