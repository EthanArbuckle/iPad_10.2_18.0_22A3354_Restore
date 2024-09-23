@implementation SBContinuousExposeRootSwitcherModifier

- (id)floorModifierForTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  SBFullScreenContinuousExposeSwitcherModifier *v13;
  void *v14;
  void *v15;
  SBHomeScreenContinuousExposeSwitcherModifier *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  SBAppExposeContinuousExposeSwitcherModifier *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  SBFullScreenContinuousExposeSwitcherModifier *v29;

  v4 = a3;
  if (v4)
  {
    -[SBFluidSwitcherRootSwitcherModifier floorModifier](self, "floorModifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "toEnvironmentMode");
    objc_msgSend(v4, "toAppLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toAppExposeBundleID");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    switch(v6)
    {
      case 1:
        if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          v16 = v5;
        else
          v16 = objc_alloc_init(SBHomeScreenContinuousExposeSwitcherModifier);
        break;
      case 2:
        objc_msgSend(v4, "toAppExposeBundleID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          if (!v5)
            goto LABEL_37;
          v18 = objc_opt_class();
          v19 = v5;
          if (v18)
            v20 = (objc_opt_isKindOfClass() & 1) != 0 ? v19 : 0;
          else
            v20 = 0;
          v25 = v20;

          objc_msgSend(v25, "bundleIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v25) = objc_msgSend(v26, "isEqualToString:", v17);
          if ((_DWORD)v25)
            v24 = (SBAppExposeContinuousExposeSwitcherModifier *)v19;
          else
LABEL_37:
            v24 = -[SBAppExposeContinuousExposeSwitcherModifier initWithBundleIdentifier:]([SBAppExposeContinuousExposeSwitcherModifier alloc], "initWithBundleIdentifier:", v17);
        }
        else
        {
          -[SBFluidSwitcherRootSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
          v24 = (SBAppExposeContinuousExposeSwitcherModifier *)objc_claimAutoreleasedReturnValue();
        }
        v13 = (SBFullScreenContinuousExposeSwitcherModifier *)v24;

        goto LABEL_47;
      case 3:
        if (!v8 && v5)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = v5;
            objc_msgSend(v10, "fullScreenAppLayout");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "isEqual:", v7);

            if (v12)
              v13 = (SBFullScreenContinuousExposeSwitcherModifier *)v10;
            else
              v13 = 0;
            objc_msgSend(v10, "setContinuousExposeConfigurationChangeTransition:", objc_msgSend(v4, "isContinuousExposeConfigurationChangeEvent"));
            objc_msgSend(v10, "highlightedByTouchAppLayouts");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "highlightedByHoverAppLayouts");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v13)
              goto LABEL_29;
LABEL_48:

            goto LABEL_49;
          }
LABEL_28:
          v14 = 0;
          v15 = 0;
LABEL_29:
          v13 = -[SBFullScreenContinuousExposeSwitcherModifier initWithFullScreenAppLayout:]([SBFullScreenContinuousExposeSwitcherModifier alloc], "initWithFullScreenAppLayout:", v7);
          -[SBFullScreenContinuousExposeSwitcherModifier setContinuousExposeConfigurationChangeTransition:](v13, "setContinuousExposeConfigurationChangeTransition:", objc_msgSend(v4, "isContinuousExposeConfigurationChangeEvent"));
          if (v15)
            -[SBFullScreenContinuousExposeSwitcherModifier setHighlightedByTouchAppLayouts:](v13, "setHighlightedByTouchAppLayouts:", v15);
          if (v14)
            -[SBFullScreenContinuousExposeSwitcherModifier setHighlightedByHoverAppLayouts:](v13, "setHighlightedByHoverAppLayouts:", v14);
          goto LABEL_48;
        }
        if (!v8)
          goto LABEL_28;
        if (!v5)
          goto LABEL_45;
        v21 = objc_opt_class();
        v22 = v5;
        if (v21)
          v23 = (objc_opt_isKindOfClass() & 1) != 0 ? v22 : 0;
        else
          v23 = 0;
        v27 = v23;

        objc_msgSend(v27, "appExposeBundleIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v27) = objc_msgSend(v28, "isEqualToString:", v9);
        if ((_DWORD)v27)
          v16 = (SBHomeScreenContinuousExposeSwitcherModifier *)v22;
        else
LABEL_45:
          v16 = -[SBInlineAppExposeContinuousExposeSwitcherModifier initWithActiveAppLayout:appExposeBundleIdentifier:]([SBInlineAppExposeContinuousExposeSwitcherModifier alloc], "initWithActiveAppLayout:appExposeBundleIdentifier:", v7, v9);
        break;
      default:
        v14 = 0;
        v15 = 0;
        v13 = 0;
        goto LABEL_48;
    }
    v13 = (SBFullScreenContinuousExposeSwitcherModifier *)v16;
LABEL_47:
    v14 = 0;
    v15 = 0;
    goto LABEL_48;
  }
  v13 = objc_alloc_init(SBHomeScreenContinuousExposeSwitcherModifier);
  v14 = 0;
  v15 = 0;
LABEL_49:
  v29 = v13;

  return v29;
}

- (id)floorModifierForGestureEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  SBFullScreenContinuousExposeSwitcherModifier *v10;
  void *v11;
  id v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isWindowDragGestureEvent"))
    goto LABEL_13;
  v5 = objc_msgSend(v4, "phase");
  -[SBFluidSwitcherRootSwitcherModifier floorModifier](self, "floorModifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedAppLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBContinuousExposeRootSwitcherModifier proposedAppLayoutForWindowDrag](self, "proposedAppLayoutForWindowDrag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsAnyItemFromAppLayout:", v7);
  if (v5 == 3)
  {
    v11 = *(void **)&self->_isStripTonguePresented;
    *(_QWORD *)&self->_isStripTonguePresented = 0;

    goto LABEL_7;
  }
  if (v5 != 2)
  {
    if (v5 == 1)
    {
      objc_storeStrong((id *)&self->_isStripTonguePresented, v6);
      v10 = v6;
LABEL_11:
      v12 = v10;
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = -[SBFullScreenContinuousExposeSwitcherModifier initWithFullScreenAppLayout:]([SBFullScreenContinuousExposeSwitcherModifier alloc], "initWithFullScreenAppLayout:", v8);
      goto LABEL_11;
    }
LABEL_7:
    v12 = 0;
    goto LABEL_12;
  }
  if ((objc_msgSend(v6, "isEqual:", *(_QWORD *)&self->_isStripTonguePresented) & 1) != 0)
    goto LABEL_7;
  v12 = *(id *)&self->_isStripTonguePresented;
  objc_msgSend(v12, "setState:", 0);
LABEL_12:

  if (!v12)
  {
LABEL_13:
    -[SBFluidSwitcherRootSwitcherModifier floorModifier](self, "floorModifier");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)multitaskingModifierForEvent:(id)a3
{
  SBAppSwitcherContinuousExposeSwitcherModifier *v3;

  -[SBFluidSwitcherRootSwitcherModifier multitaskingModifier](self, "multitaskingModifier", a3);
  v3 = (SBAppSwitcherContinuousExposeSwitcherModifier *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = objc_alloc_init(SBAppSwitcherContinuousExposeSwitcherModifier);
  return v3;
}

- (id)transitionModifierForMainTransitionEvent:(id)a3
{
  id v4;
  SBMoveDisplaysTransitionSwitcherModifier *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  SBPulseTransitionSwitcherModifier *v20;
  SBGridToFullScreenSwitcherModifier *v21;
  void *v22;
  void *v23;
  void *v24;
  SBGridToFullScreenSwitcherModifier *v25;
  void *v26;
  uint64_t v27;
  SBGridToFullScreenSwitcherModifier *v28;
  void *v29;
  void *v30;
  void *v31;
  SBContinuousExposeToHomeSwitcherModifier *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  SBRotationSwitcherModifier *v37;
  void *v38;
  SBContinuousExposeSwitcherToAppModifier *v39;
  SBContinuousExposeSwitcherToAppModifier *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _BOOL8 v45;
  SBContinuousExposeAppToInlineAppExposeSwitcherModifier *v46;
  SBContinuousExposeAppToAppModifier *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  SBMoveDisplaysTransitionSwitcherModifier *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _BOOL8 v59;
  uint64_t v60;
  SBContinuousExposeAppToInlineAppExposeSwitcherModifier *v61;
  void *v62;
  SBContinuousExposeSwitcherToAppModifier *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v68;
  void *v69;
  void *v70;
  _BOOL8 v71;
  void *v72;
  void *v73;
  id v74;
  SBEntityRemovalCrossblurSwitcherModifier *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  SBEntityRemovalSlideOffscreenSwitcherModifier *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  objc_super v89;

  v4 = a3;
  if ((objc_msgSend(v4, "isiPadOSWindowingModeChangeEvent") & 1) == 0)
  {
    if ((objc_msgSend(v4, "isHandled") & 1) != 0
      || (objc_msgSend(v4, "isGestureInitiated") & 1) != 0
      || !objc_msgSend(v4, "isAnimated"))
    {
      goto LABEL_79;
    }
    objc_msgSend(v4, "transitionID");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "fromEnvironmentMode");
    v7 = objc_msgSend(v4, "toEnvironmentMode");
    objc_msgSend(v4, "fromAppLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toAppLayout");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "fromInterfaceOrientation");
    v10 = objc_msgSend(v4, "toInterfaceOrientation");
    objc_msgSend(v4, "removalContextForAppLayout:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "animationStyle");
    objc_msgSend(v11, "displayItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v8, "layoutRoleForItem:", v13);

    if (v6 == 3 && v7 == 3)
    {
      v14 = v87;
      if (v8)
      {
        if (v87)
        {
          if (objc_msgSend(v8, "isEqual:", v87))
          {
            v15 = objc_msgSend(v4, "fromInterfaceOrientation");
            if (v15 != objc_msgSend(v4, "toInterfaceOrientation"))
            {
              v37 = [SBRotationSwitcherModifier alloc];
              objc_msgSend(v4, "toAppLayout");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v5 = -[SBRotationSwitcherModifier initWithTransitionID:appLayout:fromInterfaceOrientation:toInterfaceOrientation:](v37, "initWithTransitionID:appLayout:fromInterfaceOrientation:toInterfaceOrientation:", v88, v38, objc_msgSend(v4, "fromInterfaceOrientation"), objc_msgSend(v4, "toInterfaceOrientation"));

              -[SBMoveDisplaysTransitionSwitcherModifier setShouldNotUseAnchorPointToPinLayoutRolesToSpace:](v5, "setShouldNotUseAnchorPointToPinLayoutRolesToSpace:", -[SBContinuousExposeRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled") ^ 1);
              goto LABEL_52;
            }
          }
        }
      }
      if (objc_msgSend(v4, "isAnyPulseEvent", v14))
      {
        if (!-[SBContinuousExposeRootSwitcherModifier _isActivatingAppLayoutUnoccludedForEvent:](self, "_isActivatingAppLayoutUnoccludedForEvent:", v4))goto LABEL_53;
        objc_msgSend(v4, "activatingAppLayout");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16 == v87)
        {
          v20 = -[SBPulseTransitionSwitcherModifier initWithTransitionID:appLayout:]([SBPulseTransitionSwitcherModifier alloc], "initWithTransitionID:appLayout:", v88, v87);
        }
        else
        {
          objc_msgSend(v16, "itemForLayoutRole:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v87, "layoutRoleForItem:", v18);

          v20 = -[SBSplitDisplayItemPulseTransitionSwitcherModifier initWithTransitionID:appLayout:layoutRole:chamoisWindowingUIEnabled:]([SBSplitDisplayItemPulseTransitionSwitcherModifier alloc], "initWithTransitionID:appLayout:layoutRole:chamoisWindowingUIEnabled:", v88, v87, v19, -[SBContinuousExposeRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"));
        }
        goto LABEL_50;
      }
      objc_msgSend(v4, "fromAppExposeBundleID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "toAppExposeBundleID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualStrings())
      {

LABEL_32:
        if (!objc_msgSend(v4, "isMoveDisplaysTransition"))
          goto LABEL_53;
        v5 = -[SBMoveDisplaysTransitionSwitcherModifier initWithTransitionEvent:]([SBMoveDisplaysTransitionSwitcherModifier alloc], "initWithTransitionEvent:", v4);
        goto LABEL_52;
      }
      objc_msgSend(v4, "fromAppExposeBundleID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {

      }
      else
      {
        objc_msgSend(v4, "toAppExposeBundleID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v43)
          goto LABEL_32;
      }
      objc_msgSend(v4, "toAppExposeBundleID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44 == 0;

      v46 = [SBContinuousExposeAppToInlineAppExposeSwitcherModifier alloc];
      objc_msgSend(v4, "toAppExposeBundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        objc_msgSend(v4, "fromAppExposeBundleID");
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = v46;
        v62 = (void *)v60;
        v5 = -[SBContinuousExposeAppToInlineAppExposeSwitcherModifier initWithTransitionID:direction:activeAppLayout:appExposeBundleIdentifier:](v61, "initWithTransitionID:direction:activeAppLayout:appExposeBundleIdentifier:", v88, v45, v8);

        goto LABEL_51;
      }
      v20 = -[SBContinuousExposeAppToInlineAppExposeSwitcherModifier initWithTransitionID:direction:activeAppLayout:appExposeBundleIdentifier:](v46, "initWithTransitionID:direction:activeAppLayout:appExposeBundleIdentifier:", v88, v45, v8, v17);
LABEL_50:
      v5 = (SBMoveDisplaysTransitionSwitcherModifier *)v20;
LABEL_51:

LABEL_52:
      if (v5)
      {
LABEL_57:
        if (v86)
        {
          if ((unint64_t)(v12 - 1) <= 2)
          {
            v51 = (void *)objc_msgSend(objc_alloc(*off_1E8EB8828[v12 - 1]), "initWithTransitionID:fromAppLayout:layoutRole:", v88, v8, v86);
            if (v51)
            {
              v52 = v51;
              objc_msgSend(v51, "addChildModifier:", v5);
              v53 = v52;

              v5 = v53;
            }
          }
        }
        goto LABEL_78;
      }
LABEL_53:
      v47 = [SBContinuousExposeAppToAppModifier alloc];
      objc_msgSend(v4, "fromDisplayItemLayoutAttributesMap");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "toDisplayItemLayoutAttributesMap");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[SBContinuousExposeAppToAppModifier initWithTransitionID:fromAppLayout:fromInterfaceOrientation:toAppLayout:toInterfaceOrientation:fromDisplayItemLayoutAttributesMap:toDisplayItemLayoutAttributesMap:](v47, "initWithTransitionID:fromAppLayout:fromInterfaceOrientation:toAppLayout:toInterfaceOrientation:fromDisplayItemLayoutAttributesMap:toDisplayItemLayoutAttributesMap:", v88, v8, v9, v87, v10, v48, v49);

      -[SBMoveDisplaysTransitionSwitcherModifier setContinuousExposeConfigurationChangeTransition:](v5, "setContinuousExposeConfigurationChangeTransition:", objc_msgSend(v4, "isContinuousExposeConfigurationChangeEvent"));
      -[SBMoveDisplaysTransitionSwitcherModifier setCommandTabTransition:](v5, "setCommandTabTransition:", objc_msgSend(v4, "isCommandTabTransition"));
      -[SBMoveDisplaysTransitionSwitcherModifier setLaunchingFromDockTransition:](v5, "setLaunchingFromDockTransition:", objc_msgSend(v4, "isLaunchingFromDockTransition"));
      -[SBMoveDisplaysTransitionSwitcherModifier setLaunchingFromSpotlightTransition:](v5, "setLaunchingFromSpotlightTransition:", objc_msgSend(v4, "isSpotlightTransition"));
      -[SBMoveDisplaysTransitionSwitcherModifier setMorphFromInAppViewTransition:](v5, "setMorphFromInAppViewTransition:", objc_msgSend(v4, "isMorphFromInAppView"));
      if ((objc_msgSend(v4, "isKeyboardShortcutInitiated") & 1) != 0)
        v50 = 1;
      else
        v50 = objc_msgSend(v4, "isTopAffordanceInitiated");
      -[SBMoveDisplaysTransitionSwitcherModifier setIsTopAffordanceMenuTransition:](v5, "setIsTopAffordanceMenuTransition:", v50);
      goto LABEL_57;
    }
    if (objc_msgSend(v4, "fromEnvironmentMode") == 2 && objc_msgSend(v4, "toEnvironmentMode") == 3)
    {
      if (!objc_msgSend(v4, "isMoveDisplaysTransition"))
      {
        if (-[SBContinuousExposeRootSwitcherModifier prefersStripHiddenAndDisabled](self, "prefersStripHiddenAndDisabled"))
        {
          v21 = [SBGridToFullScreenSwitcherModifier alloc];
          objc_msgSend(v4, "toAppLayout");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBFluidSwitcherRootSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v23, "copy");
          v25 = v21;
          v26 = v88;
          v27 = 0;
LABEL_25:
          v5 = -[SBGridToFullScreenSwitcherModifier initWithTransitionID:direction:fullScreenAppLayout:gridModifier:](v25, "initWithTransitionID:direction:fullScreenAppLayout:gridModifier:", v26, v27, v22, v24);

LABEL_69:
          goto LABEL_70;
        }
        v63 = [SBContinuousExposeSwitcherToAppModifier alloc];
        -[SBFluidSwitcherRootSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v22, "copy");
        v40 = v63;
        v41 = v88;
        v42 = 0;
        goto LABEL_68;
      }
LABEL_29:
      v5 = -[SBMoveDisplaysTransitionSwitcherModifier initWithTransitionEvent:]([SBMoveDisplaysTransitionSwitcherModifier alloc], "initWithTransitionEvent:", v4);
      goto LABEL_78;
    }
    if (objc_msgSend(v4, "fromEnvironmentMode") == 3 && objc_msgSend(v4, "toEnvironmentMode") == 2)
    {
      if (-[SBContinuousExposeRootSwitcherModifier prefersStripHiddenAndDisabled](self, "prefersStripHiddenAndDisabled"))
      {
        v28 = [SBGridToFullScreenSwitcherModifier alloc];
        objc_msgSend(v4, "toAppLayout");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBFluidSwitcherRootSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v23, "copy");
        v25 = v28;
        v26 = v88;
        v27 = 1;
        goto LABEL_25;
      }
      v39 = [SBContinuousExposeSwitcherToAppModifier alloc];
      -[SBFluidSwitcherRootSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "copy");
      v40 = v39;
      v41 = v88;
      v42 = 1;
LABEL_68:
      v5 = -[SBContinuousExposeSwitcherToAppModifier initWithTransitionID:direction:multitaskingModifier:](v40, "initWithTransitionID:direction:multitaskingModifier:", v41, v42, v23);
      goto LABEL_69;
    }
    if (objc_msgSend(v4, "fromEnvironmentMode") == 3 && objc_msgSend(v4, "toEnvironmentMode") == 1)
    {
      if (objc_msgSend(v4, "isMoveDisplaysTransition"))
        goto LABEL_29;
      if (v86)
      {
        v54 = v12;
        -[SBFluidSwitcherRootSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)objc_msgSend(v55, "copy");

        if (SBReduceMotion() || v54 == 1)
        {
          v75 = [SBEntityRemovalCrossblurSwitcherModifier alloc];
          objc_msgSend(v4, "transitionID");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "fromAppLayout");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = -[SBEntityRemovalCrossblurSwitcherModifier initWithTransitionID:appLayout:multitaskingModifier:](v75, "initWithTransitionID:appLayout:multitaskingModifier:", v76, v77, v56);
        }
        else
        {
          -[SBContinuousExposeRootSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v57;
          v59 = v54 != 2;
          if (v54 == 2)
            objc_msgSend(v57, "dosidoCommitIntentAnimationSettings");
          else
            objc_msgSend(v57, "dosidoDeclineIntentAnimationSettings");
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          v84 = [SBEntityRemovalSlideOffscreenSwitcherModifier alloc];
          objc_msgSend(v4, "transitionID");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "fromAppLayout");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = -[SBEntityRemovalSlideOffscreenSwitcherModifier initWithTransitionID:appLayout:direction:animationSettings:multitaskingModifier:](v84, "initWithTransitionID:appLayout:direction:animationSettings:multitaskingModifier:", v77, v85, v59, v76, v56);

        }
LABEL_78:

        if (v5)
          goto LABEL_80;
LABEL_79:
        v89.receiver = self;
        v89.super_class = (Class)SBContinuousExposeRootSwitcherModifier;
        -[SBFullScreenFluidSwitcherRootSwitcherModifier transitionModifierForMainTransitionEvent:](&v89, sel_transitionModifierForMainTransitionEvent_, v4);
        v5 = (SBMoveDisplaysTransitionSwitcherModifier *)objc_claimAutoreleasedReturnValue();
        goto LABEL_80;
      }
      goto LABEL_77;
    }
    if (objc_msgSend(v4, "fromEnvironmentMode") == 2 && objc_msgSend(v4, "toEnvironmentMode") == 1)
    {
      -[SBFluidSwitcherRootSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v31, "copy");

      v32 = [SBContinuousExposeToHomeSwitcherModifier alloc];
      v33 = v88;
      v34 = 0;
LABEL_37:
      v5 = -[SBContinuousExposeToHomeSwitcherModifier initWithTransitionID:direction:continuousExposeModifier:](v32, "initWithTransitionID:direction:continuousExposeModifier:", v33, v34, v22);
LABEL_70:

      goto LABEL_78;
    }
    if (objc_msgSend(v4, "fromEnvironmentMode") == 1 && objc_msgSend(v4, "toEnvironmentMode") == 2)
    {
      objc_msgSend(v4, "toAppExposeBundleID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {

      }
      else
      {
        objc_msgSend(v4, "fromAppExposeBundleID");
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v64)
        {
          -[SBFluidSwitcherRootSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v83, "copy");

          v32 = [SBContinuousExposeToHomeSwitcherModifier alloc];
          v33 = v88;
          v34 = 1;
          goto LABEL_37;
        }
      }
    }
    if (objc_msgSend(v4, "fromEnvironmentMode") != 2 && objc_msgSend(v4, "fromEnvironmentMode") != 1
      || objc_msgSend(v4, "toEnvironmentMode") != 2)
    {
      goto LABEL_77;
    }
    objc_msgSend(v4, "fromAppExposeBundleID");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toAppExposeBundleID");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (!BSEqualStrings())
    {
      objc_msgSend(v4, "fromAppExposeBundleID");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (v68)
      {

      }
      else
      {
        objc_msgSend(v4, "toAppExposeBundleID");
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v69)
          goto LABEL_77;
      }
      objc_msgSend(v4, "toAppExposeBundleID");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v70 == 0;

      objc_msgSend(v4, "toAppExposeBundleID");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v72;
      if (v72)
      {
        v74 = v72;
      }
      else
      {
        objc_msgSend(v4, "fromAppExposeBundleID");
        v74 = (id)objc_claimAutoreleasedReturnValue();
      }
      v78 = v74;

      v79 = objc_opt_class();
      -[SBContinuousExposeRootSwitcherModifier floorModifierForTransitionEvent:](self, "floorModifierForTransitionEvent:", v4);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = (void *)objc_msgSend(v80, "copy");
      SBSafeCast(v79, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = -[SBContinuousExposeToAppExposeSwitcherModifier initWithTransitionID:appExposeBundleID:direction:appExposeModifier:]([SBContinuousExposeToAppExposeSwitcherModifier alloc], "initWithTransitionID:appExposeBundleID:direction:appExposeModifier:", v88, v78, v71, v82);
      goto LABEL_78;
    }

LABEL_77:
    v5 = 0;
    goto LABEL_78;
  }
  v5 = 0;
LABEL_80:

  return v5;
}

- (int64_t)switcherModifierLevelForTransitionEvent:(id)a3
{
  id v4;
  int64_t v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isAppLaunchDuringWindowDragGestureTransition") & 1) != 0)
  {
    v5 = 4;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBContinuousExposeRootSwitcherModifier;
    v5 = -[SBFluidSwitcherRootSwitcherModifier switcherModifierLevelForTransitionEvent:](&v7, sel_switcherModifierLevelForTransitionEvent_, v4);
  }

  return v5;
}

- (id)gestureModifierForGestureEvent:(id)a3
{
  id v4;
  SBHomeGestureRootSwitcherModifier *v5;
  SBHomeGestureRootSwitcherModifier *v6;
  int64_t v7;
  SBAppSwitcherContinuousExposeSwitcherModifier *v8;
  __objc2_class *v9;
  SBContinuousExposeDragAndDropGestureRootSwitcherModifier *v10;
  void *v11;
  SBAppSwitcherContinuousExposeSwitcherModifier *v12;
  __objc2_class *v13;
  id v14;
  int64_t v15;
  SBContinuousExposeWindowDragRootSwitcherModifier *v16;
  void *v17;

  v4 = a3;
  v5 = 0;
  switch(objc_msgSend(v4, "gestureType"))
  {
    case 1:
      if (!-[SBContinuousExposeRootSwitcherModifier prefersStripHiddenAndDisabled](self, "prefersStripHiddenAndDisabled"))
      {
        v9 = SBContinuousExposeHomeGestureRootSwitcherModifier;
        goto LABEL_14;
      }
      v6 = [SBHomeGestureRootSwitcherModifier alloc];
      v7 = -[SBContinuousExposeRootSwitcherModifier _effectiveEnvironmentMode](self, "_effectiveEnvironmentMode");
      v8 = objc_alloc_init(SBAppSwitcherContinuousExposeSwitcherModifier);
      v5 = -[SBHomeGestureRootSwitcherModifier initWithStartingEnvironmentMode:multitaskingModifier:](v6, "initWithStartingEnvironmentMode:multitaskingModifier:", v7, v8);

      -[SBHomeGestureRootSwitcherModifier setEnsuresSelectedAppLayoutUsesAnchorPointSpacePinning:](v5, "setEnsuresSelectedAppLayoutUsesAnchorPointSpacePinning:", 1);
      break;
    case 2:
      v9 = SBGridSwipeUpGestureRootSwitcherModifier;
LABEL_14:
      v14 = [v9 alloc];
      v15 = -[SBContinuousExposeRootSwitcherModifier _effectiveEnvironmentMode](self, "_effectiveEnvironmentMode");
      v12 = objc_alloc_init(SBAppSwitcherContinuousExposeSwitcherModifier);
      v16 = (SBContinuousExposeWindowDragRootSwitcherModifier *)objc_msgSend(v14, "initWithStartingEnvironmentMode:multitaskingModifier:", v15, v12);
      goto LABEL_17;
    case 6:
      v10 = -[SBContinuousExposeDragAndDropGestureRootSwitcherModifier initWithStartingEnvironmentMode:appLayout:]([SBContinuousExposeDragAndDropGestureRootSwitcherModifier alloc], "initWithStartingEnvironmentMode:appLayout:", 3, *(_QWORD *)&self->super.super._hasPerformedInitialSetup);
      goto LABEL_12;
    case 8:
      v11 = *(void **)&self->super.super._hasPerformedInitialSetup;
      if (v11)
      {
        v12 = v11;
      }
      else
      {
        +[SBAppLayout homeScreenAppLayout](SBAppLayout, "homeScreenAppLayout");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "appLayoutByModifyingPreferredDisplayOrdinal:", -[SBContinuousExposeRootSwitcherModifier displayOrdinal](self, "displayOrdinal"));
        v12 = (SBAppSwitcherContinuousExposeSwitcherModifier *)objc_claimAutoreleasedReturnValue();

      }
      v16 = -[SBContinuousExposeWindowDragRootSwitcherModifier initWithStartingEnvironmentMode:initialAppLayout:]([SBContinuousExposeWindowDragRootSwitcherModifier alloc], "initWithStartingEnvironmentMode:initialAppLayout:", -[SBContinuousExposeRootSwitcherModifier _effectiveEnvironmentMode](self, "_effectiveEnvironmentMode"), v12);
LABEL_17:
      v5 = (SBHomeGestureRootSwitcherModifier *)v16;

      break;
    case 9:
      v10 = -[SBItemResizeGestureRootSwitcherModifier initWithStartingEnvironmentMode:selectedLayoutRole:]([SBItemResizeGestureRootSwitcherModifier alloc], "initWithStartingEnvironmentMode:selectedLayoutRole:", 3, objc_msgSend(v4, "selectedLayoutRole"));
      goto LABEL_12;
    case 10:
      v13 = SBRevealContinuousExposeStripsRootSwitcherModifier;
      goto LABEL_11;
    case 11:
      v13 = SBRevealContinuousExposeStripOverflowRootSwitcherModifier;
LABEL_11:
      v10 = (SBContinuousExposeDragAndDropGestureRootSwitcherModifier *)objc_msgSend([v13 alloc], "initWithInitialAppLayout:", *(_QWORD *)&self->super.super._hasPerformedInitialSetup);
LABEL_12:
      v5 = (SBHomeGestureRootSwitcherModifier *)v10;
      break;
    default:
      break;
  }

  return v5;
}

- (id)insertionModifierForInsertionEvent:(id)a3
{
  return 0;
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

- (id)highlightModifierForHighlightEvent:(id)a3
{
  id v3;
  SBHighlightSwitcherModifier *v4;
  SBHighlightSwitcherModifier *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if ((objc_msgSend(v3, "isHandled") & 1) != 0 || (objc_msgSend(v3, "isHoverEvent") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = [SBHighlightSwitcherModifier alloc];
    v6 = objc_msgSend(v3, "layoutRole");
    objc_msgSend(v3, "appLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[SBHighlightSwitcherModifier initWithLayoutRole:inAppLayout:listensForHighlightEvents:](v5, "initWithLayoutRole:inAppLayout:listensForHighlightEvents:", v6, v7, 1);

  }
  return v4;
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

- (id)userScrollingModifierForScrollEvent:(id)a3
{
  return objc_alloc_init(SBScrollingSwitcherModifier);
}

- (id)reduceMotionModifierForReduceMotionChangedEvent:(id)a3
{
  return 0;
}

- (id)focusedAppModifierForUpdateFocusedAppLayoutEvent:(id)a3
{
  id v3;
  SBFocusedAppLayoutSwitcherModifier *v4;
  void *v5;
  SBFocusedAppLayoutSwitcherModifier *v6;

  v3 = a3;
  v4 = [SBFocusedAppLayoutSwitcherModifier alloc];
  objc_msgSend(v3, "appLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SBFocusedAppLayoutSwitcherModifier initWithFocusedAppLayout:](v4, "initWithFocusedAppLayout:", v5);
  return v6;
}

- (id)lowEndHardwareModifier
{
  return 0;
}

- (id)handleEvent:(id)a3
{
  id v4;
  SBSwitcherModifier *v5;
  SBSwitcherModifier *initialFloorModifierForWindowDrag;
  void *v7;
  SBSwitcherModifier *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  SBInvalidateContinuousExposeIdentifiersEventResponse *v14;
  uint64_t v15;
  char v16;
  SBAppLayout *v17;
  char v18;
  uint64_t v19;
  char v20;
  SBInvalidateContinuousExposeIdentifiersEventResponse *v21;
  SBAppLayout *currentAppLayout;
  uint64_t v23;
  objc_super v25;

  v4 = a3;
  if (objc_msgSend(v4, "isTransitionEvent"))
  {
    v5 = (SBSwitcherModifier *)objc_msgSend(v4, "copy");
    initialFloorModifierForWindowDrag = self->_initialFloorModifierForWindowDrag;
    self->_initialFloorModifierForWindowDrag = v5;

  }
  v25.receiver = self;
  v25.super_class = (Class)SBContinuousExposeRootSwitcherModifier;
  -[SBFluidSwitcherRootSwitcherModifier handleEvent:](&v25, sel_handleEvent_, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_initialFloorModifierForWindowDrag;
  if (v8)
  {
    self->_initialFloorModifierForWindowDrag = 0;

  }
  if (objc_msgSend(v4, "isTransitionEvent"))
  {
    v9 = v4;
    objc_msgSend(v9, "toAppLayout");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fromAppLayout");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isAnimated");
    if (objc_msgSend(v9, "isMoveDisplaysTransition")
      && v11
      && (!v10 || (objc_msgSend((id)v11, "containsAllItemsFromAppLayout:", v10) & 1) != 0))
    {
      goto LABEL_44;
    }
    if (v10 && v11)
    {
      if (objc_msgSend(v9, "phase") == 2)
        v13 = 0;
      else
        v13 = v12;
      if ((v13 & 1) == 0
        && (!objc_msgSend((id)v10, "isEqual:", v11)
         || !-[SBAppLayout isEqual:](self->_currentAppLayout, "isEqual:", v10)))
      {
        objc_storeStrong((id *)&self->_currentAppLayout, (id)v10);
        v14 = [SBInvalidateContinuousExposeIdentifiersEventResponse alloc];
        v15 = v11;
LABEL_33:
        v19 = v10;
LABEL_42:
        v21 = -[SBInvalidateContinuousExposeIdentifiersEventResponse initWithTransitioningFromAppLayout:transitioningToAppLayout:animated:](v14, "initWithTransitioningFromAppLayout:transitioningToAppLayout:animated:", v15, v19, v12);
        goto LABEL_43;
      }
      goto LABEL_39;
    }
    if (v10 || !v11)
    {
      if (v10 && !v11)
      {
        if (objc_msgSend(v9, "phase") == 1)
          v18 = 0;
        else
          v18 = v12;
        if ((v18 & 1) == 0)
        {
          objc_storeStrong((id *)&self->_currentAppLayout, (id)v10);
          v14 = [SBInvalidateContinuousExposeIdentifiersEventResponse alloc];
          v15 = 0;
          goto LABEL_33;
        }
LABEL_39:
        v21 = 0;
LABEL_43:
        SBAppendSwitcherModifierResponse(v21, v7);
        v23 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v23;
LABEL_44:

        goto LABEL_45;
      }
      if (v10 | v11)
        goto LABEL_39;
      v20 = objc_msgSend(v9, "phase") == 1 ? 0 : v12;
      if ((v20 & 1) != 0)
        goto LABEL_39;
      currentAppLayout = self->_currentAppLayout;
      self->_currentAppLayout = 0;

      v14 = [SBInvalidateContinuousExposeIdentifiersEventResponse alloc];
      v15 = 0;
    }
    else
    {
      if (objc_msgSend(v9, "phase") == 3)
        v16 = 0;
      else
        v16 = v12;
      if ((v16 & 1) != 0)
        goto LABEL_39;
      v17 = self->_currentAppLayout;
      self->_currentAppLayout = 0;

      v14 = [SBInvalidateContinuousExposeIdentifiersEventResponse alloc];
      v15 = v11;
    }
    v19 = 0;
    goto LABEL_42;
  }
LABEL_45:

  return v7;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v9;
  uint64_t v10;
  SBContinuousExposePeekSwitcherModifier *v11;
  void *v12;
  SBContinuousExposePeekSwitcherModifier *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBContinuousExposeRootSwitcherModifier;
  -[SBFluidSwitcherRootSwitcherModifier handleTransitionEvent:](&v19, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toAppLayout");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(void **)&self->super.super._hasPerformedInitialSetup;
  *(_QWORD *)&self->super.super._hasPerformedInitialSetup = v6;

  if ((objc_msgSend(v4, "phase") == 2 || (objc_msgSend(v4, "isAnimated") & 1) == 0)
    && SBPeekConfigurationIsValid(objc_msgSend(v4, "toPeekConfiguration")))
  {
    -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", CFSTR("SBContinuousExposePeekModifierKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
      SBAppendSwitcherModifierResponse(v5, v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = [SBContinuousExposePeekSwitcherModifier alloc];
      objc_msgSend(v4, "toAppLayout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SBContinuousExposePeekSwitcherModifier initWithAppLayout:configuration:](v11, "initWithAppLayout:configuration:", v12, objc_msgSend(v4, "toPeekConfiguration"));

      -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v13, 2, CFSTR("SBContinuousExposePeekModifierKey"));
      v5 = (void *)v10;
    }
  }
  if (objc_msgSend(v4, "phase") == 2)
  {
    if (objc_msgSend(v4, "isAppLaunchDuringWindowDragGestureTransition"))
    {
      v14 = *(void **)&self->_isStripTonguePresented;
      -[SBFluidSwitcherRootSwitcherModifier floorModifier](self, "floorModifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v14) = objc_msgSend(v14, "isEqual:", v15);

      if ((v14 & 1) == 0)
      {
        -[SBFluidSwitcherRootSwitcherModifier floorModifier](self, "floorModifier");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(void **)&self->_isStripTonguePresented;
        *(_QWORD *)&self->_isStripTonguePresented = v16;

      }
    }
  }

  return v5;
}

- (id)handleContinuousExposeIdentifiersChangedEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  SBContinuousExposeIdentifierSlideModifier *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  SBContinuousExposeIdentifierSlideModifier *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier *v33;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  objc_super v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)SBContinuousExposeRootSwitcherModifier;
  -[SBSwitcherModifier handleContinuousExposeIdentifiersChangedEvent:](&v56, sel_handleContinuousExposeIdentifiersChangedEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isAnimated")
    && -[SBContinuousExposeRootSwitcherModifier _effectiveEnvironmentMode](self, "_effectiveEnvironmentMode") == 3)
  {
    objc_msgSend(v4, "transitioningFromAppLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transitioningToAppLayout");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (!v6 || !v7)
      goto LABEL_28;
    v35 = v5;
    objc_msgSend(v4, "previousContinuousExposeIdentifiersInSwitcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v4;
    objc_msgSend(v4, "previousContinuousExposeIdentifiersInStrip");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBContinuousExposeRootSwitcherModifier continuousExposeIdentifiersInStrip](self, "continuousExposeIdentifiersInStrip");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __88__SBContinuousExposeRootSwitcherModifier_handleContinuousExposeIdentifiersChangedEvent___block_invoke;
    v53[3] = &unk_1E8EB87E0;
    v13 = v11;
    v54 = v13;
    v39 = v8;
    v37 = v8;
    v55 = v37;
    objc_msgSend(v10, "bs_filter:", v53);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v12;
    v50[1] = 3221225472;
    v50[2] = __88__SBContinuousExposeRootSwitcherModifier_handleContinuousExposeIdentifiersChangedEvent___block_invoke_2;
    v50[3] = &unk_1E8EB87E0;
    v15 = v10;
    v51 = v15;
    v40 = v6;
    v41 = v6;
    v52 = v41;
    v38 = v13;
    objc_msgSend(v13, "bs_filter:", v50);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v17 = v14;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v47 != v20)
            objc_enumerationMutation(v17);
          v22 = -[SBContinuousExposeIdentifierSlideModifier initWithContinuousExposeIdentifier:previousContinuousExposeIdentifiersInSwitcher:previousContinuousExposeIdentifiersInStrip:direction:]([SBContinuousExposeIdentifierSlideModifier alloc], "initWithContinuousExposeIdentifier:previousContinuousExposeIdentifiersInSwitcher:previousContinuousExposeIdentifiersInStrip:direction:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i), v9, v15, 1);
          -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v22, 5, 0);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      }
      while (v19);
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v23 = v16;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v43 != v26)
            objc_enumerationMutation(v23);
          v28 = -[SBContinuousExposeIdentifierSlideModifier initWithContinuousExposeIdentifier:previousContinuousExposeIdentifiersInSwitcher:previousContinuousExposeIdentifiersInStrip:direction:]([SBContinuousExposeIdentifierSlideModifier alloc], "initWithContinuousExposeIdentifier:previousContinuousExposeIdentifiersInSwitcher:previousContinuousExposeIdentifiersInStrip:direction:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j), v9, v15, 0);
          -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v28, 5, 0);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
      }
      while (v25);
    }

    objc_msgSend(v41, "continuousExposeIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "continuousExposeIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (BSEqualStrings())
    {
      v31 = objc_msgSend(v41, "containsAnyItemFromAppLayout:", v37);

      v5 = v35;
      v4 = v36;
      if ((v31 & 1) != 0)
      {
LABEL_27:

        v8 = v39;
        v6 = v40;
LABEL_28:

        goto LABEL_29;
      }
      objc_msgSend(v37, "continuousExposeIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBContinuousExposeRootSwitcherModifier appLayoutsForContinuousExposeIdentifier:](self, "appLayoutsForContinuousExposeIdentifier:", v32);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v29, "containsObject:", v41)
        || (objc_msgSend(v36, "isGestureInitiated") & 1) != 0)
      {
LABEL_26:

        goto LABEL_27;
      }
      objc_msgSend(v29, "lastObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier initWithAppLayout:behindAppLayout:generationCount:]([SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier alloc], "initWithAppLayout:behindAppLayout:generationCount:", v41, v30, -[SBContinuousExposeRootSwitcherModifier continuousExposeIdentifiersGenerationCount](self, "continuousExposeIdentifiersGenerationCount"));
      -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v33, 5, 0);

    }
    else
    {
      v5 = v35;
      v4 = v36;
    }

    goto LABEL_26;
  }
LABEL_29:

  return v5;
}

uint64_t __88__SBContinuousExposeRootSwitcherModifier_handleContinuousExposeIdentifiersChangedEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "continuousExposeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = BSEqualStrings() ^ 1;

  }
  return v4;
}

uint64_t __88__SBContinuousExposeRootSwitcherModifier_handleContinuousExposeIdentifiersChangedEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "continuousExposeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = BSEqualStrings() ^ 1;

  }
  return v4;
}

- (id)handleContinuousExposeStripEdgeProtectTongueEvent:(id)a3
{
  id v4;
  void *v5;
  char v6;
  SBUpdateLayoutSwitcherEventResponse *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBContinuousExposeRootSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleContinuousExposeStripEdgeProtectTongueEvent:](&v10, sel_handleContinuousExposeStripEdgeProtectTongueEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isTonguePresented", v10.receiver, v10.super_class);

  LOBYTE(self->_effectiveAppLayoutOnStage) = v6;
  v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 4, 2);
  SBAppendSwitcherModifierResponse(v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  void *v6;
  SBSwitcherModifier *initialFloorModifierForWindowDrag;
  void *v8;
  void *v9;
  _BOOL4 IsValid;
  BOOL v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SBContinuousExposeRootSwitcherModifier;
  -[SBFluidSwitcherRootSwitcherModifier responseForProposedChildResponse:childModifier:event:](&v22, sel_responseForProposedChildResponse_childModifier_event_, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  initialFloorModifierForWindowDrag = self->_initialFloorModifierForWindowDrag;
  if (initialFloorModifierForWindowDrag)
  {
    -[SBSwitcherModifier fromAppLayout](initialFloorModifierForWindowDrag, "fromAppLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherModifier toAppLayout](self->_initialFloorModifierForWindowDrag, "toAppLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    IsValid = SBPeekConfigurationIsValid(-[SBSwitcherModifier fromPeekConfiguration](self->_initialFloorModifierForWindowDrag, "fromPeekConfiguration"));
    v11 = SBPeekConfigurationIsValid(-[SBSwitcherModifier toPeekConfiguration](self->_initialFloorModifierForWindowDrag, "toPeekConfiguration"));
    v12 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __95__SBContinuousExposeRootSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke;
    v20[3] = &unk_1E8E9DF50;
    v13 = v8;
    v21 = v13;
    objc_msgSend(v9, "appLayoutWithItemsPassingTest:", v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (IsValid && !v11 && (objc_msgSend(v9, "isEqual:", v13) & 1) == 0)
    {
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __95__SBContinuousExposeRootSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_2;
      v17[3] = &unk_1E8EB8808;
      v18 = v14;
      v19 = v9;
      objc_msgSend(v6, "responseByTransformingResponseWithTransformer:", v17);
      v15 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v15;
    }

  }
  return v6;
}

uint64_t __95__SBContinuousExposeRootSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsItem:", a2) ^ 1;
}

SBIconOverlayVisibilitySwitcherEventResponse *__95__SBContinuousExposeRootSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  char v6;
  SBIconOverlayVisibilitySwitcherEventResponse *v7;

  v3 = a2;
  if (objc_msgSend(v3, "type") != 12)
    goto LABEL_7;
  v4 = v3;
  objc_msgSend(v4, "appLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32)))
  {

    goto LABEL_6;
  }
  v6 = objc_msgSend(v4, "isVisible");

  if ((v6 & 1) != 0)
  {
LABEL_6:

LABEL_7:
    v7 = (SBIconOverlayVisibilitySwitcherEventResponse *)v3;
    goto LABEL_8;
  }
  v7 = -[SBIconOverlayVisibilitySwitcherEventResponse initWithAppLayout:visible:]([SBIconOverlayVisibilitySwitcherEventResponse alloc], "initWithAppLayout:visible:", *(_QWORD *)(a1 + 40), 0);

LABEL_8:
  return v7;
}

- (id)appLayoutOnStage
{
  return self->_currentAppLayout;
}

- (BOOL)shouldUseWallpaperGradientTreatment
{
  return 1;
}

- (SBSwitcherContinuousExposeStripTongueAttributes)continuousExposeStripTongueAttributes
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  SBSwitcherContinuousExposeStripTongueAttributes result;

  if (LOBYTE(self->_effectiveAppLayoutOnStage))
    v2 = 2;
  else
    v2 = 1;
  if (-[SBContinuousExposeRootSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
    v3 = 2;
  else
    v3 = 1;
  v4 = SBSwitcherContinuousExposeStripTongueAttributesMake(v2, v3);
  result.direction = v5;
  result.state = v4;
  return result;
}

- (BOOL)shouldScaleContentToFillBoundsAtIndex:(unint64_t)a3
{
  return 1;
}

- (BOOL)shouldUseNonuniformSnapshotScalingForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (int64_t)_effectiveEnvironmentMode
{
  void *v2;
  int64_t v3;

  -[SBFluidSwitcherRootSwitcherModifier floorModifier](self, "floorModifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = 3;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v3 = 2;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v3 = 2;
        else
          v3 = 1;
      }
    }
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (BOOL)_isActivatingAppLayoutUnoccludedForEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v14;

  v3 = a3;
  objc_msgSend(v3, "activatingAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "itemForLayoutRole:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fromDisplayItemLayoutAttributesMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "occlusionState");

    objc_msgSend(v3, "toDisplayItemLayoutAttributesMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "occlusionState");

    v14 = v9 == 1 && v12 == 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialFloorModifierForWindowDrag, 0);
  objc_storeStrong((id *)&self->_isStripTonguePresented, 0);
  objc_storeStrong((id *)&self->_currentAppLayout, 0);
  objc_storeStrong((id *)&self->super.super._hasPerformedInitialSetup, 0);
}

@end
