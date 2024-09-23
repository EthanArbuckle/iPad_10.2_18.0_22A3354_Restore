@implementation UIStatusBar_Base

+ (double)heightForStyle:(int64_t)a3 orientation:(int64_t)a4 inWindow:(id)a5 isAzulBLinked:(BOOL)a6
{
  double result;

  objc_msgSend(a1, "_heightForStyle:orientation:forStatusBarFrame:inWindow:isAzulBLinked:", a3, a4, 0, a5, a6);
  return result;
}

+ (double)heightForStyle:(int64_t)a3 orientation:(int64_t)a4 inWindow:(id)a5
{
  double result;

  objc_msgSend(a1, "heightForStyle:orientation:inWindow:isAzulBLinked:", a3, a4, a5, 1);
  return result;
}

- (double)heightForOrientation:(int64_t)a3 isAzulBLinked:(BOOL)a4
{
  double result;

  objc_msgSend((id)objc_opt_class(), "heightForStyle:orientation:inWindow:isAzulBLinked:", 0, a3, 0, a4);
  return result;
}

- (double)heightForOrientation:(int64_t)a3
{
  double result;

  -[UIStatusBar_Base heightForOrientation:isAzulBLinked:](self, "heightForOrientation:isAzulBLinked:", a3, 1);
  return result;
}

- (UIStatusBarStyleDelegate)styleDelegate
{
  return (UIStatusBarStyleDelegate *)objc_loadWeakRetained((id *)&self->_styleDelegate);
}

+ (double)heightForStyle:(int64_t)a3 orientation:(int64_t)a4
{
  double result;

  objc_msgSend(a1, "heightForStyle:orientation:inWindow:", a3, a4, 0);
  return result;
}

- (void)setActiveStyleOverride:(unint64_t)a3
{
  self->_activeStyleOverride = a3;
}

- (unint64_t)activeStyleOverride
{
  return self->_activeStyleOverride;
}

- (int64_t)styleForRequestedStyle:(int64_t)a3
{
  int64_t v4;

  v4 = 0;
  -[UIStatusBar_Base _getStyle:andActiveOverride:forRequestedStyle:](self, "_getStyle:andActiveOverride:forRequestedStyle:", &v4, 0, a3);
  return v4;
}

- (int64_t)legibilityStyle
{
  return self->_legibilityStyle;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setHidden:(BOOL)a3
{
  -[UIStatusBar_Base setHidden:animated:](self, "setHidden:animated:", a3, 0);
}

- (UIStatusBarStyleRequest)styleRequest
{
  return self->_styleRequest;
}

- (void)setStyleRequest:(id)a3
{
  -[UIStatusBar_Base setStyleRequest:animationParameters:](self, "setStyleRequest:animationParameters:", a3, 0);
}

- (void)setAvoidanceFrame:(CGRect)a3 animationSettings:(id)a4 options:(unint64_t)a5
{
  self->_avoidanceFrame = a3;
}

- (void)setAlpha:(double)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  objc_super v9;

  -[UIStatusBar_Base manager](self, "manager");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[UIStatusBar_Base manager](self, "manager"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "statusBar:shouldSetAlpha:", self, a3),
        v7,
        v6,
        v8))
  {
    v9.receiver = self;
    v9.super_class = (Class)UIStatusBar_Base;
    -[UIView setAlpha:](&v9, sel_setAlpha_, a3);
  }
}

- (UIStatusBarManager)manager
{
  return (UIStatusBarManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UIStatusBarHideAnimationParameters *v6;
  UIStatusBarHideAnimationParameters *v7;

  v4 = a3;
  if (a4)
    v6 = -[UIStatusBarHideAnimationParameters initWithDefaultParameters]([UIStatusBarHideAnimationParameters alloc], "initWithDefaultParameters");
  else
    v6 = 0;
  v7 = v6;
  -[UIStatusBar_Base setHidden:animationParameters:](self, "setHidden:animationParameters:", v4, v6);

}

+ (double)_viewControllerAdjustmentForOrientation:(int64_t)a3 inWindow:(id)a4
{
  double result;

  objc_msgSend(a1, "heightForStyle:orientation:inWindow:", 0, a3, a4);
  return result;
}

+ (Class)_implementationClass
{
  id v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (id)_MergedGlobals_7_10;
  if (!_MergedGlobals_7_10)
  {
    if (objc_msgSend((id)UIApp, "_isSpringBoard"))
    {
      v7 = 0;
      v8 = &v7;
      v9 = 0x2050000000;
      v3 = (void *)qword_1ECD7B2D8;
      v10 = qword_1ECD7B2D8;
      if (!qword_1ECD7B2D8)
      {
        v6[0] = MEMORY[0x1E0C809B0];
        v6[1] = 3221225472;
        v6[2] = __getSTUIStatusBar_WrapperClass_block_invoke;
        v6[3] = &unk_1E16B14C0;
        v6[4] = &v7;
        __getSTUIStatusBar_WrapperClass_block_invoke((uint64_t)v6);
        v3 = (void *)v8[3];
      }
      v4 = objc_retainAutorelease(v3);
      _Block_object_dispose(&v7, 8);
    }
    else
    {
      v4 = (id)objc_opt_class();
    }
    v2 = objc_retainAutorelease(v4);
    _MergedGlobals_7_10 = (uint64_t)v2;
  }
  return (Class)v2;
}

- (void)_performAnimations:(id)a3 withParameters:(id)a4 completion:(id)a5
{
  id *v5;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id *v14;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[UIStatusBar_Base _transitionCoordinator](self, "_transitionCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = (id *)&qword_186677000;
    if (v9)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __65__UIStatusBar_Base__performAnimations_withParameters_completion___block_invoke;
      v22[3] = &unk_1E16B1CC8;
      v15 = v22;
      v5 = &v23;
      v23 = v9;
    }
    else
    {
      v15 = 0;
    }
    v16 = _Block_copy(v15);
    if (v11)
    {
      v20[0] = v13;
      v20[1] = 3221225472;
      v20[2] = __65__UIStatusBar_Base__performAnimations_withParameters_completion___block_invoke_2;
      v20[3] = &unk_1E16B1CC8;
      v17 = v20;
      v14 = &v21;
      v21 = v11;
    }
    else
    {
      v17 = 0;
    }
    v18 = _Block_copy(v17);
    -[UIStatusBar_Base _transitionCoordinator](self, "_transitionCoordinator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "animateAlongsideTransitionInView:animation:completion:", self, v16, v18);

    if (v11)
    if (v9)

  }
  else
  {
    +[UIStatusBarAnimationParameters animateWithParameters:fromCurrentState:animations:completion:](UIStatusBarAnimationParameters, "animateWithParameters:fromCurrentState:animations:completion:", v10, 1, v9, v11);
  }

}

- (UIViewControllerTransitionCoordinator)_transitionCoordinator
{
  return (UIViewControllerTransitionCoordinator *)objc_loadWeakRetained((id *)&self->__transitionCoordinator);
}

- ($6DFA6A1B36B4056F0CD57F9D22B125FB)localDataOverrides
{
  return self->_localDataOverrides;
}

- (void)setStyleRequest:(id)a3 animationParameters:(id)a4
{
  id v5;
  UIColor *v6;
  UIColor *foregroundColor;
  int64_t v8;

  v5 = a3;
  self->_requestedStyle = objc_msgSend(v5, "style");
  objc_msgSend(v5, "foregroundColor");
  v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
  foregroundColor = self->_foregroundColor;
  self->_foregroundColor = v6;

  v8 = objc_msgSend(v5, "legibilityStyle");
  self->_legibilityStyle = v8;
}

- (UIStatusBar_Base)initWithFrame:(CGRect)a3 showForegroundView:(BOOL)a4
{
  return -[UIStatusBar_Base initWithFrame:showForegroundView:inProcessStateProvider:](self, "initWithFrame:showForegroundView:inProcessStateProvider:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIStatusBar_Base)initWithFrame:(CGRect)a3
{
  return -[UIStatusBar_Base initWithFrame:showForegroundView:](self, "initWithFrame:showForegroundView:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setStyleDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_styleDelegate, a3);
}

- (void)setLegibilityStyle:(int64_t)a3
{
  -[UIStatusBar_Base setLegibilityStyle:animationParameters:](self, "setLegibilityStyle:animationParameters:", a3, 0);
}

- (void)setForegroundColor:(id)a3
{
  -[UIStatusBar_Base setForegroundColor:animationParameters:](self, "setForegroundColor:animationParameters:", a3, 0);
}

- (double)currentHeight
{
  double result;

  -[UIStatusBar_Base heightForOrientation:](self, "heightForOrientation:", -[UIStatusBar_Base orientation](self, "orientation"));
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)_setDisablesRasterization:(BOOL)a3
{
  self->_disablesRasterization = a3;
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (void)setLegibilityStyle:(int64_t)a3 animationParameters:(id)a4
{
  self->_legibilityStyle = a3;
}

- (void)_setHidden:(BOOL)a3 animationParameters:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  BOOL v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v4 = a3;
  v6 = a4;
  if (self->_hidden != v4)
  {
    self->_hidden = v4;
    -[UIStatusBar_Base _evaluateServerRegistration](self, "_evaluateServerRegistration");
    v22 = 0u;
    v23 = 0u;
    v21 = 0u;
    -[UIStatusBar_Base _hiddenTransformForHideAnimationParameters:](self, "_hiddenTransformForHideAnimationParameters:", v6);
    -[UIStatusBar_Base _hiddenAlphaForHideAnimationParameters:](self, "_hiddenAlphaForHideAnimationParameters:", v6);
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__UIStatusBar_Base__setHidden_animationParameters___block_invoke;
    aBlock[3] = &unk_1E16E2EE8;
    aBlock[4] = self;
    aBlock[5] = v8;
    v18 = v21;
    v19 = v22;
    v20 = v23;
    v9 = _Block_copy(aBlock);
    if (objc_msgSend(v6, "shouldAnimate") && !v4)
    {
      v15[0] = v7;
      v15[1] = 3221225472;
      v15[2] = __51__UIStatusBar_Base__setHidden_animationParameters___block_invoke_2;
      v15[3] = &unk_1E16B1BF8;
      v16 = v9;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v15);

    }
    v11[4] = self;
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __51__UIStatusBar_Base__setHidden_animationParameters___block_invoke_3;
    v12[3] = &unk_1E16BFB78;
    v13 = v9;
    v14 = v4;
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __51__UIStatusBar_Base__setHidden_animationParameters___block_invoke_4;
    v11[3] = &unk_1E16B3FD8;
    v10 = v9;
    +[UIStatusBarAnimationParameters animateWithParameters:animations:completion:](UIStatusBarAnimationParameters, "animateWithParameters:animations:completion:", v6, v12, v11);

  }
}

- (CGAffineTransform)_hiddenTransformForHideAnimationParameters:(SEL)a3
{
  id v6;
  uint64_t v7;
  __int128 v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGAffineTransform *result;
  id v19;

  v6 = a4;
  v7 = MEMORY[0x1E0C9BAA8];
  v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v8;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v7 + 32);
  v19 = v6;
  v9 = objc_msgSend(v6, "hideAnimation");
  if (v9 == 3)
  {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_statusBarWindowClass"), "_defaultStatusBarSceneReferenceBounds");
    v15 = v14;
    v17 = v16;
    if ((unint64_t)(-[UIStatusBar_Base orientation](self, "orientation") - 1) >= 2)
      v13 = v15;
    else
      v13 = v17;
    goto LABEL_7;
  }
  if (v9 == 2)
  {
    -[UIStatusBar_Base currentHeight](self, "currentHeight");
    v11 = v10;
    objc_msgSend(v19, "additionalSlideHeight");
    v13 = -(v11 + v12);
LABEL_7:
    CGAffineTransformMakeTranslation(retstr, 0.0, v13);
  }

  return result;
}

- (double)_hiddenAlphaForHideAnimationParameters:(id)a3
{
  int v3;
  double result;

  v3 = objc_msgSend(a3, "hideAnimation");
  result = 0.0;
  if ((v3 & 0xFFFFFFFE) == 2)
    return 1.0;
  return result;
}

- (void)setForegroundColor:(id)a3 animationParameters:(id)a4
{
  objc_storeStrong((id *)&self->_foregroundColor, a3);
}

- (void)_evaluateServerRegistration
{
  void *v3;
  BOOL v4;
  int v5;
  UIStatusBarServer *statusBarServer;
  id v7;
  id v8;

  if (self->_statusBarServer)
  {
    -[UIView superview](self, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_hidden && !self->_suppressesHiddenSideEffects || (self->_foreground ? (v4 = v3 == 0) : (v4 = 1), v4))
    {
      v5 = 0;
    }
    else
    {
      v7 = v3;
      v5 = !-[UIStatusBar_Base serverUpdatesDisabled](self, "serverUpdatesDisabled");
      v3 = v7;
    }
    if (self->_registered != v5)
    {
      v8 = v3;
      -[UIStatusBar_Base setRegistered:](self, "setRegistered:");
      statusBarServer = self->_statusBarServer;
      if (self->_registered)
      {
        -[UIStatusBarServer setStatusBar:](statusBarServer, "setStatusBar:", self);
        -[UIStatusBar_Base forceUpdateData:](self, "forceUpdateData:", 0);
        -[UIStatusBar_Base forceUpdateStyleOverrides:](self, "forceUpdateStyleOverrides:", 0);
        -[UIStatusBar_Base forceUpdateDoubleHeightStatus](self, "forceUpdateDoubleHeightStatus");
        -[UIStatusBar_Base forgetEitherSideHistory](self, "forgetEitherSideHistory");
      }
      else
      {
        -[UIStatusBarServer setStatusBar:](statusBarServer, "setStatusBar:", 0);
      }
      v3 = v8;
    }

  }
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (BOOL)serverUpdatesDisabled
{
  return self->_serverUpdatesDisabled;
}

- (void)requestStyle:(int64_t)a3 animated:(BOOL)a4 forced:(BOOL)a5
{
  _BOOL8 v5;
  UIStatusBarStyleAnimationParameters *v8;
  UIStatusBarStyleAnimationParameters *v9;

  v5 = a5;
  if (a4)
    v8 = -[UIStatusBarStyleAnimationParameters initWithDefaultParameters]([UIStatusBarStyleAnimationParameters alloc], "initWithDefaultParameters");
  else
    v8 = 0;
  v9 = v8;
  -[UIStatusBar_Base requestStyle:animationParameters:forced:](self, "requestStyle:animationParameters:forced:", a3, v8, v5);

}

- (void)requestStyle:(int64_t)a3 partStyles:(id)a4 animationParameters:(id)a5 forced:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  -[UIStatusBar_Base _setRequestedStyle:](self, "_setRequestedStyle:", a3);
  -[UIStatusBar_Base _requestStyle:partStyles:animationParameters:forced:](self, "_requestStyle:partStyles:animationParameters:forced:", a3, v11, v10, v6);

}

- (void)_setRequestedStyle:(int64_t)a3
{
  self->_requestedStyle = a3;
}

- (void)requestStyle:(int64_t)a3 animationParameters:(id)a4 forced:(BOOL)a5
{
  -[UIStatusBar_Base requestStyle:partStyles:animationParameters:forced:](self, "requestStyle:partStyles:animationParameters:forced:", a3, 0, a4, a5);
}

- (id)_initWithFrame:(CGRect)a3 showForegroundView:(BOOL)a4 wantsServer:(BOOL)a5 inProcessStateProvider:(id)a6
{
  _BOOL4 v7;
  double height;
  double width;
  double y;
  double x;
  id v13;
  UIStatusBar_Base *v14;
  void *v15;
  UIStatusBarServer *v16;
  UIStatusBarServer *statusBarServer;
  objc_super v19;

  v7 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)UIStatusBar_Base;
  v14 = -[UIView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v14->_persistentAnimationsEnabled = 1;
  v14->_requestedStyle = -1;
  v14->_foreground = objc_msgSend((id)UIApp, "applicationState") != 2;
  objc_storeStrong((id *)&v14->_inProcessStateProvider, a6);
  if (v13)
  {
    objc_msgSend(v13, "addStatusBarStateObserver:", v14);
  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v14, sel__didEnterBackground_, CFSTR("UIApplicationDidEnterBackgroundNotification"), UIApp);
    objc_msgSend(v15, "addObserver:selector:name:object:", v14, sel__willEnterForeground_, CFSTR("UIApplicationWillEnterForegroundNotification"), UIApp);
    objc_msgSend(v15, "addObserver:selector:name:object:", v14, sel__styleOverridesDidChange_, 0x1E176EB60, 0);
    v14->_styleOverrides = +[UIStatusBarServer getStyleOverrides](UIStatusBarServer, "getStyleOverrides");
    v16 = -[UIStatusBarServer initWithStatusBar:]([UIStatusBarServer alloc], "initWithStatusBar:", 0);
    statusBarServer = v14->_statusBarServer;
    v14->_statusBarServer = v16;

  }
  return v14;
}

- (void)forceUpdateStyleOverrides:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_styleOverrides = +[UIStatusBarServer getStyleOverrides](UIStatusBarServer, "getStyleOverrides");
  -[UIStatusBar_Base requestStyle:animated:forced:](self, "requestStyle:animated:forced:", -[UIStatusBar_Base _requestStyle](self, "_requestStyle"), v3, 1);
}

- (int64_t)_requestStyle
{
  return self->_requestedStyle;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (UIStatusBar_Base)initWithFrame:(CGRect)a3 showForegroundView:(BOOL)a4 inProcessStateProvider:(id)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  uint64_t v12;
  uint64_t v13;
  UIStatusBar_Base *v14;
  UIStatusBar_Base *v15;

  v5 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  if (v11 || v12 != v13)
  {
    v14 = (UIStatusBar_Base *)-[UIStatusBar_Base _initWithFrame:showForegroundView:wantsServer:inProcessStateProvider:](self, "_initWithFrame:showForegroundView:wantsServer:inProcessStateProvider:", v5, 1, v11, x, y, width, height);
    self = v14;
  }
  else
  {
    v14 = (UIStatusBar_Base *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_implementationClass")), "_initWithFrame:showForegroundView:wantsServer:inProcessStateProvider:", v5, 1, 0, x, y, width, height);
  }
  v15 = v14;

  return v15;
}

+ (int64_t)_defaultStyleForRequestedStyle:(int64_t)a3 styleOverrides:(unint64_t)a4
{
  return objc_msgSend(a1, "_defaultStyleForRequestedStyle:styleOverrides:activeStyleOverride:", a3, a4, 0);
}

- (unint64_t)styleOverrides
{
  return self->_styleOverrides;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

+ (int64_t)_defaultStyleForRequestedStyle:(int64_t)a3 styleOverrides:(unint64_t)a4 activeStyleOverride:(unint64_t *)a5
{
  BOOL v5;
  unint64_t v6;
  int64_t v7;
  int64_t result;

  if ((unint64_t)(a3 - 108) < 2 || a3 == 306)
  {
    if ((a4 & 0x20000000) != 0)
    {
      v6 = 0x20000000;
      result = 1017;
      goto LABEL_132;
    }
    if ((a4 & 0x800000000) != 0)
    {
      v6 = 0x800000000;
      result = 1018;
      goto LABEL_132;
    }
    if ((a4 & 0x2000) != 0)
    {
      v6 = 0x2000;
      result = 1003;
      goto LABEL_132;
    }
    if ((a4 & 0x100000) != 0)
    {
      v6 = 0x100000;
      result = 1016;
      goto LABEL_132;
    }
    if ((a4 & 0x10000000) != 0)
    {
      v6 = 0x10000000;
      result = 1010;
      goto LABEL_132;
    }
    if ((a4 & 0x8000000) != 0)
    {
      v6 = 0x8000000;
      result = 1011;
      goto LABEL_132;
    }
    if ((a4 & 0x10) != 0)
    {
      v6 = 16;
      result = 1012;
      goto LABEL_132;
    }
    if ((a4 & 1) != 0)
    {
      v6 = 1;
      result = 1013;
      goto LABEL_132;
    }
    if ((a4 & 0x1000000000) != 0)
    {
      v6 = 0x1000000000;
      result = 1023;
      goto LABEL_132;
    }
    if ((a4 & 0x4000000000) != 0)
    {
      v6 = 0x4000000000;
      result = 1026;
      goto LABEL_132;
    }
    if ((a4 & 0x8000000000) != 0)
    {
      v6 = 0x8000000000;
      result = 1025;
      goto LABEL_132;
    }
    if ((a4 & 0x80000) != 0)
    {
      v6 = 0x80000;
      result = 1014;
      goto LABEL_132;
    }
    if ((a4 & 0x40000) != 0)
    {
      v6 = 0x40000;
      result = 1015;
      goto LABEL_132;
    }
    if ((a4 & 8) != 0)
    {
      v6 = 8;
      result = 1001;
      goto LABEL_132;
    }
    if ((a4 & 0x40000000) != 0)
    {
      v6 = 0x40000000;
      result = 1019;
      goto LABEL_132;
    }
    if ((a4 & 0x80000000) != 0)
    {
      v6 = 0x80000000;
      result = 1020;
      goto LABEL_132;
    }
    if ((a4 & 0x20) == 0)
    {
      if ((a4 & 0x10000000000) != 0)
      {
        v6 = 0x10000000000;
        result = 1021;
      }
      else if ((a4 & 0x10000) != 0)
      {
        v6 = 0x10000;
        result = 1005;
      }
      else if ((a4 & 0x20000) != 0)
      {
        v6 = 0x20000;
        result = 1006;
      }
      else if ((a4 & 0x1000000) != 0)
      {
        v6 = 0x1000000;
        result = 1007;
      }
      else if ((a4 & 0x2000000) != 0)
      {
        v6 = 0x2000000;
        result = 1008;
      }
      else if ((a4 & 0x4000000) != 0)
      {
        v6 = 0x4000000;
        result = 1009;
      }
      else if ((a4 & 4) != 0)
      {
        v6 = 4;
        result = 1004;
      }
      else if ((a4 & 0x800) != 0)
      {
        v6 = 2048;
        result = 1002;
      }
      else if ((a4 & 0x20000000000) != 0)
      {
        v6 = 0x20000000000;
        result = 1027;
      }
      else
      {
        if ((a4 & 0x400000000) == 0)
        {
          v6 = a4 & 0x2000000000;
          v5 = (a4 & 0x2000000000) == 0;
          v7 = 1024;
          goto LABEL_31;
        }
        v6 = 0x400000000;
        result = 1022;
      }
      goto LABEL_132;
    }
    goto LABEL_105;
  }
  if ((a4 & 0x20000000) != 0)
  {
    v6 = 0x20000000;
    result = 222;
    goto LABEL_132;
  }
  if ((a4 & 0x800000000) != 0)
  {
    v6 = 0x800000000;
    result = 223;
    goto LABEL_132;
  }
  if ((a4 & 0x8000) != 0)
  {
    v6 = 0x8000;
    result = 215;
    goto LABEL_132;
  }
  if ((a4 & 0x2000) != 0)
  {
    v6 = 0x2000;
    result = 213;
    goto LABEL_132;
  }
  if ((a4 & 0x4000) != 0)
  {
    v6 = 0x4000;
    result = 214;
    goto LABEL_132;
  }
  if ((a4 & 0x100000) != 0)
  {
    v6 = 0x100000;
    result = 111;
    goto LABEL_132;
  }
  if ((a4 & 0x10000000) != 0)
  {
    v6 = 0x10000000;
    result = 221;
    goto LABEL_132;
  }
  if ((a4 & 0x8000000) != 0)
  {
    v6 = 0x8000000;
    result = 220;
    goto LABEL_132;
  }
  if ((a4 & 0x10) != 0)
  {
    v6 = 16;
    result = 208;
    goto LABEL_132;
  }
  if ((a4 & 1) != 0)
  {
    v6 = 1;
    result = 200;
    goto LABEL_132;
  }
  if ((a4 & 0x1000000000) != 0)
  {
    v6 = 0x1000000000;
    result = 226;
    goto LABEL_132;
  }
  if ((a4 & 0x4000000000) != 0)
  {
    v6 = 0x4000000000;
    result = 228;
    goto LABEL_132;
  }
  if ((a4 & 0x8000000000) != 0)
  {
    v6 = 0x8000000000;
    result = 229;
    goto LABEL_132;
  }
  if ((a4 & 0x40) != 0)
  {
    v6 = 64;
    result = 209;
    goto LABEL_132;
  }
  if ((a4 & 0x80) != 0)
  {
    v6 = 128;
    result = 210;
    goto LABEL_132;
  }
  if ((a4 & 0x10000) != 0)
  {
    v6 = 0x10000;
    result = 217;
    goto LABEL_132;
  }
  if ((a4 & 0x80000) != 0)
  {
    v6 = 0x80000;
    result = 218;
    goto LABEL_132;
  }
  if ((a4 & 0x40000) != 0)
  {
    v6 = 0x40000;
    result = 219;
    goto LABEL_132;
  }
  if ((a4 & 0x20000) != 0)
  {
    v6 = 0x20000;
    result = 202;
    goto LABEL_132;
  }
  if ((a4 & 0x1000000) != 0)
  {
    v6 = 0x1000000;
    result = 203;
    goto LABEL_132;
  }
  if ((a4 & 0x2000000) != 0)
  {
    v6 = 0x2000000;
    result = 204;
    goto LABEL_132;
  }
  if ((a4 & 0x4000000) != 0)
  {
    v6 = 0x4000000;
    result = 205;
    goto LABEL_132;
  }
  if ((a4 & 4) != 0)
  {
    v6 = 4;
    result = 206;
    goto LABEL_132;
  }
  if ((a4 & 0x400) != 0)
  {
    v6 = 1024;
    result = 211;
    goto LABEL_132;
  }
  if ((a4 & 0x200000) != 0)
  {
    v6 = 0x200000;
    result = 216;
    goto LABEL_132;
  }
  if ((a4 & 8) != 0)
  {
    v6 = 8;
    result = 207;
    goto LABEL_132;
  }
  if ((a4 & 0x40000000) != 0)
  {
    v6 = 0x40000000;
LABEL_131:
    result = 224;
    goto LABEL_132;
  }
  if ((a4 & 0x80000000) != 0)
  {
    v6 = 0x80000000;
    goto LABEL_131;
  }
  if ((a4 & 0x10000000000) != 0)
  {
    v6 = 0x10000000000;
    goto LABEL_131;
  }
  if ((a4 & 0x20) != 0)
  {
LABEL_105:
    v6 = 32;
LABEL_106:
    result = 104;
    goto LABEL_132;
  }
  if ((a4 & 0x200) != 0)
  {
    v6 = 512;
    goto LABEL_106;
  }
  if ((a4 & 0x1000) != 0)
  {
    v6 = 4096;
    result = 112;
  }
  else if ((a4 & 0x400000) != 0)
  {
    v6 = 0x400000;
    result = 113;
  }
  else if ((a4 & 0x800000) != 0)
  {
    v6 = 0x800000;
    result = 114;
  }
  else if ((a4 & 0x100) != 0)
  {
    v6 = 256;
    result = 105;
  }
  else if ((a4 & 2) != 0)
  {
    v6 = 2;
    result = 201;
  }
  else if ((a4 & 0x800) != 0)
  {
    v6 = 2048;
    result = 212;
  }
  else if ((a4 & 0x20000000000) != 0)
  {
    v6 = 0x20000000000;
    result = 230;
  }
  else
  {
    if ((a4 & 0x400000000) == 0)
    {
      v6 = a4 & 0x2000000000;
      v5 = (a4 & 0x2000000000) == 0;
      v7 = 227;
LABEL_31:
      if (v5)
        result = a3;
      else
        result = v7;
      goto LABEL_132;
    }
    v6 = 0x400000000;
    result = 225;
  }
LABEL_132:
  if (a5)
    *a5 = v6;
  return result;
}

+ (void)_setImplementationClass:(Class)a3
{
  _MergedGlobals_7_10 = (uint64_t)a3;
}

- (void)dealloc
{
  UIStatusBarServer *statusBarServer;
  void *v4;
  UIStatusBarStateProvider *inProcessStateProvider;
  $6DFA6A1B36B4056F0CD57F9D22B125FB *localDataOverrides;
  objc_super v7;

  statusBarServer = self->_statusBarServer;
  if (statusBarServer)
  {
    -[UIStatusBarServer setStatusBar:](statusBarServer, "setStatusBar:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, 0x1E176EB60, 0);

  }
  inProcessStateProvider = self->_inProcessStateProvider;
  if (inProcessStateProvider)
    -[UIStatusBarStateProvider removeStatusBarStateObserver:](inProcessStateProvider, "removeStatusBarStateObserver:", self);
  localDataOverrides = self->_localDataOverrides;
  if (localDataOverrides)
  {
    free(localDataOverrides);
    self->_localDataOverrides = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)UIStatusBar_Base;
  -[UIView dealloc](&v7, sel_dealloc);
}

+ (double)_heightForStyle:(int64_t)a3 orientation:(int64_t)a4 forStatusBarFrame:(BOOL)a5 inWindow:(id)a6
{
  double result;

  objc_msgSend(a1, "_heightForStyle:orientation:forStatusBarFrame:inWindow:isAzulBLinked:", a3, a4, a5, a6, 1);
  return result;
}

+ (double)_heightForStyle:(int64_t)a3 orientation:(int64_t)a4 forStatusBarFrame:(BOOL)a5 inWindow:(id)a6 isAzulBLinked:(BOOL)a7
{
  return 0.0;
}

- (BOOL)_shouldSeekHigherPriorityTouchTarget
{
  void *v2;
  BOOL v3;

  objc_msgSend((id)UIApp, "_systemNavigationAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)setServerUpdatesDisabled:(BOOL)a3
{
  if (self->_serverUpdatesDisabled != a3)
  {
    self->_serverUpdatesDisabled = a3;
    -[UIStatusBar_Base _evaluateServerRegistration](self, "_evaluateServerRegistration");
  }
}

- (void)_didEnterBackground:(id)a3
{
  self->_foreground = 0;
  -[UIStatusBar_Base _evaluateServerRegistration](self, "_evaluateServerRegistration", a3);
}

- (void)_willEnterForeground:(id)a3
{
  self->_foreground = 1;
  -[UIStatusBar_Base _evaluateServerRegistration](self, "_evaluateServerRegistration", a3);
}

- (void)_styleOverridesDidChange:(id)a3
{
  -[UIStatusBar_Base requestStyle:animated:](self, "requestStyle:animated:", -[UIStatusBar_Base _requestStyle](self, "_requestStyle", a3), 0);
}

- (void)statusBarServer:(id)a3 didReceiveStyleOverrides:(unint64_t)a4
{
  self->_styleOverrides = a4;
}

- (double)defaultHeight
{
  double result;

  -[UIStatusBar_Base heightForOrientation:](self, "heightForOrientation:", 1);
  return result;
}

- (double)defaultDoubleHeight
{
  return 0.0;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[UIStatusBar_Base currentHeight](self, "currentHeight");
  v3 = v2;
  v4 = -1.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (CGRect)currentFrame
{
  void *v3;
  double v4;
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
  CGRect result;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBar_Base frameForOrientation:](self, "frameForOrientation:", -[UIStatusBar_Base orientation](self, "orientation"));
  objc_msgSend(v3, "_convertRectFromSceneReferenceSpace:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)frameForOrientation:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_statusBarWindowClass"), "_defaultStatusBarSceneReferenceBounds");
  objc_msgSend((id)objc_opt_class(), "_frameInSceneReferenceSpaceForStyle:orientation:inSceneWithReferenceSize:", -[UIStatusBar_Base currentStyle](self, "currentStyle"), a3, v5, v6);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (int64_t)currentStyle
{
  return 0;
}

- (BOOL)isDoubleHeight
{
  return 0;
}

- (BOOL)isTranslucent
{
  return 1;
}

- (void)_getStyle:(int64_t *)a3 andActiveOverride:(unint64_t *)a4 forRequestedStyle:(int64_t)a5
{
  void *v9;
  unsigned __int8 isKindOfClass;
  uint64_t v11;
  int v12;
  char v13;
  uint64_t v14;
  id v15;

  -[UIStatusBar_Base styleDelegate](self, "styleDelegate");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[UIStatusBar_Base styleDelegate](self, "styleDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v11 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", sel_statusBar_styleForRequestedStyle_overrides_);
    v12 = isKindOfClass & (v11 != objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", sel_statusBar_styleForRequestedStyle_overrides_));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = objc_opt_respondsToSelector();
      if ((v12 & 1) == 0)
      {
        if ((v13 & 1) == 0)
          goto LABEL_12;
LABEL_8:
        v14 = objc_msgSend(v9, "overriddenRequestedStyleFromStyle:", a5);
        a5 = objc_msgSend((id)objc_opt_class(), "_defaultStyleForRequestedStyle:styleOverrides:activeStyleOverride:", v14, objc_msgSend(v9, "statusBar:effectiveStyleOverridesForRequestedStyle:overrides:", self, v14, -[UIStatusBar_Base styleOverrides](self, "styleOverrides")), a4);
        goto LABEL_12;
      }
    }
    else if (!v12)
    {
      goto LABEL_12;
    }
    a5 = objc_msgSend(v15, "statusBar:styleForRequestedStyle:overrides:", self, a5, -[UIStatusBar_Base styleOverrides](self, "styleOverrides"));
    if (a4)
      *a4 = 0;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    goto LABEL_8;
  }
LABEL_12:
  if (a3)
    *a3 = a5;

}

- (void)requestStyle:(int64_t)a3 animationParameters:(id)a4
{
  -[UIStatusBar_Base requestStyle:animationParameters:forced:](self, "requestStyle:animationParameters:forced:", a3, a4, 0);
}

- (void)requestStyle:(int64_t)a3 animated:(BOOL)a4
{
  -[UIStatusBar_Base requestStyle:animated:forced:](self, "requestStyle:animated:forced:", a3, a4, 0);
}

- (void)requestStyle:(int64_t)a3
{
  -[UIStatusBar_Base requestStyle:animated:](self, "requestStyle:animated:", a3, 0);
}

- (id)activeTintColor
{
  return 0;
}

- (BOOL)_canShowInOrientation:(int64_t)a3
{
  double v3;

  -[UIStatusBar_Base heightForOrientation:](self, "heightForOrientation:", a3);
  return v3 > 0.0;
}

- (void)setSuppressesHiddenSideEffects:(BOOL)a3
{
  if (self->_suppressesHiddenSideEffects != a3)
  {
    self->_suppressesHiddenSideEffects = a3;
    -[UIStatusBar_Base _evaluateServerRegistration](self, "_evaluateServerRegistration");
  }
}

- (void)setLocalDataOverrides:(id *)a3
{
  $6DFA6A1B36B4056F0CD57F9D22B125FB *localDataOverrides;

  localDataOverrides = self->_localDataOverrides;
  if (a3)
  {
    if (localDataOverrides
      || (localDataOverrides = ($6DFA6A1B36B4056F0CD57F9D22B125FB *)malloc_type_malloc(0xF68uLL, 0x100004064C31AF5uLL),
          (self->_localDataOverrides = localDataOverrides) != 0))
    {
      memcpy(localDataOverrides, a3, sizeof($6DFA6A1B36B4056F0CD57F9D22B125FB));
    }
  }
  else if (localDataOverrides)
  {
    free(localDataOverrides);
    self->_localDataOverrides = 0;
  }
}

- (BOOL)showsContentsOnScreen
{
  void *v3;
  void *v4;
  BOOL v5;

  -[UIStatusBar_Base enabledPartIdentifiers](self, "enabledPartIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIStatusBar_Base enabledPartIdentifiers](self, "enabledPartIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)actionForPartWithIdentifier:(id)a3
{
  return 0;
}

- (UIOffset)offsetForPartWithIdentifier:(id)a3
{
  double v3;
  double v4;
  UIOffset result;

  v3 = 0.0;
  v4 = 0.0;
  result.vertical = v4;
  result.horizontal = v3;
  return result;
}

- (double)alphaForPartWithIdentifier:(id)a3
{
  return 1.0;
}

- (CGRect)frameForPartWithIdentifier:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)_isTransparent
{
  return 0;
}

+ (CGRect)_frameInSceneReferenceSpaceForStyle:(int64_t)a3 orientation:(int64_t)a4 inSceneWithReferenceSize:(CGSize)a5
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  height = a5.height;
  width = a5.width;
  objc_msgSend(a1, "heightForStyle:orientation:inWindow:", a3, a4, 0);
  v9 = v8;
  switch(a4)
  {
    case 1:
      v10 = 0.0;
      height = v8;
      goto LABEL_7;
    case 2:
      v10 = height - v8;
      v11 = 0.0;
      height = v9;
      break;
    case 3:
      v11 = width - v8;
      v10 = 0.0;
      width = v9;
      break;
    case 4:
      v10 = 0.0;
      width = v8;
LABEL_7:
      v11 = 0.0;
      break;
    default:
      v11 = *MEMORY[0x1E0C9D648];
      v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      width = *(double *)(MEMORY[0x1E0C9D648] + 16);
      height = *(double *)(MEMORY[0x1E0C9D648] + 24);
      break;
  }
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v10;
  result.origin.x = v11;
  return result;
}

- (void)_performBlockWhileIgnoringForegroundViewChanges:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)setAvoidanceFrame:(CGRect)a3
{
  -[UIStatusBar_Base setAvoidanceFrame:animationSettings:](self, "setAvoidanceFrame:animationSettings:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setAvoidanceFrame:(CGRect)a3 animationSettings:(id)a4
{
  -[UIStatusBar_Base setAvoidanceFrame:animationSettings:options:](self, "setAvoidanceFrame:animationSettings:options:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setAvoidanceFrame:(CGRect)a3 animationSettings:(id)a4 isInteractive:(BOOL)a5
{
  -[UIStatusBar_Base setAvoidanceFrame:animationSettings:options:](self, "setAvoidanceFrame:animationSettings:options:", a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)_rectIntersectsTimeItem:(CGRect)a3
{
  return 0;
}

- (BOOL)_usesModernBar
{
  void *v2;

  v2 = (void *)objc_opt_class();
  return objc_msgSend(v2, "isSubclassOfClass:", objc_opt_class());
}

- (void)setSensorActivityIndicator:(id)a3
{
  +[UIStatusBar_Modern setSensorActivityIndicator:](UIStatusBar_Modern, "setSensorActivityIndicator:", a3);
}

- (UIView)sensorActivityIndicator
{
  return +[UIStatusBar_Modern sensorActivityIndicator](UIStatusBar_Modern, "sensorActivityIndicator");
}

- (UIFont)clockFont
{
  return 0;
}

- (UIStatusBarCarPlayDockDataProviding)dockDataProvider
{
  return (UIStatusBarCarPlayDockDataProviding *)objc_loadWeakRetained((id *)&self->_dockDataProvider);
}

- (void)setDockDataProvider:(id)a3
{
  objc_storeWeak((id *)&self->_dockDataProvider, a3);
}

- (BOOL)persistentAnimationsEnabled
{
  return self->_persistentAnimationsEnabled;
}

- (void)setPersistentAnimationsEnabled:(BOOL)a3
{
  self->_persistentAnimationsEnabled = a3;
}

- (UIStatusBarWindow)statusBarWindow
{
  return (UIStatusBarWindow *)objc_loadWeakRetained((id *)&self->_statusBarWindow);
}

- (UIStatusBarServer)statusBarServer
{
  return self->_statusBarServer;
}

- (void)setStatusBarServer:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarServer, a3);
}

- (BOOL)foreground
{
  return self->_foreground;
}

- (void)setForeground:(BOOL)a3
{
  self->_foreground = a3;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (BOOL)registered
{
  return self->_registered;
}

- (UIStatusBarStateProvider)inProcessStateProvider
{
  return self->_inProcessStateProvider;
}

- (void)setInProcessStateProvider:(id)a3
{
  objc_storeStrong((id *)&self->_inProcessStateProvider, a3);
}

- (void)set_transitionCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->__transitionCoordinator, a3);
}

- (BOOL)suppressesHiddenSideEffects
{
  return self->_suppressesHiddenSideEffects;
}

- (BOOL)homeItemsDisabled
{
  return self->_homeItemsDisabled;
}

- (void)setHomeItemsDisabled:(BOOL)a3
{
  self->_homeItemsDisabled = a3;
}

- (BOOL)disablesRasterization
{
  return self->_disablesRasterization;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (NSArray)enabledPartIdentifiers
{
  return self->_enabledPartIdentifiers;
}

- (void)setEnabledPartIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (NSArray)disabledPartIdentifiers
{
  return self->_disabledPartIdentifiers;
}

- (void)setDisabledPartIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (CGRect)avoidanceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_avoidanceFrame.origin.x;
  y = self->_avoidanceFrame.origin.y;
  width = self->_avoidanceFrame.size.width;
  height = self->_avoidanceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_disabledPartIdentifiers, 0);
  objc_storeStrong((id *)&self->_enabledPartIdentifiers, 0);
  objc_storeStrong((id *)&self->_styleRequest, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_destroyWeak((id *)&self->__transitionCoordinator);
  objc_storeStrong((id *)&self->_inProcessStateProvider, 0);
  objc_storeStrong((id *)&self->_statusBarServer, 0);
  objc_destroyWeak((id *)&self->_statusBarWindow);
  objc_destroyWeak((id *)&self->_dockDataProvider);
  objc_destroyWeak((id *)&self->_styleDelegate);
}

@end
