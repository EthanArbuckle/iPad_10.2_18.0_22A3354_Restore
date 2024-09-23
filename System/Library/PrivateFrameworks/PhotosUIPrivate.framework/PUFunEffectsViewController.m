@implementation PUFunEffectsViewController

- (PUFunEffectsViewController)initWithReviewAsset:(id)a3 mediaProvider:(id)a4
{
  id v8;
  id v9;
  PUFunEffectsViewController *v10;
  PUObserverRegistry *v11;
  PUObserverRegistry *observerRegistry;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PUFunEffectsViewController;
  v10 = -[PUFunEffectsViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, 0, 0);
  if (v10)
  {
    if (!v8 || !v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PUFunEffectsViewController.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reviewAsset && mediaProvider"));

    }
    objc_storeStrong((id *)&v10->_reviewAsset, a3);
    objc_storeStrong((id *)&v10->_mediaProvider, a4);
    v11 = objc_alloc_init(PUObserverRegistry);
    observerRegistry = v10->_observerRegistry;
    v10->_observerRegistry = v11;

  }
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  CFXReviewViewController *v17;
  CFXReviewViewController *effectsViewController;
  void *v19;
  void *v20;
  PUReviewScreenControlBar *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PUReviewScreenControlBar *controlBar;
  PUReviewScreenControlBar *v28;
  void *v29;
  PUReviewScreenTopBar *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  PUReviewScreenTopBar *topBar;
  PUReviewScreenTopBar *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  void *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;

  v41.receiver = self;
  v41.super_class = (Class)PUFunEffectsViewController;
  -[PUFunEffectsViewController viewDidLoad](&v41, sel_viewDidLoad);
  -[PUFunEffectsViewController reviewAsset](self, "reviewAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFunEffectsViewController mediaProvider](self, "mediaProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputForAdjustmentWithMediaProvider:canHandleAdjustments:", v4, &__block_literal_global_31975);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  self->_inputAdjustmentBaseVersion = objc_msgSend(v5, "adjustmentBaseVersion");
  objc_msgSend(v5, "knownAdjustmentData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_inputHasKnownAdjustments = v6 != 0;

  v47 = 0;
  v48 = &v47;
  v49 = 0x2050000000;
  v7 = (void *)getCFXMediaItemClass_softClass;
  v50 = getCFXMediaItemClass_softClass;
  if (!getCFXMediaItemClass_softClass)
  {
    v42 = MEMORY[0x1E0C809B0];
    v43 = 3221225472;
    v44 = __getCFXMediaItemClass_block_invoke;
    v45 = &unk_1E58AAEB0;
    v46 = &v47;
    __getCFXMediaItemClass_block_invoke((uint64_t)&v42);
    v7 = (void *)v48[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v47, 8);
  v9 = objc_alloc_init(v8);
  objc_msgSend(v5, "knownAdjustmentData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdjustmentsData:", v10);

  objc_msgSend(v5, "baseImageFileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v9, "setOriginalAssetURL:", v11);
  }
  else
  {
    objc_msgSend(v5, "baseVideoFileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOriginalAssetURL:", v12);

  }
  v13 = objc_msgSend(v3, "mediaType");
  if (v13 == 1)
  {
    v14 = 0;
  }
  else
  {
    if (v13 != 2)
      goto LABEL_11;
    v14 = 1;
  }
  objc_msgSend(v9, "setType:", v14);
LABEL_11:
  v47 = 0;
  v48 = &v47;
  v49 = 0x2050000000;
  v15 = (void *)getCFXReviewViewControllerClass_softClass;
  v50 = getCFXReviewViewControllerClass_softClass;
  if (!getCFXReviewViewControllerClass_softClass)
  {
    v42 = MEMORY[0x1E0C809B0];
    v43 = 3221225472;
    v44 = __getCFXReviewViewControllerClass_block_invoke;
    v45 = &unk_1E58AAEB0;
    v46 = &v47;
    __getCFXReviewViewControllerClass_block_invoke((uint64_t)&v42);
    v15 = (void *)v48[3];
  }
  v40 = v3;
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v47, 8);
  v17 = (CFXReviewViewController *)objc_msgSend([v16 alloc], "initWithMediaItem:", v9);
  effectsViewController = self->_effectsViewController;
  self->_effectsViewController = v17;

  -[CFXReviewViewController setDelegate:](self->_effectsViewController, "setDelegate:", self);
  -[PUFunEffectsViewController addChildViewController:](self, "addChildViewController:", self->_effectsViewController);
  -[CFXReviewViewController view](self->_effectsViewController, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFunEffectsViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v19);

  objc_msgSend(v19, "setAutoresizingMask:", 18);
  -[CFXReviewViewController didMoveToParentViewController:](self->_effectsViewController, "didMoveToParentViewController:", self);
  v21 = objc_alloc_init(PUReviewScreenControlBar);
  -[PUReviewScreenControlBar funEffectsButton](v21, "funEffectsButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSelected:", 1);

  -[PUReviewScreenControlBar funEffectsButton](v21, "funEffectsButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addTarget:action:forControlEvents:", self, sel__handleDidTapFunEffectsButton_, 64);

  -[PUReviewScreenControlBar markupButton](v21, "markupButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addTarget:action:forControlEvents:", self, sel__handleDidTapMarkupButton_, 64);

  -[PUReviewScreenControlBar editButton](v21, "editButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addTarget:action:forControlEvents:", self, sel__handleDidTapEditButton_, 64);

  -[PUReviewScreenControlBar sendButton](v21, "sendButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addTarget:action:forControlEvents:", self, sel__handleDidTapSendButton_, 64);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CFXReviewViewController setEffectsPickerDrawer:](self->_effectsViewController, "setEffectsPickerDrawer:", v21);
  controlBar = self->_controlBar;
  self->_controlBar = v21;
  v28 = v21;

  -[PUReviewScreenControlBar setTranslatesAutoresizingMaskIntoConstraints:](v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v28, 8, 0, 0, 0, 1.0, 156.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActive:", 1);
  v30 = objc_alloc_init(PUReviewScreenTopBar);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E59BB0A0, &unk_1E59BB0B8, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewScreenTopBar setAvailableButtons:](v30, "setAvailableButtons:", v31);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E59BB0A0, &unk_1E59BB0B8, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewScreenTopBar setEnabledButtons:](v30, "setEnabledButtons:", v32);

  -[PUReviewScreenTopBar doneButton](v30, "doneButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addTarget:action:forControlEvents:", self, sel__handleDidTapDoneButton_, 64);

  -[PUReviewScreenTopBar retakeButton](v30, "retakeButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addTarget:action:forControlEvents:", self, sel__handleDidTapRetakeButton_, 64);

  -[PUFunEffectsViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addSubview:", v30);

  topBar = self->_topBar;
  self->_topBar = v30;
  v37 = v30;

  -[PUFunEffectsViewController _updateBars](self, "_updateBars");
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUFunEffectsViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setBackgroundColor:", v38);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUFunEffectsViewController;
  -[PUFunEffectsViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[PUFunEffectsViewController _updateLayout](self, "_updateLayout");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUFunEffectsViewController;
  -[PUFunEffectsViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v5, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  -[PUFunEffectsViewController _updateLayout](self, "_updateLayout");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  PUReviewScreenBarsSnapshot *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  PUReviewScreenBarsSnapshot *v36;
  id v37;
  id v38;
  id v39;
  PUReviewScreenBarsSnapshot *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];
  PUReviewScreenBarsSnapshot *v44;
  id v45;
  _QWORD v46[4];
  PUReviewScreenBarsSnapshot *v47;
  double v48;
  double v49;
  double v50;
  _QWORD v51[4];
  PUReviewScreenBarsSnapshot *v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  objc_super v62;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v62.receiver = self;
  v62.super_class = (Class)PUFunEffectsViewController;
  -[PUFunEffectsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v62, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[PUFunEffectsViewController reviewBarsModel](self, "reviewBarsModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldBarsCounterrotate");

  if (v9)
  {
    -[PUFunEffectsViewController topBar](self, "topBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "snapshotViewAfterScreenUpdates:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFunEffectsViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    UIRectGetCenter();
    v41 = v22;
    v42 = v21;
    -[PUFunEffectsViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "window");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "_toWindowOrientation");

    -[PUFunEffectsViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "window");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "_fromWindowOrientation");

    v29 = 0.0;
    v30 = 0.0;
    if (v25 != 1)
    {
      if (v25 == 3)
      {
        v30 = 1.57079633;
      }
      else if (v25 == 4)
      {
        v30 = -1.57079633;
      }
      else
      {
        v30 = 3.14159265;
        if (v25 != 2)
          v30 = 0.0;
      }
    }
    if (v28 != 1)
    {
      switch(v28)
      {
        case 3:
          v29 = 1.57079633;
          break;
        case 4:
          v29 = -1.57079633;
          break;
        case 2:
          v29 = 3.14159265;
          break;
        default:
          v29 = 0.0;
          break;
      }
    }
    v31 = v29 - v30;
    v32 = objc_alloc_init(PUReviewScreenBarsSnapshot);
    -[PUReviewScreenBarsSnapshot addSubview:](v32, "addSubview:", v11);
    -[PUFunEffectsViewController view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addSubview:", v32);

    v34 = (void *)MEMORY[0x1E0DC3F10];
    v35 = MEMORY[0x1E0C809B0];
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __81__PUFunEffectsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v51[3] = &unk_1E589FA88;
    v36 = v32;
    v55 = v14;
    v56 = v16;
    v57 = v18;
    v58 = v20;
    v59 = v42;
    v60 = v41;
    v52 = v36;
    v53 = v11;
    v37 = v10;
    v54 = v37;
    v61 = v29;
    v38 = v11;
    objc_msgSend(v34, "performWithoutAnimation:", v51);
    objc_msgSend(v37, "setHidden:", 1);
    v46[0] = v35;
    v46[1] = 3221225472;
    v46[2] = __81__PUFunEffectsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v46[3] = &unk_1E589FAB0;
    v47 = v36;
    v48 = v31;
    v49 = width;
    v50 = height;
    v43[0] = v35;
    v43[1] = 3221225472;
    v43[2] = __81__PUFunEffectsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
    v43[3] = &unk_1E58A40C0;
    v44 = v47;
    v45 = v37;
    v39 = v37;
    v40 = v47;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v46, v43);

  }
}

- (void)_updateLayout
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  __int128 v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  _OWORD v31[3];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;

  -[PUFunEffectsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PUFunEffectsViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_windowInterfaceOrientation");

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  +[PUReviewScreenUtilities reviewScreenTopBarGeometryForReferenceBounds:withOrientation:](PUReviewScreenUtilities, "reviewScreenTopBarGeometryForReferenceBounds:withOrientation:", v14, v5, v7, v9, v11);
  v15 = v35;
  v16 = v36;
  -[PUFunEffectsViewController topBar](self, "topBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBounds:", v15, v16);

  v18 = v37;
  -[PUFunEffectsViewController topBar](self, "topBar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCenter:", v18);

  v32 = v38;
  v33 = v39;
  v34 = v40;
  -[PUFunEffectsViewController topBar](self, "topBar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v32;
  v31[1] = v33;
  v31[2] = v34;
  objc_msgSend(v20, "setTransform:", v31);

  -[PUFunEffectsViewController progressIndicatorView](self, "progressIndicatorView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "intrinsicContentSize");

  UIRectCenteredIntegralRectScale();
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[PUFunEffectsViewController progressIndicatorView](self, "progressIndicatorView", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);

}

- (void)setReviewBarsModel:(id)a3
{
  PUReviewScreenBarsModel *v5;
  PUReviewScreenBarsModel *reviewBarsModel;
  PUReviewScreenBarsModel *v7;

  v5 = (PUReviewScreenBarsModel *)a3;
  reviewBarsModel = self->_reviewBarsModel;
  v7 = v5;
  if (reviewBarsModel != v5)
  {
    -[PUReviewScreenBarsModel unregisterChangeObserver:context:](reviewBarsModel, "unregisterChangeObserver:context:", self, PUReviewScreenFunEffectsBarContext);
    -[PUReviewScreenBarsModel registerChangeObserver:context:](v7, "registerChangeObserver:context:", self, PUReviewScreenFunEffectsBarContext);
    objc_storeStrong((id *)&self->_reviewBarsModel, a3);
    -[PUFunEffectsViewController _updateBars](self, "_updateBars");
  }

}

- (void)_updateBars
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[PUFunEffectsViewController reviewBarsModel](self, "reviewBarsModel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PUFunEffectsViewController controlBar](self, "controlBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "availableControls");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFunEffectsViewController _barControlsForModelControls:transitioning:](self, "_barControlsForModelControls:transitioning:", v4, objc_msgSend(v9, "isTransitioningWithCamera"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAvailableButtons:", v5);

  objc_msgSend(v9, "enabledControls");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabledButtons:", v6);

  objc_msgSend(v9, "controlCenterAlignmentPoint");
  objc_msgSend(v3, "setLayoutCenterAlignmentPoint:");
  v7 = objc_msgSend(v9, "useVerticalControlLayout");
  objc_msgSend(v3, "setUseTransparentBackground:", v7);
  objc_msgSend(v3, "setShouldLayoutVertically:", v7);
  objc_msgSend(v3, "setUseTransparentTouches:", 1);
  -[PUFunEffectsViewController topBar](self, "topBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundStyle:", v7 ^ 1);

}

- (id)_barControlsForModelControls:(id)a3 transitioning:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4 && (objc_msgSend(v5, "containsObject:", &unk_1E59BB0D0) & 1) != 0)
  {
    v7 = (id)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v7, "removeObject:", &unk_1E59BB0D0);
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PUReviewScreenFunEffectsBarContext == a5)
    -[PUFunEffectsViewController _updateBars](self, "_updateBars", a3, a4);
}

- (void)_setShouldHideBars:(BOOL)a3
{
  -[PUFunEffectsViewController _setShouldHideBars:animated:](self, "_setShouldHideBars:animated:", a3, 0);
}

- (void)_setShouldHideBars:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  double v16;

  if (self->_shouldHideBars != a3)
  {
    v4 = a4;
    self->_shouldHideBars = a3;
    if (a3)
      v6 = 0.0;
    else
      v6 = 1.0;
    -[PUFunEffectsViewController topBar](self, "topBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFunEffectsViewController controlBar](self, "controlBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "chromeDefaultAnimationDuration");
      v11 = v10;

      v12 = (void *)MEMORY[0x1E0DC3F10];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __58__PUFunEffectsViewController__setShouldHideBars_animated___block_invoke;
      v13[3] = &unk_1E58A9DF0;
      v14 = v7;
      v16 = v6;
      v15 = v8;
      objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", 6, v13, 0, v11, 0.0);

    }
    else
    {
      objc_msgSend(v7, "setAlpha:", v6);
      objc_msgSend(v8, "setAlpha:", v6);
    }

  }
}

- (void)_handleDidTapRetakeButton:(id)a3
{
  -[PUFunEffectsViewController _handleCompletion:](self, "_handleCompletion:", 0);
}

- (void)_handleDidTapDoneButton:(id)a3
{
  -[PUFunEffectsViewController _handleCompletion:](self, "_handleCompletion:", 1);
}

- (void)_handleDidTapFunEffectsButton:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD);
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
  uint64_t (*v19)(uint64_t);
  void *v20;
  void (**v21)(_QWORD);
  _QWORD aBlock[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PUFunEffectsViewController__handleDidTapFunEffectsButton___block_invoke;
  aBlock[3] = &unk_1E58ABD10;
  aBlock[4] = self;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[PUFunEffectsViewController effectsViewController](self, "effectsViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "adjustmentsData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("PHOTOEDIT_FUNEFFECTS_DISCARD_CHANGES_CANCEL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, &__block_literal_global_180);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v12);

    v13 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("PHOTOEDIT_FUNEFFECTS_DISCARD_CHANGES_CONFIRM"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v5;
    v18 = 3221225472;
    v19 = __60__PUFunEffectsViewController__handleDidTapFunEffectsButton___block_invoke_3;
    v20 = &unk_1E58AB6C0;
    v21 = v6;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, &v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v15, v17, v18, v19, v20);

    objc_msgSend(v9, "popoverPresentationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSourceView:", v4);
    objc_msgSend(v4, "bounds");
    objc_msgSend(v16, "setSourceRect:");
    -[PUFunEffectsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

  }
  else
  {
    v6[2](v6);
  }

}

- (void)_handleDidTapMarkupButton:(id)a3
{
  -[PUFunEffectsViewController _handleCompletion:](self, "_handleCompletion:", 5);
}

- (void)_handleDidTapEditButton:(id)a3
{
  -[PUFunEffectsViewController _handleCompletion:](self, "_handleCompletion:", 4);
}

- (void)_handleDidTapSendButton:(id)a3
{
  -[PUFunEffectsViewController _handleCompletion:](self, "_handleCompletion:", 2);
}

- (void)reviewViewControllerEffectsButtonWasTapped:(id)a3
{
  -[PUFunEffectsViewController _handleCompletion:](self, "_handleCompletion:", 3);
}

- (void)reviewViewController:(id)a3 didFinishExportingMediaItem:(id)a4 withError:(id)a5
{
  if (a5)
    -[PUFunEffectsViewController _handleExportFailureWithError:](self, "_handleExportFailureWithError:", a5, a4);
  else
    -[PUFunEffectsViewController _finishExportingWithMediaItem:](self, "_finishExportingWithMediaItem:", a4);
}

- (void)reviewViewControllerDidHideUserInterface:(id)a3
{
  -[PUFunEffectsViewController _setShouldHideBars:animated:](self, "_setShouldHideBars:animated:", 1, 1);
}

- (void)reviewViewControllerDidShowUserInterface:(id)a3
{
  -[PUFunEffectsViewController _setShouldHideBars:animated:](self, "_setShouldHideBars:animated:", 0, 1);
}

- (void)oneUpAssetTransition:(id)a3 requestTransitionContextWithCompletion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)oneUpAssetTransition:(id)a3 animateTransitionWithContext:(id)a4 duration:(double)a5 completion:(id)a6
{
  (*((void (**)(id, uint64_t, double))a6 + 2))(a6, 1, a5);
}

- (void)_handleCompletion:(unint64_t)a3
{
  void *v5;

  -[PUFunEffectsViewController exportAdjustmentOutput](self, "exportAdjustmentOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && a3 <= 5)
  {
    if (((1 << a3) & 0x36) != 0)
    {
      -[PUFunEffectsViewController _handleExportWithCompletion:](self, "_handleExportWithCompletion:", a3);
    }
    else if (a3)
    {
      -[PUFunEffectsViewController _handleDismissCompletion](self, "_handleDismissCompletion");
    }
    else
    {
      -[PUFunEffectsViewController _signalCompletion:withSavedAsset:](self, "_signalCompletion:withSavedAsset:", 0, 0);
    }
  }
}

- (void)_handleDismissCompletion
{
  -[PUFunEffectsViewController inputHasKnownAdjustments](self, "inputHasKnownAdjustments");
  -[PUFunEffectsViewController _signalCompletion:withSavedAsset:](self, "_signalCompletion:withSavedAsset:", 3, 0);
}

- (void)_handleExportWithCompletion:(unint64_t)a3
{
  -[PUFunEffectsViewController inputHasKnownAdjustments](self, "inputHasKnownAdjustments");
  -[PUFunEffectsViewController _exportWithCompletion:](self, "_exportWithCompletion:", a3);
}

- (void)_exportWithCompletion:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[PUFunEffectsViewController setExportCompletion:](self, "setExportCompletion:", a3);
  -[PUFunEffectsViewController reviewAsset](self, "reviewAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adjustmentOutputForInputBaseVersion:withLivePhotoSupport:", -[PUFunEffectsViewController inputAdjustmentBaseVersion](self, "inputAdjustmentBaseVersion"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "mediaType") == 1)
    objc_msgSend(v5, "renderedImageFileURL");
  else
    objc_msgSend(v5, "renderedVideoFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLAssetExplorerGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v6;
    _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, "Export FunEffects media to %{public}@", (uint8_t *)&v11, 0xCu);
  }

  -[PUFunEffectsViewController setExportAdjustmentOutput:](self, "setExportAdjustmentOutput:", v5);
  -[PUFunEffectsViewController _showProgressIndicator](self, "_showProgressIndicator");
  -[PUFunEffectsViewController effectsViewController](self, "effectsViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[PUFunEffectsViewController effectsViewController](self, "effectsViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "exportMediaItemToFileURL:", v6);

  }
}

- (void)_handleExportFailureWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLAssetExplorerGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v4;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "Failed to export FunEffects media with error: %{public}@", buf, 0xCu);
  }

  -[PUFunEffectsViewController _dismissProgressIndicator](self, "_dismissProgressIndicator");
  -[PUFunEffectsViewController setExportAdjustmentOutput:](self, "setExportAdjustmentOutput:", 0);
  -[PUFunEffectsViewController reviewAsset](self, "reviewAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mediaType");

  v8 = 0;
  if (v7 <= 3)
    v8 = off_1E589FB30[v7];
  if (MEMORY[0x1AF429AF0]())
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "debugDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("[INTERNAL ONLY] %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)MEMORY[0x1E0DC3450];
  PULocalizedString(v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alertControllerWithTitle:message:preferredStyle:", v13, v11, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0DC3448];
  PULocalizedString(CFSTR("PHOTOEDIT_EDIT_ERROR_ALERT_OK_BUTTON"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v17);

  -[PUFunEffectsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
}

- (void)_finishExportingWithMediaItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PUFunEffectsViewController _dismissProgressIndicator](self, "_dismissProgressIndicator");
  objc_msgSend(v4, "adjustmentsData");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PUFunEffectsViewController reviewAsset](self, "reviewAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFunEffectsViewController exportAdjustmentOutput](self, "exportAdjustmentOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reviewAssetWithAdjustmentOutput:adjustmentData:formatIdentifier:version:", v6, v8, CFSTR("com.apple.FunEffects"), CFSTR("1.0"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUFunEffectsViewController setExportAdjustmentOutput:](self, "setExportAdjustmentOutput:", 0);
  -[PUFunEffectsViewController _signalCompletion:withSavedAsset:](self, "_signalCompletion:withSavedAsset:", -[PUFunEffectsViewController exportCompletion](self, "exportCompletion"), v7);

}

- (void)_showProgressIndicator
{
  NSObject *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  PUProgressIndicatorView *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  PLAssetExplorerGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "FunEffects will show progress indicator", v10, 2u);
  }

  -[PUFunEffectsViewController reviewAsset](self, "reviewAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mediaType");

  if (v5 > 3)
    v6 = 0;
  else
    v6 = off_1E589FB50[v5];
  v7 = -[PUProgressIndicatorView initWithStyle:]([PUProgressIndicatorView alloc], "initWithStyle:", 0);
  -[PUProgressIndicatorView setDeterminate:](v7, "setDeterminate:", 1);
  -[PUProgressIndicatorView setShowsBackground:](v7, "setShowsBackground:", 1);
  PULocalizedString(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUProgressIndicatorView setLocalizedMessage:](v7, "setLocalizedMessage:", v8);

  -[PUProgressIndicatorView beginShowingProgressWithDelay:animated:](v7, "beginShowingProgressWithDelay:animated:", 1, 0.6);
  -[PUFunEffectsViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v7);

  -[PUFunEffectsViewController _setProgressIndicatorView:](self, "_setProgressIndicatorView:", v7);
}

- (void)_dismissProgressIndicator
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[16];

  PLAssetExplorerGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "FunEffects will dismiss progress indicator", buf, 2u);
  }

  -[PUFunEffectsViewController progressIndicatorView](self, "progressIndicatorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFunEffectsViewController _setProgressIndicatorView:](self, "_setProgressIndicatorView:", 0);
  if (objc_msgSend(v4, "isShowingProgress"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __55__PUFunEffectsViewController__dismissProgressIndicator__block_invoke;
    v5[3] = &unk_1E58ABD10;
    v6 = v4;
    objc_msgSend(v6, "endShowingProgressImmediately:animated:withCompletionHandler:", 0, 1, v5);

  }
}

- (void)_updateProgressIndicatorWithProgress:(double)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLAssetImportGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = a3;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "FunEffects updating progress: %.3f", (uint8_t *)&v7, 0xCu);
  }

  -[PUFunEffectsViewController progressIndicatorView](self, "progressIndicatorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrentProgress:", a3);

}

- (void)_signalCompletion:(unint64_t)a3 withSavedAsset:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  -[PUFunEffectsViewController observerRegistry](self, "observerRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__PUFunEffectsViewController__signalCompletion_withSavedAsset___block_invoke;
  v9[3] = &unk_1E589FAF8;
  v9[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  objc_msgSend(v7, "enumerateObserversWithBlock:", v9);

}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUFunEffectsViewController observerRegistry](self, "observerRegistry");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUFunEffectsViewController observerRegistry](self, "observerRegistry");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (PUReviewAsset)reviewAsset
{
  return self->_reviewAsset;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PUReviewScreenBarsModel)reviewBarsModel
{
  return self->_reviewBarsModel;
}

- (PUObserverRegistry)observerRegistry
{
  return self->_observerRegistry;
}

- (CFXReviewViewController)effectsViewController
{
  return self->_effectsViewController;
}

- (PUReviewScreenTopBar)topBar
{
  return self->_topBar;
}

- (PUReviewScreenControlBar)controlBar
{
  return self->_controlBar;
}

- (BOOL)inputHasKnownAdjustments
{
  return self->_inputHasKnownAdjustments;
}

- (int64_t)inputAdjustmentBaseVersion
{
  return self->_inputAdjustmentBaseVersion;
}

- (PUReviewAdjustmentOutput)exportAdjustmentOutput
{
  return self->_exportAdjustmentOutput;
}

- (void)setExportAdjustmentOutput:(id)a3
{
  objc_storeStrong((id *)&self->_exportAdjustmentOutput, a3);
}

- (unint64_t)exportCompletion
{
  return self->_exportCompletion;
}

- (void)setExportCompletion:(unint64_t)a3
{
  self->_exportCompletion = a3;
}

- (PUProgressIndicatorView)progressIndicatorView
{
  return self->_progressIndicatorView;
}

- (void)_setProgressIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_progressIndicatorView, a3);
}

- (BOOL)shouldHideBars
{
  return self->_shouldHideBars;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressIndicatorView, 0);
  objc_storeStrong((id *)&self->_exportAdjustmentOutput, 0);
  objc_storeStrong((id *)&self->_controlBar, 0);
  objc_storeStrong((id *)&self->_topBar, 0);
  objc_storeStrong((id *)&self->_effectsViewController, 0);
  objc_storeStrong((id *)&self->_observerRegistry, 0);
  objc_storeStrong((id *)&self->_reviewBarsModel, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_reviewAsset, 0);
}

uint64_t __63__PUFunEffectsViewController__signalCompletion_withSavedAsset___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "funEffectsViewController:didSaveAsset:withCompletion:", a1[4], a1[5], a1[6]);
}

uint64_t __55__PUFunEffectsViewController__dismissProgressIndicator__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __60__PUFunEffectsViewController__handleDidTapFunEffectsButton___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCompletion:", 3);
}

uint64_t __60__PUFunEffectsViewController__handleDidTapFunEffectsButton___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__PUFunEffectsViewController__setShouldHideBars_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", *(double *)(a1 + 48));
}

uint64_t __81__PUFunEffectsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 88), *(double *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 48), "bounds");
  objc_msgSend(*(id *)(a1 + 40), "setBounds:");
  objc_msgSend(*(id *)(a1 + 48), "center");
  objc_msgSend(*(id *)(a1 + 40), "setCenter:");
  CGAffineTransformMakeRotation(&v5, -*(double *)(a1 + 104));
  v2 = *(void **)(a1 + 40);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __81__PUFunEffectsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setZRotation:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 48) * 0.5, *(double *)(a1 + 56) * 0.5);
}

uint64_t __81__PUFunEffectsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "setHidden:", 0);
}

uint64_t __41__PUFunEffectsViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "adjustmentFormatIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.FunEffects"));

  objc_msgSend(v2, "adjustmentFormatVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(v5, "isEqualToString:", CFSTR("1.0"));
  return v4 & v2;
}

@end
