@implementation WFHandleSystemIntentAction

- (WFHandleSystemIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 stringLocalizer:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  WFHandleSystemIntentAction *v21;
  _BYTE v23[24];
  id v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "objectForKey:", CFSTR("IntentIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  v16 = v14;
  if (v16 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v23 = 136315906;
      *(_QWORD *)&v23[4] = "WFEnforceClass";
      *(_WORD *)&v23[12] = 2114;
      *(_QWORD *)&v23[14] = v16;
      *(_WORD *)&v23[22] = 2114;
      v24 = (id)objc_opt_class();
      LOWORD(v25) = 2114;
      *(_QWORD *)((char *)&v25 + 2) = v15;
      v19 = v24;
      _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", v23, 0x2Au);

    }
    v17 = 0;
  }
  else
  {
    v17 = v16;
  }

  if (v17)
  {
    INIntentSchemaGetIntentDescriptionWithType();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  v21 = -[WFHandleSystemIntentAction initWithIdentifier:definition:serializedParameters:intentDescription:stringLocalizer:](self, "initWithIdentifier:definition:serializedParameters:intentDescription:stringLocalizer:", v10, v11, v12, v20, v13, *(_OWORD *)v23, *(_QWORD *)&v23[16], v24, v25);

  return v21;
}

- (WFHandleSystemIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 intentDescription:(id)a6 stringLocalizer:(id)a7
{
  id v11;
  WFActionDefinition *v12;
  id v13;
  id v14;
  id v15;
  WFActionDefinition *v16;
  void *v17;
  void *v18;
  void *v19;
  WFParameterDefinition *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  WFParameterDefinition *v26;
  WFParameterDefinition *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  WFParameterDefinition *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  BOOL v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  WFHandleSystemIntentAction *v45;
  WFHandleSystemIntentAction *v46;
  const char *v47;
  id v48;
  WFHandleSystemIntentAction *v49;
  id v51;
  id obj;
  _QWORD handler[4];
  id v55;
  id location;
  objc_super v57;
  _QWORD v58[4];
  WFHandleSystemIntentAction *v59;
  id v60;
  id v61;
  const __CFString *v62;
  id v63;
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[4];
  _QWORD v67[6];

  v67[4] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (WFActionDefinition *)a4;
  v13 = a5;
  obj = a6;
  v14 = a6;
  v15 = a7;
  if (v12)
  {
    if (!v14)
      goto LABEL_7;
  }
  else
  {
    v16 = [WFActionDefinition alloc];
    v12 = -[WFActionDefinition initWithDictionary:](v16, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
    if (!v14)
      goto LABEL_7;
  }
  -[WFActionDefinition objectForKey:](v12, "objectForKey:", CFSTR("Parameters"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v18 = (void *)objc_opt_new();
    objc_msgSend(v14, "slotDescriptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __115__WFHandleSystemIntentAction_initWithIdentifier_definition_serializedParameters_intentDescription_stringLocalizer___block_invoke;
    v58[3] = &unk_1E7AEE6F0;
    v59 = self;
    v60 = v11;
    v61 = v18;
    v51 = v18;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v58);

    v20 = [WFParameterDefinition alloc];
    v66[0] = CFSTR("Class");
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v22;
    v67[1] = CFSTR("IntentAppDefinition");
    v66[1] = CFSTR("Key");
    v66[2] = CFSTR("Label");
    WFLocalizedStringResourceWithKey(CFSTR("App (SystemIntentAppIdentifier)"), CFSTR("App"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v67[2] = v23;
    v66[3] = CFSTR("IntentName");
    NSStringFromClass((Class)objc_msgSend(v14, "facadeClass"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v67[3] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[WFParameterDefinition initWithDictionary:](v20, "initWithDictionary:", v25);

    objc_msgSend(v51, "insertObject:atIndex:", v26, 0);
    v27 = [WFParameterDefinition alloc];
    v64[0] = CFSTR("Class");
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v29;
    v65[1] = CFSTR("OpenInApp");
    v64[1] = CFSTR("Key");
    v64[2] = CFSTR("Label");
    WFLocalizedStringResourceWithKey(CFSTR("Open in App (SystemIntentOpenInApp)"), CFSTR("Open in App"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v65[2] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[WFParameterDefinition initWithDictionary:](v27, "initWithDictionary:", v31);

    objc_msgSend(v51, "addObject:", v32);
    v62 = CFSTR("Parameters");
    v63 = v51;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFActionDefinition definitionByAddingEntriesInDictionary:](v12, "definitionByAddingEntriesInDictionary:", v33);
    v34 = objc_claimAutoreleasedReturnValue();

    v12 = (WFActionDefinition *)v34;
  }
LABEL_7:
  -[WFActionDefinition objectForKey:](v12, "objectForKey:", CFSTR("Parameters"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "if_firstObjectPassingTest:", &__block_literal_global_134);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13
    || (objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("IntentAppDefinition")),
        v37 = (void *)objc_claimAutoreleasedReturnValue(),
        v38 = v37 == 0,
        v37,
        v38))
  {
    objc_msgSend(v36, "objectForKey:", CFSTR("DefaultValue"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39 == 0;

    if (!v40)
    {
      if (v13)
        v41 = objc_msgSend(v13, "mutableCopy");
      else
        v41 = objc_opt_new();
      v42 = (void *)v41;
      objc_msgSend(v36, "objectForKey:", CFSTR("DefaultValue"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setObject:forKeyedSubscript:", v43, CFSTR("IntentAppDefinition"));

      v44 = objc_msgSend(v42, "copy");
      v13 = (id)v44;
    }
  }
  v57.receiver = self;
  v57.super_class = (Class)WFHandleSystemIntentAction;
  v45 = -[WFHandleIntentAction initWithIdentifier:definition:serializedParameters:stringLocalizer:](&v57, sel_initWithIdentifier_definition_serializedParameters_stringLocalizer_, v11, v12, v13, v15);
  v46 = v45;
  if (v45)
  {
    objc_storeStrong((id *)&v45->_intentDescription, obj);
    objc_initWeak(&location, v46);
    v47 = (const char *)objc_msgSend((id)*MEMORY[0x1E0CA57B8], "UTF8String");
    v48 = MEMORY[0x1E0C80D38];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __115__WFHandleSystemIntentAction_initWithIdentifier_definition_serializedParameters_intentDescription_stringLocalizer___block_invoke_3;
    handler[3] = &unk_1E7AF5AF8;
    objc_copyWeak(&v55, &location);
    notify_register_dispatch(v47, &v46->_token, MEMORY[0x1E0C80D38], handler);

    v49 = v46;
    objc_destroyWeak(&v55);
    objc_destroyWeak(&location);
  }

  return v46;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_token);
  v3.receiver = self;
  v3.super_class = (Class)WFHandleSystemIntentAction;
  -[WFHandleSystemIntentAction dealloc](&v3, sel_dealloc);
}

- (void)selectedAppDidChange
{
  INIntentDescriptor *intentDescriptor;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  intentDescriptor = self->_intentDescriptor;
  self->_intentDescriptor = 0;

  -[WFHandleSystemIntentAction intentDescriptor](self, "intentDescriptor");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[WFAction parameters](self, "parameters", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "resourceManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "refreshAvailabilityOfRequiredResourcesOfClasses:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }

  -[WFAction iconUpdated](self, "iconUpdated");
}

- (id)customAppNameForBundleIdentifier:(id)a3
{
  return 0;
}

- (id)customImageForBundleIdentifier:(id)a3
{
  return 0;
}

- (INIntentDescriptor)intentDescriptor
{
  INIntentDescriptor *intentDescriptor;
  INIntentDescriptor *v4;
  INIntentDescriptor *v5;
  void *v6;
  INIntentDescriptor *v7;
  INIntentDescriptor *v8;

  intentDescriptor = self->_intentDescriptor;
  if (intentDescriptor)
    goto LABEL_4;
  -[WFHandleSystemIntentAction intentDescriptorFromParameterState](self, "intentDescriptorFromParameterState");
  v4 = (INIntentDescriptor *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resolvedIntentMatchingDescriptor:", v5);
    v7 = (INIntentDescriptor *)objc_claimAutoreleasedReturnValue();
    v8 = self->_intentDescriptor;
    self->_intentDescriptor = v7;

    intentDescriptor = self->_intentDescriptor;
LABEL_4:
    v4 = intentDescriptor;
  }
  return v4;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  -[WFAction definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)WFHandleSystemIntentAction;
    -[WFHandleIntentAction localizedNameWithContext:](&v14, sel_localizedNameWithContext_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFHandleSystemIntentAction intentDescription](self, "intentDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "rangeOfString:options:", CFSTR("Intent"), 12);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v9, "substringToIndex:", v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    WFAddSpacesToCamelCaseName(v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)displayableAppDescriptor
{
  void *v2;
  void *v3;

  -[WFHandleSystemIntentAction displayableAppIdentifier](self, "displayableAppIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD728]), "initWithBundleIdentifier:", v2);
  else
    v3 = 0;

  return v3;
}

- (id)localizedAppName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[WFHandleSystemIntentAction intentDescriptor](self, "intentDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleSystemIntentAction customAppNameForBundleIdentifier:](self, "customAppNameForBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    -[WFHandleSystemIntentAction intentDescriptor](self, "intentDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedName");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)displayableAppIdentifier
{
  void *v2;
  void *v3;

  -[WFHandleSystemIntentAction intentDescriptor](self, "intentDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayableBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)launchableAppIdentifier
{
  void *v2;
  void *v3;

  -[WFHandleSystemIntentAction intentDescriptor](self, "intentDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessoryIcon
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  -[WFHandleSystemIntentAction intentDescriptor](self, "intentDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleSystemIntentAction customImageForBundleIdentifier:](self, "customImageForBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0DC7B70];
    -[WFHandleSystemIntentAction displayableAppIdentifier](self, "displayableAppIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applicationIconImageForBundleIdentifier:format:", v8, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (int64_t)intentCategory
{
  void *v2;
  id v3;
  int64_t v4;

  -[WFHandleSystemIntentAction intentDescription](self, "intentDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init((Class)objc_msgSend(v2, "facadeClass"));
  v4 = objc_msgSend(v3, "_intentCategory");

  return v4;
}

- (id)intentClassName
{
  void *v2;
  void *v3;

  -[WFHandleSystemIntentAction intentDescription](self, "intentDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)objc_msgSend(v2, "facadeClass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)slots
{
  void *v2;
  void *v3;

  -[WFHandleSystemIntentAction intentDescription](self, "intentDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "slotDescriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)initializeParameters
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFHandleSystemIntentAction;
  -[WFHandleIntentAction initializeParameters](&v4, sel_initializeParameters);
  -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("IntentAppDefinition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataSource:", self);

}

- (id)copyWithSerializedParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    -[WFAction serializedParameters](self, "serializedParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("IntentAppDefinition"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v12 = CFSTR("IntentAppDefinition");
      -[WFAction serializedParameters](self, "serializedParameters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("IntentAppDefinition"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)WFHandleSystemIntentAction;
  v9 = -[WFAction copyWithSerializedParameters:](&v11, sel_copyWithSerializedParameters_, v4);

  return v9;
}

- (id)generatedIntentWithIdentifier:(id)a3 input:(id)a4 processedParameters:(id)a5 error:(id *)a6
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  id v21;

  -[WFHandleSystemIntentAction intentDescription](self, "intentDescription", a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init((Class)objc_msgSend(v8, "facadeClass"));

  -[WFHandleSystemIntentAction intentDescriptor](self, "intentDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(v10, "extensionBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13 != 0;

  }
  -[WFHandleSystemIntentAction launchableAppIdentifiers](self, "launchableAppIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "containsObject:", v15);

  objc_msgSend(v10, "extensionBundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v18 = 1;
  else
    v18 = v16;
  if (v12 && (v18 & 1) != 0)
  {
    objc_msgSend(v10, "bundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setLaunchId:", v19);

    objc_msgSend(v10, "extensionBundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setExtensionBundleId:", v20);

    v21 = v9;
  }
  else if (a6)
  {
    -[WFHandleSystemIntentAction selectedAppNotSupportedError](self, "selectedAppNotSupportedError");
    v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)selectedAppNotSupportedError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  WFLocalizedString(CFSTR("Invalid App"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("Please select a valid app for %@."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction localizedName](self, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  v13[0] = *MEMORY[0x1E0CB2D68];
  v13[1] = v9;
  v14[0] = v3;
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 10, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFHandleSystemIntentAction;
  v8 = -[WFAction setParameterState:forKey:](&v15, sel_setParameterState_forKey_, v6, v7);
  if (v8 && objc_msgSend(v7, "isEqualToString:", CFSTR("IntentAppDefinition")))
  {
    -[WFHandleSystemIntentAction selectedAppDidChange](self, "selectedAppDidChange");
    v9 = v6;
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

    objc_msgSend(v11, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction setSupplementalParameterValue:forKey:](self, "setSupplementalParameterValue:forKey:", v13, CFSTR("IntentAppIdentifier"));

    -[WFAction recreateResourcesIfNeeded](self, "recreateResourcesIfNeeded");
  }

  return v8;
}

- (id)intentDescriptorWithIntentClassName:(id)a3 launchableBundleId:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0CBD980];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithIntentClassName:launchableAppBundleId:", v7, v6);

  return v8;
}

- (id)intentDescriptorFromParameterState
{
  void *v2;
  WFIntentDescriptorParameterState *v3;
  WFIntentDescriptorParameterState *v4;
  void *v5;

  -[WFAction serializedParameterStateForKey:](self, "serializedParameterStateForKey:", CFSTR("IntentAppDefinition"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[WFVariableSubstitutableParameterState initWithSerializedRepresentation:variableProvider:parameter:]([WFIntentDescriptorParameterState alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v2, 0, 0);
  v4 = v3;
  if (v3)
  {
    -[WFVariableSubstitutableParameterState value](v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSSet)supportedIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *supportedIdentifiers;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSSet *v17;
  NSSet *v18;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];

  if (!self->_supportedIdentifiers)
  {
    +[WFHandleSystemIntentAction sharedEnumerator](WFHandleSystemIntentAction, "sharedEnumerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHandleSystemIntentAction intentClassName](self, "intentClassName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "supportedIdentifiersForIntentClassName:includingUserActivityBasedApps:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __50__WFHandleSystemIntentAction_supportedIdentifiers__block_invoke;
    v22[3] = &unk_1E7AEE760;
    v22[4] = self;
    objc_msgSend(v6, "if_compactMap:", v22);
    v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
    supportedIdentifiers = self->_supportedIdentifiers;
    self->_supportedIdentifiers = v7;

  }
  -[WFAction appDefinition](self, "appDefinition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0DC7918]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD728]), "initWithBundleIdentifier:", v10);
  objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resolvedAppMatchingDescriptor:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFAction processedParameters](self, "processedParameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_8;
  -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("IntentAppDefinition"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isHidden") || !v14)
  {

LABEL_8:
    v18 = self->_supportedIdentifiers;
    goto LABEL_9;
  }
  v17 = self->_supportedIdentifiers;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __50__WFHandleSystemIntentAction_supportedIdentifiers__block_invoke_2;
  v20[3] = &unk_1E7AEE788;
  v20[4] = self;
  v21 = v14;
  -[NSSet if_compactMap:](v17, "if_compactMap:", v20);
  v18 = (NSSet *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v18;
}

- (id)supportedAppIdentifiers
{
  NSArray *supportedAppIdentifiers;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  _QWORD v9[5];

  supportedAppIdentifiers = self->_supportedAppIdentifiers;
  if (!supportedAppIdentifiers)
  {
    -[WFHandleSystemIntentAction supportedIdentifiers](self, "supportedIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__WFHandleSystemIntentAction_supportedAppIdentifiers__block_invoke;
    v9[3] = &unk_1E7AEE760;
    v9[4] = self;
    objc_msgSend(v4, "if_compactMap:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_supportedAppIdentifiers;
    self->_supportedAppIdentifiers = v6;

    supportedAppIdentifiers = self->_supportedAppIdentifiers;
  }
  return supportedAppIdentifiers;
}

- (id)launchableAppIdentifiers
{
  NSSet *launchableIdentifiers;
  void *v4;
  NSSet *v5;
  NSSet *v6;
  _QWORD v8[5];

  launchableIdentifiers = self->_launchableIdentifiers;
  if (!launchableIdentifiers)
  {
    -[WFHandleSystemIntentAction supportedIdentifiers](self, "supportedIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__WFHandleSystemIntentAction_launchableAppIdentifiers__block_invoke;
    v8[3] = &unk_1E7AEE760;
    v8[4] = self;
    objc_msgSend(v4, "if_compactMap:", v8);
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_launchableIdentifiers;
    self->_launchableIdentifiers = v5;

    launchableIdentifiers = self->_launchableIdentifiers;
  }
  return launchableIdentifiers;
}

- (BOOL)shouldBeIncludedInAppsList
{
  void *v3;
  _BOOL4 v4;

  -[WFHandleSystemIntentAction supportedAppIdentifiers](self, "supportedAppIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    v4 = !-[WFAction isDiscontinued](self, "isDiscontinued");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (id)actionForAppIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id *v16;
  void *v17;
  WFAppDescriptorParameterState *v18;
  void *v19;
  void *v20;
  id obj;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  const __CFString *v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[WFHandleSystemIntentAction supportedIdentifiers](self, "supportedIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v8);
        -[WFHandleSystemIntentAction intentClassName](self, "intentClassName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFHandleSystemIntentAction intentDescriptorWithIntentClassName:launchableBundleId:](self, "intentDescriptorWithIntentClassName:launchableBundleId:", v10, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "resolvedIntentMatchingDescriptor:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "displayableBundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v4);

        if ((v15 & 1) != 0)
        {
          objc_msgSend(v13, "appDescriptor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[WFVariableSubstitutableParameterState initWithValue:]([WFAppDescriptorParameterState alloc], "initWithValue:", v17);
          v28 = CFSTR("IntentAppDefinition");
          -[WFVariableSubstitutableParameterState serializedRepresentation](v18, "serializedRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[WFHandleSystemIntentAction copyWithSerializedParameters:](self, "copyWithSerializedParameters:", v20);

          objc_storeStrong(v16 + 51, self->_supportedAppIdentifiers);
          goto LABEL_11;
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v6)
        continue;
      break;
    }
  }

  v23.receiver = self;
  v23.super_class = (Class)WFHandleSystemIntentAction;
  -[WFAction actionForAppIdentifier:](&v23, sel_actionForAppIdentifier_, v4);
  v16 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v16;
}

- (id)possibleStatesForEnumeration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[WFHandleSystemIntentAction intentClassName](self, "intentClassName", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleSystemIntentAction supportedIdentifiers](self, "supportedIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3928];
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__WFHandleSystemIntentAction_possibleStatesForEnumeration___block_invoke;
  v17[3] = &unk_1E7AEE7B0;
  v8 = v4;
  v18 = v8;
  objc_msgSend(v6, "sortDescriptorWithKey:ascending:comparator:", CFSTR("self"), 1, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __59__WFHandleSystemIntentAction_possibleStatesForEnumeration___block_invoke_2;
  v15[3] = &unk_1E7AEE7D8;
  v16 = v8;
  v12 = v8;
  objc_msgSend(v11, "if_map:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a4;
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleSystemIntentAction customAppNameForBundleIdentifier:](self, "customAppNameForBundleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(v5, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedName");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)enumeration:(id)a3 accessoryImageForPossibleState:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend(a4, "value", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFHandleSystemIntentAction customImageForBundleIdentifier:](self, "customImageForBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC7B70], "applicationIconImageForBundleIdentifier:format:", v6, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (id)intentDescription
{
  return self->_intentDescription;
}

- (void)setIntentDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_intentDescriptor, a3);
}

- (int)token
{
  return self->_token;
}

- (NSSet)launchableIdentifiers
{
  return self->_launchableIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchableIdentifiers, 0);
  objc_storeStrong((id *)&self->_supportedIdentifiers, 0);
  objc_storeStrong((id *)&self->_supportedAppIdentifiers, 0);
  objc_storeStrong((id *)&self->_intentDescriptor, 0);
  objc_storeStrong((id *)&self->_intentDescription, 0);
}

uint64_t __59__WFHandleSystemIntentAction_possibleStatesForEnumeration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
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
  uint64_t v16;

  v5 = (objc_class *)MEMORY[0x1E0CBD980];
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithIntentClassName:launchableAppBundleId:", *(_QWORD *)(a1 + 32), v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD980]), "initWithIntentClassName:launchableAppBundleId:", *(_QWORD *)(a1 + 32), v6);
  objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resolvedIntentMatchingDescriptor:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resolvedIntentMatchingDescriptor:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "localizedName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "localizedStandardCompare:", v15);

  return v16;
}

WFIntentDescriptorParameterState *__59__WFHandleSystemIntentAction_possibleStatesForEnumeration___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WFIntentDescriptorParameterState *v8;

  v3 = (objc_class *)MEMORY[0x1E0CBD980];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithIntentClassName:launchableAppBundleId:", *(_QWORD *)(a1 + 32), v4);

  objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolvedIntentMatchingDescriptor:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFVariableSubstitutableParameterState initWithValue:]([WFIntentDescriptorParameterState alloc], "initWithValue:", v7);
  return v8;
}

id __54__WFHandleSystemIntentAction_launchableAppIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0CBD980];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "intentClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIntentClassName:launchableAppBundleId:", v6, v4);

  objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resolvedIntentMatchingDescriptor:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __53__WFHandleSystemIntentAction_supportedAppIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0CBD980];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "intentClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIntentClassName:launchableAppBundleId:", v6, v4);

  objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resolvedIntentMatchingDescriptor:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "displayableBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __50__WFHandleSystemIntentAction_supportedIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CBD980]);
  objc_msgSend(*(id *)(a1 + 32), "intentClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithIntentClassName:launchableAppBundleId:", v5, v3);

  objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resolvedIntentMatchingDescriptor:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v11);

  }
  objc_msgSend(v8, "displayableBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v8, "displayableBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v13);

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v9;
  v15 = (id)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v14);
        v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v19 = objc_alloc(MEMORY[0x1E0CA5870]);
        v23 = 0;
        v20 = (void *)objc_msgSend(v19, "initWithBundleIdentifier:allowPlaceholder:error:", v18, 0, &v23);
        v21 = v23;
        if (v20 && (objc_msgSend(v20, "wf_isAvailableInContext:", 0) & 1) != 0)
        {
          v15 = v3;

          goto LABEL_16;
        }

      }
      v15 = (id)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_16:

  return v15;
}

id __50__WFHandleSystemIntentAction_supportedIdentifiers__block_invoke_2(uint64_t a1, void *a2)
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
  id v12;

  v3 = (objc_class *)MEMORY[0x1E0CBD980];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "intentClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIntentClassName:launchableAppBundleId:", v6, v4);

  objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resolvedIntentMatchingDescriptor:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "displayableBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 40)))
    v11 = v4;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

void __115__WFHandleSystemIntentAction_initWithIdentifier_definition_serializedParameters_intentDescription_stringLocalizer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  WFParameterDefinition *v6;
  WFParameterDefinition *v7;
  void *v8;
  void *v9;
  NSString *v10;
  Class v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "wf_parameterClass");
  if (v4)
  {
    v5 = v4;
    v6 = [WFParameterDefinition alloc];
    v7 = -[WFParameterDefinition initWithDictionary:](v6, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
    objc_msgSend(*(id *)(a1 + 32), "stringLocalizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "wf_updatedParameterDefinition:parameterClass:localizer:", v7, v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKey:", CFSTR("Class"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = NSClassFromString(v10);
    LODWORD(v11) = -[objc_class isSubclassOfClass:](v11, "isSubclassOfClass:", objc_opt_class());

    if ((_DWORD)v11)
    {
      v12 = *(_QWORD *)(a1 + 40);
      v16[0] = CFSTR("IntentType");
      v16[1] = CFSTR("SlotName");
      v17[0] = v12;
      objc_msgSend(v3, "wf_slotName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "definitionByAddingEntriesInDictionary:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v15;
    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);

  }
}

void __115__WFHandleSystemIntentAction_initWithIdentifier_definition_serializedParameters_intentDescription_stringLocalizer___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[51];
    WeakRetained[51] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

uint64_t __115__WFHandleSystemIntentAction_initWithIdentifier_definition_serializedParameters_intentDescription_stringLocalizer___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "objectForKey:", CFSTR("Key"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("IntentAppDefinition"));

  return v3;
}

+ (id)sharedEnumerator
{
  if (sharedEnumerator_onceToken != -1)
    dispatch_once(&sharedEnumerator_onceToken, &__block_literal_global_18841);
  return (id)sharedEnumerator_enumerator;
}

void __46__WFHandleSystemIntentAction_sharedEnumerator__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedEnumerator_enumerator;
  sharedEnumerator_enumerator = v0;

}

@end
