@implementation PXMessagesStackDismissalAnimationController

- (PXMessagesStackDismissalAnimationController)initWithStackView:(id)a3 dismissingViewController:(id)a4
{
  id v7;
  id v8;
  PXMessagesStackDismissalAnimationController *v9;
  PXMessagesStackDismissalAnimationController *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  UIViewPropertyAnimator *propertyAnimator;
  PXPhotosGridStackTransitionHelper *v19;
  PXPhotosGridStackTransitionHelper *transitionHelper;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PXMessagesStackDismissalAnimationController;
  v9 = -[PXMessagesStackDismissalAnimationController init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stackView, a3);
    objc_storeStrong((id *)&v10->_dismissingViewController, a4);
    +[PXMessagesUISettings sharedInstance](PXMessagesUISettings, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transitionDuration");
    v10->_transitionDuration = v12;
    objc_msgSend(v11, "transitionSpringDamping");
    v14 = v13;
    objc_msgSend(v11, "transitionSpringVelocity");
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA0]), "initWithDampingRatio:initialVelocity:", v14, v15, v15);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:timingParameters:", v16, v10->_transitionDuration);
    propertyAnimator = v10->_propertyAnimator;
    v10->_propertyAnimator = (UIViewPropertyAnimator *)v17;

    v19 = (PXPhotosGridStackTransitionHelper *)-[PXPhotosGridStackTransitionHelper initWithStackItemsCount:]([PXPhotosGridStackTransitionHelper alloc], objc_msgSend(v11, "transitionItemsCount"));
    transitionHelper = v10->_transitionHelper;
    v10->_transitionHelper = v19;

  }
  return v10;
}

- (double)transitionDuration:(id)a3
{
  return self->_transitionDuration;
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  return self->_propertyAnimator;
}

- (UIViewControllerInteractiveTransitioning)interactionController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PXMessagesStackDismissalAnimationController dismissingViewController](self, "dismissingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "topViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, "edgeSwipeDismissalInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  return (UIViewControllerInteractiveTransitioning *)v6;
}

- (void)runTransitionAnimation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  id v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  UIViewPropertyAnimator *propertyAnimator;
  uint64_t v52;
  UIViewPropertyAnimator *v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  uint8_t v72[32];
  uint8_t buf[4];
  void *v74;
  uint64_t v75;
  CGRect v76;
  CGRect v77;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "topViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v8)
      {
        -[PXMessagesStackDismissalAnimationController stackView](self, "stackView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v8;
        v11 = v9;
        v12 = v11;
        if (!self)
        {

          goto LABEL_19;
        }
        v63 = v11;
        objc_msgSend(v11, "currentAssetReference");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "regionOfInterestForAssetReference:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "view");
        v15 = v10;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "rectInCoordinateSpace:", v16);
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        objc_msgSend(v16, "bounds");
        objc_msgSend(v16, "safeAreaInsets");
        PXEdgeInsetsInsetRect();
        v77.origin.x = v18;
        v77.origin.y = v20;
        v77.size.width = v22;
        v77.size.height = v24;
        v62 = v15;
        if (CGRectContainsRect(v76, v77))
        {
          v25 = v13;
        }
        else
        {
          objc_msgSend(v15, "assetReferenceForCurrentScrollPosition");
          v25 = (id)objc_claimAutoreleasedReturnValue();
        }
        v27 = v25;
        if (v25 && (objc_msgSend(v25, "indexPath"), *(_QWORD *)v72 != *(_QWORD *)off_1E50B7E98))
        {
          if ((objc_msgSend(v63, "scrollToAssetReference:animated:", v27, 0) & 1) != 0)
          {
            objc_msgSend(v63, "dataSourceManager");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "dataSource");
            v58 = v14;
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            v60 = -[PXPhotosGridStackTransitionHelper prepareForTransitionFromEndpoint:toEndpoint:withPrimaryAssetReference:dataSource:]((uint64_t)self->_transitionHelper, v62, v63, v27, v33);
            v10 = v62;
            v12 = v63;

            if ((v60 & 1) != 0)
            {
              objc_msgSend(v4, "finalFrameForViewController:", v5);
              v35 = v34;
              v37 = v36;
              v39 = v38;
              v41 = v40;
              objc_msgSend(v5, "view");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "view");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "insertSubview:belowSubview:", v42, v43);

              objc_msgSend(v5, "view");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "setFrame:", v35, v37, v39, v41);

              -[PXPhotosGridStackTransitionHelper setInitialTransitionStateInContainerView:aboveView:](&self->_transitionHelper->super.isa, v7, 0);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "hiddenAssetReferences");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v46, "count"))
              {
                objc_msgSend(v45, "setByAddingObjectsFromSet:", v46);
                v47 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v47 = v45;
              }
              v48 = v47;
              objc_msgSend(v62, "setHiddenAssetReferences:", v47);
              objc_msgSend(v63, "hiddenAssetReferences");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = v48;
              v61 = v45;
              if (objc_msgSend(v49, "count"))
              {
                objc_msgSend(v45, "setByAddingObjectsFromSet:", v49);
                v50 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v50 = v45;
              }
              v57 = v50;
              objc_msgSend(v63, "setHiddenAssetReferences:", v50);
              -[PXPhotosGridStackTransitionHelper addTransitionAnimationsToAnimator:inContainerView:]((uint64_t)self->_transitionHelper, self->_propertyAnimator, v7);
              propertyAnimator = self->_propertyAnimator;
              v52 = MEMORY[0x1E0C809B0];
              v70[0] = MEMORY[0x1E0C809B0];
              v70[1] = 3221225472;
              v70[2] = __70__PXMessagesStackDismissalAnimationController_runTransitionAnimation___block_invoke;
              v70[3] = &unk_1E5149198;
              v71 = v6;
              -[UIViewPropertyAnimator addAnimations:](propertyAnimator, "addAnimations:", v70);
              -[PXPhotosGridStackTransitionHelper addTransitionCompletionsToAnimator:]((uint64_t)self->_transitionHelper, self->_propertyAnimator);
              v53 = self->_propertyAnimator;
              v64[0] = v52;
              v64[1] = 3221225472;
              v64[2] = __70__PXMessagesStackDismissalAnimationController_runTransitionAnimation___block_invoke_2;
              v64[3] = &unk_1E5142138;
              v65 = v62;
              v54 = v46;
              v66 = v54;
              v67 = v63;
              v55 = v49;
              v68 = v55;
              v56 = v4;
              v69 = v56;
              -[UIViewPropertyAnimator addCompletion:](v53, "addCompletion:", v64);
              if ((objc_msgSend(v56, "isInteractive") & 1) == 0)
                -[UIViewPropertyAnimator startAnimation](self->_propertyAnimator, "startAnimation");

              v10 = v62;
              v12 = v63;
              goto LABEL_21;
            }
LABEL_20:
            -[PXMessagesStackDismissalAnimationController _animateCrossfadeFallback:]((uint64_t)self, v4);
LABEL_21:

            goto LABEL_11;
          }
          PLUIGetLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            goto LABEL_18;
          *(_DWORD *)buf = 138412290;
          v74 = v27;
          v29 = "Failed to scroll stack view to asset reference %@";
          v30 = v28;
          v31 = 12;
        }
        else
        {
          PLUIGetLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
LABEL_18:

            v12 = v63;
            v10 = v62;
LABEL_19:

            goto LABEL_20;
          }
          *(_WORD *)buf = 0;
          v29 = "Failed to get an asset reference from the grid view for stack transition";
          v30 = v28;
          v31 = 2;
        }
        _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
        goto LABEL_18;
      }
    }
    else
    {

    }
  }
  PXAssertGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v72 = 0;
    _os_log_error_impl(&dword_1A6789000, v26, OS_LOG_TYPE_ERROR, "Stack transition dismissal is only supported from a photos grid", v72, 2u);
  }

  -[PXMessagesStackDismissalAnimationController _animateCrossfadeFallback:]((uint64_t)self, v4);
LABEL_11:

}

- (PXMessagesStackView)stackView
{
  return self->_stackView;
}

- (UIViewController)dismissingViewController
{
  return self->_dismissingViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissingViewController, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_propertyAnimator, 0);
  objc_storeStrong((id *)&self->_transitionHelper, 0);
}

- (void)_animateCrossfadeFallback:(uint64_t)a1
{
  id v3;
  void *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "containerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finalFrameForViewController:", v5);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v5, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertSubview:belowSubview:", v16, v17);

    objc_msgSend(v5, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", v9, v11, v13, v15);

    v19 = *(void **)(a1 + 24);
    v20 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __73__PXMessagesStackDismissalAnimationController__animateCrossfadeFallback___block_invoke;
    v29[3] = &unk_1E5149198;
    v21 = v6;
    v30 = v21;
    objc_msgSend(v19, "addAnimations:", v29);
    v22 = *(void **)(a1 + 24);
    v24 = v20;
    v25 = 3221225472;
    v26 = __73__PXMessagesStackDismissalAnimationController__animateCrossfadeFallback___block_invoke_2;
    v27 = &unk_1E51438B0;
    v23 = v4;
    v28 = v23;
    objc_msgSend(v22, "addCompletion:", &v24);
    if ((objc_msgSend(v23, "isInteractive", v24, v25, v26, v27) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 24), "startAnimation");

  }
}

void __70__PXMessagesStackDismissalAnimationController_runTransitionAnimation___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __70__PXMessagesStackDismissalAnimationController_runTransitionAnimation___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHiddenAssetReferences:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "setHiddenAssetReferences:animationType:", *(_QWORD *)(a1 + 56), 2);
  return objc_msgSend(*(id *)(a1 + 64), "completeTransition:", objc_msgSend(*(id *)(a1 + 64), "transitionWasCancelled") ^ 1);
}

void __73__PXMessagesStackDismissalAnimationController__animateCrossfadeFallback___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __73__PXMessagesStackDismissalAnimationController__animateCrossfadeFallback___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
}

@end
