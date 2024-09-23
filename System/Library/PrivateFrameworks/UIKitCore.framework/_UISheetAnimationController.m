@implementation _UISheetAnimationController

- (_UISheetAnimationController)init
{
  _UISheetAnimationController *v2;
  _UISheetAnimationController *v3;
  CGPoint v4;
  CGSize v5;
  uint64_t v6;
  _UISheetPresentationMetrics *metrics;
  uint64_t v8;
  NSMutableArray *allNoninteractiveAnimations;
  uint64_t v10;
  NSMutableArray *allNoninteractiveCompletions;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UISheetAnimationController;
  v2 = -[_UISheetAnimationController init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (CGPoint)*MEMORY[0x1E0C9D628];
    v5 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v2->_sourceFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v2->_sourceFrame.size = v5;
    v2->_interactiveFrame.origin = v4;
    v2->_interactiveFrame.size = v5;
    v2->_isInInitialLayout = 1;
    _UIFallbackSheetMetrics();
    v6 = objc_claimAutoreleasedReturnValue();
    metrics = v3->_metrics;
    v3->_metrics = (_UISheetPresentationMetrics *)v6;

    v8 = objc_opt_new();
    allNoninteractiveAnimations = v3->_allNoninteractiveAnimations;
    v3->_allNoninteractiveAnimations = (NSMutableArray *)v8;

    v10 = objc_opt_new();
    allNoninteractiveCompletions = v3->_allNoninteractiveCompletions;
    v3->_allNoninteractiveCompletions = (NSMutableArray *)v10;

  }
  return v3;
}

- (id)noninteractiveAnimations
{
  return (id)-[NSMutableArray firstObject](self->_allNoninteractiveAnimations, "firstObject");
}

- (void)setNoninteractiveAnimations:(id)a3
{
  void *v4;
  NSMutableArray *allNoninteractiveAnimations;
  void *v6;
  id aBlock;

  aBlock = a3;
  -[NSMutableArray removeAllObjects](self->_allNoninteractiveAnimations, "removeAllObjects");
  v4 = aBlock;
  if (aBlock)
  {
    allNoninteractiveAnimations = self->_allNoninteractiveAnimations;
    v6 = _Block_copy(aBlock);
    -[NSMutableArray addObject:](allNoninteractiveAnimations, "addObject:", v6);

    v4 = aBlock;
  }

}

- (id)noninteractiveCompletion
{
  return (id)-[NSMutableArray firstObject](self->_allNoninteractiveCompletions, "firstObject");
}

- (void)setNoninteractiveCompletion:(id)a3
{
  void *v4;
  NSMutableArray *allNoninteractiveCompletions;
  void *v6;
  id aBlock;

  aBlock = a3;
  -[NSMutableArray removeAllObjects](self->_allNoninteractiveCompletions, "removeAllObjects");
  v4 = aBlock;
  if (aBlock)
  {
    allNoninteractiveCompletions = self->_allNoninteractiveCompletions;
    v6 = _Block_copy(aBlock);
    -[NSMutableArray addObject:](allNoninteractiveCompletions, "addObject:", v6);

    v4 = aBlock;
  }

}

- (void)addNoninteractiveAnimations:(id)a3
{
  NSMutableArray *allNoninteractiveAnimations;
  id v4;

  allNoninteractiveAnimations = self->_allNoninteractiveAnimations;
  v4 = _Block_copy(a3);
  -[NSMutableArray addObject:](allNoninteractiveAnimations, "addObject:", v4);

}

- (void)addNoninteractiveCompletion:(id)a3
{
  NSMutableArray *allNoninteractiveCompletions;
  id v4;

  allNoninteractiveCompletions = self->_allNoninteractiveCompletions;
  v4 = _Block_copy(a3);
  -[NSMutableArray addObject:](allNoninteractiveCompletions, "addObject:", v4);

}

- (BOOL)isForward
{
  return !-[_UISheetAnimationController isReversed](self, "isReversed");
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  void (**v3)(void);
  id v6;
  void *v7;
  UIViewPropertyAnimator *v8;
  double v9;
  double v10;
  void *v11;
  UIViewPropertyAnimator *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  double v30;
  double v31;
  double v32;
  double v33;
  BOOL v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
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
  void *v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  id location;
  _QWORD v79[4];
  id v80;
  _QWORD v81[6];
  CGRect v82;
  CGRect v83;
  CGRect v84;

  v6 = a3;
  -[_UISheetAnimationController propertyAnimator](self, "propertyAnimator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_30;
  v8 = [UIViewPropertyAnimator alloc];
  -[_UISheetAnimationController transitionDuration:](self, "transitionDuration:", v6);
  v10 = v9;
  _UISheetTransitionTimingCurve();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v8, "initWithDuration:timingParameters:", v11, v10);
  -[_UISheetAnimationController setPropertyAnimator:](self, "setPropertyAnimator:", v12);

  -[_UISheetAnimationController setTransitionContext:](self, "setTransitionContext:", v6);
  objc_msgSend(v6, "viewForKey:", CFSTR("UITransitionContextToView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewForKey:", CFSTR("UITransitionContextFromView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UISheetAnimationController isForward](self, "isForward"))
    v15 = v13;
  else
    v15 = v14;
  -[_UISheetAnimationController setForwardView:](self, "setForwardView:", v15);
  objc_msgSend(v6, "viewControllerForKey:", CFSTR("UITransitionContextFromViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finalFrameForViewController:", v17);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v6, "initialFrameForViewController:", v16);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v34 = -[_UISheetAnimationController isForward](self, "isForward");
  if (v34)
    v35 = v19;
  else
    v35 = v27;
  if (v34)
    v36 = v21;
  else
    v36 = v29;
  if (v34)
    v37 = v23;
  else
    v37 = v31;
  if (v34)
    v38 = v25;
  else
    v38 = v33;
  -[_UISheetAnimationController setForwardViewFullFrame:](self, "setForwardViewFullFrame:", v35, v36, v37, v38);
  -[_UISheetAnimationController sourceView](self, "sourceView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISheetAnimationController sourceFrame](self, "sourceFrame");
  if (CGRectIsNull(v82))
  {
    if (!v39)
    {
      -[_UISheetAnimationController defaultSourceFrameProvider](self, "defaultSourceFrameProvider");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        -[_UISheetAnimationController defaultSourceFrameProvider](self, "defaultSourceFrameProvider");
        v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v3[2]();
      }
      else
      {
        -[_UISheetAnimationController forwardViewFullFrame](self, "forwardViewFullFrame");
      }
      -[_UISheetAnimationController setSourceFrame:](self, "setSourceFrame:");
      if (v41)

      goto LABEL_22;
    }
    objc_msgSend(v39, "bounds");
    -[_UISheetAnimationController setSourceFrame:](self, "setSourceFrame:");
  }
  else if (!v39)
  {
    goto LABEL_23;
  }
  objc_msgSend(v39, "_viewControllerForAncestor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "_existingPresentationControllerImmediate:effective:includesRoot:", 0, 1, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UISheetAnimationController sourceFrame](self, "sourceFrame");
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v49 = v48;
  objc_msgSend(v41, "presentedView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "convertRect:toView:", v50, v43, v45, v47, v49);
  v52 = v51;
  v54 = v53;
  v56 = v55;
  v58 = v57;

  objc_msgSend(v41, "frameOfPresentedViewInContainerView");
  v60 = v59;
  v62 = v61;
  v83.origin.x = v52;
  v83.origin.y = v54;
  v83.size.width = v56;
  v83.size.height = v58;
  v84 = CGRectOffset(v83, v60, v62);
  -[_UISheetAnimationController setSourceFrame:](self, "setSourceFrame:", v84.origin.x, v84.origin.y, v84.size.width, v84.size.height);
LABEL_22:

LABEL_23:
  -[_UISheetAnimationController forwardView](self, "forwardView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v63)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISheetTransitioning.m"), 147, CFSTR("Attempted to run _UISheetAnimationController without a forwardView."));

    if (!v13)
      goto LABEL_26;
    goto LABEL_25;
  }
  if (v13)
  {
LABEL_25:
    objc_msgSend(v13, "_setFrameIgnoringLayerTransform:", v19, v21, v23, v25);
    objc_msgSend(v6, "containerView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "addSubview:", v13);

  }
LABEL_26:
  v65 = MEMORY[0x1E0C809B0];
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __66___UISheetAnimationController_interruptibleAnimatorForTransition___block_invoke;
  v81[3] = &unk_1E16B1B28;
  v81[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v81);
  -[_UISheetAnimationController setIsInInitialLayout:](self, "setIsInInitialLayout:", 0);
  -[_UISheetAnimationController metrics](self, "metrics");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISheetAnimationController propertyAnimator](self, "propertyAnimator");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addAlongsideAnimations:forSheetTransition:context:", v67, self, v6);

  if (objc_msgSend(v6, "isInteractive"))
  {
    -[_UISheetAnimationController propertyAnimator](self, "propertyAnimator");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v65;
    v79[1] = 3221225472;
    v79[2] = __66___UISheetAnimationController_interruptibleAnimatorForTransition___block_invoke_2;
    v79[3] = &unk_1E16B1B28;
    v80 = v6;
    objc_msgSend(v68, "addAnimations:", v79);

  }
  else
  {
    objc_initWeak(&location, self);
    -[_UISheetAnimationController propertyAnimator](self, "propertyAnimator");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v65;
    v76[1] = 3221225472;
    v76[2] = __66___UISheetAnimationController_interruptibleAnimatorForTransition___block_invoke_3;
    v76[3] = &unk_1E16B3F40;
    objc_copyWeak(&v77, &location);
    objc_msgSend(v69, "addAnimations:", v76);

    objc_destroyWeak(&v77);
    objc_destroyWeak(&location);
  }
  -[_UISheetAnimationController propertyAnimator](self, "propertyAnimator");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v65;
  v74[1] = 3221225472;
  v74[2] = __66___UISheetAnimationController_interruptibleAnimatorForTransition___block_invoke_5;
  v74[3] = &unk_1E16B42D0;
  v75 = v6;
  objc_msgSend(v70, "addCompletion:", v74);

LABEL_30:
  -[_UISheetAnimationController propertyAnimator](self, "propertyAnimator");
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  return v71;
}

- (void)animateTransition:(id)a3
{
  id v3;

  -[_UISheetAnimationController interruptibleAnimatorForTransition:](self, "interruptibleAnimatorForTransition:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAnimation");

}

- (void)layoutTransitionViews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  int v21;
  _BOOL4 IsNull;
  _BOOL4 v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  _BOOL4 v33;
  int v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  __int128 v40;
  double Width;
  double MinY;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  CGFloat Height;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat recta;
  CGAffineTransform rect_8;
  CGAffineTransform t2;
  CGAffineTransform v58;
  CGAffineTransform t1;
  CGAffineTransform v60;
  CGAffineTransform v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  -[_UISheetAnimationController transitionContext](self, "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_30;
  -[_UISheetAnimationController forwardView](self, "forwardView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISheetAnimationController forwardViewFullFrame](self, "forwardViewFullFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[_UISheetAnimationController interactiveFrame](self, "interactiveFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = objc_msgSend(v3, "isInteractive");
  v64.origin.x = v14;
  v64.origin.y = v16;
  v64.size.width = v18;
  v64.size.height = v20;
  IsNull = CGRectIsNull(v64);
  v23 = IsNull;
  v52 = v12;
  v53 = v10;
  if (!IsNull)
  {
    v12 = v20;
    v10 = v18;
  }
  v51 = v8;
  if (IsNull)
  {
    v24 = v6;
  }
  else
  {
    v8 = v16;
    v24 = v14;
  }
  v54 = v6;
  recta = v24;
  -[_UISheetAnimationController sourceFrame](self, "sourceFrame");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v33 = (objc_msgSend(v3, "transitionWasCancelled") & 1) != 0
     || -[_UISheetAnimationController isInInitialLayout](self, "isInInitialLayout");
  if (-[_UISheetAnimationController isForward](self, "isForward"))
  {
    v34 = v21 | !v33;
    if (v34)
      v35 = v12;
    else
      v35 = v20;
    if ((v34 & 1) == 0)
    {
      v36 = v28;
      v37 = v32;
      v38 = v30;
      v39 = v26;
      if (v23)
        goto LABEL_23;
    }
  }
  else
  {
    if (v21 | v33)
      v35 = v12;
    else
      v35 = v20;
    if (((v21 | v33) & 1) == 0)
    {
      v36 = v28;
      v37 = v32;
      v38 = v30;
      v39 = v26;
      if (v23)
        goto LABEL_23;
    }
  }
  v36 = v8;
  v37 = v35;
  v38 = v10;
  v39 = recta;
LABEL_23:
  objc_msgSend(v4, "_setFrameIgnoringLayerTransform:", v39, v36, v38, v37, v35);
  v40 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v63.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v63.c = v40;
  *(_OWORD *)&v63.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  if (v21)
  {
    if (-[_UISheetAnimationController scalesDownForwardView](self, "scalesDownForwardView"))
    {
      v65.origin.x = v26;
      v65.origin.y = v28;
      v65.size.width = v30;
      v65.size.height = v32;
      Width = CGRectGetWidth(v65);
      v66.size.width = v53;
      v66.origin.x = v54;
      v66.origin.y = v51;
      v66.size.height = v52;
      if (Width < CGRectGetWidth(v66))
      {
        v67.origin.x = recta;
        v67.origin.y = v8;
        v67.size.width = v10;
        v67.size.height = v12;
        MinY = CGRectGetMinY(v67);
        v68.origin.x = v54;
        v68.size.height = v52;
        v68.origin.y = v51;
        v68.size.width = v53;
        recta = MinY - CGRectGetMinY(v68);
        v69.origin.x = v26;
        v69.origin.y = v28;
        v69.size.width = v30;
        v69.size.height = v32;
        v43 = CGRectGetMinY(v69);
        v70.origin.x = v54;
        v70.origin.y = v51;
        v70.size.width = v53;
        v70.size.height = v52;
        v44 = recta / (v43 - CGRectGetMinY(v70));
        v71.origin.x = v26;
        v71.origin.y = v28;
        v71.size.width = v30;
        v71.size.height = v32;
        v45 = CGRectGetWidth(v71);
        -[_UISheetAnimationController forwardViewFullFrame](self, "forwardViewFullFrame");
        v46 = v45 / CGRectGetWidth(v72);
        if (v46 < 0.8)
          v46 = 0.8;
        v47 = 1.0 - v44 + v44 * v46;
        -[_UISheetAnimationController attachmentPoint](self, "attachmentPoint");
        v73.origin.x = v54;
        v73.origin.y = v51;
        v73.size.width = v53;
        v73.size.height = v52;
        -[_UISheetAnimationController attachmentPoint](self, "attachmentPoint", CGRectGetWidth(v73));
        v49 = v48;
        v74.origin.x = v54;
        v74.origin.y = v51;
        v74.size.width = v53;
        v74.size.height = v52;
        Height = CGRectGetHeight(v74);
        memset(&v62, 0, sizeof(v62));
        CGAffineTransformMakeTranslation(&v62, 0.0, v49 + Height * -0.5);
        memset(&v61, 0, sizeof(v61));
        CGAffineTransformMakeScale(&v61, v47, v47);
        t1 = v62;
        memset(&v60, 0, sizeof(v60));
        CGAffineTransformInvert(&v60, &t1);
        t1 = v60;
        t2 = v61;
        CGAffineTransformConcat(&v58, &t1, &t2);
        t1 = v62;
        CGAffineTransformConcat(&v63, &v58, &t1);
      }
    }
  }
  rect_8 = v63;
  objc_msgSend(v4, "setTransform:", &rect_8);

LABEL_30:
}

- (void)runNoninteractiveAnimationsIfPossible
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->_allNoninteractiveAnimations;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_allNoninteractiveCompletions;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        +[UIView _addCompletion:](UIView, "_addCompletion:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

}

- (BOOL)_allowKeyboardToAnimateAlongside:(id)a3
{
  return 0;
}

- (BOOL)isReversed
{
  return self->_isReversed;
}

- (void)setIsReversed:(BOOL)a3
{
  self->_isReversed = a3;
}

- (CGRect)sourceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceFrame.origin.x;
  y = self->_sourceFrame.origin.y;
  width = self->_sourceFrame.size.width;
  height = self->_sourceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceFrame:(CGRect)a3
{
  self->_sourceFrame = a3;
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (void)setSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_sourceView, a3);
}

- (UIViewControllerContextTransitioning)transitionContext
{
  return (UIViewControllerContextTransitioning *)objc_loadWeakRetained((id *)&self->_transitionContext);
}

- (void)setTransitionContext:(id)a3
{
  objc_storeWeak((id *)&self->_transitionContext, a3);
}

- (UIView)forwardView
{
  return self->_forwardView;
}

- (void)setForwardView:(id)a3
{
  objc_storeStrong((id *)&self->_forwardView, a3);
}

- (CGRect)forwardViewFullFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_forwardViewFullFrame.origin.x;
  y = self->_forwardViewFullFrame.origin.y;
  width = self->_forwardViewFullFrame.size.width;
  height = self->_forwardViewFullFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setForwardViewFullFrame:(CGRect)a3
{
  self->_forwardViewFullFrame = a3;
}

- (BOOL)isInInitialLayout
{
  return self->_isInInitialLayout;
}

- (void)setIsInInitialLayout:(BOOL)a3
{
  self->_isInInitialLayout = a3;
}

- (UIViewPropertyAnimator)propertyAnimator
{
  return self->_propertyAnimator;
}

- (void)setPropertyAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_propertyAnimator, a3);
}

- (_UISheetPresentationMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (BOOL)scalesDownForwardView
{
  return self->_scalesDownForwardView;
}

- (void)setScalesDownForwardView:(BOOL)a3
{
  self->_scalesDownForwardView = a3;
}

- (NSMutableArray)allNoninteractiveAnimations
{
  return self->_allNoninteractiveAnimations;
}

- (void)setAllNoninteractiveAnimations:(id)a3
{
  objc_storeStrong((id *)&self->_allNoninteractiveAnimations, a3);
}

- (NSMutableArray)allNoninteractiveCompletions
{
  return self->_allNoninteractiveCompletions;
}

- (void)setAllNoninteractiveCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_allNoninteractiveCompletions, a3);
}

- (id)defaultSourceFrameProvider
{
  return self->_defaultSourceFrameProvider;
}

- (void)setDefaultSourceFrameProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CGRect)interactiveFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_interactiveFrame.origin.x;
  y = self->_interactiveFrame.origin.y;
  width = self->_interactiveFrame.size.width;
  height = self->_interactiveFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInteractiveFrame:(CGRect)a3
{
  self->_interactiveFrame = a3;
}

- (CGPoint)attachmentPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_attachmentPoint.x;
  y = self->_attachmentPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAttachmentPoint:(CGPoint)a3
{
  self->_attachmentPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultSourceFrameProvider, 0);
  objc_storeStrong((id *)&self->_allNoninteractiveCompletions, 0);
  objc_storeStrong((id *)&self->_allNoninteractiveAnimations, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_propertyAnimator, 0);
  objc_storeStrong((id *)&self->_forwardView, 0);
  objc_destroyWeak((id *)&self->_transitionContext);
  objc_destroyWeak((id *)&self->_sourceView);
}

@end
