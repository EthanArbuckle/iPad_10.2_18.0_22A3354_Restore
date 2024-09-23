@implementation PSUIBadgeView

- (PSUIBadgeView)init
{
  PSUIBadgeView *v2;
  PSUIBadgeView *v3;
  UILabel *v4;
  UILabel *badgeLabel;
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
  double v21;
  void *v22;
  void *v23;
  void *v24;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)PSUIBadgeView;
  v2 = -[PSUIBadgeView init](&v48, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_fontSize = 9.2;
    v2->_cornerRadius = 2.0;
    v2->_minPadding = 3.5;
    v2->_baseline = 3.2;
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    badgeLabel = v3->_badgeLabel;
    v3->_badgeLabel = v4;

    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", v3->_fontSize);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scaledFontForFont:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "fontDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fontDescriptorWithSymbolicTraits:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v10, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_badgeLabel, "setFont:", v11);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_badgeLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v3->_badgeLabel, "setNumberOfLines:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_badgeLabel, "setTextColor:", v12);

    -[UILabel setTextAlignment:](v3->_badgeLabel, "setTextAlignment:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_badgeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUIBadgeView addSubview:](v3, "addSubview:", v3->_badgeLabel);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIBadgeView setBackgroundColor:](v3, "setBackgroundColor:", v13);

    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scaledValueForValue:", v3->_cornerRadius);
    v16 = v15;
    -[PSUIBadgeView layer](v3, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCornerRadius:", v16);

    -[PSUIBadgeView layer](v3, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMasksToBounds:", 1);

    -[PSUIBadgeView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v19) = 1148846080;
    -[PSUIBadgeView setContentCompressionResistancePriority:forAxis:](v3, "setContentCompressionResistancePriority:forAxis:", 0, v19);
    LODWORD(v20) = 1148846080;
    -[PSUIBadgeView setContentCompressionResistancePriority:forAxis:](v3, "setContentCompressionResistancePriority:forAxis:", 1, v20);
    LODWORD(v21) = 1148846080;
    -[PSUIBadgeView setContentHuggingPriority:forAxis:](v3, "setContentHuggingPriority:forAxis:", 0, v21);
    -[PSUIBadgeView widthAnchor](v3, "widthAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIBadgeView heightAnchor](v3, "heightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:multiplier:", v23, 1.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setActive:", 1);

    -[PSUIBadgeView widthAnchor](v3, "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "scaledValueForValue:", 13.0);
    objc_msgSend(v25, "constraintGreaterThanOrEqualToConstant:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);

    -[PSUIBadgeView heightAnchor](v3, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "scaledValueForValue:", 13.0);
    objc_msgSend(v28, "constraintGreaterThanOrEqualToConstant:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setActive:", 1);

    -[PSUIBadgeView topAnchor](v3, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](v3->_badgeLabel, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "scaledValueForValue:", v3->_minPadding);
    objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:constant:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setActive:", 1);

    -[PSUIBadgeView trailingAnchor](v3, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v3->_badgeLabel, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "scaledValueForValue:", v3->_minPadding);
    objc_msgSend(v35, "constraintGreaterThanOrEqualToAnchor:constant:", v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setActive:", 1);

    -[UILabel leadingAnchor](v3->_badgeLabel, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIBadgeView leadingAnchor](v3, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "scaledValueForValue:", v3->_minPadding);
    objc_msgSend(v39, "constraintGreaterThanOrEqualToAnchor:constant:", v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setActive:", 1);

    -[UILabel bottomAnchor](v3->_badgeLabel, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIBadgeView bottomAnchor](v3, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "scaledValueForValue:", v3->_baseline);
    objc_msgSend(v43, "constraintGreaterThanOrEqualToAnchor:constant:", v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setActive:", 1);

  }
  return v3;
}

- (NSString)text
{
  return -[UILabel text](self->_badgeLabel, "text");
}

- (void)setText:(id)a3
{
  -[UILabel setText:](self->_badgeLabel, "setText:", a3);
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[UILabel intrinsicContentSize](self->_badgeLabel, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scaledValueForValue:", self->_minPadding);
  v9 = v4 + v8 * 2.0;
  objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scaledValueForValue:", 13.0);
  v12 = v11;

  if (v6 < v12)
    v6 = v12;

  v13 = v9;
  v14 = v6;
  result.height = v14;
  result.width = v13;
  return result;
}

- (UILabel)badgeLabel
{
  return self->_badgeLabel;
}

- (void)setBadgeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_badgeLabel, a3);
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)minPadding
{
  return self->_minPadding;
}

- (void)setMinPadding:(double)a3
{
  self->_minPadding = a3;
}

- (double)baseline
{
  return self->_baseline;
}

- (void)setBaseline:(double)a3
{
  self->_baseline = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeLabel, 0);
}

@end
