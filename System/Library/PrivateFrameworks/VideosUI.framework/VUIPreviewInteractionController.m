@implementation VUIPreviewInteractionController

- (VUIPreviewInteractionController)initWithPresentingViewController:(id)a3 collectionView:(id)a4 controllerToPresent:(id)a5
{
  id v8;
  id v9;
  id v10;
  VUIPreviewInteractionController *v11;
  VUIPreviewInteractionController *v12;
  uint64_t v13;
  UIPreviewInteraction *previewInteraction;
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VUIPreviewInteractionController;
  v11 = -[VUIPreviewInteractionController init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_collectionView, a4);
    objc_storeWeak((id *)&v12->_presentingViewController, v8);
    objc_storeStrong((id *)&v12->_presentedViewController, a5);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B70]), "initWithView:", v12->_collectionView);
    previewInteraction = v12->_previewInteraction;
    v12->_previewInteraction = (UIPreviewInteraction *)v13;

    -[UIPreviewInteraction setDelegate:](v12->_previewInteraction, "setDelegate:", v12);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v12, sel__applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4768], 0);

  v4.receiver = self;
  v4.super_class = (Class)VUIPreviewInteractionController;
  -[VUIPreviewInteractionController dealloc](&v4, sel_dealloc);
}

- (void)dismissConfirmation
{
  _QWORD v2[5];

  if (self->_wrapperViewController)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __54__VUIPreviewInteractionController_dismissConfirmation__block_invoke;
    v2[3] = &unk_1E9F98DF0;
    v2[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F20], "_performWithoutDeferringTransitions:", v2);
  }
}

uint64_t __54__VUIPreviewInteractionController_dismissConfirmation__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "dismissViewControllerAnimated:completion:", 0, 0);
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupPreviewInteraction");
}

- (BOOL)previewInteractionShouldBegin:(id)a3
{
  void *v4;
  UICollectionViewCell *v5;
  UICollectionViewCell *stashedCell;
  void *v7;
  UICollectionView *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  VUIPresentationContainerViewController *v24;
  VUIPresentationContainerViewController *wrapperViewController;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double Width;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  BOOL v38;
  double v39;
  void *v40;
  void *v41;
  UICollectionView *collectionView;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  CGFloat x;
  CGFloat y;
  CGFloat v51;
  CGFloat height;
  double v53;
  double v54;
  double v55;
  double v56;
  double MidX;
  double MidY;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  UIViewPropertyAnimator *v75;
  UIViewPropertyAnimator *previewPropertyAnimator;
  id v77;
  id v78;
  id v79;
  id v80;
  UIViewPropertyAnimator *v81;
  UIViewPropertyAnimator *commitPropertyAnimator;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  void *v88;
  CGFloat v89;
  id v90;
  double v91;
  void *v92;
  void *v93;
  double v94;
  _QWORD v95[4];
  id v96;
  id v97;
  _QWORD v98[4];
  id v99;
  id v100;
  CGAffineTransform v101;
  _QWORD v102[4];
  id v103;
  id v104;
  id v105;
  CGAffineTransform v106;
  CGAffineTransform v107;
  CGAffineTransform v108;
  _QWORD v109[5];
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  uint64_t v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;

  v115 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "locationInCoordinateSpace:", 0);
  -[UICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v4);
  v5 = (UICollectionViewCell *)objc_claimAutoreleasedReturnValue();
  stashedCell = self->_stashedCell;
  self->_stashedCell = v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_collectionView;
  if (v8)
  {
    v9 = v8;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v9;
        if ((objc_msgSend(v10, "isDragging") & 1) != 0)
        {

          goto LABEL_25;
        }
        objc_msgSend(v7, "addObject:", v10);

      }
      objc_msgSend(v9, "superview");
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v11;
    }
    while (v11);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  objc_msgSend(WeakRetained, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[VUIPreviewInteractionController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    if (v14
      && !objc_msgSend(v14, "interactionController:shouldInteractionControllerBeginForIndexPath:", self, v4))
    {
LABEL_25:
      v38 = 0;
    }
    else
    {
      objc_storeStrong((id *)&self->_currentIndexPath, v4);
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v15 = v7;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v110, v114, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v111;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v111 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
            objc_msgSend(v20, "panGestureRecognizer");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setEnabled:", 0);

            objc_msgSend(v20, "panGestureRecognizer");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setEnabled:", 1);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v110, v114, 16);
        }
        while (v17);
      }

      -[UICollectionViewCell snapshotViewAfterScreenUpdates:](self->_stashedCell, "snapshotViewAfterScreenUpdates:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!self->_wrapperViewController)
      {
        v24 = objc_alloc_init(VUIPresentationContainerViewController);
        wrapperViewController = self->_wrapperViewController;
        self->_wrapperViewController = v24;

        -[VUIPresentationContainerViewController setTransitioningDelegate:](self->_wrapperViewController, "setTransitioningDelegate:", self);
        -[VUIPresentationContainerViewController setModalPresentationStyle:](self->_wrapperViewController, "setModalPresentationStyle:", 4);
        -[VUIPresentationContainerViewController view](self->_wrapperViewController, "view");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController view](self->_presentedViewController, "view");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addSubview:", v27);

        -[VUIPresentationContainerViewController addChildViewController:](self->_wrapperViewController, "addChildViewController:", self->_presentedViewController);
        v109[0] = MEMORY[0x1E0C809B0];
        v109[1] = 3221225472;
        v109[2] = __65__VUIPreviewInteractionController_previewInteractionShouldBegin___block_invoke;
        v109[3] = &unk_1E9F98DF0;
        v109[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F20], "_performWithoutDeferringTransitions:", v109);
        -[VUIPresentationContainerViewController presentationController](self->_wrapperViewController, "presentationController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "containerView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "presentedView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "insertSubview:belowSubview:", v23, v30);
        objc_msgSend(v29, "bounds");
        Width = CGRectGetWidth(v116);
        objc_msgSend(v29, "safeAreaInsets");
        v33 = Width - v32;
        objc_msgSend(v29, "safeAreaInsets");
        v35 = v33 - v34 + -33.0;
        v36 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        if (*MEMORY[0x1E0C9D820] == v35 && v36 == 56.0)
        {
          objc_msgSend(v29, "bounds", 56.0, v36);
          v85 = CGRectGetWidth(v117) + -33.0;
          v86 = 544.0;
          -[VUIPreviewInteractionController presentingViewController](self, "presentingViewController", v85, v39, *(_QWORD *)&v85);
        }
        else
        {
          v86 = 56.0;
          -[VUIPreviewInteractionController presentingViewController](self, "presentingViewController", 56.0, v36, *(_QWORD *)&v35);
        }
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "view");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        collectionView = self->_collectionView;
        -[UICollectionViewCell frame](self->_stashedCell, "frame");
        v93 = v41;
        -[UICollectionView convertRect:toView:](collectionView, "convertRect:toView:", v41);
        objc_msgSend(v41, "convertRect:toView:", v29);
        v89 = v43;
        v87 = v44;
        v46 = v45;
        v48 = v47;
        objc_msgSend(v23, "setFrame:");
        -[UICollectionViewCell setHidden:](self->_stashedCell, "setHidden:", 1);
        objc_msgSend(v29, "bounds");
        x = v118.origin.x;
        y = v118.origin.y;
        v51 = v118.size.width;
        v91 = v118.size.width;
        height = v118.size.height;
        v94 = v118.size.height;
        v53 = CGRectGetWidth(v118) + -33.0;
        v119.origin.x = x;
        v119.origin.y = y;
        v119.size.width = v51;
        v119.size.height = height;
        v54 = CGRectGetHeight(v119) + -33.0;
        if (v53 >= v84)
          v55 = v84;
        else
          v55 = v53;
        if (v54 >= v86)
          v56 = v86;
        else
          v56 = v54;
        objc_msgSend(v28, "setModalSize:", v55, v56);
        objc_msgSend(v30, "setAlpha:", 0.0);
        v120.origin.x = v89;
        v120.origin.y = v87;
        v120.size.width = v46;
        v120.size.height = v48;
        MidX = CGRectGetMidX(v120);
        v121.origin.x = v89;
        v121.origin.y = v87;
        v121.size.width = v46;
        v121.size.height = v48;
        MidY = CGRectGetMidY(v121);
        objc_msgSend(v29, "bounds");
        v60 = (v59 - v55) * 0.5;
        v62 = (v61 - v56) * 0.5;
        v122.origin.x = v60;
        v122.origin.y = v62;
        v122.size.width = v55;
        v122.size.height = v56;
        v63 = CGRectGetMidX(v122);
        v123.origin.x = v60;
        v123.origin.y = v62;
        v123.size.width = v55;
        v123.size.height = v56;
        v64 = CGRectGetMidY(v123);
        objc_msgSend(v23, "frame");
        v66 = fmax(v65 / v55, 0.5);
        objc_msgSend(v23, "frame");
        v68 = fmax(v67 / v56, 0.5);
        if (v66 >= v68)
          v66 = v68;
        v88 = v30;
        objc_msgSend(v30, "setFrame:", (v91 - v55) * 0.5, (v94 - v56) * 0.5, v55, v56);
        v92 = v29;
        memset(&v108, 0, sizeof(v108));
        CGAffineTransformMakeTranslation(&v108, MidX - v63, MidY - v64);
        v106 = v108;
        CGAffineTransformScale(&v107, &v106, v66, v66);
        v108 = v107;
        objc_msgSend(v30, "setTransform:", &v107);
        objc_msgSend(v28, "backdropView");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIConfirmationBlurEffect effectWithStyle:](VUIConfirmationBlurEffect, "effectWithStyle:", 1);
        v70 = v28;
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_alloc(MEMORY[0x1E0DC3F38]);
        v102[0] = MEMORY[0x1E0C809B0];
        v102[1] = 3221225472;
        v102[2] = __65__VUIPreviewInteractionController_previewInteractionShouldBegin___block_invoke_2;
        v102[3] = &unk_1E9F99840;
        v73 = v69;
        v103 = v73;
        v104 = v71;
        v74 = v23;
        v105 = v74;
        v90 = v71;
        v75 = (UIViewPropertyAnimator *)objc_msgSend(v72, "initWithDuration:curve:animations:", 3, v102, 1.0);
        previewPropertyAnimator = self->_previewPropertyAnimator;
        self->_previewPropertyAnimator = v75;

        v98[0] = MEMORY[0x1E0C809B0];
        v98[1] = 3221225472;
        v98[2] = __65__VUIPreviewInteractionController_previewInteractionShouldBegin___block_invoke_3;
        v98[3] = &unk_1E9F9F3F0;
        v77 = v88;
        v101 = v108;
        v99 = v77;
        v100 = v73;
        v78 = v73;
        objc_msgSend(v70, "setCompletedAnimationBlock:", v98);
        v79 = objc_alloc(MEMORY[0x1E0DC3F38]);
        v95[0] = MEMORY[0x1E0C809B0];
        v95[1] = 3221225472;
        v95[2] = __65__VUIPreviewInteractionController_previewInteractionShouldBegin___block_invoke_4;
        v95[3] = &unk_1E9F98FD8;
        v96 = v74;
        v97 = v77;
        v80 = v77;
        v81 = (UIViewPropertyAnimator *)objc_msgSend(v79, "initWithDuration:dampingRatio:animations:", v95, 0.4, 1.0);
        commitPropertyAnimator = self->_commitPropertyAnimator;
        self->_commitPropertyAnimator = v81;

      }
      if (v10)
        objc_msgSend(v10, "interactionController:didBeginForIndexPath:", self, v4);

      v38 = 1;
    }

  }
  else
  {
    v38 = 0;
  }

  return v38;
}

void __65__VUIPreviewInteractionController_previewInteractionShouldBegin___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 0, 0);

}

uint64_t __65__VUIPreviewInteractionController_previewInteractionShouldBegin___block_invoke_2(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "setEffect:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  CGAffineTransformMakeScale(&v4, 1.08, 1.08);
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __65__VUIPreviewInteractionController_previewInteractionShouldBegin___block_invoke_3(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 64);
  v5[0] = *(_OWORD *)(a1 + 48);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 80);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 40), "setEffect:", 0);
}

uint64_t __65__VUIPreviewInteractionController_previewInteractionShouldBegin___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(void **)(a1 + 32);
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8 = *MEMORY[0x1E0C9BAA8];
  v6 = v8;
  v9 = v7;
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v5 = v10;
  objc_msgSend(v2, "setTransform:", &v8);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
  v3 = *(void **)(a1 + 40);
  v8 = v6;
  v9 = v7;
  v10 = v5;
  return objc_msgSend(v3, "setTransform:", &v8);
}

- (void)previewInteraction:(id)a3 didUpdatePreviewTransition:(double)a4 ended:(BOOL)a5
{
  _BOOL4 v5;
  double v8;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = a4 * a4;
  if (a4 * a4 != 0.0 && v8 <= 1.0)
    -[UIViewPropertyAnimator setFractionComplete:](self->_previewPropertyAnimator, "setFractionComplete:", v8);
  self->_previewTransitionEnded = v5;
  if (v5)
  {
    -[UICollectionViewCell setHidden:](self->_stashedCell, "setHidden:", 0);
    -[UIViewPropertyAnimator startAnimation](self->_commitPropertyAnimator, "startAnimation");
    -[UIViewPropertyAnimator pauseAnimation](self->_previewPropertyAnimator, "pauseAnimation");
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA0]), "initWithDampingRatio:", 1.0);
    -[UIViewPropertyAnimator continueAnimationWithTimingParameters:durationFactor:](self->_previewPropertyAnimator, "continueAnimationWithTimingParameters:durationFactor:", v10, 0.4);

  }
}

- (void)previewInteractionDidCancel:(id)a3
{
  VUIPresentationContainerViewController *wrapperViewController;
  _QWORD v5[5];

  -[UICollectionViewCell setHidden:](self->_stashedCell, "setHidden:", 0);
  if (!self->_previewTransitionEnded)
  {
    wrapperViewController = self->_wrapperViewController;
    if (wrapperViewController)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __63__VUIPreviewInteractionController_previewInteractionDidCancel___block_invoke;
      v5[3] = &unk_1E9F98DF0;
      v5[4] = self;
      -[VUIPresentationContainerViewController dismissViewControllerAnimated:completion:](wrapperViewController, "dismissViewControllerAnimated:completion:", 1, v5);
    }
  }
}

uint64_t __63__VUIPreviewInteractionController_previewInteractionDidCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupPreviewInteraction");
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  VUIDialogPresentationController *dialogPresentationController;
  id v8;
  id v9;
  VUIDialogPresentationController *v10;
  VUIDialogPresentationController *v11;

  dialogPresentationController = self->_dialogPresentationController;
  if (!dialogPresentationController)
  {
    v8 = a4;
    v9 = a3;
    v10 = -[VUIDialogPresentationController initWithPresentedViewController:presentingViewController:]([VUIDialogPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v9, v8);

    v11 = self->_dialogPresentationController;
    self->_dialogPresentationController = v10;

    dialogPresentationController = self->_dialogPresentationController;
  }
  return dialogPresentationController;
}

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  VUIPreviewInteractionController *v11;
  _QWORD v12[5];

  v4 = a3;
  -[VUIPreviewInteractionController transitionDuration:](self, "transitionDuration:", v4);
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v11 = self;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__VUIPreviewInteractionController_animateTransition___block_invoke;
  v12[3] = &unk_1E9F98DF0;
  v12[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__VUIPreviewInteractionController_animateTransition___block_invoke_2;
  v9[3] = &unk_1E9F9A240;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v12, v9, v6, 0.0, 1.0, 0.0);

}

void __53__VUIPreviewInteractionController_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "completedAnimationBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "completedAnimationBlock");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

uint64_t __53__VUIPreviewInteractionController_animateTransition___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  int v4;
  char v5;
  uint64_t result;

  v3 = *(void **)(a1 + 32);
  if (!a2)
    return objc_msgSend(v3, "completeTransition:", 0);
  v4 = objc_msgSend(v3, "transitionWasCancelled");
  v5 = v4;
  result = objc_msgSend(*(id *)(a1 + 32), "completeTransition:", v4 ^ 1u);
  if ((v5 & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "_cleanupPreviewInteraction");
  return result;
}

- (void)_cleanupPreviewInteraction
{
  void *v3;
  UICollectionViewCell *stashedCell;
  UIViewPropertyAnimator *previewPropertyAnimator;
  VUIPresentationContainerViewController *wrapperViewController;
  VUIDialogPresentationController *dialogPresentationController;

  -[VUIPreviewInteractionController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interactionController:didEndForIndexPath:", self, self->_currentIndexPath);

  -[UICollectionViewCell setHidden:](self->_stashedCell, "setHidden:", 0);
  stashedCell = self->_stashedCell;
  self->_stashedCell = 0;

  -[UIViewPropertyAnimator stopAnimation:](self->_previewPropertyAnimator, "stopAnimation:", 1);
  previewPropertyAnimator = self->_previewPropertyAnimator;
  self->_previewPropertyAnimator = 0;

  wrapperViewController = self->_wrapperViewController;
  self->_wrapperViewController = 0;

  dialogPresentationController = self->_dialogPresentationController;
  self->_dialogPresentationController = 0;

}

- (VUIPreviewInteractionControllerDelegate)delegate
{
  return (VUIPreviewInteractionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (NSIndexPath)currentIndexPath
{
  return self->_currentIndexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentIndexPath, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stashedCell, 0);
  objc_storeStrong((id *)&self->_commitPropertyAnimator, 0);
  objc_storeStrong((id *)&self->_previewPropertyAnimator, 0);
  objc_storeStrong((id *)&self->_dialogPresentationController, 0);
  objc_storeStrong((id *)&self->_wrapperViewController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_previewInteraction, 0);
}

@end
