@implementation WFParameter

- (BOOL)allowsMultipleValues
{
  return self->_allowsMultipleValues;
}

- (WFParameter)initWithDefinition:(id)a3
{
  id v5;
  WFParameter *v6;
  WFParameter *v7;
  WFResourceManager *v8;
  void *v9;
  uint64_t v10;
  WFResourceManager *resourceManager;
  uint64_t v12;
  NSHashTable *eventObservers;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSString *key;
  void *v18;
  uint64_t v19;
  NSString *v20;
  NSString *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *legacyKey;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSString *languageCode;
  uint64_t v39;
  WFPropertyListObject *defaultSerializedRepresentation;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  NSSet *disallowedVariableTypes;
  uint64_t v50;
  NSSet *defaultSupportedVariableTypes;
  __CFString *v52;
  __CFString *importQuestionBehavior;
  void *v54;
  uint64_t v55;
  __CFString *v56;
  void *v57;
  uint64_t v58;
  NSString *v59;
  NSString *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  NSDictionary *arraySizesBySizeClass;
  void *v65;
  BOOL v66;
  uint64_t v67;
  NSDictionary *arraySizeRangesByWidgetFamily;
  WFParameter *v69;
  objc_super v71;

  v5 = a3;
  v71.receiver = self;
  v71.super_class = (Class)WFParameter;
  v6 = -[WFParameter init](&v71, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_definition, a3);
    v8 = [WFResourceManager alloc];
    objc_msgSend(v5, "objectForKey:", CFSTR("RequiredResources"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WFResourceManager initWithDefinitions:](v8, "initWithDefinitions:", v9);
    resourceManager = v7->_resourceManager;
    v7->_resourceManager = (WFResourceManager *)v10;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v12 = objc_claimAutoreleasedReturnValue();
    eventObservers = v7->_eventObservers;
    v7->_eventObservers = (NSHashTable *)v12;

    objc_msgSend(v5, "objectForKey:", CFSTR("Key"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_class();
    WFEnforceClass(v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    key = v7->_key;
    v7->_key = (NSString *)v16;

    objc_msgSend(v5, "objectForKey:", CFSTR("KeyForSerialization"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_class();
    WFEnforceClass(v18, v19);
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v20)
      v21 = v7->_key;
    objc_storeStrong((id *)&v7->_keyForSerialization, v21);

    objc_msgSend(v5, "objectForKey:", CFSTR("LegacyKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_class();
    WFEnforceClass(v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    legacyKey = v7->_legacyKey;
    v7->_legacyKey = (NSString *)v24;

    objc_msgSend(v5, "objectForKey:", CFSTR("Hidden"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_opt_class();
    WFEnforceClass(v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_hidden = objc_msgSend(v28, "BOOLValue");

    objc_msgSend(v5, "objectForKey:", CFSTR("DoNotLocalizeValues"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_opt_class();
    WFEnforceClass(v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_doNotLocalizeValues = objc_msgSend(v31, "BOOLValue");

    objc_msgSend(v5, "objectForKey:", CFSTR("DoNotLocalizePlaceholder"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_opt_class();
    WFEnforceClass(v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_doNotLocalizePlaceholder = objc_msgSend(v34, "BOOLValue");

    objc_msgSend(v5, "objectForKey:", CFSTR("LanguageCodeOverride"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_opt_class();
    WFEnforceClass(v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    languageCode = v7->_languageCode;
    v7->_languageCode = (NSString *)v37;

    objc_msgSend(v5, "objectForKey:", CFSTR("DefaultValue"));
    v39 = objc_claimAutoreleasedReturnValue();
    defaultSerializedRepresentation = v7->_defaultSerializedRepresentation;
    v7->_defaultSerializedRepresentation = (WFPropertyListObject *)v39;

    objc_msgSend(v5, "objectForKey:", CFSTR("DisallowedVariableTypes"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_opt_class();
    WFEnforceClass(v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      if (objc_msgSend(v43, "containsObject:", CFSTR("Variable")))
      {
        objc_msgSend((id)objc_opt_class(), "allInsertableVariableTypes");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)objc_msgSend(v44, "mutableCopy");

        objc_msgSend(v45, "removeObject:", CFSTR("Ask"));
        objc_msgSend(v45, "allObjects");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "arrayByAddingObjectsFromArray:", v46);
        v47 = objc_claimAutoreleasedReturnValue();

        v43 = (void *)v47;
      }
      v48 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v43);
      disallowedVariableTypes = v7->_disallowedVariableTypes;
      v7->_disallowedVariableTypes = (NSSet *)v48;

    }
    v50 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("Ask"), CFSTR("ActionOutput"), CFSTR("Variable"), CFSTR("ExtensionInput"), 0);
    defaultSupportedVariableTypes = v7->_defaultSupportedVariableTypes;
    v7->_defaultSupportedVariableTypes = (NSSet *)v50;

    if (v7->_hidden)
    {
      v52 = CFSTR("Hidden");
      importQuestionBehavior = (__CFString *)v7->_importQuestionBehavior;
      v7->_importQuestionBehavior = (NSString *)CFSTR("Hidden");
    }
    else
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("ImportQuestionBehavior"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_opt_class();
      WFEnforceClass(v54, v55);
      importQuestionBehavior = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (importQuestionBehavior)
        v56 = importQuestionBehavior;
      else
        v56 = CFSTR("Default");
      objc_storeStrong((id *)&v7->_importQuestionBehavior, v56);
    }

    objc_msgSend(v5, "objectForKey:", CFSTR("IntentSlotName"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_opt_class();
    WFEnforceClass(v57, v58);
    v59 = (NSString *)objc_claimAutoreleasedReturnValue();
    v60 = v59;
    if (!v59)
      v60 = v7->_key;
    objc_storeStrong((id *)&v7->_intentSlotName, v60);

    objc_msgSend(v5, "objectForKey:", CFSTR("AllowsMultipleValues"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_allowsMultipleValues = objc_msgSend(v61, "BOOLValue");

    objc_msgSend(v5, "objectForKey:", CFSTR("FixedSizeArray"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_fixedSizeArray = objc_msgSend(v62, "BOOLValue");

    objc_msgSend(v5, "objectForKey:", CFSTR("ArraySizesForSizeClass"));
    v63 = objc_claimAutoreleasedReturnValue();
    arraySizesBySizeClass = v7->_arraySizesBySizeClass;
    v7->_arraySizesBySizeClass = (NSDictionary *)v63;

    objc_msgSend(v5, "objectForKey:", CFSTR("RangedSizeArray"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (objc_msgSend(v65, "BOOLValue") & 1) != 0 || v7->_fixedSizeArray;
    v7->_rangedSizeArray = v66;

    objc_msgSend(v5, "objectForKey:", CFSTR("ArraySizeRangesForWidgetFamily"));
    v67 = objc_claimAutoreleasedReturnValue();
    arraySizeRangesByWidgetFamily = v7->_arraySizeRangesByWidgetFamily;
    v7->_arraySizeRangesByWidgetFamily = (NSDictionary *)v67;

    v69 = v7;
  }

  return v7;
}

- (NSString)key
{
  return self->_key;
}

- (WFParameterDefinition)definition
{
  return self->_definition;
}

- (NSString)legacyKey
{
  return self->_legacyKey;
}

- (NSString)keyForSerialization
{
  return self->_keyForSerialization;
}

- (void)addEventObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFParameter eventObservers](self, "eventObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSHashTable)eventObservers
{
  return self->_eventObservers;
}

+ (id)parameterWithDefinition:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSString *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("Class"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  WFEnforceClass(v5, v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = NSClassFromString(v7);

  if (v8)
  {
    if (-[objc_class isSubclassOfClass:](v8, "isSubclassOfClass:", a1)
      && (objc_msgSend(v4, "objectForKey:", CFSTR("Key")),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_opt_class(),
          WFEnforceClass(v9, v10),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v9,
          v11))
    {
      v8 = (objc_class *)objc_msgSend([v8 alloc], "initWithDefinition:", v4);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)localizedLabel
{
  void *v3;
  void *v4;

  +[WFActionLocalizationContext defaultContext](WFActionLocalizationContext, "defaultContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameter localizedLabelWithContext:](self, "localizedLabelWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)localizedDescription
{
  void *v3;
  void *v4;

  +[WFActionLocalizationContext defaultContext](WFActionLocalizationContext, "defaultContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameter localizedDescriptionWithContext:](self, "localizedDescriptionWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (WFPropertyListObject)defaultSerializedRepresentation
{
  return self->_defaultSerializedRepresentation;
}

- (BOOL)doNotLocalizeValues
{
  return self->_doNotLocalizeValues;
}

- (WFResourceManager)resourceManager
{
  return self->_resourceManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_defaultSupportedVariableTypes, 0);
  objc_storeStrong((id *)&self->_eventObservers, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_disallowedVariableTypes, 0);
  objc_storeStrong((id *)&self->_intentSlotName, 0);
  objc_storeStrong((id *)&self->_importQuestionBehavior, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_defaultSerializedRepresentation, 0);
  objc_storeStrong((id *)&self->_localizedPlaceholder, 0);
  objc_storeStrong((id *)&self->_legacyKey, 0);
  objc_storeStrong((id *)&self->_keyForSerialization, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_arraySizeRangesByWidgetFamily, 0);
  objc_storeStrong((id *)&self->_arraySizesBySizeClass, 0);
  objc_storeStrong((id *)&self->_localizedPrompt, 0);
  objc_storeStrong((id *)&self->_supportedVariableTypes, 0);
}

- (void)defaultSerializedRepresentationDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[WFParameter eventObservers](self, "eventObservers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "parameterDefaultSerializedRepresentationDidChange:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)attributesDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[WFParameter eventObservers](self, "eventObservers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "parameterAttributesDidChange:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)stateValidityCriteriaDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[WFParameter eventObservers](self, "eventObservers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "parameterStateValidityCriteriaDidChange:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (Class)stateClass
{
  objc_class *v3;

  if (-[WFParameter allowsMultipleValues](self, "allowsMultipleValues"))
    v3 = -[WFParameter multipleStateClass](self, "multipleStateClass");
  else
    v3 = -[WFParameter singleStateClass](self, "singleStateClass");
  return v3;
}

- (void)setLocalizedPrompt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (Class)multipleStateClass
{
  return (Class)objc_opt_class();
}

- (Class)singleStateClass
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("WFParameter subclasses must implement -singleStateClass"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)localizedLabelWithContext:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[WFParameter _localizedStringForKey:context:](self, "_localizedStringForKey:context:", CFSTR("Label"), a3);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_1E7AFA810;
  v5 = v3;

  return v5;
}

- (NSString)localizedPrompt
{
  NSString *localizedPrompt;
  NSString *v3;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;

  localizedPrompt = self->_localizedPrompt;
  if (localizedPrompt)
  {
    v3 = localizedPrompt;
  }
  else
  {
    +[WFActionLocalizationContext defaultContext](WFActionLocalizationContext, "defaultContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameter _localizedStringForKey:context:](self, "_localizedStringForKey:context:", CFSTR("Prompt"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[WFParameter localizedLabel](self, "localizedLabel");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v3 = v8;

  }
  return v3;
}

- (id)localizedDescriptionWithContext:(id)a3
{
  return -[WFParameter _localizedStringForKey:context:](self, "_localizedStringForKey:context:", CFSTR("Description"), a3);
}

- (NSString)localizedPlaceholder
{
  NSString *localizedPlaceholder;
  NSString *v3;
  void *v5;

  localizedPlaceholder = self->_localizedPlaceholder;
  if (localizedPlaceholder)
  {
    v3 = localizedPlaceholder;
  }
  else
  {
    +[WFActionLocalizationContext defaultContext](WFActionLocalizationContext, "defaultContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameter _localizedStringForKey:context:](self, "_localizedStringForKey:context:", CFSTR("Placeholder"), v5);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_localizedStringForKey:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[WFParameter definition](self, "definition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v6, "localize:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
LABEL_7:

  return v11;
}

- (NSSet)supportedVariableTypes
{
  NSSet *supportedVariableTypes;
  void *v4;
  NSSet *v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *v9;

  supportedVariableTypes = self->_supportedVariableTypes;
  if (!supportedVariableTypes)
  {
    -[WFParameter defaultSupportedVariableTypes](self, "defaultSupportedVariableTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSSet *)objc_msgSend(v4, "mutableCopy");

    if (!v5)
    {
      v9 = 0;
      return v9;
    }
    -[WFParameter disallowedVariableTypes](self, "disallowedVariableTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[WFParameter disallowedVariableTypes](self, "disallowedVariableTypes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSSet minusSet:](v5, "minusSet:", v7);

    }
    v8 = self->_supportedVariableTypes;
    self->_supportedVariableTypes = v5;

    supportedVariableTypes = self->_supportedVariableTypes;
  }
  v9 = supportedVariableTypes;
  return v9;
}

- (int64_t)arraySizeForWidgetSizeClass:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  char v10;
  void *v11;
  char v12;
  id v13;
  void *v15;
  void *v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFParameter.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("widgetSizeClass"));

  }
  if (-[WFParameter allowsMultipleValues](self, "allowsMultipleValues"))
  {
    if (-[WFParameter fixedSizeArray](self, "fixedSizeArray"))
    {
      -[NSDictionary objectForKeyedSubscript:](self->_arraySizesBySizeClass, "objectForKeyedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = objc_msgSend(v6, "integerValue");
        if (v8 <= 1)
          v9 = 1;
        else
          v9 = v8;
        goto LABEL_17;
      }
      v10 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CBD3C8]);
      v11 = (void *)*MEMORY[0x1E0CBD3D0];
      if ((v10 & 1) == 0)
      {
        v12 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CBD3D0]);
        v11 = (void *)*MEMORY[0x1E0CBD3D8];
        if ((v12 & 1) == 0)
        {
          if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CBD3D8])
            || (v11 = (void *)*MEMORY[0x1E0CBD3B0],
                objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CBD3B0])))
          {
            v11 = (void *)*MEMORY[0x1E0CBD3E0];
          }
          else
          {
            v15 = (void *)*MEMORY[0x1E0CBD3A8];
            if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CBD3A8]) & 1) == 0)
            {
              if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CBD3C0]) & 1) != 0)
              {
                v11 = v15;
              }
              else
              {
                v11 = v15;
                if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CBD3B8]))
                {
                  v9 = 1;
                  goto LABEL_17;
                }
              }
            }
          }
        }
      }
      v13 = v11;
      v9 = -[WFParameter arraySizeForWidgetSizeClass:](self, "arraySizeForWidgetSizeClass:", v13);

LABEL_17:
      goto LABEL_18;
    }
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = 1;
  }
LABEL_18:

  return v9;
}

- (_NSRange)arraySizeRangeForWidgetFamily:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  void *v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  id v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  void *v22;
  _NSRange result;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFParameter.m"), 203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("widgetFamily"));

  }
  v6 = 1;
  v7 = 1;
  if (-[WFParameter allowsMultipleValues](self, "allowsMultipleValues"))
  {
    if (-[WFParameter isRangedSizeArray](self, "isRangedSizeArray"))
    {
      -[NSDictionary objectForKeyedSubscript:](self->_arraySizeRangesByWidgetFamily, "objectForKeyedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v6 = objc_msgSend(v8, "rangeValue");
        v7 = v10;
LABEL_17:

        goto LABEL_18;
      }
      v11 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D43948]);
      v12 = (void *)*MEMORY[0x1E0D43950];
      if ((v11 & 1) == 0)
      {
        v13 = objc_msgSend(v5, "isEqualToString:", v12);
        v12 = (void *)*MEMORY[0x1E0D43958];
        if ((v13 & 1) == 0)
        {
          v14 = objc_msgSend(v5, "isEqualToString:", v12);
          v12 = (void *)*MEMORY[0x1E0D43960];
          if ((v14 & 1) == 0)
          {
            if (!objc_msgSend(v5, "isEqualToString:", v12))
            {
              v15 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D43938]);
              v12 = (void *)*MEMORY[0x1E0D43920];
              if ((v15 & 1) != 0)
                goto LABEL_16;
              v16 = objc_msgSend(v5, "isEqualToString:", v12);
              v12 = (void *)*MEMORY[0x1E0D43928];
              if ((v16 & 1) != 0)
                goto LABEL_16;
              v17 = objc_msgSend(v5, "isEqualToString:", v12);
              v12 = (void *)*MEMORY[0x1E0D43930];
              if ((v17 & 1) != 0)
                goto LABEL_16;
              if (!objc_msgSend(v5, "isEqualToString:", v12))
              {
                v7 = 0;
                v6 = 0x7FFFFFFFFFFFFFFFLL;
                goto LABEL_17;
              }
            }
            v12 = (void *)*MEMORY[0x1E0D43968];
          }
        }
      }
LABEL_16:
      v18 = v12;
      v6 = -[WFParameter arraySizeRangeForWidgetFamily:](self, "arraySizeRangeForWidgetFamily:", v18);
      v7 = v19;

      goto LABEL_17;
    }
    v6 = 0;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_18:

  v20 = v6;
  v21 = v7;
  result.length = v21;
  result.location = v20;
  return result;
}

- (BOOL)displaysMultipleValueEditor
{
  return 1;
}

- (BOOL)stripsTTSHints
{
  void *v2;
  void *v3;
  char v4;

  -[WFParameter definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("StripsTTSHints"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)wasAddedToWorkflow
{
  self->_insideWorkflow = 1;
}

- (void)wasRemovedFromWorkflow
{
  self->_insideWorkflow = 0;
}

- (void)setHidden:(BOOL)a3
{
  if (self->_hidden != a3)
  {
    self->_hidden = a3;
    -[WFParameter attributesDidChange](self, "attributesDidChange");
  }
}

- (BOOL)parameterStateIsValid:(id)a3
{
  return 1;
}

- (void)removeEventObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFParameter eventObservers](self, "eventObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (Class)toolkitValueClass
{
  objc_class *v2;
  void *v3;
  void *v4;

  v2 = -[WFParameter toolkitStateClass](self, "toolkitStateClass");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class processingValueClasses](v2, "processingValueClasses");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "firstObject");

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (void *)-[objc_class processingValueClass](v2, "processingValueClass");
  }
  else
  {
    v4 = 0;
  }
  return (Class)v4;
}

- (NSDictionary)arraySizesBySizeClass
{
  return self->_arraySizesBySizeClass;
}

- (NSDictionary)arraySizeRangesByWidgetFamily
{
  return self->_arraySizeRangesByWidgetFamily;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setLocalizedPlaceholder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)doNotLocalizePlaceholder
{
  return self->_doNotLocalizePlaceholder;
}

- (BOOL)isInsideWorkflow
{
  return self->_insideWorkflow;
}

- (NSString)importQuestionBehavior
{
  return self->_importQuestionBehavior;
}

- (NSString)intentSlotName
{
  return self->_intentSlotName;
}

- (BOOL)isRangedSizeArray
{
  return self->_rangedSizeArray;
}

- (BOOL)shouldAlignLabels
{
  return self->_shouldAlignLabels;
}

- (BOOL)isEditingForConfiguration
{
  return self->_isEditingForConfiguration;
}

- (void)setIsEditingForConfiguration:(BOOL)a3
{
  self->_isEditingForConfiguration = a3;
}

- (NSSet)disallowedVariableTypes
{
  return self->_disallowedVariableTypes;
}

- (BOOL)fixedSizeArray
{
  return self->_fixedSizeArray;
}

- (NSSet)defaultSupportedVariableTypes
{
  return self->_defaultSupportedVariableTypes;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

+ (id)allInsertableVariableTypes
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("Ask"), CFSTR("Variable"), CFSTR("Clipboard"), CFSTR("CurrentDate"), CFSTR("DeviceDetails"), CFSTR("ActionOutput"), CFSTR("ExtensionInput"), 0);
}

+ (id)referencedActionResourceClasses
{
  return (id)objc_opt_new();
}

@end
