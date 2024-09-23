@implementation SBHWidgetWrapperView

- (SBHWidgetWrapperView)init
{
  return -[SBHWidgetWrapperView initWithTitleAndSubtitleVisible:](self, "initWithTitleAndSubtitleVisible:", 0);
}

- (SBHWidgetWrapperView)initWithTitleAndSubtitleVisible:(BOOL)a3
{
  _BOOL4 v3;
  SBHWidgetWrapperView *v4;
  SBHWidgetWrapperView *v5;
  _SBHShadowView *v6;
  UIView *shadowView;
  UIView *v8;
  UIView *shadowedWidgetWrapperView;
  SBHShadowedWidgetView *v10;
  SBHShadowedWidgetView *shadowedWidgetView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UILabel *v20;
  UILabel *titleLabel;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSLayoutConstraint *widgetToTitleSpacingConstraint;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  UILabel *v39;
  UILabel *subtitleLabel;
  UILabel *v41;
  void *v42;
  UILabel *v43;
  void *v44;
  double v45;
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
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _BOOL4 v82;
  void *v83;
  objc_super v84;
  void *v85;
  void *v86;
  _QWORD v87[4];
  _QWORD v88[3];
  _QWORD v89[9];

  v3 = a3;
  v89[7] = *MEMORY[0x1E0C80C00];
  v84.receiver = self;
  v84.super_class = (Class)SBHWidgetWrapperView;
  v4 = -[SBHWidgetWrapperView initWithFrame:](&v84, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    -[SBHWidgetWrapperView setClipsToBounds:](v4, "setClipsToBounds:", 0);
    v6 = -[_SBHShadowView initWithFrame:]([_SBHShadowView alloc], "initWithFrame:", 0.0, 0.0, v5->_contentSize.width, v5->_contentSize.height);
    v82 = v3;
    shadowView = v5->_shadowView;
    v5->_shadowView = &v6->super;

    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    shadowedWidgetWrapperView = v5->_shadowedWidgetWrapperView;
    v5->_shadowedWidgetWrapperView = v8;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_shadowedWidgetWrapperView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBHWidgetWrapperView addSubview:](v5, "addSubview:", v5->_shadowedWidgetWrapperView);
    v10 = -[SBHShadowedWidgetView initWithContentView:shadowView:perspectiveEnabled:]([SBHShadowedWidgetView alloc], "initWithContentView:shadowView:perspectiveEnabled:", 0, v5->_shadowView, 0);
    shadowedWidgetView = v5->_shadowedWidgetView;
    v5->_shadowedWidgetView = v10;

    -[SBHShadowedWidgetView setTranslatesAutoresizingMaskIntoConstraints:](v5->_shadowedWidgetView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v5->_shadowedWidgetWrapperView, "addSubview:", v5->_shadowedWidgetView);
    v68 = (void *)MEMORY[0x1E0CB3718];
    -[UIView leadingAnchor](v5->_shadowedWidgetWrapperView, "leadingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetWrapperView leadingAnchor](v5, "leadingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:constant:", v78, 0.0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v76;
    -[UIView trailingAnchor](v5->_shadowedWidgetWrapperView, "trailingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetWrapperView trailingAnchor](v5, "trailingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:constant:", v73, 0.0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v89[1] = v72;
    -[UIView topAnchor](v5->_shadowedWidgetWrapperView, "topAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetWrapperView topAnchor](v5, "topAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:constant:", v70, 0.0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v89[2] = v69;
    -[SBHShadowedWidgetView leadingAnchor](v5->_shadowedWidgetView, "leadingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v5->_shadowedWidgetWrapperView, "leadingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:constant:", v66, 0.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v89[3] = v65;
    -[SBHShadowedWidgetView trailingAnchor](v5->_shadowedWidgetView, "trailingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v5->_shadowedWidgetWrapperView, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:constant:", v63, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v89[4] = v12;
    -[SBHShadowedWidgetView topAnchor](v5->_shadowedWidgetView, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v5->_shadowedWidgetWrapperView, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v89[5] = v15;
    -[SBHShadowedWidgetView bottomAnchor](v5->_shadowedWidgetView, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v5->_shadowedWidgetWrapperView, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v89[6] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "activateConstraints:", v19);

    if (v82)
    {
      v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      titleLabel = v5->_titleLabel;
      v5->_titleLabel = v20;

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v22 = v5->_titleLabel;
      -[SBHWidgetWrapperView _titleLabelFont](v5, "_titleLabelFont");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v22, "setFont:", v23);

      v24 = v5->_titleLabel;
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v24, "setTextColor:", v25);

      -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 0);
      -[UILabel setTextAlignment:](v5->_titleLabel, "setTextAlignment:", 1);
      LODWORD(v26) = 1148846080;
      -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v26);
      -[SBHWidgetWrapperView addSubview:](v5, "addSubview:", v5->_titleLabel);
      -[UILabel topAnchor](v5->_titleLabel, "topAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](v5->_shadowedWidgetWrapperView, "bottomAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, 5.0);
      v29 = objc_claimAutoreleasedReturnValue();
      widgetToTitleSpacingConstraint = v5->_widgetToTitleSpacingConstraint;
      v5->_widgetToTitleSpacingConstraint = (NSLayoutConstraint *)v29;

      v31 = (void *)MEMORY[0x1E0CB3718];
      -[UILabel leadingAnchor](v5->_titleLabel, "leadingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHWidgetWrapperView leadingAnchor](v5, "leadingAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v88[0] = v34;
      -[UILabel trailingAnchor](v5->_titleLabel, "trailingAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHWidgetWrapperView trailingAnchor](v5, "trailingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "constraintEqualToAnchor:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v88[1] = v37;
      v88[2] = v5->_widgetToTitleSpacingConstraint;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 3);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "activateConstraints:", v38);

      v39 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      subtitleLabel = v5->_subtitleLabel;
      v5->_subtitleLabel = v39;

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v41 = v5->_subtitleLabel;
      -[SBHWidgetWrapperView _subititleLabelFont](v5, "_subititleLabelFont");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v41, "setFont:", v42);

      v43 = v5->_subtitleLabel;
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v43, "setTextColor:", v44);

      -[UILabel setNumberOfLines:](v5->_subtitleLabel, "setNumberOfLines:", 0);
      -[UILabel setTextAlignment:](v5->_subtitleLabel, "setTextAlignment:", 1);
      LODWORD(v45) = 1148846080;
      -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v45);
      -[SBHWidgetWrapperView addSubview:](v5, "addSubview:", v5->_subtitleLabel);
      v75 = (void *)MEMORY[0x1E0CB3718];
      -[UILabel leadingAnchor](v5->_subtitleLabel, "leadingAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHWidgetWrapperView leadingAnchor](v5, "leadingAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "constraintEqualToAnchor:", v81);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v87[0] = v79;
      -[UILabel trailingAnchor](v5->_subtitleLabel, "trailingAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHWidgetWrapperView trailingAnchor](v5, "trailingAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "constraintEqualToAnchor:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v87[1] = v47;
      -[UILabel topAnchor](v5->_subtitleLabel, "topAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel bottomAnchor](v5->_titleLabel, "bottomAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "constraintEqualToAnchor:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v87[2] = v50;
      -[UILabel bottomAnchor](v5->_subtitleLabel, "bottomAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHWidgetWrapperView bottomAnchor](v5, "bottomAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintEqualToAnchor:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v87[3] = v53;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 4);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "activateConstraints:", v54);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "addObserver:selector:name:object:", v5, sel__contentSizeCategoryDidChange, *MEMORY[0x1E0DC48E8], 0);

      objc_opt_self();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v56;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (id)-[SBHWidgetWrapperView registerForTraitChanges:withAction:](v5, "registerForTraitChanges:withAction:", v57, sel__contentSizeCategoryDidChange);
    }
    else
    {
      v59 = (void *)MEMORY[0x1E0CB3718];
      -[UIView bottomAnchor](v5->_shadowedWidgetWrapperView, "bottomAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHWidgetWrapperView bottomAnchor](v5, "bottomAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57, 0.0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v60;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "activateConstraints:", v61);

    }
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)SBHWidgetWrapperView;
  -[SBHWidgetWrapperView dealloc](&v4, sel_dealloc);
}

- (id)newPortaledShadowedWidgetView
{
  void *v3;
  void *v4;
  SBHPortaledShadowedWidgetView *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC42D8]), "initWithSourceView:", self->_contentView);
  objc_msgSend(v3, "setHidesSourceView:", 1);
  -[SBIconView bounds](self->_contentView, "bounds");
  objc_msgSend(v3, "setBounds:");
  objc_msgSend(v3, "setAllowsBackdropGroups:", 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC42D8]), "initWithSourceView:", self->_shadowView);
  objc_msgSend(v4, "setHidesSourceView:", 1);
  -[UIView bounds](self->_shadowView, "bounds");
  objc_msgSend(v4, "setBounds:");
  v5 = -[SBHPortaledShadowedWidgetView initWithContentView:shadowView:perspectiveEnabled:]([SBHPortaledShadowedWidgetView alloc], "initWithContentView:shadowView:perspectiveEnabled:", v3, v4, 0);
  -[SBHShadowedWidgetView bounds](self->_shadowedWidgetView, "bounds");
  -[SBHPortaledShadowedWidgetView setBounds:](v5, "setBounds:");

  return v5;
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[SBHWidgetWrapperView title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v5 & 1) == 0)
    -[UILabel setText:](self->_titleLabel, "setText:", v6);

}

- (NSString)subtitle
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)setSubtitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[SBHWidgetWrapperView subtitle](self, "subtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v5 & 1) == 0)
    -[UILabel setText:](self->_subtitleLabel, "setText:", v6);

}

- (void)setContentView:(id)a3
{
  SBIconView *v5;

  v5 = (SBIconView *)a3;
  if (self->_contentView != v5)
  {
    -[SBHWidgetWrapperView _applyBackgroundType:toView:](self, "_applyBackgroundType:toView:", 0);
    objc_storeStrong((id *)&self->_contentView, a3);
    -[SBHShadowedWidgetView setContentView:](self->_shadowedWidgetView, "setContentView:", v5);
    -[SBHWidgetWrapperView _applyBackgroundType](self, "_applyBackgroundType");
  }

}

- (void)setContentSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGSize *p_contentSize;

  height = a3.height;
  width = a3.width;
  p_contentSize = &self->_contentSize;
  if ((BSSizeEqualToSize() & 1) == 0)
  {
    p_contentSize->width = width;
    p_contentSize->height = height;
    -[SBHWidgetWrapperView _updateContentSizeConstraints](self, "_updateContentSizeConstraints");
    -[SBHWidgetWrapperView setNeedsLayout](self, "setNeedsLayout");
    -[SBHWidgetWrapperView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[SBHWidgetWrapperView _updateHoverAnimation](self, "_updateHoverAnimation");
  }
}

- (double)cornerRadius
{
  double result;

  -[SBHShadowedWidgetView cornerRadius](self->_shadowedWidgetView, "cornerRadius");
  return result;
}

- (void)setCornerRadius:(double)a3
{
  -[SBHShadowedWidgetView setCornerRadius:](self->_shadowedWidgetView, "setCornerRadius:", a3);
  -[SBHWidgetWrapperView _applyBackgroundType](self, "_applyBackgroundType");
}

- (UIView)containerView
{
  return (UIView *)self->_shadowedWidgetView;
}

- (void)setExtraSpacingBetweenWidgetAndTitle:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_extraSpacingBetweenWidgetAndTitle = a3;
    -[NSLayoutConstraint setConstant:](self->_widgetToTitleSpacingConstraint, "setConstant:", a3 + 5.0);
  }
}

- (void)setBackgroundType:(int64_t)a3
{
  if (self->_backgroundType != a3)
  {
    self->_backgroundType = a3;
    -[SBHWidgetWrapperView _applyBackgroundType](self, "_applyBackgroundType");
  }
}

- (void)setBackgroundView:(id)a3
{
  UIView *v5;
  UIView *backgroundView;
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
  SBIconView *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v5 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundView, a3);
    if (v5)
    {
      v23 = self->_contentView;
      -[SBIconView customIconImageViewController](v23, "customIconImageViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "insertSubview:atIndex:", v5, 0);
      -[SBHWidgetWrapperView setBackgroundType:](self, "setBackgroundType:", 2);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v17 = (void *)MEMORY[0x1E0CB3718];
      -[UIView leadingAnchor](v5, "leadingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->_shadowedWidgetWrapperView, "leadingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, 4.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v19;
      -[UIView trailingAnchor](v5, "trailingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_shadowedWidgetWrapperView, "trailingAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:constant:", v8, -4.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v9;
      -[UIView topAnchor](v5, "topAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self->_shadowedWidgetWrapperView, "topAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 4.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v12;
      -[UIView bottomAnchor](v5, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_shadowedWidgetWrapperView, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -4.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[3] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "activateConstraints:", v16);

    }
    else
    {
      -[SBHWidgetWrapperView setBackgroundType:](self, "setBackgroundType:", 0);
    }
  }

}

- (void)_updateContentSizeConstraints
{
  NSLayoutConstraint *contentHeightConstraint;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *v6;
  CGSize *p_contentSize;
  NSLayoutConstraint *contentWidthConstraint;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *v11;
  void *v12;
  NSLayoutConstraint *v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  contentHeightConstraint = self->_contentHeightConstraint;
  if (!contentHeightConstraint)
  {
    -[UIView heightAnchor](self->_shadowedWidgetWrapperView, "heightAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToConstant:", self->_contentSize.height);
    v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v6 = self->_contentHeightConstraint;
    self->_contentHeightConstraint = v5;

    contentHeightConstraint = self->_contentHeightConstraint;
  }
  p_contentSize = &self->_contentSize;
  -[NSLayoutConstraint setConstant:](contentHeightConstraint, "setConstant:", self->_contentSize.height);
  contentWidthConstraint = self->_contentWidthConstraint;
  if (!contentWidthConstraint)
  {
    -[UIView widthAnchor](self->_shadowedWidgetWrapperView, "widthAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToConstant:", p_contentSize->width);
    v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v11 = self->_contentWidthConstraint;
    self->_contentWidthConstraint = v10;

    contentWidthConstraint = self->_contentWidthConstraint;
  }
  -[NSLayoutConstraint setConstant:](contentWidthConstraint, "setConstant:", p_contentSize->width);
  v12 = (void *)MEMORY[0x1E0CB3718];
  v13 = self->_contentWidthConstraint;
  v15[0] = self->_contentHeightConstraint;
  v15[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activateConstraints:", v14);

}

- (void)_applyBackgroundType
{
  id v3;

  -[SBHWidgetWrapperView contentView](self, "contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetWrapperView _applyBackgroundType:toView:](self, "_applyBackgroundType:toView:", -[SBHWidgetWrapperView backgroundType](self, "backgroundType"), v3);

}

- (void)_applyBackgroundType:(int64_t)a3 toView:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  if (a3 == 1)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    -[SBHShadowedWidgetView cornerRadius](self->_shadowedWidgetView, "cornerRadius");
    objc_msgSend(v8, "_setContinuousCornerRadius:");
    goto LABEL_5;
  }
  if (!a3)
  {
    v8 = v6;
    objc_msgSend(v6, "setBackgroundColor:", 0);
LABEL_5:
    v6 = v8;
  }

}

- (CATransform3D)hoverTransform
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  CATransform3D *result;
  id v9;

  -[SBHWidgetWrapperView shadowedWidgetView](self, "shadowedWidgetView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "presentationLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v5;
  else
    v6 = v9;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "transform");
  }
  else
  {
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m43 = 0u;
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
    *(_OWORD *)&retstr->m23 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m13 = 0u;
  }

  return result;
}

- (void)_updateHoverAnimation
{
  void *v3;
  SBHShadowedWidgetView *shadowedWidgetView;
  double v5;
  uint32_t v6;
  void (**v7)(void *, const __CFString *, double, double, double, double);
  _QWORD v8[6];

  if (-[SBHWidgetWrapperView isHoverAnimationEnabled](self, "isHoverAnimationEnabled"))
  {
    -[SBHWidgetWrapperView window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    shadowedWidgetView = self->_shadowedWidgetView;
    if (v3)
    {
      -[SBHShadowedWidgetView setPerspectiveEnabled:](shadowedWidgetView, "setPerspectiveEnabled:", 1);
      v5 = dbl_1D0190D00[self->_contentSize.width > 200.0];
      v6 = arc4random_uniform(0x3E8u);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __45__SBHWidgetWrapperView__updateHoverAnimation__block_invoke;
      v8[3] = &unk_1E8D86DB0;
      *(double *)&v8[5] = (double)v6 * 0.001 * 8.0;
      v8[4] = self;
      v7 = (void (**)(void *, const __CFString *, double, double, double, double))_Block_copy(v8);
      v7[2](v7, CFSTR("x"), -v5, v5, 8.0, 0.0);
      v7[2](v7, CFSTR("y"), -v5, v5, 8.0, 0.5);
      v7[2](v7, CFSTR("z"), v5 / -5.0, v5 / 5.0, 16.0, 0.25);

    }
    else
    {
      -[SBHShadowedWidgetView setPerspectiveEnabled:](shadowedWidgetView, "setPerspectiveEnabled:", 0);
    }
  }
}

void __45__SBHWidgetWrapperView__updateHoverAnimation__block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  CAFrameRateRange v19;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("transform.rotation.%@"), a2);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFromValue:", v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setToValue:", v13);

  objc_msgSend(v11, "setBeginTime:", CACurrentMediaTime() - *(double *)(a1 + 40) - a6 * a5);
  objc_msgSend(v11, "setDuration:", a5);
  objc_msgSend(v11, "setAutoreverses:", 1);
  LODWORD(v14) = 1148846080;
  objc_msgSend(v11, "setRepeatCount:", v14);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimingFunction:", v15);

  objc_msgSend(v11, "setAdditive:", 1);
  v19 = CAFrameRateRangeMake(20.0, 60.0, 20.0);
  objc_msgSend(v11, "setPreferredFrameRateRange:", *(double *)&v19.minimum, *(double *)&v19.maximum, *(double *)&v19.preferred);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAnimation:forKey:", v11, v17);

}

- (id)_titleLabelFont
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC4AB8];
  -[SBHWidgetWrapperView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", v4, 4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_subititleLabelFont
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC4AB8];
  -[SBHWidgetWrapperView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", v4, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_contentSizeCategoryDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBHWidgetWrapperView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetWrapperView _titleLabelFont](self, "_titleLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  -[SBHWidgetWrapperView subtitleLabel](self, "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetWrapperView _subititleLabelFont](self, "_subititleLabelFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  -[SBHWidgetWrapperView setNeedsLayout](self, "setNeedsLayout");
}

- (SBIconView)contentView
{
  return self->_contentView;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isHoverAnimationEnabled
{
  return self->_hoverAnimationEnabled;
}

- (void)setHoverAnimationEnabled:(BOOL)a3
{
  self->_hoverAnimationEnabled = a3;
}

- (double)extraSpacingBetweenWidgetAndTitle
{
  return self->_extraSpacingBetweenWidgetAndTitle;
}

- (int64_t)backgroundType
{
  return self->_backgroundType;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (SBHShadowedWidgetView)shadowedWidgetView
{
  return self->_shadowedWidgetView;
}

- (UIView)shadowedWidgetWrapperView
{
  return self->_shadowedWidgetWrapperView;
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (NSLayoutConstraint)widgetToTitleSpacingConstraint
{
  return self->_widgetToTitleSpacingConstraint;
}

- (void)setWidgetToTitleSpacingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widgetToTitleSpacingConstraint, a3);
}

- (NSLayoutConstraint)contentHeightConstraint
{
  return self->_contentHeightConstraint;
}

- (void)setContentHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentHeightConstraint, a3);
}

- (NSLayoutConstraint)contentWidthConstraint
{
  return self->_contentWidthConstraint;
}

- (void)setContentWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentWidthConstraint, a3);
}

- (BOOL)titleAndSubtitleVisible
{
  return self->_titleAndSubtitleVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentHeightConstraint, 0);
  objc_storeStrong((id *)&self->_widgetToTitleSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_shadowedWidgetWrapperView, 0);
  objc_storeStrong((id *)&self->_shadowedWidgetView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
