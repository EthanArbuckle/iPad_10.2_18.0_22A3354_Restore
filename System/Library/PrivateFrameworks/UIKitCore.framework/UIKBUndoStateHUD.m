@implementation UIKBUndoStateHUD

- (UIKBUndoStateHUD)initWithKeyboardAppearance:(int64_t)a3
{
  UIKBUndoStateHUD *v4;
  UIKBUndoStateHUD *v5;
  void *v6;
  UIKBUndoStyling *v7;
  UIKBUndoStyling *style;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  UILayoutGuide *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSLayoutConstraint *undoStateHUDWidthConstraint;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSLayoutConstraint *undoStateHUDHeightConstraint;
  UIVisualEffectView *v43;
  UIVisualEffectView *shadowView;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
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
  void *v67;
  void *v68;
  UIKBUndoHUDContainerView *v69;
  UIView *containerView;
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
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  UIVisualEffectView *v86;
  void *v87;
  void *v88;
  UIVisualEffectView *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  UILabel *v102;
  UILabel *labelView;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  UILayoutGuide *v112;
  UILayoutGuide *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  UIKBUndoStateHUD *v131;
  objc_super v133;
  void *v134;
  uint64_t v135;
  _QWORD v136[2];

  v136[1] = *MEMORY[0x1E0C80C00];
  v133.receiver = self;
  v133.super_class = (Class)UIKBUndoStateHUD;
  v4 = -[UIView init](&v133, sel_init);
  v5 = v4;
  if (v4)
  {
    if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      -[UIView traitCollection](v4, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "userInterfaceStyle") == 2)
        a3 = 1;
      else
        a3 = 2;

    }
    v7 = -[UIKBUndoStyling initWithKeyboardAppearance:isRTL:]([UIKBUndoStyling alloc], "initWithKeyboardAppearance:isRTL:", a3, 0);
    style = v5->_style;
    v5->_style = v7;

    v135 = *(_QWORD *)off_1E1678D90;
    -[UIKBUndoStyling undoStateControlLabelFont](v5->_style, "undoStateControlLabelFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v136[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v136, &v135, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _UILocalizedStringInSystemLanguage(CFSTR("UNDO_BUTTON_TITLE_LABEL_IN_HUD"), CFSTR("Undo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizeWithAttributes:", v10);
    v13 = v12 + 24.0;

    _UILocalizedStringInSystemLanguage(CFSTR("REDO_BUTTON_TITLE_LABEL_IN_HUD"), CFSTR("Redo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sizeWithAttributes:", v10);
    v16 = v15 + 24.0;

    _UILocalizedStringInSystemLanguage(CFSTR("Cut"), CFSTR("Cut"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sizeWithAttributes:", v10);
    v19 = v18 + 24.0;

    _UILocalizedStringInSystemLanguage(CFSTR("Copy"), CFSTR("Copy"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sizeWithAttributes:", v10);
    v22 = v21 + 24.0;

    _UILocalizedStringInSystemLanguage(CFSTR("Paste"), CFSTR("Paste"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sizeWithAttributes:", v10);
    v25 = v24 + 24.0;

    if (v13 >= v16)
      v26 = v13;
    else
      v26 = v16;
    if (v26 < v19)
      v26 = v19;
    if (v26 < v22)
      v26 = v22;
    if (v26 < v25)
      v26 = v25;
    if (v26 >= 100.0)
      v27 = v26;
    else
      v27 = 100.0;
    v28 = objc_alloc_init(UILayoutGuide);
    -[UIView addLayoutGuide:](v5, "addLayoutGuide:", v28);
    -[UILayoutGuide widthAnchor](v28, "widthAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintGreaterThanOrEqualToConstant:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setActive:", 1);

    -[UILayoutGuide heightAnchor](v28, "heightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToConstant:", 28.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setActive:", 1);

    -[UIView widthAnchor](v5, "widthAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide widthAnchor](v28, "widthAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, 0.0);
    v35 = objc_claimAutoreleasedReturnValue();
    undoStateHUDWidthConstraint = v5->_undoStateHUDWidthConstraint;
    v5->_undoStateHUDWidthConstraint = (NSLayoutConstraint *)v35;

    -[NSLayoutConstraint setActive:](v5->_undoStateHUDWidthConstraint, "setActive:", 1);
    -[UIView widthAnchor](v5, "widthAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintLessThanOrEqualToConstant:", 280.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setActive:", 1);

    -[UIView heightAnchor](v5, "heightAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide heightAnchor](v28, "heightAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, 0.0);
    v41 = objc_claimAutoreleasedReturnValue();
    undoStateHUDHeightConstraint = v5->_undoStateHUDHeightConstraint;
    v5->_undoStateHUDHeightConstraint = (NSLayoutConstraint *)v41;

    -[NSLayoutConstraint setActive:](v5->_undoStateHUDHeightConstraint, "setActive:", 1);
    v43 = objc_alloc_init(UIVisualEffectView);
    shadowView = v5->_shadowView;
    v5->_shadowView = v43;

    +[UIVibrancyEffect _vibrantShadowEffect](UIVibrancyEffect, "_vibrantShadowEffect");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v134, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setContentEffects:](v5->_shadowView, "setContentEffects:", v46);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_shadowView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setClipsToBounds:](v5, "setClipsToBounds:", 0);
    -[UIView addSubview:](v5, "addSubview:", v5->_shadowView);
    +[UIColor separatorColor](UIColor, "separatorColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5->_shadowView, "setBackgroundColor:", v47);

    -[UIView layer](v5->_shadowView, "layer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setMasksToBounds:", 0);

    -[UIView layer](v5->_shadowView, "layer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setCornerRadius:", 14.0);

    -[UIKBUndoStyling HUDShadowColor](v5->_style, "HUDShadowColor");
    v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v51 = objc_msgSend(v50, "CGColor");
    -[UIView layer](v5->_shadowView, "layer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setShadowColor:", v51);

    -[UIView layer](v5->_shadowView, "layer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setShadowOffset:", 0.0, 0.0);

    -[UIView layer](v5->_shadowView, "layer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v55) = 0.5;
    objc_msgSend(v54, "setShadowOpacity:", v55);

    -[UIView layer](v5->_shadowView, "layer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setShadowRadius:", 15.0);

    -[UIView centerXAnchor](v5->_shadowView, "centerXAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v5, "centerXAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setActive:", 1);

    -[UIView centerYAnchor](v5->_shadowView, "centerYAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v5, "centerYAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setActive:", 1);

    -[UIView widthAnchor](v5->_shadowView, "widthAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](v5, "widthAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setActive:", 1);

    -[UIView heightAnchor](v5->_shadowView, "heightAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v5, "heightAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setActive:", 1);

    v69 = objc_alloc_init(UIKBUndoHUDContainerView);
    containerView = v5->_containerView;
    v5->_containerView = &v69->super;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v5, "addSubview:", v5->_containerView);
    -[UIKBUndoStyling HUDbackgroundColor](v5->_style, "HUDbackgroundColor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5->_containerView, "setBackgroundColor:", v71);

    -[UIView layer](v5->_containerView, "layer");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setCornerRadius:", 14.0);

    -[UIView layer](v5->_containerView, "layer");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setAllowsHitTesting:", 0);

    -[UIView setClipsToBounds:](v5->_containerView, "setClipsToBounds:", 1);
    -[UIView leadingAnchor](v5->_containerView, "leadingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v5, "leadingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setActive:", 1);

    -[UIView trailingAnchor](v5, "trailingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v5->_containerView, "trailingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setActive:", 1);

    -[UIView centerYAnchor](v5->_containerView, "centerYAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v5, "centerYAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setActive:", 1);

    -[UIView heightAnchor](v5->_containerView, "heightAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v5, "heightAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:", v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setActive:", 1);

    v86 = [UIVisualEffectView alloc];
    -[UIKBUndoStateHUD style](v5, "style");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "backgroundVibrancyEffect");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = -[UIVisualEffectView initWithEffect:](v86, "initWithEffect:", v88);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v89, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v5->_containerView, "addSubview:", v89);
    -[UIView centerXAnchor](v89, "centerXAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v5, "centerXAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:", v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setActive:", 1);

    -[UIView centerYAnchor](v89, "centerYAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v5, "centerYAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setActive:", 1);

    -[UIView heightAnchor](v89, "heightAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v5, "heightAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintEqualToAnchor:multiplier:", v97, 1.0);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setActive:", 1);

    -[UIView widthAnchor](v89, "widthAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](v5->_containerView, "widthAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintEqualToAnchor:multiplier:", v100, 1.0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setActive:", 1);

    v102 = objc_alloc_init(UILabel);
    labelView = v5->_labelView;
    v5->_labelView = v102;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_labelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v5->_containerView, "addSubview:", v5->_labelView);
    -[UIKBUndoStyling buttonGlyphColorEnabled](v5->_style, "buttonGlyphColorEnabled");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_labelView, "setTextColor:", v104);

    -[UILabel setText:](v5->_labelView, "setText:", &stru_1E16EDF20);
    -[UILabel setTextAlignment:](v5->_labelView, "setTextAlignment:", 1);
    -[UIKBUndoStyling undoStateControlLabelFont](v5->_style, "undoStateControlLabelFont");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_labelView, "setFont:", v105);

    -[UIView setContentMode:](v5->_labelView, "setContentMode:", 4);
    -[UIView centerYAnchor](v5->_labelView, "centerYAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v5->_containerView, "centerYAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintEqualToAnchor:", v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setActive:", 1);

    -[UIView heightAnchor](v5->_labelView, "heightAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v5->_containerView, "heightAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "constraintEqualToAnchor:", v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "setActive:", 1);

    v112 = objc_alloc_init(UILayoutGuide);
    -[UIView addLayoutGuide:](v5, "addLayoutGuide:", v112);
    v113 = objc_alloc_init(UILayoutGuide);
    -[UIView addLayoutGuide:](v5, "addLayoutGuide:", v113);
    -[UILayoutGuide widthAnchor](v112, "widthAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintGreaterThanOrEqualToConstant:", 12.0);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "setActive:", 1);

    -[UILayoutGuide widthAnchor](v113, "widthAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide widthAnchor](v112, "widthAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "constraintEqualToAnchor:", v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "setActive:", 1);

    -[UILayoutGuide leadingAnchor](v112, "leadingAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v5->_containerView, "leadingAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "constraintEqualToAnchor:", v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "setActive:", 1);

    -[UIView leadingAnchor](v5->_labelView, "leadingAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v112, "trailingAnchor");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "constraintEqualToAnchor:", v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "setActive:", 1);

    -[UILayoutGuide leadingAnchor](v113, "leadingAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v5->_labelView, "trailingAnchor");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "constraintEqualToAnchor:", v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "setActive:", 1);

    -[UIView trailingAnchor](v5->_containerView, "trailingAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v113, "trailingAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "constraintEqualToAnchor:", v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "setActive:", 1);

    -[NSObject setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("UIUndoStateHUD"));
    v131 = v5;

  }
  return v5;
}

- (void)updateUndoStateHUDControlType:(int64_t)a3 available:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  UIKBUndoStyling *style;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a4;
  -[UIKBUndoStateHUD setControlType:](self, "setControlType:");
  +[UIKBUndoControl controlLableTextByType:style:available:](UIKBUndoControl, "controlLableTextByType:style:available:", a3, self->_style, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBUndoStateHUD labelView](self, "labelView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  style = self->_style;
  if (v4)
    -[UIKBUndoStyling buttonGlyphColorEnabled](style, "buttonGlyphColorEnabled");
  else
    -[UIKBUndoStyling buttonGlyphColorDisabled](style, "buttonGlyphColorDisabled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBUndoStateHUD labelView](self, "labelView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v10);

  if (v4)
    -[UIKBUndoStyling undoStateControlLabelFont](self->_style, "undoStateControlLabelFont");
  else
    -[UIKBUndoStyling undoStateControlUnavailableLabelFont](self->_style, "undoStateControlUnavailableLabelFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBUndoStateHUD labelView](self, "labelView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v12);

  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKBUndoStateHUD;
  -[UIView layoutSubviews](&v8, sel_layoutSubviews);
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceStyle") == 1)
    v4 = 2;
  else
    v4 = 1;

  -[UIKBUndoStateHUD style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppearance:", v4);

  -[UIView traitOverrides](self, "traitOverrides");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNSIntegerValue:forTrait:", v4, v7);

}

- (int64_t)controlType
{
  return self->_controlType;
}

- (void)setControlType:(int64_t)a3
{
  self->_controlType = a3;
}

- (NSLayoutConstraint)undoStateHUDWidthConstraint
{
  return self->_undoStateHUDWidthConstraint;
}

- (void)setUndoStateHUDWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_undoStateHUDWidthConstraint, a3);
}

- (NSLayoutConstraint)undoStateHUDHeightConstraint
{
  return self->_undoStateHUDHeightConstraint;
}

- (void)setUndoStateHUDHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_undoStateHUDHeightConstraint, a3);
}

- (UIVisualEffectView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UILabel)labelView
{
  return self->_labelView;
}

- (void)setLabelView:(id)a3
{
  objc_storeStrong((id *)&self->_labelView, a3);
}

- (UIKBUndoStyling)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_undoStateHUDHeightConstraint, 0);
  objc_storeStrong((id *)&self->_undoStateHUDWidthConstraint, 0);
}

@end
