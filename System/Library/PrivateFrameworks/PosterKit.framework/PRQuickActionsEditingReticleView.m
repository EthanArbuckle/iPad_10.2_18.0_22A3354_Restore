@implementation PRQuickActionsEditingReticleView

- (PRQuickActionsEditingReticleView)init
{
  PRQuickActionsEditingReticleView *v2;
  BSUIVibrancyEffectView *v3;
  BSUIVibrancyEffectView *vibrancyView;
  PREditingReticleView *v5;
  PREditingReticleView *reticleView;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UIImageView *plusImageView;
  UIImageView *v12;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)PRQuickActionsEditingReticleView;
  v2 = -[PRQuickActionsEditingReticleView init](&v35, sel_init);
  if (v2)
  {
    v3 = (BSUIVibrancyEffectView *)objc_alloc_init(MEMORY[0x1E0D01960]);
    vibrancyView = v2->_vibrancyView;
    v2->_vibrancyView = v3;

    -[BSUIVibrancyEffectView setUserInteractionEnabled:](v2->_vibrancyView, "setUserInteractionEnabled:", 0);
    -[BSUIVibrancyEffectView setBlurEnabled:](v2->_vibrancyView, "setBlurEnabled:", PREditingSupportsLiveBlurs());
    -[PRQuickActionsEditingReticleView addSubview:](v2, "addSubview:", v2->_vibrancyView);
    v5 = objc_alloc_init(PREditingReticleView);
    reticleView = v2->_reticleView;
    v2->_reticleView = v5;

    -[PREditingReticleView setAutoresizingMask:](v2->_reticleView, "setAutoresizingMask:", 18);
    -[BSUIVibrancyEffectView contentView](v2->_vibrancyView, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v2->_reticleView);

    v8 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemImageNamed:withConfiguration:", CFSTR("plus"), v9);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v34);
    plusImageView = v2->_plusImageView;
    v2->_plusImageView = (UIImageView *)v10;

    v12 = v2->_plusImageView;
    v13 = (void *)MEMORY[0x1E0DC3658];
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("PRReticleBorderColor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v15)
      v15 = &unk_1E21DD338;
    objc_msgSend(v15, "doubleValue");
    objc_msgSend(v13, "colorWithWhite:alpha:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v12, "setTintColor:", v17);

    -[UIImageView setContentMode:](v2->_plusImageView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v2->_plusImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[BSUIVibrancyEffectView contentView](v2->_vibrancyView, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v2->_plusImageView);

    -[UIImageView setHidden:](v2->_plusImageView, "setHidden:", 1);
    v28 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView heightAnchor](v2->_plusImageView, "heightAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRQuickActionsEditingReticleView heightAnchor](v2, "heightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:multiplier:", v32, 0.5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v31;
    -[UIImageView widthAnchor](v2->_plusImageView, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRQuickActionsEditingReticleView widthAnchor](v2, "widthAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:multiplier:", v29, 0.5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v19;
    -[UIImageView centerYAnchor](v2->_plusImageView, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRQuickActionsEditingReticleView centerYAnchor](v2, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v22;
    -[UIImageView centerXAnchor](v2->_plusImageView, "centerXAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRQuickActionsEditingReticleView centerXAnchor](v2, "centerXAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v26);

  }
  return v2;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PRQuickActionsEditingReticleView;
  -[PRQuickActionsEditingReticleView layoutSubviews](&v11, sel_layoutSubviews);
  -[PRQuickActionsEditingReticleView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[BSUIVibrancyEffectView setFrame:](self->_vibrancyView, "setFrame:");
  -[PREditingReticleView setFrame:](self->_reticleView, "setFrame:", v4, v6, v8, v10);
  -[PREditingReticleView setOutlineBorderCornerRadius:](self->_reticleView, "setOutlineBorderCornerRadius:", v10 * 0.5);
}

- (BOOL)isActive
{
  return -[PREditingReticleView isActive](self->_reticleView, "isActive");
}

- (void)setActive:(BOOL)a3
{
  -[PREditingReticleView setActive:](self->_reticleView, "setActive:", a3);
}

- (void)setShowsEmptyView:(BOOL)a3
{
  if (self->_showsEmptyView != a3)
  {
    self->_showsEmptyView = a3;
    -[UIImageView setHidden:](self->_plusImageView, "setHidden:", !a3);
  }
}

- (BOOL)showsEmptyView
{
  return self->_showsEmptyView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plusImageView, 0);
  objc_storeStrong((id *)&self->_reticleView, 0);
  objc_storeStrong((id *)&self->_vibrancyView, 0);
}

@end
