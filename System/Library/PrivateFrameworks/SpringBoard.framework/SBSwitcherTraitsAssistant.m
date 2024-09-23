@implementation SBSwitcherTraitsAssistant

void __151__SBSwitcherTraitsAssistant_createTraitsParticipantsForLayoutElements_outParticipantsByElementIdentifier_outDelegatesByParticipant_outPrimaryDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = v6;
  if (WeakRetained && v6)
  {
    if ((a3 & 2) != 0)
    {
      if ((a3 & 1) == 0 || objc_msgSend(v6, "needsActuationForUpdateReasons:", a3))
      {
        v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
        objc_msgSend(v8, "actuateOrientationForTraitsDelegate:withContext:reasons:", v7, v9, a3);

      }
    }
    else
    {
      objc_msgSend(v6, "actuateOrientationSettingsWithContext:", 0);
    }
  }

}

- (void)createTraitsParticipantsForLayoutElements:(id)a3 outParticipantsByElementIdentifier:(id *)a4 outDelegatesByParticipant:(id *)a5 outPrimaryDelegate:(id *)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  id WeakRetained;
  void *v16;
  id v17;
  void *v18;
  SBTraitsSceneParticipantDelegate *v19;
  void *v20;
  id v21;
  id obj;
  uint64_t v24;
  id *v25;
  id *v26;
  uint64_t v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id from;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v25 = a5;
  v26 = a4;
  *a4 = 0;
  *a5 = 0;
  v21 = v9;
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v11);
    *v25 = (id)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v21;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v27)
    {
      v24 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v34 != v24)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "layoutRole");
          WeakRetained = objc_loadWeakRetained((id *)&self->_traitsArbiter);
          objc_msgSend(v13, "uniqueIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v17, "sceneHandleForLayoutElement:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = -[SBTraitsSceneParticipantDelegate initWithSceneHandle:]([SBTraitsSceneParticipantDelegate alloc], "initWithSceneHandle:", v18);
          objc_msgSend(WeakRetained, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRoleSwitcherLiveOverlay"), v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBTraitsSceneParticipantDelegate setArbiter:](v19, "setArbiter:", WeakRetained);
          -[SBTraitsSceneParticipantDelegate setParticipant:](v19, "setParticipant:", v20);
          -[SBTraitsSceneParticipantDelegate setOrientationActuationEnabled:](v19, "setOrientationActuationEnabled:", 0);
          objc_initWeak(&from, self);
          objc_initWeak(&v31, v19);
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __151__SBSwitcherTraitsAssistant_createTraitsParticipantsForLayoutElements_outParticipantsByElementIdentifier_outDelegatesByParticipant_outPrimaryDelegate___block_invoke;
          v28[3] = &unk_1E8EA76C0;
          objc_copyWeak(&v29, &from);
          objc_copyWeak(&v30, &v31);
          v28[4] = self;
          -[SBTraitsSceneParticipantDelegate setActuateOrientationAlongsideBlock:](v19, "setActuateOrientationAlongsideBlock:", v28);
          objc_msgSend(*v26, "setObject:forKey:", v20, v16);
          objc_msgSend(*v25, "setObject:forKey:", v19, v20);
          if (v14 == 1)
            *a6 = objc_retainAutorelease(v19);
          objc_destroyWeak(&v30);
          objc_destroyWeak(&v29);
          objc_destroyWeak(&v31);
          objc_destroyWeak(&from);

        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v27);
    }

  }
}

- (void)updateAllParticipants:(id)a3 withPrimaryDelegate:(id)a4 nonPrimaryPolicy:(int64_t)a5 primaryPolicy:(int64_t)a6 ownPolicy:(int64_t)a7
{
  id v12;
  SBTraitsSwitcherLiveOverlayPolicySpecifier *liveOverlaysPolicySpecifier;
  id v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  liveOverlaysPolicySpecifier = self->_liveOverlaysPolicySpecifier;
  v14 = a4;
  v15 = -[SBTraitsSwitcherLiveOverlayPolicySpecifier primaryElementResolutionPolicy](liveOverlaysPolicySpecifier, "primaryElementResolutionPolicy");
  v16 = -[SBTraitsSwitcherLiveOverlayPolicySpecifier primaryElementResolutionPolicy](self->_liveOverlaysPolicySpecifier, "primaryElementResolutionPolicy");
  v17 = -[SBTraitsSwitcherPolicySpecifier resolutionPolicy](self->_switcherPolicySpecifier, "resolutionPolicy");
  v20 = v15 != a6 || v16 != a5 || v17 != a7;
  objc_msgSend(v14, "participant");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "uniqueIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBTraitsSwitcherPolicySpecifier setResolutionPolicy:](self->_switcherPolicySpecifier, "setResolutionPolicy:", a7);
  -[SBTraitsSwitcherPolicySpecifier setPrimaryElementParticipantIdentifier:](self->_switcherPolicySpecifier, "setPrimaryElementParticipantIdentifier:", v22);
  -[SBTraitsSwitcherLiveOverlayPolicySpecifier setPrimaryElementResolutionPolicy:](self->_liveOverlaysPolicySpecifier, "setPrimaryElementResolutionPolicy:", a6);
  -[SBTraitsSwitcherLiveOverlayPolicySpecifier setPrimaryElementParticipantIdentifier:](self->_liveOverlaysPolicySpecifier, "setPrimaryElementParticipantIdentifier:", v22);
  -[SBTraitsSwitcherLiveOverlayPolicySpecifier setNonPrimaryResolutionPolicy:](self->_liveOverlaysPolicySpecifier, "setNonPrimaryResolutionPolicy:", a5);
  objc_msgSend(v12, "allKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __112__SBSwitcherTraitsAssistant_updateAllParticipants_withPrimaryDelegate_nonPrimaryPolicy_primaryPolicy_ownPolicy___block_invoke;
  v28[3] = &unk_1E8EA76E8;
  v29 = v12;
  v24 = v12;
  -[SBSwitcherTraitsAssistant _updateArbitrationForElementsParticipants:sceneHandleProviderBlock:forceResolution:reason:](self, "_updateArbitrationForElementsParticipants:sceneHandleProviderBlock:forceResolution:reason:", v23, v28, v20, CFSTR("Layout State update"));

  SBLogCommon();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    SBStringFromSwitcherOrientationPolicy(a7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    SBStringFromSwitcherLiveOverlayOrientationPolicy(a5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v31 = v26;
    v32 = 2112;
    v33 = v27;
    _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "[SwitcherOrientation] _updateParticipantsAndPoliciesWithSwitcherPolicy:[%@] nonPrimaryOverlayPolicy:[%@]", buf, 0x16u);

  }
}

- (void)_updateArbitrationForElementsParticipants:(id)a3 sceneHandleProviderBlock:(id)a4 forceResolution:(BOOL)a5 reason:(id)a6
{
  id v10;
  id v11;
  id WeakRetained;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  SBSwitcherTraitsAssistant *v19;
  id v20;
  BOOL v21;
  char v22;

  v10 = a3;
  v11 = a6;
  LOBYTE(a4) = -[SBSwitcherTraitsAssistant _updateGuidingSpecifiersIfNeededForParticipants:sceneHandleProviderBlock:](self, "_updateGuidingSpecifiersIfNeededForParticipants:sceneHandleProviderBlock:", v10, a4);
  -[SBSwitcherTraitsAssistant _addGuidingSpecifierIfNeeded](self, "_addGuidingSpecifierIfNeeded");
  WeakRetained = objc_loadWeakRetained((id *)&self->_traitsArbiter);
  v13 = objc_alloc(MEMORY[0x1E0DC0898]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __119__SBSwitcherTraitsAssistant__updateArbitrationForElementsParticipants_sceneHandleProviderBlock_forceResolution_reason___block_invoke;
  v17[3] = &unk_1E8EA77C0;
  v18 = v10;
  v19 = self;
  v20 = v11;
  v21 = a5;
  v22 = (char)a4;
  v14 = v11;
  v16 = v10;
  v15 = (void *)objc_msgSend(v13, "initWithBuilder:", v17);
  objc_msgSend(WeakRetained, "setNeedsUpdateArbitrationWithContext:", v15);

  -[SBSwitcherTraitsAssistant _evaluateIfGuidingSpecifierIsSillNeeded](self, "_evaluateIfGuidingSpecifierIsSillNeeded");
}

- (BOOL)_updateGuidingSpecifiersIfNeededForParticipants:(id)a3 sceneHandleProviderBlock:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = -[NSMutableDictionary count](self->_participantUniqueIDToAssociatedParticipantMap, "count");
  -[NSMutableDictionary removeAllObjects](self->_participantUniqueIDToAssociatedParticipantMap, "removeAllObjects");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v7[2](v7, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSwitcherTraitsAssistant _setupGuidingRelationshipIfNeededForParticipant:withSceneHandle:](self, "_setupGuidingRelationshipIfNeededForParticipant:withSceneHandle:", v14, v15, (_QWORD)v18);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v16 = (-[NSMutableDictionary count](self->_participantUniqueIDToAssociatedParticipantMap, "count") | v8) != 0;
  return v16;
}

- (void)_evaluateIfGuidingSpecifierIsSillNeeded
{
  SBTraitsPipelineBlockBasedPolicySpecifier *blockBasedPolicySpecifier;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SBTraitsPipelineBlockBasedPolicySpecifier *v9;
  TRAParticipant *guidingPortraitOnlyParticipant;
  TRAParticipant *guidingLandscapeOnlyParticipant;
  NSMutableDictionary *guidingSceneOrientationRequestParticipantsMap;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableDictionary count](self->_participantUniqueIDToAssociatedParticipantMap, "count"))
  {
    blockBasedPolicySpecifier = self->_blockBasedPolicySpecifier;
    if (blockBasedPolicySpecifier)
    {
      -[SBTraitsPipelineBlockBasedPolicySpecifier invalidate](blockBasedPolicySpecifier, "invalidate");
      -[TRAParticipant invalidate](self->_guidingPortraitOnlyParticipant, "invalidate");
      -[TRAParticipant invalidate](self->_guidingLandscapeOnlyParticipant, "invalidate");
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      -[NSMutableDictionary allValues](self->_guidingSceneOrientationRequestParticipantsMap, "allValues", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
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
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8++), "invalidate");
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v6);
      }

      v9 = self->_blockBasedPolicySpecifier;
      self->_blockBasedPolicySpecifier = 0;

      guidingPortraitOnlyParticipant = self->_guidingPortraitOnlyParticipant;
      self->_guidingPortraitOnlyParticipant = 0;

      guidingLandscapeOnlyParticipant = self->_guidingLandscapeOnlyParticipant;
      self->_guidingLandscapeOnlyParticipant = 0;

      guidingSceneOrientationRequestParticipantsMap = self->_guidingSceneOrientationRequestParticipantsMap;
      self->_guidingSceneOrientationRequestParticipantsMap = 0;

    }
  }
}

- (void)_addGuidingSpecifierIfNeeded
{
  id WeakRetained;
  SBTraitsPipelineBlockBasedPolicySpecifier *v4;
  SBTraitsPipelineBlockBasedPolicySpecifier *v5;
  SBTraitsPipelineBlockBasedPolicySpecifier *blockBasedPolicySpecifier;
  _QWORD v7[4];
  id v8;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_traitsArbiter);
  if (WeakRetained && !self->_blockBasedPolicySpecifier)
  {
    objc_initWeak(&location, self);
    v4 = [SBTraitsPipelineBlockBasedPolicySpecifier alloc];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__SBSwitcherTraitsAssistant__addGuidingSpecifierIfNeeded__block_invoke;
    v7[3] = &unk_1E8EA7798;
    objc_copyWeak(&v8, &location);
    v5 = -[SBTraitsPipelineBlockBasedPolicySpecifier initWithPolicySpecifierBlock:specifierDescription:componentOrder:arbiter:](v4, "initWithPolicySpecifierBlock:specifierDescription:componentOrder:arbiter:", v7, CFSTR("Switcher Traits Assistant"), &unk_1E91D0830, WeakRetained);
    blockBasedPolicySpecifier = self->_blockBasedPolicySpecifier;
    self->_blockBasedPolicySpecifier = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (void)_setupGuidingRelationshipIfNeededForParticipant:(id)a3 withSceneHandle:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableDictionary *participantUniqueIDToAssociatedParticipantMap;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  if (!v6)
    goto LABEL_28;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v6, "application");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(WeakRetained, "isChamoisUIEnabled");
  if ((objc_msgSend(v8, "isMedusaCapable") & 1) != 0 || (objc_msgSend(v8, "isSetup") & 1) != 0)
    goto LABEL_11;
  if (objc_msgSend(v8, "classicAppPhoneAppRunningOnPad"))
  {
    -[SBSwitcherTraitsAssistant _guidingPortraitOnlyLiveOverlay](self, "_guidingPortraitOnlyLiveOverlay");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "_classicAppPhoneOnPadSupportsOldStyleMixedOrientation")
      && objc_msgSend(v6, "_classicAppPhoneOnPadPrefersLandscape"))
    {
      -[SBSwitcherTraitsAssistant _guidingLandscapeOnlyLiveOverlay](self, "_guidingLandscapeOnlyLiveOverlay");
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }
    goto LABEL_12;
  }
  if (!objc_msgSend(WeakRetained, "isOnExtendedDisplay"))
  {
LABEL_11:
    v10 = 0;
  }
  else
  {
    if (-[SBSwitcherTraitsAssistant _isContentContainerAspectRatioPortrait](self, "_isContentContainerAspectRatioPortrait"))
    {
      -[SBSwitcherTraitsAssistant _guidingPortraitOnlyLiveOverlay](self, "_guidingPortraitOnlyLiveOverlay");
    }
    else
    {
      -[SBSwitcherTraitsAssistant _guidingLandscapeOnlyLiveOverlay](self, "_guidingLandscapeOnlyLiveOverlay");
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:
  v12 = objc_msgSend(v6, "_supportedInterfaceOrientationsFromSceneOrientationRequestSetup");
  if (v12)
  {
    -[SBSwitcherTraitsAssistant _guidingSceneOrientationRequestParticipantWithMask:](self, "_guidingSceneOrientationRequestParticipantWithMask:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  objc_msgSend(v6, "application");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isMedusaCapable") & 1) != 0)
  {

  }
  else
  {
    v15 = objc_msgSend(v8, "isSetup");

    if ((v15 & 1) == 0)
    {
      if (v9)
      {
        v16 = objc_msgSend(v6, "_interfaceOrientationFromUserResizing");
        if (v16)
        {
          if ((unint64_t)(v16 - 3) >= 2)
            -[SBSwitcherTraitsAssistant _guidingPortraitOnlyLiveOverlay](self, "_guidingPortraitOnlyLiveOverlay");
          else
            -[SBSwitcherTraitsAssistant _guidingLandscapeOnlyLiveOverlay](self, "_guidingLandscapeOnlyLiveOverlay");
          v17 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v17;
        }
      }
      else
      {
        objc_msgSend(v6, "_setInterfaceOrientationFromUserResizing:", objc_msgSend(v21, "sbf_currentOrientation"));
      }
    }
  }
  participantUniqueIDToAssociatedParticipantMap = self->_participantUniqueIDToAssociatedParticipantMap;
  if (v10)
  {
    objc_msgSend(v10, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uniqueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](participantUniqueIDToAssociatedParticipantMap, "setObject:forKey:", v19, v20);

  }
  else
  {
    objc_msgSend(v21, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](participantUniqueIDToAssociatedParticipantMap, "removeObjectForKey:", v19);
  }

LABEL_28:
}

id __112__SBSwitcherTraitsAssistant_updateAllParticipants_withPrimaryDelegate_nonPrimaryPolicy_primaryPolicy_ownPolicy___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sceneHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __119__SBSwitcherTraitsAssistant__updateArbitrationForElementsParticipants_sceneHandleProviderBlock_forceResolution_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id WeakRetained;
  void *v12;
  _BOOL8 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "uniqueIdentifier", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 80));
  objc_msgSend(WeakRetained, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v12);

  objc_msgSend(*(id *)(a1 + 40), "_addGuidingParticipantsIdentifiersToArray:", v4);
  objc_msgSend(v3, "setReason:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "setRequestingParticipantsUniqueIdentifiers:", v4);
  if (*(_BYTE *)(a1 + 56))
    v13 = 1;
  else
    v13 = *(_BYTE *)(a1 + 57) != 0;
  objc_msgSend(v3, "setForceOrientationResolution:", v13, (_QWORD)v14);

}

void __57__SBSwitcherTraitsAssistant__addGuidingSpecifierIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updateAcquiredParticipantsPolicies:", v3);

}

- (void)_updateAcquiredParticipantsPolicies:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableDictionary *participantUniqueIDToAssociatedParticipantMap;
  void *v11;
  void *v12;
  void *v13;
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
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        participantUniqueIDToAssociatedParticipantMap = self->_participantUniqueIDToAssociatedParticipantMap;
        objc_msgSend(v9, "uniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](participantUniqueIDToAssociatedParticipantMap, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoForAssociatedParticipantWithUniqueID:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setOrientationResolutionPolicyInfo:", v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (SBSwitcherTraitsAssistant)initWithTraitsArbiter:(id)a3 switcherParticipant:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBSwitcherTraitsAssistant *v11;
  SBSwitcherTraitsAssistant *v12;
  SBTraitsSwitcherPolicySpecifier *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  SBTraitsSwitcherPolicySpecifier *switcherPolicySpecifier;
  SBTraitsSwitcherLiveOverlayPolicySpecifier *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  SBTraitsSwitcherLiveOverlayPolicySpecifier *liveOverlaysPolicySpecifier;
  uint64_t v23;
  NSMutableDictionary *participantUniqueIDToAssociatedParticipantMap;
  void *v25;
  void *v26;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)SBSwitcherTraitsAssistant;
  v11 = -[SBSwitcherTraitsAssistant init](&v28, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeWeak((id *)&v12->_traitsArbiter, v8);
    objc_storeWeak((id *)&v12->_switcherParticipant, v9);
    v13 = [SBTraitsSwitcherPolicySpecifier alloc];
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v9, "currentZOrderLevel");
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SBTraitsSwitcherPolicySpecifier initWithComponentOrder:arbiter:](v13, "initWithComponentOrder:arbiter:", v15, v8);
    switcherPolicySpecifier = v12->_switcherPolicySpecifier;
    v12->_switcherPolicySpecifier = (SBTraitsSwitcherPolicySpecifier *)v16;

    v18 = [SBTraitsSwitcherLiveOverlayPolicySpecifier alloc];
    v19 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v9, "currentZOrderLevel");
    objc_msgSend(v19, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SBTraitsSwitcherLiveOverlayPolicySpecifier initWithComponentOrder:arbiter:](v18, "initWithComponentOrder:arbiter:", v20, v8);
    liveOverlaysPolicySpecifier = v12->_liveOverlaysPolicySpecifier;
    v12->_liveOverlaysPolicySpecifier = (SBTraitsSwitcherLiveOverlayPolicySpecifier *)v21;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    participantUniqueIDToAssociatedParticipantMap = v12->_participantUniqueIDToAssociatedParticipantMap;
    v12->_participantUniqueIDToAssociatedParticipantMap = (NSMutableDictionary *)v23;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v12, sel__handleUpdateRequest_, CFSTR("SBClassicPhoneSceneOrientationPreferenceChanged"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v12, sel__handleUpdateRequest_, CFSTR("SBSceneGeometryOrientationRequestChanged"), 0);

    -[SBSwitcherTraitsAssistant _setupStateCapture](v12, "_setupStateCapture");
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SBTraitsPipelineBlockBasedPolicySpecifier invalidate](self->_blockBasedPolicySpecifier, "invalidate");
  -[SBAbstractTraitsSwitcherPolicySpecifier invalidate](self->_switcherPolicySpecifier, "invalidate");
  -[SBAbstractTraitsSwitcherPolicySpecifier invalidate](self->_liveOverlaysPolicySpecifier, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)SBSwitcherTraitsAssistant;
  -[SBSwitcherTraitsAssistant dealloc](&v4, sel_dealloc);
}

- (void)_setupStateCapture
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  BSInvalidatable *v8;
  BSInvalidatable *stateCaptureInvalidatable;
  id v10;
  id location;

  v3 = (void *)MEMORY[0x1E0CB3940];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "stateCaptureTitlePreamble");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - SBSwitcherTraitsAssistant"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v10, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v8 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  stateCaptureInvalidatable = self->_stateCaptureInvalidatable;
  self->_stateCaptureInvalidatable = v8;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

id __47__SBSwitcherTraitsAssistant__setupStateCapture__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stateCaptureDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_stateCaptureDescription
{
  void *v3;
  void *v4;
  NSMutableDictionary *participantUniqueIDToAssociatedParticipantMap;
  NSMutableDictionary *guidingSceneOrientationRequestParticipantsMap;
  const __CFString *v7;
  TRAParticipant *guidingLandscapeOnlyParticipant;
  TRAParticipant *guidingPortraitOnlyParticipant;
  void *v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("Switcher orientation policy");
  SBStringFromSwitcherOrientationPolicy(-[SBTraitsSwitcherPolicySpecifier resolutionPolicy](self->_switcherPolicySpecifier, "resolutionPolicy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("Switcher live overlays orientation policy");
  SBStringFromSwitcherLiveOverlayOrientationPolicy(-[SBTraitsSwitcherLiveOverlayPolicySpecifier primaryElementResolutionPolicy](self->_liveOverlaysPolicySpecifier, "primaryElementResolutionPolicy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  guidingSceneOrientationRequestParticipantsMap = self->_guidingSceneOrientationRequestParticipantsMap;
  participantUniqueIDToAssociatedParticipantMap = self->_participantUniqueIDToAssociatedParticipantMap;
  v14[1] = v4;
  v14[2] = participantUniqueIDToAssociatedParticipantMap;
  v13[2] = CFSTR("Participants UniqueID association to guiding ones");
  v13[3] = CFSTR("Guiding Landscape participant");
  v7 = CFSTR("None");
  guidingPortraitOnlyParticipant = self->_guidingPortraitOnlyParticipant;
  guidingLandscapeOnlyParticipant = self->_guidingLandscapeOnlyParticipant;
  if (!guidingLandscapeOnlyParticipant)
    guidingLandscapeOnlyParticipant = (TRAParticipant *)CFSTR("None");
  if (!guidingPortraitOnlyParticipant)
    guidingPortraitOnlyParticipant = (TRAParticipant *)CFSTR("None");
  v14[3] = guidingLandscapeOnlyParticipant;
  v14[4] = guidingPortraitOnlyParticipant;
  v13[4] = CFSTR("Guiding Portrait participant");
  v13[5] = CFSTR("Guiding Scene Geometry Orientation Request participants");
  if (guidingSceneOrientationRequestParticipantsMap)
    v7 = (const __CFString *)guidingSceneOrientationRequestParticipantsMap;
  v14[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  TRAParticipant *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  TRAParticipant *v15;
  void *v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = (TRAParticipant *)a3;
  v7 = a4;
  v8 = v7;
  if (self->_guidingLandscapeOnlyParticipant == v6)
  {
    v16 = &__block_literal_global_85;
LABEL_16:
    objc_msgSend(v7, "updateOrientationPreferencesWithBlock:", v16);
    goto LABEL_17;
  }
  if (self->_guidingPortraitOnlyParticipant == v6)
  {
    v16 = &__block_literal_global_37_0;
    goto LABEL_16;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allKeys](self->_guidingSceneOrientationRequestParticipantsMap, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_guidingSceneOrientationRequestParticipantsMap, "objectForKey:", v14);
        v15 = (TRAParticipant *)objc_claimAutoreleasedReturnValue();
        if (v15 == v6)
        {
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __69__SBSwitcherTraitsAssistant_updatePreferencesForParticipant_updater___block_invoke_3;
          v17[3] = &unk_1E8EA7770;
          v17[4] = v14;
          objc_msgSend(v8, "updateOrientationPreferencesWithBlock:", v17);

          goto LABEL_14;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_14:

LABEL_17:
}

uint64_t __69__SBSwitcherTraitsAssistant_updatePreferencesForParticipant_updater___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSupportedOrientations:", 24);
}

uint64_t __69__SBSwitcherTraitsAssistant_updatePreferencesForParticipant_updater___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSupportedOrientations:", 6);
}

void __69__SBSwitcherTraitsAssistant_updatePreferencesForParticipant_updater___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setSupportedOrientations:", objc_msgSend(v2, "unsignedIntValue"));

}

- (BOOL)_isContentContainerAspectRatioPortrait
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "contentContainerAspectRatio");
  v3 = BSFloatLessThanOrEqualToFloat();

  return v3;
}

- (id)_guidingLandscapeOnlyLiveOverlay
{
  TRAParticipant *guidingLandscapeOnlyParticipant;
  id WeakRetained;
  TRAParticipant *v5;
  TRAParticipant *v6;

  guidingLandscapeOnlyParticipant = self->_guidingLandscapeOnlyParticipant;
  if (!guidingLandscapeOnlyParticipant)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_traitsArbiter);
    objc_msgSend(WeakRetained, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRoleSwitcherLiveOverlay"), self);
    v5 = (TRAParticipant *)objc_claimAutoreleasedReturnValue();
    v6 = self->_guidingLandscapeOnlyParticipant;
    self->_guidingLandscapeOnlyParticipant = v5;

    guidingLandscapeOnlyParticipant = self->_guidingLandscapeOnlyParticipant;
  }
  return guidingLandscapeOnlyParticipant;
}

- (id)_guidingPortraitOnlyLiveOverlay
{
  TRAParticipant *guidingPortraitOnlyParticipant;
  id WeakRetained;
  TRAParticipant *v5;
  TRAParticipant *v6;

  guidingPortraitOnlyParticipant = self->_guidingPortraitOnlyParticipant;
  if (!guidingPortraitOnlyParticipant)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_traitsArbiter);
    objc_msgSend(WeakRetained, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRoleSwitcherLiveOverlay"), self);
    v5 = (TRAParticipant *)objc_claimAutoreleasedReturnValue();
    v6 = self->_guidingPortraitOnlyParticipant;
    self->_guidingPortraitOnlyParticipant = v5;

    guidingPortraitOnlyParticipant = self->_guidingPortraitOnlyParticipant;
  }
  return guidingPortraitOnlyParticipant;
}

- (id)_guidingSceneOrientationRequestParticipantWithMask:(unint64_t)a3
{
  NSMutableDictionary *guidingSceneOrientationRequestParticipantsMap;
  void *v6;
  void *v7;
  id WeakRetained;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;

  guidingSceneOrientationRequestParticipantsMap = self->_guidingSceneOrientationRequestParticipantsMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](guidingSceneOrientationRequestParticipantsMap, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_traitsArbiter);
    objc_msgSend(WeakRetained, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRoleSwitcherLiveOverlay"), self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v9 = self->_guidingSceneOrientationRequestParticipantsMap;
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v11 = self->_guidingSceneOrientationRequestParticipantsMap;
        self->_guidingSceneOrientationRequestParticipantsMap = v10;

        v9 = self->_guidingSceneOrientationRequestParticipantsMap;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v7, v12);

    }
  }
  return v7;
}

- (void)_addGuidingParticipantsIdentifiersToArray:(id)a3
{
  id v4;
  TRAParticipant *guidingPortraitOnlyParticipant;
  void *v6;
  TRAParticipant *guidingLandscapeOnlyParticipant;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  guidingPortraitOnlyParticipant = self->_guidingPortraitOnlyParticipant;
  if (guidingPortraitOnlyParticipant)
  {
    -[TRAParticipant uniqueIdentifier](guidingPortraitOnlyParticipant, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  guidingLandscapeOnlyParticipant = self->_guidingLandscapeOnlyParticipant;
  if (guidingLandscapeOnlyParticipant)
  {
    -[TRAParticipant uniqueIdentifier](guidingLandscapeOnlyParticipant, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_guidingSceneOrientationRequestParticipantsMap, "allValues", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13), "uniqueIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (void)_handleUpdateRequest:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "currentElementsParticipants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SBSwitcherTraitsAssistant__handleUpdateRequest___block_invoke;
  v7[3] = &unk_1E8EA76E8;
  v8 = WeakRetained;
  v6 = WeakRetained;
  -[SBSwitcherTraitsAssistant _updateArbitrationForElementsParticipants:sceneHandleProviderBlock:forceResolution:reason:](self, "_updateArbitrationForElementsParticipants:sceneHandleProviderBlock:forceResolution:reason:", v5, v7, 1, CFSTR("TraitsAssistantHandleUpdateRequest"));

}

uint64_t __50__SBSwitcherTraitsAssistant__handleUpdateRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sceneHandleForTraitsParticipant:", a2);
}

- (void)_setupPolicySpecifierIfNeeded
{
  id WeakRetained;
  SBTraitsPipelineBlockBasedPolicySpecifier *v4;
  SBTraitsPipelineBlockBasedPolicySpecifier *v5;
  SBTraitsPipelineBlockBasedPolicySpecifier *blockBasedPolicySpecifier;
  _QWORD v7[4];
  id v8;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_traitsArbiter);
  if (WeakRetained && !self->_blockBasedPolicySpecifier)
  {
    objc_initWeak(&location, self);
    v4 = [SBTraitsPipelineBlockBasedPolicySpecifier alloc];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__SBSwitcherTraitsAssistant__setupPolicySpecifierIfNeeded__block_invoke;
    v7[3] = &unk_1E8EA7798;
    objc_copyWeak(&v8, &location);
    v5 = -[SBTraitsPipelineBlockBasedPolicySpecifier initWithPolicySpecifierBlock:specifierDescription:componentOrder:arbiter:](v4, "initWithPolicySpecifierBlock:specifierDescription:componentOrder:arbiter:", v7, CFSTR("Switcher Traits Assistant"), &unk_1E91D0830, WeakRetained);
    blockBasedPolicySpecifier = self->_blockBasedPolicySpecifier;
    self->_blockBasedPolicySpecifier = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __58__SBSwitcherTraitsAssistant__setupPolicySpecifierIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updateAcquiredParticipantsPolicies:", v3);

}

- (TRAArbiter)traitsArbiter
{
  return (TRAArbiter *)objc_loadWeakRetained((id *)&self->_traitsArbiter);
}

- (TRAParticipant)switcherParticipant
{
  return (TRAParticipant *)objc_loadWeakRetained((id *)&self->_switcherParticipant);
}

- (SBSwitcherTraitsAssistantDelegate)delegate
{
  return (SBSwitcherTraitsAssistantDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_switcherParticipant);
  objc_destroyWeak((id *)&self->_traitsArbiter);
  objc_storeStrong((id *)&self->_blockBasedPolicySpecifier, 0);
  objc_storeStrong((id *)&self->_participantUniqueIDToAssociatedParticipantMap, 0);
  objc_storeStrong((id *)&self->_guidingSceneOrientationRequestParticipantsMap, 0);
  objc_storeStrong((id *)&self->_guidingLandscapeOnlyParticipant, 0);
  objc_storeStrong((id *)&self->_guidingPortraitOnlyParticipant, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_liveOverlaysPolicySpecifier, 0);
  objc_storeStrong((id *)&self->_switcherPolicySpecifier, 0);
}

@end
