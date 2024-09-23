@implementation SLHighlightPillView

- (SLHighlightPillView)initWithHighlight:(id)a3 maxWidth:(double)a4 variant:(unint64_t)a5 shouldDrawBlur:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  uint64_t v11;
  SLHighlightPillView *v12;
  SLHighlightPillView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  objc_super v26;

  v6 = a6;
  v10 = a3;
  v11 = objc_opt_class();
  v26.receiver = self;
  v26.super_class = (Class)SLHighlightPillView;
  v12 = -[SLRemoteView initWithServiceProxyClass:maxWidth:](&v26, sel_initWithServiceProxyClass_maxWidth_, v11, a4);
  v13 = v12;
  if (v12)
  {
    -[SLHighlightPillView setHighlight:](v12, "setHighlight:", v10);
    -[SLHighlightPillView setShouldDrawBackgroundBlur:](v13, "setShouldDrawBackgroundBlur:", v6);
    -[SLHighlightPillView setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightPillView setBackgroundColor:](v13, "setBackgroundColor:", v14);

    v13->_variant = a5;
    -[SLHighlightPillView _setupBlurView](v13, "_setupBlurView");
    if (v6)
    {
      -[SLHighlightPillView chevronEffect](v13, "chevronEffect");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v15);
    -[SLHighlightPillView setChevronImageView:](v13, "setChevronImageView:", v16);
    -[SLHighlightPillView chevronImageView](v13, "chevronImageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[SLHighlightPillView chevronImageView](v13, "chevronImageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLRemoteView slotView](v13, "slotView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightPillView insertSubview:above:](v13, "insertSubview:above:", v18, v19);

    if (-[SLHighlightPillView _shouldDisplayDebugPillLabel](v13, "_shouldDisplayDebugPillLabel"))
    {
      SLFrameworkLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[SLHighlightPillView initWithHighlight:maxWidth:variant:shouldDrawBlur:].cold.1();

      -[SLHighlightPillView _setupDebugPillLabel](v13, "_setupDebugPillLabel");
    }
    -[SLHighlightPillView addTarget:action:forControlEvents:](v13, "addTarget:action:forControlEvents:", v13, sel__pillTapped_forEvent_, 64);
    if (-[SLHighlightPillView shouldShowContextMenu](v13, "shouldShowContextMenu"))
      -[SLHighlightPillView setContextMenuInteractionEnabled:](v13, "setContextMenuInteractionEnabled:", 1);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "userInterfaceIdiom");

    if (v22 == 1)
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v13);
      -[SLHighlightPillView setPointerInteraction:](v13, "setPointerInteraction:", v23);

      -[SLHighlightPillView pointerInteraction](v13, "pointerInteraction");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLHighlightPillView addInteraction:](v13, "addInteraction:", v24);

    }
    -[SLHighlightPillView refreshContextMenuItems](v13, "refreshContextMenuItems");

  }
  return v13;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  int v6;
  double v7;
  _QWORD v8[6];
  objc_super v9;

  v3 = a3;
  v5 = -[SLHighlightPillView isHighlighted](self, "isHighlighted");
  v9.receiver = self;
  v9.super_class = (Class)SLHighlightPillView;
  -[SLHighlightPillView setHighlighted:](&v9, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    v6 = -[SLHighlightPillView isHighlighted](self, "isHighlighted");
    v7 = 0.6;
    if (!v6)
      v7 = 1.0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38__SLHighlightPillView_setHighlighted___block_invoke;
    v8[3] = &unk_1E3794338;
    v8[4] = self;
    *(double *)&v8[5] = v7;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v8, 0.25);
  }
}

uint64_t __38__SLHighlightPillView_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (BOOL)_shouldDisplayDebugPillLabel
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!_os_feature_enabled_impl())
    return 0;
  -[SLHighlightPillView highlight](self, "highlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") == 0;

  return v5;
}

- (void)_setupBlurView
{
  id v3;
  void *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *blurView;
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
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UIVisualEffectView *)objc_msgSend(v3, "initWithEffect:", v4);
  blurView = self->_blurView;
  self->_blurView = v5;

  -[SLHighlightPillView addSubview:](self, "addSubview:", self->_blurView);
  -[SLHighlightPillView sendSubviewToBack:](self, "sendSubviewToBack:", self->_blurView);
  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_blurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)MEMORY[0x1E0CB3718];
  -[UIVisualEffectView leadingAnchor](self->_blurView, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightPillView leadingAnchor](self, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  -[UIVisualEffectView trailingAnchor](self->_blurView, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightPillView trailingAnchor](self, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v7;
  -[UIVisualEffectView topAnchor](self->_blurView, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightPillView topAnchor](self, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v10;
  -[UIVisualEffectView bottomAnchor](self->_blurView, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightPillView bottomAnchor](self, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v14);

  -[UIVisualEffectView setHidden:](self->_blurView, "setHidden:", 1);
  -[UIVisualEffectView setUserInteractionEnabled:](self->_blurView, "setUserInteractionEnabled:", 0);
}

- (UIVisualEffect)chevronEffect
{
  UIVisualEffect *chevronEffect;
  void *v4;
  void *v5;
  UIVisualEffect *v6;
  UIVisualEffect *v7;

  chevronEffect = self->_chevronEffect;
  if (!chevronEffect)
  {
    v4 = (void *)MEMORY[0x1E0DC3F08];
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "effectForBlurEffect:style:", v5, 1);
    v6 = (UIVisualEffect *)objc_claimAutoreleasedReturnValue();
    v7 = self->_chevronEffect;
    self->_chevronEffect = v6;

    chevronEffect = self->_chevronEffect;
  }
  return chevronEffect;
}

- (void)_setupDebugPillLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SLHighlightPillView setNoAttributionsDebugLabel:](self, "setNoAttributionsDebugLabel:", v4);

  -[SLHighlightPillView noAttributionsDebugLabel](self, "noAttributionsDebugLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", CFSTR("0 SLAttributions"));

  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightPillView noAttributionsDebugLabel](self, "noAttributionsDebugLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  -[SLHighlightPillView noAttributionsDebugLabel](self, "noAttributionsDebugLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserInteractionEnabled:", 0);

  -[SLHighlightPillView noAttributionsDebugLabel](self, "noAttributionsDebugLabel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SLHighlightPillView addSubview:](self, "addSubview:", v9);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SLHighlightPillView;
  -[SLHighlightPillView layoutSubviews](&v21, sel_layoutSubviews);
  if (-[SLRemoteView remoteContentIsLoaded](self, "remoteContentIsLoaded"))
  {
    -[SLRemoteView lastRenderedSlotStyle](self, "lastRenderedSlotStyle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[SLHighlightPillView frame](self, "frame");
      v5 = v4 * 0.5;
      -[SLRemoteView lastRenderedSlotStyle](self, "lastRenderedSlotStyle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = SLRoundToScale(v5, (double)objc_msgSend(v6, "displayScale"));

      if (v7 != 0.0)
      {
        -[SLHighlightPillView _continuousCornerRadius](self, "_continuousCornerRadius");
        if (!SL_CGFloatApproximatelyEqualToFloat(v8, v7))
        {
          -[SLHighlightPillView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", v7);
          -[SLHighlightPillView blurView](self, "blurView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_setContinuousCornerRadius:", v7);

        }
      }
    }
  }
  if (-[SLHighlightPillView _shouldDisplayDebugPillLabel](self, "_shouldDisplayDebugPillLabel"))
  {
    if (!-[SLRemoteView remoteContentIsLoaded](self, "remoteContentIsLoaded"))
    {
      -[SLRemoteView maxWidth](self, "maxWidth");
      v11 = v10;
      -[SLRemoteView maxWidth](self, "maxWidth");
      -[SLHighlightPillView expectedHeightForMaxWidth:](self, "expectedHeightForMaxWidth:");
      v13 = v12;
      -[SLHighlightPillView noAttributionsDebugLabel](self, "noAttributionsDebugLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "intrinsicContentSize");
      v16 = v11 * 0.5 - v15 * 0.5;

      -[SLHighlightPillView noAttributionsDebugLabel](self, "noAttributionsDebugLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "intrinsicContentSize");
      v19 = v13 * 0.5 - v18 * 0.5;

      -[SLHighlightPillView noAttributionsDebugLabel](self, "noAttributionsDebugLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setFrame:", v16, v19, v11, v13);

    }
  }
}

- (double)expectedHeightForMaxWidth:(double)a3
{
  double v5;
  void *v6;
  SLDHighlightPillEmptySlotContent *v7;
  void *v8;
  SLDHighlightPillEmptySlotContent *v9;
  double v10;
  double v11;

  -[SLRemoteView maxWidth](self, "maxWidth");
  if (SL_CGFloatApproximatelyEqualToFloat(a3, v5)
    || (-[SLRemoteView lastRenderedSlotStyle](self, "lastRenderedSlotStyle"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    -[SLRemoteView slotView](self, "slotView");
    v9 = (SLDHighlightPillEmptySlotContent *)objc_claimAutoreleasedReturnValue();
    -[SLDHighlightPillEmptySlotContent intrinsicContentSize](v9, "intrinsicContentSize");
  }
  else
  {
    v7 = [SLDHighlightPillEmptySlotContent alloc];
    -[SLRemoteView lastRenderedSlotStyle](self, "lastRenderedSlotStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SLDHighlightPillEmptySlotContent initWithStyle:variant:maxWidth:forRemote:](v7, "initWithStyle:variant:maxWidth:forRemote:", v8, -[SLHighlightPillView variant](self, "variant"), 0, a3);

    -[SLDEmptySlotContent contentSize](v9, "contentSize");
  }
  v11 = v10;

  return v11;
}

- (void)setShouldDrawBackgroundBlur:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_shouldDrawBackgroundBlur != a3)
  {
    self->_shouldDrawBackgroundBlur = a3;
    if (a3)
    {
      if (-[SLRemoteView remoteContentIsLoaded](self, "remoteContentIsLoaded"))
      {
        -[SLHighlightPillView blurView](self, "blurView");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setHidden:", 0);

      }
      -[SLHighlightPillView chevronImageView](self, "chevronImageView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[SLHighlightPillView chevronEffect](self, "chevronEffect");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEffect:", v5);

    }
    else
    {
      -[SLHighlightPillView chevronImageView](self, "chevronImageView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEffect:", 0);

      -[SLHighlightPillView blurView](self, "blurView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", 1);
    }

  }
}

- (void)setBlurEffectGroupName:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  if (!-[NSString isEqualToString:](self->_blurEffectGroupName, "isEqualToString:", v4))
  {
    -[SLHighlightPillView blurView](self, "blurView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setGroupName:", v4);

    SLFrameworkLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[SLHighlightPillView setBlurEffectGroupName:].cold.1((uint64_t)self, (uint64_t)v4, v6);

  }
}

- (void)setPreferredBackgroundColor:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if ((objc_msgSend(v12, "isEqual:", self->_preferredBackgroundColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredBackgroundColor, a3);
    if (-[SLHighlightPillView shouldDrawBackgroundBlur](self, "shouldDrawBackgroundBlur")
      && (-[SLHighlightPillView blurView](self, "blurView"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      -[SLHighlightPillView blurView](self, "blurView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBackgroundColor:", v12);

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLHighlightPillView setBackgroundColor:](self, "setBackgroundColor:", v8);

    }
    else
    {
      -[SLHighlightPillView blurView](self, "blurView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v11);

      -[SLHighlightPillView setBackgroundColor:](self, "setBackgroundColor:", v12);
    }
  }

}

- (void)_configureChevronForSlotStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[5];

  v50[4] = *MEMORY[0x1E0C80C00];
  if (self->_chevronImageView)
  {
    v4 = a3;
    -[SLHighlightPillView lastChevronImageView](self, "lastChevronImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[SLHighlightPillView lastChevronImageView](self, "lastChevronImageView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromSuperview");

      -[SLHighlightPillView setLastChevronImageView:](self, "setLastChevronImageView:", 0);
    }
    +[SLHighlightPillMetrics chevronFontDescriptorWithStyle:variant:](SLHighlightPillMetrics, "chevronFontDescriptorWithStyle:variant:", v4, -[SLHighlightPillView variant](self, "variant"));
    v7 = objc_claimAutoreleasedReturnValue();

    v49 = (void *)v7;
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v7, 0.0);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceLayoutDirection");

    v11 = CFSTR("chevron.right");
    if (v10 == 1)
      v11 = CFSTR("chevron.left");
    v12 = (void *)MEMORY[0x1E0DC3888];
    v13 = v11;
    v48 = (void *)v8;
    objc_msgSend(v12, "configurationWithFont:scale:", v8, 1);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0DC3890]);
    v16 = (void *)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v47 = (void *)v14;
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "imageWithRenderingMode:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setImage:", v18);

    if (-[SLHighlightPillView variant](self, "variant") == 11
      || -[SLHighlightPillView variant](self, "variant") == 12
      || -[SLHighlightPillView variant](self, "variant") == 9)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v20 = (void *)v19;
    objc_msgSend(v16, "setTintColor:", v19);

    objc_msgSend(v16, "sizeToFit");
    -[UIVisualEffectView contentView](self->_chevronImageView, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v16);

    -[SLRemoteView lastRenderedSlotStyle](self, "lastRenderedSlotStyle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[SLRemoteView lastRenderedSlotStyle](self, "lastRenderedSlotStyle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[SLHighlightPillView variant](self, "variant");
      -[SLRemoteView maxWidth](self, "maxWidth");
      +[SLHighlightPillMetrics pillMarginsWithStyle:variant:maxWidth:](SLHighlightPillMetrics, "pillMarginsWithStyle:variant:maxWidth:", v23, v24);
      v26 = v25;

      -[UIVisualEffectView trailingAnchor](self->_chevronImageView, "trailingAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLHighlightPillView trailingAnchor](self, "trailingAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, -v26);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIVisualEffectView trailingAnchor](self->_chevronImageView, "trailingAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLHighlightPillView layoutMarginsGuide](self, "layoutMarginsGuide");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "trailingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToAnchor:", v30);
      v29 = objc_claimAutoreleasedReturnValue();

    }
    -[SLHighlightPillView chevronConstraints](self, "chevronConstraints");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    if (v32)
    {
      v33 = (void *)MEMORY[0x1E0CB3718];
      -[SLHighlightPillView chevronConstraints](self, "chevronConstraints");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "deactivateConstraints:", v34);

    }
    v50[0] = v29;
    -[UIVisualEffectView centerYAnchor](self->_chevronImageView, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightPillView centerYAnchor](self, "centerYAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v37;
    -[UIVisualEffectView widthAnchor](self->_chevronImageView, "widthAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "size");
    objc_msgSend(v38, "constraintEqualToConstant:");
    v46 = (void *)v29;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v39;
    -[UIVisualEffectView heightAnchor](self->_chevronImageView, "heightAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "size");
    objc_msgSend(v40, "constraintEqualToConstant:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightPillView setChevronConstraints:](self, "setChevronConstraints:", v43);

    v44 = (void *)MEMORY[0x1E0CB3718];
    -[SLHighlightPillView chevronConstraints](self, "chevronConstraints");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "activateConstraints:", v45);

    -[SLHighlightPillView setNeedsLayout](self, "setNeedsLayout");
    -[SLHighlightPillView setLastChevronImageView:](self, "setLastChevronImageView:", v16);

  }
}

+ (void)openMessagesForMessageGUID:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sms://open?message-guid=%@&overlay=1"), a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openURL:options:completionHandler:", v3, MEMORY[0x1E0C9AA70], 0);

  }
}

- (void)_pillTapped:(id)a3 forEvent:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SLTranscriptController *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  SLDisambiguationCollectionViewController *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;

  -[SLHighlightPillView _attributionIdentifiers](self, "_attributionIdentifiers", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[SLHighlightPillView highlight](self, "highlight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "attachmentGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v5, "count"))
  {
    -[SLHighlightPillView _viewControllerForAncestor](self, "_viewControllerForAncestor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_6;
  }
  else
  {
    v11 = 0;
    if (v6)
    {
LABEL_6:
      if (v6 == 1)
      {
        v12 = objc_alloc_init(SLTranscriptController);
        objc_msgSend(v5, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[SLTranscriptController presentTranscriptForMessageGUID:attachmentGUID:presentingViewController:](v12, "presentTranscriptForMessageGUID:attachmentGUID:presentingViewController:", v13, v10, v11);
        }
        else
        {
          SLFrameworkLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            -[SLHighlightPillView _pillTapped:forEvent:].cold.1(v31);

        }
        -[SLHighlightPillView highlight](self, "highlight");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "attributions");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        SLSendPortraitFeedbackTypeAppButtonForAttribution(v34);

      }
      else
      {
        -[SLHighlightPillView superview](self, "superview");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLHighlightPillView frame](self, "frame");
        objc_msgSend(v20, "convertRect:toView:", 0);
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v28 = v27;

        v29 = [SLDisambiguationCollectionViewController alloc];
        -[SLHighlightPillView highlight](self, "highlight");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[SLDisambiguationCollectionViewController initWithHighlight:](v29, "initWithHighlight:", v30);

        -[SLTranscriptController setModalPresentationStyle:](v12, "setModalPresentationStyle:", 5);
        -[SLTranscriptController setModalTransitionStyle:](v12, "setModalTransitionStyle:", 2);
        -[SLTranscriptController setAttributionViewFrame:](v12, "setAttributionViewFrame:", v22, v24, v26, v28);
        objc_msgSend(v11, "presentViewController:animated:completion:", v12, 0, 0);
      }
      goto LABEL_17;
    }
  }
  SLFrameworkLogHandle();
  v12 = (SLTranscriptController *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v12->super.super.super, OS_LOG_TYPE_ERROR))
    -[SLHighlightPillView _pillTapped:forEvent:].cold.2((uint64_t)self, &v12->super.super.super, v14, v15, v16, v17, v18, v19);
LABEL_17:

}

- (id)_attributionIdentifiers
{
  NSArray *attributionIdentifiers;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  attributionIdentifiers = self->_attributionIdentifiers;
  if (!attributionIdentifiers || !-[NSArray count](attributionIdentifiers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightPillView highlight](self, "highlight");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[SLHighlightPillView highlight](self, "highlight", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "attributions");
      v9 = objc_claimAutoreleasedReturnValue();

      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(v14, "uniqueIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              objc_msgSend(v14, "uniqueIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObject:", v16);

            }
          }
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v11);
      }
    }
    else
    {
      SLFrameworkLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SLHighlightPillView initWithHighlight:maxWidth:variant:shouldDrawBlur:].cold.1();
    }

    v17 = (NSArray *)objc_msgSend(v4, "copy");
    v18 = self->_attributionIdentifiers;
    self->_attributionIdentifiers = v17;

  }
  return self->_attributionIdentifiers;
}

- (void)remoteContentIsLoadedValueChanged
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SLHighlightPillView_remoteContentIsLoadedValueChanged__block_invoke;
  block[3] = &unk_1E3794360;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __56__SLHighlightPillView_remoteContentIsLoadedValueChanged__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v2 = objc_msgSend(*(id *)(a1 + 32), "remoteContentIsLoaded");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = objc_msgSend(v3, "shouldDrawBackgroundBlur") ^ 1;
    objc_msgSend(*(id *)(a1 + 32), "blurView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = v4;
  }
  else
  {
    objc_msgSend(v3, "blurView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 1;
  }
  objc_msgSend(v5, "setHidden:", v7);

  objc_msgSend(*(id *)(a1 + 32), "chevronImageView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 0);

}

- (void)renderRemoteContentForLayerContextID:(unint64_t)a3 style:(id)a4 yield:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  double v19;
  double v20;
  unint64_t v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint8_t buf[16];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  os_signpost_id_t v31;

  v8 = a4;
  v9 = a5;
  -[SLHighlightPillView _attributionIdentifiers](self, "_attributionIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLRemoteView serviceProxy](self, "serviceProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "synchronousRemoteService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count") && objc_msgSend(v12, "conformsToProtocol:", &unk_1EE3993A0))
  {
    v13 = v12;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    SLGeneralTelemetryLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_signpost_id_generate(v14);

    v31 = v15;
    SLGeneralTelemetryLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v29[3];
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199EFF000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v18, "HighlightPillTotalRender", ", buf, 2u);
    }

    -[SLRemoteView maxWidth](self, "maxWidth");
    v20 = v19;
    v21 = -[SLHighlightPillView variant](self, "variant");
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __72__SLHighlightPillView_renderRemoteContentForLayerContextID_style_yield___block_invoke;
    v22[3] = &unk_1E3795918;
    v22[4] = self;
    v23 = v8;
    v24 = v10;
    v26 = &v28;
    v25 = v9;
    objc_msgSend(v13, "highlightPillForAttributionIdentifiers:style:maxWidth:variant:layerContextID:reply:", v24, v23, v21, a3, v22, v20);

    _Block_object_dispose(&v28, 8);
  }

}

void __72__SLHighlightPillView_renderRemoteContentForLayerContextID_style_yield___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  id v10;
  id v11;
  __int128 v12;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__SLHighlightPillView_renderRemoteContentForLayerContextID_style_yield___block_invoke_2;
  block[3] = &unk_1E37958F0;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = v3;
  v11 = *(id *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 56);
  v5 = (id)v7;
  v12 = v7;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __72__SLHighlightPillView_renderRemoteContentForLayerContextID_style_yield___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "lastRenderedSlotStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(v2 + 8));

  if ((v4 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setLastRenderedSlotStyle:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_configureChevronForSlotStyle:", *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "setRemoteContentIsLoaded:", *(_QWORD *)(a1 + 48) != 0);
  if (*(_QWORD *)(a1 + 48))
  {
    SLGeneralTelemetryLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_199EFF000, v6, OS_SIGNPOST_INTERVAL_END, v7, "HighlightPillTotalRender", ", v9, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
    objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject highlightPillViewDidLoadNewRemoteContent:](v8, "highlightPillViewDidLoadNewRemoteContent:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    SLFrameworkLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __72__SLHighlightPillView_renderRemoteContentForLayerContextID_style_yield___block_invoke_2_cold_1((id *)v2);
  }

}

- (BOOL)shouldInvalidatePreviousPlaceHolderSlotContent:(id)a3 forStyle:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  int v14;
  void *v16;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    v9 = v8;
    if (v8
      && (v10 = objc_msgSend(v8, "variant"), v10 == -[SLHighlightPillView variant](self, "variant"))
      && (objc_msgSend(v9, "maxWidth"), v12 = v11, -[SLRemoteView maxWidth](self, "maxWidth"), v12 == v13))
    {
      objc_msgSend(v9, "style");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v16, "isEqual:", v7) ^ 1;

    }
    else
    {
      LOBYTE(v14) = 1;
    }

  }
  else
  {
    LOBYTE(v14) = 1;
  }

  return v14;
}

- (id)makePlaceholderSlotContentForStyle:(id)a3
{
  id v4;
  SLDHighlightPillEmptySlotContent *v5;
  unint64_t v6;
  SLDHighlightPillEmptySlotContent *v7;

  v4 = a3;
  v5 = [SLDHighlightPillEmptySlotContent alloc];
  v6 = -[SLHighlightPillView variant](self, "variant");
  -[SLRemoteView maxWidth](self, "maxWidth");
  v7 = -[SLDHighlightPillEmptySlotContent initWithStyle:variant:maxWidth:forRemote:](v5, "initWithStyle:variant:maxWidth:forRemote:", v4, v6, 0);

  return v7;
}

- (BOOL)shouldShowContextMenu
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;

  -[SLHighlightPillView highlight](self, "highlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "count");
  if (!v4)
  {
    SLFrameworkLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SLHighlightPillView shouldShowContextMenu].cold.1();

  }
  return v4 != 0;
}

- (BOOL)shouldShowReplyContextMenu
{
  void *v3;
  void *v4;
  NSObject *v5;
  BOOL v6;
  void *v7;
  int v8;
  NSObject *v9;

  -[SLHighlightPillView highlight](self, "highlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[SLHighlightPillView shouldShowContextMenu](self, "shouldShowContextMenu"))
  {
LABEL_6:
    v6 = 0;
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    SLFrameworkLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[SLHighlightPillView shouldShowReplyContextMenu].cold.2();

    goto LABEL_6;
  }
  v6 = 1;
LABEL_8:
  -[SLHighlightPillView excludedContextMenuIdentifiers](self, "excludedContextMenuIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", CFSTR("slReplyMenuItem"));

  if (v8)
  {
    SLFrameworkLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SLHighlightPillView shouldShowReplyContextMenu].cold.1();

    v6 = 0;
  }

  return v6;
}

- (void)refreshContextMenuItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  SLHighlightPillView *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SLHighlightPillView shouldShowContextMenu](self, "shouldShowContextMenu"))
  {
    -[SLHighlightPillView _uiActionItems](self, "_uiActionItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v4);

    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightPillView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[SLHighlightPillView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "additionalContextMenuItemsForHighlightPillView:", self);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v9;
    }
    if (objc_msgSend(v5, "count"))
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v24 = v5;
      v10 = v5;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (!v11)
        goto LABEL_27;
      v12 = v11;
      v13 = *(_QWORD *)v26;
      while (1)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = (void *)MEMORY[0x1E0CB3880];
            objc_msgSend(v15, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "predicateWithFormat:", CFSTR("identifier MATCHES %@"), v17);
            v18 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v3, "filteredArrayUsingPredicate:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v19, "count"))
            {
              SLFrameworkLogHandle();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v15, "identifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218242;
                v30 = self;
                v31 = 2112;
                v32 = v21;
                _os_log_error_impl(&dword_199EFF000, v20, OS_LOG_TYPE_ERROR, "[SLHighlightPillView: %p] Skipping adding context menu item with identifier %@ provided by delegate as its already present", buf, 0x16u);
                goto LABEL_25;
              }
            }
            else
            {
              objc_msgSend(v3, "addObject:", v15);
              SLFrameworkLogHandle();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v15, "identifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218242;
                v30 = self;
                v31 = 2112;
                v32 = v21;
                _os_log_debug_impl(&dword_199EFF000, v20, OS_LOG_TYPE_DEBUG, "[SLHighlightPillView: %p] Adding context menu item with identifier %@ provided by delegate ", buf, 0x16u);
LABEL_25:

              }
            }

LABEL_21:
            goto LABEL_22;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v3, "addObject:", v15);
            SLFrameworkLogHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              goto LABEL_22;
            objc_msgSend(v15, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v30 = self;
            v31 = 2112;
            v32 = v19;
            _os_log_debug_impl(&dword_199EFF000, v18, OS_LOG_TYPE_DEBUG, "[SLHighlightPillView: %p] Adding context menu item with identifier %@ provided by delegate ", buf, 0x16u);
            goto LABEL_21;
          }
          SLFrameworkLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            v30 = self;
            v31 = 2112;
            v32 = v15;
            _os_log_error_impl(&dword_199EFF000, v18, OS_LOG_TYPE_ERROR, "[SLHighlightPillView: %p] Not adding invalid context menu item %@ provided by delegate.", buf, 0x16u);
          }
LABEL_22:

          ++v14;
        }
        while (v12 != v14);
        v22 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        v12 = v22;
        if (!v22)
        {
LABEL_27:

          v5 = v24;
          break;
        }
      }
    }

  }
  v23 = (void *)objc_msgSend(v3, "copy");
  -[SLHighlightPillView setContextMenuItems:](self, "setContextMenuItems:", v23);

}

- (void)excludeContextMenuItemsWithIdentifiers:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightPillView setExcludedContextMenuIdentifiers:](self, "setExcludedContextMenuIdentifiers:", v4);

    -[SLHighlightPillView refreshContextMenuItems](self, "refreshContextMenuItems");
  }

}

- (id)_uiActionItems
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SLHighlightPillView shouldShowReplyContextMenu](self, "shouldShowReplyContextMenu"))
  {
    -[SLHighlightPillView replyAction](self, "replyAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v3, "addObject:", v4);

  }
  -[SLHighlightPillView excludedContextMenuIdentifiers](self, "excludedContextMenuIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("slHideMenuItem"));

  if ((v6 & 1) != 0)
  {
    SLFrameworkLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[SLHighlightPillView _uiActionItems].cold.1();

  }
  else
  {
    -[SLHighlightPillView hideAction](self, "hideAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v3, "addObject:", v8);

  }
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (UIAction)replyAction
{
  UIAction *replyAction;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIAction *v8;
  UIAction *v9;
  _QWORD v11[4];
  id v12;
  id location;

  replyAction = self->_replyAction;
  if (!replyAction)
  {
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E0DC3428];
    SLFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("REPLY_CONTEXTMENU"), &stru_1E3797070, CFSTR("SocialLayer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrowshape.turn.up.left"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __34__SLHighlightPillView_replyAction__block_invoke;
    v11[3] = &unk_1E3795940;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v6, v7, CFSTR("slReplyMenuItem"), v11);
    v8 = (UIAction *)objc_claimAutoreleasedReturnValue();
    v9 = self->_replyAction;
    self->_replyAction = v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    replyAction = self->_replyAction;
  }
  return replyAction;
}

void __34__SLHighlightPillView_replyAction__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_replyMenuItemSelected");

}

- (UIAction)hideAction
{
  UIAction *hideAction;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIAction *v8;
  UIAction *v9;
  _QWORD v11[4];
  id v12;
  id location;

  hideAction = self->_hideAction;
  if (!hideAction)
  {
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E0DC3428];
    SLFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("HIDE_CONTEXTMENU"), &stru_1E3797070, CFSTR("SocialLayer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("minus.circle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __33__SLHighlightPillView_hideAction__block_invoke;
    v11[3] = &unk_1E3795940;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v6, v7, CFSTR("slHideMenuItem"), v11);
    v8 = (UIAction *)objc_claimAutoreleasedReturnValue();
    v9 = self->_hideAction;
    self->_hideAction = v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    hideAction = self->_hideAction;
  }
  return hideAction;
}

void __33__SLHighlightPillView_hideAction__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  SLFrameworkLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199EFF000, v2, OS_LOG_TYPE_INFO, "SLHighlightPillView: Performing hide context menu action.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_hideMenuItemSelected");

}

- (void)_replyMenuItemSelected
{
  NSObject *v3;
  int v4;
  SLHighlightPillView *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SLFrameworkLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_INFO, "[SLHighlightPillView %p] Performing reply context menu action.", (uint8_t *)&v4, 0xCu);
  }

  -[SLHighlightPillView _pillTapped:forEvent:](self, "_pillTapped:forEvent:", 0, 0);
}

- (void)_hideMenuItemSelected
{
  OUTLINED_FUNCTION_4(&dword_199EFF000, a2, a3, "[SLHighlightPillView %p] _hideMenuItemSelected: Unable to perform hide context menu action without an application identifier.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __44__SLHighlightPillView__hideMenuItemSelected__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SLFrameworkLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218242;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_199EFF000, v7, OS_LOG_TYPE_INFO, "[SLHighlightPillView %p] _hideMenuItemSelected: Sent hide feedback for highlight: %@. Posting highlights deleted notification.", (uint8_t *)&v10, 0x16u);

    }
    notify_post("com.apple.spotlight.SyndicatedContentDeleted");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __44__SLHighlightPillView__hideMenuItemSelected__block_invoke_cold_1(a1);

  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__SLHighlightPillView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v5[3] = &unk_1E3795968;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", CFSTR("slContextMenu"), 0, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __77__SLHighlightPillView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "refreshContextMenuItems");
  v2 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(*(id *)(a1 + 32), "contextMenuItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuWithTitle:image:identifier:options:children:", &stru_1E3797070, 0, CFSTR("slContextMenu"), 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_targetedPreviewForInteraction:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  -[SLHighlightPillView frame](self, "frame");
  v6 = v5 * 0.5;
  -[SLRemoteView lastRenderedSlotStyle](self, "lastRenderedSlotStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SLRoundToScale(v6, (double)objc_msgSend(v7, "displayScale"));

  if (-[SLHighlightPillView shouldDrawBackgroundBlur](self, "shouldDrawBackgroundBlur"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v8);

  }
  v9 = (void *)MEMORY[0x1E0DC3508];
  -[SLHighlightPillView bounds](self, "bounds");
  objc_msgSend(v9, "bezierPathWithRoundedRect:cornerRadius:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVisiblePath:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", self, v4);
  return v11;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;

  v5 = a3;
  -[SLHighlightPillView interactions](self, "interactions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if (v7)
  {
    -[SLHighlightPillView _targetedPreviewForInteraction:](self, "_targetedPreviewForInteraction:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a3;
  -[SLHighlightPillView pointerInteraction](self, "pointerInteraction");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
    v10 = v7;
  else
    v10 = 0;

  return v10;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  -[SLHighlightPillView pointerInteraction](self, "pointerInteraction");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    -[SLHighlightPillView _targetedPreviewForInteraction:](self, "_targetedPreviewForInteraction:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v9, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (SLHighlightPillViewDelegate)delegate
{
  return (SLHighlightPillViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SLHighlight)highlight
{
  return self->_highlight;
}

- (void)setHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_highlight, a3);
}

- (BOOL)shouldDrawBackgroundBlur
{
  return self->_shouldDrawBackgroundBlur;
}

- (NSArray)contextMenuItems
{
  return self->_contextMenuItems;
}

- (void)setContextMenuItems:(id)a3
{
  objc_storeStrong((id *)&self->_contextMenuItems, a3);
}

- (NSString)blurEffectGroupName
{
  return self->_blurEffectGroupName;
}

- (UIColor)preferredBackgroundColor
{
  return self->_preferredBackgroundColor;
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (UIVisualEffectView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setChevronImageView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronImageView, a3);
}

- (void)setChevronEffect:(id)a3
{
  objc_storeStrong((id *)&self->_chevronEffect, a3);
}

- (UIImageView)lastChevronImageView
{
  return self->_lastChevronImageView;
}

- (void)setLastChevronImageView:(id)a3
{
  objc_storeStrong((id *)&self->_lastChevronImageView, a3);
}

- (UILabel)noAttributionsDebugLabel
{
  return self->_noAttributionsDebugLabel;
}

- (void)setNoAttributionsDebugLabel:(id)a3
{
  objc_storeStrong((id *)&self->_noAttributionsDebugLabel, a3);
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteraction, a3);
}

- (NSArray)attributionIdentifiers
{
  return self->_attributionIdentifiers;
}

- (void)setAttributionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_attributionIdentifiers, a3);
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

- (NSSet)excludedContextMenuIdentifiers
{
  return self->_excludedContextMenuIdentifiers;
}

- (void)setExcludedContextMenuIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_excludedContextMenuIdentifiers, a3);
}

- (void)setReplyAction:(id)a3
{
  objc_storeStrong((id *)&self->_replyAction, a3);
}

- (void)setHideAction:(id)a3
{
  objc_storeStrong((id *)&self->_hideAction, a3);
}

- (NSArray)chevronConstraints
{
  return self->_chevronConstraints;
}

- (void)setChevronConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_chevronConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronConstraints, 0);
  objc_storeStrong((id *)&self->_hideAction, 0);
  objc_storeStrong((id *)&self->_replyAction, 0);
  objc_storeStrong((id *)&self->_excludedContextMenuIdentifiers, 0);
  objc_storeStrong((id *)&self->_attributionIdentifiers, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_noAttributionsDebugLabel, 0);
  objc_storeStrong((id *)&self->_lastChevronImageView, 0);
  objc_storeStrong((id *)&self->_chevronEffect, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_preferredBackgroundColor, 0);
  objc_storeStrong((id *)&self->_blurEffectGroupName, 0);
  objc_storeStrong((id *)&self->_contextMenuItems, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithHighlight:maxWidth:variant:shouldDrawBlur:.cold.1()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_4();
  objc_msgSend(v0, "highlight");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_199EFF000, v3, v4, "[SLHighlightPillView: %p] Highlight does not have any attributions! We won't be able to display a pill for this highlight: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

- (void)setBlurEffectGroupName:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_199EFF000, log, OS_LOG_TYPE_DEBUG, "[SLHighlightPillView: %p] blurEffectGroupName set to: '%@'", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)_pillTapped:(os_log_t)log forEvent:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_199EFF000, log, OS_LOG_TYPE_ERROR, "Presenting view controller is nil.", v1, 2u);
}

- (void)_pillTapped:(uint64_t)a3 forEvent:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_199EFF000, a2, a3, "[SLHighlightPillView: %p] User tapped the pill, but we don't have any attribution identifiers?", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __72__SLHighlightPillView_renderRemoteContentForLayerContextID_style_yield___block_invoke_2_cold_1(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*a1, "maxWidth");
  OUTLINED_FUNCTION_7(&dword_199EFF000, v1, v2, "[SLHighlightPillView: %p] sociallayerd returned nil remote content for attribution ID: [%@], maxWidth: [%f]", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)shouldShowContextMenu
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_4();
  objc_msgSend(v0, "highlight");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_199EFF000, v3, v4, "[SLHighlightPillView: %p] No context menu since no attributions found on highlight %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

- (void)shouldShowReplyContextMenu
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_4();
  objc_msgSend(v0, "highlight");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_199EFF000, v3, v4, "[SLHighlightPillView: %p] No reply context menu item for Highlight:%@ with multiple attributions", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

- (void)_uiActionItems
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_4();
  objc_msgSend(v0, "highlight");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_199EFF000, v3, v4, "[SLHighlightPillView: %p] No Hide context menu item for Highlight:%@ since it was asked to be excluded", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

void __44__SLHighlightPillView__hideMenuItemSelected__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7(&dword_199EFF000, v1, v2, "[SLHighlightPillView %p] _hideMenuItemSelected error sending hide feedback for highlight: [%@] error: [%@].", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_4_0();
}

@end
