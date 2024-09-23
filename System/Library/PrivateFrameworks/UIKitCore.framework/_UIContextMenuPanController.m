@implementation _UIContextMenuPanController

- (_UIContextMenuPanController)initWithContainerView:(id)a3 platterView:(id)a4 menuView:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIContextMenuPanController *v11;
  _UIContextMenuPanController *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __objc2_class **v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *detents;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  double v27;
  void *v28;
  __int128 v30;
  objc_super v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)_UIContextMenuPanController;
  v11 = -[_UIContextMenuPanController init](&v31, sel_init);
  v12 = v11;
  if (v11)
  {
    -[_UIContextMenuPanController setContainerView:](v11, "setContainerView:", v8);
    -[_UIContextMenuPanController setPlatterView:](v12, "setPlatterView:", v9);
    -[_UIContextMenuPanController setMenuView:](v12, "setMenuView:", v10);
    -[_UIContextMenuPanController containerView](v12, "containerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceIdiom");

    v16 = off_1E167BEC0;
    if (v15 != 6)
      v16 = off_1E167B1B8;
    v17 = (void *)objc_msgSend(objc_alloc(*v16), "initWithTarget:action:", v12, sel__handlePanGesture_);
    objc_msgSend(v17, "setName:", CFSTR("com.apple.UIKit.PreviewPlatterPan"));
    objc_msgSend(v17, "setCancelsTouchesInView:", 0);
    objc_msgSend(v17, "setDelegate:", v12);
    objc_msgSend(v17, "setMaximumNumberOfTouches:", 1);
    objc_msgSend(v17, "setAllowedScrollTypesMask:", 3);
    objc_msgSend(v8, "addGestureRecognizer:", v17);
    -[_UIContextMenuPanController setPanGestureRecognizer:](v12, "setPanGestureRecognizer:", v17);
    v18 = (void *)objc_opt_new();
    -[_UIContextMenuPanController setVelocityIntegrator:](v12, "setVelocityIntegrator:", v18);

    v12->_enabled = 1;
    v30 = *MEMORY[0x1E0C9D538];
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v30, "{CGPoint=dd}");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v20 = objc_claimAutoreleasedReturnValue();
    detents = v12->_detents;
    v12->_detents = (NSArray *)v20;

    v12->_currentDetentIndex = 0;
    objc_msgSend(v9, "center");
    v12->_originalPlatterCenter.x = v22;
    v12->_originalPlatterCenter.y = v23;
    objc_msgSend(v10, "center");
    v12->_originalMenuCenter.x = v24;
    v12->_originalMenuCenter.y = v25;
    *(_OWORD *)&v12->_menuAnchor.attachment = xmmword_186679FB0;
    v12->_menuAnchor.alignmentOffset = 0.0;
    v12->_menuAnchor.gravity = 0;
    v12->_menuAnchor.attachmentOffset = 0.0;
    v12->_rubberbandingEdges = 15;
    v12->_menuViewIsVisible = 1;
    -[_UIContextMenuPanController _currentPlatformMetrics](v12, "_currentPlatformMetrics");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "baseMenuOffset");
    v12->_defaultZPosition = v27;

    +[_UIContextMenuScrollObservationInteraction interactionWithDelegate:](_UIContextMenuScrollObservationInteraction, "interactionWithDelegate:", v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addInteraction:", v28);

  }
  return v12;
}

- (void)moveToDetentPosition:(int64_t)a3 updateScrubPath:(BOOL)a4
{
  _BOOL4 v4;
  NSUInteger v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[5];

  v4 = a4;
  if (!-[_UIContextMenuPanController _canSwipeDownToDismiss](self, "_canSwipeDownToDismiss"))
    goto LABEL_10;
  if (a3)
  {
    if (a3 != 2)
      goto LABEL_10;
    a3 = -[NSArray count](self->_detents, "count") - 1;
  }
  if (a3 != self->_currentDetentIndex)
  {
    v7 = -[NSArray count](self->_detents, "count");
    if (a3 >= v7 - 1)
      v8 = v7 - 1;
    else
      v8 = a3;
    self->_currentDetentIndex = v8;
    -[NSArray objectAtIndexedSubscript:](self->_detents, "objectAtIndexedSubscript:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "CGPointValue");
    v11 = v10;
    v13 = v12;

    self->_initialYTranslation = v13;
    -[_UIContextMenuPanController platterView](self, "platterView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v17 = v16 + v15 * 0.5;
    v20 = v19 + v18 * 0.5;

    -[_UIContextMenuPanController _animationsForPreviewPlusActionsStyleWithTranslation:location:](self, "_animationsForPreviewPlusActionsStyleWithTranslation:location:", v11, v13, 0.0, v17, v20, 0.0);
    -[_UIContextMenuPanController _animationsForAnyAttachedAccessoryViews](self, "_animationsForAnyAttachedAccessoryViews");
  }
LABEL_10:
  if (v4)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __68___UIContextMenuPanController_moveToDetentPosition_updateScrubPath___block_invoke;
    v21[3] = &unk_1E16B1B28;
    v21[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v21);
  }
}

- (void)setDetents:(id)a3
{
  NSArray *v5;
  NSUInteger v6;
  NSArray *v7;

  v5 = (NSArray *)a3;
  if (self->_detents != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_detents, a3);
    v6 = -[NSArray count](self->_detents, "count");
    v5 = v7;
    self->_currentDetentIndex = v6 - 1;
  }

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    -[_UIContextMenuPanController panGestureRecognizer](self, "panGestureRecognizer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", v3);

  }
}

- (void)setOriginalPlatterCenter:(CGPoint)a3
{
  if (a3.x != self->_originalPlatterCenter.x || a3.y != self->_originalPlatterCenter.y)
  {
    self->_originalPlatterCenter = a3;
    -[_UIContextMenuPanController _updateForSignificantLayoutChange](self, "_updateForSignificantLayoutChange");
  }
}

- (void)setOriginalMenuCenter:(CGPoint)a3
{
  if (a3.x != self->_originalMenuCenter.x || a3.y != self->_originalMenuCenter.y)
  {
    self->_originalMenuCenter = a3;
    -[_UIContextMenuPanController _updateForSignificantLayoutChange](self, "_updateForSignificantLayoutChange");
  }
}

- (void)_updateForSignificantLayoutChange
{
  UIBezierPath *menuScrubPath;

  menuScrubPath = self->_menuScrubPath;
  self->_menuScrubPath = 0;

}

- (CGVector)_currentPlatterVelocity
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGVector result;

  -[_UIContextMenuPanController velocityIntegrator](self, "velocityIntegrator");
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

- (double)_rangeOfMotion
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[NSArray firstObject](self->_detents, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGPointValue");
  v5 = v4;

  -[NSArray lastObject](self->_detents, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGPointValue");
  v8 = v7;

  return v8 - v5;
}

- (int)_nearestDetentWithTranslation:(CGPoint)a3
{
  double y;
  NSUInteger v5;
  int v6;
  unint64_t v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  y = a3.y;
  v5 = -[NSArray count](self->_detents, "count", a3.x);
  v6 = v5;
  if (y <= 250.0 && v5)
  {
    v7 = 0;
    v6 = 0;
    v8 = 1.79769313e308;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_detents, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "CGPointValue");
      v11 = v10;

      if (vabdd_f64(v11, y) < fabs(v8))
      {
        v6 = v7;
        v8 = v11 - y;
      }
      ++v7;
    }
    while (-[NSArray count](self->_detents, "count", v11 - y) > v7);
  }
  return v6;
}

- (BOOL)_canSwipeDownToDismiss
{
  return self->_rubberbandingEdges != 15;
}

- (double)_dragTearOffThreshold
{
  void *v3;
  double v4;
  double v5;

  -[_UIContextMenuPanController _currentPlatformMetrics](self, "_currentPlatformMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewActionsStyleDragTearOffThreshold");
  v5 = v4;

  if (-[_UIContextMenuPanController _canSwipeDownToDismiss](self, "_canSwipeDownToDismiss"))
  {
    if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_PlatterPreviewPlusActionsDragTearOffThreshold, (uint64_t)CFSTR("PlatterPreviewPlusActionsDragTearOffThreshold"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))return 50.0;
    else
      return *(double *)&qword_1EDDA7EA0;
  }
  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  BOOL v19;
  CGPoint v21;
  CGRect v22;

  v5 = a4;
  if (objc_msgSend(v5, "type") == 10)
  {
    v6 = v5;
    if (-[_UIContextMenuPanController _canSwipeDownToDismiss](self, "_canSwipeDownToDismiss"))
    {
      -[_UIContextMenuPanController platterView](self, "platterView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bounds");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      -[_UIContextMenuPanController platterView](self, "platterView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "locationInView:", v16);
      v21.x = v17;
      v21.y = v18;
      v22.origin.x = v9;
      v22.origin.y = v11;
      v22.size.width = v13;
      v22.size.height = v15;
      v19 = CGRectContainsPoint(v22, v21);

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 1;
  }

  return v19;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  id v8;
  _BOOL4 v9;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  void *v24;
  void *v25;
  int64_t v26;
  int v27;
  CGPoint v28;
  CGRect v29;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "phase") <= 0
    && (-[_UIContextMenuPanController panGestureRecognizer](self, "panGestureRecognizer"),
        v8 = (id)objc_claimAutoreleasedReturnValue(),
        v8,
        v8 == v6))
  {
    -[_UIContextMenuPanController platterView](self, "platterView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[_UIContextMenuPanController platterView](self, "platterView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v20);
    v28.x = v21;
    v28.y = v22;
    v29.origin.x = v13;
    v29.origin.y = v15;
    v29.size.width = v17;
    v29.size.height = v19;
    v9 = CGRectContainsPoint(v29, v28);

    -[_UIContextMenuPanController menuView](self, "menuView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPanController menuView](self, "menuView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v24);
    objc_msgSend(v23, "hitTest:withEvent:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = -[_UIContextMenuPanController _userInterfaceIdiom](self, "_userInterfaceIdiom");
    if (v26 != 6)
    {
      if (v26 == 1)
      {
        if (v25)
          LOBYTE(v9) = 1;
      }
      else
      {
        v27 = -[_UIContextMenuPanController _canSwipeDownToDismiss](self, "_canSwipeDownToDismiss") || v9;
        if (v25)
          LOBYTE(v9) = 1;
        else
          LOBYTE(v9) = v27;
      }
    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  BOOL v11;

  v6 = a4;
  v7 = a3;
  -[_UIContextMenuPanController panGestureRecognizer](self, "panGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (v8 == v7)
  {
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.UIKit.ContextMenuActionsListSelection"));

    if ((v10 & 1) != 0)
      v11 = 1;
  }

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  char v9;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[_UIContextMenuPanController panGestureRecognizer](self, "panGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7 && self->_currentDetentIndex && objc_msgSend(v6, "_isGestureType:", 8))
  {
    objc_msgSend(v6, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPanController menuView](self, "menuView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "isDescendantOfView:", v12);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_handlePanGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  -[_UIContextMenuPanController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[_UIContextMenuPanController containerView](self, "containerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v10);
  v12 = v11;
  v14 = v13;

  objc_msgSend(v4, "_activeEvents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "anyObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "type");

  if (v17 == 10)
    v7 = 0.0;
  v18 = objc_msgSend(v4, "state");

  -[_UIContextMenuPanController _updateForGestureWithState:translation:location:allowsDragging:](self, "_updateForGestureWithState:translation:location:allowsDragging:", v18, v17 != 10, v7, v9, 0.0, v12, v14, 0.0);
}

- (void)_updateForGestureWithState:(int64_t)a3 translation:(CAPoint3D)a4 location:(CAPoint3D)a5 allowsDragging:(BOOL)a6
{
  _BOOL4 v6;
  double z;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  _BOOL4 v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double initialYTranslation;
  double v21;
  void *v22;
  void *v23;
  _UIContextMenuPanController *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  int currentDetentIndex;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;

  v6 = a6;
  z = a5.z;
  y = a5.y;
  x = a5.x;
  v10 = a4.z;
  v11 = a4.y;
  v12 = a4.x;
  if (-[_UIContextMenuPanController enabled](self, "enabled"))
  {
    -[_UIContextMenuPanController containerView](self, "containerView");
    v48 = (id)objc_claimAutoreleasedReturnValue();
    v15 = -[_UIContextMenuPanController _canSwipeDownToDismiss](self, "_canSwipeDownToDismiss");
    switch(a3)
    {
      case 1:
        -[NSArray objectAtIndexedSubscript:](self->_detents, "objectAtIndexedSubscript:", self->_currentDetentIndex);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "CGPointValue");
        self->_initialYTranslation = v17;

        -[_UIContextMenuPanController velocityIntegrator](self, "velocityIntegrator");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "reset");

        if (!v15)
        {
          -[_UIContextMenuPanController _updateMenuScrubPathWithLocationIfNecessary:](self, "_updateMenuScrubPathWithLocationIfNecessary:", x, y);
          self->_initialLocationInsidePreview = (CGPoint)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        }
        -[_UIContextMenuPanController delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "platterPanInteractionBegan:allowSwipeToDismiss:", self, &self->_clientAllowsDismissal);

        goto LABEL_6;
      case 2:
LABEL_6:
        initialYTranslation = self->_initialYTranslation;
        if (!v15)
        {
          -[_UIContextMenuPanController _updateMenuScrubPathWithLocationIfNecessary:](self, "_updateMenuScrubPathWithLocationIfNecessary:", x, y);
          self->_currentDistanceToMenuScrubPath = UIDistanceBetweenPointAndPolygon(self->_menuScrubPath, x, y);
        }
        v21 = v11 + initialYTranslation;
        if (v6)
        {
          if (-[_UIContextMenuPanController _canBeginDraggingWithTranslation:location:](self, "_canBeginDraggingWithTranslation:location:", v12, v21, v10, x, y, z))
          {
            -[_UIContextMenuPanController delegate](self, "delegate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "platterPanControllerDidTearOff:", self);

          }
        }
        -[_UIContextMenuPanController velocityIntegrator](self, "velocityIntegrator");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addSample:", x, y);

        v24 = self;
        v25 = v12;
        v26 = v21;
        v27 = v10;
        v28 = x;
        v29 = 0;
        v30 = y;
        v31 = z;
        v32 = 0;
        goto LABEL_12;
      case 3:
        self->_currentDistanceToMenuScrubPath = 0.0;
        -[_UIContextMenuPanController _currentPlatterVelocity](self, "_currentPlatterVelocity");
        v34 = v33;
        currentDetentIndex = self->_currentDetentIndex;
        -[_UIContextMenuPanController delegate](self, "delegate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "platterPanInteractionEnded:", self);

        if (!v15)
          goto LABEL_25;
        if (v34 >= 2000.0)
        {
          currentDetentIndex = -[NSArray count](self->_detents, "count");
          goto LABEL_25;
        }
        if (v34 > 300.0)
        {
          ++currentDetentIndex;
LABEL_25:
          v39 = 1;
          goto LABEL_26;
        }
        if (v34 < -300.0)
        {
          if (currentDetentIndex <= 1)
            v38 = 1;
          else
            v38 = currentDetentIndex;
          currentDetentIndex = v38 - 1;
          goto LABEL_25;
        }
        currentDetentIndex = -[_UIContextMenuPanController _nearestDetentWithTranslation:](self, "_nearestDetentWithTranslation:", v12, v11 + self->_initialYTranslation);
        v39 = 0;
LABEL_26:
        if (!self->_clientAllowsDismissal)
          currentDetentIndex = (int)fmax(fmin((double)currentDetentIndex, (double)(-[NSArray count](self->_detents, "count") - 1)), 0.0);
        if (-[NSArray count](self->_detents, "count") <= currentDetentIndex)
        {
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, fmax(fmin(v34, 4500.0), 0.0));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIContextMenuPanController platterView](self, "platterView");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "_setVelocity:forKey:", v37, CFSTR("position"));

          -[_UIContextMenuPanController menuView](self, "menuView");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "_setVelocity:forKey:", v37, CFSTR("position"));

          -[_UIContextMenuPanController delegate](self, "delegate");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "platterPanControllerDidSwipeDown:", self);

LABEL_31:
        }
        else
        {
          -[NSArray objectAtIndexedSubscript:](self->_detents, "objectAtIndexedSubscript:", currentDetentIndex);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "CGPointValue");
          v42 = v41;
          v44 = v43;

          self->_currentDetentIndex = currentDetentIndex;
          v27 = 0.0;
          v24 = self;
          v25 = v42;
          v26 = v44;
          v28 = x;
          v30 = y;
          v31 = z;
          v29 = 1;
          v32 = v39;
LABEL_12:
          -[_UIContextMenuPanController _updateViewPositionsWithTranslation:location:ended:withVelocity:](v24, "_updateViewPositionsWithTranslation:location:ended:withVelocity:", v29, v32, v25, v26, v27, v28, v30, v31);
        }
LABEL_32:

        break;
      case 4:
        -[_UIContextMenuPanController delegate](self, "delegate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "platterPanInteractionEnded:", self);
        goto LABEL_31;
      default:
        goto LABEL_32;
    }
  }
}

- (void)_updateMenuScrubPathWithLocationIfNecessary:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v17;
  double v18;
  _BOOL4 v19;
  UIBezierPath *menuScrubPath;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
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
  void *v37;
  void *v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  uint64_t v62;
  void *v63;
  void *v64;
  double MaxX;
  void *v66;
  double v67;
  void *v68;
  double v69;
  double MaxY;
  double v71;
  void *v72;
  double v73;
  void *v74;
  double MinX;
  void *v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  CGRectEdge v84;
  double v85;
  CGRectEdge v86;
  void *v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  double v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  void *v96;
  void *v97;
  void *v98;
  double v99;
  void *v100;
  double v101;
  double MinY;
  double v103;
  void *v104;
  double v105;
  void *v106;
  double v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  void *v112;
  double v113;
  void *v114;
  double v115;
  void *v116;
  double v117;
  double v118;
  double v119;
  void *v120;
  double v121;
  void *v122;
  double v123;
  void *v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  void *v131;
  double v132;
  double v133;
  double v134;
  void *v135;
  double v136;
  void *v137;
  double v138;
  void *v139;
  double v140;
  void *v141;
  double v142;
  double v143;
  double v144;
  double v145;
  void *v146;
  char isKindOfClass;
  void *v148;
  void *v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  CGFloat rect;
  double width;
  double height;
  _QWORD v164[4];
  id v165;
  _UIContextMenuPanController *v166;
  uint64_t *v167;
  CGRect remainder;
  CGRect slice;
  uint64_t v170;
  uint64_t v171;
  uint64_t *v172;
  uint64_t v173;
  uint64_t (*v174)(uint64_t, uint64_t);
  void (*v175)(uint64_t);
  id v176;
  uint64_t v177;
  CGPoint v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;
  CGRect v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;
  CGRect v204;
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;
  CGRect v230;
  CGRect v231;
  CGRect v232;
  CGRect v233;
  CGRect v234;
  CGRect v235;
  CGRect v236;
  CGRect v237;
  CGRect v238;
  CGRect v239;
  CGRect v240;
  CGRect v241;
  CGRect v242;
  CGRect v243;
  CGRect v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;
  CGRect v250;
  CGRect v251;
  CGRect v252;
  CGRect v253;
  CGRect v254;
  CGRect v255;
  CGRect v256;
  CGRect v257;
  CGRect v258;
  CGRect v259;
  CGRect v260;
  CGRect v261;
  CGRect v262;
  CGRect v263;
  CGRect v264;
  CGRect v265;
  CGRect v266;
  CGRect v267;
  CGRect v268;
  CGRect v269;

  y = a3.y;
  x = a3.x;
  -[_UIContextMenuPanController menuView](self, "menuView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[_UIContextMenuPanController menuAnchor](self, "menuAnchor");
  v15 = v177;
  if (v177 == 4 || v177 == 1)
  {
    v180.origin.x = UIRectInsetEdges(v177, v8, v10, v12, v14, -48.0);
  }
  else
  {
    v179.origin.x = v8;
    v179.origin.y = v10;
    v179.size.width = v12;
    v179.size.height = v14;
    v180 = CGRectInset(v179, 0.0, -48.0);
  }
  v17 = v180.origin.x;
  v18 = v180.origin.y;
  width = v180.size.width;
  height = v180.size.height;
  v178.x = x;
  v178.y = y;
  v19 = CGRectContainsPoint(v180, v178);
  menuScrubPath = self->_menuScrubPath;
  if (menuScrubPath && v19)
  {
    if (self->_touchEverEnteredMenu)
      return;
  }
  else if (menuScrubPath)
  {
    return;
  }
  self->_touchEverEnteredMenu = v19;
  v171 = 0;
  v172 = &v171;
  v173 = 0x3032000000;
  v174 = __Block_byref_object_copy__50;
  v175 = __Block_byref_object_dispose__50;
  v176 = 0;
  if (v19)
  {
    +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v17, v18, width, height);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v172[5];
    v172[5] = v21;

    -[_UIContextMenuPanController menuAnchor](self, "menuAnchor");
    v23 = v170;
    -[_UIContextMenuPanController platterView](self, "platterView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[_UIContextMenuPanController originalPlatterCenter](self, "originalPlatterCenter");
    v34 = v33;
    v36 = v35;
    -[_UIContextMenuPanController containerView](self, "containerView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "_screen");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "scale");
    UIRectCenteredAboutPointScale(v26, v28, v30, v32, v34, v36, v39);
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;

    if (v15 == 4 || v15 == 1)
    {
      v181.origin.x = v41;
      v181.origin.y = v43;
      v181.size.width = v45;
      v181.size.height = v47;
      v48 = CGRectGetHeight(v181);
    }
    else
    {
      v204.origin.x = v41;
      v204.origin.y = v43;
      v204.size.width = v45;
      v204.size.height = v47;
      v48 = CGRectGetWidth(v204);
    }
    v83 = round(v48 * 0.65);
    memset(&slice, 0, sizeof(slice));
    memset(&remainder, 0, sizeof(remainder));
    switch(v15)
    {
      case 1:
        v84 = CGRectMinYEdge;
        break;
      case 4:
        v84 = CGRectMaxYEdge;
        break;
      case 8:
        v84 = CGRectMaxXEdge;
        break;
      default:
        v84 = CGRectMinXEdge;
        break;
    }
    v205.origin.x = v41;
    v205.origin.y = v43;
    v205.size.width = v45;
    v205.size.height = v47;
    CGRectDivide(v205, &slice, &remainder, v83, v84);
    if (v15 == 4 || v15 == 1)
    {
      v206.origin.x = v17;
      v206.origin.y = v18;
      v206.size.width = width;
      v206.size.height = height;
      v85 = CGRectGetWidth(v206);
    }
    else
    {
      v207.origin.x = v17;
      v207.origin.y = v18;
      v207.size.width = width;
      v207.size.height = height;
      v85 = CGRectGetHeight(v207);
    }
    switch(v23)
    {
      case 1:
        v86 = CGRectMinYEdge;
        break;
      case 4:
        v86 = CGRectMaxYEdge;
        break;
      case 8:
        v86 = CGRectMaxXEdge;
        break;
      default:
        v86 = CGRectMinXEdge;
        break;
    }
    CGRectDivide(slice, &slice, &remainder, v85, v86);
    -[_UIContextMenuPanController menuView](self, "menuView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "frame");
    v92 = UIDistanceBetweenRects(v88, v89, v90, v91, v41, v43, v45, v47);

    slice.origin.x = UIRectInsetEdges(v15, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height, -v92);
    slice.origin.y = v93;
    slice.size.width = v94;
    slice.size.height = v95;
    v96 = (void *)v172[5];
    +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "appendPath:", v97);

  }
  else
  {
    -[_UIContextMenuPanController _currentPlatformMetrics](self, "_currentPlatformMetrics");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "previewActionsStyleDragTearOffThreshold");
    v51 = v50;

    -[_UIContextMenuPanController containerView](self, "containerView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "_screen");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "scale");
    UIRectCenteredAboutPointScale(0.0, 0.0, v51, v51, x, y, v54);
    rect = v55;
    v57 = v56;
    v59 = v58;
    v61 = v60;

    v62 = objc_opt_new();
    v63 = (void *)v172[5];
    v172[5] = v62;

    switch(v15)
    {
      case 1:
        objc_msgSend((id)v172[5], "moveToPoint:", v17, v18);
        v64 = (void *)v172[5];
        v182.origin.x = v17;
        v182.origin.y = v18;
        v182.size.width = width;
        v182.size.height = height;
        MaxX = CGRectGetMaxX(v182);
        v183.origin.x = v17;
        v183.origin.y = v18;
        v183.size.width = width;
        v183.size.height = height;
        objc_msgSend(v64, "addLineToPoint:", MaxX, CGRectGetMinY(v183));
        v66 = (void *)v172[5];
        v184.origin.x = v17;
        v184.origin.y = v18;
        v184.size.width = width;
        v184.size.height = height;
        v67 = CGRectGetMaxX(v184);
        v185.origin.x = v17;
        v185.origin.y = v18;
        v185.size.width = width;
        v185.size.height = height;
        objc_msgSend(v66, "addLineToPoint:", v67, CGRectGetMaxY(v185));
        v68 = (void *)v172[5];
        v186.origin.x = v17;
        v186.origin.y = v18;
        v186.size.width = width;
        v186.size.height = height;
        v153 = CGRectGetMaxX(v186);
        v187.origin.x = v57;
        v187.origin.y = v59;
        v187.size.width = v61;
        v187.size.height = rect;
        v150 = CGRectGetMaxX(v187);
        v188.origin.x = v17;
        v188.origin.y = v18;
        v188.size.width = width;
        v188.size.height = height;
        v69 = CGRectGetMaxX(v188);
        v189.origin.x = v17;
        v189.origin.y = v18;
        v189.size.width = width;
        v189.size.height = height;
        MaxY = CGRectGetMaxY(v189);
        v190.origin.x = v57;
        v190.origin.y = v59;
        v190.size.width = v61;
        v190.size.height = rect;
        v71 = CGRectGetMaxY(v190);
        v191.origin.x = v17;
        v191.origin.y = v18;
        v191.size.width = width;
        v191.size.height = height;
        objc_msgSend(v68, "addLineToPoint:", v153 + (v150 - v69) * 0.8, MaxY + (v71 - CGRectGetMaxY(v191)) * 0.25);
        v72 = (void *)v172[5];
        v192.origin.x = v57;
        v192.origin.y = v59;
        v192.size.width = v61;
        v192.size.height = rect;
        v73 = CGRectGetMaxX(v192);
        v193.origin.x = v57;
        v193.origin.y = v59;
        v193.size.width = v61;
        v193.size.height = rect;
        objc_msgSend(v72, "addLineToPoint:", v73, CGRectGetMaxY(v193));
        v74 = (void *)v172[5];
        v194.origin.x = v57;
        v194.origin.y = v59;
        v194.size.width = v61;
        v194.size.height = rect;
        MinX = CGRectGetMinX(v194);
        v195.origin.x = v57;
        v195.origin.y = v59;
        v195.size.width = v61;
        v195.size.height = rect;
        objc_msgSend(v74, "addLineToPoint:", MinX, CGRectGetMaxY(v195));
        v76 = (void *)v172[5];
        v196.origin.x = v57;
        v196.origin.y = v59;
        v196.size.width = v61;
        v196.size.height = rect;
        v154 = CGRectGetMinX(v196);
        v197.origin.x = v17;
        v197.origin.y = v18;
        v197.size.width = width;
        v197.size.height = height;
        v151 = CGRectGetMinX(v197);
        v198.origin.x = v57;
        v198.origin.y = v59;
        v198.size.width = v61;
        v198.size.height = rect;
        v77 = CGRectGetMinX(v198);
        v199.origin.x = v57;
        v199.origin.y = v59;
        v199.size.width = v61;
        v199.size.height = rect;
        v78 = CGRectGetMaxY(v199);
        v200.origin.x = v17;
        v200.origin.y = v18;
        v200.size.width = width;
        v200.size.height = height;
        v79 = CGRectGetMaxY(v200);
        v201.origin.x = v57;
        v201.origin.y = v59;
        v201.size.width = v61;
        v201.size.height = rect;
        objc_msgSend(v76, "addLineToPoint:", v154 + (v151 - v77) * 0.25, v78 + (v79 - CGRectGetMaxY(v201)) * 0.75);
        v80 = (void *)v172[5];
        v202.origin.x = v17;
        v202.origin.y = v18;
        v202.size.width = width;
        v202.size.height = height;
        v81 = CGRectGetMinX(v202);
        v203.origin.x = v17;
        v203.origin.y = v18;
        v203.size.width = width;
        v203.size.height = height;
        v82 = CGRectGetMaxY(v203);
        goto LABEL_41;
      case 2:
        objc_msgSend((id)v172[5], "moveToPoint:", v17, v18);
        v98 = (void *)v172[5];
        v208.origin.x = v17;
        v208.origin.y = v18;
        v208.size.width = width;
        v208.size.height = height;
        v99 = CGRectGetMaxX(v208);
        v209.origin.x = v17;
        v209.origin.y = v18;
        v209.size.width = width;
        v209.size.height = height;
        objc_msgSend(v98, "addLineToPoint:", v99, CGRectGetMinY(v209));
        v100 = (void *)v172[5];
        v210.origin.x = v17;
        v210.origin.y = v18;
        v210.size.width = width;
        v210.size.height = height;
        v155 = CGRectGetMaxX(v210);
        v211.origin.x = v57;
        v211.origin.y = v59;
        v211.size.width = v61;
        v211.size.height = rect;
        v152 = CGRectGetMaxX(v211);
        v212.origin.x = v17;
        v212.origin.y = v18;
        v212.size.width = width;
        v212.size.height = height;
        v101 = CGRectGetMaxX(v212);
        v213.origin.x = v17;
        v213.origin.y = v18;
        v213.size.width = width;
        v213.size.height = height;
        MinY = CGRectGetMinY(v213);
        v214.origin.x = v57;
        v214.origin.y = v59;
        v214.size.width = v61;
        v214.size.height = rect;
        v103 = CGRectGetMinY(v214);
        v215.origin.x = v17;
        v215.origin.y = v18;
        v215.size.width = width;
        v215.size.height = height;
        objc_msgSend(v100, "addLineToPoint:", v155 + (v152 - v101) * 0.25, MinY + (v103 - CGRectGetMinY(v215)) * 0.75);
        v104 = (void *)v172[5];
        v216.origin.x = v57;
        v216.origin.y = v59;
        v216.size.width = v61;
        v216.size.height = rect;
        v105 = CGRectGetMaxX(v216);
        v217.origin.x = v57;
        v217.origin.y = v59;
        v217.size.width = v61;
        v217.size.height = rect;
        objc_msgSend(v104, "addLineToPoint:", v105, CGRectGetMinY(v217));
        v106 = (void *)v172[5];
        v218.origin.x = v57;
        v218.origin.y = v59;
        v218.size.width = v61;
        v218.size.height = rect;
        v107 = CGRectGetMaxX(v218);
        v219.origin.x = v57;
        v219.origin.y = v59;
        v219.size.width = v61;
        v219.size.height = rect;
        objc_msgSend(v106, "addLineToPoint:", v107, CGRectGetMaxY(v219));
        v108 = (void *)v172[5];
        v220.origin.x = v57;
        v220.origin.y = v59;
        v220.size.width = v61;
        v220.size.height = rect;
        v156 = CGRectGetMaxX(v220);
        v221.origin.x = v57;
        v221.origin.y = v59;
        v221.size.width = v61;
        v221.size.height = rect;
        v151 = CGRectGetMaxX(v221);
        v222.origin.x = v17;
        v222.origin.y = v18;
        v222.size.width = width;
        v222.size.height = height;
        v109 = CGRectGetMaxX(v222);
        v223.origin.x = v57;
        v223.origin.y = v59;
        v223.size.width = v61;
        v223.size.height = rect;
        v110 = CGRectGetMaxY(v223);
        v224.origin.x = v57;
        v224.origin.y = v59;
        v224.size.width = v61;
        v224.size.height = rect;
        v111 = CGRectGetMaxY(v224);
        v225.origin.x = v57;
        v225.origin.y = v59;
        v225.size.width = v61;
        v225.size.height = rect;
        objc_msgSend(v108, "addLineToPoint:", v156 + (v151 - v109) * -0.75, v110 + (v111 - CGRectGetMaxY(v225)) * 0.25);
        v112 = (void *)v172[5];
        v226.origin.x = v17;
        v226.origin.y = v18;
        v226.size.width = width;
        v226.size.height = height;
        v113 = CGRectGetMaxX(v226);
        v227.origin.x = v17;
        v227.origin.y = v18;
        v227.size.width = width;
        v227.size.height = height;
        objc_msgSend(v112, "addLineToPoint:", v113, CGRectGetMaxY(v227));
        v80 = (void *)v172[5];
        v228.origin.x = v17;
        v228.origin.y = v18;
        v228.size.width = width;
        v228.size.height = height;
        v81 = CGRectGetMinX(v228);
        v229.origin.x = v17;
        v229.origin.y = v18;
        v229.size.width = width;
        v229.size.height = height;
        v82 = CGRectGetMaxY(v229);
        goto LABEL_41;
      case 4:
        objc_msgSend((id)v172[5], "moveToPoint:", v57, v59);
        v114 = (void *)v172[5];
        v230.origin.x = v57;
        v230.origin.y = v59;
        v230.size.width = v61;
        v230.size.height = rect;
        v115 = CGRectGetMaxX(v230);
        v231.origin.x = v57;
        v231.origin.y = v59;
        v231.size.width = v61;
        v231.size.height = rect;
        objc_msgSend(v114, "addLineToPoint:", v115, CGRectGetMinY(v231));
        v116 = (void *)v172[5];
        v232.origin.x = v57;
        v232.origin.y = v59;
        v232.size.width = v61;
        v232.size.height = rect;
        v157 = CGRectGetMaxX(v232);
        v233.origin.x = v17;
        v233.origin.y = v18;
        v233.size.width = width;
        v233.size.height = height;
        v151 = CGRectGetMaxX(v233);
        v234.origin.x = v57;
        v234.origin.y = v59;
        v234.size.width = v61;
        v234.size.height = rect;
        v117 = CGRectGetMaxX(v234);
        v235.origin.x = v57;
        v235.origin.y = v59;
        v235.size.width = v61;
        v235.size.height = rect;
        v118 = CGRectGetMinY(v235);
        v236.origin.x = v17;
        v236.origin.y = v18;
        v236.size.width = width;
        v236.size.height = height;
        v119 = CGRectGetMinY(v236);
        v237.origin.x = v57;
        v237.origin.y = v59;
        v237.size.width = v61;
        v237.size.height = rect;
        objc_msgSend(v116, "addLineToPoint:", v157 + (v151 - v117) * 0.25, v118 + (v119 - CGRectGetMinY(v237)) * 0.75);
        v120 = (void *)v172[5];
        v238.origin.x = v17;
        v238.origin.y = v18;
        v238.size.width = width;
        v238.size.height = height;
        v121 = CGRectGetMaxX(v238);
        v239.origin.x = v17;
        v239.origin.y = v18;
        v239.size.width = width;
        v239.size.height = height;
        objc_msgSend(v120, "addLineToPoint:", v121, CGRectGetMinY(v239));
        v122 = (void *)v172[5];
        v240.origin.x = v17;
        v240.origin.y = v18;
        v240.size.width = width;
        v240.size.height = height;
        v123 = CGRectGetMaxX(v240);
        v241.origin.x = v17;
        v241.origin.y = v18;
        v241.size.width = width;
        v241.size.height = height;
        objc_msgSend(v122, "addLineToPoint:", v123, CGRectGetMaxY(v241));
        v124 = (void *)v172[5];
        v242.origin.x = v17;
        v242.origin.y = v18;
        v242.size.width = width;
        v242.size.height = height;
        v125 = CGRectGetMinX(v242);
        v243.origin.x = v17;
        v243.origin.y = v18;
        v243.size.width = width;
        v243.size.height = height;
        objc_msgSend(v124, "addLineToPoint:", v125, CGRectGetMaxY(v243));
        objc_msgSend((id)v172[5], "addLineToPoint:", v17, v18);
        v80 = (void *)v172[5];
        v244.origin.x = v17;
        v244.origin.y = v18;
        v244.size.width = width;
        v244.size.height = height;
        v158 = CGRectGetMinX(v244);
        v245.origin.x = v57;
        v245.origin.y = v59;
        v245.size.width = v61;
        v245.size.height = rect;
        v126 = CGRectGetMinX(v245);
        v246.origin.x = v17;
        v246.origin.y = v18;
        v246.size.width = width;
        v246.size.height = height;
        v127 = CGRectGetMinX(v246);
        v247.origin.x = v17;
        v247.origin.y = v18;
        v247.size.width = width;
        v247.size.height = height;
        v128 = CGRectGetMinY(v247);
        v248.origin.x = v57;
        v248.origin.y = v59;
        v248.size.width = v61;
        v248.size.height = rect;
        v129 = CGRectGetMinY(v248);
        v249.origin.x = v17;
        v249.origin.y = v18;
        v249.size.width = width;
        v249.size.height = height;
        v81 = v158 + (v126 - v127) * 0.8;
        v130 = v128 + (v129 - CGRectGetMinY(v249)) * 0.25;
        goto LABEL_42;
      case 8:
        objc_msgSend((id)v172[5], "moveToPoint:", v57, v59);
        v131 = (void *)v172[5];
        v250.origin.x = v57;
        v250.origin.y = v59;
        v250.size.width = v61;
        v250.size.height = rect;
        v159 = CGRectGetMinX(v250);
        v251.origin.x = v17;
        v251.origin.y = v18;
        v251.size.width = width;
        v251.size.height = height;
        v151 = CGRectGetMinX(v251);
        v252.origin.x = v57;
        v252.origin.y = v59;
        v252.size.width = v61;
        v252.size.height = rect;
        v132 = CGRectGetMinX(v252);
        v253.origin.x = v57;
        v253.origin.y = v59;
        v253.size.width = v61;
        v253.size.height = rect;
        v133 = CGRectGetMinY(v253);
        v254.origin.x = v57;
        v254.origin.y = v59;
        v254.size.width = v61;
        v254.size.height = rect;
        v134 = CGRectGetMinY(v254);
        v255.origin.x = v17;
        v255.origin.y = v18;
        v255.size.width = width;
        v255.size.height = height;
        objc_msgSend(v131, "addLineToPoint:", v159 + (v151 - v132) * 0.75, v133 + (v134 - CGRectGetMinY(v255)) * -0.25);
        objc_msgSend((id)v172[5], "addLineToPoint:", v17, v18);
        v135 = (void *)v172[5];
        v256.origin.x = v17;
        v256.origin.y = v18;
        v256.size.width = width;
        v256.size.height = height;
        v136 = CGRectGetMaxX(v256);
        v257.origin.x = v17;
        v257.origin.y = v18;
        v257.size.width = width;
        v257.size.height = height;
        objc_msgSend(v135, "addLineToPoint:", v136, CGRectGetMinY(v257));
        v137 = (void *)v172[5];
        v258.origin.x = v17;
        v258.origin.y = v18;
        v258.size.width = width;
        v258.size.height = height;
        v138 = CGRectGetMaxX(v258);
        v259.origin.x = v17;
        v259.origin.y = v18;
        v259.size.width = width;
        v259.size.height = height;
        objc_msgSend(v137, "addLineToPoint:", v138, CGRectGetMaxY(v259));
        v139 = (void *)v172[5];
        v260.origin.x = v17;
        v260.origin.y = v18;
        v260.size.width = width;
        v260.size.height = height;
        v140 = CGRectGetMinX(v260);
        v261.origin.x = v17;
        v261.origin.y = v18;
        v261.size.width = width;
        v261.size.height = height;
        objc_msgSend(v139, "addLineToPoint:", v140, CGRectGetMaxY(v261));
        v141 = (void *)v172[5];
        v262.origin.x = v17;
        v262.origin.y = v18;
        v262.size.width = width;
        v262.size.height = height;
        v160 = CGRectGetMinX(v262);
        v263.origin.x = v17;
        v263.origin.y = v18;
        v263.size.width = width;
        v263.size.height = height;
        v142 = CGRectGetMinX(v263);
        v264.origin.x = v57;
        v264.origin.y = v59;
        v264.size.width = v61;
        v264.size.height = rect;
        v143 = CGRectGetMinX(v264);
        v265.origin.x = v17;
        v265.origin.y = v18;
        v265.size.width = width;
        v265.size.height = height;
        v144 = CGRectGetMaxY(v265);
        v266.origin.x = v17;
        v266.origin.y = v18;
        v266.size.width = width;
        v266.size.height = height;
        v145 = CGRectGetMaxY(v266);
        v267.origin.x = v57;
        v267.origin.y = v59;
        v267.size.width = v61;
        v267.size.height = rect;
        objc_msgSend(v141, "addLineToPoint:", v160 + (v142 - v143) * -0.25, v144 + (v145 - CGRectGetMaxY(v267)) * -0.75);
        v80 = (void *)v172[5];
        v268.origin.x = v57;
        v268.origin.y = v59;
        v268.size.width = v61;
        v268.size.height = rect;
        v81 = CGRectGetMinX(v268);
        v269.origin.x = v57;
        v269.origin.y = v59;
        v269.size.width = v61;
        v269.size.height = rect;
        v82 = CGRectGetMaxY(v269);
LABEL_41:
        v130 = v82;
LABEL_42:
        objc_msgSend(v80, "addLineToPoint:", v81, v130, *(_QWORD *)&v151);
        objc_msgSend((id)v172[5], "closePath");
        break;
      default:
        break;
    }
  }
  -[_UIContextMenuPanController menuView](self, "menuView");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[_UIContextMenuPanController menuView](self, "menuView");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v148, "hierarchyStyle") == 2)
    {
      objc_msgSend(v148, "submenus");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v164[0] = MEMORY[0x1E0C809B0];
      v164[1] = 3221225472;
      v164[2] = __75___UIContextMenuPanController__updateMenuScrubPathWithLocationIfNecessary___block_invoke;
      v164[3] = &unk_1E16B6560;
      v165 = v148;
      v166 = self;
      v167 = &v171;
      objc_msgSend(v149, "enumerateNodes:", v164);

    }
  }
  objc_storeStrong((id *)&self->_menuScrubPath, (id)v172[5]);
  -[_UIContextMenuPanController _updatePlatterGestureDebugUIWithTranslation:location:invalidate:](self, "_updatePlatterGestureDebugUIWithTranslation:location:invalidate:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  _Block_object_dispose(&v171, 8);

}

- (BOOL)_canBeginDraggingWithTranslation:(CAPoint3D)a3 location:(CAPoint3D)a4
{
  double z;
  long double y;
  long double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  BOOL v16;
  double v18;
  BOOL v19;
  void *v20;
  double v21;
  double v22;

  z = a3.z;
  y = a3.y;
  x = a3.x;
  -[_UIContextMenuPanController _dragTearOffThreshold](self, "_dragTearOffThreshold", a3.x, a3.y, a3.z, a4.x, a4.y, a4.z);
  v9 = v8;
  -[_UIContextMenuPanController _tearOffSpeedMultiplier](self, "_tearOffSpeedMultiplier");
  v11 = v9 * v10;
  if (-[_UIContextMenuPanController _canSwipeDownToDismiss](self, "_canSwipeDownToDismiss"))
  {
    if (-[NSArray count](self->_detents, "count") <= 1)
      v12 = -v11;
    else
      v12 = v11 * -2.0;
    -[NSArray objectAtIndexedSubscript:](self->_detents, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "CGPointValue");
    v15 = v14;

    v16 = fabs(x) > v9;
    return y - v15 < v12 || v16;
  }
  else
  {
    v18 = hypot(x, y);
    if (-[_UIContextMenuPanController _userInterfaceIdiom](self, "_userInterfaceIdiom") == 6)
    {
      v19 = v18 > v9;
      -[_UIContextMenuPanController _currentPlatformMetrics](self, "_currentPlatformMetrics");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "previewActionsStyleDragZTearOffThreshold");
      v22 = v21;

      return z > v22 || v19;
    }
    else
    {
      return self->_currentDistanceToMenuScrubPath > v11 && v18 > v9;
    }
  }
}

- (double)_tearOffSpeedMultiplier
{
  double v2;
  double v3;
  int v4;
  double v5;
  double v6;
  int v7;
  double v8;

  -[_UIContextMenuPanController _currentPlatterVelocity](self, "_currentPlatterVelocity");
  v3 = fabs(v2);
  v4 = _UIInternalPreferenceUsesDefault((int *)&_MergedGlobals_902, (uint64_t)CFSTR("DragTearOffSpeedMultiplierCoefficient"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v5 = *(double *)&qword_1ECD75F70;
  if (v4)
    v5 = 200.0;
  v6 = round(v3 / v5);
  v7 = _UIInternalPreferenceUsesDefault((int *)algn_1ECD75F78, (uint64_t)CFSTR("DragTearOffSpeedMultiplierMax"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v8 = *(double *)&qword_1ECD75F80;
  if (v7)
    v8 = 3.0;
  return fmax(fmin(v6, v8), 1.0);
}

- (void)_updateViewPositionsWithTranslation:(CAPoint3D)a3 location:(CAPoint3D)a4 ended:(BOOL)a5 withVelocity:(BOOL)a6
{
  _BOOL4 v6;
  double y;
  double x;
  double v9;
  double v10;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD aBlock[5];
  CAPoint3D v19;
  CAPoint3D v20;
  BOOL v21;

  v6 = a6;
  y = a4.y;
  x = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __95___UIContextMenuPanController__updateViewPositionsWithTranslation_location_ended_withVelocity___block_invoke;
  aBlock[3] = &unk_1E16BF6D8;
  aBlock[4] = self;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v13 = _Block_copy(aBlock);
  -[_UIContextMenuPanController animationBehavior](self, "animationBehavior");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __95___UIContextMenuPanController__updateViewPositionsWithTranslation_location_ended_withVelocity___block_invoke_2;
  v16[3] = &unk_1E16B1BF8;
  v17 = v13;
  v15 = v13;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v14, !v6, v16, 0);

  -[_UIContextMenuPanController _updatePlatterGestureDebugUIWithTranslation:location:invalidate:](self, "_updatePlatterGestureDebugUIWithTranslation:location:invalidate:", 0, v10, v9, x, y);
}

- (id)_createAnimationBehaviorWithCriticalDamping:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  double v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setInertialTargetSmoothing:", 0.15);
  objc_msgSend(v4, "setInertialProjectionDeceleration:", 0.996);
  v5 = 0.85;
  if (v3)
  {
    v5 = 1.0;
    v6 = 1.0;
  }
  else
  {
    v6 = 0.8;
  }
  objc_msgSend(v4, "setDampingRatio:response:", v5, 0.5);
  objc_msgSend(v4, "setTrackingDampingRatio:response:dampingRatioSmoothing:responseSmoothing:", v6, 0.4, 0.08, 0.08);
  return v4;
}

- (UIViewSpringAnimationBehavior)animationBehavior
{
  UIViewSpringAnimationBehavior *animationBehavior;
  UIViewSpringAnimationBehavior *v4;
  UIViewSpringAnimationBehavior *v5;

  animationBehavior = self->_animationBehavior;
  if (!animationBehavior)
  {
    -[_UIContextMenuPanController _createAnimationBehaviorWithCriticalDamping:](self, "_createAnimationBehaviorWithCriticalDamping:", 0);
    v4 = (UIViewSpringAnimationBehavior *)objc_claimAutoreleasedReturnValue();
    v5 = self->_animationBehavior;
    self->_animationBehavior = v4;

    animationBehavior = self->_animationBehavior;
  }
  return animationBehavior;
}

- (id)criticallyDampedAnimationBehavior
{
  return -[_UIContextMenuPanController _createAnimationBehaviorWithCriticalDamping:](self, "_createAnimationBehaviorWithCriticalDamping:", 1);
}

- (void)_animationsForPreviewPlusActionsStyleWithTranslation:(CAPoint3D)a3 location:(CAPoint3D)a4
{
  double y;
  double z;
  double v6;
  double x;
  void *v9;
  double Height;
  double Width;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
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
  double v40;
  double MinY;
  double v42;
  _BOOL4 v43;
  _BOOL4 v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  CGAffineTransform v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  CGAffineTransform v65;
  CGAffineTransform v66;
  CGAffineTransform v67;
  CGAffineTransform v68;
  _BYTE v69[128];
  uint64_t v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  y = a4.y;
  z = a3.z;
  v6 = a3.y;
  x = a3.x;
  v70 = *MEMORY[0x1E0C80C00];
  -[_UIContextMenuPanController platterView](self, "platterView", a3.x, a3.y, a3.z, a4.x, a4.y, a4.z);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  Height = CGRectGetHeight(v71);
  objc_msgSend(v9, "bounds");
  Width = CGRectGetWidth(v72);
  -[_UIContextMenuPanController _rubberBandedTranslationForGestureTranslation:](self, "_rubberBandedTranslationForGestureTranslation:", x, v6, z);
  v14 = v13;
  v15 = v12;
  v17 = v16;
  v52 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v54 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v68.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v68.c = v52;
  v50 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v68.tx = v50;
  if (v12 <= 0.0)
  {
    v22 = fabs(v12) / (Height + -198.0);
    v23 = fmax(fmin(1.0 - v22 + fmin(198.0 / Height, 1.0) * v22, 1.0), 0.35);
    CGAffineTransformMakeScale(&v68, v23, v23);
  }
  else
  {
    v18 = fmax(fmin(1.0 - v12 / 250.0 + v12 / 250.0 * 0.7, 1.0), 0.7);
    objc_msgSend(v9, "center");
    v20 = y - v19;
    CGAffineTransformMakeTranslation(&v68, 0.0, v20);
    v66 = v68;
    CGAffineTransformScale(&v67, &v66, v18, v18);
    v68 = v67;
    v21 = -v20 / v18;
    if (v20 < 0.0)
      v21 = v18 * -v20;
    v66 = v68;
    CGAffineTransformTranslate(&v67, &v66, 0.0, v21);
    v68 = v67;
  }
  v65 = v68;
  objc_msgSend(v9, "setTransform:", &v65, v50, v52, v54);
  memset(&v67, 0, sizeof(v67));
  CGAffineTransformMakeTranslation(&v67, v14, v15);
  objc_msgSend(v9, "frame");
  v24 = (Height - CGRectGetHeight(v73)) * 0.5;
  if (v24 < 0.0)
    v24 = 0.0;
  v67.ty = v67.ty + v24;
  if (v67.ty < 0.0)
  {
    -[_UIContextMenuPanController menuAnchor](self, "menuAnchor");
    if (v64 == 4)
    {
      objc_msgSend(v9, "frame");
      v25 = (Width - CGRectGetWidth(v74)) * 0.5;
      if (v25 >= 0.0)
        v26 = v25;
      else
        v26 = 0.0;
      -[_UIContextMenuPanController menuAnchor](self, "menuAnchor");
      if (v63 == 8)
      {
        v27 = v26 + v67.tx;
      }
      else
      {
        if (v63 != 2)
          goto LABEL_18;
        v27 = v67.tx - v26;
      }
      v67.tx = v27;
    }
  }
LABEL_18:
  objc_msgSend(v9, "setCenter:", vaddq_f64(*(float64x2_t *)&v67.tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&v67.a, self->_originalPlatterCenter.x), vmulq_n_f64(*(float64x2_t *)&v67.c, self->_originalPlatterCenter.y))));
  objc_msgSend(v9, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setZPosition:", v17);

  -[_UIContextMenuPanController menuView](self, "menuView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[_UIContextMenuPanController originalMenuCenter](self, "originalMenuCenter");
    v31 = v30;
    -[_UIContextMenuPanController originalPlatterCenter](self, "originalPlatterCenter");
    v33 = v31 - v32;
    v34 = Height * 0.5;
    if (v33 > 0.0)
      v34 = -(Height * 0.5);
    v35 = v33 + v34;
    -[_UIContextMenuPanController menuAnchor](self, "menuAnchor");
    v36 = 1.0;
    if (v61 == 4)
      v37 = 1.0;
    else
      v37 = 0.5;
    if (v61 == 1)
      v37 = 0.0;
    if (v62 == 1)
      v37 = 0.0;
    if (v62 == 4)
      v38 = 1.0;
    else
      v38 = v37;
    objc_msgSend(v29, "center", v37);
    v40 = v39;
    objc_msgSend(v9, "frame");
    MinY = CGRectGetMinY(v75);
    objc_msgSend(v9, "frame");
    v42 = MinY + v38 * CGRectGetHeight(v76);
    *(_OWORD *)&v66.a = v55;
    *(_OWORD *)&v66.c = v53;
    *(_OWORD *)&v66.tx = v51;
    if (self->_clientAllowsDismissal)
    {
      v43 = -[_UIContextMenuPanController _canSwipeDownToDismiss](self, "_canSwipeDownToDismiss");
      v44 = 1;
      if (v15 > 50.0 && v43)
      {
        CGAffineTransformMakeScale(&v66, 0.2, 0.2);
        v44 = 0;
        v36 = 0.0;
      }
    }
    else
    {
      v44 = 1;
    }
    if (self->_menuViewIsVisible != v44)
    {
      self->_menuViewIsVisible = v44;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      -[_UIContextMenuPanController accessoryViews](self, "accessoryViews");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v47; ++i)
          {
            if (*(_QWORD *)v58 != v48)
              objc_enumerationMutation(v45);
            objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "setVisible:animated:", self->_menuViewIsVisible, 1);
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
        }
        while (v47);
      }

    }
    objc_msgSend(v29, "setCenter:", v40, v35 + v42);
    v56 = v66;
    objc_msgSend(v29, "setTransform:", &v56);
    objc_msgSend(v29, "setAlpha:", v36);
  }

}

- (void)_animationsForActionsStyleWithLocation:(CAPoint3D)a3 ended:(BOOL)a4
{
  _BOOL4 v4;
  double z;
  double y;
  double x;
  void *v9;
  void *v10;
  double defaultZPosition;
  void *v12;
  __int128 v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
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
  void *v30;
  void *v31;
  double currentDistanceToMenuScrubPath;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  uint64_t v39;
  CGAffineTransform v40;
  _OWORD v41[3];
  CGPoint v42;
  CGPoint v43;
  CGRect v44;
  CGRect v45;

  v4 = a4;
  z = a3.z;
  y = a3.y;
  x = a3.x;
  -[_UIContextMenuPanController platterView](self, "platterView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuPanController menuView](self, "menuView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_UIContextMenuPanController originalPlatterCenter](self, "originalPlatterCenter");
    objc_msgSend(v9, "setCenter:");
    defaultZPosition = self->_defaultZPosition;
    objc_msgSend(v9, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setZPosition:", defaultZPosition);

    v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v41[0] = *MEMORY[0x1E0C9BAA8];
    v41[1] = v13;
    v41[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v10, "setTransform:", v41);
  }
  else
  {
    if (!-[_UIContextMenuPanController _initialPointInPlatterIsValid](self, "_initialPointInPlatterIsValid"))
    {
      objc_msgSend(v9, "frame");
      v42.x = x;
      v42.y = y;
      if (CGRectContainsPoint(v44, v42))
      {
        self->_initialLocationInsidePreview.x = x;
        self->_initialLocationInsidePreview.y = y;
      }
    }
    if (-[_UIContextMenuPanController _initialPointInPlatterIsValid](self, "_initialPointInPlatterIsValid"))
    {
      -[_UIContextMenuPanController _rubberBandedTranslationForGestureTranslation:](self, "_rubberBandedTranslationForGestureTranslation:", x - self->_initialLocationInsidePreview.x, y - self->_initialLocationInsidePreview.y, z - self->_defaultZPosition);
      memset(&v40, 0, sizeof(v40));
      CGAffineTransformMakeTranslation(&v40, v14, v15);
      -[_UIContextMenuPanController originalPlatterCenter](self, "originalPlatterCenter");
      v18 = v40.tx + v16 * v40.a + v17 * v40.c;
      v19 = v40.ty + v16 * v40.b + v17 * v40.d;
      -[_UIContextMenuPanController originalPlatterCenter](self, "originalPlatterCenter");
      v21 = v20;
      v23 = v22;
      -[_UIContextMenuPanController originalMenuCenter](self, "originalMenuCenter");
      v25 = v24;
      v27 = v26;
      -[_UIContextMenuPanController menuAnchor](self, "menuAnchor");
      v28 = vabdd_f64(v27, v23);
      v29 = vabdd_f64(v25, v21);
      switch(v39)
      {
        case 1:
          v28 = v27 + v28;
          if (v19 < v28)
            v19 = v28;
          break;
        case 2:
          v28 = v25 + v29;
          if (v18 < v25 + v29)
            v18 = v25 + v29;
          break;
        case 4:
          v28 = v27 - v28;
          if (v19 >= v28)
            v19 = v28;
          break;
        case 8:
          v28 = v25 - v29;
          if (v18 >= v25 - v29)
            v18 = v25 - v29;
          break;
        default:
          break;
      }
      objc_msgSend(v10, "frame", v28, v29);
      v43.x = x;
      v43.y = y;
      if (!CGRectContainsPoint(v45, v43))
        objc_msgSend(v9, "setCenter:", v18, v19);
    }
    objc_msgSend(v10, "traitCollection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v30, "userInterfaceIdiom"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    currentDistanceToMenuScrubPath = self->_currentDistanceToMenuScrubPath;
    -[_UIContextMenuPanController _dragTearOffThreshold](self, "_dragTearOffThreshold");
    v34 = currentDistanceToMenuScrubPath / v33;
    objc_msgSend(v31, "menuMinimumScale");
    v36 = fmax(v35, fmin(1.0 - v34 + v34 * 0.95, 1.0));
    CGAffineTransformMakeScale(&v38, v36, v36);
    v37 = v38;
    objc_msgSend(v10, "setTransform:", &v37);

  }
}

- (void)_animationsForAnyAttachedAccessoryViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  double MinX;
  double v28;
  double v29;
  double MinY;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v43 = *MEMORY[0x1E0C80C00];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[_UIContextMenuPanController accessoryViews](self, "accessoryViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v39;
    v35 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v36 = *MEMORY[0x1E0C9D648];
    v33 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v34 = *(double *)(MEMORY[0x1E0C9D648] + 16);
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v7);
      if (!objc_msgSend(v8, "trackingAxis", *(_QWORD *)&v33, *(_QWORD *)&v34, *(_QWORD *)&v35, *(_QWORD *)&v36))
        break;
      v9 = objc_msgSend(v8, "location");
      if (v9 == 1)
      {
        -[_UIContextMenuPanController platterView](self, "platterView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v9 != 2)
        {
          v10 = v33;
          v11 = v34;
          v12 = v35;
          v13 = v36;
          if (!v9)
            break;
          goto LABEL_14;
        }
        -[_UIContextMenuPanController menuView](self, "menuView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = v14;
      objc_msgSend(v14, "frame");
      v13 = v16;
      v12 = v17;
      v11 = v18;
      v10 = v19;

LABEL_14:
      objc_msgSend(v8, "center");
      v21 = v20;
      v23 = v22;
      if (v8)
      {
        objc_msgSend(v8, "anchor");
        v24 = v37 - 1;
        v25 = 0.5;
        v26 = 0.5;
        if ((unint64_t)(v37 - 1) <= 7)
        {
          v25 = dbl_18667A010[v24];
          v26 = dbl_18667A050[v24];
        }
      }
      else
      {
        v25 = 0.5;
        v26 = 0.5;
        v37 = 0u;
      }
      switch(*((_QWORD *)&v37 + 1))
      {
        case 1:
          v25 = 0.0;
          break;
        case 2:
          v26 = 0.0;
          break;
        case 4:
          v25 = 1.0;
          break;
        case 8:
          v26 = 1.0;
          break;
        default:
          break;
      }
      if ((objc_msgSend(v8, "trackingAxis") & 1) != 0)
      {
        v44.origin.x = v13;
        v44.origin.y = v12;
        v44.size.width = v11;
        v44.size.height = v10;
        MinX = CGRectGetMinX(v44);
        v45.origin.x = v13;
        v45.origin.y = v12;
        v45.size.width = v11;
        v45.size.height = v10;
        v28 = MinX + v26 * CGRectGetWidth(v45);
        objc_msgSend(v8, "offset");
        v21 = v28 + v29;
      }
      if ((objc_msgSend(v8, "trackingAxis") & 2) != 0)
      {
        v46.origin.x = v13;
        v46.origin.y = v12;
        v46.size.width = v11;
        v46.size.height = v10;
        MinY = CGRectGetMinY(v46);
        v47.origin.x = v13;
        v47.origin.y = v12;
        v47.size.width = v11;
        v47.size.height = v10;
        v31 = MinY + v25 * CGRectGetHeight(v47);
        objc_msgSend(v8, "offset");
        v23 = v31 + v32;
      }
      objc_msgSend(v8, "setCenter:", v21, v23);
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (BOOL)_initialPointInPlatterIsValid
{
  return self->_initialLocationInsidePreview.y != 1.79769313e308
      || self->_initialLocationInsidePreview.x != 1.79769313e308;
}

- (void)scrollObservationInteraction:(id)a3 willBeginAtLocation:(CGPoint)a4
{
  -[_UIContextMenuPanController _updateForGestureWithState:translation:location:allowsDragging:](self, "_updateForGestureWithState:translation:location:allowsDragging:", 1, 0, *MEMORY[0x1E0CD2538], *(double *)(MEMORY[0x1E0CD2538] + 8), *(double *)(MEMORY[0x1E0CD2538] + 16), a4.x, a4.y, 0.0);
}

- (void)scrollObservationInteraction:(id)a3 didUpdateWithTranslation:(CGPoint)a4 location:(CGPoint)a5 ended:(BOOL)a6
{
  uint64_t v6;

  if (a6)
    v6 = 3;
  else
    v6 = 2;
  -[_UIContextMenuPanController _updateForGestureWithState:translation:location:allowsDragging:](self, "_updateForGestureWithState:translation:location:allowsDragging:", v6, 0, a4.x, a4.y, 0.0, a5.x, a5.y, 0.0);
}

- (int64_t)_userInterfaceIdiom
{
  void *v2;
  void *v3;
  int64_t v4;

  -[_UIContextMenuPanController platterView](self, "platterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  return v4;
}

- (id)_currentPlatformMetrics
{
  return _UIContextMenuGetPlatformMetrics(-[_UIContextMenuPanController _userInterfaceIdiom](self, "_userInterfaceIdiom"));
}

- (CAPoint3D)_rubberBandedTranslationForGestureTranslation:(CAPoint3D)a3
{
  double z;
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  __double2 v20;
  double v21;
  double v22;
  double v23;
  CAPoint3D result;

  z = a3.z;
  y = a3.y;
  x = a3.x;
  -[_UIContextMenuPanController _rangeOfMotion](self, "_rangeOfMotion");
  v8 = v7;
  -[_UIContextMenuPanController _dragTearOffThreshold](self, "_dragTearOffThreshold");
  v10 = v9;
  if (-[_UIContextMenuPanController rubberbandingEdges](self, "rubberbandingEdges") == 15 || y < -v8)
  {
    v14 = y + v8;
    v15 = hypot(x, v14);
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v16, "userInterfaceIdiom"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "previewRubberbandingCoefficient");
    if (v15 <= 0.0)
    {
      if (v15 < 0.0)
        v15 = -((1.0 - 1.0 / (1.0 - v15 / v10 * v18)) * v10);
    }
    else
    {
      v15 = v10 * (1.0 - 1.0 / (v15 / v10 * v18 + 1.0));
    }

    v19 = atan2(v14, x);
    v20 = __sincos_stret(v19);
    x = v15 * v20.__cosval;
    y = v15 * v20.__sinval - v8;
  }
  else
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v11, "userInterfaceIdiom"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "previewRubberbandingCoefficient");
    if (x <= 0.0)
    {
      if (x < 0.0)
        x = -((1.0 - 1.0 / (1.0 - x / v10 * v13)) * v10);
    }
    else
    {
      x = v10 * (1.0 - 1.0 / (x / v10 * v13 + 1.0));
    }

  }
  v21 = x;
  v22 = y;
  v23 = z;
  result.z = v23;
  result.y = v22;
  result.x = v21;
  return result;
}

- (void)_updatePlatterGestureDebugUIWithTranslation:(CGPoint)a3 location:(CGPoint)a4 invalidate:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  double v8;
  double v9;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  const CGPath *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  CGAffineTransform v65;
  CGAffineTransform v66;
  CGRect v67;
  CGRect v68;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_ClickUIDebugEnabled, (uint64_t)CFSTR("ClickUIDebugEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| !byte_1EDDA7D7C)
  {
    return;
  }
  if (!_MergedGlobals_16)
  {
    +[UIColor systemOrangeColor](UIColor, "systemOrangeColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDebugDot dotWithTitle:color:](_UIDebugDot, "dotWithTitle:color:", CFSTR("Translated Platter Center"), v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)_MergedGlobals_16;
    _MergedGlobals_16 = v12;

    v5 = 1;
  }
  if (!qword_1EDDAFE48)
  {
    +[UIColor blueColor](UIColor, "blueColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDebugDot dotWithTitle:color:](_UIDebugDot, "dotWithTitle:color:", CFSTR("Rubberbanded Platter Center"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)qword_1EDDAFE48;
    qword_1EDDAFE48 = v15;

  }
  if (!qword_1EDDAFE50)
  {
    +[UIColor brownColor](UIColor, "brownColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDebugDot dotWithTitle:color:](_UIDebugDot, "dotWithTitle:color:", CFSTR("Original Platter Center"), v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)qword_1EDDAFE50;
    qword_1EDDAFE50 = v18;

  }
  if (!qword_1EDDAFE58)
  {
    +[UIColor redColor](UIColor, "redColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDebugDot dotWithTitle:color:](_UIDebugDot, "dotWithTitle:color:", CFSTR("Actual Touch"), v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)qword_1EDDAFE58;
    qword_1EDDAFE58 = v21;

  }
  if (v5)
  {
    objc_msgSend((id)qword_1EDDAFE60, "removeFromSuperview");
    v23 = (void *)qword_1EDDAFE60;
    qword_1EDDAFE60 = 0;

  }
  if (!qword_1EDDAFE60)
  {
    v24 = objc_opt_new();
    v25 = (void *)qword_1EDDAFE60;
    qword_1EDDAFE60 = v24;

    +[UIColor redColor](UIColor, "redColor");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27 = objc_msgSend(v26, "CGColor");
    objc_msgSend((id)qword_1EDDAFE60, "shapeLayer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFillColor:", v27);

    v29 = -[UIBezierPath CGPath](self->_menuScrubPath, "CGPath");
    objc_msgSend((id)qword_1EDDAFE60, "shapeLayer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setPath:", v29);

    objc_msgSend((id)qword_1EDDAFE60, "setAlpha:", 0.2);
  }
  if (!-[_UIContextMenuPanController _canSwipeDownToDismiss](self, "_canSwipeDownToDismiss"))
  {
    if (!qword_1EDDAFE68)
    {
      v31 = objc_opt_new();
      v32 = (void *)qword_1EDDAFE68;
      qword_1EDDAFE68 = v31;

      +[UIColor redColor](UIColor, "redColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)qword_1EDDAFE68, "setBackgroundColor:", v33);

      +[UIColor whiteColor](UIColor, "whiteColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)qword_1EDDAFE68, "setTextColor:", v34);

      objc_msgSend(off_1E167A828, "monospacedSystemFontOfSize:weight:", 15.0, *(double *)off_1E167DC68);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)qword_1EDDAFE68, "setFont:", v35);

    }
    -[_UIContextMenuPanController containerView](self, "containerView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", qword_1EDDAFE68);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Distance from path edge: %.2f"), *(_QWORD *)&self->_currentDistanceToMenuScrubPath);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1EDDAFE68, "setText:", v37);

    objc_msgSend((id)qword_1EDDAFE68, "setTextAlignment:", 1);
    objc_msgSend((id)qword_1EDDAFE68, "sizeToFit");
    objc_msgSend((id)qword_1EDDAFE68, "setClipsToBounds:", 1);
    objc_msgSend((id)qword_1EDDAFE68, "_setContinuousCornerRadius:", 4.0);
    -[_UIContextMenuPanController containerView](self, "containerView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "safeAreaInsets");
    v40 = v39;

    if (v40 < 8.0)
      v40 = 8.0;
    -[_UIContextMenuPanController containerView](self, "containerView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "safeAreaInsets");
    v43 = v42;

    if (v43 < 8.0)
      v43 = 8.0;
    objc_msgSend((id)qword_1EDDAFE68, "bounds");
    v68 = CGRectInset(v67, -4.0, -1.0);
    objc_msgSend((id)qword_1EDDAFE68, "setFrame:", v40, v43, v68.size.width, v68.size.height);
  }
  if (qword_1EDDAFE70)
  {
    if (v5)
    {
LABEL_25:
      -[_UIContextMenuPanController platterView](self, "platterView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "center");
      objc_msgSend((id)qword_1EDDAFE50, "setCenter:");

      -[_UIContextMenuPanController platterView](self, "platterView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "center");
      objc_msgSend((id)qword_1EDDAFE48, "setCenter:");

      -[_UIContextMenuPanController platterView](self, "platterView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "center");
      objc_msgSend((id)_MergedGlobals_16, "setCenter:");

      goto LABEL_28;
    }
  }
  else
  {
    +[UIColor purpleColor](UIColor, "purpleColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDebugDot dotWithTitle:color:](_UIDebugDot, "dotWithTitle:color:", CFSTR("Menu Anchor Point"), v47);
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)qword_1EDDAFE70;
    qword_1EDDAFE70 = v48;

    if (v5)
      goto LABEL_25;
  }
  -[_UIContextMenuPanController _rubberBandedTranslationForGestureTranslation:](self, "_rubberBandedTranslationForGestureTranslation:", v9, v8, 0.0);
  v51 = v50;
  v53 = v52;
  CGAffineTransformMakeTranslation(&v66, v9, v8);
  v65 = v66;
  objc_msgSend((id)_MergedGlobals_16, "setTransform:", &v65);
  CGAffineTransformMakeTranslation(&v64, v51, v53);
  v63 = v64;
  objc_msgSend((id)qword_1EDDAFE48, "setTransform:", &v63);
  objc_msgSend((id)qword_1EDDAFE58, "setCenter:", x, y);
LABEL_28:
  -[_UIContextMenuPanController menuView](self, "menuView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "center");
  objc_msgSend((id)qword_1EDDAFE70, "setCenter:");

  objc_msgSend((id)qword_1EDDAFE60, "superview");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v55)
  {
    -[_UIContextMenuPanController platterView](self, "platterView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "superview");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v57;
    if (v57)
    {
      v59 = v57;
    }
    else
    {
      -[_UIContextMenuPanController menuView](self, "menuView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "superview");
      v59 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v59, "addSubview:", qword_1EDDAFE60);
    objc_msgSend(v59, "addSubview:", qword_1EDDAFE58);
    -[_UIContextMenuPanController platterView](self, "platterView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (v61)
    {
      objc_msgSend(v59, "addSubview:", qword_1EDDAFE50);
      objc_msgSend(v59, "addSubview:", qword_1EDDAFE48);
      objc_msgSend(v59, "addSubview:", _MergedGlobals_16);
    }
    -[_UIContextMenuPanController menuView](self, "menuView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
      objc_msgSend(v59, "addSubview:", qword_1EDDAFE70);

  }
}

- (_UIContextMenuPanControllerDelegate)delegate
{
  return (_UIContextMenuPanControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)platterPivotRotationEnabled
{
  return self->_platterPivotRotationEnabled;
}

- (void)setPlatterPivotRotationEnabled:(BOOL)a3
{
  self->_platterPivotRotationEnabled = a3;
}

- (NSArray)detents
{
  return self->_detents;
}

- (CGPoint)originalPlatterCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_originalPlatterCenter.x;
  y = self->_originalPlatterCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)originalMenuCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_originalMenuCenter.x;
  y = self->_originalMenuCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- ($9638EFF0CCCAFE90921E224CC361F7AC)menuAnchor
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[4].var3;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = *(_QWORD *)&self[5].var2;
  return self;
}

- (void)setMenuAnchor:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var2;
  self->_menuAnchor.gravity = a3->var4;
  *(_OWORD *)&self->_menuAnchor.attachmentOffset = v4;
  *(_OWORD *)&self->_menuAnchor.attachment = v3;
}

- (unint64_t)rubberbandingEdges
{
  return self->_rubberbandingEdges;
}

- (void)setRubberbandingEdges:(unint64_t)a3
{
  self->_rubberbandingEdges = a3;
}

- (NSArray)accessoryViews
{
  return self->_accessoryViews;
}

- (void)setAccessoryViews:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViews, a3);
}

- (UIView)menuView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_menuView);
}

- (void)setMenuView:(id)a3
{
  objc_storeWeak((id *)&self->_menuView, a3);
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

- (_UIVelocityIntegrator)velocityIntegrator
{
  return self->_velocityIntegrator;
}

- (void)setVelocityIntegrator:(id)a3
{
  objc_storeStrong((id *)&self->_velocityIntegrator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_velocityIntegrator, 0);
  objc_destroyWeak((id *)&self->_platterView);
  objc_destroyWeak((id *)&self->_containerView);
  objc_destroyWeak((id *)&self->_menuView);
  objc_storeStrong((id *)&self->_accessoryViews, 0);
  objc_storeStrong((id *)&self->_detents, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animationBehavior, 0);
  objc_storeStrong((id *)&self->_menuScrubPath, 0);
}

@end
