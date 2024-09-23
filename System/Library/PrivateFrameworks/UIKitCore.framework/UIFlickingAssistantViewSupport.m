@implementation UIFlickingAssistantViewSupport

- (BOOL)handlingFlickGesture
{
  return -[UIGestureRecognizer state](self->_panRecognizer, "state") != UIGestureRecognizerStatePossible;
}

- (void)_disconnectingController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIPanGestureRecognizer *panRecognizer;
  UIInputViewSetPlacement *remotePlacement;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  objc_msgSend(v4, "applicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "draggableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeGestureRecognizer:", self->_panRecognizer);

  panRecognizer = self->_panRecognizer;
  self->_panRecognizer = 0;

  remotePlacement = self->_remotePlacement;
  self->_remotePlacement = 0;

  -[UISplitKeyboardSource view](self->super._controller, "view");
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[UIView _removeGeometryChangeObserver:](v9, self);

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "systemInputAssistantViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObserver:forKeyPath:", self, CFSTR("bounds"));

  v14.receiver = self;
  v14.super_class = (Class)UIFlickingAssistantViewSupport;
  -[UIKeyboardMotionSupport _disconnectingController:](&v14, sel__disconnectingController_, v4);

}

- (void)_connectController:(id)a3
{
  id v4;
  _QWORD *v5;
  UIPanGestureRecognizer *v6;
  UIPanGestureRecognizer *panRecognizer;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIFlickingAssistantViewSupport;
  -[UIKeyboardMotionSupport _connectController:](&v14, sel__connectController_, v4);
  -[UISplitKeyboardSource view](self->super._controller, "view");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[UIView _addGeometryChangeObserver:](v5, self);

  if (!+[UIKeyboardImpl isFloatingForced](UIKeyboardImpl, "isFloatingForced"))
  {
    v6 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", self, sel_panGestureHandler_);
    panRecognizer = self->_panRecognizer;
    self->_panRecognizer = v6;

    -[UIPanGestureRecognizer setFailsPastMaxTouches:](self->_panRecognizer, "setFailsPastMaxTouches:", 1);
    -[UIGestureRecognizer setDelaysTouchesEnded:](self->_panRecognizer, "setDelaysTouchesEnded:", 0);
    -[UIGestureRecognizer setCancelsTouchesInView:](self->_panRecognizer, "setCancelsTouchesInView:", 1);
    -[UIPanGestureRecognizer setMinimumNumberOfTouches:](self->_panRecognizer, "setMinimumNumberOfTouches:", 1);
    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](self->_panRecognizer, "setMaximumNumberOfTouches:", 1);
    -[UIPanGestureRecognizer _setHysteresis:](self->_panRecognizer, "_setHysteresis:", 30.0);
  }
  -[UIFlickingAssistantViewSupport _initalizePosition](self, "_initalizePosition");
  if (self->_panRecognizer)
  {
    objc_msgSend(v4, "applicator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "draggableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addGestureRecognizer:", self->_panRecognizer);

  }
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "systemInputAssistantViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 3, 0);

}

- (void)_updatedController
{
  UIPanGestureRecognizer *panRecognizer;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIFlickingAssistantViewSupport;
  -[UIKeyboardMotionSupport _updatedController](&v12, sel__updatedController);
  panRecognizer = self->_panRecognizer;
  if (panRecognizer)
  {
    -[UIGestureRecognizer view](panRecognizer, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardMotionSupport masterController](self, "masterController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "draggableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 != v7)
    {
      -[UIGestureRecognizer view](self->_panRecognizer, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeGestureRecognizer:", self->_panRecognizer);

      -[UIKeyboardMotionSupport masterController](self, "masterController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "applicator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "draggableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addGestureRecognizer:", self->_panRecognizer);

    }
  }
  -[UIFlickingAssistantViewSupport _initalizePosition](self, "_initalizePosition");
}

- (void)setPositionAndVisualStateByPersistentLocation:(BOOL)a3 minimize:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  int64_t v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int64_t v22;
  id v23;

  v4 = a4;
  v5 = a3;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferencesActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "compactAssistantBarPersistentLocation");

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "systemInputAssistantViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "systemInputAssistantView");
  v23 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (objc_msgSend(v23, "isInputAssistantItemHidden"))
    {
      v12 = objc_msgSend(v23, "centerViewHidden");
      v13 = v9 & 4;
      if ((v12 & 1) != 0 || (v9 & 4) != 0)
      {
LABEL_14:
        v15 = v13 == 0;
        v16 = 3;
        if (v15)
          v17 = 3;
        else
          v17 = 1;
        self->_visualState = v17;
        v14 = v23;
        if ((v9 & 1) == 0)
        {
          if ((v9 & 2) == 0)
          {
            +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "inputDelegate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "textInputView");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "_shouldReverseLayoutDirection");
            v22 = 2;
            if (v21)
              v22 = 3;
            self->_position = v22;

            goto LABEL_10;
          }
          v16 = 2;
        }
        self->_position = v16;
        goto LABEL_24;
      }
    }
    else if ((v9 & 4) != 0)
    {
      v13 = v9 & 4;
      goto LABEL_14;
    }
  }
  if (UIAssistantViewAllowsMinimization() && v4)
  {
    self->_position = self->_lastMinimizedPosition;
    self->_visualState = 1;
LABEL_10:

    return;
  }
  v14 = v23;
  if (v5)
  {
    self->_visualState = 2;
    self->_position = 1;
  }
LABEL_24:

}

- (void)_initalizePosition
{
  UIInputViewSetPlacement *remotePlacement;
  int v4;
  int64_t v5;
  UIInputViewSetPlacement *v6;
  void *v7;
  char v8;

  remotePlacement = self->_remotePlacement;
  if (remotePlacement)
  {
    if (-[UIInputViewSetPlacement isCompactAssistantView](remotePlacement, "isCompactAssistantView"))
    {
      self->_visualState = 1;
      v4 = -[UIInputViewSetPlacement isMemberOfClass:](self->_remotePlacement, "isMemberOfClass:", objc_opt_class());
      v5 = 2;
      if (!v4)
        v5 = 3;
      self->_position = v5;
      self->_lastMinimizedPosition = v5;
      -[UIKeyboardMotionSupport translateToPlacement:animated:](self, "translateToPlacement:animated:", self->_remotePlacement, 0);
    }
    v6 = self->_remotePlacement;
    self->_remotePlacement = 0;

  }
  else if (self->_visualState == 1
         && (-[UISplitKeyboardSource placement](self->super._controller, "placement"),
             v7 = (void *)objc_claimAutoreleasedReturnValue(),
             v8 = objc_msgSend(v7, "isCompactAssistantView"),
             v7,
             (v8 & 1) != 0))
  {
    -[UIFlickingAssistantViewSupport setPositionAndVisualStateByPersistentLocation:minimize:](self, "setPositionAndVisualStateByPersistentLocation:minimize:", 0, 0);
  }
  else
  {
    -[UIFlickingAssistantViewSupport setPositionAndVisualStateByPersistentLocation:minimize:](self, "setPositionAndVisualStateByPersistentLocation:minimize:", 1, 0);
    self->_lastMinimizedPosition = 2;
  }
  -[UIFlickingAssistantViewSupport keyboardOriginFromAssistantViewPosition:](self, "keyboardOriginFromAssistantViewPosition:", self->_position);
  -[UIFlickingAssistantViewSupport updateTransition:animated:](self, "updateTransition:animated:", 0);
}

- (void)panGestureHandler:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  BOOL v25;
  uint64_t v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  _BOOL4 v30;
  int64_t v31;
  void *v32;
  void *v33;
  int v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  void *v39;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  int64_t v44;
  unint64_t v45;
  CGFloat MaxY;
  CGFloat MinX;
  CGFloat v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  double v52;
  char v53;
  double v54;
  int64_t v55;
  int64_t *p_position;
  int *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  void *v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  uint64_t v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  _BOOL4 v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  void *v98;
  CGFloat MaxX;
  id v100;
  _QWORD v101[5];
  CGPoint v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;

  v101[4] = *MEMORY[0x1E0C80C00];
  v100 = a3;
  -[UISplitKeyboardSource hostView](self->super._controller, "hostView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    +[UIInputSwitcherView activeInstance](UIInputSwitcherView, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isVisible");

    if ((v7 & 1) == 0)
    {
      -[UISplitKeyboardSource inputViewSet](self->super._controller, "inputViewSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "inputAccessoryView");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        -[UISplitKeyboardSource inputViewSet](self->super._controller, "inputViewSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isInputAccessoryViewPlaceholder");

        if (!v12)
          goto LABEL_49;
      }
      else
      {

      }
      if (!+[UIKeyboardImpl isFloatingForced](UIKeyboardImpl, "isFloatingForced"))
        goto LABEL_9;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "locationInView:", v22);
      v102.x = v23;
      v102.y = v24;
      v103.origin.x = v15;
      v103.origin.y = v17;
      v103.size.width = v19;
      v103.size.height = v21;
      v25 = CGRectContainsPoint(v103, v102);

      if (!v25)
      {
LABEL_9:
        v26 = objc_msgSend(v100, "state");
        if ((unint64_t)(v26 - 3) >= 2)
        {
          if (v26 == 2)
          {
            +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "systemInputAssistantViewController");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "predictionViewController");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "predictionView");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "cancelTapGestureRecognizer");

            -[UISplitKeyboardSource view](self->super._controller, "view");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "locationInView:", v63);
            v65 = v64;
            v67 = v66;

            -[UISplitKeyboardSource view](self->super._controller, "view");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "bounds");
            v73 = UIAssistantViewVisualStateForPointInRect(self->_visualState == 3, v69, v70, v71, v72, v65, v67);

            if ((v73 | 2) == 3)
              -[UIFlickingAssistantViewSupport transitToDraggingVisualState:withTouchLocation:](self, "transitToDraggingVisualState:withTouchLocation:", v73, v65, v67);
            objc_msgSend(v100, "view");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setNeedsLayout");

            -[UIFlickingAssistantViewSupport barOriginFromTouchPoint:](self, "barOriginFromTouchPoint:", v65, v67);
            v76 = v75;
            v78 = v77;
            if (v73 == 3)
            {
              +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "systemInputAssistantViewController");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              v81 = objc_msgSend(v80, "updateFloatingAssistantRectEdge:position:", 2, v76, v78);

              if (v81)
                v76 = 0.0;
            }
            -[UIFlickingAssistantViewSupport updateTransition:animated:](self, "updateTransition:animated:", 1, v76, v78);
          }
          else if (v26 == 1)
          {
            -[UISplitKeyboardSource view](self->super._controller, "view");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "locationInView:", v27);
            self->_initalTouchPoint.x = v28;
            self->_initalTouchPoint.y = v29;

            if (self->_visualState >= 2uLL)
            {
              v30 = -[UIFlickingAssistantViewSupport isInputAssistantItemHidden](self, "isInputAssistantItemHidden");
              v31 = 2;
              if (v30)
                v31 = 3;
              self->_visualState = v31;
            }
          }
          goto LABEL_49;
        }
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "visualModeManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "shouldShowWithinAppWindow");

        -[UIFlickingAssistantViewSupport projectedLandingPointForGestureRecognizerEnd:](self, "projectedLandingPointForGestureRecognizerEnd:", v100);
        v36 = v35;
        v38 = v37;
        -[UISplitKeyboardSource view](self->super._controller, "view");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "bounds");
        v105 = CGRectInset(v104, 16.0, 16.0);
        x = v105.origin.x;
        y = v105.origin.y;
        width = v105.size.width;
        height = v105.size.height;

        v44 = UIAssistantViewVisualStateForPointInRect(self->_visualState == 3, x, y, width, height, v36, v38);
        v45 = v44;
        if ((v44 | 2) == 3)
        {
          v106.origin.x = x;
          v106.origin.y = y;
          v106.size.width = width;
          v106.size.height = height;
          MaxX = CGRectGetMaxX(v106);
          v107.origin.x = x;
          v107.origin.y = y;
          v107.size.width = width;
          v107.size.height = height;
          MaxY = CGRectGetMaxY(v107);
          v108.origin.x = x;
          v108.origin.y = y;
          v108.size.width = width;
          v108.size.height = height;
          MinX = CGRectGetMinX(v108);
          v109.origin.x = x;
          v109.origin.y = y;
          v109.size.width = width;
          v109.size.height = height;
          v48 = CGRectGetMaxY(v109);
          v49 = 0;
          *(CGFloat *)v101 = MaxX;
          *(CGFloat *)&v101[1] = MaxY;
          *(CGFloat *)&v101[2] = MinX;
          *(CGFloat *)&v101[3] = v48;
          v50 = 1;
          v51 = 1;
          v52 = 3.40282347e38;
          do
          {
            v53 = v50;
            v54 = sqrt((*(double *)&v101[2 * v49] - v36) * (*(double *)&v101[2 * v49] - v36)+ (*(double *)&v101[2 * v49 + 1] - v38) * (*(double *)&v101[2 * v49 + 1] - v38));
            if (v54 < v52)
            {
              v51 = qword_186681530[v49];
              v52 = v54;
            }
            v50 = 0;
            v49 = 1;
          }
          while ((v53 & 1) != 0);
          if (v51 == 4)
            v55 = 3;
          else
            v55 = 2 * (v51 == 8);
          p_position = &self->_position;
          self->_position = v55;
          self->_visualState = v45;
          self->_draggingState = 0;
          if (v45 > 1)
            goto LABEL_34;
          v57 = &OBJC_IVAR___UIFlickingAssistantViewSupport__lastMinimizedPosition;
          v58 = v55;
        }
        else
        {
          v55 = 0;
          v57 = &OBJC_IVAR___UIFlickingAssistantViewSupport__draggingState;
          p_position = &self->_position;
          v58 = 1;
          self->_position = 1;
          self->_visualState = v44;
        }
        *(Class *)((char *)&self->super.super.isa + *v57) = (Class)v55;
        v55 = v58;
LABEL_34:
        UIInputViewSetPlacementFromAssistantViewVisualState(v45, v55, 0);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        if (v82)
        {
          v83 = v45 == 1;
          +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "preferencesActions");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = objc_msgSend(v85, "compactAssistantBarPersistentLocation");

          v87 = 4 * v83;
          v88 = v86 & 0xFFFFFFFFFFFFFFFBLL | (4 * v83);
          v89 = v87 | 2;
          v90 = v87 | 1;
          if (v55 != 3)
            v90 = v88;
          if (v55 == 2)
            v91 = v89;
          else
            v91 = v90;
          +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "preferencesActions");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "setCompactAssistantBarPersistentLocation:", v91);

          +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "preferencesActions");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "synchronizePreferences");

        }
        objc_msgSend(v32, "visualModeManager");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = objc_msgSend(v96, "shouldShowWithinAppWindow");

        if (v34 == v97)
        {
          if (v82)
            -[UIKeyboardMotionSupport translateToPlacement:animated:](self, "translateToPlacement:animated:", v82, 1);
          self->_shouldNotifyCompletion = 1;
          -[UIFlickingAssistantViewSupport keyboardOriginFromAssistantViewPosition:](self, "keyboardOriginFromAssistantViewPosition:", *p_position);
          -[UIFlickingAssistantViewSupport updateTransition:animated:](self, "updateTransition:animated:", 1);
          -[UIFlickingAssistantViewSupport assistantFrame](self, "assistantFrame");
          -[UIFlickingAssistantViewSupport _updateKeyboardLayoutGuideForAssistantFrame:](self, "_updateKeyboardLayoutGuideForAssistantFrame:");
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "updateAssistantView");
        }
        else
        {
          if (v82)
            -[UIKeyboardMotionSupport translateToPlacement:animated:](self, "translateToPlacement:animated:", v82, 0);
          objc_msgSend(v32, "responder");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "_reloadInputViewsForResponder:", v98);
        }

      }
    }
  }
LABEL_49:

}

- (BOOL)isInputAssistantItemHidden
{
  void *v2;
  void *v3;
  char v4;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemInputAssistantViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInputAssistantItemEmpty");

  return v4;
}

- (void)transitToDraggingVisualState:(int64_t)a3 withTouchLocation:(CGPoint)a4
{
  double y;
  double x;
  id v8;
  id v9;

  y = a4.y;
  x = a4.x;
  if (-[UIFlickingAssistantViewSupport draggingState](self, "draggingState") != a3)
  {
    -[UIFlickingAssistantViewSupport setDraggingState:](self, "setDraggingState:", a3);
    UIInputViewSetPlacementFromAssistantViewVisualState(a3, 0, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isMemberOfClass:", objc_opt_class()))
    {
      v8 = v9;
      -[UIFlickingAssistantViewSupport barOriginFromTouchPoint:](self, "barOriginFromTouchPoint:", x, y);
      objc_msgSend(v8, "setOffset:");

    }
    if (v9)
      -[UIKeyboardMotionSupport translateToPlacement:animated:](self, "translateToPlacement:animated:", v9, 1);

  }
}

- (CGPoint)projectedLandingPointForGestureRecognizerEnd:(id)a3
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
  double v15;
  void *v16;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  double v20;
  double v21;
  double v23;
  CGFloat MaxX;
  CGFloat v25;
  CGFloat MinX;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  uint64_t v30;
  double v31;
  double v32;
  double *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  BOOL v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat y;
  _QWORD v48[3];
  _QWORD v49[4];
  _QWORD v50[4];
  _QWORD v51[5];
  CGPoint result;
  CGPoint v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  v51[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UISplitKeyboardSource view](self->super._controller, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[UISplitKeyboardSource view](self->super._controller, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "velocityInView:", v10);
  v12 = v11;
  v14 = v13;

  v15 = sqrt(v12 * v12 + v14 * v14);
  -[UISplitKeyboardSource view](self->super._controller, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v55 = CGRectInset(v54, 16.0, 16.0);
  x = v55.origin.x;
  y = v55.origin.y;
  width = v55.size.width;
  height = v55.size.height;

  if (v15 >= 2100.0)
  {
    v20 = *MEMORY[0x1E0C9D538];
    v21 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    if (v12 != *MEMORY[0x1E0C9D538] || v14 != v21)
    {
      v20 = v12 * (1.0 / v15);
      v21 = v14 * (1.0 / v15);
    }
    v23 = v7 + v20;
    v45 = v9 + v21;
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = width;
    v56.size.height = height;
    MaxX = CGRectGetMaxX(v56);
    v57.origin.x = x;
    v57.origin.y = y;
    v57.size.width = width;
    v57.size.height = height;
    *(CGFloat *)v51 = MaxX;
    v51[1] = CGRectGetMinY(v57);
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = width;
    v58.size.height = height;
    v25 = CGRectGetMaxX(v58);
    v59.origin.x = x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = height;
    *(CGFloat *)&v51[2] = v25;
    v51[3] = CGRectGetMaxY(v59);
    v60.origin.x = x;
    v60.origin.y = y;
    v60.size.width = width;
    v60.size.height = height;
    MinX = CGRectGetMinX(v60);
    v61.origin.x = x;
    v61.origin.y = y;
    v61.size.width = width;
    v61.size.height = height;
    *(CGFloat *)v50 = MinX;
    v50[1] = CGRectGetMaxY(v61);
    v62.origin.x = x;
    v62.origin.y = y;
    v62.size.width = width;
    v62.size.height = height;
    v27 = CGRectGetMaxX(v62);
    v63.origin.x = x;
    v63.origin.y = y;
    v63.size.width = width;
    v63.size.height = height;
    *(CGFloat *)&v50[2] = v27;
    v50[3] = CGRectGetMaxY(v63);
    v64.origin.x = x;
    v64.origin.y = y;
    v64.size.width = width;
    v64.size.height = height;
    v28 = CGRectGetMinX(v64);
    v65.origin.x = x;
    v65.origin.y = y;
    v65.size.width = width;
    v65.size.height = height;
    *(CGFloat *)v49 = v28;
    v49[1] = CGRectGetMinY(v65);
    v66.origin.x = x;
    v66.origin.y = y;
    v66.size.width = width;
    v66.size.height = height;
    v29 = CGRectGetMinX(v66);
    v46 = x;
    v67.origin.x = x;
    v67.origin.y = y;
    v67.size.width = width;
    v67.size.height = height;
    v30 = 0;
    *(CGFloat *)&v49[2] = v29;
    v49[3] = CGRectGetMaxY(v67);
    v48[0] = v51;
    v48[1] = v50;
    v31 = v23 - v7;
    v32 = v45 - v9;
    v48[2] = v49;
    while (1)
    {
      v33 = (double *)v48[v30];
      v34 = ((v33[2] - *v33) * (v33[1] - v9) + (v7 - *v33) * (v33[3] - v33[1]))
          / (v32 * (v33[2] - *v33) - v31 * (v33[3] - v33[1]));
      if (v34 >= 0.0)
      {
        v35 = v9 + v32 * v34;
        v36 = v7 + v31 * v34;
        -[UISplitKeyboardSource view](self->super._controller, "view");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "bounds");
        v53.x = v36;
        v53.y = v35;
        v38 = CGRectContainsPoint(v68, v53);

        if (v38)
          break;
      }
      if (++v30 == 3)
      {
        v35 = v9;
        v36 = v7;
        break;
      }
    }
    v9 = v35;
    v7 = v36;
    x = v46;
  }
  UIAssistantViewClosestReferencePointFromPointInRect(x, y, width, height, v7, v9);
  v40 = v39;
  v42 = v41;

  v43 = v40;
  v44 = v42;
  result.y = v44;
  result.x = v43;
  return result;
}

- (BOOL)isRTL
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteTextInputPartner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rtiDocumentTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "shouldReverseLayoutDirection");
  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textInputView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "_shouldReverseLayoutDirection");

  }
  return v5;
}

- (CGPoint)barOriginFromTouchPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  double v24;
  double v25;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[UISplitKeyboardSource view](self->super._controller, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "systemInputAssistantViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "barFrame");
  v14 = v13;
  v16 = v15;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "visualModeManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "shouldShowWithinAppWindow");

  if (v19)
  {
    v20 = v8 + -16.0;
    if (x < v8 + -16.0)
      v20 = x;
    x = fmax(v20, 16.0);
    v21 = v10 + -16.0;
    if (y < v10 + -16.0)
      v21 = y;
    y = fmax(v21, 16.0);
  }
  switch(-[UIFlickingAssistantViewSupport draggingState](self, "draggingState"))
  {
    case 0:
    case 2:
      v22 = x - self->_initalTouchPoint.x;
      break;
    case 1:
      v22 = x + v8 * -0.5;
      break;
    case 3:
      v23 = -[UIFlickingAssistantViewSupport isRTL](self, "isRTL");
      v24 = v8 - x;
      if (!v23)
        v24 = x;
      v22 = v24 + v14 * -0.5;
      break;
    default:
      break;
  }
  v25 = v10 - (v16 * 0.5 + y);
  result.y = v25;
  result.x = v22;
  return result;
}

- (void)updateTransition:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  void *v8;
  void *v9;
  int v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  __CFString *v16;
  _QWORD v17[4];
  __CFString *v18;
  id v19;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  if (self->_visualState == 3 && a3.x != 0.0)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemInputAssistantViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "updateFloatingAssistantRectEdge:position:", -[UIFlickingAssistantViewSupport rectEdgeFromPosition:](self, "rectEdgeFromPosition:", self->_position), x, y);

    if (v10)
      x = 0.0;
  }
  v11 = CFSTR("_UIFlickingAssistantViewGestureWithoutAnimation");
  if (v4)
    v11 = CFSTR("_UIFlickingAssistantViewGesture");
  v12 = v11;
  +[UIInputViewSetPlacementAssistantOnScreen infoWithPoint:isCompact:frame:position:](UIInputViewSetPlacementAssistantOnScreen, "infoWithPoint:isCompact:frame:position:", self->_visualState == 1, 0, x, y, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[UIFlickingAssistantViewSupport assistantFrame](self, "assistantFrame");
    -[UIFlickingAssistantViewSupport _updateKeyboardLayoutGuideForAssistantFrame:](self, "_updateKeyboardLayoutGuideForAssistantFrame:");
  }
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __60__UIFlickingAssistantViewSupport_updateTransition_animated___block_invoke;
  v17[3] = &unk_1E16C40A8;
  v18 = v12;
  v19 = v13;
  v15 = v13;
  v16 = v12;
  objc_msgSend(v14, "performOnLocalDistributedControllers:", v17);

}

uint64_t __60__UIFlickingAssistantViewSupport_updateTransition_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTransition:withInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (CGPoint)keyboardOriginFromAssistantViewPosition:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  uint8_t v19[16];
  uint8_t buf[16];
  CGPoint result;

  -[UISplitKeyboardSource view](self->super._controller, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");

  UIInputViewSetPlacementFromAssistantViewVisualState(self->_visualState, a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISplitKeyboardSource inputViewSet](self->super._controller, "inputViewSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputAssistantViewHeightForInputViewSet:", v7);

  if (self->_visualState == 3)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemInputAssistantViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferencesActions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "compactAssistantBarPersistentLocation");

    if (a3 == 1)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "Empty bar must not be put at the center", buf, 2u);
        }

      }
      else
      {
        v12 = keyboardOriginFromAssistantViewPosition____s_category;
        if (!keyboardOriginFromAssistantViewPosition____s_category)
        {
          v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v12, (unint64_t *)&keyboardOriginFromAssistantViewPosition____s_category);
        }
        v13 = *(NSObject **)(v12 + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Empty bar must not be put at the center", v19, 2u);
        }
      }
    }
    v14 = *(double *)&UIFloatingAssistantBottomMargin;

    v15 = 16.0;
  }
  else
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
      v14 = 16.0;
    else
      v14 = *(double *)&UIFloatingAssistantBottomMargin;
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
      v15 = 16.0;
    else
      v15 = 0.0;
  }

  v16 = v15;
  v17 = v14;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)setCompact:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;

  -[UIFlickingAssistantViewSupport setPositionAndVisualStateByPersistentLocation:minimize:](self, "setPositionAndVisualStateByPersistentLocation:minimize:", 1, a3);
  UIInputViewSetPlacementFromAssistantViewVisualState(self->_visualState, self->_position, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemInputAssistantViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemInputAssistantView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "centerViewHidden") ^ 1;
  v9 = objc_msgSend(v7, "isInputAssistantItemHidden");
  if (v10)
    -[UIKeyboardMotionSupport translateToPlacement:animated:](self, "translateToPlacement:animated:", v10, v8);
  if (!a3 && self->_position == 1 && v9 != objc_msgSend(v7, "isInputAssistantItemHidden"))
    -[UIFlickingAssistantViewSupport setPositionAndVisualStateByPersistentLocation:minimize:](self, "setPositionAndVisualStateByPersistentLocation:minimize:", 1, 0);
  -[UIFlickingAssistantViewSupport keyboardOriginFromAssistantViewPosition:](self, "keyboardOriginFromAssistantViewPosition:", self->_position);
  -[UIFlickingAssistantViewSupport updateTransition:animated:](self, "updateTransition:animated:", v8);
  -[UIFlickingAssistantViewSupport assistantFrame](self, "assistantFrame");
  -[UIFlickingAssistantViewSupport _updateKeyboardLayoutGuideForAssistantFrame:](self, "_updateKeyboardLayoutGuideForAssistantFrame:");

}

- (unint64_t)assistantPosition
{
  if (-[UIFlickingAssistantViewSupport draggingState](self, "draggingState")
    || (self->_visualState | 2) != 3
    && !-[UIFlickingAssistantViewSupport isInputAssistantItemHidden](self, "isInputAssistantItemHidden"))
  {
    return 0;
  }
  if (self->_position == 3)
    return 4;
  return 8;
}

- (CGRect)assistantFrame
{
  void *v3;
  void *v4;
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
  CGRect result;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemInputAssistantViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "barFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIKeyboardMotionSupport masterController](self, "masterController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertRect:fromView:", v15, v6, v8, v10, v12);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)didUpdateTransition
{
  double v3;
  double v4;
  double v5;
  double v6;
  int64_t visualState;
  void *v8;
  void *v9;
  int v10;
  _BOOL8 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  if (self->_shouldNotifyCompletion)
  {
    -[UIFlickingAssistantViewSupport keyboardOriginFromAssistantViewPosition:](self, "keyboardOriginFromAssistantViewPosition:", self->_position);
    v4 = v3;
    v6 = v5;
    visualState = self->_visualState;
    if (visualState == 3)
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "systemInputAssistantViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "updateFloatingAssistantRectEdge:position:", -[UIFlickingAssistantViewSupport rectEdgeFromPosition:](self, "rectEdgeFromPosition:", self->_position), v4, v6);

      if (v10)
        v4 = 0.0;
      visualState = self->_visualState;
    }
    v11 = visualState == 1;
    -[UIFlickingAssistantViewSupport assistantFrame](self, "assistantFrame");
    +[UIInputViewSetPlacementAssistantOnScreen infoWithPoint:isCompact:frame:position:](UIInputViewSetPlacementAssistantOnScreen, "infoWithPoint:isCompact:frame:position:", v11, -[UIFlickingAssistantViewSupport assistantPosition](self, "assistantPosition"), v4, v6, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __53__UIFlickingAssistantViewSupport_didUpdateTransition__block_invoke;
    v19[3] = &unk_1E16D6240;
    v20 = v16;
    v18 = v16;
    objc_msgSend(v17, "performOnLocalDistributedControllers:", v19);

    self->_shouldNotifyCompletion = 0;
  }
}

uint64_t __53__UIFlickingAssistantViewSupport_didUpdateTransition__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "completeTransition:withInfo:", CFSTR("_UIFlickingAssistantViewGesture"), *(_QWORD *)(a1 + 32));
}

- (unint64_t)rectEdgeFromPosition:(int64_t)a3
{
  BOOL v3;
  unint64_t v4;
  unint64_t v5;

  if (a3 == 2)
  {
    v3 = !-[UIFlickingAssistantViewSupport isRTL](self, "isRTL");
    v4 = 8;
    v5 = 2;
  }
  else
  {
    if (a3 != 3)
      return 4;
    v3 = !-[UIFlickingAssistantViewSupport isRTL](self, "isRTL");
    v4 = 2;
    v5 = 8;
  }
  if (v3)
    return v4;
  else
    return v5;
}

- (void)_updateKeyboardLayoutGuideForAssistantFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  CGFloat x;
  int64_t v8;
  int64_t position;
  BOOL v10;
  char v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  double MaxY;
  double v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  char v28;
  _QWORD v29[8];
  CGRect v30;
  CGRect v31;
  CGRect v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[UIFlickingAssistantViewSupport draggingState](self, "draggingState");
  position = self->_position;
  if (v8)
    v10 = 0;
  else
    v10 = position == 1;
  v11 = v10;
  UIInputViewSetPlacementFromAssistantViewVisualState(self->_visualState, position, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (y > 0.0 && height <= width * 1.5)
  {
    -[UIKeyboardMotionSupport masterController](self, "masterController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "bounds");
    MaxY = CGRectGetMaxY(v30);
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    v18 = MaxY - CGRectGetMaxY(v31);
    objc_msgSend(v16, "bounds");
    v19 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __78__UIFlickingAssistantViewSupport__updateKeyboardLayoutGuideForAssistantFrame___block_invoke;
    v29[3] = &__block_descriptor_64_e33_v16__0__UIKeyboardSceneDelegate_8l;
    v29[4] = v20;
    *(double *)&v29[5] = height + v18;
    v29[6] = 0;
    v29[7] = 0;
    +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", v29);
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    if (!CGRectEqualToRect(*MEMORY[0x1E0C9D648], v32))
    {
      v21[0] = v19;
      v21[1] = 3221225472;
      v21[2] = __78__UIFlickingAssistantViewSupport__updateKeyboardLayoutGuideForAssistantFrame___block_invoke_2;
      v21[3] = &unk_1E16D75B0;
      v22 = v12;
      v28 = v11;
      v23 = v16;
      v24 = x;
      v25 = y;
      v26 = width;
      v27 = height;
      +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v21);

    }
  }

}

void __78__UIFlickingAssistantViewSupport__updateKeyboardLayoutGuideForAssistantFrame___block_invoke(double *a1, void *a2)
{
  double v3;
  double v4;
  id v5;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v5, "updateTrackingElementsForSize:", v3, v4);
  objc_msgSend(v5, "updateTrackingElementsForOffset:", a1[6], a1[7]);

}

void __78__UIFlickingAssistantViewSupport__updateKeyboardLayoutGuideForAssistantFrame___block_invoke_2(uint64_t a1, void *a2)
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
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double x;
  CGFloat y;
  double width;
  double height;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  double MaxY;
  CGFloat v34;
  id v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v35 = a2;
  if (objc_msgSend(v35, "isTrackingKeyboard"))
  {
    objc_msgSend(v35, "updateGuideForKeyboardPlacement:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v35, "_primaryKeyboardTrackingGuide");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAddsHeightWhenUndocked:", *(unsigned __int8 *)(a1 + 80));

    objc_msgSend(v35, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(*(id *)(a1 + 40), "convertRect:toWindow:", v35, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    v43.origin.x = v12;
    v43.origin.y = v13;
    v43.size.width = v14;
    v43.size.height = v15;
    v36.origin.x = v5;
    v36.origin.y = v7;
    v36.size.width = v9;
    v36.size.height = v11;
    v37 = CGRectIntersection(v36, v43);
    x = v37.origin.x;
    y = v37.origin.y;
    width = v37.size.width;
    height = v37.size.height;
    if (!CGRectIsEmpty(v37) || (objc_msgSend(*(id *)(a1 + 40), "_isHostedInAnotherProcess") & 1) == 0)
    {
      v38.origin.x = v5;
      v38.origin.y = v7;
      v38.size.width = v9;
      v38.size.height = v11;
      MaxY = CGRectGetMaxY(v38);
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      v34 = v11;
      v20 = v7;
      v21 = CGRectGetMaxY(v39);
      v40.origin.x = x;
      v40.origin.y = y;
      v40.size.width = width;
      v40.size.height = height;
      if (CGRectIsEmpty(v40))
      {
        objc_msgSend(v35, "insetForDismissedKeyboardGuide");
        height = v22;
        v41.origin.x = v5;
        v41.origin.y = v20;
        v41.size.width = v9;
        v41.size.height = v34;
        CGRectGetMinX(v41);
        v42.origin.x = v5;
        v42.origin.y = v20;
        v42.size.width = v9;
        v42.size.height = v34;
        v23 = CGRectGetMaxY(v42);
        v24 = v35;
        x = 0.0;
        width = v9;
        v25 = height;
      }
      else
      {
        v23 = MaxY;
        v25 = MaxY - v21;
        v24 = v35;
      }
      objc_msgSend(v24, "_primaryKeyboardTrackingGuide", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "enableAnimations:", 0);

      v27 = 0;
      if (v25 < height)
      {
        objc_msgSend(v35, "_primaryKeyboardTrackingGuide");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v28, "changeOffsetConstants:", x, v25);

      }
      objc_msgSend(v35, "_primaryKeyboardTrackingGuide");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "changeSizingConstants:", width, height);

      objc_msgSend(v35, "_primaryKeyboardTrackingGuide");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setAddsHeightWhenUndocked:", 0);

      if ((v27 & 1) != 0 || v30)
        objc_msgSend(v35, "layoutViewsForTrackedGuides");
      objc_msgSend(v35, "_primaryKeyboardTrackingGuide");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "enableAnimations:", 1);

    }
  }

}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  if (!self->_isHandlingGeometryChange)
  {
    self->_isHandlingGeometryChange = 1;
    -[UIFlickingAssistantViewSupport keyboardOriginFromAssistantViewPosition:](self, "keyboardOriginFromAssistantViewPosition:", self->_position, a4);
    -[UIFlickingAssistantViewSupport updateTransition:animated:](self, "updateTransition:animated:", 0);
    -[UIFlickingAssistantViewSupport _updateKeyboardLayoutGuideForCurrentAssistantFrame](self, "_updateKeyboardLayoutGuideForCurrentAssistantFrame");
    self->_isHandlingGeometryChange = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  id v26;
  CGRect v27;
  CGRect v28;

  v26 = a5;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("bounds")))
  {
    objc_msgSend(v26, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "CGRectValue");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    objc_msgSend(v26, "objectForKey:", *MEMORY[0x1E0CB2CC8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "CGRectValue");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    v27.origin.x = v10;
    v27.origin.y = v12;
    v27.size.width = v14;
    v27.size.height = v16;
    v28.origin.x = v19;
    v28.origin.y = v21;
    v28.size.width = v23;
    v28.size.height = v25;
    if (!CGRectEqualToRect(v27, v28))
      -[UIFlickingAssistantViewSupport performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateKeyboardLayoutGuideForCurrentAssistantFrame, 0, 0.0);
  }

}

- (void)_updateKeyboardLayoutGuideForCurrentAssistantFrame
{
  -[UIFlickingAssistantViewSupport assistantFrame](self, "assistantFrame");
  -[UIFlickingAssistantViewSupport _updateKeyboardLayoutGuideForAssistantFrame:](self, "_updateKeyboardLayoutGuideForAssistantFrame:");
}

- (BOOL)isCompact
{
  return self->_isCompact;
}

- (UIInputViewSetPlacement)remotePlacement
{
  return self->_remotePlacement;
}

- (void)setRemotePlacement:(id)a3
{
  objc_storeStrong((id *)&self->_remotePlacement, a3);
}

- (int64_t)draggingState
{
  return self->_draggingState;
}

- (void)setDraggingState:(int64_t)a3
{
  self->_draggingState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePlacement, 0);
  objc_storeStrong((id *)&self->_panRecognizer, 0);
}

@end
