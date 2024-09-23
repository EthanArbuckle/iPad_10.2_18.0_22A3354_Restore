@implementation _UIIdleModeController

- (_UIIdleModeController)initWithScreen:(id)a3
{
  id v5;
  _UIIdleModeController *v6;
  _UIIdleModeController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIIdleModeController;
  v6 = -[_UIIdleModeController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_screen, a3);
    v7->_style = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIIdleModeController _completeDismissal](self, "_completeDismissal");
  v3.receiver = self;
  v3.super_class = (Class)_UIIdleModeController;
  -[_UIIdleModeController dealloc](&v3, sel_dealloc);
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    if (a3 == 1 && self->_idleModeEnabled)
      -[_UIIdleModeController _exitIdleModeWithOptions:](self, "_exitIdleModeWithOptions:", 1);
  }
}

- (void)setIdleModeEnabled:(BOOL)a3
{
  if (self->_idleModeEnabled != a3)
  {
    if (a3)
      -[_UIIdleModeController _enterIdleMode](self, "_enterIdleMode");
    else
      -[_UIIdleModeController _exitIdleMode](self, "_exitIdleMode");
    self->_idleModeEnabled = a3;
  }
}

- (void)_enterIdleMode
{
  if (self->_style == 1)
    -[_UIIdleModeController _postWillEnterNotification](self, "_postWillEnterNotification");
  else
    -[_UIIdleModeController _enterIdleModeWithOptions:](self, "_enterIdleModeWithOptions:", 0);
}

- (void)_exitIdleMode
{
  if (self->_style == 1)
    -[_UIIdleModeController _postWillExitNotification](self, "_postWillExitNotification");
  else
    -[_UIIdleModeController _exitIdleModeWithOptions:](self, "_exitIdleModeWithOptions:", 0);
}

- (void)_enterIdleModeWithOptions:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  -[_UIIdleModeController _completeDismissal](self, "_completeDismissal");
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_focusSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_focusedView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[_UIIdleModeController _recordLayoutAttributesStartingAtView:](self, "_recordLayoutAttributesStartingAtView:", v7))
  {
    self->_didApplyVisualEffects = 1;
    -[_UIIdleModeController _prepareForPresentationWithKeyWindow:focusedView:](self, "_prepareForPresentationWithKeyWindow:focusedView:", v5, v7);
    -[_UIIdleModeController _presentationAnimationDuration](self, "_presentationAnimationDuration");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51___UIIdleModeController__enterIdleModeWithOptions___block_invoke;
    v8[3] = &unk_1E16B1888;
    v8[4] = self;
    v8[5] = a3;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327686, v8, 0);
  }
  else
  {
    self->_didApplyVisualEffects = 0;
  }

}

- (void)_exitIdleModeWithOptions:(unint64_t)a3
{
  void *dismissalTransactionID;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9[2];
  _QWORD v10[6];
  id location;

  if (self->_didApplyVisualEffects)
  {
    dismissalTransactionID = (void *)self->_dismissalTransactionID;
    objc_initWeak(&location, self);
    -[_UIIdleModeController _dismissalAnimationDuration](self, "_dismissalAnimationDuration");
    v7 = v6;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50___UIIdleModeController__exitIdleModeWithOptions___block_invoke;
    v10[3] = &unk_1E16B1888;
    v10[4] = self;
    v10[5] = a3;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50___UIIdleModeController__exitIdleModeWithOptions___block_invoke_2;
    v8[3] = &unk_1E16C73A8;
    objc_copyWeak(v9, &location);
    v9[1] = dismissalTransactionID;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327686, v10, v8, v7, 0.0);
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

- (void)_postWillEnterNotification
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("_UIApplicationWillEnterIdleModeNotification"), UIApp);

}

- (void)_postWillExitNotification
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("_UIApplicationWillExitIdleModeNotification"), UIApp);

}

- (double)_presentationAnimationDuration
{
  int v2;
  double result;

  v2 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_IdleModePresentationDuration, (uint64_t)CFSTR("IdleModePresentationDuration"));
  result = *(double *)&qword_1EDDA8128;
  if (v2)
    return 3.0;
  return result;
}

- (double)_dismissalAnimationDuration
{
  int v2;
  double result;

  v2 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_IdleModeDismissalDuration, (uint64_t)CFSTR("IdleModeDismissalDuration"));
  result = *(double *)&qword_1EDDA8138;
  if (v2)
    return 1.0;
  return result;
}

- (double)_vignetteAlphaForUserInterfaceStyle:(int64_t)a3
{
  BOOL v3;
  double result;

  v3 = a3 == 1000 || a3 == 2;
  result = 0.35;
  if (v3)
    return 0.65;
  return result;
}

- (double)_dimmingOverlayWhiteValueForUserInterfaceStyle:(int64_t)a3
{
  BOOL v3;
  double result;

  v3 = a3 == 1000 || a3 == 2;
  result = 0.55;
  if (v3)
    return 0.4;
  return result;
}

- (id)_imageForTraitCollection:(id)a3
{
  return +[UIImage _kitImageNamed:withTrait:](UIImage, "_kitImageNamed:withTrait:", CFSTR("IdleModeGradientOverlay"), a3);
}

- (id)_vignetteImageAroundFocusedFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  void *v19;
  void *v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIScreen traitCollection](self->_screen, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIIdleModeController _imageForTraitCollection:](self, "_imageForTraitCollection:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "size");
  v11 = v10;
  v13 = v12;
  -[UIScreen bounds](self->_screen, "bounds");
  v15 = v14;
  v17 = v16;
  -[UIScreen scale](self->_screen, "scale");
  _UIGraphicsBeginImageContextWithOptions(0, 0, v15, v17, v18);
  +[UIColor blackColor](UIColor, "blackColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFill");

  UIRectFillUsingOperation(1, *MEMORY[0x1E0C9D538], *(CGFloat *)(MEMORY[0x1E0C9D538] + 8), v15, v17);
  objc_msgSend(v9, "drawAtPoint:blendMode:alpha:", 17, x + width * 0.5 - v11 * 0.5, y + height * 0.5 - v13 * 0.5, 1.0);
  _UIGraphicsGetImageFromCurrentImageContext(0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v20;
}

- (void)_applyLayoutAttributes:(id)a3 toView:(id)a4
{
  id v5;
  id v6;
  void *v7;
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
  CGAffineTransform v18;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v21;
  CGAffineTransform v22;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  memset(&v22, 0, sizeof(v22));
  if (v6)
    objc_msgSend(v6, "transform");
  if (v5)
    objc_msgSend(v5, "transform");
  else
    memset(&t2, 0, sizeof(t2));
  t1 = v22;
  CGAffineTransformConcat(&v21, &t1, &t2);
  v18 = v21;
  objc_msgSend(v7, "setTransform:", &v18);
  objc_msgSend(v7, "alpha");
  v9 = v8;
  objc_msgSend(v5, "alphaOffset");
  objc_msgSend(v7, "setAlpha:", v9 + v10);
  objc_msgSend(v7, "center");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v5, "centerOffset");
  v16 = v12 + v15;
  objc_msgSend(v5, "centerOffset");
  objc_msgSend(v7, "setCenter:", v16, v14 + v17);

}

- (void)_applyPresentationLayoutAttributesToViews
{
  _BOOL8 v3;
  _QWORD v4[5];

  v3 = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66___UIIdleModeController__applyPresentationLayoutAttributesToViews__block_invoke_2;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", v3, &__block_literal_global_294, v4, 0);
}

- (void)_applyDismissalLayoutAttributesToViews
{
  _BOOL8 v3;
  _QWORD v4[5];

  v3 = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63___UIIdleModeController__applyDismissalLayoutAttributesToViews__block_invoke_2;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", v3, &__block_literal_global_10_3, v4, 0);
}

- (id)_originalAttributesForView:(id)a3 comparedToIdleModeAttributes:(id)a4
{
  id v4;
  _UIIdleModeLayoutAttributes *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  v4 = a4;
  v5 = objc_alloc_init(_UIIdleModeLayoutAttributes);
  if (v4)
    objc_msgSend(v4, "transform");
  else
    memset(&v12, 0, sizeof(v12));
  CGAffineTransformInvert(&v13, &v12);
  v11 = v13;
  -[_UIIdleModeLayoutAttributes setTransform:](v5, "setTransform:", &v11);
  objc_msgSend(v4, "alphaOffset");
  -[_UIIdleModeLayoutAttributes setAlphaOffset:](v5, "setAlphaOffset:", -v6);
  objc_msgSend(v4, "centerOffset");
  v8 = -v7;
  objc_msgSend(v4, "centerOffset");
  -[_UIIdleModeLayoutAttributes setCenterOffset:](v5, "setCenterOffset:", v8, -v9);

  return v5;
}

- (BOOL)_recordLayoutAttributesStartingAtView:(id)a3
{
  id v4;
  NSMapTable *v5;
  NSMapTable *viewsToCAFilters;
  NSMapTable *v7;
  NSMapTable *viewsToAttributes;
  NSMapTable *v9;
  NSMapTable *viewsToOriginalAttributes;
  _UIViewBlockVisitor *v11;
  id v12;
  _UIViewBlockVisitor *v13;
  void *v14;
  BOOL v15;
  NSMapTable *v16;
  NSMapTable *v17;
  NSMapTable *v18;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v4 = a3;
  if (v4)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    viewsToCAFilters = self->_viewsToCAFilters;
    self->_viewsToCAFilters = v5;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    viewsToAttributes = self->_viewsToAttributes;
    self->_viewsToAttributes = v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v9 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    viewsToOriginalAttributes = self->_viewsToOriginalAttributes;
    self->_viewsToOriginalAttributes = v9;

    v11 = [_UIViewBlockVisitor alloc];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __63___UIIdleModeController__recordLayoutAttributesStartingAtView___block_invoke;
    v20[3] = &unk_1E16CC850;
    v20[4] = self;
    v12 = v4;
    v21 = v12;
    v22 = &v23;
    v13 = -[_UIViewBlockVisitor initWithTraversalDirection:visitorBlock:](v11, "initWithTraversalDirection:visitorBlock:", 2, v20);
    objc_msgSend(v12, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_receiveVisitor:", v13);

    if (*((_BYTE *)v24 + 24))
    {
      v15 = 1;
    }
    else
    {
      v16 = self->_viewsToCAFilters;
      self->_viewsToCAFilters = 0;

      v17 = self->_viewsToAttributes;
      self->_viewsToAttributes = 0;

      v18 = self->_viewsToOriginalAttributes;
      self->_viewsToOriginalAttributes = 0;

      v15 = *((_BYTE *)v24 + 24) != 0;
    }

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_prepareForPresentationWithKeyWindow:(id)a3 focusedView:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  UIWindow *v10;
  UIWindow *backgroundWindow;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIWindow *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  UIImageView *v30;
  void *v31;
  UIImageView *v32;
  UIImageView *vignetteView;
  id v34;

  v34 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_keyWindow, a3);
  -[UIView layer](self->_keyWindow, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_keyWindowAllowedGroupBlending = objc_msgSend(v8, "allowsGroupBlending");

  -[UIView layer](self->_keyWindow, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsGroupBlending:", 0);

  v10 = objc_alloc_init(UIWindow);
  backgroundWindow = self->_backgroundWindow;
  self->_backgroundWindow = v10;

  objc_msgSend(v34, "windowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v7, "_window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "windowScene");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v14 = v16;
    }
    else
    {
      objc_msgSend((id)UIApp, "_defaultSceneIfExists");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v18);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  -[UIWindow setWindowScene:](self->_backgroundWindow, "setWindowScene:", v14);
  -[UIScreen bounds](self->_screen, "bounds");
  -[UIWindow setFrame:](self->_backgroundWindow, "setFrame:");
  +[UIColor clearColor](UIColor, "clearColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_backgroundWindow, "setBackgroundColor:", v19);

  -[UIWindow setWindowLevel:](self->_backgroundWindow, "setWindowLevel:", -10.0);
  -[UIView setUserInteractionEnabled:](self->_backgroundWindow, "setUserInteractionEnabled:", 0);
  -[UIWindow setHidden:](self->_backgroundWindow, "setHidden:", 0);
  -[UIView layer](self->_backgroundWindow, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAllowsGroupBlending:", 0);

  v21 = self->_backgroundWindow;
  objc_msgSend(v7, "bounds");
  -[UIView convertRect:fromView:](v21, "convertRect:fromView:", v7);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v30 = [UIImageView alloc];
  -[_UIIdleModeController _vignetteImageAroundFocusedFrame:](self, "_vignetteImageAroundFocusedFrame:", v23, v25, v27, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[UIImageView initWithImage:](v30, "initWithImage:", v31);
  vignetteView = self->_vignetteView;
  self->_vignetteView = v32;

  -[UIView setAlpha:](self->_vignetteView, "setAlpha:", 0.0);
  -[UIView addSubview:](self->_backgroundWindow, "addSubview:", self->_vignetteView);

}

- (void)_animatePresentation
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _UIIdleModeController *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMapTable *obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[_UIIdleModeController _applyPresentationLayoutAttributesToViews](self, "_applyPresentationLayoutAttributesToViews");
  -[UIView traitCollection](self->_vignetteView, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  -[_UIIdleModeController _vignetteAlphaForUserInterfaceStyle:](self, "_vignetteAlphaForUserInterfaceStyle:", v4);
  -[UIView setAlpha:](self->_vignetteView, "setAlpha:");
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 1.0);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v22 = objc_msgSend(v5, "CGColor");

  -[_UIIdleModeController _dimmingOverlayWhiteValueForUserInterfaceStyle:](self, "_dimmingOverlayWhiteValueForUserInterfaceStyle:", v4);
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "CGColor");

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, CFSTR("inputColor"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = self;
  obj = self->_viewsToCAFilters;
  v10 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    v13 = *MEMORY[0x1E0CD3038];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v15, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setFilters:", v17);

        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("filters.multiplyColor.inputColor"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTimingFunction:", v19);

        objc_msgSend(v18, "setFromValue:", v22);
        objc_msgSend(v18, "setToValue:", v7);
        -[_UIIdleModeController _presentationAnimationDuration](v9, "_presentationAnimationDuration");
        objc_msgSend(v18, "setDuration:");
        objc_msgSend(v15, "layer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addAnimation:forKey:", v18, 0);

      }
      v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v11);
  }

}

- (void)_animateDismissal
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _UIIdleModeController *v17;
  NSMapTable *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[UIView setAlpha:](self->_vignetteView, "setAlpha:", 0.0);
  -[_UIIdleModeController _dismissalAnimationDuration](self, "_dismissalAnimationDuration");
  v4 = v3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v17 = self;
  obj = self->_viewsToCAFilters;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = v4 * 0.5;
    v8 = *(_QWORD *)v20;
    v9 = *MEMORY[0x1E0CD3038];
    v10 = *MEMORY[0x1E0CD2B60];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "layer", v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 1.0);
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = objc_msgSend(v13, "CGColor");

        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("filters.multiplyColor.inputColor"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setTimingFunction:", v16);

        objc_msgSend(v15, "setToValue:", v14);
        objc_msgSend(v15, "setDuration:", v7);
        objc_msgSend(v15, "setFillMode:", v10);
        objc_msgSend(v15, "setRemovedOnCompletion:", 0);
        objc_msgSend(v12, "addAnimation:forKey:", v15, CFSTR("_UIIdleModeDismissal"));

        ++v11;
      }
      while (v6 != v11);
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  -[_UIIdleModeController _applyDismissalLayoutAttributesToViews](v17, "_applyDismissalLayoutAttributesToViews");
}

- (void)_completeDismissal
{
  NSMapTable *viewsToCAFilters;
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 keyWindowAllowedGroupBlending;
  void *v13;
  UIWindow *keyWindow;
  UIWindow *backgroundWindow;
  UIImageView *vignetteView;
  NSMapTable *v17;
  NSMapTable *viewsToAttributes;
  NSMapTable *viewsToOriginalAttributes;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  viewsToCAFilters = self->_viewsToCAFilters;
  if (viewsToCAFilters)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v4 = viewsToCAFilters;
    v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[NSMapTable objectForKey:](self->_viewsToCAFilters, "objectForKey:", v9, (_QWORD)v20);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "layer");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeAnimationForKey:", CFSTR("_UIIdleModeDismissal"));
          objc_msgSend(v11, "setFilters:", v10);

        }
        v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v6);
    }

    keyWindowAllowedGroupBlending = self->_keyWindowAllowedGroupBlending;
    -[UIView layer](self->_keyWindow, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAllowsGroupBlending:", keyWindowAllowedGroupBlending);

    keyWindow = self->_keyWindow;
    self->_keyWindow = 0;

    backgroundWindow = self->_backgroundWindow;
    self->_backgroundWindow = 0;

    vignetteView = self->_vignetteView;
    self->_vignetteView = 0;

    v17 = self->_viewsToCAFilters;
    self->_viewsToCAFilters = 0;

    viewsToAttributes = self->_viewsToAttributes;
    self->_viewsToAttributes = 0;

    viewsToOriginalAttributes = self->_viewsToOriginalAttributes;
    self->_viewsToOriginalAttributes = 0;

    ++self->_dismissalTransactionID;
  }
}

- (UIScreen)screen
{
  return self->_screen;
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)isIdleModeEnabled
{
  return self->_idleModeEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_viewsToOriginalAttributes, 0);
  objc_storeStrong((id *)&self->_viewsToAttributes, 0);
  objc_storeStrong((id *)&self->_viewsToCAFilters, 0);
  objc_storeStrong((id *)&self->_keyWindow, 0);
  objc_storeStrong((id *)&self->_vignetteView, 0);
  objc_storeStrong((id *)&self->_backgroundWindow, 0);
}

@end
