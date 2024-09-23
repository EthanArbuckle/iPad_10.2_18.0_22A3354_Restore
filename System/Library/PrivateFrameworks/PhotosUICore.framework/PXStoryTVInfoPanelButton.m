@implementation PXStoryTVInfoPanelButton

- (PXStoryTVInfoPanelButton)initWithFrame:(CGRect)a3
{
  PXStoryTVInfoPanelButton *v3;
  PXStoryTVInfoPanelButton *v4;
  _UIFloatingContentView *v5;
  _UIFloatingContentView *floatingContentView;
  _UIFloatingContentView *v7;
  void *v8;
  _UIFloatingContentView *v9;
  void *v10;
  _UIFloatingContentView *v11;
  void *v12;
  _UIFloatingContentView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  UIVisualEffectView *backgroundEffectView;
  void *v25;
  UIView *v26;
  UIView *focusView;
  void *v28;
  void *v29;
  void *v30;
  UILabel *v31;
  UILabel *label;
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
  id v47;
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
  objc_super v66;
  uint64_t v67;
  _QWORD v68[10];

  v68[8] = *MEMORY[0x1E0C80C00];
  v66.receiver = self;
  v66.super_class = (Class)PXStoryTVInfoPanelButton;
  v3 = -[PXStoryTVInfoPanelButton initWithFrame:](&v66, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXStoryTVInfoPanelButton setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXStoryTVInfoPanelButton setClipsToBounds:](v4, "setClipsToBounds:", 0);
    v5 = (_UIFloatingContentView *)objc_alloc_init(MEMORY[0x1E0DC4168]);
    floatingContentView = v4->_floatingContentView;
    v4->_floatingContentView = v5;

    -[_UIFloatingContentView setTranslatesAutoresizingMaskIntoConstraints:](v4->_floatingContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIFloatingContentView setClipsContentToBounds:](v4->_floatingContentView, "setClipsContentToBounds:", 1);
    -[_UIFloatingContentView setClipsToBounds:](v4->_floatingContentView, "setClipsToBounds:", 0);
    -[_UIFloatingContentView setShadowRadius:](v4->_floatingContentView, "setShadowRadius:", 18.0);
    -[_UIFloatingContentView setShadowVerticalOffset:](v4->_floatingContentView, "setShadowVerticalOffset:", 10.0);
    -[_UIFloatingContentView setShadowOpacity:](v4->_floatingContentView, "setShadowOpacity:", 0.3);
    -[_UIFloatingContentView setFocusedSizeIncrease:](v4->_floatingContentView, "setFocusedSizeIncrease:", 20.0);
    -[_UIFloatingContentView setContinuousCornerEnabled:](v4->_floatingContentView, "setContinuousCornerEnabled:", 1);
    -[_UIFloatingContentView setCornerRadius:](v4->_floatingContentView, "setCornerRadius:", 12.0);
    -[_UIFloatingContentView setContentMotionRotation:translation:](v4->_floatingContentView, "setContentMotionRotation:translation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 4.0, 4.0);
    v7 = v4->_floatingContentView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingContentView setBackgroundColor:forState:](v7, "setBackgroundColor:forState:", v8, 0);

    v9 = v4->_floatingContentView;
    _PXInfoMenuElementFocusViewColor();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingContentView setBackgroundColor:forState:](v9, "setBackgroundColor:forState:", v10, 8);

    v11 = v4->_floatingContentView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingContentView setBackgroundColor:forState:](v11, "setBackgroundColor:forState:", v12, 1);

    v13 = v4->_floatingContentView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingContentView setBackgroundColor:forState:](v13, "setBackgroundColor:forState:", v14, 4);

    -[_UIFloatingContentView visualEffectContainerView](v4->_floatingContentView, "visualEffectContainerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setClipsToBounds:", 1);

    -[_UIFloatingContentView visualEffectContainerView](v4->_floatingContentView, "visualEffectContainerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCornerRadius:", 12.0);

    v18 = *MEMORY[0x1E0CD2A68];
    -[_UIFloatingContentView visualEffectContainerView](v4->_floatingContentView, "visualEffectContainerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCornerCurve:", v18);

    -[PXStoryTVInfoPanelButton addSubview:](v4, "addSubview:", v4->_floatingContentView);
    v21 = objc_alloc(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 4017);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "initWithEffect:", v22);
    backgroundEffectView = v4->_backgroundEffectView;
    v4->_backgroundEffectView = (UIVisualEffectView *)v23;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v4->_backgroundEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView setAlpha:](v4->_backgroundEffectView, "setAlpha:", 0.0);
    -[_UIFloatingContentView visualEffectContainerView](v4->_floatingContentView, "visualEffectContainerView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v4->_backgroundEffectView);

    v26 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    focusView = v4->_focusView;
    v4->_focusView = v26;

    -[UIView _setContinuousCornerRadius:](v4->_focusView, "_setContinuousCornerRadius:", 12.0);
    _PXInfoMenuElementFocusViewColor();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_focusView, "setBackgroundColor:", v28);

    -[UIView setAlpha:](v4->_focusView, "setAlpha:", 0.0);
    -[_UIFloatingContentView contentView](v4->_floatingContentView, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    -[UIView setFrame:](v4->_focusView, "setFrame:");

    -[UIView setAutoresizingMask:](v4->_focusView, "setAutoresizingMask:", 18);
    -[UIView setClipsToBounds:](v4->_focusView, "setClipsToBounds:", 1);
    -[_UIFloatingContentView contentView](v4->_floatingContentView, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSubview:", v4->_focusView);

    v31 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v4->_label;
    v4->_label = v31;

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 30.0, *MEMORY[0x1E0DC1420]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_label, "setFont:", v33);

    _PXInfoMenuElementNormalColor();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_label, "setTextColor:", v34);

    -[_UIFloatingContentView contentView](v4->_floatingContentView, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bounds");
    PXRectGetCenter();
    -[UILabel setCenter:](v4->_label, "setCenter:");

    -[UILabel setAutoresizingMask:](v4->_label, "setAutoresizingMask:", 45);
    -[_UIFloatingContentView contentView](v4->_floatingContentView, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v4->_label);

    v56 = (void *)MEMORY[0x1E0CB3718];
    -[_UIFloatingContentView leftAnchor](v4->_floatingContentView, "leftAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryTVInfoPanelButton leftAnchor](v4, "leftAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v64);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v63;
    -[_UIFloatingContentView rightAnchor](v4->_floatingContentView, "rightAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryTVInfoPanelButton rightAnchor](v4, "rightAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v61);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v68[1] = v60;
    -[_UIFloatingContentView centerYAnchor](v4->_floatingContentView, "centerYAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryTVInfoPanelButton centerYAnchor](v4, "centerYAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v58);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v68[2] = v57;
    -[_UIFloatingContentView heightAnchor](v4->_floatingContentView, "heightAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryTVInfoPanelButton heightAnchor](v4, "heightAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v54, 0.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v68[3] = v53;
    -[UIVisualEffectView leftAnchor](v4->_backgroundEffectView, "leftAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingContentView leftAnchor](v4->_floatingContentView, "leftAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v51);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v68[4] = v50;
    -[UIVisualEffectView rightAnchor](v4->_backgroundEffectView, "rightAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingContentView rightAnchor](v4->_floatingContentView, "rightAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v68[5] = v38;
    -[UIVisualEffectView topAnchor](v4->_backgroundEffectView, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingContentView topAnchor](v4->_floatingContentView, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v68[6] = v41;
    -[UIVisualEffectView bottomAnchor](v4->_backgroundEffectView, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingContentView bottomAnchor](v4->_floatingContentView, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v68[7] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 8);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "activateConstraints:", v45);

    -[PXStoryTVInfoPanelButton setControlState:](v4, "setControlState:", 0);
    v67 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (id)-[PXStoryTVInfoPanelButton registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v46, sel__updateAppearance);

  }
  return v4;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v6 = a4;
  v8.receiver = self;
  v8.super_class = (Class)PXStoryTVInfoPanelButton;
  -[PXStoryTVInfoPanelButton didUpdateFocusInContext:withAnimationCoordinator:](&v8, sel_didUpdateFocusInContext_withAnimationCoordinator_, a3, v6);
  if (-[PXStoryTVInfoPanelButton isFocused](self, "isFocused"))
  {
    -[PXStoryTVInfoPanelButton superview](self, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bringSubviewToFront:", self);

  }
  -[PXStoryTVInfoPanelButton updateFocusState:](self, "updateFocusState:", v6);

}

- (unint64_t)elementControlState
{
  if (-[PXStoryTVInfoPanelButton isFocused](self, "isFocused"))
    return 8;
  else
    return 0;
}

- (id)elementTintColor
{
  if (-[PXStoryTVInfoPanelButton isFocused](self, "isFocused"))
    _PXInfoMenuElementFocusColor();
  else
    _PXInfoMenuElementNormalColor();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)text
{
  return -[UILabel text](self->_label, "text");
}

- (void)setText:(id)a3
{
  id v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UILabel text](self->_label, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v7)
  {

  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", v7);

    if ((v5 & 1) == 0)
    {
      -[UILabel setText:](self->_label, "setText:", v7);
      -[UILabel sizeToFit](self->_label, "sizeToFit");
      -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");

      PXRectGetCenter();
      -[UILabel setCenter:](self->_label, "setCenter:");
    }
  }

}

- (void)updateFocusState:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v4 = a3;
  -[_UIFloatingContentView setControlState:](self->_floatingContentView, "setControlState:", -[PXStoryTVInfoPanelButton elementControlState](self, "elementControlState"));
  -[PXStoryTVInfoPanelButton elementTintColor](self, "elementTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_label, "setTextColor:", v5);

  if (-[PXStoryTVInfoPanelButton isFocused](self, "isFocused"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__PXStoryTVInfoPanelButton_updateFocusState___block_invoke;
    v7[3] = &unk_1E5146C50;
    v7[4] = self;
    objc_msgSend(v4, "addCoordinatedFocusingAnimations:completion:", v7, 0);
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__PXStoryTVInfoPanelButton_updateFocusState___block_invoke_2;
    v6[3] = &unk_1E5146C50;
    v6[4] = self;
    objc_msgSend(v4, "addCoordinatedUnfocusingAnimations:completion:", v6, 0);
  }

}

- (void)setControlState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  UIView *focusView;
  double v12;
  void *v13;
  double v14;

  if (!a3)
  {
    _PXInfoMenuElementNormalColor();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_label, "setTextColor:", v10);

    focusView = self->_focusView;
    v9 = 0.0;
    v12 = 0.0;
LABEL_9:
    -[UIView setAlpha:](focusView, "setAlpha:", v12);
    _PXInfoMenuElementSelectedBackgroundColor();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_focusView, "setBackgroundColor:", v13);

    -[UILabel layer](self->_label, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 1.0;
    objc_msgSend(v7, "setShadowOpacity:", v14);
    goto LABEL_10;
  }
  if (a3 == 4)
  {
    if (_PXInfoMenuElementSelectedTextColor_onceToken != -1)
      dispatch_once(&_PXInfoMenuElementSelectedTextColor_onceToken, &__block_literal_global_51_292300);
    -[UILabel setTextColor:](self->_label, "setTextColor:", _PXInfoMenuElementSelectedTextColor_color);
    focusView = self->_focusView;
    v9 = 1.0;
    v12 = 1.0;
    goto LABEL_9;
  }
  if (a3 != 8)
    return;
  _PXInfoMenuElementFocusColor();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_label, "setTextColor:", v5);

  -[UIView setAlpha:](self->_focusView, "setAlpha:", 0.0);
  _PXInfoMenuElementFocusViewColor();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_focusView, "setBackgroundColor:", v6);

  -[UILabel layer](self->_label, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 0;
  objc_msgSend(v7, "setShadowOpacity:", v8);
  v9 = 1.0;
LABEL_10:

  -[UIVisualEffectView setAlpha:](self->_backgroundEffectView, "setAlpha:", v9);
  -[_UIFloatingContentView setControlState:](self->_floatingContentView, "setControlState:", a3);
}

- (void)_updateAppearance
{
  void *v3;
  id v4;

  if (-[PXStoryTVInfoPanelButton isFocused](self, "isFocused"))
  {
    _PXInfoMenuElementFocusViewColor();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_focusView, "setBackgroundColor:", v3);

  }
  -[PXStoryTVInfoPanelButton elementTintColor](self, "elementTintColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_label, "setTextColor:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_focusView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_floatingContentView, 0);
}

uint64_t __45__PXStoryTVInfoPanelButton_updateFocusState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
  _PXInfoMenuElementFocusViewColor();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setBackgroundColor:", v2);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0;
  objc_msgSend(v3, "setShadowOpacity:", v4);

  objc_msgSend(*(id *)(a1 + 32), "setControlState:", 8);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __45__PXStoryTVInfoPanelButton_updateFocusState___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
  _PXInfoMenuElementSelectedBackgroundColor();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setBackgroundColor:", v2);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setShadowOpacity:", v4);

  objc_msgSend(*(id *)(a1 + 32), "setControlState:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

+ (double)widthForText:(id)a3
{
  void *v3;
  double v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC1350];
  v4 = *MEMORY[0x1E0DC1420];
  v5 = a3;
  objc_msgSend(v3, "systemFontOfSize:weight:", 30.0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0DC1138];
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeWithAttributes:", v7);
  v9 = v8;

  return ceil(v9) + 40.0;
}

@end
