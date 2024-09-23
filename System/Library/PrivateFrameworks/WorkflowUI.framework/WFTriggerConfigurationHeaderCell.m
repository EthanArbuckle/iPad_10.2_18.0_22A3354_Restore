@implementation WFTriggerConfigurationHeaderCell

- (WFTriggerConfigurationHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFTriggerConfigurationHeaderCell *v4;
  UIImageView *v5;
  UIImageView *triggerIconView;
  void *v7;
  UILabel *v8;
  UILabel *triggerTitleLabel;
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
  double v22;
  WFTriggerConfigurationHeaderCell *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;
  _QWORD v43[8];

  v43[6] = *MEMORY[0x24BDAC8D0];
  v42.receiver = self;
  v42.super_class = (Class)WFTriggerConfigurationHeaderCell;
  v4 = -[WFTriggerConfigurationHeaderCell initWithStyle:reuseIdentifier:](&v42, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    triggerIconView = v4->_triggerIconView;
    v4->_triggerIconView = v5;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_triggerIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFTriggerConfigurationHeaderCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4->_triggerIconView);

    v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    triggerTitleLabel = v4->_triggerTitleLabel;
    v4->_triggerTitleLabel = v8;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_triggerTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_triggerTitleLabel, "setFont:", v10);

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_triggerTitleLabel, "setTextColor:", v11);

    -[UILabel setNumberOfLines:](v4->_triggerTitleLabel, "setNumberOfLines:", 1);
    -[WFTriggerConfigurationHeaderCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v4->_triggerTitleLabel);

    v31 = (void *)MEMORY[0x24BDD1628];
    -[UIImageView centerYAnchor](v4->_triggerIconView, "centerYAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationHeaderCell contentView](v4, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "centerYAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v38;
    -[UIImageView centerXAnchor](v4->_triggerIconView, "centerXAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationHeaderCell contentView](v4, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 26.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v34;
    -[UILabel leadingAnchor](v4->_triggerTitleLabel, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationHeaderCell contentView](v4, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v30, 52.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v29;
    -[UILabel trailingAnchor](v4->_triggerTitleLabel, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationHeaderCell contentView](v4, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, -8.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v25;
    -[UILabel topAnchor](v4->_triggerTitleLabel, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationHeaderCell contentView](v4, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, 14.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v43[4] = v16;
    -[UILabel bottomAnchor](v4->_triggerTitleLabel, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationHeaderCell contentView](v4, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, -14.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v43[5] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateConstraints:", v21);

    LODWORD(v22) = 1144766464;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v4->_triggerIconView, "setContentCompressionResistancePriority:forAxis:", 0, v22);
    -[WFTriggerConfigurationHeaderCell setAccessoryType:](v4, "setAccessoryType:", 1);
    -[WFTriggerConfigurationHeaderCell setSeparatorInset:](v4, "setSeparatorInset:", 0.0, 52.0, 0.0, 0.0);
    v23 = v4;
  }

  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFTriggerConfigurationHeaderCell;
  -[WFTriggerConfigurationHeaderCell prepareForReuse](&v3, sel_prepareForReuse);
  -[WFTriggerConfigurationHeaderCell setTriggerTypeClass:](self, "setTriggerTypeClass:", 0);
  -[WFTriggerConfigurationHeaderCell setTrigger:](self, "setTrigger:", 0);
}

- (void)configureWithImage:(id)a3 tintColor:(id)a4 title:(id)a5 numberOfLines:(int64_t)a6 withTrigger:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  id v29;

  v29 = a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[WFTriggerConfigurationHeaderCell triggerTitleLabel](self, "triggerTitleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v12);

  -[WFTriggerConfigurationHeaderCell triggerIconView](self, "triggerIconView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setImage:", v14);

  -[WFTriggerConfigurationHeaderCell triggerIconView](self, "triggerIconView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTintColor:", v13);

  objc_msgSend(v29, "displayGlyphCornerRadius");
  v19 = v18;
  -[WFTriggerConfigurationHeaderCell triggerIconView](self, "triggerIconView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19 <= 0.0)
  {
    objc_msgSend(v20, "setClipsToBounds:", 0);

    -[WFTriggerConfigurationHeaderCell triggerIconView](self, "triggerIconView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = 0.0;
  }
  else
  {
    objc_msgSend(v20, "setClipsToBounds:", 1);

    objc_msgSend(v29, "displayGlyphCornerRadius");
    v23 = v22;
    -[WFTriggerConfigurationHeaderCell triggerIconView](self, "triggerIconView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = v23;
  }
  objc_msgSend(v25, "setCornerRadius:", v27);

  -[WFTriggerConfigurationHeaderCell triggerTitleLabel](self, "triggerTitleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setNumberOfLines:", a6);

  -[WFTriggerConfigurationHeaderCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTriggerTypeClass:(Class)a3
{
  id v4;

  objc_storeStrong((id *)&self->_triggerTypeClass, a3);
  v4 = (id)objc_opt_new();
  -[WFTriggerConfigurationHeaderCell setTrigger:](self, "setTrigger:", v4);

}

- (void)setTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_trigger, a3);
  -[WFTriggerConfigurationHeaderCell updateUI](self, "updateUI");
}

- (void)updateUI
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
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  -[WFTriggerConfigurationHeaderCell trigger](self, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFTriggerConfigurationHeaderCell trigger](self, "trigger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedDisplayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationHeaderCell triggerTitleLabel](self, "triggerTitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

    -[WFTriggerConfigurationHeaderCell trigger](self, "trigger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayGlyph");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "platformImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationHeaderCell triggerIconView](self, "triggerIconView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v9);

    -[WFTriggerConfigurationHeaderCell trigger](self, "trigger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayGlyphCornerRadius");
    v13 = v12;

    -[WFTriggerConfigurationHeaderCell triggerIconView](self, "triggerIconView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13 <= 0.0)
    {
      objc_msgSend(v14, "setClipsToBounds:", 0);

      -[WFTriggerConfigurationHeaderCell triggerIconView](self, "triggerIconView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "layer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setCornerRadius:", 0.0);
    }
    else
    {
      objc_msgSend(v14, "setClipsToBounds:", 1);

      -[WFTriggerConfigurationHeaderCell trigger](self, "trigger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "displayGlyphCornerRadius");
      v18 = v17;
      -[WFTriggerConfigurationHeaderCell triggerIconView](self, "triggerIconView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setCornerRadius:", v18);

    }
    -[WFTriggerConfigurationHeaderCell trigger](self, "trigger");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "displayGlyphTintColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UIColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationHeaderCell triggerIconView](self, "triggerIconView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTintColor:", v24);

  }
  else
  {
    -[WFTriggerConfigurationHeaderCell triggerTitleLabel](self, "triggerTitleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setText:", 0);

    -[WFTriggerConfigurationHeaderCell triggerIconView](self, "triggerIconView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setImage:", 0);

    -[WFTriggerConfigurationHeaderCell triggerIconView](self, "triggerIconView");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTintColor:", 0);
  }

}

- (WFTrigger)trigger
{
  return self->_trigger;
}

- (Class)triggerTypeClass
{
  return self->_triggerTypeClass;
}

- (UIImageView)triggerIconView
{
  return self->_triggerIconView;
}

- (UILabel)triggerTitleLabel
{
  return self->_triggerTitleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerTitleLabel, 0);
  objc_storeStrong((id *)&self->_triggerIconView, 0);
  objc_storeStrong((id *)&self->_triggerTypeClass, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
}

@end
