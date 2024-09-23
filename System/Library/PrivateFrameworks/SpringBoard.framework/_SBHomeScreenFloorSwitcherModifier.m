@implementation _SBHomeScreenFloorSwitcherModifier

- (id)appLayoutsToResignActive
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v3;
  void *v4;
  SBMutableSwitcherAnimationAttributes *v5;
  void *v6;
  void *v7;

  -[_SBHomeScreenFloorSwitcherModifier switcherSettings](self, "switcherSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(SBMutableSwitcherAnimationAttributes);
  -[SBSwitcherAnimationAttributes setUpdateMode:](v5, "setUpdateMode:", 1);
  objc_msgSend(v4, "layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherAnimationAttributes setLayoutSettings:](v5, "setLayoutSettings:", v6);

  objc_msgSend(v4, "opacitySettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherAnimationAttributes setOpacitySettings:](v5, "setOpacitySettings:", v7);

  return v5;
}

- (BOOL)shouldUseBrightMaterialForIndex:(unint64_t)a3
{
  return 0;
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeNone](SBSwitcherKeyboardSuppressionMode, "suppressionModeNone");
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  return 0;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)lighteningAlphaForIndex:(unint64_t)a3
{
  return 0.0;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "itemForLayoutRole:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isItemContainerPointerInteractionEnabled
{
  return 0;
}

- (BOOL)isIndexRubberbandableForSwipeToKill:(unint64_t)a3
{
  return 0;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 0;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (int64_t)tintStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleKillable:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 0;
}

- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  return 0.0;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  SBHomeToFullScreenCenterZoomSwitcherModifier *v22;
  SBPIPRestoreToFullScreenSwitcherModifier *v23;
  void *v24;
  SBBannerUnfurlToFullScreenSwitcherModifier *v25;
  SBFullScreenToHomeIconZoomSwitcherModifier *v26;
  SBFullScreenToHomeIconZoomSwitcherModifier *v27;
  SBFullScreenToHomeIconZoomSwitcherModifier *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  SBFullScreenToHomeIconZoomSwitcherModifier *v47;
  SBConsumedPreludeAnimationTokenSwitcherEventResponse *v48;
  uint64_t v49;
  SBAddModifierSwitcherEventResponse *v50;
  uint64_t v51;
  void *v53;
  void *v54;
  char v55;
  SBSlideOverToFullScreenSwitcherModifier *v56;
  void *v57;
  SBFullScreenToHomeIconZoomSwitcherModifier *v58;
  void *v59;
  objc_super v60;
  CGRect v61;

  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)_SBHomeScreenFloorSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v60, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "phase") == 1 && !objc_msgSend(v4, "isHandled"))
  {
    objc_msgSend(v4, "transitionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fromAppLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "toEnvironmentMode");
    objc_msgSend(v4, "toAppLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_SBHomeScreenFloorSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled");
    objc_msgSend(v4, "zoomFromHardwareButtonPreludeTokenWrapper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isTokenAvailable");

    if (v9 == 3)
    {
      if (objc_msgSend(v4, "isIconZoomDisabled"))
      {
        v14 = *MEMORY[0x1E0C9D628];
        v15 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        v16 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        v17 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      }
      else
      {
        -[_SBHomeScreenFloorSwitcherModifier homeScreenIconFrameForAppLayout:](self, "homeScreenIconFrameForAppLayout:", v10);
        v14 = v18;
        v15 = v19;
        v16 = v20;
        v17 = v21;
      }
      if (objc_msgSend(v4, "prefersCenterZoomTransition"))
      {
LABEL_9:
        v22 = -[SBHomeToFullScreenCenterZoomSwitcherModifier initWithTransitionID:toAppLayout:]([SBHomeToFullScreenCenterZoomSwitcherModifier alloc], "initWithTransitionID:toAppLayout:", v7, v10);
        v23 = (SBPIPRestoreToFullScreenSwitcherModifier *)v22;
        if ((_DWORD)v11)
          -[SBHomeToFullScreenCenterZoomSwitcherModifier setShouldForceDefaultAnchorPointForTransition:](v22, "setShouldForceDefaultAnchorPointForTransition:", 1);
        goto LABEL_21;
      }
      if (objc_msgSend(v4, "isBannerUnfurlTransition"))
      {
        objc_msgSend(v4, "bannerUnfurlSourceContext");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v25 = [SBBannerUnfurlToFullScreenSwitcherModifier alloc];
          objc_msgSend(v4, "bannerUnfurlSourceContext");
          v26 = (SBFullScreenToHomeIconZoomSwitcherModifier *)objc_claimAutoreleasedReturnValue();
          v23 = -[SBBannerUnfurlToFullScreenSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:bannerUnfurlSourceContext:](v25, "initWithTransitionID:fromAppLayout:toAppLayout:bannerUnfurlSourceContext:", v7, 0, v10, v26);
LABEL_16:

          goto LABEL_21;
        }
      }
      if (objc_msgSend(v4, "isMorphFromPIPTransition"))
      {
        v27 = [SBFullScreenToHomeIconZoomSwitcherModifier alloc];
        -[_SBHomeScreenFloorSwitcherModifier morphToPIPClippingFrame](self, "morphToPIPClippingFrame");
        v26 = -[SBFullScreenToHomeIconZoomSwitcherModifier initWithTransitionID:targetFrame:appLayout:direction:](v27, "initWithTransitionID:targetFrame:appLayout:direction:", v7, v10, 0);
        -[SBFullScreenToHomeIconZoomSwitcherModifier setShouldForceDefaultAnchorPointForTransition:](v26, "setShouldForceDefaultAnchorPointForTransition:", v11);
        -[SBFullScreenToHomeIconZoomSwitcherModifier setShouldDockOrderFrontDuringTransition:](v26, "setShouldDockOrderFrontDuringTransition:", v11);
        -[SBFullScreenToHomeIconZoomSwitcherModifier setShouldMatchMoveToIconView:](v26, "setShouldMatchMoveToIconView:", 0);
        -[SBFullScreenToHomeIconZoomSwitcherModifier setShouldUpdateIconViewVisibility:](v26, "setShouldUpdateIconViewVisibility:", 0);
        v23 = -[SBPIPRestoreToFullScreenSwitcherModifier initWithTransitionID:transitionModifier:fromAppLayout:toAppLayout:toLayoutRole:]([SBPIPRestoreToFullScreenSwitcherModifier alloc], "initWithTransitionID:transitionModifier:fromAppLayout:toAppLayout:toLayoutRole:", v7, v26, 0, v10, objc_msgSend(v4, "morphingPIPLayoutRole"));
        -[SBPIPRestoreToFullScreenSwitcherModifier setShouldForceDefaultAnchorPointForTransition:](v23, "setShouldForceDefaultAnchorPointForTransition:", v11);
        -[SBPIPRestoreToFullScreenSwitcherModifier setShouldClippingTakeShadowIntoAccount:](v23, "setShouldClippingTakeShadowIntoAccount:", v11);
        goto LABEL_16;
      }
      if (objc_msgSend(v4, "isZoomFromSystemApertureTransition"))
      {
        v28 = -[SBFullScreenToHomeIconZoomSwitcherModifier initWithTransitionID:appLayout:direction:]([SBFullScreenToHomeIconZoomSwitcherModifier alloc], "initWithTransitionID:appLayout:direction:", v7, v10, 0);
        -[_SBHomeScreenFloorSwitcherModifier currentVelocityValueForVisibleAppLayout:key:](self, "currentVelocityValueForVisibleAppLayout:key:", v8, CFSTR("position"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "CGPointValue");
        v31 = v30;
        v33 = v32;

        -[_SBHomeScreenFloorSwitcherModifier appLayouts](self, "appLayouts");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "indexOfObject:", v10);

        -[_SBHomeScreenFloorSwitcherModifier frameForIndex:](self, "frameForIndex:", v35);
        v37 = v36;
        v39 = v38;
        v41 = v40;
        v43 = v42;
        -[_SBHomeScreenFloorSwitcherModifier scaleForIndex:](self, "scaleForIndex:", v35);
        v23 = -[SBFullScreenToHomeSystemApertureSwitcherModifier initWithTransitionID:zoomModifier:appLayout:direction:expandedCardFrame:cardScale:cardVelocity:]([SBFullScreenToHomeSystemApertureSwitcherModifier alloc], "initWithTransitionID:zoomModifier:appLayout:direction:expandedCardFrame:cardScale:cardVelocity:", v7, v28, v10, 0, v37, v39, v41, v43, v44, v31, v33);

        goto LABEL_21;
      }
      if (v13)
      {
        objc_msgSend(v4, "zoomFromHardwareButtonPreludeTokenWrapper");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "consumeToken");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v47 = -[SBFullScreenToHomeIconZoomSwitcherModifier initWithTransitionID:appLayout:direction:]([SBFullScreenToHomeIconZoomSwitcherModifier alloc], "initWithTransitionID:appLayout:direction:", v7, v10, 0);
        -[SBFullScreenToHomeIconZoomSwitcherModifier setShouldUpdateIconViewVisibility:](v47, "setShouldUpdateIconViewVisibility:", 0);
        -[SBFullScreenToHomeIconZoomSwitcherModifier setShouldMatchMoveToIconView:](v47, "setShouldMatchMoveToIconView:", 0);
        v23 = -[SBCaptureDropletZoomSwitcherModifier initWithTransitionID:zoomModifier:appLayout:launchPreludeAnimationToken:]([SBCaptureDropletZoomSwitcherModifier alloc], "initWithTransitionID:zoomModifier:appLayout:launchPreludeAnimationToken:", v7, v47, v10, v46);
        v48 = -[SBConsumedPreludeAnimationTokenSwitcherEventResponse initWithPreludeToken:]([SBConsumedPreludeAnimationTokenSwitcherEventResponse alloc], "initWithPreludeToken:", v46);
        SBAppendSwitcherModifierResponse(v48, v5);
        v49 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v49;
        goto LABEL_21;
      }
      if (objc_msgSend(v4, "isExitingSlideOverPeekToAppEvent"))
      {
        objc_msgSend(v4, "toFloatingAppLayout");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "fromFloatingAppLayout");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v53, "isEqual:", v54);

        if ((v55 & 1) == 0)
        {
          v56 = [SBSlideOverToFullScreenSwitcherModifier alloc];
          objc_msgSend(v4, "fromFloatingAppLayout");
          v26 = (SBFullScreenToHomeIconZoomSwitcherModifier *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "toAppLayout");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[SBSlideOverToFullScreenSwitcherModifier initWithTransitionID:slideOverAppLayout:fullScreenAppLayout:replacingMainAppLayout:](v56, "initWithTransitionID:slideOverAppLayout:fullScreenAppLayout:replacingMainAppLayout:", v7, v26, v57, 0);

          goto LABEL_16;
        }
      }
      if ((objc_msgSend(v4, "isExitingSlideOverPeekToHomeScreenEvent") & 1) == 0)
      {
        if (objc_msgSend(v4, "isMoveDisplaysTransition"))
        {
          v23 = -[SBMoveDisplaysTransitionSwitcherModifier initWithTransitionEvent:]([SBMoveDisplaysTransitionSwitcherModifier alloc], "initWithTransitionEvent:", v4);
          goto LABEL_21;
        }
        if (((-[_SBHomeScreenFloorSwitcherModifier isDevicePad](self, "isDevicePad") & 1) != 0
           || !+[SBHomeScreenReturnToSpotlightPolicy areSpotlightBreadcrumbsEnabled](SBHomeScreenReturnToSpotlightPolicy, "areSpotlightBreadcrumbsEnabled"))&& objc_msgSend(v4, "isSpotlightTransition"))
        {
          goto LABEL_9;
        }
        v61.origin.x = v14;
        v61.origin.y = v15;
        v61.size.width = v16;
        v61.size.height = v17;
        if (!CGRectIsNull(v61))
        {
          v58 = -[SBFullScreenToHomeIconZoomSwitcherModifier initWithTransitionID:appLayout:direction:]([SBFullScreenToHomeIconZoomSwitcherModifier alloc], "initWithTransitionID:appLayout:direction:", v7, v10, 0);
          v23 = (SBPIPRestoreToFullScreenSwitcherModifier *)v58;
          if ((_DWORD)v11)
          {
            -[SBFullScreenToHomeIconZoomSwitcherModifier setShouldForceDefaultAnchorPointForTransition:](v58, "setShouldForceDefaultAnchorPointForTransition:", 1);
            -[SBPIPRestoreToFullScreenSwitcherModifier setShouldDockOrderFrontDuringTransition:](v23, "setShouldDockOrderFrontDuringTransition:", 1);
            -[_SBHomeScreenFloorSwitcherModifier homeScreenIconLocationForAppLayout:](self, "homeScreenIconLocationForAppLayout:", v10);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBPIPRestoreToFullScreenSwitcherModifier setShouldUpdateIconViewVisibility:](v23, "setShouldUpdateIconViewVisibility:", SBIconLocationGroupContainsLocation() ^ 1);
            if (objc_msgSend(v4, "isMoveDisplaysTransition"))
              -[SBPIPRestoreToFullScreenSwitcherModifier setShouldDisableAsyncRendering:](v23, "setShouldDisableAsyncRendering:", 1);

          }
          if (objc_msgSend(v4, "fromEnvironmentMode") == 1 && objc_msgSend(v4, "isEnteringAnyPeekEvent"))
            -[SBPIPRestoreToFullScreenSwitcherModifier setShouldUpdateIconViewVisibility:](v23, "setShouldUpdateIconViewVisibility:", 0);
          goto LABEL_21;
        }
        if (objc_msgSend(v4, "prefersCrossfadeTransition"))
        {
          v23 = -[SBCrossfadeDosidoSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:]([SBCrossfadeDosidoSwitcherModifier alloc], "initWithTransitionID:fromAppLayout:toAppLayout:", v7, v8, v10);
          -[SBPIPRestoreToFullScreenSwitcherModifier setFullScreenTransition:](v23, "setFullScreenTransition:", v11 ^ 1);
LABEL_21:
          if (v23)
          {
            v50 = -[SBAddModifierSwitcherEventResponse initWithModifier:level:]([SBAddModifierSwitcherEventResponse alloc], "initWithModifier:level:", v23, 3);
            SBAppendSwitcherModifierResponse(v50, v5);
            v51 = objc_claimAutoreleasedReturnValue();

            v5 = (void *)v51;
          }
          goto LABEL_23;
        }
        if (v10)
          goto LABEL_9;
      }
    }
LABEL_23:
    v6 = v5;

    goto LABEL_24;
  }
  v6 = v5;
LABEL_24:

  return v6;
}

- (BOOL)wantsSwitcherDimmingView
{
  return 0;
}

- (BOOL)isScrollEnabled
{
  return 0;
}

- (BOOL)wantsHomeScreenPointerInteractions
{
  return 1;
}

- (BOOL)isSwitcherWindowVisible
{
  return 0;
}

- (double)wallpaperScale
{
  return 1.0;
}

- (int64_t)switcherBackdropBlurType
{
  return 1;
}

- (double)shelfBackgroundBlurOpacity
{
  return 0.0;
}

- (CGRect)shelfBackgroundBlurFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)homeScreenDimmingAlpha
{
  return 0.0;
}

- (double)homeScreenScale
{
  return 1.0;
}

- (double)homeScreenBackdropBlurProgress
{
  return 0.0;
}

- (double)homeScreenAlpha
{
  return 1.0;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 0;
}

- (BOOL)isHomeScreenContentRequired
{
  return 0;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 1;
}

- (double)contentViewScale
{
  return 1.0;
}

- (id)topMostLayoutElements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)wantsSwitcherBackdropBlur
{
  return 0;
}

- (BOOL)isContainerStatusBarVisible
{
  return 1;
}

- (double)containerStatusBarAnimationDuration
{
  return 0.35;
}

- (BOOL)wantsDockWindowLevelAssertion
{
  return 0;
}

- (BOOL)wantsAsynchronousSurfaceRetentionAssertion
{
  return 1;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (id)appExposeAccessoryButtonsBundleIdentifier
{
  return 0;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  return 0.0;
}

- (CGRect)clippingFrameForIndex:(unint64_t)a3 withBounds:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v4 = *MEMORY[0x1E0C9D628];
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  return 0;
}

- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (CGRect)clippingFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5 withBounds:(CGRect)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v6 = *MEMORY[0x1E0C9D628];
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (double)blurViewIconScaleForIndex:(unint64_t)a3
{
  return 1.0;
}

- (BOOL)wantsSlideOverTongue
{
  return 0;
}

- (id)visibleHomeAffordanceLayoutElements
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (unint64_t)transactionCompletionOptions
{
  void *v3;
  int v4;

  -[_SBHomeScreenFloorSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = -[_SBHomeScreenFloorSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled");

    if (v4)
      return 6;
    else
      return 2;
  }
  else
  {

    return 6;
  }
}

- (BOOL)shouldPerformRotationAnimationForOrientationChange
{
  return 0;
}

- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode
{
  return 0;
}

- (id)appLayoutToScrollToBeforeTransitioning
{
  return 0;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v4;
  char v5;
  void *v6;
  _QWORD v8[4];
  char v9;

  v4 = a3;
  v5 = -[_SBHomeScreenFloorSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70___SBHomeScreenFloorSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
  v8[3] = &__block_descriptor_33_e21_B16__0__SBAppLayout_8l;
  v9 = v5;
  objc_msgSend(v4, "bs_filter:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)visibleAppLayouts
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)plusButtonAlpha
{
  return 0.0;
}

- (double)reopenClosedWindowsButtonAlpha
{
  return 0.0;
}

- (double)reopenClosedWindowsButtonScale
{
  return 1.0;
}

- (int64_t)appExposeAccessoryButtonsOverrideUserInterfaceStyle
{
  return 0;
}

- (int64_t)plusButtonStyle
{
  return 0;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
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
  objc_super v28;
  CGRect v29;
  CGRect result;

  v5 = *MEMORY[0x1E0C9D628];
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  -[_SBHomeScreenFloorSwitcherModifier appLayouts](self, "appLayouts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "allItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 == 1)
  {
    -[_SBHomeScreenFloorSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 != v13)
    {
      objc_msgSend(v10, "itemForLayoutRole:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "layoutRoleForItem:", v14);
      -[_SBHomeScreenFloorSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v28.receiver = self;
      v28.super_class = (Class)_SBHomeScreenFloorSwitcherModifier;
      -[_SBHomeScreenFloorSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v28, sel_frameForLayoutRole_inAppLayout_withBounds_, v15, v13);
      v5 = v16;
      v6 = v17;
      v7 = v18;
      v8 = v19;

    }
  }
  v29.origin.x = v5;
  v29.origin.y = v6;
  v29.size.width = v7;
  v29.size.height = v8;
  if (CGRectIsNull(v29))
  {
    -[_SBHomeScreenFloorSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v5 = v20;
    v6 = v21;
    v7 = v22;
    v8 = v23;
  }

  v24 = v5;
  v25 = v6;
  v26 = v7;
  v27 = v8;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  return 1.0;
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  void *v3;
  char v4;

  -[_SBHomeScreenFloorSwitcherModifier homeGrabberSettings](self, "homeGrabberSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  return v4;
}

- (id)visibleShelves
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (CGRect)frameForShelf:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)containerLeafAppLayoutForShelf:(id)a3
{
  return 0;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  CGRect v4;

  -[_SBHomeScreenFloorSwitcherModifier frameForIndex:](self, "frameForIndex:", a3);
  return CGRectGetWidth(v4);
}

- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 0.0;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIRectCornerRadii result;

  -[_SBHomeScreenFloorSwitcherModifier displayCornerRadius](self, "displayCornerRadius", a3);
  SBRectCornerRadiiForRadius();
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (double)switcherBackdropBlurProgress
{
  return 0.0;
}

- (double)switcherDimmingAlpha
{
  return 0.0;
}

- (BOOL)switcherDimmingViewBlocksTouches
{
  return 0;
}

- (BOOL)canSelectLeafWithModifierKeysInAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isFocusEnabledForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  BOOL v4;
  BOOL v5;

  if (a3)
    v4 = a3 == 1;
  else
    v4 = 1;
  if (((1 << a3) & 0x6808) != 0)
    v5 = a4 != 0;
  else
    v5 = v4;
  return (unint64_t)a3 <= 0xE && v5;
}

- (id)neighboringAppLayoutsForFocusedAppLayout:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
}

- (id)activeLeafAppLayoutsReachableByKeyboardShortcut
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)inactiveAppLayoutsReachableByKeyboardShortcut
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)shouldUseBackgroundWallpaperTreatmentForIndex:(unint64_t)a3
{
  return 0;
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  void *v2;
  void *v3;

  -[_SBHomeScreenFloorSwitcherModifier appLayouts](self, "appLayouts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subarrayWithRange:", 0, objc_msgSend(v2, "count") != 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)preferredSnapshotOrientationForAppLayout:(id)a3
{
  if (-[_SBHomeScreenFloorSwitcherModifier isDisplayEmbedded](self, "isDisplayEmbedded", a3))
    return 1;
  else
    return 2;
}

- (id)appLayoutToScrollToBeforeReopeningClosedWindows
{
  return 0;
}

- (BOOL)shouldAcceleratedHomeButtonPressBegin
{
  return 0;
}

- (BOOL)shouldRubberbandFullScreenHomeGrabberView
{
  return 0;
}

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  return 0;
}

- (id)appLayoutForReceivingHardwareButtonEvents
{
  return 0;
}

- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  return 0;
}

- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval
{
  return 0;
}

- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)shouldConfigureInAppDockHiddenAssertion
{
  return 0;
}

- (BOOL)wantsDockBehaviorAssertion
{
  return 0;
}

- (double)dockProgress
{
  return 1.0;
}

- (int64_t)dockUpdateMode
{
  return 2;
}

- (unint64_t)dockWindowLevelPriority
{
  return 0;
}

- (double)dockWindowLevel
{
  return 0.0;
}

- (unint64_t)slideOverTongueState
{
  return 0;
}

- (unint64_t)slideOverTongueDirection
{
  return 1;
}

- (id)appLayoutToAttachSlideOverTongue
{
  return 0;
}

- (id)foregroundAppLayouts
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (char)jetsamModeForAppLayout:(id)a3
{
  return 0;
}

- (char)activityModeForAppLayout:(id)a3
{
  return 0;
}

@end
