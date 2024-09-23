@implementation _UISearchAtomView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (_UISearchAtomView)initWithFrame:(CGRect)a3
{
  _UISearchAtomView *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  _UISearchAtomViewVisualStyle *visualStyle;
  _UISearchAtomBackgroundView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  _UISearchAtomBackgroundView *backgroundView;
  UILabel *v17;
  UILabel *textLabel;
  double v19;
  UIImageView *v20;
  UIImageView *leadingImage;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
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
  objc_super v79;
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[10];

  v82[8] = *MEMORY[0x1E0C80C00];
  v79.receiver = self;
  v79.super_class = (Class)_UISearchAtomView;
  v3 = -[UIView initWithFrame:](&v79, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[_UIVisualStyleRegistry defaultRegistry](_UIVisualStyleRegistry, "defaultRegistry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_class();
    objc_msgSend(v4, "registerVisualStyleClass:forStylableClass:", v5, objc_opt_class());

    +[_UIVisualStyleRegistry registryForTraitEnvironment:](_UIVisualStyleRegistry, "registryForTraitEnvironment:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_msgSend(v6, "visualStyleClassForView:", v3);

    v8 = objc_msgSend([v7 alloc], "initWithInstance:", v3);
    visualStyle = v3->_visualStyle;
    v3->_visualStyle = (_UISearchAtomViewVisualStyle *)v8;

    v10 = [_UISearchAtomBackgroundView alloc];
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v15 = -[_UISearchAtomBackgroundView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], v12, v13, v14);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (_UISearchAtomBackgroundView *)v15;

    -[_UISearchAtomViewVisualStyle defaultFont](v3->_visualStyle, "defaultFont");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v11, v12, v13, v14);
    textLabel = v3->_textLabel;
    v3->_textLabel = v17;

    -[UILabel setAllowsDefaultTighteningForTruncation:](v3->_textLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    -[UILabel setFont:](v3->_textLabel, "setFont:", v78);
    -[UILabel setNumberOfLines:](v3->_textLabel, "setNumberOfLines:", 1);
    -[UILabel setTextAlignment:](v3->_textLabel, "setTextAlignment:", 4);
    LODWORD(v19) = 1132068864;
    -[UIView setContentCompressionResistancePriority:forAxis:](v3->_textLabel, "setContentCompressionResistancePriority:forAxis:", 0, v19);
    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_textLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v20 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", 0);
    leadingImage = v3->_leadingImage;
    v3->_leadingImage = v20;

    -[UIView setTintAdjustmentMode:](v3->_leadingImage, "setTintAdjustmentMode:", 1);
    LODWORD(v22) = 1148846080;
    -[UIView setContentCompressionResistancePriority:forAxis:](v3->_leadingImage, "setContentCompressionResistancePriority:forAxis:", 0, v22);
    LODWORD(v23) = 1148846080;
    -[UIView setContentCompressionResistancePriority:forAxis:](v3->_leadingImage, "setContentCompressionResistancePriority:forAxis:", 1, v23);
    LODWORD(v24) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](v3->_leadingImage, "setContentHuggingPriority:forAxis:", 0, v24);
    LODWORD(v25) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](v3->_leadingImage, "setContentHuggingPriority:forAxis:", 1, v25);
    -[_UISearchAtomView atomFont](v3, "atomFont");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v26, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v3->_leadingImage, "setPreferredSymbolConfiguration:", v27);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_leadingImage, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v3, "addSubview:", v3->_backgroundView);
    -[UIView addSubview:](v3, "addSubview:", v3->_leadingImage);
    -[UIView addSubview:](v3, "addSubview:", v3->_textLabel);
    -[_UISearchAtomView _updateColors](v3, "_updateColors");
    -[_UISearchAtomViewVisualStyle textVerticalPadding](v3->_visualStyle, "textVerticalPadding");
    v29 = v28;
    -[_UISearchAtomViewVisualStyle cornerRadius](v3->_visualStyle, "cornerRadius");
    v31 = v30;
    -[UIView _setContinuousCornerRadius:](v3->_backgroundView, "_setContinuousCornerRadius:");
    -[UIView _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:", v31);
    -[UIView widthAnchor](v3, "widthAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISearchAtomViewVisualStyle maximumFallbackWidth](v3->_visualStyle, "maximumFallbackWidth");
    objc_msgSend(v32, "constraintLessThanOrEqualToConstant:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISearchAtomView setMaximumAtomWidthConstraint:](v3, "setMaximumAtomWidthConstraint:", v33);

    -[UIView trailingAnchor](v3, "trailingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->_textLabel, "trailingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISearchAtomViewVisualStyle contentHorizontalPadding](v3->_visualStyle, "contentHorizontalPadding");
    objc_msgSend(v77, "constraintEqualToAnchor:constant:", v76);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = v75;
    -[UIView topAnchor](v3->_textLabel, "topAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v3, "topAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:constant:", v73, v29);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v82[1] = v72;
    -[UIView bottomAnchor](v3, "bottomAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v3->_textLabel, "bottomAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:constant:", v70, v29);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v82[2] = v69;
    -[UIView leadingAnchor](v3->_backgroundView, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v3, "leadingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v67);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v82[3] = v66;
    -[UIView trailingAnchor](v3->_backgroundView, "trailingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3, "trailingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v64);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v82[4] = v34;
    -[UIView topAnchor](v3->_backgroundView, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v3, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v82[5] = v37;
    -[UIView bottomAnchor](v3->_backgroundView, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v3, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v82[6] = v40;
    -[_UISearchAtomView maximumAtomWidthConstraint](v3, "maximumAtomWidthConstraint");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v82[7] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 8);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISearchAtomView setDefaultConstraints:](v3, "setDefaultConstraints:", v42);

    -[UIView centerYAnchor](v3->_leadingImage, "centerYAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v3->_textLabel, "centerYAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISearchAtomView setImageCenterYConstraint:](v3, "setImageCenterYConstraint:", v45);

    -[UIView lastBaselineAnchor](v3->_leadingImage, "lastBaselineAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView lastBaselineAnchor](v3->_textLabel, "lastBaselineAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISearchAtomView setImageBaselineConstraint:](v3, "setImageBaselineConstraint:", v48);

    -[UIView leadingAnchor](v3->_leadingImage, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v3, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISearchAtomViewVisualStyle contentHorizontalPadding](v3->_visualStyle, "contentHorizontalPadding");
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = v51;
    -[UIView leadingAnchor](v3->_textLabel, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->_leadingImage, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISearchAtomViewVisualStyle imageTextSpacing](v3->_visualStyle, "imageTextSpacing");
    objc_msgSend(v52, "constraintEqualToAnchor:constant:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v81[1] = v54;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISearchAtomView setWithImageConstraints:](v3, "setWithImageConstraints:", v55);

    -[UIView leadingAnchor](v3->_textLabel, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v3, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISearchAtomViewVisualStyle contentHorizontalPadding](v3->_visualStyle, "contentHorizontalPadding");
    objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v58;
    -[UIView leadingAnchor](v3->_leadingImage, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v3, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v80[1] = v61;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISearchAtomView setWithoutImageConstraints:](v3, "setWithoutImageConstraints:", v62);

  }
  return v3;
}

+ (id)defaultAtomBackgroundColorForTraitCollection:(id)a3
{
  id v3;
  _UISearchAtomView *v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(_UISearchAtomView);
  v5 = objc_msgSend(v3, "userInterfaceIdiom");

  +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_msgSend(v6, "visualStyleClassForStylableClass:", objc_opt_class());

  v8 = (void *)objc_msgSend([v7 alloc], "initWithInstance:", v4);
  objc_msgSend(v8, "defaultAtomBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_defaultAtomForegroundColorForTraitCollection:(id)a3
{
  id v3;
  _UISearchAtomView *v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(_UISearchAtomView);
  v5 = objc_msgSend(v3, "userInterfaceIdiom");

  +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_msgSend(v6, "visualStyleClassForStylableClass:", objc_opt_class());

  v8 = (void *)objc_msgSend([v7 alloc], "initWithInstance:", v4);
  objc_msgSend(v8, "defaultTextAndImageColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setAtomBackgroundColor:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    v6 = (void *)objc_opt_class();
    -[UIView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultAtomBackgroundColorForTraitCollection:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_atomBackgroundColor, v5);
  if (!v7)
  {

  }
  -[_UISearchAtomView _updateColors](self, "_updateColors");

}

- (void)_setAtomForegroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_customAtomForegroundColor, a3);
  -[_UISearchAtomView _updateColors](self, "_updateColors");
}

- (UIColor)_atomForegroundColor
{
  UIColor *customAtomForegroundColor;

  customAtomForegroundColor = self->_customAtomForegroundColor;
  if (customAtomForegroundColor)
    return customAtomForegroundColor;
  -[_UISearchAtomViewVisualStyle defaultTextAndImageColor](self->_visualStyle, "defaultTextAndImageColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIFont)atomFont
{
  return -[UILabel font](self->_textLabel, "font");
}

- (void)setAtomFont:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!v4)
  {
    -[_UISearchAtomViewVisualStyle defaultFont](self->_visualStyle, "defaultFont");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  -[UILabel setFont:](self->_textLabel, "setFont:", v4);
  +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](self->_leadingImage, "setPreferredSymbolConfiguration:", v5);
  -[UIView setNeedsLayout](self, "setNeedsLayout");

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int *v8;
  int *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UISearchAtomView;
  -[UIView updateConstraints](&v11, sel_updateConstraints);
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  -[UIImageView image](self->_leadingImage, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObjectsFromArray:", self->_defaultConstraints);
  if (v5)
  {
    objc_msgSend(v3, "addObjectsFromArray:", self->_withImageConstraints);
    objc_msgSend(v4, "addObjectsFromArray:", self->_withoutImageConstraints);
    -[UIImageView _currentImage](self->_leadingImage, "_currentImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasBaseline");

    if (v7)
      v8 = &OBJC_IVAR____UISearchAtomView__imageBaselineConstraint;
    else
      v8 = &OBJC_IVAR____UISearchAtomView__imageCenterYConstraint;
    if (v7)
      v9 = &OBJC_IVAR____UISearchAtomView__imageCenterYConstraint;
    else
      v9 = &OBJC_IVAR____UISearchAtomView__imageBaselineConstraint;
    v10 = v3;
  }
  else
  {
    objc_msgSend(v3, "addObjectsFromArray:", self->_withoutImageConstraints);
    objc_msgSend(v4, "addObjectsFromArray:", self->_withImageConstraints);
    v9 = &OBJC_IVAR____UISearchAtomView__imageCenterYConstraint;
    v8 = &OBJC_IVAR____UISearchAtomView__imageBaselineConstraint;
    v10 = v4;
  }
  objc_msgSend(v10, "addObject:", *(Class *)((char *)&self->super.super.super.isa + *v8));
  objc_msgSend(v4, "addObject:", *(Class *)((char *)&self->super.super.super.isa + *v9));
  objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", v4);
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v3);

}

- (void)_updateColors
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  _UISearchAtomViewVisualStyle *visualStyle;
  BOOL v8;
  void *v9;
  UIColor *v10;
  void *v11;
  void *v12;
  UIColor *v13;
  UIColor *v14;
  void *v15;
  UIColor *atomBackgroundColor;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  unint64_t v23;
  NSObject *v24;
  __int16 v25[8];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      __UIFaultDebugAssertLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v22, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }

    }
  }
  else if (!self)
  {
    v23 = _updateColors___s_category;
    if (!_updateColors___s_category)
    {
      v23 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v23, (unint64_t *)&_updateColors___s_category);
    }
    v24 = *(NSObject **)(v23 + 8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25[0] = 0;
      _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", (uint8_t *)v25, 2u);
    }
  }
  +[UITraitCollection _currentTraitCollectionIfExists]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v4);

  v5 = (void *)_UISetCurrentFallbackEnvironment(self);
  v6 = -[_UISearchAtomBackgroundView selectionStyle](self->_backgroundView, "selectionStyle");
  visualStyle = self->_visualStyle;
  if (v6)
    v8 = (*(_BYTE *)&self->_flags & 1) == 0;
  else
    v8 = 1;
  if (v8)
  {
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      -[_UISearchAtomViewVisualStyle defaultAtomBackgroundBlurEffect](visualStyle, "defaultAtomBackgroundBlurEffect");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->_atomBackgroundColor;
    }
    else
    {
      -[_UISearchAtomViewVisualStyle disabledAtomBackgroundBlurEffect](visualStyle, "disabledAtomBackgroundBlurEffect");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        +[UIColor clearColor](UIColor, "clearColor");
      }
      else
      {
        atomBackgroundColor = self->_atomBackgroundColor;
        -[_UISearchAtomViewVisualStyle disabledAlpha](self->_visualStyle, "disabledAlpha");
        -[UIColor colorWithAlphaComponent:](atomBackgroundColor, "colorWithAlphaComponent:");
      }
      v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v10;
    -[_UISearchAtomView _atomForegroundColor](self, "_atomForegroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UISearchAtomViewVisualStyle defaultSelectedAtomBackgroundColor](visualStyle, "defaultSelectedAtomBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      -[UIView tintColor](self, "tintColor");
      v13 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    -[_UISearchAtomViewVisualStyle defaultSelectedTextAndImageColor](self->_visualStyle, "defaultSelectedTextAndImageColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
  }
  -[_UISearchAtomViewVisualStyle updateColorsWithBackgroundColor:](self->_visualStyle, "updateColorsWithBackgroundColor:", v14);
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v14);
  -[_UISearchAtomBackgroundView setBlurEffect:](self->_backgroundView, "setBlurEffect:", v9);
  -[UIColor _luminanceDifferenceFromColor:](v14, "_luminanceDifferenceFromColor:", v15);
  v18 = v17;
  -[_UISearchAtomViewVisualStyle minimumTextConstrastRatio](self->_visualStyle, "minimumTextConstrastRatio");
  if (v18 < v19)
  {
    -[_UISearchAtomViewVisualStyle textContrastFallbackColor](self->_visualStyle, "textContrastFallbackColor");
    v20 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v20;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v15);
    -[UIView setTintColor:](self->_leadingImage, "setTintColor:", v15);
  }
  else
  {
    -[_UISearchAtomViewVisualStyle disabledAlpha](self->_visualStyle, "disabledAlpha");
    objc_msgSend(v15, "colorWithAlphaComponent:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v21);
    -[UIView setTintColor:](self->_leadingImage, "setTintColor:", v21);

  }
  _UIRestorePreviousFallbackEnvironment(v5);
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v3);

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISearchAtomView;
  -[UIView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[_UISearchAtomView _updateColors](self, "_updateColors");
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISearchAtomView;
  -[UIView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[_UISearchAtomView _updateColors](self, "_updateColors");
}

- (BOOL)isEnabled
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)setEnabled:(BOOL)a3
{
  -[_UISearchAtomView setEnabled:animated:](self, "setEnabled:animated:", a3, 0);
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  char flags;
  _BOOL4 v5;
  void *v7;
  void *v8;
  _QWORD aBlock[5];

  flags = (char)self->_flags;
  if (((((flags & 1) == 0) ^ a3) & 1) == 0)
  {
    v5 = a4;
    *(_BYTE *)&self->_flags = flags & 0xFE | a3;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __41___UISearchAtomView_setEnabled_animated___block_invoke;
    aBlock[3] = &unk_1E16B1B28;
    aBlock[4] = self;
    v7 = _Block_copy(aBlock);
    v8 = v7;
    if (v5)
      +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", self, 5242880, v7, 0, 0.35);
    else
      (*((void (**)(void *))v7 + 2))(v7);

  }
}

- (int64_t)selectionStyle
{
  return -[_UISearchAtomBackgroundView selectionStyle](self->_backgroundView, "selectionStyle");
}

- (void)setSelectionStyle:(int64_t)a3
{
  -[_UISearchAtomView setSelectionStyle:animated:](self, "setSelectionStyle:animated:", a3, 0);
}

- (void)setSelectionStyle:(int64_t)a3 animated:(BOOL)a4
{
  -[_UISearchAtomBackgroundView setSelectionStyle:](self->_backgroundView, "setSelectionStyle:", a3, a4);
  -[_UISearchAtomView _updateColors](self, "_updateColors");
}

- (void)setViewportWidth:(double)a3
{
  double v5;
  double v6;
  double v7;
  id v8;

  -[_UISearchAtomViewVisualStyle maximumAtomWidthFraction](self->_visualStyle, "maximumAtomWidthFraction");
  v6 = v5 * a3;
  -[_UISearchAtomViewVisualStyle maximumFallbackWidth](self->_visualStyle, "maximumFallbackWidth");
  if (v6 < v7)
    v6 = v7;
  -[_UISearchAtomView maximumAtomWidthConstraint](self, "maximumAtomWidthConstraint");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", v6);

}

- (double)viewportWidth
{
  void *v2;
  double v3;
  double v4;

  -[_UISearchAtomView maximumAtomWidthConstraint](self, "maximumAtomWidthConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constant");
  v4 = v3;

  return v4;
}

- (UIColor)atomBackgroundColor
{
  return self->_atomBackgroundColor;
}

- (_UISearchAtomBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (_UISearchAtomViewVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (NSArray)defaultConstraints
{
  return self->_defaultConstraints;
}

- (void)setDefaultConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSLayoutConstraint)maximumAtomWidthConstraint
{
  return self->_maximumAtomWidthConstraint;
}

- (void)setMaximumAtomWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_maximumAtomWidthConstraint, a3);
}

- (NSLayoutConstraint)imageBaselineConstraint
{
  return self->_imageBaselineConstraint;
}

- (void)setImageBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageBaselineConstraint, a3);
}

- (NSLayoutConstraint)imageCenterYConstraint
{
  return self->_imageCenterYConstraint;
}

- (void)setImageCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageCenterYConstraint, a3);
}

- (NSArray)withImageConstraints
{
  return self->_withImageConstraints;
}

- (void)setWithImageConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (NSArray)withoutImageConstraints
{
  return self->_withoutImageConstraints;
}

- (void)setWithoutImageConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (UILabel)textLabel
{
  return (UILabel *)objc_getProperty(self, a2, 504, 1);
}

- (void)setTextLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 504);
}

- (UIImageView)leadingImage
{
  return (UIImageView *)objc_getProperty(self, a2, 512, 1);
}

- (void)setLeadingImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 512);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingImage, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_withoutImageConstraints, 0);
  objc_storeStrong((id *)&self->_withImageConstraints, 0);
  objc_storeStrong((id *)&self->_imageCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_imageBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_maximumAtomWidthConstraint, 0);
  objc_storeStrong((id *)&self->_defaultConstraints, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_atomBackgroundColor, 0);
  objc_storeStrong((id *)&self->_customAtomForegroundColor, 0);
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)CFSTR("_UISearchAtomView");
}

@end
