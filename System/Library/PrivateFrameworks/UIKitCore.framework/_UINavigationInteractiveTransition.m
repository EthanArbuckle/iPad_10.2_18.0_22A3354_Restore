@implementation _UINavigationInteractiveTransition

- (_UINavigationInteractiveTransition)initWithViewController:(id)a3 animator:(id)a4
{
  id v5;
  id v6;
  _UINavigationInteractiveTransition *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UINavigationInteractiveTransition;
  v5 = a4;
  v6 = a3;
  v7 = -[UIPercentDrivenInteractiveTransition init](&v9, sel_init);
  v7->super.__useAugmentedShouldPopDecisionProcedure = _UINavigationControllerUseAugmentedPopGesture();
  v7->super.__interactionState = 0;
  objc_storeWeak((id *)&v7->super.__parent, v6);

  v7->super.__completesTransitionOnEnd = 1;
  -[_UINavigationInteractiveTransitionBase setAnimationController:](v7, "setAnimationController:", v5, v9.receiver, v9.super_class);

  -[_UINavigationInteractiveTransition _configureNavigationGesture](v7, "_configureNavigationGesture");
  -[UIPercentDrivenInteractiveTransition _setUsesPacedFractionComplete:](v7, "_setUsesPacedFractionComplete:", 1);
  if (+[UIView _fluidParallaxTransitionsEnabled]())
    -[UIPercentDrivenInteractiveTransition _setClampsPercentComplete:](v7, "_setClampsPercentComplete:", 0);
  return v7;
}

- (void)_configureNavigationGesture
{
  id WeakRetained;
  _UIParallaxTransitionPanGestureRecognizer *v4;
  _UIParallaxTransitionPanGestureRecognizer *v5;
  _UIParallaxTransitionPanGestureRecognizer *edgePanRecognizer;
  _UIParallaxTransitionPanGestureRecognizer *v7;
  _UIParallaxTransitionPanGestureRecognizer *v8;
  _UIParallaxTransitionPanGestureRecognizer *v9;
  uint64_t v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->super.__parent);
  objc_msgSend(WeakRetained, "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (_UIParallaxTransitionPanGestureRecognizer *)objc_loadWeakRetained((id *)&self->super._gestureRecognizer);
  v5 = v4;
  edgePanRecognizer = self->_edgePanRecognizer;
  if (edgePanRecognizer)
  {
    if (v4 != edgePanRecognizer)
    {
      objc_msgSend(v11, "removeGestureRecognizer:");
      v4 = self->_edgePanRecognizer;
    }
    -[UIPanGestureRecognizer setDelegate:](v4, "setDelegate:", 0);
    v7 = self->_edgePanRecognizer;
    self->_edgePanRecognizer = 0;

  }
  if (v5)
  {
    objc_msgSend(v11, "removeGestureRecognizer:", v5);
    -[UIPanGestureRecognizer setDelegate:](v5, "setDelegate:", 0);
    objc_storeWeak((id *)&self->super._gestureRecognizer, 0);
  }
  v8 = -[_UIParallaxTransitionPanGestureRecognizer initWithTarget:action:]([_UIParallaxTransitionPanGestureRecognizer alloc], "initWithTarget:action:", self, sel_handleNavigationTransition_);
  v9 = self->_edgePanRecognizer;
  self->_edgePanRecognizer = v8;

  if (-[_UINavigationInteractiveTransitionBase _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v10 = 8;
  else
    v10 = 2;
  -[UIScreenEdgePanGestureRecognizer setEdges:](self->_edgePanRecognizer, "setEdges:", v10);
  -[UIPanGestureRecognizer setDelegate:](self->_edgePanRecognizer, "setDelegate:", self);
  if (qword_1ECD7A0B8 != -1)
    dispatch_once(&qword_1ECD7A0B8, &__block_literal_global_561);
  if (_MergedGlobals_25_0)
    -[UIGestureRecognizer setDelaysTouchesBegan:](self->_edgePanRecognizer, "setDelaysTouchesBegan:", 0);
  objc_msgSend(v11, "addGestureRecognizer:", self->_edgePanRecognizer);
  objc_storeWeak((id *)&self->super._gestureRecognizer, self->_edgePanRecognizer);

}

- (void)_setShouldReverseLayoutDirection:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UINavigationInteractiveTransition;
  -[_UINavigationInteractiveTransitionBase _setShouldReverseLayoutDirection:](&v6, sel__setShouldReverseLayoutDirection_);
  if (v3)
    v5 = 8;
  else
    v5 = 2;
  -[UIScreenEdgePanGestureRecognizer setEdges:](self->_edgePanRecognizer, "setEdges:", v5);
}

- (UIScreenEdgePanGestureRecognizer)screenEdgePanGestureRecognizer
{
  return (UIScreenEdgePanGestureRecognizer *)self->_edgePanRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgePanRecognizer, 0);
}

- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  _UIParallaxTransitionPanGestureRecognizer *v6;
  id v7;
  id WeakRetained;
  _UIParallaxTransitionPanGestureRecognizer *v9;
  char v10;
  int v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  char v21;

  v6 = (_UIParallaxTransitionPanGestureRecognizer *)a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.__parent);
  if (self->_edgePanRecognizer == v6
    || (v9 = (_UIParallaxTransitionPanGestureRecognizer *)objc_loadWeakRetained((id *)&self->super._gestureRecognizer),
        v9,
        v9 == v6))
  {
    if (dyld_program_sdk_at_least())
    {
      -[UIGestureRecognizer _failureDependents]((id *)&v6->super.super.super.super.isa);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
      {
        v13 = 1;
      }
      else
      {
        -[_UILabelConfiguration _internal]((id *)&v6->super.super.super.super.isa);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v14, "count") != 0;

      }
    }
    else
    {
      v13 = 0;
    }
    if ((objc_msgSend(WeakRetained, "_shouldUseBuiltinInteractionController") & 1) == 0 && !v13)
      goto LABEL_13;
    if (+[UIView _interruptibleParallaxTransitionsEnabled]())
    {
      if (-[_UINavigationInteractiveTransitionBase _shouldPauseRunningTransition](self, "_shouldPauseRunningTransition"))
      {
        +[_UIViewControllerTransitionContext _associatedTransitionContextsForInteractionController:](_UIViewControllerTransitionContext, "_associatedTransitionContextsForInteractionController:", self);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v17)
        {
          LOBYTE(v11) = 1;
          goto LABEL_14;
        }
      }
    }
    v11 = objc_msgSend(WeakRetained, "_isCurrentTransitionPreemptable");
    if ((objc_msgSend(WeakRetained, "_isTransitioning") & 1) != 0)
    {
      if (!v11)
        goto LABEL_14;
    }
    else if (((objc_msgSend(WeakRetained, "needsDeferredTransition") ^ 1 | v11) & 1) == 0)
    {
      goto LABEL_13;
    }
    objc_msgSend(WeakRetained, "_transitionCoordinator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      v19 = v11;
    else
      v19 = 1;
    if (v19 == 1)
    {
      +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "_isTransitioning");

      if ((v21 & 1) == 0)
      {
        v10 = objc_msgSend(WeakRetained, "_shouldInteractivePopGestureBeEnabled");
        goto LABEL_4;
      }
    }
LABEL_13:
    LOBYTE(v11) = 0;
    goto LABEL_14;
  }
  v10 = -[UIGestureRecognizer _shouldReceiveEvent:](v6, "_shouldReceiveEvent:", v7);
LABEL_4:
  LOBYTE(v11) = v10;
LABEL_14:

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  _UIParallaxTransitionPanGestureRecognizer *v6;
  id v7;
  id WeakRetained;
  _UIParallaxTransitionPanGestureRecognizer *v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  BOOL v25;
  uint64_t v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  BOOL v38;
  CGPoint v40;
  CGPoint v41;
  CGRect v42;
  CGRect v43;

  v6 = (_UIParallaxTransitionPanGestureRecognizer *)a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.__parent);
  if (self->_edgePanRecognizer == v6
    || (v9 = (_UIParallaxTransitionPanGestureRecognizer *)objc_loadWeakRetained((id *)&self->super._gestureRecognizer),
        v9,
        v9 == v6))
  {
    objc_msgSend(WeakRetained, "navigationBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_existingToolbar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ECD7A0B8 != -1)
      dispatch_once(&qword_1ECD7A0B8, &__block_literal_global_561);
    if (_MergedGlobals_25_0)
      goto LABEL_14;
    if ((objc_msgSend(v11, "isHidden") & 1) == 0)
    {
      objc_msgSend(v11, "window");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        objc_msgSend(v11, "bounds");
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v22 = v21;
        objc_msgSend(v7, "locationInView:", v11);
        v40.x = v23;
        v40.y = v24;
        v42.origin.x = v16;
        v42.origin.y = v18;
        v42.size.width = v20;
        v42.size.height = v22;
        v25 = CGRectContainsPoint(v42, v40);

        if (v25)
          goto LABEL_13;
      }
    }
    if ((objc_msgSend(v12, "isHidden") & 1) != 0)
      goto LABEL_14;
    objc_msgSend(v12, "window");
    v26 = objc_claimAutoreleasedReturnValue();
    if (!v26)
      goto LABEL_14;
    v27 = (void *)v26;
    objc_msgSend(v12, "bounds");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    objc_msgSend(v7, "locationInView:", v12);
    v41.x = v36;
    v41.y = v37;
    v43.origin.x = v29;
    v43.origin.y = v31;
    v43.size.width = v33;
    v43.size.height = v35;
    v38 = CGRectContainsPoint(v43, v41);

    if (v38)
LABEL_13:
      v10 = 0;
    else
LABEL_14:
      v10 = 1;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  _BOOL4 v8;
  unsigned int v10;

  v4 = a3;
  if ((+[UIView _interruptibleParallaxTransitionsEnabled]() & 1) == 0
    && -[_UINavigationInteractiveTransitionBase _interactionState](self, "_interactionState")
    || (objc_msgSend(v4, "view"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "translationInView:", v5),
        v7 = v6,
        v5,
        self->super.__transitionWasStopped))
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v4, "edges");
      if ((objc_msgSend(v4, "edges") & 8) != 0)
        LOBYTE(v8) = v7 <= 0.0;
      else
        v8 = (v7 >= 0.0) & (v10 >> 1);
    }
    else
    {
      LOBYTE(v8) = v7 >= 0.0;
    }
  }

  return v8;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  _UIParallaxTransitionPanGestureRecognizer *v6;
  _QWORD *v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  unsigned __int8 v11;
  void *v13;
  void *v14;
  _QWORD *v15;
  objc_super v16;

  v6 = (_UIParallaxTransitionPanGestureRecognizer *)a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.__parent);
  objc_msgSend(WeakRetained, "_screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_userInterfaceIdiom");

  if (v10 == 3)
    goto LABEL_2;
  if (self->_edgePanRecognizer != v6)
  {
    v16.receiver = self;
    v16.super_class = (Class)_UINavigationInteractiveTransition;
    v11 = -[_UINavigationInteractiveTransitionBase _gestureRecognizer:shouldBeRequiredToFailByGestureRecognizer:](&v16, sel__gestureRecognizer_shouldBeRequiredToFailByGestureRecognizer_, v6, v7);
    goto LABEL_5;
  }
  if ((objc_msgSend(v7, "_isGestureType:", 16) & 1) != 0
    || (objc_msgSend(v7, "_shouldDelayUntilForceLevelRequirementIsMet") & 1) != 0
    || -[UIScreenEdgePanGestureRecognizer _rootFeatureState](self->_edgePanRecognizer, "_rootFeatureState") == 2)
  {
LABEL_2:
    v11 = 0;
  }
  else
  {
    -[_UINavigationInteractiveTransitionBase _parent](self, "_parent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_splitViewControllerEnforcingClass:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "_shouldUseFluidSidebarGestures")
      && (objc_msgSend(v14, "_fluidOpenSidebarPresentationGestureRecognizer"),
          v15 = (_QWORD *)objc_claimAutoreleasedReturnValue(),
          v15,
          v15 == v7)
      || +[_UIPassthroughScrollInteraction _isPassthroughGestureRecognizer:](_UIPassthroughScrollInteraction, "_isPassthroughGestureRecognizer:", v7))
    {
      v11 = 0;
    }
    else if (v7)
    {
      v11 = (v7[1] & 0x800000000000000) == 0;
    }
    else
    {
      v11 = 1;
    }

  }
LABEL_5:

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return self->_edgePanRecognizer == a3
      && +[_UIPassthroughScrollInteraction _isPassthroughGestureRecognizer:](_UIPassthroughScrollInteraction, "_isPassthroughGestureRecognizer:", a4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (id)gestureRecognizerView
{
  void *v2;
  void *v3;

  -[_UINavigationInteractiveTransitionBase _parent](self, "_parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)startInteractiveTransition
{
  uint64_t v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->super.__parent);
  objc_msgSend(WeakRetained, "setInteractiveTransition:", 1);
  v2 = objc_msgSend(WeakRetained, "_shouldIgnoreDelegateTransitionController");
  objc_msgSend(WeakRetained, "_setShouldIgnoreDelegateTransitionController:", 1);
  v3 = (id)objc_msgSend(WeakRetained, "popViewControllerAnimated:", 1);
  objc_msgSend(WeakRetained, "_setShouldIgnoreDelegateTransitionController:", v2);

}

- (void)setNotInteractiveTransition
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->super.__parent);
  objc_msgSend(WeakRetained, "setInteractiveTransition:", 0);

}

@end
