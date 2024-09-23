@implementation _UITextMagnifiedLoupeView

- (_UITextMagnifiedLoupeView)initWithSourceView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _UITextMagnifiedLoupeView *v9;
  _UITextMagnifiedLoupeView *v10;
  UIView *v11;
  UIView *containerView;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  UIView *v17;
  UIView *portalContainerView;
  void *v19;
  _UIPortalView *v20;
  _UIPortalView *portalView;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  UIView *v29;
  UIView *glowView;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  UIView *v45;
  UIView *coverView;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  CADisplayLink *displayLink;
  CADisplayLink *v52;
  void *v53;
  objc_super v55;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)_UITextMagnifiedLoupeView;
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = -[UIView initWithFrame:](&v55, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    -[UIView setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", 0);
    v10->_orientation = 1;
    v11 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v5, v6, v7, v8);
    containerView = v10->_containerView;
    v10->_containerView = v11;

    +[UIColor whiteColor](UIColor, "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10->_containerView, "setBackgroundColor:", v13);

    -[UIView setClipsToBounds:](v10->_containerView, "setClipsToBounds:", 1);
    -[UIView layer](v10->_containerView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAllowsEdgeAntialiasing:", 1);

    v15 = *MEMORY[0x1E0CD2A68];
    -[UIView layer](v10->_containerView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCornerCurve:", v15);

    -[UIView addSubview:](v10, "addSubview:", v10->_containerView);
    v17 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v5, v6, v7, v8);
    portalContainerView = v10->_portalContainerView;
    v10->_portalContainerView = v17;

    -[UIView addSubview:](v10->_containerView, "addSubview:", v10->_portalContainerView);
    objc_msgSend(v4, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[_UIPortalView initWithSourceView:]([_UIPortalView alloc], "initWithSourceView:", v19);
    portalView = v10->_portalView;
    v10->_portalView = v20;

    -[_UIPortalView setMatchesAlpha:](v10->_portalView, "setMatchesAlpha:", 1);
    -[_UIPortalView setMatchesTransform:](v10->_portalView, "setMatchesTransform:", 1);
    objc_msgSend(v19, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "anchorPoint");
    v24 = v23;
    v26 = v25;
    -[UIView layer](v10->_portalView, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAnchorPoint:", v24, v26);

    objc_msgSend(v19, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "frame");
    -[_UIPortalView setFrame:](v10->_portalView, "setFrame:");

    -[UIView addSubview:](v10->_portalContainerView, "addSubview:", v10->_portalView);
    v29 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v5, v6, v7, v8);
    glowView = v10->_glowView;
    v10->_glowView = v29;

    +[UIColor blackColor](UIColor, "blackColor");
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v32 = objc_msgSend(v31, "CGColor");
    -[UIView layer](v10->_glowView, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setShadowColor:", v32);

    -[UIView layer](v10->_glowView, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v35) = 1041865114;
    objc_msgSend(v34, "setShadowOpacity:", v35);

    v36 = *MEMORY[0x1E0C9D820];
    v37 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[UIView layer](v10->_glowView, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setShadowOffset:", v36, v37);

    -[UIView layer](v10->_glowView, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setShadowRadius:", 8.0);

    -[UIView layer](v10->_glowView, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setCornerCurve:", v15);

    objc_msgSend(v4, "contentScaleFactor");
    v42 = v41;
    -[UIView layer](v10->_glowView, "layer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setRasterizationScale:", v42);

    -[UIView layer](v10->_glowView, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setShouldRasterize:", 1);

    -[UIView addSubview:](v10->_containerView, "addSubview:", v10->_glowView);
    v45 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v5, v6, v7, v8);
    coverView = v10->_coverView;
    v10->_coverView = v45;

    -[UIView addSubview:](v10->_containerView, "addSubview:", v10->_coverView);
    objc_msgSend(v4, "window");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "screen");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
      v49 = v48;
    else
      v49 = (void *)MEMORY[0x1E0CD2730];
    objc_msgSend(v49, "displayLinkWithTarget:selector:", v10, sel__displayLinkFired_);
    v50 = objc_claimAutoreleasedReturnValue();
    displayLink = v10->_displayLink;
    v10->_displayLink = (CADisplayLink *)v50;

    -[CADisplayLink setPreferredFramesPerSecond:](v10->_displayLink, "setPreferredFramesPerSecond:", 60);
    v52 = v10->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v52, "addToRunLoop:forMode:", v53, *MEMORY[0x1E0C99748]);

  }
  return v10;
}

- (CGSize)preferredSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 85.0;
  if (self->_orientation == 1)
    v3 = 115.0;
  else
    v3 = 85.0;
  if (self->_orientation != 1)
    v2 = 115.0;
  result.height = v2;
  result.width = v3;
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

- (CGPoint)constrainedModelPositionForPosition:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[_UITextMagnifiedLoupeView containerCoordinateSpace](self, "containerCoordinateSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[UIView bounds](self, "bounds");
  v17 = LoupeConstrainPointHorizontally(x, y, v8, v10, v12, v14, v15, v16, 8.0);
  v19 = v18;

  v20 = v17;
  v21 = v19;
  result.y = v21;
  result.x = v20;
  return result;
}

- (void)setModelPosition:(CGPoint)a3
{
  if (self->_modelPosition.x != a3.x || self->_modelPosition.y != a3.y)
  {
    self->_modelPosition = a3;
    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 0);
  }
  if (self->_closeLoupeAnimationRunning)
  {
    if (!self->_transitionGroupCompletion && setModelPosition__once != -1)
      dispatch_once(&setModelPosition__once, &__block_literal_global_423);
    -[_UITextMagnifiedLoupeView _updateCloseLoupeAnimation:](self, "_updateCloseLoupeAnimation:", 0);
  }
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if (self->_visible == v6)
  {
    if (v8)
    {
      v10 = v8;
      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
LABEL_13:
      v8 = v10;
    }
  }
  else
  {
    v10 = v8;
    self->_visible = v6;
    -[UIView bounds](self, "bounds");
    if (v6)
    {
      -[_UITextMagnifiedLoupeView containerView](self, "containerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", 0);

      if (v5)
      {
        -[_UITextMagnifiedLoupeView _updateOpenLoupeAnimation:](self, "_updateOpenLoupeAnimation:", v10);
        goto LABEL_13;
      }
      self->_animationState = ($E1C7B4BC4E099C56C581B69AFE4278FB)1;
    }
    else
    {
      if (v5)
      {
        -[_UITextMagnifiedLoupeView constrainedModelPositionForPosition:](self, "constrainedModelPositionForPosition:", self->_modelPosition.x, self->_modelPosition.y);
        -[UIView setCenter:](self, "setCenter:");
        -[_UITextMagnifiedLoupeView _updateCloseLoupeAnimation:](self, "_updateCloseLoupeAnimation:", v10);
        goto LABEL_13;
      }
      -[_UITextMagnifiedLoupeView _resetAnimationState](self, "_resetAnimationState");
    }
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    v8 = v10;
    if (v10)
    {
      (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
      goto LABEL_13;
    }
  }

}

- (void)_updateOpenLoupeAnimation:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v4 = a3;
  -[_UITextMagnifiedLoupeView _resetAnimationState](self, "_resetAnimationState");
  -[_UITextMagnifiedLoupeView _updatePortalViewTransformForPosition:zoomScale:](self, "_updatePortalViewTransformForPosition:zoomScale:", self->_modelPosition.x, self->_modelPosition.y, 0.125);
  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  WeakRetained = objc_loadWeakRetained((id *)&self->_animatableSelectionWidget);
  objc_msgSend(WeakRetained, "setHiddenForLoupeAnimation:", 1);

  objc_initWeak(&location, self);
  +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55___UITextMagnifiedLoupeView__updateOpenLoupeAnimation___block_invoke;
  v14[3] = &unk_1E16B3F40;
  objc_copyWeak(&v15, &location);
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v6, 0, v14, 0);
  +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __55___UITextMagnifiedLoupeView__updateOpenLoupeAnimation___block_invoke_2;
  v12[3] = &unk_1E16B3F40;
  objc_copyWeak(&v13, &location);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __55___UITextMagnifiedLoupeView__updateOpenLoupeAnimation___block_invoke_3;
  v10[3] = &unk_1E16C0E38;
  v9 = v4;
  v11 = v9;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v8, 0, v12, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

- (void)_updateCloseLoupeAnimation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[5];
  id v16;
  id v17;
  id location;

  v4 = a3;
  +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextMagnifiedLoupeView _configuredGroupCompletion:](self, "_configuredGroupCompletion:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56___UITextMagnifiedLoupeView__updateCloseLoupeAnimation___block_invoke;
  aBlock[3] = &unk_1E16BFAE0;
  objc_copyWeak(&v17, &location);
  aBlock[4] = self;
  v8 = v6;
  v16 = v8;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __56___UITextMagnifiedLoupeView__updateCloseLoupeAnimation___block_invoke_2;
  v13[3] = &unk_1E16B1BF8;
  v9 = _Block_copy(aBlock);
  v14 = v9;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __56___UITextMagnifiedLoupeView__updateCloseLoupeAnimation___block_invoke_3;
  v11[3] = &unk_1E16B2588;
  v10 = v8;
  v12 = v10;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v5, 1, v13, v11);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (id)_configuredGroupCompletion:(id)a3
{
  id v4;
  _UIGroupCompletion *transitionGroupCompletion;
  _UIGroupCompletion *v6;
  _UIGroupCompletion *v7;
  _UIGroupCompletion *v8;
  _UIGroupCompletion *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id to;
  id from;
  id location;

  v4 = a3;
  transitionGroupCompletion = self->_transitionGroupCompletion;
  if (!transitionGroupCompletion)
  {
    v6 = objc_alloc_init(_UIGroupCompletion);
    v7 = self->_transitionGroupCompletion;
    self->_transitionGroupCompletion = v6;

    objc_initWeak(&location, self);
    objc_initWeak(&from, self->_containerView);
    objc_copyWeak(&to, (id *)&self->_animatableSelectionWidget);
    v8 = self->_transitionGroupCompletion;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56___UITextMagnifiedLoupeView__configuredGroupCompletion___block_invoke;
    v11[3] = &unk_1E16DAE10;
    objc_copyWeak(&v13, &location);
    objc_copyWeak(&v14, &from);
    objc_copyWeak(&v15, &to);
    v12 = v4;
    -[_UIGroupCompletion addNonIncrementingCompletion:](v8, "addNonIncrementingCompletion:", v11);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&to);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    transitionGroupCompletion = self->_transitionGroupCompletion;
  }
  v9 = transitionGroupCompletion;

  return v9;
}

- (void)_resetAnimationState
{
  self->_animationState = 0;
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

  -[_UITextMagnifiedLoupeView _stopDisplayLink](self, "_stopDisplayLink");
  v3.receiver = self;
  v3.super_class = (Class)_UITextMagnifiedLoupeView;
  -[UIView removeFromSuperview](&v3, sel_removeFromSuperview);
}

- ($1B3FB7A12BCE93AE4CB0A35ACEA563C0)_defaultOriginShape
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  $1B3FB7A12BCE93AE4CB0A35ACEA563C0 *result;

  -[UIView bounds](self, "bounds");
  v6 = v5;
  -[UIView bounds](self, "bounds");
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  v9 = v8 * 0.5;
  -[UIView bounds](self, "bounds");
  retstr->var0.x = v11 + v10 * 0.5;
  retstr->var0.y = v13 + v12 * 0.5;
  -[UIView bounds](self, "bounds");
  retstr->var1.origin.x = v14;
  retstr->var1.origin.y = v15;
  retstr->var1.size.width = v16;
  retstr->var1.size.height = v17;
  retstr->var2 = v9;
  -[UIView tintColor](self, "tintColor");
  result = ($1B3FB7A12BCE93AE4CB0A35ACEA563C0 *)objc_claimAutoreleasedReturnValue();
  retstr->var3 = result;
  return result;
}

- ($6269591C569AE6F7CC7995ADEDD8665A)_defaultOriginShadow
{
  retstr->var3.height = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  return self;
}

- (id)_animatableSelectionWidget
{
  _UITextSelectionWidgetAnimating **p_animatableSelectionWidget;
  id WeakRetained;
  int v4;
  id v5;

  p_animatableSelectionWidget = &self->_animatableSelectionWidget;
  WeakRetained = objc_loadWeakRetained((id *)&self->_animatableSelectionWidget);
  v4 = -[UIView _isInVisibleHierarchy]((uint64_t)WeakRetained);

  if (v4)
    v5 = objc_loadWeakRetained((id *)p_animatableSelectionWidget);
  else
    v5 = 0;
  return v5;
}

- (BOOL)_isVertical
{
  return self->_orientation == 2;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  BOOL apertureOpen;
  BOOL floatingAbove;
  _BOOL4 v7;
  __int128 v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  int v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  id v52;
  uint64_t v53;
  void *v54;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  void *v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGAffineTransform v77;
  CGAffineTransform v78;
  __int128 v79;
  __int128 v80;
  double v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  objc_super v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;

  v86.receiver = self;
  v86.super_class = (Class)_UITextMagnifiedLoupeView;
  -[UIView layoutSubviews](&v86, sel_layoutSubviews);
  -[_UITextMagnifiedLoupeView _animatableSelectionWidget](self, "_animatableSelectionWidget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  apertureOpen = self->_animationState.apertureOpen;
  floatingAbove = self->_animationState.floatingAbove;
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  if (v3)
  {
    objc_msgSend(v3, "originShape");
    v81 = 0.0;
    v79 = 0u;
    v80 = 0u;
    objc_msgSend(v4, "originShadow");
  }
  else
  {
    -[_UITextMagnifiedLoupeView _defaultOriginShape](self, "_defaultOriginShape");
    v81 = 0.0;
    v79 = 0u;
    v80 = 0u;
    -[_UITextMagnifiedLoupeView _defaultOriginShadow](self, "_defaultOriginShadow");
  }
  v7 = -[_UITextMagnifiedLoupeView _isVertical](self, "_isVertical");
  memset(&v78, 0, sizeof(v78));
  if (!floatingAbove)
  {
    v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v78.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v78.c = v8;
    *(_OWORD *)&v78.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    if (v4)
      goto LABEL_6;
LABEL_11:
    v13 = *((double *)&v82 + 1);
    v11 = *(double *)&v82;
    if (!floatingAbove)
      goto LABEL_7;
    goto LABEL_12;
  }
  v18 = 65.0;
  v19 = 0.0;
  if (!v7)
  {
    v18 = 0.0;
    v19 = -65.0;
  }
  CGAffineTransformMakeTranslation(&v78, v18, v19);
  if (!v4)
    goto LABEL_11;
LABEL_6:
  objc_msgSend(v4, "originView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v9, v82);
  v11 = v10;
  v13 = v12;

  if (!floatingAbove)
  {
LABEL_7:
    v15 = *((double *)&v84 + 1);
    v14 = *(double *)&v84;
    v16 = *((id *)&v85 + 1);
    v17 = 1.0;
    goto LABEL_13;
  }
LABEL_12:
  -[UIView bounds](self, "bounds");
  v14 = v20;
  v15 = v21;
  -[UIView bounds](self, "bounds");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[UIView tintColor](self, "tintColor");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v25 + v29 * 0.5;
  v11 = v23 + v27 * 0.5;
  v17 = 0.0;
LABEL_13:
  if (v14 >= v15)
    v30 = v15;
  else
    v30 = v14;
  v31 = v30 * 0.5;
  v32 = !apertureOpen;
  if (apertureOpen)
    v33 = 2.0;
  else
    v33 = 42.5;
  if (apertureOpen)
    v34 = v31;
  else
    v34 = *(double *)&v85;
  if (v4 && !apertureOpen)
    v32 = objc_msgSend(v4, "crossfadeOnDismissal");
  if (v32)
    v35 = 0.0;
  else
    v35 = 1.0;
  -[_UITextMagnifiedLoupeView containerView](self, "containerView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setBounds:", 0.0, 0.0, v14, v15);
  objc_msgSend(v36, "setCenter:", v11, v13);
  objc_msgSend(v36, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setCornerRadius:", v34);

  objc_msgSend(v36, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setBorderWidth:", v33);

  v77 = v78;
  objc_msgSend(v36, "setTransform:", &v77);
  objc_msgSend(v36, "setAlpha:", v35);
  if (floatingAbove)
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    v40 = 0.0;
    v41 = 4.0;
  }
  else
  {
    v39 = (id)v79;
    v40 = *((double *)&v80 + 1);
    v41 = v81;
  }
  v42 = *((double *)&v79 + 1);
  if (floatingAbove)
    v43 = 18.0;
  else
    v43 = *(double *)&v80;
  v44 = objc_retainAutorelease(v39);
  v45 = objc_msgSend(v44, "CGColor");
  -[UIView layer](self, "layer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setShadowColor:", v45);

  -[UIView layer](self, "layer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setShadowOffset:", v40, v41);

  -[UIView layer](self, "layer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setShadowRadius:", v43);

  -[UIView layer](self, "layer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  *(float *)&v51 = v42;
  if (floatingAbove)
    *(float *)&v51 = 0.18;
  objc_msgSend(v49, "setShadowOpacity:", v51);

  v52 = objc_retainAutorelease(v16);
  v53 = objc_msgSend(v52, "CGColor");
  -[UIView layer](self->_containerView, "layer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setBorderColor:", v53);

  -[UIView setBackgroundColor:](self->_coverView, "setBackgroundColor:", v52);
  objc_msgSend(v36, "bounds");
  -[UIView setFrame:](self->_coverView, "setFrame:");
  -[UIView setAlpha:](self->_coverView, "setAlpha:", v17);
  -[UIView bounds](self->_containerView, "bounds");
  -[UIView setFrame:](self->_portalContainerView, "setFrame:");
  -[UIView bounds](self->_containerView, "bounds");
  x = v87.origin.x;
  y = v87.origin.y;
  width = v87.size.width;
  height = v87.size.height;
  v88 = CGRectInset(v87, -5.0, -5.0);
  v59 = v88.origin.x;
  v60 = v88.origin.y;
  v61 = v88.size.width;
  v62 = v88.size.height;
  v75 = y;
  v76 = x;
  v88.origin.x = x;
  v88.origin.y = y;
  v73 = height;
  v74 = width;
  v88.size.width = width;
  v88.size.height = height;
  v89 = CGRectInset(v88, 5.0, 5.0);
  v63 = v89.origin.x;
  v64 = v89.origin.y;
  v65 = v89.size.width;
  v66 = v89.size.height;
  v89.origin.x = v59;
  v89.origin.y = v60;
  v89.size.width = v61;
  v89.size.height = v62;
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v59, v60, v61, v62, CGRectGetHeight(v89) * 0.5);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v90.origin.x = v63;
  v90.origin.y = v64;
  v90.size.width = v65;
  v90.size.height = v66;
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v63, v64, v65, v66, CGRectGetHeight(v90) * 0.5);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "bezierPathByReversingPath");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "appendPath:", v69);

  v91.origin.y = v75;
  v91.origin.x = v76;
  v91.size.height = v73;
  v91.size.width = v74;
  v92 = CGRectOffset(v91, 0.0, 5.0);
  -[UIView setFrame:](self->_glowView, "setFrame:", v92.origin.x, v92.origin.y, v92.size.width, v92.size.height);
  v70 = objc_retainAutorelease(v67);
  v71 = objc_msgSend(v70, "CGPath");
  -[UIView layer](self->_glowView, "layer");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setShadowPath:", v71);

}

- (void)_updatePortalViewTransformForPosition:(CGPoint)a3 zoomScale:(double)a4
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  CATransform3D v13;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v16;
  CATransform3D v17;
  CATransform3D v18;

  y = a3.y;
  x = a3.x;
  -[UIView bounds](self->_containerView, "bounds");
  memset(&v18, 0, sizeof(v18));
  CATransform3DMakeTranslation(&v18, v9 + v8 * 0.5 - x, v11 + v10 * 0.5 - y, 0.0);
  memset(&v17, 0, sizeof(v17));
  CATransform3DMakeScale(&v17, a4, a4, 1.0);
  a = v18;
  b = v17;
  CATransform3DConcat(&v16, &a, &b);
  -[UIView layer](self->_portalContainerView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;
  objc_msgSend(v12, "setSublayerTransform:", &v13);

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

  p_modelPosition = &self->_modelPosition;
  -[_UITextMagnifiedLoupeView constrainedModelPositionForPosition:](self, "constrainedModelPositionForPosition:", a3, self->_modelPosition.x, self->_modelPosition.y);
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
    -[_UITextMagnifiedLoupeView _updatePortalViewTransformForPosition:zoomScale:](self, "_updatePortalViewTransformForPosition:zoomScale:", v12, v14, 1.25);
  -[UIView setCenter:](self, "setCenter:", v12, v14);
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
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

- (_UITextSelectionWidgetAnimating)animatableSelectionWidget
{
  return (_UITextSelectionWidgetAnimating *)objc_loadWeakRetained((id *)&self->_animatableSelectionWidget);
}

- (void)setAnimatableSelectionWidget:(id)a3
{
  objc_storeWeak((id *)&self->_animatableSelectionWidget, a3);
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unint64_t)a3
{
  self->_orientation = a3;
}

- ($96EE1C12479E9B303E9C2794B92A11A2)animationState
{
  return ($96EE1C12479E9B303E9C2794B92A11A2)self->_animationState;
}

- (void)setAnimationState:(id)a3
{
  self->_animationState = ($E1C7B4BC4E099C56C581B69AFE4278FB)a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (UIView)portalContainerView
{
  return self->_portalContainerView;
}

- (void)setPortalContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_portalContainerView, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIView)glowView
{
  return self->_glowView;
}

- (void)setGlowView:(id)a3
{
  objc_storeStrong((id *)&self->_glowView, a3);
}

- (UIView)coverView
{
  return self->_coverView;
}

- (void)setCoverView:(id)a3
{
  objc_storeStrong((id *)&self->_coverView, a3);
}

- (_UIPortalView)portalView
{
  return self->_portalView;
}

- (void)setPortalView:(id)a3
{
  objc_storeStrong((id *)&self->_portalView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_coverView, 0);
  objc_storeStrong((id *)&self->_glowView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_portalContainerView, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_destroyWeak((id *)&self->_animatableSelectionWidget);
  objc_storeStrong((id *)&self->_transitionGroupCompletion, 0);
}

@end
