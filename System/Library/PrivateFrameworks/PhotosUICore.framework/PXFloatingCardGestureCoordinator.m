@implementation PXFloatingCardGestureCoordinator

- (PXFloatingCardGestureCoordinator)initWithCardViewController:(id)a3 layout:(id)a4
{
  id v6;
  id v7;
  PXFloatingCardGestureCoordinator *v8;
  PXFloatingCardGestureCoordinator *v9;
  PXFloatingCardAnimationManager *v10;
  PXFloatingCardAnimationManager *animationManager;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXFloatingCardGestureCoordinator;
  v8 = -[PXFloatingCardGestureCoordinator init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_cardViewController, v6);
    objc_storeWeak((id *)&v9->_layout, v7);
    v10 = objc_alloc_init(PXFloatingCardAnimationManager);
    animationManager = v9->_animationManager;
    v9->_animationManager = v10;

    v9->_isDragging = 0;
  }

  return v9;
}

- (void)_addGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  UIPanGestureRecognizer *v6;
  void *v7;
  void *v8;
  UIPanGestureRecognizer *positionGestureRecognizer;
  id obj;

  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel_handleHeightGesture_);
  objc_msgSend(obj, "setDelegate:", self);
  objc_msgSend(obj, "setMaximumNumberOfTouches:", 1);
  -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", obj);

  objc_storeStrong((id *)&self->_heightGestureRecognizer, obj);
  -[PXFloatingCardGestureCoordinator layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "canDrag");

  if ((_DWORD)v4)
  {
    v6 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel_handlePositionGesture_);
    -[UIPanGestureRecognizer setDelegate:](v6, "setDelegate:", self);
    -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addGestureRecognizer:", v6);

    positionGestureRecognizer = self->_positionGestureRecognizer;
    self->_positionGestureRecognizer = v6;

  }
}

- (void)_removeGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PXFloatingCardGestureCoordinator heightGestureRecognizer](self, "heightGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFloatingCardGestureCoordinator heightGestureRecognizer](self, "heightGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeGestureRecognizer:", v6);

    -[PXFloatingCardGestureCoordinator setHeightGestureRecognizer:](self, "setHeightGestureRecognizer:", 0);
  }
  -[PXFloatingCardGestureCoordinator positionGestureRecognizer](self, "positionGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFloatingCardGestureCoordinator positionGestureRecognizer](self, "positionGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeGestureRecognizer:", v10);

    -[PXFloatingCardGestureCoordinator setPositionGestureRecognizer:](self, "setPositionGestureRecognizer:", 0);
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFloatingCardGestureCoordinator heightGestureRecognizer](self, "heightGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGestureRecognizer:", v5);

  -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFloatingCardGestureCoordinator positionGestureRecognizer](self, "positionGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeGestureRecognizer:", v8);

  v9.receiver = self;
  v9.super_class = (Class)PXFloatingCardGestureCoordinator;
  -[PXFloatingCardGestureCoordinator dealloc](&v9, sel_dealloc);
}

- (void)layoutDidChange
{
  -[PXFloatingCardGestureCoordinator _removeGestureRecognizers](self, "_removeGestureRecognizers");
  -[PXFloatingCardGestureCoordinator _addGestureRecognizers](self, "_addGestureRecognizers");
}

- (void)dragBegan
{
  void *v3;
  char v4;
  id v5;

  -[PXFloatingCardGestureCoordinator setIsDragging:](self, "setIsDragging:", 1);
  -[PXFloatingCardGestureCoordinator setTopRubberBandRange:](self, "setTopRubberBandRange:", 15.0);
  -[PXFloatingCardGestureCoordinator setBottomRubberBandRange:](self, "setBottomRubberBandRange:", 15.0);
  -[PXFloatingCardGestureCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PXFloatingCardGestureCoordinator delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gestureCoordinatorDidBeginInteraction:", self);

  }
}

- (void)dragChangedWithVerticalDelta:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;

  -[PXFloatingCardGestureCoordinator heightForRubberBandHeight:](self, "heightForRubberBandHeight:", v7);
  -[PXFloatingCardGestureCoordinator rubberBandHeightForHeight:](self, "rubberBandHeightForHeight:", v8 + a3);
  -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale();
  v12 = v11;

  -[PXFloatingCardGestureCoordinator updateCardHeightConstraintWithHeight:](self, "updateCardHeightConstraintWithHeight:", v12);
}

- (void)dragEndedWithAnimation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  v19 = a3;
  -[PXFloatingCardGestureCoordinator setIsDragging:](self, "setIsDragging:", 0);
  -[PXFloatingCardGestureCoordinator heightGestureRecognizer](self, "heightGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "velocityInView:", v6);
  v8 = v7;

  -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10;

  -[PXFloatingCardGestureCoordinator projectionWithVelocity:decelerationRate:](self, "projectionWithVelocity:decelerationRate:", v8, *MEMORY[0x1E0DC5360]);
  -[PXFloatingCardGestureCoordinator closestHeightForProjectedHeight:](self, "closestHeightForProjectedHeight:", v11 + v12);
  v14 = v13;
  if (v13 == v11)
    v15 = 0.0;
  else
    v15 = v8 / (v13 - v11);
  v16 = (uint64_t)v19;
  if (!v19)
  {
    +[PXFloatingCardAnimation animationWithMass:stiffness:damping:initialVelocity:delay:](PXFloatingCardAnimation, "animationWithMass:stiffness:damping:initialVelocity:delay:", 1.0, dbl_1A7C0C230[v15 > 4.0], dbl_1A7C0C240[v15 > 4.0]);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (id)v16;
  -[PXFloatingCardGestureCoordinator animationManager](self, "animationManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pushHeightAnimation:", v20);

  -[PXFloatingCardGestureCoordinator snapToHeight:](self, "snapToHeight:", v14);
  -[PXFloatingCardGestureCoordinator animationManager](self, "animationManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "popHeightAnimation");

}

- (double)closestHeightForProjectedHeight:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  double v9;
  _QWORD v11[7];
  _QWORD v12[4];
  uint64_t v13;
  double *v14;
  uint64_t v15;
  double v16;

  -[PXFloatingCardGestureCoordinator layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snappableHeights");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v13 = 0;
    v14 = (double *)&v13;
    v15 = 0x2020000000;
    v16 = 0.0;
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;

    v16 = v8;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = 0x7FEFFFFFFFFFFFFFLL;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__PXFloatingCardGestureCoordinator_closestHeightForProjectedHeight___block_invoke;
    v11[3] = &unk_1E51321E0;
    *(double *)&v11[6] = a3;
    v11[4] = v12;
    v11[5] = &v13;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);
    v9 = v14[3];
    _Block_object_dispose(v12, 8);
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (void)updateCardHeightConstraintWithHeight:(double)a3
{
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
  double v16;
  id v17;

  -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;

  if (v7 != a3)
  {
    -[PXFloatingCardGestureCoordinator maximumHeight](self, "maximumHeight");
    v9 = v8;
    -[PXFloatingCardGestureCoordinator minimumHeight](self, "minimumHeight");
    v11 = v10;
    -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "size");
    v14 = v13;

    if (v11 > a3 || v9 < a3)
    {
      if (v11 <= a3)
      {
        if (v9 >= a3)
          return;
        -[PXFloatingCardGestureCoordinator heightForRubberBandHeight:](self, "heightForRubberBandHeight:", a3);
        if (v16 <= a3)
          a3 = v16;
        if (!-[PXFloatingCardGestureCoordinator isDragging](self, "isDragging"))
          a3 = v9;
      }
      else
      {
        -[PXFloatingCardGestureCoordinator heightForRubberBandHeight:](self, "heightForRubberBandHeight:", a3);
        if (v15 > a3)
          a3 = v15;
        if (!-[PXFloatingCardGestureCoordinator isDragging](self, "isDragging"))
          a3 = v11;
      }
    }
    -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSize:", v14, a3);

  }
}

- (void)snapToHeight:(double)a3
{
  void *v5;
  void *v6;
  _QWORD v7[6];
  _QWORD v8[6];

  -[PXFloatingCardGestureCoordinator animationManager](self, "animationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "heightAnimation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__PXFloatingCardGestureCoordinator_snapToHeight___block_invoke;
  v8[3] = &unk_1E5144EB8;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__PXFloatingCardGestureCoordinator_snapToHeight___block_invoke_2;
  v7[3] = &unk_1E5142B00;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  objc_msgSend(v6, "applyAnimations:completion:", v8, v7);

}

- (double)minimumHeight
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;

  -[PXFloatingCardGestureCoordinator layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snappableHeights");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    return 0.0;
  -[PXFloatingCardGestureCoordinator layout](self, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "snappableHeights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  return v10;
}

- (double)maximumHeight
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;

  -[PXFloatingCardGestureCoordinator layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snappableHeights");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    return 0.0;
  -[PXFloatingCardGestureCoordinator layout](self, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "snappableHeights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  return v10;
}

- (void)handlePositionGesture:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
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
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;

  v27 = a3;
  v4 = objc_msgSend(v27, "state");
  if ((unint64_t)(v4 - 3) < 3)
  {
    -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "velocityInView:", v7);
    v9 = v8;
    v11 = v10;
    v12 = *MEMORY[0x1E0DC5368];
    objc_msgSend(v6, "center");
    v14 = v13;
    -[PXFloatingCardGestureCoordinator projectionWithVelocity:decelerationRate:](self, "projectionWithVelocity:decelerationRate:", v9, v12);
    v16 = v14 + v15;
    objc_msgSend(v6, "center");
    v18 = v17;
    -[PXFloatingCardGestureCoordinator projectionWithVelocity:decelerationRate:](self, "projectionWithVelocity:decelerationRate:", v11, v12);
    -[PXFloatingCardGestureCoordinator _handlePositionGestureEnded:](self, "_handlePositionGestureEnded:", v16, v18 + v19);
LABEL_5:

    goto LABEL_6;
  }
  if ((unint64_t)(v4 - 1) <= 1)
  {
    -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "translationInView:", v7);
    v22 = v21;
    v24 = v23;
    objc_msgSend(v6, "center");
    objc_msgSend(v6, "setCenter:", v22 + v25, v24 + v26);
    objc_msgSend(v27, "setTranslation:inView:", v7, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    goto LABEL_5;
  }
LABEL_6:

}

- (double)projectionWithVelocity:(double)a3 decelerationRate:(double)a4
{
  return a3 / 1000.0 * a4 / (1.0 - a4);
}

- (void)_handlePositionGestureEnded:(CGPoint)a3
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];
  _QWORD v8[7];

  v4 = -[PXFloatingCardGestureCoordinator closestPositionToProjectedCenter:](self, "closestPositionToProjectedCenter:", a3.x, a3.y);
  -[PXFloatingCardGestureCoordinator centerPointForPosition:](self, "centerPointForPosition:", v4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__PXFloatingCardGestureCoordinator__handlePositionGestureEnded___block_invoke;
  v8[3] = &unk_1E5149060;
  v8[4] = self;
  v8[5] = v5;
  v8[6] = v6;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PXFloatingCardGestureCoordinator__handlePositionGestureEnded___block_invoke_2;
  v7[3] = &unk_1E5142B00;
  v7[4] = self;
  v7[5] = v4;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0x10000, v8, v7, 0.3, 0.0, 1.0, 1.0);
}

- (CGPoint)centerPointForPosition:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double MaxX;
  double MinX;
  double MaxY;
  double MinY;
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
  CGPoint result;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bounds");
  v36 = v8;
  v37 = v7;
  objc_msgSend(v6, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeAreaLayoutGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v39.origin.x = v12;
  v39.origin.y = v14;
  v39.size.width = v16;
  v39.size.height = v18;
  MaxX = CGRectGetMaxX(v39);
  v40.origin.x = v12;
  v40.origin.y = v14;
  v40.size.width = v16;
  v40.size.height = v18;
  MinX = CGRectGetMinX(v40);
  v41.origin.x = v12;
  v41.origin.y = v14;
  v41.size.width = v16;
  v41.size.height = v18;
  MaxY = CGRectGetMaxY(v41);
  v42.origin.x = v12;
  v42.origin.y = v14;
  v42.size.width = v16;
  v42.size.height = v18;
  MinY = CGRectGetMinY(v42);
  -[PXFloatingCardGestureCoordinator layout](self, "layout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "insets");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = v37 * 0.5;
  v33 = v36 * 0.5;
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      v27 = MaxX - v31 - v32;
      goto LABEL_4;
    case 1uLL:
      v27 = v32 + MinX + v27;
LABEL_4:
      v31 = v33 + MinY + v25;
      break;
    case 3uLL:
      v27 = v32 + MinX + v27;
      goto LABEL_7;
    case 4uLL:
      v27 = MaxX - v31 - v32;
LABEL_7:
      v31 = MaxY - v29 - v33;
      break;
    default:
      break;
  }

  v34 = v27;
  v35 = v31;
  result.y = v35;
  result.x = v34;
  return result;
}

- (unint64_t)closestPositionToProjectedCenter:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double MidX;
  double MidY;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  CGRect v23;
  CGRect v24;

  y = a3.y;
  x = a3.x;
  -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutFrame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v23.origin.x = v10;
  v23.origin.y = v12;
  v23.size.width = v14;
  v23.size.height = v16;
  MidX = CGRectGetMidX(v23);
  v24.origin.x = v10;
  v24.origin.y = v12;
  v24.size.width = v14;
  v24.size.height = v16;
  MidY = CGRectGetMidY(v24);
  v19 = 4;
  if (y < MidY)
    v19 = 2;
  v20 = 3;
  if (y < MidY)
    v20 = 1;
  if (x >= MidX)
    v21 = v19;
  else
    v21 = v20;

  return v21;
}

- (void)handleHeightGesture:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v16 = a3;
  v4 = objc_msgSend(v16, "state");
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 == 2)
    {
      -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "translationInView:", v9);
      v11 = v10;
      v13 = v12;

      -[PXFloatingCardGestureCoordinator previousPanTranslation](self, "previousPanTranslation");
      v15 = v14 - v13;
      -[PXFloatingCardGestureCoordinator setPreviousPanTranslation:](self, "setPreviousPanTranslation:", v11, v13);
      -[PXFloatingCardGestureCoordinator dragChangedWithVerticalDelta:](self, "dragChangedWithVerticalDelta:", -v15);
    }
    else if (v4 == 1)
    {
      -[PXFloatingCardGestureCoordinator dragBegan](self, "dragBegan");
      -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeAllAnimations");

      -[PXFloatingCardGestureCoordinator setPreviousPanTranslation:](self, "setPreviousPanTranslation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    }
  }
  else
  {
    -[PXFloatingCardGestureCoordinator dragEndedWithAnimation:](self, "dragEndedWithAnimation:", 0);
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  CGPoint v24;
  CGRect v25;

  v6 = a4;
  v7 = a3;
  -[PXFloatingCardGestureCoordinator heightGestureRecognizer](self, "heightGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "grabAreaBounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "backgroundView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", v20);
    v24.x = v21;
    v24.y = v22;
    v25.origin.x = v12;
    v25.origin.y = v14;
    v25.size.width = v16;
    v25.size.height = v18;
    v9 = CGRectContainsPoint(v25, v24);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  -[PXFloatingCardGestureCoordinator heightGestureRecognizer](self, "heightGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v6)
  {

LABEL_6:
    v14 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v7, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFloatingCardGestureCoordinator cardViewController](self, "cardViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isDescendantOfView:", v12);

  if ((v13 & 1) == 0)
    goto LABEL_6;
  v14 = 1;
LABEL_7:

  return v14;
}

- (double)applyRubberBandToValue:(double)a3 withRange:(double)a4
{
  double v4;
  double v5;

  v4 = a4 + a3 * 0.550000012;
  v5 = 0.0;
  if (fabs(v4) >= 2.22044605e-16)
    return a4 * 0.550000012 * a3 / v4;
  return v5;
}

- (double)unapplyRubberBandToValue:(double)a3 withRange:(double)a4
{
  double v4;
  double v5;

  v4 = (a4 - a3) * 0.550000012;
  v5 = 0.0;
  if (fabs(v4) >= 2.22044605e-16)
    return a3 * a4 / v4;
  return v5;
}

- (double)rubberBandHeightForHeight:(double)a3
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

  -[PXFloatingCardGestureCoordinator minimumHeight](self, "minimumHeight");
  v6 = v5;
  -[PXFloatingCardGestureCoordinator maximumHeight](self, "maximumHeight");
  if (v7 >= a3)
  {
    if (v6 > a3)
    {
      -[PXFloatingCardGestureCoordinator topRubberBandRange](self, "topRubberBandRange");
      -[PXFloatingCardGestureCoordinator applyRubberBandToValue:withRange:](self, "applyRubberBandToValue:withRange:", v6 - a3, v12);
      return v6 - v13;
    }
  }
  else
  {
    v8 = v7;
    v9 = a3 - v7;
    -[PXFloatingCardGestureCoordinator bottomRubberBandRange](self, "bottomRubberBandRange");
    -[PXFloatingCardGestureCoordinator applyRubberBandToValue:withRange:](self, "applyRubberBandToValue:withRange:", v9, v10);
    return v8 + v11;
  }
  return a3;
}

- (double)heightForRubberBandHeight:(double)a3
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

  -[PXFloatingCardGestureCoordinator minimumHeight](self, "minimumHeight");
  v6 = v5;
  -[PXFloatingCardGestureCoordinator maximumHeight](self, "maximumHeight");
  if (v7 >= a3)
  {
    if (v6 > a3)
    {
      -[PXFloatingCardGestureCoordinator topRubberBandRange](self, "topRubberBandRange");
      -[PXFloatingCardGestureCoordinator unapplyRubberBandToValue:withRange:](self, "unapplyRubberBandToValue:withRange:", v6 - a3, v12);
      return v6 - v13;
    }
  }
  else
  {
    v8 = v7;
    v9 = a3 - v7;
    -[PXFloatingCardGestureCoordinator bottomRubberBandRange](self, "bottomRubberBandRange");
    -[PXFloatingCardGestureCoordinator unapplyRubberBandToValue:withRange:](self, "unapplyRubberBandToValue:withRange:", v9, v10);
    return v8 + v11;
  }
  return a3;
}

- (PXFloatingCardGestureCoordinatorDelegate)delegate
{
  return (PXFloatingCardGestureCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXFloatingCardLayout)layout
{
  return (PXFloatingCardLayout *)objc_loadWeakRetained((id *)&self->_layout);
}

- (void)setLayout:(id)a3
{
  objc_storeWeak((id *)&self->_layout, a3);
}

- (BOOL)isDragging
{
  return self->_isDragging;
}

- (void)setIsDragging:(BOOL)a3
{
  self->_isDragging = a3;
}

- (PXFloatingCardViewController)cardViewController
{
  return (PXFloatingCardViewController *)objc_loadWeakRetained((id *)&self->_cardViewController);
}

- (void)setCardViewController:(id)a3
{
  objc_storeWeak((id *)&self->_cardViewController, a3);
}

- (PXFloatingCardAnimationManager)animationManager
{
  return self->_animationManager;
}

- (void)setAnimationManager:(id)a3
{
  objc_storeStrong((id *)&self->_animationManager, a3);
}

- (UIPanGestureRecognizer)positionGestureRecognizer
{
  return self->_positionGestureRecognizer;
}

- (void)setPositionGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_positionGestureRecognizer, a3);
}

- (UIPanGestureRecognizer)heightGestureRecognizer
{
  return self->_heightGestureRecognizer;
}

- (void)setHeightGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_heightGestureRecognizer, a3);
}

- (CGPoint)previousPanTranslation
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousPanTranslation.x;
  y = self->_previousPanTranslation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousPanTranslation:(CGPoint)a3
{
  self->_previousPanTranslation = a3;
}

- (double)topRubberBandRange
{
  return self->_topRubberBandRange;
}

- (void)setTopRubberBandRange:(double)a3
{
  self->_topRubberBandRange = a3;
}

- (double)bottomRubberBandRange
{
  return self->_bottomRubberBandRange;
}

- (void)setBottomRubberBandRange:(double)a3
{
  self->_bottomRubberBandRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_positionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_animationManager, 0);
  objc_destroyWeak((id *)&self->_cardViewController);
  objc_destroyWeak((id *)&self->_layout);
  objc_destroyWeak((id *)&self->_delegate);
}

void __64__PXFloatingCardGestureCoordinator__handlePositionGestureEnded___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  void *v3;
  id v4;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCenter:", v1, v2);

}

void __64__PXFloatingCardGestureCoordinator__handlePositionGestureEnded___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cardViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardViewController:didUpdatePosition:", v3, *(_QWORD *)(a1 + 40));

  }
}

void __49__PXFloatingCardGestureCoordinator_snapToHeight___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "updateCardHeightConstraintWithHeight:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateConstraintsIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

}

void __49__PXFloatingCardGestureCoordinator_snapToHeight___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardViewController:didUpdateHeight:", v2, *(double *)(a1 + 40));

}

uint64_t __68__PXFloatingCardGestureCoordinator_closestHeightForProjectedHeight___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  float v4;
  double v5;
  double v6;
  uint64_t v7;

  result = objc_msgSend(a2, "floatValue");
  v5 = v4;
  v6 = vabdd_f64(v5, *(double *)(a1 + 48));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v6 < *(double *)(v7 + 24))
  {
    *(double *)(v7 + 24) = v6;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  }
  return result;
}

@end
