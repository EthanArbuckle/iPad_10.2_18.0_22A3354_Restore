@implementation WFHandleDonatedIntentAction

- (WFHandleDonatedIntentAction)initWithIntent:(id)a3
{
  return -[WFHandleDonatedIntentAction initWithIntent:forceExecutionOnPhone:](self, "initWithIntent:forceExecutionOnPhone:", a3, 0);
}

- (WFHandleDonatedIntentAction)initWithIntent:(id)a3 forceExecutionOnPhone:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v6;
  id v7;
  void *v8;
  WFHandleDonatedIntentAction *v9;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CBD9A8];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithIntent:response:", v7, 0);

  v9 = -[WFHandleDonatedIntentAction initWithInteraction:forceExecutionOnPhone:](self, "initWithInteraction:forceExecutionOnPhone:", v8, v4);
  return v9;
}

- (WFHandleDonatedIntentAction)initWithInteraction:(id)a3 forceExecutionOnPhone:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  WFActionRequest *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  WFHandleDonatedIntentAction *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v26;
  WFActionRequest *v27;
  const __CFString *v28;
  void *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  NSObject *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v4 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v26 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v26);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v26;
    if (v8)
    {
      v28 = CFSTR("IntentData");
      v29 = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "mutableCopy");

      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v12, CFSTR("ForceExecutionOnPhone"));

      }
      objc_msgSend(v6, "groupIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v6, "groupIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v14, CFSTR("GroupIdentifier"));

      }
      v15 = -[WFActionRequest initWithActionIdentifier:serializedParameters:]([WFActionRequest alloc], "initWithActionIdentifier:serializedParameters:", CFSTR("is.workflow.actions.sirikit.donation.handle"), v11);
      v16 = (void *)objc_opt_new();
      v27 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "createActionsForRequests:", v17);

      -[WFActionRequest result](v15, "result");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_opt_class();
      v20 = v18;
      if (v20 && (objc_opt_isKindOfClass() & 1) == 0)
      {
        getWFGeneralLogObject();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          v23 = (void *)objc_opt_class();
          *(_DWORD *)buf = 136315906;
          v31 = "WFEnforceClass";
          v32 = 2114;
          v33 = v20;
          v34 = 2114;
          v35 = v23;
          v36 = 2114;
          v37 = v19;
          v24 = v23;
          _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

        }
        v21 = 0;
      }
      else
      {
        v21 = v20;
      }

    }
    else
    {
      getWFWorkflowExecutionLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v31 = "-[WFHandleDonatedIntentAction(WFLCompatibility) initWithInteraction:forceExecutionOnPhone:]";
        v32 = 2114;
        v33 = v9;
        _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_ERROR, "%s Failed to create WFL-compatible WFHandleDonatedIntentAction due to error serizlializing the intent: %{public}@", buf, 0x16u);
      }
      v21 = 0;
    }

  }
  else
  {
    getWFWorkflowExecutionLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[WFHandleDonatedIntentAction(WFLCompatibility) initWithInteraction:forceExecutionOnPhone:]";
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_ERROR, "%s Failed to create WFL-compatible WFHandleDonatedIntentAction because intent was nil", buf, 0xCu);
    }
    v21 = 0;
  }

  return v21;
}

- (void)continueInAppWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  -[WFHandleDonatedIntentAction intent](self, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __84__WFHandleDonatedIntentAction_WFLCompatibility__continueInAppWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E7AEAC58;
    v7 = v4;
    +[WFOpenUserActivityAction createActionWithIntent:completionHandler:](WFOpenUserActivityAction, "createActionWithIntent:completionHandler:", v5, v6);

  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

void __84__WFHandleDonatedIntentAction_WFLCompatibility__continueInAppWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__WFHandleDonatedIntentAction_WFLCompatibility__continueInAppWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E7AF7128;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "runWithInput:userInterface:runningDelegate:variableSource:workQueue:completionHandler:", v4, 0, 0, 0, MEMORY[0x1E0C80D38], v5);

}

uint64_t __84__WFHandleDonatedIntentAction_WFLCompatibility__continueInAppWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a3 == 0);
}

- (WFHandleDonatedIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 stringLocalizer:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  WFHandleDonatedIntentAction *v31;
  WFHandleDonatedIntentAction *v32;
  void *v33;
  id *p_intent;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSString *title;
  NSString *v42;
  void *v43;
  uint64_t v44;
  NSString *v45;
  NSString *subtitle;
  NSString *v47;
  void *v48;
  uint64_t v49;
  NSString *v50;
  WFHandleDonatedIntentAction *v51;
  id v53;
  id v54;
  void *v55;
  _QWORD v56[4];
  WFHandleDonatedIntentAction *v57;
  id v58;
  objc_super v59;
  id v60;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_msgSend(a5, "mutableCopy");
  objc_msgSend(v13, "wf_popObjectForKey:", CFSTR("IntentData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  WFEnforceClass(v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "wf_popObjectForKey:", CFSTR("ForceExecutionOnPhone"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_class();
  WFEnforceClass(v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(v13, "wf_popObjectForKey:", CFSTR("GroupIdentifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_class();
  WFEnforceClass(v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = v16;
  if (objc_msgSend(v16, "length"))
  {
    v60 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v16, &v60);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v60;
    if (v24)
    {
      objc_msgSend(v24, "typeName");
      v25 = v12;
      v26 = v23;
      v27 = v10;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFIntentActionProvider disabledPlatformsForIntentWithTypeName:](WFIntentActionProvider, "disabledPlatformsForIntentWithTypeName:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      WFInjectDisabledPlatformsInActionDefinition(v29, v11);
      v30 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v30;
      v10 = v27;
      v23 = v26;
      v12 = v25;
      v16 = v55;
    }
  }
  else
  {
    v54 = 0;
    v24 = 0;
  }
  v59.receiver = self;
  v59.super_class = (Class)WFHandleDonatedIntentAction;
  v31 = -[WFHandleIntentAction initWithIdentifier:definition:serializedParameters:stringLocalizer:](&v59, sel_initWithIdentifier_definition_serializedParameters_stringLocalizer_, v10, v11, v13, v12);
  v32 = v31;
  if (v31)
  {
    v33 = v12;
    v53 = v10;
    p_intent = (id *)&v31->_intent;
    objc_storeStrong((id *)&v31->_intent, v24);
    v32->_forceExecutionOnPhone = v20;
    objc_storeStrong((id *)&v32->_groupIdentifier, v23);
    objc_msgSend(*p_intent, "launchId");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(MEMORY[0x1E0CBD960], "sharedConnection");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(*p_intent, "launchId");
      v38 = v23;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setWithObject:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __98__WFHandleDonatedIntentAction_initWithIdentifier_definition_serializedParameters_stringLocalizer___block_invoke;
      v56[3] = &unk_1E7AF92C0;
      v57 = v32;
      v58 = v33;
      objc_msgSend(v36, "wf_accessBundleContentForBundleIdentifiers:withBlock:", v40, v56);

      v23 = v38;
    }
    title = v32->_title;
    if (title)
    {
      v42 = title;
      v43 = v32->_title;
      v32->_title = v42;
      v12 = v33;
    }
    else
    {
      v12 = v33;
      objc_msgSend(*p_intent, "_titleWithLocalizer:fromBundleURL:", v33, 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "copy");
      v45 = v32->_title;
      v32->_title = (NSString *)v44;

    }
    subtitle = v32->_subtitle;
    v16 = v55;
    if (subtitle)
    {
      v47 = subtitle;
      v48 = v32->_subtitle;
      v32->_subtitle = v47;
    }
    else
    {
      objc_msgSend(*p_intent, "_subtitleWithLocalizer:fromBundleURL:", v12, 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "copy");
      v50 = v32->_subtitle;
      v32->_subtitle = (NSString *)v49;

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*p_intent, "_setLaunchId:", *MEMORY[0x1E0DC7FA0]);
    v51 = v32;
    v10 = v53;
  }

  return v32;
}

- (id)executorWithIntent:(id)a3 groupIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    -[WFHandleDonatedIntentAction groupIdentifier](self, "groupIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11.receiver = self;
  v11.super_class = (Class)WFHandleDonatedIntentAction;
  -[WFHandleIntentAction executorWithIntent:groupIdentifier:](&v11, sel_executorWithIntent_groupIdentifier_, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)

  objc_msgSend(v9, "setForceExecutionOnPhone:", -[WFHandleDonatedIntentAction forceExecutionOnPhone](self, "forceExecutionOnPhone"));
  return v9;
}

- (id)serializedParameters
{
  INIntent *intent;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  id v12;

  intent = self->_intent;
  if (intent)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", intent, 1, &v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v12;
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = objc_alloc(MEMORY[0x1E0C99E08]);
  v11.receiver = self;
  v11.super_class = (Class)WFHandleDonatedIntentAction;
  -[WFAction serializedParameters](&v11, sel_serializedParameters);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithDictionary:", v7);

  objc_msgSend(v8, "setValue:forKey:", v4, CFSTR("IntentData"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_forceExecutionOnPhone);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("ForceExecutionOnPhone"));

  objc_msgSend(v8, "setValue:forKey:", self->_groupIdentifier, CFSTR("GroupIdentifier"));
  return v8;
}

- (void)initializeParameters
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFHandleDonatedIntentAction;
  -[WFHandleIntentAction initializeParameters](&v4, sel_initializeParameters);
  -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("ShowWhenRun"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", -[WFHandleIntentAction requiresShowsWhenRun](self, "requiresShowsWhenRun"));

}

- (id)intentDescriptor
{
  INIntentDescriptor *intentDescriptor;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  INIntentDescriptor *v10;
  INIntentDescriptor *v11;
  INIntentDescriptor *v12;

  intentDescriptor = self->_intentDescriptor;
  if (!intentDescriptor)
  {
    -[WFAction supplementalParameterValueForKey:ofClass:](self, "supplementalParameterValueForKey:ofClass:", CFSTR("IntentAppDefinition"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD980]), "initWithSerializedRepresentation:", v4);
    }
    else
    {
      -[WFHandleDonatedIntentAction intent](self, "intent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v12 = 0;
        return v12;
      }
      v7 = objc_alloc(MEMORY[0x1E0CBD980]);
      -[WFHandleDonatedIntentAction intent](self, "intent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v7, "initWithIntent:", v8);

    }
    objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resolvedIntentMatchingDescriptor:", v5);
    v10 = (INIntentDescriptor *)objc_claimAutoreleasedReturnValue();
    v11 = self->_intentDescriptor;
    self->_intentDescriptor = v10;

    intentDescriptor = self->_intentDescriptor;
  }
  v12 = intentDescriptor;
  return v12;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[WFHandleDonatedIntentAction title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFHandleDonatedIntentAction;
    -[WFHandleIntentAction localizedNameWithContext:](&v10, sel_localizedNameWithContext_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)localizedKeyParameterDisplayName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[WFHandleDonatedIntentAction intent](self, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFHandleDonatedIntentAction intent](self, "intent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_codableDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyAttribute");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedDisplayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)intentCategory
{
  void *v3;
  void *v4;
  int64_t v5;

  -[WFHandleDonatedIntentAction intent](self, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFHandleDonatedIntentAction intent](self, "intent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_intentCategory");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)appIdentifier
{
  void *v2;
  void *v3;

  -[WFHandleDonatedIntentAction intentDescriptor](self, "intentDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayableBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[WFHandleIntentAction appDescriptor](self, "appDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedStringResourceWithKey(CFSTR("Perform the action “%@” in %@."), CFSTR("Perform the action “%@” in %@."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localize:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction localizedName](self, "localizedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v9, v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)parameterSummary
{
  WFActionParameterSummary *v3;
  void *v4;
  WFActionParameterSummary *v5;

  v3 = [WFActionParameterSummary alloc];
  -[WFHandleDonatedIntentAction title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFActionParameterSummary initWithLocalizedString:](v3, "initWithLocalizedString:", v4);

  return v5;
}

- (id)intentDescription
{
  void *v2;
  void *v3;

  -[WFHandleDonatedIntentAction intent](self, "intent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_intentInstanceDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)slots
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)generatedIntentWithIdentifier:(id)a3 input:(id)a4 processedParameters:(id)a5 error:(id *)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[WFHandleDonatedIntentAction intent](self, "intent", a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFHandleDonatedIntentAction intent](self, "intent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "copy");

    -[WFHandleDonatedIntentAction intentDescriptor](self, "intentDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setLaunchId:", v10);

    -[WFHandleDonatedIntentAction intentDescriptor](self, "intentDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "extensionBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setExtensionBundleId:", v12);

  }
  return v7;
}

- (BOOL)requiresRemoteExecution
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFHandleDonatedIntentAction;
  return -[WFHandleIntentAction requiresRemoteExecution](&v3, sel_requiresRemoteExecution);
}

- (id)metricsIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WFAction identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleDonatedIntentAction intent](self, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "launchId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleDonatedIntentAction intentDescription](self, "intentDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@.%@"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a5;
  v10 = a4;
  if (v7)
  {
    WFLocalizedString(CFSTR("Allow “%@” to share %@ with “%@”?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v7, v10);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%@” to run actions from “%@”?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setIntentDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_intentDescriptor, a3);
}

- (INIntent)intent
{
  return self->_intent;
}

- (void)setIntent:(id)a3
{
  objc_storeStrong((id *)&self->_intent, a3);
}

- (BOOL)forceExecutionOnPhone
{
  return self->_forceExecutionOnPhone;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_intentDescriptor, 0);
}

void __98__WFHandleDonatedIntentAction_initWithIdentifier_definition_serializedParameters_stringLocalizer___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "_titleWithLocalizer:fromBundleURL:", *(_QWORD *)(a1 + 40), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "_codableDescription");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedTitleWithLocalizer:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 416), v5);
  if (!v4)
  {

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "_subtitleWithLocalizer:fromBundleURL:", *(_QWORD *)(a1 + 40), 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "copy");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 424);
  *(_QWORD *)(v7 + 424) = v6;

}

+ (id)intentActionWithShortcut:(id)a3 forceExecutionOnPhone:(BOOL)a4 groupIdentifier:(id)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v7 = a4;
  v22[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  objc_msgSend(a3, "intent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, a6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      v12 = (void *)objc_opt_new();
      objc_msgSend(v12, "setValue:forKey:", v11, CFSTR("IntentData"));
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("ForceExecutionOnPhone"));

      }
      if (v9)
        objc_msgSend(v12, "setObject:forKey:", v9, CFSTR("GroupIdentifier"));
      +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "createActionWithIdentifier:serializedParameters:", CFSTR("is.workflow.actions.sirikit.donation.handle"), v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_opt_class();
      WFEnforceClass(v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    if (a6)
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2D50];
      v22[0] = CFSTR("Could not create action because the intent was missing");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 5, v19);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    v17 = 0;
  }

  return v17;
}

@end
