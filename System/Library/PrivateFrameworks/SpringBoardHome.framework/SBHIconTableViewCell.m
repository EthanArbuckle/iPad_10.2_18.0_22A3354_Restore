@implementation SBHIconTableViewCell

- (SBHIconTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SBHIconTableViewCell *v4;
  UILabel *v5;
  UILabel *iconNameLabel;
  UILabel *v7;
  void *v8;
  double v9;
  double v10;
  UIView *v11;
  UIView *iconViewContainerView;
  UIView *v13;
  UIView *labelContainerView;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  id v27;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  UIView *customSelectedBackgroundView;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  objc_super v81;
  void *v82;
  void *v83;
  _BYTE v84[128];
  _QWORD v85[5];

  v85[3] = *MEMORY[0x1E0C80C00];
  v81.receiver = self;
  v81.super_class = (Class)SBHIconTableViewCell;
  v4 = -[SBHIconTableViewCell initWithStyle:reuseIdentifier:](&v81, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    iconNameLabel = v4->_iconNameLabel;
    v4->_iconNameLabel = v5;

    -[UILabel setNumberOfLines:](v4->_iconNameLabel, "setNumberOfLines:", 1);
    v7 = v4->_iconNameLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7, "setTextColor:", v8);

    LODWORD(v9) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_iconNameLabel, "setContentCompressionResistancePriority:forAxis:", 1, v9);
    LODWORD(v10) = 1132068864;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_iconNameLabel, "setContentCompressionResistancePriority:forAxis:", 0, v10);
    v11 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    iconViewContainerView = v4->_iconViewContainerView;
    v4->_iconViewContainerView = v11;

    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    labelContainerView = v4->_labelContainerView;
    v4->_labelContainerView = v13;

    v15 = *MEMORY[0x1E0DC49E8];
    v16 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v17 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v18 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    -[SBHIconTableViewCell setLayoutMargins:](v4, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], v16, v17, v18);
    -[SBHIconTableViewCell setPreservesSuperviewLayoutMargins:](v4, "setPreservesSuperviewLayoutMargins:", 1);
    -[SBHIconTableViewCell contentView](v4, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLayoutMargins:", v15, v16, v17, v18);
    objc_msgSend(v19, "setPreservesSuperviewLayoutMargins:", 1);
    v85[0] = v4->_iconNameLabel;
    v85[1] = v4->_iconViewContainerView;
    v85[2] = v4->_labelContainerView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 3);
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v78 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * i), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
      }
      while (v22);
    }

    -[UIView addSubview:](v4->_labelContainerView, "addSubview:", v4->_iconNameLabel);
    objc_msgSend(v19, "addSubview:", v4->_labelContainerView);
    objc_msgSend(v19, "addSubview:", v4->_iconViewContainerView);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v25);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v26);

    v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UIView leadingAnchor](v4->_iconViewContainerView, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layoutMarginsGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = v19;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v32);

    -[UIView topAnchor](v4->_iconViewContainerView, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintGreaterThanOrEqualToAnchor:constant:", v34, 12.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v35);

    -[UIView bottomAnchor](v4->_iconViewContainerView, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:constant:", v37, 12.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v38);

    -[UIView centerYAnchor](v4->_iconViewContainerView, "centerYAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "centerYAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v41);

    -[UIView leadingAnchor](v4->_labelContainerView, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4->_iconViewContainerView, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, 16.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v44);

    -[UIView trailingAnchor](v4->_labelContainerView, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layoutMarginsGuide");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintLessThanOrEqualToAnchor:constant:", v47, -16.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v48);

    -[UIView centerYAnchor](v4->_labelContainerView, "centerYAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v4->_iconViewContainerView, "centerYAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v51);

    -[UIView heightAnchor](v4->_labelContainerView, "heightAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v4->_iconViewContainerView, "heightAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintLessThanOrEqualToAnchor:multiplier:", v53, 1.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v54);

    -[UIView heightAnchor](v4->_labelContainerView, "heightAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel heightAnchor](v4->_iconNameLabel, "heightAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:multiplier:", v56, 1.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v57);

    -[UILabel leadingAnchor](v4->_iconNameLabel, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v4->_labelContainerView, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v60);

    -[UILabel trailingAnchor](v4->_iconNameLabel, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4->_labelContainerView, "trailingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v63);

    -[UILabel topAnchor](v4->_iconNameLabel, "topAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v4->_labelContainerView, "topAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v66);

    v67 = objc_opt_new();
    customSelectedBackgroundView = v4->_customSelectedBackgroundView;
    v4->_customSelectedBackgroundView = (UIView *)v67;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_customSelectedBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBHIconTableViewCell setSelectedBackgroundView:](v4, "setSelectedBackgroundView:", v4->_customSelectedBackgroundView);
    -[SBHIconTableViewCell _updateHighlightBackgroundView](v4, "_updateHighlightBackgroundView");
    -[SBHIconTableViewCell _updateTitleLabelFont](v4, "_updateTitleLabelFont");
    -[SBHIconTableViewCell layer](v4, "layer");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setAllowsGroupBlending:", 0);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v27);
    objc_opt_self();
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v70;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = (id)-[SBHIconTableViewCell registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v71, sel__updateHighlightBackgroundView);

    objc_opt_self();
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v73;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (id)-[SBHIconTableViewCell registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v74, sel__updateTitleLabelFont);

  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHIconTableViewCell;
  -[SBHIconTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[SBHIconTableViewCell _resetContent](self, "_resetContent");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  LODWORD(v2) = 1148846080;
  LODWORD(v3) = 1148846080;
  -[SBHIconTableViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), v2, v3);
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_updateTitleLabelFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UILabel *iconNameLabel;
  void *v8;
  SBIconLabelAccessoryView *iconLabelAccessoryView;
  _UILegibilitySettings *legibilitySettings;
  void *v11;
  id v12;

  -[SBHIconTableViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3E88];
  objc_msgSend(v3, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBHContentSizeCategoryClip(v5, (void *)*MEMORY[0x1E0DC4930], (void *)*MEMORY[0x1E0DC48C0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollectionWithPreferredContentSizeCategory:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  iconNameLabel = self->_iconNameLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4A88], v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](iconNameLabel, "setFont:", v8);

  iconLabelAccessoryView = self->_iconLabelAccessoryView;
  legibilitySettings = self->_legibilitySettings;
  -[UILabel font](self->_iconNameLabel, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconLabelAccessoryView updateWithLegibilitySettings:labelFont:](iconLabelAccessoryView, "updateWithLegibilitySettings:labelFont:", legibilitySettings, v11);

}

- (void)_updateHighlightBackgroundView
{
  void *v3;
  uint64_t v4;
  UIView *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  UIView *customSelectedBackgroundView;
  void *v10;
  void *v11;
  id v12;

  -[SBHIconTableViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == 1)
  {
    customSelectedBackgroundView = self->_customSelectedBackgroundView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0900000036, 0.0900000036, 0.0900000036, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](customSelectedBackgroundView, "setBackgroundColor:", v10);

    -[UIView layer](self->_customSelectedBackgroundView, "layer");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CD2780];
    v8 = (_QWORD *)MEMORY[0x1E0CD2EA0];
  }
  else
  {
    if (v4 != 2)
      return;
    v5 = self->_customSelectedBackgroundView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.920000017, 0.920000017, 0.920000017, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[UIView layer](self->_customSelectedBackgroundView, "layer");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CD2780];
    v8 = (_QWORD *)MEMORY[0x1E0CD2E98];
  }
  objc_msgSend(v7, "filterWithType:", *v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCompositingFilter:", v11);

}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBHIconTableViewCell;
  -[SBHIconTableViewCell setHighlighted:animated:](&v10, sel_setHighlighted_animated_, a3, a4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__SBHIconTableViewCell_setHighlighted_animated___block_invoke;
  v9[3] = &unk_1E8D84C50;
  v9[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v9);
  -[SBHIconTableViewCell selectedBackgroundView](self, "selectedBackgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsGroupBlending:", !v4);

}

uint64_t __48__SBHIconTableViewCell_setHighlighted_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setHighlighted:", 0);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHIconTableViewCell;
  -[SBHIconTableViewCell setHighlighted:](&v9, sel_setHighlighted_);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__SBHIconTableViewCell_setHighlighted___block_invoke;
  v8[3] = &unk_1E8D84C50;
  v8[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v8);
  -[SBHIconTableViewCell selectedBackgroundView](self, "selectedBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsGroupBlending:", !v3);

}

uint64_t __39__SBHIconTableViewCell_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setHighlighted:", 0);
}

- (void)setLegibilitySettings:(id)a3
{
  SBIconLabelAccessoryView *iconLabelAccessoryView;
  void *v6;
  id v7;

  v7 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBIconView setLegibilitySettings:](self->_iconView, "setLegibilitySettings:", v7);
    iconLabelAccessoryView = self->_iconLabelAccessoryView;
    -[UILabel font](self->_iconNameLabel, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconLabelAccessoryView updateWithLegibilitySettings:labelFont:](iconLabelAccessoryView, "updateWithLegibilitySettings:labelFont:", v7, v6);

  }
}

+ (double)defaultTableViewCellHorizontalMargin
{
  return 16.0;
}

+ (double)defaultTableViewCellHeightForIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;

  +[SBIconView defaultIconViewSizeForIconImageSize:configurationOptions:](SBIconView, "defaultIconViewSizeForIconImageSize:configurationOptions:", 2);
  return v3 + 24.0;
}

+ (UIEdgeInsets)defaultTableViewCellSeparatorInsetsForIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v4 = v3 + 16.0;
  v5 = 0.0;
  v6 = 0.0;
  v7 = 30.0;
  result.right = v7;
  result.bottom = v6;
  result.left = v4;
  result.top = v5;
  return result;
}

- (void)setIconView:(id)a3
{
  id v5;
  id *p_iconView;
  id v7;
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
  _QWORD v27[6];

  v27[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_iconView = (id *)&self->_iconView;
  if ((-[SBIconView isEqual:](self->_iconView, "isEqual:", v5) & 1) == 0)
  {
    -[SBHIconTableViewCell _resetIconView](self, "_resetIconView");
    objc_storeStrong((id *)&self->_iconView, a3);
    v7 = *p_iconView;
    -[SBHIconTableViewCell legibilitySettings](self, "legibilitySettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLegibilitySettings:", v8);

    objc_msgSend(*p_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (*p_iconView)
    {
      -[SBHIconTableViewCell iconViewContainerView](self, "iconViewContainerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sizeToFit");
      objc_msgSend(v9, "addSubview:", v5);
      objc_msgSend(v5, "topAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "topAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v24;
      objc_msgSend(v5, "bottomAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bottomAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v21;
      objc_msgSend(v5, "leadingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "leadingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v27[2] = v10;
      objc_msgSend(v5, "trailingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27[3] = v13;
      objc_msgSend(v9, "widthAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "iconImageSize");
      objc_msgSend(v14, "constraintEqualToConstant:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27[4] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconTableViewCell setIconViewContainerViewConstraints:](self, "setIconViewContainerViewConstraints:", v16);

      v17 = (void *)MEMORY[0x1E0CB3718];
      -[SBHIconTableViewCell iconViewContainerViewConstraints](self, "iconViewContainerViewConstraints");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "activateConstraints:", v18);

    }
    -[SBHIconTableViewCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }

}

- (void)configureCellForIcon:(id)a3
{
  void *v5;
  BOOL v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_icon, a3);
  if (!v7)
  {
    if (!-[SBHIconTableViewCell _updateIconNameLabelForDisplayName:labelAccessoryType:](self, "_updateIconNameLabelForDisplayName:labelAccessoryType:", 0, 0))goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(v7, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBHIconTableViewCell _updateIconNameLabelForDisplayName:labelAccessoryType:](self, "_updateIconNameLabelForDisplayName:labelAccessoryType:", v5, objc_msgSend(v7, "labelAccessoryType"));

  if (v6)
  {
LABEL_3:
    -[SBHIconTableViewCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[SBHIconTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
LABEL_4:

}

- (void)_resetIconView
{
  void *v3;
  void *v4;
  SBIconView *iconView;
  SBIcon *icon;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SBHIconTableViewCell _teardownIconLabelAccessoryView](self, "_teardownIconLabelAccessoryView");
  self->_labelAccessoryType = 0;
  -[SBIconView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  -[SBIconView superview](self->_iconView, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconTableViewCell iconViewContainerView](self, "iconViewContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    -[SBIconView removeFromSuperview](self->_iconView, "removeFromSuperview");
  iconView = self->_iconView;
  self->_iconView = 0;

  icon = self->_icon;
  self->_icon = 0;

  -[SBHIconTableViewCell iconViewContainerView](self, "iconViewContainerView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  v8 = (void *)MEMORY[0x1E0CB3718];
  -[SBHIconTableViewCell iconViewContainerViewConstraints](self, "iconViewContainerViewConstraints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deactivateConstraints:", v9);

  -[SBHIconTableViewCell setIconViewContainerViewConstraints:](self, "setIconViewContainerViewConstraints:", 0);
}

- (void)_resetContent
{
  void *v3;
  void *v4;
  SBIcon *icon;

  -[SBHIconTableViewCell iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForReuse");

  -[SBHIconTableViewCell iconNameLabel](self, "iconNameLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

  -[SBHIconTableViewCell _teardownIconLabelAccessoryView](self, "_teardownIconLabelAccessoryView");
  self->_labelAccessoryType = 0;
  icon = self->_icon;
  self->_icon = 0;

}

- (BOOL)_updateIconNameLabelForDisplayName:(id)a3 labelAccessoryType:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;
  char v9;

  v6 = a3;
  -[UILabel text](self->_iconNameLabel, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = BSEqualObjects();

  if ((v8 & 1) == 0)
  {
    -[UILabel setText:](self->_iconNameLabel, "setText:", v6);
    -[UILabel invalidateIntrinsicContentSize](self->_iconNameLabel, "invalidateIntrinsicContentSize");
  }
  v9 = v8 ^ 1 | -[SBHIconTableViewCell _setLabelAccessoryType:](self, "_setLabelAccessoryType:", a4);

  return v9;
}

- (BOOL)_setLabelAccessoryType:(int64_t)a3
{
  int64_t v3;
  int64_t labelAccessoryType;
  SBIconLabelAccessoryView *v7;
  SBIconLabelAccessoryView *iconLabelAccessoryView;
  SBIconLabelAccessoryView *v9;
  _UILegibilitySettings *legibilitySettings;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  _BOOL4 v15;
  SBIconLabelAccessoryView *v16;
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
  NSArray *iconLabelAccessoryViewConstraints;
  NSArray *v29;

  if (a3 == 3)
    v3 = 3;
  else
    v3 = 0;
  labelAccessoryType = self->_labelAccessoryType;
  if (labelAccessoryType != v3)
  {
    self->_labelAccessoryType = v3;
    -[SBHIconTableViewCell _teardownIconLabelAccessoryView](self, "_teardownIconLabelAccessoryView");
    if (a3 == 3)
    {
      +[SBIconView defaultViewClassForLabelAccessoryType:](SBIconView, "defaultViewClassForLabelAccessoryType:", 3);
      v7 = (SBIconLabelAccessoryView *)objc_opt_new();
      iconLabelAccessoryView = self->_iconLabelAccessoryView;
      self->_iconLabelAccessoryView = v7;

      v9 = self->_iconLabelAccessoryView;
      legibilitySettings = self->_legibilitySettings;
      -[SBHIconTableViewCell iconNameLabel](self, "iconNameLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "font");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconLabelAccessoryView updateWithLegibilitySettings:labelFont:](v9, "updateWithLegibilitySettings:labelFont:", legibilitySettings, v12);

      -[SBIconLabelAccessoryView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconLabelAccessoryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[SBHIconTableViewCell contentView](self, "contentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSubview:", self->_iconLabelAccessoryView);

      v14 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v15 = -[SBIconLabelAccessoryView hasBaseline](self->_iconLabelAccessoryView, "hasBaseline");
      v16 = self->_iconLabelAccessoryView;
      if (v15)
      {
        -[SBIconLabelAccessoryView firstBaselineAnchor](v16, "firstBaselineAnchor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel firstBaselineAnchor](self->_iconNameLabel, "firstBaselineAnchor");
      }
      else
      {
        -[SBIconLabelAccessoryView centerYAnchor](v16, "centerYAnchor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel centerYAnchor](self->_iconNameLabel, "centerYAnchor");
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v14, "addObject:", v19);

      -[SBHIconTableViewCell contentView](self, "contentView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "layoutMarginsGuide");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBIconLabelAccessoryView trailingAnchor](self->_iconLabelAccessoryView, "trailingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "trailingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -16.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v14, "addObject:", v24);

      -[SBIconLabelAccessoryView leadingAnchor](self->_iconLabelAccessoryView, "leadingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_labelContainerView, "trailingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v26, 1.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v14, "addObject:", v27);

      iconLabelAccessoryViewConstraints = self->_iconLabelAccessoryViewConstraints;
      self->_iconLabelAccessoryViewConstraints = v14;
      v29 = v14;

      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_iconLabelAccessoryViewConstraints);
    }
  }
  return labelAccessoryType != v3;
}

- (void)_teardownIconLabelAccessoryView
{
  NSArray *iconLabelAccessoryViewConstraints;
  SBIconLabelAccessoryView *iconLabelAccessoryView;

  if (self->_iconLabelAccessoryView)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_iconLabelAccessoryViewConstraints);
    iconLabelAccessoryViewConstraints = self->_iconLabelAccessoryViewConstraints;
    self->_iconLabelAccessoryViewConstraints = 0;

    -[SBIconLabelAccessoryView removeFromSuperview](self->_iconLabelAccessoryView, "removeFromSuperview");
    iconLabelAccessoryView = self->_iconLabelAccessoryView;
    self->_iconLabelAccessoryView = 0;

    -[SBHIconTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBIconView)iconView
{
  return self->_iconView;
}

- (SBIcon)icon
{
  return self->_icon;
}

- (NSString)iconDescription
{
  return self->_iconDescription;
}

- (UILabel)iconNameLabel
{
  return self->_iconNameLabel;
}

- (UIView)iconViewContainerView
{
  return self->_iconViewContainerView;
}

- (UIView)labelContainerView
{
  return self->_labelContainerView;
}

- (NSArray)iconViewContainerViewConstraints
{
  return self->_iconViewContainerViewConstraints;
}

- (void)setIconViewContainerViewConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconViewContainerViewConstraints, 0);
  objc_storeStrong((id *)&self->_labelContainerView, 0);
  objc_storeStrong((id *)&self->_iconViewContainerView, 0);
  objc_storeStrong((id *)&self->_iconNameLabel, 0);
  objc_storeStrong((id *)&self->_iconDescription, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_iconLabelAccessoryViewConstraints, 0);
  objc_storeStrong((id *)&self->_iconLabelAccessoryView, 0);
  objc_storeStrong((id *)&self->_customSelectedBackgroundView, 0);
}

@end
