@implementation PUOneUpSharingAnimationController

- (PUOneUpSharingAnimationController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpSharingAnimationController.m"), 33, CFSTR("%s is not available as initializer"), "-[PUOneUpSharingAnimationController init]");

  abort();
}

- (PUOneUpSharingAnimationController)initWithTransitionContext:(id)a3 presentingViewController:(id)a4
{
  id v7;
  id v8;
  PUOneUpSharingAnimationController *v9;
  PUOneUpSharingAnimationController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUOneUpSharingAnimationController;
  v9 = -[_UISheetAnimationController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_oneUpTransitionContext, a3);
    objc_storeWeak((id *)&v10->_presentingViewController, v8);
  }

  return v10;
}

- (double)transitionDuration:(id)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  double result;

  v3 = (unint64_t)(objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation", a3) - 3) < 2;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  result = dbl_1AB0EF300[v3];
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 0.666999996;
  return result;
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  id v5;
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
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  SEL v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD *v54;
  _QWORD *v55;
  _QWORD *v56;
  _QWORD *v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  _QWORD *v62;
  _QWORD *v63;
  _QWORD block[4];
  id v65;
  PUOneUpSharingAnimationController *v66;
  id v67;
  _QWORD *v68;
  _QWORD *v69;
  _QWORD *v70;
  _QWORD *v71;
  SEL v72;
  _QWORD v73[5];
  id v74;
  id v75;
  id v76;
  id v77;
  _QWORD *v78;
  _QWORD *v79;
  _QWORD *v80;
  _QWORD *v81;
  _QWORD *v82;
  _QWORD *v83;
  _QWORD *v84;
  _QWORD v85[5];
  id v86;
  _QWORD v87[5];
  id v88;
  _QWORD v89[5];
  id v90;
  _QWORD v91[5];
  id v92;
  _QWORD v93[5];
  id v94;
  _QWORD v95[5];
  id v96;
  _QWORD v97[5];
  id v98;
  objc_super v99;

  v5 = a3;
  v99.receiver = self;
  v99.super_class = (Class)PUOneUpSharingAnimationController;
  -[_UISheetAnimationController interruptibleAnimatorForTransition:](&v99, sel_interruptibleAnimatorForTransition_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_interruptibleAnimatorForTransitionWasCalled)
  {
    self->_interruptibleAnimatorForTransitionWasCalled = 1;
    objc_msgSend(v5, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v6;
    v38 = v7;
    v42 = a2;
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v7, "photosCarouselViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (objc_class *)objc_opt_class();
          NSStringFromClass(v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "px_descriptionForAssertionMessage");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpSharingAnimationController.m"), 75, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("activityViewController.photosCarouselViewController"), v36, v37, v38);

        }
      }
    }
    objc_msgSend(v5, "containerView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mainCollectionView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpSharingAnimationController oneUpTransitionContext](self, "oneUpTransitionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentAssetReference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUOneUpSharingAnimationController oneUpTransitionContext](self, "oneUpTransitionContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOneUpPhotosSharingTransitionContext:", v11);

    -[PUOneUpSharingAnimationController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oneUpSharingAnimationController:setVisibility:forAssetReference:", self, 0, v10);

    objc_msgSend(v10, "asset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "asset");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "photoLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

    objc_msgSend(v15, "px_beginPausingChangesWithTimeout:identifier:", CFSTR("PUOneUpSharingAnimationController"), *MEMORY[0x1E0D7C5F0]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpSharingAnimationController presentingViewController](self, "presentingViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "toolbar");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v97[0] = 0;
    v97[1] = v97;
    v97[2] = 0x3032000000;
    v97[3] = __Block_byref_object_copy__39668;
    v97[4] = __Block_byref_object_dispose__39669;
    v98 = 0;
    v95[0] = 0;
    v95[1] = v95;
    v95[2] = 0x3032000000;
    v95[3] = __Block_byref_object_copy__39668;
    v95[4] = __Block_byref_object_dispose__39669;
    v96 = 0;
    v93[0] = 0;
    v93[1] = v93;
    v93[2] = 0x3032000000;
    v93[3] = __Block_byref_object_copy__39668;
    v93[4] = __Block_byref_object_dispose__39669;
    v94 = 0;
    v91[0] = 0;
    v91[1] = v91;
    v91[2] = 0x3032000000;
    v91[3] = __Block_byref_object_copy__39668;
    v91[4] = __Block_byref_object_dispose__39669;
    v92 = 0;
    v89[0] = 0;
    v89[1] = v89;
    v89[2] = 0x3032000000;
    v89[3] = __Block_byref_object_copy__39668;
    v89[4] = __Block_byref_object_dispose__39669;
    v90 = 0;
    v87[0] = 0;
    v87[1] = v87;
    v87[2] = 0x3032000000;
    v87[3] = __Block_byref_object_copy__39668;
    v87[4] = __Block_byref_object_dispose__39669;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v88 = (id)objc_claimAutoreleasedReturnValue();
    v85[0] = 0;
    v85[1] = v85;
    v85[2] = 0x3032000000;
    v85[3] = __Block_byref_object_copy__39668;
    v85[4] = __Block_byref_object_dispose__39669;
    v86 = 0;
    v18 = MEMORY[0x1E0C809B0];
    v19 = (void *)MEMORY[0x1E0DC3F10];
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke;
    v73[3] = &unk_1E58A09F8;
    v73[4] = self;
    v20 = v43;
    v74 = v20;
    v78 = v97;
    v79 = v85;
    v21 = v8;
    v75 = v21;
    v80 = v93;
    v81 = v91;
    v82 = v95;
    v83 = v89;
    v22 = v44;
    v76 = v22;
    v84 = v87;
    v23 = v45;
    v77 = v23;
    objc_msgSend(v19, "performWithoutAnimation:", v73);
    block[0] = v18;
    block[1] = 3221225472;
    block[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_5;
    block[3] = &unk_1E58A0AB0;
    v24 = v47;
    v68 = v87;
    v69 = v89;
    v65 = v24;
    v66 = self;
    v46 = v10;
    v67 = v46;
    v72 = v42;
    v70 = v95;
    v71 = v97;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v58[0] = v18;
    v58[1] = 3221225472;
    v58[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_9;
    v58[3] = &unk_1E58A0AD8;
    v25 = v20;
    v59 = v25;
    v62 = v95;
    v26 = v22;
    v60 = v26;
    v63 = v97;
    v27 = v41;
    v61 = v27;
    objc_msgSend(v24, "addAnimations:", v58);
    v48[0] = v18;
    v48[1] = 3221225472;
    v48[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_10;
    v48[3] = &unk_1E58A0B70;
    v28 = v27;
    v49 = v28;
    v29 = v23;
    v50 = v29;
    v54 = v95;
    v55 = v87;
    v56 = v97;
    v30 = v21;
    v51 = v30;
    v57 = v89;
    v31 = v15;
    v52 = v31;
    v32 = v40;
    v53 = v32;
    objc_msgSend(v24, "addCompletion:", v48);

    _Block_object_dispose(v85, 8);
    _Block_object_dispose(v87, 8);

    _Block_object_dispose(v89, 8);
    _Block_object_dispose(v91, 8);

    _Block_object_dispose(v93, 8);
    _Block_object_dispose(v95, 8);

    _Block_object_dispose(v97, 8);
    v5 = v39;
    v6 = v47;
  }

  return v6;
}

- (void)_installTransitioningBadgeViewsForAssetTransitionInfo:(id)a3 inTransitioningView:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
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
  char v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  CGFloat v35;
  CGFloat v36;
  uint64_t v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "badgeTransitionInfos");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v40;
    do
    {
      v10 = 0;
      v37 = v8;
      do
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v10);
        objc_msgSend(v11, "snapshotView", v37);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addSubview:", v12);
        objc_msgSend(v11, "frame");
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        objc_msgSend(v5, "frame");
        v22 = v21;
        v24 = v23;
        objc_msgSend(v6, "frame");
        if (v22 == v26 && v24 == v25)
        {
          v27 = v14;
        }
        else
        {
          v28 = objc_msgSend(v11, "badgesCorner");
          objc_msgSend(v11, "badgesOffset");
          v27 = v29;
          v31 = v30;
          objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "traitCollection");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "layoutDirection") == 1;

          if (((v28 & 0xA) != 0) != v34)
          {
            objc_msgSend(v6, "frame");
            v35 = CGRectGetWidth(v45) - v27;
            v46.origin.x = v14;
            v46.origin.y = v16;
            v46.size.width = v18;
            v46.size.height = v20;
            v27 = v35 - CGRectGetWidth(v46);
          }
          if ((v28 & 0xC) != 0)
          {
            objc_msgSend(v6, "frame");
            v36 = CGRectGetHeight(v47) - v31;
            v48.origin.x = v27;
            v48.origin.y = v16;
            v48.size.width = v18;
            v48.size.height = v20;
            v16 = v36 - CGRectGetHeight(v48);
          }
          else
          {
            v16 = v31;
          }
          v8 = v37;
        }
        objc_msgSend(v12, "setFrame:", v27, v16, v18, v20);
        objc_msgSend(v12, "setAlpha:", 0.0);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v8);
  }

}

- (void)_configurePhotoView:(id)a3 withContentHelper:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _OWORD v32[3];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[2];
  __int128 v37;
  __int128 v38;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "badgeInfo");
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
  }
  objc_msgSend(v5, "contentHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v37;
  v36[1] = v38;
  objc_msgSend(v8, "setBadgeInfo:", v36);

  v9 = objc_msgSend(v7, "badgeStyle");
  objc_msgSend(v5, "contentHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBadgeStyle:", v9);

  objc_msgSend(v7, "customPaddingForBadgeElements");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v5, "contentHelper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCustomPaddingForBadgeElements:", v12, v14);

  objc_msgSend(v7, "photoImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentHelper");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPhotoImage:", v16);

  objc_msgSend(v7, "placeHolderImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentHelper");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPlaceHolderImage:", v18);

  objc_msgSend(v7, "photoSize");
  v21 = v20;
  v23 = v22;
  objc_msgSend(v5, "contentHelper");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPhotoSize:", v21, v23);

  v25 = objc_msgSend(v7, "fillMode");
  objc_msgSend(v5, "contentHelper");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFillMode:", v25);

  if (v7)
  {
    objc_msgSend(v7, "imageTransform");
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
    v33 = 0u;
  }
  objc_msgSend(v5, "contentHelper");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v33;
  v32[1] = v34;
  v32[2] = v35;
  objc_msgSend(v27, "setImageTransform:", v32);

  objc_msgSend(v7, "photoDecoration");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentHelper");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setPhotoDecoration:", v28);

  v30 = objc_msgSend(v7, "isTextBannerVisible");
  objc_msgSend(v5, "contentHelper");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTextBannerVisible:", v30);

  objc_msgSend(v5, "layoutIfNeeded");
}

- (PUOneUpPhotosSharingTransitionContext)oneUpTransitionContext
{
  return self->_oneUpTransitionContext;
}

- (PUOneUpAssetTransitionViewController)presentingViewController
{
  return (PUOneUpAssetTransitionViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (PUOneUpSharingAnimationControllerDelegate)delegate
{
  return (PUOneUpSharingAnimationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_oneUpTransitionContext, 0);
}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  uint64_t v38;
  _QWORD v39[5];
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  _QWORD v48[10];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_2;
  v61[3] = &unk_1E58A0980;
  v4 = *(_QWORD *)(a1 + 32);
  v62 = *(id *)(a1 + 40);
  v64 = *(_OWORD *)(a1 + 72);
  v63 = *(id *)(a1 + 48);
  v65 = *(_OWORD *)(a1 + 88);
  objc_msgSend(v2, "oneUpAssetTransition:requestTransitionContextWithCompletion:options:", v4, v61, 3);

  objc_msgSend(*(id *)(a1 + 48), "referenceAssetTransitionInfo");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = *(void **)(a1 + 32);
  v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "contentHelper");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_configurePhotoView:withContentHelper:", v17, v18);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "contentHelper");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "badgeContainerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0.0;
  objc_msgSend(v20, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "snapshotView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "contentHelper");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTransitionSnapshotView:", v22);

  objc_msgSend(*(id *)(a1 + 32), "_installTransitioningBadgeViewsForAssetTransitionInfo:inTransitioningView:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 48), "adjacentVisibleAssetsTransitionInfos");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
  v26 = *(void **)(v25 + 40);
  *(_QWORD *)(v25 + 40) = v24;

  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__39668;
  v59 = __Block_byref_object_dispose__39669;
  v60 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__39668;
  v53 = __Block_byref_object_dispose__39669;
  v54 = 0;
  v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40);
  v48[0] = v3;
  v48[1] = 3221225472;
  v48[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_3;
  v48[3] = &unk_1E58A09A8;
  v48[6] = v9;
  v48[7] = v11;
  v48[8] = v13;
  v48[9] = v15;
  v48[4] = &v55;
  v48[5] = &v49;
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v48);
  v28 = (void *)v50[5];
  if (v28)
  {
    objc_msgSend(v28, "frame");
    v30 = v29;
    objc_msgSend(*(id *)(a1 + 56), "bounds");
    v21 = v31 - v30;
  }
  v32 = (void *)v56[5];
  if (v32)
  {
    objc_msgSend(v32, "frame");
    v35 = v33 + v34;
  }
  else
  {
    v35 = 0.0;
  }
  v36 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40);
  v39[0] = v3;
  v39[1] = 3221225472;
  v39[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_4;
  v39[3] = &unk_1E58A09D0;
  v42 = v9;
  v43 = v11;
  v44 = v13;
  v45 = v15;
  v46 = v35;
  v47 = v21;
  v39[4] = *(_QWORD *)(a1 + 32);
  v37 = *(id *)(a1 + 56);
  v38 = *(_QWORD *)(a1 + 120);
  v40 = v37;
  v41 = v38;
  objc_msgSend(v36, "enumerateObjectsUsingBlock:", v39);
  objc_msgSend(*(id *)(a1 + 64), "setAlpha:", 0.0);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_5(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
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
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  _QWORD v34[4];
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD aBlock[5];
  __int128 v39;
  uint64_t v40;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "timingParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_6;
  aBlock[3] = &unk_1E58A0A20;
  v5 = *(_QWORD *)(a1 + 40);
  v40 = *(_QWORD *)(a1 + 64);
  aBlock[4] = v5;
  v33 = *(_OWORD *)(a1 + 48);
  v6 = (id)v33;
  v39 = v33;
  v7 = _Block_copy(aBlock);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA0]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 532.84953, 46.16707, 0.0, 0.0);
  objc_msgSend(v3, "settlingDuration");
  v10 = v9;
  objc_msgSend(v8, "settlingDuration");
  v12 = v10 - v11;
  if (v12 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(a1 + 88);
    v29 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v8, "settlingDuration");
    v31 = v30;
    objc_msgSend(v3, "settlingDuration");
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", v28, v29, CFSTR("PUOneUpSharingAnimationController.m"), 223, CFSTR("timingParametersForAdjacentAssetsAnimation settling duration:%f must be lower than the sheet settling duration:%f"), v31, v32);

  }
  v13 = (void *)MEMORY[0x1E0DC3F10];
  objc_msgSend(v8, "settlingDuration");
  v15 = v14;
  objc_msgSend(v8, "mass");
  v17 = v16;
  objc_msgSend(v8, "stiffness");
  v19 = v18;
  objc_msgSend(v8, "damping");
  objc_msgSend(v13, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v7, 0, v15, v12, v17, v19, v20, 0.0);
  v34[0] = v4;
  v34[1] = 3221225472;
  v34[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_7;
  v34[3] = &unk_1E58A0A88;
  v35 = *(_OWORD *)(a1 + 64);
  v21 = *(_QWORD *)(a1 + 80);
  v36 = *(_QWORD *)(a1 + 56);
  v37 = v21;
  v22 = _Block_copy(v34);
  objc_msgSend(v3, "settlingDuration");
  v24 = v23 * 0.25;
  v25 = (void *)MEMORY[0x1E0DC3F10];
  objc_msgSend(v3, "settlingDuration");
  objc_msgSend(v25, "animateWithDuration:delay:options:animations:completion:", 0, v22, 0, v26 - v24, v24);

}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_9(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "frame");
  objc_msgSend(v2, "convertRect:fromView:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setFrame:");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "cornerRadius");
  v4 = v3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setClipsToBounds:", 1);
  objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 0.0);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "badgeTransitionInfos", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v11, "snapshotView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "frame");
        objc_msgSend(v12, "setFrame:");

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_10(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  _QWORD v17[4];
  __int128 v18;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "playbackStyle");

  v4 = (void *)MEMORY[0x1E0DC3F10];
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 4 || v3 == 2)
    v6 = 0.200000003;
  else
    v6 = 0.0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_11;
  v17[3] = &unk_1E58A0B00;
  v18 = *(_OWORD *)(a1 + 80);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_12;
  v10[3] = &unk_1E58A0B48;
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 72);
  v11 = v7;
  v9 = *(_QWORD *)(a1 + 96);
  v14 = v8;
  v15 = v9;
  v16 = *(_OWORD *)(a1 + 80);
  v12 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 64);
  objc_msgSend(v4, "animateWithDuration:animations:completion:", v17, v10, v6);

}

uint64_t __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_11(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "setAlpha:", 0.0, (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setAlpha:", 0.0);
}

uint64_t __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_12(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setOneUpPhotosSharingTransitionContext:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setOneUpPhotosSharingTransitionInfo:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setTrailingAssetTransitionInfo:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setLeadingAssetTransitionInfo:", 0);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "badgeTransitionInfos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v6), "snapshotView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeFromSuperview");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "enumerateObjectsUsingBlock:", &__block_literal_global_152_39674);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "removeFromSuperview", (_QWORD)v14);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "px_endPausingChanges:", *(_QWORD *)(a1 + 48));
}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_13(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a2, "badgeTransitionInfos", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "snapshotView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeFromSuperview");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_6(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
  {
    v2 = 0;
    do
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectAtIndexedSubscript:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndexedSubscript:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "frame");
      objc_msgSend(v4, "setFrame:");

      ++v2;
    }
    while (v2 < objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"));
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oneUpSharingAnimationController:setVisibility:forAssetReference:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40));

}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_7(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "enumerateObjectsUsingBlock:", &__block_literal_global_39679);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "badgeTransitionInfos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v6), "snapshotView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setAlpha:", 1.0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v4);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "contentHelper", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "badgeContainerView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAlpha:", 1.0);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "contentHelper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "badgeContainerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", 1.0);

}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a2, "badgeTransitionInfos", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "snapshotView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setAlpha:", 1.0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
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
  PUPhotoView *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;

  v3 = a2;
  objc_msgSend(v3, "snapshotView");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v35, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v3, "fromView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertRect:fromView:", v13, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = -[PUPhotoView initWithFrame:]([PUPhotoView alloc], "initWithFrame:", v15, v17, v19, v21);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(v3, "transitionInfo");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = v25;

  objc_msgSend(v3, "transitionInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setOneUpPhotosSharingTransitionInfo:", v28);

  objc_msgSend(v3, "trailingAssetTransitionInfo");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v31 = *(void **)(v30 + 40);
  *(_QWORD *)(v30 + 40) = v29;

  objc_msgSend(v3, "leadingAssetTransitionInfo");
  v32 = objc_claimAutoreleasedReturnValue();

  v33 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v34 = *(void **)(v33 + 40);
  *(_QWORD *)(v33 + 40) = v32;

  objc_msgSend(*(id *)(a1 + 40), "setTrailingAssetTransitionInfo:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 40), "setLeadingAssetTransitionInfo:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_3(uint64_t a1, void *a2)
{
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "frame");
  if (v4 < *(double *)(a1 + 48))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = a1 + 32;
    v7 = *(_QWORD *)(v6 + 8);
    v9 = *(_QWORD *)(v7 + 40);
    v8 = (id *)(v7 + 40);
    if (v9)
    {
      objc_msgSend(v18, "frame");
      v11 = v10;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 40), "frame");
      if (v11 <= v12)
        goto LABEL_10;
      goto LABEL_8;
    }
LABEL_9:
    objc_storeStrong(v8, a2);
    goto LABEL_10;
  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(_QWORD *)(v13 + 40);
  v8 = (id *)(v13 + 40);
  if (!v14)
    goto LABEL_9;
  objc_msgSend(v18, "frame");
  v16 = v15;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "frame");
  if (v16 < v17)
  {
    v5 = a1 + 32;
LABEL_8:
    v8 = (id *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 40);
    goto LABEL_9;
  }
LABEL_10:

}

void __72__PUOneUpSharingAnimationController_interruptibleAnimatorForTransition___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  PUPhotoView *v16;

  v3 = a2;
  objc_msgSend(v3, "frame");
  if (v4 >= *(double *)(a1 + 56))
    v8 = v4 + *(double *)(a1 + 96);
  else
    v8 = v4 - *(double *)(a1 + 88);
  v16 = -[PUPhotoView initWithFrame:]([PUPhotoView alloc], "initWithFrame:", v8, v5, v6, v7);
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v3, "contentHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_configurePhotoView:withContentHelper:", v16, v10);

  objc_msgSend(v3, "cornerRadius");
  v12 = v11;
  -[PUPhotoView layer](v16, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerRadius:", v12);

  -[PUPhotoView setClipsToBounds:](v16, "setClipsToBounds:", 1);
  -[PUPhotoView contentHelper](v16, "contentHelper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "badgeContainerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 40), "addSubview:", v16);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v16);
  objc_msgSend(*(id *)(a1 + 32), "_installTransitioningBadgeViewsForAssetTransitionInfo:inTransitioningView:", v3, v16);

}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUOneUpSharingAnimationController.m"), 37, CFSTR("%s is not available as initializer"), "+[PUOneUpSharingAnimationController new]");

  abort();
}

@end
