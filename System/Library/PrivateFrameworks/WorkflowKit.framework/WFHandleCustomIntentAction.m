@implementation WFHandleCustomIntentAction

- (WFHandleCustomIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 stringLocalizer:(id)a6
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  WFHandleCustomIntentAction *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  os_signpost_id_t spid;
  id v47;
  id v48;
  id v50;
  uint8_t v51[16];
  _QWORD v52[4];
  WFHandleCustomIntentAction *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  _BYTE *v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE buf[24];
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  v9 = a4;
  v47 = a5;
  v48 = a6;
  getWFGeneralLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v10);

  getWFGeneralLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v50;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v12, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CustomIntentActionInitialization", "identifier=%{signpost.description:attribute}@", buf, 0xCu);
  }

  objc_msgSend(v9, "objectForKey:", CFSTR("IntentIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  WFEnforceClass(v13, v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v15, "length"))
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("AppDefinition"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_class();
    WFEnforceClass(v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0DC7920]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_class();
    WFEnforceClass(v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKey:", CFSTR("IntentName"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_class();
    WFEnforceClass(v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "length"))
    {
      +[ICAppRegistry sharedRegistry](ICAppRegistry, "sharedRegistry");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "appWithIdentifier:", v21);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bundleIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v27, "length") && objc_msgSend(v24, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.%@"), *MEMORY[0x1E0CBDD68], v27, v24);
        v28 = objc_claimAutoreleasedReturnValue();

        v15 = (id)v28;
      }

    }
  }
  if (!v15)
    v15 = v50;
  v61 = 0;
  v62 = 0;
  INSchemaWithTypeName();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = 0;
  if (v31 && v30)
  {
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBD980]), "initWithIntentClassName:launchableAppBundleId:", v30, v31);
    -[WFHandleCustomIntentAction resolver](self, "resolver");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "resolvedIntentMatchingDescriptor:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "bundleIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
    {
      v37 = v35;
    }
    else
    {
      objc_msgSend(v34, "extensionBundleIdentifier");
      v37 = (id)objc_claimAutoreleasedReturnValue();
    }
    v39 = v37;

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v64 = __Block_byref_object_copy__26572;
    v65 = __Block_byref_object_dispose__26573;
    v66 = 0;
    objc_msgSend(MEMORY[0x1E0CBD960], "sharedConnection");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __97__WFHandleCustomIntentAction_initWithIdentifier_definition_serializedParameters_stringLocalizer___block_invoke;
    v52[3] = &unk_1E7AF0570;
    v60 = buf;
    v53 = self;
    v54 = v50;
    v55 = v9;
    v56 = v47;
    v57 = v29;
    v42 = v34;
    v58 = v42;
    v59 = v48;
    objc_msgSend(v40, "wf_accessBundleContentForBundleIdentifiers:withBlock:", v41, v52);

    getWFGeneralLogObject();
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      *(_WORD *)v51 = 0;
      _os_signpost_emit_with_name_impl(&dword_1C15B3000, v44, OS_SIGNPOST_INTERVAL_END, spid, "CustomIntentActionInitialization", ", v51, 2u);
    }

    v38 = (WFHandleCustomIntentAction *)*(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    getWFGeneralLogObject();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFHandleCustomIntentAction initWithIdentifier:definition:serializedParameters:stringLocalizer:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl(&dword_1C15B3000, v32, OS_LOG_TYPE_ERROR, "%s Bundle identifier for type name %{public}@ was nil.", buf, 0x16u);
    }
    v38 = 0;
  }

  return v38;
}

- (WFHandleCustomIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 schema:(id)a6 intent:(id)a7 className:(id)a8 bundleIdentifier:(id)a9 stringLocalizer:(id)a10
{
  objc_class *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  WFHandleCustomIntentAction *v28;
  id v30;

  v17 = (objc_class *)MEMORY[0x1E0CBD980];
  v30 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = (void *)objc_msgSend([v17 alloc], "initWithIntentClassName:launchableAppBundleId:", v19, v18);

  -[WFHandleCustomIntentAction resolver](self, "resolver");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "resolvedIntentMatchingDescriptor:", v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = -[WFHandleCustomIntentAction initWithIdentifier:definition:serializedParameters:schema:intent:resolvedIntentDescriptor:stringLocalizer:](self, "initWithIdentifier:definition:serializedParameters:schema:intent:resolvedIntentDescriptor:stringLocalizer:", v24, v23, v22, v21, v20, v27, v30);
  return v28;
}

- (WFHandleCustomIntentAction)initWithIdentifier:(id)a3 intent:(id)a4 className:(id)a5 bundleIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WFActionDefinition *v14;
  WFActionDefinition *v15;
  void *v16;
  WFHandleCustomIntentAction *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [WFActionDefinition alloc];
  v15 = -[WFActionDefinition initWithDictionary:](v14, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
  objc_msgSend(MEMORY[0x1E0CBDC38], "localizerForLanguage:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[WFHandleCustomIntentAction initWithIdentifier:definition:serializedParameters:schema:intent:className:bundleIdentifier:stringLocalizer:](self, "initWithIdentifier:definition:serializedParameters:schema:intent:className:bundleIdentifier:stringLocalizer:", v13, v15, 0, 0, v12, v11, v10, v16);

  return v17;
}

- (WFHandleCustomIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 schema:(id)a6 intent:(id)a7 resolvedIntentDescriptor:(id)a8 stringLocalizer:(id)a9
{
  id v14;
  WFActionDefinition *v15;
  id v16;
  id v17;
  id v18;
  WFActionDefinition *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
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
  WFHandleCustomIntentAction *v54;
  WFHandleCustomIntentAction *v55;
  id v56;
  id v57;
  uint64_t v58;
  NSString *appIdentifier;
  void *v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  uint64_t v66;
  INIntentDescriptor *intentDescriptor;
  WFHandleCustomIntentAction *v68;
  uint64_t v70;
  id obj;
  id v72;
  void *v73;
  void *v74;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  objc_super v81;
  uint64_t v82;
  id v83;
  const __CFString *v84;
  _QWORD v85[3];

  v85[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = (WFActionDefinition *)a4;
  v16 = a5;
  obj = a6;
  v79 = a6;
  v72 = a7;
  v78 = a7;
  v17 = a8;
  v18 = a9;
  if (!v15)
  {
    v19 = [WFActionDefinition alloc];
    v15 = -[WFActionDefinition initWithDictionary:](v19, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
  }
  v70 = *MEMORY[0x1E0CBDD68];
  objc_msgSend((id)*MEMORY[0x1E0CBDD68], "stringByAppendingString:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFIntentActionProvider disabledPlatformsForIntentWithTypeName:](WFIntentActionProvider, "disabledPlatformsForIntentWithTypeName:", v20);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  WFInjectDisabledPlatformsInActionDefinition(v77, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_opt_new();
  objc_msgSend(v17, "displayableBundleIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v80 = v23;
  }
  else
  {
    objc_msgSend(v17, "bundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      objc_msgSend(v17, "extensionBundleIdentifier");
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    v80 = v27;

  }
  objc_msgSend(v17, "displayableApplicationRecord");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v22;
  v74 = v28;
  v29 = 1;
  if (v28 && (objc_msgSend(v28, "wf_isAvailableInContext:", 1) & 1) == 0)
  {
    objc_msgSend(v21, "objectForKey:", CFSTR("RequiredResources"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
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
    v32 = v18;
    v33 = v31;

    v34 = (void *)objc_msgSend(v33, "mutableCopy");
    v35 = v14;
    if (v34)
      v36 = v34;
    else
      v36 = (id)objc_opt_new();
    v37 = v36;

    v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObject:", v39);

    v84 = CFSTR("RequiredResources");
    v40 = (void *)objc_msgSend(v37, "copy");
    v85[0] = v40;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "definitionByAddingEntriesInDictionary:", v41);
    v42 = objc_claimAutoreleasedReturnValue();

    v29 = 0;
    v21 = (void *)v42;
    v14 = v35;
    v18 = v32;
    v22 = v73;
  }
  objc_msgSend(v21, "objectForKey:", CFSTR("Discoverable"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v29);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v44, CFSTR("Discoverable"));

  }
  if (v80)
  {
    objc_msgSend(v21, "objectForKey:", CFSTR("AppDefinition"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v45)
    {
      v82 = *MEMORY[0x1E0DC7920];
      v83 = v80;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v46, CFSTR("AppDefinition"));

    }
  }
  objc_msgSend(v21, "objectForKey:", CFSTR("IntentName"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v47)
  {
    objc_msgSend(v17, "intentClassName");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v48, CFSTR("IntentName"));

  }
  objc_msgSend(v17, "extensionBundleIdentifier");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49 || (objc_msgSend(v17, "bundleIdentifier"), (v49 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v21, "objectForKey:", CFSTR("IntentIdentifier"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v50)
    {
      objc_msgSend(v17, "intentClassName");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.%@"), v70, v49, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v52, CFSTR("IntentIdentifier"));

    }
  }
  objc_msgSend(v21, "definitionByAddingEntriesInDictionary:", v22);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v81.receiver = self;
  v81.super_class = (Class)WFHandleCustomIntentAction;
  v54 = -[WFHandleIntentAction initWithIdentifier:definition:serializedParameters:stringLocalizer:](&v81, sel_initWithIdentifier_definition_serializedParameters_stringLocalizer_, v14, v53, v16, v18);
  v55 = v54;
  if (v54)
  {
    v76 = v20;
    v56 = v18;
    v57 = v14;
    objc_storeStrong((id *)&v54->_schema, obj);
    objc_storeStrong((id *)&v55->_intent, v72);
    v58 = objc_msgSend(v80, "copy");
    appIdentifier = v55->_appIdentifier;
    v55->_appIdentifier = (NSString *)v58;

    objc_msgSend(v16, "objectForKey:", CFSTR("IntentAppDefinition"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_opt_class();
    WFEnforceClass(v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
      v63 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD980]), "initWithSerializedRepresentation:", v62);
    else
      v63 = v17;
    v64 = v63;
    -[WFHandleCustomIntentAction resolver](v55, "resolver");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "resolvedIntentMatchingDescriptor:", v64);
    v66 = objc_claimAutoreleasedReturnValue();
    intentDescriptor = v55->_intentDescriptor;
    v55->_intentDescriptor = (INIntentDescriptor *)v66;

    v68 = v55;
    v14 = v57;
    v18 = v56;
    v20 = v76;
    v22 = v73;
  }

  return v55;
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
  void *v12;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[WFAction identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction definition](self, "definition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleCustomIntentAction schema](self, "schema");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleCustomIntentAction intent](self, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleCustomIntentAction intentDescriptor](self, "intentDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleIntentAction stringLocalizer](self, "stringLocalizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v5, "initWithIdentifier:definition:serializedParameters:schema:intent:resolvedIntentDescriptor:stringLocalizer:", v6, v7, v4, v8, v9, v10, v11);

  return v12;
}

- (id)requiredResourcesForIntentAvailableResource
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)resolver
{
  if (resolver_onceToken != -1)
    dispatch_once(&resolver_onceToken, &__block_literal_global_26557);
  return (id)resolver_resolver;
}

- (id)parametersByIntentSlotName
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WFAction parameters](self, "parameters", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "intentSlotName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "intentSlotName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v9, v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[WFHandleCustomIntentAction parametersByIntentSlotName](self, "parametersByIntentSlotName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleIntentAction stringLocalizer](self, "stringLocalizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WFSerializedParametersForDonatedIntent(v6, 0, a4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)createStateForParameter:(id)a3 fromSerializedRepresentation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  -[WFHandleCustomIntentAction setupParameter:](self, "setupParameter:", v7);
  v10.receiver = self;
  v10.super_class = (Class)WFHandleCustomIntentAction;
  -[WFAction createStateForParameter:fromSerializedRepresentation:](&v10, sel_createStateForParameter_fromSerializedRepresentation_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)initializeParameters
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)WFHandleCustomIntentAction;
  -[WFHandleIntentAction initializeParameters](&v12, sel_initializeParameters);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[WFAction parameters](self, "parameters", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[WFHandleCustomIntentAction setupParameter:](self, "setupParameter:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (void)setupParameter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v4 = a3;
  v19 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF74ED78))
    {
      objc_msgSend(v19, "definition");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("IntentSlotName"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_class();
      WFEnforceClass(v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFHandleCustomIntentAction codableDescription](self, "codableDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "attributeByName:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "setCodableAttribute:", v10);
      -[WFHandleIntentAction stringLocalizer](self, "stringLocalizer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setStringLocalizer:", v11);

      v12 = v19;
    }
    else
    {
      v12 = 0;
      v8 = v19;
    }

    v14 = v19;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    objc_msgSend(v16, "setDataSource:", self);
    v17 = v14;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v17;
    else
      v13 = 0;
  }
  else
  {
    objc_msgSend(0, "setDataSource:", self);
    v12 = 0;
    v13 = 0;
  }
  v18 = v13;

  objc_msgSend(v18, "setDataSource:", self);
}

- (id)actionForAppIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  -[WFHandleCustomIntentAction intentDescriptor](self, "intentDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (VCIsShortcutsAppBundleIdentifier() & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFHandleCustomIntentAction;
    -[WFAction actionForAppIdentifier:](&v9, sel_actionForAppIdentifier_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)shouldInsertExpandingParameterForParameter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  objc_super v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "definition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("IntentSlotName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFHandleCustomIntentAction codableDescription](self, "codableDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributeByName:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "allowsMultipleValues"))
    {
      if ((objc_msgSend(v10, "supportsSearch") & 1) != 0)
        v11 = 1;
      else
        v11 = objc_msgSend(v4, "isRangedSizeArray");
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFHandleCustomIntentAction;
    v11 = -[WFAction shouldInsertExpandingParameterForParameter:](&v13, sel_shouldInsertExpandingParameterForParameter_, v4);
  }

  return v11;
}

- (void)parameterDefaultSerializedRepresentationDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction parameterStateForKey:fallingBackToDefaultValue:](self, "parameterStateForKey:fallingBackToDefaultValue:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_7;
  objc_msgSend(v4, "defaultSerializedRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (-[WFHandleCustomIntentAction createStateForParameter:fromSerializedRepresentation:](self, "createStateForParameter:fromSerializedRepresentation:", v4, v7), (v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_7:
    v11.receiver = self;
    v11.super_class = (Class)WFHandleCustomIntentAction;
    -[WFAction parameterDefaultSerializedRepresentationDidChange:](&v11, sel_parameterDefaultSerializedRepresentationDidChange_, v4);
    goto LABEL_8;
  }
  v9 = (void *)v8;
  objc_msgSend(v4, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction setParameterState:forKey:](self, "setParameterState:forKey:", v9, v10);

LABEL_8:
}

- (BOOL)populatesInputFromInputParameter
{
  return 0;
}

- (id)parameterKeysIgnoredForParameterSummary
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("ShowWhenRun"), 0);
}

- (NSString)appIdentifier
{
  NSString *v3;
  NSString *appIdentifier;

  if (!self->_appIdentifier)
  {
    appIdentifier = 0;
LABEL_6:
    v3 = appIdentifier;
    return v3;
  }
  if ((VCIsShortcutsAppBundleIdentifier() & 1) == 0)
  {
    appIdentifier = self->_appIdentifier;
    goto LABEL_6;
  }
  v3 = 0;
  return v3;
}

- (BOOL)intentDescriptorIsSyncedFromOtherDevices
{
  void *v2;
  char v3;

  -[WFHandleCustomIntentAction schema](self, "schema");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSyncedFromOtherDevice");

  return v3;
}

- (id)generatedResourceNodes
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char isKindOfClass;
  id v14;
  void *v15;
  void *v16;
  WFResourceNode *v17;
  void *v18;
  WFResourceNode *v19;
  WFLocationAccessResource *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  WFLocationAccessResource *v24;
  WFResourceNode *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  const __CFString *v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)WFHandleCustomIntentAction;
  -[WFAction generatedResourceNodes](&v31, sel_generatedResourceNodes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (!v6)
  {
    v8 = 0;
    v15 = v5;
    goto LABEL_13;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v28 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      objc_msgSend(v11, "resource", (_QWORD)v27);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v14 = v11;

        v8 = v14;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  }
  while (v7);

  if (v8)
  {
    -[WFHandleCustomIntentAction requiredResourcesForIntentAvailableResource](self, "requiredResourcesForIntentAvailableResource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "if_map:", &__block_literal_global_206);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = [WFResourceNode alloc];
    objc_msgSend(v8, "resource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[WFResourceNode initWithResource:subnodes:](v17, "initWithResource:subnodes:", v18, v16);

    objc_msgSend(v5, "removeObject:", v8);
    objc_msgSend(v5, "addObject:", v19);

LABEL_13:
  }
  if (-[WFHandleCustomIntentAction hasLocationParameter](self, "hasLocationParameter", (_QWORD)v27))
  {
    v20 = [WFLocationAccessResource alloc];
    v32 = CFSTR("WFResourceClass");
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[WFAccessResource initWithDefinition:](v20, "initWithDefinition:", v23);

    v25 = -[WFResourceNode initWithResource:]([WFResourceNode alloc], "initWithResource:", v24);
    objc_msgSend(v5, "addObject:", v25);

  }
  return v5;
}

- (BOOL)hasLocationParameter
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char isKindOfClass;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[WFHandleCustomIntentAction codableDescription](self, "codableDescription", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "metadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)configureResourcesForParameter:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  WFIntentResultUIAvailableResource *v16;
  void *v17;
  WFIntentResultUIAvailableResource *v18;
  void *v19;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ShowWhenRun"));

  if (v6)
  {
    -[WFHandleCustomIntentAction responseCodableDescription](self, "responseCodableDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v7, "responseCodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v12, "isSuccess"))
          {
            objc_msgSend(v12, "conciseFormatString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "length"))
            {

LABEL_14:
              v9 = 1;
              goto LABEL_15;
            }
            objc_msgSend(v12, "formatString");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "length");

            if (v15)
              goto LABEL_14;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_15:

    v16 = [WFIntentResultUIAvailableResource alloc];
    -[WFHandleCustomIntentAction intentDescriptor](self, "intentDescriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[WFIntentResultUIAvailableResource initWithDefinition:resolvedIntentDescriptor:hasSuccessResponseWithDialog:](v16, "initWithDefinition:resolvedIntentDescriptor:hasSuccessResponseWithDialog:", MEMORY[0x1E0C9AA70], v17, v9);

    objc_msgSend(v4, "resourceManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addResource:", v18);

  }
  v20.receiver = self;
  v20.super_class = (Class)WFHandleCustomIntentAction;
  -[WFAction configureResourcesForParameter:](&v20, sel_configureResourcesForParameter_, v4);

}

- (id)intentDescription
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
  void *v12;

  -[WFHandleCustomIntentAction schema](self, "schema");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CBD970]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHandleCustomIntentAction schema](self, "schema");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHandleCustomIntentAction intentDescriptor](self, "intentDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "intentClassName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v4, "_initWithIdentifier:schema:name:data:", v6, v7, v9, 0);
    objc_msgSend(v10, "_intentInstanceDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFHandleCustomIntentAction intent](self, "intent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v11 = 0;
      return v11;
    }
    -[WFHandleCustomIntentAction intent](self, "intent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_intentInstanceDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)slots
{
  void *v2;
  void *v3;
  void *v4;

  -[WFHandleCustomIntentAction codableDescription](self, "codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayOrderedAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)intentCategory
{
  void *v2;
  int64_t v3;

  -[WFHandleCustomIntentAction codableDescription](self, "codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intentCategory");

  return v3;
}

- (id)generatedIntentWithIdentifier:(id)a3 input:(id)a4 processedParameters:(id)a5 error:(id *)a6
{
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[WFHandleCustomIntentAction schema](self, "schema");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CBD970]);
    -[WFHandleCustomIntentAction schema](self, "schema");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHandleCustomIntentAction intentDescriptor](self, "intentDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "intentClassName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "_initWithIdentifier:schema:name:data:", v8, v11, v13, 0);

  }
  else
  {
    -[WFHandleCustomIntentAction intent](self, "intent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[WFHandleCustomIntentAction intentDescriptor](self, "intentDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setLaunchId:", v16);

  -[WFHandleCustomIntentAction intentDescriptor](self, "intentDescriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "extensionBundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setExtensionBundleId:", v18);

  if (a6 && !v14)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB3388];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 11, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 1, v21);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (void)startExecutingIntent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "_codableDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "metadata");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "propertyName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAction parameterStateForKey:](self, "parameterStateForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "wf_updateWithParameterState:", v15);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v16.receiver = self;
  v16.super_class = (Class)WFHandleCustomIntentAction;
  -[WFHandleIntentAction startExecutingIntent:](&v16, sel_startExecutingIntent_, v4);

}

- (id)titleForINShortcut:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  -[WFHandleIntentAction appDescriptor](self, "appDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Bridge"));

  if (v7)
  {
    -[WFAction localizedName](self, "localizedName");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFHandleCustomIntentAction;
    -[WFHandleIntentAction titleForINShortcut:](&v11, sel_titleForINShortcut_, v4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (id)createBundleAccessGrant
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFHandleCustomIntentAction intentDescriptor](self, "intentDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;

  }
  else
  {
    -[WFHandleCustomIntentAction intentDescriptor](self, "intentDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extensionBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v8 = 0;
      return v8;
    }
  }
  objc_msgSend(MEMORY[0x1E0CBD788], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "grantForBundleIdentifier:error:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)codableDescription
{
  void *v3;
  INIntentCodableDescription *codableDescription;
  INIntentCodableDescription *v5;
  INIntentCodableDescription *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  INIntentCodableDescription *v11;

  -[WFHandleCustomIntentAction schema](self, "schema");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    codableDescription = self->_codableDescription;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (INIntentCodableDescription *)objc_claimAutoreleasedReturnValue();

    if (codableDescription == v5)
    {
      v7 = 0;
      goto LABEL_13;
    }
    if (!codableDescription)
    {
      -[WFHandleCustomIntentAction schema](self, "schema");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHandleCustomIntentAction intentDescriptor](self, "intentDescriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "intentClassName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "intentCodableDescriptionWithIntentClassName:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v11 = v7;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v11 = (INIntentCodableDescription *)objc_claimAutoreleasedReturnValue();
      }
      codableDescription = self->_codableDescription;
      self->_codableDescription = v11;
      goto LABEL_13;
    }
    v6 = codableDescription;
    codableDescription = v6;
LABEL_7:
    v7 = v6;
LABEL_13:

    return v7;
  }
  -[WFHandleCustomIntentAction intent](self, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFHandleCustomIntentAction intent](self, "intent");
    codableDescription = (INIntentCodableDescription *)objc_claimAutoreleasedReturnValue();
    -[INIntentCodableDescription _codableDescription](codableDescription, "_codableDescription");
    v6 = (INIntentCodableDescription *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  return v7;
}

- (id)responseCodableDescription
{
  INIntentResponseCodableDescription *responseCodableDescription;
  INIntentResponseCodableDescription *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  INIntentResponseCodableDescription *v9;

  responseCodableDescription = self->_responseCodableDescription;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (INIntentResponseCodableDescription *)objc_claimAutoreleasedReturnValue();

  if (responseCodableDescription == v4)
  {
    v5 = 0;
  }
  else if (responseCodableDescription)
  {
    responseCodableDescription = responseCodableDescription;
    v5 = responseCodableDescription;
  }
  else
  {
    -[WFHandleCustomIntentAction schema](self, "schema");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHandleCustomIntentAction intentDescriptor](self, "intentDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intentClassName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "intentResponseCodableDescriptionWithIntentClassName:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v9 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (INIntentResponseCodableDescription *)objc_claimAutoreleasedReturnValue();
    }
    responseCodableDescription = self->_responseCodableDescription;
    self->_responseCodableDescription = v9;
  }

  return v5;
}

- (BOOL)isDiscontinued
{
  void *v2;
  char v3;

  -[WFHandleCustomIntentAction codableDescription](self, "codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDeprecated");

  return v3;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;

  v4 = a3;
  -[WFAction definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "localize:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFHandleCustomIntentAction createBundleAccessGrant](self, "createBundleAccessGrant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "acquire");
    -[WFHandleCustomIntentAction codableDescription](self, "codableDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringLocalizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedTitleWithLocalizer:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "relinquish");
    if (v11)
    {
      v12 = v11;
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)WFHandleCustomIntentAction;
      -[WFHandleIntentAction localizedNameWithContext:](&v14, sel_localizedNameWithContext_, v4);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v12;

  }
  return v7;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFHandleCustomIntentAction;
  -[WFAction localizedDescriptionSummaryWithContext:](&v13, sel_localizedDescriptionSummaryWithContext_, v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[WFHandleCustomIntentAction createBundleAccessGrant](self, "createBundleAccessGrant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "acquire");
    -[WFHandleCustomIntentAction codableDescription](self, "codableDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringLocalizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedDescriptiveTextWithLocalizer:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = &stru_1E7AFA810;
    if (v9)
      v11 = (__CFString *)v9;
    v5 = v11;

    objc_msgSend(v6, "relinquish");
  }

  return v5;
}

- (id)localizedKeyParameterDisplayName
{
  NSString *localizedKeyParameterDisplayName;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;

  localizedKeyParameterDisplayName = self->_localizedKeyParameterDisplayName;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (localizedKeyParameterDisplayName == v4)
  {
    v5 = 0;
  }
  else if (localizedKeyParameterDisplayName)
  {
    localizedKeyParameterDisplayName = localizedKeyParameterDisplayName;
    v5 = localizedKeyParameterDisplayName;
  }
  else
  {
    -[WFHandleCustomIntentAction createBundleAccessGrant](self, "createBundleAccessGrant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "acquire");
    -[WFHandleCustomIntentAction codableDescription](self, "codableDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyAttribute");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHandleIntentAction stringLocalizer](self, "stringLocalizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedDisplayNameWithLocalizer:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "relinquish");
    if (v5)
    {
      v10 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    localizedKeyParameterDisplayName = self->_localizedKeyParameterDisplayName;
    self->_localizedKeyParameterDisplayName = v10;
  }

  return v5;
}

- (id)parameterDefinitions
{
  NSArray *parameterDefinitions;
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  WFParameterDefinition *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  WFParameterDefinition *v21;
  NSArray *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _QWORD v31[4];
  _QWORD v32[4];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
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
    v30.receiver = self;
    v30.super_class = (Class)WFHandleCustomIntentAction;
    -[WFAction parameterDefinitions](&v30, sel_parameterDefinitions);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      parameterDefinitions = 0;
      v5 = v6;
    }
    else
    {
      -[WFAction definition](self, "definition");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("ParameterOverrides"));
      v8 = objc_claimAutoreleasedReturnValue();

      -[WFHandleCustomIntentAction createBundleAccessGrant](self, "createBundleAccessGrant");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "acquire");
      -[WFHandleCustomIntentAction codableDescription](self, "codableDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_opt_new();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v24 = v10;
      v25 = (void *)v8;
      objc_msgSend(v10, "wf_actionParameterDefinitionsWithOverrides:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v27;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v27 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v15++));
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
        }
        while (v13);
      }

      if (-[WFHandleCustomIntentAction intentCategory](self, "intentCategory") != 4)
      {
        v16 = [WFParameterDefinition alloc];
        v32[0] = CFSTR("ShowWhenRun");
        v31[0] = CFSTR("Key");
        v31[1] = CFSTR("Class");
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v32[1] = v18;
        v32[2] = MEMORY[0x1E0C9AAB0];
        v31[2] = CFSTR("DefaultValue");
        v31[3] = CFSTR("Label");
        WFLocalizedStringResourceWithKey(CFSTR("Show When Run"), CFSTR("Show When Run"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v32[3] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[WFParameterDefinition initWithDictionary:](v16, "initWithDictionary:", v20);

        objc_msgSend(v5, "addObject:", v21);
      }
      objc_msgSend(v9, "relinquish");

      if (v5)
      {
        v22 = v5;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
      }
      parameterDefinitions = self->_parameterDefinitions;
      self->_parameterDefinitions = v22;
    }
  }

  return v5;
}

- (id)parameterSummary
{
  WFActionParameterSummary *v2;
  WFActionParameterSummary *parameterSummary;
  WFActionParameterSummary *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WFActionParameterSummary *v13;
  int v14;
  WFActionParameterSummary *v16;
  _QWORD v17[5];
  id v18;
  WFActionParameterSummary *v19;
  objc_super v20;

  parameterSummary = self->_parameterSummary;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (WFActionParameterSummary *)objc_claimAutoreleasedReturnValue();

  if (parameterSummary == v5)
    goto LABEL_19;
  if (parameterSummary)
  {
    parameterSummary = parameterSummary;
    v2 = parameterSummary;
    goto LABEL_20;
  }
  v20.receiver = self;
  v20.super_class = (Class)WFHandleCustomIntentAction;
  -[WFAction parameterSummary](&v20, sel_parameterSummary);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v2 = (WFActionParameterSummary *)v6;
    parameterSummary = 0;
    goto LABEL_20;
  }
  -[WFHandleCustomIntentAction codableDescription](self, "codableDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction definition](self, "definition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("ParameterOverrides"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFHandleCustomIntentAction schema](self, "schema");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[WFHandleCustomIntentAction schema](self, "schema");
    v2 = (WFActionParameterSummary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "className");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFActionParameterSummary _configurableParameterCombinationsForClassName:](v2, "_configurableParameterCombinationsForClassName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFHandleCustomIntentAction intent](self, "intent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_11;
    -[WFHandleCustomIntentAction intent](self, "intent");
    v2 = (WFActionParameterSummary *)objc_claimAutoreleasedReturnValue();
    -[WFActionParameterSummary _parameterCombinations](v2, "_parameterCombinations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  if (objc_msgSend(v12, "count"))
  {
    v2 = (WFActionParameterSummary *)objc_opt_new();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __46__WFHandleCustomIntentAction_parameterSummary__block_invoke;
    v17[3] = &unk_1E7AF05F8;
    v17[4] = self;
    v18 = v9;
    v13 = v2;
    v19 = v13;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v17);
    if (-[WFActionParameterSummary count](v13, "count"))
    {
      v2 = -[WFActionParameterSummary initWithValues:]([WFActionParameterSummary alloc], "initWithValues:", v13);
      v14 = 0;
    }
    else
    {
      v14 = 1;
    }

  }
  else
  {
    v14 = 1;
  }

  if (v14)
  {
    parameterSummary = 0;
LABEL_19:
    v2 = 0;
    goto LABEL_20;
  }
  if (v2)
  {
    v16 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (WFActionParameterSummary *)objc_claimAutoreleasedReturnValue();
  }
  parameterSummary = self->_parameterSummary;
  self->_parameterSummary = v16;
LABEL_20:

  return v2;
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
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSDictionary *v21;
  uint64_t v23;
  void *v24;
  objc_class *v25;
  void *v26;
  objc_super v27;
  void *v28;
  _QWORD v29[4];
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  inputDictionary = self->_inputDictionary;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  if (inputDictionary == v4)
  {
    v5 = 0;
  }
  else if (inputDictionary)
  {
    inputDictionary = inputDictionary;
    v5 = inputDictionary;
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)WFHandleCustomIntentAction;
    -[WFAction inputDictionary](&v27, sel_inputDictionary);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      inputDictionary = 0;
      v5 = v6;
    }
    else
    {
      -[WFHandleCustomIntentAction codableDescription](self, "codableDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "inputAttribute");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8 && (v10 = objc_msgSend(v8, "wf_contentItemClass")) != 0)
      {
        v25 = (objc_class *)v10;
        v23 = objc_msgSend(v9, "modifier");
        -[WFAction definition](self, "definition");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("ParameterOverrides"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "propertyName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v12;
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", CFSTR("Key"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = v15;
        }
        else
        {
          objc_msgSend(v9, "propertyName");
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        v24 = v17;

        v29[0] = CFSTR("Multiple");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23 == 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v18;
        v30[1] = MEMORY[0x1E0C9AAB0];
        v29[1] = CFSTR("Required");
        v29[2] = CFSTR("ParameterKey");
        v30[2] = v24;
        v29[3] = CFSTR("Types");
        NSStringFromClass(v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v30[3] = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
        {
          v21 = v5;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v21 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        }
        inputDictionary = self->_inputDictionary;
        self->_inputDictionary = v21;
      }
      else
      {

        inputDictionary = 0;
        v5 = (void *)MEMORY[0x1E0C9AA70];
      }
    }
  }

  return v5;
}

- (id)outputDictionary
{
  NSDictionary *outputDictionary;
  NSDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSDictionary *v19;
  objc_super v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
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
    v20.receiver = self;
    v20.super_class = (Class)WFHandleCustomIntentAction;
    -[WFAction outputDictionary](&v20, sel_outputDictionary);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHandleCustomIntentAction responseCodableDescription](self, "responseCodableDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "outputAttribute");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Types")),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          !v8)
      && (v10 = objc_msgSend(v7, "wf_contentItemClass")) != 0)
    {
      v11 = (objc_class *)v10;
      v12 = (void *)objc_msgSend(v5, "mutableCopy");
      v13 = v12;
      if (v12)
        v14 = v12;
      else
        v14 = (id)objc_opt_new();
      v15 = v14;

      v22[1] = CFSTR("Types");
      v23[0] = MEMORY[0x1E0C9AAA0];
      v22[0] = CFSTR("Multiple");
      NSStringFromClass(v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addEntriesFromDictionary:", v18);

      if (v15)
      {
        v19 = v15;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      }
      outputDictionary = self->_outputDictionary;
      self->_outputDictionary = v19;
      v5 = v15;
    }
    else
    {

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
  objc_super v10;

  v4 = a3;
  -[WFHandleCustomIntentAction responseCodableDescription](self, "responseCodableDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputAttribute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "stringLocalizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "wf_outputDisplayNameWithLocalizer:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFHandleCustomIntentAction;
    -[WFAction localizedDefaultOutputNameWithContext:](&v10, sel_localizedDefaultOutputNameWithContext_, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)disabledOnPlatforms
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFHandleCustomIntentAction;
  -[WFHandleIntentAction disabledOnPlatforms](&v3, sel_disabledOnPlatforms);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  WFIntentExecutor *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  void (**v21)(id, _QWORD, id);
  id v22;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v22 = 0;
  -[WFHandleIntentAction generatedIntentWithInput:processedParameters:error:](self, "generatedIntentWithInput:processedParameters:error:", 0, 0, &v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v22;
  v10 = v9;
  if (!v8 || v9)
  {
    v7[2](v7, 0, v9);
  }
  else
  {
    objc_msgSend(v6, "definition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("IntentSlotName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    WFEnforceClass(v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "_codableDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attributeByName:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = -[WFIntentExecutor initWithIntent:donateInteraction:groupIdentifier:]([WFIntentExecutor alloc], "initWithIntent:donateInteraction:groupIdentifier:", v8, 0, 0);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __98__WFHandleCustomIntentAction_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke;
    v19[3] = &unk_1E7AF5D38;
    v20 = v16;
    v21 = v7;
    v19[4] = self;
    v18 = v16;
    -[WFIntentExecutor getDefaultValueForParameterNamed:completionHandler:](v17, "getDefaultValueForParameterNamed:completionHandler:", v14, v19);

  }
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_get_global_queue(0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__WFHandleCustomIntentAction_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v15[3] = &unk_1E7AF0670;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  -[WFAction processParametersWithoutAskingForValuesWithInput:workQueue:completionHandler:](self, "processParametersWithoutAskingForValuesWithInput:workQueue:completionHandler:", 0, v11, v15);

}

- (id)localizedConfigurationPromptDialogForPamameter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[WFHandleIntentAction generatedIntentWithInput:processedParameters:error:](self, "generatedIntentWithInput:processedParameters:error:", 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "codableAttribute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "promptDialogWithType:", 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleIntentAction stringLocalizer](self, "stringLocalizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedDialogWithIntent:tokens:localizer:", v5, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class();
  WFEnforceClass(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "codableAttribute");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "wf_updateWithParameterValue:", v12);

  objc_msgSend(v6, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFHandleIntentAction stringLocalizer](self, "stringLocalizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_intents_readableTitleWithLocalizer:metadata:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)enumerationAllowsMultipleValues:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  v4 = objc_opt_class();
  WFEnforceClass(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "codableAttribute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "modifier") == 0;
  else
    v7 = 0;

  return v7;
}

- (id)prettyErrorForIntentsExtensionError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _QWORD *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CBDD70]);

  v7 = (_QWORD *)MEMORY[0x1E0CB3388];
  if (!v6)
  {
    objc_msgSend(v4, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("WFIntentExecutorErrorDomain")))
    {
      v10 = objc_msgSend(v4, "code");

      if (v10 == 100)
      {
        objc_msgSend(v4, "userInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", *v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "domain");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CBD400]))
        {
          v14 = objc_msgSend(v12, "code");

          if (v14 != 3006)
          {
            v22 = 0;
            goto LABEL_22;
          }
          -[WFHandleIntentAction appDescriptor](self, "appDescriptor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localizedName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "length");

          v18 = (void *)MEMORY[0x1E0CB3940];
          if (v17)
          {
            WFLocalizedString(CFSTR("The action “%1$@” could not run. Open %2$@ to continue."));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFAction localizedName](self, "localizedName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFHandleIntentAction appDescriptor](self, "appDescriptor");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "localizedName");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "localizedStringWithFormat:", v13, v19, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            WFLocalizedString(CFSTR("The action “%@” could not run. Open the app to continue."));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFAction localizedName](self, "localizedName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "localizedStringWithFormat:", v13, v19);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
          v22 = 0;
        }
LABEL_21:

LABEL_22:
        if (v22)
          goto LABEL_15;
      }
    }
    else
    {

    }
LABEL_14:
    WFLocalizedString(CFSTR("An unknown error occurred."));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  switch(objc_msgSend(v4, "code"))
  {
    case 1000:
    case 1001:
      v8 = CFSTR("The options provided were not valid.");
      break;
    case 1002:
      v8 = CFSTR("No options were provided for this parameter");
      break;
    case 1003:
      v8 = CFSTR("No default value was provided for this parameter");
      break;
    case 1004:
      objc_msgSend(v4, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", *v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    default:
      goto LABEL_14;
  }
  WFLocalizedString(v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
    goto LABEL_14;
LABEL_15:
  v23 = (void *)MEMORY[0x1E0CB35C8];
  v24 = *v7;
  v28[0] = *MEMORY[0x1E0CB2D50];
  v28[1] = v24;
  v29[0] = v22;
  v29[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("WFIntentExecutorErrorDomain"), 100, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (void)setUpResolverIfNeededForParameter:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  WFIntentDynamicResolver *v20;
  void *v21;
  WFIntentDynamicResolver *v22;
  WFIntentDynamicResolver *dynamicResolver;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  WFHandleCustomIntentAction *v28;
  id v29;

  v6 = a3;
  v7 = a4;
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __84__WFHandleCustomIntentAction_setUpResolverIfNeededForParameter_withCompletionBlock___block_invoke;
  v27 = &unk_1E7AF76F0;
  v28 = self;
  v8 = v7;
  v29 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(&v24);
  -[WFHandleCustomIntentAction dynamicResolver](self, "dynamicResolver", v24, v25, v26, v27, v28);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_5;
  v11 = (void *)v10;
  -[WFHandleCustomIntentAction dynamicResolver](self, "dynamicResolver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "intentKeyPathToResolve");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if ((v15 & 1) == 0)
  {
LABEL_5:
    -[WFHandleCustomIntentAction dynamicResolver](self, "dynamicResolver");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "endSession");

    v20 = [WFIntentDynamicResolver alloc];
    objc_msgSend(v6, "key");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[WFIntentDynamicResolver initWithIntentKeyPathToResolve:dataSource:](v20, "initWithIntentKeyPathToResolve:dataSource:", v21, self);
    dynamicResolver = self->_dynamicResolver;
    self->_dynamicResolver = v22;

    goto LABEL_6;
  }
  -[WFHandleCustomIntentAction dynamicResolver](self, "dynamicResolver");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "state");

  if (v17 != 1)
  {
LABEL_6:
    v9[2](v9);
    goto LABEL_7;
  }
  -[WFHandleCustomIntentAction dynamicResolver](self, "dynamicResolver");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))v8 + 2))(v8, v18, 0);

LABEL_7:
}

- (void)generateSkeletonIntentForDynamicResolver:(id)a3 withCompletionBlock:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  dispatch_get_global_queue(0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__WFHandleCustomIntentAction_generateSkeletonIntentForDynamicResolver_withCompletionBlock___block_invoke;
  v8[3] = &unk_1E7AF5D68;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[WFAction processParametersWithoutAskingForValuesWithInput:workQueue:completionHandler:](self, "processParametersWithoutAskingForValuesWithInput:workQueue:completionHandler:", 0, v6, v8);

}

- (void)resolveOptionsForUserInput:(id)a3 forDynamicResolveParameter:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFHandleCustomIntentAction lastDynamicResolutionRequest](self, "lastDynamicResolutionRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cancel");

  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95__WFHandleCustomIntentAction_resolveOptionsForUserInput_forDynamicResolveParameter_completion___block_invoke;
  v14[3] = &unk_1E7AF06C0;
  objc_copyWeak(&v17, &location);
  v12 = v10;
  v16 = v12;
  v13 = v8;
  v15 = v13;
  -[WFHandleCustomIntentAction setUpResolverIfNeededForParameter:withCompletionBlock:](self, "setUpResolverIfNeededForParameter:withCompletionBlock:", v9, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)localizedDisambiguationPromptForItems:(id)a3 intent:(id)a4 dynamicResolveParameter:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(a5, "codableAttribute");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[WFHandleIntentAction localizedDisambiguationPromptForAttribute:intent:disambiguationItems:completion:](self, "localizedDisambiguationPromptForAttribute:intent:disambiguationItems:completion:", v13, v11, v12, v10);

}

- (void)dynamicResolveParameterDidEndResolutionSession:(id)a3
{
  id v3;

  -[WFHandleCustomIntentAction dynamicResolver](self, "dynamicResolver", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endSession");

}

- (id)intentDescriptor
{
  return self->_intentDescriptor;
}

- (void)setIntentDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_intentDescriptor, a3);
}

- (INSchema)schema
{
  return self->_schema;
}

- (INIntent)intent
{
  return self->_intent;
}

- (WFIntentDynamicResolver)dynamicResolver
{
  return self->_dynamicResolver;
}

- (WFIntentDynamicResolutionRequest)lastDynamicResolutionRequest
{
  return self->_lastDynamicResolutionRequest;
}

- (void)setLastDynamicResolutionRequest:(id)a3
{
  objc_storeStrong((id *)&self->_lastDynamicResolutionRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDynamicResolutionRequest, 0);
  objc_storeStrong((id *)&self->_dynamicResolver, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_intentDescriptor, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_outputDictionary, 0);
  objc_storeStrong((id *)&self->_inputDictionary, 0);
  objc_storeStrong((id *)&self->_parameterSummary, 0);
  objc_storeStrong((id *)&self->_parameterDefinitions, 0);
  objc_storeStrong((id *)&self->_localizedKeyParameterDisplayName, 0);
  objc_storeStrong((id *)&self->_responseCodableDescription, 0);
  objc_storeStrong((id *)&self->_codableDescription, 0);
}

void __95__WFHandleCustomIntentAction_resolveOptionsForUserInput_forDynamicResolveParameter_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v8, "resolveWithUserInput:completionBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setLastDynamicResolutionRequest:", v7);

  }
}

uint64_t __91__WFHandleCustomIntentAction_generateSkeletonIntentForDynamicResolver_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "generatePopulatedIntentFromInput:processedParameters:completion:", 0, a2, *(_QWORD *)(a1 + 40));
}

void __84__WFHandleCustomIntentAction_setUpResolverIfNeededForParameter_withCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "dynamicResolver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __84__WFHandleCustomIntentAction_setUpResolverIfNeededForParameter_withCompletionBlock___block_invoke_2;
  v3[3] = &unk_1E7AF0698;
  objc_copyWeak(&v5, &location);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "beginSessionWithCompletionBlock:", v3);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __84__WFHandleCustomIntentAction_setUpResolverIfNeededForParameter_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "dynamicResolver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v6, v4);

}

void __92__WFHandleCustomIntentAction_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __92__WFHandleCustomIntentAction_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2;
    v9[3] = &unk_1E7AF0648;
    v13 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 32);
    v11 = v7;
    v12 = v8;
    objc_msgSend(v6, "generatePopulatedIntentFromInput:processedParameters:completion:", a3, a2, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __92__WFHandleCustomIntentAction_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  WFIntentExecutor *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v5 = a2;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "definition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("IntentSlotName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    WFEnforceClass(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "_codableDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributeByName:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[WFIntentExecutor initWithIntent:donateInteraction:groupIdentifier:]([WFIntentExecutor alloc], "initWithIntent:donateInteraction:groupIdentifier:", v5, 0, 0);
    v13 = *(_QWORD *)(a1 + 40);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __92__WFHandleCustomIntentAction_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_3;
    v16[3] = &unk_1E7AF1590;
    v14 = *(id *)(a1 + 56);
    v17 = v11;
    v18 = v14;
    v16[4] = *(_QWORD *)(a1 + 48);
    v15 = v11;
    -[WFIntentExecutor getDynamicOptionsForParameterNamed:searchTerm:completionHandler:](v12, "getDynamicOptionsForParameterNamed:searchTerm:completionHandler:", v9, v13, v16);

  }
}

void __92__WFHandleCustomIntentAction_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  if (a3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "prettyErrorForIntentsExtensionError:");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v9);

  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __92__WFHandleCustomIntentAction_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_4;
    v10[3] = &unk_1E7AF0620;
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 32);
    v11 = v6;
    v12 = v7;
    objc_msgSend(a2, "wf_mapObjectsUsingBlock:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

WFCodableAttributeBackedSubstitutableState *__92__WFHandleCustomIntentAction_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  WFCodableAttributeBackedSubstitutableState *v4;
  uint64_t v5;
  void *v6;
  WFCodableAttributeBackedSubstitutableState *v7;

  v3 = a2;
  v4 = [WFCodableAttributeBackedSubstitutableState alloc];
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "stringLocalizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFCodableAttributeBackedSubstitutableState initWithValue:codableAttribute:stringLocalizer:](v4, "initWithValue:codableAttribute:stringLocalizer:", v3, v5, v6);

  return v7;
}

void __98__WFHandleCustomIntentAction_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  WFCodableAttributeBackedSubstitutableState *v9;
  uint64_t v10;
  void *v11;
  WFCodableAttributeBackedSubstitutableState *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CBDD70]) & 1) != 0)
    {
      v8 = objc_msgSend(v6, "code");

      if (v8 == 1003)
        goto LABEL_4;
    }
    else
    {

    }
    v13 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "prettyErrorForIntentsExtensionError:", v6);
    v12 = (WFCodableAttributeBackedSubstitutableState *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, WFCodableAttributeBackedSubstitutableState *))(v13 + 16))(v13, 0, v12);
    goto LABEL_10;
  }
LABEL_4:
  if (v16)
  {
    v9 = [WFCodableAttributeBackedSubstitutableState alloc];
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "stringLocalizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WFCodableAttributeBackedSubstitutableState initWithValue:codableAttribute:stringLocalizer:](v9, "initWithValue:codableAttribute:stringLocalizer:", v16, v10, v11);

  }
  else
  {
    v12 = 0;
  }
  v14 = *(_QWORD *)(a1 + 48);
  -[WFCodableAttributeBackedSubstitutableState serializedRepresentation](v12, "serializedRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v14 + 16))(v14, v15, 0);

LABEL_10:
}

void __46__WFHandleCustomIntentAction_parameterSummary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  WFActionParameterSummaryValue *v24;
  id v25;
  id v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = a1;
  objc_msgSend(*(id *)(a1 + 32), "stringLocalizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedTitleFormatStringWithLocalizer:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (v11)
  {
    v12 = v7;
    v25 = v6;
    v26 = v5;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v5;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(*(id *)(v8 + 40), "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKey:", CFSTR("Key"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("${%@}"), v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("${%@}"), v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", v20, v21, 0, 0, objc_msgSend(v11, "length"));
            objc_msgSend(v12, "addObject:", v19);

          }
          else
          {
            objc_msgSend(v12, "addObject:", v17);
          }

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v14);
    }

    v7 = v12;
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(","));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(void **)(v8 + 48);
    v24 = -[WFActionParameterSummaryValue initWithKey:localizedSummaryString:]([WFActionParameterSummaryValue alloc], "initWithKey:localizedSummaryString:", v22, v11);
    objc_msgSend(v23, "addObject:", v24);

    v6 = v25;
    v5 = v26;
  }

}

WFResourceNode *__52__WFHandleCustomIntentAction_generatedResourceNodes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFResourceNode *v3;

  v2 = a2;
  v3 = -[WFResourceNode initWithResource:]([WFResourceNode alloc], "initWithResource:", v2);

  return v3;
}

void __38__WFHandleCustomIntentAction_resolver__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)resolver_resolver;
  resolver_resolver = v0;

  v2 = (void *)MEMORY[0x1E0CBD760];
  v5 = *MEMORY[0x1E0CBD390];
  v6[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "optionsWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)resolver_resolver, "setOptions:", v4);
}

void __97__WFHandleCustomIntentAction_initWithIdentifier_definition_serializedParameters_stringLocalizer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "initWithIdentifier:definition:serializedParameters:schema:intent:resolvedIntentDescriptor:stringLocalizer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
