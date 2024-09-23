@implementation UISplitKeyboardSupport

- (void)_disconnectingController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIPanGestureRecognizer *singleFingerPanRecognizer;
  void *v8;
  void *v9;
  UIPanGestureRecognizer *twoFingerPanRecognizer;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "applicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "draggableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeGestureRecognizer:", self->_singleFingerPanRecognizer);

  singleFingerPanRecognizer = self->_singleFingerPanRecognizer;
  self->_singleFingerPanRecognizer = 0;

  objc_msgSend(v4, "applicator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "twoFingerDraggableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeGestureRecognizer:", self->_twoFingerPanRecognizer);

  twoFingerPanRecognizer = self->_twoFingerPanRecognizer;
  self->_twoFingerPanRecognizer = 0;

  v11.receiver = self;
  v11.super_class = (Class)UISplitKeyboardSupport;
  -[UIKeyboardMotionSupport _disconnectingController:](&v11, sel__disconnectingController_, v4);

}

- (void)_connectController:(id)a3
{
  id v4;
  UIPanGestureRecognizer *v5;
  UIPanGestureRecognizer *singleFingerPanRecognizer;
  UIPanGestureRecognizer *v7;
  void *v8;
  void *v9;
  UIPanGestureRecognizer *v10;
  UIPanGestureRecognizer *twoFingerPanRecognizer;
  UIPanGestureRecognizer *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UISplitKeyboardSupport;
  -[UIKeyboardMotionSupport _connectController:](&v15, sel__connectController_, v4);
  v5 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", self, sel_translateDetected_);
  singleFingerPanRecognizer = self->_singleFingerPanRecognizer;
  self->_singleFingerPanRecognizer = v5;

  -[UIPanGestureRecognizer setFailsPastMaxTouches:](self->_singleFingerPanRecognizer, "setFailsPastMaxTouches:", 1);
  -[UIGestureRecognizer setDelaysTouchesEnded:](self->_singleFingerPanRecognizer, "setDelaysTouchesEnded:", 0);
  -[UIGestureRecognizer setCancelsTouchesInView:](self->_singleFingerPanRecognizer, "setCancelsTouchesInView:", 1);
  -[UIPanGestureRecognizer setMinimumNumberOfTouches:](self->_singleFingerPanRecognizer, "setMinimumNumberOfTouches:", 1);
  -[UIPanGestureRecognizer setMaximumNumberOfTouches:](self->_singleFingerPanRecognizer, "setMaximumNumberOfTouches:", 1);
  -[UIPanGestureRecognizer _setHysteresis:](self->_singleFingerPanRecognizer, "_setHysteresis:", 30.0);
  v7 = self->_singleFingerPanRecognizer;
  if (v7)
  {
    -[UIPanGestureRecognizer setDelegate:](v7, "setDelegate:", self);
    objc_msgSend(v4, "applicator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "draggableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addGestureRecognizer:", self->_singleFingerPanRecognizer);

  }
  v10 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", self, sel_translateDetected_);
  twoFingerPanRecognizer = self->_twoFingerPanRecognizer;
  self->_twoFingerPanRecognizer = v10;

  -[UIPanGestureRecognizer setFailsPastMaxTouches:](self->_twoFingerPanRecognizer, "setFailsPastMaxTouches:", 1);
  -[UIGestureRecognizer setDelaysTouchesEnded:](self->_twoFingerPanRecognizer, "setDelaysTouchesEnded:", 0);
  -[UIGestureRecognizer setCancelsTouchesInView:](self->_twoFingerPanRecognizer, "setCancelsTouchesInView:", 1);
  -[UIPanGestureRecognizer setMinimumNumberOfTouches:](self->_twoFingerPanRecognizer, "setMinimumNumberOfTouches:", 2);
  -[UIPanGestureRecognizer setMaximumNumberOfTouches:](self->_twoFingerPanRecognizer, "setMaximumNumberOfTouches:", 2);
  -[UIPanGestureRecognizer _setHysteresis:](self->_twoFingerPanRecognizer, "_setHysteresis:", 30.0);
  v12 = self->_twoFingerPanRecognizer;
  if (v12)
  {
    -[UIPanGestureRecognizer setDelegate:](v12, "setDelegate:", self);
    objc_msgSend(v4, "applicator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "twoFingerDraggableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addGestureRecognizer:", self->_twoFingerPanRecognizer);

  }
}

- (void)_updatedController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)UISplitKeyboardSupport;
  -[UIKeyboardMotionSupport _updatedController](&v19, sel__updatedController);
  -[UIGestureRecognizer view](self->_singleFingerPanRecognizer, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardMotionSupport masterController](self, "masterController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "draggableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v6)
  {
    -[UIGestureRecognizer view](self->_singleFingerPanRecognizer, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeGestureRecognizer:", self->_singleFingerPanRecognizer);

    -[UIKeyboardMotionSupport masterController](self, "masterController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applicator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "draggableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addGestureRecognizer:", self->_singleFingerPanRecognizer);

  }
  -[UIGestureRecognizer view](self->_twoFingerPanRecognizer, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardMotionSupport masterController](self, "masterController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applicator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "twoFingerDraggableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 != v14)
  {
    -[UIGestureRecognizer view](self->_twoFingerPanRecognizer, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeGestureRecognizer:", self->_twoFingerPanRecognizer);

    -[UIKeyboardMotionSupport masterController](self, "masterController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "applicator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "twoFingerDraggableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addGestureRecognizer:", self->_twoFingerPanRecognizer);

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v6 = a4;
  v7 = a3;
  -[UIKeyboardMotionSupport masterController](self, "masterController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "draggableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v10);
  v12 = v11;
  v14 = v13;

  LOBYTE(v6) = objc_msgSend(v9, "isGesture:inDraggableView:", v7, v12, v14);
  return (char)v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  char v43;

  v4 = (UIPanGestureRecognizer *)a3;
  v5 = v4;
  if (self->_singleFingerPanRecognizer != v4 && self->_twoFingerPanRecognizer != v4)
  {
    v6 = 1;
    goto LABEL_12;
  }
  -[UISplitKeyboardSource inputViewSet](self->super._controller, "inputViewSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (-[UISplitKeyboardSource isChangingPlacement](self->super._controller, "isChangingPlacement") & 1) != 0
    || !+[UIKeyboardImpl rivenShouldUndock](UIKeyboardImpl, "rivenShouldUndock")
    && !+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    goto LABEL_10;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isLongPress"))
  {

LABEL_10:
LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "splitTransitionInProgress");

  if ((v12 & 1) != 0)
    goto LABEL_11;
  v43 = 0;
  -[UIKeyboardMotionSupport masterController](self, "masterController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "applicator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "preBeginGesture:shouldBegin:", v5, &v43);

  if (v15)
  {
    v6 = v43 != 0;
  }
  else
  {
    -[UIPanGestureRecognizer locationInView:](v5, "locationInView:", 0);
    v17 = v16;
    v19 = v18;
    -[UISplitKeyboardSource view](self->super._controller, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "window");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "_isHostedInAnotherProcess");

    if (v22)
    {
      -[UISplitKeyboardSource view](self->super._controller, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "window");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "convertPoint:fromWindow:", 0, v17, v19);
      v17 = v25;
      v19 = v26;

    }
    -[UIKeyboardMotionSupport masterController](self, "masterController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "applicator");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "draggableView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISplitKeyboardSource view](self->super._controller, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "window");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "convertPoint:fromView:", v31, v17, v19);
    v33 = v32;
    v35 = v34;

    -[UISplitKeyboardSource view](self->super._controller, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanGestureRecognizer translationInView:](v5, "translationInView:", v36);
    v38 = v37;
    v40 = v39;

    -[UIKeyboardMotionSupport masterController](self, "masterController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "applicator");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v42, "isGesture:inDraggableView:", v5, v33 + v38, v35 - v40);

  }
LABEL_12:

  return v6;
}

- (BOOL)generateSplitNotificationForNewPlacement:(id)a3
{
  UISplitKeyboardSource *controller;
  id v4;
  void *v5;
  char v6;
  char v7;

  controller = self->super._controller;
  v4 = a3;
  -[UISplitKeyboardSource placement](controller, "placement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUndocked");
  v7 = objc_msgSend(v4, "isUndocked");

  return v6 ^ v7;
}

- (BOOL)isTranslating
{
  return self->_isTranslating;
}

- (BOOL)isSplitting
{
  return self->_isSplitting;
}

- (void)updatedControllerApplicator:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIKeyboardMotionSupport masterController](self, "masterController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[UISplitKeyboardSupport _updatedController](self, "_updatedController");
}

- (void)willPerformPlacementFrom:(id)a3 to:(id)a4 forController:(id)a5
{
  if (self->_displayLink)
    -[UISplitKeyboardSupport cancelBounceAnimation](self, "cancelBounceAnimation", a3, a4, a5);
}

- (BOOL)startedPlacementFrom:(id)a3 to:(id)a4 forController:(id)a5
{
  id v8;
  id v9;
  UISplitKeyboardSource *v10;
  char v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = (UISplitKeyboardSource *)a5;
  if ((objc_msgSend(v8, "isUndocked") & 1) != 0)
    v11 = 1;
  else
    v11 = objc_msgSend(v9, "isUndocked");
  if (self->super._controller == v10)
    self->_isTranslating = v11;
  if (((objc_msgSend(v8, "isUndocked") & 1) != 0 || objc_msgSend(v9, "isUndocked"))
    && (objc_msgSend(v8, "isFloatingAssistantView") & 1) == 0
    && (objc_msgSend(v9, "isFloating") & 1) == 0
    && objc_msgSend(v9, "isVisible"))
  {
    -[UISplitKeyboardSupport _updateKeyboardLayoutGuideForSplitTransition:](self, "_updateKeyboardLayoutGuideForSplitTransition:", objc_msgSend(v9, "isUndocked"));
    -[UISplitKeyboardSource hostView](self->super._controller, "hostView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    -[UISplitKeyboardSupport _updateKeyboardLayoutGuideForHostFrame:animated:](self, "_updateKeyboardLayoutGuideForHostFrame:animated:", 1);

  }
  return v11;
}

- (BOOL)completedPlacementFrom:(id)a3 to:(id)a4 forController:(id)a5
{
  id v8;
  UISplitKeyboardSource *v9;
  char v10;

  v8 = a4;
  v9 = (UISplitKeyboardSource *)a5;
  if ((objc_msgSend(a3, "isUndocked") & 1) != 0)
    v10 = 1;
  else
    v10 = objc_msgSend(v8, "isUndocked");
  if (self->super._controller == v9)
    self->_isTranslating = 0;

  return v10;
}

- (void)cancelGestureRecognizers
{
  if (-[UIGestureRecognizer isEnabled](self->_singleFingerPanRecognizer, "isEnabled"))
  {
    -[UIGestureRecognizer setEnabled:](self->_singleFingerPanRecognizer, "setEnabled:", 0);
    -[UIGestureRecognizer setEnabled:](self->_singleFingerPanRecognizer, "setEnabled:", 1);
  }
  if (-[UIGestureRecognizer isEnabled](self->_twoFingerPanRecognizer, "isEnabled"))
  {
    -[UIGestureRecognizer setEnabled:](self->_twoFingerPanRecognizer, "setEnabled:", 0);
    -[UIGestureRecognizer setEnabled:](self->_twoFingerPanRecognizer, "setEnabled:", 1);
  }
}

- (void)translateDetected:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  BOOL v16;
  void *v17;
  CADisplayLink *v18;
  CADisplayLink *displayLink;
  CADisplayLink *v20;
  void *v21;
  CGPoint *p_translationVelocity;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  CGPoint v26;
  id v27;
  char isKindOfClass;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  _BOOL4 v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  __CFString *v73;
  __CFString **v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  void *v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  char v108;
  void *v109;
  uint64_t v110;
  void *v111;
  _BOOL4 v112;
  void *v113;
  void *v114;
  unint64_t v115;
  double v116;
  double v117;
  void *v118;
  char v119;
  char v120;
  BOOL v121;
  double v122;
  double v123;
  double v125;
  double v126;
  void *v127;
  void *v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  void *v137;
  __CFString *v138;
  __CFString **v139;
  __CFString *v140;
  void *v141;
  void *v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  void *v151;
  double v152;
  double v153;
  void *v154;
  void *v155;
  unint64_t v156;
  double v157;
  double v158;
  _BOOL8 v159;
  void *v160;
  double v161;
  double v162;
  void *v163;
  double v164;
  double v165;
  void *v166;
  double v167;
  double v168;
  double v169;
  double v170;
  void *v171;
  void *v172;
  void *v173;
  id v174;
  void *v175;
  char v176;
  void *v177;
  double v178;
  double v179;
  double v180;
  _QWORD v181[4];
  id v182;
  _QWORD v183[4];
  id v184;
  const __CFString *v185;
  _QWORD v186[3];

  v186[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UISplitKeyboardSource hostView](self->super._controller, "hostView");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_116;
  v6 = (void *)v5;
  +[UIInputSwitcherView activeInstance](UIInputSwitcherView, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isVisible");

  if ((v8 & 1) != 0)
    goto LABEL_116;
  v9 = objc_msgSend(v4, "state");
  switch(v9)
  {
    case 4:
      -[UISplitKeyboardSupport cancelBounceAnimation](self, "cancelBounceAnimation");
LABEL_10:
      -[UISplitKeyboardSource positionConstraintConstant](self->super._controller, "positionConstraintConstant");
      v16 = self->_initialTranslation.x == v15 && self->_initialTranslation.y == v14;
      if (v16 && !self->_isTranslating)
      {
        -[UISplitKeyboardSource setInterfaceAutorotationDisabled:](self->super._controller, "setInterfaceAutorotationDisabled:", 0);
        goto LABEL_116;
      }
      -[UISplitKeyboardSupport invalidateDisplayLink](self, "invalidateDisplayLink");
      -[UIKeyboardMotionSupport _intendedScreen](self, "_intendedScreen");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "displayLinkWithTarget:selector:", self, sel__updateBounceAnimation_);
      v18 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      displayLink = self->_displayLink;
      self->_displayLink = v18;

      v20 = self->_displayLink;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v20, "addToRunLoop:forMode:", v21, *MEMORY[0x1E0C99860]);

      self->_lastBounceTime = CACurrentMediaTime();
      p_translationVelocity = &self->_translationVelocity;
      -[UISplitKeyboardSource view](self->super._controller, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "velocityInView:", v23);
      self->_translationVelocity.x = v24;
      self->_translationVelocity.y = v25;

      v26 = (CGPoint)vdivq_f64((float64x2_t)self->_translationVelocity, (float64x2_t)vdupq_n_s64(0x408F400000000000uLL));
      self->_translationVelocity = v26;
      if (fabs(v26.x) < 0.015)
        p_translationVelocity->x = -0.015;
      if (fabs(v26.y) < 0.015)
        self->_translationVelocity.y = -0.015;
      -[UISplitKeyboardSource placement](self->super._controller, "placement");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v29 = 0.0;
      v30 = 0.0;
      v31 = 0.0;
      v32 = 0.0;
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v27, "chromeBuffer");
        v32 = v33;
        v31 = v34;
      }
      v179 = v29;
      v180 = v30;
      -[UISplitKeyboardSource hostView](self->super._controller, "hostView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "frame");
      v178 = v36;
      v38 = v37;

      -[UISplitKeyboardSource view](self->super._controller, "view");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "bounds");
      v41 = v40 - v38 - v32;

      -[UISplitKeyboardSource view](self->super._controller, "view");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "translationInView:", v42);
      v44 = v43;
      v46 = v45;

      v47 = v44 + self->_initialTranslation.x + p_translationVelocity->x * 110.0;
      v48 = v46 + self->_initialTranslation.y + self->_translationVelocity.y * 110.0;
      -[UISplitKeyboardSource applicator](self->super._controller, "applicator");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "contentInsets");
      v51 = v50;
      v53 = v52;
      v55 = v54;
      v57 = v56;

      v58 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
      v59 = v31 + v53;
      v60 = v51 + v55 - v41;
      -[UISplitKeyboardSource view](self->super._controller, "view");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "bounds");
      v63 = v62 - (v179 + v178 + v57);
      v64 = -v55 - v180;

      v65 = v63;
      v66 = v59;
      if (v58)
      {
        +[UIKeyboardFloatingTransitionController magneticEdgeMargin](UIKeyboardFloatingTransitionController, "magneticEdgeMargin");
        v66 = round(v59 + v67);
        +[UIKeyboardFloatingTransitionController magneticEdgeMargin](UIKeyboardFloatingTransitionController, "magneticEdgeMargin");
        v65 = round(v63 - v68);
      }
      if (v47 <= v65)
        v69 = v47;
      else
        v69 = v65;
      if (v47 < v66)
        v69 = v66;
      v70 = round(v69);
      if (v48 <= v64)
        v71 = v48;
      else
        v71 = v64;
      if (v48 < v60)
        v71 = v60;
      v72 = round(v71);
      v73 = CFSTR("NotOnEdge");
      if (!v58)
        goto LABEL_90;
      if (v70 == v66)
      {
        v74 = UIKBAnalyticsFloatingKeyboardEdgeLeft;
      }
      else
      {
        if (v70 != v65)
        {
LABEL_85:
          if (v72 == v60)
          {
            v139 = UIKBAnalyticsFloatingKeyboardEdgeTop;
LABEL_89:
            v140 = *v139;

            v73 = v140;
            v72 = v60;
            goto LABEL_90;
          }
          if (v72 == v64)
          {
            v139 = UIKBAnalyticsFloatingKeyboardEdgeBottom;
            v60 = v64;
            goto LABEL_89;
          }
LABEL_90:
          self->_targetTranslation.x = v70;
          self->_targetTranslation.y = v72;
          +[UIInputViewSetPlacementFloating infoWithPoint:forOwner:](UIInputViewSetPlacementFloating, "infoWithPoint:forOwner:", self->super._controller, v70, v72);
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "objectForKey:", CFSTR("PopoverRect"));
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v142, "CGRectValue");
          v144 = v143;
          v146 = v145;
          v148 = v147;
          v150 = v149;

          if (v58)
          {
            -[UISplitKeyboardSource view](self->super._controller, "view");
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "locationInView:", v151);
            +[UIKBAnalyticsDispatcher floatingKeyboardMoved:toPosition:touchPosition:](UIKBAnalyticsDispatcher, "floatingKeyboardMoved:toPosition:touchPosition:", v73, v144, v146, v152, v153);

          }
          else if (self->_shouldUpdateKLGForTransition)
          {
            -[UISplitKeyboardSupport _updateKeyboardLayoutGuideForHostFrame:animated:](self, "_updateKeyboardLayoutGuideForHostFrame:animated:", 0, v144, v146, v148, v150);
            self->_shouldUpdateKLGForTransition = 0;
          }
          +[UIKeyboardImpl setPersistentOffset:](UIKeyboardImpl, "setPersistentOffset:", v70, v72);
          if (self->_splitLockState)
            goto LABEL_111;
          if (+[UIKeyboardImpl rivenTranslationPreference](UIKeyboardImpl, "rivenTranslationPreference"))
          {
            -[UISplitKeyboardSource view](self->super._controller, "view");
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v154, "window");
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            v156 = objc_msgSend(v155, "interfaceOrientation") - 3;

            v157 = 80.0;
            if (v156 < 2)
              v157 = 100.0;
            v158 = fabs(v72);
            v159 = v158 >= v157;
            if (v158 < v157)
            {
              +[UIInputViewSetPlacement placement](UIInputViewSetPlacementOnScreen, "placement");
              v166 = (void *)objc_claimAutoreleasedReturnValue();
              +[UIKeyboardImpl setPersistentOffset:](UIKeyboardImpl, "setPersistentOffset:", 0.0, 0.0);
            }
            else
            {
              -[UISplitKeyboardSource view](self->super._controller, "view");
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v160, "bounds");
              v162 = v70 / v161;
              -[UISplitKeyboardSource view](self->super._controller, "view");
              v163 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v163, "bounds");
              v165 = -v72 / v164;

              +[UIInputViewSetPlacementUndocked placementWithUndockedOffset:chromeBuffer:](UIInputViewSetPlacementUndocked, "placementWithUndockedOffset:chromeBuffer:", v162, v165, 92.0, 0.0, 0.0, 0.0);
              v166 = (void *)objc_claimAutoreleasedReturnValue();
            }
            if (v166)
              -[UIKeyboardMotionSupport translateToPlacement:quietly:animated:](self, "translateToPlacement:quietly:animated:", v166, 1, 1);

          }
          else
          {
            v159 = 1;
          }
          if (self->_splitLockState)
          {
LABEL_111:
            v172 = 0;
          }
          else
          {
            v185 = CFSTR("_UISplitKeyboardGestureFinishSplit");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v159);
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            v186[0] = v177;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v186, &v185, 1);
            v172 = (void *)objc_claimAutoreleasedReturnValue();

          }
          +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          v183[0] = MEMORY[0x1E0C809B0];
          v183[1] = 3221225472;
          v183[2] = __44__UISplitKeyboardSupport_translateDetected___block_invoke;
          v183[3] = &unk_1E16D6240;
          v174 = v172;
          v184 = v174;
          objc_msgSend(v173, "performOnDistributedControllers:", v183);

          -[UISplitKeyboardSource setInterfaceAutorotationDisabled:](self->super._controller, "setInterfaceAutorotationDisabled:", 0);
          +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          v176 = objc_msgSend(v175, "isActive");

          if ((v176 & 1) == 0)
            -[UISplitKeyboardSupport cancelBounceAnimation](self, "cancelBounceAnimation");

          goto LABEL_115;
        }
        v74 = UIKBAnalyticsFloatingKeyboardEdgeRight;
        v59 = v63;
      }
      v138 = *v74;

      v73 = v138;
      v70 = v59;
      goto LABEL_85;
    case 3:
      goto LABEL_10;
    case 1:
      -[UISplitKeyboardSource setInterfaceAutorotationDisabled:](self->super._controller, "setInterfaceAutorotationDisabled:", 1);
      self->_isTranslating = 0;
      -[UISplitKeyboardSource positionConstraintConstant](self->super._controller, "positionConstraintConstant");
      self->_initialTranslation.x = v10;
      self->_initialTranslation.y = v11;
      self->_lastTranslationNotificationTime = 0.0;
      -[UISplitKeyboardSource inputViewSet](self->super._controller, "inputViewSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "keyboard");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13
        && (+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"),
            v8 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend((id)v8, "rivenSplitLock")))
      {
        self->_splitLockState = 1;
      }
      else
      {
        self->_splitLockState = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
        if (!v13)
        {
LABEL_78:

          -[UISplitKeyboardSupport invalidateDisplayLink](self, "invalidateDisplayLink");
          -[UISplitKeyboardSource placement](self->super._controller, "placement");
          v27 = (id)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v27, "isFloating"))
            objc_msgSend(v27, "updateChromeBuffer");
          -[UISplitKeyboardSource hostView](self->super._controller, "hostView");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "frame");
          v130 = v129;
          v132 = v131;
          v134 = v133;
          v136 = v135;

          self->_shouldUpdateKLGForTransition = -[UISplitKeyboardSupport _updateKeyboardLayoutGuideForHostFrame:animated:](self, "_updateKeyboardLayoutGuideForHostFrame:animated:", 0, v130, v132, v134, v136);
LABEL_115:

          goto LABEL_116;
        }
      }

      goto LABEL_78;
  }
  -[UISplitKeyboardSource view](self->super._controller, "view");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v75);
  v77 = v76;
  v79 = v78;

  -[UISplitKeyboardSource view](self->super._controller, "view");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "size");
  v82 = v81;
  -[UISplitKeyboardSource hostView](self->super._controller, "hostView");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "frame");
  v85 = v84;

  v86 = v77 + self->_initialTranslation.x;
  if (v86 >= 0.0)
  {
    if (v86 > v82 - v85)
      v86 = v82 - v85 + round((v86 - (v82 - v85)) * 0.3);
  }
  else
  {
    v86 = round(v86 * 0.3);
  }
  -[UISplitKeyboardSource view](self->super._controller, "view");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "size");
  v89 = v88;
  -[UISplitKeyboardSource hostView](self->super._controller, "hostView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "frame");
  v92 = -(v89 - v91);

  v93 = v79 + self->_initialTranslation.y;
  v94 = v92 - round((v92 - v93) * 0.3);
  if (v93 >= v92)
    v95 = v79 + self->_initialTranslation.y;
  else
    v95 = v94;
  if (self->_isTranslating)
  {
    +[UIInputViewSetPlacementFloating infoWithPoint:forOwner:](UIInputViewSetPlacementFloating, "infoWithPoint:forOwner:", self->super._controller, v86, v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "objectForKey:", CFSTR("PopoverRect"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "CGRectValue");
    v99 = v98;
    v101 = v100;
    v103 = v102;
    v105 = v104;

    if (self->_shouldUpdateKLGForTransition)
      -[UISplitKeyboardSupport _updateKeyboardLayoutGuideForHostFrame:animated:](self, "_updateKeyboardLayoutGuideForHostFrame:animated:", 0, v99, v101, v103, v105);
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v181[0] = MEMORY[0x1E0C809B0];
    v181[1] = 3221225472;
    v181[2] = __44__UISplitKeyboardSupport_translateDetected___block_invoke_2;
    v181[3] = &unk_1E16D6240;
    v27 = v96;
    v182 = v27;
    objc_msgSend(v106, "performOnDistributedControllers:", v181);

    if (v95 < 0.0)
    {
      -[UISplitKeyboardSource placement](self->super._controller, "placement");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = objc_msgSend(v107, "isUndocked");

      if ((v108 & 1) == 0)
        -[UISplitKeyboardSupport undock](self, "undock");
    }
    -[UISplitKeyboardSource inputViewSet](self->super._controller, "inputViewSet");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "keyboard");
    v110 = objc_claimAutoreleasedReturnValue();
    if (v110)
    {
      v111 = (void *)v110;
      v112 = +[UIKeyboardImpl rivenPreference](UIKeyboardImpl, "rivenPreference");

      if (v112)
      {
        -[UISplitKeyboardSource view](self->super._controller, "view");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "window");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = objc_msgSend(v114, "interfaceOrientation") - 3;

        if (v115 >= 2)
          v116 = 10.0;
        else
          v116 = 40.0;
        if (v115 >= 2)
          v117 = 80.0;
        else
          v117 = 100.0;
        if (!self->_splitLockState)
          goto LABEL_66;
        -[UISplitKeyboardSource inputViewSet](self->super._controller, "inputViewSet");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = objc_msgSend(v118, "_inputViewIsSplit");

        if (((v119 & 1) != 0 || v95 < -v116) && (v95 <= -v117 ? (v120 = v119) : (v120 = 0), (v120 & 1) == 0))
        {
          self->_splitLockState = 1;
        }
        else
        {
          v121 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
          self->_splitLockState = v121;
          if (!v121)
          {
LABEL_66:
            v122 = -v117;
            v123 = 1.0;
            if (v95 > v122)
            {
              v123 = 0.0;
              if (v95 <= -v116 && v95 >= v122)
              {
                v125 = fabs(v95) - v116;
                v126 = 70.0;
                if (v115 < 2)
                  v126 = 60.0;
                v123 = v125 / v126 * (v125 / v126);
              }
            }
            +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v127, "setSplitProgress:", v123);

          }
        }
      }
    }
    else
    {

    }
    objc_msgSend(v4, "locationInView:", 0);
    v168 = v167;
    v170 = v169;
    if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating")
      && +[UIKeyboardFloatingTransitionController isPointWithinDockingRegion:](UIKeyboardFloatingTransitionController, "isPointWithinDockingRegion:", v168, v170))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v171, "beginFloatingTransitionFromPanGestureRecognizer:", v4);

    }
    goto LABEL_115;
  }
  self->_isTranslating = 1;
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "performOnDistributedControllers:", &__block_literal_global_357);

LABEL_116:
}

void __44__UISplitKeyboardSupport_translateDetected___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "completeTransition:withInfo:", CFSTR("_UISplitKeyboardGesture"), v2);
  objc_msgSend(v3, "startTransition:withInfo:", CFSTR("_UISplitKeyboardBounce"), 0);

}

uint64_t __44__UISplitKeyboardSupport_translateDetected___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTransition:withInfo:", CFSTR("_UISplitKeyboardGesture"), *(_QWORD *)(a1 + 32));
}

uint64_t __44__UISplitKeyboardSupport_translateDetected___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startTransition:withInfo:", CFSTR("_UISplitKeyboardGesture"), 0);
}

- (void)_updateKeyboardLayoutGuideForSplitTransition:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__UISplitKeyboardSupport__updateKeyboardLayoutGuideForSplitTransition___block_invoke;
  v3[3] = &unk_1E16D74F0;
  v4 = a3;
  v3[4] = self;
  +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v3);
}

void __71__UISplitKeyboardSupport__updateKeyboardLayoutGuideForSplitTransition___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isTrackingKeyboard"))
  {
    if (*(_BYTE *)(a1 + 40))
      +[UIInputViewSetPlacementUndocked placementWithUndockedOffset:chromeBuffer:](UIInputViewSetPlacementUndocked, "placementWithUndockedOffset:chromeBuffer:", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    else
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "placement");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateGuideForKeyboardPlacement:", v3);

  }
}

- (BOOL)_updateKeyboardLayoutGuideForHostFrame:(CGRect)a3 animated:(BOOL)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  BOOL v10;
  void *v11;
  void *v12;
  double MaxY;
  double v14;
  double v15;
  BOOL v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  uint64_t v23;
  _QWORD v25[10];
  BOOL v26;
  _QWORD v27[8];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (+[UIAssistantBarButtonItemProvider _isScribbleButtonsVisible](UIAssistantBarButtonItemProvider, "_isScribbleButtonsVisible"))
  {
    return 0;
  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  if (!CGRectEqualToRect(*MEMORY[0x1E0C9D648], v34))
  {
    -[UISplitKeyboardSource containerView](self->super._controller, "containerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    MaxY = CGRectGetMaxY(v32);
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    v14 = CGRectGetMaxY(v33);

    if (x > 0.0 || (v15 = MaxY - v14, v16 = MaxY - v14 <= 0.0, v17 = width, v18 = height, v19 = x, !v16))
    {
      -[UISplitKeyboardSource containerView](self->super._controller, "containerView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "window");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bounds");
      v17 = v22;

      v15 = 0.0;
      v18 = 0.0;
      v19 = 0.0;
    }
    v23 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __74__UISplitKeyboardSupport__updateKeyboardLayoutGuideForHostFrame_animated___block_invoke;
    v27[3] = &__block_descriptor_64_e33_v16__0__UIKeyboardSceneDelegate_8l;
    *(CGFloat *)&v27[4] = v17;
    *(CGFloat *)&v27[5] = v18;
    *(double *)&v27[6] = v19;
    *(double *)&v27[7] = v15;
    +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", v27);
    v25[0] = v23;
    v25[1] = 3221225472;
    v25[2] = __74__UISplitKeyboardSupport__updateKeyboardLayoutGuideForHostFrame_animated___block_invoke_2;
    v25[3] = &unk_1E16D7538;
    *(double *)&v25[6] = x;
    *(CGFloat *)&v25[7] = y;
    *(CGFloat *)&v25[8] = width;
    *(CGFloat *)&v25[9] = height;
    v25[4] = self;
    v25[5] = &v28;
    v26 = a4;
    +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v25);
  }
  v10 = *((_BYTE *)v29 + 24) != 0;
  _Block_object_dispose(&v28, 8);
  return v10;
}

void __74__UISplitKeyboardSupport__updateKeyboardLayoutGuideForHostFrame_animated___block_invoke(double *a1, void *a2)
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

void __74__UISplitKeyboardSupport__updateKeyboardLayoutGuideForHostFrame_animated___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double x;
  double y;
  double width;
  double height;
  double v25;
  void *v26;
  double MaxY;
  int v28;
  void *v29;
  int v30;
  id v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v31 = a2;
  if (objc_msgSend(v31, "isTrackingKeyboard"))
  {
    objc_msgSend(v31, "frame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "convertRect:fromWindow:", v12, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    v32.origin.x = v4;
    v32.origin.y = v6;
    v32.size.width = v8;
    v32.size.height = v10;
    v38.origin.x = v14;
    v38.origin.y = v16;
    v38.size.width = v18;
    v38.size.height = v20;
    v33 = CGRectIntersection(v32, v38);
    x = v33.origin.x;
    y = v33.origin.y;
    width = v33.size.width;
    height = v33.size.height;
    if (CGRectIsEmpty(v33))
    {
      objc_msgSend(v31, "insetForDismissedKeyboardGuide");
      height = v25;
      v34.origin.x = v4;
      v34.origin.y = v6;
      v34.size.width = v8;
      v34.size.height = v10;
      x = CGRectGetMinX(v34);
      v35.origin.x = v4;
      v35.origin.y = v6;
      v35.size.width = v8;
      v35.size.height = v10;
      y = CGRectGetMaxY(v35) - height;
      width = v8;
    }
    objc_msgSend(v31, "_primaryKeyboardTrackingGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36.origin.x = v4;
    v36.origin.y = v6;
    v36.size.width = v8;
    v36.size.height = v10;
    MaxY = CGRectGetMaxY(v36);
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    v28 = objc_msgSend(v26, "changeOffsetConstants:", x, MaxY - CGRectGetMaxY(v37));

    objc_msgSend(v31, "_primaryKeyboardTrackingGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "changeSizingConstants:", width, height);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    if (*(_BYTE *)(a1 + 80) && v28 | v30)
      objc_msgSend(v31, "layoutViewsForTrackedGuides");
  }

}

- (void)cancelBounceAnimation
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  +[UIInputViewSetPlacementFloating infoWithPoint:forOwner:](UIInputViewSetPlacementFloating, "infoWithPoint:forOwner:", self->super._controller, self->_targetTranslation.x, self->_targetTranslation.y);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__UISplitKeyboardSupport_cancelBounceAnimation__block_invoke;
  v6[3] = &unk_1E16D6240;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performOnDistributedControllers:", v6);

  -[UISplitKeyboardSupport invalidateDisplayLink](self, "invalidateDisplayLink");
  -[UISplitKeyboardSupport bounceAnimationDidFinish](self, "bounceAnimationDidFinish");

}

uint64_t __47__UISplitKeyboardSupport_cancelBounceAnimation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTransition:withInfo:", CFSTR("_UISplitKeyboardBounce"), *(_QWORD *)(a1 + 32));
}

- (void)bounceAnimationDidFinish
{
  void *v3;
  void (**bounceCompletionBlock)(void);
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  bounceCompletionBlock = (void (**)(void))self->_bounceCompletionBlock;
  if (bounceCompletionBlock)
  {
    bounceCompletionBlock[2]();
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("_UISplitKeyboardRefreshPresentation"));
    v5 = self->_bounceCompletionBlock;
    self->_bounceCompletionBlock = 0;

  }
  -[UISplitKeyboardSource hostView](self->super._controller, "hostView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  -[UISplitKeyboardSource view](self->super._controller, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "rivenSplitLock") & 1) != 0)
  {

  }
  else
  {
    v9 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");

    if (!v9)
    {
      -[UISplitKeyboardSource view](self->super._controller, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "interfaceOrientation");

    }
  }
  -[UISplitKeyboardSource hostView](self->super._controller, "hostView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  +[UIKeyboardImpl setPersistentOffset:](UIKeyboardImpl, "setPersistentOffset:");

  self->_isTranslating = 0;
  self->_isSplitting = 0;
  if (self->_targetTranslation.y != 0.0)
    goto LABEL_12;
  -[UISplitKeyboardSource placement](self->super._controller, "placement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isUndocked") & 1) == 0)
  {

    goto LABEL_12;
  }
  -[UISplitKeyboardSource inputViewSet](self->super._controller, "inputViewSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "_inputViewIsSplit");

  if ((v15 & 1) != 0)
  {
LABEL_12:
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("_UISplitKeyboardGenerateNotification"));
    goto LABEL_13;
  }
  -[UISplitKeyboardSupport dock](self, "dock");
LABEL_13:
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __50__UISplitKeyboardSupport_bounceAnimationDidFinish__block_invoke;
  v18[3] = &unk_1E16D6240;
  v19 = v3;
  v17 = v3;
  objc_msgSend(v16, "performOnDistributedControllers:", v18);

}

uint64_t __50__UISplitKeyboardSupport_bounceAnimationDidFinish__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "completeTransition:withInfo:", CFSTR("_UISplitKeyboardBounce"), *(_QWORD *)(a1 + 32));
}

- (void)invalidateDisplayLink
{
  CADisplayLink *displayLink;
  CADisplayLink *v4;

  displayLink = self->_displayLink;
  if (displayLink)
  {
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v4 = self->_displayLink;
    self->_displayLink = 0;

  }
}

- (void)_updateBounceAnimation:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint *p_targetTranslation;
  double v10;
  double x;
  double v12;
  double y;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  objc_msgSend(a3, "timestamp");
  v5 = v4;
  v6 = (v4 - self->_lastBounceTime) * 1000.0;
  if (v6 > 1.0)
  {
    -[UISplitKeyboardSource positionConstraintConstant](self->super._controller, "positionConstraintConstant");
    v8 = v7;
    p_targetTranslation = &self->_targetTranslation;
    +[UIPeripheralHost gridViewRubberBandValueForValue:target:timeInterval:velocity:](UIPeripheralHost, "gridViewRubberBandValueForValue:target:timeInterval:velocity:", &self->_translationVelocity);
    x = v10;
    +[UIPeripheralHost gridViewRubberBandValueForValue:target:timeInterval:velocity:](UIPeripheralHost, "gridViewRubberBandValueForValue:target:timeInterval:velocity:", &self->_translationVelocity.y, v8, self->_targetTranslation.y, v6);
    y = v12;
    if (vabdd_f64(self->_targetTranslation.x, x) < 3.0 && fabs(self->_translationVelocity.x) < 0.01)
      x = p_targetTranslation->x;
    if (vabdd_f64(self->_targetTranslation.y, v12) < 3.0 && fabs(self->_translationVelocity.y) < 0.01)
      y = self->_targetTranslation.y;
    +[UIInputViewSetPlacementFloating infoWithPoint:forOwner:](UIInputViewSetPlacementFloating, "infoWithPoint:forOwner:", self->super._controller, x, y);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __49__UISplitKeyboardSupport__updateBounceAnimation___block_invoke;
    v17[3] = &unk_1E16D6240;
    v16 = v14;
    v18 = v16;
    objc_msgSend(v15, "performOnDistributedControllers:", v17);

    if (x == p_targetTranslation->x && y == self->_targetTranslation.y)
    {
      -[UISplitKeyboardSupport invalidateDisplayLink](self, "invalidateDisplayLink");
      -[UISplitKeyboardSupport bounceAnimationDidFinish](self, "bounceAnimationDidFinish");
    }
    self->_lastBounceTime = v5;

  }
}

uint64_t __49__UISplitKeyboardSupport__updateBounceAnimation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTransition:withInfo:", CFSTR("_UISplitKeyboardBounce"), *(_QWORD *)(a1 + 32));
}

- (void)dock
{
  void *v2;
  int v3;
  void *v4;
  char v5;

  -[UISplitKeyboardSource placement](self->super._controller, "placement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUndocked");

  if (v3)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "rivenSplitLock");

    if ((v5 & 1) == 0)
      +[UIKeyboardImpl setPersistentSplitProgress:](UIKeyboardImpl, "setPersistentSplitProgress:", 0.0);
  }
}

- (void)prepareForTransition
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_isSplitting)
  {
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("_UISplitKeyboardTransitionInhibitStart"));
  }
  else
  {
    -[UISplitKeyboardSource setInterfaceAutorotationDisabled:](self->super._controller, "setInterfaceAutorotationDisabled:", 1);
    -[UISplitKeyboardSource placement](self->super._controller, "placement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isUndocked");

    if ((v6 & 1) != 0)
      objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("_UISplitKeyboardGenerateNotification"));
    else
      -[UISplitKeyboardSupport undock](self, "undock");
    self->_isSplitting = 1;
    -[UIKeyboardMotionSupport masterController](self, "masterController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "prepareForSplitTransition");

  }
  -[UISplitKeyboardSupport _updateKeyboardLayoutGuideForSplitTransition:](self, "_updateKeyboardLayoutGuideForSplitTransition:", 1);
  -[UISplitKeyboardSource hostView](self->super._controller, "hostView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  self->_shouldUpdateKLGForTransition = -[UISplitKeyboardSupport _updateKeyboardLayoutGuideForHostFrame:animated:](self, "_updateKeyboardLayoutGuideForHostFrame:animated:", 0);

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__UISplitKeyboardSupport_prepareForTransition__block_invoke;
  v11[3] = &unk_1E16D6240;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v9, "performOnDistributedControllers:", v11);

}

uint64_t __46__UISplitKeyboardSupport_prepareForTransition__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startTransition:withInfo:", CFSTR("_UISplitKeyboardTransition"), *(_QWORD *)(a1 + 32));
}

- (void)updateProgress:(double)a3 startHeight:(double)a4 endHeight:(double)a5
{
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  if (!self->_isTranslating && self->_shouldUpdateKLGForTransition)
  {
    v9 = a4 - (a4 - a5) * a3;
    -[UISplitKeyboardSource placement](self->super._controller, "placement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISplitKeyboardSource inputViewSet](self->super._controller, "inputViewSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inputAssistantViewHeightForInputViewSet:", v11);
    v13 = v12;

    v14 = v9 + v13;
    -[UISplitKeyboardSource view](self->super._controller, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;
    -[UISplitKeyboardSource offsetForSplitTransition](self->super._controller, "offsetForSplitTransition");
    v19 = v17 - (v14 - v18);

    -[UISplitKeyboardSource view](self->super._controller, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    v22 = v21;

    -[UISplitKeyboardSupport _updateKeyboardLayoutGuideForHostFrame:animated:](self, "_updateKeyboardLayoutGuideForHostFrame:animated:", 0, 0.0, v19, v22, v14);
  }
  v31[0] = CFSTR("_UISplitKeyboardTransitionProgress");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v23;
  v31[1] = CFSTR("_UISplitKeyboardTransitionStartHeight");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v24;
  v31[2] = CFSTR("_UISplitKeyboardTransitionEndHeight");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __63__UISplitKeyboardSupport_updateProgress_startHeight_endHeight___block_invoke;
  v29[3] = &unk_1E16D6240;
  v30 = v26;
  v28 = v26;
  objc_msgSend(v27, "performOnDistributedControllers:", v29);

}

uint64_t __63__UISplitKeyboardSupport_updateProgress_startHeight_endHeight___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTransition:withInfo:", CFSTR("_UISplitKeyboardTransition"), *(_QWORD *)(a1 + 32));
}

- (void)finishTransitionWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *bounceCompletionBlock;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  void (**v23)(void);
  _QWORD v24[4];
  id v25;

  v23 = (void (**)(void))a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UISplitKeyboardSupport isTranslating](self, "isTranslating"))
  {
    v5 = (void *)objc_msgSend(v23, "copy");
    bounceCompletionBlock = self->_bounceCompletionBlock;
    self->_bounceCompletionBlock = v5;
  }
  else
  {
    if (v23)
    {
      v23[2]();
      objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("_UISplitKeyboardRefreshPresentation"));
    }
    -[UISplitKeyboardSource hostView](self->super._controller, "hostView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v10 = v8 + v9;
    -[UISplitKeyboardSource view](self->super._controller, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v10 - v12;

    -[UISplitKeyboardSource hostView](self->super._controller, "hostView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v17 = v15 + v16;
    -[UISplitKeyboardSource view](self->super._controller, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v20 = v17 - v19;

    +[UIKeyboardImpl setPersistentOffset:](UIKeyboardImpl, "setPersistentOffset:", v13, v20);
    objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("_UISplitKeyboardGenerateNotification"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", dispatch_time(0, 100000000));
    bounceCompletionBlock = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", bounceCompletionBlock, CFSTR("_UISplitKeyboardGenerateNotificationTime"));
  }

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __57__UISplitKeyboardSupport_finishTransitionWithCompletion___block_invoke;
  v24[3] = &unk_1E16D6240;
  v25 = v4;
  v22 = v4;
  objc_msgSend(v21, "performOnDistributedControllers:", v24);

  -[UISplitKeyboardSource setInterfaceAutorotationDisabled:](self->super._controller, "setInterfaceAutorotationDisabled:", 0);
}

uint64_t __57__UISplitKeyboardSupport_finishTransitionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "completeTransition:withInfo:", CFSTR("_UISplitKeyboardTransition"), *(_QWORD *)(a1 + 32));
}

- (void)transitionDidFinish:(BOOL)a3
{
  _BOOL8 v3;
  void (**bounceCompletionBlock)(id, SEL);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  BOOL v13;
  void *v14;
  id v15;
  void *v16;
  BOOL v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  BOOL v26;
  BOOL v27;

  v3 = a3;
  bounceCompletionBlock = (void (**)(id, SEL))self->_bounceCompletionBlock;
  if (bounceCompletionBlock)
  {
    bounceCompletionBlock[2](bounceCompletionBlock, a2);
    v6 = self->_bounceCompletionBlock;
    self->_bounceCompletionBlock = 0;

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("_UISplitKeyboardTransitionCallback"));

  self->_isSplitting = 0;
  if (!self->_isTranslating || self->_targetTranslation.y != 0.0)
    goto LABEL_9;
  -[UISplitKeyboardSource placement](self->super._controller, "placement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isUndocked"))
    goto LABEL_8;
  -[UISplitKeyboardSource inputViewSet](self->super._controller, "inputViewSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "_inputViewIsSplit"))
  {

LABEL_8:
LABEL_9:
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("_UISplitKeyboardGenerateNotification"));
    v11 = 0;
    v12 = 0;
    goto LABEL_10;
  }
  v17 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");

  if (v17)
    goto LABEL_9;
  -[UISplitKeyboardSource positionConstraintConstant](self->super._controller, "positionConstraintConstant");
  v19 = v18;
  -[UISplitKeyboardSource inputViewSet](self->super._controller, "inputViewSet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "splitHeightDelta");
  v12 = v19 < floor(v21 * -0.5);

  +[UIInputViewSetPlacement placement](UIInputViewSetPlacementOnScreen, "placement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardImpl setPersistentOffset:](UIKeyboardImpl, "setPersistentOffset:", 0.0, 0.0);
  if (v11)
  {
    v13 = -[UISplitKeyboardSupport generateSplitNotificationForNewPlacement:](self, "generateSplitNotificationForNewPlacement:", v11);
    goto LABEL_11;
  }
LABEL_10:
  v13 = 0;
LABEL_11:
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __46__UISplitKeyboardSupport_transitionDidFinish___block_invoke;
  v23[3] = &unk_1E16D7560;
  v24 = v7;
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v15 = v11;
  v22 = v7;
  objc_msgSend(v14, "performOnDistributedControllers:", v23);

  self->_shouldUpdateKLGForTransition = 0;
  -[UIKeyboardMotionSupport masterController](self, "masterController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "finishSplitTransition");

}

void __46__UISplitKeyboardSupport_transitionDidFinish___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "completeTransition:withInfo:", CFSTR("_UISplitKeyboardTransition"), *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    objc_msgSend(v4, "setPlacement:quietly:animated:generateSplitNotification:", v3, 0, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bounceCompletionBlock, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_twoFingerPanRecognizer, 0);
  objc_storeStrong((id *)&self->_singleFingerPanRecognizer, 0);
}

@end
