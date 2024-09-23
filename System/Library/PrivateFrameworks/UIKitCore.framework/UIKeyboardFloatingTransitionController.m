@implementation UIKeyboardFloatingTransitionController

+ (double)magneticEdgeMargin
{
  return 15.0;
}

+ (CGRect)dockingRegion
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
  CGRect result;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4 / 3.0;
  v8 = v6 + -30.0;
  v9 = 30.0;
  v10 = v4 / 3.0;
  result.size.height = v9;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

+ (BOOL)isPointWithinDockingRegion:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat width;
  CGFloat height;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  if (+[UIKeyboardImpl isFloatingForced](UIKeyboardImpl, "isFloatingForced"))
    return 0;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");

  objc_msgSend(a1, "dockingRegion");
  v7 = v12.origin.x;
  v8 = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  if (x < CGRectGetMinX(v12))
    return 0;
  v13.origin.x = v7;
  v13.origin.y = v8;
  v13.size.width = width;
  v13.size.height = height;
  if (x > CGRectGetMaxX(v13))
    return 0;
  v14.origin.x = v7;
  v14.origin.y = v8;
  v14.size.width = width;
  v14.size.height = height;
  return y >= CGRectGetMinY(v14);
}

+ (id)snapshotOfKeyplaneView:(id)a3
{
  id v3;
  UIKeyboardKeyplaneSnapshotView *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = -[UIKeyboardKeyplaneSnapshotView initWithKeyplaneView:]([UIKeyboardKeyplaneSnapshotView alloc], "initWithKeyplaneView:", v3);
  -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  objc_msgSend(v3, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  -[UIView setContentScaleFactor:](v4, "setContentScaleFactor:");

  return v4;
}

- (void)beginTransitionFromPanGestureRecognizer:(id)a3
{
  id *v4;
  UIPanGestureRecognizer *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (id *)a3;
  v5 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", self, sel_handlePanGestureRecognizerAction_);
  -[UIKeyboardFloatingTransitionController setPanGestureRecognizer:](self, "setPanGestureRecognizer:", v5);

  -[UIKeyboardFloatingTransitionController pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardFloatingTransitionController panGestureRecognizer](self, "panGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addGestureRecognizer:", v8);

  -[UIKeyboardFloatingTransitionController panGestureRecognizer](self, "panGestureRecognizer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer transferTouchesFromGestureRecognizer:](v9, v4);

}

- (void)updateHysteresisForCurrentFloatingState
{
  double v3;
  id v4;

  if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
    v3 = 8.0;
  else
    v3 = 68.0;
  -[UIKeyboardFloatingTransitionController pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setHysteresis:", v3);

}

- (void)addGestureRecognizersToView:(id)a3
{
  void *v4;
  id v5;
  UIKeyboardFloatingPinchGestureRecognizer *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[UIKeyboardFloatingTransitionController pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v10)
  {
    -[UIKeyboardFloatingTransitionController removeGestureRecognizers](self, "removeGestureRecognizers");
    v6 = -[UIKeyboardFloatingPinchGestureRecognizer initWithTarget:action:]([UIKeyboardFloatingPinchGestureRecognizer alloc], "initWithTarget:action:", self, sel_handlePinchGestureRecognizerAction_);
    -[UIKeyboardFloatingTransitionController setPinchGestureRecognizer:](self, "setPinchGestureRecognizer:", v6);

    -[UIKeyboardFloatingTransitionController pinchGestureRecognizer](self, "pinchGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setEndsOnSingleTouch:", 1);

    -[UIKeyboardFloatingTransitionController pinchGestureRecognizer](self, "pinchGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);

    -[UIKeyboardFloatingTransitionController pinchGestureRecognizer](self, "pinchGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addGestureRecognizer:", v9);

  }
  -[UIKeyboardFloatingTransitionController updateHysteresisForCurrentFloatingState](self, "updateHysteresisForCurrentFloatingState");

}

- (void)removeGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;

  -[UIKeyboardFloatingTransitionController pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardFloatingTransitionController pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGestureRecognizer:", v5);

  -[UIKeyboardFloatingTransitionController setPinchGestureRecognizer:](self, "setPinchGestureRecognizer:", 0);
}

- (void)handlePanGestureRecognizerAction:(id)a3
{
  id v4;

  v4 = a3;
  switch(objc_msgSend(v4, "state"))
  {
    case 1:
      -[UIKeyboardFloatingTransitionController beginPanGesture:](self, "beginPanGesture:", v4);
      break;
    case 2:
      -[UIKeyboardFloatingTransitionController updatePanGesture:](self, "updatePanGesture:", v4);
      break;
    case 3:
    case 4:
      -[UIKeyboardFloatingTransitionController endPanGesture:](self, "endPanGesture:", v4);
      break;
    default:
      break;
  }

}

- (void)beginPanGesture:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "locationOfTouch:inView:", 0, 0);
  -[UIKeyboardFloatingTransitionController beginTransitionAtPoint:withScale:recognizer:](self, "beginTransitionAtPoint:withScale:recognizer:", v4);

  -[UIKeyboardFloatingTransitionController setWithinDockingRegion:](self, "setWithinDockingRegion:", 0);
}

- (void)updatePanGesture:(id)a3
{
  objc_msgSend(a3, "locationOfTouch:inView:", 0, 0);
  -[UIKeyboardFloatingTransitionController updateTransitionAtPoint:withScale:interactive:](self, "updateTransitionAtPoint:withScale:interactive:", 1);
}

- (void)endPanGesture:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  v6 = v5;
  v8 = v7;

  if (objc_msgSend(v14, "numberOfTouches") == 1)
  {
    objc_msgSend(v14, "locationOfTouch:inView:", 0, 0);
    v6 = v9;
    v8 = v10;
  }
  -[UIKeyboardFloatingTransitionController endTransitionAtPoint:withScale:](self, "endTransitionAtPoint:withScale:", v6, v8, 1.0);
  -[UIKeyboardFloatingTransitionController panGestureRecognizer](self, "panGestureRecognizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardFloatingTransitionController panGestureRecognizer](self, "panGestureRecognizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeGestureRecognizer:", v13);

  -[UIKeyboardFloatingTransitionController setPanGestureRecognizer:](self, "setPanGestureRecognizer:", 0);
}

- (void)handlePinchGestureRecognizerAction:(id)a3
{
  id v4;

  v4 = a3;
  switch(objc_msgSend(v4, "state"))
  {
    case 1:
      -[UIKeyboardFloatingTransitionController beginPinchGesture:](self, "beginPinchGesture:", v4);
      break;
    case 2:
      -[UIKeyboardFloatingTransitionController updatePinchGesture:](self, "updatePinchGesture:", v4);
      break;
    case 3:
    case 4:
      -[UIKeyboardFloatingTransitionController endPinchGesture:](self, "endPinchGesture:", v4);
      break;
    default:
      break;
  }

}

- (void)beginPinchGesture:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "numberOfTouches"))
  {
    objc_msgSend(v12, "locationInView:", 0);
    v5 = v4;
    v7 = v6;
  }
  else
  {
    -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "center");
    v5 = v9;
    v7 = v10;

  }
  objc_msgSend(v12, "scale");
  -[UIKeyboardFloatingTransitionController beginTransitionAtPoint:withScale:recognizer:](self, "beginTransitionAtPoint:withScale:recognizer:", v12, v5, v7, v11);

}

- (void)updatePinchGesture:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  if (objc_msgSend(v4, "numberOfTouches"))
  {
    objc_msgSend(v4, "locationInView:", 0);
    v6 = v5;
    v8 = v7;
  }
  else
  {
    -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "center");
    v6 = v10;
    v8 = v11;

  }
  objc_msgSend(v4, "scale");
  v13 = v12;

  -[UIKeyboardFloatingTransitionController updateTransitionAtPoint:withScale:interactive:](self, "updateTransitionAtPoint:withScale:interactive:", 1, v6, v8, v13);
}

- (void)endPinchGesture:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  if (objc_msgSend(v4, "numberOfTouches"))
  {
    objc_msgSend(v4, "locationInView:", 0);
    v6 = v5;
    v8 = v7;
  }
  else
  {
    -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "center");
    v6 = v10;
    v8 = v11;

  }
  objc_msgSend(v4, "scale");
  v13 = v12;

  -[UIKeyboardFloatingTransitionController endTransitionAtPoint:withScale:](self, "endTransitionAtPoint:withScale:", v6, v8, v13);
}

- (void)beginTransitionAtPoint:(CGPoint)a3 withScale:(double)a4 recognizer:(id)a5
{
  double y;
  double x;
  id v9;
  void *v10;

  y = a3.y;
  x = a3.x;
  v9 = a5;
  -[UIKeyboardFloatingTransitionController setIsTransitioning:](self, "setIsTransitioning:", 1);
  -[UIKeyboardFloatingTransitionController updateLayoutGuideForTransitionStart:](self, "updateLayoutGuideForTransitionStart:", 1);
  -[UIKeyboardFloatingTransitionController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "willBeginTransitionWithController:", self);

  -[UIKeyboardFloatingTransitionController initializeContextAtPoint:recognizer:](self, "initializeContextAtPoint:recognizer:", v9, x, y);
  -[UIKeyboardFloatingTransitionController updateTransitionAtPoint:withScale:interactive:](self, "updateTransitionAtPoint:withScale:interactive:", 0, x, y, a4);
}

- (void)updateTransitionAtPoint:(CGPoint)a3 withScale:(double)a4 interactive:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD aBlock[10];
  BOOL v25;

  v5 = a5;
  y = a3.y;
  x = a3.x;
  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "center");
    v14 = v13;
    v16 = v15;

    v17 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__UIKeyboardFloatingTransitionController_updateTransitionAtPoint_withScale_interactive___block_invoke;
    aBlock[3] = &unk_1E16E0770;
    aBlock[4] = self;
    *(double *)&aBlock[5] = x;
    *(double *)&aBlock[6] = y;
    *(double *)&aBlock[7] = x - v14;
    *(double *)&aBlock[8] = y - v16;
    v25 = v5;
    *(double *)&aBlock[9] = a4;
    v18 = _Block_copy(aBlock);
    -[UIKeyboardFloatingTransitionController lightEffectsTransitionBackdrop](self, "lightEffectsTransitionBackdrop");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      if (v5)
        -[UIKeyboardFloatingTransitionController updateAnimationAtScale:](self, "updateAnimationAtScale:", a4);
    }
    -[UIKeyboardFloatingTransitionController animationBehavior](self, "animationBehavior");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __88__UIKeyboardFloatingTransitionController_updateTransitionAtPoint_withScale_interactive___block_invoke_2;
    v22[3] = &unk_1E16B1BF8;
    v23 = v18;
    v21 = v18;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v20, v5, v22, 0);

  }
}

void __88__UIKeyboardFloatingTransitionController_updateTransitionAtPoint_withScale_interactive___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "platterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCenter:", v2, v3);

  objc_msgSend(*(id *)(a1 + 32), "startState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "center");
  v8 = v7 + *(double *)(a1 + 56);
  v10 = v9 + *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "startState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCenter:", v8, v10);

  objc_msgSend(*(id *)(a1 + 32), "endState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inputView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "center");
  v16 = v15 + *(double *)(a1 + 56);
  v18 = v17 + *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "endState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "inputView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCenter:", v16, v18);

  objc_msgSend(*(id *)(a1 + 32), "lightEffectsTransitionBackdrop");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21 || (v22 = *(unsigned __int8 *)(a1 + 80), v21, !v22))
    objc_msgSend(*(id *)(a1 + 32), "updateAnimationAtScale:", *(double *)(a1 + 72));
}

uint64_t __88__UIKeyboardFloatingTransitionController_updateTransitionAtPoint_withScale_interactive___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)endTransitionAtPoint:(CGPoint)a3 withScale:(double)a4
{
  double y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  void *v31;
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
  double v42;
  double v43;
  double v44;
  double v45;
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
  double v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  CGFloat v77;
  CGFloat height;
  double MinX;
  double v80;
  double v81;
  double MaxX;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  void *v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  double v106;
  double MaxY;
  __CFString *v108;
  __CFString **v109;
  __CFString *v110;
  void *v111;
  double v112;
  double v113;
  void *v114;
  double v115;
  double v116;
  void *v117;
  __CFString *v118;
  double v119;
  double v120;
  double v121;
  CGFloat v122;
  double v123;
  double v124;
  double rect;
  double recta;
  uint64_t v127;
  CGFloat v128;
  double v129;
  _QWORD v130[5];
  __CFString *v131;
  double v132;
  double v133;
  CGFloat v134;
  double v135;
  char v136;
  _QWORD v137[10];
  CATransform3D v138;
  double v139;
  uint64_t v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;

  y = a3.y;
  x = a3.x;
  v140 = *MEMORY[0x1E0C80C00];
  v8 = CACurrentMediaTime();
  -[UIKeyboardFloatingTransitionController gestureBeginTime](self, "gestureBeginTime");
  v10 = v8 - v9;
  v11 = 1.0;
  if (v10 > 0.25)
  {
    if (-[UIKeyboardFloatingTransitionController expandedForDocking](self, "expandedForDocking"))
    {
      -[UIKeyboardFloatingTransitionController progress](self, "progress");
      v11 = v12;
    }
    else
    {
      -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_projectedTargetForKey:decelerationFactor:", CFSTR("transform"), 0.995);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      memset(&v138, 0, sizeof(v138));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v14)
          objc_msgSend(v14, "CATransform3DValue");
        else
          memset(&v138, 0, sizeof(v138));
      }
      else
      {
        CATransform3DMakeScale(&v138, a4, a4, 1.0);
      }
      CATransform3DGetDecomposition_();
      v15 = round(v139 + -1.0);
      -[UIKeyboardFloatingTransitionController endState](self, "endState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "scale");
      v11 = v15 / (v17 + -1.0);

    }
  }
  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_projectedTargetForKey:decelerationFactor:", CFSTR("position"), 0.995);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v129 = y;
  v20 = x;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v19, "CGPointValue");
    v20 = v21;
    y = v22;
  }
  if (-[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating")
    && (v23 = 0.5, v11 < 0.5))
  {
    v24 = 1;
  }
  else
  {
    v25 = -[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating");
    v23 = 0.5;
    v24 = (v11 >= 0.5) & ~v25;
  }
  if (v11 >= v23)
  {
    -[UIKeyboardFloatingTransitionController endState](self, "endState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardFloatingTransitionController endState](self, "endState");
  }
  else
  {
    -[UIKeyboardFloatingTransitionController startState](self, "startState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardFloatingTransitionController startState](self, "startState");
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = x;
  objc_msgSend(v27, "scale");
  v127 = v28;

  v29 = CFSTR("NotOnEdge");
  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "superview");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "bounds");
  v35 = v32;
  v36 = v33;
  v37 = v34;
  rect = v38;
  if (v24)
  {
    v119 = v32;
    v120 = v33;
    v39 = v20;
    v121 = v34;
    -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "anchorPoint");
    v43 = v42;
    v44 = v10;
    v46 = v45;

    if (v44 <= 0.25)
    {
      +[UIKeyboardImpl floatingPersistentOffset](UIKeyboardImpl, "floatingPersistentOffset");
      v48 = v47;
      v50 = v49;
      objc_msgSend(v26, "platterViewFrame");
      v52 = v51;
      v54 = v53;
      +[UIKeyboardPopoverContainer contentInsets](UIKeyboardPopoverContainer, "contentInsets");
      v57 = v54 - (v55 + v56);
      v59 = v48 - v58;
      objc_msgSend(v31, "frame");
      v61 = v50 + v60 - v57;
      v39 = v43 * v52 + v59;
      y = v46 * v54 + v61;
    }
    objc_msgSend(v26, "platterViewFrame");
    v63 = v62;
    v65 = v64;
    v123 = v43;
    v124 = v46;
    v66 = v39 - v43 * v62;
    v67 = y - v46 * v64;
    +[UIPeripheralHost floatingChromeBuffer](UIPeripheralHost, "floatingChromeBuffer");
    v69 = v119 + v68;
    v71 = v120 + v70;
    v73 = v121 - (v68 + v72);
    v75 = rect - (v70 + v74);
    v141.origin.x = UIRectContainInRect(v66, v67, v63, v65, v119 + v68, v120 + v70, v73, v75);
    v76 = v141.origin.x;
    v77 = v141.origin.y;
    height = v141.size.height;
    recta = v141.size.width;
    MinX = CGRectGetMinX(v141);
    v142.origin.x = v69;
    v142.origin.y = v71;
    v142.size.width = v73;
    v142.size.height = v75;
    v80 = MinX - CGRectGetMinX(v142);
    +[UIKeyboardFloatingTransitionController magneticEdgeMargin](UIKeyboardFloatingTransitionController, "magneticEdgeMargin");
    v122 = v77;
    if (v80 <= v81)
    {
      v109 = UIKBAnalyticsFloatingKeyboardEdgeLeft;
      v76 = v69;
      v86 = v129;
      v88 = v123;
      v84 = height;
      v90 = recta;
    }
    else
    {
      v143.origin.x = v69;
      v143.origin.y = v71;
      v143.size.width = v73;
      v143.size.height = v75;
      MaxX = CGRectGetMaxX(v143);
      v144.origin.x = v76;
      v144.origin.y = v77;
      v144.size.width = recta;
      v144.size.height = height;
      v83 = MaxX - CGRectGetMaxX(v144);
      +[UIKeyboardFloatingTransitionController magneticEdgeMargin](UIKeyboardFloatingTransitionController, "magneticEdgeMargin");
      v84 = height;
      if (v83 > v85)
      {
        v86 = v129;
        v88 = v123;
        v87 = v124;
        v89 = v122;
        v90 = recta;
LABEL_31:
        v106 = v88 * v90 + v76;
        MaxY = v89 + v87 * v84;
        v108 = v29;
        goto LABEL_32;
      }
      v147.origin.x = v69;
      v147.origin.y = v71;
      v147.size.width = v73;
      v147.size.height = v75;
      v90 = recta;
      v76 = CGRectGetMaxX(v147) - recta;
      v109 = UIKBAnalyticsFloatingKeyboardEdgeRight;
      v86 = v129;
      v88 = v123;
    }
    v110 = *v109;

    v29 = v110;
    v87 = v124;
    v89 = v122;
    goto LABEL_31;
  }
  objc_msgSend(v26, "platterViewFrame");
  v92 = v91;
  v94 = v93;
  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "layer");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "anchorPoint");
  v98 = v92 * v97;
  v99 = v92 * (1.0 - v97);
  v101 = v94 * v100;
  v102 = v94 * (1.0 - v100);

  v103 = v35 + v98;
  v104 = v36 + v101;
  v105 = v37 - (v98 + v99);
  v145.origin.x = v103;
  v145.origin.y = v104;
  v145.size.width = v105;
  v145.size.height = rect - (v101 + v102);
  v106 = CGRectGetMinX(v145);
  v146.origin.x = v103;
  v146.origin.y = v104;
  v146.size.width = v105;
  v146.size.height = rect - (v101 + v102);
  MaxY = CGRectGetMaxY(v146);
  v108 = CFSTR("BottomEdge");

  if (-[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating"))
    +[UIKBAnalyticsDispatcher floatingKeyboardSummonedEvent:trigger:finalPosition:](UIKBAnalyticsDispatcher, "floatingKeyboardSummonedEvent:trigger:finalPosition:", CFSTR("Tether"), CFSTR("Interactive"), v106, MaxY);
  v86 = v129;
LABEL_32:
  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "center");
  v113 = v106 - v112;

  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "center");
  v116 = MaxY - v115;

  -[UIKeyboardFloatingTransitionController animationBehavior](self, "animationBehavior");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v137[0] = MEMORY[0x1E0C809B0];
  v137[1] = 3221225472;
  v137[2] = __73__UIKeyboardFloatingTransitionController_endTransitionAtPoint_withScale___block_invoke;
  v137[3] = &unk_1E16E0798;
  v137[4] = self;
  *(double *)&v137[5] = v106;
  *(double *)&v137[6] = MaxY;
  *(double *)&v137[7] = v113;
  *(double *)&v137[8] = v116;
  v137[9] = v127;
  v130[0] = MEMORY[0x1E0C809B0];
  v130[1] = 3221225472;
  v130[2] = __73__UIKeyboardFloatingTransitionController_endTransitionAtPoint_withScale___block_invoke_2;
  v130[3] = &unk_1E16E07C0;
  v136 = v24;
  v132 = v106;
  v133 = MaxY;
  v130[4] = self;
  v131 = v108;
  v134 = v128;
  v135 = v86;
  v118 = v108;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v117, 0, v137, v130);

}

uint64_t __73__UIKeyboardFloatingTransitionController_endTransitionAtPoint_withScale___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "platterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCenter:", v2, v3);

  objc_msgSend(*(id *)(a1 + 32), "startState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "center");
  v8 = v7 + *(double *)(a1 + 56);
  v10 = v9 + *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "startState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCenter:", v8, v10);

  objc_msgSend(*(id *)(a1 + 32), "endState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inputView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "center");
  v16 = v15 + *(double *)(a1 + 56);
  v18 = v17 + *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "endState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "inputView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCenter:", v16, v18);

  return objc_msgSend(*(id *)(a1 + 32), "updateAnimationAtScale:", *(double *)(a1 + 72));
}

uint64_t __73__UIKeyboardFloatingTransitionController_endTransitionAtPoint_withScale___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;
  double MinY;
  const __CFString *v5;
  CGRect v6;

  objc_msgSend(*(id *)(a1 + 32), "finalizeTransition");
  if ((objc_msgSend(*(id *)(a1 + 32), "startedFromFloating") & 1) == 0 && *(_BYTE *)(a1 + 80))
    return +[UIKBAnalyticsDispatcher floatingKeyboardSummonedEvent:trigger:finalPosition:](UIKBAnalyticsDispatcher, "floatingKeyboardSummonedEvent:trigger:finalPosition:", CFSTR("Untether"), CFSTR("Interactive"), *(double *)(a1 + 48), *(double *)(a1 + 56));
  result = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("BottomEdge"));
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "platterView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    MinY = CGRectGetMinY(v6);

    if (MinY <= 0.0)
      v5 = CFSTR("TopEdge");
    else
      v5 = *(const __CFString **)(a1 + 40);
    return +[UIKBAnalyticsDispatcher floatingKeyboardMoved:toPosition:touchPosition:](UIKBAnalyticsDispatcher, "floatingKeyboardMoved:toPosition:touchPosition:", v5, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
  return result;
}

- (void)initializeContextAtPoint:(CGPoint)a3 recognizer:(id)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  UIKeyboardFloatingTransitionState *v9;
  UIKeyboardFloatingTransitionState *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIView *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIView *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  UIView *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  _UIKBLightEffectsBackground *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  UIKBVisualEffectView *v83;
  void *v84;
  void *v85;
  void *v86;
  UIView *v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  void *v92;
  double v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  void *v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  CGFloat v114;
  void *v115;
  CGFloat v116;
  double v117;
  CGFloat v118;
  void *v119;
  void *v120;
  double MidX;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  char isKindOfClass;
  void *v139;
  void *v140;
  double v141;
  double v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  void *v156;
  void *v157;
  void *v158;
  int v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  uint64_t v166;
  void *v167;
  void *v168;
  void *v169;
  double v170;
  double v171;
  void *v172;
  double v173;
  double v174;
  void *v175;
  double v176;
  double v177;
  void *v178;
  double v179;
  double v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  id v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  void *v203;
  double v204;
  double v205;
  void *v206;
  double v207;
  double v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  double v213;
  double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  id v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  void *v230;
  double v231;
  double v232;
  void *v233;
  double v234;
  double v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  UIViewSpringAnimationBehavior *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  CGFloat v299;
  CGFloat v300;
  void *v301;
  CGFloat v302;
  CGFloat v303;
  void *v304;
  __int128 v305;
  void *v306;
  __int128 v307;
  id v308;
  __int128 v309;
  _OWORD v310[3];
  __int128 v311;
  __int128 v312;
  __int128 v313;
  _OWORD v314[3];
  CGAffineTransform v315;
  CGAffineTransform v316;
  CGAffineTransform v317;
  CGAffineTransform v318;
  _OWORD v319[2];
  __int128 v320;
  CGAffineTransform v321;
  CGAffineTransform v322;
  _QWORD v323[12];
  CGRect v324;
  CGRect v325;
  CGRect v326;
  CGRect v327;

  y = a3.y;
  x = a3.x;
  v323[10] = *MEMORY[0x1E0C80C00];
  v308 = a4;
  -[UIKeyboardFloatingTransitionController setProgress:](self, "setProgress:", 0.0);
  -[UIKeyboardFloatingTransitionController setStartedFromFloating:](self, "setStartedFromFloating:", +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"));
  -[UIKeyboardFloatingTransitionController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputWindowControllerForController:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardFloatingTransitionController setInputWindowController:](self, "setInputWindowController:", v8);

  v9 = objc_alloc_init(UIKeyboardFloatingTransitionState);
  -[UIKeyboardFloatingTransitionController setStartState:](self, "setStartState:", v9);

  v10 = objc_alloc_init(UIKeyboardFloatingTransitionState);
  -[UIKeyboardFloatingTransitionController setEndState:](self, "setEndState:", v10);

  -[UIKeyboardFloatingTransitionController captureStateForStart:](self, "captureStateForStart:", 1);
  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _UIViewSetAnchorPointToTouchPoint(v12, x, y);

  -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = [UIView alloc];
  v17 = *MEMORY[0x1E0C9D648];
  v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v20 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v21 = -[UIView initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E0C9D648], v18, v19, v20);
  -[UIKeyboardFloatingTransitionController setPlatterView:](self, "setPlatterView:", v21);

  if (-[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating"))
  {
    +[UIKeyboardPopoverContainer shadowOffset](UIKeyboardPopoverContainer, "shadowOffset");
    v23 = v22;
    v25 = v24;
    -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setShadowOffset:", v23, v25);

    +[UIKeyboardPopoverContainer shadowColor](UIKeyboardPopoverContainer, "shadowColor");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = objc_msgSend(v28, "CGColor");
    -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setShadowColor:", v29);

    +[UIKeyboardPopoverContainer shadowOpacity](UIKeyboardPopoverContainer, "shadowOpacity");
    *(float *)&v23 = v32;
    -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v35) = LODWORD(v23);
    objc_msgSend(v34, "setShadowOpacity:", v35);

    +[UIKeyboardPopoverContainer shadowRadius](UIKeyboardPopoverContainer, "shadowRadius");
    v37 = v36;
    -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setShadowRadius:", v37);

  }
  v40 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v17, v18, v19, v20);
  -[UIKeyboardFloatingTransitionController setPlatterCornerRadiusView:](self, "setPlatterCornerRadiusView:", v40);

  -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setAutoresizingMask:", 18);

  -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "layer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setMasksToBounds:", 1);

  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "cornerRadius");
  v46 = v45;
  -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "layer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setCornerRadius:", v46);

  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "borderColor");
  v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v51 = objc_msgSend(v50, "CGColor");
  -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "layer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setBorderColor:", v51);

  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "borderWidth");
  v56 = v55;
  -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "layer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setBorderWidth:", v56);

  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addSubview:", v60);

  v61 = (void *)objc_msgSend(objc_alloc(+[_UIPopoverStandardChromeView standardChromeViewClass](_UIPopoverStandardChromeView, "standardChromeViewClass")), "initWithFrame:", v17, v18, v19, v20);
  -[UIKeyboardFloatingTransitionController setPlatterPopoverBackgroundView:](self, "setPlatterPopoverBackgroundView:", v61);

  -[UIKeyboardFloatingTransitionController platterPopoverBackgroundView](self, "platterPopoverBackgroundView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setAutoresizingMask:", 18);

  -[UIKeyboardFloatingTransitionController platterPopoverBackgroundView](self, "platterPopoverBackgroundView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setBackgroundStyle:", 6);

  -[UIKeyboardFloatingTransitionController platterPopoverBackgroundView](self, "platterPopoverBackgroundView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setArrowDirection:", 0);

  if (-[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating"))
    v65 = 1.0;
  else
    v65 = 0.0;
  -[UIKeyboardFloatingTransitionController platterPopoverBackgroundView](self, "platterPopoverBackgroundView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setAlpha:", v65);

  -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardFloatingTransitionController platterPopoverBackgroundView](self, "platterPopoverBackgroundView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "addSubview:", v68);

  +[UIKBRenderConfig defaultConfig](UIKBRenderConfig, "defaultConfig");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "backdropStyle");

  -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "hosting");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "itemForPurpose:", 0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v73, "conformsToProtocol:", &unk_1EDFA92E0))
    v70 = objc_msgSend(v73, "inputViewBackdropStyle");
  if (v70 == 3904)
  {
    v74 = -[_UIKBLightEffectsBackground initWithFrame:]([_UIKBLightEffectsBackground alloc], "initWithFrame:", v17, v18, v19, v20);
    -[UIKeyboardFloatingTransitionController setLightEffectsTransitionBackdrop:](self, "setLightEffectsTransitionBackdrop:", v74);

    -[UIKeyboardFloatingTransitionController lightEffectsTransitionBackdrop](self, "lightEffectsTransitionBackdrop");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardFloatingTransitionController lightEffectsTransitionBackdrop](self, "lightEffectsTransitionBackdrop");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "addSubview:", v77);

    -[UIKeyboardFloatingTransitionController platterPopoverBackgroundView](self, "platterPopoverBackgroundView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setAlpha:", 0.0);

    -[UIKeyboardFloatingTransitionController lightEffectsTransitionBackdrop](self, "lightEffectsTransitionBackdrop");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardFloatingTransitionController lightEffectsTransitionBackdrop](self, "lightEffectsTransitionBackdrop");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "_inheritedRenderConfig");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "_setRenderConfig:", v82);

  }
  else
  {
    -[UIKeyboardFloatingTransitionController setLightEffectsTransitionBackdrop:](self, "setLightEffectsTransitionBackdrop:", 0);
    v83 = -[UIKBBackdropView initWithFrame:style:]([UIKBVisualEffectView alloc], "initWithFrame:style:", v70, v17, v18, v19, v20);
    -[UIKeyboardFloatingTransitionController setPlatterVisualEffectView:](self, "setPlatterVisualEffectView:", v83);

    -[UIKeyboardFloatingTransitionController platterVisualEffectView](self, "platterVisualEffectView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setAutoresizingMask:", 18);

    -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardFloatingTransitionController platterVisualEffectView](self, "platterVisualEffectView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "addSubview:", v86);

    -[UIKeyboardFloatingTransitionController platterVisualEffectView](self, "platterVisualEffectView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "contentView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v87 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v17, v18, v19, v20);
  -[UIKeyboardFloatingTransitionController setPillView:](self, "setPillView:", v87);

  -[UIKeyboardFloatingTransitionController pillView](self, "pillView");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setAutoresizingMask:", 13);

  +[UIKeyboardPopoverContainer pillColor](UIKeyboardPopoverContainer, "pillColor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardFloatingTransitionController pillView](self, "pillView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setBackgroundColor:", v89);

  if (-[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating"))
    v91 = 1.0;
  else
    v91 = 0.0;
  -[UIKeyboardFloatingTransitionController pillView](self, "pillView");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setAlpha:", v91);

  +[UIKeyboardPopoverContainer pillCornerRadius](UIKeyboardPopoverContainer, "pillCornerRadius");
  v94 = v93;
  -[UIKeyboardFloatingTransitionController pillView](self, "pillView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "layer");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "setCornerRadius:", v94);

  -[UIKeyboardFloatingTransitionController pillView](self, "pillView");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addSubview:", v97);

  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "platterViewFrame");
  v100 = v99;
  v102 = v101;
  v104 = v103;
  v106 = v105;
  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "setFrame:", v100, v102, v104, v106);

  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  _UIViewSetAnchorPointToTouchPoint(v108, x, y);

  +[UIKeyboardPopoverContainer pillSize](UIKeyboardPopoverContainer, "pillSize");
  v110 = v109;
  v112 = v111;
  +[UIKeyboardPopoverContainer dragAreaHeight](UIKeyboardPopoverContainer, "dragAreaHeight");
  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "platterViewFrame");
  v114 = CGRectGetWidth(v324) * 0.5 - v110 * 0.5;
  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "platterViewFrame");
  v116 = CGRectGetHeight(v325) - v112;
  +[UIKeyboardPopoverContainer pillDistanceToEdge](UIKeyboardPopoverContainer, "pillDistanceToEdge");
  v118 = v116 - v117;
  -[UIKeyboardFloatingTransitionController pillView](self, "pillView");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setFrame:", v114, v118, v110, v112);

  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "frame");
  MidX = CGRectGetMidX(v326);
  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "frame");
  -[UIKeyboardFloatingTransitionController setWithinDockingRegion:](self, "setWithinDockingRegion:", +[UIKeyboardFloatingTransitionController isPointWithinDockingRegion:](UIKeyboardFloatingTransitionController, "isPointWithinDockingRegion:", MidX, CGRectGetMaxY(v327)));

  -[UIKeyboardFloatingTransitionController setExpandedForDocking:](self, "setExpandedForDocking:", 0);
  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "layer");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "setAllowsGroupBlending:", 0);

  -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "layer");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "setAllowsGroupBlending:", 0);

  -[UIKeyboardFloatingTransitionController platterVisualEffectView](self, "platterVisualEffectView");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "layer");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setAllowsGroupBlending:", 0);

  -[UIKeyboardFloatingTransitionController lightEffectsTransitionBackdrop](self, "lightEffectsTransitionBackdrop");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "layer");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "setAllowsGroupBlending:", 0);

  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v131);

  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "inputView");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v133);

  -[UIKeyboardFloatingTransitionController lightEffectsTransitionBackdrop](self, "lightEffectsTransitionBackdrop");
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  if (v134)
  {
    -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "inputViewSet");
    v136 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v136, "assistantViewController");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v296 = v15;
    v297 = v14;
    v306 = v73;
    v301 = v136;
    v304 = v79;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v136, "assistantViewController");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      +[UITraitCollection traitCollectionWithUserInterfaceIdiom:](UITraitCollection, "traitCollectionWithUserInterfaceIdiom:", 1);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "preferredHeightForTraitCollection:", v140);
      v142 = v141;

    }
    else
    {
      v142 = 55.0;
    }
    v274 = (void *)MEMORY[0x1E0D156E0];
    -[UIKeyboardFloatingTransitionController lightEffectsTransitionBackdrop](self, "lightEffectsTransitionBackdrop");
    v298 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v298, "topAnchor");
    v294 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v295, "topAnchor");
    v293 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v294, "constraintEqualToAnchor:", v293);
    v292 = (void *)objc_claimAutoreleasedReturnValue();
    v323[0] = v292;
    -[UIKeyboardFloatingTransitionController lightEffectsTransitionBackdrop](self, "lightEffectsTransitionBackdrop");
    v291 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v291, "leadingAnchor");
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v290, "leadingAnchor");
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v289, "constraintEqualToAnchor:", v288);
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    v323[1] = v287;
    -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v286, "bottomAnchor");
    v284 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardFloatingTransitionController lightEffectsTransitionBackdrop](self, "lightEffectsTransitionBackdrop");
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v285, "bottomAnchor");
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v284, "constraintEqualToAnchor:", v283);
    v282 = (void *)objc_claimAutoreleasedReturnValue();
    v323[2] = v282;
    -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v281, "trailingAnchor");
    v279 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardFloatingTransitionController lightEffectsTransitionBackdrop](self, "lightEffectsTransitionBackdrop");
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v280, "trailingAnchor");
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v279, "constraintEqualToAnchor:", v278);
    v277 = (void *)objc_claimAutoreleasedReturnValue();
    v323[3] = v277;
    -[UIKeyboardFloatingTransitionController lightEffectsTransitionBackdrop](self, "lightEffectsTransitionBackdrop");
    v276 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v276, "fullBackdropLayoutGuide");
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v275, "topAnchor");
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v273, "topAnchor");
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v272, "constraintEqualToAnchor:", v271);
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    v323[4] = v270;
    -[UIKeyboardFloatingTransitionController lightEffectsTransitionBackdrop](self, "lightEffectsTransitionBackdrop");
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v269, "fullBackdropLayoutGuide");
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v268, "leadingAnchor");
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v267, "leadingAnchor");
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v266, "constraintEqualToAnchor:", v265);
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    v323[5] = v264;
    -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v263, "bottomAnchor");
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardFloatingTransitionController lightEffectsTransitionBackdrop](self, "lightEffectsTransitionBackdrop");
    v262 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v262, "fullBackdropLayoutGuide");
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v260, "bottomAnchor");
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v261, "constraintEqualToAnchor:", v259);
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    v323[6] = v258;
    -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v257, "trailingAnchor");
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardFloatingTransitionController lightEffectsTransitionBackdrop](self, "lightEffectsTransitionBackdrop");
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v256, "fullBackdropLayoutGuide");
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v254, "trailingAnchor");
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v255, "constraintEqualToAnchor:", v253);
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    v323[7] = v252;
    -[UIKeyboardFloatingTransitionController lightEffectsTransitionBackdrop](self, "lightEffectsTransitionBackdrop");
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v251, "assistantLayoutGuide");
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v250, "topAnchor");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "topAnchor");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "constraintEqualToAnchor:", v145);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v323[8] = v146;
    -[UIKeyboardFloatingTransitionController lightEffectsTransitionBackdrop](self, "lightEffectsTransitionBackdrop");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "assistantLayoutGuide");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "heightAnchor");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "constraintEqualToConstant:", v142);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v323[9] = v150;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v323, 10);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v274, "activateConstraints:", v151);

    v15 = v296;
    v14 = v297;
    v73 = v306;
    v79 = v304;
  }

  -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "setInputViewsHidden:", 1);

  -[UIKeyboardFloatingTransitionController constrainAccessoryViewToBottom](self, "constrainAccessoryViewToBottom");
  +[UIKeyboardImpl setFloating:positionedAtDefaultOffsetAnimated:](UIKeyboardImpl, "setFloating:positionedAtDefaultOffsetAnimated:", -[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating") ^ 1, 0);
  -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "inputViewSet");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "keyboard");
  v155 = objc_claimAutoreleasedReturnValue();
  if (!v155)
  {

    goto LABEL_23;
  }
  v156 = (void *)v155;
  -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "inputViewSet");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = objc_msgSend(v158, "isCustomInputView");

  if (v159)
  {
LABEL_23:
    -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "inputViewSet");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "inputView");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "setAlpha:", 0.0);

    -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "updateViewSizingConstraints");

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  -[UIKeyboardFloatingTransitionController captureStateForStart:](self, "captureStateForStart:", 0);
  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "inputView");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  _UIViewSetAnchorPointToTouchPoint(v165, x, y);

  v166 = objc_msgSend(v308, "state");
  if (v166 != 4)
    objc_msgSend(v14, "setAlpha:", 0.0);
  -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "setInputViewsHidden:", 0);

  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "setScale:", 1.0, 1.0);

  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "platterViewFrame");
  v171 = v170;
  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "platterViewFrame");
  v174 = v171 / v173;
  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "platterViewFrame");
  v177 = v176;
  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "platterViewFrame");
  v180 = v177 / v179;
  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "setScale:", v174, v180);

  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v307 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v319[0] = *MEMORY[0x1E0C9BAA8];
  v309 = v319[0];
  v319[1] = v307;
  v320 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v305 = v320;
  objc_msgSend(v182, "setInitialInputViewTransform:", v319);

  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "inputView");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "inputViewFrame");
  v187 = v186;
  v189 = v188;
  v191 = v190;
  v193 = v192;
  v194 = v184;
  objc_msgSend(v194, "frame");
  v196 = v195;
  v198 = v197;
  v200 = v199;
  v202 = v201;
  v299 = v193 / v201;
  v302 = v191 / v199;
  objc_msgSend(v194, "layer");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "anchorPoint");
  v205 = v196 + (v200 - v191) * v204;

  objc_msgSend(v194, "layer");
  v206 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v206, "anchorPoint");
  v208 = v198 + (v202 - v193) * v207;

  *(_OWORD *)&v318.a = v309;
  *(_OWORD *)&v318.c = v307;
  *(_OWORD *)&v318.tx = v305;
  *(_OWORD *)&v322.a = v309;
  *(_OWORD *)&v322.c = v307;
  *(_OWORD *)&v322.tx = v305;
  CGAffineTransformTranslate(&v318, &v322, v187 - v205, v189 - v208);
  v321 = v318;
  CGAffineTransformScale(&v322, &v321, v302, v299);
  v318 = v322;
  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v317 = v318;
  objc_msgSend(v209, "setFinalInputViewTransform:", &v317);

  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "inputView");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "inputViewFrame");
  v214 = v213;
  v216 = v215;
  v218 = v217;
  v220 = v219;
  v221 = v211;
  objc_msgSend(v221, "frame");
  v223 = v222;
  v225 = v224;
  v227 = v226;
  v229 = v228;
  v300 = v220 / v228;
  v303 = v218 / v226;
  objc_msgSend(v221, "layer");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v230, "anchorPoint");
  v232 = v223 + (v227 - v218) * v231;

  objc_msgSend(v221, "layer");
  v233 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v233, "anchorPoint");
  v235 = v225 + (v229 - v220) * v234;

  *(_OWORD *)&v316.a = v309;
  *(_OWORD *)&v316.c = v307;
  *(_OWORD *)&v316.tx = v305;
  *(_OWORD *)&v322.a = v309;
  *(_OWORD *)&v322.c = v307;
  *(_OWORD *)&v322.tx = v305;
  CGAffineTransformTranslate(&v316, &v322, v214 - v232, v216 - v235);
  v321 = v316;
  CGAffineTransformScale(&v322, &v321, v303, v300);
  v316 = v322;
  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  v315 = v316;
  objc_msgSend(v236, "setInitialInputViewTransform:", &v315);

  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v314[0] = v309;
  v314[1] = v307;
  v314[2] = v305;
  objc_msgSend(v237, "setFinalInputViewTransform:", v314);

  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v238, "inputView");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "setAlpha:", 0.0);

  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  v241 = v240;
  if (v240)
  {
    objc_msgSend(v240, "initialInputViewTransform");
  }
  else
  {
    v312 = 0u;
    v313 = 0u;
    v311 = 0u;
  }
  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v242, "inputView");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  v310[0] = v311;
  v310[1] = v312;
  v310[2] = v313;
  objc_msgSend(v243, "setTransform:", v310);

  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "inputView");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v245);

  v246 = objc_alloc_init(UIViewSpringAnimationBehavior);
  -[UIKeyboardFloatingTransitionController setAnimationBehavior:](self, "setAnimationBehavior:", v246);

  -[UIKeyboardFloatingTransitionController animationBehavior](self, "animationBehavior");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v247, "setDampingRatio:response:", 0.9, 0.2);

  -[UIKeyboardFloatingTransitionController animationBehavior](self, "animationBehavior");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v248, "setTrackingDampingRatio:response:dampingRatioSmoothing:responseSmoothing:", 1.0, 0.12, 0.08, 0.08);

  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v249, "center");
  -[UIKeyboardFloatingTransitionController setLastGestureCenter:](self, "setLastGestureCenter:");

  -[UIKeyboardFloatingTransitionController setGestureBeginTime:](self, "setGestureBeginTime:", CACurrentMediaTime());
}

- (void)constrainAccessoryViewToBottom
{
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", &__block_literal_global_481);
}

void __72__UIKeyboardFloatingTransitionController_constrainAccessoryViewToBottom__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(a2, "containerRootController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputViewSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputAccessoryView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_msgSend(v2, "isInputAccessoryViewPlaceholder");

    if ((v5 & 1) == 0)
      objc_msgSend(v6, "setForceAccessoryViewToBottomOfHostView:", 1);
  }

}

- (void)restoreAccessoryViewConstraints
{
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", &__block_literal_global_203_2);
}

void __73__UIKeyboardFloatingTransitionController_restoreAccessoryViewConstraints__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "containerRootController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "forceAccessoryViewToBottomOfHostView"))
  {
    objc_msgSend(v2, "setForceAccessoryViewToBottomOfHostView:", 0);
    objc_msgSend(v2, "updateViewConstraints");
  }

}

- (void)finalizeTransition
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
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char isKindOfClass;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  void *v66;
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
  id v78;
  _QWORD v79[4];
  id v80;

  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIKeyboardFloatingTransitionController progress](self, "progress");
  if (v12 >= 0.5)
    -[UIKeyboardFloatingTransitionController endState](self, "endState");
  else
    -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "platterInsets");
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "superview");
  v78 = (id)objc_claimAutoreleasedReturnValue();

  if (-[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating")
    && (-[UIKeyboardFloatingTransitionController progress](self, "progress", v78), v22 < 0.5)
    || !-[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating", v78)
    && (-[UIKeyboardFloatingTransitionController progress](self, "progress"), v23 >= 0.5))
  {
    v24 = v5 + v17;
    v27 = v7 + v15;
    v28 = v11 - (v15 + v19);
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    v31 = v30;

    v25 = -(v31 - (v27 + v28));
    if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
      goto LABEL_23;
    v26 = 1;
  }
  else
  {
    v24 = *MEMORY[0x1E0C9D538];
    v25 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    if (!+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
      goto LABEL_18;
    v26 = 0;
  }
  +[UIKeyboardImpl setFloating:](UIKeyboardImpl, "setFloating:", v26);
  -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "inputViewSet");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "keyboard");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "inputViewSet");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isCustomInputView");

    if (!v38)
    {
      if ((v26 & 1) != 0)
        goto LABEL_23;
      goto LABEL_18;
    }
  }
  else
  {

  }
  -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "updateViewSizingConstraints");

  if ((v26 & 1) != 0)
    goto LABEL_23;
LABEL_18:
  -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "inputViewSet");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "assistantViewController");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v41, "assistantViewController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "shouldBeShownForInputDelegate:inputViews:", 0, v41))
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "responder");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "setInputAssistantButtonItemsForResponder:", v46);
    }

  }
LABEL_23:
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setUndockedWithOffset:animated:", 0, v24, v25);

  -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setAlpha:", 1.0);

  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "removeFromSuperview");

  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "inputView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "removeFromSuperview");

  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "inputView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "removeFromSuperview");

  -[UIKeyboardFloatingTransitionController setPlatterView:](self, "setPlatterView:", 0);
  -[UIKeyboardFloatingTransitionController setStartState:](self, "setStartState:", 0);
  -[UIKeyboardFloatingTransitionController setEndState:](self, "setEndState:", 0);
  -[UIKeyboardFloatingTransitionController setIsTransitioning:](self, "setIsTransitioning:", 0);
  -[UIKeyboardFloatingTransitionController updateLayoutGuideForTransitionStart:](self, "updateLayoutGuideForTransitionStart:", 0);
  -[UIKeyboardFloatingTransitionController updateLayoutGuideFromFrame:](self, "updateLayoutGuideFromFrame:", v5, v7, v9, v11);
  -[UIKeyboardFloatingTransitionController restoreAccessoryViewConstraints](self, "restoreAccessoryViewConstraints");
  -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "inputViewSet");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "keyboard");
  v57 = objc_claimAutoreleasedReturnValue();
  if (!v57)
  {

    goto LABEL_28;
  }
  v58 = (void *)v57;
  -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "inputViewSet");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "isCustomInputView");

  if ((v61 & 1) != 0)
  {
LABEL_28:
    -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
    v63 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "inputViewSet");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "inputView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setAlpha:", 1.0);

    goto LABEL_29;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "keyplaneView");
  v63 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v63, "keyplane");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "visualStyling") & 0xFF0000;

  if (v65 == 2490368)
    goto LABEL_30;
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __60__UIKeyboardFloatingTransitionController_finalizeTransition__block_invoke;
  v79[3] = &unk_1E16B1B28;
  v63 = v63;
  v80 = v63;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v79);
  v66 = v80;
LABEL_29:

LABEL_30:
  -[UIKeyboardFloatingTransitionController delegate](self, "delegate");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "didEndTransitionWithController:", self);

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "inputViewSet");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIInputViewAnimationStyle animationStyleDefault](UIInputViewAnimationStyle, "animationStyleDefault");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "prepareToMoveKeyboardForInputViewSet:animationStyle:", v71, v72);

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "containerRootController");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v74, "inputViewSet");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v71) = objc_msgSend(v75, "isInputViewPlaceholder");

  if ((_DWORD)v71)
  {
    objc_msgSend(v74, "inputViewSet");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "inputView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "refreshPlaceholder");

  }
}

void __60__UIKeyboardFloatingTransitionController_finalizeTransition__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "hideKeyCaps:", 0);
  v2 = *(void **)(a1 + 32);
  v4 = &unk_1E1A9A170;
  v5[0] = &unk_1E1A95E80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dimKeys:", v3);

}

- (void)updateAnimationAtScale:(double)a3
{
  double v4;
  void *v5;
  double v6;
  double v7;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  _BOOL8 v19;
  double v20;
  _BOOL4 v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  _BOOL4 v52;
  double *v53;
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
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  float v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  double v98;
  double v99;
  id v100;
  void *v101;
  id v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  double v110;
  double v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  double v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  double v125;
  void *v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  double v134;
  double v135;
  _QWORD *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  double v140;
  double v141;
  float64x2_t v142;
  float64x2_t v143;
  float64x2_t v144;
  float64x2_t v145;
  float64x2_t v146;
  float64x2_t v147;
  _QWORD v148[5];
  _QWORD v149[5];
  _QWORD v150[5];
  float64x2_t v151[3];
  float64x2_t v152;
  float64x2_t v153;
  float64x2_t v154;
  float64x2_t v155;
  float64x2_t v156;
  float64x2_t v157;
  float64x2_t v158[3];
  float64x2_t v159;
  float64x2_t v160;
  float64x2_t v161;
  float64x2_t v162;
  float64x2_t v163;
  float64x2_t v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  CGRect v173;

  v4 = a3 + -1.0;
  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v4 / (v6 + -1.0);

  LODWORD(v5) = -[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating");
  v8 = -[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating");
  v9 = -0.1;
  if ((_DWORD)v5)
    v9 = 0.0;
  v10 = 1.1;
  if (!v8)
    v10 = 1.0;
  v11 = fmax(v9, fmin(v7, v10));
  -[UIKeyboardFloatingTransitionController progress](self, "progress");
  if (-[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating"))
  {
    -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "center");
    v14 = v13;
    v16 = v15;

    -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v18 = v16 + CGRectGetHeight(v173) * 0.5;

    LODWORD(v17) = -[UIKeyboardFloatingTransitionController withinDockingRegion](self, "withinDockingRegion");
    -[UIKeyboardFloatingTransitionController setWithinDockingRegion:](self, "setWithinDockingRegion:", +[UIKeyboardFloatingTransitionController isPointWithinDockingRegion:](UIKeyboardFloatingTransitionController, "isPointWithinDockingRegion:", v14, v18));
    if ((_DWORD)v17 == -[UIKeyboardFloatingTransitionController withinDockingRegion](self, "withinDockingRegion"))
    {
      if (-[UIKeyboardFloatingTransitionController expandedForDocking](self, "expandedForDocking"))
        return;
    }
    else
    {
      v19 = -[UIKeyboardFloatingTransitionController withinDockingRegion](self, "withinDockingRegion");
      if (v19)
      {
        if (-[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating"))
          v20 = 0.66;
        else
          v20 = 0.34;
        v21 = -[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating");
        v22 = fmax(v20, v11);
        v23 = fmin(v20, v11);
        if (v21)
          v11 = v22;
        else
          v11 = v23;
      }
      -[UIKeyboardFloatingTransitionController setExpandedForDocking:](self, "setExpandedForDocking:", v19);
    }
  }
  -[UIKeyboardFloatingTransitionController setProgress:](self, "setProgress:", v11);
  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "scale");
  v26 = v25;
  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "scale");
  v29 = v28;
  -[UIKeyboardFloatingTransitionController progress](self, "progress");
  v31 = v29 * v30 + v26 * (1.0 - v30);

  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "scale");
  v34 = v33;
  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "scale");
  v37 = v36;
  -[UIKeyboardFloatingTransitionController progress](self, "progress");
  v39 = v37 * v38 + v34 * (1.0 - v38);

  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "platterViewFrame");
  v42 = v31 * v41;

  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "platterViewFrame");
  v45 = v39 * v44;

  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setBounds:", 0.0, 0.0, v42, v45);

  if (-[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating"))
    v47 = 1.0;
  else
    v47 = 0.0;
  if (-[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating"))
    v48 = 0.0;
  else
    v48 = 1.0;
  -[UIKeyboardFloatingTransitionController progress](self, "progress");
  v50 = v48 * v49 + v47 * (1.0 - v49);
  -[UIKeyboardFloatingTransitionController platterPopoverBackgroundView](self, "platterPopoverBackgroundView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setAlpha:", v50);

  v52 = -[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating");
  v53 = (double *)MEMORY[0x1E0C9D820];
  if (v52)
  {
    +[UIKeyboardPopoverContainer shadowOffset](UIKeyboardPopoverContainer, "shadowOffset");
    v55 = v54;
    v57 = v56;
  }
  else
  {
    v55 = *MEMORY[0x1E0C9D820];
    v57 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (-[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating"))
  {
    v59 = *v53;
    v58 = v53[1];
  }
  else
  {
    +[UIKeyboardPopoverContainer shadowOffset](UIKeyboardPopoverContainer, "shadowOffset");
    v59 = v60;
    v58 = v61;
  }
  -[UIKeyboardFloatingTransitionController progress](self, "progress");
  v63 = v59 * v62 + v55 * (1.0 - v62);
  v64 = v58 * v62 + v57 * (1.0 - v62);
  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "layer");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setShadowOffset:", v63, v64);

  v67 = 0.0;
  v68 = 0.0;
  if (-[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating"))
  {
    +[UIKeyboardPopoverContainer shadowOpacity](UIKeyboardPopoverContainer, "shadowOpacity");
    v68 = v69;
  }
  if (!-[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating"))
  {
    +[UIKeyboardPopoverContainer shadowOpacity](UIKeyboardPopoverContainer, "shadowOpacity");
    v67 = v70;
  }
  -[UIKeyboardFloatingTransitionController progress](self, "progress");
  v72 = v67 * v71 + v68 * (1.0 - v71);
  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "layer");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v75 = v72;
  objc_msgSend(v74, "setShadowOpacity:", v75);

  v76 = 0.0;
  v77 = 0.0;
  if (-[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating"))
  {
    +[UIKeyboardPopoverContainer shadowRadius](UIKeyboardPopoverContainer, "shadowRadius");
    v77 = v78;
  }
  if (!-[UIKeyboardFloatingTransitionController startedFromFloating](self, "startedFromFloating"))
  {
    +[UIKeyboardPopoverContainer shadowRadius](UIKeyboardPopoverContainer, "shadowRadius");
    v76 = v79;
  }
  -[UIKeyboardFloatingTransitionController progress](self, "progress");
  v81 = v76 * v80 + v77 * (1.0 - v80);
  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "layer");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setShadowRadius:", v81);

  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "cornerRadius");
  v86 = v85;
  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "cornerRadius");
  v89 = v88;
  -[UIKeyboardFloatingTransitionController progress](self, "progress");
  v91 = v89 * v90 + v86 * (1.0 - v90);
  -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "layer");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setCornerRadius:", v91);

  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "borderColor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "borderColor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardFloatingTransitionController progress](self, "progress");
  v99 = v98;
  v171 = 0.0;
  v172 = 0.0;
  v169 = 0.0;
  v170 = 0.0;
  v100 = v97;
  objc_msgSend(v95, "getRed:green:blue:alpha:", &v172, &v171, &v170, &v169);
  v167 = 0.0;
  v168 = 0.0;
  v165 = 0.0;
  v166 = 0.0;
  objc_msgSend(v100, "getRed:green:blue:alpha:", &v168, &v167, &v166, &v165);

  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", (1.0 - v99) * v172 + v99 * v168, (1.0 - v99) * v171 + v99 * v167, (1.0 - v99) * v170 + v99 * v166, (1.0 - v99) * v169 + v99 * v165);
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  v102 = objc_retainAutorelease(v101);
  v103 = objc_msgSend(v102, "CGColor");
  -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "layer");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setBorderColor:", v103);

  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "borderWidth");
  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "borderWidth");
  -[UIKeyboardFloatingTransitionController progress](self, "progress");
  -[UIKeyboardFloatingTransitionController platterVisualEffectView](self, "platterVisualEffectView");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v108;
  if (!v108)
  {
    -[UIKeyboardFloatingTransitionController lightEffectsTransitionBackdrop](self, "lightEffectsTransitionBackdrop");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
  }
  UIRoundToViewScale(v109);
  v111 = v110;
  -[UIKeyboardFloatingTransitionController platterCornerRadiusView](self, "platterCornerRadiusView");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "layer");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setBorderWidth:", v111);

  if (!v108)
  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v114;
  if (v114)
  {
    objc_msgSend(v114, "initialInputViewTransform");
  }
  else
  {
    v163 = 0u;
    v164 = 0u;
    v162 = 0u;
  }
  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = v116;
  if (v116)
  {
    objc_msgSend(v116, "finalInputViewTransform");
  }
  else
  {
    v160 = 0u;
    v161 = 0u;
    v159 = 0u;
  }
  -[UIKeyboardFloatingTransitionController progress](self, "progress");
  v144 = vaddq_f64(vmulq_n_f64(v163, 1.0 - v118), vmulq_n_f64(v160, v118));
  v146 = vaddq_f64(vmulq_n_f64(v162, 1.0 - v118), vmulq_n_f64(v159, v118));
  v142 = vaddq_f64(vmulq_n_f64(v164, 1.0 - v118), vmulq_n_f64(v161, v118));
  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "inputView");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v158[0] = v146;
  v158[1] = v144;
  v158[2] = v142;
  objc_msgSend(v120, "setTransform:", v158);

  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v121;
  if (v121)
  {
    objc_msgSend(v121, "initialInputViewTransform");
  }
  else
  {
    v156 = 0u;
    v157 = 0u;
    v155 = 0u;
  }
  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v123;
  if (v123)
  {
    objc_msgSend(v123, "finalInputViewTransform");
  }
  else
  {
    v153 = 0u;
    v154 = 0u;
    v152 = 0u;
  }
  -[UIKeyboardFloatingTransitionController progress](self, "progress");
  v145 = vaddq_f64(vmulq_n_f64(v156, 1.0 - v125), vmulq_n_f64(v153, v125));
  v147 = vaddq_f64(vmulq_n_f64(v155, 1.0 - v125), vmulq_n_f64(v152, v125));
  v143 = vaddq_f64(vmulq_n_f64(v157, 1.0 - v125), vmulq_n_f64(v154, v125));
  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "inputView");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v151[0] = v147;
  v151[1] = v145;
  v151[2] = v143;
  objc_msgSend(v127, "setTransform:", v151);

  -[UIKeyboardFloatingTransitionController startState](self, "startState");
  v128 = objc_claimAutoreleasedReturnValue();
  if (!v128)
    goto LABEL_63;
  v129 = (void *)v128;
  -[UIKeyboardFloatingTransitionController endState](self, "endState");
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v130)
    goto LABEL_63;
  -[UIKeyboardFloatingTransitionController pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v131, "state") != 1)
  {
    -[UIKeyboardFloatingTransitionController pinchGestureRecognizer](self, "pinchGestureRecognizer");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v132, "state") != 2)
    {
      -[UIKeyboardFloatingTransitionController panGestureRecognizer](self, "panGestureRecognizer");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v133, "state") != 1)
      {
        -[UIKeyboardFloatingTransitionController panGestureRecognizer](self, "panGestureRecognizer");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        v139 = objc_msgSend(v138, "state");

        if (v139 != 2)
        {
          -[UIKeyboardFloatingTransitionController progress](self, "progress");
          if (v140 >= 0.2)
          {
            -[UIKeyboardFloatingTransitionController progress](self, "progress");
            if (v141 <= 0.8)
              goto LABEL_63;
            v148[0] = MEMORY[0x1E0C809B0];
            v148[1] = 3221225472;
            v148[2] = __65__UIKeyboardFloatingTransitionController_updateAnimationAtScale___block_invoke_3;
            v148[3] = &unk_1E16B1B28;
            v148[4] = self;
            v135 = 0.25;
            v136 = v148;
          }
          else
          {
            v149[0] = MEMORY[0x1E0C809B0];
            v149[1] = 3221225472;
            v149[2] = __65__UIKeyboardFloatingTransitionController_updateAnimationAtScale___block_invoke_2;
            v149[3] = &unk_1E16B1B28;
            v149[4] = self;
            v135 = 0.25;
            v136 = v149;
          }
          goto LABEL_62;
        }
        goto LABEL_60;
      }

    }
  }

LABEL_60:
  -[UIKeyboardFloatingTransitionController progress](self, "progress");
  if (v134 > 0.1)
  {
    v150[0] = MEMORY[0x1E0C809B0];
    v150[1] = 3221225472;
    v150[2] = __65__UIKeyboardFloatingTransitionController_updateAnimationAtScale___block_invoke;
    v150[3] = &unk_1E16B1B28;
    v150[4] = self;
    v135 = 0.25;
    v136 = v150;
LABEL_62:
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v136, v135);
  }
LABEL_63:
  -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "frame");
  -[UIKeyboardFloatingTransitionController updateLayoutGuideFromFrame:](self, "updateLayoutGuideFromFrame:");

}

void __65__UIKeyboardFloatingTransitionController_updateAnimationAtScale___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "startState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "pillView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

}

void __65__UIKeyboardFloatingTransitionController_updateAnimationAtScale___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "startState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 1.0;
  objc_msgSend(v3, "setAlpha:", 1.0);

  if (!objc_msgSend(*(id *)(a1 + 32), "startedFromFloating"))
    v4 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "pillView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

}

void __65__UIKeyboardFloatingTransitionController_updateAnimationAtScale___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "endState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 1.0;
  objc_msgSend(v3, "setAlpha:", 1.0);

  if (objc_msgSend(*(id *)(a1 + 32), "startedFromFloating"))
    v4 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "pillView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

}

- (void)updateLayoutGuideForTransitionStart:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__UIKeyboardFloatingTransitionController_updateLayoutGuideForTransitionStart___block_invoke;
  v6[3] = &unk_1E16D74F0;
  v7 = a3;
  v6[4] = self;
  +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v6);
  if (!a3)
  {
    -[UIKeyboardFloatingTransitionController activeKeyboardLayoutGuideTransitionAssertions](self, "activeKeyboardLayoutGuideTransitionAssertions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

  }
}

void __78__UIKeyboardFloatingTransitionController_updateLayoutGuideForTransitionStart___block_invoke(uint64_t a1, void *a2)
{
  _BOOL4 v3;
  __objc2_class **v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "isTrackingKeyboard"))
  {
    v3 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
    v4 = off_1E167A9C0;
    if (*(_BYTE *)(a1 + 40))
      v5 = 1;
    else
      v5 = v3;
    if (!v5)
      v4 = off_1E167A9F0;
    -[__objc2_class placement](*v4, "placement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateGuideForKeyboardPlacement:", v6);

    objc_msgSend(*(id *)(a1 + 32), "setKeyboardLayoutGuideInTransition:forWindow:", *(unsigned __int8 *)(a1 + 40), v8);
    objc_msgSend(v8, "_primaryKeyboardTrackingGuide");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enableAnimations:", *(_BYTE *)(a1 + 40) == 0);

  }
}

- (void)updateLayoutGuideFromFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _QWORD v8[9];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(*MEMORY[0x1E0C9D648], a3))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__UIKeyboardFloatingTransitionController_updateLayoutGuideFromFrame___block_invoke;
    v8[3] = &unk_1E16E07E8;
    *(CGFloat *)&v8[5] = x;
    *(CGFloat *)&v8[6] = y;
    *(CGFloat *)&v8[7] = width;
    *(CGFloat *)&v8[8] = height;
    v8[4] = self;
    +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v8);
  }
}

void __69__UIKeyboardFloatingTransitionController_updateLayoutGuideFromFrame___block_invoke(uint64_t a1, void *a2)
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
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v25;
  double MaxY;
  double v27;
  void *v28;
  void *v29;
  id v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v30 = a2;
  if (objc_msgSend(v30, "isTrackingKeyboard"))
  {
    objc_msgSend(v30, "frame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 32), "inputWindowController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "convertRect:fromWindow:", v12, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    v31.origin.x = v4;
    v31.origin.y = v6;
    v31.size.width = v8;
    v31.size.height = v10;
    v37.origin.x = v14;
    v37.origin.y = v16;
    v37.size.width = v18;
    v37.size.height = v20;
    v32 = CGRectIntersection(v31, v37);
    x = v32.origin.x;
    y = v32.origin.y;
    width = v32.size.width;
    height = v32.size.height;
    if (CGRectIsNull(v32))
    {
      v33.origin.x = v4;
      v33.origin.y = v6;
      v33.size.width = v8;
      v33.size.height = v10;
      y = CGRectGetMaxY(v33);
      objc_msgSend(v30, "insetForDismissedKeyboardGuide");
      height = v25;
      x = 0.0;
      width = v8;
    }
    v34.origin.x = v4;
    v34.origin.y = v6;
    v34.size.width = v8;
    v34.size.height = v10;
    MaxY = CGRectGetMaxY(v34);
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    v27 = MaxY - CGRectGetMaxY(v35);
    objc_msgSend(v30, "_primaryKeyboardTrackingGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    objc_msgSend(v28, "changeOffsetConstants:", CGRectGetMinX(v36), v27);

    objc_msgSend(v30, "_primaryKeyboardTrackingGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "changeSizingConstants:", width, height);

  }
}

- (NSMapTable)activeKeyboardLayoutGuideTransitionAssertions
{
  NSMapTable *activeKeyboardLayoutGuideTransitionAssertions;
  NSMapTable *v4;
  NSMapTable *v5;

  activeKeyboardLayoutGuideTransitionAssertions = self->_activeKeyboardLayoutGuideTransitionAssertions;
  if (!activeKeyboardLayoutGuideTransitionAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_activeKeyboardLayoutGuideTransitionAssertions;
    self->_activeKeyboardLayoutGuideTransitionAssertions = v4;

    activeKeyboardLayoutGuideTransitionAssertions = self->_activeKeyboardLayoutGuideTransitionAssertions;
  }
  return activeKeyboardLayoutGuideTransitionAssertions;
}

- (void)setKeyboardLayoutGuideInTransition:(BOOL)a3 forWindow:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  -[UIKeyboardFloatingTransitionController activeKeyboardLayoutGuideTransitionAssertions](self, "activeKeyboardLayoutGuideTransitionAssertions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!v7)
    {
      objc_msgSend(v10, "_obtainKeyboardLayoutGuideTransitionAssertionForReason:", CFSTR("Floating keyboard transition"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[UIKeyboardFloatingTransitionController activeKeyboardLayoutGuideTransitionAssertions](self, "activeKeyboardLayoutGuideTransitionAssertions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v8, v10);

      }
      goto LABEL_7;
    }
  }
  else if (v7)
  {
    objc_msgSend(v7, "_invalidate");
    -[UIKeyboardFloatingTransitionController activeKeyboardLayoutGuideTransitionAssertions](self, "activeKeyboardLayoutGuideTransitionAssertions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v10);
LABEL_7:

  }
}

- (void)inputViewSnapshot:(id *)a3 withPlatterInsets:(UIEdgeInsets *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
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
  double Height;
  double Width;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  CGFloat rect;
  double rect_8;
  double rect_16;
  double rect_24;
  id v66;
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputViewSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyboard");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_4;
  v10 = (void *)v9;
  -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputViewSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isCustomInputView") & 1) != 0)
  {

LABEL_4:
LABEL_5:
    -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "inputViewSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inputView");
    v66 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v66, "snapshotViewAfterScreenUpdates:", 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v15 = v66;
    goto LABEL_7;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "isUsingDictationLayout");

  if ((v56 & 1) != 0)
    goto LABEL_5;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "keyplaneView");
  v68 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v68, "keyplane");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "visualStyling") & 0xFF0000;

  if (v59 != 2490368)
  {
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __78__UIKeyboardFloatingTransitionController_inputViewSnapshot_withPlatterInsets___block_invoke;
    v69[3] = &unk_1E16B1B28;
    v70 = v68;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v69);

  }
  +[UIKeyboardFloatingTransitionController snapshotOfKeyplaneView:](UIKeyboardFloatingTransitionController, "snapshotOfKeyplaneView:", v68);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  v15 = v68;
  if (!v68)
  {
    -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "inputViewSet");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "inputView");
    v66 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
LABEL_7:
  v67 = v15;
  objc_msgSend(v15, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_window");
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v67, "bounds");
  objc_msgSend(v18, "convertRect:fromView:", v67);
  objc_msgSend(*a3, "setFrame:");
  objc_msgSend(*a3, "setUserInteractionEnabled:", 0);
  v20 = *a3;
  objc_msgSend(v18, "screen");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "scale");
  objc_msgSend(v20, "setContentScaleFactor:");

  -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hosting");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "itemForPurpose:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hostView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "frame");
  v27 = v26;
  rect = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  objc_msgSend(v67, "bounds");
  objc_msgSend(v25, "convertRect:fromView:", v67);
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v71.origin.x = v27;
  v71.origin.y = v29;
  v71.size.width = v31;
  v71.size.height = v33;
  Height = CGRectGetHeight(v71);
  v72.origin.x = v35;
  v72.origin.y = v37;
  v72.size.width = v39;
  v72.size.height = v41;
  rect_24 = Height - CGRectGetMaxY(v72);
  v73.origin.x = v35;
  v73.origin.y = v37;
  v73.size.width = v39;
  v73.size.height = v41;
  rect_8 = CGRectGetMinY(v73);
  v74.origin.x = v35;
  v74.origin.y = v37;
  v74.size.width = v39;
  v74.size.height = v41;
  rect_16 = CGRectGetMinX(v74);
  v75.origin.x = rect;
  v75.origin.y = v29;
  v75.size.width = v31;
  v75.size.height = v33;
  Width = CGRectGetWidth(v75);
  v76.origin.x = v35;
  v76.origin.y = v37;
  v76.size.width = v39;
  v76.size.height = v41;
  v44 = Width - CGRectGetMaxX(v76);
  if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    +[UIKeyboardPopoverContainer contentInsets](UIKeyboardPopoverContainer, "contentInsets");
    v46 = rect_8 + v45;
    v48 = rect_16 + v47;
    v50 = rect_24 + v49;
    v44 = v44 + v51;
  }
  else
  {
    -[UIKeyboardFloatingTransitionController inputWindowController](self, "inputWindowController");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "inputViewSet");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "inputAccessoryView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v54, "frame");
    v46 = rect_8 - CGRectGetHeight(v77);

    v48 = rect_16;
    v50 = rect_24;
  }
  a4->top = v46;
  a4->left = v48;
  a4->bottom = v50;
  a4->right = v44;

}

void __78__UIKeyboardFloatingTransitionController_inputViewSnapshot_withPlatterInsets___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "hideKeyCaps:", 1);
  v2 = *(void **)(a1 + 32);
  v4 = &unk_1E1A9A170;
  v5[0] = &unk_1E1A95E90;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dimKeys:", v3);

}

- (void)captureStateForStart:(BOOL)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
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
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  id v50;
  __int128 v51;
  __int128 v52;

  v51 = 0u;
  v52 = 0u;
  v50 = 0;
  -[UIKeyboardFloatingTransitionController inputViewSnapshot:withPlatterInsets:](self, "inputViewSnapshot:withPlatterInsets:", &v50, &v51);
  v5 = v50;
  +[UIColor clearColor](UIColor, "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    +[UIKeyboardPopoverContainer cornerRadius](UIKeyboardPopoverContainer, "cornerRadius");
    v48 = v7;
    +[UIKeyboardPopoverContainer borderWidth](UIKeyboardPopoverContainer, "borderWidth");
    v49 = v8;
    +[UIKeyboardPopoverContainer borderColor](UIKeyboardPopoverContainer, "borderColor");
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  else
  {
    v48 = 0.0;
    v49 = 0.0;
  }
  objc_msgSend(v5, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v5, "frame");
  v21 = v20 - (-*((double *)&v52 + 1) - *((double *)&v51 + 1));
  v23 = v22 - (-*(double *)&v52 - *(double *)&v51);
  if (a3)
  {
    v24 = v18 - *((double *)&v51 + 1);
    v25 = v19 - *(double *)&v51;
    -[UIKeyboardFloatingTransitionController startState](self, "startState");
  }
  else
  {
    -[UIKeyboardFloatingTransitionController startState](self, "startState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "platterViewFrame");
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;

    v35 = v21 - v32;
    v36 = v23 - v34;
    -[UIKeyboardFloatingTransitionController platterView](self, "platterView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "anchorPoint");
    v40 = v39;
    v42 = v41;

    v43 = v36 * v42;
    v44 = v35 * v40;
    v45 = -(v36 * (1.0 - v42));
    v46 = -(v35 * (1.0 - v40));
    v24 = v28 - v35 * v40;
    v25 = v30 - v36 * v42;
    v21 = v32 - (v46 - v44);
    v23 = v34 - (v45 - v43);
    v11 = v24 + *((double *)&v51 + 1);
    v13 = v25 + *(double *)&v51;
    v15 = v21 - (*((double *)&v51 + 1) + *((double *)&v52 + 1));
    v17 = v23 - (*(double *)&v51 + *(double *)&v52);
    objc_msgSend(v5, "setFrame:", v24 + *((double *)&v51 + 1), v25 + *(double *)&v51, v15, v17);
    -[UIKeyboardFloatingTransitionController endState](self, "endState");
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setInputView:", v5);
  objc_msgSend(v47, "setInputViewFrame:", v11, v13, v15, v17);
  objc_msgSend(v47, "setPlatterViewFrame:", v24, v25, v21, v23);
  objc_msgSend(v47, "setPlatterInsets:", v51, v52);
  objc_msgSend(v47, "setCornerRadius:", v48);
  objc_msgSend(v47, "setBorderWidth:", v49);
  objc_msgSend(v47, "setBorderColor:", v6);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _BOOL4 v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  void *v14;

  v4 = a3;
  if (+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"))
    goto LABEL_10;
  if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating")
    && !+[UIKeyboardImpl isFloatingForced](UIKeyboardImpl, "isFloatingForced"))
  {
    objc_msgSend(v4, "scale");
    v5 = v7 >= 1.0;
  }
  else if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "scale");
    v5 = v6 < 1.0;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "usesCandidateSelection");

  if (!v9)
  {
    if (!v5)
      goto LABEL_10;
LABEL_12:
    -[UIKeyboardFloatingTransitionController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v14, "shouldBeginTransitionForController:", self);

    goto LABEL_13;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "candidateList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v5 & (objc_msgSend(v11, "isExtendedList") ^ 1);

  if ((v12 & 1) != 0)
    goto LABEL_12;
LABEL_10:
  v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (void)setIsTransitioning:(BOOL)a3
{
  self->_isTransitioning = a3;
}

- (UIKeyboardFloatingTransitionControllerDelegate)delegate
{
  return (UIKeyboardFloatingTransitionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIKeyboardFloatingPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (void)setPinchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, a3);
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, a3);
}

- (UIInputWindowController)inputWindowController
{
  return (UIInputWindowController *)objc_loadWeakRetained((id *)&self->_inputWindowController);
}

- (void)setInputWindowController:(id)a3
{
  objc_storeWeak((id *)&self->_inputWindowController, a3);
}

- (UIKeyboardFloatingTransitionState)startState
{
  return self->_startState;
}

- (void)setStartState:(id)a3
{
  objc_storeStrong((id *)&self->_startState, a3);
}

- (UIKeyboardFloatingTransitionState)endState
{
  return self->_endState;
}

- (void)setEndState:(id)a3
{
  objc_storeStrong((id *)&self->_endState, a3);
}

- (BOOL)startedFromFloating
{
  return self->_startedFromFloating;
}

- (void)setStartedFromFloating:(BOOL)a3
{
  self->_startedFromFloating = a3;
}

- (NSArray)commonVisibleKeys
{
  return self->_commonVisibleKeys;
}

- (void)setCommonVisibleKeys:(id)a3
{
  objc_storeStrong((id *)&self->_commonVisibleKeys, a3);
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (UIView)platterCornerRadiusView
{
  return self->_platterCornerRadiusView;
}

- (void)setPlatterCornerRadiusView:(id)a3
{
  objc_storeStrong((id *)&self->_platterCornerRadiusView, a3);
}

- (_UIPopoverStandardChromeView)platterPopoverBackgroundView
{
  return self->_platterPopoverBackgroundView;
}

- (void)setPlatterPopoverBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_platterPopoverBackgroundView, a3);
}

- (UIKBVisualEffectView)platterVisualEffectView
{
  return self->_platterVisualEffectView;
}

- (void)setPlatterVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_platterVisualEffectView, a3);
}

- (_UIKBLightEffectsBackground)lightEffectsTransitionBackdrop
{
  return self->_lightEffectsTransitionBackdrop;
}

- (void)setLightEffectsTransitionBackdrop:(id)a3
{
  objc_storeStrong((id *)&self->_lightEffectsTransitionBackdrop, a3);
}

- (UIView)pillView
{
  return self->_pillView;
}

- (void)setPillView:(id)a3
{
  objc_storeStrong((id *)&self->_pillView, a3);
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)gestureBeginTime
{
  return self->_gestureBeginTime;
}

- (void)setGestureBeginTime:(double)a3
{
  self->_gestureBeginTime = a3;
}

- (CGPoint)lastGestureCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastGestureCenter.x;
  y = self->_lastGestureCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastGestureCenter:(CGPoint)a3
{
  self->_lastGestureCenter = a3;
}

- (BOOL)withinDockingRegion
{
  return self->_withinDockingRegion;
}

- (void)setWithinDockingRegion:(BOOL)a3
{
  self->_withinDockingRegion = a3;
}

- (BOOL)expandedForDocking
{
  return self->_expandedForDocking;
}

- (void)setExpandedForDocking:(BOOL)a3
{
  self->_expandedForDocking = a3;
}

- (UIViewSpringAnimationBehavior)animationBehavior
{
  return (UIViewSpringAnimationBehavior *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAnimationBehavior:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void)setActiveKeyboardLayoutGuideTransitionAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_activeKeyboardLayoutGuideTransitionAssertions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeKeyboardLayoutGuideTransitionAssertions, 0);
  objc_storeStrong((id *)&self->_animationBehavior, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_lightEffectsTransitionBackdrop, 0);
  objc_storeStrong((id *)&self->_platterVisualEffectView, 0);
  objc_storeStrong((id *)&self->_platterPopoverBackgroundView, 0);
  objc_storeStrong((id *)&self->_platterCornerRadiusView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_commonVisibleKeys, 0);
  objc_storeStrong((id *)&self->_endState, 0);
  objc_storeStrong((id *)&self->_startState, 0);
  objc_destroyWeak((id *)&self->_inputWindowController);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
