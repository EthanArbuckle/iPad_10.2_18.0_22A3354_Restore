@implementation PKDashboardTitleHeaderView

+ (double)defaultHorizontalInset
{
  return 2.0;
}

+ (double)defaultTableHorizontalInset
{
  return 16.0;
}

- (PKDashboardTitleHeaderView)initWithFrame:(CGRect)a3
{
  PKDashboardTitleHeaderView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDashboardTitleHeaderView;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v3->_isCompactUI = PKUIGetMinScreenWidthType() == 0;
    -[PKDashboardTitleHeaderView createSubviews](v3, "createSubviews");
    -[PKDashboardCollectionViewCell setWantsCustomAppearance:](v3, "setWantsCustomAppearance:", 1);
    -[PKDashboardTitleHeaderView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AA0]);
  }
  return v3;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDashboardTitleHeaderView;
  -[PKDashboardCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PKDashboardTitleHeaderView setTitleStyle:](self, "setTitleStyle:", 0);
  -[PKDashboardTitleHeaderView setTitle:](self, "setTitle:", 0);
  -[PKDashboardTitleHeaderView setTitleColor:](self, "setTitleColor:", 0);
  -[PKDashboardTitleHeaderView setActionTitle:](self, "setActionTitle:", 0);
  -[PKDashboardTitleHeaderView setActionImage:](self, "setActionImage:", 0);
  -[PKDashboardTitleHeaderView setAction:](self, "setAction:", 0);
  -[PKDashboardTitleHeaderView setMenu:](self, "setMenu:", 0);
  -[PKDashboardTitleHeaderView setTopPadding:](self, "setTopPadding:", 0.0);
  -[UIButton setHidden:](self->_actionButton, "setHidden:", -[PKDashboardTitleHeaderView shouldShowActionButton](self, "shouldShowActionButton") ^ 1);
  -[UIButton setMenu:](self->_actionButton, "setMenu:", 0);
  -[PKDashboardTitleHeaderView setAlpha:](self, "setAlpha:", 1.0);
}

- (BOOL)shouldShowActionButton
{
  return self->_actionTitle || self->_actionImage != 0;
}

- (void)createSubviews
{
  UILabel *v3;
  UILabel *titleLabel;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v11;
  UIButton *v12;
  UIButton *actionButton;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id location;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  -[PKDashboardTitleHeaderView addSubview:](self, "addSubview:", self->_titleLabel);
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC3428];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __44__PKDashboardTitleHeaderView_createSubviews__block_invoke;
  v18 = &unk_1E3E62BD0;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v5, "actionWithHandler:", &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration", v15, v16, v17, v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardTitleHeaderView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

  if (IsAccessibilityCategory)
    v11 = 2;
  else
    v11 = 8;
  objc_msgSend(v7, "setImagePlacement:", v11);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v7, v6);
  v12 = (UIButton *)objc_claimAutoreleasedReturnValue();
  actionButton = self->_actionButton;
  self->_actionButton = v12;

  -[UIButton titleLabel](self->_actionButton, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLineBreakMode:", 4);

  -[UIButton setAccessibilityIdentifier:](self->_actionButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67830]);
  -[PKDashboardTitleHeaderView addSubview:](self, "addSubview:", self->_actionButton);
  -[PKDashboardTitleHeaderView _resetButtonInsets](self, "_resetButtonInsets");
  -[PKDashboardTitleHeaderView resetFonts](self, "resetFonts");
  -[PKDashboardTitleHeaderView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C48]);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __44__PKDashboardTitleHeaderView_createSubviews__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_buttonPressed:", v4);
}

- (void)resetFonts
{
  uint64_t v3;
  UIButton *actionButton;
  NSString *v5;
  void *v6;
  void *v7;
  UILabel *titleLabel;
  void *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  void **v13;
  uint64_t v14;
  NSString *v15;
  NSString *v16;
  void *v17;
  id v18;

  v3 = PKUIGetMinScreenWidthType();
  objc_msgSend(MEMORY[0x1E0DC39A8], "extraProminentInsetGroupedHeaderConfiguration");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  actionButton = self->_actionButton;
  v5 = (NSString *)*MEMORY[0x1E0DC4B10];
  if (v3)
    v6 = (void *)*MEMORY[0x1E0DC4A88];
  else
    v6 = (void *)*MEMORY[0x1E0DC4B10];
  PKFontForDefaultDesign(v6, (void *)*MEMORY[0x1E0DC48C8], 0x8000, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton pkui_updateConfigurationWithFont:](actionButton, "pkui_updateConfigurationWithFont:", v7);

  switch(self->_titleStyle)
  {
    case 0uLL:
      titleLabel = self->_titleLabel;
      objc_msgSend(v18, "textProperties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "font");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](titleLabel, "setFont:", v10);

      objc_msgSend(v18, "directionalLayoutMargins");
      -[PKDashboardTitleHeaderView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:");
      break;
    case 1uLL:
      v11 = self->_titleLabel;
      v12 = (void *)*MEMORY[0x1E0DC4B48];
      v13 = (void **)MEMORY[0x1E0DC48D0];
      goto LABEL_10;
    case 2uLL:
      v11 = self->_titleLabel;
      objc_msgSend(MEMORY[0x1E0DC3D78], "_defaultFontForTableViewStyle:isSectionHeader:", 1, 1);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 3uLL:
      v11 = self->_titleLabel;
      v15 = (NSString *)*MEMORY[0x1E0DC4AB8];
      v16 = (NSString *)*MEMORY[0x1E0DC4918];
      goto LABEL_12;
    case 4uLL:
      v11 = self->_titleLabel;
      v12 = (void *)*MEMORY[0x1E0DC4AD0];
      v13 = (void **)MEMORY[0x1E0DC48D8];
LABEL_10:
      PKFontForDefaultDesign(v12, *v13, 2, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 5uLL:
      v11 = self->_titleLabel;
      v16 = (NSString *)*MEMORY[0x1E0DC48F8];
      v15 = v5;
LABEL_12:
      PKFontForDefaultDesign(v15, v16);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v17 = (void *)v14;
      -[UILabel setFont:](v11, "setFont:", v14);

      break;
    default:
      break;
  }

}

- (void)resetTitleColor
{
  unint64_t titleStyle;
  id v4;

  titleStyle = self->_titleStyle;
  if (titleStyle <= 5)
  {
    if (titleStyle == 3)
      objc_msgSend(MEMORY[0x1E0DC3D78], "_defaultTextColorForTableViewStyle:isSectionHeader:", 0, 1);
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PKDashboardTitleHeaderView setTitleColor:](self, "setTitleColor:", v4);

  }
}

- (void)_resetButtonInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  NSString *v12;
  _BOOL4 IsAccessibilityCategory;
  unint64_t actionStyle;
  id v15;

  -[UIButton configuration](self->_actionButton, "configuration");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKDashboardTitleHeaderView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredContentSizeCategory");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

  actionStyle = self->_actionStyle;
  if (actionStyle - 1 >= 2)
  {
    if (!actionStyle && !self->_useActionInsets)
    {
      v6 = 0.0;
      v10 = 0.0;
    }
  }
  else
  {
    v6 = (double)!IsAccessibilityCategory;
    if ((unint64_t)PKUIGetMinScreenWidthType() <= 3)
      v10 = 0.0;
    else
      v10 = 2.0;
  }
  objc_msgSend(v15, "setContentInsets:", v4, v6, v8, v10);
  -[UIButton setConfiguration:](self->_actionButton, "setConfiguration:", v15);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDashboardTitleHeaderView;
  -[PKDashboardCollectionViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PKDashboardTitleHeaderView bounds](self, "bounds");
  -[PKDashboardTitleHeaderView _layoutWithBounds:isTemplate:](self, "_layoutWithBounds:isTemplate:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKDashboardTitleHeaderView _layoutWithBounds:isTemplate:](self, "_layoutWithBounds:isTemplate:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplate:(BOOL)a4
{
  double width;
  CGFloat x;
  double v8;
  double v9;
  _BOOL4 preferBaselineAlignment;
  double v11;
  double v12;
  double topPadding;
  void *v14;
  NSString *v15;
  _BOOL4 IsAccessibilityCategory;
  int v17;
  _BOOL4 v18;
  double v19;
  NSUInteger v20;
  UILabel *titleLabel;
  void *v22;
  double v23;
  _BOOL8 v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  UILabel *v52;
  double v53;
  UIButton *actionButton;
  double v55;
  double v56;
  UIButton *v57;
  double v58;
  double MinY;
  void *v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  UIButton *v72;
  double v73;
  double v74;
  unint64_t actionStyle;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  UIButton *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  CGFloat v92;
  double v93;
  CGSize result;
  CGRect v95;

  width = a3.size.width;
  x = a3.origin.x;
  -[PKDashboardCollectionViewCell horizontalInset](self, "horizontalInset", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = v8;
  preferBaselineAlignment = self->_preferBaselineAlignment;
  v11 = 0.0;
  if (!self->_isCompactUI)
  {
    v12 = 15.0;
    if (!self->_preferBaselineAlignment)
      v12 = 9.0;
    if (self->_useCompactTopInset)
      v11 = 4.0;
    else
      v11 = v12;
  }
  topPadding = self->_topPadding;
  -[PKDashboardTitleHeaderView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferredContentSizeCategory");
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v15);

  v17 = -[PKDashboardTitleHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (-[NSString length](self->_actionTitle, "length"))
    v18 = 1;
  else
    v18 = self->_actionImage != 0;
  v19 = v11 + topPadding;
  v20 = -[NSString length](self->_actionTitle, "length");
  titleLabel = self->_titleLabel;
  if (!titleLabel
    || (-[UILabel superview](titleLabel, "superview"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v22,
        !v22))
  {
    v25 = v11 + topPadding;
    goto LABEL_16;
  }
  v92 = x;
  v23 = width + v9 * -2.0;
  v24 = !IsAccessibilityCategory && self->_titleStyle != 1 && !self->_preferTitleWrapOverStackedLayout;
  v30 = *MEMORY[0x1E0C9D820];
  v29 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", v24);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v23, 1.79769313e308);
  if (v31 <= v23)
    v33 = v31;
  else
    v33 = v23;
  v34 = v32;
  v25 = v19 + v32;
  v91 = v33;
  if (v18)
  {
    v90 = width;
    -[UIButton sizeThatFits:](self->_actionButton, "sizeThatFits:", v23, 1.79769313e308);
    v37 = v36;
    v89 = v29;
    if (IsAccessibilityCategory)
    {
      v29 = v35;
      v38 = v30;
    }
    else
    {
      v46 = v91 + 13.0;
      v38 = v91 + 13.0 + v37;
      if (v38 <= v23 || (v38 = v30, v29 = v35, self->_preferTitleWrapOverStackedLayout))
      {
        v39 = v23 - v46;
        -[UIButton sizeThatFits:](self->_actionButton, "sizeThatFits:", v23 - v46, 1.79769313e308, v38, *(_QWORD *)&v89);
        v37 = v47;
        v29 = v48;
        -[UIButton sizeThatFits:](self->_actionButton, "sizeThatFits:", v23, 1.79769313e308);
        v38 = v49;
        v89 = v50;
        IsAccessibilityCategory = 0;
        if (v37 > v39)
          v37 = v39;
LABEL_31:
        if (v38 > v37 && self->_preferTitleWrapOverStackedLayout)
        {
          v40 = v25 - v34;
          if (v38 > v23)
            v38 = v23;
          v39 = v23 - (v38 + 13.0);
          v41 = v38;
          -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v39, 1.79769313e308, *(_QWORD *)&v89);
          v44 = v41;
          v34 = v43;
          if (v42 > v39)
            v42 = v39;
          v91 = v42;
          v25 = v40 + v43;
          v29 = v89;
          width = v90;
        }
        else
        {
          v44 = v37;
          width = v90;
        }
        v45 = v92;
        if (a4)
          goto LABEL_16;
        goto LABEL_46;
      }
    }
LABEL_30:
    v25 = v25 + v35;
    IsAccessibilityCategory = 1;
    v39 = v23;
    goto LABEL_31;
  }
  if (IsAccessibilityCategory)
  {
    v89 = v29;
    v90 = width;
    v35 = -0.0;
    v38 = v30;
    v37 = v30;
    goto LABEL_30;
  }
  v51 = v23 - (v33 + 13.0);
  v45 = v92;
  v44 = v30;
  v39 = v51;
  if (a4)
    goto LABEL_16;
LABEL_46:
  v93 = v44;
  v52 = self->_titleLabel;
  -[PKDashboardCollectionViewCell horizontalInset](self, "horizontalInset", *(_QWORD *)&v89);
  if (v17)
    v53 = width - v53 - v91;
  -[UILabel setFrame:](v52, "setFrame:", v45 + v53, v19, v91, v34);
  if (v18)
  {
    if (IsAccessibilityCategory)
    {
      actionButton = self->_actionButton;
      -[PKDashboardCollectionViewCell horizontalInset](self, "horizontalInset");
      if (v17)
        v55 = width - v55 - v93;
      v56 = v45 + v55;
      v57 = actionButton;
      v58 = v19 + v34;
    }
    else if (v39 <= 0.0)
    {
      v57 = self->_actionButton;
      v56 = *MEMORY[0x1E0C9D648];
      v58 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    }
    else
    {
      if (v20)
      {
        -[UILabel frame](self->_titleLabel, "frame");
        MinY = CGRectGetMinY(v95);
        -[UILabel font](self->_titleLabel, "font");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "ascender");
        v61 = v29;
        v63 = MinY + v62;
        -[UIButton titleLabel](self->_actionButton, "titleLabel");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "font");
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v65, "ascender");
        v67 = v66;
        -[UIButton configuration](self->_actionButton, "configuration");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "contentInsets");
        v70 = v67 + v69;

        v71 = v63 - v70;
        v72 = self->_actionButton;
        -[PKDashboardCollectionViewCell horizontalInset](self, "horizontalInset");
        if (!v17)
          v73 = width - v73 - v93;
        -[UIButton setFrame:](v72, "setFrame:", v45 + v73, v71, v93, v61);

        goto LABEL_16;
      }
      v74 = v29;
      actionStyle = self->_actionStyle;
      -[UILabel frame](self->_titleLabel, "frame");
      v77 = v76;
      -[UILabel frame](self->_titleLabel, "frame");
      v79 = v78;
      -[UILabel font](self->_titleLabel, "font");
      if (actionStyle == 2)
      {
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "lineHeight");
        v82 = v77 + (v79 - v81) * 0.5;
        -[UILabel font](self->_titleLabel, "font");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "lineHeight");
      }
      else
      {
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "ascender");
        v82 = v77 + v79 - v85;
        -[UILabel font](self->_titleLabel, "font");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "ascender");
      }
      v86 = v82 + v84 * 0.5 - v74 * 0.5;

      v87 = self->_actionButton;
      -[PKDashboardCollectionViewCell horizontalInset](self, "horizontalInset");
      if (!v17)
        v88 = width - v88 - v93;
      v56 = v45 + v88;
      v57 = v87;
      v58 = v86;
    }
    -[UIButton setFrame:](v57, "setFrame:", v56, v58);
  }
LABEL_16:
  v26 = 0.0;
  if (!preferBaselineAlignment)
    v26 = 6.0;
  if (self->_useLargeBottomInset)
    v26 = 10.0;
  v27 = v25 + v26;
  v28 = width;
  result.height = v27;
  result.width = v28;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v9;
  NSString *v10;
  NSComparisonResult v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKDashboardTitleHeaderView;
  -[PKDashboardTitleHeaderView traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  -[PKDashboardTitleHeaderView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 == (void *)*MEMORY[0x1E0DC4938] || v5 == 0)
    {

    }
    else
    {
      objc_msgSend(v4, "preferredContentSizeCategory");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "preferredContentSizeCategory");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      v11 = UIContentSizeCategoryCompareToCategory(v9, v10);

      if (v11)
      {
        -[PKDashboardTitleHeaderView _resetButtonInsets](self, "_resetButtonInsets");
        -[PKDashboardTitleHeaderView resetFonts](self, "resetFonts");
      }
    }
  }

}

- (void)setTitle:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  BOOL v8;
  NSString *v9;
  UILabel *titleLabel;
  void *v11;
  NSString *v12;

  v5 = a3;
  v6 = self->_title;
  v7 = (NSString *)v5;
  v12 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

      v9 = v12;
      if (v8)
        goto LABEL_13;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_title, a3);
    titleLabel = self->_titleLabel;
    if (self->_titleStyle == 3)
    {
      -[NSString uppercaseString](v12, "uppercaseString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](titleLabel, "setText:", v11);

    }
    else
    {
      -[UILabel setText:](self->_titleLabel, "setText:", v12);
    }
    -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    -[PKDashboardTitleHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
  v9 = v12;
LABEL_13:

}

- (void)setTitleColor:(id)a3
{
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", a3);
}

- (void)setActionTitle:(id)a3
{
  id v5;
  NSString *actionTitle;
  NSString *v7;
  BOOL v8;
  UIImage *actionImage;
  NSString *v10;

  v5 = a3;
  actionTitle = self->_actionTitle;
  v10 = (NSString *)v5;
  v7 = actionTitle;
  if (v7 == v10)
  {

  }
  else
  {
    if (v10 && v7)
    {
      v8 = -[NSString isEqualToString:](v10, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_actionTitle, a3);
    actionImage = self->_actionImage;
    self->_actionImage = 0;

    -[UIButton pkui_updateConfigurationWithTitle:](self->_actionButton, "pkui_updateConfigurationWithTitle:", self->_actionTitle);
    -[UIButton setHidden:](self->_actionButton, "setHidden:", -[PKDashboardTitleHeaderView shouldShowActionButton](self, "shouldShowActionButton") ^ 1);
    -[PKDashboardTitleHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setActionImage:(id)a3
{
  UIImage **p_actionImage;
  NSString *actionTitle;
  id v7;

  p_actionImage = &self->_actionImage;
  v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_actionImage, a3);
    actionTitle = self->_actionTitle;
    self->_actionTitle = 0;

    -[UIButton pkui_updateConfigurationWithImage:](self->_actionButton, "pkui_updateConfigurationWithImage:", *p_actionImage);
    -[UIButton setHidden:](self->_actionButton, "setHidden:", -[PKDashboardTitleHeaderView shouldShowActionButton](self, "shouldShowActionButton") ^ 1);
    -[PKDashboardTitleHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTitleStyle:(unint64_t)a3
{
  UILabel *titleLabel;
  void *v5;

  if (self->_titleStyle != a3)
  {
    self->_titleStyle = a3;
    titleLabel = self->_titleLabel;
    if (a3 == 3)
    {
      -[NSString uppercaseString](self->_title, "uppercaseString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](titleLabel, "setText:", v5);

    }
    else
    {
      -[UILabel setText:](self->_titleLabel, "setText:", self->_title);
    }
    -[PKDashboardTitleHeaderView resetTitleColor](self, "resetTitleColor");
    -[PKDashboardTitleHeaderView resetFonts](self, "resetFonts");
    -[PKDashboardTitleHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setActionColor:(id)a3
{
  -[UIButton setTintColor:](self->_actionButton, "setTintColor:", a3);
}

- (void)setTopPadding:(double)a3
{
  if (self->_topPadding != a3)
  {
    self->_topPadding = a3;
    -[PKDashboardTitleHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setActionStyle:(unint64_t)a3
{
  if (self->_actionStyle != a3)
  {
    self->_actionStyle = a3;
    -[PKDashboardTitleHeaderView _resetButtonInsets](self, "_resetButtonInsets");
    -[PKDashboardTitleHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setAction:(id)a3
{
  void *v4;
  id action;

  v4 = _Block_copy(a3);
  action = self->_action;
  self->_action = v4;

  -[UIButton setShowsMenuAsPrimaryAction:](self->_actionButton, "setShowsMenuAsPrimaryAction:", 0);
}

- (void)_buttonPressed:(id)a3
{
  void (**action)(void);

  action = (void (**)(void))self->_action;
  if (action)
    action[2]();
}

- (void)setMenu:(id)a3
{
  UIMenu **p_menu;
  id v6;

  p_menu = &self->_menu;
  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_menu, a3);
    -[UIButton setMenu:](self->_actionButton, "setMenu:", *p_menu);
    -[UIButton setShowsMenuAsPrimaryAction:](self->_actionButton, "setShowsMenuAsPrimaryAction:", 1);
  }

}

- (BOOL)useCompactTopInset
{
  return self->_useCompactTopInset;
}

- (void)setUseCompactTopInset:(BOOL)a3
{
  self->_useCompactTopInset = a3;
}

- (BOOL)useLargeBottomInset
{
  return self->_useLargeBottomInset;
}

- (void)setUseLargeBottomInset:(BOOL)a3
{
  self->_useLargeBottomInset = a3;
}

- (BOOL)useActionInsets
{
  return self->_useActionInsets;
}

- (void)setUseActionInsets:(BOOL)a3
{
  self->_useActionInsets = a3;
}

- (BOOL)preferBaselineAlignment
{
  return self->_preferBaselineAlignment;
}

- (void)setPreferBaselineAlignment:(BOOL)a3
{
  self->_preferBaselineAlignment = a3;
}

- (BOOL)preferTitleWrapOverStackedLayout
{
  return self->_preferTitleWrapOverStackedLayout;
}

- (void)setPreferTitleWrapOverStackedLayout:(BOOL)a3
{
  self->_preferTitleWrapOverStackedLayout = a3;
}

- (NSString)title
{
  return self->_title;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (unint64_t)titleStyle
{
  return self->_titleStyle;
}

- (double)topPadding
{
  return self->_topPadding;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (UIImage)actionImage
{
  return self->_actionImage;
}

- (UIColor)actionColor
{
  return self->_actionColor;
}

- (unint64_t)actionStyle
{
  return self->_actionStyle;
}

- (id)action
{
  return self->_action;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_actionColor, 0);
  objc_storeStrong((id *)&self->_actionImage, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
