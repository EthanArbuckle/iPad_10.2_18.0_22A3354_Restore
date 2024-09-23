@implementation SBFluidSwitcherAnimationSettings

- (SBFFluidBehaviorSettings)layoutSettings
{
  return self->_layoutSettings;
}

- (SBFFluidBehaviorSettings)opacitySettings
{
  return self->_opacitySettings;
}

- (SBFFluidBehaviorSettings)homeGestureEdgeRowZoomUpSettings
{
  return self->_homeGestureEdgeRowZoomUpSettings;
}

- (SBFFluidBehaviorSettings)homeGestureCenterRowZoomUpSettings
{
  return self->_homeGestureCenterRowZoomUpSettings;
}

- (SBFFluidBehaviorSettings)homeScreenScaleSettings
{
  return self->_homeScreenScaleSettings;
}

- (SBFFluidBehaviorSettings)wallpaperScaleSettings
{
  return self->_wallpaperScaleSettings;
}

- (SBFFluidBehaviorSettings)backdropBlurSettings
{
  return self->_backdropBlurSettings;
}

- (SBFFluidBehaviorSettings)homeScreenOpacitySettings
{
  return self->_homeScreenOpacitySettings;
}

- (double)crossblurDosidoSmallScale
{
  return self->_crossblurDosidoSmallScale;
}

- (SBFFluidBehaviorSettings)statusBarFadeInSettings
{
  return self->_statusBarFadeInSettings;
}

- (SBFFluidBehaviorSettings)statusBarFadeOutSettings
{
  return self->_statusBarFadeOutSettings;
}

- (double)wallpaperScaleInApplication
{
  return self->_wallpaperScaleInApplication;
}

- (double)dimmingAlphaInApplication
{
  return self->_dimmingAlphaInApplication;
}

- (SBFFluidBehaviorSettings)crossblurDosidoSettings
{
  return self->_crossblurDosidoSettings;
}

- (double)crossblurRasterizationScale
{
  return self->_crossblurRasterizationScale;
}

- (double)crossblurDosidoBlurRadius
{
  return self->_crossblurDosidoBlurRadius;
}

- (double)homeScreenScaleInApplication
{
  return self->_homeScreenScaleInApplication;
}

- (double)homeScreenScaleForMode:(int64_t)a3
{
  double result;

  if (a3 == 3)
  {
    -[SBFluidSwitcherAnimationSettings homeScreenScaleInApplication](self, "homeScreenScaleInApplication");
  }
  else if (a3 == 2 && !UIAccessibilityIsReduceTransparencyEnabled())
  {
    -[SBFluidSwitcherAnimationSettings homeScreenScaleInSwitcher](self, "homeScreenScaleInSwitcher");
  }
  else
  {
    return 1.0;
  }
  return result;
}

- (double)homeScreenScaleInSwitcher
{
  return self->_homeScreenScaleInSwitcher;
}

- (double)homeScreenOpacityInApplication
{
  return self->_homeScreenOpacityInApplication;
}

- (double)disableAsyncRenderingTransitionPercentage
{
  return self->_disableAsyncRenderingTransitionPercentage;
}

- (double)disallowAcceleratedHomeButtonPressTransitionPercentage
{
  return self->_disallowAcceleratedHomeButtonPressTransitionPercentage;
}

- (double)homeScreenCenterZoomInitialBlur
{
  return self->_homeScreenCenterZoomInitialBlur;
}

- (double)homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete
{
  return self->_homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete;
}

- (double)homeScreenBlurInApplication
{
  return self->_homeScreenBlurInApplication;
}

- (double)homeScreenBlurProgressForMode:(int64_t)a3
{
  double result;

  if (a3 == 3)
  {
    -[SBFluidSwitcherAnimationSettings homeScreenBlurInApplication](self, "homeScreenBlurInApplication");
  }
  else if (a3 == 2)
  {
    if (SBReduceMotion())
      -[SBFluidSwitcherAnimationSettings homeScreenBlurInSwitcherReduceMotionEnabled](self, "homeScreenBlurInSwitcherReduceMotionEnabled");
    else
      -[SBFluidSwitcherAnimationSettings homeScreenBlurInSwitcher](self, "homeScreenBlurInSwitcher");
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)homeScreenCenterZoomInitialOpacity
{
  return self->_homeScreenCenterZoomInitialOpacity;
}

- (double)homeScreenCenterZoomInitialScale
{
  return self->_homeScreenCenterZoomInitialScale;
}

- (void)setDefaultValues
{
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
  uint64_t v35;
  int v36;
  double v37;
  void *v38;
  uint64_t v39;
  double v40;
  void *v41;
  void *v42;
  int v43;
  double v44;
  void *v45;
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
  uint64_t v108;
  double v109;
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
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t i;
  uint64_t v130;
  void *v131;
  void *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  int v144;
  double v145;
  void *v146;
  uint64_t v147;
  double v148;
  int v149;
  double v150;
  void *v151;
  uint64_t v152;
  double v153;
  void *v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  _BYTE v159[128];
  uint64_t v160;
  CAFrameRateRange v161;
  CAFrameRateRange v162;
  CAFrameRateRange v163;
  CAFrameRateRange v164;
  CAFrameRateRange v165;
  CAFrameRateRange v166;
  CAFrameRateRange v167;
  CAFrameRateRange v168;
  CAFrameRateRange v169;
  CAFrameRateRange v170;
  CAFrameRateRange v171;
  CAFrameRateRange v172;
  CAFrameRateRange v173;
  CAFrameRateRange v174;
  CAFrameRateRange v175;
  CAFrameRateRange v176;
  CAFrameRateRange v177;
  CAFrameRateRange v178;
  CAFrameRateRange v179;
  CAFrameRateRange v180;

  v160 = *MEMORY[0x1E0C80C00];
  -[SBFluidSwitcherAnimationSettings layoutSettings](self, "layoutSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValues");

  -[SBFluidSwitcherAnimationSettings layoutSettings](self, "layoutSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v4, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v161.minimum, *(double *)&v161.maximum, *(double *)&v161.preferred);

  -[SBFluidSwitcherAnimationSettings zoomUpSettings](self, "zoomUpSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDefaultCriticallyDampedValues");

  -[SBFluidSwitcherAnimationSettings zoomUpSettings](self, "zoomUpSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v6, "setFrameRateRange:highFrameRateReason:", 1114114, *(double *)&v162.minimum, *(double *)&v162.maximum, *(double *)&v162.preferred);

  -[SBFluidSwitcherAnimationSettings iconZoomDownSettings](self, "iconZoomDownSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultCriticallyDampedValues");

  -[SBFluidSwitcherAnimationSettings centerZoomSettings](self, "centerZoomSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDefaultCriticallyDampedValues");

  -[SBFluidSwitcherAnimationSettings centerZoomSettings](self, "centerZoomSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v163 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v9, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v163.minimum, *(double *)&v163.maximum, *(double *)&v163.preferred);

  -[SBFluidSwitcherAnimationSettings slideOverSettings](self, "slideOverSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDefaultCriticallyDampedValues");

  -[SBFluidSwitcherAnimationSettings slideOverSettings](self, "slideOverSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v164.minimum, *(double *)&v164.maximum, *(double *)&v164.preferred);

  -[SBFluidSwitcherAnimationSettings toggleAppSwitcherSettings](self, "toggleAppSwitcherSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDefaultCriticallyDampedValues");

  -[SBFluidSwitcherAnimationSettings toggleAppSwitcherSettings](self, "toggleAppSwitcherSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v13, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v165.minimum, *(double *)&v165.maximum, *(double *)&v165.preferred);

  -[SBFluidSwitcherAnimationSettings launchAppFromSwitcherSettings](self, "launchAppFromSwitcherSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDefaultCriticallyDampedValues");

  -[SBFluidSwitcherAnimationSettings launchAppFromSwitcherSettings](self, "launchAppFromSwitcherSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v15, "setFrameRateRange:highFrameRateReason:", 1114114, *(double *)&v166.minimum, *(double *)&v166.maximum, *(double *)&v166.preferred);

  -[SBFluidSwitcherAnimationSettings continuityBannerSlideUpSettings](self, "continuityBannerSlideUpSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDampingRatio:", 1.0);

  -[SBFluidSwitcherAnimationSettings continuityBannerSlideUpSettings](self, "continuityBannerSlideUpSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setResponse:", 0.4);

  -[SBFluidSwitcherAnimationSettings continuityBannerSlideUpSettings](self, "continuityBannerSlideUpSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v18, "setFrameRateRange:highFrameRateReason:", 1114114, *(double *)&v167.minimum, *(double *)&v167.maximum, *(double *)&v167.preferred);

  -[SBFluidSwitcherAnimationSettings stackedSwitcherTrackingSettings](self, "stackedSwitcherTrackingSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTrackingDampingRatio:");

  -[SBFluidSwitcherAnimationSettings stackedSwitcherTrackingSettings](self, "stackedSwitcherTrackingSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTrackingResponse:", 0.14);

  -[SBFluidSwitcherAnimationSettings stackedSwitcherTrackingSettings](self, "stackedSwitcherTrackingSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v21, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v168.minimum, *(double *)&v168.maximum, *(double *)&v168.preferred);

  -[SBFluidSwitcherAnimationSettings _setTopAffordanceTransitionDefaultValues](self, "_setTopAffordanceTransitionDefaultValues");
  -[SBFluidSwitcherAnimationSettings _setEntityPresentationDefaultValues](self, "_setEntityPresentationDefaultValues");
  -[SBFluidSwitcherAnimationSettings _setKeyboardShortcutDefaultValues](self, "_setKeyboardShortcutDefaultValues");
  -[SBFluidSwitcherAnimationSettings _setHomeGestureAnimationDefaultValues](self, "_setHomeGestureAnimationDefaultValues");
  -[SBFluidSwitcherAnimationSettings dosidoSettings](self, "dosidoSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDampingRatio:", 1.0);

  -[SBFluidSwitcherAnimationSettings dosidoSettings](self, "dosidoSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setResponse:", 0.442);

  -[SBFluidSwitcherAnimationSettings dosidoSettings](self, "dosidoSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v24, "setFrameRateRange:highFrameRateReason:", 1114116, *(double *)&v169.minimum, *(double *)&v169.maximum, *(double *)&v169.preferred);

  -[SBFluidSwitcherAnimationSettings dosidoScaleDownSettings](self, "dosidoScaleDownSettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDampingRatio:", 1.0);

  -[SBFluidSwitcherAnimationSettings dosidoScaleDownSettings](self, "dosidoScaleDownSettings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setResponse:", 0.331);

  -[SBFluidSwitcherAnimationSettings dosidoScaleDownSettings](self, "dosidoScaleDownSettings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v27, "setFrameRateRange:highFrameRateReason:", 1114116, *(double *)&v170.minimum, *(double *)&v170.maximum, *(double *)&v170.preferred);

  -[SBFluidSwitcherAnimationSettings dosidoScaleUpSettings](self, "dosidoScaleUpSettings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setDampingRatio:", 1.0);

  -[SBFluidSwitcherAnimationSettings dosidoScaleUpSettings](self, "dosidoScaleUpSettings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setResponse:", 0.491);

  -[SBFluidSwitcherAnimationSettings dosidoScaleUpSettings](self, "dosidoScaleUpSettings");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v30, "setFrameRateRange:highFrameRateReason:", 1114116, *(double *)&v171.minimum, *(double *)&v171.maximum, *(double *)&v171.preferred);

  -[SBFluidSwitcherAnimationSettings setDosidoScale:](self, "setDosidoScale:", 0.8);
  -[SBFluidSwitcherAnimationSettings setDosidoScaleUpDelay:](self, "setDosidoScaleUpDelay:", 0.137);
  -[SBFluidSwitcherAnimationSettings crossblurDosidoSettings](self, "crossblurDosidoSettings");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setDampingRatio:", 1.0);

  -[SBFluidSwitcherAnimationSettings crossblurDosidoSettings](self, "crossblurDosidoSettings");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setResponse:", 0.442);

  -[SBFluidSwitcherAnimationSettings crossblurDosidoSettings](self, "crossblurDosidoSettings");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v33, "setFrameRateRange:highFrameRateReason:", 1114116, *(double *)&v172.minimum, *(double *)&v172.maximum, *(double *)&v172.preferred);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "userInterfaceIdiom");

  -[SBFluidSwitcherAnimationSettings setCrossblurDosidoSmallScale:](self, "setCrossblurDosidoSmallScale:", dbl_1D0E88400[(v35 & 0xFFFFFFFFFFFFFFFBLL) == 1]);
  if (__sb__runningInSpringBoard())
  {
    v36 = SBFEffectiveDeviceClass();
    v37 = 0.92;
    if (v36 != 2)
      v37 = 0.5;
    -[SBFluidSwitcherAnimationSettings setCrossblurDosidoCenterZoomUpSmallScale:](self, "setCrossblurDosidoCenterZoomUpSmallScale:", v37);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "userInterfaceIdiom");
    v40 = 0.92;
    if (v39 != 1)
      v40 = 0.5;
    -[SBFluidSwitcherAnimationSettings setCrossblurDosidoCenterZoomUpSmallScale:](self, "setCrossblurDosidoCenterZoomUpSmallScale:", v40);

  }
  -[SBFluidSwitcherAnimationSettings setCrossblurDosidoLargeScale:](self, "setCrossblurDosidoLargeScale:");
  -[SBFluidSwitcherAnimationSettings setCrossblurDosidoBlurRadius:](self, "setCrossblurDosidoBlurRadius:", 6.0);
  -[SBFluidSwitcherAnimationSettings setCrossblurRasterizationScale:](self, "setCrossblurRasterizationScale:", 0.8);
  -[SBFluidSwitcherAnimationSettings crossfadeDosidoSettings](self, "crossfadeDosidoSettings");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setDampingRatio:", 1.0);

  -[SBFluidSwitcherAnimationSettings crossfadeDosidoSettings](self, "crossfadeDosidoSettings");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setResponse:", 0.24);

  -[SBFluidSwitcherAnimationSettings setAppToSwitcherTransitionMinCardScaleFactor:](self, "setAppToSwitcherTransitionMinCardScaleFactor:", 0.97);
  if (__sb__runningInSpringBoard())
  {
    v43 = SBFEffectiveDeviceClass();
    v44 = 0.6;
    if (v43 == 2)
      v44 = 1.0;
    -[SBFluidSwitcherAnimationSettings setDisableAsyncRenderingTransitionPercentage:](self, "setDisableAsyncRenderingTransitionPercentage:", v44);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "userInterfaceIdiom");
    v47 = 0.6;
    if (v46 == 1)
      v47 = 1.0;
    -[SBFluidSwitcherAnimationSettings setDisableAsyncRenderingTransitionPercentage:](self, "setDisableAsyncRenderingTransitionPercentage:", v47);

  }
  -[SBFluidSwitcherAnimationSettings setDisallowAcceleratedHomeButtonPressTransitionPercentage:](self, "setDisallowAcceleratedHomeButtonPressTransitionPercentage:", 0.6);
  -[SBFluidSwitcherAnimationSettings setDisableTapDuringMorphFromInAppViewTransitionDelay:](self, "setDisableTapDuringMorphFromInAppViewTransitionDelay:", 0.25);
  -[SBFluidSwitcherAnimationSettings setDockHurdlingIconZoomInitialVelocity:](self, "setDockHurdlingIconZoomInitialVelocity:", -4500.0);
  -[SBFluidSwitcherAnimationSettings setDockHurdlingIconZoomDockToBackTiming:](self, "setDockHurdlingIconZoomDockToBackTiming:", 0.07);
  -[SBFluidSwitcherAnimationSettings setDockHurdlingIconZoomDockToFrontTiming:](self, "setDockHurdlingIconZoomDockToFrontTiming:", 0.215);
  -[SBFluidSwitcherAnimationSettings backdropBlurSettings](self, "backdropBlurSettings");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setBehaviorType:", 1);

  -[SBFluidSwitcherAnimationSettings backdropBlurSettings](self, "backdropBlurSettings");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setDampingRatio:", 0.776);

  -[SBFluidSwitcherAnimationSettings backdropBlurSettings](self, "backdropBlurSettings");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setResponse:", 0.574);

  -[SBFluidSwitcherAnimationSettings backdropBlurSettings](self, "backdropBlurSettings");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setRetargetImpulse:", 0.006);

  -[SBFluidSwitcherAnimationSettings homeScreenOpacitySettings](self, "homeScreenOpacitySettings");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setBehaviorType:", 1);

  -[SBFluidSwitcherAnimationSettings homeScreenOpacitySettings](self, "homeScreenOpacitySettings");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setDampingRatio:", 0.601);

  -[SBFluidSwitcherAnimationSettings homeScreenOpacitySettings](self, "homeScreenOpacitySettings");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setResponse:", 0.444);

  -[SBFluidSwitcherAnimationSettings homeScreenScaleSettings](self, "homeScreenScaleSettings");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setBehaviorType:", 2);

  -[SBFluidSwitcherAnimationSettings homeScreenScaleSettings](self, "homeScreenScaleSettings");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setDampingRatio:", 0.783);

  -[SBFluidSwitcherAnimationSettings homeScreenScaleSettings](self, "homeScreenScaleSettings");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setResponse:", 0.702);

  -[SBFluidSwitcherAnimationSettings homeScreenScaleSettings](self, "homeScreenScaleSettings");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v58, "setFrameRateRange:highFrameRateReason:", 1114117, *(double *)&v173.minimum, *(double *)&v173.maximum, *(double *)&v173.preferred);

  -[SBFluidSwitcherAnimationSettings opacitySettings](self, "opacitySettings");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setBehaviorType:", 1);

  -[SBFluidSwitcherAnimationSettings opacitySettings](self, "opacitySettings");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setDampingRatio:", 1.0);

  -[SBFluidSwitcherAnimationSettings opacitySettings](self, "opacitySettings");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setResponse:", 0.314);

  -[SBFluidSwitcherAnimationSettings centerZoomOpacitySettings](self, "centerZoomOpacitySettings");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setBehaviorType:", 1);

  -[SBFluidSwitcherAnimationSettings centerZoomOpacitySettings](self, "centerZoomOpacitySettings");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setDampingRatio:", 4.33);

  -[SBFluidSwitcherAnimationSettings centerZoomOpacitySettings](self, "centerZoomOpacitySettings");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setResponse:", 0.1);

  -[SBFluidSwitcherAnimationSettings swipeToKillOpacitySettings](self, "swipeToKillOpacitySettings");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setBehaviorType:", 1);

  -[SBFluidSwitcherAnimationSettings swipeToKillOpacitySettings](self, "swipeToKillOpacitySettings");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setDampingRatio:", 1.0);

  -[SBFluidSwitcherAnimationSettings swipeToKillOpacitySettings](self, "swipeToKillOpacitySettings");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setResponse:", 0.25);

  -[SBFluidSwitcherAnimationSettings wallpaperScaleSettings](self, "wallpaperScaleSettings");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setBehaviorType:", 1);

  -[SBFluidSwitcherAnimationSettings wallpaperScaleSettings](self, "wallpaperScaleSettings");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setDampingRatio:", 1.0);

  -[SBFluidSwitcherAnimationSettings wallpaperScaleSettings](self, "wallpaperScaleSettings");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setResponse:", 0.75);

  -[SBFluidSwitcherAnimationSettings appSelectionSquishSettings](self, "appSelectionSquishSettings");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setBehaviorType:", 1);

  -[SBFluidSwitcherAnimationSettings appSelectionSquishSettings](self, "appSelectionSquishSettings");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setDampingRatio:", 0.975);

  -[SBFluidSwitcherAnimationSettings appSelectionSquishSettings](self, "appSelectionSquishSettings");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setResponse:", 0.35);

  -[SBFluidSwitcherAnimationSettings appSelectionSquishSettings](self, "appSelectionSquishSettings");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v74, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v174.minimum, *(double *)&v174.maximum, *(double *)&v174.preferred);

  -[SBFluidSwitcherAnimationSettings statusBarFadeInSettings](self, "statusBarFadeInSettings");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setDefaultValues");

  -[SBFluidSwitcherAnimationSettings statusBarFadeInSettings](self, "statusBarFadeInSettings");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setDampingRatio:", 1.0);

  -[SBFluidSwitcherAnimationSettings statusBarFadeInSettings](self, "statusBarFadeInSettings");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setResponse:", 0.6);

  -[SBFluidSwitcherAnimationSettings statusBarFadeOutSettings](self, "statusBarFadeOutSettings");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setDefaultValues");

  -[SBFluidSwitcherAnimationSettings statusBarFadeOutSettings](self, "statusBarFadeOutSettings");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setDampingRatio:", 1.0);

  -[SBFluidSwitcherAnimationSettings statusBarFadeOutSettings](self, "statusBarFadeOutSettings");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setResponse:", 0.4);

  -[SBFluidSwitcherAnimationSettings setStatusBarToApexBounceAnimationDuration:](self, "setStatusBarToApexBounceAnimationDuration:", 0.2);
  -[SBFluidSwitcherAnimationSettings setStatusBarFromApexBounceAnimationDuration:](self, "setStatusBarFromApexBounceAnimationDuration:", 0.8);
  -[SBFluidSwitcherAnimationSettings reopenButtonScaleSettings](self, "reopenButtonScaleSettings");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setDefaultValues");

  -[SBFluidSwitcherAnimationSettings reopenButtonScaleSettings](self, "reopenButtonScaleSettings");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setDampingRatio:", 0.75);

  -[SBFluidSwitcherAnimationSettings reopenButtonScaleSettings](self, "reopenButtonScaleSettings");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setResponse:", 0.375);

  -[SBFluidSwitcherAnimationSettings setReopenButtonInitialScale:](self, "setReopenButtonInitialScale:", 0.9);
  -[SBFluidSwitcherAnimationSettings setReopenButtonFadeInDelay:](self, "setReopenButtonFadeInDelay:", 0.3);
  -[SBFluidSwitcherAnimationSettings alertCardifiedDismissalSettings](self, "alertCardifiedDismissalSettings");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setDefaultValues");

  -[SBFluidSwitcherAnimationSettings alertCardifiedDismissalSettings](self, "alertCardifiedDismissalSettings");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setDampingRatio:", 0.748);

  -[SBFluidSwitcherAnimationSettings alertCardifiedDismissalSettings](self, "alertCardifiedDismissalSettings");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setResponse:", 0.435);

  -[SBFluidSwitcherAnimationSettings alertCardifiedDismissalSettings](self, "alertCardifiedDismissalSettings");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setSmoothingAndProjectionEnabled:", 1);

  -[SBFluidSwitcherAnimationSettings alertCardifiedDismissalSettings](self, "alertCardifiedDismissalSettings");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setInertialTargetSmoothingRatio:", 0.4);

  -[SBFluidSwitcherAnimationSettings alertCardifiedDismissalSettings](self, "alertCardifiedDismissalSettings");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setInertialProjectionDeceleration:", 0.995);

  -[SBFluidSwitcherAnimationSettings setAlertCardifiedDismissHapticDelay:](self, "setAlertCardifiedDismissHapticDelay:", 0.34);
  -[SBFluidSwitcherAnimationSettings setAlertCardifiedDismissZoomOutDelay:](self, "setAlertCardifiedDismissZoomOutDelay:", 0.1);
  -[SBFluidSwitcherAnimationSettings setAlertCardifiedDismissClientAnimationsDelay:](self, "setAlertCardifiedDismissClientAnimationsDelay:", 0.2);
  -[SBFluidSwitcherAnimationSettings alertCardifiedDismissalSettings](self, "alertCardifiedDismissalSettings");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v90, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v175.minimum, *(double *)&v175.maximum, *(double *)&v175.preferred);

  -[SBFluidSwitcherAnimationSettings alertBarSwipeDismissalSettings](self, "alertBarSwipeDismissalSettings");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setDefaultValues");

  -[SBFluidSwitcherAnimationSettings alertBarSwipeDismissalSettings](self, "alertBarSwipeDismissalSettings");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setDampingRatio:", 0.471);

  -[SBFluidSwitcherAnimationSettings alertBarSwipeDismissalSettings](self, "alertBarSwipeDismissalSettings");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setResponse:", 0.299);

  -[SBFluidSwitcherAnimationSettings setAlertBarSwipeDismissHapticDelay:](self, "setAlertBarSwipeDismissHapticDelay:", 0.0);
  -[SBFluidSwitcherAnimationSettings setAlertBarSwipeDismissZoomOutDelay:](self, "setAlertBarSwipeDismissZoomOutDelay:", 0.1);
  -[SBFluidSwitcherAnimationSettings setAlertBarSwipeDismissClientAnimationsDelay:](self, "setAlertBarSwipeDismissClientAnimationsDelay:", 0.0);
  -[SBFluidSwitcherAnimationSettings alertBarSwipeDismissalSettings](self, "alertBarSwipeDismissalSettings");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v94, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v176.minimum, *(double *)&v176.maximum, *(double *)&v176.preferred);

  -[SBFluidSwitcherAnimationSettings siriSwipeDismissalSettings](self, "siriSwipeDismissalSettings");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setDefaultValues");

  -[SBFluidSwitcherAnimationSettings siriSwipeDismissalSettings](self, "siriSwipeDismissalSettings");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "setDampingRatio:", 1.1);

  -[SBFluidSwitcherAnimationSettings siriSwipeDismissalSettings](self, "siriSwipeDismissalSettings");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setResponse:", 0.45);

  -[SBFluidSwitcherAnimationSettings setSiriSwipeDismissHapticDelay:](self, "setSiriSwipeDismissHapticDelay:", 0.25);
  -[SBFluidSwitcherAnimationSettings setSiriSwipeDismissZoomOutDelay:](self, "setSiriSwipeDismissZoomOutDelay:", 0.06);
  -[SBFluidSwitcherAnimationSettings setSiriSwipeDismissClientAnimationsDelay:](self, "setSiriSwipeDismissClientAnimationsDelay:", 0.75);
  -[SBFluidSwitcherAnimationSettings siriSwipeDismissalSettings](self, "siriSwipeDismissalSettings");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v98, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v177.minimum, *(double *)&v177.maximum, *(double *)&v177.preferred);

  -[SBFluidSwitcherAnimationSettings bannerUnfurlSettings](self, "bannerUnfurlSettings");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setDefaultValues");

  -[SBFluidSwitcherAnimationSettings bannerUnfurlSettings](self, "bannerUnfurlSettings");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setDampingRatio:", 1.0);

  -[SBFluidSwitcherAnimationSettings bannerUnfurlSettings](self, "bannerUnfurlSettings");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setResponse:", 0.4);

  -[SBFluidSwitcherAnimationSettings bannerUnfurlSettings](self, "bannerUnfurlSettings");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v102, "setFrameRateRange:highFrameRateReason:", 1114114, *(double *)&v178.minimum, *(double *)&v178.maximum, *(double *)&v178.preferred);

  -[SBFluidSwitcherAnimationSettings bannerUnfurlWallpaperAlphaSettings](self, "bannerUnfurlWallpaperAlphaSettings");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setDefaultValues");

  -[SBFluidSwitcherAnimationSettings bannerUnfurlWallpaperAlphaSettings](self, "bannerUnfurlWallpaperAlphaSettings");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setDampingRatio:", 1.0);

  -[SBFluidSwitcherAnimationSettings bannerUnfurlWallpaperAlphaSettings](self, "bannerUnfurlWallpaperAlphaSettings");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setResponse:", 0.39);

  -[SBFluidSwitcherAnimationSettings setBannerUnfurlWallpaperAlphaDelay:](self, "setBannerUnfurlWallpaperAlphaDelay:", 0.025);
  -[SBFluidSwitcherAnimationSettings switcherToHomeSettings](self, "switcherToHomeSettings");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setDampingRatio:", 1.0);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = objc_msgSend(v107, "userInterfaceIdiom");

  v109 = dbl_1D0E88410[(v108 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  -[SBFluidSwitcherAnimationSettings switcherToHomeSettings](self, "switcherToHomeSettings");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setResponse:", v109);

  -[SBFluidSwitcherAnimationSettings switcherToHomeSettings](self, "switcherToHomeSettings");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v111, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v179.minimum, *(double *)&v179.maximum, *(double *)&v179.preferred);

  -[SBFluidSwitcherAnimationSettings switcherToHomeOpacitySettings](self, "switcherToHomeOpacitySettings");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setBehaviorType:", 1);

  -[SBFluidSwitcherAnimationSettings switcherToHomeOpacitySettings](self, "switcherToHomeOpacitySettings");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setResponse:", 0.0);

  -[SBFluidSwitcherAnimationSettings setReduceMotionCrossfadeDuration:](self, "setReduceMotionCrossfadeDuration:", 0.3);
  -[SBFluidSwitcherAnimationSettings floatingDockIconFadeSettings](self, "floatingDockIconFadeSettings");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setResponse:", 0.21);

  -[SBFluidSwitcherAnimationSettings floatingDockIconFadeSettings](self, "floatingDockIconFadeSettings");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setDampingRatio:", 1.0);

  -[SBFluidSwitcherAnimationSettings setIconZoomFloatingDockFadeDelay:](self, "setIconZoomFloatingDockFadeDelay:", 0.1);
  -[SBFluidSwitcherAnimationSettings switcherZoomDownIconFadeOutSettings](self, "switcherZoomDownIconFadeOutSettings");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "setResponse:", 0.25);

  -[SBFluidSwitcherAnimationSettings switcherZoomDownIconFadeOutSettings](self, "switcherZoomDownIconFadeOutSettings");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setDampingRatio:", 1.0);

  -[SBFluidSwitcherAnimationSettings iconFadeInSettings](self, "iconFadeInSettings");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "setResponse:", 0.5);

  -[SBFluidSwitcherAnimationSettings iconFadeInSettings](self, "iconFadeInSettings");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setDampingRatio:", 1.0);

  -[SBFluidSwitcherAnimationSettings switcherFadeOutSettings](self, "switcherFadeOutSettings");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "setResponse:", 0.15);

  -[SBFluidSwitcherAnimationSettings switcherFadeOutSettings](self, "switcherFadeOutSettings");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "setDampingRatio:", 1.0);

  -[SBFluidSwitcherAnimationSettings setEmptySwitcherDismissDelay:](self, "setEmptySwitcherDismissDelay:", 0.2);
  -[SBFluidSwitcherAnimationSettings setResizeBlurDelay:](self, "setResizeBlurDelay:", 0.1);
  -[SBFluidSwitcherAnimationSettings setAppSwitcherTitleAndIconFadeInSlowDownFactor:](self, "setAppSwitcherTitleAndIconFadeInSlowDownFactor:", 2.2);
  -[SBFluidSwitcherAnimationSettings setCenterZoomScale:](self, "setCenterZoomScale:", 0.02);
  -[SBFluidSwitcherAnimationSettings pulseScaleSettings](self, "pulseScaleSettings");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "setDefaultValues");

  -[SBFluidSwitcherAnimationSettings pulseScaleSettings](self, "pulseScaleSettings");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "setDampingRatio:", 1.0);

  -[SBFluidSwitcherAnimationSettings pulseScaleSettings](self, "pulseScaleSettings");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "setResponse:", 0.358);

  -[SBFluidSwitcherAnimationSettings pulseScaleSettings](self, "pulseScaleSettings");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v125, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v180.minimum, *(double *)&v180.maximum, *(double *)&v180.preferred);

  -[SBFluidSwitcherAnimationSettings setPulseScale:](self, "setPulseScale:", 0.96);
  -[SBFluidSwitcherAnimationSettings setPulseSecondStageDelay:](self, "setPulseSecondStageDelay:", 0.07);
  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  v126 = objc_msgSend(&unk_1E91CE020, "countByEnumeratingWithState:objects:count:", &v155, v159, 16);
  if (v126)
  {
    v127 = v126;
    v128 = *(_QWORD *)v156;
    do
    {
      for (i = 0; i != v127; ++i)
      {
        if (*(_QWORD *)v156 != v128)
          objc_enumerationMutation(&unk_1E91CE020);
        v130 = *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * i);
        -[SBFluidSwitcherAnimationSettings valueForKey:](self, "valueForKey:", v130);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v131, "setName:", v130);

      }
      v127 = objc_msgSend(&unk_1E91CE020, "countByEnumeratingWithState:objects:count:", &v155, v159, 16);
    }
    while (v127);
  }
  -[SBFluidSwitcherAnimationSettings setHomeScreenBlurInSwitcher:](self, "setHomeScreenBlurInSwitcher:", 1.0);
  -[SBFluidSwitcherAnimationSettings setHomeScreenBlurInSwitcherReduceMotionEnabled:](self, "setHomeScreenBlurInSwitcherReduceMotionEnabled:", 1.0);
  -[SBFluidSwitcherAnimationSettings homeScreenBlurInSwitcher](self, "homeScreenBlurInSwitcher");
  -[SBFluidSwitcherAnimationSettings setHomeScreenBlurInApplication:](self, "setHomeScreenBlurInApplication:");
  -[SBFluidSwitcherAnimationSettings homeScreenBlurInSwitcher](self, "homeScreenBlurInSwitcher");
  -[SBFluidSwitcherAnimationSettings setHomeScreenBlurInAssistant:](self, "setHomeScreenBlurInAssistant:");
  -[SBFluidSwitcherAnimationSettings setHomeScreenOpacityInSwitcher:](self, "setHomeScreenOpacityInSwitcher:", 0.5);
  -[SBFluidSwitcherAnimationSettings homeScreenOpacityInSwitcher](self, "homeScreenOpacityInSwitcher");
  -[SBFluidSwitcherAnimationSettings setHomeScreenOpacityInApplication:](self, "setHomeScreenOpacityInApplication:");
  -[SBFluidSwitcherAnimationSettings setHomeScreenScaleInSwitcher:](self, "setHomeScreenScaleInSwitcher:", 0.9);
  -[SBFluidSwitcherAnimationSettings homeScreenScaleInSwitcher](self, "homeScreenScaleInSwitcher");
  -[SBFluidSwitcherAnimationSettings setHomeScreenScaleInApplication:](self, "setHomeScreenScaleInApplication:");
  -[SBFluidSwitcherAnimationSettings setHomeScreenScaleInAssistant:](self, "setHomeScreenScaleInAssistant:", 0.92);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = objc_msgSend(v132, "userInterfaceIdiom");

  -[SBFluidSwitcherAnimationSettings setWallpaperScaleInSwitcher:](self, "setWallpaperScaleInSwitcher:", dbl_1D0E88420[(v133 & 0xFFFFFFFFFFFFFFFBLL) == 1]);
  -[SBFluidSwitcherAnimationSettings wallpaperScaleInSwitcher](self, "wallpaperScaleInSwitcher");
  -[SBFluidSwitcherAnimationSettings setWallpaperScaleInApplication:](self, "setWallpaperScaleInApplication:");
  -[SBFluidSwitcherAnimationSettings setDimmingAlphaInSwitcher:](self, "setDimmingAlphaInSwitcher:", 0.25);
  -[SBFluidSwitcherAnimationSettings setDimmingAlphaInApplication:](self, "setDimmingAlphaInApplication:", 0.67);
  if (SBIsHomeGestureEnabledByDefault())
  {
    -[SBFluidSwitcherAnimationSettings layoutSettings](self, "layoutSettings");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "setTrackingDampingRatio:", 0.577);

    -[SBFluidSwitcherAnimationSettings layoutSettings](self, "layoutSettings");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "setTrackingResponse:", 0.145);

    -[SBFluidSwitcherAnimationSettings layoutSettings](self, "layoutSettings");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "setTrackingRetargetImpulse:", 0.008);

    -[SBFluidSwitcherAnimationSettings homeScreenScaleSettings](self, "homeScreenScaleSettings");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "setDampingRatio:", 0.88);

    -[SBFluidSwitcherAnimationSettings homeScreenScaleSettings](self, "homeScreenScaleSettings");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "setResponse:", 0.7);

    -[SBFluidSwitcherAnimationSettings wallpaperScaleSettings](self, "wallpaperScaleSettings");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "setDampingRatio:", 1.3);

    -[SBFluidSwitcherAnimationSettings wallpaperScaleSettings](self, "wallpaperScaleSettings");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "setResponse:", 0.75);

    -[SBFluidSwitcherAnimationSettings wallpaperScaleSettings](self, "wallpaperScaleSettings");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "setRetargetImpulse:", 0.028);

    -[SBFluidSwitcherAnimationSettings setHomeScreenBlurInSwitcher:](self, "setHomeScreenBlurInSwitcher:", 0.6);
    -[SBFluidSwitcherAnimationSettings setHomeScreenBlurInSwitcherReduceMotionEnabled:](self, "setHomeScreenBlurInSwitcherReduceMotionEnabled:", 1.0);
    -[SBFluidSwitcherAnimationSettings setHomeScreenBlurInApplication:](self, "setHomeScreenBlurInApplication:", 1.0);
    -[SBFluidSwitcherAnimationSettings setHomeScreenBlurInAssistant:](self, "setHomeScreenBlurInAssistant:", 0.045);
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = objc_msgSend(v142, "userInterfaceIdiom");

    if ((v143 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      -[SBFluidSwitcherAnimationSettings setHomeScreenOpacityInSwitcher:](self, "setHomeScreenOpacityInSwitcher:", 0.6);
      -[SBFluidSwitcherAnimationSettings setHomeScreenOpacityInApplication:](self, "setHomeScreenOpacityInApplication:", 0.95);
      -[SBFluidSwitcherAnimationSettings setHomeScreenScaleInSwitcher:](self, "setHomeScreenScaleInSwitcher:", 0.95);
      -[SBFluidSwitcherAnimationSettings setHomeScreenScaleInApplication:](self, "setHomeScreenScaleInApplication:", 0.88);
      -[SBFluidSwitcherAnimationSettings setWallpaperScaleInSwitcher:](self, "setWallpaperScaleInSwitcher:", 1.1);
      -[SBFluidSwitcherAnimationSettings setWallpaperScaleInApplication:](self, "setWallpaperScaleInApplication:", 1.2);
    }
    -[SBFluidSwitcherAnimationSettings setDimmingAlphaInApplication:](self, "setDimmingAlphaInApplication:", 0.5);
  }
  -[SBFluidSwitcherAnimationSettings setAllowIconZoomFromMediumWidgets:](self, "setAllowIconZoomFromMediumWidgets:", 1);
  -[SBFluidSwitcherAnimationSettings setAllowIconZoomFromLargeWidgets:](self, "setAllowIconZoomFromLargeWidgets:", 1);
  if (__sb__runningInSpringBoard())
  {
    v144 = SBFEffectiveDeviceClass();
    v145 = 44.0;
    if (v144 == 2)
      v145 = 10.0;
    -[SBFluidSwitcherAnimationSettings setHomeScreenCenterZoomInitialBlur:](self, "setHomeScreenCenterZoomInitialBlur:", v145);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = objc_msgSend(v146, "userInterfaceIdiom");
    v148 = 44.0;
    if (v147 == 1)
      v148 = 10.0;
    -[SBFluidSwitcherAnimationSettings setHomeScreenCenterZoomInitialBlur:](self, "setHomeScreenCenterZoomInitialBlur:", v148);

  }
  if (__sb__runningInSpringBoard())
  {
    v149 = SBFEffectiveDeviceClass();
    v150 = 0.86;
    if (v149 != 2)
      v150 = 0.5;
    -[SBFluidSwitcherAnimationSettings setHomeScreenCenterZoomInitialScale:](self, "setHomeScreenCenterZoomInitialScale:", v150);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = objc_msgSend(v151, "userInterfaceIdiom");
    v153 = 0.86;
    if (v152 != 1)
      v153 = 0.5;
    -[SBFluidSwitcherAnimationSettings setHomeScreenCenterZoomInitialScale:](self, "setHomeScreenCenterZoomInitialScale:", v153);

  }
  -[SBFluidSwitcherAnimationSettings setHomeScreenCenterZoomInitialOpacity:](self, "setHomeScreenCenterZoomInitialOpacity:", 0.0);
  if (__sb__runningInSpringBoard())
  {
    -[SBFluidSwitcherAnimationSettings setHomeScreenCenterZoomTargetScaleWhenUnblurringIsComplete:](self, "setHomeScreenCenterZoomTargetScaleWhenUnblurringIsComplete:", dbl_1D0E88430[SBFEffectiveDeviceClass() == 2]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherAnimationSettings setHomeScreenCenterZoomTargetScaleWhenUnblurringIsComplete:](self, "setHomeScreenCenterZoomTargetScaleWhenUnblurringIsComplete:", dbl_1D0E88430[objc_msgSend(v154, "userInterfaceIdiom") == 1]);

  }
  -[SBFluidSwitcherAnimationSettings setHomeScreenCenterZoomYOffsetPercentOfScreenHeight:](self, "setHomeScreenCenterZoomYOffsetPercentOfScreenHeight:", 0.0);
}

- (void)_setTopAffordanceTransitionDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[SBFluidSwitcherAnimationSettings setPerformTwoPhaseFullScreenToPeekTransition:](self, "setPerformTwoPhaseFullScreenToPeekTransition:", 1);
  -[SBFluidSwitcherAnimationSettings fullScreenToPeekFirstPhaseAnimationSettings](self, "fullScreenToPeekFirstPhaseAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValues");

  -[SBFluidSwitcherAnimationSettings fullScreenToPeekFirstPhaseAnimationSettings](self, "fullScreenToPeekFirstPhaseAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDampingRatio:", 1.1);

  -[SBFluidSwitcherAnimationSettings fullScreenToPeekFirstPhaseAnimationSettings](self, "fullScreenToPeekFirstPhaseAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResponse:", 0.45);

  -[SBFluidSwitcherAnimationSettings fullScreenToPeekSecondPhaseAnimationSettings](self, "fullScreenToPeekSecondPhaseAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultValues");

  -[SBFluidSwitcherAnimationSettings fullScreenToPeekSecondPhaseAnimationSettings](self, "fullScreenToPeekSecondPhaseAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDampingRatio:", 0.9);

  -[SBFluidSwitcherAnimationSettings fullScreenToPeekSecondPhaseAnimationSettings](self, "fullScreenToPeekSecondPhaseAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResponse:", 0.44);

  -[SBFluidSwitcherAnimationSettings setFullScreenToPeekSecondPhaseAnimationDelay:](self, "setFullScreenToPeekSecondPhaseAnimationDelay:", 0.4);
  -[SBFluidSwitcherAnimationSettings splitViewToSlideOverSettings](self, "splitViewToSlideOverSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDefaultCriticallyDampedValues");

  -[SBFluidSwitcherAnimationSettings slideOverToFullScreenAnimationSettings](self, "slideOverToFullScreenAnimationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDefaultCriticallyDampedValues");

  -[SBFluidSwitcherAnimationSettings setSlideOverToFullScreenOutgoingAppScaleBack:](self, "setSlideOverToFullScreenOutgoingAppScaleBack:", 0.9);
  -[SBFluidSwitcherAnimationSettings setSlideOverToFullScreenOutgoingFinalOpacity:](self, "setSlideOverToFullScreenOutgoingFinalOpacity:", 0.0);
  -[SBFluidSwitcherAnimationSettings centerToSlideOverAnimationSettings](self, "centerToSlideOverAnimationSettings");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDefaultCriticallyDampedValues");

}

- (void)_setEntityPresentationDefaultValues
{
  id v2;

  -[SBFluidSwitcherAnimationSettings slideUpSettings](self, "slideUpSettings");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDefaultCriticallyDampedValues");

}

- (void)_setKeyboardShortcutDefaultValues
{
  void *v3;
  void *v4;
  void *v5;

  -[SBFluidSwitcherAnimationSettings swapAppSidesLayoutAnimationSettings](self, "swapAppSidesLayoutAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultCriticallyDampedValues");

  -[SBFluidSwitcherAnimationSettings swapAppSidesOpacityAnimationSettings](self, "swapAppSidesOpacityAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultCriticallyDampedValues");

  -[SBFluidSwitcherAnimationSettings swapAppSidesOpacityAnimationSettings](self, "swapAppSidesOpacityAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResponse:", 0.15);

  -[SBFluidSwitcherAnimationSettings setSwapAppSidesShadowFadeOutDelay:](self, "setSwapAppSidesShadowFadeOutDelay:", 0.3);
}

- (void)_setHomeGestureAnimationDefaultValues
{
  SBFFluidBehaviorSettings *homeGestureCenterRowZoomUpSettings;
  SBFFluidBehaviorSettings *homeGestureEdgeRowZoomUpSettings;
  SBFFluidBehaviorSettings *homeGestureTopRowZoomDownLayoutSettings;
  SBFFluidBehaviorSettings *homeGestureTopRowZoomDownPositionSettings;
  void *v7;
  uint64_t v8;
  double v9;
  SBFFluidBehaviorSettings *homeGestureTopRowZoomDownScaleSettings;
  SBFFluidBehaviorSettings *homeGestureBottomRowZoomDownLayoutSettings;
  void *v12;
  uint64_t v13;
  double v14;
  SBFFluidBehaviorSettings *homeGestureBottomRowZoomDownPositionSettings;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  double v20;
  SBFFluidBehaviorSettings *homeGestureBottomRowZoomDownScaleSettings;
  SBFFluidBehaviorSettings *homeGestureSmallWidgetZoomDownLayoutSettings;
  SBFFluidBehaviorSettings *homeGestureSmallWidgetZoomDownPositionSettings;
  SBFFluidBehaviorSettings *homeGestureSmallWidgetZoomDownScaleSettings;
  SBFFluidBehaviorSettings *homeGestureMediumWidgetZoomDownLayoutSettings;
  SBFFluidBehaviorSettings *homeGestureMediumWidgetZoomDownPositionSettings;
  SBFFluidBehaviorSettings *homeGestureMediumWidgetZoomDownScaleSettings;
  SBFFluidBehaviorSettings *homeGestureLargeWidgetZoomDownLayoutSettings;
  SBFFluidBehaviorSettings *homeGestureLargeWidgetZoomDownPositionSettings;
  SBFFluidBehaviorSettings *homeGestureLargeWidgetZoomDownScaleSettings;
  SBFFluidBehaviorSettings *arcSwipeSettings;
  SBFFluidBehaviorSettings *arcSwipeSwitcherGlancingSettings;
  SBFFluidBehaviorSettings *appToSwitcherCornerRadiusSettings;
  SBFFluidBehaviorSettings *gestureInitiatedAppToSwitcherSettings;
  SBFFluidBehaviorSettings *cardFlyInSettings;
  SBFFluidBehaviorSettings *reduceMotionArcSwipeSettings;
  double v37;
  SBFFluidBehaviorSettings *reduceMotionAppToSwitcherSettings;
  double v39;
  void *v40;
  uint64_t v41;
  double v42;
  CAFrameRateRange v43;
  CAFrameRateRange v44;
  CAFrameRateRange v45;
  CAFrameRateRange v46;
  CAFrameRateRange v47;
  CAFrameRateRange v48;
  CAFrameRateRange v49;
  CAFrameRateRange v50;
  CAFrameRateRange v51;
  CAFrameRateRange v52;
  CAFrameRateRange v53;
  CAFrameRateRange v54;
  CAFrameRateRange v55;
  CAFrameRateRange v56;
  CAFrameRateRange v57;
  CAFrameRateRange v58;
  CAFrameRateRange v59;
  CAFrameRateRange v60;
  CAFrameRateRange v61;
  CAFrameRateRange v62;
  CAFrameRateRange v63;
  CAFrameRateRange v64;

  -[SBFFluidBehaviorSettings setDampingRatio:](self->_homeGestureCenterRowZoomUpSettings, "setDampingRatio:", 1.1);
  -[SBFFluidBehaviorSettings setResponse:](self->_homeGestureCenterRowZoomUpSettings, "setResponse:");
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_homeGestureCenterRowZoomUpSettings, "setRetargetImpulse:", 0.016);
  homeGestureCenterRowZoomUpSettings = self->_homeGestureCenterRowZoomUpSettings;
  v43 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureCenterRowZoomUpSettings, "setFrameRateRange:highFrameRateReason:", 1114114, *(double *)&v43.minimum, *(double *)&v43.maximum, *(double *)&v43.preferred);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_homeGestureEdgeRowZoomUpSettings, "setDampingRatio:", 1.1);
  -[SBFFluidBehaviorSettings setResponse:](self->_homeGestureEdgeRowZoomUpSettings, "setResponse:", 0.34);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_homeGestureEdgeRowZoomUpSettings, "setRetargetImpulse:", 0.016);
  homeGestureEdgeRowZoomUpSettings = self->_homeGestureEdgeRowZoomUpSettings;
  v44 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureEdgeRowZoomUpSettings, "setFrameRateRange:highFrameRateReason:", 1114114, *(double *)&v44.minimum, *(double *)&v44.maximum, *(double *)&v44.preferred);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_homeGestureTopRowZoomDownLayoutSettings, "setDampingRatio:", 1.1);
  -[SBFFluidBehaviorSettings setResponse:](self->_homeGestureTopRowZoomDownLayoutSettings, "setResponse:");
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_homeGestureTopRowZoomDownLayoutSettings, "setRetargetImpulse:", 0.016);
  homeGestureTopRowZoomDownLayoutSettings = self->_homeGestureTopRowZoomDownLayoutSettings;
  v45 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureTopRowZoomDownLayoutSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v45.minimum, *(double *)&v45.maximum, *(double *)&v45.preferred);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_homeGestureTopRowZoomDownPositionSettings, "setDampingRatio:");
  -[SBFFluidBehaviorSettings setResponse:](self->_homeGestureTopRowZoomDownPositionSettings, "setResponse:");
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_homeGestureTopRowZoomDownPositionSettings, "setRetargetImpulse:", 0.02);
  homeGestureTopRowZoomDownPositionSettings = self->_homeGestureTopRowZoomDownPositionSettings;
  v46 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureTopRowZoomDownPositionSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v46.minimum, *(double *)&v46.maximum, *(double *)&v46.preferred);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_homeGestureTopRowZoomDownScaleSettings, "setDampingRatio:");
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v9 = 0.4;
  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v9 = 0.55;
  -[SBFFluidBehaviorSettings setResponse:](self->_homeGestureTopRowZoomDownScaleSettings, "setResponse:", v9);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_homeGestureTopRowZoomDownScaleSettings, "setRetargetImpulse:");
  homeGestureTopRowZoomDownScaleSettings = self->_homeGestureTopRowZoomDownScaleSettings;
  v47 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureTopRowZoomDownScaleSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v47.minimum, *(double *)&v47.maximum, *(double *)&v47.preferred);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_homeGestureBottomRowZoomDownLayoutSettings, "setDampingRatio:", 1.1);
  -[SBFFluidBehaviorSettings setResponse:](self->_homeGestureBottomRowZoomDownLayoutSettings, "setResponse:", 0.375);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_homeGestureBottomRowZoomDownLayoutSettings, "setRetargetImpulse:", 0.016);
  homeGestureBottomRowZoomDownLayoutSettings = self->_homeGestureBottomRowZoomDownLayoutSettings;
  v48 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureBottomRowZoomDownLayoutSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v48.minimum, *(double *)&v48.maximum, *(double *)&v48.preferred);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_homeGestureBottomRowZoomDownPositionSettings, "setDampingRatio:", 0.86);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v14 = 0.5;
  else
    v14 = 0.55;
  -[SBFFluidBehaviorSettings setResponse:](self->_homeGestureBottomRowZoomDownPositionSettings, "setResponse:", v14);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_homeGestureBottomRowZoomDownPositionSettings, "setRetargetImpulse:", 0.02);
  homeGestureBottomRowZoomDownPositionSettings = self->_homeGestureBottomRowZoomDownPositionSettings;
  v49 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureBottomRowZoomDownPositionSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v49.minimum, *(double *)&v49.maximum, *(double *)&v49.preferred);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "userInterfaceIdiom");

  -[SBFFluidBehaviorSettings setDampingRatio:](self->_homeGestureBottomRowZoomDownScaleSettings, "setDampingRatio:", dbl_1D0E88440[(v17 & 0xFFFFFFFFFFFFFFFBLL) == 1]);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "userInterfaceIdiom");

  if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v20 = 0.5;
  else
    v20 = 0.55;
  -[SBFFluidBehaviorSettings setResponse:](self->_homeGestureBottomRowZoomDownScaleSettings, "setResponse:", v20);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_homeGestureBottomRowZoomDownScaleSettings, "setRetargetImpulse:", 0.018);
  homeGestureBottomRowZoomDownScaleSettings = self->_homeGestureBottomRowZoomDownScaleSettings;
  v50 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureBottomRowZoomDownScaleSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v50.minimum, *(double *)&v50.maximum, *(double *)&v50.preferred);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_homeGestureSmallWidgetZoomDownLayoutSettings, "setDampingRatio:", 1.1);
  -[SBFFluidBehaviorSettings setResponse:](self->_homeGestureSmallWidgetZoomDownLayoutSettings, "setResponse:", 0.425);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_homeGestureSmallWidgetZoomDownLayoutSettings, "setRetargetImpulse:", 0.016);
  homeGestureSmallWidgetZoomDownLayoutSettings = self->_homeGestureSmallWidgetZoomDownLayoutSettings;
  v51 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureSmallWidgetZoomDownLayoutSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v51.minimum, *(double *)&v51.maximum, *(double *)&v51.preferred);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_homeGestureSmallWidgetZoomDownPositionSettings, "setDampingRatio:", 0.88);
  -[SBFFluidBehaviorSettings setResponse:](self->_homeGestureSmallWidgetZoomDownPositionSettings, "setResponse:", 0.45);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_homeGestureSmallWidgetZoomDownPositionSettings, "setRetargetImpulse:", 0.02);
  homeGestureSmallWidgetZoomDownPositionSettings = self->_homeGestureSmallWidgetZoomDownPositionSettings;
  v52 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureSmallWidgetZoomDownPositionSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v52.minimum, *(double *)&v52.maximum, *(double *)&v52.preferred);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_homeGestureSmallWidgetZoomDownScaleSettings, "setDampingRatio:", 0.96);
  -[SBFFluidBehaviorSettings setResponse:](self->_homeGestureSmallWidgetZoomDownScaleSettings, "setResponse:", 0.54);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_homeGestureSmallWidgetZoomDownScaleSettings, "setRetargetImpulse:", 0.018);
  homeGestureSmallWidgetZoomDownScaleSettings = self->_homeGestureSmallWidgetZoomDownScaleSettings;
  v53 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureSmallWidgetZoomDownScaleSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v53.minimum, *(double *)&v53.maximum, *(double *)&v53.preferred);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_homeGestureMediumWidgetZoomDownLayoutSettings, "setDampingRatio:", 0.96);
  -[SBFFluidBehaviorSettings setResponse:](self->_homeGestureMediumWidgetZoomDownLayoutSettings, "setResponse:", 0.32);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_homeGestureMediumWidgetZoomDownLayoutSettings, "setRetargetImpulse:", 0.016);
  homeGestureMediumWidgetZoomDownLayoutSettings = self->_homeGestureMediumWidgetZoomDownLayoutSettings;
  v54 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureMediumWidgetZoomDownLayoutSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v54.minimum, *(double *)&v54.maximum, *(double *)&v54.preferred);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_homeGestureMediumWidgetZoomDownPositionSettings, "setDampingRatio:", 0.88);
  -[SBFFluidBehaviorSettings setResponse:](self->_homeGestureMediumWidgetZoomDownPositionSettings, "setResponse:", 0.45);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_homeGestureMediumWidgetZoomDownPositionSettings, "setRetargetImpulse:", 0.02);
  homeGestureMediumWidgetZoomDownPositionSettings = self->_homeGestureMediumWidgetZoomDownPositionSettings;
  v55 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureMediumWidgetZoomDownPositionSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v55.minimum, *(double *)&v55.maximum, *(double *)&v55.preferred);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_homeGestureMediumWidgetZoomDownScaleSettings, "setDampingRatio:", 0.96);
  -[SBFFluidBehaviorSettings setResponse:](self->_homeGestureMediumWidgetZoomDownScaleSettings, "setResponse:", 0.54);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_homeGestureMediumWidgetZoomDownScaleSettings, "setRetargetImpulse:", 0.0);
  homeGestureMediumWidgetZoomDownScaleSettings = self->_homeGestureMediumWidgetZoomDownScaleSettings;
  v56 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureMediumWidgetZoomDownScaleSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v56.minimum, *(double *)&v56.maximum, *(double *)&v56.preferred);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_homeGestureLargeWidgetZoomDownLayoutSettings, "setDampingRatio:", 0.96);
  -[SBFFluidBehaviorSettings setResponse:](self->_homeGestureLargeWidgetZoomDownLayoutSettings, "setResponse:", 0.4);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_homeGestureLargeWidgetZoomDownLayoutSettings, "setRetargetImpulse:", 0.016);
  homeGestureLargeWidgetZoomDownLayoutSettings = self->_homeGestureLargeWidgetZoomDownLayoutSettings;
  v57 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureLargeWidgetZoomDownLayoutSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v57.minimum, *(double *)&v57.maximum, *(double *)&v57.preferred);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_homeGestureLargeWidgetZoomDownPositionSettings, "setDampingRatio:", 0.88);
  -[SBFFluidBehaviorSettings setResponse:](self->_homeGestureLargeWidgetZoomDownPositionSettings, "setResponse:", 0.45);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_homeGestureLargeWidgetZoomDownPositionSettings, "setRetargetImpulse:", 0.0);
  homeGestureLargeWidgetZoomDownPositionSettings = self->_homeGestureLargeWidgetZoomDownPositionSettings;
  v58 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureLargeWidgetZoomDownPositionSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v58.minimum, *(double *)&v58.maximum, *(double *)&v58.preferred);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_homeGestureLargeWidgetZoomDownScaleSettings, "setDampingRatio:", 0.96);
  -[SBFFluidBehaviorSettings setResponse:](self->_homeGestureLargeWidgetZoomDownScaleSettings, "setResponse:", 0.54);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_homeGestureLargeWidgetZoomDownScaleSettings, "setRetargetImpulse:", 0.0);
  homeGestureLargeWidgetZoomDownScaleSettings = self->_homeGestureLargeWidgetZoomDownScaleSettings;
  v59 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](homeGestureLargeWidgetZoomDownScaleSettings, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v59.minimum, *(double *)&v59.maximum, *(double *)&v59.preferred);
  self->_zoomDownWidgetScaleVelocityYMinimum = 3000.0;
  self->_zoomDownWidgetScaleVelocityYMaximum = 5000.0;
  self->_zoomDownWidgetScaleOvershootMinimumMultiplier = 0.8;
  self->_zoomDownWidgetScaleOvershootMaximumMultiplier = 0.7;
  self->_zoomDownWidgetScaleOvershootDuration = 0.1;
  -[SBFFluidBehaviorSettings setDefaultValues](self->_arcSwipeSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_arcSwipeSettings, "setRetargetImpulse:", 0.018);
  arcSwipeSettings = self->_arcSwipeSettings;
  v60 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](arcSwipeSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v60.minimum, *(double *)&v60.maximum, *(double *)&v60.preferred);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_arcSwipeSwitcherGlancingSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_arcSwipeSwitcherGlancingSettings, "setDampingRatio:", 1.0);
  -[SBFFluidBehaviorSettings setResponse:](self->_arcSwipeSwitcherGlancingSettings, "setResponse:", 0.55);
  -[SBFFluidBehaviorSettings setTrackingDampingRatio:](self->_arcSwipeSwitcherGlancingSettings, "setTrackingDampingRatio:", 1.0);
  -[SBFFluidBehaviorSettings setTrackingResponse:](self->_arcSwipeSwitcherGlancingSettings, "setTrackingResponse:", 0.55);
  arcSwipeSwitcherGlancingSettings = self->_arcSwipeSwitcherGlancingSettings;
  v61 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](arcSwipeSwitcherGlancingSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v61.minimum, *(double *)&v61.maximum, *(double *)&v61.preferred);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_appToSwitcherCornerRadiusSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_appToSwitcherCornerRadiusSettings, "setRetargetImpulse:", 0.018);
  appToSwitcherCornerRadiusSettings = self->_appToSwitcherCornerRadiusSettings;
  v62 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](appToSwitcherCornerRadiusSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v62.minimum, *(double *)&v62.maximum, *(double *)&v62.preferred);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_gestureInitiatedAppToSwitcherSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_gestureInitiatedAppToSwitcherSettings, "setDampingRatio:", 0.94);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_gestureInitiatedAppToSwitcherSettings, "setRetargetImpulse:", 0.018);
  gestureInitiatedAppToSwitcherSettings = self->_gestureInitiatedAppToSwitcherSettings;
  v63 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](gestureInitiatedAppToSwitcherSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v63.minimum, *(double *)&v63.maximum, *(double *)&v63.preferred);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_cardFlyInSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setResponse:](self->_cardFlyInSettings, "setResponse:", 0.3);
  cardFlyInSettings = self->_cardFlyInSettings;
  v64 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](cardFlyInSettings, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v64.minimum, *(double *)&v64.maximum, *(double *)&v64.preferred);
  self->_cardFlyInAccelerationDipThreshold = 2000.0;
  self->_minimumTouchSamplesForAccelerationDip = 4;
  -[SBFFluidBehaviorSettings setDefaultValues](self->_reduceMotionArcSwipeSettings, "setDefaultValues");
  reduceMotionArcSwipeSettings = self->_reduceMotionArcSwipeSettings;
  -[SBFFluidBehaviorSettings response](reduceMotionArcSwipeSettings, "response");
  -[SBFFluidBehaviorSettings setResponse:](reduceMotionArcSwipeSettings, "setResponse:", v37 * 0.8);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_reduceMotionArcSwipeSettings, "setDampingRatio:", 1.0);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_reduceMotionArcSwipeSettings, "setRetargetImpulse:", 0.018);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_reduceMotionAppToSwitcherSettings, "setDefaultValues");
  reduceMotionAppToSwitcherSettings = self->_reduceMotionAppToSwitcherSettings;
  -[SBFFluidBehaviorSettings response](reduceMotionAppToSwitcherSettings, "response");
  -[SBFFluidBehaviorSettings setResponse:](reduceMotionAppToSwitcherSettings, "setResponse:", v39 * 0.8);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_reduceMotionAppToSwitcherSettings, "setDampingRatio:", 1.0);
  -[SBFFluidBehaviorSettings setRetargetImpulse:](self->_reduceMotionAppToSwitcherSettings, "setRetargetImpulse:", 0.018);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "userInterfaceIdiom");

  v42 = 0.15;
  if ((v41 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v42 = 0.0;
  self->_reduceMotionTriggerDelay = v42;
  self->_zoomDownVelocityYMinimum = 3000.0;
  self->_zoomDownVelocityYMaximum = 5000.0;
  self->_zoomDownVelocityYLayoutResponseMultiplier = 0.7;
  self->_zoomDownVelocityXMinimum = 1000.0;
  self->_zoomDownVelocityXMaximum = 4000.0;
  self->_zoomDownVelocityXPositionResponseMultiplier = 1.2;
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
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  _QWORD v264[23];
  _QWORD v265[5];
  _QWORD v266[3];
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  _QWORD v272[2];
  _QWORD v273[3];
  _QWORD v274[4];
  _QWORD v275[4];
  _QWORD v276[4];
  void *v277;
  void *v278;
  void *v279;
  _QWORD v280[12];
  _QWORD v281[2];
  _QWORD v282[37];
  _QWORD v283[3];
  void *v284;
  _QWORD v285[9];
  _QWORD v286[28];

  v286[26] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Layout"), CFSTR("layoutSettings"));
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Zoom Up"), CFSTR("zoomUpSettings"));
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Icon ZoomDown"), CFSTR("iconZoomDownSettings"));
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Icon Zoom Floating Dock Fade Delay"), CFSTR("floatingDockIconFadeSettings"));
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Switcher Icon Zoom Fade Out"), CFSTR("switcherZoomDownIconFadeOutSettings"));
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Switcher Icon Fade In"), CFSTR("iconFadeInSettings"));
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Switcher Fade Out"), CFSTR("switcherFadeOutSettings"));
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Center Zoom"), CFSTR("centerZoomSettings"));
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Slide Over"), CFSTR("slideOverSettings"));
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Toggle App Switcher"), CFSTR("toggleAppSwitcherSettings"));
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Launch App From Switcher"), CFSTR("launchAppFromSwitcherSettings"));
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Switcher To Home"), CFSTR("switcherToHomeSettings"));
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Stacked Switcher Tracking Paramters"), CFSTR("stackedSwitcherTrackingSettings"));
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Home Screen Blur"), CFSTR("backdropBlurSettings"));
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Home Screen Opacity"), CFSTR("homeScreenOpacitySettings"));
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Home Screen Scale"), CFSTR("homeScreenScaleSettings"));
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Opacity"), CFSTR("opacitySettings"));
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Center Zoom Opacity"), CFSTR("centerZoomOpacitySettings"));
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Swipe Shelf to Kill Opacity"), CFSTR("swipeToKillOpacitySettings"));
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Switcher To Home Opacity"), CFSTR("switcherToHomeOpacitySettings"));
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Wallpaper Scale"), CFSTR("wallpaperScaleSettings"));
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("App Selection Squish"), CFSTR("appSelectionSquishSettings"));
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Status Bar Fade In"), CFSTR("statusBarFadeInSettings"));
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Status Bar Fade Out"), CFSTR("statusBarFadeOutSettings"));
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Status Bar To Apex Bounce Duration"), CFSTR("statusBarToApexBounceAnimationDuration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "between:and:", 0.0, 2.0);
  v191 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Status Bar From Apex Bounce Duration"), CFSTR("statusBarFromApexBounceAnimationDuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 0.0, 2.0);
  v190 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83070];
  v286[0] = v263;
  v286[1] = v262;
  v286[2] = v261;
  v286[3] = v260;
  v286[4] = v259;
  v286[5] = v258;
  v286[6] = v257;
  v286[7] = v256;
  v286[8] = v255;
  v286[9] = v254;
  v286[10] = v253;
  v286[11] = v252;
  v286[12] = v251;
  v286[13] = v250;
  v286[14] = v249;
  v286[15] = v248;
  v286[16] = v247;
  v286[17] = v246;
  v286[18] = v197;
  v286[19] = v196;
  v286[20] = v195;
  v286[21] = v194;
  v286[22] = v193;
  v286[23] = v192;
  v286[24] = v191;
  v286[25] = v190;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v286, 26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:", v5, CFSTR("Animation Settings"));
  v245 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Perform Two Phase Full Screen To Peek Transition"), CFSTR("performTwoPhaseFullScreenToPeekTransition"));
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Full Screen To Peek First Phase Animation Settings"), CFSTR("fullScreenToPeekFirstPhaseAnimationSettings"));
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Full Screen To Peek Second Phase Animation Settings"), CFSTR("fullScreenToPeekSecondPhaseAnimationSettings"));
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Full Screen To Peek Second Phase Animation Delay"), CFSTR("fullScreenToPeekSecondPhaseAnimationDelay"));
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Split View to Slide Over"), CFSTR("splitViewToSlideOverSettings"));
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Slide Over to Full Screen Animation Settings"), CFSTR("slideOverToFullScreenAnimationSettings"));
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Slide Over to Full Screen Outgoing App Scale Back Amount"), CFSTR("slideOverToFullScreenOutgoingAppScaleBack"));
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Slide Over to Full Screen Outgoing App Final Opacity"), CFSTR("slideOverToFullScreenOutgoingFinalOpacity"));
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Center to Slide Over (and Back) Animation Settings"), CFSTR("centerToSlideOverAnimationSettings"));
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D83070];
  v285[0] = v189;
  v285[1] = v188;
  v285[2] = v187;
  v285[3] = v186;
  v285[4] = v185;
  v285[5] = v184;
  v285[6] = v183;
  v285[7] = v182;
  v285[8] = v181;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v285, 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v7, CFSTR("Top Affordance Transition Settings"));
  v244 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Slide Up"), CFSTR("slideUpSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v284 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v284, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionWithRows:title:", v10, CFSTR("Entity Presentation"));
  v243 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Swap App Sides Using 🌐-Control-Left/Right, Layout"), CFSTR("swapAppSidesLayoutAnimationSettings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v283[0] = v12;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Swap App Sides Using 🌐-Control-Left/Right, Opacity"), CFSTR("swapAppSidesOpacityAnimationSettings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v283[1] = v13;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Delay Until Shadow Starts Fading Out In Swap App Sides Transition"), CFSTR("swapAppSidesShadowFadeOutDelay"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v283[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v283, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:title:", v15, CFSTR("Keyboard Shortcut Transition Settings"));
  v242 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Zoom Up Center"), CFSTR("homeGestureCenterRowZoomUpSettings"));
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Zoom Up Top/Bottom"), CFSTR("homeGestureEdgeRowZoomUpSettings"));
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Zoom Down Top (Layout)"), CFSTR("homeGestureTopRowZoomDownLayoutSettings"));
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Zoom Down Top (Position)"), CFSTR("homeGestureTopRowZoomDownPositionSettings"));
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Zoom Down Top (Scale)"), CFSTR("homeGestureTopRowZoomDownScaleSettings"));
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Zoom Down Bottom (Layout)"), CFSTR("homeGestureBottomRowZoomDownLayoutSettings"));
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Zoom Down Bottom (Position)"), CFSTR("homeGestureBottomRowZoomDownPositionSettings"));
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Zoom Down Bottom (Scale)"), CFSTR("homeGestureBottomRowZoomDownScaleSettings"));
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Zoom Down Small Widget (Layout)"), CFSTR("homeGestureSmallWidgetZoomDownLayoutSettings"));
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Zoom Down Small Widget (Position)"), CFSTR("homeGestureSmallWidgetZoomDownPositionSettings"));
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Zoom Down Small Widget (Scale)"), CFSTR("homeGestureSmallWidgetZoomDownScaleSettings"));
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Zoom Down Medium Widget (Layout)"), CFSTR("homeGestureMediumWidgetZoomDownLayoutSettings"));
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Zoom Down Medium Widget (Position)"), CFSTR("homeGestureMediumWidgetZoomDownPositionSettings"));
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Zoom Down Medium Widget (Scale)"), CFSTR("homeGestureMediumWidgetZoomDownScaleSettings"));
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Zoom Down Large Widget (Layout)"), CFSTR("homeGestureLargeWidgetZoomDownLayoutSettings"));
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Zoom Down Large Widget (Position)"), CFSTR("homeGestureLargeWidgetZoomDownPositionSettings"));
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Zoom Down Large Widget (Scale)"), CFSTR("homeGestureLargeWidgetZoomDownScaleSettings"));
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Widget Scale Velocity Minimum"), CFSTR("zoomDownWidgetScaleVelocityYMinimum"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "between:and:", 0.0, 10000.0);
  v224 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Widget Scale Velocity Maximum"), CFSTR("zoomDownWidgetScaleVelocityYMaximum"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "between:and:", 0.0, 10000.0);
  v223 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Widget Scale Overshoot Min Multiplier"), CFSTR("zoomDownWidgetScaleOvershootMinimumMultiplier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "between:and:", 0.0, 10.0);
  v222 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Widget Scale Overshoot Max Multiplier"), CFSTR("zoomDownWidgetScaleOvershootMaximumMultiplier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "between:and:", 0.0, 10.0);
  v221 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Widget Scale Overshoot Duration"), CFSTR("zoomDownWidgetScaleOvershootDuration"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "between:and:", 0.0, 10.0);
  v220 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Arc Swipe"), CFSTR("arcSwipeSettings"));
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Arc Swipe Switcher Glancing"), CFSTR("arcSwipeSwitcherGlancingSettings"));
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("App to Switcher Swipe Up Corner Radius"), CFSTR("appToSwitcherCornerRadiusSettings"));
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Card Fly In"), CFSTR("cardFlyInSettings"));
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Acceleration Dip Threshold"), CFSTR("cardFlyInAccelerationDipThreshold"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "between:and:", 0.0, 100000.0);
  v215 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Min Touch Samples For Acceleration Dip"), CFSTR("_minimumTouchSamplesForAccelerationDip"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "between:and:", 0.0, 100.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "precision:", 0);
  v214 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Reduce Motion Arc Swipe"), CFSTR("reduceMotionArcSwipeSettings"));
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Reduce Motion App To Switcher"), CFSTR("reduceMotionAppToSwitcherSettings"));
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Reduce Motion Trigger Delay"), CFSTR("reduceMotionTriggerDelay"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "between:and:", 0.0, 1.0);
  v179 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Zoom Down Velocity Y Minimum"), CFSTR("zoomDownVelocityYMinimum"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "between:and:", 0.0, 10000.0);
  v178 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Zoom Down Velocity Y Maximum"), CFSTR("zoomDownVelocityYMaximum"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "between:and:", 0.0, 10000.0);
  v177 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Zoom Down Velocity Y Multiplier"), CFSTR("zoomDownVelocityYLayoutResponseMultiplier"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "between:and:", 0.0, 2.0);
  v176 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Zoom Down Velocity X Minimum"), CFSTR("zoomDownVelocityXMinimum"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "between:and:", 0.0, 10000.0);
  v175 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Zoom Down Velocity X Maximum"), CFSTR("zoomDownVelocityXMaximum"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "between:and:", 0.0, 10000.0);
  v174 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Zoom Down Velocity X Multiplier"), CFSTR("zoomDownVelocityXPositionResponseMultiplier"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "between:and:", 0.0, 2.0);
  v173 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x1E0D83070];
  v282[0] = v241;
  v282[1] = v240;
  v282[2] = v239;
  v282[3] = v238;
  v282[4] = v237;
  v282[5] = v236;
  v282[6] = v235;
  v282[7] = v234;
  v282[8] = v233;
  v282[9] = v232;
  v282[10] = v231;
  v282[11] = v230;
  v282[12] = v229;
  v282[13] = v228;
  v282[14] = v227;
  v282[15] = v226;
  v282[16] = v225;
  v282[17] = v224;
  v282[18] = v223;
  v282[19] = v222;
  v282[20] = v221;
  v282[21] = v220;
  v282[22] = v219;
  v282[23] = v218;
  v282[24] = v216;
  v282[25] = v215;
  v282[26] = v214;
  v282[27] = v217;
  v282[28] = v213;
  v282[29] = v180;
  v282[30] = v179;
  v282[31] = v178;
  v282[32] = v177;
  v282[33] = v176;
  v282[34] = v175;
  v282[35] = v174;
  v282[36] = v173;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v282, 37);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sectionWithRows:title:", v32, CFSTR("Home Gesture Settings"));
  v212 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Allow Icon Zoom From Medium Widgets"), CFSTR("allowIconZoomFromMediumWidgets"));
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Allow Icon Zoom From Large Widgets"), CFSTR("allowIconZoomFromLargeWidgets"));
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x1E0D83070];
  v281[0] = v172;
  v281[1] = v171;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v281, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "sectionWithRows:", v34);
  v211 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Dosido (X Movement)"), CFSTR("dosidoSettings"));
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Dosido Scale Down"), CFSTR("dosidoScaleDownSettings"));
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Dosido Scale Up"), CFSTR("dosidoScaleUpSettings"));
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Dosido Scale"), CFSTR("dosidoScale"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "minValue:maxValue:", 0.0, 1.0);
  v170 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Dosido Scale Up Delay"), CFSTR("dosidoScaleUpDelay"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "between:and:", 0.0, 1.0);
  v169 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Crossblur Dosido"), CFSTR("crossblurDosidoSettings"));
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Crossblur Dosido Small Scale"), CFSTR("crossblurDosidoSmallScale"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "between:and:", 0.0, 0.01);
  v167 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Crossblur Dosido Center Zoom Up Small Scale"), CFSTR("crossblurDosidoCenterZoomUpSmallScale"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "between:and:", 0.0, 1.0);
  v166 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Crossblur Dosido Large Scale"), CFSTR("crossblurDosidoLargeScale"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "between:and:", 0.0, 10.0);
  v165 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Crossblur Dosido Blur Radius"), CFSTR("crossblurDosidoBlurRadius"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "between:and:", 0.0, 100.0);
  v164 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Crossblur Rasterization Scale"), CFSTR("crossblurRasterizationScale"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "between:and:", 0.0, 5.0);
  v163 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Crossfade Dosido"), CFSTR("crossfadeDosidoSettings"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)MEMORY[0x1E0D83070];
  v280[0] = v210;
  v280[1] = v209;
  v280[2] = v208;
  v280[3] = v170;
  v280[4] = v169;
  v280[5] = v168;
  v280[6] = v166;
  v280[7] = v167;
  v280[8] = v165;
  v280[9] = v164;
  v280[10] = v163;
  v280[11] = v162;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v280, 12);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "sectionWithRows:title:", v43, CFSTR("Dosido"));
  v207 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Disable Async Rendering (Transition %)"), CFSTR("disableAsyncRenderingTransitionPercentage"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "minValue:maxValue:", 0.0, 1.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v279 = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v279, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sectionWithRows:", v47);
  v206 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Disallow Accelerated Home Button Press (Transition %)"), CFSTR("disallowAcceleratedHomeButtonPressTransitionPercentage"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "minValue:maxValue:", 0.0, 1.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v278 = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v278, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "sectionWithRows:", v51);
  v205 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Disable Tap During Morph From InApp View Transition Delay"), CFSTR("disableTapDuringMorphFromInAppViewTransitionDelay"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "minValue:maxValue:", 0.0, 1.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v277 = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v277, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "sectionWithRows:", v55);
  v204 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Alert Cardified Dismissal"), CFSTR("alertCardifiedDismissalSettings"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)MEMORY[0x1E0D83070];
  v276[0] = v161;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Alert Cardified Haptic Delay"), CFSTR("alertCardifiedDismissHapticDelay"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v276[1] = v57;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Alert Cardified Zoom Out Delay"), CFSTR("alertCardifiedDismissZoomOutDelay"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v276[2] = v58;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Alert Cardified Client Animations Delay"), CFSTR("alertCardifiedDismissClientAnimationsDelay"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v276[3] = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v276, 4);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "sectionWithRows:", v60);
  v203 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Alert Bar Swipe Dismissal"), CFSTR("alertBarSwipeDismissalSettings"));
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)MEMORY[0x1E0D83070];
  v275[0] = v160;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Alert Bar Swipe Haptic Delay"), CFSTR("alertBarSwipeDismissHapticDelay"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v275[1] = v62;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Alert Bar Swipe Zoom Out Delay"), CFSTR("alertBarSwipeDismissZoomOutDelay"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v275[2] = v63;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Alert Bar Swipe Client Animations Delay"), CFSTR("alertBarSwipeDismissClientAnimationsDelay"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v275[3] = v64;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v275, 4);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "sectionWithRows:", v65);
  v202 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Siri Swipe Dismissal"), CFSTR("siriSwipeDismissalSettings"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)MEMORY[0x1E0D83070];
  v274[0] = v159;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Siri Swipe Haptic Delay"), CFSTR("siriSwipeDismissHapticDelay"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v274[1] = v67;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Siri Swipe Zoom Out Delay"), CFSTR("siriSwipeDismissZoomOutDelay"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v274[2] = v68;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Siri Swipe Client Animations Delay"), CFSTR("siriSwipeDismissClientAnimationsDelay"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v274[3] = v69;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v274, 4);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "sectionWithRows:", v70);
  v200 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Reopen Button Initial Scale"), CFSTR("reopenButtonInitialScale"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "between:and:", 0.0, 1.0);
  v158 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Reopen Button Fade In Delay"), CFSTR("reopenButtonFadeInDelay"));
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Card Fly In"), CFSTR("reopenButtonScaleSettings"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)MEMORY[0x1E0D83070];
  v273[0] = v158;
  v273[1] = v157;
  v273[2] = v156;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v273, 3);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "sectionWithRows:", v73);
  v201 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Banner Unfurl"), CFSTR("bannerUnfurlSettings"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Banner Unfurl Wallpaper Alpha"), CFSTR("bannerUnfurlWallpaperAlphaSettings"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)MEMORY[0x1E0D83070];
  v272[0] = v155;
  v272[1] = v154;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v272, 2);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "sectionWithRows:", v75);
  v153 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Blur in Switcher"), CFSTR("homeScreenBlurInSwitcher"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "between:and:", 0.0, 1.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v78);

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Blur in Switcher (Reduce Motion Enabled)"), CFSTR("homeScreenBlurInSwitcherReduceMotionEnabled"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "between:and:", 0.0, 1.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v80);

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Blur in Application"), CFSTR("homeScreenBlurInApplication"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "between:and:", 0.0, 1.0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v82);

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Blur in Assistant"), CFSTR("homeScreenBlurInAssistant"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "between:and:", 0.0, 1.0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "precision:", 3);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v85);

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Opacity in Switcher"), CFSTR("homeScreenOpacityInSwitcher"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "between:and:", 0.0, 1.0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v87);

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Opacity in Application"), CFSTR("homeScreenOpacityInApplication"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "between:and:", 0.0, 1.0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v89);

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Scale in Switcher"), CFSTR("homeScreenScaleInSwitcher"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "between:and:", 0.0, 2.0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v91);

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Scale in Application"), CFSTR("homeScreenScaleInApplication"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "between:and:", 0.0, 2.0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v93);

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Scale in Assistant"), CFSTR("homeScreenScaleInAssistant"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "between:and:", 0.0, 2.0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v95);

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Wallpaper Scale in Switcher"), CFSTR("wallpaperScaleInSwitcher"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "between:and:", 0.0, 2.0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v97);

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Wallpaper Scale in Application"), CFSTR("wallpaperScaleInApplication"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "between:and:", 0.0, 2.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v99);

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Dimming Alpha in Switcher"), CFSTR("dimmingAlphaInSwitcher"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "between:and:", 0.0, 1.0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v101);

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Dimming Alpha in Application"), CFSTR("dimmingAlphaInApplication"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "between:and:", 0.0, 1.0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v103);

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("RM Crossfade Duration"), CFSTR("reduceMotionCrossfadeDuration"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "between:and:", 0.0, 1.0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v105);

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:", v76);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "rowWithTitle:action:", CFSTR("Restore Defaults"), v107);
  v152 = (void *)objc_claimAutoreleasedReturnValue();

  v108 = (void *)MEMORY[0x1E0D83070];
  v271 = v152;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v271, 1);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "sectionWithRows:", v109);
  v198 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Icon Hide Delay"), CFSTR("iconZoomFloatingDockFadeDelay"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = (void *)MEMORY[0x1E0D83070];
  v270 = v151;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v270, 1);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "sectionWithRows:", v111);
  v141 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Empty Switcher Dismiss Delay"), CFSTR("emptySwitcherDismissDelay"));
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = (void *)MEMORY[0x1E0D83070];
  v269 = v150;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v269, 1);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "sectionWithRows:", v113);
  v147 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Resize Blur Delay"), CFSTR("resizeBlurDelay"));
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = (void *)MEMORY[0x1E0D83070];
  v268 = v149;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v268, 1);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "sectionWithRows:", v115);
  v146 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Title & Icon Fade In Slowness Factor"), CFSTR("appSwitcherTitleAndIconFadeInSlowDownFactor"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "between:and:", 1.0, 10.0);
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  v117 = (void *)MEMORY[0x1E0D83070];
  v267 = v148;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v267, 1);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "sectionWithRows:", v118);
  v142 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Pulse"), CFSTR("pulseScaleSettings"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Pulse Scale"), CFSTR("pulseScale"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "between:and:", 0.0, 1.0);
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Pulse Second Stage Delay"), CFSTR("pulseSecondStageDelay"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "between:and:", 0.0, 1.0);
  v143 = (void *)objc_claimAutoreleasedReturnValue();

  v121 = (void *)MEMORY[0x1E0D83070];
  v266[0] = v145;
  v266[1] = v144;
  v266[2] = v143;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v266, 3);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "sectionWithRows:", v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Initial Blur"), CFSTR("homeScreenCenterZoomInitialBlur"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "between:and:", 0.0, 200.0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Initial Scale"), CFSTR("homeScreenCenterZoomInitialScale"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "between:and:", 0.0, 1.0);
  v139 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Initial Opacity"), CFSTR("homeScreenCenterZoomInitialOpacity"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "between:and:", 0.0, 1.0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Target Scale Unblur Complete"), CFSTR("homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "between:and:", 0.0, 1.0);
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Y Off Percent ScreenHeight"), CFSTR("homeScreenCenterZoomYOffsetPercentOfScreenHeight"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "between:and:", -1.0, 1.0);
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  v131 = (void *)MEMORY[0x1E0D83070];
  v265[0] = v140;
  v265[1] = v139;
  v265[2] = v138;
  v265[3] = v128;
  v265[4] = v130;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v265, 5);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "sectionWithRows:title:", v132, CFSTR("Home Screen Center Zoom"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  v134 = (void *)MEMORY[0x1E0D83070];
  v264[0] = v198;
  v264[1] = v245;
  v264[2] = v244;
  v264[3] = v243;
  v264[4] = v242;
  v264[5] = v212;
  v264[6] = v211;
  v264[7] = v207;
  v264[8] = v199;
  v264[9] = v141;
  v264[10] = v147;
  v264[11] = v146;
  v264[12] = v142;
  v264[13] = v206;
  v264[14] = v205;
  v264[15] = v204;
  v264[16] = v203;
  v264[17] = v202;
  v264[18] = v200;
  v264[19] = v201;
  v264[20] = v153;
  v264[21] = v123;
  v264[22] = v133;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v264, 23);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "moduleWithTitle:contents:", CFSTR("Deck Switcher Behaviors"), v135);
  v136 = (void *)objc_claimAutoreleasedReturnValue();

  return v136;
}

- (void)setLayoutSettings:(id)a3
{
  objc_storeStrong((id *)&self->_layoutSettings, a3);
}

- (SBFFluidBehaviorSettings)zoomUpSettings
{
  return self->_zoomUpSettings;
}

- (void)setZoomUpSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomUpSettings, a3);
}

- (SBFFluidBehaviorSettings)iconZoomDownSettings
{
  return self->_iconZoomDownSettings;
}

- (void)setIconZoomDownSettings:(id)a3
{
  objc_storeStrong((id *)&self->_iconZoomDownSettings, a3);
}

- (SBFFluidBehaviorSettings)floatingDockIconFadeSettings
{
  return self->_floatingDockIconFadeSettings;
}

- (void)setFloatingDockIconFadeSettings:(id)a3
{
  objc_storeStrong((id *)&self->_floatingDockIconFadeSettings, a3);
}

- (SBFFluidBehaviorSettings)switcherZoomDownIconFadeOutSettings
{
  return self->_switcherZoomDownIconFadeOutSettings;
}

- (void)setSwitcherZoomDownIconFadeOutSettings:(id)a3
{
  objc_storeStrong((id *)&self->_switcherZoomDownIconFadeOutSettings, a3);
}

- (SBFFluidBehaviorSettings)iconFadeInSettings
{
  return self->_iconFadeInSettings;
}

- (void)setIconFadeInSettings:(id)a3
{
  objc_storeStrong((id *)&self->_iconFadeInSettings, a3);
}

- (SBFFluidBehaviorSettings)switcherFadeOutSettings
{
  return self->_switcherFadeOutSettings;
}

- (void)setSwitcherFadeOutSettings:(id)a3
{
  objc_storeStrong((id *)&self->_switcherFadeOutSettings, a3);
}

- (SBFFluidBehaviorSettings)centerZoomSettings
{
  return self->_centerZoomSettings;
}

- (void)setCenterZoomSettings:(id)a3
{
  objc_storeStrong((id *)&self->_centerZoomSettings, a3);
}

- (SBFFluidBehaviorSettings)slideOverSettings
{
  return self->_slideOverSettings;
}

- (void)setSlideOverSettings:(id)a3
{
  objc_storeStrong((id *)&self->_slideOverSettings, a3);
}

- (SBFFluidBehaviorSettings)switcherToHomeSettings
{
  return self->_switcherToHomeSettings;
}

- (void)setSwitcherToHomeSettings:(id)a3
{
  objc_storeStrong((id *)&self->_switcherToHomeSettings, a3);
}

- (SBFFluidBehaviorSettings)switcherToHomeOpacitySettings
{
  return self->_switcherToHomeOpacitySettings;
}

- (void)setSwitcherToHomeOpacitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_switcherToHomeOpacitySettings, a3);
}

- (SBFFluidBehaviorSettings)toggleAppSwitcherSettings
{
  return self->_toggleAppSwitcherSettings;
}

- (void)setToggleAppSwitcherSettings:(id)a3
{
  objc_storeStrong((id *)&self->_toggleAppSwitcherSettings, a3);
}

- (SBFFluidBehaviorSettings)launchAppFromSwitcherSettings
{
  return self->_launchAppFromSwitcherSettings;
}

- (void)setLaunchAppFromSwitcherSettings:(id)a3
{
  objc_storeStrong((id *)&self->_launchAppFromSwitcherSettings, a3);
}

- (SBFFluidBehaviorSettings)continuityBannerSlideUpSettings
{
  return self->_continuityBannerSlideUpSettings;
}

- (void)setContinuityBannerSlideUpSettings:(id)a3
{
  objc_storeStrong((id *)&self->_continuityBannerSlideUpSettings, a3);
}

- (SBFFluidBehaviorSettings)stackedSwitcherTrackingSettings
{
  return self->_stackedSwitcherTrackingSettings;
}

- (void)setStackedSwitcherTrackingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_stackedSwitcherTrackingSettings, a3);
}

- (BOOL)performTwoPhaseFullScreenToPeekTransition
{
  return self->_performTwoPhaseFullScreenToPeekTransition;
}

- (void)setPerformTwoPhaseFullScreenToPeekTransition:(BOOL)a3
{
  self->_performTwoPhaseFullScreenToPeekTransition = a3;
}

- (SBFFluidBehaviorSettings)fullScreenToPeekFirstPhaseAnimationSettings
{
  return self->_fullScreenToPeekFirstPhaseAnimationSettings;
}

- (void)setFullScreenToPeekFirstPhaseAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_fullScreenToPeekFirstPhaseAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)fullScreenToPeekSecondPhaseAnimationSettings
{
  return self->_fullScreenToPeekSecondPhaseAnimationSettings;
}

- (void)setFullScreenToPeekSecondPhaseAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_fullScreenToPeekSecondPhaseAnimationSettings, a3);
}

- (double)fullScreenToPeekSecondPhaseAnimationDelay
{
  return self->_fullScreenToPeekSecondPhaseAnimationDelay;
}

- (void)setFullScreenToPeekSecondPhaseAnimationDelay:(double)a3
{
  self->_fullScreenToPeekSecondPhaseAnimationDelay = a3;
}

- (SBFFluidBehaviorSettings)splitViewToSlideOverSettings
{
  return self->_splitViewToSlideOverSettings;
}

- (void)setSplitViewToSlideOverSettings:(id)a3
{
  objc_storeStrong((id *)&self->_splitViewToSlideOverSettings, a3);
}

- (SBFFluidBehaviorSettings)slideOverToFullScreenAnimationSettings
{
  return self->_slideOverToFullScreenAnimationSettings;
}

- (void)setSlideOverToFullScreenAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_slideOverToFullScreenAnimationSettings, a3);
}

- (double)slideOverToFullScreenOutgoingAppScaleBack
{
  return self->_slideOverToFullScreenOutgoingAppScaleBack;
}

- (void)setSlideOverToFullScreenOutgoingAppScaleBack:(double)a3
{
  self->_slideOverToFullScreenOutgoingAppScaleBack = a3;
}

- (double)slideOverToFullScreenOutgoingFinalOpacity
{
  return self->_slideOverToFullScreenOutgoingFinalOpacity;
}

- (void)setSlideOverToFullScreenOutgoingFinalOpacity:(double)a3
{
  self->_slideOverToFullScreenOutgoingFinalOpacity = a3;
}

- (SBFFluidBehaviorSettings)centerToSlideOverAnimationSettings
{
  return self->_centerToSlideOverAnimationSettings;
}

- (void)setCenterToSlideOverAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_centerToSlideOverAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)swapAppSidesLayoutAnimationSettings
{
  return self->_swapAppSidesLayoutAnimationSettings;
}

- (void)setSwapAppSidesLayoutAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_swapAppSidesLayoutAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)swapAppSidesOpacityAnimationSettings
{
  return self->_swapAppSidesOpacityAnimationSettings;
}

- (void)setSwapAppSidesOpacityAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_swapAppSidesOpacityAnimationSettings, a3);
}

- (double)swapAppSidesShadowFadeOutDelay
{
  return self->_swapAppSidesShadowFadeOutDelay;
}

- (void)setSwapAppSidesShadowFadeOutDelay:(double)a3
{
  self->_swapAppSidesShadowFadeOutDelay = a3;
}

- (void)setHomeGestureCenterRowZoomUpSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureCenterRowZoomUpSettings, a3);
}

- (void)setHomeGestureEdgeRowZoomUpSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureEdgeRowZoomUpSettings, a3);
}

- (SBFFluidBehaviorSettings)homeGestureTopRowZoomDownLayoutSettings
{
  return self->_homeGestureTopRowZoomDownLayoutSettings;
}

- (void)setHomeGestureTopRowZoomDownLayoutSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureTopRowZoomDownLayoutSettings, a3);
}

- (SBFFluidBehaviorSettings)homeGestureTopRowZoomDownPositionSettings
{
  return self->_homeGestureTopRowZoomDownPositionSettings;
}

- (void)setHomeGestureTopRowZoomDownPositionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureTopRowZoomDownPositionSettings, a3);
}

- (SBFFluidBehaviorSettings)homeGestureTopRowZoomDownScaleSettings
{
  return self->_homeGestureTopRowZoomDownScaleSettings;
}

- (void)setHomeGestureTopRowZoomDownScaleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureTopRowZoomDownScaleSettings, a3);
}

- (SBFFluidBehaviorSettings)homeGestureBottomRowZoomDownLayoutSettings
{
  return self->_homeGestureBottomRowZoomDownLayoutSettings;
}

- (void)setHomeGestureBottomRowZoomDownLayoutSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureBottomRowZoomDownLayoutSettings, a3);
}

- (SBFFluidBehaviorSettings)homeGestureBottomRowZoomDownPositionSettings
{
  return self->_homeGestureBottomRowZoomDownPositionSettings;
}

- (void)setHomeGestureBottomRowZoomDownPositionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureBottomRowZoomDownPositionSettings, a3);
}

- (SBFFluidBehaviorSettings)homeGestureBottomRowZoomDownScaleSettings
{
  return self->_homeGestureBottomRowZoomDownScaleSettings;
}

- (void)setHomeGestureBottomRowZoomDownScaleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureBottomRowZoomDownScaleSettings, a3);
}

- (SBFFluidBehaviorSettings)homeGestureSmallWidgetZoomDownLayoutSettings
{
  return self->_homeGestureSmallWidgetZoomDownLayoutSettings;
}

- (void)setHomeGestureSmallWidgetZoomDownLayoutSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureSmallWidgetZoomDownLayoutSettings, a3);
}

- (SBFFluidBehaviorSettings)homeGestureSmallWidgetZoomDownPositionSettings
{
  return self->_homeGestureSmallWidgetZoomDownPositionSettings;
}

- (void)setHomeGestureSmallWidgetZoomDownPositionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureSmallWidgetZoomDownPositionSettings, a3);
}

- (SBFFluidBehaviorSettings)homeGestureSmallWidgetZoomDownScaleSettings
{
  return self->_homeGestureSmallWidgetZoomDownScaleSettings;
}

- (void)setHomeGestureSmallWidgetZoomDownScaleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureSmallWidgetZoomDownScaleSettings, a3);
}

- (SBFFluidBehaviorSettings)homeGestureMediumWidgetZoomDownLayoutSettings
{
  return self->_homeGestureMediumWidgetZoomDownLayoutSettings;
}

- (void)setHomeGestureMediumWidgetZoomDownLayoutSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureMediumWidgetZoomDownLayoutSettings, a3);
}

- (SBFFluidBehaviorSettings)homeGestureMediumWidgetZoomDownPositionSettings
{
  return self->_homeGestureMediumWidgetZoomDownPositionSettings;
}

- (void)setHomeGestureMediumWidgetZoomDownPositionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureMediumWidgetZoomDownPositionSettings, a3);
}

- (SBFFluidBehaviorSettings)homeGestureMediumWidgetZoomDownScaleSettings
{
  return self->_homeGestureMediumWidgetZoomDownScaleSettings;
}

- (void)setHomeGestureMediumWidgetZoomDownScaleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureMediumWidgetZoomDownScaleSettings, a3);
}

- (SBFFluidBehaviorSettings)homeGestureLargeWidgetZoomDownLayoutSettings
{
  return self->_homeGestureLargeWidgetZoomDownLayoutSettings;
}

- (void)setHomeGestureLargeWidgetZoomDownLayoutSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureLargeWidgetZoomDownLayoutSettings, a3);
}

- (SBFFluidBehaviorSettings)homeGestureLargeWidgetZoomDownPositionSettings
{
  return self->_homeGestureLargeWidgetZoomDownPositionSettings;
}

- (void)setHomeGestureLargeWidgetZoomDownPositionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureLargeWidgetZoomDownPositionSettings, a3);
}

- (SBFFluidBehaviorSettings)homeGestureLargeWidgetZoomDownScaleSettings
{
  return self->_homeGestureLargeWidgetZoomDownScaleSettings;
}

- (void)setHomeGestureLargeWidgetZoomDownScaleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureLargeWidgetZoomDownScaleSettings, a3);
}

- (double)zoomDownWidgetScaleVelocityYMinimum
{
  return self->_zoomDownWidgetScaleVelocityYMinimum;
}

- (void)setZoomDownWidgetScaleVelocityYMinimum:(double)a3
{
  self->_zoomDownWidgetScaleVelocityYMinimum = a3;
}

- (double)zoomDownWidgetScaleVelocityYMaximum
{
  return self->_zoomDownWidgetScaleVelocityYMaximum;
}

- (void)setZoomDownWidgetScaleVelocityYMaximum:(double)a3
{
  self->_zoomDownWidgetScaleVelocityYMaximum = a3;
}

- (double)zoomDownWidgetScaleOvershootMinimumMultiplier
{
  return self->_zoomDownWidgetScaleOvershootMinimumMultiplier;
}

- (void)setZoomDownWidgetScaleOvershootMinimumMultiplier:(double)a3
{
  self->_zoomDownWidgetScaleOvershootMinimumMultiplier = a3;
}

- (double)zoomDownWidgetScaleOvershootMaximumMultiplier
{
  return self->_zoomDownWidgetScaleOvershootMaximumMultiplier;
}

- (void)setZoomDownWidgetScaleOvershootMaximumMultiplier:(double)a3
{
  self->_zoomDownWidgetScaleOvershootMaximumMultiplier = a3;
}

- (double)zoomDownWidgetScaleOvershootDuration
{
  return self->_zoomDownWidgetScaleOvershootDuration;
}

- (void)setZoomDownWidgetScaleOvershootDuration:(double)a3
{
  self->_zoomDownWidgetScaleOvershootDuration = a3;
}

- (SBFFluidBehaviorSettings)arcSwipeSettings
{
  return self->_arcSwipeSettings;
}

- (void)setArcSwipeSettings:(id)a3
{
  objc_storeStrong((id *)&self->_arcSwipeSettings, a3);
}

- (SBFFluidBehaviorSettings)arcSwipeSwitcherGlancingSettings
{
  return self->_arcSwipeSwitcherGlancingSettings;
}

- (void)setArcSwipeSwitcherGlancingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_arcSwipeSwitcherGlancingSettings, a3);
}

- (SBFFluidBehaviorSettings)appToSwitcherCornerRadiusSettings
{
  return self->_appToSwitcherCornerRadiusSettings;
}

- (void)setAppToSwitcherCornerRadiusSettings:(id)a3
{
  objc_storeStrong((id *)&self->_appToSwitcherCornerRadiusSettings, a3);
}

- (SBFFluidBehaviorSettings)gestureInitiatedAppToSwitcherSettings
{
  return self->_gestureInitiatedAppToSwitcherSettings;
}

- (void)setGestureInitiatedAppToSwitcherSettings:(id)a3
{
  objc_storeStrong((id *)&self->_gestureInitiatedAppToSwitcherSettings, a3);
}

- (SBFFluidBehaviorSettings)cardFlyInSettings
{
  return self->_cardFlyInSettings;
}

- (void)setCardFlyInSettings:(id)a3
{
  objc_storeStrong((id *)&self->_cardFlyInSettings, a3);
}

- (double)cardFlyInAccelerationDipThreshold
{
  return self->_cardFlyInAccelerationDipThreshold;
}

- (void)setCardFlyInAccelerationDipThreshold:(double)a3
{
  self->_cardFlyInAccelerationDipThreshold = a3;
}

- (int64_t)minimumTouchSamplesForAccelerationDip
{
  return self->_minimumTouchSamplesForAccelerationDip;
}

- (void)setMinimumTouchSamplesForAccelerationDip:(int64_t)a3
{
  self->_minimumTouchSamplesForAccelerationDip = a3;
}

- (SBFFluidBehaviorSettings)reduceMotionArcSwipeSettings
{
  return self->_reduceMotionArcSwipeSettings;
}

- (void)setReduceMotionArcSwipeSettings:(id)a3
{
  objc_storeStrong((id *)&self->_reduceMotionArcSwipeSettings, a3);
}

- (SBFFluidBehaviorSettings)reduceMotionAppToSwitcherSettings
{
  return self->_reduceMotionAppToSwitcherSettings;
}

- (void)setReduceMotionAppToSwitcherSettings:(id)a3
{
  objc_storeStrong((id *)&self->_reduceMotionAppToSwitcherSettings, a3);
}

- (double)reduceMotionTriggerDelay
{
  return self->_reduceMotionTriggerDelay;
}

- (void)setReduceMotionTriggerDelay:(double)a3
{
  self->_reduceMotionTriggerDelay = a3;
}

- (double)zoomDownVelocityYMinimum
{
  return self->_zoomDownVelocityYMinimum;
}

- (void)setZoomDownVelocityYMinimum:(double)a3
{
  self->_zoomDownVelocityYMinimum = a3;
}

- (double)zoomDownVelocityYMaximum
{
  return self->_zoomDownVelocityYMaximum;
}

- (void)setZoomDownVelocityYMaximum:(double)a3
{
  self->_zoomDownVelocityYMaximum = a3;
}

- (double)zoomDownVelocityYLayoutResponseMultiplier
{
  return self->_zoomDownVelocityYLayoutResponseMultiplier;
}

- (void)setZoomDownVelocityYLayoutResponseMultiplier:(double)a3
{
  self->_zoomDownVelocityYLayoutResponseMultiplier = a3;
}

- (double)zoomDownVelocityXMinimum
{
  return self->_zoomDownVelocityXMinimum;
}

- (void)setZoomDownVelocityXMinimum:(double)a3
{
  self->_zoomDownVelocityXMinimum = a3;
}

- (double)zoomDownVelocityXMaximum
{
  return self->_zoomDownVelocityXMaximum;
}

- (void)setZoomDownVelocityXMaximum:(double)a3
{
  self->_zoomDownVelocityXMaximum = a3;
}

- (double)zoomDownVelocityXPositionResponseMultiplier
{
  return self->_zoomDownVelocityXPositionResponseMultiplier;
}

- (void)setZoomDownVelocityXPositionResponseMultiplier:(double)a3
{
  self->_zoomDownVelocityXPositionResponseMultiplier = a3;
}

- (double)appToSwitcherTransitionMinCardScaleFactor
{
  return self->_appToSwitcherTransitionMinCardScaleFactor;
}

- (void)setAppToSwitcherTransitionMinCardScaleFactor:(double)a3
{
  self->_appToSwitcherTransitionMinCardScaleFactor = a3;
}

- (BOOL)allowIconZoomFromMediumWidgets
{
  return self->_allowIconZoomFromMediumWidgets;
}

- (void)setAllowIconZoomFromMediumWidgets:(BOOL)a3
{
  self->_allowIconZoomFromMediumWidgets = a3;
}

- (BOOL)allowIconZoomFromLargeWidgets
{
  return self->_allowIconZoomFromLargeWidgets;
}

- (void)setAllowIconZoomFromLargeWidgets:(BOOL)a3
{
  self->_allowIconZoomFromLargeWidgets = a3;
}

- (SBFFluidBehaviorSettings)dosidoSettings
{
  return self->_dosidoSettings;
}

- (void)setDosidoSettings:(id)a3
{
  objc_storeStrong((id *)&self->_dosidoSettings, a3);
}

- (SBFFluidBehaviorSettings)dosidoScaleDownSettings
{
  return self->_dosidoScaleDownSettings;
}

- (void)setDosidoScaleDownSettings:(id)a3
{
  objc_storeStrong((id *)&self->_dosidoScaleDownSettings, a3);
}

- (SBFFluidBehaviorSettings)dosidoScaleUpSettings
{
  return self->_dosidoScaleUpSettings;
}

- (void)setDosidoScaleUpSettings:(id)a3
{
  objc_storeStrong((id *)&self->_dosidoScaleUpSettings, a3);
}

- (double)dosidoScale
{
  return self->_dosidoScale;
}

- (void)setDosidoScale:(double)a3
{
  self->_dosidoScale = a3;
}

- (double)dosidoScaleUpDelay
{
  return self->_dosidoScaleUpDelay;
}

- (void)setDosidoScaleUpDelay:(double)a3
{
  self->_dosidoScaleUpDelay = a3;
}

- (void)setCrossblurDosidoSettings:(id)a3
{
  objc_storeStrong((id *)&self->_crossblurDosidoSettings, a3);
}

- (double)crossblurDosidoCenterZoomUpSmallScale
{
  return self->_crossblurDosidoCenterZoomUpSmallScale;
}

- (void)setCrossblurDosidoCenterZoomUpSmallScale:(double)a3
{
  self->_crossblurDosidoCenterZoomUpSmallScale = a3;
}

- (void)setCrossblurDosidoSmallScale:(double)a3
{
  self->_crossblurDosidoSmallScale = a3;
}

- (double)crossblurDosidoLargeScale
{
  return self->_crossblurDosidoLargeScale;
}

- (void)setCrossblurDosidoLargeScale:(double)a3
{
  self->_crossblurDosidoLargeScale = a3;
}

- (void)setCrossblurDosidoBlurRadius:(double)a3
{
  self->_crossblurDosidoBlurRadius = a3;
}

- (void)setCrossblurRasterizationScale:(double)a3
{
  self->_crossblurRasterizationScale = a3;
}

- (SBFFluidBehaviorSettings)crossfadeDosidoSettings
{
  return self->_crossfadeDosidoSettings;
}

- (void)setCrossfadeDosidoSettings:(id)a3
{
  objc_storeStrong((id *)&self->_crossfadeDosidoSettings, a3);
}

- (SBFFluidBehaviorSettings)slideUpSettings
{
  return self->_slideUpSettings;
}

- (void)setSlideUpSettings:(id)a3
{
  objc_storeStrong((id *)&self->_slideUpSettings, a3);
}

- (void)setBackdropBlurSettings:(id)a3
{
  objc_storeStrong((id *)&self->_backdropBlurSettings, a3);
}

- (void)setHomeScreenOpacitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeScreenOpacitySettings, a3);
}

- (void)setHomeScreenScaleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeScreenScaleSettings, a3);
}

- (void)setOpacitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_opacitySettings, a3);
}

- (SBFFluidBehaviorSettings)centerZoomOpacitySettings
{
  return self->_centerZoomOpacitySettings;
}

- (void)setCenterZoomOpacitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_centerZoomOpacitySettings, a3);
}

- (SBFFluidBehaviorSettings)swipeToKillOpacitySettings
{
  return self->_swipeToKillOpacitySettings;
}

- (void)setSwipeToKillOpacitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_swipeToKillOpacitySettings, a3);
}

- (void)setWallpaperScaleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperScaleSettings, a3);
}

- (SBFFluidBehaviorSettings)appSelectionSquishSettings
{
  return self->_appSelectionSquishSettings;
}

- (void)setAppSelectionSquishSettings:(id)a3
{
  objc_storeStrong((id *)&self->_appSelectionSquishSettings, a3);
}

- (void)setStatusBarFadeInSettings:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarFadeInSettings, a3);
}

- (void)setStatusBarFadeOutSettings:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarFadeOutSettings, a3);
}

- (double)statusBarToApexBounceAnimationDuration
{
  return self->_statusBarToApexBounceAnimationDuration;
}

- (void)setStatusBarToApexBounceAnimationDuration:(double)a3
{
  self->_statusBarToApexBounceAnimationDuration = a3;
}

- (double)statusBarFromApexBounceAnimationDuration
{
  return self->_statusBarFromApexBounceAnimationDuration;
}

- (void)setStatusBarFromApexBounceAnimationDuration:(double)a3
{
  self->_statusBarFromApexBounceAnimationDuration = a3;
}

- (SBFFluidBehaviorSettings)alertCardifiedDismissalSettings
{
  return self->_alertCardifiedDismissalSettings;
}

- (void)setAlertCardifiedDismissalSettings:(id)a3
{
  objc_storeStrong((id *)&self->_alertCardifiedDismissalSettings, a3);
}

- (double)alertCardifiedDismissHapticDelay
{
  return self->_alertCardifiedDismissHapticDelay;
}

- (void)setAlertCardifiedDismissHapticDelay:(double)a3
{
  self->_alertCardifiedDismissHapticDelay = a3;
}

- (double)alertCardifiedDismissZoomOutDelay
{
  return self->_alertCardifiedDismissZoomOutDelay;
}

- (void)setAlertCardifiedDismissZoomOutDelay:(double)a3
{
  self->_alertCardifiedDismissZoomOutDelay = a3;
}

- (double)alertCardifiedDismissClientAnimationsDelay
{
  return self->_alertCardifiedDismissClientAnimationsDelay;
}

- (void)setAlertCardifiedDismissClientAnimationsDelay:(double)a3
{
  self->_alertCardifiedDismissClientAnimationsDelay = a3;
}

- (SBFFluidBehaviorSettings)alertBarSwipeDismissalSettings
{
  return self->_alertBarSwipeDismissalSettings;
}

- (void)setAlertBarSwipeDismissalSettings:(id)a3
{
  objc_storeStrong((id *)&self->_alertBarSwipeDismissalSettings, a3);
}

- (double)alertBarSwipeDismissHapticDelay
{
  return self->_alertBarSwipeDismissHapticDelay;
}

- (void)setAlertBarSwipeDismissHapticDelay:(double)a3
{
  self->_alertBarSwipeDismissHapticDelay = a3;
}

- (double)alertBarSwipeDismissZoomOutDelay
{
  return self->_alertBarSwipeDismissZoomOutDelay;
}

- (void)setAlertBarSwipeDismissZoomOutDelay:(double)a3
{
  self->_alertBarSwipeDismissZoomOutDelay = a3;
}

- (double)alertBarSwipeDismissClientAnimationsDelay
{
  return self->_alertBarSwipeDismissClientAnimationsDelay;
}

- (void)setAlertBarSwipeDismissClientAnimationsDelay:(double)a3
{
  self->_alertBarSwipeDismissClientAnimationsDelay = a3;
}

- (SBFFluidBehaviorSettings)siriSwipeDismissalSettings
{
  return self->_siriSwipeDismissalSettings;
}

- (void)setSiriSwipeDismissalSettings:(id)a3
{
  objc_storeStrong((id *)&self->_siriSwipeDismissalSettings, a3);
}

- (double)siriSwipeDismissHapticDelay
{
  return self->_siriSwipeDismissHapticDelay;
}

- (void)setSiriSwipeDismissHapticDelay:(double)a3
{
  self->_siriSwipeDismissHapticDelay = a3;
}

- (double)siriSwipeDismissZoomOutDelay
{
  return self->_siriSwipeDismissZoomOutDelay;
}

- (void)setSiriSwipeDismissZoomOutDelay:(double)a3
{
  self->_siriSwipeDismissZoomOutDelay = a3;
}

- (double)siriSwipeDismissClientAnimationsDelay
{
  return self->_siriSwipeDismissClientAnimationsDelay;
}

- (void)setSiriSwipeDismissClientAnimationsDelay:(double)a3
{
  self->_siriSwipeDismissClientAnimationsDelay = a3;
}

- (SBFFluidBehaviorSettings)reopenButtonScaleSettings
{
  return self->_reopenButtonScaleSettings;
}

- (void)setReopenButtonScaleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_reopenButtonScaleSettings, a3);
}

- (double)reopenButtonInitialScale
{
  return self->_reopenButtonInitialScale;
}

- (void)setReopenButtonInitialScale:(double)a3
{
  self->_reopenButtonInitialScale = a3;
}

- (double)reopenButtonFadeInDelay
{
  return self->_reopenButtonFadeInDelay;
}

- (void)setReopenButtonFadeInDelay:(double)a3
{
  self->_reopenButtonFadeInDelay = a3;
}

- (SBFFluidBehaviorSettings)bannerUnfurlSettings
{
  return self->_bannerUnfurlSettings;
}

- (void)setBannerUnfurlSettings:(id)a3
{
  objc_storeStrong((id *)&self->_bannerUnfurlSettings, a3);
}

- (SBFFluidBehaviorSettings)bannerUnfurlWallpaperAlphaSettings
{
  return self->_bannerUnfurlWallpaperAlphaSettings;
}

- (void)setBannerUnfurlWallpaperAlphaSettings:(id)a3
{
  objc_storeStrong((id *)&self->_bannerUnfurlWallpaperAlphaSettings, a3);
}

- (double)bannerUnfurlWallpaperAlphaDelay
{
  return self->_bannerUnfurlWallpaperAlphaDelay;
}

- (void)setBannerUnfurlWallpaperAlphaDelay:(double)a3
{
  self->_bannerUnfurlWallpaperAlphaDelay = a3;
}

- (SBFFluidBehaviorSettings)pulseScaleSettings
{
  return self->_pulseScaleSettings;
}

- (void)setPulseScaleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_pulseScaleSettings, a3);
}

- (double)pulseScale
{
  return self->_pulseScale;
}

- (void)setPulseScale:(double)a3
{
  self->_pulseScale = a3;
}

- (double)pulseSecondStageDelay
{
  return self->_pulseSecondStageDelay;
}

- (void)setPulseSecondStageDelay:(double)a3
{
  self->_pulseSecondStageDelay = a3;
}

- (void)setDisableAsyncRenderingTransitionPercentage:(double)a3
{
  self->_disableAsyncRenderingTransitionPercentage = a3;
}

- (void)setDisallowAcceleratedHomeButtonPressTransitionPercentage:(double)a3
{
  self->_disallowAcceleratedHomeButtonPressTransitionPercentage = a3;
}

- (double)disableTapDuringMorphFromInAppViewTransitionDelay
{
  return self->_disableTapDuringMorphFromInAppViewTransitionDelay;
}

- (void)setDisableTapDuringMorphFromInAppViewTransitionDelay:(double)a3
{
  self->_disableTapDuringMorphFromInAppViewTransitionDelay = a3;
}

- (double)centerZoomScale
{
  return self->_centerZoomScale;
}

- (void)setCenterZoomScale:(double)a3
{
  self->_centerZoomScale = a3;
}

- (double)homeScreenBlurInSwitcher
{
  return self->_homeScreenBlurInSwitcher;
}

- (void)setHomeScreenBlurInSwitcher:(double)a3
{
  self->_homeScreenBlurInSwitcher = a3;
}

- (double)homeScreenBlurInSwitcherReduceMotionEnabled
{
  return self->_homeScreenBlurInSwitcherReduceMotionEnabled;
}

- (void)setHomeScreenBlurInSwitcherReduceMotionEnabled:(double)a3
{
  self->_homeScreenBlurInSwitcherReduceMotionEnabled = a3;
}

- (void)setHomeScreenBlurInApplication:(double)a3
{
  self->_homeScreenBlurInApplication = a3;
}

- (double)homeScreenBlurInAssistant
{
  return self->_homeScreenBlurInAssistant;
}

- (void)setHomeScreenBlurInAssistant:(double)a3
{
  self->_homeScreenBlurInAssistant = a3;
}

- (double)homeScreenOpacityInSwitcher
{
  return self->_homeScreenOpacityInSwitcher;
}

- (void)setHomeScreenOpacityInSwitcher:(double)a3
{
  self->_homeScreenOpacityInSwitcher = a3;
}

- (void)setHomeScreenOpacityInApplication:(double)a3
{
  self->_homeScreenOpacityInApplication = a3;
}

- (void)setHomeScreenScaleInSwitcher:(double)a3
{
  self->_homeScreenScaleInSwitcher = a3;
}

- (void)setHomeScreenScaleInApplication:(double)a3
{
  self->_homeScreenScaleInApplication = a3;
}

- (double)homeScreenScaleInAssistant
{
  return self->_homeScreenScaleInAssistant;
}

- (void)setHomeScreenScaleInAssistant:(double)a3
{
  self->_homeScreenScaleInAssistant = a3;
}

- (double)wallpaperScaleInSwitcher
{
  return self->_wallpaperScaleInSwitcher;
}

- (void)setWallpaperScaleInSwitcher:(double)a3
{
  self->_wallpaperScaleInSwitcher = a3;
}

- (void)setWallpaperScaleInApplication:(double)a3
{
  self->_wallpaperScaleInApplication = a3;
}

- (double)dimmingAlphaInSwitcher
{
  return self->_dimmingAlphaInSwitcher;
}

- (void)setDimmingAlphaInSwitcher:(double)a3
{
  self->_dimmingAlphaInSwitcher = a3;
}

- (void)setDimmingAlphaInApplication:(double)a3
{
  self->_dimmingAlphaInApplication = a3;
}

- (double)dockHurdlingIconZoomInitialVelocity
{
  return self->_dockHurdlingIconZoomInitialVelocity;
}

- (void)setDockHurdlingIconZoomInitialVelocity:(double)a3
{
  self->_dockHurdlingIconZoomInitialVelocity = a3;
}

- (double)dockHurdlingIconZoomDockToBackTiming
{
  return self->_dockHurdlingIconZoomDockToBackTiming;
}

- (void)setDockHurdlingIconZoomDockToBackTiming:(double)a3
{
  self->_dockHurdlingIconZoomDockToBackTiming = a3;
}

- (double)dockHurdlingIconZoomDockToFrontTiming
{
  return self->_dockHurdlingIconZoomDockToFrontTiming;
}

- (void)setDockHurdlingIconZoomDockToFrontTiming:(double)a3
{
  self->_dockHurdlingIconZoomDockToFrontTiming = a3;
}

- (double)reduceMotionCrossfadeDuration
{
  return self->_reduceMotionCrossfadeDuration;
}

- (void)setReduceMotionCrossfadeDuration:(double)a3
{
  self->_reduceMotionCrossfadeDuration = a3;
}

- (double)iconZoomFloatingDockFadeDelay
{
  return self->_iconZoomFloatingDockFadeDelay;
}

- (void)setIconZoomFloatingDockFadeDelay:(double)a3
{
  self->_iconZoomFloatingDockFadeDelay = a3;
}

- (double)emptySwitcherDismissDelay
{
  return self->_emptySwitcherDismissDelay;
}

- (void)setEmptySwitcherDismissDelay:(double)a3
{
  self->_emptySwitcherDismissDelay = a3;
}

- (double)resizeBlurDelay
{
  return self->_resizeBlurDelay;
}

- (void)setResizeBlurDelay:(double)a3
{
  self->_resizeBlurDelay = a3;
}

- (double)appSwitcherTitleAndIconFadeInSlowDownFactor
{
  return self->_appSwitcherTitleAndIconFadeInSlowDownFactor;
}

- (void)setAppSwitcherTitleAndIconFadeInSlowDownFactor:(double)a3
{
  self->_appSwitcherTitleAndIconFadeInSlowDownFactor = a3;
}

- (void)setHomeScreenCenterZoomInitialBlur:(double)a3
{
  self->_homeScreenCenterZoomInitialBlur = a3;
}

- (void)setHomeScreenCenterZoomInitialScale:(double)a3
{
  self->_homeScreenCenterZoomInitialScale = a3;
}

- (void)setHomeScreenCenterZoomInitialOpacity:(double)a3
{
  self->_homeScreenCenterZoomInitialOpacity = a3;
}

- (void)setHomeScreenCenterZoomTargetScaleWhenUnblurringIsComplete:(double)a3
{
  self->_homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete = a3;
}

- (double)homeScreenCenterZoomYOffsetPercentOfScreenHeight
{
  return self->_homeScreenCenterZoomYOffsetPercentOfScreenHeight;
}

- (void)setHomeScreenCenterZoomYOffsetPercentOfScreenHeight:(double)a3
{
  self->_homeScreenCenterZoomYOffsetPercentOfScreenHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pulseScaleSettings, 0);
  objc_storeStrong((id *)&self->_bannerUnfurlWallpaperAlphaSettings, 0);
  objc_storeStrong((id *)&self->_bannerUnfurlSettings, 0);
  objc_storeStrong((id *)&self->_reopenButtonScaleSettings, 0);
  objc_storeStrong((id *)&self->_siriSwipeDismissalSettings, 0);
  objc_storeStrong((id *)&self->_alertBarSwipeDismissalSettings, 0);
  objc_storeStrong((id *)&self->_alertCardifiedDismissalSettings, 0);
  objc_storeStrong((id *)&self->_statusBarFadeOutSettings, 0);
  objc_storeStrong((id *)&self->_statusBarFadeInSettings, 0);
  objc_storeStrong((id *)&self->_appSelectionSquishSettings, 0);
  objc_storeStrong((id *)&self->_wallpaperScaleSettings, 0);
  objc_storeStrong((id *)&self->_swipeToKillOpacitySettings, 0);
  objc_storeStrong((id *)&self->_centerZoomOpacitySettings, 0);
  objc_storeStrong((id *)&self->_opacitySettings, 0);
  objc_storeStrong((id *)&self->_homeScreenScaleSettings, 0);
  objc_storeStrong((id *)&self->_homeScreenOpacitySettings, 0);
  objc_storeStrong((id *)&self->_backdropBlurSettings, 0);
  objc_storeStrong((id *)&self->_slideUpSettings, 0);
  objc_storeStrong((id *)&self->_crossfadeDosidoSettings, 0);
  objc_storeStrong((id *)&self->_crossblurDosidoSettings, 0);
  objc_storeStrong((id *)&self->_dosidoScaleUpSettings, 0);
  objc_storeStrong((id *)&self->_dosidoScaleDownSettings, 0);
  objc_storeStrong((id *)&self->_dosidoSettings, 0);
  objc_storeStrong((id *)&self->_reduceMotionAppToSwitcherSettings, 0);
  objc_storeStrong((id *)&self->_reduceMotionArcSwipeSettings, 0);
  objc_storeStrong((id *)&self->_cardFlyInSettings, 0);
  objc_storeStrong((id *)&self->_gestureInitiatedAppToSwitcherSettings, 0);
  objc_storeStrong((id *)&self->_appToSwitcherCornerRadiusSettings, 0);
  objc_storeStrong((id *)&self->_arcSwipeSwitcherGlancingSettings, 0);
  objc_storeStrong((id *)&self->_arcSwipeSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureLargeWidgetZoomDownScaleSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureLargeWidgetZoomDownPositionSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureLargeWidgetZoomDownLayoutSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureMediumWidgetZoomDownScaleSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureMediumWidgetZoomDownPositionSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureMediumWidgetZoomDownLayoutSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureSmallWidgetZoomDownScaleSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureSmallWidgetZoomDownPositionSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureSmallWidgetZoomDownLayoutSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureBottomRowZoomDownScaleSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureBottomRowZoomDownPositionSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureBottomRowZoomDownLayoutSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureTopRowZoomDownScaleSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureTopRowZoomDownPositionSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureTopRowZoomDownLayoutSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureEdgeRowZoomUpSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureCenterRowZoomUpSettings, 0);
  objc_storeStrong((id *)&self->_swapAppSidesOpacityAnimationSettings, 0);
  objc_storeStrong((id *)&self->_swapAppSidesLayoutAnimationSettings, 0);
  objc_storeStrong((id *)&self->_centerToSlideOverAnimationSettings, 0);
  objc_storeStrong((id *)&self->_slideOverToFullScreenAnimationSettings, 0);
  objc_storeStrong((id *)&self->_splitViewToSlideOverSettings, 0);
  objc_storeStrong((id *)&self->_fullScreenToPeekSecondPhaseAnimationSettings, 0);
  objc_storeStrong((id *)&self->_fullScreenToPeekFirstPhaseAnimationSettings, 0);
  objc_storeStrong((id *)&self->_stackedSwitcherTrackingSettings, 0);
  objc_storeStrong((id *)&self->_continuityBannerSlideUpSettings, 0);
  objc_storeStrong((id *)&self->_launchAppFromSwitcherSettings, 0);
  objc_storeStrong((id *)&self->_toggleAppSwitcherSettings, 0);
  objc_storeStrong((id *)&self->_switcherToHomeOpacitySettings, 0);
  objc_storeStrong((id *)&self->_switcherToHomeSettings, 0);
  objc_storeStrong((id *)&self->_slideOverSettings, 0);
  objc_storeStrong((id *)&self->_centerZoomSettings, 0);
  objc_storeStrong((id *)&self->_switcherFadeOutSettings, 0);
  objc_storeStrong((id *)&self->_iconFadeInSettings, 0);
  objc_storeStrong((id *)&self->_switcherZoomDownIconFadeOutSettings, 0);
  objc_storeStrong((id *)&self->_floatingDockIconFadeSettings, 0);
  objc_storeStrong((id *)&self->_iconZoomDownSettings, 0);
  objc_storeStrong((id *)&self->_zoomUpSettings, 0);
  objc_storeStrong((id *)&self->_layoutSettings, 0);
}

- (double)homeScreenAlphaForMode:(int64_t)a3
{
  double v4;
  double result;

  if (a3 == 3)
  {
    -[SBFluidSwitcherAnimationSettings homeScreenOpacityInApplication](self, "homeScreenOpacityInApplication");
  }
  else
  {
    v4 = 1.0;
    if (a3 == 2 && (v4 = 0.0, !UIAccessibilityIsReduceTransparencyEnabled()))
      -[SBFluidSwitcherAnimationSettings homeScreenOpacityInSwitcher](self, "homeScreenOpacityInSwitcher");
    else
      return v4;
  }
  return result;
}

- (double)wallpaperScaleForMode:(int64_t)a3
{
  double result;

  if (a3 == 3)
  {
    -[SBFluidSwitcherAnimationSettings wallpaperScaleInApplication](self, "wallpaperScaleInApplication");
  }
  else if (a3 == 2 && !UIAccessibilityIsReduceTransparencyEnabled())
  {
    -[SBFluidSwitcherAnimationSettings wallpaperScaleInSwitcher](self, "wallpaperScaleInSwitcher");
  }
  else
  {
    return 1.0;
  }
  return result;
}

- (double)homeScreenDimmingAlphaForMode:(int64_t)a3
{
  double result;

  if (a3 == 3)
  {
    -[SBFluidSwitcherAnimationSettings dimmingAlphaInApplication](self, "dimmingAlphaInApplication");
  }
  else if (a3 == 2)
  {
    -[SBFluidSwitcherAnimationSettings dimmingAlphaInSwitcher](self, "dimmingAlphaInSwitcher");
  }
  else
  {
    return 0.0;
  }
  return result;
}

@end
