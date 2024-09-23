@implementation SBTraitsWindowParticipantDelegate

void __77__SBTraitsWindowParticipantDelegate_updatePreferencesForParticipant_updater___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL8 v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9 = v3;
  if (v4)
    objc_msgSend(v3, "setSupportedOrientations:", objc_msgSend(v4, "unsignedIntValue"));
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend((id)objc_opt_class(), "_activeOrientationDeterminingParticipantRoles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "role");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

    v8 = v7 && *(_BYTE *)(a1 + 57) && *(_BYTE *)(a1 + 58) == 0;
    objc_msgSend(v9, "setCanDetermineActiveOrientation:", v8);
  }

}

+ (id)_activeOrientationDeterminingParticipantRoles
{
  if (_activeOrientationDeterminingParticipantRoles_onceToken != -1)
    dispatch_once(&_activeOrientationDeterminingParticipantRoles_onceToken, &__block_literal_global_297);
  return (id)_activeOrientationDeterminingParticipantRoles__activeOrientationDeterminingParticipantRoles;
}

- (void)validateSettingsForParticipant:(id)a3 validator:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v7 = a3;
  v11 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsWindowParticipantDelegate.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("validator != nil"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsWindowParticipantDelegate.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant != nil"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__SBTraitsWindowParticipantDelegate_validateSettingsForParticipant_validator___block_invoke;
  v12[3] = &unk_1E8EB8C58;
  v12[4] = self;
  v13 = v7;
  v8 = v7;
  objc_msgSend(v11, "validateOrientationSettingsWithBlock:", v12);

}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  SBTraitsWindowParticipantDelegate *v18;
  id v19;
  char v20;
  char v21;
  char v22;
  _QWORD v23[4];
  id v24;

  v15 = a3;
  v7 = a4;
  if (v15)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsWindowParticipantDelegate.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant != nil"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsWindowParticipantDelegate.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updater != nil"));

LABEL_3:
  -[NSMutableDictionary objectForKey:](self->_tempLastPreferredZOrder, "objectForKey:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_tempLastSupportedOrientations, "objectForKey:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NSMutableArray containsObject:](self->_tempOwningWindowVisible, "containsObject:", v15);
  v11 = -[NSMutableArray containsObject:](self->_tempOwningWindowHidden, "containsObject:", v15);
  v12 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __77__SBTraitsWindowParticipantDelegate_updatePreferencesForParticipant_updater___block_invoke;
    v23[3] = &unk_1E8EB8C08;
    v24 = v8;
    objc_msgSend(v7, "updateZOrderLevelPreferencesWithBlock:", v23);

  }
  if (v9 || v10 | v11)
  {
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __77__SBTraitsWindowParticipantDelegate_updatePreferencesForParticipant_updater___block_invoke_2;
    v16[3] = &unk_1E8EB8C30;
    v20 = v10 | v11;
    v17 = v9;
    v18 = self;
    v19 = v15;
    v21 = v10;
    v22 = v11;
    objc_msgSend(v7, "updateOrientationPreferencesWithBlock:", v16);

  }
  -[NSMutableDictionary removeObjectForKey:](self->_tempLastPreferredZOrder, "removeObjectForKey:", v15);
  -[NSMutableDictionary removeObjectForKey:](self->_tempLastSupportedOrientations, "removeObjectForKey:", v15);
  -[NSMutableArray removeObject:](self->_tempOwningWindowVisible, "removeObject:", v15);
  -[NSMutableArray removeObject:](self->_tempOwningWindowHidden, "removeObject:", v15);

}

uint64_t __78__SBTraitsWindowParticipantDelegate_validateSettingsForParticipant_validator___block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "containsObject:", v5) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "role"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("SBTraitsParticipantRoleBanner")),
        v6,
        v7))
  {
    *a3 = 0;
    v8 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_validationFailureReasonForWindow:", v5);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a3 = (uint64_t)v9;

    v8 = 0;
  }
  SBLogTraitsArbiter();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *a3;
    v14 = 134218754;
    v15 = v5;
    v16 = 2114;
    v17 = v11;
    v18 = 1024;
    v19 = v8;
    v20 = 2114;
    v21 = v12;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Window(%p)(%{public}@) validates resolution: %{BOOL}u. %{public}@", (uint8_t *)&v14, 0x26u);

  }
  return v8;
}

- (id)_validationFailureReasonForWindow:(id)a3
{
  if (-[NSHashTable containsObject:](self->_visibleWindows, "containsObject:", a3))
    return 0;
  else
    return CFSTR("isHidden");
}

- (void)windowDidUpdateSupportedOrientations:(unint64_t)a3 ownedParticipant:(id)a4
{
  NSMutableDictionary *tempLastSupportedOrientations;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsWindowParticipantDelegate.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant != nil"));

  }
  tempLastSupportedOrientations = self->_tempLastSupportedOrientations;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](tempLastSupportedOrientations, "setObject:forKey:", v8, v10);

}

- (void)windowWillBecomeVisible:(id)a3 ownedParticipant:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsWindowParticipantDelegate.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("window != nil"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsWindowParticipantDelegate.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant != nil"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[NSHashTable addObject:](self->_visibleWindows, "addObject:", v10);
  -[NSMutableArray removeObject:](self->_tempOwningWindowHidden, "removeObject:", v7);
  -[NSMutableArray addObject:](self->_tempOwningWindowVisible, "addObject:", v7);

}

- (id)participantAssociatedSceneIdentityTokens:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsWindowParticipantDelegate.m"), 222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant"));

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_participantOwningWindowMapTable, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  SBSafeCast(v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "hostedSceneIdentityTokens");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v11);

  }
  if (+[SBSpotlightMultiplexingViewController isShownWithinWindow:](SBSpotlightMultiplexingViewController, "isShownWithinWindow:", v7))
  {
    +[SBSpotlightMultiplexingViewController spotlightSceneIdentityTokenIfActiveForeground](SBSpotlightMultiplexingViewController, "spotlightSceneIdentityTokenIfActiveForeground");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v6, "addObject:", v12);

  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)participantAssociatedWindows:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsWindowParticipantDelegate.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant != nil"));

  }
  -[NSMapTable objectForKey:](self->_participantOwningWindowMapTable, "objectForKey:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int IsYes;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _BOOL8 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  double v44;
  __int16 v45;
  double v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsWindowParticipantDelegate.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    if (v7)
      goto LABEL_3;
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsWindowParticipantDelegate.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_22;
LABEL_3:
  objc_msgSend(v7, "currentSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orientationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "role");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = SBTraitsArbiterOrientationActuationEnabledForRole(v11);

    if (v12)
    {
      -[NSMapTable objectForKey:](self->_participantOwningWindowMapTable, "objectForKey:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "orientation");
      if (objc_msgSend(v13, "interfaceOrientation") != v14)
      {
        objc_msgSend(v8, "orientationActuationContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "animationSettings");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "duration");
        v18 = v17;

        if (-[SBTraitsWindowParticipantDelegate _isWindowContentVisible:](self, "_isWindowContentVisible:", v13))
          v19 = v18;
        else
          v19 = 0.0;
        SBLogTraitsArbiter();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "uniqueIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          SBFStringForBSInterfaceOrientation();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v38 = v13;
          v39 = 2114;
          v40 = v21;
          v41 = 2112;
          v42 = v22;
          v43 = 2048;
          v44 = v18;
          v45 = 2048;
          v46 = v19;
          _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "Window(%p)(%{public}@) rotated(%@) with contextProvidedDuration(%.1f) resolvedDuration(%.1f)", buf, 0x34u);

        }
        objc_msgSend(MEMORY[0x1E0CEAC18], "_synchronizeDrawing");
        objc_msgSend(v10, "orientationMapResolver");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_setInterfaceOrientationMapResolver:", v23);

        objc_msgSend(v13, "_legacySetRotatableViewOrientation:updateStatusBar:duration:force:", v14, 1, 0, v19);
      }

    }
  }
  objc_msgSend(v7, "currentAmbientPresentedFlag");
  IsYes = BSSettingFlagIsYes();
  objc_msgSend(v7, "previousAmbientPresentedFlag");
  if (IsYes != BSSettingFlagIsYes())
  {
    objc_msgSend(v7, "currentAmbientPresentedFlag");
    v25 = BSSettingFlagIsYes();
    -[NSMapTable objectForKey:](self->_participantOwningWindowMapTable, "objectForKey:", v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "traitOverrides");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      v28 = 2;
    else
      v28 = 1;
    objc_opt_self();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setNSIntegerValue:forTrait:", v28, v29);

  }
  v30 = objc_msgSend(v7, "currentAmbientDisplayStyle");
  if (v30 != objc_msgSend(v7, "previousAmbientDisplayStyle"))
  {
    -[NSMapTable objectForKey:](self->_participantOwningWindowMapTable, "objectForKey:", v7);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = SBAmbientDisplayStyleForTraitsDisplayStyle(objc_msgSend(v7, "currentAmbientDisplayStyle"));
    objc_msgSend(v31, "traitOverrides");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setNSIntegerValue:forTrait:", v32, v34);

  }
}

- (SBTraitsWindowParticipantDelegate)init
{
  SBTraitsWindowParticipantDelegate *v2;
  uint64_t v3;
  NSMutableArray *tempOwningWindowHidden;
  uint64_t v5;
  NSMutableArray *tempOwningWindowVisible;
  uint64_t v7;
  NSMutableDictionary *tempLastPreferredZOrder;
  uint64_t v9;
  NSMutableDictionary *tempLastSupportedOrientations;
  uint64_t v11;
  NSHashTable *visibleWindows;
  uint64_t v13;
  NSMapTable *participantOwningWindowMapTable;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBTraitsWindowParticipantDelegate;
  v2 = -[SBTraitsWindowParticipantDelegate init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    tempOwningWindowHidden = v2->_tempOwningWindowHidden;
    v2->_tempOwningWindowHidden = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    tempOwningWindowVisible = v2->_tempOwningWindowVisible;
    v2->_tempOwningWindowVisible = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 15);
    v7 = objc_claimAutoreleasedReturnValue();
    tempLastPreferredZOrder = v2->_tempLastPreferredZOrder;
    v2->_tempLastPreferredZOrder = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 15);
    v9 = objc_claimAutoreleasedReturnValue();
    tempLastSupportedOrientations = v2->_tempLastSupportedOrientations;
    v2->_tempLastSupportedOrientations = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v11 = objc_claimAutoreleasedReturnValue();
    visibleWindows = v2->_visibleWindows;
    v2->_visibleWindows = (NSHashTable *)v11;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 5);
    v13 = objc_claimAutoreleasedReturnValue();
    participantOwningWindowMapTable = v2->_participantOwningWindowMapTable;
    v2->_participantOwningWindowMapTable = (NSMapTable *)v13;

  }
  return v2;
}

void __82__SBTraitsWindowParticipantDelegate__activeOrientationDeterminingParticipantRoles__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("SBTraitsParticipantRoleHomeScreen");
  v2[1] = CFSTR("SBTraitsParticipantRoleTransientOverlay");
  v2[2] = CFSTR("SBTraitsParticipantRoleCoverSheet");
  v2[3] = CFSTR("SBTraitsParticipantRoleAssistant");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_activeOrientationDeterminingParticipantRoles__activeOrientationDeterminingParticipantRoles;
  _activeOrientationDeterminingParticipantRoles__activeOrientationDeterminingParticipantRoles = v0;

}

- (void)setParticipant:(id)a3 ownedByWindow:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSMutableDictionary *tempLastPreferredZOrder;
  void *v13;
  void *v14;
  NSMutableDictionary *tempLastSupportedOrientations;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsWindowParticipantDelegate.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("window != nil"));

  }
  v8 = v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsWindowParticipantDelegate.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant != nil"));

    v8 = 0;
  }
  -[NSMapTable objectForKey:](self->_participantOwningWindowMapTable, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsWindowParticipantDelegate.m"), 70, CFSTR("Participant(%@) cannot be owned by window(%@), since it's already owned by other window(%@)"), v21, v9, v7);

  }
  -[NSMapTable setObject:forKey:](self->_participantOwningWindowMapTable, "setObject:forKey:", v7, v21);
  v11 = -[SBTraitsWindowParticipantDelegate _validatedSupportedInterfaceOrientations:forWindow:](self, "_validatedSupportedInterfaceOrientations:forWindow:", objc_msgSend(v7, "_supportedInterfaceOrientationsForRootViewController"), v7);
  tempLastPreferredZOrder = self->_tempLastPreferredZOrder;
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "windowLevel");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](tempLastPreferredZOrder, "setObject:forKey:", v14, v21);

  tempLastSupportedOrientations = self->_tempLastSupportedOrientations;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](tempLastSupportedOrientations, "setObject:forKey:", v16, v21);

  v17 = objc_msgSend(v7, "isHidden");
  v18 = 32;
  if (v17)
    v18 = 24;
  objc_msgSend(*(id *)((char *)&self->super.isa + v18), "addObject:", v21);

}

- (void)windowWillBecomeHidden:(id)a3 ownedParticipant:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsWindowParticipantDelegate.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("window != nil"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsWindowParticipantDelegate.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant != nil"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[NSHashTable removeObject:](self->_visibleWindows, "removeObject:", v10);
  -[NSMutableArray addObject:](self->_tempOwningWindowHidden, "addObject:", v7);
  -[NSMutableArray removeObject:](self->_tempOwningWindowVisible, "removeObject:", v7);

}

- (void)windowDidUpdatePreferredWindowLevel:(double)a3 ownedParticipant:(id)a4
{
  NSMutableDictionary *tempLastPreferredZOrder;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsWindowParticipantDelegate.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant != nil"));

  }
  tempLastPreferredZOrder = self->_tempLastPreferredZOrder;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](tempLastPreferredZOrder, "setObject:forKey:", v8, v10);

}

void __77__SBTraitsWindowParticipantDelegate_updatePreferencesForParticipant_updater___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "doubleValue");
  objc_msgSend(v3, "setPreferredZOrderLevel:");

}

- (void)participantWillInvalidate:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsWindowParticipantDelegate.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant != nil"));

    v5 = 0;
  }
  -[NSMapTable removeObjectForKey:](self->_participantOwningWindowMapTable, "removeObjectForKey:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_tempLastPreferredZOrder, "removeObjectForKey:", v7);
  -[NSMutableDictionary removeObjectForKey:](self->_tempLastSupportedOrientations, "removeObjectForKey:", v7);
  -[NSMutableArray removeObject:](self->_tempOwningWindowVisible, "removeObject:", v7);
  -[NSMutableArray removeObject:](self->_tempOwningWindowHidden, "removeObject:", v7);

}

- (void)appendDescriptionForParticipant:(id)a3 withBuilder:(id)a4 multilinePrefix:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __97__SBTraitsWindowParticipantDelegate_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke;
  v12[3] = &unk_1E8E9E270;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(v10, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Associated Windows"), a5, v12);

}

void __97__SBTraitsWindowParticipantDelegate_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "participantAssociatedWindows:", *(_QWORD *)(a1 + 40));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v1)
  {
    v2 = v1;
    v15 = *(_QWORD *)v18;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v3);
        v5 = *(void **)(a1 + 48);
        v6 = (void *)MEMORY[0x1E0CB3940];
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_debugName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "isHidden"))
          v10 = CFSTR("NO");
        else
          v10 = CFSTR("YES");
        objc_msgSend(v4, "interfaceOrientation");
        BSInterfaceOrientationDescription();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "rootViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p; %@>; Visible:%@; Orientation:%@; Root VC: %@"),
          v8,
          v4,
          v9,
          v10,
          v11,
          v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:withName:", v13, 0);

        ++v3;
      }
      while (v2 != v3);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v2);
  }

}

- (unint64_t)_validatedSupportedInterfaceOrientations:(unint64_t)a3 forWindow:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a3)
    return a3;
  objc_msgSend(a4, "interfaceOrientation", v4, v5);
  return XBInterfaceOrientationMaskForInterfaceOrientation();
}

- (BOOL)_isWindowContentVisible:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;

  v3 = a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast((uint64_t)v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "isContentHidden") ^ 1;
  else
    LOBYTE(v6) = 1;

  return v6;
}

- (id)_autorotationPreventionReasons:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast((uint64_t)v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "autorotationPreventionReasons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tempLastSupportedOrientations, 0);
  objc_storeStrong((id *)&self->_tempLastPreferredZOrder, 0);
  objc_storeStrong((id *)&self->_tempOwningWindowVisible, 0);
  objc_storeStrong((id *)&self->_tempOwningWindowHidden, 0);
  objc_storeStrong((id *)&self->_participantOwningWindowMapTable, 0);
  objc_storeStrong((id *)&self->_visibleWindows, 0);
}

@end
