@implementation SBTraitsOrientationDefaultTreeResolver

- (void)resolveStagePreferencesWithContext:(id)a3 preferencesTree:(id)a4
{
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  char v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id obj;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  BOOL v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[4];
  uint64_t v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v5 = a4;
  if (!v5)
    -[SBTraitsOrientationDefaultTreeResolver resolveStagePreferencesWithContext:preferencesTree:].cold.1();
  v40 = v5;
  objc_msgSend(v5, "topologicalSort");
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (v44)
  {
    v43 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v58 != v43)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v7, "participant");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "orientationPreferences");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v47 = i;
          objc_msgSend(v8, "currentSettings");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "orientationSettings");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "orientationMapResolver");
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          v49 = v7;
          objc_msgSend(v7, "parent");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "participant");
          v13 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v42, "rawInputs");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "deviceOrientationInputs");
          v15 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v42, "validatedInputs");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "deviceOrientationInputs");
          v17 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "orientationResolutionPolicyInfo");
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v9, "preferredOrientation");
          objc_msgSend(v8, "currentSettings");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "orientationSettings");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "orientation");

          v51 = v9;
          v23 = objc_msgSend(v9, "supportedOrientations");
          v46 = (void *)v18;
          v53 = (void *)v13;
          v24 = -[SBTraitsOrientationDefaultTreeResolver _targetOrientationForResolutionInfo:validatedInputs:rawInputs:participant:parent:](self, "_targetOrientationForResolutionInfo:validatedInputs:rawInputs:participant:parent:", v18, v17, v15, v8, v13);
          -[SBTraitsOrientationDefaultTreeResolver _mapResolverForTargetOrientation:currentOrientation:](self, "_mapResolverForTargetOrientation:currentOrientation:", v24, v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "interfaceOrientationForSupportedOrientations:preferredOrientation:", v23, v19);
          -[SBTraitsOrientationDefaultTreeResolver _mapResolverForTargetOrientation:currentOrientation:](self, "_mapResolverForTargetOrientation:currentOrientation:", v24, v26);
          v27 = objc_claimAutoreleasedReturnValue();
          v48 = (void *)v17;
          v50 = (void *)v15;
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC08F0]), "initWithOrientation:orientationMapResolver:validatedOrientationInputs:rawOrientationInputs:", v26, v27, v17, v15);
          if (v22 == objc_msgSend(v28, "orientation")
            && (objc_msgSend(v28, "orientationMapResolver"),
                v29 = (void *)objc_claimAutoreleasedReturnValue(),
                v30 = objc_msgSend(v52, "isEqual:", v29),
                v29,
                (v30 & 1) != 0))
          {
            v31 = 0;
            v32 = v49;
            v33 = v25;
            v34 = v46;
            i = v47;
          }
          else
          {
            objc_msgSend(v53, "orientationResolutionPolicyInfo");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v49;
            v36 = -[SBTraitsOrientationDefaultTreeResolver _node:validatesNewSettings:](self, "_node:validatesNewSettings:", v49, v28);
            v31 = v36;
            v33 = v25;
            v34 = v46;
            i = v47;
            if (v36)
            {
              objc_msgSend(v46, "actuationContext");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v37)
              {
                if (objc_msgSend(v46, "resolutionPolicy") == 3)
                {
                  objc_msgSend(v35, "actuationContext");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v37 = 0;
                }
              }
              objc_msgSend(v46, "setActuationContext:", v37);

            }
          }
          objc_msgSend(v32, "settingsUpdater");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v54[0] = MEMORY[0x1E0C809B0];
          v54[1] = 3221225472;
          v54[2] = __93__SBTraitsOrientationDefaultTreeResolver_resolveStagePreferencesWithContext_preferencesTree___block_invoke;
          v54[3] = &unk_1E8EBBBF8;
          v56 = v31;
          v55 = v28;
          v39 = v28;
          objc_msgSend(v38, "updateOrientationSettingsWithBlock:", v54);

          v9 = v51;
        }
        else
        {
          SBLogTraitsArbiter();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            -[SBTraitsOrientationDefaultTreeResolver resolveStagePreferencesWithContext:preferencesTree:].cold.2(v61, v8, &v62, v27);
        }

      }
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    }
    while (v44);
  }

}

- (id)_mapResolverForTargetOrientation:(int64_t)a3 currentOrientation:(int64_t)a4
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (a4 + 32 * a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_mapResolverCache, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01708]), "initWithTargetOrientation:currentOrientation:", a3, a4);
    -[NSMutableDictionary setObject:forKey:](self->_mapResolverCache, "setObject:forKey:", v8, v7);
  }

  return v8;
}

- (int64_t)_targetOrientationForResolutionInfo:(id)a3 validatedInputs:(id)a4 rawInputs:(id)a5 participant:(id)a6 parent:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (a7)
  {
    objc_msgSend(a7, "currentSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "orientationSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "orientation");

  }
  else if (objc_msgSend(v11, "resolutionPolicy") == 1)
  {
    v18 = v14;
    v19 = v11;
    v40 = v12;
    v39 = v13;
    objc_msgSend(v19, "associatedDeviceOrientationStateTypes");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "resolutionPolicy") == 1 && objc_msgSend(v20, "count"))
    {
      v37 = v19;
      objc_msgSend(v19, "associatedDeviceOrientationStateTypesBySupportedOrientationMask");
      v21 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v21;
      if (v21)
      {
        v22 = (void *)v21;
        v23 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v18, "orientationPreferences");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "supportedOrientations"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKey:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v27 = v26;

          v20 = v27;
        }

      }
      v38 = v18;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v20 = v20;
      v28 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v42;
LABEL_12:
        v31 = 0;
        while (2)
        {
          if (*(_QWORD *)v42 != v30)
            objc_enumerationMutation(v20);
          switch(objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v31), "integerValue"))
          {
            case 0:
              v32 = v40;
              goto LABEL_19;
            case 1:
              v33 = v40;
              goto LABEL_21;
            case 2:
              v32 = v39;
LABEL_19:
              v34 = objc_msgSend(v32, "currentDeviceOrientation");
              goto LABEL_22;
            case 3:
              v33 = v39;
LABEL_21:
              v34 = objc_msgSend(v33, "nonFlatDeviceOrientation");
LABEL_22:
              v17 = v34;
              if ((unint64_t)(v34 - 1) >= 4)
                goto LABEL_23;
              goto LABEL_26;
            default:
LABEL_23:
              if (v29 != ++v31)
                continue;
              v29 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
              if (!v29)
                goto LABEL_25;
              goto LABEL_12;
          }
        }
      }
LABEL_25:
      v17 = 0;
LABEL_26:

      v19 = v37;
      v18 = v38;
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __93__SBTraitsOrientationDefaultTreeResolver_resolveStagePreferencesWithContext_preferencesTree___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v6, "setOrientation:", objc_msgSend(*(id *)(a1 + 32), "orientation"));
    objc_msgSend(*(id *)(a1 + 32), "orientationMapResolver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOrientationMapResolver:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "rawOrientationInputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRawOrientationInputs:", v4);

  objc_msgSend(*(id *)(a1 + 32), "validatedOrientationInputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValidatedOrientationInputs:", v5);

}

- (BOOL)_node:(id)a3 validatesNewSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "participant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TRASettingsValidator setOrientationSettings:](self->_settingsValidator, "setOrientationSettings:", v6);
    objc_msgSend(v9, "validateSettingsForParticipant:validator:", v8, self->_settingsValidator);
    v10 = -[TRASettingsValidator didValidateOrientationSettings](self->_settingsValidator, "didValidateOrientationSettings");
  }
  else
  {
    v10 = 1;
  }
  objc_msgSend(v7, "setDebugLastSettingsWereValidated:", v10);
  -[TRASettingsValidator orientationSettingsValidatedReason](self->_settingsValidator, "orientationSettingsValidatedReason");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDebugLastOrientationSettingsValidationFailureReason:", v11);

  return v10;
}

- (SBTraitsOrientationDefaultTreeResolver)initWithComponentOrder:(id)a3
{
  SBTraitsOrientationDefaultTreeResolver *v3;
  TRASettingsValidator *v4;
  TRASettingsValidator *settingsValidator;
  uint64_t v6;
  NSMutableDictionary *mapResolverCache;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBTraitsOrientationDefaultTreeResolver;
  v3 = -[SBTraitsOrientationStageComponent initWithComponentOrder:](&v9, sel_initWithComponentOrder_, a3);
  if (v3)
  {
    v4 = (TRASettingsValidator *)objc_alloc_init(MEMORY[0x1E0DC08F8]);
    settingsValidator = v3->_settingsValidator;
    v3->_settingsValidator = v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 25);
    v6 = objc_claimAutoreleasedReturnValue();
    mapResolverCache = v3->_mapResolverCache;
    v3->_mapResolverCache = (NSMutableDictionary *)v6;

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapResolverCache, 0);
  objc_storeStrong((id *)&self->_settingsValidator, 0);
}

- (void)resolveStagePreferencesWithContext:preferencesTree:.cold.1()
{
  __assert_rtn("-[SBTraitsOrientationDefaultTreeResolver resolveStagePreferencesWithContext:preferencesTree:]", "SBTraitsOrientationStageComponents.m", 264, "preferencesTree");
}

- (void)resolveStagePreferencesWithContext:(_QWORD *)a3 preferencesTree:(NSObject *)a4 .cold.2(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_1D0540000, a4, OS_LOG_TYPE_ERROR, "Orientation trait participant[%{public}@] is not providing orientation preferences.", a1, 0xCu);

}

@end
