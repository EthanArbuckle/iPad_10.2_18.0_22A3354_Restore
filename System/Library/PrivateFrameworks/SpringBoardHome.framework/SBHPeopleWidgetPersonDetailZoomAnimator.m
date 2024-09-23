@implementation SBHPeopleWidgetPersonDetailZoomAnimator

- (SBHPeopleWidgetPersonDetailZoomAnimator)init
{
  SBHPeopleWidgetPersonDetailZoomAnimator *v2;
  SBHPeopleWidgetPersonDetailZoomAnimator *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  SBHPeopleWidgetPersonDetailInteractionSettings *settings;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBHPeopleWidgetPersonDetailZoomAnimator;
  v2 = -[SBHPeopleWidgetPersonDetailZoomAnimator init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_currentEndpoint = -1;
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widgetSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personDetailInteractionSettings");
    v6 = objc_claimAutoreleasedReturnValue();
    settings = v3->_settings;
    v3->_settings = (SBHPeopleWidgetPersonDetailInteractionSettings *)v6;

  }
  return v3;
}

- (void)prepareToAnimateFromEndpoint:(int64_t)a3 withContext:(id)a4
{
  void *v5;
  void *v6;
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
  double v17;
  double v18;
  double v19;
  double v20;
  SBHTouchPassThroughView *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  SBHTouchPassThroughView *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  SBHPeopleWidgetPersonDetailZoomAnimator *v73;
  void *v75;
  _QWORD v76[5];
  id v77;
  int64_t v78;
  _QWORD v79[2];
  _QWORD v80[3];
  CGRect v81;
  CGRect v82;

  v80[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceContentFrame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v5, "homeScreenContentFrame");
  v21 = -[SBHTouchPassThroughView initWithFrame:]([SBHTouchPassThroughView alloc], "initWithFrame:", v17, v18, v19, v20);
  -[SBHPeopleWidgetPersonDetailZoomAnimator setMatchMoveView:](self, "setMatchMoveView:", v21);
  objc_msgSend(v6, "addSubview:", v21);
  objc_msgSend(v5, "targetContentFrame");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  objc_msgSend(v6, "traitCollection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "displayScale");
  v72 = v31;

  objc_msgSend(v6, "convertRect:toView:", v21, v23, v25, v27, v29);
  -[SBHPeopleWidgetPersonDetailZoomAnimator setTargetContentFrameInMatchMoveViewSpace:](self, "setTargetContentFrameInMatchMoveViewSpace:");
  objc_msgSend(v6, "convertRect:toView:", v21, v10, v12, v14, v16);
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  -[SBHPeopleWidgetPersonDetailZoomAnimator setSourceContentFrameInMatchMoveViewSpace:](self, "setSourceContentFrameInMatchMoveViewSpace:");
  v40 = -[SBHTouchPassThroughView initWithFrame:]([SBHTouchPassThroughView alloc], "initWithFrame:", v33, v35, v37, v39);
  v73 = self;
  -[SBHPeopleWidgetPersonDetailZoomAnimator setSourceContainerView:](self, "setSourceContainerView:", v40);
  objc_msgSend(v5, "platterView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  BSRectWithSize();
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v49 = v48;
  objc_msgSend(v41, "setFrame:");
  -[SBHTouchPassThroughView addSubview:](v40, "addSubview:", v41);
  objc_msgSend(v41, "addSubview:", v7);
  objc_msgSend(v7, "setFrame:", v43, v45, v47, v49);
  objc_msgSend(v5, "sourceContentCornerRadius");
  objc_msgSend(v41, "_setContinuousCornerRadius:");
  -[SBHTouchPassThroughView addSubview:](v21, "addSubview:", v40);
  BSRectWithSize();
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v8, "_setContinuousCornerRadius:", 0.0);
  v75 = v8;
  objc_msgSend(v7, "prepareToCrossfadeImageWithView:options:", v8, 2);
  objc_msgSend(v7, "setIconLabelAlpha:", 0.0);
  objc_msgSend(v5, "referenceView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setIconImageAlpha:", 0.0);
  objc_msgSend(v50, "bounds");
  objc_msgSend(v7, "convertRect:toView:", v6);
  v52 = v51;
  v54 = v53;
  v56 = v55;
  v58 = v57;
  objc_msgSend(MEMORY[0x1E0CD27C0], "animation");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "layer");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setSourceLayer:", v60);

  objc_msgSend(v59, "setDuration:", INFINITY);
  objc_msgSend(v59, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v59, "setRemovedOnCompletion:", 0);
  objc_msgSend(v59, "setAppliesY:", 1);
  objc_msgSend(v59, "setAppliesX:", 1);
  UIRectGetCenter();
  UIPointRoundToScale();
  v62 = v61;
  v64 = v63;
  v81.origin.x = v52;
  v81.origin.y = v54;
  v81.size.width = v56;
  v81.size.height = v58;
  v65 = v62 - CGRectGetMinX(v81);
  v82.origin.x = v52;
  v82.origin.y = v54;
  v82.size.width = v56;
  v82.size.height = v58;
  *(double *)v79 = v65;
  *(double *)&v79[1] = v64 - CGRectGetMinY(v82);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v79, "{CGPoint=dd}");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v66;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setSourcePoints:", v67);

  -[SBHTouchPassThroughView layer](v21, "layer");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "animationForKey:", CFSTR("SBHPersonDetailZoomMatchMoveAnimation"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (v69)
    objc_msgSend(v68, "removeAnimationForKey:", CFSTR("SBHPersonDetailZoomMatchMoveAnimation"));
  objc_msgSend(v68, "addAnimation:forKey:", v59, CFSTR("SBHPersonDetailZoomMatchMoveAnimation"), v72);
  v70 = (void *)MEMORY[0x1E0DC3F10];
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __84__SBHPeopleWidgetPersonDetailZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke;
  v76[3] = &unk_1E8D865D8;
  v77 = v5;
  v78 = a3;
  v76[4] = v73;
  v71 = v5;
  objc_msgSend(v70, "performWithoutAnimation:", v76);

}

uint64_t __84__SBHPeopleWidgetPersonDetailZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureForEndpoint:context:inMode:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)animateToEndpoint:(int64_t)a3 withContext:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v12 = a5;
  v8 = a4;
  objc_msgSend(v8, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "wantsAnimation");

  if (v10)
  {
    -[SBHPeopleWidgetPersonDetailZoomAnimator _configureForEndpoint:context:inMode:completion:](self, "_configureForEndpoint:context:inMode:completion:", a3, v9, 3, v12);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0DC3F10];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __84__SBHPeopleWidgetPersonDetailZoomAnimator_animateToEndpoint_withContext_completion___block_invoke;
    v13[3] = &unk_1E8D86E00;
    v13[4] = self;
    v16 = a3;
    v14 = v9;
    v15 = v12;
    objc_msgSend(v11, "performWithoutAnimation:", v13);

  }
}

uint64_t __84__SBHPeopleWidgetPersonDetailZoomAnimator_animateToEndpoint_withContext_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureForEndpoint:context:inMode:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));
}

- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4
{
  void *v6;
  void *v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _OWORD v15[3];

  objc_msgSend(a4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cleanupAfterCrossfade");
  v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v15[0] = *MEMORY[0x1E0C9BAA8];
  v15[1] = v8;
  v15[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v7, "setTransform:", v15);
  objc_msgSend(v6, "platterView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    objc_msgSend(v6, "containerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v9);

    objc_msgSend(v6, "targetContentFrame");
    objc_msgSend(v9, "setFrame:");
    objc_msgSend(v9, "addSubview:", v10);
    objc_msgSend(v9, "bounds");
    objc_msgSend(v10, "setFrame:");
    objc_msgSend(v6, "targetContentCornerRadius");
    objc_msgSend(v9, "_setContinuousCornerRadius:");
  }
  else
  {
    objc_msgSend(v7, "setIcon:", 0);
    objc_msgSend(v10, "removeFromSuperview");
    objc_msgSend(v9, "removeFromSuperview");
  }
  objc_msgSend(v7, "removeFromSuperview");
  -[SBHPeopleWidgetPersonDetailZoomAnimator matchMoveView](self, "matchMoveView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAnimationForKey:", CFSTR("SBHPersonDetailZoomMatchMoveAnimation"));

  -[SBHPeopleWidgetPersonDetailZoomAnimator matchMoveView](self, "matchMoveView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeFromSuperview");

  -[SBHPeopleWidgetPersonDetailZoomAnimator setMatchMoveView:](self, "setMatchMoveView:", 0);
}

- (void)_configureForEndpoint:(int64_t)a3 context:(id)a4 inMode:(int64_t)a5 completion:(id)a6
{
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  void (**v21)(_QWORD);
  _QWORD v22[4];
  id v23;
  id v24;
  SBHPeopleWidgetPersonDetailZoomAnimator *v25;
  id v26;
  id v27;
  int64_t v28;
  int64_t v29;
  CAFrameRateRange v30;
  CAFrameRateRange v31;

  v10 = a4;
  v11 = (void (**)(_QWORD))a6;
  if (-[SBHPeopleWidgetPersonDetailZoomAnimator currentEndpoint](self, "currentEndpoint") == a3)
  {
    if (v11)
      v11[2](v11);
  }
  else
  {
    -[SBHPeopleWidgetPersonDetailZoomAnimator setCurrentEndpoint:](self, "setCurrentEndpoint:", a3);
    -[SBHPeopleWidgetPersonDetailZoomAnimator settings](self, "settings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "zoomAnimationSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fadeOutAnimationSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v13, "setFrameRateRange:highFrameRateReason:", 1114121, *(double *)&v30.minimum, *(double *)&v30.maximum, *(double *)&v30.preferred);
    v31 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v14, "setFrameRateRange:highFrameRateReason:", 1114121, *(double *)&v31.minimum, *(double *)&v31.maximum, *(double *)&v31.preferred);
    v15 = MEMORY[0x1E0C809B0];
    v16 = (void *)MEMORY[0x1E0DA9D48];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke;
    v22[3] = &unk_1E8D86EA0;
    v28 = a3;
    v23 = v10;
    v24 = v13;
    v25 = self;
    v26 = v12;
    v29 = a5;
    v27 = v14;
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke_6;
    v20[3] = &unk_1E8D86EC8;
    v21 = v11;
    v17 = v14;
    v18 = v12;
    v19 = v13;
    objc_msgSend(v16, "perform:finalCompletion:", v22, v20);

  }
}

void __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  BOOL v4;
  double v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void (*v21)(_QWORD *, const __CFString *);
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(_QWORD *, const __CFString *);
  id v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  BOOL v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  double v40;
  BOOL v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  double v51;
  BOOL v52;
  _QWORD v53[4];
  id v54;
  _QWORD aBlock[4];
  id v56;

  v3 = *(_QWORD *)(a1 + 72);
  v4 = v3 == 1;
  v33 = v3 == 1;
  if (v3 == 1)
    v5 = 1.0;
  else
    v5 = 0.0;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "sourceView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "platterView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "referenceView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke_2;
  aBlock[3] = &unk_1E8D86E28;
  v12 = v8;
  v56 = v12;
  v13 = _Block_copy(aBlock);
  v53[0] = v11;
  v53[1] = 3221225472;
  v53[2] = __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke_3;
  v53[3] = &unk_1E8D86E28;
  v14 = v12;
  v54 = v14;
  v15 = _Block_copy(v53);
  v31 = *(_QWORD *)(a1 + 80);
  v32 = (void *)MEMORY[0x1E0DC3F10];
  v42[0] = v11;
  v42[1] = 3221225472;
  v42[2] = __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke_4;
  v42[3] = &unk_1E8D86E50;
  v17 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v43 = v14;
  v44 = v16;
  v52 = v4;
  v45 = *(id *)(a1 + 32);
  v46 = v9;
  v18 = v15;
  v49 = v18;
  v51 = v5;
  v19 = v10;
  v47 = v19;
  v20 = v13;
  v50 = v20;
  v48 = *(id *)(a1 + 56);
  v21 = (void (*)(_QWORD *, const __CFString *))v7[2];
  v35 = v9;
  v34 = v14;
  v21(v7, CFSTR("zoom"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sb_animateWithSettings:mode:animations:completion:", v17, v31, v42, v22);

  v23 = (void *)MEMORY[0x1E0DC3F10];
  v24 = *(_QWORD *)(a1 + 64);
  v25 = *(_QWORD *)(a1 + 80);
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke_5;
  v36[3] = &unk_1E8D86E78;
  v41 = v33;
  v40 = v5;
  v37 = v19;
  v38 = v20;
  v39 = v18;
  v26 = (void (*)(_QWORD *, const __CFString *))v7[2];
  v27 = v18;
  v28 = v19;
  v29 = v20;
  v26(v7, CFSTR("fadeOut"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "sb_animateWithSettings:mode:animations:completion:", v24, v25, v36, v30);
}

uint64_t __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIconFadeFraction:");
}

uint64_t __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCrossfadeViewFadeFraction:");
}

void __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  void *v36;
  int v37;
  void *v38;
  CGFloat v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  int v52;
  void *v53;
  double v54;
  CGAffineTransform v55;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v58;
  CGAffineTransform v59;
  CGAffineTransform v60;
  CGAffineTransform v61;
  CGAffineTransform v62;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayScale");

  objc_msgSend(*(id *)(a1 + 40), "sourceContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 104))
  {
    objc_msgSend(v4, "targetContentFrameInMatchMoveViewSpace");
    v6 = v5;
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 48), "sourceContentFrame");
    v10 = v9;
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 32), "iconContentScale");
    SBHSizeScaled(v10, v12, v13);
    UISizeRoundToScale();
    v15 = v6 / v14;
    v17 = v8 / v16;
    if (v15 <= v17)
      v18 = v15;
    else
      v18 = v17;
    UIRectGetCenter();
    UIPointRoundToScale();
    objc_msgSend(v3, "setCenter:");
    objc_msgSend(v3, "bounds");
    UIRectGetCenter();
    UIPointRoundToScale();
    v20 = v19;
    v22 = v21;
    v23 = *(void **)(a1 + 56);
    BSRectWithSize();
    objc_msgSend(v23, "setBounds:");
    objc_msgSend(*(id *)(a1 + 56), "setCenter:", v20, v22);
    v24 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "targetContentCornerRadius");
    objc_msgSend(v24, "_setContinuousCornerRadius:");
    v25 = a1 + 80;
  }
  else
  {
    objc_msgSend(v4, "sourceContentFrameInMatchMoveViewSpace");
    UIRectGetCenter();
    UIPointRoundToScale();
    objc_msgSend(v3, "setCenter:");
    objc_msgSend(v3, "bounds");
    UIRectGetCenter();
    UIPointRoundToScale();
    v27 = v26;
    v29 = v28;
    v30 = *(void **)(a1 + 56);
    BSRectWithSize();
    objc_msgSend(v30, "setBounds:");
    objc_msgSend(*(id *)(a1 + 56), "setCenter:", v27, v29);
    v31 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "sourceContentCornerRadius");
    objc_msgSend(v31, "_setContinuousCornerRadius:");
    v18 = 1.0;
    objc_msgSend(*(id *)(a1 + 64), "setIconLabelAlpha:", 1.0);
    v25 = a1 + 88;
  }
  (*(void (**)(double))(*(_QWORD *)v25 + 16))(*(double *)(a1 + 96));
  memset(&v62, 0, sizeof(v62));
  CGAffineTransformMakeScale(&v62, v18, v18);
  v32 = *(void **)(a1 + 32);
  v61 = v62;
  objc_msgSend(v32, "setTransform:", &v61);
  objc_msgSend(*(id *)(a1 + 48), "backgroundView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setWeighting:", *(double *)(a1 + 96));

  objc_msgSend(*(id *)(a1 + 48), "backgroundTintView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setAlpha:", *(double *)(a1 + 96));

  objc_msgSend(*(id *)(a1 + 32), "setMorphFraction:", *(double *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 56), "bounds");
  UIRectGetCenter();
  UIPointRoundToScale();
  objc_msgSend(*(id *)(a1 + 32), "setCenter:");
  v35 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v61.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v61.c = v35;
  *(_OWORD *)&v61.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(*(id *)(a1 + 48), "homeScreenContentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 104))
  {
    v37 = objc_msgSend(*(id *)(a1 + 72), "usesCardStyle");
    v38 = *(void **)(a1 + 72);
    if (v37)
      objc_msgSend(v38, "cardStyleHomeScreenScale");
    else
      objc_msgSend(v38, "fullScreenHomeScreenScale");
    memset(&v60, 0, sizeof(v60));
    CGAffineTransformMakeScale(&v60, v39, v39);
    objc_msgSend(*(id *)(a1 + 48), "homeScreenContentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "center");
    UIPointRoundToScale();
    v43 = v42;
    v45 = v44;

    objc_msgSend(*(id *)(a1 + 48), "homeScreenContentFrame");
    UIRectGetCenter();
    UIPointRoundToScale();
    v47 = v46;
    v49 = v48;
    if ((BSPointEqualToPoint() & 1) != 0)
    {
      v61 = v60;
    }
    else
    {
      v50 = v47 - v43;
      v51 = v49 - v45;
      memset(&v59, 0, sizeof(v59));
      CGAffineTransformMakeTranslation(&v59, v50, v51);
      memset(&v58, 0, sizeof(v58));
      CGAffineTransformMakeTranslation(&v58, -v50, -v51);
      t1 = v60;
      v55 = v59;
      CGAffineTransformConcat(&t2, &t1, &v55);
      t1 = v58;
      CGAffineTransformConcat(&v61, &t1, &t2);
    }
    v52 = objc_msgSend(*(id *)(a1 + 72), "usesCardStyle");
    v53 = *(void **)(a1 + 72);
    if (v52)
      objc_msgSend(v53, "cardStyleHomeScreenAlpha");
    else
      objc_msgSend(v53, "fullScreenHomeScreenAlpha");
    v40 = v54;
  }
  else
  {
    v40 = 1.0;
  }
  v60 = v61;
  objc_msgSend(v36, "setTransform:", &v60);
  objc_msgSend(v36, "setAlpha:", v40);

}

uint64_t __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke_5(uint64_t a1)
{
  double v2;

  v2 = *(double *)(a1 + 56);
  if (!*(_BYTE *)(a1 + 64))
    return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 48) + 16))(v2);
  (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(v2);
  return objc_msgSend(*(id *)(a1 + 32), "setIconLabelAlpha:", 0.0);
}

uint64_t __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (SBHPeopleWidgetPersonDetailInteractionSettings)settings
{
  return self->_settings;
}

- (SBHTouchPassThroughView)matchMoveView
{
  return self->_matchMoveView;
}

- (void)setMatchMoveView:(id)a3
{
  objc_storeStrong((id *)&self->_matchMoveView, a3);
}

- (SBHTouchPassThroughView)sourceContainerView
{
  return self->_sourceContainerView;
}

- (void)setSourceContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceContainerView, a3);
}

- (CGRect)sourceContentFrameInMatchMoveViewSpace
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceContentFrameInMatchMoveViewSpace.origin.x;
  y = self->_sourceContentFrameInMatchMoveViewSpace.origin.y;
  width = self->_sourceContentFrameInMatchMoveViewSpace.size.width;
  height = self->_sourceContentFrameInMatchMoveViewSpace.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceContentFrameInMatchMoveViewSpace:(CGRect)a3
{
  self->_sourceContentFrameInMatchMoveViewSpace = a3;
}

- (CGRect)targetContentFrameInMatchMoveViewSpace
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetContentFrameInMatchMoveViewSpace.origin.x;
  y = self->_targetContentFrameInMatchMoveViewSpace.origin.y;
  width = self->_targetContentFrameInMatchMoveViewSpace.size.width;
  height = self->_targetContentFrameInMatchMoveViewSpace.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTargetContentFrameInMatchMoveViewSpace:(CGRect)a3
{
  self->_targetContentFrameInMatchMoveViewSpace = a3;
}

- (int64_t)currentEndpoint
{
  return self->_currentEndpoint;
}

- (void)setCurrentEndpoint:(int64_t)a3
{
  self->_currentEndpoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceContainerView, 0);
  objc_storeStrong((id *)&self->_matchMoveView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
