@implementation SBNestingViewController

- (SBNestingViewController)nestedViewController
{
  return self->_nestedViewController;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)pushNestedViewController:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, _QWORD);
  void *v9;
  uint64_t v10;
  void *v11;
  SBNestingViewController *v12;
  SBNestingViewController *v13;
  id v14;
  id v15;

  v6 = a4;
  v15 = a3;
  v8 = (void (**)(id, _QWORD))a5;
  -[SBNestingViewController parentNestingViewController](self, "parentNestingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Cannot modify the nested view controller stack via a non-root view controller"), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  if (-[SBNestingViewController isTransitioning](self, "isTransitioning"))
  {
    if (v8)
      v8[2](v8, 0);
  }
  else
  {
    -[SBNestingViewController deepestNestedDescendantViewController](self, "deepestNestedDescendantViewController");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (SBNestingViewController *)v10;
    else
      v12 = self;
    v13 = v12;

    -[SBNestingViewController _performOperation:onViewController:animated:withCompletion:](v13, "_performOperation:onViewController:animated:withCompletion:", 1, v15, v6, v8);
  }

}

- (SBNestingViewController)parentNestingViewController
{
  return (SBNestingViewController *)objc_loadWeakRetained((id *)&self->_parentNestingViewController);
}

- (SBNestingViewController)deepestNestedDescendantViewController
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__22;
  v9 = __Block_byref_object_dispose__22;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__SBNestingViewController_deepestNestedDescendantViewController__block_invoke;
  v4[3] = &unk_1E8D8DC38;
  v4[4] = &v5;
  -[SBNestingViewController traverseNestedViewControllersWithBlock:](self, "traverseNestedViewControllersWithBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SBNestingViewController *)v2;
}

- (SBNestingViewControllerDelegate)delegate
{
  return (SBNestingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)nestingViewController:(id)a3 animationControllerForOperation:(int64_t)a4 onViewController:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  SBNestingViewController *v12;
  void *v13;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  -[SBNestingViewController delegate](self, "delegate");
  v12 = (SBNestingViewController *)objc_claimAutoreleasedReturnValue();
  if (v12 == self || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v13 = 0;
  }
  else
  {
    -[SBNestingViewController nestingViewController:animationControllerForOperation:onViewController:animated:](v12, "nestingViewController:animationControllerForOperation:onViewController:animated:", v10, a4, v11, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)transitionWillFinish:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  -[SBNestingViewController currentTransition](self, "currentTransition");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[SBNestingViewController nestedViewController](self, "nestedViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SBNestingViewController _setFinalStateForTransitioningViewController:](self, "_setFinalStateForTransitioningViewController:", v6);

  }
}

- (void)transitionDidFinish:(id)a3
{
  id v4;
  int v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[SBNestingViewController currentTransition](self, "currentTransition");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v7)
  {
    -[SBNestingViewController setCurrentTransitionOperation:](self, "setCurrentTransitionOperation:", 0);
    objc_msgSend(v7, "setDelegate:", 0);
    -[SBNestingViewController setCurrentTransition:](self, "setCurrentTransition:", 0);
    v5 = objc_msgSend(v7, "transitionWasCancelled");
    -[SBNestingViewController clientOperationCompletion](self, "clientOperationCompletion");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[SBNestingViewController setClientOperationCompletion:](self, "setClientOperationCompletion:", 0);
      v6[2](v6, v5 ^ 1u);
    }

  }
}

- (void)nestingViewController:(id)a3 willPerformOperation:(int64_t)a4 onViewController:(id)a5 withTransitionCoordinator:(id)a6
{
  id v10;
  id v11;
  id v12;
  SBNestingViewController *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  SBNestingViewController *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[SBNestingViewController delegate](self, "delegate");
  v13 = (SBNestingViewController *)objc_claimAutoreleasedReturnValue();
  if (v13 != self && (objc_opt_respondsToSelector() & 1) != 0)
    -[SBNestingViewController nestingViewController:willPerformOperation:onViewController:withTransitionCoordinator:](v13, "nestingViewController:willPerformOperation:onViewController:withTransitionCoordinator:", v10, a4, v11, v12);
  v21 = v13;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[SBNestingViewController transitionObservers](self, "transitionObservers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        v20 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * v19);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v20, "nestingViewController:willPerformOperation:onViewController:withTransitionCoordinator:", v10, a4, v11, v12);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v17);
  }

}

- (NSHashTable)transitionObservers
{
  return self->_transitionObservers;
}

- (id)clientOperationCompletion
{
  return self->_clientOperationCompletion;
}

- (void)_setFinalStateForTransitioningViewController:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = -[SBNestingViewController _shouldAddTransitioningViewControllerAfterCurrentTransitionCompletes](self, "_shouldAddTransitioningViewControllerAfterCurrentTransitionCompletes");
  objc_msgSend(v9, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBNestingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isDescendantOfView:", v6);

  if (v4)
  {
    if ((v7 & 1) == 0)
      -[SBNestingViewController addViewToHierarchyForNestedViewController:](self, "addViewToHierarchyForNestedViewController:", v9);
    objc_msgSend(v9, "endAppearanceTransition");
    -[SBNestingViewController _handleAddChildViewController:](self, "_handleAddChildViewController:", v9);
    -[SBNestingViewController currentTransition](self, "currentTransition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "transitionWasCancelled") & 1) != 0)
      objc_msgSend(v8, "initialFrameForViewController:", v9);
    else
      objc_msgSend(v8, "finalFrameForViewController:", v9);
    objc_msgSend(v5, "setFrame:");

  }
  else
  {
    if (v7)
      -[SBNestingViewController removeViewFromHierarchyForNestedViewController:](self, "removeViewFromHierarchyForNestedViewController:", v9);
    objc_msgSend(v9, "endAppearanceTransition");
    -[SBNestingViewController _handleRemoveChildViewController:](self, "_handleRemoveChildViewController:", v9);
    objc_msgSend(v9, "setDelegate:", 0);
    objc_msgSend(v9, "setParentNestingViewController:", 0);
    -[SBNestingViewController setNestedViewController:](self, "setNestedViewController:", 0);
  }

}

- (BOOL)_shouldAddTransitioningViewControllerAfterCurrentTransitionCompletes
{
  void *v3;
  char v4;
  int64_t v5;

  -[SBNestingViewController currentTransition](self, "currentTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "transitionWasCancelled");

  v5 = -[SBNestingViewController currentTransitionOperation](self, "currentTransitionOperation");
  if ((v4 & 1) != 0 || v5 != 1)
  {
    if (v5 == 2)
      LOBYTE(v5) = v4;
    else
      LOBYTE(v5) = 0;
  }
  return v5;
}

- (SBViewControllerTransitionContext)currentTransition
{
  return self->_currentTransition;
}

- (BOOL)isTransitioning
{
  void *v2;
  BOOL v3;

  -[SBNestingViewController viewControllerCurrentlyDrivingTransition](self, "viewControllerCurrentlyDrivingTransition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (SBNestingViewController)viewControllerCurrentlyDrivingTransition
{
  SBNestingViewController *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  SBNestingViewController *v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__22;
  v12 = __Block_byref_object_dispose__22;
  if (-[SBNestingViewController currentTransitionOperation](self, "currentTransitionOperation"))
    v3 = self;
  else
    v3 = 0;
  v13 = v3;
  v4 = (void *)v9[5];
  if (!v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__SBNestingViewController_viewControllerCurrentlyDrivingTransition__block_invoke;
    v7[3] = &unk_1E8D8DC38;
    v7[4] = &v8;
    -[SBNestingViewController traverseNestedViewControllersWithBlock:](self, "traverseNestedViewControllersWithBlock:", v7);
    v4 = (void *)v9[5];
  }
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  return (SBNestingViewController *)v5;
}

- (int64_t)currentTransitionOperation
{
  return self->_currentTransitionOperation;
}

- (void)traverseNestedViewControllersWithBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;

  v4 = (void (**)(id, void *, _BYTE *))a3;
  v8 = 0;
  -[SBNestingViewController nestedViewController](self, "nestedViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      v4[2](v4, v6, &v8);
      if (v8)
        break;
      objc_msgSend(v6, "nestedViewController");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    while (v7);

  }
}

- (void)_performOperation:(int64_t)a3 onViewController:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL8 v7;
  SBNestingViewController *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  SBViewControllerTransitionContext *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
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
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  SBViewControllerTransitionContext *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  SBNestingViewController *v45;
  void *v46;
  void *v47;
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
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  _QWORD v78[4];
  id v79;

  v7 = a5;
  v10 = (SBNestingViewController *)a4;
  v11 = a6;
  v12 = v11;
  if (a3)
  {
    if (a3 == 1 && -[SBNestingViewController wantsModalPresentation](v10, "wantsModalPresentation"))
    {
      -[SBNestingViewController setDelegate:](v10, "setDelegate:", self);
      -[SBNestingViewController setParentNestingViewController:](v10, "setParentNestingViewController:", self);
      -[SBNestingViewController nestingViewController:willPresentViewController:](self, "nestingViewController:willPresentViewController:", self, v10);
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __86__SBNestingViewController__performOperation_onViewController_animated_withCompletion___block_invoke;
      v78[3] = &unk_1E8D859C0;
      v79 = v12;
      -[SBNestingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, v7, v78);

    }
    else
    {
      -[SBNestingViewController nestingViewController:animationControllerForOperation:onViewController:animated:](self, "nestingViewController:animationControllerForOperation:onViewController:animated:", self, a3, v10, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      if (v13 && v7)
      {
        -[SBNestingViewController nestingViewController:interactionControllerForAnimationController:](self, "nestingViewController:interactionControllerForAnimationController:", self, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = objc_alloc_init(SBViewControllerTransitionContext);
      -[SBViewControllerTransitionContext setDelegate:](v15, "setDelegate:", self);
      -[SBNestingViewController view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBViewControllerTransitionContext setContainerView:](v15, "setContainerView:", v16);

      -[SBViewControllerTransitionContext setWantsAnimation:](v15, "setWantsAnimation:", v7);
      -[SBViewControllerTransitionContext setAnimator:](v15, "setAnimator:", v13);
      -[SBViewControllerTransitionContext setInteractor:](v15, "setInteractor:", v14);
      v17 = *MEMORY[0x1E0DC55B8];
      if (a3 == 1)
      {
        -[SBViewControllerTransitionContext setViewController:forKey:](v15, "setViewController:forKey:", self, v17);
        -[SBViewControllerTransitionContext setViewController:forKey:](v15, "setViewController:forKey:", v10, *MEMORY[0x1E0DC55C8]);
        -[SBNestingViewController view](v10, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBViewControllerTransitionContext setView:forKey:](v15, "setView:forKey:", v18, *MEMORY[0x1E0DC55D0]);

        -[SBNestingViewController view](self, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "bounds");
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;

        -[SBNestingViewController frameForNestedViewController:afterOperation:withParentContainerSize:](self, "frameForNestedViewController:afterOperation:withParentContainerSize:", v10, 2, v25, v27);
        v74 = v29;
        v76 = v28;
        v70 = v31;
        v72 = v30;
        -[SBNestingViewController frameForNestedViewController:afterOperation:withParentContainerSize:](self, "frameForNestedViewController:afterOperation:withParentContainerSize:", v10, 1, v25, v27);
        v33 = v32;
        v35 = v34;
        v37 = v36;
        v39 = v38;
        -[SBViewControllerTransitionContext setInitialFrame:forViewController:](v15, "setInitialFrame:forViewController:", self, v21, v23, v25, v27);
        -[SBViewControllerTransitionContext setFinalFrame:forViewController:](v15, "setFinalFrame:forViewController:", self, v21, v23, v25, v27);
        -[SBViewControllerTransitionContext setInitialFrame:forViewController:](v15, "setInitialFrame:forViewController:", v10, v76, v74, v72, v70);
        v40 = v15;
        v41 = v33;
        v42 = v35;
        v43 = v37;
        v44 = v39;
        v45 = v10;
      }
      else
      {
        -[SBViewControllerTransitionContext setViewController:forKey:](v15, "setViewController:forKey:", v10, v17);
        -[SBViewControllerTransitionContext setViewController:forKey:](v15, "setViewController:forKey:", self, *MEMORY[0x1E0DC55C8]);
        -[SBNestingViewController view](v10, "view");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBViewControllerTransitionContext setView:forKey:](v15, "setView:forKey:", v46, *MEMORY[0x1E0DC55C0]);

        -[SBNestingViewController view](self, "view");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "bounds");
        v75 = v49;
        v77 = v48;
        v51 = v50;
        v53 = v52;

        -[SBNestingViewController frameForNestedViewController:afterOperation:withParentContainerSize:](self, "frameForNestedViewController:afterOperation:withParentContainerSize:", v10, 1, v51, v53);
        v71 = v55;
        v73 = v54;
        v57 = v56;
        v59 = v58;
        -[SBNestingViewController frameForNestedViewController:afterOperation:withParentContainerSize:](self, "frameForNestedViewController:afterOperation:withParentContainerSize:", v10, 2, v51, v53);
        v61 = v60;
        v63 = v62;
        v65 = v64;
        v67 = v66;
        -[SBViewControllerTransitionContext setInitialFrame:forViewController:](v15, "setInitialFrame:forViewController:", v10, v73, v71, v57, v59);
        -[SBViewControllerTransitionContext setFinalFrame:forViewController:](v15, "setFinalFrame:forViewController:", v10, v61, v63, v65, v67);
        -[SBViewControllerTransitionContext setInitialFrame:forViewController:](v15, "setInitialFrame:forViewController:", self, v77, v75, v51, v53);
        v40 = v15;
        v41 = v77;
        v42 = v75;
        v43 = v51;
        v44 = v53;
        v45 = self;
      }
      -[SBViewControllerTransitionContext setFinalFrame:forViewController:](v40, "setFinalFrame:forViewController:", v45, v41, v42, v43, v44);
      -[SBNestingViewController nestingViewController:willPerformOperation:onViewController:withTransitionCoordinator:](self, "nestingViewController:willPerformOperation:onViewController:withTransitionCoordinator:", self, a3, v10, v15);
      -[SBNestingViewController setCurrentTransitionOperation:](self, "setCurrentTransitionOperation:", a3);
      -[SBNestingViewController setCurrentTransition:](self, "setCurrentTransition:", v15);
      -[SBNestingViewController setClientOperationCompletion:](self, "setClientOperationCompletion:", v12);
      -[SBNestingViewController _updateStateForTransitioningViewController:](self, "_updateStateForTransitioningViewController:", v10);
      -[SBViewControllerTransitionContext finalFrameForViewController:](v15, "finalFrameForViewController:", v10);
      -[SBNestingViewController viewWillTransitionToSize:forOperation:withTransitionCoordinator:](v10, "viewWillTransitionToSize:forOperation:withTransitionCoordinator:", a3, v15, v68, v69);
      -[SBViewControllerTransitionContext startTransition](v15, "startTransition");

    }
  }
  else if (v11)
  {
    (*((void (**)(id, uint64_t))v11 + 2))(v11, 1);
  }

}

- (CGRect)frameForNestedViewController:(id)a3 afterOperation:(int64_t)a4 withParentContainerSize:(CGSize)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  if (a4 == 1)
  {
    BSRectWithSize();
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)setCurrentTransitionOperation:(int64_t)a3
{
  self->_currentTransitionOperation = a3;
}

- (void)setCurrentTransition:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransition, a3);
}

- (void)setClientOperationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (BOOL)wantsModalPresentation
{
  return 0;
}

- (void)_updateStateForTransitioningViewController:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[SBNestingViewController currentTransition](self, "currentTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAnimated");

  if (-[SBNestingViewController _shouldAddTransitioningViewControllerAfterCurrentTransitionCompletes](self, "_shouldAddTransitioningViewControllerAfterCurrentTransitionCompletes"))
  {
    -[SBNestingViewController _handleWillAddChildViewController:](self, "_handleWillAddChildViewController:", v6);
    objc_msgSend(v6, "beginAppearanceTransition:animated:", 1, v5);
    objc_msgSend(v6, "setDelegate:", self);
    objc_msgSend(v6, "setParentNestingViewController:", self);
    -[SBNestingViewController setNestedViewController:](self, "setNestedViewController:", v6);
  }
  else
  {
    -[SBNestingViewController _handleWillRemoveChildViewController:](self, "_handleWillRemoveChildViewController:", v6);
    objc_msgSend(v6, "beginAppearanceTransition:animated:", 0, v5);
  }

}

- (void)setParentNestingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentNestingViewController, a3);
}

- (void)setNestedViewController:(id)a3
{
  objc_storeStrong((id *)&self->_nestedViewController, a3);
}

- (void)_handleWillAddChildViewController:(id)a3
{
  SBNestingViewController *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "parentViewController");
  v4 = (SBNestingViewController *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
    objc_msgSend(v5, "willMoveToParentViewController:", self);
  else
    -[SBNestingViewController addChildViewController:](self, "addChildViewController:", v5);

}

- (void)_handleAddChildViewController:(id)a3
{
  objc_msgSend(a3, "didMoveToParentViewController:", self);
}

- (void)viewWillTransitionToSize:(CGSize)a3 forOperation:(int64_t)a4 withTransitionCoordinator:(id)a5
{
  double height;
  double width;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v19;

  height = a3.height;
  width = a3.width;
  v19 = a5;
  -[SBNestingViewController nestedViewController](self, "nestedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v13 = v12;
    v15 = v14;

    -[SBNestingViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v10, width, height);
    if (v13 != v17 || v15 != v16)
      objc_msgSend(v10, "viewWillTransitionToSize:forOperation:withTransitionCoordinator:", a4, v19);
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBNestingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SBNestingViewController *v4;
  uint64_t v5;
  NSHashTable *transitionObservers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBNestingViewController;
  v4 = -[SBNestingViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    transitionObservers = v4->_transitionObservers;
    v4->_transitionObservers = (NSHashTable *)v5;

  }
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBNestingViewController;
  -[SBNestingViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[SBNestingViewController nestedViewController](self, "nestedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endAppearanceTransition");

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBNestingViewController;
  -[SBNestingViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  -[SBNestingViewController nestedViewController](self, "nestedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginAppearanceTransition:animated:", 1, v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBNestingViewController;
  -[SBNestingViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  -[SBNestingViewController nestedViewController](self, "nestedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginAppearanceTransition:animated:", 0, v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBNestingViewController;
  -[SBNestingViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[SBNestingViewController nestedViewController](self, "nestedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endAppearanceTransition");

}

- (void)popNestedViewControllerAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  v11 = a4;
  -[SBNestingViewController parentNestingViewController](self, "parentNestingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Cannot modify the nested view controller stack via a non-root view controller"), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  if (!-[SBNestingViewController isTransitioning](self, "isTransitioning"))
  {
    -[SBNestingViewController deepestNestedDescendantViewController](self, "deepestNestedDescendantViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parentNestingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_performOperation:onViewController:animated:withCompletion:", 2, v8, v4, v11);

    goto LABEL_6;
  }
  v7 = v11;
  if (v11)
  {
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
LABEL_6:
    v7 = v11;
  }

}

- (void)setNestedViewControllers:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t i;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v22;
  _BOOL8 v23;
  BOOL v24;
  id v25;
  _QWORD v26[5];
  id v27;
  unint64_t v28;
  _QWORD v29[5];

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  -[SBNestingViewController parentNestingViewController](self, "parentNestingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Cannot modify the nested view controller stack via a non-root view controller"), 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
  if (!-[SBNestingViewController isTransitioning](self, "isTransitioning"))
  {
    -[SBNestingViewController nestedViewControllers](self, "nestedViewControllers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    v11 = objc_msgSend(v6, "count");
    if (v10 >= v11)
      v12 = v11;
    else
      v12 = v10;
    if (v12)
    {
      for (i = 0; i < v12; ++i)
      {
        objc_msgSend(v9, "objectAtIndex:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndex:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqual:", v15);

        if (!v16)
          v12 = i;
      }
    }
    v17 = objc_msgSend(v9, "count");
    v18 = MEMORY[0x1E0C809B0];
    v19 = v17 - v12;
    if (v17 == v12)
    {
      if (v12 >= objc_msgSend(v6, "count"))
      {
        if (v7)
          v7[2](v7, 1);
        goto LABEL_28;
      }
    }
    else
    {
      v20 = 1;
      do
      {
        v29[0] = v18;
        v29[1] = 3221225472;
        v29[2] = __67__SBNestingViewController_setNestedViewControllers_withCompletion___block_invoke_3;
        v29[3] = &unk_1E8D8DBC0;
        v29[4] = self;
        LODWORD(v17) = __67__SBNestingViewController_setNestedViewControllers_withCompletion___block_invoke(v17, v29);
        if (!(_DWORD)v17)
          break;
      }
      while (v20++ < v19);
      if (!(_DWORD)v17)
      {
        v23 = 0;
        if (!v7)
        {
LABEL_28:

          goto LABEL_29;
        }
LABEL_27:
        v7[2](v7, v23);
        goto LABEL_28;
      }
    }
    do
    {
      v22 = objc_msgSend(v6, "count");
      v23 = v12 >= v22;
      if (v12 >= v22)
        break;
      v26[0] = v18;
      v26[1] = 3221225472;
      v26[2] = __67__SBNestingViewController_setNestedViewControllers_withCompletion___block_invoke_4;
      v26[3] = &unk_1E8D8DBE8;
      v26[4] = self;
      v27 = v6;
      v28 = v12;
      v24 = __67__SBNestingViewController_setNestedViewControllers_withCompletion___block_invoke((uint64_t)v27, v26);

      ++v12;
    }
    while (v24);
    if (!v7)
      goto LABEL_28;
    goto LABEL_27;
  }
  if (v7)
    v7[2](v7, 0);
LABEL_29:

}

BOOL __67__SBNestingViewController_setNestedViewControllers_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  void (**v2)(id, _QWORD *);
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__SBNestingViewController_setNestedViewControllers_withCompletion___block_invoke_2;
  v5[3] = &unk_1E8D89C68;
  v5[4] = &v6;
  v2[2](v2, v5);
  v3 = *((_DWORD *)v7 + 6) == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __67__SBNestingViewController_setNestedViewControllers_withCompletion___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __67__SBNestingViewController_setNestedViewControllers_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "popNestedViewControllerAnimated:withCompletion:", 0, a2);
}

void __67__SBNestingViewController_setNestedViewControllers_withCompletion___block_invoke_4(_QWORD *a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v2 = (void *)a1[4];
  v3 = (void *)a1[5];
  v4 = a1[6];
  v5 = a2;
  objc_msgSend(v3, "objectAtIndex:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushNestedViewController:animated:withCompletion:", v6, 0, v5);

}

- (NSArray)nestedViewControllers
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SBNestingViewController_nestedViewControllers__block_invoke;
  v7[3] = &unk_1E8D8DC10;
  v8 = v3;
  v4 = v3;
  -[SBNestingViewController traverseNestedViewControllersWithBlock:](self, "traverseNestedViewControllersWithBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSArray *)v5;
}

uint64_t __48__SBNestingViewController_nestedViewControllers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __64__SBNestingViewController_deepestNestedDescendantViewController__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "nestedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (void)addTransitionObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBNestingViewController transitionObservers](self, "transitionObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeTransitionObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBNestingViewController transitionObservers](self, "transitionObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

void __67__SBNestingViewController_viewControllerCurrentlyDrivingTransition__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "currentTransitionOperation"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (void)addNestedViewController:(id)a3
{
  id v4;

  v4 = a3;
  -[SBNestingViewController _handleWillAddChildViewController:](self, "_handleWillAddChildViewController:", v4);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setParentNestingViewController:", self);

}

- (void)removeNestedViewController:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setDelegate:", 0);
  objc_msgSend(v4, "setParentNestingViewController:", 0);
  -[SBNestingViewController _handleRemoveChildViewController:](self, "_handleRemoveChildViewController:", v4);

}

- (void)addViewToHierarchyForNestedViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SBNestingViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addSubview:", v5);
}

- (void)removeViewFromHierarchyForNestedViewController:(id)a3
{
  id v3;

  objc_msgSend(a3, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SBNestingViewController frameForNestedViewController:afterOperation:withParentContainerSize:](self, "frameForNestedViewController:afterOperation:withParentContainerSize:", v7, 1, width, height);
    width = v8;
    height = v9;
  }

  v10 = width;
  v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)transitionCoordinator
{
  void *v2;
  void *v3;

  -[SBNestingViewController viewControllerCurrentlyDrivingTransition](self, "viewControllerCurrentlyDrivingTransition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  SBNestingViewController *v8;
  id v9;
  BOOL v10;

  v4 = a3;
  v7[1] = 3221225472;
  v7[2] = __68__SBNestingViewController_dismissViewControllerAnimated_completion___block_invoke;
  v7[3] = &unk_1E8D8DC60;
  v10 = a3;
  v8 = self;
  v9 = a4;
  v6.receiver = v8;
  v6.super_class = (Class)SBNestingViewController;
  v7[0] = MEMORY[0x1E0C809B0];
  v5 = v9;
  -[SBNestingViewController dismissViewControllerAnimated:completion:](&v6, sel_dismissViewControllerAnimated_completion_, v4, v7);

}

uint64_t __68__SBNestingViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "nestedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "popNestedViewControllerAnimated:withCompletion:", *(unsigned __int8 *)(a1 + 48), 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)nestingViewController:(id)a3 interactionControllerForAnimationController:(id)a4
{
  id v6;
  id v7;
  SBNestingViewController *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[SBNestingViewController delegate](self, "delegate");
  v8 = (SBNestingViewController *)objc_claimAutoreleasedReturnValue();
  if (v8 == self || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v9 = 0;
  }
  else
  {
    -[SBNestingViewController nestingViewController:interactionControllerForAnimationController:](v8, "nestingViewController:interactionControllerForAnimationController:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)nestingViewController:(id)a3 willPresentViewController:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[SBNestingViewController nestingViewController:sourceViewForPresentingViewController:](self, "nestingViewController:sourceViewForPresentingViewController:", self, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSourceView:", v7);
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "setSourceRect:");
  objc_msgSend(v6, "setCanOverlapSourceViewRect:", 1);

}

- (id)nestingViewController:(id)a3 sourceViewForPresentingViewController:(id)a4
{
  return (id)objc_msgSend(a3, "view");
}

- (void)transitionWillReverse:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SBNestingViewController currentTransition](self, "currentTransition");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v9;
  if (v4 == v9)
  {
    v6 = objc_msgSend(v9, "isCancelled");
    v5 = v9;
    if (v6)
    {
      objc_msgSend(v9, "animator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBNestingViewController nestingViewController:interactionControllerForAnimationController:](self, "nestingViewController:interactionControllerForAnimationController:", self, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setInteractor:", v8);
      v5 = v9;
    }
  }

}

- (void)transitionDidReverse:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  -[SBNestingViewController currentTransition](self, "currentTransition");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[SBNestingViewController nestedViewController](self, "nestedViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SBNestingViewController _updateStateForTransitioningViewController:](self, "_updateStateForTransitioningViewController:", v6);

  }
}

uint64_t __86__SBNestingViewController__performOperation_onViewController_animated_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)_handleWillRemoveChildViewController:(id)a3
{
  objc_msgSend(a3, "willMoveToParentViewController:", 0);
}

- (void)_handleRemoveChildViewController:(id)a3
{
  SBNestingViewController *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "parentViewController");
  v4 = (SBNestingViewController *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
    objc_msgSend(v5, "removeFromParentViewController");
  else
    objc_msgSend(v5, "didMoveToParentViewController:", 0);

}

- (id)_descriptionForOperation:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("none");
  if (a3 == 2)
    v3 = CFSTR("pop");
  if (a3 == 1)
    return CFSTR("push");
  else
    return (id)v3;
}

- (void)setTransitionObservers:(id)a3
{
  objc_storeStrong((id *)&self->_transitionObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionObservers, 0);
  objc_storeStrong(&self->_clientOperationCompletion, 0);
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_nestedViewController, 0);
  objc_destroyWeak((id *)&self->_parentNestingViewController);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
