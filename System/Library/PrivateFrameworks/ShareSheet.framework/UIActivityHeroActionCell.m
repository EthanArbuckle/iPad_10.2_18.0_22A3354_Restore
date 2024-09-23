@implementation UIActivityHeroActionCell

- (UIActivityHeroActionCell)initWithFrame:(CGRect)a3
{
  UIActivityHeroActionCell *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  id v12;
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
  _QWORD v49[3];

  v49[2] = *MEMORY[0x1E0C80C00];
  v48.receiver = self;
  v48.super_class = (Class)UIActivityHeroActionCell;
  v3 = -[UIActivityActionCell initWithFrame:](&v48, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v5);

    objc_msgSend(v4, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v4, "setTextAlignment:", 1);
    objc_msgSend(v4, "setNumberOfLines:", 2);
    LODWORD(v6) = 1036831949;
    objc_msgSend(v4, "_setHyphenationFactor:", v6);
    LODWORD(v7) = 1144766464;
    objc_msgSend(v4, "setContentCompressionResistancePriority:forAxis:", 1, v7);
    -[UIActivityHeroActionCell setTitleLabel:](v3, "setTitleLabel:", v4);
    v8 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreferredSymbolConfiguration:", v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v10);

    objc_msgSend(v8, "setContentMode:", 4);
    LODWORD(v11) = 1144766464;
    objc_msgSend(v8, "setContentHuggingPriority:forAxis:", 1, v11);
    -[UIActivityHeroActionCell setActivityImageView:](v3, "setActivityImageView:", v8);
    v12 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    -[UIActivityHeroActionCell activityImageView](v3, "activityImageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v13;
    -[UIActivityHeroActionCell titleLabel](v3, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v12, "initWithArrangedSubviews:", v15);

    objc_msgSend(v16, "setAxis:", 1);
    objc_msgSend(v16, "setAlignment:", 0);
    objc_msgSend(v16, "setDistribution:", 0);
    objc_msgSend(v16, "setSpacing:", 10.0);
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityHeroActionCell setStackView:](v3, "setStackView:", v16);
    -[UIActivityHeroActionCell contentView](v3, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityHeroActionCell stackView](v3, "stackView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v18);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityHeroActionCell stackView](v3, "stackView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 18.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v23);

    -[UIActivityHeroActionCell stackView](v3, "stackView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 4.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v27);

    objc_msgSend(v17, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityHeroActionCell stackView](v3, "stackView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30, 4.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v31);

    objc_msgSend(v17, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityHeroActionCell stackView](v3, "stackView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "lastBaselineAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintGreaterThanOrEqualToAnchor:constant:", v34, 14.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v35);

    objc_msgSend(v17, "heightAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintGreaterThanOrEqualToConstant:", 80.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v37);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v19);
    objc_msgSend(v17, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityHeroActionCell stackView](v3, "stackView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "lastBaselineAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40, 18.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityHeroActionCell setBottomInsetConstraint:](v3, "setBottomInsetConstraint:", v41);

    objc_msgSend(v17, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityHeroActionCell stackView](v3, "stackView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "lastBaselineAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v44, 14.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityHeroActionCell setTallBottomInsetConstraint:](v3, "setTallBottomInsetConstraint:", v45);

    objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityHeroActionCell setBackgroundConfiguration:](v3, "setBackgroundConfiguration:", v46);

  }
  return v3;
}

- (void)updateConstraints
{
  CGFloat Height;
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  objc_super v8;
  CGRect v9;

  v8.receiver = self;
  v8.super_class = (Class)UIActivityHeroActionCell;
  -[UIActivityHeroActionCell updateConstraints](&v8, sel_updateConstraints);
  -[UIActivityHeroActionCell bounds](self, "bounds");
  Height = CGRectGetHeight(v9);
  v4 = Height > 80.0;
  v5 = Height <= 80.0;
  -[UIActivityHeroActionCell bottomInsetConstraint](self, "bottomInsetConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", v5);

  -[UIActivityHeroActionCell tallBottomInsetConstraint](self, "tallBottomInsetConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", v4);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIActivityHeroActionCell;
  -[UIActivityActionCell prepareForReuse](&v6, sel_prepareForReuse);
  -[UIActivityHeroActionCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[UIActivityHeroActionCell activityImageView](self, "activityImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", 0);

  -[UIActivityHeroActionCell stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)applyLayoutAttributes:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIActivityHeroActionCell;
  -[UIActivityHeroActionCell applyLayoutAttributes:](&v4, sel_applyLayoutAttributes_, a3);
  -[UIActivityHeroActionCell setClipsToBounds:](self, "setClipsToBounds:", 1);
  -[UIActivityHeroActionCell _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", 12.0);
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIActivityHeroActionCell;
  -[UIActivityActionCell setDisabled:](&v7, sel_setDisabled_);
  if (v3)
    v5 = 0.4;
  else
    v5 = 1.0;
  -[UIActivityHeroActionCell stackView](self, "stackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

}

+ (int64_t)numberOfLinesForTitle:(id)a3 itemWidth:(double)a4
{
  double v4;
  objc_class *v5;
  id v6;
  id v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  const __CFAttributedString *v12;
  const __CTLine *v13;
  CFIndex v14;
  double OffsetForStringIndex;
  int64_t v16;
  id v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a4 + -8.0;
  v5 = (objc_class *)MEMORY[0x1E0DC33B0];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  LODWORD(v8) = 1036831949;
  objc_msgSend(v7, "setHyphenationFactor:", v8);
  v9 = objc_alloc(MEMORY[0x1E0CB3498]);
  v20[0] = *MEMORY[0x1E0DC32A0];
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = *MEMORY[0x1E0DC32C0];
  v21[0] = v10;
  v21[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (const __CFAttributedString *)objc_msgSend(v9, "initWithString:attributes:", v6, v11);

  v13 = CTLineCreateWithAttributedString(v12);
  v14 = objc_msgSend(v6, "length");

  OffsetForStringIndex = CTLineGetOffsetForStringIndex(v13, v14, 0);
  CFRelease(v13);
  if (OffsetForStringIndex >= v4)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0DC4258]);
    objc_msgSend(v17, "setAttributedText:", v12);
    objc_msgSend(v17, "setBounds:", 0.0, 0.0, v4, 1.79769313e308);
    objc_msgSend(MEMORY[0x1E0DC4260], "metricsWithConfiguration:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v18, "numberOfLines");

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

+ (double)heightForNumberOfLines:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");
  v6 = v5 + 64.0;
  if (a3 > 1.0)
  {
    objc_msgSend(v4, "lineHeight");
    v8 = v7;
    objc_msgSend(v4, "leading");
    v6 = v6 + v8 + v9;
  }

  return ceil(v6);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIImageView)activityImageView
{
  return self->_activityImageView;
}

- (void)setActivityImageView:(id)a3
{
  objc_storeStrong((id *)&self->_activityImageView, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (NSLayoutConstraint)bottomInsetConstraint
{
  return self->_bottomInsetConstraint;
}

- (void)setBottomInsetConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomInsetConstraint, a3);
}

- (NSLayoutConstraint)tallBottomInsetConstraint
{
  return self->_tallBottomInsetConstraint;
}

- (void)setTallBottomInsetConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_tallBottomInsetConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tallBottomInsetConstraint, 0);
  objc_storeStrong((id *)&self->_bottomInsetConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_activityImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
