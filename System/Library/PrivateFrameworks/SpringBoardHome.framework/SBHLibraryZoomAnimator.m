@implementation SBHLibraryZoomAnimator

+ (BOOL)validateWithLibrary:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    if ((objc_msgSend(v5, "isPresentingSearch") & 1) != 0)
    {
      v7 = CFSTR("Library is presenting search");
    }
    else if ((objc_msgSend(v5, "isPresentingFolder") & 1) != 0)
    {
      v7 = CFSTR("Library is presenting a pod");
    }
    else
    {
      objc_msgSend(v6, "iconListView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "numberOfDisplayedIconViews");

      if (v9)
      {
        objc_msgSend(v6, "libraryPodIconView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = 1;
          goto LABEL_15;
        }
        v7 = CFSTR("No source library pod icon view to zoom to/from");
      }
      else
      {
        v7 = CFSTR("Library is not displaying any icon views to zoom");
      }
    }
  }
  else
  {
    v7 = CFSTR("No Library view controller provided");
  }
  SBLogLibrary();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14 = 138543362;
    v15 = v7;
    _os_log_impl(&dword_1CFEF3000, v12, OS_LOG_TYPE_INFO, "SBHLibraryZoomAnimator validation failed for reason: %{public}@", (uint8_t *)&v14, 0xCu);
  }

  v11 = 0;
LABEL_15:

  return v11;
}

- (SBHLibraryZoomAnimator)init
{
  SBHLibraryZoomAnimator *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  SBHLibraryWaveZoomSettings *openSettings;
  uint64_t v7;
  SBHLibraryWaveZoomSettings *closeSettings;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBHLibraryZoomAnimator;
  v2 = -[SBHLibraryZoomAnimator init](&v10, sel_init);
  if (v2)
  {
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "iconAnimationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "libraryWaveOpenSettings");
    v5 = objc_claimAutoreleasedReturnValue();
    openSettings = v2->_openSettings;
    v2->_openSettings = (SBHLibraryWaveZoomSettings *)v5;

    objc_msgSend(v4, "libraryWaveCloseSettings");
    v7 = objc_claimAutoreleasedReturnValue();
    closeSettings = v2->_closeSettings;
    v2->_closeSettings = (SBHLibraryWaveZoomSettings *)v7;

  }
  return v2;
}

- (void)prepareToAnimateFromEndpoint:(int64_t)a3 withContext:(id)a4
{
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *flyingPodViews;
  NSMutableArray *v9;
  NSMutableArray *fadingPodViews;
  NSMutableArray *v11;
  NSMutableArray *crossfadeViews;
  NSMutableArray *v13;
  NSMutableArray *libraryIconViews;
  NSMutableArray *v15;
  NSMutableArray *flyingPodWrapperViews;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  NSMutableArray *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  objc_class *v37;
  void *v38;
  BSInvalidatable *v39;
  BSInvalidatable *presentationSourceOrderingAssertion;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _SBHLibraryZoomAnimatorTouchForwardingView *v46;
  _SBHLibraryZoomAnimatorTouchForwardingView *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  CADisplayLink *v65;
  CADisplayLink *displayLink;
  CADisplayLink *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  _QWORD v74[5];
  id v75;
  int64_t v76;
  char v77;
  _QWORD v78[4];
  id v79;
  id v80;
  _QWORD v81[5];
  id v82;
  id v83;
  _QWORD *v84;
  unint64_t v85;
  _QWORD v86[5];

  v70 = a4;
  objc_msgSend(v70, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_context, v6);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  flyingPodViews = self->_flyingPodViews;
  self->_flyingPodViews = v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  fadingPodViews = self->_fadingPodViews;
  self->_fadingPodViews = v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  crossfadeViews = self->_crossfadeViews;
  self->_crossfadeViews = v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  libraryIconViews = self->_libraryIconViews;
  self->_libraryIconViews = v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  flyingPodWrapperViews = self->_flyingPodWrapperViews;
  self->_flyingPodWrapperViews = v15;

  objc_msgSend(v6, "containerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconListView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryIconViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "categoryStackView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v18, "numberOfDisplayedIconViews");
  v22 = objc_msgSend(v18, "iconColumnsForCurrentOrientation");
  if (v21 >= v22)
    v21 = v22;
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x2020000000;
  v23 = MEMORY[0x1E0C809B0];
  v86[3] = 0;
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __67__SBHLibraryZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke;
  v81[3] = &unk_1E8D87F78;
  v81[4] = self;
  v71 = v17;
  v82 = v71;
  v84 = v86;
  v85 = v21;
  v24 = v20;
  v83 = v24;
  objc_msgSend(v18, "enumerateDisplayedIconViewsUsingBlock:", v81);
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = self->_libraryIconViews;
  v78[0] = v23;
  v78[1] = 3221225472;
  v78[2] = __67__SBHLibraryZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_2;
  v78[3] = &unk_1E8D87FA0;
  v72 = v18;
  v79 = v72;
  v73 = v25;
  v80 = v73;
  -[NSMutableArray enumerateObjectsUsingBlock:](v26, "enumerateObjectsUsingBlock:", v78);
  -[SBHLibraryZoomAnimator setPauseLayoutAssertions:](self, "setPauseLayoutAssertions:", v73);
  objc_msgSend(v72, "layout");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray firstObject](self->_libraryIconViews, "firstObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "icon");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "gridSizeClass");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "iconImageInfoForGridSizeClass:", v30);
  self->_libraryIconImageInfo.size.width = v31;
  self->_libraryIconImageInfo.size.height = v32;
  self->_libraryIconImageInfo.scale = v33;
  self->_libraryIconImageInfo.continuousCornerRadius = v34;

  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](self->_flyingPodWrapperViews, "enumerateObjectsWithOptions:usingBlock:", 2, &__block_literal_global_26);
  v35 = (void *)MEMORY[0x1E0DC3F10];
  v74[0] = v23;
  v74[1] = 3221225472;
  v74[2] = __67__SBHLibraryZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_4;
  v74[3] = &unk_1E8D88010;
  v74[4] = self;
  v76 = a3;
  v36 = v6;
  v75 = v36;
  v77 = 1;
  objc_msgSend(v35, "performWithoutAnimation:", v74);
  if (!self->_presentationSourceOrderingAssertion)
  {
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "acquireOrderPresentationSourceContainerViewBeforeLibraryViewAssertionForReason:", v38);
    v39 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    presentationSourceOrderingAssertion = self->_presentationSourceOrderingAssertion;
    self->_presentationSourceOrderingAssertion = v39;

  }
  objc_msgSend(v36, "sourceContainerView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v24;
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC42D8]), "initWithSourceView:", v41);
  objc_msgSend(v41, "bounds");
  objc_msgSend(v42, "setFrame:");
  objc_msgSend(v42, "setHidesSourceView:", 1);
  objc_msgSend(v42, "setMatchesPosition:", 1);
  objc_msgSend(v42, "setMatchesTransform:", 1);
  objc_msgSend(v42, "setAllowsHitTesting:", 1);
  objc_msgSend(v42, "setAllowsBackdropGroups:", 1);
  objc_msgSend(v42, "setForwardsClientHitTestingToSourceView:", 1);
  objc_storeStrong((id *)&self->_presentationSourcePortalView, v42);
  -[NSMutableArray firstObject](self->_fadingPodViews, "firstObject");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "superview");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "insertSubview:aboveSubview:", v42, v44);

  objc_msgSend(v36, "libraryPodIconView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = [_SBHLibraryZoomAnimatorTouchForwardingView alloc];
  v47 = -[_SBHLibraryZoomAnimatorTouchForwardingView initWithFrame:](v46, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[_SBHLibraryZoomAnimatorTouchForwardingView setTouchForwardingTargetView:](v47, "setTouchForwardingTargetView:", v45);
  -[_SBHLibraryZoomAnimatorTouchForwardingView layer](v47, "layer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setHitTestsAsOpaque:", 1);

  objc_msgSend(v36, "libraryView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "superview");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v50, "addSubview:", v47);
  objc_msgSend(v45, "layer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "presentationLayer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v52;
  if (v52)
  {
    v54 = v52;
  }
  else
  {
    objc_msgSend(v45, "layer");
    v54 = (id)objc_claimAutoreleasedReturnValue();
  }
  v55 = v54;

  objc_msgSend(v55, "bounds");
  v57 = v56;
  v59 = v58;
  v61 = v60;
  v63 = v62;
  objc_msgSend(v50, "layer");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "convertRect:toLayer:", v64, v57, v59, v61, v63);
  -[_SBHLibraryZoomAnimatorTouchForwardingView setFrame:](v47, "setFrame:");

  -[SBHLibraryZoomAnimator _matchMoveTargetView:withSourceView:](self, "_matchMoveTargetView:withSourceView:", v47, v45);
  objc_storeStrong((id *)&self->_sourceTouchForwardingView, v47);
  objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkFired_);
  v65 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
  displayLink = self->_displayLink;
  self->_displayLink = v65;

  v67 = self->_displayLink;
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADisplayLink addToRunLoop:forMode:](v67, "addToRunLoop:forMode:", v68, *MEMORY[0x1E0C99860]);

  self->_podsWantDisplayLinkInfluencedPositioning = 0;
  _Block_object_dispose(v86, 8);

}

void __67__SBHLibraryZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SBHTouchPassThroughView *v4;
  SBHTouchPassThroughView *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  SBHLibraryPodCrossfadeView *v11;
  SBHLibraryPodCrossfadeView *v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", v3);
  v4 = [SBHTouchPassThroughView alloc];
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  v5 = -[SBHTouchPassThroughView initWithFrame:](v4, "initWithFrame:");
  -[SBHTouchPassThroughView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", v5);
  v6 = v3;
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v13 = v6;
  if (v7 >= *(_QWORD *)(a1 + 64))
  {
    -[SBHTouchPassThroughView addSubview:](v5, "addSubview:", v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", v13);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", v13);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addObject:", v5);
  }
  else
  {
    v8 = *(void **)(a1 + 48);
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 48), "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "backgroundViewForIndex:compatibleWithTraitCollection:", v7, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 48), "bounds");
      objc_msgSend(v10, "setBounds:");
      v11 = -[SBHLibraryPodCrossfadeView initWithBackgroundView:podIconView:]([SBHLibraryPodCrossfadeView alloc], "initWithBackgroundView:podIconView:", v10, v13);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "matchingCategoryStackView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setInnerIconImageInfoFrozen:", 1);
      objc_msgSend(v10, "setNumberOfCategories:", 1);
      v11 = -[SBHLibraryPodCrossfadeView initWithForegroundView:podIconView:]([SBHLibraryPodCrossfadeView alloc], "initWithForegroundView:podIconView:", v10, v13);
    }
    v12 = v11;

    -[SBHTouchPassThroughView addSubview:](v5, "addSubview:", v12);
    -[SBHLibraryPodCrossfadeView setNeedsLayout](v12, "setNeedsLayout");
    -[SBHLibraryPodCrossfadeView layoutIfNeeded](v12, "layoutIfNeeded");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", v12);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", v12);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addObject:", v5);

  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

}

void __67__SBHLibraryZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "pauseLayoutForIconView:forReason:", a2, CFSTR("SBHLibraryZoomAnimatorIconLayoutPauseReason"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v3 = v4;
  }

}

void __67__SBHLibraryZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "superview");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bringSubviewToFront:", v2);

}

void __67__SBHLibraryZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__SBHLibraryZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_5;
  v6[3] = &unk_1E8D87FE8;
  v5 = *(_QWORD *)(a1 + 48);
  v6[4] = v2;
  v8 = v5;
  v7 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  objc_msgSend(*(id *)(a1 + 32), "_configureSearchViewsForEndpoint:preparing:withContext:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_configureBackgroundViewForEndpoint:withContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_configureDockIndicatorViewsForEndpoint:preparing:withContext:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

uint64_t __67__SBHLibraryZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_configureLayoutForPodViewAtIndex:forEndpoint:withContext:includeYPosition:", a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 1);
  objc_msgSend(*(id *)(a1 + 32), "_configureAlphaForPodViewAtIndex:forEndpoint:withContext:", a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_configureScaleForPodViewAtIndex:forEndpoint:withContext:includeYTranslation:", a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "_configureCategoryStackAlphaForPodViewAtIndex:forEndpoint:withContext:", a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_configureCrossfadeSourceContentForPodViewAtIndex:forEndpoint:withContext:", a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_configureCrossfadeDestinationContentForPodViewAtIndex:forEndpoint:withContext:", a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)animateToEndpoint:(int64_t)a3 withContext:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  _BOOL4 alreadyAnimating;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  int v16;
  void *v17;
  id v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  id v82;
  void *v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  NSMutableArray *flyingPodWrapperViews;
  uint64_t v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  id v102;
  id v103;
  id v104;
  id v105;
  unint64_t v106;
  double v107;
  double v108;
  void *v109;
  double v110;
  double v111;
  double v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  double v122;
  double v123;
  id v124;
  void *v125;
  double v126;
  double v127;
  id v128;
  NSMutableArray *flyingPodViews;
  void *v130;
  CGFloat v131;
  CGFloat v132;
  void *v133;
  uint64_t v134;
  void *v135;
  int v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  void *v146;
  BOOL v147;
  id v148;
  uint64_t v149;
  void *v150;
  int64_t v151;
  _QWORD v152[5];
  id v153;
  int64_t v154;
  _QWORD v155[5];
  id v156;
  int64_t v157;
  _QWORD v158[5];
  id v159;
  int64_t v160;
  _QWORD v161[4];
  id v162;
  BOOL v163;
  _QWORD v164[4];
  id v165;
  SBHLibraryZoomAnimator *v166;
  id v167;
  id v168;
  id v169;
  id v170;
  unint64_t v171;
  unint64_t v172;
  double v173;
  double v174;
  int64_t v175;
  uint64_t v176;
  uint64_t v177;
  char v178;
  BOOL v179;
  _QWORD v180[5];
  BOOL v181;

  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  objc_msgSend(v8, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ++self->_transitionToken;
  self->_endpointAnimatingTo = a3;
  alreadyAnimating = self->_alreadyAnimating;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("SBIconZoomExpansionAnimationWillBeginNotification"), self);

  objc_msgSend(v10, "podScrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentOffset");
  objc_msgSend(v13, "_setContentOffsetPinned:animated:", 0);
  if (objc_msgSend(v8, "wantsAnimation"))
  {
    v14 = a3 == 1;
    v15 = 2 * (a3 == 1);
    if (alreadyAnimating)
      v15 = (2 * (a3 == 1)) | 4;
    v149 = v15;
    v140 = (2 * (a3 == 1)) | 4;
    v151 = a3;
    if (alreadyAnimating)
      v16 = 1;
    else
      v16 = objc_msgSend(v10, "shouldUseTranslatingAnimationBehavior");
    objc_msgSend(v10, "iconListView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "iconColumnsForCurrentOrientation");

    v21 = -[NSMutableArray count](self->_flyingPodViews, "count");
    v150 = v9;
    v136 = v16;
    v134 = -[NSMutableArray count](self->_crossfadeViews, "count");
    v22 = 0;
    if (v21)
    {
      for (i = 0; i != v21; ++i)
      {
        if (v22 <= i % v20 + 2 * (i / v20))
          v22 = i % v20 + 2 * (i / v20);
      }
    }
    v145 = v10;
    objc_msgSend(v10, "libraryPodIconView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "presentationLayer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v147 = v14;
    if (v26)
    {
      v28 = v26;
    }
    else
    {
      objc_msgSend(v24, "layer");
      v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    v29 = v28;

    objc_msgSend(v29, "bounds");
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v142 = v24;
    objc_msgSend(v24, "window");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "convertRect:toLayer:", v39, v31, v33, v35, v37);
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;

    -[NSMutableArray firstObject](self->_flyingPodWrapperViews, "firstObject");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "layer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "presentationLayer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50;
    v141 = v29;
    if (v50)
    {
      v52 = v50;
    }
    else
    {
      objc_msgSend(v48, "layer");
      v52 = (id)objc_claimAutoreleasedReturnValue();
    }
    v53 = v52;

    objc_msgSend(v53, "bounds");
    v55 = v54;
    v57 = v56;
    v59 = v58;
    v61 = v60;
    objc_msgSend(v48, "window");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "layer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = v53;
    objc_msgSend(v53, "convertRect:toLayer:", v63, v55, v57, v59, v61);
    v65 = v64;
    v67 = v66;
    v69 = v68;
    v71 = v70;

    objc_msgSend(v145, "libraryView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "layer");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "presentationLayer");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v74;
    v143 = v13;
    v144 = v8;
    v137 = v72;
    v131 = v71;
    v132 = v69;
    v76 = v67;
    v77 = v65;
    v78 = v47;
    v79 = v45;
    v80 = v43;
    v81 = v41;
    if (v74)
    {
      v82 = v74;
    }
    else
    {
      objc_msgSend(v72, "layer");
      v82 = (id)objc_claimAutoreleasedReturnValue();
    }
    v83 = v82;
    v139 = v48;

    v135 = v83;
    objc_msgSend(v83, "frame");
    v85 = v84;
    v87 = v86;
    self->_startTime = CACurrentMediaTime();
    self->_initialLibraryOrigin.x = v85;
    self->_initialLibraryOrigin.y = v87;
    self->_initialSourceContentFrame.origin.x = v81;
    self->_initialSourceContentFrame.origin.y = v80;
    self->_initialSourceContentFrame.size.width = v79;
    self->_initialSourceContentFrame.size.height = v78;
    self->_initialTargetContentFrame.origin.x = v77;
    self->_initialTargetContentFrame.origin.y = v76;
    self->_initialTargetContentFrame.size.width = v132;
    self->_initialTargetContentFrame.size.height = v131;
    self->_podsWantDisplayLinkInfluencedPositioning = 1;
    flyingPodWrapperViews = self->_flyingPodWrapperViews;
    v180[0] = MEMORY[0x1E0C809B0];
    v180[1] = 3221225472;
    v180[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke;
    v180[3] = &unk_1E8D88038;
    v181 = v147;
    v180[4] = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](flyingPodWrapperViews, "enumerateObjectsUsingBlock:", v180);
    v89 = 240;
    if (v151 == 1)
      v89 = 232;
    v90 = *(id *)((char *)&self->super.isa + v89);
    objc_msgSend(v90, "centralAnimationSettings");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "BSAnimationSettings");
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v90, "podFadeSettings");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "BSAnimationSettings");
    v130 = (void *)objc_claimAutoreleasedReturnValue();

    v94 = v92;
    v95 = v94;
    if (v136)
    {
      v96 = 0.0;
      if (v151 == 1)
        v96 = 1.0;
      -[SBHLibraryZoomAnimator _retargetedAnimationSettingsForSettings:normalizedTier:endpoint:](self, "_retargetedAnimationSettingsForSettings:normalizedTier:endpoint:", v94, v151, v96);
      v95 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v133 = v95;
    objc_msgSend(v95, "duration");
    v98 = v97;
    objc_msgSend(v90, "interPodWaveDelay");
    v100 = v99;
    v101 = v98 + (double)v22 * v99;
    if (!v136)
      v98 = v98 + (double)v22 * v99;
    objc_msgSend(v145, "noteWillAnimateToEndpoint:withAnimationDuration:", v151, v98);
    flyingPodViews = self->_flyingPodViews;
    v164[0] = MEMORY[0x1E0C809B0];
    v164[1] = 3221225472;
    v164[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_2;
    v164[3] = &unk_1E8D88088;
    v171 = v20;
    v172 = v22;
    v178 = v136;
    v179 = v147;
    v102 = v94;
    v173 = v100;
    v174 = v98;
    v165 = v102;
    v166 = self;
    v175 = v151;
    v176 = v149;
    v103 = v145;
    v167 = v103;
    v177 = v21;
    v170 = v150;
    v104 = v90;
    v168 = v104;
    v169 = v130;
    v105 = v130;
    -[NSMutableArray enumerateObjectsUsingBlock:](flyingPodViews, "enumerateObjectsUsingBlock:", v164);
    v106 = (v134 - 1) % v20 + 2 * ((v134 - 1) / v20);
    v146 = v105;
    if ((v136 & 1) != 0)
    {
      v107 = 0.0;
      v108 = 0.0;
      if (v22)
        v108 = (double)v106 / (double)v22;
      -[SBHLibraryZoomAnimator _retargetedAnimationSettingsForSettings:normalizedTier:endpoint:](self, "_retargetedAnimationSettingsForSettings:normalizedTier:endpoint:", v102, v151, v108, flyingPodViews);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "duration");
      v111 = v110;

    }
    else
    {
      objc_msgSend(v102, "duration");
      v111 = v112;
      if (v151 == 1)
        v107 = v100 * (double)v106;
      else
        v107 = v101 - v100 * (double)v106 - v112;
    }
    v113 = MEMORY[0x1E0C809B0];
    objc_msgSend(v103, "libraryIconViewController", flyingPodViews);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "dismissalView");
    v115 = (void *)objc_claimAutoreleasedReturnValue();

    v116 = (void *)MEMORY[0x1E0DC3F10];
    v161[0] = v113;
    v161[1] = 3221225472;
    v161[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_10;
    v161[3] = &unk_1E8D85BB8;
    v162 = v115;
    v163 = v147;
    v148 = v115;
    objc_msgSend(v116, "animateWithDuration:delay:options:animations:completion:", v149, v161, 0, v111, v107);
    objc_msgSend(v103, "searchBar");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "layer");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "animationForKey:", CFSTR("opacity"));
    v119 = (void *)objc_claimAutoreleasedReturnValue();

    if (v119)
      v120 = v140;
    else
      v120 = v149;
    objc_msgSend(v104, "relativeSearchDuration");
    v121 = (void *)MEMORY[0x1E0DC3F10];
    v123 = v98 * v122;
    v158[0] = v113;
    v158[1] = 3221225472;
    v158[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_11;
    v158[3] = &unk_1E8D865D8;
    v158[4] = self;
    v160 = v151;
    v124 = v103;
    v159 = v124;
    objc_msgSend(v121, "animateWithDuration:delay:options:animations:completion:", v120, v158, 0, v123, 0.0);
    objc_msgSend(v104, "relativeBackgroundDuration");
    v125 = (void *)MEMORY[0x1E0DC3F10];
    v127 = v98 * v126;
    v155[0] = v113;
    v155[1] = 3221225472;
    v155[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_12;
    v155[3] = &unk_1E8D865D8;
    v156 = v124;
    v157 = v151;
    v155[4] = self;
    v128 = v124;
    objc_msgSend(v125, "animateWithDuration:delay:options:animations:completion:", v149, v155, 0, v127, 0.0);

    v13 = v143;
    v8 = v144;
    v9 = (void (**)(_QWORD))v150;
    v18 = v142;
  }
  else
  {
    objc_msgSend(v10, "noteWillAnimateToEndpoint:withAnimationDuration:", a3, 0.0);
    v17 = (void *)MEMORY[0x1E0DC3F10];
    v152[0] = MEMORY[0x1E0C809B0];
    v152[1] = 3221225472;
    v152[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_13;
    v152[3] = &unk_1E8D865D8;
    v153 = v10;
    v154 = a3;
    v152[4] = self;
    v18 = v10;
    objc_msgSend(v17, "performWithoutAnimation:", v152);
    if (v9)
      v9[2](v9);

  }
  self->_alreadyAnimating = 1;

}

void __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v15 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    v5 = objc_msgSend(v4, "_targetViewHasMatchMove:", v3);
    objc_msgSend(v15, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentationLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v15, "layer");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    objc_msgSend(v10, "position");
    v12 = v11;
    v14 = v13;
    objc_msgSend(*(id *)(a1 + 32), "_removeMatchMoveFromTargetView:", v15);
    if (v5)
      objc_msgSend(v15, "setCenter:", v12, v14);

  }
  else
  {
    objc_msgSend(v4, "_removePositionAdditionFromTargetView:", v3);
  }

}

void __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  unint64_t v5;
  uint64_t v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  double v51;
  double v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  uint64_t v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  double v70;
  double v71;
  id v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  id v79;
  _QWORD v80[5];
  id v81;
  unint64_t v82;
  uint64_t v83;
  _QWORD v84[5];
  id v85;
  unint64_t v86;
  uint64_t v87;
  _QWORD v88[5];
  id v89;
  unint64_t v90;
  uint64_t v91;
  _QWORD v92[5];
  id v93;
  unint64_t v94;
  uint64_t v95;
  _QWORD v96[5];
  id v97;
  unint64_t v98;
  uint64_t v99;
  _QWORD v100[4];
  id v101;
  uint64_t v102;
  unint64_t v103;
  char v104;
  _QWORD v105[5];
  id v106;
  unint64_t v107;
  uint64_t v108;

  v79 = a2;
  v5 = *(_QWORD *)(a1 + 88);
  v6 = a3 % *(_QWORD *)(a1 + 80) + 2 * (a3 / *(_QWORD *)(a1 + 80));
  if (v5)
    v7 = (double)(unint64_t)v6 / (double)v5;
  else
    v7 = 0.0;
  if (*(_BYTE *)(a1 + 136) && *(_BYTE *)(a1 + 137))
    v7 = 1.0 - v7;
  v8 = *(id *)(a1 + 32);
  v9 = v8;
  if (*(_BYTE *)(a1 + 136))
  {
    objc_msgSend(*(id *)(a1 + 40), "_retargetedAnimationSettingsForSettings:normalizedTier:endpoint:", v8, *(_QWORD *)(a1 + 112), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "duration");
    v12 = v11;
    v13 = 0.0;
    v9 = v10;
  }
  else
  {
    objc_msgSend(v8, "duration");
    v12 = v14;
    if (*(_BYTE *)(a1 + 137))
      v13 = *(double *)(a1 + 96) * (double)(unint64_t)v6;
    else
      v13 = *(double *)(a1 + 104) - (double)(unint64_t)v6 * *(double *)(a1 + 96) - v14;
  }
  if ((BSFloatGreaterThanOrEqualToFloat() & 1) == 0)
    NSLog(CFSTR("Why are we calculating a negative delay?? Cliff's fault."));
  v15 = (void *)MEMORY[0x1E0D01908];
  objc_msgSend(MEMORY[0x1E0D01908], "factoryWithSettings:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v105[0] = MEMORY[0x1E0C809B0];
  v105[1] = 3221225472;
  v105[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_3;
  v105[3] = &unk_1E8D86930;
  v18 = *(_QWORD *)(a1 + 112);
  v19 = *(_QWORD *)(a1 + 120);
  v107 = a3;
  v108 = v18;
  v20 = *(void **)(a1 + 48);
  v105[4] = *(_QWORD *)(a1 + 40);
  v106 = v20;
  v100[0] = v17;
  v100[1] = 3221225472;
  v100[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_4;
  v100[3] = &unk_1E8D88060;
  v104 = *(_BYTE *)(a1 + 137);
  v102 = *(_QWORD *)(a1 + 128);
  v103 = a3;
  v101 = *(id *)(a1 + 72);
  objc_msgSend(v15, "animateWithFactory:additionalDelay:options:actions:completion:", v16, v19, v105, v100, v13);

  v21 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 56), "zEffectControlPoint1Settings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pointValue");
  v24 = v23;
  v26 = v25;

  objc_msgSend(*(id *)(a1 + 56), "zEffectControlPoint2Settings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "pointValue");
  v29 = v28;
  v31 = v30;

  *(float *)&v32 = v24;
  *(float *)&v33 = v26;
  *(float *)&v34 = v29;
  *(float *)&v35 = v31;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v32, v33, v34, v35);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTimingFunction:");
  v36 = (void *)MEMORY[0x1E0D01908];
  objc_msgSend(MEMORY[0x1E0D01908], "factoryWithSettings:", v21);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v96[0] = v17;
  v96[1] = 3221225472;
  v96[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_5;
  v96[3] = &unk_1E8D86930;
  v38 = *(void **)(a1 + 48);
  v96[4] = *(_QWORD *)(a1 + 40);
  v39 = *(_QWORD *)(a1 + 112);
  v40 = *(_QWORD *)(a1 + 120);
  v98 = a3;
  v99 = v39;
  v97 = v38;
  objc_msgSend(v36, "animateWithFactory:additionalDelay:options:actions:completion:", v37, v40, v96, 0, v13);

  objc_msgSend(*(id *)(a1 + 56), "upperPodRelativeCrossfadeDuration");
  v42 = v12 * v41;
  v43 = v13 + v12 - v12 * v41;
  if (*(_BYTE *)(a1 + 137))
    v44 = v13;
  else
    v44 = v43;
  v45 = 2.0;
  if (*(_BYTE *)(a1 + 137))
  {
    v46 = 0x20000;
  }
  else
  {
    v45 = 1.0;
    v46 = 0x10000;
  }
  v47 = (void *)MEMORY[0x1E0DC3F10];
  v48 = *(_QWORD *)(a1 + 112);
  v49 = *(_QWORD *)(a1 + 120) | v46;
  v92[0] = v17;
  v92[1] = 3221225472;
  v92[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_6;
  v92[3] = &unk_1E8D86930;
  v94 = a3;
  v95 = v48;
  v50 = *(void **)(a1 + 48);
  v51 = v42 / v45;
  v92[4] = *(_QWORD *)(a1 + 40);
  v93 = v50;
  objc_msgSend(v47, "animateWithDuration:delay:options:animations:completion:", v49, v92, 0, v51, v44);
  v52 = 2.0;
  if (*(_BYTE *)(a1 + 137))
  {
    v52 = 1.0;
    v53 = 0x10000;
  }
  else
  {
    v53 = 0x20000;
  }
  v54 = (void *)MEMORY[0x1E0DC3F10];
  v55 = *(_QWORD *)(a1 + 112);
  v56 = *(_QWORD *)(a1 + 120) | v53;
  v88[0] = v17;
  v88[1] = 3221225472;
  v88[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_7;
  v88[3] = &unk_1E8D86930;
  v90 = a3;
  v91 = v55;
  v57 = *(void **)(a1 + 48);
  v88[4] = *(_QWORD *)(a1 + 40);
  v58 = v42 / v52;
  v89 = v57;
  objc_msgSend(v54, "animateWithDuration:delay:options:animations:completion:", v56, v88, 0, v58, v44);
  objc_msgSend(*(id *)(a1 + 56), "upperPodRelativeStackAlphaDuration");
  v60 = v12 * v59;
  v61 = v13 + v12 - v60;
  v62 = v13 - v60;
  v63 = (void *)MEMORY[0x1E0DC3F10];
  if (v62 < 0.0)
    v62 = 0.0;
  v64 = *(double *)(a1 + 96);
  if (*(_BYTE *)(a1 + 137))
    v65 = 0x20000;
  else
    v65 = 0x10000;
  if (*(_BYTE *)(a1 + 137))
    v66 = v62;
  else
    v66 = v61;
  v67 = *(_QWORD *)(a1 + 112);
  v68 = *(_QWORD *)(a1 + 120) | v65;
  v84[0] = v17;
  v84[1] = 3221225472;
  v84[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_8;
  v84[3] = &unk_1E8D86930;
  v69 = *(void **)(a1 + 48);
  v84[4] = *(_QWORD *)(a1 + 40);
  v86 = a3;
  v87 = v67;
  v85 = v69;
  objc_msgSend(v63, "animateWithDuration:delay:options:animations:completion:", v68, v84, 0, v64, v66);
  objc_msgSend(*(id *)(a1 + 56), "podRelativeFadeDelay");
  v71 = v70;
  v72 = *(id *)(a1 + 64);
  if (*(_BYTE *)(a1 + 136))
  {
    objc_msgSend(*(id *)(a1 + 40), "_retargetedAnimationSettingsForSettings:normalizedTier:endpoint:", v72, *(_QWORD *)(a1 + 112), v7);
    v73 = objc_claimAutoreleasedReturnValue();

    v72 = (id)v73;
  }
  v74 = (void *)MEMORY[0x1E0D01908];
  objc_msgSend(MEMORY[0x1E0D01908], "factoryWithSettings:", v72);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v17;
  v80[1] = 3221225472;
  v80[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_9;
  v80[3] = &unk_1E8D86930;
  v76 = *(void **)(a1 + 48);
  v80[4] = *(_QWORD *)(a1 + 40);
  v82 = a3;
  v77 = *(_QWORD *)(a1 + 120);
  v83 = *(_QWORD *)(a1 + 112);
  v81 = v76;
  objc_msgSend(v74, "animateWithFactory:additionalDelay:options:actions:", v75, v77, v80, v13 + v12 * v71);

}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureLayoutForPodViewAtIndex:forEndpoint:withContext:includeYPosition:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 0);
}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_4(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(result + 56))
    v1 = *(_QWORD *)(result + 40) - 1;
  else
    v1 = 0;
  if (*(_QWORD *)(result + 48) == v1)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureScaleForPodViewAtIndex:forEndpoint:withContext:includeYTranslation:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 1);
}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureCrossfadeDestinationContentForPodViewAtIndex:forEndpoint:withContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureCrossfadeSourceContentForPodViewAtIndex:forEndpoint:withContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureCategoryStackAlphaForPodViewAtIndex:forEndpoint:withContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureAlphaForPodViewAtIndex:forEndpoint:withContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_10(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureSearchViewsForEndpoint:preparing:withContext:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 40));
}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureBackgroundViewForEndpoint:withContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_13(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_14;
  v6[3] = &unk_1E8D87FE8;
  v5 = *(_QWORD *)(a1 + 48);
  v6[4] = v2;
  v8 = v5;
  v7 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  objc_msgSend(*(id *)(a1 + 32), "_configureSearchViewsForEndpoint:preparing:withContext:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_configureBackgroundViewForEndpoint:withContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

uint64_t __67__SBHLibraryZoomAnimator_animateToEndpoint_withContext_completion___block_invoke_14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_configureLayoutForPodViewAtIndex:forEndpoint:withContext:includeYPosition:", a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 1);
  objc_msgSend(*(id *)(a1 + 32), "_configureAlphaForPodViewAtIndex:forEndpoint:withContext:", a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_configureScaleForPodViewAtIndex:forEndpoint:withContext:includeYTranslation:", a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "_configureCategoryStackAlphaForPodViewAtIndex:forEndpoint:withContext:", a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_configureCrossfadeSourceContentForPodViewAtIndex:forEndpoint:withContext:", a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_configureCrossfadeDestinationContentForPodViewAtIndex:forEndpoint:withContext:", a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4
{
  void *v6;
  CADisplayLink *displayLink;
  void *v8;
  void *v9;
  void *v10;
  BSInvalidatable *presentationSourceOrderingAssertion;
  _UIPortalView *presentationSourcePortalView;
  UIView *sourceTouchForwardingView;
  id v14;
  _QWORD v15[5];
  id v16;
  int64_t v17;

  objc_msgSend(a4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&self->_podsWantDisplayLinkInfluencedPositioning = 0;
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  v8 = (void *)MEMORY[0x1E0DC3F10];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__SBHLibraryZoomAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke;
  v15[3] = &unk_1E8D865D8;
  v16 = v6;
  v17 = a3;
  v15[4] = self;
  v14 = v6;
  objc_msgSend(v8, "performWithoutAnimation:", v15);
  -[_UIPortalView window](self->_presentationSourcePortalView, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_synchronizeDrawing");

  -[BSInvalidatable invalidate](self->_presentationSourceOrderingAssertion, "invalidate");
  presentationSourceOrderingAssertion = self->_presentationSourceOrderingAssertion;
  self->_presentationSourceOrderingAssertion = 0;

  -[_UIPortalView setSourceView:](self->_presentationSourcePortalView, "setSourceView:", 0);
  -[_UIPortalView removeFromSuperview](self->_presentationSourcePortalView, "removeFromSuperview");
  presentationSourcePortalView = self->_presentationSourcePortalView;
  self->_presentationSourcePortalView = 0;

  -[UIView removeFromSuperview](self->_sourceTouchForwardingView, "removeFromSuperview");
  sourceTouchForwardingView = self->_sourceTouchForwardingView;
  self->_sourceTouchForwardingView = 0;

}

void __66__SBHLibraryZoomAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_configureDockIndicatorViewsForEndpoint:preparing:withContext:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 40));
  v2 = MEMORY[0x1E0C809B0];
  if (!*(_QWORD *)(a1 + 48))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(v3 + 56);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __66__SBHLibraryZoomAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke_2;
    v20[3] = &unk_1E8D87FE8;
    v20[4] = v3;
    v22 = 1;
    v21 = v4;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v20);
    objc_msgSend(*(id *)(a1 + 32), "_configureSearchViewsForEndpoint:preparing:withContext:", 1, 0, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 40), "iconListView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v18[0] = v2;
  v18[1] = 3221225472;
  v18[2] = __66__SBHLibraryZoomAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke_3;
  v18[3] = &unk_1E8D87340;
  v8 = v6;
  v19 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v18);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "pauseLayoutAssertions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "invalidate");
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
    }
    while (v11);
  }
  objc_msgSend(*(id *)(a1 + 32), "setPauseLayoutAssertions:", 0);
  objc_msgSend(v8, "layoutIconsNow");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "enumerateObjectsUsingBlock:", &__block_literal_global_37);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects");

}

uint64_t __66__SBHLibraryZoomAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_configureLayoutForPodViewAtIndex:forEndpoint:withContext:includeYPosition:", a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 1);
  objc_msgSend(*(id *)(a1 + 32), "_configureAlphaForPodViewAtIndex:forEndpoint:withContext:", a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_configureScaleForPodViewAtIndex:forEndpoint:withContext:includeYTranslation:", a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "_configureCategoryStackAlphaForPodViewAtIndex:forEndpoint:withContext:", a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_configureCrossfadeSourceContentForPodViewAtIndex:forEndpoint:withContext:", a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_configureCrossfadeDestinationContentForPodViewAtIndex:forEndpoint:withContext:", a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __66__SBHLibraryZoomAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  void *v5;
  void *v6;
  id v7;
  _OWORD v8[3];

  v3 = a2;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v4;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v8);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedIconViewForIcon:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v3)
    objc_msgSend(*(id *)(a1 + 32), "addSubview:", v3);

}

uint64_t __66__SBHLibraryZoomAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

- (id)_retargetedAnimationSettingsForSettings:(id)a3 normalizedTier:(double)a4 endpoint:(int64_t)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
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
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;

  v8 = a3;
  v9 = 240;
  if (a5 == 1)
    v9 = 232;
  v10 = *(id *)((char *)&self->super.isa + v9);
  if (objc_msgSend(v8, "isSpringAnimation"))
  {
    v11 = v8;
    objc_msgSend(v10, "retargetedMassSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "retargetedStiffnessSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "retargetedInitialVelocitySettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "damping");
    v16 = v15;
    objc_msgSend(v11, "stiffness");
    v18 = v17;
    objc_msgSend(v11, "mass");
    v20 = sqrt(v18 * v19);
    v21 = v16 / (v20 + v20);
    objc_msgSend(v12, "lowerBoundFactor");
    v23 = v22;
    objc_msgSend(v11, "mass");
    v25 = v23 * v24;
    objc_msgSend(v12, "upperBoundFactor");
    v27 = v26;
    objc_msgSend(v11, "mass");
    v29 = v27 * v28 * a4 + (1.0 - a4) * v25;
    objc_msgSend(v13, "lowerBoundFactor");
    v31 = v30;
    objc_msgSend(v11, "stiffness");
    v33 = v31 * v32;
    objc_msgSend(v13, "upperBoundFactor");
    v35 = v34;
    objc_msgSend(v11, "stiffness");
    v37 = v35 * v36 * a4 + (1.0 - a4) * v33;
    objc_msgSend(v14, "lowerBoundFactor");
    v39 = v38;
    objc_msgSend(v11, "initialVelocity");
    v41 = v39 * v40;
    objc_msgSend(v14, "upperBoundFactor");
    v43 = v42;
    objc_msgSend(v11, "initialVelocity");
    v45 = v43 * v44 * a4 + (1.0 - a4) * v41;
    v46 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v46, "setInitialVelocity:", v45);
    objc_msgSend(v46, "setStiffness:", v37);
    objc_msgSend(v46, "setDamping:", (v21 + v21) * sqrt(v29 * v37));
    objc_msgSend(v46, "setMass:", v29);

  }
  else
  {
    objc_msgSend(v10, "retargetedBasicDurationSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lowerBoundFactor");
    v48 = v47;
    objc_msgSend(v8, "duration");
    v50 = v48 * v49;
    objc_msgSend(v12, "upperBoundFactor");
    v52 = v51;
    objc_msgSend(v8, "duration");
    v54 = v52 * v53 * a4 + (1.0 - a4) * v50;
    v46 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v46, "setDuration:", v54);
  }

  return v46;
}

- (void)_displayLinkFired:(id)a3
{
  int64_t endpointAnimatingTo;
  void *v5;
  NSMutableArray *flyingPodViews;
  id v7;
  id WeakRetained;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  if (self->_podsWantDisplayLinkInfluencedPositioning)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    endpointAnimatingTo = self->_endpointAnimatingTo;
    objc_msgSend(WeakRetained, "libraryPodIconView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    flyingPodViews = self->_flyingPodViews;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__SBHLibraryZoomAnimator__displayLinkFired___block_invoke;
    v9[3] = &unk_1E8D87FE8;
    v10 = v5;
    v11 = endpointAnimatingTo;
    v9[4] = self;
    v7 = v5;
    -[NSMutableArray enumerateObjectsUsingBlock:](flyingPodViews, "enumerateObjectsUsingBlock:", v9);

  }
}

void __44__SBHLibraryZoomAnimator__displayLinkFired___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  CFTimeInterval v9;
  CFTimeInterval v10;
  uint64_t v11;
  void *v12;
  double *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationForKey:", CFSTR("position"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "beginTimeMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*MEMORY[0x1E0CD2918];

    if (v5 == v6)
      v7 = 0.0;
    else
      v7 = *(double *)(*(_QWORD *)(a1 + 32) + 88);
    objc_msgSend(v4, "beginTime");
    v9 = v7 + v8;
    v10 = CACurrentMediaTime();
    v11 = *(_QWORD *)(a1 + 48);
    if (v10 >= v9)
    {
      if (!v11)
      {
        objc_msgSend(v14, "superview");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(*(id *)(a1 + 32), "_targetViewHasMatchMove:", v12) & 1) == 0)
        {
          v13 = *(double **)(a1 + 32);
          objc_msgSend(v13, "_matchMoveTargetView:withSourceView:usingSourceFrame:targetFrame:", v12, *(_QWORD *)(a1 + 40), v13[15], v13[16], v13[17], v13[18], v13[19], v13[20], v13[21], v13[22]);
        }
        goto LABEL_11;
      }
    }
    else if (v11 == 1)
    {
      objc_msgSend(v14, "superview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_addPositionToTargetView:matchingSourceView:initialSourceFrame:", v12, *(_QWORD *)(a1 + 40), *(double *)(*(_QWORD *)(a1 + 32) + 120), *(double *)(*(_QWORD *)(a1 + 32) + 128), *(double *)(*(_QWORD *)(a1 + 32) + 136), *(double *)(*(_QWORD *)(a1 + 32) + 144));
LABEL_11:

    }
  }

}

- (void)_configureBackgroundViewForEndpoint:(int64_t)a3 withContext:(id)a4
{
  double v4;
  id v5;

  if (a3 == 1)
    v4 = 1.0;
  else
    v4 = 0.0;
  objc_msgSend(a4, "backgroundView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWeighting:", v4);

}

- (void)_configureSearchViewsForEndpoint:(int64_t)a3 preparing:(BOOL)a4 withContext:(id)a5
{
  double v7;
  void *v8;
  __int128 v9;
  CGFloat v10;
  void *v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  if (a3 != 1 || !a4)
  {
    if (a3 == 1)
      v7 = 1.0;
    else
      v7 = 0.0;
    objc_msgSend(a5, "searchBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", v7);
    if (a3 == 1)
    {
      -[SBHLibraryWaveZoomSettings searchScale](self->_closeSettings, "searchScale");
      v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v13.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v13.c = v9;
      *(_OWORD *)&v13.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    }
    else
    {
      -[SBHLibraryWaveZoomSettings searchScale](self->_openSettings, "searchScale");
      memset(&v13, 0, sizeof(v13));
      CGAffineTransformMakeScale(&v13, v10, v10);
    }
    objc_msgSend(v8, "searchTextField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;
    objc_msgSend(v11, "setTransform:", &v12);

  }
}

- (void)_configureLayoutForPodViewAtIndex:(unint64_t)a3 forEndpoint:(int64_t)a4 withContext:(id)a5 includeYPosition:(BOOL)a6
{
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  CGAffineTransform *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CGAffineTransform v36;

  v10 = a5;
  -[NSMutableArray objectAtIndex:](self->_flyingPodViews, "objectAtIndex:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryZoomAnimator _flyingPodIconViewAtIndex:](self, "_flyingPodIconViewAtIndex:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryZoomAnimator _targetFrameForPodView:atIndex:forEndpoint:withContext:](self, "_targetFrameForPodView:atIndex:forEndpoint:withContext:", v11, a3, a4, v10);
  v14 = v13;
  if (a4)
  {
    -[SBHLibraryZoomAnimator _setIconImageInfo:forPodViewAtIndex:](self, "_setIconImageInfo:forPodViewAtIndex:", a3, self->_libraryIconImageInfo.size.width, self->_libraryIconImageInfo.size.height, self->_libraryIconImageInfo.scale, self->_libraryIconImageInfo.continuousCornerRadius);
    objc_msgSend(v12, "setIconLabelAlpha:", 1.0);
    objc_msgSend(v12, "layoutIfNeeded");
    objc_msgSend(v11, "layoutIfNeeded");
    objc_msgSend(v12, "customIconImageViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "iconListView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v33 = *MEMORY[0x1E0C9BAA8];
    v34 = v18;
    v35 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v19 = (CGAffineTransform *)&v33;
  }
  else
  {
    objc_msgSend(v11, "bounds");
    v21 = v14 / v20;
    -[SBHLibraryZoomAnimator _iconImageInfoForPodViewAtIndex:](self, "_iconImageInfoForPodViewAtIndex:", a3);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    objc_msgSend(v10, "libraryPodIconView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "iconImageInfo");
    v30 = v29 / v21;

    -[SBHLibraryZoomAnimator _setIconImageInfo:forPodViewAtIndex:](self, "_setIconImageInfo:forPodViewAtIndex:", a3, v23, v25, v27, v30);
    objc_msgSend(v12, "setIconLabelAlpha:", 0.0);
    objc_msgSend(v12, "layoutIfNeeded");
    objc_msgSend(v11, "layoutIfNeeded");
    objc_msgSend(v12, "customIconImageViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "iconListView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformMakeScale(&v36, 0.875, 0.875);
    v19 = &v36;
    v16 = v17;
  }
  objc_msgSend(v16, "setTransform:", v19, v33, v34, v35);

  UIRectGetCenter();
  v32 = v31;
  if (!a6)
    objc_msgSend(v11, "center");
  objc_msgSend(v11, "setCenter:", v32);

}

- (void)_configureCrossfadeDestinationContentForPodViewAtIndex:(unint64_t)a3 forEndpoint:(int64_t)a4 withContext:(id)a5
{
  void *v8;
  double v9;
  id v10;

  if (-[NSMutableArray count](self->_crossfadeViews, "count", a3, a4, a5) > a3)
  {
    -[NSMutableArray objectAtIndex:](self->_crossfadeViews, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    v9 = 0.0;
    if (a4 == 1)
      v9 = 1.0;
    objc_msgSend(v8, "setPodIconViewCrossfadeFraction:", v9);

  }
}

- (void)_configureCrossfadeSourceContentForPodViewAtIndex:(unint64_t)a3 forEndpoint:(int64_t)a4 withContext:(id)a5
{
  void *v8;
  double v9;
  id v10;

  if (-[NSMutableArray count](self->_crossfadeViews, "count", a3, a4, a5) > a3)
  {
    -[NSMutableArray objectAtIndex:](self->_crossfadeViews, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    v9 = 0.0;
    if (a4 == 1)
      v9 = 1.0;
    objc_msgSend(v8, "setSourceViewCrossfadeFraction:", v9);

  }
}

- (void)_configureAlphaForPodViewAtIndex:(unint64_t)a3 forEndpoint:(int64_t)a4 withContext:(id)a5
{
  void *v8;
  double v9;
  id v10;

  if (-[NSMutableArray count](self->_crossfadeViews, "count", a3, a4, a5) <= a3)
  {
    -[NSMutableArray objectAtIndex:](self->_flyingPodViews, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    v9 = 0.0;
    if (a4 == 1)
      v9 = 1.0;
    objc_msgSend(v8, "setAlpha:", v9);

  }
}

- (void)_configureScaleForPodViewAtIndex:(unint64_t)a3 forEndpoint:(int64_t)a4 withContext:(id)a5 includeYTranslation:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  __int128 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  CGAffineTransform v22;
  CGAffineTransform t1;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;

  v6 = a6;
  v10 = a5;
  -[NSMutableArray objectAtIndex:](self->_flyingPodViews, "objectAtIndex:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v26, 0, sizeof(v26));
  if (!a4)
  {
    -[SBHLibraryZoomAnimator _sourceFrameForPodViewAtIndex:inCoordinateSpace:withContext:](self, "_sourceFrameForPodViewAtIndex:inCoordinateSpace:withContext:", a3, 0, v10);
    v17 = v16;
    objc_msgSend(v10, "libraryPodIconView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "iconContentScale");
    v20 = v19;

    objc_msgSend(v11, "bounds");
    CGAffineTransformMakeScale(&v26, v20 * (v17 / v21), v20 * (v17 / v21));
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v26.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v26.c = v12;
  *(_OWORD *)&v26.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  if (v6)
  {
LABEL_3:
    -[SBHLibraryZoomAnimator _targetFrameForPodView:atIndex:forEndpoint:withContext:](self, "_targetFrameForPodView:atIndex:forEndpoint:withContext:", v11, a3, a4, v10);
    UIRectGetCenter();
    v14 = v13;
    objc_msgSend(v11, "center");
    memset(&v25, 0, sizeof(v25));
    CGAffineTransformMakeTranslation(&v25, 0.0, v14 - v15);
    t1 = v26;
    v22 = v25;
    CGAffineTransformConcat(&v24, &t1, &v22);
    v26 = v24;
  }
LABEL_4:
  v25 = v26;
  objc_msgSend(v11, "setTransform:", &v25);

}

- (void)_configureCategoryStackAlphaForPodViewAtIndex:(unint64_t)a3 forEndpoint:(int64_t)a4 withContext:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a5;
  if (a3 && -[NSMutableArray count](self->_crossfadeViews, "count") > a3)
  {
    -[NSMutableArray objectAtIndex:](self->_flyingPodViews, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "libraryIconViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "categoryStackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 1.0;
    v12 = 1.0;
    if (a4 != 1)
    {
      objc_msgSend(v10, "alphaForStackedViewAtIndex:", a3, 1.0);
      v11 = 0.0;
    }
    objc_msgSend(v8, "setAlpha:", v12);
    -[NSMutableArray objectAtIndex:](self->_crossfadeViews, "objectAtIndex:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "podIconView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIconImageAlpha:", v11);

  }
}

- (void)_configureDockIndicatorViewsForEndpoint:(int64_t)a3 preparing:(BOOL)a4 withContext:(id)a5
{
  _BOOL4 v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  if (a3)
    v5 = 1;
  else
    v5 = a4;
  if (v5)
    v6 = 0.0;
  else
    v6 = 1.0;
  if (a3 == 1)
    v7 = 1.0;
  else
    v7 = 0.0;
  objc_msgSend(a5, "libraryIconViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "categoryStackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v6);

  objc_msgSend(v10, "dismissalView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v7);

}

- (id)_flyingPodIconViewAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;

  -[NSMutableArray objectAtIndex:](self->_flyingPodViews, "objectAtIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_crossfadeViews, "count") <= a3)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(v5, "podIconView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (SBIconImageInfo)_iconImageInfoForPodViewAtIndex:(SEL)a3
{
  void *v5;
  SBIconImageInfo *result;

  -[NSMutableArray objectAtIndex:](self->_flyingPodViews, "objectAtIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray count](self->_crossfadeViews, "count");
  objc_msgSend(v5, "iconImageInfo");

  return result;
}

- (void)_setIconImageInfo:(SBIconImageInfo *)a3 forPodViewAtIndex:(unint64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v13;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  -[NSMutableArray objectAtIndex:](self->_flyingPodViews, "objectAtIndex:", a3, a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray count](self->_crossfadeViews, "count");
  objc_msgSend(v13, "setIconImageInfo:", v11, v10, v9, v8);

}

- (CGRect)_targetFrameForPodView:(id)a3 atIndex:(unint64_t)a4 forEndpoint:(int64_t)a5 withContext:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
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
  double v38;
  double v39;
  CGRect result;

  v10 = a6;
  v11 = a3;
  v12 = v11;
  if (a5)
  {
    objc_msgSend(v10, "iconListView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray objectAtIndex:](self->_libraryIconViews, "objectAtIndex:", a4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "icon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rectForIcon:", v14);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    objc_msgSend(v12, "superview");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "convertRect:toView:", v23, v16, v18, v20, v22);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;

  }
  else
  {
    objc_msgSend(v11, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBHLibraryZoomAnimator _sourceFrameForPodViewAtIndex:inCoordinateSpace:withContext:forUnscaledPositioning:](self, "_sourceFrameForPodViewAtIndex:inCoordinateSpace:withContext:forUnscaledPositioning:", a4, v13, v10, 1);
    v25 = v32;
    v27 = v33;
    v29 = v34;
    v31 = v35;
  }

  v36 = v25;
  v37 = v27;
  v38 = v29;
  v39 = v31;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

- (CGRect)_sourceFrameForPodViewAtIndex:(unint64_t)a3 inCoordinateSpace:(id)a4 withContext:(id)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[SBHLibraryZoomAnimator _sourceFrameForPodViewAtIndex:inCoordinateSpace:withContext:forUnscaledPositioning:](self, "_sourceFrameForPodViewAtIndex:inCoordinateSpace:withContext:forUnscaledPositioning:", a3, a4, a5, 0);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_sourceFrameForPodViewAtIndex:(unint64_t)a3 inCoordinateSpace:(id)a4 withContext:(id)a5 forUnscaledPositioning:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  double (**v14)(void *, void *);
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  CGAffineTransform v51;
  _QWORD aBlock[4];
  id v53;
  id v54;
  SBHLibraryZoomAnimator *v55;
  CGRect v56;
  CGRect v57;
  CGRect result;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __109__SBHLibraryZoomAnimator__sourceFrameForPodViewAtIndex_inCoordinateSpace_withContext_forUnscaledPositioning___block_invoke;
  aBlock[3] = &unk_1E8D880D0;
  v12 = v10;
  v53 = v12;
  v13 = v11;
  v54 = v13;
  v55 = self;
  v14 = (double (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(v13, "libraryPodIconView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (a3 && -[NSMutableArray count](self->_crossfadeViews, "count") > a3)
    {
      if (a3 >= 2)
        v16 = 2;
      else
        v16 = a3;
      objc_msgSend(v13, "libraryIconViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "categoryStackView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v15, "bounds");
        v50 = v19;
        v21 = v20;
        v23 = v22;
        v25 = v24;
        objc_msgSend(v15, "iconContentScale");
        v27 = v26;
        objc_msgSend(v18, "frameForStackedViewAtIndex:", v16);
        v29 = v28;
        v31 = v30;
        v33 = v32;
        v35 = v34;
        CGAffineTransformMakeScale(&v51, v27, v27);
        v56.origin.x = v29;
        v56.origin.y = v31;
        v56.size.width = v33;
        v56.size.height = v35;
        CGRectApplyAffineTransform(v56, &v51);
        v57.origin.x = v50;
        v57.origin.y = v21;
        v57.size.width = v23;
        v57.size.height = v25;
        CGRectGetWidth(v57);
        UIRectCenteredRect();
      }
      else
      {
        objc_msgSend(v18, "frameForStackedViewAtIndex:", v16);
      }
      v36 = v14[2](v14, v15);
      v38 = v43;
      v40 = v44;
      v42 = v45;

    }
    else
    {
      objc_msgSend(v15, "bounds");
      v36 = v14[2](v14, v15);
      v38 = v37;
      v40 = v39;
      v42 = v41;
    }
  }
  else
  {
    NSLog(CFSTR("Should always have a libraryPodIconView here; perhaps this animation wasn't validated"));
    v36 = *MEMORY[0x1E0C9D648];
    v38 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v40 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v42 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v46 = v36;
  v47 = v38;
  v48 = v40;
  v49 = v42;
  result.size.height = v49;
  result.size.width = v48;
  result.origin.y = v47;
  result.origin.x = v46;
  return result;
}

double __109__SBHLibraryZoomAnimator__sourceFrameForPodViewAtIndex_inCoordinateSpace_withContext_forUnscaledPositioning___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;

  v11 = a2;
  v12 = v11;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v11, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentationLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(v12, "layer");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;

    objc_msgSend(v12, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertRect:toLayer:", v19, a3, a4, a5, a6);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    objc_msgSend(*(id *)(a1 + 40), "libraryView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "convertRect:toView:", *(_QWORD *)(a1 + 32), v21, v23, v25, v27);
    v30 = v29;

    a3 = v30 - *(double *)(*(_QWORD *)(a1 + 48) + 104);
  }

  return a3;
}

- (void)_matchMoveTargetView:(id)a3 withSourceView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
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
  void *v31;
  void *v32;
  id v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  id v53;

  v53 = a3;
  v6 = a4;
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentationLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v6, "layer");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v6, "window");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertRect:toLayer:", v21, v13, v15, v17, v19);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  objc_msgSend(v53, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "presentationLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    v33 = v31;
  }
  else
  {
    objc_msgSend(v53, "layer");
    v33 = (id)objc_claimAutoreleasedReturnValue();
  }
  v34 = v33;

  objc_msgSend(v34, "bounds");
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  objc_msgSend(v53, "window");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "layer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "convertRect:toLayer:", v44, v36, v38, v40, v42);
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;

  -[SBHLibraryZoomAnimator _matchMoveTargetView:withSourceView:usingSourceFrame:targetFrame:](self, "_matchMoveTargetView:withSourceView:usingSourceFrame:targetFrame:", v53, v6, v23, v25, v27, v29, v46, v48, v50, v52);
}

- (void)_matchMoveTargetView:(id)a3 withSourceView:(id)a4 usingSourceFrame:(CGRect)a5 targetFrame:(CGRect)a6
{
  double y;
  double x;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  y = a5.origin.y;
  x = a5.origin.x;
  v19[1] = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1E0CD27C0];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "animation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setSourceLayer:", v13);
  objc_msgSend(v12, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v12, "setRemovedOnCompletion:", 0);
  objc_msgSend(v12, "setDuration:", INFINITY);
  objc_msgSend(v12, "setAppliesY:", 1);
  objc_msgSend(v12, "setAppliesX:", 1);
  UIRectGetCenter();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v14 - x, v15 - y);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSourcePoints:", v17);

  objc_msgSend(v11, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "addAnimation:forKey:", v12, CFSTR("SBHLibraryPodViewMatchMoveKey"));
}

- (BOOL)_targetViewHasMatchMove:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationForKey:", CFSTR("SBHLibraryPodViewMatchMoveKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)_removeMatchMoveFromTargetView:(id)a3
{
  id v3;

  objc_msgSend(a3, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("SBHLibraryPodViewMatchMoveKey"));

}

- (void)_addPositionToTargetView:(id)a3 matchingSourceView:(id)a4 initialSourceFrame:(CGRect)a5
{
  double y;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  y = a5.origin.y;
  v28 = a4;
  v7 = a3;
  objc_msgSend(v28, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentationLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v28, "layer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v28, "window");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertRect:toLayer:", v22, v14, v16, v18, v20);
  v24 = v23;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position.y"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24 - y);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFromValue:", v26);

  objc_msgSend(v25, "setToValue:", &unk_1E8E16B10);
  objc_msgSend(v25, "setAdditive:", 1);
  objc_msgSend(v25, "setDuration:", 0.05);
  objc_msgSend(v7, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "addAnimation:forKey:", v25, CFSTR("SBHLibraryPodViewAdditivePositionKey"));
}

- (void)_removePositionAdditionFromTargetView:(id)a3
{
  id v3;

  objc_msgSend(a3, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("SBHLibraryPodViewAdditivePositionKey"));

}

- (NSArray)pauseLayoutAssertions
{
  return self->_pauseLayoutAssertions;
}

- (void)setPauseLayoutAssertions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseLayoutAssertions, 0);
  objc_storeStrong((id *)&self->_closeSettings, 0);
  objc_storeStrong((id *)&self->_openSettings, 0);
  objc_storeStrong((id *)&self->_sourceTouchForwardingView, 0);
  objc_storeStrong((id *)&self->_presentationSourcePortalView, 0);
  objc_storeStrong((id *)&self->_presentationSourceOrderingAssertion, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_flyingPodWrapperViews, 0);
  objc_storeStrong((id *)&self->_crossfadeViews, 0);
  objc_storeStrong((id *)&self->_fadingPodViews, 0);
  objc_storeStrong((id *)&self->_flyingPodViews, 0);
  objc_storeStrong((id *)&self->_libraryIconViews, 0);
  objc_destroyWeak((id *)&self->_context);
}

@end
