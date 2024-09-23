@implementation PUOneUpPhotosSharingTransition

- (void)animatePresentTransition
{
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
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  char v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _QWORD v73[4];
  id v74;
  id v75;
  id v76;
  PUOneUpPhotosSharingTransition *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char v93;

  -[PUOneUpPhotosSharingTransition presentingViewController](self, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition fromViewController](self, "fromViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpPhotosSharingTransition sharingTransitionViewController](self, "sharingTransitionViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition toViewController](self, "toViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EEC5C390) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPhotosSharingTransition.m"), 50, CFSTR("%@ (fromViewController) isn't conforming to PUOneUpAssetTransitionViewController"), v5);

  }
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EEC5C390) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPhotosSharingTransition.m"), 51, CFSTR("%@ (toViewController) isn't conforming to PUOneUpAssetTransitionViewController"), v7);

  }
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition containerView](self, "containerView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition finalToViewFrame](self, "finalToViewFrame");
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v72, "insertSubview:aboveSubview:", v8, v63);
  objc_msgSend(v8, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v10, "allowsGroupOpacity");

  objc_msgSend(v8, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAllowsGroupOpacity:", 0);

  objc_msgSend(v8, "setAlpha:", 0.0);
  -[PUOneUpPhotosSharingTransition oneUpPhotosSharingTransitionContext](self, "oneUpPhotosSharingTransitionContext");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "currentAssetReference");
  v70 = v5;
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpPhotosSharingTransition delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "photosSharingTransition:layoutForAssetReference:", self, v12);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpPhotosSharingTransition _setTransitionLayout:](self, "_setTransitionLayout:", v68);
  objc_msgSend(v6, "setOneUpPhotosSharingTransitionContext:", v69);
  objc_msgSend(v6, "setPhotosSharingTransitionLayout:animated:", v68, 0);
  -[PUOneUpPhotosSharingTransition delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "photosSharingTransition:contentOffsetForAssetReference:", self, v12);
  v16 = v15;
  v18 = v17;

  objc_msgSend(v6, "transitionCollectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setContentOffset:", v16, v18);

  objc_msgSend(v4, "createAssetTransitionInfo");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOneUpPhotosSharingTransitionInfo:", v67);
  objc_msgSend(v8, "layoutIfNeeded");
  objc_msgSend(v9, "superview");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v66 = v7;
  v57 = (void *)objc_msgSend(v20, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v71 = v9;
  objc_msgSend(v59, "insertSubview:aboveSubview:", v57, v9);
  -[PUOneUpPhotosSharingTransition delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "photosSharingTransitionTransitioningView:", self);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v65, "addSubview:", v9);
  objc_msgSend(v6, "transitionCollectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "backgroundColor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "transitionCollectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBackgroundColor:", v24);

  objc_msgSend(v6, "embeddedActivityView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "embeddedActivityViewFrameWhenShowing:", 0);
  objc_msgSend(v25, "setFrame:");
  objc_msgSend(v6, "embeddedActivityViewFrameWhenShowing:", 1);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v34 = v25;
  v52 = v25;
  objc_msgSend(v72, "addSubview:", v25);
  -[PUOneUpPhotosSharingTransition delegate](self, "delegate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v12;
  objc_msgSend(v35, "photosSharingTransition:setVisibility:forAssetReference:", self, 0, v12);

  _PhotoLibraryForAssetReference(v12);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "px_beginPausingChangesWithTimeout:identifier:", CFSTR("PUOneUpPhotosSharingTransition-Present"), *MEMORY[0x1E0D7C5F0]);
  v38 = v4;
  v53 = v4;
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPhotosSharingTransitionLayout:animated:", 0, 1);
  -[PUOneUpPhotosSharingTransition delegate](self, "delegate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "viewToHideWhilePresentingWithTransition:", self);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v73[2] = __58__PUOneUpPhotosSharingTransition_animatePresentTransition__block_invoke;
  v73[3] = &unk_1E58A2BE0;
  v74 = v72;
  v75 = v38;
  v76 = v6;
  v77 = self;
  v78 = v8;
  v79 = v71;
  v80 = v41;
  v81 = v34;
  v89 = v27;
  v90 = v29;
  v91 = v31;
  v92 = v33;
  v93 = v61;
  v82 = v36;
  v83 = v59;
  v84 = v57;
  v85 = v55;
  v86 = v63;
  v87 = v37;
  v88 = v39;
  v62 = v39;
  v54 = v37;
  v64 = v63;
  v56 = v55;
  v42 = v57;
  v60 = v59;
  v58 = v36;
  v43 = v52;
  v44 = v41;
  v45 = v71;
  v46 = v78;
  v47 = v6;
  v48 = v53;
  v49 = v72;
  objc_msgSend(v48, "oneUpAssetTransition:requestTransitionContextWithCompletion:", self, v73);

}

- (void)animateDismissTransition
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  -[PUViewControllerTransition toViewController](self, "toViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpPhotosSharingTransition sharingTransitionViewController](self, "sharingTransitionViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition fromViewController](self, "fromViewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition containerView](self, "containerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpPhotosSharingTransition presentingViewController](self, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");
  -[PUViewControllerTransition finalToViewFrame](self, "finalToViewFrame");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(v28, "insertSubview:aboveSubview:", v3, v6);
  objc_msgSend(v6, "backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBackgroundColor:", v8);

  -[PUOneUpPhotosSharingTransition oneUpPhotosSharingTransitionContext](self, "oneUpPhotosSharingTransitionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentAssetReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionCollectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v12);

  objc_msgSend(v6, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAllowsGroupOpacity:", 0);

  -[PUOneUpPhotosSharingTransition delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "photosSharingTransition:layoutForAssetReference:", self, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpPhotosSharingTransition _setTransitionLayout:](self, "_setTransitionLayout:", v15);
  objc_msgSend(v4, "setOneUpPhotosSharingTransitionContext:", v9);
  objc_msgSend(v4, "embeddedActivityView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "embeddedActivityViewFrameWhenShowing:", 0);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __58__PUOneUpPhotosSharingTransition_animateDismissTransition__block_invoke;
  v31[3] = &unk_1E58A2C30;
  v31[4] = self;
  v32 = v16;
  v39 = v17;
  v40 = v18;
  v41 = v19;
  v42 = v20;
  v33 = v4;
  v34 = v15;
  v35 = v10;
  v36 = v6;
  v37 = v7;
  v38 = v5;
  v21 = v5;
  v22 = v7;
  v23 = v6;
  v24 = v10;
  v25 = v15;
  v26 = v4;
  v27 = v16;
  objc_msgSend(v26, "oneUpAssetTransition:requestTransitionContextWithCompletion:", self, v31);

}

- (PUOneUpPhotosSharingTransitionViewController)sharingTransitionViewController
{
  return (PUOneUpPhotosSharingTransitionViewController *)objc_loadWeakRetained((id *)&self->_sharingTransitionViewController);
}

- (void)setSharingTransitionViewController:(id)a3
{
  objc_storeWeak((id *)&self->_sharingTransitionViewController, a3);
}

- (PUOneUpAssetTransitionViewController)presentingViewController
{
  return (PUOneUpAssetTransitionViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (PUOneUpPhotosSharingTransitionContext)oneUpPhotosSharingTransitionContext
{
  return self->_oneUpPhotosSharingTransitionContext;
}

- (void)setOneUpPhotosSharingTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_oneUpPhotosSharingTransitionContext, a3);
}

- (PUOneUpPhotosSharingTransitionDelegate)delegate
{
  return (PUOneUpPhotosSharingTransitionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UICollectionViewLayout)_transitionLayout
{
  return self->__transitionLayout;
}

- (void)_setTransitionLayout:(id)a3
{
  objc_storeStrong((id *)&self->__transitionLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__transitionLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_oneUpPhotosSharingTransitionContext, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_sharingTransitionViewController);
}

void __58__PUOneUpPhotosSharingTransition_animateDismissTransition__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  __int128 v43;
  __int128 v44;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oneUpTransitionContextWithContextWithContainerView:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __58__PUOneUpPhotosSharingTransition_animateDismissTransition__block_invoke_2;
  v41[3] = &unk_1E58AACA0;
  v42 = *(id *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 112);
  v43 = *(_OWORD *)(a1 + 96);
  v44 = v8;
  objc_msgSend(v6, "oneUpTransitionContextWithAnimationBlock:", v41);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "setPhotosSharingTransitionLayout:animated:", *(_QWORD *)(a1 + 56), 1);
  _PhotoLibraryForAssetReference(*(void **)(a1 + 64));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "px_beginPausingChangesWithTimeout:identifier:", CFSTR("PUOneUpPhotosSharingTransition-Dismiss"), *MEMORY[0x1E0D7C5F0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewToHideWhilePresentingWithTransition:", *(_QWORD *)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setAlpha:", 0.0);
  v14 = (void *)MEMORY[0x1E0DC3F10];
  objc_msgSend(*(id *)(a1 + 32), "duration");
  v16 = v15 * 0.5;
  v39[0] = v7;
  v39[1] = 3221225472;
  v39[2] = __58__PUOneUpPhotosSharingTransition_animateDismissTransition__block_invoke_3;
  v39[3] = &unk_1E58ABD10;
  v40 = *(id *)(a1 + 72);
  objc_msgSend(v14, "animateWithDuration:animations:", v39, v16);
  v17 = (void *)MEMORY[0x1E0DC3F10];
  objc_msgSend(*(id *)(a1 + 32), "duration");
  v19 = v18 * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "duration");
  v21 = v20 * 0.5;
  v37[0] = v7;
  v37[1] = 3221225472;
  v37[2] = __58__PUOneUpPhotosSharingTransition_animateDismissTransition__block_invoke_4;
  v37[3] = &unk_1E58ABD10;
  v38 = v13;
  v22 = v13;
  objc_msgSend(v17, "animateWithDuration:delay:options:animations:completion:", 0, v37, 0, v19, v21);
  v23 = *(void **)(a1 + 80);
  v24 = *(void **)(a1 + 32);
  objc_msgSend(v24, "duration");
  v26 = v25;
  v30[0] = v7;
  v30[1] = 3221225472;
  v30[2] = __58__PUOneUpPhotosSharingTransition_animateDismissTransition__block_invoke_5;
  v30[3] = &unk_1E58A2C08;
  v31 = *(id *)(a1 + 88);
  v32 = *(id *)(a1 + 40);
  v33 = *(id *)(a1 + 48);
  v34 = v10;
  v27 = *(_QWORD *)(a1 + 32);
  v35 = v11;
  v36 = v27;
  v28 = v11;
  v29 = v10;
  objc_msgSend(v23, "oneUpAssetTransition:animateTransitionWithContext:duration:completion:", v24, v9, v30, v26);

}

uint64_t __58__PUOneUpPhotosSharingTransition_animateDismissTransition__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __58__PUOneUpPhotosSharingTransition_animateDismissTransition__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __58__PUOneUpPhotosSharingTransition_animateDismissTransition__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __58__PUOneUpPhotosSharingTransition_animateDismissTransition__block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "setOneUpPhotosSharingTransitionContext:", 0);
  objc_msgSend(*(id *)(a1 + 56), "px_endPausingChanges:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 72), "transitionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "transitionWasCancelled") ^ 1;

  return objc_msgSend(*(id *)(a1 + 72), "completeTransition:", v3);
}

void __58__PUOneUpPhotosSharingTransition_animatePresentTransition__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
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
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  char v57;
  _QWORD v58[5];
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;

  objc_msgSend(a2, "snapshotView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 40), "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertRect:fromView:", v13, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  objc_msgSend(v3, "setFrame:", v15, v17, v19, v21);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v3);
  objc_msgSend(*(id *)(a1 + 48), "oneUpAssetTransitionAssetFinalFrame:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 64), "convertRect:fromView:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "convertRect:fromView:", *(_QWORD *)(a1 + 64));
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v30 = (void *)MEMORY[0x1E0DC3F10];
  objc_msgSend(*(id *)(a1 + 56), "duration");
  v31 = MEMORY[0x1E0C809B0];
  v33 = v32 * 0.5;
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __58__PUOneUpPhotosSharingTransition_animatePresentTransition__block_invoke_2;
  v69[3] = &unk_1E58ABD10;
  v70 = *(id *)(a1 + 80);
  objc_msgSend(v30, "animateWithDuration:animations:", v69, v33);
  v34 = (void *)MEMORY[0x1E0DC3F10];
  objc_msgSend(*(id *)(a1 + 56), "duration");
  v36 = v35 * 0.5;
  objc_msgSend(*(id *)(a1 + 56), "duration");
  v38 = v37 * 0.5;
  v67[0] = v31;
  v67[1] = 3221225472;
  v67[2] = __58__PUOneUpPhotosSharingTransition_animatePresentTransition__block_invoke_3;
  v67[3] = &unk_1E58ABD10;
  v68 = *(id *)(a1 + 64);
  objc_msgSend(v34, "animateWithDuration:delay:options:animations:completion:", 0, v67, 0, v36, v38);
  v39 = (void *)MEMORY[0x1E0DC3F10];
  objc_msgSend(*(id *)(a1 + 56), "duration");
  v41 = v40;
  v58[0] = v31;
  v58[1] = 3221225472;
  v58[2] = __58__PUOneUpPhotosSharingTransition_animatePresentTransition__block_invoke_4;
  v58[3] = &unk_1E58A2B90;
  v58[4] = *(_QWORD *)(a1 + 56);
  v59 = *(id *)(a1 + 88);
  v61 = *(_OWORD *)(a1 + 152);
  v62 = *(_OWORD *)(a1 + 168);
  v60 = v3;
  v63 = v23;
  v64 = v25;
  v65 = v27;
  v66 = v29;
  v43[0] = v31;
  v43[1] = 3221225472;
  v43[2] = __58__PUOneUpPhotosSharingTransition_animatePresentTransition__block_invoke_5;
  v43[3] = &unk_1E58A2BB8;
  v43[4] = *(_QWORD *)(a1 + 56);
  v44 = *(id *)(a1 + 96);
  v45 = *(id *)(a1 + 80);
  v46 = *(id *)(a1 + 64);
  v57 = *(_BYTE *)(a1 + 184);
  v47 = *(id *)(a1 + 104);
  v48 = *(id *)(a1 + 72);
  v49 = *(id *)(a1 + 112);
  v50 = *(id *)(a1 + 88);
  v51 = *(id *)(a1 + 48);
  v52 = *(id *)(a1 + 120);
  v53 = v60;
  v54 = *(id *)(a1 + 128);
  v55 = *(id *)(a1 + 136);
  v56 = *(id *)(a1 + 144);
  v42 = v60;
  objc_msgSend(v39, "animateWithDuration:animations:completion:", v58, v43, v41);

}

uint64_t __58__PUOneUpPhotosSharingTransition_animatePresentTransition__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __58__PUOneUpPhotosSharingTransition_animatePresentTransition__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __58__PUOneUpPhotosSharingTransition_animatePresentTransition__block_invoke_4(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosSharingTransitionWillAnimatePresentation:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  return objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 0.0);
}

void __58__PUOneUpPhotosSharingTransition_animatePresentTransition__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosSharingTransition:setVisibility:forAssetReference:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 56), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupOpacity:", *(unsigned __int8 *)(a1 + 144));

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoCollectionViewBackgroundColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "setBackgroundColor:", v8);
  objc_msgSend(*(id *)(a1 + 64), "insertSubview:aboveSubview:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 80), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 72), "addSubview:", *(_QWORD *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 96), "transitionCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", *(_QWORD *)(a1 + 104));

  objc_msgSend(*(id *)(a1 + 112), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 120), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 96), "setOneUpPhotosSharingTransitionContext:", 0);
  objc_msgSend(*(id *)(a1 + 128), "px_endPausingChanges:", *(_QWORD *)(a1 + 136));
  objc_msgSend(*(id *)(a1 + 32), "transitionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "transitionWasCancelled") ^ 1;

  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", v7);
}

@end
