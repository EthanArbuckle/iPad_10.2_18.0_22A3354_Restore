@implementation SBFullScreenFluidSwitcherRootSwitcherModifier

- (BOOL)shouldUseBackgroundWallpaperTreatmentForIndex:(unint64_t)a3
{
  void *v3;
  BOOL v4;

  -[SBFullScreenFluidSwitcherRootSwitcherModifier switcherSettings](self, "switcherSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectiveSwitcherStyle") == 1;

  return v4;
}

- (id)multitaskingModifierForEvent:(id)a3
{
  objc_class *v4;
  void *v5;
  id v6;

  v4 = -[SBFullScreenFluidSwitcherRootSwitcherModifier _defaultMultitaskingModifierClass](self, "_defaultMultitaskingModifierClass", a3);
  -[SBFluidSwitcherRootSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isMemberOfClass:", v4) & 1) == 0)
  {
    v6 = objc_alloc_init(v4);

    v5 = v6;
  }
  return v5;
}

- (Class)_defaultMultitaskingModifierClass
{
  void *v3;
  id v4;

  -[SBFullScreenFluidSwitcherRootSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFullScreenFluidSwitcherRootSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled");
  objc_msgSend(v3, "effectiveSwitcherStyle");
  v4 = (id)objc_opt_class();

  return (Class)v4;
}

- (id)transitionModifierForMainTransitionEvent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SBGridSwitcherModifier *v8;
  SBGridSwitcherModifier *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  SBCrossfadeDosidoSwitcherModifier *v14;
  void *v16;
  SBBannerUnfurlToFullScreenSwitcherModifier *v17;
  SBGridSwitcherModifier *v18;
  SBBannerUnfurlToFullScreenSwitcherModifier *v19;
  void *v20;
  SBGridSwitcherModifier *v21;
  SBFullScreenToHomeSlideOverSwitcherModifier *v22;
  uint64_t v23;
  SBGridSwitcherModifier *v24;
  void *v25;
  uint64_t v26;
  SBPulseTransitionSwitcherModifier *v27;
  SBHomeToDeckSwitcherModifier *v28;
  SBHomeToDeckSwitcherModifier *v29;
  void *v30;
  uint64_t v31;
  SBBannerUnfurlToFullScreenSwitcherModifier *v32;
  __objc2_class *v33;
  SBDeckToFullScreenSwitcherModifier *v34;
  __objc2_class *v35;
  SBMoveDisplaysTransitionSwitcherModifier *v36;
  SBFullScreenAppLayoutSwitcherModifier *v37;
  SBHomeToGridSwitcherModifier *v38;
  SBFullScreenToHomeSlideOverSwitcherModifier *v39;
  void *v40;
  SBHomeToDeckSwitcherModifier *v41;
  SBGridToFullScreenSwitcherModifier *v42;
  SBRotationSwitcherModifier *v43;
  SBDeckContinuityToFullScreenSwitcherModifier *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  SBSplitRemovalSwitcherModifier *v51;
  SBPeekToOffscreenSwitcherModifier *v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  SBMoveDisplaysTransitionSwitcherModifier *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  _BOOL4 v63;
  SBFullScreenToHomeIconZoomSwitcherModifier *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  double v82;
  double v83;
  __objc2_class *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  __objc2_class *v88;
  SBCenterWindowToFullScreenSwitcherModifier *v89;
  SBCenterWindowPagePresentationSwitcherModifier *v90;
  uint64_t v91;
  SBCenterWindowPagePresentationSwitcherModifier *v92;
  void *v93;
  SBGridSwitcherModifier *v94;
  void *v95;
  void *v96;
  SBSplitRemovalSwitcherModifier *v97;
  void *v98;
  uint64_t v99;
  SBSplitRemovalSwitcherModifier *v100;
  void *v101;
  SBGridSwitcherModifier *v102;
  SBGridSwitcherModifier *v103;
  uint64_t v104;
  void *v105;
  SBSplitRemovalSwitcherModifier *v106;
  void *v107;
  SBDosidoSwitcherModifier *v108;
  SBFullScreenToSplitViewSwitcherModifier *v109;
  SBDosidoSwitcherModifier *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  unsigned int v115;
  uint64_t v116;
  SBDosidoSwitcherModifier *v117;
  SBCaptureDropletZoomSwitcherModifier *v118;
  void *v119;
  void *v120;
  unsigned int v121;
  unsigned int v122;
  unsigned int v123;
  SBSplitDisplayItemCrossblurSwitcherModifier *v124;
  uint64_t v125;
  SBCrossblurDosidoSwitcherModifier *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  CGRect v131;

  v4 = a3;
  v5 = -[SBFullScreenFluidSwitcherRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled");
  v6 = objc_msgSend(v4, "toEnvironmentMode");
  v7 = objc_msgSend(v4, "fromEnvironmentMode");
  objc_msgSend(v4, "toAppLayout");
  v8 = (SBGridSwitcherModifier *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fromAppLayout");
  v9 = (SBGridSwitcherModifier *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFullScreenFluidSwitcherRootSwitcherModifier switcherSettings](self, "switcherSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "effectiveSwitcherStyle");

  objc_msgSend(v4, "toAppExposeBundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && v6 == 2)
    goto LABEL_3;
  if (objc_msgSend(v4, "isBannerUnfurlTransition"))
  {
    objc_msgSend(v4, "bannerUnfurlSourceContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if (v7 == 2)
      {
        v32 = [SBBannerUnfurlToFullScreenSwitcherModifier alloc];
        objc_msgSend(v4, "bannerUnfurlSourceContext");
        v18 = (SBGridSwitcherModifier *)objc_claimAutoreleasedReturnValue();
        v19 = v32;
        v20 = v10;
        v21 = 0;
        goto LABEL_32;
      }
      if (v7 == 3)
      {
        v17 = [SBBannerUnfurlToFullScreenSwitcherModifier alloc];
        objc_msgSend(v4, "bannerUnfurlSourceContext");
        v18 = (SBGridSwitcherModifier *)objc_claimAutoreleasedReturnValue();
        v19 = v17;
        v20 = v10;
        v21 = v9;
LABEL_32:
        v27 = -[SBBannerUnfurlToFullScreenSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:bannerUnfurlSourceContext:](v19, "initWithTransitionID:fromAppLayout:toAppLayout:bannerUnfurlSourceContext:", v20, v21, v8, v18);
LABEL_33:
        v14 = (SBCrossfadeDosidoSwitcherModifier *)v27;
LABEL_34:

        goto LABEL_4;
      }
LABEL_3:
      v14 = 0;
      goto LABEL_4;
    }
  }
  if (objc_msgSend(v4, "isBreadcrumbTransition") && v7 == 3 && v6 == 1)
  {
    v22 = -[SBFullScreenToHomeSlideOverSwitcherModifier initWithTransitionID:appLayout:direction:]([SBFullScreenToHomeSlideOverSwitcherModifier alloc], "initWithTransitionID:appLayout:direction:", v10, v9, 1);
    goto LABEL_14;
  }
  if (v6 != 3)
  {
    if (v6 == 2)
    {
      if (v7 == 2)
      {
        v35 = SBGridSwipeUpToSwitcherSwitcherModifier;
LABEL_45:
        v36 = (SBMoveDisplaysTransitionSwitcherModifier *)objc_msgSend([v35 alloc], "initWithTransitionID:", v10);
        goto LABEL_46;
      }
      if (v7 != 1)
      {
        if (v7 != 3)
          goto LABEL_3;
        if (SBPeekConfigurationIsValid(objc_msgSend(v4, "toPeekConfiguration")))
        {
          v37 = -[SBFullScreenFluidSwitcherRootSwitcherModifier _newMultitaskingModifier](self, "_newMultitaskingModifier");
          v38 = -[SBHomeToSwitcherSwitcherModifier initWithTransitionID:direction:multitaskingModifier:]([SBHomeToGridSwitcherModifier alloc], "initWithTransitionID:direction:multitaskingModifier:", v10, 1, v37);
        }
        else
        {
          if (v12 != 1)
            goto LABEL_3;
          v37 = -[SBFullScreenFluidSwitcherRootSwitcherModifier _newMultitaskingModifier](self, "_newMultitaskingModifier");
          v38 = -[SBDeckToFullScreenSwitcherModifier initWithTransitionID:direction:fullScreenAppLayout:deckModifier:]([SBDeckToFullScreenSwitcherModifier alloc], "initWithTransitionID:direction:fullScreenAppLayout:deckModifier:", v10, 1, v9, v37);
        }
LABEL_76:
        v14 = (SBCrossfadeDosidoSwitcherModifier *)v38;
        goto LABEL_77;
      }
      if (v12 != 1)
        goto LABEL_3;
      v28 = [SBHomeToDeckSwitcherModifier alloc];
      v18 = -[SBFullScreenFluidSwitcherRootSwitcherModifier _newMultitaskingModifier](self, "_newMultitaskingModifier");
      v29 = v28;
      v30 = v10;
      v31 = 1;
    }
    else
    {
      if (v6 != 1)
        goto LABEL_3;
      if (v7 != 2)
      {
        if (v7 != 3
          || (objc_msgSend(v4, "isEnteringSlideOverPeekEvent") & 1) != 0
          || (objc_msgSend(v4, "isEnteringAnyPeekEvent") & 1) != 0)
        {
          goto LABEL_3;
        }
        if (objc_msgSend(v4, "prefersCrossfadeTransition"))
        {
          v14 = -[SBCrossfadeDosidoSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:]([SBCrossfadeDosidoSwitcherModifier alloc], "initWithTransitionID:fromAppLayout:toAppLayout:", v10, v9, v8);
          -[SBCrossfadeDosidoSwitcherModifier setFullScreenTransition:](v14, "setFullScreenTransition:", v5 ^ 1);
          goto LABEL_4;
        }
        if (objc_msgSend(v4, "isExitingSplitViewPeekToHomeScreenEvent"))
        {
          v52 = [SBPeekToOffscreenSwitcherModifier alloc];
          objc_msgSend(v4, "fromAppLayout");
          v18 = (SBGridSwitcherModifier *)objc_claimAutoreleasedReturnValue();
          v27 = -[SBPeekToOffscreenSwitcherModifier initWithTransitionID:peekingAppLayout:peekConfiguration:spaceConfiguration:](v52, "initWithTransitionID:peekingAppLayout:peekConfiguration:spaceConfiguration:", v10, v18, objc_msgSend(v4, "fromPeekConfiguration"), objc_msgSend(v4, "fromSpaceConfiguration"));
          goto LABEL_33;
        }
        if (!v9)
          goto LABEL_3;
        -[SBFullScreenFluidSwitcherRootSwitcherModifier _entityRemovalModifierForMainTransitionEvent:](self, "_entityRemovalModifierForMainTransitionEvent:", v4);
        v14 = (SBCrossfadeDosidoSwitcherModifier *)objc_claimAutoreleasedReturnValue();
        if (v14)
          goto LABEL_4;
        if (objc_msgSend(v4, "isIconZoomDisabled"))
        {
          v53 = *MEMORY[0x1E0C9D628];
          v54 = *(double *)(MEMORY[0x1E0C9D628] + 8);
          v55 = *(double *)(MEMORY[0x1E0C9D628] + 16);
          v56 = *(double *)(MEMORY[0x1E0C9D628] + 24);
        }
        else
        {
          -[SBFullScreenFluidSwitcherRootSwitcherModifier homeScreenIconFrameForAppLayout:](self, "homeScreenIconFrameForAppLayout:", v9);
          v53 = v58;
          v54 = v59;
          v55 = v60;
          v56 = v61;
        }
        if (objc_msgSend(v4, "isMorphToPIPTransition"))
        {
          v14 = -[SBFullScreenToHomePIPSwitcherModifier initWithTransitionID:appLayout:layoutRole:]([SBFullScreenToHomePIPSwitcherModifier alloc], "initWithTransitionID:appLayout:layoutRole:", v10, v9, objc_msgSend(v4, "morphingPIPLayoutRole"));
          -[SBCrossfadeDosidoSwitcherModifier setShouldForceDefaultAnchorPointForTransition:](v14, "setShouldForceDefaultAnchorPointForTransition:", v5);
          -[SBCrossfadeDosidoSwitcherModifier setShouldClippingTakeShadowIntoAccount:](v14, "setShouldClippingTakeShadowIntoAccount:", v5);
          goto LABEL_4;
        }
        objc_msgSend(v4, "fromAppLayout");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = -[SBSwitcherModifier shouldZoomToSystemApertureForEvent:activeLayout:](self, "shouldZoomToSystemApertureForEvent:activeLayout:", v4, v62);

        if (v63)
        {
          v64 = -[SBFullScreenToHomeIconZoomSwitcherModifier initWithTransitionID:appLayout:direction:]([SBFullScreenToHomeIconZoomSwitcherModifier alloc], "initWithTransitionID:appLayout:direction:", v10, v9, 1);
          -[SBFullScreenToHomeIconZoomSwitcherModifier setShouldForceDefaultAnchorPointForTransition:](v64, "setShouldForceDefaultAnchorPointForTransition:", v5);
          -[SBFullScreenToHomeIconZoomSwitcherModifier setShouldDockOrderFrontDuringTransition:](v64, "setShouldDockOrderFrontDuringTransition:", v5);
          -[SBFullScreenFluidSwitcherRootSwitcherModifier appLayouts](self, "appLayouts");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v65, "indexOfObject:", v9);

          -[SBFullScreenFluidSwitcherRootSwitcherModifier currentVelocityValueForVisibleAppLayout:key:](self, "currentVelocityValueForVisibleAppLayout:key:", v9, CFSTR("position"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "CGPointValue");
          v69 = v68;
          v71 = v70;

          -[SBFullScreenFluidSwitcherRootSwitcherModifier frameForIndex:](self, "frameForIndex:", v66);
          v73 = v72;
          v75 = v74;
          v77 = v76;
          v79 = v78;
          -[SBFullScreenFluidSwitcherRootSwitcherModifier scaleForIndex:](self, "scaleForIndex:", v66);
          v14 = -[SBFullScreenToHomeSystemApertureSwitcherModifier initWithTransitionID:zoomModifier:appLayout:direction:expandedCardFrame:cardScale:cardVelocity:]([SBFullScreenToHomeSystemApertureSwitcherModifier alloc], "initWithTransitionID:zoomModifier:appLayout:direction:expandedCardFrame:cardScale:cardVelocity:", v10, v64, v9, 1, v73, v75, v77, v79, v80, v69, v71);

          goto LABEL_4;
        }
        if (!objc_msgSend(v4, "isMoveDisplaysTransition"))
        {
          v131.origin.x = v53;
          v131.origin.y = v54;
          v131.size.width = v55;
          v131.size.height = v56;
          if (!CGRectIsNull(v131) && (objc_msgSend(v4, "isMoveDisplaysTransition") & 1) == 0)
          {
            v14 = -[SBFullScreenToHomeIconZoomSwitcherModifier initWithTransitionID:appLayout:direction:]([SBFullScreenToHomeIconZoomSwitcherModifier alloc], "initWithTransitionID:appLayout:direction:", v10, v9, 1);
            -[SBCrossfadeDosidoSwitcherModifier setShouldForceDefaultAnchorPointForTransition:](v14, "setShouldForceDefaultAnchorPointForTransition:", v5);
            -[SBCrossfadeDosidoSwitcherModifier setShouldDockOrderFrontDuringTransition:](v14, "setShouldDockOrderFrontDuringTransition:", v5);
            goto LABEL_4;
          }
          -[SBFullScreenFluidSwitcherRootSwitcherModifier switcherSettings](self, "switcherSettings");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "switcherCenterYOffsetPercentOfScreenHeight");
          v83 = v82;

          v22 = -[SBFullScreenToHomeCenterZoomDownSwitcherModifier initWithTransitionID:appLayout:offsetYPercentOfScreenHeight:]([SBFullScreenToHomeCenterZoomDownSwitcherModifier alloc], "initWithTransitionID:appLayout:offsetYPercentOfScreenHeight:", v10, v9, v83);
LABEL_14:
          v14 = (SBCrossfadeDosidoSwitcherModifier *)v22;
          if (!(_DWORD)v5)
            goto LABEL_4;
LABEL_15:
          -[SBCrossfadeDosidoSwitcherModifier setShouldForceDefaultAnchorPointForTransition:](v14, "setShouldForceDefaultAnchorPointForTransition:", 1);
          goto LABEL_4;
        }
        v36 = -[SBMoveDisplaysTransitionSwitcherModifier initWithTransitionEvent:]([SBMoveDisplaysTransitionSwitcherModifier alloc], "initWithTransitionEvent:", v4);
LABEL_46:
        v14 = (SBCrossfadeDosidoSwitcherModifier *)v36;
        goto LABEL_4;
      }
      if (SBPeekConfigurationIsValid(objc_msgSend(v4, "toPeekConfiguration")))
      {
        v33 = SBHomeToGridSwitcherModifier;
      }
      else
      {
        if (v12 != 1)
          goto LABEL_3;
        v33 = SBHomeToDeckSwitcherModifier;
      }
      v41 = (SBHomeToDeckSwitcherModifier *)[v33 alloc];
      v18 = -[SBFullScreenFluidSwitcherRootSwitcherModifier _newMultitaskingModifier](self, "_newMultitaskingModifier");
      v29 = v41;
      v30 = v10;
      v31 = 0;
    }
    v27 = -[SBHomeToSwitcherSwitcherModifier initWithTransitionID:direction:multitaskingModifier:](v29, "initWithTransitionID:direction:multitaskingModifier:", v30, v31, v18);
    goto LABEL_33;
  }
  if (v7 == 1)
    goto LABEL_3;
  if (v7 != 3)
  {
    if (v7 != 2)
      goto LABEL_3;
    if (v12 != 1)
    {
      v42 = [SBGridToFullScreenSwitcherModifier alloc];
      v18 = objc_alloc_init(SBGridSwitcherModifier);
      v27 = -[SBGridToFullScreenSwitcherModifier initWithTransitionID:direction:fullScreenAppLayout:gridModifier:](v42, "initWithTransitionID:direction:fullScreenAppLayout:gridModifier:", v10, 0, v8, v18);
      goto LABEL_33;
    }
    if (!objc_msgSend(v4, "isContinuityTransition")
      || (-[SBFullScreenFluidSwitcherRootSwitcherModifier isAppLayoutVisibleInSwitcherBounds:](self, "isAppLayoutVisibleInSwitcherBounds:", v8) & 1) != 0)
    {
      v34 = [SBDeckToFullScreenSwitcherModifier alloc];
      v18 = -[SBFullScreenFluidSwitcherRootSwitcherModifier _newMultitaskingModifier](self, "_newMultitaskingModifier");
      v27 = -[SBDeckToFullScreenSwitcherModifier initWithTransitionID:direction:fullScreenAppLayout:deckModifier:](v34, "initWithTransitionID:direction:fullScreenAppLayout:deckModifier:", v10, 0, v8, v18);
      goto LABEL_33;
    }
    v37 = -[SBFullScreenAppLayoutSwitcherModifier initWithActiveAppLayout:]([SBFullScreenAppLayoutSwitcherModifier alloc], "initWithActiveAppLayout:", v8);
    v44 = [SBDeckContinuityToFullScreenSwitcherModifier alloc];
    v45 = -[SBFullScreenFluidSwitcherRootSwitcherModifier _newMultitaskingModifier](self, "_newMultitaskingModifier");
    v14 = -[SBDeckContinuityToFullScreenSwitcherModifier initWithTransitionID:appLayout:deckModifier:fullscreenModifier:](v44, "initWithTransitionID:appLayout:deckModifier:fullscreenModifier:", v10, v8, v45, v37);

LABEL_77:
    goto LABEL_4;
  }
  if (v9)
  {
    if (v8)
    {
      if (-[SBGridSwitcherModifier isEqual:](v9, "isEqual:", v8))
      {
        v23 = objc_msgSend(v4, "fromInterfaceOrientation");
        if (v23 != objc_msgSend(v4, "toInterfaceOrientation"))
        {
          v43 = [SBRotationSwitcherModifier alloc];
          objc_msgSend(v4, "toAppLayout");
          v18 = (SBGridSwitcherModifier *)objc_claimAutoreleasedReturnValue();
          v27 = -[SBRotationSwitcherModifier initWithTransitionID:appLayout:fromInterfaceOrientation:toInterfaceOrientation:](v43, "initWithTransitionID:appLayout:fromInterfaceOrientation:toInterfaceOrientation:", v10, v18, objc_msgSend(v4, "fromInterfaceOrientation"), objc_msgSend(v4, "toInterfaceOrientation"));
          goto LABEL_33;
        }
      }
    }
  }
  if (objc_msgSend(v4, "isMainPulseEvent"))
  {
    objc_msgSend(v4, "activatingAppLayout");
    v24 = (SBGridSwitcherModifier *)objc_claimAutoreleasedReturnValue();
    v18 = v24;
    if (v24 == v8)
    {
      v27 = -[SBPulseTransitionSwitcherModifier initWithTransitionID:appLayout:]([SBPulseTransitionSwitcherModifier alloc], "initWithTransitionID:appLayout:", v10, v8);
    }
    else
    {
      -[SBGridSwitcherModifier itemForLayoutRole:](v24, "itemForLayoutRole:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[SBGridSwitcherModifier layoutRoleForItem:](v8, "layoutRoleForItem:", v25);

      v27 = -[SBSplitDisplayItemPulseTransitionSwitcherModifier initWithTransitionID:appLayout:layoutRole:chamoisWindowingUIEnabled:]([SBSplitDisplayItemPulseTransitionSwitcherModifier alloc], "initWithTransitionID:appLayout:layoutRole:chamoisWindowingUIEnabled:", v10, v8, v26, v5);
    }
    goto LABEL_33;
  }
  if (!SBPeekConfigurationIsValid(objc_msgSend(v4, "fromPeekConfiguration"))
    && SBPeekConfigurationIsValid(objc_msgSend(v4, "toPeekConfiguration"))
    && v9 == v8)
  {
    goto LABEL_3;
  }
  if (SBPeekConfigurationIsValid(objc_msgSend(v4, "fromPeekConfiguration"))
    && !SBPeekConfigurationIsValid(objc_msgSend(v4, "toPeekConfiguration"))
    && v9 == v8)
  {
    v39 = [SBFullScreenToHomeSlideOverSwitcherModifier alloc];
    objc_msgSend(v4, "toAppLayout");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SBFullScreenToHomeSlideOverSwitcherModifier initWithTransitionID:appLayout:direction:](v39, "initWithTransitionID:appLayout:direction:", v10, v40, 0);

    -[SBCrossfadeDosidoSwitcherModifier setShouldBlurUnreadyScenes:](v14, "setShouldBlurUnreadyScenes:", 1);
    if (!(_DWORD)v5)
      goto LABEL_4;
    goto LABEL_15;
  }
  if ((objc_msgSend(v4, "isSlideOverToFullScreenEvent") & 1) != 0)
    goto LABEL_3;
  if ((-[SBGridSwitcherModifier isEqual:](v9, "isEqual:", v8) & 1) != 0)
  {
    if ((objc_msgSend(v4, "toFloatingSwitcherVisible") & 1) != 0
      || !objc_msgSend(v4, "fromFloatingSwitcherVisible"))
    {
      goto LABEL_3;
    }
    v35 = SBAppUnderFloatingSwitcherTransitionSwitcherModifier;
    goto LABEL_45;
  }
  if ((objc_msgSend(v4, "isGestureInitiated") & 1) != 0)
    goto LABEL_3;
  if (!objc_msgSend(v4, "isMoveDisplaysTransition"))
  {
    if (objc_msgSend(v4, "isMorphFromPIPTransition"))
    {
      v18 = -[SBDosidoSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:direction:]([SBDosidoSwitcherModifier alloc], "initWithTransitionID:fromAppLayout:toAppLayout:direction:", v10, v9, v8, 0);
      -[SBGridSwitcherModifier setShouldSuppressScaleAnimation:](v18, "setShouldSuppressScaleAnimation:", 1);
      v14 = -[SBPIPRestoreToFullScreenSwitcherModifier initWithTransitionID:transitionModifier:fromAppLayout:toAppLayout:toLayoutRole:]([SBPIPRestoreToFullScreenSwitcherModifier alloc], "initWithTransitionID:transitionModifier:fromAppLayout:toAppLayout:toLayoutRole:", v10, v18, v9, v8, objc_msgSend(v4, "morphingPIPLayoutRole"));
      -[SBCrossfadeDosidoSwitcherModifier setShouldForceDefaultAnchorPointForTransition:](v14, "setShouldForceDefaultAnchorPointForTransition:", v5);
      -[SBCrossfadeDosidoSwitcherModifier setShouldClippingTakeShadowIntoAccount:](v14, "setShouldClippingTakeShadowIntoAccount:", v5);
      goto LABEL_34;
    }
    if ((objc_msgSend(v4, "isEnteringSplitViewPeekEvent") & 1) != 0
      || (objc_msgSend(v4, "isAnySplitViewToOrFromSlideOverEvent") & 1) != 0)
    {
      goto LABEL_3;
    }
    if (objc_msgSend(v4, "isCenterWindowToFullScreenEvent"))
    {
      v36 = -[SBCenterWindowToFullScreenSwitcherModifier initWithTransitionID:fullScreenWithCenterAppLayout:]([SBCenterWindowToFullScreenSwitcherModifier alloc], "initWithTransitionID:fullScreenWithCenterAppLayout:", v10, v9);
      goto LABEL_46;
    }
    if ((objc_msgSend(v4, "isCenterWindowToSlideOverEvent") & 1) != 0)
      goto LABEL_3;
    if (objc_msgSend(v4, "isCenterWindowToNewSplitViewEvent"))
    {
      v36 = -[SBCenterWindowToNewSplitViewSwitcherModifier initWithTransitionID:fromFullScreenAppLayout:toSpaceAppLayout:]([SBCenterWindowToNewSplitViewSwitcherModifier alloc], "initWithTransitionID:fromFullScreenAppLayout:toSpaceAppLayout:", v10, v9, v8);
      goto LABEL_46;
    }
    if (objc_msgSend(v4, "isCenterWindowToExistingSplitViewEvent"))
    {
      v84 = SBCenterWindowToExistingSplitViewSwitcherModifier;
LABEL_119:
      v36 = (SBMoveDisplaysTransitionSwitcherModifier *)objc_msgSend([v84 alloc], "initWithTransitionID:fromAppLayout:toAppLayout:", v10, v9, v8);
      goto LABEL_46;
    }
    if (objc_msgSend(v4, "isCenterWindowRemovalEvent"))
    {
      objc_msgSend(v4, "removalContextForAppLayout:", v9);
      v37 = (SBFullScreenAppLayoutSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      v85 = -[SBFullScreenAppLayoutSwitcherModifier animationStyle](v37, "animationStyle");
      -[SBFullScreenAppLayoutSwitcherModifier displayItem](v37, "displayItem");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = -[SBGridSwitcherModifier layoutRoleForItem:](v9, "layoutRoleForItem:", v86);

      if (!v87)
      {
        v14 = 0;
        goto LABEL_77;
      }
      if (v85 == 3)
      {
        v88 = SBWindowDeclineSwitcherModifier;
      }
      else
      {
        if (v85 != 2)
        {
          v14 = -[SBWindowDeleteSwitcherModifier initWithTransitionID:fromAppLayout:layoutRole:]([SBWindowDeleteSwitcherModifier alloc], "initWithTransitionID:fromAppLayout:layoutRole:", v10, v9, v87);
          if ((-[SBFullScreenFluidSwitcherRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled") & 1) == 0&& v87 == 4&& -[SBGridSwitcherModifier centerConfiguration](v9, "centerConfiguration") == 2)
          {
            -[SBCrossfadeDosidoSwitcherModifier setUsePageFullScreenCenterWindowDeletion:](v14, "setUsePageFullScreenCenterWindowDeletion:", 1);
          }
          goto LABEL_77;
        }
        v88 = SBWindowCommitSwitcherModifier;
      }
      v38 = (SBHomeToGridSwitcherModifier *)objc_msgSend([v88 alloc], "initWithTransitionID:fromAppLayout:layoutRole:", v10, v9, v87);
      goto LABEL_76;
    }
    if (objc_msgSend(v4, "isSplitViewToCenterWindowEvent"))
    {
      v84 = SBSplitViewToCenterWindowSwitcherModifier;
      goto LABEL_119;
    }
    if ((objc_msgSend(v4, "isSlideOverToCenterWindowEvent") & 1) != 0)
      goto LABEL_3;
    if (objc_msgSend(v4, "isFullScreenToCenterWindowEvent"))
    {
      v89 = [SBCenterWindowToFullScreenSwitcherModifier alloc];
      objc_msgSend(v4, "toAppLayout");
      v18 = (SBGridSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      v27 = -[SBCenterWindowToFullScreenSwitcherModifier initWithTransitionID:fullScreenWithCenterAppLayout:](v89, "initWithTransitionID:fullScreenWithCenterAppLayout:", v10, v18);
      goto LABEL_33;
    }
    if (objc_msgSend(v4, "isPresentingPageCenterWindowEvent")
      && ((objc_msgSend(v4, "isNewSceneTransition") & 1) != 0 || objc_msgSend(v4, "isMorphFromInAppView")))
    {
      v90 = [SBCenterWindowPagePresentationSwitcherModifier alloc];
      v91 = objc_msgSend(v4, "isMorphFromInAppView");
      v92 = v90;
      v93 = v10;
      v94 = v8;
LABEL_145:
      v36 = -[SBCenterWindowPagePresentationSwitcherModifier initWithTransitionID:toAppLayout:isMorph:](v92, "initWithTransitionID:toAppLayout:isMorph:", v93, v94, v91);
      goto LABEL_46;
    }
    if (objc_msgSend(v4, "isReplaceCenterWindowWithNewCenterWindowEvent"))
    {
      if ((objc_msgSend(v4, "isShelfTransition") & 1) != 0)
        goto LABEL_3;
      v92 = [SBCenterWindowPagePresentationSwitcherModifier alloc];
      v93 = v10;
      v94 = v8;
      v91 = 0;
      goto LABEL_145;
    }
    if (!v8)
      goto LABEL_3;
    -[SBGridSwitcherModifier itemForLayoutRole:](v9, "itemForLayoutRole:", 1);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBGridSwitcherModifier itemForLayoutRole:](v8, "itemForLayoutRole:", 1);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBGridSwitcherModifier itemForLayoutRole:](v8, "itemForLayoutRole:", 2);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBGridSwitcherModifier itemForLayoutRole:](v9, "itemForLayoutRole:", 2);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v95)
    {
LABEL_157:
      if ((-[SBGridSwitcherModifier hasSameItemsInLayoutRoles:asAppLayout:](v9, "hasSameItemsInLayoutRoles:asAppLayout:", 16, v8) & 1) == 0&& -[SBGridSwitcherModifier hasSameItemsInLayoutRoles:asAppLayout:](v9, "hasSameItemsInLayoutRoles:asAppLayout:", 6, v8))
      {
        objc_msgSend(v4, "toAppExposeBundleID");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        if (v107)
        {

        }
        else
        {
          objc_msgSend(v4, "fromAppExposeBundleID");
          v120 = (void *)objc_claimAutoreleasedReturnValue();

          if (v120)
            goto LABEL_183;
        }
      }
      if (objc_msgSend(v4, "prefersCrossfadeTransition"))
      {
LABEL_162:
        v14 = -[SBCrossfadeDosidoSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:]([SBCrossfadeDosidoSwitcherModifier alloc], "initWithTransitionID:fromAppLayout:toAppLayout:", v10, v9, v8);
        -[SBCrossfadeDosidoSwitcherModifier setFullScreenTransition:](v14, "setFullScreenTransition:", v5 ^ 1);
        goto LABEL_184;
      }
      if (-[SBFullScreenFluidSwitcherRootSwitcherModifier isDevicePad](self, "isDevicePad")
        && objc_msgSend(v4, "isFullScreenToSplitViewEvent"))
      {
        -[SBGridSwitcherModifier itemForLayoutRole:](v8, "itemForLayoutRole:", 2);
        v108 = (SBDosidoSwitcherModifier *)objc_claimAutoreleasedReturnValue();
        v109 = -[SBFullScreenToSplitViewSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:]([SBFullScreenToSplitViewSwitcherModifier alloc], "initWithTransitionID:fromAppLayout:toAppLayout:", v10, v9, v8);
        v14 = -[SBSplitDisplayItemSwitcherModifier initWithDisplayItem:wrappingModifier:]([SBSplitDisplayItemSwitcherModifier alloc], "initWithDisplayItem:wrappingModifier:", v108, v109);
LABEL_166:

LABEL_172:
        goto LABEL_184;
      }
      if (objc_msgSend(v4, "isSwappingFullScreenAppSidesEvent"))
      {
        -[SBFullScreenFluidSwitcherRootSwitcherModifier leafAppLayoutForKeyboardFocusedScene](self, "leafAppLayoutForKeyboardFocusedScene");
        v108 = (SBDosidoSwitcherModifier *)objc_claimAutoreleasedReturnValue();
        -[SBGridSwitcherModifier leafAppLayoutForRole:](v9, "leafAppLayoutForRole:", 1);
        v110 = (SBDosidoSwitcherModifier *)objc_claimAutoreleasedReturnValue();
        if (v110 == v108)
          v111 = 1;
        else
          v111 = 2;

        v14 = -[SBSwapFullScreenAppSidesSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:layoutRoleToKeepOnTop:]([SBSwapFullScreenAppSidesSwitcherModifier alloc], "initWithTransitionID:fromAppLayout:toAppLayout:layoutRoleToKeepOnTop:", v10, v9, v8, v111);
        goto LABEL_172;
      }
      if ((objc_msgSend(v4, "isCenterWindowZoomingUpFromShelfEvent") & 1) == 0)
      {
        if (-[SBFullScreenFluidSwitcherRootSwitcherModifier isDevicePad](self, "isDevicePad")
          && !objc_msgSend(v4, "dosidoTransitionDirection"))
        {
          if (BSEqualObjects())
          {
            v121 = (v130 != 0) & ~BSEqualObjects();
            if (v127)
              v122 = v121;
            else
              v122 = 0;
          }
          else
          {
            v122 = 0;
          }
          if (BSEqualObjects())
            v123 = (v127 != 0) & ~BSEqualObjects();
          else
            v123 = 0;
          if ((v122 | v123) == 1)
          {
            v124 = [SBSplitDisplayItemCrossblurSwitcherModifier alloc];
            if (v123)
              v125 = 2;
            else
              v125 = 1;
            v126 = -[SBSplitDisplayItemCrossblurSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:layoutRole:](v124, "initWithTransitionID:fromAppLayout:toAppLayout:layoutRole:", v10, v9, v8, v125);
          }
          else
          {
            v126 = -[SBCrossblurDosidoSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:direction:]([SBCrossblurDosidoSwitcherModifier alloc], "initWithTransitionID:fromAppLayout:toAppLayout:direction:", v10, v9, v8, objc_msgSend(v4, "isBreadcrumbTransition"));
          }
          v14 = (SBCrossfadeDosidoSwitcherModifier *)v126;
          goto LABEL_184;
        }
        objc_msgSend(v4, "appLayoutsWithRemovalContexts");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = objc_msgSend(v112, "count");

        if (v113)
          goto LABEL_162;
        v114 = objc_msgSend(v4, "dosidoTransitionDirection");
        v115 = objc_msgSend(v4, "isBreadcrumbTransition");
        if (v114 == 2)
          v116 = 1;
        else
          v116 = v115;
        v117 = -[SBDosidoSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:direction:]([SBDosidoSwitcherModifier alloc], "initWithTransitionID:fromAppLayout:toAppLayout:direction:", v10, v9, v8, v116);
        -[SBDosidoSwitcherModifier setShouldSuppressScaleAnimation:](v117, "setShouldSuppressScaleAnimation:", v114 != 0);
        v108 = v117;
        objc_msgSend(v4, "zoomFromHardwareButtonPreludeTokenWrapper");
        v109 = (SBFullScreenToSplitViewSwitcherModifier *)objc_claimAutoreleasedReturnValue();
        v14 = (SBCrossfadeDosidoSwitcherModifier *)v108;
        if (-[SBFullScreenToSplitViewSwitcherModifier isTokenAvailable](v109, "isTokenAvailable"))
        {
          v118 = [SBCaptureDropletZoomSwitcherModifier alloc];
          -[SBFullScreenToSplitViewSwitcherModifier consumeToken](v109, "consumeToken");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[SBCaptureDropletZoomSwitcherModifier initWithTransitionID:zoomModifier:appLayout:launchPreludeAnimationToken:](v118, "initWithTransitionID:zoomModifier:appLayout:launchPreludeAnimationToken:", v10, v108, v8, v119);

        }
        goto LABEL_166;
      }
LABEL_183:
      v14 = 0;
      goto LABEL_184;
    }
    -[SBGridSwitcherModifier itemForLayoutRole:](v8, "itemForLayoutRole:", 2);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (v96)
    {

    }
    else if (BSEqualObjects())
    {
      v97 = [SBSplitRemovalSwitcherModifier alloc];
      objc_msgSend(v4, "removalContextForAppLayout:", v9);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(v98, "animationStyle");
      v100 = v97;
      v101 = v10;
      v102 = v9;
      v103 = v8;
      v104 = 1;
      goto LABEL_156;
    }
    -[SBGridSwitcherModifier itemForLayoutRole:](v8, "itemForLayoutRole:", 2);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    if (v105)
    {

      goto LABEL_157;
    }
    if (!BSEqualObjects())
      goto LABEL_157;
    v106 = [SBSplitRemovalSwitcherModifier alloc];
    objc_msgSend(v4, "removalContextForAppLayout:", v9);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v98, "animationStyle");
    v100 = v106;
    v101 = v10;
    v102 = v9;
    v103 = v8;
    v104 = 2;
LABEL_156:
    v14 = -[SBSplitRemovalSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:layoutRoleToRemove:animationStyle:](v100, "initWithTransitionID:fromAppLayout:toAppLayout:layoutRoleToRemove:animationStyle:", v101, v102, v103, v104, v99);

LABEL_184:
    goto LABEL_4;
  }
  v46 = 1;
  -[SBGridSwitcherModifier itemForLayoutRole:](v9, "itemForLayoutRole:", 1);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBGridSwitcherModifier itemForLayoutRole:](v9, "itemForLayoutRole:", 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBGridSwitcherModifier itemForLayoutRole:](v8, "itemForLayoutRole:", 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBGridSwitcherModifier itemForLayoutRole:](v8, "itemForLayoutRole:", 2);
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = (void *)v49;
  v51 = 0;
  if (v47 && !v49)
  {
    if ((BSEqualObjects() & 1) != 0 || (v46 = 2, BSEqualObjects()))
      v51 = -[SBSplitRemovalSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:layoutRoleToRemove:animationStyle:]([SBSplitRemovalSwitcherModifier alloc], "initWithTransitionID:fromAppLayout:toAppLayout:layoutRoleToRemove:animationStyle:", v10, v9, v8, v46, 0);
    else
      v51 = 0;
  }
  v57 = -[SBMoveDisplaysTransitionSwitcherModifier initWithTransitionEvent:]([SBMoveDisplaysTransitionSwitcherModifier alloc], "initWithTransitionEvent:", v4);
  v14 = (SBCrossfadeDosidoSwitcherModifier *)v57;
  if (v51)
    -[SBChainableModifier addChildModifier:](v57, "addChildModifier:", v51);

LABEL_4:
  return v14;
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  id v9;
  _BOOL4 v11;
  void *v12;
  id v13;
  char v14;
  _QWORD v16[4];
  id v17;

  v3 = a3;
  objc_msgSend(v3, "fromAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "fromEnvironmentMode");
  v7 = objc_msgSend(v3, "toEnvironmentMode");
  v8 = BSEqualObjects();
  v9 = 0;
  v11 = v6 == 3 || v7 == 3;
  if (!v8 && v11)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v3, "fromDisplayItemsPendingTermination");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __95__SBFullScreenFluidSwitcherRootSwitcherModifier_appLayoutsToEnsureExistForMainTransitionEvent___block_invoke;
    v16[3] = &unk_1E8E9DF50;
    v13 = v4;
    v17 = v13;
    v14 = objc_msgSend(v12, "bs_containsObjectPassingTest:", v16);

    if (v13 && (v14 & 1) == 0)
      objc_msgSend(v9, "addObject:", v13);
    if (v5)
      objc_msgSend(v9, "addObject:", v5);

  }
  return v9;
}

- (id)floorModifierForTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  SBHomeScreenSwitcherModifier *v7;
  SBAppUnderFloatingSwitcherSwitcherModifier *v8;
  void *v10;
  int v11;
  SBFullScreenAppLayoutSwitcherModifier *v12;
  SBFullScreenAppLayoutSwitcherModifier *v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  v6 = objc_msgSend(v4, "toEnvironmentMode");
  switch(v6)
  {
    case 1:
      v7 = objc_alloc_init(SBHomeScreenSwitcherModifier);
      break;
    case 3:
      objc_msgSend(v5, "toAppLayout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v5, "toFloatingSwitcherVisible");
      v12 = -[SBFullScreenAppLayoutSwitcherModifier initWithActiveAppLayout:]([SBFullScreenAppLayoutSwitcherModifier alloc], "initWithActiveAppLayout:", v10);
      v13 = v12;
      if (v11)
      {
        v8 = -[SBAppUnderFloatingSwitcherSwitcherModifier initWithActiveAppLayout:]([SBAppUnderFloatingSwitcherSwitcherModifier alloc], "initWithActiveAppLayout:", v10);
        -[SBChainableModifier addChildModifier:](v8, "addChildModifier:", v13);
      }
      else
      {
        v8 = v12;
      }

      if (!v8)
        goto LABEL_8;
      goto LABEL_9;
    case 2:
      -[SBFluidSwitcherRootSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
      v7 = (SBHomeScreenSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      break;
    default:
LABEL_8:
      v8 = objc_alloc_init(SBHomeScreenSwitcherModifier);
      goto LABEL_9;
  }
  v8 = (SBAppUnderFloatingSwitcherSwitcherModifier *)v7;
  if (!v7)
    goto LABEL_8;
LABEL_9:

  return v8;
}

- (id)shelfModifierForTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SBSwitcherShelf *v11;
  void *v12;
  void *v13;
  SBShelfSwitcherModifier *v14;
  unint64_t v15;
  SBShelfSwitcherModifier *v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_msgSend(v4, "toAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "toWindowPickerRole");
  if (SBLayoutRoleIsValidForSplitView(v6) && objc_msgSend(v4, "toEnvironmentMode") == 3)
  {
    objc_msgSend(v5, "leafAppLayoutForRole:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = -[SBSwitcherShelf initWithBundleIdentifier:layoutRole:displayMode:]([SBSwitcherShelf alloc], "initWithBundleIdentifier:layoutRole:displayMode:", v10, v6, 1);
      -[SBSwitcherShelf uniqueIdentifier](v11, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = 0;
      }
      else
      {
        v15 = +[SBShelfSwitcherModifier contentOptionsForTransitionEvent:context:](SBShelfSwitcherModifier, "contentOptionsForTransitionEvent:context:", v4, self);
        v16 = [SBShelfSwitcherModifier alloc];
        objc_msgSend(v4, "toFloatingAppLayout");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "fromAppLayout");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[SBShelfSwitcherModifier initWithShelf:contentOptions:activeFullScreenAppLayout:activeFloatingAppLayout:presentationTargetFrame:presentedFromAppLayout:](v16, "initWithShelf:contentOptions:activeFullScreenAppLayout:activeFloatingAppLayout:presentationTargetFrame:presentedFromAppLayout:", v11, v15, v5, v17, v18, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));

      }
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __95__SBFullScreenFluidSwitcherRootSwitcherModifier_appLayoutsToEnsureExistForMainTransitionEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsItem:", a2);
}

- (id)gestureModifierForGestureEvent:(id)a3
{
  id v4;
  void *v5;
  SBHomeGestureRootSwitcherModifier *v6;
  SBHomeGestureRootSwitcherModifier *v7;
  int64_t v8;
  id v9;
  __objc2_class *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  SBSceneResizeGestureRootSwitcherModifier *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "gestureID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  switch(objc_msgSend(v4, "gestureType"))
  {
    case 1:
      v7 = [SBHomeGestureRootSwitcherModifier alloc];
      v8 = -[SBFullScreenFluidSwitcherRootSwitcherModifier _effectiveEnvironmentMode](self, "_effectiveEnvironmentMode");
      v9 = -[SBFullScreenFluidSwitcherRootSwitcherModifier _newMultitaskingModifier](self, "_newMultitaskingModifier");
      v6 = -[SBHomeGestureRootSwitcherModifier initWithStartingEnvironmentMode:multitaskingModifier:](v7, "initWithStartingEnvironmentMode:multitaskingModifier:", v8, v9);

      -[SBHomeGestureRootSwitcherModifier setResignsTransitionIntoAppSwitcher:](v6, "setResignsTransitionIntoAppSwitcher:", 1);
      break;
    case 2:
      v10 = SBGridSwipeUpGestureSwitcherModifier;
      goto LABEL_5;
    case 4:
      v10 = SBMoveFloatingOverFullScreenGestureSwitcherModifier;
LABEL_5:
      v6 = (SBHomeGestureRootSwitcherModifier *)objc_msgSend([v10 alloc], "initWithGestureID:", v5);
      break;
    case 7:
      objc_msgSend(v4, "selectedAppLayout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "configuration");

      v13 = SBMainDisplayLayoutStateSpaceConfigurationFromAppLayoutConfiguration(v12);
      v14 = [SBSceneResizeGestureRootSwitcherModifier alloc];
      objc_msgSend(v4, "selectedAppLayout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[SBSceneResizeGestureRootSwitcherModifier initWithAppLayout:spaceConfiguration:](v14, "initWithAppLayout:spaceConfiguration:", v15, v13);

      break;
    default:
      break;
  }

  return v6;
}

- (id)reduceMotionModifierForReduceMotionChangedEvent:(id)a3
{
  if (-[SBFullScreenFluidSwitcherRootSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled", a3))return objc_alloc_init(SBReduceMotionSwitcherModifier);
  else
    return 0;
}

- (id)_entityRemovalModifierForMainTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  _BOOL8 v12;
  SBEntityRemovalCrossblurSwitcherModifier *v13;
  SBEntityRemovalCrossblurSwitcherModifier *v14;
  void *v15;
  void *v16;
  SBEntityRemovalSlideOffscreenSwitcherModifier *v17;
  void *v18;

  v4 = a3;
  objc_msgSend(v4, "fromAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "removalContextForAppLayout:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[SBFullScreenFluidSwitcherRootSwitcherModifier _newMultitaskingModifier](self, "_newMultitaskingModifier");
      v8 = objc_msgSend(v6, "animationStyle");
      if (SBReduceMotion() || v8 == 1)
      {
        v14 = [SBEntityRemovalCrossblurSwitcherModifier alloc];
        objc_msgSend(v4, "transitionID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "fromAppLayout");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[SBEntityRemovalCrossblurSwitcherModifier initWithTransitionID:appLayout:multitaskingModifier:](v14, "initWithTransitionID:appLayout:multitaskingModifier:", v15, v16, v7);
      }
      else
      {
        -[SBFullScreenFluidSwitcherRootSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = v8 == 2;
        v12 = v8 != 2;
        if (v11)
          objc_msgSend(v9, "dosidoCommitIntentAnimationSettings");
        else
          objc_msgSend(v9, "dosidoDeclineIntentAnimationSettings");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = [SBEntityRemovalSlideOffscreenSwitcherModifier alloc];
        objc_msgSend(v4, "transitionID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "fromAppLayout");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[SBEntityRemovalSlideOffscreenSwitcherModifier initWithTransitionID:appLayout:direction:animationSettings:multitaskingModifier:](v17, "initWithTransitionID:appLayout:direction:animationSettings:multitaskingModifier:", v16, v18, v12, v15, v7);

      }
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)insertionModifierForInsertionEvent:(id)a3
{
  id v3;
  SBInsertionSwitcherModifier *v4;
  void *v5;
  SBInsertionSwitcherModifier *v6;

  v3 = a3;
  v4 = [SBInsertionSwitcherModifier alloc];
  objc_msgSend(v3, "appLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SBInsertionSwitcherModifier initWithAppLayout:](v4, "initWithAppLayout:", v5);
  return v6;
}

- (id)swipeToKillModifierForSwipeToKillEvent:(id)a3
{
  id v3;
  SBSwipeToKillSwitcherModifier *v4;
  uint64_t v5;
  void *v6;
  SBSwipeToKillSwitcherModifier *v7;

  v3 = a3;
  v4 = [SBSwipeToKillSwitcherModifier alloc];
  v5 = objc_msgSend(v3, "layoutRole");
  objc_msgSend(v3, "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SBSwipeToKillSwitcherModifier initWithLayoutRole:inAppLayout:fadeOutSwipedItems:](v4, "initWithLayoutRole:inAppLayout:fadeOutSwipedItems:", v5, v6, 0);
  return v7;
}

- (id)removalModifierForRemovalEvent:(id)a3
{
  id v3;
  SBRemovalSwitcherModifier *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  SBRemovalSwitcherModifier *v8;

  v3 = a3;
  v4 = [SBRemovalSwitcherModifier alloc];
  v5 = objc_msgSend(v3, "layoutRole");
  objc_msgSend(v3, "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "reason");

  v8 = -[SBRemovalSwitcherModifier initWithLayoutRole:inAppLayout:reason:](v4, "initWithLayoutRole:inAppLayout:reason:", v5, v6, v7);
  return v8;
}

- (id)lowEndHardwareModifier
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sbf_animatedBlurRadiusGraphicsQuality");

  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "medusaCapabilities");

  v6 = 3;
  if (v3 == 100)
    v6 = 0;
  if (v5 == 1)
    v7 = v6 | 4;
  else
    v7 = v6;
  return -[SBLowEndHardwareSwitcherModifier initWithSimplificationOptions:]([SBLowEndHardwareSwitcherModifier alloc], "initWithSimplificationOptions:", v7);
}

- (id)userScrollingModifierForScrollEvent:(id)a3
{
  return objc_alloc_init(SBScrollingSwitcherModifier);
}

- (int64_t)_effectiveEnvironmentMode
{
  void *v4;
  int64_t v5;
  void *v7;

  -[SBFluidSwitcherRootSwitcherModifier floorModifier](self, "floorModifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFullScreenFluidSwitcherRootSwitcherModifier.m"), 611, CFSTR("Can't determine the effective environment mode without a floor modifier"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = 3;
    else
      v5 = 2 * (v4 != 0);
  }

  return v5;
}

- (id)_newMultitaskingModifier
{
  return objc_alloc_init(-[SBFullScreenFluidSwitcherRootSwitcherModifier _defaultMultitaskingModifierClass](self, "_defaultMultitaskingModifierClass"));
}

@end
