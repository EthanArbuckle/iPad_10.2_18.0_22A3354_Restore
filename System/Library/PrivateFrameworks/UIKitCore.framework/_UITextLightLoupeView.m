@implementation _UITextLightLoupeView

- (_UITextLightLoupeView)initWithSourceView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _UITextLightLoupeView *v9;
  _UITextLightLoupeView *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  UIView *v18;
  uint64_t v19;
  UIView *maskView;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UIView *v26;
  UIView *portalContainerView;
  double v28;
  double v29;
  void *v30;
  void *v31;
  UIView *v32;
  uint64_t v33;
  UIView *backgroundView;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  UIView *v39;
  UIView *glowView;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  CADisplayLink *displayLink;
  CADisplayLink *v59;
  void *v60;
  _UIPortalView *v61;
  _UIPortalView *portalView;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v73;
  void *v74;
  _QWORD v75[2];
  int v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  int v84;
  uint64_t v85;
  objc_super v86;
  _QWORD v87[4];

  v87[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v86.receiver = self;
  v86.super_class = (Class)_UITextLightLoupeView;
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = -[UIView initWithFrame:](&v86, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_sourceView, v4);
    +[UIColor blackColor](UIColor, "blackColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v74 = v4;
    v12 = objc_msgSend(v11, "CGColor");
    -[UIView layer](v10, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShadowColor:", v12);

    -[UIView layer](v10, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setShadowOffset:", 0.0, 2.0);

    -[UIView layer](v10, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShadowRadius:", 22.0);

    -[UIView layer](v10, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = 1036831949;
    objc_msgSend(v16, "setShadowOpacity:", v17);

    v18 = [UIView alloc];
    -[UIView bounds](v10, "bounds");
    v19 = -[UIView initWithFrame:](v18, "initWithFrame:");
    maskView = v10->_maskView;
    v10->_maskView = (UIView *)v19;

    v21 = *MEMORY[0x1E0CD2A68];
    -[UIView layer](v10->_maskView, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCornerCurve:", v21);

    -[UIView layer](v10->_maskView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMasksToBounds:", 1);

    -[UIView layer](v10->_maskView, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCornerRadius:", 22.0);

    -[UIView layer](v10->_maskView, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBorderWidth:", 0.66);

    -[UIView addSubview:](v10, "addSubview:", v10->_maskView);
    v26 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v5, v6, v7, v8);
    portalContainerView = v10->_portalContainerView;
    v10->_portalContainerView = v26;

    v28 = *MEMORY[0x1E0C9D538];
    v29 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[UIView layer](v10->_portalContainerView, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAnchorPoint:", v28, v29);

    -[UIView addSubview:](v10->_maskView, "addSubview:", v10->_portalContainerView);
    objc_msgSend(v74, "window");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = [UIView alloc];
    objc_msgSend(v31, "frame");
    v33 = -[UIView initWithFrame:](v32, "initWithFrame:");
    backgroundView = v10->_backgroundView;
    v10->_backgroundView = (UIView *)v33;

    -[_UITextLightLoupeView _backgroundColorIfNecessary](v10, "_backgroundColorIfNecessary");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10->_backgroundView, "setBackgroundColor:", v35);

    -[UIView addSubview:](v10->_portalContainerView, "addSubview:", v10->_backgroundView);
    v75[0] = 0;
    v75[1] = 0;
    v76 = 1065353216;
    v78 = 0;
    v77 = 0;
    v79 = 1065353216;
    v80 = 0;
    v81 = 0;
    v82 = 1065353216;
    v83 = 0;
    v84 = 0;
    v85 = 0x3E6B851FBE6B851FLL;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v75);
    v36 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (void *)v36;
    objc_msgSend(v37, "setValue:forKey:", v36, *MEMORY[0x1E0CD2D20]);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setValue:forKey:", &unk_1E1A95DF0, *MEMORY[0x1E0CD2D90]);
    v39 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v5, v6, v7, v8);
    glowView = v10->_glowView;
    v10->_glowView = v39;

    +[UIColor blackColor](UIColor, "blackColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10->_glowView, "setBackgroundColor:", v41);

    v42 = *MEMORY[0x1E0CD2DE0];
    -[UIView layer](v10->_glowView, "layer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setCompositingFilter:", v42);

    v87[0] = v38;
    v87[1] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](v10->_glowView, "layer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFilters:", v44);

    -[UIView layer](v10->_glowView, "layer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setMasksToBounds:", 1);

    -[UIView layer](v10->_glowView, "layer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setCornerCurve:", v21);

    -[UIView layer](v10->_glowView, "layer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setCornerRadius:", 22.0);

    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "scale");
    v51 = v50;
    -[UIView layer](v10->_glowView, "layer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setRasterizationScale:", v51);

    -[UIView layer](v10->_glowView, "layer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setShouldRasterize:", 1);

    v4 = v74;
    -[UIView addSubview:](v10->_maskView, "addSubview:", v10->_glowView);
    objc_msgSend(v74, "window");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "screen");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
      v56 = v55;
    else
      v56 = (void *)MEMORY[0x1E0CD2730];
    objc_msgSend(v56, "displayLinkWithTarget:selector:", v10, sel__displayLinkFired_);
    v57 = objc_claimAutoreleasedReturnValue();
    displayLink = v10->_displayLink;
    v10->_displayLink = (CADisplayLink *)v57;

    -[CADisplayLink setPreferredFramesPerSecond:](v10->_displayLink, "setPreferredFramesPerSecond:", 60);
    v59 = v10->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v59, "addToRunLoop:forMode:", v60, *MEMORY[0x1E0C99748]);

    v61 = -[_UIPortalView initWithSourceView:]([_UIPortalView alloc], "initWithSourceView:", v31);
    portalView = v10->_portalView;
    v10->_portalView = v61;

    -[_UIPortalView setMatchesAlpha:](v10->_portalView, "setMatchesAlpha:", 1);
    -[_UIPortalView setMatchesTransform:](v10->_portalView, "setMatchesTransform:", 1);
    objc_msgSend(v31, "layer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "anchorPoint");
    v65 = v64;
    v67 = v66;
    -[UIView layer](v10->_portalView, "layer");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setAnchorPoint:", v65, v67);

    objc_msgSend(v31, "layer");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "frame");
    -[_UIPortalView setFrame:](v10->_portalView, "setFrame:");

    -[UIView addSubview:](v10->_portalContainerView, "addSubview:", v10->_portalView);
    -[_UITextLightLoupeView _updateColorsForCurrentTraitCollection](v10, "_updateColorsForCurrentTraitCollection");
    +[UITraitCollection systemTraitsAffectingColorAppearance](UITraitCollection, "systemTraitsAffectingColorAppearance");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = -[UIView registerForTraitChanges:withAction:](v10, "registerForTraitChanges:withAction:", v70, sel__updateColorsForCurrentTraitCollection);

  }
  return v10;
}

- (void)_updateColorsForCurrentTraitCollection
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == 2)
  {
    v5 = 0.2;
    v6 = 1.0;
  }
  else
  {
    v5 = 0.1;
    v6 = 0.0;
  }
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v6, v5);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v9, "CGColor");
  -[UIView layer](self->_maskView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderColor:", v7);

}

- (void)_stopDisplayLink
{
  CADisplayLink *displayLink;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

}

- (void)removeFromSuperview
{
  objc_super v3;

  -[_UITextLightLoupeView _stopDisplayLink](self, "_stopDisplayLink");
  v3.receiver = self;
  v3.super_class = (Class)_UITextLightLoupeView;
  -[UIView removeFromSuperview](&v3, sel_removeFromSuperview);
}

- (CGSize)preferredSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 78.0;
  v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UICoordinateSpace)containerCoordinateSpace
{
  void *v2;
  void *v3;

  -[UIView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coordinateSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UICoordinateSpace *)v3;
}

- (id)_backgroundColorIfNecessary
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  Class v7;
  Class v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;
  UIView **p_sourceView;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  __int128 *p_buf;
  uint64_t *v34;
  Class v35;
  Class v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  __int128 buf;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)UIApp, "_isSpringBoard"))
    goto LABEL_7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  objc_msgSend(WeakRetained, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:", 1, 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = NSClassFromString(CFSTR("SBHomeScreenWindow"));
  v8 = NSClassFromString(CFSTR("SBIsolationTankWindow"));
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v42 = 0x2020000000;
  v43 = 0x7FFFFFFFFFFFFFFFLL;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0x7FFFFFFFFFFFFFFFLL;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __52___UITextLightLoupeView__backgroundColorIfNecessary__block_invoke;
  v31[3] = &unk_1E16E0490;
  p_buf = &buf;
  v9 = v4;
  v32 = v9;
  v34 = &v37;
  v35 = v8;
  v36 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v31);
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 24) == 0x7FFFFFFFFFFFFFFFLL || v38[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 1;
  }
  else
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
  }

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&buf, 8);

  if (v10)
  {
LABEL_7:
    -[UIView _window](self, "_window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "_isHostedInAnotherProcess"))
    {
LABEL_8:
      +[UIColor darkGrayColor](UIColor, "darkGrayColor");
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v4 = (void *)v12;
    }
    else
    {
      p_sourceView = &self->_sourceView;
      v15 = objc_loadWeakRetained((id *)p_sourceView);
      objc_msgSend(v15, "window");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "windowScene");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "_backgroundStyle");

      switch(v18)
      {
        case 0:
          +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
        case 1:
        case 6:
          +[UIColor grayColor](UIColor, "grayColor");
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
        case 2:
        case 3:
          +[UIColor lightGrayColor](UIColor, "lightGrayColor");
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
        case 4:
        case 5:
          goto LABEL_8;
        default:
          if (os_variant_has_internal_diagnostics())
          {
            __UIFaultDebugAssertLog();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            {
              v27 = objc_loadWeakRetained((id *)p_sourceView);
              objc_msgSend(v27, "window");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "windowScene");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "_backgroundStyle");
              LODWORD(buf) = 134217984;
              *(_QWORD *)((char *)&buf + 4) = v30;
              _os_log_fault_impl(&dword_185066000, v26, OS_LOG_TYPE_FAULT, "Modern Loupe: Unexpected background style: %ld", (uint8_t *)&buf, 0xCu);

            }
          }
          else
          {
            v19 = _backgroundColorIfNecessary___s_category;
            if (!_backgroundColorIfNecessary___s_category)
            {
              v19 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v19, (unint64_t *)&_backgroundColorIfNecessary___s_category);
            }
            v20 = *(NSObject **)(v19 + 8);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v21 = v20;
              v22 = objc_loadWeakRetained((id *)p_sourceView);
              objc_msgSend(v22, "window");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "windowScene");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "_backgroundStyle");
              LODWORD(buf) = 134217984;
              *(_QWORD *)((char *)&buf + 4) = v25;
              _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "Modern Loupe: Unexpected background style: %ld", (uint8_t *)&buf, 0xCu);

            }
          }
          v4 = 0;
          break;
      }
    }

  }
  return v4;
}

- (void)setModelPosition:(CGPoint)a3
{
  if (self->_modelPosition.x != a3.x || self->_modelPosition.y != a3.y)
  {
    self->_modelPosition = a3;
    if (self->_visible)
      -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 0);
  }
}

- (void)setVisible:(BOOL)a3
{
  -[_UITextLightLoupeView setVisible:animated:completion:](self, "setVisible:animated:completion:", a3, 0, 0);
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  uint64_t v13;
  double v14;
  unint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[8];
  _QWORD aBlock[5];
  id v20;
  BOOL v21;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56___UITextLightLoupeView_setVisible_animated_completion___block_invoke;
  aBlock[3] = &unk_1E16E04B8;
  aBlock[4] = self;
  v21 = v5;
  v10 = v8;
  v20 = v10;
  v11 = _Block_copy(aBlock);
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))v11;
  if (self->_visible == v6)
  {
    (*((void (**)(void *, uint64_t, _QWORD))v11 + 2))(v11, 1, 0);
  }
  else
  {
    self->_visible = v6;
    v13 = *MEMORY[0x1E0C9D538];
    if (v6)
    {
      -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 0);
      v14 = 1.0;
      v15 = 0xC049000000000000;
    }
    else
    {
      v15 = *(_QWORD *)(MEMORY[0x1E0C9D538] + 8);
      v14 = 0.0;
    }
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __56___UITextLightLoupeView_setVisible_animated_completion___block_invoke_2;
    v18[3] = &unk_1E16B1E18;
    v18[4] = self;
    *(double *)&v18[5] = v14;
    v18[6] = v13;
    v18[7] = v15;
    v16 = _Block_copy(v18);
    v17 = v16;
    if (v5)
    {
      +[UIView _animateUsingSpringWithTension:friction:interactive:animations:completion:](UIView, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v16, v12, 400.0, 35.0);
    }
    else
    {
      (*((void (**)(void *))v16 + 2))(v16);
      v12[2](v12, 1, 0);
    }

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UITextLightLoupeView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_maskView, "setFrame:");
  -[UIView bounds](self->_maskView, "bounds");
  -[UIView setFrame:](self->_glowView, "setFrame:");
  -[UIView bounds](self->_maskView, "bounds");
  -[UIView setFrame:](self->_portalContainerView, "setFrame:");
}

- (double)_visualOffset
{
  double v2;

  -[_UITextLightLoupeView dismissalProgress](self, "dismissalProgress");
  return v2 * 50.0 * 0.09;
}

- (CGPoint)constrainedModelPositionForPosition:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[_UITextLightLoupeView _visualOffset](self, "_visualOffset");
  v7 = y + v6;
  -[_UITextLightLoupeView containerCoordinateSpace](self, "containerCoordinateSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[UIView bounds](self, "bounds");
  v19 = LoupeConstrainPointHorizontally(x, v7, v10, v12, v14, v16, v17, v18, 8.0);
  v21 = v20;

  v22 = v19;
  v23 = v21;
  result.y = v23;
  result.x = v22;
  return result;
}

- (void)_displayLinkFired:(id)a3
{
  CGPoint *p_modelPosition;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  void *v22;
  CATransform3D v23;
  CATransform3D v24;

  p_modelPosition = &self->_modelPosition;
  -[_UITextLightLoupeView constrainedModelPositionForPosition:](self, "constrainedModelPositionForPosition:", a3, self->_modelPosition.x, self->_modelPosition.y);
  v6 = v5;
  v8 = v7;
  -[UIView center](self, "center");
  if (sqrt((p_modelPosition->x - v9) * (p_modelPosition->x - v9) + (p_modelPosition->y - v10)
                                                                  * (p_modelPosition->y - v10)) < 0.00000011920929)
    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1);
  -[UIView center](self, "center");
  v12 = v6 * 0.3 + v11 * 0.7;
  v14 = v8 * 0.3 + v13 * 0.7;
  if (self->_visible)
  {
    -[UIView bounds](self, "bounds");
    v19 = v14 - (v18 + v17 * 0.5);
    v20 = -(v12 - (v16 + v15 * 0.5));
    -[_UITextLightLoupeView _visualOffset](self, "_visualOffset");
    CATransform3DMakeTranslation(&v24, v20, v21 - v19, 0.0);
    -[UIView layer](self->_portalContainerView, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v24;
    objc_msgSend(v22, "setSublayerTransform:", &v23);

  }
  -[UIView setCenter:](self, "setCenter:", v12, v14);
}

- (BOOL)visible
{
  return self->_visible;
}

- (CGPoint)modelPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_modelPosition.x;
  y = self->_modelPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)dismissalProgress
{
  return self->_dismissalProgress;
}

- (void)setDismissalProgress:(double)a3
{
  self->_dismissalProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_portalContainerView, 0);
  objc_storeStrong((id *)&self->_glowView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_destroyWeak((id *)&self->_sourceView);
}

@end
