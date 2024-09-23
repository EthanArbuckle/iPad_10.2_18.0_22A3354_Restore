@implementation UIPopoverController

+ (BOOL)_popoversDisabled
{
  void *v2;
  BOOL v3;

  _UIMainBundleIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) == 0
    && (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.iBooks")) & 1) == 0
    && (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.itunesu")) & 1) == 0
    && (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Maps")) & 1) == 0
    && !objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.accessibility.AccessibilityUIServer"));

  return v3;
}

+ (void)_setForceModernPopoverUse:(BOOL)a3
{
  _forceModernPopoverUse = a3;
}

+ (BOOL)_useLegacyPopoverControllers
{
  return _forceModernPopoverUse == 0;
}

+ (BOOL)_showTargetRectPref
{
  if (qword_1ECD7D468 != -1)
    dispatch_once(&qword_1ECD7D468, &__block_literal_global_132);
  return _MergedGlobals_1002;
}

void __42__UIPopoverController__showTargetRectPref__block_invoke()
{
  void *v0;
  id v1;

  _UIKitPreferencesOnce();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("UIPopoverControllerPaintsTargetRect"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_1002 = objc_msgSend(v0, "BOOLValue");

}

+ (Class)_popoverViewClass
{
  return (Class)objc_opt_class();
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
    v8 = 10.0;
    v12 = 10.0;
    v11 = 10.0;
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

- (UIPopoverController)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("-[UIPopoverController init] is not a valid initializer. You must call -[UIPopoverController initWithContentViewController:]."));

  return 0;
}

- (id)_initWithContentViewController:(id)a3 popoverControllerStyle:(int64_t)a4
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  UIPopoverController *v13;
  UIPopoverController *v14;
  UIDimmingView *v15;
  UIDimmingView *dimmingView;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  UIPopoverController *v21;
  void *v23;
  objc_super v24;
  objc_super v25;

  v8 = a3;
  if (dyld_program_sdk_at_least() && !dyld_program_sdk_at_least())
    goto LABEL_10;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    if (v11)
      goto LABEL_10;
  }
  else
  {

  }
  v12 = objc_msgSend((id)objc_opt_class(), "_popoversDisabled");
  if (a4 || !v12)
  {
LABEL_10:
    if (a4 == 1)
      goto LABEL_15;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-[UIPopoverController initWithContentViewController:] called when not running under UIUserInterfaceIdiomPad."));
LABEL_11:
  if (_UIAppUseModernRotationAndPresentationBehaviors()
    && (objc_msgSend((id)objc_opt_class(), "_useLegacyPopoverControllers") & 1) == 0)
  {
    v25.receiver = self;
    v25.super_class = (Class)UIPopoverController;
    v13 = -[UIPopoverController init](&v25, sel_init);
    self = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_contentViewController, a3);
      goto LABEL_21;
    }
  }
LABEL_15:
  if (!v8)
  if ((unint64_t)a4 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPopoverController.m"), 372, CFSTR("Invalid popover controller type (%ld)"), a4);

  }
  -[UIPopoverController _performHierarchyCheckOnViewController:](self, "_performHierarchyCheckOnViewController:", v8);
  v24.receiver = self;
  v24.super_class = (Class)UIPopoverController;
  v14 = -[UIPopoverController init](&v24, sel_init);
  self = v14;
  if (v14)
  {
    v14->_popoverControllerStyle = a4;
    objc_storeStrong((id *)&v14->_contentViewController, a3);
    -[UIViewController _setPopoverController:](self->_contentViewController, "_setPopoverController:", self);
    -[UIPopoverController _transitionFromViewController:toViewController:animated:](self, "_transitionFromViewController:toViewController:animated:", 0, self->_contentViewController, 0);
    v15 = objc_alloc_init(UIDimmingView);
    dimmingView = self->_dimmingView;
    self->_dimmingView = v15;

    -[UIView setTintAdjustmentMode:](self->_dimmingView, "setTintAdjustmentMode:", 1);
    -[UIDimmingView setDelegate:](self->_dimmingView, "setDelegate:", self);
    self->_currentArrowDirection = -1;
    self->_presentationState = 4;
    objc_msgSend((id)objc_opt_class(), "_defaultPopoverLayoutMarginsForPopoverControllerStyle:andContentViewController:", self->_popoverControllerStyle, self->_contentViewController);
    self->_popoverLayoutMargins.top = v17;
    self->_popoverLayoutMargins.left = v18;
    self->_popoverLayoutMargins.bottom = v19;
    self->_popoverLayoutMargins.right = v20;
    *(_WORD *)&self->_retainsSelfWhilePresented = 256;
    self->_showsTargetRect = objc_msgSend((id)objc_opt_class(), "_showTargetRectPref");
  }
LABEL_21:
  v21 = self;

  return v21;
}

- (UIPopoverController)initWithContentViewController:(UIViewController *)viewController
{
  return (UIPopoverController *)-[UIPopoverController _initWithContentViewController:popoverControllerStyle:](self, "_initWithContentViewController:popoverControllerStyle:", viewController, 0);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  UIPopoverController *v5;
  void *v6;
  void *v7;
  UIPopoverController *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[8];

  v12[7] = *MEMORY[0x1E0C80C00];
  -[UIPopoverController _presentationController](self, "_presentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "delegate");
    v5 = (UIPopoverController *)objc_claimAutoreleasedReturnValue();

    if (v5 == self)
      objc_msgSend(v4, "setDelegate:", 0);
  }
  else if (-[UIPopoverController isPopoverVisible](self, "isPopoverVisible"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("-[UIPopoverController dealloc] reached while popover is still visible."));
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = 0x1E17127A0;
  v12[1] = CFSTR("UIKeyboardWillShowNotification");
  v12[2] = CFSTR("UIKeyboardDidHideNotification");
  v12[3] = CFSTR("UIWindowWillRotateNotification");
  v12[4] = CFSTR("UIWindowDidRotateNotification");
  v12[5] = CFSTR("_UIScrollViewWillBeginDraggingNotification");
  v12[6] = CFSTR("_UIScrollViewDidEndDraggingNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v6, self, v7);

  -[_UIPopoverView setPopoverController:](self->_popoverView, "setPopoverController:", 0);
  -[UIViewController _popoverController](self->_contentViewController, "_popoverController");
  v8 = (UIPopoverController *)objc_claimAutoreleasedReturnValue();

  if (v8 == self)
    -[UIViewController _setPopoverController:](self->_contentViewController, "_setPopoverController:", 0);
  -[UIDimmingView setDelegate:](self->_dimmingView, "setDelegate:", 0);
  -[UIGestureRecognizer view](self->_vendedGestureRecognizer, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeGestureRecognizer:", self->_vendedGestureRecognizer);

  -[UIGestureRecognizer removeTarget:action:](self->_vendedGestureRecognizer, "removeTarget:action:", self, sel__swipe_);
  -[UIGestureRecognizer view](self->_dimmingViewGestureRecognizer, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeGestureRecognizer:", self->_dimmingViewGestureRecognizer);

  -[UIGestureRecognizer removeTarget:action:](self->_dimmingViewGestureRecognizer, "removeTarget:action:", self, sel__swipe_);
  -[UIPopoverController _setPresentationController:](self, "_setPresentationController:", 0);

  v11.receiver = self;
  v11.super_class = (Class)UIPopoverController;
  -[UIPopoverController dealloc](&v11, sel_dealloc);
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(UIViewController *)contentViewController
{
  -[UIPopoverController setContentViewController:animated:](self, "setContentViewController:animated:", contentViewController, 0);
}

- (void)setContentViewController:(UIViewController *)viewController animated:(BOOL)animated
{
  _BOOL8 v4;
  void *v6;
  UIViewController *v7;
  UIViewController *contentViewController;
  UIViewController *v9;
  UIViewController *v10;

  v4 = animated;
  v10 = viewController;
  if (!v10)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-[UIPopoverController setContentViewController:animated:] called with a nil viewController."));
  if (-[UIPopoverController _shimPopoverPresentationController](self, "_shimPopoverPresentationController"))
  {
    -[UIPopoverController _presentationController](self, "_presentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setContentViewController:animated:", v10, v4);
LABEL_7:

    v7 = v10;
    goto LABEL_8;
  }
  -[UIPopoverController _performHierarchyCheckOnViewController:](self, "_performHierarchyCheckOnViewController:", v10);
  v7 = v10;
  contentViewController = self->_contentViewController;
  if (contentViewController != v10)
  {
    -[UIPopoverController _transitionFromViewController:toViewController:animated:](self, "_transitionFromViewController:toViewController:animated:", contentViewController, v10, v4);
    v9 = v10;
    v6 = self->_contentViewController;
    self->_contentViewController = v9;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)setPopoverFrame:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _UIPopoverView *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _UIPopoverView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD aBlock[5];
  _UIPopoverView *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  uint64_t v28;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = self->_popoverView;
  -[UIPopoverController _layoutInfoForCurrentKeyboardState](self, "_layoutInfoForCurrentKeyboardState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "offset");
  v13 = v12;

  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__UIPopoverController_setPopoverFrame_animated___block_invoke;
  aBlock[3] = &unk_1E16BF770;
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  aBlock[4] = self;
  v15 = v10;
  v23 = v15;
  v28 = v13;
  v16 = _Block_copy(aBlock);
  v17 = v16;
  if (v4)
  {
    -[UIPopoverController contentViewController](self, "contentViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "transitionCoordinator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20[0] = v14;
      v20[1] = 3221225472;
      v20[2] = __48__UIPopoverController_setPopoverFrame_animated___block_invoke_2;
      v20[3] = &unk_1E16BF798;
      v20[4] = self;
      v21 = v17;
      objc_msgSend(v19, "animateAlongsideTransition:completion:", 0, v20);

    }
    else
    {
      -[UIPopoverController _presentationAnimationDuration](self, "_presentationAnimationDuration");
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 133, v17, 0);
    }

  }
  else
  {
    (*((void (**)(void *))v16 + 2))(v16);
  }

}

uint64_t __48__UIPopoverController_setPopoverFrame_animated___block_invoke(uint64_t a1)
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
  if ((*(_BYTE *)(v6 + 416) & 0x10) != 0)
  {
    v7 = *(void **)(v6 + 48);
    if (v7)
    {
      objc_msgSend(*(id *)(v6 + 32), "superview");
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

uint64_t __48__UIPopoverController_setPopoverFrame_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_presentationAnimationDuration");
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 133, *(_QWORD *)(a1 + 40), 0);
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

- (void)setPopoverContentSize:(CGSize)popoverContentSize
{
  -[UIPopoverController setPopoverContentSize:animated:](self, "setPopoverContentSize:animated:", 1, popoverContentSize.width, popoverContentSize.height);
}

- (void)setPopoverContentSize:(CGSize)size animated:(BOOL)animated
{
  _BOOL8 v4;
  double height;
  double width;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  int v34;
  UIPopoverController *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD aBlock[9];
  char v40;
  _QWORD v41[5];
  UIPopoverController *v42;
  CGRect v43;
  CGRect v44;

  v4 = animated;
  height = size.height;
  width = size.width;
  if (-[UIPopoverController _shimPopoverPresentationController](self, "_shimPopoverPresentationController")
    && (-[UIPopoverController _presentationController](self, "_presentationController"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    -[UIPopoverController _presentationController](self, "_presentationController");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setPopoverContentSize:animated:", v4, width, height);

  }
  else if (!self->_popoverControllerStyle)
  {
    self->_popoverContentSize.width = width;
    self->_popoverContentSize.height = height;
    v9 = (void *)-[_UIPopoverLayoutInfo copy](self->_preferredLayoutInfo, "copy");
    objc_msgSend(v9, "setPreferredContentSize:", width, height);
    if ((*(_BYTE *)&self->_popoverControllerFlags & 0x10) != 0 && self->_layoutConstraintView)
    {
      -[UIView superview](self->_popoverView, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "convertRect:toView:", self->_layoutConstraintView, self->_targetRectInEmbeddingView.origin.x, self->_targetRectInEmbeddingView.origin.y, self->_targetRectInEmbeddingView.size.width, self->_targetRectInEmbeddingView.size.height);
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;

      objc_msgSend(v9, "setSourceViewRect:", v12, v14, v16, v18);
    }
    -[_UIPopoverView backgroundView](self->_popoverView, "backgroundView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "_contentViewInsets");
      objc_msgSend(v9, "setContentInset:");
    }
    -[UIPopoverController setPreferredLayoutInfo:](self, "setPreferredLayoutInfo:", v9);
    if (-[UIPopoverController isPopoverVisible](self, "isPopoverVisible")
      || -[UIPopoverController _isPresenting](self, "_isPresenting"))
    {
      -[UIPopoverController _layoutInfoForCurrentKeyboardState](self, "_layoutInfoForCurrentKeyboardState");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "frame");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;

      -[UIView frame](self->_popoverView, "frame");
      v44.origin.x = v30;
      v44.origin.y = v31;
      v44.size.width = v32;
      v44.size.height = v33;
      v43.origin.x = v23;
      v43.origin.y = v25;
      v43.size.width = v27;
      v43.size.height = v29;
      if (!CGRectEqualToRect(v43, v44))
      {
        if (v4)
          v34 = !-[UIPopoverController _isPresenting](self, "_isPresenting");
        else
          v34 = 0;
        v41[0] = 0;
        v41[1] = v41;
        v41[2] = 0x3032000000;
        v41[3] = __Block_byref_object_copy__54;
        v41[4] = __Block_byref_object_dispose__54;
        v35 = self;
        v42 = v35;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __54__UIPopoverController_setPopoverContentSize_animated___block_invoke;
        aBlock[3] = &unk_1E16BF7C0;
        aBlock[4] = v41;
        *(CGFloat *)&aBlock[5] = v23;
        *(CGFloat *)&aBlock[6] = v25;
        *(CGFloat *)&aBlock[7] = v27;
        *(CGFloat *)&aBlock[8] = v29;
        v40 = v34;
        v36 = _Block_copy(aBlock);
        v37 = v36;
        if (v34)
        {
          -[UIView layoutBelowIfNeeded](self->_popoverView, "layoutBelowIfNeeded");
          -[UIPopoverController _presentationAnimationDuration](v35, "_presentationAnimationDuration");
          +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v37, 0);
        }
        else
        {
          (*((void (**)(void *))v36 + 2))(v36);
        }

        _Block_object_dispose(v41, 8);
      }
    }

  }
}

uint64_t __54__UIPopoverController_setPopoverContentSize_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setPopoverFrame:animated:", *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)isPopoverVisible
{
  void *v3;
  char v4;
  _UIPopoverView *popoverView;

  if (-[UIPopoverController _shimPopoverPresentationController](self, "_shimPopoverPresentationController"))
  {
    -[UIPopoverController _presentationController](self, "_presentationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPopoverVisible");
  }
  else
  {
    popoverView = self->_popoverView;
    if (!popoverView)
      return 0;
    -[UIView window](popoverView, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v4 = self->_popoverControllerStyle != 1 || (self->_presentationState - 1) < 3;
    else
      v4 = 0;
  }

  return v4;
}

- (UIPopoverArrowDirection)popoverArrowDirection
{
  _UIPopoverView *popoverView;

  popoverView = self->_popoverView;
  if (popoverView)
    return -[_UIPopoverView arrowDirection](popoverView, "arrowDirection");
  else
    return -1;
}

- (UIEdgeInsets)popoverLayoutMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  if (-[UIPopoverController _shimPopoverPresentationController](self, "_shimPopoverPresentationController")
    && !self->_presentationController)
  {
    objc_msgSend(0, "popoverLayoutMargins");
  }
  else
  {
    top = self->_popoverLayoutMargins.top;
    left = self->_popoverLayoutMargins.left;
    bottom = self->_popoverLayoutMargins.bottom;
    right = self->_popoverLayoutMargins.right;
  }
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPopoverLayoutMargins:(UIEdgeInsets)popoverLayoutMargins
{
  double right;
  double bottom;
  double left;
  double top;
  UIPopoverPresentationController *presentationController;

  right = popoverLayoutMargins.right;
  bottom = popoverLayoutMargins.bottom;
  left = popoverLayoutMargins.left;
  top = popoverLayoutMargins.top;
  if (-[UIPopoverController _shimPopoverPresentationController](self, "_shimPopoverPresentationController")
    && (presentationController = self->_presentationController) != 0)
  {
    -[UIPopoverPresentationController setPopoverLayoutMargins:](presentationController, "setPopoverLayoutMargins:", top, left, bottom, right);
  }
  else
  {
    self->_popoverLayoutMargins.top = top;
    self->_popoverLayoutMargins.left = left;
    self->_popoverLayoutMargins.bottom = bottom;
    self->_popoverLayoutMargins.right = right;
  }
}

- (UIColor)backgroundColor
{
  UIPopoverPresentationController *presentationController;
  UIColor *v4;

  if (-[UIPopoverController _shimPopoverPresentationController](self, "_shimPopoverPresentationController")
    && (presentationController = self->_presentationController) != 0)
  {
    -[UIPopoverPresentationController backgroundColor](presentationController, "backgroundColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_backgroundColor;
  }
  return v4;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  UIPopoverPresentationController *presentationController;
  UIColor *v5;
  UIColor *v6;
  UIColor *v7;
  UIColor *v8;
  UIColor *v9;
  UIColor *v10;

  v10 = backgroundColor;
  if (-[UIPopoverController _shimPopoverPresentationController](self, "_shimPopoverPresentationController"))
  {
    presentationController = self->_presentationController;
    if (presentationController)
    {
      -[UIPopoverPresentationController setBackgroundColor:](presentationController, "setBackgroundColor:", v10);
LABEL_8:
      v5 = v10;
      goto LABEL_9;
    }
    v5 = v10;
    if (self->_backgroundColor != v10)
    {
      v8 = (UIColor *)-[UIColor copy](v10, "copy");
      v9 = self->_backgroundColor;
      self->_backgroundColor = v8;

      goto LABEL_8;
    }
  }
  else
  {
    v5 = v10;
    if (self->_backgroundColor != v10)
    {
      v6 = (UIColor *)-[UIColor copy](v10, "copy");
      v7 = self->_backgroundColor;
      self->_backgroundColor = v6;

      -[_UIPopoverView setPopoverBackgroundColor:](self->_popoverView, "setPopoverBackgroundColor:", v10);
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (NSArray)passthroughViews
{
  return -[UIDimmingView passthroughViews](self->_dimmingView, "passthroughViews");
}

- (void)setPassthroughViews:(NSArray *)passthroughViews
{
  UIPopoverPresentationController *presentationController;
  uint64_t v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;

  v9 = passthroughViews;
  if (-[UIPopoverController _shimPopoverPresentationController](self, "_shimPopoverPresentationController"))
  {
    presentationController = self->_presentationController;
    if (presentationController)
    {
      -[UIPopoverPresentationController setPassthroughViews:](presentationController, "setPassthroughViews:", v9);
    }
    else
    {
      v7 = (NSArray *)-[NSArray copy](v9, "copy");
      v8 = self->_passthroughViews;
      self->_passthroughViews = v7;

    }
    v6 = v9;
  }
  else
  {
    v5 = -[NSArray copy](v9, "copy");

    -[UIDimmingView setPassthroughViews:](self->_dimmingView, "setPassthroughViews:", v5);
    v6 = (void *)v5;
  }

}

- (Class)_popoverLayoutInfoForChromeClass:(Class)a3
{
  objc_opt_class();
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPopoverController.m"), 662, CFSTR("Failed to determine chrome view class"));

    v5 = 0;
    return v5;
  }
  if (popoverControllerStyle)
    goto LABEL_6;
  v5 = +[_UIPopoverStandardChromeView legacyChromeViewClass](_UIPopoverStandardChromeView, "legacyChromeViewClass");
  if (!v5)
    goto LABEL_6;
  return v5;
}

- (int)_presentationState
{
  return self->_presentationState;
}

- (void)_setPresentationState:(int)a3
{
  void *v5;
  _UIPopoverView *popoverView;
  void *v7;
  _BOOL4 v9;
  unsigned int v10;
  _BOOL8 v11;
  void *v12;

  -[UIPopoverController _managingSplitViewController](self, "_managingSplitViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  popoverView = self->_popoverView;
  v12 = v5;
  if (popoverView)
  {
    -[UIView window](popoverView, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v9 = self->_popoverControllerStyle == 1 && v12 != 0;
    else
      v9 = 0;

    v5 = v12;
  }
  else
  {
    v9 = 0;
  }
  v10 = self->_presentationState - 1;
  if (v9 && (a3 - 1) < 2 != v10 < 2)
  {
    v11 = v10 < 2;
    objc_msgSend(v5, "_popoverController:willChangeToVisible:", self, (a3 - 1) < 2);
    self->_presentationState = a3;
    objc_msgSend(v12, "_popoverController:didChangeFromVisible:", self, v11);
    v5 = v12;
  }
  else
  {
    self->_presentationState = a3;
  }

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
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPopoverController.m"), 692, CFSTR("About to overflow slide transition count"));

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

- (void)_presentPopoverBySlidingIn:(BOOL)a3 fromEdge:(unint64_t)a4 ofView:(id)a5 animated:(BOOL)a6 stateOnly:(BOOL)a7 notifyDelegate:(BOOL)a8
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int presentationState;
  _BOOL4 v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double Height;
  double v26;
  uint64_t v27;
  UIDimmingView *dimmingView;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  _UIPopoverLayoutInfo *v37;
  _UIPopoverLayoutInfo *preferredLayoutInfo;
  _UIPopoverLayoutInfo *v39;
  double Width;
  id v41;
  id v42;
  void (**v43)(_QWORD);
  char v44;
  uint64_t v45;
  CGFloat v46;
  double v47;
  double v48;
  UIDimmingView *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _UIPopoverView *popoverView;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  uint64_t popoverBackgroundViewClass;
  id v81;
  _UIPopoverView *v82;
  _UIPopoverView *v83;
  _UIPopoverView *v84;
  int v85;
  UIViewController *contentViewController;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void (**v92)(void *, uint64_t);
  UIDimmingView *v93;
  uint64_t v94;
  double MaxX;
  double v99;
  double MinX;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  _BOOL4 v107;
  _BOOL4 v108;
  _BOOL4 v110;
  _QWORD v112[5];
  id v113;
  id v114;
  BOOL v115;
  BOOL v116;
  char v117;
  _QWORD aBlock[5];
  id v119;
  _QWORD v120[5];
  id v121;
  BOOL v122;
  id location;
  _QWORD v124[9];
  BOOL v125;
  const __CFString *v126;
  _QWORD v127[3];
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;

  v108 = a8;
  v107 = a6;
  v110 = a3;
  v127[1] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    goto LABEL_4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    _NSFullMethodName();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: Popovers cannot be presented from a view which does not have a window."), v11);
LABEL_4:

  }
  if (a4 != 2 && a4 != 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPopoverController.m"), 706, CFSTR("Only 'UIMinXEdge' and 'UIMaxXEdge' are currently supported"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v10;
  }
  else
  {
    objc_msgSend(v10, "window");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
  presentationState = self->_presentationState;
  v17 = presentationState == 4 && v110;
  v18 = presentationState != 2 || v110;
  if (objc_msgSend(v14, "_isTextEffectsWindow"))
    *(_BYTE *)&self->_popoverControllerFlags |= 8u;
  -[UIPopoverController _layoutDimmingViewForInterfaceOrientationOfHostingWindow:](self, "_layoutDimmingViewForInterfaceOrientationOfHostingWindow:", v15);
  -[UIView superview](self->_dimmingView, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19 != v15)
    objc_msgSend(v15, "addSubview:", self->_dimmingView);
  -[UIPopoverController _managingSplitViewController](self, "_managingSplitViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[UIPopoverController _managingSplitViewController](self, "_managingSplitViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_contentSizeForChildViewController:inPopoverController:", self->_contentViewController, self);
    v23 = v22;

  }
  else
  {
    -[UIViewController _resolvedPreferredContentSize](self->_contentViewController, "_resolvedPreferredContentSize");
    v23 = v24;
  }

  objc_msgSend(v10, "bounds");
  Height = CGRectGetHeight(v128);
  v26 = 0.0;
  if (a4 != 2)
  {
    objc_msgSend(v10, "bounds");
    v26 = CGRectGetWidth(v129) - v23;
  }
  v27 = MEMORY[0x1E0C809B0];
  if (!self->_preferredLayoutInfo)
  {
    dimmingView = self->_dimmingView;
    objc_msgSend(v10, "convertRect:toView:", v15, v26, 0.0, v23, Height);
    -[UIView convertRect:fromView:](dimmingView, "convertRect:fromView:", v15);
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    self->_targetRectInDimmingView.origin.x = v29;
    self->_targetRectInDimmingView.origin.y = v31;
    self->_targetRectInDimmingView.size.width = v33;
    self->_targetRectInDimmingView.size.height = v35;
    v37 = (_UIPopoverLayoutInfo *)objc_alloc_init(-[UIPopoverController _popoverLayoutInfoForChromeClass:](self, "_popoverLayoutInfoForChromeClass:", objc_opt_class()));
    preferredLayoutInfo = self->_preferredLayoutInfo;
    self->_preferredLayoutInfo = v37;

    v39 = self->_preferredLayoutInfo;
    v124[0] = v27;
    v124[1] = 3221225472;
    v124[2] = __100__UIPopoverController__presentPopoverBySlidingIn_fromEdge_ofView_animated_stateOnly_notifyDelegate___block_invoke;
    v124[3] = &unk_1E16C0FE0;
    v124[4] = self;
    *(CGFloat *)&v124[5] = v30;
    *(CGFloat *)&v124[6] = v32;
    *(CGFloat *)&v124[7] = v34;
    *(CGFloat *)&v124[8] = v36;
    v125 = a4 == 2;
    -[_UIPopoverLayoutInfo updateProperties:](v39, "updateProperties:", v124);
  }
  v130.origin.x = v26;
  v130.origin.y = 0.0;
  v130.size.width = v23;
  v130.size.height = Height;
  Width = CGRectGetWidth(v130);
  if (!a7)
  {
    v131.origin.x = v26;
    v131.origin.y = 0.0;
    v131.size.width = v23;
    v131.size.height = Height;
    v46 = CGRectGetWidth(v131);
    v47 = -v46;
    v48 = v26 + v46;
    if (a4 == 2)
      v48 = v47;
    v49 = self->_dimmingView;
    objc_msgSend(v10, "convertRect:toView:", v15, v48, 0.0, v23, Height);
    -[UIView convertRect:fromView:](v49, "convertRect:fromView:", v15);
    v51 = v50;
    v53 = v52;
    v55 = v54;
    v57 = v56;
    if (v17)
    {
      v58 = (void *)-[_UIPopoverLayoutInfo copy](self->_preferredLayoutInfo, "copy");
      objc_msgSend(v58, "setSourceViewRect:", v51, v53, v55, v57);
      -[UIPopoverController _layoutInfoFromLayoutInfo:forCurrentKeyboardStateAndHostingWindow:](self, "_layoutInfoFromLayoutInfo:forCurrentKeyboardStateAndHostingWindow:", v58, v15);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIPopoverController _startWatchingForKeyboardNotificationsIfNecessary](self, "_startWatchingForKeyboardNotificationsIfNecessary");
    }
    else if ((v18 & 1) != 0)
    {
      -[UIView layer](self->_popoverView, "layer");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "presentationLayer");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      popoverView = self->_popoverView;
      v104 = Width;
      if (v61)
      {
        -[UIView layer](popoverView, "layer");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "presentationLayer");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "frame");
        v105 = v65;
        v103 = v66;
        v68 = v67;
        v70 = v69;

      }
      else
      {
        -[UIView frame](popoverView, "frame");
        v105 = v71;
        v103 = v72;
        v68 = v73;
        v70 = v74;
      }

      v75 = (void *)-[_UIPopoverLayoutInfo copy](self->_preferredLayoutInfo, "copy");
      objc_msgSend(v75, "setPreferredContentSize:", v68, v70);
      -[UIView bounds](self->_dimmingView, "bounds");
      v76 = CGRectGetWidth(v132);
      -[UIView bounds](self->_dimmingView, "bounds");
      v77 = CGRectGetHeight(v133);
      if (v76 < v77)
        v76 = v77;
      v78 = 0.0;
      if (a4 != 2)
      {
        objc_msgSend(v10, "bounds", 0.0);
        v78 = CGRectGetWidth(v134) - v23;
      }
      objc_msgSend(v75, "setContainingFrame:", v78, 0.0, v76, v76);
      objc_msgSend(v75, "setSourceViewRect:", v105, v103, v68, v70);
      -[UIPopoverController _layoutInfoFromLayoutInfo:forCurrentKeyboardStateAndHostingWindow:](self, "_layoutInfoFromLayoutInfo:forCurrentKeyboardStateAndHostingWindow:", v75, v15);
      Width = v104;
      v59 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[UIPopoverController _layoutInfoForCurrentKeyboardStateAndHostingWindow:](self, "_layoutInfoForCurrentKeyboardStateAndHostingWindow:", v15);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v110)
    {
      -[UIPopoverController _layoutInfoForCurrentKeyboardStateAndHostingWindow:](self, "_layoutInfoForCurrentKeyboardStateAndHostingWindow:", v15);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v79 = (void *)-[_UIPopoverLayoutInfo copy](self->_preferredLayoutInfo, "copy");
      objc_msgSend(v79, "setPreferredContentSize:", v55, v57);
      objc_msgSend(v79, "setSourceViewRect:", v51, v53, v55, v57);
      -[UIPopoverController _layoutInfoFromLayoutInfo:forCurrentKeyboardStateAndHostingWindow:](self, "_layoutInfoFromLayoutInfo:forCurrentKeyboardStateAndHostingWindow:", v79, v15);
      v106 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_initWeak(&location, self);
    -[UIPopoverController _incrementSlideTransitionCount:](self, "_incrementSlideTransitionCount:", 1);
    if (!self->_popoverView)
    {
      popoverBackgroundViewClass = (uint64_t)self->_popoverBackgroundViewClass;
      if (!popoverBackgroundViewClass)
        popoverBackgroundViewClass = objc_opt_class();
      v81 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_popoverViewClass"));
      objc_msgSend(v59, "frame");
      v82 = (_UIPopoverView *)objc_msgSend(v81, "initWithFrame:backgroundViewClass:", popoverBackgroundViewClass);
      v83 = self->_popoverView;
      self->_popoverView = v82;

      -[_UIPopoverView setPopoverController:](self->_popoverView, "setPopoverController:", self);
      v84 = self->_popoverView;
      +[_UIPopoverSlidingChromeView cornerRadius](_UIPopoverSlidingChromeView, "cornerRadius");
      -[_UIPopoverView _setCornerRadius:](v84, "_setCornerRadius:");
      -[UIPopoverController _setPopoverBackgroundStyle:](self, "_setPopoverBackgroundStyle:", self->_popoverBackgroundStyle);
      -[_UIPopoverView setPopoverBackgroundColor:](self->_popoverView, "setPopoverBackgroundColor:", self->_backgroundColor);
    }
    v120[0] = v27;
    v120[1] = 3221225472;
    v120[2] = __100__UIPopoverController__presentPopoverBySlidingIn_fromEdge_ofView_animated_stateOnly_notifyDelegate___block_invoke_2;
    v120[3] = &unk_1E16B4008;
    v122 = v17;
    v120[4] = self;
    v41 = v59;
    v121 = v41;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v120);

    if (v110)
      v45 = 1;
    else
      v45 = 3;
    if (v110)
      v85 = 2;
    else
      v85 = 4;
    if (self->_presentationState == v85)
      goto LABEL_60;
    contentViewController = self->_contentViewController;
    if (v110)
    {
      -[UIViewController beginAppearanceTransition:animated:](contentViewController, "beginAppearanceTransition:animated:", 1, 0);
      if (presentationState == 4)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "postNotificationName:object:userInfo:", CFSTR("_UIAlertWillAppearNotification"), self, 0);
        v126 = CFSTR("UIPopoverControllerPresentingWindowKey");
        -[UIView window](self->_popoverView, "window");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v127[0] = v88;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v127, &v126, 1);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "postNotificationName:object:userInfo:", CFSTR("UIPopoverControllerWillPresentPopoverNotification"), self, v89);

        -[UIPopoverController _startWatchingForWindowRotations](self, "_startWatchingForWindowRotations");
      }
    }
    else
    {
      if (-[UIViewController _appearState](contentViewController, "_appearState") != 2)
      {
LABEL_60:
        v44 = 0;
LABEL_67:
        aBlock[0] = v27;
        aBlock[1] = 3221225472;
        aBlock[2] = __100__UIPopoverController__presentPopoverBySlidingIn_fromEdge_ofView_animated_stateOnly_notifyDelegate___block_invoke_3;
        aBlock[3] = &unk_1E16B1B50;
        aBlock[4] = self;
        v42 = v106;
        v119 = v42;
        v43 = (void (**)(_QWORD))_Block_copy(aBlock);

        goto LABEL_68;
      }
      -[UIViewController beginAppearanceTransition:animated:](self->_contentViewController, "beginAppearanceTransition:animated:", 0, 0);
    }
    v44 = 1;
    goto LABEL_67;
  }
  objc_initWeak(&location, self);
  v41 = 0;
  v42 = 0;
  v43 = 0;
  v44 = 0;
  if (v110)
    v45 = 1;
  else
    v45 = 3;
LABEL_68:
  -[UIPopoverController _setPresentationState:](self, "_setPresentationState:", v45);
  -[UIPopoverController _completionBlockForDismissalWhenNotifyingDelegate:](self, "_completionBlockForDismissalWhenNotifyingDelegate:", v108);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v112[0] = v27;
  v112[1] = 3221225472;
  v112[2] = __100__UIPopoverController__presentPopoverBySlidingIn_fromEdge_ofView_animated_stateOnly_notifyDelegate___block_invoke_4;
  v112[3] = &unk_1E16C1008;
  objc_copyWeak(&v114, &location);
  v115 = a7;
  v116 = v110;
  v112[4] = self;
  v91 = v90;
  v113 = v91;
  v117 = v44;
  v92 = (void (**)(void *, uint64_t))_Block_copy(v112);
  if (!v107 || a7)
  {
    if (v43)
      v43[2](v43);
    v92[2](v92, 1);
  }
  else
  {
    v93 = self->_dimmingView;
    objc_msgSend(v41, "frame");
    -[UIView convertRect:toView:](v93, "convertRect:toView:", v15);
    objc_msgSend(v10, "convertRect:fromView:", v15);
    if (v110)
    {
      if (a4 == 2)
      {
        MaxX = CGRectGetMaxX(*(CGRect *)&v94);
      }
      else
      {
        MinX = CGRectGetMinX(*(CGRect *)&v94);
        objc_msgSend(v10, "bounds");
        MaxX = MinX - CGRectGetMaxX(v135);
      }
      v99 = Width - MaxX;
    }
    else if (a4 == 2)
    {
      v99 = CGRectGetMaxX(*(CGRect *)&v94);
    }
    else
    {
      v101 = CGRectGetMinX(*(CGRect *)&v94);
      objc_msgSend(v10, "bounds");
      v99 = v101 - CGRectGetMaxX(v136);
    }
    -[UIPopoverController _presentationAnimationDuration](self, "_presentationAnimationDuration");
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v43, v92, v102 * (v99 / Width));
  }

  objc_destroyWeak(&v114);
  objc_destroyWeak(&location);

}

uint64_t __100__UIPopoverController__presentPopoverBySlidingIn_fromEdge_ofView_animated_stateOnly_notifyDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setPreferredContentSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  +[_UIPopoverSlidingChromeView contentViewInsets](_UIPopoverSlidingChromeView, "contentViewInsets");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setContentInset:");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 128);
  objc_msgSend(*(id *)(v2 + 40), "bounds");
  objc_msgSend(v3, "setContainingFrame:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setContainingFrameInsets:", *(double *)(*(_QWORD *)(a1 + 32) + 448), *(double *)(*(_QWORD *)(a1 + 32) + 456), *(double *)(*(_QWORD *)(a1 + 32) + 464), *(double *)(*(_QWORD *)(a1 + 32) + 472));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setSourceViewRect:", *(double *)(*(_QWORD *)(a1 + 32) + 160), *(double *)(*(_QWORD *)(a1 + 32) + 168), *(double *)(*(_QWORD *)(a1 + 32) + 176), *(double *)(*(_QWORD *)(a1 + 32) + 184));
}

uint64_t __100__UIPopoverController__presentPopoverBySlidingIn_fromEdge_ofView_animated_stateOnly_notifyDelegate___block_invoke_2(uint64_t a1)
{
  void *v2;

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "_transitionFromViewController:toViewController:animated:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "frame");
  objc_msgSend(v2, "setFrame:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "layoutBelowIfNeeded");
}

void __100__UIPopoverController__presentPopoverBySlidingIn_fromEdge_ofView_animated_stateOnly_notifyDelegate___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "popoverView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "frame");
  objc_msgSend(v2, "setFrame:");

}

void __100__UIPopoverController__presentPopoverBySlidingIn_fromEdge_ofView_animated_stateOnly_notifyDelegate___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  BOOL v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (*(_BYTE *)(a1 + 56) || (v3 = objc_msgSend(WeakRetained, "_slideTransitionCount") == 1, WeakRetained = v6, v3))
  {
    if (objc_msgSend(WeakRetained, "_presentationState") == 3
      || *(_BYTE *)(a1 + 56) && !*(_BYTE *)(a1 + 57))
    {
      objc_msgSend(v6, "_setPresentationState:", 4);
      objc_msgSend(v6, "_setPresentingView:", 0);
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 384))
        objc_msgSend(v6, "_setPresentationEdge:", 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      if (!*(_BYTE *)(a1 + 56) && *(_BYTE *)(a1 + 58))
      {
        objc_msgSend(v6, "contentViewController");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "endAppearanceTransition");

      }
      objc_msgSend(v6, "_postludeForDismissal");
    }
    else if (objc_msgSend(v6, "_presentationState") == 1)
    {
      objc_msgSend(v6, "_setPresentationState:", 2);
      if (!*(_BYTE *)(a1 + 56))
      {
        if (*(_BYTE *)(a1 + 58))
        {
          objc_msgSend(v6, "contentViewController");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "endAppearanceTransition");

        }
      }
    }
    objc_msgSend(v6, "_resetSlideTransitionCount");
  }
  else if (objc_msgSend(v6, "_slideTransitionCount") && !*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v6, "_incrementSlideTransitionCount:", 0);
  }

}

- (void)_presentPopoverFromEdge:(unint64_t)a3 ofView:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id WeakRetained;
  id v10;
  unint64_t presentationEdge;
  void *v12;
  id v13;
  id v14;
  id obj;

  v5 = a5;
  obj = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingView);
  if (WeakRetained || self->_presentationEdge && !self->_vendedGestureRecognizer)
  {
    v10 = objc_loadWeakRetained((id *)&self->_presentingView);
    if (v10 != obj)
    {

LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPopoverController.m"), 890, CFSTR("Unexpected presenting view or presentation edge"));

      goto LABEL_9;
    }
    presentationEdge = self->_presentationEdge;

    if (presentationEdge != a3)
      goto LABEL_8;
  }
LABEL_9:
  v13 = objc_storeWeak((id *)&self->_presentingView, obj);
  self->_presentationEdge = a3;
  v14 = v13;
  -[UIPopoverController _presentPopoverBySlidingIn:fromEdge:ofView:animated:stateOnly:notifyDelegate:](self, "_presentPopoverBySlidingIn:fromEdge:ofView:animated:stateOnly:notifyDelegate:", 1, a3, obj, v5, 0, 0);

}

- (void)_presentPopoverFromRect:(CGRect)a3 embeddedInView:(id)a4 usingViewForLayoutConstraints:(id)a5 permittedArrowDirections:(unint64_t)a6 animate:(BOOL)a7
{
  _BOOL4 v7;
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  void *v27;
  objc_class *popoverBackgroundViewClass;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _UIPopoverLayoutInfo *v37;
  _UIPopoverLayoutInfo *preferredLayoutInfo;
  _UIPopoverLayoutInfo *v39;
  uint64_t v40;
  id v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  unint64_t v55;
  double v56;
  double v57;
  void (**v58)(_QWORD);
  void (**v59)(void *, uint64_t);
  _QWORD v60[5];
  _QWORD aBlock[11];
  BOOL v62;
  _QWORD v63[10];
  _QWORD v64[5];
  id v65;
  objc_class *v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const __CFString *v72;
  _QWORD v73[3];
  CGRect v74;
  CGRect v75;

  v7 = a7;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v73[1] = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a5;
  if (a6 == -1)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    _NSFullMethodName();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "raise:format:", v18, CFSTR("%@: Popovers cannot be presented with UIPopoverArrowDirectionUnknown."), v19);

  }
  objc_msgSend(v15, "window");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_7;
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    _NSFullMethodName();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "raise:format:", v22, CFSTR("%@: Popovers cannot be presented from a view which does not have a window."), v20);
  }

LABEL_7:
  objc_msgSend(v16, "subviews");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "containsObject:", v15);

  if ((v24 & 1) == 0)
  {
    v25 = (void *)MEMORY[0x1E0C99DA0];
    v26 = *MEMORY[0x1E0C99778];
    _NSFullMethodName();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "raise:format:", v26, CFSTR("%@: The view for embedding must be a subview of the layoutConstraintView."), v27);

  }
  *(_BYTE *)&self->_popoverControllerFlags |= 0x30u;
  self->_embeddedTargetRect.origin.x = x;
  self->_embeddedTargetRect.origin.y = y;
  self->_embeddedTargetRect.size.width = width;
  self->_embeddedTargetRect.size.height = height;
  objc_storeStrong((id *)&self->_layoutConstraintView, a5);
  popoverBackgroundViewClass = self->_popoverBackgroundViewClass;
  if (!popoverBackgroundViewClass)
    popoverBackgroundViewClass = -[UIPopoverController _defaultChromeViewClass](self, "_defaultChromeViewClass");
  -[UIPopoverController _setPresentationState:](self, "_setPresentationState:", 1);
  self->_targetRectInEmbeddingView.origin.x = x;
  self->_targetRectInEmbeddingView.origin.y = y;
  self->_targetRectInEmbeddingView.size.width = width;
  self->_targetRectInEmbeddingView.size.height = height;
  objc_msgSend(v15, "convertRect:toView:", v16, x, y, width, height);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v37 = (_UIPopoverLayoutInfo *)objc_alloc_init(-[UIPopoverController _popoverLayoutInfoForChromeClass:](self, "_popoverLayoutInfoForChromeClass:", popoverBackgroundViewClass));
  preferredLayoutInfo = self->_preferredLayoutInfo;
  self->_preferredLayoutInfo = v37;

  v39 = self->_preferredLayoutInfo;
  v40 = MEMORY[0x1E0C809B0];
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __125__UIPopoverController__presentPopoverFromRect_embeddedInView_usingViewForLayoutConstraints_permittedArrowDirections_animate___block_invoke;
  v64[3] = &unk_1E16C1030;
  v64[4] = self;
  v66 = popoverBackgroundViewClass;
  v67 = a6;
  v41 = v16;
  v65 = v41;
  v68 = v30;
  v69 = v32;
  v70 = v34;
  v71 = v36;
  -[_UIPopoverLayoutInfo updateProperties:](v39, "updateProperties:", v64);
  -[_UIPopoverLayoutInfo setPreferredArrowDirections:](self->_preferredLayoutInfo, "setPreferredArrowDirections:", -[_UIPopoverLayoutInfo arrowDirection](self->_preferredLayoutInfo, "arrowDirection"));
  -[_UIPopoverLayoutInfo frame](self->_preferredLayoutInfo, "frame");
  objc_msgSend(v41, "convertRect:toView:", v15);
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v63[0] = v40;
  v63[1] = 3221225472;
  v63[2] = __125__UIPopoverController__presentPopoverFromRect_embeddedInView_usingViewForLayoutConstraints_permittedArrowDirections_animate___block_invoke_2;
  v63[3] = &unk_1E16C1058;
  v63[4] = self;
  *(double *)&v63[5] = v42;
  *(double *)&v63[6] = v44;
  *(double *)&v63[7] = v46;
  *(double *)&v63[8] = v48;
  v63[9] = popoverBackgroundViewClass;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v63);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = CFSTR("UIPopoverControllerPresentingWindowKey");
  objc_msgSend(v15, "window");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v51;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "postNotificationName:object:userInfo:", CFSTR("UIPopoverControllerWillPresentPopoverNotification"), self, v52);

  -[UIPopoverController _transitionFromViewController:toViewController:animated:](self, "_transitionFromViewController:toViewController:animated:", 0, self->_contentViewController, 0);
  v74.origin.x = v43;
  v74.origin.y = v45;
  v74.size.width = v47;
  v74.size.height = v49;
  v53 = CGRectGetWidth(v74) * 0.5;
  v75.origin.x = v43;
  v75.origin.y = v45;
  v75.size.width = v47;
  v75.size.height = v49;
  v54 = CGRectGetHeight(v75);
  v55 = -[_UIPopoverView arrowDirection](self->_popoverView, "arrowDirection");
  if (v55 - 1 < 2)
  {
    -[_UIPopoverView arrowOffset](self->_popoverView, "arrowOffset");
    v53 = v53 + v57;
  }
  else if (v55 == 4 || v55 == 8)
  {
    -[_UIPopoverView arrowOffset](self->_popoverView, "arrowOffset");
    v54 = v54 + v56;
  }
  if ((*(_BYTE *)&self->_popoverControllerFlags & 0x20) != 0)
  {
    -[UIView setAlpha:](self->_popoverView, "setAlpha:", 0.0);
    objc_msgSend(v15, "addSubview:", self->_popoverView);
    aBlock[0] = v40;
    aBlock[1] = 3221225472;
    aBlock[2] = __125__UIPopoverController__presentPopoverFromRect_embeddedInView_usingViewForLayoutConstraints_permittedArrowDirections_animate___block_invoke_3;
    aBlock[3] = &unk_1E16BF6D8;
    aBlock[4] = self;
    v62 = v7;
    *(CGFloat *)&aBlock[5] = v43;
    *(CGFloat *)&aBlock[6] = v45;
    *(CGFloat *)&aBlock[7] = v47;
    *(CGFloat *)&aBlock[8] = v49;
    *(double *)&aBlock[9] = v53;
    *(double *)&aBlock[10] = v54;
    v58 = (void (**)(_QWORD))_Block_copy(aBlock);
    v60[0] = v40;
    v60[1] = 3221225472;
    v60[2] = __125__UIPopoverController__presentPopoverFromRect_embeddedInView_usingViewForLayoutConstraints_permittedArrowDirections_animate___block_invoke_79;
    v60[3] = &unk_1E16B3FD8;
    v60[4] = self;
    v59 = (void (**)(void *, uint64_t))_Block_copy(v60);
    if (v7)
    {
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v58, v59, 0.23);
    }
    else
    {
      v58[2](v58);
      v59[2](v59, 1);
    }

  }
  else
  {
    objc_msgSend(v15, "addSubview:", self->_popoverView);
    -[UIPopoverController _setPresentationState:](self, "_setPresentationState:", 2);
  }
  -[UIView layoutBelowIfNeeded](self->_popoverView, "layoutBelowIfNeeded");

}

uint64_t __125__UIPopoverController__presentPopoverFromRect_embeddedInView_usingViewForLayoutConstraints_permittedArrowDirections_animate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  objc_msgSend(*(id *)(a1 + 48), "contentViewInsets");
  objc_msgSend(v2, "setContentInset:");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  objc_msgSend(*(id *)(a1 + 48), "arrowHeight");
  objc_msgSend(v3, "setArrowHeight:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setPreferredContentSize:", *(double *)(*(_QWORD *)(a1 + 32) + 144), *(double *)(*(_QWORD *)(a1 + 32) + 152));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setPreferredArrowDirections:", *(_QWORD *)(a1 + 56));
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v4, "setContainingFrame:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setContainingFrameInsets:", *(double *)(*(_QWORD *)(a1 + 32) + 448), *(double *)(*(_QWORD *)(a1 + 32) + 456), *(double *)(*(_QWORD *)(a1 + 32) + 464), *(double *)(*(_QWORD *)(a1 + 32) + 472));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setSourceViewRect:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
}

uint64_t __125__UIPopoverController__presentPopoverFromRect_embeddedInView_usingViewForLayoutConstraints_permittedArrowDirections_animate___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_popoverViewClass")), "initWithFrame:backgroundViewClass:embeddedInView:contentExtendsOverArrow:", *(_QWORD *)(a1 + 72), 1, 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setPopoverController:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setArrowDirection:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "arrowDirection"));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  objc_msgSend(*(id *)(a1 + 72), "_contentViewCornerRadiusForArrowDirection:", objc_msgSend(*(id *)(v5 + 128), "arrowDirection"));
  objc_msgSend(v6, "_setCornerRadius:");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  objc_msgSend(*(id *)(v7 + 128), "offset");
  objc_msgSend(v8, "setArrowOffset:");
  objc_msgSend(*(id *)(a1 + 32), "_setPopoverBackgroundStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setPopoverBackgroundColor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
}

void __125__UIPopoverController__presentPopoverFromRect_embeddedInView_usingViewForLayoutConstraints_permittedArrowDirections_animate___block_invoke_3(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setAlpha:", 1.0);
  if (*(_BYTE *)(a1 + 88))
  {
    LODWORD(v2) = 1058536130;
    LODWORD(v3) = 1039604887;
    LODWORD(v4) = 1044467595;
    LODWORD(v5) = 1070230353;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v2, v3, v4, v5);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.scale"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimingFunction:", v14);
    objc_msgSend(v6, "setFromValue:", &unk_1E1A95640);
    objc_msgSend(v6, "setToValue:", &unk_1E1A973F8);
    objc_msgSend(v6, "setRemovedOnCompletion:", 1);
    objc_msgSend(v6, "setDuration:", UIAnimationDragCoefficient() * 0.23);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimingFunction:", v14);
    objc_msgSend(*(id *)(a1 + 32), "_centerPointForScale:frame:anchor:", 0.699999988, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFromValue:", v8);

    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "position");
    objc_msgSend(v9, "valueWithCGPoint:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setToValue:", v11);

    objc_msgSend(v7, "setRemovedOnCompletion:", 1);
    objc_msgSend(v7, "setDuration:", UIAnimationDragCoefficient() * 0.23);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAnimation:forKey:", v6, CFSTR("bounce"));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAnimation:forKey:", v7, CFSTR("center"));

  }
}

void __125__UIPopoverController__presentPopoverFromRect_embeddedInView_usingViewForLayoutConstraints_permittedArrowDirections_animate___block_invoke_79(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_setPresentationState:", 2);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "popoverController:animationCompleted:", *(_QWORD *)(a1 + 32), 0);

}

- (void)_presentPopoverFromRect:(CGRect)a3 embeddedInView:(id)a4 usingViewForLayoutConstraints:(id)a5 permittedArrowDirections:(unint64_t)a6
{
  -[UIPopoverController _presentPopoverFromRect:embeddedInView:usingViewForLayoutConstraints:permittedArrowDirections:animate:](self, "_presentPopoverFromRect:embeddedInView:usingViewForLayoutConstraints:permittedArrowDirections:animate:", a4, a5, a6, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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

- (BOOL)_shimPresentSlidingPopoverAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *vendedGestureRecognizer;
  void *v6;
  void *v7;
  unint64_t presentationEdge;
  BOOL v9;

  v3 = a3;
  -[UIPopoverController _managingSplitViewController](self, "_managingSplitViewController");
  vendedGestureRecognizer = (void *)objc_claimAutoreleasedReturnValue();
  v6 = vendedGestureRecognizer;
  if (vendedGestureRecognizer && self->_popoverControllerStyle == 1)
  {
    if (self->_vendedGestureRecognizer)
      vendedGestureRecognizer = self->_vendedGestureRecognizer;
    objc_msgSend(vendedGestureRecognizer, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_vendedGestureRecognizer)
      presentationEdge = self->_presentationEdge;
    else
      presentationEdge = 2;
    -[UIPopoverController _presentPopoverFromEdge:ofView:animated:](self, "_presentPopoverFromEdge:ofView:animated:", presentationEdge, v7, v3);

    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_commonPresentPopoverFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  _UIPopoverLayoutInfo *preferredLayoutInfo;
  void *v28;
  unint64_t v29;
  BOOL v30;
  id v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  objc_class *popoverBackgroundViewClass;
  _UIPopoverLayoutInfo *v37;
  _UIPopoverLayoutInfo *v38;
  _UIPopoverLayoutInfo *v39;
  id v40;
  void *v41;
  id v42;
  UIPopoverController *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  UIView *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  _QWORD v58[7];
  _QWORD aBlock[4];
  id v60;
  UIPopoverController *v61;
  _QWORD *v62;
  _QWORD v63[5];
  UIPopoverController *v64;
  _QWORD v65[5];
  _UIPopoverView *v66;
  _QWORD v67[5];
  id v68;
  objc_class *v69;
  _QWORD v70[5];
  id v71;
  objc_class *v72;
  unint64_t v73;
  _QWORD v74[5];
  id v75;
  BOOL v76;
  _QWORD block[6];
  const __CFString *v78;
  _QWORD v79[3];

  v6 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v79[1] = *MEMORY[0x1E0C80C00];
  v15 = a4;
  if (-[UIPopoverController _shimPresentSlidingPopoverAnimated:](self, "_shimPresentSlidingPopoverAnimated:", v6))
    goto LABEL_34;
  v54 = v15;
  if (self->_popoverControllerStyle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPopoverController.m"), 1039, CFSTR("This method is only supported for fading popovers"));

  }
  if (a5 == -1)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    _NSFullMethodName();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: Popovers cannot be presented with UIPopoverArrowDirectionUnknown."), v17);

  }
  objc_msgSend(v15, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_10;
    v19 = (void *)MEMORY[0x1E0C99DA0];
    _NSFullMethodName();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: Popovers cannot be presented from a view which does not have a window."), v18);
  }

LABEL_10:
  if (!-[UIPopoverController isPresentingOrDismissing](self, "isPresentingOrDismissing"))
  {
    if (width < 1.0 || height < 1.0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke;
      block[3] = &unk_1E16B1888;
      block[4] = self;
      block[5] = a2;
      if (_commonPresentPopoverFromRect_inView_permittedArrowDirections_animated__onceToken != -1)
        dispatch_once(&_commonPresentPopoverFromRect_inView_permittedArrowDirections_animated__onceToken, block);
      if (width < 2.0)
        width = 2.0;
      if (height < 2.0)
        height = 2.0;
    }
    objc_storeStrong((id *)&self->_currentPresentationView, a4);
    self->_currentPresentationRectInView.origin.x = x;
    self->_currentPresentationRectInView.origin.y = y;
    self->_currentPresentationRectInView.size.width = width;
    self->_currentPresentationRectInView.size.height = height;
    self->_originalArrowDirections = a5;
    -[UIPopoverController _setPresentationState:](self, "_setPresentationState:", 1);
    self->_requestedArrowDirections = a5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v15;
    }
    else
    {
      objc_msgSend(v15, "window");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v20;
    if (objc_msgSend(v20, "_isTextEffectsWindow"))
      *(_BYTE *)&self->_popoverControllerFlags |= 8u;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "postNotificationName:object:userInfo:", CFSTR("_UIAlertWillAppearNotification"), self, 0);
    v78 = CFSTR("UIPopoverControllerPresentingWindowKey");
    v79[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, &v78, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "postNotificationName:object:userInfo:", CFSTR("UIPopoverControllerWillPresentPopoverNotification"), self, v22);

    if (self->_popoverView)
    {
      -[UIPopoverController _layoutDimmingViewForInterfaceOrientationOfHostingWindow:](self, "_layoutDimmingViewForInterfaceOrientationOfHostingWindow:", v21);
      objc_msgSend(v15, "convertRect:toView:", self->_dimmingView, x, y, width, height);
      self->_targetRectInDimmingView.origin.x = v23;
      self->_targetRectInDimmingView.size.height = v24;
      self->_targetRectInDimmingView.origin.y = v25;
      self->_targetRectInDimmingView.size.width = v26;
      preferredLayoutInfo = self->_preferredLayoutInfo;
      -[UIView bounds](self->_dimmingView, "bounds");
      -[_UIPopoverLayoutInfo setContainingFrame:](preferredLayoutInfo, "setContainingFrame:");
      -[_UIPopoverLayoutInfo setSourceViewRect:](self->_preferredLayoutInfo, "setSourceViewRect:", self->_targetRectInDimmingView.origin.x, self->_targetRectInDimmingView.origin.y, self->_targetRectInDimmingView.size.width, self->_targetRectInDimmingView.size.height);
      -[_UIPopoverLayoutInfo setPreferredArrowDirections:](self->_preferredLayoutInfo, "setPreferredArrowDirections:", a5);
      -[UIPopoverController _layoutInfoForCurrentKeyboardState](self, "_layoutInfoForCurrentKeyboardState");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPopoverLayoutInfo setPreferredArrowDirections:](self->_preferredLayoutInfo, "setPreferredArrowDirections:", objc_msgSend(v28, "arrowDirection"));
      v29 = -[_UIPopoverView arrowDirection](self->_popoverView, "arrowDirection");
      v30 = v29 != objc_msgSend(v28, "arrowDirection");
      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_2;
      v74[3] = &unk_1E16B4008;
      v76 = v30;
      v74[4] = self;
      v75 = v28;
      v31 = v28;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v74);
      -[UIPopoverController _setPresentationState:](self, "_setPresentationState:", 2);

    }
    else
    {
      if (self->_retainsSelfWhilePresented)
        objc_storeStrong((id *)&self->_retainedSelf, self);
      -[UIPopoverController _layoutDimmingViewForInterfaceOrientationOfHostingWindow:](self, "_layoutDimmingViewForInterfaceOrientationOfHostingWindow:", v21);
      objc_msgSend(v21, "addSubview:", self->_dimmingView);
      objc_msgSend(v15, "convertRect:toView:", self->_dimmingView, x, y, width, height);
      self->_targetRectInDimmingView.origin.x = v32;
      self->_targetRectInDimmingView.origin.y = v33;
      self->_targetRectInDimmingView.size.width = v34;
      self->_targetRectInDimmingView.size.height = v35;
      popoverBackgroundViewClass = self->_popoverBackgroundViewClass;
      if (!popoverBackgroundViewClass)
        popoverBackgroundViewClass = -[UIPopoverController _defaultChromeViewClass](self, "_defaultChromeViewClass");
      v37 = (_UIPopoverLayoutInfo *)objc_alloc_init(-[UIPopoverController _popoverLayoutInfoForChromeClass:](self, "_popoverLayoutInfoForChromeClass:", popoverBackgroundViewClass));
      v38 = self->_preferredLayoutInfo;
      self->_preferredLayoutInfo = v37;

      v39 = self->_preferredLayoutInfo;
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_3;
      v70[3] = &unk_1E16C1080;
      v70[4] = self;
      v72 = popoverBackgroundViewClass;
      v73 = a5;
      v40 = v21;
      v71 = v40;
      -[_UIPopoverLayoutInfo updateProperties:](v39, "updateProperties:", v70);
      -[UIPopoverController _layoutInfoForCurrentKeyboardStateAndHostingWindow:](self, "_layoutInfoForCurrentKeyboardStateAndHostingWindow:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPopoverLayoutInfo setPreferredArrowDirections:](self->_preferredLayoutInfo, "setPreferredArrowDirections:", objc_msgSend(v41, "arrowDirection"));
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_4;
      v67[3] = &unk_1E16BF888;
      v67[4] = self;
      v42 = v41;
      v68 = v42;
      v69 = popoverBackgroundViewClass;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v67);
      -[UIPopoverController _transitionFromViewController:toViewController:animated:](self, "_transitionFromViewController:toViewController:animated:", 0, self->_contentViewController, 0);
      -[UIPopoverController _startWatchingForKeyboardNotificationsIfNecessary](self, "_startWatchingForKeyboardNotificationsIfNecessary");
      v65[0] = 0;
      v65[1] = v65;
      v65[2] = 0x3032000000;
      v65[3] = __Block_byref_object_copy__54;
      v65[4] = __Block_byref_object_dispose__54;
      v66 = self->_popoverView;
      v63[0] = 0;
      v63[1] = v63;
      v63[2] = 0x3032000000;
      v63[3] = __Block_byref_object_copy__54;
      v63[4] = __Block_byref_object_dispose__54;
      v43 = self;
      v64 = v43;
      -[UIView setAlpha:](self->_popoverView, "setAlpha:", 0.0);
      -[UIView addSubview:](self->_dimmingView, "addSubview:", self->_popoverView);
      -[UIView layer](self->_popoverView, "layer");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setShouldRasterize:", 0);

      -[UIView layer](self->_popoverView, "layer");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setAllowsGroupOpacity:", 0);

      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_5;
      aBlock[3] = &unk_1E16B9698;
      v62 = v65;
      v60 = v40;
      v61 = v43;
      v46 = _Block_copy(aBlock);
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_6;
      v58[3] = &unk_1E16C10A8;
      v58[4] = v43;
      v58[5] = v65;
      v58[6] = v63;
      v47 = _Block_copy(v58);
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_7;
      v55[3] = &unk_1E16B6740;
      v48 = v46;
      v56 = v48;
      v49 = v47;
      v57 = v49;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v55);

      if (v43->_showsTargetRect)
      {
        v50 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", self->_targetRectInDimmingView.origin.x, self->_targetRectInDimmingView.origin.y, self->_targetRectInDimmingView.size.width, self->_targetRectInDimmingView.size.height);
        +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.5, 0.5);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v50, "setBackgroundColor:", v51);

        -[UIView setTag:](v50, "setTag:", 4277268721);
        -[UIView insertSubview:below:](self->_dimmingView, "insertSubview:below:", v50, self->_popoverView);

      }
      -[UIPopoverController _startWatchingForWindowRotations](v43, "_startWatchingForWindowRotations");
      -[UIPopoverController _startWatchingForScrollViewNotifications](v43, "_startWatchingForScrollViewNotifications");

      _Block_object_dispose(v63, 8);
      _Block_object_dispose(v65, 8);

    }
    v15 = v54;
  }
LABEL_34:

}

void __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke()
{
  id v0;

  _NSFullMethodName();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@: the rect passed in to this method must have non-zero width and height. This will be an exception in a future release."), v0);

}

uint64_t __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
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

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setArrowDirection:", objc_msgSend(*(id *)(a1 + 40), "arrowDirection"));
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(v2, "backgroundView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_contentViewCornerRadiusForArrowDirection:", objc_msgSend(*(id *)(a1 + 40), "arrowDirection"));
    objc_msgSend(v2, "_setCornerRadius:");

    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(*(id *)(a1 + 40), "offset");
    objc_msgSend(v4, "setArrowOffset:");
  }
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 40), "offset");
  return objc_msgSend(v5, "_setFrame:arrowOffset:", v7, v9, v11, v13, v14);
}

void __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  objc_msgSend(*(id *)(a1 + 48), "contentViewInsets");
  objc_msgSend(v2, "setContentInset:");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  objc_msgSend(*(id *)(a1 + 48), "arrowHeight");
  objc_msgSend(v3, "setArrowHeight:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setPreferredContentSize:", *(double *)(*(_QWORD *)(a1 + 32) + 144), *(double *)(*(_QWORD *)(a1 + 32) + 152));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setPreferredArrowDirections:", *(_QWORD *)(a1 + 56));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 128);
  objc_msgSend(*(id *)(v4 + 40), "bounds");
  objc_msgSend(v5, "setContainingFrame:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setContainingFrameInsets:", *(double *)(*(_QWORD *)(a1 + 32) + 448), *(double *)(*(_QWORD *)(a1 + 32) + 456), *(double *)(*(_QWORD *)(a1 + 32) + 464), *(double *)(*(_QWORD *)(a1 + 32) + 472));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setSourceViewRect:", *(double *)(*(_QWORD *)(a1 + 32) + 160), *(double *)(*(_QWORD *)(a1 + 32) + 168), *(double *)(*(_QWORD *)(a1 + 32) + 176), *(double *)(*(_QWORD *)(a1 + 32) + 184));
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  objc_msgSend(v6, "windowScene");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferLandscapeOrientations:", (unint64_t)(objc_msgSend(v8, "interfaceOrientation") - 3) < 0xFFFFFFFFFFFFFFFELL);

}

uint64_t __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_4(id *a1)
{
  id v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_popoverViewClass"));
  objc_msgSend(a1[5], "frame");
  v3 = objc_msgSend(v2, "initWithFrame:backgroundViewClass:", a1[6]);
  v4 = a1[4];
  v5 = (void *)v4[4];
  v4[4] = v3;

  objc_msgSend(*((id *)a1[4] + 4), "setPopoverController:");
  objc_msgSend(*((id *)a1[4] + 4), "setArrowDirection:", objc_msgSend(a1[5], "arrowDirection"));
  v6 = (void *)*((_QWORD *)a1[4] + 4);
  objc_msgSend(a1[5], "offset");
  objc_msgSend(v6, "setArrowOffset:");
  objc_msgSend(*((id *)a1[4] + 4), "setArrowDirection:", objc_msgSend(a1[5], "arrowDirection"));
  v7 = (void *)*((_QWORD *)a1[4] + 4);
  objc_msgSend(a1[6], "_contentViewCornerRadiusForArrowDirection:", objc_msgSend(a1[5], "arrowDirection"));
  objc_msgSend(v7, "_setCornerRadius:");
  objc_msgSend(a1[4], "_setPopoverBackgroundStyle:", *((_QWORD *)a1[4] + 14));
  return objc_msgSend(*((id *)a1[4] + 4), "setPopoverBackgroundColor:", *((_QWORD *)a1[4] + 15));
}

uint64_t __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 32), "_beginOcclusion:", *(_QWORD *)(a1 + 40));
}

void __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldRasterize:", 0);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupOpacity:", 1);

  objc_msgSend(*(id *)(a1 + 32), "_setPresentationState:", 2);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "popoverController:animationCompleted:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0);

}

uint64_t __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_7(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)_shimPopoverPresentationController
{
  int v2;

  if ((*(_BYTE *)&self->_popoverControllerFlags & 0x10) != 0 || self->_popoverControllerStyle == 1)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    v2 = _UIAppUseModernRotationAndPresentationBehaviors();
    if (v2)
      LOBYTE(v2) = objc_msgSend((id)objc_opt_class(), "_useLegacyPopoverControllers") ^ 1;
  }
  return v2;
}

- (void)_setupPresentationController
{
  UIPopoverPresentationController *presentationController;

  if (self->_passthroughViews)
    -[UIPopoverPresentationController setPassthroughViews:](self->_presentationController, "setPassthroughViews:");
  if (self->_backgroundColor)
    -[UIPopoverPresentationController setBackgroundColor:](self->_presentationController, "setBackgroundColor:");
  -[UIPresentationController setDelegate:](self->_presentationController, "setDelegate:", self);
  -[UIPopoverPresentationController setPopoverBackgroundViewClass:](self->_presentationController, "setPopoverBackgroundViewClass:", -[UIPopoverController popoverBackgroundViewClass](self, "popoverBackgroundViewClass"));
  presentationController = self->_presentationController;
  -[UIPopoverController popoverContentSize](self, "popoverContentSize");
  -[UIPopoverPresentationController setPopoverContentSize:animated:](presentationController, "setPopoverContentSize:animated:", 0);
  -[UIPopoverPresentationController setPopoverLayoutMargins:](self->_presentationController, "setPopoverLayoutMargins:", self->_popoverLayoutMargins.top, self->_popoverLayoutMargins.left, self->_popoverLayoutMargins.bottom, self->_popoverLayoutMargins.right);
}

- (void)_presentShimmedPopoverFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;

  v6 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  objc_msgSend(v16, "_viewControllerForAncestor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController setModalPresentationStyle:](self->_contentViewController, "setModalPresentationStyle:", 7);
  -[UIViewController popoverPresentationController](self->_contentViewController, "popoverPresentationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "dismissed") & 1) != 0)
  {
    if (!self->_allowsPopoverPresentationToAdapt)
      objc_msgSend(v14, "setDelegate:", self);
    -[UIPopoverController _setPresentationController:](self, "_setPresentationController:", v14);
    -[UIPresentationController setSourceRect:](self->_presentationController, "setSourceRect:", x, y, width, height);
    -[UIPresentationController setSourceView:](self->_presentationController, "setSourceView:", v16);
    -[UIPopoverPresentationController setPermittedArrowDirections:](self->_presentationController, "setPermittedArrowDirections:", a5);
    -[UIPopoverController _setupPresentationController](self, "_setupPresentationController");
    objc_msgSend(v13, "presentViewController:animated:completion:", self->_contentViewController, v6, 0);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__UIPopoverController__presentShimmedPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke;
    block[3] = &unk_1E16B1B28;
    v15 = v14;
    v18 = v15;
    if (_presentShimmedPopoverFromRect_inView_permittedArrowDirections_animated__once != -1)
    {
      dispatch_once(&_presentShimmedPopoverFromRect_inView_permittedArrowDirections_animated__once, block);
      v15 = v18;
    }

  }
}

void __95__UIPopoverController__presentShimmedPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = _UIPopoverControllerPresentingWindowKey_block_invoke___s_category;
  if (!_UIPopoverControllerPresentingWindowKey_block_invoke___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIPopoverControllerPresentingWindowKey_block_invoke___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Application tried to represent an active popover presentation: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)presentPopoverFromRect:(CGRect)rect inView:(UIView *)view permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  UIView *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  UIView *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIPopoverArrowDirection v23;
  BOOL v24;

  v6 = animated;
  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v13 = view;
  if (-[UIPopoverController _shimPopoverPresentationController](self, "_shimPopoverPresentationController"))
  {
    -[UIView _viewControllerForAncestor](v13, "_viewControllerForAncestor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transitionCoordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      *(_BYTE *)&self->_popoverControllerFlags |= 0x40u;
      objc_msgSend(v14, "transitionCoordinator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __87__UIPopoverController_presentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke;
      v17[3] = &unk_1E16C10F8;
      v17[4] = self;
      v19 = x;
      v20 = y;
      v21 = width;
      v22 = height;
      v18 = v13;
      v23 = arrowDirections;
      v24 = v6;
      objc_msgSend(v16, "animateAlongsideTransition:completion:", 0, v17);

    }
    else
    {
      -[UIPopoverController _presentShimmedPopoverFromRect:inView:permittedArrowDirections:animated:](self, "_presentShimmedPopoverFromRect:inView:permittedArrowDirections:animated:", v13, arrowDirections, v6, x, y, width, height);
    }

  }
  else
  {
    -[UIPopoverController _commonPresentPopoverFromRect:inView:permittedArrowDirections:animated:](self, "_commonPresentPopoverFromRect:inView:permittedArrowDirections:animated:", v13, arrowDirections, v6, x, y, width, height);
  }

}

void __87__UIPopoverController_presentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  char v12;

  v2 = dispatch_time(0, 350000000);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __87__UIPopoverController_presentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_2;
  v7[3] = &unk_1E16C10D0;
  v3 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v7[1] = 3221225472;
  v4 = *(_OWORD *)(a1 + 64);
  v9 = *(_OWORD *)(a1 + 48);
  v10 = v4;
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 80);
  v8 = v5;
  v11 = v6;
  v12 = *(_BYTE *)(a1 + 88);
  dispatch_after(v2, MEMORY[0x1E0C80D38], v7);

}

_BYTE *__87__UIPopoverController_presentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_2(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if ((result[416] & 0x40) != 0)
  {
    result = (_BYTE *)objc_msgSend(result, "_presentShimmedPopoverFromRect:inView:permittedArrowDirections:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), *(unsigned __int8 *)(a1 + 88), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 416) &= ~0x40u;
  }
  return result;
}

- (void)presentPopoverFromBarButtonItem:(UIBarButtonItem *)item permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated
{
  _BOOL8 v5;
  UIBarButtonItem *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  uint64_t v56;
  double v57;
  UIPopoverArrowDirection v58;
  void *v59;
  char v60;
  _BOOL4 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _QWORD v67[3];

  v5 = animated;
  v67[1] = *MEMORY[0x1E0C80C00];
  v9 = item;
  if (!-[UIPopoverController _shimPresentSlidingPopoverAnimated:](self, "_shimPresentSlidingPopoverAnimated:", v5))
  {
    if (-[UIPopoverController _shimPopoverPresentationController](self, "_shimPopoverPresentationController"))
    {
      -[UIBarButtonItem view](v9, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_viewControllerForAncestor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIViewController setModalPresentationStyle:](self->_contentViewController, "setModalPresentationStyle:", 7);
      -[UIViewController popoverPresentationController](self->_contentViewController, "popoverPresentationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPopoverController _setPresentationController:](self, "_setPresentationController:", v12);

      -[UIPresentationController setBarButtonItem:](self->_presentationController, "setBarButtonItem:", v9);
      -[UIPopoverPresentationController setPermittedArrowDirections:](self->_presentationController, "setPermittedArrowDirections:", arrowDirections);
      -[UIPopoverController _setupPresentationController](self, "_setupPresentationController");
      objc_msgSend(v11, "presentViewController:animated:completion:", self->_contentViewController, v5, 0);

    }
    else
    {
      v61 = v5;
      if (arrowDirections == -1)
      {
        v13 = (void *)MEMORY[0x1E0C99DA0];
        v14 = *MEMORY[0x1E0C99778];
        _NSFullMethodName();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "raise:format:", v14, CFSTR("%@: Popovers cannot be presented with UIPopoverArrowDirectionUnknown."), v15);

      }
      -[UIBarButtonItem view](v9, "view");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_8;
      v17 = (void *)v16;
      -[UIBarButtonItem view](v9, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "superview");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
LABEL_8:
        v20 = (void *)MEMORY[0x1E0C99DA0];
        v21 = *MEMORY[0x1E0C99778];
        _NSFullMethodName();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "raise:format:", v21, CFSTR("%@: Popovers cannot be presented from a view which does not have a window."), v22);

      }
      -[UIBarButtonItem view](v9, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bounds");
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;

      v32 = (v31 + -1.0) / 3.0;
      if (v32 > 5.0)
        v32 = 5.0;
      v33 = floor(v32);
      v34 = (v29 + -1.0) / 3.0;
      if (v34 > 5.0)
        v34 = 5.0;
      v35 = floor(v34);
      v36 = v33 + v33;
      v37 = v35 + v35;
      v38 = v35 + v35 + v35;
      v39 = v33 + v33 + v33;
      -[UIBarButtonItem view](v9, "view");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "superview");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "subviews");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem view](v9, "view");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v43;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "arrayByExcludingObjectsInArray:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v45, "count"))
      {
        -[UIPopoverController passthroughViews](self, "passthroughViews");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "count");

        if (v47)
        {
          v60 = arrowDirections;
          -[UIPopoverController passthroughViews](self, "passthroughViews");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = (void *)objc_msgSend(v48, "mutableCopy");

          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v50 = v45;
          v51 = v45;
          v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
          if (v52)
          {
            v53 = v52;
            v54 = *(_QWORD *)v63;
            do
            {
              for (i = 0; i != v53; ++i)
              {
                if (*(_QWORD *)v63 != v54)
                  objc_enumerationMutation(v51);
                v56 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
                if ((objc_msgSend(v49, "containsObject:", v56) & 1) == 0)
                  objc_msgSend(v49, "addObject:", v56);
              }
              v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
            }
            while (v53);
          }

          -[UIPopoverController setPassthroughViews:](self, "setPassthroughViews:", v49);
          LOBYTE(arrowDirections) = v60;
          v45 = v50;
        }
        else
        {
          -[UIPopoverController setPassthroughViews:](self, "setPassthroughViews:", v45);
        }
      }
      v57 = v25 + v37;
      v58 = arrowDirections & 3;
      if (self->_targetBarButtonItem != v9)
        objc_storeStrong((id *)&self->_targetBarButtonItem, item);
      -[UIBarButtonItem view](v9, "view");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](self, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v59, v58, v61, v57, v27 + v36, v29 - v38, v31 - v39);

    }
  }

}

- (void)dismissPopoverAnimated:(BOOL)animated
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v3 = animated;
  *(_BYTE *)&self->_popoverControllerFlags &= ~0x40u;
  if (-[UIPopoverController isPopoverVisible](self, "isPopoverVisible"))
  {
    if (!-[UIPopoverController _shimPopoverPresentationController](self, "_shimPopoverPresentationController")
      || (-[UIPopoverController _presentationController](self, "_presentationController"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "dismissing"),
          v5,
          (v6 & 1) == 0))
    {
      -[UIPopoverController _managingSplitViewController](self, "_managingSplitViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[UIPopoverController _shimPopoverPresentationController](self, "_shimPopoverPresentationController") || v7)
      {
        if (!v7 || (objc_msgSend(v7, "_isRotating") & 1) == 0)
          -[UIPopoverController _dismissPopoverAnimated:stateOnly:notifyDelegate:](self, "_dismissPopoverAnimated:stateOnly:notifyDelegate:", v3, 0, 0);
      }
      else
      {
        objc_storeStrong((id *)&self->_retainedSelf, self);
        -[UIPopoverController _presentationController](self, "_presentationController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "presentingViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __46__UIPopoverController_dismissPopoverAnimated___block_invoke;
        v10[3] = &unk_1E16B1B28;
        v10[4] = self;
        objc_msgSend(v9, "dismissViewControllerAnimated:completion:", v3, v10);

      }
    }
  }
}

void __46__UIPopoverController_dismissPopoverAnimated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 400);
  *(_QWORD *)(v1 + 400) = 0;

}

- (id)popoverView
{
  return self->_popoverView;
}

- (void)_setPopoverView:(id)a3
{
  _UIPopoverView *v5;
  _UIPopoverView *popoverView;
  _UIPopoverView *v7;

  v5 = (_UIPopoverView *)a3;
  popoverView = self->_popoverView;
  if (popoverView != v5)
  {
    v7 = v5;
    -[_UIPopoverView setPopoverController:](popoverView, "setPopoverController:", 0);
    objc_storeStrong((id *)&self->_popoverView, a3);
    -[_UIPopoverView setPopoverController:](self->_popoverView, "setPopoverController:", self);
    v5 = v7;
  }

}

- (void)_setSplitParentController:(id)a3
{
  objc_storeWeak((id *)&self->_splitParentController, a3);
}

- (id)_splitParentController
{
  return objc_loadWeakRetained((id *)&self->_splitParentController);
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

- (void)_updateDimmingViewTransformForInterfaceOrientationOfHostingWindow:(id)a3
{
  id v4;
  uint64_t v5;
  UIDimmingView *dimmingView;
  double v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  v4 = a3;
  if ((objc_msgSend(v4, "_isHostedInAnotherProcess") & 1) == 0
    && !+[UIWindow _transformLayerRotationsAreEnabled](UIWindow, "_transformLayerRotationsAreEnabled"))
  {
    v5 = objc_msgSend(v4, "interfaceOrientation");
    dimmingView = self->_dimmingView;
    switch(v5)
    {
      case 1:
        v7 = 0.0;
        break;
      case 3:
        v7 = 1.57079633;
        break;
      case 4:
        v7 = -1.57079633;
        break;
      default:
        v7 = 3.14159265;
        if (v5 != 2)
          v7 = 0.0;
        break;
    }
    CGAffineTransformMakeRotation(&v8, v7);
    *(float64x2_t *)&v8.a = vrndaq_f64(*(float64x2_t *)&v8.a);
    *(float64x2_t *)&v8.c = vrndaq_f64(*(float64x2_t *)&v8.c);
    *(float64x2_t *)&v8.tx = vrndaq_f64(*(float64x2_t *)&v8.tx);
    v9 = v8;
    -[UIView setTransform:](dimmingView, "setTransform:", &v9, *(_OWORD *)&v8.a, *(_OWORD *)&v8.c, *(_OWORD *)&v8.tx);
  }

}

- (void)_layoutDimmingViewForInterfaceOrientationOfHostingWindow:(id)a3
{
  id v4;
  UIDimmingView *dimmingView;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  -[UIPopoverController _updateDimmingViewTransformForInterfaceOrientationOfHostingWindow:](self, "_updateDimmingViewTransformForInterfaceOrientationOfHostingWindow:", v4);
  dimmingView = self->_dimmingView;
  objc_msgSend(v4, "bounds");
  v7 = v6;
  objc_msgSend(v4, "bounds");
  v9 = v8;

  -[UIView setFrame:](dimmingView, "setFrame:", 0.0, 0.0, v7, v9);
}

- (void)_transitionFromViewController:(id)a3 toViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  _WORD *v10;
  id v11;
  CGFloat v13;
  CGFloat v14;
  _UIPopoverView *popoverView;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id WeakRetained;
  id v22;
  id v23;
  __int16 v24;
  void *v25;
  double height;
  _BOOL4 v27;
  CGFloat v28;
  CGFloat v29;
  uint64_t v30;
  _WORD *v31;
  id v32;
  UIPopoverController *v33;
  BOOL v34;
  _WORD *v35;
  id v36;
  void (**v37)(_QWORD);
  id v38;
  void (**v39)(void *, uint64_t);
  void *v40;
  void *v41;
  SEL v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  _WORD *v48;
  UIPopoverController *v49;
  id v50;
  BOOL v51;
  _QWORD aBlock[4];
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v11 = (id)objc_msgSend(v10, "view");
  if (self->_popoverContentSize.width == *MEMORY[0x1E0C9D820]
    && self->_popoverContentSize.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(v10, "_resolvedPreferredContentSize");
    self->_popoverContentSize.width = v13;
    self->_popoverContentSize.height = v14;
  }
  popoverView = self->_popoverView;
  if (popoverView)
  {
    v44 = v5;
    -[_UIPopoverView contentView](popoverView, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_viewForContentInPopover");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_viewForContentInPopover");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v45 = v17;
    objc_msgSend(v17, "setFrame:");
    -[UIViewController _parentViewController]((id *)v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
LABEL_15:
      objc_msgSend(v10, "_willBecomeContentViewControllerOfPopover:", self);
      objc_msgSend(v9, "_willResignContentViewControllerOfPopover:", self);
      height = self->_popoverContentSize.height;
      v27 = height == 1137.0 || height == 1100.0;
      if (self->_popoverContentSize.width == 320.0 && v27)
      {
        -[UIViewController _resolvedPreferredContentSize](self->_contentViewController, "_resolvedPreferredContentSize");
        self->_popoverContentSize.width = v28;
        self->_popoverContentSize.height = v29;
      }
      v30 = MEMORY[0x1E0C809B0];
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __79__UIPopoverController__transitionFromViewController_toViewController_animated___block_invoke;
      v55[3] = &unk_1E16B1B50;
      v31 = v10;
      v56 = v31;
      v32 = v16;
      v57 = v32;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v55);
      objc_msgSend(v9, "_popoverController");
      v33 = (UIPopoverController *)objc_claimAutoreleasedReturnValue();
      v34 = v33 == self;

      aBlock[0] = v30;
      aBlock[1] = 3221225472;
      aBlock[2] = __79__UIPopoverController__transitionFromViewController_toViewController_animated___block_invoke_2;
      aBlock[3] = &unk_1E16B1B50;
      v35 = v31;
      v53 = v35;
      v36 = v43;
      v54 = v36;
      v37 = (void (**)(_QWORD))_Block_copy(aBlock);
      v46[0] = v30;
      v46[1] = 3221225472;
      v46[2] = __79__UIPopoverController__transitionFromViewController_toViewController_animated___block_invoke_3;
      v46[3] = &unk_1E16BF810;
      v51 = v34;
      v38 = v36;
      v47 = v38;
      v48 = v35;
      v49 = self;
      v50 = v9;
      v39 = (void (**)(void *, uint64_t))_Block_copy(v46);
      if (v44)
      {
        -[UIPopoverController _presentationAnimationDuration](self, "_presentationAnimationDuration");
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v37, v39);
      }
      else
      {
        v37[2](v37);
        v39[2](v39, 1);
      }

      goto LABEL_25;
    }
    objc_msgSend(v10, "_existingView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "window");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_splitParentController);
    if (WeakRetained)
    {
      v22 = objc_loadWeakRetained((id *)&self->_splitParentController);
      -[UIViewController _parentViewController]((id *)v10);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      if (v22 == v23)
      {
        if (!v10)
          goto LABEL_13;
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = a2;
      v40 = v41;
      objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", v42, self, CFSTR("UIPopoverController.m"), 1429, CFSTR("Preexisting parent controller doesn't match parent of incoming view controller"));
    }
    else
    {
      -[UIViewController _parentViewController]((id *)v10);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_splitParentController, v40);
    }

    if (!v10)
    {
LABEL_13:
      if (v20)
      {
        objc_msgSend(v10, "setPerformingModalTransition:", 1);
        objc_msgSend(v10, "_existingView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "removeFromSuperview");

        objc_msgSend(v10, "setPerformingModalTransition:", 0);
      }
      goto LABEL_15;
    }
LABEL_12:
    v24 = v10[188];
    v10[188] = v24 | 0x100;
    objc_msgSend(v10, "setParentViewController:", 0);
    v10[188] = v10[188] & 0xFEFF | v24 & 0x100;
    goto LABEL_13;
  }
LABEL_25:
  -[UIPopoverController _containedViewControllerModalStateChanged](self, "_containedViewControllerModalStateChanged");

}

void __79__UIPopoverController__transitionFromViewController_toViewController_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_viewForContentInPopover");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_viewForContentInPopover");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

}

uint64_t __79__UIPopoverController__transitionFromViewController_toViewController_animated___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_viewForContentInPopover");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __79__UIPopoverController__transitionFromViewController_toViewController_animated___block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "_didBecomeContentViewControllerOfPopover:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 56), "_didResignContentViewControllerOfPopover:", *(_QWORD *)(a1 + 48));
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
  UIPopoverController *v9;
  void (**v10)(_QWORD);
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  UIPopoverController *v17;

  v5 = a5;
  v8 = a3;
  self->_popoverBackgroundStyle = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__54;
  v16 = __Block_byref_object_dispose__54;
  v9 = self;
  v17 = v9;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__UIPopoverController__setContentViewController_backgroundStyle_animated___block_invoke;
  v11[3] = &unk_1E16BF7E8;
  v11[4] = &v12;
  v11[5] = a4;
  v10 = (void (**)(_QWORD))_Block_copy(v11);
  objc_msgSend((id)v13[5], "setContentViewController:animated:", v8, v5);
  if (v5)
  {
    -[UIPopoverController _presentationAnimationDuration](v9, "_presentationAnimationDuration");
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v10, 0);
  }
  else
  {
    v10[2](v10);
  }

  _Block_object_dispose(&v12, 8);
}

uint64_t __74__UIPopoverController__setContentViewController_backgroundStyle_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_setPopoverBackgroundStyle:", *(_QWORD *)(a1 + 40));
}

- (void)_beginMapsTransitionToNewViewController:(id)a3 newTargetRect:(CGRect)a4 inView:(id)a5 arrowDirections:(unint64_t)a6 slideDuration:(double)a7 expandDuration:(double)a8
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  id v17;
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
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  UIView *layoutConstraintView;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  _QWORD v57[5];
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  _QWORD v66[5];
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v16 = a3;
  v17 = a5;
  objc_msgSend(v16, "_resolvedPreferredContentSize");
  v19 = v18;
  v21 = v20;
  self->_targetRectInEmbeddingView.origin.x = x;
  self->_targetRectInEmbeddingView.origin.y = y;
  self->_targetRectInEmbeddingView.size.width = width;
  self->_targetRectInEmbeddingView.size.height = height;
  objc_msgSend(v17, "convertRect:toView:", self->_layoutConstraintView, x, y, width, height);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  -[_UIPopoverView backgroundView](self->_popoverView, "backgroundView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_contentViewCornerRadiusForArrowDirection:", a6);
  v32 = v31;

  v33 = (void *)-[_UIPopoverLayoutInfo copy](self->_preferredLayoutInfo, "copy");
  objc_msgSend(v33, "setPreferredContentSize:", v19, v21);
  objc_msgSend(v33, "setPreferredArrowDirections:", a6);
  objc_msgSend(v33, "setSourceViewRect:", v23, v25, v27, v29);
  -[_UIPopoverView backgroundView](self->_popoverView, "backgroundView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_contentViewInsetsForArrowDirection:", objc_msgSend(v33, "arrowDirection"));
  objc_msgSend(v33, "setContentInset:");

  objc_msgSend(v33, "setPreferredArrowDirections:", objc_msgSend(v33, "arrowDirection"));
  -[UIPopoverController setPreferredLayoutInfo:](self, "setPreferredLayoutInfo:", v33);
  layoutConstraintView = self->_layoutConstraintView;
  objc_msgSend(v33, "frame");
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  -[UIView superview](self->_popoverView, "superview");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertRect:toView:](layoutConstraintView, "convertRect:toView:", v44, v37, v39, v41, v43);
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;

  v53 = MEMORY[0x1E0C809B0];
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke;
  v66[3] = &unk_1E16BE770;
  v66[4] = self;
  v68 = v46;
  v69 = v48;
  v70 = v50;
  v71 = v52;
  v67 = v33;
  v57[0] = v53;
  v57[1] = 3221225472;
  v57[2] = __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke_2;
  v57[3] = &unk_1E16C1148;
  v57[4] = self;
  v58 = v67;
  v59 = v16;
  v60 = v32;
  v61 = v46;
  v62 = v48;
  v63 = v50;
  v64 = v52;
  v65 = a8;
  v54 = v16;
  v55 = v67;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 133, v66, v57, a7, 0.0);

}

void __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_popoverControllerWillBeginMapsTransitionMovingSideways:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "frame");
  v3 = v2;
  v5 = v4;
  v6 = *(double *)(a1 + 48);
  v7 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "arrowHeight");
  v10 = v9;

  v11 = objc_msgSend(*(id *)(a1 + 40), "arrowDirection");
  v12 = v7 - v10;
  v13 = v6 + v10;
  if (v11 == 8)
  {
    v14 = v7 - v10;
  }
  else
  {
    v13 = v6;
    v14 = v7;
  }
  if (v11 == 4)
    v15 = v6;
  else
    v15 = v13;
  if (v11 == 4)
    v16 = v12;
  else
    v16 = v14;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_hideArrow");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setFrame:", v15, v3, v16, v5);

}

void __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_popoverControllerDidFinishMapsTransitionMovingSideways:", *(_QWORD *)(a1 + 32));
  v3 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke_3;
  v15[3] = &unk_1E16C1120;
  v4 = *(void **)(a1 + 40);
  v15[4] = *(_QWORD *)(a1 + 32);
  v16 = v4;
  v18 = *(_QWORD *)(a1 + 56);
  v17 = *(id *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 80);
  v19 = *(_OWORD *)(a1 + 64);
  v20 = v5;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v15);
  block[1] = 3221225472;
  v12 = *(_QWORD *)(a1 + 96);
  v6 = *(_OWORD *)(a1 + 80);
  v13 = *(_OWORD *)(a1 + 64);
  v14 = v6;
  block[0] = v3;
  block[2] = __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke_4;
  block[3] = &unk_1E16BF770;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = WeakRetained;
  v11 = v7;
  v8 = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "arrowDirection");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setArrowDirection:", objc_msgSend(*(id *)(a1 + 40), "arrowDirection"));
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "offset");
  objc_msgSend(v3, "setArrowOffset:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_setCornerRadius:", *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setContentViewController:animated:", *(_QWORD *)(a1 + 48), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "frame");
  v5 = v4;
  v7 = v6;
  v8 = *(double *)(a1 + 64);
  v9 = *(double *)(a1 + 80);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "backgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "arrowHeight");
  v12 = v11;

  if (v2 == 1)
  {
    v5 = v5 + v12;
  }
  else if (v2 != 2)
  {
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setFrame:", v8, v5, v9, v7);
  }
  v7 = v7 - v12;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setFrame:", v8, v5, v9, v7);
}

void __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  double v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(double *)(a1 + 48);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke_5;
  v13[3] = &unk_1E16BE770;
  v4 = *(id *)(a1 + 32);
  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v14 = v4;
  v15 = v5;
  v7 = *(_OWORD *)(a1 + 72);
  v16 = *(_OWORD *)(a1 + 56);
  v17 = v7;
  v10[0] = v2;
  v10[1] = 3221225472;
  v10[2] = __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke_6;
  v10[3] = &unk_1E16B2218;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 40);
  v11 = v8;
  v12 = v9;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 133, v13, v10, v3, 0.0);

}

uint64_t __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke_5(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_popoverControllerWillBeginMapsTransitionExpanding:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "_showArrow");
}

uint64_t __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke_6(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      v3 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(v3 + 16), "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bounds");
      *(_QWORD *)(v3 + 144) = v5;
      *(_QWORD *)(v3 + 152) = v6;

      return objc_msgSend(*(id *)(a1 + 32), "_popoverControllerDidFinishMapsTransitionExpanding:", *(_QWORD *)(a1 + 40));
    }
  }
  return result;
}

- (void)_beginMapsTransitionToNewViewController:(id)a3 arrowDirections:(unint64_t)a4 slideDuration:(double)a5 expandDuration:(double)a6
{
  _UIPopoverView *popoverView;
  id v11;
  id v12;

  popoverView = self->_popoverView;
  v11 = a3;
  -[UIView superview](popoverView, "superview");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPopoverController _beginMapsTransitionToNewViewController:newTargetRect:inView:arrowDirections:slideDuration:expandDuration:](self, "_beginMapsTransitionToNewViewController:newTargetRect:inView:arrowDirections:slideDuration:expandDuration:", v11, v12, a4, self->_embeddedTargetRect.origin.x, self->_embeddedTargetRect.origin.y, self->_embeddedTargetRect.size.width, self->_embeddedTargetRect.size.height, a5, a6);

}

- (id)_completionBlockForDismissalWhenNotifyingDelegate:(BOOL)a3
{
  int v3;
  id WeakRetained;
  char v6;
  void *v7;
  void *v8;
  _QWORD aBlock[4];
  id v11;
  char v12;
  char v13;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (v3)
    LOBYTE(v3) = objc_opt_respondsToSelector();
  v6 = objc_opt_respondsToSelector() & 1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__UIPopoverController__completionBlockForDismissalWhenNotifyingDelegate___block_invoke;
  aBlock[3] = &unk_1E16C1170;
  objc_copyWeak(&v11, &location);
  v12 = v3 & 1;
  v13 = v6;
  v7 = _Block_copy(aBlock);
  v8 = _Block_copy(v7);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v8;
}

void __73__UIPopoverController__completionBlockForDismissalWhenNotifyingDelegate___block_invoke(uint64_t a1)
{
  id *v2;
  _WORD *v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  __int16 v8;
  void *v9;
  void *v10;
  id WeakRetained;

  v2 = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained(v2 + 1);
  v3 = v2[2];
  objc_msgSend(v2, "_splitParentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v2[49];
  if (!v5 || objc_msgSend(v5, "state") != 1 && objc_msgSend(v2[49], "state") != 2)
    objc_msgSend(v2[5], "removeFromSuperview");
  if (v4)
  {
    objc_msgSend(v3, "_popoverController");
    v6 = (id *)objc_claimAutoreleasedReturnValue();

    if (v2 == v6)
    {
      if (v3)
      {
        v8 = v3[188];
        v3[188] = v8 | 0x100;
        objc_msgSend(v3, "setParentViewController:", v4);
        v3[188] = v3[188] & 0xFEFF | v8 & 0x100;
      }
    }
    else
    {
      objc_msgSend(v3, "_popoverController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_setSplitParentController:", v4);

    }
    objc_msgSend(v2, "_managingSplitViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      objc_msgSend(v2, "_setSplitParentController:", 0);
  }
  objc_msgSend(v2[4], "removeFromSuperview");
  objc_msgSend(v3, "_didResignContentViewControllerOfPopover:", v2);
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(WeakRetained, "popoverControllerDidDismissPopover:", v2);
  if (*(_BYTE *)(a1 + 41))
    objc_msgSend(WeakRetained, "popoverController:animationCompleted:", v2, 1);
  objc_msgSend(v2, "_setPresentationState:", 4);
  objc_msgSend(v2, "_setPopoverView:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("_UIAlertDidDisappearNotification"), v2, 0);
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("UIPopoverControllerDidDismissPopoverNotification"), v2, 0);

}

- (void)_postludeForDismissal
{
  void *v3;
  void *v4;
  void *v5;
  UIPopoverController *retainedSelf;

  -[UIPopoverController setPreferredLayoutInfo:](self, "setPreferredLayoutInfo:", 0);
  -[UIPopoverController _stopWatchingForNotifications](self, "_stopWatchingForNotifications");
  if (self->_showsTargetRect)
  {
    -[UIView viewWithTag:](self->_dimmingView, "viewWithTag:", 4277268721);
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
  *(_BYTE *)&self->_popoverControllerFlags &= ~8u;
  if (self->_retainsSelfWhilePresented)
  {
    retainedSelf = self->_retainedSelf;
    self->_retainedSelf = 0;

  }
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  id WeakRetained;
  char v5;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(WeakRetained, "popoverControllerShouldDismissPopover:", self);
  else
    v5 = 1;

  return v5;
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "popoverControllerDidDismissPopover:", self);

}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "popoverController:willRepositionPopoverToRect:inView:", self, a4, a5);

}

- (void)_dismissPopoverAnimated:(BOOL)a3 stateOnly:(BOOL)a4 notifyDelegate:(BOOL)a5
{
  void *v5;
  _BOOL8 v6;
  _BOOL4 v7;
  void *v9;
  UIBarButtonItem *targetBarButtonItem;
  UIView *layoutConstraintView;
  unint64_t presentationEdge;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void (**v22)(_QWORD);
  id v23;
  void (**v24)(void *, uint64_t);
  NSObject *v25;
  unint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  id WeakRetained;
  _QWORD v31[5];
  id v32;
  uint64_t *v33;
  _QWORD aBlock[6];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  _UIPopoverView *v40;
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v6 = a5;
  v7 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  -[UIViewController childModalViewController](self->_contentViewController, "childModalViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[UIViewController dismissViewControllerAnimated:completion:](self->_contentViewController, "dismissViewControllerAnimated:completion:", 0, 0);
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
  if ((!-[UIPopoverController isPresentingOrDismissing](self, "isPresentingOrDismissing")
     || self->_popoverControllerStyle)
    && self->_popoverView)
  {
    if (self->_popoverControllerStyle)
    {
      presentationEdge = self->_presentationEdge;
      WeakRetained = objc_loadWeakRetained((id *)&self->_presentingView);
      -[UIPopoverController _presentPopoverBySlidingIn:fromEdge:ofView:animated:stateOnly:notifyDelegate:](self, "_presentPopoverBySlidingIn:fromEdge:ofView:animated:stateOnly:notifyDelegate:", 0, presentationEdge);

    }
    else
    {
      -[UIPopoverController _setPresentationState:](self, "_setPresentationState:", 3);
      -[_UIPopoverView presentedActionSheet](self->_popoverView, "presentedActionSheet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        objc_msgSend(v13, "dismissWithClickedButtonIndex:animated:", objc_msgSend(v13, "cancelButtonIndex"), 1);
      v35 = 0;
      v36 = &v35;
      v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__54;
      v39 = __Block_byref_object_dispose__54;
      v40 = self->_popoverView;
      -[UIView layer](self->_popoverView, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setShouldRasterize:", 0);

      -[UIView layer](self->_popoverView, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFrozen:", 0);

      -[UIView layer](self->_popoverView, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAllowsGroupOpacity:", 0);

      objc_msgSend((id)v36[5], "window");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_variant_has_internal_diagnostics())
      {
        if (!v18)
        {
          __UIFaultDebugAssertLog();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          {
            v29 = v36[5];
            *(_DWORD *)buf = 138412290;
            v42 = v29;
            _os_log_fault_impl(&dword_185066000, v25, OS_LOG_TYPE_FAULT, "Expected window when dismissing popover view in order to set rasterization scale. Using mainScreen scale instead. popoverView = %@", buf, 0xCu);
          }

        }
      }
      else if (!v18)
      {
        v26 = _dismissPopoverAnimated_stateOnly_notifyDelegate____s_category;
        if (!_dismissPopoverAnimated_stateOnly_notifyDelegate____s_category)
        {
          v26 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v26, (unint64_t *)&_dismissPopoverAnimated_stateOnly_notifyDelegate____s_category);
        }
        v27 = *(NSObject **)(v26 + 8);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = v36[5];
          *(_DWORD *)buf = 138412290;
          v42 = v28;
          _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_ERROR, "Expected window when dismissing popover view in order to set rasterization scale. Using mainScreen scale instead. popoverView = %@", buf, 0xCu);
        }
      }
      -[UIView layer](self->_popoverView, "layer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v18, "screen");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "scale");
      }
      else
      {
        -[UIPopoverController contentViewController](self, "contentViewController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_screen");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "scale");
      }
      objc_msgSend(v19, "setRasterizationScale:");
      if (!v18)

      -[UIViewController _willResignContentViewControllerOfPopover:](self->_contentViewController, "_willResignContentViewControllerOfPopover:", self);
      v21 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __72__UIPopoverController__dismissPopoverAnimated_stateOnly_notifyDelegate___block_invoke;
      aBlock[3] = &unk_1E16BACE0;
      aBlock[4] = self;
      aBlock[5] = &v35;
      v22 = (void (**)(_QWORD))_Block_copy(aBlock);
      objc_storeStrong((id *)&self->_retainedSelf, self);
      -[UIPopoverController _completionBlockForDismissalWhenNotifyingDelegate:](self, "_completionBlockForDismissalWhenNotifyingDelegate:", v6);
      v31[0] = v21;
      v31[1] = 3221225472;
      v31[2] = __72__UIPopoverController__dismissPopoverAnimated_stateOnly_notifyDelegate___block_invoke_2;
      v31[3] = &unk_1E16C1198;
      v33 = &v35;
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v31[4] = self;
      v32 = v23;
      v24 = (void (**)(void *, uint64_t))_Block_copy(v31);
      if (v7)
      {
        -[UIPopoverController _dismissalAnimationDuration](self, "_dismissalAnimationDuration");
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 133, v22, v24);
      }
      else
      {
        v22[2](v22);
        v24[2](v24, 1);
      }
      -[UIPopoverController _postludeForDismissal](self, "_postludeForDismissal");

      _Block_object_dispose(&v35, 8);
    }
  }
}

void __72__UIPopoverController__dismissPopoverAnimated_stateOnly_notifyDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_endOcclusion:", *(_QWORD *)(a1 + 32));

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  +[UIColor clearColor](UIColor, "clearColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

void __72__UIPopoverController__dismissPopoverAnimated_stateOnly_notifyDelegate___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldRasterize:", 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFrozen:", 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsGroupOpacity:", 1);

  (*(void (**)(void))(a1[5] + 16))();
  v5 = a1[4];
  v6 = *(void **)(v5 + 400);
  *(_QWORD *)(v5 + 400) = 0;

}

- (void)dimmingViewWasTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend(WeakRetained, "popoverControllerShouldDismissPopover:", self))
  {
    -[UIPopoverController _dismissPopoverAnimated:stateOnly:notifyDelegate:](self, "_dismissPopoverAnimated:stateOnly:notifyDelegate:", 1, 0, 1);
  }

}

- (BOOL)_allowsFocusBehindDimmingView
{
  return 0;
}

- (id)_gestureRecognizerForPresentationFromEdge:(unint64_t)a3
{
  void *v6;
  UIPanGestureRecognizer *vendedGestureRecognizer;
  UIPanGestureRecognizer *v8;
  UIPanGestureRecognizer *v9;
  UIPanGestureRecognizer *v10;
  UIPanGestureRecognizer *dimmingViewGestureRecognizer;

  if (a3 != 2 && a3 != 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPopoverController.m"), 1841, CFSTR("Only 'UIMinXEdge' and 'UIMaxXEdge' are currently supported"));

  }
  vendedGestureRecognizer = self->_vendedGestureRecognizer;
  if (!vendedGestureRecognizer)
  {
    self->_presentationEdge = a3;
    v8 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__swipe_);
    v9 = self->_vendedGestureRecognizer;
    self->_vendedGestureRecognizer = v8;

    -[UIPanGestureRecognizer setMinimumNumberOfTouches:](self->_vendedGestureRecognizer, "setMinimumNumberOfTouches:", 1);
    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](self->_vendedGestureRecognizer, "setMaximumNumberOfTouches:", 2);
    -[UIPanGestureRecognizer setDelegate:](self->_vendedGestureRecognizer, "setDelegate:", self);
    v10 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__swipe_);
    dimmingViewGestureRecognizer = self->_dimmingViewGestureRecognizer;
    self->_dimmingViewGestureRecognizer = v10;

    -[UIPanGestureRecognizer setMinimumNumberOfTouches:](self->_dimmingViewGestureRecognizer, "setMinimumNumberOfTouches:", 1);
    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](self->_dimmingViewGestureRecognizer, "setMaximumNumberOfTouches:", 2);
    -[UIPanGestureRecognizer setDelegate:](self->_dimmingViewGestureRecognizer, "setDelegate:", self);
    -[UIView addGestureRecognizer:](self->_dimmingView, "addGestureRecognizer:", self->_dimmingViewGestureRecognizer);
    vendedGestureRecognizer = self->_vendedGestureRecognizer;
  }
  return vendedGestureRecognizer;
}

- (BOOL)_gestureRecognizerShouldBegin:(id)a3
{
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *v5;
  UIPanGestureRecognizer *vendedGestureRecognizer;
  BOOL v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  double v15;
  double v16;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;

  v4 = (UIPanGestureRecognizer *)a3;
  v5 = v4;
  vendedGestureRecognizer = self->_vendedGestureRecognizer;
  if (vendedGestureRecognizer == v4 || self->_dimmingViewGestureRecognizer == v4)
  {
    -[UIGestureRecognizer view](v4, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanGestureRecognizer locationInView:](v5, "locationInView:", v8);
    if (vendedGestureRecognizer == v5)
    {
      v15 = v9;
      v16 = v10;
      if (-[UIPopoverController isPopoverVisible](self, "isPopoverVisible"))
        goto LABEL_8;
      -[UIPanGestureRecognizer translationInView:](self->_vendedGestureRecognizer, "translationInView:", v8);
      v19 = v18;
      if ((objc_msgSend(v8, "_shouldReverseLayoutDirection") & 1) == 0 && v19 <= 0.0
        || objc_msgSend(v8, "_shouldReverseLayoutDirection") && v19 >= 0.0)
      {
        v14 = 0;
        goto LABEL_11;
      }
      objc_msgSend(v8, "hitTest:withEvent:", 0, v15, v16);
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
LABEL_8:
        v14 = 1;
LABEL_11:

        v7 = v14 & 1;
        goto LABEL_12;
      }
      v21 = (void *)v20;
      v14 = 1;
      do
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ((objc_msgSend(v21, "isDecelerating") & 1) != 0
           || (self->_presentationEdge & objc_msgSend(v21, "_currentlyAbuttedContentEdges")) == 0))
        {
          v14 = 0;
        }
        objc_msgSend(v21, "superview");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          break;
        v21 = v11;
      }
      while ((v14 & 1) != 0);
    }
    else
    {
      -[UIPanGestureRecognizer locationInView:](v5, "locationInView:", v8);
      objc_msgSend(v8, "hitTest:withEvent:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[UIPopoverController contentViewController](self, "contentViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "isDescendantOfView:", v13) ^ 1;

      }
      else
      {
        v14 = 0;
      }
    }

    goto LABEL_11;
  }
  v7 = 1;
LABEL_12:

  return v7;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  UIPanGestureRecognizer *v6;
  id v7;
  void *v8;
  id v9;
  BOOL v10;
  UIPanGestureRecognizer *v11;
  id v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;
  NSRange v21;
  NSRange v22;

  v6 = (UIPanGestureRecognizer *)a3;
  v7 = a4;
  v8 = v7;
  if ((self->_vendedGestureRecognizer == v6 || self->_dimmingViewGestureRecognizer == v6)
    && objc_msgSend(v7, "_isGestureType:", 8))
  {
    v9 = v8;
    if (objc_msgSend(v9, "_failsPastHysteresisWithoutMinTouches"))
    {
      v10 = (unint64_t)objc_msgSend(v9, "minimumNumberOfTouches") < 2;
    }
    else
    {
      v11 = v6;
      v12 = v9;
      v13 = -[UIPanGestureRecognizer minimumNumberOfTouches](v11, "minimumNumberOfTouches");
      v14 = -[UIPanGestureRecognizer maximumNumberOfTouches](v11, "maximumNumberOfTouches");
      v15 = -[UIPanGestureRecognizer minimumNumberOfTouches](v11, "minimumNumberOfTouches");

      v16 = v14 - v15 + 1;
      v17 = objc_msgSend(v12, "minimumNumberOfTouches");
      v18 = objc_msgSend(v12, "maximumNumberOfTouches");
      v19 = objc_msgSend(v12, "minimumNumberOfTouches");

      v22.length = v18 - v19 + 1;
      v21.location = v13;
      v21.length = v16;
      v22.location = v17;
      v10 = NSIntersectionRange(v21, v22).length != 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  UIPanGestureRecognizer *v6;
  id v7;
  void *v8;
  UIPanGestureRecognizer *vendedGestureRecognizer;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  char v18;
  BOOL v19;
  BOOL v20;
  id v21;

  v6 = (UIPanGestureRecognizer *)a3;
  v7 = a4;
  v8 = v7;
  vendedGestureRecognizer = self->_vendedGestureRecognizer;
  if (vendedGestureRecognizer == v6 || self->_dimmingViewGestureRecognizer == v6)
  {
    if ((objc_msgSend(v7, "_isGestureType:", 10) & 1) != 0)
    {
      -[UIGestureRecognizer view](v6, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "convertPoint:toView:", v11, 10.0, 10.0);
      v13 = v12;

      -[UIGestureRecognizer view](v6, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "convertPoint:toView:", v15, 20.0, 10.0);
      v17 = v16;

      v18 = objc_msgSend(v8, "direction");
      v19 = v13 - v17 < 0.0;
      if (v13 - v17 > 0.0)
        v19 = 1;
      v20 = v18 & v19;
      goto LABEL_16;
    }
    vendedGestureRecognizer = self->_vendedGestureRecognizer;
  }
  if ((vendedGestureRecognizer == v6 || self->_dimmingViewGestureRecognizer == v6)
    && objc_msgSend(v8, "_isGestureType:", 8))
  {
    v21 = v8;
    if (objc_msgSend(v21, "_failsPastHysteresisWithoutMinTouches"))
      v20 = (unint64_t)objc_msgSend(v21, "minimumNumberOfTouches") > 1;
    else
      v20 = 0;

  }
  else
  {
    v20 = 0;
  }
LABEL_16:

  return v20;
}

- (void)_swipe:(id)a3
{
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *v5;
  void *v6;
  UIPanGestureRecognizer *v7;
  double v8;
  double v9;
  int64_t presentationDirection;
  void *v11;
  uint64_t v12;
  int64_t v13;
  _BOOL4 v14;
  int v15;
  uint64_t v16;
  BOOL v17;
  double v18;
  unint64_t presentationEdge;
  void *v20;
  UIPanGestureRecognizer *v21;

  v4 = (UIPanGestureRecognizer *)a3;
  v5 = v4;
  if (self->_vendedGestureRecognizer == v4 || self->_dimmingViewGestureRecognizer == v4)
  {
    v21 = v4;
    if (-[UIGestureRecognizer state](v4, "state") == UIGestureRecognizerStateBegan
      || -[UIGestureRecognizer state](v21, "state") == UIGestureRecognizerStateChanged)
    {
      -[UIGestureRecognizer view](v21, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v21;
      -[UIPanGestureRecognizer velocityInView:](v7, "velocityInView:", v6);
      v9 = v8;
      if (v8 >= 0.0)
        presentationDirection = 0;
      else
        presentationDirection = -1;
      if (v8 > 0.0)
        presentationDirection = 1;
      if (presentationDirection != self->_presentationDirection)
      {
        self->_presentationDirection = presentationDirection;
        if (!presentationDirection)
        {
LABEL_42:

          goto LABEL_43;
        }
        -[UIPanGestureRecognizer setTranslation:inView:](v7, "setTranslation:inView:", v6, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
        presentationDirection = self->_presentationDirection;
      }
      if (presentationDirection)
      {
        -[UIPopoverController _dimmingView](self, "_dimmingView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "_shouldReverseLayoutDirection") ? -1 : 1;

        v13 = self->_presentationDirection;
        v14 = -[UIPopoverController isPopoverVisible](self, "isPopoverVisible");
        if (v13 == v12)
          v15 = !v14 || -[UIPopoverController _isDismissing](self, "_isDismissing");
        else
          v15 = v14 && !-[UIPopoverController _isDismissing](self, "_isDismissing");
        if (v9 != 0.0)
        {
          -[UIPanGestureRecognizer translationInView:](v7, "translationInView:", v6);
          if (v9 <= 0.0)
            v18 = -v18;
          if (v18 >= 40.0)
          {
            if (v15)
            {
              if (-[UIPopoverController isPopoverVisible](self, "isPopoverVisible")
                && !-[UIPopoverController _isDismissing](self, "_isDismissing"))
              {
                -[UIPopoverController dismissPopoverAnimated:](self, "dismissPopoverAnimated:", 1);
              }
              else
              {
                presentationEdge = self->_presentationEdge;
                -[UIGestureRecognizer view](self->_vendedGestureRecognizer, "view");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[UIPopoverController _presentPopoverFromEdge:ofView:animated:](self, "_presentPopoverFromEdge:ofView:animated:", presentationEdge, v20, 1);

                self->_didPresentInActiveSequence = 1;
              }
            }
            else if (self->_dimmingViewGestureRecognizer == v7
                   && !self->_didPresentInActiveSequence
                   && -[UIPopoverController isPopoverVisible](self, "isPopoverVisible")
                   && !-[UIPopoverController isPresentingOrDismissing](self, "isPresentingOrDismissing"))
            {
              self->_didPresentInActiveSequence = 1;
            }
          }
        }
      }
      goto LABEL_42;
    }
    if (-[UIGestureRecognizer state](v21, "state") == UIGestureRecognizerStateEnded
      || (v16 = -[UIGestureRecognizer state](v21, "state"), v5 = v21, v16 == 4))
    {
      self->_presentationDirection = 0;
      self->_didPresentInActiveSequence = 0;
      v17 = -[UIPopoverController isPopoverVisible](self, "isPopoverVisible");
      v5 = v21;
      if (!v17)
      {
        -[UIView removeFromSuperview](self->_dimmingView, "removeFromSuperview");
LABEL_43:
        v5 = v21;
      }
    }
  }

}

- (void)_setGesturesEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UIGestureRecognizer setEnabled:](self->_vendedGestureRecognizer, "setEnabled:");
  -[UIGestureRecognizer setEnabled:](self->_dimmingViewGestureRecognizer, "setEnabled:", v3);
}

- (void)_adjustPopoverForNewContentSizeFromViewController:(id)a3 allowShrink:(BOOL)a4
{
  -[UIViewController _resolvedPreferredContentSize](self->_contentViewController, "_resolvedPreferredContentSize", a3);
  -[UIPopoverController setPopoverContentSize:animated:](self, "setPopoverContentSize:animated:", 1);
  -[UIPopoverController _containedViewControllerModalStateChanged](self, "_containedViewControllerModalStateChanged");
}

- (void)_newViewControllerWasPushed:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[UIPopoverController isPopoverVisible](self, "isPopoverVisible"))
  {
    objc_msgSend(v6, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", 0x1E1712800);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIPopoverController _adjustPopoverForNewContentSizeFromViewController:allowShrink:](self, "_adjustPopoverForNewContentSizeFromViewController:allowShrink:", v5, 0);
  }

}

- (void)_startWatchingForNavigationControllerNotifications:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__newViewControllerWasPushed_, 0x1E17127A0, v5);

}

- (void)_stopWatchingForNavigationControllerNotifications:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, 0x1E17127A0, v5);

}

+ (BOOL)_forceAttemptsToAvoidKeyboard
{
  if (qword_1ECD7D470 != -1)
    dispatch_once(&qword_1ECD7D470, &__block_literal_global_114);
  return byte_1ECD7D461;
}

void __52__UIPopoverController__forceAttemptsToAvoidKeyboard__block_invoke()
{
  void *v0;
  id v1;

  _UIKitPreferencesOnce();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("UIPopoverControllerForceAttemptsToAvoidKeyboard"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  byte_1ECD7D461 = objc_msgSend(v0, "BOOLValue");

}

- (BOOL)_attemptsToAvoidKeyboard
{
  if (self->_ignoresKeyboardNotifications)
    return 0;
  if (self->_popoverControllerStyle && (*(_BYTE *)&self->_popoverControllerFlags & 0x10) != 0)
    return objc_msgSend((id)objc_opt_class(), "_forceAttemptsToAvoidKeyboard");
  return 1;
}

- (id)_layoutInfoFromLayoutInfo:(id)a3 forCurrentKeyboardStateAndHostingWindow:(id)a4
{
  id v6;
  id v7;
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
  int v19;
  void *v20;
  char v21;
  UIDimmingView *dimmingView;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double top;
  double left;
  double right;
  CGFloat v38;
  UIDimmingView *v39;
  id v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
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
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  _OWORD v66[3];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  v6 = a3;
  v7 = a4;
  if (!-[UIPopoverController _attemptsToAvoidKeyboard](self, "_attemptsToAvoidKeyboard"))
    goto LABEL_12;
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyboardSceneDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "visibleFrameInView:", 0);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v70.origin.x = v11;
  v70.origin.y = v13;
  v70.size.width = v15;
  v70.size.height = v17;
  if (CGRectIsEmpty(v70))
    goto LABEL_12;
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isDescendantOfView:", self->_popoverView);

  if (v19
    || (*(_BYTE *)&self->_popoverControllerFlags & 8) != 0
    || objc_msgSend((id)UIApp, "_isSpringBoard")
    && (+[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient"), v20 = (void *)objc_claimAutoreleasedReturnValue(), v21 = objc_msgSend(v20, "keyboardActive"), v20, (v21 & 1) == 0))
  {
LABEL_12:
    v40 = v6;
  }
  else
  {
    v68 = 0u;
    v69 = 0u;
    v67 = 0u;
    dimmingView = self->_dimmingView;
    if (dimmingView)
      -[UIView transform](dimmingView, "transform");
    -[UIPopoverController _updateDimmingViewTransformForInterfaceOrientationOfHostingWindow:](self, "_updateDimmingViewTransformForInterfaceOrientationOfHostingWindow:", v7);
    objc_msgSend(v7, "convertRect:fromWindow:", 0, v11, v13, v15, v17);
    objc_msgSend(v7, "convertRect:toView:", self->_dimmingView);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[UIView frame](self->_dimmingView, "frame");
    v77.origin.x = v31;
    v77.origin.y = v32;
    v77.size.width = v33;
    v77.size.height = v34;
    v71.origin.x = v24;
    v71.origin.y = v26;
    v71.size.width = v28;
    v71.size.height = v30;
    v72 = CGRectIntersection(v71, v77);
    top = self->_popoverLayoutMargins.top;
    left = self->_popoverLayoutMargins.left;
    right = self->_popoverLayoutMargins.right;
    v38 = v72.size.height + self->_popoverLayoutMargins.bottom;
    v39 = self->_dimmingView;
    v66[0] = v67;
    v66[1] = v68;
    v66[2] = v69;
    -[UIView setTransform:](v39, "setTransform:", v66);
    v40 = (id)objc_msgSend(v6, "copy");
    objc_msgSend(v40, "setContainingFrameInsets:", top, left, v38, right);
    objc_msgSend(v40, "sourceViewRect");
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v48 = v47;
    objc_msgSend(v40, "containingFrame");
    v50 = v49;
    v52 = v51;
    v54 = v53;
    v56 = v55;
    objc_msgSend(v40, "containingFrameInsets");
    v58 = v50 + v57;
    v60 = v52 + v59;
    v62 = v54 - (v57 + v61);
    v64 = v56 - (v59 + v63);
    v73.origin.x = v58;
    v73.origin.y = v60;
    v73.size.width = v62;
    v73.size.height = v64;
    v78.origin.x = v42;
    v78.origin.y = v44;
    v78.size.width = v46;
    v78.size.height = v48;
    v74 = CGRectIntersection(v73, v78);
    if (CGRectIsEmpty(v74))
    {
      v75.origin.x = v58;
      v75.origin.y = v60;
      v75.size.width = v62;
      v75.size.height = v64;
      if (CGRectGetMaxY(v75) < v44)
      {
        v76.origin.x = v58;
        v76.origin.y = v60;
        v76.size.width = v62;
        v76.size.height = v64;
        objc_msgSend(v40, "setSourceViewRect:", v42, CGRectGetMaxY(v76), v46, 1.0);
      }
    }
  }

  return v40;
}

- (id)_layoutInfoForCurrentKeyboardStateAndHostingWindow:(id)a3
{
  return -[UIPopoverController _layoutInfoFromLayoutInfo:forCurrentKeyboardStateAndHostingWindow:](self, "_layoutInfoFromLayoutInfo:forCurrentKeyboardStateAndHostingWindow:", self->_preferredLayoutInfo, a3);
}

- (id)_layoutInfoForCurrentKeyboardState
{
  void *v3;
  void *v4;

  -[UIView window](self->_popoverView, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPopoverController _layoutInfoForCurrentKeyboardStateAndHostingWindow:](self, "_layoutInfoForCurrentKeyboardStateAndHostingWindow:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_moveAwayFromTheKeyboard:(id)a3
{
  _UIPopoverView *popoverView;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void (**v10)(void *, _QWORD);
  void *v11;
  void *v12;
  _QWORD aBlock[5];
  id v14;
  uint64_t v15;

  popoverView = self->_popoverView;
  v5 = a3;
  -[UIView layoutIfNeeded](popoverView, "layoutIfNeeded");
  -[UIPopoverController _layoutInfoForCurrentKeyboardState](self, "_layoutInfoForCurrentKeyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("UIKeyboardAnimationDurationUserInfoKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v7, "doubleValue");
  else
    v8 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__UIPopoverController__moveAwayFromTheKeyboard___block_invoke;
  aBlock[3] = &unk_1E16BF838;
  v15 = v8;
  aBlock[4] = self;
  v14 = v6;
  v9 = v6;
  v10 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  -[UIPopoverController contentViewController](self, "contentViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transitionCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (objc_msgSend(v12, "isInteractive"))
      objc_msgSend(v12, "notifyWhenInteractionEndsUsingBlock:", v10);
    else
      objc_msgSend(v12, "animateAlongsideTransition:completion:", 0, v10);
  }
  else
  {
    v10[2](v10, 0);
  }

}

void __48__UIPopoverController__moveAwayFromTheKeyboard___block_invoke(double *a1)
{
  double v1;
  void *v2;
  _QWORD v3[5];
  id v4;

  v1 = a1[6];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__UIPopoverController__moveAwayFromTheKeyboard___block_invoke_2;
  v3[3] = &unk_1E16B1B50;
  v2 = (void *)*((_QWORD *)a1 + 5);
  *(double *)&v3[4] = a1[4];
  v4 = v2;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 133, v3, 0, v1, 0.0);

}

uint64_t __48__UIPopoverController__moveAwayFromTheKeyboard___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 40), "offset");
  return objc_msgSend(v2, "_setFrame:arrowOffset:", v4, v6, v8, v10, v11);
}

- (void)_keyboardStateChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "userInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPopoverController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__moveAwayFromTheKeyboard_, v4, 0.0);

}

- (void)_startWatchingForKeyboardNotificationsIfNecessary
{
  id v3;

  if (-[UIPopoverController _attemptsToAvoidKeyboard](self, "_attemptsToAvoidKeyboard"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardStateChanged_, CFSTR("UIKeyboardWillShowNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardStateChanged_, CFSTR("UIKeyboardDidHideNotification"), 0);

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

- (BOOL)_canRepresentAutomatically
{
  UIBarButtonItem *targetBarButtonItem;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  targetBarButtonItem = self->_targetBarButtonItem;
  if (!targetBarButtonItem)
    return self->_currentArrowDirection == 0;
  -[UIBarButtonItem view](targetBarButtonItem, "view");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    return self->_currentArrowDirection == 0;
  v5 = (void *)v4;
  -[UIBarButtonItem view](self->_targetBarButtonItem, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7 || self->_currentArrowDirection == 0;
}

- (void)_hostingWindowWillRotate:(id)a3
{
  id v4;
  int64_t popoverControllerStyle;
  id v6;

  v4 = a3;
  popoverControllerStyle = self->_popoverControllerStyle;
  if (popoverControllerStyle == 1)
  {
    v6 = v4;
    -[UIPopoverController _invalidateLayoutInfo](self, "_invalidateLayoutInfo");
LABEL_7:
    v4 = v6;
    goto LABEL_8;
  }
  if (!popoverControllerStyle)
  {
    v6 = v4;
    if (self->_dismissesOnRotation)
      -[UIPopoverController _dismissPopoverAnimated:stateOnly:notifyDelegate:](self, "_dismissPopoverAnimated:stateOnly:notifyDelegate:", 0, 0, 1);
    else
      -[UIView setAlpha:](self->_popoverView, "setAlpha:", 0.0);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_hostingWindowDidRotate:(id)a3
{
  void *v4;
  UIBarButtonItem *targetBarButtonItem;
  id WeakRetained;
  char v7;
  UIView *currentPresentationView;
  CGSize size;
  UIView *v10;
  UIView *v11;
  UIView *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  _UIPopoverLayoutInfo *preferredLayoutInfo;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  UIView *v27;
  CGPoint origin;
  CGSize v29;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPopoverController _layoutDimmingViewForInterfaceOrientationOfHostingWindow:](self, "_layoutDimmingViewForInterfaceOrientationOfHostingWindow:", v4);
  if (-[UIPopoverController _canRepresentAutomatically](self, "_canRepresentAutomatically")
    && (targetBarButtonItem = self->_targetBarButtonItem) != 0)
  {
    -[UIPopoverController presentPopoverFromBarButtonItem:permittedArrowDirections:animated:](self, "presentPopoverFromBarButtonItem:permittedArrowDirections:animated:", targetBarButtonItem, self->_requestedArrowDirections, 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    v7 = objc_opt_respondsToSelector();
    currentPresentationView = self->_currentPresentationView;
    if ((v7 & 1) != 0)
    {
      size = self->_currentPresentationRectInView.size;
      origin = self->_currentPresentationRectInView.origin;
      v29 = size;
      v27 = currentPresentationView;
      v10 = currentPresentationView;
      objc_msgSend(WeakRetained, "popoverController:willRepositionPopoverToRect:inView:", self, &origin, &v27);
      v11 = v27;
      v12 = v27;

      if (v12 != self->_currentPresentationView)
        objc_storeStrong((id *)&self->_currentPresentationView, v11);
      -[UIView convertRect:toView:](v12, "convertRect:toView:", self->_dimmingView, origin, v29);
      self->_targetRectInDimmingView.origin.x = v13;
      self->_targetRectInDimmingView.origin.y = v14;
      self->_targetRectInDimmingView.size.width = v15;
      self->_targetRectInDimmingView.size.height = v16;

    }
    else
    {
      -[UIView window](currentPresentationView, "window");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[UIView convertRect:toView:](self->_currentPresentationView, "convertRect:toView:", self->_dimmingView, self->_currentPresentationRectInView.origin.x, self->_currentPresentationRectInView.origin.y, self->_currentPresentationRectInView.size.width, self->_currentPresentationRectInView.size.height);
        self->_targetRectInDimmingView.origin.x = v18;
        self->_targetRectInDimmingView.origin.y = v19;
        self->_targetRectInDimmingView.size.width = v20;
        self->_targetRectInDimmingView.size.height = v21;
      }
    }
    -[_UIPopoverLayoutInfo setSourceViewRect:](self->_preferredLayoutInfo, "setSourceViewRect:", self->_targetRectInDimmingView.origin.x, self->_targetRectInDimmingView.origin.y, self->_targetRectInDimmingView.size.width, self->_targetRectInDimmingView.size.height);
    if (-[UIPopoverController _attemptsToAvoidKeyboard](self, "_attemptsToAvoidKeyboard"))
    {
      preferredLayoutInfo = self->_preferredLayoutInfo;
      -[UIView bounds](self->_dimmingView, "bounds");
      -[_UIPopoverLayoutInfo setContainingFrame:](preferredLayoutInfo, "setContainingFrame:");
      -[UIPopoverController _layoutInfoForCurrentKeyboardState](self, "_layoutInfoForCurrentKeyboardState");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __47__UIPopoverController__hostingWindowDidRotate___block_invoke;
      v25[3] = &unk_1E16B1B50;
      v25[4] = self;
      v26 = v23;
      v24 = v23;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v25);

    }
  }
  if (!self->_popoverControllerStyle)
    -[UIView setAlpha:](self->_popoverView, "setAlpha:", 1.0);

}

uint64_t __47__UIPopoverController__hostingWindowDidRotate___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 40), "offset");
  return objc_msgSend(v2, "_setFrame:arrowOffset:", v4, v6, v8, v10, v11);
}

- (void)_startWatchingForWindowRotations
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView window](self->_popoverView, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__hostingWindowWillRotate_, CFSTR("UIWindowWillRotateNotification"), v3);

  -[UIView window](self->_popoverView, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__hostingWindowDidRotate_, CFSTR("UIWindowDidRotateNotification"), v4);

}

- (void)_stopWatchingForWindowRotations
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIWindowWillRotateNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIWindowDidRotateNotification"), 0);

}

- (void)_scrollViewWillBeginDragging:(id)a3
{
  _UIPopoverView *popoverView;
  void *v5;
  int v6;
  unsigned int draggingChildScrollViewCount;
  char v8;
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
        *(_BYTE *)&self->_popoverControllerFlags = *(_BYTE *)&self->_popoverControllerFlags & 0xFB | v8;
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
        -[UIDimmingView setIgnoresTouches:](self->_dimmingView, "setIgnoresTouches:", (*(_BYTE *)&self->_popoverControllerFlags >> 2) & 1);
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
      -[UIPopoverController _stopWatchingForKeyboardNotifications](self, "_stopWatchingForKeyboardNotifications");
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
    else if (-[UIPopoverController _attemptsToAvoidKeyboard](self, "_attemptsToAvoidKeyboard"))
    {
      -[UIPopoverController _startWatchingForKeyboardNotificationsIfNecessary](self, "_startWatchingForKeyboardNotificationsIfNecessary");
      if (UIKeyboardAutomaticIsOnScreen())
        -[UIPopoverController _moveAwayFromTheKeyboard:](self, "_moveAwayFromTheKeyboard:", 0);
    }
  }
}

- (void)_stopWatchingForNotifications
{
  -[UIPopoverController _stopWatchingForKeyboardNotifications](self, "_stopWatchingForKeyboardNotifications");
  -[UIPopoverController _stopWatchingForScrollViewNotifications](self, "_stopWatchingForScrollViewNotifications");
  -[UIPopoverController _stopWatchingForWindowRotations](self, "_stopWatchingForWindowRotations");
}

- (void)_containedViewControllerModalStateChanged
{
  void *v3;
  uint64_t v4;

  -[UIPopoverController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isModalInPresentation");

  -[UIDimmingView setIgnoresTouches:](self->_dimmingView, "setIgnoresTouches:", v4);
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
  return -[UIPopoverController _isPresenting](self, "_isPresenting")
      || -[UIPopoverController _isDismissing](self, "_isDismissing");
}

- (id)_managingSplitViewController
{
  void *v2;
  void *v3;
  id v4;

  -[UIPopoverController _splitParentController](self, "_splitParentController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

- (BOOL)_embedsInView
{
  return (*(_BYTE *)&self->_popoverControllerFlags >> 4) & 1;
}

- (id)_dimmingView
{
  return self->_dimmingView;
}

- (void)_modalTransition:(int)a3 fromViewController:(id)a4 toViewController:(id)a5 target:(id)a6 didFinish:(int64_t)a7
{
  UIViewController *v11;
  UIViewController *v12;
  unsigned int v13;
  UIViewController *contentViewController;
  UIViewController *v15;
  UIViewController *v16;
  UIViewController *v17;
  UIViewController *v18;
  void *v19;
  void *v20;
  double v21;
  double width;
  double v23;
  double height;
  double v25;
  double v26;
  UIViewController *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  UIViewController *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  BOOL v60;
  BOOL v61;
  BOOL v62;
  id obj;
  id v66;
  UIViewController *v67;
  void *v68;
  void *v69;
  _QWORD v70[5];
  BOOL v71;
  _QWORD v72[4];
  id v73;
  UIPopoverController *v74;
  id v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  double v80;
  double v81;
  double v82;
  uint64_t v83;
  BOOL v84;
  BOOL v85;
  BOOL v86;
  _QWORD v87[5];
  uint64_t v88;
  double *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  double v95;

  v11 = (UIViewController *)a4;
  v66 = a5;
  v12 = (UIViewController *)a5;
  obj = a6;
  v57 = a6;
  v13 = a3 & 0xFFFFFFFE;
  contentViewController = self->_contentViewController;
  v60 = contentViewController == v11;
  v61 = contentViewController == v12;
  v62 = (a3 & 0xFFFFFFFE) == 8;
  if (a3 == 8)
    v15 = v12;
  else
    v15 = v11;
  if (a3 == 8)
    v16 = v11;
  else
    v16 = v12;
  v17 = v15;
  v18 = v16;
  objc_storeStrong((id *)&self->_slidingViewController, v15);
  -[UIViewController view](v18, "view");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](v17, "view");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPopoverController _managingSplitViewController](self, "_managingSplitViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = contentViewController;
  if (v19)
  {
    -[UIPopoverController _managingSplitViewController](self, "_managingSplitViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_contentSizeForChildViewController:inPopoverController:", self->_contentViewController, self);
    width = v21;
    height = v23;

  }
  else
  {
    -[UIViewController _resolvedPreferredContentSize](v12, "_resolvedPreferredContentSize");
    width = v25;
    height = v26;
  }
  v27 = v17;

  if ((*(_BYTE *)&self->_popoverControllerFlags & 0x10) != 0)
  {
    width = self->_popoverContentSize.width;
    height = self->_popoverContentSize.height;
  }
  -[UIViewController view](self->_contentViewController, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](v18, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28 == v29)
  {
    -[UIViewController view](v18, "view", v18, v57);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "superview");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIViewController view](self->_contentViewController, "view", v18, v57);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v59 = objc_msgSend(v30, "autoresizingMask");
  -[UIViewController setPerformingModalTransition:](v11, "setPerformingModalTransition:", 1);
  if (a3 == 8)
  {
    objc_msgSend(v30, "setAutoresizingMask:", 0);
    -[UIPopoverController setPopoverContentSize:animated:](self, "setPopoverContentSize:animated:", v13 == 8, width, height);
    -[UIPopoverController _currentPopoverContentSize](self, "_currentPopoverContentSize");
    width = v32;
    height = v33;
  }
  v34 = v27;
  -[UIViewController view](self->_contentViewController, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "superview");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "frame");
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;

  -[UIViewController view](v27, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  self->_toViewAutoResizingMask = objc_msgSend(v45, "autoresizingMask");

  -[UIViewController view](v27, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setAutoresizingMask:", 0);

  v88 = 0;
  v89 = (double *)&v88;
  v90 = 0x4010000000;
  v92 = 0;
  v93 = 0;
  v91 = &unk_18685B0AF;
  v94 = width;
  v95 = height;
  if (a3 == 8)
  {
    -[UIViewController view](v12, "view");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setFrame:", 0.0, v44, width, height);

    -[UIViewController view](v12, "view");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSubview:", v48);

  }
  else
  {
    objc_msgSend(v30, "bounds");
    objc_msgSend(v68, "setFrame:");
    objc_msgSend(v69, "frame");
    v49 = v89;
    *((_QWORD *)v89 + 6) = v50;
    *((_QWORD *)v49 + 7) = v51;
    *((_QWORD *)v49 + 4) = v52;
    v49[5] = height;
    objc_msgSend(v30, "insertSubview:belowSubview:", v68, v69);
  }
  objc_storeStrong(&self->_target, obj);
  self->_didFinish = a7;
  objc_storeStrong((id *)&self->_modalPresentationFromViewController, a4);
  objc_storeStrong((id *)&self->_modalPresentationToViewController, v66);
  if (v67 != v11)
    -[UIViewController __viewWillDisappear:]((uint64_t)self->_modalPresentationFromViewController, v13 == 8);
  if (v67 != v12)
    -[UIViewController __viewWillAppear:](self->_modalPresentationToViewController, "__viewWillAppear:", v13 == 8);
  if (v13 == 8)
    objc_msgSend((id)UIApp, "beginIgnoringInteractionEvents");
  else
    -[UIPopoverController _modalAnimationFinishedEndIgnoringInteractiveEvents:](self, "_modalAnimationFinishedEndIgnoringInteractiveEvents:", 0);
  v53 = MEMORY[0x1E0C809B0];
  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __93__UIPopoverController__modalTransition_fromViewController_toViewController_target_didFinish___block_invoke;
  v87[3] = &unk_1E16C11C0;
  v87[4] = self;
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __93__UIPopoverController__modalTransition_fromViewController_toViewController_target_didFinish___block_invoke_2;
  v72[3] = &unk_1E16C11E8;
  v54 = v30;
  v77 = v38;
  v78 = v40;
  v79 = v42;
  v80 = v44;
  v84 = v60;
  v73 = v54;
  v74 = self;
  v81 = width;
  v82 = height;
  v85 = v62;
  v86 = v61;
  v76 = &v88;
  v55 = v69;
  v75 = v55;
  v83 = v59;
  v70[0] = v53;
  v70[1] = 3221225472;
  v70[2] = __93__UIPopoverController__modalTransition_fromViewController_toViewController_target_didFinish___block_invoke_3;
  v70[3] = &unk_1E16B7F38;
  v71 = v62;
  v70[4] = self;
  +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", v13 == 8, v87, v72, v70);

  _Block_object_dispose(&v88, 8);
}

void __93__UIPopoverController__modalTransition_fromViewController_toViewController_target_didFinish___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "_presentationAnimationDuration");
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v6, v5);

}

void __93__UIPopoverController__modalTransition_fromViewController_toViewController_target_didFinish___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  if (!*(_BYTE *)(a1 + 120))
  {
    objc_msgSend(*(id *)(a1 + 40), "setPopoverContentSize:animated:", *(unsigned __int8 *)(a1 + 121), *(double *)(a1 + 96), *(double *)(a1 + 104));
    if (!*(_BYTE *)(a1 + 122))
    {
      objc_msgSend(*(id *)(a1 + 40), "popoverContentSize");
      v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      *(_QWORD *)(v2 + 48) = v3;
      *(_QWORD *)(v2 + 56) = v4;
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56));
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(v5 + 328);
  objc_msgSend(*(id *)(v5 + 336), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutoresizingMask:", v6);

  if (*(_BYTE *)(a1 + 120))
    objc_msgSend(*(id *)(a1 + 32), "setAutoresizingMask:", *(_QWORD *)(a1 + 112));
}

uint64_t __93__UIPopoverController__modalTransition_fromViewController_toViewController_target_didFinish___block_invoke_3(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_modalAnimationFinishedEndIgnoringInteractiveEvents:", 1);
  return result;
}

- (void)_modalAnimationFinishedEndIgnoringInteractiveEvents:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int64_t didFinish;
  UIViewController *modalPresentationFromViewController;
  UIModalPresentationStyle v8;
  void *v9;
  id target;
  UIViewController *modalPresentationToViewController;
  UIViewController *v12;
  UIViewController *v13;
  UIViewController *v14;
  UIViewController *v15;
  void (**v16)(id, uint64_t);

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(self->_target, "_completionBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void (**)(id, uint64_t))_Block_copy(v5);

  }
  else
  {
    v16 = 0;
  }
  if (self->_target)
  {
    didFinish = self->_didFinish;
    if (didFinish == 2)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(self->_target, "_didFinishDismissTransition");
    }
    else if (didFinish == 1 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(self->_target, "_didFinishPresentTransition");
    }
  }
  modalPresentationFromViewController = self->_modalPresentationFromViewController;
  if (modalPresentationFromViewController != self->_contentViewController)
  {
    v8 = -[UIViewController modalPresentationStyle](self->_modalPresentationToViewController, "modalPresentationStyle");
    modalPresentationFromViewController = self->_modalPresentationFromViewController;
    if (v8 != 18)
    {
      -[UIViewController view](modalPresentationFromViewController, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeFromSuperview");

      -[UIViewController __viewDidDisappear:]((uint64_t)self->_modalPresentationFromViewController, 1);
      modalPresentationFromViewController = self->_modalPresentationFromViewController;
    }
  }
  -[UIViewController setPerformingModalTransition:](modalPresentationFromViewController, "setPerformingModalTransition:", 0);
  target = self->_target;
  self->_target = 0;

  self->_didFinish = 0;
  modalPresentationToViewController = self->_modalPresentationToViewController;
  if (modalPresentationToViewController != self->_contentViewController)
    -[UIViewController __viewDidAppear:](modalPresentationToViewController, "__viewDidAppear:", 1);
  v12 = self->_modalPresentationFromViewController;
  v13 = self->_modalPresentationToViewController;
  v14 = self->_modalPresentationFromViewController;
  self->_modalPresentationFromViewController = 0;

  v15 = self->_modalPresentationToViewController;
  self->_modalPresentationToViewController = 0;

  if (v3)
    objc_msgSend((id)UIApp, "endIgnoringInteractionEvents");
  if (v16)
    v16[2](v16, 1);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak(&self->_delegate, delegate);
}

- (UIDimmingView)dimmingView
{
  return self->_dimmingView;
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

- (Class)popoverBackgroundViewClass
{
  return self->_popoverBackgroundViewClass;
}

- (void)setPopoverBackgroundViewClass:(Class)popoverBackgroundViewClass
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

- (void)setPopoverArrowDirection:(unint64_t)a3
{
  self->_popoverArrowDirection = a3;
}

- (UIPopoverPresentationController)_presentationController
{
  return self->_presentationController;
}

- (void)_setPresentationController:(id)a3
{
  objc_storeStrong((id *)&self->_presentationController, a3);
}

- (BOOL)_allowsPopoverPresentationToAdapt
{
  return self->_allowsPopoverPresentationToAdapt;
}

- (void)_setAllowsPopoverPresentationToAdapt:(BOOL)a3
{
  self->_allowsPopoverPresentationToAdapt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationController, 0);
  objc_storeStrong((id *)&self->_passthroughViews, 0);
  objc_storeStrong((id *)&self->_retainedSelf, 0);
  objc_storeStrong((id *)&self->_dimmingViewGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_vendedGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_presentingView);
  objc_storeStrong((id *)&self->_slidingViewController, 0);
  objc_storeStrong((id *)&self->_modalPresentationToViewController, 0);
  objc_storeStrong((id *)&self->_modalPresentationFromViewController, 0);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_currentPresentationView, 0);
  objc_storeStrong((id *)&self->_popoverBackgroundViewClass, 0);
  objc_storeStrong((id *)&self->_preferredLayoutInfo, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_targetBarButtonItem, 0);
  objc_storeStrong((id *)&self->_layoutConstraintView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_popoverView, 0);
  objc_destroyWeak((id *)&self->_splitParentController);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_destroyWeak(&self->_delegate);
}

@end
