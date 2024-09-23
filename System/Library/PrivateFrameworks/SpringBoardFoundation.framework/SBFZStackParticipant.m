@implementation SBFZStackParticipant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_destroyWeak((id *)&self->_resolver);
  objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, 0);
  objc_storeStrong((id *)&self->_foregroundCaptureSceneTargets, 0);
  objc_storeStrong((id *)&self->_captureButtonFullFidelityEventRequestingScenes, 0);
  objc_storeStrong((id *)&self->_physicalButtonSceneTargets, 0);
  objc_storeStrong((id *)&self->_associatedSceneIdentifiersToSuppressInSystemAperture, 0);
  objc_storeStrong((id *)&self->_associatedBundleIdentifiersToSuppressInSystemAperture, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_updatePreferences
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  __CFString *v12;
  unint64_t v13;
  __CFString *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  __CFString *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  __CFString *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __CFString *v39;
  id v40;
  void *v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[SBFZStackParticipant preferences](self, "preferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = -[SBFZStackParticipantPreferences initInternal]([SBFZStackParticipantPreferences alloc], "initInternal");
  -[SBFZStackParticipant delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zStackParticipant:updatePreferences:", self, v5);

  -[SBFZStackParticipant setPreferences:](self, "setPreferences:", v5);
  SBLogZStack();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    _SBFZStackParticipantIdentifierDescription(-[SBFZStackParticipant identifier](self, "identifier"));
    v40 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v4;
    v9 = v5;
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = objc_msgSend(v9, "activationPolicyForParticipantsBelow");
    if (v11 > 2)
      v12 = 0;
    else
      v12 = off_1E200F2A8[v11];
    v41 = v4;
    v13 = objc_msgSend(v9, "homeGestureConsumption");
    if (v13 > 2)
      v14 = 0;
    else
      v14 = off_1E200F2C0[v13];
    v15 = objc_msgSend(v9, "homeAffordanceDrawingSuppression");
    if (v15 > 2)
      v39 = 0;
    else
      v39 = off_1E200F2D8[v15];
    v16 = objc_msgSend(v9, "activationPolicyForParticipantsBelow");
    if (v16 == objc_msgSend(v8, "activationPolicyForParticipantsBelow"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("activationPolicyForParticipantsBelow: %@"), v12, v36);
    }
    else
    {
      v17 = objc_msgSend(v8, "activationPolicyForParticipantsBelow");
      if (v17 > 2)
        v18 = 0;
      else
        v18 = off_1E200F2A8[v17];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("activationPolicyForParticipantsBelow: from %@ to %@"), v18, v12);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v19);

    v20 = objc_msgSend(v9, "homeGestureConsumption");
    if (v20 == objc_msgSend(v8, "homeGestureConsumption"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("homeGestureConsumption: %@"), v14, v37);
    }
    else
    {
      v21 = objc_msgSend(v8, "homeGestureConsumption");
      if (v21 > 2)
        v22 = 0;
      else
        v22 = off_1E200F2C0[v21];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("homeGestureConsumption: from %@ to %@"), v22, v14);
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v23);

    v24 = objc_msgSend(v9, "homeAffordanceDrawingSuppression");
    v4 = v41;
    if (v24 == objc_msgSend(v8, "homeAffordanceDrawingSuppression"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("homeAffordanceDrawingSuppression: %@"), v39, v38);
    }
    else
    {
      v25 = objc_msgSend(v8, "homeAffordanceDrawingSuppression");
      if (v25 > 2)
        v26 = 0;
      else
        v26 = off_1E200F2D8[v25];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("homeAffordanceDrawingSuppression: from %@ to %@"), v26, v39);
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v27);

    v28 = objc_msgSend(v9, "allowsDimmingWhenForegroundInactive");
    v29 = objc_msgSend(v8, "allowsDimmingWhenForegroundInactive");
    v30 = (void *)MEMORY[0x1E0CB3940];
    if (v28 == v29)
    {
      MEMORY[0x18D773350](objc_msgSend(v9, "allowsDimmingWhenForegroundInactive") != 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("allowsDimmingWhenForegroundInactive: %@"), v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v32);
    }
    else
    {
      MEMORY[0x18D773350](objc_msgSend(v8, "allowsDimmingWhenForegroundInactive") != 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x18D773350](objc_msgSend(v9, "allowsDimmingWhenForegroundInactive") != 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("allowsDimmingWhenForegroundInactive: from %@ to %@"), v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v33);

    }
    *(_DWORD *)buf = 138543618;
    v43 = v40;
    v44 = 2114;
    v45 = v10;
    _os_log_impl(&dword_18AB69000, v7, OS_LOG_TYPE_DEFAULT, "Updated preferences for <%{public}@>:%{public}@", buf, 0x16u);

  }
  -[SBFZStackParticipant resolver](self, "resolver");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v34;
  if (v34)
    -[SBFZStackResolver _updateResolutionsForAddedParticipant:removedParticipant:](v34, 0, 0);

}

- (SBFZStackResolver)resolver
{
  return (SBFZStackResolver *)objc_loadWeakRetained((id *)&self->_resolver);
}

- (BOOL)homeAffordanceDrawingSuppressed
{
  return self->_homeAffordanceDrawingSuppressed;
}

- (void)setHomeAffordanceDrawingSuppressed:(BOOL)a3
{
  self->_homeAffordanceDrawingSuppressed = a3;
}

- (NSSet)associatedSceneIdentifiersToSuppressInSystemAperture
{
  return self->_associatedSceneIdentifiersToSuppressInSystemAperture;
}

- (NSSet)associatedBundleIdentifiersToSuppressInSystemAperture
{
  return self->_associatedBundleIdentifiersToSuppressInSystemAperture;
}

- (BOOL)systemApertureSuppressedForSystemChromeSuppression
{
  return self->_systemApertureSuppressedForSystemChromeSuppression;
}

- (void)setSystemApertureSuppressedForSystemChromeSuppression:(BOOL)a3
{
  self->_systemApertureSuppressedForSystemChromeSuppression = a3;
}

- (void)setAssociatedSceneIdentifiersToSuppressInSystemAperture:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setAssociatedBundleIdentifiersToSuppressInSystemAperture:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SBFZStackParticipantPreferences)preferences
{
  return self->_preferences;
}

- (int64_t)activationState
{
  return self->_activationState;
}

- (BOOL)ownsHomeGesture
{
  return self->_ownsHomeGesture;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SBFZStackParticipant *v4;
  int64_t identifier;
  id WeakRetained;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = [SBFZStackParticipant alloc];
  identifier = self->_identifier;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = -[SBFZStackParticipant initWithIdentifier:delegate:](v4, "initWithIdentifier:delegate:", identifier, WeakRetained);

  v8 = objc_loadWeakRetained((id *)&self->_resolver);
  objc_storeWeak((id *)(v7 + 88), v8);

  objc_storeStrong((id *)(v7 + 96), self->_preferences);
  *(_BYTE *)(v7 + 9) = self->_homeAffordanceDrawingSuppressed;
  *(_BYTE *)(v7 + 8) = self->_ownsHomeGesture;
  *(_QWORD *)(v7 + 32) = self->_activationState;
  *(_BYTE *)(v7 + 10) = self->_systemApertureSuppressedForSystemChromeSuppression;
  objc_storeStrong((id *)(v7 + 48), self->_associatedSceneIdentifiersToSuppressInSystemAperture);
  objc_storeStrong((id *)(v7 + 40), self->_associatedBundleIdentifiersToSuppressInSystemAperture);
  objc_storeStrong((id *)(v7 + 56), self->_physicalButtonSceneTargets);
  v9 = -[NSArray copy](self->_captureButtonFullFidelityEventRequestingScenes, "copy");
  v10 = *(void **)(v7 + 64);
  *(_QWORD *)(v7 + 64) = v9;

  v11 = -[NSArray copy](self->_foregroundCaptureSceneTargets, "copy");
  v12 = *(void **)(v7 + 72);
  *(_QWORD *)(v7 + 72) = v11;

  objc_storeStrong((id *)(v7 + 80), self->_audioCategoriesDisablingVolumeHUD);
  return (id)v7;
}

- (SBFZStackParticipant)initWithIdentifier:(int64_t)a3 delegate:(id)a4
{
  id v6;
  SBFZStackParticipant *v7;
  SBFZStackParticipant *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBFZStackParticipant;
  v7 = -[SBFZStackParticipant init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_identifier = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  return v8;
}

- (SBFZStackParticipantDelegate)delegate
{
  return (SBFZStackParticipantDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSArray)physicalButtonSceneTargets
{
  return self->_physicalButtonSceneTargets;
}

- (NSSet)audioCategoriesDisablingVolumeHUD
{
  return self->_audioCategoriesDisablingVolumeHUD;
}

- (void)setPreferences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setActivationState:(int64_t)a3
{
  self->_activationState = a3;
}

- (void)setPhysicalButtonSceneTargets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setAudioCategoriesDisablingVolumeHUD:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setNeedsUpdatePreferencesWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogZStack();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _SBFZStackParticipantIdentifierDescription(-[SBFZStackParticipant identifier](self, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v6;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_18AB69000, v5, OS_LOG_TYPE_DEFAULT, "Requested update preferences for <%{public}@> with reason: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  -[SBFZStackParticipant _updatePreferences](self, "_updatePreferences");

}

- (void)invalidate
{
  id v3;

  -[SBFZStackParticipant resolver](self, "resolver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFZStackResolver _unregisterParticipant:]((uint64_t)v3, self);

}

- (void)setResolver:(id)a3
{
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_resolver);
  if (obj && WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFZStackResolver.m"), 648, CFSTR("Cannot register %@ with %@ because it's already registered with %@"), self, obj, WeakRetained);

  }
  objc_storeWeak((id *)&self->_resolver, obj);

}

- (NSString)description
{
  return (NSString *)-[SBFZStackParticipant descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFZStackParticipant succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  __CFString *v14;
  void *v15;
  unint64_t v16;
  __CFString *v17;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _SBFZStackParticipantIdentifierDescription(-[SBFZStackParticipant identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("identifier"));
  MEMORY[0x18D773350](-[SBFZStackParticipant ownsHomeGesture](self, "ownsHomeGesture"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("ownsHomeGesture"));

  v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[SBFZStackParticipant systemApertureSuppressedForSystemChromeSuppression](self, "systemApertureSuppressedForSystemChromeSuppression"), CFSTR("systemApertureSuppressedForSystemChromeSuppression"), 1);
  -[SBFZStackParticipant associatedSceneIdentifiersToSuppressInSystemAperture](self, "associatedSceneIdentifiersToSuppressInSystemAperture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v9, CFSTR("associatedSceneIdentifiersToSuppressInSystemAperture"), 1);

  -[SBFZStackParticipant associatedBundleIdentifiersToSuppressInSystemAperture](self, "associatedBundleIdentifiersToSuppressInSystemAperture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v12, CFSTR("associatedBundleIdentifiersToSuppressInSystemAperture"), 1);

  v13 = -[SBFZStackParticipant activationState](self, "activationState");
  if (v13 > 2)
    v14 = 0;
  else
    v14 = off_1E200F290[v13];
  objc_msgSend(v3, "appendString:withName:", v14, CFSTR("activationState"));
  -[SBFZStackParticipant preferences](self, "preferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "homeAffordanceDrawingSuppression");
  if (v16 > 2)
    v17 = 0;
  else
    v17 = off_1E200F2D8[v16];
  objc_msgSend(v3, "appendString:withName:", v17, CFSTR("suppression"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFZStackParticipant descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  SBFZStackParticipant *v11;

  v4 = a3;
  -[SBFZStackParticipant succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__SBFZStackParticipant_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E200E2A0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __62__SBFZStackParticipant_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  id v7;
  id v8;
  id v9;
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
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;

  v2 = *(void **)(a1 + 32);
  _SBFZStackParticipantIdentifierDescription(objc_msgSend(*(id *)(a1 + 40), "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("identifier"));

  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(*(id *)(a1 + 40), "activationState");
  if (v5 > 2)
    v6 = 0;
  else
    v6 = off_1E200F290[v5];
  objc_msgSend(v4, "appendString:withName:", v6, CFSTR("activationState"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "ownsHomeGesture"), CFSTR("ownsHomeGesture"));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "homeAffordanceDrawingSuppressed"), CFSTR("homeAffordanceDrawingSuppressed"));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "systemApertureSuppressedForSystemChromeSuppression"), CFSTR("systemApertureSuppressedForSystemChromeSuppression"), 1);
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "associatedSceneIdentifiersToSuppressInSystemAperture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendString:withName:skipIfEmpty:", v13, CFSTR("associatedSceneIdentifiersToSuppressInSystemAperture"), 1);

  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "associatedBundleIdentifiersToSuppressInSystemAperture");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendString:withName:skipIfEmpty:", v17, CFSTR("associatedBundleIdentifiersToSuppressInSystemAperture"), 1);

  v18 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "physicalButtonSceneTargets");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendArraySection:withName:skipIfEmpty:", v19, CFSTR("physicalButtonSceneTargets"), 1);

  v20 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "audioCategoriesDisablingVolumeHUD");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "componentsJoinedByString:", CFSTR(", "));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendString:withName:skipIfEmpty:", v23, CFSTR("audioCategoriesDisablingVolumeHUD"), 1);

  v24 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v24, "appendPointer:withName:", v25, CFSTR("delegate"));

  v27 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "resolver");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(v27, "appendPointer:withName:", v28, CFSTR("resolver"));

  v30 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "preferences");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v31 = (id)objc_msgSend(v30, "appendObject:withName:", v32, CFSTR("preferences"));

}

- (void)setOwnsHomeGesture:(BOOL)a3
{
  self->_ownsHomeGesture = a3;
}

- (NSArray)captureButtonFullFidelityEventRequestingScenes
{
  return self->_captureButtonFullFidelityEventRequestingScenes;
}

- (void)setCaptureButtonFullFidelityEventRequestingScenes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)foregroundCaptureSceneTargets
{
  return self->_foregroundCaptureSceneTargets;
}

- (void)setForegroundCaptureSceneTargets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)participantBelowAllowsDimming
{
  return self->_participantBelowAllowsDimming;
}

- (void)setParticipantBelowAllowsDimming:(BOOL)a3
{
  self->_participantBelowAllowsDimming = a3;
}

@end
