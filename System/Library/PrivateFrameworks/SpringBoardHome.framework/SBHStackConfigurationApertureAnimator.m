@implementation SBHStackConfigurationApertureAnimator

- (SBHStackConfigurationApertureAnimator)init
{
  SBHStackConfigurationApertureAnimator *v2;
  void *v3;
  uint64_t v4;
  SBHWidgetSettings *widgetSettings;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHStackConfigurationApertureAnimator;
  v2 = -[SBHStackConfigurationApertureAnimator init](&v7, sel_init);
  if (v2)
  {
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "widgetSettings");
    v4 = objc_claimAutoreleasedReturnValue();
    widgetSettings = v2->_widgetSettings;
    v2->_widgetSettings = (SBHWidgetSettings *)v4;

  }
  return v2;
}

- (void)prepareToAnimateFromEndpoint:(int64_t)a3 withContext:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SBHStackConfigurationApertureAnimator *v17;
  int64_t v18;
  BOOL v19;

  objc_msgSend(a4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceIconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!a3)
  {
    objc_msgSend(v7, "customIconImageViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setHidden:", 1);
  }
  v11 = (void *)MEMORY[0x1E0DC3F10];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__SBHStackConfigurationApertureAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke;
  v14[3] = &unk_1E8D888D8;
  v15 = v8;
  v16 = v6;
  v17 = self;
  v18 = a3;
  v19 = a3 == 0;
  v12 = v6;
  v13 = v8;
  objc_msgSend(v11, "performWithoutAnimation:", v14);

}

void __82__SBHStackConfigurationApertureAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "customIconImageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  v9 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v19 = v10;

  objc_msgSend(*(id *)(a1 + 40), "widgetStackMatchingBackgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  v13 = v11;
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  if (v19)
  {
    if (v15)
    {
      v16 = objc_msgSend(v15, "recipe");
      if (v16 != objc_msgSend(v19, "recipe"))
      {
        objc_msgSend(v15, "setRecipe:", objc_msgSend(v19, "recipe"));
        objc_msgSend(v15, "layoutIfNeeded");
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "_configureForEndpoint:scroll:withCoordinator:", *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_configureApertureBackgroundViewsForEndpoint:withCoordinator:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_configureWidgetStackMatchingBackgroundViewForEndpoint:withCoordinator:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v17 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "widgetBackgroundViews");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setInnerWidgetBackgroundViews:", v18);

  objc_msgSend(*(id *)(a1 + 48), "_configureInnerWidgetBackgroundViewsForEndpoint:withCoordinator:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (void)animateToEndpoint:(int64_t)a3 withContext:(id)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  id v24;
  double v25;
  void *v26;
  double v27;
  id v28;
  _QWORD v29[5];
  void *v30;
  int64_t v31;
  _QWORD v32[5];
  id v33;
  int64_t v34;
  _QWORD v35[4];
  void (**v36)(_QWORD);
  _QWORD v37[5];
  id v38;
  int64_t v39;

  v8 = (void (**)(_QWORD))a5;
  v9 = a4;
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "wantsAnimation");

  if (v11)
  {
    if (-[SBHStackConfigurationApertureAnimator isAlreadyAnimating](self, "isAlreadyAnimating"))
      v12 = (2 * (a3 == 1)) | 4;
    else
      v12 = 2 * (a3 == 1);
    -[SBHStackConfigurationApertureAnimator setAlreadyAnimating:](self, "setAlreadyAnimating:", 1);
    if (a3 == 1)
    {
      v13 = 0.3;
    }
    else
    {
      objc_msgSend(v10, "sourceIconView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "widgetContentContainerView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHStackConfigurationApertureAnimator _setupMatchMoveAnimationWithSourceView:targetView:](self, "_setupMatchMoveAnimationWithSourceView:targetView:", v17, v18);

      v13 = 0.8;
    }
    -[SBHStackConfigurationApertureAnimator widgetSettings](self, "widgetSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stackConfigurationZoomTransitionDuration");
    v21 = v20;

    v22 = (void *)MEMORY[0x1E0DC3F10];
    v23 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke;
    v37[3] = &unk_1E8D865D8;
    v37[4] = self;
    v39 = a3;
    v24 = v10;
    v38 = v24;
    v35[0] = v23;
    v35[1] = 3221225472;
    v35[2] = __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke_3;
    v35[3] = &unk_1E8D86600;
    v36 = v8;
    objc_msgSend(v22, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", v12, v37, v35, v21, 0.0, 1.0, 0.0);
    v25 = v13 * v21;
    v26 = (void *)MEMORY[0x1E0DC3F10];
    v32[0] = v23;
    v32[1] = 3221225472;
    if (a3 == 1)
      v27 = 0.0;
    else
      v27 = v21 - v25;
    v32[2] = __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke_4;
    v32[3] = &unk_1E8D865D8;
    v33 = v24;
    v34 = a3;
    v32[4] = self;
    v28 = v24;
    objc_msgSend(v26, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", v12, v32, 0, v25, v27, 1.0, 0.0);

    v16 = v38;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0DC3F10];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke_6;
    v29[3] = &unk_1E8D865D8;
    v30 = v10;
    v31 = a3;
    v29[4] = self;
    v15 = v10;
    objc_msgSend(v14, "performWithoutAnimation:", v29);
    if (v8)
      v8[2](v8);
    v16 = v30;
  }

}

void __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  float minimum;
  float maximum;
  float preferred;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  CAFrameRateRange v14;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v14.minimum;
  maximum = v14.maximum;
  preferred = v14.preferred;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke_2;
  v11[3] = &unk_1E8D865D8;
  v7 = (void *)a1[5];
  v6 = a1[6];
  v11[4] = a1[4];
  v13 = v6;
  v12 = v7;
  *(float *)&v8 = minimum;
  *(float *)&v9 = maximum;
  *(float *)&v10 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114134, v11, v8, v9, v10);

}

uint64_t __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_configureForEndpoint:scroll:withCoordinator:", *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_configureWidgetStackMatchingBackgroundViewForEndpoint:withCoordinator:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_configureInnerWidgetBackgroundViewsForEndpoint:withCoordinator:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke_4(_QWORD *a1)
{
  void *v2;
  float minimum;
  float maximum;
  float preferred;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  CAFrameRateRange v14;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v14.minimum;
  maximum = v14.maximum;
  preferred = v14.preferred;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke_5;
  v11[3] = &unk_1E8D865D8;
  v7 = (void *)a1[5];
  v6 = a1[6];
  v11[4] = a1[4];
  v13 = v6;
  v12 = v7;
  *(float *)&v8 = minimum;
  *(float *)&v9 = maximum;
  *(float *)&v10 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114134, v11, v8, v9, v10);

}

uint64_t __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureApertureBackgroundViewsForEndpoint:withCoordinator:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_configureForEndpoint:scroll:withCoordinator:", *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_configureApertureBackgroundViewsForEndpoint:withCoordinator:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_configureWidgetStackMatchingBackgroundViewForEndpoint:withCoordinator:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_configureInnerWidgetBackgroundViewsForEndpoint:withCoordinator:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  int64_t v14;

  objc_msgSend(a4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationApertureAnimator setAlreadyAnimating:](self, "setAlreadyAnimating:", 0);
  objc_msgSend(v6, "sourceIconView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    objc_msgSend(v11, "customIconImageViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setHidden:", 0);
    objc_msgSend(v8, "setAlpha:", 1.0);

  }
  v9 = (void *)MEMORY[0x1E0DC3F10];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__SBHStackConfigurationApertureAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke;
  v12[3] = &unk_1E8D865D8;
  v13 = v6;
  v14 = a3;
  v12[4] = self;
  v10 = v6;
  objc_msgSend(v9, "performWithoutAnimation:", v12);
  -[SBHStackConfigurationApertureAnimator setInnerWidgetBackgroundViews:](self, "setInnerWidgetBackgroundViews:", 0);

}

uint64_t __81__SBHStackConfigurationApertureAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_configureForEndpoint:scroll:withCoordinator:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_configureApertureBackgroundViewsForEndpoint:withCoordinator:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_configureWidgetStackMatchingBackgroundViewForEndpoint:withCoordinator:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_configureInnerWidgetBackgroundViewsForEndpoint:withCoordinator:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_configureForEndpoint:(int64_t)a3 scroll:(BOOL)a4 withCoordinator:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double MidX;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CGFloat v47;
  CGFloat v48;
  double MinX;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  void *v64;
  __int128 v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  CGAffineTransform v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  CGAffineTransform v80;
  uint64_t v81;
  double v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;
  CGRect v86;

  v5 = a4;
  v85 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = v8;
  if (a3 == 1)
    v10 = 1.0;
  else
    v10 = 0.0;
  objc_msgSend(v8, "sourceIconView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "materialViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fadingViews");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SBHStackConfigurationApertureAnimator _shouldUseCenterZoomTransitionForCoordinator:](self, "_shouldUseCenterZoomTransitionForCoordinator:", v9);
  objc_msgSend(v9, "widgetContentContainerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v69 = v11;
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "customIconImageViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  v18 = v16;
  if (v17)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
  }
  else
  {
    v19 = 0;
  }
  v20 = v19;

  v68 = v20;
  if (a3 == 1)
  {
    v21 = 1.0;
    v22 = 0.0;
    v23 = 0.0;
    v24 = 0.0;
    v25 = 0.0;
    v26 = 1.0;
    v27 = 0;
    v28 = 0.0;
    v29 = 1;
    if (v14)
      goto LABEL_23;
    goto LABEL_21;
  }
  objc_msgSend(v20, "backgroundView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  v67 = v12;
  if (v30)
  {
    v32 = v30;
  }
  else
  {
    objc_msgSend(v20, "view");
    v32 = (id)objc_claimAutoreleasedReturnValue();
  }
  v33 = v32;

  objc_msgSend(v33, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bounds");
  objc_msgSend(v34, "convertRect:toLayer:", v70);
  v36 = v35;
  v38 = v37;
  v22 = v39;
  v23 = v40;
  objc_msgSend(v20, "pageControl");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bounds");
  objc_msgSend(v42, "convertRect:toLayer:", v70);
  MidX = CGRectGetMidX(v86);
  v44 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
  v45 = v36;
  v46 = v38;
  v47 = v22;
  v48 = v23;
  if (v44 == 1)
    MinX = CGRectGetMinX(*(CGRect *)&v45);
  else
    MinX = CGRectGetMaxX(*(CGRect *)&v45);
  v50 = MinX;
  memset(&v80, 0, sizeof(v80));
  if (v41)
    objc_msgSend(v41, "transform");
  v28 = vabdd_f64(MidX, v50);
  UIRectGetCenter();
  v24 = v51;
  v25 = v52;
  v26 = sqrt(v80.a * v80.a + v80.c * v80.c);
  objc_msgSend(v41, "alpha");
  v27 = v53;

  v21 = 1.0;
  v29 = 2;
  v12 = v67;
  if (!v14)
  {
LABEL_21:
    v80.a = v21;
    v80.b = v22;
    v80.c = v23;
    v80.d = v24;
    v80.tx = v25;
    v80.ty = v26;
    v81 = v27;
    v82 = v28;
    objc_msgSend(v9, "configureWithStackLayoutMetrics:", &v80);
    if (v5)
      objc_msgSend(v9, "setScrollPosition:", v29);
  }
LABEL_23:
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v54 = v12;
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v77 != v57)
          objc_enumerationMutation(v54);
        objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * i), "setWeighting:", v10);
      }
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
    }
    while (v56);
  }

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v59 = v13;
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
  if (v60)
  {
    v61 = v60;
    v62 = *(_QWORD *)v73;
    do
    {
      for (j = 0; j != v61; ++j)
      {
        if (*(_QWORD *)v73 != v62)
          objc_enumerationMutation(v59);
        objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * j), "setAlpha:", v10);
      }
      v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
    }
    while (v61);
  }

  if (v14)
  {
    memset(&v80, 0, sizeof(v80));
    v64 = v68;
    if (a3 == 1)
    {
      v65 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v80.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v80.c = v65;
      *(_OWORD *)&v80.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    }
    else
    {
      CGAffineTransformMakeScale(&v80, 0.01, 0.01);
    }
    v71 = v80;
    objc_msgSend(v15, "setTransform:", &v71);
    objc_msgSend(v15, "setAlpha:", v10);
  }
  else
  {
    objc_msgSend(v9, "configurationView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "layoutIfNeeded");

    v64 = v68;
  }

}

- (void)_configureApertureBackgroundViewsForEndpoint:(int64_t)a3 withCoordinator:(id)a4
{
  id v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!-[SBHStackConfigurationApertureAnimator _shouldUseCenterZoomTransitionForCoordinator:](self, "_shouldUseCenterZoomTransitionForCoordinator:", v6))
  {
    if (a3 == 1)
      v7 = 1.0;
    else
      v7 = 0.0;
    objc_msgSend(v6, "apertureBackgroundViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "setAlpha:", v7);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)_configureWidgetStackMatchingBackgroundViewForEndpoint:(int64_t)a3 withCoordinator:(id)a4
{
  double v6;
  void *v7;
  id v8;

  v8 = a4;
  if (!-[SBHStackConfigurationApertureAnimator _shouldUseCenterZoomTransitionForCoordinator:](self, "_shouldUseCenterZoomTransitionForCoordinator:"))
  {
    if (a3 == 1)
      v6 = 0.0;
    else
      v6 = 1.0;
    objc_msgSend(v8, "widgetStackMatchingBackgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", v6);

  }
}

- (void)_configureInnerWidgetBackgroundViewsForEndpoint:(int64_t)a3 withCoordinator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!-[SBHStackConfigurationApertureAnimator _shouldUseCenterZoomTransitionForCoordinator:](self, "_shouldUseCenterZoomTransitionForCoordinator:", v6))
  {
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "sourceIconView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "customIconImageViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_class();
      v11 = v9;
      if (v10)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
      }
      else
      {
        v12 = 0;
      }
      v13 = v12;

      objc_msgSend(v13, "backgroundTintingColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[SBHStackConfigurationApertureAnimator innerWidgetBackgroundViews](self, "innerWidgetBackgroundViews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      if (a3 == 1)
        v18 = 1.0;
      else
        v18 = 0.0;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v19);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = v20;
            objc_msgSend(v21, "underlyingBackgroundView");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setBackgroundColor:", v7);

            objc_msgSend(v21, "widgetBackgroundView");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v23, "setAlpha:", v18);
          }
          ++v19;
        }
        while (v16 != v19);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v16);
    }

  }
}

- (void)_setupMatchMoveAnimationWithSourceView:(id)a3 targetView:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CD27C0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "animation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourceLayer:", v9);

  objc_msgSend(v8, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v8, "setRemovedOnCompletion:", 0);
  objc_msgSend(v8, "setDuration:", INFINITY);
  objc_msgSend(v8, "setAppliesY:", 1);
  objc_msgSend(v8, "setAppliesX:", 1);
  objc_msgSend(v6, "bounds");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v7, "bounds");
  objc_msgSend(v7, "convertRect:toView:", v6);
  v15 = v14;
  v17 = v16;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v11 * 0.5 - v15, v13 * 0.5 - v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourcePoints:", v19);

  objc_msgSend(v6, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "addAnimation:forKey:", v8, CFSTR("SBHStackConfigurationIconMatchMoveKey"));
}

- (void)_removeMatchMoveAnimationFromTargetView:(id)a3
{
  id v3;

  objc_msgSend(a3, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("SBHStackConfigurationIconMatchMoveKey"));

}

- (BOOL)_shouldUseCenterZoomTransitionForCoordinator:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "sourceIconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "iconDataSourceCount") == 0;

  return v5;
}

- (SBHWidgetSettings)widgetSettings
{
  return self->_widgetSettings;
}

- (BOOL)isAlreadyAnimating
{
  return self->_alreadyAnimating;
}

- (void)setAlreadyAnimating:(BOOL)a3
{
  self->_alreadyAnimating = a3;
}

- (NSSet)innerWidgetBackgroundViews
{
  return self->_innerWidgetBackgroundViews;
}

- (void)setInnerWidgetBackgroundViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerWidgetBackgroundViews, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
}

@end
