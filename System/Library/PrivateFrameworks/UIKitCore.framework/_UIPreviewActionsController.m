@implementation _UIPreviewActionsController

- (_UIPreviewActionsController)initWithContainerView:(id)a3 platterView:(id)a4 presentedViewController:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _UIPreviewActionsController *v15;
  _UIPreviewActionsController *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_UIPreviewActionsController;
  v15 = -[_UIPreviewActionsController init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_containerView, a3);
    objc_storeStrong((id *)&v16->_platterView, a4);
    objc_storeStrong((id *)&v16->_presentedViewController, a5);
    objc_storeWeak((id *)&v16->_delegate, v14);
    -[_UIPreviewActionsController _actionsControllerCommonInit](v16, "_actionsControllerCommonInit");
  }

  return v16;
}

- (void)_actionsControllerCommonInit
{
  void *v3;
  void *v4;
  void *v5;
  UIView *v6;
  void *v7;
  void *v8;
  UIImageView *v9;
  void *v10;
  void *v11;

  -[_UIPreviewActionsController currentPreviewActionItems](self, "currentPreviewActionItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewActionsController _makeAndAddToViewHierarchyPreviewActionSheetForMenuItems:](self, "_makeAndAddToViewHierarchyPreviewActionSheetForMenuItems:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewActionsController setPreviewActionsView:](self, "setPreviewActionsView:", v4);

  -[_UIPreviewActionsController previewActionsView](self, "previewActionsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIPreviewActionsController _memoizePreviewActionViews](self, "_memoizePreviewActionViews");
    -[_UIPreviewActionsController _configurePlatterDynamicsController](self, "_configurePlatterDynamicsController");
    v6 = objc_alloc_init(UIView);
    _UIImageWithName(CFSTR("uippc-arrow-up-gray.png"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithRenderingMode:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v8);
    +[UIColor whiteColor](UIColor, "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](v9, "setTintColor:", v10);

    -[UIView addSubview:](v6, "addSubview:", v9);
    -[UIView frame](v9, "frame");
    -[UIView setFrame:](v6, "setFrame:");
    _updateAffordanceFrameOrigin(self->_platterView, v6);
    -[UIView setAlpha:](v6, "setAlpha:", 0.0);
    -[_UIPreviewActionsController setAffordanceImageView:](self, "setAffordanceImageView:", v9);
    -[UIView superview](self->_platterView, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v6);

    -[_UIPreviewActionsController setAffordanceView:](self, "setAffordanceView:", v6);
    if (!-[_UIPreviewActionsController _hasPreviewSwipeActions](self, "_hasPreviewSwipeActions"))
      -[_UIPlatterMenuDynamicsController lockIntoYAxis](self->_platterDynamicsController, "lockIntoYAxis");

  }
  -[_UIPreviewActionsController _configureFeedbackGenerator](self, "_configureFeedbackGenerator");
}

- (void)_configurePlatterDynamicsController
{
  _UIPlatterMenuDynamicsController *v3;
  void *v4;
  void *v5;
  _UIPlatterMenuDynamicsController *v6;
  id v7;

  v3 = [_UIPlatterMenuDynamicsController alloc];
  -[_UIPreviewActionsController containerView](self, "containerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewActionsController platterView](self, "platterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewActionsController previewActionsView](self, "previewActionsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UIPlatterMenuDynamicsController initWithContainerView:platterView:menuView:delegate:](v3, "initWithContainerView:platterView:menuView:delegate:", v7, v4, v5, self);
  -[_UIPreviewActionsController setPlatterDynamicsController:](self, "setPlatterDynamicsController:", v6);

}

- (void)dealloc
{
  objc_super v3;

  -[UIView removeFromSuperview](self->_leadingPreviewActionView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_trailingPreviewActionView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_previewActionsView, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewActionsController;
  -[_UIPreviewActionsController dealloc](&v3, sel_dealloc);
}

+ (id)actionsControllerWithContainerView:(id)a3 platterView:(id)a4 presentedViewController:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContainerView:platterView:presentedViewController:delegate:", v13, v12, v11, v10);

  return v14;
}

- (void)beginPanningAtLocation:(CGPoint)a3
{
  double y;
  double x;

  if (self->_platterDynamicsController)
  {
    y = a3.y;
    x = a3.x;
    -[_UIPreviewActionsController setHasBegun:](self, "setHasBegun:", 1);
    -[_UIPreviewActionsController setTotalPanningTranslation:](self, "setTotalPanningTranslation:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    -[_UIPreviewActionsController setLastPanningLocation:](self, "setLastPanningLocation:", x, y);
    -[_UIPlatterMenuDynamicsController didBeginPanningWithPoint:](self->_platterDynamicsController, "didBeginPanningWithPoint:", x, y);
  }
  -[_UIPreviewActionsController _activateFeedbackIfNeeded](self, "_activateFeedbackIfNeeded", a3.x, a3.y);
}

- (void)updatePanningLocation:(CGPoint)a3
{
  double y;
  double x;
  double width;
  double v7;
  CGFloat v8;
  double height;
  double v10;

  if (self->_platterDynamicsController)
  {
    y = a3.y;
    x = a3.x;
    width = self->_totalPanningTranslation.width;
    -[_UIPreviewActionsController lastPanningLocation](self, "lastPanningLocation");
    v8 = width + vabdd_f64(v7, x);
    height = self->_totalPanningTranslation.height;
    -[_UIPreviewActionsController lastPanningLocation](self, "lastPanningLocation");
    self->_totalPanningTranslation.width = v8;
    self->_totalPanningTranslation.height = height + vabdd_f64(v10, y);
    self->_lastPanningLocation.x = x;
    self->_lastPanningLocation.y = y;
    -[_UIPlatterMenuDynamicsController didPanWithPoint:](self->_platterDynamicsController, "didPanWithPoint:", x, y);
  }
}

- (void)endPanningAtLocation:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[_UIPreviewActionsController _deactivateFeedbackIfNeeded](self, "_deactivateFeedbackIfNeeded");
  if (self->_platterDynamicsController)
  {
    -[_UIPreviewActionsController setHasBegun:](self, "setHasBegun:", 0);
    -[_UIPlatterMenuDynamicsController didEndPanningWithPoint:](self->_platterDynamicsController, "didEndPanningWithPoint:", x, y);
    if (-[_UIPreviewActionsController _hasSelectedSwipeAction](self, "_hasSelectedSwipeAction"))
    {
      -[_UIPreviewActionsController _dismissForSelectedSwipeAction](self, "_dismissForSelectedSwipeAction");
    }
    else if (-[_UIPreviewActionsController _shouldDismiss](self, "_shouldDismiss"))
    {
      -[_UIPreviewActionsController _dismissWithAction:](self, "_dismissWithAction:", 0);
    }
  }
}

- (BOOL)platterPanned
{
  _UIPlatterMenuDynamicsController *platterDynamicsController;

  platterDynamicsController = self->_platterDynamicsController;
  if (platterDynamicsController)
    LOBYTE(platterDynamicsController) = -[_UIPlatterMenuDynamicsController platterPanned](platterDynamicsController, "platterPanned");
  return (char)platterDynamicsController;
}

- (void)dismissPreviewActionsWithCompletion:(id)a3
{
  double v4;
  double v5;
  _BOOL4 v6;
  void (**v8)(void);

  v8 = (void (**)(void))a3;
  -[_UIPreviewActionsController _setAffordanceAlpha:withDuration:hideOnCompletion:](self, "_setAffordanceAlpha:withDuration:hideOnCompletion:", 1, 0.0, 0.1);
  -[_UIPreviewActionsController _hideChromeAndSetAffordanceHidden:](self, "_hideChromeAndSetAffordanceHidden:", 0);
  -[_UIPreviewActionsController _platterOffsetDistance](self, "_platterOffsetDistance");
  v5 = v4;
  v6 = -[_UIPreviewActionsController _isSwipeActionVisible](self, "_isSwipeActionVisible");
  if (v5 <= 44.0 && !v6)
  {
    if (v8)
      v8[2]();
  }
  else
  {
    -[_UIPlatterMenuDynamicsController _animateToPlatterDismissedWithDuration:completion:](self->_platterDynamicsController, "_animateToPlatterDismissedWithDuration:completion:", v8, 0.225);
  }

}

- (CGRect)frameForActionView
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
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[_UIPreviewActionsController previewActionsView](self, "previewActionsView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)_hideChromeAndSetAffordanceHidden:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    -[_UIPreviewActionsController affordanceView](self, "affordanceView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animationForKey:", CFSTR("opacity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[_UIPreviewActionsController affordanceView](self, "affordanceView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", 1);

    }
  }
  -[_UIPreviewActionsController leadingPreviewActionView](self, "leadingPreviewActionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 1);

  -[_UIPreviewActionsController trailingPreviewActionView](self, "trailingPreviewActionView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 1);

}

- (double)_platterOffsetDistance
{
  double v3;
  double v4;
  double v5;

  -[_UIPlatterMenuDynamicsController currentTranslation](self->_platterDynamicsController, "currentTranslation");
  v4 = v3;
  -[_UIPlatterMenuDynamicsController currentTranslation](self->_platterDynamicsController, "currentTranslation");
  return sqrt((v4 - *MEMORY[0x1E0C9D538]) * (v4 - *MEMORY[0x1E0C9D538])+ (v5 - *(double *)(MEMORY[0x1E0C9D538] + 8)) * (v5 - *(double *)(MEMORY[0x1E0C9D538] + 8)));
}

- (id)_makeAndAddToViewHierarchyPreviewActionSheetForMenuItems:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _UIPreviewActionSheetView *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[_UIPreviewActionsController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "maximumPreviewActionsViewSizeForPreviewActionsController:", self);
    v7 = v6;
    v9 = v8;

    v10 = -[_UIPreviewActionSheetView initWithFrame:title:items:contentInsets:]([_UIPreviewActionSheetView alloc], "initWithFrame:title:items:contentInsets:", 0, v4, 0.0, 0.0, v7, v9, 20.0, 0.0, 20.0, 0.0);
    -[_UIPreviewActionsController containerView](self, "containerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v10);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setNeedsLayout](v10, "setNeedsLayout");
    -[UIView layoutIfNeeded](v10, "layoutIfNeeded");
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[UIView setAutoresizingMask:](v10, "setAutoresizingMask:", 0);
    -[_UIPreviewActionsController _centerForMenuDismissedForActionSheet:](self, "_centerForMenuDismissedForActionSheet:", v10);
    -[UIView setCenter:](v10, "setCenter:");
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __88___UIPreviewActionsController__makeAndAddToViewHierarchyPreviewActionSheetForMenuItems___block_invoke;
    v13[3] = &unk_1E16DA868;
    objc_copyWeak(&v14, &location);
    -[_UIPreviewActionSheetView setCompletionHandler:](v10, "setCompletionHandler:", v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSArray)currentPreviewActionItems
{
  NSArray *currentPreviewActionItems;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  currentPreviewActionItems = self->_currentPreviewActionItems;
  if (!currentPreviewActionItems)
  {
    -[_UIPreviewActionsController presentedViewController](self, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previewActionItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count"))
      v6 = (NSArray *)objc_msgSend(v5, "copy");
    else
      v6 = (NSArray *)MEMORY[0x1E0C9AA60];
    v7 = self->_currentPreviewActionItems;
    self->_currentPreviewActionItems = v6;

    currentPreviewActionItems = self->_currentPreviewActionItems;
  }
  return currentPreviewActionItems;
}

- (UIPreviewAction)leadingPreviewAction
{
  UIPreviewAction *leadingPreviewAction;
  _DWORD *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  UIPreviewAction *v9;
  UIPreviewAction *v10;

  leadingPreviewAction = self->_leadingPreviewAction;
  if (!leadingPreviewAction)
  {
    -[_UIPreviewActionsController containerView](self, "containerView");
    v4 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    v5 = v4[30];

    -[_UIPreviewActionsController presentedViewController](self, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 & 0x80000) != 0)
      objc_msgSend(v6, "trailingPreviewAction");
    else
      objc_msgSend(v6, "leadingPreviewAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (UIPreviewAction *)objc_msgSend(v8, "copy");
    v10 = self->_leadingPreviewAction;
    self->_leadingPreviewAction = v9;

    leadingPreviewAction = self->_leadingPreviewAction;
  }
  return leadingPreviewAction;
}

- (UIPreviewAction)trailingPreviewAction
{
  UIPreviewAction *trailingPreviewAction;
  _DWORD *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  UIPreviewAction *v9;
  UIPreviewAction *v10;

  trailingPreviewAction = self->_trailingPreviewAction;
  if (!trailingPreviewAction)
  {
    -[_UIPreviewActionsController containerView](self, "containerView");
    v4 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    v5 = v4[30];

    -[_UIPreviewActionsController presentedViewController](self, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 & 0x80000) != 0)
      objc_msgSend(v6, "leadingPreviewAction");
    else
      objc_msgSend(v6, "trailingPreviewAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (UIPreviewAction *)objc_msgSend(v8, "copy");
    v10 = self->_trailingPreviewAction;
    self->_trailingPreviewAction = v9;

    trailingPreviewAction = self->_trailingPreviewAction;
  }
  return trailingPreviewAction;
}

- (_UIPreviewQuickActionView)leadingPreviewActionView
{
  void *v3;
  _UIPreviewQuickActionView *v4;
  _UIPreviewQuickActionView *v5;
  _UIPreviewQuickActionView *leadingPreviewActionView;
  void *v7;
  void *v8;
  void *v9;
  _UIPreviewQuickActionView *v10;
  void *v11;

  if (!self->_leadingPreviewActionView)
  {
    -[_UIPreviewActionsController leadingPreviewAction](self, "leadingPreviewAction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = [_UIPreviewQuickActionView alloc];
      v5 = -[_UIPreviewQuickActionView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      leadingPreviewActionView = self->_leadingPreviewActionView;
      self->_leadingPreviewActionView = v5;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_leadingPreviewActionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[_UIPreviewActionsController leadingPreviewAction](self, "leadingPreviewAction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPreviewQuickActionView setQuickAction:](self->_leadingPreviewActionView, "setQuickAction:", v7);

      -[UIView layoutIfNeeded](self->_leadingPreviewActionView, "layoutIfNeeded");
      -[_UIPreviewActionsController platterView](self, "platterView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->_leadingPreviewActionView;
      -[_UIPreviewActionsController platterView](self, "platterView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertSubview:belowSubview:", v10, v11);

      -[_UIPreviewActionsController initialCenterForLeadingSwipeActionView](self, "initialCenterForLeadingSwipeActionView");
      -[UIView setCenter:](self->_leadingPreviewActionView, "setCenter:");
      -[UIView setHidden:](self->_leadingPreviewActionView, "setHidden:", 1);
    }
  }
  return self->_leadingPreviewActionView;
}

- (_UIPreviewQuickActionView)trailingPreviewActionView
{
  void *v3;
  _UIPreviewQuickActionView *v4;
  _UIPreviewQuickActionView *v5;
  _UIPreviewQuickActionView *trailingPreviewActionView;
  void *v7;
  void *v8;
  void *v9;
  _UIPreviewQuickActionView *v10;
  void *v11;

  if (!self->_trailingPreviewActionView)
  {
    -[_UIPreviewActionsController trailingPreviewAction](self, "trailingPreviewAction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = [_UIPreviewQuickActionView alloc];
      v5 = -[_UIPreviewQuickActionView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      trailingPreviewActionView = self->_trailingPreviewActionView;
      self->_trailingPreviewActionView = v5;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_trailingPreviewActionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[_UIPreviewActionsController trailingPreviewAction](self, "trailingPreviewAction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPreviewQuickActionView setQuickAction:](self->_trailingPreviewActionView, "setQuickAction:", v7);

      -[UIView layoutIfNeeded](self->_trailingPreviewActionView, "layoutIfNeeded");
      -[_UIPreviewActionsController platterView](self, "platterView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->_trailingPreviewActionView;
      -[_UIPreviewActionsController platterView](self, "platterView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertSubview:belowSubview:", v10, v11);

      -[_UIPreviewActionsController initialCenterForTrailingSwipeActionView](self, "initialCenterForTrailingSwipeActionView");
      -[UIView setCenter:](self->_trailingPreviewActionView, "setCenter:");
      -[UIView setHidden:](self->_trailingPreviewActionView, "setHidden:", 1);
    }
  }
  return self->_trailingPreviewActionView;
}

- (CGRect)_initialPlatterFrame
{
  void *v3;
  double Width;
  void *v5;
  double Height;
  void *v7;
  double MidX;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  -[_UIPreviewActionsController platterView](self, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v15);
  -[_UIPreviewActionsController platterView](self, "platterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  Height = CGRectGetHeight(v16);
  -[_UIPreviewActionsController containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  MidX = CGRectGetMidX(v17);
  -[_UIPreviewActionsController containerView](self, "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v10 = round(CGRectGetMidY(v18) - Height * 0.5);

  v11 = round(MidX - Width * 0.5);
  v12 = v10;
  v13 = Width;
  v14 = Height;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_hasPreviewSwipeActions
{
  void *v3;
  BOOL v4;
  void *v5;

  -[_UIPreviewActionsController leadingPreviewActionView](self, "leadingPreviewActionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[_UIPreviewActionsController trailingPreviewActionView](self, "trailingPreviewActionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)_hasSelectedSwipeAction
{
  void *v3;
  char v4;
  void *v5;

  -[_UIPreviewActionsController leadingPreviewActionView](self, "leadingPreviewActionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "selected") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[_UIPreviewActionsController trailingPreviewActionView](self, "trailingPreviewActionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "selected");

  }
  return v4;
}

- (BOOL)_isSwipeActionVisible
{
  double v2;

  -[_UIPlatterMenuDynamicsController currentTranslation](self->_platterDynamicsController, "currentTranslation");
  return fabs(v2) >= 2.0;
}

- (BOOL)_previewActionsSheetIsVisible
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  BOOL v18;
  CGRect v20;
  CGRect v21;

  -[_UIPreviewActionsController previewActionsView](self, "previewActionsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UIPreviewActionsController previewActionsView](self, "previewActionsView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[_UIPreviewActionsController containerView](self, "containerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v21.origin.x = v14;
    v21.origin.y = v15;
    v21.size.width = v16;
    v21.size.height = v17;
    v20.origin.x = v6;
    v20.origin.y = v8;
    v20.size.width = v10;
    v20.size.height = v12;
    v18 = CGRectIntersectsRect(v20, v21);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (double)_quickActionSelectionOffset
{
  void *v3;
  double Width;
  void *v5;
  double result;
  CGRect v7;
  CGRect v8;

  -[_UIPreviewActionsController leadingPreviewActionView](self, "leadingPreviewActionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v7);

  if (Width <= 2.22044605e-16)
  {
    -[_UIPreviewActionsController trailingPreviewActionView](self, "trailingPreviewActionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    Width = CGRectGetWidth(v8);

  }
  result = 44.0;
  if (Width <= 44.0)
    return Width;
  return result;
}

- (double)_quickActionsSelectionThresholdForPreviewMenuItemStyle:(int64_t)a3
{
  double v4;
  double v5;

  -[_UIPreviewActionsController _quickActionSelectionOffset](self, "_quickActionSelectionOffset");
  v5 = 2.0;
  if (a3 == 2)
    v5 = 3.5;
  return v5 * v4;
}

- (void)_updateSwipeActionsState
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  id v31;

  if (-[_UIPreviewActionsController _hasPreviewSwipeActions](self, "_hasPreviewSwipeActions"))
  {
    -[_UIPreviewActionsController platterDynamicsController](self, "platterDynamicsController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentTranslation");
    v5 = v4;

    -[_UIPreviewActionsController leadingPreviewActionView](self, "leadingPreviewActionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v5 > 0.0);

    -[_UIPreviewActionsController trailingPreviewActionView](self, "trailingPreviewActionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", v5 < 0.0);

    -[_UIPreviewActionsController leadingPreviewActionView](self, "leadingPreviewActionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[_UIPreviewActionsController leadingPreviewActionView](self, "leadingPreviewActionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "quickAction");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPreviewActionsController _quickActionsSelectionThresholdForPreviewMenuItemStyle:](self, "_quickActionsSelectionThresholdForPreviewMenuItemStyle:", objc_msgSend(v10, "style"));
      v12 = v11;

      if (v12 > 0.0)
      {
        -[_UIPreviewActionsController setLeadingSwipeActionViewSelected:](self, "setLeadingSwipeActionViewSelected:", v5 < -v12);
        -[_UIPreviewActionsController leadingPreviewActionView](self, "leadingPreviewActionView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "selected");

        if (v14)
        {
          -[_UIPreviewActionsController trailingPreviewActionView](self, "trailingPreviewActionView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setSelected:", 0);

        }
      }
    }
    -[_UIPreviewActionsController trailingPreviewActionView](self, "trailingPreviewActionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[_UIPreviewActionsController trailingPreviewActionView](self, "trailingPreviewActionView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "quickAction");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPreviewActionsController _quickActionsSelectionThresholdForPreviewMenuItemStyle:](self, "_quickActionsSelectionThresholdForPreviewMenuItemStyle:", objc_msgSend(v18, "style"));
      v20 = v19;

      if (v20 > 0.0)
      {
        -[_UIPreviewActionsController setTrailingSwipeActionViewSelected:](self, "setTrailingSwipeActionViewSelected:", v5 > v20);
        -[_UIPreviewActionsController trailingPreviewActionView](self, "trailingPreviewActionView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "selected");

        if (v22)
        {
          -[_UIPreviewActionsController leadingPreviewActionView](self, "leadingPreviewActionView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setSelected:", 0);

        }
      }
    }
    -[_UIPreviewActionsController trailingPreviewActionView](self, "trailingPreviewActionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "selected");

    if (v25)
    {
      -[_UIPreviewActionsController trailingPreviewActionView](self, "trailingPreviewActionView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setHidden:", 0);

      -[_UIPreviewActionsController leadingPreviewActionView](self, "leadingPreviewActionView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setHidden:", 1);

    }
    -[_UIPreviewActionsController leadingPreviewActionView](self, "leadingPreviewActionView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "selected");

    if (v29)
    {
      -[_UIPreviewActionsController leadingPreviewActionView](self, "leadingPreviewActionView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setHidden:", 0);

      -[_UIPreviewActionsController trailingPreviewActionView](self, "trailingPreviewActionView");
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setHidden:", 1);

    }
  }
}

- (void)_dismissForSelectedSwipeAction
{
  void *v3;
  CGFloat MidX;
  void *v5;
  CGFloat MidY;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  double Width;
  void *v15;
  double v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  _UIPreviewActionsController *v26;
  id v27;
  _QWORD aBlock[5];
  id v29;
  double v30;
  uint64_t v31;
  CGFloat v32;
  CGFloat v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  -[_UIPreviewActionsController _disablePlatterController](self, "_disablePlatterController");
  -[_UIPreviewActionsController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  MidX = CGRectGetMidX(v34);
  -[_UIPreviewActionsController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  MidY = CGRectGetMidY(v35);

  -[_UIPreviewActionsController leadingPreviewActionView](self, "leadingPreviewActionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "selected") & 1) != 0)
    -[_UIPreviewActionsController leadingPreviewActionView](self, "leadingPreviewActionView");
  else
    -[_UIPreviewActionsController trailingPreviewActionView](self, "trailingPreviewActionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIPreviewActionsController centerForPlatterWithMenuViewDismissed](self, "centerForPlatterWithMenuViewDismissed");
  v10 = v9;
  -[_UIPreviewActionsController leadingPreviewActionView](self, "leadingPreviewActionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "selected");

  if (v12)
  {
    -[_UIPreviewActionsController containerView](self, "containerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    Width = CGRectGetWidth(v36);
    -[_UIPreviewActionsController platterView](self, "platterView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v16 = Width + CGRectGetWidth(v37) * 0.5;

  }
  else
  {
    -[_UIPreviewActionsController platterView](self, "platterView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v16 = CGRectGetWidth(v38) * -0.5;
  }

  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61___UIPreviewActionsController__dismissForSelectedSwipeAction__block_invoke;
  aBlock[3] = &unk_1E16BE770;
  aBlock[4] = self;
  v30 = v16;
  v31 = v10;
  v18 = v8;
  v29 = v18;
  v32 = MidX;
  v33 = MidY;
  v19 = _Block_copy(aBlock);
  v22 = v17;
  v23 = 3221225472;
  v24 = __61___UIPreviewActionsController__dismissForSelectedSwipeAction__block_invoke_2;
  v25 = &unk_1E16B2218;
  v26 = self;
  v27 = v18;
  v20 = v18;
  v21 = _Block_copy(&v22);
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v19, v21, 0.3, v22, v23, v24, v25, v26);

}

- (void)_dismissWithAction:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[9];
  CGRect v19;

  v4 = a3;
  if (!v4)
    -[_UIPreviewActionsController _hideChromeAndSetAffordanceHidden:](self, "_hideChromeAndSetAffordanceHidden:", 0);
  -[_UIPreviewActionsController _disablePlatterController](self, "_disablePlatterController");
  -[_UIPreviewActionsController centerForPlatterWithMenuViewDismissed](self, "centerForPlatterWithMenuViewDismissed");
  v7 = v6;
  if (v4)
  {
    -[_UIPreviewActionsController platterView](self, "platterView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v9 = -CGRectGetHeight(v19);

  }
  else
  {
    v9 = v5;
  }
  -[_UIPreviewActionsController centerForMenuDismissed](self, "centerForMenuDismissed");
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50___UIPreviewActionsController__dismissWithAction___block_invoke;
  aBlock[3] = &unk_1E16B20D8;
  aBlock[4] = self;
  aBlock[5] = v7;
  *(double *)&aBlock[6] = v9;
  aBlock[7] = v11;
  aBlock[8] = v12;
  v13 = _Block_copy(aBlock);
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __50___UIPreviewActionsController__dismissWithAction___block_invoke_2;
  v16[3] = &unk_1E16B2218;
  v16[4] = self;
  v17 = v4;
  v14 = v4;
  v15 = _Block_copy(v16);
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v13, v15, 0.3);

}

- (BOOL)_shouldDismiss
{
  BOOL v3;
  BOOL v4;
  void *v5;
  double v6;
  double v7;

  v3 = -[_UIPreviewActionsController _previewActionsSheetIsVisible](self, "_previewActionsSheetIsVisible");
  v4 = -[_UIPreviewActionsController _hasSelectedSwipeAction](self, "_hasSelectedSwipeAction");
  -[_UIPreviewActionsController platterDynamicsController](self, "platterDynamicsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentVelocity");
  v7 = v6;

  return v7 >= 0.1 || !v3 && !v4;
}

- (void)_disablePlatterController
{
  void *v3;

  -[_UIPreviewActionsController platterDynamicsController](self, "platterDynamicsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetAnimator");

  -[_UIPreviewActionsController setPlatterDynamicsController:](self, "setPlatterDynamicsController:", 0);
}

- (void)_memoizePreviewActionViews
{
  id v3;
  id v4;

  v3 = -[_UIPreviewActionsController leadingPreviewActionView](self, "leadingPreviewActionView");
  v4 = -[_UIPreviewActionsController trailingPreviewActionView](self, "trailingPreviewActionView");
}

- (BOOL)_platterIsInInitialPositionMostly
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double MidX;
  CGFloat v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGPoint v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  -[_UIPreviewActionsController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  MidX = CGRectGetMidX(v19);
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  v13 = round(CGRectGetMidY(v20) + -22.0);
  -[_UIPreviewActionsController platterView](self, "platterView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "center");
  v18.x = v15;
  v18.y = v16;
  v21.size.width = 44.0;
  v21.origin.x = round(MidX + -22.0);
  v21.origin.y = v13;
  v21.size.height = 44.0;
  LOBYTE(v3) = CGRectContainsPoint(v21, v18);

  return (char)v3;
}

- (void)_presentSubactionsForActionGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[4];
  id v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD aBlock[7];
  id location[2];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "_actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      -[_UIPreviewActionsController previewActionsView](self, "previewActionsView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_actions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPreviewActionsController _makeAndAddToViewHierarchyPreviewActionSheetForMenuItems:](self, "_makeAndAddToViewHierarchyPreviewActionSheetForMenuItems:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(location, self);
      -[_UIPreviewActionsController previewActionsView](self, "previewActionsView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setUserInteractionEnabled:", 0);

      -[_UIPreviewActionsController _disablePlatterController](self, "_disablePlatterController");
      -[_UIPreviewActionsController _centerForPlatterWithMenuViewPresentedForActionSheet:](self, "_centerForPlatterWithMenuViewPresentedForActionSheet:", v10);
      v44 = v14;
      v45 = v13;
      -[_UIPreviewActionsController _centerForMenuPresentedForActionSheet:](self, "_centerForMenuPresentedForActionSheet:", v8);
      v16 = v15;
      v18 = v17;
      -[_UIPreviewActionsController _centerForMenuDismissedForActionSheet:](self, "_centerForMenuDismissedForActionSheet:", v8);
      v20 = v19;
      v22 = v21;
      -[_UIPreviewActionsController _centerForMenuDismissedForActionSheet:](self, "_centerForMenuDismissedForActionSheet:", v10);
      v24 = v23;
      v26 = v25;
      -[_UIPreviewActionsController _centerForMenuPresentedForActionSheet:](self, "_centerForMenuPresentedForActionSheet:", v10);
      v28 = v27;
      v30 = v29;
      objc_msgSend(v10, "setCenter:", v24, v26);
      objc_msgSend(v8, "setCenter:", v16, v18);
      v31 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke;
      aBlock[3] = &unk_1E16B4E70;
      aBlock[4] = self;
      aBlock[5] = v45;
      aBlock[6] = v44;
      v32 = _Block_copy(aBlock);
      v59[0] = v31;
      v59[1] = 3221225472;
      v59[2] = __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_2;
      v59[3] = &unk_1E16B4E70;
      v33 = v8;
      v60 = v33;
      v61 = v20;
      v62 = v22;
      v34 = _Block_copy(v59);
      v55[0] = v31;
      v55[1] = 3221225472;
      v55[2] = __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_3;
      v55[3] = &unk_1E16B4E70;
      v35 = v10;
      v56 = v35;
      v57 = v28;
      v58 = v30;
      v36 = _Block_copy(v55);
      v51[0] = v31;
      v51[1] = 3221225472;
      v51[2] = __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_4;
      v51[3] = &unk_1E16C1818;
      objc_copyWeak(&v54, location);
      v37 = v35;
      v52 = v37;
      v38 = v33;
      v53 = v38;
      v39 = _Block_copy(v51);
      v46[0] = v31;
      v46[1] = 3221225472;
      v46[2] = __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_6;
      v46[3] = &unk_1E16DA890;
      v50 = 0x3FD999999999999ALL;
      v40 = v32;
      v47 = v40;
      v41 = v34;
      v48 = v41;
      v42 = v36;
      v49 = v42;
      v43 = +[UIViewPropertyAnimator runningPropertyAnimatorWithDuration:delay:options:animations:completion:](UIViewPropertyAnimator, "runningPropertyAnimatorWithDuration:delay:options:animations:completion:", 4, v46, v39, 0.4, 0.0);

      objc_destroyWeak(&v54);
      objc_destroyWeak(location);

    }
  }

}

- (void)_setAffordanceAlpha:(double)a3 withDuration:(double)a4 hideOnCompletion:(BOOL)a5
{
  void *v9;
  double v10;
  double v11;
  _QWORD v12[5];
  BOOL v13;
  _QWORD v14[6];

  -[_UIPreviewActionsController affordanceView](self, "affordanceView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alpha");
  v11 = vabdd_f64(v10, a3);

  if (v11 > 2.22044605e-16)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __81___UIPreviewActionsController__setAffordanceAlpha_withDuration_hideOnCompletion___block_invoke;
    v14[3] = &unk_1E16B1888;
    v14[4] = self;
    *(double *)&v14[5] = a3;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __81___UIPreviewActionsController__setAffordanceAlpha_withDuration_hideOnCompletion___block_invoke_2;
    v12[3] = &unk_1E16B7F38;
    v13 = a5;
    v12[4] = self;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v14, v12, a4);
  }
}

- (void)_updateAffordanceIfNecessary
{
  void *v3;
  _BOOL4 v4;
  double v5;

  -[_UIPreviewActionsController affordanceView](self, "affordanceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _updateAffordanceFrameOrigin(self->_platterView, self->_affordanceView);
    v4 = -[_UIPreviewActionsController _platterIsInInitialPositionMostly](self, "_platterIsInInitialPositionMostly");
    v5 = 0.0;
    if (v4)
      v5 = 1.0;
    -[_UIPreviewActionsController _setAffordanceAlpha:withDuration:hideOnCompletion:](self, "_setAffordanceAlpha:withDuration:hideOnCompletion:", 0, v5, 0.2);
  }
}

- (CGPoint)centerForPlatterWithMenuViewPresented
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[_UIPreviewActionsController previewActionsView](self, "previewActionsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewActionsController _centerForPlatterWithMenuViewPresentedForActionSheet:](self, "_centerForPlatterWithMenuViewPresentedForActionSheet:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)_centerForPlatterWithMenuViewPresentedForActionSheet:(id)a3
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
  void *v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;
  CGRect v18;
  CGRect v19;

  v4 = a3;
  -[_UIPreviewActionsController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "initialPlatterPositionForPreviewActionsController:", self);
  v7 = v6;
  v9 = v8;

  if (v4)
  {
    -[_UIPreviewActionsController _centerForMenuPresentedForActionSheet:](self, "_centerForMenuPresentedForActionSheet:", v4);
    v11 = v10;
    objc_msgSend(v4, "bounds");
    v12 = v11 - CGRectGetHeight(v18) * 0.5;
    -[_UIPreviewActionsController platterView](self, "platterView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v14 = v12 - CGRectGetHeight(v19) * 0.5;

    if (v14 <= v9)
      v9 = v14;
  }

  v15 = v7;
  v16 = v9;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGPoint)centerForPlatterWithMenuViewDismissed
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[_UIPreviewActionsController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initialPlatterPositionForPreviewActionsController:", self);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)centerForMenuPresented
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[_UIPreviewActionsController previewActionsView](self, "previewActionsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewActionsController _centerForMenuPresentedForActionSheet:](self, "_centerForMenuPresentedForActionSheet:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)_centerForMenuPresentedForActionSheet:(id)a3
{
  id v4;
  void *v5;
  double Height;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  void *v16;
  double MidX;
  double v18;
  double v19;
  CGPoint result;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  if (a3)
  {
    v4 = a3;
    -[_UIPreviewActionsController containerView](self, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    Height = CGRectGetHeight(v21);

    objc_msgSend(v4, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v22.origin.x = v8;
    v22.origin.y = v10;
    v22.size.width = v12;
    v22.size.height = v14;
    v15 = Height + CGRectGetHeight(v22) * -0.5;
    -[_UIPreviewActionsController containerView](self, "containerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    MidX = CGRectGetMidX(v23);

  }
  else
  {
    MidX = *MEMORY[0x1E0C9D538];
    v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  -[_UIPreviewActionsController _applyLayoutAdjustmentsForManagedViewWithPosition:](self, "_applyLayoutAdjustmentsForManagedViewWithPosition:", MidX, v15);
  result.y = v19;
  result.x = v18;
  return result;
}

- (CGPoint)centerForMenuDismissed
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[_UIPreviewActionsController previewActionsView](self, "previewActionsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewActionsController _centerForMenuDismissedForActionSheet:](self, "_centerForMenuDismissedForActionSheet:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)_centerForMenuDismissedForActionSheet:(id)a3
{
  id v4;
  void *v5;
  double Height;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  void *v16;
  CGFloat MidX;
  double v18;
  double v19;
  CGPoint result;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  if (a3)
  {
    v4 = a3;
    -[_UIPreviewActionsController containerView](self, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    Height = CGRectGetHeight(v21);

    objc_msgSend(v4, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v22.origin.x = v8;
    v22.origin.y = v10;
    v22.size.width = v12;
    v22.size.height = v14;
    v15 = Height + CGRectGetHeight(v22) * 0.5;
    -[_UIPreviewActionsController containerView](self, "containerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    MidX = CGRectGetMidX(v23);

  }
  else
  {
    MidX = *MEMORY[0x1E0C9D538];
    v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v18 = MidX;
  v19 = v15;
  result.y = v19;
  result.x = v18;
  return result;
}

- (double)minimumSpacingBetweenPlatterAndMenu
{
  return 0.0;
}

- (CGPoint)initialCenterForLeadingSwipeActionView
{
  double MinX;
  void *v4;
  double v5;
  void *v6;
  CGFloat MidY;
  double v8;
  double v9;
  CGPoint result;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  -[_UIPreviewActionsController _initialPlatterFrame](self, "_initialPlatterFrame");
  MinX = CGRectGetMinX(v11);
  -[_UIPreviewActionsController leadingPreviewActionView](self, "leadingPreviewActionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = MinX + CGRectGetWidth(v12) * 0.5;
  -[_UIPreviewActionsController containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  MidY = CGRectGetMidY(v13);

  v8 = v5;
  v9 = MidY;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)initialCenterForTrailingSwipeActionView
{
  double MaxX;
  void *v4;
  double v5;
  void *v6;
  CGFloat MidY;
  double v8;
  double v9;
  CGPoint result;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  -[_UIPreviewActionsController _initialPlatterFrame](self, "_initialPlatterFrame");
  MaxX = CGRectGetMaxX(v11);
  -[_UIPreviewActionsController trailingPreviewActionView](self, "trailingPreviewActionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = MaxX + CGRectGetWidth(v12) * -0.5;
  -[_UIPreviewActionsController containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  MidY = CGRectGetMidY(v13);

  v8 = v5;
  v9 = MidY;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)platterMenuDynamicsControllerDidDismissWithController:(id)a3
{
  id v4;

  -[_UIPreviewActionsController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didDismissPreviewActionsController:", self);

}

- (void)platterMenuDynamicsController:(id)a3 didMoveSwipeView:(id)a4 toPosition:(CGPoint)a5
{
  double y;
  double x;
  double v9;
  id v10;

  y = a5.y;
  x = a5.x;
  v10 = a4;
  objc_msgSend(a3, "currentTranslation");
  if (fabs(v9) > 2.22044605e-16)
  {
    objc_msgSend(v10, "setHidden:", 1);
    objc_msgSend(v10, "setCenter:", x, y);
    -[_UIPreviewActionsController _updateSwipeActionsState](self, "_updateSwipeActionsState");
  }

}

- (void)translationDidUpdateForPlatterMenuDynamicsController:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "currentTranslation");
  if (fabs(v5) > 2.22044605e-16)
  {
    -[_UIPreviewActionsController leadingPreviewActionView](self, "leadingPreviewActionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    -[_UIPreviewActionsController trailingPreviewActionView](self, "trailingPreviewActionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

  }
  -[_UIPreviewActionsController _updateAffordanceIfNecessary](self, "_updateAffordanceIfNecessary");
  -[_UIPreviewActionsController delegate](self, "delegate");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTranslation");
  v9 = v8;
  v11 = v10;

  -[_UIPreviewActionsController platterDynamicsController](self, "platterDynamicsController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentVelocity");
  objc_msgSend(v15, "previewActionsController:didUpdatePlatterTranslation:withVelocity:", self, v9, v11, v13, v14);

}

- (CGPoint)_applyLayoutAdjustmentsForManagedViewWithPosition:(CGPoint)a3
{
  double y;
  CGFloat x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[_UIPreviewActionsController previewActionsView](self, "previewActionsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_managedSafeAreaInsets");
  v9 = v8;

  if (fabs(v9) >= 2.22044605e-16)
  {
    -[_UIPreviewActionsController previewActionsView](self, "previewActionsView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentInsets");
    v12 = v11;

    y = y - (v9 - v12);
  }
  v13 = x;
  v14 = y;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)_configureFeedbackGenerator
{
  void *v3;
  _UIStatesFeedbackGenerator *v4;
  void *v5;
  _UIStatesFeedbackGenerator *v6;
  id v7;

  +[_UIStatesFeedbackGeneratorSwipeActionConfiguration defaultConfiguration](_UIStatesFeedbackGeneratorSwipeActionConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tweakedConfigurationForClass:usage:", objc_opt_class(), CFSTR("swipeAction"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = [_UIStatesFeedbackGenerator alloc];
  -[_UIPreviewActionsController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UIStatesFeedbackGenerator initWithConfiguration:view:](v4, "initWithConfiguration:view:", v7, v5);
  -[_UIPreviewActionsController setSwipeFeedbackGenerator:](self, "setSwipeFeedbackGenerator:", v6);

}

- (void)_activateFeedbackIfNeeded
{
  void *v3;
  char v4;
  id v5;

  -[_UIPreviewActionsController swipeFeedbackGenerator](self, "swipeFeedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActive");

  if ((v4 & 1) == 0)
  {
    -[_UIPreviewActionsController swipeFeedbackGenerator](self, "swipeFeedbackGenerator");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activateWithCompletionBlock:", 0);

  }
}

- (void)_deactivateFeedbackIfNeeded
{
  void *v3;
  int v4;
  id v5;

  -[_UIPreviewActionsController swipeFeedbackGenerator](self, "swipeFeedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActive");

  if (v4)
  {
    -[_UIPreviewActionsController swipeFeedbackGenerator](self, "swipeFeedbackGenerator");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivate");

  }
}

- (void)_fireConfirmFeedbackIfNeededForInitialSelectionState:(BOOL)a3 finalSelectionState:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a4;
  v5 = a3;
  -[_UIPreviewActionsController swipeFeedbackGenerator](self, "swipeFeedbackGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isActive");

  if (v8)
  {
    if (v4 && !v5)
    {
      -[_UIPreviewActionsController swipeFeedbackGenerator](self, "swipeFeedbackGenerator");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      +[_UIStatesFeedbackGeneratorSwipeActionConfiguration confirmState](_UIStatesFeedbackGeneratorSwipeActionConfiguration, "confirmState");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v10 = (void *)v9;
      objc_msgSend(v11, "transitionToState:ended:", v9, 1);

      return;
    }
    if (v5 && !v4)
    {
      -[_UIPreviewActionsController swipeFeedbackGenerator](self, "swipeFeedbackGenerator");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      +[_UIStatesFeedbackGeneratorSwipeActionConfiguration openState](_UIStatesFeedbackGeneratorSwipeActionConfiguration, "openState");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
}

- (void)setLeadingSwipeActionViewSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  -[_UIPreviewActionsController leadingPreviewActionView](self, "leadingPreviewActionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "selected");

  -[_UIPreviewActionsController leadingPreviewActionView](self, "leadingPreviewActionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelected:", v3);

  -[_UIPreviewActionsController _fireConfirmFeedbackIfNeededForInitialSelectionState:finalSelectionState:](self, "_fireConfirmFeedbackIfNeededForInitialSelectionState:finalSelectionState:", v6, v3);
}

- (void)setTrailingSwipeActionViewSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  -[_UIPreviewActionsController trailingPreviewActionView](self, "trailingPreviewActionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "selected");

  -[_UIPreviewActionsController trailingPreviewActionView](self, "trailingPreviewActionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelected:", v3);

  -[_UIPreviewActionsController _fireConfirmFeedbackIfNeededForInitialSelectionState:finalSelectionState:](self, "_fireConfirmFeedbackIfNeededForInitialSelectionState:finalSelectionState:", v6, v3);
}

- (CGSize)totalPanningTranslation
{
  double width;
  double height;
  CGSize result;

  width = self->_totalPanningTranslation.width;
  height = self->_totalPanningTranslation.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTotalPanningTranslation:(CGSize)a3
{
  self->_totalPanningTranslation = a3;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (UIView)affordanceView
{
  return self->_affordanceView;
}

- (void)setAffordanceView:(id)a3
{
  objc_storeStrong((id *)&self->_affordanceView, a3);
}

- (UIImageView)affordanceImageView
{
  return self->_affordanceImageView;
}

- (void)setAffordanceImageView:(id)a3
{
  objc_storeStrong((id *)&self->_affordanceImageView, a3);
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (void)setPresentedViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedViewController, a3);
}

- (_UIPreviewActionsControllerDelegate)delegate
{
  return (_UIPreviewActionsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasBegun
{
  return self->_hasBegun;
}

- (void)setHasBegun:(BOOL)a3
{
  self->_hasBegun = a3;
}

- (_UIPlatterMenuDynamicsController)platterDynamicsController
{
  return self->_platterDynamicsController;
}

- (void)setPlatterDynamicsController:(id)a3
{
  objc_storeStrong((id *)&self->_platterDynamicsController, a3);
}

- (_UIPreviewActionSheetView)previewActionsView
{
  return self->_previewActionsView;
}

- (void)setPreviewActionsView:(id)a3
{
  objc_storeStrong((id *)&self->_previewActionsView, a3);
}

- (void)setCurrentPreviewActionItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setLeadingPreviewAction:(id)a3
{
  objc_storeStrong((id *)&self->_leadingPreviewAction, a3);
}

- (void)setTrailingPreviewAction:(id)a3
{
  objc_storeStrong((id *)&self->_trailingPreviewAction, a3);
}

- (void)setLeadingPreviewActionView:(id)a3
{
  objc_storeStrong((id *)&self->_leadingPreviewActionView, a3);
}

- (void)setTrailingPreviewActionView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingPreviewActionView, a3);
}

- (CGPoint)lastPanningLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastPanningLocation.x;
  y = self->_lastPanningLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastPanningLocation:(CGPoint)a3
{
  self->_lastPanningLocation = a3;
}

- (_UIStatesFeedbackGenerator)swipeFeedbackGenerator
{
  return self->_swipeFeedbackGenerator;
}

- (void)setSwipeFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_swipeFeedbackGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_trailingPreviewActionView, 0);
  objc_storeStrong((id *)&self->_leadingPreviewActionView, 0);
  objc_storeStrong((id *)&self->_trailingPreviewAction, 0);
  objc_storeStrong((id *)&self->_leadingPreviewAction, 0);
  objc_storeStrong((id *)&self->_currentPreviewActionItems, 0);
  objc_storeStrong((id *)&self->_previewActionsView, 0);
  objc_storeStrong((id *)&self->_platterDynamicsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_affordanceImageView, 0);
  objc_storeStrong((id *)&self->_affordanceView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
