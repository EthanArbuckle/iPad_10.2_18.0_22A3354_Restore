@implementation WFAppIntentExecutionAction

- (void)generateStandaloneShortcutRepresentation:(id)a3
{
  void *v4;
  WFStandaloneShortcutRepresentation *v5;
  void (**v6)(id, WFStandaloneShortcutRepresentation *);

  v6 = (void (**)(id, WFStandaloneShortcutRepresentation *))a3;
  -[WFAppIntentExecutionAction associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[WFStandaloneShortcutRepresentation initWithBundleIdentifier:]([WFStandaloneShortcutRepresentation alloc], "initWithBundleIdentifier:", v4);
    v6[2](v6, v5);

  }
  else
  {
    v6[2](v6, 0);
  }

}

- (void)generateShortcutRepresentation:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  WFHandleCustomIntentAction *v8;
  void *v9;
  void *v10;
  WFHandleCustomIntentAction *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = *MEMORY[0x1E0CBDD68];
  v6 = a3;
  -[WFAction identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), v5, v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = [WFHandleCustomIntentAction alloc];
  -[WFAction definition](self, "definition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction serializedParameters](self, "serializedParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WFHandleIntentAction initWithIdentifier:definition:serializedParameters:](v8, "initWithIdentifier:definition:serializedParameters:", v12, v9, v10);

  if (v11)
    -[WFHandleIntentAction generateShortcutRepresentation:](v11, "generateShortcutRepresentation:", v6);
  else
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);

}

- (WFAppIntentExecutionAction)initWithIdentifier:(id)a3 metadata:(id)a4 definition:(id)a5 serializedParameters:(id)a6 appIntentDescriptor:(id)a7 fullyQualifiedActionIdentifier:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  WFAppIntentExecutionAction *v20;
  NSMutableDictionary *v21;
  NSMutableDictionary *dependentParameterIdentifiers;
  NSObject *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *processingParametersQueue;
  WFAppIntentExecutionAction *v27;
  id v29;
  objc_super v30;

  v29 = a4;
  v15 = a7;
  v16 = a8;
  v17 = a5;
  v18 = a3;
  v19 = (void *)objc_msgSend(a6, "mutableCopy");
  v30.receiver = self;
  v30.super_class = (Class)WFAppIntentExecutionAction;
  v20 = -[WFAction initWithIdentifier:definition:serializedParameters:](&v30, sel_initWithIdentifier_definition_serializedParameters_, v18, v17, v19);

  if (v20)
  {
    objc_storeStrong((id *)&v20->_metadata, a4);
    objc_storeStrong((id *)&v20->_appIntentDescriptor, a7);
    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dependentParameterIdentifiers = v20->_dependentParameterIdentifiers;
    v20->_dependentParameterIdentifiers = v21;

    objc_storeStrong((id *)&v20->_fullyQualifiedLinkActionIdentifier, a8);
    v20->_connectionLock._os_unfair_lock_opaque = 0;
    v20->_policyLock._os_unfair_lock_opaque = 0;
    v20->_signalsLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_DEFAULT, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create("com.apple.shortcuts.LinkAction.ProcessingParameterQueue", v24);
    processingParametersQueue = v20->_processingParametersQueue;
    v20->_processingParametersQueue = (OS_dispatch_queue *)v25;

    v27 = v20;
  }

  return v20;
}

- (id)copyWithSerializedParameters:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[WFAction identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction definition](self, "definition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppIntentExecutionAction appIntentDescriptor](self, "appIntentDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppIntentExecutionAction fullyQualifiedLinkActionIdentifier](self, "fullyQualifiedLinkActionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithIdentifier:metadata:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:", v6, v7, v8, v4, v9, v10);

  return v11;
}

- (id)copyForProcessing
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFAppIntentExecutionAction;
  result = -[WFAction copyForProcessing](&v3, sel_copyForProcessing);
  if (result)
    *((_BYTE *)result + 361) = 1;
  return result;
}

- (id)outputDictionary
{
  NSDictionary *outputDictionary;
  NSDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v20;
  void *v21;
  NSDictionary *v22;
  objc_super v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  outputDictionary = self->_outputDictionary;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  if (outputDictionary == v4)
  {
    v5 = 0;
  }
  else if (outputDictionary)
  {
    outputDictionary = outputDictionary;
    v5 = outputDictionary;
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)WFAppIntentExecutionAction;
    -[WFAction outputDictionary](&v23, sel_outputDictionary);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentExecutionAction metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "outputType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_7;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Types"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_7;
    -[WFAppIntentExecutionAction fullyQualifiedLinkActionIdentifier](self, "fullyQualifiedLinkActionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wf_contentItemClassesWithAppBundleIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)objc_msgSend(v5, "mutableCopy");
      v14 = v13;
      if (v13)
        v15 = v13;
      else
        v15 = (id)objc_opt_new();
      v16 = v15;

      v24[0] = CFSTR("Multiple");
      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_opt_class();
      objc_msgSend(v17, "numberWithBool:", objc_opt_isKindOfClass() & 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = CFSTR("Types");
      v25[0] = v18;
      objc_msgSend(v12, "if_compactMap:", &__block_literal_global_52114);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addEntriesFromDictionary:", v20);

      v21 = (void *)objc_msgSend(v16, "copy");
      if (v21)
      {
        v22 = v21;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      }
      outputDictionary = self->_outputDictionary;
      self->_outputDictionary = v22;
      v5 = v21;
    }
    else
    {
LABEL_7:

      outputDictionary = 0;
    }
  }

  return v5;
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
  void *v11;
  objc_super v13;

  v4 = a3;
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "resultValueName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "resultValueName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForLocaleIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFAppIntentExecutionAction;
    -[WFAction localizedDefaultOutputNameWithContext:](&v13, sel_localizedDefaultOutputNameWithContext_, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)getLinkActionWithProcessedParameters:(id)a3 completionHandler:(id)a4
{
  -[WFAppIntentExecutionAction getLinkActionWithProcessedParameters:forFocusConfiguration:completionHandler:](self, "getLinkActionWithProcessedParameters:forFocusConfiguration:completionHandler:", a3, 0, a4);
}

- (void)getLinkActionWithProcessedParameters:(id)a3 forFocusConfiguration:(BOOL)a4 completionHandler:(id)a5
{
  -[WFAppIntentExecutionAction getLinkActionWithProcessedParameters:forFocusConfiguration:fallingBackToDefaultValue:completionHandler:](self, "getLinkActionWithProcessedParameters:forFocusConfiguration:fallingBackToDefaultValue:completionHandler:", a3, a4, 1, a5);
}

- (void)getLinkActionWithProcessedParameters:(id)a3 forFocusConfiguration:(BOOL)a4 fallingBackToDefaultValue:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  BOOL v20;
  BOOL v21;

  v10 = a3;
  v11 = a6;
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "parameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __133__WFAppIntentExecutionAction_getLinkActionWithProcessedParameters_forFocusConfiguration_fallingBackToDefaultValue_completionHandler___block_invoke;
  v18[3] = &unk_1E7AF5CC0;
  v18[4] = self;
  v19 = v10;
  v20 = a5;
  v21 = a4;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __133__WFAppIntentExecutionAction_getLinkActionWithProcessedParameters_forFocusConfiguration_fallingBackToDefaultValue_completionHandler___block_invoke_5;
  v16[3] = &unk_1E7AF8790;
  v16[4] = self;
  v17 = v11;
  v14 = v11;
  v15 = v10;
  objc_msgSend(v13, "if_mapAsynchronously:completionHandler:", v18, v16);

}

- (id)parameterMetadataForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_firstObjectWithValue:forKey:", v4, CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)backingActionIdentifiers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[WFAction identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)entityMetadataForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[WFLinkActionProvider sharedProvider](WFLinkActionProvider, "sharedProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppIntentExecutionAction fullyQualifiedLinkActionIdentifier](self, "fullyQualifiedLinkActionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entityMetadataByAppBundleIdentifier:entityIdentifier:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)externalMetricsBundleIdentifier
{
  return (id)-[LNFullyQualifiedActionIdentifier bundleIdentifier](self->_fullyQualifiedLinkActionIdentifier, "bundleIdentifier");
}

- (id)externalMetricsActionIdentifier
{
  return (id)-[LNFullyQualifiedActionIdentifier actionIdentifier](self->_fullyQualifiedLinkActionIdentifier, "actionIdentifier");
}

- (BOOL)actionIsExecutedFromAnotherDevice
{
  void *v3;
  void *v4;
  char v5;

  -[WFAction userInterface](self, "userInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[WFAction userInterface](self, "userInterface");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "requestedFromAnotherDevice");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)linkActionWithParameters:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  _QWORD aBlock[5];

  v4 = a3;
  os_unfair_lock_lock(&self->_connectionLock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__WFAppIntentExecutionAction_linkActionWithParameters___block_invoke;
  aBlock[3] = &unk_1E7AF94B0;
  aBlock[4] = self;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[WFAppIntentExecutionAction connectionPolicy](self, "connectionPolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithParameters:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5);
  return v7;
}

- (id)displayableAppDescriptor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  char v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[WFAction definition](self, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("LinkActionDisableDisplayedAppDescriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v7 = objc_msgSend(v6, "BOOLValue");
  if ((v7 & 1) != 0)
    return 0;
  -[WFAction definition](self, "definition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("LinkActionDisplayedAppDescriptor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD728]), "initWithSerializedRepresentation:", v10);
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      getWFAppIntentsLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v17 = "-[WFAppIntentExecutionAction displayableAppDescriptor]";
        _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_ERROR, "%s Found a serialized representation for displayedAppDescriptor, but failed to deserialize it.", buf, 0xCu);
      }

    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)WFAppIntentExecutionAction;
    -[WFAction displayableAppDescriptor](&v15, sel_displayableAppDescriptor);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (NSString)displayableAppBundleIdentifier
{
  void *v2;
  void *v3;

  -[WFAppIntentExecutionAction displayableAppDescriptor](self, "displayableAppDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFAppIntentExecutionAction;
  if (!-[WFAction visibleForUse:](&v9, sel_visibleForUse_))
    return 0;
  -[WFAppIntentExecutionAction fullyQualifiedLinkActionIdentifier](self, "fullyQualifiedLinkActionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[WFLinkActionProvider isFullyQualifiedActionIdentifier:withMetadata:visibleForUse:](WFLinkActionProvider, "isFullyQualifiedActionIdentifier:withMetadata:visibleForUse:", v5, v6, a3);

  return v7;
}

- (void)configureParameter:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  int v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFAppIntentExecutionAction;
  -[WFAction configureParameter:](&v15, sel_configureParameter_, v4);
  v5 = v4;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAppIntentExecutionAction parameterMetadataForIdentifier:](self, "parameterMetadataForIdentifier:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v5, "setAction:", self);
        objc_msgSend(v5, "setDataSource:", self);
        objc_msgSend(v5, "setParameterMetadata:", v7);
        objc_msgSend(v7, "valueType");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "wf_parameterDefinitionWithParameterMetadata:dynamicOptionsSupport:", v7, 0);
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
        v13 = v10;

        v14 = objc_msgSend(v13, "isUniqueEntity");
        if (v14)
          objc_msgSend(v5, "setHidden:", 1);
      }
      else
      {
        getWFWorkflowExecutionLogObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v5, "key");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v17 = "-[WFAppIntentExecutionAction configureParameter:]";
          v18 = 2112;
          v19 = v12;
          _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_FAULT, "%s Could not get parameter metadata with key %@", buf, 0x16u);

        }
      }

    }
  }

}

- (BOOL)populatesInputFromInputParameter
{
  return 0;
}

- (BOOL)shouldAskForValuesWhileProcessingParameterStates
{
  return 0;
}

- (void)willBeginProcessingParameterStates
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[WFAppIntentExecutionAction setParameterIdentifiersNeedingValues:](self, "setParameterIdentifiersNeedingValues:", v3);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[WFAction parameters](self, "parameters");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v8, "key");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAction parameterStateForKey:](self, "parameterStateForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "containedVariables");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_type);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "filteredArrayForKey:value:", v12, CFSTR("Ask"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "key");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[WFAction canOfferSuggestionsForParameterWithKey:](self, "canOfferSuggestionsForParameterWithKey:", v14);

        if (objc_msgSend(v13, "count") && !v15)
        {
          objc_msgSend(v8, "key");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFAction setParameterState:forKey:](self, "setParameterState:forKey:", 0, v16);

          -[WFAppIntentExecutionAction parameterIdentifiersNeedingValues](self, "parameterIdentifiersNeedingValues");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "key");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v18);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }

}

- (id)postProcessToolKitProcessedValue:(id)a3 forParameter:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  unint64_t v17;
  id v18;
  void *v19;
  unint64_t v20;
  void *v21;
  id v22;
  int v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD aBlock[4];
  id v36;

  v6 = a3;
  objc_msgSend(a4, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppIntentExecutionAction parameterMetadataForIdentifier:](self, "parameterMetadataForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "valueType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "wf_parameterDefinitionWithParameterMetadata:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v10;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v11, "memberParameterDefinition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 1;
    v14 = v11;
  }
  else
  {
    v13 = 0;
    v14 = 0;
    v12 = v11;
  }

  v15 = v12;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    v18 = v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
  }
  else
  {
    v17 = 0;
    v19 = 0;
  }
  v20 = v19;

  if (v17 | v20)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__WFAppIntentExecutionAction_postProcessToolKitProcessedValue_forParameter___block_invoke;
    aBlock[3] = &unk_1E7AF5CE8;
    v36 = (id)v20;
    v21 = _Block_copy(aBlock);
    v22 = v6;
    v31 = v14;
    if (v22)
    {
      objc_opt_class();
      v23 = objc_opt_isKindOfClass() & 1;
      if (v23)
        v24 = v22;
      else
        v24 = 0;
      v25 = v24;

      if ((v23 & v13) == 1)
      {
        objc_msgSend(v8, "valueType");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "wf_objectValueType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __76__WFAppIntentExecutionAction_postProcessToolKitProcessedValue_forParameter___block_invoke_3;
        v32[3] = &unk_1E7AF5D10;
        v33 = v27;
        v34 = v21;
        v28 = v27;
        objc_msgSend(v25, "if_map:", v32);
        v29 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:
        v14 = v31;
        goto LABEL_24;
      }
    }
    else
    {
      v25 = 0;
    }
    objc_msgSend(v15, "valueType", v31);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, id, id))v21 + 2))(v21, v22, v28);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v22 = v25;
    goto LABEL_23;
  }
  v29 = v6;
LABEL_24:

  return v29;
}

- (void)processEncodedValue:(id)a3 withToolKitInvocation:(id)a4 forParameter:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  objc_super v11;
  _QWORD v12[4];
  WFAppIntentExecutionAction *v13;
  id v14;
  id v15;

  v12[1] = 3221225472;
  v12[2] = __103__WFAppIntentExecutionAction_processEncodedValue_withToolKitInvocation_forParameter_completionHandler___block_invoke;
  v12[3] = &unk_1E7AF5D38;
  v13 = self;
  v14 = a5;
  v15 = a6;
  v11.receiver = v13;
  v11.super_class = (Class)WFAppIntentExecutionAction;
  v12[0] = MEMORY[0x1E0C809B0];
  v9 = v15;
  v10 = v14;
  -[WFAction processEncodedValue:withToolKitInvocation:forParameter:completionHandler:](&v11, sel_processEncodedValue_withToolKitInvocation_forParameter_completionHandler_, a3, a4, v10, v12);

}

- (void)processValueForParameter:(id)a3 withToolKitInvocation:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  objc_super v9;
  _QWORD v10[4];
  WFAppIntentExecutionAction *v11;
  id v12;
  id v13;

  v10[1] = 3221225472;
  v10[2] = __95__WFAppIntentExecutionAction_processValueForParameter_withToolKitInvocation_completionHandler___block_invoke;
  v10[3] = &unk_1E7AF5D38;
  v11 = self;
  v12 = a3;
  v13 = a5;
  v9.receiver = v11;
  v9.super_class = (Class)WFAppIntentExecutionAction;
  v10[0] = MEMORY[0x1E0C809B0];
  v7 = v13;
  v8 = v12;
  -[WFAction processValueForParameter:withToolKitInvocation:completionHandler:](&v9, sel_processValueForParameter_withToolKitInvocation_completionHandler_, v8, a4, v10);

}

- (id)bundleIdentifier
{
  void *v2;
  void *v3;

  -[WFAppIntentExecutionAction appDescriptor](self, "appDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)mightSuppressRunningProgress
{
  return 1;
}

- (id)sessionKitSessionInvocationType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  objc_super v15;

  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemProtocols");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D43E20], "sessionStartingProtocol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v5) & 1) != 0)
    goto LABEL_4;
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemProtocols");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D43E20], "audioStartingProtocol");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "containsObject:", v8) & 1) != 0)
  {

LABEL_4:
    goto LABEL_5;
  }
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "systemProtocols");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D43E20], "audioRecordingProtocol");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "containsObject:", v13);

  if ((v14 & 1) == 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)WFAppIntentExecutionAction;
    -[WFAction sessionKitSessionInvocationType](&v15, sel_sessionKitSessionInvocationType);
    return (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_5:
  v9 = CFSTR("Manual");
  return CFSTR("Manual");
}

- (BOOL)requiresUnlock
{
  void *v3;
  char v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;

  -[WFAction userInterface](self, "userInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRunningWithToolKitClient");

  if ((v4 & 1) != 0)
    goto LABEL_6;
  v5 = -[WFAppIntentExecutionAction authenticationPolicy](self, "authenticationPolicy");
  if (v5 != 1)
  {
    if (-[WFAppIntentExecutionAction authenticationPolicy](self, "authenticationPolicy") == 2)
    {
LABEL_6:
      LOBYTE(v5) = 0;
      return v5;
    }
    -[WFAppIntentExecutionAction metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "authenticationPolicy");

    if (v7 == 2)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      if (!v7)
        goto LABEL_6;
      -[WFAction userInterface](self, "userInterface");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[WFAction userInterface](self, "userInterface");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "requestedFromAnotherDevice");

      }
      else
      {
        v10 = 0;
      }

      -[WFAction userInterface](self, "userInterface");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[WFAction userInterface](self, "userInterface");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "requestedInHomeResident");

      }
      else
      {
        v13 = 0;
      }

      LOBYTE(v5) = (v10 | v13) ^ 1;
    }
  }
  return v5;
}

- (BOOL)isProgressIndeterminate
{
  return 0;
}

- (BOOL)skipExecutingInSiri
{
  return 0;
}

- (void)finishRunningWithError:(id)a3
{
  void *v4;
  LNAppIntentConnectionPolicy *connectionPolicy;
  objc_super v6;

  -[WFAction localizedErrorWithLinkError:](self, "localizedErrorWithLinkError:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  connectionPolicy = self->_connectionPolicy;
  self->_connectionPolicy = 0;

  v6.receiver = self;
  v6.super_class = (Class)WFAppIntentExecutionAction;
  -[WFAction finishRunningWithError:](&v6, sel_finishRunningWithError_, v4);

}

- (LNActionConfigurationContext)actionConfigurationContext
{
  LNActionConfigurationContext *actionConfigurationContext;
  LNActionConfigurationContext *v4;
  LNActionConfigurationContext *v5;

  actionConfigurationContext = self->_actionConfigurationContext;
  if (!actionConfigurationContext)
  {
    v4 = (LNActionConfigurationContext *)objc_opt_new();
    v5 = self->_actionConfigurationContext;
    self->_actionConfigurationContext = v4;

    actionConfigurationContext = self->_actionConfigurationContext;
  }
  return actionConfigurationContext;
}

- (void)showChronoControlIfPossibleForIntent:(id)a3 completionHandler:(id)a4
{
  void *v6;
  void *v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a4;
  objc_msgSend(a3, "associatedControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[WFAction userInterface](self, "userInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentIfPossibleInUserInterface:completionBlock:", v7, v8);

  }
  else
  {
    v8[2](v8, 0);
  }

}

- (Class)toolkitValueClassForParameter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  char v18;
  id v19;
  char v20;
  id v21;
  char v22;
  id v23;
  char v24;
  id v26;
  char v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppIntentExecutionAction parameterMetadataForIdentifier:](self, "parameterMetadataForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wf_parameterDefinitionWithParameterMetadata:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  if (!v9)
  {
    v12 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "memberParameterDefinition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v12 = v9;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v9, "memberParameterDefinition");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "valueType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "wf_objectClass");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v12 = v9;
      goto LABEL_14;
    }
  }
  else
  {

    v12 = 0;
  }
  v17 = v9;
  objc_opt_class();
  v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) != 0)
    goto LABEL_12;
  v19 = v17;
  objc_opt_class();
  v20 = objc_opt_isKindOfClass();

  if ((v20 & 1) != 0)
    goto LABEL_12;
  v21 = v19;
  objc_opt_class();
  v22 = objc_opt_isKindOfClass();

  if ((v22 & 1) != 0
    || (v23 = v21, objc_opt_class(), v24 = objc_opt_isKindOfClass(), v23, (v24 & 1) != 0))
  {
LABEL_12:
    objc_opt_class();
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v26 = v23;
  objc_opt_class();
  v27 = objc_opt_isKindOfClass();

  if ((v27 & 1) == 0)
  {
LABEL_6:
    objc_msgSend(v4, "toolkitValueClass");
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v15 = (id)v16;
    goto LABEL_14;
  }
  v28 = v26;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v29 = v28;
  else
    v29 = 0;
  v30 = v29;

  objc_msgSend(v30, "parameterMetadata");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "valueType");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D43D10], "applicationValueType");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v32, "isEqual:", v33);

  if (v34)
  {
    objc_opt_class();
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v31, "valueType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "wf_enumValueType");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v15 = (id)objc_opt_class();
    }
    else
    {
      objc_msgSend(v31, "valueType");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v37, "objectClass");

    }
  }

LABEL_14:
  return (Class)v15;
}

- (LNActionExecutorOptions)executorOptions
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
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = (void *)objc_opt_new();
  v4 = objc_alloc(MEMORY[0x1E0D441D0]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithLocaleIdentifier:", v6);
  objc_msgSend(v3, "setEnvironment:", v7);

  objc_msgSend(v3, "setClientLabel:", CFSTR("Shortcuts"));
  objc_msgSend(v3, "setSource:", -[WFAppIntentExecutionAction runSource](self, "runSource"));
  objc_msgSend(v3, "setKind:", -[WFAppIntentExecutionAction runKind](self, "runKind"));
  objc_msgSend(v3, "setAllowsPrepareBeforePerform:", 1);
  -[WFAction runningDelegate](self, "runningDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentRunningContextForAction:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "runSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DC8498]))
  {
    -[WFAppIntentExecutionAction linkSystemContext](self, "linkSystemContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0D44260]);
      -[WFAppIntentExecutionAction setLinkSystemContext:](self, "setLinkSystemContext:", v12);

    }
    v13 = objc_alloc(MEMORY[0x1E0D44110]);
    objc_msgSend(v9, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithSessionIdentifier:", v14);
    -[WFAppIntentExecutionAction linkSystemContext](self, "linkSystemContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAssistantContext:", v15);

    -[WFAction toolInvocation](self, "toolInvocation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "options");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setInteractionMode:", objc_msgSend(v18, "lnInteractionMode"));
  }
  -[WFAppIntentExecutionAction linkSystemContext](self, "linkSystemContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[WFAppIntentExecutionAction linkSystemContext](self, "linkSystemContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSystemContext:", v20);

  }
  return (LNActionExecutorOptions *)v3;
}

- (int64_t)runKind
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[WFAction runningDelegate](self, "runningDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[WFAction runningDelegate](self, "runningDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentRunningContextForAction:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "runKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC8438]) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC8430]) & 1) != 0)
  {
    v8 = 1;
  }
  else if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC8420]))
  {
    v8 = 2;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unsigned)runSource
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;
  char IsSpotlight;

  -[WFAction runningDelegate](self, "runningDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 4;
  -[WFAction runningDelegate](self, "runningDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentRunningContextForAction:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "runSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC84B0]) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC8450]) & 1) == 0)
  {
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC8440]) & 1) != 0)
    {
      v8 = 6;
      goto LABEL_5;
    }
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC84A8]))
    {
      v8 = 8;
      goto LABEL_5;
    }
    IsSpotlight = WFRunSourceIsSpotlight();

    if ((IsSpotlight & 1) != 0)
      return 7;
    return 4;
  }
  v8 = 3;
LABEL_5:

  return v8;
}

- (id)valueForParameterData:(id)a3 withParameterState:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAppIntentExecutionAction.m"), 638, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameterMetadata"));

  }
  objc_msgSend(v7, "valueType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "wf_parameterDefinitionWithParameterMetadata:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "linkValueFromParameterState:action:", v8, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)getLinkActionForArchivingFallingBackToDefaultValue:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v6 = a4;
  -[WFAppIntentExecutionAction processingParametersQueue](self, "processingParametersQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __99__WFAppIntentExecutionAction_getLinkActionForArchivingFallingBackToDefaultValue_completionHandler___block_invoke;
  v9[3] = &unk_1E7AF5D68;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[WFAction processParametersWithoutAskingForValuesWithInput:workQueue:fallingBackToDefaultValue:completionHandler:](self, "processParametersWithoutAskingForValuesWithInput:workQueue:fallingBackToDefaultValue:completionHandler:", 0, v7, v4, v9);

}

- (void)getLinkActionForArchivingWithCompletionHandler:(id)a3
{
  -[WFAppIntentExecutionAction getLinkActionForArchivingFallingBackToDefaultValue:completionHandler:](self, "getLinkActionForArchivingFallingBackToDefaultValue:completionHandler:", 1, a3);
}

- (void)getValueForParameterData:(id)a3 ofProcessedParameters:(id)a4 completionHandler:(id)a5
{
  -[WFAppIntentExecutionAction getValueForParameterData:ofProcessedParameters:fallingBackToDefaultValue:completionHandler:](self, "getValueForParameterData:ofProcessedParameters:fallingBackToDefaultValue:completionHandler:", a3, a4, 1, a5);
}

- (void)getValueForParameterData:(id)a3 ofProcessedParameters:(id)a4 fallingBackToDefaultValue:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v7 = a5;
  v22 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAppIntentExecutionAction.m"), 661, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameterMetadata"));

    v13 = 0;
  }
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "valueType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "wf_parameterDefinitionWithParameterMetadata:", v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v22, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction parameterStateForKey:fallingBackToDefaultValue:](self, "parameterStateForKey:fallingBackToDefaultValue:", v18, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction contentPermissionRequestor](self, "contentPermissionRequestor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "getLinkValueFromProcessedParameterValue:parameterState:permissionRequestor:runningFromToolKit:completionHandler:", v15, v19, v20, -[WFAction runningInToolKit](self, "runningInToolKit"), v12);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
  }

}

- (void)confirmParameterValueForParameterName:(id)a3 request:(id)a4 dialogString:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = v8;
  }
  else
  {
    objc_msgSend(v9, "parameterName");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  -[WFAppIntentExecutionAction parameterMetadataForIdentifier:](self, "parameterMetadataForIdentifier:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (-[WFAppIntentExecutionAction actionIsExecutedFromAnotherDevice](self, "actionIsExecutedFromAnotherDevice"))
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __89__WFAppIntentExecutionAction_confirmParameterValueForParameterName_request_dialogString___block_invoke;
      v29[3] = &unk_1E7AF5D90;
      v29[4] = self;
      -[WFAppIntentExecutionAction alertForLinkActionConfirmationWithParameterMetadata:dialogString:request:completionHandler:](self, "alertForLinkActionConfirmationWithParameterMetadata:dialogString:request:completionHandler:", v13, v10, v9, v29);
    }
    else
    {
      objc_msgSend(v9, "value");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "valueType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAppIntentExecutionAction fullyQualifiedLinkActionIdentifier](self, "fullyQualifiedLinkActionIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bundleIdentifier");
      v24 = v12;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAppIntentExecutionAction displayableAppBundleIdentifier](self, "displayableAppBundleIdentifier");
      v19 = v10;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "wf_contentItemFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:", v16, v18, v20, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v19;
      -[WFAction userInterface](self, "userInterface");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dialog");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "viewSnippet");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __89__WFAppIntentExecutionAction_confirmParameterValueForParameterName_request_dialogString___block_invoke_2;
      v27[3] = &unk_1E7AF5DB8;
      v28 = v9;
      objc_msgSend(v21, "showLinkParameterConfirmationWithActionMetadata:dialog:dialogString:viewSnippet:parameterValue:completionHandler:", v13, v22, v19, v23, v26, v27);

      v12 = v24;
    }
  }
  else
  {
    WFLinkActionInvalidMetadataError();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentExecutionAction finishRunningWithError:](self, "finishRunningWithError:", v14);

  }
}

- (void)askForParameterValueForParameterName:(id)a3 request:(id)a4 dialogString:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = v8;
  }
  else
  {
    objc_msgSend(v9, "parameterName");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  -[WFAppIntentExecutionAction parameterMetadataForIdentifier:](self, "parameterMetadataForIdentifier:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[WFAction parameterForKey:](self, "parameterForKey:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction runningDelegate](self, "runningDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "action:canProvideInputForParameter:", self, v14);

    if ((v16 & 1) != 0)
    {
      v32 = v9;
      objc_msgSend(v14, "key");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction parameterStateForKey:](self, "parameterStateForKey:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      -[WFAction processedParameters](self, "processedParameters");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "mutableCopy");

      objc_msgSend(v14, "key");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, v21);

      -[WFAction setProcessedParameters:](self, "setProcessedParameters:", v20);
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithObject:", v14);
      v30 = (void *)v18;
      if (v18)
      {
        objc_msgSend(v14, "key");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v27;
        v39[0] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = (void *)MEMORY[0x1E0C9AA70];
      }
      objc_msgSend(v14, "key");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v28;
      v23 = v10;
      if (!v10)
      {
        objc_msgSend(v14, "localizedPrompt");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v37 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction input](self, "input");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(0, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __88__WFAppIntentExecutionAction_askForParameterValueForParameterName_request_dialogString___block_invoke;
      v33[3] = &unk_1E7AF5E08;
      v33[4] = self;
      v34 = v13;
      v35 = v32;
      -[WFAction askForValuesOfParameters:withDefaultStates:prompts:input:workQueue:completionHandler:](self, "askForValuesOfParameters:withDefaultStates:prompts:input:workQueue:completionHandler:", v29, v31, v24, v25, v26, v33);

      if (!v10)
      if (v30)
      {

      }
      v9 = v32;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAppIntentExecutionAction finishRunningWithError:](self, "finishRunningWithError:", v22);

    }
  }
  else
  {
    WFLinkActionInvalidMetadataError();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentExecutionAction finishRunningWithError:](self, "finishRunningWithError:", v14);
  }

}

- (void)disambiguateParameterForParameterName:(id)a3 request:(id)a4 dialogString:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  WFAppIntentExecutionAction *v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = v8;
  }
  else
  {
    objc_msgSend(v9, "parameterName");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  -[WFAppIntentExecutionAction parameterMetadataForIdentifier:](self, "parameterMetadataForIdentifier:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D13DE0], "alertWithPreferredStyle:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v10;
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(v14, "setTitle:", v10);
    }
    else
    {
      -[WFAction localizedDefaultDisambiguationPrompt](self, "localizedDefaultDisambiguationPrompt");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTitle:", v16);

    }
    objc_msgSend(v9, "providedValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __89__WFAppIntentExecutionAction_disambiguateParameterForParameterName_request_dialogString___block_invoke;
    v32[3] = &unk_1E7AF5E30;
    v33 = v13;
    v34 = self;
    objc_msgSend(v17, "if_compactMap:", v32);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v29[0] = v18;
    v29[1] = 3221225472;
    v29[2] = __89__WFAppIntentExecutionAction_disambiguateParameterForParameterName_request_dialogString___block_invoke_2;
    v29[3] = &unk_1E7AF5E58;
    v30 = v14;
    v20 = v9;
    v31 = v20;
    v21 = v14;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v29);
    v22 = (void *)MEMORY[0x1E0D13DE8];
    v27[0] = v18;
    v27[1] = 3221225472;
    v27[2] = __89__WFAppIntentExecutionAction_disambiguateParameterForParameterName_request_dialogString___block_invoke_4;
    v27[3] = &unk_1E7AF94B0;
    v28 = v20;
    objc_msgSend(v22, "cancelButtonWithHandler:", v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addButton:", v23);

    v24 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v21, "setAssociatedParameterKey:", v24);

    -[WFAction userInterface](self, "userInterface");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "presentAlert:", v21);

    v10 = v26;
  }
  else
  {
    WFLinkActionInvalidMetadataError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentExecutionAction finishRunningWithError:](self, "finishRunningWithError:", v15);

  }
}

- (void)confirmActionWithRequest:(id)a3 dialogString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;

  v6 = a3;
  v7 = a4;
  if (-[WFAppIntentExecutionAction actionIsExecutedFromAnotherDevice](self, "actionIsExecutedFromAnotherDevice"))
  {
    -[WFAppIntentExecutionAction metadata](self, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentExecutionAction alertForLinkActionConfirmationWithActionMetadata:dialogString:request:](self, "alertForLinkActionConfirmationWithActionMetadata:dialogString:request:", v8, v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFAction userInterface](self, "userInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentAlert:", v9);

  }
  else
  {
    -[WFAction userInterface](self, "userInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentExecutionAction metadata](self, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "result");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "output");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v24, "shouldShowPrompt");
    objc_msgSend(v6, "result");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "output");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dialog");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "result");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "output");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "viewSnippet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "result");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "output");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "confirmationActionName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __68__WFAppIntentExecutionAction_confirmActionWithRequest_dialogString___block_invoke;
    v26[3] = &unk_1E7AF5DB8;
    v27 = v6;
    LOBYTE(v19) = 0;
    objc_msgSend(v11, "showLinkActionConfirmationWithActionMetadata:showPrompt:dialog:dialogString:viewSnippet:confirmationActionName:isContinueInAppRequest:completionHandler:", v12, v13, v20, v7, v15, v18, v19, v26);

  }
}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Subclass must override"), CFSTR("Subclasses must override executor:needsValueWithRequest:"));
  __break(1u);
}

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Subclass must override"), CFSTR("Subclasses must override executor:needsConfirmationWithRequest:"));
  __break(1u);
}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Subclass must override"), CFSTR("Subclasses must override executor:needsDisambiguationWithRequest:"));
  __break(1u);
}

- (BOOL)executor:(id)a3 shouldRunShowOutputAction:(id)a4
{
  return 0;
}

- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v5 = a4;
  objc_msgSend(v5, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "output");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dialog");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "result");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "output");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dialog");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__WFAppIntentExecutionAction_executor_needsActionConfirmationWithRequest___block_invoke;
    v12[3] = &unk_1E7AF5E80;
    v12[4] = self;
    v13 = v5;
    objc_msgSend(v11, "getResultWithCompletionHandler:", v12);

  }
  else
  {
    -[WFAppIntentExecutionAction confirmActionWithRequest:dialogString:](self, "confirmActionWithRequest:dialogString:", v5, 0);
  }

}

- (void)executor:(id)a3 environmentForViewSnippetWithCompletion:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a4;
  -[WFAction userInterface](self, "userInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFAction userInterface](self, "userInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getEnvironmentForLinkViewSnippetWithCompletion:", v8);

  }
  else
  {
    v8[2](v8, 0);
  }

}

- (void)executor:(id)a3 preferredContentSizeForViewSnippetWithCompletion:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a4;
  -[WFAction userInterface](self, "userInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFAction userInterface](self, "userInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getPreferredSizeForLinkViewSnippetWithCompletion:", v8);

  }
  else
  {
    v8[2](v8, 0);
  }

}

- (void)executor:(id)a3 needsAppProtectionUnlockWithCompletionHandler:(id)a4
{
  -[WFAction unlockAppProtectionWithCompletionHandler:](self, "unlockAppProtectionWithCompletionHandler:", a4);
}

- (void)executor:(id)a3 needsContinueInAppWithRequest:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  objc_msgSend(v5, "dialog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__WFAppIntentExecutionAction_executor_needsContinueInAppWithRequest___block_invoke;
  v8[3] = &unk_1E7AF5E80;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "getResultWithCompletionHandler:", v8);

}

- (void)executorWillLaunchApplicationInForeground:(id)a3
{
  void *v4;
  id v5;

  -[WFAction userInterface](self, "userInterface", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFAction userInterface](self, "userInterface");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationWillLaunchInForeground");

  }
}

- (BOOL)progressIsPersistentInSystemApertureForExecutor:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[WFAction userInterface](self, "userInterface", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[WFAction userInterface](self, "userInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "progressIsPersistentInSystemAperture");

  return v6;
}

- (void)confirmContinueInAppWithRequest:(id)a3 dialogString:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99E98];
  v8 = a4;
  objc_msgSend(v7, "fileURLWithPath:", CFSTR("/System/Library/Frameworks/AppIntents.framework"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43DF8]), "initWithKey:table:bundleURL:", CFSTR("Continue"), 0, v9);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43DF8]), "initWithKey:table:bundleURL:", CFSTR("Cancel"), 0, v9);
  v12 = objc_alloc(MEMORY[0x1E0D44168]);
  v13 = (void *)objc_msgSend(v12, "initWithType:destructive:acceptLabel:acceptAlternatives:denyLabel:denyAlternatives:", 0, 0, v10, MEMORY[0x1E0C9AA60], v11, MEMORY[0x1E0C9AA60]);
  -[WFAction userInterface](self, "userInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dialog");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __75__WFAppIntentExecutionAction_confirmContinueInAppWithRequest_dialogString___block_invoke;
  v19[3] = &unk_1E7AF5DB8;
  v20 = v6;
  v17 = v6;
  LOBYTE(v18) = 1;
  objc_msgSend(v14, "showLinkActionConfirmationWithActionMetadata:showPrompt:dialog:dialogString:viewSnippet:confirmationActionName:isContinueInAppRequest:completionHandler:", v15, 1, v16, v8, 0, v13, v18, v19);

}

- (LNConnection)connection
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&self->_connectionLock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__WFAppIntentExecutionAction_connection__block_invoke;
  aBlock[3] = &unk_1E7AF94B0;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[WFAppIntentExecutionAction connectionPolicy](self, "connectionPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v4, "connectionWithError:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;

  if (!v5)
  {
    getWFAppIntentsLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[WFAppIntentExecutionAction connection]";
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Failed to initialize LNConnection: %{public}@.", buf, 0x16u);
    }

  }
  v3[2](v3);

  return (LNConnection *)v5;
}

- (LNAppIntentConnectionPolicy)connectionPolicy
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  char v20;
  LNAppIntentConnectionPolicy *connectionPolicy;
  LNConnectionPolicySignals *v22;
  LNConnectionPolicySignals *connectionPolicySignals;
  LNAppIntentConnectionPolicy *v24;
  void *v25;
  void *v26;
  void *v27;
  LNAppIntentConnectionPolicy *v28;
  LNAppIntentConnectionPolicy *v29;
  LNAppIntentConnectionPolicy *v30;
  _QWORD aBlock[5];

  os_unfair_lock_lock(&self->_policyLock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__WFAppIntentExecutionAction_connectionPolicy__block_invoke;
  aBlock[3] = &unk_1E7AF94B0;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectiveBundleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") != 1)
    goto LABEL_23;
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectiveBundleIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  if (v9 != 3)
    goto LABEL_24;
  -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("app"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("app"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;

    objc_msgSend(v12, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = v15;

  -[WFAppIntentExecutionAction connectionPolicySignals](self, "connectionPolicySignals");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "preferredBundleIdentifier");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = v16;
  v5 = v19;
  if (v18 == v19)
  {

  }
  else
  {
    if (v19 && v18)
    {
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if ((v20 & 1) != 0)
        goto LABEL_23;
    }
    else
    {

    }
    connectionPolicy = self->_connectionPolicy;
    self->_connectionPolicy = 0;

    v22 = (LNConnectionPolicySignals *)objc_opt_new();
    connectionPolicySignals = self->_connectionPolicySignals;
    self->_connectionPolicySignals = v22;

    -[LNConnectionPolicySignals setPreferredBundleIdentifier:](self->_connectionPolicySignals, "setPreferredBundleIdentifier:", v5);
  }
LABEL_23:

LABEL_24:
  v24 = self->_connectionPolicy;
  if (!v24)
  {
    v25 = (void *)MEMORY[0x1E0D44188];
    -[WFAppIntentExecutionAction metadata](self, "metadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentExecutionAction connectionPolicySignals](self, "connectionPolicySignals");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "policyWithActionMetadata:signals:", v26, v27);
    v28 = (LNAppIntentConnectionPolicy *)objc_claimAutoreleasedReturnValue();
    v29 = self->_connectionPolicy;
    self->_connectionPolicy = v28;

    v24 = self->_connectionPolicy;
  }
  v30 = v24;
  v3[2](v3);

  return v30;
}

- (LNConnectionPolicySignals)connectionPolicySignals
{
  void (**v3)(_QWORD);
  LNConnectionPolicySignals *connectionPolicySignals;
  LNConnectionPolicySignals *v5;
  LNConnectionPolicySignals *v6;
  void *v7;
  LNConnectionPolicySignals *v8;
  _QWORD aBlock[5];

  os_unfair_lock_lock(&self->_signalsLock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__WFAppIntentExecutionAction_connectionPolicySignals__block_invoke;
  aBlock[3] = &unk_1E7AF94B0;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  connectionPolicySignals = self->_connectionPolicySignals;
  if (!connectionPolicySignals)
  {
    v5 = (LNConnectionPolicySignals *)objc_opt_new();
    v6 = self->_connectionPolicySignals;
    self->_connectionPolicySignals = v5;

    -[WFAppIntentExecutionAction preferredExtensionBundleIdentifier](self, "preferredExtensionBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNConnectionPolicySignals setPreferredBundleIdentifier:](self->_connectionPolicySignals, "setPreferredBundleIdentifier:", v7);

    connectionPolicySignals = self->_connectionPolicySignals;
  }
  v8 = connectionPolicySignals;
  v3[2](v3);

  return v8;
}

- (BOOL)shouldLocalizeValueForSelector:(SEL)a3
{
  return 0;
}

- (id)alertForLinkActionConfirmationWithActionMetadata:(id)a3 dialogString:(id)a4 request:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v33[4];
  id v34;

  v7 = a5;
  v8 = (void *)MEMORY[0x1E0C99DC8];
  v29 = a4;
  v9 = a3;
  objc_msgSend(v8, "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localeIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "result");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "output");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "confirmationActionName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x1E0DC7BC0]);
  objc_msgSend(v7, "result");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "output");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "shouldShowPrompt");
  v31 = v14;
  objc_msgSend(v14, "acceptLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v11;
  objc_msgSend(v18, "localizedStringForLocaleIdentifier:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "denyLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForLocaleIdentifier:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AD0]), "initWithTitle:icon:", 0, 0);
  LOBYTE(v27) = 0;
  v23 = (void *)objc_msgSend(v15, "initWithActionMetadata:showPrompt:dialogString:viewSnippet:yesText:noText:attribution:parameterInfo:isContinueInAppRequest:", v9, v17, v29, 0, v19, v21, v22, 0, v27);

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __100__WFAppIntentExecutionAction_alertForLinkActionConfirmationWithActionMetadata_dialogString_request___block_invoke;
  v33[3] = &unk_1E7AF5EA8;
  v34 = v7;
  v24 = v7;
  -[WFAppIntentExecutionAction alertForLinkConfirmationDialogRequest:preferredStyle:handler:](self, "alertForLinkConfirmationDialogRequest:preferredStyle:handler:", v23, 0, v33);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)alertForLinkActionConfirmationWithParameterMetadata:(id)a3 dialogString:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  WFAppIntentExecutionAction *v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __121__WFAppIntentExecutionAction_alertForLinkActionConfirmationWithParameterMetadata_dialogString_request_completionHandler___block_invoke;
  block[3] = &unk_1E7AF5EF8;
  v19 = v12;
  v20 = self;
  v21 = v10;
  v22 = v11;
  v23 = v13;
  v14 = v13;
  v15 = v11;
  v16 = v10;
  v17 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (id)alertForLinkConfirmationDialogRequest:(id)a3 preferredStyle:(int64_t)a4 handler:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;

  v7 = a5;
  v8 = (void *)MEMORY[0x1E0D13DE0];
  v9 = a3;
  objc_msgSend(v8, "alertWithPreferredStyle:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v11);

  v12 = (void *)MEMORY[0x1E0D13DE8];
  objc_msgSend(v9, "yesButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __91__WFAppIntentExecutionAction_alertForLinkConfirmationDialogRequest_preferredStyle_handler___block_invoke;
  v29[3] = &unk_1E7AF8F48;
  v16 = v7;
  v30 = v16;
  objc_msgSend(v12, "buttonWithTitle:style:handler:", v14, 0, v29);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D13DE8];
  objc_msgSend(v9, "noButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "title");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v15;
  v25 = 3221225472;
  v26 = __91__WFAppIntentExecutionAction_alertForLinkConfirmationDialogRequest_preferredStyle_handler___block_invoke_2;
  v27 = &unk_1E7AF8F48;
  v28 = v16;
  v21 = v16;
  objc_msgSend(v18, "buttonWithTitle:style:handler:", v20, 1, &v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addButton:", v17, v24, v25, v26, v27);
  objc_msgSend(v10, "addButton:", v22);

  return v10;
}

- (BOOL)shouldStripSensitiveContentFromParameterSerialization
{
  return 0;
}

- (id)parametersNeedingDisplayRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__WFAppIntentExecutionAction_parametersNeedingDisplayRepresentation__block_invoke;
  v7[3] = &unk_1E7AF5F48;
  v7[4] = self;
  objc_msgSend(v4, "if_objectsPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)fetchMissingDisplayRepresentationValuesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  WFAppIntentExecutionAction *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id obj;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  WFAppIntentExecutionAction *v58;
  id v59;
  _QWORD v60[4];
  id v61;
  WFAppIntentExecutionAction *v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  void *v73;
  void *v74;
  _BYTE v75[128];
  void *v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFAppIntentExecutionAction parametersNeedingDisplayRepresentation](self, "parametersNeedingDisplayRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v43 = v4;
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "valueForKey:", CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentExecutionAction setFetchingDisplayRepresentationParameterKeys:](self, "setFetchingDisplayRepresentationParameterKeys:", v8);

    v55 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v54 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    obj = v5;
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    if (v47)
    {
      v45 = *(_QWORD *)v70;
      v46 = v5;
      v9 = 0x1E0C99000uLL;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v70 != v45)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v10);
          objc_msgSend(v11, "typeSpecificMetadata");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", CFSTR("LNValueTypeSpecificMetadataKeyLinkEntityMetadata"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          v51 = v11;
          objc_msgSend(v11, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFAction parameterStateForKey:fallingBackToDefaultValue:](self, "parameterStateForKey:fallingBackToDefaultValue:", v13, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          v48 = v14;
          v49 = v10;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v14, "parameterStates");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "if_compactMap:", &__block_literal_global_246_51994);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v76 = v14;
              objc_msgSend(*(id *)(v9 + 3360), "arrayWithObjects:count:", &v76, 1);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v16 = 0;
            }
          }
          v67 = 0u;
          v68 = 0u;
          v66 = 0u;
          v65 = 0u;
          v50 = v16;
          v17 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
          if (v17)
          {
            v18 = v17;
            v53 = *(_QWORD *)v66;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v66 != v53)
                  objc_enumerationMutation(v50);
                objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "value");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "value");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                WFSerializedIdentifierFromLinkValue(v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (v22)
                {
                  v23 = objc_alloc(MEMORY[0x1E0D43C80]);
                  objc_msgSend(v52, "identifier");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = (void *)objc_msgSend(v23, "initWithTypeIdentifier:instanceIdentifier:", v24, v22);

                  -[WFAppIntentExecutionAction connection](self, "connection");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "bundleIdentifier");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "mangledTypeNameForBundleIdentifier:", v27);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v55, "objectForKey:", v28);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v30 = (void *)objc_msgSend(v29, "mutableCopy");
                    objc_msgSend(v30, "addObject:", v25);
                    v31 = (void *)objc_msgSend(v30, "copy");

                    v9 = 0x1E0C99000;
                  }
                  else
                  {

                    v74 = v25;
                    objc_msgSend(*(id *)(v9 + 3360), "arrayWithObjects:count:", &v74, 1);
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  v32 = self;
                  objc_msgSend(v55, "setObject:forKey:", v31, v28);
                  objc_msgSend(v54, "objectForKey:", v25);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v34 = (void *)objc_msgSend(v33, "mutableCopy");
                    objc_msgSend(v51, "name");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "addObject:", v35);

                    v36 = (void *)objc_msgSend(v34, "copy");
                  }
                  else
                  {

                    objc_msgSend(v51, "name");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v73 = v34;
                    objc_msgSend(*(id *)(v9 + 3360), "arrayWithObjects:count:", &v73, 1);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                  }

                  objc_msgSend(v54, "setObject:forKey:", v36, v25);
                  self = v32;
                  v9 = 0x1E0C99000;
                }

              }
              v18 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
            }
            while (v18);
          }

          v10 = v49 + 1;
          v5 = v46;
        }
        while (v49 + 1 != v47);
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
      }
      while (v47);
    }

    v37 = (void *)objc_opt_new();
    objc_msgSend(v55, "allKeys");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = MEMORY[0x1E0C809B0];
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_2;
    v60[3] = &unk_1E7AF6050;
    v61 = v55;
    v62 = self;
    v63 = v54;
    v64 = v37;
    v56[0] = v39;
    v56[1] = 3221225472;
    v56[2] = __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_3_263;
    v56[3] = &unk_1E7AF8350;
    v58 = self;
    v59 = v43;
    v57 = v64;
    v40 = v55;
    v41 = v54;
    v42 = v64;
    objc_msgSend(v38, "if_enumerateAsynchronouslyInSequence:completionHandler:", v60, v56);

    v4 = v43;
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, MEMORY[0x1E0C9AA70], 0);
  }

}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__WFAppIntentExecutionAction_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v12[3] = &unk_1E7AF6078;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[WFAppIntentExecutionAction loadDynamicResultForEnumeration:searchTerm:completionHandler:](self, "loadDynamicResultForEnumeration:searchTerm:completionHandler:", v11, a4, v12);

}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 optionsProviderReference:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  WFAppIntentExecutionAction *v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __117__WFAppIntentExecutionAction_loadPossibleStatesForEnumeration_searchTerm_optionsProviderReference_completionHandler___block_invoke;
  v16[3] = &unk_1E7AF60A0;
  v17 = v10;
  v18 = v11;
  v19 = self;
  v20 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[WFAppIntentExecutionAction loadDynamicResultForEnumeration:searchTerm:optionsProviderReference:completionHandler:](self, "loadDynamicResultForEnumeration:searchTerm:optionsProviderReference:completionHandler:", v15, v14, a5, v16);

}

- (void)loadDynamicResultForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  -[WFAppIntentExecutionAction loadDynamicResultForEnumeration:searchTerm:optionsProviderReference:completionHandler:](self, "loadDynamicResultForEnumeration:searchTerm:optionsProviderReference:completionHandler:", a3, a4, 0, a5);
}

- (void)loadDynamicResultForEnumeration:(id)a3 searchTerm:(id)a4 optionsProviderReference:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __116__WFAppIntentExecutionAction_loadDynamicResultForEnumeration_searchTerm_optionsProviderReference_completionHandler___block_invoke;
  v18[3] = &unk_1E7AF60C8;
  v21 = v11;
  v22 = v13;
  v18[4] = self;
  v19 = v10;
  v20 = v12;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  v17 = v13;
  -[WFAppIntentExecutionAction getLinkActionForArchivingWithCompletionHandler:](self, "getLinkActionForArchivingWithCompletionHandler:", v18);

}

- (void)completeLoadingPossibleStatesForEnumerationParameter:(id)a3 result:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  void (**v30)(id, _QWORD, void *);
  char v31;
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  if (!v11)
  {
    -[WFAction localizedErrorWithLinkError:](self, "localizedErrorWithLinkError:", v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v25);
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v11, "dependentParameterIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppIntentExecutionAction dependentParameterIdentifiers](self, "dependentParameterIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "key");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

  getWFAppIntentsLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "key");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v35 = "-[WFAppIntentExecutionAction completeLoadingPossibleStatesForEnumerationParameter:result:error:completionHandler:]";
    v36 = 2112;
    v37 = v18;
    v38 = 2112;
    v39 = v11;
    _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_DEFAULT, "%s Completing loading possible states for parameter: %@ with result: %@.", buf, 0x20u);

  }
  v19 = objc_msgSend(v11, "usesIndexedCollation");
  objc_msgSend(v11, "promptLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForLocaleIdentifier:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLocalizedPrompt:", v21);

  objc_msgSend(v11, "sections");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    getWFAppIntentsLogObject();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[WFAppIntentExecutionAction completeLoadingPossibleStatesForEnumerationParameter:result:error:completionHandler:]";
      _os_log_impl(&dword_1C15B3000, v26, OS_LOG_TYPE_ERROR, "%s Result collection does not contain any sections.", buf, 0xCu);
    }

    v27 = objc_alloc(MEMORY[0x1E0CBDA10]);
    v25 = (void *)objc_msgSend(v27, "initWithItems:", MEMORY[0x1E0C9AA60]);
    ((void (**)(id, void *, void *))v13)[2](v13, v25, 0);
    goto LABEL_10;
  }
  objc_msgSend(v11, "sections");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __114__WFAppIntentExecutionAction_completeLoadingPossibleStatesForEnumerationParameter_result_error_completionHandler___block_invoke;
  v32[3] = &unk_1E7AF6168;
  v32[4] = self;
  v33 = v10;
  v28[0] = v24;
  v28[1] = 3221225472;
  v28[2] = __114__WFAppIntentExecutionAction_completeLoadingPossibleStatesForEnumerationParameter_result_error_completionHandler___block_invoke_3;
  v28[3] = &unk_1E7AF6190;
  v31 = v19;
  v29 = v33;
  v30 = v13;
  objc_msgSend(v23, "if_mapAsynchronously:completionHandler:", v32, v28);

LABEL_11:
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v5;
  void *v6;
  _QWORD v8[5];

  v5 = a4;
  if (objc_msgSend(v5, "valueNeedsDisplayRepresentation"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__WFAppIntentExecutionAction_enumeration_localizedLabelForPossibleState___block_invoke;
    v8[3] = &unk_1E7AF61E0;
    v8[4] = self;
    -[WFAppIntentExecutionAction fetchMissingDisplayRepresentationValuesWithCompletionHandler:](self, "fetchMissingDisplayRepresentationValuesWithCompletionHandler:", v8);
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "localizedTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)enumerationShouldAlwaysReloadPossibleStates:(id)a3
{
  return 1;
}

- (id)enumeration:(id)a3 localizedSubtitleLabelForPossibleState:(id)a4
{
  return (id)objc_msgSend(a4, "localizedSubtitle", a3);
}

- (id)enumeration:(id)a3 accessoryImageForPossibleState:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)enumeration:(id)a3 shouldStripSenstitiveContentFromValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v7, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WFAppIntentExecutionAction valueShouldStripSensitiveContent:](self, "valueShouldStripSensitiveContent:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)valueShouldStripSensitiveContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  char v11;
  void *v13;
  void *v14;
  id v15;
  char v16;
  id v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v4 = a3;
  if (-[WFAppIntentExecutionAction shouldStripSensitiveContentFromParameterSerialization](self, "shouldStripSensitiveContentFromParameterSerialization")&& (objc_msgSend(v4, "valueType"), v5 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "wf_entityValueType"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v5, v6))
  {
    objc_msgSend(v4, "valueType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 0;
      objc_msgSend(v4, "value");
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
      v17 = v10;

      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __63__WFAppIntentExecutionAction_valueShouldStripSensitiveContent___block_invoke;
      v18[3] = &unk_1E7AF6208;
      v18[4] = &v19;
      objc_msgSend(v17, "enumerateObjectsUsingBlock:", v18);

      v11 = *((_BYTE *)v20 + 24) != 0;
      _Block_object_dispose(&v19, 8);
    }
    else
    {
      objc_msgSend(v4, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
      }
      else
      {
        v14 = 0;
      }
      v15 = v14;

      v16 = objc_msgSend(v15, "isTransient");
      v11 = v16 ^ 1;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)createStateForParameter:(id)a3 fromSerializedRepresentation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;
  objc_msgSend(v9, "setDataSource:", self);

  v12.receiver = self;
  v12.super_class = (Class)WFAppIntentExecutionAction;
  -[WFAction createStateForParameter:fromSerializedRepresentation:](&v12, sel_createStateForParameter_fromSerializedRepresentation_, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)shouldLoadDefaultStateAsynchronouslyForEnumeration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v12;

  objc_msgSend(a3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppIntentExecutionAction parameterMetadataForIdentifier:](self, "parameterMetadataForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wf_parameterDefinitionWithParameterMetadata:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "typeSpecificMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D43AE0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "linkValueWithValue:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (objc_msgSend(v5, "capabilities") & 1) == 0 || v10 == 0;
  return v12;
}

- (id)defaultSerializedRepresentationForEnumeration:(id)a3
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

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppIntentExecutionAction parameterMetadataForIdentifier:](self, "parameterMetadataForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wf_parameterDefinitionWithParameterMetadata:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "typeSpecificMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D43AE0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "linkValueWithValue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D441A8]), "initWithValue:indentationLevel:", v11, 0);
  -[WFAppIntentExecutionAction defaultSerializedRepresentationForEnumeration:result:](self, "defaultSerializedRepresentationForEnumeration:result:", v4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __98__WFAppIntentExecutionAction_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke;
  v10[3] = &unk_1E7AF6230;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[WFAppIntentExecutionAction loadDefaultResultForEnumeration:completionHandler:](self, "loadDefaultResultForEnumeration:completionHandler:", v8, v10);

}

- (void)loadDefaultResultForEnumeration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (-[WFAppIntentExecutionAction shouldSkipLoadingDefaultValue](self, "shouldSkipLoadingDefaultValue")
    || -[WFAction isRunning](self, "isRunning"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80__WFAppIntentExecutionAction_loadDefaultResultForEnumeration_completionHandler___block_invoke;
    v8[3] = &unk_1E7AF6280;
    v10 = v7;
    v8[4] = self;
    v9 = v6;
    -[WFAppIntentExecutionAction getLinkActionForArchivingWithCompletionHandler:](self, "getLinkActionForArchivingWithCompletionHandler:", v8);

  }
}

- (id)defaultSerializedRepresentationForEnumeration:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(v8, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v12, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
      }
      else
      {
        v15 = 0;
      }
      v19 = v15;

      v20 = (void *)MEMORY[0x1E0C9AA60];
      if (v19)
        v20 = v19;
      v21 = v20;

      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __83__WFAppIntentExecutionAction_defaultSerializedRepresentationForEnumeration_result___block_invoke;
      v23[3] = &unk_1E7AF62A8;
      v24 = v6;
      objc_msgSend(v21, "if_map:", v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v8, "setContainsSensitiveContent:", -[WFAppIntentExecutionAction valueShouldStripSensitiveContent:](self, "valueShouldStripSensitiveContent:", v12));

      objc_msgSend((id)objc_msgSend(v6, "singleStateClass"), "serializedRepresentationFromValue:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v6;
      else
        v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    v18 = v16;
    objc_msgSend(v18, "serializedDefaultParameterOption");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v18, "serializedDefaultParameterOption");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v17;
}

- (LNFullyQualifiedActionIdentifier)fullyQualifiedLinkActionIdentifier
{
  return self->_fullyQualifiedLinkActionIdentifier;
}

- (OS_dispatch_queue)processingParametersQueue
{
  return self->_processingParametersQueue;
}

- (LNActionMetadata)metadata
{
  return self->_metadata;
}

- (INAppIntentDescriptor)appIntentDescriptor
{
  return self->_appIntentDescriptor;
}

- (NSSet)fetchingDisplayRepresentationParameterKeys
{
  return self->_fetchingDisplayRepresentationParameterKeys;
}

- (void)setFetchingDisplayRepresentationParameterKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSMutableDictionary)dependentParameterIdentifiers
{
  return self->_dependentParameterIdentifiers;
}

- (LNSystemContext)linkSystemContext
{
  return self->_linkSystemContext;
}

- (void)setLinkSystemContext:(id)a3
{
  objc_storeStrong((id *)&self->_linkSystemContext, a3);
}

- (NSString)preferredExtensionBundleIdentifier
{
  return self->_preferredExtensionBundleIdentifier;
}

- (void)setPreferredExtensionBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (int64_t)authenticationPolicy
{
  return self->_authenticationPolicy;
}

- (void)setAuthenticationPolicy:(int64_t)a3
{
  self->_authenticationPolicy = a3;
}

- (BOOL)didRunOpensIntent
{
  return self->_didRunOpensIntent;
}

- (void)setDidRunOpensIntent:(BOOL)a3
{
  self->_didRunOpensIntent = a3;
}

- (BOOL)shouldSkipLoadingDefaultValue
{
  return self->_shouldSkipLoadingDefaultValue;
}

- (LNUndoContext)undoContext
{
  return self->_undoContext;
}

- (void)setUndoContext:(id)a3
{
  objc_storeStrong((id *)&self->_undoContext, a3);
}

- (NSMutableDictionary)parameterIdentifiersNeedingValues
{
  return self->_parameterIdentifiersNeedingValues;
}

- (void)setParameterIdentifiersNeedingValues:(id)a3
{
  objc_storeStrong((id *)&self->_parameterIdentifiersNeedingValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterIdentifiersNeedingValues, 0);
  objc_storeStrong((id *)&self->_undoContext, 0);
  objc_storeStrong((id *)&self->_preferredExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_linkSystemContext, 0);
  objc_storeStrong((id *)&self->_dependentParameterIdentifiers, 0);
  objc_storeStrong((id *)&self->_fetchingDisplayRepresentationParameterKeys, 0);
  objc_storeStrong((id *)&self->_appIntentDescriptor, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_processingParametersQueue, 0);
  objc_storeStrong((id *)&self->_fullyQualifiedLinkActionIdentifier, 0);
  objc_storeStrong((id *)&self->_actionConfigurationContext, 0);
  objc_storeStrong((id *)&self->_connectionPolicySignals, 0);
  objc_storeStrong((id *)&self->_connectionPolicy, 0);
  objc_storeStrong((id *)&self->_outputDictionary, 0);
}

id __83__WFAppIntentExecutionAction_defaultSerializedRepresentationForEnumeration_result___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_msgSend(v2, "singleStateClass");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D441A8]), "initWithValue:indentationLevel:", v3, 0);

  objc_msgSend(v4, "serializedRepresentationFromValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __80__WFAppIntentExecutionAction_loadDefaultResultForEnumeration_completionHandler___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  if (!v5)
  {
    v6 = (void (**)(id, _QWORD, void *))a1[6];
    objc_msgSend(a1[4], "localizedErrorWithLinkError:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v7);

  }
  objc_msgSend(a1[4], "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__WFAppIntentExecutionAction_loadDefaultResultForEnumeration_completionHandler___block_invoke_2;
  v11[3] = &unk_1E7AF6258;
  v12 = a1[6];
  objc_msgSend(v8, "fetchDefaultValueForAction:actionMetadata:parameterIdentifier:completionHandler:", v5, v9, v10, v11);

}

uint64_t __80__WFAppIntentExecutionAction_loadDefaultResultForEnumeration_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __98__WFAppIntentExecutionAction_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v5 = a1[5];
  v4 = a1[6];
  v6 = (void *)a1[4];
  v7 = a3;
  objc_msgSend(v6, "defaultSerializedRepresentationForEnumeration:result:", v5, a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v8, v7);

}

void __63__WFAppIntentExecutionAction_valueShouldStripSensitiveContent___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;
  char v9;

  objc_msgSend(a2, "value");
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

  v9 = objc_msgSend(v8, "isTransient");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v9 ^ 1;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void __73__WFAppIntentExecutionAction_enumeration_localizedLabelForPossibleState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  getWFActionsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v15 = "-[WFAppIntentExecutionAction enumeration:localizedLabelForPossibleState:]_block_invoke";
    v16 = 2114;
    v17 = v8;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Fetched missing display representations for parameters: %{public}@, error: %@", buf, 0x20u);

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__WFAppIntentExecutionAction_enumeration_localizedLabelForPossibleState___block_invoke_274;
  v11[3] = &unk_1E7AF92C0;
  v9 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v9;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

uint64_t __73__WFAppIntentExecutionAction_enumeration_localizedLabelForPossibleState___block_invoke_274(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__WFAppIntentExecutionAction_enumeration_localizedLabelForPossibleState___block_invoke_2;
  v3[3] = &unk_1E7AF61B8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __73__WFAppIntentExecutionAction_enumeration_localizedLabelForPossibleState___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a3;
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = 0;
  else
    v6 = v7;
  objc_msgSend(*(id *)(a1 + 32), "setParameterState:forKey:", v6, v5);

}

void __114__WFAppIntentExecutionAction_completeLoadingPossibleStatesForEnumerationParameter_result_error_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD aBlock[4];
  id v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __114__WFAppIntentExecutionAction_completeLoadingPossibleStatesForEnumerationParameter_result_error_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E7AF60F0;
  v9 = v6;
  v22 = v9;
  v10 = _Block_copy(aBlock);
  objc_msgSend(v9, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "options");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __114__WFAppIntentExecutionAction_completeLoadingPossibleStatesForEnumerationParameter_result_error_completionHandler___block_invoke_270;
    v19[3] = &unk_1E7AF6118;
    v13 = *(void **)(a1 + 40);
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v13;
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __114__WFAppIntentExecutionAction_completeLoadingPossibleStatesForEnumerationParameter_result_error_completionHandler___block_invoke_2_272;
    v16[3] = &unk_1E7AF6140;
    v17 = v10;
    v18 = v7;
    objc_msgSend(v12, "if_mapAsynchronously:completionHandler:", v19, v16);

  }
  else
  {
    (*((void (**)(void *, _QWORD))v10 + 2))(v10, MEMORY[0x1E0C9AA60]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    getWFAppIntentsLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[WFAppIntentExecutionAction completeLoadingPossibleStatesForEnumerationParameter:result:error:completionHan"
            "dler:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_ERROR, "%s Result collection section does not contain any items.", buf, 0xCu);
    }

    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v14, 0);
  }

}

void __114__WFAppIntentExecutionAction_completeLoadingPossibleStatesForEnumerationParameter_result_error_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CBDA10];
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithSections:", v7);

  objc_msgSend(v8, "setUsesIndexedCollation:", *(unsigned __int8 *)(a1 + 48));
  getWFAppIntentsLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[WFAppIntentExecutionAction completeLoadingPossibleStatesForEnumerationParameter:result:error:completionHandl"
          "er:]_block_invoke_3";
    v13 = 2112;
    v14 = v10;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEFAULT, "%s Completed loading possible states for parameter: %@ with result: %@.", (uint8_t *)&v11, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __114__WFAppIntentExecutionAction_completeLoadingPossibleStatesForEnumerationParameter_result_error_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x1E0CBDA20];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wf_localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wf_localizedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v5, "initWithTitle:subtitle:image:items:", v7, v9, v11, v4);

  return v12;
}

void __114__WFAppIntentExecutionAction_completeLoadingPossibleStatesForEnumerationParameter_result_error_completionHandler___block_invoke_270(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v6;
  void (**v7)(id, void *, _QWORD);
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  v8 = a2;
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContainsSensitiveContent:", objc_msgSend(v6, "valueShouldStripSensitiveContent:", v9));

  v10 = objc_alloc((Class)objc_msgSend(*(id *)(a1 + 40), "singleStateClass"));
  objc_msgSend(v8, "title");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "wf_localizedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "wf_localizedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "wf_image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v10, "initWithValue:localizedTitle:localizedSubtitle:image:", v8, v11, v13, v15);

  v7[2](v7, v16, 0);
}

void __114__WFAppIntentExecutionAction_completeLoadingPossibleStatesForEnumerationParameter_result_error_completionHandler___block_invoke_2_272(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __116__WFAppIntentExecutionAction_loadDynamicResultForEnumeration_searchTerm_optionsProviderReference_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v5 = a3;
  if (!v18)
  {
    v6 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "localizedErrorWithLinkError:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(id *)(a1 + 40);
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  objc_msgSend(v12, "parameterMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localeIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchOptionsForAction:actionMetadata:parameterMetadata:optionsProviderReference:searchTerm:localeIdentifier:completionHandler:", v18, v9, v13, v14, v15, v17, *(_QWORD *)(a1 + 64));

}

void __117__WFAppIntentExecutionAction_loadPossibleStatesForEnumeration_searchTerm_optionsProviderReference_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  getWFAppIntentsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v10 = 136315650;
    v11 = "-[WFAppIntentExecutionAction loadPossibleStatesForEnumeration:searchTerm:optionsProviderReference:completionHa"
          "ndler:]_block_invoke";
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Loading possible states for parameter: %@, search term: %@.", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 48), "completeLoadingPossibleStatesForEnumerationParameter:result:error:completionHandler:", *(_QWORD *)(a1 + 32), v6, v5, *(_QWORD *)(a1 + 56));

}

uint64_t __92__WFAppIntentExecutionAction_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeLoadingPossibleStatesForEnumerationParameter:result:error:completionHandler:", *(_QWORD *)(a1 + 40), a2, a3, *(_QWORD *)(a1 + 48));
}

void __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_2(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v6 = a2;
  v7 = a4;
  objc_msgSend(a1[4], "objectForKey:", v6);
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
  v10 = v9;

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D44218]), "initWithIdentifiers:entityMangledTypeName:", v10, v6);
  objc_msgSend(a1[5], "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_3;
  v18[3] = &unk_1E7AF6028;
  v19 = v10;
  v20 = v6;
  v24 = v7;
  v21 = a1[6];
  v13 = a1[7];
  v14 = a1[5];
  v22 = v13;
  v23 = v14;
  v15 = v7;
  v16 = v6;
  v17 = v10;
  objc_msgSend(v12, "performQuery:completionHandler:", v11, v18);

}

uint64_t __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_3_263(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "setFetchingDisplayRepresentationParameterKeys:", 0);
}

void __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  id obj;
  NSObject *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD v83[6];
  _QWORD v84[4];
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[4];
  id v95;
  id v96;
  _BYTE v97[128];
  uint8_t v98[128];
  uint8_t buf[4];
  const char *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  uint64_t v104;
  __int16 v105;
  id v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v71 = v4;
  if (v4 || !v5)
  {
    v70 = v5;
    if (v4)
    {
      objc_msgSend(v4, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
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
      v16 = v13;

      v69 = v16;
      if (objc_msgSend(v16, "count"))
      {
        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
        obj = v16;
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
        v18 = a1;
        if (v17)
        {
          v19 = v17;
          v20 = *(_QWORD *)v91;
          v72 = *(_QWORD *)v91;
          do
          {
            v21 = 0;
            v73 = v19;
            do
            {
              if (*(_QWORD *)v91 != v20)
                objc_enumerationMutation(obj);
              v22 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v21);
              objc_msgSend(v22, "valueType");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0)
              {
                objc_msgSend(v22, "value");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (v25)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    v26 = v25;
                  else
                    v26 = 0;
                }
                else
                {
                  v26 = 0;
                }
                v27 = v26;

                -[NSObject identifier](v27, "identifier");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                if (v29)
                {
                  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v75 = v27;
                  v76 = v21;
                  v78 = v29;
                  if (v30)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      v31 = v30;
                    else
                      v31 = 0;
                  }
                  else
                  {
                    v31 = 0;
                  }
                  v33 = v31;

                  v89 = 0u;
                  v87 = 0u;
                  v88 = 0u;
                  v86 = 0u;
                  v34 = v33;
                  v35 = -[NSObject countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
                  v18 = a1;
                  if (v35)
                  {
                    v36 = v35;
                    v37 = *(_QWORD *)v87;
                    v77 = v22;
                    v80 = v34;
                    v81 = *(_QWORD *)v87;
                    do
                    {
                      v38 = 0;
                      v82 = v36;
                      do
                      {
                        if (*(_QWORD *)v87 != v37)
                          objc_enumerationMutation(v34);
                        v39 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v38);
                        objc_msgSend(*(id *)(v18 + 64), "parameterForKey:", v39);
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        v41 = (objc_class *)objc_msgSend(v40, "singleStateClass");
                        if (-[objc_class isSubclassOfClass:](v41, "isSubclassOfClass:", objc_opt_class()))
                        {
                          objc_msgSend(*(id *)(v18 + 56), "objectForKeyedSubscript:", v39);
                          v42 = (void *)objc_claimAutoreleasedReturnValue();
                          v43 = v42;
                          if (v42)
                          {
                            v44 = v42;
                          }
                          else
                          {
                            objc_msgSend(*(id *)(v18 + 64), "parameterStateForKey:", v39);
                            v44 = (id)objc_claimAutoreleasedReturnValue();
                          }
                          v45 = v44;

                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v46 = v45;
                            if (v46)
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                v47 = v46;
                              else
                                v47 = 0;
                            }
                            else
                            {
                              v47 = 0;
                            }
                            v50 = v47;

                            objc_msgSend(v50, "value");
                            v51 = (void *)objc_claimAutoreleasedReturnValue();

                            v52 = objc_alloc(MEMORY[0x1E0D441A8]);
                            if (v51)
                              v53 = objc_msgSend(v51, "indentationLevel");
                            else
                              v53 = 0;
                            v54 = (void *)objc_msgSend(v52, "initWithValue:indentationLevel:", v22, v53);
                            v55 = (void *)objc_msgSend([v41 alloc], "initWithValue:", v54);
                            objc_msgSend(*(id *)(v18 + 56), "setObject:forKey:", v55, v39);

                            goto LABEL_62;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v48 = v45;
                            if (v48)
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                v49 = v48;
                              else
                                v49 = 0;
                            }
                            else
                            {
                              v49 = 0;
                            }
                            v56 = v49;

                            objc_msgSend(v56, "parameterStates");
                            v57 = (void *)objc_claimAutoreleasedReturnValue();
                            v58 = MEMORY[0x1E0C809B0];
                            v84[0] = MEMORY[0x1E0C809B0];
                            v84[1] = 3221225472;
                            v84[2] = __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_257;
                            v84[3] = &unk_1E7AF5FD8;
                            v85 = v78;
                            objc_msgSend(v57, "indexesOfObjectsPassingTest:", v84);
                            v59 = (void *)objc_claimAutoreleasedReturnValue();

                            objc_msgSend(v56, "parameterStates");
                            v60 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v60, "objectsAtIndexes:", v59);
                            v61 = (void *)objc_claimAutoreleasedReturnValue();
                            v83[0] = v58;
                            v83[1] = 3221225472;
                            v83[2] = __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_2_259;
                            v83[3] = &unk_1E7AF6000;
                            v22 = v77;
                            v83[4] = v77;
                            v83[5] = v41;
                            objc_msgSend(v61, "if_map:", v83);
                            v62 = (void *)objc_claimAutoreleasedReturnValue();

                            objc_msgSend(v56, "stateByReplacingValueAtIndexes:withValues:", v59, v62);
                            v63 = (void *)objc_claimAutoreleasedReturnValue();

                            objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v63, v39);
                            v18 = a1;

                            v51 = v85;
LABEL_62:

                            v34 = v80;
                          }

                          v37 = v81;
                          v36 = v82;
                        }

                        ++v38;
                      }
                      while (v36 != v38);
                      v36 = -[NSObject countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
                    }
                    while (v36);
                  }

                  v32 = v34;
                  v20 = v72;
                  v19 = v73;
                  v27 = v75;
                  v21 = v76;
                  v29 = v78;
                }
                else
                {
                  getWFActionsLogObject();
                  v32 = objc_claimAutoreleasedReturnValue();
                  v18 = a1;
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v100 = "-[WFAppIntentExecutionAction fetchMissingDisplayRepresentationValuesWithCompletionHandler:]_block_invoke";
                    v101 = 2112;
                    v102 = v22;
                    _os_log_impl(&dword_1C15B3000, v32, OS_LOG_TYPE_ERROR, "%s Unable to get entityIdentifier from value: %@", buf, 0x16u);
                  }
                }

              }
              else
              {
                getWFActionsLogObject();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
                {
                  objc_msgSend(v22, "valueType");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315394;
                  v100 = "-[WFAppIntentExecutionAction fetchMissingDisplayRepresentationValuesWithCompletionHandler:]_block_invoke";
                  v101 = 2112;
                  v102 = v28;
                  _os_log_impl(&dword_1C15B3000, v27, OS_LOG_TYPE_FAULT, "%s Fetching display representations returned a value that wasn't an entity: expected LNEntityValueType, got %@", buf, 0x16u);

                }
                v18 = a1;
              }

              ++v21;
            }
            while (v21 != v19);
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
          }
          while (v19);
        }

        (*(void (**)(void))(*(_QWORD *)(v18 + 72) + 16))();
      }
      else
      {
        getWFActionsLogObject();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          v65 = *(void **)(a1 + 32);
          v66 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 136315906;
          v100 = "-[WFAppIntentExecutionAction fetchMissingDisplayRepresentationValuesWithCompletionHandler:]_block_invoke_3";
          v101 = 2114;
          v102 = v65;
          v103 = 2112;
          v104 = v66;
          v105 = 2112;
          v106 = v16;
          _os_log_impl(&dword_1C15B3000, v64, OS_LOG_TYPE_DEFAULT, "%s Fetching display representations for entity identifiers: %{public}@, mangledTypeName: %@ returned an invalid number of items: %@", buf, 0x2Au);
        }

        v67 = *(_QWORD *)(a1 + 72);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 5, MEMORY[0x1E0C9AA70]);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v67 + 16))(v67, v68);

      }
      v15 = v69;
    }
    else
    {
      v14 = *(void **)(a1 + 32);
      v94[0] = MEMORY[0x1E0C809B0];
      v94[1] = 3221225472;
      v94[2] = __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_249;
      v94[3] = &unk_1E7AF5FB0;
      v95 = *(id *)(a1 + 48);
      v96 = *(id *)(a1 + 56);
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v94);
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

      v15 = v95;
    }

    v10 = v70;
    goto LABEL_76;
  }
  v6 = v5;
  getWFActionsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    v100 = "-[WFAppIntentExecutionAction fetchMissingDisplayRepresentationValuesWithCompletionHandler:]_block_invoke_3";
    v101 = 2114;
    v102 = v8;
    v103 = 2112;
    v104 = v9;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Failed to fetch display representation for entity identifiers: %{public}@, mangledTypeName: %@", buf, 0x20u);
  }

  v10 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_76:

}

void __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_249(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
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

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_2_250;
  v6[3] = &unk_1E7AF9D28;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

uint64_t __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_257(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v4;
    else
      v3 = 0;
  }
  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
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

  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(void **)(a1 + 32);
  v12 = v10;
  v13 = v11;
  v14 = v13;
  if (v12 == v13)
  {
    v15 = 1;
  }
  else
  {
    v15 = 0;
    if (v12 && v13)
      v15 = objc_msgSend(v12, "isEqual:", v13);
  }

  return v15;
}

id __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_2_259(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D441A8]);
  v5 = *(_QWORD *)(a1 + 32);
  if (v3)
    v6 = objc_msgSend(v3, "indentationLevel");
  else
    v6 = 0;
  v7 = (void *)objc_msgSend(v4, "initWithValue:indentationLevel:", v5, v6);
  v8 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithValue:", v7);

  return v8;
}

void __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_2_250(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99E38];
  v4 = a2;
  objc_msgSend(v3, "null");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v5, v4);

}

id __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

uint64_t __68__WFAppIntentExecutionAction_parametersNeedingDisplayRepresentation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "fetchingDisplayRepresentationParameterKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if ((v6 & 1) == 0)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v3, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parameterStateForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v10;
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = 0;
        v17 = &v16;
        v18 = 0x2020000000;
        v19 = 0;
        objc_msgSend(v11, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __68__WFAppIntentExecutionAction_parametersNeedingDisplayRepresentation__block_invoke_2;
        v15[3] = &unk_1E7AF5F20;
        v15[4] = &v16;
        objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);

        v7 = *((_BYTE *)v17 + 24) != 0;
        _Block_object_dispose(&v16, 8);

LABEL_9:
        goto LABEL_10;
      }

      v13 = v11;
    }
    else
    {
      v13 = 0;
    }
    v7 = WFLinkActionParameterStateNeedingDisplayRepresentation(v13);
    goto LABEL_9;
  }
  v7 = 0;
LABEL_10:

  return v7;
}

void __68__WFAppIntentExecutionAction_parametersNeedingDisplayRepresentation__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;

  objc_msgSend(a2, "parameterState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = WFLinkActionParameterStateNeedingDisplayRepresentation(v6);

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

uint64_t __91__WFAppIntentExecutionAction_alertForLinkConfirmationDialogRequest_preferredStyle_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __91__WFAppIntentExecutionAction_alertForLinkConfirmationDialogRequest_preferredStyle_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __121__WFAppIntentExecutionAction_alertForLinkActionConfirmationWithParameterMetadata_dialogString_request_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int8x16_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  int8x16_t v14;
  id v15;

  objc_msgSend(a1[4], "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "fullyQualifiedLinkActionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "displayableAppBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wf_contentItemFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:", v4, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __121__WFAppIntentExecutionAction_alertForLinkActionConfirmationWithParameterMetadata_dialogString_request_completionHandler___block_invoke_2;
  v11[3] = &unk_1E7AF5ED0;
  v12 = a1[6];
  v13 = a1[7];
  v10 = *((int8x16_t *)a1 + 2);
  v9 = (id)v10.i64[0];
  v14 = vextq_s8(v10, v10, 8uLL);
  v15 = a1[8];
  objc_msgSend(v8, "encodedTypedValueWithCompletion:", v11);

}

void __121__WFAppIntentExecutionAction_alertForLinkActionConfirmationWithParameterMetadata_dialogString_request_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v3 = (objc_class *)MEMORY[0x1E0DC7C20];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithParameterKey:parameterValue:", v6, v4);

  v8 = objc_alloc(MEMORY[0x1E0DC7BC0]);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AD0]), "initWithTitle:icon:", 0, 0);
  v12 = (void *)objc_msgSend(v8, "initWithActionParameterMetadata:dialogString:viewSnippet:attribution:parameterInfo:", v9, v10, 0, v11, v7);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __121__WFAppIntentExecutionAction_alertForLinkActionConfirmationWithParameterMetadata_dialogString_request_completionHandler___block_invoke_3;
  v15[3] = &unk_1E7AF5EA8;
  v13 = *(void **)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  objc_msgSend(v13, "alertForLinkConfirmationDialogRequest:preferredStyle:handler:", v12, 0, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

uint64_t __121__WFAppIntentExecutionAction_alertForLinkActionConfirmationWithParameterMetadata_dialogString_request_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithConfirmation:", a2);
}

uint64_t __100__WFAppIntentExecutionAction_alertForLinkActionConfirmationWithActionMetadata_dialogString_request___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithConfirmation:", a2);
}

void __53__WFAppIntentExecutionAction_connectionPolicySignals__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 344));
}

void __46__WFAppIntentExecutionAction_connectionPolicy__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 340));
}

void __40__WFAppIntentExecutionAction_connection__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 336));
}

void __75__WFAppIntentExecutionAction_confirmContinueInAppWithRequest_dialogString___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (!a2 || a2 == 2)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "respondWithError:", v3);

  }
  else if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
  }
}

void __69__WFAppIntentExecutionAction_executor_needsContinueInAppWithRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "captionPrint");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "confirmContinueInAppWithRequest:dialogString:", v3, v4);

}

void __74__WFAppIntentExecutionAction_executor_needsActionConfirmationWithRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "captionPrint");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "confirmActionWithRequest:dialogString:", v3, v4);

}

void __68__WFAppIntentExecutionAction_confirmActionWithRequest_dialogString___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (a2)
  {
    if (a2 == 2)
    {
      v2 = *(void **)(a1 + 32);
      v3 = 0;
    }
    else
    {
      if (a2 != 1)
        return;
      v2 = *(void **)(a1 + 32);
      v3 = 1;
    }
    objc_msgSend(v2, "respondWithConfirmation:", v3);
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v5);

  }
}

id __89__WFAppIntentExecutionAction_disambiguateParameterForParameterName_request_dialogString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  objc_msgSend(v3, "valueType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wf_parameterDefinitionWithParameterMetadata:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "fullyQualifiedLinkActionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "displayableAppBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wf_contentItemFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:", v3, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __89__WFAppIntentExecutionAction_disambiguateParameterForParameterName_request_dialogString___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  uint64_t v13;

  v5 = (void *)MEMORY[0x1E0D13E90];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __89__WFAppIntentExecutionAction_disambiguateParameterForParameterName_request_dialogString___block_invoke_3;
  v11 = &unk_1E7AF7440;
  v6 = *(void **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = a3;
  objc_msgSend(v5, "buttonWithContentItem:selected:stickySelection:handler:", a2, 0, 0, &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addButton:", v7, v8, v9, v10, v11);

}

void __89__WFAppIntentExecutionAction_disambiguateParameterForParameterName_request_dialogString___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "respondWithError:", v2);

}

uint64_t __89__WFAppIntentExecutionAction_disambiguateParameterForParameterName_request_dialogString___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithSelectedIndex:", *(_QWORD *)(a1 + 40));
}

void __88__WFAppIntentExecutionAction_askForParameterValueForParameterName_request_dialogString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  void (**v18)(_QWORD);
  _QWORD aBlock[5];
  id v20;
  id v21;
  id v22;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  if (a4)
  {
    objc_msgSend(v7, "finishRunningWithError:", a4);
  }
  else
  {
    objc_msgSend(v7, "processedParameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "if_dictionaryByAddingEntriesFromDictionary:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setProcessedParameters:", v9);

    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__WFAppIntentExecutionAction_askForParameterValueForParameterName_request_dialogString___block_invoke_2;
    aBlock[3] = &unk_1E7AF9298;
    v11 = *(void **)(a1 + 40);
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v20 = v11;
    v21 = v6;
    v22 = *(id *)(a1 + 48);
    v12 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = *(void **)(a1 + 32);
      objc_msgSend(v13, "userInterface");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "runningDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contentItemCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __88__WFAppIntentExecutionAction_askForParameterValueForParameterName_request_dialogString___block_invoke_4;
      v17[3] = &unk_1E7AF9450;
      v17[4] = *(_QWORD *)(a1 + 32);
      v18 = v12;
      objc_msgSend(v13, "performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:", v14, v16, v17);

    }
    else
    {
      v12[2](v12);
    }

  }
}

void __88__WFAppIntentExecutionAction_askForParameterValueForParameterName_request_dialogString___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88__WFAppIntentExecutionAction_askForParameterValueForParameterName_request_dialogString___block_invoke_3;
  v4[3] = &unk_1E7AF5DE0;
  v4[4] = v1;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v1, "getValueForParameterData:ofProcessedParameters:completionHandler:", v2, v3, v4);

}

void __88__WFAppIntentExecutionAction_askForParameterValueForParameterName_request_dialogString___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    getWFAppIntentsLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 136315394;
      v6 = "-[WFAppIntentExecutionAction askForParameterValueForParameterName:request:dialogString:]_block_invoke_4";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_INFO, "%s Interrupting WFLinkDeleteEntityAction because of missing deletion authorization: %@", (uint8_t *)&v5, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v3);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __88__WFAppIntentExecutionAction_askForParameterValueForParameterName_request_dialogString___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 40), "respondWithValue:", a2);
  else
    return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __89__WFAppIntentExecutionAction_confirmParameterValueForParameterName_request_dialogString___block_invoke(uint64_t a1, void *a2)
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

void __89__WFAppIntentExecutionAction_confirmParameterValueForParameterName_request_dialogString___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (a2)
  {
    if (a2 == 2)
    {
      v2 = *(void **)(a1 + 32);
      v3 = 0;
    }
    else
    {
      if (a2 != 1)
        return;
      v2 = *(void **)(a1 + 32);
      v3 = 1;
    }
    objc_msgSend(v2, "respondWithConfirmation:", v3);
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v5);

  }
}

uint64_t __99__WFAppIntentExecutionAction_getLinkActionForArchivingFallingBackToDefaultValue_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "getLinkActionWithProcessedParameters:forFocusConfiguration:fallingBackToDefaultValue:completionHandler:", a2, 1, 0, *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __95__WFAppIntentExecutionAction_processValueForParameter_withToolKitInvocation_completionHandler___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = (void *)a1[4];
  v6 = a1[5];
  v7 = a3;
  objc_msgSend(v5, "postProcessToolKitProcessedValue:forParameter:", a2, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[6] + 16))();

}

void __103__WFAppIntentExecutionAction_processEncodedValue_withToolKitInvocation_forParameter_completionHandler___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = (void *)a1[4];
  v6 = a1[5];
  v7 = a3;
  objc_msgSend(v5, "postProcessToolKitProcessedValue:forParameter:", a2, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[6] + 16))();

}

id __76__WFAppIntentExecutionAction_postProcessToolKitProcessedValue_forParameter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char isKindOfClass;
  void *v8;
  id v9;
  id v10;
  char v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  id v26;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v8 = v5;
    else
      v8 = 0;
    v9 = v8;
    v10 = v5;
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();
    if ((v11 & 1) != 0)
      v12 = v10;
    else
      v12 = 0;
    v13 = v12;

    if ((v11 & 1) != 0)
    {
      v14 = objc_alloc(MEMORY[0x1E0D43E38]);
      objc_msgSend(v10, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D43D10], "applicationValueType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v14, "initWithValue:valueType:", v15, v16);

    }
    else if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "enumMetadata");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "cases");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __76__WFAppIntentExecutionAction_postProcessToolKitProcessedValue_forParameter___block_invoke_2;
      v25[3] = &unk_1E7AF89A0;
      v20 = v10;
      v26 = v20;
      objc_msgSend(v19, "if_firstObjectPassingTest:", v25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v21, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = objc_alloc(MEMORY[0x1E0D43E38]);
        objc_msgSend(v20, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v22, "initWithValue:valueType:", v23, v6);

      }
    }
    else
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43E38]), "initWithValue:valueType:", v10, v6);
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __76__WFAppIntentExecutionAction_postProcessToolKitProcessedValue_forParameter___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

uint64_t __76__WFAppIntentExecutionAction_postProcessToolKitProcessedValue_forParameter___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void __55__WFAppIntentExecutionAction_linkActionWithParameters___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 336));
}

void __133__WFAppIntentExecutionAction_getLinkActionWithProcessedParameters_forFocusConfiguration_fallingBackToDefaultValue_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  char v16;

  v6 = a2;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(unsigned __int8 *)(a1 + 48);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __133__WFAppIntentExecutionAction_getLinkActionWithProcessedParameters_forFocusConfiguration_fallingBackToDefaultValue_completionHandler___block_invoke_2;
  v13[3] = &unk_1E7AF5C98;
  v13[4] = v8;
  v14 = v6;
  v16 = *(_BYTE *)(a1 + 49);
  v15 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v8, "getValueForParameterData:ofProcessedParameters:fallingBackToDefaultValue:completionHandler:", v12, v9, v10, v13);

}

void __133__WFAppIntentExecutionAction_getLinkActionWithProcessedParameters_forFocusConfiguration_fallingBackToDefaultValue_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "linkActionWithParameters:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, 0);

  }
}

void __133__WFAppIntentExecutionAction_getLinkActionWithProcessedParameters_forFocusConfiguration_fallingBackToDefaultValue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "if_map:", &__block_literal_global_128_52107);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    v9 = objc_alloc(MEMORY[0x1E0D43E38]);
    objc_msgSend(v5, "valueType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(v9, "initWithValue:valueType:displayRepresentation:", v7, v10, v11);

  }
  else
  {
    v26 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "parameterIdentifiersNeedingValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0D43D58]);
    objc_msgSend(v15, "setForcesNeedsValue:", 1);

    v16 = 0;
  }
  else
  {
    v15 = 0;
    v16 = v26;
  }
  v27 = v16;
  if (*(_BYTE *)(a1 + 56))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "valueShouldStripSensitiveContent:", v16))
    {
      objc_msgSend(v27, "setDisplayRepresentation:", 0);
      objc_msgSend(v27, "valueType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v27, "value");
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

        objc_msgSend(v21, "enumerateObjectsUsingBlock:", &__block_literal_global_132_52109);
      }
    }
  }
  v22 = *(_QWORD *)(a1 + 48);
  v23 = objc_alloc(MEMORY[0x1E0D43D48]);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithIdentifier:value:configuration:", v24, v27, v15);
  (*(void (**)(uint64_t, void *, id))(v22 + 16))(v22, v25, v6);

}

uint64_t __133__WFAppIntentExecutionAction_getLinkActionWithProcessedParameters_forFocusConfiguration_fallingBackToDefaultValue_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisplayRepresentation:", 0);
}

id __133__WFAppIntentExecutionAction_getLinkActionWithProcessedParameters_forFocusConfiguration_fallingBackToDefaultValue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (objc_class *)MEMORY[0x1E0D43E38];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v4, "initWithValue:valueType:displayRepresentation:", v5, v6, v7);
  return v8;
}

NSString *__46__WFAppIntentExecutionAction_outputDictionary__block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

@end
