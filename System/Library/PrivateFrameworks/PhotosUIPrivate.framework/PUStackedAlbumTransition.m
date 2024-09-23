@implementation PUStackedAlbumTransition

- (PUStackedAlbumTransition)init
{
  objc_super v4;

  +[PULayoutAnimationsHelper stackedTransitionAnimationPreferredDurationUsingSpringAnimations:](PULayoutAnimationsHelper, "stackedTransitionAnimationPreferredDurationUsingSpringAnimations:", 1);
  v4.receiver = self;
  v4.super_class = (Class)PUStackedAlbumTransition;
  return -[PUNavigationTransition initWithPushDuration:popDuration:](&v4, sel_initWithPushDuration_popDuration_);
}

- (id)_newInteractiveTransitionViewAnimatorForLayout:(id)a3 collectionView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
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
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  UIView *v48;
  UIView *animatorView;
  void *v50;
  PUTransitionViewAnimator *v51;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;

  v6 = a4;
  objc_msgSend(a3, "visibleStackedItemLayoutAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  LODWORD(v7) = -[PUStackedAlbumTransition isExpanding](self, "isExpanding");
  objc_msgSend(v6, "frame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = v21 / v23;
  if ((_DWORD)v7)
  {
    v26 = PURectWithAspectRatioFillingRect(v25, v10, v12, v14, v16);
    v28 = v27;
    v55 = v20;
    v30 = v29;
    v32 = v31;
    UIRectGetCenter();
    v57 = v33;
    v35 = v34;
  }
  else
  {
    v36 = PURectWithAspectRatioFillingRect(v25, v10, v12, v14, v16);
    v54 = v37;
    v56 = v36;
    v53 = v38;
    v26 = v18;
    v40 = v39;
    -[PUStackedAlbumTransition _photoPinchGestureRecognizer](self, "_photoPinchGestureRecognizer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "adjustedInitialCenterInView:", v6);
    v57 = v42;
    v44 = v43;

    objc_msgSend(v6, "bounds");
    v46 = v45;
    objc_msgSend(v6, "contentInset");
    v28 = v20;
    v30 = v22;
    v35 = v44 - (v46 + v47);
    v32 = v24;
    v24 = v40;
    v22 = v53;
    v18 = v56;
    v55 = v54;
  }
  -[UIView removeFromSuperview](self->_animatorView, "removeFromSuperview");
  v48 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v26, v28, v30, v32);
  animatorView = self->_animatorView;
  self->_animatorView = v48;

  -[UIView setHidden:](self->_animatorView, "setHidden:", 1);
  objc_msgSend(v6, "superview");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addSubview:", self->_animatorView);

  v51 = -[PUTransitionViewAnimator initWithView:sourceFrame:targetFrame:anchorPoint:shouldUseTargetAspectRatio:rampUpDuration:direction:]([PUTransitionViewAnimator alloc], "initWithView:sourceFrame:targetFrame:anchorPoint:shouldUseTargetAspectRatio:rampUpDuration:direction:", self->_animatorView, 1, -[PUStackedAlbumTransition isExpanding](self, "isExpanding") ^ 1, v26, v28, v30, v32, v18, v55, v22, v24, v57, *(_QWORD *)&v35, 0);
  -[PUTransitionViewAnimator setAutoUpdates:](v51, "setAutoUpdates:", 0);

  return v51;
}

- (id)_newTransitionLayoutWithStackedAlbumLayout:(id)a3 otherLayout:(id)a4 forPush:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  PUStackedAlbumTransitionLayout *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v5)
    v11 = v8;
  else
    v11 = v9;
  if (v5)
    v12 = v9;
  else
    v12 = v8;
  v13 = v12;
  v14 = v11;
  v15 = -[PUStackedAlbumTransitionLayout initWithCurrentLayout:nextLayout:isExpanding:]([PUStackedAlbumTransitionLayout alloc], "initWithCurrentLayout:nextLayout:isExpanding:", v14, v13, v5);
  objc_msgSend(v8, "referenceCenter");
  v17 = v16;
  v19 = v18;

  v20 = v17;
  v21 = v19;
  if (!v5)
    -[PUStackedAlbumTransition interactionCenter](self, "interactionCenter", v17, v19);
  -[PUStackedAlbumTransitionLayout setInitialCollapsedStackCenter:](v15, "setInitialCollapsedStackCenter:", v20, v21);
  -[PUStackedAlbumTransitionLayout setFinalCollapsedStackCenter:](v15, "setFinalCollapsedStackCenter:", v17, v19);

  return v15;
}

- (id)_popTransitionInitialVisibleStackedAssetIndexPaths:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "visibleStackedItemLayoutAttributes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "indexPath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)startInteractiveTransitionWithPhotoPinchGestureRecognizer:(id)a3 isExpanding:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[PUStackedAlbumTransition _setExpanding:](self, "_setExpanding:", v4);
  -[PUStackedAlbumTransition _setPhotoPinchGestureRecognizer:](self, "_setPhotoPinchGestureRecognizer:", v6);
  -[PUStackedAlbumTransition updateInteractiveTransitionWithPhotoPinchGestureRecognizer:](self, "updateInteractiveTransitionWithPhotoPinchGestureRecognizer:", v6);

}

- (void)updateInteractiveTransitionWithPhotoPinchGestureRecognizer:(id)a3
{
  uint64_t v4;
  BOOL v5;
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
  double v16;
  double v17;
  double v18;
  id v19;

  v19 = a3;
  v4 = objc_msgSend(v19, "state");
  v5 = (unint64_t)(v4 - 3) < 2 || (unint64_t)objc_msgSend(v19, "numberOfTouches") < 2;
  -[PUStackedAlbumTransition _transitionViewAnimator](self, "_transitionViewAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v19, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (v4 == 4)
      {
        objc_msgSend(v6, "cancelWithoutAnimation");
      }
      else
      {
        objc_msgSend(v19, "adjustedTranslationVelocityInView:", v7);
        v14 = v13;
        v16 = v15;
        objc_msgSend(v19, "adjustedScaleVelocityInView:", v7);
        v18 = v17;
        if (objc_msgSend(v6, "shouldFinish"))
          objc_msgSend(v6, "finishWithTranslationVelocity:rotationVelocity:scaleVelocity:shouldBounce:", 0, v14, v16, 0.0, v18);
        else
          objc_msgSend(v6, "cancelWithTranslationVelocity:rotationVelocity:scaleVelocity:shouldBounce:", 0, v14, v16, 0.0, v18);
      }
    }
    else
    {
      objc_msgSend(v19, "adjustedTranslationInView:", v7);
      v9 = v8;
      v11 = v10;
      objc_msgSend(v19, "adjustedScaleInView:", v7);
      objc_msgSend(v6, "updateWithTranslation:rotation:scale:", v9, v11, 0.0, v12);
    }

  }
}

- (void)completeInteractiveOperation:(int64_t)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  -[PUStackedAlbumTransition _interactiveTransitionLayout](self, "_interactiveTransitionLayout", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v12 = v7;
    -[PUStackedAlbumTransition _disableToken](self, "_disableToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUStackedAlbumTransition.m"), 168, CFSTR("expected to be disabled via animator callback"));

    }
    objc_msgSend(v12, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v4)
      objc_msgSend(v9, "finishInteractiveTransition");
    else
      objc_msgSend(v9, "cancelInteractiveTransition");

    v7 = v12;
  }

}

- (void)animatePushTransition
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double *v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  _BOOL4 v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  char v46;
  id v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  BOOL v64;
  BOOL v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  _QWORD v76[4];
  id v77;
  id v78;
  _QWORD *v79;
  BOOL v80;
  BOOL v81;
  _QWORD v82[4];
  id v83;
  id v84;
  _QWORD *v85;
  _QWORD v86[4];
  id v87;
  _QWORD *v88;
  char v89;
  _QWORD v90[4];
  _QWORD v91[4];
  id v92;
  _QWORD aBlock[5];
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  BOOL v103;

  v3 = 1;
  -[PUStackedAlbumTransition _setExpanding:](self, "_setExpanding:", 1);
  -[PUViewControllerTransition toViewController](self, "toViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gridLayout");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition fromViewController](self, "fromViewController");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition containerView](self, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition finalToViewFrame](self, "finalToViewFrame");
  objc_msgSend(v6, "setFrame:");
  v74 = v6;
  objc_msgSend(v8, "insertSubview:aboveSubview:", v6, v7);
  if ((objc_msgSend(v4, "isEmpty") & 1) == 0)
    v3 = -[PUStackedAlbumTransition isForFolder](self, "isForFolder");
  -[PUViewControllerTransition interactiveTransition](self, "interactiveTransition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "contentOffset");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v8, "backgroundColor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v14);

  objc_msgSend(v4, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "backgroundColor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v17);

  objc_msgSend(v5, "setScrollEnabled:", 0);
  v75 = v9;
  v65 = v9 != 0;
  v18 = (double *)MEMORY[0x1E0D7C5F8];
  if (!v9)
    v18 = (double *)MEMORY[0x1E0D7C5F0];
  v19 = *v18;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "px_beginPausingChangesWithTimeout:identifier:", CFSTR("PUStackedAlbumTransition-Push"), v19);
  v21 = objc_claimAutoreleasedReturnValue();

  -[PUStackedAlbumTransition photoCollection](self, "photoCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUStackedAlbumTransition ph_photoCollection](self, "ph_photoCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PUStackedAlbumTransition_animatePushTransition__block_invoke;
  aBlock[3] = &unk_1E58A82A0;
  aBlock[4] = self;
  v24 = v4;
  v94 = v24;
  v25 = v5;
  v95 = v25;
  v73 = v72;
  v96 = v73;
  v103 = v3;
  v26 = v23;
  v97 = v26;
  v27 = v3;
  v28 = v22;
  v98 = v28;
  v29 = v8;
  v99 = v29;
  v60 = v70;
  v100 = v60;
  v61 = v7;
  v101 = v61;
  v59 = (id)v21;
  v102 = v59;
  v67 = _Block_copy(aBlock);
  -[PUStackedAlbumTransition delegate](self, "delegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = objc_opt_respondsToSelector();

  -[PUStackedAlbumTransition delegate](self, "delegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  v62 = v29;
  v68 = v28;
  if ((v21 & 1) != 0)
    objc_msgSend(v31, "stackedAlbumTransition:layoutForPHCollection:forCollectionView:", self, v26, v25);
  else
    objc_msgSend(v31, "stackedAlbumTransition:layoutForCollection:forCollectionView:", self, v28, v25);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v26;

  objc_msgSend(v33, "setInteractive:", v75 != 0);
  objc_msgSend(v73, "globalHeaderAttributes");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setGlobalHeaderAttributes:");
  -[PUStackedAlbumTransition _setTransitionLayout:](self, "_setTransitionLayout:", v33);
  if (v33)
    v34 = v27;
  else
    v34 = 1;
  v35 = MEMORY[0x1E0C809B0];
  if (v34 == 1)
  {
    objc_msgSend(v24, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAlpha:", 0.0);

    v37 = 0;
  }
  else
  {
    -[PUStackedAlbumTransition delegate](self, "delegate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_opt_respondsToSelector();

    -[PUStackedAlbumTransition delegate](self, "delegate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if ((v39 & 1) != 0)
      objc_msgSend(v40, "stackedAlbumTransition:setVisibility:forPHCollection:", self, 0, v69);
    else
      objc_msgSend(v40, "stackedAlbumTransition:setVisibility:forCollection:", self, 0, v68);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v73, "setTransitionStartContentOffset:", v11, v13);
    objc_msgSend(v73, "setTransitioningDelegate:", self);
    objc_msgSend(v33, "albumListTransitionContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setUsesContentOffsetAutoAdjust:", v75 != 0);
    objc_msgSend(v24, "setAlbumListTransitionContext:", v37);
    objc_msgSend(v24, "setAlbumListTransitionLayout:animated:", v33, 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v24, "setInitiallyScrolledToBottom:", 0);
  }
  v71 = v25;
  objc_msgSend(v74, "layoutIfNeeded");
  v64 = v27;
  if (v75)
  {
    v42 = -[PUStackedAlbumTransition _newInteractiveTransitionViewAnimatorForLayout:collectionView:](self, "_newInteractiveTransitionViewAnimatorForLayout:collectionView:", v33, v25);
    objc_msgSend(v42, "setDelegate:", self);
    -[PUStackedAlbumTransition _setTransitionViewAnimator:](self, "_setTransitionViewAnimator:", v42);
    v43 = v67;
    if ((v34 & 1) == 0)
    {
      v44 = -[PUStackedAlbumTransition _newTransitionLayoutWithStackedAlbumLayout:otherLayout:forPush:](self, "_newTransitionLayoutWithStackedAlbumLayout:otherLayout:forPush:", v33, v73, 1);
      objc_msgSend(v37, "setTransitionLayout:", v44);
      v91[0] = MEMORY[0x1E0C809B0];
      v91[1] = 3221225472;
      v91[2] = __49__PUStackedAlbumTransition_animatePushTransition__block_invoke_2;
      v91[3] = &unk_1E58A82C8;
      v92 = v67;
      objc_msgSend(v71, "startInteractiveTransitionToCollectionViewLayout:completion:", v73, v91);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = MEMORY[0x1E0C809B0];
      -[PUStackedAlbumTransition _setInteractiveTransitionLayout:](self, "_setInteractiveTransitionLayout:", v45);

    }
    v46 = v34 ^ 1;

  }
  else
  {
    v46 = 0;
    v43 = v67;
  }
  objc_msgSend(v24, "handleTransitionFade:animate:", 0, 0);
  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x2020000000;
  v90[3] = 0;
  v86[0] = v35;
  v86[1] = 3221225472;
  v86[2] = __49__PUStackedAlbumTransition_animatePushTransition__block_invoke_3;
  v86[3] = &unk_1E58A82F0;
  v88 = v90;
  v89 = v46;
  v47 = v43;
  v87 = v47;
  v48 = _Block_copy(v86);
  -[PUNavigationTransition pushDuration](self, "pushDuration");
  v50 = v49;
  v51 = (void *)MEMORY[0x1E0DC3F10];
  v52 = v49 * 0.5;
  v82[0] = v35;
  v82[1] = 3221225472;
  v82[2] = __49__PUStackedAlbumTransition_animatePushTransition__block_invoke_4;
  v82[3] = &unk_1E58AAD18;
  v85 = v90;
  v53 = v24;
  v83 = v53;
  v54 = v66;
  v84 = v54;
  objc_msgSend(v51, "animateWithDuration:animations:completion:", v82, v48, v52);
  v55 = (void *)MEMORY[0x1E0DC3F10];
  v76[0] = v35;
  v76[1] = 3221225472;
  v76[2] = __49__PUStackedAlbumTransition_animatePushTransition__block_invoke_5;
  v76[3] = &unk_1E58A8318;
  v79 = v90;
  v80 = v65;
  v81 = v64;
  v56 = v33;
  v77 = v56;
  v57 = v53;
  v78 = v57;
  objc_msgSend(v55, "animateWithDuration:animations:completion:", v76, v48, v50);

  _Block_object_dispose(v90, 8);
}

- (void)animatePopTransition
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double *v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  NSSet *v51;
  NSSet *popTransitionInitialVisibleStackedAssetIndexPaths;
  id v53;
  id v54;
  void *v55;
  char v56;
  uint64_t v57;
  id v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  BOOL v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  BOOL v83;
  void *v84;
  _QWORD v85[4];
  id v86;
  id v87;
  _QWORD *v88;
  BOOL v89;
  BOOL v90;
  _QWORD v91[4];
  id v92;
  _QWORD *v93;
  _QWORD v94[4];
  id v95;
  _QWORD *v96;
  char v97;
  _QWORD v98[4];
  _QWORD v99[4];
  id v100;
  _QWORD aBlock[4];
  id v102;
  id v103;
  id v104;
  PUStackedAlbumTransition *v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;

  -[PUStackedAlbumTransition _setExpanding:](self, "_setExpanding:", 0);
  -[PUViewControllerTransition toViewController](self, "toViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition fromViewController](self, "fromViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition finalToViewFrame](self, "finalToViewFrame");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v7, "insertSubview:belowSubview:", v4, v6);
  objc_msgSend(v4, "layoutIfNeeded");
  v76 = (void *)v6;
  v77 = v3;
  v83 = (objc_msgSend(v5, "isEmpty") & 1) != 0 || -[PUStackedAlbumTransition isForFolder](self, "isForFolder");
  -[PUViewControllerTransition interactiveTransition](self, "interactiveTransition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "backgroundColor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v9);

  objc_msgSend(v5, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "gridLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setScrollEnabled:", 0);
  v84 = v8;
  v78 = v8 != 0;
  v14 = (double *)MEMORY[0x1E0D7C5F8];
  if (!v8)
    v14 = (double *)MEMORY[0x1E0D7C5F0];
  v15 = *v14;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "px_beginPausingChangesWithTimeout:identifier:", CFSTR("PUStackedAlbumTransition-Pop"), v15);
  v17 = objc_claimAutoreleasedReturnValue();

  -[PUStackedAlbumTransition photoCollection](self, "photoCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUStackedAlbumTransition ph_photoCollection](self, "ph_photoCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PUStackedAlbumTransition_animatePopTransition__block_invoke;
  aBlock[3] = &unk_1E58A8340;
  v82 = v5;
  v102 = v82;
  v20 = v13;
  v103 = v20;
  v75 = v11;
  v104 = v75;
  v105 = self;
  v21 = v19;
  v106 = v21;
  v22 = v18;
  v107 = v22;
  v23 = v12;
  v108 = v23;
  v24 = v7;
  v109 = v24;
  v71 = v80;
  v110 = v71;
  v25 = v4;
  v111 = v25;
  v70 = (id)v17;
  v112 = v70;
  v81 = _Block_copy(aBlock);
  -[PUStackedAlbumTransition delegate](self, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = objc_opt_respondsToSelector();

  -[PUStackedAlbumTransition delegate](self, "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if ((v17 & 1) != 0)
    objc_msgSend(v27, "stackedAlbumTransition:layoutForPHCollection:forCollectionView:", self, v21, v20);
  else
    objc_msgSend(v27, "stackedAlbumTransition:layoutForCollection:forCollectionView:", self, v22, v20);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "setInteractive:", v84 != 0);
  objc_msgSend(v23, "globalHeaderAttributes");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setGlobalHeaderAttributes:");
  if (v29)
    v30 = v83;
  else
    v30 = 1;
  v73 = v25;
  v74 = v24;
  v79 = v22;
  if ((v30 & 1) != 0)
  {
    v31 = 0;
    v32 = v84;
  }
  else
  {
    -[PUStackedAlbumTransition delegate](self, "delegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_opt_respondsToSelector();

    -[PUStackedAlbumTransition delegate](self, "delegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if ((v34 & 1) != 0)
      objc_msgSend(v35, "stackedAlbumTransition:setVisibility:forPHCollection:", self, 0, v21);
    else
      objc_msgSend(v35, "stackedAlbumTransition:setVisibility:forCollection:", self, 0, v79);
    v32 = v84;

    if (!v84 && !-[PUStackedAlbumTransition isForStandInAlbum](self, "isForStandInAlbum"))
    {
      objc_msgSend(v20, "contentOffset");
      v38 = v37;
      objc_msgSend(v20, "contentInset");
      v40 = v38 + v39;
      objc_msgSend(v82, "gridLayout");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "collectionViewContentSize");
      v43 = v42;
      v45 = v44;

      objc_msgSend(v20, "frame");
      if (v45 < v46)
        v45 = v46;
      objc_msgSend(v29, "setYAdjust:", v40);
      objc_msgSend(v29, "setContentSizeAdjust:", v43, v45);
    }
    -[PUStackedAlbumTransition _setTransitionLayout:](self, "_setTransitionLayout:", v29);
    objc_msgSend(v23, "setTransitioningDelegate:", self);
    objc_msgSend(v23, "invalidateLayout");
    objc_msgSend(v20, "layoutIfNeeded");
    objc_msgSend(v20, "bounds");
    self->_popTransitionInitialVisibleBounds.origin.x = v47;
    self->_popTransitionInitialVisibleBounds.origin.y = v48;
    self->_popTransitionInitialVisibleBounds.size.width = v49;
    self->_popTransitionInitialVisibleBounds.size.height = v50;
    -[PUStackedAlbumTransition _popTransitionInitialVisibleStackedAssetIndexPaths:](self, "_popTransitionInitialVisibleStackedAssetIndexPaths:", v29);
    v51 = (NSSet *)objc_claimAutoreleasedReturnValue();
    popTransitionInitialVisibleStackedAssetIndexPaths = self->_popTransitionInitialVisibleStackedAssetIndexPaths;
    self->_popTransitionInitialVisibleStackedAssetIndexPaths = v51;

    objc_msgSend(v29, "albumListTransitionContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setUsesContentOffsetAutoAdjust:", v84 != 0);
    objc_msgSend(v82, "setAlbumListTransitionContext:", v31);
  }
  v72 = v21;
  v69 = v23;
  if (v32)
  {
    v53 = -[PUStackedAlbumTransition _newInteractiveTransitionViewAnimatorForLayout:collectionView:](self, "_newInteractiveTransitionViewAnimatorForLayout:collectionView:", v29, v20);
    objc_msgSend(v53, "setDelegate:", self);
    -[PUStackedAlbumTransition _setTransitionViewAnimator:](self, "_setTransitionViewAnimator:", v53);
    if ((v30 & 1) == 0)
    {
      v54 = -[PUStackedAlbumTransition _newTransitionLayoutWithStackedAlbumLayout:otherLayout:forPush:](self, "_newTransitionLayoutWithStackedAlbumLayout:otherLayout:forPush:", v29, v23, 0);
      objc_msgSend(v31, "setTransitionLayout:", v54);
      v99[0] = MEMORY[0x1E0C809B0];
      v99[1] = 3221225472;
      v99[2] = __48__PUStackedAlbumTransition_animatePopTransition__block_invoke_2;
      v99[3] = &unk_1E58A82C8;
      v100 = v81;
      objc_msgSend(v20, "startInteractiveTransitionToCollectionViewLayout:completion:", v29, v99);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUStackedAlbumTransition _setInteractiveTransitionLayout:](self, "_setInteractiveTransitionLayout:", v55);
    }
    v56 = v30 ^ 1;

  }
  else
  {
    v56 = 0;
  }
  v57 = MEMORY[0x1E0C809B0];
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x2020000000;
  v98[3] = 0;
  v94[0] = MEMORY[0x1E0C809B0];
  v94[1] = 3221225472;
  v94[2] = __48__PUStackedAlbumTransition_animatePopTransition__block_invoke_3;
  v94[3] = &unk_1E58A82F0;
  v96 = v98;
  v97 = v56;
  v58 = v81;
  v95 = v58;
  v59 = _Block_copy(v94);
  -[PUNavigationTransition popDuration](self, "popDuration");
  v61 = v60;
  v62 = (void *)MEMORY[0x1E0DC3F10];
  v63 = v60 * 0.5;
  v91[0] = v57;
  v91[1] = 3221225472;
  v91[2] = __48__PUStackedAlbumTransition_animatePopTransition__block_invoke_4;
  v91[3] = &unk_1E58AAE48;
  v93 = v98;
  v64 = v82;
  v92 = v64;
  objc_msgSend(v62, "animateWithDuration:delay:options:animations:completion:", 0, v91, v59, v63, v63);
  v65 = (void *)MEMORY[0x1E0DC3F10];
  v85[0] = v57;
  v85[1] = 3221225472;
  v85[2] = __48__PUStackedAlbumTransition_animatePopTransition__block_invoke_5;
  v85[3] = &unk_1E58A8318;
  v88 = v98;
  v89 = v78;
  v90 = v83;
  v66 = v29;
  v86 = v66;
  v67 = v64;
  v87 = v67;
  objc_msgSend(v65, "animateWithDuration:animations:completion:", v85, v59, v61);

  _Block_object_dispose(v98, 8);
}

- (void)collectionViewLayout:(id)a3 willSupplyLayoutAttributes:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  double MaxX;
  CGFloat v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double MinX;
  double MaxY;
  double v36;
  double MinY;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  CGFloat rect;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PUStackedAlbumTransition _transitionLayout](self, "_transitionLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v48 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        if (!objc_msgSend(v12, "representedElementCategory"))
        {
          objc_msgSend(v12, "indexPath");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setZIndex:", objc_msgSend(v6, "zIndexForItemAtIndexPath:", v13));
          if (!-[PUStackedAlbumTransition isExpanding](self, "isExpanding")
            && -[NSSet containsObject:](self->_popTransitionInitialVisibleStackedAssetIndexPaths, "containsObject:", v13))
          {
            objc_msgSend(v12, "center");
            v15 = v14;
            v17 = v16;
            objc_msgSend(v12, "size");
            v19 = v18;
            v53.size.height = v20;
            v45 = v15;
            v39 = v17;
            v40 = v18 * 0.5;
            v41 = v20 * 0.5;
            v42 = v20;
            v22 = v17 - v20 * 0.5;
            x = self->_popTransitionInitialVisibleBounds.origin.x;
            y = self->_popTransitionInitialVisibleBounds.origin.y;
            width = self->_popTransitionInitialVisibleBounds.size.width;
            height = self->_popTransitionInitialVisibleBounds.size.height;
            v53.origin.x = v15 - v18 * 0.5;
            v21 = v53.origin.x;
            v53.origin.y = v22;
            v53.size.width = v19;
            MaxX = CGRectGetMaxX(v53);
            v44 = x;
            v54.origin.x = x;
            v28 = y;
            v54.origin.y = y;
            v29 = width;
            v54.size.width = width;
            rect = height;
            v54.size.height = height;
            v43 = v19;
            if (MaxX >= CGRectGetMinX(v54))
            {
              v56.origin.x = v21;
              v56.origin.y = v22;
              v56.size.width = v19;
              v33 = v42;
              v56.size.height = v42;
              MinX = CGRectGetMinX(v56);
              v57.origin.x = v44;
              v30 = v28;
              v57.origin.y = v28;
              v31 = v29;
              v32 = v44;
              v57.size.width = v31;
              v57.size.height = rect;
              if (MinX > CGRectGetMaxX(v57))
              {
                v58.origin.x = v44;
                v58.origin.y = v28;
                v58.size.width = v31;
                v58.size.height = rect;
                v45 = v40 + CGRectGetMaxX(v58);
              }
            }
            else
            {
              v55.origin.x = v44;
              v30 = v28;
              v55.origin.y = v28;
              v31 = v29;
              v32 = v44;
              v55.size.width = v31;
              v55.size.height = rect;
              v45 = CGRectGetMinX(v55) - v40;
              v33 = v42;
            }
            v59.origin.x = v21;
            v59.origin.y = v22;
            v59.size.width = v43;
            v59.size.height = v33;
            MaxY = CGRectGetMaxY(v59);
            v60.origin.x = v32;
            v60.origin.y = v30;
            v60.size.width = v31;
            v60.size.height = rect;
            if (MaxY >= CGRectGetMinY(v60))
            {
              v62.origin.x = v21;
              v62.origin.y = v22;
              v62.size.width = v43;
              v62.size.height = v33;
              MinY = CGRectGetMinY(v62);
              v63.origin.x = v32;
              v63.origin.y = v30;
              v63.size.width = v31;
              v63.size.height = rect;
              v38 = CGRectGetMaxY(v63);
              v36 = v39;
              if (MinY > v38)
              {
                v64.origin.x = v32;
                v64.origin.y = v30;
                v64.size.width = v31;
                v64.size.height = rect;
                v36 = v41 + CGRectGetMaxY(v64);
              }
            }
            else
            {
              v61.origin.x = v32;
              v61.origin.y = v30;
              v61.size.width = v31;
              v61.size.height = rect;
              v36 = CGRectGetMinY(v61) - v41;
            }
            objc_msgSend(v12, "setCenter:", v45, v36, *(_QWORD *)&v39);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v9);
  }

}

- (BOOL)collectionViewLayoutShouldProvideCustomAnimations:(id)a3
{
  return !-[PUViewControllerTransition isInteractive](self, "isInteractive", a3);
}

- (void)transitionViewAnimatorDidUpdate:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  BOOL v12;
  double v13;
  double v14;
  char v15;
  void *v16;
  BOOL v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;

  v4 = a3;
  objc_msgSend(v4, "unfilteredProgress");
  v6 = v5;
  objc_msgSend(v4, "currentTranslation");
  v8 = v7;
  v10 = v9;

  v11 = -[PUStackedAlbumTransition isExpanding](self, "isExpanding");
  v12 = v11;
  if ((!v11 || v6 <= 1.0) && (v11 || v6 >= 0.0))
  {
    v17 = v6 < 0.0 && v11;
    v14 = 0.0;
    if (v17)
      goto LABEL_18;
    if (!v11 && v6 > 1.0)
      v14 = 1.0;
    else
      v14 = v6;
  }
  else
  {
    if (v11)
      v13 = 1.0;
    else
      v13 = 0.0;
    v14 = v13 + atan((v6 - v13) * 7.0) / 7.0;
  }
  v15 = !v12;
  if (self->_didAnimateRoundedCorners)
    v15 = 1;
  if ((v15 & 1) == 0 && v14 > 0.0)
  {
    self->_didAnimateRoundedCorners = 1;
    -[PUViewControllerTransition toViewController](self, "toViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleTransitionFade:animate:", 1, 1);

  }
LABEL_18:
  -[UIView frame](self->_animatorView, "frame");
  UIRectGetCenter();
  v19 = v18;
  v21 = v20;
  -[PUStackedAlbumTransition _interactiveTransitionLayout](self, "_interactiveTransitionLayout");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCurrentCollapsedStackCenter:", v19, v21);

  -[PUStackedAlbumTransition _interactiveTransitionLayout](self, "_interactiveTransitionLayout");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setInteractionOffset:", v8, v10);
  objc_msgSend(v23, "setTransitionProgress:", v14);
  objc_msgSend(v23, "invalidateLayout");
  -[PUViewControllerTransition updateInteractiveTransitionProgress:](self, "updateInteractiveTransitionProgress:", v14);

}

- (void)transitionViewAnimatorWillEnd:(id)a3 withTargetTranslation:(CGPoint *)a4
{
  id v6;
  _BOOL4 v7;
  int v8;
  float64x2_t v9;
  int v10;
  float64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v6 = a3;
  v7 = -[PUStackedAlbumTransition isExpanding](self, "isExpanding");
  v8 = objc_msgSend(v6, "shouldFinish");

  -[PUStackedAlbumTransition _interactiveTransitionLayout](self, "_interactiveTransitionLayout");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v9 = *(float64x2_t *)MEMORY[0x1E0C9D538];
  v10 = v8 ^ 1;
  if (v7 && (v10 & 1) == 0)
  {
    objc_msgSend(v16, "expandedStackFinalDelta", v9.f64[0]);
    v9.f64[1] = v11;
  }
  *(float64x2_t *)a4 = vaddq_f64(v9, *(float64x2_t *)a4);
  +[PUInterfaceManager beginDisablingUserInteractionForReason:](PUInterfaceManager, "beginDisablingUserInteractionForReason:", 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUStackedAlbumTransition _setDisableToken:](self, "_setDisableToken:", v12);
  if (((v8 | !v7) & 1) == 0 && self->_didAnimateRoundedCorners)
  {
    -[PUViewControllerTransition toViewController](self, "toViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = 0;
LABEL_9:
    objc_msgSend(v13, "handleTransitionFade:animate:", 0, v15);

    goto LABEL_10;
  }
  if (((v10 | v7) & 1) == 0)
  {
    -[PUViewControllerTransition fromViewController](self, "fromViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = 1;
    goto LABEL_9;
  }
LABEL_10:

}

- (void)transitionViewAnimatorDidEnd:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  UIView *animatorView;

  v4 = a4;
  objc_msgSend(a3, "setDelegate:", 0);
  -[PUStackedAlbumTransition _setTransitionViewAnimator:](self, "_setTransitionViewAnimator:", 0);
  -[UIView removeFromSuperview](self->_animatorView, "removeFromSuperview");
  animatorView = self->_animatorView;
  self->_animatorView = 0;

  if (v4)
    -[PUNavigationTransition finishInteractiveTransition](self, "finishInteractiveTransition");
  else
    -[PUNavigationTransition cancelInteractiveTransition](self, "cancelInteractiveTransition");
}

- (PLAssetContainer)photoCollection
{
  return self->_photoCollection;
}

- (void)setPhotoCollection:(id)a3
{
  objc_storeStrong((id *)&self->_photoCollection, a3);
}

- (PHCollection)ph_photoCollection
{
  return self->_ph_photoCollection;
}

- (void)ph_setPhotoCollection:(id)a3
{
  objc_storeStrong((id *)&self->_ph_photoCollection, a3);
}

- (PUStackedAlbumTransitionDelegate)delegate
{
  return (PUStackedAlbumTransitionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isExpanding
{
  return self->_isExpanding;
}

- (void)_setExpanding:(BOOL)a3
{
  self->_isExpanding = a3;
}

- (BOOL)isForStandInAlbum
{
  return self->_isForStandInAlbum;
}

- (void)setForStandInAlbum:(BOOL)a3
{
  self->_isForStandInAlbum = a3;
}

- (BOOL)isForFolder
{
  return self->_forFolder;
}

- (void)setForFolder:(BOOL)a3
{
  self->_forFolder = a3;
}

- (CGPoint)interactionCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_interactionCenter.x;
  y = self->_interactionCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInteractionCenter:(CGPoint)a3
{
  self->_interactionCenter = a3;
}

- (PUStackedAlbumLayout)_transitionLayout
{
  return (PUStackedAlbumLayout *)objc_loadWeakRetained((id *)&self->__transitionLayout);
}

- (void)_setTransitionLayout:(id)a3
{
  objc_storeWeak((id *)&self->__transitionLayout, a3);
}

- (PUStackedAlbumTransitionLayout)_interactiveTransitionLayout
{
  return self->__interactiveTransitionLayout;
}

- (void)_setInteractiveTransitionLayout:(id)a3
{
  objc_storeStrong((id *)&self->__interactiveTransitionLayout, a3);
}

- (PUTransitionViewAnimator)_transitionViewAnimator
{
  return self->__transitionViewAnimator;
}

- (void)_setTransitionViewAnimator:(id)a3
{
  objc_storeStrong((id *)&self->__transitionViewAnimator, a3);
}

- (PUPhotoPinchGestureRecognizer)_photoPinchGestureRecognizer
{
  return self->__photoPinchGestureRecognizer;
}

- (void)_setPhotoPinchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->__photoPinchGestureRecognizer, a3);
}

- (id)_disableToken
{
  return self->__disableToken;
}

- (void)_setDisableToken:(id)a3
{
  objc_storeStrong(&self->__disableToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__disableToken, 0);
  objc_storeStrong((id *)&self->__photoPinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__transitionViewAnimator, 0);
  objc_storeStrong((id *)&self->__interactiveTransitionLayout, 0);
  objc_destroyWeak((id *)&self->__transitionLayout);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ph_photoCollection, 0);
  objc_storeStrong((id *)&self->_photoCollection, 0);
  objc_storeStrong((id *)&self->_animatorView, 0);
  objc_storeStrong((id *)&self->_popTransitionInitialVisibleStackedAssetIndexPaths, 0);
}

uint64_t __48__PUStackedAlbumTransition_animatePopTransition__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "setAlbumListTransitionContext:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setBackgroundColor:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "setScrollEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 56), "_setInteractiveTransitionLayout:", 0);
  objc_msgSend(*(id *)(a1 + 56), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 56), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 56);
  if ((v5 & 1) != 0)
    objc_msgSend(v6, "stackedAlbumTransition:setVisibility:forPHCollection:", v8, 1, *(_QWORD *)(a1 + 64));
  else
    objc_msgSend(v6, "stackedAlbumTransition:setVisibility:forCollection:", v8, 1, *(_QWORD *)(a1 + 72));

  objc_msgSend(*(id *)(a1 + 56), "_disableToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 56), "_disableToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUInterfaceManager endDisablingUserInteraction:](PUInterfaceManager, "endDisablingUserInteraction:", v10);

    objc_msgSend(*(id *)(a1 + 56), "_setDisableToken:", 0);
  }
  objc_msgSend(*(id *)(a1 + 80), "setTransitioningDelegate:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "setAlbumListTransitionLayout:animated:", 0, 0);
  objc_msgSend(*(id *)(a1 + 88), "setBackgroundColor:", *(_QWORD *)(a1 + 96));
  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 104), "removeFromSuperview");
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "px_endPausingChanges:", *(_QWORD *)(a1 + 112));

  return objc_msgSend(*(id *)(a1 + 56), "completeTransition:", a2);
}

uint64_t __48__PUStackedAlbumTransition_animatePopTransition__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48__PUStackedAlbumTransition_animatePopTransition__block_invoke_3(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v2 = *(_QWORD *)(v1 + 24) - 1;
  *(_QWORD *)(v1 + 24) = v2;
  if (!v2 && !*(_BYTE *)(result + 48))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __48__PUStackedAlbumTransition_animatePopTransition__block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v1);

}

void __48__PUStackedAlbumTransition_animatePopTransition__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  id v3;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (!*(_BYTE *)(a1 + 56) && !*(_BYTE *)(a1 + 57))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 40), "setAlbumListTransitionLayout:animated:", v2, 1);
      objc_msgSend(*(id *)(a1 + 40), "handleTransitionFade:animate:", 0, 1);
    }
  }
  if (*(_BYTE *)(a1 + 57) || !*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 0.0);

  }
}

uint64_t __49__PUStackedAlbumTransition_animatePushTransition__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "didCompleteTransitionAnimation");
  objc_msgSend(*(id *)(a1 + 40), "handleTransitionFade:animate:", a2, 0);
  objc_msgSend(*(id *)(a1 + 40), "setAlbumListTransitionContext:", 0);
  objc_msgSend(*(id *)(a1 + 48), "setScrollEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_setInteractiveTransitionLayout:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_disableToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_disableToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUInterfaceManager endDisablingUserInteraction:](PUInterfaceManager, "endDisablingUserInteraction:", v5);

    objc_msgSend(*(id *)(a1 + 32), "_setDisableToken:", 0);
  }
  objc_msgSend(*(id *)(a1 + 56), "setTransitioningDelegate:", 0);
  if (!*(_BYTE *)(a1 + 112))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 32);
    if ((v7 & 1) != 0)
      objc_msgSend(v8, "stackedAlbumTransition:setVisibility:forPHCollection:", v10, 1, *(_QWORD *)(a1 + 64));
    else
      objc_msgSend(v8, "stackedAlbumTransition:setVisibility:forCollection:", v10, 1, *(_QWORD *)(a1 + 72));

  }
  objc_msgSend(*(id *)(a1 + 80), "setBackgroundColor:", *(_QWORD *)(a1 + 88));
  if ((_DWORD)a2)
    objc_msgSend(*(id *)(a1 + 96), "removeFromSuperview");
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "px_endPausingChanges:", *(_QWORD *)(a1 + 104));

  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2);
}

uint64_t __49__PUStackedAlbumTransition_animatePushTransition__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__PUStackedAlbumTransition_animatePushTransition__block_invoke_3(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v2 = *(_QWORD *)(v1 + 24) - 1;
  *(_QWORD *)(v1 + 24) = v2;
  if (!v2 && !*(_BYTE *)(result + 48))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __49__PUStackedAlbumTransition_animatePushTransition__block_invoke_4(uint64_t a1)
{
  id v2;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", *(_QWORD *)(a1 + 40));

}

void __49__PUStackedAlbumTransition_animatePushTransition__block_invoke_5(uint64_t a1)
{
  id v2;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (!*(_BYTE *)(a1 + 56) && !*(_BYTE *)(a1 + 57) && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setAlbumListTransitionLayout:animated:", 0, 1);
    objc_msgSend(*(id *)(a1 + 40), "handleTransitionFade:animate:", 1, 1);
  }
  if (*(_BYTE *)(a1 + 57) || !*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "view");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlpha:", 1.0);

  }
}

@end
