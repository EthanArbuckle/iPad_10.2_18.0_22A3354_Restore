@implementation SBTransitionSwitcherModifierEvent

- (int64_t)type
{
  return 1;
}

- (SBTransitionSwitcherModifierEvent)initWithTransitionID:(id)a3 phase:(unint64_t)a4 animated:(BOOL)a5
{
  id v9;
  SBTransitionSwitcherModifierEvent *v10;
  SBTransitionSwitcherModifierEvent *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBTransitionSwitcherModifierEvent;
  v10 = -[SBTransitionSwitcherModifierEvent init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_transitionID, a3);
    v11->_phase = a4;
    v11->_animated = a5;
  }

  return v11;
}

- (void)setShelfRequestTransition:(BOOL)a3
{
  self->_shelfRequestTransition = a3;
}

- (BOOL)isMoveDisplaysTransition
{
  return self->_moveDisplaysTransition;
}

- (BOOL)toFloatingSwitcherVisible
{
  return self->_toFloatingSwitcherVisible;
}

- (SBAppLayout)toFloatingAppLayout
{
  return self->_toFloatingAppLayout;
}

- (void)setiPadOSWindowingModeChangeEvent:(BOOL)a3
{
  self->_iPadOSWindowingModeChangeEvent = a3;
}

- (void)setZoomFromSystemApertureTransition:(BOOL)a3
{
  self->_zoomFromSystemApertureTransition = a3;
}

- (void)setTopAffordanceInitiated:(BOOL)a3
{
  self->_topAffordanceInitiated = a3;
}

- (void)setToWindowPickerRole:(int64_t)a3
{
  self->_toWindowPickerRole = a3;
}

- (void)setToSpaceConfiguration:(int64_t)a3
{
  self->_toSpaceConfiguration = a3;
}

- (void)setToPeekConfiguration:(int64_t)a3
{
  self->_toPeekConfiguration = a3;
}

- (void)setToInterfaceOrientation:(int64_t)a3
{
  self->_toInterfaceOrientation = a3;
}

- (void)setToFloatingSwitcherVisible:(BOOL)a3
{
  self->_toFloatingSwitcherVisible = a3;
}

- (void)setToFloatingConfiguration:(int64_t)a3
{
  self->_toFloatingConfiguration = a3;
}

- (void)setToFloatingAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_toFloatingAppLayout, a3);
}

- (void)setToEnvironmentMode:(int64_t)a3
{
  self->_toEnvironmentMode = a3;
}

- (void)setToAppLayoutWantsExclusiveForeground:(BOOL)a3
{
  self->_toAppLayoutWantsExclusiveForeground = a3;
}

- (void)setToAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_toAppLayout, a3);
}

- (void)setToAppExposeBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setSpotlightTransition:(BOOL)a3
{
  self->_spotlightTransition = a3;
}

- (void)setShelfTransition:(BOOL)a3
{
  self->_shelfTransition = a3;
}

- (void)setQuickActionTransition:(BOOL)a3
{
  self->_quickActionTransition = a3;
}

- (void)setPrefersCrossfadeTransition:(BOOL)a3
{
  self->_prefersCrossfadeTransition = a3;
}

- (void)setPrefersCenterZoomTransition:(BOOL)a3
{
  self->_prefersCenterZoomTransition = a3;
}

- (void)setNewSceneTransition:(BOOL)a3
{
  self->_newSceneTransition = a3;
}

- (void)setMoveDisplaysTransition:(BOOL)a3
{
  self->_moveDisplaysTransition = a3;
}

- (void)setMorphingPIPLayoutRole:(int64_t)a3
{
  self->_morphingPIPLayoutRole = a3;
}

- (void)setMorphToPIPTransition:(BOOL)a3
{
  self->_morphToPIPTransition = a3;
}

- (void)setMorphFromInAppView:(BOOL)a3
{
  self->_morphFromInAppView = a3;
}

- (void)setLaunchingFromDockTransition:(BOOL)a3
{
  self->_launchingFromDockTransition = a3;
}

- (void)setKeyboardShortcutInitiated:(BOOL)a3
{
  self->_keyboardShortcutInitiated = a3;
}

- (void)setIconZoomDisabled:(BOOL)a3
{
  self->_iconZoomDisabled = a3;
}

- (void)setGestureInitiated:(BOOL)a3
{
  self->_gestureInitiated = a3;
}

- (void)setFromWindowPickerRole:(int64_t)a3
{
  self->_fromWindowPickerRole = a3;
}

- (void)setFromSpaceConfiguration:(int64_t)a3
{
  self->_fromSpaceConfiguration = a3;
}

- (void)setFromPeekConfiguration:(int64_t)a3
{
  self->_fromPeekConfiguration = a3;
}

- (void)setFromInterfaceOrientation:(int64_t)a3
{
  self->_fromInterfaceOrientation = a3;
}

- (void)setFromFloatingSwitcherVisible:(BOOL)a3
{
  self->_fromFloatingSwitcherVisible = a3;
}

- (void)setFromFloatingConfiguration:(int64_t)a3
{
  self->_fromFloatingConfiguration = a3;
}

- (void)setFromFloatingAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_fromFloatingAppLayout, a3);
}

- (void)setFromEnvironmentMode:(int64_t)a3
{
  self->_fromEnvironmentMode = a3;
}

- (void)setFromDisplayItemsPendingTermination:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void)setFromAppLayoutWantsExclusiveForeground:(BOOL)a3
{
  self->_fromAppLayoutWantsExclusiveForeground = a3;
}

- (void)setFromAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_fromAppLayout, a3);
}

- (void)setFromAppExposeBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setDragAndDropTransition:(BOOL)a3
{
  self->_dragAndDropTransition = a3;
}

- (void)setContinuousExposeConfigurationChangeEvent:(BOOL)a3
{
  self->_continuousExposeConfigurationChangeEvent = a3;
}

- (void)setContinuityTransition:(BOOL)a3
{
  self->_continuityTransition = a3;
}

- (void)setCommandTabTransition:(BOOL)a3
{
  self->_commandTabTransition = a3;
}

- (void)setBreadcrumbTransition:(BOOL)a3
{
  self->_breadcrumbTransition = a3;
}

- (void)setBannerUnfurlTransition:(BOOL)a3
{
  self->_bannerUnfurlTransition = a3;
}

- (void)setBannerUnfurlSourceContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void)setAppLaunchDuringWindowDragGestureTransition:(BOOL)a3
{
  self->_appLaunchDuringWindowDragGestureTransition = a3;
}

- (void)setActivatingAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_activatingAppLayout, a3);
}

- (unint64_t)phase
{
  return self->_phase;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (BOOL)isTransitionEvent
{
  return 1;
}

- (SBAppLayout)toAppLayout
{
  return self->_toAppLayout;
}

- (int64_t)toEnvironmentMode
{
  return self->_toEnvironmentMode;
}

- (BOOL)isDragAndDropTransition
{
  return self->_dragAndDropTransition;
}

- (BOOL)prefersCenterZoomTransition
{
  return self->_prefersCenterZoomTransition;
}

- (BOOL)isZoomFromSystemApertureTransition
{
  return self->_zoomFromSystemApertureTransition;
}

- (BOOL)isSpotlightTransition
{
  return self->_spotlightTransition;
}

- (BOOL)isMorphFromPIPTransition
{
  return self->_morphFromPIPTransition;
}

- (BOOL)isIconZoomDisabled
{
  return self->_iconZoomDisabled;
}

- (BOOL)isExitingSlideOverPeekToHomeScreenEvent
{
  uint64_t v3;
  _BOOL4 v4;

  v3 = -[SBTransitionSwitcherModifierEvent toFloatingConfiguration](self, "toFloatingConfiguration");
  v4 = -[SBTransitionSwitcherModifierEvent isExitingSlideOverPeekEvent](self, "isExitingSlideOverPeekEvent");
  if (v4)
  {
    if (v3)
      LOBYTE(v4) = SBFloatingConfigurationIsStashed(v3);
    else
      LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)prefersCrossfadeTransition
{
  return self->_prefersCrossfadeTransition;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  unint64_t fromEnvironmentMode;
  void *v14;
  void *v15;
  int64_t fromInterfaceOrientation;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  int64_t toInterfaceOrientation;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  unint64_t fromWindowPickerRole;
  void *v25;
  void *v26;
  id v27;
  id v28;
  SBAppLayout *fromFloatingAppLayout;
  void *v30;
  id v31;
  void *v32;
  id v33;
  unint64_t fromFloatingConfiguration;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t fromPeekConfiguration;
  void *v40;
  void *v41;
  unint64_t fromSpaceConfiguration;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  SBAppLayout *activatingAppLayout;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  int64_t dosidoTransitionDirection;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  objc_super v81;

  v81.receiver = self;
  v81.super_class = (Class)SBTransitionSwitcherModifierEvent;
  -[SBSwitcherModifierEvent descriptionBuilderWithMultilinePrefix:](&v81, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_transitionID, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("transitionID"));

  v6 = self->_phase - 1;
  if (v6 > 2)
    v7 = CFSTR("Possible");
  else
    v7 = off_1E8EA4300[v6];
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("phase"));
  NSStringFromBOOL();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v8, CFSTR("animated"));

  if ((BSEqualObjects() & 1) == 0)
  {
    -[SBAppLayout succinctDescription](self->_fromAppLayout, "succinctDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("fromAppLayout"));

    -[SBAppLayout succinctDescription](self->_toAppLayout, "succinctDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v4, "appendObject:withName:", v11, CFSTR("toAppLayout"));

  }
  fromEnvironmentMode = self->_fromEnvironmentMode;
  if (fromEnvironmentMode != self->_toEnvironmentMode)
  {
    SBStringForUnlockedEnvironmentMode(fromEnvironmentMode);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v14, CFSTR("fromEnvironmentMode"));

    SBStringForUnlockedEnvironmentMode(self->_toEnvironmentMode);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v15, CFSTR("toEnvironmentMode"));

  }
  fromInterfaceOrientation = self->_fromInterfaceOrientation;
  if (fromInterfaceOrientation != self->_toInterfaceOrientation)
  {
    if (fromInterfaceOrientation == 1)
    {
      v19 = CFSTR("UIInterfaceOrientationPortrait");
    }
    else
    {
      v17 = CFSTR("UIInterfaceOrientationLandscapeLeft");
      if (fromInterfaceOrientation == 2)
        v18 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
      else
        v18 = 0;
      if (fromInterfaceOrientation != 4)
        v17 = v18;
      if (fromInterfaceOrientation == 3)
        v19 = CFSTR("UIInterfaceOrientationLandscapeRight");
      else
        v19 = v17;
    }
    objc_msgSend(v4, "appendString:withName:", v19, CFSTR("fromOrientation"));
    toInterfaceOrientation = self->_toInterfaceOrientation;
    if (toInterfaceOrientation == 1)
    {
      v23 = CFSTR("UIInterfaceOrientationPortrait");
    }
    else
    {
      v21 = CFSTR("UIInterfaceOrientationLandscapeLeft");
      if (toInterfaceOrientation == 2)
        v22 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
      else
        v22 = 0;
      if (toInterfaceOrientation != 4)
        v21 = v22;
      if (toInterfaceOrientation == 3)
        v23 = CFSTR("UIInterfaceOrientationLandscapeRight");
      else
        v23 = v21;
    }
    objc_msgSend(v4, "appendString:withName:", v23, CFSTR("toOrientation"));
  }
  fromWindowPickerRole = self->_fromWindowPickerRole;
  if (fromWindowPickerRole != self->_toWindowPickerRole)
  {
    SBLayoutRoleDescription(fromWindowPickerRole);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v25, CFSTR("fromWindowPickerRole"));

    SBLayoutRoleDescription(self->_toWindowPickerRole);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v26, CFSTR("toWindowPickerRole"));

  }
  v27 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_fromAppLayoutWantsExclusiveForeground, CFSTR("fromAppLayoutWantsExclusiveForeground"), 1);
  v28 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_toAppLayoutWantsExclusiveForeground, CFSTR("toAppLayoutWantsExclusiveForeground"), 1);
  fromFloatingAppLayout = self->_fromFloatingAppLayout;
  if (fromFloatingAppLayout != self->_toFloatingAppLayout)
  {
    -[SBAppLayout succinctDescription](fromFloatingAppLayout, "succinctDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (id)objc_msgSend(v4, "appendObject:withName:", v30, CFSTR("fromFloatingAppLayout"));

    -[SBAppLayout succinctDescription](self->_toFloatingAppLayout, "succinctDescription");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (id)objc_msgSend(v4, "appendObject:withName:", v32, CFSTR("toFloatingAppLayout"));

  }
  fromFloatingConfiguration = self->_fromFloatingConfiguration;
  if (fromFloatingConfiguration != self->_toFloatingConfiguration)
  {
    SBStringForFloatingConfiguration(fromFloatingConfiguration);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v35, CFSTR("fromFloatingConfiguration"));

    SBStringForFloatingConfiguration(self->_toFloatingConfiguration);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v36, CFSTR("toFloatingConfiguration"));

  }
  if (self->_fromFloatingSwitcherVisible != self->_toFloatingSwitcherVisible)
  {
    NSStringFromBOOL();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v37, CFSTR("fromFloatingSwitcherVisible"));

    NSStringFromBOOL();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v38, CFSTR("toFloatingSwitcherVisible"));

  }
  if ((BSEqualStrings() & 1) == 0)
  {
    objc_msgSend(v4, "appendString:withName:", self->_fromAppExposeBundleID, CFSTR("fromAppExposeBundleID"));
    objc_msgSend(v4, "appendString:withName:", self->_toAppExposeBundleID, CFSTR("toAppExposeBundleID"));
  }
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", self->_ambiguouslyLaunchedBundleIDIfAny, CFSTR("ambiguouslyLaunchedBundleIDIfAny"), 1);
  fromPeekConfiguration = self->_fromPeekConfiguration;
  if (fromPeekConfiguration != self->_toPeekConfiguration)
  {
    SBStringForPeekConfiguration(fromPeekConfiguration);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v40, CFSTR("fromPeekConfiguration"));

    SBStringForPeekConfiguration(self->_toPeekConfiguration);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v41, CFSTR("toPeekConfiguration"));

  }
  fromSpaceConfiguration = self->_fromSpaceConfiguration;
  if (fromSpaceConfiguration != self->_toSpaceConfiguration)
  {
    SBStringForSpaceConfiguration(fromSpaceConfiguration);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v43, CFSTR("fromSpaceConfiguration"));

    SBStringForSpaceConfiguration(self->_toSpaceConfiguration);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v44, CFSTR("toSpaceConfiguration"));

  }
  v45 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_bannerUnfurlSourceContext, CFSTR("bannerUnfurlSourceContext"), 1);
  v46 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_prefersCrossfadeTransition, CFSTR("prefersCrossfadeTransition"), 1);
  if (-[NSMutableDictionary count](self->_appLayoutToRemovalContext, "count"))
    objc_msgSend(v4, "appendString:withName:", CFSTR("YES"), CFSTR("isEntityDestructionTransition"));
  v47 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_fromDisplayItemsPendingTermination, CFSTR("pendingTermination"), 1);
  activatingAppLayout = self->_activatingAppLayout;
  if (activatingAppLayout)
  {
    -[SBAppLayout succinctDescription](activatingAppLayout, "succinctDescription");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (id)objc_msgSend(v4, "appendObject:withName:", v49, CFSTR("activating"));

  }
  if ((BSEqualObjects() & 1) == 0)
  {
    v51 = (id)objc_msgSend(v4, "appendObject:withName:", self->_fromDisplayItemLayoutAttributesMap, CFSTR("fromDisplayItemLayoutAttributesMap"));
    v52 = (id)objc_msgSend(v4, "appendObject:withName:", self->_toDisplayItemLayoutAttributesMap, CFSTR("toDisplayItemLayoutAttributesMap"));
  }
  v53 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_moveDisplaysContext, CFSTR("moveDisplaysContext"), 1);
  v54 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_gestureInitiated, CFSTR("isGestureInitiated"), 1);
  v55 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_keyboardShortcutInitiated, CFSTR("isKeyboardShortcutInitiated"), 1);
  v56 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_topAffordanceInitiated, CFSTR("isTopAffordanceInitiated"), 1);
  v57 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_dragAndDropTransition, CFSTR("isDragAndDropTransition"), 1);
  v58 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_breadcrumbTransition, CFSTR("isBreadcrumbTransition"), 1);
  v59 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_morphToPIPTransition, CFSTR("isMorphToPIPTransition"), 1);
  v60 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_morphFromPIPTransition, CFSTR("isMorphFromPIPTransition"), 1);
  SBLayoutRoleDescription(self->_morphingPIPLayoutRole);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v61, CFSTR("morphingPIPLayoutRole"));

  v62 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_zoomFromSystemApertureTransition, CFSTR("isZoomFromSystemApertureTransition"), 1);
  v63 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_continuityTransition, CFSTR("isContinuityTransition"), 1);
  v64 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_bannerUnfurlTransition, CFSTR("isBannerUnfurlTransition"), 1);
  v65 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_iconZoomDisabled, CFSTR("isIconZoomDisabled"), 1);
  v66 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_spotlightTransition, CFSTR("isSpotlightTransition"), 1);
  v67 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_shelfTransition, CFSTR("isShelfTransition"), 1);
  dosidoTransitionDirection = self->_dosidoTransitionDirection;
  if (dosidoTransitionDirection)
    v69 = (id)objc_msgSend(v4, "appendInteger:withName:", dosidoTransitionDirection, CFSTR("dosidoTransitionDirection"));
  v70 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_shelfRequestTransition, CFSTR("isShelfRequestTransition"), 1);
  v71 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_morphFromInAppView, CFSTR("isMorphFromInAppView"), 1);
  v72 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_quickActionTransition, CFSTR("isQuickActionTransition"), 1);
  v73 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_newSceneTransition, CFSTR("isNewSceneTransition"), 1);
  v74 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_moveDisplaysTransition, CFSTR("isMoveDisplaysTransition"), 1);
  v75 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_continuousExposeConfigurationChangeEvent, CFSTR("isContinuousExposeConfigurationChangeEvent"), 1);
  v76 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_iPadOSWindowingModeChangeEvent, CFSTR("iPadOSWindowingModeChangeEvent"), 1);
  v77 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_commandTabTransition, CFSTR("isCommandTabTransition"), 1);
  v78 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_launchingFromDockTransition, CFSTR("isLaunchingFromDockTransition"), 1);
  v79 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_appLaunchDuringWindowDragGestureTransition, CFSTR("isAppLaunchDuringWindowDragGestureTransition"), 1);
  return v4;
}

- (BOOL)isAnySplitViewToOrFromSlideOverEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  char v16;
  void *v18;

  -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent fromFloatingAppLayout](self, "fromFloatingAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent toFloatingAppLayout](self, "toFloatingAppLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemForLayoutRole:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemForLayoutRole:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemForLayoutRole:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemForLayoutRole:", 1);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v8)
    v13 = v11 == 0;
  else
    v13 = 1;
  v15 = 1;
  if (v13 || (v16 = objc_msgSend(v8, "isEqual:", v11), (v16 & 1) == 0 && (objc_msgSend(v18, "isEqual:", v12) & 1) == 0))
  {
    v14 = !v9 || v10 == 0;
    if (v14 || (objc_msgSend(v9, "isEqual:", v10) & 1) == 0 && (objc_msgSend(v7, "isEqual:", v10) & 1) == 0)
      v15 = 0;
  }

  return v15;
}

- (BOOL)isBannerUnfurlTransition
{
  return self->_bannerUnfurlTransition;
}

- (SBAppLayout)fromAppLayout
{
  return self->_fromAppLayout;
}

- (int64_t)fromEnvironmentMode
{
  return self->_fromEnvironmentMode;
}

- (NSSet)fromDisplayItemsPendingTermination
{
  return self->_fromDisplayItemsPendingTermination;
}

- (NSUUID)transitionID
{
  return self->_transitionID;
}

- (NSString)toAppExposeBundleID
{
  return self->_toAppExposeBundleID;
}

- (BOOL)isBreadcrumbTransition
{
  return self->_breadcrumbTransition;
}

- (SBAppLayout)fromFloatingAppLayout
{
  return self->_fromFloatingAppLayout;
}

- (BOOL)isExitingSlideOverPeekToAppEvent
{
  uint64_t v3;
  _BOOL4 v4;
  BOOL result;

  v3 = -[SBTransitionSwitcherModifierEvent toFloatingConfiguration](self, "toFloatingConfiguration");
  v4 = -[SBTransitionSwitcherModifierEvent isExitingSlideOverPeekEvent](self, "isExitingSlideOverPeekEvent");
  result = 0;
  if (v4)
  {
    if (v3)
      return !SBFloatingConfigurationIsStashed(v3);
  }
  return result;
}

- (int64_t)toFloatingConfiguration
{
  return self->_toFloatingConfiguration;
}

- (BOOL)isEnteringAnyPeekEvent
{
  return !SBPeekConfigurationIsValid(-[SBTransitionSwitcherModifierEvent fromPeekConfiguration](self, "fromPeekConfiguration"))
      && SBPeekConfigurationIsValid(-[SBTransitionSwitcherModifierEvent toPeekConfiguration](self, "toPeekConfiguration"));
}

- (BOOL)isExitingSlideOverPeekEvent
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[SBTransitionSwitcherModifierEvent isExitingAnyPeekEvent](self, "isExitingAnyPeekEvent"))
    return 0;
  -[SBTransitionSwitcherModifierEvent fromFloatingAppLayout](self, "fromFloatingAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)isExitingAnyPeekEvent
{
  _BOOL4 IsValid;

  IsValid = SBPeekConfigurationIsValid(-[SBTransitionSwitcherModifierEvent fromPeekConfiguration](self, "fromPeekConfiguration"));
  if (IsValid)
    LOBYTE(IsValid) = !SBPeekConfigurationIsValid(-[SBTransitionSwitcherModifierEvent toPeekConfiguration](self, "toPeekConfiguration"));
  return IsValid;
}

- (int64_t)fromPeekConfiguration
{
  return self->_fromPeekConfiguration;
}

- (int64_t)toPeekConfiguration
{
  return self->_toPeekConfiguration;
}

- (int64_t)toWindowPickerRole
{
  return self->_toWindowPickerRole;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movingDisplayItem, 0);
  objc_storeStrong((id *)&self->_moveDisplaysContext, 0);
  objc_storeStrong((id *)&self->_toDisplayItemLayoutAttributesMap, 0);
  objc_storeStrong((id *)&self->_fromDisplayItemLayoutAttributesMap, 0);
  objc_storeStrong((id *)&self->_activatingAppLayout, 0);
  objc_storeStrong((id *)&self->_fromDisplayItemsPendingTermination, 0);
  objc_storeStrong((id *)&self->_zoomFromHardwareButtonPreludeTokenWrapper, 0);
  objc_storeStrong((id *)&self->_bannerUnfurlSourceContext, 0);
  objc_storeStrong((id *)&self->_ambiguouslyLaunchedBundleIDIfAny, 0);
  objc_storeStrong((id *)&self->_toAppExposeBundleID, 0);
  objc_storeStrong((id *)&self->_fromAppExposeBundleID, 0);
  objc_storeStrong((id *)&self->_toFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_fromFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_transitionID, 0);
  objc_storeStrong((id *)&self->_appLayoutToRemovalContext, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBConsumableTokenWrapper consumeToken](self->_zoomFromHardwareButtonPreludeTokenWrapper, "consumeToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)SBTransitionSwitcherModifierEvent;
  -[SBTransitionSwitcherModifierEvent dealloc](&v4, sel_dealloc);
}

- (NSArray)appLayoutsWithRemovalContexts
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_appLayoutToRemovalContext, "allKeys");
}

- (id)removalContextForAppLayout:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_appLayoutToRemovalContext, "objectForKey:", a3);
}

- (void)setRemovalContext:(id)a3 forAppLayout:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableDictionary *appLayoutToRemovalContext;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = v13;
  v8 = v6;
  appLayoutToRemovalContext = self->_appLayoutToRemovalContext;
  if (v13)
  {
    if (!appLayoutToRemovalContext)
    {
      v10 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
      v11 = self->_appLayoutToRemovalContext;
      self->_appLayoutToRemovalContext = v10;

      v7 = v13;
      appLayoutToRemovalContext = self->_appLayoutToRemovalContext;
    }
    -[NSMutableDictionary setObject:forKey:](appLayoutToRemovalContext, "setObject:forKey:", v7, v8);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](appLayoutToRemovalContext, "removeObjectForKey:", v8);
    if (!-[NSMutableDictionary count](self->_appLayoutToRemovalContext, "count"))
    {
      v12 = self->_appLayoutToRemovalContext;
      self->_appLayoutToRemovalContext = 0;

    }
  }

}

- (SBSwitcherShelf)fromShelf
{
  int64_t v3;
  int64_t v4;
  SBSwitcherShelf *v5;
  int64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = -[SBTransitionSwitcherModifierEvent fromEnvironmentMode](self, "fromEnvironmentMode");
  v4 = -[SBTransitionSwitcherModifierEvent fromWindowPickerRole](self, "fromWindowPickerRole");
  if (v3 != 3)
    goto LABEL_10;
  if (!self->_fromAppExposeBundleID)
  {
    v6 = v4;
    if (v4 == 3)
    {
      -[SBTransitionSwitcherModifierEvent fromFloatingAppLayout](self, "fromFloatingAppLayout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 1;
    }
    else
    {
      if (!v4)
        goto LABEL_10;
      -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = v6;
    }
    objc_msgSend(v7, "itemForLayoutRole:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v5 = -[SBSwitcherShelf initWithBundleIdentifier:layoutRole:displayMode:]([SBSwitcherShelf alloc], "initWithBundleIdentifier:layoutRole:displayMode:", v11, v6, 1);

      return v5;
    }
LABEL_10:
    v5 = 0;
    return v5;
  }
  v5 = -[SBSwitcherShelf initWithBundleIdentifier:layoutRole:displayMode:]([SBSwitcherShelf alloc], "initWithBundleIdentifier:layoutRole:displayMode:", self->_fromAppExposeBundleID, 0, 0);
  return v5;
}

- (SBSwitcherShelf)toShelf
{
  int64_t v3;
  int64_t v4;
  SBSwitcherShelf *v5;
  int64_t v6;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[SBTransitionSwitcherModifierEvent toEnvironmentMode](self, "toEnvironmentMode");
  v4 = -[SBTransitionSwitcherModifierEvent toWindowPickerRole](self, "toWindowPickerRole");
  if (v3 != 3)
  {
LABEL_5:
    v5 = 0;
    return v5;
  }
  if (!self->_toAppExposeBundleID)
  {
    v6 = v4;
    if (v4)
    {
      -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "itemForLayoutRole:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = -[SBSwitcherShelf initWithBundleIdentifier:layoutRole:displayMode:]([SBSwitcherShelf alloc], "initWithBundleIdentifier:layoutRole:displayMode:", v10, v6, 1);
      return v5;
    }
    goto LABEL_5;
  }
  v5 = -[SBSwitcherShelf initWithBundleIdentifier:layoutRole:displayMode:]([SBSwitcherShelf alloc], "initWithBundleIdentifier:layoutRole:displayMode:", self->_toAppExposeBundleID, 0, 0);
  return v5;
}

- (BOOL)isEnteringSplitViewPeekEvent
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[SBTransitionSwitcherModifierEvent isEnteringAnyPeekEvent](self, "isEnteringAnyPeekEvent"))
    return 0;
  -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)isExitingSplitViewPeekEvent
{
  void *v3;
  BOOL v4;

  if (!-[SBTransitionSwitcherModifierEvent isExitingAnyPeekEvent](self, "isExitingAnyPeekEvent"))
    return 0;
  -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isExitingSplitViewPeekToAppEvent
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[SBTransitionSwitcherModifierEvent isExitingSplitViewPeekEvent](self, "isExitingSplitViewPeekEvent"))
    return 0;
  -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)isExitingSplitViewPeekToHomeScreenEvent
{
  void *v3;
  BOOL v4;

  if (!-[SBTransitionSwitcherModifierEvent isExitingSplitViewPeekEvent](self, "isExitingSplitViewPeekEvent"))
    return 0;
  -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (BOOL)isEnteringSlideOverPeekEvent
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  if (!-[SBTransitionSwitcherModifierEvent isEnteringAnyPeekEvent](self, "isEnteringAnyPeekEvent"))
    return 0;
  -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    -[SBTransitionSwitcherModifierEvent toFloatingAppLayout](self, "toFloatingAppLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

- (BOOL)isExitingCenterWindowEvent
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "centerConfiguration"))
  {
    -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "centerConfiguration") == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isExitingCenterWindowToOtherRoleEvent
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0;
  if (-[SBTransitionSwitcherModifierEvent isExitingCenterWindowEvent](self, "isExitingCenterWindowEvent") && v4)
  {
    -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "containsItem:", v4) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      -[SBTransitionSwitcherModifierEvent toFloatingAppLayout](self, "toFloatingAppLayout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "containsItem:", v4);

    }
  }

  return v5;
}

- (BOOL)isCenterWindowRemovalEvent
{
  void *v4;
  void *v5;
  char v6;

  if (!-[SBTransitionSwitcherModifierEvent isExitingCenterWindowEvent](self, "isExitingCenterWindowEvent")
    || -[SBTransitionSwitcherModifierEvent isExitingCenterWindowToOtherRoleEvent](self, "isExitingCenterWindowToOtherRoleEvent"))
  {
    return 0;
  }
  -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasSameItemsInLayoutRoles:asAppLayout:", 6, v5);

  return v6;
}

- (BOOL)isCenterWindowToFullScreenEvent
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[SBTransitionSwitcherModifierEvent fromFloatingAppLayout](self, "fromFloatingAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent toFloatingAppLayout](self, "toFloatingAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBTransitionSwitcherModifierEvent isExitingCenterWindowToOtherRoleEvent](self, "isExitingCenterWindowToOtherRoleEvent"))
  {
    -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "configuration") == 1)
    {
      if (v3 == v4)
        v6 = 1;
      else
        v6 = objc_msgSend(v3, "isEqual:", v4);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isCenterWindowToSlideOverEvent
{
  void *v3;
  int v4;
  void *v5;

  -[SBTransitionSwitcherModifierEvent toFloatingAppLayout](self, "toFloatingAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = 0;
  if (-[SBTransitionSwitcherModifierEvent isExitingCenterWindowToOtherRoleEvent](self, "isExitingCenterWindowToOtherRoleEvent")&& v3)
  {
    -[SBTransitionSwitcherModifierEvent fromFloatingAppLayout](self, "fromFloatingAppLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqual:", v5) ^ 1;

  }
  return v4;
}

- (BOOL)isCenterWindowToNewSplitViewEvent
{
  void *v3;
  void *v4;
  char v5;

  if (!-[SBTransitionSwitcherModifierEvent isExitingCenterWindowToOtherRoleEvent](self, "isExitingCenterWindowToOtherRoleEvent"))return 0;
  -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "configuration") == 1)
  {
    -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSplitConfiguration");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isCenterWindowToExistingSplitViewEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  if (-[SBTransitionSwitcherModifierEvent isExitingCenterWindowToOtherRoleEvent](self, "isExitingCenterWindowToOtherRoleEvent"))
  {
    -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isSplitConfiguration"))
    {
      -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isSplitConfiguration"))
      {
        -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v5, "isEqual:", v6) ^ 1;

      }
      else
      {
        LOBYTE(v7) = 0;
      }

    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)_isEnteringPageCenterWindowEvent
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "centerConfiguration");

  -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "centerConfiguration");

  if (v4)
    v7 = 1;
  else
    v7 = (unint64_t)(v6 - 1) >= 2;
  return !v7;
}

- (BOOL)isPresentingPageCenterWindowEvent
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[SBTransitionSwitcherModifierEvent _isEnteringPageCenterWindowEvent](self, "_isEnteringPageCenterWindowEvent");
  if (v3)
  {
    -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "hasSameItemsInLayoutRoles:asAppLayout:", 6, v5);

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)isReplaceCenterWindowWithNewCenterWindowEvent
{
  void *v3;
  void *v4;
  char v5;

  -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "centerConfiguration") == 1
    && objc_msgSend(v4, "centerConfiguration") == 1
    && (objc_msgSend(v3, "hasSameItemsInLayoutRoles:asAppLayout:", 16, v4) & 1) == 0)
  {
    v5 = objc_msgSend(v3, "hasSameItemsInLayoutRoles:asAppLayout:", 6, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isSplitViewToCenterWindowEvent
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v10;

  -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemForLayoutRole:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBTransitionSwitcherModifierEvent _isEnteringPageCenterWindowEvent](self, "_isEnteringPageCenterWindowEvent")
    && (v6 = SBMainDisplayLayoutStateSpaceConfigurationFromAppLayoutConfiguration(objc_msgSend(v3, "configuration")),
        SBSpaceConfigurationIsSplitView(v6))
    && objc_msgSend(v4, "configuration") == 1)
  {
    objc_msgSend(v3, "itemForLayoutRole:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", v5) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v3, "itemForLayoutRole:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "isEqual:", v5);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isSlideOverToCenterWindowEvent
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "centerConfiguration"))
  {
    -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "hasSameItemsInLayoutRoles:asAppLayout:", 16, v5) & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "itemForLayoutRole:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBTransitionSwitcherModifierEvent fromFloatingAppLayout](self, "fromFloatingAppLayout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "itemForLayoutRole:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "isEqual:", v10);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isFullScreenToCenterWindowEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  void *v9;

  -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemForLayoutRole:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (-[SBTransitionSwitcherModifierEvent _isEnteringPageCenterWindowEvent](self, "_isEnteringPageCenterWindowEvent"))
  {
    if (v4)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (!v8)
    {
      if (objc_msgSend(v4, "isEqual:", v6))
      {
        -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v9, "configuration") == 1;

      }
      else
      {
        v7 = 0;
      }
    }
  }

  return v7;
}

- (BOOL)isSwappingFullScreenAppSidesEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  BOOL v12;
  char v13;

  -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemForLayoutRole:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemForLayoutRole:", 2);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v5)
    v10 = v6 == 0;
  else
    v10 = 1;
  v12 = v10 || v7 == 0 || v8 == 0;
  if (v12 || !objc_msgSend(v5, "isEqual:", v8))
    v13 = 0;
  else
    v13 = objc_msgSend(v6, "isEqual:", v7);

  return v13;
}

- (BOOL)isCenterWindowZoomingUpFromShelfEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  if (!-[SBTransitionSwitcherModifierEvent isShelfTransition](self, "isShelfTransition"))
    return 0;
  -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasSameItemsInLayoutRoles:asAppLayout:", 16, v6) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "hasSameItemsInLayoutRoles:asAppLayout:", 6, v9);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isAnyPulseEvent
{
  return -[SBTransitionSwitcherModifierEvent isMainPulseEvent](self, "isMainPulseEvent")
      || -[SBTransitionSwitcherModifierEvent isFloatingPulseEvent](self, "isFloatingPulseEvent");
}

- (BOOL)isMainPulseEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  char v9;

  -[SBTransitionSwitcherModifierEvent activatingAppLayout](self, "activatingAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((BSEqualObjects() & 1) == 0)
    {

      v9 = 0;
      goto LABEL_7;
    }
    -[SBTransitionSwitcherModifierEvent fromAppExposeBundleID](self, "fromAppExposeBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransitionSwitcherModifierEvent toAppExposeBundleID](self, "toAppExposeBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = BSEqualObjects();

    if (v8)
    {
      -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v4, "isOrContainsAppLayout:", v3);
LABEL_7:

      goto LABEL_8;
    }
  }
  v9 = 0;
LABEL_8:

  return v9;
}

- (BOOL)isFloatingPulseEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  char v9;

  -[SBTransitionSwitcherModifierEvent activatingAppLayout](self, "activatingAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBTransitionSwitcherModifierEvent fromFloatingAppLayout](self, "fromFloatingAppLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransitionSwitcherModifierEvent toFloatingAppLayout](self, "toFloatingAppLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((BSEqualObjects() & 1) == 0)
    {

      v9 = 0;
      goto LABEL_7;
    }
    -[SBTransitionSwitcherModifierEvent fromAppExposeBundleID](self, "fromAppExposeBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransitionSwitcherModifierEvent toAppExposeBundleID](self, "toAppExposeBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = BSEqualObjects();

    if (v8)
    {
      -[SBTransitionSwitcherModifierEvent toFloatingAppLayout](self, "toFloatingAppLayout");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v4, "isOrContainsAppLayout:", v3);
LABEL_7:

      goto LABEL_8;
    }
  }
  v9 = 0;
LABEL_8:

  return v9;
}

- (BOOL)isFullScreenToSplitViewEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;

  -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "configuration") == 1 && objc_msgSend(v4, "configuration") >= 2)
  {
    objc_msgSend(v3, "itemForLayoutRole:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemForLayoutRole:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      objc_msgSend(v3, "itemForLayoutRole:", 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = 0;
      }
      else
      {
        objc_msgSend(v4, "itemForLayoutRole:", 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v9 != 0;

      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isSplitViewCrossfadeEvent
{
  void *v3;
  void *v4;
  int64_t v5;
  _BOOL4 v6;
  _BOOL4 v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  BOOL v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
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
  int64_t v33;
  int64_t v34;
  int64_t v35;

  v35 = -[SBTransitionSwitcherModifierEvent fromInterfaceOrientation](self, "fromInterfaceOrientation");
  v34 = -[SBTransitionSwitcherModifierEvent toInterfaceOrientation](self, "toInterfaceOrientation");
  -[SBTransitionSwitcherModifierEvent fromFloatingAppLayout](self, "fromFloatingAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent toFloatingAppLayout](self, "toFloatingAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = -[SBTransitionSwitcherModifierEvent fromFloatingConfiguration](self, "fromFloatingConfiguration");
  v5 = -[SBTransitionSwitcherModifierEvent toFloatingConfiguration](self, "toFloatingConfiguration");
  v6 = -[SBTransitionSwitcherModifierEvent fromFloatingSwitcherVisible](self, "fromFloatingSwitcherVisible");
  v7 = -[SBTransitionSwitcherModifierEvent toFloatingSwitcherVisible](self, "toFloatingSwitcherVisible");
  v8 = -[SBTransitionSwitcherModifierEvent fromEnvironmentMode](self, "fromEnvironmentMode");
  v9 = -[SBTransitionSwitcherModifierEvent toEnvironmentMode](self, "toEnvironmentMode");
  v10 = -[SBTransitionSwitcherModifierEvent fromPeekConfiguration](self, "fromPeekConfiguration");
  v11 = -[SBTransitionSwitcherModifierEvent toPeekConfiguration](self, "toPeekConfiguration");
  v12 = -[SBTransitionSwitcherModifierEvent isGestureInitiated](self, "isGestureInitiated");
  v13 = 0;
  if (!v12 && v35 == v34 && v3 == v4 && v33 == v5 && ((v6 ^ v7) & 1) == 0 && v8 == v9 && v10 == v11)
  {
    -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    LOBYTE(v17) = 0;
    if (v14 && v15)
    {
      objc_msgSend(v14, "itemForLayoutRole:", 2);
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18
        && (v19 = (void *)v18,
            objc_msgSend(v16, "itemForLayoutRole:", 2),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v20,
            v19,
            v20))
      {
        v21 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v14, "itemForLayoutRole:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "itemForLayoutRole:", 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setWithObjects:", v22, v23, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v16, "itemForLayoutRole:", 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "itemForLayoutRole:", 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setWithObjects:", v26, v27, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v14, "allItems");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setWithArray:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "containsAnyItemFromSet:", v31))
          v17 = objc_msgSend(v24, "isEqual:", v28) ^ 1;
        else
          LOBYTE(v17) = 0;

      }
      else
      {
        LOBYTE(v17) = 0;
      }
    }

    return v17;
  }
  return v13;
}

- (BOOL)isPrimaryToSlideOverEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  BOOL v10;

  -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent toFloatingAppLayout](self, "toFloatingAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemForLayoutRole:", 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  v10 = !v9 && (objc_msgSend(v5, "isEqual:", v7) & 1) != 0;

  return v10;
}

- (BOOL)isSideToSlideOverEvent
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  BOOL v9;

  -[SBTransitionSwitcherModifierEvent fromAppLayout](self, "fromAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent toFloatingAppLayout](self, "toFloatingAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemForLayoutRole:", 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  v9 = !v8 && (objc_msgSend(v5, "isEqual:", v6) & 1) != 0;

  return v9;
}

- (BOOL)isSlideOverToPrimaryEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  BOOL v10;

  -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent fromFloatingAppLayout](self, "fromFloatingAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemForLayoutRole:", 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  v10 = !v9 && (objc_msgSend(v5, "isEqual:", v7) & 1) != 0;

  return v10;
}

- (BOOL)isSlideOverToSideEvent
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  BOOL v9;

  -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent fromFloatingAppLayout](self, "fromFloatingAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemForLayoutRole:", 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  v9 = !v8 && (objc_msgSend(v5, "isEqual:", v6) & 1) != 0;

  return v9;
}

- (BOOL)isSlideOverToFullScreenEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  BOOL v10;

  -[SBTransitionSwitcherModifierEvent toAppLayout](self, "toAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent fromFloatingAppLayout](self, "fromFloatingAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemForLayoutRole:", 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = 1;
  else
    v9 = v7 == 0;
  v10 = !v9 && (objc_msgSend(v5, "isEqual:", v7) & 1) != 0;

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)SBTransitionSwitcherModifierEvent;
  v4 = -[SBChainableModifierEvent copyWithZone:](&v34, sel_copyWithZone_, a3);
  v5 = -[NSUUID copy](self->_transitionID, "copy");
  v6 = (void *)*((_QWORD *)v4 + 8);
  *((_QWORD *)v4 + 8) = v5;

  *((_QWORD *)v4 + 9) = self->_phase;
  *((_BYTE *)v4 + 32) = self->_animated;
  v7 = -[SBAppLayout copy](self->_fromAppLayout, "copy");
  v8 = (void *)*((_QWORD *)v4 + 10);
  *((_QWORD *)v4 + 10) = v7;

  *((_QWORD *)v4 + 11) = self->_fromEnvironmentMode;
  v9 = -[SBAppLayout copy](self->_toAppLayout, "copy");
  v10 = (void *)*((_QWORD *)v4 + 12);
  *((_QWORD *)v4 + 12) = v9;

  *((_QWORD *)v4 + 13) = self->_toEnvironmentMode;
  *((_QWORD *)v4 + 14) = self->_fromInterfaceOrientation;
  *((_QWORD *)v4 + 15) = self->_toInterfaceOrientation;
  *((_QWORD *)v4 + 16) = self->_fromWindowPickerRole;
  *((_QWORD *)v4 + 17) = self->_toWindowPickerRole;
  *((_BYTE *)v4 + 33) = self->_fromAppLayoutWantsExclusiveForeground;
  *((_BYTE *)v4 + 34) = self->_toAppLayoutWantsExclusiveForeground;
  v11 = -[SBAppLayout copy](self->_fromFloatingAppLayout, "copy");
  v12 = (void *)*((_QWORD *)v4 + 18);
  *((_QWORD *)v4 + 18) = v11;

  *((_QWORD *)v4 + 19) = self->_fromFloatingConfiguration;
  *((_BYTE *)v4 + 35) = self->_fromFloatingSwitcherVisible;
  v13 = -[SBAppLayout copy](self->_toFloatingAppLayout, "copy");
  v14 = (void *)*((_QWORD *)v4 + 20);
  *((_QWORD *)v4 + 20) = v13;

  *((_QWORD *)v4 + 21) = self->_toFloatingConfiguration;
  *((_BYTE *)v4 + 36) = self->_toFloatingSwitcherVisible;
  v15 = -[NSString copy](self->_fromAppExposeBundleID, "copy");
  v16 = (void *)*((_QWORD *)v4 + 22);
  *((_QWORD *)v4 + 22) = v15;

  v17 = -[NSString copy](self->_toAppExposeBundleID, "copy");
  v18 = (void *)*((_QWORD *)v4 + 23);
  *((_QWORD *)v4 + 23) = v17;

  v19 = -[NSString copy](self->_ambiguouslyLaunchedBundleIDIfAny, "copy");
  v20 = (void *)*((_QWORD *)v4 + 24);
  *((_QWORD *)v4 + 24) = v19;

  *((_QWORD *)v4 + 25) = self->_fromPeekConfiguration;
  *((_QWORD *)v4 + 26) = self->_toPeekConfiguration;
  *((_QWORD *)v4 + 27) = self->_fromSpaceConfiguration;
  *((_QWORD *)v4 + 28) = self->_toSpaceConfiguration;
  v21 = -[SBBannerUnfurlSourceContext copy](self->_bannerUnfurlSourceContext, "copy");
  v22 = (void *)*((_QWORD *)v4 + 29);
  *((_QWORD *)v4 + 29) = v21;

  *((_BYTE *)v4 + 37) = self->_prefersCrossfadeTransition;
  v23 = -[NSMutableDictionary mutableCopy](self->_appLayoutToRemovalContext, "mutableCopy");
  v24 = (void *)*((_QWORD *)v4 + 3);
  *((_QWORD *)v4 + 3) = v23;

  v25 = -[NSSet copy](self->_fromDisplayItemsPendingTermination, "copy");
  v26 = (void *)*((_QWORD *)v4 + 31);
  *((_QWORD *)v4 + 31) = v25;

  v27 = -[SBAppLayout copy](self->_activatingAppLayout, "copy");
  v28 = (void *)*((_QWORD *)v4 + 32);
  *((_QWORD *)v4 + 32) = v27;

  v29 = -[NSDictionary copy](self->_fromDisplayItemLayoutAttributesMap, "copy");
  v30 = (void *)*((_QWORD *)v4 + 33);
  *((_QWORD *)v4 + 33) = v29;

  v31 = -[NSDictionary copy](self->_toDisplayItemLayoutAttributesMap, "copy");
  v32 = (void *)*((_QWORD *)v4 + 34);
  *((_QWORD *)v4 + 34) = v31;

  objc_storeStrong((id *)v4 + 35, self->_moveDisplaysContext);
  *((_BYTE *)v4 + 39) = self->_gestureInitiated;
  *((_BYTE *)v4 + 40) = self->_keyboardShortcutInitiated;
  *((_BYTE *)v4 + 41) = self->_topAffordanceInitiated;
  *((_BYTE *)v4 + 42) = self->_dragAndDropTransition;
  *((_BYTE *)v4 + 43) = self->_breadcrumbTransition;
  *((_BYTE *)v4 + 44) = self->_morphToPIPTransition;
  *((_BYTE *)v4 + 45) = self->_morphFromPIPTransition;
  *((_QWORD *)v4 + 37) = self->_morphingPIPLayoutRole;
  *((_BYTE *)v4 + 46) = self->_zoomFromSystemApertureTransition;
  *((_BYTE *)v4 + 47) = self->_continuityTransition;
  *((_BYTE *)v4 + 48) = self->_bannerUnfurlTransition;
  *((_BYTE *)v4 + 49) = self->_iconZoomDisabled;
  *((_BYTE *)v4 + 50) = self->_spotlightTransition;
  *((_BYTE *)v4 + 51) = self->_shelfTransition;
  *((_QWORD *)v4 + 38) = self->_dosidoTransitionDirection;
  *((_BYTE *)v4 + 52) = self->_shelfRequestTransition;
  *((_BYTE *)v4 + 53) = self->_morphFromInAppView;
  *((_BYTE *)v4 + 54) = self->_quickActionTransition;
  *((_BYTE *)v4 + 55) = self->_newSceneTransition;
  *((_BYTE *)v4 + 56) = self->_moveDisplaysTransition;
  *((_BYTE *)v4 + 57) = self->_continuousExposeConfigurationChangeEvent;
  *((_BYTE *)v4 + 58) = self->_iPadOSWindowingModeChangeEvent;
  *((_BYTE *)v4 + 59) = self->_commandTabTransition;
  *((_BYTE *)v4 + 60) = self->_launchingFromDockTransition;
  *((_BYTE *)v4 + 61) = self->_appLaunchDuringWindowDragGestureTransition;
  return v4;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (int64_t)fromInterfaceOrientation
{
  return self->_fromInterfaceOrientation;
}

- (int64_t)toInterfaceOrientation
{
  return self->_toInterfaceOrientation;
}

- (int64_t)fromWindowPickerRole
{
  return self->_fromWindowPickerRole;
}

- (BOOL)fromAppLayoutWantsExclusiveForeground
{
  return self->_fromAppLayoutWantsExclusiveForeground;
}

- (BOOL)toAppLayoutWantsExclusiveForeground
{
  return self->_toAppLayoutWantsExclusiveForeground;
}

- (int64_t)fromFloatingConfiguration
{
  return self->_fromFloatingConfiguration;
}

- (BOOL)fromFloatingSwitcherVisible
{
  return self->_fromFloatingSwitcherVisible;
}

- (NSString)fromAppExposeBundleID
{
  return self->_fromAppExposeBundleID;
}

- (NSString)ambiguouslyLaunchedBundleIDIfAny
{
  return self->_ambiguouslyLaunchedBundleIDIfAny;
}

- (void)setAmbiguouslyLaunchedBundleIDIfAny:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (int64_t)fromSpaceConfiguration
{
  return self->_fromSpaceConfiguration;
}

- (int64_t)toSpaceConfiguration
{
  return self->_toSpaceConfiguration;
}

- (SBBannerUnfurlSourceContext)bannerUnfurlSourceContext
{
  return self->_bannerUnfurlSourceContext;
}

- (SBConsumableTokenWrapper)zoomFromHardwareButtonPreludeTokenWrapper
{
  return self->_zoomFromHardwareButtonPreludeTokenWrapper;
}

- (void)setZoomFromHardwareButtonPreludeTokenWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_zoomFromHardwareButtonPreludeTokenWrapper, a3);
}

- (SBAppLayout)activatingAppLayout
{
  return self->_activatingAppLayout;
}

- (NSDictionary)fromDisplayItemLayoutAttributesMap
{
  return self->_fromDisplayItemLayoutAttributesMap;
}

- (void)setFromDisplayItemLayoutAttributesMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSDictionary)toDisplayItemLayoutAttributesMap
{
  return self->_toDisplayItemLayoutAttributesMap;
}

- (void)setToDisplayItemLayoutAttributesMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (SBTransitionSwitcherModifierMoveDisplaysContext)moveDisplaysContext
{
  return self->_moveDisplaysContext;
}

- (void)setMoveDisplaysContext:(id)a3
{
  objc_storeStrong((id *)&self->_moveDisplaysContext, a3);
}

- (SBDisplayItem)movingDisplayItem
{
  return self->_movingDisplayItem;
}

- (void)setMovingDisplayItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (CGSize)fromSizeOfMovingDisplayItem
{
  double width;
  double height;
  CGSize result;

  width = self->_fromSizeOfMovingDisplayItem.width;
  height = self->_fromSizeOfMovingDisplayItem.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setFromSizeOfMovingDisplayItem:(CGSize)a3
{
  self->_fromSizeOfMovingDisplayItem = a3;
}

- (CGPoint)fromCenterOfMovingDisplayItem
{
  double x;
  double y;
  CGPoint result;

  x = self->_fromCenterOfMovingDisplayItem.x;
  y = self->_fromCenterOfMovingDisplayItem.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFromCenterOfMovingDisplayItem:(CGPoint)a3
{
  self->_fromCenterOfMovingDisplayItem = a3;
}

- (CGSize)toSizeOfMovingDisplayItem
{
  double width;
  double height;
  CGSize result;

  width = self->_toSizeOfMovingDisplayItem.width;
  height = self->_toSizeOfMovingDisplayItem.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setToSizeOfMovingDisplayItem:(CGSize)a3
{
  self->_toSizeOfMovingDisplayItem = a3;
}

- (CGPoint)toCenterOfMovingDisplayItem
{
  double x;
  double y;
  CGPoint result;

  x = self->_toCenterOfMovingDisplayItem.x;
  y = self->_toCenterOfMovingDisplayItem.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setToCenterOfMovingDisplayItem:(CGPoint)a3
{
  self->_toCenterOfMovingDisplayItem = a3;
}

- (BOOL)isGestureInitiated
{
  return self->_gestureInitiated;
}

- (BOOL)isKeyboardShortcutInitiated
{
  return self->_keyboardShortcutInitiated;
}

- (BOOL)isTopAffordanceInitiated
{
  return self->_topAffordanceInitiated;
}

- (BOOL)isMorphToPIPTransition
{
  return self->_morphToPIPTransition;
}

- (void)setMorphFromPIPTransition:(BOOL)a3
{
  self->_morphFromPIPTransition = a3;
}

- (int64_t)morphingPIPLayoutRole
{
  return self->_morphingPIPLayoutRole;
}

- (BOOL)isContinuityTransition
{
  return self->_continuityTransition;
}

- (BOOL)isShelfTransition
{
  return self->_shelfTransition;
}

- (int64_t)dosidoTransitionDirection
{
  return self->_dosidoTransitionDirection;
}

- (void)setDosidoTransitionDirection:(int64_t)a3
{
  self->_dosidoTransitionDirection = a3;
}

- (BOOL)isShelfRequestTransition
{
  return self->_shelfRequestTransition;
}

- (BOOL)isMorphFromInAppView
{
  return self->_morphFromInAppView;
}

- (BOOL)isQuickActionTransition
{
  return self->_quickActionTransition;
}

- (BOOL)isNewSceneTransition
{
  return self->_newSceneTransition;
}

- (BOOL)isContinuousExposeConfigurationChangeEvent
{
  return self->_continuousExposeConfigurationChangeEvent;
}

- (BOOL)isiPadOSWindowingModeChangeEvent
{
  return self->_iPadOSWindowingModeChangeEvent;
}

- (BOOL)isCommandTabTransition
{
  return self->_commandTabTransition;
}

- (BOOL)isLaunchingFromDockTransition
{
  return self->_launchingFromDockTransition;
}

- (BOOL)isAppLaunchDuringWindowDragGestureTransition
{
  return self->_appLaunchDuringWindowDragGestureTransition;
}

- (id)debugPredicateSummary
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  int v18;
  const __CFString *v19;
  void *v20;
  void *v21;
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
  id obj;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[53];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v68 = (void *)objc_opt_new();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  NSStringFromSelector(sel_isAnyPulseEvent);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v49;
  NSStringFromSelector(sel_isMainPulseEvent);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v47;
  NSStringFromSelector(sel_isFloatingPulseEvent);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v73[2] = v46;
  NSStringFromSelector(sel_isFullScreenToSplitViewEvent);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v73[3] = v65;
  NSStringFromSelector(sel_isSplitViewCrossfadeEvent);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v73[4] = v64;
  NSStringFromSelector(sel_isAnySplitViewToOrFromSlideOverEvent);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v73[5] = v63;
  NSStringFromSelector(sel_isPrimaryToSlideOverEvent);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v73[6] = v62;
  NSStringFromSelector(sel_isSideToSlideOverEvent);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v73[7] = v61;
  NSStringFromSelector(sel_isSlideOverToPrimaryEvent);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v73[8] = v60;
  NSStringFromSelector(sel_isSlideOverToSideEvent);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v73[9] = v59;
  NSStringFromSelector(sel_isSlideOverToFullScreenEvent);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v73[10] = v58;
  NSStringFromSelector(sel_isEnteringAnyPeekEvent);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v73[11] = v57;
  NSStringFromSelector(sel_isExitingAnyPeekEvent);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v73[12] = v56;
  NSStringFromSelector(sel_isEnteringSplitViewPeekEvent);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v73[13] = v55;
  NSStringFromSelector(sel_isExitingSplitViewPeekEvent);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v73[14] = v54;
  NSStringFromSelector(sel_isExitingSplitViewPeekToAppEvent);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v73[15] = v53;
  NSStringFromSelector(sel_isExitingSplitViewPeekToHomeScreenEvent);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v73[16] = v52;
  NSStringFromSelector(sel_isEnteringSlideOverPeekEvent);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v73[17] = v51;
  NSStringFromSelector(sel_isExitingSlideOverPeekEvent);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v73[18] = v50;
  NSStringFromSelector(sel_isExitingSlideOverPeekToAppEvent);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v73[19] = v48;
  NSStringFromSelector(sel_isExitingSlideOverPeekToHomeScreenEvent);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v73[20] = v45;
  NSStringFromSelector(sel_isExitingCenterWindowEvent);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v73[21] = v44;
  NSStringFromSelector(sel_isCenterWindowRemovalEvent);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v73[22] = v43;
  NSStringFromSelector(sel_isCenterWindowToFullScreenEvent);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v73[23] = v42;
  NSStringFromSelector(sel_isCenterWindowToSlideOverEvent);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v73[24] = v41;
  NSStringFromSelector(sel_isCenterWindowToNewSplitViewEvent);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v73[25] = v40;
  NSStringFromSelector(sel_isCenterWindowToExistingSplitViewEvent);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v73[26] = v39;
  NSStringFromSelector(sel_isReplaceCenterWindowWithNewCenterWindowEvent);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v73[27] = v38;
  NSStringFromSelector(sel_isPresentingPageCenterWindowEvent);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v73[28] = v37;
  NSStringFromSelector(sel_isSplitViewToCenterWindowEvent);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v73[29] = v36;
  NSStringFromSelector(sel_isSlideOverToCenterWindowEvent);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v73[30] = v35;
  NSStringFromSelector(sel_isFullScreenToCenterWindowEvent);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v73[31] = v34;
  NSStringFromSelector(sel_isSwappingFullScreenAppSidesEvent);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v73[32] = v33;
  NSStringFromSelector(sel_isCenterWindowZoomingUpFromShelfEvent);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v73[33] = v32;
  NSStringFromSelector(sel_isGestureInitiated);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v73[34] = v31;
  NSStringFromSelector(sel_isDragAndDropTransition);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v73[35] = v30;
  NSStringFromSelector(sel_isBreadcrumbTransition);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v73[36] = v29;
  NSStringFromSelector(sel_isMorphToPIPTransition);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v73[37] = v28;
  NSStringFromSelector(sel_isMorphFromPIPTransition);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v73[38] = v27;
  NSStringFromSelector(sel_isContinuityTransition);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v73[39] = v26;
  NSStringFromSelector(sel_isBannerUnfurlTransition);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v73[40] = v25;
  NSStringFromSelector(sel_isIconZoomDisabled);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v73[41] = v24;
  NSStringFromSelector(sel_isSpotlightTransition);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v73[42] = v23;
  NSStringFromSelector(sel_isShelfTransition);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v73[43] = v2;
  NSStringFromSelector(sel_isShelfRequestTransition);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v73[44] = v3;
  NSStringFromSelector(sel_isMorphFromInAppView);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v73[45] = v4;
  NSStringFromSelector(sel_isQuickActionTransition);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v73[46] = v5;
  NSStringFromSelector(sel_isNewSceneTransition);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v73[47] = v6;
  NSStringFromSelector(sel_isMoveDisplaysTransition);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v73[48] = v7;
  NSStringFromSelector(sel_isContinuousExposeConfigurationChangeEvent);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v73[49] = v8;
  NSStringFromSelector(sel_isiPadOSWindowingModeChangeEvent);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v73[50] = v9;
  NSStringFromSelector(sel_isCommandTabTransition);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v73[51] = v10;
  NSStringFromSelector(sel_isLaunchingFromDockTransition);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v73[52] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 53);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v70 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
        -[SBTransitionSwitcherModifierEvent valueForKeyPath:](self, "valueForKeyPath:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "BOOLValue");

        if (v18)
          v19 = CFSTR("YES");
        else
          v19 = CFSTR("NO");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), v16, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "addObject:", v20);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    }
    while (v13);
  }

  objc_msgSend(v68, "componentsJoinedByString:", CFSTR("\n"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

@end
