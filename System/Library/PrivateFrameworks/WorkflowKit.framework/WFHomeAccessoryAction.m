@implementation WFHomeAccessoryAction

- (void)initializeParameters
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFHomeAccessoryAction;
  -[WFAction initializeParameters](&v4, sel_initializeParameters);
  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEventObserver:", self);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeEventObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WFHomeAccessoryAction;
  -[WFHomeAccessoryAction dealloc](&v4, sel_dealloc);
}

- (void)wasAddedToWorkflowByUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[5];

  v4 = a3;
  -[WFHomeAccessoryAction home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__WFHomeAccessoryAction_wasAddedToWorkflowByUser___block_invoke;
    v8[3] = &unk_1E7AF94B0;
    v8[4] = self;
    objc_msgSend(v6, "ensureHomesAreLoadedWithCompletionHandler:", v8);

  }
  v7.receiver = self;
  v7.super_class = (Class)WFHomeAccessoryAction;
  -[WFAction wasAddedToWorkflowByUser:](&v7, sel_wasAddedToWorkflowByUser_, v4);

}

- (void)wasAddedToWorkflow:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WFHomeAccessoryAction;
  -[WFAction wasAddedToWorkflow:](&v7, sel_wasAddedToWorkflow_, v4);
  -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("WFHome"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "environment") == 2 || objc_msgSend(v4, "environment") == 1;
  objc_msgSend(v5, "setHidden:", v6);

}

- (HMHome)home
{
  void *v2;
  void *v3;

  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFHomeTriggerActionSets"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMHome *)v3;
}

- (NSArray)actionSets
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  WFHFTriggerActionSetsBuilderParameterState *v16;
  void *v17;
  WFHFTriggerActionSetsBuilderParameterState *v18;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFHomeTriggerActionSets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getWFHomeLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(v3, "actionSets");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315394;
      v21 = "-[WFHomeAccessoryAction actionSets]";
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEBUG, "%s Retrieved action sets from parameter state: %@", (uint8_t *)&v20, 0x16u);

    }
    objc_msgSend(v3, "actionSets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
    {
      v20 = 136315138;
      v21 = "-[WFHomeAccessoryAction actionSets]";
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEBUG, "%s No WFHFTriggerActionSetsBuilderParameterState falling back to old run scene", (uint8_t *)&v20, 0xCu);
    }

    -[WFAction supplementalParameterValueForKey:ofClass:](self, "supplementalParameterValueForKey:ofClass:", CFSTR("WFHomeName"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction supplementalParameterValueForKey:ofClass:](self, "supplementalParameterValueForKey:ofClass:", CFSTR("WFHomeSceneName"), objc_opt_class());
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v7 = 0;
    if (v8 && v9)
    {
      +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "homeNamed:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sceneNamed:inHome:", v10, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14
          && (v24[0] = v14,
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1),
              (v15 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v7 = (void *)v15;
          v16 = [WFHFTriggerActionSetsBuilderParameterState alloc];
          WFSerializableHomeIdentifier(v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[WFHFTriggerActionSetsBuilderParameterState initWithActionSets:homeIdentifier:](v16, "initWithActionSets:homeIdentifier:", v7, v17);
          -[WFHomeAccessoryAction setParameterState:forKey:](self, "setParameterState:forKey:", v18, CFSTR("WFHomeTriggerActionSets"));

        }
        else
        {
          -[WFHomeAccessoryAction setParameterState:forKey:](self, "setParameterState:forKey:", 0, CFSTR("WFHomeTriggerActionSets"));
          v7 = 0;
        }
        -[WFAction setSupplementalParameterValue:forKey:](self, "setSupplementalParameterValue:forKey:", 0, CFSTR("WFHomeName"));
        -[WFAction setSupplementalParameterValue:forKey:](self, "setSupplementalParameterValue:forKey:", 0, CFSTR("WFHomeSceneName"));

      }
      else
      {
        v7 = 0;
      }

    }
  }

  return (NSArray *)v7;
}

- (NSString)homeIdentifier
{
  void *v2;
  void *v3;

  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFHomeTriggerActionSets"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)shortcutsDictionaryRepresentations
{
  void *v2;
  void *v3;

  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFHomeTriggerActionSets"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serializedActionSets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)parameterStateForKey:(id)a3 fallingBackToDefaultValue:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  WFStringSubstitutableState *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("WFHome")))
  {
    -[WFHomeAccessoryAction homeIdentifier](self, "homeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = -[WFVariableSubstitutableParameterState initWithValue:]([WFStringSubstitutableState alloc], "initWithValue:", v7);
    else
      v8 = 0;

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFHomeAccessoryAction;
    -[WFAction parameterStateForKey:fallingBackToDefaultValue:](&v10, sel_parameterStateForKey_fallingBackToDefaultValue_, v6, v4);
    v8 = (WFStringSubstitutableState *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  WFHFTriggerActionSetsBuilderParameterState *v13;
  WFHFTriggerActionSetsBuilderParameterState *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("WFHome")))
  {
    v8 = v6;
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v11 = v9;

    objc_msgSend(v11, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [WFHFTriggerActionSetsBuilderParameterState alloc];
      v14 = -[WFHFTriggerActionSetsBuilderParameterState initWithActionSets:homeIdentifier:](v13, "initWithActionSets:homeIdentifier:", MEMORY[0x1E0C9AA60], v12);
      v10 = -[WFHomeAccessoryAction setParameterState:forKey:](self, "setParameterState:forKey:", v14, CFSTR("WFHomeTriggerActionSets"));

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFHomeAccessoryAction;
    v10 = -[WFAction setParameterState:forKey:](&v16, sel_setParameterState_forKey_, v6, v7);
  }

  return v10;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  _QWORD v5[5];

  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__WFHomeAccessoryAction_runAsynchronouslyWithInput___block_invoke;
  v5[3] = &unk_1E7AF94B0;
  v5[4] = self;
  objc_msgSend(v4, "ensureHomesAreLoadedWithCompletionHandler:", v5);

}

- (void)performHomeAccessoryAction
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v12;
  id obj;
  _QWORD block[6];
  _QWORD v15[4];
  NSObject *v16;
  _QWORD *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFHomeTriggerActionSets"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionSets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_group_create();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__31084;
  v22[4] = __Block_byref_object_dispose__31085;
  v23 = 0;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8);
        dispatch_group_enter(v4);
        v15[0] = v6;
        v15[1] = 3221225472;
        v15[2] = __51__WFHomeAccessoryAction_performHomeAccessoryAction__block_invoke;
        v15[3] = &unk_1E7AF0E20;
        v17 = v22;
        v16 = v4;
        objc_msgSend(v2, "executeActionSet:completionHandler:", v9, v15);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v5);
  }

  dispatch_get_global_queue(0, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __51__WFHomeAccessoryAction_performHomeAccessoryAction__block_invoke_2;
  block[3] = &unk_1E7AF92E8;
  block[4] = self;
  block[5] = v22;
  dispatch_group_notify(v4, v10, block);

  _Block_object_dispose(v22, 8);
}

- (id)localizedAttributionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[WFHomeAccessoryAction homeName](self, "homeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFHomeAccessoryAction;
    -[WFAction localizedAttributionWithContext:](&v10, sel_localizedAttributionWithContext_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)homeName
{
  void *v2;
  void *v3;

  -[WFHomeAccessoryAction home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)localizedParameterSummaryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__WFHomeAccessoryAction_localizedParameterSummaryWithCompletion___block_invoke;
  v7[3] = &unk_1E7AF76F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "ensureHomesAreLoadedWithCompletionHandler:", v7);

}

- (id)localizedSummaryText
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[WFHomeAccessoryAction home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(getHFTriggerActionSetsBuilderClass_31067());
    -[WFHomeAccessoryAction actionSets](self, "actionSets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithActionSets:inHome:", v5, v3);

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v6, "actionSetsSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "summaryText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("Set %@"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFAction localizedName](self, "localizedName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

void __65__WFHomeAccessoryAction_localizedParameterSummaryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "localizedSummaryText");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __51__WFHomeAccessoryAction_performHomeAccessoryAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getHMErrorDomain();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    v6 = objc_msgSend(v3, "code");

    if (v6 == 25)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v15[0] = *MEMORY[0x1E0CB2D68];
      WFLocalizedString(CFSTR("Scene or Accessory Not Found"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v8;
      v15[1] = *MEMORY[0x1E0CB2D50];
      WFLocalizedString(CFSTR("Please make sure the selected Home scene or accessory is available in your home."));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 5, v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v11;
    }
  }
  else
  {

  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;
  v14 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __51__WFHomeAccessoryAction_performHomeAccessoryAction__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __52__WFHomeAccessoryAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
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
  uint64_t v39;
  NSObject *v40;
  void *v41;
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  const char *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "actionSets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "environment");

  objc_msgSend(*(id *)(a1 + 32), "userInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInterfaceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == (void *)*MEMORY[0x1E0D14320])
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "userInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userInterfaceType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != (void *)*MEMORY[0x1E0D14328];

  }
  if (v4 == 1 || v9)
  {
LABEL_32:
    objc_msgSend(*(id *)(a1 + 32), "performHomeAccessoryAction");
    goto LABEL_33;
  }
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v10 = v2;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, buf, 16);
  if (!v11)
  {
LABEL_14:

LABEL_31:
    goto LABEL_32;
  }
  v12 = v11;
  v13 = *(_QWORD *)v46;
LABEL_8:
  v14 = 0;
  while (1)
  {
    if (*(_QWORD *)v46 != v13)
      objc_enumerationMutation(v10);
    if ((objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v14), "requiresDeviceUnlock") & 1) != 0)
      break;
    if (v12 == ++v14)
    {
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, buf, 16);
      if (v12)
        goto LABEL_8;
      goto LABEL_14;
    }
  }

  v15 = VCIsDeviceLocked();
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("WFActionDidResume"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if ((v19 & 1) != 0)
    goto LABEL_32;
  objc_msgSend(*(id *)(a1 + 32), "runningDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "runningDelegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "currentRunningContextForAction:", *(_QWORD *)(a1 + 32));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v10, "rootWorkflowIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = v23;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "workflow");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "workflowID");
    v25 = (id)objc_claimAutoreleasedReturnValue();

  }
  +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "configuredTriggersForWorkflowID:error:", v25, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    if (!objc_msgSend(v29, "shouldPrompt"))
    {
      objc_msgSend(v30, "trigger");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v15) = v15 | objc_msgSend((id)objc_opt_class(), "isUserInitiated") ^ 1;

    }
    if ((v15 & 1) != 0)
      goto LABEL_26;
LABEL_30:

    goto LABEL_31;
  }
  if (!v15)
    goto LABEL_30;
LABEL_26:
  v32 = (void *)objc_opt_new();
  objc_msgSend(v32, "setPreferredStyle:", 1);
  objc_msgSend(v30, "trigger");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localizedDescriptionWithConfigurationSummary");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTitle:", v34);

  v35 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedStringWithKey(CFSTR("TapToRunAction"), CFSTR("Tap to run “%@”"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localizedSummaryText");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringWithFormat:", v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setMessage:", v38);

  v39 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __52__WFHomeAccessoryAction_runAsynchronouslyWithInput___block_invoke_2;
  v44[3] = &unk_1E7AF94B0;
  v44[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v32, "setSuccessHandler:", v44);
  v43[0] = v39;
  v43[1] = 3221225472;
  v43[2] = __52__WFHomeAccessoryAction_runAsynchronouslyWithInput___block_invoke_3;
  v43[3] = &unk_1E7AF94B0;
  v43[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v32, "setCancellationHandler:", v43);
  v42[0] = v39;
  v42[1] = 3221225472;
  v42[2] = __52__WFHomeAccessoryAction_runAsynchronouslyWithInput___block_invoke_4;
  v42[3] = &unk_1E7AF94B0;
  v42[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v32, "setFailureHandler:", v42);
  getWFTriggersLogObject();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v50 = "-[WFHomeAccessoryAction runAsynchronouslyWithInput:]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v40, OS_LOG_TYPE_INFO, "%s Presenting secure accessory confirmation dialog and suspending (if the display is off)", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "userInterface");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "presentAlert:", v32);

LABEL_33:
}

uint64_t __52__WFHomeAccessoryAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performHomeAccessoryAction");
}

void __52__WFHomeAccessoryAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishRunningWithError:", v2);

}

void __52__WFHomeAccessoryAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "deviceLockedError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishRunningWithError:", v2);

}

void __50__WFHomeAccessoryAction_wasAddedToWorkflowByUser___block_invoke(uint64_t a1)
{
  void *v2;
  WFHFTriggerActionSetsBuilderParameterState *v3;
  void *v4;
  WFHFTriggerActionSetsBuilderParameterState *v5;
  id v6;

  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryHome");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v3 = [WFHFTriggerActionSetsBuilderParameterState alloc];
    WFSerializableHomeIdentifier(v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[WFHFTriggerActionSetsBuilderParameterState initWithActionSets:homeIdentifier:](v3, "initWithActionSets:homeIdentifier:", MEMORY[0x1E0C9AA60], v4);

    objc_msgSend(*(id *)(a1 + 32), "setParameterState:forKey:", v5, CFSTR("WFHomeTriggerActionSets"));
  }

}

@end
