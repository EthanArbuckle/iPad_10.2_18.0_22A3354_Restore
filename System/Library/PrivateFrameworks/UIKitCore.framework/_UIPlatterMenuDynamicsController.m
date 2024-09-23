@implementation _UIPlatterMenuDynamicsController

- (_UIPlatterMenuDynamicsController)initWithContainerView:(id)a3 platterView:(id)a4 menuView:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _UIPlatterMenuDynamicsController *v14;
  _UIPlatterMenuDynamicsController *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_UIPlatterMenuDynamicsController;
  v14 = -[_UIPlatterMenuDynamicsController init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v13);
    objc_storeWeak((id *)&v15->_containerView, v10);
    objc_storeWeak((id *)&v15->_platterView, v11);
    objc_storeWeak((id *)&v15->_menuView, v12);
    v15->_state = 0;
    -[_UIPlatterMenuDynamicsController _configureAnimator](v15, "_configureAnimator");
    -[_UIPlatterMenuDynamicsController _configureFeedbackGenerator](v15, "_configureFeedbackGenerator");
  }

  return v15;
}

- (CGVector)currentTranslation
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGVector result;

  -[_UIPlatterMenuDynamicsController panningLockTransformer](self, "panningLockTransformer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "offset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.dy = v8;
  result.dx = v7;
  return result;
}

- (CGVector)currentVelocity
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGVector result;

  -[_UIPlatterMenuDynamicsController panningLockTransformer](self, "panningLockTransformer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "velocity");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.dy = v8;
  result.dx = v7;
  return result;
}

- (void)didBeginPanningWithPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  id v9;

  y = a3.y;
  x = a3.x;
  -[_UIPlatterMenuDynamicsController _activateFeedbackIfNeeded](self, "_activateFeedbackIfNeeded");
  -[_UIPlatterMenuDynamicsController setInitialTouchPoint:](self, "setInitialTouchPoint:", x, y);
  -[_UIPlatterMenuDynamicsController setIsCurrentlyUnderDirectManipulation:](self, "setIsCurrentlyUnderDirectManipulation:", 1);
  -[_UIPlatterMenuDynamicsController _updateSwipeEdgeMultipliersIfNeededForTouchPosition:](self, "_updateSwipeEdgeMultipliersIfNeededForTouchPosition:", x, y);
  -[_UIPlatterMenuDynamicsController panningLockTransformer](self, "panningLockTransformer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController platterView](self, "platterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "center");
  objc_msgSend(v9, "didBeginPanningWithTouchPosition:currentTransformedPosition:", x, y, v7, v8);

}

- (void)didPanWithPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  id v9;

  y = a3.y;
  x = a3.x;
  -[_UIPlatterMenuDynamicsController panningLockTransformer](self, "panningLockTransformer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController platterView](self, "platterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "center");
  objc_msgSend(v9, "didPanWithTouchPosition:currentTransformedPosition:", x, y, v7, v8);

}

- (void)didEndPanningWithPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  id v9;

  y = a3.y;
  x = a3.x;
  -[_UIPlatterMenuDynamicsController _deactivateFeedbackIfNeeded](self, "_deactivateFeedbackIfNeeded");
  -[_UIPlatterMenuDynamicsController setIsCurrentlyUnderDirectManipulation:](self, "setIsCurrentlyUnderDirectManipulation:", 0);
  -[_UIPlatterMenuDynamicsController panningLockTransformer](self, "panningLockTransformer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController platterView](self, "platterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "center");
  objc_msgSend(v9, "didEndPanningWithTouchPosition:currentTransformedPosition:", x, y, v7, v8);

}

- (void)toggleAnimatorDebugState
{
  uint64_t v3;
  void *v4;
  id v5;

  -[_UIPlatterMenuDynamicsController animator](self, "animator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "isDebugEnabled") ^ 1;
  -[_UIPlatterMenuDynamicsController animator](self, "animator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDebugEnabled:", v3);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_UIPlatterMenuDynamicsController animator](self, "animator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllBehaviors");

  -[_UIPlatterMenuDynamicsController _deactivateFeedbackIfNeeded](self, "_deactivateFeedbackIfNeeded");
  v4.receiver = self;
  v4.super_class = (Class)_UIPlatterMenuDynamicsController;
  -[_UIPlatterMenuDynamicsController dealloc](&v4, sel_dealloc);
}

- (void)resetAnimator
{
  id v2;

  -[_UIPlatterMenuDynamicsController animator](self, "animator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllBehaviors");

}

- (BOOL)isMenuPresented
{
  return -[_UIPlatterMenuDynamicsController state](self, "state") == 2;
}

- (BOOL)isMenuPresenting
{
  return -[_UIPlatterMenuDynamicsController state](self, "state") == 1;
}

- (BOOL)isSelectingSwipeAction
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  -[_UIPlatterMenuDynamicsController platterView](self, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController animator](self, "animator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController platterItem](self, "platterItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateItemFromCurrentState:", v5);

  objc_msgSend(v3, "center");
  v7 = v6;
  -[_UIPlatterMenuDynamicsController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerForPlatterWithMenuViewDismissed");
  v10 = v9;

  return vabdd_f64(v7, v10) > 2.0;
}

- (BOOL)platterPanned
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  -[_UIPlatterMenuDynamicsController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerForPlatterWithMenuViewDismissed");
  v5 = v4;
  v7 = v6;

  -[_UIPlatterMenuDynamicsController platterView](self, "platterView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "center");
  v10 = v9;
  v12 = v11;

  v13 = vabdd_f64(v5, v10) >= 3.0;
  return vabdd_f64(v7, v12) > 3.0 || v13;
}

- (void)lockIntoYAxis
{
  id v2;

  -[_UIPlatterMenuDynamicsController panningLockTransformer](self, "panningLockTransformer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockIntoYAxis");

}

- (void)_beginInYLockedStatePresented
{
  id v3;

  -[_UIPlatterMenuDynamicsController setState:](self, "setState:", 2);
  -[_UIPlatterMenuDynamicsController panningLockTransformer](self, "panningLockTransformer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_enterYLockedState");

}

- (void)_animateToPlatterPresentedWithVelocity:(CGVector)a3
{
  double dy;
  double dx;
  void *v6;

  dy = a3.dy;
  dx = a3.dx;
  -[_UIPlatterMenuDynamicsController panningLockTransformer](self, "panningLockTransformer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lockIntoYAxis");

  -[_UIPlatterMenuDynamicsController performActionsAndEnterState:velocity:underDirectManipulation:](self, "performActionsAndEnterState:velocity:underDirectManipulation:", 1, 0, dx, dy);
}

- (void)_animateToPlatterDismissedWithDuration:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[9];

  v6 = a4;
  -[_UIPlatterMenuDynamicsController resetAnimator](self, "resetAnimator");
  -[_UIPlatterMenuDynamicsController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerForPlatterWithMenuViewDismissed");
  v9 = v8;
  v11 = v10;

  -[_UIPlatterMenuDynamicsController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "centerForMenuDismissed");
  v14 = v13;
  v16 = v15;

  v19 = v6;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __86___UIPlatterMenuDynamicsController__animateToPlatterDismissedWithDuration_completion___block_invoke;
  v20[3] = &unk_1E16B20D8;
  v20[4] = self;
  v20[5] = v9;
  v20[6] = v11;
  v20[7] = v14;
  v20[8] = v16;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __86___UIPlatterMenuDynamicsController__animateToPlatterDismissedWithDuration_completion___block_invoke_2;
  v18[3] = &unk_1E16B1BA0;
  v17 = v6;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v20, v18, a3);

}

- (BOOL)hasBeenPresented
{
  return -[_UIPlatterMenuDynamicsController didPresentCount](self, "didPresentCount") > 0;
}

- (void)panningTransformer:(id)a3 didBeginPanToTransformedPosition:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  y = a4.y;
  x = a4.x;
  -[_UIPlatterMenuDynamicsController resetAnimatorToDefaultBehaviors](self, "resetAnimatorToDefaultBehaviors", a3);
  -[_UIPlatterMenuDynamicsController gestureAttachmentBehavior](self, "gestureAttachmentBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAnchorPoint:", x, y);

  -[_UIPlatterMenuDynamicsController gestureAttachmentBehavior](self, "gestureAttachmentBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController addBehaviorIfNotPresent:](self, "addBehaviorIfNotPresent:", v8);

  -[_UIPlatterMenuDynamicsController animator](self, "animator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController platterItem](self, "platterItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateItemFromCurrentState:", v10);

  -[_UIPlatterMenuDynamicsController performActionsAndEnterState:](self, "performActionsAndEnterState:", -[_UIPlatterMenuDynamicsController state](self, "state"));
}

- (void)panningTransformer:(id)a3 didPanToTransformedPosition:(CGPoint)a4 offsetFromPrevious:(CGVector)a5 touchPosition:(CGPoint)a6 velocity:(CGVector)a7 didChangeAxis:(BOOL)a8 axisLock:(unint64_t)a9
{
  _BOOL4 v10;
  CGFloat dy;
  double y;
  double x;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  int64_t v48;
  double v49;
  double dx;
  id v51;

  v10 = a8;
  dy = a7.dy;
  dx = a7.dx;
  y = a6.y;
  x = a6.x;
  v14 = a5.dy;
  v15 = a5.dx;
  v16 = a4.y;
  v17 = a4.x;
  -[_UIPlatterMenuDynamicsController animator](self, "animator", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController platterItem](self, "platterItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "updateItemFromCurrentState:", v20);

  -[_UIPlatterMenuDynamicsController animator](self, "animator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController menuView](self, "menuView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "updateItemFromCurrentState:", v22);

  if (a9)
  {
    v49 = dy;
    -[_UIPlatterMenuDynamicsController modifiedOffsetForPosition:offset:touchPosition:axisLock:](self, "modifiedOffsetForPosition:offset:touchPosition:axisLock:", a9, v17, v16, v15, v14, x, y);
    v24 = v23;
    v26 = v25;
    -[_UIPlatterMenuDynamicsController gestureAttachmentBehavior](self, "gestureAttachmentBehavior");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "anchorPoint");
    v29 = v28;
    v31 = v30;

    v32 = v24 + v29;
    v33 = v26 + v31;
    -[_UIPlatterMenuDynamicsController delegate](self, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v34;
    if (v10)
    {
      if (a9 == 1)
      {
        objc_msgSend(v34, "centerForPlatterWithMenuViewDismissed");
        v33 = v36;
      }
      else if (a9 == 2)
      {
        objc_msgSend(v34, "centerForPlatterWithMenuViewDismissed");
        v32 = v35;
      }
    }
    -[_UIPlatterMenuDynamicsController gestureAttachmentBehavior](self, "gestureAttachmentBehavior");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setAnchorPoint:", v32, v33);

    if (-[_UIPlatterMenuDynamicsController state](self, "state") == 2
      || -[_UIPlatterMenuDynamicsController state](self, "state") == 1)
    {
      -[_UIPlatterMenuDynamicsController centerForMenuPresentedRelativeToCurrentPlatter](self, "centerForMenuPresentedRelativeToCurrentPlatter");
      v39 = v38;
      v41 = v26 + v40;
      -[_UIPlatterMenuDynamicsController menuPresentedSnapBehavior](self, "menuPresentedSnapBehavior");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setAnchorPoint:", v39, v41);

    }
    objc_msgSend(v51, "centerForPlatterWithMenuViewPresented");
    v44 = v43;
    objc_msgSend(v51, "minimumSpacingBetweenPlatterAndMenu");
    if (v16 + v45 * 0.5 < v44)
    {
      -[_UIPlatterMenuDynamicsController animator](self, "animator");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPlatterMenuDynamicsController platterMenuSlidingAttachmentBehavior](self, "platterMenuSlidingAttachmentBehavior");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "removeBehavior:", v47);

    }
    -[_UIPlatterMenuDynamicsController _positionSwipeActionViewsForCurrentPlatterViewPosition](self, "_positionSwipeActionViewsForCurrentPlatterViewPosition");
    v48 = -[_UIPlatterMenuDynamicsController _stateForPosition:offset:velocity:](self, "_stateForPosition:offset:velocity:", v17, v16, v15, v14, dx, v49);
    if (v48 != -[_UIPlatterMenuDynamicsController state](self, "state"))
      -[_UIPlatterMenuDynamicsController performActionsAndEnterState:velocity:underDirectManipulation:](self, "performActionsAndEnterState:velocity:underDirectManipulation:", v48, 1, dx, v49);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v51, "translationDidUpdateForPlatterMenuDynamicsController:", self);

  }
}

- (void)panningTransformer:(id)a3 didEndPanToTransformedPosition:(CGPoint)a4 offsetFromPrevious:(CGVector)a5 velocity:(CGVector)a6
{
  double dy;
  double dx;
  double v8;
  double v9;
  double y;
  double x;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;

  dy = a6.dy;
  dx = a6.dx;
  v8 = a5.dy;
  v9 = a5.dx;
  y = a4.y;
  x = a4.x;
  -[_UIPlatterMenuDynamicsController animator](self, "animator", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController menuView](self, "menuView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateItemFromCurrentState:", v14);

  -[_UIPlatterMenuDynamicsController animator](self, "animator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController platterItem](self, "platterItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateItemFromCurrentState:", v16);

  v17 = -[_UIPlatterMenuDynamicsController _stateForPosition:offset:velocity:](self, "_stateForPosition:offset:velocity:", x, y, v9, v8, dx, dy);
  v18 = 3;
  if (v17)
    v18 = v17;
  if (v17 == 2)
    v19 = 1;
  else
    v19 = v18;
  -[_UIPlatterMenuDynamicsController performActionsAndEnterState:velocity:underDirectManipulation:](self, "performActionsAndEnterState:velocity:underDirectManipulation:", v19, 0, dx, dy);
}

- (void)_configureAnimator
{
  _UIPlatterItem *v3;
  void *v4;
  _UIPlatterItem *v5;
  UIDynamicAnimator *v6;
  void *v7;
  UIDynamicAnimator *v8;
  UIDynamicItemBehavior *v9;
  void *v10;
  UIDynamicItemBehavior *v11;
  void *v12;
  void *v13;
  void *v14;
  UIDynamicItemBehavior *v15;
  void *v16;
  void *v17;
  UIDynamicItemBehavior *v18;
  void *v19;
  void *v20;
  void *v21;
  UIAttachmentBehavior *v22;
  void *v23;
  UIAttachmentBehavior *v24;
  void *v25;
  void *v26;
  UIAttachmentBehavior *v27;
  double v28;
  double v29;
  UIAttachmentBehavior *v30;
  _UIPlatterMenuSnapBehavior *v31;
  _UIPlatterMenuSnapBehavior *v32;
  void *v33;
  _UIPlatterMenuSnapBehavior *v34;
  void *v35;
  void *v36;
  _UIPlatterMenuSnapBehavior *v37;
  void *v38;
  _UIPlatterMenuSnapBehavior *v39;
  void *v40;
  void *v41;
  UIDynamicItemBehavior *v42;
  void *v43;
  void *v44;
  UIDynamicItemBehavior *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  UICollisionBehavior *v53;
  void *v54;
  void *v55;
  UICollisionBehavior *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[2];
  _QWORD v67[2];
  void *v68;
  _QWORD v69[2];

  v69[1] = *MEMORY[0x1E0C80C00];
  v3 = [_UIPlatterItem alloc];
  -[_UIPlatterMenuDynamicsController platterView](self, "platterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIPlatterItem initWithView:](v3, "initWithView:", v4);

  v6 = [UIDynamicAnimator alloc];
  -[_UIPlatterMenuDynamicsController containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIDynamicAnimator initWithReferenceView:](v6, "initWithReferenceView:", v7);
  -[_UIPlatterMenuDynamicsController setAnimator:](self, "setAnimator:", v8);

  v9 = [UIDynamicItemBehavior alloc];
  v69[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UIDynamicItemBehavior initWithItems:](v9, "initWithItems:", v10);
  -[_UIPlatterMenuDynamicsController setPlatterItemBehavior:](self, "setPlatterItemBehavior:", v11);

  -[_UIPlatterMenuDynamicsController platterItemBehavior](self, "platterItemBehavior");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDensity:", 0.0001);

  -[_UIPlatterMenuDynamicsController platterItemBehavior](self, "platterItemBehavior");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setResistance:", 0.2);

  -[_UIPlatterMenuDynamicsController platterItemBehavior](self, "platterItemBehavior");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setElasticity:", 0.1);

  v15 = [UIDynamicItemBehavior alloc];
  -[_UIPlatterMenuDynamicsController menuView](self, "menuView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[UIDynamicItemBehavior initWithItems:](v15, "initWithItems:", v17);
  -[_UIPlatterMenuDynamicsController setMenuItemBehavior:](self, "setMenuItemBehavior:", v18);

  -[_UIPlatterMenuDynamicsController menuItemBehavior](self, "menuItemBehavior");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDensity:", 0.01);

  -[_UIPlatterMenuDynamicsController menuItemBehavior](self, "menuItemBehavior");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setResistance:", 0.2);

  -[_UIPlatterMenuDynamicsController menuItemBehavior](self, "menuItemBehavior");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setElasticity:", 0.1);

  v22 = [UIAttachmentBehavior alloc];
  -[_UIPlatterMenuDynamicsController menuView](self, "menuView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[UIAttachmentBehavior initWithItem:attachedToItem:](v22, "initWithItem:attachedToItem:", v23, v5);
  -[_UIPlatterMenuDynamicsController setPlatterMenuAttachmentBehavior:](self, "setPlatterMenuAttachmentBehavior:", v24);

  -[_UIPlatterMenuDynamicsController platterMenuAttachmentBehavior](self, "platterMenuAttachmentBehavior");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDamping:", 0.6);

  -[_UIPlatterMenuDynamicsController platterMenuAttachmentBehavior](self, "platterMenuAttachmentBehavior");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrequency:", 2.0);

  v27 = [UIAttachmentBehavior alloc];
  v28 = *MEMORY[0x1E0C9D538];
  v29 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v30 = -[UIAttachmentBehavior initWithItem:attachedToAnchor:](v27, "initWithItem:attachedToAnchor:", v5, *MEMORY[0x1E0C9D538], v29);
  -[_UIPlatterMenuDynamicsController setGestureAttachmentBehavior:](self, "setGestureAttachmentBehavior:", v30);

  v31 = -[_UIPlatterMenuSnapBehavior initWithItem:attachedToAnchor:]([_UIPlatterMenuSnapBehavior alloc], "initWithItem:attachedToAnchor:", v5, v28, v29);
  -[_UIPlatterMenuDynamicsController setPlatterSnapBehavior:](self, "setPlatterSnapBehavior:", v31);

  v32 = [_UIPlatterMenuSnapBehavior alloc];
  -[_UIPlatterMenuDynamicsController menuView](self, "menuView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[_UIPlatterMenuSnapBehavior initWithItem:attachedToAnchor:](v32, "initWithItem:attachedToAnchor:", v33, v28, v29);
  -[_UIPlatterMenuDynamicsController setMenuPresentedSnapBehavior:](self, "setMenuPresentedSnapBehavior:", v34);

  -[_UIPlatterMenuDynamicsController menuPresentedSnapBehavior](self, "menuPresentedSnapBehavior");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setDamping:", 0.55);

  -[_UIPlatterMenuDynamicsController menuPresentedSnapBehavior](self, "menuPresentedSnapBehavior");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrequency:", 2.0);

  v37 = [_UIPlatterMenuSnapBehavior alloc];
  -[_UIPlatterMenuDynamicsController menuView](self, "menuView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[_UIPlatterMenuSnapBehavior initWithItem:attachedToAnchor:](v37, "initWithItem:attachedToAnchor:", v38, v28, v29);
  -[_UIPlatterMenuDynamicsController setMenuDismissedSnapBehavior:](self, "setMenuDismissedSnapBehavior:", v39);

  -[_UIPlatterMenuDynamicsController menuDismissedSnapBehavior](self, "menuDismissedSnapBehavior");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setDamping:", 0.3);

  -[_UIPlatterMenuDynamicsController menuDismissedSnapBehavior](self, "menuDismissedSnapBehavior");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setFrequency:", 1.0);

  v42 = [UIDynamicItemBehavior alloc];
  -[_UIPlatterMenuDynamicsController menuView](self, "menuView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v43;
  v67[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[UIDynamicItemBehavior initWithItems:](v42, "initWithItems:", v44);
  -[_UIPlatterMenuDynamicsController setNoRotationBehavior:](self, "setNoRotationBehavior:", v45);

  -[_UIPlatterMenuDynamicsController noRotationBehavior](self, "noRotationBehavior");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setDensity:", 0.0);

  -[_UIPlatterMenuDynamicsController noRotationBehavior](self, "noRotationBehavior");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setResistance:", 0.0);

  -[_UIPlatterMenuDynamicsController noRotationBehavior](self, "noRotationBehavior");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setFriction:", 0.0);

  -[_UIPlatterMenuDynamicsController noRotationBehavior](self, "noRotationBehavior");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setAllowsRotation:", 0);

  -[_UIPlatterMenuDynamicsController menuView](self, "menuView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController menuView](self, "menuView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "center");
  +[UIAttachmentBehavior slidingAttachmentWithItem:attachmentAnchor:axisOfTranslation:](UIAttachmentBehavior, "slidingAttachmentWithItem:attachmentAnchor:axisOfTranslation:", v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController setMenuVerticalLockAttachment:](self, "setMenuVerticalLockAttachment:", v52);

  v53 = [UICollisionBehavior alloc];
  v66[0] = v5;
  -[_UIPlatterMenuDynamicsController menuView](self, "menuView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[UICollisionBehavior initWithItems:](v53, "initWithItems:", v55);
  -[_UIPlatterMenuDynamicsController setPlatterMenuCollisionBounds:](self, "setPlatterMenuCollisionBounds:", v56);

  -[_UIPlatterMenuDynamicsController menuView](self, "menuView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController platterView](self, "platterView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "center");
  +[UIAttachmentBehavior pinAttachmentWithItem:attachedToItem:attachmentAnchor:](UIAttachmentBehavior, "pinAttachmentWithItem:attachedToItem:attachmentAnchor:", v5, v57);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController setPlatterMenuSlidingAttachmentBehavior:](self, "setPlatterMenuSlidingAttachmentBehavior:", v59);

  -[_UIPlatterMenuDynamicsController animator](self, "animator");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController noRotationBehavior](self, "noRotationBehavior");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addBehavior:", v61);

  -[_UIPlatterMenuDynamicsController animator](self, "animator");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController menuVerticalLockAttachment](self, "menuVerticalLockAttachment");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addBehavior:", v63);

  -[_UIPlatterMenuDynamicsController animator](self, "animator");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController platterMenuCollisionBounds](self, "platterMenuCollisionBounds");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "addBehavior:", v65);

  -[_UIPlatterMenuDynamicsController setPlatterItem:](self, "setPlatterItem:", v5);
}

- (void)stopObservingBehavior
{
  void *v3;

  -[_UIPlatterMenuDynamicsController observingBehavior](self, "observingBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[_UIPlatterMenuDynamicsController setObservingBehavior:](self, "setObservingBehavior:", 0);
}

- (int64_t)_stateForPosition:(CGPoint)a3 offset:(CGVector)a4 velocity:(CGVector)a5
{
  double dy;
  double y;
  _BOOL4 v8;
  int64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;

  dy = a5.dy;
  y = a3.y;
  v8 = -[_UIPlatterMenuDynamicsController _isPlatterInYLockedPosition](self, "_isPlatterInYLockedPosition", a3.x, a3.y, a4.dx, a4.dy, a5.dx);
  v9 = -[_UIPlatterMenuDynamicsController state](self, "state");
  if (v8)
  {
    -[_UIPlatterMenuDynamicsController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_UIPlatterMenuDynamicsController state](self, "state"))
    {
      if (-[_UIPlatterMenuDynamicsController state](self, "state") == 2)
      {
        objc_msgSend(v10, "centerForMenuPresented");
        v12 = v11;
        -[_UIPlatterMenuDynamicsController menuCenter](self, "menuCenter");
        goto LABEL_5;
      }
      if (-[_UIPlatterMenuDynamicsController state](self, "state") == 1)
      {
        objc_msgSend(v10, "centerForMenuPresented");
        v12 = v16;
        -[_UIPlatterMenuDynamicsController menuCenter](self, "menuCenter");
        if (dy >= 0.0 || v13 >= v12 + -40.0)
        {
LABEL_5:
          if (v13 > v12 + 40.0 && dy > 0.0)
            v9 = 3;
          goto LABEL_23;
        }
        v9 = 2;
LABEL_23:

        return v9;
      }
      if (-[_UIPlatterMenuDynamicsController state](self, "state") != 3)
        goto LABEL_23;
      if (dy >= 0.0)
        goto LABEL_23;
      objc_msgSend(v10, "centerForPlatterWithMenuViewDismissed");
      if (y >= v17 + -70.0)
        goto LABEL_23;
    }
    else
    {
      objc_msgSend(v10, "centerForPlatterWithMenuViewDismissed");
      if (y >= v15 + -60.0 && (dy >= 0.0 || fabs(dy) <= 500.0))
        goto LABEL_23;
    }
    v9 = 1;
    goto LABEL_23;
  }
  return v9;
}

- (void)performActionsAndEnterState:(int64_t)a3
{
  -[_UIPlatterMenuDynamicsController performActionsAndEnterState:velocity:underDirectManipulation:](self, "performActionsAndEnterState:velocity:underDirectManipulation:", a3, 1, 0.0, 0.0);
}

- (void)performActionsAndEnterState:(int64_t)a3 velocity:(CGVector)a4 underDirectManipulation:(BOOL)a5
{
  _BOOL4 v5;
  double dy;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  _UIPlatterMenuDynamicsController *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  void *v91;
  void *v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  _QWORD v114[2];
  _QWORD v115[4];
  _QWORD v116[2];
  _QWORD v117[6];

  v5 = a5;
  dy = a4.dy;
  v117[4] = *MEMORY[0x1E0C80C00];
  -[_UIPlatterMenuDynamicsController setState:](self, "setState:", a4.dx);
  -[_UIPlatterMenuDynamicsController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  switch(a3)
  {
    case 0:
      if (-[_UIPlatterMenuDynamicsController didPresentCount](self, "didPresentCount") >= 1)
        objc_msgSend(v10, "platterMenuDynamicsControllerDidDismissWithController:", self);
      -[_UIPlatterMenuDynamicsController resetAnimatorToDefaultBehaviors](self, "resetAnimatorToDefaultBehaviors");
      if (v5)
      {
        objc_msgSend(v10, "centerForMenuDismissed");
        v12 = v11;
        v14 = v13;
        -[_UIPlatterMenuDynamicsController menuDismissedSnapBehavior](self, "menuDismissedSnapBehavior");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setAnchorPoint:", v12, v14);

        -[_UIPlatterMenuDynamicsController menuDismissedSnapBehavior](self, "menuDismissedSnapBehavior");
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      -[_UIPlatterMenuDynamicsController animator](self, "animator");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPlatterMenuDynamicsController gestureAttachmentBehavior](self, "gestureAttachmentBehavior");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "removeBehavior:", v43);

      objc_msgSend(v10, "centerForPlatterWithMenuViewDismissed");
      v45 = v44;
      v47 = v46;
      -[_UIPlatterMenuDynamicsController platterSnapBehavior](self, "platterSnapBehavior");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setAnchorPoint:", v45, v47);

      -[_UIPlatterMenuDynamicsController platterSnapBehavior](self, "platterSnapBehavior");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setDamping:", 0.3);

      -[_UIPlatterMenuDynamicsController platterSnapBehavior](self, "platterSnapBehavior");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setFrequency:", 3.0);

      objc_msgSend(v10, "centerForMenuDismissed");
      v52 = v51;
      v54 = v53;
      -[_UIPlatterMenuDynamicsController menuDismissedSnapBehavior](self, "menuDismissedSnapBehavior");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setAnchorPoint:", v52, v54);

      -[_UIPlatterMenuDynamicsController platterSnapBehavior](self, "platterSnapBehavior");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPlatterMenuDynamicsController addBehaviorIfNotPresent:](self, "addBehaviorIfNotPresent:", v56);

      -[_UIPlatterMenuDynamicsController menuDismissedSnapBehavior](self, "menuDismissedSnapBehavior");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPlatterMenuDynamicsController addBehaviorIfNotPresent:](self, "addBehaviorIfNotPresent:", v57);

      -[_UIPlatterMenuDynamicsController platterItemBehavior](self, "platterItemBehavior");
      v41 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 1:
      objc_msgSend(v9, "centerForMenuPresented");
      if (!v5)
      {
        v59 = v17;
        v60 = v18;
        -[_UIPlatterMenuDynamicsController resetAnimatorToDefaultBehaviors](self, "resetAnimatorToDefaultBehaviors");
        -[_UIPlatterMenuDynamicsController animator](self, "animator");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPlatterMenuDynamicsController gestureAttachmentBehavior](self, "gestureAttachmentBehavior");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "removeBehavior:", v62);

        objc_msgSend(v10, "centerForPlatterWithMenuViewPresented");
        v64 = v63;
        v66 = v65;
        -[_UIPlatterMenuDynamicsController platterSnapBehavior](self, "platterSnapBehavior");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "setAnchorPoint:", v64, v66);

        -[_UIPlatterMenuDynamicsController platterSnapBehavior](self, "platterSnapBehavior");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setDamping:", 0.4);

        -[_UIPlatterMenuDynamicsController platterSnapBehavior](self, "platterSnapBehavior");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setFrequency:", 1.4);

        -[_UIPlatterMenuDynamicsController menuPresentedSnapBehavior](self, "menuPresentedSnapBehavior");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setAnchorPoint:", v59, v60);

        -[_UIPlatterMenuDynamicsController platterItemBehavior](self, "platterItemBehavior");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPlatterMenuDynamicsController platterItem](self, "platterItem");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "addLinearVelocity:forItem:", v72, 0.0, dy);

        -[_UIPlatterMenuDynamicsController platterSnapBehavior](self, "platterSnapBehavior");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v115[0] = v73;
        -[_UIPlatterMenuDynamicsController menuPresentedSnapBehavior](self, "menuPresentedSnapBehavior");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v115[1] = v74;
        -[_UIPlatterMenuDynamicsController platterItemBehavior](self, "platterItemBehavior");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v115[2] = v75;
        -[_UIPlatterMenuDynamicsController menuItemBehavior](self, "menuItemBehavior");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v115[3] = v76;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 4);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPlatterMenuDynamicsController platterItem](self, "platterItem");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPlatterMenuDynamicsController menuView](self, "menuView", v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v114[1] = v79;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 2);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = self;
        v82 = v77;
        v83 = v80;
        v84 = 2;
        goto LABEL_20;
      }
      -[_UIPlatterMenuDynamicsController resetAnimatorToDefaultBehaviors](self, "resetAnimatorToDefaultBehaviors");
      -[_UIPlatterMenuDynamicsController centerForMenuPresentedRelativeToCurrentPlatter](self, "centerForMenuPresentedRelativeToCurrentPlatter");
      v20 = v19;
      v22 = v21;
      -[_UIPlatterMenuDynamicsController menuPresentedSnapBehavior](self, "menuPresentedSnapBehavior");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setAnchorPoint:", v20, v22);

      -[_UIPlatterMenuDynamicsController menuPresentedSnapBehavior](self, "menuPresentedSnapBehavior");
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v24 = (void *)v16;
      -[_UIPlatterMenuDynamicsController addBehaviorIfNotPresent:](self, "addBehaviorIfNotPresent:", v16);

      -[_UIPlatterMenuDynamicsController gestureAttachmentBehavior](self, "gestureAttachmentBehavior");
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 2:
      -[_UIPlatterMenuDynamicsController setDidPresentCount:](self, "setDidPresentCount:", -[_UIPlatterMenuDynamicsController didPresentCount](self, "didPresentCount") + 1);
      -[_UIPlatterMenuDynamicsController resetAnimatorToDefaultBehaviors](self, "resetAnimatorToDefaultBehaviors");
      if (v5)
      {
        -[_UIPlatterMenuDynamicsController platterMenuSlidingAttachmentBehavior](self, "platterMenuSlidingAttachmentBehavior");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPlatterMenuDynamicsController addBehaviorIfNotPresent:](self, "addBehaviorIfNotPresent:", v26);

        -[_UIPlatterMenuDynamicsController gestureAttachmentBehavior](self, "gestureAttachmentBehavior");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPlatterMenuDynamicsController addBehaviorIfNotPresent:](self, "addBehaviorIfNotPresent:", v27);

        objc_msgSend(v10, "centerForMenuPresented");
        v29 = v28;
        v31 = v30;
        -[_UIPlatterMenuDynamicsController menuPresentedSnapBehavior](self, "menuPresentedSnapBehavior");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setAnchorPoint:", v29, v31);

        -[_UIPlatterMenuDynamicsController menuPresentedSnapBehavior](self, "menuPresentedSnapBehavior");
      }
      else
      {
        -[_UIPlatterMenuDynamicsController animator](self, "animator");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPlatterMenuDynamicsController gestureAttachmentBehavior](self, "gestureAttachmentBehavior");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "removeBehavior:", v86);

        objc_msgSend(v10, "centerForMenuPresented");
        v88 = v87;
        v90 = v89;
        -[_UIPlatterMenuDynamicsController menuPresentedSnapBehavior](self, "menuPresentedSnapBehavior");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "setAnchorPoint:", v88, v90);

        -[_UIPlatterMenuDynamicsController platterSnapBehavior](self, "platterSnapBehavior");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "setDamping:", 0.4);

        -[_UIPlatterMenuDynamicsController platterSnapBehavior](self, "platterSnapBehavior");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "setFrequency:", 1.4);

        objc_msgSend(v10, "centerForPlatterWithMenuViewPresented");
        v95 = v94;
        v97 = v96;
        -[_UIPlatterMenuDynamicsController platterSnapBehavior](self, "platterSnapBehavior");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setAnchorPoint:", v95, v97);

        -[_UIPlatterMenuDynamicsController menuPresentedSnapBehavior](self, "menuPresentedSnapBehavior");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPlatterMenuDynamicsController addBehaviorIfNotPresent:](self, "addBehaviorIfNotPresent:", v99);

        -[_UIPlatterMenuDynamicsController platterSnapBehavior](self, "platterSnapBehavior");
      }
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 3:
      -[_UIPlatterMenuDynamicsController resetAnimatorToDefaultBehaviors](self, "resetAnimatorToDefaultBehaviors");
      if (v5)
      {
        objc_msgSend(v10, "centerForMenuDismissed");
        v34 = v33;
        v36 = v35;
        -[_UIPlatterMenuDynamicsController menuDismissedSnapBehavior](self, "menuDismissedSnapBehavior");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setAnchorPoint:", v34, v36);

        -[_UIPlatterMenuDynamicsController animator](self, "animator");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPlatterMenuDynamicsController platterMenuSlidingAttachmentBehavior](self, "platterMenuSlidingAttachmentBehavior");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "removeBehavior:", v39);

        -[_UIPlatterMenuDynamicsController menuDismissedSnapBehavior](self, "menuDismissedSnapBehavior");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPlatterMenuDynamicsController addBehaviorIfNotPresent:](self, "addBehaviorIfNotPresent:", v40);

        -[_UIPlatterMenuDynamicsController gestureAttachmentBehavior](self, "gestureAttachmentBehavior");
        v41 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v58 = (void *)v41;
        -[_UIPlatterMenuDynamicsController addBehaviorIfNotPresent:](self, "addBehaviorIfNotPresent:", v41);

        -[_UIPlatterMenuDynamicsController menuItemBehavior](self, "menuItemBehavior");
        v25 = objc_claimAutoreleasedReturnValue();
LABEL_18:
        v73 = (void *)v25;
        -[_UIPlatterMenuDynamicsController addBehaviorIfNotPresent:](self, "addBehaviorIfNotPresent:", v25);
      }
      else
      {
        -[_UIPlatterMenuDynamicsController animator](self, "animator");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPlatterMenuDynamicsController gestureAttachmentBehavior](self, "gestureAttachmentBehavior");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "removeBehavior:", v101);

        objc_msgSend(v10, "centerForPlatterWithMenuViewDismissed");
        v103 = v102;
        v105 = v104;
        -[_UIPlatterMenuDynamicsController platterSnapBehavior](self, "platterSnapBehavior");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "setAnchorPoint:", v103, v105);

        -[_UIPlatterMenuDynamicsController platterSnapBehavior](self, "platterSnapBehavior");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "setDamping:", 0.3);

        -[_UIPlatterMenuDynamicsController platterSnapBehavior](self, "platterSnapBehavior");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "setFrequency:", 3.0);

        objc_msgSend(v10, "centerForMenuDismissed");
        v110 = v109;
        v112 = v111;
        -[_UIPlatterMenuDynamicsController menuDismissedSnapBehavior](self, "menuDismissedSnapBehavior");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "setAnchorPoint:", v110, v112);

        -[_UIPlatterMenuDynamicsController platterSnapBehavior](self, "platterSnapBehavior");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v117[0] = v73;
        -[_UIPlatterMenuDynamicsController platterItemBehavior](self, "platterItemBehavior");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v117[1] = v74;
        -[_UIPlatterMenuDynamicsController menuDismissedSnapBehavior](self, "menuDismissedSnapBehavior");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v117[2] = v75;
        -[_UIPlatterMenuDynamicsController menuItemBehavior](self, "menuItemBehavior");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v117[3] = v76;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 4);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPlatterMenuDynamicsController platterItem](self, "platterItem");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v116[0] = v78;
        -[_UIPlatterMenuDynamicsController menuView](self, "menuView");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v116[1] = v79;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 2);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = self;
        v82 = v77;
        v83 = v80;
        v84 = 0;
LABEL_20:
        -[_UIPlatterMenuDynamicsController beginTransitionWithAnimatorUsingBehaviors:observedItems:stateIfCompleted:](v81, "beginTransitionWithAnimatorUsingBehaviors:observedItems:stateIfCompleted:", v82, v83, v84);

      }
LABEL_22:

      return;
    default:
      goto LABEL_22;
  }
}

- (void)beginTransitionWithAnimatorUsingBehaviors:(id)a3 observedItems:(id)a4 stateIfCompleted:(int64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _UIDynamicItemObservingBehavior *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17[2];
  id location;
  _QWORD v19[5];

  v8 = a3;
  v9 = a4;
  -[_UIPlatterMenuDynamicsController stopObservingBehavior](self, "stopObservingBehavior");
  -[_UIPlatterMenuDynamicsController resetAnimatorToDefaultBehaviors](self, "resetAnimatorToDefaultBehaviors");
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __109___UIPlatterMenuDynamicsController_beginTransitionWithAnimatorUsingBehaviors_observedItems_stateIfCompleted___block_invoke;
  v19[3] = &unk_1E16DA710;
  v19[4] = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v19);
  objc_initWeak(&location, self);
  v11 = -[UIDynamicItemBehavior initWithItems:]([_UIDynamicItemObservingBehavior alloc], "initWithItems:", v9);
  -[_UIPlatterMenuDynamicsController setObservingBehavior:](self, "setObservingBehavior:", v11);

  -[_UIPlatterMenuDynamicsController observingBehavior](self, "observingBehavior");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTargetVelocity:", 50.0, 50.0);

  -[_UIPlatterMenuDynamicsController observingBehavior](self, "observingBehavior");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCompletionHandlerInvocationDelay:", 0.1);

  objc_copyWeak(v17, &location);
  v17[1] = (id)a5;
  -[_UIPlatterMenuDynamicsController observingBehavior](self, "observingBehavior", v10, 3221225472, __109___UIPlatterMenuDynamicsController_beginTransitionWithAnimatorUsingBehaviors_observedItems_stateIfCompleted___block_invoke_2, &unk_1E16C0530);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCompletionHandler:", &v16);

  -[_UIPlatterMenuDynamicsController observingBehavior](self, "observingBehavior");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController addBehaviorIfNotPresent:](self, "addBehaviorIfNotPresent:", v15);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

}

- (CGVector)modifiedOffsetForPosition:(CGPoint)a3 offset:(CGVector)a4 touchPosition:(CGPoint)a5 axisLock:(unint64_t)a6
{
  double y;
  double x;
  double dy;
  double dx;
  double v11;
  double v12;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int64_t v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  CGVector result;

  y = a5.y;
  x = a5.x;
  dy = a4.dy;
  dx = a4.dx;
  v11 = a3.y;
  v12 = a3.x;
  -[_UIPlatterMenuDynamicsController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!a6)
    goto LABEL_25;
  v16 = 1.0;
  if (a6 == 1)
  {
    objc_msgSend(v14, "centerForPlatterWithMenuViewDismissed");
    v22 = v21;
    -[_UIPlatterMenuDynamicsController _updateSwipeEdgeMultipliersIfNeededForTouchPosition:](self, "_updateSwipeEdgeMultipliersIfNeededForTouchPosition:", x, y);
    if (v12 <= v22)
    {
      if (v12 >= v22)
        goto LABEL_20;
      objc_msgSend(v15, "trailingSwipeActionView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        v18 = 1.0;
        if (dx < 0.0)
          v16 = 4.0;
        else
          v16 = 1.0;
        goto LABEL_21;
      }
      -[_UIPlatterMenuDynamicsController trailingSwipeEdgeMultiplier](self, "trailingSwipeEdgeMultiplier");
      v18 = 1.0;
      if (v27 <= 2.22044605e-16)
        goto LABEL_21;
      -[_UIPlatterMenuDynamicsController trailingSwipeEdgeMultiplier](self, "trailingSwipeEdgeMultiplier");
    }
    else
    {
      objc_msgSend(v15, "leadingSwipeActionView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        v18 = 1.0;
        if (dx > 0.0)
          v16 = 4.0;
        else
          v16 = 1.0;
        goto LABEL_21;
      }
      -[_UIPlatterMenuDynamicsController leadingSwipeEdgeMultiplier](self, "leadingSwipeEdgeMultiplier");
      v18 = 1.0;
      if (v24 <= 2.22044605e-16)
        goto LABEL_21;
      -[_UIPlatterMenuDynamicsController leadingSwipeEdgeMultiplier](self, "leadingSwipeEdgeMultiplier");
    }
    v18 = 1.0;
    v16 = 1.0 / v25;
    goto LABEL_21;
  }
  if (a6 != 2)
  {
LABEL_20:
    v18 = 1.0;
    goto LABEL_21;
  }
  objc_msgSend(v14, "centerForPlatterWithMenuViewPresented");
  if (v11 >= v17 || (v18 = 2.25, dy >= 0.0))
  {
    objc_msgSend(v15, "centerForPlatterWithMenuViewDismissed");
    if (v11 > v19 && dy > 0.0)
    {
      v20 = -[_UIPlatterMenuDynamicsController state](self, "state");
      v18 = 2.25;
      if (v20 != 2)
        v18 = 15.0;
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_21:
  if (fabs(v18 + -1.0) <= 2.22044605e-16)
  {
    if (fabs(v16 + -1.0) > 2.22044605e-16)
      dx = dx / v16;
  }
  else
  {
    dy = dy / v18;
  }
LABEL_25:

  v28 = dx;
  v29 = dy;
  result.dy = v29;
  result.dx = v28;
  return result;
}

- (CGPoint)centerForMenuPresentedRelativeToCurrentPlatter
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;
  CGRect v21;
  CGRect v22;

  -[_UIPlatterMenuDynamicsController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController animator](self, "animator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController platterItem](self, "platterItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateItemFromCurrentState:", v5);

  -[_UIPlatterMenuDynamicsController centerForCurrentPlatterPosition](self, "centerForCurrentPlatterPosition");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v3, "centerForMenuPresented");
  v11 = v10;
  -[_UIPlatterMenuDynamicsController platterView](self, "platterView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v13 = v9 + CGRectGetHeight(v21) * 0.5;
  objc_msgSend(v3, "minimumSpacingBetweenPlatterAndMenu");
  v15 = v14 + v13;
  -[_UIPlatterMenuDynamicsController menuView](self, "menuView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v17 = v15 + CGRectGetHeight(v22) * 0.5;

  if (v17 < v11)
    v17 = v11;

  v18 = v7;
  v19 = v17;
  result.y = v19;
  result.x = v18;
  return result;
}

- (CGPoint)centerForCurrentPlatterPosition
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  -[_UIPlatterMenuDynamicsController animator](self, "animator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "referenceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIPlatterMenuDynamicsController platterView](self, "platterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "center");
  v7 = v6;
  v9 = v8;
  -[_UIPlatterMenuDynamicsController platterView](self, "platterView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertPoint:fromView:", v11, v7, v9);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGPoint)platterCenter
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  -[_UIPlatterMenuDynamicsController animator](self, "animator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "referenceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController platterView](self, "platterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "center");
  v7 = v6;
  v9 = v8;
  -[_UIPlatterMenuDynamicsController platterView](self, "platterView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertPoint:fromView:", v11, v7, v9);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGPoint)menuCenter
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  -[_UIPlatterMenuDynamicsController animator](self, "animator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "referenceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController menuView](self, "menuView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "center");
  v7 = v6;
  v9 = v8;
  -[_UIPlatterMenuDynamicsController menuView](self, "menuView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertPoint:fromView:", v11, v7, v9);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)resetAnimatorToDefaultBehaviors
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController animator](self, "animator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "behaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67___UIPlatterMenuDynamicsController_resetAnimatorToDefaultBehaviors__block_invoke;
  v9[3] = &unk_1E16DA738;
  v9[4] = self;
  v10 = v3;
  v7 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __67___UIPlatterMenuDynamicsController_resetAnimatorToDefaultBehaviors__block_invoke_2;
  v8[3] = &unk_1E16DA710;
  v8[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

- (void)addBehaviorIfNotPresent:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UIPlatterMenuDynamicsController animator](self, "animator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "behaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v8);

  if ((v6 & 1) == 0)
  {
    -[_UIPlatterMenuDynamicsController animator](self, "animator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addBehavior:", v8);

  }
}

- (BOOL)isDefaultAnimatorBehavior:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  BOOL v9;

  v4 = a3;
  -[_UIPlatterMenuDynamicsController platterMenuCollisionBounds](self, "platterMenuCollisionBounds");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    v9 = 1;
  }
  else
  {
    -[_UIPlatterMenuDynamicsController menuVerticalLockAttachment](self, "menuVerticalLockAttachment");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v4)
    {
      v9 = 1;
    }
    else
    {
      -[_UIPlatterMenuDynamicsController noRotationBehavior](self, "noRotationBehavior");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7 == v4)
      {
        v9 = 1;
      }
      else
      {
        -[_UIPlatterMenuDynamicsController gestureAttachmentBehavior](self, "gestureAttachmentBehavior");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        v9 = v8 == v4;

      }
    }

  }
  return v9;
}

- (_UIPlatterMenuPanningTransformer)panningLockTransformer
{
  _UIPlatterMenuPanningTransformer *panningLockTransformer;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _UIPlatterMenuPanningTransformer *v9;
  _UIPlatterMenuPanningTransformer *v10;

  panningLockTransformer = self->_panningLockTransformer;
  if (!panningLockTransformer)
  {
    -[_UIPlatterMenuDynamicsController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerForPlatterWithMenuViewDismissed");
    v6 = v5;
    v8 = v7;

    +[_UIPlatterMenuPanningTransformer transformerWithAxisTransitionZonePosition:axisTransitionZoneSize:](_UIPlatterMenuPanningTransformer, "transformerWithAxisTransitionZonePosition:axisTransitionZoneSize:", v6, v8, 20.0, 20.0);
    v9 = (_UIPlatterMenuPanningTransformer *)objc_claimAutoreleasedReturnValue();
    v10 = self->_panningLockTransformer;
    self->_panningLockTransformer = v9;

    -[_UIPlatterMenuPanningTransformer setDelegate:](self->_panningLockTransformer, "setDelegate:", self);
    -[_UIPlatterMenuPanningTransformer setMinimumXVelocityForAxisLock:](self->_panningLockTransformer, "setMinimumXVelocityForAxisLock:", 70.0);
    panningLockTransformer = self->_panningLockTransformer;
  }
  return panningLockTransformer;
}

- (void)_positionSwipeActionViewsForCurrentPlatterViewPosition
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  void *v23;
  double Width;
  double v25;
  void *v26;
  double v27;
  double v28;
  id v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  -[_UIPlatterMenuDynamicsController delegate](self, "delegate");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingSwipeActionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "initialCenterForLeadingSwipeActionView");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v29, "trailingSwipeActionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "initialCenterForTrailingSwipeActionView");
  v10 = v9;
  v12 = v11;
  -[_UIPlatterMenuDynamicsController platterView](self, "platterView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  if (v3)
  {
    v30.origin.x = v15;
    v30.origin.y = v17;
    v30.size.width = v19;
    v30.size.height = v21;
    v22 = CGRectGetMinX(v30) * 0.5;
    if (v22 < v5)
      v22 = v5;
    objc_msgSend(v29, "platterMenuDynamicsController:didMoveSwipeView:toPosition:", self, v3, v22, v7);
  }
  if (v8)
  {
    -[_UIPlatterMenuDynamicsController containerView](self, "containerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    Width = CGRectGetWidth(v31);
    v32.origin.x = v15;
    v32.origin.y = v17;
    v32.size.width = v19;
    v32.size.height = v21;
    v25 = Width - CGRectGetMaxX(v32);

    -[_UIPlatterMenuDynamicsController containerView](self, "containerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bounds");
    v27 = CGRectGetWidth(v33) + v25 * -0.5;

    if (v27 <= v10)
      v28 = v27;
    else
      v28 = v10;
    objc_msgSend(v29, "platterMenuDynamicsController:didMoveSwipeView:toPosition:", self, v8, v28, v12);
  }

}

- (void)_updateSwipeEdgeMultipliersIfNeededForTouchPosition:(CGPoint)a3
{
  double x;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double Width;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;

  x = a3.x;
  -[_UIPlatterMenuDynamicsController setLeadingSwipeEdgeMultiplier:](self, "setLeadingSwipeEdgeMultiplier:", 1.0, a3.y);
  -[_UIPlatterMenuDynamicsController setTrailingSwipeEdgeMultiplier:](self, "setTrailingSwipeEdgeMultiplier:", 1.0);
  -[_UIPlatterMenuDynamicsController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerForPlatterWithMenuViewDismissed");
  v7 = v6;

  -[_UIPlatterMenuDynamicsController platterView](self, "platterView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "center");
  v10 = v9;

  if (v10 >= v7)
  {
    if (v10 > v7)
    {
      -[_UIPlatterMenuDynamicsController containerView](self, "containerView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      Width = CGRectGetWidth(v21);

      -[_UIPlatterMenuDynamicsController platterView](self, "platterView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      v16 = CGRectGetWidth(v22);
      -[_UIPlatterMenuDynamicsController platterView](self, "platterView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "center");
      v19 = v16 - v18 + 88.0;

      v20 = Width - x;
      if (Width - x < 10.0)
        v20 = 10.0;
      if (v19 > v20)
        -[_UIPlatterMenuDynamicsController setLeadingSwipeEdgeMultiplier:](self, "setLeadingSwipeEdgeMultiplier:", v19 / v20);
    }
  }
  else
  {
    v11 = v10 + 88.0;
    v12 = 10.0;
    if (x >= 10.0)
      v12 = x;
    if (v11 > v12)
      -[_UIPlatterMenuDynamicsController setTrailingSwipeEdgeMultiplier:](self, "setTrailingSwipeEdgeMultiplier:", v11 / v12);
  }
}

- (BOOL)_isPlatterInYLockedPosition
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  -[_UIPlatterMenuDynamicsController animator](self, "animator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuDynamicsController platterItem](self, "platterItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateItemFromCurrentState:", v4);

  -[_UIPlatterMenuDynamicsController platterView](self, "platterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "center");
  v7 = v6;
  -[_UIPlatterMenuDynamicsController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerForPlatterWithMenuViewDismissed");
  LOBYTE(v4) = vabdd_f64(v7, v9) < 2.0;

  return (char)v4;
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
  -[_UIPlatterMenuDynamicsController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UIStatesFeedbackGenerator initWithConfiguration:view:](v4, "initWithConfiguration:view:", v7, v5);
  -[_UIPlatterMenuDynamicsController setSwipeFeedbackGenerator:](self, "setSwipeFeedbackGenerator:", v6);

}

- (void)_activateFeedbackIfNeeded
{
  void *v3;
  char v4;
  id v5;

  -[_UIPlatterMenuDynamicsController swipeFeedbackGenerator](self, "swipeFeedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActive");

  if ((v4 & 1) == 0)
  {
    -[_UIPlatterMenuDynamicsController swipeFeedbackGenerator](self, "swipeFeedbackGenerator");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activateWithCompletionBlock:", 0);

  }
}

- (void)_deactivateFeedbackIfNeeded
{
  void *v3;
  int v4;
  id v5;

  -[_UIPlatterMenuDynamicsController swipeFeedbackGenerator](self, "swipeFeedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActive");

  if (v4)
  {
    -[_UIPlatterMenuDynamicsController swipeFeedbackGenerator](self, "swipeFeedbackGenerator");
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
  -[_UIPlatterMenuDynamicsController swipeFeedbackGenerator](self, "swipeFeedbackGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isActive");

  if (v8)
  {
    if (v4 && !v5)
    {
      -[_UIPlatterMenuDynamicsController swipeFeedbackGenerator](self, "swipeFeedbackGenerator");
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
      -[_UIPlatterMenuDynamicsController swipeFeedbackGenerator](self, "swipeFeedbackGenerator");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      +[_UIStatesFeedbackGeneratorSwipeActionConfiguration openState](_UIStatesFeedbackGeneratorSwipeActionConfiguration, "openState");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
}

- (void)setLeadingSwipeActionViewSelected:(BOOL)a3
{
  _BOOL8 leadingSwipeActionViewSelected;

  leadingSwipeActionViewSelected = self->_leadingSwipeActionViewSelected;
  self->_leadingSwipeActionViewSelected = a3;
  -[_UIPlatterMenuDynamicsController _fireConfirmFeedbackIfNeededForInitialSelectionState:finalSelectionState:](self, "_fireConfirmFeedbackIfNeededForInitialSelectionState:finalSelectionState:", leadingSwipeActionViewSelected);
}

- (void)setTrailingSwipeActionViewSelected:(BOOL)a3
{
  _BOOL8 trailingSwipeActionViewSelected;

  trailingSwipeActionViewSelected = self->_trailingSwipeActionViewSelected;
  self->_trailingSwipeActionViewSelected = a3;
  -[_UIPlatterMenuDynamicsController _fireConfirmFeedbackIfNeededForInitialSelectionState:finalSelectionState:](self, "_fireConfirmFeedbackIfNeededForInitialSelectionState:finalSelectionState:", trailingSwipeActionViewSelected);
}

- (BOOL)leadingSwipeActionViewSelected
{
  return self->_leadingSwipeActionViewSelected;
}

- (BOOL)trailingSwipeActionViewSelected
{
  return self->_trailingSwipeActionViewSelected;
}

- (_UIPlatterMenuDynamicsControllerDelegate)delegate
{
  return (_UIPlatterMenuDynamicsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)containerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_containerView);
}

- (void)setContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_containerView, a3);
}

- (UIView)platterView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_platterView);
}

- (void)setPlatterView:(id)a3
{
  objc_storeWeak((id *)&self->_platterView, a3);
}

- (UIView)menuView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_menuView);
}

- (void)setMenuView:(id)a3
{
  objc_storeWeak((id *)&self->_menuView, a3);
}

- (UIDynamicItem)platterItem
{
  return (UIDynamicItem *)objc_loadWeakRetained((id *)&self->_platterItem);
}

- (void)setPlatterItem:(id)a3
{
  objc_storeWeak((id *)&self->_platterItem, a3);
}

- (void)setPanningLockTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_panningLockTransformer, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (CGPoint)initialTouchPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialTouchPoint.x;
  y = self->_initialTouchPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialTouchPoint:(CGPoint)a3
{
  self->_initialTouchPoint = a3;
}

- (double)leadingSwipeEdgeMultiplier
{
  return self->_leadingSwipeEdgeMultiplier;
}

- (void)setLeadingSwipeEdgeMultiplier:(double)a3
{
  self->_leadingSwipeEdgeMultiplier = a3;
}

- (double)trailingSwipeEdgeMultiplier
{
  return self->_trailingSwipeEdgeMultiplier;
}

- (void)setTrailingSwipeEdgeMultiplier:(double)a3
{
  self->_trailingSwipeEdgeMultiplier = a3;
}

- (BOOL)isCurrentlyUnderDirectManipulation
{
  return self->_isCurrentlyUnderDirectManipulation;
}

- (void)setIsCurrentlyUnderDirectManipulation:(BOOL)a3
{
  self->_isCurrentlyUnderDirectManipulation = a3;
}

- (UIDynamicAnimator)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_animator, a3);
}

- (UIDynamicItemBehavior)menuItemBehavior
{
  return self->_menuItemBehavior;
}

- (void)setMenuItemBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_menuItemBehavior, a3);
}

- (UIDynamicItemBehavior)platterItemBehavior
{
  return self->_platterItemBehavior;
}

- (void)setPlatterItemBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_platterItemBehavior, a3);
}

- (UIAttachmentBehavior)platterMenuSlidingAttachmentBehavior
{
  return self->_platterMenuSlidingAttachmentBehavior;
}

- (void)setPlatterMenuSlidingAttachmentBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_platterMenuSlidingAttachmentBehavior, a3);
}

- (UIAttachmentBehavior)platterMenuAttachmentBehavior
{
  return self->_platterMenuAttachmentBehavior;
}

- (void)setPlatterMenuAttachmentBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_platterMenuAttachmentBehavior, a3);
}

- (UIAttachmentBehavior)gestureAttachmentBehavior
{
  return self->_gestureAttachmentBehavior;
}

- (void)setGestureAttachmentBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_gestureAttachmentBehavior, a3);
}

- (_UIPlatterMenuSnapBehavior)platterSnapBehavior
{
  return self->_platterSnapBehavior;
}

- (void)setPlatterSnapBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_platterSnapBehavior, a3);
}

- (_UIPlatterMenuSnapBehavior)menuPresentedSnapBehavior
{
  return self->_menuPresentedSnapBehavior;
}

- (void)setMenuPresentedSnapBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_menuPresentedSnapBehavior, a3);
}

- (_UIPlatterMenuSnapBehavior)menuDismissedSnapBehavior
{
  return self->_menuDismissedSnapBehavior;
}

- (void)setMenuDismissedSnapBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_menuDismissedSnapBehavior, a3);
}

- (UIDynamicItemBehavior)noRotationBehavior
{
  return self->_noRotationBehavior;
}

- (void)setNoRotationBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_noRotationBehavior, a3);
}

- (UIAttachmentBehavior)menuVerticalLockAttachment
{
  return self->_menuVerticalLockAttachment;
}

- (void)setMenuVerticalLockAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_menuVerticalLockAttachment, a3);
}

- (UICollisionBehavior)platterMenuCollisionBounds
{
  return self->_platterMenuCollisionBounds;
}

- (void)setPlatterMenuCollisionBounds:(id)a3
{
  objc_storeStrong((id *)&self->_platterMenuCollisionBounds, a3);
}

- (_UIDynamicItemObservingBehavior)observingBehavior
{
  return self->_observingBehavior;
}

- (void)setObservingBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_observingBehavior, a3);
}

- (int64_t)didPresentCount
{
  return self->_didPresentCount;
}

- (void)setDidPresentCount:(int64_t)a3
{
  self->_didPresentCount = a3;
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
  objc_storeStrong((id *)&self->_observingBehavior, 0);
  objc_storeStrong((id *)&self->_platterMenuCollisionBounds, 0);
  objc_storeStrong((id *)&self->_menuVerticalLockAttachment, 0);
  objc_storeStrong((id *)&self->_noRotationBehavior, 0);
  objc_storeStrong((id *)&self->_menuDismissedSnapBehavior, 0);
  objc_storeStrong((id *)&self->_menuPresentedSnapBehavior, 0);
  objc_storeStrong((id *)&self->_platterSnapBehavior, 0);
  objc_storeStrong((id *)&self->_gestureAttachmentBehavior, 0);
  objc_storeStrong((id *)&self->_platterMenuAttachmentBehavior, 0);
  objc_storeStrong((id *)&self->_platterMenuSlidingAttachmentBehavior, 0);
  objc_storeStrong((id *)&self->_platterItemBehavior, 0);
  objc_storeStrong((id *)&self->_menuItemBehavior, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_panningLockTransformer, 0);
  objc_destroyWeak((id *)&self->_platterItem);
  objc_destroyWeak((id *)&self->_menuView);
  objc_destroyWeak((id *)&self->_platterView);
  objc_destroyWeak((id *)&self->_containerView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
