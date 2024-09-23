@implementation STSegmentView

- (STSegmentView)initWithItem:(id)a3 useVibrancy:(BOOL)a4 truncateLabels:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v9;
  STSegmentView *v10;
  STSegmentView *v11;
  uint64_t v12;
  UILabel *titleLabel;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  UILabel *detailLabel;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
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
  id v45;
  void *v46;
  uint64_t v47;
  UIImageView *detailImageView;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  BOOL v62;
  double v63;
  uint64_t v64;
  NSLayoutConstraint *detailLabelLeadingConstraint;
  void *v66;
  uint64_t v67;
  NSLayoutConstraint *detailImageWidthConstraint;
  void *v69;
  uint64_t v70;
  NSLayoutConstraint *detailImageHeightConstraint;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  objc_super v82;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  v82.receiver = self;
  v82.super_class = (Class)STSegmentView;
  v10 = -[STSegmentView initWithFrame:](&v82, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_item, a3);
    v11->_useVibrancy = v6;
    v12 = objc_opt_new();
    titleLabel = v11->_titleLabel;
    v11->_titleLabel = (UILabel *)v12;

    v14 = *MEMORY[0x24BEBE220];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11->_titleLabel, "setFont:", v15);

    objc_msgSend(v9, "titleText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v11->_titleLabel, "setText:", v16);

    objc_msgSend(v9, "titleColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v11->_titleLabel, "setTextColor:", v17);
    v18 = v5;
    -[UILabel setNumberOfLines:](v11->_titleLabel, "setNumberOfLines:", v5);
    if (v5)
      v19 = 4;
    else
      v19 = 0;
    -[UILabel setLineBreakMode:](v11->_titleLabel, "setLineBreakMode:", v19);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v11->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v20) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v11->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v20);
    -[STSegmentView addSubview:](v11, "addSubview:", v11->_titleLabel);
    v21 = objc_opt_new();
    detailLabel = v11->_detailLabel;
    v11->_detailLabel = (UILabel *)v21;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11->_detailLabel, "setFont:", v23);

    objc_msgSend(v9, "detailText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v11->_detailLabel, "setText:", v24);

    objc_msgSend(v9, "accessibilityText");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAccessibilityLabel:](v11->_detailLabel, "setAccessibilityLabel:", v25);

    -[UILabel setNumberOfLines:](v11->_detailLabel, "setNumberOfLines:", v18);
    -[UILabel setLineBreakMode:](v11->_detailLabel, "setLineBreakMode:", v19);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v11->_detailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v26) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v11->_detailLabel, "setContentHuggingPriority:forAxis:", 1, v26);
    v27 = (void *)objc_opt_new();
    if (v6)
    {
      +[STUsageColors updateVibrancyStylingForView:withUsageColor:](STUsageColors, "updateVibrancyStylingForView:withUsageColor:", v11->_titleLabel, v17);
      objc_msgSend(MEMORY[0x24BEBDAF0], "widgetEffectForVibrancyStyle:", 101);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v28);
      objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[STSegmentView addSubview:](v11, "addSubview:", v29);
      objc_msgSend(v29, "contentView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addSubview:", v11->_detailLabel);
      objc_msgSend(MEMORY[0x24BDD1628], "st_constraintsForView:equalToView:", v30, v11->_detailLabel);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObjectsFromArray:", v31);

      v32 = 0.0;
    }
    else
    {
      -[STSegmentView addSubview:](v11, "addSubview:", v11->_detailLabel);
      v32 = 2.0;
    }
    -[UILabel topAnchor](v11->_titleLabel, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSegmentView topAnchor](v11, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v35);

    -[UILabel leadingAnchor](v11->_titleLabel, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSegmentView leadingAnchor](v11, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v38);

    -[UILabel trailingAnchor](v11->_titleLabel, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSegmentView trailingAnchor](v11, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v41);

    -[UILabel heightAnchor](v11->_titleLabel, "heightAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel heightAnchor](v11->_detailLabel, "heightAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v44);

    v45 = objc_alloc(MEMORY[0x24BEBD668]);
    objc_msgSend(v9, "detailImage");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "initWithImage:", v46);
    detailImageView = v11->_detailImageView;
    v11->_detailImageView = (UIImageView *)v47;

    -[UIImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:](v11->_detailImageView, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
    objc_msgSend(v9, "detailImageTintColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v11->_detailImageView, "setTintColor:", v49);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v11->_detailImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[STSegmentView addSubview:](v11, "addSubview:", v11->_detailImageView);
    -[UIImageView leadingAnchor](v11->_detailImageView, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSegmentView leadingAnchor](v11, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v52);

    -[UIImageView bottomAnchor](v11->_detailImageView, "bottomAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v11->_detailLabel, "lastBaselineAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v55);

    -[UIImageView sizeThatFits:](v11->_detailImageView, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    v57 = v56;
    v59 = v58;
    -[UILabel leadingAnchor](v11->_detailLabel, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v11->_detailImageView, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v59 == *(double *)(MEMORY[0x24BDBF148] + 8) && v57 == *MEMORY[0x24BDBF148];
    v63 = 2.0;
    if (v62)
      v63 = 0.0;
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v61, v63);
    v64 = objc_claimAutoreleasedReturnValue();
    detailLabelLeadingConstraint = v11->_detailLabelLeadingConstraint;
    v11->_detailLabelLeadingConstraint = (NSLayoutConstraint *)v64;

    objc_msgSend(v27, "addObject:", v11->_detailLabelLeadingConstraint);
    -[UIImageView widthAnchor](v11->_detailImageView, "widthAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToConstant:", v57);
    v67 = objc_claimAutoreleasedReturnValue();
    detailImageWidthConstraint = v11->_detailImageWidthConstraint;
    v11->_detailImageWidthConstraint = (NSLayoutConstraint *)v67;

    objc_msgSend(v27, "addObject:", v11->_detailImageWidthConstraint);
    -[UIImageView heightAnchor](v11->_detailImageView, "heightAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToConstant:", v59);
    v70 = objc_claimAutoreleasedReturnValue();
    detailImageHeightConstraint = v11->_detailImageHeightConstraint;
    v11->_detailImageHeightConstraint = (NSLayoutConstraint *)v70;

    objc_msgSend(v27, "addObject:", v11->_detailImageHeightConstraint);
    -[UILabel topAnchor](v11->_detailLabel, "topAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v11->_titleLabel, "bottomAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:constant:", v73, v32);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v74);

    -[UILabel bottomAnchor](v11->_detailLabel, "bottomAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSegmentView bottomAnchor](v11, "bottomAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v77);

    -[UILabel trailingAnchor](v11->_detailLabel, "trailingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSegmentView trailingAnchor](v11, "trailingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:", v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v80);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v27);
  }

  return v11;
}

- (void)setItem:(id)a3
{
  STSegmentItem *v5;
  STSegmentItem *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  STSegmentItem *v25;

  v5 = (STSegmentItem *)a3;
  v6 = v5;
  if (self->_item != v5)
  {
    v25 = v5;
    v7 = -[STSegmentItem isEqual:](v5, "isEqual:");
    v6 = v25;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_item, a3);
      -[STSegmentItem detailText](v25, "detailText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[STSegmentView detailLabel](self, "detailLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v8);

      -[STSegmentView titleLabel](self, "titleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[STSegmentItem titleText](v25, "titleText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v11);

      -[STSegmentItem titleColor](v25, "titleColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTextColor:", v12);

      -[STSegmentView detailImageView](self, "detailImageView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[STSegmentItem detailImage](v25, "detailImage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setImage:", v14);

      -[STSegmentItem detailImageTintColor](v25, "detailImageTintColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTintColor:", v15);

      objc_msgSend(v13, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      v17 = v16;
      v19 = v18;
      if (v18 == *(double *)(MEMORY[0x24BDBF148] + 8) && v16 == *MEMORY[0x24BDBF148])
        v21 = 0.0;
      else
        v21 = 2.0;
      -[STSegmentView detailLabelLeadingConstraint](self, "detailLabelLeadingConstraint");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setConstant:", v21);

      -[STSegmentView detailImageWidthConstraint](self, "detailImageWidthConstraint");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setConstant:", v17);

      -[STSegmentView detailImageHeightConstraint](self, "detailImageHeightConstraint");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setConstant:", v19);

      v6 = v25;
    }
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  _BOOL4 v19;
  double v20;
  double v21;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[STSegmentView titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;
  v10 = v9;

  -[STSegmentView detailLabel](self, "detailLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", width, height);
  v13 = v12;
  v15 = v14;

  -[STSegmentView detailImageView](self, "detailImageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sizeThatFits:", width, height);
  v18 = v17;

  v19 = -[STSegmentView useVibrancy](self, "useVibrancy");
  v20 = v10 + v15 + 2.0;
  if (v19)
    v20 = v10 + v15;
  v21 = v13 + v18 + 2.0;
  if (v8 >= v21)
    v21 = v8;
  result.height = v20;
  result.width = v21;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STSegmentView;
  -[STSegmentView traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  if (-[STSegmentView useVibrancy](self, "useVibrancy"))
  {
    if (!v4
      || (v5 = objc_msgSend(v4, "userInterfaceStyle"),
          -[STSegmentView traitCollection](self, "traitCollection"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "userInterfaceStyle"),
          v6,
          v5 != v7))
    {
      -[STSegmentView titleLabel](self, "titleLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[STSegmentView item](self, "item");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "titleColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[STUsageColors updateVibrancyStylingForView:withUsageColor:](STUsageColors, "updateVibrancyStylingForView:withUsageColor:", v8, v10);

    }
  }

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (NSLayoutConstraint)detailLabelLeadingConstraint
{
  return self->_detailLabelLeadingConstraint;
}

- (UIImageView)detailImageView
{
  return self->_detailImageView;
}

- (NSLayoutConstraint)detailImageWidthConstraint
{
  return self->_detailImageWidthConstraint;
}

- (NSLayoutConstraint)detailImageHeightConstraint
{
  return self->_detailImageHeightConstraint;
}

- (STSegmentItem)item
{
  return self->_item;
}

- (BOOL)useVibrancy
{
  return self->_useVibrancy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_detailImageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_detailImageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_detailImageView, 0);
  objc_storeStrong((id *)&self->_detailLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
