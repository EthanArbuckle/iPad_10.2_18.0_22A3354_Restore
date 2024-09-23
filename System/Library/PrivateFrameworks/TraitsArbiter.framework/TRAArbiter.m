@implementation TRAArbiter

- (void)_addOrientationResolutionPolicySpecifierForClientContext:(id)a3
{
  uint64_t v4;
  int v5;
  TRAArbiterUpdateOrientationResolutionPolicySpecifier *v6;
  TRAArbiterUpdateOrientationResolutionPolicySpecifier *resolutionUpdateOrientationSpecifier;
  TRAArbiterUpdateOrientationResolutionPolicySpecifier *v8;
  void *v9;
  TRAArbiterUpdateOrientationResolutionPolicySpecifier *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_msgSend(v13, "forceOrientationResolution");
  v5 = objc_msgSend(v13, "_hasDefaultOrientationActuationContext");
  if (((v4 & 1) != 0 || !v5) && !self->_resolutionUpdateOrientationSpecifier)
  {
    v6 = -[TRAArbiterUpdateOrientationResolutionPolicySpecifier initWithComponentOrder:]([TRAArbiterUpdateOrientationResolutionPolicySpecifier alloc], "initWithComponentOrder:", &unk_251A0EAD0);
    resolutionUpdateOrientationSpecifier = self->_resolutionUpdateOrientationSpecifier;
    self->_resolutionUpdateOrientationSpecifier = v6;

    -[TRAArbiterUpdateOrientationResolutionPolicySpecifier setForceResolution:](self->_resolutionUpdateOrientationSpecifier, "setForceResolution:", v4);
    v8 = self->_resolutionUpdateOrientationSpecifier;
    objc_msgSend(v13, "orientationActuationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRAArbiterUpdateOrientationResolutionPolicySpecifier setActuationContext:](v8, "setActuationContext:", v9);

    v10 = self->_resolutionUpdateOrientationSpecifier;
    objc_msgSend(v13, "requestingParticipantsUniqueIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRAArbiterUpdateOrientationResolutionPolicySpecifier setParticipantsUniqueIdentifiers:](v10, "setParticipantsUniqueIdentifiers:", v11);

    -[TRAArbiter orientationResolutionStage](self, "orientationResolutionStage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addResolutionPolicySpecifier:update:", self->_resolutionUpdateOrientationSpecifier, 0);

  }
}

- (void)setNeedsUpdateArbitrationWithContext:(id)a3
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_drawingDataSource);
  objc_msgSend(v9, "_setDrawingConfigurationProvider:", WeakRetained);

  objc_msgSend(v9, "requestingParticipantsUniqueIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v9, "reason");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRAArbiter _defaultUpdateContextWithReason:animatable:](self, "_defaultUpdateContextWithReason:animatable:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[TRAArbiter _setNeedsUpdateArbitrationWithClientContext:defaultContext:](self, "_setNeedsUpdateArbitrationWithClientContext:defaultContext:", v9, v8);
  }
  else
  {
    -[NSMutableArray addObject:](self->_arbiterNeedsUpdateReasons, "addObject:", CFSTR("Broadcast update requested"));
    -[TRAArbiter _setNeedsUpdateArbitrationWithClientContext:defaultContext:](self, "_setNeedsUpdateArbitrationWithClientContext:defaultContext:", 0, v9);
  }

}

- (void)_setNeedsUpdateArbitrationWithClientContext:(id)a3 defaultContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbiter.m"), 270, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("defaultContext"));

  }
  if (v7)
    v9 = v7;
  else
    v9 = v8;
  v22 = v9;
  objc_msgSend(v22, "requestingParticipantsUniqueIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v23 = v8;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    -[NSMutableDictionary allKeys](self->_acquiredParticipantsByUniqueIdentifier, "allKeys");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        -[NSMutableDictionary objectForKey:](self->_acquiredParticipantsByUniqueIdentifier, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          -[NSMutableSet addObject:](self->_participantsNeedingUpdate, "addObject:", v19);
        }
        else
        {
          TRALogCommon();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v29 = 0;
            v30 = 2114;
            v31 = v7;
            _os_log_error_impl(&dword_249196000, v20, OS_LOG_TYPE_ERROR, "An update was requested for an unknown participant: %{public}@, with client context: %{public}@", buf, 0x16u);
          }

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v16);
  }

  if (v7
    && (!objc_msgSend(v7, "_hasDefaultOrientationActuationContext")
     || objc_msgSend(v7, "forceOrientationResolution")))
  {
    -[TRAArbiter _addOrientationResolutionPolicySpecifierForClientContext:](self, "_addOrientationResolutionPolicySpecifierForClientContext:", v7);
  }
  -[TRAArbiter _updateArbitrationWithClientContext:defaultContext:](self, "_updateArbitrationWithClientContext:defaultContext:", v7, v23);
  -[TRAArbiter _removeForceResolutionSpecifier](self, "_removeForceResolutionSpecifier");

}

- (void)_removeForceResolutionSpecifier
{
  void *v3;
  TRAArbiterUpdateOrientationResolutionPolicySpecifier *resolutionUpdateOrientationSpecifier;

  if (self->_resolutionUpdateOrientationSpecifier)
  {
    -[TRAArbiter orientationResolutionStage](self, "orientationResolutionStage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeResolutionPolicySpecifier:update:", self->_resolutionUpdateOrientationSpecifier, 0);

    resolutionUpdateOrientationSpecifier = self->_resolutionUpdateOrientationSpecifier;
    self->_resolutionUpdateOrientationSpecifier = 0;

  }
}

- (id)_resolutionStageWithType:(int64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_preferencesResolutionStages;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "preferencesType", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)_updateArbitrationWithClientContext:(id)a3 defaultContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSMutableSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id WeakRetained;
  TRAArbitrationInputs *v20;
  TRAArbitrationInputs *lastRawInputs;
  TRAArbitrationInputsValidationStage *inputsValidationStage;
  TRAArbitrationInputs *v23;
  TRAInputsValidationContext *v24;
  void *v25;
  TRAInputsValidationContext *v26;
  TRAArbitrationInputs *v27;
  TRAArbitrationInputs *lastValidatedInputs;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  NSMutableDictionary *acquiredParticipantsByPreferencesType;
  void *v36;
  void *v37;
  TRAPreferencesResolutionContext *v38;
  void *v39;
  TRAPreferencesResolutionContext *v40;
  NSObject *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  NSObject *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  NSArray *obj;
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
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbiter.m"), 382, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("defaultContext"));

  }
  if (-[NSMutableDictionary count](self->_acquiredParticipantsByPreferencesType, "count"))
  {
    if (v7)
      v9 = v7;
    else
      v9 = v8;
    v10 = v9;
    -[TRAArbiter noteArbiterWillBeginTransitionWithContext:](self, "noteArbiterWillBeginTransitionWithContext:", v10);
    TRALogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[TRAArbiter _updateArbitrationWithClientContext:defaultContext:].cold.3((uint64_t)self, (uint64_t)v10, v11);

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v12 = self->_participantsNeedingUpdate;
    v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v67 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          objc_msgSend(v17, "delegate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "updatePreferencesForParticipant:updater:", v17, v17);

          if (objc_msgSend(v10, "forceOrientationResolution"))
            -[NSMutableSet addObject:](self->_updatedParticipants, "addObject:", v17);
        }
        v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
      }
      while (v14);
    }
    v56 = v10;

    if (-[NSMutableSet count](self->_updatedParticipants, "count")
      || -[NSMutableArray count](self->_arbiterNeedsUpdateReasons, "count"))
    {
      v54 = v8;
      v55 = v7;
      -[NSMutableSet removeAllObjects](self->_updatedParticipants, "removeAllObjects");
      WeakRetained = objc_loadWeakRetained((id *)&self->_inputsDataSource);
      objc_msgSend(WeakRetained, "inputs");
      v20 = (TRAArbitrationInputs *)objc_claimAutoreleasedReturnValue();
      lastRawInputs = self->_lastRawInputs;
      self->_lastRawInputs = v20;

      inputsValidationStage = self->_inputsValidationStage;
      v23 = self->_lastRawInputs;
      v24 = [TRAInputsValidationContext alloc];
      -[NSMutableDictionary allValues](self->_acquiredParticipantsByUniqueIdentifier, "allValues");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[TRAInputsValidationContext initWithAcquiredParticipants:](v24, "initWithAcquiredParticipants:", v25);
      -[TRAArbitrationInputsValidationStage validateInputs:withContext:](inputsValidationStage, "validateInputs:withContext:", v23, v26);
      v27 = (TRAArbitrationInputs *)objc_claimAutoreleasedReturnValue();
      lastValidatedInputs = self->_lastValidatedInputs;
      self->_lastValidatedInputs = v27;

      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      obj = self->_preferencesResolutionStages;
      v29 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v63;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v63 != v31)
              objc_enumerationMutation(obj);
            v33 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
            objc_msgSend(v33, "participantsRoles");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            acquiredParticipantsByPreferencesType = self->_acquiredParticipantsByPreferencesType;
            TRAStringFromTraitsPreferencesType(objc_msgSend(v33, "preferencesType"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](acquiredParticipantsByPreferencesType, "objectForKey:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            v38 = [TRAPreferencesResolutionContext alloc];
            objc_msgSend(v37, "allObjects");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = -[TRAPreferencesResolutionContext initWithAcquiredParticipants:stageParticipantsRoles:validatedInputs:rawInputs:](v38, "initWithAcquiredParticipants:stageParticipantsRoles:validatedInputs:rawInputs:", v39, v34, self->_lastValidatedInputs, self->_lastRawInputs);

            objc_msgSend(v33, "updateResolutionWithContext:", v40);
          }
          v30 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
        }
        while (v30);
      }

      TRALogCommon();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        -[TRAArbiter _updateArbitrationWithClientContext:defaultContext:].cold.2(self, v41);

      v8 = v54;
      v7 = v55;
    }
    v42 = (void *)-[NSMutableSet copy](self->_updatedParticipants, "copy");
    -[NSMutableSet removeAllObjects](self->_updatedParticipants, "removeAllObjects");
    -[NSMutableSet removeAllObjects](self->_participantsNeedingUpdate, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_arbiterNeedsUpdateReasons, "removeAllObjects");
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v43 = v42;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v59;
      do
      {
        for (k = 0; k != v45; ++k)
        {
          if (*(_QWORD *)v59 != v46)
            objc_enumerationMutation(v43);
          v48 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * k);
          if (objc_msgSend(v48, "hasAnyActuationContext"))
            v49 = v48;
          else
            v49 = v8;
          v50 = v49;
          objc_msgSend(v48, "delegate");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "didChangeSettingsForParticipant:context:", v48, v50);

        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      }
      while (v45);
    }

    -[TRAArbiter noteArbiterDidCompleteTransitionWithContext:](self, "noteArbiterDidCompleteTransitionWithContext:", v56);
    TRALogCommon();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      -[TRAArbiter _updateArbitrationWithClientContext:defaultContext:].cold.1((uint64_t)self, (uint64_t)v56, v52);

  }
}

- (void)noteArbiterDidCompleteTransitionWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__TRAArbiter_noteArbiterDidCompleteTransitionWithContext___block_invoke;
  v7[3] = &unk_251A06F28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

- (void)noteArbiterWillBeginTransitionWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__TRAArbiter_noteArbiterWillBeginTransitionWithContext___block_invoke;
  v7[3] = &unk_251A06F28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

- (id)orientationResolutionStage
{
  return -[TRAArbiter _resolutionStageWithType:](self, "_resolutionStageWithType:", 1);
}

- (id)_defaultUpdateContextWithReason:(id)a3 animatable:(BOOL)a4
{
  id v7;
  TRAArbiterUpdateContext *v8;
  id v9;
  TRAArbiterUpdateContext *v10;
  void *v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbiter.m"), 370, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  v8 = [TRAArbiterUpdateContext alloc];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__TRAArbiter__defaultUpdateContextWithReason_animatable___block_invoke;
  v13[3] = &unk_251A06F50;
  v15 = a4;
  v13[4] = self;
  v14 = v7;
  v9 = v7;
  v10 = -[TRAArbiterUpdateContext initWithBuilder:](v8, "initWithBuilder:", v13);

  return v10;
}

void __57__TRAArbiter__defaultUpdateContextWithReason_animatable___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  TRASettingsActuationContext *v5;
  id v6;

  v6 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 160));
    objc_msgSend(WeakRetained, "defaultOrientationAnimationSettingsAnimatable:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  v5 = -[TRASettingsActuationContext initWithAnimationSettings:drawingFence:]([TRASettingsActuationContext alloc], "initWithAnimationSettings:drawingFence:", v4, 0);
  objc_msgSend(v6, "setReason:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "setRequestingParticipantsUniqueIdentifiers:", MEMORY[0x24BDBD1A8]);
  objc_msgSend(v6, "setOrientationActuationContext:", v5);

}

- (void)_participantDidUpdatePreferences:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbiter.m"), 321, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant"));

    v5 = 0;
  }
  -[NSMutableSet addObject:](self->_updatedParticipants, "addObject:", v5);

}

void __58__TRAArbiter_noteArbiterDidCompleteTransitionWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "arbiter:didCompleteUpdateWithContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __56__TRAArbiter_noteArbiterWillBeginTransitionWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "arbiter:willBeginUpdateWithContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)acquireParticipantWithRole:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  id v9;
  TRAParticipant *v10;
  id v11;
  TRAParticipant *v12;
  NSMutableDictionary *liveRolesCounter;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *acquiredParticipantsByUniqueIdentifier;
  void *v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  int v26;
  NSMutableDictionary *acquiredParticipantsByPreferencesType;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbiter.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("role"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbiter.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

LABEL_3:
  if (!-[NSSet containsObject:](self->_allStagesRoles, "containsObject:", v7))
  {
    v33 = (void *)MEMORY[0x24BDBCE88];
    v34 = (void *)MEMORY[0x24BDD17C8];
    v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", CFSTR("*** -[%@ %@] called for unknown role: %@"), v36, v37, v7);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "exceptionWithName:reason:userInfo:", CFSTR("TRAArbiterUnknownRoleException"), v38, 0);
    v39 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v39);
  }
  v10 = [TRAParticipant alloc];
  v11 = -[TRAArbiter _newUniqueIdentifierForRole:](self, "_newUniqueIdentifierForRole:", v7);
  v40 = v9;
  v12 = -[TRAParticipant initWithRole:uniqueIdentifier:delegate:arbiter:](v10, "initWithRole:uniqueIdentifier:delegate:arbiter:", v7, v11, v9, self);

  liveRolesCounter = self->_liveRolesCounter;
  v14 = (void *)MEMORY[0x24BDD16E0];
  -[NSMutableDictionary objectForKeyedSubscript:](liveRolesCounter, "objectForKeyedSubscript:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "unsignedIntegerValue") + 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](liveRolesCounter, "setObject:forKey:", v16, v7);

  acquiredParticipantsByUniqueIdentifier = self->_acquiredParticipantsByUniqueIdentifier;
  -[TRAParticipant uniqueIdentifier](v12, "uniqueIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](acquiredParticipantsByUniqueIdentifier, "setObject:forKey:", v12, v18);

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v19 = self->_preferencesResolutionStages;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v42 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v24, "participantsRoles");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "containsObject:", v7);

        if (v26)
        {
          acquiredParticipantsByPreferencesType = self->_acquiredParticipantsByPreferencesType;
          TRAStringFromTraitsPreferencesType(objc_msgSend(v24, "preferencesType"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](acquiredParticipantsByPreferencesType, "objectForKey:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "addObject:", v12);
        }
      }
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v21);
  }

  return v12;
}

- (id)_newUniqueIdentifierForRole:(id)a3
{
  uint64_t v5;
  const __CFString *v6;
  __CFString *v7;
  void *v8;

  v5 = 0;
  v6 = &stru_251A072F0;
  do
  {
    v7 = (__CFString *)v6;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%ld"), a3, v5);
    v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    ++v5;
    -[NSMutableDictionary objectForKey:](self->_acquiredParticipantsByUniqueIdentifier, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while (v8);
  return (id)v6;
}

- (void)_preferencesResolutionStageDidUpdateComponents:(id)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v7 = a3;
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbiter.m"), 338, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferencesResolutionStage"));

    v7 = 0;
  }
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v7, "succinctDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Stage[%@] did update specifiers."), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](self->_arbiterNeedsUpdateReasons, "addObject:", v10);
  -[TRAArbiter _setNeedsUpdateArbitrationWithReason:animated:](self, "_setNeedsUpdateArbitrationWithReason:animated:", v10, v4);

}

- (void)_setNeedsUpdateArbitrationWithReason:(id)a3 animated:(BOOL)a4
{
  id v5;

  -[TRAArbiter _defaultUpdateContextWithReason:animatable:](self, "_defaultUpdateContextWithReason:animatable:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TRAArbiter _setNeedsUpdateArbitrationWithClientContext:defaultContext:](self, "_setNeedsUpdateArbitrationWithClientContext:defaultContext:", 0, v5);

}

- (void)_participantDidUpdateSettings:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbiter.m"), 326, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant"));

    v5 = 0;
  }
  -[NSMutableSet addObject:](self->_updatedParticipants, "addObject:", v5);

}

- (TRAArbiter)initWithRolesProvider:(id)a3 inputsDataSource:(id)a4 drawingDataSource:(id)a5
{
  id v8;
  id v9;
  id v10;
  TRAArbiter *v11;
  uint64_t v12;
  NSMutableDictionary *acquiredParticipantsByUniqueIdentifier;
  uint64_t v14;
  NSMutableDictionary *acquiredParticipantsByPreferencesType;
  uint64_t v16;
  NSMutableDictionary *liveRolesCounter;
  uint64_t v18;
  NSMutableSet *participantsNeedingUpdate;
  uint64_t v20;
  NSMutableSet *updatedParticipants;
  uint64_t v22;
  NSMutableArray *arbiterNeedsUpdateReasons;
  TRAArbitrationInputsValidationStage *v24;
  TRAArbitrationInputsValidationStage *inputsValidationStage;
  uint64_t v26;
  NSArray *preferencesResolutionStages;
  uint64_t v28;
  BSInvalidatable *stateDumpHandle;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)TRAArbiter;
  v11 = -[TRAArbiter init](&v31, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 20);
    v12 = objc_claimAutoreleasedReturnValue();
    acquiredParticipantsByUniqueIdentifier = v11->_acquiredParticipantsByUniqueIdentifier;
    v11->_acquiredParticipantsByUniqueIdentifier = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
    v14 = objc_claimAutoreleasedReturnValue();
    acquiredParticipantsByPreferencesType = v11->_acquiredParticipantsByPreferencesType;
    v11->_acquiredParticipantsByPreferencesType = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 20);
    v16 = objc_claimAutoreleasedReturnValue();
    liveRolesCounter = v11->_liveRolesCounter;
    v11->_liveRolesCounter = (NSMutableDictionary *)v16;

    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 2);
    v18 = objc_claimAutoreleasedReturnValue();
    participantsNeedingUpdate = v11->_participantsNeedingUpdate;
    v11->_participantsNeedingUpdate = (NSMutableSet *)v18;

    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 2);
    v20 = objc_claimAutoreleasedReturnValue();
    updatedParticipants = v11->_updatedParticipants;
    v11->_updatedParticipants = (NSMutableSet *)v20;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v22 = objc_claimAutoreleasedReturnValue();
    arbiterNeedsUpdateReasons = v11->_arbiterNeedsUpdateReasons;
    v11->_arbiterNeedsUpdateReasons = (NSMutableArray *)v22;

    objc_storeWeak((id *)&v11->_drawingDataSource, v10);
    objc_storeWeak((id *)&v11->_inputsDataSource, v9);
    v24 = -[TRAArbitrationInputsValidationStage initWithValidators:arbiter:]([TRAArbitrationInputsValidationStage alloc], "initWithValidators:arbiter:", 0, v11);
    inputsValidationStage = v11->_inputsValidationStage;
    v11->_inputsValidationStage = v24;

    v26 = -[TRAArbiter _newOrderedPreferencesResolutionStagesWithRolesProvider:](v11, "_newOrderedPreferencesResolutionStagesWithRolesProvider:", v8);
    preferencesResolutionStages = v11->_preferencesResolutionStages;
    v11->_preferencesResolutionStages = (NSArray *)v26;

    -[TRAArbiter _setupStateDump](v11, "_setupStateDump");
    v28 = objc_claimAutoreleasedReturnValue();
    stateDumpHandle = v11->_stateDumpHandle;
    v11->_stateDumpHandle = (BSInvalidatable *)v28;

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[BSInvalidatable invalidate](self->_stateDumpHandle, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)TRAArbiter;
  -[TRAArbiter dealloc](&v4, sel_dealloc);
}

- (id)_newOrderedPreferencesResolutionStagesWithRolesProvider:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *zOrderStageRoles;
  NSSet *v7;
  NSSet *orientationStageRoles;
  NSSet *v9;
  NSSet *ambientPresentationStageRoles;
  NSSet *v11;
  NSSet *userInterfaceStyleStageRoles;
  TRAArbitrationPreferencesResolutionStage *v13;
  void *v14;
  TRAArbitrationPreferencesResolutionStage *v15;
  TRAArbitrationPreferencesResolutionStage *v16;
  void *v17;
  TRAArbitrationPreferencesResolutionStage *v18;
  TRAArbitrationPreferencesResolutionStage *v19;
  void *v20;
  TRAArbitrationPreferencesResolutionStage *v21;
  TRAArbitrationPreferencesResolutionStage *v22;
  void *v23;
  TRAArbitrationPreferencesResolutionStage *v24;
  NSMutableDictionary *acquiredParticipantsByPreferencesType;
  void *v26;
  void *v27;
  NSMutableDictionary *v28;
  void *v29;
  void *v30;
  NSMutableDictionary *v31;
  void *v32;
  void *v33;
  NSMutableDictionary *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSSet *v39;
  NSSet *allStagesRoles;
  void *v41;
  _QWORD v43[5];

  v43[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "zOrderStageRoles");
  v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
  zOrderStageRoles = self->_zOrderStageRoles;
  self->_zOrderStageRoles = v5;

  objc_msgSend(v4, "orientationStageRoles");
  v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
  orientationStageRoles = self->_orientationStageRoles;
  self->_orientationStageRoles = v7;

  objc_msgSend(v4, "ambientPresentationStageRoles");
  v9 = (NSSet *)objc_claimAutoreleasedReturnValue();
  ambientPresentationStageRoles = self->_ambientPresentationStageRoles;
  self->_ambientPresentationStageRoles = v9;

  objc_msgSend(v4, "userInterfaceStyleStageRoles");
  v11 = (NSSet *)objc_claimAutoreleasedReturnValue();

  userInterfaceStyleStageRoles = self->_userInterfaceStyleStageRoles;
  self->_userInterfaceStyleStageRoles = v11;

  v13 = [TRAArbitrationPreferencesResolutionStage alloc];
  -[NSSet allObjects](self->_zOrderStageRoles, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[TRAArbitrationPreferencesResolutionStage initWithParticipantsRoles:preferencesType:arbiter:](v13, "initWithParticipantsRoles:preferencesType:arbiter:", v14, 0, self);

  v16 = [TRAArbitrationPreferencesResolutionStage alloc];
  -[NSSet allObjects](self->_orientationStageRoles, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[TRAArbitrationPreferencesResolutionStage initWithParticipantsRoles:preferencesType:arbiter:](v16, "initWithParticipantsRoles:preferencesType:arbiter:", v17, 1, self);

  v19 = [TRAArbitrationPreferencesResolutionStage alloc];
  -[NSSet allObjects](self->_ambientPresentationStageRoles, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[TRAArbitrationPreferencesResolutionStage initWithParticipantsRoles:preferencesType:arbiter:](v19, "initWithParticipantsRoles:preferencesType:arbiter:", v20, 2, self);

  v22 = [TRAArbitrationPreferencesResolutionStage alloc];
  -[NSSet allObjects](self->_ambientPresentationStageRoles, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[TRAArbitrationPreferencesResolutionStage initWithParticipantsRoles:preferencesType:arbiter:](v22, "initWithParticipantsRoles:preferencesType:arbiter:", v23, 3, self);

  acquiredParticipantsByPreferencesType = self->_acquiredParticipantsByPreferencesType;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  TRAStringFromTraitsPreferencesType(0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](acquiredParticipantsByPreferencesType, "setObject:forKey:", v26, v27);

  v28 = self->_acquiredParticipantsByPreferencesType;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  TRAStringFromTraitsPreferencesType(1uLL);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v29, v30);

  v31 = self->_acquiredParticipantsByPreferencesType;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  TRAStringFromTraitsPreferencesType(2uLL);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v31, "setObject:forKey:", v32, v33);

  v34 = self->_acquiredParticipantsByPreferencesType;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  TRAStringFromTraitsPreferencesType(3uLL);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v34, "setObject:forKey:", v35, v36);

  -[NSSet setByAddingObjectsFromSet:](self->_zOrderStageRoles, "setByAddingObjectsFromSet:", self->_ambientPresentationStageRoles);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setByAddingObjectsFromSet:", self->_userInterfaceStyleStageRoles);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setByAddingObjectsFromSet:", self->_orientationStageRoles);
  v39 = (NSSet *)objc_claimAutoreleasedReturnValue();
  allStagesRoles = self->_allStagesRoles;
  self->_allStagesRoles = v39;

  v43[0] = v15;
  v43[1] = v18;
  v43[2] = v21;
  v43[3] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (void)addObserver:(id)a3
{
  id v5;
  NSHashTable *observers;
  NSHashTable *v7;
  NSHashTable *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbiter.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

    v5 = 0;
  }
  observers = self->_observers;
  if (!observers)
  {
    v7 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 5, 2);
    v8 = self->_observers;
    self->_observers = v7;

    v5 = v10;
    observers = self->_observers;
  }
  if (!-[NSHashTable containsObject:](observers, "containsObject:", v5))
    -[NSHashTable addObject:](self->_observers, "addObject:", v10);

}

- (void)removeObserver:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbiter.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

    v5 = 0;
  }
  if (-[NSHashTable containsObject:](self->_observers, "containsObject:", v5))
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v7);

}

- (id)inputsValidationStage
{
  return self->_inputsValidationStage;
}

- (id)zOrderResolutionStage
{
  return -[TRAArbiter _resolutionStageWithType:](self, "_resolutionStageWithType:", 0);
}

- (id)ambientPresentationResolutionStage
{
  return -[TRAArbiter _resolutionStageWithType:](self, "_resolutionStageWithType:", 2);
}

- (id)userInterfaceStyleResolutionStage
{
  return -[TRAArbiter _resolutionStageWithType:](self, "_resolutionStageWithType:", 3);
}

- (void)_invalidateParticipant:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSMutableDictionary *acquiredParticipantsByUniqueIdentifier;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *liveRolesCounter;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbiter.m"), 292, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant"));

  }
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "participantWillInvalidate:", v5);
  objc_msgSend(v5, "role");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  acquiredParticipantsByUniqueIdentifier = self->_acquiredParticipantsByUniqueIdentifier;
  objc_msgSend(v5, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](acquiredParticipantsByUniqueIdentifier, "removeObjectForKey:", v9);

  -[NSMutableSet removeObject:](self->_participantsNeedingUpdate, "removeObject:", v5);
  -[NSMutableSet removeObject:](self->_updatedParticipants, "removeObject:", v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_liveRolesCounter, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue") - 1;

  liveRolesCounter = self->_liveRolesCounter;
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](liveRolesCounter, "setObject:forKey:", v13, v7);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_liveRolesCounter, "removeObjectForKey:", v7);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableDictionary allKeys](self->_acquiredParticipantsByPreferencesType, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        -[NSMutableDictionary objectForKey:](self->_acquiredParticipantsByPreferencesType, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeObject:", v5);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Participant(%p) with role %@ was invalidated"), v5, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_arbiterNeedsUpdateReasons, "addObject:", v20);
  -[TRAArbiter _setNeedsUpdateArbitrationWithReason:animated:](self, "_setNeedsUpdateArbitrationWithReason:animated:", v20, 1);

}

- (void)_inputsValidationStageDidUpdateValidators:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbiter.m"), 331, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inputsValidationStage"));

    v5 = 0;
  }
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "succinctDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Stage[%@] did update specifiers."), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](self->_arbiterNeedsUpdateReasons, "addObject:", v8);
  -[TRAArbiter _setNeedsUpdateArbitrationWithReason:animated:](self, "_setNeedsUpdateArbitrationWithReason:animated:", v8, 1);

}

- (NSString)debugDescription
{
  return (NSString *)-[TRAArbiter descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRAArbiter succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRAArbiter descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  TRAArbiter *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  TRAArbiter *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[TRAArbiter succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_acquiredParticipantsByUniqueIdentifier, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[NSMutableDictionary allValues](self->_acquiredParticipantsByUniqueIdentifier, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v10), "succinctDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v8);
  }

  v12 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke;
  v25[3] = &unk_251A06DD8;
  v13 = v4;
  v26 = v13;
  v27 = v5;
  v28 = self;
  v14 = v5;
  objc_msgSend(v13, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Acquired Participants"), 0, v25);
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v22[3] = &unk_251A06D68;
  v15 = v13;
  v23 = v15;
  v24 = self;
  objc_msgSend(v15, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Inputs"), 0, v22);
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_5;
  v20[3] = &unk_251A06D68;
  v20[4] = self;
  v16 = v15;
  v21 = v16;
  objc_msgSend(v16, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Preferences Resolution Stages"), 0, v20);
  v17 = v21;
  v18 = v16;

  return v18;
}

uint64_t __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", *(_QWORD *)(a1 + 40), 0, 0);
  return objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48), CFSTR("Acquired Participants by Roles Counter"), 0);
}

void __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112), CFSTR("validation stage"), 0);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "activeMultilinePrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v15[3] = &unk_251A06D68;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v16 = v6;
  v17 = v7;
  objc_msgSend(v3, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("last raw"), v4, v15);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "activeMultilinePrefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_4;
  v12[3] = &unk_251A06D68;
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v13 = v10;
  v14 = v11;
  objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("last validated"), v9, v12);

}

id __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128), 0, 0);
}

id __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136), 0, 0);
}

void __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id obj;
  _QWORD v11[4];
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 120);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v7 = *(void **)(a1 + 40);
        TRAStringFromTraitsPreferencesType(objc_msgSend(v6, "preferencesType"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "activeMultilinePrefix");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 3221225472;
        v11[2] = __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_6;
        v11[3] = &unk_251A06D68;
        v12 = *(id *)(a1 + 40);
        v13 = v6;
        objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", v8, v9, v11);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v3);
  }

}

void __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_6(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "debugDescription");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendString:withName:", v2, 0);

}

- (id)_setupStateDump
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v2 = MEMORY[0x24BDAC9B8];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_loadWeakRetained(&location);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("TraitsArbiter - %p - Arbiter"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(&v8, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v6;
}

__CFString *__29__TRAArbiter__setupStateDump__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "debugDescription");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_251A072F0;
  }

  return v3;
}

- (TRAArbiterInputsDataSource)inputsDataSource
{
  return (TRAArbiterInputsDataSource *)objc_loadWeakRetained((id *)&self->_inputsDataSource);
}

- (TRAArbiterDrawingDataSource)drawingDataSource
{
  return (TRAArbiterDrawingDataSource *)objc_loadWeakRetained((id *)&self->_drawingDataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_drawingDataSource);
  objc_destroyWeak((id *)&self->_inputsDataSource);
  objc_storeStrong((id *)&self->_stateDumpHandle, 0);
  objc_storeStrong((id *)&self->_lastValidatedInputs, 0);
  objc_storeStrong((id *)&self->_lastRawInputs, 0);
  objc_storeStrong((id *)&self->_preferencesResolutionStages, 0);
  objc_storeStrong((id *)&self->_inputsValidationStage, 0);
  objc_storeStrong((id *)&self->_resolutionUpdateOrientationSpecifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_updatedParticipants, 0);
  objc_storeStrong((id *)&self->_arbiterNeedsUpdateReasons, 0);
  objc_storeStrong((id *)&self->_participantsNeedingUpdate, 0);
  objc_storeStrong((id *)&self->_acquiredParticipantsByPreferencesType, 0);
  objc_storeStrong((id *)&self->_acquiredParticipantsByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_liveRolesCounter, 0);
  objc_storeStrong((id *)&self->_allStagesRoles, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleStageRoles, 0);
  objc_storeStrong((id *)&self->_ambientPresentationStageRoles, 0);
  objc_storeStrong((id *)&self->_orientationStageRoles, 0);
  objc_storeStrong((id *)&self->_zOrderStageRoles, 0);
}

- (void)_updateArbitrationWithClientContext:(NSObject *)a3 defaultContext:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  __int128 v3;

  LODWORD(v3) = 134218240;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  WORD6(v3) = 2048;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_0(&dword_249196000, a2, a3, "Arbiter[%p] did update with context: %p.", (const void *)v3, *((const void **)&v3 + 1));
}

- (void)_updateArbitrationWithClientContext:(void *)a1 defaultContext:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_debug_impl(&dword_249196000, a2, OS_LOG_TYPE_DEBUG, "current resolution:\n%{public}@", (uint8_t *)&v4, 0xCu);

}

- (void)_updateArbitrationWithClientContext:(NSObject *)a3 defaultContext:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_249196000, a2, a3, "Arbiter[%p] will update with context: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

@end
