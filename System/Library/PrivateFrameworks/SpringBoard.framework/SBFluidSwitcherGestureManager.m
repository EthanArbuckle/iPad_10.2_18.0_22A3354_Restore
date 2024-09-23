@implementation SBFluidSwitcherGestureManager

- (void)systemApertureZStackPolicyAssistantDidChange:(id)a3
{
  -[SBFluidSwitcherGestureManager _updateZStackParticipantWithReason:](self, "_updateZStackParticipantWithReason:", CFSTR("systemApertureZStackPolicyAssistantDidChange"));
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  NSTimer *delayedHomeGrabberUpdateTimer;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v14 = a4;
  -[NSTimer invalidate](self->_delayedHomeGrabberUpdateTimer, "invalidate");
  delayedHomeGrabberUpdateTimer = self->_delayedHomeGrabberUpdateTimer;
  self->_delayedHomeGrabberUpdateTimer = 0;

  -[SBFluidSwitcherGestureManager _updateExclusionTrapezoidDebugView](self, "_updateExclusionTrapezoidDebugView");
  objc_msgSend(v14, "toLayoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "elements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 >= 2)
    _UIInitializeDraggingSystem();
  objc_msgSend(v14, "toLayoutState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  -[SBFluidSwitcherGestureManager _updateZStackPolicyAssistantsWithLayoutState:](self, "_updateZStackPolicyAssistantsWithLayoutState:", v13);
  -[SBFluidSwitcherGestureManager _updateZStackParticipantWithReason:](self, "_updateZStackParticipantWithReason:", CFSTR("layout state transition did begin"));

}

- (void)_updateExclusionTrapezoidDebugView
{
  UIView *exclusionTrapezoidDebugView;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  UIView *v17;
  UIView *v18;
  UIView *v19;
  id v20;

  exclusionTrapezoidDebugView = self->_exclusionTrapezoidDebugView;
  v4 = (_QWORD *)MEMORY[0x1E0CEB820];
  v5 = (_QWORD *)MEMORY[0x1E0CEB828];
  if (exclusionTrapezoidDebugView)
  {
    -[UIView removeFromSuperview](exclusionTrapezoidDebugView, "removeFromSuperview");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, *v4, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, *v5, 0);

  }
  -[SBHomeGestureSettings exclusionTrapezoidSettings](self->_homeGestureSettings, "exclusionTrapezoidSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "showExclusionTrapezoidDebugView");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__updateExclusionTrapezoidDebugView, *v4, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__updateExclusionTrapezoidDebugView, *v5, 0);

    v12 = objc_opt_class();
    -[SBGrabberTongue edgePullGestureRecognizer](self->_deckGrabberTongue, "edgePullGestureRecognizer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v12, v13);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "_touchInterfaceOrientation");
    objc_msgSend(v20, "_currentExclusionShapeForEdge:", _screenRegionGivenInterfaceOrientedRegion());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    objc_msgSend(WeakRetained, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "debugView");
    v17 = (UIView *)objc_claimAutoreleasedReturnValue();
    v18 = self->_exclusionTrapezoidDebugView;
    self->_exclusionTrapezoidDebugView = v17;

    v19 = self->_exclusionTrapezoidDebugView;
    objc_msgSend(v16, "bounds");
    -[UIView setFrame:](v19, "setFrame:");
    -[UIView setAutoresizingMask:](self->_exclusionTrapezoidDebugView, "setAutoresizingMask:", 18);
    objc_msgSend(v16, "addSubview:", self->_exclusionTrapezoidDebugView);

  }
}

- (void)_updateZStackParticipantWithReason:(id)a3
{
  -[SBFZStackParticipant setNeedsUpdatePreferencesWithReason:](self->_zStackParticipant, "setNeedsUpdatePreferencesWithReason:", a3);
}

- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  if (self->_interactivelyPresentingTongue || self->_shouldRubberbandGrabberViewForReduceMotion)
  {
    -[SBGrabberTongue distanceFromEdge](self->_deckGrabberTongue, "distanceFromEdge");
    objc_msgSend(v4, "suggestedEdgeSpacing");
    BSUIConstrainValueWithRubberBand();
    v6 = v5;
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (void)_updateZStackPolicyAssistantsWithLayoutState:(id)a3
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD);
  void *v22;
  SEL v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t *v27;
  SEL v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v5 = a3;
  -[SBFluidSwitcherGestureManager activeGestureTransaction](self, "activeGestureTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && v6)
  {
    -[SBFluidSwitcherGestureManager _clearAudioCategoryZStackPolicyAssistant](self, "_clearAudioCategoryZStackPolicyAssistant");
    -[SBFluidSwitcherGestureManager _clearSystemApertureZStackPolicyAssistantSuppression](self, "_clearSystemApertureZStackPolicyAssistantSuppression");
    -[SBFluidSwitcherGestureManager _clearPhysicalButtonZStackPolicyAssistant](self, "_clearPhysicalButtonZStackPolicyAssistant");
    goto LABEL_20;
  }
  v23 = a2;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(WeakRetained, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "unlockedEnvironmentMode");
  objc_msgSend(v5, "appLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (self->_zStackSystemAperturePolicyAssistant)
  {
    objc_msgSend(v10, "itemForLayoutRole:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "elements");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v8;
    if (objc_msgSend(v13, "count") == 1 && v12)
    {
      v15 = objc_msgSend(v12, "type");

      v16 = 0;
      v17 = 0;
      if (v9 != 3 || v15)
        goto LABEL_15;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v14, "switcherContentController:deviceApplicationSceneHandleForDisplayItem:", WeakRetained, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(WeakRetained, "homeGrabberViewForAppLayout:", v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
          -[SBSystemApertureZStackPolicyAssistant setForegroundExclusiveSceneHandle:homeGrabberView:]((uint64_t)self->_zStackSystemAperturePolicyAssistant, v16, v17);

          v8 = v14;
          goto LABEL_16;
        }
LABEL_14:
        v17 = 0;
        goto LABEL_15;
      }
    }
    else
    {

    }
    v16 = 0;
    goto LABEL_14;
  }
LABEL_16:
  v18 = objc_loadWeakRetained((id *)&self->_switcherController);
  v19 = objc_msgSend(v18, "windowManagementStyle");
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__110;
  v34 = __Block_byref_object_dispose__110;
  v35 = 0;
  if (v9 == 3)
  {
    v20 = v19;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __78__SBFluidSwitcherGestureManager__updateZStackPolicyAssistantsWithLayoutState___block_invoke;
      v24[3] = &unk_1E8EBD9B0;
      v29 = v20 == 2;
      v28 = v23;
      v24[4] = self;
      v25 = v8;
      v26 = WeakRetained;
      v27 = &v30;
      v21 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v24);
      objc_msgSend(v5, "floatingAppLayout");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v21)[2](v21, v22);

      ((void (**)(_QWORD, void *))v21)[2](v21, v11);
    }
  }
  -[SBAudioCategoryZStackPolicyAssistant setForegroundScenes:]((id *)&self->_zStackAudioCategoryPolicyAssistant->super.isa, (void *)v31[5]);
  -[SBPhysicalButtonZStackPolicyAssistant setForegroundScenes:]((uint64_t)self->_zStackPhysicalButtonPolicyAssistant, (void *)v31[5]);
  _Block_object_dispose(&v30, 8);

LABEL_20:
}

- (SBFluidSwitcherGestureWorkspaceTransaction)activeGestureTransaction
{
  return self->_activeGestureTransaction;
}

void __78__SBFluidSwitcherGestureManager__updateZStackPolicyAssistantsWithLayoutState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v3 = a2;
  if (v3)
  {
    v17 = v3;
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(v3, "zOrderedItems");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v17, "itemForLayoutRole:", 4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bs_safeAddObject:", v5);

      objc_msgSend(v17, "itemForLayoutRole:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bs_safeAddObject:", v6);

      objc_msgSend(v17, "itemForLayoutRole:", 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bs_safeAddObject:", v7);

      v8 = objc_msgSend(v4, "count");
      objc_msgSend(v17, "allItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v8 != v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("SBFluidSwitcherGestureManager.m"), 3115, CFSTR("Item counts should match"));

      }
    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __78__SBFluidSwitcherGestureManager__updateZStackPolicyAssistantsWithLayoutState___block_invoke_2;
    v18[3] = &unk_1E8EBD988;
    v19 = *(id *)(a1 + 40);
    v20 = *(id *)(a1 + 48);
    objc_msgSend(v4, "bs_compactMap:", v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v15 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v13;

        v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      }
      objc_msgSend(v12, "addObjectsFromArray:", v11);
    }

    v3 = v17;
  }

}

id __78__SBFluidSwitcherGestureManager__updateZStackPolicyAssistantsWithLayoutState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "type"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "switcherContentController:deviceApplicationSceneHandleForDisplayItem:", *(_QWORD *)(a1 + 40), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sceneIfExists");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSHashTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  NSTimer *v16;
  NSTimer *delayedHomeGrabberUpdateTimer;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id location;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "toLayoutState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isInterrupted") & 1) == 0)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = self->_currentHomeGrabberViews;
    v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v29;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v12++), "updateStyle");
        }
        while (v10 != v12);
        v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v10);
    }

    if (-[SBFluidSwitcherGestureManager _shouldSuppressEdgeProtectToAllowSwipesImmediatelyAfterTransition](self, "_shouldSuppressEdgeProtectToAllowSwipesImmediatelyAfterTransition"))
    {
      objc_initWeak(&location, self);
      v13 = (void *)MEMORY[0x1E0C99E88];
      -[SBHomeGestureSettings secondsToAllowMultipleEdges](self->_homeGestureSettings, "secondsToAllowMultipleEdges");
      v15 = v14;
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __104__SBFluidSwitcherGestureManager_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke;
      v25 = &unk_1E8E9FA90;
      objc_copyWeak(&v26, &location);
      objc_msgSend(v13, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v22, v15);
      v16 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      delayedHomeGrabberUpdateTimer = self->_delayedHomeGrabberUpdateTimer;
      self->_delayedHomeGrabberUpdateTimer = v16;

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v8;
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

    -[SBFluidSwitcherGestureManager _updateZStackPolicyAssistantsWithLayoutState:](self, "_updateZStackPolicyAssistantsWithLayoutState:", v21);
  }
  -[SBFluidSwitcherGestureManager _updateExclusionTrapezoidDebugView](self, "_updateExclusionTrapezoidDebugView", v22, v23, v24, v25);

}

- (BOOL)_shouldSuppressEdgeProtectToAllowSwipesImmediatelyAfterTransition
{
  SBFluidSwitcherGestureManager *v2;
  id WeakRetained;
  void *v4;
  double v5;
  double v6;
  double v7;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(WeakRetained, "layoutContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "secondsSinceLastTransitionCompletion");
  v6 = v5;
  -[SBHomeGestureSettings secondsToAllowMultipleEdges](v2->_homeGestureSettings, "secondsToAllowMultipleEdges");
  LOBYTE(v2) = v6 < v7;

  return (char)v2;
}

- (void)setCurrentHomeGrabberViews:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  id v9;
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
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
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assistantController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled");

  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v10 = self->_currentHomeGrabberViews;
  v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v49 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v15) & 1) == 0)
          objc_msgSend(v9, "addObject:", v15);
      }
      v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    }
    while (v12);
  }

  v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v17 = v4;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v45 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
        if (!-[NSHashTable containsObject:](self->_currentHomeGrabberViews, "containsObject:", v22))
          objc_msgSend(v16, "addObject:", v22);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    }
    while (v19);
  }

  objc_storeStrong((id *)&self->_currentHomeGrabberViews, a3);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v23 = v9;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v41 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * k);
        if ((-[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture") & 1) == 0)
        {
          -[SBFluidSwitcherGestureManager relinquishHiddenAssertionForHomeGrabber:](self, "relinquishHiddenAssertionForHomeGrabber:", v28);
          -[SBFluidSwitcherGestureManager takeHiddenAssertionForHomeGrabber:](self, "takeHiddenAssertionForHomeGrabber:", v28);
        }
        objc_msgSend(v28, "setDelegate:", 0);
        objc_msgSend(v28, "setPointerClickDelegate:", 0);
        if (v8)
          objc_msgSend(v28, "removeObserver:", self);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
    }
    while (v25);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v29 = v16;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v37;
    do
    {
      for (m = 0; m != v31; ++m)
      {
        if (*(_QWORD *)v37 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * m);
        objc_msgSend(v34, "setDelegate:", self);
        objc_msgSend(v34, "setPointerClickDelegate:", self);
        if (v8)
        {
          objc_msgSend(v34, "addObserver:", self);
          -[SBFluidSwitcherGestureManager homeGrabberViewDidUpdateGrabberHitTestRect:](self, "homeGrabberViewDidUpdateGrabberHitTestRect:", v34);
        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
    }
    while (v31);
  }

}

- (BOOL)shouldAllowThinStyleForHomeGrabberView:(id)a3
{
  if (-[SBGrabberTongue isVisible](self->_deckGrabberTongue, "isVisible", a3))
    return 0;
  else
    return !-[SBFluidSwitcherGestureManager _shouldSuppressEdgeProtect](self, "_shouldSuppressEdgeProtect");
}

- (void)physicalButtonZStackPolicyAssistantDidChange:(id)a3
{
  -[SBFluidSwitcherGestureManager _updateZStackParticipantWithReason:](self, "_updateZStackParticipantWithReason:", CFSTR("physicalButtonZStackPolicyAssistantDidChange"));
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableSet *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "unlockedEnvironmentMode");
    switch(v8)
    {
      case 0:
      case 3:
        v37 = v8;
        -[SBFluidSwitcherGestureManager activeGestureTransaction](self, "activeGestureTransaction");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          -[SBFluidSwitcherGestureManager activeGestureTransaction](self, "activeGestureTransaction");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isComplete");

          v13 = 0;
          if (v12)
            v14 = 2;
          else
            v14 = 1;
        }
        else
        {
          v13 = 0;
          v14 = 2;
        }
        goto LABEL_10;
      case 1:
        goto LABEL_7;
      case 2:
        v14 = 1;
        v15 = 2;
        goto LABEL_9;
      default:
        v14 = 0;
        v13 = 0;
        objc_msgSend(v5, "setHomeGestureConsumption:", 1, v8);
        break;
    }
  }
  else
  {
LABEL_7:
    v14 = 0;
    v15 = 1;
LABEL_9:
    v37 = v15;
    v13 = 1;
LABEL_10:
    objc_msgSend(v5, "setHomeGestureConsumption:", 1, v37);
  }
  v39 = v7;
  if (objc_msgSend(v7, "isFloatingSwitcherVisible"))
    v16 = 1;
  else
    v16 = v13;
  objc_msgSend(v5, "setHomeAffordanceDrawingSuppression:", v16);
  objc_msgSend(v5, "setActivationPolicyForParticipantsBelow:", v14);
  objc_msgSend(v5, "setSuppressSystemApertureForSystemChromeSuppression:", -[_SBLoadApplicationResult isSuccess]((_BOOL8)self->_zStackSystemAperturePolicyAssistant));
  v17 = (void *)MEMORY[0x1E0C99E20];
  -[SBCameraHardwareButton allCameraShutterButtonPIDs]((uint64_t)self->_zStackSystemAperturePolicyAssistant);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithSet:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0C99E20];
  -[SBHomeScreenConfigurationServer connections]((uint64_t)self->_zStackSystemAperturePolicyAssistant);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setWithSet:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v23 = self->_suppressionAssertions;
  v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v41 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v28, "sceneID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "bundleID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
          objc_msgSend(v19, "addObject:", v29);
        if (v30)
          objc_msgSend(v22, "addObject:", v30);

      }
      v25 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v25);
  }

  objc_msgSend(v5, "setAssociatedSceneIdentifiersToSuppressInSystemAperture:", v19);
  objc_msgSend(v5, "setAssociatedBundleIdentifiersToSuppressInSystemAperture:", v22);
  -[SBHomeScreenConfigurationServer authenticator]((uint64_t)self->_zStackPhysicalButtonPolicyAssistant);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPhysicalButtonSceneTargets:", v31);

  -[SBHomeScreenConfigurationServer queue]((uint64_t)self->_zStackPhysicalButtonPolicyAssistant);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCaptureButtonFullFidelityEventRequestingScenes:", v32);

  -[SBHomeScreenConfigurationServer connections]((uint64_t)self->_zStackPhysicalButtonPolicyAssistant);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setForegroundCaptureSceneTargets:", v33);

  -[SBHomeScreenConfigurationServer authenticator]((uint64_t)self->_zStackAudioCategoryPolicyAssistant);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAudioCategoriesDisablingVolumeHUD:", v34);

  if (v38 == 3)
  {
    v35 = v39;
    if (-[SBAppSwitcherSettings effectiveSwitcherStyle](self->_appSwitcherSettings, "effectiveSwitcherStyle") == 2)
    {
      v36 = 1;
    }
    else if ((unint64_t)(objc_msgSend(v39, "interfaceOrientation") - 3) < 2)
    {
      v36 = 1;
    }
    else
    {
      v36 = 2;
    }
  }
  else
  {
    v36 = 0;
    v35 = v39;
  }
  objc_msgSend(v5, "setAllowsDimmingWhenForegroundInactive:", v36);

}

- (id)_currentLayoutState
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "layoutState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  SBFluidSwitcherPanGestureRecognizer *v6;
  id v7;
  BOOL v8;
  BOOL v9;

  v6 = (SBFluidSwitcherPanGestureRecognizer *)a3;
  v7 = a4;
  if (self->_deckInSwitcherPanGestureRecognizer == v6)
  {
    v9 = -[SBFluidSwitcherGestureManager _shouldDeckInSwitcherPanGesture:receiveTouch:](self, "_shouldDeckInSwitcherPanGesture:receiveTouch:", v6, v7);
LABEL_26:
    v8 = v9;
    goto LABEL_27;
  }
  if (self->_swipeUpFloatingAppGestureRecognizer == v6)
  {
    v9 = -[SBFluidSwitcherGestureManager _shouldFloatingApplicationSwipeUpGesture:receiveTouch:](self, "_shouldFloatingApplicationSwipeUpGesture:receiveTouch:", v6, v7);
    goto LABEL_26;
  }
  if (self->_moveFloatingApplicationGestureRecognizer == v6)
  {
    v9 = -[SBFluidSwitcherGestureManager _shouldFloatingApplicationMoveGesture:receiveTouch:](self, "_shouldFloatingApplicationMoveGesture:receiveTouch:", v6, v7);
    goto LABEL_26;
  }
  if (self->_pinFloatingApplicationGestureRecognizer == v6)
  {
    v9 = -[SBFluidSwitcherGestureManager _shouldFloatingApplicationPinGesture:receiveTouch:](self, "_shouldFloatingApplicationPinGesture:receiveTouch:", v6, v7);
    goto LABEL_26;
  }
  if (self->_unpinSplitViewApplicationGestureRecognizer == v6)
  {
    v9 = -[SBFluidSwitcherGestureManager _shouldSplitViewApplicationUnpinGesture:receiveTouch:](self, "_shouldSplitViewApplicationUnpinGesture:receiveTouch:", v6, v7);
    goto LABEL_26;
  }
  if ((SBFluidSwitcherPanGestureRecognizer *)self->_sceneResizePanGestureRecognizer == v6)
  {
    v9 = -[SBFluidSwitcherGestureManager _shouldSceneResizeGesture:receiveTouch:](self, "_shouldSceneResizeGesture:receiveTouch:", v6, v7);
    goto LABEL_26;
  }
  if ((SBFluidSwitcherPanGestureRecognizer *)self->_indirectFloatingAppScrunchGestureRecognizer == v6)
  {
    v9 = -[SBFluidSwitcherGestureManager _shouldIndirectFloatingAppScrunchGesture:receiveTouch:](self, "_shouldIndirectFloatingAppScrunchGesture:receiveTouch:", v6, v7);
    goto LABEL_26;
  }
  if (self->_clickAndDragHomeGestureRecognizer == v6)
  {
    v9 = -[SBFluidSwitcherGestureManager _shouldClickAndDragHomeGesture:receiveTouch:](self, "_shouldClickAndDragHomeGesture:receiveTouch:", v6, v7);
    goto LABEL_26;
  }
  if (self->_liveWindowResizeGestureRecognizer == v6)
  {
    v9 = -[SBFluidSwitcherGestureManager _shouldLiveResizeGesture:receiveTouch:](self, "_shouldLiveResizeGesture:receiveTouch:", v6, v7);
    goto LABEL_26;
  }
  if ((SBFluidSwitcherPanGestureRecognizer *)self->_tapToBringItemContainerForwardGestureRecognizer == v6)
  {
    v9 = -[SBFluidSwitcherGestureManager _shouldTapToBringItemContainerForward:receiveTouch:](self, "_shouldTapToBringItemContainerForward:receiveTouch:", v6, v7);
    goto LABEL_26;
  }
  if ((SBFluidSwitcherPanGestureRecognizer *)self->_clickDownToBringItemContainerForwardGestureRecognizer == v6)
  {
    v9 = -[SBFluidSwitcherGestureManager _shouldClickDownToBringItemContainerForward:receiveTouch:](self, "_shouldClickDownToBringItemContainerForward:receiveTouch:", v6, v7);
    goto LABEL_26;
  }
  if (self->_dragContinuousExposeStripOverflowGestureRecognizer == v6)
  {
    v9 = -[SBFluidSwitcherGestureManager _shouldContinuousExposeStripOverflowPanGesture:receiveTouch:](self, "_shouldContinuousExposeStripOverflowPanGesture:receiveTouch:", v6, v7);
    goto LABEL_26;
  }
  v8 = 1;
LABEL_27:

  return v8;
}

- (BOOL)_shouldClickAndDragHomeGesture:(id)a3 receiveTouch:(id)a4
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  NSHashTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "_isPointerTouch", a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
    objc_msgSend(WeakRetained, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemPointerInteractionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activePointerRegionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = self->_currentHomeGrabberViews;
    v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v9);
          if (*(void **)(*((_QWORD *)&v14 + 1) + 8 * i) == v8)
          {
            LOBYTE(v10) = 1;
            goto LABEL_13;
          }
        }
        v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (BOOL)grabberTongue:(id)a3 shouldReceiveTouch:(id)a4
{
  SBGrabberTongue *v6;
  id v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  double v12;
  double v13;

  v6 = (SBGrabberTongue *)a3;
  v7 = a4;
  if (self->_deckGrabberTongue == v6)
  {
    if (!-[SBGrabberTongue isVisible](v6, "isVisible") && self->_usesHomeAffordanceRulesForGrabberTongue)
    {
      -[SBGrabberTongue edgeLocationForTouch:](v6, "edgeLocationForTouch:", v7);
      v13 = v12;
      if (-[SBFluidSwitcherGestureManager _shouldProtectEdgeLocation:edge:](self, "_shouldProtectEdgeLocation:edge:", -[SBGrabberTongue screenEdge](v6, "screenEdge"), v12))
      {
        v10 = -[SBFluidSwitcherGestureManager _isEdgeLocationInHomeAffordanceRegion:](self, "_isEdgeLocationInHomeAffordanceRegion:", v13);
        goto LABEL_8;
      }
    }
LABEL_13:
    v11 = 1;
    goto LABEL_14;
  }
  if (self->_leftEdgeFloatingAppGrabberTongue != v6)
  {
    if (self->_continuousExposeStripRevealGrabberTongue != v6)
      goto LABEL_13;
    if (!-[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture")
      || (-[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "unlockedEnvironmentMode"),
          v8,
          v9 != 3))
    {
      v11 = 0;
      goto LABEL_14;
    }
    if (!-[SBGrabberTongue isVisible](v6, "isVisible"))
      goto LABEL_13;
  }
  -[SBGrabberTongue edgeLocationForTouch:](v6, "edgeLocationForTouch:", v7);
  v10 = -[SBGrabberTongue isEdgeLocationInGrabberRegion:](v6, "isEdgeLocationInGrabberRegion:");
LABEL_8:
  v11 = v10;
LABEL_14:

  return v11;
}

- (BOOL)_shouldProtectEdgeLocation:(double)a3 edge:(unint64_t)a4
{
  id WeakRetained;
  char v9;

  if (-[SBFluidSwitcherGestureManager _shouldSuppressEdgeProtect](self, "_shouldSuppressEdgeProtect"))
    return 0;
  -[SBFHomeGrabberSettings edgeProtectOverride](self->_homeGrabberSettings, "edgeProtectOverride");
  if ((BSSettingFlagIsYes() & 1) != 0)
    return 1;
  if ((BSSettingFlagIsExplicitNo() & 1) != 0)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  v9 = objc_msgSend(WeakRetained, "isEdgeProtectedForHomeGestureAtEdgeLocation:edge:", a4, a3);

  return v9;
}

- (BOOL)_shouldSuppressEdgeProtect
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  BOOL v7;
  void *v9;
  void *v10;

  -[SBFluidSwitcherGestureManager activeGestureTransaction](self, "activeGestureTransaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(WeakRetained, "layoutContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeTransitionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return 1;
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transientOverlayPresentationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (objc_msgSend(v10, "hasActivePresentation") & 1) != 0
    || -[SBFluidSwitcherGestureManager _shouldSuppressEdgeProtectToAllowSwipesImmediatelyAfterTransition](self, "_shouldSuppressEdgeProtectToAllowSwipesImmediatelyAfterTransition");

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  SBFluidSwitcherPanGestureRecognizer *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  SBFluidSwitcherPanGestureRecognizer *unpinSplitViewApplicationGestureRecognizer;
  int v17;
  id WeakRetained;

  v6 = a4;
  v7 = (SBFluidSwitcherPanGestureRecognizer *)a3;
  +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_presentGestureRecognizers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v6);

  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "coverSheetSlidingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "systemGesturesDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentGestureRecognizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v6, "isEqual:", v14);

  unpinSplitViewApplicationGestureRecognizer = self->_unpinSplitViewApplicationGestureRecognizer;
  if (unpinSplitViewApplicationGestureRecognizer == v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
    v17 = objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled") ^ 1;

  }
  else
  {
    LOBYTE(v17) = 0;
  }
  return v17 & (v10 | v15);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  SBIndirectPanGestureRecognizer *v6;
  UIGestureRecognizer *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  UIGestureRecognizer *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SBFluidSwitcherPanGestureRecognizer *liveWindowResizeGestureRecognizer;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  void *v27;
  uint64_t v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  NSObject *v43;
  _BOOL4 v44;
  void *v45;
  char v46;
  int v47;
  int v48;
  int v49;
  __CFString *v50;
  __CFString *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  __CFString *v56;
  CGFloat v57;
  CGFloat v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  int v63;
  __CFString *v64;
  uint8_t buf[4];
  __CFString *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  uint64_t v70;
  uint64_t v71;
  CGPoint v72;
  CGPoint v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = (SBIndirectPanGestureRecognizer *)a3;
  v7 = (UIGestureRecognizer *)a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatingDockController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "presentFloatingDockIndirectPanGestureRecognizer");
  v11 = (UIGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_presentGestureRecognizers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v13, "containsObject:", v7);

  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "coverSheetSlidingViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "systemGesturesDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "presentGestureRecognizer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = -[UIGestureRecognizer isEqual:](v7, "isEqual:", v17);

  liveWindowResizeGestureRecognizer = self->_liveWindowResizeGestureRecognizer;
  if (self->_indirectBottomEdgePanGestureRecognizer == v6 && v11 == v7
    || (SBIndirectPanGestureRecognizer *)self->_hoverGestureRecognizer == v6)
  {
LABEL_36:
    v46 = 1;
    goto LABEL_37;
  }
  if ((SBIndirectPanGestureRecognizer *)self->_moveFloatingApplicationGestureRecognizer == v6
    || (SBIndirectPanGestureRecognizer *)self->_pinFloatingApplicationGestureRecognizer == v6)
  {
    v46 = v63 | v62;
  }
  else
  {
    if ((SBIndirectPanGestureRecognizer *)self->_unpinSplitViewApplicationGestureRecognizer == v6)
    {
      if (self->_windowMoveClientGateRelationshipGestureRecognizer == v7)
      {
        v19 = objc_loadWeakRetained((id *)&self->_switcherContentController);
        objc_msgSend(v19, "view");
        v20 = objc_claimAutoreleasedReturnValue();

        -[SBIndirectPanGestureRecognizer _activeEventOfType:](v6, "_activeEventOfType:", 0);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "touchesForGestureRecognizer:", v6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "anyObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v61 = (void *)v20;
        _UISystemGestureLocationForTouchInView();
        v24 = v23;
        v26 = v25;
        -[SBFluidSwitcherGestureManager _hitTestStageItemContainerForUnpinGestureWithTouch:atGestureLocation:](self, "_hitTestStageItemContainerForUnpinGestureWithTouch:atGestureLocation:", v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v28 = objc_msgSend(v22, "_isPointerTouch");
          -[SBFluidSwitcherGestureManager _paddedHitTestRectForItemContainer:forPointerTouch:](self, "_paddedHitTestRectForItemContainer:forPointerTouch:", v27, v28);
          v30 = v29;
          v32 = v31;
          v57 = v33;
          v58 = v34;
          -[SBFluidSwitcherGestureManager _edgeSwipeHitTestRectForItemContainer:forPointerTouch:](self, "_edgeSwipeHitTestRectForItemContainer:forPointerTouch:", v27, v28);
          v36 = v35;
          v38 = v37;
          v40 = v39;
          v42 = v41;
          LOBYTE(v28) = SBRectContainsPoint();
          SBLogSystemGestureAppSwitcher();
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
          if ((v28 & 1) == 0)
          {
            if (v44)
            {
              v73.x = v24;
              v73.y = v26;
              NSStringFromCGPoint(v73);
              v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v76.origin.x = v30;
              v76.origin.y = v32;
              v76.size.width = v57;
              v76.size.height = v58;
              NSStringFromCGRect(v76);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v77.origin.x = v36;
              v77.origin.y = v38;
              v77.size.width = v40;
              v77.size.height = v42;
              NSStringFromCGRect(v77);
              *(_DWORD *)buf = 138412802;
              v66 = v64;
              v67 = 2112;
              v68 = v53;
              v69 = 2112;
              v70 = objc_claimAutoreleasedReturnValue();
              v54 = (void *)v70;
              _os_log_impl(&dword_1D0540000, v43, OS_LOG_TYPE_DEFAULT, "_unpinSplitViewApplicationGestureRecognizer requiring failure of _windowMoveClientGateRelationshipGestureRecognizer: touch (%@) hit-tested to item container (%@) and was outside edge swipe hit test rect (%@)", buf, 0x20u);

            }
            goto LABEL_36;
          }
          if (v44)
          {
            v72.x = v24;
            v72.y = v26;
            NSStringFromCGPoint(v72);
            v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v74.origin.x = v30;
            v74.origin.y = v32;
            v74.size.width = v57;
            v74.size.height = v58;
            NSStringFromCGRect(v74);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v75.origin.x = v36;
            v75.origin.y = v38;
            v75.size.width = v40;
            v75.size.height = v42;
            NSStringFromCGRect(v75);
            *(_DWORD *)buf = 138412802;
            v66 = v56;
            v67 = 2112;
            v68 = v59;
            v69 = 2112;
            v70 = objc_claimAutoreleasedReturnValue();
            v45 = (void *)v70;
            _os_log_impl(&dword_1D0540000, v43, OS_LOG_TYPE_DEFAULT, "_unpinSplitViewApplicationGestureRecognizer not requiring failure of _windowMoveClientGateRelationshipGestureRecognizer: touch (%@) hit-tested to item container (%@) but was inside edge swipe hit test rect (%@)", buf, 0x20u);

          }
        }
        else
        {
          SBLogSystemGestureAppSwitcher();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D0540000, v43, OS_LOG_TYPE_DEFAULT, "_unpinSplitViewApplicationGestureRecognizer not requiring failure of _windowMoveClientGateRelationshipGestureRecognizer: did not hit-test to item container", buf, 2u);
          }
        }

      }
      v47 = objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled");
      v48 = liveWindowResizeGestureRecognizer == (SBFluidSwitcherPanGestureRecognizer *)v7 ? 1 : v62;
      v49 = v47 ^ 1 | v63 ? v47 : v48;
      if (v49 == 1)
      {
        v50 = CFSTR("(unexpected gesture recognizer)");
        if (liveWindowResizeGestureRecognizer == (SBFluidSwitcherPanGestureRecognizer *)v7)
          v50 = CFSTR("_liveWindowResizeGestureRecognizer");
        if (v62)
          v50 = CFSTR("(Cover Sheet presentation gesture recognizer)");
        if (v63)
          v50 = CFSTR("(some Control Center presentation gesture recognizer)");
        v51 = v50;
        SBLogSystemGestureAppSwitcher();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v66 = v51;
          _os_log_impl(&dword_1D0540000, v52, OS_LOG_TYPE_DEFAULT, "_unpinSplitViewApplicationGestureRecognizer requiring failure of %{public}@", buf, 0xCu);
        }

        goto LABEL_36;
      }
    }
    v46 = 0;
  }
LABEL_37:

  return v46;
}

- (void)zStackParticipantDidChange:(id)a3
{
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_currentHomeGrabberViews;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        if (-[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture", (_QWORD)v11))-[SBFluidSwitcherGestureManager relinquishHiddenAssertionForHomeGrabber:](self, "relinquishHiddenAssertionForHomeGrabber:", v9);
        else
          -[SBFluidSwitcherGestureManager takeHiddenAssertionForHomeGrabber:](self, "takeHiddenAssertionForHomeGrabber:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(WeakRetained, "zStackActivationStateUpdated");

  -[SBFluidSwitcherGestureManager _updateHomeAffordanceInteraction](self, "_updateHomeAffordanceInteraction");
}

- (void)relinquishHiddenAssertionForHomeGrabber:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0DA9E28];
  v4 = a3;
  objc_msgSend(v3, "rootSettings");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unhideForHomeGestureOwnershipAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "BSAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setHomeAffordanceInteractionEnabled:", 1);
  objc_msgSend(v4, "setHidden:forReason:withAnimationSettings:", 0, CFSTR("SBFluidSwitcherHomeGestureNotOwnedGrabberHiddenReason"), v6);

}

- (void)audioCategoryZStackPolicyAssistantDidChange:(id)a3
{
  -[SBFluidSwitcherGestureManager _updateZStackParticipantWithReason:](self, "_updateZStackParticipantWithReason:", CFSTR("audioCategoryZStackPolicyAssistantDidChange"));
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  _UIPassthroughTapGestureRecognizer *v6;
  UILongPressGestureRecognizer *v7;
  UIHoverGestureRecognizer *hoverGestureRecognizer;
  BOOL v9;
  BOOL v10;

  v6 = (_UIPassthroughTapGestureRecognizer *)a3;
  v7 = (UILongPressGestureRecognizer *)a4;
  hoverGestureRecognizer = self->_hoverGestureRecognizer;
  v9 = hoverGestureRecognizer == (UIHoverGestureRecognizer *)v6
    || hoverGestureRecognizer == (UIHoverGestureRecognizer *)v7;
  v10 = v9
     || (self->_tapToBringItemContainerForwardGestureRecognizer == v6
      || (_UIPassthroughTapGestureRecognizer *)self->_clickDownToBringItemContainerForwardGestureRecognizer == v6)
     && (UILongPressGestureRecognizer *)self->_windowMoveClientGateRelationshipGestureRecognizer == v7
     || (_UIPassthroughTapGestureRecognizer *)self->_unpinSplitViewApplicationGestureRecognizer == v6
     && self->_clickDownToBringItemContainerForwardGestureRecognizer == v7;

  return v10;
}

void __104__SBFluidSwitcherGestureManager_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
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
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "currentHomeGrabberViews", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "updateStyle");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (NSHashTable)currentHomeGrabberViews
{
  return self->_currentHomeGrabberViews;
}

- (SBFluidSwitcherGestureManager)initWithSwitcherController:(id)a3 delegate:(id)a4
{
  SBFluidSwitcherGestureManager *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSHashTable *currentHomeGrabberViews;
  void *v13;
  uint64_t v14;
  SBFHomeAffordanceInteraction *homeAffordanceInteraction;
  void *v16;
  uint64_t v17;
  SBLayoutStateTransitionCoordinator *layoutStateTransitionCoordinator;
  uint64_t v19;
  SBAppSwitcherSettings *appSwitcherSettings;
  uint64_t v21;
  SBHomeGestureSettings *homeGestureSettings;
  uint64_t v23;
  SBFHomeGrabberSettings *homeGrabberSettings;
  void *v25;
  uint64_t v26;
  SBAppSwitcherDefaults *appSwitcherDefaults;
  SBAppSwitcherDefaults *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  SBDisplayItemLayoutAttributesCalculator *v40;
  SBDisplayItemLayoutAttributesCalculator *displayItemLayoutAttributesCalculator;
  void *v42;
  void *v44;
  id v45;
  id v46;
  id obj;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  id location;
  objc_super v53;
  _QWORD v54[2];
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  obj = a3;
  v46 = a4;
  v53.receiver = self;
  v53.super_class = (Class)SBFluidSwitcherGestureManager;
  v6 = -[SBFluidSwitcherGestureManager init](&v53, sel_init);
  if (v6)
  {
    objc_msgSend(obj, "windowScene");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "contentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    v9 = v7;
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
    v45 = v10;

    objc_storeWeak((id *)&v6->_switcherController, obj);
    objc_storeWeak((id *)&v6->_switcherContentController, v45);
    objc_storeWeak((id *)&v6->_delegate, v46);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    currentHomeGrabberViews = v6->_currentHomeGrabberViews;
    v6->_currentHomeGrabberViews = (NSHashTable *)v11;

    objc_msgSend(v44, "homeAffordanceInteractionManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "newHomeAffordanceInteraction");
    homeAffordanceInteraction = v6->_homeAffordanceInteraction;
    v6->_homeAffordanceInteraction = (SBFHomeAffordanceInteraction *)v14;

    -[SBFHomeAffordanceInteraction setDelegate:](v6->_homeAffordanceInteraction, "setDelegate:", v6);
    objc_msgSend(v45, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addInteraction:", v6->_homeAffordanceInteraction);

    objc_msgSend(v44, "layoutStateTransitionCoordinator");
    v17 = objc_claimAutoreleasedReturnValue();
    layoutStateTransitionCoordinator = v6->_layoutStateTransitionCoordinator;
    v6->_layoutStateTransitionCoordinator = (SBLayoutStateTransitionCoordinator *)v17;

    -[SBLayoutStateTransitionCoordinator addObserver:](v6->_layoutStateTransitionCoordinator, "addObserver:", v6);
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v19 = objc_claimAutoreleasedReturnValue();
    appSwitcherSettings = v6->_appSwitcherSettings;
    v6->_appSwitcherSettings = (SBAppSwitcherSettings *)v19;

    +[SBHomeGestureDomain rootSettings](SBHomeGestureDomain, "rootSettings");
    v21 = objc_claimAutoreleasedReturnValue();
    homeGestureSettings = v6->_homeGestureSettings;
    v6->_homeGestureSettings = (SBHomeGestureSettings *)v21;

    -[PTSettings addKeyObserver:](v6->_homeGestureSettings, "addKeyObserver:", v6);
    objc_msgSend(MEMORY[0x1E0DA9E28], "rootSettings");
    v23 = objc_claimAutoreleasedReturnValue();
    homeGrabberSettings = v6->_homeGrabberSettings;
    v6->_homeGrabberSettings = (SBFHomeGrabberSettings *)v23;

    objc_initWeak(&location, v6);
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "appSwitcherDefaults");
    v26 = objc_claimAutoreleasedReturnValue();
    appSwitcherDefaults = v6->_appSwitcherDefaults;
    v6->_appSwitcherDefaults = (SBAppSwitcherDefaults *)v26;

    v28 = v6->_appSwitcherDefaults;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "trackpadSwitcherGesturesEnabled");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = MEMORY[0x1E0C80D38];
    v32 = MEMORY[0x1E0C809B0];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __69__SBFluidSwitcherGestureManager_initWithSwitcherController_delegate___block_invoke;
    v50[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v51, &location);
    v33 = (id)-[SBAppSwitcherDefaults observeDefaults:onQueue:withBlock:](v28, "observeDefaults:onQueue:withBlock:", v30, MEMORY[0x1E0C80D38], v50);

    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "gestureDefaults");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "multitaskingGesturesRequireEducation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v36;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemGesturesAllowed");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v32;
    v48[1] = 3221225472;
    v48[2] = __69__SBFluidSwitcherGestureManager_initWithSwitcherController_delegate___block_invoke_2;
    v48[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v49, &location);
    v39 = (id)objc_msgSend(v35, "observeDefaults:onQueue:withBlock:", v38, MEMORY[0x1E0C80D38], v48);

    -[SBFluidSwitcherGestureManager _updateGestureDefaults](v6, "_updateGestureDefaults");
    v40 = objc_alloc_init(SBDisplayItemLayoutAttributesCalculator);
    displayItemLayoutAttributesCalculator = v6->_displayItemLayoutAttributesCalculator;
    v6->_displayItemLayoutAttributesCalculator = v40;

    if (SBFIsChamoisWindowingUIAvailable())
    {
      objc_msgSend((id)SBApp, "bannerManager");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addTransitionObserver:", v6);

    }
    -[SBFluidSwitcherGestureManager _setUpGestureRecognizers](v6, "_setUpGestureRecognizers");
    -[SBFluidSwitcherGestureManager _updateZStackParticipantWithReason:](v6, "_updateZStackParticipantWithReason:", CFSTR("init"));
    objc_destroyWeak(&v49);

    objc_destroyWeak(&v51);
    objc_destroyWeak(&location);

  }
  return v6;
}

void __69__SBFluidSwitcherGestureManager_initWithSwitcherController_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateIndirectBottomEdgePanGesturePresence");

}

void __69__SBFluidSwitcherGestureManager_initWithSwitcherController_delegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateGestureDefaults");

}

- (void)dealloc
{
  objc_super v3;

  -[SBFluidSwitcherGestureManager invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBFluidSwitcherGestureManager;
  -[SBFluidSwitcherGestureManager dealloc](&v3, sel_dealloc);
}

- (void)_setUpGestureRecognizers
{
  void *v3;
  void *v4;
  SBFZStackParticipant *v5;
  SBFZStackParticipant *zStackParticipant;
  SBAudioCategoryZStackPolicyAssistant *v7;
  SBAudioCategoryZStackPolicyAssistant *zStackAudioCategoryPolicyAssistant;
  SBSystemApertureZStackPolicyAssistant *v9;
  SBSystemApertureZStackPolicyAssistant *zStackSystemAperturePolicyAssistant;
  SBPhysicalButtonZStackPolicyAssistant *v11;
  SBPhysicalButtonZStackPolicyAssistant *zStackPhysicalButtonPolicyAssistant;
  NSMutableSet *v13;
  NSMutableSet *suppressionAssertions;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zStackResolver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "acquireParticipantWithIdentifier:delegate:", 1, self);
  v5 = (SBFZStackParticipant *)objc_claimAutoreleasedReturnValue();
  zStackParticipant = self->_zStackParticipant;
  self->_zStackParticipant = v5;

  v7 = (SBAudioCategoryZStackPolicyAssistant *)-[SBAudioCategoryZStackPolicyAssistant initWithDelegate:]((id *)[SBAudioCategoryZStackPolicyAssistant alloc], self);
  zStackAudioCategoryPolicyAssistant = self->_zStackAudioCategoryPolicyAssistant;
  self->_zStackAudioCategoryPolicyAssistant = v7;

  v9 = (SBSystemApertureZStackPolicyAssistant *)-[SBSystemApertureZStackPolicyAssistant initWithDelegate:]((id *)[SBSystemApertureZStackPolicyAssistant alloc], self);
  zStackSystemAperturePolicyAssistant = self->_zStackSystemAperturePolicyAssistant;
  self->_zStackSystemAperturePolicyAssistant = v9;

  v11 = (SBPhysicalButtonZStackPolicyAssistant *)-[SBPhysicalButtonZStackPolicyAssistant initWithDelegate:]((id *)[SBPhysicalButtonZStackPolicyAssistant alloc], self);
  zStackPhysicalButtonPolicyAssistant = self->_zStackPhysicalButtonPolicyAssistant;
  self->_zStackPhysicalButtonPolicyAssistant = v11;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  suppressionAssertions = self->_suppressionAssertions;
  self->_suppressionAssertions = v13;

  -[SBFluidSwitcherGestureManager _updateSwitcherBottomEdgeGesturePresence](self, "_updateSwitcherBottomEdgeGesturePresence");
  -[SBFluidSwitcherGestureManager _updateDeckSwitcherInSwitcherGesturePresence](self, "_updateDeckSwitcherInSwitcherGesturePresence");
  -[SBFluidSwitcherGestureManager _setUpScrunchGestureRecognizerIfNeeded](self, "_setUpScrunchGestureRecognizerIfNeeded");
  -[SBFluidSwitcherGestureManager _updateIndirectBottomEdgePanGesturePresence](self, "_updateIndirectBottomEdgePanGesturePresence");
  -[SBFluidSwitcherGestureManager updateForWindowManagementStyle:](self, "updateForWindowManagementStyle:", objc_msgSend(WeakRetained, "windowManagementStyle"));

}

- (void)_setUpScrunchGestureRecognizerIfNeeded
{
  id WeakRetained;
  void *v4;
  SBFluidScrunchGestureRecognizer *v5;
  void *v6;
  SBFluidScrunchGestureRecognizer *v7;
  SBFluidScrunchGestureRecognizer *fluidScrunchGestureRecognizer;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "windowScene");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "systemGestureManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBAppSwitcherSettings effectiveSwitcherStyle](self->_appSwitcherSettings, "effectiveSwitcherStyle") == 2)
  {
    v5 = [SBFluidScrunchGestureRecognizer alloc];
    objc_msgSend(v9, "_fbsDisplayConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBFluidScrunchGestureRecognizer initWithTarget:action:displayConfiguration:](v5, "initWithTarget:action:displayConfiguration:", self, sel__handleScrunchGesture_, v6);
    fluidScrunchGestureRecognizer = self->_fluidScrunchGestureRecognizer;
    self->_fluidScrunchGestureRecognizer = v7;

    -[SBFluidScrunchGestureRecognizer setName:](self->_fluidScrunchGestureRecognizer, "setName:", CFSTR("fluidScrunch"));
    -[SBFluidScrunchGestureRecognizer setDelegate:](self->_fluidScrunchGestureRecognizer, "setDelegate:", self);
    -[SBFluidScrunchGestureRecognizer setAllowedTouchTypes:](self->_fluidScrunchGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CF0D0);
    objc_msgSend(v4, "addGestureRecognizer:withType:", self->_fluidScrunchGestureRecognizer, 18);
  }

}

- (void)_updateFluidDragAndDropManagerPresenceForWindowManagementStyle:(unint64_t)a3
{
  SBFluidSwitcherDragAndDropManager *fluidDragAndDropManager;
  SBFluidSwitcherDragAndDropManager *v5;
  SBFluidSwitcherDragAndDropManager *v6;
  SBFluidSwitcherDragAndDropManager *v7;
  id WeakRetained;

  fluidDragAndDropManager = self->_fluidDragAndDropManager;
  if (!a3 || fluidDragAndDropManager)
  {
    if (!a3 && fluidDragAndDropManager)
    {
      self->_fluidDragAndDropManager = 0;

    }
  }
  else
  {
    v5 = [SBFluidSwitcherDragAndDropManager alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
    v6 = -[SBFluidSwitcherDragAndDropManager initWithSwitcherController:delegate:](v5, "initWithSwitcherController:delegate:", WeakRetained, self);
    v7 = self->_fluidDragAndDropManager;
    self->_fluidDragAndDropManager = v6;

  }
}

- (void)_updateIndirectBottomEdgePanGesturePresence
{
  id WeakRetained;
  void *v4;
  int v5;
  SBIndirectPanGestureRecognizer *indirectBottomEdgePanGestureRecognizer;
  SBIndirectPanGestureRecognizer *v7;
  SBIndirectPanGestureRecognizer *v8;
  SBIndirectPanGestureRecognizer *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemGestureManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v5 = -[SBAppSwitcherDefaults areTrackpadSwitcherGesturesEnabled](self->_appSwitcherDefaults, "areTrackpadSwitcherGesturesEnabled");
  indirectBottomEdgePanGestureRecognizer = self->_indirectBottomEdgePanGestureRecognizer;
  if (v5)
  {
    if (!indirectBottomEdgePanGestureRecognizer)
    {
      v7 = -[SBIndirectPanGestureRecognizer initWithTarget:action:edges:]([SBIndirectPanGestureRecognizer alloc], "initWithTarget:action:edges:", self, sel__handleFluidGesture_, 4);
      v8 = self->_indirectBottomEdgePanGestureRecognizer;
      self->_indirectBottomEdgePanGestureRecognizer = v7;

      -[SBIndirectPanGestureRecognizer setName:](self->_indirectBottomEdgePanGestureRecognizer, "setName:", CFSTR("indirectHomePanGestureRecognizer"));
      -[SBIndirectPanGestureRecognizer setShouldInvertYAxis:](self->_indirectBottomEdgePanGestureRecognizer, "setShouldInvertYAxis:", 1);
      -[SBIndirectPanGestureRecognizer setDelegate:](self->_indirectBottomEdgePanGestureRecognizer, "setDelegate:", self);
      -[SBIndirectPanGestureRecognizer setShouldRequireGestureToStartAtEdge:](self->_indirectBottomEdgePanGestureRecognizer, "setShouldRequireGestureToStartAtEdge:", 1);
      -[SBIndirectPanGestureRecognizer setHysteresis:forInputType:](self->_indirectBottomEdgePanGestureRecognizer, "setHysteresis:forInputType:", 0, 10.0);
      -[SBIndirectPanGestureRecognizer setHysteresis:forInputType:](self->_indirectBottomEdgePanGestureRecognizer, "setHysteresis:forInputType:", 1, 10.0);
      -[SBIndirectPanGestureRecognizer setTranslationAdjustmentBlock:](self->_indirectBottomEdgePanGestureRecognizer, "setTranslationAdjustmentBlock:", &__block_literal_global_355);
      objc_msgSend(v10, "addGestureRecognizer:withType:", self->_indirectBottomEdgePanGestureRecognizer, 41);
    }
  }
  else if (indirectBottomEdgePanGestureRecognizer)
  {
    objc_msgSend(v10, "removeGestureRecognizer:");
    -[SBIndirectPanGestureRecognizer setDelegate:](self->_indirectBottomEdgePanGestureRecognizer, "setDelegate:", 0);
    v9 = self->_indirectBottomEdgePanGestureRecognizer;
    self->_indirectBottomEdgePanGestureRecognizer = 0;

  }
}

double __76__SBFluidSwitcherGestureManager__updateIndirectBottomEdgePanGesturePresence__block_invoke(double result, double a2, double a3, double a4)
{
  double v4;

  v4 = a2 - fabs(result);
  if (a4 == 0.0 && v4 < 0.0)
    return *MEMORY[0x1E0C9D538];
  return result;
}

- (void)_updateFloatingApplicationGestureRecognizerPresenceForWindowManagementStyle:(unint64_t)a3
{
  SBFluidSwitcherPanGestureRecognizer *unpinSplitViewApplicationGestureRecognizer;

  unpinSplitViewApplicationGestureRecognizer = self->_unpinSplitViewApplicationGestureRecognizer;
  if (!a3 || unpinSplitViewApplicationGestureRecognizer)
  {
    if (!a3)
    {
      if (unpinSplitViewApplicationGestureRecognizer)
        -[SBFluidSwitcherGestureManager _tearDownFloatingApplicationGestureRecognizers](self, "_tearDownFloatingApplicationGestureRecognizers");
    }
  }
  else
  {
    -[SBFluidSwitcherGestureManager _setUpFloatingApplicationGestureRecognizers](self, "_setUpFloatingApplicationGestureRecognizers");
  }
}

- (void)_setUpFloatingApplicationGestureRecognizers
{
  void *v3;
  id v4;
  void *v5;
  SBGrabberTongue *v6;
  id *v7;
  uint64_t v8;
  SBGrabberTongue *v9;
  SBGrabberTongue *rightEdgeFloatingAppGrabberTongue;
  SBGrabberTongue *v11;
  void *v12;
  SBGrabberTongue *v13;
  uint64_t v14;
  SBGrabberTongue *v15;
  SBGrabberTongue *leftEdgeFloatingAppGrabberTongue;
  SBGrabberTongue *v17;
  void *v18;
  SBFluidSwitcherPanGestureRecognizer *v19;
  SBFluidSwitcherPanGestureRecognizer *swipeUpFloatingAppGestureRecognizer;
  SBFluidSwitcherPanGestureRecognizer *v21;
  SBFluidSwitcherPanGestureRecognizer *v22;
  SBFluidSwitcherPanGestureRecognizer *moveFloatingApplicationGestureRecognizer;
  SBFluidSwitcherPanGestureRecognizer *v24;
  SBFluidSwitcherPanGestureRecognizer *v25;
  SBFluidSwitcherPanGestureRecognizer *pinFloatingApplicationGestureRecognizer;
  SBFluidSwitcherPanGestureRecognizer *v27;
  SBFluidSwitcherPanGestureRecognizer *unpinSplitViewApplicationGestureRecognizer;
  SBPanSystemGestureRecognizer *v29;
  SBPanSystemGestureRecognizer *sceneResizePanGestureRecognizer;
  SBPanSystemGestureRecognizer *v31;
  SBFluidScrunchGestureRecognizer *v32;
  SBFluidScrunchGestureRecognizer *indirectFloatingAppScrunchGestureRecognizer;
  SBIndirectPanGestureRecognizer *v34;
  SBIndirectPanGestureRecognizer *indirectDismissFloatingApplicationGestureRecognizer;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  SBFluidSwitcherPanGestureRecognizer *v41;
  void *v42;
  SBFluidSwitcherPanGestureRecognizer *v43;
  void *v44;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(v3, "systemGestureManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [SBGrabberTongue alloc];
  v7 = (id *)MEMORY[0x1E0CEB258];
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    v8 = 2;
  else
    v8 = 8;
  v9 = -[SBGrabberTongue initWithDelegate:edge:type:windowScene:](v6, "initWithDelegate:edge:type:windowScene:", self, v8, 25, v3);
  rightEdgeFloatingAppGrabberTongue = self->_rightEdgeFloatingAppGrabberTongue;
  self->_rightEdgeFloatingAppGrabberTongue = v9;

  -[SBGrabberTongue setName:](self->_rightEdgeFloatingAppGrabberTongue, "setName:", CFSTR("RightEdgeFloatingAppGrabberTongue"));
  v11 = self->_rightEdgeFloatingAppGrabberTongue;
  objc_msgSend(v4, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBGrabberTongue installInView:withColorStyle:](v11, "installInView:withColorStyle:", v12, 0);

  v13 = [SBGrabberTongue alloc];
  if (objc_msgSend(*v7, "userInterfaceLayoutDirection") == 1)
    v14 = 8;
  else
    v14 = 2;
  v15 = -[SBGrabberTongue initWithDelegate:edge:type:windowScene:](v13, "initWithDelegate:edge:type:windowScene:", self, v14, 26, v3);
  leftEdgeFloatingAppGrabberTongue = self->_leftEdgeFloatingAppGrabberTongue;
  self->_leftEdgeFloatingAppGrabberTongue = v15;

  -[SBGrabberTongue setName:](self->_leftEdgeFloatingAppGrabberTongue, "setName:", CFSTR("LeftEdgeFloatingAppGrabberTongue"));
  v17 = self->_leftEdgeFloatingAppGrabberTongue;
  objc_msgSend(v4, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBGrabberTongue installInView:withColorStyle:](v17, "installInView:withColorStyle:", v18, 0);

  v19 = -[SBFluidSwitcherPanGestureRecognizer initWithTarget:action:]([SBFluidSwitcherPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleFluidGesture_);
  -[SBFluidSwitcherPanGestureRecognizer setSwitcherViewController:](v19, "setSwitcherViewController:", v4);
  -[SBFluidSwitcherPanGestureRecognizer setInstalledAsSystemGesture:](v19, "setInstalledAsSystemGesture:", 1);
  -[SBFluidSwitcherPanGestureRecognizer setAllowedTouchTypes:](v19, "setAllowedTouchTypes:", &unk_1E91CF0E8);
  -[SBFluidSwitcherPanGestureRecognizer setDelegate:](v19, "setDelegate:", self);
  -[SBFluidSwitcherPanGestureRecognizer setName:](v19, "setName:", CFSTR("_swipeUpFloatingAppGestureRecognizer"));
  swipeUpFloatingAppGestureRecognizer = self->_swipeUpFloatingAppGestureRecognizer;
  self->_swipeUpFloatingAppGestureRecognizer = v19;
  v21 = v19;

  objc_msgSend(v5, "addGestureRecognizer:withType:", self->_swipeUpFloatingAppGestureRecognizer, 32);
  v22 = -[SBFluidSwitcherPanGestureRecognizer initWithTarget:action:]([SBFluidSwitcherPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleFluidGesture_);
  -[SBFluidSwitcherPanGestureRecognizer setSwitcherViewController:](v22, "setSwitcherViewController:", v4);
  -[SBFluidSwitcherPanGestureRecognizer setInstalledAsSystemGesture:](v22, "setInstalledAsSystemGesture:", 1);
  -[SBFluidSwitcherPanGestureRecognizer setAllowedTouchTypes:](v22, "setAllowedTouchTypes:", &unk_1E91CF100);
  -[SBFluidSwitcherPanGestureRecognizer setDelegate:](v22, "setDelegate:", self);
  -[SBFluidSwitcherPanGestureRecognizer setName:](v22, "setName:", CFSTR("_moveFloatingApplicationGestureRecognizer"));
  -[SBPanSystemGestureRecognizer setFailsPastMaximumPressDurationWithoutHysteresis:](v22, "setFailsPastMaximumPressDurationWithoutHysteresis:", 1);
  -[SBFluidSwitcherPanGestureRecognizer setMaximumNumberOfTouches:](v22, "setMaximumNumberOfTouches:", 1);
  _UIDragInteractionDefaultLiftDelay();
  -[SBPanSystemGestureRecognizer setMaximumPressDuration:](v22, "setMaximumPressDuration:");
  moveFloatingApplicationGestureRecognizer = self->_moveFloatingApplicationGestureRecognizer;
  self->_moveFloatingApplicationGestureRecognizer = v22;
  v24 = v22;

  objc_msgSend(v5, "addGestureRecognizer:withType:", self->_moveFloatingApplicationGestureRecognizer, 29);
  v25 = -[SBFluidSwitcherPanGestureRecognizer initWithTarget:action:]([SBFluidSwitcherPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleWindowDragGestureRecognizer_);
  pinFloatingApplicationGestureRecognizer = self->_pinFloatingApplicationGestureRecognizer;
  self->_pinFloatingApplicationGestureRecognizer = v25;

  -[SBFluidSwitcherPanGestureRecognizer setInstalledAsSystemGesture:](self->_pinFloatingApplicationGestureRecognizer, "setInstalledAsSystemGesture:", 1);
  -[SBFluidSwitcherPanGestureRecognizer setSwitcherViewController:](self->_pinFloatingApplicationGestureRecognizer, "setSwitcherViewController:", v4);
  -[SBFluidSwitcherPanGestureRecognizer _setHysteresis:](self->_pinFloatingApplicationGestureRecognizer, "_setHysteresis:", 10.0);
  -[SBFluidSwitcherPanGestureRecognizer setAllowedTouchTypes:](self->_pinFloatingApplicationGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CF118);
  -[SBFluidSwitcherPanGestureRecognizer setDelegate:](self->_pinFloatingApplicationGestureRecognizer, "setDelegate:", self);
  -[SBFluidSwitcherPanGestureRecognizer setMaximumNumberOfTouches:](self->_pinFloatingApplicationGestureRecognizer, "setMaximumNumberOfTouches:", 1);
  -[SBFluidSwitcherPanGestureRecognizer setName:](self->_pinFloatingApplicationGestureRecognizer, "setName:", CFSTR("_pinFloatingApplicationGestureRecognizer"));
  objc_msgSend(v5, "addGestureRecognizer:withType:", self->_pinFloatingApplicationGestureRecognizer, 30);
  v27 = -[SBFluidSwitcherPanGestureRecognizer initWithTarget:action:]([SBFluidSwitcherPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleWindowDragGestureRecognizer_);
  unpinSplitViewApplicationGestureRecognizer = self->_unpinSplitViewApplicationGestureRecognizer;
  self->_unpinSplitViewApplicationGestureRecognizer = v27;

  -[SBFluidSwitcherPanGestureRecognizer setInstalledAsSystemGesture:](self->_unpinSplitViewApplicationGestureRecognizer, "setInstalledAsSystemGesture:", 1);
  -[SBFluidSwitcherPanGestureRecognizer setSwitcherViewController:](self->_unpinSplitViewApplicationGestureRecognizer, "setSwitcherViewController:", v4);
  -[SBFluidSwitcherPanGestureRecognizer _setHysteresis:](self->_unpinSplitViewApplicationGestureRecognizer, "_setHysteresis:", 10.0);
  -[SBFluidSwitcherPanGestureRecognizer setAllowedTouchTypes:](self->_unpinSplitViewApplicationGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CF130);
  -[SBFluidSwitcherPanGestureRecognizer setDelegate:](self->_unpinSplitViewApplicationGestureRecognizer, "setDelegate:", self);
  -[SBFluidSwitcherPanGestureRecognizer setMaximumNumberOfTouches:](self->_unpinSplitViewApplicationGestureRecognizer, "setMaximumNumberOfTouches:", 1);
  -[SBFluidSwitcherPanGestureRecognizer setName:](self->_unpinSplitViewApplicationGestureRecognizer, "setName:", CFSTR("_unpinSplitViewApplicationGestureRecognizer"));
  objc_msgSend(v5, "addGestureRecognizer:withType:", self->_unpinSplitViewApplicationGestureRecognizer, 24);
  v29 = -[SBPanSystemGestureRecognizer initWithTarget:action:]([SBPanSystemGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleFluidGesture_);
  sceneResizePanGestureRecognizer = self->_sceneResizePanGestureRecognizer;
  self->_sceneResizePanGestureRecognizer = v29;

  -[SBPanSystemGestureRecognizer _setHysteresis:](self->_sceneResizePanGestureRecognizer, "_setHysteresis:", 10.0);
  -[SBPanSystemGestureRecognizer setAllowedTouchTypes:](self->_sceneResizePanGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CF148);
  -[SBPanSystemGestureRecognizer setDelegate:](self->_sceneResizePanGestureRecognizer, "setDelegate:", self);
  -[SBPanSystemGestureRecognizer setMaximumNumberOfTouches:](self->_sceneResizePanGestureRecognizer, "setMaximumNumberOfTouches:", 1);
  v31 = self->_sceneResizePanGestureRecognizer;
  _UIDragInteractionDefaultLiftDelay();
  -[SBPanSystemGestureRecognizer setMaximumPressDuration:](v31, "setMaximumPressDuration:");
  -[SBPanSystemGestureRecognizer setName:](self->_sceneResizePanGestureRecognizer, "setName:", CFSTR("_sceneResizePanGestureRecognizer"));
  objc_msgSend(v5, "addGestureRecognizer:withType:", self->_sceneResizePanGestureRecognizer, 22);
  v32 = -[SBFluidScrunchGestureRecognizer initWithTarget:action:]([SBFluidScrunchGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleFluidGesture_);
  indirectFloatingAppScrunchGestureRecognizer = self->_indirectFloatingAppScrunchGestureRecognizer;
  self->_indirectFloatingAppScrunchGestureRecognizer = v32;

  -[SBFluidScrunchGestureRecognizer setName:](self->_indirectFloatingAppScrunchGestureRecognizer, "setName:", CFSTR("floatingApplicationScrunchGestureRecognizer"));
  -[SBFluidScrunchGestureRecognizer setDelegate:](self->_indirectFloatingAppScrunchGestureRecognizer, "setDelegate:", self);
  -[SBFluidScrunchGestureRecognizer setAllowedTouchTypes:](self->_indirectFloatingAppScrunchGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CF160);
  objc_msgSend(v5, "addGestureRecognizer:withType:", self->_indirectFloatingAppScrunchGestureRecognizer, 19);
  v34 = -[SBIndirectPanGestureRecognizer initWithTarget:action:edges:]([SBIndirectPanGestureRecognizer alloc], "initWithTarget:action:edges:", self, sel__handleFluidGesture_, 10);
  indirectDismissFloatingApplicationGestureRecognizer = self->_indirectDismissFloatingApplicationGestureRecognizer;
  self->_indirectDismissFloatingApplicationGestureRecognizer = v34;

  -[SBIndirectPanGestureRecognizer setName:](self->_indirectDismissFloatingApplicationGestureRecognizer, "setName:", CFSTR("indirectDismissFloatingApplicationGestureRecognizer"));
  -[SBIndirectPanGestureRecognizer setDelegate:](self->_indirectDismissFloatingApplicationGestureRecognizer, "setDelegate:", self);
  -[SBIndirectPanGestureRecognizer setShouldRequireGestureToStartAtEdge:](self->_indirectDismissFloatingApplicationGestureRecognizer, "setShouldRequireGestureToStartAtEdge:", 1);
  -[SBIndirectPanGestureRecognizer setHysteresis:forInputType:](self->_indirectDismissFloatingApplicationGestureRecognizer, "setHysteresis:forInputType:", 0, 30.0);
  -[SBIndirectPanGestureRecognizer setHysteresis:forInputType:](self->_indirectDismissFloatingApplicationGestureRecognizer, "setHysteresis:forInputType:", 1, 10.0);
  -[SBIndirectPanGestureRecognizer setTranslationAdjustmentBlock:](self->_indirectDismissFloatingApplicationGestureRecognizer, "setTranslationAdjustmentBlock:", &__block_literal_global_84_1);
  objc_msgSend(v5, "addGestureRecognizer:withType:", self->_indirectDismissFloatingApplicationGestureRecognizer, 44);
  -[SBGrabberTongue edgePullGestureRecognizer](self->_deckGrabberTongue, "edgePullGestureRecognizer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "requireGestureRecognizerToFail:", self->_swipeUpFloatingAppGestureRecognizer);

  -[SBGrabberTongue edgePullGestureRecognizer](self->_deckGrabberTongue, "edgePullGestureRecognizer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gestureRecognizerOfType:shouldBeRequiredToFailByGestureRecognizer:", 120, v37);

  -[SBGrabberTongue edgePullGestureRecognizer](self->_deckGrabberTongue, "edgePullGestureRecognizer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gestureRecognizerOfType:shouldBeRequiredToFailByGestureRecognizer:", 119, v38);

  -[SBGrabberTongue edgePullGestureRecognizer](self->_deckGrabberTongue, "edgePullGestureRecognizer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gestureRecognizerOfType:shouldBeRequiredToFailByGestureRecognizer:", 105, v39);

  -[SBGrabberTongue edgePullGestureRecognizer](self->_deckGrabberTongue, "edgePullGestureRecognizer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gestureRecognizerOfType:shouldBeRequiredToFailByGestureRecognizer:", 104, v40);

  v41 = self->_moveFloatingApplicationGestureRecognizer;
  -[SBGrabberTongue edgePullGestureRecognizer](self->_deckGrabberTongue, "edgePullGestureRecognizer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherPanGestureRecognizer requireGestureRecognizerToFail:](v41, "requireGestureRecognizerToFail:", v42);

  -[SBFluidSwitcherPanGestureRecognizer requireGestureRecognizerToFail:](self->_moveFloatingApplicationGestureRecognizer, "requireGestureRecognizerToFail:", self->_swipeUpFloatingAppGestureRecognizer);
  -[SBFluidSwitcherPanGestureRecognizer requireGestureRecognizerToFail:](self->_moveFloatingApplicationGestureRecognizer, "requireGestureRecognizerToFail:", self->_pinFloatingApplicationGestureRecognizer);
  -[SBFluidSwitcherPanGestureRecognizer requireGestureRecognizerToFail:](self->_moveFloatingApplicationGestureRecognizer, "requireGestureRecognizerToFail:", self->_unpinSplitViewApplicationGestureRecognizer);
  -[SBFluidSwitcherPanGestureRecognizer requireGestureRecognizerToFail:](self->_unpinSplitViewApplicationGestureRecognizer, "requireGestureRecognizerToFail:", self->_pinFloatingApplicationGestureRecognizer);
  v43 = self->_unpinSplitViewApplicationGestureRecognizer;
  -[SBGrabberTongue edgePullGestureRecognizer](self->_deckGrabberTongue, "edgePullGestureRecognizer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherPanGestureRecognizer requireGestureRecognizerToFail:](v43, "requireGestureRecognizerToFail:", v44);

  -[SBFluidScrunchGestureRecognizer requireGestureRecognizerToFail:](self->_fluidScrunchGestureRecognizer, "requireGestureRecognizerToFail:", self->_indirectFloatingAppScrunchGestureRecognizer);
}

uint64_t __76__SBFluidSwitcherGestureManager__setUpFloatingApplicationGestureRecognizers__block_invoke()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
}

- (void)_tearDownFloatingApplicationGestureRecognizers
{
  void *v3;
  void *v4;
  SBGrabberTongue *rightEdgeFloatingAppGrabberTongue;
  SBGrabberTongue *leftEdgeFloatingAppGrabberTongue;
  SBFluidSwitcherPanGestureRecognizer *swipeUpFloatingAppGestureRecognizer;
  SBFluidSwitcherPanGestureRecognizer *moveFloatingApplicationGestureRecognizer;
  SBFluidSwitcherPanGestureRecognizer *pinFloatingApplicationGestureRecognizer;
  SBFluidSwitcherPanGestureRecognizer *unpinSplitViewApplicationGestureRecognizer;
  SBPanSystemGestureRecognizer *sceneResizePanGestureRecognizer;
  SBFluidScrunchGestureRecognizer *indirectFloatingAppScrunchGestureRecognizer;
  SBIndirectPanGestureRecognizer *indirectDismissFloatingApplicationGestureRecognizer;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemGestureManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBGrabberTongue uninstall](self->_rightEdgeFloatingAppGrabberTongue, "uninstall");
  -[SBGrabberTongue invalidate](self->_rightEdgeFloatingAppGrabberTongue, "invalidate");
  rightEdgeFloatingAppGrabberTongue = self->_rightEdgeFloatingAppGrabberTongue;
  self->_rightEdgeFloatingAppGrabberTongue = 0;

  -[SBGrabberTongue uninstall](self->_leftEdgeFloatingAppGrabberTongue, "uninstall");
  -[SBGrabberTongue invalidate](self->_leftEdgeFloatingAppGrabberTongue, "invalidate");
  leftEdgeFloatingAppGrabberTongue = self->_leftEdgeFloatingAppGrabberTongue;
  self->_leftEdgeFloatingAppGrabberTongue = 0;

  objc_msgSend(v4, "removeGestureRecognizer:", self->_swipeUpFloatingAppGestureRecognizer);
  -[SBFluidSwitcherPanGestureRecognizer setDelegate:](self->_swipeUpFloatingAppGestureRecognizer, "setDelegate:", 0);
  swipeUpFloatingAppGestureRecognizer = self->_swipeUpFloatingAppGestureRecognizer;
  self->_swipeUpFloatingAppGestureRecognizer = 0;

  objc_msgSend(v4, "removeGestureRecognizer:", self->_moveFloatingApplicationGestureRecognizer);
  -[SBFluidSwitcherPanGestureRecognizer setDelegate:](self->_moveFloatingApplicationGestureRecognizer, "setDelegate:", 0);
  moveFloatingApplicationGestureRecognizer = self->_moveFloatingApplicationGestureRecognizer;
  self->_moveFloatingApplicationGestureRecognizer = 0;

  objc_msgSend(v4, "removeGestureRecognizer:", self->_pinFloatingApplicationGestureRecognizer);
  -[SBFluidSwitcherPanGestureRecognizer setDelegate:](self->_pinFloatingApplicationGestureRecognizer, "setDelegate:", 0);
  pinFloatingApplicationGestureRecognizer = self->_pinFloatingApplicationGestureRecognizer;
  self->_pinFloatingApplicationGestureRecognizer = 0;

  objc_msgSend(v4, "removeGestureRecognizer:", self->_unpinSplitViewApplicationGestureRecognizer);
  -[SBFluidSwitcherPanGestureRecognizer setDelegate:](self->_unpinSplitViewApplicationGestureRecognizer, "setDelegate:", 0);
  unpinSplitViewApplicationGestureRecognizer = self->_unpinSplitViewApplicationGestureRecognizer;
  self->_unpinSplitViewApplicationGestureRecognizer = 0;

  objc_msgSend(v4, "removeGestureRecognizer:", self->_sceneResizePanGestureRecognizer);
  -[SBPanSystemGestureRecognizer setDelegate:](self->_sceneResizePanGestureRecognizer, "setDelegate:", 0);
  sceneResizePanGestureRecognizer = self->_sceneResizePanGestureRecognizer;
  self->_sceneResizePanGestureRecognizer = 0;

  objc_msgSend(v4, "removeGestureRecognizer:", self->_indirectFloatingAppScrunchGestureRecognizer);
  -[SBFluidScrunchGestureRecognizer setDelegate:](self->_indirectFloatingAppScrunchGestureRecognizer, "setDelegate:", 0);
  indirectFloatingAppScrunchGestureRecognizer = self->_indirectFloatingAppScrunchGestureRecognizer;
  self->_indirectFloatingAppScrunchGestureRecognizer = 0;

  objc_msgSend(v4, "removeGestureRecognizer:", self->_indirectDismissFloatingApplicationGestureRecognizer);
  -[SBIndirectPanGestureRecognizer setDelegate:](self->_indirectDismissFloatingApplicationGestureRecognizer, "setDelegate:", 0);
  indirectDismissFloatingApplicationGestureRecognizer = self->_indirectDismissFloatingApplicationGestureRecognizer;
  self->_indirectDismissFloatingApplicationGestureRecognizer = 0;

}

- (void)_updateChamoisGestureRecognizerPresenceForWindowManagementStyle:(unint64_t)a3
{
  SBFluidSwitcherPanGestureRecognizer *liveWindowResizeGestureRecognizer;

  liveWindowResizeGestureRecognizer = self->_liveWindowResizeGestureRecognizer;
  if (a3 != 2 || liveWindowResizeGestureRecognizer)
  {
    if (a3 != 2)
    {
      if (liveWindowResizeGestureRecognizer)
        -[SBFluidSwitcherGestureManager _tearDownChamoisGestureRecognizers](self, "_tearDownChamoisGestureRecognizers");
    }
  }
  else
  {
    -[SBFluidSwitcherGestureManager _setUpChamoisGestureRecognizers](self, "_setUpChamoisGestureRecognizers");
  }
}

- (void)_setUpChamoisGestureRecognizers
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  SBFluidSwitcherPanGestureRecognizer *v7;
  SBFluidSwitcherPanGestureRecognizer *liveWindowResizeGestureRecognizer;
  void *v9;
  UIHoverGestureRecognizer *v10;
  UIHoverGestureRecognizer *hoverGestureRecognizer;
  unint64_t v12;
  SBGrabberTongue *v13;
  SBGrabberTongue *continuousExposeStripRevealGrabberTongue;
  SBGrabberTongue *v15;
  void *v16;
  SBIndirectPanGestureRecognizer *v17;
  SBIndirectPanGestureRecognizer *indirectContinuousExposeStripOverflowGestureRecognizer;
  SBIndirectPanGestureRecognizer *v19;
  SBIndirectPanGestureRecognizer *v20;
  void *v21;
  SBFluidSwitcherPanGestureRecognizer *v22;
  SBFluidSwitcherPanGestureRecognizer *dragContinuousExposeStripOverflowGestureRecognizer;
  _UIPassthroughTapGestureRecognizer *v24;
  _UIPassthroughTapGestureRecognizer *tapToBringItemContainerForwardGestureRecognizer;
  UILongPressGestureRecognizer *v26;
  UILongPressGestureRecognizer *clickDownToBringItemContainerForwardGestureRecognizer;
  UIGestureRecognizer *v28;
  UIGestureRecognizer *windowMoveClientGateRelationshipGestureRecognizer;
  uint64_t v30;
  uint64_t v31;
  double (*v32)(uint64_t, double, double, double, double, double);
  void *v33;
  id v34;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemGestureManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained((id *)&self->_switcherContentController);
  v7 = -[SBFluidSwitcherPanGestureRecognizer initWithTarget:action:]([SBFluidSwitcherPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleFluidGesture_);
  liveWindowResizeGestureRecognizer = self->_liveWindowResizeGestureRecognizer;
  self->_liveWindowResizeGestureRecognizer = v7;

  -[SBFluidSwitcherPanGestureRecognizer setAllowedTouchTypes:](self->_liveWindowResizeGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CF178);
  -[SBFluidSwitcherPanGestureRecognizer _setHysteresis:](self->_liveWindowResizeGestureRecognizer, "_setHysteresis:", 0.0);
  -[SBFluidSwitcherPanGestureRecognizer setDelegate:](self->_liveWindowResizeGestureRecognizer, "setDelegate:", self);
  -[SBFluidSwitcherPanGestureRecognizer setMaximumNumberOfTouches:](self->_liveWindowResizeGestureRecognizer, "setMaximumNumberOfTouches:", 1);
  -[SBFluidSwitcherPanGestureRecognizer setName:](self->_liveWindowResizeGestureRecognizer, "setName:", CFSTR("_liveWindowResizeGestureRecognizer"));
  -[SBGrabberTongue edgePullGestureRecognizer](self->_deckGrabberTongue, "edgePullGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requireGestureRecognizerToFail:", self->_liveWindowResizeGestureRecognizer);

  -[SBFluidSwitcherPanGestureRecognizer requireGestureRecognizerToFail:](self->_deckInSwitcherPanGestureRecognizer, "requireGestureRecognizerToFail:", self->_liveWindowResizeGestureRecognizer);
  objc_msgSend(v5, "addGestureRecognizer:withType:", self->_liveWindowResizeGestureRecognizer, 37);
  v10 = (UIHoverGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", self, sel__handleHoverGesture_);
  hoverGestureRecognizer = self->_hoverGestureRecognizer;
  self->_hoverGestureRecognizer = v10;

  -[UIHoverGestureRecognizer setCancelsTouchesInView:](self->_hoverGestureRecognizer, "setCancelsTouchesInView:", 0);
  -[UIHoverGestureRecognizer setDelegate:](self->_hoverGestureRecognizer, "setDelegate:", self);
  objc_msgSend(v5, "addGestureRecognizer:withType:", self->_hoverGestureRecognizer, 53);
  v12 = -[SBFluidSwitcherGestureManager _continuousExposeStripEdge](self, "_continuousExposeStripEdge");
  v13 = -[SBGrabberTongue initWithDelegate:edge:type:windowScene:]([SBGrabberTongue alloc], "initWithDelegate:edge:type:windowScene:", self, v12, 57, v4);
  continuousExposeStripRevealGrabberTongue = self->_continuousExposeStripRevealGrabberTongue;
  self->_continuousExposeStripRevealGrabberTongue = v13;

  -[SBGrabberTongue setName:](self->_continuousExposeStripRevealGrabberTongue, "setName:", CFSTR("ContinuousExposeStripRevealGrabberTongue"));
  v15 = self->_continuousExposeStripRevealGrabberTongue;
  objc_msgSend(v6, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBGrabberTongue installInView:withColorStyle:](v15, "installInView:withColorStyle:", v16, 0);

  v17 = -[SBIndirectPanGestureRecognizer initWithTarget:action:edges:]([SBIndirectPanGestureRecognizer alloc], "initWithTarget:action:edges:", self, sel__handleFluidGesture_, v12);
  indirectContinuousExposeStripOverflowGestureRecognizer = self->_indirectContinuousExposeStripOverflowGestureRecognizer;
  self->_indirectContinuousExposeStripOverflowGestureRecognizer = v17;

  -[SBIndirectPanGestureRecognizer setShouldRequireGestureToStartAtEdge:](self->_indirectContinuousExposeStripOverflowGestureRecognizer, "setShouldRequireGestureToStartAtEdge:", 1);
  -[SBIndirectPanGestureRecognizer setPausedUntilTouchedUpOrMovedAwayFromEdge:](self->_indirectContinuousExposeStripOverflowGestureRecognizer, "setPausedUntilTouchedUpOrMovedAwayFromEdge:", 1);
  -[SBIndirectPanGestureRecognizer setName:](self->_indirectContinuousExposeStripOverflowGestureRecognizer, "setName:", CFSTR("_indirectContinuousExposeStripOverflowGestureRecognizer"));
  -[SBIndirectPanGestureRecognizer setDelegate:](self->_indirectContinuousExposeStripOverflowGestureRecognizer, "setDelegate:", self);
  -[SBIndirectPanGestureRecognizer setHysteresis:forInputType:](self->_indirectContinuousExposeStripOverflowGestureRecognizer, "setHysteresis:forInputType:", 0, 30.0);
  -[SBIndirectPanGestureRecognizer setHysteresis:forInputType:](self->_indirectContinuousExposeStripOverflowGestureRecognizer, "setHysteresis:forInputType:", 1, 10.0);
  objc_initWeak(&location, v6);
  v19 = self->_indirectContinuousExposeStripOverflowGestureRecognizer;
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __64__SBFluidSwitcherGestureManager__setUpChamoisGestureRecognizers__block_invoke;
  v33 = &unk_1E8EBD938;
  objc_copyWeak(&v34, &location);
  -[SBIndirectPanGestureRecognizer setTranslationAdjustmentBlock:](v19, "setTranslationAdjustmentBlock:", &v30);
  v20 = self->_indirectContinuousExposeStripOverflowGestureRecognizer;
  -[SBGrabberTongue indirectEdgePullGestureRecognizer](self->_continuousExposeStripRevealGrabberTongue, "indirectEdgePullGestureRecognizer", v30, v31, v32, v33);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIndirectPanGestureRecognizer requireGestureRecognizerToFail:](v20, "requireGestureRecognizerToFail:", v21);

  objc_msgSend(v5, "addGestureRecognizer:withType:", self->_indirectContinuousExposeStripOverflowGestureRecognizer, 55);
  v22 = -[SBFluidSwitcherPanGestureRecognizer initWithTarget:action:]([SBFluidSwitcherPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleFluidGesture_);
  dragContinuousExposeStripOverflowGestureRecognizer = self->_dragContinuousExposeStripOverflowGestureRecognizer;
  self->_dragContinuousExposeStripOverflowGestureRecognizer = v22;

  -[SBFluidSwitcherPanGestureRecognizer setInstalledAsSystemGesture:](self->_dragContinuousExposeStripOverflowGestureRecognizer, "setInstalledAsSystemGesture:", 1);
  -[SBFluidSwitcherPanGestureRecognizer setSwitcherViewController:](self->_dragContinuousExposeStripOverflowGestureRecognizer, "setSwitcherViewController:", v6);
  -[SBFluidSwitcherPanGestureRecognizer _setHysteresis:](self->_dragContinuousExposeStripOverflowGestureRecognizer, "_setHysteresis:", 10.0);
  -[SBFluidSwitcherPanGestureRecognizer setAllowedTouchTypes:](self->_dragContinuousExposeStripOverflowGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CF190);
  -[SBFluidSwitcherPanGestureRecognizer setDelegate:](self->_dragContinuousExposeStripOverflowGestureRecognizer, "setDelegate:", self);
  -[SBFluidSwitcherPanGestureRecognizer setMaximumNumberOfTouches:](self->_dragContinuousExposeStripOverflowGestureRecognizer, "setMaximumNumberOfTouches:", 1);
  -[SBFluidSwitcherPanGestureRecognizer setName:](self->_dragContinuousExposeStripOverflowGestureRecognizer, "setName:", CFSTR("_dragContinuousExposeStripOverflowGestureRecognizer"));
  -[SBFluidSwitcherPanGestureRecognizer requireGestureRecognizerToFail:](self->_dragContinuousExposeStripOverflowGestureRecognizer, "requireGestureRecognizerToFail:", self->_liveWindowResizeGestureRecognizer);
  objc_msgSend(v5, "addGestureRecognizer:withType:", self->_dragContinuousExposeStripOverflowGestureRecognizer, 56);
  v24 = (_UIPassthroughTapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAE40]), "initWithTarget:action:", self, sel__handleTapToBringItemContainerForward_);
  tapToBringItemContainerForwardGestureRecognizer = self->_tapToBringItemContainerForwardGestureRecognizer;
  self->_tapToBringItemContainerForwardGestureRecognizer = v24;

  -[_UIPassthroughTapGestureRecognizer setDelegate:](self->_tapToBringItemContainerForwardGestureRecognizer, "setDelegate:", self);
  -[_UIPassthroughTapGestureRecognizer setAllowedTouchTypes:](self->_tapToBringItemContainerForwardGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CF1A8);
  -[_UIPassthroughTapGestureRecognizer setName:](self->_tapToBringItemContainerForwardGestureRecognizer, "setName:", CFSTR("tapToBringItemContainerForwardGestureRecognizer"));
  objc_msgSend(v5, "addGestureRecognizer:withType:", self->_tapToBringItemContainerForwardGestureRecognizer, 20);
  v26 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", self, sel__handleClickDownToBringItemContainerForward_);
  clickDownToBringItemContainerForwardGestureRecognizer = self->_clickDownToBringItemContainerForwardGestureRecognizer;
  self->_clickDownToBringItemContainerForwardGestureRecognizer = v26;

  -[UILongPressGestureRecognizer setDelegate:](self->_clickDownToBringItemContainerForwardGestureRecognizer, "setDelegate:", self);
  -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_clickDownToBringItemContainerForwardGestureRecognizer, "setMinimumPressDuration:", 0.0);
  -[UILongPressGestureRecognizer setAllowedTouchTypes:](self->_clickDownToBringItemContainerForwardGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CF1C0);
  -[UILongPressGestureRecognizer setName:](self->_clickDownToBringItemContainerForwardGestureRecognizer, "setName:", CFSTR("clickDownToBringItemContainerForwardGestureRecognizer"));
  objc_msgSend(v5, "addGestureRecognizer:withType:", self->_clickDownToBringItemContainerForwardGestureRecognizer, 21);
  objc_msgSend(MEMORY[0x1E0CEACB8], "hostGestureRecognizerForFailureRelationshipsWithIdentifier:", *MEMORY[0x1E0CEC350]);
  v28 = (UIGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  windowMoveClientGateRelationshipGestureRecognizer = self->_windowMoveClientGateRelationshipGestureRecognizer;
  self->_windowMoveClientGateRelationshipGestureRecognizer = v28;

  -[UIGestureRecognizer setName:](self->_windowMoveClientGateRelationshipGestureRecognizer, "setName:", CFSTR("_windowMoveClientGateRelationshipGestureRecognizer"));
  objc_msgSend(v5, "addGestureRecognizer:withType:", self->_windowMoveClientGateRelationshipGestureRecognizer, 31);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

}

double __64__SBFluidSwitcherGestureManager__setUpChamoisGestureRecognizers__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  id WeakRetained;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;

    v14 = a2 - fabs(a3);
    if (a6 >= v13 * 0.5)
    {
      a2 = fmax(v14, 0.0);
    }
    else if (v14 <= 0.0)
    {
      a2 = v14;
    }
    else
    {
      a2 = 0.0;
    }
  }

  return a2;
}

- (void)_tearDownChamoisGestureRecognizers
{
  void *v3;
  void *v4;
  SBFluidSwitcherPanGestureRecognizer *liveWindowResizeGestureRecognizer;
  UIHoverGestureRecognizer *hoverGestureRecognizer;
  SBGrabberTongue *continuousExposeStripRevealGrabberTongue;
  SBIndirectPanGestureRecognizer *indirectContinuousExposeStripOverflowGestureRecognizer;
  SBFluidSwitcherPanGestureRecognizer *dragContinuousExposeStripOverflowGestureRecognizer;
  _UIPassthroughTapGestureRecognizer *tapToBringItemContainerForwardGestureRecognizer;
  UILongPressGestureRecognizer *clickDownToBringItemContainerForwardGestureRecognizer;
  UIGestureRecognizer *windowMoveClientGateRelationshipGestureRecognizer;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemGestureManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGestureRecognizer:", self->_liveWindowResizeGestureRecognizer);
  -[SBFluidSwitcherPanGestureRecognizer setDelegate:](self->_liveWindowResizeGestureRecognizer, "setDelegate:", 0);
  liveWindowResizeGestureRecognizer = self->_liveWindowResizeGestureRecognizer;
  self->_liveWindowResizeGestureRecognizer = 0;

  objc_msgSend(v4, "removeGestureRecognizer:", self->_hoverGestureRecognizer);
  -[UIHoverGestureRecognizer setDelegate:](self->_hoverGestureRecognizer, "setDelegate:", 0);
  hoverGestureRecognizer = self->_hoverGestureRecognizer;
  self->_hoverGestureRecognizer = 0;

  -[SBGrabberTongue uninstall](self->_continuousExposeStripRevealGrabberTongue, "uninstall");
  -[SBGrabberTongue invalidate](self->_continuousExposeStripRevealGrabberTongue, "invalidate");
  continuousExposeStripRevealGrabberTongue = self->_continuousExposeStripRevealGrabberTongue;
  self->_continuousExposeStripRevealGrabberTongue = 0;

  objc_msgSend(v4, "removeGestureRecognizer:", self->_indirectContinuousExposeStripOverflowGestureRecognizer);
  -[SBIndirectPanGestureRecognizer setDelegate:](self->_indirectContinuousExposeStripOverflowGestureRecognizer, "setDelegate:", 0);
  indirectContinuousExposeStripOverflowGestureRecognizer = self->_indirectContinuousExposeStripOverflowGestureRecognizer;
  self->_indirectContinuousExposeStripOverflowGestureRecognizer = 0;

  objc_msgSend(v4, "removeGestureRecognizer:", self->_dragContinuousExposeStripOverflowGestureRecognizer);
  -[SBFluidSwitcherPanGestureRecognizer setDelegate:](self->_dragContinuousExposeStripOverflowGestureRecognizer, "setDelegate:", 0);
  dragContinuousExposeStripOverflowGestureRecognizer = self->_dragContinuousExposeStripOverflowGestureRecognizer;
  self->_dragContinuousExposeStripOverflowGestureRecognizer = 0;

  objc_msgSend(v4, "removeGestureRecognizer:", self->_tapToBringItemContainerForwardGestureRecognizer);
  -[_UIPassthroughTapGestureRecognizer setDelegate:](self->_tapToBringItemContainerForwardGestureRecognizer, "setDelegate:", 0);
  tapToBringItemContainerForwardGestureRecognizer = self->_tapToBringItemContainerForwardGestureRecognizer;
  self->_tapToBringItemContainerForwardGestureRecognizer = 0;

  objc_msgSend(v4, "removeGestureRecognizer:", self->_clickDownToBringItemContainerForwardGestureRecognizer);
  -[UILongPressGestureRecognizer setDelegate:](self->_clickDownToBringItemContainerForwardGestureRecognizer, "setDelegate:", 0);
  clickDownToBringItemContainerForwardGestureRecognizer = self->_clickDownToBringItemContainerForwardGestureRecognizer;
  self->_clickDownToBringItemContainerForwardGestureRecognizer = 0;

  objc_msgSend(v4, "removeGestureRecognizer:", self->_windowMoveClientGateRelationshipGestureRecognizer);
  windowMoveClientGateRelationshipGestureRecognizer = self->_windowMoveClientGateRelationshipGestureRecognizer;
  self->_windowMoveClientGateRelationshipGestureRecognizer = 0;

}

- (void)_updateDeckSwitcherInSwitcherGesturePresence
{
  SBFluidSwitcherPanGestureRecognizer *v3;
  SBFluidSwitcherPanGestureRecognizer *deckInSwitcherPanGestureRecognizer;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  if (-[SBHomeGestureSettings isHomeGestureEnabled](self->_homeGestureSettings, "isHomeGestureEnabled")
    && -[SBAppSwitcherSettings effectiveSwitcherStyle](self->_appSwitcherSettings, "effectiveSwitcherStyle") == 1)
  {
    if (!self->_deckInSwitcherPanGestureRecognizer)
    {
      v3 = -[SBFluidSwitcherPanGestureRecognizer initWithTarget:action:]([SBFluidSwitcherPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleDeckSwitcherPanGesture_);
      deckInSwitcherPanGestureRecognizer = self->_deckInSwitcherPanGestureRecognizer;
      self->_deckInSwitcherPanGestureRecognizer = v3;

      -[SBFluidSwitcherPanGestureRecognizer setName:](self->_deckInSwitcherPanGestureRecognizer, "setName:", CFSTR("deckInSwitcherPan"));
      -[SBFluidSwitcherPanGestureRecognizer setSwitcherViewController:](self->_deckInSwitcherPanGestureRecognizer, "setSwitcherViewController:", WeakRetained);
      -[SBFluidSwitcherPanGestureRecognizer setAllowedTouchTypes:](self->_deckInSwitcherPanGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CF1D8);
      -[SBFluidSwitcherPanGestureRecognizer setDelegate:](self->_deckInSwitcherPanGestureRecognizer, "setDelegate:", self);
      objc_msgSend(WeakRetained, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addGestureRecognizer:", self->_deckInSwitcherPanGestureRecognizer);

      -[SBFluidSwitcherPanGestureRecognizer _setRequiresSystemGesturesToFail:](self->_deckInSwitcherPanGestureRecognizer, "_setRequiresSystemGesturesToFail:", 0);
      objc_msgSend(WeakRetained, "scrollView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "panGestureRecognizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "requireGestureRecognizerToFail:", self->_deckInSwitcherPanGestureRecognizer);

LABEL_7:
    }
  }
  else if (self->_deckInSwitcherPanGestureRecognizer)
  {
    objc_msgSend(WeakRetained, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeGestureRecognizer:", self->_deckInSwitcherPanGestureRecognizer);

    v6 = self->_deckInSwitcherPanGestureRecognizer;
    self->_deckInSwitcherPanGestureRecognizer = 0;
    goto LABEL_7;
  }

}

- (void)_updateSwitcherBottomEdgeGesturePresence
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  SBGrabberTongue *deckGrabberTongue;
  SBGrabberTongue *v8;
  SBGrabberTongue *v9;
  SBGrabberTongue *v10;
  void *v11;
  SBFluidSwitcherPanGestureRecognizer *v12;
  SBFluidSwitcherPanGestureRecognizer *clickAndDragHomeGestureRecognizer;
  SBGrabberTongue *v14;
  SBFluidSwitcherPanGestureRecognizer *v15;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  v3 = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "systemGestureManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBHomeGestureSettings isHomeGestureEnabled](self->_homeGestureSettings, "isHomeGestureEnabled");
  deckGrabberTongue = self->_deckGrabberTongue;
  if (v6)
  {
    if (!deckGrabberTongue)
    {
      self->_usesHomeAffordanceRulesForGrabberTongue = SBFEffectiveHomeButtonType() == 2;
      v8 = -[SBGrabberTongue initWithDelegate:edge:type:windowScene:]([SBGrabberTongue alloc], "initWithDelegate:edge:type:windowScene:", self, 4, 45, v4);
      v9 = self->_deckGrabberTongue;
      self->_deckGrabberTongue = v8;

      -[SBGrabberTongue setName:](self->_deckGrabberTongue, "setName:", CFSTR("DeckGrabberTongue"));
      v10 = self->_deckGrabberTongue;
      objc_msgSend(WeakRetained, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBGrabberTongue installInView:withColorStyle:](v10, "installInView:withColorStyle:", v11, 0);

      v12 = -[SBFluidSwitcherPanGestureRecognizer initWithTarget:action:]([SBFluidSwitcherPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleClickAndDragHomeGesture_);
      clickAndDragHomeGestureRecognizer = self->_clickAndDragHomeGestureRecognizer;
      self->_clickAndDragHomeGestureRecognizer = v12;

      -[SBFluidSwitcherPanGestureRecognizer setSwitcherViewController:](self->_clickAndDragHomeGestureRecognizer, "setSwitcherViewController:", WeakRetained);
      -[SBFluidSwitcherPanGestureRecognizer setInstalledAsSystemGesture:](self->_clickAndDragHomeGestureRecognizer, "setInstalledAsSystemGesture:", 1);
      -[SBFluidSwitcherPanGestureRecognizer setDelegate:](self->_clickAndDragHomeGestureRecognizer, "setDelegate:", self);
      -[SBFluidSwitcherPanGestureRecognizer setAllowedTouchTypes:](self->_clickAndDragHomeGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CF1F0);
      objc_msgSend(v5, "addGestureRecognizer:withType:", self->_clickAndDragHomeGestureRecognizer, 48);
    }
  }
  else
  {
    if (deckGrabberTongue)
    {
      -[SBGrabberTongue invalidate](deckGrabberTongue, "invalidate");
      v14 = self->_deckGrabberTongue;
      self->_deckGrabberTongue = 0;

    }
    if (self->_clickAndDragHomeGestureRecognizer)
    {
      objc_msgSend(v5, "removeGestureRecognizer:");
      v15 = self->_clickAndDragHomeGestureRecognizer;
      self->_clickAndDragHomeGestureRecognizer = 0;

    }
  }

}

- (void)invalidate
{
  id WeakRetained;
  void *v4;
  SBFZStackParticipant *zStackParticipant;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(WeakRetained, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeInteraction:", self->_homeAffordanceInteraction);

  -[SBLayoutStateTransitionCoordinator removeObserver:](self->_layoutStateTransitionCoordinator, "removeObserver:", self);
  -[SBFZStackParticipant invalidate](self->_zStackParticipant, "invalidate");
  zStackParticipant = self->_zStackParticipant;
  self->_zStackParticipant = 0;

  -[SBGrabberTongue invalidate](self->_deckGrabberTongue, "invalidate");
  v6 = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemGestureManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "removeGestureRecognizer:", self->_fluidScrunchGestureRecognizer);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB008], 0);

  -[SBGrabberTongue invalidate](self->_rightEdgeFloatingAppGrabberTongue, "invalidate");
  -[SBGrabberTongue invalidate](self->_leftEdgeFloatingAppGrabberTongue, "invalidate");
  -[SBGrabberTongue invalidate](self->_deckGrabberTongue, "invalidate");
  -[SBGrabberTongue invalidate](self->_continuousExposeStripRevealGrabberTongue, "invalidate");
  objc_msgSend((id)SBApp, "bannerManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeTransitionObserver:", self);

}

- (void)failMultitaskingGesturesForReason:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogSystemGesture();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Failing multitasking gestures for reason: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[SBFluidScrunchGestureRecognizer setEnabled:](self->_fluidScrunchGestureRecognizer, "setEnabled:", 0);
  -[SBFluidScrunchGestureRecognizer setEnabled:](self->_fluidScrunchGestureRecognizer, "setEnabled:", 1);
  -[SBFluidSwitcherPanGestureRecognizer setEnabled:](self->_unpinSplitViewApplicationGestureRecognizer, "setEnabled:", 0);
  -[SBFluidSwitcherPanGestureRecognizer setEnabled:](self->_unpinSplitViewApplicationGestureRecognizer, "setEnabled:", 1);

}

- (void)setActiveGestureTransaction:(id)a3
{
  SBFluidSwitcherGestureWorkspaceTransaction *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (SBFluidSwitcherGestureWorkspaceTransaction *)a3;
  if (self->_activeGestureTransaction != v5)
  {
    objc_storeStrong((id *)&self->_activeGestureTransaction, a3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_currentHomeGrabberViews;
    v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "updateStyle", (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)handleTransitionRequestForGestureUpdate:(id)a3
{
  -[SBFluidSwitcherGestureWorkspaceTransaction handleTransitionRequestForGestureUpdate:fromGestureManager:](self->_activeGestureTransaction, "handleTransitionRequestForGestureUpdate:fromGestureManager:", a3, self);
}

- (void)handleTransitionRequestForGestureComplete:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "appLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBAppLayout homeScreenAppLayout](SBAppLayout, "homeScreenAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
    -[SBFluidSwitcherGestureManager _clearSystemApertureZStackPolicyAssistantSuppression](self, "_clearSystemApertureZStackPolicyAssistantSuppression");
  -[SBFluidSwitcherGestureWorkspaceTransaction handleTransitionRequestForGestureComplete:fromGestureManager:](self->_activeGestureTransaction, "handleTransitionRequestForGestureComplete:fromGestureManager:", v7, self);

}

- (void)_handleDeckSwitcherPanGesture:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "state");
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 == 2)
    {
      -[SBFluidSwitcherGestureManager _handleSwitcherPanGestureChanged:](self, "_handleSwitcherPanGestureChanged:", v7);
    }
    else
    {
      v5 = v4 == 1;
      v6 = v7;
      if (!v5)
        goto LABEL_9;
      -[SBFluidSwitcherGestureManager _handleSwitcherPanGestureBegan:](self, "_handleSwitcherPanGestureBegan:", v7);
    }
  }
  else
  {
    -[SBFluidSwitcherGestureManager _handleSwitcherPanGestureEnded:](self, "_handleSwitcherPanGestureEnded:", v7);
  }
  v6 = v7;
LABEL_9:

}

- (void)_handleSwitcherPanGestureBegan:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;

  v4 = a3;
  SBLogSystemGestureAppSwitcher();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBFluidSwitcherGestureManager _handleSwitcherPanGestureBegan:].cold.1((uint64_t)v4, self);

  kdebug_trace();
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reachabilityGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setEnabled:", 0);
  objc_msgSend(v7, "setEnabled:", 1);
  if (-[SBFluidSwitcherGestureManager _isTransactionRunningForGestureRecognizer:](self, "_isTransactionRunningForGestureRecognizer:", v4))
  {
    -[SBFluidSwitcherGestureManager activeGestureTransaction](self, "activeGestureTransaction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[SBFluidSwitcherGestureManager activeGestureTransaction](self, "activeGestureTransaction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "transitionRequest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
      objc_msgSend(WeakRetained, "_configureTransitionRequestForGestureBegin:", v10);

    }
  }
  else
  {
    -[SBFluidSwitcherGestureManager _handleSwitcherGestureBegan:](self, "_handleSwitcherGestureBegan:", v4);
  }
  if (-[SBFluidSwitcherGestureManager _isTransactionRunningForGestureRecognizer:](self, "_isTransactionRunningForGestureRecognizer:", v4))
  {
    -[SBFluidSwitcherGestureManager activeGestureTransaction](self, "activeGestureTransaction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "systemGestureStateChanged:", v4);

  }
}

- (void)_handleSwitcherPanGestureChanged:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;

  v6 = a3;
  if (-[SBFluidSwitcherGestureManager _isTransactionRunningForGestureRecognizer:](self, "_isTransactionRunningForGestureRecognizer:"))
  {
    -[SBFluidSwitcherGestureManager activeGestureTransaction](self, "activeGestureTransaction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_shouldRubberbandGrabberViewForReduceMotion)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
      self->_shouldRubberbandGrabberViewForReduceMotion = objc_msgSend(WeakRetained, "shouldRubberbandFullScreenHomeGrabberView");

    }
    objc_msgSend(v4, "systemGestureStateChanged:", v6);

  }
  if (self->_shouldRubberbandGrabberViewForReduceMotion)
    -[SBFluidSwitcherGestureManager _updateHomeGrabberViewsWithAnimationMode:](self, "_updateHomeGrabberViewsWithAnimationMode:", 5);

}

- (void)_handleSwitcherPanGestureEnded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  SBLogSystemGestureAppSwitcher();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBFluidSwitcherGestureManager _handleSwitcherPanGestureEnded:].cold.1((uint64_t)v4, self);

  if (objc_msgSend(v4, "state") == 3)
    kdebug_trace();
  if (-[SBFluidSwitcherGestureManager _isTransactionRunningForGestureRecognizer:](self, "_isTransactionRunningForGestureRecognizer:", v4))
  {
    -[SBFluidSwitcherGestureManager activeGestureTransaction](self, "activeGestureTransaction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemGestureStateChanged:", v4);
  }
  else
  {
    if (objc_msgSend(v4, "state") == 4)
      goto LABEL_10;
    objc_msgSend(v4, "setEnabled:", 0);
    objc_msgSend(v4, "setEnabled:", 1);
    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__SBFluidSwitcherGestureManager__handleSwitcherPanGestureEnded___block_invoke;
    v8[3] = &unk_1E8EA2060;
    v9 = v4;
    objc_msgSend(v7, "logBlock:", v8);

    v6 = v9;
  }

LABEL_10:
  if (self->_shouldRubberbandGrabberViewForReduceMotion)
  {
    self->_shouldRubberbandGrabberViewForReduceMotion = 0;
    -[SBFluidSwitcherGestureManager _updateHomeGrabberViewsWithAnimationMode:](self, "_updateHomeGrabberViewsWithAnimationMode:", 5);
  }

}

id __64__SBFluidSwitcherGestureManager__handleSwitcherPanGestureEnded___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = CFSTR("[SBFluidSwitcherGestureManager _handleSwitcherPanGestureEnded:]");
  v9[0] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v9[1] = CFSTR("name");
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E8EC7EC0;
  if (v3)
    v5 = (const __CFString *)v3;
  v9[2] = CFSTR("failureReason");
  v10[1] = v5;
  v10[2] = CFSTR("GestureCancelledByOverlappingExistingTransaction");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_handleScrunchGesture:(id)a3
{
  id v4;
  const __CFString *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  if (objc_msgSend(v4, "state") != 1)
  {
    if (objc_msgSend(v4, "state") == 3)
      kdebug_trace();
    goto LABEL_7;
  }
  kdebug_trace();
  if (objc_msgSend(v4, "recognizedTouchType"))
    goto LABEL_7;
  if (self->_multitaskingGesturesRequireEducation)
  {
    v5 = CFSTR("requires education");
    goto LABEL_11;
  }
  if (!self->_multitaskingGesturesUserPreferenceIsOff)
  {
LABEL_7:
    -[SBFluidSwitcherGestureManager _handleFluidGesture:](self, "_handleFluidGesture:", v4);
    goto LABEL_8;
  }
  v5 = CFSTR("user preference off");
LABEL_11:
  -[SBFluidSwitcherGestureManager failMultitaskingGesturesForReason:](self, "failMultitaskingGesturesForReason:", v5);
  if (self->_multitaskingGesturesRequireEducation)
  {
    SBLogSystemGesture();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Suggesting education for multitasking gesture instead of actually performing it", v8, 2u);
    }

    objc_msgSend((id)SBApp, "productivityGestureEducationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "gestureActivatedForType:", 6);

  }
LABEL_8:

}

- (void)_handleFloatingAppPresentGesture:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBFluidSwitcherGestureManager _grabberTongueForGestureRecognizer:](self, "_grabberTongueForGestureRecognizer:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissWithStyle:animated:", 0, 1);
  -[SBFluidSwitcherGestureManager _handleFluidGesture:](self, "_handleFluidGesture:", v4);

}

- (void)_handleTapToBringItemContainerForward:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  id WeakRetained;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogSystemGestureAppSwitcher();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "tapWasCommandModified");
    v7 = CFSTR("NO");
    if (v6)
      v7 = CFSTR("YES");
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Tap was command modified:%@", (uint8_t *)&v9, 0xCu);
  }

  if ((objc_msgSend(v4, "tapWasCommandModified") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    objc_msgSend(WeakRetained, "handleTapToBringItemContainerForward:", v4);

  }
}

- (void)_handleClickDownToBringItemContainerForward:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "state") == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    objc_msgSend(WeakRetained, "handleClickDownToBringItemContainerForward:", v5);

    objc_msgSend(v5, "setEnabled:", 0);
    objc_msgSend(v5, "setEnabled:", 1);
  }

}

- (void)_handleHoverGesture:(id)a3
{
  SBFluidSwitcherViewController **p_switcherContentController;
  id v4;
  id WeakRetained;

  p_switcherContentController = &self->_switcherContentController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_switcherContentController);
  objc_msgSend(WeakRetained, "handleContinuousExposeHoverGesture:", v4);

}

- (void)_handleContinuousExposeStripRevealGesture:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBFluidSwitcherGestureManager _grabberTongueForGestureRecognizer:](self, "_grabberTongueForGestureRecognizer:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissWithStyle:animated:", 0, 1);
  -[SBFluidSwitcherGestureManager _handleFluidGesture:](self, "_handleFluidGesture:", v4);

}

- (void)_handleWindowDragGestureRecognizer:(id)a3
{
  SBFluidSwitcherPanGestureRecognizer *v4;
  UILongPressGestureRecognizer *clickDownToBringItemContainerForwardGestureRecognizer;
  uint64_t v6;
  SBFluidSwitcherPanGestureRecognizer *v7;

  v4 = (SBFluidSwitcherPanGestureRecognizer *)a3;
  v7 = v4;
  if (self->_unpinSplitViewApplicationGestureRecognizer == v4)
  {
    clickDownToBringItemContainerForwardGestureRecognizer = self->_clickDownToBringItemContainerForwardGestureRecognizer;
    if (clickDownToBringItemContainerForwardGestureRecognizer)
    {
      v6 = -[UILongPressGestureRecognizer isEnabled](clickDownToBringItemContainerForwardGestureRecognizer, "isEnabled");
      -[UILongPressGestureRecognizer setEnabled:](self->_clickDownToBringItemContainerForwardGestureRecognizer, "setEnabled:", 0);
      -[UILongPressGestureRecognizer setEnabled:](self->_clickDownToBringItemContainerForwardGestureRecognizer, "setEnabled:", v6);
      v4 = v7;
    }
  }
  -[SBFluidSwitcherGestureManager _handleFluidGesture:](self, "_handleFluidGesture:", v4);

}

- (BOOL)isDragAndDropTransactionRunning
{
  return -[SBFluidSwitcherDragAndDropManager isDragAndDropTransactionRunning](self->_fluidDragAndDropManager, "isDragAndDropTransactionRunning");
}

- (BOOL)_shouldSceneResizeGesture:(id)a3 receiveTouch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  SBFZStackParticipant *zStackParticipant;
  void *v16;
  int v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  BOOL v21;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint8_t buf[4];
  int64_t v43;
  uint64_t v44;
  NSPoint v45;
  CGPoint v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(WeakRetained, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _UISystemGestureLocationForTouchInView();
  v12 = v11;
  v14 = v13;

  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant && (-[SBFZStackParticipant ownsHomeGesture](zStackParticipant, "ownsHomeGesture") & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = "Preventing the switcher resize gesture because the switcher doesn't own the home gesture.";
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (-[SBFluidSwitcherGestureManager _currentUnlockedEnvironmentMode](self, "_currentUnlockedEnvironmentMode") != 3)
  {
    SBLogSystemGestureAppSwitcher();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v43 = -[SBFluidSwitcherGestureManager _currentUnlockedEnvironmentMode](self, "_currentUnlockedEnvironmentMode");
      _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "Preventing the switcher resize gesture because the switcher's unlocked environment mode is: %li", buf, 0xCu);
    }
    goto LABEL_9;
  }
  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isFloatingSwitcherVisible");

  if (v17)
  {
    SBLogSystemGestureAppSwitcher();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = "Preventing the switcher resize gesture because the floating switcher is visible.";
LABEL_18:
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if ((objc_msgSend(v8, "layoutContainsRole:", 2) & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = "Preventing the switcher resize gesture because there isn't a side app.";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (-[SBFluidSwitcherGestureManager _hasActiveModalFloatingApplication](self, "_hasActiveModalFloatingApplication"))
  {
    SBLogSystemGestureAppSwitcher();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = "Preventing the switcher resize gesture because there is an modal floating application presented.";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  objc_msgSend(v8, "appLayout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leafAppLayoutForRole:", 1);
  v20 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "appLayout");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leafAppLayoutForRole:", 2);
  v25 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "visibleItemContainers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id *)MEMORY[0x1E0CEB258];
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    v28 = v20;
  else
    v28 = v25;
  objc_msgSend(v26, "objectForKey:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "visibleItemContainers");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*v27, "userInterfaceLayoutDirection") == 1)
    v31 = v25;
  else
    v31 = v20;
  objc_msgSend(v30, "objectForKey:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "frame");
  CGRectGetMaxX(v47);
  objc_msgSend(v29, "frame");
  CGRectGetMinX(v48);
  +[SBSeparatorView nubHitTestSize](SBSeparatorView, "nubHitTestSize");
  SBRectWithSize();
  -[SBFluidSwitcherGestureManager switcherContentController](self, "switcherContentController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "keyboardHeight");

  objc_msgSend(v32, "frame");
  CGRectGetMaxX(v49);
  objc_msgSend(v32, "frame");
  objc_msgSend(v32, "frame");
  UIRectCenteredAboutPoint();
  v46.x = v12;
  v46.y = v14;
  if (!CGRectContainsPoint(v50, v46))
  {
    v37 = (void *)MEMORY[0x1E0CB3940];
    v45.x = v12;
    v45.y = v14;
    NSStringFromPoint(v45);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringWithFormat:", CFSTR("didn't find a SBSeparatorView at location %@"), v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    SBLogSystemGestureAppSwitcher();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v43 = (int64_t)v39;
      _os_log_impl(&dword_1D0540000, v40, OS_LOG_TYPE_DEFAULT, "Preventing the switcher resize gesture because %@", buf, 0xCu);
    }

    goto LABEL_9;
  }

  if (!objc_msgSend(v8, "layoutContainsRole:", 3)
    || (objc_msgSend(WeakRetained, "_itemContainerAtLocation:environment:", 2, v12, v14),
        (v34 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!objc_msgSend(v8, "layoutContainsRole:", 4)
      || (objc_msgSend(WeakRetained, "_itemContainerAtLocation:environment:", 3, v12, v14),
          (v41 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[SBPanSystemGestureRecognizer setFailsPastMaximumPressDurationWithoutHysteresis:](self->_sceneResizePanGestureRecognizer, "setFailsPastMaximumPressDurationWithoutHysteresis:", objc_msgSend(v6, "_isPointerTouch") ^ 1);
      v21 = 1;
      goto LABEL_21;
    }
    v20 = v41;
    SBLogSystemGestureAppSwitcher();
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v36 = "Preventing the switcher resize gesture because the separator nub is occluded by a center window application.";
    goto LABEL_40;
  }
  v20 = v34;
  SBLogSystemGestureAppSwitcher();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v36 = "Preventing the switcher resize gesture because the separator nub is occluded by a floating application.";
LABEL_40:
    _os_log_impl(&dword_1D0540000, v35, OS_LOG_TYPE_DEFAULT, v36, buf, 2u);
  }
LABEL_41:

LABEL_9:
LABEL_20:
  v21 = 0;
LABEL_21:

  return v21;
}

- (BOOL)_hasActiveModalFloatingApplication
{
  void *v2;
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  BOOL v6;
  void *v7;
  void *v8;

  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "layoutContainsRole:", 3))
  {
    +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "medusaCapabilities");

    v5 = v4 == 1 && SBSpaceConfigurationIsSplitView(objc_msgSend(v2, "spaceConfiguration"));
    objc_msgSend(v2, "elementWithRole:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && (objc_msgSend(v7, "layoutAttributes") & 2) != 0)
      v5 = 1;

    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)dragAndDropManager:(id)a3 displayItemForDraggingWindowWithGestureRecognizer:(id)a4
{
  SBFluidSwitcherPanGestureRecognizer *v5;
  void *WeakRetained;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v5 = (SBFluidSwitcherPanGestureRecognizer *)a4;
  if (self->_pinFloatingApplicationGestureRecognizer == v5)
  {
    -[SBFluidSwitcherGestureManager _currentFloatingAppLayout](self, "_currentFloatingAppLayout");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "itemForLayoutRole:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    objc_msgSend(WeakRetained, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherPanGestureRecognizer locationInView:](v5, "locationInView:", v7);
    v9 = v8;
    v11 = v10;

    objc_msgSend(WeakRetained, "_leafAppLayoutForItemContainerAtLocation:environment:", 1, v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "itemForLayoutRole:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)dragAndDropManager:(id)a3 sourceViewProviderForDraggingWindowWithGestureRecognizer:(id)a4
{
  SBFluidSwitcherPanGestureRecognizer *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = (SBFluidSwitcherPanGestureRecognizer *)a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  v7 = WeakRetained;
  if (self->_pinFloatingApplicationGestureRecognizer == v5)
  {
    -[SBFluidSwitcherGestureManager _currentFloatingAppLayout](self, "_currentFloatingAppLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v15 = 0;
      goto LABEL_5;
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherPanGestureRecognizer locationInView:](v5, "locationInView:", v8);
    v10 = v9;
    v12 = v11;

    objc_msgSend(v7, "_leafAppLayoutForItemContainerAtLocation:environment:", 1, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "visibleItemContainers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  return v15;
}

- (void)dragAndDropManager:(id)a3 didBeginDraggingWindowWithSceneIdentifier:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBFluidSwitcherGestureManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fluidSwitcherGestureManager:didBeginDraggingWindowWithSceneIdentifier:", self, v5);

}

- (void)dragAndDropManager:(id)a3 didPlatterizeWindowDragWithSceneIdentifier:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBFluidSwitcherGestureManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fluidSwitcherGestureManager:didPlatterizeWindowDragWithSceneIdentifier:", self, v5);

}

- (void)dragAndDropManager:(id)a3 willEndDraggingWindowWithSceneIdentifier:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBFluidSwitcherGestureManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fluidSwitcherGestureManager:willEndDraggingWindowWithSceneIdentifier:", self, v5);

}

- (void)dragAndDropManager:(id)a3 didBeginGesture:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBFluidSwitcherGestureManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fluidSwitcherGestureManager:didBeginGesture:", self, v5);

}

- (void)dragAndDropManager:(id)a3 didUpdateGesture:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBFluidSwitcherGestureManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fluidSwitcherGestureManager:didUpdateGesture:", self, v5);

}

- (void)dragAndDropManager:(id)a3 didEndGesture:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBFluidSwitcherGestureManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fluidSwitcherGestureManager:didEndGesture:", self, v5);

}

- (void)_handleFluidGesture:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[SBFluidSwitcherGestureManager _isTransactionRunningForGestureRecognizer:](self, "_isTransactionRunningForGestureRecognizer:"))-[SBFluidSwitcherGestureManager _handleSwitcherGestureBegan:](self, "_handleSwitcherGestureBegan:", v5);
  if (-[SBFluidSwitcherGestureManager _isTransactionRunningForGestureRecognizer:](self, "_isTransactionRunningForGestureRecognizer:", v5))
  {
    -[SBFluidSwitcherGestureManager activeGestureTransaction](self, "activeGestureTransaction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemGestureStateChanged:", v5);

  }
}

- (void)_handleSwitcherGestureBegan:(id)a3
{
  id v4;

  v4 = a3;
  -[SBFluidSwitcherGestureManager _hideGrabberAnimated:](self, "_hideGrabberAnimated:", 1);
  -[SBFluidSwitcherGestureManager _startFluidSwitcherTransactionForGestureRecognizer:](self, "_startFluidSwitcherTransactionForGestureRecognizer:", v4);

}

- (void)_startFluidSwitcherTransactionForGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  SBFluidSwitcherGestureManager *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[SBFluidSwitcherGestureManager _isTransactionRunningForGestureRecognizer:](self, "_isTransactionRunningForGestureRecognizer:", v4))
  {
    -[SBFluidSwitcherGestureManager activeGestureTransaction](self, "activeGestureTransaction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogSystemGestureAppSwitcher();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      SBSystemGestureRecognizerStateDescription(objc_msgSend(v4, "state"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v8;
      v24 = 2050;
      v25 = v4;
      v26 = 2114;
      v27 = v9;
      v28 = 2114;
      v29 = v5;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Requesting fluid switcher gesture transaction for gesture recognizer: <%{public}@:%{public}p> (%{public}@), active gesture transaction:%{public}@", buf, 0x2Au);

    }
    if (v5)
    {
      objc_msgSend(v5, "gestureRecognizer");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v10 == v4)
        objc_msgSend(v5, "setShouldCancelGestureUponInterruption:", 0);
    }
    objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cancelEventsWithName:", CFSTR("SBFluidSwitcherGesture"));

    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
    objc_msgSend(WeakRetained, "windowScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_fbsDisplayConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __84__SBFluidSwitcherGestureManager__startFluidSwitcherTransactionForGestureRecognizer___block_invoke;
    v20[3] = &unk_1E8EA0260;
    v20[4] = self;
    v21 = v4;
    v17[0] = v16;
    v17[1] = 3221225472;
    v17[2] = __84__SBFluidSwitcherGestureManager__startFluidSwitcherTransactionForGestureRecognizer___block_invoke_2;
    v17[3] = &unk_1E8EAAC50;
    v18 = v21;
    v19 = self;
    objc_msgSend(v15, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v14, v20, v17);

  }
}

void __84__SBFluidSwitcherGestureManager__startFluidSwitcherTransactionForGestureRecognizer___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 11);
  objc_msgSend(v3, "setEventLabel:", CFSTR("SBFluidSwitcherGesture"));
  objc_msgSend(*(id *)(a1 + 32), "_configureTransitionRequest:forGestureBegin:", v3, *(_QWORD *)(a1 + 40));

}

BOOL __84__SBFluidSwitcherGestureManager__startFluidSwitcherTransactionForGestureRecognizer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  unint64_t v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int8x16_t v14;
  _QWORD v15[4];
  int8x16_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "state");
  v5 = v4 - 1;
  if ((unint64_t)(v4 - 1) > 1)
  {
    v7 = v4;
    SBLogSystemGestureAppSwitcher();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      SBSystemGestureRecognizerStateDescription(v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v10;
      v19 = 2050;
      v20 = v11;
      v21 = 2114;
      v22 = v12;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "No longer creating transaction for gesture recognizer since it has ended since the request was enqueued: <%{public}@:%{public}p> (%{public}@)", buf, 0x20u);

    }
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __84__SBFluidSwitcherGestureManager__startFluidSwitcherTransactionForGestureRecognizer___block_invoke_3;
    v15[3] = &unk_1E8EAB0A0;
    v14 = *(int8x16_t *)(a1 + 32);
    v6 = (id)v14.i64[0];
    v16 = vextq_s8(v14, v14, 8uLL);
    objc_msgSend(v3, "setTransactionProvider:", v15);

  }
  return v5 < 2;
}

id __84__SBFluidSwitcherGestureManager__startFluidSwitcherTransactionForGestureRecognizer___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  objc_class *v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  v6 = (objc_class *)objc_msgSend(*(id *)(a1 + 32), "_fluidSwitcherGestureTransactionClassForGestureType:", objc_msgSend(v3, "_gestureTypeForGestureRecognizer:", v4));
  SBLogSystemGestureAppSwitcher();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 40);
    SBSystemGestureRecognizerStateDescription(objc_msgSend(v11, "state"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138544130;
    v20 = v8;
    v21 = 2114;
    v22 = v10;
    v23 = 2050;
    v24 = v11;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Creating %{public}@ for gesture recognizer: <%{public}@:%{public}p> (%{public}@)", (uint8_t *)&v19, 0x2Au);

  }
  v13 = [v6 alloc];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v15 = (void *)objc_msgSend(v13, "initWithTransitionRequest:switcherController:delegate:", v5, WeakRetained, *(_QWORD *)(a1 + 32));

  objc_msgSend(v15, "setGestureRecognizer:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "switcherController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "switcherCoordinator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActiveGestureTransaction:", v15);

  return v15;
}

- (void)_configureTransitionRequest:(id)a3 forGestureBegin:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  SBFluidSwitcherGestureManager *v22;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(WeakRetained, "_configureTransitionRequestForGestureBegin:", v6);

  -[SBGrabberTongue edgePullGestureRecognizer](self->_rightEdgeFloatingAppGrabberTongue, "edgePullGestureRecognizer");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if ((id)v9 == v7)
    goto LABEL_8;
  v11 = (void *)v9;
  -[SBGrabberTongue indirectEdgePullGestureRecognizer](self->_rightEdgeFloatingAppGrabberTongue, "indirectEdgePullGestureRecognizer");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v7;
  if ((id)v12 == v7)
  {
LABEL_7:

    v10 = v11;
LABEL_8:

LABEL_9:
    -[SBFluidSwitcherGestureManager _firstFloatingAppLayout](self, "_firstFloatingAppLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __77__SBFluidSwitcherGestureManager__configureTransitionRequest_forGestureBegin___block_invoke;
    v20[3] = &unk_1E8E9ECA8;
    v21 = v18;
    v22 = self;
    v19 = v18;
    objc_msgSend(v6, "modifyApplicationContext:", v20);

    goto LABEL_10;
  }
  v14 = (void *)v12;
  -[SBGrabberTongue edgePullGestureRecognizer](self->_leftEdgeFloatingAppGrabberTongue, "edgePullGestureRecognizer");
  v15 = objc_claimAutoreleasedReturnValue();
  if ((id)v15 == v7)
  {

    v13 = v14;
    goto LABEL_7;
  }
  v16 = (void *)v15;
  -[SBGrabberTongue indirectEdgePullGestureRecognizer](self->_leftEdgeFloatingAppGrabberTongue, "indirectEdgePullGestureRecognizer");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17 == v7)
    goto LABEL_9;
LABEL_10:

}

void __77__SBFluidSwitcherGestureManager__configureTransitionRequest_forGestureBegin___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;

  v3 = a2;
  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "itemForLayoutRole:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
  objc_msgSend(v4, "_entityForDisplayItem:switcherController:", v5, WeakRetained);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setEntity:forLayoutRole:", v7, 3);
}

- (void)fluidSwitcherGestureTransaction:(id)a3 didBeginGesture:(id)a4
{
  SBFluidSwitcherGestureManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "fluidSwitcherGestureManager:didBeginGesture:", self, v6);

}

- (void)fluidSwitcherGestureTransaction:(id)a3 didUpdateGesture:(id)a4
{
  SBFluidSwitcherGestureManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "fluidSwitcherGestureManager:didUpdateGesture:", self, v6);

}

- (void)fluidSwitcherGestureTransaction:(id)a3 didEndGesture:(id)a4
{
  SBFluidSwitcherGestureManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "fluidSwitcherGestureManager:didEndGesture:", self, v6);

}

- (BOOL)_shouldDeckInSwitcherPanGesture:(id)a3 receiveTouch:(id)a4
{
  SBFluidSwitcherViewController **p_switcherContentController;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  NSObject *v15;
  uint8_t v17[16];

  p_switcherContentController = &self->_switcherContentController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_switcherContentController);
  objc_msgSend(WeakRetained, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _UISystemGestureLocationForTouchInView();
  v11 = v10;
  v13 = v12;

  objc_msgSend(WeakRetained, "_itemContainerAtLocation:environment:", 1, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    SBLogSystemGestureAppSwitcher();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_INFO, "Preventing the in switcher gesture because the touch is on top of an item container.", v17, 2u);
    }

  }
  return v14 == 0;
}

- (BOOL)_shouldFloatingApplicationSwipeUpGesture:(id)a3 receiveTouch:(id)a4
{
  SBFluidSwitcherViewController **p_switcherContentController;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  double MaxY;
  uint64_t v25;
  double v26;
  double v27;
  BOOL v28;
  void *v29;
  BOOL v30;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  p_switcherContentController = &self->_switcherContentController;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_switcherContentController);
  objc_msgSend(WeakRetained, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _UISystemGestureLocationForTouchInView();
  v12 = v11;
  v14 = v13;

  -[SBFluidSwitcherGestureManager _floatingApplicationBounds](self, "_floatingApplicationBounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(MEMORY[0x1E0DC5B80], "sb_floatingApplicationDisplayEdgeInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32.origin.x = v16;
  v32.origin.y = v18;
  v32.size.width = v20;
  v32.size.height = v22;
  MaxY = CGRectGetMaxY(v32);
  objc_msgSend(v23, "safeAreaInsetsPortrait");
  v25 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v25, "bottomInset");
  v27 = MaxY - v26;
  v28 = v14 > v27;

  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v25) = objc_msgSend(v29, "isFloatingSwitcherVisible");

  if ((v25 & 1) == 0)
  {
    v33.origin.x = v16;
    v33.origin.y = v18;
    v33.size.width = v20;
    v33.size.height = v22;
    if (v12 >= CGRectGetMinX(v33))
    {
      v34.origin.x = v16;
      v34.origin.y = v18;
      v34.size.width = v20;
      v34.size.height = v22;
      v30 = v12 < CGRectGetMaxX(v34);
      v28 = v14 > v27 && v30;
    }
    else
    {
      v28 = 0;
    }
  }

  return v28;
}

- (BOOL)_shouldFloatingApplicationMoveGesture:(id)a3 receiveTouch:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  _BOOL4 v30;
  int v31;
  uint64_t v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  CGFloat v46;
  CGFloat v47;
  CGRect v48;
  CGRect v49;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "_isPointerTouch") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    objc_msgSend(WeakRetained, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _UISystemGestureLocationForTouchInView();
    v12 = v11;
    -[SBFluidSwitcherGestureManager _floatingApplicationBounds](self, "_floatingApplicationBounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", 0);
    v23 = v22;
    v25 = v24;
    v26 = objc_loadWeakRetained((id *)&self->_switcherController);
    objc_msgSend(v26, "windowScene");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "systemGestureManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "shouldSystemGestureReceiveTouchWithLocation:", v23, v25);
    v30 = SBIsSystemGestureAllowed(v27, 29);
    v31 = objc_msgSend(v21, "layoutContainsRole:", 3);
    v8 = 0;
    if (v29 && v30)
    {
      v32 = 0;
      if (v31)
      {
        +[SBNubView height](SBNubView, "height", 0);
        UIRectInset();
        v46 = v16;
        v47 = v20;
        UIRectInset();
        v34 = v33;
        v36 = v35;
        v38 = v37;
        v40 = v39;
        if (SBRectContainsPoint() && (SBRectContainsPoint() & 1) == 0)
        {
          v41 = objc_msgSend(v21, "floatingConfiguration");
          v42 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
          v43 = 1;
          if (v42 == 1)
            v43 = 2;
          v45 = v12;
          if (v41 == v43)
          {
            v48.size.width = v38;
            v48.origin.x = v34;
            v48.origin.y = v36;
            v48.size.height = v40;
            CGRectGetMaxX(v48);
          }
          v49.origin.x = v14;
          v49.origin.y = v46;
          v49.size.width = v18;
          v49.size.height = v47;
          CGRectGetMaxX(v49);
          if ((SBRectContainsPoint() & 1) != 0
            || (SBRectContainsPoint() & 1) != 0
            || SBRectContainsPoint())
          {
            v8 = 1;
            v32 = 1;
          }
          else
          {
            v32 = 0;
            v8 = 1;
          }
        }
        else
        {
          v8 = 0;
          v32 = 0;
        }
      }
    }
    else
    {
      v32 = 0;
    }
    -[SBPanSystemGestureRecognizer setFailsPastMaximumPressDurationWithoutHysteresis:](self->_moveFloatingApplicationGestureRecognizer, "setFailsPastMaximumPressDurationWithoutHysteresis:", v32, v45);

  }
  return v8;
}

- (BOOL)_shouldFloatingApplicationPinGesture:(id)a3 receiveTouch:(id)a4
{
  SBFluidSwitcherViewController **p_switcherContentController;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  int v27;
  _BOOL4 v28;
  int v29;
  BOOL v30;
  char v31;
  void *v32;
  CGRect v34;

  p_switcherContentController = &self->_switcherContentController;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_switcherContentController);
  objc_msgSend(WeakRetained, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _UISystemGestureLocationForTouchInView();
  -[SBFluidSwitcherGestureManager _floatingApplicationBounds](self, "_floatingApplicationBounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", 0);
  v21 = v20;
  v23 = v22;

  v24 = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(v24, "windowScene");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "systemGestureManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "shouldSystemGestureReceiveTouchWithLocation:", v21, v23);
  v28 = SBIsSystemGestureAllowed(v25, 30);
  v29 = objc_msgSend(v19, "layoutContainsRole:", 3);
  v30 = -[SBFluidSwitcherGestureManager _isBannerOccludingRegionAtReferencePoint:](self, "_isBannerOccludingRegionAtReferencePoint:", v21, v23);
  v31 = 0;
  if (v27 && v28 && v29 && !v30)
  {
    +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "narrowEdgeSwipeHitTestWidth");

    +[SBNubView height](SBNubView, "height");
    v34.origin.x = v12;
    v34.origin.y = v14;
    v34.size.width = v16;
    v34.size.height = v18;
    CGRectGetMidX(v34);
    v31 = SBRectContainsPoint();
  }

  return v31;
}

- (BOOL)_shouldSplitViewApplicationUnpinGesture:(id)a3 receiveTouch:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  int v32;
  void *v33;
  int v34;
  double v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  CGFloat v54;
  CGFloat v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  double v71;
  uint64_t v72;
  CGPoint v73;
  CGPoint v74;
  CGRect v75;
  CGRect v76;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "locationInView:", 0);
  if (!-[SBFluidSwitcherGestureManager _isUnpinGestureAllowedToMoveWindowsAtLocationInReferenceCoordinateSpace:](self, "_isUnpinGestureAllowedToMoveWindowsAtLocationInReferenceCoordinateSpace:"))
  {
    v18 = 0;
    goto LABEL_21;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  v9 = objc_loadWeakRetained((id *)&self->_switcherContentController);
  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appLayout");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _UISystemGestureLocationForTouchInView();
  v13 = v12;
  v15 = v14;
  -[SBFluidSwitcherGestureManager _hitTestStageItemContainerForUnpinGestureWithTouch:atGestureLocation:](self, "_hitTestStageItemContainerForUnpinGestureWithTouch:atGestureLocation:", v7);
  v16 = objc_claimAutoreleasedReturnValue();
  v49 = v11;
  if (!v16)
    goto LABEL_8;
  v17 = (void *)v16;
  if (!self->_windowMoveClientGateRelationshipGestureRecognizer)
  {
    -[SBFluidSwitcherGestureManager _edgeSwipeHitTestRectForItemContainer:forPointerTouch:](self, "_edgeSwipeHitTestRectForItemContainer:forPointerTouch:", v16, objc_msgSend(v7, "_isPointerTouch"));
    if ((SBRectContainsPoint() & 1) == 0)
    {

LABEL_8:
      if (objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled"))
      {
        objc_msgSend(v9, "visibleItemContainers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "allValues");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __86__SBFluidSwitcherGestureManager__shouldSplitViewApplicationUnpinGesture_receiveTouch___block_invoke;
        v51[3] = &unk_1E8EBD960;
        v52 = v50;
        v53 = v11;
        v54 = v13;
        v55 = v15;
        objc_msgSend(v20, "bs_firstObjectPassingTest:", v51);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = 0;
      }
      goto LABEL_11;
    }
  }
  objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled");
LABEL_11:
  objc_msgSend(v17, "appLayout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInitialTouchLeafAppLayout:", v21);

  v18 = v17 != 0;
  if (v17)
  {
    v47 = v9;
    v22 = objc_msgSend(v7, "_isPointerTouch");
    v48 = WeakRetained;
    v23 = objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled");
    -[SBFluidSwitcherGestureManager _edgeSwipeHitTestRectForItemContainer:forPointerTouch:](self, "_edgeSwipeHitTestRectForItemContainer:forPointerTouch:", v17, v22);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v32 = SBRectContainsPoint();
    objc_msgSend(v17, "appLayout");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v50, "isOrContainsAppLayout:", v33);

    if ((v23 & v34 & (v22 | v32)) != 0)
      v35 = 0.0;
    else
      v35 = 10.0;
    -[SBFluidSwitcherPanGestureRecognizer _setHysteresis:](self->_unpinSplitViewApplicationGestureRecognizer, "_setHysteresis:", v35);
    SBLogSystemGestureAppSwitcher();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v73.x = v13;
      v73.y = v15;
      NSStringFromCGPoint(v73);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFluidSwitcherGestureManager _paddedHitTestRectForItemContainer:forPointerTouch:](self, "_paddedHitTestRectForItemContainer:forPointerTouch:", v17, v22);
      NSStringFromCGRect(v75);
      v45 = v6;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v76.origin.x = v25;
      v76.origin.y = v27;
      v76.size.width = v29;
      v76.size.height = v31;
      NSStringFromCGRect(v76);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138414082;
      v57 = v46;
      v58 = 2112;
      v59 = v37;
      v60 = 2112;
      v61 = v38;
      v62 = 2112;
      v63 = v39;
      v64 = 2112;
      v65 = v40;
      v66 = 2112;
      v67 = v41;
      v68 = 2112;
      v69 = v42;
      v70 = 2048;
      v71 = v35;
      _os_log_impl(&dword_1D0540000, v36, OS_LOG_TYPE_DEFAULT, "_unpinSplitViewApplicationGestureRecognizer receiving touch (%@): hit-tested to item container (%@); isChamoisWi"
        "ndowingUIEnabled: %@; isSelectedAppLayoutOnStage: %@; isPointerTouch: %@; isTouchWithinEdgeSwipeHitTestRect: %@ "
        "(%@); hysteresis: %f",
        buf,
        0x52u);

      v6 = v45;
    }
    v9 = v47;
    WeakRetained = v48;
  }
  else
  {
    SBLogSystemGestureAppSwitcher();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v74.x = v13;
      v74.y = v15;
      NSStringFromCGPoint(v74);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v57 = v43;
      _os_log_impl(&dword_1D0540000, v36, OS_LOG_TYPE_DEFAULT, "_unpinSplitViewApplicationGestureRecognizer not receiving touch (%@): did not hit-test to item container", buf, 0xCu);

    }
  }

LABEL_21:
  return v18;
}

BOOL __86__SBFluidSwitcherGestureManager__shouldSplitViewApplicationUnpinGesture_receiveTouch___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "appLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemForLayoutRole:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "layoutRoleForItem:", v6);

  v10 = 0;
  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "hitTest:withEvent:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isDescendantOfView:", v3);

    if ((v9 & 1) != 0)
      v10 = 1;
  }

  return v10;
}

- (BOOL)_shouldIndirectFloatingAppScrunchGesture:(id)a3 receiveTouch:(id)a4
{
  id WeakRetained;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  char v16;
  BOOL v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGPoint v27;
  CGRect v28;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(WeakRetained, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherGestureManager _floatingApplicationBounds](self, "_floatingApplicationBounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isFloatingSwitcherVisible");

  if ((v16 & 1) != 0)
  {
    v17 = 1;
  }
  else
  {
    v18 = objc_loadWeakRetained((id *)&self->_switcherController);
    objc_msgSend(v18, "windowScene");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "systemGestureManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "indirectTouchLifecycleMonitor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "systemGestureHoverLocationInView:", v6);
    v23 = v22;
    v25 = v24;

    v28.origin.x = v8;
    v28.origin.y = v10;
    v28.size.width = v12;
    v28.size.height = v14;
    v27.x = v23;
    v27.y = v25;
    v17 = CGRectContainsPoint(v28, v27);
  }

  return v17;
}

- (BOOL)_shouldLiveResizeItemContainerGestureWithTouch:(id)a3 receiveTouch:(id)a4
{
  SBFluidSwitcherViewController **p_switcherContentController;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  void *v31;
  NSObject *v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  BOOL v44;
  void *v45;
  void *v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  NSObject *v55;
  uint64_t v56;
  CGPoint v57;
  CGPoint v58;
  CGPoint v59;
  CGPoint v60;
  CGPoint v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v56 = *MEMORY[0x1E0C80C00];
  p_switcherContentController = &self->_switcherContentController;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_switcherContentController);
  objc_msgSend(WeakRetained, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _UISystemGestureLocationForTouchInView();
  v12 = v11;
  v14 = v13;

  objc_msgSend(WeakRetained, "_itemContainerNearestLocation:environment:prioritizeForegroundedItemContainers:", 1, 1, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "appLayout");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "adjustedAppLayoutForLeafAppLayout:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appLayout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isOrContainsAppLayout:", v17);

    if ((v21 & 1) == 0)
    {
      SBLogSystemGestureAppSwitcher();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "appLayout");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v53 = v46;
        v54 = 2112;
        v55 = v17;
        _os_log_impl(&dword_1D0540000, v32, OS_LOG_TYPE_DEFAULT, "Preventing the switcher live resize touch gesture because current layout state doesn't contain leaf app layout. %@ %@", buf, 0x16u);

      }
      goto LABEL_24;
    }
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "_appLayoutContainsOnlyResizableApps:", v18);

    if ((v23 & 1) == 0)
    {
      SBLogSystemGestureAppSwitcher();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v18;
        _os_log_impl(&dword_1D0540000, v32, OS_LOG_TYPE_DEFAULT, "Preventing the switcher live resize touch gesture because app layout doesn't contain only resizable apps. %@", buf, 0xCu);
      }
      goto LABEL_24;
    }
    objc_msgSend(v16, "frame");
    v50 = v24;
    v51 = v25;
    v27 = v26;
    v29 = v28;
    v30 = objc_msgSend(v16, "allowedTouchResizeCorners");
    -[NSObject layoutAttributesForItemInRole:](v17, "layoutAttributesForItemInRole:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sizingPolicy");

    objc_msgSend(WeakRetained, "chamoisLayoutAttributes");
    v32 = objc_claimAutoreleasedReturnValue();
    -[NSObject screenEdgePadding](v32, "screenEdgePadding");
    SBRectWithSize();
    v48 = v29;
    v49 = v27;
    if ((v30 & 8) != 0)
    {
      v34 = v50;
      UIRectCenteredAboutPoint();
      v61.x = v12;
      v61.y = v14;
      v33 = CGRectContainsPoint(v65, v61);
      if (v33)
      {
        v35 = v51;
        goto LABEL_11;
      }
    }
    else
    {
      v33 = 0;
      v34 = v50;
    }
    v35 = v51;
    if ((v30 & 4) != 0)
    {
      UIRectCenteredAboutPoint();
      v58.x = v12;
      v58.y = v14;
      v33 = CGRectContainsPoint(v62, v58);
    }
    if (!v33 && (v30 & 2) != 0)
    {
      UIRectCenteredAboutPoint();
      v59.x = v12;
      v59.y = v14;
      v33 = CGRectContainsPoint(v63, v59);
    }
LABEL_11:
    if (v33 || (v30 & 1) == 0)
    {
      if (!v33)
        goto LABEL_14;
    }
    else
    {
      UIRectCenteredAboutPoint();
      v60.x = v12;
      v60.y = v14;
      if (!CGRectContainsPoint(v64, v60))
      {
LABEL_14:
        SBLogSystemGestureAppSwitcher();
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
        v39 = v48;
        v38 = v49;
        if (v37)
        {
          v40 = v34;
          v41 = v35;
          NSStringFromCGRect(*(CGRect *)(&v38 - 2));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v57.x = v12;
          v57.y = v14;
          NSStringFromCGPoint(v57);
          v43 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v53 = v42;
          v54 = 2112;
          v55 = v43;
          _os_log_impl(&dword_1D0540000, v36, OS_LOG_TYPE_DEFAULT, "Preventing the switcher live resize touch gesture because didn't hit test. %@ %@", buf, 0x16u);

        }
LABEL_24:
        v44 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    v44 = 1;
    goto LABEL_25;
  }
  SBLogSystemGestureAppSwitcher();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "Preventing the switcher live resize touch gesture because no item container.", buf, 2u);
  }
  v44 = 0;
LABEL_26:

  return v44;
}

- (BOOL)_shouldLiveResizeItemContainerGestureWithPointer:(id)a3 receiveTouch:(id)a4
{
  id WeakRetained;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "_isPointerTouch", a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    objc_msgSend(WeakRetained, "itemContainerToResizeUsingPointer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      SBLogSystemGestureAppSwitcher();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Preventing the switcher live resize pointer gesture because no item container.", (uint8_t *)&v20, 2u);
      }
      v15 = 0;
      goto LABEL_16;
    }
    objc_msgSend(v6, "appLayout");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "adjustedAppLayoutForLeafAppLayout:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isOrContainsAppLayout:", v8);

    if ((v12 & 1) != 0)
    {
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "_appLayoutContainsOnlyResizableApps:", v9);

      if ((v14 & 1) != 0)
      {
        v15 = 1;
LABEL_15:

LABEL_16:
        return v15;
      }
      SBLogSystemGestureAppSwitcher();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412290;
        v21 = v9;
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "Preventing the switcher live resize pointer gesture because app layout doesn't contain only resizable apps. %@", (uint8_t *)&v20, 0xCu);
      }
    }
    else
    {
      SBLogSystemGestureAppSwitcher();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "appLayout");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412546;
        v21 = v18;
        v22 = 2112;
        v23 = v8;
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "Preventing the switcher live resize pointer gesture because current layout state doesn't contain leaf app layout. %@ %@", (uint8_t *)&v20, 0x16u);

      }
    }

    v15 = 0;
    goto LABEL_15;
  }
  return 0;
}

- (BOOL)_shouldLiveResizeGesture:(id)a3 receiveTouch:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  BOOL v24;
  const char *v25;
  uint8_t *v26;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint8_t v35[16];
  uint8_t v36[16];
  uint8_t v37[16];
  uint8_t buf[2];
  __int16 v39;
  __int16 v40;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "systemGestureManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled") & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v40 = 0;
    v25 = "Preventing the switcher live resize gesture because Stage Manager isn't enabled.";
    v26 = (uint8_t *)&v40;
LABEL_16:
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, v25, v26, 2u);
    goto LABEL_17;
  }
  objc_msgSend(v7, "locationInView:", 0);
  if ((objc_msgSend(v10, "shouldSystemGestureReceiveTouchWithLocation:") & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v39 = 0;
    v25 = "Preventing the switcher live resize gesture because covered by keyboard or PiP.";
    v26 = (uint8_t *)&v39;
    goto LABEL_16;
  }
  if ((objc_msgSend(v10, "isGestureWithTypeAllowed:", 37) & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v25 = "Preventing the switcher live resize gesture because not allowed.";
      v26 = buf;
      goto LABEL_16;
    }
LABEL_17:

    v24 = 0;
    goto LABEL_18;
  }
  v11 = objc_loadWeakRetained((id *)&self->_switcherContentController);
  -[NSObject itemContainerToResizeUsingPointer](v11, "itemContainerToResizeUsingPointer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[NSObject view](v11, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _UISystemGestureLocationInView();
    v15 = v14;
    v17 = v16;

    -[NSObject _itemContainerNearestLocation:environment:prioritizeForegroundedItemContainers:](v11, "_itemContainerNearestLocation:environment:prioritizeForegroundedItemContainers:", 1, 1, v15, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      SBLogSystemGestureAppSwitcher();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v37 = 0;
        _os_log_impl(&dword_1D0540000, v31, OS_LOG_TYPE_DEFAULT, "Preventing the switcher live resize gesture because no item container.", v37, 2u);
      }

      goto LABEL_17;
    }
  }
  v32 = v12;
  objc_msgSend(v12, "appLayout");
  v18 = objc_claimAutoreleasedReturnValue();
  v34 = v11;
  -[NSObject adjustedAppLayoutForLeafAppLayout:](v11, "adjustedAppLayoutForLeafAppLayout:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appLayout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)v18;
  LOBYTE(v18) = objc_msgSend(v21, "isOrContainsAppLayout:", v18);

  if ((v18 & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "Preventing the switcher live resize gesture because item container isn't on stage.", v36, 2u);
    }
    v29 = v33;
    v11 = v34;
    v30 = v32;
    goto LABEL_25;
  }
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "_appLayoutContainsOnlyResizableApps:", v19);

  if ((v23 & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v28 = objc_claimAutoreleasedReturnValue();
    v11 = v34;
    v30 = v32;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "Preventing the switcher live resize gesture because app layout contains non resizable items.", v35, 2u);
    }
    v29 = v33;
LABEL_25:

    goto LABEL_17;
  }

  v24 = -[SBFluidSwitcherGestureManager _shouldLiveResizeItemContainerGestureWithPointer:receiveTouch:](self, "_shouldLiveResizeItemContainerGestureWithPointer:receiveTouch:", v6, v7)|| -[SBFluidSwitcherGestureManager _shouldLiveResizeItemContainerGestureWithTouch:receiveTouch:](self, "_shouldLiveResizeItemContainerGestureWithTouch:receiveTouch:", v6, v7);
LABEL_18:

  return v24;
}

- (BOOL)_shouldClickDownToBringItemContainerForward:(id)a3 receiveTouch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  v10 = objc_msgSend(v7, "_isPointerTouch")
     && (-[SBAppSwitcherSettings chamoisSettings](self->_appSwitcherSettings, "chamoisSettings"),
         v8 = (void *)objc_claimAutoreleasedReturnValue(),
         v9 = objc_msgSend(v8, "changeFocusOnClickDown"),
         v8,
         v9)
     && -[SBFluidSwitcherGestureManager _shouldBringItemContainerForwardGesture:receiveTouch:](self, "_shouldBringItemContainerForwardGesture:receiveTouch:", v6, v7);

  return v10;
}

- (BOOL)_shouldBringItemContainerForwardGesture:(id)a3 receiveTouch:(id)a4
{
  id WeakRetained;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  char v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  char v49;
  void *v50;
  NSUInteger v51;
  void *v52;
  char v53;
  id v54;
  int v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v64 = a3;
  v65 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  if (objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled"))
  {
    v7 = objc_loadWeakRetained((id *)&self->_switcherContentController);
    objc_msgSend(v65, "locationInView:", 0);
    v9 = v8;
    v11 = v10;
    objc_msgSend(WeakRetained, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "systemGestureManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v13, "shouldSystemGestureReceiveTouchWithLocation:", v9, v11);

    objc_msgSend(v7, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _UISystemGestureLocationForTouchInView();
    v16 = v15;
    v18 = v17;

    objc_msgSend(v7, "_itemContainerAtLocation:environment:", 1, v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appLayout");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "adjustedAppLayoutForLeafAppLayout:", v21);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "liveContentOverlays");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)v21;
    objc_msgSend(v22, "objectForKey:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = v23;
    objc_msgSend(v23, "touchBehavior");
    objc_msgSend(v19, "appLayout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "itemForLayoutRole:", 1);
    v25 = objc_claimAutoreleasedReturnValue();

    v60 = v20;
    objc_msgSend(v20, "appLayout");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "zOrderedItems");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = -[NSHashTable count](self->_presentedSceneBackedBanners, "count");
    objc_msgSend(v12, "screen");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "fixedCoordinateSpace");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = v12;
    objc_msgSend(v12, "floatingDockController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v31, "containsPoint:fromCoordinateSpace:", v30, v9, v11);
    v59 = v19;
    v61 = (void *)v25;
    if (v19)
    {
      v32 = 0;
      if ((BSEqualObjects() & 1) == 0 && ((v55 ^ 1) & 1) == 0)
      {
        objc_msgSend(v60, "appLayout");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "isOrContainsAppLayout:", v63))
        {
          +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
          v34 = v31;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "_appLayoutContainsOnlyResizableApps:", v62);
          v37 = v53 ^ 1;
          if (v51)
            v37 = 0;
          v32 = v36 & v37;

          v31 = v34;
        }
        else
        {
          v32 = 0;
        }

      }
    }
    else
    {
      v32 = 0;
    }
    SBLogSystemGestureAppSwitcher();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBOOL();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v49 = v32;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "succinctDescription");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "succinctDescription");
      v50 = v31;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBKSSceneHostTouchBehavior();
      v56 = WeakRetained;
      v43 = v28;
      v52 = v30;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v54 = v7;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138414082;
      v67 = v39;
      v68 = 2112;
      v69 = v48;
      v70 = 2112;
      v71 = v40;
      v72 = 2112;
      v73 = v41;
      v74 = 2112;
      v75 = v42;
      v76 = 2112;
      v77 = v44;
      v78 = 2112;
      v79 = v45;
      v80 = 2112;
      v81 = v46;
      _os_log_impl(&dword_1D0540000, v38, OS_LOG_TYPE_DEFAULT, "Should bring item container forward:%@ TouchAllowedAtLocation:%@ SceneBackedBannersPresented:%@ AppLayout:%@ LeafAppLayoutToBringForward:%@ TouchBehavior:%@ ItemAlreadyOnTop:%@ TouchInsideDock:%@", buf, 0x52u);

      v7 = v54;
      v30 = v52;
      v28 = v43;
      WeakRetained = v56;

      v31 = v50;
      v32 = v49;

    }
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (BOOL)_shouldContinuousExposeStripOverflowPanGesture:(id)a3 receiveTouch:(id)a4
{
  id v6;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  BOOL v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  CGFloat v38;
  void *v39;
  id v41;
  id v42;
  CGRect v43;

  v42 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  v41 = v6;
  objc_msgSend(v6, "locationInView:", 0);
  v9 = v8;
  v11 = v10;
  objc_msgSend(WeakRetained, "windowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "systemGestureManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "shouldSystemGestureReceiveTouchWithLocation:", v9, v11);
  v15 = v13;
  v16 = objc_msgSend(v13, "isGestureWithTypeAllowed:", 56);
  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "unlockedEnvironmentMode");
  v19 = v17;
  v20 = objc_msgSend(v17, "peekConfiguration");
  v21 = WeakRetained;
  v22 = objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled");
  v23 = 0;
  if (!v22 || !v14 || !v16)
  {
    v26 = v41;
    v25 = v42;
    v27 = v15;
    goto LABEL_15;
  }
  v24 = v18 == 3;
  v26 = v41;
  v25 = v42;
  v27 = v15;
  if (!v24)
    goto LABEL_15;
  if (!SBPeekConfigurationIsValid(v20))
  {
    v28 = objc_loadWeakRetained((id *)&self->_switcherContentController);
    objc_msgSend(v28, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    _UISystemGestureLocationForTouchInView();
    v31 = v30;
    v33 = v32;

    objc_msgSend(v28, "chamoisLayoutAttributes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stripWidth");
    v36 = v35;
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    {
      objc_msgSend(v28, "view");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "frame");
      v38 = CGRectGetMaxX(v43) - v36;

      if (v31 < v38)
      {
LABEL_11:
        v23 = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    else if (v31 > v36)
    {
      goto LABEL_11;
    }
    objc_msgSend(v28, "_itemContainerAtLocation:environment:", 0, v31, v33);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v39 == 0;

    goto LABEL_14;
  }
  v23 = 0;
LABEL_15:

  return v23;
}

- (CGRect)_paddedHitTestRectForItemContainer:(id)a3 forPointerTouch:(BOOL)a4
{
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  id WeakRetained;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  id *v30;
  uint64_t v31;
  uint64_t v32;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGRect v40;
  CGRect result;

  v5 = a3;
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  v15 = objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled");

  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appLayout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "itemForLayoutRole:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v18, "layoutRoleForItem:", v20);

  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v11;
  if ((v15 & 1) == 0)
  {
    if (v21 == 4)
    {
      +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "wideEdgeSwipeHitTestWidth");
      v23 = v25;

    }
    else
    {
      v26 = objc_msgSend(v18, "configuration");
      v23 = 0.0;
      v27 = 0.0;
      switch(v26)
      {
        case 0:
        case 1:
        case 3:
          goto LABEL_5;
        case 2:
          if (v21 == 1)
            goto LABEL_9;
          goto LABEL_5;
        case 4:
          if (v21 == 1)
LABEL_5:
            objc_msgSend(v22, "wideEdgeSwipeHitTestWidth");
          else
LABEL_9:
            objc_msgSend(v22, "narrowEdgeSwipeHitTestWidth");
          v27 = v28;
          break;
        default:
          break;
      }
      v29 = objc_msgSend(v16, "floatingConfiguration");
      v30 = (id *)MEMORY[0x1E0CEB258];
      if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
        v31 = 2;
      else
        v31 = 1;
      if (v26 == 1 || v21 != v31 || v29 != 1)
      {
        if (objc_msgSend(*v30, "userInterfaceLayoutDirection") == 1)
          v32 = 1;
        else
          v32 = 2;
        if (v29 != 2 || v21 != v32 || v26 == 1)
          v23 = v27;
        else
          v23 = 0.0;
      }
    }
  }
  v40.origin.x = v7;
  v40.origin.y = v9;
  v40.size.width = v11;
  v40.size.height = v13;
  v35 = CGRectGetMidX(v40) + v23 * -0.5;

  v36 = v35;
  v37 = v9;
  v38 = v23;
  v39 = v13;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

- (CGRect)_edgeSwipeHitTestRectForItemContainer:(id)a3 forPointerTouch:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id WeakRetained;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "frame");
  v8 = v7;
  +[SBNubView height](SBNubView, "height");
  v10 = v9;
  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "itemForLayoutRole:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "layoutRoleForItem:", v14);

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  v17 = objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled");

  -[SBFluidSwitcherGestureManager _paddedHitTestRectForItemContainer:forPointerTouch:](self, "_paddedHitTestRectForItemContainer:forPointerTouch:", v6, v4);
  v19 = v18;
  v21 = v20;

  if (v15 == 4)
  {
    v22 = v10 + v10;
    v8 = v8 - v10;
  }
  else if (v17)
  {
    if (v4)
      v22 = v10;
    else
      v22 = v10 + v10;
    if (!v4)
      v8 = v8 - v10;
  }
  else
  {
    v22 = v10;
  }

  v23 = v19;
  v24 = v8;
  v25 = v21;
  v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (BOOL)_isUnpinGestureAllowedToMoveWindowsAtLocationInReferenceCoordinateSpace:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  _BOOL4 v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  SBFluidSwitcherGestureManager *v14;

  y = a3.y;
  x = a3.x;
  v14 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemGestureManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherGestureManager _currentLayoutState](v14, "_currentLayoutState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "shouldSystemGestureReceiveTouchWithLocation:", x, y);
  v10 = SBIsSystemGestureAllowed(v6, 24);
  v11 = -[SBFluidSwitcherGestureManager _isBannerOccludingRegionAtReferencePoint:](v14, "_isBannerOccludingRegionAtReferencePoint:", x, y);
  v12 = objc_msgSend(v8, "unlockedEnvironmentMode");
  v13 = objc_msgSend(v8, "peekConfiguration");
  LOBYTE(v14) = 0;
  if (v9 && v10 && !v11 && v12 == 3)
    LODWORD(v14) = !SBPeekConfigurationIsValid(v13);

  return (char)v14;
}

- (id)_hitTestStageItemContainerForUnpinGestureWithTouch:(id)a3 atGestureLocation:(CGPoint)a4
{
  double x;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  int v41;
  CFTypeRef v42;
  const void *UnionWithRegion;
  void *v45;
  void *v46;
  id v47;
  SBFluidSwitcherGestureManager *v48;
  void *v49;
  id obj;
  CFTypeRef v51;
  int v52;
  id v53;
  _QWORD v54[5];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;
  CGRect v61;
  CGRect v62;

  x = a4.x;
  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v6;
  objc_msgSend(v6, "locationInView:", 0);
  v11 = v10;
  v13 = v12;
  v14 = objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled");
  v15 = 0;
  if (-[SBFluidSwitcherGestureManager _isUnpinGestureAllowedToMoveWindowsAtLocationInReferenceCoordinateSpace:](self, "_isUnpinGestureAllowedToMoveWindowsAtLocationInReferenceCoordinateSpace:", v11, v13))
  {
    v53 = objc_loadWeakRetained((id *)&self->_switcherContentController);
    objc_msgSend(v9, "zOrderedItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      v18 = v14;
    else
      v18 = 1;
    if ((v18 & 1) == 0)
    {
      objc_msgSend(v16, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = BSEqualObjects();

      if ((v20 & 1) == 0)
      {
        v21 = (void *)objc_msgSend(v16, "mutableCopy");
        objc_msgSend(v21, "removeObject:", v17);
        objc_msgSend(v21, "insertObject:atIndex:", v17, 0);

        v16 = v21;
      }
    }
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = v16;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (v22)
    {
      v23 = v22;
      v45 = v17;
      v46 = v8;
      v52 = v14;
      v47 = WeakRetained;
      v48 = self;
      v51 = 0;
      v24 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v56 != v24)
            objc_enumerationMutation(obj);
          v26 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v53, "visibleItemContainers", v45, v46, v47);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "allValues");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v54[0] = MEMORY[0x1E0C809B0];
          v54[1] = 3221225472;
          v54[2] = __102__SBFluidSwitcherGestureManager__hitTestStageItemContainerForUnpinGestureWithTouch_atGestureLocation___block_invoke;
          v54[3] = &unk_1E8E9E388;
          v54[4] = v26;
          objc_msgSend(v28, "bs_firstObjectPassingTest:", v54);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "frame");
          v30 = v29;
          v32 = v31;
          v34 = v33;
          v36 = v35;
          objc_msgSend(v15, "appLayout");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "itemForLayoutRole:", 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v9;
          v40 = objc_msgSend(v9, "layoutRoleForItem:", v38);

          if (v40)
          {
            v61.origin.x = v30;
            v61.origin.y = v32;
            v61.size.width = v34;
            v61.size.height = v36;
            v9 = v39;
            if (x >= CGRectGetMinX(v61))
            {
              v62.origin.x = v30;
              v62.origin.y = v32;
              v62.size.width = v34;
              v62.size.height = v36;
              if (x <= CGRectGetMaxX(v62))
              {
                -[SBFluidSwitcherGestureManager _paddedHitTestRectForItemContainer:forPointerTouch:](v48, "_paddedHitTestRectForItemContainer:forPointerTouch:", v15, objc_msgSend(v49, "_isPointerTouch"));
                v41 = SBRectContainsPoint();
                if ((v41 & v52) == 1 && v51)
                {
                  if ((CGRegionContainsPoint() & 1) == 0)
                    goto LABEL_29;
                }
                else if ((v41 & 1) != 0)
                {
                  goto LABEL_29;
                }
              }
            }
            if (v52)
            {
              v42 = SBSafeAutoreleasedRegionFromCGRect();
              if (v51)
              {
                UnionWithRegion = (const void *)CGRegionCreateUnionWithRegion();
                v51 = CFAutorelease(UnionWithRegion);
              }
              else
              {
                v51 = v42;
              }
            }
          }
          else
          {
            v9 = v39;
          }

        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      }
      while (v23);
      v15 = 0;
LABEL_29:
      v8 = v46;
      WeakRetained = v47;
      v17 = v45;
    }
    else
    {
      v15 = 0;
    }

  }
  return v15;
}

uint64_t __102__SBFluidSwitcherGestureManager__hitTestStageItemContainerForUnpinGestureWithTouch_atGestureLocation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "appLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsItem:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (CGRect)_floatingApplicationBounds
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
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

  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interfaceOrientation");
  v5 = objc_msgSend(v3, "floatingConfiguration");
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(WeakRetained, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "switcherContentController:frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", WeakRetained, v4, v5);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }
  else
  {
    v9 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

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

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  SBFluidSwitcherPanGestureRecognizer *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  BOOL v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  int v14;
  SBFluidSwitcherPanGestureRecognizer *v15;
  BOOL v16;

  v4 = (SBFluidSwitcherPanGestureRecognizer *)a3;
  -[SBFluidSwitcherGestureManager activeGestureTransaction](self, "activeGestureTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "state");
  if (!v5 || !v6 || (unint64_t)(v7 - 1) > 1)
  {
    objc_msgSend((id)SBApp, "multiDisplayUserInteractionCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeTouchDownOriginatedWindowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v11)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
        objc_msgSend(WeakRetained, "windowScene");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", v11);

        if (!v14)
          goto LABEL_28;
      }
    }
    -[SBGrabberTongue edgePullGestureRecognizer](self->_deckGrabberTongue, "edgePullGestureRecognizer");
    v15 = (SBFluidSwitcherPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();

    if (v15 == v4)
    {
      v16 = -[SBFluidSwitcherGestureManager _shouldBeginBottomEdgePanGesture:](self, "_shouldBeginBottomEdgePanGesture:", v4);
    }
    else if (self->_deckInSwitcherPanGestureRecognizer == v4)
    {
      v16 = -[SBFluidSwitcherGestureManager _shouldBeginDeckInSwitcherPanGesture:](self, "_shouldBeginDeckInSwitcherPanGesture:", v4);
    }
    else if ((SBFluidSwitcherPanGestureRecognizer *)self->_fluidScrunchGestureRecognizer == v4)
    {
      v16 = -[SBFluidSwitcherGestureManager _shouldBeginFluidScrunchGesture:](self, "_shouldBeginFluidScrunchGesture:", v4);
    }
    else if (self->_swipeUpFloatingAppGestureRecognizer == v4)
    {
      v16 = -[SBFluidSwitcherGestureManager _shouldBeginFloatingApplicationSwipeUpGesture:](self, "_shouldBeginFloatingApplicationSwipeUpGesture:", v4);
    }
    else
    {
      if (self->_moveFloatingApplicationGestureRecognizer == v4)
        goto LABEL_33;
      if (self->_pinFloatingApplicationGestureRecognizer == v4)
      {
        v16 = -[SBFluidSwitcherGestureManager _shouldBeginFloatingApplicationPinGesture:](self, "_shouldBeginFloatingApplicationPinGesture:", v4);
        goto LABEL_46;
      }
      if (self->_unpinSplitViewApplicationGestureRecognizer == v4)
      {
        v16 = -[SBFluidSwitcherGestureManager _shouldBeginSplitViewApplicationUnpinGesture:](self, "_shouldBeginSplitViewApplicationUnpinGesture:", v4);
        goto LABEL_46;
      }
      if ((SBFluidSwitcherPanGestureRecognizer *)self->_indirectBottomEdgePanGestureRecognizer == v4)
      {
        v16 = -[SBFluidSwitcherGestureManager _shouldBeginIndirectHomePanGesture:](self, "_shouldBeginIndirectHomePanGesture:", v4);
        goto LABEL_46;
      }
      if ((SBFluidSwitcherPanGestureRecognizer *)self->_sceneResizePanGestureRecognizer == v4)
      {
        v9 = 1;
        goto LABEL_47;
      }
      if ((SBFluidSwitcherPanGestureRecognizer *)self->_indirectFloatingAppScrunchGestureRecognizer == v4)
      {
        v16 = -[SBFluidSwitcherGestureManager _shouldBeginIndirectFloatingAppScrunchGesture:](self, "_shouldBeginIndirectFloatingAppScrunchGesture:", v4);
        goto LABEL_46;
      }
      if ((SBFluidSwitcherPanGestureRecognizer *)self->_indirectDismissFloatingApplicationGestureRecognizer == v4)
      {
LABEL_33:
        v16 = -[SBFluidSwitcherGestureManager _shouldBeginFloatingApplicationMoveGesture:](self, "_shouldBeginFloatingApplicationMoveGesture:", v4);
      }
      else if (self->_clickAndDragHomeGestureRecognizer == v4)
      {
        v16 = -[SBFluidSwitcherGestureManager _shouldBeginClickAndDragHomeGesture:](self, "_shouldBeginClickAndDragHomeGesture:", v4);
      }
      else if (self->_liveWindowResizeGestureRecognizer == v4)
      {
        v16 = -[SBFluidSwitcherGestureManager _shouldBeginLiveWindowResizeGesture:](self, "_shouldBeginLiveWindowResizeGesture:", v4);
      }
      else if ((SBFluidSwitcherPanGestureRecognizer *)self->_hoverGestureRecognizer == v4)
      {
        v16 = -[SBFluidSwitcherGestureManager _shouldBeginHoverGesture:](self, "_shouldBeginHoverGesture:", v4);
      }
      else if ((SBFluidSwitcherPanGestureRecognizer *)self->_tapToBringItemContainerForwardGestureRecognizer == v4)
      {
        v16 = -[SBFluidSwitcherGestureManager _shouldBeginTapToBringItemContainerForwardGesture:](self, "_shouldBeginTapToBringItemContainerForwardGesture:", v4);
      }
      else if ((SBFluidSwitcherPanGestureRecognizer *)self->_clickDownToBringItemContainerForwardGestureRecognizer == v4)
      {
        v16 = -[SBFluidSwitcherGestureManager _shouldBeginClickDownToBringItemContainerForwardGesture:](self, "_shouldBeginClickDownToBringItemContainerForwardGesture:", v4);
      }
      else if ((SBFluidSwitcherPanGestureRecognizer *)self->_indirectContinuousExposeStripOverflowGestureRecognizer == v4)
      {
        v16 = -[SBFluidSwitcherGestureManager _shouldBeginContinuousExposeStripOverflowGesture:](self, "_shouldBeginContinuousExposeStripOverflowGesture:", v4);
      }
      else
      {
        if (self->_dragContinuousExposeStripOverflowGestureRecognizer != v4)
        {
LABEL_28:
          v9 = 0;
LABEL_47:

          goto LABEL_48;
        }
        v16 = -[SBFluidSwitcherGestureManager _shouldBeginContinuousExposeStripOverflowPanGesture:](self, "_shouldBeginContinuousExposeStripOverflowPanGesture:", v4);
      }
    }
LABEL_46:
    v9 = v16;
    goto LABEL_47;
  }
  SBLogSystemGestureAppSwitcher();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[SBFluidSwitcherGestureManager gestureRecognizerShouldBegin:].cold.1(v4, v6, v8);

  v9 = 0;
LABEL_48:

  return v9;
}

- (BOOL)_shouldBeginBottomEdgePanGesture:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SBFZStackParticipant *zStackParticipant;
  id WeakRetained;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  const __CFString *v16;
  BOOL v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  __CFString *v23;
  BOOL v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SBFluidSwitcherGestureManager _currentUnlockedEnvironmentMode](self, "_currentUnlockedEnvironmentMode");
  v6 = objc_opt_class();
  -[SBGrabberTongue edgePullGestureRecognizer](self->_deckGrabberTongue, "edgePullGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "touchedEdges");
  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant && (-[SBFZStackParticipant ownsHomeGesture](zStackParticipant, "ownsHomeGesture") & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Preventing the switcher bottom edge gesture because switcher doesn't own the home gesture.", buf, 2u);
    }
    v16 = CFSTR("DeckSwitcherBottomEdgeGestureNotOwned");
  }
  else if (-[SBFluidSwitcherGestureManager _shouldAllowDeckBottomEdgeGestureToRecognizeFromEdges:](self, "_shouldAllowDeckBottomEdgeGestureToRecognizeFromEdges:", v9))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
    objc_msgSend(WeakRetained, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "systemGestureManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isGestureWithTypeAllowed:", 45);

    if ((v14 & 1) != 0)
    {
      if (v5 != 2 || !SBReduceMotion())
      {
        v16 = 0;
        v17 = 1;
        goto LABEL_20;
      }
      SBLogSystemGestureAppSwitcher();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Preventing the switcher bottom edge gesture because we're in the app switcher in Reduce Motion.", buf, 2u);
      }
      v16 = CFSTR("SwitcherBottomEdgeGesturePreventedInAppSwitcherInReduceMotion");
    }
    else
    {
      SBLogSystemGestureAppSwitcher();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Preventing the switcher bottom edge gesture because it's not allowed by the system gesture manager.", buf, 2u);
      }
      v16 = CFSTR("SwitcherBottomEdgeGestureNotAllowedBySystemGestureManager");
    }
  }
  else
  {
    SBLogSystemGestureAppSwitcher();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v26 = v9;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Preventing the switcher bottom edge gesture because the recognized edges (%ld) aren't supported.", buf, 0xCu);
    }
    v16 = CFSTR("DeckSwitcherRecognizedEdgesNotSupported");
  }

  v17 = 0;
LABEL_20:
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __66__SBFluidSwitcherGestureManager__shouldBeginBottomEdgePanGesture___block_invoke;
  v21[3] = &unk_1E8EAEAA0;
  v24 = v17;
  v22 = v4;
  v23 = (__CFString *)v16;
  v19 = v4;
  objc_msgSend(v18, "logBlock:", v21);

  return v17;
}

id __66__SBFluidSwitcherGestureManager__shouldBeginBottomEdgePanGesture___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[4];
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("[SBFluidSwitcherGestureManager _shouldBeginBottomEdgePanGesture:]");
  v11[0] = CFSTR("shouldBegin");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v11[1] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  v11[2] = CFSTR("name");
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E8EC7EC0;
  if (v4)
    v7 = (const __CFString *)v4;
  else
    v7 = &stru_1E8EC7EC0;
  v11[3] = CFSTR("failureReason");
  if (*(_QWORD *)(a1 + 40))
    v6 = *(const __CFString **)(a1 + 40);
  v12[2] = v7;
  v12[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_shouldBeginDeckInSwitcherPanGesture:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  SBFluidSwitcherPanGestureRecognizer *deckInSwitcherPanGestureRecognizer;
  id WeakRetained;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int16 v15;
  uint8_t buf[2];
  __int16 v17;

  if (SBReduceMotion())
  {
    SBLogSystemGestureAppSwitcher();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v17 = 0;
      v5 = "Preventing the in switcher gesture because reduce motion is enabled.";
      v6 = (uint8_t *)&v17;
LABEL_11:
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
    }
  }
  else if (-[SBFluidSwitcherGestureManager _currentUnlockedEnvironmentMode](self, "_currentUnlockedEnvironmentMode") == 2)
  {
    deckInSwitcherPanGestureRecognizer = self->_deckInSwitcherPanGestureRecognizer;
    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    objc_msgSend(WeakRetained, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherPanGestureRecognizer velocityInView:](deckInSwitcherPanGestureRecognizer, "velocityInView:", v9);
    v11 = v10;
    v13 = v12;

    if (fabs(v13) > fabs(v11))
      return 1;
    SBLogSystemGestureAppSwitcher();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "Preventing the in switcher gesture because we're scrolling horizontally.";
      v6 = buf;
      goto LABEL_11;
    }
  }
  else
  {
    SBLogSystemGestureAppSwitcher();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v15 = 0;
      v5 = "Preventing the in switcher gesture because we're not in in the app switcher.";
      v6 = (uint8_t *)&v15;
      goto LABEL_11;
    }
  }

  return 0;
}

- (BOOL)_shouldBeginClickAndDragHomeGesture:(id)a3
{
  id v4;
  SBFZStackParticipant *zStackParticipant;
  id WeakRetained;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  __int16 v15;
  uint8_t buf[2];

  v4 = a3;
  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant && (-[SBFZStackParticipant ownsHomeGesture](zStackParticipant, "ownsHomeGesture") & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v12 = "Preventing the click and drag home gesture because switcher doesn't own the home gesture.";
      v13 = buf;
      goto LABEL_9;
    }
LABEL_10:

    v10 = 0;
    goto LABEL_11;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemGestureManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isGestureWithTypeAllowed:", 48);

  if ((v9 & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v15 = 0;
      v12 = "Preventing the click and drag home gesture because it's not allowed by the system gesture manager.";
      v13 = (uint8_t *)&v15;
LABEL_9:
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, v12, v13, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)_shouldBeginLiveWindowResizeGesture:(id)a3
{
  id v4;
  id WeakRetained;
  SBFZStackParticipant *zStackParticipant;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  const char *v13;
  uint8_t *v14;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  uint8_t v22[16];
  __int16 v23;
  uint8_t buf[2];
  __int16 v25;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  if ((objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled") & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v25 = 0;
      v13 = "Preventing the live window resize gesture because Chamois isn't enabled.";
      v14 = (uint8_t *)&v25;
LABEL_13:
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, v13, v14, 2u);
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant && (-[SBFZStackParticipant ownsHomeGesture](zStackParticipant, "ownsHomeGesture") & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v13 = "Preventing the live window resize gesture because switcher doesn't own the home gesture.";
      v14 = buf;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  objc_msgSend(WeakRetained, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemGestureManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isGestureWithTypeAllowed:", 48);

  if ((v9 & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v23 = 0;
      v13 = "Preventing the live window resize gesture because it's not allowed by the system gesture manager.";
      v14 = (uint8_t *)&v23;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v10 = objc_loadWeakRetained((id *)&self->_switcherContentController);
  -[NSObject itemContainerToResizeUsingPointer](v10, "itemContainerToResizeUsingPointer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = 1;
  }
  else
  {
    -[NSObject view](v10, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _UISystemGestureLocationInView();
    v18 = v17;
    v20 = v19;

    v12 = 1;
    -[NSObject _itemContainerNearestLocation:environment:prioritizeForegroundedItemContainers:](v10, "_itemContainerNearestLocation:environment:prioritizeForegroundedItemContainers:", 1, 1, v18, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      SBLogSystemGestureAppSwitcher();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_INFO, "Preventing the live window resize gesture because no item container.", v22, 2u);
      }

      v12 = 0;
      v11 = 0;
    }
  }

LABEL_15:
  return v12;
}

- (BOOL)_shouldBeginTapToBringItemContainerForwardGesture:(id)a3
{
  return -[SBFluidSwitcherGestureManager _shouldBeginBringItemContainerForwardGesture:type:](self, "_shouldBeginBringItemContainerForwardGesture:type:", a3, 20);
}

- (BOOL)_shouldBeginClickDownToBringItemContainerForwardGesture:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  uint8_t v8[16];

  v4 = a3;
  if (!-[SBFluidSwitcherGestureManager _shouldBeginBringItemContainerForwardGesture:type:](self, "_shouldBeginBringItemContainerForwardGesture:type:", v4, 21))
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  if ((objc_msgSend(v4, "modifierFlags") & 0x100000) != 0)
  {
    SBLogSystemGestureAppSwitcher();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Preventing the click down to bring item container forward gesture because the command key is pressed.", v8, 2u);
    }

    goto LABEL_7;
  }
  v5 = 1;
LABEL_8:

  return v5;
}

- (BOOL)_shouldBeginBringItemContainerForwardGesture:(id)a3 type:(unint64_t)a4
{
  id WeakRetained;
  void *v7;
  void *v8;
  SBFZStackParticipant *zStackParticipant;
  void *v10;
  char v11;
  NSObject *v12;
  const char *v13;
  BOOL v14;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  int v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeScreenController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled") & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      v13 = "Preventing the bring item container forward gesture because Chamois isn't enabled.";
      goto LABEL_15;
    }
LABEL_16:
    v14 = 0;
    goto LABEL_17;
  }
  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant && (-[SBFZStackParticipant ownsHomeGesture](zStackParticipant, "ownsHomeGesture") & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      v13 = "Preventing the bring item container forward gesture because switcher doesn't own the home gesture.";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  objc_msgSend(v7, "systemGestureManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isGestureWithTypeAllowed:", a4);

  if ((v11 & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      v13 = "Preventing the bring item container forward gesture because it's not allowed by the system gesture manager.";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (v8)
  {
    if (objc_msgSend(v8, "areAnyIconViewContextMenusShowing"))
      goto LABEL_7;
  }
  else
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "areAnyIconViewContextMenusShowing");

    if ((v17 & 1) != 0)
    {
LABEL_7:
      SBLogSystemGestureAppSwitcher();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        v13 = "Preventing the bring item container forward gesture because icon is showing context menu.";
LABEL_15:
        _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v21, 2u);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unlockedEnvironmentMode");
  v14 = v19 == 3;

  SBLogSystemGestureAppSwitcher();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v20 = CFSTR("NO");
    if (v19 == 3)
      v20 = CFSTR("YES");
    v21 = 138412290;
    v22 = v20;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Should begin bring item container forward:%@", (uint8_t *)&v21, 0xCu);
  }
LABEL_17:

  return v14;
}

- (BOOL)_shouldBeginHoverGesture:(id)a3
{
  id WeakRetained;
  SBFZStackParticipant *zStackParticipant;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  __int16 v15;
  uint8_t buf[2];
  __int16 v17;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  if ((objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled") & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v17 = 0;
      v12 = "Preventing the hover gesture because Chamois isn't enabled.";
      v13 = (uint8_t *)&v17;
LABEL_12:
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, v12, v13, 2u);
    }
LABEL_13:

    v10 = 0;
    goto LABEL_14;
  }
  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant && (-[SBFZStackParticipant ownsHomeGesture](zStackParticipant, "ownsHomeGesture") & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v12 = "Preventing the hover gesture because switcher doesn't own the home gesture.";
      v13 = buf;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(WeakRetained, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemGestureManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isGestureWithTypeAllowed:", 53);

  if ((v8 & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v15 = 0;
      v12 = "Preventing the hover gesture because it's not allowed by the system gesture manager.";
      v13 = (uint8_t *)&v15;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unlockedEnvironmentMode") == 3;

LABEL_14:
  return v10;
}

- (BOOL)_shouldBeginIndirectHomePanGesture:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  SBFZStackParticipant *zStackParticipant;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  BOOL v17;
  void *v19;
  void *v20;
  char v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  NSObject *v32;
  const char *v33;
  uint8_t *v34;
  __int16 v35;
  __int16 v36;
  __int16 v37;
  __int16 v38;
  __int16 v39;
  uint8_t buf[2];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "floatingDockController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant && (-[SBFZStackParticipant ownsHomeGesture](zStackParticipant, "ownsHomeGesture") & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v15 = "Preventing the indirect home pan gesture because switcher doesn't own the home gesture.";
      v16 = buf;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(v6, "systemGestureManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isGestureWithTypeAllowed:", 41);

  if ((v10 & 1) != 0)
  {
    +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isInSetupMode") & 1) != 0)
    {
      +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isInSetupModeReadyToExit");

      if ((v13 & 1) == 0)
      {
        SBLogSystemGestureAppSwitcher();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v38 = 0;
          v15 = "Preventing the indirect home pan gesture because Buddy is not ready to exit.";
          v16 = (uint8_t *)&v38;
LABEL_12:
          _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_INFO, v15, v16, 2u);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
    }
    else
    {

    }
    if ((objc_msgSend(v7, "isFloatingDockFullyPresented") & 1) == 0)
    {
      -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isFloatingSwitcherVisible"))
      {

      }
      else
      {
        +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isInSetupMode");

        if ((v21 & 1) == 0)
        {
          SBLogSystemGestureAppSwitcher();
          v14 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            goto LABEL_13;
          v37 = 0;
          v15 = "Preventing the indirect home pan gesture because the floating dock is not fully presented.";
          v16 = (uint8_t *)&v37;
          goto LABEL_12;
        }
      }
    }
    if (objc_msgSend(v4, "currentInputType") != 1)
    {
      v17 = 1;
      goto LABEL_15;
    }
    objc_msgSend(v7, "presentFloatingDockIndirectPanGestureRecognizer");
    v14 = objc_claimAutoreleasedReturnValue();
    BSContinuousMachTimeNow();
    v23 = v22;
    -[NSObject lastMouseActivationTimestamp](v14, "lastMouseActivationTimestamp");
    v25 = v23 - v24;
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "coverSheetSlidingViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "indirectDismissGestureRecognizer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    BSContinuousMachTimeNow();
    v30 = v29;
    objc_msgSend(v28, "lastMouseActivationTimestamp");
    if (v25 >= 0.25)
    {
      if (v30 - v31 >= 0.5)
      {
        v17 = 1;
        goto LABEL_34;
      }
      SBLogSystemGestureAppSwitcher();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v35 = 0;
        v33 = "Preventing the indirect home pan gesture because the dismiss cover sheet gesture was recently activated by a mouse.";
        v34 = (uint8_t *)&v35;
        goto LABEL_29;
      }
    }
    else
    {
      SBLogSystemGestureAppSwitcher();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v36 = 0;
        v33 = "Preventing the indirect home pan gesture because the dock gesture was recently activated by a mouse.";
        v34 = (uint8_t *)&v36;
LABEL_29:
        _os_log_impl(&dword_1D0540000, v32, OS_LOG_TYPE_INFO, v33, v34, 2u);
      }
    }

    v17 = 0;
LABEL_34:

    goto LABEL_14;
  }
  SBLogSystemGestureAppSwitcher();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v39 = 0;
    v15 = "Preventing the indirect home pan gesture because it's not allowed by the system gesture manager.";
    v16 = (uint8_t *)&v39;
    goto LABEL_12;
  }
LABEL_13:
  v17 = 0;
LABEL_14:

LABEL_15:
  return v17;
}

- (BOOL)_shouldBeginIndirectFloatingAppScrunchGesture:(id)a3
{
  BOOL v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v4 = -[SBFluidSwitcherGestureManager _shouldAllowFloatingApplicationGesture:gestureType:failureReason:](self, "_shouldAllowFloatingApplicationGesture:gestureType:failureReason:", a3, 19, &v16);
  v5 = v16;
  if (!v4)
  {
    SBLogSystemGestureAppSwitcher();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      v12 = "Preventing the floating app scrunch gesture because: %@.";
      v13 = v11;
      v14 = 12;
LABEL_8:
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_INFO, v12, buf, v14);
    }
LABEL_9:

    v10 = 0;
    goto LABEL_10;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemGestureManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isGestureWithTypeAllowed:", 19);

  if ((v9 & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v12 = "Preventing the floating app scrunch gesture because it's not allowed by the system gesture manager.";
      v13 = v11;
      v14 = 2;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v10 = 1;
LABEL_10:

  return v10;
}

- (BOOL)_shouldBeginFluidScrunchGesture:(id)a3
{
  id v4;
  SBFZStackParticipant *zStackParticipant;
  id WeakRetained;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  BOOL v13;
  __int16 v15;
  __int16 v16;
  uint8_t buf[2];

  v4 = a3;
  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant && (-[SBFZStackParticipant ownsHomeGesture](zStackParticipant, "ownsHomeGesture") & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v11 = "Preventing the scrunch gesture because switcher doesn't own the home gesture.";
      v12 = buf;
      goto LABEL_11;
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
    objc_msgSend(WeakRetained, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "systemGestureManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isGestureWithTypeAllowed:", 18);

    if ((v9 & 1) != 0)
    {
      if (!objc_msgSend((id)SBApp, "isTypingActive"))
      {
        v13 = 1;
        goto LABEL_13;
      }
      SBLogSystemGestureAppSwitcher();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v15 = 0;
        v11 = "Preventing the scrunch gesture because typing is active.";
        v12 = (uint8_t *)&v15;
LABEL_11:
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, v11, v12, 2u);
      }
    }
    else
    {
      SBLogSystemGestureAppSwitcher();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v16 = 0;
        v11 = "Preventing the scrunch gesture because it's not allowed by the system gesture manager.";
        v12 = (uint8_t *)&v16;
        goto LABEL_11;
      }
    }
  }

  v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)_shouldAllowFloatingApplicationGesture:(id)a3 gestureType:(unint64_t)a4 failureReason:(id *)a5
{
  id WeakRetained;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  __CFString *v12;
  SBFZStackParticipant *zStackParticipant;
  uint64_t v14;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  v8 = objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled");

  if (!v8)
  {
    -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherGestureManager _firstFloatingAppLayout](self, "_firstFloatingAppLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (objc_msgSend(v10, "unlockedEnvironmentMode") == 3)
      {
        if (SBPeekConfigurationIsValid(objc_msgSend(v10, "peekConfiguration")))
        {
          v9 = 0;
          v12 = CFSTR("InPeekState");
          if (!a5)
            goto LABEL_17;
        }
        else
        {
          zStackParticipant = self->_zStackParticipant;
          if (zStackParticipant)
          {
            v14 = -[SBFZStackParticipant activationState](zStackParticipant, "activationState");
            v9 = v14 == 0;
            v12 = CFSTR("NotForegroundActiveInZStack");
            if (!v14)
              v12 = 0;
            if (!a5)
              goto LABEL_17;
          }
          else
          {
            v12 = 0;
            v9 = 1;
            if (!a5)
              goto LABEL_17;
          }
        }
      }
      else
      {
        v9 = 0;
        v12 = CFSTR("NotInApplication");
        if (!a5)
          goto LABEL_17;
      }
    }
    else
    {
      v9 = 0;
      v12 = CFSTR("NoFloatingAppLayouts");
      if (!a5)
        goto LABEL_17;
    }
    *a5 = v12;
LABEL_17:

    return v9;
  }
  v9 = 0;
  *a5 = CFSTR("chamois is enabled");
  return v9;
}

- (BOOL)_shouldBeginFloatingApplicationSwipeUpGesture:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  BOOL v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = 0;
  v5 = -[SBFluidSwitcherGestureManager _shouldAllowFloatingApplicationGesture:gestureType:failureReason:](self, "_shouldAllowFloatingApplicationGesture:gestureType:failureReason:", v4, 32, &v24);
  v6 = v24;
  if (!v5)
  {
    SBLogSystemGestureAppSwitcher();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v6;
      v13 = "Preventing the floating app swipe up gesture because: %@.";
      v14 = v12;
      v15 = 12;
LABEL_8:
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_INFO, v13, buf, v15);
    }
LABEL_9:

    v11 = 0;
    goto LABEL_10;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemGestureManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isGestureWithTypeAllowed:", 32);

  if ((v10 & 1) == 0)
  {
    SBLogSystemGestureAppSwitcher();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v13 = "Preventing the floating app swipe up gesture because it's not allowed by the system gesture manager.";
      v14 = v12;
      v15 = 2;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v11 = 1;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __79__SBFluidSwitcherGestureManager__shouldBeginFloatingApplicationSwipeUpGesture___block_invoke;
  v20[3] = &unk_1E8EAEAA0;
  v23 = v11;
  v21 = v4;
  v22 = v6;
  v17 = v6;
  v18 = v4;
  objc_msgSend(v16, "logBlock:", v20);

  return v11;
}

id __79__SBFluidSwitcherGestureManager__shouldBeginFloatingApplicationSwipeUpGesture___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[4];
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("[SBFluidSwitcherGestureManager _shouldBeginFloatingApplicationSwipeUpGesture:]");
  v11[0] = CFSTR("shouldBegin");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v11[1] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  v11[2] = CFSTR("name");
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E8EC7EC0;
  if (v4)
    v7 = (const __CFString *)v4;
  else
    v7 = &stru_1E8EC7EC0;
  v11[3] = CFSTR("failureReason");
  if (*(_QWORD *)(a1 + 40))
    v6 = *(const __CFString **)(a1 + 40);
  v12[2] = v7;
  v12[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_shouldBeginFloatingApplicationPresentGesture:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  _BOOL4 v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  BOOL v12;
  id v13;
  void *v14;
  int v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  int v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  _BOOL4 v25;
  id v26;
  _BOOL4 v27;
  id v28;
  _BOOL4 v29;
  void *v30;
  id v31;
  id v32;
  void *v34;
  SBIndirectPanGestureRecognizer *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  NSObject *v40;
  SBIndirectPanGestureRecognizer *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  NSObject *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  BOOL v50;
  id v51;
  id v52;
  uint8_t buf[4];
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBGrabberTongue indirectEdgePullGestureRecognizer](self->_rightEdgeFloatingAppGrabberTongue, "indirectEdgePullGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    v6 = 42;
  else
    v6 = 25;
  v52 = 0;
  v7 = -[SBFluidSwitcherGestureManager _shouldAllowFloatingApplicationGesture:gestureType:failureReason:](self, "_shouldAllowFloatingApplicationGesture:gestureType:failureReason:", v4, v6, &v52);
  v8 = v52;
  if (!v7)
  {
    SBLogSystemGestureAppSwitcher();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v8;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "Preventing the right floating app present gesture because: %@.", buf, 0xCu);
    }

  }
  -[SBGrabberTongue indirectEdgePullGestureRecognizer](self->_leftEdgeFloatingAppGrabberTongue, "indirectEdgePullGestureRecognizer");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v20 = 0;
    v13 = v8;
    goto LABEL_22;
  }
  if (v10 == v4)
    v11 = 43;
  else
    v11 = 26;
  v51 = v8;
  v12 = -[SBFluidSwitcherGestureManager _shouldAllowFloatingApplicationGesture:gestureType:failureReason:](self, "_shouldAllowFloatingApplicationGesture:gestureType:failureReason:", v4, v11, &v51);
  v13 = v51;

  if (!v12)
  {
    SBLogSystemGestureAppSwitcher();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v13;
      v17 = "Preventing the left floating app present gesture because: %@.";
      v18 = v16;
      v19 = 12;
      goto LABEL_19;
    }
LABEL_20:

    v20 = 0;
    goto LABEL_22;
  }
  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isFloatingSwitcherVisible");

  if (v15)
  {
    SBLogSystemGestureAppSwitcher();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v17 = "Preventing the floating app present gesture because the floating switcher is presented.";
      v18 = v16;
      v19 = 2;
LABEL_19:
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_INFO, v17, buf, v19);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  v20 = 1;
LABEL_22:
  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "floatingConfiguration");

  if (v20)
  {
    if (!SBFloatingConfigurationIsStashed(v22) && v22)
    {
      SBLogSystemGestureAppSwitcher();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v24 = "Preventing the floating app present gesture because the floating app is not stashed / undefined.";
LABEL_38:
        _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_INFO, v24, buf, 2u);
        goto LABEL_39;
      }
      goto LABEL_39;
    }
    if (v10 == v4
      || (-[SBGrabberTongue edgePullGestureRecognizer](self->_leftEdgeFloatingAppGrabberTongue, "edgePullGestureRecognizer"), v26 = (id)objc_claimAutoreleasedReturnValue(), v27 = v26 == v4, v26, v27))
    {
      if (v22 != 3)
      {
        SBLogSystemGestureAppSwitcher();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v24 = "Preventing the floating app present gesture from the left edge because the floating app is not stashed on the left.";
          goto LABEL_38;
        }
LABEL_39:
        LOBYTE(v25) = 0;
        goto LABEL_40;
      }
    }
    if (v5 == v4
      || (-[SBGrabberTongue edgePullGestureRecognizer](self->_rightEdgeFloatingAppGrabberTongue, "edgePullGestureRecognizer"), v28 = (id)objc_claimAutoreleasedReturnValue(), v29 = v28 == v4, v28, v29))
    {
      if ((v22 & 0xFFFFFFFFFFFFFFFBLL) != 0)
      {
        SBLogSystemGestureAppSwitcher();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v24 = "Preventing the floating app present gesture from the right edge because the floating app is not stashed on the right.";
          goto LABEL_38;
        }
        goto LABEL_39;
      }
    }
    if (v5 != v4)
    {
      LOBYTE(v25) = 1;
LABEL_51:
      if (v10 != v4)
        goto LABEL_41;
      -[SBGrabberTongue indirectEdgePullGestureRecognizer](self->_leftEdgeFloatingAppGrabberTongue, "indirectEdgePullGestureRecognizer");
      v23 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject currentInputType](v23, "currentInputType") != 1)
      {
        LOBYTE(v25) = 1;
        goto LABEL_40;
      }
      v41 = self->_indirectDismissFloatingApplicationGestureRecognizer;
      BSContinuousMachTimeNow();
      v43 = v42;
      -[SBIndirectPanGestureRecognizer lastMouseActivationTimestamp](v41, "lastMouseActivationTimestamp");
      v45 = v44;

      LOBYTE(v25) = v43 - v45 >= 0.75;
      if (v43 - v45 >= 0.75)
      {
LABEL_40:

        goto LABEL_41;
      }
      SBLogSystemGestureAppSwitcher();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v46, OS_LOG_TYPE_INFO, "Preventing the left indirect floating app present gesture because the dismiss gesture was very recently activated with a mouse.", buf, 2u);
      }

      goto LABEL_39;
    }
    -[SBGrabberTongue indirectEdgePullGestureRecognizer](self->_rightEdgeFloatingAppGrabberTongue, "indirectEdgePullGestureRecognizer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "currentInputType") == 1
      && (v35 = self->_indirectDismissFloatingApplicationGestureRecognizer,
          BSContinuousMachTimeNow(),
          v37 = v36,
          -[SBIndirectPanGestureRecognizer lastMouseActivationTimestamp](v35, "lastMouseActivationTimestamp"),
          v39 = v38,
          v35,
          v37 - v39 < 0.75))
    {
      SBLogSystemGestureAppSwitcher();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v40, OS_LOG_TYPE_INFO, "Preventing the right indirect floating app present gesture because the dismiss gesture was very recently activated with a mouse.", buf, 2u);
      }

      v25 = 0;
    }
    else
    {
      v25 = 1;
    }

    if (v25)
      goto LABEL_51;
  }
  else
  {
    LOBYTE(v25) = 0;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __79__SBFluidSwitcherGestureManager__shouldBeginFloatingApplicationPresentGesture___block_invoke;
  v47[3] = &unk_1E8EAEAA0;
  v50 = v25;
  v48 = v4;
  v49 = v13;
  v31 = v13;
  v32 = v4;
  objc_msgSend(v30, "logBlock:", v47);

  return v25;
}

id __79__SBFluidSwitcherGestureManager__shouldBeginFloatingApplicationPresentGesture___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[4];
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("[SBFluidSwitcherGestureManager _shouldBeginFloatingApplicationPresentGesture:]");
  v11[0] = CFSTR("shouldBegin");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v11[1] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  v11[2] = CFSTR("name");
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E8EC7EC0;
  if (v4)
    v7 = (const __CFString *)v4;
  else
    v7 = &stru_1E8EC7EC0;
  v11[3] = CFSTR("failureReason");
  if (*(_QWORD *)(a1 + 40))
    v6 = *(const __CFString **)(a1 + 40);
  v12[2] = v7;
  v12[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_shouldBeginFloatingApplicationMoveGesture:(id)a3
{
  SBIndirectPanGestureRecognizer *v4;
  BOOL v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  NSObject *p_super;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  _QWORD v28[4];
  SBIndirectPanGestureRecognizer *v29;
  id v30;
  BOOL v31;
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (SBIndirectPanGestureRecognizer *)a3;
  v32 = 0;
  v5 = -[SBFluidSwitcherGestureManager _shouldAllowFloatingApplicationGesture:gestureType:failureReason:](self, "_shouldAllowFloatingApplicationGesture:gestureType:failureReason:", v4, 29, &v32);
  v6 = v32;
  if (v5)
  {
    -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isFloatingSwitcherVisible"))
    {
      v10 = 1;
      goto LABEL_11;
    }
    SBLogSystemGestureAppSwitcher();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Preventing the floating app present move because the floating switcher is presented.", buf, 2u);
    }

  }
  else
  {
    SBLogSystemGestureAppSwitcher();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v6;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "Preventing the floating app move gesture because: %@.", buf, 0xCu);
    }

    -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = 0;
LABEL_11:
  objc_msgSend(v7, "elementWithRole:", 3);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v10 || v11)
  {
    if (v10)
    {
      if (self->_indirectDismissFloatingApplicationGestureRecognizer == v4)
      {
        if (-[SBIndirectPanGestureRecognizer currentInputType](v4, "currentInputType") == 1)
        {
          -[SBFluidSwitcherGestureManager _indirectPresentFloatingAppGestureRecognizerForEdge:](self, "_indirectPresentFloatingAppGestureRecognizerForEdge:", -[SBIndirectPanGestureRecognizer activatedEdge](self->_indirectDismissFloatingApplicationGestureRecognizer, "activatedEdge"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          BSContinuousMachTimeNow();
          v16 = v15;
          objc_msgSend(v14, "lastMouseActivationTimestamp");
          v18 = v16 - v17;
          v10 = v18 >= 0.75;
          if (v18 < 0.75)
          {
            SBLogSystemGestureAppSwitcher();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_INFO, "Preventing the indirect floating app dismiss gesture because the present gesture was very recently activated with a mouse.", buf, 2u);
            }

          }
        }
        else
        {
          v10 = 1;
        }
        v20 = objc_opt_class();
        SBSafeCast(v20, v4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v10 && v21)
        {
          v23 = -[SBFluidSwitcherGestureManager _floatingConfigurationForActivatedEdge:](self, "_floatingConfigurationForActivatedEdge:", objc_msgSend(v21, "activatedEdge"));
          v24 = objc_msgSend(v7, "floatingConfiguration");
          if (SBFloatingConfigurationIsValid(v23) && v24 == v23)
          {
            LOBYTE(v10) = 1;
          }
          else
          {
            SBLogSystemGestureAppSwitcher();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_INFO, "Preventing the indirect floating app dismiss gesture because it is at the opposite end of the visible SlideOver.", buf, 2u);
            }

            LOBYTE(v10) = 0;
          }
        }

      }
      else
      {
        LOBYTE(v10) = 1;
      }
    }
    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __76__SBFluidSwitcherGestureManager__shouldBeginFloatingApplicationMoveGesture___block_invoke;
    v28[3] = &unk_1E8EAEAA0;
    v31 = v10;
    v29 = v4;
    v30 = v6;
    objc_msgSend(v26, "logBlock:", v28);

    p_super = &v29->super.super;
  }
  else
  {
    SBLogSystemGestureAppSwitcher();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, p_super, OS_LOG_TYPE_INFO, "Preventing the floating app move gesture because there's no floating app.", buf, 2u);
    }
    LOBYTE(v10) = 0;
  }

  return v10;
}

id __76__SBFluidSwitcherGestureManager__shouldBeginFloatingApplicationMoveGesture___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[4];
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("[SBFluidSwitcherGestureManager _shouldBeginFloatingApplicationMoveGesture:]");
  v11[0] = CFSTR("shouldBegin");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v11[1] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  v11[2] = CFSTR("name");
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E8EC7EC0;
  if (v4)
    v7 = (const __CFString *)v4;
  else
    v7 = &stru_1E8EC7EC0;
  v11[3] = CFSTR("failureReason");
  if (*(_QWORD *)(a1 + 40))
    v6 = *(const __CFString **)(a1 + 40);
  v12[2] = v7;
  v12[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)_floatingConfigurationForActivatedEdge:(unint64_t)a3
{
  if (a3 == 8)
  {
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      return 1;
    else
      return 2;
  }
  else if (a3 == 2)
  {
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      return 2;
    else
      return 1;
  }
  else
  {
    return 0;
  }
}

- (BOOL)_shouldBeginFloatingApplicationPinGesture:(id)a3
{
  BOOL v4;
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  BOOL v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v4 = -[SBFluidSwitcherGestureManager _shouldAllowFloatingApplicationGesture:gestureType:failureReason:](self, "_shouldAllowFloatingApplicationGesture:gestureType:failureReason:", a3, 30, &v14);
  v5 = v14;
  if (!v4)
  {
    SBLogSystemGestureAppSwitcher();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      v9 = "Preventing the floating app pin gesture because: %@.";
      v10 = v8;
      v11 = 12;
LABEL_12:
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, v9, buf, v11);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFloatingSwitcherVisible");

  if (v7)
  {
    SBLogSystemGestureAppSwitcher();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "Preventing the floating app pin gesture because the floating switcher is presented.";
LABEL_11:
      v10 = v8;
      v11 = 2;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (!-[SBFluidSwitcherDragAndDropManager shouldBeginWindowDragGesture](self->_fluidDragAndDropManager, "shouldBeginWindowDragGesture"))
  {
    SBLogSystemGestureAppSwitcher();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "Preventing the floating app pin gesture because the drag and drop interaction manager prevents it.";
      goto LABEL_11;
    }
LABEL_13:

    v12 = 0;
    goto LABEL_14;
  }
  v12 = 1;
LABEL_14:

  return v12;
}

- (BOOL)_shouldBeginSplitViewApplicationUnpinGesture:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  int v22;
  int v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint8_t buf[16];

  v4 = a3;
  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(v4, "initialTouchLeafAppLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "adjustedAppLayoutForLeafAppLayout:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (v7 && v8)
  {
    v32 = v8;
    objc_msgSend(v7, "itemForLayoutRole:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "applicationWithBundleIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v10;
    objc_msgSend(v10, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "elementWithIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v15;
    objc_msgSend(v15, "workspaceEntity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "deviceApplicationSceneEntity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v17;
    objc_msgSend(v17, "sceneHandle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_loadWeakRetained((id *)&self->_switcherController);
    objc_msgSend(v5, "appLayout");
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "windowScene");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)v20;
    -[SBDisplayItemLayoutAttributesCalculator frameForLayoutRole:inAppLayout:containerOrientation:windowScene:](self->_displayItemLayoutAttributesCalculator, "frameForLayoutRole:inAppLayout:containerOrientation:windowScene:", 1, v20, objc_msgSend(v5, "interfaceOrientation"), v28);
    objc_msgSend(WeakRetained, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");

    v22 = BSSizeEqualToSize();
    v23 = objc_msgSend(v19, "isChamoisWindowingUIEnabled");
    v24 = objc_msgSend(v19, "windowManagementStyle");
    objc_msgSend(v19, "displayIdentity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = objc_msgSend(v13, "supportsMultiWindowLayoutsForSwitcherWindowManagementStyle:displayIdentity:", v24, v25);

    if (!(_DWORD)v24
      || (objc_msgSend(v18, "screenEdgesDeferringSystemGestures") & 1) != 0 && ((v23 ^ 1 | v22) & 1) != 0
      || SBGuidedAccessIsActive())
    {
      SBLogSystemGestureAppSwitcher();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_INFO, "Preventing the split view unpin gesture because the drag and drop interaction manager prevents it.", buf, 2u);
      }

      v9 = 0;
    }
    else
    {
      v9 = 1;
    }

    v8 = v32;
  }

  return v9;
}

- (BOOL)_shouldBeginContinuousExposeStripRevealGesture:(id)a3
{
  _BOOL4 v4;
  id v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  NSObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v4 = -[SBFluidSwitcherGestureManager _areContinuousExposeStripsAvailableWithReason:](self, "_areContinuousExposeStripsAvailableWithReason:", &v12);
  v5 = v12;
  if (v4)
  {
    v11 = 0;
    v6 = -[SBFluidSwitcherGestureManager _areContinuousExposeStripsOccludedOrHiddenWithOutReason:](self, "_areContinuousExposeStripsOccludedOrHiddenWithOutReason:", &v11);
    v7 = v11;
    SBLogSystemGestureAppSwitcher();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromBOOL();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v9;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Begin continuous expose strip reveal gesture '%{public}@' because '%{public}@'", buf, 0x16u);

    }
  }
  else
  {
    SBLogSystemGestureAppSwitcher();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Won't begin continuous expose strip reveal gesture because '%{public}@'", buf, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldBeginContinuousExposeStripOverflowGesture:(id)a3
{
  _BOOL4 v4;
  id v5;
  BOOL v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v4 = -[SBFluidSwitcherGestureManager _areContinuousExposeStripsAvailableWithReason:](self, "_areContinuousExposeStripsAvailableWithReason:", &v13);
  v5 = v13;
  if (v4)
  {
    v12 = 0;
    v6 = -[SBFluidSwitcherGestureManager _areContinuousExposeStripsOccludedOrHiddenWithOutReason:](self, "_areContinuousExposeStripsOccludedOrHiddenWithOutReason:", &v12);
    v7 = v12;
    v8 = !v6;
    SBLogSystemGestureAppSwitcher();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      NSStringFromBOOL();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "Begin continuous expose strip overflow gesture '%{public}@' because '%{public}@'", buf, 0x16u);

    }
  }
  else
  {
    SBLogSystemGestureAppSwitcher();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v5;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Won't begin continuous expose strip overflow gesture because '%{public}@'", buf, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldBeginContinuousExposeStripOverflowPanGesture:(id)a3
{
  SBFluidSwitcherGestureManager *v3;
  SBFluidSwitcherViewController **p_switcherContentController;
  id v5;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  int v13;
  int v14;
  BOOL v15;
  double v16;
  double v17;
  NSObject *v19;
  const char *v20;
  uint8_t *v21;
  BOOL v22;
  __int16 v24;
  uint8_t buf[2];

  v3 = self;
  p_switcherContentController = &self->_switcherContentController;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_switcherContentController);
  objc_msgSend(WeakRetained, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "velocityInView:", v7);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v5, "locationInView:", v7);
  objc_msgSend(v7, "size");
  v12 = BSFloatLessThanOrEqualToFloat();
  LOBYTE(v3) = -[SBFluidSwitcherGestureManager _shouldBeginContinuousExposeStripOverflowGesture:](v3, "_shouldBeginContinuousExposeStripOverflowGesture:", v5);

  if ((v3 & 1) != 0)
  {
    if (v9 < 0.0)
      v13 = v12;
    else
      v13 = 0;
    if (v9 <= 0.0)
      v14 = 1;
    else
      v14 = v12;
    v15 = v13 == 1 || v14 == 0;
    v16 = fabs(v11);
    v17 = fabs(v9);
    if (!v15 && v16 <= v17)
    {
      v22 = 1;
      goto LABEL_21;
    }
    SBLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v24 = 0;
      v20 = "Preventing the reveal overflow pan gesture because we're moving out or vertically.";
      v21 = (uint8_t *)&v24;
LABEL_19:
      _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_INFO, v20, v21, 2u);
    }
  }
  else
  {
    SBLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v20 = "Preventing the reveal overflow pan gesture because the reveal overflow gesture is disabled.";
      v21 = buf;
      goto LABEL_19;
    }
  }

  v22 = 0;
LABEL_21:

  return v22;
}

- (int64_t)_gestureTypeForGestureRecognizer:(id)a3
{
  SBFluidSwitcherPanGestureRecognizer *v5;
  SBFluidSwitcherPanGestureRecognizer *v6;
  SBFluidSwitcherPanGestureRecognizer *clickAndDragHomeGestureRecognizer;
  uint64_t v8;
  void *v9;
  SBFluidSwitcherPanGestureRecognizer *v10;
  uint64_t v11;
  void *v12;
  SBFluidSwitcherPanGestureRecognizer *v13;
  SBIndirectPanGestureRecognizer *indirectDismissFloatingApplicationGestureRecognizer;
  uint64_t v15;
  void *v16;
  SBFluidSwitcherPanGestureRecognizer *v17;
  void *v18;
  int64_t v19;
  void *v20;
  int v21;
  void *v23;
  int v24;

  v5 = (SBFluidSwitcherPanGestureRecognizer *)a3;
  -[SBGrabberTongue edgePullGestureRecognizer](self->_deckGrabberTongue, "edgePullGestureRecognizer");
  v6 = (SBFluidSwitcherPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  if (v6 == v5
    || self->_deckInSwitcherPanGestureRecognizer == v5
    || (SBFluidSwitcherPanGestureRecognizer *)self->_fluidScrunchGestureRecognizer == v5
    || (SBFluidSwitcherPanGestureRecognizer *)self->_indirectBottomEdgePanGestureRecognizer == v5)
  {

  }
  else
  {
    clickAndDragHomeGestureRecognizer = self->_clickAndDragHomeGestureRecognizer;

    if (clickAndDragHomeGestureRecognizer != v5)
    {
      if (self->_swipeUpFloatingAppGestureRecognizer == v5
        || (SBFluidSwitcherPanGestureRecognizer *)self->_indirectFloatingAppScrunchGestureRecognizer == v5)
      {
        -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isFloatingSwitcherVisible");

        if (v24)
          v19 = 5;
        else
          v19 = 3;
        goto LABEL_30;
      }
      -[SBGrabberTongue edgePullGestureRecognizer](self->_rightEdgeFloatingAppGrabberTongue, "edgePullGestureRecognizer");
      v8 = objc_claimAutoreleasedReturnValue();
      if ((SBFluidSwitcherPanGestureRecognizer *)v8 != v5)
      {
        v9 = (void *)v8;
        -[SBGrabberTongue edgePullGestureRecognizer](self->_leftEdgeFloatingAppGrabberTongue, "edgePullGestureRecognizer");
        v10 = (SBFluidSwitcherPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
        if (v10 != v5 && self->_moveFloatingApplicationGestureRecognizer != v5)
        {
          -[SBGrabberTongue indirectEdgePullGestureRecognizer](self->_rightEdgeFloatingAppGrabberTongue, "indirectEdgePullGestureRecognizer");
          v11 = objc_claimAutoreleasedReturnValue();
          if ((SBFluidSwitcherPanGestureRecognizer *)v11 == v5)
          {

          }
          else
          {
            v12 = (void *)v11;
            -[SBGrabberTongue indirectEdgePullGestureRecognizer](self->_leftEdgeFloatingAppGrabberTongue, "indirectEdgePullGestureRecognizer");
            v13 = (SBFluidSwitcherPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
            if (v13 != v5)
            {
              indirectDismissFloatingApplicationGestureRecognizer = self->_indirectDismissFloatingApplicationGestureRecognizer;

              if (indirectDismissFloatingApplicationGestureRecognizer != (SBIndirectPanGestureRecognizer *)v5)
              {
                if ((SBFluidSwitcherPanGestureRecognizer *)self->_sceneResizePanGestureRecognizer == v5)
                {
                  v19 = 7;
                  goto LABEL_30;
                }
                if (self->_unpinSplitViewApplicationGestureRecognizer == v5
                  || self->_pinFloatingApplicationGestureRecognizer == v5)
                {
                  v19 = 8;
                  goto LABEL_30;
                }
                if (self->_liveWindowResizeGestureRecognizer == v5)
                {
                  v19 = 9;
                  goto LABEL_30;
                }
                -[SBGrabberTongue edgePullGestureRecognizer](self->_continuousExposeStripRevealGrabberTongue, "edgePullGestureRecognizer");
                v15 = objc_claimAutoreleasedReturnValue();
                if ((SBFluidSwitcherPanGestureRecognizer *)v15 == v5)
                {

                }
                else
                {
                  v16 = (void *)v15;
                  -[SBGrabberTongue indirectEdgePullGestureRecognizer](self->_continuousExposeStripRevealGrabberTongue, "indirectEdgePullGestureRecognizer");
                  v17 = (SBFluidSwitcherPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();

                  if (v17 != v5)
                  {
                    if ((SBFluidSwitcherPanGestureRecognizer *)self->_indirectContinuousExposeStripOverflowGestureRecognizer == v5
                      || self->_dragContinuousExposeStripOverflowGestureRecognizer == v5)
                    {
                      v19 = 11;
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherGestureManager.m"), 2710, CFSTR("Gesture recognizer (%@) doesn't correspond to a valid SBFluidSwitcherGestureType."), v5);

                      v19 = 0;
                    }
                    goto LABEL_30;
                  }
                }
                v19 = 10;
                goto LABEL_30;
              }
LABEL_38:
              v19 = 4;
              goto LABEL_30;
            }

          }
        }

        goto LABEL_38;
      }

      goto LABEL_38;
    }
  }
  if (-[SBFluidSwitcherGestureManager _currentUnlockedEnvironmentMode](self, "_currentUnlockedEnvironmentMode") == 2
    && -[SBAppSwitcherSettings effectiveSwitcherStyle](self->_appSwitcherSettings, "effectiveSwitcherStyle") == 2)
  {
    v19 = 2;
  }
  else
  {
    -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isFloatingSwitcherVisible");

    if (v21)
      v19 = 5;
    else
      v19 = 1;
  }
LABEL_30:

  return v19;
}

- (Class)_fluidSwitcherGestureTransactionClassForGestureType:(int64_t)a3
{
  void *v3;
  void *v6;

  switch(a3)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
      v3 = (void *)objc_opt_class();
      break;
    case 6:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherGestureManager.m"), 2734, CFSTR("SBFluidSwitcherGestureTypeDragAndDrop is handled by the SBFluidSwitcherDragAndDropManager."));

      v3 = 0;
      break;
    default:
      v3 = 0;
      break;
  }
  return (Class)v3;
}

- (BOOL)_isTransactionRunningForGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char isKindOfClass;

  v4 = a3;
  -[SBFluidSwitcherGestureManager _fluidSwitcherGestureTransactionClassForGestureType:](self, "_fluidSwitcherGestureTransactionClassForGestureType:", -[SBFluidSwitcherGestureManager _gestureTypeForGestureRecognizer:](self, "_gestureTypeForGestureRecognizer:", v4));
  -[SBFluidSwitcherGestureManager activeGestureTransaction](self, "activeGestureTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "gestureRecognizer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 == v4)
      isKindOfClass = objc_opt_isKindOfClass();
    else
      isKindOfClass = 0;

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)_hideGrabberAnimated:(BOOL)a3
{
  -[SBGrabberTongue dismissWithStyle:animated:](self->_deckGrabberTongue, "dismissWithStyle:animated:", 0, a3);
}

- (BOOL)_isEdgeLocationInHomeAffordanceRegion:(double)a3
{
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SBFluidSwitcherViewController **p_switcherContentController;
  uint64_t i;
  void *v11;
  id WeakRetained;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double Width;
  double v22;
  double v23;
  double v24;
  BOOL v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CGRect v34;

  v33 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = self->_currentHomeGrabberViews;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    p_switcherContentController = &self->_switcherContentController;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        WeakRetained = objc_loadWeakRetained((id *)p_switcherContentController);
        objc_msgSend(WeakRetained, "containerViewBoundsForHomeGrabberView:", v11, (_QWORD)v28);
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;

        v34.origin.x = v14;
        v34.origin.y = v16;
        v34.size.width = v18;
        v34.size.height = v20;
        Width = CGRectGetWidth(v34);
        objc_msgSend(v11, "suggestedSizeForContentWidth:");
        v23 = (Width - v22) * 0.5;
        v24 = (Width + v22) * 0.5;
        if (v23 <= a3 && v24 >= a3)
        {
          v26 = 1;
          goto LABEL_14;
        }
      }
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16, v24);
    }
    while (v7);
  }
  v26 = 0;
LABEL_14:

  return v26;
}

- (id)_deviceApplicationSceneEntityForFloatingApplicationGrabberTongue
{
  void *v2;
  _BOOL4 IsSplitView;
  uint64_t *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsSplitView = SBSpaceConfigurationIsSplitView(objc_msgSend(v2, "spaceConfiguration"));
  v4 = &SBLayoutRoleSide;
  if (!IsSplitView)
    v4 = &SBLayoutRolePrimary;
  objc_msgSend(v2, "elementWithRole:", *v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workspaceEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceApplicationSceneEntity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_edgeLocationIsOutsideFloatingApplicationGrabberFreeRegion:(double)a3
{
  id WeakRetained;
  void *v5;
  double MidY;
  CGRect v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(WeakRetained, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  MidY = CGRectGetMidY(v8);

  return MidY + 125.0 < a3 || MidY + -125.0 > a3;
}

- (BOOL)_shouldAllowDeckBottomEdgeGestureToRecognizeFromEdges:(unint64_t)a3
{
  char v3;
  void *v5;
  BOOL v6;
  id WeakRetained;
  void *v8;
  int8x8_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  uint8x8_t v15;
  int v16;
  unint64_t v17;
  _QWORD v19[2];
  void (*v20)(_QWORD *);
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  char v28;

  v3 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  if ((a3 & 4) != 0)
  {
    v6 = 1;
    v27 = 1;
  }
  else if ((a3 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[SBFluidSwitcherGestureManager _currentFloatingAppLayout](self, "_currentFloatingAppLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (v5, (v3 & 0xA) != 0))
    {
      v6 = 0;
      *((_BYTE *)v25 + 24) = 0;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
      objc_msgSend(WeakRetained, "layoutContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (int8x8_t)objc_msgSend(v8, "supportedOrientationsForGesture");

      v10 = objc_opt_class();
      -[SBGrabberTongue edgePullGestureRecognizer](self->_deckGrabberTongue, "edgePullGestureRecognizer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBSafeCast(v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "_touchInterfaceOrientation");
      v13 = _screenRegionGivenInterfaceOrientedRegion();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v20 = (void (*)(_QWORD *))__87__SBFluidSwitcherGestureManager__shouldAllowDeckBottomEdgeGestureToRecognizeFromEdges___block_invoke;
      v21 = &unk_1E8EA3890;
      v22 = &v24;
      v23 = v13;
      v14 = v19;
      if (v9)
      {
        v28 = 0;
        v15 = (uint8x8_t)vcnt_s8(v9);
        v15.i16[0] = vaddlv_u8(v15);
        v16 = v15.i32[0];
        if (v15.i32[0])
        {
          v17 = 0;
          do
          {
            if (((1 << v17) & *(_QWORD *)&v9) != 0)
            {
              v20(v14);
              if (v28)
                break;
              --v16;
            }
            if (v17 > 0x3E)
              break;
            ++v17;
          }
          while (v16 > 0);
        }
      }

      if (!*((_BYTE *)v25 + 24)
        && objc_msgSend(WeakRetained, "homeAffordanceOrientationIfMismatchedFromCurrentLayoutState"))
      {
        *((_BYTE *)v25 + 24) = (_interfaceOrientedRegionGivenScreenRegion() & 4) != 0;
      }

      v6 = *((_BYTE *)v25 + 24) != 0;
    }
  }
  _Block_object_dispose(&v24, 8);
  return v6;
}

uint64_t __87__SBFluidSwitcherGestureManager__shouldAllowDeckBottomEdgeGestureToRecognizeFromEdges___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = _interfaceOrientedRegionGivenScreenRegion();
  if ((result & 4) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)takeHiddenAssertionForHomeGrabber:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0DA9E28];
  v4 = a3;
  objc_msgSend(v3, "rootSettings");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hideForHomeGestureOwnershipAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "BSAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setHomeAffordanceInteractionEnabled:", 0);
  objc_msgSend(v4, "setHidden:forReason:withAnimationSettings:", 1, CFSTR("SBFluidSwitcherHomeGestureNotOwnedGrabberHiddenReason"), v6);

}

- (void)_clearAudioCategoryZStackPolicyAssistant
{
  -[SBAudioCategoryZStackPolicyAssistant setForegroundScenes:]((id *)&self->_zStackAudioCategoryPolicyAssistant->super.isa, 0);
}

- (void)_clearSystemApertureZStackPolicyAssistantSuppression
{
  -[SBSystemApertureZStackPolicyAssistant setForegroundExclusiveSceneHandle:homeGrabberView:]((uint64_t)self->_zStackSystemAperturePolicyAssistant, 0, 0);
}

- (void)_clearPhysicalButtonZStackPolicyAssistant
{
  -[SBPhysicalButtonZStackPolicyAssistant setForegroundScenes:]((uint64_t)self->_zStackPhysicalButtonPolicyAssistant, 0);
}

- (void)homeGrabberViewDidReceiveClick:(id)a3
{
  id v4;
  SBFZStackParticipant *zStackParticipant;
  id WeakRetained;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant && (-[SBFZStackParticipant ownsHomeGesture](zStackParticipant, "ownsHomeGesture") & 1) == 0)
  {
    SBLogSystemGesture();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Preventing the switcher from dismissing due to a home grabber click because it doesn't own the home gesture.", v8, 2u);
    }

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "fluidSwitcherGestureManager:clickReceivedForHomeGrabberView:", self, v4);

  }
}

- (BOOL)grabberTongueOrPullEnabled:(id)a3 forGestureRecognizer:(id)a4
{
  SBGrabberTongue *v6;
  id v7;
  BOOL v8;
  BOOL v9;

  v6 = (SBGrabberTongue *)a3;
  v7 = a4;
  if (self->_deckGrabberTongue == v6)
  {
    v9 = -[SBFluidSwitcherGestureManager _shouldBeginBottomEdgePanGesture:](self, "_shouldBeginBottomEdgePanGesture:", v7);
    goto LABEL_9;
  }
  if (self->_rightEdgeFloatingAppGrabberTongue == v6 || self->_leftEdgeFloatingAppGrabberTongue == v6)
  {
    v9 = -[SBFluidSwitcherGestureManager _shouldBeginFloatingApplicationPresentGesture:](self, "_shouldBeginFloatingApplicationPresentGesture:", v7);
LABEL_9:
    v8 = v9;
    goto LABEL_10;
  }
  if (self->_continuousExposeStripRevealGrabberTongue == v6)
  {
    v9 = -[SBFluidSwitcherGestureManager _shouldBeginContinuousExposeStripRevealGesture:](self, "_shouldBeginContinuousExposeStripRevealGesture:", v7);
    goto LABEL_9;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (BOOL)grabberTongue:(id)a3 shouldShowTongueOnFirstSwipeWithEdgeLocation:(double)a4
{
  SBGrabberTongue *v6;
  SBGrabberTongue *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id obj;
  id WeakRetained;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = (SBGrabberTongue *)a3;
  v7 = v6;
  if (self->_deckGrabberTongue == v6)
  {
    v20 = -[SBFluidSwitcherGestureManager _shouldProtectEdgeLocation:edge:](self, "_shouldProtectEdgeLocation:edge:", -[SBGrabberTongue screenEdge](v6, "screenEdge"), a4);
    goto LABEL_31;
  }
  if (self->_rightEdgeFloatingAppGrabberTongue == v6 || self->_leftEdgeFloatingAppGrabberTongue == v6)
  {
    -[SBFluidSwitcherGestureManager _deviceApplicationSceneEntityForFloatingApplicationGrabberTongue](self, "_deviceApplicationSceneEntityForFloatingApplicationGrabberTongue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (!v21)
      goto LABEL_22;
    objc_msgSend(v21, "sceneHandle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "screenEdgesDeferringSystemGestures");

    if (self->_rightEdgeFloatingAppGrabberTongue == v7)
    {
      v28 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
      v29 = 8;
      if (v28 == 1)
        v29 = 2;
      if ((v29 & v24) != 0)
      {
        v20 = 1;
        goto LABEL_30;
      }
    }
    objc_msgSend(v22, "application");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "info");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isTigrisLinked");

    if ((v27 & 1) == 0)
      v20 = -[SBFluidSwitcherGestureManager _edgeLocationIsOutsideFloatingApplicationGrabberFreeRegion:](self, "_edgeLocationIsOutsideFloatingApplicationGrabberFreeRegion:", a4);
    else
LABEL_22:
      v20 = 0;
LABEL_30:

    goto LABEL_31;
  }
  if (self->_continuousExposeStripRevealGrabberTongue == v6
    && -[SBFluidSwitcherGestureManager _edgeLocationIsOutsideFloatingApplicationGrabberFreeRegion:](self, "_edgeLocationIsOutsideFloatingApplicationGrabberFreeRegion:", a4))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    v8 = -[SBFluidSwitcherGestureManager _continuousExposeStripEdge](self, "_continuousExposeStripEdge");
    -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v10, "leafAppLayouts");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v11)
    {
      v12 = v11;
      v38 = v10;
      v39 = v9;
      v13 = *(_QWORD *)v43;
LABEL_8:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v14);
        objc_msgSend(WeakRetained, "visibleItemContainers", v38);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 == 8)
        {
          objc_msgSend(v17, "frame");
          objc_msgSend(WeakRetained, "view");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "frame");
          v19 = BSFloatEqualToFloat();

          if ((v19 & 1) != 0)
            goto LABEL_32;
        }
        else if (v8 == 2)
        {
          objc_msgSend(v17, "frame");
          if ((BSFloatIsZero() & 1) != 0)
          {
LABEL_32:
            objc_msgSend(v15, "itemForLayoutRole:", 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = v38;
            v32 = objc_msgSend(v38, "layoutRoleForItem:", v31);

            v9 = v39;
            objc_msgSend(v39, "elementWithRole:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "workspaceEntity");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "deviceApplicationSceneEntity");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v35)
            {
              objc_msgSend(v35, "sceneHandle");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "screenEdgesDeferringSystemGestures");

              v20 = (-[SBFluidSwitcherGestureManager _continuousExposeStripEdge](self, "_continuousExposeStripEdge") & v37) != 0;
              goto LABEL_36;
            }
            v20 = 0;
            goto LABEL_38;
          }
        }

        if (v12 == ++v14)
        {
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
          if (v12)
            goto LABEL_8;
          v20 = 0;
          v10 = v38;
          v9 = v39;
          goto LABEL_35;
        }
      }
    }
    v20 = 0;
LABEL_35:
    v35 = obj;
LABEL_36:

LABEL_38:
  }
  else
  {
    v20 = 0;
  }
LABEL_31:

  return v20;
}

- (BOOL)grabberTongue:(id)a3 shouldAllowSecondSwipeWithEdgeLocation:(double)a4
{
  SBGrabberTongue *v6;
  SBGrabberTongue *v7;
  char v8;

  v6 = (SBGrabberTongue *)a3;
  v7 = v6;
  if (self->_deckGrabberTongue == v6)
  {
    if (self->_usesHomeAffordanceRulesForGrabberTongue)
      goto LABEL_10;
    goto LABEL_8;
  }
  if (self->_rightEdgeFloatingAppGrabberTongue == v6)
  {
LABEL_8:
    if (-[SBFluidSwitcherGestureManager _shouldProtectEdgeLocation:edge:](self, "_shouldProtectEdgeLocation:edge:", -[SBGrabberTongue screenEdge](v6, "screenEdge"), a4))
    {
      goto LABEL_9;
    }
LABEL_10:
    v8 = 1;
    goto LABEL_11;
  }
  if (self->_leftEdgeFloatingAppGrabberTongue != v6
    && self->_continuousExposeStripRevealGrabberTongue == v6
    && !-[SBFluidSwitcherGestureManager _shouldProtectEdgeLocation:edge:](self, "_shouldProtectEdgeLocation:edge:", -[SBGrabberTongue screenEdge](v6, "screenEdge"), a4))
  {
    goto LABEL_10;
  }
LABEL_9:
  v8 = -[SBGrabberTongue isEdgeLocationInGrabberRegion:](v7, "isEdgeLocationInGrabberRegion:", a4);
LABEL_11:

  return v8;
}

- (BOOL)grabberTongue:(id)a3 shouldDismissTongueOnSecondSwipeWithEdgeLocation:(double)a4
{
  return self->_leftEdgeFloatingAppGrabberTongue != a3;
}

- (void)grabberTongueBeganPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  id v8;
  void *v9;
  SBGrabberTongue *v10;

  v10 = (SBGrabberTongue *)a3;
  v8 = a6;
  if (self->_deckGrabberTongue == v10)
  {
    -[SBGrabberTongue edgePullGestureRecognizer](v10, "edgePullGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherGestureManager _handleSwitcherPanGestureBegan:](self, "_handleSwitcherPanGestureBegan:", v9);
    goto LABEL_8;
  }
  if (self->_rightEdgeFloatingAppGrabberTongue == v10 || self->_leftEdgeFloatingAppGrabberTongue == v10)
  {
    -[SBFluidSwitcherGestureManager _handleFloatingAppPresentGesture:](self, "_handleFloatingAppPresentGesture:", v8);
  }
  else if (self->_continuousExposeStripRevealGrabberTongue == v10)
  {
    -[SBGrabberTongue edgePullGestureRecognizer](v10, "edgePullGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherGestureManager _handleContinuousExposeStripRevealGesture:](self, "_handleContinuousExposeStripRevealGesture:", v9);
LABEL_8:

  }
}

- (void)grabberTongueUpdatedPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  id v8;
  void *v10;
  SBGrabberTongue *v11;

  v11 = (SBGrabberTongue *)a3;
  v8 = a6;
  if (self->_deckGrabberTongue == v11)
  {
    -[SBGrabberTongue edgePullGestureRecognizer](v11, "edgePullGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherGestureManager _handleSwitcherPanGestureChanged:](self, "_handleSwitcherPanGestureChanged:", v10);
LABEL_11:

    goto LABEL_12;
  }
  if (self->_rightEdgeFloatingAppGrabberTongue == v11 || self->_leftEdgeFloatingAppGrabberTongue == v11)
  {
    -[SBFluidSwitcherGestureManager _handleFloatingAppPresentGesture:](self, "_handleFloatingAppPresentGesture:", v8);
  }
  else if (self->_continuousExposeStripRevealGrabberTongue == v11)
  {
    -[SBGrabberTongue edgePullGestureRecognizer](v11, "edgePullGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherGestureManager _handleContinuousExposeStripRevealGesture:](self, "_handleContinuousExposeStripRevealGesture:", v10);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)grabberTongueEndedPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  id v8;
  void *v9;
  SBGrabberTongue *v10;

  v10 = (SBGrabberTongue *)a3;
  v8 = a6;
  if (self->_deckGrabberTongue == v10)
  {
    -[SBGrabberTongue edgePullGestureRecognizer](v10, "edgePullGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherGestureManager _handleSwitcherPanGestureEnded:](self, "_handleSwitcherPanGestureEnded:", v9);
    goto LABEL_8;
  }
  if (self->_rightEdgeFloatingAppGrabberTongue == v10 || self->_leftEdgeFloatingAppGrabberTongue == v10)
  {
    -[SBFluidSwitcherGestureManager _handleFloatingAppPresentGesture:](self, "_handleFloatingAppPresentGesture:", v8);
  }
  else if (self->_continuousExposeStripRevealGrabberTongue == v10)
  {
    -[SBGrabberTongue edgePullGestureRecognizer](v10, "edgePullGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherGestureManager _handleContinuousExposeStripRevealGesture:](self, "_handleContinuousExposeStripRevealGesture:", v9);
LABEL_8:

  }
}

- (void)grabberTongueCanceledPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  id v8;
  void *v9;
  SBGrabberTongue *v10;

  v10 = (SBGrabberTongue *)a3;
  v8 = a6;
  if (self->_deckGrabberTongue == v10)
  {
    -[SBGrabberTongue edgePullGestureRecognizer](v10, "edgePullGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherGestureManager _handleSwitcherPanGestureEnded:](self, "_handleSwitcherPanGestureEnded:", v9);
    goto LABEL_8;
  }
  if (self->_rightEdgeFloatingAppGrabberTongue == v10 || self->_leftEdgeFloatingAppGrabberTongue == v10)
  {
    -[SBFluidSwitcherGestureManager _handleFloatingAppPresentGesture:](self, "_handleFloatingAppPresentGesture:", v8);
  }
  else if (self->_continuousExposeStripRevealGrabberTongue == v10)
  {
    -[SBGrabberTongue edgePullGestureRecognizer](v10, "edgePullGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherGestureManager _handleContinuousExposeStripRevealGesture:](self, "_handleContinuousExposeStripRevealGesture:", v9);
LABEL_8:

  }
}

- (id)customGestureRecognizerForGrabberTongue:(id)a3
{
  SBGrabberTongue *v4;
  SBGrabberTongue *v5;
  SBFluidSwitcherScreenEdgePanGestureRecognizer *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = (SBGrabberTongue *)a3;
  v5 = v4;
  if (self->_deckGrabberTongue == v4)
  {
    objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "homeButtonType");

    if (v8 == 2)
      v9 = 5;
    else
      v9 = 3;
    v6 = -[SBHomeGesturePanGestureRecognizer initWithTarget:action:type:options:]([SBFluidSwitcherScreenEdgePanGestureRecognizer alloc], "initWithTarget:action:type:options:", 0, 0, v9, 0);
    -[SBHomeGesturePanGestureRecognizer setPreventHorizontalSwipesOutsideTrapezoid:](v6, "setPreventHorizontalSwipesOutsideTrapezoid:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    -[SBFluidSwitcherScreenEdgePanGestureRecognizer setSwitcherViewController:](v6, "setSwitcherViewController:", WeakRetained);

    -[UIScreenEdgePanGestureRecognizer setEdges:](v6, "setEdges:", 15);
    -[SBHomeGestureSettings edgeAngleWindow](self->_homeGestureSettings, "edgeAngleWindow");
    -[UIScreenEdgePanGestureRecognizer _setBottomEdgeAngleWindow:](v6, "_setBottomEdgeAngleWindow:");
    v11 = &unk_1E91CF208;
    goto LABEL_18;
  }
  if (self->_rightEdgeFloatingAppGrabberTongue == v4)
  {
    v6 = -[SBScreenEdgePanGestureRecognizer initWithTarget:action:]([SBScreenEdgePanGestureRecognizer alloc], "initWithTarget:action:", 0, 0);
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      v12 = 2;
    else
      v12 = 8;
    -[UIScreenEdgePanGestureRecognizer setEdges:](v6, "setEdges:", v12);
    v11 = &unk_1E91CF220;
    goto LABEL_18;
  }
  if (self->_leftEdgeFloatingAppGrabberTongue == v4)
  {
    v6 = -[SBScreenEdgePanGestureRecognizer initWithTarget:action:]([SBScreenEdgePanGestureRecognizer alloc], "initWithTarget:action:", 0, 0);
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      v13 = 8;
    else
      v13 = 2;
    -[UIScreenEdgePanGestureRecognizer setEdges:](v6, "setEdges:", v13);
    v11 = &unk_1E91CF238;
LABEL_18:
    -[SBFluidSwitcherScreenEdgePanGestureRecognizer setAllowedTouchTypes:](v6, "setAllowedTouchTypes:", v11);
    goto LABEL_19;
  }
  if (self->_continuousExposeStripRevealGrabberTongue == v4)
  {
    v6 = -[SBScreenEdgePanGestureRecognizer initWithTarget:action:]([SBScreenEdgePanGestureRecognizer alloc], "initWithTarget:action:", 0, 0);
    -[UIScreenEdgePanGestureRecognizer setEdges:](v6, "setEdges:", -[SBFluidSwitcherGestureManager _continuousExposeStripEdge](self, "_continuousExposeStripEdge"));
    -[SBFluidSwitcherScreenEdgePanGestureRecognizer setAllowedTouchTypes:](v6, "setAllowedTouchTypes:", &unk_1E91CF250);
    -[SBFluidSwitcherScreenEdgePanGestureRecognizer setName:](v6, "setName:", CFSTR("revealContinuousExposeStripsGestureRecognizer"));
  }
  else
  {
    v6 = 0;
  }
LABEL_19:

  return v6;
}

- (id)indirectPanGestureRecognizerForGrabberTongue:(id)a3
{
  SBGrabberTongue *v4;
  SBGrabberTongue *v5;
  SBIndirectPanGestureRecognizer *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  _QWORD v14[4];
  id v15;
  id to;

  v4 = (SBGrabberTongue *)a3;
  v5 = v4;
  if (self->_rightEdgeFloatingAppGrabberTongue == v4)
  {
    v7 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1;
    v8 = 8;
    v9 = 2;
  }
  else
  {
    if (self->_leftEdgeFloatingAppGrabberTongue != v4)
    {
      if (self->_continuousExposeStripRevealGrabberTongue == v4)
      {
        v6 = -[SBIndirectPanGestureRecognizer initWithTarget:action:edges:]([SBIndirectPanGestureRecognizer alloc], "initWithTarget:action:edges:", self, sel__handleContinuousExposeStripRevealGesture_, -[SBFluidSwitcherGestureManager _continuousExposeStripEdge](self, "_continuousExposeStripEdge"));
        -[SBIndirectPanGestureRecognizer setName:](v6, "setName:", CFSTR("indirectRevealContinuousExposeStripsGestureRecognizer"));
        -[SBIndirectPanGestureRecognizer setDelegate:](v6, "setDelegate:", self);
        -[SBIndirectPanGestureRecognizer setShouldRequireGestureToStartAtEdge:](v6, "setShouldRequireGestureToStartAtEdge:", 1);
        -[SBIndirectPanGestureRecognizer setHysteresis:forInputType:](v6, "setHysteresis:forInputType:", 0, 30.0);
        -[SBIndirectPanGestureRecognizer setHysteresis:forInputType:](v6, "setHysteresis:forInputType:", 1, 10.0);
        objc_copyWeak(&to, (id *)&self->_switcherContentController);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __78__SBFluidSwitcherGestureManager_indirectPanGestureRecognizerForGrabberTongue___block_invoke_2;
        v14[3] = &unk_1E8EBD938;
        objc_copyWeak(&v15, &to);
        -[SBIndirectPanGestureRecognizer setTranslationAdjustmentBlock:](v6, "setTranslationAdjustmentBlock:", v14);
        objc_destroyWeak(&v15);
        objc_destroyWeak(&to);
      }
      else
      {
        v6 = 0;
      }
      goto LABEL_14;
    }
    v7 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1;
    v8 = 2;
    v9 = 8;
  }
  if (v7)
    v10 = v9;
  else
    v10 = v8;
  if (self->_rightEdgeFloatingAppGrabberTongue == v5)
    v11 = CFSTR("rightIndirectFloatingAppGrabberTongueGestureRecognizer");
  else
    v11 = CFSTR("leftIndirectFloatingAppGrabberTongueGestureRecognizer");
  v12 = v11;
  v6 = -[SBIndirectPanGestureRecognizer initWithTarget:action:edges:]([SBIndirectPanGestureRecognizer alloc], "initWithTarget:action:edges:", 0, 0, v10);
  -[SBIndirectPanGestureRecognizer setName:](v6, "setName:", v12);

  -[SBIndirectPanGestureRecognizer setDelegate:](v6, "setDelegate:", self);
  -[SBIndirectPanGestureRecognizer setShouldInvertXAxis:](v6, "setShouldInvertXAxis:", 1);
  -[SBIndirectPanGestureRecognizer setActivationRecognitionDistance:](v6, "setActivationRecognitionDistance:", 80.0);
  -[SBIndirectPanGestureRecognizer setShouldRequireGestureToStartAtEdge:](v6, "setShouldRequireGestureToStartAtEdge:", 1);
  -[SBIndirectPanGestureRecognizer setHysteresis:forInputType:](v6, "setHysteresis:forInputType:", 0, 30.0);
  -[SBIndirectPanGestureRecognizer setHysteresis:forInputType:](v6, "setHysteresis:forInputType:", 1, 10.0);
  -[SBIndirectPanGestureRecognizer setTranslationAdjustmentBlock:](v6, "setTranslationAdjustmentBlock:", &__block_literal_global_263_1);
LABEL_14:

  return v6;
}

double __78__SBFluidSwitcherGestureManager_indirectPanGestureRecognizerForGrabberTongue___block_invoke(double a1, double a2)
{
  return a1 - fabs(a2);
}

double __78__SBFluidSwitcherGestureManager_indirectPanGestureRecognizerForGrabberTongue___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  id WeakRetained;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;

    v14 = a2 - fabs(a3);
    if (a6 >= v13 * 0.5)
    {
      a2 = fmax(v14, 0.0);
    }
    else if (v14 <= 0.0)
    {
      a2 = v14;
    }
    else
    {
      a2 = 0.0;
    }
  }

  return a2;
}

- (unint64_t)indirectPanSystemGestureTypeForGrabberTongue:(id)a3
{
  SBGrabberTongue *v4;
  unint64_t v5;

  v4 = (SBGrabberTongue *)a3;
  if (self->_rightEdgeFloatingAppGrabberTongue == v4)
  {
    v5 = 42;
  }
  else if (self->_leftEdgeFloatingAppGrabberTongue == v4)
  {
    v5 = 43;
  }
  else if (self->_continuousExposeStripRevealGrabberTongue == v4)
  {
    v5 = 54;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldSuppressTongueViewForGrabberTongue:(id)a3
{
  SBGrabberTongue *v4;
  BOOL usesHomeAffordanceRulesForGrabberTongue;

  v4 = (SBGrabberTongue *)a3;
  if (self->_deckGrabberTongue == v4)
    usesHomeAffordanceRulesForGrabberTongue = self->_usesHomeAffordanceRulesForGrabberTongue;
  else
    usesHomeAffordanceRulesForGrabberTongue = self->_leftEdgeFloatingAppGrabberTongue == v4
                                           || self->_rightEdgeFloatingAppGrabberTongue == v4
                                           || self->_continuousExposeStripRevealGrabberTongue == v4;

  return usesHomeAffordanceRulesForGrabberTongue;
}

- (void)grabberTongueWillPresent:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  SBGrabberTongue *v8;

  v8 = (SBGrabberTongue *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  if (self->_deckGrabberTongue == v8)
  {
    -[SBFluidSwitcherGestureManager edgeProtectFeedbackGenerator](self, "edgeProtectFeedbackGenerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activateWithCompletionBlock:", 0);

    goto LABEL_10;
  }
  if (self->_leftEdgeFloatingAppGrabberTongue == v8)
  {
    v6 = WeakRetained;
    v7 = 2;
LABEL_9:
    objc_msgSend(v6, "presentSlideOverEdgeProtectTongueOnEdge:", v7);
    goto LABEL_10;
  }
  if (self->_rightEdgeFloatingAppGrabberTongue == v8)
  {
    v6 = WeakRetained;
    v7 = 8;
    goto LABEL_9;
  }
  if (self->_continuousExposeStripRevealGrabberTongue == v8)
    objc_msgSend(WeakRetained, "presentContinuousExposeStripEdgeProtectTongue");
LABEL_10:

}

- (void)grabberTongueWillPresentInteractively:(id)a3 withDistance:(double)a4 andVelocity:(double)a5
{
  SBGrabberTongue *v7;
  void *v8;
  SBGrabberTongue *v9;

  v7 = (SBGrabberTongue *)a3;
  if (self->_deckGrabberTongue == v7)
  {
    self->_interactivelyPresentingTongue = 1;
    if (self->_usesHomeAffordanceRulesForGrabberTongue)
    {
      v9 = v7;
      if (a4 <= 200.0)
      {
        -[SBGrabberTongue dismissWithStyle:animated:](v7, "dismissWithStyle:animated:", 0, 0);
      }
      else
      {
        -[SBGrabberTongue presentAnimated:](v7, "presentAnimated:", 0);
        if (!self->_playedEdgeProtectHaptic)
        {
          -[SBFluidSwitcherGestureManager edgeProtectFeedbackGenerator](self, "edgeProtectFeedbackGenerator");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "_privateNotificationOccurred:", 1010);

          self->_playedEdgeProtectHaptic = 1;
        }
      }
      -[SBFluidSwitcherGestureManager _updateHomeGrabberViewsWithAnimationMode:](self, "_updateHomeGrabberViewsWithAnimationMode:", 5);
      v7 = v9;
    }
  }

}

- (void)grabberTongueDidPresentInteractively:(id)a3 withDistance:(double)a4 andVelocity:(double)a5
{
  SBGrabberTongue *v8;
  void *v9;
  void *v10;
  SBGrabberTongue *v11;

  v8 = (SBGrabberTongue *)a3;
  if (self->_deckGrabberTongue == v8)
  {
    self->_interactivelyPresentingTongue = 0;
    if (self->_usesHomeAffordanceRulesForGrabberTongue)
    {
      v11 = v8;
      if (a4 > 200.0 || a5 > 150.0)
      {
        -[SBGrabberTongue presentAnimated:](v8, "presentAnimated:", 0);
        if (!self->_playedEdgeProtectHaptic)
        {
          -[SBFluidSwitcherGestureManager edgeProtectFeedbackGenerator](self, "edgeProtectFeedbackGenerator");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_privateNotificationOccurred:", 1010);

          self->_playedEdgeProtectHaptic = 1;
        }
      }
      else
      {
        -[SBGrabberTongue dismissWithStyle:animated:](v8, "dismissWithStyle:animated:", 0, 0);
      }
      -[SBFluidSwitcherGestureManager edgeProtectFeedbackGenerator](self, "edgeProtectFeedbackGenerator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deactivate");

      -[SBFluidSwitcherGestureManager _updateHomeGrabberViewsWithAnimationMode:](self, "_updateHomeGrabberViewsWithAnimationMode:", 3);
      self->_playedEdgeProtectHaptic = 0;
      v8 = v11;
    }
  }

}

- (void)grabberTongueWillDismiss:(id)a3
{
  SBGrabberTongue *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  NSHashTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (SBGrabberTongue *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  v6 = WeakRetained;
  if (self->_deckGrabberTongue != v4)
  {
    if (self->_leftEdgeFloatingAppGrabberTongue == v4)
    {
      v14 = 2;
    }
    else
    {
      if (self->_rightEdgeFloatingAppGrabberTongue != v4)
      {
        if (self->_continuousExposeStripRevealGrabberTongue == v4)
          objc_msgSend(WeakRetained, "dismissContinuousExposeStripEdgeProtectTongue");
        goto LABEL_19;
      }
      v14 = 8;
    }
    objc_msgSend(WeakRetained, "dismissSlideOverEdgeProtectTongueOnEdge:", v14);
    goto LABEL_19;
  }
  if (self->_usesHomeAffordanceRulesForGrabberTongue && !self->_interactivelyPresentingTongue)
  {
    -[SBFHomeGrabberSettings forcedProminentToThinAnimationSettings](self->_homeGrabberSettings, "forcedProminentToThinAnimationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "BSAnimationSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = self->_currentHomeGrabberViews;
    v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "updateStyleWithAnimationSettings:", v8, (_QWORD)v15);
        }
        v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
LABEL_19:

}

- (UINotificationFeedbackGenerator)edgeProtectFeedbackGenerator
{
  UINotificationFeedbackGenerator *edgeProtectFeedbackGenerator;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UINotificationFeedbackGenerator *v8;
  UINotificationFeedbackGenerator *v9;

  edgeProtectFeedbackGenerator = self->_edgeProtectFeedbackGenerator;
  if (!edgeProtectFeedbackGenerator)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA7D0]);
    v5 = (void *)MEMORY[0x1E0CEAE28];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E91D2000);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "privateConfigurationForTypes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UINotificationFeedbackGenerator *)objc_msgSend(v4, "initWithConfiguration:", v7);
    v9 = self->_edgeProtectFeedbackGenerator;
    self->_edgeProtectFeedbackGenerator = v8;

    edgeProtectFeedbackGenerator = self->_edgeProtectFeedbackGenerator;
  }
  return edgeProtectFeedbackGenerator;
}

- (BOOL)shouldAllowAutoHideForHomeGrabberView:(id)a3
{
  return self->_activeGestureTransaction == 0;
}

- (void)_updateHomeGrabberViewsWithAnimationMode:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSHashTable *obj;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[SBFHomeGrabberSettings edgeProtectAnimationSettings](self->_homeGrabberSettings, "edgeProtectAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = self->_currentHomeGrabberViews;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v13[0] = v9;
        v13[1] = 3221225472;
        v13[2] = __74__SBFluidSwitcherGestureManager__updateHomeGrabberViewsWithAnimationMode___block_invoke;
        v13[3] = &unk_1E8E9DED8;
        v13[4] = v11;
        objc_msgSend(MEMORY[0x1E0CEABB0], "sb_animateWithSettings:mode:animations:completion:", v5, a3, v13, 0);
        objc_msgSend(v11, "updateStyle");
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

uint64_t __74__SBFluidSwitcherGestureManager__updateHomeGrabberViewsWithAnimationMode___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)homeGrabberViewDidUpdateGrabberHitTestRect:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBFHomeGrabberSettings isSingleTapGatingEnabled](self->_homeGrabberSettings, "isSingleTapGatingEnabled")&& _UIHomeAffordanceSingleTapGatingEnabled())
  {
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "grabberHitTestRect");
    objc_msgSend(v4, "convertRect:toView:", v5);
    objc_msgSend(v5, "_convertRectToSceneReferenceSpace:");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[SBFluidSwitcherGestureManager _scenesForHomeGrabberView:](self, "_scenesForHomeGrabberView:", v4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18), "_homeAffordanceHostSceneComponent");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setHomeAffordanceSceneReferenceFrame:", v7, v9, v11, v13);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v16);
    }

  }
}

- (void)homeGrabberViewDidRecognizeDoubleTap:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBFHomeGrabberSettings isSingleTapGatingEnabled](self->_homeGrabberSettings, "isSingleTapGatingEnabled")&& _UIHomeAffordanceSingleTapGatingEnabled())
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[SBFluidSwitcherGestureManager _scenesForHomeGrabberView:](self, "_scenesForHomeGrabberView:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "_homeAffordanceHostSceneComponent");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "doubleTapGestureDidSucceed:", 1);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)homeGrabberViewDidFailToRecognizeDoubleTap:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBFHomeGrabberSettings isSingleTapGatingEnabled](self->_homeGrabberSettings, "isSingleTapGatingEnabled")&& _UIHomeAffordanceSingleTapGatingEnabled())
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[SBFluidSwitcherGestureManager _scenesForHomeGrabberView:](self, "_scenesForHomeGrabberView:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "_homeAffordanceHostSceneComponent");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "doubleTapGestureDidSucceed:", 0);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)bannerManager:(id)a3 willPresentPresentable:(id)a4 withTransitionCoordinator:(id)a5
{
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  char v10;
  void *v11;
  NSHashTable *presentedSceneBackedBanners;
  NSHashTable *v13;
  NSHashTable *v14;
  id v15;

  v15 = a4;
  objc_msgSend((id)SBApp, "bannerManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowSceneForPresentable:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqual:", v9))
  {

LABEL_7:
    v11 = v15;
    goto LABEL_8;
  }
  v10 = objc_opt_respondsToSelector();

  v11 = v15;
  if ((v10 & 1) != 0)
  {
    presentedSceneBackedBanners = self->_presentedSceneBackedBanners;
    if (!presentedSceneBackedBanners)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v13 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v14 = self->_presentedSceneBackedBanners;
      self->_presentedSceneBackedBanners = v13;

      presentedSceneBackedBanners = self->_presentedSceneBackedBanners;
    }
    -[NSHashTable addObject:](presentedSceneBackedBanners, "addObject:", v15);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)bannerManager:(id)a3 willDismissPresentable:(id)a4 withTransitionCoordinator:(id)a5
{
  NSHashTable *presentedSceneBackedBanners;

  -[NSHashTable removeObject:](self->_presentedSceneBackedBanners, "removeObject:", a4);
  if (!-[NSHashTable count](self->_presentedSceneBackedBanners, "count"))
  {
    presentedSceneBackedBanners = self->_presentedSceneBackedBanners;
    self->_presentedSceneBackedBanners = 0;

  }
}

- (id)_currentFloatingAppLayout
{
  void *v2;
  void *v3;

  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatingAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_currentUnlockedEnvironmentMode
{
  void *v2;
  int64_t v3;

  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unlockedEnvironmentMode");

  return v3;
}

- (id)_firstFloatingAppLayout
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(WeakRetained, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_firstObjectPassingTest:", &__block_literal_global_276);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __56__SBFluidSwitcherGestureManager__firstFloatingAppLayout__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "environment") == 2;
}

- (id)_indirectPresentFloatingAppGestureRecognizerForEdge:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a3 == 2)
  {
    v5 = 232;
  }
  else
  {
    if (a3 != 8)
      return 0;
    v5 = 224;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + v5), "indirectEdgePullGestureRecognizer", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_grabberTongueForGestureRecognizer:(id)a3
{
  id v4;
  SBGrabberTongue **p_rightEdgeFloatingAppGrabberTongue;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  SBGrabberTongue *v15;

  v4 = a3;
  p_rightEdgeFloatingAppGrabberTongue = &self->_rightEdgeFloatingAppGrabberTongue;
  -[SBGrabberTongue edgePullGestureRecognizer](self->_rightEdgeFloatingAppGrabberTongue, "edgePullGestureRecognizer");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((id)v6 == v4)
    goto LABEL_8;
  v7 = (void *)v6;
  -[SBGrabberTongue indirectEdgePullGestureRecognizer](*p_rightEdgeFloatingAppGrabberTongue, "indirectEdgePullGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
    goto LABEL_9;
  p_rightEdgeFloatingAppGrabberTongue = &self->_leftEdgeFloatingAppGrabberTongue;
  -[SBGrabberTongue edgePullGestureRecognizer](self->_leftEdgeFloatingAppGrabberTongue, "edgePullGestureRecognizer");
  v9 = objc_claimAutoreleasedReturnValue();
  if ((id)v9 == v4)
  {
LABEL_8:

    goto LABEL_9;
  }
  v10 = (void *)v9;
  -[SBGrabberTongue indirectEdgePullGestureRecognizer](*p_rightEdgeFloatingAppGrabberTongue, "indirectEdgePullGestureRecognizer");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v4)
  {
LABEL_9:
    v15 = *p_rightEdgeFloatingAppGrabberTongue;
    goto LABEL_10;
  }
  p_rightEdgeFloatingAppGrabberTongue = &self->_continuousExposeStripRevealGrabberTongue;
  -[SBGrabberTongue edgePullGestureRecognizer](self->_continuousExposeStripRevealGrabberTongue, "edgePullGestureRecognizer");
  v12 = objc_claimAutoreleasedReturnValue();
  if ((id)v12 == v4)
    goto LABEL_8;
  v13 = (void *)v12;
  -[SBGrabberTongue indirectEdgePullGestureRecognizer](*p_rightEdgeFloatingAppGrabberTongue, "indirectEdgePullGestureRecognizer");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 == v4)
    goto LABEL_9;
  v15 = 0;
LABEL_10:

  return v15;
}

- (BOOL)_isBannerOccludingRegionAtReferencePoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v5;
  void *v6;
  BOOL v7;
  CGPoint v9;
  CGRect v10;
  CGRect v11;

  y = a3.y;
  x = a3.x;
  objc_msgSend((id)SBApp, "notificationDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bannerDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isPresentingBanner"))
  {
    if ((objc_msgSend(v6, "isPresentingBannerInLongLook") & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v6, "presentedBannerScreenFrame");
      v11 = CGRectInset(v10, -30.0, -30.0);
      v9.x = x;
      v9.y = y;
      v7 = CGRectContainsPoint(v11, v9);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_areContinuousExposeStripsAvailableWithReason:(id *)a3
{
  id WeakRetained;
  id v6;
  void *v7;
  char v8;
  __CFString *v9;
  SBFZStackParticipant *zStackParticipant;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  v6 = objc_loadWeakRetained((id *)&self->_switcherController);
  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isChamoisWindowingUIEnabled"))
  {
    if ((objc_msgSend(WeakRetained, "prefersStripHiddenAndDisabled") & 1) != 0)
    {
      v8 = 0;
      v9 = CFSTR("PrefersStripHiddenAndDisabled");
    }
    else if (objc_msgSend(v7, "unlockedEnvironmentMode") == 3)
    {
      if ((objc_msgSend(v7, "isFloatingSwitcherVisible") & 1) != 0)
      {
        v8 = 0;
        v9 = CFSTR("FloatingSwitcherVisible");
      }
      else
      {
        zStackParticipant = self->_zStackParticipant;
        if (zStackParticipant && -[SBFZStackParticipant activationState](zStackParticipant, "activationState"))
        {
          v8 = 0;
          v9 = CFSTR("NotForegroundActiveInZStack");
        }
        else if (objc_msgSend(v6, "isChamoisWindowingUIEnabled"))
        {
          objc_msgSend(v7, "appLayout");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "itemForLayoutRole:", 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "applicationWithBundleIdentifier:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v9 = CFSTR("Available");
            if (v16)
            {
              v17 = objc_msgSend(v16, "alwaysMaximizedInChamois");
              if (v17)
                v9 = CFSTR("ApplicationAlwaysMaximized");
              v8 = v17 ^ 1;
            }
            else
            {
              v8 = 1;
            }

          }
          else
          {
            v8 = 1;
            v9 = CFSTR("Available");
          }

        }
        else
        {
          v8 = 0;
          v9 = CFSTR("ChamoisNotEnabled");
        }
      }
    }
    else
    {
      v8 = 0;
      v9 = CFSTR("NotInApplication");
    }
  }
  else
  {
    v8 = 0;
    v9 = CFSTR("FeatureNotEnabled");
  }
  if (a3)
    *a3 = v9;

  return v8;
}

- (BOOL)_areContinuousExposeStripsOccludedOrHiddenWithOutReason:(id *)a3
{
  id WeakRetained;
  id v6;
  int v7;
  __CFString *v8;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  SBDisplayItemLayoutAttributesCalculator *displayItemLayoutAttributesCalculator;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  v6 = objc_loadWeakRetained((id *)&self->_switcherController);
  if (objc_msgSend(v6, "isChamoisWindowingUIEnabled"))
  {
    if ((objc_msgSend(WeakRetained, "prefersStripHiddenAndDisabled") & 1) != 0)
    {
      LOBYTE(v7) = 0;
      v8 = CFSTR("PrefersStripHiddenAndDisabled");
    }
    else if ((objc_msgSend(WeakRetained, "_areContinuousExposeStripsUnoccluded") & 1) != 0)
    {
      LOBYTE(v7) = 0;
      v8 = CFSTR("StripsManuallyUnoccluded");
    }
    else if (objc_msgSend(WeakRetained, "prefersStripHidden")
           && !objc_msgSend(WeakRetained, "prefersStripHiddenAndDisabled"))
    {
      LOBYTE(v7) = 1;
      v8 = CFSTR("PrefersStripHidden");
    }
    else
    {
      -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "appLayout");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;

      objc_msgSend(WeakRetained, "chamoisLayoutAttributes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "windowScene");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v30, "interfaceOrientation");
      displayItemLayoutAttributesCalculator = self->_displayItemLayoutAttributesCalculator;
      objc_msgSend(v20, "floatingDockController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "floatingDockHeight");
      v24 = v23;
      objc_msgSend(v20, "screen");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "scale");
      -[SBDisplayItemLayoutAttributesCalculator autoLayoutSpaceForAppLayout:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:](displayItemLayoutAttributesCalculator, "autoLayoutSpaceForAppLayout:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:", v29, v28, v19, objc_msgSend(WeakRetained, "prefersStripHidden"), objc_msgSend(WeakRetained, "prefersDockHidden"), v24, v26, v12, v14, v16, v18);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v27, "isStripVisible") ^ 1;
      v8 = CFSTR("StripVisible");
    }
  }
  else
  {
    LOBYTE(v7) = 0;
    v8 = CFSTR("FeatureNotEnabled");
  }
  if (a3)
    *a3 = v8;

  return v7;
}

- (unint64_t)_continuousExposeStripEdge
{
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    return 8;
  else
    return 2;
}

- (void)_updateGestureDefaults
{
  void *v3;
  id v4;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gestureDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  self->_multitaskingGesturesRequireEducation = objc_msgSend(v4, "multitaskingGesturesRequireEducation");
  self->_multitaskingGesturesUserPreferenceIsOff = objc_msgSend(v4, "isSystemGesturesAllowed") ^ 1;

}

- (void)_updateCurrentHomeGrabberViews
{
  uint64_t v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = -[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture");
  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatingAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(WeakRetained, "homeGrabberViewForAppLayout:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "homeGrabberViewForAppLayout:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v7, "setHomeAffordanceInteractionEnabled:", v3);
    objc_msgSend(v9, "addObject:", v7);
  }
  if (v8)
  {
    objc_msgSend(v8, "setHomeAffordanceInteractionEnabled:", v3);
    objc_msgSend(v9, "addObject:", v8);
  }
  -[SBFluidSwitcherGestureManager setCurrentHomeGrabberViews:](self, "setCurrentHomeGrabberViews:", v9);

}

- (void)_updateHomeAffordanceInteraction
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  v4 = objc_msgSend(WeakRetained, "windowManagementStyle");

  if (v4 == 2)
  {
    -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unlockedEnvironmentMode");
    objc_msgSend(v5, "appLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    if (-[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture") && v6 == 3)
    {
      v9 = objc_loadWeakRetained((id *)&self->_switcherContentController);
      v8 = objc_msgSend(v9, "appLayoutContainsAnUnoccludedMaximizedDisplayItem:", v7) ^ 1;

    }
  }
  else
  {
    v8 = 0;
  }
  -[SBFHomeAffordanceInteraction setEnabled:](self->_homeAffordanceInteraction, "setEnabled:", v8);
  -[SBFHomeAffordanceInteraction setNeedsUpdate](self->_homeAffordanceInteraction, "setNeedsUpdate");
}

- (id)_scenesForHomeGrabberView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v4 = a3;
  -[SBFluidSwitcherGestureManager _currentLayoutState](self, "_currentLayoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatingAppLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(WeakRetained, "homeGrabberViewForAppLayout:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "homeGrabberViewForAppLayout:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (objc_msgSend(v4, "isEqual:", v9))
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __59__SBFluidSwitcherGestureManager__scenesForHomeGrabberView___block_invoke;
    v23[3] = &unk_1E8EABFB0;
    v24 = v5;
    v25 = v11;
    SBLayoutRoleEnumerateAppLayoutRoles(v23);

  }
  if (objc_msgSend(v4, "isEqual:", v10))
  {
    objc_msgSend(v5, "elementWithRole:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "workspaceEntity");
    v21 = v10;
    v13 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deviceApplicationSceneEntity");
    v22 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "sceneHandle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sceneIfExists");
    v17 = v9;
    v18 = v7;
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v13;
    v10 = v21;
    objc_msgSend(v11, "bs_safeAddObject:", v19);

    v7 = v18;
    v9 = v17;

    v6 = v22;
  }

  return v11;
}

void __59__SBFluidSwitcherGestureManager__scenesForHomeGrabberView___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "elementWithRole:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workspaceEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceApplicationSceneEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "bs_safeAddObject:", v6);
}

- (NSString)description
{
  return (NSString *)-[SBFluidSwitcherGestureManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFluidSwitcherGestureManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFluidSwitcherGestureManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBFluidSwitcherGestureManager *v11;

  v4 = a3;
  -[SBFluidSwitcherGestureManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__SBFluidSwitcherGestureManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __71__SBFluidSwitcherGestureManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 360), CFSTR("activeGestureTransaction"));
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  _QWORD block[5];

  if (self->_homeGestureSettings == a3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__SBFluidSwitcherGestureManager_settings_changedValueForKey___block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __61__SBFluidSwitcherGestureManager_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateSwitcherBottomEdgeGesturePresence");
  objc_msgSend(*(id *)(a1 + 32), "_updateDeckSwitcherInSwitcherGesturePresence");
  return objc_msgSend(*(id *)(a1 + 32), "_updateExclusionTrapezoidDebugView");
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(WeakRetained, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGRect)homeAffordanceFrameForHomeAffordanceInteraction:(id)a3
{
  id WeakRetained;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGFloat v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double Width;
  CGFloat v21;
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
  CGFloat rect;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(WeakRetained, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0D47488], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  rect = *MEMORY[0x1E0C9D648];
  v15 = (void *)objc_opt_class();
  v35.origin.x = v6;
  v35.origin.y = v8;
  v35.size.width = v10;
  v35.size.height = v12;
  objc_msgSend(v15, "suggestedSizeForContentWidth:withSettings:", v13, CGRectGetWidth(v35));
  v17 = v16;
  v19 = v18;
  v36.origin.x = v6;
  v36.origin.y = v8;
  v36.size.width = v10;
  v36.size.height = v12;
  Width = CGRectGetWidth(v36);
  v37.origin.x = rect;
  v37.origin.y = v14;
  v37.size.width = v17;
  v37.size.height = v19;
  v21 = (Width - CGRectGetWidth(v37)) * 0.5;
  v38.origin.x = v6;
  v38.origin.y = v8;
  v38.size.width = v10;
  v38.size.height = v12;
  CGRectGetHeight(v38);
  v39.origin.x = v21;
  v39.origin.y = v14;
  v39.size.width = v17;
  v39.size.height = v19;
  CGRectGetHeight(v39);
  objc_msgSend(v13, "edgeSpacing");
  SBScreenScale();
  BSRectRoundForScale();
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v30 = v23;
  v31 = v25;
  v32 = v27;
  v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (SBSwitcherContentViewControlling)contentViewController
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBSwitcherContentViewControlling *)v3;
}

- (BOOL)isSwitcherForegroundActive
{
  return -[SBFZStackParticipant activationState](self->_zStackParticipant, "activationState") == 0;
}

- (id)acquireSystemApertureSuppressionAssertionForBundleIdentifier:(id)a3 sceneIdentifier:(id)a4
{
  id v6;
  id v7;
  _SBFluidSwitcherSystemApertureSuppressionAssertion *v8;
  _SBFluidSwitcherSystemApertureSuppressionAssertion *v9;
  NSObject *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;
  uint8_t buf[4];
  _SBFluidSwitcherSystemApertureSuppressionAssertion *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = [_SBFluidSwitcherSystemApertureSuppressionAssertion alloc];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __110__SBFluidSwitcherGestureManager_acquireSystemApertureSuppressionAssertionForBundleIdentifier_sceneIdentifier___block_invoke;
  v15 = &unk_1E8EBDA18;
  objc_copyWeak(&v16, &location);
  v9 = -[_SBFluidSwitcherSystemApertureSuppressionAssertion initWithSceneID:bundleID:invalidationBlock:](v8, "initWithSceneID:bundleID:invalidationBlock:", v7, v6, &v12);
  -[NSMutableSet addObject:](self->_suppressionAssertions, "addObject:", v9, v12, v13, v14, v15);
  -[SBFluidSwitcherGestureManager _updateZStackParticipantWithReason:](self, "_updateZStackParticipantWithReason:", CFSTR("fluid switcher gesture manager system aperture suppression assertion creation"));
  SBLogSystemApertureController();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349570;
    v19 = v9;
    v20 = 2114;
    v21 = v6;
    v22 = 2114;
    v23 = v7;
    _os_log_debug_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEBUG, "Adding System Aperture Transition Suppression Assertion <%{public}lx> for %{public}@, %{public}@", buf, 0x20u);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v9;
}

void __110__SBFluidSwitcherGestureManager_acquireSystemApertureSuppressionAssertionForBundleIdentifier_sceneIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  NSObject *v6;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[16], "removeObject:", v3);
    objc_msgSend(v5, "_updateZStackParticipantWithReason:", CFSTR("fluid switcher gesture manager system aperture suppression assertion invalidation"));
    SBLogSystemApertureController();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __110__SBFluidSwitcherGestureManager_acquireSystemApertureSuppressionAssertionForBundleIdentifier_sceneIdentifier___block_invoke_cold_1(v3, v6);

  }
}

- (id)homeGestureBottomEdgeRecognizer
{
  return -[SBGrabberTongue edgePullGestureRecognizer](self->_deckGrabberTongue, "edgePullGestureRecognizer");
}

- (void)updateForWindowManagementStyle:(unint64_t)a3
{
  -[SBFluidSwitcherGestureManager _updateFluidDragAndDropManagerPresenceForWindowManagementStyle:](self, "_updateFluidDragAndDropManagerPresenceForWindowManagementStyle:");
  -[SBFluidSwitcherGestureManager _updateFloatingApplicationGestureRecognizerPresenceForWindowManagementStyle:](self, "_updateFloatingApplicationGestureRecognizerPresenceForWindowManagementStyle:", a3);
  -[SBFluidSwitcherGestureManager _updateChamoisGestureRecognizerPresenceForWindowManagementStyle:](self, "_updateChamoisGestureRecognizerPresenceForWindowManagementStyle:", a3);
}

- (void)presentContinuousExposeStripRevealGrabberTongueImmediately
{
  -[SBGrabberTongue presentAnimated:autoDismiss:](self->_continuousExposeStripRevealGrabberTongue, "presentAnimated:autoDismiss:", 1, 1);
}

- (void)tickleContinuousExposeStripRevealGrabberTongueIfVisible
{
  if (-[SBGrabberTongue isVisible](self->_continuousExposeStripRevealGrabberTongue, "isVisible"))
    -[SBGrabberTongue presentAnimated:autoDismiss:](self->_continuousExposeStripRevealGrabberTongue, "presentAnimated:autoDismiss:", 1, 1);
}

- (void)noteVisibleHomeAffordancesChanged
{
  -[SBFluidSwitcherGestureManager _updateCurrentHomeGrabberViews](self, "_updateCurrentHomeGrabberViews");
  -[SBFluidSwitcherGestureManager _updateHomeAffordanceInteraction](self, "_updateHomeAffordanceInteraction");
}

- (SBSwitcherController)switcherController
{
  return (SBSwitcherController *)objc_loadWeakRetained((id *)&self->_switcherController);
}

- (SBFluidSwitcherGestureManagerDelegate)delegate
{
  return (SBFluidSwitcherGestureManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SBFluidSwitcherViewController)switcherContentController
{
  return (SBFluidSwitcherViewController *)objc_loadWeakRetained((id *)&self->_switcherContentController);
}

- (void)setSwitcherContentController:(id)a3
{
  objc_storeWeak((id *)&self->_switcherContentController, a3);
}

- (SBFHomeAffordanceInteraction)homeAffordanceInteraction
{
  return self->_homeAffordanceInteraction;
}

- (void)setHomeAffordanceInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_homeAffordanceInteraction, a3);
}

- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator
{
  return self->_layoutStateTransitionCoordinator;
}

- (void)setLayoutStateTransitionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_layoutStateTransitionCoordinator, a3);
}

- (SBAppSwitcherDefaults)appSwitcherDefaults
{
  return self->_appSwitcherDefaults;
}

- (void)setAppSwitcherDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_appSwitcherDefaults, a3);
}

- (SBAppSwitcherSettings)appSwitcherSettings
{
  return self->_appSwitcherSettings;
}

- (void)setAppSwitcherSettings:(id)a3
{
  objc_storeStrong((id *)&self->_appSwitcherSettings, a3);
}

- (SBHomeGestureSettings)homeGestureSettings
{
  return self->_homeGestureSettings;
}

- (void)setHomeGestureSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureSettings, a3);
}

- (SBFHomeGrabberSettings)homeGrabberSettings
{
  return self->_homeGrabberSettings;
}

- (void)setHomeGrabberSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGrabberSettings, a3);
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_zStackParticipant, a3);
}

- (SBAudioCategoryZStackPolicyAssistant)zStackAudioCategoryPolicyAssistant
{
  return self->_zStackAudioCategoryPolicyAssistant;
}

- (void)setZStackAudioCategoryPolicyAssistant:(id)a3
{
  objc_storeStrong((id *)&self->_zStackAudioCategoryPolicyAssistant, a3);
}

- (SBSystemApertureZStackPolicyAssistant)zStackSystemAperturePolicyAssistant
{
  return self->_zStackSystemAperturePolicyAssistant;
}

- (void)setZStackSystemAperturePolicyAssistant:(id)a3
{
  objc_storeStrong((id *)&self->_zStackSystemAperturePolicyAssistant, a3);
}

- (SBPhysicalButtonZStackPolicyAssistant)zStackPhysicalButtonPolicyAssistant
{
  return self->_zStackPhysicalButtonPolicyAssistant;
}

- (void)setZStackPhysicalButtonPolicyAssistant:(id)a3
{
  objc_storeStrong((id *)&self->_zStackPhysicalButtonPolicyAssistant, a3);
}

- (NSMutableSet)suppressionAssertions
{
  return self->_suppressionAssertions;
}

- (void)setSuppressionAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_suppressionAssertions, a3);
}

- (SBFluidSwitcherPanGestureRecognizer)deckInSwitcherPanGestureRecognizer
{
  return self->_deckInSwitcherPanGestureRecognizer;
}

- (void)setDeckInSwitcherPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_deckInSwitcherPanGestureRecognizer, a3);
}

- (SBIndirectPanGestureRecognizer)indirectBottomEdgePanGestureRecognizer
{
  return self->_indirectBottomEdgePanGestureRecognizer;
}

- (void)setIndirectBottomEdgePanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_indirectBottomEdgePanGestureRecognizer, a3);
}

- (SBGrabberTongue)deckGrabberTongue
{
  return self->_deckGrabberTongue;
}

- (void)setDeckGrabberTongue:(id)a3
{
  objc_storeStrong((id *)&self->_deckGrabberTongue, a3);
}

- (BOOL)usesHomeAffordanceRulesForGrabberTongue
{
  return self->_usesHomeAffordanceRulesForGrabberTongue;
}

- (void)setUsesHomeAffordanceRulesForGrabberTongue:(BOOL)a3
{
  self->_usesHomeAffordanceRulesForGrabberTongue = a3;
}

- (BOOL)interactivelyPresentingTongue
{
  return self->_interactivelyPresentingTongue;
}

- (void)setInteractivelyPresentingTongue:(BOOL)a3
{
  self->_interactivelyPresentingTongue = a3;
}

- (BOOL)playedEdgeProtectHaptic
{
  return self->_playedEdgeProtectHaptic;
}

- (void)setPlayedEdgeProtectHaptic:(BOOL)a3
{
  self->_playedEdgeProtectHaptic = a3;
}

- (void)setEdgeProtectFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_edgeProtectFeedbackGenerator, a3);
}

- (NSTimer)delayedHomeGrabberUpdateTimer
{
  return self->_delayedHomeGrabberUpdateTimer;
}

- (void)setDelayedHomeGrabberUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_delayedHomeGrabberUpdateTimer, a3);
}

- (UIView)exclusionTrapezoidDebugView
{
  return self->_exclusionTrapezoidDebugView;
}

- (void)setExclusionTrapezoidDebugView:(id)a3
{
  objc_storeStrong((id *)&self->_exclusionTrapezoidDebugView, a3);
}

- (BOOL)shouldRubberbandGrabberViewForReduceMotion
{
  return self->_shouldRubberbandGrabberViewForReduceMotion;
}

- (void)setShouldRubberbandGrabberViewForReduceMotion:(BOOL)a3
{
  self->_shouldRubberbandGrabberViewForReduceMotion = a3;
}

- (SBFluidScrunchGestureRecognizer)fluidScrunchGestureRecognizer
{
  return self->_fluidScrunchGestureRecognizer;
}

- (void)setFluidScrunchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_fluidScrunchGestureRecognizer, a3);
}

- (SBFluidSwitcherPanGestureRecognizer)clickAndDragHomeGestureRecognizer
{
  return self->_clickAndDragHomeGestureRecognizer;
}

- (void)setClickAndDragHomeGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_clickAndDragHomeGestureRecognizer, a3);
}

- (_UIPassthroughTapGestureRecognizer)tapToBringItemContainerForwardGestureRecognizer
{
  return self->_tapToBringItemContainerForwardGestureRecognizer;
}

- (void)setTapToBringItemContainerForwardGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapToBringItemContainerForwardGestureRecognizer, a3);
}

- (UILongPressGestureRecognizer)clickDownToBringItemContainerForwardGestureRecognizer
{
  return self->_clickDownToBringItemContainerForwardGestureRecognizer;
}

- (void)setClickDownToBringItemContainerForwardGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_clickDownToBringItemContainerForwardGestureRecognizer, a3);
}

- (BOOL)multitaskingGesturesRequireEducation
{
  return self->_multitaskingGesturesRequireEducation;
}

- (void)setMultitaskingGesturesRequireEducation:(BOOL)a3
{
  self->_multitaskingGesturesRequireEducation = a3;
}

- (BOOL)multitaskingGesturesUserPreferenceIsOff
{
  return self->_multitaskingGesturesUserPreferenceIsOff;
}

- (void)setMultitaskingGesturesUserPreferenceIsOff:(BOOL)a3
{
  self->_multitaskingGesturesUserPreferenceIsOff = a3;
}

- (NSHashTable)presentedSceneBackedBanners
{
  return self->_presentedSceneBackedBanners;
}

- (void)setPresentedSceneBackedBanners:(id)a3
{
  objc_storeStrong((id *)&self->_presentedSceneBackedBanners, a3);
}

- (SBGrabberTongue)rightEdgeFloatingAppGrabberTongue
{
  return self->_rightEdgeFloatingAppGrabberTongue;
}

- (void)setRightEdgeFloatingAppGrabberTongue:(id)a3
{
  objc_storeStrong((id *)&self->_rightEdgeFloatingAppGrabberTongue, a3);
}

- (SBGrabberTongue)leftEdgeFloatingAppGrabberTongue
{
  return self->_leftEdgeFloatingAppGrabberTongue;
}

- (void)setLeftEdgeFloatingAppGrabberTongue:(id)a3
{
  objc_storeStrong((id *)&self->_leftEdgeFloatingAppGrabberTongue, a3);
}

- (SBFluidSwitcherPanGestureRecognizer)swipeUpFloatingAppGestureRecognizer
{
  return self->_swipeUpFloatingAppGestureRecognizer;
}

- (void)setSwipeUpFloatingAppGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_swipeUpFloatingAppGestureRecognizer, a3);
}

- (SBFluidSwitcherPanGestureRecognizer)moveFloatingApplicationGestureRecognizer
{
  return self->_moveFloatingApplicationGestureRecognizer;
}

- (void)setMoveFloatingApplicationGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_moveFloatingApplicationGestureRecognizer, a3);
}

- (SBIndirectPanGestureRecognizer)indirectDismissFloatingApplicationGestureRecognizer
{
  return self->_indirectDismissFloatingApplicationGestureRecognizer;
}

- (void)setIndirectDismissFloatingApplicationGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_indirectDismissFloatingApplicationGestureRecognizer, a3);
}

- (SBFluidScrunchGestureRecognizer)indirectFloatingAppScrunchGestureRecognizer
{
  return self->_indirectFloatingAppScrunchGestureRecognizer;
}

- (void)setIndirectFloatingAppScrunchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_indirectFloatingAppScrunchGestureRecognizer, a3);
}

- (SBFluidSwitcherPanGestureRecognizer)pinFloatingApplicationGestureRecognizer
{
  return self->_pinFloatingApplicationGestureRecognizer;
}

- (void)setPinFloatingApplicationGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_pinFloatingApplicationGestureRecognizer, a3);
}

- (SBFluidSwitcherPanGestureRecognizer)unpinSplitViewApplicationGestureRecognizer
{
  return self->_unpinSplitViewApplicationGestureRecognizer;
}

- (void)setUnpinSplitViewApplicationGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_unpinSplitViewApplicationGestureRecognizer, a3);
}

- (UIGestureRecognizer)windowMoveClientGateRelationshipGestureRecognizer
{
  return self->_windowMoveClientGateRelationshipGestureRecognizer;
}

- (void)setWindowMoveClientGateRelationshipGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_windowMoveClientGateRelationshipGestureRecognizer, a3);
}

- (SBPanSystemGestureRecognizer)sceneResizePanGestureRecognizer
{
  return self->_sceneResizePanGestureRecognizer;
}

- (void)setSceneResizePanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_sceneResizePanGestureRecognizer, a3);
}

- (SBFluidSwitcherDragAndDropManager)fluidDragAndDropManager
{
  return self->_fluidDragAndDropManager;
}

- (void)setFluidDragAndDropManager:(id)a3
{
  objc_storeStrong((id *)&self->_fluidDragAndDropManager, a3);
}

- (SBFluidSwitcherPanGestureRecognizer)liveWindowResizeGestureRecognizer
{
  return self->_liveWindowResizeGestureRecognizer;
}

- (void)setLiveWindowResizeGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_liveWindowResizeGestureRecognizer, a3);
}

- (SBDisplayItemLayoutAttributesCalculator)displayItemLayoutAttributesCalculator
{
  return self->_displayItemLayoutAttributesCalculator;
}

- (void)setDisplayItemLayoutAttributesCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_displayItemLayoutAttributesCalculator, a3);
}

- (UIHoverGestureRecognizer)hoverGestureRecognizer
{
  return self->_hoverGestureRecognizer;
}

- (void)setHoverGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, a3);
}

- (SBGrabberTongue)continuousExposeStripRevealGrabberTongue
{
  return self->_continuousExposeStripRevealGrabberTongue;
}

- (void)setContinuousExposeStripRevealGrabberTongue:(id)a3
{
  objc_storeStrong((id *)&self->_continuousExposeStripRevealGrabberTongue, a3);
}

- (SBIndirectPanGestureRecognizer)indirectContinuousExposeStripOverflowGestureRecognizer
{
  return self->_indirectContinuousExposeStripOverflowGestureRecognizer;
}

- (void)setIndirectContinuousExposeStripOverflowGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_indirectContinuousExposeStripOverflowGestureRecognizer, a3);
}

- (SBFluidSwitcherPanGestureRecognizer)dragContinuousExposeStripOverflowGestureRecognizer
{
  return self->_dragContinuousExposeStripOverflowGestureRecognizer;
}

- (void)setDragContinuousExposeStripOverflowGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dragContinuousExposeStripOverflowGestureRecognizer, a3);
}

- (SBDragAndDropWorkspaceTransaction)dragAndDropWorkspaceTransaction
{
  return self->_dragAndDropWorkspaceTransaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragAndDropWorkspaceTransaction, 0);
  objc_storeStrong((id *)&self->_activeGestureTransaction, 0);
  objc_storeStrong((id *)&self->_dragContinuousExposeStripOverflowGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectContinuousExposeStripOverflowGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_continuousExposeStripRevealGrabberTongue, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_displayItemLayoutAttributesCalculator, 0);
  objc_storeStrong((id *)&self->_liveWindowResizeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_fluidDragAndDropManager, 0);
  objc_storeStrong((id *)&self->_sceneResizePanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_windowMoveClientGateRelationshipGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_unpinSplitViewApplicationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pinFloatingApplicationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectFloatingAppScrunchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectDismissFloatingApplicationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_moveFloatingApplicationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_swipeUpFloatingAppGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_leftEdgeFloatingAppGrabberTongue, 0);
  objc_storeStrong((id *)&self->_rightEdgeFloatingAppGrabberTongue, 0);
  objc_storeStrong((id *)&self->_presentedSceneBackedBanners, 0);
  objc_storeStrong((id *)&self->_clickDownToBringItemContainerForwardGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapToBringItemContainerForwardGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_clickAndDragHomeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_fluidScrunchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_exclusionTrapezoidDebugView, 0);
  objc_storeStrong((id *)&self->_delayedHomeGrabberUpdateTimer, 0);
  objc_storeStrong((id *)&self->_edgeProtectFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_deckGrabberTongue, 0);
  objc_storeStrong((id *)&self->_indirectBottomEdgePanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_deckInSwitcherPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_suppressionAssertions, 0);
  objc_storeStrong((id *)&self->_zStackPhysicalButtonPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_zStackSystemAperturePolicyAssistant, 0);
  objc_storeStrong((id *)&self->_zStackAudioCategoryPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_homeGrabberSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureSettings, 0);
  objc_storeStrong((id *)&self->_appSwitcherSettings, 0);
  objc_storeStrong((id *)&self->_appSwitcherDefaults, 0);
  objc_storeStrong((id *)&self->_layoutStateTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_homeAffordanceInteraction, 0);
  objc_storeStrong((id *)&self->_currentHomeGrabberViews, 0);
  objc_destroyWeak((id *)&self->_switcherContentController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_switcherController);
}

- (void)_handleSwitcherPanGestureBegan:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  v5 = OUTLINED_FUNCTION_3_17();
  SBSystemGestureRecognizerStateDescription(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "activeGestureTransaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_19();
  OUTLINED_FUNCTION_2_22(&dword_1D0540000, v8, v9, "Switcher gesture recognizer did begin: <%{public}@:%{public}p> (%{public}@), active gesture transaction:%{public}@", v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1_18();
}

- (void)_handleSwitcherPanGestureEnded:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  v5 = OUTLINED_FUNCTION_3_17();
  SBSystemGestureRecognizerStateDescription(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "activeGestureTransaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_19();
  OUTLINED_FUNCTION_2_22(&dword_1D0540000, v8, v9, "Switcher gesture recognizer did end: <%{public}@:%{public}p> (%{public}@), active gesture transaction:%{public}@", v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1_18();
}

- (void)gestureRecognizerShouldBegin:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  objc_class *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 138544642;
  v13 = v7;
  v14 = 2050;
  v15 = a1;
  v16 = 2114;
  v17 = v8;
  v18 = 2114;
  v19 = v10;
  v20 = 2050;
  v21 = a2;
  v22 = 2114;
  v23 = v11;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "Preventing the gesture <%{public}@:%{public}p> (%{public}@) because we have a transaction responding to a gesture already: <%{public}@:%{public}p> (%{public}@)", (uint8_t *)&v12, 0x3Eu);

}

void __110__SBFluidSwitcherGestureManager_acquireSystemApertureSuppressionAssertionForBundleIdentifier_sceneIdentifier___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sceneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134349570;
  v7 = a1;
  v8 = 2114;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "Removing System Aperture Transition Suppression Assertion <%{public}lx> for %{public}@, %@", (uint8_t *)&v6, 0x20u);

}

@end
