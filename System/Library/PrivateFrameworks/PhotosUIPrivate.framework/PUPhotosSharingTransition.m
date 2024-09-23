@implementation PUPhotosSharingTransition

- (void)animatePresentTransition
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
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[5];
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  char v79;
  _QWORD v80[5];
  id v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;

  -[PUViewControllerTransition toViewController](self, "toViewController");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosSharingTransition sharingTransitionViewController](self, "sharingTransitionViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition fromViewController](self, "fromViewController");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "view");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition finalToViewFrame](self, "finalToViewFrame");
  objc_msgSend(v3, "setFrame:");
  v56 = v6;
  objc_msgSend(v6, "insertSubview:aboveSubview:", v3, v59);
  objc_msgSend(v3, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v7, "allowsGroupOpacity");

  objc_msgSend(v3, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsGroupOpacity:", 0);

  objc_msgSend(v3, "setAlpha:", 0.0);
  -[PUPhotosSharingTransition photosSharingTransitionContext](self, "photosSharingTransitionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyAssetIndexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v9;
  objc_msgSend(v9, "assetCollectionsDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosSharingTransition delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "photosSharingTransition:layoutForKeyAssetIndexPath:inAssetCollectionsDataSource:", self, v10, v11);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotosSharingTransition _setTransitionLayout:](self, "_setTransitionLayout:", v62);
  objc_msgSend(v4, "setPhotosSharingTransitionContext:", v9);
  objc_msgSend(v4, "setPhotosSharingTransitionLayout:animated:", v62, 0);
  -[PUPhotosSharingTransition delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "photosSharingTransition:contentOffsetForKeyAssetIndexPath:inAssetCollectionsDataSource:", self, v10, v11);
  v15 = v14;
  v17 = v16;

  objc_msgSend(v4, "transitionCollectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setContentOffset:", v15, v17);

  objc_msgSend(v3, "layoutIfNeeded");
  objc_msgSend(v5, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v54 = v5;
  v55 = (void *)objc_msgSend(v20, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v21 = v19;
  objc_msgSend(v19, "insertSubview:aboveSubview:", v55, v5);
  -[PUPhotosSharingTransition delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "photosSharingTransition:viewForTransitionWithAssetCollectionsDataSource:", self, v11);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v61, "addSubview:", v5);
  objc_msgSend(v4, "transitionCollectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "backgroundColor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "transitionCollectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBackgroundColor:", v25);

  objc_msgSend(v4, "embeddedActivityView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "embeddedActivityViewFrameWhenShowing:", 0);
  objc_msgSend(v26, "setFrame:");
  objc_msgSend(v4, "embeddedActivityViewFrameWhenShowing:", 1);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  objc_msgSend(v6, "addSubview:", v26);
  -[PUPhotosSharingTransition delegate](self, "delegate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "photosSharingTransition:setVisibility:forKeyAssetIndexPath:inAssetCollectionsDataSource:", self, 0, v10, v11);

  objc_msgSend(v4, "setPhotosSharingTransitionLayout:animated:", 0, 1);
  objc_msgSend(v11, "assetCollectionsFetchResult");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "photoLibrary");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "px_beginPausingChangesWithTimeout:identifier:", CFSTR("PUPhotosSharingTransition-Present"), *MEMORY[0x1E0D7C5F0]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)MEMORY[0x1E0DC3F10];
  -[PUViewControllerTransition duration](self, "duration");
  v40 = v39;
  v41 = MEMORY[0x1E0C809B0];
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __53__PUPhotosSharingTransition_animatePresentTransition__block_invoke;
  v80[3] = &unk_1E58A6640;
  v80[4] = self;
  v81 = v3;
  v82 = v26;
  v83 = v28;
  v84 = v30;
  v85 = v32;
  v86 = v34;
  v66[0] = v41;
  v66[1] = 3221225472;
  v66[2] = __53__PUPhotosSharingTransition_animatePresentTransition__block_invoke_2;
  v66[3] = &unk_1E58A6668;
  v66[4] = self;
  v67 = v10;
  v68 = v11;
  v69 = v81;
  v79 = v57;
  v70 = v21;
  v71 = v54;
  v72 = v55;
  v73 = v82;
  v74 = v4;
  v75 = v52;
  v76 = v59;
  v77 = v37;
  v78 = v38;
  v58 = v38;
  v51 = v37;
  v60 = v59;
  v53 = v52;
  v42 = v4;
  v43 = v82;
  v44 = v55;
  v45 = v54;
  v46 = v21;
  v47 = v81;
  v48 = v11;
  v49 = v10;
  objc_msgSend(v50, "animateWithDuration:animations:completion:", v80, v66, v40);

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
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[5];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  _QWORD v63[5];
  id v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  -[PUViewControllerTransition toViewController](self, "toViewController");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosSharingTransition sharingTransitionViewController](self, "sharingTransitionViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition fromViewController](self, "fromViewController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition containerView](self, "containerView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition finalToViewFrame](self, "finalToViewFrame");
  v49 = v3;
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(v52, "insertSubview:belowSubview:", v3, v6);
  objc_msgSend(v3, "layoutIfNeeded");
  -[PUPhotosSharingTransition photosSharingTransitionContext](self, "photosSharingTransitionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyAssetIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v7;
  objc_msgSend(v7, "assetCollectionsDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v45 = (void *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v44, "insertSubview:aboveSubview:", v45, v5);
  -[PUPhotosSharingTransition delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "photosSharingTransition:viewForTransitionWithAssetCollectionsDataSource:", self, v9);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v48, "insertSubview:aboveSubview:", v5, v6);
  objc_msgSend(v4, "transitionCollectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v13);

  objc_msgSend(v6, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowsGroupOpacity:", 0);

  -[PUPhotosSharingTransition delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "photosSharingTransition:layoutForKeyAssetIndexPath:inAssetCollectionsDataSource:", self, v8, v9);
  v16 = objc_claimAutoreleasedReturnValue();

  v46 = (void *)v16;
  -[PUPhotosSharingTransition _setTransitionLayout:](self, "_setTransitionLayout:", v16);
  objc_msgSend(v4, "setPhotosSharingTransitionContext:", v7);
  objc_msgSend(v4, "embeddedActivityView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "embeddedActivityViewFrameWhenShowing:", 0);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v52, "addSubview:", v17);
  -[PUPhotosSharingTransition delegate](self, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "photosSharingTransition:setVisibility:forKeyAssetIndexPath:inAssetCollectionsDataSource:", self, 0, v8, v9);

  objc_msgSend(v4, "setPhotosSharingTransitionLayout:animated:", v16, 1);
  objc_msgSend(v9, "assetCollectionsFetchResult");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "photoLibrary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "px_beginPausingChangesWithTimeout:identifier:", CFSTR("PUPhotosSharingTransition-Dismiss"), *MEMORY[0x1E0D7C5F0]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x1E0DC3F10];
  -[PUViewControllerTransition duration](self, "duration");
  v31 = v30;
  v32 = MEMORY[0x1E0C809B0];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __53__PUPhotosSharingTransition_animateDismissTransition__block_invoke;
  v63[3] = &unk_1E58A6640;
  v63[4] = self;
  v64 = v6;
  v65 = v17;
  v66 = v19;
  v67 = v21;
  v68 = v23;
  v69 = v25;
  v53[0] = v32;
  v53[1] = 3221225472;
  v53[2] = __53__PUPhotosSharingTransition_animateDismissTransition__block_invoke_2;
  v53[3] = &unk_1E58A6690;
  v53[4] = self;
  v54 = v8;
  v55 = v9;
  v56 = v44;
  v57 = v5;
  v58 = v45;
  v59 = v65;
  v60 = v4;
  v61 = v28;
  v62 = v29;
  v43 = v29;
  v42 = v28;
  v33 = v4;
  v34 = v65;
  v35 = v45;
  v36 = v5;
  v37 = v44;
  v38 = v9;
  v39 = v8;
  v40 = v6;
  objc_msgSend(v41, "animateWithDuration:animations:completion:", v63, v53, v31);

}

- (PUPhotosSharingTransitionViewController)sharingTransitionViewController
{
  return self->_sharingTransitionViewController;
}

- (void)setSharingTransitionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_sharingTransitionViewController, a3);
}

- (PUPhotosSharingTransitionContext)photosSharingTransitionContext
{
  return self->_photosSharingTransitionContext;
}

- (void)setPhotosSharingTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_photosSharingTransitionContext, a3);
}

- (PUPhotosSharingTransitionDelegate)delegate
{
  return (PUPhotosSharingTransitionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  objc_storeStrong((id *)&self->_photosSharingTransitionContext, 0);
  objc_storeStrong((id *)&self->_sharingTransitionViewController, 0);
}

uint64_t __53__PUPhotosSharingTransition_animateDismissTransition__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosSharingTransition:willAnimatePresent:", *(_QWORD *)(a1 + 32), 0);

  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

uint64_t __53__PUPhotosSharingTransition_animateDismissTransition__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosSharingTransition:setVisibility:forKeyAssetIndexPath:inAssetCollectionsDataSource:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 56), "insertSubview:aboveSubview:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 72), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 64), "addSubview:", *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 88), "setPhotosSharingTransitionContext:", 0);
  objc_msgSend(*(id *)(a1 + 96), "px_endPausingChanges:", *(_QWORD *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 32), "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "transitionWasCancelled") ^ 1;

  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", v4);
}

uint64_t __53__PUPhotosSharingTransition_animatePresentTransition__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosSharingTransition:willAnimatePresent:", *(_QWORD *)(a1 + 32), 1);

  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

uint64_t __53__PUPhotosSharingTransition_animatePresentTransition__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosSharingTransition:setVisibility:forKeyAssetIndexPath:inAssetCollectionsDataSource:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 56), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupOpacity:", *(unsigned __int8 *)(a1 + 136));

  objc_msgSend(*(id *)(a1 + 64), "insertSubview:aboveSubview:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 80), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 72), "addSubview:", *(_QWORD *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 96), "transitionCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", *(_QWORD *)(a1 + 104));

  objc_msgSend(*(id *)(a1 + 112), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 96), "setPhotosSharingTransitionContext:", 0);
  objc_msgSend(*(id *)(a1 + 120), "px_endPausingChanges:", *(_QWORD *)(a1 + 128));
  objc_msgSend(*(id *)(a1 + 32), "transitionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "transitionWasCancelled") ^ 1;

  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", v6);
}

@end
