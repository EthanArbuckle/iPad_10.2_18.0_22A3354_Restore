@implementation SBAppSwitcherSettings

- (double)switcherCenterYOffsetPercentOfScreenHeight
{
  return self->_switcherCenterYOffsetPercentOfScreenHeight;
}

- (SBFluidSwitcherAnimationSettings)animationSettings
{
  return self->_animationSettings;
}

- (double)deckSwitcherPageScale
{
  return self->_deckSwitcherPageScale;
}

- (SBSwitcherChamoisSettings)chamoisSettings
{
  return self->_chamoisSettings;
}

- (BOOL)shouldSimplifyForOptions:(int64_t)a3
{
  return (-[SBAppSwitcherSettings simplicityOptions](self, "simplicityOptions") & a3) != 0;
}

- (int64_t)simplicityOptions
{
  return self->_simplicityOptions;
}

- (double)asynchronousRenderingDisableSurfaceCacheDelayDuration
{
  return self->_asynchronousRenderingDisableSurfaceCacheDelayDuration;
}

- (int64_t)effectiveSwitcherStyle
{
  int64_t result;
  void *v3;
  uint64_t v4;

  result = -[SBAppSwitcherSettings switcherStyle](self, "switcherStyle");
  if (!result)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      return 2;
    else
      return 1;
  }
  return result;
}

- (int64_t)switcherStyle
{
  return self->_switcherStyle;
}

- (double)preventMedusaSnapshotsAfterTransitionDuration
{
  return self->_preventMedusaSnapshotsAfterTransitionDuration;
}

- (BOOL)shouldRedactWindowContents
{
  return self->_shouldRedactWindowContents;
}

- (double)snapshotAspectRatioAcceptanceThreshold
{
  return self->_snapshotAspectRatioAcceptanceThreshold;
}

- (BOOL)shouldDisableSwitcherModelUpdatesForDemo
{
  return self->_shouldDisableSwitcherModelUpdatesForDemo;
}

- (void)setDefaultValues
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  void *v15;
  int v16;
  double v17;
  void *v18;
  uint64_t v19;
  double v20;
  int v21;
  double v22;
  void *v23;
  uint64_t v24;
  double v25;
  int v26;
  char v27;
  int v28;
  char v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  int v38;
  char v39;
  int v40;
  char v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  int v46;
  char v47;
  void *v48;
  int v49;
  char v50;
  double v51;
  double v52;
  double v53;
  SBAppSwitcherSettings *v54;
  uint64_t v55;
  void *v56;
  double v57;
  void *v58;
  int v59;
  char v60;
  double v61;
  double v62;
  int v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  char v69;
  double v70;
  double v71;
  double v72;

  -[SBAppSwitcherSettings animationSettings](self, "animationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDefaultValues");

  -[SBAppSwitcherSettings chamoisSettings](self, "chamoisSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultValues");

  -[SBAppSwitcherSettings floatingSwitcherSettings](self, "floatingSwitcherSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultValues");

  -[SBAppSwitcherSettings centerWindowSizingSettings](self, "centerWindowSizingSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDefaultValues");

  -[SBAppSwitcherSettings setMScale:](self, "setMScale:", 0.45);
  -[SBAppSwitcherSettings setCenterPoint:](self, "setCenterPoint:", 0.4);
  -[SBAppSwitcherSettings setMaxScale:](self, "setMaxScale:", 1.3);
  -[SBAppSwitcherSettings setMAlpha:](self, "setMAlpha:", 1.5);
  -[SBAppSwitcherSettings setBAlpha:](self, "setBAlpha:", 0.95);
  -[SBAppSwitcherSettings setMDarkening:](self, "setMDarkening:", 0.55);
  -[SBAppSwitcherSettings setBDarkening:](self, "setBDarkening:", 0.0);
  -[SBAppSwitcherSettings setMaxDarkening:](self, "setMaxDarkening:", 0.35);
  if (__sb__runningInSpringBoard())
  {
    -[SBAppSwitcherSettings setSwitcherCardScaleWhileTouched:](self, "setSwitcherCardScaleWhileTouched:", dbl_1D0E8B1D0[SBFEffectiveDeviceClass() == 2]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppSwitcherSettings setSwitcherCardScaleWhileTouched:](self, "setSwitcherCardScaleWhileTouched:", dbl_1D0E8B1D0[objc_msgSend(v9, "userInterfaceIdiom") == 1]);

  }
  -[SBAppSwitcherSettings setSwitcherCardScaleWhileCursorHovered:](self, "setSwitcherCardScaleWhileCursorHovered:", 1.0154);
  if (__sb__runningInSpringBoard())
  {
    v10 = SBFEffectiveDeviceClass();
    v11 = 30.0;
    if (v10 == 2)
      v11 = 16.0;
    -[SBAppSwitcherSettings setSwitcherCardShadowRadius:](self, "setSwitcherCardShadowRadius:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");
    v14 = 30.0;
    if (v13 == 1)
      v14 = 16.0;
    -[SBAppSwitcherSettings setSwitcherCardShadowRadius:](self, "setSwitcherCardShadowRadius:", v14);

  }
  if (__sb__runningInSpringBoard())
  {
    -[SBAppSwitcherSettings setSwitcherCardShadowOpacity:](self, "setSwitcherCardShadowOpacity:", dbl_1D0E8B1E0[SBFEffectiveDeviceClass() == 2]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppSwitcherSettings setSwitcherCardShadowOpacity:](self, "setSwitcherCardShadowOpacity:", dbl_1D0E8B1E0[objc_msgSend(v15, "userInterfaceIdiom") == 1]);

  }
  -[SBAppSwitcherSettings setSwitcherCardShadowOffsetHorizontal:](self, "setSwitcherCardShadowOffsetHorizontal:", 0.0);
  if (__sb__runningInSpringBoard())
  {
    v16 = SBFEffectiveDeviceClass();
    v17 = 8.0;
    if (v16 != 2)
      v17 = 0.0;
    -[SBAppSwitcherSettings setSwitcherCardShadowOffsetVertical:](self, "setSwitcherCardShadowOffsetVertical:", v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "userInterfaceIdiom");
    v20 = 8.0;
    if (v19 != 1)
      v20 = 0.0;
    -[SBAppSwitcherSettings setSwitcherCardShadowOffsetVertical:](self, "setSwitcherCardShadowOffsetVertical:", v20);

  }
  if (__sb__runningInSpringBoard())
  {
    v21 = SBFEffectiveDeviceClass();
    v22 = -0.01;
    if (v21 == 2)
      v22 = 0.0;
    -[SBAppSwitcherSettings setSwitcherCenterYOffsetPercentOfScreenHeight:](self, "setSwitcherCenterYOffsetPercentOfScreenHeight:", v22);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "userInterfaceIdiom");
    v25 = -0.01;
    if (v24 == 1)
      v25 = 0.0;
    -[SBAppSwitcherSettings setSwitcherCenterYOffsetPercentOfScreenHeight:](self, "setSwitcherCenterYOffsetPercentOfScreenHeight:", v25);

  }
  -[SBAppSwitcherSettings setSwitcherCardShadowRadiusWhileTouched:](self, "setSwitcherCardShadowRadiusWhileTouched:", 50.0);
  -[SBAppSwitcherSettings setSwitcherCardShadowOpacityWhileTouched:](self, "setSwitcherCardShadowOpacityWhileTouched:", 0.22);
  -[SBAppSwitcherSettings setSwitcherCardShadowOffsetHorizontalWhileTouched:](self, "setSwitcherCardShadowOffsetHorizontalWhileTouched:", 0.0);
  -[SBAppSwitcherSettings setSwitcherCardShadowOffsetVerticalWhileTouched:](self, "setSwitcherCardShadowOffsetVerticalWhileTouched:", 25.0);
  -[SBAppSwitcherSettings setCursorHoverShadowRadiusInterpolationAmount:](self, "setCursorHoverShadowRadiusInterpolationAmount:", 0.33);
  -[SBAppSwitcherSettings setCursorHoverShadowOpacityInterpolationAmount:](self, "setCursorHoverShadowOpacityInterpolationAmount:", 0.33);
  -[SBAppSwitcherSettings setCursorHoverShadowOffsetInterpolationAmount:](self, "setCursorHoverShadowOffsetInterpolationAmount:", 0.33);
  -[SBAppSwitcherSettings setPeekInsetWidth:](self, "setPeekInsetWidth:", 48.0);
  -[SBAppSwitcherSettings setTintStyleDimmingAlphaInFocusForDarkMode:](self, "setTintStyleDimmingAlphaInFocusForDarkMode:", 0.75);
  -[SBAppSwitcherSettings setTintStyleDimmingAlphaUnFocusForDarkMode:](self, "setTintStyleDimmingAlphaUnFocusForDarkMode:", 0.25);
  -[SBAppSwitcherSettings setTintStyleDimmingAlphaInFocusForLightMode:](self, "setTintStyleDimmingAlphaInFocusForLightMode:", 0.35);
  -[SBAppSwitcherSettings setGridSwitcherPageScale:](self, "setGridSwitcherPageScale:", 0.3);
  -[SBAppSwitcherSettings setShowFloats:](self, "setShowFloats:", 0);
  v26 = __sb__runningInSpringBoard();
  v27 = v26;
  if (v26)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_42;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom") != 1)
    {

      goto LABEL_42;
    }
  }
  v28 = __sb__runningInSpringBoard();
  v29 = v28;
  if (v28)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v31 = v30;
  v32 = *(double *)(MEMORY[0x1E0DAB260] + 264);
  if ((v29 & 1) == 0)

  if ((v27 & 1) == 0)
  if (v31 >= v32)
  {
    v33 = 8.0;
    v34 = 91.0;
    v35 = 57.0;
    v36 = 84.0;
    v37 = 58.5;
    goto LABEL_58;
  }
LABEL_42:
  v38 = __sb__runningInSpringBoard();
  v39 = v38;
  if (v38)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_56;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom") != 1)
    {

LABEL_56:
      v33 = 6.0;
      v34 = 68.0;
      v35 = 42.5;
      v36 = 63.0;
      v45 = 0x4046000000000000;
      goto LABEL_57;
    }
  }
  v40 = __sb__runningInSpringBoard();
  v41 = v40;
  if (v40)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v43 = v42;
  v44 = *(double *)(MEMORY[0x1E0DAB260] + 248);
  if ((v41 & 1) == 0)

  if ((v39 & 1) == 0)
  if (v43 < v44)
    goto LABEL_56;
  v33 = 6.5;
  v34 = 74.0;
  v35 = 44.5;
  v36 = 68.5;
  v45 = 0x4048000000000000;
LABEL_57:
  v37 = *(double *)&v45;
LABEL_58:
  -[SBAppSwitcherSettings setGridSwitcherHorizontalInterpageSpacingLandscape:](self, "setGridSwitcherHorizontalInterpageSpacingLandscape:", v37);
  -[SBAppSwitcherSettings setGridSwitcherVerticalNaturalSpacingLandscape:](self, "setGridSwitcherVerticalNaturalSpacingLandscape:", v36);
  -[SBAppSwitcherSettings setGridSwitcherHorizontalInterpageSpacingPortrait:](self, "setGridSwitcherHorizontalInterpageSpacingPortrait:", v35);
  -[SBAppSwitcherSettings setGridSwitcherVerticalNaturalSpacingPortrait:](self, "setGridSwitcherVerticalNaturalSpacingPortrait:", v34);
  -[SBAppSwitcherSettings setGridSwitcherSnapToControlCenterHeightSlop:](self, "setGridSwitcherSnapToControlCenterHeightSlop:", v33);
  -[SBAppSwitcherSettings setGridSwitcherSwipeUpNormalizedRubberbandingRange:](self, "setGridSwitcherSwipeUpNormalizedRubberbandingRange:", 0.6);
  -[SBAppSwitcherSettings setGridSwitcherSwipeUpNormalizedRubberbandedTranslationAtMinimumScale:](self, "setGridSwitcherSwipeUpNormalizedRubberbandedTranslationAtMinimumScale:", 0.25);
  -[SBAppSwitcherSettings setGridSwitcherSwipeUpMinimumScale:](self, "setGridSwitcherSwipeUpMinimumScale:", 0.9);
  -[SBAppSwitcherSettings setGridSwitcherHomeButtonDeviceCardCornerRadius:](self, "setGridSwitcherHomeButtonDeviceCardCornerRadius:", 7.0);
  -[SBAppSwitcherSettings setAppExposeNonFloatingSingleRowScale:](self, "setAppExposeNonFloatingSingleRowScale:", 0.42);
  -[SBAppSwitcherSettings gridSwitcherPageScale](self, "gridSwitcherPageScale");
  -[SBAppSwitcherSettings setAppExposeNonFloatingDoubleRowScale:](self, "setAppExposeNonFloatingDoubleRowScale:");
  -[SBAppSwitcherSettings setAppExposeFloatingDoubleRowScale:](self, "setAppExposeFloatingDoubleRowScale:", 0.6);
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_60;
LABEL_65:
    -[SBAppSwitcherSettings setNumberOfSnapshotsToCacheInSwitcher:](self, "setNumberOfSnapshotsToCacheInSwitcher:", 12);
    -[SBAppSwitcherSettings setNumberOfSnapshotsToAlwaysKeepAround:](self, "setNumberOfSnapshotsToAlwaysKeepAround:", 7);
    goto LABEL_79;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v48, "userInterfaceIdiom");

  if (v2 == (void *)1)
    goto LABEL_65;
LABEL_60:
  -[SBAppSwitcherSettings setNumberOfSnapshotsToAlwaysKeepAround:](self, "setNumberOfSnapshotsToAlwaysKeepAround:", 0);
  v46 = __sb__runningInSpringBoard();
  v47 = v46;
  if (v46)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_77;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom"))
    {

LABEL_77:
      v54 = self;
      v55 = 9;
      goto LABEL_78;
    }
  }
  v49 = __sb__runningInSpringBoard();
  v50 = v49;
  if (v49)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v52 = v51;
  v53 = *(double *)(MEMORY[0x1E0DAB260] + 56);
  if ((v50 & 1) == 0)

  if ((v47 & 1) == 0)
  if (v52 < v53)
    goto LABEL_77;
  v54 = self;
  v55 = 7;
LABEL_78:
  -[SBAppSwitcherSettings setNumberOfSnapshotsToCacheInSwitcher:](v54, "setNumberOfSnapshotsToCacheInSwitcher:", v55);
LABEL_79:
  -[SBAppSwitcherSettings _spacingBetweenLeadingEdgeAndIcon](self, "_spacingBetweenLeadingEdgeAndIcon");
  -[SBAppSwitcherSettings setSpacingBetweenLeadingEdgeAndIcon:](self, "setSpacingBetweenLeadingEdgeAndIcon:");
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_81;
LABEL_87:
    -[SBAppSwitcherSettings setSpacingBetweenTrailingEdgeAndLabels:](self, "setSpacingBetweenTrailingEdgeAndLabels:", 8.0);
    v57 = 16.0;
LABEL_98:
    v61 = 29.0;
    goto LABEL_99;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v56, "userInterfaceIdiom");

  if (v2 == (void *)1)
    goto LABEL_87;
LABEL_81:
  if (!__sb__runningInSpringBoard())
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v58, "userInterfaceIdiom"))
    {

    }
    else
    {
      v2 = (void *)SBFEffectiveHomeButtonType();

      if (v2 == (void *)2)
        goto LABEL_91;
    }
LABEL_97:
    -[SBAppSwitcherSettings setSpacingBetweenTrailingEdgeAndLabels:](self, "setSpacingBetweenTrailingEdgeAndLabels:", 14.0);
    v57 = 9.0;
    goto LABEL_98;
  }
  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1
    || SBFEffectiveHomeButtonType() != 2)
  {
    goto LABEL_97;
  }
LABEL_91:
  -[SBAppSwitcherSettings setSpacingBetweenTrailingEdgeAndLabels:](self, "setSpacingBetweenTrailingEdgeAndLabels:", 24.0);
  v59 = __sb__runningInSpringBoard();
  v60 = v59;
  if (v59)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_128;
    if (SBFEffectiveHomeButtonType() != 2)
    {
      if ((v60 & 1) != 0)
        goto LABEL_128;
      goto LABEL_120;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
    {
LABEL_120:

      goto LABEL_128;
    }
  }
  v68 = __sb__runningInSpringBoard();
  v69 = v68;
  if (v68)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v71 = v70;
  v72 = *(double *)(MEMORY[0x1E0DAB260] + 136);
  if ((v69 & 1) == 0)

  if ((v60 & 1) == 0)
  if (v71 >= v72)
  {
    v57 = 8.0;
    v61 = 28.0;
    goto LABEL_99;
  }
LABEL_128:
  v57 = 8.0;
  v61 = 26.0;
LABEL_99:
  -[SBAppSwitcherSettings setIconSideLength:](self, "setIconSideLength:", v61);
  -[SBAppSwitcherSettings setMultipleWindowsIndicatorSideLength:](self, "setMultipleWindowsIndicatorSideLength:", v61);
  -[SBAppSwitcherSettings setSpacingBetweenSnapshotAndIcon:](self, "setSpacingBetweenSnapshotAndIcon:", v57);
  -[SBAppSwitcherSettings setSpacingBetweenSnapshotAndDescriptionLabelBaseline:](self, "setSpacingBetweenSnapshotAndDescriptionLabelBaseline:", 16.0);
  -[SBAppSwitcherSettings setSpacingBetweenTitleAndSubtitleBaseline:](self, "setSpacingBetweenTitleAndSubtitleBaseline:", 18.0);
  -[SBAppSwitcherSettings setSpacingBetweenIconAndLabel:](self, "setSpacingBetweenIconAndLabel:", 8.0);
  -[SBAppSwitcherSettings setSpacingBetweenLabelAndMultipleWindowsIndicator:](self, "setSpacingBetweenLabelAndMultipleWindowsIndicator:", 8.0);
  -[SBAppSwitcherSettings setSpacingBetweenLabelAndSecondIcon:](self, "setSpacingBetweenLabelAndSecondIcon:", 21.0);
  -[SBAppSwitcherSettings setSpacingBetweenBoundsCenterAndSecondIcon:](self, "setSpacingBetweenBoundsCenterAndSecondIcon:", 3.0);
  -[SBAppSwitcherSettings setSimplicityOptions:](self, "setSimplicityOptions:", 0);
  -[SBAppSwitcherSettings setUseAsynchronousRendering:](self, "setUseAsynchronousRendering:", 1);
  -[SBAppSwitcherSettings setShouldRoundCornersDuringSwipeUp:](self, "setShouldRoundCornersDuringSwipeUp:", 1);
  if (SBFEffectiveHomeButtonType() == 2)
  {
LABEL_100:
    v62 = 5.0;
    goto LABEL_101;
  }
  if ((__sb__runningInSpringBoard() & 1) != 0)
  {
    v63 = SBFEffectiveDeviceClass();
    v62 = 0.0;
    if (v63 == 2)
      goto LABEL_100;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "userInterfaceIdiom");

    v62 = 0.0;
    if (v66 == 1)
      goto LABEL_100;
  }
LABEL_101:
  -[SBAppSwitcherSettings setAsynchronousRenderingDisableSurfaceCacheDelayDuration:](self, "setAsynchronousRenderingDisableSurfaceCacheDelayDuration:", v62);
  -[SBAppSwitcherSettings setPreventMedusaSnapshotsAfterTransitionDuration:](self, "setPreventMedusaSnapshotsAfterTransitionDuration:", 1.5);
  -[SBAppSwitcherSettings setCoplanarSpacingPhone:](self, "setCoplanarSpacingPhone:", 24.0);
  -[SBAppSwitcherSettings setCoplanarSpacingPad:](self, "setCoplanarSpacingPad:", 48.0);
  -[SBAppSwitcherSettings setLiveResizeSceneUpdateDistanceThreshold:](self, "setLiveResizeSceneUpdateDistanceThreshold:", 80.0);
  -[SBAppSwitcherSettings setLiveResizeSceneUpdateTimeThresholdSeconds:](self, "setLiveResizeSceneUpdateTimeThresholdSeconds:", 0.08);
  -[SBAppSwitcherSettings setLiveResizeUsesGrid:](self, "setLiveResizeUsesGrid:", 0);
  -[SBAppSwitcherSettings setLiveResizeGridRubberbandingRange:](self, "setLiveResizeGridRubberbandingRange:", 200.0);
  -[SBAppSwitcherSettings setLiveResizeGridMinimumWidth:](self, "setLiveResizeGridMinimumWidth:", 100.0);
  -[SBAppSwitcherSettings setLiveResizeGridMinimumHeight:](self, "setLiveResizeGridMinimumHeight:", 300.0);
  -[SBAppSwitcherSettings setLiveResizeSendsAnimatedSceneSizeUpdates:](self, "setLiveResizeSendsAnimatedSceneSizeUpdates:", 0);
  -[SBAppSwitcherSettings setLiveResizePointerInteractionRegionOuterLength:](self, "setLiveResizePointerInteractionRegionOuterLength:", 12.5);
  -[SBAppSwitcherSettings setLiveResizePointerInteractionRegionInnerLength:](self, "setLiveResizePointerInteractionRegionInnerLength:", 5.0);
  -[SBAppSwitcherSettings setSnapshotAspectRatioAcceptanceThreshold:](self, "setSnapshotAspectRatioAcceptanceThreshold:", 0.1);
  -[SBAppSwitcherSettings setSwitcherStyle:](self, "setSwitcherStyle:", 0);
  -[SBAppSwitcherSettings setDeckSwitcherPageScale:](self, "setDeckSwitcherPageScale:", 0.75);
  -[SBAppSwitcherSettings setDeckSwitcherDecelerationRate:](self, "setDeckSwitcherDecelerationRate:", 0.993);
  -[SBAppSwitcherSettings setAExpLayoutCoeff:](self, "setAExpLayoutCoeff:", -18.0);
  -[SBAppSwitcherSettings setBExpLayoutCoeff:](self, "setBExpLayoutCoeff:", 9.0);
  -[SBAppSwitcherSettings setDepthPadding:](self, "setDepthPadding:", 0.13);
  if (!__sb__runningInSpringBoard())
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v64, "userInterfaceIdiom"))
    {

      goto LABEL_115;
    }
    v67 = SBFEffectiveHomeButtonType();

    if (v67 != 2)
      goto LABEL_115;
LABEL_114:
    -[SBAppSwitcherSettings setDeckSwitcherPageScale:](self, "setDeckSwitcherPageScale:", 0.7);
    -[SBAppSwitcherSettings setAExpLayoutCoeff:](self, "setAExpLayoutCoeff:", -28.0);
    -[SBAppSwitcherSettings setBExpLayoutCoeff:](self, "setBExpLayoutCoeff:", 8.5);
    -[SBAppSwitcherSettings setDepthPadding:](self, "setDepthPadding:", 0.123);
    goto LABEL_115;
  }
  if ((!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    && SBFEffectiveHomeButtonType() == 2)
  {
    goto LABEL_114;
  }
LABEL_115:
  -[SBAppSwitcherSettings setUseTitleOpacityPrototypeSettings:](self, "setUseTitleOpacityPrototypeSettings:", 0);
  -[SBAppSwitcherSettings setTitleOpacityACoeff:](self, "setTitleOpacityACoeff:", 0.16);
  -[SBAppSwitcherSettings setTitleOpacityBCoeff:](self, "setTitleOpacityBCoeff:", 8.0);
  -[SBAppSwitcherSettings setTitleOpacityCCoeff:](self, "setTitleOpacityCCoeff:", 0.023);
  -[SBAppSwitcherSettings setTitleOpacityDCoeff:](self, "setTitleOpacityDCoeff:", 40.0);
  -[SBAppSwitcherSettings setOffscreenCardScaleForFlyIn:](self, "setOffscreenCardScaleForFlyIn:", 0.8);
  -[SBAppSwitcherSettings setShouldRedactWindowContents:](self, "setShouldRedactWindowContents:", 0);
  -[SBAppSwitcherSettings setShowModifierDebugLabel:](self, "setShowModifierDebugLabel:", 0);
  -[SBAppSwitcherSettings setShowMainModifierTimeline:](self, "setShowMainModifierTimeline:", 0);
  -[SBAppSwitcherSettings setShouldDisableSwitcherModelUpdatesForDemo:](self, "setShouldDisableSwitcherModelUpdatesForDemo:", 0);
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
  _QWORD v360[26];
  void *v361;
  _QWORD v362[6];
  _QWORD v363[8];
  _QWORD v364[4];
  _QWORD v365[7];
  _QWORD v366[6];
  _QWORD v367[4];
  _QWORD v368[3];
  _QWORD v369[16];
  _QWORD v370[16];
  _QWORD v371[3];
  void *v372;
  _QWORD v373[3];
  _QWORD v374[4];
  _QWORD v375[4];
  _QWORD v376[4];
  void *v377;
  _QWORD v378[2];
  void *v379;
  _QWORD v380[4];
  _QWORD v381[2];
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  _QWORD v386[3];

  v386[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Sliders/Floats"), CFSTR("showFloats"));
  v358 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("showFloats == YES"));
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("showFloats == NO"));
  v359 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Animation Settings"), CFSTR("animationSettings"));
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D83070];
  v386[0] = v300;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v386, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v3);
  v357 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Chamois Settings"), CFSTR("chamoisSettings"));
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D83070];
  v385 = v299;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v385, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:", v5);
  v356 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("System Aperture Settings"), CFSTR("systemApertureSettings"));
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D83070];
  v384 = v298;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v384, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:", v7);
  v355 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Floating Switcher Settings"), CFSTR("floatingSwitcherSettings"));
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D83070];
  v383 = v297;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v383, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionWithRows:", v9);
  v354 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Center Window Sizing Settings"), CFSTR("centerWindowSizingSettings"));
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D83070];
  v382 = v296;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v382, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:", v11);
  v353 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83070];
  v13 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_liveResizeSceneUpdateDistanceThreshold);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:valueKeyPath:", CFSTR("Live Resize Distance Threshold for Scene Size Update"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "between:and:", 0.0, 1000.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v381[0] = v16;
  v17 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_liveResizeSceneUpdateTimeThresholdSeconds);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:valueKeyPath:", CFSTR("Live Resize Pause Threshold for Scene Size Update (seconds)"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "precision:", 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "between:and:", 0.0, 5.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v381[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v381, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:title:", v22, CFSTR("Live Resize"));
  v352 = (void *)objc_claimAutoreleasedReturnValue();

  v350 = (void *)MEMORY[0x1E0D83070];
  v23 = (void *)MEMORY[0x1E0D83100];
  NSStringFromSelector(sel_liveResizeUsesGrid);
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "rowWithTitle:valueKeyPath:", CFSTR("Live Resizes Uses Grid"), v348);
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  v380[0] = v346;
  v24 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_liveResizeGridRubberbandingRange);
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rowWithTitle:valueKeyPath:", CFSTR("Live Resize Grid Rubberbanding Range"), v344);
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v341, "precision:", 0);
  v338 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "between:and:", 0.0, 500.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v380[1] = v25;
  v26 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_liveResizeGridMinimumWidth);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rowWithTitle:valueKeyPath:", CFSTR("Live Resize Grid Minimum Width"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "precision:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "between:and:", 0.0, 1500.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v380[2] = v30;
  v31 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_liveResizeGridMinimumHeight);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rowWithTitle:valueKeyPath:", CFSTR("Live Resize Grid Minimum Height"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "precision:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "between:and:", 0.0, 1500.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v380[3] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v380, 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v350, "sectionWithRows:title:", v36, CFSTR("Live Resize On Grid"));
  v351 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)MEMORY[0x1E0D83070];
  v38 = (void *)MEMORY[0x1E0D83100];
  NSStringFromSelector(sel_liveResizeSendsAnimatedSceneSizeUpdates);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "rowWithTitle:valueKeyPath:", CFSTR("Send Animated Scene Size Updates"), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v379 = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v379, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "sectionWithRows:title:", v41, CFSTR("Live Resize With Animation"));
  v349 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = (void *)MEMORY[0x1E0D83070];
  v43 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_liveResizePointerInteractionRegionOuterLength);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "rowWithTitle:valueKeyPath:", CFSTR("Live Resize Pointer Interaction Region Outer Length"), v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "precision:", 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "between:and:", 1.0, 1500.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v378[0] = v47;
  v48 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_liveResizePointerInteractionRegionInnerLength);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "rowWithTitle:valueKeyPath:", CFSTR("Live Resize Pointer Interaction Region Inner Length"), v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "precision:", 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "between:and:", 1.0, 1500.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v378[1] = v52;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v378, 2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "sectionWithRows:title:", v53, CFSTR("Live Resize Pointer Interaction"));
  v347 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = (void *)MEMORY[0x1E0D83070];
  v55 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_snapshotAspectRatioAcceptanceThreshold);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "rowWithTitle:valueKeyPath:", CFSTR("Snapshot Aspect Ratio Acceptance Threshold"), v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "precision:", 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "between:and:", 0.0, 1.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v377 = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v377, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "sectionWithRows:title:", v60, CFSTR("Snapshots"));
  v345 = (void *)objc_claimAutoreleasedReturnValue();

  v342 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Switcher"), CFSTR("switcherStyle"));
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v339, "possibleValues:titles:", &unk_1E91CEDD0, &unk_1E91CEDB8);
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  v376[0] = v335;
  v61 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_switcherCardScaleWhileTouched);
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "rowWithTitle:valueKeyPath:", CFSTR("Scale When Touched/Dragged"), v331);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "minValue:maxValue:", 0.9, 1.1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v376[1] = v63;
  v64 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_switcherCardScaleWhileCursorHovered);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "rowWithTitle:valueKeyPath:", CFSTR("Scale When Cursor Hovers"), v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "minValue:maxValue:", 0.9, 1.1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v376[2] = v67;
  v68 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_switcherCardScaleWhileCursorHovered);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "rowWithTitle:valueKeyPath:", &stru_1E8EC7EC0, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "precision:", 4);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "between:and:", 0.9, 1.1);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v376[3] = v72;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v376, 4);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v342, "sectionWithRows:title:", v73, CFSTR("Card Style"));
  v343 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Shadow Radius"), CFSTR("switcherCardShadowRadius"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "minValue:maxValue:", 0.0, 50.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v375[0] = v76;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Shadow Opacity"), CFSTR("switcherCardShadowOpacity"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "minValue:maxValue:", 0.0, 0.5);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v375[1] = v78;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Shadow Horizontal Offset"), CFSTR("switcherCardShadowOffsetHorizontal"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "minValue:maxValue:", 0.0, 60.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v375[2] = v80;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Shadow Vertical Offset"), CFSTR("switcherCardShadowOffsetVertical"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "minValue:maxValue:", 0.0, 60.0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v375[3] = v82;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v375, 4);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "sectionWithRows:title:", v83, CFSTR("Card Shadow"));
  v340 = (void *)objc_claimAutoreleasedReturnValue();

  v336 = (void *)MEMORY[0x1E0D83070];
  v84 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_switcherCardShadowRadiusWhileTouched);
  v332 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "rowWithTitle:valueKeyPath:", CFSTR("Shadow Radius When Touched"), v332);
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v329, "minValue:maxValue:", 0.0, 50.0);
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  v374[0] = v326;
  v85 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_switcherCardShadowOpacityWhileTouched);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "rowWithTitle:valueKeyPath:", CFSTR("Shadow Opacity When Touched"), v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "minValue:maxValue:", 0.0, 1.0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v374[1] = v88;
  v89 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_switcherCardShadowOffsetHorizontalWhileTouched);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "rowWithTitle:valueKeyPath:", CFSTR("Shadow Horizontal Offset When Touched"), v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "minValue:maxValue:", 0.0, 60.0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v374[2] = v92;
  v93 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_switcherCardShadowOffsetVerticalWhileTouched);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "rowWithTitle:valueKeyPath:", CFSTR("Shadow Vertical Offset When Touched"), v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "minValue:maxValue:", 0.0, 60.0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v374[3] = v96;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v374, 4);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v336, "sectionWithRows:title:", v97, CFSTR("Card Shadow When Touched/Dragged"));
  v337 = (void *)objc_claimAutoreleasedReturnValue();

  v333 = (void *)MEMORY[0x1E0D83070];
  v98 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_cursorHoverShadowRadiusInterpolationAmount);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "rowWithTitle:valueKeyPath:", CFSTR("Shadow Radius Interpolation Amount"), v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "minValue:maxValue:", 0.0, 1.0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v373[0] = v101;
  v102 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_cursorHoverShadowOpacityInterpolationAmount);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "rowWithTitle:valueKeyPath:", CFSTR("Shadow Opacity Interpolation Amount"), v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "minValue:maxValue:", 0.0, 1.0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v373[1] = v105;
  v106 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_cursorHoverShadowOffsetInterpolationAmount);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "rowWithTitle:valueKeyPath:", CFSTR("Shadow Offset Interpolation Amount"), v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "minValue:maxValue:", 0.0, 1.0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v373[2] = v109;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v373, 3);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v333, "sectionWithRows:title:", v110, CFSTR("Hover Shadow Interpolation Amount"));
  v334 = (void *)objc_claimAutoreleasedReturnValue();

  v111 = (void *)MEMORY[0x1E0D83070];
  v112 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_peekInsetWidth);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "rowWithTitle:valueKeyPath:", CFSTR("Peek Inset From Edge"), v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "minValue:maxValue:", 0.0, 100.0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v372 = v115;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v372, 1);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "sectionWithRows:title:", v116, CFSTR("Peek"));
  v330 = (void *)objc_claimAutoreleasedReturnValue();

  v327 = (void *)MEMORY[0x1E0D83070];
  v117 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_tintStyleDimmingAlphaInFocusForDarkMode);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "rowWithTitle:valueKeyPath:", CFSTR("Tint style dimming alpha in-focus for dark mode"), v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "minValue:maxValue:", 0.0, 1.0);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v371[0] = v120;
  v121 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_tintStyleDimmingAlphaUnFocusForDarkMode);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "rowWithTitle:valueKeyPath:", CFSTR("Tint style dimming alpha un-focus for dark mode"), v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "minValue:maxValue:", 0.0, 1.0);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v371[1] = v124;
  v125 = (void *)MEMORY[0x1E0D830F0];
  NSStringFromSelector(sel_tintStyleDimmingAlphaInFocusForLightMode);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "rowWithTitle:valueKeyPath:", CFSTR("Tint style dimming alpha in-focus for light mode"), v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "minValue:maxValue:", 0.0, 1.0);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v371[2] = v128;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v371, 3);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v327, "sectionWithRows:title:", v129, CFSTR("Shelf"));
  v328 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Scale Slope"), CFSTR("mScale"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "minValue:maxValue:", 0.0, 2.0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "condition:", v359);
  v325 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Scale Slope"), CFSTR("mScale"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "condition:", v310);
  v324 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v324, "setPrecision:", 6);
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Center Point"), CFSTR("centerPoint"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "minValue:maxValue:", 0.0, 1.0);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "condition:", v359);
  v323 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Center Point"), CFSTR("centerPoint"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "condition:", v310);
  v322 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v322, "setPrecision:", 6);
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Max Scale"), CFSTR("maxScale"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "minValue:maxValue:", 0.0, 1.5);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "condition:", v359);
  v321 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Max Scale"), CFSTR("maxScale"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "condition:", v310);
  v320 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v320, "setPrecision:", 6);
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Alpha Slope"), CFSTR("mAlpha"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "minValue:maxValue:", 0.0, 2.0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "condition:", v359);
  v319 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Alpha Slope"), CFSTR("mAlpha"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "condition:", v310);
  v318 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v318, "setPrecision:", 6);
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Alpha Offset"), CFSTR("bAlpha"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "minValue:maxValue:", 0.0, 1.0);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "condition:", v359);
  v317 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Alpha Offset"), CFSTR("bAlpha"));
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "condition:", v310);
  v316 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v316, "setPrecision:", 6);
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Darkening Slope"), CFSTR("mDarkening"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "minValue:maxValue:", 0.0, 2.0);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "condition:", v359);
  v315 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Darkening Slope"), CFSTR("mDarkening"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "condition:", v310);
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  v295 = v148;
  objc_msgSend(v148, "setPrecision:", 6);
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Darkening Offset"), CFSTR("bDarkening"));
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "minValue:maxValue:", 0.0, 2.0);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "condition:", v359);
  v294 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Darkening Offset"), CFSTR("bDarkening"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "condition:", v310);
  v152 = (void *)objc_claimAutoreleasedReturnValue();

  v293 = v152;
  objc_msgSend(v152, "setPrecision:", 6);
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Max Darkening"), CFSTR("maxDarkening"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "minValue:maxValue:", 0.0, 2.0);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "condition:", v359);
  v292 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Max Darkening"), CFSTR("maxDarkening"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "condition:", v310);
  v156 = (void *)objc_claimAutoreleasedReturnValue();

  v291 = v156;
  objc_msgSend(v156, "setPrecision:", 6);
  v157 = (void *)MEMORY[0x1E0D83070];
  v370[0] = v325;
  v370[1] = v324;
  v370[2] = v323;
  v370[3] = v322;
  v370[4] = v321;
  v370[5] = v320;
  v370[6] = v319;
  v370[7] = v318;
  v370[8] = v317;
  v370[9] = v316;
  v370[10] = v292;
  v370[11] = v315;
  v370[12] = v148;
  v370[13] = v294;
  v370[14] = v152;
  v370[15] = v156;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v370, 16);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "sectionWithRows:", v158);
  v314 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Grid Page Scale"), CFSTR("gridSwitcherPageScale"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "minValue:maxValue:", 0.1, 0.5);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "condition:", v359);
  v313 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Grid Page Scale"), CFSTR("gridSwitcherPageScale"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "condition:", v310);
  v312 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v312, "setPrecision:", 6);
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Horiz. Spacing Landscape"), CFSTR("gridSwitcherHorizontalInterpageSpacingLandscape"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "minValue:maxValue:", 0.0, 100.0);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "condition:", v359);
  v311 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Horiz. Spacing Landscape"), CFSTR("gridSwitcherHorizontalInterpageSpacingLandscape"));
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "condition:", v310);
  v309 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v309, "setPrecision:", 6);
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Vert. Nat. Spacing Landscape"), CFSTR("gridSwitcherVerticalNaturalSpacingLandscape"));
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "minValue:maxValue:", 0.0, 150.0);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "condition:", v359);
  v308 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Vert. Nat. Spacing Landscape"), CFSTR("gridSwitcherVerticalNaturalSpacingLandscape"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "condition:", v310);
  v307 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v307, "setPrecision:", 6);
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Horiz. Spacing Portrait"), CFSTR("gridSwitcherHorizontalInterpageSpacingPortrait"));
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "minValue:maxValue:", 0.0, 100.0);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "condition:", v359);
  v306 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Horiz. Spacing Portrait"), CFSTR("gridSwitcherHorizontalInterpageSpacingPortrait"));
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "condition:", v310);
  v305 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v305, "setPrecision:", 6);
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Vert. Nat. Spacing Portrait"), CFSTR("gridSwitcherVerticalNaturalSpacingPortrait"));
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "minValue:maxValue:", 0.0, 200.0);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "condition:", v359);
  v290 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Vert. Nat. Spacing Portrait"), CFSTR("gridSwitcherVerticalNaturalSpacingPortrait"));
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "condition:", v310);
  v174 = (void *)objc_claimAutoreleasedReturnValue();

  v289 = v174;
  objc_msgSend(v174, "setPrecision:", 6);
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Snap To CC Height Slop"), CFSTR("gridSwitcherSnapToControlCenterHeightSlop"));
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "minValue:maxValue:", 0.0, 60.0);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "condition:", v359);
  v288 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Snap To CC Height Slop"), CFSTR("gridSwitcherSnapToControlCenterHeightSlop"));
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "condition:", v310);
  v178 = (void *)objc_claimAutoreleasedReturnValue();

  v287 = v178;
  objc_msgSend(v178, "setPrecision:", 6);
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Swipe Up Rubberbanding Range (% of screen height)"), CFSTR("gridSwitcherSwipeUpNormalizedRubberbandingRange"));
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "between:and:", 0.0, 1.0);
  v286 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Swipe Up Rubberbanded Translation at Minimum Scale (% of screen height)"), CFSTR("gridSwitcherSwipeUpNormalizedRubberbandedTranslationAtMinimumScale"));
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "between:and:", 0.0, 1.0);
  v285 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Swipe Up Minimum Scale"), CFSTR("gridSwitcherSwipeUpMinimumScale"));
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "between:and:", 0.0, 1.0);
  v284 = (void *)objc_claimAutoreleasedReturnValue();

  v182 = (void *)MEMORY[0x1E0D83070];
  v369[0] = v358;
  v369[1] = v313;
  v369[2] = v312;
  v369[3] = v311;
  v369[4] = v309;
  v369[5] = v308;
  v369[6] = v307;
  v369[7] = v306;
  v369[8] = v305;
  v369[9] = v290;
  v369[10] = v174;
  v369[11] = v288;
  v369[12] = v178;
  v369[13] = v286;
  v369[14] = v285;
  v369[15] = v284;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v369, 16);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "sectionWithRows:title:", v183, CFSTR("Grid Layout"));
  v304 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Non Floating Single Row Scale"), CFSTR("appExposeNonFloatingSingleRowScale"));
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "precision:", 0);
  v283 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Non Floating Gridified Scale"), CFSTR("appExposeNonFloatingDoubleRowScale"));
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "precision:", 0);
  v282 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Floating Gridified Scale"), CFSTR("appExposeFloatingDoubleRowScale"));
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "precision:", 0);
  v281 = (void *)objc_claimAutoreleasedReturnValue();

  v187 = (void *)MEMORY[0x1E0D83070];
  v368[0] = v283;
  v368[1] = v282;
  v368[2] = v281;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v368, 3);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "sectionWithRows:title:", v188, CFSTR("App Expose"));
  v303 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Use Asynchronous Rendering"), CFSTR("useAsynchronousRendering"));
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Round Corners During Swipe Up"), CFSTR("shouldRoundCornersDuringSwipeUp"));
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Asynchronous Rendering Disable Surface Cache Delay"), CFSTR("asynchronousRenderingDisableSurfaceCacheDelayDuration"));
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "precision:", 0);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "between:and:", 0.0, 20.0);
  v278 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Prevent Medusa Snapshots After Transition Duration"), CFSTR("preventMedusaSnapshotsAfterTransitionDuration"));
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "precision:", 0);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "between:and:", 0.0, 20.0);
  v277 = (void *)objc_claimAutoreleasedReturnValue();

  v193 = (void *)MEMORY[0x1E0D83070];
  v367[0] = v280;
  v367[1] = v279;
  v367[2] = v278;
  v367[3] = v277;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v367, 4);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "sectionWithRows:", v194);
  v302 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Deck Page Scale"), CFSTR("deckSwitcherPageScale"));
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "between:and:", 0.1, 1.0);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v196, "precision:", 2);
  v276 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Deck Deceleration Rate"), CFSTR("deckSwitcherDecelerationRate"));
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "between:and:", 0.1, 1.0);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "precision:", 3);
  v275 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Translation"), CFSTR("aExpLayoutCoeff"));
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "between:and:", -220.0, 120.0);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "precision:", 2);
  v274 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Curve Exponent"), CFSTR("bExpLayoutCoeff"));
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "between:and:", 0.0, 30.0);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "precision:", 2);
  v273 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Depth Padding"), CFSTR("depthPadding"));
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "between:and:", 0.001, 0.2);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "precision:", 3);
  v272 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Offscreen Card Scale for Fly In"), CFSTR("offscreenCardScaleForFlyIn"));
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "between:and:", 0.01, 1.0);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "precision:", 2);
  v271 = (void *)objc_claimAutoreleasedReturnValue();

  v207 = (void *)MEMORY[0x1E0D83070];
  v366[0] = v276;
  v366[1] = v275;
  v366[2] = v274;
  v366[3] = v273;
  v366[4] = v272;
  v366[5] = v271;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v366, 6);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "sectionWithRows:title:", v208, CFSTR("Deck Switcher Layout"));
  v267 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Enabled"), CFSTR("useTitleOpacityPrototypeSettings"));
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Title Opacity A"), CFSTR("titleOpacityACoeff"));
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v209, "minValue:maxValue:", 0.0, 0.5);
  v269 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Title Opacity A"), CFSTR("titleOpacityACoeff"));
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "between:and:", 0.0, 0.1);
  v211 = (void *)objc_claimAutoreleasedReturnValue();

  v268 = v211;
  objc_msgSend(v211, "setPrecision:", 6);
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Title Opacity B"), CFSTR("titleOpacityBCoeff"));
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "minValue:maxValue:", 0.0, 50.0);
  v266 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Title Opacity C"), CFSTR("titleOpacityCCoeff"));
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "minValue:maxValue:", 0.0, 0.04);
  v265 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Title Opacity C"), CFSTR("titleOpacityCCoeff"));
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Title Opacity D"), CFSTR("titleOpacityDCoeff"));
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "minValue:maxValue:", 20.0, 200.0);
  v263 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v264, "setPrecision:", 6);
  v215 = (void *)MEMORY[0x1E0D83070];
  v365[0] = v270;
  v365[1] = v269;
  v365[2] = v211;
  v365[3] = v266;
  v365[4] = v265;
  v365[5] = v264;
  v365[6] = v263;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v365, 7);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "sectionWithRows:title:", v216, CFSTR("Title Opacity"));
  v257 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Redact Window Contents"), CFSTR("shouldRedactWindowContents"));
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Show Modifier Debug Label"), CFSTR("showModifierDebugLabel"));
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Show Main Modifier Timeline"), CFSTR("showMainModifierTimeline"));
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Show Floating Modifier Timeline"), CFSTR("showFloatingModifierTimeline"));
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = (void *)MEMORY[0x1E0D83070];
  v364[0] = v262;
  v364[1] = v261;
  v364[2] = v260;
  v364[3] = v259;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v364, 4);
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "sectionWithRows:", v218);
  v258 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("No Snapshots"), CFSTR("simplicityOptionNoSnapshots"));
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "valueValidator:", &__block_literal_global_300);
  v256 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("No Crossfade"), CFSTR("simplicityOptionNoCrossfade"));
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v220, "valueValidator:", &__block_literal_global_351);
  v255 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("No Labels"), CFSTR("simplicityOptionNoLabels"));
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v221, "valueValidator:", &__block_literal_global_352);
  v254 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("No Icons"), CFSTR("simplicityOptionNoIcons"));
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v222, "valueValidator:", &__block_literal_global_353);
  v253 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("No Blurs"), CFSTR("simplicityOptionNoBlurs"));
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v223, "valueValidator:", &__block_literal_global_354);
  v252 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("No Shadows"), CFSTR("simplicityOptionNoShadows"));
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "valueValidator:", &__block_literal_global_355);
  v251 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("No Control Center"), CFSTR("simplicityOptionNoControlCenter"));
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v225, "valueValidator:", &__block_literal_global_356);
  v250 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("No Snapshot Bkg"), CFSTR("simplicityOptionNoSnapshotBkg"));
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v226, "valueValidator:", &__block_literal_global_357);
  v249 = (void *)objc_claimAutoreleasedReturnValue();

  v227 = (void *)MEMORY[0x1E0D83070];
  v363[0] = v256;
  v363[1] = v255;
  v363[2] = v254;
  v363[3] = v253;
  v363[4] = v252;
  v363[5] = v251;
  v363[6] = v250;
  v363[7] = v249;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v363, 8);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "sectionWithRows:title:", v228, CFSTR("Simplicity"));
  v301 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83008], "rowWithTitle:outletKeyPath:", CFSTR("Clear Switcher Model"), CFSTR("clearModelOutlet"));
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83008], "rowWithTitle:outletKeyPath:", CFSTR("Stash Switcher Model"), CFSTR("stashModelOutlet"));
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83008], "rowWithTitle:outletKeyPath:", CFSTR("Load Stashed Switcher Model"), CFSTR("loadModelOutlet"));
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83008], "rowWithTitle:outletKeyPath:", CFSTR("Add All Apps to Model"), CFSTR("addAppsToModelOutlet"));
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83008], "rowWithTitle:outletKeyPath:", CFSTR("Add Apps used in PPT tests to Model"), CFSTR("addPPTAppsToModelOutlet"));
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Disable Model Updates for Demo"), CFSTR("shouldDisableSwitcherModelUpdatesForDemo"));
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "valueValidator:", &__block_literal_global_356);
  v230 = (void *)objc_claimAutoreleasedReturnValue();

  v231 = (void *)MEMORY[0x1E0D83070];
  v362[0] = v248;
  v362[1] = v247;
  v362[2] = v246;
  v362[3] = v245;
  v362[4] = v244;
  v362[5] = v230;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v362, 6);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v231, "sectionWithRows:", v232);
  v233 = (void *)objc_claimAutoreleasedReturnValue();

  v234 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v234, "rowWithTitle:action:", CFSTR("Restore Defaults"), v235);
  v236 = (void *)objc_claimAutoreleasedReturnValue();

  v237 = (void *)MEMORY[0x1E0D83070];
  v361 = v236;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v361, 1);
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v237, "sectionWithRows:", v238);
  v239 = (void *)objc_claimAutoreleasedReturnValue();

  v240 = (void *)MEMORY[0x1E0D83070];
  v360[0] = v357;
  v360[1] = v356;
  v360[2] = v345;
  v360[3] = v355;
  v360[4] = v354;
  v360[5] = v353;
  v360[6] = v352;
  v360[7] = v351;
  v360[8] = v349;
  v360[9] = v347;
  v360[10] = v343;
  v360[11] = v340;
  v360[12] = v337;
  v360[13] = v334;
  v360[14] = v330;
  v360[15] = v328;
  v360[16] = v314;
  v360[17] = v302;
  v360[18] = v304;
  v360[19] = v303;
  v360[20] = v301;
  v360[21] = v267;
  v360[22] = v257;
  v360[23] = v258;
  v360[24] = v233;
  v360[25] = v239;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v360, 26);
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "moduleWithTitle:contents:", CFSTR("App Switcher"), v241);
  v242 = (void *)objc_claimAutoreleasedReturnValue();

  return v242;
}

id __49__SBAppSwitcherSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "setSimplicityOptions:", objc_msgSend(v5, "simplicityOptions") & 0xFFFFFFFFFFFFFFFELL | objc_msgSend(v4, "BOOLValue"));

  return v4;
}

id __49__SBAppSwitcherSettings_settingsControllerModule__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "simplicityOptions");
  v7 = objc_msgSend(v4, "BOOLValue");
  v8 = 2;
  if (!v7)
    v8 = 0;
  objc_msgSend(v5, "setSimplicityOptions:", v8 | v6 & 0xFFFFFFFFFFFFFFFDLL);

  return v4;
}

id __49__SBAppSwitcherSettings_settingsControllerModule__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "simplicityOptions");
  v7 = objc_msgSend(v4, "BOOLValue");
  v8 = 4;
  if (!v7)
    v8 = 0;
  objc_msgSend(v5, "setSimplicityOptions:", v8 | v6 & 0xFFFFFFFFFFFFFFFBLL);

  return v4;
}

id __49__SBAppSwitcherSettings_settingsControllerModule__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "simplicityOptions");
  v7 = objc_msgSend(v4, "BOOLValue");
  v8 = 8;
  if (!v7)
    v8 = 0;
  objc_msgSend(v5, "setSimplicityOptions:", v8 | v6 & 0xFFFFFFFFFFFFFFF7);

  return v4;
}

id __49__SBAppSwitcherSettings_settingsControllerModule__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "simplicityOptions");
  v7 = objc_msgSend(v4, "BOOLValue");
  v8 = 16;
  if (!v7)
    v8 = 0;
  objc_msgSend(v5, "setSimplicityOptions:", v8 | v6 & 0xFFFFFFFFFFFFFFEFLL);

  return v4;
}

id __49__SBAppSwitcherSettings_settingsControllerModule__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "simplicityOptions");
  v7 = objc_msgSend(v4, "BOOLValue");
  v8 = 32;
  if (!v7)
    v8 = 0;
  objc_msgSend(v5, "setSimplicityOptions:", v8 | v6 & 0xFFFFFFFFFFFFFFDFLL);

  return v4;
}

id __49__SBAppSwitcherSettings_settingsControllerModule__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "simplicityOptions");
  v7 = objc_msgSend(v4, "BOOLValue");
  v8 = 64;
  if (!v7)
    v8 = 0;
  objc_msgSend(v5, "setSimplicityOptions:", v8 | v6 & 0xFFFFFFFFFFFFFFBFLL);

  return v4;
}

id __49__SBAppSwitcherSettings_settingsControllerModule__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "simplicityOptions");
  v7 = objc_msgSend(v4, "BOOLValue");
  v8 = 128;
  if (!v7)
    v8 = 0;
  objc_msgSend(v5, "setSimplicityOptions:", v8 | v6 & 0xFFFFFFFFFFFFFF7FLL);

  return v4;
}

- (id)archiveValueForKey:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("simplicityOptionNoSnapshots")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("simplicityOptionNoCrossfade")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("simplicityOptionNoLabels")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("simplicityOptionNoIcons")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("simplicityOptionNoBlurs")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("simplicityOptionNoShadows")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("simplicityOptionNoControlCenter")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("simplicityOptionNoSnapshotBkg")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBAppSwitcherSettings;
    -[PTSettings archiveValueForKey:](&v7, sel_archiveValueForKey_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)setSimplicityOptions:(int64_t)a3
{
  if (self->_simplicityOptions != a3)
  {
    self->_simplicityOptions = a3;
    -[SBAppSwitcherSettings setSimplicityOptionNoSnapshots:](self, "setSimplicityOptionNoSnapshots:", a3 & 1);
    -[SBAppSwitcherSettings setSimplicityOptionNoCrossfade:](self, "setSimplicityOptionNoCrossfade:", ((unint64_t)a3 >> 1) & 1);
    -[SBAppSwitcherSettings setSimplicityOptionNoLabels:](self, "setSimplicityOptionNoLabels:", ((unint64_t)a3 >> 2) & 1);
    -[SBAppSwitcherSettings setSimplicityOptionNoIcons:](self, "setSimplicityOptionNoIcons:", ((unint64_t)a3 >> 3) & 1);
    -[SBAppSwitcherSettings setSimplicityOptionNoBlurs:](self, "setSimplicityOptionNoBlurs:", ((unint64_t)a3 >> 4) & 1);
    -[SBAppSwitcherSettings setSimplicityOptionNoShadows:](self, "setSimplicityOptionNoShadows:", ((unint64_t)a3 >> 5) & 1);
    -[SBAppSwitcherSettings setSimplicityOptionNoControlCenter:](self, "setSimplicityOptionNoControlCenter:", ((unint64_t)a3 >> 6) & 1);
  }
}

- (double)_spacingBetweenLeadingEdgeAndIcon
{
  int v2;
  double result;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  if (__sb__runningInSpringBoard())
  {
    v2 = SBFEffectiveDeviceClass();
    result = 8.0;
    if (v2 == 2)
      return result;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    result = 8.0;
    if (v5 == 1)
      return result;
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass())
    {
      v6 = SBFEffectiveDeviceClass();
      result = 14.0;
      if (v6 != 1)
        return result;
    }
    v7 = SBFEffectiveHomeButtonType();
    result = 14.0;
    if (v7 != 2)
      return result;
LABEL_13:
    v10 = SBHScreenTypeForCurrentDevice();
    result = 24.0;
    if ((unint64_t)(v10 - 9) <= 0xF)
      return dbl_1D0E8B1F0[v10 - 9];
    return result;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "userInterfaceIdiom"))
  {

    return 14.0;
  }
  v9 = SBFEffectiveHomeButtonType();

  result = 14.0;
  if (v9 == 2)
    goto LABEL_13;
  return result;
}

- (double)liveResizeSceneUpdateDistanceThreshold
{
  return self->_liveResizeSceneUpdateDistanceThreshold;
}

- (void)setLiveResizeSceneUpdateDistanceThreshold:(double)a3
{
  self->_liveResizeSceneUpdateDistanceThreshold = a3;
}

- (double)liveResizeSceneUpdateTimeThresholdSeconds
{
  return self->_liveResizeSceneUpdateTimeThresholdSeconds;
}

- (void)setLiveResizeSceneUpdateTimeThresholdSeconds:(double)a3
{
  self->_liveResizeSceneUpdateTimeThresholdSeconds = a3;
}

- (BOOL)liveResizeUsesGrid
{
  return self->_liveResizeUsesGrid;
}

- (void)setLiveResizeUsesGrid:(BOOL)a3
{
  self->_liveResizeUsesGrid = a3;
}

- (double)liveResizeGridRubberbandingRange
{
  return self->_liveResizeGridRubberbandingRange;
}

- (void)setLiveResizeGridRubberbandingRange:(double)a3
{
  self->_liveResizeGridRubberbandingRange = a3;
}

- (double)liveResizeGridMinimumWidth
{
  return self->_liveResizeGridMinimumWidth;
}

- (void)setLiveResizeGridMinimumWidth:(double)a3
{
  self->_liveResizeGridMinimumWidth = a3;
}

- (double)liveResizeGridMinimumHeight
{
  return self->_liveResizeGridMinimumHeight;
}

- (void)setLiveResizeGridMinimumHeight:(double)a3
{
  self->_liveResizeGridMinimumHeight = a3;
}

- (BOOL)liveResizeSendsAnimatedSceneSizeUpdates
{
  return self->_liveResizeSendsAnimatedSceneSizeUpdates;
}

- (void)setLiveResizeSendsAnimatedSceneSizeUpdates:(BOOL)a3
{
  self->_liveResizeSendsAnimatedSceneSizeUpdates = a3;
}

- (double)liveResizePointerInteractionRegionOuterLength
{
  return self->_liveResizePointerInteractionRegionOuterLength;
}

- (void)setLiveResizePointerInteractionRegionOuterLength:(double)a3
{
  self->_liveResizePointerInteractionRegionOuterLength = a3;
}

- (double)liveResizePointerInteractionRegionInnerLength
{
  return self->_liveResizePointerInteractionRegionInnerLength;
}

- (void)setLiveResizePointerInteractionRegionInnerLength:(double)a3
{
  self->_liveResizePointerInteractionRegionInnerLength = a3;
}

- (void)setSnapshotAspectRatioAcceptanceThreshold:(double)a3
{
  self->_snapshotAspectRatioAcceptanceThreshold = a3;
}

- (void)setSwitcherStyle:(int64_t)a3
{
  self->_switcherStyle = a3;
}

- (BOOL)useAsynchronousRendering
{
  return self->_useAsynchronousRendering;
}

- (void)setUseAsynchronousRendering:(BOOL)a3
{
  self->_useAsynchronousRendering = a3;
}

- (BOOL)shouldRoundCornersDuringSwipeUp
{
  return self->_shouldRoundCornersDuringSwipeUp;
}

- (void)setShouldRoundCornersDuringSwipeUp:(BOOL)a3
{
  self->_shouldRoundCornersDuringSwipeUp = a3;
}

- (void)setAsynchronousRenderingDisableSurfaceCacheDelayDuration:(double)a3
{
  self->_asynchronousRenderingDisableSurfaceCacheDelayDuration = a3;
}

- (void)setPreventMedusaSnapshotsAfterTransitionDuration:(double)a3
{
  self->_preventMedusaSnapshotsAfterTransitionDuration = a3;
}

- (SBSwitcherSystemApertureSettings)systemApertureSettings
{
  return self->_systemApertureSettings;
}

- (void)setSystemApertureSettings:(id)a3
{
  objc_storeStrong((id *)&self->_systemApertureSettings, a3);
}

- (void)setChamoisSettings:(id)a3
{
  objc_storeStrong((id *)&self->_chamoisSettings, a3);
}

- (SBFloatingSwitcherSettings)floatingSwitcherSettings
{
  return self->_floatingSwitcherSettings;
}

- (void)setFloatingSwitcherSettings:(id)a3
{
  objc_storeStrong((id *)&self->_floatingSwitcherSettings, a3);
}

- (SBCenterWindowSizingSettings)centerWindowSizingSettings
{
  return self->_centerWindowSizingSettings;
}

- (void)setCenterWindowSizingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_centerWindowSizingSettings, a3);
}

- (double)mScale
{
  return self->_mScale;
}

- (void)setMScale:(double)a3
{
  self->_mScale = a3;
}

- (double)centerPoint
{
  return self->_centerPoint;
}

- (void)setCenterPoint:(double)a3
{
  self->_centerPoint = a3;
}

- (double)maxScale
{
  return self->_maxScale;
}

- (void)setMaxScale:(double)a3
{
  self->_maxScale = a3;
}

- (double)mAlpha
{
  return self->_mAlpha;
}

- (void)setMAlpha:(double)a3
{
  self->_mAlpha = a3;
}

- (double)bAlpha
{
  return self->_bAlpha;
}

- (void)setBAlpha:(double)a3
{
  self->_bAlpha = a3;
}

- (double)mDarkening
{
  return self->_mDarkening;
}

- (void)setMDarkening:(double)a3
{
  self->_mDarkening = a3;
}

- (double)bDarkening
{
  return self->_bDarkening;
}

- (void)setBDarkening:(double)a3
{
  self->_bDarkening = a3;
}

- (double)maxDarkening
{
  return self->_maxDarkening;
}

- (void)setMaxDarkening:(double)a3
{
  self->_maxDarkening = a3;
}

- (double)tetheredInsertionRemovalInsetForDeterminingVisibility
{
  return self->_tetheredInsertionRemovalInsetForDeterminingVisibility;
}

- (void)setTetheredInsertionRemovalInsetForDeterminingVisibility:(double)a3
{
  self->_tetheredInsertionRemovalInsetForDeterminingVisibility = a3;
}

- (double)switcherCardScaleWhileTouched
{
  return self->_switcherCardScaleWhileTouched;
}

- (void)setSwitcherCardScaleWhileTouched:(double)a3
{
  self->_switcherCardScaleWhileTouched = a3;
}

- (double)switcherCardScaleWhileCursorHovered
{
  return self->_switcherCardScaleWhileCursorHovered;
}

- (void)setSwitcherCardScaleWhileCursorHovered:(double)a3
{
  self->_switcherCardScaleWhileCursorHovered = a3;
}

- (double)switcherCardShadowRadius
{
  return self->_switcherCardShadowRadius;
}

- (void)setSwitcherCardShadowRadius:(double)a3
{
  self->_switcherCardShadowRadius = a3;
}

- (double)switcherCardShadowOpacity
{
  return self->_switcherCardShadowOpacity;
}

- (void)setSwitcherCardShadowOpacity:(double)a3
{
  self->_switcherCardShadowOpacity = a3;
}

- (double)switcherCardShadowOffsetHorizontal
{
  return self->_switcherCardShadowOffsetHorizontal;
}

- (void)setSwitcherCardShadowOffsetHorizontal:(double)a3
{
  self->_switcherCardShadowOffsetHorizontal = a3;
}

- (double)switcherCardShadowOffsetVertical
{
  return self->_switcherCardShadowOffsetVertical;
}

- (void)setSwitcherCardShadowOffsetVertical:(double)a3
{
  self->_switcherCardShadowOffsetVertical = a3;
}

- (void)setSwitcherCenterYOffsetPercentOfScreenHeight:(double)a3
{
  self->_switcherCenterYOffsetPercentOfScreenHeight = a3;
}

- (double)switcherCardShadowRadiusWhileTouched
{
  return self->_switcherCardShadowRadiusWhileTouched;
}

- (void)setSwitcherCardShadowRadiusWhileTouched:(double)a3
{
  self->_switcherCardShadowRadiusWhileTouched = a3;
}

- (double)switcherCardShadowOpacityWhileTouched
{
  return self->_switcherCardShadowOpacityWhileTouched;
}

- (void)setSwitcherCardShadowOpacityWhileTouched:(double)a3
{
  self->_switcherCardShadowOpacityWhileTouched = a3;
}

- (double)switcherCardShadowOffsetHorizontalWhileTouched
{
  return self->_switcherCardShadowOffsetHorizontalWhileTouched;
}

- (void)setSwitcherCardShadowOffsetHorizontalWhileTouched:(double)a3
{
  self->_switcherCardShadowOffsetHorizontalWhileTouched = a3;
}

- (double)switcherCardShadowOffsetVerticalWhileTouched
{
  return self->_switcherCardShadowOffsetVerticalWhileTouched;
}

- (void)setSwitcherCardShadowOffsetVerticalWhileTouched:(double)a3
{
  self->_switcherCardShadowOffsetVerticalWhileTouched = a3;
}

- (double)cursorHoverShadowRadiusInterpolationAmount
{
  return self->_cursorHoverShadowRadiusInterpolationAmount;
}

- (void)setCursorHoverShadowRadiusInterpolationAmount:(double)a3
{
  self->_cursorHoverShadowRadiusInterpolationAmount = a3;
}

- (double)cursorHoverShadowOpacityInterpolationAmount
{
  return self->_cursorHoverShadowOpacityInterpolationAmount;
}

- (void)setCursorHoverShadowOpacityInterpolationAmount:(double)a3
{
  self->_cursorHoverShadowOpacityInterpolationAmount = a3;
}

- (double)cursorHoverShadowOffsetInterpolationAmount
{
  return self->_cursorHoverShadowOffsetInterpolationAmount;
}

- (void)setCursorHoverShadowOffsetInterpolationAmount:(double)a3
{
  self->_cursorHoverShadowOffsetInterpolationAmount = a3;
}

- (double)peekInsetWidth
{
  return self->_peekInsetWidth;
}

- (void)setPeekInsetWidth:(double)a3
{
  self->_peekInsetWidth = a3;
}

- (double)tintStyleDimmingAlphaInFocusForDarkMode
{
  return self->_tintStyleDimmingAlphaInFocusForDarkMode;
}

- (void)setTintStyleDimmingAlphaInFocusForDarkMode:(double)a3
{
  self->_tintStyleDimmingAlphaInFocusForDarkMode = a3;
}

- (double)tintStyleDimmingAlphaUnFocusForDarkMode
{
  return self->_tintStyleDimmingAlphaUnFocusForDarkMode;
}

- (void)setTintStyleDimmingAlphaUnFocusForDarkMode:(double)a3
{
  self->_tintStyleDimmingAlphaUnFocusForDarkMode = a3;
}

- (double)tintStyleDimmingAlphaInFocusForLightMode
{
  return self->_tintStyleDimmingAlphaInFocusForLightMode;
}

- (void)setTintStyleDimmingAlphaInFocusForLightMode:(double)a3
{
  self->_tintStyleDimmingAlphaInFocusForLightMode = a3;
}

- (double)appExposeNonFloatingSingleRowScale
{
  return self->_appExposeNonFloatingSingleRowScale;
}

- (void)setAppExposeNonFloatingSingleRowScale:(double)a3
{
  self->_appExposeNonFloatingSingleRowScale = a3;
}

- (double)appExposeNonFloatingDoubleRowScale
{
  return self->_appExposeNonFloatingDoubleRowScale;
}

- (void)setAppExposeNonFloatingDoubleRowScale:(double)a3
{
  self->_appExposeNonFloatingDoubleRowScale = a3;
}

- (double)appExposeFloatingDoubleRowScale
{
  return self->_appExposeFloatingDoubleRowScale;
}

- (void)setAppExposeFloatingDoubleRowScale:(double)a3
{
  self->_appExposeFloatingDoubleRowScale = a3;
}

- (double)gridSwitcherPageScale
{
  return self->_gridSwitcherPageScale;
}

- (void)setGridSwitcherPageScale:(double)a3
{
  self->_gridSwitcherPageScale = a3;
}

- (double)gridSwitcherHorizontalInterpageSpacingLandscape
{
  return self->_gridSwitcherHorizontalInterpageSpacingLandscape;
}

- (void)setGridSwitcherHorizontalInterpageSpacingLandscape:(double)a3
{
  self->_gridSwitcherHorizontalInterpageSpacingLandscape = a3;
}

- (double)gridSwitcherVerticalNaturalSpacingLandscape
{
  return self->_gridSwitcherVerticalNaturalSpacingLandscape;
}

- (void)setGridSwitcherVerticalNaturalSpacingLandscape:(double)a3
{
  self->_gridSwitcherVerticalNaturalSpacingLandscape = a3;
}

- (double)gridSwitcherHorizontalInterpageSpacingPortrait
{
  return self->_gridSwitcherHorizontalInterpageSpacingPortrait;
}

- (void)setGridSwitcherHorizontalInterpageSpacingPortrait:(double)a3
{
  self->_gridSwitcherHorizontalInterpageSpacingPortrait = a3;
}

- (double)gridSwitcherVerticalNaturalSpacingPortrait
{
  return self->_gridSwitcherVerticalNaturalSpacingPortrait;
}

- (void)setGridSwitcherVerticalNaturalSpacingPortrait:(double)a3
{
  self->_gridSwitcherVerticalNaturalSpacingPortrait = a3;
}

- (double)gridSwitcherSnapToControlCenterHeightSlop
{
  return self->_gridSwitcherSnapToControlCenterHeightSlop;
}

- (void)setGridSwitcherSnapToControlCenterHeightSlop:(double)a3
{
  self->_gridSwitcherSnapToControlCenterHeightSlop = a3;
}

- (double)gridSwitcherSwipeUpNormalizedRubberbandingRange
{
  return self->_gridSwitcherSwipeUpNormalizedRubberbandingRange;
}

- (void)setGridSwitcherSwipeUpNormalizedRubberbandingRange:(double)a3
{
  self->_gridSwitcherSwipeUpNormalizedRubberbandingRange = a3;
}

- (double)gridSwitcherSwipeUpNormalizedRubberbandedTranslationAtMinimumScale
{
  return self->_gridSwitcherSwipeUpNormalizedRubberbandedTranslationAtMinimumScale;
}

- (void)setGridSwitcherSwipeUpNormalizedRubberbandedTranslationAtMinimumScale:(double)a3
{
  self->_gridSwitcherSwipeUpNormalizedRubberbandedTranslationAtMinimumScale = a3;
}

- (double)gridSwitcherSwipeUpMinimumScale
{
  return self->_gridSwitcherSwipeUpMinimumScale;
}

- (void)setGridSwitcherSwipeUpMinimumScale:(double)a3
{
  self->_gridSwitcherSwipeUpMinimumScale = a3;
}

- (double)gridSwitcherHomeButtonDeviceCardCornerRadius
{
  return self->_gridSwitcherHomeButtonDeviceCardCornerRadius;
}

- (void)setGridSwitcherHomeButtonDeviceCardCornerRadius:(double)a3
{
  self->_gridSwitcherHomeButtonDeviceCardCornerRadius = a3;
}

- (unint64_t)numberOfSnapshotsToCacheInSwitcher
{
  return self->_numberOfSnapshotsToCacheInSwitcher;
}

- (void)setNumberOfSnapshotsToCacheInSwitcher:(unint64_t)a3
{
  self->_numberOfSnapshotsToCacheInSwitcher = a3;
}

- (unint64_t)numberOfSnapshotsToAlwaysKeepAround
{
  return self->_numberOfSnapshotsToAlwaysKeepAround;
}

- (void)setNumberOfSnapshotsToAlwaysKeepAround:(unint64_t)a3
{
  self->_numberOfSnapshotsToAlwaysKeepAround = a3;
}

- (double)spacingBetweenLeadingEdgeAndIcon
{
  return self->_spacingBetweenLeadingEdgeAndIcon;
}

- (void)setSpacingBetweenLeadingEdgeAndIcon:(double)a3
{
  self->_spacingBetweenLeadingEdgeAndIcon = a3;
}

- (double)spacingBetweenTrailingEdgeAndLabels
{
  return self->_spacingBetweenTrailingEdgeAndLabels;
}

- (void)setSpacingBetweenTrailingEdgeAndLabels:(double)a3
{
  self->_spacingBetweenTrailingEdgeAndLabels = a3;
}

- (double)iconSideLength
{
  return self->_iconSideLength;
}

- (void)setIconSideLength:(double)a3
{
  self->_iconSideLength = a3;
}

- (double)spacingBetweenSnapshotAndIcon
{
  return self->_spacingBetweenSnapshotAndIcon;
}

- (void)setSpacingBetweenSnapshotAndIcon:(double)a3
{
  self->_spacingBetweenSnapshotAndIcon = a3;
}

- (double)spacingBetweenSnapshotAndDescriptionLabelBaseline
{
  return self->_spacingBetweenSnapshotAndDescriptionLabelBaseline;
}

- (void)setSpacingBetweenSnapshotAndDescriptionLabelBaseline:(double)a3
{
  self->_spacingBetweenSnapshotAndDescriptionLabelBaseline = a3;
}

- (double)spacingBetweenTitleAndSubtitleBaseline
{
  return self->_spacingBetweenTitleAndSubtitleBaseline;
}

- (void)setSpacingBetweenTitleAndSubtitleBaseline:(double)a3
{
  self->_spacingBetweenTitleAndSubtitleBaseline = a3;
}

- (double)spacingBetweenIconAndLabel
{
  return self->_spacingBetweenIconAndLabel;
}

- (void)setSpacingBetweenIconAndLabel:(double)a3
{
  self->_spacingBetweenIconAndLabel = a3;
}

- (double)spacingBetweenLabelAndMultipleWindowsIndicator
{
  return self->_spacingBetweenLabelAndMultipleWindowsIndicator;
}

- (void)setSpacingBetweenLabelAndMultipleWindowsIndicator:(double)a3
{
  self->_spacingBetweenLabelAndMultipleWindowsIndicator = a3;
}

- (double)multipleWindowsIndicatorSideLength
{
  return self->_multipleWindowsIndicatorSideLength;
}

- (void)setMultipleWindowsIndicatorSideLength:(double)a3
{
  self->_multipleWindowsIndicatorSideLength = a3;
}

- (double)spacingBetweenLabelAndSecondIcon
{
  return self->_spacingBetweenLabelAndSecondIcon;
}

- (void)setSpacingBetweenLabelAndSecondIcon:(double)a3
{
  self->_spacingBetweenLabelAndSecondIcon = a3;
}

- (double)spacingBetweenBoundsCenterAndSecondIcon
{
  return self->_spacingBetweenBoundsCenterAndSecondIcon;
}

- (void)setSpacingBetweenBoundsCenterAndSecondIcon:(double)a3
{
  self->_spacingBetweenBoundsCenterAndSecondIcon = a3;
}

- (void)setDeckSwitcherPageScale:(double)a3
{
  self->_deckSwitcherPageScale = a3;
}

- (double)deckSwitcherDecelerationRate
{
  return self->_deckSwitcherDecelerationRate;
}

- (void)setDeckSwitcherDecelerationRate:(double)a3
{
  self->_deckSwitcherDecelerationRate = a3;
}

- (double)aExpLayoutCoeff
{
  return self->_aExpLayoutCoeff;
}

- (void)setAExpLayoutCoeff:(double)a3
{
  self->_aExpLayoutCoeff = a3;
}

- (double)bExpLayoutCoeff
{
  return self->_bExpLayoutCoeff;
}

- (void)setBExpLayoutCoeff:(double)a3
{
  self->_bExpLayoutCoeff = a3;
}

- (double)depthPadding
{
  return self->_depthPadding;
}

- (void)setDepthPadding:(double)a3
{
  self->_depthPadding = a3;
}

- (double)offscreenCardScaleForFlyIn
{
  return self->_offscreenCardScaleForFlyIn;
}

- (void)setOffscreenCardScaleForFlyIn:(double)a3
{
  self->_offscreenCardScaleForFlyIn = a3;
}

- (double)coplanarSpacingPhone
{
  return self->_coplanarSpacingPhone;
}

- (void)setCoplanarSpacingPhone:(double)a3
{
  self->_coplanarSpacingPhone = a3;
}

- (double)coplanarSpacingPad
{
  return self->_coplanarSpacingPad;
}

- (void)setCoplanarSpacingPad:(double)a3
{
  self->_coplanarSpacingPad = a3;
}

- (BOOL)useTitleOpacityPrototypeSettings
{
  return self->_useTitleOpacityPrototypeSettings;
}

- (void)setUseTitleOpacityPrototypeSettings:(BOOL)a3
{
  self->_useTitleOpacityPrototypeSettings = a3;
}

- (double)titleOpacityACoeff
{
  return self->_titleOpacityACoeff;
}

- (void)setTitleOpacityACoeff:(double)a3
{
  self->_titleOpacityACoeff = a3;
}

- (double)titleOpacityBCoeff
{
  return self->_titleOpacityBCoeff;
}

- (void)setTitleOpacityBCoeff:(double)a3
{
  self->_titleOpacityBCoeff = a3;
}

- (double)titleOpacityCCoeff
{
  return self->_titleOpacityCCoeff;
}

- (void)setTitleOpacityCCoeff:(double)a3
{
  self->_titleOpacityCCoeff = a3;
}

- (double)titleOpacityDCoeff
{
  return self->_titleOpacityDCoeff;
}

- (void)setTitleOpacityDCoeff:(double)a3
{
  self->_titleOpacityDCoeff = a3;
}

- (void)setShouldRedactWindowContents:(BOOL)a3
{
  self->_shouldRedactWindowContents = a3;
}

- (BOOL)showModifierDebugLabel
{
  return self->_showModifierDebugLabel;
}

- (void)setShowModifierDebugLabel:(BOOL)a3
{
  self->_showModifierDebugLabel = a3;
}

- (BOOL)showMainModifierTimeline
{
  return self->_showMainModifierTimeline;
}

- (void)setShowMainModifierTimeline:(BOOL)a3
{
  self->_showMainModifierTimeline = a3;
}

- (BOOL)showFloatingModifierTimeline
{
  return self->_showFloatingModifierTimeline;
}

- (void)setShowFloatingModifierTimeline:(BOOL)a3
{
  self->_showFloatingModifierTimeline = a3;
}

- (void)setShouldDisableSwitcherModelUpdatesForDemo:(BOOL)a3
{
  self->_shouldDisableSwitcherModelUpdatesForDemo = a3;
}

- (void)setAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_animationSettings, a3);
}

- (PTOutlet)clearModelOutlet
{
  return self->_clearModelOutlet;
}

- (void)setClearModelOutlet:(id)a3
{
  objc_storeStrong((id *)&self->_clearModelOutlet, a3);
}

- (PTOutlet)stashModelOutlet
{
  return self->_stashModelOutlet;
}

- (void)setStashModelOutlet:(id)a3
{
  objc_storeStrong((id *)&self->_stashModelOutlet, a3);
}

- (PTOutlet)loadModelOutlet
{
  return self->_loadModelOutlet;
}

- (void)setLoadModelOutlet:(id)a3
{
  objc_storeStrong((id *)&self->_loadModelOutlet, a3);
}

- (PTOutlet)addAppsToModelOutlet
{
  return self->_addAppsToModelOutlet;
}

- (void)setAddAppsToModelOutlet:(id)a3
{
  objc_storeStrong((id *)&self->_addAppsToModelOutlet, a3);
}

- (PTOutlet)addPPTAppsToModelOutlet
{
  return self->_addPPTAppsToModelOutlet;
}

- (void)setAddPPTAppsToModelOutlet:(id)a3
{
  objc_storeStrong((id *)&self->_addPPTAppsToModelOutlet, a3);
}

- (BOOL)simplicityOptionNoSnapshots
{
  return self->_simplicityOptionNoSnapshots;
}

- (void)setSimplicityOptionNoSnapshots:(BOOL)a3
{
  self->_simplicityOptionNoSnapshots = a3;
}

- (BOOL)simplicityOptionNoCrossfade
{
  return self->_simplicityOptionNoCrossfade;
}

- (void)setSimplicityOptionNoCrossfade:(BOOL)a3
{
  self->_simplicityOptionNoCrossfade = a3;
}

- (BOOL)simplicityOptionNoLabels
{
  return self->_simplicityOptionNoLabels;
}

- (void)setSimplicityOptionNoLabels:(BOOL)a3
{
  self->_simplicityOptionNoLabels = a3;
}

- (BOOL)simplicityOptionNoIcons
{
  return self->_simplicityOptionNoIcons;
}

- (void)setSimplicityOptionNoIcons:(BOOL)a3
{
  self->_simplicityOptionNoIcons = a3;
}

- (BOOL)simplicityOptionNoBlurs
{
  return self->_simplicityOptionNoBlurs;
}

- (void)setSimplicityOptionNoBlurs:(BOOL)a3
{
  self->_simplicityOptionNoBlurs = a3;
}

- (BOOL)simplicityOptionNoShadows
{
  return self->_simplicityOptionNoShadows;
}

- (void)setSimplicityOptionNoShadows:(BOOL)a3
{
  self->_simplicityOptionNoShadows = a3;
}

- (BOOL)simplicityOptionNoControlCenter
{
  return self->_simplicityOptionNoControlCenter;
}

- (void)setSimplicityOptionNoControlCenter:(BOOL)a3
{
  self->_simplicityOptionNoControlCenter = a3;
}

- (BOOL)simplicityOptionNoSnapshotBkg
{
  return self->_simplicityOptionNoSnapshotBkg;
}

- (void)setSimplicityOptionNoSnapshotBkg:(BOOL)a3
{
  self->_simplicityOptionNoSnapshotBkg = a3;
}

- (BOOL)showFloats
{
  return self->_showFloats;
}

- (void)setShowFloats:(BOOL)a3
{
  self->_showFloats = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addPPTAppsToModelOutlet, 0);
  objc_storeStrong((id *)&self->_addAppsToModelOutlet, 0);
  objc_storeStrong((id *)&self->_loadModelOutlet, 0);
  objc_storeStrong((id *)&self->_stashModelOutlet, 0);
  objc_storeStrong((id *)&self->_clearModelOutlet, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_centerWindowSizingSettings, 0);
  objc_storeStrong((id *)&self->_floatingSwitcherSettings, 0);
  objc_storeStrong((id *)&self->_chamoisSettings, 0);
  objc_storeStrong((id *)&self->_systemApertureSettings, 0);
}

@end
