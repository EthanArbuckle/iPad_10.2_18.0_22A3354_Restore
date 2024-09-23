@implementation PXMessagesStackPresentationAnimationController

- (PXMessagesStackPresentationAnimationController)initWithStackView:(id)a3
{
  id v5;
  PXMessagesStackPresentationAnimationController *v6;
  PXMessagesStackPresentationAnimationController *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  UIViewPropertyAnimator *propertyAnimator;
  PXPhotosGridStackTransitionHelper *v16;
  PXPhotosGridStackTransitionHelper *transitionHelper;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PXMessagesStackPresentationAnimationController;
  v6 = -[PXMessagesStackPresentationAnimationController init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_stackView, a3);
    +[PXMessagesUISettings sharedInstance](PXMessagesUISettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transitionDuration");
    v7->_transitionDuration = v9;
    objc_msgSend(v8, "transitionSpringDamping");
    v11 = v10;
    objc_msgSend(v8, "transitionSpringVelocity");
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA0]), "initWithDampingRatio:initialVelocity:", v11, v12, v12);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:timingParameters:", v13, v7->_transitionDuration);
    propertyAnimator = v7->_propertyAnimator;
    v7->_propertyAnimator = (UIViewPropertyAnimator *)v14;

    v16 = (PXPhotosGridStackTransitionHelper *)-[PXPhotosGridStackTransitionHelper initWithStackItemsCount:]([PXPhotosGridStackTransitionHelper alloc], objc_msgSend(v8, "transitionItemsCount"));
    transitionHelper = v7->_transitionHelper;
    v7->_transitionHelper = v16;

  }
  return v7;
}

- (double)transitionDuration:(id)a3
{
  return self->_transitionDuration;
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  return self->_propertyAnimator;
}

- (void)animateTransition:(id)a3
{
  id v4;
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
  void *v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id location[2];

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "topViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v6)
      {
        objc_msgSend(v4, "containerView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "finalFrameForViewController:", v5);
        v9 = v8;
        v11 = v10;
        v13 = v12;
        v15 = v14;
        objc_msgSend(v5, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addSubview:", v16);

        objc_msgSend(v5, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setFrame:", v9, v11, v13, v15);

        objc_msgSend(v6, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAlpha:", 0.0);

        objc_msgSend(v5, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "layoutIfNeeded");

        -[PXMessagesStackPresentationAnimationController stackView](self, "stackView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXMessagesStackPresentationAnimationController _bestAssetReferenceForStack:]((uint64_t)self, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(location, self);
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __68__PXMessagesStackPresentationAnimationController_animateTransition___block_invoke;
        v25[3] = &unk_1E5147A18;
        objc_copyWeak(&v29, location);
        v26 = v4;
        v22 = v6;
        v27 = v22;
        v23 = v21;
        v28 = v23;
        objc_msgSend(v22, "scrollToCenterAssetReference:completion:", v23, v25);

        objc_destroyWeak(&v29);
        objc_destroyWeak(location);

        goto LABEL_9;
      }
    }
    else
    {

    }
  }
  PXAssertGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    LOWORD(location[0]) = 0;
    _os_log_error_impl(&dword_1A6789000, v24, OS_LOG_TYPE_ERROR, "Stack transition presentation is only supported to a photos grid", (uint8_t *)location, 2u);
  }

  -[PXMessagesStackPresentationAnimationController _animateCrossfadeFallback:gridViewController:]((uint64_t)self, v4, 0);
LABEL_9:

}

- (PXMessagesStackView)stackView
{
  return self->_stackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_propertyAnimator, 0);
  objc_storeStrong((id *)&self->_transitionHelper, 0);
}

- (void)_animateCrossfadeFallback:(void *)a3 gridViewController:
{
  id v5;
  id v6;
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
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(v5, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finalFrameForViewController:", v7);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v7, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v17);

    objc_msgSend(v7, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);

    objc_msgSend(v7, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAlpha:", 0.0);

    v20 = MEMORY[0x1E0C809B0];
    v21 = *(void **)(a1 + 24);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __95__PXMessagesStackPresentationAnimationController__animateCrossfadeFallback_gridViewController___block_invoke;
    v27[3] = &unk_1E5149198;
    v28 = v7;
    v22 = v7;
    objc_msgSend(v21, "addAnimations:", v27);
    v23 = *(void **)(a1 + 24);
    v24[0] = v20;
    v24[1] = 3221225472;
    v24[2] = __95__PXMessagesStackPresentationAnimationController__animateCrossfadeFallback_gridViewController___block_invoke_2;
    v24[3] = &unk_1E5147A40;
    v25 = v5;
    v26 = v6;
    objc_msgSend(v23, "addCompletion:", v24);
    objc_msgSend(*(id *)(a1 + 24), "startAnimation");

  }
}

- (id)_bestAssetReferenceForStack:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _OWORD v16[2];
  __int128 v17;
  __int128 v18;

  v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v7 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v3, "currentAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v8 = objc_msgSend(v4, "currentIndex");
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 0;
      goto LABEL_17;
    }
    v9 = v8;
    objc_msgSend(v4, "dataSourceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "numberOfSections") >= 1)
    {
      objc_msgSend(v4, "dataSourceManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "numberOfItemsInSection:", 0);

      if (v9 >= v14 && v14 >= 1)
      {
        v17 = 0u;
        v18 = 0u;
        if (v11)
          objc_msgSend(v11, "lastItemIndexPath");
LABEL_14:
        v16[0] = v17;
        v16[1] = v18;
        objc_msgSend(v11, "assetReferenceAtItemIndexPath:", v16);
        v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

        goto LABEL_17;
      }
      if (v14 >= 1)
      {
        v17 = 0u;
        v18 = 0u;
        if (v11)
          objc_msgSend(v11, "firstItemIndexPath");
        goto LABEL_14;
      }
    }
    v7 = 0;
    goto LABEL_16;
  }
  v7 = v5;
LABEL_17:

LABEL_18:
  return v7;
}

void __68__PXMessagesStackPresentationAnimationController_animateTransition___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  char v33;
  void *v34;
  void *v35;
  id WeakRetained;
  _QWORD v37[4];
  id v38;
  __int128 buf;
  uint64_t (*v40)(uint64_t);
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  char v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v3 = *(void **)(a1 + 40);
    v4 = *(id *)(a1 + 32);
    v5 = v3;
    if (!WeakRetained)
    {
LABEL_19:

      return;
    }
    objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "stackView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v5;
    -[PXMessagesStackPresentationAnimationController _bestAssetReferenceForStack:]((uint64_t)WeakRetained, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(v8, "dataSourceManager");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v12, "dataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v12) = -[PXPhotosGridStackTransitionHelper prepareForTransitionFromEndpoint:toEndpoint:withPrimaryAssetReference:dataSource:](*((_QWORD *)WeakRetained + 2), v8, v9, v11, v13);
      if ((v12 & 1) != 0)
      {
        v14 = (_QWORD *)*((_QWORD *)WeakRetained + 2);
        objc_msgSend(v6, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPhotosGridStackTransitionHelper setInitialTransitionStateInContainerView:aboveView:](v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "hiddenAssetReferences");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v17;
        if (objc_msgSend(v18, "count"))
        {
          objc_msgSend(v17, "setByAddingObjectsFromSet:", v18);
          v19 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = v17;
        }
        v34 = v19;
        objc_msgSend(v9, "setHiddenAssetReferences:", v19);
        v33 = objc_msgSend(v8, "isHidden");
        objc_msgSend(v8, "setHidden:", 1);
        v26 = *((_QWORD *)WeakRetained + 2);
        v27 = (void *)*((_QWORD *)WeakRetained + 3);
        objc_msgSend(v6, "view");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPhotosGridStackTransitionHelper addTransitionAnimationsToAnimator:inContainerView:](v26, v27, v28);

        v29 = (void *)*((_QWORD *)WeakRetained + 3);
        v30 = MEMORY[0x1E0C809B0];
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __88__PXMessagesStackPresentationAnimationController__animateTransition_gridViewController___block_invoke;
        v37[3] = &unk_1E5149198;
        v38 = v7;
        objc_msgSend(v29, "addAnimations:", v37);
        -[PXPhotosGridStackTransitionHelper addTransitionCompletionsToAnimator:](*((_QWORD *)WeakRetained + 2), *((void **)WeakRetained + 3));
        v31 = (void *)*((_QWORD *)WeakRetained + 3);
        *(_QWORD *)&buf = v30;
        *((_QWORD *)&buf + 1) = 3221225472;
        v40 = __88__PXMessagesStackPresentationAnimationController__animateTransition_gridViewController___block_invoke_2;
        v41 = &unk_1E5147A68;
        v42 = v9;
        v43 = v18;
        v44 = v8;
        v46 = v33;
        v45 = v4;
        v32 = v18;
        objc_msgSend(v31, "addCompletion:", &buf);
        objc_msgSend(*((id *)WeakRetained + 3), "startAnimation");

LABEL_18:
        goto LABEL_19;
      }
    }
    else
    {
      PLUIGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_ERROR, "The stack doesn't have a current asset for transitioning", (uint8_t *)&buf, 2u);
      }

    }
    PLUIGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_ERROR, "Failed to prepare for stack transition. Falling back to cross fade", (uint8_t *)&buf, 2u);
    }

    objc_msgSend(v7, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAlpha:", 1.0);

    -[PXMessagesStackPresentationAnimationController _animateCrossfadeFallback:gridViewController:]((uint64_t)WeakRetained, v4, v9);
    goto LABEL_18;
  }
  PLUIGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = *(_QWORD *)(a1 + 48);
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v21;
    _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "Cross fading due to failure to scroll to asset reference for transition: %@", (uint8_t *)&buf, 0xCu);
  }

  v22 = objc_loadWeakRetained((id *)(a1 + 56));
  -[PXMessagesStackPresentationAnimationController _animateCrossfadeFallback:gridViewController:]((uint64_t)v22, *(void **)(a1 + 32), *(void **)(a1 + 40));

}

void __88__PXMessagesStackPresentationAnimationController__animateTransition_gridViewController___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __88__PXMessagesStackPresentationAnimationController__animateTransition_gridViewController___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHiddenAssetReferences:animationType:", *(_QWORD *)(a1 + 40), 2);
  objc_msgSend(*(id *)(a1 + 48), "setHidden:", *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 56), "completeTransition:", objc_msgSend(*(id *)(a1 + 56), "transitionWasCancelled") ^ 1);
  return objc_msgSend(*(id *)(a1 + 32), "ensureSwipeDismissalInteraction");
}

void __95__PXMessagesStackPresentationAnimationController__animateCrossfadeFallback_gridViewController___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __95__PXMessagesStackPresentationAnimationController__animateCrossfadeFallback_gridViewController___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
  return objc_msgSend(*(id *)(a1 + 40), "ensureSwipeDismissalInteraction");
}

@end
