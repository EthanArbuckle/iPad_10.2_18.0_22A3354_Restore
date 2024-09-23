@implementation _UIViewControllerTransitionConductor

- (_UIViewControllerTransitionConductor)initWithDelegate:(id)a3 transitionManager:(id)a4
{
  id v6;
  id v7;
  _UIViewControllerTransitionConductor *v8;
  _UIViewControllerTransitionConductor *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIViewControllerTransitionConductor;
  v8 = -[_UIViewControllerTransitionConductor init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_transitionManager, a4);
  }

  return v9;
}

- (int64_t)navigationBarTransitionVariant
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UIViewControllerAnimatedTransitioning _navigationBarTransitionVariant](self->_transitionController, "_navigationBarTransitionVariant");
  else
    return -[_UIViewControllerTransitionConductor shouldCrossFadeNavigationBar](self, "shouldCrossFadeNavigationBar");
}

- (id)navigationBarTransitionOverlay
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIViewControllerAnimatedTransitioning _navigationBarTransitionOverlay](self->_transitionController, "_navigationBarTransitionOverlay");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)navigationToolbarTransitionController
{
  void *v3;
  void *v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:](_UIViewControllerTransitionContext, "_associatedTransitionContextForAnimationController:", self->_transitionController);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewControllerAnimatedTransitioning _navigationToolbarTransitionControllerForContext:](self->_transitionController, "_navigationToolbarTransitionControllerForContext:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)shouldCrossFadeNavigationBar
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UIViewControllerAnimatedTransitioning _shouldCrossFadeNavigationBar](self->_transitionController, "_shouldCrossFadeNavigationBar");
  else
    return 0;
}

- (BOOL)shouldCrossFadeNavigationBarVisibility
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UIViewControllerAnimatedTransitioning _shouldCrossFadeNavigationBarVisibility](self->_transitionController, "_shouldCrossFadeNavigationBarVisibility");
  else
    return 0;
}

- (BOOL)shouldCrossFadeBottomBars
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UIViewControllerAnimatedTransitioning _shouldCrossFadeBottomBars](self->_transitionController, "_shouldCrossFadeBottomBars");
  else
    return 0;
}

- (BOOL)shouldAnimateBottomBarVisibility
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UIViewControllerAnimatedTransitioning _shouldAnimateBottomBarVisibility](self->_transitionController, "_shouldAnimateBottomBarVisibility");
  else
    return 1;
}

- (UIViewControllerTransitionCoordinator)transitionCoordinator
{
  void *v2;
  void *v3;

  -[_UIViewControllerTransitionConductor transitionContext](self, "transitionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_transitionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewControllerTransitionCoordinator *)v3;
}

- (_UIViewControllerOneToOneTransitionContext)transitionContext
{
  return (_UIViewControllerOneToOneTransitionContext *)+[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:](_UIViewControllerTransitionContext, "_associatedTransitionContextForAnimationController:", self->_transitionController);
}

- (BOOL)willPerformCustomTransition
{
  return self->_transitionController != 0;
}

- (BOOL)hasInterruptibleNavigationTransition
{
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UIViewControllerAnimatedTransitioning _shouldUseInterruptibleAnimator](self->_transitionController, "_shouldUseInterruptibleAnimator");
  return 1;
}

- (id)interruptibleNavigationTransitionAnimator
{
  UIViewControllerAnimatedTransitioning *transitionController;
  void *v4;
  void *v5;

  if (-[_UIViewControllerTransitionConductor hasInterruptibleNavigationTransition](self, "hasInterruptibleNavigationTransition"))
  {
    transitionController = self->_transitionController;
    -[_UIViewControllerTransitionConductor transitionContext](self, "transitionContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewControllerAnimatedTransitioning interruptibleAnimatorForTransition:](transitionController, "interruptibleAnimatorForTransition:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setNeedsDeferredTransition
{
  self->_needsDeferredTransition = 1;
}

- (void)startDeferredTransitionIfNeeded
{
  _BOOL4 v3;
  void *v4;
  id WeakRetained;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  uint64_t v13;
  void *v14;
  _UIViewControllerAnimatedTransitionHandoffData *pendingPreemptionHandoffData;
  id v16;
  _DWORD *v17;
  unsigned int v18;
  void *v19;
  UIViewControllerAnimatedTransitioning *transitionController;
  id v21;
  id v22;
  id v23;
  int v24;
  void *v25;
  void *v26;
  char v27;
  int has_internal_diagnostics;
  void *v29;
  void *v30;
  char isKindOfClass;
  NSObject *v32;
  NSObject *v33;
  unint64_t v34;
  NSObject *v35;
  unint64_t v36;
  NSObject *v37;
  uint8_t v38[16];
  uint8_t v39[16];
  uint8_t buf[16];
  uint8_t v41[16];

  v3 = -[_UIViewControllerTransitionConductor needsDeferredTransition](self, "needsDeferredTransition");
  if (!self->_transitionController)
  {
    -[_UIViewControllerTransitionConductor setInteractiveTransition:](self, "setInteractiveTransition:", 0);
    v4 = 0;
    if (v3)
      goto LABEL_3;
LABEL_9:
    v8 = 0;
    v6 = 0;
    goto LABEL_17;
  }
  -[_UIViewControllerTransitionConductor transitionContext](self, "transitionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_9;
LABEL_3:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "disappearingViewControllerForTransitionConductor:", self);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v7, "topViewControllerForTransitionConductor:", self);
  v8 = objc_claimAutoreleasedReturnValue();

  if (!(v6 | v8) || v6 != v8)
  {
    if (v6 | v8)
    {
      v12 = 1;
      if (!v4)
        goto LABEL_12;
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  objc_msgSend((id)v6, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewControllerTransitionConductor transitionContainerView](self, "transitionContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isDescendantOfView:", v10);

  if ((v11 & 1) != 0)
  {
LABEL_16:
    -[_UIViewControllerTransitionConductor setNeedsDeferredTransition:](self, "setNeedsDeferredTransition:", 0);
LABEL_17:
    v12 = 0;
    if (!v4)
      goto LABEL_12;
LABEL_18:
    v13 = objc_msgSend(v4, "_state");
    if (!v12)
      goto LABEL_13;
    goto LABEL_19;
  }
  v12 = 1;
  v8 = v6;
  if (v4)
    goto LABEL_18;
LABEL_12:
  v13 = 0;
  if (!v12)
  {
LABEL_13:
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v14, "transitionConductor:didStartDeferredTransition:context:", self, 0, v4);
    goto LABEL_14;
  }
LABEL_19:
  -[_UIViewControllerTransitionConductor setNeedsDeferredTransition:](self, "setNeedsDeferredTransition:", 0);
  v16 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v16, "transitionConductor:willTransitionFromViewController:toViewController:", self, v6, v8);

  if (self->_transitionController
    && v6
    && v8
    && v8 != v6
    && (v17 = objc_loadWeakRetained((id *)&self->_delegate)) != 0
    && (v18 = ((v17[92] >> 1) & 3) - 1, v17, v18 < 2))
  {
    -[_UIViewControllerTransitionConductor _startCustomTransition:](self, "_startCustomTransition:", self->_transitionController);
  }
  else
  {
    -[_UIViewControllerTransitionConductor transitionContext](self, "transitionContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_setInteractor:", 0);
    objc_msgSend(v19, "_setAnimator:", 0);
    transitionController = self->_transitionController;
    self->_transitionController = 0;

    v21 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v21, "transitionConductorWillStartImmediateTransition:", self);

    -[_UIViewControllerTransitionConductor _startTransition:fromViewController:toViewController:](self, "_startTransition:fromViewController:toViewController:", -[_UIViewControllerTransitionConductor deferredTransitionType](self, "deferredTransitionType"), v6, v8);
    v22 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v22, "transitionConductorDidStartImmediateTransition:", self);

  }
  v23 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v23, "transitionConductor:didStartDeferredTransition:context:", self, 1, v4);

  if (v13 == 3)
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    -[_UIViewControllerTransitionConductor interactiveTransitionController](self, "interactiveTransitionController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (has_internal_diagnostics)
    {
      if (!v29)
      {
        __UIFaultDebugAssertLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v39 = 0;
          _os_log_fault_impl(&dword_185066000, v33, OS_LOG_TYPE_FAULT, "We should only get in the deferred state if interaction controller is present", v39, 2u);
        }

      }
    }
    else if (!v29)
    {
      v36 = qword_1ECD804D0;
      if (!qword_1ECD804D0)
      {
        v36 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v36, (unint64_t *)&qword_1ECD804D0);
      }
      v37 = *(NSObject **)(v36 + 8);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v38 = 0;
        _os_log_impl(&dword_185066000, v37, OS_LOG_TYPE_ERROR, "We should only get in the deferred state if interaction controller is present", v38, 2u);
      }
    }
    -[_UIViewControllerTransitionConductor interactiveTransitionController](self, "interactiveTransitionController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(v4, "finishInteractiveTransition");
      goto LABEL_15;
    }
    -[_UIViewControllerTransitionConductor interactiveTransitionController](self, "interactiveTransitionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "finishInteractiveTransition");
  }
  else
  {
    if (v13 != 2)
      goto LABEL_15;
    v24 = os_variant_has_internal_diagnostics();
    -[_UIViewControllerTransitionConductor interactiveTransitionController](self, "interactiveTransitionController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      if (!v25)
      {
        __UIFaultDebugAssertLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v41 = 0;
          _os_log_fault_impl(&dword_185066000, v32, OS_LOG_TYPE_FAULT, "We should only get in the deferred state if interaction controller is present", v41, 2u);
        }

      }
    }
    else if (!v25)
    {
      v34 = _MergedGlobals_1225;
      if (!_MergedGlobals_1225)
      {
        v34 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v34, (unint64_t *)&_MergedGlobals_1225);
      }
      v35 = *(NSObject **)(v34 + 8);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v35, OS_LOG_TYPE_ERROR, "We should only get in the deferred state if interaction controller is present", buf, 2u);
      }
    }
    -[_UIViewControllerTransitionConductor interactiveTransitionController](self, "interactiveTransitionController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v27 = objc_opt_isKindOfClass();

    if ((v27 & 1) == 0)
    {
      objc_msgSend(v4, "cancelInteractiveTransition");
      goto LABEL_15;
    }
    -[_UIViewControllerTransitionConductor interactiveTransitionController](self, "interactiveTransitionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cancelInteractiveTransition");
  }
LABEL_14:

LABEL_15:
  pendingPreemptionHandoffData = self->_pendingPreemptionHandoffData;
  self->_pendingPreemptionHandoffData = 0;

}

- (void)_beginAnimationTrackingInteractive:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;

  v3 = a3;
  if (+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators](UIViewPropertyAnimator, "_canEnableTrackingAnimationsWithAnimators"))
  {
    if (!+[UIViewPropertyAnimator _trackingAnimationsCurrentlyEnabled](UIViewPropertyAnimator, "_trackingAnimationsCurrentlyEnabled"))
    {
      v4 = +[UIViewPropertyAnimator _startTrackingAnimations](UIViewPropertyAnimator, "_startTrackingAnimations");
      +[UIViewPropertyAnimator _setTrackedAnimationsStartPaused:](UIViewPropertyAnimator, "_setTrackedAnimationsStartPaused:", v3);
    }
  }
  else
  {
    v5 = +[UIView _startAnimationTracking](UIView, "_startAnimationTracking");
  }
}

- (void)_finishAnimationTracking
{
  if (+[UIViewPropertyAnimator _trackingAnimationsCurrentlyEnabled](UIViewPropertyAnimator, "_trackingAnimationsCurrentlyEnabled"))
  {
    +[UIViewPropertyAnimator _finishTrackingAnimations](UIViewPropertyAnimator, "_finishTrackingAnimations");
  }
  else
  {
    +[UIView _finishAnimationTracking](UIView, "_finishAnimationTracking");
  }
}

- (void)_startTransition:(int)a3 fromViewController:(id)a4 toViewController:(id)a5
{
  uint64_t v6;
  id v8;
  id WeakRetained;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
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
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  id v75;

  v6 = *(_QWORD *)&a3;
  v75 = a4;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "topViewControllerForTransitionConductor:", self);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v8)
  {
    v11 = v10;

    v8 = v11;
  }
  v12 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v12, "transitionConductor:frameForViewController:", self, v8);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v21, "transitionConductor:frameForWrapperViewForViewController:", self, v8);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  objc_msgSend(v8, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "childModalViewController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31
    || (+[UIViewControllerWrapperView existingWrapperViewForView:]((uint64_t)UIViewControllerWrapperView, v30), (v32 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[UIViewControllerWrapperView wrapperViewForView:wrapperFrame:viewFrame:](v23, v25, v27, v29, v14, v16, v18, v20, (uint64_t)UIViewControllerWrapperView, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v33, "transitionConductor:retargetedToViewControllerForTransitionFromViewController:toViewController:transition:", self, v75, v8, v6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30
    || (objc_msgSend(v34, "view"), v35 = (void *)objc_claimAutoreleasedReturnValue(), v35, v30 != v35))
  {
    objc_msgSend(v34, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v37, "transitionConductor:frameForViewController:", self, v34);
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;

    v46 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v46, "transitionConductor:frameForWrapperViewForViewController:", self, v34);
    v48 = v47;
    v50 = v49;
    v52 = v51;
    v54 = v53;

    +[UIViewControllerWrapperView wrapperViewForView:wrapperFrame:viewFrame:](v48, v50, v52, v54, v39, v41, v43, v45, (uint64_t)UIViewControllerWrapperView, v36);
    v55 = objc_claimAutoreleasedReturnValue();

    v32 = (void *)v55;
    v30 = v36;
  }
  v56 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v56, "navigationTransitionView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v75, "view");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIViewControllerWrapperView existingWrapperViewForView:]((uint64_t)UIViewControllerWrapperView, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v59;
    v73 = v10;
    v61 = v6;
    if (v59)
    {
      v62 = v59;
    }
    else
    {
      objc_msgSend(v75, "view");
      v62 = (id)objc_claimAutoreleasedReturnValue();
    }
    v65 = v62;

    objc_msgSend(v65, "superview");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (v66 == v57)
      v67 = v65;
    else
      v67 = 0;
    v68 = v67;

    if (!v68)
    {
      objc_msgSend(v57, "subviews");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "lastObject");
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      if (v70 == v32 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        v65 = 0;
      else
        v65 = v70;

    }
    objc_msgSend(v57, "addSubview:", v32, v73);
    v71 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v71, "transitionConductor:beginPinningInputViewsForTransitionFromViewController:toViewController:forTransitionType:", self, v75, v34, v61);

    v72 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v72, "transitionConductor:didEndTransitionFromView:toView:", self, v65, v32);

    v10 = v74;
  }
  else
  {
    objc_msgSend(v75, "view");
    v63 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "subviews");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "makeObjectsPerformSelector:", sel_removeFromSuperview);

    v65 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v65, "transitionConductor:didEndTransitionFromView:toView:", self, v63, 0);
  }

}

- (void)_startCustomTransition:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  void *v35;
  uint64_t v36;
  int v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  _UIViewControllerTransitionRequest *v44;
  id v45;
  _UIViewControllerTransitionRequest *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  _QWORD v55[5];
  id v56;
  id v57;
  int v58;
  id location;
  _QWORD aBlock[5];
  _QWORD v61[6];
  CGRect v62;
  CGRect v63;

  v54 = a3;
  +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:](_UIViewControllerTransitionContext, "_associatedTransitionContextForAnimationController:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fromViewController");
  v7 = objc_claimAutoreleasedReturnValue();
  -[_UIViewControllerTransitionConductor interactiveTransitionController](self, "interactiveTransitionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewControllerTransitionConductor customNavigationTransitionDuration](self, "customNavigationTransitionDuration");
  objc_msgSend(v5, "_setDuration:");
  v9 = -[_UIViewControllerTransitionConductor isInteractiveTransition](self, "isInteractiveTransition");
  if ((v9 & 1) == 0 && v8)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = objc_msgSend(v8, "wantsInteractiveStart");
    else
      v9 = 1;
  }
  -[_UIViewControllerTransitionConductor setInteractiveTransition:](self, "setInteractiveTransition:", v9);
  v52 = (void *)v7;
  if (!v7 || !v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIViewControllerTransitionConductor.m"), 365, CFSTR("custom transitions require both a fromViewController and toViewController!"));

  }
  objc_msgSend(v6, "view");
  v10 = objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "transitionConductor:frameForViewController:", self, v6);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v51 = (void *)v10;
  objc_msgSend((id)v10, "setFrame:", v13, v15, v17, v19);
  v20 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v20, "transitionConductor:didStartCustomTransitionWithContext:", self, v5);

  v21 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v21, "transitionConductor:frameForViewController:", self, v6);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  objc_msgSend(v6, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "frame");
  v63.origin.x = v31;
  v63.origin.y = v32;
  v63.size.width = v33;
  v63.size.height = v34;
  v62.origin.x = v23;
  v62.origin.y = v25;
  v62.size.width = v27;
  v62.size.height = v29;
  LOBYTE(v10) = CGRectEqualToRect(v62, v63);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v6, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFrame:", v23, v25, v27, v29);

  }
  objc_msgSend(v5, "_setToEndFrame:", v23, v25, v27, v29);
  v36 = MEMORY[0x1E0C809B0];
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __63___UIViewControllerTransitionConductor__startCustomTransition___block_invoke;
  v61[3] = &unk_1E16C2C08;
  v61[4] = self;
  objc_msgSend(v5, "_setCompletionHandler:", v61);
  aBlock[0] = v36;
  aBlock[1] = 3221225472;
  aBlock[2] = __63___UIViewControllerTransitionConductor__startCustomTransition___block_invoke_2;
  aBlock[3] = &unk_1E16E2E38;
  aBlock[4] = self;
  v53 = _Block_copy(aBlock);
  if (v8)
    -[_UIViewControllerTransitionConductor _beginAnimationTrackingInteractive:](self, "_beginAnimationTrackingInteractive:", v9);
  v37 = -[_UIViewControllerTransitionConductor deferredTransitionType](self, "deferredTransitionType");
  v38 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v38, "navigationTransitionView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v39, "inputViewAnimationStyleForTransitionConductor:", self);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v55[0] = v36;
  v55[1] = 3221225472;
  v55[2] = __63___UIViewControllerTransitionConductor__startCustomTransition___block_invoke_3;
  v55[3] = &unk_1E16E2B68;
  v55[4] = self;
  v41 = v52;
  v56 = v41;
  v42 = v6;
  v57 = v42;
  v58 = v37;
  v43 = _Block_copy(v55);
  v44 = [_UIViewControllerTransitionRequest alloc];
  v45 = objc_loadWeakRetained((id *)&self->_delegate);
  v46 = -[_UIViewControllerTransitionRequest initWithTransitionContext:animator:interactor:interactiveUpdateHandler:keyboardShouldAnimateAlongsideForInteractiveTransitions:keyboardAnimationStyle:pinningInputViewsResponder:extraPinningInputViewsBlock:handoffData:](v44, "initWithTransitionContext:animator:interactor:interactiveUpdateHandler:keyboardShouldAnimateAlongsideForInteractiveTransitions:keyboardAnimationStyle:pinningInputViewsResponder:extraPinningInputViewsBlock:handoffData:", v5, v54, v8, v53, 1, v40, v45, v43, self->_pendingPreemptionHandoffData);

  -[_UIViewControllerTransitionConductor transitionManager](self, "transitionManager");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    -[_UIViewControllerTransitionConductor transitionManager](self, "transitionManager");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "performAnimatedTransitionWithRequest:", v46);

  }
  else
  {
    _UIViewControllerTransitioningRunCustomTransitionWithRequest(v46);
  }
  if (v8)
    -[_UIViewControllerTransitionConductor _finishAnimationTracking](self, "_finishAnimationTracking");
  objc_msgSend(v5, "_setTransitionIsInFlight:", 1);

  objc_destroyWeak(&location);
}

- (void)stopTransitionsImmediately
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIViewControllerAnimatedTransitioning _stopTransitionImmediately](self->_transitionController, "_stopTransitionImmediately");
}

- (_UIViewControllerTransitionConductorDelegate)delegate
{
  return (_UIViewControllerTransitionConductorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIViewControllerAnimatedTransitioning)transitionController
{
  return self->_transitionController;
}

- (void)setTransitionController:(id)a3
{
  objc_storeStrong((id *)&self->_transitionController, a3);
}

- (UIViewControllerInteractiveTransitioning)interactiveTransitionController
{
  return self->_interactiveTransitionController;
}

- (void)setInteractiveTransitionController:(id)a3
{
  objc_storeStrong((id *)&self->_interactiveTransitionController, a3);
}

- (BOOL)needsDeferredTransition
{
  return self->_needsDeferredTransition;
}

- (void)setNeedsDeferredTransition:(BOOL)a3
{
  self->_needsDeferredTransition = a3;
}

- (BOOL)hostIsAppearingAnimated
{
  return self->_hostIsAppearingAnimated;
}

- (void)setHostIsAppearingAnimated:(BOOL)a3
{
  self->_hostIsAppearingAnimated = a3;
}

- (int)deferredTransitionType
{
  return self->_deferredTransitionType;
}

- (void)setDeferredTransitionType:(int)a3
{
  self->_deferredTransitionType = a3;
}

- (double)customNavigationTransitionDuration
{
  return self->_customNavigationTransitionDuration;
}

- (void)setCustomNavigationTransitionDuration:(double)a3
{
  self->_customNavigationTransitionDuration = a3;
}

- (BOOL)isInteractiveTransition
{
  return self->_interactiveTransition;
}

- (void)setInteractiveTransition:(BOOL)a3
{
  self->_interactiveTransition = a3;
}

- (UIView)transitionContainerView
{
  return self->_transitionContainerView;
}

- (void)setTransitionContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContainerView, a3);
}

- (_UIViewControllerAnimatedTransitionHandoffData)pendingPreemptionHandoffData
{
  return self->_pendingPreemptionHandoffData;
}

- (void)setPendingPreemptionHandoffData:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPreemptionHandoffData, a3);
}

- (_UIViewControllerTransitionManager)transitionManager
{
  return self->_transitionManager;
}

- (void)setTransitionManager:(id)a3
{
  objc_storeStrong((id *)&self->_transitionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionManager, 0);
  objc_storeStrong((id *)&self->_pendingPreemptionHandoffData, 0);
  objc_storeStrong((id *)&self->_transitionContainerView, 0);
  objc_storeStrong((id *)&self->_interactiveTransitionController, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
