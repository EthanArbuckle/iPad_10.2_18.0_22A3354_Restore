@implementation WFTriggerTypeCell

- (WFTriggerTypeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFTriggerTypeCell *v4;
  UIImageView *v5;
  UIImageView *triggerIconView;
  void *v7;
  UILabel *v8;
  UILabel *triggerTitleLabel;
  void *v10;
  void *v11;
  void *v12;
  UILabel *v13;
  UILabel *triggerDescriptionLabel;
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
  WFTriggerTypeCell *v27;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  objc_super v55;
  _QWORD v56[11];

  v56[9] = *MEMORY[0x24BDAC8D0];
  v55.receiver = self;
  v55.super_class = (Class)WFTriggerTypeCell;
  v4 = -[WFTriggerTypeCell initWithStyle:reuseIdentifier:](&v55, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    triggerIconView = v4->_triggerIconView;
    v4->_triggerIconView = v5;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_triggerIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFTriggerTypeCell contentView](v4, "contentView");
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
    -[WFTriggerTypeCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v4->_triggerTitleLabel);

    v13 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    triggerDescriptionLabel = v4->_triggerDescriptionLabel;
    v4->_triggerDescriptionLabel = v13;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_triggerDescriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_triggerDescriptionLabel, "setFont:", v15);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_triggerDescriptionLabel, "setTextColor:", v16);

    -[UILabel setLineBreakMode:](v4->_triggerDescriptionLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](v4->_triggerDescriptionLabel, "setNumberOfLines:", 3);
    -[WFTriggerTypeCell contentView](v4, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v4->_triggerDescriptionLabel);

    v42 = (void *)MEMORY[0x24BDD1628];
    -[UIImageView centerYAnchor](v4->_triggerIconView, "centerYAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerTypeCell contentView](v4, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "centerYAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v51;
    -[UIImageView centerXAnchor](v4->_triggerIconView, "centerXAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerTypeCell contentView](v4, "contentView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, 26.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v47;
    -[UILabel leadingAnchor](v4->_triggerTitleLabel, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerTypeCell contentView](v4, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 52.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v56[2] = v43;
    -[UILabel trailingAnchor](v4->_triggerTitleLabel, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerTypeCell contentView](v4, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, -8.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v56[3] = v38;
    -[UILabel leadingAnchor](v4->_triggerDescriptionLabel, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v4->_triggerTitleLabel, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v56[4] = v35;
    -[UILabel trailingAnchor](v4->_triggerDescriptionLabel, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v4->_triggerTitleLabel, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v56[5] = v32;
    -[UILabel topAnchor](v4->_triggerTitleLabel, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerTypeCell contentView](v4, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 10.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v56[6] = v18;
    -[UILabel topAnchor](v4->_triggerDescriptionLabel, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v4->_triggerTitleLabel, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 4.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v56[7] = v21;
    -[UILabel bottomAnchor](v4->_triggerDescriptionLabel, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerTypeCell contentView](v4, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, -12.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v56[8] = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "activateConstraints:", v26);

    -[WFTriggerTypeCell setAccessoryType:](v4, "setAccessoryType:", 1);
    -[WFTriggerTypeCell setSeparatorInset:](v4, "setSeparatorInset:", 0.0, 52.0, 0.0, 0.0);
    v27 = v4;
  }

  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFTriggerTypeCell;
  -[WFTriggerTypeCell prepareForReuse](&v3, sel_prepareForReuse);
  -[WFTriggerTypeCell setTriggerTypeClass:](self, "setTriggerTypeClass:", 0);
  -[WFTriggerTypeCell setTrigger:](self, "setTrigger:", 0);
}

- (void)setTriggerTypeClass:(Class)a3
{
  id v4;

  objc_storeStrong((id *)&self->_triggerTypeClass, a3);
  v4 = (id)objc_opt_new();
  -[WFTriggerTypeCell setTrigger:](self, "setTrigger:", v4);

}

- (void)setTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_trigger, a3);
  -[WFTriggerTypeCell updateUI](self, "updateUI");
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
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  -[WFTriggerTypeCell trigger](self, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFTriggerTypeCell trigger](self, "trigger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedDisplayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerTypeCell triggerTitleLabel](self, "triggerTitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

    -[WFTriggerTypeCell trigger](self, "trigger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedDisplayExplanation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerTypeCell triggerDescriptionLabel](self, "triggerDescriptionLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    -[WFTriggerTypeCell trigger](self, "trigger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayGlyph");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "platformImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerTypeCell triggerIconView](self, "triggerIconView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setImage:", v12);

    -[WFTriggerTypeCell trigger](self, "trigger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayGlyphCornerRadius");
    v16 = v15;

    -[WFTriggerTypeCell triggerIconView](self, "triggerIconView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16 <= 0.0)
    {
      objc_msgSend(v17, "setClipsToBounds:", 0);
    }
    else
    {
      objc_msgSend(v17, "setClipsToBounds:", 1);

      -[WFTriggerTypeCell trigger](self, "trigger");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "displayGlyphCornerRadius");
      v20 = v19;
      -[WFTriggerTypeCell triggerIconView](self, "triggerIconView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCornerRadius:", v20);

    }
    -[WFTriggerTypeCell trigger](self, "trigger");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "displayGlyphTintColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UIColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerTypeCell triggerIconView](self, "triggerIconView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTintColor:", v26);

  }
  else
  {
    -[WFTriggerTypeCell triggerTitleLabel](self, "triggerTitleLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setText:", 0);

    -[WFTriggerTypeCell triggerDescriptionLabel](self, "triggerDescriptionLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setText:", 0);

    -[WFTriggerTypeCell triggerIconView](self, "triggerIconView");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setImage:", 0);
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

- (UILabel)triggerDescriptionLabel
{
  return self->_triggerDescriptionLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_triggerTitleLabel, 0);
  objc_storeStrong((id *)&self->_triggerIconView, 0);
  objc_storeStrong((id *)&self->_triggerTypeClass, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
}

@end
