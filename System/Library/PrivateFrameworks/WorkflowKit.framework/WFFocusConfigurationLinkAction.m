@implementation WFFocusConfigurationLinkAction

- (id)disabledOnPlatforms
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFFocusConfigurationLinkAction;
  -[WFAction disabledOnPlatforms](&v3, sel_disabledOnPlatforms);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)localizedAppName
{
  void *v2;
  void *v3;

  -[WFAppIntentExecutionAction appDescriptor](self, "appDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedNameWithContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("Set %@ Focus Filter"), CFSTR("Set %@ Focus Filter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localize:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFFocusConfigurationLinkAction localizedAppName](self, "localizedAppName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("Sets the behavior of the %@ app when the given Focus is enabled."), CFSTR("Sets the behavior of the %@ app when the given Focus is enabled."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localize:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFFocusConfigurationLinkAction localizedAppName](self, "localizedAppName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)localizedCategoryWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("Focus (action category)"), CFSTR("Focus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)parameterSummary
{
  WFActionParameterSummary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WFActionParameterSummary *v8;

  v3 = [WFActionParameterSummary alloc];
  v4 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("${Mode} %@ Focus Filter while in ${FocusMode}"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFocusConfigurationLinkAction localizedAppName](self, "localizedAppName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFActionParameterSummary initWithLocalizedString:](v3, "initWithLocalizedString:", v7);

  return v8;
}

- (id)parameterDefinitions
{
  void *v4;
  WFParameterDefinition *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WFParameterDefinition *v16;
  WFParameterDefinition *v17;
  void *v18;
  void *v19;
  WFParameterDefinition *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  objc_super v26;
  _QWORD v27[2];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[6];
  _QWORD v33[8];

  v33[6] = *MEMORY[0x1E0C80C00];
  if (-[WFFocusConfigurationLinkAction isRunningInsideFocusConfigurationExtension](self, "isRunningInsideFocusConfigurationExtension"))
  {
    v26.receiver = self;
    v26.super_class = (Class)WFFocusConfigurationLinkAction;
    -[WFLinkAction parameterDefinitions](&v26, sel_parameterDefinitions);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)WFFocusConfigurationLinkAction;
    -[WFLinkAction parameterDefinitions](&v25, sel_parameterDefinitions);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "if_compactMap:", &__block_literal_global_42964);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = [WFParameterDefinition alloc];
    v32[0] = CFSTR("Class");
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v23;
    v33[1] = CFSTR("Set");
    v32[1] = CFSTR("DefaultValue");
    v32[2] = CFSTR("Items");
    v31[0] = CFSTR("Set");
    v31[1] = CFSTR("Turn On");
    v31[2] = CFSTR("Turn Off");
    v31[3] = CFSTR("Toggle");
    v31[4] = CFSTR("Clear");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v7;
    v32[3] = CFSTR("ItemDisplayNames");
    WFLocalizedStringResourceWithKey(CFSTR("Set"), CFSTR("Set"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v8;
    WFLocalizedStringResourceWithKey(CFSTR("Turn On"), CFSTR("Turn On"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v9;
    WFLocalizedStringResourceWithKey(CFSTR("Turn Off"), CFSTR("Turn Off"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v10;
    WFLocalizedStringResourceWithKey(CFSTR("Toggle"), CFSTR("Toggle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v11;
    WFLocalizedStringResourceWithKey(CFSTR("Clear"), CFSTR("Clear"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[4] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v13;
    v33[4] = CFSTR("Mode");
    v32[4] = CFSTR("Key");
    v32[5] = CFSTR("Label");
    WFLocalizedStringResourceWithKey(CFSTR("Mode"), CFSTR("Mode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33[5] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[WFParameterDefinition initWithDictionary:](v5, "initWithDictionary:", v15);

    v17 = [WFParameterDefinition alloc];
    v28[0] = CFSTR("Class");
    v28[1] = CFSTR("Key");
    v29[0] = CFSTR("WFFocusModesPickerParameter");
    v29[1] = CFSTR("FocusMode");
    v28[2] = CFSTR("Label");
    WFLocalizedStringResourceWithKey(CFSTR("Focus"), CFSTR("Focus"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[WFParameterDefinition initWithDictionary:](v17, "initWithDictionary:", v19);

    v27[0] = v16;
    v27[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    return v22;
  }
}

- (id)selectedFocusIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void **v5;
  void *v6;
  id v7;
  id result;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("FocusMode"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    goto LABEL_6;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v5 = (void **)getDNDDefaultModeIdentifierSymbolLoc_ptr;
  v14 = getDNDDefaultModeIdentifierSymbolLoc_ptr;
  if (!getDNDDefaultModeIdentifierSymbolLoc_ptr)
  {
    v6 = DoNotDisturbLibrary();
    v5 = (void **)dlsym(v6, "DNDDefaultModeIdentifier");
    v12[3] = (uint64_t)v5;
    getDNDDefaultModeIdentifierSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    v4 = *v5;
LABEL_6:
    v7 = v4;

    return v7;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getDNDDefaultModeIdentifier(void)");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("WFFocusConfigurationLinkAction.m"), 30, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (id)dndApplicationIdentifier
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 buf;
  void (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[WFAppIntentExecutionAction appDescriptor](self, "appDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    getWFAppIntentsLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[WFFocusConfigurationLinkAction dndApplicationIdentifier]";
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_FAULT, "%s Could not get bundle identifier for action owner.", (uint8_t *)&buf, 0xCu);
    }

  }
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v5 = (void *)getDNDApplicationIdentifierClass_softClass;
  v13 = getDNDApplicationIdentifierClass_softClass;
  if (!getDNDApplicationIdentifierClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v15 = __getDNDApplicationIdentifierClass_block_invoke;
    v16 = &unk_1E7AF9520;
    v17 = &v10;
    __getDNDApplicationIdentifierClass_block_invoke((uint64_t)&buf);
    v5 = (void *)v11[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v10, 8);
  v7 = [v6 alloc];
  v8 = (void *)objc_msgSend(v7, "initWithBundleID:", v3, v10);

  return v8;
}

- (DNDModeConfigurationService)configurationService
{
  DNDModeConfigurationService *configurationService;
  void *v4;
  id v5;
  DNDModeConfigurationService *v6;
  DNDModeConfigurationService *v7;
  NSObject *v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 buf;
  void (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  configurationService = self->_configurationService;
  if (!configurationService)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getDNDModeConfigurationServiceClass_softClass;
    v13 = getDNDModeConfigurationServiceClass_softClass;
    if (!getDNDModeConfigurationServiceClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v15 = __getDNDModeConfigurationServiceClass_block_invoke;
      v16 = &unk_1E7AF9520;
      v17 = &v10;
      __getDNDModeConfigurationServiceClass_block_invoke((uint64_t)&buf);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    objc_msgSend(v5, "serviceForClientIdentifier:", CFSTR("com.apple.focus.activity-manager"), v10);
    v6 = (DNDModeConfigurationService *)objc_claimAutoreleasedReturnValue();
    v7 = self->_configurationService;
    self->_configurationService = v6;

    configurationService = self->_configurationService;
    if (!configurationService)
    {
      getWFAppIntentsLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = "-[WFFocusConfigurationLinkAction configurationService]";
        _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_FAULT, "%s Could not obtain a DNDModeConfigurationService instance.", (uint8_t *)&buf, 0xCu);
      }

      configurationService = self->_configurationService;
    }
  }
  return configurationService;
}

- (BOOL)shouldAskForValuesWhileProcessingParameterStates
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("Mode"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Set")))
  {
    -[WFFocusConfigurationLinkAction createAndCommitFocusConfigurationToDND](self, "createAndCommitFocusConfigurationToDND");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Turn On")))
  {
    -[WFFocusConfigurationLinkAction enableFocusConfiguration](self, "enableFocusConfiguration");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Turn Off")))
  {
    -[WFFocusConfigurationLinkAction disableFocusConfiguration](self, "disableFocusConfiguration");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Toggle")))
  {
    -[WFFocusConfigurationLinkAction toggleFocusConfiguration](self, "toggleFocusConfiguration");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Clear")))
  {
    -[WFFocusConfigurationLinkAction clearFocusConfiguration](self, "clearFocusConfiguration");
  }
  else
  {
    getWFAppIntentsLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v7 = 136315138;
      v8 = "-[WFFocusConfigurationLinkAction runAsynchronouslyWithInput:]";
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_FAULT, "%s Programming error: Unexpected action mode.", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend((id)objc_opt_class(), "genericRuntimeError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentExecutionAction finishRunningWithError:](self, "finishRunningWithError:", v6);

  }
}

- (void)createAndCommitFocusConfigurationToDND
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[WFAction processedParameters](self, "processedParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("Mode"));
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("FocusMode"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__WFFocusConfigurationLinkAction_createAndCommitFocusConfigurationToDND__block_invoke;
    v7[3] = &unk_1E7AF4320;
    v7[4] = self;
    -[WFAppIntentExecutionAction getLinkActionWithProcessedParameters:completionHandler:](self, "getLinkActionWithProcessedParameters:completionHandler:", v5, v7);
  }
  else
  {
    getWFAppIntentsLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[WFFocusConfigurationLinkAction createAndCommitFocusConfigurationToDND]";
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_FAULT, "%s Could not get processedParameters.", buf, 0xCu);
    }

    objc_msgSend((id)objc_opt_class(), "genericRuntimeError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentExecutionAction finishRunningWithError:](self, "finishRunningWithError:", v5);
  }

}

- (id)currentFocusConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[WFFocusConfigurationLinkAction configurationService](self, "configurationService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFocusConfigurationLinkAction selectedFocusIdentifier](self, "selectedFocusIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v3, "getAppActionsForModeIdentifier:error:", v4, &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  -[WFFocusConfigurationLinkAction dndApplicationIdentifier](self, "dndApplicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    getWFAppIntentsLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[WFFocusConfigurationLinkAction currentFocusConfiguration]";
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_ERROR, "%s Error fetching current focus configuration: %@", buf, 0x16u);
    }

  }
  if (objc_msgSend(v8, "count"))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__WFFocusConfigurationLinkAction_currentFocusConfiguration__block_invoke;
    v16[3] = &unk_1E7AF4348;
    v16[4] = self;
    objc_msgSend(v8, "objectsPassingTest:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    getWFAppIntentsLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[WFAppIntentExecutionAction appDescriptor](self, "appDescriptor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v19 = "-[WFFocusConfigurationLinkAction currentFocusConfiguration]";
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_INFO, "%s No Focus configurations were found for %@", buf, 0x16u);

    }
    v11 = 0;
  }

  return v11;
}

- (void)setFocusConfigurationEnablementStatus:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  -[WFFocusConfigurationLinkAction currentFocusConfiguration](self, "currentFocusConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    getWFAppIntentsLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[WFFocusConfigurationLinkAction setFocusConfigurationEnablementStatus:]";
      v17 = "%s Could not find a current configuration, won't update status.";
      v18 = v9;
      v19 = 12;
LABEL_13:
      _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_INFO, v17, buf, v19);
    }
LABEL_14:

    -[WFAppIntentExecutionAction finishRunningWithError:](self, "finishRunningWithError:", 0);
    goto LABEL_17;
  }
  v7 = objc_msgSend(v5, "isEnabled");
  getWFAppIntentsLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 == v3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[WFFocusConfigurationLinkAction setFocusConfigurationEnablementStatus:]";
      v23 = 1024;
      LODWORD(v24) = v3;
      v17 = "%s Won't update status because it is already set to %d";
      v18 = v9;
      v19 = 18;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[WFFocusConfigurationLinkAction setFocusConfigurationEnablementStatus:]";
    v23 = 1024;
    LODWORD(v24) = v3;
    _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEBUG, "%s Setting Focus Filter status to %d", buf, 0x12u);
  }

  v10 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v10, "setEnabled:", v3);
  -[WFFocusConfigurationLinkAction configurationService](self, "configurationService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFocusConfigurationLinkAction dndApplicationIdentifier](self, "dndApplicationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFocusConfigurationLinkAction selectedFocusIdentifier](self, "selectedFocusIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v11, "setAppAction:forApplicationIdentifier:modeIdentifier:error:", v10, v12, v13, &v20);
  v14 = v20;

  if (v14)
  {
    getWFAppIntentsLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[WFFocusConfigurationLinkAction setFocusConfigurationEnablementStatus:]";
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_ERROR, "%s Error committing DNDAppAction enablement status: %@", buf, 0x16u);
    }

    objc_msgSend((id)objc_opt_class(), "genericRuntimeError");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentExecutionAction finishRunningWithError:](self, "finishRunningWithError:", v16);

  }
  else
  {
    -[WFAppIntentExecutionAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }

LABEL_17:
}

- (void)enableFocusConfiguration
{
  -[WFFocusConfigurationLinkAction setFocusConfigurationEnablementStatus:](self, "setFocusConfigurationEnablementStatus:", 1);
}

- (void)disableFocusConfiguration
{
  -[WFFocusConfigurationLinkAction setFocusConfigurationEnablementStatus:](self, "setFocusConfigurationEnablementStatus:", 0);
}

- (void)toggleFocusConfiguration
{
  id v3;

  -[WFFocusConfigurationLinkAction currentFocusConfiguration](self, "currentFocusConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WFFocusConfigurationLinkAction setFocusConfigurationEnablementStatus:](self, "setFocusConfigurationEnablementStatus:", objc_msgSend(v3, "isEnabled") ^ 1);

}

- (void)clearFocusConfiguration
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  getWFAppIntentsLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[WFFocusConfigurationLinkAction selectedFocusIdentifier](self, "selectedFocusIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v15 = "-[WFFocusConfigurationLinkAction clearFocusConfiguration]";
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_DEBUG, "%s Clearing Focus Filter configuration from focus with identifier %@", buf, 0x16u);

  }
  -[WFFocusConfigurationLinkAction configurationService](self, "configurationService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFocusConfigurationLinkAction dndApplicationIdentifier](self, "dndApplicationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFocusConfigurationLinkAction selectedFocusIdentifier](self, "selectedFocusIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v5, "clearAppActionWithIdentifier:forApplicationIdentifier:modeIdentifier:error:", v7, v8, v9, &v13);
  v10 = v13;

  -[WFFocusConfigurationLinkAction updateParameterStatesFromCurrentDNDConfiguration](self, "updateParameterStatesFromCurrentDNDConfiguration");
  if (v10)
  {
    getWFAppIntentsLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[WFFocusConfigurationLinkAction clearFocusConfiguration]";
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_ERROR, "%s Error clearing DNDAppAction: %@", buf, 0x16u);
    }

    objc_msgSend((id)objc_opt_class(), "genericRuntimeError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentExecutionAction finishRunningWithError:](self, "finishRunningWithError:", v12);

  }
  else
  {
    -[WFAppIntentExecutionAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }

}

- (void)updateParameterStatesFromCurrentDNDConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  __int128 v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  -[WFFocusConfigurationLinkAction currentFocusConfiguration](self, "currentFocusConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v4;
  objc_msgSend(v4, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[WFAppIntentExecutionAction metadata](self, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v9)
    {
      v11 = v9;
      v12 = *(_QWORD *)v38;
      *(_QWORD *)&v10 = 136315394;
      v35 = v10;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v38 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v14, "valueType", v35);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "wf_parameterDefinitionWithParameterMetadata:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v36, "parameters");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "if_firstObjectWithValue:forKey:", v18, CFSTR("identifier"));
            v19 = objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              -[NSObject value](v19, "value");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "parameterStateFromLinkValue:", v20);
              v21 = objc_claimAutoreleasedReturnValue();

              if (v21)
              {
                objc_msgSend(v14, "name");
                v22 = objc_claimAutoreleasedReturnValue();
                -[WFLinkAction setParameterState:forKey:](self, "setParameterState:forKey:", v21, v22);
              }
              else
              {
                getWFAppIntentsLogObject();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v35;
                  v47 = "-[WFFocusConfigurationLinkAction updateParameterStatesFromCurrentDNDConfiguration]";
                  v48 = 2112;
                  v49 = v16;
                  _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_ERROR, "%s Could not create parameter state from parameter definition %@.", buf, 0x16u);
                }
              }

            }
            else
            {
              getWFAppIntentsLogObject();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v14, "name");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v35;
                v47 = "-[WFFocusConfigurationLinkAction updateParameterStatesFromCurrentDNDConfiguration]";
                v48 = 2112;
                v49 = v24;
                _os_log_impl(&dword_1C15B3000, v21, OS_LOG_TYPE_ERROR, "%s Could not find a property with identifier %@ in the DND LNAction, it will be ignored.", buf, 0x16u);

              }
            }

          }
          else
          {
            getWFAppIntentsLogObject();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v14, "name");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v35;
              v47 = "-[WFFocusConfigurationLinkAction updateParameterStatesFromCurrentDNDConfiguration]";
              v48 = 2112;
              v49 = v23;
              _os_log_impl(&dword_1C15B3000, v19, OS_LOG_TYPE_ERROR, "%s Failed to create parameter definition for %@, it will be ignored.", buf, 0x16u);

            }
          }

        }
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v11);
    }
  }
  else
  {
    getWFAppIntentsLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[WFFocusConfigurationLinkAction updateParameterStatesFromCurrentDNDConfiguration]";
      _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_INFO, "%s No parameters to configure, will clear parameter states.", buf, 0xCu);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[WFAppIntentExecutionAction metadata](self, "metadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v42 != v29)
            objc_enumerationMutation(v8);
          v31 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          getWFAppIntentsLogObject();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v31, "name");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v47 = "-[WFFocusConfigurationLinkAction updateParameterStatesFromCurrentDNDConfiguration]";
            v48 = 2112;
            v49 = v33;
            _os_log_impl(&dword_1C15B3000, v32, OS_LOG_TYPE_DEBUG, "%s Clearing parameter state for %@", buf, 0x16u);

          }
          objc_msgSend(v31, "name");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFLinkAction setParameterState:forKey:](self, "setParameterState:forKey:", 0, v34);

        }
        v28 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      }
      while (v28);
    }
  }

}

- (void)wasAddedToWorkflowByUser:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFFocusConfigurationLinkAction;
  -[WFAction wasAddedToWorkflowByUser:](&v5, sel_wasAddedToWorkflowByUser_);
  if (a3)
    -[WFFocusConfigurationLinkAction updateParameterStatesFromCurrentDNDConfiguration](self, "updateParameterStatesFromCurrentDNDConfiguration");
}

- (BOOL)isRunningInsideFocusConfigurationExtension
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC7F50]) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC7F58]);

  return v4;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D13EE0], "focusLocation", a3);
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v6 = a5;
  -[WFAppIntentExecutionAction appDescriptor](self, "appDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  if (v8)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to change your Focus Filter settings for “%2$@”?"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v10, v6, v8);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to change your Focus Filter settings?"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v10, v6, v13);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)requiresRemoteExecution
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFFocusConfigurationLinkAction;
  return -[WFAction requiresRemoteExecution](&v3, sel_requiresRemoteExecution);
}

- (void)setConfigurationService:(id)a3
{
  objc_storeStrong((id *)&self->_configurationService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationService, 0);
}

uint64_t __59__WFFocusConfigurationLinkAction_currentFocusConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

void __72__WFFocusConfigurationLinkAction_createAndCommitFocusConfigurationToDND__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE buf[24];
  void *v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  getWFAppIntentsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFFocusConfigurationLinkAction createAndCommitFocusConfigurationToDND]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEBUG, "%s Will send configured LNAction to DNDModeConfigurationService: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "currentFocusConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    getWFAppIntentsLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[WFFocusConfigurationLinkAction createAndCommitFocusConfigurationToDND]_block_invoke";
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEBUG, "%s Updating a pre-existing DNDAppAction", buf, 0xCu);
      }

      v12 = (void *)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(v12, "setAction:", v5);
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[WFFocusConfigurationLinkAction createAndCommitFocusConfigurationToDND]_block_invoke";
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEBUG, "%s Creating a new DNDAppAction", buf, 0xCu);
      }

      v23 = 0;
      v24 = &v23;
      v25 = 0x2050000000;
      v13 = (void *)getDNDAppActionClass_softClass;
      v26 = getDNDAppActionClass_softClass;
      if (!getDNDAppActionClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getDNDAppActionClass_block_invoke;
        v28 = &unk_1E7AF9520;
        v29 = &v23;
        __getDNDAppActionClass_block_invoke((uint64_t)buf);
        v13 = (void *)v24[3];
      }
      v14 = objc_retainAutorelease(v13);
      _Block_object_dispose(&v23, 8);
      v12 = (void *)objc_msgSend([v14 alloc], "initWithAction:enabled:", v5, 1);
    }
    objc_msgSend(*(id *)(a1 + 32), "configurationService");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dndApplicationIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "selectedFocusIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v15, "setAppAction:forApplicationIdentifier:modeIdentifier:error:", v12, v16, v17, &v22);
    v18 = v22;

    if (v18)
    {
      getWFAppIntentsLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[WFFocusConfigurationLinkAction createAndCommitFocusConfigurationToDND]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v18;
        _os_log_impl(&dword_1C15B3000, v19, OS_LOG_TYPE_ERROR, "%s Error committing DNDAppAction: %@", buf, 0x16u);
      }

      v20 = *(void **)(a1 + 32);
      objc_msgSend((id)objc_opt_class(), "genericRuntimeError");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "finishRunningWithError:", v21);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
    }

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFFocusConfigurationLinkAction createAndCommitFocusConfigurationToDND]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Could not get LNAction with error: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
  }

}

id __54__WFFocusConfigurationLinkAction_parameterDefinitions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  void *v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "objectForKey:", CFSTR("Key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ShowWhenRun")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("OpenWhenRun")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v18[0] = CFSTR("WFParameterKey");
    v18[1] = CFSTR("WFParameterValue");
    v19[0] = CFSTR("Mode");
    v19[1] = CFSTR("Set");
    v18[2] = CFSTR("WFResourceClass");
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "objectForKey:", CFSTR("RequiredResources"));
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

    v11 = (void *)objc_msgSend(v10, "mutableCopy");
    if (v11)
    {
      v12 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    objc_msgSend(v13, "addObject:", v7);
    v16 = CFSTR("RequiredResources");
    v17 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "definitionByAddingEntriesInDictionary:", v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)genericRuntimeError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2D50];
  WFLocalizedString(CFSTR("An error occurred while configuring the Focus Filter."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("WFFocusConfigurationLinkActionErrorDomain"), 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
