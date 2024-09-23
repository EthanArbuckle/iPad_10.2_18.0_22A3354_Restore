@implementation SBHWidgetConfigurationFlipAnimator

- (SBHWidgetConfigurationFlipAnimator)init
{
  SBHWidgetConfigurationFlipAnimator *v2;
  SBHWidgetConfigurationFlipAnimator *v3;
  void *v4;
  uint64_t v5;
  SBHWidgetSettings *widgetSettings;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHWidgetConfigurationFlipAnimator;
  v2 = -[SBHWidgetConfigurationFlipAnimator init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_currentEndpoint = -1;
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widgetSettings");
    v5 = objc_claimAutoreleasedReturnValue();
    widgetSettings = v3->_widgetSettings;
    v3->_widgetSettings = (SBHWidgetSettings *)v5;

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBHWidgetConfigurationFlipAnimator flipAnimatableProperty](self, "flipAnimatableProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)SBHWidgetConfigurationFlipAnimator;
  -[SBHWidgetConfigurationFlipAnimator dealloc](&v4, sel_dealloc);
}

- (void)prepareToAnimateFromEndpoint:(int64_t)a3 withContext:(id)a4
{
  void *v5;
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
  SBHTouchPassThroughView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double Width;
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
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  id v50;
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
  double MinX;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  double rect;
  void *recta;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  SBHTouchPassThroughView *v91;
  void *v92;
  SBHWidgetConfigurationTransformView *v93;
  void *v94;
  id val;
  _QWORD v96[5];
  id v97;
  id v98;
  int64_t v99;
  _QWORD v100[4];
  id v101;
  id v102;
  id v103[7];
  _QWORD v104[4];
  id v105;
  id v106;
  id v107[7];
  id v108;
  id from;
  double v110[2];
  id location[2];
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint64_t v116;
  double v117;
  __int128 v118;
  __int128 v119;
  id v120;
  _QWORD v121[3];
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;

  v121[1] = *MEMORY[0x1E0C80C00];
  v76 = a4;
  objc_msgSend(v76, "userInfo");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "containerView");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "sourceView");
  val = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(val, "iconContentScale");
  v78 = v5;
  objc_msgSend(v94, "targetView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "sourceContentFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  rect = v12;
  -[SBHWidgetConfigurationFlipAnimator setSourceContentFrame:](self, "setSourceContentFrame:");
  objc_msgSend(v94, "homeScreenContentView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "bounds");
  objc_msgSend(v80, "convertRect:toView:", v92);
  -[SBHWidgetConfigurationFlipAnimator setHomeScreenContentFrame:](self, "setHomeScreenContentFrame:");
  objc_msgSend(v94, "contentBoundingRect");
  v17 = -[SBHTouchPassThroughView initWithFrame:]([SBHTouchPassThroughView alloc], "initWithFrame:", v13, v14, v15, v16);
  -[SBHWidgetConfigurationFlipAnimator setMatchMoveView:](self, "setMatchMoveView:", v17);
  v91 = v17;
  objc_msgSend(v92, "addSubview:", v17);
  objc_msgSend(v94, "targetContentFrame");
  v86 = v19;
  v87 = v18;
  v88 = v21;
  v89 = v20;
  -[SBHWidgetConfigurationFlipAnimator setTargetContentFrame:](self, "setTargetContentFrame:");
  objc_msgSend(v92, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "displayScale");
  v85 = v23;

  objc_msgSend(v92, "convertRect:toView:", v17, *(double *)&v87, *(double *)&v86, *(double *)&v89, *(double *)&v88);
  -[SBHWidgetConfigurationFlipAnimator setTargetContentFrameInMatchMoveViewSpace:](self, "setTargetContentFrameInMatchMoveViewSpace:");
  v122.origin.x = v7;
  v122.origin.y = v9;
  v122.size.width = rect;
  v122.size.height = v11;
  Width = CGRectGetWidth(v122);
  *(_QWORD *)&v123.origin.x = v87;
  *(_QWORD *)&v123.origin.y = v86;
  *(_QWORD *)&v123.size.width = v89;
  *(_QWORD *)&v123.size.height = v88;
  v25 = CGRectGetWidth(v123);
  if (Width >= v25)
    v26 = Width;
  else
    v26 = v25;
  -[SBHWidgetConfigurationFlipAnimator widgetSettings](self, "widgetSettings");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "convertRect:toView:", v17, v7, v9, rect, v11);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  -[SBHWidgetConfigurationFlipAnimator setSourceContentFrameInMatchMoveViewSpace:](self, "setSourceContentFrameInMatchMoveViewSpace:");
  v93 = -[SBHWidgetConfigurationTransformView initWithFrame:]([SBHWidgetConfigurationTransformView alloc], "initWithFrame:", v28, v30, v32, v34);
  -[SBHWidgetConfigurationFlipAnimator setSourceContainerView:](self, "setSourceContainerView:");
  if (objc_msgSend(v79, "configurationEqualizesMinCardToCameraDistance"))
  {
    objc_msgSend(v79, "configurationMinCardToCameraDistance");
    v36 = -(v26 + v35);
  }
  else
  {
    objc_msgSend(v79, "configurationPerspectiveCameraDistance");
    v36 = v37;
  }
  -[SBHWidgetConfigurationTransformView layer](v93, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v113 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v114 = v39;
  v115 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v116 = *(_QWORD *)(MEMORY[0x1E0CD2610] + 80);
  v40 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  *(_OWORD *)location = *MEMORY[0x1E0CD2610];
  v112 = v40;
  v117 = 1.0 / v36;
  v41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v118 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v119 = v41;
  objc_msgSend(v38, "setSublayerTransform:", location);

  -[SBHWidgetConfigurationTransformView addSubview:](v93, "addSubview:", val);
  BSRectWithSize();
  objc_msgSend(val, "setFrame:");
  -[SBHTouchPassThroughView addSubview:](v17, "addSubview:", v93);
  UICeilToScale();
  v43 = v42;
  -[SBHWidgetConfigurationTransformView layer](v93, "layer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setZPosition:", v43 + 1.0);

  objc_msgSend(v90, "superview");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetConfigurationFlipAnimator setTargetSuperview:](self, "setTargetSuperview:", v45);

  objc_msgSend(v90, "frame");
  v47 = v46;
  v49 = v48;
  v50 = objc_alloc(MEMORY[0x1E0DC3F10]);
  BSRectWithSize();
  v81 = (void *)objc_msgSend(v50, "initWithFrame:");
  objc_msgSend(v81, "addSubview:", v90);
  objc_msgSend(v90, "setFrame:", -*(double *)&v87, -*(double *)&v86, v47, v49);
  objc_msgSend(val, "prepareToCrossfadeImageWithView:options:", v81, 5);
  objc_msgSend(val, "setIconLabelAlpha:", 0.0);
  objc_msgSend(v94, "referenceView");
  recta = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(recta, "addObserver:", self);
  objc_msgSend(recta, "bounds");
  objc_msgSend(val, "convertRect:toView:", v92);
  v52 = v51;
  v54 = v53;
  v56 = v55;
  v58 = v57;
  objc_msgSend(MEMORY[0x1E0CD27C0], "animation");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(recta, "layer");
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
  v124.origin.x = v52;
  v124.origin.y = v54;
  v124.size.width = v56;
  v124.size.height = v58;
  MinX = CGRectGetMinX(v124);
  v125.origin.x = v52;
  v125.origin.y = v54;
  v125.size.width = v56;
  v125.size.height = v58;
  v110[0] = v62 - MinX;
  v110[1] = v64 - CGRectGetMinY(v125);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v110, "{CGPoint=dd}");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v121[0] = v66;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setSourcePoints:", v67);

  -[SBHTouchPassThroughView layer](v91, "layer");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "animationForKey:", CFSTR("SBHWidgetConfigurationFlipMatchMoveAnimation"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
    objc_msgSend(v82, "removeAnimationForKey:", CFSTR("SBHWidgetConfigurationFlipMatchMoveAnimation"));
  objc_msgSend(v82, "addAnimation:forKey:", v59, CFSTR("SBHWidgetConfigurationFlipMatchMoveAnimation"));
  v69 = objc_alloc_init(MEMORY[0x1E0DC3F30]);
  -[SBHWidgetConfigurationFlipAnimator setFlipAnimatableProperty:](self, "setFlipAnimatableProperty:", v69);
  objc_initWeak(location, self);
  objc_initWeak(&from, v69);
  objc_initWeak(&v108, val);
  v70 = (void *)MEMORY[0x1E0DC3F10];
  v120 = v69;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v120, 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = MEMORY[0x1E0C809B0];
  v104[0] = MEMORY[0x1E0C809B0];
  v104[1] = 3221225472;
  v104[2] = __79__SBHWidgetConfigurationFlipAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke;
  v104[3] = &unk_1E8D87548;
  objc_copyWeak(&v105, location);
  objc_copyWeak(&v106, &from);
  v107[1] = v78;
  v107[2] = v85;
  v107[3] = v87;
  v107[4] = v86;
  v107[5] = v89;
  v107[6] = v88;
  objc_copyWeak(v107, &v108);
  v100[0] = v72;
  v100[1] = 3221225472;
  v100[2] = __79__SBHWidgetConfigurationFlipAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_2;
  v100[3] = &unk_1E8D87548;
  objc_copyWeak(&v101, location);
  objc_copyWeak(&v102, &from);
  v103[1] = v78;
  v103[2] = v85;
  v103[3] = v87;
  v103[4] = v86;
  v103[5] = v89;
  v103[6] = v88;
  objc_copyWeak(v103, &v108);
  objc_msgSend(v70, "_createTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:", v71, v104, v100);

  v73 = (void *)MEMORY[0x1E0DC3F10];
  v96[0] = v72;
  v96[1] = 3221225472;
  v96[2] = __79__SBHWidgetConfigurationFlipAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_3;
  v96[3] = &unk_1E8D87570;
  v96[4] = self;
  v74 = v69;
  v97 = v74;
  v99 = a3;
  v75 = v94;
  v98 = v75;
  objc_msgSend(v73, "performWithoutAnimation:", v96);

  objc_destroyWeak(v103);
  objc_destroyWeak(&v102);
  objc_destroyWeak(&v101);
  objc_destroyWeak(v107);
  objc_destroyWeak(&v106);
  objc_destroyWeak(&v105);
  objc_destroyWeak(&v108);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

}

void __79__SBHWidgetConfigurationFlipAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  CATransform3D v27;
  CATransform3D a;
  CATransform3D v29;
  CATransform3D v30;
  CATransform3D v31;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  if (WeakRetained && v3)
  {
    objc_msgSend(WeakRetained, "endingFlipFraction");
    v6 = v5;
    objc_msgSend(v4, "value");
    v8 = v7;
    if (v6 != v7)
    {
      objc_msgSend(v4, "presentationValue");
      v10 = v9;
      objc_msgSend(WeakRetained, "startingFlipFraction");
      v12 = v11;
      objc_msgSend(WeakRetained, "startingRotationAngle");
      v14 = v13;
      objc_msgSend(WeakRetained, "endingRotationAngle");
      v16 = v14 + (v10 - v12) * (v15 - v14) / (v6 - v12);
      if (v14 >= v16)
        v16 = v14;
      if (v15 <= v16)
        v17 = v15;
      else
        v17 = v16;
      v18 = v15 + 3.14159265;
      if (BSFloatGreaterThanFloat())
        v18 = v18 + -3.14159265 + -3.14159265;
      objc_msgSend(WeakRetained, "setStartingFlipFraction:", v10);
      objc_msgSend(WeakRetained, "setEndingFlipFraction:", v8);
      objc_msgSend(WeakRetained, "setStartingRotationAngle:", v17);
      objc_msgSend(WeakRetained, "setEndingRotationAngle:", v18);
    }
    memset(&v31, 0, sizeof(v31));
    objc_msgSend(WeakRetained, "endingRotationAngle");
    CATransform3DMakeRotation(&v31, v19, 0.0, 1.0, 0.0);
    objc_msgSend(WeakRetained, "sourceContentFrame");
    SBHSizeScaled(v20, v21, *(double *)(a1 + 56));
    UISizeRoundToScale();
    v23 = *(double *)(a1 + 88) / v22;
    v25 = *(double *)(a1 + 96) / v24;
    if (v23 > v25)
      v23 = v25;
    memset(&v30, 0, sizeof(v30));
    CATransform3DMakeScale(&v30, 1.0 - v8 * (1.0 - v23), 1.0 - v8 * (1.0 - v23), 1.0);
    v26 = objc_loadWeakRetained((id *)(a1 + 48));
    a = v30;
    v27 = v31;
    CATransform3DConcat(&v29, &a, &v27);
    objc_msgSend(v26, "setTransform3D:", &v29);

  }
}

void __79__SBHWidgetConfigurationFlipAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
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
  id v23;
  void *v24;
  void *v25;
  CATransform3D v26;
  CATransform3D a;
  CATransform3D v28;
  CATransform3D v29;
  CATransform3D v30;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  if (WeakRetained && v3)
  {
    objc_msgSend(v3, "presentationValue");
    v6 = v5;
    objc_msgSend(WeakRetained, "startingRotationAngle");
    v8 = v7;
    objc_msgSend(WeakRetained, "endingRotationAngle");
    v10 = v9;
    objc_msgSend(WeakRetained, "startingFlipFraction");
    v12 = (v10 - v8) * (v6 - v11);
    objc_msgSend(WeakRetained, "endingFlipFraction");
    v14 = v13;
    objc_msgSend(WeakRetained, "startingFlipFraction");
    v16 = v8 + v12 / (v14 - v15);
    if (v8 >= v16)
      v16 = v8;
    memset(&v30.m21, 0, 96);
    if (v10 <= v16)
      v16 = v10;
    memset(&v30, 0, 32);
    CATransform3DMakeRotation(&v30, v16, 0.0, 1.0, 0.0);
    objc_msgSend(WeakRetained, "sourceContentFrame");
    SBHSizeScaled(v17, v18, *(double *)(a1 + 56));
    UISizeRoundToScale();
    v20 = *(double *)(a1 + 88) / v19;
    v22 = *(double *)(a1 + 96) / v21;
    if (v20 > v22)
      v20 = v22;
    memset(&v29, 0, sizeof(v29));
    CATransform3DMakeScale(&v29, 1.0 - v6 * (1.0 - v20), 1.0 - v6 * (1.0 - v20), 1.0);
    v23 = objc_loadWeakRetained((id *)(a1 + 48));
    v24 = (void *)MEMORY[0x1E0CB3B18];
    a = v29;
    v26 = v30;
    CATransform3DConcat(&v28, &a, &v26);
    objc_msgSend(v24, "valueWithCATransform3D:", &v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_setPresentationValue:forKey:", v25, CFSTR("transform"));

  }
}

uint64_t __79__SBHWidgetConfigurationFlipAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_3(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "hasPerformedAnyTransition") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setHasPerformedAnyTransition:", 1);
    objc_msgSend(*(id *)(a1 + 40), "setValue:", 0.0);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_configureForEndpoint:context:inMode:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), 1, 0);
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
    -[SBHWidgetConfigurationFlipAnimator _configureForEndpoint:context:inMode:completion:](self, "_configureForEndpoint:context:inMode:completion:", a3, v9, 3, v12);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0DC3F10];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __79__SBHWidgetConfigurationFlipAnimator_animateToEndpoint_withContext_completion___block_invoke;
    v13[3] = &unk_1E8D86E00;
    v13[4] = self;
    v16 = a3;
    v14 = v9;
    v15 = v12;
    objc_msgSend(v11, "performWithoutAnimation:", v13);

  }
}

uint64_t __79__SBHWidgetConfigurationFlipAnimator_animateToEndpoint_withContext_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureForEndpoint:context:inMode:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));
}

- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _OWORD v18[8];

  objc_msgSend(a4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetConfigurationFlipAnimator flipAnimatableProperty](self, "flipAnimatableProperty");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

  -[SBHWidgetConfigurationFlipAnimator setFlipAnimatableProperty:](self, "setFlipAnimatableProperty:", 0);
  objc_msgSend(v7, "cleanupAfterCrossfade");
  v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v18[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v18[5] = v9;
  v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v18[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v18[7] = v10;
  v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v18[0] = *MEMORY[0x1E0CD2610];
  v18[1] = v11;
  v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v18[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v18[3] = v12;
  objc_msgSend(v7, "setTransform3D:", v18);
  if (!a3)
  {
    objc_msgSend(v7, "setIcon:", 0);
    objc_msgSend(v7, "removeFromSuperview");
  }
  objc_msgSend(v6, "targetView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetConfigurationFlipAnimator targetSuperview](self, "targetSuperview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v13);

  objc_msgSend(v13, "frame");
  BSRectWithSize();
  objc_msgSend(v13, "setFrame:");
  -[SBHWidgetConfigurationFlipAnimator setTargetSuperview:](self, "setTargetSuperview:", 0);
  -[SBHWidgetConfigurationFlipAnimator matchMoveView](self, "matchMoveView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeAnimationForKey:", CFSTR("SBHWidgetConfigurationFlipMatchMoveAnimation"));

  -[SBHWidgetConfigurationFlipAnimator matchMoveView](self, "matchMoveView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeFromSuperview");

  -[SBHWidgetConfigurationFlipAnimator setMatchMoveView:](self, "setMatchMoveView:", 0);
}

- (void)_configureForEndpoint:(int64_t)a3 context:(id)a4 inMode:(int64_t)a5 completion:(id)a6
{
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  _QWORD v17[4];
  id v18;
  SBHWidgetConfigurationFlipAnimator *v19;
  int64_t v20;
  CAFrameRateRange v21;

  v10 = a4;
  v11 = (void (**)(_QWORD))a6;
  if (-[SBHWidgetConfigurationFlipAnimator currentEndpoint](self, "currentEndpoint") == a3)
  {
    if (v11)
      v11[2](v11);
  }
  else
  {
    -[SBHWidgetConfigurationFlipAnimator setCurrentEndpoint:](self, "setCurrentEndpoint:", a3);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
    objc_msgSend(v12, "setDampingRatio:", 1.0);
    objc_msgSend(v12, "setResponse:", 0.55);
    v21 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v12, "setFrameRateRange:highFrameRateReason:", 1114120, *(double *)&v21.minimum, *(double *)&v21.maximum, *(double *)&v21.preferred);
    v13 = MEMORY[0x1E0C809B0];
    v14 = (void *)MEMORY[0x1E0DC3F10];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __86__SBHWidgetConfigurationFlipAnimator__configureForEndpoint_context_inMode_completion___block_invoke;
    v17[3] = &unk_1E8D865D8;
    v20 = a3;
    v18 = v10;
    v19 = self;
    v15[0] = v13;
    v15[1] = 3221225472;
    v15[2] = __86__SBHWidgetConfigurationFlipAnimator__configureForEndpoint_context_inMode_completion___block_invoke_2;
    v15[3] = &unk_1E8D86EC8;
    v16 = v11;
    objc_msgSend(v14, "sb_animateWithSettings:mode:animations:completion:", v12, a5, v17, v15);

  }
}

void __86__SBHWidgetConfigurationFlipAnimator__configureForEndpoint_context_inMode_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  CGAffineTransform v40;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform v46;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "sourceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "referenceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");

  v6 = 0.0;
  v7 = *(void **)(a1 + 40);
  if (v2 == 1)
    v8 = 1.0;
  else
    v8 = 0.0;
  if (v2 == 1)
  {
    objc_msgSend(v7, "targetContentFrameInMatchMoveViewSpace");
    UIRectGetCenter();
    UIPointRoundToScale();
    v10 = v9;
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 40), "sourceContainerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCenter:", v10, v12);

    objc_msgSend(*(id *)(a1 + 40), "flipAnimatableProperty");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:", 1.0);

    objc_msgSend(v3, "setCrossfadeCornerRadius:", 21.0);
  }
  else
  {
    objc_msgSend(v7, "flipAnimatableProperty");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:", 0.0);

    objc_msgSend(*(id *)(a1 + 40), "sourceContentFrameInMatchMoveViewSpace");
    UIRectGetCenter();
    UIPointRoundToScale();
    v17 = v16;
    v19 = v18;
    objc_msgSend(*(id *)(a1 + 40), "sourceContainerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCenter:", v17, v19);

    objc_msgSend(v3, "customIconImageViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "continuousCornerRadius");
    objc_msgSend(v3, "setCrossfadeCornerRadius:");

    v6 = 1.0;
  }
  objc_msgSend(v4, "setIconLabelAlpha:", v6);
  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWeighting:", v8);

  objc_msgSend(*(id *)(a1 + 32), "backgroundTintView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAlpha:", v8);

  objc_msgSend(v3, "setMorphFraction:", v8);
  objc_msgSend(*(id *)(a1 + 40), "widgetSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v46.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v46.c = v25;
  *(_OWORD *)&v46.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(*(id *)(a1 + 32), "homeScreenContentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 1.0;
  if (v2 == 1)
  {
    objc_msgSend(v24, "configurationHomeScreenScale");
    memset(&v45, 0, sizeof(v45));
    CGAffineTransformMakeScale(&v45, v28, v28);
    objc_msgSend(*(id *)(a1 + 40), "homeScreenContentFrame");
    UIRectGetCenter();
    UIPointRoundToScale();
    v30 = v29;
    v32 = v31;
    objc_msgSend(*(id *)(a1 + 32), "contentBoundingRect");
    UIRectGetCenter();
    UIPointRoundToScale();
    v34 = v33;
    v36 = v35;
    if ((BSPointEqualToPoint() & 1) != 0)
    {
      v46 = v45;
    }
    else
    {
      v37 = v34 - v30;
      v38 = v36 - v32;
      memset(&v44, 0, sizeof(v44));
      CGAffineTransformMakeTranslation(&v44, v37, v38);
      memset(&v43, 0, sizeof(v43));
      CGAffineTransformMakeTranslation(&v43, -v37, -v38);
      t1 = v45;
      v40 = v44;
      CGAffineTransformConcat(&t2, &t1, &v40);
      t1 = v43;
      CGAffineTransformConcat(&v46, &t1, &t2);
    }
    objc_msgSend(v24, "configurationHomeScreenAlpha");
    v27 = v39;
  }
  v45 = v46;
  objc_msgSend(v26, "setTransform:", &v45);
  objc_msgSend(v26, "setAlpha:", v27);

}

uint64_t __86__SBHWidgetConfigurationFlipAnimator__configureForEndpoint_context_inMode_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)iconViewWasRecycled:(id)a3
{
  id v3;

  -[SBHWidgetConfigurationFlipAnimator matchMoveView](self, "matchMoveView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

}

- (void)iconViewDidBecomeWindowless:(id)a3
{
  id v3;

  -[SBHWidgetConfigurationFlipAnimator matchMoveView](self, "matchMoveView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

}

- (void)iconViewWasDiscarded:(id)a3
{
  id v3;

  -[SBHWidgetConfigurationFlipAnimator matchMoveView](self, "matchMoveView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

}

- (SBHWidgetSettings)widgetSettings
{
  return self->_widgetSettings;
}

- (SBHTouchPassThroughView)matchMoveView
{
  return self->_matchMoveView;
}

- (void)setMatchMoveView:(id)a3
{
  objc_storeStrong((id *)&self->_matchMoveView, a3);
}

- (SBHWidgetConfigurationTransformView)sourceContainerView
{
  return self->_sourceContainerView;
}

- (void)setSourceContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceContainerView, a3);
}

- (UIView)targetSuperview
{
  return self->_targetSuperview;
}

- (void)setTargetSuperview:(id)a3
{
  objc_storeStrong((id *)&self->_targetSuperview, a3);
}

- (CGRect)sourceContentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceContentFrame.origin.x;
  y = self->_sourceContentFrame.origin.y;
  width = self->_sourceContentFrame.size.width;
  height = self->_sourceContentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceContentFrame:(CGRect)a3
{
  self->_sourceContentFrame = a3;
}

- (CGRect)targetContentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetContentFrame.origin.x;
  y = self->_targetContentFrame.origin.y;
  width = self->_targetContentFrame.size.width;
  height = self->_targetContentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTargetContentFrame:(CGRect)a3
{
  self->_targetContentFrame = a3;
}

- (CGRect)homeScreenContentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_homeScreenContentFrame.origin.x;
  y = self->_homeScreenContentFrame.origin.y;
  width = self->_homeScreenContentFrame.size.width;
  height = self->_homeScreenContentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setHomeScreenContentFrame:(CGRect)a3
{
  self->_homeScreenContentFrame = a3;
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

- (double)startingFlipFraction
{
  return self->_startingFlipFraction;
}

- (void)setStartingFlipFraction:(double)a3
{
  self->_startingFlipFraction = a3;
}

- (double)endingFlipFraction
{
  return self->_endingFlipFraction;
}

- (void)setEndingFlipFraction:(double)a3
{
  self->_endingFlipFraction = a3;
}

- (double)startingRotationAngle
{
  return self->_startingRotationAngle;
}

- (void)setStartingRotationAngle:(double)a3
{
  self->_startingRotationAngle = a3;
}

- (double)endingRotationAngle
{
  return self->_endingRotationAngle;
}

- (void)setEndingRotationAngle:(double)a3
{
  self->_endingRotationAngle = a3;
}

- (UIViewFloatAnimatableProperty)flipAnimatableProperty
{
  return self->_flipAnimatableProperty;
}

- (void)setFlipAnimatableProperty:(id)a3
{
  objc_storeStrong((id *)&self->_flipAnimatableProperty, a3);
}

- (BOOL)hasPerformedAnyTransition
{
  return self->_hasPerformedAnyTransition;
}

- (void)setHasPerformedAnyTransition:(BOOL)a3
{
  self->_hasPerformedAnyTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flipAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_targetSuperview, 0);
  objc_storeStrong((id *)&self->_sourceContainerView, 0);
  objc_storeStrong((id *)&self->_matchMoveView, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
}

@end
