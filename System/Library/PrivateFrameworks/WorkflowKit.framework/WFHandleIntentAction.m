@implementation WFHandleIntentAction

- (WFHandleIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  WFHandleIntentAction *v13;

  v8 = (void *)MEMORY[0x1E0CBDC38];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "localizerForLanguage:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WFHandleIntentAction initWithIdentifier:definition:serializedParameters:stringLocalizer:](self, "initWithIdentifier:definition:serializedParameters:stringLocalizer:", v11, v10, v9, v12);

  return v13;
}

- (WFHandleIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 stringLocalizer:(id)a6
{
  id v10;
  WFHandleIntentAction *v11;
  void *v12;
  WFHandleIntentAction *v13;
  objc_super v15;

  v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)WFHandleIntentAction;
  v11 = -[WFAction initWithIdentifier:definition:serializedParameters:](&v15, sel_initWithIdentifier_definition_serializedParameters_, a3, a4, a5);
  if (v11)
  {
    v12 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CBDC38], "localizerForLanguage:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v11->_stringLocalizer, v12);
    if (!v10)

    v13 = v11;
  }

  return v11;
}

- (id)defaultLocalizationContext
{
  WFActionLocalizationContext *v3;
  void *v4;
  void *v5;
  WFActionLocalizationContext *v6;

  v3 = [WFActionLocalizationContext alloc];
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleIntentAction stringLocalizer](self, "stringLocalizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFActionLocalizationContext initWithLocale:stringLocalizer:](v3, "initWithLocale:stringLocalizer:", v4, v5);

  return v6;
}

- (id)disabledOnPlatforms
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFHandleIntentAction;
  -[WFAction disabledOnPlatforms](&v3, sel_disabledOnPlatforms);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isProgressIndeterminate
{
  return 0;
}

- (BOOL)inputPassthrough
{
  void *v2;
  void *v3;
  BOOL v4;

  -[WFAction outputDictionary](self, "outputDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Types"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
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
  -[WFHandleIntentAction overrideLocalizedName](self, "overrideLocalizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFHandleIntentAction;
    -[WFAction localizedNameWithContext:](&v10, sel_localizedNameWithContext_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)initializeParameters
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)WFHandleIntentAction;
  -[WFAction initializeParameters](&v13, sel_initializeParameters);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[WFAction parameters](self, "parameters", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "resourceManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        WFConfigureIntentBasedParameterResources(v8, self);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[WFAction processedParameters](self, "processedParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__WFHandleIntentAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_1E7AEB9B8;
  v6[4] = self;
  -[WFHandleIntentAction generatePopulatedIntentFromInput:processedParameters:completion:](self, "generatePopulatedIntentFromInput:processedParameters:completion:", v4, v5, v6);

}

- (void)finishRunningWithError:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[WFHandleIntentAction setExecutor:](self, "setExecutor:", 0);
  v5.receiver = self;
  v5.super_class = (Class)WFHandleIntentAction;
  -[WFAction finishRunningWithError:](&v5, sel_finishRunningWithError_, v4);

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  -[WFHandleIntentAction executor](self, "executor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)WFHandleIntentAction;
  -[WFAction cancel](&v4, sel_cancel);
}

- (INCExtensionConnection)connection
{
  void *v2;
  void *v3;

  -[WFHandleIntentAction executor](self, "executor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (INCExtensionConnection *)v3;
}

- (BOOL)skipsProcessingHiddenParameters
{
  return 1;
}

- (BOOL)prefersActionAttribution
{
  void *v3;
  int v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFHandleIntentAction;
  if (-[WFAction prefersActionAttribution](&v6, sel_prefersActionAttribution))
  {
    -[WFAction identifier](self, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("is.workflow.actions")) ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)appBundleIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[WFHandleIntentAction intentDescriptor](self, "intentDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayableBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[WFHandleIntentAction intentDescriptor](self, "intentDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)externalMetricsActionIdentifier
{
  void *v2;
  void *v3;

  -[WFHandleIntentAction intentDescriptor](self, "intentDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentClassName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)wasAddedToWorkflowByUser:(id)a3
{
  id v4;
  int v5;
  void *v6;
  WFBooleanSubstitutableState *v7;
  WFBooleanSubstitutableState *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFHandleIntentAction;
  v4 = a3;
  -[WFAction wasAddedToWorkflowByUser:](&v9, sel_wasAddedToWorkflowByUser_, v4);
  v5 = objc_msgSend(v4, "hiddenFromLibraryAndSync", v9.receiver, v9.super_class);

  if (v5)
  {
    -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("ShowWhenRun"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [WFBooleanSubstitutableState alloc];
      v8 = -[WFNumberSubstitutableState initWithNumber:](v7, "initWithNumber:", MEMORY[0x1E0C9AAA0]);
      -[WFAction setParameterState:forKey:](self, "setParameterState:forKey:", v8, CFSTR("ShowWhenRun"));

    }
  }
}

- (BOOL)requiresShowsWhenRun
{
  return -[WFHandleIntentAction intentCategory](self, "intentCategory") == 4;
}

- (id)showsWhenRunIfApplicable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  if (-[WFHandleIntentAction requiresShowsWhenRun](self, "requiresShowsWhenRun"))
  {
    v3 = (void *)MEMORY[0x1E0C9AAB0];
  }
  else
  {
    -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("ShowWhenRun"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4
      && (objc_msgSend(v4, "isHidden") & 1) == 0
      && (objc_msgSend(v5, "resourceManager"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "resourcesRequiredForDisplayAvailable"),
          v6,
          v7))
    {
      -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("ShowWhenRun"), objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (BOOL)showsWhenRun
{
  void *v2;
  char v3;

  -[WFHandleIntentAction showsWhenRunIfApplicable](self, "showsWhenRunIfApplicable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)opensInApp
{
  void *v2;
  char v3;

  -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("OpenInApp"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (unint64_t)allowsInteractiveSlotResolution
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[WFAction userInterface](self, "userInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isRunningWithSiriUI") & 1) == 0)
  {

    return 1;
  }
  -[WFAction userInterface](self, "userInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "executionContext");

  if (v5 <= 9 && ((1 << v5) & 0x206) != 0)
    return 1;
  if (-[WFHandleIntentAction isWorkflowInDatabase](self, "isWorkflowInDatabase"))
    return 2;
  else
    return 0;
}

- (int64_t)intentCategory
{
  return 0;
}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (v12)
  {
    objc_msgSend(v13, "key");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction parameterStateForKey:](self, "parameterStateForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v12;
      -[WFAction contentPermissionRequestor](self, "contentPermissionRequestor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __82__WFHandleIntentAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke;
      v20[3] = &unk_1E7AEB9E0;
      v22 = v14;
      v21 = v11;
      objc_msgSend(v17, "getRecipientsWithPermissionRequestor:completionHandler:", v18, v20);

    }
    else
    {
      objc_msgSend(v11, "wf_getProcessedIntentValueForParameterValue:parameter:parameterState:completionHandler:", v12, v13, v16, v14);
    }

  }
  else
  {
    if (objc_msgSend(v11, "wf_multipleValues"))
      v19 = MEMORY[0x1E0C9AA60];
    else
      v19 = 0;
    (*((void (**)(id, uint64_t, _QWORD))v14 + 2))(v14, v19, 0);
  }

}

- (id)generatedIntentWithInput:(id)a3 processedParameters:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x1E0CB3A28];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleIntentAction generatedIntentWithIdentifier:input:processedParameters:error:](self, "generatedIntentWithIdentifier:input:processedParameters:error:", v12, v10, v9, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)generatedIntentWithIdentifier:(id)a3 input:(id)a4 processedParameters:(id)a5 error:(id *)a6
{
  return 0;
}

- (NSString)associatedAppBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[WFHandleIntentAction generatedIntentWithInput:processedParameters:error:](self, "generatedIntentWithInput:processedParameters:error:", 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_intents_bundleIdForDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "_intents_launchIdForCurrentPlatform");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (void)generatePopulatedIntentFromInput:(id)a3 processedParameters:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x1E0CB3A28];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "UUID");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleIntentAction generatePopulatedIntentWithIdentifier:fromInput:processedParameters:completion:](self, "generatePopulatedIntentWithIdentifier:fromInput:processedParameters:completion:", v12, v11, v10, v9);

}

- (void)generatePopulatedIntentWithIdentifier:(id)a3 fromInput:(id)a4 processedParameters:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, id);
  void *v13;
  id v14;
  id v15;

  v10 = a4;
  v11 = a5;
  v15 = 0;
  v12 = (void (**)(id, _QWORD, id))a6;
  -[WFHandleIntentAction generatedIntentWithIdentifier:input:processedParameters:error:](self, "generatedIntentWithIdentifier:input:processedParameters:error:", a3, v10, v11, &v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v15;
  if (v13)
    -[WFHandleIntentAction populateIntent:withInput:processedParameters:completionHandler:](self, "populateIntent:withInput:processedParameters:completionHandler:", v13, v10, v11, v12);
  else
    v12[2](v12, 0, v14);

}

- (INIntentDescription)intentDescription
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[WFHandleIntentAction intentDescription] must be overridden"));
  return 0;
}

- (NSArray)slots
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[WFHandleIntentAction slots] must be overridden"));
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)createResourceManager
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFHandleIntentAction;
  -[WFAction createResourceManager](&v5, sel_createResourceManager);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFConfigureIntentBasedParameterResources(v3, self);
  return v3;
}

- (void)generateShortcutRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__WFHandleIntentAction_generateShortcutRepresentation___block_invoke;
  v7[3] = &unk_1E7AF5D68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[WFAction processParametersWithoutAskingForValuesWithInput:workQueue:completionHandler:](self, "processParametersWithoutAskingForValuesWithInput:workQueue:completionHandler:", 0, v5, v7);

}

- (id)titleForINShortcut:(id)a3
{
  return (id)objc_msgSend(a3, "_title");
}

- (void)generateStandaloneShortcutRepresentation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__WFHandleIntentAction_generateStandaloneShortcutRepresentation___block_invoke;
  v6[3] = &unk_1E7AEBA30;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WFHandleIntentAction generateShortcutRepresentation:](self, "generateShortcutRepresentation:", v6);

}

- (id)parameterForSlot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WFAction parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wf_slotName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectMatchingKey:value:", CFSTR("intentSlotName"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)accessBundleContentWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFHandleIntentAction appDescriptor](self, "appDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CBD960], "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wf_accessBundleContentForBundleIdentifiers:withBlock:", v7, v4);

}

- (BOOL)isWorkflowInDatabase
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[WFAction workflow](self, "workflow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)shouldDonateIntent:(id)a3
{
  id v4;
  char isKindOfClass;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 0;
  else
    return !-[WFHandleIntentAction isWorkflowInDatabase](self, "isWorkflowInDatabase");
}

- (void)setExecutor:(id)a3
{
  WFIntentExecutor *v5;
  WFIntentExecutor **p_executor;
  WFIntentExecutor *executor;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  WFIntentExecutor *v14;

  v5 = (WFIntentExecutor *)a3;
  p_executor = &self->_executor;
  executor = self->_executor;
  if (executor != v5)
  {
    v14 = v5;
    if (executor)
    {
      -[WFIntentExecutor progress](executor, "progress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "totalUnitCount");
      -[WFIntentExecutor progress](*p_executor, "progress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCompletedUnitCount:", v9);

      if (v14)
      {
        if (*p_executor)
        {
          -[WFAction progress](self, "progress");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setTotalUnitCount:", objc_msgSend(v11, "totalUnitCount") + 1);

          objc_storeStrong((id *)&self->_executor, a3);
LABEL_7:
          -[WFAction progress](self, "progress");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFIntentExecutor progress](v14, "progress");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addChild:withPendingUnitCount:", v13, 1);

          v5 = v14;
          goto LABEL_8;
        }
      }
    }
    objc_storeStrong((id *)&self->_executor, a3);
    v5 = v14;
    if (v14)
      goto LABEL_7;
  }
LABEL_8:

}

- (void)startExecutingIntent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  INIntent *v10;
  INIntent *runningIntent;
  void *v12;
  void *v13;
  char v14;
  WFActionWillRunIntentTestingEvent *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFIntentExecutionLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[WFHandleIntentAction startExecutingIntent:]";
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEBUG, "%s WFHandleIntentAction startExecutingIntent", buf, 0xCu);
  }

  objc_msgSend(v4, "_setExecutionContext:", 7);
  -[WFHandleIntentAction showsWhenRunIfApplicable](self, "showsWhenRunIfApplicable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(v4, "_metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShowsWhenRun:", v8);

  }
  v10 = (INIntent *)objc_msgSend(v4, "copy");
  runningIntent = self->_runningIntent;
  self->_runningIntent = v10;

  -[WFAction userInterface](self, "userInterface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isRunningWithSiriUI"))
    goto LABEL_8;
  -[WFAction userInterface](self, "userInterface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[WFAction userInterface](self, "userInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configureIntent:", v4);
LABEL_8:

  }
  v15 = -[WFActionWillRunIntentTestingEvent initWithAction:intent:]([WFActionWillRunIntentTestingEvent alloc], "initWithAction:intent:", self, v4);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __45__WFHandleIntentAction_startExecutingIntent___block_invoke;
  v17[3] = &unk_1E7AF5B98;
  v17[4] = self;
  v18 = v4;
  v16 = v4;
  -[WFAction handleTestingEvent:completionHandler:](self, "handleTestingEvent:completionHandler:", v15, v17);

}

- (void)actuallyStartExecutingIntent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  _BOOL4 v40;
  __int16 v41;
  _BOOL4 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[WFHandleIntentAction parameterCombinationForIntentSupportsBackgroundExecution:](self, "parameterCombinationForIntentSupportsBackgroundExecution:", v4)&& !-[WFHandleIntentAction opensInApp](self, "opensInApp"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__WFHandleIntentAction_actuallyStartExecutingIntent___block_invoke;
    aBlock[3] = &unk_1E7AF1850;
    aBlock[4] = self;
    v8 = _Block_copy(aBlock);
    v9 = -[WFHandleIntentAction runInProcess](self, "runInProcess");
    v10 = objc_msgSend(v4, "_executionContext");
    v12 = v10 != 9 && (unint64_t)(v10 - 3) < 0xFFFFFFFFFFFFFFFELL;
    objc_msgSend(v4, "extensionBundleId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForCurrentProcess");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "extensionBundleId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

    }
    else
    {
      v17 = 0;
    }

    if ((v9 | v12 & v17) == 1)
    {
      +[WFBundledIntentHandlerProvider localIntentHandlerLaunchID](WFBundledIntentHandlerProvider, "localIntentHandlerLaunchID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_setExtensionBundleId:", v18);

    }
    if (-[WFHandleIntentAction intentIsHandledBySiri:](self, "intentIsHandledBySiri:", v4))
    {
      if ((objc_msgSend(v4, "_hasMatchingIntentHandlerIncludingRemoteExecution:", 1) & 1) == 0)
      {
        -[WFHandleIntentAction executorWithIntent:groupIdentifier:](self, "executorWithIntent:groupIdentifier:", v4, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFHandleIntentAction setExecutor:](self, "setExecutor:", v31);

        -[WFHandleIntentAction finishRunningByContinuingInApp](self, "finishRunningByContinuingInApp");
        goto LABEL_23;
      }
      -[WFAction userInterface](self, "userInterface");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isRunningWithSiriUI");

      if (v20)
      {
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7CD0]), "initWithIntent:", v4);
        -[WFAction userInterface](self, "userInterface");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __53__WFHandleIntentAction_actuallyStartExecutingIntent___block_invoke_2;
        v32[3] = &unk_1E7AEC430;
        v32[4] = self;
        v33 = v8;
        v23 = objc_msgSend(v22, "performSiriRequest:completionHandler:", v21, v32);

        if ((v23 & 1) != 0)
          goto LABEL_23;
      }
    }
    -[WFHandleIntentAction executor](self, "executor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "connection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "appProtectionPolicy");

    -[WFHandleIntentAction executorWithIntent:groupIdentifier:](self, "executorWithIntent:groupIdentifier:", v4, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHandleIntentAction setExecutor:](self, "setExecutor:", v27);

    -[WFHandleIntentAction executor](self, "executor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "connection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setAppProtectionPolicy:", v26);

    -[WFHandleIntentAction executor](self, "executor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "startWithCompletionHandler:", v8);

LABEL_23:
    goto LABEL_24;
  }
  getWFIntentExecutionLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[WFAction localizedName](self, "localizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v36 = "-[WFHandleIntentAction actuallyStartExecutingIntent:]";
    v37 = 2112;
    v38 = v6;
    v39 = 1024;
    v40 = -[WFHandleIntentAction parameterCombinationForIntentSupportsBackgroundExecution:](self, "parameterCombinationForIntentSupportsBackgroundExecution:", v4);
    v41 = 1024;
    v42 = -[WFHandleIntentAction opensInApp](self, "opensInApp");
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s %@ will finish by continuing in app (parameter combination supports background execution: %i, opensInApp: %i", buf, 0x22u);

  }
  -[WFHandleIntentAction executorWithIntent:groupIdentifier:](self, "executorWithIntent:groupIdentifier:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleIntentAction setExecutor:](self, "setExecutor:", v7);

  -[WFHandleIntentAction finishRunningByContinuingInApp](self, "finishRunningByContinuingInApp");
LABEL_24:

}

- (void)handleExecutionCompletionWithInteraction:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "intentResponse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    INTypedIntentResponseWithIntentResponse();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__WFHandleIntentAction_handleExecutionCompletionWithInteraction_error___block_invoke;
    v10[3] = &unk_1E7AEBA58;
    v10[4] = self;
    v11 = v7;
    -[WFHandleIntentAction getOutputFromIntentResponse:completionHandler:](self, "getOutputFromIntentResponse:completionHandler:", v9, v10);

  }
  else
  {
    -[WFHandleIntentAction handleExecutorError:](self, "handleExecutorError:", a4);
  }

}

- (BOOL)parameterCombinationForIntentSupportsBackgroundExecution:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "_currentParameterCombination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "supportsBackgroundExecution");
  else
    v5 = 1;

  return v5;
}

- (BOOL)runInProcess
{
  void *v2;
  void *v3;
  char v4;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("InProcess"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)skipSiriExecution
{
  void *v2;
  void *v3;
  char v4;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SkipSiriExecution"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isHandledBySiri
{
  void *v3;
  id v4;
  NSObject *v5;
  BOOL v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  -[WFHandleIntentAction generatedIntentWithInput:processedParameters:error:](self, "generatedIntentWithInput:processedParameters:error:", 0, 0, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v4)
  {
    getWFWorkflowExecutionLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[WFHandleIntentAction isHandledBySiri]";
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_FAULT, "%s Unable to generate intent: %{public}@", buf, 0x16u);
    }

    v6 = 0;
  }
  else
  {
    v6 = -[WFHandleIntentAction intentIsHandledBySiri:](self, "intentIsHandledBySiri:", v3);
  }

  return v6;
}

- (BOOL)intentIsHandledBySiri:(id)a3
{
  _BOOL4 v4;
  BOOL v5;
  uint64_t v6;
  _BOOL4 v7;
  id v8;
  int v9;
  void *v10;

  v8 = a3;
  v4 = -[WFHandleIntentAction skipSiriExecution](self, "skipSiriExecution");
  v5 = -[WFHandleIntentAction runInProcess](self, "runInProcess");
  v6 = objc_msgSend(v8, "_type");
  v7 = -[WFHandleIntentAction shouldForceHandleInSiri:](self, "shouldForceHandleInSiri:", v8);

  LOBYTE(v8) = 0;
  v9 = v6 == 2 || v7;
  if (v9 == 1 && !v5)
  {
    -[WFAction userInterface](self, "userInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v10, "isRunningWithSiriUI") & !v4;

  }
  return (char)v8;
}

- (BOOL)shouldForceHandleInSiri:(id)a3
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "_idiom") == 4)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayForKey:", CFSTR("IntentsHandledBySiriOverride"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_className");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "containsObject:", v7);

  }
  return v4;
}

- (id)executorWithIntent:(id)a3 groupIdentifier:(id)a4
{
  id v6;
  id v7;
  WFIntentExecutor *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[WFIntentExecutor initWithIntent:donateInteraction:groupIdentifier:]([WFIntentExecutor alloc], "initWithIntent:donateInteraction:groupIdentifier:", v7, -[WFHandleIntentAction shouldDonateIntent:](self, "shouldDonateIntent:", v7), v6);

  -[WFIntentExecutor setDelegate:](v8, "setDelegate:", self);
  return v8;
}

- (void)populateIntent:(id)a3 withInput:(id)a4 processedParameters:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_msgSend(a3, "copy");
  if (!v10)
    v10 = (id)objc_opt_new();
  -[WFHandleIntentAction slots](self, "slots");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __87__WFHandleIntentAction_populateIntent_withInput_processedParameters_completionHandler___block_invoke;
  v23[3] = &unk_1E7AEBA88;
  v23[4] = self;
  v24 = v11;
  v25 = v13;
  v26 = v10;
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __87__WFHandleIntentAction_populateIntent_withInput_processedParameters_completionHandler___block_invoke_3;
  v20[3] = &unk_1E7AF8598;
  v21 = v25;
  v22 = v12;
  v16 = v25;
  v17 = v12;
  v18 = v10;
  v19 = v11;
  objc_msgSend(v14, "if_enumerateAsynchronouslyInSequence:completionHandler:", v23, v20);

}

- (BOOL)shouldOpenAppThroughSiriForIntent:(id)a3 intentResponse:(id)a4
{
  return 1;
}

- (void)finishRunningByContinuingInApp
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  -[WFHandleIntentAction executor](self, "executor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFHandleIntentAction executor](self, "executor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_transaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "intentResponse");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFAction userInterface](self, "userInterface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isRunningWithSiriUI"))
  {
    -[WFHandleIntentAction executor](self, "executor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHandleIntentAction.m"), 598, CFSTR("executor should not be nil"));

    }
    if (-[WFHandleIntentAction shouldOpenAppThroughSiriForIntent:intentResponse:](self, "shouldOpenAppThroughSiriForIntent:intentResponse:", v6, v11))
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v6, v11);
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7D00]), "initWithInteraction:", v14);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __54__WFHandleIntentAction_finishRunningByContinuingInApp__block_invoke;
      v29[3] = &unk_1E7AEF348;
      v29[4] = self;
      if ((objc_msgSend(v12, "performSiriRequest:completionHandler:", v15, v29) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFHandleIntentAction finishRunningWithError:](self, "finishRunningWithError:", v16);

      }
      goto LABEL_17;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v12, "requestedFromAnotherDevice")
    && !-[WFHandleIntentAction allowsContinueInAppWhenRunningRemotely](self, "allowsContinueInAppWhenRunningRemotely"))
  {
    WFLocalizedString(CFSTR("Sorry, you can’t do that here. Try it on your iPhone instead."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v30[0] = *MEMORY[0x1E0CB2D68];
    v21 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("Could Not Run “%@”"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction localizedName](self, "localizedName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringWithFormat:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = *MEMORY[0x1E0CB2D50];
    v31[0] = v24;
    v31[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("WFHandleIntentActionErrorDomain"), 0, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFHandleIntentAction finishRunningWithError:](self, "finishRunningWithError:", v26);
LABEL_17:

    goto LABEL_18;
  }
  if (!objc_msgSend(MEMORY[0x1E0D3E528], "shouldLaunchAppInBackgroundWithIntent:intentResponse:", v6, v11))
  {
    objc_msgSend(MEMORY[0x1E0CBD730], "appInfoWithIntent:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "actionsRestrictedWhileLocked");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_className");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v14, "containsObject:", v18);

    if (v19)
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __54__WFHandleIntentAction_finishRunningByContinuingInApp__block_invoke_210;
      v28[3] = &unk_1E7AEE348;
      v28[4] = self;
      -[WFAction requestUnlock:](self, "requestUnlock:", v28);
    }
    else
    {
      -[WFHandleIntentAction launchAppInBackground:](self, "launchAppInBackground:", 0);
    }
    goto LABEL_17;
  }
  -[WFHandleIntentAction launchAppInBackground:](self, "launchAppInBackground:", 1);
LABEL_18:

}

- (void)launchAppInBackground:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__WFHandleIntentAction_launchAppInBackground___block_invoke;
  v3[3] = &unk_1E7AF7348;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

- (void)getOutputFromIntentResponse:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHandleIntentAction.m"), 668, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__WFHandleIntentAction_getOutputFromIntentResponse_completionHandler___block_invoke;
  v11[3] = &unk_1E7AEBAB0;
  v11[4] = self;
  v12 = v8;
  v9 = v8;
  objc_msgSend(v7, "wf_getOutputValueWithCompletionHandler:", v11);

}

- (id)displayableAppDescriptor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFAction displayableAppDefinition](self, "displayableAppDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD728]), "initWithSerializedRepresentation:", v3);
  }
  else
  {
    -[WFHandleIntentAction intentDescriptor](self, "intentDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_displayableAppDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selfIfNotShortcutsApp");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)appDescriptor
{
  void *v2;
  void *v3;
  void *v4;

  -[WFHandleIntentAction intentDescriptor](self, "intentDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selfIfNotShortcutsApp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (INIntentDescriptor)intentDescriptor
{
  return self->_intentDescriptor;
}

- (void)setIntentDescriptor:(id)a3
{
  void *v5;
  WFIntentDescriptorParameterState *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_intentDescriptor, a3);
  -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("IntentAppDefinition"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[WFVariableSubstitutableParameterState initWithValue:]([WFIntentDescriptorParameterState alloc], "initWithValue:", v7);
    -[WFAction setParameterState:forKey:](self, "setParameterState:forKey:", v6, CFSTR("IntentAppDefinition"));
  }
  else
  {
    objc_msgSend(v7, "serializedRepresentation");
    v6 = (WFIntentDescriptorParameterState *)objc_claimAutoreleasedReturnValue();
    -[WFAction setSupplementalParameterValue:forKey:](self, "setSupplementalParameterValue:forKey:", v6, CFSTR("IntentAppDefinition"));
  }

}

- (void)updateAppDescriptorWithSelectedApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[WFHandleIntentAction intentDescriptor](self, "intentDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptorWithAppDescriptor:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleIntentAction setIntentDescriptor:](self, "setIntentDescriptor:", v6);

  v7.receiver = self;
  v7.super_class = (Class)WFHandleIntentAction;
  -[WFAction updateAppDescriptorWithSelectedApp:](&v7, sel_updateAppDescriptorWithSelectedApp_, v4);

}

- (void)updateAppDescriptorInDatabaseWithSelectedApp:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[WFAction workflow](self, "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actions");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v15, "indexOfObject:", self);
  -[WFHandleIntentAction intentDescriptor](self, "intentDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptorWithAppDescriptor:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction UUID](self, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction workflow](self, "workflow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "workflowID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateAppDescriptor:atKey:actionUUID:actionIndex:actionIdentifier:workflowID:error:", v8, CFSTR("IntentAppDefinition"), v10, v11, v12, v14, 0);

}

- (id)appResource
{
  void *v3;
  WFAppInstalledResource *appResource;
  WFAppInstalledResource *v5;
  void *v6;
  WFAppInstalledResource *v7;
  WFAppInstalledResource *v8;
  WFAppInstalledResource *v9;

  -[WFHandleIntentAction intentDescriptor](self, "intentDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    appResource = self->_appResource;
    if (!appResource)
    {
      v5 = [WFAppInstalledResource alloc];
      -[WFHandleIntentAction intentDescriptor](self, "intentDescriptor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[WFAppInstalledResource initWithIntentDescriptor:isSyncedFromOtherDevice:](v5, "initWithIntentDescriptor:isSyncedFromOtherDevice:", v6, -[WFHandleIntentAction intentDescriptorIsSyncedFromOtherDevices](self, "intentDescriptorIsSyncedFromOtherDevices"));
      v8 = self->_appResource;
      self->_appResource = v7;

      -[WFAppInstalledResource setDelegate:](self->_appResource, "setDelegate:", self);
      appResource = self->_appResource;
    }
    v9 = appResource;
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)intentDescriptorIsSyncedFromOtherDevices
{
  return 0;
}

- (void)appInstalledResource:(id)a3 didUpdateAppDescriptor:(id)a4
{
  -[WFHandleIntentAction updateAppDescriptorWithSelectedApp:](self, "updateAppDescriptorWithSelectedApp:", a4);
}

- (id)contentDestinationWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  -[WFHandleIntentAction appDescriptor](self, "appDescriptor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (-[WFHandleIntentAction appDescriptor](self, "appDescriptor"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "bundleIdentifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = VCIsShortcutsAppBundleIdentifier(),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    v9 = (void *)MEMORY[0x1E0D13E00];
    -[WFHandleIntentAction appDescriptor](self, "appDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locationWithAppDescriptor:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)requiresRemoteExecution
{
  NSObject *v3;
  int v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  int v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  WFHandleIntentAction *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)WFHandleIntentAction;
  if (-[WFAction requiresRemoteExecution](&v12, sel_requiresRemoteExecution))
  {
    getWFRemoteExecutionLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[WFHandleIntentAction requiresRemoteExecution]";
      v15 = 2114;
      v16 = self;
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_DEFAULT, "%s %{public}@ definition requires remote execution, returning YES for requiresRemoteExecution", buf, 0x16u);
    }
    LOBYTE(v4) = 1;
    goto LABEL_15;
  }
  -[WFAction resourceManager](self, "resourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceObjectsOfClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v3 = objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    getWFRemoteExecutionLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[WFHandleIntentAction requiresRemoteExecution]";
      v15 = 2114;
      v16 = self;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s App availability resource was not found for action: %{public}@", buf, 0x16u);
    }

    goto LABEL_11;
  }
  if (!-[NSObject intentIsEligibleForRemoteExecution](v3, "intentIsEligibleForRemoteExecution"))
  {
LABEL_11:
    v4 = 0;
    goto LABEL_12;
  }
  v4 = -[NSObject intentIsLocallyAvailable](v3, "intentIsLocallyAvailable") ^ 1;
LABEL_12:
  getWFRemoteExecutionLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[NSObject intentIsEligibleForRemoteExecution](v3, "intentIsEligibleForRemoteExecution");
    v10 = -[NSObject intentIsLocallyAvailable](v3, "intentIsLocallyAvailable");
    *(_DWORD *)buf = 136316418;
    v14 = "-[WFHandleIntentAction requiresRemoteExecution]";
    v15 = 2114;
    v16 = self;
    v17 = 1024;
    v18 = v4;
    v19 = 1024;
    v20 = v3 != 0;
    v21 = 1024;
    v22 = v9;
    v23 = 1024;
    v24 = v10;
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ requires remote execution: %i (intentAvailableResource exists: %i, intentIsEligibleForRemoteExecution: %i, intentIsLocallyAvailable: %i", buf, 0x2Eu);
  }

LABEL_15:
  return v4;
}

- (BOOL)allowsContinueInAppWhenRunningRemotely
{
  return 0;
}

- (void)showInteractionIfNeeded:(id)a3 inUserInterface:(id)a4 requiringConfirmation:(BOOL)a5 requiringAuthentication:(BOOL)a6 executionStage:(int64_t)a7 completionHandler:(id)a8
{
  _BOOL8 v10;
  _BOOL4 v11;
  id v14;
  id v15;
  void (**v16)(id, uint64_t, _QWORD);
  int v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[5];
  void (**v33)(id, uint64_t, _QWORD);
  _QWORD v34[4];
  id v35;
  void (**v36)(id, uint64_t, _QWORD);
  _QWORD v37[4];
  id v38;
  void (**v39)(id, uint64_t, _QWORD);
  _QWORD aBlock[6];

  v10 = a6;
  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = (void (**)(id, uint64_t, _QWORD))a8;
  v17 = VCIsDeviceLocked();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = objc_msgSend(v15, "requestedFromAnotherDevice");
  else
    v18 = 0;
  if (!-[WFHandleIntentAction showsWhenRun](self, "showsWhenRun") && (!v10 || (v17 & 1) == 0))
  {
LABEL_14:
    v16[2](v16, 1, 0);
    goto LABEL_28;
  }
  if (a7 == 1)
  {
    if (!v18)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v14, "intentResponse");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFHandleIntentAction stringLocalizer](self, "stringLocalizer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "_renderedResponseWithLocalizer:requiresSiriCompatibility:", v27, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __143__WFHandleIntentAction_showInteractionIfNeeded_inUserInterface_requiringConfirmation_requiringAuthentication_executionStage_completionHandler___block_invoke_4;
        v32[3] = &unk_1E7AECC78;
        v32[4] = self;
        v33 = v16;
        objc_msgSend(v15, "showHandleInteraction:prompt:completionHandler:", v14, v28, v32);

        goto LABEL_28;
      }
      if (-[WFHandleIntentAction showsWhenRun](self, "showsWhenRun"))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFHandleIntentAction finishRunningWithError:](self, "finishRunningWithError:", v29);

        goto LABEL_28;
      }
    }
    goto LABEL_14;
  }
  if (!a7)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __143__WFHandleIntentAction_showInteractionIfNeeded_inUserInterface_requiringConfirmation_requiringAuthentication_executionStage_completionHandler___block_invoke;
    aBlock[3] = &unk_1E7AEBAD8;
    aBlock[4] = self;
    v31 = _Block_copy(aBlock);
    objc_msgSend(v14, "intentResponse");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHandleIntentAction stringLocalizer](self, "stringLocalizer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_renderedResponseWithLocalizer:requiresSiriCompatibility:", v20, 0);
    v30 = objc_claimAutoreleasedReturnValue();

    v21 = v15;
    if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v22 = v11 && -[WFHandleIntentAction showsWhenRun](self, "showsWhenRun");
      v25 = (void *)v30;
      v23 = v31;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __143__WFHandleIntentAction_showInteractionIfNeeded_inUserInterface_requiringConfirmation_requiringAuthentication_executionStage_completionHandler___block_invoke_2;
      v37[3] = &unk_1E7AEBB00;
      v38 = v31;
      v39 = v16;
      objc_msgSend(v21, "showConfirmInteraction:requireAuthentication:requireConfirmation:completionHandler:", v14, v10, v22, v37);

    }
    else
    {

      if (((v11 | v17) & 1) != 0)
      {
        v23 = v31;
        if (v18 & 1 | ((objc_opt_respondsToSelector() & 1) == 0))
        {
          -[WFHandleIntentAction confirmationAlertForInteraction:completionHandler:](self, "confirmationAlertForInteraction:completionHandler:", v14, v16);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "presentAlert:", v24);
          v25 = (void *)v30;
        }
        else
        {
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __143__WFHandleIntentAction_showInteractionIfNeeded_inUserInterface_requiringConfirmation_requiringAuthentication_executionStage_completionHandler___block_invoke_3;
          v34[3] = &unk_1E7AEBB00;
          v35 = v31;
          v36 = v16;
          v25 = (void *)v30;
          objc_msgSend(v21, "showConfirmInteraction:prompt:requireAuthentication:completionHandler:", v14, v30, v10, v34);

          v24 = v35;
        }

      }
      else
      {
        v16[2](v16, 1, 0);
        v25 = (void *)v30;
        v23 = v31;
      }
    }

  }
LABEL_28:

}

- (id)confirmationAlertForInteraction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "intent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13DE0], "alertWithPreferredStyle:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intentResponse");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "intentResponse");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHandleIntentAction stringLocalizer](self, "stringLocalizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_renderedResponseWithLocalizer:requiresSiriCompatibility:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  if (!objc_msgSend(v13, "length"))
  {
    objc_msgSend(v8, "_subtitle");
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  objc_msgSend(v8, "_title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v15);

  objc_msgSend(v9, "setMessage:", v13);
  v16 = (void *)MEMORY[0x1E0D13DE8];
  objc_msgSend(v8, "_localizedVerb");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __74__WFHandleIntentAction_confirmationAlertForInteraction_completionHandler___block_invoke;
  v30[3] = &unk_1E7AF8F48;
  v19 = v7;
  v31 = v19;
  objc_msgSend(v16, "buttonWithTitle:style:handler:", v17, 0, v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addButton:", v20);

  v21 = (void *)MEMORY[0x1E0D13DE8];
  v25 = v18;
  v26 = 3221225472;
  v27 = __74__WFHandleIntentAction_confirmationAlertForInteraction_completionHandler___block_invoke_2;
  v28 = &unk_1E7AF8F48;
  v29 = v19;
  v22 = v19;
  objc_msgSend(v21, "cancelButtonWithHandler:", &v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addButton:", v23, v25, v26, v27, v28);

  return v9;
}

- (id)unknownErrorWithCode:(int64_t)a3 localizedDescription:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("Could Not Run %@"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction localizedName](self, "localizedName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    WFLocalizedString(CFSTR("An unknown error occurred."));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)objc_msgSend(v9, "mutableCopy");
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = (id)objc_opt_new();
  v17 = v16;

  v18 = *MEMORY[0x1E0CB2D50];
  v22[0] = *MEMORY[0x1E0CB2D68];
  v22[1] = v18;
  v23[0] = v13;
  v23[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addEntriesFromDictionary:", v19);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFIntentExecutorErrorDomain"), a3, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)handleResolutionResult:(id)a3 forSlot:(id)a4 onIntent:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[WFHandleIntentAction allowsInteractiveSlotResolution](self, "allowsInteractiveSlotResolution");
  if (v11 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v11)
  {
    v13 = objc_msgSend(v8, "resolutionResultCode");
    if (v13 == 4)
    {
      -[WFHandleIntentAction showAskForValueAndRetryForSlot:onIntent:](self, "showAskForValueAndRetryForSlot:onIntent:", v9, v10);
      goto LABEL_7;
    }
    if (v13 == 2)
    {
      objc_msgSend(v8, "disambiguationItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHandleIntentAction showDisambiguationAndRetryForSlot:items:onIntent:](self, "showDisambiguationAndRetryForSlot:items:onIntent:", v9, v12, v10);
      goto LABEL_6;
    }
    -[WFHandleIntentAction errorFromResolutionResult:forSlot:onIntent:](self, "errorFromResolutionResult:forSlot:onIntent:", v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v15 = CFSTR("WFIntentExecutorIntentErrorKey");
      v16[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHandleIntentAction unknownErrorWithCode:localizedDescription:userInfo:](self, "unknownErrorWithCode:localizedDescription:userInfo:", 101, 0, v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_5:
    -[WFHandleIntentAction finishRunningWithError:](self, "finishRunningWithError:", v12);
LABEL_6:

    goto LABEL_7;
  }
  -[WFHandleIntentAction finishRunningByContinuingInApp](self, "finishRunningByContinuingInApp");
LABEL_7:

}

- (void)showAskForValueAndRetryForSlot:(id)a3 onIntent:(id)a4
{
  void *v4;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[WFHandleIntentAction parameterForSlot:](self, "parameterForSlot:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "codableAttribute");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "promptDialogs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v12, "count");

      v13 = v10;
      if (!v4)
        goto LABEL_10;
      objc_msgSend(v10, "codableAttribute");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "promptDialogWithType:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "localizedDialogWithIntent:tokens:", v8, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "length"))
        objc_msgSend(v9, "setLocalizedPrompt:", v16);

      v13 = v10;
    }
    else
    {
      v13 = 0;
      v15 = v10;
    }
  }
  else
  {
    v15 = 0;
    v13 = 0;
  }

LABEL_10:
  -[WFAction runningDelegate](self, "runningDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "action:canProvideInputForParameter:", self, v9);

  if ((v18 & 1) != 0)
  {
    if (v9)
    {
      v31 = v8;
      -[WFAction processedParameters](self, "processedParameters");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "mutableCopy");

      objc_msgSend(v9, "key");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, v21);

      -[WFAction setProcessedParameters:](self, "setProcessedParameters:", v20);
      objc_msgSend(v9, "key");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction parameterStateForKey:](self, "parameterStateForKey:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithObject:", v9);
      if (v23)
      {
        objc_msgSend(v9, "key");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v4;
        v37 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = (void *)MEMORY[0x1E0C9AA70];
      }
      -[WFAction input](self, "input");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(0, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __64__WFHandleIntentAction_showAskForValueAndRetryForSlot_onIntent___block_invoke;
      v32[3] = &unk_1E7AEBB50;
      v32[4] = self;
      v33 = v31;
      v34 = v10;
      v35 = v9;
      -[WFAction askForValuesOfParameters:withDefaultStates:prompts:input:workQueue:completionHandler:](self, "askForValuesOfParameters:withDefaultStates:prompts:input:workQueue:completionHandler:", v24, v25, MEMORY[0x1E0C9AA70], v29, v30, v32);

      if (v23)
      {

      }
      v8 = v31;
    }
    else
    {
      getWFIntentExecutionLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v10, "wf_slotName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v39 = "-[WFHandleIntentAction showAskForValueAndRetryForSlot:onIntent:]";
        v40 = 2114;
        v41 = v28;
        v42 = 2114;
        v43 = v10;
        _os_log_impl(&dword_1C15B3000, v27, OS_LOG_TYPE_FAULT, "%s No parameter found for slot description (slotName: %{public}@): %{public}@. Opening in app to continue.", buf, 0x20u);

      }
      -[WFHandleIntentAction finishRunningByContinuingInApp](self, "finishRunningByContinuingInApp");
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHandleIntentAction finishRunningWithError:](self, "finishRunningWithError:", v26);

  }
}

- (void)localizedDisambiguationPromptForAttribute:(id)a3 intent:(id)a4 disambiguationItems:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  WFHandleIntentAction *v29;
  id v30;
  id v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  objc_msgSend(v13, "promptDialogWithType:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "promptDialogWithType:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = CFSTR("count");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v17 = objc_msgSend(v12, "count");

  objc_msgSend(v16, "numberWithUnsignedInteger:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __104__WFHandleIntentAction_localizedDisambiguationPromptForAttribute_intent_disambiguationItems_completion___block_invoke;
  v25[3] = &unk_1E7AF1F18;
  v26 = v14;
  v27 = v10;
  v28 = v19;
  v29 = self;
  v30 = v15;
  v31 = v11;
  v20 = v11;
  v21 = v15;
  v22 = v19;
  v23 = v10;
  v24 = v14;
  -[WFHandleIntentAction accessBundleContentWithBlock:](self, "accessBundleContentWithBlock:", v25);

}

- (void)showDisambiguationAndRetryForSlot:(id)a3 items:(id)a4 onIntent:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D13DE0], "alertWithPreferredStyle:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_codableDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wf_slotName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attributeByName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wf_slotName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "wf_updateWithParameterState:", v17);

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __73__WFHandleIntentAction_showDisambiguationAndRetryForSlot_items_onIntent___block_invoke;
  v23[3] = &unk_1E7AEBBA0;
  v23[4] = self;
  v24 = v14;
  v25 = v10;
  v26 = v11;
  v27 = v9;
  v28 = v8;
  v18 = v8;
  v19 = v9;
  v20 = v11;
  v21 = v10;
  v22 = v14;
  objc_msgSend(v19, "wf_transformValueForCodableAttribute:completionHandler:", v22, v23);

}

- (void)localizedConfirmationPromptForAttribute:(id)a3 intent:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  WFHandleIntentAction *v17;
  id v18;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "promptDialogWithType:", 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__WFHandleIntentAction_localizedConfirmationPromptForAttribute_intent_completion___block_invoke;
  v14[3] = &unk_1E7AF8F70;
  v15 = v10;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v11 = v8;
  v12 = v10;
  v13 = v9;
  -[WFHandleIntentAction accessBundleContentWithBlock:](self, "accessBundleContentWithBlock:", v14);

}

- (void)showConfirmationAndRetryForSlot:(id)a3 item:(id)a4 onIntent:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0D13DE0], "alertWithPreferredStyle:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_codableDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "wf_slotName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attributeByName:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "wf_slotName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "wf_updateWithParameterState:", v20);

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __88__WFHandleIntentAction_showConfirmationAndRetryForSlot_item_onIntent_completionHandler___block_invoke;
  v27[3] = &unk_1E7AEBBF0;
  v27[4] = self;
  v28 = v17;
  v29 = v12;
  v30 = v14;
  v32 = v10;
  v33 = v13;
  v31 = v11;
  v21 = v10;
  v22 = v13;
  v23 = v11;
  v24 = v14;
  v25 = v12;
  v26 = v17;
  objc_msgSend(v23, "wf_transformValueForCodableAttribute:completionHandler:", v26, v27);

}

- (id)errorFromResolutionResult:(id)a3 forSlot:(id)a4 onIntent:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  WFHandleIntentAction *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[2];
  _QWORD v44[4];

  v44[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFHandleIntentAction parameterForSlot:](self, "parameterForSlot:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && objc_msgSend(v8, "resolutionResultCode") == 1)
  {
    objc_msgSend(v10, "_codableDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wf_slotName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attributeByName:", v13);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "unsupportedReasonWithIndex:", objc_msgSend(v8, "unsupportedReason"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__5033;
    v41 = __Block_byref_object_dispose__5034;
    v42 = 0;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __67__WFHandleIntentAction_errorFromResolutionResult_forSlot_onIntent___block_invoke;
    v32[3] = &unk_1E7AEBC18;
    v36 = &v37;
    v15 = v14;
    v33 = v15;
    v34 = v10;
    v35 = self;
    -[WFHandleIntentAction accessBundleContentWithBlock:](self, "accessBundleContentWithBlock:", v32);
    v16 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("Invalid %@"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringWithFormat:", v17, v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)v38[5];
    if (v20)
    {
      v21 = v20;
    }
    else
    {
      v23 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedString(CFSTR("The value provided for %1$@ in %2$@ was invalid."));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction localizedName](self, "localizedName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringWithFormat:", v24, v25, v26, 0);
      v21 = (id)objc_claimAutoreleasedReturnValue();

    }
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D68];
    v43[0] = *MEMORY[0x1E0CB2D50];
    v43[1] = v28;
    v44[0] = v21;
    v44[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("WFIntentExecutorErrorDomain"), 101, v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v37, 8);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)errorFromConfirmResponse:(id)a3 intent:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("WFIntentExecutorIntentErrorKey");
  v12[1] = CFSTR("WFIntentExecutorIntentResponseErrorKey");
  v13[0] = a4;
  v13[1] = a3;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFHandleIntentAction unknownErrorWithCode:localizedDescription:userInfo:](self, "unknownErrorWithCode:localizedDescription:userInfo:", 102, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)errorFromHandleResponse:(id)a3 intent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  WFHandleIntentAction *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "_isSuccess") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__5033;
    v24 = __Block_byref_object_dispose__5034;
    v25 = 0;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __55__WFHandleIntentAction_errorFromHandleResponse_intent___block_invoke;
    v16 = &unk_1E7AF8A80;
    v19 = &v20;
    v9 = v6;
    v17 = v9;
    v18 = self;
    -[WFHandleIntentAction accessBundleContentWithBlock:](self, "accessBundleContentWithBlock:", &v13);
    v10 = v21[5];
    v26[0] = CFSTR("WFIntentExecutorIntentErrorKey");
    v26[1] = CFSTR("WFIntentExecutorIntentResponseErrorKey");
    v27[0] = v7;
    v27[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2, v13, v14, v15, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHandleIntentAction unknownErrorWithCode:localizedDescription:userInfo:](self, "unknownErrorWithCode:localizedDescription:userInfo:", 103, v10, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v20, 8);
  }

  return v8;
}

- (id)errorAttributedToApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    -[WFHandleIntentAction appDescriptor](self, "appDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("ApplicationName"));

    v9 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v4, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "code");

    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)errorThatLaunchesApp:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  WFLocalizedString(CFSTR("Open %@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleIntentAction appDescriptor](self, "appDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  -[WFHandleIntentAction executor](self, "executor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("Connection"));

  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E7B8AFA8, *MEMORY[0x1E0D14298]);
  WFLocalizedString(CFSTR("Cancel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  v21[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CB2D78]);

  objc_msgSend(v11, "setObject:forKeyedSubscript:", self, *MEMORY[0x1E0CB3148]);
  v16 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v5, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v5, "code");

  objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, v18, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)getErrorFromExtensionError:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void (**v12)(void *, void *);
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  WFiTunesSessionManager *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD aBlock[5];
  id v25;
  id v26;

  v6 = a4;
  objc_msgSend(a3, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__WFHandleIntentAction_getErrorFromExtensionError_completionHandler___block_invoke;
  aBlock[3] = &unk_1E7AF7740;
  aBlock[4] = self;
  v10 = v8;
  v25 = v10;
  v11 = v6;
  v26 = v11;
  v12 = (void (**)(void *, void *))_Block_copy(aBlock);
  v13 = objc_msgSend(v10, "code");
  switch(v13)
  {
    case 1300:
    case 1303:
    case 1306:
    case 1311:
    case 1312:
    case 1313:
    case 1316:
    case 1317:
    case 1318:
      goto LABEL_10;
    case 1301:
    case 1302:
      v14 = CFSTR("There was a problem communicating with the app.");
      goto LABEL_8;
    case 1304:
    case 1307:
    case 1314:
      v14 = CFSTR("The operation took too long to complete. Please try again.");
      goto LABEL_8;
    case 1305:
    case 1308:
    case 1309:
      v14 = CFSTR("There was a problem opening the app.");
      goto LABEL_8;
    case 1310:
      v14 = CFSTR("There was a problem opening the app. Please unlock the device and try again.");
      goto LABEL_8;
    case 1315:
      -[WFHandleIntentAction appDescriptor](self, "appDescriptor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "length"))
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        WFLocalizedString(CFSTR("This action requires %@ to be installed."));
        v18 = (WFiTunesSessionManager *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", v18, v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v12[2](v12, v19);
      }
      else
      {
        v18 = objc_alloc_init(WFiTunesSessionManager);
        -[WFHandleIntentAction appDescriptor](self, "appDescriptor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "bundleIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "countryCode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v9;
        v23[1] = 3221225472;
        v23[2] = __69__WFHandleIntentAction_getErrorFromExtensionError_completionHandler___block_invoke_2;
        v23[3] = &unk_1E7AF6C78;
        v23[4] = v12;
        -[WFiTunesSessionManager lookupMediaWithBundleIdentifier:countryCode:completion:](v18, "lookupMediaWithBundleIdentifier:countryCode:completion:", v20, v22, v23);

      }
      goto LABEL_9;
    default:
      if ((unint64_t)(v13 - 1399) < 2)
        goto LABEL_10;
      v14 = CFSTR("There was a problem with the app.");
LABEL_8:
      WFLocalizedString(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v15);
LABEL_9:

LABEL_10:
      return;
  }
}

- (void)handleExecutorError:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
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
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  _QWORD v70[5];
  _QWORD v71[2];
  _QWORD v72[3];

  v72[2] = *MEMORY[0x1E0C80C00];
  -[WFHandleIntentAction errorAttributedToApp:](self, "errorAttributedToApp:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("WFIntentExecutorErrorDomain"));

  if (!v6)
  {
    objc_msgSend(v4, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D22DC0]);

    if (!v11)
    {
LABEL_39:
      -[WFHandleIntentAction finishRunningWithError:](self, "finishRunningWithError:", v4);
      goto LABEL_40;
    }
    v12 = (void *)MEMORY[0x1E0CA5898];
    -[WFHandleIntentAction executor](self, "executor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "intent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_intents_bundleIdForDisplay");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v15, 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v16, "localizedName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "length") != 0;
      }
      else
      {
        v18 = 0;
        v17 = v16;
        v16 = 0;
      }
    }
    else
    {
      v17 = 0;
      v18 = 0;
    }

    v28 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("Couldn’t Run “%@”"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction localizedName](self, "localizedName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x1E0CB3940];
    if (v18)
    {
      WFLocalizedString(CFSTR("“%1$@” could not open “%2$@” because an unknown error occurred."));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction localizedName](self, "localizedName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringWithFormat:", v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      WFLocalizedString(CFSTR("“%@” could not open the app because an unknown error occurred."));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction localizedName](self, "localizedName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringWithFormat:", v33, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[WFHandleIntentAction rootCauseErrorFromError:](self, "rootCauseErrorFromError:", v4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "domain");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "isEqualToString:", *MEMORY[0x1E0D22CD0]))
    {
      v39 = objc_msgSend(v37, "code");

      if (v39 != 7)
      {
LABEL_38:
        v61 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v4, "domain");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v4, "code");
        v64 = *MEMORY[0x1E0CB2D50];
        v71[0] = *MEMORY[0x1E0CB2D68];
        v71[1] = v64;
        v72[0] = v31;
        v72[1] = v36;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "errorWithDomain:code:userInfo:", v62, v63, v65);
        v66 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v66;
        goto LABEL_39;
      }
      objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "localizedModel");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = (void *)MEMORY[0x1E0CB3940];
      if (v18)
      {
        WFLocalizedString(CFSTR("“%1$@” could not open “%2$@” because the %3$@ is locked."));
        v69 = objc_claimAutoreleasedReturnValue();
        -[WFAction localizedName](self, "localizedName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedName");
        v43 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "localizedStringWithFormat:", v69, v42, v43, v38);
        v44 = objc_claimAutoreleasedReturnValue();

        v36 = (void *)v43;
        v45 = (void *)v69;
      }
      else
      {
        WFLocalizedString(CFSTR("“%1$@” could not open the app because the %2$@ is locked."));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAction localizedName](self, "localizedName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "stringWithFormat:", v45, v42, v38);
        v44 = objc_claimAutoreleasedReturnValue();
      }

      v36 = (void *)v44;
    }

    goto LABEL_38;
  }
  switch(objc_msgSend(v4, "code"))
  {
    case 'd':
      objc_msgSend(v4, "userInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *MEMORY[0x1E0CB3388];
      objc_msgSend(v19, "objectForKey:", *MEMORY[0x1E0CB3388]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "domain");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *MEMORY[0x1E0CBD400];
      if (objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0CBD400]))
      {
        v23 = objc_msgSend(v7, "code");

        if (v23 == 3001)
        {
          -[WFHandleIntentAction finishRunningByContinuingInApp](self, "finishRunningByContinuingInApp");
          goto LABEL_21;
        }
      }
      else
      {

      }
      objc_msgSend(v7, "domain");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v46, "isEqualToString:", v22))
      {

        goto LABEL_42;
      }
      v47 = objc_msgSend(v7, "code");

      if (v47 != 3006)
      {
LABEL_42:
        v70[0] = MEMORY[0x1E0C809B0];
        v70[1] = 3221225472;
        v70[2] = __44__WFHandleIntentAction_handleExecutorError___block_invoke;
        v70[3] = &unk_1E7AF7B78;
        v70[4] = self;
        -[WFHandleIntentAction getErrorFromExtensionError:completionHandler:](self, "getErrorFromExtensionError:completionHandler:", v4, v70);
        goto LABEL_21;
      }
      v8 = (void *)objc_opt_new();
      v48 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedString(CFSTR("Could not run %@"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction localizedName](self, "localizedName");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "localizedStringWithFormat:", v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v51, *MEMORY[0x1E0CB2D68]);

      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v20);
      -[WFHandleIntentAction appDescriptor](self, "appDescriptor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "localizedName");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "length");

      v55 = (void *)MEMORY[0x1E0CB3940];
      if (v54)
      {
        WFLocalizedString(CFSTR("The action “%1$@” could not run. Open %2$@ to continue."));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAction localizedName](self, "localizedName");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFHandleIntentAction appDescriptor](self, "appDescriptor");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "localizedName");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "localizedStringWithFormat:", v56, v57, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v60, *MEMORY[0x1E0CB2D50]);

      }
      else
      {
        WFLocalizedString(CFSTR("The action “%@” could not run. Open the app to continue."));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAction localizedName](self, "localizedName");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "localizedStringWithFormat:", v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v58, *MEMORY[0x1E0CB2D50]);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFIntentExecutorErrorDomain"), 100, v8);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHandleIntentAction errorThatLaunchesApp:](self, "errorThatLaunchesApp:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFHandleIntentAction finishRunningWithError:](self, "finishRunningWithError:", v68);
LABEL_20:

LABEL_21:
LABEL_40:

      return;
    case 'e':
      objc_msgSend(v4, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("WFIntentExecutorSlotResolutionResultErrorKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("WFIntentExecutorSlotDescriptionErrorKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("WFIntentExecutorIntentErrorKey"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHandleIntentAction handleResolutionResult:forSlot:onIntent:](self, "handleResolutionResult:forSlot:onIntent:", v8, v9, v24);
      goto LABEL_19;
    case 'f':
    case 'g':
      objc_msgSend(v4, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("WFIntentExecutorIntentErrorKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("WFIntentExecutorIntentResponseErrorKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "code") == 102)
        -[WFHandleIntentAction errorFromConfirmResponse:intent:](self, "errorFromConfirmResponse:intent:", v9, v8);
      else
        -[WFHandleIntentAction errorFromHandleResponse:intent:](self, "errorFromHandleResponse:intent:", v9, v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "_intentResponseCode") == 6)
      {
        -[WFHandleIntentAction errorThatLaunchesApp:](self, "errorThatLaunchesApp:", v24);
        v27 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v27;
      }
      -[WFHandleIntentAction finishRunningWithError:](self, "finishRunningWithError:", v24);
LABEL_19:

      goto LABEL_20;
    case 'h':
      objc_msgSend(v4, "userInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKey:", CFSTR("WFIntentExecutorIntentErrorKey"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFHandleIntentAction startExecutingIntent:](self, "startExecutingIntent:", v26);
      goto LABEL_40;
    default:
      goto LABEL_39;
  }
}

- (id)rootCauseErrorFromError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFHandleIntentAction rootCauseErrorFromError:](self, "rootCauseErrorFromError:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

- (void)intentExecutor:(id)a3 showConfirmationForInteraction:(id)a4 confirmationRequired:(BOOL)a5 authenticationRequired:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;

  v7 = a6;
  v8 = a5;
  v11 = a7;
  v12 = a4;
  -[WFAction userInterface](self, "userInterface");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[WFHandleIntentAction showInteractionIfNeeded:inUserInterface:requiringConfirmation:requiringAuthentication:executionStage:completionHandler:](self, "showInteractionIfNeeded:inUserInterface:requiringConfirmation:requiringAuthentication:executionStage:completionHandler:", v12, v13, v8, v7, 0, v11);

}

- (void)intentExecutor:(id)a3 showConfirmationForSlot:(id)a4 item:(id)a5 intent:(id)a6 completion:(id)a7
{
  -[WFHandleIntentAction showConfirmationAndRetryForSlot:item:onIntent:completionHandler:](self, "showConfirmationAndRetryForSlot:item:onIntent:completionHandler:", a4, a5, a6, a7);
}

- (void)intentExecutor:(id)a3 needsAppProtectionUnlockWithCompletionHandler:(id)a4
{
  -[WFAction unlockAppProtectionWithCompletionHandler:](self, "unlockAppProtectionWithCompletionHandler:", a4);
}

- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!a4)
    return 0;
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Connection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "launchAppInBackground:completionHandler:", 0, &__block_literal_global_5010);

  v7 = v5 != 0;
  return v7;
}

- (void)setAppResource:(id)a3
{
  objc_storeStrong((id *)&self->_appResource, a3);
}

- (INIntent)runningIntent
{
  return self->_runningIntent;
}

- (INStringLocalizer)stringLocalizer
{
  return self->_stringLocalizer;
}

- (NSString)overrideLocalizedName
{
  return self->_overrideLocalizedName;
}

- (void)setOverrideLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (WFIntentExecutor)executor
{
  return self->_executor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executor, 0);
  objc_storeStrong((id *)&self->_overrideLocalizedName, 0);
  objc_storeStrong((id *)&self->_stringLocalizer, 0);
  objc_storeStrong((id *)&self->_runningIntent, 0);
  objc_storeStrong((id *)&self->_appResource, 0);
  objc_storeStrong((id *)&self->_intentDescriptor, 0);
}

uint64_t __44__WFHandleIntentAction_handleExecutorError___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

void __69__WFHandleIntentAction_getErrorFromExtensionError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = a2;
  v10 = (id)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("Could not run %@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D68]);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0CB3388]);
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFIntentExecutorErrorDomain"), 100, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

}

void __69__WFHandleIntentAction_getErrorFromExtensionError_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v11 = v4;

  objc_msgSend(v11, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("This action requires %@ to be installed."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WFLocalizedString(CFSTR("This action requires an app to be installed."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __55__WFHandleIntentAction_errorFromHandleResponse_intent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "stringLocalizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_renderedResponseWithLocalizer:requiresSiriCompatibility:", v6, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __67__WFHandleIntentAction_errorFromResolutionResult_forSlot_onIntent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "stringLocalizer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedDialogWithIntent:tokens:localizer:", v3, MEMORY[0x1E0C9AA70], v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __88__WFHandleIntentAction_showConfirmationAndRetryForSlot_item_onIntent_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__WFHandleIntentAction_showConfirmationAndRetryForSlot_item_onIntent_completionHandler___block_invoke_2;
  v5[3] = &unk_1E7AEBBC8;
  v5[4] = v2;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 80);
  v9 = *(id *)(a1 + 72);
  objc_msgSend(v2, "localizedConfirmationPromptForAttribute:intent:completion:", v3, v4, v5);

}

void __88__WFHandleIntentAction_showConfirmationAndRetryForSlot_item_onIntent_completionHandler___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v5 = a2;
  if (a3)
  {
    objc_msgSend(a1[4], "finishRunningWithError:", a3);
  }
  else
  {
    v6 = a1[6];
    objc_msgSend(a1[4], "stringLocalizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedDisplayNameWithLocalizer:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setTitle:", v8);

    objc_msgSend(a1[5], "setMessage:", v5);
    objc_msgSend(a1[6], "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wf_updateWithParameterValue:", a1[7]);

    v10 = a1[5];
    v11 = (void *)MEMORY[0x1E0D14080];
    WFLocalizedString(CFSTR("No"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __88__WFHandleIntentAction_showConfirmationAndRetryForSlot_item_onIntent_completionHandler___block_invoke_3;
    v27[3] = &unk_1E7AF8F48;
    v28 = a1[9];
    objc_msgSend(v11, "buttonWithTitle:subtitle:selected:style:handler:", v12, 0, 0, 0, v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addButton:", v14);

    v15 = a1[5];
    v16 = (void *)MEMORY[0x1E0D14080];
    WFLocalizedString(CFSTR("Yes"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __88__WFHandleIntentAction_showConfirmationAndRetryForSlot_item_onIntent_completionHandler___block_invoke_4;
    v23[3] = &unk_1E7AF8378;
    v24 = a1[8];
    v25 = a1[7];
    v26 = a1[9];
    objc_msgSend(v16, "buttonWithTitle:subtitle:selected:style:handler:", v17, 0, 0, 0, v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addButton:", v18);

    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __88__WFHandleIntentAction_showConfirmationAndRetryForSlot_item_onIntent_completionHandler___block_invoke_5;
    v22[3] = &unk_1E7AF94B0;
    v19 = a1[5];
    v22[4] = a1[4];
    objc_msgSend(MEMORY[0x1E0D13DE8], "cancelButtonWithHandler:", v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addButton:", v20);

    objc_msgSend(a1[4], "userInterface");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "presentAlert:", a1[5]);

  }
}

uint64_t __88__WFHandleIntentAction_showConfirmationAndRetryForSlot_item_onIntent_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__WFHandleIntentAction_showConfirmationAndRetryForSlot_item_onIntent_completionHandler___block_invoke_4(uint64_t a1)
{
  id v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "wf_multipleValues") & 1) != 0)
  {
    v4[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = *(id *)(a1 + 40);
  }
  v3 = v2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __88__WFHandleIntentAction_showConfirmationAndRetryForSlot_item_onIntent_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishRunningWithError:", v2);

}

void __82__WFHandleIntentAction_localizedConfirmationPromptForAttribute_intent_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "stringLocalizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedDialogWithIntent:tokens:localizer:", v2, 0, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

}

void __73__WFHandleIntentAction_showDisambiguationAndRetryForSlot_items_onIntent___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__WFHandleIntentAction_showDisambiguationAndRetryForSlot_items_onIntent___block_invoke_2;
  v7[3] = &unk_1E7AEBB78;
  v7[4] = v4;
  v6 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 72);
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v4, "localizedDisambiguationPromptForAttribute:intent:disambiguationItems:completion:", v5, v6, a2, v7);

}

void __73__WFHandleIntentAction_showDisambiguationAndRetryForSlot_items_onIntent___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  uint64_t v30;
  _QWORD v31[5];
  _QWORD v32[4];
  id v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(a1[4], "finishRunningWithError:", a3);
  }
  else
  {
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(a1[5], "setTitle:", v6);
    }
    else
    {
      objc_msgSend(a1[4], "localizedDefaultDisambiguationPrompt");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "setTitle:", v7);

    }
    v28 = v6;
    objc_msgSend(a1[4], "stringLocalizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = a1[6];
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v9)
    {
      v10 = v9;
      v30 = *(_QWORD *)v38;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v38 != v30)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v11);
          objc_msgSend(a1[7], "metadata");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "wf_updateWithParameterValue:", v12);

          objc_msgSend(a1[7], "metadata");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "_intents_readableTitleWithLocalizer:metadata:", v8, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(a1[7], "metadata");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "_intents_readableSubtitleWithLocalizer:metadata:", v8, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "_intents_displayImageWithLocalizer:", v8);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = a1[5];
          v20 = (void *)MEMORY[0x1E0D14080];
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __73__WFHandleIntentAction_showDisambiguationAndRetryForSlot_items_onIntent___block_invoke_3;
          v32[3] = &unk_1E7AF9298;
          v33 = a1[8];
          v34 = v12;
          v21 = a1[9];
          v22 = a1[4];
          v35 = v21;
          v36 = v22;
          objc_msgSend(v18, "wf_image");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "buttonWithTitle:subtitle:selected:stickySelection:style:handler:image:", v15, v17, 0, 0, 0, v32, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addButton:", v24);

          ++v11;
        }
        while (v10 != v11);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v10);
    }

    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __73__WFHandleIntentAction_showDisambiguationAndRetryForSlot_items_onIntent___block_invoke_4;
    v31[3] = &unk_1E7AF94B0;
    v25 = a1[5];
    v31[4] = a1[4];
    objc_msgSend(MEMORY[0x1E0D13DE8], "cancelButtonWithHandler:", v31);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addButton:", v26);

    objc_msgSend(a1[4], "userInterface");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "presentAlert:", a1[5]);

    v6 = v28;
  }

}

void __73__WFHandleIntentAction_showDisambiguationAndRetryForSlot_items_onIntent___block_invoke_3(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1[4], "wf_multipleValues") & 1) != 0)
  {
    v6[0] = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1[5];
  }
  v3 = v2;
  v4 = (void *)objc_msgSend(a1[6], "copy");
  objc_msgSend(a1[4], "wf_slotName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v3, v5);

  objc_msgSend(a1[7], "startExecutingIntent:", v4);
}

void __73__WFHandleIntentAction_showDisambiguationAndRetryForSlot_items_onIntent___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishRunningWithError:", v2);

}

void __104__WFHandleIntentAction_localizedDisambiguationPromptForAttribute_intent_disambiguationItems_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "stringLocalizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedDialogWithIntent:tokens:localizer:", v3, v4, v5);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(void **)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 56), "stringLocalizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedDialogWithIntent:tokens:localizer:", v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "length") && objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v13, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v13, "length"))
  {
    v11 = v13;
  }
  else
  {
    if (!objc_msgSend(v10, "length"))
    {
      v12 = 0;
      goto LABEL_9;
    }
    v11 = v10;
  }
  v12 = v11;
LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

void __64__WFHandleIntentAction_showAskForValueAndRetryForSlot_onIntent___block_invoke(id *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  if (a4)
  {
    objc_msgSend(a1[4], "finishRunningWithError:", a4);
  }
  else
  {
    objc_msgSend(a1[5], "_codableDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "wf_slotName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributeByName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[7], "key");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = a1[7];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__WFHandleIntentAction_showAskForValueAndRetryForSlot_onIntent___block_invoke_2;
    v16[3] = &unk_1E7AEBB28;
    v15 = a1[5];
    v17 = a1[4];
    v18 = v15;
    v19 = a1[6];
    objc_msgSend(v17, "resolveSlot:withProcessedValue:parameter:input:completion:", v11, v13, v14, v8, v16);

  }
}

void __64__WFHandleIntentAction_showAskForValueAndRetryForSlot_onIntent___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a3)
  {
    objc_msgSend(a1[4], "finishRunningWithError:", a3);
  }
  else
  {
    v5 = (void *)objc_msgSend(a1[5], "copy");
    objc_msgSend(a1[6], "wf_slotName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v7, v6);

    objc_msgSend(a1[4], "startExecutingIntent:", v5);
  }

}

uint64_t __74__WFHandleIntentAction_confirmationAlertForInteraction_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__WFHandleIntentAction_confirmationAlertForInteraction_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __143__WFHandleIntentAction_showInteractionIfNeeded_inUserInterface_requiringConfirmation_requiringAuthentication_executionStage_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, _QWORD, void *);

  v5 = a3;
  v9 = v5;
  switch(a2)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v6);

      goto LABEL_6;
    case 1:
      v5[2](v5, 1, 0);
      goto LABEL_6;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "finishRunningByContinuingInApp");
      goto LABEL_6;
    case 3:
      v7 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishRunningWithError:", v8);

LABEL_6:
      v5 = v9;
      break;
    default:
      break;
  }

}

uint64_t __143__WFHandleIntentAction_showInteractionIfNeeded_inUserInterface_requiringConfirmation_requiringAuthentication_executionStage_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
}

uint64_t __143__WFHandleIntentAction_showInteractionIfNeeded_inUserInterface_requiringConfirmation_requiringAuthentication_executionStage_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
}

uint64_t __143__WFHandleIntentAction_showInteractionIfNeeded_inUserInterface_requiringConfirmation_requiringAuthentication_executionStage_completionHandler___block_invoke_4(uint64_t result, uint64_t a2)
{
  if (a2 == 1)
    return objc_msgSend(*(id *)(result + 32), "finishRunningByContinuingInApp");
  if (!a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 40) + 16))();
  return result;
}

void __70__WFHandleIntentAction_getOutputFromIntentResponse_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  char isKindOfClass;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "executor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "intent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extensionBundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFBundledIntentHandlerProvider localIntentHandlerLaunchID](WFBundledIntentHandlerProvider, "localIntentHandlerLaunchID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    v13 = v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v15 = v13;
    else
      v15 = 0;
    v16 = v15;

    if ((isKindOfClass & 1) != 0 && v12)
    {
      v17 = *MEMORY[0x1E0DC7F60];
      objc_msgSend(v16, "codableDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setMainBundleIdentifier:", v17);

    }
    v19 = (void *)objc_opt_new();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v16;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v20 = v5;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v29;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v29 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(v13, "wf_contentItemForValue:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v24));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
              objc_msgSend(v19, "addItem:", v25);

            ++v24;
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v22);
      }

      v16 = v27;
    }
    else
    {
      objc_msgSend(v13, "wf_contentItemForValue:", v5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
        objc_msgSend(v19, "addItem:", v26);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __46__WFHandleIntentAction_launchAppInBackground___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "executor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned __int8 *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__WFHandleIntentAction_launchAppInBackground___block_invoke_2;
  v6[3] = &unk_1E7AEE348;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "launchAppInBackground:completionHandler:", v5, v6);

}

uint64_t __46__WFHandleIntentAction_launchAppInBackground___block_invoke_2(uint64_t a1, int a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishRunningWithError:", 0);
  else
    return objc_msgSend(v2, "handleExecutorError:");
}

void __54__WFHandleIntentAction_finishRunningByContinuingInApp__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishRunningWithError:", v5);

    v6 = v3;
  }
  else
  {

    getWFWorkflowExecutionLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v10 = 136315394;
      v11 = "-[WFHandleIntentAction finishRunningByContinuingInApp]_block_invoke";
      v12 = 2112;
      v13 = (id)objc_opt_class();
      v8 = v13;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_FAULT, "%s Received unexpected interaction response of type %@", (uint8_t *)&v10, 0x16u);

    }
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishRunningWithError:", v6);
  }

}

uint64_t __54__WFHandleIntentAction_finishRunningByContinuingInApp__block_invoke_210(uint64_t a1, char a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
    return objc_msgSend(v2, "launchAppInBackground:", 0);
  else
    return objc_msgSend(v2, "finishRunningWithError:");
}

void __87__WFHandleIntentAction_populateIntent_withInput_processedParameters_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  void (**v25)(id, _QWORD);

  v6 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "parameterForSlot:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 40);
  objc_msgSend(v8, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v8 && !v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "inputParameter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v16)
      {

LABEL_12:
        v7[2](v7, 0);
        goto LABEL_13;
      }
      v19 = objc_msgSend(*(id *)(a1 + 32), "populatesInputFromInputParameter");

      if ((v19 & 1) == 0)
        goto LABEL_12;
    }
    v20 = *(void **)(a1 + 32);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __87__WFHandleIntentAction_populateIntent_withInput_processedParameters_completionHandler___block_invoke_2;
    v22[3] = &unk_1E7AF5D38;
    v21 = *(_QWORD *)(a1 + 56);
    v23 = *(id *)(a1 + 48);
    v24 = v6;
    v25 = v7;
    objc_msgSend(v20, "resolveSlot:withProcessedValue:parameter:input:completion:", v24, v11, v8, v21, v22);

    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 48), "_parametersForcedToNeedsValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = (id)objc_opt_new();
  v17 = v15;

  objc_msgSend(v6, "wf_slotName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v18);

  objc_msgSend(*(id *)(a1 + 48), "_setParametersForcedToNeedsValue:", v17);
  v7[2](v7, 0);

LABEL_13:
}

void __87__WFHandleIntentAction_populateIntent_withInput_processedParameters_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    getWFGeneralLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[WFHandleIntentAction populateIntent:withInput:processedParameters:completionHandler:]_block_invoke_3";
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_ERROR, "%s WFHandleIntentAction failed to populate intent with error %{public}@", (uint8_t *)&v7, 0x16u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v6();

}

void __87__WFHandleIntentAction_populateIntent_withInput_processedParameters_completionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  if (a2)
  {
    v5 = (void *)a1[4];
    v6 = (void *)a1[5];
    v7 = a2;
    objc_msgSend(v6, "wf_slotName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v7, v8);

  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __71__WFHandleIntentAction_handleExecutionCompletionWithInteraction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  char v8;
  dispatch_time_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  id v15;

  v3 = a2;
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setOutput:", v3);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __71__WFHandleIntentAction_handleExecutionCompletionWithInteraction_error___block_invoke_2;
  v13 = &unk_1E7AF92C0;
  v4 = *(void **)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v4;
  v5 = (void (**)(_QWORD))_Block_copy(&v10);
  objc_msgSend(*(id *)(a1 + 40), "intent", v10, v11, v12, v13, v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "launchId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC7FB8]);

  if ((v8 & 1) != 0)
  {
    v9 = dispatch_time(0, 200000000);
    dispatch_after(v9, MEMORY[0x1E0C80D38], v5);
  }
  else
  {
    v5[2](v5);
  }

}

void __71__WFHandleIntentAction_handleExecutionCompletionWithInteraction_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "userInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__WFHandleIntentAction_handleExecutionCompletionWithInteraction_error___block_invoke_3;
  v5[3] = &unk_1E7AEE348;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "showInteractionIfNeeded:inUserInterface:requiringConfirmation:requiringAuthentication:executionStage:completionHandler:", v3, v4, 0, 0, 1, v5);

}

uint64_t __71__WFHandleIntentAction_handleExecutionCompletionWithInteraction_error___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

uint64_t __53__WFHandleIntentAction_actuallyStartExecutingIntent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleExecutionCompletionWithInteraction:error:", a2, a3);
}

void __53__WFHandleIntentAction_actuallyStartExecutingIntent___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v8, "interaction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v5);

    v6 = v8;
  }
  else
  {

    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishRunningWithError:", v6);
  }

}

uint64_t __45__WFHandleIntentAction_startExecutingIntent___block_invoke(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
    return objc_msgSend(v3, "actuallyStartExecutingIntent:", *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(v3, "finishRunningWithError:");
}

void __65__WFHandleIntentAction_generateStandaloneShortcutRepresentation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  WFStandaloneShortcutRepresentation *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "titleForINShortcut:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[WFStandaloneShortcutRepresentation initWithINShortcut:title:]([WFStandaloneShortcutRepresentation alloc], "initWithINShortcut:title:", v4, v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __55__WFHandleIntentAction_generateShortcutRepresentation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  _QWORD v6[4];
  id v7;

  if (a2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__WFHandleIntentAction_generateShortcutRepresentation___block_invoke_2;
    v6[3] = &unk_1E7AEBA08;
    v5 = *(void **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v5, "generatePopulatedIntentFromInput:processedParameters:completion:", a3, a2, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __55__WFHandleIntentAction_generateShortcutRepresentation___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  if (!v5 || a3)
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v6, 0, a3);
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDBE8]), "initWithIntent:", v5);
    (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

  }
}

void __82__WFHandleIntentAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a4;
  v8 = a1 + 32;
  v7 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(v8 + 8);
  v9 = a2;
  if ((objc_msgSend(v7, "wf_multipleValues") & 1) == 0)
  {
    objc_msgSend(v9, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v10;
  }
  (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v9, v11);

}

uint64_t __51__WFHandleIntentAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "startExecutingIntent:", a2);
  else
    return objc_msgSend(v2, "finishRunningWithError:");
}

@end
