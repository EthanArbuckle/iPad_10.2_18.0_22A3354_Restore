@implementation WFLinkAction

id __46__WFLinkAction_linkActionWithParameterStates___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "valueForParameterData:withParameterState:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D43D98]);
  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithIdentifier:value:", v9, v7);
  return v10;
}

+ (Class)classForLinkActionWithIdentifier:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_class *v18;
  const char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(a1, "linkActionClassOverrides");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", v7);

  if (v10)
  {
LABEL_14:
    if ((objc_msgSend(v10, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
      goto LABEL_15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFLinkActionOverrides.m"), 1624, CFSTR("Link override class must be a WFAction"));
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v8, "systemProtocols");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v20 = a2;
      v14 = *(_QWORD *)v22;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v15), "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(a1, "linkProtocolClassOverrides");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", v16);

            if (v10)
            {

              a2 = v20;
              goto LABEL_14;
            }
          }

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v13)
          continue;
        break;
      }
    }
    v10 = 0;
  }

LABEL_15:
  v18 = v10;

  return v18;
}

+ (id)linkActionClassOverrides
{
  if (linkActionClassOverrides_token != -1)
    dispatch_once(&linkActionClassOverrides_token, &__block_literal_global_641);
  return (id)linkActionClassOverrides_linkActionClassOverrides;
}

+ (id)linkProtocolClassOverrides
{
  if (linkProtocolClassOverrides_token != -1)
    dispatch_once(&linkProtocolClassOverrides_token, &__block_literal_global_711);
  return (id)linkProtocolClassOverrides_linkProtocolClassOverrides;
}

- (WFLinkAction)initWithIdentifier:(id)a3 metadata:(id)a4 definition:(id)a5 serializedParameters:(id)a6 appIntentDescriptor:(id)a7 fullyQualifiedActionIdentifier:(id)a8
{
  id v14;
  WFLinkAction *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  LNActionSummary *v21;
  LNActionSummary *actionSummary;
  void *v23;
  WFActionParameterSummary *v24;
  WFActionParameterSummary *parameterSummary;
  void *v26;
  WFLinkAction *v27;
  objc_super v29;

  v14 = a4;
  v29.receiver = self;
  v29.super_class = (Class)WFLinkAction;
  v15 = -[WFAppIntentExecutionAction initWithIdentifier:metadata:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:](&v29, sel_initWithIdentifier_metadata_definition_serializedParameters_appIntentDescriptor_fullyQualifiedActionIdentifier_, a3, v14, a5, a6, a7, a8);
  if (v15)
  {
    objc_msgSend(v14, "actionConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLinkAction linkActionWithParameterStates:](v15, "linkActionWithParameterStates:", MEMORY[0x1E0C9AA70]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentExecutionAction actionConfigurationContext](v15, "actionConfigurationContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "actionConfigurationByEvaluatingAction:context:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_opt_class();
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

    actionSummary = v15->_actionSummary;
    v15->_actionSummary = v21;

    -[LNActionSummary localizedFormatStringForLocaleIdentifier:](v15->_actionSummary, "localizedFormatStringForLocaleIdentifier:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = -[WFActionParameterSummary initWithLocalizedString:]([WFActionParameterSummary alloc], "initWithLocalizedString:", v23);
      parameterSummary = v15->_parameterSummary;
      v15->_parameterSummary = v24;

    }
    objc_msgSend(v14, "shortcutsActionMetadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_isBuiltIn = v26 != 0;

    -[WFAction addEventObserver:](v15, "addEventObserver:", v15);
    v27 = v15;

  }
  return v15;
}

BOOL __57__WFLinkAction_inputParameterMetadataWithActionMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  objc_msgSend(v2, "valueType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wf_entityValueType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend(v2, "inputConnectionBehavior") != 1;
  else
    v5 = 0;

  return v5;
}

BOOL __57__WFLinkAction_inputParameterMetadataWithActionMetadata___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "inputConnectionBehavior") == 2;
}

- (void)initializeParameters
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFLinkAction;
  -[WFAction initializeParameters](&v3, sel_initializeParameters);
  -[WFLinkAction serializeAppIntentDescriptorIfNecessary](self, "serializeAppIntentDescriptorIfNecessary");
}

- (void)serializeAppIntentDescriptorIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[WFAction serializedParameters](self, "serializedParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("AppIntentDescriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0CA5898];
    -[WFAppIntentExecutionAction fullyQualifiedLinkActionIdentifier](self, "fullyQualifiedLinkActionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v8;
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v15, "containingBundleRecord");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_9;
    }
    else
    {

      v9 = v15;
      if (!v9)
      {
LABEL_9:

        return;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_alloc(MEMORY[0x1E0CBD748]);
      -[WFAppIntentExecutionAction metadata](self, "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v10, "initWithIntentIdentifier:applicationRecord:", v12, v9);

      objc_msgSend(v13, "serializedRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction setSupplementalParameterValue:forKey:](self, "setSupplementalParameterValue:forKey:", v14, CFSTR("AppIntentDescriptor"));

    }
    goto LABEL_9;
  }
}

- (NSString)developerSpecifiedTitle
{
  void *v2;
  void *v3;
  void *v4;

  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForLocaleIdentifier:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (WFLinkAction)linkActionWithParameterStates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  WFLinkAction *v16;

  v4 = a3;
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __46__WFLinkAction_linkActionWithParameterStates___block_invoke;
  v14 = &unk_1E7AEFA90;
  v15 = v4;
  v16 = self;
  v7 = v4;
  objc_msgSend(v6, "if_map:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFAppIntentExecutionAction linkActionWithParameters:](self, "linkActionWithParameters:", v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFLinkAction *)v9;
}

- (id)parameterDefinitions
{
  NSArray *parameterDefinitions;
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  BOOL v14;
  uint64_t v15;
  WFParameterDefinition *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  WFParameterDefinition *v21;
  WFParameterDefinition *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  WFParameterDefinition *v27;
  NSArray *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[4];
  _QWORD v38[4];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  parameterDefinitions = self->_parameterDefinitions;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();

  if (parameterDefinitions == v4)
  {
    v5 = 0;
  }
  else if (parameterDefinitions)
  {
    parameterDefinitions = parameterDefinitions;
    v5 = parameterDefinitions;
  }
  else
  {
    v34.receiver = self;
    v34.super_class = (Class)WFLinkAction;
    -[WFAction parameterDefinitions](&v34, sel_parameterDefinitions);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray count](v6, "count"))
    {
      parameterDefinitions = 0;
      v5 = v6;
    }
    else
    {
      v7 = (void *)objc_opt_new();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      -[WFAppIntentExecutionAction metadata](self, "metadata", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "wf_parameterDefinitions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v31 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        }
        while (v11);
      }

      v14 = -[WFLinkAction showWhenRunParameterIsHidden](self, "showWhenRunParameterIsHidden");
      v15 = MEMORY[0x1E0C9AAB0];
      if (!v14)
      {
        v16 = [WFParameterDefinition alloc];
        v38[0] = CFSTR("ShowWhenRun");
        v37[0] = CFSTR("Key");
        v37[1] = CFSTR("Class");
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v38[1] = v18;
        v38[2] = v15;
        v37[2] = CFSTR("DefaultValue");
        v37[3] = CFSTR("Label");
        WFLocalizedString(CFSTR("Show When Run"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v38[3] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[WFParameterDefinition initWithDictionary:](v16, "initWithDictionary:", v20);

        v15 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(v7, "addObject:", v21);

      }
      if (!-[WFLinkAction openWhenRunParameterIsHidden](self, "openWhenRunParameterIsHidden"))
      {
        v22 = [WFParameterDefinition alloc];
        v36[0] = CFSTR("OpenWhenRun");
        v35[0] = CFSTR("Key");
        v35[1] = CFSTR("Class");
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v36[1] = v24;
        v36[2] = v15;
        v35[2] = CFSTR("DefaultValue");
        v35[3] = CFSTR("Label");
        WFLocalizedString(CFSTR("Open When Run"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v36[3] = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[WFParameterDefinition initWithDictionary:](v22, "initWithDictionary:", v26);

        objc_msgSend(v7, "addObject:", v27);
      }
      v5 = (NSArray *)objc_msgSend(v7, "copy");

      if (v5)
      {
        v28 = v5;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
      }
      parameterDefinitions = self->_parameterDefinitions;
      self->_parameterDefinitions = v28;
    }
  }

  return v5;
}

- (id)inputDictionary
{
  NSDictionary *inputDictionary;
  NSDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSDictionary *v23;
  void *v25;
  objc_super v26;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  inputDictionary = self->_inputDictionary;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  if (inputDictionary == v4)
  {
    v5 = 0;
    goto LABEL_19;
  }
  if (inputDictionary)
  {
    inputDictionary = inputDictionary;
    v5 = inputDictionary;
    goto LABEL_19;
  }
  v26.receiver = self;
  v26.super_class = (Class)WFLinkAction;
  -[WFAction inputDictionary](&v26, sel_inputDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_class();
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputParameterMetadataWithActionMetadata:", v8);
  inputDictionary = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  if (!inputDictionary)
  {
LABEL_16:
    v5 = v6;
    goto LABEL_19;
  }
  -[NSDictionary valueType](inputDictionary, "valueType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppIntentExecutionAction fullyQualifiedLinkActionIdentifier](self, "fullyQualifiedLinkActionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "wf_contentItemClassesWithAppBundleIdentifier:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)objc_msgSend(v6, "mutableCopy");
    v13 = v12;
    v25 = v6;
    if (v12)
      v14 = v12;
    else
      v14 = (id)objc_opt_new();
    v16 = v14;

    v27[0] = CFSTR("Multiple");
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_opt_class();
    objc_msgSend(v17, "numberWithBool:", objc_opt_isKindOfClass() & 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v18;
    v27[1] = CFSTR("Types");
    objc_msgSend(v11, "if_map:", &__block_literal_global_166_23625);
    v19 = v9;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v20;
    v27[2] = CFSTR("ParameterKey");
    -[NSDictionary name](inputDictionary, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addEntriesFromDictionary:", v22);

    v9 = v19;
    v5 = (void *)objc_msgSend(v16, "copy");

    v6 = v25;
  }
  else
  {
    v15 = v6;
  }

  if (!v11)
  {
    inputDictionary = 0;
    goto LABEL_16;
  }
  if (v5)
  {
    v23 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  inputDictionary = self->_inputDictionary;
  self->_inputDictionary = v23;
LABEL_19:

  return v5;
}

+ (id)inputParameterMetadataWithActionMetadata:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend(v3, "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_firstObjectPassingTest:", &__block_literal_global_158_23645);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_5;
  objc_msgSend(v3, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_objectsPassingTest:", &__block_literal_global_159);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") != 1)
  {

LABEL_5:
    v8 = v5;
    goto LABEL_6;
  }
  objc_msgSend(v7, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v8;
}

- (BOOL)showWhenRunParameterIsHidden
{
  void *v2;
  BOOL v3;

  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "outputFlags") & 6) == 0;

  return v3;
}

- (BOOL)openWhenRunParameterIsHidden
{
  void *v2;
  BOOL v3;

  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "outputFlags") & 1) == 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mangledTypeName, 0);
  objc_storeStrong((id *)&self->_parameterSummary, 0);
  objc_storeStrong((id *)&self->_actionSummary, 0);
  objc_storeStrong((id *)&self->_outputMeasurementUnitType, 0);
  objc_storeStrong((id *)&self->_inputDictionary, 0);
  objc_storeStrong((id *)&self->_parameterDefinitions, 0);
}

- (BOOL)isPlatformProvidedUnderstandingAction
{
  return 0;
}

- (void)getDocumentsLinkValueFromParameterMetadata:(id)a3 processedParameters:(id)a4 parameterState:(id)a5 valueType:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;

  v11 = a6;
  v12 = a7;
  v13 = a4;
  objc_msgSend(a3, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v11;
    v17 = v15;
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
    }
    else
    {
      v18 = 0;
    }
    v21 = v18;

    if (objc_msgSend(v21, "count"))
    {
      v22 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __133__WFLinkAction_Documents__getDocumentsLinkValueFromParameterMetadata_processedParameters_parameterState_valueType_completionHandler___block_invoke;
      v27[3] = &unk_1E7AEDBF8;
      v27[4] = self;
      v28 = v16;
      v24[0] = v22;
      v24[1] = 3221225472;
      v24[2] = __133__WFLinkAction_Documents__getDocumentsLinkValueFromParameterMetadata_processedParameters_parameterState_valueType_completionHandler___block_invoke_2;
      v24[3] = &unk_1E7AF8790;
      v26 = v12;
      v25 = v28;
      objc_msgSend(v21, "if_mapAsynchronously:completionHandler:", v27, v24);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
    }

  }
  else
  {
    v19 = v15;
    if (v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
    }
    else
    {
      v20 = 0;
    }
    v23 = v20;

    -[WFLinkAction documentsValueFromRepresentation:valueType:completionHandler:](self, "documentsValueFromRepresentation:valueType:completionHandler:", v23, v11, v12);
  }

}

- (void)documentsValueFromRepresentation:(id)a3 valueType:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D13EC0], "itemWithFile:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __88__WFLinkAction_Documents__documentsValueFromRepresentation_valueType_completionHandler___block_invoke;
    v11[3] = &unk_1E7AEDC20;
    v13 = v9;
    v12 = v7;
    objc_msgSend(v10, "getObjectRepresentation:forClass:", v11, objc_opt_class());

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }

}

void __88__WFLinkAction_Documents__documentsValueFromRepresentation_valueType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  objc_class *v4;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = (objc_class *)MEMORY[0x1E0D43E38];
  v5 = a2;
  v6 = (id)objc_msgSend([v4 alloc], "initWithValue:valueType:", v5, *(_QWORD *)(a1 + 32));

  (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v6, 0);
}

void __133__WFLinkAction_Documents__getDocumentsLinkValueFromParameterMetadata_processedParameters_parameterState_valueType_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v6 = a4;
  v7 = *(void **)(a1 + 32);
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v11;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 40), "memberValueType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentsValueFromRepresentation:valueType:completionHandler:", v9, v10, v6);

}

void __133__WFLinkAction_Documents__getDocumentsLinkValueFromParameterMetadata_processedParameters_parameterState_valueType_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = (objc_class *)MEMORY[0x1E0D43E38];
  v7 = a3;
  v8 = a2;
  v9 = [v6 alloc];
  objc_msgSend(*(id *)(a1 + 32), "memberValueType");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "initWithValues:memberValueType:", v8, v11);

  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v10, v7);
}

void __53__WFLinkAction_Overrides__linkProtocolClassOverrides__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[10];
  _QWORD v13[12];

  v13[10] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D43A10];
  objc_opt_self();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v0;
  v12[1] = *MEMORY[0x1E0D43A38];
  objc_opt_self();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v1;
  v12[2] = *MEMORY[0x1E0D43A50];
  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v2;
  v12[3] = *MEMORY[0x1E0D43A30];
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v3;
  v12[4] = *MEMORY[0x1E0D43A68];
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v4;
  v12[5] = *MEMORY[0x1E0D43A18];
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v5;
  v12[6] = *MEMORY[0x1E0D43A48];
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v6;
  v12[7] = *MEMORY[0x1E0D43A28];
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v7;
  v12[8] = *MEMORY[0x1E0D43A78];
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[8] = v8;
  v12[9] = *MEMORY[0x1E0D43A40];
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[9] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 10);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)linkProtocolClassOverrides_linkProtocolClassOverrides;
  linkProtocolClassOverrides_linkProtocolClassOverrides = v10;

}

void __51__WFLinkAction_Overrides__linkActionClassOverrides__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[3];
  _QWORD v86[3];
  _QWORD v87[61];
  _QWORD v88[63];

  v88[61] = *MEMORY[0x1E0C80C00];
  v87[0] = CFSTR("com.apple.mobilecal.Close");
  objc_opt_self();
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v78;
  v87[1] = CFSTR("com.apple.mobilecal.CreateCalendar");
  objc_opt_self();
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = v77;
  v87[2] = CFSTR("com.apple.mobilecal.DeleteCalendar");
  objc_opt_self();
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v88[2] = v76;
  v87[3] = CFSTR("com.apple.mobilecal.OpenScreen");
  objc_opt_self();
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v88[3] = v75;
  v87[4] = CFSTR("com.apple.iBooks.BookReaderChangePageNavigationIntent");
  objc_opt_self();
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v88[4] = v74;
  v87[5] = CFSTR("com.apple.iBooks.BookReaderChangeThemeIntent");
  objc_opt_self();
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v88[5] = v73;
  v87[6] = CFSTR("com.apple.iBooks.BookReaderNavigatePagesIntent");
  objc_opt_self();
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v88[6] = v72;
  v87[7] = CFSTR("com.apple.iBooks.OpenAssetIntent");
  objc_opt_self();
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v88[7] = v71;
  v87[8] = CFSTR("com.apple.iBooks.OpenDefaultCollectionIntent");
  objc_opt_self();
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v88[8] = v70;
  v87[9] = CFSTR("com.apple.iBooks.OpenTabBarItemIntent");
  objc_opt_self();
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v88[9] = v69;
  v87[10] = CFSTR("com.apple.iBooks.PlayAudiobookIntent");
  objc_opt_self();
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v88[10] = v68;
  v87[11] = CFSTR("com.apple.iBooks.SearchBooksIntent");
  objc_opt_self();
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v88[11] = v67;
  v87[12] = CFSTR("com.apple.iBooks.BookAppEntity");
  objc_opt_self();
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v88[12] = v66;
  v87[13] = CFSTR("com.apple.mobilenotes.AddTagsToNotesLinkAction");
  objc_opt_self();
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v88[13] = v65;
  v87[14] = CFSTR("com.apple.mobilenotes.RemoveTagsFromNotesLinkAction");
  objc_opt_self();
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v88[14] = v64;
  v87[15] = CFSTR("com.apple.mobilenotes.MoveNotesToFolderLinkAction");
  objc_opt_self();
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v88[15] = v63;
  v87[16] = CFSTR("com.apple.mobilenotes.OpenAppLocationLinkAction");
  objc_opt_self();
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v88[16] = v62;
  v87[17] = CFSTR("com.apple.mobilenotes.PinNotesLinkAction");
  objc_opt_self();
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v88[17] = v61;
  v87[18] = CFSTR("com.apple.mobilenotes.CreateFolderLinkAction");
  objc_opt_self();
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v88[18] = v60;
  v87[19] = CFSTR("com.apple.mobilenotes.CreateTagLinkAction");
  objc_opt_self();
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v88[19] = v59;
  v87[20] = CFSTR("com.apple.mobilenotes.DeleteTagsLinkAction");
  objc_opt_self();
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v88[20] = v58;
  v87[21] = CFSTR("com.apple.mobilenotes.DeleteFoldersLinkAction");
  objc_opt_self();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v88[21] = v57;
  v87[22] = CFSTR("com.apple.mobilenotes.OpenFolderLinkAction");
  objc_opt_self();
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v88[22] = v56;
  v87[23] = CFSTR("com.apple.mobilenotes.OpenTagLinkAction");
  objc_opt_self();
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v88[23] = v55;
  v87[24] = CFSTR("com.apple.mobilenotes.OpenAccountLinkAction");
  objc_opt_self();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v88[24] = v54;
  v87[25] = CFSTR("com.apple.mobilenotes.ChangeSettingLinkAction");
  objc_opt_self();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v88[25] = v53;
  v87[26] = CFSTR("is.workflow.actions.filter.notes");
  objc_opt_self();
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v88[26] = v52;
  v87[27] = CFSTR("com.apple.VoiceMemos.ChangeRecordingPlaybackSetting");
  objc_opt_self();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v88[27] = v51;
  v87[28] = CFSTR("com.apple.VoiceMemos.PlaybackVoiceMemoIntent");
  objc_opt_self();
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v88[28] = v50;
  v87[29] = CFSTR("com.apple.VoiceMemos.SearchRecordings");
  objc_opt_self();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v88[29] = v49;
  v87[30] = CFSTR("com.apple.VoiceMemos.CreateFolder");
  objc_opt_self();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v88[30] = v48;
  v87[31] = CFSTR("com.apple.VoiceMemos.DeleteFolder");
  objc_opt_self();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v88[31] = v47;
  v87[32] = CFSTR("com.apple.VoiceMemos.DeleteRecording");
  objc_opt_self();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v88[32] = v46;
  v87[33] = CFSTR("com.apple.VoiceMemos.OpenFolder");
  objc_opt_self();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v88[33] = v45;
  v87[34] = CFSTR("com.apple.VoiceMemos.SelectRecording");
  objc_opt_self();
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v88[34] = v44;
  v87[35] = CFSTR("com.apple.reminders.TTRCreateListAppIntent");
  objc_opt_self();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v88[35] = v43;
  v87[36] = CFSTR("com.apple.reminders.TTROpenSmartListAppIntent");
  objc_opt_self();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v88[36] = v42;
  v87[37] = CFSTR("com.apple.mobilesafari.CreateNewTab");
  objc_opt_self();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v88[37] = v41;
  v87[38] = CFSTR("com.apple.mobilesafari.CreateNewPrivateTab");
  objc_opt_self();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v88[38] = v40;
  v87[39] = CFSTR("com.apple.mobilesafari.CloseTab");
  objc_opt_self();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v88[39] = v39;
  v87[40] = CFSTR("com.apple.mobilesafari.CreateNewTabGroup");
  objc_opt_self();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v88[40] = v38;
  v87[41] = CFSTR("com.apple.mobilesafari.OpenTabGroup");
  objc_opt_self();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v88[41] = v37;
  v87[42] = CFSTR("com.apple.mobilesafari.OpenTab");
  objc_opt_self();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v88[42] = v36;
  v87[43] = CFSTR("com.apple.mobilesafari.OpenBookmark");
  objc_opt_self();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v88[43] = v35;
  v87[44] = CFSTR("com.apple.mobilesafari.OpenReadingListItem");
  objc_opt_self();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v88[44] = v34;
  v87[45] = CFSTR("com.apple.mobilesafari.OpenView");
  objc_opt_self();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v88[45] = v33;
  v87[46] = CFSTR("com.apple.mobilesafari.BookmarkEntity");
  objc_opt_self();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v88[46] = v32;
  v87[47] = CFSTR("com.apple.mobilesafari.ReadingListItemEntity");
  objc_opt_self();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v88[47] = v31;
  v87[48] = CFSTR("com.apple.mobilesafari.TabEntity");
  objc_opt_self();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v88[48] = v30;
  v87[49] = CFSTR("com.apple.mobilesafari.TabGroupEntity");
  objc_opt_self();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v88[49] = v29;
  v87[50] = CFSTR("com.apple.mobilesafari.ChangeReaderModeState");
  objc_opt_self();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v88[50] = v28;
  v87[51] = CFSTR("com.apple.musicrecognition.RecognizeMusicIntent");
  objc_opt_self();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v88[51] = v27;
  v87[52] = CFSTR("com.apple.shortcuts.CreateWorkflowAction");
  objc_opt_self();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v88[52] = v26;
  v87[53] = CFSTR("com.apple.shortcuts.DeleteWorkflowAction");
  objc_opt_self();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v88[53] = v0;
  v87[54] = CFSTR("com.apple.shortcuts.SearchShortcutsAction");
  objc_opt_self();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v88[54] = v1;
  v87[55] = CFSTR("com.apple.shortcuts.SetDataRoamingAction");
  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v88[55] = v2;
  v87[56] = CFSTR("com.apple.shortcuts.SetDefaultCellularPlanAction");
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v88[56] = v3;
  v87[57] = CFSTR("com.apple.shortcuts.ResetCellularDataStatisticsAction");
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v88[57] = v4;
  v87[58] = CFSTR("com.apple.shortcuts.ToggleCellularPlanAction");
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v88[58] = v5;
  v87[59] = *MEMORY[0x1E0DC82D0];
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v88[59] = v6;
  v87[60] = CFSTR("com.apple.ShortcutsActions.OpenCameraAction");
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v88[60] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 61);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)linkActionClassOverrides_linkActionClassOverrides;
  linkActionClassOverrides_linkActionClassOverrides = v8;

  if (NSClassFromString(CFSTR("WFCreateNoteAction")))
  {
    v10 = (void *)linkActionClassOverrides_linkActionClassOverrides;
    v85[0] = CFSTR("com.apple.mobilenotes.SharingExtension");
    v86[0] = NSClassFromString(CFSTR("WFCreateNoteAction"));
    v85[1] = CFSTR("is.workflow.actions.appendnote");
    v86[1] = NSClassFromString(CFSTR("WFAppendToNoteAction"));
    v85[2] = CFSTR("is.workflow.actions.shownote");
    v86[2] = NSClassFromString(CFSTR("WFShowNoteAction"));
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "if_dictionaryByAddingEntriesFromDictionary:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)linkActionClassOverrides_linkActionClassOverrides;
    linkActionClassOverrides_linkActionClassOverrides = v12;

  }
  if (NSClassFromString(CFSTR("WFStartTimerAction")))
  {
    v14 = (void *)linkActionClassOverrides_linkActionClassOverrides;
    v83[0] = CFSTR("is.workflow.actions.timer.start");
    v83[1] = CFSTR("com.apple.mobiletimer.INCreateTimerIntent");
    v84[0] = NSClassFromString(CFSTR("WFStartTimerAction"));
    v84[1] = NSClassFromString(CFSTR("WFStartTimerAction"));
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "if_dictionaryByAddingEntriesFromDictionary:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)linkActionClassOverrides_linkActionClassOverrides;
    linkActionClassOverrides_linkActionClassOverrides = v16;

  }
  if (NSClassFromString(CFSTR("WFLinkClockCreateAlarmAction")))
  {
    v18 = (void *)linkActionClassOverrides_linkActionClassOverrides;
    v81[0] = CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents.MTCreateAlarmIntent");
    v81[1] = CFSTR("com.apple.mobiletimer.CreateAlarmIntent");
    v82[0] = NSClassFromString(CFSTR("WFLinkClockCreateAlarmAction"));
    v82[1] = NSClassFromString(CFSTR("WFLinkClockCreateAlarmAction"));
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "if_dictionaryByAddingEntriesFromDictionary:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)linkActionClassOverrides_linkActionClassOverrides;
    linkActionClassOverrides_linkActionClassOverrides = v20;

  }
  if (NSClassFromString(CFSTR("WFLinkClockToggleAlarmAction")))
  {
    v22 = (void *)linkActionClassOverrides_linkActionClassOverrides;
    v79[0] = CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents.MTToggleAlarmIntent");
    v79[1] = CFSTR("com.apple.mobiletimer.ToggleAlarmIntent");
    v80[0] = NSClassFromString(CFSTR("WFLinkClockToggleAlarmAction"));
    v80[1] = NSClassFromString(CFSTR("WFLinkClockToggleAlarmAction"));
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "if_dictionaryByAddingEntriesFromDictionary:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)linkActionClassOverrides_linkActionClassOverrides;
    linkActionClassOverrides_linkActionClassOverrides = v24;

  }
}

- (void)wasAddedToWorkflow:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFLinkAction;
  -[WFAction wasAddedToWorkflow:](&v4, sel_wasAddedToWorkflow_, a3);
  -[WFLinkAction forceUpdateParameterVisibility](self, "forceUpdateParameterVisibility");
  -[WFAction preloadDefaultParameterStatesIfNecessaryWithCompletionHandler:](self, "preloadDefaultParameterStatesIfNecessaryWithCompletionHandler:", &__block_literal_global_23639);
}

- (id)icon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v9 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = v5;
    v5 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v5, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_9:
    v15.receiver = self;
    v15.super_class = (Class)WFLinkAction;
    -[WFAction icon](&v15, sel_icon);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v7 = objc_alloc(MEMORY[0x1E0CB34D0]);
  objc_msgSend(v5, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "_initUniqueWithURL:", v8);

  v10 = (void *)MEMORY[0x1E0DC7B70];
  objc_msgSend(v5, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageNamed:inBundle:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_8:

    goto LABEL_9;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7B78]), "initWithImage:", v12);

LABEL_10:
  return v13;
}

- (id)iconName
{
  objc_super v3;

  if (self->_isBuiltIn)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)WFLinkAction;
  -[WFAction iconName](&v3, sel_iconName);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldBeIncludedInAppsList
{
  return !self->_isBuiltIn;
}

- (id)supportedAppIdentifiers
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFLinkAction;
  -[WFAction supportedAppIdentifiers](&v7, sel_supportedAppIdentifiers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_isBuiltIn || (objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0DC7F78]) & 1) != 0)
    v5 = 0;
  else
    v5 = v4;

  return v5;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForLocaleIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptionText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  objc_msgSend(v4, "locale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "localeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForLocaleIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultValueName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "localeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForLocaleIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFLinkAction;
    -[WFAppIntentExecutionAction localizedDefaultOutputNameWithContext:](&v12, sel_localizedDefaultOutputNameWithContext_, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchKeywords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__WFLinkAction_localizedKeywordsWithContext___block_invoke;
  v11[3] = &unk_1E7AF6B00;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v7, "if_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)localizedCategoryWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  objc_super v14;

  v4 = a3;
  if (self->_isBuiltIn)
  {
    v14.receiver = self;
    v14.super_class = (Class)WFLinkAction;
    -[WFAction localizedCategoryWithContext:](&v14, sel_localizedCategoryWithContext_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFAppIntentExecutionAction metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "descriptionMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "categoryName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "locale");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localeIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForLocaleIdentifier:", v11);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)WFLinkAction;
      -[WFAction localizedCategoryWithContext:](&v13, sel_localizedCategoryWithContext_, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5;
}

- (id)localizedDiscontinuedDescriptionWithContext:(id)a3
{
  id v4;
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
  void *v19;
  void *v20;
  id v21;

  v4 = a3;
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deprecationMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "messageText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForLocaleIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFAction definition](self, "definition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("DiscontinuedReplacementTitle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedStringResourceWithKey(CFSTR("Please use “%@” instead."), CFSTR("Please use “%@” instead."));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localize:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locale");
      v16 = v10;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localeIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForLocaleIdentifier:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringWithFormat:", v15, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v16;
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%@ %@"), v16, v20);
      v21 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = v10;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[WFAction processedParameters](self, "processedParameters", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__WFLinkAction_runAsynchronouslyWithInput___block_invoke;
  v5[3] = &unk_1E7AF4320;
  v5[4] = self;
  -[WFAppIntentExecutionAction getLinkActionWithProcessedParameters:completionHandler:](self, "getLinkActionWithProcessedParameters:completionHandler:", v4, v5);

}

- (void)runAsynchronouslyWithLinkAction:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const char *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  WFActionSessionKitSessionConfiguration *v44;
  BOOL v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  _QWORD v56[5];
  id v57;
  _QWORD v58[2];
  _QWORD v59[3];

  v59[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[WFAppIntentExecutionAction actionIsExecutedFromAnotherDevice](self, "actionIsExecutedFromAnotherDevice"))
  {
    if (-[WFLinkAction opensWhenRun](self, "opensWhenRun")
      || (-[WFAction disabledOnPlatforms](self, "disabledOnPlatforms"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "containsObject:", CFSTR("Watch")),
          v6,
          v7))
    {
      WFLocalizedString(CFSTR("Sorry, you can’t do that here. Try it on your iPhone instead."));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v58[0] = *MEMORY[0x1E0CB2D68];
      v10 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedString(CFSTR("Could Not Run “%@”"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction localizedName](self, "localizedName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringWithFormat:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v58[1] = *MEMORY[0x1E0CB2D50];
      v59[0] = v13;
      v59[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 15, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFAppIntentExecutionAction finishRunningWithError:](self, "finishRunningWithError:", v15);
LABEL_29:

      goto LABEL_30;
    }
  }
  -[WFAction userInterface](self, "userInterface");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isRunningWithSiriUI"))
  {

    goto LABEL_10;
  }
  v17 = -[WFAppIntentExecutionAction skipExecutingInSiri](self, "skipExecutingInSiri");

  if (v17)
    goto LABEL_10;
  v18 = objc_alloc(MEMORY[0x1E0DC7CE0]);
  -[WFAppIntentExecutionAction appDescriptor](self, "appDescriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bundleIdentifier");
  v20 = objc_claimAutoreleasedReturnValue();
  -[WFAction localizedName](self, "localizedName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v18, "initWithAction:bundleIdentifier:nameOverride:showWhenRun:", v5, v20, v21, -[WFLinkAction showsWhenRun](self, "showsWhenRun"));

  -[WFAction userInterface](self, "userInterface");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __48__WFLinkAction_runAsynchronouslyWithLinkAction___block_invoke;
  v56[3] = &unk_1E7AEFA68;
  v56[4] = self;
  v57 = v5;
  LOBYTE(v20) = objc_msgSend(v23, "performSiriRequest:completionHandler:", v22, v56);

  if ((v20 & 1) == 0)
  {
LABEL_10:
    -[WFAppIntentExecutionAction connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "hasSystemAperture");

    -[WFLinkAction showsWhenRunIfApplicable](self, "showsWhenRunIfApplicable");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "BOOLValue");

    if (v27 && (v25 & 1) == 0)
    {
      -[WFAction runningDelegate](self, "runningDelegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "action:didDecideRunningProgressIsAllowed:", self, 0);

    }
    -[WFAppIntentExecutionAction sessionKitSessionInvocationType](self, "sessionKitSessionInvocationType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      -[WFAction runningDelegate](self, "runningDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "action:didDecideRunningProgressIsAllowed:", self, 1);
      goto LABEL_24;
    }
    -[WFAppIntentExecutionAction metadata](self, "metadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "systemProtocols");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D43E20], "sessionStartingProtocol");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "containsObject:", v32);

    if (v33)
    {
      objc_msgSend(v8, "bundleIdentifier");
      v34 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[WFAppIntentExecutionAction metadata](self, "metadata");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "systemProtocols");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D43E20], "audioStartingProtocol");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v36, "containsObject:", v37))
      {

      }
      else
      {
        -[WFAppIntentExecutionAction metadata](self, "metadata");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "systemProtocols");
        v54 = v5;
        v39 = a2;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D43E20], "audioRecordingProtocol");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v40, "containsObject:", v41);

        a2 = v39;
        v5 = v54;

        if (!v42)
        {
          -[WFAction sessionKitSessionConfiguration](self, "sessionKitSessionConfiguration");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (v51)
          {
            -[WFAction sessionKitSessionConfiguration](self, "sessionKitSessionConfiguration");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "bundleIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
              goto LABEL_22;
          }
          goto LABEL_33;
        }
      }
      v34 = (id)*MEMORY[0x1E0DC7EE0];
    }
    v15 = v34;
    if (v34)
    {
LABEL_22:
      -[WFAction sessionKitToastDurationsPerRunSourceDefinition](self, "sessionKitToastDurationsPerRunSourceDefinition");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = -[WFActionSessionKitSessionConfiguration initWithBundleIdentifier:toastDurationPerRunSource:]([WFActionSessionKitSessionConfiguration alloc], "initWithBundleIdentifier:toastDurationPerRunSource:", v15, v43);
      v55 = 0;
      v45 = -[WFAction allowSessionKitSessionsIfNeededWithConfiguration:error:](self, "allowSessionKitSessionsIfNeededWithConfiguration:error:", v44, &v55);
      v46 = v55;
      v47 = v46;
      if (!v45)
      {
        -[WFAppIntentExecutionAction finishRunningWithError:](self, "finishRunningWithError:", v46);

        goto LABEL_28;
      }

LABEL_24:
      -[WFAppIntentExecutionAction executorOptions](self, "executorOptions");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "executorForAction:options:delegate:", v5, v48, self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[WFAction progress](self, "progress");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "progress");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "addChild:withPendingUnitCount:", v50, 1);

        objc_msgSend(v15, "perform");
        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 16, 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAppIntentExecutionAction finishRunningWithError:](self, "finishRunningWithError:", v43);
LABEL_28:

      goto LABEL_29;
    }
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkAction.m"), 386, CFSTR("Intent is expected to start live activity, but we couldn't figure out what process will"));

    v15 = 0;
    goto LABEL_22;
  }
LABEL_30:

}

- (void)updateParameterSummaryIfNeeded:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD aBlock[5];
  id v15;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__WFLinkAction_updateParameterSummaryIfNeeded___block_invoke;
  aBlock[3] = &unk_1E7AEFB70;
  aBlock[4] = self;
  v6 = v4;
  v15 = v6;
  v7 = _Block_copy(aBlock);
  -[WFAction toolInvocation](self, "toolInvocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFAction input](self, "input");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __47__WFLinkAction_updateParameterSummaryIfNeeded___block_invoke_2;
    v12[3] = &unk_1E7AF5D68;
    v12[4] = self;
    v13 = v7;
    -[WFAction processParametersWithoutAskingForValuesWithInput:workQueue:completionHandler:](self, "processParametersWithoutAskingForValuesWithInput:workQueue:completionHandler:", v9, v10, v12);

    v11 = v13;
  }
  else
  {
    -[WFLinkAction linkActionWithSerializedParameters](self, "linkActionWithSerializedParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *, _QWORD))v7 + 2))(v7, v11, 0);
  }

}

- (BOOL)updateParameterSummaryIfNeededWithLinkAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  WFActionParameterSummary *v17;

  v4 = a3;
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppIntentExecutionAction actionConfigurationContext](self, "actionConfigurationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionConfigurationByEvaluatingAction:context:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  -[WFLinkAction actionSummary](self, "actionSummary");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_10;
  v13 = (void *)v12;
  if (!v11)
  {
    v16 = 0;
LABEL_14:

    goto LABEL_15;
  }
  -[WFLinkAction actionSummary](self, "actionSummary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", v11);

  if ((v15 & 1) == 0)
  {
LABEL_10:
    -[WFLinkAction setActionSummary:](self, "setActionSummary:", v11);
    objc_msgSend(v11, "localizedFormatStringForLocaleIdentifier:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v17 = -[WFActionParameterSummary initWithLocalizedString:]([WFActionParameterSummary alloc], "initWithLocalizedString:", v13);
      -[WFLinkAction setParameterSummary:](self, "setParameterSummary:", v17);

    }
    -[WFLinkAction updateParameterVisibility](self, "updateParameterVisibility");
    v16 = 1;
    goto LABEL_14;
  }
  v16 = 0;
LABEL_15:

  return v16;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  unsigned __int8 v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  void *v21;
  unsigned __int8 v23;
  _QWORD v24[5];
  id v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v6);

  v32.receiver = self;
  v32.super_class = (Class)WFLinkAction;
  v10 = -[WFAction setParameterState:forKey:](&v32, sel_setParameterState_forKey_, v6, v7);
  v11 = v10;
  if (!v6 || (v9 & 1) == 0)
  {
    v23 = v10;
    -[WFAppIntentExecutionAction dependentParameterIdentifiers](self, "dependentParameterIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          -[WFAction parameterForKey:](self, "parameterForKey:", v19);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __41__WFLinkAction_setParameterState_forKey___block_invoke;
            v24[3] = &unk_1E7AEFAE0;
            v24[4] = self;
            v25 = v20;
            v26 = v19;
            v27 = v25;
            -[WFAppIntentExecutionAction loadDefaultSerializedRepresentationForEnumeration:completionHandler:](self, "loadDefaultSerializedRepresentationForEnumeration:completionHandler:", v25, v24);

          }
          else
          {

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v16);
    }

    -[WFAppIntentExecutionAction dependentParameterIdentifiers](self, "dependentParameterIdentifiers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeAllObjects");

    v11 = v23;
  }

  return v11;
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "customIntentClassName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_className");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    -[WFAction parametersByKey](self, "parametersByKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CBDC38], "localizerForLanguage:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WFSerializedParametersForDonatedIntent(v6, 1, a4, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)outputMeasurementUnitType
{
  NSString *outputMeasurementUnitType;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;

  outputMeasurementUnitType = self->_outputMeasurementUnitType;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (outputMeasurementUnitType == v4)
    goto LABEL_9;
  if (outputMeasurementUnitType)
  {
    outputMeasurementUnitType = outputMeasurementUnitType;
    v5 = outputMeasurementUnitType;
    goto LABEL_10;
  }
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outputType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wf_objectValueType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    outputMeasurementUnitType = 0;
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0DC7BE8], "unitTypeFromLinkMeasurementUnitType:", objc_msgSend(v8, "unitType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v9 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  outputMeasurementUnitType = self->_outputMeasurementUnitType;
  self->_outputMeasurementUnitType = v9;
LABEL_10:

  return v5;
}

- (NSNumber)showsWhenRunIfApplicable
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("ShowWhenRun"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "isHidden") & 1) == 0
    && (objc_msgSend(v4, "resourceManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "resourcesRequiredForDisplayAvailable"),
        v5,
        v6))
  {
    -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("ShowWhenRun"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return (NSNumber *)v7;
}

- (BOOL)showsWhenRun
{
  void *v2;
  char v3;

  -[WFLinkAction showsWhenRunIfApplicable](self, "showsWhenRunIfApplicable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSNumber)opensWhenRunIfApplicable
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("OpenWhenRun"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "isHidden") & 1) == 0
    && (objc_msgSend(v4, "resourceManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "resourcesRequiredForDisplayAvailable"),
        v5,
        v6))
  {
    -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("OpenWhenRun"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return (NSNumber *)v7;
}

- (BOOL)opensWhenRun
{
  void *v2;
  char v3;

  -[WFLinkAction opensWhenRunIfApplicable](self, "opensWhenRunIfApplicable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)generatedResourceNodes
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  WFResourceNode *v18;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _QWORD v27[3];
  _QWORD v28[3];
  void *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)WFLinkAction;
  -[WFAction generatedResourceNodes](&v26, sel_generatedResourceNodes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v3, "mutableCopy");

  -[WFLinkAction parameterDefinitions](self, "parameterDefinitions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_compactMap:", &__block_literal_global_228_23558);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9);
        v30[0] = CFSTR("WFResourceClass");
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v30[1] = CFSTR("RequiredResources");
        v31[0] = v12;
        v27[0] = CFSTR("WFResourceClass");
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v14;
        v28[1] = v10;
        v27[1] = CFSTR("WFParameterKey");
        v27[2] = CFSTR("WFParameterValue");
        v28[2] = &unk_1E7B8DD60;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v31[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = -[WFResourceNode initWithDefinition:]([WFResourceNode alloc], "initWithDefinition:", v17);
        objc_msgSend(v21, "addObject:", v18);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v7);
  }

  return v21;
}

- (id)currentParameterStates
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[WFAction parameters](self, "parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "key", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAction parameterStateForKey:](self, "parameterStateForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "key");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "if_setValueIfNonNil:forKey:", v12, v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)forceUpdateParameterVisibility
{
  void *v3;
  BOOL v4;

  -[WFLinkAction linkActionWithSerializedParameters](self, "linkActionWithSerializedParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WFLinkAction updateParameterSummaryIfNeededWithLinkAction:](self, "updateParameterSummaryIfNeededWithLinkAction:", v3);

  if (!v4)
    -[WFLinkAction updateParameterVisibility](self, "updateParameterVisibility");
}

- (void)updateParameterVisibility
{
  WFLinkAction *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  WFLinkAction *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v2 = self;
  v45 = *MEMORY[0x1E0C80C00];
  -[WFLinkAction actionSummary](self, "actionSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "summaryString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parameterIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {

    }
    else
    {
      objc_msgSend(v4, "otherParameterIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (!v8)
      {
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        -[WFAction parameters](v2, "parameters");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v30; ++i)
            {
              if (*(_QWORD *)v40 != v31)
                objc_enumerationMutation(obj);
              objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "setHidden:", 0);
            }
            v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
          }
          while (v30);
        }
        goto LABEL_17;
      }
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[WFAppIntentExecutionAction metadata](v2, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "parameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v10;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v36;
      v33 = v2;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFAction parameterForKey:](v2, "parameterForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "summaryString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "parameterIdentifiers");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "key");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "containsObject:", v19))
          {
            objc_msgSend(v16, "setHidden:", 0);
          }
          else
          {
            objc_msgSend(v4, "otherParameterIdentifiers");
            v20 = v12;
            v21 = v13;
            v22 = v4;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "key");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setHidden:", objc_msgSend(v23, "containsObject:", v24) ^ 1);

            v4 = v22;
            v13 = v21;
            v12 = v20;
            v2 = v33;
          }

          if (-[WFAction shouldInsertExpandingParameterForParameter:](v2, "shouldInsertExpandingParameterForParameter:", v16))
          {
            v25 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v16, "key");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringWithFormat:", CFSTR("Show-%@"), v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            -[WFAction parameterForKey:](v2, "parameterForKey:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setHidden:", objc_msgSend(v16, "isHidden"));

          }
          objc_msgSend(v16, "attributesDidChange");

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v12);
    }
LABEL_17:

  }
}

- (WFLinkAction)linkActionWithSerializedParameters
{
  void *v3;
  void *v4;

  -[WFLinkAction currentParameterStates](self, "currentParameterStates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkAction linkActionWithParameterStates:](self, "linkActionWithParameterStates:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFLinkAction *)v4;
}

- (void)finishRunningWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
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
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "output");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "valueType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentExecutionAction fullyQualifiedLinkActionIdentifier](self, "fullyQualifiedLinkActionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentExecutionAction displayableAppBundleIdentifier](self, "displayableAppBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "wf_contentCollectionFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:", v9, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction setOutput:](self, "setOutput:", v14);

  }
  objc_msgSend(v6, "output");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "undoContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppIntentExecutionAction setUndoContext:](self, "setUndoContext:", v16);

  objc_msgSend(v6, "output");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "showOutputAction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = -[WFLinkAction opensWhenRun](self, "opensWhenRun");
    if (-[WFAppIntentExecutionAction runKind](self, "runKind") == 1)
    {
      if (v19)
      {
LABEL_6:
        -[WFLinkAction performPresentationActionWithResult:](self, "performPresentationActionWithResult:", v6);
        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend(v6, "output");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "showOutputActionHint");

      if (v21)
      {
        objc_msgSend(v6, "output");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "showOutputActionHint");

        if (v23 == 1)
          goto LABEL_6;
      }
      else if (v19)
      {
        goto LABEL_6;
      }
    }
  }
  if (v7)
  {
    -[WFAppIntentExecutionAction finishRunningWithError:](self, "finishRunningWithError:", v7);
  }
  else
  {
    -[WFAppIntentExecutionAction metadata](self, "metadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __46__WFLinkAction_finishRunningWithResult_error___block_invoke;
    v25[3] = &unk_1E7AF7B78;
    v25[4] = self;
    -[WFAppIntentExecutionAction showChronoControlIfPossibleForIntent:completionHandler:](self, "showChronoControlIfPossibleForIntent:completionHandler:", v24, v25);

  }
LABEL_12:

}

- (void)showResultIfNeeded:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  void (**v21)(_QWORD);
  _QWORD v22[5];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "output");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "showOutputAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_5;
  if (-[WFLinkAction opensWhenRun](self, "opensWhenRun"))
  {

    goto LABEL_8;
  }
  if (-[WFAppIntentExecutionAction runKind](self, "runKind") != 1)
  {
    objc_msgSend(v6, "output");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "showOutputActionHint");

    if (v11 == 1)
      goto LABEL_9;
  }
  else
  {
LABEL_5:

  }
  if (!-[WFLinkAction showsWhenRun](self, "showsWhenRun"))
  {
LABEL_9:
    v7[2](v7);
    goto LABEL_10;
  }
  -[WFAction userInterface](self, "userInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isRunningWithSiriUI"))
  {
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v6, "output");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dialog");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

  }
  else
  {
    objc_msgSend(v6, "output");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "viewSnippet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_9;
  }
  if (-[WFAppIntentExecutionAction actionIsExecutedFromAnotherDevice](self, "actionIsExecutedFromAnotherDevice"))
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __53__WFLinkAction_showResultIfNeeded_completionHandler___block_invoke;
    v22[3] = &unk_1E7AF5D90;
    v22[4] = self;
    -[WFLinkAction getAlertForLinkResult:handler:completionHandler:](self, "getAlertForLinkResult:handler:completionHandler:", v6, v7, v22);
  }
  else
  {
    -[WFAction userInterface](self, "userInterface");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "output");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dialog");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __53__WFLinkAction_showResultIfNeeded_completionHandler___block_invoke_2;
    v19[3] = &unk_1E7AEFB48;
    v19[4] = self;
    v20 = v6;
    v21 = v7;
    objc_msgSend(v16, "showLinkResult:dialog:completionHandler:", v20, v18, v19);

  }
LABEL_10:

}

- (void)performPresentationActionWithResult:(id)a3
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
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "output");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showOutputAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFAppIntentExecutionAction setDidRunOpensIntent:](self, "setDidRunOpensIntent:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v5, "valueForKey:", CFSTR("url")),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v6))
    {
      -[WFAppIntentExecutionAction connection](self, "connection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAppIntentExecutionAction executorOptions](self, "executorOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "executorForAction:options:delegate:", v5, v8, self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "perform");
    }
    else
    {
      v10 = (void *)objc_opt_new();
      -[WFAppIntentExecutionAction fullyQualifiedLinkActionIdentifier](self, "fullyQualifiedLinkActionIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      objc_msgSend(v10, "actionForBundleIdentifier:andActionIdentifier:error:", v12, v13, &v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v26;

      if (v14)
      {
        os_unfair_lock_lock(&self->_connectionLock);
        v16 = (void *)MEMORY[0x1E0D44188];
        -[WFAppIntentExecutionAction connectionPolicySignals](self, "connectionPolicySignals");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "policyWithActionMetadata:signals:", v14, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = v15;
        objc_msgSend(v18, "connectionWithError:", &v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v25;

        os_unfair_lock_unlock(&self->_connectionLock);
        if (v19)
        {
          objc_msgSend(v5, "parameters");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "actionWithParameters:", v21);
          v22 = objc_claimAutoreleasedReturnValue();

          -[WFAppIntentExecutionAction executorOptions](self, "executorOptions");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "executorForAction:options:delegate:", v22, v23, self);
          v24 = objc_claimAutoreleasedReturnValue();

          -[NSObject perform](v24, "perform");
          v5 = (void *)v22;
        }
        else
        {
          getWFAppIntentsLogObject();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v28 = "-[WFLinkAction performPresentationActionWithResult:]";
            v29 = 2114;
            v30 = v20;
            _os_log_impl(&dword_1C15B3000, v24, OS_LOG_TYPE_ERROR, "%s Failed to initialize LNConnection: %{public}@.", buf, 0x16u);
          }
        }

      }
      else
      {
        -[WFAppIntentExecutionAction finishRunningWithError:](self, "finishRunningWithError:", v15);
        v20 = v15;
      }

    }
  }
}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  objc_msgSend(v5, "dialog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "dialog");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__WFLinkAction_executor_needsValueWithRequest___block_invoke;
    v9[3] = &unk_1E7AF5E80;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v7, "getResultWithCompletionHandler:", v9);

  }
  else
  {
    objc_msgSend(v5, "parameterName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentExecutionAction askForParameterValueForParameterName:request:dialogString:](self, "askForParameterValueForParameterName:request:dialogString:", v8, v5, 0);

  }
}

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  objc_msgSend(v5, "dialog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "dialog");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__WFLinkAction_executor_needsConfirmationWithRequest___block_invoke;
    v9[3] = &unk_1E7AF5E80;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v7, "getResultWithCompletionHandler:", v9);

  }
  else
  {
    objc_msgSend(v5, "parameterName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentExecutionAction confirmParameterValueForParameterName:request:dialogString:](self, "confirmParameterValueForParameterName:request:dialogString:", v8, v5, 0);

  }
}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  objc_msgSend(v5, "dialog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "dialog");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__WFLinkAction_executor_needsDisambiguationWithRequest___block_invoke;
    v9[3] = &unk_1E7AF5E80;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v7, "getResultWithCompletionHandler:", v9);

  }
  else
  {
    objc_msgSend(v5, "parameterName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentExecutionAction disambiguateParameterForParameterName:request:dialogString:](self, "disambiguateParameterForParameterName:request:dialogString:", v8, v5, 0);

  }
}

- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v7 = a4;
  v8 = a5;
  if (v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__WFLinkAction_executor_didCompleteExecutionWithResult_error___block_invoke;
    v9[3] = &unk_1E7AF55D0;
    v9[4] = self;
    v10 = v7;
    v11 = v8;
    -[WFLinkAction showResultIfNeeded:completionHandler:](self, "showResultIfNeeded:completionHandler:", v10, v9);

  }
  else
  {
    -[WFLinkAction finishRunningWithResult:error:](self, "finishRunningWithResult:error:", 0, v8);
  }

}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  -[WFAppIntentExecutionAction appDescriptor](self, "appDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && !self->_isBuiltIn)
  {
    -[WFAppIntentExecutionAction metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemProtocols");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D43E20], "requiresMDMChecksProtocol");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if ((v9 & 1) != 0)
    {
      -[WFAction processedParameters](self, "processedParameters");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __59__WFLinkAction_getContentDestinationWithCompletionHandler___block_invoke;
      v15[3] = &unk_1E7AEFB70;
      v15[4] = self;
      v16 = v4;
      -[WFAppIntentExecutionAction getLinkActionWithProcessedParameters:completionHandler:](self, "getLinkActionWithProcessedParameters:completionHandler:", v10, v15);

    }
    else
    {
      v11 = (void *)MEMORY[0x1E0D13E00];
      -[WFAppIntentExecutionAction displayableAppDescriptor](self, "displayableAppDescriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v11, "locationWithAppDescriptor:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[WFAppIntentExecutionAction appDescriptor](self, "appDescriptor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "locationWithAppDescriptor:", v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      (*((void (**)(id, void *, _QWORD))v4 + 2))(v4, v13, 0);

    }
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

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

- (void)getAlertForLinkResult:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD *v12;
  void (*v13)(_QWORD *, _QWORD *);
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD aBlock[4];
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__WFLinkAction_getAlertForLinkResult_handler_completionHandler___block_invoke;
  aBlock[3] = &unk_1E7AEFB98;
  v11 = v7;
  v22 = v11;
  v12 = _Block_copy(aBlock);
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __64__WFLinkAction_getAlertForLinkResult_handler_completionHandler___block_invoke_3;
  v17[3] = &unk_1E7AEFBC0;
  v18 = v11;
  v19 = v8;
  v20 = v9;
  v13 = (void (*)(_QWORD *, _QWORD *))v12[2];
  v14 = v9;
  v15 = v8;
  v16 = v11;
  v13(v12, v17);

}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v5;

  -[WFLinkAction linkActionWithSerializedParameters](self, "linkActionWithSerializedParameters", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFLinkAction updateParameterSummaryIfNeededWithLinkAction:](self, "updateParameterSummaryIfNeededWithLinkAction:", v5);

}

- (LNActionSummary)actionSummary
{
  return self->_actionSummary;
}

- (void)setActionSummary:(id)a3
{
  objc_storeStrong((id *)&self->_actionSummary, a3);
}

- (WFActionParameterSummary)parameterSummary
{
  return self->_parameterSummary;
}

- (void)setParameterSummary:(id)a3
{
  objc_storeStrong((id *)&self->_parameterSummary, a3);
}

- (NSString)mangledTypeName
{
  return self->_mangledTypeName;
}

- (BOOL)usesCompactUnlockService
{
  return self->_usesCompactUnlockService;
}

- (void)setUsesCompactUnlockService:(BOOL)a3
{
  self->_usesCompactUnlockService = a3;
}

void __64__WFLinkAction_getAlertForLinkResult_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  WFLocalizedString(CFSTR("Action completed successfully."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "output");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dialog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "output");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dialog");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__WFLinkAction_getAlertForLinkResult_handler_completionHandler___block_invoke_2;
    v9[3] = &unk_1E7AF0770;
    v10 = v4;
    v11 = v3;
    objc_msgSend(v8, "getResultWithCompletionHandler:", v9);

  }
  else
  {
    (*((void (**)(id, void *))v3 + 2))(v3, v4);
  }

}

void __64__WFLinkAction_getAlertForLinkResult_handler_completionHandler___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  WFLinkResultDialogRequest *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WFLinkResultDialogRequest *v12;

  v3 = a2;
  v4 = [WFLinkResultDialogRequest alloc];
  v5 = a1[4];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AD0]), "initWithTitle:icon:", 0, 0);
  v12 = -[WFLinkResultDialogRequest initWithSuccessResult:attribution:](v4, "initWithSuccessResult:attribution:", v5, v6);

  objc_msgSend(MEMORY[0x1E0D13DE0], "alertWithPreferredStyle:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMessage:", v3);

  v8 = (void *)MEMORY[0x1E0D13DE8];
  -[WFLinkResultDialogRequest doneButton](v12, "doneButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "buttonWithTitle:style:handler:", v10, 0, a1[5]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addButton:", v11);
  (*(void (**)(void))(a1[6] + 16))();

}

void __64__WFLinkAction_getAlertForLinkResult_handler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "print");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "length");
  v6 = v4;
  if (!v5)
    v6 = *(void **)(a1 + 32);
  v7 = v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __59__WFLinkAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__WFLinkAction_getContentDestinationWithCompletionHandler___block_invoke_248;
    v10[3] = &unk_1E7AF43A8;
    v8 = *(id *)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v8;
    objc_msgSend(v7, "fetchDestinationMDMAccountIdentifierForAction:completionHandler:", v5, v10);

  }
  else
  {
    getWFAppIntentsLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[WFLinkAction getContentDestinationWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_ERROR, "%s Failed to get LNAction for MDM accountIdentifier fetch.", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __59__WFLinkAction_getContentDestinationWithCompletionHandler___block_invoke_248(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  getWFAppIntentsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
    {
      v15 = 136315394;
      v16 = "-[WFLinkAction getContentDestinationWithCompletionHandler:]_block_invoke";
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEBUG, "%s MDM: Setting an account destination with identifier %@.", (uint8_t *)&v15, 0x16u);
    }

    v9 = (void *)MEMORY[0x1E0D13DD8];
    objc_msgSend(*(id *)(a1 + 32), "appDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locationWithAccountIdentifier:appDescriptor:", v5, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (v8)
    {
      v15 = 136315138;
      v16 = "-[WFLinkAction getContentDestinationWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEBUG, "%s LNAction returned a nil accountIdentifier.", (uint8_t *)&v15, 0xCu);
    }

    v12 = (void *)MEMORY[0x1E0D13E00];
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "appDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "locationWithAppDescriptor:", v11);
    v14 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, v14, v6);

    v6 = (id)v14;
  }

}

uint64_t __62__WFLinkAction_executor_didCompleteExecutionWithResult_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithResult:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __56__WFLinkAction_executor_needsDisambiguationWithRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "parameterName");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "captionPrint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disambiguateParameterForParameterName:request:dialogString:", v9, v6, v8);

}

void __54__WFLinkAction_executor_needsConfirmationWithRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "parameterName");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "captionPrint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "confirmParameterValueForParameterName:request:dialogString:", v9, v6, v8);

}

void __47__WFLinkAction_executor_needsValueWithRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "parameterName");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "captionPrint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "askForParameterValueForParameterName:request:dialogString:", v9, v6, v8);

}

void __53__WFLinkAction_showResultIfNeeded_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "userInterface");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentAlert:", v3);

}

uint64_t __53__WFLinkAction_showResultIfNeeded_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
    objc_msgSend(*(id *)(a1 + 32), "performPresentationActionWithResult:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __46__WFLinkAction_finishRunningWithResult_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

id __38__WFLinkAction_generatedResourceNodes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  NSString *v5;
  Class v6;
  id v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_msgSend(v2, "objectForKey:", CFSTR("Class"));
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
  v5 = v4;

  v6 = NSClassFromString(v5);
  if (v6 == (Class)objc_opt_class())
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("Key"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
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
    v7 = v9;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __41__WFLinkAction_setParameterState_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "createStateForParameter:fromSerializedRepresentation:", *(_QWORD *)(a1 + 40), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__WFLinkAction_setParameterState_forKey___block_invoke_2;
  v6[3] = &unk_1E7AF9298;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v4 = *(void **)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __41__WFLinkAction_setParameterState_forKey___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setParameterState:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 56), "attributesDidChange");
}

void __47__WFLinkAction_updateParameterSummaryIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateParameterSummaryIfNeededWithLinkAction:", v5);
    v8 = *(_QWORD *)(a1 + 40);
    v9.receiver = *(id *)(a1 + 32);
    v9.super_class = (Class)WFLinkAction;
    objc_msgSendSuper2(&v9, sel_updateParameterSummaryIfNeeded_, v8);
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 16, MEMORY[0x1E0C9AA70]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __47__WFLinkAction_updateParameterSummaryIfNeeded___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  _QWORD v6[4];
  id v7;

  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__WFLinkAction_updateParameterSummaryIfNeeded___block_invoke_3;
    v6[3] = &unk_1E7AEFAB8;
    v5 = *(void **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v5, "getLinkActionWithProcessedParameters:completionHandler:", a2, v6);

  }
}

uint64_t __47__WFLinkAction_updateParameterSummaryIfNeeded___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__WFLinkAction_runAsynchronouslyWithLinkAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "actionOutput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

    }
    else
    {
      objc_msgSend(v3, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "wf_isRequiresShortcutsJrError");

      if (v10)
      {
        v11 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "finishRunningWithError:", v12);

        v8 = v3;
        goto LABEL_14;
      }
    }
    objc_msgSend(v3, "actionOutput");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = objc_alloc(MEMORY[0x1E0D44258]);
      v15 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "actionOutput");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v14, "initWithAction:output:actionAppContext:predictions:", v15, v16, 0, MEMORY[0x1E0C9AA60]);

    }
    else
    {
      v17 = 0;
    }

    v18 = *(void **)(a1 + 32);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __48__WFLinkAction_runAsynchronouslyWithLinkAction___block_invoke_194;
    v20[3] = &unk_1E7AF55D0;
    v20[4] = v18;
    v21 = v17;
    v22 = v3;
    v8 = v3;
    v19 = v17;
    objc_msgSend(v18, "showResultIfNeeded:completionHandler:", v19, v20);

  }
  else
  {

    getWFWorkflowExecutionLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[WFLinkAction runAsynchronouslyWithLinkAction:]_block_invoke";
      v25 = 2112;
      v26 = (id)objc_opt_class();
      v6 = v26;
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_FAULT, "%s Received unexpected interaction response of type %@", buf, 0x16u);

    }
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishRunningWithError:", v8);
  }
LABEL_14:

}

void __48__WFLinkAction_runAsynchronouslyWithLinkAction___block_invoke_194(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "error");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishRunningWithResult:error:", v2, v3);

}

void __43__WFLinkAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  WFActionWillRunLNActionTestingEvent *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v5 = a2;
  if (v5)
  {
    v6 = -[WFActionWillRunLNActionTestingEvent initWithAction:lnAction:]([WFActionWillRunLNActionTestingEvent alloc], "initWithAction:lnAction:", *(_QWORD *)(a1 + 32), v5);
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__WFLinkAction_runAsynchronouslyWithInput___block_invoke_2;
    v8[3] = &unk_1E7AF5B98;
    v8[4] = v7;
    v9 = v5;
    objc_msgSend(v7, "handleTestingEvent:completionHandler:", v6, v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  }

}

uint64_t __43__WFLinkAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
    return objc_msgSend(v3, "runAsynchronouslyWithLinkAction:", *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(v3, "finishRunningWithError:");
}

id __45__WFLinkAction_localizedKeywordsWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForLocaleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

NSString *__31__WFLinkAction_inputDictionary__block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

void __35__WFLinkAction_wasAddedToWorkflow___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  getWFAppIntentsLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[WFLinkAction wasAddedToWorkflow:]_block_invoke";
    v6 = 2114;
    v7 = v2;
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_ERROR, "%s Failed to preload default parameter states: %{public}@", (uint8_t *)&v4, 0x16u);
  }

}

+ (id)providedActionWithIdentifier:(id)a3 serializedParameters:(id)a4
{
  id v5;
  id v6;
  void *v7;
  WFActionRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  +[WFLinkActionProvider sharedProvider](WFLinkActionProvider, "sharedProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFActionRequest initWithActionIdentifier:serializedParameters:]([WFActionRequest alloc], "initWithActionIdentifier:serializedParameters:", v6, v5);

  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createActionsForRequests:", v9);

  -[WFActionRequest result](v8, "result");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v11;
    else
      v10 = 0;
  }
  v12 = v10;

  return v12;
}

- (void)requestUnlock:(id)a3
{
  id v4;
  WFCompactUnlockService *v5;
  WFCompactUnlockService *v6;
  _QWORD v7[4];
  WFCompactUnlockService *v8;
  id v9;
  objc_super v10;

  v4 = a3;
  if (-[WFLinkAction usesCompactUnlockService](self, "usesCompactUnlockService"))
  {
    v5 = objc_alloc_init(WFCompactUnlockService);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__WFLinkAction_RequestUnlock__requestUnlock___block_invoke;
    v7[3] = &unk_1E7AF6BB0;
    v8 = v5;
    v9 = v4;
    v6 = v5;
    -[WFCompactUnlockService requestUnlockIfNeeded:](v6, "requestUnlockIfNeeded:", v7);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFLinkAction;
    -[WFAction requestUnlock:](&v10, sel_requestUnlock_, v4);
  }

}

void __45__WFLinkAction_RequestUnlock__requestUnlock___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40), 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
}

- (BOOL)canOfferSuggestionsForParameterWithKey:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", a3);
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
  v5 = v4;
  objc_msgSend(v5, "variable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "collectionFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "namedQueryReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = v10 != 0;

  return (char)v8;
}

- (void)fetchSuggestedEntititiesForParameterWithKey:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  -[WFAction parameterForKey:](self, "parameterForKey:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WFAction parameterStateForKey:](self, "parameterStateForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;
    objc_msgSend(v11, "variable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v14 = v13;

    objc_msgSend(v14, "collectionFilter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "namedQueryReference");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __92__WFLinkAction_NamedQueries__fetchSuggestedEntititiesForParameterWithKey_completionHandler___block_invoke;
      v17[3] = &unk_1E7AF6938;
      v19 = v7;
      v18 = v8;
      -[WFAppIntentExecutionAction loadPossibleStatesForEnumeration:searchTerm:optionsProviderReference:completionHandler:](self, "loadPossibleStatesForEnumeration:searchTerm:optionsProviderReference:completionHandler:", v18, 0, v16, v17);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }

  }
  else
  {

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

void __92__WFLinkAction_NamedQueries__fetchSuggestedEntititiesForParameterWithKey_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  if (a2)
  {
    objc_msgSend(a2, "allItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __92__WFLinkAction_NamedQueries__fetchSuggestedEntititiesForParameterWithKey_completionHandler___block_invoke_2;
    v5[3] = &unk_1E7AF6910;
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v3, "if_compactMap:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

id __92__WFLinkAction_NamedQueries__fetchSuggestedEntititiesForParameterWithKey_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a2;
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
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "accessoryImageForPossibleState:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    if (objc_msgSend(v6, "representationType") == 4)
    {
      v9 = objc_alloc(MEMORY[0x1E0DC7DB0]);
      objc_msgSend(v7, "symbolName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc(MEMORY[0x1E0DC7B68]);
      objc_msgSend(MEMORY[0x1E0DC79F8], "clearColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithColor:", v12);
      v14 = (void *)objc_msgSend(v9, "initWithSymbolName:background:", v10, v13);

    }
    else
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7B78]), "initWithImage:", v7);
    }
    v15 = objc_alloc(MEMORY[0x1E0DC7A00]);
    objc_msgSend(v5, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    WFSerializedIdentifierFromLinkValue(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "localizedLabelForPossibleState:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serializedRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v15, "initWithIdentifier:name:entryIcon:accessoryIcon:serializedParameterState:", v18, v19, v14, 0, v20);

  }
  return v8;
}

@end
