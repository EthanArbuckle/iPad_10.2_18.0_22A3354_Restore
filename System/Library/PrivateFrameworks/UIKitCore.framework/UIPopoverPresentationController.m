@implementation UIPopoverPresentationController

- (id)_createVisualStyleForProvider:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  objc_msgSend(v4, "styleForPopoverPresentationController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIPopoverPresentationController;
    -[UIPresentationController _createVisualStyleForProvider:](&v7, sel__createVisualStyleForProvider_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (UIPopoverPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  UIPopoverPresentationController *v4;
  UIPopoverPresentationController *v5;
  _UIPopoverDimmingView *v6;
  uint64_t v7;
  _UIPopoverDimmingView *dimmingView;
  double v9;
  objc_class *popoverBackgroundViewClass;
  void *v11;
  void *v12;
  double v13;
  _UIRoundedRectShadowView *v14;
  _UIRoundedRectShadowView *shadowView;
  UIView *v16;
  UIView *sourceOverlayView;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  UIView *v23;
  UIView *targetRectView;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)UIPopoverPresentationController;
  v4 = -[UIPresentationController initWithPresentedViewController:presentingViewController:](&v32, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_adaptivityEnabled = 1;
    v4->_popoverControllerStyle = 0;
    v4->_currentArrowDirection = -1;
    v4->_permittedArrowDirections = 15;
    v4->_presentationState = 4;
    v4->_retainsSelfWhilePresented = 0;
    v6 = [_UIPopoverDimmingView alloc];
    v7 = -[UIDimmingView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    dimmingView = v5->_dimmingView;
    v5->_dimmingView = (_UIPopoverDimmingView *)v7;

    v5->_canOverlapSourceViewRect = 0;
    -[objc_class cornerRadius](+[_UIPopoverStandardChromeView standardChromeViewClass](_UIPopoverStandardChromeView, "standardChromeViewClass"), "cornerRadius");
    v5->_cornerRadius = v9;
    v5->_shouldDisableInteractionDuringTransitions = dyld_program_sdk_at_least() ^ 1;
    if (dyld_program_sdk_at_least())
    {
      v31.receiver = v5;
      v31.super_class = (Class)UIPopoverPresentationController;
      v5->_shouldPreserveFirstResponder = -[UIPresentationController _shouldPreserveFirstResponder](&v31, sel__shouldPreserveFirstResponder);
    }
    else
    {
      v5->_shouldPreserveFirstResponder = 0;
    }
    popoverBackgroundViewClass = v5->_popoverBackgroundViewClass;
    if (!popoverBackgroundViewClass)
      popoverBackgroundViewClass = -[UIPopoverPresentationController _defaultChromeViewClass](v5, "_defaultChromeViewClass");
    -[UIPopoverPresentationController _popoverHostingWindow](v5, "_popoverHostingWindow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPopoverPresentationController _layoutInfoForCurrentKeyboardStateAndHostingWindow:](v5, "_layoutInfoForCurrentKeyboardStateAndHostingWindow:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class _contentViewCornerRadiusForArrowDirection:](popoverBackgroundViewClass, "_contentViewCornerRadiusForArrowDirection:", objc_msgSend(v12, "arrowDirection"));
    v14 = -[_UIRoundedRectShadowView initWithCornerRadius:]([_UIRoundedRectShadowView alloc], "initWithCornerRadius:", v13);
    shadowView = v5->_shadowView;
    v5->_shadowView = v14;

    -[UIView setUserInteractionEnabled:](v5->_shadowView, "setUserInteractionEnabled:", 0);
    if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_UseAutoLayoutToPositionPopover, (uint64_t)CFSTR("UseAutoLayoutToPositionPopover"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1ECD75F8C&& dyld_program_sdk_at_least())
    {
      v16 = objc_alloc_init(UIView);
      sourceOverlayView = v5->_sourceOverlayView;
      v5->_sourceOverlayView = v16;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_sourceOverlayView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView setUserInteractionEnabled:](v5->_sourceOverlayView, "setUserInteractionEnabled:", 0);
    }
    if (dyld_program_sdk_at_least())
      -[UIPresentationController setSourceRect:](v5, "setSourceRect:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    -[UIPresentationController _internalTraitOverrides](v5, "_internalTraitOverrides");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHorizontalSizeClass:", 1);

    -[UIPresentationController _internalTraitOverrides](v5, "_internalTraitOverrides");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_setNSIntegerValue:forTraitToken:", 3, 0x1E1A99678);

    v20 = objc_msgSend((id)objc_opt_class(), "_showTargetRectPref");
    v5->_showsTargetRect = v20;
    if (v20)
    {
      +[UIColor redColor](UIColor, "redColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "colorWithAlphaComponent:", 0.2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v5->_sourceOverlayView, "setBackgroundColor:", v22);

      -[UIView _setContinuousCornerRadius:](v5->_sourceOverlayView, "_setContinuousCornerRadius:", 4.0);
      v23 = objc_alloc_init(UIView);
      targetRectView = v5->_targetRectView;
      v5->_targetRectView = v23;

      -[UIView setUserInteractionEnabled:](v5->_targetRectView, "setUserInteractionEnabled:", 0);
      +[UIColor redColor](UIColor, "redColor");
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v26 = objc_msgSend(v25, "CGColor");
      -[UIView layer](v5->_targetRectView, "layer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setBorderColor:", v26);

      -[UIView layer](v5->_targetRectView, "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setBorderWidth:", 2.0);

      -[UIView _setContinuousCornerRadius:](v5->_targetRectView, "_setContinuousCornerRadius:", 4.0);
    }
    -[UIPopoverPresentationController _metrics](v5, "_metrics");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->__shouldHideArrow = objc_msgSend(v29, "shouldHideArrow");

    v5->__ignoreBarButtonItemSiblings = dyld_program_sdk_at_least();
    v5->__defaultPopoverSizeOverride = (CGSize)*MEMORY[0x1E0C9D820];
    v5->_backgroundBlurEffectStyle = 1000;
    v5->_shouldDimPresentingViewTint = 1;

  }
  return v5;
}

- (id)_popoverHostingWindow
{
  void *v2;
  void *v3;

  -[UIPresentationController containerView](self, "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_metrics
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[UIPresentationController _visualStyle](self, "_visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EE0CE048);

  if (v4)
  {
    -[UIPresentationController _visualStyle](self, "_visualStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[_UIPopoverPresentationMetrics defaultPopoverMetrics](_UIPopoverPresentationMetrics, "defaultPopoverMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_layoutInfoFromLayoutInfo:(id)a3 forCurrentKeyboardStateAndHostingWindow:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double x;
  double y;
  double width;
  double height;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  void *v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  char v26;
  void *v27;
  int v28;
  _UIPopoverDimmingView *dimmingView;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  _UIPopoverDimmingView *v59;
  _BOOL4 IsEmpty;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGFloat v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  _OWORD v86[3];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  if (objc_msgSend(v6, "_isRemoteInputHostWindow"))
    objc_msgSend(v7, "setPreferredArrowDirections:", 2);
  if (-[UIPopoverPresentationController _attemptsToAvoidKeyboard](self, "_attemptsToAvoidKeyboard"))
  {
    objc_msgSend(v6, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keyboardSceneDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "visibleFrameInView:", 0);
    x = v90.origin.x;
    y = v90.origin.y;
    width = v90.size.width;
    height = v90.size.height;
    if (!CGRectIsEmpty(v90))
    {
      -[UIPopoverPresentationController _sourceRectInContainerView](self, "_sourceRectInContainerView");
      v99.origin.x = v14;
      v99.origin.y = v15;
      v99.size.width = v16;
      v99.size.height = v17;
      v91.origin.x = x;
      v91.origin.y = y;
      v91.size.width = width;
      v91.size.height = height;
      if (CGRectContainsRect(v91, v99))
      {
        objc_msgSend(v9, "inputViews");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPresentationController sourceView](self, "sourceView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "hierarchyContainsView:", v19);

        if (v20)
        {
          objc_msgSend(v9, "visibleInputViewFrameInView:", 0);
          x = v21;
          y = v22;
          width = v23;
          height = v24;
        }
      }
      +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isDescendantOfView:", self->_popoverView);

      if ((v26 & 1) == 0)
      {
        if (!objc_msgSend((id)UIApp, "_isSpringBoard")
          || (+[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient"), v27 = (void *)objc_claimAutoreleasedReturnValue(), v28 = objc_msgSend(v27, "keyboardActive"), v27, v28))
        {
          v88 = 0u;
          v89 = 0u;
          v87 = 0u;
          dimmingView = self->_dimmingView;
          if (dimmingView)
            -[UIView transform](dimmingView, "transform");
          objc_msgSend(v6, "convertRect:fromWindow:", 0, x, y, width, height);
          objc_msgSend(v6, "convertRect:toView:", self->_dimmingView);
          v31 = v30;
          v33 = v32;
          v35 = v34;
          v37 = v36;
          -[UIView frame](self->_dimmingView, "frame");
          v39 = v38;
          v41 = v40;
          v43 = v42;
          v45 = v44;
          if (dyld_program_sdk_at_least())
          {
            -[UIPopoverPresentationController _containingFrame](self, "_containingFrame");
            v39 = v46;
            v41 = v47;
            v43 = v48;
            v45 = v49;
          }
          v92.origin.x = v31;
          v92.origin.y = v33;
          v92.size.width = v35;
          v92.size.height = v37;
          v100.origin.x = v39;
          v100.origin.y = v41;
          v100.size.width = v43;
          v100.size.height = v45;
          v93 = CGRectIntersection(v92, v100);
          v50 = v93.size.height;
          -[UIPopoverPresentationController _containingFrameInsets](self, "_containingFrameInsets", v93.origin.x, v93.origin.y, v93.size.width);
          v52 = v51;
          v54 = v53;
          v56 = v55;
          v58 = v57 + v50;
          v59 = self->_dimmingView;
          v86[0] = v87;
          v86[1] = v88;
          v86[2] = v89;
          -[UIView setTransform:](v59, "setTransform:", v86);
          objc_msgSend(v7, "setContainingFrameInsets:", v52, v54, v58, v56);
          objc_msgSend(v7, "frame");
          IsEmpty = CGRectIsEmpty(v94);
          objc_msgSend(v7, "sourceViewRect");
          v62 = v61;
          v64 = v63;
          v66 = v65;
          v68 = v67;
          objc_msgSend(v7, "containingFrame");
          v70 = v69;
          v72 = v71;
          v74 = v73;
          v76 = v75;
          objc_msgSend(v7, "containingFrameInsets");
          v78 = v70 + v77;
          v80 = v72 + v79;
          v82 = v74 - (v77 + v81);
          v84 = v76 - (v79 + v83);
          if (IsEmpty)
            goto LABEL_18;
          v95.origin.x = v78;
          v95.origin.y = v80;
          v95.size.width = v82;
          v95.size.height = v84;
          v101.origin.x = v62;
          v101.origin.y = v64;
          v101.size.width = v66;
          v101.size.height = v68;
          v96 = CGRectIntersection(v95, v101);
          if (CGRectIsEmpty(v96))
          {
            v97.origin.x = v78;
            v97.origin.y = v80;
            v97.size.width = v82;
            v97.size.height = v84;
            if (CGRectGetMaxY(v97) < v64)
            {
LABEL_18:
              v98.origin.x = v78;
              v98.origin.y = v80;
              v98.size.width = v82;
              v98.size.height = v84;
              objc_msgSend(v7, "setSourceViewRect:", v62, CGRectGetMaxY(v98), v66, 1.0);
            }
          }
        }
      }
    }

  }
  return v7;
}

- (id)_layoutInfoForCurrentKeyboardStateAndHostingWindow:(id)a3
{
  return -[UIPopoverPresentationController _layoutInfoFromLayoutInfo:forCurrentKeyboardStateAndHostingWindow:](self, "_layoutInfoFromLayoutInfo:forCurrentKeyboardStateAndHostingWindow:", self->_preferredLayoutInfo, a3);
}

- (Class)_defaultChromeViewClass
{
  int64_t popoverControllerStyle;
  Class v5;
  void *v7;

  popoverControllerStyle = self->_popoverControllerStyle;
  if (popoverControllerStyle == 1)
  {
    v5 = (Class)objc_opt_class();
    if (v5)
      return v5;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPopoverPresentationController.m"), 720, CFSTR("Failed to determine chrome view class"));

    v5 = 0;
    return v5;
  }
  if (popoverControllerStyle)
    goto LABEL_6;
  v5 = +[_UIPopoverStandardChromeView standardChromeViewClass](_UIPopoverStandardChromeView, "standardChromeViewClass");
  if (!v5)
    goto LABEL_6;
  return v5;
}

- (BOOL)_attemptsToAvoidKeyboard
{
  if (self->_ignoresKeyboardNotifications)
    return 0;
  if (self->_popoverControllerStyle && (*(_WORD *)&self->_popoverControllerFlags & 0x10) != 0)
    return objc_msgSend((id)objc_opt_class(), "_forceAttemptsToAvoidKeyboard");
  return 1;
}

+ (BOOL)_showTargetRectPref
{
  if (qword_1ECD7A250 != -1)
    dispatch_once(&qword_1ECD7A250, &__block_literal_global_122);
  return _MergedGlobals_29_1;
}

void __54__UIPopoverPresentationController__showTargetRectPref__block_invoke()
{
  void *v0;
  id v1;

  _UIKitPreferencesOnce();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("UIPopoverControllerPaintsTargetRect"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_29_1 = objc_msgSend(v0, "BOOLValue");

}

+ (Class)_popoverViewClass
{
  return (Class)objc_opt_class();
}

+ (id)_platformHostManagerForController:(id)a3
{
  return +[_UIPopoverHostManagerProviderMac managerForPresentationController:](_UIPopoverHostManagerProviderMac, "managerForPresentationController:", a3);
}

- (void)_createHostManagerIfNeeded
{
  _UIPopoverHostManager *v3;
  _UIPopoverHostManager *hostManager;

  if (!self->_hostManager)
  {
    +[UIPopoverPresentationController _platformHostManagerForController:](UIPopoverPresentationController, "_platformHostManagerForController:", self);
    v3 = (_UIPopoverHostManager *)objc_claimAutoreleasedReturnValue();
    hostManager = self->_hostManager;
    self->_hostManager = v3;

  }
}

- (BOOL)_shouldUseNewPopoverAnimations
{
  id v3;
  BOOL v4;
  void *v5;
  char v6;
  char v7;

  if (-[UIPopoverPresentationController popoverBackgroundViewClass](self, "popoverBackgroundViewClass"))
  {
    v3 = -[UIPopoverPresentationController popoverBackgroundViewClass](self, "popoverBackgroundViewClass");
    v4 = v3 == +[_UIPopoverStandardChromeView standardChromeViewClass](_UIPopoverStandardChromeView, "standardChromeViewClass");
  }
  else
  {
    v4 = 1;
  }
  if (-[UIPopoverPresentationController _shouldHideArrow](self, "_shouldHideArrow")
    || !-[UIPopoverPresentationController arrowDirection](self, "arrowDirection"))
  {
    v4 = 0;
  }
  else if (-[UIPopoverPresentationController _centersPopoverIfSourceViewNotSet](self, "_centersPopoverIfSourceViewNotSet"))
  {
    -[UIPresentationController _realSourceView](self, "_realSourceView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      v4 = 0;
  }
  v6 = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_UseNewPopoverAnimations, (uint64_t)CFSTR("UseNewPopoverAnimations"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
  if (byte_1EDDA7EAC)
    v7 = 1;
  else
    v7 = v6;
  return v7 & v4;
}

+ (UIEdgeInsets)_defaultPopoverLayoutMarginsForPopoverControllerStyle:(int64_t)a3 andContentViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  UIEdgeInsets result;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    if (a3 == 1)
    {
      objc_msgSend(v5, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bounds");
      v8 = -CGRectGetWidth(v18);

      objc_msgSend(v6, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "_shouldReverseLayoutDirection");

      if (v10)
        v11 = -1.0;
      else
        v11 = v8;
      if (!v10)
        v8 = -1.0;
      v12 = 0.0;
    }
    else
    {
      v8 = 0.0;
      v12 = 0.0;
      v11 = 0.0;
    }
    v13 = 0.0;
  }
  else
  {
    v13 = 30.0;
    v12 = 10.0;
    v8 = 19.0;
    v11 = 19.0;
  }

  v14 = v13;
  v15 = v11;
  v16 = v12;
  v17 = v8;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIPopoverPresentationController)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("-[UIPopoverPresentationController init] is not a valid initializer. You must call -[UIPopoverPresentationController initWithPresentedViewController:presentingViewController:]."));

  return 0;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _UIPopoverHostManager *hostManager;
  objc_super v9;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x186DC9484](self, a2);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("UIKeyboardWillShowNotification");
  v10[1] = CFSTR("UIKeyboardDidHideNotification");
  v10[2] = CFSTR("_UIScrollViewWillBeginDraggingNotification");
  v10[3] = CFSTR("_UIScrollViewDidEndDraggingNotification");
  v10[4] = CFSTR("UIFocusDidUpdateNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v4, self, v5);

  -[_UIPopoverView setPopoverController:](self->_popoverView, "setPopoverController:", 0);
  -[UIDimmingView setDelegate:](self->_dimmingView, "setDelegate:", 0);
  -[UIGestureRecognizer view](self->_vendedGestureRecognizer, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeGestureRecognizer:", self->_vendedGestureRecognizer);

  -[UIGestureRecognizer removeTarget:action:](self->_vendedGestureRecognizer, "removeTarget:action:", self, sel__swipe_);
  -[UIGestureRecognizer view](self->_dimmingViewGestureRecognizer, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeGestureRecognizer:", self->_dimmingViewGestureRecognizer);

  -[UIGestureRecognizer removeTarget:action:](self->_dimmingViewGestureRecognizer, "removeTarget:action:", self, sel__swipe_);
  -[UIPopoverPresentationController _cancelDelayedFocusAutoDismiss](self, "_cancelDelayedFocusAutoDismiss");
  hostManager = self->_hostManager;
  self->_hostManager = 0;

  objc_autoreleasePoolPop(v3);
  v9.receiver = self;
  v9.super_class = (Class)UIPopoverPresentationController;
  -[UIPresentationController dealloc](&v9, sel_dealloc);
}

- (void)_prepareForWindowDeallocRecursively:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIPopoverPresentationController;
  -[UIPresentationController _prepareForWindowDeallocRecursively:](&v4, sel__prepareForWindowDeallocRecursively_, a3);
  if (self->_hostManager)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[_UIPopoverHostManager dismissPopoverWithIdentifier:](self->_hostManager, "dismissPopoverWithIdentifier:", self->_popoverIdentifier);
  }
}

- (void)setPopoverFrame:(CGRect)a3 animated:(BOOL)a4
{
  -[UIPopoverPresentationController _setPopoverFrame:animated:coordinator:](self, "_setPopoverFrame:animated:coordinator:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_setPopoverFrame:(CGRect)a3 animated:(BOOL)a4 coordinator:(id)a5
{
  _BOOL4 v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  _UIPopoverView *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _UIPopoverView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD aBlock[5];
  _UIPopoverView *v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  uint64_t v38;

  v5 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v12 = self->_popoverView;
  -[UIPopoverPresentationController _layoutInfoForCurrentKeyboardState](self, "_layoutInfoForCurrentKeyboardState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "offset");
  v15 = v14;

  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__UIPopoverPresentationController__setPopoverFrame_animated_coordinator___block_invoke;
  aBlock[3] = &unk_1E16BF770;
  v34 = x;
  v35 = y;
  v36 = width;
  v37 = height;
  aBlock[4] = self;
  v17 = v12;
  v33 = v17;
  v38 = v15;
  v18 = _Block_copy(aBlock);
  v19 = v18;
  if (v5)
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_transitionCoordinator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v30[0] = v16;
      v30[1] = 3221225472;
      v30[2] = __73__UIPopoverPresentationController__setPopoverFrame_animated_coordinator___block_invoke_2;
      v30[3] = &unk_1E16BF798;
      v30[4] = self;
      v31 = v19;
      objc_msgSend(v21, "animateAlongsideTransition:completion:", 0, v30);
      objc_msgSend(v11, "_runAlongsideAnimations");
      objc_msgSend(v11, "_runAlongsideCompletionsAfterCommit");
      v22 = v31;
    }
    else
    {
      -[UIPopoverPresentationController _presentationAnimationDuration](self, "_presentationAnimationDuration");
      v24 = v23;
      v27[0] = v16;
      v27[1] = 3221225472;
      v27[2] = __73__UIPopoverPresentationController__setPopoverFrame_animated_coordinator___block_invoke_3;
      v27[3] = &unk_1E16B2F48;
      v29 = v19;
      v28 = v11;
      v25[0] = v16;
      v25[1] = 3221225472;
      v25[2] = __73__UIPopoverPresentationController__setPopoverFrame_animated_coordinator___block_invoke_4;
      v25[3] = &unk_1E16B3FD8;
      v26 = v28;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 132, v27, v25, v24, 0.0);

      v22 = v29;
    }

  }
  else
  {
    (*((void (**)(void *))v18 + 2))(v18);
    objc_msgSend(v11, "_runAlongsideAnimations");
    objc_msgSend(v11, "_runAlongsideCompletionsAfterCommit");
  }

}

uint64_t __73__UIPopoverPresentationController__setPopoverFrame_animated_coordinator___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v3 = *(double *)(a1 + 48);
  v2 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  v4 = *(double *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 32);
  if ((*(_WORD *)(v6 + 656) & 0x10) != 0)
  {
    v7 = *(void **)(v6 + 384);
    if (v7)
    {
      objc_msgSend(*(id *)(v6 + 360), "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "convertRect:toView:", v8, v3, v2, v5, v4);
      v3 = v9;
      v2 = v10;
      v5 = v11;
      v4 = v12;

    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "_setFrame:arrowOffset:", v3, v2, v5, v4, *(double *)(a1 + 80));
}

uint64_t __73__UIPopoverPresentationController__setPopoverFrame_animated_coordinator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_presentationAnimationDuration");
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 132, *(_QWORD *)(a1 + 40), 0);
}

uint64_t __73__UIPopoverPresentationController__setPopoverFrame_animated_coordinator___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_runAlongsideAnimations");
}

uint64_t __73__UIPopoverPresentationController__setPopoverFrame_animated_coordinator___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runAlongsideCompletionsAfterCommit");
}

- (CGSize)popoverContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_popoverContentSize.width;
  height = self->_popoverContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_clearCachedPopoverContentSize
{
  if (self->_popoverContentSize.width != *MEMORY[0x1E0C9D820]
    || self->_popoverContentSize.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[UIPopoverPresentationController setPopoverContentSize:animated:](self, "setPopoverContentSize:animated:", 0);
  }
}

- (void)setPopoverContentSize:(CGSize)a3
{
  -[UIPopoverPresentationController setPopoverContentSize:animated:](self, "setPopoverContentSize:animated:", 1, a3.width, a3.height);
}

- (void)setPopoverContentSize:(CGSize)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  int v33;
  UIPopoverPresentationController *v34;
  void *v35;
  void *v36;
  _QWORD v37[9];
  char v38;
  _QWORD v39[5];
  UIPopoverPresentationController *v40;
  CGRect v41;
  CGRect v42;

  if (!self->_popoverControllerStyle)
  {
    v4 = a4;
    height = a3.height;
    width = a3.width;
    self->_popoverContentSize = a3;
    v8 = (void *)-[_UIPopoverLayoutInfo copy](self->_preferredLayoutInfo, "copy");
    objc_msgSend(v8, "setPreferredContentSize:", width, height);
    if ((*(_WORD *)&self->_popoverControllerFlags & 0x10) != 0 && self->_layoutConstraintView)
    {
      -[UIView superview](self->_popoverView, "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "convertRect:toView:", self->_layoutConstraintView, self->_targetRectInEmbeddingView.origin.x, self->_targetRectInEmbeddingView.origin.y, self->_targetRectInEmbeddingView.size.width, self->_targetRectInEmbeddingView.size.height);
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;

      objc_msgSend(v8, "setSourceViewRect:", v11, v13, v15, v17);
    }
    -[_UIPopoverView backgroundView](self->_popoverView, "backgroundView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "_contentViewInsets");
      objc_msgSend(v8, "setContentInset:");
    }
    -[UIPopoverPresentationController setPreferredLayoutInfo:](self, "setPreferredLayoutInfo:", v8);
    if (-[UIPopoverPresentationController isPopoverVisible](self, "isPopoverVisible")
      || -[UIPopoverPresentationController _isPresenting](self, "_isPresenting"))
    {
      -[UIPopoverPresentationController _layoutInfoForCurrentKeyboardState](self, "_layoutInfoForCurrentKeyboardState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "frame");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;

      -[UIView frame](self->_popoverView, "frame");
      v42.origin.x = v29;
      v42.origin.y = v30;
      v42.size.width = v31;
      v42.size.height = v32;
      v41.origin.x = v22;
      v41.origin.y = v24;
      v41.size.width = v26;
      v41.size.height = v28;
      if (!CGRectEqualToRect(v41, v42))
      {
        if (v4)
          v33 = !-[UIPopoverPresentationController _isPresenting](self, "_isPresenting");
        else
          v33 = 0;
        v39[0] = 0;
        v39[1] = v39;
        v39[2] = 0x3032000000;
        v39[3] = __Block_byref_object_copy__51;
        v39[4] = __Block_byref_object_dispose__51;
        v34 = self;
        v40 = v34;
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __66__UIPopoverPresentationController_setPopoverContentSize_animated___block_invoke;
        v37[3] = &unk_1E16BF7C0;
        v37[4] = v39;
        *(CGFloat *)&v37[5] = v22;
        *(CGFloat *)&v37[6] = v24;
        *(CGFloat *)&v37[7] = v26;
        *(CGFloat *)&v37[8] = v28;
        v38 = v33;
        v35 = _Block_copy(v37);
        v36 = v35;
        if (v33)
        {
          -[UIView layoutBelowIfNeeded](self->_popoverView, "layoutBelowIfNeeded");
          -[UIPopoverPresentationController _presentationAnimationDuration](v34, "_presentationAnimationDuration");
          +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v36, 0);
        }
        else
        {
          (*((void (**)(void *))v35 + 2))(v35);
        }

        _Block_object_dispose(v39, 8);
      }
    }

  }
}

uint64_t __66__UIPopoverPresentationController_setPopoverContentSize_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setPopoverFrame:animated:", *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)canOverlapSourceViewRect
{
  return self->_canOverlapSourceViewRect;
}

- (void)setCanOverlapSourceViewRect:(BOOL)canOverlapSourceViewRect
{
  self->_canOverlapSourceViewRect = canOverlapSourceViewRect;
}

- (BOOL)isPopoverVisible
{
  return !-[UIPresentationController dismissed](self, "dismissed");
}

- (UIPopoverArrowDirection)arrowDirection
{
  _UIPopoverView *popoverView;

  popoverView = self->_popoverView;
  if (popoverView)
    return -[_UIPopoverView arrowDirection](popoverView, "arrowDirection");
  if (self->_popoverIdentifier && self->_hostManager && (objc_opt_respondsToSelector() & 1) != 0)
    return -[_UIPopoverHostManager arrowDirectionForPopoverWithIdentifier:](self->_hostManager, "arrowDirectionForPopoverWithIdentifier:", self->_popoverIdentifier);
  return -1;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  UIColor *v5;

  v5 = backgroundColor;
  if (self->_backgroundColor != v5)
  {
    objc_storeStrong((id *)&self->_backgroundColor, backgroundColor);
    -[_UIPopoverView setPopoverBackgroundColor:](self->_popoverView, "setPopoverBackgroundColor:", v5);
  }

}

- (void)_setBackgroundBlurDisabled:(BOOL)a3
{
  id v4;

  if (self->_backgroundBlurDisabled != a3)
  {
    self->_backgroundBlurDisabled = a3;
    -[_UIPopoverView backgroundView](self->_popoverView, "backgroundView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setChromeHidden:", self->_backgroundBlurDisabled);

  }
}

- (BOOL)_backgroundBlurDisabled
{
  return self->_backgroundBlurDisabled;
}

- (void)_setBackgroundBlurEffectStyle:(int64_t)a3
{
  if (self->_backgroundBlurEffectStyle != a3)
  {
    self->_backgroundBlurEffectStyle = a3;
    -[_UIPopoverView setBackgroundBlurEffectStyle:](self->_popoverView, "setBackgroundBlurEffectStyle:");
  }
}

- (int64_t)_backgroundBlurEffectStyle
{
  return self->_backgroundBlurEffectStyle;
}

- (UIDimmingView)dimmingView
{
  return (UIDimmingView *)self->_dimmingView;
}

- (NSArray)passthroughViews
{
  return -[UIDimmingView passthroughViews](self->_dimmingView, "passthroughViews");
}

- (void)setPassthroughViews:(NSArray *)passthroughViews
{
  -[UIDimmingView setPassthroughViews:](self->_dimmingView, "setPassthroughViews:", passthroughViews);
}

- (Class)_popoverLayoutInfoForChromeClass:(Class)a3
{
  objc_opt_class();
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (int)_presentationState
{
  return self->_presentationState;
}

- (void)_setPresentationState:(int)a3
{
  self->_presentationState = a3;
}

- (unint64_t)_slideTransitionCount
{
  return self->_slideTransitionCount;
}

- (void)_incrementSlideTransitionCount:(BOOL)a3
{
  uint64_t v4;
  void *v6;

  if (a3)
  {
    v4 = 1;
  }
  else
  {
    if (!self->_slideTransitionCount)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPopoverPresentationController.m"), 737, CFSTR("About to overflow slide transition count"));

    }
    v4 = -1;
  }
  self->_slideTransitionCount += v4;
}

- (void)_resetSlideTransitionCount
{
  self->_slideTransitionCount = 0;
}

- (void)_invalidateLayoutInfo
{
  _UIPopoverLayoutInfo *preferredLayoutInfo;

  preferredLayoutInfo = self->_preferredLayoutInfo;
  self->_preferredLayoutInfo = 0;

}

- (CGPoint)_centerPointForScale:(double)a3 frame:(CGRect)a4 anchor:(CGPoint)a5
{
  double v5;
  double v6;
  double v7;
  CGPoint result;

  v5 = round(a4.origin.x + a4.size.width * 0.5 * a3 - (a3 + -1.0) * a5.x);
  v6 = a4.size.height * 0.5 * a3 + round(a4.origin.y - (a3 + -1.0) * a5.y);
  v7 = v5;
  result.y = v6;
  result.x = v7;
  return result;
}

- (id)popoverView
{
  return self->_popoverView;
}

- (id)shadowView
{
  return self->_shadowView;
}

- (id)_backgroundView
{
  return -[_UIPopoverView backgroundView](self->_popoverView, "backgroundView");
}

- (BOOL)_isShimmingPopoverControllerPresentation
{
  void *v2;
  char isKindOfClass;

  -[UIPresentationController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_setPopoverView:(id)a3
{
  _UIPopoverView *v5;
  _UIPopoverView *v6;

  v5 = (_UIPopoverView *)a3;
  if (self->_popoverView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_popoverView, a3);
    v5 = v6;
  }

}

- (double)_arrowOffset
{
  double result;

  -[_UIPopoverLayoutInfo arrowOffset](self->_preferredLayoutInfo, "arrowOffset");
  return result;
}

- (void)_setArrowOffset:(double)a3
{
  -[_UIPopoverLayoutInfo setArrowOffset:](self->_preferredLayoutInfo, "setArrowOffset:");
  -[_UIPopoverView setArrowOffset:](self->_popoverView, "setArrowOffset:", a3);
}

- (CGSize)_currentPopoverContentSize
{
  _UIPopoverView *popoverView;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  popoverView = self->_popoverView;
  if (popoverView)
  {
    -[_UIPopoverView contentView](popoverView, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;

  }
  else
  {
    v5 = *MEMORY[0x1E0C9D820];
    v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (double)_presentationAnimationDuration
{
  return dbl_18667A0B0[self->_popoverControllerStyle == 1];
}

- (void)_transitionFromViewController:(id)a3 toViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  _WORD *v9;
  id v10;
  CGSize *p_popoverContentSize;
  CGFloat v13;
  CGFloat v14;
  _UIPopoverView *popoverView;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int16 v22;
  void *v23;
  double height;
  _BOOL4 v25;
  CGFloat v27;
  CGFloat v28;
  uint64_t v29;
  _WORD *v30;
  id v31;
  void (**v32)(_QWORD);
  id v33;
  void (**v34)(void *, uint64_t);
  _BOOL4 v35;
  _QWORD v36[4];
  id v37;
  _QWORD aBlock[4];
  _WORD *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  UIPopoverPresentationController *v43;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (id)objc_msgSend(v9, "view");
  p_popoverContentSize = &self->_popoverContentSize;
  if (self->_popoverContentSize.width == *MEMORY[0x1E0C9D820]
    && self->_popoverContentSize.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(v9, "_resolvedPreferredContentSize");
    p_popoverContentSize->width = v13;
    self->_popoverContentSize.height = v14;
  }
  popoverView = self->_popoverView;
  if (popoverView)
  {
    v35 = v5;
    -[_UIPopoverView contentView](popoverView, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    objc_msgSend(v17, "setFrame:");
    -[UIViewController _parentViewController]((id *)v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v9, "_existingView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "window");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v22 = v9[188];
        v9[188] = v22 | 0x100;
        objc_msgSend(v9, "setParentViewController:", 0);
        v9[188] = v9[188] & 0xFEFF | v22 & 0x100;
      }
      objc_msgSend(v9, "_setNavigationControllerContentInsetAdjustment:", 0.0, 0.0, 0.0, 0.0);
      if (v21)
      {
        objc_msgSend(v9, "setPerformingModalTransition:", 1);
        objc_msgSend(v9, "_existingView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "removeFromSuperview");

        objc_msgSend(v9, "setPerformingModalTransition:", 0);
      }
    }
    height = self->_popoverContentSize.height;
    v25 = height == 1100.0;
    if (height == 1137.0)
      v25 = 1;
    if (p_popoverContentSize->width == 320.0 && v25)
    {
      -[UIViewController _resolvedPreferredContentSize](self->_contentViewController, "_resolvedPreferredContentSize");
      p_popoverContentSize->width = v27;
      self->_popoverContentSize.height = v28;
    }
    v29 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __91__UIPopoverPresentationController__transitionFromViewController_toViewController_animated___block_invoke;
    v41[3] = &unk_1E16B1B50;
    v30 = v9;
    v42 = v30;
    v43 = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v41);
    aBlock[0] = v29;
    aBlock[1] = 3221225472;
    aBlock[2] = __91__UIPopoverPresentationController__transitionFromViewController_toViewController_animated___block_invoke_2;
    aBlock[3] = &unk_1E16B1B50;
    v39 = v30;
    v31 = v18;
    v40 = v31;
    v32 = (void (**)(_QWORD))_Block_copy(aBlock);
    v36[0] = v29;
    v36[1] = 3221225472;
    v36[2] = __91__UIPopoverPresentationController__transitionFromViewController_toViewController_animated___block_invoke_3;
    v36[3] = &unk_1E16B3FD8;
    v33 = v31;
    v37 = v33;
    v34 = (void (**)(void *, uint64_t))_Block_copy(v36);
    if (v35)
    {
      -[UIPopoverPresentationController _presentationAnimationDuration](self, "_presentationAnimationDuration");
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v32, v34);
    }
    else
    {
      v32[2](v32);
      v34[2](v34, 1);
    }

  }
}

void __91__UIPopoverPresentationController__transitionFromViewController_toViewController_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 360);
  objc_msgSend(v3, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setPopoverContentView:", v5);

}

uint64_t __91__UIPopoverPresentationController__transitionFromViewController_toViewController_animated___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __91__UIPopoverPresentationController__transitionFromViewController_toViewController_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)_performHierarchyCheckOnViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id *v6;

  v6 = (id *)a3;
  -[UIViewController _parentViewController](v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIViewController _parentViewController](v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "_optsOutOfPopoverControllerHierarchyCheck") & 1) == 0)
    {

LABEL_7:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("The content view controller argument must be the root of its associated view controller hierarchy."));
      goto LABEL_8;
    }
  }
  objc_msgSend(v6, "_parentModalViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {

  }
  if (v5)
    goto LABEL_7;
LABEL_8:

}

- (int64_t)_popoverControllerStyle
{
  return self->_popoverControllerStyle;
}

- (BOOL)_manuallyHandlesContentViewControllerAppearanceCalls
{
  return self->_popoverControllerStyle == 1;
}

- (id)arrowBackgroundColor
{
  return self->_arrowBackgroundColor;
}

- (void)setArrowBackgroundColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  if (self->_arrowBackgroundColor != v5)
  {
    objc_storeStrong((id *)&self->_arrowBackgroundColor, a3);
    -[_UIPopoverView setArrowBackgroundColor:](self->_popoverView, "setArrowBackgroundColor:", v5);
  }

}

- (id)_lowerWindowDismissalGestureViews
{
  return -[UIDimmingView lowerWindowDismissalGestureViews](self->_dimmingView, "lowerWindowDismissalGestureViews");
}

- (void)_setLowerWindowDismissalGestureViews:(id)a3
{
  -[UIDimmingView setLowerWindowDismissalGestureViews:](self->_dimmingView, "setLowerWindowDismissalGestureViews:", a3);
}

- (void)_setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[_UIPopoverView _setCustomCornerRadius:](self->_popoverView, "_setCustomCornerRadius:");
  }
}

- (void)_setAllowDismissalTapsToPassThrough:(BOOL)a3
{
  if (self->_allowDismissalTapsToPassThrough != a3)
  {
    self->_allowDismissalTapsToPassThrough = a3;
    -[_UIPopoverDimmingView setPassThroughDismissalTaps:](self->_dimmingView, "setPassThroughDismissalTaps:");
  }
}

- (void)_setPopoverBackgroundStyle:(int64_t)a3
{
  _UIPopoverView *popoverView;

  self->_popoverBackgroundStyle = a3;
  popoverView = self->_popoverView;
  if (popoverView)
    -[_UIPopoverView setBackgroundStyle:](popoverView, "setBackgroundStyle:");
}

- (int64_t)_popoverBackgroundStyle
{
  return self->_popoverBackgroundStyle;
}

- (void)_setContentViewController:(id)a3 backgroundStyle:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  UIPopoverPresentationController *v9;
  void (**v10)(_QWORD);
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  UIPopoverPresentationController *v17;

  v5 = a5;
  v8 = a3;
  self->_popoverBackgroundStyle = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__51;
  v16 = __Block_byref_object_dispose__51;
  v9 = self;
  v17 = v9;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__UIPopoverPresentationController__setContentViewController_backgroundStyle_animated___block_invoke;
  v11[3] = &unk_1E16BF7E8;
  v11[4] = &v12;
  v11[5] = a4;
  v10 = (void (**)(_QWORD))_Block_copy(v11);
  objc_msgSend((id)v13[5], "_setContentViewController:animated:", v8, v5);
  if (v5)
  {
    -[UIPopoverPresentationController _presentationAnimationDuration](v9, "_presentationAnimationDuration");
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v10, 0);
  }
  else
  {
    v10[2](v10);
  }

  _Block_object_dispose(&v12, 8);
}

uint64_t __86__UIPopoverPresentationController__setContentViewController_backgroundStyle_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_setPopoverBackgroundStyle:", *(_QWORD *)(a1 + 40));
}

- (void)_presentedViewControllerUserInterfaceStyleChanged
{
  void *v3;
  _UIPopoverView *popoverView;
  void *v5;
  _UIPopoverHostManager *hostManager;
  void *v7;
  id v8;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  popoverView = self->_popoverView;
  v8 = v3;
  objc_msgSend(v3, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setOverrideUserInterfaceStyle:](popoverView, "setOverrideUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));

  if (self->_popoverIdentifier && self->_hostManager && (objc_opt_respondsToSelector() & 1) != 0)
  {
    hostManager = self->_hostManager;
    objc_msgSend(v8, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPopoverHostManager updateUserInterfaceStyle:forPopoverWithIdentifier:](hostManager, "updateUserInterfaceStyle:forPopoverWithIdentifier:", objc_msgSend(v7, "userInterfaceStyle"), self->_popoverIdentifier);

  }
}

- (id)_completionBlockForDismissalWhenNotifyingDelegate:(BOOL)a3
{
  _UIPopoverDimmingView *v5;
  UIPanGestureRecognizer *v6;
  _UIPopoverView *v7;
  UIPopoverPresentationController *v8;
  UIPopoverPresentationController *v9;
  _UIPopoverView *v10;
  _UIPopoverDimmingView *v11;
  UIPanGestureRecognizer *v12;
  void *v13;
  void *v14;
  _QWORD aBlock[4];
  UIPanGestureRecognizer *v17;
  _UIPopoverDimmingView *v18;
  _UIPopoverView *v19;
  UIPopoverPresentationController *v20;
  BOOL v21;

  v5 = self->_dimmingView;
  v6 = self->_dimmingViewGestureRecognizer;
  v7 = self->_popoverView;
  v8 = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__UIPopoverPresentationController__completionBlockForDismissalWhenNotifyingDelegate___block_invoke;
  aBlock[3] = &unk_1E16BF810;
  v17 = v6;
  v18 = v5;
  v21 = a3;
  v19 = v7;
  v20 = v8;
  v9 = v8;
  v10 = v7;
  v11 = v5;
  v12 = v6;
  v13 = _Block_copy(aBlock);
  v14 = _Block_copy(v13);

  return v14;
}

void __85__UIPopoverPresentationController__completionBlockForDismissalWhenNotifyingDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (!v2 || objc_msgSend(v2, "state") != 1 && objc_msgSend(*(id *)(a1 + 32), "state") != 2)
    objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 56), "_sendDidDismiss");
  objc_msgSend(*(id *)(a1 + 56), "_setPresentationState:", 4);
  objc_msgSend(*(id *)(a1 + 56), "_setPopoverView:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("_UIAlertDidDisappearNotification"), *(_QWORD *)(a1 + 56), 0);
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("UIPopoverControllerDidDismissPopoverNotification"), *(_QWORD *)(a1 + 56), 0);

}

- (void)_postludeForDismissal
{
  void *v3;
  void *v4;
  void *v5;
  UIPopoverPresentationController *retainedSelf;

  -[UIPopoverPresentationController setPreferredLayoutInfo:](self, "setPreferredLayoutInfo:", 0);
  -[UIPopoverPresentationController _stopWatchingForNotifications](self, "_stopWatchingForNotifications");
  if (self->_showsTargetRect)
  {
    -[UIPopoverPresentationController _targetRectView](self, "_targetRectView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

  }
  if (self->_showsOrientationMarker)
  {
    -[UIView viewWithTag:](self->_dimmingView, "viewWithTag:", 4277268722);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

  }
  if (self->_showsPresentationArea)
  {
    -[UIView viewWithTag:](self->_dimmingView, "viewWithTag:", 4277268723);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

  }
  *(_WORD *)&self->_popoverControllerFlags &= ~8u;
  if (self->_retainsSelfWhilePresented)
  {
    retainedSelf = self->_retainedSelf;
    self->_retainedSelf = 0;

  }
}

- (BOOL)_popoverIsDismissingBecauseDismissInteractionOccurred
{
  return self->_shouldSendDidDismiss;
}

- (BOOL)dimmingViewWasTapped:(id)a3 withDismissCompletion:(id)a4
{
  return -[UIPopoverPresentationController _attemptDismissalWithCompletion:](self, "_attemptDismissalWithCompletion:", a4);
}

- (BOOL)_allowsFocusInPresentingViewController
{
  return self->__allowsFocusInPresentingViewController;
}

- (void)_setAllowsFocusInPresentingViewController:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  self->__allowsFocusInPresentingViewController = a3;
  -[UIPresentationController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_focusBehavior");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "supportsViewTransparency") & 1) == 0)
  {
    -[UIPresentationController containerView](self, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setFocusInteractionEnabled:", v3 ^ 1);

  }
  if (objc_msgSend(v7, "autoDismissesPopoverControllersOnFocusIntersection"))
  {
    -[UIPopoverPresentationController _updateShouldObserveFocusUpdateNotification:](self, "_updateShouldObserveFocusUpdateNotification:", v3);
    if (v3)
      -[UIPopoverPresentationController _autoDismissIfFocusedItemSufficientlyIntersectsPresentedView](self, "_autoDismissIfFocusedItemSufficientlyIntersectsPresentedView");
  }

}

- (void)_updateShouldObserveFocusUpdateNotification:(BOOL)a3
{
  id v4;

  if (a3)
  {
    if ((*(_WORD *)&self->_popoverControllerFlags & 0x100) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__observeFocusDidUpdateNotification_, CFSTR("UIFocusDidUpdateNotification"), 0);
LABEL_7:

    }
  }
  else if ((*(_WORD *)&self->_popoverControllerFlags & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("UIFocusDidUpdateNotification"), 0);
    goto LABEL_7;
  }
}

- (void)_observeFocusDidUpdateNotification:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  double v10;
  id v11;

  v11 = a3;
  -[UIPopoverPresentationController _cancelDelayedFocusAutoDismiss](self, "_cancelDelayedFocusAutoDismiss");
  v4 = -[UIPopoverPresentationController _shouldAutoDismissOnFocusedItemIntersection](self, "_shouldAutoDismissOnFocusedItemIntersection");
  v5 = v11;
  if (v4)
  {
    objc_msgSend(v11, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UIFocusUpdateContextKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "nextFocusedItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIPopoverPresentationController _focusedItemFrameIntersectsSufficientlyWithPresentedView:](self, "_focusedItemFrameIntersectsSufficientlyWithPresentedView:", v8))
    {
      v9 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_FocusPopoverAutoDismissDelay, (uint64_t)CFSTR("FocusPopoverAutoDismissDelay"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
      v10 = *(double *)&qword_1EDDA7EC8;
      if (v9)
        v10 = 0.3;
      -[UIPopoverPresentationController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__autoDismissIfFocusedItemSufficientlyIntersectsPresentedView, 0, v10);
    }

    v5 = v11;
  }

}

- (void)_cancelDelayedFocusAutoDismiss
{
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__autoDismissIfFocusedItemSufficientlyIntersectsPresentedView, 0);
}

- (void)_autoDismissIfFocusedItemSufficientlyIntersectsPresentedView
{
  void *v3;
  void *v4;
  id v5;

  -[UIPopoverPresentationController _cancelDelayedFocusAutoDismiss](self, "_cancelDelayedFocusAutoDismiss");
  if (-[UIPopoverPresentationController _shouldAutoDismissOnFocusedItemIntersection](self, "_shouldAutoDismissOnFocusedItemIntersection"))
  {
    +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "focusedItem");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (-[UIPopoverPresentationController _focusedItemFrameIntersectsSufficientlyWithPresentedView:](self, "_focusedItemFrameIntersectsSufficientlyWithPresentedView:", v5))
    {
      if (-[UIPresentationController _shouldDismiss](self, "_shouldDismiss"))
      {
        -[UIPresentationController presentedViewController](self, "presentedViewController");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

      }
    }

  }
}

- (BOOL)_shouldAutoDismissOnFocusedItemIntersection
{
  _BOOL4 v3;

  v3 = -[UIPopoverPresentationController _allowsFocusInPresentingViewController](self, "_allowsFocusInPresentingViewController");
  if (v3)
    LOBYTE(v3) = -[UIPresentationController presented](self, "presented");
  return v3;
}

- (BOOL)_focusedItemFrameIntersectsSufficientlyWithPresentedView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v22;
  double v23;
  BOOL v24;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v4 = a3;
  if (v4)
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_existingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_13;
    v7 = _UIFocusItemFrameInCoordinateSpace(v4, v6);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v6, "bounds");
    v29.origin.x = v14;
    v29.origin.y = v15;
    v29.size.width = v16;
    v29.size.height = v17;
    v26.origin.x = v7;
    v26.origin.y = v9;
    v26.size.width = v11;
    v26.size.height = v13;
    v27 = CGRectIntersection(v26, v29);
    x = v27.origin.x;
    y = v27.origin.y;
    width = v27.size.width;
    height = v27.size.height;
    if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_FocusPopoverAutoDismissIntersectionThreshold, (uint64_t)CFSTR("FocusPopoverAutoDismissIntersectionThreshold"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v22 = 5.0;
    else
      v22 = *(double *)&qword_1EDDA7EB8;
    if (v13 >= v22)
      v13 = v22;
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    if (!CGRectIsNull(v28) && (v11 >= v22 ? (v23 = v22) : (v23 = v11), width >= v23))
      v24 = height >= v13;
    else
LABEL_13:
      v24 = 0;

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BOOL)popoverDimmingViewShouldAllowInteraction:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  -[UIPresentationController _childPresentationController](self, "_childPresentationController", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    return -[UIPresentationController presented](self, "presented");
  v5 = (void *)v4;
  while ((objc_msgSend(v5, "shouldPresentInFullscreen") & 1) == 0)
  {
    objc_msgSend(v5, "_childPresentationController");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
    if (!v6)
      return -[UIPresentationController presented](self, "presented");
  }

  return 0;
}

- (BOOL)popoverDimmingViewDidReceiveDismissalInteraction:(id)a3
{
  return -[UIPopoverPresentationController dimmingViewWasTapped:withDismissCompletion:](self, "dimmingViewWasTapped:withDismissCompletion:", a3, 0);
}

- (void)_setGesturesEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UIGestureRecognizer setEnabled:](self->_vendedGestureRecognizer, "setEnabled:");
  -[UIGestureRecognizer setEnabled:](self->_dimmingViewGestureRecognizer, "setEnabled:", v3);
}

+ (BOOL)_forceAttemptsToAvoidKeyboard
{
  if (qword_1ECD7A258 != -1)
    dispatch_once(&qword_1ECD7A258, &__block_literal_global_54_0);
  return byte_1ECD7A249;
}

void __64__UIPopoverPresentationController__forceAttemptsToAvoidKeyboard__block_invoke()
{
  void *v0;
  id v1;

  _UIKitPreferencesOnce();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("UIPopoverControllerForceAttemptsToAvoidKeyboard"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  byte_1ECD7A249 = objc_msgSend(v0, "BOOLValue");

}

- (void)setPopoverLayoutMargins:(UIEdgeInsets)popoverLayoutMargins
{
  _UIPopoverLayoutInfo *preferredLayoutInfo;
  void *v8;
  _QWORD v9[5];

  if (self->_popoverLayoutMargins.left != popoverLayoutMargins.left
    || self->_popoverLayoutMargins.top != popoverLayoutMargins.top
    || self->_popoverLayoutMargins.right != popoverLayoutMargins.right
    || self->_popoverLayoutMargins.bottom != popoverLayoutMargins.bottom)
  {
    self->_popoverLayoutMargins = popoverLayoutMargins;
    preferredLayoutInfo = self->_preferredLayoutInfo;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__UIPopoverPresentationController_setPopoverLayoutMargins___block_invoke;
    v9[3] = &unk_1E16B1B28;
    v9[4] = self;
    -[_UIPopoverLayoutInfo updateProperties:](preferredLayoutInfo, "updateProperties:", v9);
    -[UIPresentationController containerView](self, "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsLayout");

  }
}

uint64_t __59__UIPopoverPresentationController_setPopoverLayoutMargins___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[58];
  objc_msgSend(v1, "_containingFrameInsets");
  return objc_msgSend(v2, "setContainingFrameInsets:");
}

- (UIEdgeInsets)_containingFrameInsets
{
  double v3;
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
  void *v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UIEdgeInsets result;

  -[UIPopoverPresentationController popoverLayoutMargins](self, "popoverLayoutMargins");
  v6 = v3;
  v8 = v7;
  v9 = v4;
  v10 = v5;
  if (v7 == 0.0 && v3 == 0.0 && v5 == 0.0 && v4 == 0.0)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultPopoverLayoutMarginsForPopoverControllerStyle:andContentViewController:", self->_popoverControllerStyle, self->_contentViewController);
    v6 = v11;
    v8 = v12;
    v9 = v13;
    v10 = v14;
    -[UIPopoverPresentationController _popoverHostingWindow](self, "_popoverHostingWindow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "_isRemoteInputHostWindow");

    if (v16)
    {
      +[UIKeyboardImpl persistentOffset](UIKeyboardImpl, "persistentOffset");
      v18 = 0.0;
      if (v17 < 0.0)
      {
        v19 = v17;
        v20 = -v17;
        v21 = +[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit", 0.0);
        v18 = -100.0 - v19;
        if (!v21)
          v18 = v20;
        if (v18 >= 200.0)
          v18 = 200.0;
      }
      v6 = v6 + v18;
    }
  }
  v22 = v6;
  v23 = v8;
  v24 = v9;
  v25 = v10;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (id)_layoutInfoForCurrentKeyboardState
{
  void *v3;
  void *v4;

  -[UIView window](self->_popoverView, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPopoverPresentationController _layoutInfoForCurrentKeyboardStateAndHostingWindow:](self, "_layoutInfoForCurrentKeyboardStateAndHostingWindow:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_moveAwayFromTheKeyboard:(id)a3 showing:(BOOL)a4
{
  _BOOL8 v4;
  _UIPopoverView *popoverView;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  CGSize v14;
  double v15;
  uint64_t v16;
  id v17;
  void (**v18)(void *, _QWORD);
  void *v19;
  void *v20;
  _QWORD aBlock[5];
  id v22;
  double v23;

  if ((*(_WORD *)&self->_popoverControllerFlags & 0x40) == 0)
  {
    v4 = a4;
    popoverView = self->_popoverView;
    v7 = a3;
    -[UIView layoutIfNeeded](popoverView, "layoutIfNeeded");
    -[UIPopoverPresentationController _layoutInfoForCurrentKeyboardState](self, "_layoutInfoForCurrentKeyboardState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("UIKeyboardAnimationDurationUserInfoKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "doubleValue");
      v11 = v10;
    }
    else
    {
      v11 = 0.0;
    }
    -[UIPresentationController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "frame");
      if (objc_msgSend(v12, "_popoverPresentationController:shouldRecalculateArrowDirectionOnKeyboardVisibilityChange:proposedHeight:", self, v4, v13))
      {
        v14 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
        self->_previousContainerViewRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
        self->_previousContainerViewRect.size = v14;
        if (v11 == 0.0)
        {
          -[UIPopoverPresentationController _presentationAnimationDuration](self, "_presentationAnimationDuration");
          v11 = v15;
        }
        -[_UIPopoverLayoutInfo setPreferredArrowDirections:](self->_preferredLayoutInfo, "setPreferredArrowDirections:", self->_permittedArrowDirections);
        -[UIPopoverPresentationController _layoutInfoForCurrentKeyboardState](self, "_layoutInfoForCurrentKeyboardState");
        v16 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v16;
      }
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__UIPopoverPresentationController__moveAwayFromTheKeyboard_showing___block_invoke;
    aBlock[3] = &unk_1E16BF838;
    v23 = v11;
    aBlock[4] = self;
    v22 = v8;
    v17 = v8;
    v18 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_transitionCoordinator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      if (objc_msgSend(v20, "isInteractive"))
        objc_msgSend(v20, "notifyWhenInteractionChangesUsingBlock:", v18);
      else
        objc_msgSend(v20, "animateAlongsideTransition:completion:", 0, v18);
    }
    else
    {
      v18[2](v18, 0);
    }

  }
}

void __68__UIPopoverPresentationController__moveAwayFromTheKeyboard_showing___block_invoke(double *a1)
{
  double v1;
  void *v2;
  _QWORD v3[5];
  id v4;

  v1 = a1[6];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__UIPopoverPresentationController__moveAwayFromTheKeyboard_showing___block_invoke_2;
  v3[3] = &unk_1E16B1B50;
  v2 = (void *)*((_QWORD *)a1 + 5);
  *(double *)&v3[4] = a1[4];
  v4 = v2;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 132, v3, 0, v1, 0.0);

}

uint64_t __68__UIPopoverPresentationController__moveAwayFromTheKeyboard_showing___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[45];
  if ((objc_msgSend(v2, "_shouldHideArrow") & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(a1 + 40), "arrowDirection");
  objc_msgSend(v3, "setArrowDirection:", v4);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 360);
  objc_msgSend(*(id *)(a1 + 40), "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 40), "offset");
  return objc_msgSend(v5, "_setFrame:arrowOffset:", v7, v9, v11, v13, v14);
}

- (void)_keyboardWillShow:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[UIPopoverPresentationController _sendDelegateWillRepositionToRect](self, "_sendDelegateWillRepositionToRect");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__UIPopoverPresentationController__keyboardWillShow___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __53__UIPopoverPresentationController__keyboardWillShow___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_moveAwayFromTheKeyboard:showing:", v2, 1);

}

- (void)_keyboardDidHide:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[UIPopoverPresentationController _sendDelegateWillRepositionToRect](self, "_sendDelegateWillRepositionToRect");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__UIPopoverPresentationController__keyboardDidHide___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __52__UIPopoverPresentationController__keyboardDidHide___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_moveAwayFromTheKeyboard:showing:", v2, 0);

}

- (void)_startWatchingForKeyboardNotificationsIfNecessary
{
  id v3;

  if (-[UIPopoverPresentationController _attemptsToAvoidKeyboard](self, "_attemptsToAvoidKeyboard"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, CFSTR("UIKeyboardWillShowNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardDidHide_, CFSTR("UIKeyboardDidHideNotification"), 0);

  }
}

- (void)_stopWatchingForKeyboardNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIKeyboardWillShowNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIKeyboardDidHideNotification"), 0);

}

- (void)_scrollViewWillBeginDragging:(id)a3
{
  _UIPopoverView *popoverView;
  void *v5;
  int v6;
  unsigned int draggingChildScrollViewCount;
  __int16 v8;
  id v9;

  popoverView = self->_popoverView;
  objc_msgSend(a3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (popoverView)
  {
    v9 = v5;
    v6 = objc_msgSend(v5, "isDescendantOfView:", popoverView);

    if (v6)
    {
      draggingChildScrollViewCount = self->draggingChildScrollViewCount;
      if (!draggingChildScrollViewCount)
      {
        if (-[UIDimmingView ignoresTouches](self->_dimmingView, "ignoresTouches"))
          v8 = 4;
        else
          v8 = 0;
        *(_WORD *)&self->_popoverControllerFlags = *(_WORD *)&self->_popoverControllerFlags & 0xFFFB | v8;
        -[UIDimmingView setIgnoresTouches:](self->_dimmingView, "setIgnoresTouches:", 1);
        draggingChildScrollViewCount = self->draggingChildScrollViewCount;
      }
      self->draggingChildScrollViewCount = draggingChildScrollViewCount + 1;
    }
  }
  else
  {

  }
}

- (void)_scrollViewDidEndDragging:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  unsigned int v7;
  void *v8;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_popoverView)
  {
    v8 = v4;
    v6 = objc_msgSend(v4, "isDescendantOfView:");
    v5 = v8;
    if (v6)
    {
      v7 = self->draggingChildScrollViewCount - 1;
      self->draggingChildScrollViewCount = v7;
      if (!v7)
      {
        -[UIDimmingView setIgnoresTouches:](self->_dimmingView, "setIgnoresTouches:", (*(_WORD *)&self->_popoverControllerFlags >> 2) & 1);
        v5 = v8;
      }
    }
  }

}

- (void)_startWatchingForScrollViewNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__scrollViewWillBeginDragging_, CFSTR("_UIScrollViewWillBeginDraggingNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__scrollViewDidEndDragging_, CFSTR("_UIScrollViewDidEndDraggingNotification"), 0);

}

- (void)_stopWatchingForScrollViewNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIScrollViewWillBeginDraggingNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIScrollViewDidEndDraggingNotification"), 0);

}

- (UISheetPresentationController)adaptiveSheetPresentationController
{
  UISheetPresentationController *adaptiveSheetPresentationController;
  _UIFormSheetPresentationController *v4;
  void *v5;
  void *v6;
  UISheetPresentationController *v7;
  UISheetPresentationController *v8;

  adaptiveSheetPresentationController = self->_adaptiveSheetPresentationController;
  if (!adaptiveSheetPresentationController)
  {
    v4 = [_UIFormSheetPresentationController alloc];
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UISheetPresentationController initWithPresentedViewController:presentingViewController:](v4, "initWithPresentedViewController:presentingViewController:", v5, v6);
    v8 = self->_adaptiveSheetPresentationController;
    self->_adaptiveSheetPresentationController = v7;

    adaptiveSheetPresentationController = self->_adaptiveSheetPresentationController;
  }
  return adaptiveSheetPresentationController;
}

- (id)_adaptiveFormSheetPresentationController
{
  return self->_adaptiveSheetPresentationController;
}

- (BOOL)_ignoresKeyboardNotifications
{
  return self->_ignoresKeyboardNotifications;
}

- (void)_setIgnoresKeyboardNotifications:(BOOL)a3
{
  _UIPopoverView *popoverView;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (self->_ignoresKeyboardNotifications != a3)
  {
    self->_ignoresKeyboardNotifications = a3;
    if (a3)
    {
      -[UIPopoverPresentationController _stopWatchingForKeyboardNotifications](self, "_stopWatchingForKeyboardNotifications");
      if (UIKeyboardAutomaticIsOnScreen())
      {
        popoverView = self->_popoverView;
        -[_UIPopoverLayoutInfo frame](self->_preferredLayoutInfo, "frame");
        v6 = v5;
        v8 = v7;
        v10 = v9;
        v12 = v11;
        -[_UIPopoverLayoutInfo offset](self->_preferredLayoutInfo, "offset");
        -[_UIPopoverView _setFrame:arrowOffset:](popoverView, "_setFrame:arrowOffset:", v6, v8, v10, v12, v13);
      }
    }
    else if (-[UIPopoverPresentationController _attemptsToAvoidKeyboard](self, "_attemptsToAvoidKeyboard"))
    {
      -[UIPopoverPresentationController _startWatchingForKeyboardNotificationsIfNecessary](self, "_startWatchingForKeyboardNotificationsIfNecessary");
      if (UIKeyboardAutomaticIsOnScreen())
        -[UIPopoverPresentationController _moveAwayFromTheKeyboard:showing:](self, "_moveAwayFromTheKeyboard:showing:", 0, 0);
    }
  }
}

- (BOOL)_overrideAllowsHitTestingOnBackgroundViews
{
  return self->_overrideAllowsHitTestingOnBackgroundViews;
}

- (void)_setOverrideAllowsHitTestingOnBackgroundViews:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL8 overrideAllowsHitTestingOnBackgroundViews;
  void *v7;

  v3 = a3;
  self->_overrideAllowsHitTestingOnBackgroundViews = a3;
  -[UIView layer](self->_dimmingView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsHitTesting:", v3);

  overrideAllowsHitTestingOnBackgroundViews = self->_overrideAllowsHitTestingOnBackgroundViews;
  -[UIView layer](self->_shadowView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsHitTesting:", overrideAllowsHitTestingOnBackgroundViews);

  -[_UIPopoverDimmingView _setOverrideAllowsHitTestingOnTouchFallbackView:](self->_dimmingView, "_setOverrideAllowsHitTestingOnTouchFallbackView:", self->_overrideAllowsHitTestingOnBackgroundViews);
}

- (void)_stopWatchingForNotifications
{
  -[UIPopoverPresentationController _stopWatchingForKeyboardNotifications](self, "_stopWatchingForKeyboardNotifications");
  -[UIPopoverPresentationController _stopWatchingForScrollViewNotifications](self, "_stopWatchingForScrollViewNotifications");
}

- (BOOL)_fallbackShouldDismiss
{
  void *v3;
  char v4;

  -[UIPresentationController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (-[UIPresentationController presented](self, "presented")
      && !-[UIPresentationController dismissing](self, "dismissing"))
    {
      v4 = objc_msgSend(v3, "popoverPresentationControllerShouldDismissPopover:", self);
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)_sendFallbackWillDismiss
{
  id v3;

  -[UIPresentationController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "popoverPresentationControllerWillDismissPopover:", self);

}

- (void)_sendFallbackDidDismiss
{
  id v3;

  -[UIPresentationController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "popoverPresentationControllerDidDismissPopover:", self);

}

- (BOOL)_isPresenting
{
  return self->_presentationState == 1;
}

- (BOOL)_isDismissing
{
  return self->_presentationState == 3;
}

- (BOOL)isPresentingOrDismissing
{
  return -[UIPopoverPresentationController _isPresenting](self, "_isPresenting")
      || -[UIPopoverPresentationController _isDismissing](self, "_isDismissing");
}

- (BOOL)_embedsInView
{
  return (*(_WORD *)&self->_popoverControllerFlags >> 4) & 1;
}

- (BOOL)_presentationPotentiallyUnderlapsStatusBar
{
  return 0;
}

- (id)_dimmingView
{
  return self->_dimmingView;
}

- (id)presentedView
{
  return self->_popoverView;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIView _frameIgnoringLayerTransform](self->_popoverView, "_frameIgnoringLayerTransform");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)shouldPresentInFullscreen
{
  return 1;
}

- (id)_initialPresentationViewControllerForViewController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (dyld_program_sdk_at_least()
    && !-[UIPopoverPresentationController _allowsSourceViewInDifferentWindowThanInitialPresentationViewController](self, "_allowsSourceViewInDifferentWindowThanInitialPresentationViewController"))
  {
    -[UIPresentationController _realSourceView](self, "_realSourceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_window");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = 0;
    if (v8 && v7 && v7 != (void *)v8)
    {
      objc_msgSend(v6, "_viewControllerForAncestor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v10)
      v11 = v10;
    else
      v11 = v4;
    v5 = v11;

  }
  else
  {
    v5 = v4;
  }

  return v5;
}

- (UIEdgeInsets)_baseContentInsetsWithLeftMargin:(double *)a3 rightMargin:(double *)a4
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
  double v14;
  double v15;
  double v16;
  objc_super v17;
  UIEdgeInsets result;

  v17.receiver = self;
  v17.super_class = (Class)UIPopoverPresentationController;
  -[UIPresentationController _baseContentInsetsWithLeftMargin:rightMargin:](&v17, sel__baseContentInsetsWithLeftMargin_rightMargin_, a3, a4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (!-[_UIPopoverView contentExtendsOverArrow](self->_popoverView, "contentExtendsOverArrow"))
  {
    v12 = 0.0;
    v10 = 0.0;
    v8 = 0.0;
    v6 = 0.0;
  }
  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (id)_presentationView
{
  void *v3;
  _UIPopoverView *popoverView;
  objc_super v6;

  if (-[_UIPopoverHostManager useDefaultPresentationViewForPopoverWithIdentifier:](self->_hostManager, "useDefaultPresentationViewForPopoverWithIdentifier:", self->_popoverIdentifier))
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPopoverPresentationController;
    -[UIPresentationController _presentationView](&v6, sel__presentationView);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    popoverView = self->_popoverView;
    if (popoverView)
      return popoverView->_contentView;
    v3 = 0;
  }
  return v3;
}

- (BOOL)_shouldOccludeDuringPresentation
{
  int v3;
  _UIPopoverHostManager *hostManager;

  v3 = -[UIPopoverPresentationController _shouldDimPresentingViewTint](self, "_shouldDimPresentingViewTint");
  if (v3)
  {
    hostManager = self->_hostManager;
    if (hostManager)
      LOBYTE(v3) = -[_UIPopoverHostManager shouldOccludeDuringPresentationForPopoverWithIdentifier:](hostManager, "shouldOccludeDuringPresentationForPopoverWithIdentifier:", self->_popoverIdentifier);
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)_shouldPresentedViewControllerServeAsBaseForScrollToTop
{
  void *v2;
  BOOL v3;

  -[UIPopoverPresentationController _passthroughViews](self, "_passthroughViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (id)_exceptionStringForNilSourceViewOrBarButtonItem
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIPopoverPresentationController (%@) should have a non-nil sourceView or barButtonItem set before the presentation occurs."), self);
}

- (int64_t)presentationStyle
{
  return 7;
}

- (BOOL)_shouldPopoverContentExtendOverArrowForViewController:(id)a3 backgroundViewClass:(Class)a4
{
  id v5;
  BOOL v6;

  v5 = a3;
  v6 = dyld_program_sdk_at_least()
    && (objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && +[_UIPopoverStandardChromeView standardChromeViewClass](_UIPopoverStandardChromeView, "standardChromeViewClass") == a4;

  return v6;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  UIViewController *v4;
  UIViewController *contentViewController;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  _UIPopoverDimmingView *dimmingView;
  void *v38;
  _UIPopoverDimmingView *v39;
  void *v40;
  void *v41;
  char isKindOfClass;
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
  objc_class *popoverBackgroundViewClass;
  _UIPopoverLayoutInfo *v54;
  _UIPopoverLayoutInfo *preferredLayoutInfo;
  _UIPopoverLayoutInfo *v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  CGSize v61;
  void *v62;
  uint64_t v63;
  NSString *v64;
  NSString *popoverIdentifier;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  id v72;
  void *v73;
  _QWORD v74[5];
  _QWORD v75[5];
  id v76;
  objc_class *v77;
  _QWORD v78[5];
  id v79;
  objc_class *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  const __CFString *v85;
  void *v86;
  _BYTE v87[128];
  void *v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  void *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  -[UIPopoverPresentationController _createHostManagerIfNeeded](self, "_createHostManagerIfNeeded");
  -[UIPresentationController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "prepareForPopoverPresentation:", self);
  self->_presentationState = 1;
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  contentViewController = self->_contentViewController;
  self->_contentViewController = v4;

  if (-[UIPopoverPresentationController _centersPopoverIfSourceViewNotSet](self, "_centersPopoverIfSourceViewNotSet"))
  {
    -[UIPresentationController _realSourceView](self, "_realSourceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[UIPresentationController containerView](self, "containerView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPresentationController setSourceView:](self, "setSourceView:", v7);

      self->_permittedArrowDirections = 0;
      self->_useSourceViewBoundsAsSourceRect = 1;
      if (-[UIPopoverPresentationController _softAssertWhenNoSourceViewOrBarButtonItemSpecified](self, "_softAssertWhenNoSourceViewOrBarButtonItemSpecified"))
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
            goto LABEL_12;
          -[UIPresentationController presentedViewController](self, "presentedViewController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPresentationController presentingViewController](self, "presentingViewController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v90 = v11;
          v91 = 2112;
          v92 = v12;
          _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Tried to present %@ from %@ as a popover without setting a sourceView or barButtonItem.", buf, 0x16u);
LABEL_11:

LABEL_12:
          goto LABEL_13;
        }
        v8 = presentationTransitionWillBegin___s_category;
        if (!presentationTransitionWillBegin___s_category)
        {
          v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v8, (unint64_t *)&presentationTransitionWillBegin___s_category);
        }
        v9 = *(NSObject **)(v8 + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = v9;
          -[UIPresentationController presentedViewController](self, "presentedViewController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPresentationController presentingViewController](self, "presentingViewController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v90 = v11;
          v91 = 2112;
          v92 = v12;
          _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Tried to present %@ from %@ as a popover without setting a sourceView or barButtonItem.", buf, 0x16u);
          goto LABEL_11;
        }
      }
    }
  }
LABEL_13:
  -[UIPresentationController _realSourceView](self, "_realSourceView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v73)
  {
    v69 = (void *)MEMORY[0x1E0C99DA0];
    v70 = *MEMORY[0x1E0C99750];
    -[UIPopoverPresentationController _exceptionStringForNilSourceViewOrBarButtonItem](self, "_exceptionStringForNilSourceViewOrBarButtonItem");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "exceptionWithName:reason:userInfo:", v70, v71, 0);
    v72 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v72);
  }
  -[UIPresentationController barButtonItem](self, "barButtonItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    v16 = -[UIPopoverPresentationController _ignoreBarButtonItemSiblings](self, "_ignoreBarButtonItemSiblings");

    if (!v16)
    {
      objc_msgSend(v13, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "superview");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "subviews");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "arrayByExcludingObjectsInArray:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v22, "count"))
      {
        -[UIPopoverPresentationController passthroughViews](self, "passthroughViews");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

        if (v24)
        {
          -[UIPopoverPresentationController passthroughViews](self, "passthroughViews");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v25, "mutableCopy");

          v83 = 0u;
          v84 = 0u;
          v81 = 0u;
          v82 = 0u;
          v27 = v22;
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v82;
            do
            {
              for (i = 0; i != v29; ++i)
              {
                if (*(_QWORD *)v82 != v30)
                  objc_enumerationMutation(v27);
                v32 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i);
                if ((objc_msgSend(v26, "containsObject:", v32) & 1) == 0)
                  objc_msgSend(v26, "addObject:", v32);
              }
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
            }
            while (v29);
          }

          -[UIPopoverPresentationController setPassthroughViews:](self, "setPassthroughViews:", v26);
        }
        else
        {
          -[UIPopoverPresentationController setPassthroughViews:](self, "setPassthroughViews:", v22);
        }
      }
      self->_permittedArrowDirections &= 3uLL;

    }
  }
  -[UIPresentationController containerView](self, "containerView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_focusBehavior");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "supportsViewTransparency");

  if ((v35 & 1) == 0)
  {
    -[UIPresentationController containerView](self, "containerView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_setFocusInteractionEnabled:", -[UIPopoverPresentationController _allowsFocusInPresentingViewController](self, "_allowsFocusInPresentingViewController") ^ 1);

  }
  -[UIPopoverPresentationController _transitionFromViewController:toViewController:animated:](self, "_transitionFromViewController:toViewController:animated:", 0, self->_contentViewController, 0);
  dimmingView = self->_dimmingView;
  -[UIPresentationController containerView](self, "containerView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bounds");
  -[UIView setFrame:](dimmingView, "setFrame:");

  -[UIView setTintAdjustmentMode:](self->_dimmingView, "setTintAdjustmentMode:", 1);
  -[UIView setAutoresizingMask:](self->_dimmingView, "setAutoresizingMask:", 18);
  -[UIDimmingView setDelegate:](self->_dimmingView, "setDelegate:", self);
  v39 = self->_dimmingView;
  -[UIPresentationController containerView](self, "containerView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverDimmingView setTransitionContainerView:](v39, "setTransitionContainerView:", v40);

  -[UIView setUserInteractionEnabled:](self->_dimmingView, "setUserInteractionEnabled:", 1);
  if (dyld_program_sdk_at_least())
  {
    -[UIPresentationController containerView](self, "containerView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[UIPresentationController containerView](self, "containerView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setIgnoreDirectTouchEvents:", 1);

    }
  }
  -[UIPopoverPresentationController _popoverHostingWindow](self, "_popoverHostingWindow");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v44, "_isTextEffectsWindow"))
    *(_WORD *)&self->_popoverControllerFlags |= 8u;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "postNotificationName:object:userInfo:", CFSTR("_UIAlertWillAppearNotification"), self, 0);
  v85 = CFSTR("UIPopoverControllerPresentingWindowKey");
  v86 = v44;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "postNotificationName:object:userInfo:", CFSTR("UIPopoverControllerWillPresentPopoverNotification"), self, v46);

  if (self->_retainsSelfWhilePresented)
    objc_storeStrong((id *)&self->_retainedSelf, self);
  -[UIPresentationController containerView](self, "containerView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addSubview:", self->_dimmingView);

  -[UIPopoverPresentationController _sourceOverlayView](self, "_sourceOverlayView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    -[UIPresentationController containerView](self, "containerView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPopoverPresentationController _sourceOverlayView](self, "_sourceOverlayView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addSubview:", v50);

    -[UIPopoverPresentationController _updateSourceOverlayViewConstraints](self, "_updateSourceOverlayViewConstraints");
  }
  if (-[UIPopoverPresentationController showsTargetRect](self, "showsTargetRect"))
  {
    -[UIPresentationController containerView](self, "containerView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPopoverPresentationController _targetRectView](self, "_targetRectView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addSubview:", v52);

  }
  popoverBackgroundViewClass = self->_popoverBackgroundViewClass;
  if (!popoverBackgroundViewClass)
    popoverBackgroundViewClass = -[UIPopoverPresentationController _defaultChromeViewClass](self, "_defaultChromeViewClass");
  v54 = (_UIPopoverLayoutInfo *)objc_alloc_init(-[UIPopoverPresentationController _popoverLayoutInfoForChromeClass:](self, "_popoverLayoutInfoForChromeClass:", popoverBackgroundViewClass));
  preferredLayoutInfo = self->_preferredLayoutInfo;
  self->_preferredLayoutInfo = v54;

  v56 = self->_preferredLayoutInfo;
  v57 = MEMORY[0x1E0C809B0];
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __66__UIPopoverPresentationController_presentationTransitionWillBegin__block_invoke;
  v78[3] = &unk_1E16BF860;
  v78[4] = self;
  v80 = popoverBackgroundViewClass;
  v58 = v44;
  v79 = v58;
  -[_UIPopoverLayoutInfo updateProperties:](v56, "updateProperties:", v78);
  -[UIPopoverPresentationController _layoutInfoForCurrentKeyboardStateAndHostingWindow:](self, "_layoutInfoForCurrentKeyboardStateAndHostingWindow:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v59;
  v61 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_previousContainerViewRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_previousContainerViewRect.size = v61;
  if (self->_hostManager)
  {
    -[UIPopoverPresentationController _hostManagerPopoverCreationConfiguration](self, "_hostManagerPopoverCreationConfiguration");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPopoverPresentationController _sourceRectInContainerView](self, "_sourceRectInContainerView");
    objc_msgSend(v62, "setSourceRectInParentUIWindow:");
    objc_msgSend(v62, "setCompletionBlock:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v63 = objc_msgSend(v60, "arrowDirection");
    else
      v63 = -[UIPopoverPresentationController permittedArrowDirections](self, "permittedArrowDirections");
    objc_msgSend(v62, "setPermittedArrowDirections:", v63);
    -[UIPopoverPresentationController _createHostManagerPopoverWithConfiguration:](self, "_createHostManagerPopoverWithConfiguration:", v62);
    v64 = (NSString *)objc_claimAutoreleasedReturnValue();
    popoverIdentifier = self->_popoverIdentifier;
    self->_popoverIdentifier = v64;

  }
  else
  {
    v75[0] = v57;
    v75[1] = 3221225472;
    v75[2] = __66__UIPopoverPresentationController_presentationTransitionWillBegin__block_invoke_2;
    v75[3] = &unk_1E16BF888;
    v75[4] = self;
    v76 = v59;
    v77 = popoverBackgroundViewClass;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v75);

  }
  -[UIPopoverPresentationController _transitionFromViewController:toViewController:animated:](self, "_transitionFromViewController:toViewController:animated:", 0, self->_contentViewController, 0);
  -[UIPopoverPresentationController _startWatchingForKeyboardNotificationsIfNecessary](self, "_startWatchingForKeyboardNotificationsIfNecessary");
  if (!-[UIPopoverPresentationController _shouldUseNewPopoverAnimations](self, "_shouldUseNewPopoverAnimations"))
  {
    -[_UIPopoverView setChromeHidden:](self->_popoverView, "setChromeHidden:", 1);
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "_transitionCoordinator");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (v67)
    {
      v74[0] = v57;
      v74[1] = 3221225472;
      v74[2] = __66__UIPopoverPresentationController_presentationTransitionWillBegin__block_invoke_3;
      v74[3] = &unk_1E16B2150;
      v74[4] = self;
      objc_msgSend(v67, "animateAlongsideTransition:completion:", v74, 0);
    }
    else
    {
      -[_UIPopoverView setChromeHidden:](self->_popoverView, "setChromeHidden:", 0);
    }
    -[UIView setAlpha:](self->_shadowView, "setAlpha:", 1.0);

  }
  -[UIView layer](self->_popoverView, "layer");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setAllowsGroupOpacity:", 0);

  -[UIPopoverPresentationController _startWatchingForScrollViewNotifications](self, "_startWatchingForScrollViewNotifications");
}

void __66__UIPopoverPresentationController_presentationTransitionWillBegin__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = (void *)*((_QWORD *)a1[4] + 58);
  objc_msgSend(a1[6], "contentViewInsets");
  objc_msgSend(v2, "setContentInset:");
  v3 = (void *)*((_QWORD *)a1[4] + 58);
  objc_msgSend(a1[6], "arrowHeight");
  objc_msgSend(v3, "setArrowHeight:");
  objc_msgSend(*((id *)a1[4] + 58), "setPreferredContentSize:", *((double *)a1[4] + 60), *((double *)a1[4] + 61));
  objc_msgSend(*((id *)a1[4] + 58), "setPreferredArrowDirections:", *((_QWORD *)a1[4] + 91));
  v4 = a1[4];
  v5 = (void *)v4[58];
  objc_msgSend(v4, "_containingFrame");
  objc_msgSend(v5, "setContainingFrame:");
  v6 = a1[4];
  v7 = (void *)v6[58];
  objc_msgSend(v6, "_containingFrameInsets");
  objc_msgSend(v7, "setContainingFrameInsets:");
  v8 = a1[4];
  v9 = (void *)v8[58];
  objc_msgSend(v8, "_sourceRectInContainerView");
  objc_msgSend(v9, "setSourceViewRect:");
  v10 = (void *)*((_QWORD *)a1[4] + 58);
  objc_msgSend(a1[5], "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPreferLandscapeOrientations:", (unint64_t)(objc_msgSend(v11, "interfaceOrientation") - 3) < 0xFFFFFFFFFFFFFFFELL);

  objc_msgSend(*((id *)a1[4] + 58), "setCanOverlapSourceViewRect:", *((unsigned __int8 *)a1[4] + 537));
  objc_msgSend(*((id *)a1[4] + 58), "setPreferredHorizontalAlignment:", objc_msgSend(a1[4], "_preferredHorizontalAlignment"));
  objc_msgSend(a1[4], "containerView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)a1[4] + 58), "setIsRTL:", objc_msgSend(v12, "effectiveUserInterfaceLayoutDirection") == 1);

}

void __66__UIPopoverPresentationController_presentationTransitionWillBegin__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  _QWORD *v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_popoverViewClass"));
  objc_msgSend(*(id *)(a1 + 40), "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(void **)(a1 + 32);
  objc_msgSend(v13, "presentedViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v3, "initWithFrame:backgroundViewClass:embeddedInView:contentExtendsOverArrow:", v12, 0, objc_msgSend(v13, "_shouldPopoverContentExtendOverArrowForViewController:backgroundViewClass:", v14, *(_QWORD *)(a1 + 48)), v5, v7, v9, v11);
  objc_msgSend(v2, "_setPopoverView:", v15);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "backgroundView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setChromeHidden:", objc_msgSend(*(id *)(a1 + 32), "_backgroundBlurDisabled"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "setBackgroundBlurEffectStyle:", objc_msgSend(*(id *)(a1 + 32), "_backgroundBlurEffectStyle"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "setShadowView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 376));
  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(void **)(*(_QWORD *)(a1 + 32) + 360);
  objc_msgSend(v17, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setOverrideUserInterfaceStyle:", objc_msgSend(v19, "userInterfaceStyle"));

  v28[0] = 0x1E1A994B0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v17, "_registerForTraitTokenChanges:withTarget:action:", v20, *(_QWORD *)(a1 + 32), sel__presentedViewControllerUserInterfaceStyleChanged);

  v22 = *(void **)(*(_QWORD *)(a1 + 32) + 360);
  objc_msgSend(*(id *)(a1 + 40), "offset");
  objc_msgSend(v22, "setArrowOffset:");
  v23 = *(_QWORD **)(a1 + 32);
  v24 = (void *)v23[45];
  if ((objc_msgSend(v23, "_shouldHideArrow") & 1) != 0)
    v25 = 0;
  else
    v25 = objc_msgSend(*(id *)(a1 + 40), "arrowDirection");
  objc_msgSend(v24, "setArrowDirection:", v25);
  v26 = *(_QWORD **)(a1 + 32);
  v27 = (void *)v26[45];
  objc_msgSend(v26, "_cornerRadius");
  objc_msgSend(v27, "_setCustomCornerRadius:");
  objc_msgSend(*(id *)(a1 + 32), "_setPopoverBackgroundStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "setPopoverBackgroundColor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 448));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "setArrowBackgroundColor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456));

}

uint64_t __66__UIPopoverPresentationController_presentationTransitionWillBegin__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "setChromeHidden:", 0);
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  void *v4;

  -[UIView layer](self->_popoverView, "layer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsGroupOpacity:", 1);

  self->_presentationState = 2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_UIPopoverHostManager transitionDidEnd:popoverIdentifier:](self->_hostManager, "transitionDidEnd:popoverIdentifier:", 1, self->_popoverIdentifier);
}

- (void)dismissalTransitionWillBegin
{
  void *v2;
  _BOOL4 shouldSendDidDismiss;
  UIBarButtonItem *targetBarButtonItem;
  UIView *layoutConstraintView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  unint64_t v23;
  NSObject *v24;
  _UIPopoverView *v25;
  _UIPopoverView *popoverView;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD aBlock[5];
  id location;
  _QWORD v36[5];
  BOOL v37;
  uint8_t buf[4];
  _UIPopoverView *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[UIPopoverPresentationController _createHostManagerIfNeeded](self, "_createHostManagerIfNeeded");
  shouldSendDidDismiss = self->_shouldSendDidDismiss;
  targetBarButtonItem = self->_targetBarButtonItem;
  if (targetBarButtonItem)
  {
    self->_targetBarButtonItem = 0;

  }
  layoutConstraintView = self->_layoutConstraintView;
  if (layoutConstraintView)
  {
    self->_layoutConstraintView = 0;

  }
  if (self->_hostManager)
  {
    -[UIPopoverPresentationController _hostManagerPopoverCloseConfiguration](self, "_hostManagerPopoverCloseConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_transitionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTransitionCoordinator:", v9);

    -[_UIPopoverHostManager closePopoverWithIdentifier:configuration:](self->_hostManager, "closePopoverWithIdentifier:configuration:", self->_popoverIdentifier, v7);
    objc_msgSend(v7, "transitionCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __63__UIPopoverPresentationController_dismissalTransitionWillBegin__block_invoke;
    v36[3] = &unk_1E16BF900;
    v36[4] = self;
    v37 = shouldSendDidDismiss;
    objc_msgSend(v10, "animateAlongsideTransition:completion:", 0, v36);

  }
  else if (self->_popoverView)
  {
    self->_presentationState = 3;
    objc_initWeak(&location, self->_popoverView);
    -[UIView window](self->_popoverView, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_variant_has_internal_diagnostics())
    {
      if (!v11)
      {
        __UIFaultDebugAssertLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          popoverView = self->_popoverView;
          *(_DWORD *)buf = 138412290;
          v39 = popoverView;
          _os_log_fault_impl(&dword_185066000, v22, OS_LOG_TYPE_FAULT, "Expected window when dismissing popover view in order to set rasterization scale. Using mainScreen scale instead. popoverView = %@", buf, 0xCu);
        }

      }
    }
    else if (!v11)
    {
      v23 = dismissalTransitionWillBegin___s_category;
      if (!dismissalTransitionWillBegin___s_category)
      {
        v23 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v23, (unint64_t *)&dismissalTransitionWillBegin___s_category);
      }
      v24 = *(NSObject **)(v23 + 8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = self->_popoverView;
        *(_DWORD *)buf = 138412290;
        v39 = v25;
        _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "Expected window when dismissing popover view in order to set rasterization scale. Using mainScreen scale instead. popoverView = %@", buf, 0xCu);
      }
    }
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__UIPopoverPresentationController_dismissalTransitionWillBegin__block_invoke_97;
    aBlock[3] = &unk_1E16B1B28;
    aBlock[4] = self;
    v13 = _Block_copy(aBlock);
    -[UIView setUserInteractionEnabled:](self->_dimmingView, "setUserInteractionEnabled:", 0);
    -[UIPopoverPresentationController _completionBlockForDismissalWhenNotifyingDelegate:](self, "_completionBlockForDismissalWhenNotifyingDelegate:", shouldSendDidDismiss);
    v32[0] = v12;
    v32[1] = 3221225472;
    v32[2] = __63__UIPopoverPresentationController_dismissalTransitionWillBegin__block_invoke_2;
    v32[3] = &unk_1E16B1CC8;
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v33 = v14;
    v15 = _Block_copy(v32);
    -[UIView layer](self->_popoverView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v11, "screen");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scale");
    }
    else
    {
      -[UIPresentationController presentedViewController](self, "presentedViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_screen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "scale");
    }
    objc_msgSend(v16, "setRasterizationScale:");
    if (!v11)

    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_definiteTransitionCoordinator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v12;
    v28 = 3221225472;
    v29 = __63__UIPopoverPresentationController_dismissalTransitionWillBegin__block_invoke_3;
    v30 = &unk_1E16B1CC8;
    v20 = v13;
    v31 = v20;
    objc_msgSend(v19, "animateAlongsideTransition:completion:", &v27, v15);

    -[UIView layer](self->_popoverView, "layer", v27, v28, v29, v30);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAllowsGroupOpacity:", 0);

    objc_destroyWeak(&location);
  }
}

void __63__UIPopoverPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void (**v6)(id, _QWORD);

  v2 = a1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 664);
  *(_QWORD *)(v3 + 664) = 0;
  v5 = a2;

  objc_msgSend(*(id *)(v2 + 32), "_completionBlockForDismissalWhenNotifyingDelegate:", *(unsigned __int8 *)(v2 + 40));
  v6 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v5, "isCancelled");

  v6[2](v6, v2 ^ 1);
}

void __63__UIPopoverPresentationController_dismissalTransitionWillBegin__block_invoke_97(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 368);
  +[UIColor clearColor](UIColor, "clearColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBackgroundColor:", v2);

}

uint64_t __63__UIPopoverPresentationController_dismissalTransitionWillBegin__block_invoke_2(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "isCancelled") ^ 1);
}

uint64_t __63__UIPopoverPresentationController_dismissalTransitionWillBegin__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (self->_useSourceViewBoundsAsSourceRect)
  {
    self->_useSourceViewBoundsAsSourceRect = 0;
    -[UIPresentationController setSourceView:](self, "setSourceView:", 0);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_UIPopoverHostManager transitionDidEnd:popoverIdentifier:](self->_hostManager, "transitionDidEnd:popoverIdentifier:", 0, self->_popoverIdentifier);
  -[UIPopoverPresentationController _postludeForDismissal](self, "_postludeForDismissal");
  -[UIPopoverPresentationController _setPopoverView:](self, "_setPopoverView:", 0);
  self->_shouldSendDidDismiss = 0;
}

- (void)_transitionFromWillBegin
{
  *(_WORD *)&self->_popoverControllerFlags |= 0x40u;
  -[UIPopoverPresentationController dismissalTransitionWillBegin](self, "dismissalTransitionWillBegin");
}

- (void)_transitionFromDidEnd
{
  *(_WORD *)&self->_popoverControllerFlags &= ~0x40u;
  -[UIPopoverPresentationController dismissalTransitionDidEnd:](self, "dismissalTransitionDidEnd:", 1);
}

- (void)_transitionToWillBegin
{
  *(_WORD *)&self->_popoverControllerFlags |= 0x40u;
  -[UIPopoverPresentationController _sendDelegateWillRepositionToRect](self, "_sendDelegateWillRepositionToRect");
  -[UIPopoverPresentationController presentationTransitionWillBegin](self, "presentationTransitionWillBegin");
}

- (void)_transitionToDidEnd
{
  void *v3;

  -[UIPresentationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  *(_WORD *)&self->_popoverControllerFlags &= ~0x40u;
  -[UIPresentationController _updateRealSourceView](self, "_updateRealSourceView");
}

- (BOOL)_attemptDismissalWithCompletion:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (-[UIPresentationController presented](self, "presented")
    && !self->_shouldSendDidDismiss
    && -[UIPresentationController _shouldDismiss](self, "_shouldDismiss")
    && (self->_shouldSendDidDismiss = 1, -[UIPresentationController presented](self, "presented")))
  {
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 1;
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v4);

    -[UIPresentationController _sendWillDismiss](self, "_sendWillDismiss");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_presentingViewControllerWindowSceneDidUpdateEffectiveGeometry:(id)a3
{
  id v4;
  char v5;
  int v6;
  id v7;

  v4 = a3;
  if (self->_hostManager)
  {
    v7 = v4;
    v5 = objc_opt_respondsToSelector();
    v4 = v7;
    if ((v5 & 1) != 0)
    {
      v6 = -[_UIPopoverHostManager popoverWithIdentifier:shouldAttemptDismissWhenWindowSceneUpdatesEffectiveGeometry:](self->_hostManager, "popoverWithIdentifier:shouldAttemptDismissWhenWindowSceneUpdatesEffectiveGeometry:", self->_popoverIdentifier, v7);
      v4 = v7;
      if (v6)
      {
        -[UIPopoverPresentationController _dismissWithCompletion:](self, "_dismissWithCompletion:", 0);
        v4 = v7;
      }
    }
  }

}

- (void)_realSourceViewDidChangeFromView:(id)a3 toView:(id)a4
{
  void *v5;
  CGSize v6;
  id v7;

  -[UIPopoverPresentationController _sourceOverlayView](self, "_sourceOverlayView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[UIPopoverPresentationController _updateSourceOverlayViewConstraints](self, "_updateSourceOverlayViewConstraints");
  v6 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_previousContainerViewRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_previousContainerViewRect.size = v6;
  -[UIPresentationController containerView](self, "containerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

}

- (CGRect)_sourceRectInContainerView
{
  void *v3;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  _BOOL4 v12;
  CGRect *p_lastSourceRectInContainerView;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect result;

  -[UIPresentationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPopoverPresentationController _sourceRectInCoordinateSpace:](self, "_sourceRectInCoordinateSpace:", v3);
  x = v4;
  y = v6;
  width = v8;
  height = v10;

  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v12 = CGRectEqualToRect(v18, *MEMORY[0x1E0C9D648]);
  p_lastSourceRectInContainerView = &self->_lastSourceRectInContainerView;
  if (v12)
  {
    x = p_lastSourceRectInContainerView->origin.x;
    y = self->_lastSourceRectInContainerView.origin.y;
    width = self->_lastSourceRectInContainerView.size.width;
    height = self->_lastSourceRectInContainerView.size.height;
  }
  else
  {
    p_lastSourceRectInContainerView->origin.x = x;
    self->_lastSourceRectInContainerView.origin.y = y;
    self->_lastSourceRectInContainerView.size.width = width;
    self->_lastSourceRectInContainerView.size.height = height;
  }
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_sourceRectInCoordinateSpace:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  BOOL v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect result;

  v4 = a3;
  -[UIPresentationController sourceRect](self, "sourceRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIPresentationController sourceItem](self, "sourceItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _UIPopoverPresentationControllerSourceItemUpCast(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[UIPresentationController containerView](self, "containerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_sourceRectForPresentationInWindow:", v16);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    v59.origin.x = v18;
    v59.origin.y = v20;
    v59.size.width = v22;
    v59.size.height = v24;
    if (!CGRectIsNull(v59))
    {
      v12 = v24;
      v10 = v22;
      v8 = v20;
      v6 = v18;
    }
  }
  -[UIPresentationController _realSourceView](self, "_realSourceView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v60.origin.x = v6;
  v60.origin.y = v8;
  v60.size.width = v10;
  v60.size.height = v12;
  if (CGRectIsNull(v60))
  {
    -[UIPopoverPresentationController _sourceOverlayView](self, "_sourceOverlayView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (!v26)
      v26 = v25;
    objc_msgSend(v26, "bounds");
    v6 = v28;
    v8 = v29;
    v10 = v30;
    v12 = v31;

  }
  -[UIPopoverPresentationController _sourceOverlayView](self, "_sourceOverlayView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[UIPopoverPresentationController _sourceOverlayView](self, "_sourceOverlayView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bounds");
    v35 = -v34;
    objc_msgSend(v25, "bounds");
    v37 = -v36;
    v61.origin.x = v6;
    v61.origin.y = v8;
    v61.size.width = v10;
    v61.size.height = v12;
    v62 = CGRectOffset(v61, v35, v37);
    objc_msgSend(v33, "convertRect:toCoordinateSpace:", v4, v62.origin.x, v62.origin.y, v62.size.width, v62.size.height);
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;
  }
  else
  {
    -[UIPresentationController containerView](self, "containerView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_window");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_window");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[UIPopoverPresentationController _shouldConvertToScene](self, "_shouldConvertToScene");
    if (v46
      && (v48
       || (objc_msgSend(v46, "screen"),
           v49 = (void *)objc_claimAutoreleasedReturnValue(),
           objc_msgSend(v47, "screen"),
           v50 = (void *)objc_claimAutoreleasedReturnValue(),
           v50,
           v49,
           v49 == v50)))
    {
      objc_msgSend(v25, "convertRect:toCoordinateSpace:", v4, v6, v8, v10, v12);
      v39 = v51;
      v41 = v52;
      v43 = v53;
      v45 = v54;
    }
    else
    {
      v39 = *MEMORY[0x1E0C9D648];
      v41 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v43 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v45 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }

  }
  v55 = v39;
  v56 = v41;
  v57 = v43;
  v58 = v45;
  result.size.height = v58;
  result.size.width = v57;
  result.origin.y = v56;
  result.origin.x = v55;
  return result;
}

- (CGRect)_containingFrame
{
  void *v2;
  id *v3;
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double x;
  double y;
  double width;
  double height;
  double v42;
  double v43;
  double v44;
  double v45;
  CGRect v46;
  CGRect v47;
  CGRect result;
  CGRect v49;

  -[UIPresentationController containerView](self, "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_window");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[UIWindow _fbsScene](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v2, "safeAreaInsets");
  v14 = v6 + v13;
  v16 = v8 + v15;
  v18 = v10 - (v13 + v17);
  v20 = v12 - (v15 + v19);
  if (v4)
  {
    objc_msgSend(v4, "settings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    objc_msgSend(v2, "_window");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = _UIConvertSceneRectToWindow(v4, v30, v23, v25, v27, v29);
    v33 = v32;
    v35 = v34;
    v37 = v36;

    objc_msgSend(v2, "convertRect:fromView:", 0, v31, v33, v35, v37);
    v49.origin.x = v14;
    v49.origin.y = v16;
    v49.size.width = v18;
    v49.size.height = v20;
    v47 = CGRectIntersection(v46, v49);
    x = v47.origin.x;
    y = v47.origin.y;
    width = v47.size.width;
    height = v47.size.height;
    if (!CGRectIsEmpty(v47))
    {
      v20 = height;
      v18 = width;
      v16 = y;
      v14 = x;
    }
  }

  v42 = v14;
  v43 = v16;
  v44 = v18;
  v45 = v20;
  result.size.height = v45;
  result.size.width = v44;
  result.origin.y = v43;
  result.origin.x = v42;
  return result;
}

- (CGSize)_proposedSize
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  objc_class *popoverBackgroundViewClass;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD v17[4];
  id v18;
  UIPopoverPresentationController *v19;
  objc_class *v20;
  uint64_t v21;
  uint64_t v22;
  CGSize result;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 6)
  {
    -[UIPopoverPresentationController _defaultPopoverSize](self, "_defaultPopoverSize");
  }
  else
  {
    popoverBackgroundViewClass = self->_popoverBackgroundViewClass;
    if (!popoverBackgroundViewClass)
      popoverBackgroundViewClass = -[UIPopoverPresentationController _defaultChromeViewClass](self, "_defaultChromeViewClass");
    v9 = objc_alloc_init(-[UIPopoverPresentationController _popoverLayoutInfoForChromeClass:](self, "_popoverLayoutInfoForChromeClass:", popoverBackgroundViewClass));
    -[UIPopoverPresentationController _defaultPopoverSize](self, "_defaultPopoverSize");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __48__UIPopoverPresentationController__proposedSize__block_invoke;
    v17[3] = &unk_1E16BF8B0;
    v19 = self;
    v20 = popoverBackgroundViewClass;
    v21 = v10;
    v22 = v11;
    v18 = v9;
    v12 = v9;
    objc_msgSend(v12, "updateProperties:", v17);
    objc_msgSend(v12, "frame");
    v14 = v13;
    v16 = v15;

    v6 = v14;
    v7 = v16;
  }
  result.height = v7;
  result.width = v6;
  return result;
}

void __48__UIPopoverPresentationController__proposedSize__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "contentViewInsets");
  objc_msgSend(v2, "setContentInset:");
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "arrowHeight");
  objc_msgSend(v3, "setArrowHeight:");
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setPreferredArrowDirections:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 728));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_containingFrame");
  objc_msgSend(v4, "setContainingFrame:");
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_containingFrameInsets");
  objc_msgSend(v5, "setContainingFrameInsets:");
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_sourceRectInContainerView");
  objc_msgSend(v6, "setSourceViewRect:");
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_popoverHostingWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferLandscapeOrientations:", (unint64_t)(objc_msgSend(v9, "interfaceOrientation") - 3) < 0xFFFFFFFFFFFFFFFELL);

  objc_msgSend(*(id *)(a1 + 32), "setCanOverlapSourceViewRect:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 537));
  objc_msgSend(*(id *)(a1 + 32), "setPreferredHorizontalAlignment:", objc_msgSend(*(id *)(a1 + 40), "_preferredHorizontalAlignment"));
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "containerView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIsRTL:", objc_msgSend(v11, "effectiveUserInterfaceLayoutDirection") == 1);

}

- (void)_sendDelegateWillRepositionToRect
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  _UIPopoverLayoutInfo *preferredLayoutInfo;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;

  -[UIPresentationController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&self->_popoverControllerFlags & 0x80) != 0)
  {
    if (!dyld_program_sdk_at_least())
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPopoverPresentationController.m"), 2121, CFSTR("Trying to layout popover in the delegate callback popoverPresentationController:willRepositionPopoverToRect:inView: will lead to recursion. Do not force the popover's container view or an ancestor to layout in this callback."));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIPresentationController barButtonItem](self, "barButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[UIPresentationController sourceView](self, "sourceView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPresentationController sourceRect](self, "sourceRect");
      v15 = v8;
      v16 = v9;
      v17 = v10;
      v18 = v11;
      *(_WORD *)&self->_popoverControllerFlags |= 0x80u;
      v14 = v7;
      objc_msgSend(v4, "popoverPresentationController:willRepositionPopoverToRect:inView:", self, &v15, &v14);
      v12 = v14;

      *(_WORD *)&self->_popoverControllerFlags &= ~0x80u;
      -[UIPresentationController setSourceView:](self, "setSourceView:", v12);
      -[UIPresentationController setSourceRect:](self, "setSourceRect:", v15, v16, v17, v18);
      preferredLayoutInfo = self->_preferredLayoutInfo;
      -[UIPopoverPresentationController _sourceRectInContainerView](self, "_sourceRectInContainerView");
      -[_UIPopoverLayoutInfo setSourceViewRect:](preferredLayoutInfo, "setSourceViewRect:");

    }
  }
LABEL_7:

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UIPopoverPresentationController;
  -[UIPresentationController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  *(_WORD *)&self->_popoverControllerFlags |= 0x40u;
  if (objc_msgSend(v7, "isAnimated"))
  {
    -[UIView layer](self->_popoverView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupOpacity:", 0);

    -[_UIPopoverView setChromeHiddenForSizeTransition:](self->_popoverView, "setChromeHiddenForSizeTransition:", 1);
    -[UIView setAlpha:](self->_shadowView, "setAlpha:", 0.0);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__UIPopoverPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E16B2150;
  v9[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v9);

}

void __86__UIPopoverPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  _OWORD *v3;
  __int128 v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[4];
  uint64_t v10;

  *(_WORD *)(*(_QWORD *)(a1 + 32) + 656) &= ~0x40u;
  v3 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 560);
  v4 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  *v3 = *MEMORY[0x1E0C9D648];
  v3[1] = v4;
  if (objc_msgSend(a2, "isAnimated"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __86__UIPopoverPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v9[3] = &unk_1E16B1B28;
    v10 = *(_QWORD *)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __86__UIPopoverPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
    v8[3] = &unk_1E16B3FD8;
    v8[4] = v10;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v9, v8, 0.25);
  }
  objc_msgSend(*(id *)(a1 + 32), "_sendDelegateWillRepositionToRect");
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeDidChangeForChildContentContainer:", v7);

}

uint64_t __86__UIPopoverPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "setChromeHiddenForSizeTransition:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "setAlpha:", 1.0);
}

void __86__UIPopoverPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "layer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAllowsGroupOpacity:", 1);

}

- (void)_updateSourceOverlayViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
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
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  -[UIPopoverPresentationController _sourceOverlayViewConstraints](self, "_sourceOverlayViewConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D156E0];
    -[UIPopoverPresentationController _sourceOverlayViewConstraints](self, "_sourceOverlayViewConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

  }
  -[UIPresentationController _realSourceView](self, "_realSourceView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPopoverPresentationController _sourceOverlayView](self, "_sourceOverlayView");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (v7)
    {
      objc_msgSend(v6, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (v11)
      {
        objc_msgSend(v6, "leftAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "leftAnchor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "constraintEqualToAnchor:", v25);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = v24;
        objc_msgSend(v6, "rightAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "rightAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "constraintEqualToAnchor:", v22);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v27[1] = v21;
        objc_msgSend(v6, "topAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "topAnchor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "constraintEqualToAnchor:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v27[2] = v14;
        objc_msgSend(v6, "bottomAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bottomAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "constraintEqualToAnchor:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v27[3] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPopoverPresentationController _setSourceOverlayViewConstraints:](self, "_setSourceOverlayViewConstraints:", v18);

        v19 = (void *)MEMORY[0x1E0D156E0];
        -[UIPopoverPresentationController _sourceOverlayViewConstraints](self, "_sourceOverlayViewConstraints");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "activateConstraints:", v20);

      }
    }
  }

}

- (void)containerViewWillLayoutSubviews
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
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  BOOL v20;
  _UIPopoverLayoutInfo *preferredLayoutInfo;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  _UIPopoverLayoutInfo *v27;
  uint64_t v28;
  int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  _UIPopoverView *popoverView;
  double v40;
  _UIPopoverView *v41;
  uint64_t v42;
  void *v43;
  _UIPopoverView *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  _UIPopoverView *v49;
  _UIPopoverView *v50;
  NSObject *v51;
  unint64_t v52;
  NSObject *v53;
  CGFloat v54;
  CGFloat v55;
  _QWORD v56[5];
  _QWORD v57[13];
  BOOL v58;
  uint8_t buf[16];
  CGRect v60;

  if ((*(_WORD *)&self->_popoverControllerFlags & 0x40) == 0)
  {
    -[UIPresentationController _realSourceView](self, "_realSourceView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_variant_has_internal_diagnostics())
    {
      if (!v3)
      {
        __UIFaultDebugAssertLog();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v51, OS_LOG_TYPE_FAULT, "Assuming sourceView is not nil", buf, 2u);
        }

      }
    }
    else if (!v3)
    {
      v52 = containerViewWillLayoutSubviews___s_category;
      if (!containerViewWillLayoutSubviews___s_category)
      {
        v52 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v52, (unint64_t *)&containerViewWillLayoutSubviews___s_category);
      }
      v53 = *(NSObject **)(v52 + 8);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v53, OS_LOG_TYPE_ERROR, "Assuming sourceView is not nil", buf, 2u);
      }
    }
    if (self->_useSourceViewBoundsAsSourceRect)
    {
      objc_msgSend(v3, "bounds");
      -[UIPresentationController setSourceRect:](self, "setSourceRect:");
    }
    -[UIPopoverPresentationController _sourceRectInContainerView](self, "_sourceRectInContainerView");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    if (-[UIPopoverPresentationController showsTargetRect](self, "showsTargetRect"))
    {
      -[UIPopoverPresentationController _targetRectView](self, "_targetRectView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

    }
    -[UIPopoverPresentationController _containingFrame](self, "_containingFrame");
    v60.origin.x = v13;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v54 = v13;
    v60.origin.y = v14;
    v60.size.width = v16;
    v60.size.height = v18;
    v20 = CGRectEqualToRect(self->_previousContainerViewRect, v60);
    if (!v20)
      -[UIPopoverPresentationController _sendDelegateWillRepositionToRect](self, "_sendDelegateWillRepositionToRect");
    preferredLayoutInfo = self->_preferredLayoutInfo;
    v22 = MEMORY[0x1E0C809B0];
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __66__UIPopoverPresentationController_containerViewWillLayoutSubviews__block_invoke;
    v57[3] = &unk_1E16BF8D8;
    v57[4] = self;
    *(CGFloat *)&v57[5] = v54;
    *(CGFloat *)&v57[6] = v15;
    *(CGFloat *)&v57[7] = v17;
    *(CGFloat *)&v57[8] = v19;
    *(double *)&v57[9] = v5;
    *(double *)&v57[10] = v7;
    *(double *)&v57[11] = v9;
    *(double *)&v57[12] = v11;
    v58 = v20;
    -[_UIPopoverLayoutInfo updateProperties:](preferredLayoutInfo, "updateProperties:", v57, *(_QWORD *)&v54);
    -[UIPopoverPresentationController _layoutInfoForCurrentKeyboardState](self, "_layoutInfoForCurrentKeyboardState");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v20)
    {
      objc_msgSend(v23, "frame");
      if (v25 >= 100.0 && (objc_msgSend(v24, "frame"), v26 >= 100.0))
      {
        v29 = 0;
      }
      else
      {
        v27 = self->_preferredLayoutInfo;
        v56[0] = v22;
        v56[1] = 3221225472;
        v56[2] = __66__UIPopoverPresentationController_containerViewWillLayoutSubviews__block_invoke_2;
        v56[3] = &unk_1E16B1B28;
        v56[4] = self;
        -[_UIPopoverLayoutInfo updateProperties:](v27, "updateProperties:", v56);
        -[UIPopoverPresentationController _layoutInfoForCurrentKeyboardState](self, "_layoutInfoForCurrentKeyboardState");
        v28 = objc_claimAutoreleasedReturnValue();

        v29 = 1;
        v24 = (void *)v28;
      }
    }
    else
    {
      -[_UIPopoverLayoutInfo setPreferredArrowDirections:](self->_preferredLayoutInfo, "setPreferredArrowDirections:", objc_msgSend(v23, "arrowDirection"));
      v29 = 1;
    }
    objc_msgSend(v24, "frame");
    if (self->_hostManager)
    {
      if (self->_popoverIdentifier)
      {
        -[UIPopoverPresentationController _hostManagerPopoverUpdateConfiguration](self, "_hostManagerPopoverUpdateConfiguration");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPopoverPresentationController _sourceRectInContainerView](self, "_sourceRectInContainerView");
        objc_msgSend(v34, "setSourceRectInParentUIWindow:");
        -[_UIPopoverHostManager updatePopoverWithIdentifier:configuration:](self->_hostManager, "updatePopoverWithIdentifier:configuration:", self->_popoverIdentifier, v34);

      }
      if (!v29)
        goto LABEL_27;
    }
    else
    {
      v35 = v30;
      v36 = v31;
      v37 = v32;
      v38 = v33;
      popoverView = self->_popoverView;
      objc_msgSend(v24, "offset");
      -[_UIPopoverView _setFrame:arrowOffset:](popoverView, "_setFrame:arrowOffset:", v35, v36, v37, v38, v40);
      if (!v29)
      {
LABEL_27:

        return;
      }
    }
    v41 = self->_popoverView;
    if (-[UIPopoverPresentationController _shouldHideArrow](self, "_shouldHideArrow"))
      v42 = 0;
    else
      v42 = objc_msgSend(v24, "arrowDirection");
    -[_UIPopoverView setArrowDirection:](v41, "setArrowDirection:", v42);
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "_updateContentOverlayInsetsFromParentIfNecessary");

    v44 = self->_popoverView;
    -[_UIPopoverView safeAreaInsetsForContentView](v44, "safeAreaInsetsForContentView");
    -[UIView _setSafeAreaInsets:updateSubviewsDuringNextLayoutPass:]((double *)v44, 1, v45, v46, v47, v48);
    if (!self->_popoverBackgroundViewClass)
      -[UIPopoverPresentationController _defaultChromeViewClass](self, "_defaultChromeViewClass");
    v49 = self->_popoverView;
    -[UIPopoverPresentationController _cornerRadius](self, "_cornerRadius");
    -[_UIPopoverView _setCustomCornerRadius:](v49, "_setCustomCornerRadius:");
    v50 = self->_popoverView;
    objc_msgSend(v24, "offset");
    -[_UIPopoverView setArrowOffset:](v50, "setArrowOffset:");
    self->_previousContainerViewRect.origin.x = v55;
    self->_previousContainerViewRect.origin.y = v15;
    self->_previousContainerViewRect.size.width = v17;
    self->_previousContainerViewRect.size.height = v19;
    -[UIView setNeedsLayout](self->_popoverView, "setNeedsLayout");
    goto LABEL_27;
  }
}

uint64_t __66__UIPopoverPresentationController_containerViewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setContainingFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setSourceViewRect:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  if (!*(_BYTE *)(a1 + 104))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setPreferredArrowDirections:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 728));
  return result;
}

uint64_t __66__UIPopoverPresentationController_containerViewWillLayoutSubviews__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setPreferredArrowDirections:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 728));
}

- (BOOL)_shouldKeepCurrentFirstResponder
{
  return 0;
}

+ (BOOL)_alwaysAllowPopoverPresentations
{
  return _AlwaysAllowPopoverPresentations;
}

+ (void)_setAlwaysAllowPopoverPresentations:(BOOL)a3
{
  _AlwaysAllowPopoverPresentations = a3;
}

- (int64_t)_defaultPresentationStyleForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (self->_hostManager)
  {
LABEL_2:
    v6 = -1;
    goto LABEL_3;
  }
  if (objc_msgSend(v4, "horizontalSizeClass") != 1)
  {
    if (objc_msgSend(v5, "horizontalSizeClass") == 2
      && objc_msgSend(v5, "verticalSizeClass") == 1
      && !_AlwaysAllowPopoverPresentations)
    {
      v6 = 2;
      goto LABEL_3;
    }
    goto LABEL_2;
  }
  _UIMainBundleIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (_AlwaysAllowPopoverPresentations
    || !self->_adaptivityEnabled
    || (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.itunesu")) & 1) != 0)
  {
    v6 = -1;
  }
  else
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (_UISheetPresentationControllerStylesSheetsAsCards(v10))
      v6 = 2;
    else
      v6 = 0;

  }
LABEL_3:

  return v6;
}

- (BOOL)_forcesPreferredAnimationControllers
{
  return 1;
}

- (id)_preferredAnimationControllerForPresentation
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  _UIModernPopoverAnimationController *v8;
  objc_super v9;

  -[UIPopoverPresentationController _createHostManagerIfNeeded](self, "_createHostManagerIfNeeded");
  -[UIPopoverPresentationController _metrics](self, "_metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldUseVisualStyleAnimationControllerForPresentation");

  if (v4)
  {
    -[UIPresentationController _visualStyle](self, "_visualStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredAnimationControllerForPresentation:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else if (-[_UIPopoverHostManager useDefaultPreferredAnimationControllerForPresentationWithPopoverWithIdentifier:](self->_hostManager, "useDefaultPreferredAnimationControllerForPresentationWithPopoverWithIdentifier:", self->_popoverIdentifier))
  {
    v9.receiver = self;
    v9.super_class = (Class)UIPopoverPresentationController;
    -[UIPresentationController _preferredAnimationControllerForPresentation](&v9, sel__preferredAnimationControllerForPresentation);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_alloc_init(_UIModernPopoverAnimationController);
    -[_UIModernPopoverAnimationController setPopoverPresentationController:](v8, "setPopoverPresentationController:", self);
    -[_UIModernPopoverAnimationController setPresenting:](v8, "setPresenting:", 1);
    return v8;
  }
}

- (id)_preferredAnimationControllerForDismissal
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  _UIModernPopoverAnimationController *v8;
  objc_super v9;

  -[UIPopoverPresentationController _createHostManagerIfNeeded](self, "_createHostManagerIfNeeded");
  -[UIPopoverPresentationController _metrics](self, "_metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldUseVisualStyleAnimationControllerForDismissal");

  if (v4)
  {
    -[UIPresentationController _visualStyle](self, "_visualStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredAnimationControllerForPresentation:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else if (-[_UIPopoverHostManager useDefaultPreferredAnimationControllerForDismissalWithPopoverWithIdentifier:](self->_hostManager, "useDefaultPreferredAnimationControllerForDismissalWithPopoverWithIdentifier:", self->_popoverIdentifier))
  {
    v9.receiver = self;
    v9.super_class = (Class)UIPopoverPresentationController;
    -[UIPresentationController _preferredAnimationControllerForDismissal](&v9, sel__preferredAnimationControllerForDismissal);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_alloc_init(_UIModernPopoverAnimationController);
    -[_UIModernPopoverAnimationController setPopoverPresentationController:](v8, "setPopoverPresentationController:", self);
    -[_UIModernPopoverAnimationController setPresenting:](v8, "setPresenting:", 0);
    return v8;
  }
}

- (void)_setContentViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  UIPopoverPresentationController *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  UIPopoverPresentationController *v27;
  _QWORD v28[4];
  id v29;

  v4 = a4;
  v6 = a3;
  if (!-[UIPresentationController presented](self, "presented"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-[UIPopoverController setContentViewController:animated:] can only be called after the popover has been presented."));
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  objc_msgSend(v9, "setFrame:");

  objc_msgSend(v8, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertSubview:above:", v12, v8);

    if (v4)
    {
      objc_msgSend(v6, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAlpha:", 0.0);

      v14 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __70__UIPopoverPresentationController__setContentViewController_animated___block_invoke;
      v28[3] = &unk_1E16B1B28;
      v29 = v6;
      v24[0] = v14;
      v24[1] = 3221225472;
      v24[2] = __70__UIPopoverPresentationController__setContentViewController_animated___block_invoke_2;
      v24[3] = &unk_1E16B2B40;
      v25 = v8;
      v26 = v29;
      v27 = self;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v28, v24, 0.4);

      v15 = v29;
LABEL_8:

      goto LABEL_9;
    }
    objc_msgSend(v8, "removeFromSuperview");
    objc_msgSend(v6, "childModalViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __70__UIPopoverPresentationController__setContentViewController_animated___block_invoke_3;
      v21 = &unk_1E16B1B50;
      v22 = self;
      v23 = v6;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &v18);
      v15 = v23;
      goto LABEL_8;
    }
  }
LABEL_9:
  -[UIPresentationController presentedViewController](self, "presentedViewController", v18, v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_replaceViewControllerInPresentationHierarchy:", v17);

  -[UIPresentationController _setPresentedViewController:](self, "_setPresentedViewController:", v6);
}

void __70__UIPopoverPresentationController__setContentViewController_animated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __70__UIPopoverPresentationController__setContentViewController_animated___block_invoke_2(id *a1)
{
  void *v2;

  objc_msgSend(a1[4], "removeFromSuperview");
  objc_msgSend(a1[5], "childModalViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(a1[6], "preferredContentSizeDidChangeForChildContentContainer:", a1[5]);
}

uint64_t __70__UIPopoverPresentationController__setContentViewController_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "preferredContentSizeDidChangeForChildContentContainer:", *(_QWORD *)(a1 + 40));
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  _UIViewControllerNullAnimationTransitionCoordinator *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _UIPopoverLayoutInfo *preferredLayoutInfo;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  _BOOL8 v39;
  id v40;
  _QWORD v41[7];

  v40 = a3;
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v4 = objc_claimAutoreleasedReturnValue();
  if ((id)v4 == v40)
  {

  }
  else
  {
    v5 = (void *)v4;
    -[UIPresentationController _childPresentationController](self, "_childPresentationController");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v7 = v40;
    if (v6 != v40)
      goto LABEL_37;
  }
  objc_msgSend(v40, "preferredContentSize");
  v7 = v40;
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v11 = v10 == *MEMORY[0x1E0C9D820] && v8 == v9;
  if (!v11
    || (self->_popoverContentSize.width == *MEMORY[0x1E0C9D820]
      ? (v12 = self->_popoverContentSize.height == v9)
      : (v12 = 0),
        v12))
  {
    -[UIPopoverPresentationController _defaultPopoverSize](self, "_defaultPopoverSize");
    v14 = v13;
    v16 = v15;
    objc_msgSend(v40, "preferredContentSize");
    v19 = v17;
    v20 = v18;
    if (v17 <= 0.0 || v18 <= 0.0)
    {
      if (v17 <= 0.0)
        v19 = v14;
      if (v18 <= 0.0)
        v20 = v16;
    }
    v21 = v19 == self->_popoverContentSize.width && v20 == self->_popoverContentSize.height;
    v7 = v40;
    if (!v21)
    {
      v22 = objc_alloc_init(_UIViewControllerNullAnimationTransitionCoordinator);
      -[UIPresentationController _childPresentationController](self, "_childPresentationController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        v25 = v23;
      }
      else
      {
        -[UIPresentationController presentedViewController](self, "presentedViewController");
        v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      v26 = v25;

      objc_msgSend(v26, "viewWillTransitionToSize:withTransitionCoordinator:", v22, v19, v20);
      self->_popoverContentSize.width = v19;
      self->_popoverContentSize.height = v20;
      preferredLayoutInfo = self->_preferredLayoutInfo;
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __89__UIPopoverPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke;
      v41[3] = &unk_1E16B4E70;
      v41[4] = self;
      *(double *)&v41[5] = v19;
      *(double *)&v41[6] = v20;
      -[_UIPopoverLayoutInfo updateProperties:](preferredLayoutInfo, "updateProperties:", v41);
      -[UIPopoverPresentationController _layoutInfoForCurrentKeyboardState](self, "_layoutInfoForCurrentKeyboardState");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (self->_hostManager)
      {
        if (self->_popoverIdentifier)
        {
          -[UIPopoverPresentationController _hostManagerPopoverUpdateConfiguration](self, "_hostManagerPopoverUpdateConfiguration");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPopoverPresentationController _sourceRectInContainerView](self, "_sourceRectInContainerView");
          objc_msgSend(v30, "setSourceRectInParentUIWindow:");
          -[_UIPopoverHostManager updatePopoverWithIdentifier:configuration:](self->_hostManager, "updatePopoverWithIdentifier:configuration:", self->_popoverIdentifier, v30);

        }
        -[_UIViewControllerNullAnimationTransitionCoordinator _runAlongsideAnimations](v22, "_runAlongsideAnimations");
        -[_UIViewControllerNullAnimationTransitionCoordinator _runAlongsideCompletionsAfterCommit](v22, "_runAlongsideCompletionsAfterCommit");
      }
      else
      {
        objc_msgSend(v28, "frame");
        v32 = v31;
        v34 = v33;
        v36 = v35;
        v38 = v37;
        if (-[UIPresentationController presented](self, "presented"))
          v39 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
        else
          v39 = 0;
        -[UIPopoverPresentationController _setPopoverFrame:animated:coordinator:](self, "_setPopoverFrame:animated:coordinator:", v39, v22, v32, v34, v36, v38);
      }

      v7 = v40;
    }
  }
LABEL_37:

}

uint64_t __89__UIPopoverPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setPreferredContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (CGSize)_defaultPopoverSize
{
  double v3;
  double v4;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  CGSize result;

  -[UIPopoverPresentationController _defaultPopoverSizeOverride](self, "_defaultPopoverSizeOverride");
  if (v4 == *MEMORY[0x1E0C9D820] && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    if (self->_hostManager)
    {
      -[UIPopoverPresentationController _metrics](self, "_metrics");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "defaultPreferredSmallContentSize");
      v10 = v9;
      v12 = v11;
    }
    else
    {
      -[UIPresentationController _currentPresentationSuperview](self, "_currentPresentationSuperview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      v14 = v13;
      -[UIPopoverPresentationController _metrics](self, "_metrics");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14 < 1024.0)
        objc_msgSend(v15, "defaultPreferredSmallContentSize");
      else
        objc_msgSend(v15, "defaultPreferredLargeContentSize");
      v10 = v17;
      v12 = v18;

    }
    v6 = v10;
    v7 = v12;
  }
  else
  {
    -[UIPopoverPresentationController _defaultPopoverSizeOverride](self, "_defaultPopoverSizeOverride");
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (UIEdgeInsets)_additionalSafeAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[_UIPopoverView safeAreaInsetsForContentView](self->_popoverView, "safeAreaInsetsForContentView");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)_hostManagerPopoverCreationConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentViewController:", v4);
  -[UIPresentationController _realSourceView](self, "_realSourceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSourceView:", v5);

  -[UIPopoverPresentationController popoverContentSize](self, "popoverContentSize");
  objc_msgSend(v3, "setContentSize:");
  objc_msgSend(v3, "setShowsArrow:", -[UIPopoverPresentationController _shouldHideArrow](self, "_shouldHideArrow") ^ 1);
  objc_msgSend(v4, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));

  v10[0] = 0x1E1A994B0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "_registerForTraitTokenChanges:withTarget:action:", v7, self, sel__presentedViewControllerUserInterfaceStyleChanged);

  return v3;
}

- (id)_hostManagerPopoverUpdateConfiguration
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[UIPopoverPresentationController popoverContentSize](self, "popoverContentSize");
  objc_msgSend(v3, "setContentSize:");
  objc_msgSend(v3, "setPreferredHorizontalAlignment:", -[UIPopoverPresentationController _preferredHorizontalAlignment](self, "_preferredHorizontalAlignment"));
  objc_msgSend(v3, "setShowsArrow:", -[UIPopoverPresentationController _shouldHideArrow](self, "_shouldHideArrow") ^ 1);
  -[UIPresentationController containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsRTL:", objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection") == 1);

  return v3;
}

- (id)_hostManagerPopoverCloseConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPopoverWindow:", v5);

  -[UIPresentationController _realSourceView](self, "_realSourceView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setParentWindow:", v7);

  objc_msgSend(v3, "setTransitionCoordinator:", 0);
  return v3;
}

- (void)_realSourceViewGeometryDidChange
{
  CGRect *p_previousContainerViewRect;
  CGSize v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)UIPopoverPresentationController;
  -[UIPresentationController _realSourceViewGeometryDidChange](&v5, sel__realSourceViewGeometryDidChange);
  if ((*(_WORD *)&self->_popoverControllerFlags & 0x40) == 0)
  {
    -[UIPopoverPresentationController _containingFrame](self, "_containingFrame");
    p_previousContainerViewRect = &self->_previousContainerViewRect;
    if (!CGRectEqualToRect(v6, *p_previousContainerViewRect))
    {
      v4 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      p_previousContainerViewRect->origin = (CGPoint)*MEMORY[0x1E0C9D648];
      p_previousContainerViewRect->size = v4;
    }
  }
}

- (BOOL)_shouldConvertToScene
{
  void *v3;
  void *v4;
  char v5;

  -[UIPopoverPresentationController _createHostManagerIfNeeded](self, "_createHostManagerIfNeeded");
  if (!self->_hostManager)
    return 0;
  -[UIPresentationController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIPresentationController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_popoverPresentationControllerShouldConvertToScene:", self);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_convertToSceneFromPresentingViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *popoverIdentifier;
  _QWORD v12[5];

  -[UIPresentationController _realSourceView](self, "_realSourceView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPopoverPresentationController preferredContentSizeDidChangeForChildContentContainer:](self, "preferredContentSizeDidChangeForChildContentContainer:", v5);

  -[UIPopoverPresentationController _hostManagerPopoverCreationConfiguration](self, "_hostManagerPopoverCreationConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "coordinateSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPopoverPresentationController _sourceRectInCoordinateSpace:](self, "_sourceRectInCoordinateSpace:", v9);
  objc_msgSend(v6, "setSourceRectInParentUIWindow:");

  objc_msgSend(v6, "setPermittedArrowDirections:", -[UIPopoverPresentationController permittedArrowDirections](self, "permittedArrowDirections"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__UIPopoverPresentationController__convertToSceneFromPresentingViewController___block_invoke;
  v12[3] = &unk_1E16B1B28;
  v12[4] = self;
  objc_msgSend(v6, "setCompletionBlock:", v12);
  -[UIPopoverPresentationController _createHostManagerPopoverWithConfiguration:](self, "_createHostManagerPopoverWithConfiguration:", v6);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  popoverIdentifier = self->_popoverIdentifier;
  self->_popoverIdentifier = v10;

}

void __79__UIPopoverPresentationController__convertToSceneFromPresentingViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  UIPanGestureRecognizer *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "_hostManagerPopoverUpdateConfiguration");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_realSourceView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v2, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinateSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sourceRectInCoordinateSpace:", v6);
  objc_msgSend(v17, "setSourceRectInParentUIWindow:");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "updatePopoverWithIdentifier:configuration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 664), v17);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(v8 + 664);
      v10 = *(id *)(v8 + 672);
      objc_msgSend(v10, "popoverSceneForPopoverWithIdentifier:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_popoverPresentationController:didConvertToScene:", *(_QWORD *)(a1 + 32), v11);

    }
  }
  v12 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", *(_QWORD *)(a1 + 32), sel__handlePan_);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 680);
  *(_QWORD *)(v13 + 680) = v12;

  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addGestureRecognizer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680));

}

- (id)_createHostManagerPopoverWithConfiguration:(id)a3
{
  _UIPopoverHostManager *hostManager;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  hostManager = self->_hostManager;
  v5 = a3;
  -[_UIPopoverHostManager createPopoverWithConfiguration:](hostManager, "createPopoverWithConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setOverrideParentTraitEnvironment:", self);

  return v6;
}

- (void)_closeScene
{
  id v3;

  if (self->_popoverIdentifier)
  {
    if (self->_hostManager)
    {
      -[UIPopoverPresentationController _hostManagerPopoverCloseConfiguration](self, "_hostManagerPopoverCloseConfiguration");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      -[_UIPopoverHostManager closePopoverWithIdentifier:configuration:](self->_hostManager, "closePopoverWithIdentifier:configuration:", self->_popoverIdentifier, v3);

    }
  }
}

- (BOOL)_shouldPreserveFirstResponder
{
  return self->_shouldPreserveFirstResponder;
}

- (void)_handlePan:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _UIPopoverHostManager *hostManager;
  NSString *popoverIdentifier;
  _QWORD v28[4];
  id v29;
  UIPopoverPresentationController *v30;
  id v31;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v5);
  if (!self->_wasDetached)
  {
    v8 = v6;
    v9 = v7;
    if (objc_msgSend(v4, "state") == 1)
    {
      objc_msgSend(v4, "locationInView:", v5);
      v11 = v10 - v8;
      v13 = v12 - v9;
      -[UIPresentationController presentedViewController](self, "presentedViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_window");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "windowScene");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "coordinateSpace");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "convertPoint:toCoordinateSpace:", v17, v11, v13);
      v19 = v18;
      v21 = v20;

      -[UIPresentationController presentedViewController](self, "presentedViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_window");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "windowScene");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIPresentationController delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0
        && objc_msgSend(v25, "_popoverPresentationController:shouldDetachScene:", self, v24))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[_UIPopoverHostManager updateSupportsDetach:forPopoverWithIdentifier:](self->_hostManager, "updateSupportsDetach:forPopoverWithIdentifier:", 1, self->_popoverIdentifier);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          hostManager = self->_hostManager;
          popoverIdentifier = self->_popoverIdentifier;
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __46__UIPopoverPresentationController__handlePan___block_invoke;
          v28[3] = &unk_1E16B47A8;
          v29 = v25;
          v30 = self;
          v31 = v24;
          -[_UIPopoverHostManager detachPopoverWithIdentifier:fromPoint:withCompletionCallback:](hostManager, "detachPopoverWithIdentifier:fromPoint:withCompletionCallback:", popoverIdentifier, v28, v19, v21);

        }
      }

    }
  }

}

void __46__UIPopoverPresentationController__handlePan___block_invoke(uint64_t a1)
{
  void *v2;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_popoverPresentationController:didDetachScene:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 680), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeGestureRecognizer:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 680));

  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 688) = 1;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (BOOL)dismissesOnRotation
{
  return self->_dismissesOnRotation;
}

- (void)setDismissesOnRotation:(BOOL)a3
{
  self->_dismissesOnRotation = a3;
}

- (UIEdgeInsets)popoverLayoutMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_popoverLayoutMargins.top;
  left = self->_popoverLayoutMargins.left;
  bottom = self->_popoverLayoutMargins.bottom;
  right = self->_popoverLayoutMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (id)popoverBackgroundViewClass
{
  return self->_popoverBackgroundViewClass;
}

- (void)setPopoverBackgroundViewClass:(id)popoverBackgroundViewClass
{
  objc_storeStrong((id *)&self->_popoverBackgroundViewClass, popoverBackgroundViewClass);
}

- (BOOL)showsTargetRect
{
  return self->_showsTargetRect;
}

- (void)setShowsTargetRect:(BOOL)a3
{
  self->_showsTargetRect = a3;
}

- (BOOL)showsOrientationMarker
{
  return self->_showsOrientationMarker;
}

- (void)setShowsOrientationMarker:(BOOL)a3
{
  self->_showsOrientationMarker = a3;
}

- (BOOL)showsPresentationArea
{
  return self->_showsPresentationArea;
}

- (void)setShowsPresentationArea:(BOOL)a3
{
  self->_showsPresentationArea = a3;
}

- (BOOL)_retainsSelfWhilePresented
{
  return self->_retainsSelfWhilePresented;
}

- (void)_setRetainsSelfWhilePresented:(BOOL)a3
{
  self->_retainsSelfWhilePresented = a3;
}

- (_UIPopoverLayoutInfo)preferredLayoutInfo
{
  return self->_preferredLayoutInfo;
}

- (void)setPreferredLayoutInfo:(id)a3
{
  objc_storeStrong((id *)&self->_preferredLayoutInfo, a3);
}

- (UIView)_presentingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_presentingView);
}

- (void)_setPresentingView:(id)a3
{
  objc_storeWeak((id *)&self->_presentingView, a3);
}

- (unint64_t)_presentationEdge
{
  return self->_presentationEdge;
}

- (void)_setPresentationEdge:(unint64_t)a3
{
  self->_presentationEdge = a3;
}

- (BOOL)_shouldDimPresentingViewTint
{
  return self->_shouldDimPresentingViewTint;
}

- (void)_setShouldDimPresentingViewTint:(BOOL)a3
{
  self->_shouldDimPresentingViewTint = a3;
}

- (double)_cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)_allowDismissalTapsToPassThrough
{
  return self->_allowDismissalTapsToPassThrough;
}

- (UIPopoverArrowDirection)permittedArrowDirections
{
  return self->_permittedArrowDirections;
}

- (void)setPermittedArrowDirections:(UIPopoverArrowDirection)permittedArrowDirections
{
  self->_permittedArrowDirections = permittedArrowDirections;
}

- (unint64_t)popoverArrowDirection
{
  return self->_popoverArrowDirection;
}

- (void)setPopoverArrowDirection:(unint64_t)a3
{
  self->_popoverArrowDirection = a3;
}

- (BOOL)_centersPopoverIfSourceViewNotSet
{
  return self->__centersPopoverIfSourceViewNotSet;
}

- (void)_setCentersPopoverIfSourceViewNotSet:(BOOL)a3
{
  self->__centersPopoverIfSourceViewNotSet = a3;
}

- (UIView)_sourceOverlayView
{
  return self->_sourceOverlayView;
}

- (void)_setSourceOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceOverlayView, a3);
}

- (NSArray)_sourceOverlayViewConstraints
{
  return self->_sourceOverlayViewConstraints;
}

- (void)_setSourceOverlayViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_sourceOverlayViewConstraints, a3);
}

- (UIView)_targetRectView
{
  return self->_targetRectView;
}

- (void)_setTargetRectView:(id)a3
{
  objc_storeStrong((id *)&self->_targetRectView, a3);
}

- (UIPopoverPresentationController)retainedSelf
{
  return self->_retainedSelf;
}

- (void)setRetainedSelf:(id)a3
{
  objc_storeStrong((id *)&self->_retainedSelf, a3);
}

- (BOOL)_shouldHideArrow
{
  return self->__shouldHideArrow;
}

- (void)_setShouldHideArrow:(BOOL)a3
{
  self->__shouldHideArrow = a3;
}

- (double)_dimmingViewTopEdgeInset
{
  return self->__dimmingViewTopEdgeInset;
}

- (void)_setDimmingViewTopEdgeInset:(double)a3
{
  self->__dimmingViewTopEdgeInset = a3;
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return self->_shouldDisableInteractionDuringTransitions;
}

- (void)_setShouldDisableInteractionDuringTransitions:(BOOL)a3
{
  self->_shouldDisableInteractionDuringTransitions = a3;
}

- (BOOL)_ignoreBarButtonItemSiblings
{
  return self->__ignoreBarButtonItemSiblings;
}

- (void)_setIgnoreBarButtonItemSiblings:(BOOL)a3
{
  self->__ignoreBarButtonItemSiblings = a3;
}

- (BOOL)_softAssertWhenNoSourceViewOrBarButtonItemSpecified
{
  return self->__softAssertWhenNoSourceViewOrBarButtonItemSpecified;
}

- (void)_setSoftAssertWhenNoSourceViewOrBarButtonItemSpecified:(BOOL)a3
{
  self->__softAssertWhenNoSourceViewOrBarButtonItemSpecified = a3;
}

- (BOOL)_allowsSourceViewInDifferentWindowThanInitialPresentationViewController
{
  return self->__allowsSourceViewInDifferentWindowThanInitialPresentationViewController;
}

- (void)_setAllowsSourceViewInDifferentWindowThanInitialPresentationViewController:(BOOL)a3
{
  self->__allowsSourceViewInDifferentWindowThanInitialPresentationViewController = a3;
}

- (void)_setShouldPreserveFirstResponder:(BOOL)a3
{
  self->_shouldPreserveFirstResponder = a3;
}

- (BOOL)_isAdaptivityEnabled
{
  return self->_adaptivityEnabled;
}

- (void)_setAdaptivityEnabled:(BOOL)a3
{
  self->_adaptivityEnabled = a3;
}

- (CGSize)_defaultPopoverSizeOverride
{
  double width;
  double height;
  CGSize result;

  width = self->__defaultPopoverSizeOverride.width;
  height = self->__defaultPopoverSizeOverride.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)set_defaultPopoverSizeOverride:(CGSize)a3
{
  self->__defaultPopoverSizeOverride = a3;
}

- (int64_t)_preferredHorizontalAlignment
{
  return self->__preferredHorizontalAlignment;
}

- (void)_setPreferredHorizontalAlignment:(int64_t)a3
{
  self->__preferredHorizontalAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedSelf, 0);
  objc_storeStrong((id *)&self->_targetRectView, 0);
  objc_storeStrong((id *)&self->_sourceOverlayViewConstraints, 0);
  objc_storeStrong((id *)&self->_sourceOverlayView, 0);
  objc_storeStrong((id *)&self->_adaptiveSheetPresentationController, 0);
  objc_storeStrong((id *)&self->_detachGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_hostManager, 0);
  objc_storeStrong((id *)&self->_popoverIdentifier, 0);
  objc_storeStrong((id *)&self->_dimmingViewGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_vendedGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_presentingView);
  objc_storeStrong((id *)&self->_popoverBackgroundViewClass, 0);
  objc_storeStrong((id *)&self->_preferredLayoutInfo, 0);
  objc_storeStrong((id *)&self->_arrowBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_targetBarButtonItem, 0);
  objc_storeStrong((id *)&self->_layoutConstraintView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_popoverView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
