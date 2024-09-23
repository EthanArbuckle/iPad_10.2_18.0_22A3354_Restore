@implementation SBFullScreenSwitcherLiveContentOverlayCoordinator

void __89__SBFullScreenSwitcherLiveContentOverlayCoordinator_noteKeyboardFocusDidChangeToSceneID___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;

  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (BOOL)wantsEdgeProtectForHomeGestureForAppLayout:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a3, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "type"))
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0D231F0];
    objc_msgSend(v4, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identityForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_opt_class();
    -[SBFullScreenSwitcherLiveContentOverlayCoordinator _sceneManager](self, "_sceneManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "existingSceneHandleForSceneIdentity:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v12, "isEdgeProtectEnabledForHomeGesture");
  }

  return v5;
}

- (BOOL)wantsHomeAffordanceAutoHideForAppLayout:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a3, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "type"))
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0D231F0];
    objc_msgSend(v4, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identityForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_opt_class();
    -[SBFullScreenSwitcherLiveContentOverlayCoordinator _sceneManager](self, "_sceneManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "existingSceneHandleForSceneIdentity:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v12, "isAutoHideEnabledForHomeAffordance");
  }

  return v5;
}

- (SBSceneManager)_sceneManager
{
  void *v2;
  void *v3;

  -[SBFullScreenSwitcherLiveContentOverlayCoordinator _sbWindowScene](self, "_sbWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBSceneManager *)v3;
}

- (SBWindowScene)_sbWindowScene
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBWindowScene *)v3;
}

- (void)noteKeyboardFocusDidChangeToSceneID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBFullScreenSwitcherLiveContentOverlayCoordinator setKeyboardFocusSceneID:](self, "setKeyboardFocusSceneID:", v4);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  objc_msgSend((id)SBApp, "systemUIScenesCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overlayUISceneController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __89__SBFullScreenSwitcherLiveContentOverlayCoordinator_noteKeyboardFocusDidChangeToSceneID___block_invoke;
  v25[3] = &unk_1E8EA7310;
  v7 = v4;
  v26 = v7;
  v27 = &v28;
  objc_msgSend(v6, "enumerateScenesWithBlock:", v25);

  if (!*((_BYTE *)v29 + 24))
  {
    -[SBFullScreenSwitcherLiveContentOverlayCoordinator setSceneIDForTargetOfKeyboardShortcuts:](self, "setSceneIDForTargetOfKeyboardShortcuts:", v7);
    objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    -[SBFullScreenSwitcherLiveContentOverlayCoordinator _sceneManager](self, "_sceneManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "existingSceneHandleForSceneIdentity:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "application");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFullScreenSwitcherLiveContentOverlayCoordinator setBundleIDForTargetOfKeyboardShortcuts:](self, "setBundleIDForTargetOfKeyboardShortcuts:", v14);

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableDictionary allValues](self->_appLayoutToLiveContentOverlayContext, "allValues", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v32, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v19, "overlayType") == 1)
        {
          objc_msgSend(v19, "overlay");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "noteKeyboardFocusDidChangeToSceneID:", v7);

        }
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v32, 16);
    }
    while (v16);
  }

  _Block_object_dispose(&v28, 8);
}

- (void)setSceneIDForTargetOfKeyboardShortcuts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setKeyboardFocusSceneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setBundleIDForTargetOfKeyboardShortcuts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)willRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 alongsideContainerView:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v6 = a6;
  v22 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMutableDictionary allValues](self->_appLayoutToLiveContentOverlayContext, "allValues", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15), "overlay");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "willRotateFromInterfaceOrientation:toInterfaceOrientation:alongsideContainerView:animated:", a3, a4, v10, v6);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allValues](self->_appLayoutToLiveContentOverlayContext, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "overlay");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "didRotateFromInterfaceOrientation:toInterfaceOrientation:", a3, a4);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _BOOL8 v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  char v41;
  uint64_t v42;
  void *v43;
  NSMutableDictionary *appLayoutToLiveContentOverlayContext;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  id obj;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD v82[5];
  id v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[SBFullScreenSwitcherLiveContentOverlayCoordinator areLiveContentOverlayUpdatesSuspended](self, "areLiveContentOverlayUpdatesSuspended"))
  {
    objc_msgSend(v7, "applicationTransitionContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "previousLayoutState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v8;
    objc_msgSend(v8, "layoutState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = v9;

      v10 = v12;
    }
    objc_msgSend(v9, "appLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatingAppLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v13;
    objc_msgSend(v13, "leafAppLayouts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v14, "leafAppLayouts");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v15)
      {
        objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v16);
        v18 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v18;
      }
      else
      {
        v15 = (void *)v16;
      }
    }
    objc_msgSend(v10, "invalidateAppLayout");
    objc_msgSend(v10, "invalidateFloatingAppLayout");
    objc_msgSend(v10, "appLayout");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatingAppLayout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v19;
    objc_msgSend(v19, "leafAppLayouts");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v10;
    v69 = v20;
    if (v20)
    {
      v22 = v9;
      objc_msgSend(v20, "leafAppLayouts");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      if (v21)
      {
        objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v23);
        v25 = objc_claimAutoreleasedReturnValue();

        v21 = (void *)v25;
      }
      else
      {
        v21 = (void *)v23;
      }
      v9 = v22;
      v10 = v67;
    }
    v63 = v15;
    v64 = v14;
    v26 = BSEqualObjects();
    if (v21 && (v26 & 1) == 0)
    {
      v61 = v9;
      v62 = v6;
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v60 = v21;
      obj = v21;
      v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
      if (!v72)
        goto LABEL_40;
      v71 = *(_QWORD *)v86;
      v66 = v7;
      while (1)
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v86 != v71)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v27);
          v29 = 3;
          if (objc_msgSend(v28, "environment") != 2)
          {
            objc_msgSend(v28, "allItems");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "firstObject");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v73, "layoutRoleForItem:", v31);

          }
          -[NSMutableDictionary objectForKey:](self->_appLayoutToLiveContentOverlayContext, "objectForKey:", v28);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "overlay");
          v33 = objc_claimAutoreleasedReturnValue();
          if (!v33)
            goto LABEL_26;
          v34 = (void *)v33;
          if (objc_msgSend(v32, "overlayType") != 3)
          {
            if (objc_msgSend(v32, "overlayType") == 2)
            {
              objc_msgSend(v67, "elementWithRole:", v29);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "workspaceEntity");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "isAppClipPlaceholderEntity");

              if ((v41 & 1) != 0)
              {
                v7 = v66;
                goto LABEL_30;
              }
              -[SBFullScreenSwitcherLiveContentOverlayCoordinator _removeOverlayForAppLayout:animated:](self, "_removeOverlayForAppLayout:animated:", v28, 0);
              v7 = v66;
              goto LABEL_25;
            }
            if (objc_msgSend(v32, "overlayType") != 4
              || !-[SBSwitcherCoordinatedLayoutStateTransitionContext hasTransitioningDisplayItemsForAppLayout:](self->_currentCoordinatedLayoutStateTransitionContext, "hasTransitioningDisplayItemsForAppLayout:", v28))
            {
              goto LABEL_30;
            }
          }
          -[SBFullScreenSwitcherLiveContentOverlayCoordinator _removeOverlayForAppLayout:animated:](self, "_removeOverlayForAppLayout:animated:", v28, 0);
LABEL_25:

LABEL_26:
          v35 = -[SBFullScreenSwitcherLiveContentOverlayCoordinator _shouldAnimateAddingLiveContentOverlayForTransitionContext:leafAppLayout:](self, "_shouldAnimateAddingLiveContentOverlayForTransitionContext:leafAppLayout:", v70, v28);
          objc_msgSend(v28, "itemForLayoutRole:", 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29 == 3)
            v37 = v69;
          else
            v37 = v73;
          v38 = -[SBFullScreenSwitcherLiveContentOverlayCoordinator _newLiveContentOverlayForApplicationContext:layoutRole:sbsDisplayLayoutRole:](self, "_newLiveContentOverlayForApplicationContext:layoutRole:sbsDisplayLayoutRole:", v70, v29, -[SBFullScreenSwitcherLiveContentOverlayCoordinator _calculateSBSDisplayLayoutElementRoleForDisplayItem:inAppLayout:](self, "_calculateSBSDisplayLayoutElementRoleForDisplayItem:inAppLayout:", v36, v37));
          -[SBFullScreenSwitcherLiveContentOverlayCoordinator _addOverlay:forAppLayout:animated:](self, "_addOverlay:forAppLayout:animated:", v38, v28, v35);

          v34 = 0;
LABEL_30:

          ++v27;
        }
        while (v72 != v27);
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
        v72 = v42;
        if (!v42)
        {
LABEL_40:

          v9 = v61;
          v6 = v62;
          v10 = v67;
          v21 = v60;
          break;
        }
      }
    }
    v43 = (void *)objc_opt_new();
    appLayoutToLiveContentOverlayContext = self->_appLayoutToLiveContentOverlayContext;
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __124__SBFullScreenSwitcherLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke;
    v82[3] = &unk_1E8EA72A8;
    v82[4] = self;
    v45 = v21;
    v83 = v45;
    v46 = v43;
    v84 = v46;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appLayoutToLiveContentOverlayContext, "enumerateKeysAndObjectsUsingBlock:", v82);
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v47 = v46;
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v49; ++i)
        {
          if (*(_QWORD *)v79 != v50)
            objc_enumerationMutation(v47);
          -[SBFullScreenSwitcherLiveContentOverlayCoordinator _removeOverlayForAppLayout:animated:](self, "_removeOverlayForAppLayout:animated:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i), 0);
        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
      }
      while (v49);
    }

    -[NSMutableDictionary bs_each:](self->_appLayoutToLiveContentOverlayContext, "bs_each:", &__block_literal_global_81);
    -[SBFullScreenSwitcherLiveContentOverlayCoordinator _updateAlwaysLiveSceneContentOverlays](self, "_updateAlwaysLiveSceneContentOverlays");
    -[SBFullScreenSwitcherLiveContentOverlayCoordinator _updatePortaledSceneLiveContentOverlays](self, "_updatePortaledSceneLiveContentOverlays");
    -[SBFullScreenSwitcherLiveContentOverlayCoordinator _updateFullScreenDisplayLayoutElementsForActiveAppLayouts:inAppLayout:](self, "_updateFullScreenDisplayLayoutElementsForActiveAppLayouts:inAppLayout:", v45, v73);

  }
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  -[NSMutableDictionary allValues](self->_appLayoutToLiveContentOverlayContext, "allValues");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v75;
    do
    {
      for (j = 0; j != v54; ++j)
      {
        if (*(_QWORD *)v75 != v55)
          objc_enumerationMutation(v52);
        v57 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
        if (objc_msgSend(v57, "overlayType") == 1)
        {
          objc_msgSend(v57, "overlay");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "contentViewController");
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v59, "layoutStateTransitionCoordinator:transitionDidEndWithTransitionContext:", v6, v7);

        }
      }
      v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
    }
    while (v54);
  }

}

void __92__SBFullScreenSwitcherLiveContentOverlayCoordinator__updatePortaledSceneLiveContentOverlays__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "overlayType") == 4 && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "_removeOverlayForAppLayout:animated:", v5, 0);

}

- (void)_updatePortaledSceneLiveContentOverlays
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  SBSwitcherCoordinatedLayoutStateTransitionContext *currentCoordinatedLayoutStateTransitionContext;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  int64_t v29;
  int64_t v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  SBFluidSwitcherPortaledSceneLiveContentOverlay *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  id obj;
  void *v67;
  uint64_t v68;
  id v69;
  void *v70;
  uint64_t v71;
  id WeakRetained;
  id v74;
  _QWORD v75[4];
  id v76;
  SBFullScreenSwitcherLiveContentOverlayCoordinator *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[4];
  id v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "switcherCoordinator");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "contentViewController");
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

  v63 = v6;
  objc_msgSend(v6, "layoutContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeGesture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gestureEvent");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (objc_msgSend(v64, "isWindowDragGestureEvent"))
  {
    objc_msgSend(v64, "selectedAppLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemForLayoutRole:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = 0;
    v90 = &v89;
    v91 = 0x3032000000;
    v92 = __Block_byref_object_copy__23;
    v93 = __Block_byref_object_dispose__23;
    v94 = 0;
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __92__SBFullScreenSwitcherLiveContentOverlayCoordinator__updatePortaledSceneLiveContentOverlays__block_invoke;
    v86[3] = &unk_1E8EA7360;
    v11 = v10;
    v87 = v11;
    v88 = &v89;
    objc_msgSend(v70, "enumerateSwitcherControllersWithBlock:", v86);
    v12 = (void *)v90[5];
    if (!v12)
    {
      objc_msgSend(v70, "switcherControllerForDisplayItem:", v11);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v90[5];
      v90[5] = v13;

      v12 = (void *)v90[5];
    }
    v74 = v12;
    objc_msgSend(v74, "layoutState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appLayoutByModifyingPreferredDisplayOrdinal:", objc_msgSend(v15, "displayOrdinal"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v65, "addObject:", v16);
    _Block_object_dispose(&v89, 8);

LABEL_10:
    goto LABEL_22;
  }
  currentCoordinatedLayoutStateTransitionContext = self->_currentCoordinatedLayoutStateTransitionContext;
  if (currentCoordinatedLayoutStateTransitionContext)
  {
    -[SBSwitcherCoordinatedLayoutStateTransitionContext toSwitcherController](currentCoordinatedLayoutStateTransitionContext, "toSwitcherController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(WeakRetained, "isEqual:", v18);

    if (v19)
    {
      -[SBSwitcherCoordinatedLayoutStateTransitionContext fromSwitcherController](self->_currentCoordinatedLayoutStateTransitionContext, "fromSwitcherController");
      v74 = (id)objc_claimAutoreleasedReturnValue();
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      -[SBSwitcherCoordinatedLayoutStateTransitionContext displayItems](self->_currentCoordinatedLayoutStateTransitionContext, "displayItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v83;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v83 != v21)
              objc_enumerationMutation(v16);
            v23 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i);
            -[SBSwitcherCoordinatedLayoutStateTransitionContext toAppLayout](self->_currentCoordinatedLayoutStateTransitionContext, "toAppLayout");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "leafAppLayoutForItem:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v65, "addObject:", v25);
          }
          v20 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
        }
        while (v20);
      }
      goto LABEL_10;
    }
  }
  v74 = 0;
LABEL_22:
  v69 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if ((BSEqualObjects() & 1) == 0)
  {
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    obj = v65;
    v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v95, 16);
    if (v71)
    {
      v68 = *(_QWORD *)v79;
      do
      {
        for (j = 0; j != v71; ++j)
        {
          if (*(_QWORD *)v79 != v68)
            objc_enumerationMutation(obj);
          v27 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j);
          objc_msgSend(v70, "convertAppLayout:fromSwitcherController:toSwitcherController:", v27, v74, WeakRetained);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "addObject:", v28);
          v29 = -[SBFullScreenSwitcherLiveContentOverlayCoordinator _existingOverlayTypeForAppLayout:](self, "_existingOverlayTypeForAppLayout:", v28);
          v30 = v29;
          if (v29 != 1 && v29 != 4)
          {
            objc_msgSend(v28, "itemForLayoutRole:", 1);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "windowScene");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "sceneManager");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            v34 = (void *)MEMORY[0x1E0D231F0];
            objc_msgSend(v67, "uniqueIdentifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "identityForIdentifier:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "existingSceneHandleForSceneIdentity:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_opt_class();
            v39 = v37;
            if (v38)
            {
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v40 = v39;
              else
                v40 = 0;
            }
            else
            {
              v40 = 0;
            }
            v41 = v40;

            objc_msgSend(v74, "contentViewController");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "liveContentOverlayForAppLayout:", v27);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v44 = (void *)objc_msgSend(v43, "newPortaledLiveContentOverlayView");
              objc_msgSend(v44, "layer");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_opt_class();
              v47 = v45;
              if (v46)
              {
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v48 = v47;
                else
                  v48 = 0;
              }
              else
              {
                v48 = 0;
              }
              v49 = v48;

              objc_msgSend(v49, "setCrossDisplay:", 1);
              if (v41 && v43 && v44)
              {
                if (v30)
                  -[SBFullScreenSwitcherLiveContentOverlayCoordinator _removeOverlayForAppLayout:animated:](self, "_removeOverlayForAppLayout:animated:", v28, 0);
                objc_msgSend(v43, "contentOverlayView");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "frame");
                v52 = v51;
                v54 = v53;

                objc_msgSend(v74, "layoutState");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "sceneIdentifier");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = objc_msgSend(v55, "interfaceOrientationForElementIdentifier:", v56);

                objc_msgSend(WeakRetained, "layoutState");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = objc_msgSend(v58, "interfaceOrientation");

                v60 = -[SBFluidSwitcherPortaledSceneLiveContentOverlay initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:livePortalView:]([SBFluidSwitcherPortaledSceneLiveContentOverlay alloc], "initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:livePortalView:", v41, v57, v59, v44, v52, v54);
                -[SBFullScreenSwitcherLiveContentOverlayCoordinator _addOverlay:forAppLayout:animated:](self, "_addOverlay:forAppLayout:animated:", v60, v28, 0);

              }
            }
            else
            {
              v44 = 0;
            }

          }
        }
        v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v95, 16);
      }
      while (v71);
    }

  }
  v61 = (void *)-[NSMutableDictionary copy](self->_appLayoutToLiveContentOverlayContext, "copy");
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __92__SBFullScreenSwitcherLiveContentOverlayCoordinator__updatePortaledSceneLiveContentOverlays__block_invoke_2;
  v75[3] = &unk_1E8EA7388;
  v76 = v69;
  v77 = self;
  v62 = v69;
  objc_msgSend(v61, "enumerateKeysAndObjectsUsingBlock:", v75);

}

- (BOOL)areLiveContentOverlayUpdatesSuspended
{
  return self->_liveContentOverlayUpdatesSuspended;
}

- (void)_updateFullScreenDisplayLayoutElementsForActiveAppLayouts:(id)a3 inAppLayout:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allKeys](self->_appLayoutToLiveContentOverlayContext, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_appLayoutToLiveContentOverlayContext, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "overlay");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setDisplayLayoutElementActive:", objc_msgSend(v5, "containsObject:", v11));

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)_updateAlwaysLiveSceneContentOverlays
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  SBFullScreenAlwaysLiveLiveContentOverlay *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  SBFullScreenAlwaysLiveLiveContentOverlay *v25;
  void *v26;
  uint64_t v27;
  NSMutableArray *v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v3 = self->_visibleAlwaysLiveAppLayouts;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v31;
    v27 = *(_QWORD *)v31;
    v28 = v3;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (-[SBFullScreenSwitcherLiveContentOverlayCoordinator _canTransitionToOverlayType:forAppLayout:](self, "_canTransitionToOverlayType:forAppLayout:", 3, v8))
        {
          v9 = -[SBFullScreenSwitcherLiveContentOverlayCoordinator _existingOverlayTypeForAppLayout:](self, "_existingOverlayTypeForAppLayout:", v8);
          if (v9 != 3)
          {
            v10 = v9;
            objc_msgSend(v8, "allItems");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "firstObject");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            v13 = (void *)MEMORY[0x1E0D231F0];
            objc_msgSend(v12, "uniqueIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "identityForIdentifier:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = objc_opt_class();
            -[SBFullScreenSwitcherLiveContentOverlayCoordinator _sceneManager](self, "_sceneManager");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "existingSceneHandleForSceneIdentity:", v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            SBSafeCast(v16, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              if (v10)
                -[SBFullScreenSwitcherLiveContentOverlayCoordinator _removeOverlayForAppLayout:animated:](self, "_removeOverlayForAppLayout:animated:", v8, 0);
              v20 = [SBFullScreenAlwaysLiveLiveContentOverlay alloc];
              -[SBFullScreenSwitcherLiveContentOverlayCoordinator _sbWindowScene](self, "_sbWindowScene");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "screen");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "_referenceBounds");
              v25 = -[SBFullScreenAlwaysLiveLiveContentOverlay initWithSceneHandle:referenceSize:containerOrientation:](v20, "initWithSceneHandle:referenceSize:containerOrientation:", v19, self->_containerOrientation, v23, v24);

              -[SBFullScreenSwitcherLiveContentOverlayCoordinator _addOverlay:forAppLayout:animated:](self, "_addOverlay:forAppLayout:animated:", v25, v8, 0);
            }

            v6 = v27;
            v3 = v28;
          }
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v5);
  }

  v26 = (void *)-[NSMutableDictionary copy](self->_appLayoutToLiveContentOverlayContext, "copy");
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __90__SBFullScreenSwitcherLiveContentOverlayCoordinator__updateAlwaysLiveSceneContentOverlays__block_invoke;
  v29[3] = &unk_1E8EA7338;
  v29[4] = self;
  objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v29);

}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  BOOL IsValid;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  char v32;
  SBFullScreenSwitcherLiveContentOverlayCoordinator *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v6 = a4;
  objc_msgSend(v6, "applicationTransitionContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "layoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unlockedEnvironmentMode");
  v29 = v7;
  IsValid = SBPeekConfigurationIsValid(objc_msgSend(v7, "peekConfiguration"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v33 = self;
  -[NSMutableDictionary allValues](self->_appLayoutToLiveContentOverlayContext, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    v14 = v8 != 1 || IsValid;
    v32 = v14;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v16, "overlayType") == 1)
        {
          if ((v32 & 1) == 0 && (objc_msgSend(v6, "isInterrupted") & 1) == 0)
          {
            objc_msgSend(v16, "overlay");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_opt_class();
            v19 = v17;
            if (v18)
            {
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v20 = v19;
              else
                v20 = 0;
            }
            else
            {
              v20 = 0;
            }
            v21 = v20;

            objc_msgSend(v21, "deviceApplicationSceneViewController");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v22, "displayMode") == 4)
              objc_msgSend(v22, "setDisplayMode:animationFactory:completion:", 0, 0, 0);

          }
          objc_msgSend(v16, "overlay");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "contentViewController");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v24, "layoutStateTransitionCoordinator:transitionWillEndWithTransitionContext:", v31, v6);
          objc_msgSend(v16, "overlay");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_opt_class();
          objc_msgSend(v25, "deviceApplicationSceneViewController");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          SBSafeCast(v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          -[SBFullScreenSwitcherLiveContentOverlayCoordinator _presentTransientErrorMessageIfNeededForLayoutStateTransitionContext:medusaViewController:](v33, "_presentTransientErrorMessageIfNeededForLayoutStateTransitionContext:medusaViewController:", v6, v28);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v12);
  }

}

- (void)_presentTransientErrorMessageIfNeededForLayoutStateTransitionContext:(id)a3 medusaViewController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v6, "_sbWindowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "switcherController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "windowManagementStyle"))
  {
    if (-[SBFullScreenSwitcherLiveContentOverlayCoordinator _shouldShowSplitViewNotSupportedMessageForLayoutStateTransitionContext:medusaViewController:](self, "_shouldShowSplitViewNotSupportedMessageForLayoutStateTransitionContext:medusaViewController:", v10, v6))
    {
      v9 = 2;
LABEL_6:
      objc_msgSend(v8, "_presentMedusaBanner:fireInterval:dismissInterval:", v9, 0.0, 1.5);
      goto LABEL_7;
    }
    if (-[SBFullScreenSwitcherLiveContentOverlayCoordinator _shouldShowMultipleWindowsNotSupportedMessageForLayoutStateTransitionContext:medusaViewController:](self, "_shouldShowMultipleWindowsNotSupportedMessageForLayoutStateTransitionContext:medusaViewController:", v10, v6))
    {
      v9 = 3;
      goto LABEL_6;
    }
  }
LABEL_7:

}

void __90__SBFullScreenSwitcherLiveContentOverlayCoordinator__updateAlwaysLiveSceneContentOverlays__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "overlayType") == 3
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "containsObject:", v5) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_removeOverlayForAppLayout:animated:", v5, 0);
  }

}

- (id)_newLiveContentOverlayForApplicationContext:(id)a3 layoutRole:(int64_t)a4 sbsDisplayLayoutRole:(int64_t)a5
{
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  SBFluidSwitcherAppClipLiveContentOverlay *v14;
  void *v15;
  SBFullScreenSwitcherSceneLiveContentOverlay *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v8, "layoutState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "elementWithRole:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workspaceEntity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isAppClipPlaceholderEntity"))
  {
    v13 = v12;
    v14 = [SBFluidSwitcherAppClipLiveContentOverlay alloc];
    -[SBFullScreenSwitcherLiveContentOverlayCoordinator _sbWindowScene](self, "_sbWindowScene");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SBFluidSwitcherAppClipLiveContentOverlay initWithPlaceholderEntity:windowScene:](v14, "initWithPlaceholderEntity:windowScene:", v13, v15);

    objc_msgSend(WeakRetained, "parentViewControllerForContentOverlay");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFullScreenSwitcherSceneLiveContentOverlay contentViewController](v16, "contentViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addChildViewController:", v18);
    objc_msgSend(v18, "bs_beginAppearanceTransition:animated:", 1, 0);
    objc_msgSend(v18, "didMoveToParentViewController:", v17);
    objc_msgSend(v18, "bs_endAppearanceTransition");

  }
  else
  {
    v16 = objc_alloc_init(SBFullScreenSwitcherSceneLiveContentOverlay);
    -[SBFullScreenSwitcherSceneLiveContentOverlay setStatusBarActionDelegate:](v16, "setStatusBarActionDelegate:", self);
  }
  -[SBFullScreenSwitcherLiveContentOverlayCoordinator _configureLiveContentOverlayView:forTransitionContext:layoutRole:sbsDisplayLayoutRole:](self, "_configureLiveContentOverlayView:forTransitionContext:layoutRole:sbsDisplayLayoutRole:", v16, v8, a4, a5);
  if (-[SBFullScreenSwitcherSceneLiveContentOverlay overlayType](v16, "overlayType") == 1)
  {
    objc_msgSend(WeakRetained, "parentViewControllerForContentOverlay");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFullScreenSwitcherSceneLiveContentOverlay contentViewController](v16, "contentViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFullScreenSwitcherSceneLiveContentOverlay orientationWrapperView](v16, "orientationWrapperView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addChildViewController:", v20);
    objc_msgSend(v20, "bs_beginAppearanceTransition:animated:", 1, 0);
    objc_msgSend(v20, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addContentView:", v22);

    objc_msgSend(v20, "didMoveToParentViewController:", v19);
    objc_msgSend(v20, "bs_endAppearanceTransition");

  }
  return v16;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int64_t v32;
  id v33;
  uint64_t i;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  int64_t v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  SBFullScreenSwitcherLiveContentOverlayCoordinator *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  _BOOL4 v55;
  uint64_t v56;
  _BOOL8 v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t k;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t m;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  id v87;
  uint64_t v88;
  void *v89;
  int64_t v90;
  id obj;
  id obja;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
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
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v86 = a3;
  v87 = a4;
  if (-[SBFullScreenSwitcherLiveContentOverlayCoordinator areLiveContentOverlayUpdatesSuspended](self, "areLiveContentOverlayUpdatesSuspended"))
  {
    goto LABEL_80;
  }
  objc_msgSend(v87, "applicationTransitionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previousLayoutState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v6;
  objc_msgSend(v6, "layoutState");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v8;
  objc_msgSend(v8, "floatingAppLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v9;
  objc_msgSend(v9, "leafAppLayouts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v10, "leafAppLayouts");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11)
    {
      objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v12);
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v14;
    }
    else
    {
      v11 = (void *)v12;
    }
  }
  objc_msgSend(v80, "invalidateAppLayout");
  objc_msgSend(v80, "invalidateFloatingAppLayout");
  objc_msgSend(v80, "appLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "floatingAppLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leafAppLayouts");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v16, "leafAppLayouts");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v17)
    {
      objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v18);
      v20 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v20;
    }
    else
    {
      v17 = (void *)v18;
    }
  }
  v79 = v7;
  v83 = objc_msgSend(v7, "source", v11);
  v89 = v15;
  v85 = v17;
  v77 = v10;
  v96 = v16;
  if (!objc_msgSend(v93, "animationDisabled"))
  {
    v111 = 0uLL;
    v112 = 0uLL;
    v109 = 0uLL;
    v110 = 0uLL;
    v82 = v17;
    v88 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v109, v120, 16);
    if (!v88)
      goto LABEL_64;
    v84 = *(_QWORD *)v110;
    while (1)
    {
      for (i = 0; i != v88; ++i)
      {
        if (*(_QWORD *)v110 != v84)
          objc_enumerationMutation(v82);
        v35 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
        v36 = 3;
        if (objc_msgSend(v35, "environment") != 2)
        {
          objc_msgSend(v35, "allItems");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "firstObject");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v15, "layoutRoleForItem:", v38);

        }
        -[NSMutableDictionary objectForKey:](self->_appLayoutToLiveContentOverlayContext, "objectForKey:", v35);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "overlay");
        v40 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "itemForLayoutRole:", 1);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = -[SBFullScreenSwitcherLiveContentOverlayCoordinator _calculateSBSDisplayLayoutElementRoleForDisplayItem:inAppLayout:](self, "_calculateSBSDisplayLayoutElementRoleForDisplayItem:inAppLayout:");
        if (v40)
        {
          if (objc_msgSend(v39, "overlayType") != 3)
          {
            if (objc_msgSend(v39, "overlayType") == 2)
            {
              objc_msgSend(v80, "elementWithRole:", v36);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "workspaceEntity");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v43, "isAppClipPlaceholderEntity");

              if ((v44 & 1) != 0)
                goto LABEL_59;
            }
            else if (objc_msgSend(v39, "overlayType") != 4)
            {
LABEL_59:
              v15 = v89;
LABEL_60:
              -[SBFullScreenSwitcherLiveContentOverlayCoordinator _configureLiveContentOverlayView:forTransitionContext:layoutRole:sbsDisplayLayoutRole:](self, "_configureLiveContentOverlayView:forTransitionContext:layoutRole:sbsDisplayLayoutRole:", v40, v93, v36, v41);
LABEL_61:

              goto LABEL_62;
            }
          }
          -[SBFullScreenSwitcherLiveContentOverlayCoordinator _removeOverlayForAppLayout:animated:](self, "_removeOverlayForAppLayout:animated:", v35, 0);

        }
        v90 = v41;
        obja = (id)v36;
        objc_msgSend(v35, "itemForLayoutRole:", 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = 0u;
        v106 = 0u;
        v107 = 0u;
        v108 = 0u;
        v46 = self;
        -[NSMutableDictionary allKeys](self->_appLayoutToLiveContentOverlayContext, "allKeys");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v106;
LABEL_41:
          v51 = 0;
          while (1)
          {
            if (*(_QWORD *)v106 != v50)
              objc_enumerationMutation(v47);
            v52 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v51);
            if ((objc_msgSend(v52, "containsItem:", v45) & 1) != 0)
              break;
            if (v49 == ++v51)
            {
              v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
              if (v49)
                goto LABEL_41;
              goto LABEL_47;
            }
          }
          v53 = v52;
          self = v46;
          -[NSMutableDictionary objectForKey:](v46->_appLayoutToLiveContentOverlayContext, "objectForKey:", v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "overlay");
          v40 = (id)objc_claimAutoreleasedReturnValue();

          if (!v40)
            goto LABEL_50;
          -[SBFullScreenSwitcherLiveContentOverlayCoordinator _moveExistingOverlayForAppLayout:toAppLayout:](v46, "_moveExistingOverlayForAppLayout:toAppLayout:", v53, v35);

          v15 = v89;
          v41 = v90;
          v36 = (uint64_t)obja;
          goto LABEL_60;
        }
LABEL_47:

        v53 = 0;
        self = v46;
LABEL_50:
        v15 = v89;

        if (!-[SBSwitcherCoordinatedLayoutStateTransitionContext hasTransitioningDisplayItemsForAppLayout:](self->_currentCoordinatedLayoutStateTransitionContext, "hasTransitioningDisplayItemsForAppLayout:", v35))
        {
          v55 = objc_msgSend(v81, "unlockedEnvironmentMode") == 2 && v83 != 11;
          v56 = v83 == 11 || v55;
          v57 = -[SBFullScreenSwitcherLiveContentOverlayCoordinator _shouldAnimateAddingLiveContentOverlayForTransitionContext:leafAppLayout:](self, "_shouldAnimateAddingLiveContentOverlayForTransitionContext:leafAppLayout:", v93, v35);
          v40 = -[SBFullScreenSwitcherLiveContentOverlayCoordinator _newLiveContentOverlayForApplicationContext:layoutRole:sbsDisplayLayoutRole:](self, "_newLiveContentOverlayForApplicationContext:layoutRole:sbsDisplayLayoutRole:", v93, obja, v90);
          objc_msgSend(v40, "setStatusBarHidden:nubViewHidden:animator:", v56, v56, 0);
          -[SBFullScreenSwitcherLiveContentOverlayCoordinator _addOverlay:forAppLayout:animated:](self, "_addOverlay:forAppLayout:animated:", v40, v35, v57);
          goto LABEL_61;
        }
LABEL_62:

      }
      v88 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v109, v120, 16);
      if (!v88)
      {
LABEL_64:

        -[SBFullScreenSwitcherLiveContentOverlayCoordinator _updateAlwaysLiveSceneContentOverlays](self, "_updateAlwaysLiveSceneContentOverlays");
        -[SBFullScreenSwitcherLiveContentOverlayCoordinator _updatePortaledSceneLiveContentOverlays](self, "_updatePortaledSceneLiveContentOverlays");
        -[SBFullScreenSwitcherLiveContentOverlayCoordinator _updateFullScreenDisplayLayoutElementsForActiveAppLayouts:inAppLayout:](self, "_updateFullScreenDisplayLayoutElementsForActiveAppLayouts:inAppLayout:", v82, v15);
        v17 = v85;
        goto LABEL_65;
      }
    }
  }
  v115 = 0uLL;
  v116 = 0uLL;
  v113 = 0uLL;
  v114 = 0uLL;
  obj = v17;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v121, 16);
  if (v21)
  {
    v22 = v21;
    v94 = *(_QWORD *)v114;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v114 != v94)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * j);
        v25 = 3;
        if (objc_msgSend(v24, "environment") != 2)
        {
          objc_msgSend(v24, "allItems");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "firstObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v15, "layoutRoleForItem:", v27);

        }
        -[NSMutableDictionary objectForKey:](self->_appLayoutToLiveContentOverlayContext, "objectForKey:", v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "overlay");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "itemForLayoutRole:", 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25 == 3)
          v31 = v96;
        else
          v31 = v15;
        v32 = -[SBFullScreenSwitcherLiveContentOverlayCoordinator _calculateSBSDisplayLayoutElementRoleForDisplayItem:inAppLayout:](self, "_calculateSBSDisplayLayoutElementRoleForDisplayItem:inAppLayout:", v30, v31);
        if (v29)
        {
          -[SBFullScreenSwitcherLiveContentOverlayCoordinator _configureLiveContentOverlayView:forTransitionContext:layoutRole:sbsDisplayLayoutRole:](self, "_configureLiveContentOverlayView:forTransitionContext:layoutRole:sbsDisplayLayoutRole:", v29, v93, v25, v32);
        }
        else
        {
          v33 = -[SBFullScreenSwitcherLiveContentOverlayCoordinator _newLiveContentOverlayForApplicationContext:layoutRole:sbsDisplayLayoutRole:](self, "_newLiveContentOverlayForApplicationContext:layoutRole:sbsDisplayLayoutRole:", v93, v25, v32);
          -[SBFullScreenSwitcherLiveContentOverlayCoordinator _addOverlay:forAppLayout:animated:](self, "_addOverlay:forAppLayout:animated:", v33, v24, 0);
          v15 = v89;
          objc_msgSend(v33, "setStatusBarHidden:nubViewHidden:animator:", v83 == 11, v83 == 11, 0);

        }
        v17 = v85;
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v121, 16);
    }
    while (v22);
  }

LABEL_65:
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v58 = v76;
  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v101, v118, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v102;
    do
    {
      for (k = 0; k != v60; ++k)
      {
        if (*(_QWORD *)v102 != v61)
          objc_enumerationMutation(v58);
        v63 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * k);
        if ((objc_msgSend(v17, "containsObject:", v63) & 1) == 0)
        {
          -[NSMutableDictionary objectForKey:](self->_appLayoutToLiveContentOverlayContext, "objectForKey:", v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v64;
          if (v64 && objc_msgSend(v64, "overlayType") == 1)
          {
            objc_msgSend(v65, "overlay");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "setAsyncRenderingDisabled:", 1);
            objc_msgSend(v66, "deviceApplicationSceneViewController");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v67, "displayMode") == 4)
              objc_msgSend(v67, "setDisplayMode:animationFactory:completion:", 3, 0, 0);

          }
        }
      }
      v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v101, v118, 16);
    }
    while (v60);
  }

LABEL_80:
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  -[NSMutableDictionary allValues](self->_appLayoutToLiveContentOverlayContext, "allValues");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v97, v117, 16);
  if (v69)
  {
    v70 = v69;
    v71 = *(_QWORD *)v98;
    do
    {
      for (m = 0; m != v70; ++m)
      {
        if (*(_QWORD *)v98 != v71)
          objc_enumerationMutation(v68);
        v73 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * m);
        if (objc_msgSend(v73, "overlayType") == 1)
        {
          objc_msgSend(v73, "overlay");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "contentViewController");
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v75, "layoutStateTransitionCoordinator:transitionDidBeginWithTransitionContext:", v86, v87);

        }
      }
      v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v97, v117, 16);
    }
    while (v70);
  }

}

- (void)appLayoutWillBecomeVisible:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *visibleAlwaysLiveAppLayouts;
  NSMutableArray *v14;
  NSMutableArray *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "allItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "type"))
    {

    }
    else
    {
      v6 = (void *)MEMORY[0x1E0D231F0];
      objc_msgSend(v5, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identityForIdentifier:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_opt_class();
      -[SBFullScreenSwitcherLiveContentOverlayCoordinator _sceneManager](self, "_sceneManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "existingSceneHandleForSceneIdentity:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBSafeCast(v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v10) = objc_msgSend(v12, "shouldAlwaysDisplayLiveContent");
      if ((_DWORD)v10
        && (-[NSMutableArray containsObject:](self->_visibleAlwaysLiveAppLayouts, "containsObject:", v16) & 1) == 0)
      {
        visibleAlwaysLiveAppLayouts = self->_visibleAlwaysLiveAppLayouts;
        if (!visibleAlwaysLiveAppLayouts)
        {
          v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v15 = self->_visibleAlwaysLiveAppLayouts;
          self->_visibleAlwaysLiveAppLayouts = v14;

          visibleAlwaysLiveAppLayouts = self->_visibleAlwaysLiveAppLayouts;
        }
        -[NSMutableArray addObject:](visibleAlwaysLiveAppLayouts, "addObject:", v16);
        -[SBFullScreenSwitcherLiveContentOverlayCoordinator _updateAlwaysLiveSceneContentOverlays](self, "_updateAlwaysLiveSceneContentOverlays");
      }
    }
  }
  -[SBFullScreenSwitcherLiveContentOverlayCoordinator _updatePortaledSceneLiveContentOverlays](self, "_updatePortaledSceneLiveContentOverlays");

}

- (BOOL)_shouldAnimateAddingLiveContentOverlayForTransitionContext:(id)a3 leafAppLayout:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a3;
  if ((-[NSMutableArray containsObject:](self->_visibleAlwaysLiveAppLayouts, "containsObject:", a4) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v6, "previousLayoutState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "unlockedEnvironmentMode");
    if (((v10 & 0xFFFFFFFFFFFFFFFELL) == 2 || SBPeekConfigurationIsValid(objc_msgSend(v8, "peekConfiguration")))
      && -[SBFullScreenSwitcherLiveContentOverlayCoordinator _layoutStateContainsElementBlockedForScreenTimeExpiration:](self, "_layoutStateContainsElementBlockedForScreenTimeExpiration:", v9)|| (v11 = objc_msgSend(v8, "interfaceOrientation"), v11 != objc_msgSend(v9, "interfaceOrientation")))
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v6, "request");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "source");

      v7 = 1;
      if (v10 != 2 && v13 != 11)
      {
        v14 = objc_msgSend(v9, "unlockedEnvironmentMode");
        v7 = v10 == 3 && v14 == 3;
      }
    }

  }
  return v7;
}

- (void)_configureLiveContentOverlayView:(id)a3 forTransitionContext:(id)a4 layoutRole:(int64_t)a5 sbsDisplayLayoutRole:(int64_t)a6
{
  id v10;
  void *v11;
  uint64_t v12;
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
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int64_t containerOrientation;
  id v36;
  int64_t v37;
  void *v38;
  uint64_t v39;
  int64_t v40;
  void *v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;

  v46 = a3;
  v10 = a4;
  objc_msgSend(v10, "entityForLayoutRole:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  SBSafeCast(v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sceneHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frameForApplicationSceneEntity:", v11);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v10, "layoutState");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_opt_class();
  v25 = v23;
  if (v24)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
  }
  else
  {
    v26 = 0;
  }
  v27 = v26;

  v28 = objc_msgSend(v27, "spaceConfiguration");
  v43 = objc_msgSend(v27, "floatingConfiguration");
  v29 = objc_msgSend(v27, "interfaceOrientationForLayoutRole:", a5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v46, "setContentReferenceSize:interfaceOrientation:", v29, v20, v22);
  objc_msgSend(v14, "application");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v29;
  v45 = v28;
  if (objc_msgSend(v30, "classicAppPhoneAppRunningOnPad")
    && objc_msgSend(v14, "_supportsMixedOrientation"))
  {
    v42 = ((unint64_t)(v29 - 3) < 2) ^ ((unint64_t)(objc_msgSend(v27, "interfaceOrientation") - 3) < 2);
  }
  else
  {
    v42 = 0;
  }

  objc_msgSend(v27, "elementWithRole:", a5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layoutAttributesForElement:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "sizingPolicy");
  if (objc_msgSend(v46, "overlayType") == 1)
  {
    v40 = a6;
    v34 = v13;
    containerOrientation = self->_containerOrientation;
    v41 = v14;
    v36 = v46;
    LOBYTE(v39) = v42;
    v37 = containerOrientation;
    v13 = v34;
    objc_msgSend(v36, "configureWithWorkspaceEntity:referenceFrame:contentOrientation:containerOrientation:layoutRole:sbsDisplayLayoutRole:spaceConfiguration:floatingConfiguration:hasClassicAppOrientationMismatch:sizingPolicy:", v11, v44, v37, a5, v40, v45, v16, v18, v20, v22, v43, v39, v33);
    -[SBFullScreenSwitcherLiveContentOverlayCoordinator keyboardFocusSceneID](self, "keyboardFocusSceneID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "noteKeyboardFocusDidChangeToSceneID:", v38);

    v14 = v41;
  }

}

- (NSString)keyboardFocusSceneID
{
  return self->_keyboardFocusSceneID;
}

- (int64_t)_calculateSBSDisplayLayoutElementRoleForDisplayItem:(id)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  -[SBFullScreenSwitcherLiveContentOverlayCoordinator switcherController](self, "switcherController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isChamoisWindowingUIEnabled");

  v10 = objc_msgSend(v7, "layoutRoleForItem:", v6);
  if (v9)
  {
    objc_msgSend(v7, "zOrderedItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "indexOfObject:", v6);
    if (v12 > 3)
      v13 = 0;
    else
      v13 = qword_1D0E88FD8[v12];

  }
  else
  {
    v14 = v10;
    v15 = objc_msgSend(v7, "environment");

    if (v15 == 2)
      v13 = 7;
    else
      v13 = SBSDisplayLayoutRoleForLayoutRole(v14);
  }

  return v13;
}

- (SBSwitcherController)switcherController
{
  return (SBSwitcherController *)objc_loadWeakRetained((id *)&self->_switcherController);
}

- (void)_addOverlay:(id)a3 forAppLayout:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  SBFullScreenLiveContentOverlayContext *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  SBFullScreenSwitcherLiveContentOverlayCoordinator *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v5 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[SBFullScreenSwitcherLiveContentOverlayCoordinator delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBFullScreenLiveContentOverlayContext initWithOverlay:]([SBFullScreenLiveContentOverlayContext alloc], "initWithOverlay:", v8);
  -[NSMutableDictionary setObject:forKey:](self->_appLayoutToLiveContentOverlayContext, "setObject:forKey:", v11, v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "setContainerOrientation:", self->_containerOrientation);
  SBLogAppSwitcher();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v18 = v10;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromFullScreenLiveContentOverlayType(objc_msgSend(v8, "overlayType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "succinctDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v20 = v14;
    v21 = 2048;
    v22 = self;
    v23 = 2114;
    v24 = v15;
    v25 = 2114;
    v26 = v16;
    v27 = 2114;
    v28 = v17;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Adding %{public}@ overlay for: %{public}@, animated: %{public}@", buf, 0x34u);

    v10 = v18;
  }

  objc_msgSend(v10, "addLiveContentOverlay:forAppLayout:animated:", v8, v9, v5);
}

- (SBSwitcherLiveContentOverlayCoordinatorDelegate)delegate
{
  id WeakRetained;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFullScreenSwitcherLiveContentOverlayCoordinator.m"), 199, CFSTR("delegate must be set before use"));

  }
  return (SBSwitcherLiveContentOverlayCoordinatorDelegate *)WeakRetained;
}

void __124__SBFullScreenSwitcherLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "overlayType") == 1)
  {
    objc_msgSend(v4, "overlay");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAsyncRenderingDisabled:", 0);

  }
}

void __124__SBFullScreenSwitcherLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke(id *a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(a1[4], "_existingOverlayTypeForAppLayout:") == 1
    && (objc_msgSend(a1[5], "containsObject:", v3) & 1) == 0
    && (objc_msgSend(*((id *)a1[4] + 10), "hasTransitioningDisplayItemsForAppLayout:", v3) & 1) == 0)
  {
    objc_msgSend(a1[6], "addObject:", v3);
  }

}

- (int64_t)_existingOverlayTypeForAppLayout:(id)a3
{
  void *v3;
  int64_t v4;

  -[NSMutableDictionary objectForKey:](self->_appLayoutToLiveContentOverlayContext, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "overlayType");

  return v4;
}

- (void)setContainerOrientation:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_containerOrientation = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allValues](self->_appLayoutToLiveContentOverlayContext, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "overlay");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "setContainerOrientation:", a3);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (SBFullScreenSwitcherLiveContentOverlayCoordinator)initWithSwitcherController:(id)a3
{
  id v4;
  SBFullScreenSwitcherLiveContentOverlayCoordinator *v5;
  SBFullScreenSwitcherLiveContentOverlayCoordinator *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *appLayoutToLiveContentOverlayContext;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBFullScreenSwitcherLiveContentOverlayCoordinator;
  v5 = -[SBFullScreenSwitcherLiveContentOverlayCoordinator init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_switcherController, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    appLayoutToLiveContentOverlayContext = v6->_appLayoutToLiveContentOverlayContext;
    v6->_appLayoutToLiveContentOverlayContext = v7;

  }
  return v6;
}

- (void)setLiveContentOverlayUpdatesSuspended:(BOOL)a3
{
  if (self->_liveContentOverlayUpdatesSuspended != a3)
    self->_liveContentOverlayUpdatesSuspended = a3;
}

- (void)prepareForCoordinatedLayoutStateTransitionWithContext:(id)a3
{
  SBSwitcherCoordinatedLayoutStateTransitionContext *v4;
  id WeakRetained;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SBSwitcherCoordinatedLayoutStateTransitionContext *currentCoordinatedLayoutStateTransitionContext;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (SBSwitcherCoordinatedLayoutStateTransitionContext *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  -[SBSwitcherCoordinatedLayoutStateTransitionContext fromSwitcherController](v4, "fromSwitcherController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(WeakRetained, "isEqual:", v6);

  if (v7)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[SBSwitcherCoordinatedLayoutStateTransitionContext displayItems](v4, "displayItems", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
          -[SBSwitcherCoordinatedLayoutStateTransitionContext fromAppLayout](v4, "fromAppLayout");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "leafAppLayoutForItem:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary objectForKey:](self->_appLayoutToLiveContentOverlayContext, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "overlayType") == 1)
          {
            objc_msgSend(v16, "overlay");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "deviceApplicationSceneViewController");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v18, "displayMode") == 4)
              objc_msgSend(v18, "setDisplayMode:animationFactory:completion:", 3, 0, 0);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

  }
  currentCoordinatedLayoutStateTransitionContext = self->_currentCoordinatedLayoutStateTransitionContext;
  self->_currentCoordinatedLayoutStateTransitionContext = v4;

}

- (void)cleanUpAfterCoordinatedLayoutStateTransitionWithContext:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  SBSwitcherCoordinatedLayoutStateTransitionContext *currentCoordinatedLayoutStateTransitionContext;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(v4, "fromSwitcherController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(WeakRetained, "isEqual:", v6);

  if (v7)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "displayItems", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
          objc_msgSend(v4, "fromAppLayout");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "leafAppLayoutForItem:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary objectForKey:](self->_appLayoutToLiveContentOverlayContext, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "overlayType"))
            -[SBFullScreenSwitcherLiveContentOverlayCoordinator _removeOverlayForAppLayout:animated:](self, "_removeOverlayForAppLayout:animated:", v15, 0);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

  }
  -[SBFullScreenSwitcherLiveContentOverlayCoordinator _updatePortaledSceneLiveContentOverlays](self, "_updatePortaledSceneLiveContentOverlays");
  currentCoordinatedLayoutStateTransitionContext = self->_currentCoordinatedLayoutStateTransitionContext;
  self->_currentCoordinatedLayoutStateTransitionContext = 0;

}

- (id)appLayoutForKeyboardFocusedScene
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMutableDictionary allKeys](self->_appLayoutToLiveContentOverlayContext, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_appLayoutToLiveContentOverlayContext, "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "overlayType") == 1)
        {
          objc_msgSend(v7, "allItems");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "firstObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "uniqueIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBFullScreenSwitcherLiveContentOverlayCoordinator sceneIDForTargetOfKeyboardShortcuts](self, "sceneIDForTargetOfKeyboardShortcuts");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToString:", v12);

          if ((v13 & 1) != 0)
          {
            v14 = v7;

            goto LABEL_13;
          }

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v4)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (BOOL)performSwitcherKeyboardShortcutAction:(int64_t)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  LOBYTE(v3) = 0;
  v25 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 <= 0x14 && ((1 << a3) & 0x1E7980) != 0)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[NSMutableDictionary allValues](self->_appLayoutToLiveContentOverlayContext, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v3)
    {
      v18 = a3;
      v6 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v21 != v6)
            objc_enumerationMutation(v5);
          v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v8, "overlayType", v18) == 1)
          {
            objc_msgSend(v8, "overlay");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_opt_class();
            objc_msgSend(v9, "deviceApplicationSceneViewController");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            SBSafeCast(v10, v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v12, "sceneHandle");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "sceneIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBFullScreenSwitcherLiveContentOverlayCoordinator sceneIDForTargetOfKeyboardShortcuts](self, "sceneIDForTargetOfKeyboardShortcuts");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "isEqualToString:", v15);

            if (v16)
            {
              objc_msgSend(v12, "performSwitcherKeyboardShortcutAction:", v18);

              LOBYTE(v3) = 1;
              goto LABEL_15;
            }

          }
        }
        v3 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_15:

  }
  return v3;
}

- (void)appLayoutDidBecomeHidden:(id)a3
{
  NSMutableArray *visibleAlwaysLiveAppLayouts;
  id v5;

  v5 = a3;
  if (-[NSMutableArray containsObject:](self->_visibleAlwaysLiveAppLayouts, "containsObject:"))
  {
    -[NSMutableArray removeObject:](self->_visibleAlwaysLiveAppLayouts, "removeObject:", v5);
    if (!-[NSMutableArray count](self->_visibleAlwaysLiveAppLayouts, "count"))
    {
      visibleAlwaysLiveAppLayouts = self->_visibleAlwaysLiveAppLayouts;
      self->_visibleAlwaysLiveAppLayouts = 0;

    }
    -[SBFullScreenSwitcherLiveContentOverlayCoordinator _updateAlwaysLiveSceneContentOverlays](self, "_updateAlwaysLiveSceneContentOverlays");
  }
  -[SBFullScreenSwitcherLiveContentOverlayCoordinator _updatePortaledSceneLiveContentOverlays](self, "_updatePortaledSceneLiveContentOverlays");

}

- (void)itemContainerForAppLayout:(id)a3 willBeReusedForAppLayout:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v9, "itemForLayoutRole:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemForLayoutRole:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", v8))
    -[SBFullScreenSwitcherLiveContentOverlayCoordinator _moveExistingOverlayForAppLayout:toAppLayout:](self, "_moveExistingOverlayForAppLayout:toAppLayout:", v9, v6);

}

- (BOOL)_shouldShowSplitViewNotSupportedMessageForLayoutStateTransitionContext:(id)a3 medusaViewController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v30;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "sceneHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "application");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sbWindowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "switcherController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "windowManagementStyle");
  objc_msgSend(v10, "displayIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v8, "supportsMultiWindowLayoutsForSwitcherWindowManagementStyle:displayIdentity:", v11, v12);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v5, "fromLayoutState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_class();
    v16 = v14;
    if (v15)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
    }
    else
    {
      v17 = 0;
    }
    v18 = v17;

    objc_msgSend(v5, "toLayoutState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_class();
    v21 = v19;
    if (v20)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v22 = v21;
      else
        v22 = 0;
    }
    else
    {
      v22 = 0;
    }
    v23 = v22;

    v24 = objc_msgSend(v7, "lastActivationSource");
    if (SBPeekConfigurationIsValid(objc_msgSend(v18, "peekConfiguration"))
      && !SBPeekConfigurationIsValid(objc_msgSend(v23, "peekConfiguration")))
    {
      objc_msgSend(v18, "appLayout");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "floatingAppLayout");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "appLayout");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v23, "spaceConfiguration") == 1 && v27 != v25 && v26 == 0;

    }
    else
    {
      if (v24 != 27)
      {
        v13 = 0;
LABEL_33:

        goto LABEL_34;
      }
      objc_msgSend(v18, "appLayout");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "appLayout");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v26, "isCenterOverFull") & 1) != 0)
      {
        v13 = 0;
      }
      else
      {
        objc_msgSend(v23, "floatingAppLayout");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v30 == 0;

      }
      if (v26 == v25)
        v13 = 0;
    }

    goto LABEL_33;
  }
  v13 = 0;
LABEL_34:

  return v13;
}

- (BOOL)_shouldShowMultipleWindowsNotSupportedMessageForLayoutStateTransitionContext:(id)a3 medusaViewController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  char v31;
  char v32;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "sceneHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "application");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "info");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "supportsMultiwindow");

  if ((v10 & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v5, "fromLayoutState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    v14 = v12;
    if (v13)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v16 = v15;

    objc_msgSend(v5, "toLayoutState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_class();
    v19 = v17;
    if (v18)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
    }
    else
    {
      v20 = 0;
    }
    v21 = v20;

    if (SBPeekConfigurationIsValid(objc_msgSend(v16, "peekConfiguration"))
      && !SBPeekConfigurationIsValid(objc_msgSend(v21, "peekConfiguration")))
    {
      v36 = objc_msgSend(v7, "lastActivationSource");
      objc_msgSend(v16, "appLayout");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatingAppLayout");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "appLayout");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "floatingAppLayout");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      v37 = v23;
      if (v23)
      {
        objc_msgSend(v24, "leafAppLayoutForRole:", objc_msgSend(v6, "layoutRole"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "leafAppLayoutForRole:", 1);
        v35 = v22;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "appLayoutByModifyingEnvironment:", objc_msgSend(v24, "environment"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v34 == v28 && v26 == 0;
        v30 = v26;
        v31 = v29;

        v22 = v35;
      }
      else
      {
        v30 = (void *)v25;
        v31 = 0;
      }
      if (v24 == v22)
        v32 = 1;
      else
        v32 = v31;
      if (v36 == 3)
        v11 = 0;
      else
        v11 = v32;

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (void)invalidate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allKeys](self->_appLayoutToLiveContentOverlayContext, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[SBFullScreenSwitcherLiveContentOverlayCoordinator _removeOverlayForAppLayout:animated:](self, "_removeOverlayForAppLayout:animated:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[NSMutableDictionary removeAllObjects](self->_appLayoutToLiveContentOverlayContext, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_visibleAlwaysLiveAppLayouts, "removeAllObjects");

}

- (void)fullScreenSwitcherSceneLiveContentOverlay:(id)a3 tappedStatusBar:(id)a4 tapActionType:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[NSMutableDictionary allKeys](self->_appLayoutToLiveContentOverlayContext, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  v49 = v8;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v55;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v55 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        if (objc_msgSend(v14, "environment") == 3)
        {
          v15 = v14;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      if (v11)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  -[NSMutableDictionary allKeys](self->_appLayoutToLiveContentOverlayContext, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v17)
  {
    v18 = v15;
    v19 = *(_QWORD *)v51;
    while (2)
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v51 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j);
        -[NSMutableDictionary objectForKey:](self->_appLayoutToLiveContentOverlayContext, "objectForKey:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "overlay");
        v23 = (id)objc_claimAutoreleasedReturnValue();

        if (v23 == v7)
        {
          v17 = v7;
          v24 = v21;

          goto LABEL_21;
        }

      }
      v17 = (id)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      if (v17)
        continue;
      break;
    }
    v24 = 0;
LABEL_21:
    v15 = v18;
  }
  else
  {
    v24 = 0;
  }

  if (!v15 || v24 == v15)
  {
    objc_msgSend(v24, "itemForLayoutRole:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "uniqueIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v15, "itemForLayoutRole:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "uniqueIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKey:](self->_appLayoutToLiveContentOverlayContext, "objectForKey:", v15);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "overlay");
    v28 = objc_claimAutoreleasedReturnValue();

    v17 = (id)v28;
  }

  objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:", v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFullScreenSwitcherLiveContentOverlayCoordinator _sceneManager](self, "_sceneManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "existingSceneHandleForSceneIdentity:", v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_opt_class();
  v33 = v31;
  if (v32)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v33;
    else
      v34 = 0;
  }
  else
  {
    v34 = 0;
  }
  v35 = v34;

  objc_msgSend(v35, "sceneIfExists");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v17, "contentViewController");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "locationInView:", v37);
    v39 = v38;

    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA10]), "initWithType:xPosition:", a5, v39);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v40);
    v41 = v29;
    v42 = v26;
    v43 = v17;
    v44 = v24;
    v45 = v15;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "sendActions:", v46);

    v15 = v45;
    v24 = v44;
    v17 = v43;
    v26 = v42;
    v29 = v41;

  }
}

- (BOOL)_layoutStateContainsElementBlockedForScreenTimeExpiration:(id)a3
{
  id v3;
  id v4;
  char v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __111__SBFullScreenSwitcherLiveContentOverlayCoordinator__layoutStateContainsElementBlockedForScreenTimeExpiration___block_invoke;
  v7[3] = &unk_1E8EA6CA0;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  SBLayoutRoleEnumerateAppLayoutRoles(v7);
  v5 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __111__SBFullScreenSwitcherLiveContentOverlayCoordinator__layoutStateContainsElementBlockedForScreenTimeExpiration___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "elementWithRole:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    objc_msgSend(v3, "workspaceEntity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationSceneEntity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "application");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "info");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v7, "isBlockedForScreenTimeExpiration");

    if ((_DWORD)v5)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

    v3 = v8;
  }

}

- (BOOL)_canTransitionToOverlayType:(int64_t)a3 forAppLayout:(id)a4
{
  int64_t v5;

  v5 = -[SBFullScreenSwitcherLiveContentOverlayCoordinator _existingOverlayTypeForAppLayout:](self, "_existingOverlayTypeForAppLayout:", a4);
  return a3 != 3 || v5 != 1;
}

- (BOOL)_supportsMovingOverlayTypeBetweenAppLayouts:(int64_t)a3
{
  return (unint64_t)(a3 - 5) < 0xFFFFFFFFFFFFFFFELL;
}

- (void)_removeOverlayForAppLayout:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  int v19;
  void *v20;
  __int16 v21;
  SBFullScreenSwitcherLiveContentOverlayCoordinator *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_appLayoutToLiveContentOverlayContext, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "overlayType") == 3)
    {
      objc_msgSend(v8, "overlay");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "invalidate");
LABEL_8:

      goto LABEL_9;
    }
    if (objc_msgSend(v8, "overlayType") == 2
      || objc_msgSend(v8, "overlayType") == 1
      || objc_msgSend(v8, "overlayType") == 4)
    {
      objc_msgSend(v8, "overlay");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "contentViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "willMoveToParentViewController:", 0);
      objc_msgSend(v9, "bs_beginAppearanceTransition:animated:", 0, 0);
      objc_msgSend(v9, "removeFromParentViewController");
      objc_msgSend(v9, "bs_endAppearanceTransition");
      objc_msgSend(v8, "overlay");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "invalidate");

      goto LABEL_8;
    }
  }
LABEL_9:
  -[NSMutableDictionary removeObjectForKey:](self->_appLayoutToLiveContentOverlayContext, "removeObjectForKey:", v6);
  SBLogAppSwitcher();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromFullScreenLiveContentOverlayType(objc_msgSend(v8, "overlayType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "succinctDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138544386;
    v20 = v14;
    v21 = 2048;
    v22 = self;
    v23 = 2114;
    v24 = v15;
    v25 = 2114;
    v26 = v16;
    v27 = 2114;
    v28 = v17;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Removing %{public}@ overlay for: %{public}@, animated: %{public}@", (uint8_t *)&v19, 0x34u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "removeLiveContentOverlayForAppLayout:animated:", v6, v4);

}

- (void)_moveExistingOverlayForAppLayout:(id)a3 toAppLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  SBFullScreenSwitcherLiveContentOverlayCoordinator *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](self->_appLayoutToLiveContentOverlayContext, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8
    && -[SBFullScreenSwitcherLiveContentOverlayCoordinator _supportsMovingOverlayTypeBetweenAppLayouts:](self, "_supportsMovingOverlayTypeBetweenAppLayouts:", objc_msgSend(v8, "overlayType")))
  {
    -[NSMutableDictionary removeObjectForKey:](self->_appLayoutToLiveContentOverlayContext, "removeObjectForKey:", v6);
    -[NSMutableDictionary setObject:forKey:](self->_appLayoutToLiveContentOverlayContext, "setObject:forKey:", v9, v7);
    SBLogAppSwitcher();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromFullScreenLiveContentOverlayType(objc_msgSend(v9, "overlayType"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "succinctDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "succinctDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138544386;
      v19 = v12;
      v20 = 2048;
      v21 = self;
      v22 = 2114;
      v23 = v13;
      v24 = 2114;
      v25 = v14;
      v26 = 2114;
      v27 = v15;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Moving existing %{public}@ overlay from: %{public}@, to: %{public}@", (uint8_t *)&v18, 0x34u);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "overlay");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "moveExistingLiveContentOverlay:forAppLayout:toAppLayout:", v17, v6, v7);

  }
}

void __92__SBFullScreenSwitcherLiveContentOverlayCoordinator__updatePortaledSceneLiveContentOverlays__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
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

- (int64_t)containerOrientation
{
  return self->_containerOrientation;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)sceneIDForTargetOfKeyboardShortcuts
{
  return self->_sceneIDForTargetOfKeyboardShortcuts;
}

- (NSString)bundleIDForTargetOfKeyboardShortcuts
{
  return self->_bundleIDForTargetOfKeyboardShortcuts;
}

- (NSMutableDictionary)appLayoutToLiveContentOverlayContext
{
  return self->_appLayoutToLiveContentOverlayContext;
}

- (void)setAppLayoutToLiveContentOverlayContext:(id)a3
{
  objc_storeStrong((id *)&self->_appLayoutToLiveContentOverlayContext, a3);
}

- (NSMutableArray)visibleAlwaysLiveAppLayouts
{
  return self->_visibleAlwaysLiveAppLayouts;
}

- (void)setVisibleAlwaysLiveAppLayouts:(id)a3
{
  objc_storeStrong((id *)&self->_visibleAlwaysLiveAppLayouts, a3);
}

- (SBSwitcherCoordinatedLayoutStateTransitionContext)currentCoordinatedLayoutStateTransitionContext
{
  return self->_currentCoordinatedLayoutStateTransitionContext;
}

- (void)setCurrentCoordinatedLayoutStateTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentCoordinatedLayoutStateTransitionContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCoordinatedLayoutStateTransitionContext, 0);
  objc_storeStrong((id *)&self->_visibleAlwaysLiveAppLayouts, 0);
  objc_storeStrong((id *)&self->_appLayoutToLiveContentOverlayContext, 0);
  objc_storeStrong((id *)&self->_bundleIDForTargetOfKeyboardShortcuts, 0);
  objc_storeStrong((id *)&self->_sceneIDForTargetOfKeyboardShortcuts, 0);
  objc_storeStrong((id *)&self->_keyboardFocusSceneID, 0);
  objc_destroyWeak((id *)&self->_switcherController);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
