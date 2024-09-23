@implementation SBMainSwitcherControllerCoordinator

- (int64_t)homeScreenInterfaceOrientationForContentController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isMainDisplayWindowScene") & 1) != 0
    || objc_msgSend(v6, "isContinuityDisplayWindowScene"))
  {
    -[SBMainSwitcherControllerCoordinator _homeScreenAppearanceControllerForSwitcherContentController:](self, "_homeScreenAppearanceControllerForSwitcherContentController:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "interfaceOrientation");

  }
  else
  {
    v9 = -[SBMainSwitcherControllerCoordinator switcherInterfaceOrientationForSwitcherContentController:](self, "switcherInterfaceOrientationForSwitcherContentController:", v4);
  }

  return v9;
}

+ (id)_shim_activeSwitcherController
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedInstanceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_activeDisplaySwitcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sharedInstanceIfExists
{
  return (id)__sharedInstance_2;
}

- (id)_activeDisplaySwitcherController
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeDisplayWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBMainSwitcherControllerCoordinator switcherControllerForWindowScene:](self, "switcherControllerForWindowScene:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_embeddedDisplaySwitcherController
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "embeddedDisplayWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBMainSwitcherControllerCoordinator switcherControllerForWindowScene:](self, "switcherControllerForWindowScene:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)switcherContentController:(id)a3 supportsKillingOfAppLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  char v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__SBMainSwitcherControllerCoordinator_switcherContentController_supportsKillingOfAppLayout___block_invoke;
  v12[3] = &unk_1E8EA85E0;
  v9 = v8;
  v13 = v9;
  v14 = &v15;
  objc_msgSend(v7, "enumerate:", v12);
  v10 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (id)matchingIconViewForIconView:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "matchingIconViewByAddingConfigurationOptions:removingConfigurationOptions:", 6, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCustomIconImageViewControllerPriority:", 2);
  objc_msgSend(v4, "setShowsSquareCorners:", 1);
  objc_msgSend(v4, "setEnabled:", 0);
  objc_msgSend(v4, "setIconContentScale:", 1.0);
  if (objc_msgSend(v3, "iconImageSizeMatchesBoundsSize"))
  {
    objc_msgSend(v4, "setIconImageSizeMatchesBoundsSize:", 1);
    objc_msgSend(v3, "bounds");
    objc_msgSend(v4, "setBounds:");
  }

  return v4;
}

- (id)transitionEventForContext:(id)a3 identifier:(id)a4 phase:(unint64_t)a5 animated:(BOOL)a6
{
  uint64_t v6;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  unint64_t v38;
  SBTransitionSwitcherModifierEvent *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  SBMainSwitcherControllerCoordinator *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSMutableSet *liveDisplayItemsBeingTerminated;
  SBTransitionSwitcherModifierEvent *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  id *p_isa;
  void *v76;
  void *v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  void *v81;
  _BOOL8 v82;
  _BOOL8 v83;
  uint64_t v84;
  _BOOL8 v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSDictionary *activeTransitionModelRemovalAppLayoutToRemovalContext;
  SBTransitionSwitcherModifierEvent *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  char v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  SBTransitionSwitcherModifierEvent *v107;
  SBTransitionSwitcherModifierEvent *v108;
  void *v110;
  unsigned int v111;
  void *v112;
  void *v113;
  void *v115;
  int v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  id v123;
  void *v124;
  uint64_t v125;
  void *v126;
  SBMainSwitcherControllerCoordinator *v127;
  void *v128;
  void *v129;
  void *v130;
  _QWORD v131[4];
  SBTransitionSwitcherModifierEvent *v132;
  uint64_t v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _QWORD v138[4];
  SBTransitionSwitcherModifierEvent *v139;
  _BYTE v140[128];
  uint64_t v141;

  v6 = a6;
  v141 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v123 = a4;
  v10 = objc_opt_class();
  objc_msgSend(v9, "previousLayoutState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v120 = objc_msgSend(v12, "unlockedEnvironmentMode");
  v13 = objc_opt_class();
  objc_msgSend(v9, "layoutState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v125 = objc_msgSend(v15, "unlockedEnvironmentMode");
  objc_msgSend(v9, "request");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "transientOverlayContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "windowSceneManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "displayIdentity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "windowSceneForDisplayIdentity:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v12;
  v117 = v20;
  objc_msgSend(v20, "switcherController");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v122, "isChamoisWindowingUIEnabled");
  objc_msgSend(v12, "appLayout");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatingAppLayout");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "invalidateAppLayout");
  objc_msgSend(v15, "invalidateFloatingAppLayout");
  objc_msgSend(v15, "appLayout");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v15;
  objc_msgSend(v15, "floatingAppLayout");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = self;
  v118 = v17;
  if (v17)
  {
    v111 = v6;
    -[SBMainSwitcherControllerCoordinator _switcherControllerForTransitionRequest:](self, "_switcherControllerForTransitionRequest:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "windowScene");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v17, "transitionType");
    v25 = v17;
    v26 = v24;
    objc_msgSend(v25, "transientOverlay");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainSwitcherControllerCoordinator appLayoutForWorkspaceTransientOverlay:windowScene:](self, "appLayoutForWorkspaceTransientOverlay:windowScene:", v27, v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = v26 == 0;
      v30 = v120;
      if (v26)
        v30 = 3;
      v120 = v30;
      v31 = v125;
      if (!v26)
        v31 = 3;
      v125 = v31;
      if (v26)
        v32 = v28;
      else
        v32 = v128;
      v33 = v9;
      if (v29)
        v34 = v28;
      else
        v34 = v130;
      v35 = v21;
      if (v29)
        v36 = v130;
      else
        v36 = v128;
      v37 = v28;

      v21 = v35;
      v130 = v34;
      v9 = v33;
      v128 = v32;
    }

    v38 = a5;
    v6 = v111;
  }
  else
  {
    v38 = a5;
  }
  v39 = -[SBTransitionSwitcherModifierEvent initWithTransitionID:phase:animated:]([SBTransitionSwitcherModifierEvent alloc], "initWithTransitionID:phase:animated:", v123, v38, v6);
  -[SBTransitionSwitcherModifierEvent setFromAppLayout:](v39, "setFromAppLayout:", v128);
  -[SBTransitionSwitcherModifierEvent setFromEnvironmentMode:](v39, "setFromEnvironmentMode:", v120);
  -[SBTransitionSwitcherModifierEvent setFromInterfaceOrientation:](v39, "setFromInterfaceOrientation:", objc_msgSend(v21, "interfaceOrientation"));
  objc_msgSend(v21, "elementWithRole:", 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent setFromAppLayoutWantsExclusiveForeground:](v39, "setFromAppLayoutWantsExclusiveForeground:", objc_msgSend(v40, "hasLayoutAttributes:", 2));

  objc_msgSend(v21, "bundleIDShowingAppExpose");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent setFromAppExposeBundleID:](v39, "setFromAppExposeBundleID:", v41);

  objc_msgSend(v9, "activatingEntity");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applicationSceneEntity");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;

    v45 = v127;
  }
  else
  {
    objc_msgSend(v9, "entityForLayoutRole:", 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "applicationSceneEntity");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = v127;
    if (!v44)
    {
      v121 = 0;
      goto LABEL_25;
    }
  }
  -[SBMainSwitcherControllerCoordinator _recentAppLayoutsController](v45, "_recentAppLayoutsController");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "_transitionContextRepresentsAmbiguousLaunch:forApplicationSceneEntity:", v9, v44);

  v121 = v44;
  if (v48)
  {
    objc_msgSend(v44, "application");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "bundleIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransitionSwitcherModifierEvent setAmbiguouslyLaunchedBundleIDIfAny:](v39, "setAmbiguouslyLaunchedBundleIDIfAny:", v50);

  }
LABEL_25:
  -[SBTransitionSwitcherModifierEvent setToAppLayout:](v39, "setToAppLayout:", v130);
  -[SBTransitionSwitcherModifierEvent setToEnvironmentMode:](v39, "setToEnvironmentMode:", v125);
  -[SBTransitionSwitcherModifierEvent setToInterfaceOrientation:](v39, "setToInterfaceOrientation:", objc_msgSend(v124, "interfaceOrientation"));
  objc_msgSend(v124, "elementWithRole:", 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent setToAppLayoutWantsExclusiveForeground:](v39, "setToAppLayoutWantsExclusiveForeground:", objc_msgSend(v51, "hasLayoutAttributes:", 2));

  objc_msgSend(v124, "bundleIDShowingAppExpose");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent setToAppExposeBundleID:](v39, "setToAppExposeBundleID:", v52);

  objc_msgSend(v21, "floatingAppLayout");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent setFromFloatingAppLayout:](v39, "setFromFloatingAppLayout:", v53);

  -[SBTransitionSwitcherModifierEvent setFromFloatingConfiguration:](v39, "setFromFloatingConfiguration:", objc_msgSend(v21, "floatingConfiguration"));
  -[SBTransitionSwitcherModifierEvent setFromFloatingSwitcherVisible:](v39, "setFromFloatingSwitcherVisible:", objc_msgSend(v21, "isFloatingSwitcherVisible"));
  -[SBTransitionSwitcherModifierEvent setToFloatingSwitcherVisible:](v39, "setToFloatingSwitcherVisible:", objc_msgSend(v124, "isFloatingSwitcherVisible"));
  -[SBTransitionSwitcherModifierEvent setToFloatingAppLayout:](v39, "setToFloatingAppLayout:", v129);
  -[SBTransitionSwitcherModifierEvent setToFloatingConfiguration:](v39, "setToFloatingConfiguration:", objc_msgSend(v124, "floatingConfiguration"));
  -[SBTransitionSwitcherModifierEvent setFromPeekConfiguration:](v39, "setFromPeekConfiguration:", objc_msgSend(v21, "peekConfiguration"));
  -[SBTransitionSwitcherModifierEvent setToPeekConfiguration:](v39, "setToPeekConfiguration:", objc_msgSend(v124, "peekConfiguration"));
  -[SBTransitionSwitcherModifierEvent setFromSpaceConfiguration:](v39, "setFromSpaceConfiguration:", objc_msgSend(v21, "spaceConfiguration"));
  -[SBTransitionSwitcherModifierEvent setToSpaceConfiguration:](v39, "setToSpaceConfiguration:", objc_msgSend(v124, "spaceConfiguration"));
  -[SBTransitionSwitcherModifierEvent setFromWindowPickerRole:](v39, "setFromWindowPickerRole:", objc_msgSend(v21, "windowPickerRole"));
  -[SBTransitionSwitcherModifierEvent setToWindowPickerRole:](v39, "setToWindowPickerRole:", objc_msgSend(v124, "windowPickerRole"));
  liveDisplayItemsBeingTerminated = v45->_liveDisplayItemsBeingTerminated;
  v138[0] = MEMORY[0x1E0C809B0];
  v138[1] = 3221225472;
  v138[2] = __91__SBMainSwitcherControllerCoordinator_transitionEventForContext_identifier_phase_animated___block_invoke;
  v138[3] = &unk_1E8E9DF50;
  v55 = v39;
  v139 = v55;
  -[NSMutableSet bs_filter:](liveDisplayItemsBeingTerminated, "bs_filter:", v138);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent setFromDisplayItemsPendingTermination:](v55, "setFromDisplayItemsPendingTermination:", v56);

  objc_msgSend(v16, "bannerUnfurlSourceContextProvider");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "bannerUnfurlSourceContextForTransitionRequest:", v16);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifierEvent setBannerUnfurlSourceContext:](v55, "setBannerUnfurlSourceContext:", v58);

  -[SBTransitionSwitcherModifierEvent setPrefersCrossfadeTransition:](v55, "setPrefersCrossfadeTransition:", objc_msgSend(v9, "prefersCrossfadeTransition"));
  -[SBTransitionSwitcherModifierEvent setPrefersCenterZoomTransition:](v55, "setPrefersCenterZoomTransition:", objc_msgSend(v9, "prefersCenterZoomTransition"));
  objc_msgSend(v9, "preludeAnimationTokenWrapper");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "isTokenAvailable");

  if (v38 == 1 && v60)
  {
    objc_msgSend(v9, "preludeAnimationTokenWrapper");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "consumeToken");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBConsumableTokenWrapper consumableTokenWrapperWithToken:](SBConsumableTokenWrapper, "consumableTokenWrapperWithToken:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransitionSwitcherModifierEvent setZoomFromHardwareButtonPreludeTokenWrapper:](v55, "setZoomFromHardwareButtonPreludeTokenWrapper:", v63);

  }
  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  objc_msgSend(v9, "applicationSceneEntities");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v134, v140, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v135;
    v113 = v21;
LABEL_30:
    v68 = v9;
    v69 = 0;
    while (1)
    {
      if (*(_QWORD *)v135 != v67)
        objc_enumerationMutation(v64);
      v70 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * v69);
      objc_msgSend(v70, "activationSettings");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "objectForActivationSetting:", 45);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      if (v72 || objc_msgSend(v71, "flagForActivationSetting:", 55) == 1)
      {

      }
      else if (objc_msgSend(v71, "flagForActivationSetting:", 11) != 1)
      {
        goto LABEL_39;
      }
      objc_msgSend(v70, "displayItemRepresentation");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v130, "containsItem:", v73) & 1) != 0)
      {
        v76 = v130;
        goto LABEL_47;
      }
      if ((objc_msgSend(v129, "containsItem:", v73) & 1) != 0)
      {
        v76 = v129;
LABEL_47:
        objc_msgSend(v76, "leafAppLayoutForRole:", objc_msgSend(v76, "layoutRoleForItem:", v73));
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = v68;
        v21 = v113;
        p_isa = (id *)&v127->super.isa;
        if (v77)
          goto LABEL_58;
        goto LABEL_48;
      }

LABEL_39:
      if (v66 == ++v69)
      {
        v74 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v134, v140, 16);
        v66 = v74;
        v9 = v68;
        v21 = v113;
        if (v74)
          goto LABEL_30;
        break;
      }
    }
  }

  p_isa = (id *)&v127->super.isa;
LABEL_48:
  v77 = 0;
  if (objc_msgSend(v16, "source") == 52 && v128 == v130 && v119 == v129)
  {
    v78 = objc_msgSend(v9, "requestedWindowPickerRole");
    if (v78)
    {
      v80 = v78;
      if (v78 == 3)
      {
        v81 = v119;
        v80 = 1;
      }
      else
      {
        v81 = v130;
      }
      objc_msgSend(v81, "leafAppLayoutForRole:", v80);
      v79 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v79 = v130;
    }
    v77 = v79;
  }
LABEL_58:
  -[SBTransitionSwitcherModifierEvent setActivatingAppLayout:](v55, "setActivatingAppLayout:", v77);
  v82 = objc_msgSend(v16, "source") == 11 || objc_msgSend(v16, "source") == 27;
  -[SBTransitionSwitcherModifierEvent setGestureInitiated:](v55, "setGestureInitiated:", v82);
  v83 = objc_msgSend(v16, "source") == 51 || objc_msgSend(v16, "source") == 12;
  -[SBTransitionSwitcherModifierEvent setKeyboardShortcutInitiated:](v55, "setKeyboardShortcutInitiated:", v83);
  -[SBTransitionSwitcherModifierEvent setTopAffordanceInitiated:](v55, "setTopAffordanceInitiated:", objc_msgSend(v16, "source") == 50);
  -[SBTransitionSwitcherModifierEvent setDragAndDropTransition:](v55, "setDragAndDropTransition:", objc_msgSend(v16, "source") == 27);
  -[SBTransitionSwitcherModifierEvent setBreadcrumbTransition:](v55, "setBreadcrumbTransition:", objc_msgSend(v16, "source") == 15);
  v133 = 0;
  if (objc_msgSend(p_isa, "_shouldMorphFromPIPForTransitionContext:outForLayoutRole:", v9, &v133))
    -[SBTransitionSwitcherModifierEvent setMorphFromPIPTransition:](v55, "setMorphFromPIPTransition:", 1);
  else
    -[SBTransitionSwitcherModifierEvent setMorphToPIPTransition:](v55, "setMorphToPIPTransition:", objc_msgSend(p_isa, "_shouldMorphToPIPForTransitionContext:outForLayoutRole:", v9, &v133));
  -[SBTransitionSwitcherModifierEvent setMorphingPIPLayoutRole:](v55, "setMorphingPIPLayoutRole:", v133);
  -[SBTransitionSwitcherModifierEvent setZoomFromSystemApertureTransition:](v55, "setZoomFromSystemApertureTransition:", objc_msgSend(p_isa, "_shouldZoomFromSystemApertureForTransitionContext:", v9));
  -[SBTransitionSwitcherModifierEvent setContinuityTransition:](v55, "setContinuityTransition:", objc_msgSend(v16, "source") == 10);
  -[SBTransitionSwitcherModifierEvent setBannerUnfurlTransition:](v55, "setBannerUnfurlTransition:", objc_msgSend(v16, "source") == 37);
  -[SBTransitionSwitcherModifierEvent setSpotlightTransition:](v55, "setSpotlightTransition:", objc_msgSend(v16, "source") == 2);
  -[SBTransitionSwitcherModifierEvent setShelfTransition:](v55, "setShelfTransition:", objc_msgSend(v16, "source") == 52);
  -[SBTransitionSwitcherModifierEvent setShelfRequestTransition:](v55, "setShelfRequestTransition:", objc_msgSend(v16, "source") == 54);
  -[SBTransitionSwitcherModifierEvent setMorphFromInAppView:](v55, "setMorphFromInAppView:", objc_msgSend(v16, "source") == 55);
  -[SBTransitionSwitcherModifierEvent setQuickActionTransition:](v55, "setQuickActionTransition:", objc_msgSend(v16, "source") == 33);
  -[SBTransitionSwitcherModifierEvent setNewSceneTransition:](v55, "setNewSceneTransition:", objc_msgSend(v16, "source") == 35);
  if (objc_msgSend(v16, "isCrossingDisplays"))
    v84 = objc_msgSend(p_isa[16], "hasTransitioningDisplayItemsForSwitcherController:", v122);
  else
    v84 = 0;
  -[SBTransitionSwitcherModifierEvent setMoveDisplaysTransition:](v55, "setMoveDisplaysTransition:", v84);
  -[SBTransitionSwitcherModifierEvent setContinuousExposeConfigurationChangeEvent:](v55, "setContinuousExposeConfigurationChangeEvent:", objc_msgSend(v16, "source") == 65);
  -[SBTransitionSwitcherModifierEvent setiPadOSWindowingModeChangeEvent:](v55, "setiPadOSWindowingModeChangeEvent:", objc_msgSend(v16, "source") == 64);
  -[SBTransitionSwitcherModifierEvent setCommandTabTransition:](v55, "setCommandTabTransition:", objc_msgSend(v16, "source") == 16);
  v85 = objc_msgSend(v16, "source") == 24 || objc_msgSend(v16, "source") == 25;
  -[SBTransitionSwitcherModifierEvent setLaunchingFromDockTransition:](v55, "setLaunchingFromDockTransition:", v85);
  -[SBTransitionSwitcherModifierEvent setAppLaunchDuringWindowDragGestureTransition:](v55, "setAppLaunchDuringWindowDragGestureTransition:", objc_msgSend(v16, "source") == 68);
  v86 = objc_msgSend(v9, "isTransitioningToLessRecentSpace");
  v87 = v86 != 0x7FFFFFFFFFFFFFFFLL;
  if (v86 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (BSSettingFlagIsYes())
      v88 = 2;
    else
      v88 = 1;
    -[SBTransitionSwitcherModifierEvent setDosidoTransitionDirection:](v55, "setDosidoTransitionDirection:", v88);
  }
  activeTransitionModelRemovalAppLayoutToRemovalContext = v127->_activeTransitionModelRemovalAppLayoutToRemovalContext;
  v131[0] = MEMORY[0x1E0C809B0];
  v131[1] = 3221225472;
  v131[2] = __91__SBMainSwitcherControllerCoordinator_transitionEventForContext_identifier_phase_animated___block_invoke_2;
  v131[3] = &unk_1E8EB13A0;
  v90 = v55;
  v132 = v90;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](activeTransitionModelRemovalAppLayoutToRemovalContext, "enumerateKeysAndObjectsUsingBlock:", v131);
  if (v86 == 0x7FFFFFFFFFFFFFFFLL && v128 && v125 == 1 && !objc_msgSend(v128, "type"))
  {
    objc_msgSend(v21, "elementWithRole:", 1);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "workspaceEntity");
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "removalContextForEntity:", v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    if (v92)
    {
      if (!objc_msgSend(v92, "isDeviceApplicationSceneEntity") || v93)
      {
        v87 = objc_msgSend(v92, "isAppClipPlaceholderEntity");
      }
      else
      {
        objc_msgSend(v92, "application");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = v94;
        if (v94
          && (objc_msgSend(v94, "info"),
              v96 = (void *)objc_claimAutoreleasedReturnValue(),
              v97 = objc_msgSend(v96, "isAppClip"),
              v96,
              (v97 & 1) != 0))
        {
          v87 = 1;
        }
        else
        {
          objc_msgSend((id)SBApp, "windowSceneManager");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "displayIdentity");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "windowSceneForDisplayIdentity:", v99);
          v100 = objc_claimAutoreleasedReturnValue();

          v126 = (void *)v100;
          -[SBMainSwitcherControllerCoordinator switcherControllerForWindowScene:](v127, "switcherControllerForWindowScene:", v100);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "contentViewController");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "iconForAppLayout:", v128);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v102, "isBookmarkIcon"))
          {
            objc_msgSend(v102, "bookmark");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "webClip");
            v112 = v95;
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = objc_msgSend(v103, "isAppClip");

            v95 = v112;
          }
          else
          {
            v87 = 0;
          }

        }
      }
    }
    else
    {
      v87 = 0;
    }

  }
  -[SBTransitionSwitcherModifierEvent setIconZoomDisabled:](v90, "setIconZoomDisabled:", v87);
  if (v116)
  {
    objc_msgSend(v21, "displayItemLayoutAttributesMap");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransitionSwitcherModifierEvent setFromDisplayItemLayoutAttributesMap:](v90, "setFromDisplayItemLayoutAttributesMap:", v104);

    objc_msgSend(v124, "displayItemLayoutAttributesMap");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransitionSwitcherModifierEvent setToDisplayItemLayoutAttributesMap:](v90, "setToDisplayItemLayoutAttributesMap:", v105);

  }
  if (-[SBTransitionSwitcherModifierEvent isMoveDisplaysTransition](v90, "isMoveDisplaysTransition"))
  {
    +[SBTransitionSwitcherModifierMoveDisplaysContext moveDisplaysContextWithCoordinatedLayoutStateTransitionContext:relativeToSwitcherController:](SBTransitionSwitcherModifierMoveDisplaysContext, "moveDisplaysContextWithCoordinatedLayoutStateTransitionContext:relativeToSwitcherController:", v127->_currentCoordinatedLayoutStateTransitionContext, v122);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransitionSwitcherModifierEvent setMoveDisplaysContext:](v90, "setMoveDisplaysContext:", v106);

  }
  v107 = v132;
  v108 = v90;

  return v108;
}

- (BOOL)_shouldMorphToPIPForTransitionContext:(id)a3 outForLayoutRole:(int64_t *)a4
{
  id v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  BOOL v24;
  _BOOL4 v25;
  id v26;
  void *v27;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;

  v5 = a3;
  if (a4)
    *a4 = 0;
  if (SBReduceMotion())
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_opt_class();
    objc_msgSend(v5, "previousLayoutState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_opt_class();
    objc_msgSend(v5, "layoutState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v9;
    v13 = objc_msgSend(v9, "unlockedEnvironmentMode");
    v29 = v12;
    v14 = objc_msgSend(v12, "unlockedEnvironmentMode");
    objc_msgSend(v5, "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transientOverlayContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "source");
    v18 = (v13 & 0xFFFFFFFFFFFFFFFELL) == 2;
    if (v13 == 1)
    {
      if (v16)
        v18 = objc_msgSend(v16, "transitionType") == 1;
      else
        v18 = 0;
    }
    objc_msgSend(v5, "previousLayoutState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "interfaceOrientation");

    objc_msgSend(v5, "layoutState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "interfaceOrientation");

    v6 = 0;
    v24 = v22 < 2 || v20 == v22 || v17 == 11;
    if (v24 && v18 && v14 == 1)
    {
      v31 = 0;
      v32 = 0;
      v25 = +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:foundEntity:transitionStyle:](SBAutoPIPWorkspaceTransaction, "shouldAutoPIPEnteringBackgroundForRequest:foundEntity:transitionStyle:", v15, &v31, &v32);
      v26 = v31;
      v27 = v26;
      if (v25 && v26 && v32 == 3)
      {
        if (a4)
          *a4 = objc_msgSend(v26, "layoutRole");
        v6 = 1;
      }
      else
      {
        v6 = 0;
      }

    }
  }

  return v6;
}

- (BOOL)_shouldZoomFromSystemApertureForTransitionContext:(id)a3
{
  id v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  v4 = 0;
  if (!SBReduceMotion())
  {
    v5 = SBFEffectiveArtworkSubtype();
    if (v5 <= 2795)
    {
      if (v5 != 2556 && v5 != 2622)
        goto LABEL_11;
LABEL_8:
      objc_msgSend(v3, "request");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "source");

      if ((unint64_t)(v7 - 22) <= 0x2D)
        v4 = (0x208000000001uLL >> (v7 - 22)) & 1;
      else
        v4 = 0;
      goto LABEL_11;
    }
    if (v5 == 2868 || v5 == 2796)
      goto LABEL_8;
  }
LABEL_11:

  return v4;
}

- (BOOL)_shouldMorphFromPIPForTransitionContext:(id)a3 outForLayoutRole:(int64_t *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  objc_msgSend(v5, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "source");

  if (a4)
  {
    if (v7 == 45)
    {
      objc_msgSend(v5, "requestedActivatingWorkspaceEntity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = objc_msgSend(v8, "layoutRole");

    }
    else
    {
      *a4 = 0;
    }
  }

  return v7 == 45;
}

uint64_t __72__SBMainSwitcherControllerCoordinator_switcherControllerForWindowScene___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)switcherContentControllerControlsHomeScreenContents:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isMainDisplayWindowScene") & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isContinuityDisplayWindowScene");

  return v5;
}

- (id)switcherControllerForWindowScene:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__SBMainSwitcherControllerCoordinator_switcherControllerForWindowScene___block_invoke;
  v8[3] = &unk_1E8EA7530;
  v9 = v4;
  v5 = v4;
  -[SBMainSwitcherControllerCoordinator _switcherControllerPassingTest:](self, "_switcherControllerPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_switcherControllerForContentViewController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__SBMainSwitcherControllerCoordinator__switcherControllerForContentViewController___block_invoke;
  v8[3] = &unk_1E8EA7530;
  v9 = v4;
  v5 = v4;
  -[SBMainSwitcherControllerCoordinator _switcherControllerPassingTest:](self, "_switcherControllerPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_switcherControllerPassingTest:(id)a3
{
  uint64_t (**v4)(id, void *);
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, void *))a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_switcherControllersByWindowScene;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      -[NSMapTable objectForKey:](self->_switcherControllersByWindowScene, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v4[2](v4, v10) & 1) != 0)
        break;

      if (v7 == ++v9)
      {
        v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  return v10;
}

uint64_t __83__SBMainSwitcherControllerCoordinator__switcherControllerForContentViewController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

BOOL __73__SBMainSwitcherControllerCoordinator__switcherControllerForDisplayItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;

  v2 = (void *)MEMORY[0x1E0D231F0];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identityForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sceneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "existingSceneHandleForSceneIdentity:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 != 0;

  return v10;
}

- (void)switcherContentController:(id)a3 setPointerInteractionsEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  +[SBUIController sharedInstance](SBUIController, "sharedInstance", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPointerInteractionsEnabled:", v4);

}

- (void)updateWindowVisibilityForSwitcherContentController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWindowVisibilityForSwitcherContentController:", v4);

}

- (void)updateUserInteractionEnabledForSwitcherContentController:(id)a3
{
  id v4;
  int v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "isUserInteractionEnabled");
  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "switcherWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_setHitTestingDisabled:", v5 ^ 1u);

}

- (void)switcherContentController:(id)a3 setWallpaperScale:(double)a4 withAnimationMode:(int64_t)a5 completion:(id)a6
{
  void *v9;
  SBAppSwitcherSettings *settings;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[6];

  v9 = (void *)MEMORY[0x1E0CEABB0];
  settings = self->_settings;
  v11 = a6;
  -[SBAppSwitcherSettings animationSettings](settings, "animationSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "wallpaperScaleSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __112__SBMainSwitcherControllerCoordinator_switcherContentController_setWallpaperScale_withAnimationMode_completion___block_invoke;
  v14[3] = &unk_1E8E9DE88;
  *(double *)&v14[5] = a4;
  v14[4] = self;
  objc_msgSend(v9, "sb_animateWithSettings:mode:animations:completion:", v13, a5, v14, v11);

}

- (void)switcherContentController:(id)a3 setHomeScreenScale:(double)a4 withAnimationMode:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;

  v10 = a6;
  -[SBMainSwitcherControllerCoordinator _homeScreenAppearanceControllerForSwitcherContentController:](self, "_homeScreenAppearanceControllerForSwitcherContentController:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHomeScreenScale:behaviorMode:completion:", a5, v10, a4);

}

- (void)switcherContentController:(id)a3 setHomeScreenDimmingAlpha:(double)a4 withAnimationMode:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;

  v10 = a6;
  -[SBMainSwitcherControllerCoordinator _homeScreenAppearanceControllerForSwitcherContentController:](self, "_homeScreenAppearanceControllerForSwitcherContentController:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHomeScreenDimmingAlpha:behaviorMode:completion:", a5, v10, a4);

}

- (void)switcherContentController:(id)a3 setHomeScreenBackdropBlurProgress:(double)a4 withAnimationMode:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;

  v10 = a6;
  -[SBMainSwitcherControllerCoordinator _homeScreenAppearanceControllerForSwitcherContentController:](self, "_homeScreenAppearanceControllerForSwitcherContentController:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHomeScreenBlurProgress:behaviorMode:completion:", a5, v10, a4);

}

- (void)switcherContentController:(id)a3 setHomeScreenBackdropBlurMaterialRecipeName:(id)a4 withAnimationMode:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a6;
  v11 = a4;
  -[SBMainSwitcherControllerCoordinator _homeScreenAppearanceControllerForSwitcherContentController:](self, "_homeScreenAppearanceControllerForSwitcherContentController:", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHomeScreenBackdropBlurMaterialRecipeName:behaviorMode:completion:", v11, a5, v10);

}

- (void)switcherContentController:(id)a3 setHomeScreenAlpha:(double)a4 withAnimationMode:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;

  v10 = a6;
  -[SBMainSwitcherControllerCoordinator _homeScreenAppearanceControllerForSwitcherContentController:](self, "_homeScreenAppearanceControllerForSwitcherContentController:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHomeScreenAlpha:behaviorMode:completion:", a5, v10, a4);

}

- (id)draggingAppLayouts
{
  return (id)-[NSCountedSet copy](self->_draggingAppLayouts, "copy");
}

- (void)switcherContentController:(id)a3 setCacheAsynchronousRenderingSurfaces:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSHashTable *asynchronousRenderingCachedSurfacesReasons;
  NSHashTable *v8;
  NSHashTable *v9;
  uint64_t v10;
  NSHashTable *v11;
  NSUInteger v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  BSAbsoluteMachTimer *v17;
  NSObject *v18;
  BSAbsoluteMachTimer *disableCachingAsynchronousRenderingSurfacesTimer;
  BSAbsoluteMachTimer *v20;
  BSAbsoluteMachTimer *v21;
  BSAbsoluteMachTimer *v22;
  double v23;
  double v24;
  uint64_t v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id buf[2];

  v4 = a4;
  v6 = a3;
  asynchronousRenderingCachedSurfacesReasons = self->_asynchronousRenderingCachedSurfacesReasons;
  if (!asynchronousRenderingCachedSurfacesReasons)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_asynchronousRenderingCachedSurfacesReasons;
    self->_asynchronousRenderingCachedSurfacesReasons = v8;

    asynchronousRenderingCachedSurfacesReasons = self->_asynchronousRenderingCachedSurfacesReasons;
  }
  v10 = -[NSHashTable count](asynchronousRenderingCachedSurfacesReasons, "count");
  v11 = self->_asynchronousRenderingCachedSurfacesReasons;
  if (v4)
    -[NSHashTable addObject:](v11, "addObject:", v6);
  else
    -[NSHashTable removeObject:](v11, "removeObject:", v6);
  v12 = -[NSHashTable count](self->_asynchronousRenderingCachedSurfacesReasons, "count");
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "miscellaneousDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "disableAsyncRenderingSurfaceRetention");

  if (v15)
  {
    SBLogAppSwitcher();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_INFO, "disableAsyncRenderingSurfaceRetention default is set, not allowing async surface retention.", (uint8_t *)buf, 2u);
    }

    if (!v10)
      goto LABEL_17;
LABEL_16:
    objc_initWeak(buf, self);
    -[BSAbsoluteMachTimer invalidate](self->_disableCachingAsynchronousRenderingSurfacesTimer, "invalidate");
    disableCachingAsynchronousRenderingSurfacesTimer = self->_disableCachingAsynchronousRenderingSurfacesTimer;
    self->_disableCachingAsynchronousRenderingSurfacesTimer = 0;

    v20 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBMainSwitcherCoordinator.disableCachingAsynchronousRenderingSurfacesTimer"));
    v21 = self->_disableCachingAsynchronousRenderingSurfacesTimer;
    self->_disableCachingAsynchronousRenderingSurfacesTimer = v20;

    v22 = self->_disableCachingAsynchronousRenderingSurfacesTimer;
    -[SBAppSwitcherSettings asynchronousRenderingDisableSurfaceCacheDelayDuration](self->_settings, "asynchronousRenderingDisableSurfaceCacheDelayDuration");
    v24 = v23;
    v25 = MEMORY[0x1E0C80D38];
    v26 = MEMORY[0x1E0C80D38];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __103__SBMainSwitcherControllerCoordinator_switcherContentController_setCacheAsynchronousRenderingSurfaces___block_invoke;
    v27[3] = &unk_1E8E9EEC8;
    objc_copyWeak(&v28, buf);
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v22, "scheduleWithFireInterval:leewayInterval:queue:handler:", v25, v27, v24, 0.0);

    objc_destroyWeak(&v28);
    objc_destroyWeak(buf);
    goto LABEL_17;
  }
  if ((v10 == 0) != (v12 != 0))
    goto LABEL_17;
  if (!v12)
    goto LABEL_16;
  -[BSAbsoluteMachTimer invalidate](self->_disableCachingAsynchronousRenderingSurfacesTimer, "invalidate");
  v17 = self->_disableCachingAsynchronousRenderingSurfacesTimer;
  self->_disableCachingAsynchronousRenderingSurfacesTimer = 0;

  SBLogAppSwitcher();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_INFO, "Enabled caching asynchronous rendering surfaces.", (uint8_t *)buf, 2u);
  }

  CARenderServerSetCacheAsynchronousSurfaces();
LABEL_17:

}

- (void)switcherContentController:(id)a3 setContainerStatusBarHidden:(BOOL)a4 partsHidden:(unint64_t)a5 animationDuration:(double)a6
{
  _BOOL8 v8;
  id v10;
  _BOOL4 v11;
  const __CFString *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void *v16;
  _BOOL8 v18;
  id v19;

  v8 = a4;
  v10 = a3;
  v11 = -[SBMainSwitcherControllerCoordinator _contentControllerIsEmbeddedDisplayContentController:](self, "_contentControllerIsEmbeddedDisplayContentController:", v10);
  if (v11)
    v12 = CFSTR("kSBMainAppSwitcherStatusBarReason");
  else
    v12 = CFSTR("kSBFloatingAppSwitcherStatusBarReason");
  v13 = 288;
  if (v11)
    v13 = 280;
  v14 = (char *)self + v13;
  v15 = *(uint64_t *)((char *)&self->super.isa + v13);
  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", v10);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "windowScene");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainSwitcherControllerCoordinator _setContainerStatusBarHidden:animationDuration:usingAssertion:reason:windowScene:](self, "_setContainerStatusBarHidden:animationDuration:usingAssertion:reason:windowScene:", v8, v14, v12, v16, a6);
  if (!v8)
  {
    v18 = a6 > 0.0 && v15 == 0;
    -[SBMainSwitcherControllerCoordinator _setStatusBarPartsHidden:animated:windowScene:](self, "_setStatusBarPartsHidden:animated:windowScene:", a5, v18, v16);
  }

}

- (void)_setContainerStatusBarHidden:(BOOL)a3 animationDuration:(double)a4 usingAssertion:(id *)a5 reason:(id)a6 windowScene:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  double v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  BOOL v26;

  v10 = a3;
  v12 = a6;
  v13 = a7;
  v14 = *a5;
  objc_msgSend(v13, "switcherController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SBMainSwitcherControllerCoordinator _shouldTakeStatusBarAssertionForSwitcherController:](self, "_shouldTakeStatusBarAssertionForSwitcherController:", v15);

  if (v14)
  {
    objc_msgSend(v14, "settings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "alpha");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19 == 0.0;

  }
  else
  {
    v20 = 0;
  }
  if ((((v14 != 0) ^ v16) & 1) != 0 || v20 != v10)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA08]), "initWithDefaultParameters");
    objc_msgSend(v21, "setDuration:", a4);
    if (v16)
    {
      if (v14)
      {
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __120__SBMainSwitcherControllerCoordinator__setContainerStatusBarHidden_animationDuration_usingAssertion_reason_windowScene___block_invoke;
        v25[3] = &__block_descriptor_33_e36_v16__0__SBMutableStatusBarSettings_8l;
        v26 = v10;
        objc_msgSend(v14, "modifySettingsWithBlock:animationParameters:", v25, v21);
      }
      else
      {
        objc_msgSend(v13, "statusBarManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "assertionManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (id)objc_msgSend(v23, "newSettingsAssertionWithStatusBarHidden:atLevel:reason:", v10, 6, v12);
        objc_msgSend(v14, "acquireWithAnimationParameters:", v21);

      }
    }
    else
    {
      objc_msgSend(v14, "invalidateWithAnimationParameters:", v21);

      v14 = 0;
    }

  }
  v24 = *a5;
  *a5 = v14;

}

- (BOOL)_shouldTakeStatusBarAssertionForSwitcherController:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "layoutState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "unlockedEnvironmentMode") & 0xFFFFFFFFFFFFFFFELL) == 2;

  return v4;
}

- (BOOL)_contentControllerIsEmbeddedDisplayContentController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SBMainSwitcherControllerCoordinator _embeddedDisplaySwitcherController](self, "_embeddedDisplaySwitcherController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v4;
}

- (void)_setStatusBarPartsHidden:(unint64_t)a3 animated:(BOOL)a4 windowScene:(id)a5
{
  _BOOL8 v5;
  SBStatusBarPartVisibilityAssertion *containerStatusBarContentAssertion;
  SBStatusBarPartVisibilityAssertion *v9;
  void *v10;
  void *v11;
  SBStatusBarPartVisibilityAssertion *v12;
  SBStatusBarPartVisibilityAssertion *v13;
  id v14;

  v5 = a4;
  v14 = a5;
  containerStatusBarContentAssertion = self->_containerStatusBarContentAssertion;
  if ((a3 & 0xA) != 0 && !containerStatusBarContentAssertion)
  {
    v9 = [SBStatusBarPartVisibilityAssertion alloc];
    objc_msgSend(v14, "statusBarManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "statusBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SBStatusBarPartVisibilityAssertion initWithIdentifier:statusBar:forReason:](v9, "initWithIdentifier:statusBar:forReason:", CFSTR("SBMainSwitcherCoordinator"), v11, CFSTR("Home Screen Peek"));
    v13 = self->_containerStatusBarContentAssertion;
    self->_containerStatusBarContentAssertion = v12;

LABEL_7:
    containerStatusBarContentAssertion = self->_containerStatusBarContentAssertion;
    goto LABEL_8;
  }
  if ((a3 & 0xA) == 0 && containerStatusBarContentAssertion)
  {
    -[BSSimpleAssertion invalidate](containerStatusBarContentAssertion, "invalidate");
    v10 = self->_containerStatusBarContentAssertion;
    self->_containerStatusBarContentAssertion = 0;
    goto LABEL_7;
  }
LABEL_8:
  if (containerStatusBarContentAssertion)
  {
    -[SBStatusBarPartVisibilityAssertion setStatusBarPartWithIdentifier:hidden:animated:](containerStatusBarContentAssertion, "setStatusBarPartWithIdentifier:hidden:animated:", *MEMORY[0x1E0CEC200], (a3 >> 1) & 1, v5);
    -[SBStatusBarPartVisibilityAssertion setStatusBarPartWithIdentifier:hidden:animated:](self->_containerStatusBarContentAssertion, "setStatusBarPartWithIdentifier:hidden:animated:", *MEMORY[0x1E0CEC210], (a3 >> 3) & 1, v5);
  }

}

- (id)appLayoutsForSwitcherContentController:(id)a3
{
  void *v4;
  void *v5;

  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainSwitcherControllerCoordinator appLayoutsForSwitcherController:](self, "appLayoutsForSwitcherController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)appLayoutsForSwitcherController:(id)a3
{
  id v4;
  NSArray *v5;
  NSMapTable *currentWindowingModeCompatibleAppLayoutsByWindowScene;
  void *v7;
  void *v8;
  NSArray *v9;
  NSUInteger v10;
  NSUInteger v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  SBMainSwitcherControllerCoordinator *v45;
  SBSwitcherCoordinatedLayoutStateTransitionContext *currentCoordinatedLayoutStateTransitionContext;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  NSArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t m;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t n;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t ii;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t jj;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v87;
  NSArray *v88;
  uint64_t v89;
  void *v90;
  SBMainSwitcherControllerCoordinator *v91;
  NSCountedSet *obj;
  NSArray *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _QWORD v110[5];
  _QWORD v111[4];
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_appLayouts;
  v91 = self;
  if (SBFIsChamoisWindowingUIAvailable())
  {
    currentWindowingModeCompatibleAppLayoutsByWindowScene = self->_currentWindowingModeCompatibleAppLayoutsByWindowScene;
    objc_msgSend(v4, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](currentWindowingModeCompatibleAppLayoutsByWindowScene, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;

      v5 = v9;
    }

  }
  v10 = -[NSMapTable count](self->_switcherControllersByWindowScene, "count");
  if (v10 == 1)
  {
    v93 = v5;
  }
  else
  {
    v11 = v10;
    objc_msgSend(v4, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11 == 2
      && ((objc_msgSend(v12, "isMainDisplayWindowScene") & 1) != 0
       || objc_msgSend(v13, "isContinuityDisplayWindowScene")))
    {
      v93 = v5;
    }
    else
    {
      v87 = v13;
      if (objc_msgSend(v13, "isMainDisplayWindowScene"))
      {
        -[NSMapTable keyEnumerator](v91->_switcherControllersByWindowScene, "keyEnumerator");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "allObjects");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "bs_filter:", &__block_literal_global_281);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v123 = 0u;
        v124 = 0u;
        v121 = 0u;
        v122 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v121, v131, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v122;
          v21 = -1;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v122 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * i), "layoutStateProvider", v87);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "layoutState");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v21 &= ~(1 << objc_msgSend(v24, "displayOrdinal"));

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v121, v131, 16);
          }
          while (v19);
        }
        else
        {
          v21 = -1;
        }

      }
      else
      {
        objc_msgSend(v4, "layoutState");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v21 = 1 << objc_msgSend(v17, "displayOrdinal");
      }

      v93 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v117 = 0u;
      v118 = 0u;
      v119 = 0u;
      v120 = 0u;
      v25 = v5;
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v117, v130, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v118;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v118 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * j);
            if (((1 << objc_msgSend(v30, "preferredDisplayOrdinal", v87)) & (unint64_t)~v21) == 0)
              -[NSArray addObject:](v93, "addObject:", v30);
          }
          v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v117, v130, 16);
        }
        while (v27);
      }
      v88 = v5;
      v90 = v4;

      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      obj = v91->_draggingAppLayouts;
      v31 = -[NSCountedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v113, v129, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v114;
        v34 = MEMORY[0x1E0C809B0];
        v89 = *(_QWORD *)v114;
        do
        {
          for (k = 0; k != v32; ++k)
          {
            if (*(_QWORD *)v114 != v33)
              objc_enumerationMutation(obj);
            v36 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * k);
            objc_msgSend(v36, "itemForLayoutRole:", 1, v87);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v111[0] = v34;
            v111[1] = 3221225472;
            v111[2] = __71__SBMainSwitcherControllerCoordinator_appLayoutsForSwitcherController___block_invoke_2;
            v111[3] = &unk_1E8EAC3A8;
            v38 = v37;
            v112 = v38;
            if ((-[NSArray bs_containsObjectPassingTest:](v93, "bs_containsObjectPassingTest:", v111) & 1) == 0)
            {
              -[NSMapTable objectEnumerator](v91->_switcherControllersByWindowScene, "objectEnumerator");
              v39 = v32;
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "allObjects");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v110[0] = v34;
              v110[1] = 3221225472;
              v110[2] = __71__SBMainSwitcherControllerCoordinator_appLayoutsForSwitcherController___block_invoke_3;
              v110[3] = &unk_1E8EA7530;
              v110[4] = v36;
              objc_msgSend(v41, "bs_firstObjectPassingTest:", v110);
              v42 = v34;
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              v32 = v39;
              -[SBMainSwitcherControllerCoordinator convertAppLayout:fromSwitcherController:toSwitcherController:](v91, "convertAppLayout:fromSwitcherController:toSwitcherController:", v36, v43, v90);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray addObject:](v93, "addObject:", v44);

              v33 = v89;
              v34 = v42;
            }

          }
          v32 = -[NSCountedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v113, v129, 16);
        }
        while (v32);
      }

      v45 = v91;
      currentCoordinatedLayoutStateTransitionContext = v91->_currentCoordinatedLayoutStateTransitionContext;
      if (currentCoordinatedLayoutStateTransitionContext)
      {
        -[SBSwitcherCoordinatedLayoutStateTransitionContext fromSwitcherController](currentCoordinatedLayoutStateTransitionContext, "fromSwitcherController");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v90;
        v48 = objc_msgSend(v90, "isEqual:", v47);

        v5 = v88;
        if (v48)
        {
          -[SBSwitcherCoordinatedLayoutStateTransitionContext displayItems](v91->_currentCoordinatedLayoutStateTransitionContext, "displayItems");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (void *)objc_msgSend(v49, "mutableCopy");

          v108 = 0u;
          v109 = 0u;
          v106 = 0u;
          v107 = 0u;
          v51 = v93;
          v52 = -[NSArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v106, v128, 16);
          if (v52)
          {
            v53 = v52;
            v54 = *(_QWORD *)v107;
            do
            {
              for (m = 0; m != v53; ++m)
              {
                if (*(_QWORD *)v107 != v54)
                  objc_enumerationMutation(v51);
                v56 = (void *)MEMORY[0x1E0C99E60];
                objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * m), "allItems", v87);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "setWithArray:", v57);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "minusSet:", v58);

              }
              v53 = -[NSArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v106, v128, 16);
            }
            while (v53);
          }

          v104 = 0u;
          v105 = 0u;
          v102 = 0u;
          v103 = 0u;
          v59 = v50;
          v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v102, v127, 16);
          v45 = v91;
          if (v60)
          {
            v61 = v60;
            v62 = *(_QWORD *)v103;
            do
            {
              for (n = 0; n != v61; ++n)
              {
                if (*(_QWORD *)v103 != v62)
                  objc_enumerationMutation(v59);
                v64 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * n);
                -[SBSwitcherCoordinatedLayoutStateTransitionContext fromAppLayout](v91->_currentCoordinatedLayoutStateTransitionContext, "fromAppLayout", v87);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "leafAppLayoutForItem:", v64);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSArray addObject:](v51, "addObject:", v66);

              }
              v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v102, v127, 16);
            }
            while (v61);
          }

        }
        -[SBSwitcherCoordinatedLayoutStateTransitionContext toSwitcherController](v45->_currentCoordinatedLayoutStateTransitionContext, "toSwitcherController", v87);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v90, "isEqual:", v67);

        if (v68)
        {
          -[SBSwitcherCoordinatedLayoutStateTransitionContext displayItems](v45->_currentCoordinatedLayoutStateTransitionContext, "displayItems");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = (void *)objc_msgSend(v69, "mutableCopy");

          v100 = 0u;
          v101 = 0u;
          v98 = 0u;
          v99 = 0u;
          v93 = v93;
          v71 = -[NSArray countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v98, v126, 16);
          if (v71)
          {
            v72 = v71;
            v73 = *(_QWORD *)v99;
            do
            {
              for (ii = 0; ii != v72; ++ii)
              {
                if (*(_QWORD *)v99 != v73)
                  objc_enumerationMutation(v93);
                v75 = (void *)MEMORY[0x1E0C99E60];
                objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * ii), "allItems");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setWithArray:", v76);
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "minusSet:", v77);

              }
              v72 = -[NSArray countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v98, v126, 16);
            }
            while (v72);
          }

          v96 = 0u;
          v97 = 0u;
          v94 = 0u;
          v95 = 0u;
          v78 = v70;
          v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v94, v125, 16);
          if (v79)
          {
            v80 = v79;
            v81 = *(_QWORD *)v95;
            do
            {
              for (jj = 0; jj != v80; ++jj)
              {
                if (*(_QWORD *)v95 != v81)
                  objc_enumerationMutation(v78);
                v83 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * jj);
                -[SBSwitcherCoordinatedLayoutStateTransitionContext toAppLayout](v91->_currentCoordinatedLayoutStateTransitionContext, "toAppLayout");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v84, "leafAppLayoutForItem:", v83);
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSArray addObject:](v93, "addObject:", v85);

              }
              v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v94, v125, 16);
            }
            while (v80);
          }

        }
      }
      else
      {
        v4 = v90;
        v5 = v88;
      }
      v13 = v87;
    }

  }
  return v93;
}

- (BOOL)isInAppStatusBarRequestedHiddenForSwitcherContentController:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInAppStatusBarRequestedHiddenForSwitcherContentController:", v4);

  return v6;
}

void __114__SBMainSwitcherControllerCoordinator_switcherContentController_layoutStateTransitionDidEndWithTransitionContext___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "applicationWithBundleIdentifier:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "processState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processForPID:", objc_msgSend(v8, "pid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isRunning"))
  {
    objc_msgSend(v12, "info");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_activateBetaLaunchHandlesIfNeededWithAppInfo:processHandle:", v10, v11);
    objc_msgSend(*(id *)(a1 + 32), "_presentStoreKitSheetIfNeededWithAppInfo:processHandle:", v10, v11);
    objc_msgSend(*(id *)(a1 + 32), "_requestAutomaticUpdateAuthorizationIfNecessaryWithAppInfo:processHandle:", v10, v11);

  }
}

- (void)_requestAutomaticUpdateAuthorizationIfNecessaryWithAppInfo:(id)a3 processHandle:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a4;
  if (objc_msgSend(a3, "requiresAuthorizationForAutoUpdates"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __112__SBMainSwitcherControllerCoordinator__requestAutomaticUpdateAuthorizationIfNecessaryWithAppInfo_processHandle___block_invoke;
    v7[3] = &unk_1E8E9DED8;
    v8 = v6;
    -[SBMainSwitcherControllerCoordinator _asyncOnStoreAppLaunchUIActivationQueue:](self, "_asyncOnStoreAppLaunchUIActivationQueue:", v7);

  }
}

- (void)_presentStoreKitSheetIfNeededWithAppInfo:(id)a3 processHandle:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a4;
  if (objc_msgSend(a3, "triggersStoreKitMessaging"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __94__SBMainSwitcherControllerCoordinator__presentStoreKitSheetIfNeededWithAppInfo_processHandle___block_invoke;
    v7[3] = &unk_1E8E9DED8;
    v8 = v6;
    -[SBMainSwitcherControllerCoordinator _asyncOnStoreAppLaunchUIActivationQueue:](self, "_asyncOnStoreAppLaunchUIActivationQueue:", v7);

  }
}

- (void)_activateBetaLaunchHandlesIfNeededWithAppInfo:(id)a3 processHandle:(id)a4
{
  id v6;
  NSMutableSet *v7;
  NSMutableSet *activeBetaLaunchHandles;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  if (objc_msgSend(a3, "isBeta"))
  {
    if (!self->_activeBetaLaunchHandles)
    {
      v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      activeBetaLaunchHandles = self->_activeBetaLaunchHandles;
      self->_activeBetaLaunchHandles = v7;

    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDA88]), "initWithProcessHandle:", v6);
    objc_msgSend(v9, "setActivationDelegate:", self);
    -[NSMutableSet addObject:](self->_activeBetaLaunchHandles, "addObject:", v9);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __99__SBMainSwitcherControllerCoordinator__activateBetaLaunchHandlesIfNeededWithAppInfo_processHandle___block_invoke;
    v11[3] = &unk_1E8E9DED8;
    v12 = v9;
    v10 = v9;
    -[SBMainSwitcherControllerCoordinator _asyncOnStoreAppLaunchUIActivationQueue:](self, "_asyncOnStoreAppLaunchUIActivationQueue:", v11);

  }
}

- (id)currentCoordinatedLayoutStateTransitionContext
{
  return self->_currentCoordinatedLayoutStateTransitionContext;
}

- (BOOL)switcherContentController:(id)a3 supportsTitleItemsForAppLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v7 = a4;
  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __96__SBMainSwitcherControllerCoordinator_switcherContentController_supportsTitleItemsForAppLayout___block_invoke;
  v16 = &unk_1E8EA85E0;
  v9 = v8;
  v17 = v9;
  v18 = &v19;
  objc_msgSend(v7, "enumerate:", &v13);
  if (*((_BYTE *)v20 + 24))
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    v11 = objc_msgSend(v7, "type", v13, v14, v15, v16);
    if (v11 >= 5)
      LOBYTE(v10) = 0;
    else
      v10 = (0x19u >> v11) & 1;
  }

  _Block_object_dispose(&v19, 8);
  return v10;
}

uint64_t __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsItem:", a2) ^ 1;
}

void __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(v5, "environment") == 2
    && objc_msgSend(v5, "containsAnyItemFromSet:", *(_QWORD *)(a1 + 32))
    && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
    || objc_msgSend(v5, "environment") == 1
    && objc_msgSend(v5, "containsAnyItemFromSet:", *(_QWORD *)(a1 + 48))
    && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    goto LABEL_20;
  }
  if (objc_msgSend(*(id *)(a1 + 56), "_shouldPrioritizeSortOrderForAppLayout:", v5))
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v5);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = *(id *)(*(_QWORD *)(a1 + 56) + 88);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        if (objc_msgSend(v5, "containsItemWithUniqueIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i)))
        {
          objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
          goto LABEL_19;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_19:

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 240), "containsObject:", v5))
LABEL_20:
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  if (+[SBApplicationAppProtectionAssistant areAnyApplicationsHidden](SBApplicationAppProtectionAssistant, "areAnyApplicationsHidden")&& (objc_msgSend(*(id *)(a1 + 40), "containsIndex:", a3) & 1) == 0)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_3;
    v11[3] = &unk_1E8EA4EA0;
    v12 = *(id *)(a1 + 40);
    v13 = a3;
    objc_msgSend(v5, "enumerate:", v11);

  }
}

void __96__SBMainSwitcherControllerCoordinator_switcherContentController_supportsTitleItemsForAppLayout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_deviceApplicationSceneHandleForDisplayItem:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "prefersHeaderHiddenInSwitcher");
    v6 = v7;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

void __92__SBMainSwitcherControllerCoordinator_switcherContentController_supportsKillingOfAppLayout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  char v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "_deviceApplicationSceneHandleForDisplayItem:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = v6;
    v7 = objc_msgSend(v6, "prefersKillingInSwitcherDisabled") ^ 1;
    v6 = v8;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;

}

- (BOOL)_shouldPrioritizeSortOrderForAppLayout:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_msgSend(v4, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "type");

  if (v6)
    goto LABEL_5;
  if (objc_msgSend(v5, "count") != 1)
    goto LABEL_5;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainSwitcherControllerCoordinator _switcherControllerForDisplayItem:](self, "_switcherControllerForDisplayItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_deviceApplicationSceneHandleForDisplayItem:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_msgSend(v9, "shouldPrioritizeForSwitcherOrdering");

  }
  else
  {
LABEL_5:
    v10 = 0;
  }

  return v10;
}

- (id)_switcherControllerForDisplayItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__SBMainSwitcherControllerCoordinator__switcherControllerForDisplayItem___block_invoke;
  v8[3] = &unk_1E8EA7530;
  v9 = v4;
  v5 = v4;
  -[SBMainSwitcherControllerCoordinator _switcherControllerPassingTest:](self, "_switcherControllerPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)switcherContentController:(id)a3 transitionEventForContext:(id)a4 identifier:(id)a5 phase:(unint64_t)a6 animated:(BOOL)a7
{
  return -[SBMainSwitcherControllerCoordinator transitionEventForContext:identifier:phase:animated:](self, "transitionEventForContext:identifier:phase:animated:", a4, a5, a6, a7);
}

void __112__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "isDeviceApplicationSceneEntity"))
  {
    objc_msgSend(v10, "deviceApplicationSceneEntity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sceneHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isTranslucent");

    if ((v7 & 1) != 0)
      goto LABEL_5;
  }
  if (objc_msgSend(v10, "isDeviceApplicationSceneEntity"))
  {
    objc_msgSend(v10, "sceneHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "wantsEnhancedWindowingEnabled");

    if (v9)
    {
LABEL_5:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
  }

}

- (BOOL)switcherContentController:(id)a3 shouldResignActiveForStartOfTransition:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;

  v11 = a4;
  objc_msgSend(v11, "applicationTransitionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "toLayoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fromLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "unlockedEnvironmentMode");
  v9 = objc_msgSend(v5, "source");
  v10 = objc_msgSend(v5, "source");
  LOBYTE(v11) = 0;
  if ((objc_msgSend(v4, "animationDisabled") & 1) == 0 && v9 != 11 && v10 != 27 && v8 == 3)
  {
    objc_msgSend(v7, "elements");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "elements");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v12, "isEqualToSet:", v13) ^ 1;

  }
  return (char)v11;
}

uint64_t __115__SBMainSwitcherControllerCoordinator__persistenceIdentifiersForBundleIdentifier_onlyIncludeLaunchableIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHidden");
}

- (id)switcherContentController:(id)a3 visibleAppLayoutsForBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  -[SBAppSwitcherModel appLayoutsForBundleIdentifier:includingHiddenAppLayouts:](self->_mainSwitcherModel, "appLayoutsForBundleIdentifier:includingHiddenAppLayouts:", a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMapTable count](self->_switcherControllersByWindowScene, "count") == 1)
  {
    v8 = v7;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    -[SBMainSwitcherControllerCoordinator appLayoutsForSwitcherContentController:](self, "appLayoutsForSwitcherContentController:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __102__SBMainSwitcherControllerCoordinator_switcherContentController_visibleAppLayoutsForBundleIdentifier___block_invoke;
    v14[3] = &unk_1E8E9DF78;
    v15 = v11;
    v12 = v11;
    objc_msgSend(v7, "bs_filter:", v14);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_persistenceIdentifiersForBundleIdentifier:(id)a3 onlyIncludeLaunchableIdentifiers:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  SBMainSwitcherControllerCoordinator *v44;
  id v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v4 = a4;
  v73 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E10];
  -[SBAppSwitcherModel _recentAppLayoutsController](self->_mainSwitcherModel, "_recentAppLayoutsController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recentsForBundleIdentifier:includingHiddenAppLayouts:", v6, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = v10;
  else
    v12 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v8, "orderedSetWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = self;
  objc_msgSend(v13, "addObjectsFromArray:", self->_appLayouts);
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v13;
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
  if (v49)
  {
    v47 = *(_QWORD *)v66;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v66 != v47)
          objc_enumerationMutation(obj);
        v51 = v14;
        v15 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v14);
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        objc_msgSend(v15, "allItems");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v62;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v62 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
              objc_msgSend(v21, "uniqueIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22 && !objc_msgSend(v21, "type"))
              {
                +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "applicationForDisplayItem:", v21);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                +[SBApplicationSceneHandle lookupOrCreatePersistenceIDFromApplication:sceneID:](SBApplicationSceneHandle, "lookupOrCreatePersistenceIDFromApplication:sceneID:", v24, v22);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "addObject:", v25);

              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
          }
          while (v18);
        }

        v14 = v51 + 1;
      }
      while (v51 + 1 != v49);
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
    }
    while (v49);
  }

  -[SBAppSwitcherModel _recentAppLayoutsController](v44->_mainSwitcherModel, "_recentAppLayoutsController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "recentsForBundleIdentifier:includingHiddenAppLayouts:", v6, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bs_filter:", &__block_literal_global_256);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v45 = v28;
  v50 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
  if (v50)
  {
    v48 = *(_QWORD *)v58;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v58 != v48)
          objc_enumerationMutation(v45);
        v52 = v29;
        v30 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v29);
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        objc_msgSend(v30, "allItems");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v54;
          do
          {
            for (j = 0; j != v33; ++j)
            {
              if (*(_QWORD *)v54 != v34)
                objc_enumerationMutation(v31);
              v36 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
              objc_msgSend(v36, "uniqueIdentifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if (v37 && !objc_msgSend(v36, "type") && (!v4 || !objc_msgSend(v7, "count")))
              {
                +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "applicationForDisplayItem:", v36);
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                +[SBApplicationSceneHandle lookupOrCreatePersistenceIDFromApplication:sceneID:](SBApplicationSceneHandle, "lookupOrCreatePersistenceIDFromApplication:sceneID:", v39, v37);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "addObject:", v40);

              }
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
          }
          while (v33);
        }

        v29 = v52 + 1;
      }
      while (v52 + 1 != v50);
      v50 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    }
    while (v50);
  }

  if (objc_msgSend(v7, "count"))
    v41 = v7;
  else
    v41 = 0;
  v42 = v41;

  return v42;
}

+ (SBMainSwitcherControllerCoordinator)sharedInstance
{
  void *v4;
  id v5;
  _QWORD block[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if ((objc_msgSend(MEMORY[0x1E0D44730], "inUserSessionLoginUI") & 1) != 0)
    return (SBMainSwitcherControllerCoordinator *)0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SBMainSwitcherControllerCoordinator_sharedInstance__block_invoke;
  block[3] = &unk_1E8E9ED40;
  block[4] = &v7;
  if (sharedInstance_onceToken_26 != -1)
    dispatch_once(&sharedInstance_onceToken_26, block);
  if (*((_BYTE *)v8 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("SBMainSwitcherSwitcherSharedInstanceCreatedNotification"), a1);

  }
  v5 = (id)__sharedInstance_2;
  _Block_object_dispose(&v7, 8);
  return (SBMainSwitcherControllerCoordinator *)v5;
}

- (id)_recentAppLayoutsController
{
  return -[SBAppSwitcherModel _recentAppLayoutsController](self->_mainSwitcherModel, "_recentAppLayoutsController");
}

- (id)switcherContentController:(id)a3 visibleDisplayItemsForBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SBAppSwitcherModel recentDisplayItemsForBundleIdentifier:includingHiddenAppLayouts:](self->_mainSwitcherModel, "recentDisplayItemsForBundleIdentifier:includingHiddenAppLayouts:", a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMapTable count](self->_switcherControllersByWindowScene, "count") == 1)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[SBMainSwitcherControllerCoordinator appLayoutsForSwitcherContentController:](self, "appLayoutsForSwitcherContentController:", v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "allItems");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObjectsFromArray:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    v8 = (id)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "intersectSet:", v9);

  }
  return v8;
}

- (id)animationControllerForTransitionRequest:(id)a3 ancillaryTransitionRequests:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SBUISwitcherAnimationController *v21;
  id v22;
  id v23;
  SBUISwitcherAnimationController *v24;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  SBMainSwitcherControllerCoordinator *v34;
  id v35;
  id v36;
  id location;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v5 = a4;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "displayIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowSceneForDisplayIdentity:", v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "switcherController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "contentViewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "animationControllerForTransitionRequest:", v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = v8;
  if (v27)
    objc_msgSend(v8, "addObject:");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v39;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v13);
        objc_msgSend((id)SBApp, "windowSceneManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "displayIdentity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "windowSceneForDisplayIdentity:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "switcherController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "contentViewController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "animationControllerForTransitionRequest:", v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v9, "addObject:", v20);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v11);
  }

  objc_initWeak(&location, self);
  v21 = [SBUISwitcherAnimationController alloc];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __107__SBMainSwitcherControllerCoordinator_animationControllerForTransitionRequest_ancillaryTransitionRequests___block_invoke;
  v32[3] = &unk_1E8EB1180;
  objc_copyWeak(&v36, &location);
  v22 = v29;
  v33 = v22;
  v34 = self;
  v23 = v30;
  v35 = v23;
  v24 = -[SBUISwitcherAnimationController initWithWorkspaceTransitionRequest:contentViewController:childAnimationControllers:animationBlock:](v21, "initWithWorkspaceTransitionRequest:contentViewController:childAnimationControllers:animationBlock:", v31, v22, v9, v32);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

  return v24;
}

void __107__SBMainSwitcherControllerCoordinator_animationControllerForTransitionRequest_ancillaryTransitionRequests___block_invoke(id *a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v3, "layoutState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appLayout");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v5, "addObject:", v7);
    v24 = (void *)v7;
    v25 = v6;
    objc_msgSend(v6, "floatingAppLayout");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v5, "addObject:", v8);
    v23 = (void *)v8;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v33;
      v26 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (objc_msgSend(a1[4], "shouldAddAppLayoutToFront:forTransitionWithContext:transitionCompleted:", v14, v3, 0, v23)&& (objc_msgSend(a1[5], "_isPerformingModelTransitionForReplacementAppLayout:", v14) & 1) == 0)
          {
            if (objc_msgSend(a1[6], "isChamoisWindowingUIEnabled")
              && objc_msgSend(v14, "environment") == 1)
            {
              v15 = (void *)WeakRetained[6];
              v31[0] = MEMORY[0x1E0C809B0];
              v31[1] = 3221225472;
              v31[2] = __107__SBMainSwitcherControllerCoordinator_animationControllerForTransitionRequest_ancillaryTransitionRequests___block_invoke_2;
              v31[3] = &unk_1E8E9DF78;
              v31[4] = v14;
              objc_msgSend(v15, "bs_firstObjectPassingTest:", v31);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v16 = 0;
            }
            if (objc_msgSend(WeakRetained, "shouldPerformPreTransitionInsertionOfAppLayout:forTransitionWithContext:", v14, v3))
            {
              v17 = a1[4];
              v27[0] = MEMORY[0x1E0C809B0];
              v27[1] = 3221225472;
              v27[2] = __107__SBMainSwitcherControllerCoordinator_animationControllerForTransitionRequest_ancillaryTransitionRequests___block_invoke_3;
              v27[3] = &unk_1E8E9E270;
              v18 = v3;
              v19 = v9;
              v20 = WeakRetained;
              v28 = v20;
              v29 = v14;
              v30 = v16;
              v21 = v20;
              v9 = v19;
              v3 = v18;
              v22 = v17;
              v12 = v26;
              objc_msgSend(v21, "_insertAppLayout:atIndex:contentViewController:modelMutationBlock:completion:", v14, 0, v22, v27, 0);

            }
            else
            {
              objc_msgSend(WeakRetained, "_addAppLayoutToFront:removeAppLayout:", v14, v16);
            }

          }
          else
          {
            objc_msgSend(WeakRetained, "_rebuildAppListCache");
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v11);
    }

  }
}

- (id)switcherContentController:(id)a3 deviceApplicationSceneHandleForDisplayItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_deviceApplicationSceneHandleForDisplayItem:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)shouldPerformPreTransitionInsertionOfAppLayout:(id)a3 forTransitionWithContext:(id)a4
{
  void *v4;
  id v6;
  void *v7;
  unint64_t v8;
  int64_t v9;
  BOOL v12;

  v6 = a4;
  objc_msgSend(v6, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "source");
  v9 = -[SBAppSwitcherSettings effectiveSwitcherStyle](self->_settings, "effectiveSwitcherStyle");
  if (v8 == 10 && v9 == 1)
  {
    v12 = 0;
  }
  else
  {
    if (v8 > 0x33 || ((1 << v8) & 0xC002008000800) == 0)
    {
      objc_msgSend(v6, "layoutState");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v4, "unlockedEnvironmentMode") == 2;
    }
    else
    {
      v12 = 0;
    }
    if (v8 > 0x33 || ((1 << v8) & 0xC002008000800) == 0)

  }
  return v12;
}

- (BOOL)_isPerformingModelTransitionForReplacementAppLayout:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SBSwitcherModelRemovalResults appLayouts](self->_activeTransitionModelRemovalResults, "appLayouts", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        -[SBSwitcherModelRemovalResults replacementAppLayoutForAppLayout:](self->_activeTransitionModelRemovalResults, "replacementAppLayoutForAppLayout:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)isAnySwitcherVisible
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__SBMainSwitcherControllerCoordinator_isAnySwitcherVisible__block_invoke;
  v4[3] = &unk_1E8EB1110;
  v4[4] = &v5;
  -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_buildAppLayoutCache
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  NSArray *v32;
  void *v33;
  SBAppSwitcherServiceSet *v34;
  SBAppSwitcherServiceSet *switcherServices;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  unint64_t testItemInsertionIndex;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  NSArray *appLayouts;
  NSArray *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  unint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  id obj;
  void *v69;
  NSArray *v71;
  _QWORD v72[5];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[5];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD v82[4];
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[4];
  id v89;
  id v90;
  id v91;
  SBMainSwitcherControllerCoordinator *v92;
  id v93;
  uint64_t *v94;
  _QWORD v95[4];
  id v96;
  id v97;
  id v98;
  id v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  char v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  -[SBAppSwitcherModel appLayoutsIncludingHiddenAppLayouts:](self->_mainSwitcherModel, "appLayoutsIncludingHiddenAppLayouts:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (NSArray *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = 0;
  v102 = &v101;
  v103 = 0x2020000000;
  v104 = 0;
  v95[0] = MEMORY[0x1E0C809B0];
  v95[1] = 3221225472;
  v95[2] = __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke;
  v95[3] = &unk_1E8EB1550;
  v62 = v4;
  v96 = v62;
  v8 = v6;
  v97 = v8;
  v59 = v5;
  v98 = v59;
  v9 = v7;
  v99 = v9;
  v100 = &v101;
  -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", v95);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_2;
  v88[3] = &unk_1E8EB1578;
  v56 = v8;
  v89 = v56;
  v94 = &v101;
  v11 = v10;
  v90 = v11;
  v57 = v9;
  v91 = v57;
  v92 = self;
  v67 = v3;
  v93 = v67;
  -[NSArray enumerateObjectsUsingBlock:](v71, "enumerateObjectsUsingBlock:", v88);
  -[NSArray removeObjectsAtIndexes:](v71, "removeObjectsAtIndexes:", v11);
  v58 = v11;
  -[SBMainSwitcherControllerCoordinator activeGestureTransaction](self, "activeGestureTransaction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutTransaction");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_opt_class();
  objc_msgSend(v60, "transitionRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v13, v14);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v61, "isCrossingDisplays"))
  {
    objc_msgSend(v61, "applicationContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layoutState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appLayout");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSArray firstObject](v71, "firstObject");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v62, "containsObject:", v69))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v62, "count"));
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v18 = v62;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v84, v107, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v85;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v85 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
          if ((objc_msgSend(v22, "isEqual:", v69) & 1) != 0
            || !objc_msgSend(v22, "containsAnyItemFromAppLayout:", v69))
          {
            objc_msgSend(v17, "addObject:", v22);
          }
          else
          {
            v82[0] = MEMORY[0x1E0C809B0];
            v82[1] = 3221225472;
            v82[2] = __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_4;
            v82[3] = &unk_1E8E9DF50;
            v83 = v69;
            objc_msgSend(v22, "appLayoutWithItemsPassingTest:", v82);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
              objc_msgSend(v17, "addObject:", v23);

          }
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v84, v107, 16);
      }
      while (v19);
    }

    v24 = v17;
  }
  else
  {
    v24 = v62;
  }
  objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v59, v24);
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v106, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v79;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v79 != v26)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
        v29 = objc_msgSend(v28, "containsAnyItemFromSet:", self->_liveDisplayItemsBeingTerminated);
        if (((-[NSArray containsObject:](v71, "containsObject:", v28) | v29) & 1) == 0
          && !*((_BYTE *)v102 + 24)
          && (objc_msgSend(v67, "containsObject:", v28) & 1) == 0)
        {
          if (objc_msgSend(v28, "environment") == 1)
          {
            v77[0] = MEMORY[0x1E0C809B0];
            v77[1] = 3221225472;
            v77[2] = __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_5;
            v77[3] = &unk_1E8EA43E8;
            v77[4] = v28;
            -[NSArray bs_compactMap:](v71, "bs_compactMap:", v77);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "mutableCopy");

            v32 = (NSArray *)v31;
          }
          else
          {
            v32 = v71;
          }
          v71 = v32;
          -[NSArray insertObject:atIndex:](v32, "insertObject:atIndex:", v28, 0);
        }
      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v106, 16);
    }
    while (v25);
  }

  +[SBAppSwitcherServiceManager sharedInstance](SBAppSwitcherServiceManager, "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "registeredServicesSnapshot");
  v34 = (SBAppSwitcherServiceSet *)objc_claimAutoreleasedReturnValue();
  switcherServices = self->_switcherServices;
  self->_switcherServices = v34;

  v63 = -[SBAppSwitcherServiceSet count](self->_switcherServices, "count");
  if (v63)
  {
    v36 = 0;
    do
    {
      v64 = v36;
      -[SBAppSwitcherServiceSet serviceAtIndex:](self->_switcherServices, "serviceAtIndex:");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "bundleIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBDisplayItem switcherServiceDisplayItemWithServiceIdentifier:](SBDisplayItem, "switcherServiceDisplayItemWithServiceIdentifier:", v38);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBMainSwitcherControllerCoordinator _appLayoutFromPrimaryLayoutItem:sideLayoutElement:configuration:](self, "_appLayoutFromPrimaryLayoutItem:sideLayoutElement:configuration:", v65, 0, 1);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v40 = self->_servicesRemovedWhileAwayFromSwitcher;
      v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v73, v105, 16);
      if (v41)
      {
        v42 = *(_QWORD *)v74;
        do
        {
          for (k = 0; k != v41; ++k)
          {
            if (*(_QWORD *)v74 != v42)
              objc_enumerationMutation(v40);
            v44 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * k);
            objc_msgSend(v44, "bundleIdentifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "bundleIdentifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v45, "isEqualToString:", v46);

            if (v47)
              objc_msgSend(v39, "addObject:", v44);
          }
          v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v73, v105, 16);
        }
        while (v41);
      }

      -[NSMutableArray removeObjectsInArray:](self->_servicesRemovedWhileAwayFromSwitcher, "removeObjectsInArray:", v39);
      if (v66 && !-[NSArray containsObject:](v71, "containsObject:", v66))
        -[NSArray insertObject:atIndex:](v71, "insertObject:atIndex:", v66, 0);

      v36 = v64 + 1;
    }
    while (v64 + 1 != v63);
  }
  if (self->_testItemForInsertion)
  {
    testItemInsertionIndex = self->_testItemInsertionIndex;
    if (testItemInsertionIndex <= -[NSArray count](v71, "count"))
    {
      -[NSArray removeObject:](v71, "removeObject:", self->_testItemForInsertion);
      -[NSArray insertObject:atIndex:](v71, "insertObject:atIndex:", self->_testItemForInsertion, self->_testItemInsertionIndex);
    }
  }
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_7;
  v72[3] = &unk_1E8EA4510;
  v72[4] = self;
  v49 = -[NSArray indexOfObjectPassingTest:](v71, "indexOfObjectPassingTest:", v72);
  if (v49 == 0x7FFFFFFFFFFFFFFFLL)
    v49 = -[NSArray count](v71, "count");
  -[NSMutableDictionary allKeys](self->_appLayoutToEligibleTransientOverlayViewController, "allKeys");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v49, objc_msgSend(v50, "count"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray insertObjects:atIndexes:](v71, "insertObjects:atIndexes:", v50, v51);

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v49, objc_msgSend(v67, "count"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray insertObjects:atIndexes:](v71, "insertObjects:atIndexes:", v67, v52);

  appLayouts = self->_appLayouts;
  self->_appLayouts = v71;
  v54 = v71;

  _Block_object_dispose(&v101, 8);
}

- (void)enumerateSwitcherControllersWithBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unsigned __int8 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _BYTE *))a3;
  v16 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_switcherControllersByWindowScene;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      -[NSMapTable objectForKey:](self->_switcherControllersByWindowScene, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v10, &v16);
      v11 = v16;

      if (v11)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

void __84__SBMainSwitcherControllerCoordinator__notifySwitcherControllersAppLayoutsDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "contentViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteAppLayoutsDidChange");

}

- (id)activeGestureTransaction
{
  return self->_activeGestureTransaction;
}

uint64_t __59__SBMainSwitcherControllerCoordinator_isAnySwitcherVisible__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isAnySwitcherVisible");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "_currentMainAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v4 = *(void **)(a1 + 40);
    objc_msgSend(v3, "allItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

  }
  objc_msgSend(v10, "_currentFloatingAppLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
    v7 = *(void **)(a1 + 56);
    objc_msgSend(v6, "allItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v8);

  }
  if (objc_msgSend(v10, "isMainSwitcherVisible"))
  {
    objc_msgSend(v10, "gestureManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) |= objc_msgSend(v9, "isDragAndDropTransactionRunning");

  }
}

- (id)recentAppLayouts
{
  return -[SBAppSwitcherModel appLayoutsIncludingHiddenAppLayouts:](self->_mainSwitcherModel, "appLayoutsIncludingHiddenAppLayouts:", 0);
}

void __92__SBMainSwitcherControllerCoordinator_keyboardFocusController_externalSceneDidAcquireFocus___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "contentViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteKeyboardFocusDidChangeToSceneID:", v3);

}

void __63__SBMainSwitcherControllerCoordinator__updateBestAppSuggestion__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "contentViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBestAppSuggestion:", *(_QWORD *)(a1 + 32));

}

void __120__SBMainSwitcherControllerCoordinator__setContainerStatusBarHidden_animationDuration_usingAssertion_reason_windowScene___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(_BYTE *)(a1 + 32) == 0;
  v4 = a2;
  objc_msgSend(v2, "numberWithInt:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v5);

}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  char v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  uint64_t v32;
  _BOOL4 IsValid;
  BOOL v34;
  _BOOL4 v35;
  char v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  void *v44;
  SBSwitcherModelRemovalRequest *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSArray *appLayouts;
  void *v61;
  void *v62;
  BOOL v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t m;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t n;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  char v85;
  SBMainSwitcherControllerCoordinator *v86;
  void *v87;
  objc_class *v88;
  void *v89;
  BSSimpleAssertion *v90;
  BSSimpleAssertion *preventSupplementalSnapshotsAssertion;
  BSAbsoluteMachTimer *v92;
  BSAbsoluteMachTimer *preventSupplementalSnapshotsInvalidationTimer;
  BSAbsoluteMachTimer *v94;
  double v95;
  double v96;
  id v97;
  UIApplicationSceneDeactivationAssertion *deactivatingScenesResignActiveAssertion;
  void *v99;
  void *v100;
  char v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t ii;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  char v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  id obj;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _QWORD v134[4];
  id v135;
  id location;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _QWORD v145[5];
  id v146;
  id v147;
  _QWORD v148[5];
  id v149;
  id v150;
  _QWORD v151[4];
  id v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  uint64_t v171;

  v171 = *MEMORY[0x1E0C80C00];
  v116 = a3;
  v5 = a4;
  v6 = objc_msgSend(v5, "isInterrupted");
  v119 = v5;
  objc_msgSend(v5, "toLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "fromLayoutState");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "windowScene");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainSwitcherControllerCoordinator switcherControllerForWindowScene:](self, "switcherControllerForWindowScene:", v118);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v122 = v120;

    objc_msgSend(v118, "layoutStateProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLayoutState:", v122);

    objc_msgSend(v118, "layoutStateProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPreviousLayoutState:", v122);

  }
  else
  {
    v122 = v7;
  }
  objc_msgSend(v119, "applicationTransitionContext");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "request");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = objc_msgSend(v115, "source");
  objc_msgSend(v121, "previousLayoutState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appLayout");
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v121, "previousLayoutState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatingAppLayout");
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v121, "layoutState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appLayout");
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v121, "layoutState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatingAppLayout");
  v127 = (void *)objc_claimAutoreleasedReturnValue();

  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  objc_msgSend(v114, "allItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v161, v170, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v162;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v162 != v17)
          objc_enumerationMutation(v15);
        v19 = *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * i);
        if ((objc_msgSend(v128, "containsItem:", v19) & 1) == 0
          && -[NSMutableSet containsObject:](self->_liveDisplayItemsBeingTerminated, "containsObject:", v19))
        {
          -[NSMutableSet removeObject:](self->_liveDisplayItemsBeingTerminated, "removeObject:", v19);
        }
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v161, v170, 16);
    }
    while (v16);
  }

  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  objc_msgSend(v113, "allItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v157, v169, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v158;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v158 != v22)
          objc_enumerationMutation(v20);
        v24 = *(_QWORD *)(*((_QWORD *)&v157 + 1) + 8 * j);
        if ((objc_msgSend(v127, "containsItem:", v24) & 1) == 0
          && -[NSMutableSet containsObject:](self->_liveDisplayItemsBeingTerminated, "containsObject:", v24))
        {
          -[NSMutableSet removeObject:](self->_liveDisplayItemsBeingTerminated, "removeObject:", v24);
        }
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v157, v169, 16);
    }
    while (v21);
  }

  if ((v6 & 1) == 0)
  {
    v25 = objc_msgSend(v120, "unlockedEnvironmentMode");
    v26 = objc_msgSend(v120, "isFloatingSwitcherVisible");
    v27 = objc_msgSend(v122, "unlockedEnvironmentMode");
    v28 = objc_msgSend(v122, "isFloatingSwitcherVisible");
    objc_msgSend(v120, "bundleIDShowingAppExpose");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = 0;
    }
    else
    {
      objc_msgSend(v122, "bundleIDShowingAppExpose");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v31 != 0;

    }
    objc_msgSend(v121, "request");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v120, "peekConfiguration");
    IsValid = SBPeekConfigurationIsValid(objc_msgSend(v122, "peekConfiguration"));
    v34 = IsValid;
    v35 = IsValid && !SBPeekConfigurationIsValid(v32);
    if (v27 == 2)
      v36 = 1;
    else
      v36 = v28;
    if ((v36 & 1) != 0)
    {
      if (v27 == 2)
      {
        v37 = (void *)-[NSMutableArray copy](self->_servicesRemovedWhileAwayFromSwitcher, "copy");
        -[NSMutableArray removeAllObjects](self->_servicesRemovedWhileAwayFromSwitcher, "removeAllObjects");
        v155 = 0u;
        v156 = 0u;
        v153 = 0u;
        v154 = 0u;
        v38 = v37;
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v153, v168, 16);
        if (v39)
        {
          v40 = *(_QWORD *)v154;
          do
          {
            for (k = 0; k != v39; ++k)
            {
              if (*(_QWORD *)v154 != v40)
                objc_enumerationMutation(v38);
              objc_msgSend(*(id *)(*((_QWORD *)&v153 + 1) + 8 * k), "bundleIdentifier");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              +[SBDisplayItem switcherServiceDisplayItemWithServiceIdentifier:](SBDisplayItem, "switcherServiceDisplayItemWithServiceIdentifier:", v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              -[SBMainSwitcherControllerCoordinator _appLayoutFromPrimaryLayoutItem:sideLayoutElement:configuration:](self, "_appLayoutFromPrimaryLayoutItem:sideLayoutElement:configuration:", v43, 0, 1);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_alloc_init(SBSwitcherModelRemovalRequest);
              +[SBSwitcherModelRemovalRequestAction defaultRemovalPolicyAction](SBSwitcherModelRemovalRequestAction, "defaultRemovalPolicyAction");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              -[SBSwitcherModelRemovalRequest setAction:forAppLayout:](v45, "setAction:forAppLayout:", v46, v44);

              -[SBMainSwitcherControllerCoordinator _switcherModelRemovalResultsForRequest:forReason:](self, "_switcherModelRemovalResultsForRequest:forReason:", v45, 0);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              -[SBMainSwitcherControllerCoordinator _performSceneDestructionForModelRemovalResults:](self, "_performSceneDestructionForModelRemovalResults:", v47);

            }
            v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v153, v168, 16);
          }
          while (v39);
        }

        pid_hibernate();
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "postNotificationName:object:", CFSTR("SBUIAppSwitcherRevealedNotification"), 0);

        goto LABEL_61;
      }
    }
    else
    {
      if ((!v30 || v112 != 33 && v112 != 51) && !v34)
      {
        -[SBMainSwitcherControllerCoordinator _releaseKeyboardFocus](self, "_releaseKeyboardFocus");
        -[SBMainSwitcherControllerCoordinator _focusNewlyAddedApplicationIfNeededTransitioningFromLayoutState:toLayoutState:windowScene:](self, "_focusNewlyAddedApplicationIfNeededTransitioningFromLayoutState:toLayoutState:windowScene:", v120, v122, v118);
      }
      if (v35)
      {
        objc_msgSend(v118, "homeScreenController");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v49;
        if (v49)
        {
          v51 = v49;
        }
        else
        {
          +[SBUIController sharedInstance](SBUIController, "sharedInstance");
          v51 = (id)objc_claimAutoreleasedReturnValue();
        }
        v52 = v51;
        objc_msgSend(v51, "window");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "makeKeyWindow");

      }
      if (v25 == 2)
        v54 = 1;
      else
        v54 = v26;
      if (v54 == 1)
      {
        -[SBAppSwitcherModel _recentAppLayoutsController](self->_mainSwitcherModel, "_recentAppLayoutsController");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "_persistSoon");

      }
      -[SBMainSwitcherControllerCoordinator switcherControllerForWindowScene:](self, "switcherControllerForWindowScene:", v118);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "_updateContentViewInterfaceOrientation:", objc_msgSend(v122, "interfaceOrientation"));

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "postNotificationName:object:", CFSTR("SBUIAppSwitcherObscuredNotification"), 0);
LABEL_61:

    if (objc_msgSend(v122, "unlockedEnvironmentMode") == 3)
    {
      objc_msgSend(v122, "appLayout");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "switcherController");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "contentViewController");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v57)
      {
        if (objc_msgSend(v59, "shouldAddAppLayoutToFront:forTransitionWithContext:transitionCompleted:", v57, v121, 1))
        {
          if (objc_msgSend(v57, "environment") == 1)
          {
            appLayouts = self->_appLayouts;
            v151[0] = MEMORY[0x1E0C809B0];
            v151[1] = 3221225472;
            v151[2] = __110__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke;
            v151[3] = &unk_1E8E9DF78;
            v152 = v57;
            -[NSArray bs_firstObjectPassingTest:](appLayouts, "bs_firstObjectPassingTest:", v151);
            v61 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v61 = 0;
          }
          -[SBMainSwitcherControllerCoordinator _addAppLayoutToFront:removeAppLayout:](self, "_addAppLayoutToFront:removeAppLayout:", v57, v61);

        }
        objc_msgSend(v122, "elements");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "count") == 0;

        if (!v63)
        {
          -[SBMainSwitcherControllerCoordinator _rebuildAppListCache](self, "_rebuildAppListCache");
          if (!-[NSArray containsObject:](self->_appLayouts, "containsObject:", v57))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainSwitcherControllerCoordinator.m"), 999, CFSTR("The appLayouts array MUST contain the app layout we're transitioning to."));

          }
        }
      }
      objc_msgSend(v122, "floatingAppLayout");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (v64
        && (objc_msgSend(v122, "isFloatingSwitcherVisible") & 1) == 0
        && objc_msgSend(v59, "shouldAddAppLayoutToFront:forTransitionWithContext:transitionCompleted:", v64, v121, 1))
      {
        -[SBMainSwitcherControllerCoordinator _addAppLayoutToFront:](self, "_addAppLayoutToFront:", v64);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v122, "unlockedEnvironmentMode") == 3 || objc_msgSend(v122, "unlockedEnvironmentMode") == 2)
    {
      objc_msgSend(v122, "appLayout");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = MEMORY[0x1E0C809B0];
      v148[0] = MEMORY[0x1E0C809B0];
      v148[1] = 3221225472;
      v148[2] = __110__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_2;
      v148[3] = &unk_1E8EA4E00;
      v148[4] = self;
      v68 = v117;
      v149 = v68;
      v69 = v65;
      v150 = v69;
      objc_msgSend(v66, "enumerate:", v148);

      objc_msgSend(v122, "floatingAppLayout");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v145[0] = v67;
      v145[1] = 3221225472;
      v145[2] = __110__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_3;
      v145[3] = &unk_1E8EA4E00;
      v145[4] = self;
      v146 = v68;
      v147 = v69;
      objc_msgSend(v70, "enumerate:", v145);

    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    obj = v65;
    v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v167, 16);
    if (v73)
    {
      v125 = *(_QWORD *)v142;
      do
      {
        for (m = 0; m != v73; ++m)
        {
          if (*(_QWORD *)v142 != v125)
            objc_enumerationMutation(obj);
          v75 = *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * m);
          v137 = 0u;
          v138 = 0u;
          v139 = 0u;
          v140 = 0u;
          objc_msgSend(v126, "applicationContext");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "entities");
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v137, v166, 16);
          if (v78)
          {
            v79 = *(_QWORD *)v138;
            do
            {
              for (n = 0; n != v78; ++n)
              {
                if (*(_QWORD *)v138 != v79)
                  objc_enumerationMutation(v77);
                v81 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * n);
                if (objc_msgSend(v81, "isAnalogousToEntity:", v75))
                {
                  objc_msgSend(v71, "addObject:", v75);
                  objc_msgSend(v72, "addObject:", v81);
                }
              }
              v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v137, v166, 16);
            }
            while (v78);
          }

        }
        v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v167, 16);
      }
      while (v73);
    }

    objc_msgSend(obj, "minusSet:", v71);
    objc_msgSend(obj, "unionSet:", v72);
    -[SBSwitcherCaptureApplicationActivationWatchdog foregroundWorkspaceEntitiesUpdatedTo:](self->_captureApplicationWatchdog, "foregroundWorkspaceEntitiesUpdatedTo:", obj);

  }
  -[SBMainSwitcherControllerCoordinator _evaluateAsynchronousRenderingEnablement](self, "_evaluateAsynchronousRenderingEnablement");
  objc_msgSend(v119, "error");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (v82)
  {

  }
  else
  {
    objc_msgSend(v120, "elements");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "elements");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v83, "isEqualToSet:", v84);

    if ((v85 & 1) == 0)
    {
      v86 = self;
      if (!self->_preventSupplementalSnapshotsAssertion)
      {
        objc_msgSend(v118, "sceneManager");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = (objc_class *)objc_opt_class();
        NSStringFromClass(v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "preventTakingSupplementalSnapshotsForBackgroundingScenesWithReason:", v89);
        v90 = (BSSimpleAssertion *)objc_claimAutoreleasedReturnValue();
        preventSupplementalSnapshotsAssertion = self->_preventSupplementalSnapshotsAssertion;
        self->_preventSupplementalSnapshotsAssertion = v90;

        v86 = self;
      }
      objc_initWeak(&location, v86);
      -[BSAbsoluteMachTimer invalidate](self->_preventSupplementalSnapshotsInvalidationTimer, "invalidate");
      v92 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBMainSwitcherCoordinator.preventSupplementalSnapshotsInvalidationTimer"));
      preventSupplementalSnapshotsInvalidationTimer = self->_preventSupplementalSnapshotsInvalidationTimer;
      self->_preventSupplementalSnapshotsInvalidationTimer = v92;

      v94 = self->_preventSupplementalSnapshotsInvalidationTimer;
      -[SBAppSwitcherSettings preventMedusaSnapshotsAfterTransitionDuration](self->_settings, "preventMedusaSnapshotsAfterTransitionDuration");
      v96 = v95;
      v97 = MEMORY[0x1E0C80D38];
      v134[0] = MEMORY[0x1E0C809B0];
      v134[1] = 3221225472;
      v134[2] = __110__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_4;
      v134[3] = &unk_1E8E9EEC8;
      objc_copyWeak(&v135, &location);
      -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v94, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v134, v96, 0.0);

      objc_destroyWeak(&v135);
      objc_destroyWeak(&location);
    }
  }
  -[UIApplicationSceneDeactivationAssertion relinquish](self->_deactivatingScenesResignActiveAssertion, "relinquish");
  deactivatingScenesResignActiveAssertion = self->_deactivatingScenesResignActiveAssertion;
  self->_deactivatingScenesResignActiveAssertion = 0;

  if (objc_msgSend(v122, "unlockedEnvironmentMode") == 1
    && objc_msgSend(v120, "unlockedEnvironmentMode") == 3
    && v112 != 71)
  {
    objc_msgSend(v120, "appLayout");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (v99)
    {
      -[SBSwitcherModelRemovalResults appLayouts](self->_activeTransitionModelRemovalResults, "appLayouts");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = objc_msgSend(v100, "containsObject:", v99);

      if ((v101 & 1) == 0 && !SBPeekConfigurationIsValid(objc_msgSend(v122, "peekConfiguration")))
      {
        objc_msgSend(v99, "allItems");
        v132 = 0u;
        v133 = 0u;
        v130 = 0u;
        v131 = 0u;
        v102 = (id)objc_claimAutoreleasedReturnValue();
        v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v130, v165, 16);
        if (v103)
        {
          v104 = *(_QWORD *)v131;
          while (2)
          {
            for (ii = 0; ii != v103; ++ii)
            {
              if (*(_QWORD *)v131 != v104)
                objc_enumerationMutation(v102);
              -[SBAppSwitcherModel appLayoutContainingDisplayItem:includingHiddenAppLayouts:](self->_mainSwitcherModel, "appLayoutContainingDisplayItem:includingHiddenAppLayouts:", *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * ii), 0);
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              v107 = objc_msgSend(v106, "preferredDisplayOrdinal");
              LODWORD(v107) = v107 == objc_msgSend(v99, "preferredDisplayOrdinal");

              if (!(_DWORD)v107)
              {

                goto LABEL_118;
              }
            }
            v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v130, v165, 16);
            if (v103)
              continue;
            break;
          }
        }

        -[SBMainSwitcherControllerCoordinator _addAppLayoutToFront:](self, "_addAppLayoutToFront:", v99);
      }
    }
LABEL_118:
    objc_msgSend(v120, "floatingAppLayout");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (v108)
    {
      -[SBSwitcherModelRemovalResults appLayouts](self->_activeTransitionModelRemovalResults, "appLayouts");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = objc_msgSend(v109, "containsObject:", v108);

      if ((v110 & 1) == 0)
        -[SBMainSwitcherControllerCoordinator _addAppLayoutToFront:](self, "_addAppLayoutToFront:", v108);
    }

  }
  if (objc_msgSend(v117, "windowManagementStyle"))
    -[SBMainSwitcherControllerCoordinator _rebuildAppListCache](self, "_rebuildAppListCache");
  -[SBMainSwitcherControllerCoordinator _updateHomeScreenDisplayLayoutElementForLayoutState:switcherController:](self, "_updateHomeScreenDisplayLayoutElementForLayoutState:switcherController:", v122, v117);
  -[SBMainSwitcherControllerCoordinator _endDisplayLayoutTransitionForSwitcherController:](self, "_endDisplayLayoutTransitionForSwitcherController:", v117);

}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  SBSwitcherDisplayItemRemovalResolutionRequest *v21;
  void *v22;
  SBSwitcherModelRemovalResults *v23;
  SBSwitcherModelRemovalResults *activeTransitionModelRemovalResults;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  SBTransitionSwitcherModifierRemovalContext *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  BOOL v60;
  void *v61;
  _BOOL4 v62;
  void *v63;
  BOOL v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  char v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t m;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t n;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  UIApplicationSceneDeactivationAssertion *v85;
  UIApplicationSceneDeactivationAssertion *deactivatingScenesResignActiveAssertion;
  UIApplicationSceneDeactivationAssertion *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  char v94;
  uint64_t v95;
  _BOOL4 v96;
  BOOL v97;
  _BOOL4 v98;
  _BOOL4 v99;
  int v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  uint64_t v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  id obj;
  void *v117;
  SBSwitcherDisplayItemRemovalResolutionRequest *v118;
  id v119;
  _QWORD v121[5];
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  char v125;
  _QWORD v126[4];
  id v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  uint64_t v158;

  v158 = *MEMORY[0x1E0C80C00];
  v105 = a3;
  v107 = a4;
  objc_msgSend(v107, "toLayoutState");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "fromLayoutState");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "windowScene");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainSwitcherControllerCoordinator switcherControllerForWindowScene:](self, "switcherControllerForWindowScene:", v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v112, "isMeaningfullyDifferentFromLayoutState:", v111))
    -[NSMapTable setObject:forKey:](self->_lastMeaningfullyDifferentLayoutStatesByWindowScene, "setObject:forKey:", v111, v109);
  objc_msgSend(v107, "applicationTransitionContext");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "request");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "appLayout");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "appLayout");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = objc_msgSend(v108, "source");
  v101 = objc_msgSend(v112, "unlockedEnvironmentMode");
  objc_msgSend(v112, "elements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    v6 = v101 == 2;
  else
    v6 = 1;
  v99 = v6;

  v100 = objc_msgSend(v112, "isFloatingSwitcherVisible");
  v7 = objc_msgSend(v111, "unlockedEnvironmentMode") != 2;
  objc_msgSend(v111, "elements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
    v9 = v7;
  else
    v9 = 0;
  v96 = v9;

  objc_msgSend(v111, "elements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
    v11 = 0;
  else
    v11 = v7;
  v97 = v11;

  v95 = objc_msgSend(v108, "source");
  objc_msgSend(v111, "bundleIDShowingAppExpose");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v98 = 0;
  }
  else
  {
    objc_msgSend(v112, "bundleIDShowingAppExpose");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v13 != 0;

  }
  SBMainWorkspaceMapInternalTransitionSourceToExternalTransitionSource(objc_msgSend(v108, "source"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainSwitcherControllerCoordinator _beginDisplayLayoutTransitionForSwitcherController:reason:](self, "_beginDisplayLayoutTransitionForSwitcherController:reason:", v110, v104);
  if (v106 == 70)
  {
    -[SBAppSwitcherModel takeAppLayoutsSnapshot](self->_mainSwitcherModel, "takeAppLayoutsSnapshot");
    -[SBMainSwitcherControllerCoordinator _takeLayoutStateSnapshotForWindowScene:withPreviousLayoutState:](self, "_takeLayoutStateSnapshotForWindowScene:withPreviousLayoutState:", v109, v111);
  }
  else if (!self->_outstandingAccidentalActivationMitigationTransitionCount)
  {
    -[SBAppSwitcherModel clearAppLayoutsSnapshot](self->_mainSwitcherModel, "clearAppLayoutsSnapshot");
    -[SBMainSwitcherControllerCoordinator _clearLayoutStateSnapshotForWindowScene:](self, "_clearLayoutStateSnapshotForWindowScene:", v109);
  }
  v150 = 0u;
  v151 = 0u;
  v148 = 0u;
  v149 = 0u;
  objc_msgSend(v117, "entitiesWithRemovalContexts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v148, v157, 16);
  if (v14)
  {
    v118 = 0;
    v119 = 0;
    v15 = *(_QWORD *)v149;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v149 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * i);
        objc_msgSend(v117, "removalContextForEntity:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "displayItemRepresentation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[SBMainSwitcherControllerCoordinator _switcherDisplayItemRemovalIntentTypeForEntity:removalContext:](self, "_switcherDisplayItemRemovalIntentTypeForEntity:removalContext:", v17, v18);
        if (v20)
        {
          v21 = v118;
          if (!v118)
            v21 = objc_alloc_init(SBSwitcherDisplayItemRemovalResolutionRequest);
          v118 = v21;
          -[SBSwitcherDisplayItemRemovalResolutionRequest setRemovalIntentType:forDisplayItem:](v21, "setRemovalIntentType:forDisplayItem:", v20, v19);
          v22 = v119;
          if (!v119)
          {
            objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v119 = v22;
          objc_msgSend(v22, "setObject:forKey:", v19, v17);
        }

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v148, v157, 16);
    }
    while (v14);

    if (!v118)
    {
      v118 = 0;
      goto LABEL_67;
    }
    -[SBMainSwitcherControllerCoordinator _resultsForDisplayItemRemovalResolutionRequest:preferredAppLayoutForRemovalAnimationIfAny:](self, "_resultsForDisplayItemRemovalResolutionRequest:preferredAppLayoutForRemovalAnimationIfAny:", v118, 0);
    obj = (id)objc_claimAutoreleasedReturnValue();
    -[SBMainSwitcherControllerCoordinator _switcherModelRemovalResultsForDisplayItemRemovalResolutionRequest:](self, "_switcherModelRemovalResultsForDisplayItemRemovalResolutionRequest:", v118);
    v23 = (SBSwitcherModelRemovalResults *)objc_claimAutoreleasedReturnValue();
    activeTransitionModelRemovalResults = self->_activeTransitionModelRemovalResults;
    self->_activeTransitionModelRemovalResults = v23;

    v146 = 0u;
    v147 = 0u;
    v144 = 0u;
    v145 = 0u;
    -[SBSwitcherModelRemovalResults appLayouts](self->_activeTransitionModelRemovalResults, "appLayouts");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v144, v156, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v145;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v145 != v27)
            objc_enumerationMutation(v25);
          -[SBSwitcherModelRemovalResults executeActionForAppLayout:](self->_activeTransitionModelRemovalResults, "executeActionForAppLayout:", *(_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * j));
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v144, v156, 16);
      }
      while (v26);
    }

    v142 = 0u;
    v143 = 0u;
    v140 = 0u;
    v141 = 0u;
    v119 = v119;
    v114 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v140, v155, 16);
    if (v114)
    {
      v29 = 0;
      v113 = *(_QWORD *)v141;
      v30 = v119;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v141 != v113)
          {
            v32 = v31;
            objc_enumerationMutation(v30);
            v30 = v119;
            v31 = v32;
          }
          v115 = v31;
          v33 = *(_QWORD *)(*((_QWORD *)&v140 + 1) + 8 * v31);
          objc_msgSend(v30, "objectForKey:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "removalContextForEntity:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "actionsForDisplayItem:", v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v138 = 0u;
          v139 = 0u;
          v136 = 0u;
          v137 = 0u;
          v37 = v36;
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v136, v154, 16);
          if (v38)
          {
            v39 = *(_QWORD *)v137;
            do
            {
              for (k = 0; k != v38; ++k)
              {
                if (*(_QWORD *)v137 != v39)
                  objc_enumerationMutation(v37);
                objc_msgSend(*(id *)(*((_QWORD *)&v136 + 1) + 8 * k), "appLayout");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                -[SBSwitcherModelRemovalResults appLayouts](self->_activeTransitionModelRemovalResults, "appLayouts");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = objc_msgSend(v42, "containsObject:", v41);

                if (v43)
                {
                  v44 = objc_msgSend(v35, "animationStyle");
                  if ((unint64_t)(v44 - 1) >= 3)
                    v45 = 0;
                  else
                    v45 = v44;
                  v46 = -[SBTransitionSwitcherModifierRemovalContext initWithAnimationStyle:displayItem:]([SBTransitionSwitcherModifierRemovalContext alloc], "initWithAnimationStyle:displayItem:", v45, v34);
                  if (!v29)
                    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                  objc_msgSend(v29, "setObject:forKey:", v46, v41);

                }
              }
              v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v136, v154, 16);
            }
            while (v38);
          }

          v31 = v115 + 1;
          v30 = v119;
        }
        while (v115 + 1 != v114);
        v114 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v140, v155, 16);
        v30 = v119;
      }
      while (v114);
    }
    else
    {
      v29 = 0;
      v30 = v119;
    }

    objc_storeStrong((id *)&self->_activeTransitionModelRemovalAppLayoutToRemovalContext, v29);
  }
  else
  {
    v118 = 0;
    v119 = 0;
  }

LABEL_67:
  if (v101 == 2)
    v47 = 1;
  else
    v47 = v100;
  if (v47 != 1)
  {
    v53 = SBPeekConfigurationIsValid(objc_msgSend(v111, "peekConfiguration"))
       && !SBPeekConfigurationIsValid(objc_msgSend(v112, "peekConfiguration"));
    if (!v99)
    {
      if (v106 != 11 && v106 != 12 && v106 != 27 && v96)
      {
        objc_msgSend(v112, "elements");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "elements");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v54, "isEqual:", v55) & 1 | (v95 == 15)
          || ((v53 | -[SBMainSwitcherControllerCoordinator _isPerformingModelTransitionForReplacementAppLayout:](self, "_isPerformingModelTransitionForReplacementAppLayout:", v103)) & 1) != 0|| v106 == 52|| v106 == 35)
        {

        }
        else
        {
          -[SBSwitcherModelRemovalResults appLayouts](self->_activeTransitionModelRemovalResults, "appLayouts");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = objc_msgSend(v93, "containsObject:", v102);

          if ((v94 & 1) == 0 && v106 != 63 && v106 != 71)
            -[SBMainSwitcherControllerCoordinator _addAppLayoutToFront:](self, "_addAppLayoutToFront:", v102);
        }
      }
      if (objc_msgSend(v103, "type") != 4)
      {
        objc_msgSend(v110, "contentViewController");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "bestAppSuggestion");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (v57)
        {
          +[SBAppSuggestionManager sharedInstance](SBAppSuggestionManager, "sharedInstance");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "noteNotActivatingForAppSuggestion:fromSource:", v57, 1);

        }
      }
    }
    v59 = objc_msgSend(v111, "peekConfiguration");
    v60 = SBPeekConfigurationIsValid(objc_msgSend(v112, "peekConfiguration")) && !SBPeekConfigurationIsValid(v59);
    if (v98 && (v106 == 33 || v106 == 51))
    {
      -[SBMainSwitcherControllerCoordinator _lockKeyboardFocusForSwitcherController:](self, "_lockKeyboardFocusForSwitcherController:", v110);
      if (!v60)
        goto LABEL_108;
    }
    else
    {
      if (!v60)
      {
LABEL_108:
        v65 = 0;
        v62 = 0;
        goto LABEL_109;
      }
      -[SBMainSwitcherControllerCoordinator _lockKeyboardFocusForSwitcherController:](self, "_lockKeyboardFocusForSwitcherController:", v110);
    }
    objc_msgSend(v103, "itemForLayoutRole:", 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v61 != 0;

    objc_msgSend(v103, "itemForLayoutRole:", 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
      v64 = 1;
    else
      v64 = v102 == 0;
    v65 = !v64;

LABEL_109:
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "appSwitcherDefaults");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      if (objc_msgSend(v67, "shouldShowSplitPeekEducation"))
      {
        objc_msgSend(v67, "setShouldShowSplitPeekEducation:", 0);
        objc_msgSend(v110, "setIdleTouchAwarenessClientEnabled:", 0);
        objc_msgSend(v110, "_presentMedusaEducationBanner");
LABEL_119:
        -[SBMainSwitcherControllerCoordinator suspendWallpaperAnimationAssertion](self, "suspendWallpaperAnimationAssertion");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "invalidate");

        -[SBMainSwitcherControllerCoordinator setSuspendWallpaperAnimationAssertion:](self, "setSuspendWallpaperAnimationAssertion:", 0);
        goto LABEL_120;
      }
      if ((v65 & 1) == 0)
      {
LABEL_118:
        objc_msgSend(v110, "setIdleTouchAwarenessClientEnabled:", 1);
        goto LABEL_119;
      }
    }
    else if (!v65)
    {
      if (v53)
        objc_msgSend(v110, "_invalidateMedusaEducationBannerTimer");
      goto LABEL_119;
    }
    if (objc_msgSend(v67, "shouldShowSlideOverPeekEducation"))
    {
      objc_msgSend(v67, "setShouldShowSlideOverPeekEducation:", 0);
      objc_msgSend(v110, "setIdleTouchAwarenessClientEnabled:", 0);
      objc_msgSend(v110, "_presentMedusaEducationBanner");
      goto LABEL_119;
    }
    goto LABEL_118;
  }
  if (v101 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "postNotificationName:object:", CFSTR("SBUIAppSwitcherWillRevealNotification"), 0);

  }
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "deactivateReachability");

  -[SBMainSwitcherControllerCoordinator _lockKeyboardFocusForSwitcherController:](self, "_lockKeyboardFocusForSwitcherController:", v110);
  -[SBMainSwitcherControllerCoordinator suspendWallpaperAnimationAssertion](self, "suspendWallpaperAnimationAssertion");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "invalidate");

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "suspendWallpaperAnimationForReason:", CFSTR("kSBAppSwitcherWallpaperAnimationDisablingReason"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainSwitcherControllerCoordinator setSuspendWallpaperAnimationAssertion:](self, "setSuspendWallpaperAnimationAssertion:", v52);

  -[SBMainSwitcherControllerCoordinator _updateBestAppSuggestion](self, "_updateBestAppSuggestion");
LABEL_120:
  v69 = objc_msgSend(v117, "animationDisabled");
  v70 = MEMORY[0x1E0C809B0];
  if ((v69 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    objc_msgSend(v111, "elements");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v132, v153, 16);
    if (v73)
    {
      v74 = *(_QWORD *)v133;
      do
      {
        for (m = 0; m != v73; ++m)
        {
          if (*(_QWORD *)v133 != v74)
            objc_enumerationMutation(v72);
          objc_msgSend(*(id *)(*((_QWORD *)&v132 + 1) + 8 * m), "uniqueIdentifier");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "addObject:", v76);

        }
        v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v132, v153, 16);
      }
      while (v73);
    }

    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    objc_msgSend(v112, "elements");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v128, v152, 16);
    if (v78)
    {
      v79 = *(_QWORD *)v129;
      do
      {
        for (n = 0; n != v78; ++n)
        {
          if (*(_QWORD *)v129 != v79)
            objc_enumerationMutation(v77);
          objc_msgSend(*(id *)(*((_QWORD *)&v128 + 1) + 8 * n), "uniqueIdentifier");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "removeObject:", v81);

        }
        v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v128, v152, 16);
      }
      while (v78);
    }

    if (objc_msgSend(v71, "count"))
    {
      if (v106 == 11)
        v82 = 0;
      else
        v82 = 5;
      +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "sceneDeactivationManager");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = (UIApplicationSceneDeactivationAssertion *)objc_msgSend(v84, "newAssertionWithReason:", v82);
      deactivatingScenesResignActiveAssertion = self->_deactivatingScenesResignActiveAssertion;
      self->_deactivatingScenesResignActiveAssertion = v85;

      v87 = self->_deactivatingScenesResignActiveAssertion;
      v126[0] = v70;
      v126[1] = 3221225472;
      v126[2] = __112__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext___block_invoke;
      v126[3] = &unk_1E8EA3EA0;
      v127 = v71;
      -[UIApplicationSceneDeactivationAssertion acquireWithPredicate:transitionContext:](v87, "acquireWithPredicate:transitionContext:", v126, 0);

    }
  }
  objc_msgSend(v110, "_updateDisplayLayoutElementForLayoutState:", v112);
  if (v106 != 11 && (v97 || v96 && !v99 && v102 != v103))
    objc_msgSend(v110, "_updateContentViewInterfaceOrientation:", objc_msgSend(v112, "interfaceOrientation"));
  v122 = 0;
  v123 = &v122;
  v124 = 0x2020000000;
  v125 = 0;
  objc_msgSend(v117, "applicationSceneEntities");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v121[0] = v70;
  v121[1] = 3221225472;
  v121[2] = __112__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext___block_invoke_2;
  v121[3] = &unk_1E8E9F320;
  v121[4] = &v122;
  objc_msgSend(v88, "enumerateObjectsUsingBlock:", v121);

  if (*((_BYTE *)v123 + 24))
  {
    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "activateOrientationSource:", 1);
  }
  else
  {
    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "deactivateOrientationSource:", 1);
  }

  -[SBMainSwitcherControllerCoordinator _evaluateAsynchronousRenderingEnablement](self, "_evaluateAsynchronousRenderingEnablement");
  objc_msgSend(MEMORY[0x1E0CEA6C0], "sharedHUDService");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "dismissOrCancelHUDPresentationIfNeeded");

  objc_msgSend(v109, "layoutStateProvider");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setLayoutState:", v112);

  objc_msgSend(v109, "layoutStateProvider");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setPreviousLayoutState:", v111);

  -[SBMainSwitcherControllerCoordinator _updateHomeScreenDisplayLayoutElementForLayoutState:switcherController:](self, "_updateHomeScreenDisplayLayoutElementForLayoutState:switcherController:", v112, v110);
  _Block_object_dispose(&v122, 8);

}

- (void)_updateHomeScreenDisplayLayoutElementForLayoutState:(id)a3 switcherController:(id)a4
{
  NSMapTable *homeScreenDisplayLayoutElementAssertionsBySwitcherController;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a4;
  homeScreenDisplayLayoutElementAssertionsBySwitcherController = self->_homeScreenDisplayLayoutElementAssertionsBySwitcherController;
  v7 = a3;
  -[NSMapTable objectForKey:](homeScreenDisplayLayoutElementAssertionsBySwitcherController, "objectForKey:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "effectivelyRepresentsHomeScreen");

  if (v10)
  {
    if (!v8)
    {
      objc_msgSend(v9, "displayLayoutPublisher");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addElement:", self->_homeScreenDisplayLayoutElement);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMapTable setObject:forKey:](self->_homeScreenDisplayLayoutElementAssertionsBySwitcherController, "setObject:forKey:", v8, v12);
    }
  }
  else
  {
    objc_msgSend(v8, "invalidate");
    -[NSMapTable removeObjectForKey:](self->_homeScreenDisplayLayoutElementAssertionsBySwitcherController, "removeObjectForKey:", v12);
  }

}

- (void)_beginDisplayLayoutTransitionForSwitcherController:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayLayoutPublisher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transitionAssertionWithReason:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](self->_displayLayoutTransitionsBySwitcherController, "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    SBLogAppSwitcher();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SBMainSwitcherControllerCoordinator _beginDisplayLayoutTransitionForSwitcherController:reason:].cold.1((uint64_t)self, (uint64_t)v7, v12);

    objc_msgSend(v11, "invalidate");
  }
  -[NSMapTable setObject:forKey:](self->_displayLayoutTransitionsBySwitcherController, "setObject:forKey:", v10, v6);

}

- (BSInvalidatable)suspendWallpaperAnimationAssertion
{
  return self->_suspendWallpaperAnimationAssertion;
}

- (void)setSuspendWallpaperAnimationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationAssertion, a3);
}

- (void)_releaseKeyboardFocus
{
  BSInvalidatable *lockKeyboardFocusAssertion;

  -[BSInvalidatable invalidate](self->_lockKeyboardFocusAssertion, "invalidate");
  lockKeyboardFocusAssertion = self->_lockKeyboardFocusAssertion;
  self->_lockKeyboardFocusAssertion = 0;

}

- (void)_focusNewlyAddedApplicationIfNeededTransitioningFromLayoutState:(id)a3 toLayoutState:(id)a4 windowScene:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
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
  int v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;

  v60 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v60, "elementWithRole:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "elementWithRole:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "elementWithRole:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "elementWithRole:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = BSEqualObjects();
  v15 = BSEqualObjects();
  if (!v15 || (v14 & 1) == 0)
  {
    if (v15)
      v30 = v12;
    else
      v30 = v13;
    objc_msgSend(v30, "workspaceEntity");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "applicationSceneEntity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "sceneHandle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sceneIfExists");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "settings");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isForeground");

    if (!v34)
      goto LABEL_31;
    +[SBWorkspace mainWorkspace](SBMainWorkspace, "mainWorkspace");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "keyboardFocusController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "userFocusRequestForScene:reason:completion:", v19, CFSTR("floating or center app is foreground"), 0);
    goto LABEL_29;
  }
  -[SBMainSwitcherControllerCoordinator switcherControllerForWindowScene:](self, "switcherControllerForWindowScene:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isChamoisWindowingUIEnabled");

  if (v17)
  {
    objc_msgSend(v60, "appLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appLayout");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v20, "count"))
    {
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
    v59 = v9;
    objc_msgSend(v18, "allItems");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sb_arrayByRemovingObjects:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = v22;
    v58 = v20;
    if (objc_msgSend(v22, "count") == 1)
    {
      objc_msgSend(v22, "firstObject");
      v50 = objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v19, "layoutRoleForItem:");
      if (!SBLayoutRoleIsValidForSplitView(v23))
      {
        v54 = 0;
        v28 = 0;
        v29 = (void *)v50;
LABEL_25:

LABEL_26:
        objc_msgSend(v28, "settings");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "isForeground");

        if (v42)
        {
          +[SBWorkspace mainWorkspace](SBMainWorkspace, "mainWorkspace");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "keyboardFocusController");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "userFocusRequestForScene:reason:completion:", v28, v54, 0);

        }
        v35 = v57;
        v20 = v58;
        v9 = v59;
LABEL_29:

        goto LABEL_30;
      }
      objc_msgSend(v8, "elementWithRole:", v23);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "workspaceEntity");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "applicationSceneEntity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "sceneHandle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "sceneIfExists");
      v47 = objc_claimAutoreleasedReturnValue();

      v27 = v25;
      v54 = CFSTR("added single app to stage");
      v28 = (void *)v47;
      v29 = (void *)v50;
LABEL_22:

      goto LABEL_25;
    }
    if (objc_msgSend(v22, "count"))
    {
      objc_msgSend(v19, "zOrderedItems");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = v28;
      if (v28)
      {
        if (!SBLayoutRoleIsValidForSplitView(objc_msgSend(v19, "layoutRoleForItem:", v28)))
        {
          v54 = 0;
          v28 = 0;
          goto LABEL_25;
        }
        objc_msgSend(v59, "sceneManager");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)MEMORY[0x1E0D231F0];
        objc_msgSend(v28, "uniqueIdentifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "identityForIdentifier:", v55);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "existingSceneHandleForSceneIdentity:", v37);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = v28;
        objc_msgSend(v48, "sceneIfExists");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v48;
        v38 = CFSTR("added multiple apps to stage");
        goto LABEL_21;
      }
    }
    else
    {
      if (!objc_msgSend(v19, "isEqual:", v18))
      {
        v54 = 0;
        v28 = 0;
        goto LABEL_26;
      }
      objc_msgSend(v19, "zOrderedItems");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = v28;
      if (v28)
      {
        objc_msgSend(v59, "sceneManager");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (void *)MEMORY[0x1E0D231F0];
        objc_msgSend(v28, "uniqueIdentifier");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "identityForIdentifier:", v56);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "existingSceneHandleForSceneIdentity:", v40);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = v28;
        objc_msgSend(v49, "sceneIfExists");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v49;
        v38 = CFSTR("update top most app on existing stage");
LABEL_21:
        v54 = v38;
        goto LABEL_22;
      }
    }
    v54 = 0;
    goto LABEL_25;
  }
LABEL_32:

}

- (void)_endDisplayLayoutTransitionForSwitcherController:(id)a3
{
  NSMapTable *displayLayoutTransitionsBySwitcherController;
  id v5;
  id v6;

  displayLayoutTransitionsBySwitcherController = self->_displayLayoutTransitionsBySwitcherController;
  v5 = a3;
  -[NSMapTable objectForKey:](displayLayoutTransitionsBySwitcherController, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](self->_displayLayoutTransitionsBySwitcherController, "removeObjectForKey:", v5);

  objc_msgSend(v6, "invalidate");
}

- (void)switcherContentController:(id)a3 setWallpaperStyle:(int64_t)a4
{
  uint64_t v4;
  id v5;

  switch(a4)
  {
    case 1:
      +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance", a3);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeWallpaperStyleForPriority:forVariant:withAnimationFactory:", 3, 1, 0);
      goto LABEL_8;
    case 2:
      v4 = 20;
      goto LABEL_7;
    case 3:
      v4 = 13;
      goto LABEL_7;
    case 4:
      v4 = 2;
      goto LABEL_7;
    default:
      v4 = 0;
LABEL_7:
      +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance", a3);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setWallpaperStyle:forPriority:forVariant:withAnimationFactory:", v4, 3, 1, 0);
LABEL_8:

      return;
  }
}

- (void)switcherContentController:(id)a3 setHomeScreenBackdropBlurType:(int64_t)a4
{
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4 & 0xFFFFFFFFFFFFFFFELL;
  -[SBMainSwitcherControllerCoordinator _homeScreenAppearanceControllerForSwitcherContentController:](self, "_homeScreenAppearanceControllerForSwitcherContentController:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v5 != 2)
  {
    objc_msgSend(v6, "endRequiringBackdropViewForReason:", CFSTR("SBAppSwitcherBackdropRequiringReason"));
    v7 = v8;
    goto LABEL_5;
  }
  objc_msgSend(v6, "beginRequiringBackdropViewForReason:", CFSTR("SBAppSwitcherBackdropRequiringReason"));
  v7 = v8;
  if (a4 != 3)
  {
LABEL_5:
    objc_msgSend(v7, "endRequiringLiveBackdropViewForReason:", CFSTR("SBAppSwitcherBackdropRequiringReason"));
    goto LABEL_6;
  }
  objc_msgSend(v8, "beginRequiringLiveBackdropViewForReason:", CFSTR("SBAppSwitcherBackdropRequiringReason"));
LABEL_6:

}

void __112__SBMainSwitcherControllerCoordinator_switcherContentController_setWallpaperScale_withAnimationMode_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHomescreenWallpaperScale:withAnimationFactory:", 0, *(double *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "invalidate");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 192);
  *(_QWORD *)(v4 + 192) = v3;

}

- (void)_keyboardWillShow:(id)a3
{
  if (!self->_isKeyboardShowing)
  {
    self->_isKeyboardShowing = 1;
    -[SBMainSwitcherControllerCoordinator _updateKeyboardHomeAffordanceAssertion](self, "_updateKeyboardHomeAffordanceAssertion", a3);
  }
}

- (void)switcherContentController:(id)a3 layoutStateTransitionDidEndWithTransitionContext:(id)a4
{
  id v6;
  SBSwitcherModelRemovalResults *activeTransitionModelRemovalResults;
  NSDictionary *activeTransitionModelRemovalAppLayoutToRemovalContext;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];

  v15 = a3;
  v6 = a4;
  if (self->_activeTransitionModelRemovalResults)
  {
    -[SBMainSwitcherControllerCoordinator _performSceneDestructionForModelRemovalResults:](self, "_performSceneDestructionForModelRemovalResults:", v15);
    activeTransitionModelRemovalResults = self->_activeTransitionModelRemovalResults;
    self->_activeTransitionModelRemovalResults = 0;

  }
  activeTransitionModelRemovalAppLayoutToRemovalContext = self->_activeTransitionModelRemovalAppLayoutToRemovalContext;
  self->_activeTransitionModelRemovalAppLayoutToRemovalContext = 0;

  v9 = objc_opt_class();
  objc_msgSend(v6, "toLayoutState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fromLayoutState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isInterrupted") & 1) == 0
    && (objc_msgSend(v12, "isEqual:", v11) & 1) == 0
    && objc_msgSend(v11, "unlockedEnvironmentMode") == 3)
  {
    objc_msgSend(v11, "appLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __114__SBMainSwitcherControllerCoordinator_switcherContentController_layoutStateTransitionDidEndWithTransitionContext___block_invoke;
    v17[3] = &unk_1E8EA43C0;
    v17[4] = self;
    objc_msgSend(v13, "enumerate:", v17);

  }
  objc_msgSend(v11, "appLayout", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    -[SBAppSwitcherModel noteDisplayItemLayoutAttributesMapChangedForAppLayout:displayOrdinal:](self->_mainSwitcherModel, "noteDisplayItemLayoutAttributesMapChangedForAppLayout:displayOrdinal:", v14, objc_msgSend(v11, "displayOrdinal"));

}

- (void)_keyboardWillHide:(id)a3
{
  if (self->_isKeyboardShowing)
  {
    self->_isKeyboardShowing = 0;
    -[SBMainSwitcherControllerCoordinator _updateKeyboardHomeAffordanceAssertion](self, "_updateKeyboardHomeAffordanceAssertion", a3);
  }
}

- (void)noteKeyboardIsNotForMedusa
{
  void *v3;
  FBScene *medusaKeyboardScene;

  -[SBMainSwitcherControllerCoordinator _medusaKeyboardSceneHandle](self, "_medusaKeyboardSceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  medusaKeyboardScene = self->_medusaKeyboardScene;
  self->_medusaKeyboardScene = 0;

  -[SBMainSwitcherControllerCoordinator _updateKeyboardHomeAffordanceAssertion](self, "_updateKeyboardHomeAffordanceAssertion");
}

- (id)_medusaKeyboardSceneHandle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeDisplayWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_medusaKeyboardScene)
  {
    objc_msgSend(v5, "existingSceneHandleForScene:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_updateKeyboardHomeAffordanceAssertion
{
  _BOOL4 v3;
  SBKeyboardHomeAffordanceAssertion *keyboardHomeAffordanceAssertion;
  void *v5;
  void *v6;
  void *v7;
  SBKeyboardHomeAffordanceAssertion *v8;
  SBKeyboardHomeAffordanceAssertion *v9;
  SBKeyboardHomeAffordanceAssertion *v10;
  void *v11;

  v3 = -[SBMainSwitcherControllerCoordinator _shouldTakeKeyboardHomeAffordanceAssertion](self, "_shouldTakeKeyboardHomeAffordanceAssertion");
  keyboardHomeAffordanceAssertion = self->_keyboardHomeAffordanceAssertion;
  if (v3)
  {
    if (!keyboardHomeAffordanceAssertion)
    {
      objc_msgSend((id)SBApp, "windowSceneManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activeDisplayWindowScene");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBMainSwitcherControllerCoordinator switcherControllerForWindowScene:](self, "switcherControllerForWindowScene:", v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "switcherWindow");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBKeyboardHomeAffordanceAssertion assertionForGestureWindow:](SBKeyboardHomeAffordanceAssertion, "assertionForGestureWindow:", v7);
      v8 = (SBKeyboardHomeAffordanceAssertion *)objc_claimAutoreleasedReturnValue();
      v9 = self->_keyboardHomeAffordanceAssertion;
      self->_keyboardHomeAffordanceAssertion = v8;

    }
  }
  else if (keyboardHomeAffordanceAssertion)
  {
    -[SBKeyboardHomeAffordanceAssertion invalidate](keyboardHomeAffordanceAssertion, "invalidate");
    v10 = self->_keyboardHomeAffordanceAssertion;
    self->_keyboardHomeAffordanceAssertion = 0;

  }
}

- (BOOL)_shouldTakeKeyboardHomeAffordanceAssertion
{
  uint64_t v3;
  int v4;
  BOOL result;

  v3 = SBFEffectiveHomeButtonType();
  v4 = -[SBFHomeGrabberSettings isEnabled](self->_homeGrabberSettings, "isEnabled");
  result = 0;
  if (v3 == 2 && v4)
  {
    if (self->_isKeyboardShowing && self->_medusaKeyboardScene)
      return !-[SBMainSwitcherControllerCoordinator _keyboardIsSuppressedForMedusaKeyboardScene](self, "_keyboardIsSuppressedForMedusaKeyboardScene");
    else
      return 0;
  }
  return result;
}

- (void)keyboardFocusController:(id)a3 externalSceneDidAcquireFocus:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__SBMainSwitcherControllerCoordinator_keyboardFocusController_externalSceneDidAcquireFocus___block_invoke;
  v7[3] = &unk_1E8EB1300;
  v8 = v5;
  v6 = v5;
  -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", v7);

}

- (void)_switcherModelChanged:(id)a3
{
  if (!self->_ignoreModelUpdates)
    -[SBMainSwitcherControllerCoordinator _rebuildAppListCache](self, "_rebuildAppListCache", a3);
}

- (void)_addAppLayoutToFront:(id)a3 removeAppLayout:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[SBMainSwitcherControllerCoordinator _shouldAddAppLayoutToFront:](self, "_shouldAddAppLayoutToFront:", v6))
    goto LABEL_21;
  if (!-[SBAppSwitcherSettings shouldDisableSwitcherModelUpdatesForDemo](self->_settings, "shouldDisableSwitcherModelUpdatesForDemo")|| objc_msgSend(v6, "environment") != 1)
  {
    goto LABEL_18;
  }
  v19 = v7;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->_appLayouts;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v9)
  {
LABEL_12:

LABEL_17:
    v7 = v19;
    if (-[NSArray containsObject:](self->_appLayouts, "containsObject:", v6))
      goto LABEL_21;
LABEL_18:
    self->_ignoreModelUpdates = 1;
    if (v7)
      -[SBAppSwitcherModel remove:](self->_mainSwitcherModel, "remove:", v7);
    -[SBAppSwitcherModel addToFront:](self->_mainSwitcherModel, "addToFront:", v6);
    -[SBMainSwitcherControllerCoordinator _rebuildAppListCache](self, "_rebuildAppListCache");
    self->_ignoreModelUpdates = 0;
    goto LABEL_21;
  }
  v10 = v9;
  v11 = *(_QWORD *)v21;
LABEL_6:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v21 != v11)
      objc_enumerationMutation(v8);
    v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
    v14 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v6, "allItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "containsAnyItemFromSet:", v16);

    if ((v17 & 1) != 0)
      break;
    if (v10 == ++v12)
    {
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  v18 = v13;

  if (!v18)
    goto LABEL_17;
  self->_ignoreModelUpdates = 1;
  v7 = v19;
  if (v19)
    -[SBAppSwitcherModel remove:](self->_mainSwitcherModel, "remove:", v19);
  -[SBAppSwitcherModel replaceAppLayout:withAppLayout:](self->_mainSwitcherModel, "replaceAppLayout:withAppLayout:", v18, v6);
  -[SBMainSwitcherControllerCoordinator _rebuildAppListCache](self, "_rebuildAppListCache");
  self->_ignoreModelUpdates = 0;

LABEL_21:
}

- (void)_rebuildAppListCache
{
  -[SBMainSwitcherControllerCoordinator _buildAppLayoutCache](self, "_buildAppLayoutCache");
  -[SBMainSwitcherControllerCoordinator _rebuildCurrentWindowingModeCompatibleAppLayoutsIfNecessary](self, "_rebuildCurrentWindowingModeCompatibleAppLayoutsIfNecessary");
  -[SBMainSwitcherControllerCoordinator _notifySwitcherControllersAppLayoutsDidChange](self, "_notifySwitcherControllersAppLayoutsDidChange");
}

- (void)_rebuildCurrentWindowingModeCompatibleAppLayoutsIfNecessary
{
  NSMapTable *currentWindowingModeCompatibleAppLayoutsByWindowScene;
  NSMapTable *v4;
  _QWORD v5[7];
  _QWORD v6[5];
  id v7;
  _QWORD v8[5];
  id v9;

  if (SBFIsChamoisWindowingUIAvailable())
  {
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x3032000000;
    v8[3] = __Block_byref_object_copy__62;
    v8[4] = __Block_byref_object_dispose__62;
    v9 = 0;
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x3032000000;
    v6[3] = __Block_byref_object_copy__62;
    v6[4] = __Block_byref_object_dispose__62;
    v7 = 0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __98__SBMainSwitcherControllerCoordinator__rebuildCurrentWindowingModeCompatibleAppLayoutsIfNecessary__block_invoke;
    v5[3] = &unk_1E8EB15A0;
    v5[4] = self;
    v5[5] = v6;
    v5[6] = v8;
    -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", v5);
    currentWindowingModeCompatibleAppLayoutsByWindowScene = self->_currentWindowingModeCompatibleAppLayoutsByWindowScene;
    if (currentWindowingModeCompatibleAppLayoutsByWindowScene)
    {
      if (!-[NSMapTable count](currentWindowingModeCompatibleAppLayoutsByWindowScene, "count"))
      {
        v4 = self->_currentWindowingModeCompatibleAppLayoutsByWindowScene;
        self->_currentWindowingModeCompatibleAppLayoutsByWindowScene = 0;

      }
    }
    _Block_object_dispose(v6, 8);

    _Block_object_dispose(v8, 8);
  }
}

- (BOOL)_shouldAddAppLayoutToFront:(id)a3
{
  return objc_msgSend(a3, "type") == 0;
}

- (void)_notifySwitcherControllersAppLayoutsDidChange
{
  -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", &__block_literal_global_248_0);
}

- (void)_updateBestAppSuggestion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  _QWORD v10[4];
  id v11;

  +[SBAppSuggestionManager sharedInstance](SBAppSuggestionManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentSuggestedApp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBMainSwitcherControllerCoordinator _isBestAppSuggestionEligibleForSwitcher:](self, "_isBestAppSuggestionEligibleForSwitcher:", v4))
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationWithBundleIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = 1;
    else
      v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Siri"));

  }
  else
  {
    v8 = 0;
  }
  if (v4)
    v9 = v8 == 0;
  else
    v9 = 0;
  if (!v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__SBMainSwitcherControllerCoordinator__updateBestAppSuggestion__block_invoke;
    v10[3] = &unk_1E8EB1300;
    v11 = v4;
    -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", v10);

  }
}

- (BOOL)_isBestAppSuggestionEligibleForSwitcher:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (id)appSwitcherModel:(id)a3 willAddAppLayout:(id)a4 replacingAppLayouts:(id)a5 removingAppLayouts:(id)a6
{
  return a4;
}

uint64_t __110__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "environment") == 2)
  {
    objc_msgSend(v3, "allItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "allItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)switcherControllerForAppLayout:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (-[NSMapTable count](self->_switcherControllersByWindowScene, "count") == 1)
  {
    -[NSMapTable objectEnumerator](self->_switcherControllersByWindowScene, "objectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nextObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__62;
    v15 = __Block_byref_object_dispose__62;
    v16 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__SBMainSwitcherControllerCoordinator_switcherControllerForAppLayout___block_invoke;
    v8[3] = &unk_1E8EB17C8;
    v8[4] = self;
    v9 = v4;
    v10 = &v11;
    -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", v8);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }

  return v6;
}

void __110__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_entityForDisplayItem:switcherController:", a3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);
    v4 = v5;
  }

}

void __53__SBMainSwitcherControllerCoordinator_sharedInstance__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = -[SBMainSwitcherControllerCoordinator _init]([SBMainSwitcherControllerCoordinator alloc], "_init");
  v3 = (void *)__sharedInstance_2;
  __sharedInstance_2 = (uint64_t)v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

- (id)_init
{
  SBMainSwitcherControllerCoordinator *v2;
  SBAppSwitcherModel *v3;
  SBAppSwitcherModel *mainSwitcherModel;
  uint64_t v5;
  NSMutableArray *servicesRemovedWhileAwayFromSwitcher;
  uint64_t v7;
  NSMutableSet *liveDisplayItemsBeingTerminated;
  uint64_t v9;
  SBAppSwitcherSettings *settings;
  uint64_t v11;
  NSPointerArray *coordinatedSwitcherControllers;
  uint64_t v13;
  NSMapTable *switcherControllersByWindowScene;
  uint64_t v15;
  NSMapTable *lastMeaningfullyDifferentLayoutStatesByWindowScene;
  NSCountedSet *v17;
  NSCountedSet *draggingAppLayouts;
  SBSwitcherDemoFilteringController *v19;
  SBSwitcherDemoFilteringController *demoFilteringController;
  SBSwitcherDemoCommandsServer *v21;
  void *v22;
  uint64_t v23;
  SBSwitcherDemoCommandsServer *demoCommandsServer;
  SBApplicationUserQuitMonitorServer *v25;
  SBApplicationUserQuitMonitorServer *userQuitMonitorServer;
  void *v27;
  uint64_t v28;
  SBKeyboardFocusControlling *keyboardFocusController;
  uint64_t v30;
  BSInvalidatable *keyboardFocusObserver;
  NSMutableDictionary *v32;
  NSMutableDictionary *recentSwipeUpToKillTimestampsForAppLayouts;
  void *v34;
  uint64_t v35;
  SBFHomeGrabberSettings *homeGrabberSettings;
  uint64_t v37;
  NSMapTable *displayLayoutTransitionsBySwitcherController;
  uint64_t v39;
  NSMapTable *homeScreenDisplayLayoutElementAssertionsBySwitcherController;
  id v41;
  uint64_t v42;
  SBSDisplayLayoutElement *homeScreenDisplayLayoutElement;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  BSDefaultObserver *chamoisWindowingUIEverEnabledObserver;
  SBSwitcherCaptureApplicationActivationWatchdog *v51;
  SBSwitcherCaptureApplicationActivationWatchdog *captureApplicationWatchdog;
  _QWORD v54[4];
  id v55;
  id location;
  objc_super v57;

  v57.receiver = self;
  v57.super_class = (Class)SBMainSwitcherControllerCoordinator;
  v2 = -[SBMainSwitcherControllerCoordinator init](&v57, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SBAppSwitcherModel);
    mainSwitcherModel = v2->_mainSwitcherModel;
    v2->_mainSwitcherModel = v3;

    -[SBAppSwitcherModel setDelegate:](v2->_mainSwitcherModel, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    servicesRemovedWhileAwayFromSwitcher = v2->_servicesRemovedWhileAwayFromSwitcher;
    v2->_servicesRemovedWhileAwayFromSwitcher = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    liveDisplayItemsBeingTerminated = v2->_liveDisplayItemsBeingTerminated;
    v2->_liveDisplayItemsBeingTerminated = (NSMutableSet *)v7;

    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v9 = objc_claimAutoreleasedReturnValue();
    settings = v2->_settings;
    v2->_settings = (SBAppSwitcherSettings *)v9;

    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v11 = objc_claimAutoreleasedReturnValue();
    coordinatedSwitcherControllers = v2->_coordinatedSwitcherControllers;
    v2->_coordinatedSwitcherControllers = (NSPointerArray *)v11;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    switcherControllersByWindowScene = v2->_switcherControllersByWindowScene;
    v2->_switcherControllersByWindowScene = (NSMapTable *)v13;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    lastMeaningfullyDifferentLayoutStatesByWindowScene = v2->_lastMeaningfullyDifferentLayoutStatesByWindowScene;
    v2->_lastMeaningfullyDifferentLayoutStatesByWindowScene = (NSMapTable *)v15;

    v17 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    draggingAppLayouts = v2->_draggingAppLayouts;
    v2->_draggingAppLayouts = v17;

    v19 = objc_alloc_init(SBSwitcherDemoFilteringController);
    demoFilteringController = v2->_demoFilteringController;
    v2->_demoFilteringController = v19;

    -[SBSwitcherDemoFilteringController addObserver:](v2->_demoFilteringController, "addObserver:", v2);
    v21 = [SBSwitcherDemoCommandsServer alloc];
    -[SBAppSwitcherModel _recentAppLayoutsController](v2->_mainSwitcherModel, "_recentAppLayoutsController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[SBSwitcherDemoCommandsServer initWithRecentAppLayouts:demoFilteringController:](v21, "initWithRecentAppLayouts:demoFilteringController:", v22, v2->_demoFilteringController);
    demoCommandsServer = v2->_demoCommandsServer;
    v2->_demoCommandsServer = (SBSwitcherDemoCommandsServer *)v23;

    v25 = objc_alloc_init(SBApplicationUserQuitMonitorServer);
    userQuitMonitorServer = v2->_userQuitMonitorServer;
    v2->_userQuitMonitorServer = v25;

    -[SBMainSwitcherControllerCoordinator _warmAppInfoForAppsInList](v2, "_warmAppInfoForAppsInList");
    +[SBWorkspace mainWorkspace](SBMainWorkspace, "mainWorkspace");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "keyboardFocusController");
    v28 = objc_claimAutoreleasedReturnValue();
    keyboardFocusController = v2->_keyboardFocusController;
    v2->_keyboardFocusController = (SBKeyboardFocusControlling *)v28;

    -[SBKeyboardFocusControlling addKeyboardFocusObserver:](v2->_keyboardFocusController, "addKeyboardFocusObserver:", v2);
    v30 = objc_claimAutoreleasedReturnValue();
    keyboardFocusObserver = v2->_keyboardFocusObserver;
    v2->_keyboardFocusObserver = (BSInvalidatable *)v30;

    v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    recentSwipeUpToKillTimestampsForAppLayouts = v2->_recentSwipeUpToKillTimestampsForAppLayouts;
    v2->_recentSwipeUpToKillTimestampsForAppLayouts = v32;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v2, sel__applicationDidExit_, CFSTR("SBApplicationDidExitNotification"), 0);
    objc_msgSend(v34, "addObserver:selector:name:object:", v2, sel__noteUIWillLock, CFSTR("SBLockScreenUIWillLockNotification"), 0);
    objc_msgSend(v34, "addObserver:selector:name:object:", v2, sel__noteUIWillLock, CFSTR("SBRestartManagerWillRebootNotification"), 0);
    objc_msgSend(v34, "addObserver:selector:name:object:", v2, sel__switcherServiceAdded_, CFSTR("AppSwitcherServiceAdded"), 0);
    objc_msgSend(v34, "addObserver:selector:name:object:", v2, sel__switcherServiceRemoved_, CFSTR("AppSwitcherServiceRemoved"), 0);
    objc_msgSend(v34, "addObserver:selector:name:object:", v2, sel__continuityAppSuggestionChanged_, CFSTR("SBSuggestedAppChangedNotification"), 0);
    objc_msgSend(v34, "addObserver:selector:name:object:", v2, sel__switcherModelChanged_, CFSTR("SBAppSwitcherModelDidChangeNotification"), 0);
    objc_msgSend(v34, "addObserver:selector:name:object:", v2, sel__keyboardWillShow_, *MEMORY[0x1E0CEB978], 0);
    objc_msgSend(v34, "addObserver:selector:name:object:", v2, sel__keyboardWillHide_, *MEMORY[0x1E0CEB970], 0);
    objc_msgSend(v34, "addObserver:selector:name:object:", v2, sel__appProtectionHiddenAppsDidChange_, CFSTR("SBAppProtectionCoordinatorHiddenAppsDidChange"), 0);
    objc_msgSend(MEMORY[0x1E0DA9E28], "rootSettings");
    v35 = objc_claimAutoreleasedReturnValue();
    homeGrabberSettings = v2->_homeGrabberSettings;
    v2->_homeGrabberSettings = (SBFHomeGrabberSettings *)v35;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0);
    v37 = objc_claimAutoreleasedReturnValue();
    displayLayoutTransitionsBySwitcherController = v2->_displayLayoutTransitionsBySwitcherController;
    v2->_displayLayoutTransitionsBySwitcherController = (NSMapTable *)v37;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0);
    v39 = objc_claimAutoreleasedReturnValue();
    homeScreenDisplayLayoutElementAssertionsBySwitcherController = v2->_homeScreenDisplayLayoutElementAssertionsBySwitcherController;
    v2->_homeScreenDisplayLayoutElementAssertionsBySwitcherController = (NSMapTable *)v39;

    v41 = objc_alloc(MEMORY[0x1E0DAAE30]);
    v42 = objc_msgSend(v41, "initWithIdentifier:", *MEMORY[0x1E0DAB668]);
    homeScreenDisplayLayoutElement = v2->_homeScreenDisplayLayoutElement;
    v2->_homeScreenDisplayLayoutElement = (SBSDisplayLayoutElement *)v42;

    -[SBSDisplayLayoutElement setLayoutRole:](v2->_homeScreenDisplayLayoutElement, "setLayoutRole:", 1);
    -[SBSDisplayLayoutElement setLevel:](v2->_homeScreenDisplayLayoutElement, "setLevel:", 0);
    -[SBSDisplayLayoutElement setFillsDisplayBounds:](v2->_homeScreenDisplayLayoutElement, "setFillsDisplayBounds:", 1);
    if (SBFIsChamoisWindowingUIAvailable())
    {
      objc_initWeak(&location, v2);
      +[SBDefaults localDefaults](SBDefaults, "localDefaults");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "appSwitcherDefaults");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "chamoisEverEnabled");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = MEMORY[0x1E0C80D38];
      v48 = MEMORY[0x1E0C80D38];
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __44__SBMainSwitcherControllerCoordinator__init__block_invoke;
      v54[3] = &unk_1E8E9DF28;
      objc_copyWeak(&v55, &location);
      objc_msgSend(v45, "observeDefault:onQueue:withBlock:", v46, v47, v54);
      v49 = objc_claimAutoreleasedReturnValue();
      chamoisWindowingUIEverEnabledObserver = v2->_chamoisWindowingUIEverEnabledObserver;
      v2->_chamoisWindowingUIEverEnabledObserver = (BSDefaultObserver *)v49;

      objc_destroyWeak(&v55);
      objc_destroyWeak(&location);
    }
    v51 = -[SBSwitcherCaptureApplicationActivationWatchdog initWithDelegate:]([SBSwitcherCaptureApplicationActivationWatchdog alloc], "initWithDelegate:", v2);
    captureApplicationWatchdog = v2->_captureApplicationWatchdog;
    v2->_captureApplicationWatchdog = v51;

    v2->_outstandingAccidentalActivationMitigationTransitionCount = 0;
  }
  return v2;
}

void __44__SBMainSwitcherControllerCoordinator__init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_chamoisWindowingUIEverEnabledDefaultChangeHandler");

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMapTable *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSMapTable *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[BSDefaultObserver invalidate](self->_chamoisWindowingUIEverEnabledObserver, "invalidate");
  -[SBSwitcherDemoFilteringController removeObserver:](self->_demoFilteringController, "removeObserver:", self);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectedWindowScenes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v9), "appInteractionEventSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObserver:", self);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v7);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = self->_homeScreenDisplayLayoutElementAssertionsBySwitcherController;
  v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        -[NSMapTable objectForKey:](self->_homeScreenDisplayLayoutElementAssertionsBySwitcherController, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v15));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "invalidate");

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMapTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v13);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = self->_displayLayoutTransitionsBySwitcherController;
  v18 = -[NSMapTable countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        -[NSMapTable objectForKey:](self->_displayLayoutTransitionsBySwitcherController, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v21));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "invalidate");

        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSMapTable countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v19);
  }

  -[BSInvalidatable invalidate](self->_keyboardFocusObserver, "invalidate");
  -[SBKeyboardHomeAffordanceAssertion invalidate](self->_keyboardHomeAffordanceAssertion, "invalidate");
  -[BSAbsoluteMachTimer invalidate](self->_preventSupplementalSnapshotsInvalidationTimer, "invalidate");
  -[BSAbsoluteMachTimer invalidate](self->_disableCachingAsynchronousRenderingSurfacesTimer, "invalidate");
  v23.receiver = self;
  v23.super_class = (Class)SBMainSwitcherControllerCoordinator;
  -[SBMainSwitcherControllerCoordinator dealloc](&v23, sel_dealloc);
}

- (void)windowSceneDidConnect:(id)a3
{
  id v4;

  objc_msgSend(a3, "appInteractionEventSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

}

- (void)windowSceneDidDisconnect:(id)a3
{
  id v4;

  objc_msgSend(a3, "appInteractionEventSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)startObservingLayoutStateTransitionCoordinatorForStartupTransition:(id)a3
{
  objc_msgSend(a3, "addObserver:", self);
}

- (void)stopObservingLayoutStateTransitionCoordinatorForStartupTransition:(id)a3
{
  objc_msgSend(a3, "removeObserver:", self);
}

uint64_t __112__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __99__SBMainSwitcherControllerCoordinator__activateBetaLaunchHandlesIfNeededWithAppInfo_processHandle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activateIfNeeded");
}

void __94__SBMainSwitcherControllerCoordinator__presentStoreKitSheetIfNeededWithAppInfo_processHandle___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CF9DC0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentSheetIfNeededForProcessHandle:completion:", *(_QWORD *)(a1 + 32), &__block_literal_global_186);

}

void __94__SBMainSwitcherControllerCoordinator__presentStoreKitSheetIfNeededWithAppInfo_processHandle___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v3;

  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __94__SBMainSwitcherControllerCoordinator__presentStoreKitSheetIfNeededWithAppInfo_processHandle___block_invoke_2_cold_1(a2, v3);

}

void __112__SBMainSwitcherControllerCoordinator__requestAutomaticUpdateAuthorizationIfNecessaryWithAppInfo_processHandle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x1E0CF9DE0], "defaultService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __112__SBMainSwitcherControllerCoordinator__requestAutomaticUpdateAuthorizationIfNecessaryWithAppInfo_processHandle___block_invoke_2;
  v4[3] = &unk_1E8EA78D8;
  v5 = v3;
  objc_msgSend(v2, "requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle:completion:", v5, v4);

}

void __112__SBMainSwitcherControllerCoordinator__requestAutomaticUpdateAuthorizationIfNecessaryWithAppInfo_processHandle___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __112__SBMainSwitcherControllerCoordinator__requestAutomaticUpdateAuthorizationIfNecessaryWithAppInfo_processHandle___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);

  }
}

- (void)_asyncOnStoreAppLaunchUIActivationQueue:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *storeAppLaunchUIActivationQueue;
  void *v6;
  id v7;

  v7 = a3;
  if (!self->_storeAppLaunchUIActivationQueue)
  {
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.springboard.activateStoreAppLaunchUI", 0);
    storeAppLaunchUIActivationQueue = self->_storeAppLaunchUIActivationQueue;
    self->_storeAppLaunchUIActivationQueue = v4;

  }
  v6 = (void *)BSDispatchBlockCreateWithQualityOfService();
  dispatch_async((dispatch_queue_t)self->_storeAppLaunchUIActivationQueue, v6);

}

- (CGAffineTransform)switcherContentController:(SEL)a3 transformForCardUnderSheetForBoundsSize:(id)a4
{
  double height;
  double width;
  void *v8;
  CGAffineTransform *result;
  void *v10;

  height = a5.height;
  width = a5.width;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  -[SBMainSwitcherControllerCoordinator _centerWindowSheetMetricsCache](self, "_centerWindowSheetMetricsCache", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10 = v8;
    objc_msgSend(v8, "transformForCardUnderSheetForBoundsSize:", width, height);
    v8 = v10;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (id)_centerWindowSheetMetricsCache
{
  SBFluidSwitcherSheetMetricsCache *sheetMetricsCache;
  SBFluidSwitcherSheetMetricsCache *v4;
  SBFluidSwitcherSheetMetricsCache *v5;

  sheetMetricsCache = self->_sheetMetricsCache;
  if (!sheetMetricsCache)
  {
    v4 = objc_alloc_init(SBFluidSwitcherSheetMetricsCache);
    v5 = self->_sheetMetricsCache;
    self->_sheetMetricsCache = v4;

    sheetMetricsCache = self->_sheetMetricsCache;
  }
  return sheetMetricsCache;
}

void __110__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_entityForDisplayItem:switcherController:", a3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);
    v4 = v5;
  }

}

void __110__SBMainSwitcherControllerCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[39], "invalidate");
    v2 = v4[39];
    v4[39] = 0;

    objc_msgSend(v4[38], "invalidate");
    v3 = v4[38];
    v4[38] = 0;

    WeakRetained = v4;
  }

}

- (void)watchdog:(id)a3 requestsTerminationOf:(id)a4 forReason:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  NSObject *v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a5;
  v8 = objc_opt_class();
  v9 = v6;
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
  v11 = v10;

  objc_msgSend(v11, "applicationSceneEntity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "sceneHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sceneIfExists");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "clientHandle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "processHandle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingIdentifier:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc(MEMORY[0x1E0D87E00]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Capture Application Requirements Unmet: \"%@\"), v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithExplanation:", v19);

      objc_msgSend(v20, "setReportType:", 1);
      objc_msgSend(v20, "setMaximumTerminationResistance:", 40);
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E08]), "initWithPredicate:context:", v17, v20);
      SBLogCaptureApplication();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v16, "bundle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v24;
        v31 = 2114;
        v32 = v7;
        _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, "Unlocked capture watchdog requesting termination of \"%{public}@\" for reason: \"%{public}@\", buf, 0x16u);

      }
      v28 = 0;
      v25 = objc_msgSend(v21, "execute:", &v28);
      v26 = v28;
      if ((v25 & 1) == 0)
      {
        SBLogCaptureApplication();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v26;
          _os_log_impl(&dword_1D0540000, v27, OS_LOG_TYPE_DEFAULT, "Unlocked capture watchdog failed to terminate the process: \"%@\", buf, 0xCu);
        }

      }
    }

  }
}

- (void)eventSource:(id)a3 userTouchedApplication:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BSSimpleAssertion *preventSupplementalSnapshotsAssertion;
  BSAbsoluteMachTimer *preventSupplementalSnapshotsInvalidationTimer;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, _BYTE *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v7 = a4;
  if (self->_preventSupplementalSnapshotsAssertion)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    -[SBMainSwitcherControllerCoordinator _activeDisplaySwitcherController](self, "_activeDisplaySwitcherController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "elements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __74__SBMainSwitcherControllerCoordinator_eventSource_userTouchedApplication___block_invoke;
    v16 = &unk_1E8EB1158;
    v17 = v7;
    v18 = &v19;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v13);

    if (*((_BYTE *)v20 + 24))
    {
      -[BSSimpleAssertion invalidate](self->_preventSupplementalSnapshotsAssertion, "invalidate", v13, v14, v15, v16);
      preventSupplementalSnapshotsAssertion = self->_preventSupplementalSnapshotsAssertion;
      self->_preventSupplementalSnapshotsAssertion = 0;

      -[BSAbsoluteMachTimer invalidate](self->_preventSupplementalSnapshotsInvalidationTimer, "invalidate");
      preventSupplementalSnapshotsInvalidationTimer = self->_preventSupplementalSnapshotsInvalidationTimer;
      self->_preventSupplementalSnapshotsInvalidationTimer = 0;

    }
    _Block_object_dispose(&v19, 8);
  }

}

void __74__SBMainSwitcherControllerCoordinator_eventSource_userTouchedApplication___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(a2, "workspaceEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationSceneEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "application");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)eventSource:(id)a3 userDeletedWebBookmark:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(v10, "webClip");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isAppClip"))
  {
    objc_msgSend(v10, "webClip");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBMainSwitcherControllerCoordinator _deleteAppLayoutsMatchingBundleIdentifier:](self, "_deleteAppLayoutsMatchingBundleIdentifier:", v7);
  }
  else
  {
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBWebApplication _webAppIdentifierFromWebClipIdentifier:](SBWebApplication, "_webAppIdentifierFromWebClipIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBDisplayItem webAppDisplayItemWithWebAppIdentifier:](SBDisplayItem, "webAppDisplayItemWithWebAppIdentifier:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBMainSwitcherControllerCoordinator deleteAppLayoutForDisplayItem:](self, "deleteAppLayoutForDisplayItem:", v7);
  }

}

- (id)animationControllerForTransitionRequest:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainSwitcherControllerCoordinator animationControllerForTransitionRequest:ancillaryTransitionRequests:](self, "animationControllerForTransitionRequest:ancillaryTransitionRequests:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __107__SBMainSwitcherControllerCoordinator_animationControllerForTransitionRequest_ancillaryTransitionRequests___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "environment") == 2)
  {
    objc_msgSend(v3, "allItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "allItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __107__SBMainSwitcherControllerCoordinator_animationControllerForTransitionRequest_ancillaryTransitionRequests___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addAppLayoutToFront:removeAppLayout:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4 windowScene:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  BOOL v14;
  char v15;

  v8 = a4;
  -[SBMainSwitcherControllerCoordinator switcherControllerForWindowScene:](self, "switcherControllerForWindowScene:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "windowManagementStyle");
  v12 = objc_msgSend(v10, "canPerformKeyboardShortcutAction:forBundleIdentifier:", a3, v8);

  switch(a3)
  {
    case 4:
    case 5:
    case 6:
    case 9:
    case 10:
    case 15:
    case 16:
      if (v12)
      {
        +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v12) = objc_msgSend(v13, "isMedusaCapable");

      }
      break;
    case 11:
    case 13:
    case 14:
      v14 = v11 == 1;
      goto LABEL_6;
    case 18:
      v14 = v11 == 2;
LABEL_6:
      if (v14)
        v15 = v12;
      else
        v15 = 0;
      if (v8)
        LOBYTE(v12) = v15;
      break;
    default:
      break;
  }

  return v12;
}

- (void)performKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4 windowScene:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  SBMainSwitcherControllerCoordinator *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v17 = a4;
  v8 = a5;
  -[SBMainSwitcherControllerCoordinator switcherControllerForWindowScene:](self, "switcherControllerForWindowScene:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  switch(a3)
  {
    case 0:
      objc_msgSend(v9, "toggleMainSwitcherWithSource:animated:", 51, 1);
      break;
    case 1:
      v12 = CFSTR("KeyboardShortcutActivateNextSwitcherSpace");
      v13 = self;
      v14 = 0;
      v15 = 1;
      goto LABEL_9;
    case 2:
      v12 = CFSTR("KeyboardShortcutActivateNextSwitcherSpace");
      v13 = self;
      v14 = 1;
      v15 = 1;
      goto LABEL_11;
    case 3:
    case 11:
    case 13:
    case 14:
    case 18:
      if (!v17)
        goto LABEL_2;
      -[SBMainSwitcherControllerCoordinator _handleFocusedIconSwitcherShortcutAction:bundleIdentifier:windowScene:](self, "_handleFocusedIconSwitcherShortcutAction:bundleIdentifier:windowScene:", a3, v17, v8);
      break;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 12:
    case 15:
    case 16:
    case 17:
    case 19:
    case 20:
LABEL_2:
      objc_msgSend(v10, "performKeyboardShortcutAction:", a3);
      break;
    case 9:
      v12 = CFSTR("KeyboardShortcutActivateNextFloatingApp");
      v13 = self;
      v14 = 1;
      v15 = 2;
LABEL_9:
      v16 = 1;
      goto LABEL_12;
    case 10:
      v12 = CFSTR("KeyboardShortcutActivatePreviousFloatingApp");
      v13 = self;
      v14 = 1;
      v15 = 2;
LABEL_11:
      v16 = 0;
LABEL_12:
      -[SBMainSwitcherControllerCoordinator _activateNeighboringAppLayoutRequiringActiveAppLayout:appLayoutEnvironment:inForwardDirection:windowScene:eventLabel:](v13, "_activateNeighboringAppLayoutRequiringActiveAppLayout:appLayoutEnvironment:inForwardDirection:windowScene:eventLabel:", v14, v15, v16, v8, v12);
      break;
    default:
      break;
  }

}

- (void)_handleFocusedIconSwitcherShortcutAction:(int64_t)a3 bundleIdentifier:(id)a4 windowScene:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  SBDeviceApplicationSceneEntity *v19;
  void *v20;
  SBDeviceApplicationSceneEntity *v21;
  void *v22;
  id v23;
  SBDeviceApplicationSceneEntity *v24;
  void *v25;
  SBDeviceApplicationSceneEntity *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  SBDeviceApplicationSceneEntity *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  SBDeviceApplicationSceneEntity *v43;
  void *v44;
  void *v45;
  void *v46;
  SBDeviceApplicationSceneEntity *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  SBDeviceApplicationSceneEntity *v52;
  id v53;
  id v54;
  int64_t v55;
  uint64_t v56;
  uint64_t v57;

  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "sceneManager");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applicationWithBundleIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBMainSwitcherControllerCoordinator switcherControllerForWindowScene:](self, "switcherControllerForWindowScene:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = 0;
  v48 = v8;
  v49 = v11;
  if (a3 <= 12)
  {
    v17 = v12;
    if (a3 == 3)
    {
      v23 = v8;
      v14 = 0;
      v18 = 0;
      v22 = 0;
      v21 = 0;
    }
    else
    {
      v18 = 0;
      v23 = 0;
      v22 = 0;
      v21 = 0;
      if (a3 == 11)
      {
        v24 = [SBDeviceApplicationSceneEntity alloc];
        objc_msgSend(v50, "displayIdentity");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[SBDeviceApplicationSceneEntity initWithApplication:sceneHandleProvider:displayIdentity:](v24, "initWithApplication:sceneHandleProvider:displayIdentity:", v49, v50, v25);

        +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 0;
        v18 = 0;
LABEL_34:
        v23 = 0;
      }
    }
  }
  else
  {
    if ((unint64_t)(a3 - 13) < 2)
    {
      objc_msgSend(v12, "_currentLayoutState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
        v16 = 14;
      else
        v16 = 13;
      if (objc_msgSend(v15, "unlockedEnvironmentMode") == 1)
      {
        v17 = v13;
        if (v16 == a3)
          v18 = 2;
        else
          v18 = 3;
        v19 = [SBDeviceApplicationSceneEntity alloc];
        objc_msgSend(v50, "displayIdentity");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[SBDeviceApplicationSceneEntity initWithApplication:sceneHandleProvider:displayIdentity:](v19, "initWithApplication:sceneHandleProvider:displayIdentity:", v11, v50, v20);

        +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 0;
      }
      else
      {
        v46 = v15;
        objc_msgSend(v13, "activeAndVisibleSceneIdentifiersForApplication:", v11);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "info");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v11;
        v31 = objc_msgSend(v29, "supportsMultiwindow");

        if (v31)
          objc_msgSend(v50, "sceneIdentityForApplication:targetContentIdentifier:allowCanMatches:preferNewScene:visibleIdentifiers:", v30, 0, 0, 1, v28);
        else
          objc_msgSend(v50, "sceneIdentityForApplication:excludingIdentifiers:", v30, v28);
        v21 = (SBDeviceApplicationSceneEntity *)objc_claimAutoreleasedReturnValue();
        v47 = v21;
        if (v21)
        {
          v44 = v28;
          v45 = v13;
          objc_msgSend(v13, "layoutState");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = [SBDeviceApplicationSceneEntity alloc];
          -[SBDeviceApplicationSceneEntity identifier](v21, "identifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "displayIdentity");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[SBDeviceApplicationSceneEntity initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:](v33, "initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:", v30, v34, v50, v35);

          if (v16 == a3)
          {
            objc_msgSend(v32, "elementWithRole:", 2);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            v15 = v46;
            if (v36)
            {
              +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = 0;
            }
            else
            {
              +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", 1);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = 3;
            }
            v28 = v44;
            v13 = v45;
          }
          else
          {
            +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
            v37 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "elementWithRole:", 2);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v38)
              v14 = 0;
            else
              v14 = 3;
            v22 = v21;
            v21 = (SBDeviceApplicationSceneEntity *)v37;
            v13 = v45;
            v15 = v46;
            v28 = v44;
          }

        }
        else
        {
          v14 = 0;
          v22 = 0;
          v15 = v46;
        }
        v17 = v13;

        v18 = 0;
      }

      goto LABEL_34;
    }
    v17 = v12;
    v18 = 0;
    v23 = 0;
    v22 = 0;
    v21 = 0;
    if (a3 == 18)
    {
      v26 = [SBDeviceApplicationSceneEntity alloc];
      objc_msgSend(v50, "displayIdentity");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[SBDeviceApplicationSceneEntity initWithApplication:sceneHandleProvider:displayIdentity:](v26, "initWithApplication:sceneHandleProvider:displayIdentity:", v49, v50, v27);

      v14 = 0;
      v18 = 0;
      v23 = 0;
      v22 = 0;
    }
  }
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_fbsDisplayConfiguration");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __109__SBMainSwitcherControllerCoordinator__handleFocusedIconSwitcherShortcutAction_bundleIdentifier_windowScene___block_invoke;
  v51[3] = &unk_1E8EB11D0;
  v52 = v21;
  v53 = v22;
  v54 = v23;
  v55 = a3;
  v56 = v18;
  v57 = v14;
  v41 = v23;
  v42 = v22;
  v43 = v21;
  objc_msgSend(v39, "requestTransitionWithOptions:displayConfiguration:builder:", 0, v40, v51);

}

void __109__SBMainSwitcherControllerCoordinator__handleFocusedIconSwitcherShortcutAction_bundleIdentifier_windowScene___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 51);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __109__SBMainSwitcherControllerCoordinator__handleFocusedIconSwitcherShortcutAction_bundleIdentifier_windowScene___block_invoke_2;
  v4[3] = &unk_1E8EB11A8;
  v8 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v9 = *(_OWORD *)(a1 + 64);
  objc_msgSend(v3, "modifyApplicationContext:", v4);

}

void __109__SBMainSwitcherControllerCoordinator__handleFocusedIconSwitcherShortcutAction_bundleIdentifier_windowScene___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a1[7] == 18)
  {
    v10 = a1[4];
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a2;
    objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity", v10, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEntities:withPolicy:centerEntity:floatingEntity:", v6, 1, v7, v8);

    objc_msgSend(v5, "_setRequestedFrontmostEntity:", a1[4]);
  }
  else
  {
    v9 = a2;
    objc_msgSend(v9, "setRequestedUnlockedEnvironmentMode:", 3);
    objc_msgSend(v9, "setEntity:forLayoutRole:", a1[4], 1);
    objc_msgSend(v9, "setEntity:forLayoutRole:", a1[5], 2);
    objc_msgSend(v9, "setRequestedAppExposeBundleID:", a1[6]);
    objc_msgSend(v9, "setRequestedPeekConfiguration:", a1[8]);
    objc_msgSend(v9, "setRequestedSpaceConfiguration:", a1[9]);
  }

}

- (void)handleApplicationSceneEntityDestructionIntent:(id)a3 forEntities:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v31;
  uint64_t v32;
  id obj;
  _QWORD v34[6];
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  SBMainSwitcherControllerCoordinator *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v49 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend((id)SBApp, "windowSceneManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sceneHandle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "windowSceneForSceneHandle:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKey:", v14);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v6, "setObject:forKey:", v15, v14);
        }
        objc_msgSend(v15, "addObject:", v11);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v8);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v16 = v6;
  v32 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v32)
  {
    v29 = *(_QWORD *)v45;
    v17 = MEMORY[0x1E0C809B0];
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v45 != v29)
          objc_enumerationMutation(v16);
        v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend(v19, "_fbsDisplayConfiguration", v29);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v17;
        v41[1] = 3221225472;
        v41[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke;
        v41[3] = &unk_1E8EA0260;
        v42 = v21;
        v43 = v31;
        v22 = v21;
        v23 = (void *)MEMORY[0x1D17E5550](v41);
        v38[0] = v17;
        v38[1] = 3221225472;
        v38[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_3;
        v38[3] = &unk_1E8EB1260;
        v39 = obj;
        v40 = self;
        v24 = (void *)MEMORY[0x1D17E5550](v38);
        +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v17;
        v34[1] = 3221225472;
        v34[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_9;
        v34[3] = &unk_1E8EB12D8;
        v34[4] = self;
        v34[5] = v19;
        v35 = v20;
        v36 = v24;
        v37 = v23;
        v26 = v23;
        v27 = v20;
        v28 = v24;
        objc_msgSend(v25, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v27, v26, v34);

      }
      v32 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v32);
  }

}

void __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 34);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_2;
  v4[3] = &unk_1E8E9ECA8;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "modifyApplicationContext:", v4);

}

void __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  SBWorkspaceEntityRemovalContext *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = objc_msgSend(*(id *)(a1 + 40), "animation", (_QWORD)v13);
        if (v10 < 3)
          v11 = v10 + 1;
        else
          v11 = 0;
        v12 = -[SBWorkspaceEntityRemovalContext initWithAnimationStyle:removalActionType:]([SBWorkspaceEntityRemovalContext alloc], "initWithAnimationStyle:removalActionType:", v11, 1);
        objc_msgSend(v3, "setRemovalContext:forEntity:", v12, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

void __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_4;
  v11[3] = &unk_1E8EA59F8;
  v12 = v5;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v13 = v7;
  v14 = v8;
  v15 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v10, "modifyApplicationContext:", v11);

}

void __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_4(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
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
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "displayIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowSceneForDisplayIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "switcherController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isChamoisWindowingUIEnabled"))
  {
    objc_msgSend(a1[7], "activatingEntity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(a1[7], "activatingEntity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setActivatingEntity:", v18);

    }
    if (objc_msgSend(a1[7], "requestedUnlockedEnvironmentMode"))
      objc_msgSend(v3, "setRequestedUnlockedEnvironmentMode:", objc_msgSend(a1[7], "requestedUnlockedEnvironmentMode"));
    objc_msgSend(a1[4], "applicationContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "previousLayoutState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v20;
    objc_msgSend(a1[4], "applicationContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "entitiesWithRemovalContexts");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "elementWithRole:", 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    v56 = v23;
    if (v24)
    {
      v26 = MEMORY[0x1E0C809B0];
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_7;
      v61[3] = &unk_1E8EB1238;
      v27 = v24;
      v62 = v27;
      if (objc_msgSend(v23, "bs_containsObjectPassingTest:", v61))
      {
        v58 = v6;
        v59[0] = v26;
        v28 = (void *)*((_QWORD *)a1[6] + 6);
        v59[1] = 3221225472;
        v59[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_8;
        v59[3] = &unk_1E8E9DF78;
        v60 = v27;
        objc_msgSend(v28, "bs_firstObjectPassingTest:", v59);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
        {
          v31 = a1[6];
          objc_msgSend(v29, "itemForLayoutRole:", 1);
          v32 = v21;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "_fbsDisplayIdentity");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "_entityForDisplayItem:displayIdentity:", v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setEntity:forLayoutRole:", v35, 3);

          v21 = v32;
        }
        else
        {
          +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setEntity:forLayoutRole:", v53, 3);

        }
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setEntity:forLayoutRole:", v54, 1);

        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setEntity:forLayoutRole:", v55, 2);

        v49 = v62;
        v6 = v58;
LABEL_36:

        goto LABEL_37;
      }

    }
    objc_msgSend(a1[7], "sideElement");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[7], "primaryElement");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v45)
    {
      objc_msgSend(v46, "workspaceEntity");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setEntity:forLayoutRole:", v48, 1);

      objc_msgSend(a1[7], "sideElement");
      v49 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "workspaceEntity");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setEntity:forLayoutRole:", v50, 2);

    }
    else
    {

      if (v47)
      {
        objc_msgSend(a1[7], "primaryElement");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "workspaceEntity");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setEntity:forLayoutRole:", v52, 1);

      }
      else
      {
        +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setEntity:forLayoutRole:", v51, 1);
      }

      +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
      v49 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setEntity:forLayoutRole:", v49, 2);
    }
    goto LABEL_36;
  }
  v57 = v6;
  v8 = (void *)objc_opt_new();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  objc_msgSend(v3, "previousLayoutState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "elements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v66 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "workspaceEntity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "applicationSceneEntity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(a1[5], "containsObject:", v16) & 1) == 0)
          objc_msgSend(v8, "addObject:", v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_143_0);
    objc_msgSend(v3, "setEntities:withPolicy:centerEntity:floatingEntity:", v8, 0, 0, 0);
    v6 = v57;
  }
  else
  {
    objc_msgSend(a1[6], "appLayoutsForSwitcherController:", v7);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_6;
    v63[3] = &unk_1E8EA4510;
    v64 = a1[5];
    v38 = objc_msgSend(v36, "indexOfObjectPassingTest:", v63);
    if (v37 < 2 || v38 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v3, "setEntities:withPolicy:centerEntity:floatingEntity:", MEMORY[0x1E0C9AA60], 0, 0, 0);
    }
    else
    {
      objc_msgSend(v36, "objectAtIndex:", (v37 + v38 + 1) % v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "zOrderedItems");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "firstObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = a1[6];
      objc_msgSend(a1[4], "displayIdentity");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "_entityForDisplayItem:displayIdentity:", v41, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "setActivatingEntity:", v44);
    }
    v6 = v57;

  }
LABEL_37:

}

uint64_t __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "layoutRole"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "layoutRole");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

uint64_t __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "uniqueIdentifier", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v3, "containsItemWithUniqueIdentifier:", v8);

        if ((v9 & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

uint64_t __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  return v5;
}

uint64_t __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  if (objc_msgSend(v3, "environment") == 2)
  {
    objc_msgSend(v3, "itemForLayoutRole:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = BSEqualStrings() ^ 1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_9(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  SBSwitcherDisplayItemRemovalResolutionRequest *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void (**v23)(id, id, void *);
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  SBSwitcherDisplayItemRemovalResolutionRequest *v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  SBSwitcherDisplayItemRemovalResolutionRequest *v53;
  _QWORD v54[4];
  SBSwitcherDisplayItemRemovalResolutionRequest *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  id v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "applicationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitiesWithRemovalContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "applicationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previousLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "elements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = MEMORY[0x1E0C809B0];
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_10;
    v64[3] = &unk_1E8EB1238;
    v11 = v7;
    v65 = v11;
    v45 = v7;
    if ((objc_msgSend(v5, "bs_containsObjectPassingTest:", v64) & 1) != 0)
    {
      objc_msgSend(v11, "elements");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v10;
      v54[1] = 3221225472;
      v54[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_11;
      v54[3] = &unk_1E8EA2148;
      v13 = v5;
      v14 = v5;
      v55 = v14;
      objc_msgSend(v12, "bs_filter:", v54);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*((id *)a1[4] + 3), "objectForKey:", a1[5]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "_recentAppLayoutsController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBSwitcherWindowReplacementResult windowReplacementResultByRemovingLayoutElements:fromLayoutState:withPrecedingLayoutState:recentAppLayouts:](SBSwitcherWindowReplacementResult, "windowReplacementResultByRemovingLayoutElements:fromLayoutState:withPrecedingLayoutState:recentAppLayouts:", v14, v11, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v11, "isFloatingSwitcherVisible") & 1) != 0
        || objc_msgSend(v11, "unlockedEnvironmentMode") == 2)
      {
        objc_msgSend(v3, "setSource:", 3);
        objc_msgSend(v3, "setEventLabel:", CFSTR("PreparationForDisplayItemRemovalRequestWithExpressedIntent"));
        v51[0] = v10;
        v51[1] = 3221225472;
        v51[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_13;
        v51[3] = &unk_1E8E9ECA8;
        v52 = v15;
        v53 = v14;
        objc_msgSend(v3, "modifyApplicationContext:", v51);
        v46[0] = v10;
        v46[1] = 3221225472;
        v46[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_14;
        v46[3] = &unk_1E8EB12B0;
        v47 = a1[6];
        v49 = a1[8];
        v50 = a1[7];
        v48 = v18;
        v19 = (id)objc_msgSend(v3, "addCompletionHandler:", v46);
        objc_msgSend(a1[5], "alertItemsController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "assistantController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v21, "isVisible") & 1) != 0 || (objc_msgSend(v20, "hasVisibleSuperModalAlert") & 1) != 0)
          v22 = 0;
        else
          v22 = objc_msgSend(v20, "hasVisibleAlert") ^ 1;

      }
      else
      {
        (*((void (**)(void))a1[7] + 2))();
        v22 = 1;
      }

      v28 = v55;
      v5 = v13;
    }
    else
    {
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v44 = v5;
      v25 = v5;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
      if (v26)
      {
        v27 = v26;
        v28 = 0;
        v29 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v61 != v29)
              objc_enumerationMutation(v25);
            v31 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
            objc_msgSend(v3, "applicationContext");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "removalContextForEntity:", v31);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v31, "displayItemRepresentation");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(a1[4], "_switcherDisplayItemRemovalIntentTypeForEntity:removalContext:", v31, v33);
            if (v35)
            {
              v36 = v35;
              if (!v28)
                v28 = objc_alloc_init(SBSwitcherDisplayItemRemovalResolutionRequest);
              -[SBSwitcherDisplayItemRemovalResolutionRequest setRemovalIntentType:forDisplayItem:](v28, "setRemovalIntentType:forDisplayItem:", v36, v34);
            }

          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
        }
        while (v27);
      }
      else
      {
        v28 = 0;
      }

      objc_msgSend(a1[4], "_switcherModelRemovalResultsForDisplayItemRemovalResolutionRequest:", v28);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      objc_msgSend(v37, "appLayouts");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v57;
        do
        {
          for (j = 0; j != v40; ++j)
          {
            if (*(_QWORD *)v57 != v41)
              objc_enumerationMutation(v38);
            objc_msgSend(v37, "executeActionForAppLayout:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j));
          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
        }
        while (v40);
      }

      v22 = 0;
      v5 = v44;
    }

    v7 = v45;
  }
  else
  {
    v23 = (void (**)(id, id, void *))a1[7];
    +[SBSwitcherWindowReplacementResult defaultWindowReplacementResult](SBSwitcherWindowReplacementResult, "defaultWindowReplacementResult");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2](v23, v3, v24);

    v22 = 1;
  }

  return v22;
}

BOOL __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

uint64_t __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_12;
  v8[3] = &unk_1E8EB1238;
  v9 = v3;
  v5 = v3;
  LODWORD(v4) = objc_msgSend(v4, "bs_containsObjectPassingTest:", v8);
  v6 = SBLayoutRoleIsValidForSplitView(objc_msgSend(v5, "layoutRole")) & (v4 ^ 1);

  return v6;
}

uint64_t __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_12(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "representsSameLayoutElementAsDescriptor:", a2);
}

void __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v9, "workspaceEntity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setEntity:forLayoutRole:", v10, objc_msgSend(v9, "layoutRole"));

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "setRequestedUnlockedEnvironmentMode:", 3);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = *(id *)(a1 + 40);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v3, "setRemovalContext:forEntity:", 0, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

void __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_14(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if (a2)
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_15;
    v6[3] = &unk_1E8EB1288;
    v5 = *(_QWORD *)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v3, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v4, v5, v6);

  }
}

uint64_t __97__SBMainSwitcherControllerCoordinator_handleApplicationSceneEntityDestructionIntent_forEntities___block_invoke_15(uint64_t a1, uint64_t a2)
{
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
  return 1;
}

- (void)failMultitaskingGesturesForReason:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__SBMainSwitcherControllerCoordinator_failMultitaskingGesturesForReason___block_invoke;
  v6[3] = &unk_1E8EB1300;
  v7 = v4;
  v5 = v4;
  -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", v6);

}

void __73__SBMainSwitcherControllerCoordinator_failMultitaskingGesturesForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "gestureManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "failMultitaskingGesturesForReason:", *(_QWORD *)(a1 + 32));

}

- (void)programmaticSwitchAppGestureMoveToLeft
{
  void *v3;
  id v4;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeDisplayWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainSwitcherControllerCoordinator _activateNeighboringAppLayoutRequiringActiveAppLayout:appLayoutEnvironment:inForwardDirection:windowScene:eventLabel:](self, "_activateNeighboringAppLayoutRequiringActiveAppLayout:appLayoutEnvironment:inForwardDirection:windowScene:eventLabel:", 1, 1, 0, v3, CFSTR("ProgrammaticSwitchAppGestureMoveToRight"));

}

- (void)programmaticSwitchAppGestureMoveToRight
{
  void *v3;
  id v4;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeDisplayWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainSwitcherControllerCoordinator _activateNeighboringAppLayoutRequiringActiveAppLayout:appLayoutEnvironment:inForwardDirection:windowScene:eventLabel:](self, "_activateNeighboringAppLayoutRequiringActiveAppLayout:appLayoutEnvironment:inForwardDirection:windowScene:eventLabel:", 1, 1, 1, v3, CFSTR("ProgrammaticSwitchAppGestureMoveToRight"));

}

- (void)_activateNeighboringAppLayoutRequiringActiveAppLayout:(BOOL)a3 appLayoutEnvironment:(int64_t)a4 inForwardDirection:(BOOL)a5 windowScene:(id)a6 eventLabel:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v10;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  SBMainSwitcherControllerCoordinator *v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  BOOL v38;

  v8 = a5;
  v10 = a3;
  v13 = a6;
  v32 = a7;
  v33 = v13;
  -[SBMainSwitcherControllerCoordinator switcherControllerForWindowScene:](self, "switcherControllerForWindowScene:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainSwitcherControllerCoordinator appLayoutsForSwitcherController:](self, "appLayoutsForSwitcherController:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(a4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainSwitcherControllerCoordinator.m"), 1685, CFSTR("The desired AppLayoutEnvironment for going to next/previous layout can only be Main or Floating"));

  }
  else if (a4 == 2)
  {
    objc_msgSend(v14, "_currentFloatingAppLayout");
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v14, "_currentMainAppLayout");
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v31 = self;
  v34 = (void *)v16;
  if (v16)
  {
    if ((objc_msgSend(v15, "containsObject:", v16) & 1) == 0 && v10)
      goto LABEL_37;
    v18 = objc_msgSend(v15, "count");
    v19 = objc_msgSend(v15, "indexOfObject:", v34);
  }
  else
  {
    if (v10)
      goto LABEL_37;
    v18 = objc_msgSend(v15, "count", 0);
    v19 = -1;
  }
  if (a4 == 2)
    v20 = v18;
  else
    v20 = v18 - 1;
  if (a4 == 2)
    v21 = -1;
  else
    v21 = 0;
  v22 = v19 >= v20;
  v23 = v19 <= v21;
  v24 = !v8;
  if (v8)
    v25 = 1;
  else
    v25 = -1;
  while (1)
  {
    if (v24)
      v22 = v23;
    if (v22)
      break;
    v19 += v25;
    if (a4 == 2)
    {
      if (v8 && v19 >= v18)
        v26 = 0;
      else
        v26 = v19;
      if (v8)
      {
        v19 = v26;
      }
      else if (v19 <= v21)
      {
        v19 = v18 - 1;
      }
    }
    objc_msgSend(v15, "objectAtIndex:", v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "environment") == a4)
    {
      if (v27)
      {
        +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "_fbsDisplayConfiguration");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __156__SBMainSwitcherControllerCoordinator__activateNeighboringAppLayoutRequiringActiveAppLayout_appLayoutEnvironment_inForwardDirection_windowScene_eventLabel___block_invoke;
        v35[3] = &unk_1E8EB1328;
        v35[4] = v31;
        v36 = v27;
        v37 = v32;
        v38 = v8;
        v30 = v27;
        objc_msgSend(v28, "requestTransitionWithOptions:displayConfiguration:builder:", 0, v29, v35);

      }
      break;
    }

    v22 = v19 >= v20;
    v23 = v19 <= v21;
    v24 = !v8;
  }
LABEL_37:

}

void __156__SBMainSwitcherControllerCoordinator__activateNeighboringAppLayoutRequiringActiveAppLayout_appLayoutEnvironment_inForwardDirection_windowScene_eventLabel___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  char v8;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBSwitcherTransitionRequest, "requestForActivatingAppLayout:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_configureRequest:forSwitcherTransitionRequest:withEventLabel:", v5, v6, *(_QWORD *)(a1 + 48));

  objc_msgSend(v5, "setSource:", 12);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __156__SBMainSwitcherControllerCoordinator__activateNeighboringAppLayoutRequiringActiveAppLayout_appLayoutEnvironment_inForwardDirection_windowScene_eventLabel___block_invoke_2;
  v7[3] = &__block_descriptor_33_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
  v8 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v5, "modifyApplicationContext:", v7);

}

void __156__SBMainSwitcherControllerCoordinator__activateNeighboringAppLayoutRequiringActiveAppLayout_appLayoutEnvironment_inForwardDirection_windowScene_eventLabel___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setTransitioningToLessRecentSpace:", BSSettingFlagForBool());

}

- (id)activeTransientOverlayPresentedAppLayoutForWindowScene:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SBMainSwitcherControllerCoordinator switcherControllerForWindowScene:](self, "switcherControllerForWindowScene:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainSwitcherControllerCoordinator activeTransientOverlayPresentedAppLayoutForSwitcherContentController:](self, "activeTransientOverlayPresentedAppLayoutForSwitcherContentController:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addAppLayoutForTransientOverlayViewController:(id)a3 windowScene:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *appLayoutToEligibleTransientOverlayViewController;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  SBAppLayout *v13;
  void *v14;
  void *v15;
  void *v16;
  SBAppLayout *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BOOL v25;
  _QWORD v26[5];
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  void *v34;
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  appLayoutToEligibleTransientOverlayViewController = self->_appLayoutToEligibleTransientOverlayViewController;
  v9 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __97__SBMainSwitcherControllerCoordinator_addAppLayoutForTransientOverlayViewController_windowScene___block_invoke;
  v27[3] = &unk_1E8EB1350;
  v10 = v6;
  v28 = v10;
  v29 = &v30;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appLayoutToEligibleTransientOverlayViewController, "enumerateKeysAndObjectsUsingBlock:", v27);
  if (!*((_BYTE *)v31 + 24))
  {
    objc_msgSend(v10, "representedDisplayItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[SBMainSwitcherControllerCoordinator switcherControllerForWindowScene:](self, "switcherControllerForWindowScene:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = [SBAppLayout alloc];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v14;
      v35[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "layoutState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v13, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v15, 1, 1, objc_msgSend(v16, "displayOrdinal"));

      v18 = self->_appLayoutToEligibleTransientOverlayViewController;
      if (!v18)
      {
        v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v20 = self->_appLayoutToEligibleTransientOverlayViewController;
        self->_appLayoutToEligibleTransientOverlayViewController = v19;

        v18 = self->_appLayoutToEligibleTransientOverlayViewController;
      }
      -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v10, v17);
      objc_msgSend(v12, "_currentLayoutState");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "unlockedEnvironmentMode");

      objc_msgSend(v12, "contentViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v22 & 0xFFFFFFFFFFFFFFFELL) != 2
        && (-[SBMainSwitcherControllerCoordinator activeTransientOverlayPresentedAppLayoutForSwitcherContentController:](self, "activeTransientOverlayPresentedAppLayoutForSwitcherContentController:", v23), v24 = (void *)objc_claimAutoreleasedReturnValue(), v25 = v24 == 0, v24, v25))
      {
        -[SBMainSwitcherControllerCoordinator _rebuildAppListCache](self, "_rebuildAppListCache");
      }
      else
      {
        v26[0] = v9;
        v26[1] = 3221225472;
        v26[2] = __97__SBMainSwitcherControllerCoordinator_addAppLayoutForTransientOverlayViewController_windowScene___block_invoke_2;
        v26[3] = &unk_1E8E9DED8;
        v26[4] = self;
        -[SBMainSwitcherControllerCoordinator _insertAppLayout:atIndex:contentViewController:modelMutationBlock:completion:](self, "_insertAppLayout:atIndex:contentViewController:modelMutationBlock:completion:", v17, 0, v23, v26, 0);
      }

    }
  }

  _Block_object_dispose(&v30, 8);
}

uint64_t __97__SBMainSwitcherControllerCoordinator_addAppLayoutForTransientOverlayViewController_windowScene___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (*(_QWORD *)(result + 32) == a3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __97__SBMainSwitcherControllerCoordinator_addAppLayoutForTransientOverlayViewController_windowScene___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rebuildAppListCache");
}

- (BOOL)_hasAppLayoutContainingDisplayItem:(id)a3
{
  id v4;
  SBAppSwitcherModel *mainSwitcherModel;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  mainSwitcherModel = self->_mainSwitcherModel;
  objc_msgSend(v4, "bundleIdentifier", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherModel appLayoutsForBundleIdentifier:includingHiddenAppLayouts:](mainSwitcherModel, "appLayoutsForBundleIdentifier:includingHiddenAppLayouts:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "containsItem:", v4) & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)addAppLayoutForDisplayItem:(id)a3 windowScene:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  SBAppLayout *v13;
  void *v14;
  void *v15;
  SBAppLayout *v16;
  SBAppLayout *v17;
  _QWORD v18[5];
  SBAppLayout *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  if (-[SBMainSwitcherControllerCoordinator _hasAppLayoutContainingDisplayItem:](self, "_hasAppLayoutContainingDisplayItem:", v8))
  {
    if (v10)
      v10[2](v10, 1, 0);
  }
  else
  {
    -[SBMainSwitcherControllerCoordinator switcherControllerForWindowScene:](self, "switcherControllerForWindowScene:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [SBAppLayout alloc];
    v20 = &unk_1E91D1130;
    v21[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v13, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v14, 1, 1, objc_msgSend(v15, "displayOrdinal"));

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __89__SBMainSwitcherControllerCoordinator_addAppLayoutForDisplayItem_windowScene_completion___block_invoke;
    v18[3] = &unk_1E8E9E820;
    v18[4] = self;
    v19 = v16;
    v17 = v16;
    -[SBMainSwitcherControllerCoordinator _insertAppLayout:atIndex:contentViewController:modelMutationBlock:completion:](self, "_insertAppLayout:atIndex:contentViewController:modelMutationBlock:completion:", v17, 0, v12, v18, v10);

  }
}

uint64_t __89__SBMainSwitcherControllerCoordinator_addAppLayoutForDisplayItem_windowScene_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "addToFront:", *(_QWORD *)(a1 + 40));
}

- (void)removeAppLayoutForDisplayItem:(id)a3 shouldDestroyScene:(BOOL)a4
{
  id v7;
  void *v8;
  SBAppSwitcherModel *mainSwitcherModel;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[SBMainSwitcherControllerCoordinator _appLayoutContainingDisplayItem:](self, "_appLayoutContainingDisplayItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a4)
    {
      -[SBMainSwitcherControllerCoordinator deleteAppLayoutForDisplayItem:](self, "deleteAppLayoutForDisplayItem:", v7);
    }
    else
    {
      if (-[SBMainSwitcherControllerCoordinator isAnySwitcherVisible](self, "isAnySwitcherVisible"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainSwitcherControllerCoordinator.m"), 1792, CFSTR("Tried to remove app layout %@ without destroying scene while a switcher was visible. This is not supported."), v8);

      }
      mainSwitcherModel = self->_mainSwitcherModel;
      v12[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBAppSwitcherModel removeAppLayouts:](mainSwitcherModel, "removeAppLayouts:", v10);

      -[SBMainSwitcherControllerCoordinator _rebuildAppListCache](self, "_rebuildAppListCache");
    }
  }

}

- (void)addCenterRoleAppLayoutForDisplayItem:(id)a3 windowScene:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  SBAppLayout *v13;
  void *v14;
  void *v15;
  void *v16;
  SBAppLayout *v17;
  SBAppLayout *v18;
  _QWORD v19[5];
  SBAppLayout *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  if (-[SBMainSwitcherControllerCoordinator _hasAppLayoutContainingDisplayItem:](self, "_hasAppLayoutContainingDisplayItem:", v8))
  {
    if (v10)
      v10[2](v10, 1, 0);
  }
  else
  {
    -[SBMainSwitcherControllerCoordinator switcherControllerForWindowScene:](self, "switcherControllerForWindowScene:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [SBAppLayout alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v14;
    v22[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v13, "initWithItemsForLayoutRoles:configuration:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v15, 1, 1, 3, 0, objc_msgSend(v16, "displayOrdinal"));

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __99__SBMainSwitcherControllerCoordinator_addCenterRoleAppLayoutForDisplayItem_windowScene_completion___block_invoke;
    v19[3] = &unk_1E8E9E820;
    v19[4] = self;
    v20 = v17;
    v18 = v17;
    -[SBMainSwitcherControllerCoordinator _insertAppLayout:atIndex:contentViewController:modelMutationBlock:completion:](self, "_insertAppLayout:atIndex:contentViewController:modelMutationBlock:completion:", v18, 0, v12, v19, v10);

  }
}

uint64_t __99__SBMainSwitcherControllerCoordinator_addCenterRoleAppLayoutForDisplayItem_windowScene_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "addToFront:", *(_QWORD *)(a1 + 40));
}

- (BOOL)hasAppLayoutForDisplayItem:(id)a3
{
  void *v3;
  BOOL v4;

  -[SBMainSwitcherControllerCoordinator _appLayoutContainingDisplayItem:](self, "_appLayoutContainingDisplayItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)deleteAppLayoutForDisplayItem:(id)a3
{
  id v4;
  SBSwitcherDisplayItemRemovalResolutionRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v4 = a3;
  v5 = objc_alloc_init(SBSwitcherDisplayItemRemovalResolutionRequest);
  -[SBSwitcherDisplayItemRemovalResolutionRequest setRemovalIntentType:forDisplayItem:](v5, "setRemovalIntentType:forDisplayItem:", 1, v4);

  -[SBMainSwitcherControllerCoordinator _resultsForDisplayItemRemovalResolutionRequest:preferredAppLayoutForRemovalAnimationIfAny:](self, "_resultsForDisplayItemRemovalResolutionRequest:preferredAppLayoutForRemovalAnimationIfAny:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SBMainSwitcherControllerCoordinator _modelRemovalRequestForDisplayItemResolutionResults:](self, "_modelRemovalRequestForDisplayItemResolutionResults:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainSwitcherControllerCoordinator _switcherModelRemovalResultsForRequest:forReason:](self, "_switcherModelRemovalResultsForRequest:forReason:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appLayouts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    v11 = v10 != 0;

    if (v10)
      -[SBMainSwitcherControllerCoordinator _performSceneDestructionForModelRemovalResults:](self, "_performSceneDestructionForModelRemovalResults:", v8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)acquireAllowHiddenAppAssertionForBundleIdentifier:(id)a3 reason:(id)a4
{
  SBAppSwitcherModel *mainSwitcherModel;
  id v6;
  id v7;
  void *v8;
  void *v9;

  mainSwitcherModel = self->_mainSwitcherModel;
  v6 = a4;
  v7 = a3;
  -[SBAppSwitcherModel _recentAppLayoutsController](mainSwitcherModel, "_recentAppLayoutsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_acquireAllowHiddenAppAssertionForBundleIdentifier:reason:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)hasAppLayoutForTransientOverlayViewController:(id)a3 windowScene:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *appLayoutToEligibleTransientOverlayViewController;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__62;
  v18 = __Block_byref_object_dispose__62;
  v19 = 0;
  appLayoutToEligibleTransientOverlayViewController = self->_appLayoutToEligibleTransientOverlayViewController;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __97__SBMainSwitcherControllerCoordinator_hasAppLayoutForTransientOverlayViewController_windowScene___block_invoke;
  v11[3] = &unk_1E8EB1350;
  v9 = v6;
  v12 = v9;
  v13 = &v14;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appLayoutToEligibleTransientOverlayViewController, "enumerateKeysAndObjectsUsingBlock:", v11);
  LOBYTE(v6) = v15[5] != 0;

  _Block_object_dispose(&v14, 8);
  return (char)v6;
}

void __97__SBMainSwitcherControllerCoordinator_hasAppLayoutForTransientOverlayViewController_windowScene___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  id v9;

  v8 = a2;
  if (*(_QWORD *)(a1 + 32) == a3)
  {
    v9 = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v8 = v9;
    *a4 = 1;
  }

}

- (BOOL)hasTransientOverlayAppLayoutsForWindowScene:(id)a3
{
  return -[NSMutableDictionary count](self->_appLayoutToEligibleTransientOverlayViewController, "count", a3) != 0;
}

- (void)removeAppLayoutTransientOverlayViewController:(id)a3 windowScene:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *appLayoutToEligibleTransientOverlayViewController;
  id v9;
  NSMutableDictionary *v10;
  SBSwitcherModelRemovalRequest *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t, _BYTE *);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__62;
  v24 = __Block_byref_object_dispose__62;
  v25 = 0;
  appLayoutToEligibleTransientOverlayViewController = self->_appLayoutToEligibleTransientOverlayViewController;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __97__SBMainSwitcherControllerCoordinator_removeAppLayoutTransientOverlayViewController_windowScene___block_invoke;
  v17 = &unk_1E8EB1350;
  v9 = v6;
  v18 = v9;
  v19 = &v20;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appLayoutToEligibleTransientOverlayViewController, "enumerateKeysAndObjectsUsingBlock:", &v14);
  if (v21[5])
  {
    -[NSMutableDictionary removeObjectForKey:](self->_appLayoutToEligibleTransientOverlayViewController, "removeObjectForKey:", v14, v15, v16, v17);
    if (!-[NSMutableDictionary count](self->_appLayoutToEligibleTransientOverlayViewController, "count"))
    {
      v10 = self->_appLayoutToEligibleTransientOverlayViewController;
      self->_appLayoutToEligibleTransientOverlayViewController = 0;

    }
    v11 = objc_alloc_init(SBSwitcherModelRemovalRequest);
    +[SBSwitcherModelRemovalRequestAction defaultRemovalPolicyAction](SBSwitcherModelRemovalRequestAction, "defaultRemovalPolicyAction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherModelRemovalRequest setAction:forAppLayout:](v11, "setAction:forAppLayout:", v12, v21[5]);

    -[SBMainSwitcherControllerCoordinator _switcherModelRemovalResultsForRequest:forReason:](self, "_switcherModelRemovalResultsForRequest:forReason:", v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainSwitcherControllerCoordinator _performSceneDestructionForModelRemovalResults:](self, "_performSceneDestructionForModelRemovalResults:", v13);

  }
  -[SBMainSwitcherControllerCoordinator _removeAcquiredTransientOverlayViewController:windowScene:](self, "_removeAcquiredTransientOverlayViewController:windowScene:", v9, v7, v14, v15, v16, v17);

  _Block_object_dispose(&v20, 8);
}

void __97__SBMainSwitcherControllerCoordinator_removeAppLayoutTransientOverlayViewController_windowScene___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  id v9;

  v8 = a2;
  if (*(_QWORD *)(a1 + 32) == a3)
  {
    v9 = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v8 = v9;
    *a4 = 1;
  }

}

- (void)configureSwitcherStateForAccidentalActivationMitigationSession:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  uint64_t v7;
  NSMapTable *previousLayoutStatesByWindowScene;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(_QWORD);
  _QWORD block[4];
  void (**v20)(_QWORD);
  _QWORD v21[5];
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  v7 = objc_msgSend(a3, "state");
  if (v7 == 3)
  {
    v18 = v6;
    v9 = dispatch_group_create();
    self->_outstandingAccidentalActivationMitigationTransitionCount = -[NSMapTable count](self->_previousLayoutStatesByWindowScene, "count");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = (void *)-[NSMapTable copy](self->_previousLayoutStatesByWindowScene, "copy");
    objc_msgSend(v10, "keyEnumerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    v13 = MEMORY[0x1E0C809B0];
    if (v12)
    {
      v14 = v12;
      v15 = *(_QWORD *)v24;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v11);
          v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16);
          dispatch_group_enter(v9);
          v21[0] = v13;
          v21[1] = 3221225472;
          v21[2] = __113__SBMainSwitcherControllerCoordinator_configureSwitcherStateForAccidentalActivationMitigationSession_completion___block_invoke;
          v21[3] = &unk_1E8E9E820;
          v21[4] = self;
          v22 = v9;
          -[SBMainSwitcherControllerCoordinator _restoreLayoutStateSnapshotForWindowScene:completion:](self, "_restoreLayoutStateSnapshotForWindowScene:completion:", v17, v21);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __113__SBMainSwitcherControllerCoordinator_configureSwitcherStateForAccidentalActivationMitigationSession_completion___block_invoke_2;
    block[3] = &unk_1E8E9E8D0;
    v6 = v18;
    v20 = v18;
    dispatch_group_notify(v9, MEMORY[0x1E0C80D38], block);

  }
  else if (v7 == 2)
  {
    -[SBAppSwitcherModel clearAppLayoutsSnapshot](self->_mainSwitcherModel, "clearAppLayoutsSnapshot");
    previousLayoutStatesByWindowScene = self->_previousLayoutStatesByWindowScene;
    self->_previousLayoutStatesByWindowScene = 0;

    v6[2](v6);
  }

}

void __113__SBMainSwitcherControllerCoordinator_configureSwitcherStateForAccidentalActivationMitigationSession_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 440);
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 440))
  {
    objc_msgSend(*(id *)(v2 + 216), "restoreAppLayoutsSnapshot");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "clearAppLayoutsSnapshot");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __113__SBMainSwitcherControllerCoordinator_configureSwitcherStateForAccidentalActivationMitigationSession_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_takeLayoutStateSnapshotForWindowScene:(id)a3 withPreviousLayoutState:(id)a4
{
  id v6;
  NSMapTable *previousLayoutStatesByWindowScene;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  previousLayoutStatesByWindowScene = self->_previousLayoutStatesByWindowScene;
  if (!previousLayoutStatesByWindowScene)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_previousLayoutStatesByWindowScene;
    self->_previousLayoutStatesByWindowScene = v8;

    previousLayoutStatesByWindowScene = self->_previousLayoutStatesByWindowScene;
  }
  -[NSMapTable setObject:forKey:](previousLayoutStatesByWindowScene, "setObject:forKey:", v6, v10);

}

- (void)_restoreLayoutStateSnapshotForWindowScene:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void (**v15)(void);
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(void);
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(void);
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSMapTable objectForKey:](self->_previousLayoutStatesByWindowScene, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v8, "elements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "entityGenerator");
        v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v15[2]();
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "addObject:", v16);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v12);
  }

  objc_msgSend(v8, "elementWithRole:", 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "entityGenerator");
    v19 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v19[2]();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v8, "elementWithRole:", 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "entityGenerator");
    v23 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v23[2]();
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = 0;
  }
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_fbsDisplayConfiguration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __92__SBMainSwitcherControllerCoordinator__restoreLayoutStateSnapshotForWindowScene_completion___block_invoke;
  v31[3] = &unk_1E8E9F770;
  v32 = v9;
  v33 = v20;
  v34 = v24;
  v35 = v7;
  v27 = v7;
  v28 = v24;
  v29 = v20;
  v30 = v9;
  objc_msgSend(v25, "requestTransitionWithOptions:displayConfiguration:builder:", 0, v26, v31);

}

void __92__SBMainSwitcherControllerCoordinator__restoreLayoutStateSnapshotForWindowScene_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 71);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __92__SBMainSwitcherControllerCoordinator__restoreLayoutStateSnapshotForWindowScene_completion___block_invoke_2;
  v4[3] = &unk_1E8EB1378;
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  objc_msgSend(v3, "modifyApplicationContext:", v4);

}

void __92__SBMainSwitcherControllerCoordinator__restoreLayoutStateSnapshotForWindowScene_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  objc_msgSend(v3, "setAnimationDisabled:", 1);
  objc_msgSend(v3, "setEntities:withPolicy:centerEntity:floatingEntity:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __92__SBMainSwitcherControllerCoordinator__restoreLayoutStateSnapshotForWindowScene_completion___block_invoke_3;
  v4[3] = &unk_1E8E9F598;
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v3, "setResultBlock:", v4);

}

uint64_t __92__SBMainSwitcherControllerCoordinator__restoreLayoutStateSnapshotForWindowScene_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_clearLayoutStateSnapshotForWindowScene:(id)a3
{
  NSMapTable *previousLayoutStatesByWindowScene;

  -[NSMapTable removeObjectForKey:](self->_previousLayoutStatesByWindowScene, "removeObjectForKey:", a3);
  if (!-[NSMapTable count](self->_previousLayoutStatesByWindowScene, "count"))
  {
    previousLayoutStatesByWindowScene = self->_previousLayoutStatesByWindowScene;
    self->_previousLayoutStatesByWindowScene = 0;

  }
}

- (void)addAcquiredTransientOverlayViewController:(id)a3 forAppLayout:(id)a4 windowScene:(id)a5
{
  NSMutableDictionary *appLayoutToAcquiredTransientOverlayViewController;
  id v9;
  id v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  appLayoutToAcquiredTransientOverlayViewController = self->_appLayoutToAcquiredTransientOverlayViewController;
  v9 = a5;
  v10 = a4;
  -[NSMutableDictionary allValues](appLayoutToAcquiredTransientOverlayViewController, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(appLayoutToAcquiredTransientOverlayViewController) = objc_msgSend(v11, "containsObject:", v17);

  if ((appLayoutToAcquiredTransientOverlayViewController & 1) == 0)
    objc_msgSend(v17, "beginIgnoringContentOverlayInsetUpdates");
  v12 = self->_appLayoutToAcquiredTransientOverlayViewController;
  if (!v12)
  {
    v13 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v14 = self->_appLayoutToAcquiredTransientOverlayViewController;
    self->_appLayoutToAcquiredTransientOverlayViewController = v13;

    v12 = self->_appLayoutToAcquiredTransientOverlayViewController;
  }
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v17, v10);
  -[SBMainSwitcherControllerCoordinator switcherControllerForWindowScene:](self, "switcherControllerForWindowScene:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "contentViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "acquiredViewController:forTransientOverlayAppLayout:", v17, v10);

}

- (BOOL)isAcquiredTransientOverlayViewController:(id)a3 windowScene:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *appLayoutToAcquiredTransientOverlayViewController;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  appLayoutToAcquiredTransientOverlayViewController = self->_appLayoutToAcquiredTransientOverlayViewController;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92__SBMainSwitcherControllerCoordinator_isAcquiredTransientOverlayViewController_windowScene___block_invoke;
  v11[3] = &unk_1E8EB1350;
  v9 = v6;
  v12 = v9;
  v13 = &v14;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appLayoutToAcquiredTransientOverlayViewController, "enumerateKeysAndObjectsUsingBlock:", v11);
  LOBYTE(v6) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)v6;
}

uint64_t __92__SBMainSwitcherControllerCoordinator_isAcquiredTransientOverlayViewController_windowScene___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (*(_QWORD *)(result + 32) == a3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)enumerateTransientOverlayViewControllersUsingBlock:(id)a3 windowScene:(id)a4
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_appLayoutToEligibleTransientOverlayViewController, "enumerateKeysAndObjectsUsingBlock:", a3, a4);
}

- (void)_removeAcquiredTransientOverlayViewController:(id)a3 windowScene:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *appLayoutToAcquiredTransientOverlayViewController;
  id v9;
  NSMutableDictionary *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t, _BYTE *);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__62;
  v25 = __Block_byref_object_dispose__62;
  v26 = 0;
  appLayoutToAcquiredTransientOverlayViewController = self->_appLayoutToAcquiredTransientOverlayViewController;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __97__SBMainSwitcherControllerCoordinator__removeAcquiredTransientOverlayViewController_windowScene___block_invoke;
  v18 = &unk_1E8EB1350;
  v9 = v6;
  v19 = v9;
  v20 = &v21;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appLayoutToAcquiredTransientOverlayViewController, "enumerateKeysAndObjectsUsingBlock:", &v15);
  if (v22[5])
  {
    -[NSMutableDictionary removeObjectForKey:](self->_appLayoutToAcquiredTransientOverlayViewController, "removeObjectForKey:", v15, v16, v17, v18);
    if (!-[NSMutableDictionary count](self->_appLayoutToAcquiredTransientOverlayViewController, "count"))
    {
      v10 = self->_appLayoutToAcquiredTransientOverlayViewController;
      self->_appLayoutToAcquiredTransientOverlayViewController = 0;

    }
    -[NSMutableDictionary allValues](self->_appLayoutToAcquiredTransientOverlayViewController, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v9);

    if ((v12 & 1) == 0)
      objc_msgSend(v9, "endIgnoringContentOverlayInsetUpdates");
    -[SBMainSwitcherControllerCoordinator switcherControllerForWindowScene:](self, "switcherControllerForWindowScene:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "relinquishTransientOverlayViewController:", v9);

  }
  _Block_object_dispose(&v21, 8);

}

void __97__SBMainSwitcherControllerCoordinator__removeAcquiredTransientOverlayViewController_windowScene___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  id v9;

  v8 = a2;
  if (*(_QWORD *)(a1 + 32) == a3)
  {
    v9 = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v8 = v9;
    *a4 = 1;
  }

}

- (void)_configureRequest:(id)a3 forSwitcherTransitionRequest:(id)a4 withEventLabel:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  SBWorkspaceApplicationSceneTransitionContext *v22;
  void *v23;
  void *v24;
  void *v25;
  _UNKNOWN **v26;
  void *v27;
  int v28;
  int IsYes;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  SBWorkspaceApplicationSceneTransitionContext *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  SBWorkspaceApplicationSceneTransitionContext *v54;
  _BOOL4 v55;
  void *v56;
  uint64_t v57;
  SBWorkspaceApplicationSceneTransitionContext *v58;
  void *v59;
  _UNKNOWN **v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  uint64_t v67;
  int v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t i;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  uint64_t v94;
  BOOL v95;
  unsigned int v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  char v101;
  uint64_t v102;
  NSUInteger v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  id v109;
  uint64_t v110;
  _BOOL4 v111;
  _BOOL4 v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v121;
  uint64_t v122;
  id v123;
  void *v124;
  void *v125;
  SBWorkspaceTransientOverlayTransitionContext *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _QWORD v134[4];
  SBWorkspaceApplicationSceneTransitionContext *v135;
  _QWORD v136[4];
  SBWorkspaceApplicationSceneTransitionContext *v137;
  _QWORD v138[4];
  SBWorkspaceApplicationSceneTransitionContext *v139;
  SBMainSwitcherControllerCoordinator *v140;
  id v141;
  _QWORD v142[4];
  id v143;
  _QWORD v144[4];
  id v145;
  uint64_t v146;
  uint64_t v147;
  _QWORD v148[2];
  _QWORD v149[2];
  _BYTE v150[128];
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v114 = a5;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "windowSceneForDisplayIdentity:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v115 = (void *)v12;
  -[SBMainSwitcherControllerCoordinator switcherControllerForWindowScene:](self, "switcherControllerForWindowScene:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentViewController");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v13;
  if (objc_msgSend(v13, "windowManagementStyle") == 1 || objc_msgSend(v14, "environment") != 2)
  {
    v129 = v14;
  }
  else
  {
    objc_msgSend(v14, "appLayoutByModifyingEnvironment:", 1);
    v15 = objc_claimAutoreleasedReturnValue();

    v129 = (void *)v15;
  }
  v16 = objc_msgSend(v9, "appLayoutEnvironment");
  v17 = objc_msgSend(v9, "unlockedEnvironmentMode");
  v18 = objc_msgSend(v9, "floatingConfiguration");
  v19 = objc_msgSend(v9, "floatingSwitcherVisible");
  v20 = objc_msgSend(v9, "peekConfiguration");
  objc_msgSend(v9, "bundleIdentifierForAppExpose");
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayIdentity");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activatingDisplayItem");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "itemForLayoutRole:");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "itemForLayoutRole:", 4);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "itemForLayoutRole:");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v16;
  if (!v16)
    v122 = objc_msgSend(v129, "environment");
  v22 = objc_alloc_init(SBWorkspaceApplicationSceneTransitionContext);
  objc_msgSend(v8, "setApplicationContext:", v22);
  v126 = objc_alloc_init(SBWorkspaceTransientOverlayTransitionContext);
  v127 = v17;
  -[SBWorkspaceApplicationSceneTransitionContext setRequestedUnlockedEnvironmentMode:](v22, "setRequestedUnlockedEnvironmentMode:", v17);
  -[SBWorkspaceApplicationSceneTransitionContext setRequestedFloatingConfiguration:](v22, "setRequestedFloatingConfiguration:", v18);
  -[SBWorkspaceApplicationSceneTransitionContext setRequestedFloatingSwitcherVisible:](v22, "setRequestedFloatingSwitcherVisible:", v19);
  objc_msgSend(v9, "animationDisabled");
  -[SBWorkspaceTransitionContext setAnimationDisabled:](v22, "setAnimationDisabled:", BSSettingFlagIsYes());
  -[SBWorkspaceApplicationSceneTransitionContext setRequestedPeekConfiguration:](v22, "setRequestedPeekConfiguration:", v20);
  v125 = (void *)v21;
  -[SBWorkspaceApplicationSceneTransitionContext setRequestedAppExposeBundleID:](v22, "setRequestedAppExposeBundleID:", v21);
  objc_msgSend(v9, "autoPIPDisabled");
  -[SBWorkspaceApplicationSceneTransitionContext setDisablesAutoPIP:](v22, "setDisablesAutoPIP:", BSSettingFlagIsYes());
  -[SBWorkspaceApplicationSceneTransitionContext setFencesAnimations:](v22, "setFencesAnimations:", objc_msgSend(v9, "fenceSceneUpdate"));
  -[SBWorkspaceApplicationSceneTransitionContext setRetainsSiri:](v22, "setRetainsSiri:", objc_msgSend(v9, "retainsSiri"));
  objc_msgSend(v9, "animationSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v146 = 0;
    v147 = 0;
    objc_msgSend(v23, "dampingRatio");
    objc_msgSend(v24, "response");
    convertDampingRatioAndResponseToTensionAndFriction();
    objc_msgSend(MEMORY[0x1E0D01870], "settingsWithMass:stiffness:damping:", 1.0, 0.0, 0.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWorkspaceTransitionContext setAnimationSettings:](v22, "setAnimationSettings:", v25);

  }
  v113 = v24;
  v26 = &off_1E8E94000;
  v27 = v129;
  if (v127 == 2)
  {
    v28 = 1;
  }
  else
  {
    IsYes = BSSettingFlagIsYes();
    if (v127 == 1)
    {
LABEL_16:
      +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBWorkspaceApplicationSceneTransitionContext setActivatingEntity:](v22, "setActivatingEntity:", v33);
      goto LABEL_17;
    }
    v28 = IsYes;
    v26 = &off_1E8E94000;
  }
  objc_msgSend(v26[350], "homeScreenAppLayout");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v129, "isEqual:", v30))
  {

    goto LABEL_16;
  }
  +[SBDisplayItem homeScreenDisplayItem](SBDisplayItem, "homeScreenDisplayItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v124, "isEqual:", v31);

  v27 = v129;
  if (v32)
    goto LABEL_16;
  if (v28)
  {
    -[SBMainSwitcherControllerCoordinator activeTransientOverlayPresentedAppLayoutForSwitcherContentController:](self, "activeTransientOverlayPresentedAppLayoutForSwitcherContentController:", v119);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      -[SBMainSwitcherControllerCoordinator createWorkspaceTransientOverlayForAppLayout:](self, "createWorkspaceTransientOverlayForAppLayout:", v33);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v41 != 0;
      if (v41)
      {
        -[SBWorkspaceTransientOverlayTransitionContext setTransientOverlay:](v126, "setTransientOverlay:", v41);
        -[SBWorkspaceTransientOverlayTransitionContext setTransitionType:](v126, "setTransitionType:", 1);
      }

      goto LABEL_18;
    }
LABEL_17:
    v34 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v34 = 0;
  if (v124 && v129)
  {
    if (objc_msgSend(v129, "containsItem:", v124))
    {
      objc_msgSend(v115, "sceneManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "displayIdentity");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBMainSwitcherControllerCoordinator _entityForDisplayItem:sceneHandleProvider:displayIdentity:](self, "_entityForDisplayItem:sceneHandleProvider:displayIdentity:", v124, v33, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBWorkspaceApplicationSceneTransitionContext setActivatingEntity:](v22, "setActivatingEntity:", v49);
      v144[0] = MEMORY[0x1E0C809B0];
      v144[1] = 3221225472;
      v144[2] = __101__SBMainSwitcherControllerCoordinator__configureRequest_forSwitcherTransitionRequest_withEventLabel___block_invoke;
      v144[3] = &unk_1E8E9E980;
      v145 = v49;
      v50 = v49;
      v51 = (id)objc_msgSend(v8, "addCompletionHandler:", v144);

      goto LABEL_17;
    }
    v34 = 0;
  }
LABEL_19:
  if (!v128)
    goto LABEL_38;
  if (objc_msgSend(v128, "type") != 2)
  {
    if (objc_msgSend(v128, "type") == 4)
    {
      objc_msgSend(v128, "appSuggestion");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v35, "isSiriSuggestion"))
      {
        v39 = v34;
        +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v22, "setEntity:forLayoutRole:", v40, 1);
        v37 = v125;
      }
      else
      {
        v37 = v125;
        if (objc_msgSend(v35, "isCallContinuitySuggestion")
          && !+[SBInCallPresentationManager isSpecializedAPISupported](SBInCallPresentationManager, "isSpecializedAPISupported"))
        {
          -[SBMainSwitcherControllerCoordinator _entityForDisplayItem:displayIdentity:](self, "_entityForDisplayItem:displayIdentity:", v128, v121);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBWorkspaceTransientOverlayTransitionContext setTransientOverlay:](v126, "setTransientOverlay:", v40);
          -[SBWorkspaceTransientOverlayTransitionContext setTransitionType:](v126, "setTransitionType:", 0);
          v142[0] = MEMORY[0x1E0C809B0];
          v142[1] = 3221225472;
          v142[2] = __101__SBMainSwitcherControllerCoordinator__configureRequest_forSwitcherTransitionRequest_withEventLabel___block_invoke_2;
          v142[3] = &unk_1E8E9E980;
          v143 = v35;
          v65 = (id)objc_msgSend(v8, "addCompletionHandler:", v142);

          v39 = 1;
        }
        else
        {
          v39 = v34;
          if (objc_msgSend(v35, "isCallContinuitySuggestion"))
          {
            +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "inCallPresentationManager");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "uniqueIdentifier");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "handlePresentationForActivityContinuationIdentifier:", v53);

            v37 = v125;
          }
          else
          {
            -[SBMainSwitcherControllerCoordinator _entityForDisplayItem:displayIdentity:](self, "_entityForDisplayItem:displayIdentity:", v128, v121);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "launchURL");
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            v60 = &off_1E8E94000;
            if (v59)
            {
              objc_msgSend(v35, "launchURL");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v35, "launchURLRequiresInboxCopy"))
              {
                objc_msgSend(v40, "application");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "info");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "documentInboxURL");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "makeInboxCopyOfLaunchURLToInboxURL:", v64);
                v110 = objc_claimAutoreleasedReturnValue();

                v27 = v129;
                v60 = &off_1E8E94000;

                v37 = v125;
                v61 = (void *)v110;
              }
              objc_msgSend(v40, "setObject:forActivationSetting:", v61, 5);
            }
            else
            {
              v70 = objc_alloc(MEMORY[0x1E0CEA2C0]);
              objc_msgSend(v35, "uniqueIdentifier");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "UUIDString");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "activityType");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = (void *)objc_msgSend(v70, "initWithIdentifier:activityTypeIdentifier:appSuggestion:", v72, v73, v35);

              v27 = v129;
              v60 = &off_1E8E94000;

              objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v61);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "addActions:", v74);

              +[SBAppSuggestionManager sharedInstance](SBAppSuggestionManager, "sharedInstance");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "startFetchingPayloadForAppSuggestion:", v35);

              v37 = v125;
            }

            objc_msgSend(v60[363], "sharedInstance");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "noteActivatingForAppSuggestion:fromSource:", v35, 1);

            -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v22, "setEntity:forLayoutRole:", v40, 1);
          }
        }
      }

      +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v22, "setEntity:forLayoutRole:", v77, 2);

      v36 = 0;
      v38 = v122;
      v34 = v39;
      goto LABEL_71;
    }
    if (!objc_msgSend(v128, "type") || objc_msgSend(v128, "type") == 5 || objc_msgSend(v128, "type") == 3)
    {
      objc_msgSend(v8, "displayIdentity");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBMainSwitcherControllerCoordinator _entityForDisplayItem:displayIdentity:](self, "_entityForDisplayItem:displayIdentity:", v128, v42);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = v122;
      switch(v122)
      {
        case 3:
          v134[0] = MEMORY[0x1E0C809B0];
          v134[1] = 3221225472;
          v134[2] = __101__SBMainSwitcherControllerCoordinator__configureRequest_forSwitcherTransitionRequest_withEventLabel___block_invoke_5;
          v134[3] = &unk_1E8EA2880;
          v54 = v22;
          v135 = v54;
          SBLayoutRoleEnumerateAppLayoutRoles(v134);
          -[SBMainSwitcherControllerCoordinator _entityForDisplayItem:displayIdentity:](self, "_entityForDisplayItem:displayIdentity:", v128, v121);
          v55 = v34;
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v54, "setEntity:forLayoutRole:", v56, 4);
          v57 = SBMainDisplayLayoutStateCenterConfigurationFromAppLayoutCenterConfiguration(objc_msgSend(v27, "centerConfiguration"));
          v58 = v54;
          v38 = 3;
          -[SBWorkspaceApplicationSceneTransitionContext setRequestedCenterConfiguration:](v58, "setRequestedCenterConfiguration:", v57);

          v34 = v55;
          v36 = 0;
          v44 = v135;
          break;
        case 2:
          -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v22, "setEntity:forLayoutRole:", v35, 3);
          v136[0] = MEMORY[0x1E0C809B0];
          v136[1] = 3221225472;
          v136[2] = __101__SBMainSwitcherControllerCoordinator__configureRequest_forSwitcherTransitionRequest_withEventLabel___block_invoke_4;
          v136[3] = &unk_1E8EA2880;
          v137 = v22;
          SBLayoutRoleEnumerateAppLayoutRoles(v136);
          v36 = 0;
          v44 = v137;
          break;
        case 1:
          v43 = (void *)objc_opt_new();
          v138[0] = MEMORY[0x1E0C809B0];
          v138[1] = 3221225472;
          v138[2] = __101__SBMainSwitcherControllerCoordinator__configureRequest_forSwitcherTransitionRequest_withEventLabel___block_invoke_3;
          v138[3] = &unk_1E8EA4E00;
          v44 = v43;
          v139 = v44;
          v140 = self;
          v45 = v27;
          v46 = v121;
          v141 = v46;
          objc_msgSend(v45, "enumerate:", v138);
          -[SBWorkspaceApplicationSceneTransitionContext setRequestedSpaceConfiguration:](v22, "setRequestedSpaceConfiguration:", SBMainDisplayLayoutStateSpaceConfigurationFromAppLayoutConfiguration(objc_msgSend(v45, "configuration")));
          if (v117)
          {
            -[SBMainSwitcherControllerCoordinator _entityForDisplayItem:displayIdentity:](self, "_entityForDisplayItem:displayIdentity:", v117, v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBWorkspaceApplicationSceneTransitionContext setRequestedCenterConfiguration:](v22, "setRequestedCenterConfiguration:", SBMainDisplayLayoutStateCenterConfigurationFromAppLayoutCenterConfiguration(objc_msgSend(v45, "centerConfiguration")));
          }
          else
          {
            v47 = 0;
          }
          v111 = v34;
          if (v116)
            -[SBMainSwitcherControllerCoordinator _entityForDisplayItem:displayIdentity:](self, "_entityForDisplayItem:displayIdentity:", v116, v46);
          else
            +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", 3);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v129;
          v67 = objc_msgSend(v9, "entityInsertionPolicy");
          -[SBWorkspaceApplicationSceneTransitionContext setEntities:withPolicy:centerEntity:floatingEntity:](v22, "setEntities:withPolicy:centerEntity:floatingEntity:", v44, v67, v47, v66);
          v68 = objc_msgSend(v118, "isChamoisWindowingUIEnabled");
          if (v67 == 1)
            v36 = v68;
          else
            v36 = 0;
          if (v36 == 1)
          {
            -[SBWorkspaceApplicationSceneTransitionContext firstObject](v44, "firstObject");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBWorkspaceApplicationSceneTransitionContext _setRequestedFrontmostEntity:](v22, "_setRequestedFrontmostEntity:", v69);

          }
          v38 = 1;
          v34 = v111;
          break;
        default:
          v36 = 0;
LABEL_67:
          v37 = v125;
          goto LABEL_71;
      }

      goto LABEL_67;
    }
LABEL_38:
    v36 = 0;
    v37 = v125;
    v38 = v122;
    goto LABEL_72;
  }
  -[SBMainSwitcherControllerCoordinator _entityForDisplayItem:displayIdentity:](self, "_entityForDisplayItem:displayIdentity:", v128, v121);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransientOverlayTransitionContext setTransientOverlay:](v126, "setTransientOverlay:", v35);
  -[SBWorkspaceTransientOverlayTransitionContext setTransitionType:](v126, "setTransitionType:", 0);
  v36 = 0;
  v34 = 1;
  v37 = v125;
  v38 = v122;
LABEL_71:

LABEL_72:
  if (v38 == 1)
  {
    v112 = v34;
    v109 = v9;
    v123 = v8;
    v132 = 0u;
    v133 = 0u;
    v130 = 0u;
    v131 = 0u;
    objc_msgSend(v27, "itemsToLayoutAttributesMap");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v130, v150, 16);
    if (v79)
    {
      v80 = v79;
      v81 = *(_QWORD *)v131;
      do
      {
        for (i = 0; i != v80; ++i)
        {
          if (*(_QWORD *)v131 != v81)
            objc_enumerationMutation(v78);
          v83 = *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * i);
          objc_msgSend(v27, "itemsToLayoutAttributesMap");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "objectForKey:", v83);
          v85 = (void *)objc_claimAutoreleasedReturnValue();

          -[SBWorkspaceApplicationSceneTransitionContext entityForLayoutRole:](v22, "entityForLayoutRole:", objc_msgSend(v27, "layoutRoleForItem:", v83));
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          if (v86)
          {
            if (v36)
            {
              -[SBWorkspaceApplicationSceneTransitionContext requestedLayoutAttributesForEntity:](v22, "requestedLayoutAttributesForEntity:", v86);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "attributesByModifyingLastInteractionTime:", objc_msgSend(v87, "lastInteractionTime"));
              v88 = objc_claimAutoreleasedReturnValue();

              v85 = (void *)v88;
              v27 = v129;
            }
            -[SBWorkspaceApplicationSceneTransitionContext setRequestedLayoutAttributes:forEntity:](v22, "setRequestedLayoutAttributes:forEntity:", v85, v86);
          }

        }
        v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v130, v150, 16);
      }
      while (v80);
    }

    v8 = v123;
    v9 = v109;
    v37 = v125;
    v34 = v112;
  }
  v89 = objc_msgSend(v9, "source");
  if (v89)
  {
    v90 = v89;
    objc_msgSend(v8, "setSource:", v89);
    v91 = v127;
    if (v90 == 51)
    {
      objc_msgSend(v8, "applicationContext");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "activatingEntity");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setFlag:forActivationSetting:", 1, 61);

    }
  }
  else
  {
    v91 = v127;
    if (objc_msgSend(v27, "type") == 4)
      v94 = 10;
    else
      v94 = 3;
    objc_msgSend(v8, "setSource:", v94);
  }
  v95 = v91 == 2;
  v96 = !v34;
  if (v95)
    v97 = 0;
  else
    v97 = v96;
  -[SBWorkspaceApplicationSceneTransitionContext setWaitsForSceneUpdates:](v22, "setWaitsForSceneUpdates:", v97);
  if ((v96 & 1) == 0)
  {
    objc_msgSend(v8, "setTransientOverlayContext:", v126);
    +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v22, "setEntity:forLayoutRole:", v98, 1);

    +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v22, "setEntity:forLayoutRole:", v99, 2);

  }
  if (objc_msgSend(v114, "length"))
    objc_msgSend(v8, "setEventLabel:", v114);
  +[SBAppLayout homeScreenAppLayout](SBAppLayout, "homeScreenAppLayout");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v27, "isEqual:", v100);

  if ((v101 & 1) != 0)
  {
    v102 = -1;
  }
  else
  {
    v103 = -[NSArray indexOfObject:](self->_appLayouts, "indexOfObject:", v27);
    if (v103 == 0x7FFFFFFFFFFFFFFFLL)
      v102 = -1;
    else
      v102 = v103;
  }
  v148[0] = *MEMORY[0x1E0DABF40];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v102);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v148[1] = *MEMORY[0x1E0DABF48];
  v149[0] = v104;
  v149[1] = &unk_1E91D1148;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v149, v148, 2);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = (void *)MEMORY[0x1E0DA9D78];
  v107 = v105;
  objc_msgSend(v106, "sharedInstance");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "emitEvent:withPayload:", 14, v107);

}

void __101__SBMainSwitcherControllerCoordinator__configureRequest_forSwitcherTransitionRequest_withEventLabel___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "applicationSceneEntity");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sceneHandle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sceneIfExists");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      +[SBWorkspace mainWorkspace](SBMainWorkspace, "mainWorkspace");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "keyboardFocusController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userFocusRequestForScene:reason:completion:", v6, CFSTR("SwitcherTransitionRequest"), 0);

    }
  }
}

void __101__SBMainSwitcherControllerCoordinator__configureRequest_forSwitcherTransitionRequest_withEventLabel___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  id v5;

  if (a2)
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inCallTransientOverlayManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentTransientOverlayForActivityContinuationWithActivityIdentifier:", v4);

  }
}

void __101__SBMainSwitcherControllerCoordinator__configureRequest_forSwitcherTransitionRequest_withEventLabel___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (SBLayoutRoleIsValidForSplitView(a2))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_entityForDisplayItem:displayIdentity:", v7, *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

void __101__SBMainSwitcherControllerCoordinator__configureRequest_forSwitcherTransitionRequest_withEventLabel___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEntity:forLayoutRole:", v4, a2);

}

void __101__SBMainSwitcherControllerCoordinator__configureRequest_forSwitcherTransitionRequest_withEventLabel___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEntity:forLayoutRole:", v4, a2);

}

- (id)_appLayoutFromPrimaryLayoutItem:(id)a3 sideLayoutElement:(id)a4 configuration:(int64_t)a5
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  SBAppLayout *v11;
  id v12;
  void *v13;
  void *v14;
  int64_t v15;

  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  +[SBDisplayItem homeScreenDisplayItem](SBDisplayItem, "homeScreenDisplayItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend((id)v7, "isEqual:", v9);

  if (v10)
  {
    +[SBAppLayout homeScreenAppLayout](SBAppLayout, "homeScreenAppLayout");
    v11 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  }
  else if (v7 | v8)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, v13);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, v14);

    }
    v15 = 4;
    if (!v8)
      v15 = 1;
    if (!a5)
      a5 = v15;
    v11 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:]([SBAppLayout alloc], "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v12, a5, 1, 0);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_appLayoutContainingDisplayItem:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_appLayouts;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "containsItem:", v4, (_QWORD)v11))
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_entityForDisplayItem:(id)a3 displayIdentity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sceneManagerForDisplayIdentity:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBMainSwitcherControllerCoordinator _entityForDisplayItem:sceneHandleProvider:displayIdentity:](self, "_entityForDisplayItem:sceneHandleProvider:displayIdentity:", v7, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_entityForDisplayItem:(id)a3 switcherController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(a4, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "displayIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainSwitcherControllerCoordinator _entityForDisplayItem:sceneHandleProvider:displayIdentity:](self, "_entityForDisplayItem:sceneHandleProvider:displayIdentity:", v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_entityForDisplayItem:(id)a3 sceneHandleProvider:(id)a4 displayIdentity:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  SBDeviceApplicationSceneEntity *v17;
  void *v18;
  SBAppClipPlaceholderWorkspaceEntity *v19;
  void *v20;
  SBAppClipPlaceholderWorkspaceEntity *v21;
  void *v22;
  uint64_t v23;
  void *v25;
  SBDeviceApplicationSceneEntity *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  SBDeviceApplicationSceneEntity *v30;
  void *v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "type") || objc_msgSend(v9, "type") == 5)
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "applicationForDisplayItem:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[SBAppClipPlaceholderWorkspaceEntity isAppClipUpdateAvailableForBundleIdentifier:](SBAppClipPlaceholderWorkspaceEntity, "isAppClipUpdateAvailableForBundleIdentifier:", v15);

    if (!v14 || v16)
    {
      +[SBApplicationPlaceholderController sharedInstance](SBApplicationPlaceholderController, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "placeholderForDisplayID:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "isAppClip") | v16)
      {
        v21 = [SBAppClipPlaceholderWorkspaceEntity alloc];
        objc_msgSend(v9, "uniqueIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[SBAppClipPlaceholderWorkspaceEntity initWithBundleIdentifier:futureSceneIdentifier:needsUpdate:](v21, "initWithBundleIdentifier:futureSceneIdentifier:needsUpdate:", v12, v22, v16);

      }
      else
      {
        v19 = 0;
      }
    }
    else
    {
      v17 = [SBDeviceApplicationSceneEntity alloc];
      objc_msgSend(v9, "uniqueIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[SBDeviceApplicationSceneEntity initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:](v17, "initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:", v14, v18, v10, v11);
    }

    goto LABEL_13;
  }
  if (objc_msgSend(v9, "type") == 4)
  {
    objc_msgSend(v9, "appSuggestion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqual:", CFSTR("com.apple.Siri")))
    {
      +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
      v23 = objc_claimAutoreleasedReturnValue();
LABEL_24:
      v19 = (SBAppClipPlaceholderWorkspaceEntity *)v23;
LABEL_13:

      goto LABEL_14;
    }
    if (!objc_msgSend(v14, "isCallContinuitySuggestion"))
    {
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "applicationWithBundleIdentifier:", v12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = [SBDeviceApplicationSceneEntity alloc];
      objc_msgSend(v9, "uniqueIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[SBDeviceApplicationSceneEntity initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:](v30, "initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:", v27, v31, v10, v11);

      goto LABEL_33;
    }
    -[SBMainSwitcherControllerCoordinator _appLayoutContainingDisplayItem:](self, "_appLayoutContainingDisplayItem:", v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      v19 = 0;
      goto LABEL_33;
    }
    -[SBMainSwitcherControllerCoordinator createWorkspaceTransientOverlayForAppLayout:](self, "createWorkspaceTransientOverlayForAppLayout:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
LABEL_20:
    v19 = (SBAppClipPlaceholderWorkspaceEntity *)v28;
LABEL_33:

    goto LABEL_13;
  }
  if (objc_msgSend(v9, "type") == 3)
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "applicationWithBundleIdentifier:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = [SBDeviceApplicationSceneEntity alloc];
    objc_msgSend(v9, "uniqueIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[SBDeviceApplicationSceneEntity initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:](v26, "initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:", v14, v27, v10, v11);
    goto LABEL_20;
  }
  if (objc_msgSend(v9, "type") == 2)
  {
    -[SBMainSwitcherControllerCoordinator _appLayoutContainingDisplayItem:](self, "_appLayoutContainingDisplayItem:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[SBMainSwitcherControllerCoordinator createWorkspaceTransientOverlayForAppLayout:](self, "createWorkspaceTransientOverlayForAppLayout:", v14);
      v23 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
LABEL_31:
    v19 = 0;
    goto LABEL_13;
  }
  if (objc_msgSend(v9, "type") == 1)
  {
    v19 = 0;
    goto LABEL_14;
  }
  v19 = 0;
  if (objc_msgSend(v9, "type") != 7 && v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainSwitcherControllerCoordinator.m"), 2370, CFSTR("Unhandled display item type"));
    goto LABEL_31;
  }
LABEL_14:

  return v19;
}

- (BOOL)isDisplayEmbeddedForSwitcherContentController:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isExtendedDisplayWindowScene") ^ 1;

  return v5;
}

- (unint64_t)windowManagementStyleForSwitcherContentController:(id)a3
{
  void *v3;
  unint64_t v4;

  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "windowManagementStyle");

  return v4;
}

- (id)draggingAppLayoutsForWindowDragForSwitcherContentController:(id)a3
{
  return self->_draggingAppLayouts;
}

- (id)proposedAppLayoutsForWindowDragForSwitcherContentController:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __99__SBMainSwitcherControllerCoordinator_proposedAppLayoutsForWindowDragForSwitcherContentController___block_invoke;
  v7[3] = &unk_1E8EB1300;
  v5 = v4;
  v8 = v5;
  -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", v7);

  return v5;
}

void __99__SBMainSwitcherControllerCoordinator_proposedAppLayoutsForWindowDragForSwitcherContentController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "_proposedAppLayoutForWindowDrag");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
    v8 = v9;
  }

}

- (id)windowSceneForSwitcherContentController:(id)a3
{
  void *v3;
  void *v4;

  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)nextDisplayItemInteractionTimeForSwitcherContentController:(id)a3
{
  void *v3;
  int64_t v4;

  -[SBAppSwitcherModel _recentAppLayoutsController](self->_mainSwitcherModel, "_recentAppLayoutsController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_nextInteractionTime");

  return v4;
}

- (id)switcherGestureManagerForSwitcherContentController:(id)a3
{
  void *v3;
  void *v4;

  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gestureManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)activeTransientOverlayPresentedAppLayoutForSwitcherContentController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *appLayoutToEligibleTransientOverlayViewController;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__62;
  v19 = __Block_byref_object_dispose__62;
  v20 = 0;
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transientOverlayPresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  appLayoutToEligibleTransientOverlayViewController = self->_appLayoutToEligibleTransientOverlayViewController;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __108__SBMainSwitcherControllerCoordinator_activeTransientOverlayPresentedAppLayoutForSwitcherContentController___block_invoke;
  v12[3] = &unk_1E8EB1350;
  v9 = v7;
  v13 = v9;
  v14 = &v15;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appLayoutToEligibleTransientOverlayViewController, "enumerateKeysAndObjectsUsingBlock:", v12);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __108__SBMainSwitcherControllerCoordinator_activeTransientOverlayPresentedAppLayoutForSwitcherContentController___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isTopmostPresentedViewController:", a3))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)appLayoutForWorkspaceTransientOverlay:(id)a3 windowScene:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *appLayoutToEligibleTransientOverlayViewController;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__62;
  v20 = __Block_byref_object_dispose__62;
  v21 = 0;
  appLayoutToEligibleTransientOverlayViewController = self->_appLayoutToEligibleTransientOverlayViewController;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__SBMainSwitcherControllerCoordinator_appLayoutForWorkspaceTransientOverlay_windowScene___block_invoke;
  v13[3] = &unk_1E8EB1350;
  v10 = v8;
  v14 = v10;
  v15 = &v16;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appLayoutToEligibleTransientOverlayViewController, "enumerateKeysAndObjectsUsingBlock:", v13);
  v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __89__SBMainSwitcherControllerCoordinator_appLayoutForWorkspaceTransientOverlay_windowScene___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  id v9;

  v8 = a2;
  if (*(_QWORD *)(a1 + 32) == a3)
  {
    v9 = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v8 = v9;
    *a4 = 1;
  }

}

- (id)viewControllerForTransientOverlayAppLayout:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_appLayoutToAcquiredTransientOverlayViewController, "objectForKey:", a3);
}

- (id)createWorkspaceTransientOverlayForAppLayout:(id)a3
{
  void *v3;
  SBWorkspaceTransientOverlay *v4;

  -[NSMutableDictionary objectForKey:](self->_appLayoutToEligibleTransientOverlayViewController, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[SBWorkspaceTransientOverlay initWithViewController:]([SBWorkspaceTransientOverlay alloc], "initWithViewController:", v3);
  else
    v4 = 0;

  return v4;
}

- (BOOL)_shouldReverseLayoutDirection
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1;
}

- (CGRect)switcherContentController:(id)a3 frameForItemWithRole:(int64_t)a4 inMainAppLayout:(id)a5 interfaceOrientation:(int64_t)a6
{
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
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  v10 = a5;
  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", a4, v10, a6);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)switcherContentController:(id)a3 frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a4 floatingConfiguration:(int64_t)a5
{
  void *v7;
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
  CGRect result;

  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", a4, a5);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)switcherContentController:(id)a3 frameForCenterItemWithConfiguration:(int64_t)a4 interfaceOrientation:(int64_t)a5
{
  void *v7;
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
  CGRect result;

  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frameForCenterItemWithConfiguration:interfaceOrientation:", a4, a5);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

uint64_t __91__SBMainSwitcherControllerCoordinator_transitionEventForContext_identifier_phase_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "fromAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsItem:", v3) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "fromFloatingAppLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsItem:", v3);

  }
  return v5;
}

uint64_t __91__SBMainSwitcherControllerCoordinator_transitionEventForContext_identifier_phase_animated___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRemovalContext:forAppLayout:", a3, a2);
}

- (BOOL)switcherContentController:(id)a3 shouldMorphToPIPForTransitionContext:(id)a4
{
  return -[SBMainSwitcherControllerCoordinator _shouldMorphToPIPForTransitionContext:outForLayoutRole:](self, "_shouldMorphToPIPForTransitionContext:outForLayoutRole:", a4, 0);
}

- (BOOL)switcherContentController:(id)a3 shouldMorphFromPIPForTransitionContext:(id)a4
{
  return -[SBMainSwitcherControllerCoordinator _shouldMorphFromPIPForTransitionContext:outForLayoutRole:](self, "_shouldMorphFromPIPForTransitionContext:outForLayoutRole:", a4, 0);
}

- (int64_t)switcherInterfaceOrientationForSwitcherContentController:(id)a3
{
  void *v3;
  int64_t v4;

  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interfaceOrientation");

  return v4;
}

- (int64_t)activeInterfaceOrientationForSwitcherContentController:(id)a3
{
  return objc_msgSend((id)SBApp, "activeInterfaceOrientation", a3);
}

uint64_t __102__SBMainSwitcherControllerCoordinator_switcherContentController_visibleAppLayoutsForBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (id)switcherContentController:(id)a3 hiddenAppLayoutsForBundleIdentifier:(id)a4
{
  void *v4;
  void *v5;

  -[SBAppSwitcherModel appLayoutsForBundleIdentifier:includingHiddenAppLayouts:](self->_mainSwitcherModel, "appLayoutsForBundleIdentifier:includingHiddenAppLayouts:", a4, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_filter:", &__block_literal_global_187_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __101__SBMainSwitcherControllerCoordinator_switcherContentController_hiddenAppLayoutsForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHidden");
}

- (BOOL)switcherContentController:(id)a3 displayItemSupportsCenterRole:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a4;
  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_deviceApplicationSceneHandleForDisplayItem:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = objc_msgSend(v8, "supportsCenterWindow");
  else
    v9 = 0;

  return v9;
}

- (BOOL)switcherContentControllerIsKeyboardHomeAffordanceAssertionCurrentlyBeingTaken:(id)a3
{
  return self->_keyboardHomeAffordanceAssertion != 0;
}

- (void)switcherContentController:(id)a3 performTransitionWithRequest:(id)a4 gestureInitiated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v5 = a5;
  v8 = a4;
  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    objc_msgSend(v9, "gestureManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "sceneUpdatesOnly"))
      objc_msgSend(v11, "handleTransitionRequestForGestureUpdate:", v8);
    else
      objc_msgSend(v11, "handleTransitionRequestForGestureComplete:", v8);

  }
  else
  {
    objc_msgSend(v9, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_fbsDisplayConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __111__SBMainSwitcherControllerCoordinator_switcherContentController_performTransitionWithRequest_gestureInitiated___block_invoke;
    v20[3] = &unk_1E8E9EE78;
    v21 = v8;
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __111__SBMainSwitcherControllerCoordinator_switcherContentController_performTransitionWithRequest_gestureInitiated___block_invoke_2;
    v17[3] = &unk_1E8EA2258;
    v17[4] = self;
    v18 = v21;
    v19 = v10;
    v16 = v10;
    objc_msgSend(v14, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v13, v20, v17);

  }
}

void __111__SBMainSwitcherControllerCoordinator_switcherContentController_performTransitionWithRequest_gestureInitiated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isAppLaunchDuringWindowDragGesture"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "appLayout", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
          +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "bundleIdentifier");
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "applicationWithBundleIdentifier:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v12) = objc_msgSend(v13, "alwaysMaximizedInChamois");
          if ((v12 & 1) != 0)
          {

            goto LABEL_12;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }

    objc_msgSend(v3, "setSource:", 68);
  }
LABEL_12:

}

uint64_t __111__SBMainSwitcherControllerCoordinator_switcherContentController_performTransitionWithRequest_gestureInitiated___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = (void *)a1[6];
  v5 = a2;
  objc_msgSend(v4, "dismissSwitcherEventName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_configureRequest:forSwitcherTransitionRequest:withEventLabel:", v5, v3, v6);

  return 1;
}

- (void)switcherContentController:(id)a3 deletedDisplayItem:(id)a4 inAppLayout:(id)a5 forReason:(int64_t)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  v15 = a4;
  v9 = a5;
  if (a6 == 1)
  {
    -[NSArray firstObject](self->_appLayouts, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqual:", v10))
    {

LABEL_5:
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "postNotificationName:object:", CFSTR("SBUserSwipedToKillRecentAppLayoutNotification"), self);

      goto LABEL_6;
    }
    -[SBMainSwitcherControllerCoordinator recentAppLayouts](self, "recentAppLayouts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "isEqual:", v12);

    if (v13)
      goto LABEL_5;
  }
LABEL_6:
  -[SBMainSwitcherControllerCoordinator _removeDisplayItem:forReason:preferredAppLayoutForRemovalAnimationIfAny:](self, "_removeDisplayItem:forReason:preferredAppLayoutForRemovalAnimationIfAny:", v15, a6, v9);

}

- (void)switcherContentController:(id)a3 activatedBestAppSuggestion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SBMutableSwitcherTransitionRequest *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBContinuityDisplayItem continuityAppDisplayItemWithBundleIdentifier:appSuggestion:](SBContinuityDisplayItem, "continuityAppDisplayItemWithBundleIdentifier:appSuggestion:", v8, v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[SBMainSwitcherControllerCoordinator _appLayoutFromPrimaryLayoutItem:sideLayoutElement:configuration:](self, "_appLayoutFromPrimaryLayoutItem:sideLayoutElement:configuration:", v11, 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
  -[SBSwitcherTransitionRequest setAppLayout:](v10, "setAppLayout:", v9);
  -[SBSwitcherTransitionRequest setSource:](v10, "setSource:", 10);
  -[SBMainSwitcherControllerCoordinator switcherContentController:performTransitionWithRequest:gestureInitiated:](self, "switcherContentController:performTransitionWithRequest:gestureInitiated:", v7, v10, 0);

}

- (void)switcherContentController:(id)a3 bringAppLayoutToFront:(id)a4
{
  -[SBMainSwitcherControllerCoordinator _addAppLayoutToFront:](self, "_addAppLayoutToFront:", a4);
}

- (void)switcherContentController:(id)a3 requestNewWindowForBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a4;
  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_fbsDisplayConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applicationWithBundleIdentifier:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sceneManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_fbsDisplayIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[SBDeviceApplicationSceneEntity newEntityWithApplication:sceneHandleProvider:displayIdentity:](SBDeviceApplicationSceneEntity, "newEntityWithApplication:sceneHandleProvider:displayIdentity:", v11, v12, v13);
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __101__SBMainSwitcherControllerCoordinator_switcherContentController_requestNewWindowForBundleIdentifier___block_invoke;
  v17[3] = &unk_1E8E9EE78;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "requestTransitionWithOptions:displayConfiguration:builder:", 0, v9, v17);

}

void __101__SBMainSwitcherControllerCoordinator_switcherContentController_requestNewWindowForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 35);
  objc_msgSend(v3, "setEventLabel:", CFSTR("NewWindowRequest"));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __101__SBMainSwitcherControllerCoordinator_switcherContentController_requestNewWindowForBundleIdentifier___block_invoke_2;
  v4[3] = &unk_1E8E9EE50;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "modifyApplicationContext:", v4);

}

uint64_t __101__SBMainSwitcherControllerCoordinator_switcherContentController_requestNewWindowForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setActivatingEntity:", *(_QWORD *)(a1 + 32));
}

void __103__SBMainSwitcherControllerCoordinator_switcherContentController_setCacheAsynchronousRenderingSurfaces___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  NSObject *v4;
  __int16 v5[8];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[42], "invalidate");
    v3 = v2[42];
    v2[42] = 0;

    if (!objc_msgSend(v2[41], "count"))
    {
      SBLogAppSwitcher();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5[0] = 0;
        _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Disabled caching asynchronous rendering surfaces.", (uint8_t *)v5, 2u);
      }

      CARenderServerSetCacheAsynchronousSurfaces();
    }
  }

}

- (void)cancelActiveGestureForSwitcherContentController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gestureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeGestureTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v5, "state") <= 2)
  {
    objc_msgSend(v5, "setEnabled:", 0);
    objc_msgSend(v5, "setEnabled:", 1);
  }

}

- (void)switcherContentController:(id)a3 reopenHiddenAppLayoutsWithBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SBAppLayout *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  SBAppLayout *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  SBMainSwitcherControllerCoordinator *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id location;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;

  v6 = a3;
  v7 = a4;
  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherModel appLayoutsForBundleIdentifier:includingHiddenAppLayouts:](self->_mainSwitcherModel, "appLayoutsForBundleIdentifier:includingHiddenAppLayouts:", v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v9, "bs_filter:", &__block_literal_global_203);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithArray:", v11);

  v13 = objc_msgSend(v12, "count");
  v14 = MEMORY[0x1E0C809B0];
  if (v13 == 1)
  {
    objc_msgSend(v12, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "environment") != 2)
    {
LABEL_5:

      goto LABEL_6;
    }
    objc_msgSend(v8, "_currentMainAppLayout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(v12, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v14;
      v38[1] = 3221225472;
      v38[2] = __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke_2;
      v38[3] = &unk_1E8EA43C0;
      v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v26 = v39;
      objc_msgSend(v15, "enumerate:", v38);
      v24 = [SBAppLayout alloc];
      objc_msgSend(v8, "layoutState");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v24, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v26, 1, 1, objc_msgSend(v25, "displayOrdinal"));

      objc_msgSend(v12, "removeObject:", v15);
      objc_msgSend(v12, "addObject:", v17);

      goto LABEL_5;
    }
  }
LABEL_6:
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35[0] = v14;
  v35[1] = 3221225472;
  v35[2] = __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke_3;
  v35[3] = &unk_1E8EA4710;
  v20 = v18;
  v36 = v20;
  v21 = v19;
  v37 = v21;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v35);
  objc_initWeak(&location, v8);
  v31[0] = v14;
  v31[1] = 3221225472;
  v31[2] = __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke_207;
  v31[3] = &unk_1E8E9E270;
  v31[4] = self;
  v22 = v12;
  v32 = v22;
  v33 = v21;
  v27[0] = v14;
  v27[1] = 3221225472;
  v27[2] = __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke_2_208;
  v27[3] = &unk_1E8EB1428;
  v23 = v33;
  v28 = v23;
  objc_copyWeak(&v30, &location);
  v29 = self;
  -[SBMainSwitcherControllerCoordinator _insertAppLayouts:atIndexes:contentViewController:modelMutationBlock:completion:](self, "_insertAppLayouts:atIndexes:contentViewController:modelMutationBlock:completion:", v23, v20, v6, v31, v27);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&location);
}

uint64_t __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHidden");
}

void __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v8);

}

void __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "addObject:", &unk_1E91D1160);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v4, "appLayoutByModifyingHiddenState:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v6);
}

uint64_t __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke_207(id *a1)
{
  _BYTE *v2;
  char v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v2 = a1[4];
  v3 = v2[168];
  v2[168] = 1;
  if (objc_msgSend(a1[5], "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(a1[5], "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)a1[4] + 27), "remove:", v5);
      objc_msgSend(a1[6], "objectAtIndex:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)a1[4] + 27), "addToFront:", v6);

      ++v4;
    }
    while (v4 < objc_msgSend(a1[5], "count"));
  }
  *((_BYTE *)a1[4] + 168) = v3;
  return objc_msgSend(a1[4], "_rebuildAppListCache");
}

void __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke_2_208(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  if (objc_msgSend(*(id *)(a1 + 32), "count") == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_fbsDisplayConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke_3_209;
    v9[3] = &unk_1E8EA2258;
    v9[4] = *(_QWORD *)(a1 + 40);
    v10 = v5;
    v11 = WeakRetained;
    v7 = WeakRetained;
    v8 = v5;
    objc_msgSend(v6, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v4, 0, v9);

  }
}

uint64_t __108__SBMainSwitcherControllerCoordinator_switcherContentController_reopenHiddenAppLayoutsWithBundleIdentifier___block_invoke_3_209(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBSwitcherTransitionRequest, "requestForActivatingAppLayout:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "dismissSwitcherEventName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_configureRequest:forSwitcherTransitionRequest:withEventLabel:", v5, v6, v7);

  return 1;
}

- (void)switcherContentController:(id)a3 setInterfaceOrientation:(int64_t)a4
{
  id v5;

  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_updateContentViewInterfaceOrientation:", a4);

}

- (void)switcherContentController:(id)a3 setInterfaceOrientationFromUserResizing:(int64_t)a4 forDisplayItem:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v9 = a5;
  if (v13)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainSwitcherControllerCoordinator.m"), 3242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("controller"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainSwitcherControllerCoordinator.m"), 3243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

LABEL_3:
  -[SBMainSwitcherControllerCoordinator switcherContentController:deviceApplicationSceneHandleForDisplayItem:](self, "switcherContentController:deviceApplicationSceneHandleForDisplayItem:", v13, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    -[SBMainSwitcherControllerCoordinator _setInterfaceOrientationFromUserResizingIfSupported:forSceneHandle:](self, "_setInterfaceOrientationFromUserResizingIfSupported:forSceneHandle:", a4, v10);

}

- (void)presentContinuousExposeStripRevealGrabberTongueImmediatelyForSwitcherContentController:(id)a3
{
  void *v3;
  id v4;

  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gestureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentContinuousExposeStripRevealGrabberTongueImmediately");

}

- (void)tickleContinuousExposeStripRevealGrabberTongueIfVisibleForSwitcherContentController:(id)a3
{
  void *v3;
  id v4;

  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gestureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tickleContinuousExposeStripRevealGrabberTongueIfVisible");

}

- (void)switcherContentControllerDidUpdateVisibleHomeAffordances:(id)a3
{
  void *v3;
  id v4;

  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gestureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteVisibleHomeAffordancesChanged");

}

- (BOOL)switcherContentControllerControlsWallpaper:(id)a3
{
  void *v3;
  void *v4;

  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isMainDisplayWindowScene");
  return (char)v3;
}

- (void)fluidSwitcherGestureManager:(id)a3 didBeginGesture:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSCountedSet *draggingAppLayouts;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "switcherController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "type") == 8 && objc_msgSend(v8, "windowManagementStyle") == 2)
  {
    draggingAppLayouts = self->_draggingAppLayouts;
    objc_msgSend(v7, "selectedAppLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCountedSet addObject:](draggingAppLayouts, "addObject:", v10);

    -[SBMainSwitcherControllerCoordinator _rebuildAppListCache](self, "_rebuildAppListCache");
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_didBeginGesture___block_invoke;
  v14[3] = &unk_1E8EA6C58;
  v15 = v8;
  v16 = v7;
  v17 = v6;
  v11 = v6;
  v12 = v7;
  v13 = v8;
  -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", v14);

}

void __83__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_didBeginGesture___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 40), "type") == 8
    && (v3 = objc_msgSend(v4, "windowManagementStyle"), v3 == objc_msgSend(*(id *)(a1 + 32), "windowManagementStyle")))
  {
    objc_msgSend(v4, "fluidSwitcherGestureManager:didBeginGesture:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }

}

- (void)fluidSwitcherGestureManager:(id)a3 didUpdateGesture:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "switcherController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_didUpdateGesture___block_invoke;
  v12[3] = &unk_1E8EA6C58;
  v13 = v8;
  v14 = v7;
  v15 = v6;
  v9 = v6;
  v10 = v7;
  v11 = v8;
  -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", v12);

}

void __84__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_didUpdateGesture___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 40), "type") == 8
    && (v3 = objc_msgSend(v4, "windowManagementStyle"), v3 == objc_msgSend(*(id *)(a1 + 32), "windowManagementStyle")))
  {
    objc_msgSend(v4, "fluidSwitcherGestureManager:didUpdateGesture:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }

}

- (void)fluidSwitcherGestureManager:(id)a3 didEndGesture:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  NSCountedSet *draggingAppLayouts;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "switcherController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_didEndGesture___block_invoke;
  v14[3] = &unk_1E8EA6C58;
  v9 = v8;
  v15 = v9;
  v10 = v7;
  v16 = v10;
  v11 = v6;
  v17 = v11;
  -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", v14);
  if (objc_msgSend(v10, "type") == 8 && objc_msgSend(v9, "windowManagementStyle") == 2)
  {
    draggingAppLayouts = self->_draggingAppLayouts;
    objc_msgSend(v10, "selectedAppLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCountedSet removeObject:](draggingAppLayouts, "removeObject:", v13);

    -[SBMainSwitcherControllerCoordinator _rebuildAppListCache](self, "_rebuildAppListCache");
  }

}

void __81__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_didEndGesture___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 40), "type") == 8
    && (v3 = objc_msgSend(v4, "windowManagementStyle"), v3 == objc_msgSend(*(id *)(a1 + 32), "windowManagementStyle")))
  {
    objc_msgSend(v4, "fluidSwitcherGestureManager:didEndGesture:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }

}

- (void)fluidSwitcherGestureManager:(id)a3 didBeginDraggingWindowWithSceneIdentifier:(id)a4
{
  id v7;
  id v8;
  NSMutableSet *windowDragSceneIdentifiers;
  NSMutableSet *v10;
  NSMutableSet *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainSwitcherControllerCoordinator.m"), 3396, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneIdentifier"));

  }
  windowDragSceneIdentifiers = self->_windowDragSceneIdentifiers;
  if (!windowDragSceneIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v11 = self->_windowDragSceneIdentifiers;
    self->_windowDragSceneIdentifiers = v10;

    windowDragSceneIdentifiers = self->_windowDragSceneIdentifiers;
  }
  -[NSMutableSet addObject:](windowDragSceneIdentifiers, "addObject:", v8);
  -[SBMainSwitcherControllerCoordinator _rebuildAppListCache](self, "_rebuildAppListCache");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __109__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_didBeginDraggingWindowWithSceneIdentifier___block_invoke;
  v15[3] = &unk_1E8EB1450;
  v16 = v7;
  v17 = v8;
  v12 = v8;
  v13 = v7;
  -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", v15);

}

uint64_t __109__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_didBeginDraggingWindowWithSceneIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fluidSwitcherGestureManager:didBeginDraggingWindowWithSceneIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)fluidSwitcherGestureManager:(id)a3 didPlatterizeWindowDragWithSceneIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (-[NSMutableSet containsObject:](self->_windowDragSceneIdentifiers, "containsObject:", v7))
    -[SBMainSwitcherControllerCoordinator _rebuildAppListCache](self, "_rebuildAppListCache");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __110__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_didPlatterizeWindowDragWithSceneIdentifier___block_invoke;
  v10[3] = &unk_1E8EB1450;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", v10);

}

uint64_t __110__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_didPlatterizeWindowDragWithSceneIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fluidSwitcherGestureManager:didPlatterizeWindowDragWithSceneIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)fluidSwitcherGestureManager:(id)a3 willEndDraggingWindowWithSceneIdentifier:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainSwitcherControllerCoordinator.m"), 3421, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneIdentifier"));

  }
  if (-[NSMutableSet containsObject:](self->_windowDragSceneIdentifiers, "containsObject:", v8))
  {
    -[NSMutableSet removeObject:](self->_windowDragSceneIdentifiers, "removeObject:", v8);
    -[SBMainSwitcherControllerCoordinator _rebuildAppListCache](self, "_rebuildAppListCache");
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __108__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_willEndDraggingWindowWithSceneIdentifier___block_invoke;
  v12[3] = &unk_1E8EB1450;
  v13 = v7;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", v12);

}

uint64_t __108__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_willEndDraggingWindowWithSceneIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fluidSwitcherGestureManager:willEndDraggingWindowWithSceneIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)fluidSwitcherGestureManager:(id)a3 clickReceivedForHomeGrabberView:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_clickReceivedForHomeGrabberView___block_invoke;
  v10[3] = &unk_1E8EB1450;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", v10);

}

uint64_t __99__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_clickReceivedForHomeGrabberView___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fluidSwitcherGestureManager:clickReceivedForHomeGrabberView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)fluidSwitcherGestureManager:(id)a3 tapReceivedForGrabberTongueAtEdge:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  unint64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __101__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_tapReceivedForGrabberTongueAtEdge___block_invoke;
  v8[3] = &unk_1E8EB1478;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", v8);

}

uint64_t __101__SBMainSwitcherControllerCoordinator_fluidSwitcherGestureManager_tapReceivedForGrabberTongueAtEdge___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fluidSwitcherGestureManager:tapReceivedForGrabberTongueAtEdge:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)switcherDemoFilteringControllerDidChangeHiddenApplicationBundleIDs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *appLayouts;
  id v10;
  NSArray *demoFilteringHiddenAppLayouts;
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__62;
  v24 = __Block_byref_object_dispose__62;
  v25 = 0;
  v12 = a3;
  objc_msgSend(v12, "hiddenApplicationBundleIDs");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7);
        appLayouts = self->_appLayouts;
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __106__SBMainSwitcherControllerCoordinator_switcherDemoFilteringControllerDidChangeHiddenApplicationBundleIDs___block_invoke;
        v13[3] = &unk_1E8EB14A0;
        v15 = &v20;
        v13[4] = v8;
        v10 = v4;
        v14 = v10;
        -[NSArray enumerateObjectsUsingBlock:](appLayouts, "enumerateObjectsUsingBlock:", v13);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v5);
  }

  demoFilteringHiddenAppLayouts = self->_demoFilteringHiddenAppLayouts;
  if (demoFilteringHiddenAppLayouts != (NSArray *)v21[5]
    && (-[NSArray isEqual:](demoFilteringHiddenAppLayouts, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_demoFilteringHiddenAppLayouts, (id)v21[5]);
    -[SBMainSwitcherControllerCoordinator _rebuildAppListCache](self, "_rebuildAppListCache");
  }

  _Block_object_dispose(&v20, 8);
}

void __106__SBMainSwitcherControllerCoordinator_switcherDemoFilteringControllerDidChangeHiddenApplicationBundleIDs___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "containsObject:") & 1) == 0
    && objc_msgSend(v10, "containsItemWithBundleIdentifier:", *(_QWORD *)(a1 + 32)))
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v6)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend(v6, "addObject:", v10);
    *a4 = 1;
  }

}

- (void)_lockKeyboardFocusForSwitcherController:(id)a3
{
  SBKeyboardFocusControlling *keyboardFocusController;
  void *v5;
  BSInvalidatable *v6;
  BSInvalidatable *lockKeyboardFocusAssertion;
  id v8;

  if (!self->_lockKeyboardFocusAssertion)
  {
    keyboardFocusController = self->_keyboardFocusController;
    objc_msgSend(a3, "windowScene");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[SBKeyboardFocusLockReason appSwitcher](SBKeyboardFocusLockReason, "appSwitcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusControlling focusLockSpringBoardWindowScene:forReason:](keyboardFocusController, "focusLockSpringBoardWindowScene:forReason:", v8, v5);
    v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    lockKeyboardFocusAssertion = self->_lockKeyboardFocusAssertion;
    self->_lockKeyboardFocusAssertion = v6;

  }
}

- (void)_warmAppInfoForAppsInList
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[SBAppSwitcherModel appLayoutsIncludingHiddenAppLayouts:](self->_mainSwitcherModel, "appLayoutsIncludingHiddenAppLayouts:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "enumerate:", &__block_literal_global_221);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __64__SBMainSwitcherControllerCoordinator__warmAppInfoForAppsInList__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!objc_msgSend(v6, "type"))
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applicationWithBundleIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "isClassic");
  }

}

- (void)_applicationDidExit:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  SBMainSwitcherControllerCoordinator *v17;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "lastExitContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "terminationReason");

    if (v7 != 1)
    {
      v8 = (void *)MEMORY[0x1E0D229B0];
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __59__SBMainSwitcherControllerCoordinator__applicationDidExit___block_invoke;
      v15 = &unk_1E8E9E820;
      v16 = v5;
      v17 = self;
      objc_msgSend(v8, "eventWithName:handler:", CFSTR("SBMainSwitcherCoordinatorFloatingExitSanityCheck"), &v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace", v12, v13, v14, v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "eventQueue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "executeOrAppendEvent:", v9);

    }
  }

}

void __59__SBMainSwitcherControllerCoordinator__applicationDidExit___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  int v8;
  SBAppLayout *v9;
  void *v10;
  void *v11;
  SBAppLayout *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "failedLaunchCount");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "bs_firstObjectPassingTest:", &__block_literal_global_225);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v2 >= 2;
  else
    v6 = 0;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqual:", v7);

    if (v8)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 216), "remove:", v3);
      v9 = [SBAppLayout alloc];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v10;
      v15[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v9, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v11, 1, 1, objc_msgSend(v3, "preferredDisplayOrdinal"));

      objc_msgSend(*(id *)(a1 + 40), "_addAppLayoutToFront:", v12);
    }
  }
  v13 = *(void **)(a1 + 32);
  if (v13 && v2 >= 2)
    objc_msgSend(v13, "setLastWindowLayoutAttributes:", 0);

}

BOOL __59__SBMainSwitcherControllerCoordinator__applicationDidExit___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "environment") == 2;
}

- (void)_addAppLayoutToFront:(id)a3
{
  -[SBMainSwitcherControllerCoordinator _addAppLayoutToFront:removeAppLayout:](self, "_addAppLayoutToFront:removeAppLayout:", a3, 0);
}

- (id)_transientOverlayPresentationManager
{
  void *v2;
  void *v3;

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transientOverlayPresentationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setInterfaceOrientationFromUserResizingIfSupported:(int64_t)a3 forSceneHandle:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  objc_msgSend(v14, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMedusaCapable");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v14, "application");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "classicAppPhoneAppRunningOnPad");

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v14, "_windowScene");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isExternalDisplayWindowScene") & 1) == 0)
      {
        v10 = objc_opt_class();
        objc_msgSend(v9, "switcherController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contentViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        SBSafeCast(v10, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          if (objc_msgSend(v13, "contentOrientation") == a3)
            a3 = 0;
        }
        else
        {
          a3 = 0;
        }

      }
    }
    objc_msgSend(v14, "_setInterfaceOrientationFromUserResizing:", a3);
  }

}

- (id)_homeScreenAppearanceControllerForSwitcherContentController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[SBMainSwitcherControllerCoordinator _switcherControllerForContentViewController:](self, "_switcherControllerForContentViewController:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "homeScreenController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    +[SBUIController sharedInstance](SBUIController, "sharedInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)noteKeyboardIsForMedusaWithOwningScene:(id)a3
{
  FBScene *v5;
  void *v6;
  void *v7;
  FBScene *v8;

  v5 = (FBScene *)a3;
  if (self->_medusaKeyboardScene != v5)
  {
    v8 = v5;
    -[SBMainSwitcherControllerCoordinator _medusaKeyboardSceneHandle](self, "_medusaKeyboardSceneHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self);

    objc_storeStrong((id *)&self->_medusaKeyboardScene, a3);
    -[SBMainSwitcherControllerCoordinator _medusaKeyboardSceneHandle](self, "_medusaKeyboardSceneHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:", self);

    -[SBMainSwitcherControllerCoordinator _updateKeyboardHomeAffordanceAssertion](self, "_updateKeyboardHomeAffordanceAssertion");
    v5 = v8;
  }

}

- (BOOL)_keyboardIsSuppressedForMedusaKeyboardScene
{
  void *v2;
  unint64_t v3;

  -[FBScene settings](self->_medusaKeyboardScene, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = ((unint64_t)objc_msgSend(v2, "deactivationReasons") >> 8) & 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (void)_chamoisWindowingUIEverEnabledDefaultChangeHandler
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  SBMainSwitcherControllerCoordinator *v22;
  SEL v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appSwitcherDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "chamoisEverEnabled"))
  {
    +[SBControlCenterController sharedInstanceIfExists](SBControlCenterController, "sharedInstanceIfExists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissAnimated:", 1);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF78]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.SpringBoardEducation"), CFSTR("SBERemoteViewController"));
    v8 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
    v9 = (void *)objc_msgSend(MEMORY[0x1E0DAAF88], "newHandleWithDefinition:configurationContext:", v7, v8);
    v10 = objc_alloc_init(MEMORY[0x1E0DAAF58]);
    v24 = CFSTR("SBEducationRemoteViewControllerEducationTypeKey");
    v25[0] = &unk_1E91D1178;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUserInfo:", v11);

    v12 = objc_alloc(MEMORY[0x1E0D01698]);
    v13 = (void *)MEMORY[0x1E0D016A0];
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __89__SBMainSwitcherControllerCoordinator__chamoisWindowingUIEverEnabledDefaultChangeHandler__block_invoke;
    v20 = &unk_1E8EB1528;
    v21 = v5;
    v22 = self;
    v23 = a2;
    objc_msgSend(v13, "responderWithHandler:", &v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithInfo:responder:", 0, v14, v17, v18, v19, v20);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setActions:", v16);

    objc_msgSend(v9, "activateWithContext:", v10);
  }

}

void __89__SBMainSwitcherControllerCoordinator__chamoisWindowingUIEverEnabledDefaultChangeHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __89__SBMainSwitcherControllerCoordinator__chamoisWindowingUIEverEnabledDefaultChangeHandler__block_invoke_cold_1(a1, (uint64_t)v4, v5);

  }
  else
  {
    objc_msgSend(v3, "info");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "flagForSetting:", 0) != 0;

    objc_msgSend(*(id *)(a1 + 32), "setChamoisWindowingEnabled:", v7);
  }

}

- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5
{
  FBScene *v6;
  FBScene *medusaKeyboardScene;

  objc_msgSend(a3, "scene");
  v6 = (FBScene *)objc_claimAutoreleasedReturnValue();
  medusaKeyboardScene = self->_medusaKeyboardScene;

  if (v6 == medusaKeyboardScene)
    -[SBMainSwitcherControllerCoordinator _updateKeyboardHomeAffordanceAssertion](self, "_updateKeyboardHomeAffordanceAssertion");
}

- (void)_switcherServiceAdded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSUInteger v13;
  _QWORD v14[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("AppSwitcherService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBDisplayItem switcherServiceDisplayItemWithServiceIdentifier:](SBDisplayItem, "switcherServiceDisplayItemWithServiceIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainSwitcherControllerCoordinator _appLayoutFromPrimaryLayoutItem:sideLayoutElement:configuration:](self, "_appLayoutFromPrimaryLayoutItem:sideLayoutElement:configuration:", v7, 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "windowSceneManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeDisplayWindowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBMainSwitcherControllerCoordinator switcherControllerForWindowScene:](self, "switcherControllerForWindowScene:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NSArray indexOfObject:](self->_appLayouts, "indexOfObject:", v8);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__SBMainSwitcherControllerCoordinator__switcherServiceAdded___block_invoke;
  v14[3] = &unk_1E8E9DED8;
  v14[4] = self;
  -[SBMainSwitcherControllerCoordinator _insertAppLayout:atIndex:contentViewController:modelMutationBlock:completion:](self, "_insertAppLayout:atIndex:contentViewController:modelMutationBlock:completion:", v8, v13, v12, v14, 0);

}

uint64_t __61__SBMainSwitcherControllerCoordinator__switcherServiceAdded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rebuildAppListCache");
}

- (void)_switcherServiceRemoved:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SBSwitcherModelRemovalRequest *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = -[SBMainSwitcherControllerCoordinator isAnySwitcherVisible](self, "isAnySwitcherVisible");
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("AppSwitcherService"));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v13, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBDisplayItem switcherServiceDisplayItemWithServiceIdentifier:](SBDisplayItem, "switcherServiceDisplayItemWithServiceIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBMainSwitcherControllerCoordinator _appLayoutFromPrimaryLayoutItem:sideLayoutElement:configuration:](self, "_appLayoutFromPrimaryLayoutItem:sideLayoutElement:configuration:", v8, 0, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(SBSwitcherModelRemovalRequest);
    +[SBSwitcherModelRemovalRequestAction defaultRemovalPolicyAction](SBSwitcherModelRemovalRequestAction, "defaultRemovalPolicyAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherModelRemovalRequest setAction:forAppLayout:](v10, "setAction:forAppLayout:", v11, v9);

    -[SBMainSwitcherControllerCoordinator _switcherModelRemovalResultsForRequest:forReason:](self, "_switcherModelRemovalResultsForRequest:forReason:", v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainSwitcherControllerCoordinator _performSceneDestructionForModelRemovalResults:](self, "_performSceneDestructionForModelRemovalResults:", v12);

  }
  else
  {
    -[NSMutableArray addObject:](self->_servicesRemovedWhileAwayFromSwitcher, "addObject:", v13);
  }

}

void __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  _BOOL4 v7;
  void *v8;

  objc_msgSend(a3, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = v6;
    v7 = +[SBApplicationAppProtectionAssistant shouldHideApplicationWithBundleIdentifier:](SBApplicationAppProtectionAssistant, "shouldHideApplicationWithBundleIdentifier:", v6);
    v6 = v8;
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "addIndex:", *(_QWORD *)(a1 + 40));
      v6 = v8;
      *a4 = 1;
    }
  }

}

uint64_t __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsItem:", a2) ^ 1;
}

id __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_5(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_6;
  v3[3] = &unk_1E8E9DF50;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "appLayoutWithItemsPassingTest:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __59__SBMainSwitcherControllerCoordinator__buildAppLayoutCache__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;

  v6 = a2;
  if (objc_msgSend(v6, "type")
    || (objc_msgSend(*(id *)(a1 + 32), "_shouldPrioritizeSortOrderForAppLayout:", v6) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = 1;
    *a4 = 1;
  }

  return v7;
}

void __98__SBMainSwitcherControllerCoordinator__rebuildCurrentWindowingModeCompatibleAppLayoutsIfNecessary__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  id obj;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "windowManagementStyle") == 2)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
    if (v5)
      goto LABEL_15;
    v6 = v4;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v7 = *(id *)(a1[4] + 48);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v56 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v12, "appLayoutByAdjustingCenterWindowItemsForChamois");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "isEqual:", v12) & 1) == 0)
          {
            v14 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
            if (!v14)
            {
              v15 = objc_msgSend(*(id *)(a1[4] + 48), "mutableCopy");
              v16 = *(_QWORD *)(a1[5] + 8);
              v17 = *(void **)(v16 + 40);
              *(_QWORD *)(v16 + 40) = v15;

              v14 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
            }
            objc_msgSend(v14, "replaceObjectAtIndex:withObject:", objc_msgSend(v14, "indexOfObject:", v12), v13);
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      }
      while (v9);
    }

    v5 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
    v4 = v6;
    if (v5)
    {
LABEL_15:
      v18 = *(void **)(a1[4] + 32);
      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = a1[4];
        v21 = *(void **)(v20 + 32);
        *(_QWORD *)(v20 + 32) = v19;

        v18 = *(void **)(a1[4] + 32);
        v22 = *(_QWORD *)(a1[5] + 8);
LABEL_41:
        v5 = *(_QWORD *)(v22 + 40);
        goto LABEL_42;
      }
      goto LABEL_42;
    }
    goto LABEL_44;
  }
  if (objc_msgSend(v3, "windowManagementStyle") == 1 || !objc_msgSend(v3, "windowManagementStyle"))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v5)
      goto LABEL_39;
    v43 = v4;
    v44 = v3;
    v46 = objc_msgSend(v3, "windowManagementStyle");
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = *(id *)(a1[4] + 48);
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v52 != v25)
            objc_enumerationMutation(obj);
          v27 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
          +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController:multitaskingSupported:", v28, v46 == 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            v30 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
            if (!v30)
            {
              v31 = objc_msgSend(*(id *)(a1[4] + 48), "mutableCopy");
              v32 = *(_QWORD *)(a1[6] + 8);
              v33 = *(void **)(v32 + 40);
              *(_QWORD *)(v32 + 40) = v31;

              v30 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
            }
            v34 = objc_msgSend(v30, "indexOfObject:", v27);
            objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "removeObject:", v27);
            v49 = 0u;
            v50 = 0u;
            v47 = 0u;
            v48 = 0u;
            v35 = v29;
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
            if (v36)
            {
              v37 = v36;
              v38 = *(_QWORD *)v48;
              do
              {
                for (k = 0; k != v37; ++k)
                {
                  if (*(_QWORD *)v48 != v38)
                    objc_enumerationMutation(v35);
                  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "insertObject:atIndex:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k), v34 + k);
                }
                v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
                v34 += k;
              }
              while (v37);
            }

          }
        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v24);
    }

    v5 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v4 = v43;
    v3 = v44;
    if (v5)
    {
LABEL_39:
      v18 = *(void **)(a1[4] + 32);
      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = a1[4];
        v42 = *(void **)(v41 + 32);
        *(_QWORD *)(v41 + 32) = v40;

        v18 = *(void **)(a1[4] + 32);
        v22 = *(_QWORD *)(a1[6] + 8);
        goto LABEL_41;
      }
LABEL_42:
      objc_msgSend(v18, "setObject:forKey:", v5, v4);
      goto LABEL_43;
    }
LABEL_44:
    objc_msgSend(*(id *)(a1[4] + 32), "removeObjectForKey:", v4);
  }
LABEL_43:

}

- (void)_notifySwitcherControllersCoordinatedSwitcherControllersDidChange
{
  -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", &__block_literal_global_247);
}

void __104__SBMainSwitcherControllerCoordinator__notifySwitcherControllersCoordinatedSwitcherControllersDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "contentViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteCoordinatedSwitcherControllersDidChange");

}

- (void)_insertAppLayout:(id)a3 atIndex:(unint64_t)a4 contentViewController:(id)a5 modelMutationBlock:(id)a6 completion:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v21[0] = a3;
  v12 = (void *)MEMORY[0x1E0C99D20];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a3;
  objc_msgSend(v12, "arrayWithObjects:count:", v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBMainSwitcherControllerCoordinator _insertAppLayouts:atIndexes:contentViewController:modelMutationBlock:completion:](self, "_insertAppLayouts:atIndexes:contentViewController:modelMutationBlock:completion:", v17, v19, v15, v14, v13);
}

- (void)_insertAppLayouts:(id)a3 atIndexes:(id)a4 contentViewController:(id)a5 modelMutationBlock:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void (**v15)(id, uint64_t, _QWORD);
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(_QWORD))a6;
  v15 = (void (**)(id, uint64_t, _QWORD))a7;
  if (objc_msgSend(v13, "shouldAnimateInsertionOfAppLayouts:atIndexes:", v11, v12))
  {
    objc_msgSend(v13, "prepareAnimatedInsertionOfAppLayouts:atIndexes:", v11, v12);
    v14[2](v14);
    objc_msgSend(v13, "noteModelDidMutateForInsertionOfAppLayouts:atIndexes:willAnimate:", v11, v12, 1);
    v16 = (void *)MEMORY[0x1E0DA9D48];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __119__SBMainSwitcherControllerCoordinator__insertAppLayouts_atIndexes_contentViewController_modelMutationBlock_completion___block_invoke;
    v17[3] = &unk_1E8EB0258;
    v18 = v13;
    v19 = v11;
    v20 = v12;
    objc_msgSend(v16, "perform:finalCompletion:", v17, v15);

  }
  else
  {
    v14[2](v14);
    objc_msgSend(v13, "noteModelDidMutateForInsertionOfAppLayouts:atIndexes:willAnimate:", v11, v12, 0);
    if (v15)
      v15[2](v15, 1, 0);
  }

}

void __119__SBMainSwitcherControllerCoordinator__insertAppLayouts_atIndexes_contentViewController_modelMutationBlock_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  (*(void (**)(uint64_t, const __CFString *))(a2 + 16))(a2, CFSTR("insert main app layouts"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performAnimatedInsertionOfAppLayouts:atIndexes:completion:", v3, v4, v5);

}

- (void)_cancelPIPForDisplayItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a3;
  -[SBMainSwitcherControllerCoordinator _switcherControllerForDisplayItem:](self, "_switcherControllerForDisplayItem:", v4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_deviceApplicationSceneHandleForDisplayItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pipControllerForType:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "application");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "pid");
    objc_msgSend(v5, "persistenceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:scenePersistenceIdentifier:", v10, v11);

  }
}

- (void)_deleteAppLayoutsMatchingBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBAppSwitcherModel _recentAppLayoutsController](self->_mainSwitcherModel, "_recentAppLayoutsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recentDisplayItemsForBundleIdentifier:includingHiddenAppLayouts:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[SBMainSwitcherControllerCoordinator deleteAppLayoutForDisplayItem:](self, "deleteAppLayoutForDisplayItem:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (BOOL)_hasAppLayoutBeenUserKilledWithinThresholdToCreateNewScene:(id)a3
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __98__SBMainSwitcherControllerCoordinator__hasAppLayoutBeenUserKilledWithinThresholdToCreateNewScene___block_invoke;
  v6[3] = &unk_1E8EA85E0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v4, "enumerate:", v6);
  LOBYTE(self) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

void __98__SBMainSwitcherControllerCoordinator__hasAppLayoutBeenUserKilledWithinThresholdToCreateNewScene___block_invoke(uint64_t a1)
{
  void *v2;
  BOOL v3;
  void *v4;
  char v5;
  uint64_t v6;
  char v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "objectForKey:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8 = v2;
    v3 = (unint64_t)objc_msgSend(v2, "count") >= 2;
    v2 = v8;
    if (v3)
    {
      objc_msgSend(v8, "lastObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "doubleValue");

      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v5 = BSFloatLessThanOrEqualToFloat();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (*(_BYTE *)(v6 + 24))
        v7 = 1;
      else
        v7 = v5;
      v2 = v8;
      *(_BYTE *)(v6 + 24) = v7;
    }
  }

}

- (void)_noteUIWillLock
{
  -[SBMainSwitcherControllerCoordinator _purgeHiddenAppLayoutsForUILock](self, "_purgeHiddenAppLayoutsForUILock");
  -[SBMainSwitcherControllerCoordinator _activateHomeScreenForProtectedHiddenAppOnUILock](self, "_activateHomeScreenForProtectedHiddenAppOnUILock");
  -[NSMutableDictionary removeAllObjects](self->_recentSwipeUpToKillTimestampsForAppLayouts, "removeAllObjects");
}

- (void)_activateHomeScreenForProtectedHiddenAppOnUILock
{
  -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", &__block_literal_global_257);
}

void __87__SBMainSwitcherControllerCoordinator__activateHomeScreenForProtectedHiddenAppOnUILock__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "isAnyProtectedHiddenApplicationVisible"))
    objc_msgSend(v2, "activateHomeScreenWithSource:animated:", 7, 0);

}

- (void)_purgeHiddenAppLayoutsForUILock
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  SBAppSwitcherModel *mainSwitcherModel;
  void *v20;
  void *v21;
  SBAppSwitcherModel *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  SBAppLayout *v33;
  void *v34;
  void *v35;
  SBAppLayout *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[6];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  void *v76;
  void *v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SBAppSwitcherModel appLayoutsIncludingHiddenAppLayouts:](self->_mainSwitcherModel, "appLayoutsIncludingHiddenAppLayouts:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v71 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        objc_msgSend(v11, "allItems");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v12);

        if (objc_msgSend(v11, "isHidden"))
          objc_msgSend(v3, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
    }
    while (v8);
  }
  v49 = v3;
  v50 = v6;

  v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
  v53 = v13;
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v67;
    v52 = *(_QWORD *)v67;
    do
    {
      v17 = 0;
      v56 = v15;
      do
      {
        if (*(_QWORD *)v67 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v17);
        mainSwitcherModel = self->_mainSwitcherModel;
        objc_msgSend(v18, "bundleIdentifier", v49);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBAppSwitcherModel appLayoutsForBundleIdentifier:includingHiddenAppLayouts:](mainSwitcherModel, "appLayoutsForBundleIdentifier:includingHiddenAppLayouts:", v20, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = self->_mainSwitcherModel;
        objc_msgSend(v18, "bundleIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBAppSwitcherModel appLayoutsForBundleIdentifier:includingHiddenAppLayouts:](v22, "appLayoutsForBundleIdentifier:includingHiddenAppLayouts:", v23, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v24, "count") && objc_msgSend(v21, "count"))
        {
          objc_msgSend(v21, "firstObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "allItems");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "count");

          if (v27 < 2)
          {
            objc_msgSend(v54, "addObject:", v25);
          }
          else
          {
            objc_msgSend(v25, "itemForLayoutRole:", 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "itemForLayoutRole:", 2);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = v28;
            objc_msgSend(v28, "bundleIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "bundleIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v30, "isEqualToString:", v31);

            if ((v32 & 1) == 0)
            {
              v33 = [SBAppLayout alloc];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = v34;
              v77 = v18;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:hidden:preferredDisplayOrdinal:](v33, "initWithItemsForLayoutRoles:configuration:environment:hidden:preferredDisplayOrdinal:", v35, 1, objc_msgSend(v25, "environment"), 1, objc_msgSend(v25, "preferredDisplayOrdinal"));

              objc_msgSend(v51, "addObject:", v36);
            }

            v16 = v52;
            v13 = v53;
          }

          v15 = v56;
        }

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
    }
    while (v15);
  }

  objc_msgSend(v49, "removeObjectsInArray:", v54);
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v37 = v49;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v63;
    v41 = MEMORY[0x1E0C809B0];
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v63 != v40)
          objc_enumerationMutation(v37);
        v43 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
        v61[0] = v41;
        v61[1] = 3221225472;
        v61[2] = __70__SBMainSwitcherControllerCoordinator__purgeHiddenAppLayoutsForUILock__block_invoke;
        v61[3] = &unk_1E8E9E3B0;
        v61[4] = self;
        v61[5] = v43;
        objc_msgSend(v43, "enumerate:", v61, v49);
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
    }
    while (v39);
  }

  -[SBAppSwitcherModel removeAppLayouts:](self->_mainSwitcherModel, "removeAppLayouts:", v37);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v44 = v51;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v58;
    do
    {
      for (k = 0; k != v46; ++k)
      {
        if (*(_QWORD *)v58 != v47)
          objc_enumerationMutation(v44);
        -[SBAppSwitcherModel addToFront:](self->_mainSwitcherModel, "addToFront:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * k), v49);
      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
    }
    while (v46);
  }

}

void __70__SBMainSwitcherControllerCoordinator__purgeHiddenAppLayoutsForUILock__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a3;
  objc_msgSend(v4, "preferredDisplayIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_entityForDisplayItem:displayIdentity:", v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  SBWorkspaceDestroyApplicationEntity(v7);
}

- (void)_performSceneDestructionForModelRemovalResults:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  int v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t m;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t n;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t ii;
  void *v71;
  NSObject *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t jj;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id obj;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  void *v100;
  id v101;
  id v102;
  uint64_t v103;
  void *v104;
  _QWORD block[4];
  id v107;
  _QWORD v108[4];
  NSObject *v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _QWORD v134[4];
  id v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  const __CFString *v144;
  void *v145;
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  uint64_t v152;
  void *v153;
  _BYTE v154[128];
  _BYTE v155[128];
  uint64_t v156;

  v156 = *MEMORY[0x1E0C80C00];
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v93 = a3;
  objc_msgSend(v93, "appLayouts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v155, 16);
  if (v85)
  {
    v84 = *(_QWORD *)v141;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v141 != v84)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * v3);
        -[SBMainSwitcherControllerCoordinator switcherControllerForAppLayout:](self, "switcherControllerForAppLayout:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_currentMainAppLayout");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = v5;
        objc_msgSend(v5, "_currentFloatingAppLayout");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "replacementAppLayoutForAppLayout:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "allItems");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v3;
        if (v6)
        {
          objc_msgSend(v4, "allItems");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)objc_msgSend(v8, "mutableCopy");

          objc_msgSend(v6, "allItems");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "removeObjectsInArray:", v10);

          v7 = v9;
        }
        v90 = (void *)objc_opt_new();
        v89 = (void *)objc_opt_new();
        v11 = (void *)objc_opt_new();
        v136 = 0u;
        v137 = 0u;
        v138 = 0u;
        v139 = 0u;
        v12 = v7;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v136, v154, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v137;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v137 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * i);
              objc_msgSend(v4, "preferredDisplayIdentity");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[SBMainSwitcherControllerCoordinator _entityForDisplayItem:displayIdentity:](self, "_entityForDisplayItem:displayIdentity:", v17, v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19)
              {
                v152 = v17;
                v153 = v19;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v153, &v152, 1);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "addEntriesFromDictionary:", v20);

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v136, v154, 16);
          }
          while (v14);
        }

        v92 = (void *)objc_opt_new();
        v91 = (void *)objc_opt_new();
        +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "sceneDeactivationManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v22, "newAssertionWithReason:", 3);

        v134[0] = MEMORY[0x1E0C809B0];
        v134[1] = 3221225472;
        v134[2] = __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke;
        v134[3] = &unk_1E8EA3EA0;
        v102 = v11;
        v135 = v102;
        v86 = v23;
        objc_msgSend(v23, "acquireWithPredicate:transitionContext:", v134, 0);
        objc_msgSend(v93, "executeActionForAppLayout:", v4);
        v132 = 0u;
        v133 = 0u;
        v130 = 0u;
        v131 = 0u;
        v98 = v12;
        v95 = v6;
        v103 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v130, v151, 16);
        if (v103)
        {
          v24 = *(_QWORD *)v131;
          v94 = *(_QWORD *)v131;
          v100 = v4;
          do
          {
            for (j = 0; j != v103; ++j)
            {
              if (*(_QWORD *)v131 != v24)
                objc_enumerationMutation(v98);
              v26 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * j);
              objc_msgSend(v26, "bundleIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (v27)
              {
                objc_msgSend(v102, "objectForKey:", v26);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v28, "isDeviceApplicationSceneEntity"))
                {
                  objc_msgSend(v28, "deviceApplicationSceneEntity");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "sceneHandle");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v30)
                  {
                    v31 = objc_msgSend(v30, "prefersKillingInSwitcherDisabled");
                    if (v6)
                    {
LABEL_26:
                      objc_msgSend(v26, "bundleIdentifier");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      v33 = objc_msgSend(v6, "containsItemWithBundleIdentifier:", v32);

                      if (v33)
                        v31 = 1;
                    }
                  }
                  else
                  {
                    v31 = 0;
                    if (v6)
                      goto LABEL_26;
                  }
                  if (objc_msgSend(v93, "willHideDisplayItem:", v26))
                    v34 = v92;
                  else
                    v34 = v91;
                  objc_msgSend(v34, "addObject:", v28);
                  if (!v31)
                  {
LABEL_33:
                    -[SBAppSwitcherModel appLayoutsForBundleIdentifier:includingHiddenAppLayouts:](self->_mainSwitcherModel, "appLayoutsForBundleIdentifier:includingHiddenAppLayouts:", v27, 0);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    v36 = v35;
                    if (v35)
                      v37 = objc_msgSend(v35, "count") == 0;
                    else
                      v37 = 1;
                    v38 = objc_msgSend(v97, "isEqual:", v100);
                    if (objc_msgSend(v96, "isEqual:", v100))
                      v39 = objc_msgSend(v97, "containsItemWithBundleIdentifier:", v27) ^ 1;
                    else
                      v39 = 0;
                    v24 = v94;
                    v6 = v95;
                    if (((v37 | v38) & 1) != 0 || v39)
                    {
                      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v40, "applicationForDisplayItem:", v26);
                      v41 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v41)
                      {
                        -[NSMutableDictionary objectForKey:](self->_appLayoutToEligibleTransientOverlayViewController, "objectForKey:", v100);
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v42)
                        {

                        }
                        else
                        {
                          objc_msgSend(v41, "processState");
                          v43 = (void *)objc_claimAutoreleasedReturnValue();
                          v44 = objc_msgSend(v43, "isRunning");

                          if (v44)
                          {
                            objc_msgSend(v90, "addObject:", v41);
                            if (v30)
                              objc_msgSend(v89, "addObject:", v30);
                          }
                        }
                      }

                    }
                  }

                  goto LABEL_52;
                }
                v30 = 0;
                goto LABEL_33;
              }
LABEL_52:

            }
            v103 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v130, v151, 16);
          }
          while (v103);
        }

        v128 = 0u;
        v129 = 0u;
        v126 = 0u;
        v127 = 0u;
        v45 = v89;
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v126, v150, 16);
        v47 = v97;
        if (v46)
        {
          v48 = v46;
          v49 = *(_QWORD *)v127;
          do
          {
            for (k = 0; k != v48; ++k)
            {
              if (*(_QWORD *)v127 != v49)
                objc_enumerationMutation(v45);
              objc_msgSend(*(id *)(*((_QWORD *)&v126 + 1) + 8 * k), "sceneIfExists");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "updateSettingsWithBlock:", &__block_literal_global_259);

            }
            v48 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v126, v150, 16);
          }
          while (v48);
        }

        objc_msgSend(v92, "bs_compactMap:", &__block_literal_global_261);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        SBApplicationSceneEntityDestructionMakeIntent(1, 0);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v52);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = v53;
        SBWorkspaceDestroyApplicationSceneHandlesWithIntent(v54, v53, &__block_literal_global_263);

        v124 = 0u;
        v125 = 0u;
        v122 = 0u;
        v123 = 0u;
        v55 = v91;
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v122, v149, 16);
        if (v56)
        {
          v57 = v56;
          v58 = *(_QWORD *)v123;
          do
          {
            for (m = 0; m != v57; ++m)
            {
              if (*(_QWORD *)v123 != v58)
                objc_enumerationMutation(v55);
              SBWorkspaceDestroyApplicationEntity(*(void **)(*((_QWORD *)&v122 + 1) + 8 * m));
            }
            v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v122, v149, 16);
          }
          while (v57);
        }

        v120 = 0u;
        v121 = 0u;
        v118 = 0u;
        v119 = 0u;
        objc_msgSend(v102, "allValues");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v118, v148, 16);
        if (v61)
        {
          v62 = v61;
          v63 = *(_QWORD *)v119;
          do
          {
            for (n = 0; n != v62; ++n)
            {
              if (*(_QWORD *)v119 != v63)
                objc_enumerationMutation(v60);
              v65 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * n);
              if (objc_msgSend(v65, "isApplicationSceneEntity"))
                SBWorkspaceNoteApplicationEntityWasRemovedFromAppSwitcher(v65);
            }
            v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v118, v148, 16);
          }
          while (v62);
        }

        v116 = 0u;
        v117 = 0u;
        v114 = 0u;
        v115 = 0u;
        v66 = v98;
        v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v114, v147, 16);
        if (v67)
        {
          v68 = v67;
          v69 = *(_QWORD *)v115;
          do
          {
            for (ii = 0; ii != v68; ++ii)
            {
              if (*(_QWORD *)v115 != v69)
                objc_enumerationMutation(v66);
              -[SBMainSwitcherControllerCoordinator _cancelPIPForDisplayItem:](self, "_cancelPIPForDisplayItem:", *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * ii));
            }
            v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v114, v147, 16);
          }
          while (v68);
        }

        v71 = v90;
        if (objc_msgSend(v90, "count"))
        {
          v99 = v52;
          v101 = v45;
          v72 = dispatch_group_create();
          v110 = 0u;
          v111 = 0u;
          v112 = 0u;
          v113 = 0u;
          v73 = v90;
          v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v110, v146, 16);
          if (v74)
          {
            v75 = v74;
            v76 = *(_QWORD *)v111;
            do
            {
              for (jj = 0; jj != v75; ++jj)
              {
                if (*(_QWORD *)v111 != v76)
                  objc_enumerationMutation(v73);
                v78 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * jj);
                dispatch_group_enter(v72);
                objc_msgSend(v78, "bundleIdentifier");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                v108[0] = MEMORY[0x1E0C809B0];
                v108[1] = 3221225472;
                v108[2] = __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke_266;
                v108[3] = &unk_1E8E9E980;
                v109 = v72;
                SBWorkspaceKillApplication(v78, 1, CFSTR("killed from app switcher"), v108);
                objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                v144 = CFSTR("SBAppSwitcherQuitAppBundleIdentifierKey");
                v145 = v79;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "postNotificationName:object:userInfo:", CFSTR("SBAppSwitcherQuitAppNotification"), 0, v81);

                -[SBApplicationUserQuitMonitorServer userClosedLastSceneOfApplicationWithBundleID:](self->_userQuitMonitorServer, "userClosedLastSceneOfApplicationWithBundleID:", v79);
              }
              v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v110, v146, 16);
            }
            while (v75);
          }

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke_2_267;
          block[3] = &unk_1E8E9DED8;
          v82 = v86;
          v107 = v86;
          dispatch_group_notify(v72, MEMORY[0x1E0C80D38], block);

          v47 = v97;
          v52 = v99;
          v71 = v90;
          v45 = v101;
        }
        else
        {
          v82 = v86;
          objc_msgSend(v86, "relinquish");
        }

        v3 = v88 + 1;
      }
      while (v88 + 1 != v85);
      v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v155, 16);
    }
    while (v85);
  }

}

uint64_t __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "applicationSceneEntity");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = v8;
          objc_msgSend(v8, "sceneHandle");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "sceneIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToString:", v12);

          if ((v13 & 1) != 0)
          {
            v5 = 1;
            goto LABEL_12;
          }
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  return v5;
}

uint64_t __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setForeground:", 0);
}

uint64_t __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sceneHandle");
}

void __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    SBLogAppSwitcher();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke_4_cold_1((uint64_t)v3, v4);

  }
}

void __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke_266(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke_2_267(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "relinquish");
}

- (id)_resultsForDisplayItemRemovalResolutionRequest:(id)a3 preferredAppLayoutForRemovalAnimationIfAny:(id)a4
{
  id v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  SBSwitcherDisplayItemRemovalResolutionResults *v33;
  id v35;
  id obj;
  void *v38;
  SBSwitcherDisplayItemRemovalResolutionResults *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[4];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[5];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v35 = a4;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v38 = v5;
  objc_msgSend(v5, "displayItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (v41)
  {
    v39 = 0;
    v40 = *(_QWORD *)v58;
    while (1)
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v58 != v40)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        if (!objc_msgSend(v7, "type") || objc_msgSend(v7, "type") == 5)
        {
          v8 = objc_msgSend(v38, "removalIntentTypeForDisplayItem:", v7);
          -[SBMainSwitcherControllerCoordinator _nonHiddenAppLayoutsForDisplayItem:](self, "_nonHiddenAppLayoutsForDisplayItem:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v56[0] = MEMORY[0x1E0C809B0];
          v56[1] = 3221225472;
          v56[2] = __129__SBMainSwitcherControllerCoordinator__resultsForDisplayItemRemovalResolutionRequest_preferredAppLayoutForRemovalAnimationIfAny___block_invoke;
          v56[3] = &unk_1E8E9DF78;
          v56[4] = v7;
          objc_msgSend(v9, "bs_filter:", v56);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v9;
          v45 = i;
          if ((unint64_t)objc_msgSend(v10, "count") < 2)
          {
            v12 = 0;
          }
          else
          {
            if (v35)
            {
              v11 = v35;
            }
            else
            {
              objc_msgSend(v10, "firstObject");
              v11 = (id)objc_claimAutoreleasedReturnValue();
            }
            v13 = v11;
            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            v14 = v10;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
            if (v15)
            {
              v16 = v15;
              v12 = 0;
              v17 = *(_QWORD *)v53;
              do
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v53 != v17)
                    objc_enumerationMutation(v14);
                  v19 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
                  if (v19 != v13
                    && objc_msgSend(v13, "containsAllItemsFromAppLayout:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j)))
                  {
                    if (!v12)
                      v12 = (void *)objc_opt_new();
                    objc_msgSend(v12, "addObject:", v19);
                  }
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
              }
              while (v16);
            }
            else
            {
              v12 = 0;
            }

          }
          v43 = v12;
          objc_msgSend(v10, "sb_arrayByRemovingObjects:", v12);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v42 = v7;
          objc_msgSend(v7, "uniqueIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v22 = v20;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
          if (v23)
          {
            v24 = v23;
            v25 = 0;
            v26 = *(_QWORD *)v49;
            while (1)
            {
              v27 = 0;
              do
              {
                if (*(_QWORD *)v49 != v26)
                  objc_enumerationMutation(v22);
                v28 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v27);
                if (v8 != 2)
                  goto LABEL_37;
                v46[0] = MEMORY[0x1E0C809B0];
                v46[1] = 3221225472;
                v46[2] = __129__SBMainSwitcherControllerCoordinator__resultsForDisplayItemRemovalResolutionRequest_preferredAppLayoutForRemovalAnimationIfAny___block_invoke_2;
                v46[3] = &unk_1E8E9DF50;
                v47 = v21;
                objc_msgSend(v28, "appLayoutWithItemsPassingTest:", v46);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = v29;
                if (!v29 || objc_msgSend(v29, "type") == 1)
                {

LABEL_37:
                  +[SBSwitcherDisplayItemRemovalResolutionResultAction defaultRemovalPolicyActionWithAppLayout:](SBSwitcherDisplayItemRemovalResolutionResultAction, "defaultRemovalPolicyActionWithAppLayout:", v28);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_38;
                }
                +[SBSwitcherDisplayItemRemovalResolutionResultAction replacementActionWithAppLayout:replacementAppLayout:](SBSwitcherDisplayItemRemovalResolutionResultAction, "replacementActionWithAppLayout:replacementAppLayout:", v28, v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v31)
                  goto LABEL_37;
LABEL_38:
                if (!v25)
                  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(v25, "addObject:", v31);

                ++v27;
              }
              while (v24 != v27);
              v32 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
              v24 = v32;
              if (!v32)
                goto LABEL_47;
            }
          }
          v25 = 0;
LABEL_47:

          if (v25)
          {
            v33 = v39;
            i = v45;
            if (!v39)
              v33 = objc_alloc_init(SBSwitcherDisplayItemRemovalResolutionResults);
            v39 = v33;
            -[SBSwitcherDisplayItemRemovalResolutionResults setActions:forDisplayItem:](v33, "setActions:forDisplayItem:", v25, v42);

          }
          else
          {
            i = v45;
          }
        }
      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
      if (!v41)
        goto LABEL_56;
    }
  }
  v39 = 0;
LABEL_56:

  return v39;
}

uint64_t __129__SBMainSwitcherControllerCoordinator__resultsForDisplayItemRemovalResolutionRequest_preferredAppLayoutForRemovalAnimationIfAny___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(a1 + 32));
}

uint64_t __129__SBMainSwitcherControllerCoordinator__resultsForDisplayItemRemovalResolutionRequest_preferredAppLayoutForRemovalAnimationIfAny___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

- (id)_nonHiddenAppLayoutsForDisplayItem:(id)a3
{
  id v4;
  SBAppSwitcherModel *mainSwitcherModel;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  mainSwitcherModel = self->_mainSwitcherModel;
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherModel appLayoutsForBundleIdentifier:includingHiddenAppLayouts:](mainSwitcherModel, "appLayoutsForBundleIdentifier:includingHiddenAppLayouts:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = self->_appLayouts;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v14, "containsItem:", v4, (_QWORD)v16))
          {
            if (v11)
            {
              objc_msgSend(v11, "addObject:", v14);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v14);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

    v7 = (void *)objc_msgSend(v11, "copy");
  }

  return v7;
}

- (id)_switcherModelRemovalResultsForRequest:(id)a3 forReason:(int64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  int v28;
  id obj;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  int64_t v36;
  id v37;
  SBSwitcherModelRemovalResults *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  _QWORD v48[6];
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  int64_t v55;
  char v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v38 = objc_alloc_init(SBSwitcherModelRemovalResults);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v32 = v5;
  objc_msgSend(v5, "appLayouts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v33)
  {
    v31 = *(_QWORD *)v62;
    v36 = a4;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v62 != v31)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v6);
        -[SBMainSwitcherControllerCoordinator switcherControllerForAppLayout:](self, "switcherControllerForAppLayout:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_currentMainAppLayout");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v8;
        objc_msgSend(v8, "_currentFloatingAppLayout");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "actionForAppLayout:", v7);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "replacementAppLayout");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          -[SBSwitcherModelRemovalResults setReplacementAppLayout:forAppLayout:](v38, "setReplacementAppLayout:forAppLayout:", v9, v7);
        v35 = v6;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        objc_msgSend(v7, "allItems");
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
        v10 = 0;
        if (v45)
        {
          v43 = v7;
          v44 = *(_QWORD *)v58;
          v42 = v9;
          do
          {
            for (i = 0; i != v45; ++i)
            {
              if (*(_QWORD *)v58 != v44)
                objc_enumerationMutation(v37);
              v12 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
              if (!v9 || (objc_msgSend(v9, "containsItem:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i)) & 1) == 0)
              {
                v46 = v10;
                objc_msgSend(v7, "preferredDisplayIdentity");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                -[SBMainSwitcherControllerCoordinator _entityForDisplayItem:displayIdentity:](self, "_entityForDisplayItem:displayIdentity:", v12, v13);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "deviceApplicationSceneEntity");
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                if (v15)
                {
                  objc_msgSend(v15, "application");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "info");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = objc_msgSend(v17, "supportsMultiwindow");
                  v19 = 0;
                  if (a4 == 1 && v18)
                  {
                    objc_msgSend(v15, "sceneHandle");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "sceneIfExists");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "uiClientSettings");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v19 = objc_msgSend(v22, "discardSessionOnUserDisconnect") ^ 1;

                    v9 = v42;
                    a4 = v36;

                    v7 = v43;
                  }

                }
                else
                {
                  v19 = 0;
                }
                -[SBSwitcherModelRemovalResults setHide:forDisplayItem:](v38, "setHide:forDisplayItem:", v19, v12);
                v23 = (void *)MEMORY[0x1D17E5550](v46);
                v48[0] = MEMORY[0x1E0C809B0];
                v48[1] = 3221225472;
                v48[2] = __88__SBMainSwitcherControllerCoordinator__switcherModelRemovalResultsForRequest_forReason___block_invoke;
                v48[3] = &unk_1E8EB1710;
                v24 = v23;
                v54 = v24;
                v55 = a4;
                v48[4] = self;
                v48[5] = v12;
                v49 = v40;
                v50 = v39;
                v51 = v7;
                v25 = v41;
                v52 = v25;
                v53 = v9;
                v56 = v19;
                v26 = MEMORY[0x1D17E5550](v48);

                objc_msgSend(v25, "activeAppLayoutWhenActivatingMainSwitcher");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "isOrContainsAppLayout:", v7);

                if (v28)
                  objc_msgSend(v25, "setActiveAppLayoutWhenActivatingMainSwitcher:", 0);

                v10 = (void *)v26;
                v9 = v42;
                v7 = v43;
              }
            }
            v45 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
          }
          while (v45);
        }

        -[SBSwitcherModelRemovalResults setAction:forAppLayout:](v38, "setAction:forAppLayout:", v10, v7);
        v6 = v35 + 1;
      }
      while (v35 + 1 != v33);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v33);
  }

  return v38;
}

void __88__SBMainSwitcherControllerCoordinator__switcherModelRemovalResultsForRequest_forReason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v2 = *(_QWORD *)(a1 + 88);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  if (*(_QWORD *)(a1 + 96) == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "objectForKey:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));
    }
    if (objc_msgSend(v3, "count") == 2)
      objc_msgSend(v3, "removeObjectAtIndex:", 1);
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "insertObject:atIndex:", v5, 0);

  }
  if ((objc_msgSend(*(id *)(a1 + 48), "containsItem:", *(_QWORD *)(a1 + 40)) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 56), "containsItem:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "addObject:", *(_QWORD *)(a1 + 40));
  }
  v6 = objc_msgSend(*(id *)(a1 + 64), "layoutRoleForItem:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 72), "contentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 64);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__SBMainSwitcherControllerCoordinator__switcherModelRemovalResultsForRequest_forReason___block_invoke_2;
  v11[3] = &unk_1E8EB16E8;
  v11[4] = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 80);
  v10 = *(_QWORD *)(a1 + 64);
  v12 = v9;
  v13 = v10;
  v15 = *(_BYTE *)(a1 + 104);
  v14 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "removeLayoutRole:inSpace:mutationBlock:reason:", v6, v8, v11, *(_QWORD *)(a1 + 96));

}

uint64_t __88__SBMainSwitcherControllerCoordinator__switcherModelRemovalResultsForRequest_forReason___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t result;
  _QWORD v10[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(v2 + 168);
  *(_BYTE *)(v2 + 168) = 1;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "replaceAppLayout:withAppLayout:", *(_QWORD *)(a1 + 48));
    if (*(_BYTE *)(a1 + 64))
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __88__SBMainSwitcherControllerCoordinator__switcherModelRemovalResultsForRequest_forReason___block_invoke_3;
      v10[3] = &unk_1E8E9DF50;
      v4 = *(void **)(a1 + 48);
      v10[4] = *(_QWORD *)(a1 + 56);
      objc_msgSend(v4, "appLayoutWithItemsPassingTest:", v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appLayoutByModifyingHiddenState:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "addToFront:", v6);

    }
  }
  else
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 216);
    v8 = *(_QWORD *)(a1 + 48);
    if (*(_BYTE *)(a1 + 64))
      objc_msgSend(v7, "hide:", v8);
    else
      objc_msgSend(v7, "remove:", v8);
  }
  result = objc_msgSend(*(id *)(a1 + 32), "_rebuildAppListCache");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 168) = v3;
  return result;
}

BOOL __88__SBMainSwitcherControllerCoordinator__switcherModelRemovalResultsForRequest_forReason___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

- (id)_modelRemovalRequestForDisplayItemResolutionResults:(id)a3
{
  SBSwitcherModelRemovalRequest *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = a3;
  objc_msgSend(v18, "displayItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  v3 = 0;
  if (v19)
  {
    v17 = *(_QWORD *)v26;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(obj);
        v20 = v4;
        objc_msgSend(v18, "actionsForDisplayItem:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v4));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v22 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
              v11 = objc_msgSend(v10, "actionType");
              if (v11 == 2)
              {
                objc_msgSend(v10, "replacementAppLayout");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                +[SBSwitcherModelRemovalRequestAction replacementActionWithAppLayout:](SBSwitcherModelRemovalRequestAction, "replacementActionWithAppLayout:", v13);
                v12 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v12)
                  continue;
              }
              else
              {
                if (v11 != 1)
                  continue;
                +[SBSwitcherModelRemovalRequestAction defaultRemovalPolicyAction](SBSwitcherModelRemovalRequestAction, "defaultRemovalPolicyAction");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v12)
                  continue;
              }
              if (!v3)
                v3 = objc_alloc_init(SBSwitcherModelRemovalRequest);
              objc_msgSend(v10, "appLayout");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[SBSwitcherModelRemovalRequest setAction:forAppLayout:](v3, "setAction:forAppLayout:", v12, v14);

            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v7);
        }

        v4 = v20 + 1;
      }
      while (v20 + 1 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v19);
  }

  return v3;
}

- (int64_t)_switcherDisplayItemRemovalIntentTypeForEntity:(id)a3 removalContext:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  int64_t v8;

  v5 = a4;
  objc_msgSend(a3, "displayItemRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_msgSend(v5, "removalActionType");
    if (v7 == 2)
      v8 = 1;
    else
      v8 = 2 * (v7 == 1);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_switcherModelRemovalResultsForDisplayItemRemovalResolutionRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    -[SBMainSwitcherControllerCoordinator _resultsForDisplayItemRemovalResolutionRequest:preferredAppLayoutForRemovalAnimationIfAny:](self, "_resultsForDisplayItemRemovalResolutionRequest:preferredAppLayoutForRemovalAnimationIfAny:", a3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainSwitcherControllerCoordinator _modelRemovalRequestForDisplayItemResolutionResults:](self, "_modelRemovalRequestForDisplayItemResolutionResults:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainSwitcherControllerCoordinator _switcherModelRemovalResultsForRequest:forReason:](self, "_switcherModelRemovalResultsForRequest:forReason:", v5, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_removeAppLayout:(id)a3 forReason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  SBSwitcherModelRemovalRequest *v9;

  v6 = a3;
  v9 = objc_alloc_init(SBSwitcherModelRemovalRequest);
  +[SBSwitcherModelRemovalRequestAction defaultRemovalPolicyAction](SBSwitcherModelRemovalRequestAction, "defaultRemovalPolicyAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherModelRemovalRequest setAction:forAppLayout:](v9, "setAction:forAppLayout:", v7, v6);

  -[SBMainSwitcherControllerCoordinator _switcherModelRemovalResultsForRequest:forReason:](self, "_switcherModelRemovalResultsForRequest:forReason:", v9, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainSwitcherControllerCoordinator _performSceneDestructionForModelRemovalResults:](self, "_performSceneDestructionForModelRemovalResults:", v8);

}

- (void)_removeDisplayItem:(id)a3 forReason:(int64_t)a4
{
  -[SBMainSwitcherControllerCoordinator _removeDisplayItem:forReason:preferredAppLayoutForRemovalAnimationIfAny:](self, "_removeDisplayItem:forReason:preferredAppLayoutForRemovalAnimationIfAny:", a3, a4, 0);
}

- (void)_removeDisplayItem:(id)a3 forReason:(int64_t)a4 preferredAppLayoutForRemovalAnimationIfAny:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  SBSwitcherDisplayItemRemovalResolutionRequest *v13;

  v8 = a5;
  v9 = a3;
  v13 = objc_alloc_init(SBSwitcherDisplayItemRemovalResolutionRequest);
  -[SBSwitcherDisplayItemRemovalResolutionRequest setRemovalIntentType:forDisplayItem:](v13, "setRemovalIntentType:forDisplayItem:", 2, v9);

  -[SBMainSwitcherControllerCoordinator _resultsForDisplayItemRemovalResolutionRequest:preferredAppLayoutForRemovalAnimationIfAny:](self, "_resultsForDisplayItemRemovalResolutionRequest:preferredAppLayoutForRemovalAnimationIfAny:", v13, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBMainSwitcherControllerCoordinator _modelRemovalRequestForDisplayItemResolutionResults:](self, "_modelRemovalRequestForDisplayItemResolutionResults:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainSwitcherControllerCoordinator _switcherModelRemovalResultsForRequest:forReason:](self, "_switcherModelRemovalResultsForRequest:forReason:", v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainSwitcherControllerCoordinator _performSceneDestructionForModelRemovalResults:](self, "_performSceneDestructionForModelRemovalResults:", v12);

}

- (void)_modifyModelWithDropContext:(id)a3
{
  BOOL ignoreModelUpdates;

  ignoreModelUpdates = self->_ignoreModelUpdates;
  self->_ignoreModelUpdates = 1;
  -[SBAppSwitcherModel modifyWithDropContext:](self->_mainSwitcherModel, "modifyWithDropContext:", a3);
  self->_ignoreModelUpdates = ignoreModelUpdates;
  -[SBMainSwitcherControllerCoordinator _rebuildAppListCache](self, "_rebuildAppListCache");
}

- (void)appSwitcherModel:(id)a3 didRemoveAppLayoutForFallingOffList:(id)a4
{
  id v5;
  _QWORD v6[5];
  id v7;

  v5 = a4;
  if (objc_msgSend(v5, "isHidden"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __92__SBMainSwitcherControllerCoordinator_appSwitcherModel_didRemoveAppLayoutForFallingOffList___block_invoke;
    v6[3] = &unk_1E8E9E3B0;
    v6[4] = self;
    v7 = v5;
    objc_msgSend(v7, "enumerate:", v6);

  }
}

void __92__SBMainSwitcherControllerCoordinator_appSwitcherModel_didRemoveAppLayoutForFallingOffList___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a3;
  objc_msgSend(v4, "preferredDisplayIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_entityForDisplayItem:displayIdentity:", v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  SBWorkspaceDestroyApplicationEntity(v7);
}

- (id)appSwitcherModel:(id)a3 willReplaceAppLayout:(id)a4 proposedReplacementAppLayout:(id)a5
{
  return a5;
}

- (BOOL)handleHomeButtonPress
{
  void *v2;
  char v3;

  -[SBMainSwitcherControllerCoordinator _embeddedDisplaySwitcherController](self, "_embeddedDisplaySwitcherController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "handleHomeButtonPress");

  return v3;
}

- (BOOL)handleHomeButtonDoublePress
{
  void *v2;
  char v3;

  -[SBMainSwitcherControllerCoordinator _embeddedDisplaySwitcherController](self, "_embeddedDisplaySwitcherController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "handleHomeButtonDoublePress");

  return v3;
}

- (BOOL)handleHomeButtonLongPress
{
  void *v2;
  char v3;

  -[SBMainSwitcherControllerCoordinator _embeddedDisplaySwitcherController](self, "_embeddedDisplaySwitcherController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "handleHomeButtonLongPress");

  return v3;
}

- (BOOL)handleLockButtonPress
{
  void *v2;
  char v3;

  -[SBMainSwitcherControllerCoordinator _embeddedDisplaySwitcherController](self, "_embeddedDisplaySwitcherController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "handleLockButtonPress");

  return v3;
}

- (BOOL)handleVoiceCommandButtonPress
{
  void *v2;
  char v3;

  -[SBMainSwitcherControllerCoordinator _embeddedDisplaySwitcherController](self, "_embeddedDisplaySwitcherController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "handleVoiceCommandButtonPress");

  return v3;
}

- (BOOL)handleVolumeUpButtonPress
{
  void *v2;
  char v3;

  -[SBMainSwitcherControllerCoordinator _embeddedDisplaySwitcherController](self, "_embeddedDisplaySwitcherController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "handleVolumeUpButtonPress");

  return v3;
}

- (BOOL)handleVolumeDownButtonPress
{
  void *v2;
  char v3;

  -[SBMainSwitcherControllerCoordinator _embeddedDisplaySwitcherController](self, "_embeddedDisplaySwitcherController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "handleVolumeDownButtonPress");

  return v3;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  -[SBMainSwitcherControllerCoordinator _embeddedDisplaySwitcherController](self, "_embeddedDisplaySwitcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "handleHeadsetButtonPress:", v3);

  return v3;
}

- (void)betaLaunchHandle:(id)a3 activateIfNeededEndedWithResult:(BOOL)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  BSDispatchMain();

}

void __88__SBMainSwitcherControllerCoordinator_betaLaunchHandle_activateIfNeededEndedWithResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "removeObject:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 384);
    *(_QWORD *)(v2 + 384) = 0;

  }
}

- (int64_t)_overrideWindowActiveInterfaceOrientation
{
  void *v3;
  void *v4;
  int64_t v5;

  -[SBMainSwitcherControllerCoordinator _embeddedDisplaySwitcherController](self, "_embeddedDisplaySwitcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SBMainSwitcherControllerCoordinator switcherInterfaceOrientationForSwitcherContentController:](self, "switcherInterfaceOrientationForSwitcherContentController:", v4);
  return v5;
}

- (void)_insertCardForDisplayIdentifier:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  SBAppLayout *v7;
  void *v8;
  void *v9;
  SBAppLayout *v10;
  SBAppLayout *testItemForInsertion;
  SBAppLayout *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  +[SBDisplayItem applicationDisplayItemWithBundleIdentifier:sceneIdentifier:](SBDisplayItem, "applicationDisplayItemWithBundleIdentifier:sceneIdentifier:", a3, CFSTR("_SB_TEST_"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [SBAppLayout alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8;
  v17[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v7, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v9, 1, 1, 0);

  testItemForInsertion = self->_testItemForInsertion;
  self->_testItemForInsertion = v10;
  v12 = v10;

  self->_testItemInsertionIndex = a4;
  -[SBMainSwitcherControllerCoordinator _embeddedDisplaySwitcherController](self, "_embeddedDisplaySwitcherController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__SBMainSwitcherControllerCoordinator__insertCardForDisplayIdentifier_atIndex___block_invoke;
  v15[3] = &unk_1E8E9DED8;
  v15[4] = self;
  -[SBMainSwitcherControllerCoordinator _insertAppLayout:atIndex:contentViewController:modelMutationBlock:completion:](self, "_insertAppLayout:atIndex:contentViewController:modelMutationBlock:completion:", v12, a4, v14, v15, 0);

}

uint64_t __79__SBMainSwitcherControllerCoordinator__insertCardForDisplayIdentifier_atIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rebuildAppListCache");
}

- (void)_removeCardForDisplayIdentifier:(id)a3
{
  void *v4;
  int v5;
  SBAppLayout *testItemForInsertion;
  SBAppLayout *v7;
  SBSwitcherModelRemovalRequest *v8;
  void *v9;
  void *v10;
  id v11;

  +[SBDisplayItem applicationDisplayItemWithBundleIdentifier:sceneIdentifier:](SBDisplayItem, "applicationDisplayItemWithBundleIdentifier:sceneIdentifier:", a3, CFSTR("_SB_TEST_"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout itemForLayoutRole:](self->_testItemForInsertion, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v11, "isEqual:", v4);

  if (v5)
  {
    testItemForInsertion = self->_testItemForInsertion;
    self->_testItemForInsertion = 0;
    v7 = testItemForInsertion;

    v8 = objc_alloc_init(SBSwitcherModelRemovalRequest);
    +[SBSwitcherModelRemovalRequestAction defaultRemovalPolicyAction](SBSwitcherModelRemovalRequestAction, "defaultRemovalPolicyAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherModelRemovalRequest setAction:forAppLayout:](v8, "setAction:forAppLayout:", v9, v7);

    -[SBMainSwitcherControllerCoordinator _switcherModelRemovalResultsForRequest:forReason:](self, "_switcherModelRemovalResultsForRequest:forReason:", v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainSwitcherControllerCoordinator _performSceneDestructionForModelRemovalResults:](self, "_performSceneDestructionForModelRemovalResults:", v10);

  }
}

- (void)_acquireAssertion:(id)a3
{
  id v4;
  NSMutableSet *asynchronousRenderingAssertions;
  NSMutableSet *v6;
  NSMutableSet *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  asynchronousRenderingAssertions = self->_asynchronousRenderingAssertions;
  if (!asynchronousRenderingAssertions)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_asynchronousRenderingAssertions;
    self->_asynchronousRenderingAssertions = v6;

    asynchronousRenderingAssertions = self->_asynchronousRenderingAssertions;
  }
  -[NSMutableSet addObject:](asynchronousRenderingAssertions, "addObject:", v4);
  SBLogAppSwitcher();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "reason");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSMutableSet count](self->_asynchronousRenderingAssertions, "count");
    v11 = 138543618;
    v12 = v9;
    v13 = 2048;
    v14 = v10;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Acquiring asynchronous rendering assertion: %{public}@, assertion count: %lu", (uint8_t *)&v11, 0x16u);

  }
  -[SBMainSwitcherControllerCoordinator _evaluateAsynchronousRenderingEnablement](self, "_evaluateAsynchronousRenderingEnablement");

}

- (void)_updateAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogAppSwitcher();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "reason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSMutableSet count](self->_asynchronousRenderingAssertions, "count");
    v8 = 138543618;
    v9 = v6;
    v10 = 2048;
    v11 = v7;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Updating asynchronous rendering assertion: %{public}@, assertion count: %lu", (uint8_t *)&v8, 0x16u);

  }
  -[SBMainSwitcherControllerCoordinator _evaluateAsynchronousRenderingEnablement](self, "_evaluateAsynchronousRenderingEnablement");

}

- (void)_reqlinquishAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableSet removeObject:](self->_asynchronousRenderingAssertions, "removeObject:", v4);
  SBLogAppSwitcher();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "reason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSMutableSet count](self->_asynchronousRenderingAssertions, "count");
    v8 = 138543618;
    v9 = v6;
    v10 = 2048;
    v11 = v7;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Relinquishing asynchronous rendering assertion: %{public}@, assertion count: %lu", (uint8_t *)&v8, 0x16u);

  }
  -[SBMainSwitcherControllerCoordinator _evaluateAsynchronousRenderingEnablement](self, "_evaluateAsynchronousRenderingEnablement");

}

- (void)_setAsynchronousRenderingEnabled:(BOOL)a3 withMinificationFilter:(BOOL)a4 forLayerTarget:(id)a5 presentationManager:(id)a6
{
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;
  BOOL v14;

  v9 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __130__SBMainSwitcherControllerCoordinator__setAsynchronousRenderingEnabled_withMinificationFilter_forLayerTarget_presentationManager___block_invoke;
  v11[3] = &unk_1E8EB1758;
  v12 = v9;
  v13 = a3;
  v14 = a4;
  v10 = v9;
  objc_msgSend(a6, "modifyDefaultPresentationContext:", v11);

}

uint64_t __130__SBMainSwitcherControllerCoordinator__setAsynchronousRenderingEnabled_withMinificationFilter_forLayerTarget_presentationManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int16 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __130__SBMainSwitcherControllerCoordinator__setAsynchronousRenderingEnabled_withMinificationFilter_forLayerTarget_presentationManager___block_invoke_2;
  v4[3] = &__block_descriptor_34_e48_v16__0__UIMutableSceneLayerPresentationContext_8l;
  v5 = *(_WORD *)(a1 + 40);
  return objc_msgSend(a2, "modifyLayerPresentationOverrideContextForLayerTarget:block:", v2, v4);
}

void __130__SBMainSwitcherControllerCoordinator__setAsynchronousRenderingEnabled_withMinificationFilter_forLayerTarget_presentationManager___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = *(unsigned __int8 *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setRenderingMode:", v3);
  if (*(_BYTE *)(a1 + 33))
    v4 = *MEMORY[0x1E0CD2B98];
  else
    v4 = 0;
  objc_msgSend(v5, "_setMinificationFilterName:", v4);

}

- (void)transactionDidComplete:(id)a3
{
  if (self->_activeGestureTransaction == a3)
    -[SBMainSwitcherControllerCoordinator setActiveGestureTransaction:](self, "setActiveGestureTransaction:", 0);
}

- (id)coordinatedSwitcherControllers
{
  return -[NSPointerArray allObjects](self->_coordinatedSwitcherControllers, "allObjects");
}

- (void)beginCoordinatingSwitcherController:(id)a3
{
  -[SBMainSwitcherControllerCoordinator beginCoordinatingSwitcherController:options:](self, "beginCoordinatingSwitcherController:options:", a3, 0);
}

- (void)beginCoordinatingSwitcherController:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v6;
  void *v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willBeginCoordinationWithCoordinator:", self);
  v8 = -[NSPointerArray count](self->_coordinatedSwitcherControllers, "count");
  if (!v8)
    goto LABEL_7;
  v9 = v8;
  v10 = 0;
  while (1)
  {
    -[NSPointerArray pointerAtIndex:](self->_coordinatedSwitcherControllers, "pointerAtIndex:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 == v6)
      break;
    if (v9 == ++v10)
      goto LABEL_7;
  }
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_7:
    -[NSPointerArray addPointer:](self->_coordinatedSwitcherControllers, "addPointer:", v6);
    -[NSPointerArray compact](self->_coordinatedSwitcherControllers, "compact");
  }
  -[NSMapTable setObject:forKey:](self->_switcherControllersByWindowScene, "setObject:forKey:", v6, v7);
  -[SBMainSwitcherControllerCoordinator _rebuildCurrentWindowingModeCompatibleAppLayoutsIfNecessary](self, "_rebuildCurrentWindowingModeCompatibleAppLayoutsIfNecessary");
  objc_msgSend(v7, "layoutStateProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutState");
  v13 = objc_claimAutoreleasedReturnValue();
  -[SBMainSwitcherControllerCoordinator _updateHomeScreenDisplayLayoutElementForLayoutState:switcherController:](self, "_updateHomeScreenDisplayLayoutElementForLayoutState:switcherController:", v13, v6);

  -[SBMainSwitcherControllerCoordinator _defaultSwitcherController](self, "_defaultSwitcherController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_msgSend(v6, "isEqual:", v14);

  if ((v13 & 1) == 0)
  {
    v27 = v4;
    v28 = v7;
    objc_msgSend(v6, "layoutState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "displayOrdinal");

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[SBMainSwitcherControllerCoordinator appLayoutsForSwitcherController:](self, "appLayoutsForSwitcherController:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v31 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          -[SBAppSwitcherModel bestLastDisplayItemLayoutAttributesMapForAppLayout:displayOrdinal:](self->_mainSwitcherModel, "bestLastDisplayItemLayoutAttributesMapForAppLayout:displayOrdinal:", v22, v16);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "appLayoutByModifyingLayoutAttributesForItems:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBAppSwitcherModel replaceAppLayout:withAppLayout:](self->_mainSwitcherModel, "replaceAppLayout:withAppLayout:", v22, v24);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v19);
    }

    v4 = v27;
    v7 = v28;
  }
  objc_msgSend(v6, "didBeginCoordinationWithCoordinator:", self);
  -[SBMainSwitcherControllerCoordinator _notifySwitcherControllersAppLayoutsDidChange](self, "_notifySwitcherControllersAppLayoutsDidChange");
  -[SBMainSwitcherControllerCoordinator _notifySwitcherControllersCoordinatedSwitcherControllersDidChange](self, "_notifySwitcherControllersCoordinatedSwitcherControllersDidChange");
  if ((v4 & 1) != 0)
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_fbsDisplayConfiguration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __83__SBMainSwitcherControllerCoordinator_beginCoordinatingSwitcherController_options___block_invoke;
    v29[3] = &unk_1E8E9EE78;
    v29[4] = self;
    objc_msgSend(v25, "requestTransitionWithOptions:displayConfiguration:builder:", 0, v26, v29);

  }
}

void __83__SBMainSwitcherControllerCoordinator_beginCoordinatingSwitcherController_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_defaultSwitcherController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_currentMainAppLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBMutableSwitcherTransitionRequest, "requestForActivatingAppLayout:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAnimationDisabled:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_configureRequest:forSwitcherTransitionRequest:withEventLabel:", v4, v7, CFSTR("ContinuityScreenConnect"));

}

- (void)endCoordinatingSwitcherController:(id)a3
{
  -[SBMainSwitcherControllerCoordinator endCoordinatingSwitcherController:options:](self, "endCoordinatingSwitcherController:options:", a3, 0);
}

- (void)endCoordinatingSwitcherController:(id)a3 options:(unint64_t)a4
{
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void (**v33)(_QWORD, _QWORD);
  void *v34;
  char v35;
  id v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  SBMainSwitcherControllerCoordinator *val;
  uint64_t i;
  _QWORD v45[5];
  void (**v46)(_QWORD, _QWORD);
  _QWORD v47[6];
  void (**v48)(_QWORD, _QWORD);
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id location;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v35 = a4;
  v63 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  objc_msgSend(v36, "willEndCoordinationWithCoordinator:", self);
  val = self;
  -[SBMainSwitcherControllerCoordinator _defaultSwitcherController](self, "_defaultSwitcherController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v36;
  v7 = objc_msgSend(v36, "isEqual:", v5);

  if ((v7 & 1) == 0)
  {
    objc_initWeak(&location, val);
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __81__SBMainSwitcherControllerCoordinator_endCoordinatingSwitcherController_options___block_invoke;
    v57[3] = &unk_1E8EA1598;
    objc_copyWeak(&v59, &location);
    v8 = v36;
    v58 = v8;
    v33 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v57);
    -[SBMainSwitcherControllerCoordinator _defaultSwitcherController](val, "_defaultSwitcherController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "windowScene");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sceneManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "layoutState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v10, "displayOrdinal");

    v11 = v8;
    objc_msgSend(v11, "windowScene");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sceneManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[SBMainSwitcherControllerCoordinator appLayoutsForSwitcherController:](val, "appLayoutsForSwitcherController:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    if (v14)
    {
      v40 = v14;
      v15 = 0;
      obj = v13;
      v38 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v54 != v38)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          -[SBAppSwitcherModel bestLastDisplayItemLayoutAttributesMapForAppLayout:displayOrdinal:](val->_mainSwitcherModel, "bestLastDisplayItemLayoutAttributesMapForAppLayout:displayOrdinal:", v16, v39);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "appLayoutByModifyingLayoutAttributesForItems:");
          v17 = objc_claimAutoreleasedReturnValue();
          -[SBAppSwitcherModel replaceAppLayout:withAppLayout:](val->_mainSwitcherModel, "replaceAppLayout:withAppLayout:", v16, v17);
          v41 = (void *)v17;
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          objc_msgSend(v16, "allItems");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
          if (v19)
          {
            v20 = *(_QWORD *)v50;
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v50 != v20)
                  objc_enumerationMutation(v18);
                objc_msgSend(v11, "_deviceApplicationSceneHandleForDisplayItem:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = v22;
                if (v22)
                {
                  objc_msgSend(v22, "_sceneIdentity");
                  v24 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "transferOwnershipOfSceneWithIdentity:toSceneManager:", v24, v9);

                  objc_msgSend(v23, "sceneIfExists");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v24) = v25 != 0;

                  v15 |= v24;
                }

              }
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
            }
            while (v19);
          }

        }
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      }
      while (v40);

      if ((v35 & 1) == 0)
      {
        if ((v15 & 1) != 0)
        {
          +[SBWorkspace mainWorkspace](SBMainWorkspace, "mainWorkspace");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "_fbsDisplayConfiguration");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v45[0] = MEMORY[0x1E0C809B0];
          v45[1] = 3221225472;
          v45[2] = __81__SBMainSwitcherControllerCoordinator_endCoordinatingSwitcherController_options___block_invoke_3;
          v45[3] = &unk_1E8EA0C58;
          v28 = v45;
          v45[4] = v32;
          v46 = v33;
          objc_msgSend(v26, "requestTransitionWithOptions:displayConfiguration:builder:", 0, v27, v45);

LABEL_24:
          goto LABEL_25;
        }
LABEL_22:
        v33[2](v33, 1);
LABEL_25:

        objc_destroyWeak(&v59);
        objc_destroyWeak(&location);
        v6 = v36;
        goto LABEL_26;
      }
    }
    else
    {

      if ((v35 & 1) == 0)
        goto LABEL_22;
    }
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_fbsDisplayConfiguration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __81__SBMainSwitcherControllerCoordinator_endCoordinatingSwitcherController_options___block_invoke_2;
    v47[3] = &unk_1E8EB1780;
    v28 = v47;
    v47[4] = v11;
    v47[5] = val;
    v48 = v33;
    objc_msgSend(v29, "requestTransitionWithOptions:displayConfiguration:builder:", 0, v30, v47);

    goto LABEL_24;
  }
LABEL_26:

}

void __81__SBMainSwitcherControllerCoordinator_endCoordinatingSwitcherController_options___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id *v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11[51], "objectForKey:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");
    objc_msgSend(v11[51], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v11[52], "objectForKey:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");
    objc_msgSend(v11[52], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v11[4], "removeObjectForKey:", v3);
    objc_msgSend(v11[2], "removeObjectForKey:", v3);
    v6 = objc_msgSend(v11[1], "count");
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      while (1)
      {
        objc_msgSend(v11[1], "pointerAtIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 32);

        if (v10 == v9)
          break;
        if (v7 == ++v8)
          goto LABEL_9;
      }
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v11[1], "removePointerAtIndex:", v8);
        objc_msgSend(v11[1], "compact");
      }
    }
LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "didEndCoordinationWithCoordinator:", v11);
    objc_msgSend(v11, "_notifySwitcherControllersAppLayoutsDidChange");
    objc_msgSend(v11, "_notifySwitcherControllersCoordinatedSwitcherControllersDidChange");

    WeakRetained = v11;
  }

}

void __81__SBMainSwitcherControllerCoordinator_endCoordinatingSwitcherController_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_currentMainAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBMutableSwitcherTransitionRequest, "requestForActivatingAppLayout:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAnimationDisabled:", 1);
  objc_msgSend(*(id *)(a1 + 40), "_configureRequest:forSwitcherTransitionRequest:withEventLabel:", v3, v5, CFSTR("ContinuityScreenDisconnect"));
  objc_msgSend(v3, "setShouldPreventDismissalOfUnrelatedTransientOverlays:", 1);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v3, "applicationContext", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationSceneEntities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "setFlag:forActivationSetting:", 1, 40);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  v12 = (id)objc_msgSend(v3, "addCompletionHandler:", *(_QWORD *)(a1 + 48));
}

void __81__SBMainSwitcherControllerCoordinator_endCoordinatingSwitcherController_options___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 17);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__SBMainSwitcherControllerCoordinator_endCoordinatingSwitcherController_options___block_invoke_4;
  v5[3] = &unk_1E8E9EE50;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "modifyApplicationContext:", v5);
  v4 = (id)objc_msgSend(v3, "addCompletionHandler:", *(_QWORD *)(a1 + 40));

}

void __81__SBMainSwitcherControllerCoordinator_endCoordinatingSwitcherController_options___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "layoutStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (SBLayoutRoleIsValid(objc_msgSend(v4, "windowPickerRole")))
    objc_msgSend(v5, "setRequestedWindowPickerRole:", objc_msgSend(v4, "windowPickerRole"));
  if (objc_msgSend(v4, "unlockedEnvironmentMode") == 2)
    objc_msgSend(v5, "setRequestedUnlockedEnvironmentMode:", 2);

}

uint64_t __71__SBMainSwitcherControllerCoordinator_appLayoutsForSwitcherController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMainDisplayWindowScene") ^ 1;
}

uint64_t __71__SBMainSwitcherControllerCoordinator_appLayoutsForSwitcherController___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(a1 + 32));
}

BOOL __71__SBMainSwitcherControllerCoordinator_appLayoutsForSwitcherController___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _BOOL8 v5;

  objc_msgSend(a2, "layoutState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "displayOrdinal");
  v5 = v4 == objc_msgSend(*(id *)(a1 + 32), "preferredDisplayOrdinal");

  return v5;
}

void __70__SBMainSwitcherControllerCoordinator_switcherControllerForAppLayout___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "appLayoutsForSwitcherController:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__SBMainSwitcherControllerCoordinator_switcherControllerForAppLayout___block_invoke_2;
  v8[3] = &unk_1E8E9DF78;
  v9 = *(id *)(a1 + 40);
  if (objc_msgSend(v6, "bs_containsObjectPassingTest:", v8))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *a3 = 1;
  }

}

uint64_t __70__SBMainSwitcherControllerCoordinator_switcherControllerForAppLayout___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isOrContainsAppLayout:", *(_QWORD *)(a1 + 32));
}

- (id)switcherControllerForDisplayItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (-[NSMapTable count](self->_switcherControllersByWindowScene, "count") == 1)
  {
    -[NSMapTable objectEnumerator](self->_switcherControllersByWindowScene, "objectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nextObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__62;
    v15 = __Block_byref_object_dispose__62;
    v16 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__SBMainSwitcherControllerCoordinator_switcherControllerForDisplayItem___block_invoke;
    v8[3] = &unk_1E8EA7360;
    v9 = v4;
    v10 = &v11;
    -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", v8);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }

  return v6;
}

void __72__SBMainSwitcherControllerCoordinator_switcherControllerForDisplayItem___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "_currentMainAppLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsItem:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (id)convertAppLayout:(id)a3 fromSwitcherController:(id)a4 toSwitcherController:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "isEqual:", v9))
  {
    v10 = v7;
  }
  else
  {
    objc_msgSend(v9, "layoutState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appLayoutByModifyingPreferredDisplayOrdinal:", objc_msgSend(v11, "displayOrdinal"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "windowManagementStyle") != 2 && objc_msgSend(v9, "windowManagementStyle") == 2)
    {
      objc_msgSend(v10, "appLayoutByAdjustingCenterWindowItemsForChamois");
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v12;
    }
  }

  return v10;
}

- (void)switcherControllerViewWillAppear:(id)a3 animated:(BOOL)a4
{
  -[SBMainSwitcherControllerCoordinator _rebuildAppListCache](self, "_rebuildAppListCache", a3, a4);
  -[SBMainSwitcherControllerCoordinator _updateBestAppSuggestion](self, "_updateBestAppSuggestion");
}

- (void)switcherControllerWillUpdateWindowManagementStyle:(id)a3
{
  -[SBMainSwitcherControllerCoordinator failMultitaskingGesturesForReason:](self, "failMultitaskingGesturesForReason:", CFSTR("Window management style is changing"));
}

- (void)setActiveGestureTransaction:(id)a3
{
  SBFluidSwitcherGestureWorkspaceTransaction *v5;
  SBFluidSwitcherGestureWorkspaceTransaction *activeGestureTransaction;
  _QWORD v7[4];
  SBFluidSwitcherGestureWorkspaceTransaction *v8;

  v5 = (SBFluidSwitcherGestureWorkspaceTransaction *)a3;
  activeGestureTransaction = self->_activeGestureTransaction;
  if (activeGestureTransaction != v5)
  {
    -[SBFluidSwitcherGestureWorkspaceTransaction removeObserver:](activeGestureTransaction, "removeObserver:", self);
    objc_storeStrong((id *)&self->_activeGestureTransaction, a3);
    -[SBFluidSwitcherGestureWorkspaceTransaction addObserver:](self->_activeGestureTransaction, "addObserver:", self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__SBMainSwitcherControllerCoordinator_setActiveGestureTransaction___block_invoke;
    v7[3] = &unk_1E8EB1300;
    v8 = v5;
    -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", v7);

  }
}

void __67__SBMainSwitcherControllerCoordinator_setActiveGestureTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "gestureManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActiveGestureTransaction:", *(_QWORD *)(a1 + 32));

}

- (BOOL)liveContentOverlayUpdatesSuspended
{
  return self->_liveContentOverlayUpdatesSuspended;
}

- (void)setLiveContentOverlayUpdatesSuspended:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[4];
  BOOL v5;

  if (self->_liveContentOverlayUpdatesSuspended != a3)
  {
    v3 = MEMORY[0x1E0C809B0];
    self->_liveContentOverlayUpdatesSuspended = a3;
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __77__SBMainSwitcherControllerCoordinator_setLiveContentOverlayUpdatesSuspended___block_invoke;
    v4[3] = &__block_descriptor_33_e34_v24__0__SBSwitcherController_8_B16l;
    v5 = a3;
    -[SBMainSwitcherControllerCoordinator enumerateSwitcherControllersWithBlock:](self, "enumerateSwitcherControllersWithBlock:", v4);
  }
}

void __77__SBMainSwitcherControllerCoordinator_setLiveContentOverlayUpdatesSuspended___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "setLiveContentOverlayUpdatesSuspended:", *(unsigned __int8 *)(a1 + 32));
}

- (void)prepareForCoordinatedLayoutStateTransitionWithContext:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_currentCoordinatedLayoutStateTransitionContext, a3);
  v5 = a3;
  -[SBSwitcherCoordinatedLayoutStateTransitionContext fromSwitcherController](self->_currentCoordinatedLayoutStateTransitionContext, "fromSwitcherController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareForCoordinatedLayoutStateTransitionWithContext:", self->_currentCoordinatedLayoutStateTransitionContext);

  -[SBSwitcherCoordinatedLayoutStateTransitionContext toSwitcherController](self->_currentCoordinatedLayoutStateTransitionContext, "toSwitcherController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prepareForCoordinatedLayoutStateTransitionWithContext:", self->_currentCoordinatedLayoutStateTransitionContext);

}

- (void)cleanUpAfterCoordinatedLayoutStateTransitionWithContext:(id)a3
{
  void *v4;
  void *v5;
  SBSwitcherCoordinatedLayoutStateTransitionContext *currentCoordinatedLayoutStateTransitionContext;

  -[SBSwitcherCoordinatedLayoutStateTransitionContext fromSwitcherController](self->_currentCoordinatedLayoutStateTransitionContext, "fromSwitcherController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cleanUpAfterCoordinatedLayoutStateTransitionWithContext:", self->_currentCoordinatedLayoutStateTransitionContext);

  -[SBSwitcherCoordinatedLayoutStateTransitionContext toSwitcherController](self->_currentCoordinatedLayoutStateTransitionContext, "toSwitcherController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cleanUpAfterCoordinatedLayoutStateTransitionWithContext:", self->_currentCoordinatedLayoutStateTransitionContext);

  currentCoordinatedLayoutStateTransitionContext = self->_currentCoordinatedLayoutStateTransitionContext;
  self->_currentCoordinatedLayoutStateTransitionContext = 0;

}

- (id)_switcherControllerForTransitionRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__SBMainSwitcherControllerCoordinator__switcherControllerForTransitionRequest___block_invoke;
  v8[3] = &unk_1E8EA7530;
  v9 = v4;
  v5 = v4;
  -[SBMainSwitcherControllerCoordinator _switcherControllerPassingTest:](self, "_switcherControllerPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __79__SBMainSwitcherControllerCoordinator__switcherControllerForTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_fbsDisplayIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "displayIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (id)_defaultSwitcherController
{
  void *v3;

  v3 = -[NSPointerArray count](self->_coordinatedSwitcherControllers, "count");
  if (v3)
  {
    -[NSPointerArray pointerAtIndex:](self->_coordinatedSwitcherControllers, "pointerAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationAssertion, 0);
  objc_storeStrong((id *)&self->_captureApplicationWatchdog, 0);
  objc_storeStrong((id *)&self->_chamoisWindowingUIEverEnabledObserver, 0);
  objc_storeStrong((id *)&self->_displayLayoutTransitionsBySwitcherController, 0);
  objc_storeStrong((id *)&self->_homeScreenDisplayLayoutElementAssertionsBySwitcherController, 0);
  objc_storeStrong((id *)&self->_homeScreenDisplayLayoutElement, 0);
  objc_storeStrong((id *)&self->_storeAppLaunchUIActivationQueue, 0);
  objc_storeStrong((id *)&self->_activeBetaLaunchHandles, 0);
  objc_storeStrong((id *)&self->_homeGrabberSettings, 0);
  objc_storeStrong((id *)&self->_keyboardHomeAffordanceAssertion, 0);
  objc_storeStrong((id *)&self->_medusaKeyboardScene, 0);
  objc_storeStrong((id *)&self->_recentSwipeUpToKillTimestampsForAppLayouts, 0);
  objc_storeStrong((id *)&self->_disableCachingAsynchronousRenderingSurfacesTimer, 0);
  objc_storeStrong((id *)&self->_asynchronousRenderingCachedSurfacesReasons, 0);
  objc_storeStrong((id *)&self->_asynchronousRenderingAssertions, 0);
  objc_storeStrong((id *)&self->_preventSupplementalSnapshotsInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_preventSupplementalSnapshotsAssertion, 0);
  objc_storeStrong((id *)&self->_containerStatusBarContentAssertion, 0);
  objc_storeStrong((id *)&self->_floatingStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_mainStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_deactivatingScenesResignActiveAssertion, 0);
  objc_storeStrong((id *)&self->_keyboardFocusObserver, 0);
  objc_storeStrong((id *)&self->_keyboardFocusController, 0);
  objc_storeStrong((id *)&self->_userQuitMonitorServer, 0);
  objc_storeStrong((id *)&self->_demoFilteringHiddenAppLayouts, 0);
  objc_storeStrong((id *)&self->_demoFilteringController, 0);
  objc_storeStrong((id *)&self->_demoCommandsServer, 0);
  objc_storeStrong((id *)&self->_mainSwitcherModel, 0);
  objc_storeStrong((id *)&self->_testItemForInsertion, 0);
  objc_storeStrong((id *)&self->_wallpaperScaleAssertion, 0);
  objc_storeStrong((id *)&self->_lockKeyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_deferRotationForAppSwitcherAssertion, 0);
  objc_storeStrong((id *)&self->_liveDisplayItemsBeingTerminated, 0);
  objc_storeStrong((id *)&self->_servicesRemovedWhileAwayFromSwitcher, 0);
  objc_storeStrong((id *)&self->_sheetMetricsCache, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_currentCoordinatedLayoutStateTransitionContext, 0);
  objc_storeStrong((id *)&self->_activeTransitionModelRemovalAppLayoutToRemovalContext, 0);
  objc_storeStrong((id *)&self->_activeTransitionModelRemovalResults, 0);
  objc_storeStrong((id *)&self->_activeGestureTransaction, 0);
  objc_storeStrong((id *)&self->_windowDragSceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_draggingAppLayouts, 0);
  objc_storeStrong((id *)&self->_appLayoutToEligibleTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_appLayoutToAcquiredTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_switcherServices, 0);
  objc_storeStrong((id *)&self->_appLayouts, 0);
  objc_storeStrong((id *)&self->_previousLayoutStatesByWindowScene, 0);
  objc_storeStrong((id *)&self->_currentWindowingModeCompatibleAppLayoutsByWindowScene, 0);
  objc_storeStrong((id *)&self->_lastMeaningfullyDifferentLayoutStatesByWindowScene, 0);
  objc_storeStrong((id *)&self->_switcherControllersByWindowScene, 0);
  objc_storeStrong((id *)&self->_coordinatedSwitcherControllers, 0);
}

void __94__SBMainSwitcherControllerCoordinator__presentStoreKitSheetIfNeededWithAppInfo_processHandle___block_invoke_2_cold_1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "StoreKit sheet preflight result: %d", (uint8_t *)v2, 8u);
}

void __112__SBMainSwitcherControllerCoordinator__requestAutomaticUpdateAuthorizationIfNecessaryWithAppInfo_processHandle___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "Error acquiring automatic update authorization for %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_beginDisplayLayoutTransitionForSwitcherController:(NSObject *)a3 reason:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, a3, (uint64_t)a3, "SwitcherController %p asked to being displayLayoutTransition reason: %@ without ending previous one, forcibly ending the previous", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2_0();
}

void __89__SBMainSwitcherControllerCoordinator__chamoisWindowingUIEverEnabledDefaultChangeHandler__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _SBFLoggingMethodProem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = a2;
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, a3, v6, "%{public}@ received error back from education service: %{public}@", (uint8_t *)&v7);

}

void __86__SBMainSwitcherControllerCoordinator__performSceneDestructionForModelRemovalResults___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Error while attempting to disconnect scene: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

@end
