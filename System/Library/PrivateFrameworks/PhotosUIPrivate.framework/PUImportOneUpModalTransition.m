@implementation PUImportOneUpModalTransition

- (PUImportOneUpModalTransition)initWithOperation:(int64_t)a3 transitionContext:(id)a4 pinchGestureRecognizer:(id)a5 panGestureRecognizer:(id)a6 startsInteractive:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  PUImportOneUpModalTransition *v15;
  PUImportOneUpModalTransition *v16;
  uint64_t v17;
  objc_super v19;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PUImportOneUpModalTransition;
  v15 = -[PUImportOneUpModalTransition init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_operation = a3;
    objc_storeStrong((id *)&v15->_context, a4);
    objc_storeStrong((id *)&v16->_pinchGestureRecognizer, a5);
    -[PUPhotoPinchGestureRecognizer addTarget:action:](v16->_pinchGestureRecognizer, "addTarget:action:", v16, sel_updateTransitionWithPinchGestureRecognizer_);
    objc_storeStrong((id *)&v16->_panGestureRecognizer, a6);
    -[UIPanGestureRecognizer addTarget:action:](v16->_panGestureRecognizer, "addTarget:action:", v16, sel_updateTransitionWithPanGestureRecognizer_);
    if (-[PUImportOneUpModalTransition continuousGestureRecognizerIsActive:](v16, "continuousGestureRecognizerIsActive:", v16->_pinchGestureRecognizer))
    {
      v17 = 1;
    }
    else
    {
      if (!-[PUImportOneUpModalTransition continuousGestureRecognizerIsActive:](v16, "continuousGestureRecognizerIsActive:", v16->_panGestureRecognizer))
      {
        v16->_activeGesture = 0;
        goto LABEL_8;
      }
      v17 = 2;
    }
    v16->_activeGesture = v17;
  }
LABEL_8:

  return v16;
}

- (void)startTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id location;
  _QWORD v37[4];
  id v38;
  double v39;
  double v40;
  double v41;

  -[PUImportOneUpModalTransition context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImportOneUpModalTransition context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImportOneUpModalTransition context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  objc_opt_class();
  v10 = (uint64_t)v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "topViewController");
    v10 = objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend((id)objc_opt_class(), "transitioningObjectInViewController:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)v10;
  objc_msgSend((id)objc_opt_class(), "transitioningObjectInViewController:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpModalTransition context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "finalFrameForViewController:", v9);
  objc_msgSend(v14, "setFrame:");

  objc_msgSend(v4, "addSubview:", v13);
  objc_msgSend(v4, "addSubview:", v14);
  v30 = v13;
  if (-[PUImportOneUpModalTransition operation](self, "operation"))
  {
    v16 = v13;
    objc_msgSend(v16, "setAlpha:", 1.0);
    v17 = 0.0;
  }
  else
  {
    v16 = v14;
    objc_msgSend(v16, "setAlpha:", 0.0);
    v17 = 1.0;
  }
  objc_msgSend(v4, "bringSubviewToFront:", v16);
  objc_msgSend(v16, "layoutIfNeeded");
  -[PUImportOneUpModalTransition prepareFloatingItemsForAnimation](self, "prepareFloatingItemsForAnimation");
  -[PUImportOneUpModalTransition floatingItems](self, "floatingItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v11;
  objc_msgSend(v11, "willTransitionFromViewController:toViewController:withTransitionItems:", v6, v9, v18);

  -[PUImportOneUpModalTransition floatingItems](self, "floatingItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v12;
  objc_msgSend(v12, "willTransitionFromViewController:toViewController:withTransitionItems:", v6, v9, v19);

  objc_msgSend((id)objc_opt_class(), "defaultAnimationDurationForOperation:", -[PUImportOneUpModalTransition operation](self, "operation"));
  v21 = v20;
  v22 = dbl_1AB0EF2F0[-[PUImportOneUpModalTransition operation](self, "operation") == 0] / v20;
  v23 = objc_alloc(MEMORY[0x1E0DC3F38]);
  v24 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __47__PUImportOneUpModalTransition_startTransition__block_invoke;
  v37[3] = &unk_1E58AA1F8;
  v39 = v21;
  v40 = v22;
  v25 = v16;
  v38 = v25;
  v41 = v17;
  v26 = (void *)objc_msgSend(v23, "initWithDuration:curve:animations:", 2, v37, v21);
  objc_initWeak(&location, self);
  v34[0] = v24;
  v34[1] = 3221225472;
  v34[2] = __47__PUImportOneUpModalTransition_startTransition__block_invoke_4;
  v34[3] = &unk_1E58AB320;
  objc_copyWeak(&v35, &location);
  objc_msgSend(v26, "addCompletion:", v34);
  objc_storeStrong((id *)&self->_transitionAnimator, v26);
  -[PUImportOneUpModalTransition context](self, "context");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isInteractive");

  if ((v28 & 1) != 0)
  {
    -[PUImportOneUpModalTransition setStartingAnimationProgress:](self, "setStartingAnimationProgress:", 0.0);
    -[PUImportOneUpModalTransition configureFloatingItemForInteractiveTracking](self, "configureFloatingItemForInteractiveTracking");
    -[PUImportOneUpModalTransition pinchGestureRecognizer](self, "pinchGestureRecognizer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpModalTransition updateTransitionWithPinchGestureRecognizer:](self, "updateTransitionWithPinchGestureRecognizer:", v29);

  }
  else
  {
    -[PUImportOneUpModalTransition animateToPosition:](self, "animateToPosition:", 0);
  }
  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

- (void)handleTransitionComplete:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[PUImportOneUpModalTransition context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImportOneUpModalTransition context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  objc_opt_class();
  v9 = (uint64_t)v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "topViewController");
    v9 = objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend((id)objc_opt_class(), "transitioningObjectInViewController:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)v9;
  objc_msgSend((id)objc_opt_class(), "transitioningObjectInViewController:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpModalTransition floatingItems](self, "floatingItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v10;
  objc_msgSend(v10, "didTransitionFromViewController:toViewController:withTransitionItems:", v5, v8, v14);

  -[PUImportOneUpModalTransition floatingItems](self, "floatingItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v11;
  objc_msgSend(v11, "didTransitionFromViewController:toViewController:withTransitionItems:", v5, v8, v15);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[PUImportOneUpModalTransition floatingItems](self, "floatingItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "transitionView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeFromSuperview");

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v18);
  }

  -[PUImportOneUpModalTransition setFloatingItems:](self, "setFloatingItems:", 0);
  if (a3)
    v22 = v13;
  else
    v22 = v12;
  objc_msgSend(v22, "removeFromSuperview");
  -[PUImportOneUpModalTransition context](self, "context");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "completeTransition:", a3 == 0);

}

- (void)prepareFloatingItemsForAnimation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  double x;
  double y;
  double width;
  double height;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  PUImportOneUpModalTransition *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v48 = *MEMORY[0x1E0C80C00];
  -[PUImportOneUpModalTransition context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImportOneUpModalTransition context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v6 = objc_claimAutoreleasedReturnValue();

  -[PUImportOneUpModalTransition context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  objc_opt_class();
  v10 = (uint64_t)v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "topViewController");
    v10 = objc_claimAutoreleasedReturnValue();

  }
  v42 = (void *)v6;
  objc_msgSend((id)objc_opt_class(), "transitioningObjectInViewController:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)v10;
  objc_msgSend((id)objc_opt_class(), "transitioningObjectInViewController:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v9;
  objc_msgSend(v9, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = self;
  -[PUImportOneUpModalTransition context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v11;
  objc_msgSend(v11, "transitionItemsForContext:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v44 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v12, "targetFrameForTransitionItem:", v22);
        x = v49.origin.x;
        y = v49.origin.y;
        width = v49.size.width;
        height = v49.size.height;
        if (!CGRectIsNull(v49))
        {
          v50.origin.x = x;
          v50.origin.y = y;
          v50.size.width = width;
          v50.size.height = height;
          if (!CGRectIsEmpty(v50))
          {
            v51.origin.x = x;
            v51.origin.y = y;
            v51.size.width = width;
            v51.size.height = height;
            if (!CGRectIsInfinite(v51))
            {
              objc_msgSend(v13, "convertRect:fromView:", 0, x, y, width, height);
              objc_msgSend(v22, "setTargetFrame:");
              objc_msgSend(v22, "initialFrame");
              objc_msgSend(v4, "convertRect:fromView:", 0);
              v28 = v27;
              v30 = v29;
              v32 = v31;
              v34 = v33;
              objc_msgSend(v22, "transitionView");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "setFrame:", v28, v30, v32, v34);

              objc_msgSend(v22, "transitionView");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "layoutIfNeeded");

              objc_msgSend(v16, "addObject:", v22);
              objc_msgSend(v22, "transitionView");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addSubview:", v37);

              objc_msgSend(v12, "prepareTransitionItemViewForDestination:", v22);
            }
          }
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v19);
  }

  -[PUImportOneUpModalTransition setFloatingItems:](v41, "setFloatingItems:", v16);
}

- (void)animateToPosition:(int64_t)a3
{
  BOOL v5;
  void *v6;
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
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  BOOL v41;

  v5 = a3 == 0;
  if (-[PUImportOneUpModalTransition activeGesture](self, "activeGesture") == 1)
  {
    -[PUImportOneUpModalTransition pinchTracker](self, "pinchTracker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "velocity");
LABEL_5:
    v11 = v7;
    v12 = v8;
    v13 = v9;
    v14 = v10;

    goto LABEL_7;
  }
  if (-[PUImportOneUpModalTransition activeGesture](self, "activeGesture") == 2)
  {
    -[PUImportOneUpModalTransition swipeDownTracker](self, "swipeDownTracker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trackedVelocity");
    goto LABEL_5;
  }
  v11 = *MEMORY[0x1E0D7C368];
  v12 = *(double *)(MEMORY[0x1E0D7C368] + 8);
  v13 = *(double *)(MEMORY[0x1E0D7C368] + 16);
  v14 = *(double *)(MEMORY[0x1E0D7C368] + 24);
LABEL_7:
  -[PUImportOneUpModalTransition unitVelocityForDisplayVelocity:](self, "unitVelocityForDisplayVelocity:", v11, v12, v13, v14);
  objc_msgSend((id)objc_opt_class(), "propertyAnimatorWithInitialVelocity:forOperation:inDirection:", -[PUImportOneUpModalTransition operation](self, "operation"), a3, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __50__PUImportOneUpModalTransition_animateToPosition___block_invoke;
  v40[3] = &unk_1E58AAD68;
  v40[4] = self;
  v41 = v5;
  objc_msgSend(v17, "addAnimations:", v40);
  -[PUImportOneUpModalTransition setFloatingItemsAnimator:](self, "setFloatingItemsAnimator:", v17);
  -[PUImportOneUpModalTransition floatingItemsAnimator](self, "floatingItemsAnimator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "startAnimation");

  -[PUImportOneUpModalTransition transitionAnimator](self, "transitionAnimator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setReversed:", a3 != 0);

  -[PUImportOneUpModalTransition transitionAnimator](self, "transitionAnimator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "state");

  if (v21)
  {
    if (-[PUImportOneUpModalTransition activeGesture](self, "activeGesture") == 1)
    {
      -[PUImportOneUpModalTransition manipulatedFloatingItem](self, "manipulatedFloatingItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUImportOneUpModalTransition pinchTracker](self, "pinchTracker");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "size");
      -[PUImportOneUpModalTransition currentProgressForFloatingItem:atSize:inDirection:](self, "currentProgressForFloatingItem:atSize:inDirection:", v22, 0);
      v25 = v24;

      v26 = 1.0;
      if (v25 < 0.0 || v25 > 1.0)
        goto LABEL_16;
      -[PUImportOneUpModalTransition transitionAnimator](self, "transitionAnimator");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "fractionComplete");
      v29 = v28;

      v30 = 1.0 - v29;
    }
    else
    {
      v26 = 0.0;
      if (-[PUImportOneUpModalTransition activeGesture](self, "activeGesture") != 2)
      {
LABEL_16:
        -[PUImportOneUpModalTransition transitionAnimator](self, "transitionAnimator");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUImportOneUpModalTransition floatingItemsAnimator](self, "floatingItemsAnimator");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "timingParameters");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "continueAnimationWithTimingParameters:durationFactor:", v39, v26);

        goto LABEL_17;
      }
      -[PUImportOneUpModalTransition manipulatedFloatingItem](self, "manipulatedFloatingItem");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUImportOneUpModalTransition swipeDownTracker](self, "swipeDownTracker");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "trackedBounds");
      -[PUImportOneUpModalTransition currentProgressForFloatingItem:atSize:inDirection:](self, "currentProgressForFloatingItem:atSize:inDirection:", v32, a3, v34, v35);
      v37 = v36;

      v30 = 1.0 - v37;
    }
    v26 = fmax(v30, 0.0);
    goto LABEL_16;
  }
  -[PUImportOneUpModalTransition transitionAnimator](self, "transitionAnimator");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "startAnimation");
LABEL_17:

  -[PUImportOneUpModalTransition setActiveGesture:](self, "setActiveGesture:", 0);
}

- (void)configureFloatingItemForInteractiveTracking
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  PXPinchTracker *pinchTracker;
  PXSwipeDownTracker *swipeDownTracker;
  void *v23;
  void *v24;
  void *v25;
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
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double MidX;
  CGFloat v45;
  id v46;
  void *v47;
  id v48;
  PXSwipeDownTracker *v49;
  PXSwipeDownTracker *v50;
  PXSwipeDownTracker *v51;
  PXPinchTracker *v52;
  PXPinchTracker *v53;
  _OWORD v54[3];
  _OWORD v55[3];
  _QWORD v56[4];
  id v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  double v62;
  double v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;
  CGRect v70;
  CGRect v71;

  v69 = *MEMORY[0x1E0C80C00];
  -[PUImportOneUpModalTransition context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PUImportOneUpModalTransition activeGesture](self, "activeGesture") == 1)
  {
    -[PUImportOneUpModalTransition pinchGestureRecognizer](self, "pinchGestureRecognizer");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if (-[PUImportOneUpModalTransition activeGesture](self, "activeGesture") == 2)
  {
    -[PUImportOneUpModalTransition panGestureRecognizer](self, "panGestureRecognizer");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:
  objc_msgSend(v6, "locationInView:", v4);
  v8 = v7;
  v10 = v9;
  objc_msgSend(v4, "hitTest:withEvent:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    -[PUImportOneUpModalTransition floatingItems](self, "floatingItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v65;
LABEL_10:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v65 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v16);
        objc_msgSend(v17, "transitionView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18 == v11)
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
          if (v14)
            goto LABEL_10;
          goto LABEL_16;
        }
      }
      v19 = v17;

      if (v19)
        goto LABEL_19;
    }
    else
    {
LABEL_16:

    }
  }
  -[PUImportOneUpModalTransition floatingItems](self, "floatingItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v19 = (id)objc_claimAutoreleasedReturnValue();

LABEL_19:
  -[PUImportOneUpModalTransition setManipulatedFloatingItem:](self, "setManipulatedFloatingItem:", v19);
  pinchTracker = self->_pinchTracker;
  self->_pinchTracker = 0;

  swipeDownTracker = self->_swipeDownTracker;
  self->_swipeDownTracker = 0;

  -[PUImportOneUpModalTransition manipulatedFloatingItem](self, "manipulatedFloatingItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[PUImportOneUpModalTransition manipulatedFloatingItem](self, "manipulatedFloatingItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "transitionView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "center");
    v27 = v26;
    v29 = v28;
    objc_msgSend(v25, "bounds");
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    if (-[PUImportOneUpModalTransition activeGesture](self, "activeGesture") == 1)
    {
      if (!-[PUImportOneUpModalTransition operation](self, "operation"))
      {
        v38 = (void *)objc_opt_class();
        -[PUImportOneUpModalTransition manipulatedFloatingItem](self, "manipulatedFloatingItem");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "targetFrame");
        objc_msgSend(v38, "scaledSizeForTargetSize:aspectFillingIntoSize:", v40, v41, v35, v37);
        v35 = v42;
        v37 = v43;

        objc_msgSend(v25, "bounds");
        MidX = CGRectGetMidX(v70);
        objc_msgSend(v25, "bounds");
        v45 = CGRectGetMidY(v71) - v37 * 0.5;
        v46 = objc_alloc(MEMORY[0x1E0DC3F38]);
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __75__PUImportOneUpModalTransition_configureFloatingItemForInteractiveTracking__block_invoke;
        v56[3] = &unk_1E58A6FE0;
        v57 = v25;
        v58 = MidX - v35 * 0.5;
        v59 = v45;
        v60 = v35;
        v61 = v37;
        v62 = v27;
        v63 = v29;
        v47 = (void *)objc_msgSend(v46, "initWithDuration:curve:animations:", 2, v56, 0.2);
        objc_msgSend(v47, "startAnimation");

      }
      v48 = objc_alloc(MEMORY[0x1E0D7B830]);
      if (v25)
        objc_msgSend(v25, "transform");
      else
        memset(v55, 0, sizeof(v55));
      v52 = (PXPinchTracker *)objc_msgSend(v48, "initWithCenter:size:transform:", v55, v27, v29, v35, v37);
      v53 = self->_pinchTracker;
      self->_pinchTracker = v52;

    }
    else if (-[PUImportOneUpModalTransition activeGesture](self, "activeGesture") == 2)
    {
      v49 = (PXSwipeDownTracker *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7BAB0]), "initWithOptions:", 0);
      v50 = self->_swipeDownTracker;
      self->_swipeDownTracker = v49;

      v51 = self->_swipeDownTracker;
      if (v25)
        objc_msgSend(v25, "transform");
      else
        memset(v54, 0, sizeof(v54));
      -[PXSwipeDownTracker startTrackingCenter:bounds:transform:withInitialGestureLocation:velocity:](v51, "startTrackingCenter:bounds:transform:withInitialGestureLocation:velocity:", v54, v27, v29, v31, v33, v35, v37, v8, v10, *MEMORY[0x1E0D7CFF8], *(_QWORD *)(MEMORY[0x1E0D7CFF8] + 8));
    }

  }
}

- (void)updateTransitionWithPinchGestureRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  _OWORD v33[3];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[8];

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  if ((unint64_t)(v5 - 3) >= 3)
  {
    if ((unint64_t)(v5 - 1) <= 1)
    {
      if ((unint64_t)objc_msgSend(v4, "numberOfTouches") > 1)
      {
        -[PUImportOneUpModalTransition context](self, "context");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "containerView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "locationOfTouch:inView:", 0, v7);
        v9 = v8;
        v11 = v10;
        objc_msgSend(v4, "locationOfTouch:inView:", 1, v7);
        v13 = v12;
        v15 = v14;
        -[PUImportOneUpModalTransition pinchTracker](self, "pinchTracker");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __75__PUImportOneUpModalTransition_updateTransitionWithPinchGestureRecognizer___block_invoke;
        v37[3] = &__block_descriptor_64_e33_v16__0___PXMutablePinchTracker__8l;
        v37[4] = v9;
        v37[5] = v11;
        v37[6] = v13;
        v37[7] = v15;
        objc_msgSend(v16, "performChanges:", v37);

        if (-[PUImportOneUpModalTransition activeGesture](self, "activeGesture") == 1)
        {
          -[PUImportOneUpModalTransition manipulatedFloatingItem](self, "manipulatedFloatingItem");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUImportOneUpModalTransition pinchTracker](self, "pinchTracker");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "size");
          -[PUImportOneUpModalTransition currentProgressForFloatingItem:atSize:inDirection:](self, "currentProgressForFloatingItem:atSize:inDirection:", v17, 0);
          v20 = v19;

          -[PUImportOneUpModalTransition transitionAnimator](self, "transitionAnimator");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setFractionComplete:", v20);

          -[PUImportOneUpModalTransition manipulatedFloatingItem](self, "manipulatedFloatingItem");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "transitionView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          -[PUImportOneUpModalTransition pinchTracker](self, "pinchTracker");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "center");
          objc_msgSend(v23, "setCenter:");

          -[PUImportOneUpModalTransition pinchTracker](self, "pinchTracker");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "size");
          v27 = v26;
          -[PUImportOneUpModalTransition pinchTracker](self, "pinchTracker");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "size");
          objc_msgSend(v23, "setBounds:", 0.0, 0.0, v27, v29);

          -[PUImportOneUpModalTransition pinchTracker](self, "pinchTracker");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (v30)
          {
            objc_msgSend(v30, "transform");
          }
          else
          {
            v35 = 0u;
            v36 = 0u;
            v34 = 0u;
          }
          v33[0] = v34;
          v33[1] = v35;
          v33[2] = v36;
          objc_msgSend(v23, "setTransform:", v33);

          -[PUImportOneUpModalTransition context](self, "context");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "updateInteractiveTransition:", v20);

        }
      }
      else
      {
        objc_msgSend(v4, "px_cancel");
      }
    }
  }
  else
  {
    -[PUImportOneUpModalTransition endInteraction](self, "endInteraction");
  }

}

- (void)updateTransitionWithPanGestureRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _OWORD v35[3];
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  if ((unint64_t)(v5 - 3) >= 3)
  {
    if (v5 != 2)
    {
      if (v5 != 1)
        goto LABEL_15;
      -[PUImportOneUpModalTransition transitionAnimator](self, "transitionAnimator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fractionComplete");
      -[PUImportOneUpModalTransition setStartingAnimationProgress:](self, "setStartingAnimationProgress:");

      -[PUImportOneUpModalTransition setActiveGesture:](self, "setActiveGesture:", 2);
      -[PUImportOneUpModalTransition configureFloatingItemForInteractiveTracking](self, "configureFloatingItemForInteractiveTracking");
    }
    -[PUImportOneUpModalTransition context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "translationInView:", v8);
    v10 = v9;
    v12 = v11;
    objc_msgSend(v4, "velocityInView:", v8);
    v14 = v13;
    v16 = v15;
    -[PUImportOneUpModalTransition swipeDownTracker](self, "swipeDownTracker");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trackGestureTranslation:velocity:", v10, v12, v14, v16);

    if (-[PUImportOneUpModalTransition activeGesture](self, "activeGesture") == 2)
    {
      -[PUImportOneUpModalTransition swipeDownTracker](self, "swipeDownTracker");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dismissalProgress");
      v20 = v19;

      -[PUImportOneUpModalTransition startingAnimationProgress](self, "startingAnimationProgress");
      v22 = v21;
      if (-[PUImportOneUpModalTransition operation](self, "operation") == 1)
        v23 = v22 + (1.0 - v22) * v20;
      else
        v23 = v22 - v22 * v20;
      -[PUImportOneUpModalTransition transitionAnimator](self, "transitionAnimator");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setFractionComplete:", v23);

      -[PUImportOneUpModalTransition manipulatedFloatingItem](self, "manipulatedFloatingItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "transitionView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUImportOneUpModalTransition swipeDownTracker](self, "swipeDownTracker");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "trackedCenter");
      objc_msgSend(v26, "setCenter:");

      -[PUImportOneUpModalTransition swipeDownTracker](self, "swipeDownTracker");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "trackedBounds");
      v30 = v29;
      -[PUImportOneUpModalTransition swipeDownTracker](self, "swipeDownTracker");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "trackedBounds");
      objc_msgSend(v26, "setBounds:", 0.0, 0.0, v30);

      -[PUImportOneUpModalTransition swipeDownTracker](self, "swipeDownTracker");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32)
      {
        objc_msgSend(v32, "trackedTransform");
      }
      else
      {
        v37 = 0u;
        v38 = 0u;
        v36 = 0u;
      }
      v35[0] = v36;
      v35[1] = v37;
      v35[2] = v38;
      objc_msgSend(v26, "setTransform:", v35);

      -[PUImportOneUpModalTransition context](self, "context");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "updateInteractiveTransition:", v23);

    }
  }
  else
  {
    -[PUImportOneUpModalTransition endInteraction](self, "endInteraction");
  }
LABEL_15:

}

- (void)handleTapHoldGesture:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "state");
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if ((unint64_t)(v4 - 1) <= 1)
      -[PUImportOneUpModalTransition pauseAnimation](self, "pauseAnimation");
  }
  else
  {
    -[PUImportOneUpModalTransition endInteraction](self, "endInteraction");
  }
}

- (double)currentProgressForFloatingItem:(id)a3 atSize:(CGSize)a4 inDirection:(int64_t)a5
{
  double height;
  double width;
  id v8;
  void *v9;
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

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v9 = v8;
  if (a5)
  {
    objc_msgSend(v8, "initialFrame");
    v11 = v10;
    v13 = v12;
    objc_msgSend(v9, "targetFrame");
  }
  else
  {
    objc_msgSend(v8, "targetFrame");
    v11 = v16;
    v13 = v17;
    objc_msgSend(v9, "initialFrame");
  }
  v18 = v14;
  v19 = v15;
  if ((PXFloatApproximatelyEqualToFloat() & 1) != 0)
  {
    if ((PXFloatApproximatelyEqualToFloat() & 1) != 0)
      v20 = 0.0;
    else
      v20 = (height - v19) / (v13 - v19);
  }
  else
  {
    v20 = (width - v18) / (v11 - v18);
  }

  return v20;
}

- (CGVector)unitVelocityForDisplayVelocity:(PXDisplayVelocity)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double MidX;
  double MidY;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGVector result;
  CGRect v30;
  CGRect v31;

  -[PUImportOneUpModalTransition pinchTracker](self, "pinchTracker", a3.var0, a3.var1, a3.var2, a3.var3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PUImportOneUpModalTransition pinchTracker](self, "pinchTracker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "velocity");
    v7 = v6;
    v9 = v8;

    -[PUImportOneUpModalTransition manipulatedFloatingItem](self, "manipulatedFloatingItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "targetFrame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v30.origin.x = v12;
    v30.origin.y = v14;
    v30.size.width = v16;
    v30.size.height = v18;
    MidX = CGRectGetMidX(v30);
    v31.origin.x = v12;
    v31.origin.y = v14;
    v31.size.width = v16;
    v31.size.height = v18;
    MidY = CGRectGetMidY(v31);
    -[PUImportOneUpModalTransition manipulatedFloatingItem](self, "manipulatedFloatingItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "transitionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "center");
    v24 = v23;
    v26 = v25;

    v27 = v7 / (MidX - v24);
    v28 = v9 / (MidY - v26);
  }
  else
  {
    v28 = 0.0;
    v27 = 0.0;
  }
  result.dy = v28;
  result.dx = v27;
  return result;
}

- (void)endInteraction
{
  void *v3;
  int v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  void *v8;

  -[PUImportOneUpModalTransition context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInteractive");

  if (v4)
  {
    if (-[PUImportOneUpModalTransition activeGesture](self, "activeGesture") == 1)
    {
      -[PUImportOneUpModalTransition pinchTracker](self, "pinchTracker");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PUImportOneUpModalTransition animatingPositionForPinchTracker:](self, "animatingPositionForPinchTracker:", v5);
    }
    else
    {
      if (-[PUImportOneUpModalTransition activeGesture](self, "activeGesture") != 2)
        goto LABEL_9;
      -[PUImportOneUpModalTransition swipeDownTracker](self, "swipeDownTracker");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PUImportOneUpModalTransition animatingPositionForSwipeDownTracker:](self, "animatingPositionForSwipeDownTracker:", v5);
    }
    v7 = v6;

    if (v7)
    {
      -[PUImportOneUpModalTransition context](self, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cancelInteractiveTransition");
LABEL_10:

      -[PUImportOneUpModalTransition animateToPosition:](self, "animateToPosition:", v7);
      return;
    }
LABEL_9:
    -[PUImportOneUpModalTransition context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishInteractiveTransition");
    v7 = 0;
    goto LABEL_10;
  }
}

- (int64_t)animatingPositionForPinchTracker:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  _BOOL4 v12;
  void *v13;
  double v14;
  double v15;

  v4 = a3;
  -[PUImportOneUpModalTransition manipulatedFloatingItem](self, "manipulatedFloatingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  -[PUImportOneUpModalTransition currentProgressForFloatingItem:atSize:inDirection:](self, "currentProgressForFloatingItem:atSize:inDirection:", v5, 0);
  v7 = v6;

  if (v7 >= 0.0)
  {
    if (v7 >= 1.0)
    {
      v8 = 0;
    }
    else
    {
      v9 = objc_msgSend(v4, "scaleDirection");
      if (v9)
      {
        v10 = v9;
        v11 = -[PUImportOneUpModalTransition operation](self, "operation");
        v12 = v10 != -1;
        if (!v11)
          v12 = v10 != 1;
      }
      else
      {
        -[PUImportOneUpModalTransition transitionAnimator](self, "transitionAnimator");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "fractionComplete");
        v15 = v14;

        v12 = v15 <= 0.33;
      }
      v8 = v12;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (int64_t)animatingPositionForSwipeDownTracker:(id)a3
{
  int v4;

  v4 = objc_msgSend(a3, "shouldFinishDismissal");
  return v4 ^ (-[PUImportOneUpModalTransition operation](self, "operation") != 0);
}

- (void)pauseAnimation
{
  void *v3;
  void *v4;
  id v5;

  -[PUImportOneUpModalTransition floatingItemsAnimator](self, "floatingItemsAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimation:", 1);

  -[PUImportOneUpModalTransition transitionAnimator](self, "transitionAnimator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pauseAnimation");

  -[PUImportOneUpModalTransition context](self, "context");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pauseInteractiveTransition");

}

- (BOOL)continuousGestureRecognizerIsActive:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = v3;
  v5 = v3 && (objc_msgSend(v3, "state") == 1 || objc_msgSend(v4, "state") == 2);

  return v5;
}

- (UIViewPropertyAnimator)transitionAnimator
{
  return self->_transitionAnimator;
}

- (void)setTransitionAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_transitionAnimator, a3);
}

- (PUPhotoPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (PXPinchTracker)pinchTracker
{
  return self->_pinchTracker;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (PXSwipeDownTracker)swipeDownTracker
{
  return self->_swipeDownTracker;
}

- (int64_t)activeGesture
{
  return self->_activeGesture;
}

- (void)setActiveGesture:(int64_t)a3
{
  self->_activeGesture = a3;
}

- (int64_t)operation
{
  return self->_operation;
}

- (UIViewPropertyAnimator)floatingItemsAnimator
{
  return self->_floatingItemsAnimator;
}

- (void)setFloatingItemsAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_floatingItemsAnimator, a3);
}

- (UIViewControllerContextTransitioning)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSArray)floatingItems
{
  return self->_floatingItems;
}

- (void)setFloatingItems:(id)a3
{
  objc_storeStrong((id *)&self->_floatingItems, a3);
}

- (PUImportOneUpTransitionItem)manipulatedFloatingItem
{
  return self->_manipulatedFloatingItem;
}

- (void)setManipulatedFloatingItem:(id)a3
{
  objc_storeStrong((id *)&self->_manipulatedFloatingItem, a3);
}

- (double)startingAnimationProgress
{
  return self->_startingAnimationProgress;
}

- (void)setStartingAnimationProgress:(double)a3
{
  self->_startingAnimationProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manipulatedFloatingItem, 0);
  objc_storeStrong((id *)&self->_floatingItems, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_floatingItemsAnimator, 0);
  objc_storeStrong((id *)&self->_swipeDownTracker, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pinchTracker, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_transitionAnimator, 0);
}

void __75__PUImportOneUpModalTransition_updateTransitionWithPinchGestureRecognizer___block_invoke(double *a1, void *a2)
{
  double v3;
  double v4;
  id v5;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v5, "setPinchLocation1:", v3, v4);
  objc_msgSend(v5, "setPinchLocation2:", a1[6], a1[7]);

}

uint64_t __75__PUImportOneUpModalTransition_configureFloatingItemForInteractiveTracking__block_invoke(uint64_t a1)
{
  void *v2;
  _OWORD v4[3];
  __int128 v5;
  __int128 v6;
  __int128 v7;

  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 72), *(double *)(a1 + 80));
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "transform");
    v2 = *(void **)(a1 + 32);
  }
  else
  {
    v6 = 0u;
    v7 = 0u;
    v5 = 0u;
  }
  v4[0] = v5;
  v4[1] = v6;
  v4[2] = v7;
  return objc_msgSend(v2, "setTransform:", v4);
}

void __50__PUImportOneUpModalTransition_animateToPosition___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double MidX;
  double MidY;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[3];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;

  v30 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "floatingItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v26;
    v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v23 = *MEMORY[0x1E0C9BAA8];
    v21 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (*(_BYTE *)(a1 + 40))
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "targetFrame");
        else
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "initialFrame");
        v12 = v8;
        v13 = v9;
        v14 = v10;
        v15 = v11;
        MidX = CGRectGetMidX(*(CGRect *)&v8);
        v31.origin.x = v12;
        v31.origin.y = v13;
        v31.size.width = v14;
        v31.size.height = v15;
        MidY = CGRectGetMidY(v31);
        objc_msgSend(v7, "transitionView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setCenter:", MidX, MidY);
        objc_msgSend(v18, "setBounds:", 0.0, 0.0, v14, v15);
        v24[0] = v23;
        v24[1] = v22;
        v24[2] = v21;
        objc_msgSend(v18, "setTransform:", v24);
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", *(_QWORD *)(a1 + 32), sel_handleTapHoldGesture_);
        objc_msgSend(v19, "setMinimumPressDuration:", 0.0);
        objc_msgSend(v7, "transitionView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addGestureRecognizer:", v19);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v4);
  }

}

void __47__PUImportOneUpModalTransition_startTransition__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__PUImportOneUpModalTransition_startTransition__block_invoke_2;
  v4[3] = &unk_1E58A5BB0;
  v3 = *(double *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "animateKeyframesWithDuration:delay:options:animations:completion:", 3072, v4, 0, v3, 0.0);

}

void __47__PUImportOneUpModalTransition_startTransition__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleTransitionComplete:", a2);

}

void __47__PUImportOneUpModalTransition_startTransition__block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v3 = *(double *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__PUImportOneUpModalTransition_startTransition__block_invoke_3;
  v4[3] = &unk_1E58AACF0;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, 0.0, v3);

}

uint64_t __47__PUImportOneUpModalTransition_startTransition__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

+ (double)defaultAnimationDurationForOperation:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend((id)objc_opt_class(), "propertyAnimatorWithInitialVelocity:forOperation:inDirection:", a3, 0, 0.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "duration");
  v5 = v4;

  return v5;
}

+ (id)propertyAnimatorWithInitialVelocity:(CGVector)a3 forOperation:(int64_t)a4 inDirection:(int64_t)a5
{
  double dy;
  double dx;
  int64_t v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  void *v12;

  dy = a3.dy;
  dx = a3.dx;
  v7 = a5 | a4;
  v8 = objc_alloc(MEMORY[0x1E0DC3CA0]);
  if (v7)
  {
    v9 = (void *)objc_msgSend(v8, "initWithDampingRatio:initialVelocity:", 1.0, dx, dy);
    v10 = objc_alloc(MEMORY[0x1E0DC3F38]);
    v11 = 0.3;
  }
  else
  {
    v9 = (void *)objc_msgSend(v8, "initWithMass:stiffness:damping:initialVelocity:", 4.5, 1300.0, 95.0, dx, dy);
    v10 = objc_alloc(MEMORY[0x1E0DC3F38]);
    v11 = 0.0;
  }
  v12 = (void *)objc_msgSend(v10, "initWithDuration:timingParameters:", v9, v11);

  return v12;
}

+ (id)transitioningObjectInViewController:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EEC982D0))
  {
    v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)objc_opt_class();
      objc_msgSend(v3, "viewControllers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transitioningObjectInViewController:", v7);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_opt_class();
        objc_msgSend(v3, "selectedViewController");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v4 = 0;
          goto LABEL_11;
        }
        v8 = (void *)objc_opt_class();
        objc_msgSend(v3, "topViewController");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      v6 = (void *)v9;
      objc_msgSend(v8, "transitioningObjectInViewController:", v9);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
LABEL_11:

  return v4;
}

+ (CGSize)scaledSizeForTargetSize:(CGSize)a3 aspectFillingIntoSize:(CGSize)a4
{
  CGFloat v4;
  BOOL v5;
  double height;
  double width;
  CGSize result;

  v4 = a3.width / a3.height;
  v5 = v4 <= 1.0;
  height = a4.width / v4;
  width = a4.height * v4;
  if (v5)
    width = a4.width;
  else
    height = a4.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
