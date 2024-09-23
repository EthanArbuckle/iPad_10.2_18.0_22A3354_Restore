@implementation UIStatusBarManager

- (double)defaultStatusBarHeight
{
  void *v3;
  double v4;
  double v5;
  double result;

  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
  {
    objc_msgSend((id)UIApp, "statusBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentHeight");
    v5 = v4;

    return v5;
  }
  else
  {
    -[UIStatusBarManager defaultStatusBarHeightInOrientation:](self, "defaultStatusBarHeightInOrientation:", -[UIWindowScene interfaceOrientation](self->_windowScene, "interfaceOrientation"));
  }
  return result;
}

- (double)defaultStatusBarHeightInOrientation:(int64_t)a3
{
  double v5;
  void *v6;
  double v7;

  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    -[UIScene _effectiveUISettings](self->_windowScene, "_effectiveUISettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultStatusBarHeightForOrientation:", a3);
    goto LABEL_5;
  }
  v5 = 0.0;
  if ((objc_msgSend((id)UIApp, "_isStatusBarForcedHiddenForOrientation:", a3) & 1) == 0)
  {
    -[UIWindowScene _keyWindow]((id *)&self->_windowScene->super.super.super.isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIStatusBar_Base heightForStyle:orientation:inWindow:](UIStatusBar, "heightForStyle:orientation:inWindow:", 0, a3, v6);
LABEL_5:
    v5 = v7;

  }
  return v5;
}

- (double)statusBarHeight
{
  double result;

  if (-[UIStatusBarManager isStatusBarHidden](self, "isStatusBarHidden"))
    return 0.0;
  -[UIStatusBarManager defaultStatusBarHeight](self, "defaultStatusBarHeight");
  return result;
}

- (BOOL)isStatusBarHidden
{
  return self->_statusBarHidden;
}

uint64_t __102__UIStatusBarManager__visibilityChangedWithOriginalOrientation_targetOrientation_animationParameters___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 10) = 0;
  return result;
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIStatusBarManager)initWithScene:(id)a3
{
  id v4;
  UIStatusBarManager *v5;
  void *v6;
  void *v7;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIStatusBarManager;
  v5 = -[UIStatusBarManager init](&v10, sel_init);
  -[UIStatusBarManager _setScene:](v5, "_setScene:", v4);
  v5->_statusBarStyle = -1;
  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    objc_msgSend(v4, "_FBSScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uiClientSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v5->_statusBarHidden = objc_msgSend(v7, "statusBarHidden");
    objc_msgSend(v7, "statusBarAlpha");
    v5->_statusBarAlpha = v8;

  }
  return v5;
}

- (void)_setScene:(id)a3
{
  UIWindowScene *v5;
  UIWindowScene *windowScene;
  void *v7;

  v5 = (UIWindowScene *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStatusBarManager.m"), 237, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene == nil || [scene isKindOfClass:[UIWindowScene class]]"));

    }
  }
  windowScene = self->_windowScene;
  self->_windowScene = v5;

}

- (BOOL)isInStatusBarFadeAnimation
{
  return self->_inStatusBarFadeAnimation;
}

+ (id)_implicitStatusBarAnimationParametersWithClass:(Class)a3
{
  void *v4;
  void *v5;

  +[UIView _currentAnimationAttributes](UIView, "_currentAnimationAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend([a3 alloc], "initWithDefaultParameters");
    objc_msgSend(v4, "_duration");
    objc_msgSend(v5, "setDuration:");
    objc_msgSend(v4, "_delay");
    objc_msgSend(v5, "setDelay:");
    objc_msgSend(v5, "setCurve:", objc_msgSend(v4, "_curve"));
  }
  else
  {
    -[objc_class fencingAnimation](a3, "fencingAnimation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)updateStatusBarAppearanceWithAnimationParameters:(id)a3
{
  id v3;

  v3 = -[UIStatusBarManager _updateStatusBarAppearanceWithClientSettings:transitionContext:animationParameters:](self, "_updateStatusBarAppearanceWithClientSettings:transitionContext:animationParameters:", 0, 0, a3);
}

- (id)_updateStatusBarAppearanceWithClientSettings:(id)a3 transitionContext:(id)a4 animationParameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _BOOL4 v19;
  id v20;
  _BOOL4 v21;
  _BOOL4 v22;
  id v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  UIWindowScene *windowScene;
  id v39;
  NSObject *v41;
  const __CFString *v42;
  int64_t statusBarStyle;
  const __CFString *v44;
  NSDictionary *statusBarPartStyles;
  double statusBarAlpha;
  const __CFString *v47;
  const __CFString *v48;
  unint64_t v49;
  char v50;
  char v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  char v56;
  _QWORD v57[5];
  id v58;
  BOOL v59;
  char v60;
  char v61;
  _QWORD aBlock[5];
  id v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  id v67;
  uint8_t buf[4];
  const __CFString *v69;
  __int16 v70;
  const __CFString *v71;
  __int16 v72;
  const __CFString *v73;
  __int16 v74;
  int64_t v75;
  __int16 v76;
  NSDictionary *v77;
  __int16 v78;
  const __CFString *v79;
  __int16 v80;
  double v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[UIWindow _findWindowForControllingOverallAppearanceInWindowScene:](UIWindow, "_findWindowForControllingOverallAppearanceInWindowScene:", self->_windowScene);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)UIApp, "_viewControllerBasedStatusBarAppearance"))
    v12 = v11 == 0;
  else
    v12 = 0;
  if (!v12)
  {
    if (objc_msgSend(v8, "interfaceOrientation"))
    {
      v13 = objc_msgSend(v8, "interfaceOrientation");
    }
    else
    {
      objc_msgSend(v11, "_orientationTransactionToken");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "state");

      if ((unint64_t)(v16 - 1) < 2)
      {
        -[UIStatusBarManager windowScene](self, "windowScene");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "interfaceOrientation");

        goto LABEL_12;
      }
      v13 = objc_msgSend(v11, "_windowInterfaceOrientation");
    }
    v18 = v13;
LABEL_12:
    v67 = 0;
    v19 = -[UIStatusBarManager _updateVisibilityForWindow:targetOrientation:animationParameters:](self, "_updateVisibilityForWindow:targetOrientation:animationParameters:", v11, v18, &v67);
    v20 = v67;
    if (self->_statusBarHidden)
    {
      v21 = 0;
      v22 = 0;
      v23 = 0;
      if (v19)
        goto LABEL_19;
    }
    else
    {
      v66 = 0;
      v21 = -[UIStatusBarManager _updateStyleForWindow:animationParameters:](self, "_updateStyleForWindow:animationParameters:", v11, &v66);
      v23 = v66;
      v22 = -[UIStatusBarManager _updateAlpha](self, "_updateAlpha");
      if (v19)
        goto LABEL_19;
    }
    if (!v21 && !v22)
    {
      v14 = 0;
      v24 = v23;
LABEL_56:

      goto LABEL_57;
    }
LABEL_19:
    v49 = __PAIR64__(v21, v22);
    v25 = _updateStatusBarAppearanceWithClientSettings_transitionContext_animationParameters____s_category;
    if (!_updateStatusBarAppearanceWithClientSettings_transitionContext_animationParameters____s_category)
    {
      v25 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v25, (unint64_t *)&_updateStatusBarAppearanceWithClientSettings_transitionContext_animationParameters____s_category);
    }
    if ((*(_BYTE *)v25 & 1) != 0)
    {
      v41 = *(NSObject **)(v25 + 8);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = CFSTR("NO");
        statusBarStyle = self->_statusBarStyle;
        if (v19)
          v44 = CFSTR("YES");
        else
          v44 = CFSTR("NO");
        statusBarPartStyles = self->_statusBarPartStyles;
        statusBarAlpha = self->_statusBarAlpha;
        if (self->_statusBarHidden)
          v47 = CFSTR("YES");
        else
          v47 = CFSTR("NO");
        *(_DWORD *)buf = 138413826;
        if (HIDWORD(v49))
          v48 = CFSTR("YES");
        else
          v48 = CFSTR("NO");
        v69 = v44;
        if ((_DWORD)v49)
          v42 = CFSTR("YES");
        v70 = 2112;
        v71 = v47;
        v72 = 2112;
        v73 = v48;
        v74 = 2048;
        v75 = statusBarStyle;
        v76 = 2112;
        v77 = statusBarPartStyles;
        v78 = 2112;
        v79 = v42;
        v80 = 2048;
        v81 = statusBarAlpha;
        _os_log_impl(&dword_185066000, v41, OS_LOG_TYPE_ERROR, "UIStatusBarManager visibilityUpdated: %@ hidden: %@, styleUpdated: %@ style: %ld partStyles: %@, alphaUpdated: %@ alpha: %.2f", buf, 0x48u);
      }
    }
    if (v10)
    {
      if (v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (v23)
        {
LABEL_33:
          v24 = v23;
          goto LABEL_34;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v24 = 0;
LABEL_34:
          v52 = v20;
          if (v19)
          {
            -[UIStatusBarManager windowScene](self, "windowScene");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "interfaceOrientation");

            if (v8)
            {
              aBlock[0] = MEMORY[0x1E0C809B0];
              aBlock[1] = 3221225472;
              aBlock[2] = __105__UIStatusBarManager__updateStatusBarAppearanceWithClientSettings_transitionContext_animationParameters___block_invoke;
              aBlock[3] = &unk_1E16B80A8;
              aBlock[4] = self;
              v64 = v28;
              v65 = v18;
              v20 = v52;
              v63 = v52;
              v29 = _Block_copy(aBlock);

            }
            else
            {
              v20 = v52;
              -[UIStatusBarManager _visibilityChangedWithOriginalOrientation:targetOrientation:animationParameters:](self, "_visibilityChangedWithOriginalOrientation:targetOrientation:animationParameters:", v28, v18, v52);
              v29 = 0;
            }
            if ((objc_msgSend((id)UIApp, "_isSpringBoard", v49) & 1) != 0)
            {
              objc_msgSend((id)UIApp, "statusBar");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setHidden:animationParameters:", self->_statusBarHidden, v52);

              v20 = v52;
              goto LABEL_42;
            }
          }
          else
          {
            v29 = 0;
            if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
            {
LABEL_42:
              if (HIDWORD(v49))
              {
                objc_msgSend((id)UIApp, "statusBar");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "requestStyle:partStyles:animationParameters:forced:", self->_statusBarResolvedStyle, self->_statusBarPartStyles, v24, 0);

                v20 = v52;
              }
              if ((_DWORD)v49)
              {
                v32 = self->_statusBarAlpha;
                objc_msgSend((id)UIApp, "statusBar");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "setAlpha:", v32);

                v20 = v52;
              }
            }
          }
          if ((objc_msgSend((id)UIApp, "_isSpringBoard", v49) & 1) == 0)
          {
            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = __105__UIStatusBarManager__updateStatusBarAppearanceWithClientSettings_transitionContext_animationParameters___block_invoke_2;
            v57[3] = &unk_1E16B80D0;
            v59 = v19;
            v57[4] = self;
            v58 = v20;
            v60 = v51;
            v61 = v50;
            v34 = _Block_copy(v57);
            v35 = v34;
            if (v8)
            {
              (*((void (**)(void *, id, id))v34 + 2))(v34, v8, v9);
            }
            else
            {
              if (v10)
              {
                objc_msgSend(v10, "bsAnimationSettings");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = objc_msgSend(v10, "skipFencing") ^ 1;
              }
              else
              {
                v36 = 0;
                v37 = 0;
              }
              windowScene = self->_windowScene;
              v53[0] = MEMORY[0x1E0C809B0];
              v53[1] = 3221225472;
              v53[2] = __105__UIStatusBarManager__updateStatusBarAppearanceWithClientSettings_transitionContext_animationParameters___block_invoke_3;
              v53[3] = &unk_1E16B80F8;
              v54 = v36;
              v55 = v35;
              v56 = v37;
              v39 = v36;
              -[UIScene _updateUIClientSettingsWithUITransitionBlock:](windowScene, "_updateUIClientSettingsWithUITransitionBlock:", v53);

              v20 = v52;
            }

          }
          v14 = _Block_copy(v29);

          goto LABEL_56;
        }
        v26 = v10;
        v23 = v10;
      }
      else
      {
        v26 = v10;
        v20 = v10;
      }
    }
    else if (v20)
    {
      v26 = v20;
    }
    else
    {
      v24 = 0;
      v10 = 0;
      v26 = v23;
      if (!v23)
        goto LABEL_34;
    }
    v10 = v26;
    goto LABEL_33;
  }
  v14 = 0;
LABEL_57:

  return v14;
}

- (BOOL)_updateVisibilityForWindow:(id)a3 targetOrientation:(int64_t)a4 animationParameters:(id *)a5
{
  int v7;
  id v8;
  void *v9;
  int statusBarHidden;
  void *v11;
  void *v12;
  id v13;
  id v15;

  v15 = 0;
  v7 = +[UIWindow _prefersStatusBarHiddenInWindow:targetOrientation:animationProvider:](UIWindow, "_prefersStatusBarHiddenInWindow:targetOrientation:animationProvider:", a3, a4, &v15);
  v8 = v15;
  v9 = v8;
  statusBarHidden = self->_statusBarHidden;
  if (statusBarHidden != v7)
  {
    self->_statusBarHidden = v7;
    if (a5)
    {
      if (v8)
      {
        objc_msgSend(v8, "_preferredStatusBarHideAnimationParameters");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v12 = (void *)objc_opt_class();
          objc_msgSend(v12, "_implicitStatusBarAnimationParametersWithClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v11, "setHideAnimation:", objc_msgSend(v9, "preferredStatusBarUpdateAnimation"));
        }
        v13 = objc_retainAutorelease(v11);
        *a5 = v13;

      }
    }
  }

  return statusBarHidden != v7;
}

- (BOOL)_updateAlpha
{
  char v3;
  double v4;
  double statusBarAlpha;

  v3 = objc_msgSend((id)UIApp, "_isSpringBoard");
  v4 = 1.0;
  if ((v3 & 1) == 0)
  {
    v4 = 0.0;
    if (!self->_overriddingStatusBarHidden)
      v4 = 1.0;
  }
  statusBarAlpha = self->_statusBarAlpha;
  if (v4 != statusBarAlpha)
    self->_statusBarAlpha = v4;
  return v4 != statusBarAlpha;
}

- (BOOL)_updateStyleForWindow:(id)a3 animationParameters:(id *)a4
{
  int64_t v6;
  id v7;
  id v8;
  id v9;
  NSDictionary *statusBarPartStyles;
  NSDictionary *v11;
  NSDictionary *v12;
  NSDictionary *v13;
  char v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v19;
  id v20;
  int64_t v21;

  v20 = 0;
  v21 = 0;
  v19 = 0;
  v6 = +[UIWindow _preferredStatusBarStyleInWindow:resolvedStyle:withPartStyles:animationProvider:](UIWindow, "_preferredStatusBarStyleInWindow:resolvedStyle:withPartStyles:animationProvider:", a3, &v21, &v20, &v19);
  v7 = v20;
  v8 = v20;
  v9 = v19;
  if (v21 == self->_statusBarResolvedStyle && v6 == self->_statusBarStyle)
  {
    statusBarPartStyles = self->_statusBarPartStyles;
    v11 = (NSDictionary *)v8;
    v12 = statusBarPartStyles;
    if (v11 == v12)
    {

      v15 = 0;
LABEL_15:

      goto LABEL_16;
    }
    v13 = v12;
    if (v11 && v12)
    {
      v14 = -[NSDictionary isEqual:](v11, "isEqual:", v12);

      if ((v14 & 1) != 0)
      {
        v15 = 0;
        goto LABEL_16;
      }
    }
    else
    {

    }
  }
  self->_statusBarResolvedStyle = v21;
  self->_statusBarStyle = v6;
  objc_storeStrong((id *)&self->_statusBarPartStyles, v7);
  v15 = 1;
  if (a4 && v9)
  {
    objc_msgSend(v9, "_preferredStatusBarStyleAnimationParameters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v17 = (void *)objc_opt_class();
      objc_msgSend(v17, "_implicitStatusBarAnimationParametersWithClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setStyleAnimation:", 1);
    }
    v11 = objc_retainAutorelease(v16);
    *a4 = v11;
    v15 = 1;
    goto LABEL_15;
  }
LABEL_16:

  return v15;
}

- (void)updateStatusBarAppearance
{
  -[UIStatusBarManager updateStatusBarAppearanceWithAnimationParameters:](self, "updateStatusBarAppearanceWithAnimationParameters:", 0);
}

- (CGRect)statusBarFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (-[UIStatusBarManager isStatusBarHidden](self, "isStatusBarHidden"))
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    -[UIStatusBarManager statusBarHeight](self, "statusBarHeight");
    -[UIStatusBarManager statusBarFrameForStatusBarHeight:](self, "statusBarFrameForStatusBarHeight:");
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)statusBarFrameForStatusBarHeight:(double)a3
{
  void *v4;
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
  CGRect result;

  -[UIWindowScene coordinateSpace](self->_windowScene, "coordinateSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v6;
  v12 = v8;
  v13 = v10;
  v14 = a3;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

uint64_t __105__UIStatusBarManager__updateStatusBarAppearanceWithClientSettings_transitionContext_animationParameters___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, id);
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, uint64_t, id))(v5 + 16);
  v7 = a3;
  v6(v5, a2, v7);
  objc_msgSend(v7, "setAnimationSettings:", *(_QWORD *)(a1 + 32));

  return *(unsigned __int8 *)(a1 + 48);
}

void __105__UIStatusBarManager__updateStatusBarAppearanceWithClientSettings_transitionContext_animationParameters___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v7, "setStatusBarHidden:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9));
    v6 = *(void **)(a1 + 40);
    if (v6)
      objc_msgSend(v5, "setStatusBarAnimation:", objc_msgSend(v6, "hideAnimation"));
  }
  if (*(_BYTE *)(a1 + 49))
  {
    objc_msgSend(v7, "setStatusBarStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v7, "setStatusBarModernStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(v7, "setStatusBarPartStyles:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  }
  if (*(_BYTE *)(a1 + 50))
    objc_msgSend(v7, "setStatusBarAlpha:", *(double *)(*(_QWORD *)(a1 + 32) + 48));

}

- (void)_visibilityChangedWithOriginalOrientation:(int64_t)a3 targetOrientation:(int64_t)a4 animationParameters:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[UIStatusBarManager defaultStatusBarHeightInOrientation:](self, "defaultStatusBarHeightInOrientation:", a3);
  v10 = v9;
  -[UIStatusBarManager defaultStatusBarHeightInOrientation:](self, "defaultStatusBarHeightInOrientation:", a4);
  v12 = v11;
  self->_inStatusBarFadeAnimation = objc_msgSend(v8, "hideAnimation") == 1;
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __102__UIStatusBarManager__visibilityChangedWithOriginalOrientation_targetOrientation_animationParameters___block_invoke;
  v22[3] = &unk_1E16B80A8;
  v22[4] = self;
  v24 = v10;
  v25 = v12;
  v14 = v8;
  v23 = v14;
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __102__UIStatusBarManager__visibilityChangedWithOriginalOrientation_targetOrientation_animationParameters___block_invoke_2;
  v21[3] = &unk_1E16B3FD8;
  v21[4] = self;
  +[UIStatusBarAnimationParameters animateWithParameters:animations:completion:](UIStatusBarAnimationParameters, "animateWithParameters:animations:completion:", v14, v22, v21);
  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0 && (dyld_program_sdk_at_least() & 1) == 0)
  {
    -[UIStatusBarManager windowScene](self, "windowScene");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_systemAppearanceManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updateScreenEdgesDeferringSystemGestures");

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = UIApp;
  v26 = CFSTR("statusBarIsHidden");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_statusBarHidden);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("_UIApplicationStatusBarHiddenStateChangedNotification"), v18, v20);

}

- (void)setDebugMenuHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

void __102__UIStatusBarManager__visibilityChangedWithOriginalOrientation_targetOrientation_animationParameters___block_invoke(double *a1)
{
  _BYTE *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (_BYTE *)*((_QWORD *)a1 + 4);
  if (v2[9])
  {
    v3 = a1[6];
    v4 = 0.0;
  }
  else
  {
    v4 = a1[7];
    v3 = 0.0;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v2, "windowScene", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v11, "_isStatusBarWindow") & 1) == 0)
          objc_msgSend(v11, "handleStatusBarChangeFromHeight:toHeight:", v3, v4);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v12 = (void *)*((_QWORD *)a1 + 5);
  if (!v12 || (objc_msgSend(v12, "duration"), v13 == 0.0))
  {
    v16 = 0;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryWithObject:forKey:", v15, CFSTR("UIApplicationStatusBarHeightChangedDurationKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("UIApplicationStatusBarHeightChangedNotification"), UIApp, v16);

}

- (UIWindowScene)windowScene
{
  return self->_windowScene;
}

- (void)_setOverridingStatusBarHidden:(BOOL)a3
{
  if (self->_overriddingStatusBarHidden != a3)
  {
    self->_overriddingStatusBarHidden = a3;
    -[UIStatusBarManager updateStatusBarAppearanceWithAnimationParameters:](self, "updateStatusBarAppearanceWithAnimationParameters:", 0);
  }
}

- (void)_setOverridingStatusBarHidden:(BOOL)a3 animationParameters:(id)a4
{
  if (self->_overriddingStatusBarHidden != a3)
  {
    self->_overriddingStatusBarHidden = a3;
    -[UIStatusBarManager updateStatusBarAppearanceWithAnimationParameters:](self, "updateStatusBarAppearanceWithAnimationParameters:", a4);
  }
}

- (UIScene)_scene
{
  return (UIScene *)self->_windowScene;
}

- (CGRect)statusBarFrameForStatusBarHeight:(double)a3 inOrientation:(int64_t)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[UIWindowScene _referenceBoundsForOrientation:](self->_windowScene, "_referenceBoundsForOrientation:", a4);
  v8 = a3;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_statusBarFrameIgnoringVisibility
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIStatusBarManager defaultStatusBarHeight](self, "defaultStatusBarHeight");
  -[UIStatusBarManager statusBarFrameForStatusBarHeight:](self, "statusBarFrameForStatusBarHeight:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)updateStatusBarAppearanceWithClientSettings:(id)a3 transitionContext:(id)a4
{
  id v6;
  id v7;
  UIStatusBarAnimationParameters *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[UIStatusBarAnimationParameters initWithDefaultParameters]([UIStatusBarAnimationParameters alloc], "initWithDefaultParameters");
  objc_msgSend(v6, "animationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "duration");
  -[UIStatusBarAnimationParameters setDuration:](v8, "setDuration:");

  -[UIStatusBarManager _updateStatusBarAppearanceWithClientSettings:transitionContext:animationParameters:](self, "_updateStatusBarAppearanceWithClientSettings:transitionContext:animationParameters:", v7, v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __105__UIStatusBarManager__updateStatusBarAppearanceWithClientSettings_transitionContext_animationParameters___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_visibilityChangedWithOriginalOrientation:targetOrientation:animationParameters:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (id)createLocalStatusBar
{
  return 0;
}

- (void)handleTapAction:(id)a3
{
  uint64_t v4;
  void (**debugMenuHandler)(void);
  id v6;

  v6 = a3;
  v4 = objc_msgSend(v6, "type");
  if (v4 == 1)
  {
    debugMenuHandler = (void (**)(void))self->_debugMenuHandler;
    if (debugMenuHandler)
      debugMenuHandler[2]();
  }
  else if (!v4)
  {
    objc_msgSend(v6, "xPosition");
    -[UIStatusBarManager _handleScrollToTopAtXPosition:](self, "_handleScrollToTopAtXPosition:");
  }

}

- (CGPoint)_adjustedLocationForXPosition:(double)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat Width;
  CGFloat v21;
  CGPoint result;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  -[UIStatusBarManager statusBarFrame](self, "statusBarFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
LABEL_2:
    v23.origin.x = v6;
    v23.origin.y = v8;
    v23.size.width = v10;
    v23.size.height = v12;
    v13 = CGRectGetHeight(v23) + 1.0;
  }
  else
  {
    -[UIWindowScene screen](self->_windowScene, "screen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;
    v19 = v18;

    switch(-[UIWindowScene interfaceOrientation](self->_windowScene, "interfaceOrientation"))
    {
      case UIInterfaceOrientationPortrait:
        goto LABEL_2;
      case UIInterfaceOrientationPortraitUpsideDown:
        v24.origin.x = v6;
        v24.origin.y = v8;
        v24.size.width = v10;
        v24.size.height = v12;
        v13 = v19 - (CGRectGetHeight(v24) + 1.0);
        break;
      case UIInterfaceOrientationLandscapeRight:
        v25.origin.x = v6;
        v25.origin.y = v8;
        v25.size.width = v10;
        v25.size.height = v12;
        Width = CGRectGetWidth(v25);
        v13 = a3;
        a3 = v17 - (Width + 1.0);
        break;
      case UIInterfaceOrientationLandscapeLeft:
        v26.origin.x = v6;
        v26.origin.y = v8;
        v26.size.width = v10;
        v26.size.height = v12;
        v21 = CGRectGetWidth(v26);
        v13 = a3;
        a3 = v21 + 1.0;
        break;
      default:
        v13 = a3;
        break;
    }
  }
  v14 = a3;
  result.y = v13;
  result.x = v14;
  return result;
}

- (void)_handleScrollToTopAtXPosition:(double)a3
{
  uint64_t v5;
  void *v6;
  UIWindowScene *windowScene;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  id v15;

  -[UIWindowScene _keyWindow]((id *)&self->_windowScene->super.super.super.isa);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_3;
  -[UIWindowScene screen](self->_windowScene, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  windowScene = self->_windowScene;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __52__UIStatusBarManager__handleScrollToTopAtXPosition___block_invoke;
  v14 = &unk_1E16B8120;
  v15 = v6;
  v8 = v6;
  -[UIWindowScene _topVisibleWindowPassingTest:](windowScene, "_topVisibleWindowPassingTest:", &v11);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (uint64_t)v9;
  if (v9)
  {
LABEL_3:
    -[UIStatusBarManager _adjustedLocationForXPosition:](self, "_adjustedLocationForXPosition:", a3, v5, v11, v12, v13, v14);
    objc_msgSend(v10, "_scrollToTopViewsUnderScreenPointIfNecessary:resultHandler:", 0);

  }
}

uint64_t __52__UIStatusBarManager__handleScrollToTopAtXPosition___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_canActAsKeyWindowForScreen:", *(_QWORD *)(a1 + 32));
}

- (BOOL)_isOverridingStatusBarHidden
{
  return self->_overriddingStatusBarHidden;
}

- (UIStatusBarStyle)statusBarStyle
{
  return self->_statusBarStyle;
}

- (void)setWindowScene:(id)a3
{
  objc_storeStrong((id *)&self->_windowScene, a3);
}

- (int64_t)statusBarResolvedStyle
{
  return self->_statusBarResolvedStyle;
}

- (NSDictionary)statusBarPartStyles
{
  return self->_statusBarPartStyles;
}

- (double)statusBarAlpha
{
  return self->_statusBarAlpha;
}

- (id)debugMenuHandler
{
  return self->_debugMenuHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_debugMenuHandler, 0);
  objc_storeStrong((id *)&self->_statusBarPartStyles, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
}

@end
