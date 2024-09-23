@implementation SBMedusaSettings

- (double)switcherShelfIconHitTestInset
{
  return self->_switcherShelfIconHitTestInset;
}

- (BOOL)statusBarDebugOffsettingEnabled
{
  return self->_statusBarDebugOffsettingEnabled;
}

- (BOOL)showContentDragExclusionRects
{
  return self->_showContentDragExclusionRects;
}

- (BOOL)statusBarDebugBackgroundColorsEnabled
{
  return self->_statusBarDebugBackgroundColorsEnabled;
}

- (double)cornerRadiusForInnerCorners
{
  return self->_cornerRadiusForInnerCorners;
}

- (double)cornerRadiusForFloatingApps
{
  return self->_cornerRadiusForFloatingApps;
}

- (double)cornerRadiusForCompatibilityAppOuterCorners
{
  return self->_cornerRadiusForCompatibilityAppOuterCorners;
}

- (SBMedusa1oSettings)medusa1oSettings
{
  return self->_medusa1oSettings;
}

- (void)setDefaultValues
{
  void *v2;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  char v45;
  uint64_t v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  CAFrameRateRange v76;
  CAFrameRateRange v77;
  CAFrameRateRange v78;
  CAFrameRateRange v79;
  CAFrameRateRange v80;
  CAFrameRateRange v81;
  CAFrameRateRange v82;
  CAFrameRateRange v83;
  CAFrameRateRange v84;
  CAFrameRateRange v85;
  CAFrameRateRange v86;
  CAFrameRateRange v87;
  CAFrameRateRange v88;
  CAFrameRateRange v89;
  CAFrameRateRange v90;
  CAFrameRateRange v91;
  CAFrameRateRange v92;

  -[SBMedusaSettings setPersistentDock:](self, "setPersistentDock:", 1);
  -[SBMedusaSettings setNumberOfRecents:](self, "setNumberOfRecents:", 3.0);
  -[SBMedusaSettings setDismissHitTestTopPadding:](self, "setDismissHitTestTopPadding:", 20.0);
  -[SBMedusaSettings dockAnimationSettings](self, "dockAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultValues");

  -[SBMedusaSettings dockAnimationSettings](self, "dockAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v5, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v76.minimum, *(double *)&v76.maximum, *(double *)&v76.preferred);

  -[SBMedusaSettings dockWithPresentedFolderAnimationSettings](self, "dockWithPresentedFolderAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultValues");

  -[SBMedusaSettings dockWithPresentedFolderAnimationSettings](self, "dockWithPresentedFolderAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v7, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v77.minimum, *(double *)&v77.maximum, *(double *)&v77.preferred);

  -[SBMedusaSettings dockWithPresentedFolderAnimationSettings](self, "dockWithPresentedFolderAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDampingRatio:", 0.9962);

  -[SBMedusaSettings dockWithPresentedFolderAnimationSettings](self, "dockWithPresentedFolderAnimationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setResponse:", 0.2721);

  -[SBMedusaSettings setNarrowEdgeSwipeHitTestWidth:](self, "setNarrowEdgeSwipeHitTestWidth:", 108.0);
  -[SBMedusaSettings setWideEdgeSwipeHitTestWidth:](self, "setWideEdgeSwipeHitTestWidth:", 140.0);
  -[SBMedusaSettings setRimShadowRadius:](self, "setRimShadowRadius:", 0.5);
  -[SBMedusaSettings setRimShadowOpacity:](self, "setRimShadowOpacity:", 0.15);
  -[SBMedusaSettings setFloatingAppCardScaleWhileTouched:](self, "setFloatingAppCardScaleWhileTouched:");
  -[SBMedusaSettings setFloatingAppCardScaleWhileCursorHovered:](self, "setFloatingAppCardScaleWhileCursorHovered:", 1.012);
  -[SBMedusaSettings setDiffuseShadowRadius:](self, "setDiffuseShadowRadius:", 56.0);
  -[SBMedusaSettings setDiffuseShadowOpacity:](self, "setDiffuseShadowOpacity:", 0.24);
  -[SBMedusaSettings setDiffuseShadowOffsetHorizontal:](self, "setDiffuseShadowOffsetHorizontal:", 10.0);
  -[SBMedusaSettings setDiffuseShadowOffsetVertical:](self, "setDiffuseShadowOffsetVertical:", 7.0);
  -[SBMedusaSettings setDiffuseShadowRadiusWhileTouched:](self, "setDiffuseShadowRadiusWhileTouched:", 60.0);
  -[SBMedusaSettings setDiffuseShadowOpacityWhileTouched:](self, "setDiffuseShadowOpacityWhileTouched:", 0.26);
  -[SBMedusaSettings setDiffuseShadowOffsetHorizontalWhileTouched:](self, "setDiffuseShadowOffsetHorizontalWhileTouched:", 0.0);
  -[SBMedusaSettings setDiffuseShadowOffsetVerticalWhileTouched:](self, "setDiffuseShadowOffsetVerticalWhileTouched:", 30.0);
  -[SBMedusaSettings setCoronaDiffuseShadowOpacity:](self, "setCoronaDiffuseShadowOpacity:", 1.0);
  -[SBMedusaSettings setCoronaDiffuseShadowOpacityWhileTouched:](self, "setCoronaDiffuseShadowOpacityWhileTouched:", 1.0);
  -[SBMedusaSettings setCoronaRimShadowOpacity:](self, "setCoronaRimShadowOpacity:", 0.5);
  -[SBMedusaSettings setVibrantColorMatrixM11:](self, "setVibrantColorMatrixM11:", 0.664);
  -[SBMedusaSettings setVibrantColorMatrixM12:](self, "setVibrantColorMatrixM12:", -0.192);
  -[SBMedusaSettings setVibrantColorMatrixM13:](self, "setVibrantColorMatrixM13:", -0.037);
  -[SBMedusaSettings setVibrantColorMatrixM14:](self, "setVibrantColorMatrixM14:", 0.0);
  -[SBMedusaSettings setVibrantColorMatrixM15:](self, "setVibrantColorMatrixM15:", 0.0);
  -[SBMedusaSettings setVibrantColorMatrixM21:](self, "setVibrantColorMatrixM21:", -0.097);
  -[SBMedusaSettings setVibrantColorMatrixM22:](self, "setVibrantColorMatrixM22:", 0.57);
  -[SBMedusaSettings setVibrantColorMatrixM23:](self, "setVibrantColorMatrixM23:", -0.037);
  -[SBMedusaSettings setVibrantColorMatrixM24:](self, "setVibrantColorMatrixM24:", 0.0);
  -[SBMedusaSettings setVibrantColorMatrixM25:](self, "setVibrantColorMatrixM25:", 0.0);
  -[SBMedusaSettings setVibrantColorMatrixM31:](self, "setVibrantColorMatrixM31:", -0.098);
  -[SBMedusaSettings setVibrantColorMatrixM32:](self, "setVibrantColorMatrixM32:", -0.191);
  -[SBMedusaSettings setVibrantColorMatrixM33:](self, "setVibrantColorMatrixM33:", 0.724);
  -[SBMedusaSettings setVibrantColorMatrixM34:](self, "setVibrantColorMatrixM34:", 0.0);
  -[SBMedusaSettings setVibrantColorMatrixM35:](self, "setVibrantColorMatrixM35:", 0.0);
  -[SBMedusaSettings setVibrantColorMatrixM41:](self, "setVibrantColorMatrixM41:", -0.26);
  -[SBMedusaSettings setVibrantColorMatrixM42:](self, "setVibrantColorMatrixM42:", -0.511);
  -[SBMedusaSettings setVibrantColorMatrixM43:](self, "setVibrantColorMatrixM43:", 0.099);
  -[SBMedusaSettings setVibrantColorMatrixM44:](self, "setVibrantColorMatrixM44:", 1.0);
  -[SBMedusaSettings setVibrantColorMatrixM45:](self, "setVibrantColorMatrixM45:", 0.0);
  -[SBMedusaSettings setBlurFadeAnimationDuration:](self, "setBlurFadeAnimationDuration:", 0.25);
  -[SBMedusaSettings setReduceMotionBlurFadeAnimationDuration:](self, "setReduceMotionBlurFadeAnimationDuration:", 0.2);
  -[SBMedusaSettings windowDragAnimationSettings](self, "windowDragAnimationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDefaultValues");

  -[SBMedusaSettings windowDragAnimationSettings](self, "windowDragAnimationSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTrackingDampingRatio:", 0.92);

  -[SBMedusaSettings windowDragAnimationSettings](self, "windowDragAnimationSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTrackingResponse:", 0.1);

  -[SBMedusaSettings windowDragAnimationSettings](self, "windowDragAnimationSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v13, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v78.minimum, *(double *)&v78.maximum, *(double *)&v78.preferred);

  -[SBMedusaSettings medusaAnimationSettings](self, "medusaAnimationSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDampingRatio:", 0.92);

  -[SBMedusaSettings medusaAnimationSettings](self, "medusaAnimationSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setResponse:", 0.457);

  -[SBMedusaSettings medusaAnimationSettings](self, "medusaAnimationSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTrackingDampingRatio:", 0.9);

  -[SBMedusaSettings medusaAnimationSettings](self, "medusaAnimationSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTrackingResponse:", 0.12);

  -[SBMedusaSettings medusaAnimationSettings](self, "medusaAnimationSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v18, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v79.minimum, *(double *)&v79.maximum, *(double *)&v79.preferred);

  -[SBMedusaSettings resizeAnimationSettings](self, "resizeAnimationSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDampingRatio:", 1.0);

  -[SBMedusaSettings resizeAnimationSettings](self, "resizeAnimationSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setResponse:", 0.42);

  -[SBMedusaSettings resizeAnimationSettings](self, "resizeAnimationSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v21, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v80.minimum, *(double *)&v80.maximum, *(double *)&v80.preferred);

  -[SBMedusaSettings platterAnimationSettings](self, "platterAnimationSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDampingRatio:", 0.9);

  -[SBMedusaSettings platterAnimationSettings](self, "platterAnimationSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setResponse:", 0.42);

  -[SBMedusaSettings platterAnimationSettings](self, "platterAnimationSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v24, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v81.minimum, *(double *)&v81.maximum, *(double *)&v81.preferred);

  -[SBMedusaSettings dropAnimationSettings](self, "dropAnimationSettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDampingRatio:", 0.92);

  -[SBMedusaSettings dropAnimationSettings](self, "dropAnimationSettings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setResponse:", 0.457);

  -[SBMedusaSettings dropAnimationSettings](self, "dropAnimationSettings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTrackingDampingRatio:", 0.92);

  -[SBMedusaSettings dropAnimationSettings](self, "dropAnimationSettings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTrackingResponse:", 0.457);

  -[SBMedusaSettings dropAnimationSettings](self, "dropAnimationSettings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v29, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v82.minimum, *(double *)&v82.maximum, *(double *)&v82.preferred);

  -[SBMedusaSettings switcherCardDropAnimationSettings](self, "switcherCardDropAnimationSettings");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setDefaultValues");

  -[SBMedusaSettings switcherCardDropAnimationSettings](self, "switcherCardDropAnimationSettings");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setDampingRatio:", 0.92);

  -[SBMedusaSettings switcherCardDropAnimationSettings](self, "switcherCardDropAnimationSettings");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setResponse:", 0.531);

  -[SBMedusaSettings switcherCardDropAnimationSettings](self, "switcherCardDropAnimationSettings");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTrackingDampingRatio:", 0.92);

  -[SBMedusaSettings switcherCardDropAnimationSettings](self, "switcherCardDropAnimationSettings");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTrackingResponse:", 0.531);

  -[SBMedusaSettings switcherCardDropAnimationSettings](self, "switcherCardDropAnimationSettings");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v35, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v83.minimum, *(double *)&v83.maximum, *(double *)&v83.preferred);

  -[SBMedusaSettings topAffordanceExpandAnimationSettings](self, "topAffordanceExpandAnimationSettings");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDampingRatio:", 1.01);

  -[SBMedusaSettings topAffordanceExpandAnimationSettings](self, "topAffordanceExpandAnimationSettings");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setResponse:", 0.28);

  -[SBMedusaSettings topAffordanceExpandAnimationSettings](self, "topAffordanceExpandAnimationSettings");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setRetargetImpulse:", 0.016);

  -[SBMedusaSettings topAffordanceExpandAnimationSettings](self, "topAffordanceExpandAnimationSettings");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v39, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v84.minimum, *(double *)&v84.maximum, *(double *)&v84.preferred);

  -[SBMedusaSettings topAffordanceCollapseAnimationSettings](self, "topAffordanceCollapseAnimationSettings");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setDampingRatio:", 1.01);

  -[SBMedusaSettings topAffordanceCollapseAnimationSettings](self, "topAffordanceCollapseAnimationSettings");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setResponse:", 0.28);

  -[SBMedusaSettings topAffordanceCollapseAnimationSettings](self, "topAffordanceCollapseAnimationSettings");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setRetargetImpulse:", 0.016);

  -[SBMedusaSettings topAffordanceCollapseAnimationSettings](self, "topAffordanceCollapseAnimationSettings");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v43, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v85.minimum, *(double *)&v85.maximum, *(double *)&v85.preferred);

  -[SBMedusaSettings setDropAnimationUnblurThresholdPercentage:](self, "setDropAnimationUnblurThresholdPercentage:", 0.5);
  -[SBMedusaSettings setResizeAnimationUnblurThresholdPercentage:](self, "setResizeAnimationUnblurThresholdPercentage:", 0.9);
  -[SBMedusaSettings setResizeAnimationDismissItemOpacity:](self, "setResizeAnimationDismissItemOpacity:", 0.4);
  -[SBMedusaSettings setMovePanGestureThresholdPercentage:](self, "setMovePanGestureThresholdPercentage:", 0.3);
  -[SBMedusaSettings setMovePanGesturePositiveVelocityThreshold:](self, "setMovePanGesturePositiveVelocityThreshold:", 500.0);
  -[SBMedusaSettings setMovePanGestureNegativeVelocityThreshold:](self, "setMovePanGestureNegativeVelocityThreshold:", -500.0);
  -[SBMedusaSettings setIconPlatterScale:](self, "setIconPlatterScale:", 0.4);
  -[SBMedusaSettings setWindowPlatterScale:](self, "setWindowPlatterScale:", 0.8);
  -[SBMedusaSettings setWindowPlatterScaleForReplacingEntireSpace:](self, "setWindowPlatterScaleForReplacingEntireSpace:", 0.6);
  -[SBMedusaSettings setCardPlatterScale:](self, "setCardPlatterScale:", 1.0);
  -[SBMedusaSettings setFloatingCardPlatterScale:](self, "setFloatingCardPlatterScale:", 0.7);
  -[SBMedusaSettings setSlideOverTongueExpandedScale:](self, "setSlideOverTongueExpandedScale:", 0.34);
  -[SBMedusaSettings setCardDragOverSplitAppLayoutScale:](self, "setCardDragOverSplitAppLayoutScale:", 0.96);
  -[SBMedusaSettings setReflowAnimationProgressForCardHeaderFadeIn:](self, "setReflowAnimationProgressForCardHeaderFadeIn:", 1.0);
  -[SBMedusaSettings setDraggingPlatterSideActivationGutterPadding:](self, "setDraggingPlatterSideActivationGutterPadding:", 8.0);
  -[SBMedusaSettings setDraggingPlatterFullscreenActivationRegionWidth:](self, "setDraggingPlatterFullscreenActivationRegionWidth:", 320.0);
  -[SBMedusaSettings setDraggingPlatterFullscreenActivationRegionHeight:](self, "setDraggingPlatterFullscreenActivationRegionHeight:", 24.0);
  -[SBMedusaSettings setSwitcherFullScreenContentPushInScale:](self, "setSwitcherFullScreenContentPushInScale:", 0.98);
  -[SBMedusaSettings setSwitcherCenterWindowContentPushInScale:](self, "setSwitcherCenterWindowContentPushInScale:", 0.9);
  -[SBMedusaSettings setSwitcherSlideOverContentPushInScale:](self, "setSwitcherSlideOverContentPushInScale:", 0.95);
  -[SBMedusaSettings setSwitcherSlideOverDosidoLayoutOvershootMultiplicationFactor:](self, "setSwitcherSlideOverDosidoLayoutOvershootMultiplicationFactor:", 1.2);
  -[SBMedusaSettings setMedusaSeparatorCursorTopEdgeInset:](self, "setMedusaSeparatorCursorTopEdgeInset:", -5.0);
  -[SBMedusaSettings setMedusaSeparatorCursorBottomEdgeInset:](self, "setMedusaSeparatorCursorBottomEdgeInset:", -5.0);
  -[SBMedusaSettings setMedusaSeparatorCursorLeftEdgeInset:](self, "setMedusaSeparatorCursorLeftEdgeInset:", -2.5);
  -[SBMedusaSettings setMedusaSeparatorCursorRightEdgeInset:](self, "setMedusaSeparatorCursorRightEdgeInset:", -2.5);
  -[SBMedusaSettings setReplacementDimmingAlpha:](self, "setReplacementDimmingAlpha:", 0.06);
  -[SBMedusaSettings setTopAffordanceHitTestExtendTop:](self, "setTopAffordanceHitTestExtendTop:", 20.0);
  -[SBMedusaSettings setTopAffordanceHitTestExtendBottom:](self, "setTopAffordanceHitTestExtendBottom:", 20.0);
  -[SBMedusaSettings setTopAffordanceHitTestExtendLeft:](self, "setTopAffordanceHitTestExtendLeft:", 20.0);
  -[SBMedusaSettings setTopAffordanceHitTestExtendRight:](self, "setTopAffordanceHitTestExtendRight:", 20.0);
  -[SBMedusaSettings setShowContentDragExclusionRects:](self, "setShowContentDragExclusionRects:", 0);
  -[SBMedusaSettings setContentDraggingCommandeerGutterInsetForUniversalControl:](self, "setContentDraggingCommandeerGutterInsetForUniversalControl:", 20.0);
  -[SBMedusaSettings setContentDraggingCommandeerGutterWidth:](self, "setContentDraggingCommandeerGutterWidth:", 120.0);
  -[SBMedusaSettings setContentDraggingSideActivationGutterWidth:](self, "setContentDraggingSideActivationGutterWidth:", 60.0);
  -[SBMedusaSettings setContentDraggingFloatingActivationGutterWidth:](self, "setContentDraggingFloatingActivationGutterWidth:", 150.0);
  -[SBMedusaSettings setWindowTearOffDraggingSideActivationGutterWidth:](self, "setWindowTearOffDraggingSideActivationGutterWidth:", 100.0);
  -[SBMedusaSettings setWindowTearOffDraggingFloatingActivationGutterWidth:](self, "setWindowTearOffDraggingFloatingActivationGutterWidth:", 350.0);
  -[SBMedusaSettings setWindowSplitViewDismissalGutterWidth:](self, "setWindowSplitViewDismissalGutterWidth:", 90.0);
  -[SBMedusaSettings setMedusaWindowDraggingCursorTopEdgeInset:](self, "setMedusaWindowDraggingCursorTopEdgeInset:", -4.0);
  -[SBMedusaSettings setMedusaWindowDraggingCursorBottomEdgeInset:](self, "setMedusaWindowDraggingCursorBottomEdgeInset:", -4.0);
  -[SBMedusaSettings setMedusaWindowDraggingCursorLeftEdgeInset:](self, "setMedusaWindowDraggingCursorLeftEdgeInset:", -7.0);
  -[SBMedusaSettings setMedusaWindowDraggingCursorRightEdgeInset:](self, "setMedusaWindowDraggingCursorRightEdgeInset:", -7.0);
  -[SBMedusaSettings setCornerRadiusForInnerCorners:](self, "setCornerRadiusForInnerCorners:", 5.0);
  -[SBMedusaSettings cornerRadiusForInnerCorners](self, "cornerRadiusForInnerCorners");
  -[SBMedusaSettings setCornerRadiusForCompatibilityAppOuterCorners:](self, "setCornerRadiusForCompatibilityAppOuterCorners:");
  -[SBMedusaSettings setCornerRadiusForFloatingApps:](self, "setCornerRadiusForFloatingApps:", 10.0);
  v44 = __sb__runningInSpringBoard();
  v45 = v44;
  if (v44)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      -[SBMedusaSettings setCornerRadiusFallbackForOldApps:](self, "setCornerRadiusFallbackForOldApps:", 0.0);
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom"))
    {
      -[SBMedusaSettings setCornerRadiusFallbackForOldApps:](self, "setCornerRadiusFallbackForOldApps:", 0.0);
LABEL_10:

      goto LABEL_11;
    }
  }
  v46 = SBFEffectiveHomeButtonType();
  v47 = 39.0;
  if (v46 != 2)
    v47 = 0.0;
  -[SBMedusaSettings setCornerRadiusFallbackForOldApps:](self, "setCornerRadiusFallbackForOldApps:", v47);
  if ((v45 & 1) == 0)
    goto LABEL_10;
LABEL_11:
  -[SBMedusaSettings setStatusBarDebugBackgroundColorsEnabled:](self, "setStatusBarDebugBackgroundColorsEnabled:", 0);
  -[SBMedusaSettings setStatusBarDebugOffsettingEnabled:](self, "setStatusBarDebugOffsettingEnabled:", 0);
  -[SBMedusaSettings setSwitcherShelfCardScale:](self, "setSwitcherShelfCardScale:", 0.105);
  -[SBMedusaSettings setSwitcherShelfCardCornerRadius:](self, "setSwitcherShelfCardCornerRadius:", 6.0);
  -[SBMedusaSettings setSwitcherShelfCardShadowRadius:](self, "setSwitcherShelfCardShadowRadius:", 24.0);
  -[SBMedusaSettings setSwitcherShelfCardShadowOffsetY:](self, "setSwitcherShelfCardShadowOffsetY:", 16.0);
  -[SBMedusaSettings setSwitcherShelfCardShadowOpacity:](self, "setSwitcherShelfCardShadowOpacity:", 0.4);
  -[SBMedusaSettings setSwitcherShelfLabelLineSpacing:](self, "setSwitcherShelfLabelLineSpacing:", 1.0);
  -[SBMedusaSettings setSwitcherShelfBottomSpacing:](self, "setSwitcherShelfBottomSpacing:", 64.0);
  -[SBMedusaSettings setSwitcherShelfBackgroundBlurPresentationThreshold:](self, "setSwitcherShelfBackgroundBlurPresentationThreshold:", 1.0);
  -[SBMedusaSettings setSwitcherCenterWindowShadowRadius:](self, "setSwitcherCenterWindowShadowRadius:", 20.0);
  -[SBMedusaSettings setSwitcherCenterWindowShadowOffsetY:](self, "setSwitcherCenterWindowShadowOffsetY:", 6.0);
  -[SBMedusaSettings setSwitcherCenterWindowShadowOpacity:](self, "setSwitcherCenterWindowShadowOpacity:", 0.24);
  -[SBMedusaSettings setSwitcherPeekingWindowShadowRadius:](self, "setSwitcherPeekingWindowShadowRadius:", 44.0);
  -[SBMedusaSettings setSwitcherPeekingWindowShadowOffsetY:](self, "setSwitcherPeekingWindowShadowOffsetY:", 0.0);
  -[SBMedusaSettings setSwitcherPeekingWindowShadowOpacity:](self, "setSwitcherPeekingWindowShadowOpacity:", 0.32);
  -[SBMedusaSettings setLeadingSlideOverRelocationDelay:](self, "setLeadingSlideOverRelocationDelay:", 0.4);
  -[SBMedusaSettings setDefaultDimmingOpacity:](self, "setDefaultDimmingOpacity:", 0.3);
  -[SBMedusaSettings setSwitcherShelfSplitViewIconInset:](self, "setSwitcherShelfSplitViewIconInset:", 4.0);
  -[SBMedusaSettings setSwitcherShelfIconHitTestInset:](self, "setSwitcherShelfIconHitTestInset:", 24.0);
  -[SBMedusaSettings switcherShelfGenieRopeSettings](self, "switcherShelfGenieRopeSettings");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setDefaultValues");

  -[SBMedusaSettings switcherShelfGenieRopeSettings](self, "switcherShelfGenieRopeSettings");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setResponse:", 0.375);

  -[SBMedusaSettings switcherShelfGenieRopeSettings](self, "switcherShelfGenieRopeSettings");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setDampingRatio:", 1.0);

  -[SBMedusaSettings switcherShelfGenieRopeSettings](self, "switcherShelfGenieRopeSettings");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v51, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v86.minimum, *(double *)&v86.maximum, *(double *)&v86.preferred);

  -[SBMedusaSettings switcherShelfCardGeniePresentationSettings](self, "switcherShelfCardGeniePresentationSettings");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setDefaultValues");

  -[SBMedusaSettings switcherShelfCardGeniePresentationSettings](self, "switcherShelfCardGeniePresentationSettings");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setResponse:", 0.675);

  -[SBMedusaSettings switcherShelfCardGeniePresentationSettings](self, "switcherShelfCardGeniePresentationSettings");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setDampingRatio:", 1.05);

  -[SBMedusaSettings switcherShelfCardGeniePresentationSettings](self, "switcherShelfCardGeniePresentationSettings");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v55, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v87.minimum, *(double *)&v87.maximum, *(double *)&v87.preferred);

  -[SBMedusaSettings switcherShelfCardGenieDismissalSettings](self, "switcherShelfCardGenieDismissalSettings");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setDefaultValues");

  -[SBMedusaSettings switcherShelfCardGenieDismissalSettings](self, "switcherShelfCardGenieDismissalSettings");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setResponse:", 0.5);

  -[SBMedusaSettings switcherShelfCardGenieDismissalSettings](self, "switcherShelfCardGenieDismissalSettings");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setDampingRatio:", 0.875);

  -[SBMedusaSettings switcherShelfCardGenieDismissalSettings](self, "switcherShelfCardGenieDismissalSettings");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v59, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v88.minimum, *(double *)&v88.maximum, *(double *)&v88.preferred);

  -[SBMedusaSettings setSwitcherShelfGenieInitialYIncrementBelowScreen:](self, "setSwitcherShelfGenieInitialYIncrementBelowScreen:", 100.0);
  -[SBMedusaSettings setSwitcherShelfCardGenieResponseIncrementScalar:](self, "setSwitcherShelfCardGenieResponseIncrementScalar:", 0.08);
  -[SBMedusaSettings setSwitcherShelfCardGenieDismissedScale:](self, "setSwitcherShelfCardGenieDismissedScale:", 0.05);
  -[SBMedusaSettings setSwitcherShelfGenieBezierCurvePointYDeltaFromTarget:](self, "setSwitcherShelfGenieBezierCurvePointYDeltaFromTarget:", -380.0);
  -[SBMedusaSettings setSwitcherShelfGenieBezierCurveXExponent:](self, "setSwitcherShelfGenieBezierCurveXExponent:", 1.6);
  -[SBMedusaSettings setSwitcherShelfGenieBezierCurveYExponent:](self, "setSwitcherShelfGenieBezierCurveYExponent:", 1.0);
  -[SBMedusaSettings setSwitcherShelfGenieBezierCurveScaleExponent:](self, "setSwitcherShelfGenieBezierCurveScaleExponent:", 0.98);
  -[SBMedusaSettings switcherShelfNonGenieRopeSettings](self, "switcherShelfNonGenieRopeSettings");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setDefaultValues");

  -[SBMedusaSettings switcherShelfNonGenieRopeSettings](self, "switcherShelfNonGenieRopeSettings");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setResponse:", 0.4);

  -[SBMedusaSettings switcherShelfNonGenieRopeSettings](self, "switcherShelfNonGenieRopeSettings");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setDampingRatio:", 1.0);

  -[SBMedusaSettings switcherShelfNonGenieRopeSettings](self, "switcherShelfNonGenieRopeSettings");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v63, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v89.minimum, *(double *)&v89.maximum, *(double *)&v89.preferred);

  -[SBMedusaSettings switcherShelfCardNonGeniePresentationSettings](self, "switcherShelfCardNonGeniePresentationSettings");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setDefaultValues");

  -[SBMedusaSettings switcherShelfCardNonGeniePresentationSettings](self, "switcherShelfCardNonGeniePresentationSettings");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setResponse:", 0.475);

  -[SBMedusaSettings switcherShelfCardNonGeniePresentationSettings](self, "switcherShelfCardNonGeniePresentationSettings");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setDampingRatio:", 0.9);

  -[SBMedusaSettings switcherShelfCardNonGeniePresentationSettings](self, "switcherShelfCardNonGeniePresentationSettings");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v67, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v90.minimum, *(double *)&v90.maximum, *(double *)&v90.preferred);

  -[SBMedusaSettings switcherShelfCardNonGenieDismissalSettings](self, "switcherShelfCardNonGenieDismissalSettings");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setDefaultValues");

  -[SBMedusaSettings switcherShelfCardNonGenieDismissalSettings](self, "switcherShelfCardNonGenieDismissalSettings");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setResponse:", 0.25);

  -[SBMedusaSettings switcherShelfCardNonGenieDismissalSettings](self, "switcherShelfCardNonGenieDismissalSettings");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setDampingRatio:", 0.85);

  -[SBMedusaSettings switcherShelfCardNonGenieDismissalSettings](self, "switcherShelfCardNonGenieDismissalSettings");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v71, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v91.minimum, *(double *)&v91.maximum, *(double *)&v91.preferred);

  -[SBMedusaSettings setSwitcherShelfCardNonGenieResponseIncrementScalar:](self, "setSwitcherShelfCardNonGenieResponseIncrementScalar:", 0.02);
  -[SBMedusaSettings setSwitcherShelfCardNonGenieDismissedScale:](self, "setSwitcherShelfCardNonGenieDismissedScale:", 0.8);
  -[SBMedusaSettings switcherShelfBounceIconSettings](self, "switcherShelfBounceIconSettings");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setDefaultValues");

  -[SBMedusaSettings switcherShelfBounceIconSettings](self, "switcherShelfBounceIconSettings");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setResponse:", 0.5);

  -[SBMedusaSettings switcherShelfBounceIconSettings](self, "switcherShelfBounceIconSettings");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setDampingRatio:", 1.0);

  -[SBMedusaSettings switcherShelfBounceIconSettings](self, "switcherShelfBounceIconSettings");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v75, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v92.minimum, *(double *)&v92.maximum, *(double *)&v92.preferred);

  -[SBMedusaSettings setSwitcherShelfGenieIconBounceDelay:](self, "setSwitcherShelfGenieIconBounceDelay:", 0.33);
}

+ (id)settingsControllerModule
{
  void *v2;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  _QWORD v415[24];
  void *v416;
  void *v417;
  _QWORD v418[2];
  void *v419;
  _QWORD v420[4];
  _QWORD v421[4];
  void *v422;
  _QWORD v423[4];
  _QWORD v424[7];
  _QWORD v425[4];
  _QWORD v426[11];
  _QWORD v427[11];
  _QWORD v428[8];
  _QWORD v429[23];
  _QWORD v430[4];
  _QWORD v431[9];
  _QWORD v432[2];
  _QWORD v433[3];
  _QWORD v434[5];
  _QWORD v435[12];
  _QWORD v436[3];
  _QWORD v437[3];

  v437[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Medusa 1.0"), CFSTR("medusa1oSettings"));
  v343 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D83070];
  v437[0] = v343;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v437, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v3);
  v414 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_switcherShelfLabelLineSpacing);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Shelf Label Line Spacing"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue:maxValue:", 0.0, 5.0);
  v342 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Shelf Split View Icon Inset"), CFSTR("switcherShelfSplitViewIconInset"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "between:and:", -10.0, 50.0);
  v341 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Shelf Icon Hit Test Inset"), CFSTR("switcherShelfIconHitTestInset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "between:and:", 0.0, 50.0);
  v340 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83070];
  v436[0] = v342;
  v436[1] = v341;
  v436[2] = v340;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v436, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:title:", v10, CFSTR("Shelf Layout"));
  v413 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Shelf Genie Rope"), CFSTR("switcherShelfGenieRopeSettings"));
  v412 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Shelf Genie Presentation"), CFSTR("switcherShelfCardGeniePresentationSettings"));
  v411 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Shelf Genie Dismissal"), CFSTR("switcherShelfCardGenieDismissalSettings"));
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Shelf Bounce Icon"), CFSTR("switcherShelfBounceIconSettings"));
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Shelf Genie Icon Bounce Delay"), CFSTR("switcherShelfGenieIconBounceDelay"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "between:and:", 0.0, 2.0);
  v338 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Shelf Genie Y Below Screen"), CFSTR("switcherShelfGenieInitialYIncrementBelowScreen"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "between:and:", 0.0, 200.0);
  v337 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Shelf Gengie Response Increment"), CFSTR("switcherShelfCardGenieResponseIncrementScalar"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "between:and:", 0.0, 1.0);
  v336 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Shelf Genie Dismissed Scale"), CFSTR("switcherShelfCardGenieDismissedScale"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "between:and:", 0.0, 1.0);
  v335 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Shelf Genie Bezier Y Delta"), CFSTR("switcherShelfGenieBezierCurvePointYDeltaFromTarget"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "between:and:", -1000.0, 1000.0);
  v334 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Shelf Genie Bezier X Exponent"), CFSTR("switcherShelfGenieBezierCurveXExponent"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "between:and:", 0.0, 10.0);
  v333 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Shelf Genie Bezier Y Exponent"), CFSTR("switcherShelfGenieBezierCurveYExponent"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "between:and:", 0.0, 10.0);
  v332 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Shelf Genie Bezier Scale Exponent"), CFSTR("switcherShelfGenieBezierCurveScaleExponent"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "between:and:", 0.0, 10.0);
  v331 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0D83070];
  v435[0] = v412;
  v435[1] = v411;
  v435[2] = v410;
  v435[3] = v339;
  v435[4] = v338;
  v435[5] = v337;
  v435[6] = v336;
  v435[7] = v335;
  v435[8] = v334;
  v435[9] = v333;
  v435[10] = v332;
  v435[11] = v331;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v435, 12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sectionWithRows:title:", v20, CFSTR("Shelf Genie"));
  v409 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Shelf Non-Genie Rope"), CFSTR("switcherShelfNonGenieRopeSettings"));
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Shelf Non-Genie Presentation"), CFSTR("switcherShelfCardNonGeniePresentationSettings"));
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Shelf Non-Genie Dismissal"), CFSTR("switcherShelfCardNonGenieDismissalSettings"));
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Shelf Non-Genie Response Increment"), CFSTR("switcherShelfCardNonGenieResponseIncrementScalar"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "between:and:", 0.0, 1.0);
  v327 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Shelf Non-Genie Dismissed Scale"), CFSTR("switcherShelfCardNonGenieDismissedScale"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "between:and:", 0.0, 1.0);
  v326 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0D83070];
  v434[0] = v330;
  v434[1] = v329;
  v434[2] = v328;
  v434[3] = v327;
  v434[4] = v326;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v434, 5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sectionWithRows:title:", v24, CFSTR("Shelf Non-Genie"));
  v408 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Enable Persistent Dock"), CFSTR("persistentDock"));
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Number Of Recents"), CFSTR("numberOfRecents"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "precision:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "between:and:", 0.0, 3.0);
  v324 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Dismiss Hit-Test Top Padding"), CFSTR("dismissHitTestTopPadding"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "precision:", 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "between:and:", 0.0, 50.0);
  v323 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0D83070];
  v433[0] = v325;
  v433[1] = v324;
  v433[2] = v323;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v433, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sectionWithRows:title:", v30, CFSTR("Floating Dock Settings"));
  v407 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9E08], "_moduleWithSectionTitle:", CFSTR("Floating Dock Animation Settings"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "submoduleWithModule:childSettingsKeyPath:", v32, CFSTR("dockAnimationSettings"));
  v406 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9E08], "_moduleWithSectionTitle:", CFSTR("Floating Dock w/ Folder Animation Settings"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "submoduleWithModule:childSettingsKeyPath:", v34, CFSTR("dockWithPresentedFolderAnimationSettings"));
  v405 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0D83070];
  v36 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_narrowEdgeSwipeHitTestWidth);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rowWithTitle:valueKeyPath:", CFSTR("Narrow Edge Swipe Hit Test Width"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "minValue:maxValue:", 0.0, 1000.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v432[0] = v39;
  v40 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_wideEdgeSwipeHitTestWidth);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "rowWithTitle:valueKeyPath:", CFSTR("Wide Edge Swipe Hit Test Width"), v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "minValue:maxValue:", 0.0, 1000.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v432[1] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v432, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sectionWithRows:title:", v44, CFSTR("Floating Application (Slide Over) Settings"));
  v404 = (void *)objc_claimAutoreleasedReturnValue();

  v402 = (void *)MEMORY[0x1E0D83070];
  v45 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_rimShadowOpacity);
  v399 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "rowWithTitle:valueKeyPath:", CFSTR("Rim Shadow Opacity"), v399);
  v396 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v396, "minValue:maxValue:", 0.0, 100.0);
  v393 = (void *)objc_claimAutoreleasedReturnValue();
  v431[0] = v393;
  v46 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_rimShadowRadius);
  v390 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "rowWithTitle:valueKeyPath:", CFSTR("Rim Shadow Radius"), v390);
  v388 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v388, "minValue:maxValue:", 0.0, 100.0);
  v386 = (void *)objc_claimAutoreleasedReturnValue();
  v431[1] = v386;
  v47 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_floatingAppCardScaleWhileTouched);
  v384 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "rowWithTitle:valueKeyPath:", CFSTR("Card Scale When Touched/Dragged"), v384);
  v382 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v382, "minValue:maxValue:", 0.899999976, 1.10000002);
  v380 = (void *)objc_claimAutoreleasedReturnValue();
  v431[2] = v380;
  v48 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_floatingAppCardScaleWhileCursorHovered);
  v378 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "rowWithTitle:valueKeyPath:", CFSTR("Card Scale When Cursor Hovers"), v378);
  v376 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v376, "minValue:maxValue:", 0.899999976, 1.10000002);
  v374 = (void *)objc_claimAutoreleasedReturnValue();
  v431[3] = v374;
  v49 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_floatingAppCardScaleWhileCursorHovered);
  v372 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "rowWithTitle:valueKeyPath:", &stru_1E8EC7EC0, v372);
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v370, "precision:", 4);
  v368 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v368, "between:and:", 0.899999976, 1.10000002);
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  v431[4] = v366;
  v50 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_diffuseShadowRadius);
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "rowWithTitle:valueKeyPath:", CFSTR("Diffuse Shadow Radius"), v364);
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v362, "minValue:maxValue:", 0.0, 1000.0);
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  v431[5] = v360;
  v51 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_diffuseShadowOpacity);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "rowWithTitle:valueKeyPath:", CFSTR("Diffuse Shadow Opacity"), v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "minValue:maxValue:", 0.0, 100.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v431[6] = v54;
  v55 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_diffuseShadowOffsetHorizontal);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "rowWithTitle:valueKeyPath:", CFSTR("Diffuse Shadow Offset Horizontal"), v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "minValue:maxValue:", 0.0, 100.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v431[7] = v58;
  v59 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_diffuseShadowOffsetVertical);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "rowWithTitle:valueKeyPath:", CFSTR("Diffuse Shadow Offset Vertical"), v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "minValue:maxValue:", 0.0, 100.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v431[8] = v62;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v431, 9);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v402, "sectionWithRows:title:", v63, CFSTR("Floating App Shadow Settings"));
  v403 = (void *)objc_claimAutoreleasedReturnValue();

  v400 = (void *)MEMORY[0x1E0D83070];
  v64 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_diffuseShadowRadiusWhileTouched);
  v397 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "rowWithTitle:valueKeyPath:", CFSTR("Diffuse Shadow Radius While Touched"), v397);
  v394 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v394, "minValue:maxValue:", 0.0, 100.0);
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  v430[0] = v391;
  v65 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_diffuseShadowOpacityWhileTouched);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "rowWithTitle:valueKeyPath:", CFSTR("Diffuse Shadow Opacity While Touched"), v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "minValue:maxValue:", 0.0, 1.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v430[1] = v68;
  v69 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_diffuseShadowOffsetHorizontalWhileTouched);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "rowWithTitle:valueKeyPath:", CFSTR("Diffuse Shadow Offset Horizontal While Touched"), v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "minValue:maxValue:", 0.0, 50.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v430[2] = v72;
  v73 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_diffuseShadowOffsetVerticalWhileTouched);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "rowWithTitle:valueKeyPath:", CFSTR("Diffuse Shadow Offset Vertical While Touched"), v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "minValue:maxValue:", 0.0, 50.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v430[3] = v76;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v430, 4);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v400, "sectionWithRows:title:", v77, CFSTR("Floating App Shadow Settings While Touched"));
  v401 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_coronaDiffuseShadowOpacity);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "rowWithTitle:valueKeyPath:", CFSTR("Corona Diffuse Shadow Opacity"), v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "minValue:maxValue:", 0.0, 1.0);
  v398 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_coronaDiffuseShadowOpacityWhileTouched);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "rowWithTitle:valueKeyPath:", CFSTR("Corona Diffuse Shadow Opacity While Touched"), v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "minValue:maxValue:", 0.0, 1.0);
  v395 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Corona Rim Shadow Opacity"), CFSTR("coronaRimShadowOpacity"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "precision:", 2);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "between:and:", 0.0, 100.0);
  v392 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("vibrantColorMatrix m11"), CFSTR("vibrantColorMatrixM11"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "precision:", 3);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "between:and:", -1.0, 1.0);
  v389 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("vibrantColorMatrix m12"), CFSTR("vibrantColorMatrixM12"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "precision:", 3);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "between:and:", -1.0, 1.0);
  v387 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("vibrantColorMatrix m13"), CFSTR("vibrantColorMatrixM13"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "precision:", 3);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "between:and:", -1.0, 1.0);
  v385 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("vibrantColorMatrix m14"), CFSTR("vibrantColorMatrixM14"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "precision:", 3);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "between:and:", -1.0, 1.0);
  v383 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("vibrantColorMatrix m15"), CFSTR("vibrantColorMatrixM15"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "precision:", 3);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "between:and:", -1.0, 1.0);
  v381 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("vibrantColorMatrix m21"), CFSTR("vibrantColorMatrixM21"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "precision:", 3);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "between:and:", -1.0, 1.0);
  v379 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("vibrantColorMatrix m22"), CFSTR("vibrantColorMatrixM22"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "precision:", 3);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "between:and:", -1.0, 1.0);
  v377 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("vibrantColorMatrix m23"), CFSTR("vibrantColorMatrixM23"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "precision:", 3);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "between:and:", -1.0, 1.0);
  v375 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("vibrantColorMatrix m24"), CFSTR("vibrantColorMatrixM24"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "precision:", 3);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "between:and:", -1.0, 1.0);
  v373 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("vibrantColorMatrix m25"), CFSTR("vibrantColorMatrixM25"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "precision:", 3);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "between:and:", -1.0, 1.0);
  v371 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("vibrantColorMatrix m31"), CFSTR("vibrantColorMatrixM31"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "precision:", 3);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "between:and:", -1.0, 1.0);
  v369 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("vibrantColorMatrix m32"), CFSTR("vibrantColorMatrixM32"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "precision:", 3);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "between:and:", -1.0, 1.0);
  v367 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("vibrantColorMatrix m33"), CFSTR("vibrantColorMatrixM33"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "precision:", 3);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "between:and:", -1.0, 1.0);
  v365 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("vibrantColorMatrix m34"), CFSTR("vibrantColorMatrixM34"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "precision:", 3);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "between:and:", -1.0, 1.0);
  v322 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("vibrantColorMatrix m35"), CFSTR("vibrantColorMatrixM35"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "precision:", 3);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "between:and:", -1.0, 1.0);
  v321 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("vibrantColorMatrix m41"), CFSTR("vibrantColorMatrixM41"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "precision:", 3);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "between:and:", -1.0, 1.0);
  v320 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("vibrantColorMatrix m42"), CFSTR("vibrantColorMatrixM42"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "precision:", 3);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "between:and:", -1.0, 1.0);
  v319 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("vibrantColorMatrix m43"), CFSTR("vibrantColorMatrixM43"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "precision:", 3);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "between:and:", -1.0, 1.0);
  v318 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("vibrantColorMatrix m44"), CFSTR("vibrantColorMatrixM44"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "precision:", 3);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "between:and:", -1.0, 1.0);
  v317 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("vibrantColorMatrix m45"), CFSTR("vibrantColorMatrixM45"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "precision:", 3);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "between:and:", -1.0, 1.0);
  v316 = (void *)objc_claimAutoreleasedReturnValue();

  v126 = (void *)MEMORY[0x1E0D83070];
  v429[0] = v398;
  v429[1] = v395;
  v429[2] = v392;
  v429[3] = v389;
  v429[4] = v387;
  v429[5] = v385;
  v429[6] = v383;
  v429[7] = v381;
  v429[8] = v379;
  v429[9] = v377;
  v429[10] = v375;
  v429[11] = v373;
  v429[12] = v371;
  v429[13] = v369;
  v429[14] = v367;
  v429[15] = v365;
  v429[16] = v322;
  v429[17] = v321;
  v429[18] = v320;
  v429[19] = v319;
  v429[20] = v318;
  v429[21] = v317;
  v429[22] = v316;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v429, 23);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "sectionWithRows:title:", v127, CFSTR("Corona Floating Application Shadow Settings"));
  v363 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Window Drag Animation Settings"), CFSTR("windowDragAnimationSettings"));
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Medusa Animation Settings"), CFSTR("medusaAnimationSettings"));
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Resize Animation Settings"), CFSTR("resizeAnimationSettings"));
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Platter Animation Settings"), CFSTR("platterAnimationSettings"));
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Drop Animation Settings"), CFSTR("dropAnimationSettings"));
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Switcher Card Drop Animation Settings"), CFSTR("switcherCardDropAnimationSettings"));
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Top Affordance Expansion Settings"), CFSTR("topAffordanceExpandAnimationSettings"));
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Top Affordance Collapse Settings"), CFSTR("topAffordanceCollapseAnimationSettings"));
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = (void *)MEMORY[0x1E0D83070];
  v428[0] = v315;
  v428[1] = v314;
  v428[2] = v313;
  v428[3] = v312;
  v428[4] = v311;
  v428[5] = v310;
  v428[6] = v309;
  v428[7] = v308;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v428, 8);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "sectionWithRows:title:", v129, CFSTR("Animation Settings"));
  v361 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Blur Fade Animation Duration"), CFSTR("blurFadeAnimationDuration"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "precision:", 2);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "between:and:", 0.0, 100.0);
  v359 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Reduce Motion Blur Fade Animation Duration"), CFSTR("reduceMotionBlurFadeAnimationDuration"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "precision:", 2);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "between:and:", 0.0, 100.0);
  v358 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Drop Animation Unblur Threshold Percentage"), CFSTR("dropAnimationUnblurThresholdPercentage"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "precision:", 2);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "between:and:", 0.0, 1.0);
  v357 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Resize Animation Unblur Threshold Percentage"), CFSTR("resizeAnimationUnblurThresholdPercentage"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "precision:", 2);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "between:and:", 0.0, 1.0);
  v356 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Move Pan Gesture Threshold Percentage"), CFSTR("movePanGestureThresholdPercentage"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "precision:", 2);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "between:and:", 0.0, 1.0);
  v307 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Move Pan Gesture Positive Velocity Threshold"), CFSTR("movePanGesturePositiveVelocityThreshold"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "precision:", 5);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "between:and:", 0.0, 10000.0);
  v306 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Move Pan Gesture Negative Velocity Threshold"), CFSTR("movePanGestureNegativeVelocityThreshold"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "precision:", 5);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "between:and:", -10000.0, 0.0);
  v305 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Top Affordance Hit Test Extend Top"), CFSTR("topAffordanceHitTestExtendTop"));
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "precision:", 0);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "between:and:", 0.0, 100.0);
  v304 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Top Affordance Hit Test Extend Bottom"), CFSTR("topAffordanceHitTestExtendBottom"));
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "precision:", 0);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "between:and:", 0.0, 100.0);
  v303 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Top Affordance Hit Test Extend Left"), CFSTR("topAffordanceHitTestExtendLeft"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "precision:", 0);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "between:and:", 0.0, 100.0);
  v302 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Top Affordance Hit Test Extend Right"), CFSTR("topAffordanceHitTestExtendRight"));
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "precision:", 0);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "between:and:", 0.0, 100.0);
  v301 = (void *)objc_claimAutoreleasedReturnValue();

  v152 = (void *)MEMORY[0x1E0D83070];
  v427[0] = v359;
  v427[1] = v358;
  v427[2] = v357;
  v427[3] = v356;
  v427[4] = v307;
  v427[5] = v306;
  v427[6] = v305;
  v427[7] = v304;
  v427[8] = v303;
  v427[9] = v302;
  v427[10] = v301;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v427, 11);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "sectionWithRows:title:", v153, CFSTR("Medusa User Interaction Settings"));
  v355 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Icon Platter Scale"), CFSTR("iconPlatterScale"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "precision:", 3);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "between:and:", 0.0, 1.0);
  v354 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Window Platter Scale"), CFSTR("windowPlatterScale"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "precision:", 3);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "between:and:", 0.0, 1.0);
  v353 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Window Platter Scale For Replacing Entire Space"), CFSTR("windowPlatterScaleForReplacingEntireSpace"));
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "precision:", 3);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "between:and:", 0.0, 1.0);
  v352 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Card Platter Scale"), CFSTR("cardPlatterScale"));
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "precision:", 3);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "between:and:", 0.0, 1.0);
  v351 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Floating Card Platter Scale"), CFSTR("floatingCardPlatterScale"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "precision:", 3);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "between:and:", 0.0, 1.0);
  v300 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Slide Over Tongue Expanded Scale"), CFSTR("slideOverTongueExpandedScale"));
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "precision:", 3);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "between:and:", 0.0, 1.0);
  v299 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Card Drag Over Split App Layout Scale"), CFSTR("cardPlatterScale"));
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "precision:", 3);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "between:and:", 0.0, 1.0);
  v298 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Reflow Animation Progress for Card Header Fade-In"), CFSTR("reflowAnimationProgressForCardHeaderFadeIn"));
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "precision:", 3);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "between:and:", 0.0, 1.0);
  v297 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Platter Side Activation Padding"), CFSTR("draggingPlatterSideActivationGutterPadding"));
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "precision:", 3);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "between:and:", 0.0, 500.0);
  v296 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Platter Fullscreen Activation Region Width"), CFSTR("draggingPlatterFullscreenActivationRegionWidth"));
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "precision:", 3);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "between:and:", 0.0, 500.0);
  v295 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Platter Fullscreen Activation Region Height"), CFSTR("draggingPlatterFullscreenActivationRegionHeight"));
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "precision:", 3);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "between:and:", 0.0, 500.0);
  v294 = (void *)objc_claimAutoreleasedReturnValue();

  v176 = (void *)MEMORY[0x1E0D83070];
  v426[0] = v354;
  v426[1] = v353;
  v426[2] = v352;
  v426[3] = v351;
  v426[4] = v300;
  v426[5] = v299;
  v426[6] = v298;
  v426[7] = v297;
  v426[8] = v296;
  v426[9] = v295;
  v426[10] = v294;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v426, 11);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "sectionWithRows:title:", v177, CFSTR("Medusa Dragging Platter Sizes"));
  v350 = (void *)objc_claimAutoreleasedReturnValue();

  v348 = (void *)MEMORY[0x1E0D83070];
  v178 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_switcherFullScreenContentPushInScale);
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "rowWithTitle:valueKeyPath:", CFSTR("Full Screen Content Push In Scale"), v346);
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v344, "precision:", 2);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v292, "between:and:", 0.0, 1.0);
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  v425[0] = v290;
  v179 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_switcherCenterWindowContentPushInScale);
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "rowWithTitle:valueKeyPath:", CFSTR("Center Window Content Push In Scale"), v288);
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v286, "precision:", 2);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v284, "between:and:", 0.0, 1.0);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v425[1] = v180;
  v181 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_switcherSlideOverContentPushInScale);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "rowWithTitle:valueKeyPath:", CFSTR("Slide Over Content Push In Scale"), v182);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "precision:", 2);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "between:and:", 0.0, 1.0);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v425[2] = v185;
  v186 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_switcherSlideOverDosidoLayoutOvershootMultiplicationFactor);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "rowWithTitle:valueKeyPath:", CFSTR("Slide Over Dosido Layout Overshoot Multiplication Factor"), v187);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "precision:", 2);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "between:and:", 0.0, 5.0);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v425[3] = v190;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v425, 4);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v348, "sectionWithRows:title:", v191, CFSTR("Medusa Replacement Animations"));
  v349 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Content Drag Commandeer Inset for Universal Control"), CFSTR("contentDraggingCommandeerGutterInsetForUniversalControl"));
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "precision:", 3);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "between:and:", 0.0, 500.0);
  v293 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Content Drag Commandeer Gutter"), CFSTR("contentDraggingCommandeerGutterWidth"));
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "precision:", 3);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "between:and:", 0.0, 500.0);
  v291 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Content Drag Side Activation Gutter"), CFSTR("contentDraggingSideActivationGutterWidth"));
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v196, "precision:", 3);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "between:and:", 0.0, 500.0);
  v289 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Content Drag Floating Activation Gutter"), CFSTR("contentDraggingFloatingActivationGutterWidth"));
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "precision:", 3);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "between:and:", 0.0, 500.0);
  v287 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Window Tear-Off Drag Side Activation Gutter"), CFSTR("windowTearOffDraggingSideActivationGutterWidth"));
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "precision:", 3);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "between:and:", 0.0, 500.0);
  v285 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Window Tear-Off Drag Floating Activation Gutter"), CFSTR("windowTearOffDraggingFloatingActivationGutterWidth"));
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "precision:", 3);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "between:and:", 0.0, 500.0);
  v283 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Window Split View Dismissal Gutter Width"), CFSTR("windowSplitViewDismissalGutterWidth"));
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "precision:", 3);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "between:and:", 0.0, 500.0);
  v282 = (void *)objc_claimAutoreleasedReturnValue();

  v206 = (void *)MEMORY[0x1E0D83070];
  v424[0] = v293;
  v424[1] = v291;
  v424[2] = v289;
  v424[3] = v287;
  v424[4] = v285;
  v424[5] = v283;
  v424[6] = v282;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v424, 7);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "sectionWithRows:title:", v207, CFSTR("Medusa Multi-Window Settings"));
  v347 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Separator Cursor Top Edge Inset"), CFSTR("medusaSeparatorCursorTopEdgeInset"));
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "precision:", 1);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v209, "between:and:", 0.0, 10.0);
  v281 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Separator Cursor Bottom Edge Inset"), CFSTR("medusaSeparatorCursorBottomEdgeInset"));
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "precision:", 1);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "between:and:", 0.0, 10.0);
  v280 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Separator Cursor Left Edge Inset"), CFSTR("medusaSeparatorCursorLeftEdgeInset"));
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "precision:", 1);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "between:and:", 0.0, 10.0);
  v279 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Separator Cursor Right Edge Inset"), CFSTR("medusaSeparatorCursorRightEdgeInset"));
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "precision:", 1);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "between:and:", 0.0, 10.0);
  v278 = (void *)objc_claimAutoreleasedReturnValue();

  v216 = (void *)MEMORY[0x1E0D83070];
  v423[0] = v281;
  v423[1] = v279;
  v423[2] = v280;
  v423[3] = v278;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v423, 4);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v216, "sectionWithRows:title:", v217, CFSTR("Medusa Separator Cursor Insets"));
  v345 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Show Content Drag Exclusion Rects"), CFSTR("showContentDragExclusionRects"));
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  v218 = (void *)MEMORY[0x1E0D83070];
  v422 = v277;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v422, 1);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v218, "sectionWithRows:title:", v219, CFSTR("Drag and Drop Debugging Aids"));
  v276 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Window Dragging Cursor Top Edge Inset"), CFSTR("medusaWindowDraggingCursorTopEdgeInset"));
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v220, "precision:", 1);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v221, "between:and:", 0.0, 10.0);
  v275 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Window Dragging Cursor Bottom Edge Inset"), CFSTR("medusaWindowDraggingCursorBottomEdgeInset"));
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v222, "precision:", 1);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v223, "between:and:", 0.0, 10.0);
  v274 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Window Dragging Cursor Left Edge Inset"), CFSTR("medusaWindowDraggingCursorLeftEdgeInset"));
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "precision:", 1);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v225, "between:and:", 0.0, 10.0);
  v273 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Window Dragging Cursor Right Edge Inset"), CFSTR("medusaWindowDraggingCursorRightEdgeInset"));
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v226, "precision:", 1);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "between:and:", 0.0, 10.0);
  v272 = (void *)objc_claimAutoreleasedReturnValue();

  v228 = (void *)MEMORY[0x1E0D83070];
  v421[0] = v275;
  v421[1] = v273;
  v421[2] = v274;
  v421[3] = v272;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v421, 4);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v228, "sectionWithRows:title:", v229, CFSTR("Medusa Window Dragging Cursor Insets"));
  v271 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("App Inner Corners"), CFSTR("cornerRadiusForInnerCorners"));
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v230, "precision:", 3);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v231, "between:and:", 0.0, 100.0);
  v270 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Medusa Compatibility App Corners"), CFSTR("cornerRadiusForCompatibilityAppOuterCorners"));
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v232, "precision:", 3);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v233, "between:and:", 0.0, 100.0);
  v269 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Floating App Corners"), CFSTR("cornerRadiusForFloatingApps"));
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v234, "precision:", 3);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v235, "between:and:", 0.0, 100.0);
  v268 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Fallback for old apps"), CFSTR("cornerRadiusFallbackForOldApps"));
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v236, "precision:", 3);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v237, "between:and:", 0.0, 100.0);
  v267 = (void *)objc_claimAutoreleasedReturnValue();

  v238 = (void *)MEMORY[0x1E0D83070];
  v420[0] = v270;
  v420[1] = v269;
  v420[2] = v268;
  v420[3] = v267;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v420, 4);
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v238, "sectionWithRows:title:", v239, CFSTR("Medusa Corner Radii"));
  v265 = (void *)objc_claimAutoreleasedReturnValue();

  v240 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_leadingSlideOverRelocationDelay);
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "rowWithTitle:valueKeyPath:", CFSTR("Leading Slide Over Teleportation Delay"), v241);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v242, "minValue:maxValue:", 0.0, 0.5);
  v266 = (void *)objc_claimAutoreleasedReturnValue();

  v243 = (void *)MEMORY[0x1E0D83070];
  v419 = v266;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v419, 1);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v243, "sectionWithRows:title:", v244, CFSTR("Slide Over"));
  v245 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Debug Background Colors"), CFSTR("statusBarDebugBackgroundColorsEnabled"));
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Debug Offset for App Status Bar"), CFSTR("statusBarDebugOffsettingEnabled"));
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  v246 = (void *)MEMORY[0x1E0D83070];
  v418[0] = v264;
  v418[1] = v263;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v418, 2);
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "sectionWithRows:title:", v247, CFSTR("Status Bar Settings"));
  v261 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83008], "rowWithTitle:outletKeyPath:", CFSTR("Kill SpringBoard"), CFSTR("killSpringBoardOutlet"));
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  v248 = (void *)MEMORY[0x1E0D83070];
  v417 = v262;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v417, 1);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v248, "sectionWithRows:", v249);
  v250 = (void *)objc_claimAutoreleasedReturnValue();

  v251 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v251, "rowWithTitle:action:", CFSTR("Restore Defaults"), v252);
  v253 = (void *)objc_claimAutoreleasedReturnValue();

  v254 = (void *)MEMORY[0x1E0D83070];
  v416 = v253;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v416, 1);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v254, "sectionWithRows:", v255);
  v256 = (void *)objc_claimAutoreleasedReturnValue();

  v257 = (void *)MEMORY[0x1E0D83070];
  v415[0] = v413;
  v415[1] = v409;
  v415[2] = v408;
  v415[3] = v414;
  v415[4] = v407;
  v415[5] = v406;
  v415[6] = v405;
  v415[7] = v404;
  v415[8] = v403;
  v415[9] = v401;
  v415[10] = v363;
  v415[11] = v361;
  v415[12] = v355;
  v415[13] = v350;
  v415[14] = v349;
  v415[15] = v347;
  v415[16] = v345;
  v415[17] = v276;
  v415[18] = v271;
  v415[19] = v265;
  v415[20] = v245;
  v415[21] = v261;
  v415[22] = v250;
  v415[23] = v256;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v415, 24);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v257, "moduleWithTitle:contents:", CFSTR("Medusa"), v258);
  v259 = (void *)objc_claimAutoreleasedReturnValue();

  return v259;
}

- (CAColorMatrix)coronaVibrantColorMatrixInput
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;

  v3 = *(double *)&self[11].var4;
  v4 = *(double *)&self[11].var6;
  retstr->var0 = v3;
  retstr->var1 = v4;
  v5 = *(double *)&self[11].var8;
  v6 = *(double *)&self[11].var10;
  retstr->var2 = v5;
  retstr->var3 = v6;
  v7 = *(double *)&self[11].var12;
  v8 = *(double *)&self[11].var14;
  retstr->var4 = v7;
  retstr->var5 = v8;
  v9 = *(double *)&self[11].var16;
  v10 = *(double *)&self[11].var18;
  retstr->var6 = v9;
  retstr->var7 = v10;
  v11 = *(double *)&self[12].var0;
  v12 = *(double *)&self[12].var2;
  retstr->var8 = v11;
  retstr->var9 = v12;
  v13 = *(double *)&self[12].var4;
  v14 = *(double *)&self[12].var6;
  retstr->var10 = v13;
  retstr->var11 = v14;
  v15 = *(double *)&self[12].var8;
  v16 = *(double *)&self[12].var10;
  retstr->var12 = v15;
  retstr->var13 = v16;
  v17 = *(double *)&self[12].var12;
  v18 = *(double *)&self[12].var14;
  retstr->var14 = v17;
  retstr->var15 = v18;
  v19 = *(double *)&self[12].var16;
  v20 = *(double *)&self[12].var18;
  retstr->var16 = v19;
  retstr->var17 = v20;
  v21 = *(double *)&self[13].var0;
  v22 = *(double *)&self[13].var2;
  retstr->var18 = v21;
  retstr->var19 = v22;
  return self;
}

- (double)effectiveBlurFadeAnimationDuration
{
  double result;

  if (UIAccessibilityIsReduceMotionEnabled())
    -[SBMedusaSettings reduceMotionBlurFadeAnimationDuration](self, "reduceMotionBlurFadeAnimationDuration");
  else
    -[SBMedusaSettings blurFadeAnimationDuration](self, "blurFadeAnimationDuration");
  return result;
}

- (UIEdgeInsets)medusaSeparatorCursorEdgeInsets
{
  double medusaSeparatorCursorTopEdgeInset;
  double medusaSeparatorCursorLeftEdgeInset;
  double medusaSeparatorCursorBottomEdgeInset;
  double medusaSeparatorCursorRightEdgeInset;
  UIEdgeInsets result;

  medusaSeparatorCursorTopEdgeInset = self->_medusaSeparatorCursorTopEdgeInset;
  medusaSeparatorCursorLeftEdgeInset = self->_medusaSeparatorCursorLeftEdgeInset;
  medusaSeparatorCursorBottomEdgeInset = self->_medusaSeparatorCursorBottomEdgeInset;
  medusaSeparatorCursorRightEdgeInset = self->_medusaSeparatorCursorRightEdgeInset;
  result.right = medusaSeparatorCursorRightEdgeInset;
  result.bottom = medusaSeparatorCursorBottomEdgeInset;
  result.left = medusaSeparatorCursorLeftEdgeInset;
  result.top = medusaSeparatorCursorTopEdgeInset;
  return result;
}

- (UIEdgeInsets)medusaWindowDraggingCursorEdgeInsets
{
  double medusaWindowDraggingCursorTopEdgeInset;
  double medusaWindowDraggingCursorLeftEdgeInset;
  double medusaWindowDraggingCursorBottomEdgeInset;
  double medusaWindowDraggingCursorRightEdgeInset;
  UIEdgeInsets result;

  medusaWindowDraggingCursorTopEdgeInset = self->_medusaWindowDraggingCursorTopEdgeInset;
  medusaWindowDraggingCursorLeftEdgeInset = self->_medusaWindowDraggingCursorLeftEdgeInset;
  medusaWindowDraggingCursorBottomEdgeInset = self->_medusaWindowDraggingCursorBottomEdgeInset;
  medusaWindowDraggingCursorRightEdgeInset = self->_medusaWindowDraggingCursorRightEdgeInset;
  result.right = medusaWindowDraggingCursorRightEdgeInset;
  result.bottom = medusaWindowDraggingCursorBottomEdgeInset;
  result.left = medusaWindowDraggingCursorLeftEdgeInset;
  result.top = medusaWindowDraggingCursorTopEdgeInset;
  return result;
}

- (void)setMedusa1oSettings:(id)a3
{
  objc_storeStrong((id *)&self->_medusa1oSettings, a3);
}

- (BOOL)persistentDock
{
  return self->_persistentDock;
}

- (void)setPersistentDock:(BOOL)a3
{
  self->_persistentDock = a3;
}

- (double)numberOfRecents
{
  return self->_numberOfRecents;
}

- (void)setNumberOfRecents:(double)a3
{
  self->_numberOfRecents = a3;
}

- (double)dismissHitTestTopPadding
{
  return self->_dismissHitTestTopPadding;
}

- (void)setDismissHitTestTopPadding:(double)a3
{
  self->_dismissHitTestTopPadding = a3;
}

- (SBFFluidBehaviorSettings)dockAnimationSettings
{
  return self->_dockAnimationSettings;
}

- (void)setDockAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_dockAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)dockWithPresentedFolderAnimationSettings
{
  return self->_dockWithPresentedFolderAnimationSettings;
}

- (void)setDockWithPresentedFolderAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_dockWithPresentedFolderAnimationSettings, a3);
}

- (double)narrowEdgeSwipeHitTestWidth
{
  return self->_narrowEdgeSwipeHitTestWidth;
}

- (void)setNarrowEdgeSwipeHitTestWidth:(double)a3
{
  self->_narrowEdgeSwipeHitTestWidth = a3;
}

- (double)wideEdgeSwipeHitTestWidth
{
  return self->_wideEdgeSwipeHitTestWidth;
}

- (void)setWideEdgeSwipeHitTestWidth:(double)a3
{
  self->_wideEdgeSwipeHitTestWidth = a3;
}

- (double)rimShadowOpacity
{
  return self->_rimShadowOpacity;
}

- (void)setRimShadowOpacity:(double)a3
{
  self->_rimShadowOpacity = a3;
}

- (double)rimShadowRadius
{
  return self->_rimShadowRadius;
}

- (void)setRimShadowRadius:(double)a3
{
  self->_rimShadowRadius = a3;
}

- (double)floatingAppCardScaleWhileTouched
{
  return self->_floatingAppCardScaleWhileTouched;
}

- (void)setFloatingAppCardScaleWhileTouched:(double)a3
{
  self->_floatingAppCardScaleWhileTouched = a3;
}

- (double)floatingAppCardScaleWhileCursorHovered
{
  return self->_floatingAppCardScaleWhileCursorHovered;
}

- (void)setFloatingAppCardScaleWhileCursorHovered:(double)a3
{
  self->_floatingAppCardScaleWhileCursorHovered = a3;
}

- (double)diffuseShadowRadius
{
  return self->_diffuseShadowRadius;
}

- (void)setDiffuseShadowRadius:(double)a3
{
  self->_diffuseShadowRadius = a3;
}

- (double)diffuseShadowOpacity
{
  return self->_diffuseShadowOpacity;
}

- (void)setDiffuseShadowOpacity:(double)a3
{
  self->_diffuseShadowOpacity = a3;
}

- (double)diffuseShadowOffsetHorizontal
{
  return self->_diffuseShadowOffsetHorizontal;
}

- (void)setDiffuseShadowOffsetHorizontal:(double)a3
{
  self->_diffuseShadowOffsetHorizontal = a3;
}

- (double)diffuseShadowOffsetVertical
{
  return self->_diffuseShadowOffsetVertical;
}

- (void)setDiffuseShadowOffsetVertical:(double)a3
{
  self->_diffuseShadowOffsetVertical = a3;
}

- (double)diffuseShadowRadiusWhileTouched
{
  return self->_diffuseShadowRadiusWhileTouched;
}

- (void)setDiffuseShadowRadiusWhileTouched:(double)a3
{
  self->_diffuseShadowRadiusWhileTouched = a3;
}

- (double)diffuseShadowOpacityWhileTouched
{
  return self->_diffuseShadowOpacityWhileTouched;
}

- (void)setDiffuseShadowOpacityWhileTouched:(double)a3
{
  self->_diffuseShadowOpacityWhileTouched = a3;
}

- (double)diffuseShadowOffsetHorizontalWhileTouched
{
  return self->_diffuseShadowOffsetHorizontalWhileTouched;
}

- (void)setDiffuseShadowOffsetHorizontalWhileTouched:(double)a3
{
  self->_diffuseShadowOffsetHorizontalWhileTouched = a3;
}

- (double)diffuseShadowOffsetVerticalWhileTouched
{
  return self->_diffuseShadowOffsetVerticalWhileTouched;
}

- (void)setDiffuseShadowOffsetVerticalWhileTouched:(double)a3
{
  self->_diffuseShadowOffsetVerticalWhileTouched = a3;
}

- (double)coronaDiffuseShadowOpacity
{
  return self->_coronaDiffuseShadowOpacity;
}

- (void)setCoronaDiffuseShadowOpacity:(double)a3
{
  self->_coronaDiffuseShadowOpacity = a3;
}

- (double)coronaDiffuseShadowOpacityWhileTouched
{
  return self->_coronaDiffuseShadowOpacityWhileTouched;
}

- (void)setCoronaDiffuseShadowOpacityWhileTouched:(double)a3
{
  self->_coronaDiffuseShadowOpacityWhileTouched = a3;
}

- (double)coronaRimShadowOpacity
{
  return self->_coronaRimShadowOpacity;
}

- (void)setCoronaRimShadowOpacity:(double)a3
{
  self->_coronaRimShadowOpacity = a3;
}

- (double)blurFadeAnimationDuration
{
  return self->_blurFadeAnimationDuration;
}

- (void)setBlurFadeAnimationDuration:(double)a3
{
  self->_blurFadeAnimationDuration = a3;
}

- (double)reduceMotionBlurFadeAnimationDuration
{
  return self->_reduceMotionBlurFadeAnimationDuration;
}

- (void)setReduceMotionBlurFadeAnimationDuration:(double)a3
{
  self->_reduceMotionBlurFadeAnimationDuration = a3;
}

- (SBFFluidBehaviorSettings)windowDragAnimationSettings
{
  return self->_windowDragAnimationSettings;
}

- (void)setWindowDragAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_windowDragAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)medusaAnimationSettings
{
  return self->_medusaAnimationSettings;
}

- (void)setMedusaAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_medusaAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)resizeAnimationSettings
{
  return self->_resizeAnimationSettings;
}

- (void)setResizeAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_resizeAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)platterAnimationSettings
{
  return self->_platterAnimationSettings;
}

- (void)setPlatterAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_platterAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)dropAnimationSettings
{
  return self->_dropAnimationSettings;
}

- (void)setDropAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_dropAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)switcherCardDropAnimationSettings
{
  return self->_switcherCardDropAnimationSettings;
}

- (void)setSwitcherCardDropAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_switcherCardDropAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)topAffordanceExpandAnimationSettings
{
  return self->_topAffordanceExpandAnimationSettings;
}

- (void)setTopAffordanceExpandAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_topAffordanceExpandAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)topAffordanceCollapseAnimationSettings
{
  return self->_topAffordanceCollapseAnimationSettings;
}

- (void)setTopAffordanceCollapseAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_topAffordanceCollapseAnimationSettings, a3);
}

- (double)dropAnimationUnblurThresholdPercentage
{
  return self->_dropAnimationUnblurThresholdPercentage;
}

- (void)setDropAnimationUnblurThresholdPercentage:(double)a3
{
  self->_dropAnimationUnblurThresholdPercentage = a3;
}

- (double)resizeAnimationUnblurThresholdPercentage
{
  return self->_resizeAnimationUnblurThresholdPercentage;
}

- (void)setResizeAnimationUnblurThresholdPercentage:(double)a3
{
  self->_resizeAnimationUnblurThresholdPercentage = a3;
}

- (double)resizeAnimationDismissItemOpacity
{
  return self->_resizeAnimationDismissItemOpacity;
}

- (void)setResizeAnimationDismissItemOpacity:(double)a3
{
  self->_resizeAnimationDismissItemOpacity = a3;
}

- (double)movePanGestureThresholdPercentage
{
  return self->_movePanGestureThresholdPercentage;
}

- (void)setMovePanGestureThresholdPercentage:(double)a3
{
  self->_movePanGestureThresholdPercentage = a3;
}

- (double)movePanGesturePositiveVelocityThreshold
{
  return self->_movePanGesturePositiveVelocityThreshold;
}

- (void)setMovePanGesturePositiveVelocityThreshold:(double)a3
{
  self->_movePanGesturePositiveVelocityThreshold = a3;
}

- (double)movePanGestureNegativeVelocityThreshold
{
  return self->_movePanGestureNegativeVelocityThreshold;
}

- (void)setMovePanGestureNegativeVelocityThreshold:(double)a3
{
  self->_movePanGestureNegativeVelocityThreshold = a3;
}

- (double)replacementDimmingAlpha
{
  return self->_replacementDimmingAlpha;
}

- (void)setReplacementDimmingAlpha:(double)a3
{
  self->_replacementDimmingAlpha = a3;
}

- (double)topAffordanceHitTestExtendTop
{
  return self->_topAffordanceHitTestExtendTop;
}

- (void)setTopAffordanceHitTestExtendTop:(double)a3
{
  self->_topAffordanceHitTestExtendTop = a3;
}

- (double)topAffordanceHitTestExtendBottom
{
  return self->_topAffordanceHitTestExtendBottom;
}

- (void)setTopAffordanceHitTestExtendBottom:(double)a3
{
  self->_topAffordanceHitTestExtendBottom = a3;
}

- (double)topAffordanceHitTestExtendLeft
{
  return self->_topAffordanceHitTestExtendLeft;
}

- (void)setTopAffordanceHitTestExtendLeft:(double)a3
{
  self->_topAffordanceHitTestExtendLeft = a3;
}

- (double)topAffordanceHitTestExtendRight
{
  return self->_topAffordanceHitTestExtendRight;
}

- (void)setTopAffordanceHitTestExtendRight:(double)a3
{
  self->_topAffordanceHitTestExtendRight = a3;
}

- (double)iconPlatterScale
{
  return self->_iconPlatterScale;
}

- (void)setIconPlatterScale:(double)a3
{
  self->_iconPlatterScale = a3;
}

- (double)windowPlatterScale
{
  return self->_windowPlatterScale;
}

- (void)setWindowPlatterScale:(double)a3
{
  self->_windowPlatterScale = a3;
}

- (double)windowPlatterScaleForReplacingEntireSpace
{
  return self->_windowPlatterScaleForReplacingEntireSpace;
}

- (void)setWindowPlatterScaleForReplacingEntireSpace:(double)a3
{
  self->_windowPlatterScaleForReplacingEntireSpace = a3;
}

- (double)cardPlatterScale
{
  return self->_cardPlatterScale;
}

- (void)setCardPlatterScale:(double)a3
{
  self->_cardPlatterScale = a3;
}

- (double)floatingCardPlatterScale
{
  return self->_floatingCardPlatterScale;
}

- (void)setFloatingCardPlatterScale:(double)a3
{
  self->_floatingCardPlatterScale = a3;
}

- (double)slideOverTongueExpandedScale
{
  return self->_slideOverTongueExpandedScale;
}

- (void)setSlideOverTongueExpandedScale:(double)a3
{
  self->_slideOverTongueExpandedScale = a3;
}

- (double)draggingPlatterSideActivationGutterPadding
{
  return self->_draggingPlatterSideActivationGutterPadding;
}

- (void)setDraggingPlatterSideActivationGutterPadding:(double)a3
{
  self->_draggingPlatterSideActivationGutterPadding = a3;
}

- (double)draggingPlatterFullscreenActivationRegionWidth
{
  return self->_draggingPlatterFullscreenActivationRegionWidth;
}

- (void)setDraggingPlatterFullscreenActivationRegionWidth:(double)a3
{
  self->_draggingPlatterFullscreenActivationRegionWidth = a3;
}

- (double)draggingPlatterFullscreenActivationRegionHeight
{
  return self->_draggingPlatterFullscreenActivationRegionHeight;
}

- (void)setDraggingPlatterFullscreenActivationRegionHeight:(double)a3
{
  self->_draggingPlatterFullscreenActivationRegionHeight = a3;
}

- (double)switcherFullScreenContentPushInScale
{
  return self->_switcherFullScreenContentPushInScale;
}

- (void)setSwitcherFullScreenContentPushInScale:(double)a3
{
  self->_switcherFullScreenContentPushInScale = a3;
}

- (double)switcherCenterWindowContentPushInScale
{
  return self->_switcherCenterWindowContentPushInScale;
}

- (void)setSwitcherCenterWindowContentPushInScale:(double)a3
{
  self->_switcherCenterWindowContentPushInScale = a3;
}

- (double)switcherSlideOverContentPushInScale
{
  return self->_switcherSlideOverContentPushInScale;
}

- (void)setSwitcherSlideOverContentPushInScale:(double)a3
{
  self->_switcherSlideOverContentPushInScale = a3;
}

- (double)switcherSlideOverDosidoLayoutOvershootMultiplicationFactor
{
  return self->_switcherSlideOverDosidoLayoutOvershootMultiplicationFactor;
}

- (void)setSwitcherSlideOverDosidoLayoutOvershootMultiplicationFactor:(double)a3
{
  self->_switcherSlideOverDosidoLayoutOvershootMultiplicationFactor = a3;
}

- (double)cardDragOverSplitAppLayoutScale
{
  return self->_cardDragOverSplitAppLayoutScale;
}

- (void)setCardDragOverSplitAppLayoutScale:(double)a3
{
  self->_cardDragOverSplitAppLayoutScale = a3;
}

- (double)reflowAnimationProgressForCardHeaderFadeIn
{
  return self->_reflowAnimationProgressForCardHeaderFadeIn;
}

- (void)setReflowAnimationProgressForCardHeaderFadeIn:(double)a3
{
  self->_reflowAnimationProgressForCardHeaderFadeIn = a3;
}

- (void)setShowContentDragExclusionRects:(BOOL)a3
{
  self->_showContentDragExclusionRects = a3;
}

- (double)contentDraggingCommandeerGutterInsetForUniversalControl
{
  return self->_contentDraggingCommandeerGutterInsetForUniversalControl;
}

- (void)setContentDraggingCommandeerGutterInsetForUniversalControl:(double)a3
{
  self->_contentDraggingCommandeerGutterInsetForUniversalControl = a3;
}

- (double)contentDraggingCommandeerGutterWidth
{
  return self->_contentDraggingCommandeerGutterWidth;
}

- (void)setContentDraggingCommandeerGutterWidth:(double)a3
{
  self->_contentDraggingCommandeerGutterWidth = a3;
}

- (double)contentDraggingSideActivationGutterWidth
{
  return self->_contentDraggingSideActivationGutterWidth;
}

- (void)setContentDraggingSideActivationGutterWidth:(double)a3
{
  self->_contentDraggingSideActivationGutterWidth = a3;
}

- (double)contentDraggingFloatingActivationGutterWidth
{
  return self->_contentDraggingFloatingActivationGutterWidth;
}

- (void)setContentDraggingFloatingActivationGutterWidth:(double)a3
{
  self->_contentDraggingFloatingActivationGutterWidth = a3;
}

- (double)windowTearOffDraggingSideActivationGutterWidth
{
  return self->_windowTearOffDraggingSideActivationGutterWidth;
}

- (void)setWindowTearOffDraggingSideActivationGutterWidth:(double)a3
{
  self->_windowTearOffDraggingSideActivationGutterWidth = a3;
}

- (double)windowTearOffDraggingFloatingActivationGutterWidth
{
  return self->_windowTearOffDraggingFloatingActivationGutterWidth;
}

- (void)setWindowTearOffDraggingFloatingActivationGutterWidth:(double)a3
{
  self->_windowTearOffDraggingFloatingActivationGutterWidth = a3;
}

- (double)windowSplitViewDismissalGutterWidth
{
  return self->_windowSplitViewDismissalGutterWidth;
}

- (void)setWindowSplitViewDismissalGutterWidth:(double)a3
{
  self->_windowSplitViewDismissalGutterWidth = a3;
}

- (PTOutlet)killSpringBoardOutlet
{
  return self->_killSpringBoardOutlet;
}

- (void)setKillSpringBoardOutlet:(id)a3
{
  objc_storeStrong((id *)&self->_killSpringBoardOutlet, a3);
}

- (void)setCornerRadiusForInnerCorners:(double)a3
{
  self->_cornerRadiusForInnerCorners = a3;
}

- (void)setCornerRadiusForCompatibilityAppOuterCorners:(double)a3
{
  self->_cornerRadiusForCompatibilityAppOuterCorners = a3;
}

- (void)setCornerRadiusForFloatingApps:(double)a3
{
  self->_cornerRadiusForFloatingApps = a3;
}

- (double)cornerRadiusFallbackForOldApps
{
  return self->_cornerRadiusFallbackForOldApps;
}

- (void)setCornerRadiusFallbackForOldApps:(double)a3
{
  self->_cornerRadiusFallbackForOldApps = a3;
}

- (void)setStatusBarDebugBackgroundColorsEnabled:(BOOL)a3
{
  self->_statusBarDebugBackgroundColorsEnabled = a3;
}

- (void)setStatusBarDebugOffsettingEnabled:(BOOL)a3
{
  self->_statusBarDebugOffsettingEnabled = a3;
}

- (double)switcherShelfCardScale
{
  return self->_switcherShelfCardScale;
}

- (void)setSwitcherShelfCardScale:(double)a3
{
  self->_switcherShelfCardScale = a3;
}

- (double)switcherShelfCardCornerRadius
{
  return self->_switcherShelfCardCornerRadius;
}

- (void)setSwitcherShelfCardCornerRadius:(double)a3
{
  self->_switcherShelfCardCornerRadius = a3;
}

- (double)switcherShelfCardShadowRadius
{
  return self->_switcherShelfCardShadowRadius;
}

- (void)setSwitcherShelfCardShadowRadius:(double)a3
{
  self->_switcherShelfCardShadowRadius = a3;
}

- (double)switcherShelfCardShadowOffsetY
{
  return self->_switcherShelfCardShadowOffsetY;
}

- (void)setSwitcherShelfCardShadowOffsetY:(double)a3
{
  self->_switcherShelfCardShadowOffsetY = a3;
}

- (double)switcherShelfCardShadowOpacity
{
  return self->_switcherShelfCardShadowOpacity;
}

- (void)setSwitcherShelfCardShadowOpacity:(double)a3
{
  self->_switcherShelfCardShadowOpacity = a3;
}

- (double)switcherShelfLabelLineSpacing
{
  return self->_switcherShelfLabelLineSpacing;
}

- (void)setSwitcherShelfLabelLineSpacing:(double)a3
{
  self->_switcherShelfLabelLineSpacing = a3;
}

- (double)switcherShelfBottomSpacing
{
  return self->_switcherShelfBottomSpacing;
}

- (void)setSwitcherShelfBottomSpacing:(double)a3
{
  self->_switcherShelfBottomSpacing = a3;
}

- (double)switcherShelfSplitViewIconInset
{
  return self->_switcherShelfSplitViewIconInset;
}

- (void)setSwitcherShelfSplitViewIconInset:(double)a3
{
  self->_switcherShelfSplitViewIconInset = a3;
}

- (void)setSwitcherShelfIconHitTestInset:(double)a3
{
  self->_switcherShelfIconHitTestInset = a3;
}

- (double)switcherShelfBackgroundBlurPresentationThreshold
{
  return self->_switcherShelfBackgroundBlurPresentationThreshold;
}

- (void)setSwitcherShelfBackgroundBlurPresentationThreshold:(double)a3
{
  self->_switcherShelfBackgroundBlurPresentationThreshold = a3;
}

- (SBFFluidBehaviorSettings)switcherShelfGenieRopeSettings
{
  return self->_switcherShelfGenieRopeSettings;
}

- (void)setSwitcherShelfGenieRopeSettings:(id)a3
{
  objc_storeStrong((id *)&self->_switcherShelfGenieRopeSettings, a3);
}

- (SBFFluidBehaviorSettings)switcherShelfCardGeniePresentationSettings
{
  return self->_switcherShelfCardGeniePresentationSettings;
}

- (void)setSwitcherShelfCardGeniePresentationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_switcherShelfCardGeniePresentationSettings, a3);
}

- (SBFFluidBehaviorSettings)switcherShelfCardGenieDismissalSettings
{
  return self->_switcherShelfCardGenieDismissalSettings;
}

- (void)setSwitcherShelfCardGenieDismissalSettings:(id)a3
{
  objc_storeStrong((id *)&self->_switcherShelfCardGenieDismissalSettings, a3);
}

- (double)switcherShelfGenieInitialYIncrementBelowScreen
{
  return self->_switcherShelfGenieInitialYIncrementBelowScreen;
}

- (void)setSwitcherShelfGenieInitialYIncrementBelowScreen:(double)a3
{
  self->_switcherShelfGenieInitialYIncrementBelowScreen = a3;
}

- (double)switcherShelfCardGenieResponseIncrementScalar
{
  return self->_switcherShelfCardGenieResponseIncrementScalar;
}

- (void)setSwitcherShelfCardGenieResponseIncrementScalar:(double)a3
{
  self->_switcherShelfCardGenieResponseIncrementScalar = a3;
}

- (double)switcherShelfCardGenieDismissedScale
{
  return self->_switcherShelfCardGenieDismissedScale;
}

- (void)setSwitcherShelfCardGenieDismissedScale:(double)a3
{
  self->_switcherShelfCardGenieDismissedScale = a3;
}

- (double)switcherShelfGenieBezierCurvePointYDeltaFromTarget
{
  return self->_switcherShelfGenieBezierCurvePointYDeltaFromTarget;
}

- (void)setSwitcherShelfGenieBezierCurvePointYDeltaFromTarget:(double)a3
{
  self->_switcherShelfGenieBezierCurvePointYDeltaFromTarget = a3;
}

- (double)switcherShelfGenieBezierCurveXExponent
{
  return self->_switcherShelfGenieBezierCurveXExponent;
}

- (void)setSwitcherShelfGenieBezierCurveXExponent:(double)a3
{
  self->_switcherShelfGenieBezierCurveXExponent = a3;
}

- (double)switcherShelfGenieBezierCurveYExponent
{
  return self->_switcherShelfGenieBezierCurveYExponent;
}

- (void)setSwitcherShelfGenieBezierCurveYExponent:(double)a3
{
  self->_switcherShelfGenieBezierCurveYExponent = a3;
}

- (double)switcherShelfGenieBezierCurveScaleExponent
{
  return self->_switcherShelfGenieBezierCurveScaleExponent;
}

- (void)setSwitcherShelfGenieBezierCurveScaleExponent:(double)a3
{
  self->_switcherShelfGenieBezierCurveScaleExponent = a3;
}

- (SBFFluidBehaviorSettings)switcherShelfBounceIconSettings
{
  return self->_switcherShelfBounceIconSettings;
}

- (void)setSwitcherShelfBounceIconSettings:(id)a3
{
  objc_storeStrong((id *)&self->_switcherShelfBounceIconSettings, a3);
}

- (double)switcherShelfGenieIconBounceDelay
{
  return self->_switcherShelfGenieIconBounceDelay;
}

- (void)setSwitcherShelfGenieIconBounceDelay:(double)a3
{
  self->_switcherShelfGenieIconBounceDelay = a3;
}

- (SBFFluidBehaviorSettings)switcherShelfNonGenieRopeSettings
{
  return self->_switcherShelfNonGenieRopeSettings;
}

- (void)setSwitcherShelfNonGenieRopeSettings:(id)a3
{
  objc_storeStrong((id *)&self->_switcherShelfNonGenieRopeSettings, a3);
}

- (SBFFluidBehaviorSettings)switcherShelfCardNonGeniePresentationSettings
{
  return self->_switcherShelfCardNonGeniePresentationSettings;
}

- (void)setSwitcherShelfCardNonGeniePresentationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_switcherShelfCardNonGeniePresentationSettings, a3);
}

- (SBFFluidBehaviorSettings)switcherShelfCardNonGenieDismissalSettings
{
  return self->_switcherShelfCardNonGenieDismissalSettings;
}

- (void)setSwitcherShelfCardNonGenieDismissalSettings:(id)a3
{
  objc_storeStrong((id *)&self->_switcherShelfCardNonGenieDismissalSettings, a3);
}

- (double)switcherShelfCardNonGenieResponseIncrementScalar
{
  return self->_switcherShelfCardNonGenieResponseIncrementScalar;
}

- (void)setSwitcherShelfCardNonGenieResponseIncrementScalar:(double)a3
{
  self->_switcherShelfCardNonGenieResponseIncrementScalar = a3;
}

- (double)switcherShelfCardNonGenieDismissedScale
{
  return self->_switcherShelfCardNonGenieDismissedScale;
}

- (void)setSwitcherShelfCardNonGenieDismissedScale:(double)a3
{
  self->_switcherShelfCardNonGenieDismissedScale = a3;
}

- (double)switcherCenterWindowShadowRadius
{
  return self->_switcherCenterWindowShadowRadius;
}

- (void)setSwitcherCenterWindowShadowRadius:(double)a3
{
  self->_switcherCenterWindowShadowRadius = a3;
}

- (double)switcherCenterWindowShadowOffsetY
{
  return self->_switcherCenterWindowShadowOffsetY;
}

- (void)setSwitcherCenterWindowShadowOffsetY:(double)a3
{
  self->_switcherCenterWindowShadowOffsetY = a3;
}

- (double)switcherCenterWindowShadowOpacity
{
  return self->_switcherCenterWindowShadowOpacity;
}

- (void)setSwitcherCenterWindowShadowOpacity:(double)a3
{
  self->_switcherCenterWindowShadowOpacity = a3;
}

- (double)switcherPeekingWindowShadowRadius
{
  return self->_switcherPeekingWindowShadowRadius;
}

- (void)setSwitcherPeekingWindowShadowRadius:(double)a3
{
  self->_switcherPeekingWindowShadowRadius = a3;
}

- (double)switcherPeekingWindowShadowOffsetY
{
  return self->_switcherPeekingWindowShadowOffsetY;
}

- (void)setSwitcherPeekingWindowShadowOffsetY:(double)a3
{
  self->_switcherPeekingWindowShadowOffsetY = a3;
}

- (double)switcherPeekingWindowShadowOpacity
{
  return self->_switcherPeekingWindowShadowOpacity;
}

- (void)setSwitcherPeekingWindowShadowOpacity:(double)a3
{
  self->_switcherPeekingWindowShadowOpacity = a3;
}

- (double)leadingSlideOverRelocationDelay
{
  return self->_leadingSlideOverRelocationDelay;
}

- (void)setLeadingSlideOverRelocationDelay:(double)a3
{
  self->_leadingSlideOverRelocationDelay = a3;
}

- (double)defaultDimmingOpacity
{
  return self->_defaultDimmingOpacity;
}

- (void)setDefaultDimmingOpacity:(double)a3
{
  self->_defaultDimmingOpacity = a3;
}

- (double)vibrantColorMatrixM11
{
  return self->_vibrantColorMatrixM11;
}

- (void)setVibrantColorMatrixM11:(double)a3
{
  self->_vibrantColorMatrixM11 = a3;
}

- (double)vibrantColorMatrixM12
{
  return self->_vibrantColorMatrixM12;
}

- (void)setVibrantColorMatrixM12:(double)a3
{
  self->_vibrantColorMatrixM12 = a3;
}

- (double)vibrantColorMatrixM13
{
  return self->_vibrantColorMatrixM13;
}

- (void)setVibrantColorMatrixM13:(double)a3
{
  self->_vibrantColorMatrixM13 = a3;
}

- (double)vibrantColorMatrixM14
{
  return self->_vibrantColorMatrixM14;
}

- (void)setVibrantColorMatrixM14:(double)a3
{
  self->_vibrantColorMatrixM14 = a3;
}

- (double)vibrantColorMatrixM15
{
  return self->_vibrantColorMatrixM15;
}

- (void)setVibrantColorMatrixM15:(double)a3
{
  self->_vibrantColorMatrixM15 = a3;
}

- (double)vibrantColorMatrixM21
{
  return self->_vibrantColorMatrixM21;
}

- (void)setVibrantColorMatrixM21:(double)a3
{
  self->_vibrantColorMatrixM21 = a3;
}

- (double)vibrantColorMatrixM22
{
  return self->_vibrantColorMatrixM22;
}

- (void)setVibrantColorMatrixM22:(double)a3
{
  self->_vibrantColorMatrixM22 = a3;
}

- (double)vibrantColorMatrixM23
{
  return self->_vibrantColorMatrixM23;
}

- (void)setVibrantColorMatrixM23:(double)a3
{
  self->_vibrantColorMatrixM23 = a3;
}

- (double)vibrantColorMatrixM24
{
  return self->_vibrantColorMatrixM24;
}

- (void)setVibrantColorMatrixM24:(double)a3
{
  self->_vibrantColorMatrixM24 = a3;
}

- (double)vibrantColorMatrixM25
{
  return self->_vibrantColorMatrixM25;
}

- (void)setVibrantColorMatrixM25:(double)a3
{
  self->_vibrantColorMatrixM25 = a3;
}

- (double)vibrantColorMatrixM31
{
  return self->_vibrantColorMatrixM31;
}

- (void)setVibrantColorMatrixM31:(double)a3
{
  self->_vibrantColorMatrixM31 = a3;
}

- (double)vibrantColorMatrixM32
{
  return self->_vibrantColorMatrixM32;
}

- (void)setVibrantColorMatrixM32:(double)a3
{
  self->_vibrantColorMatrixM32 = a3;
}

- (double)vibrantColorMatrixM33
{
  return self->_vibrantColorMatrixM33;
}

- (void)setVibrantColorMatrixM33:(double)a3
{
  self->_vibrantColorMatrixM33 = a3;
}

- (double)vibrantColorMatrixM34
{
  return self->_vibrantColorMatrixM34;
}

- (void)setVibrantColorMatrixM34:(double)a3
{
  self->_vibrantColorMatrixM34 = a3;
}

- (double)vibrantColorMatrixM35
{
  return self->_vibrantColorMatrixM35;
}

- (void)setVibrantColorMatrixM35:(double)a3
{
  self->_vibrantColorMatrixM35 = a3;
}

- (double)vibrantColorMatrixM41
{
  return self->_vibrantColorMatrixM41;
}

- (void)setVibrantColorMatrixM41:(double)a3
{
  self->_vibrantColorMatrixM41 = a3;
}

- (double)vibrantColorMatrixM42
{
  return self->_vibrantColorMatrixM42;
}

- (void)setVibrantColorMatrixM42:(double)a3
{
  self->_vibrantColorMatrixM42 = a3;
}

- (double)vibrantColorMatrixM43
{
  return self->_vibrantColorMatrixM43;
}

- (void)setVibrantColorMatrixM43:(double)a3
{
  self->_vibrantColorMatrixM43 = a3;
}

- (double)vibrantColorMatrixM44
{
  return self->_vibrantColorMatrixM44;
}

- (void)setVibrantColorMatrixM44:(double)a3
{
  self->_vibrantColorMatrixM44 = a3;
}

- (double)vibrantColorMatrixM45
{
  return self->_vibrantColorMatrixM45;
}

- (void)setVibrantColorMatrixM45:(double)a3
{
  self->_vibrantColorMatrixM45 = a3;
}

- (double)medusaSeparatorCursorTopEdgeInset
{
  return self->_medusaSeparatorCursorTopEdgeInset;
}

- (void)setMedusaSeparatorCursorTopEdgeInset:(double)a3
{
  self->_medusaSeparatorCursorTopEdgeInset = a3;
}

- (double)medusaSeparatorCursorBottomEdgeInset
{
  return self->_medusaSeparatorCursorBottomEdgeInset;
}

- (void)setMedusaSeparatorCursorBottomEdgeInset:(double)a3
{
  self->_medusaSeparatorCursorBottomEdgeInset = a3;
}

- (double)medusaSeparatorCursorLeftEdgeInset
{
  return self->_medusaSeparatorCursorLeftEdgeInset;
}

- (void)setMedusaSeparatorCursorLeftEdgeInset:(double)a3
{
  self->_medusaSeparatorCursorLeftEdgeInset = a3;
}

- (double)medusaSeparatorCursorRightEdgeInset
{
  return self->_medusaSeparatorCursorRightEdgeInset;
}

- (void)setMedusaSeparatorCursorRightEdgeInset:(double)a3
{
  self->_medusaSeparatorCursorRightEdgeInset = a3;
}

- (double)medusaWindowDraggingCursorTopEdgeInset
{
  return self->_medusaWindowDraggingCursorTopEdgeInset;
}

- (void)setMedusaWindowDraggingCursorTopEdgeInset:(double)a3
{
  self->_medusaWindowDraggingCursorTopEdgeInset = a3;
}

- (double)medusaWindowDraggingCursorBottomEdgeInset
{
  return self->_medusaWindowDraggingCursorBottomEdgeInset;
}

- (void)setMedusaWindowDraggingCursorBottomEdgeInset:(double)a3
{
  self->_medusaWindowDraggingCursorBottomEdgeInset = a3;
}

- (double)medusaWindowDraggingCursorLeftEdgeInset
{
  return self->_medusaWindowDraggingCursorLeftEdgeInset;
}

- (void)setMedusaWindowDraggingCursorLeftEdgeInset:(double)a3
{
  self->_medusaWindowDraggingCursorLeftEdgeInset = a3;
}

- (double)medusaWindowDraggingCursorRightEdgeInset
{
  return self->_medusaWindowDraggingCursorRightEdgeInset;
}

- (void)setMedusaWindowDraggingCursorRightEdgeInset:(double)a3
{
  self->_medusaWindowDraggingCursorRightEdgeInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switcherShelfCardNonGenieDismissalSettings, 0);
  objc_storeStrong((id *)&self->_switcherShelfCardNonGeniePresentationSettings, 0);
  objc_storeStrong((id *)&self->_switcherShelfNonGenieRopeSettings, 0);
  objc_storeStrong((id *)&self->_switcherShelfBounceIconSettings, 0);
  objc_storeStrong((id *)&self->_switcherShelfCardGenieDismissalSettings, 0);
  objc_storeStrong((id *)&self->_switcherShelfCardGeniePresentationSettings, 0);
  objc_storeStrong((id *)&self->_switcherShelfGenieRopeSettings, 0);
  objc_storeStrong((id *)&self->_killSpringBoardOutlet, 0);
  objc_storeStrong((id *)&self->_topAffordanceCollapseAnimationSettings, 0);
  objc_storeStrong((id *)&self->_topAffordanceExpandAnimationSettings, 0);
  objc_storeStrong((id *)&self->_switcherCardDropAnimationSettings, 0);
  objc_storeStrong((id *)&self->_dropAnimationSettings, 0);
  objc_storeStrong((id *)&self->_platterAnimationSettings, 0);
  objc_storeStrong((id *)&self->_resizeAnimationSettings, 0);
  objc_storeStrong((id *)&self->_medusaAnimationSettings, 0);
  objc_storeStrong((id *)&self->_windowDragAnimationSettings, 0);
  objc_storeStrong((id *)&self->_dockWithPresentedFolderAnimationSettings, 0);
  objc_storeStrong((id *)&self->_dockAnimationSettings, 0);
  objc_storeStrong((id *)&self->_medusa1oSettings, 0);
}

@end
