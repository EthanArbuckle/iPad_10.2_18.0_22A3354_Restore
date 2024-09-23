@implementation WFActionRegistry

- (id)createActionWithDonation:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "shortcut");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFActionRegistry createActionWithShortcut:error:](self, "createActionWithShortcut:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)replacementActionForDonatedIntent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  id v17;
  char isKindOfClass;
  id v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  WFActionRegistry *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  WFActionRegistry *v32;
  void *v33;
  void *v34;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD980]), "initWithIntent:", v4);
  objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolvedIntentMatchingDescriptor:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "displayableBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v4;
    v10 = v8;
    v11 = v9;
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (v11, v12 = v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v13 = objc_msgSend(v11, "preferredCallProvider");
        v14 = CFSTR("com.apple.mobilephone.call");
        if (v13 == 2)
          v14 = CFSTR("com.apple.facetime.facetime");
        v15 = v14;

LABEL_15:
        if (!v15)
        {
          objc_msgSend(v11, "typeName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(&unk_1E7B8DC70, "objectForKey:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "typeName");
          v23 = v5;
          v24 = v10;
          v25 = self;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            v27 = &unk_1E7B8DC70;
          else
            v27 = &unk_1E7B8DC98;
          objc_msgSend(v27, "objectForKey:", v26);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

          self = v25;
          v10 = v24;
          v5 = v23;
        }
        objc_msgSend(v7, "extensionBundleIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v28)
        {
          v30 = v28;
        }
        else
        {
          objc_msgSend(v7, "bundleIdentifier");
          v30 = (id)objc_claimAutoreleasedReturnValue();
        }
        v31 = v30;

        if (!v15 && v31)
        {
          if (objc_msgSend(v11, "_type") != 2)
            goto LABEL_31;
          objc_msgSend(v11, "_className");
          v32 = self;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v31, v33);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

          self = v32;
        }
        if (v15)
        {
          -[WFActionRegistry createActionWithIdentifier:serializedParameters:](self, "createActionWithIdentifier:serializedParameters:", v15, 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_msgSend(v34, "actionForAppIdentifier:", v10);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = 0;
          }

          goto LABEL_34;
        }
LABEL_31:
        v16 = 0;
LABEL_34:

        goto LABEL_35;
      }

      v17 = v12;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v15 = CFSTR("com.apple.facetime.facetime");
        goto LABEL_15;
      }
      v19 = v17;
      objc_opt_class();
      v20 = objc_opt_isKindOfClass();

      if ((v20 & 1) != 0)
      {
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.Music")) & 1) != 0)
        {
          v15 = CFSTR("is.workflow.actions.playmusic");
        }
        else if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.podcasts")))
        {
          v15 = CFSTR("is.workflow.actions.playpodcast");
        }
        else
        {
          v15 = 0;
        }
        goto LABEL_15;
      }
    }
    v15 = 0;
    goto LABEL_15;
  }
  v16 = 0;
LABEL_35:

  return v16;
}

- (id)createActionWithShortcut:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a3;
  objc_msgSend(v6, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[WFActionRegistry replacementActionForDonatedIntent:](self, "replacementActionForDonatedIntent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8
      && (objc_msgSend(v8, "serializedParametersForDonatedIntent:allowDroppingUnconfigurableValues:", v7, 1),
          (v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v11 = (void *)v10;
      v12 = (void *)objc_msgSend(v9, "copyWithSerializedParameters:", v10);
      objc_msgSend(v6, "intent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v12;
      if (v15)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v15;
        else
          v16 = 0;
      }
      else
      {
        v16 = 0;
      }
      v18 = v16;

      objc_msgSend(v18, "setOverrideLocalizedName:", v14);
    }
    else
    {
      +[WFHandleDonatedIntentAction intentActionWithShortcut:forceExecutionOnPhone:groupIdentifier:error:](WFHandleDonatedIntentAction, "intentActionWithShortcut:forceExecutionOnPhone:groupIdentifier:error:", v6, 0, 0, a4);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(v6, "userActivity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      +[WFOpenUserActivityAction userActivityActionWithShortcut:launchOrigin:error:](WFOpenUserActivityAction, "userActivityActionWithShortcut:launchOrigin:error:", v6, 0, a4);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (NSSet)identifiersOfActionsDisabledOnWatch
{
  void *v3;
  void *v4;

  if (-[WFActionRegistry state](self, "state") == 2)
  {
    -[WFActionRegistry actions](self, "actions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "if_compactMap:", &__block_literal_global_21244);
  }
  else
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "identifiersOfActionsDisabledOnWatch");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

id __72__WFActionRegistry_DisabledOnWatch__identifiersOfActionsDisabledOnWatch__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "disabledOnPlatforms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("Watch"));

  if (v4)
  {
    objc_msgSend(v2, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (WFActionRegistry)initWithClient:(unint64_t)a3
{
  WFActionRegistry *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  WFIntentActionProvider *v9;
  uint64_t v10;
  NSArray *actionProvidersForLoading;
  uint64_t v12;
  NSArray *actionProvidersForFilling;
  void *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  NSDictionary *actionsByIdentifier;
  uint64_t v23;
  NSMapTable *actionsByActionProvider;
  NSObject *v25;
  dispatch_queue_t v26;
  OS_dispatch_queue *stateAccessQueue;
  NSObject *v28;
  NSObject *v29;
  dispatch_queue_t v30;
  OS_dispatch_queue *cacheUpdateAndFillQueue;
  WFActionRegistry *v32;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)WFActionRegistry;
  v4 = -[WFActionRegistry init](&v41, sel_init);
  if (v4)
  {
    v5 = objc_opt_new();
    v6 = objc_opt_new();
    v7 = objc_opt_new();
    +[WFLinkActionProvider sharedProvider](WFLinkActionProvider, "sharedProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WFIntentActionProvider initWithOptions:]([WFIntentActionProvider alloc], "initWithOptions:", a3 == 1);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v6, v7, v5, v8, v9, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    actionProvidersForLoading = v4->_actionProvidersForLoading;
    v4->_actionProvidersForLoading = (NSArray *)v10;

    v34 = (void *)v7;
    v35 = (void *)v6;
    v36 = (void *)v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v5, v6, v7, v9, v8, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    actionProvidersForFilling = v4->_actionProvidersForFilling;
    v4->_actionProvidersForFilling = (NSArray *)v12;

    objc_msgSend(MEMORY[0x1E0CBDC38], "localizerForLanguage:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v15 = v4->_actionProvidersForFilling;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v20, "setDelegate:", v4);
          objc_msgSend(v20, "setStringLocalizer:", v14);
        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v17);
    }

    v4->_state = 0;
    v4->_client = a3;
    v21 = objc_opt_new();
    actionsByIdentifier = v4->_actionsByIdentifier;
    v4->_actionsByIdentifier = (NSDictionary *)v21;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithStrongToStrongObjects");
    v23 = objc_claimAutoreleasedReturnValue();
    actionsByActionProvider = v4->_actionsByActionProvider;
    v4->_actionsByActionProvider = (NSMapTable *)v23;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = dispatch_queue_create("com.apple.shortcuts.WFActionRegistry.stateAccessQueue", v25);
    stateAccessQueue = v4->_stateAccessQueue;
    v4->_stateAccessQueue = (OS_dispatch_queue *)v26;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v28, QOS_CLASS_USER_INITIATED, 0);
    v29 = objc_claimAutoreleasedReturnValue();

    v30 = dispatch_queue_create("com.apple.shortcuts.WFActionRegistry.cacheUpdateAndFillQueue", v29);
    cacheUpdateAndFillQueue = v4->_cacheUpdateAndFillQueue;
    v4->_cacheUpdateAndFillQueue = (OS_dispatch_queue *)v30;

    v32 = v4;
  }

  return v4;
}

- (unint64_t)state
{
  NSObject *stateAccessQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateAccessQueue = self->_stateAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__WFActionRegistry_state__block_invoke;
  v5[3] = &unk_1E7AF92E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)createActionWithIdentifier:(id)a3 serializedParameters:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionRegistry.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionIdentifier"));

  }
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v15 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[WFActionRegistry createActionsWithIdentifiers:serializedParameterArray:forceLocalActionsOnly:](self, "createActionsWithIdentifiers:serializedParameterArray:forceLocalActionsOnly:", v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  return v12;
}

- (id)createActionWithIdentifier:(id)a3 serializedParameters:(id)a4 forceLocalActionsOnly:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  id v17;
  _QWORD v18[2];

  v5 = a5;
  v18[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionRegistry.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionIdentifier"));

  }
  v18[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v17 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  -[WFActionRegistry createActionsWithIdentifiers:serializedParameterArray:forceLocalActionsOnly:](self, "createActionsWithIdentifiers:serializedParameterArray:forceLocalActionsOnly:", v11, v12, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  return v14;
}

- (id)createActionsWithIdentifiers:(id)a3 serializedParameterArray:(id)a4
{
  return -[WFActionRegistry createActionsWithIdentifiers:serializedParameterArray:forceLocalActionsOnly:](self, "createActionsWithIdentifiers:serializedParameterArray:forceLocalActionsOnly:", a3, a4, 0);
}

- (id)createActionsWithIdentifiers:(id)a3 serializedParameterArray:(id)a4 forceLocalActionsOnly:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *stateAccessQueue;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *context;
  id v28;
  os_signpost_id_t spid;
  unint64_t v30;
  id v31;
  uint8_t v32[8];
  _QWORD v33[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  WFActionRegistry *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  WFActionRegistry *v44;
  __int128 *p_buf;
  _QWORD block[7];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint8_t v51[128];
  __int128 buf;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;

  v5 = a5;
  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v31 = a4;
  if (objc_msgSend(v8, "count"))
  {
    getWFActionRegistryLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_generate(v9);

    getWFActionRegistryLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    spid = v10;
    v30 = v10 - 1;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_signpost_emit_with_name_impl(&dword_1C15B3000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CreateActions", "count=%{signpost.description:attribute}@", (uint8_t *)&buf, 0xCu);

    }
    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__22445;
    v55 = __Block_byref_object_dispose__22446;
    v56 = 0;
    stateAccessQueue = self->_stateAccessQueue;
    v15 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__WFActionRegistry_createActionsWithIdentifiers_serializedParameterArray_forceLocalActionsOnly___block_invoke;
    block[3] = &unk_1E7AF5B20;
    block[4] = self;
    block[5] = &v47;
    block[6] = &buf;
    dispatch_sync(stateAccessQueue, block);
    if (*((_BYTE *)v48 + 24))
    {
      v42[0] = v15;
      v42[1] = 3221225472;
      v42[2] = __96__WFActionRegistry_createActionsWithIdentifiers_serializedParameterArray_forceLocalActionsOnly___block_invoke_2;
      v42[3] = &unk_1E7AEF650;
      v43 = v31;
      v44 = self;
      p_buf = &buf;
      objc_msgSend(v8, "if_map:", v42);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      context = (void *)MEMORY[0x1C3BB3598]();
      v17 = (void *)objc_opt_new();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __96__WFActionRegistry_createActionsWithIdentifiers_serializedParameterArray_forceLocalActionsOnly___block_invoke_128;
      v38[3] = &unk_1E7AF9FA0;
      v39 = v31;
      v40 = self;
      v28 = v17;
      v41 = v28;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v38);
      objc_msgSend(v28, "if_objectsOfClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      -[WFActionRegistry actionProvidersForLoading](self, "actionProvidersForLoading");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v35;
LABEL_10:
        v22 = 0;
        v23 = v18;
        while (1)
        {
          if (*(_QWORD *)v35 != v21)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v22), "createActionsForRequests:forceLocalActionsOnly:", v23, v5);
          objc_msgSend(v23, "if_objectsPassingTest:", &__block_literal_global_132);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v18, "count"))
            break;
          ++v22;
          v23 = v18;
          if (v20 == v22)
          {
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
            if (v20)
              goto LABEL_10;
            break;
          }
        }
      }

      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __96__WFActionRegistry_createActionsWithIdentifiers_serializedParameterArray_forceLocalActionsOnly___block_invoke_3;
      v33[3] = &unk_1E7AEF6B8;
      v33[4] = self;
      objc_msgSend(v28, "if_map:", v33);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(context);
    }
    getWFActionRegistryLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v30 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)v32 = 0;
      _os_signpost_emit_with_name_impl(&dword_1C15B3000, v25, OS_SIGNPOST_INTERVAL_END, spid, "CreateActions", ", v32, 2u);
    }

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v47, 8);
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

- (id)replacementActionForActionIdentifier:(id)a3 serializedParameters:(id)a4
{
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v6 = a4;
  v7 = objc_msgSend(a3, "isEqualToString:", CFSTR("is.workflow.actions.sirikit.donation.handle"));
  v8 = 0;
  if (v6 && v7)
  {
    WFExtractDonatedIntentFromSerializedParameters(v6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[WFActionRegistry replacementActionForDonatedIntent:](self, "replacementActionForDonatedIntent:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "serializedParametersForDonatedIntent:allowDroppingUnconfigurableValues:", v10, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v8 = 0;
      if (v11 && v12)
        v8 = (void *)objc_msgSend(v11, "copyWithSerializedParameters:", v12);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)placeholderForActionIdentifier:(id)a3 serializedParameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  WFMissingAction *v12;
  void *v13;
  WFMissingAction *v14;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[WFActionRegistry actionProvidersForLoading](self, "actionProvidersForLoading");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__WFActionRegistry_placeholderForActionIdentifier_serializedParameters___block_invoke;
  v16[3] = &unk_1E7AEF6E0;
  v17 = v6;
  v9 = v6;
  objc_msgSend(v8, "if_compactMap:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    getWFActionRegistryLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[WFActionRegistry placeholderForActionIdentifier:serializedParameters:]";
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_ERROR, "%s Conflicting definitions for missing action", buf, 0xCu);
    }

  }
  v12 = [WFMissingAction alloc];
  objc_msgSend(v10, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WFAction initWithIdentifier:definition:serializedParameters:](v12, "initWithIdentifier:definition:serializedParameters:", v7, v13, v9);

  return v14;
}

- (NSSet)actions
{
  NSObject *stateAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22445;
  v10 = __Block_byref_object_dispose__22446;
  v11 = 0;
  stateAccessQueue = self->_stateAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__WFActionRegistry_actions__block_invoke;
  v5[3] = &unk_1E7AF92E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

- (id)actionsForAppWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[WFActionRegistry actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__WFActionRegistry_actionsForAppWithIdentifier___block_invoke;
  v9[3] = &unk_1E7AEF708;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "if_compactMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)fill
{
  NSObject *stateAccessQueue;
  _QWORD block[5];

  stateAccessQueue = self->_stateAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__WFActionRegistry_fill__block_invoke;
  block[3] = &unk_1E7AF94B0;
  block[4] = self;
  dispatch_async(stateAccessQueue, block);
}

- (void)fillActionProviders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *stateAccessQueue;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  WFActionRegistry *v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_cacheUpdateAndFillQueue);
  objc_msgSend(v4, "if_map:", &__block_literal_global_143_22430);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __40__WFActionRegistry_fillActionProviders___block_invoke_2;
  v16[3] = &unk_1E7AEF770;
  v8 = v6;
  v17 = v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v16);
  stateAccessQueue = self->_stateAccessQueue;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __40__WFActionRegistry_fillActionProviders___block_invoke_145;
  v12[3] = &unk_1E7AF55D0;
  v13 = v4;
  v14 = v8;
  v15 = self;
  v10 = v8;
  v11 = v4;
  dispatch_async(stateAccessQueue, v12);

}

- (void)setActions:(id)a3 forProvider:(id)a4
{
  id v7;
  void *v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateAccessQueue);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionRegistry.m"), 350, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("provider"));

  }
  -[WFActionRegistry actionsByActionProvider](self, "actionsByActionProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 != v14)
  {
    v10 = objc_msgSend(v9, "isEqualToSet:", v14);
    v11 = v14;
    if ((v10 & 1) == 0)
    {
      if (v9)
      {
        objc_msgSend(v9, "if_compactMap:", &__block_literal_global_150);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFActionRegistry removeActionsWithIdentifiers:fromActionProvider:](self, "removeActionsWithIdentifiers:fromActionProvider:", v12, v7);

        v11 = v14;
      }
      if (v11)
        -[WFActionRegistry addActions:fromActionProvider:](self, "addActions:fromActionProvider:", v14, v7);
    }
  }

}

- (void)removeActionsWithIdentifiers:(id)a3 fromActionProvider:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSDictionary *v25;
  NSDictionary *actionsByIdentifier;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateAccessQueue);
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionRegistry.m"), 372, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionIdentifiers"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionRegistry.m"), 373, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("provider"));

LABEL_3:
  -[WFActionRegistry actionsByActionProvider](self, "actionsByActionProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v8;
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  -[WFActionRegistry actionsByIdentifier](self, "actionsByIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = v7;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v20 = (void *)MEMORY[0x1C3BB3598]();
        objc_msgSend(v13, "objectForKeyedSubscript:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_msgSend(v13, "removeObjectForKey:", v19);
          objc_msgSend(v11, "removeObject:", v21);
        }

        objc_autoreleasePoolPop(v20);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v16);
  }

  v22 = objc_msgSend(v11, "count");
  -[WFActionRegistry actionsByActionProvider](self, "actionsByActionProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v22)
    objc_msgSend(v23, "setObject:forKey:", v11, v29);
  else
    objc_msgSend(v23, "removeObjectForKey:", v29);

  v25 = (NSDictionary *)objc_msgSend(v13, "copy");
  actionsByIdentifier = self->_actionsByIdentifier;
  self->_actionsByIdentifier = v25;

}

- (void)addActions:(id)a3 fromActionProvider:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  NSDictionary *v25;
  NSDictionary *actionsByIdentifier;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateAccessQueue);
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionRegistry.m"), 398, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actions"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionRegistry.m"), 399, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("provider"));

LABEL_3:
  -[WFActionRegistry actionsByActionProvider](self, "actionsByActionProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  v12 = v11;
  v30 = v8;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_opt_new();
  v14 = v13;

  objc_msgSend(v14, "unionSet:", v7);
  -[WFActionRegistry actionsByIdentifier](self, "actionsByIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = v7;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v23 = (void *)MEMORY[0x1C3BB3598]();
        objc_msgSend(v22, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v22, v24);

        objc_autoreleasePoolPop(v23);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v19);
  }

  v25 = (NSDictionary *)objc_msgSend(v16, "copy");
  actionsByIdentifier = self->_actionsByIdentifier;
  self->_actionsByIdentifier = v25;

  -[WFActionRegistry actionsByActionProvider](self, "actionsByActionProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKey:", v14, v30);

}

- (void)actionProviderDidChange:(id)a3 updatedActions:(id)a4 removedActions:(id)a5 addedActions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *stateAccessQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  stateAccessQueue = self->_stateAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke;
  block[3] = &unk_1E7AF2C98;
  block[4] = self;
  v20 = v12;
  v21 = v11;
  v22 = v10;
  v23 = v13;
  v15 = v13;
  v16 = v10;
  v17 = v11;
  v18 = v12;
  dispatch_async(stateAccessQueue, block);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)WFActionRegistry;
  -[WFActionRegistry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFActionRegistry actionsByIdentifier](self, "actionsByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)client
{
  return self->_client;
}

- (void)setClient:(unint64_t)a3
{
  self->_client = a3;
}

- (OS_dispatch_queue)stateAccessQueue
{
  return self->_stateAccessQueue;
}

- (OS_dispatch_queue)cacheUpdateAndFillQueue
{
  return self->_cacheUpdateAndFillQueue;
}

- (NSArray)actionProvidersForFilling
{
  return self->_actionProvidersForFilling;
}

- (NSArray)actionProvidersForLoading
{
  return self->_actionProvidersForLoading;
}

- (NSDictionary)actionsByIdentifier
{
  return self->_actionsByIdentifier;
}

- (NSMapTable)actionsByActionProvider
{
  return self->_actionsByActionProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsByActionProvider, 0);
  objc_storeStrong((id *)&self->_actionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_actionProvidersForLoading, 0);
  objc_storeStrong((id *)&self->_actionProvidersForFilling, 0);
  objc_storeStrong((id *)&self->_cacheUpdateAndFillQueue, 0);
  objc_storeStrong((id *)&self->_stateAccessQueue, 0);
}

void __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) == 2)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "count") || objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      v2 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "setByAddingObjectsFromSet:", *(_QWORD *)(a1 + 48));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "removeActionsWithIdentifiers:fromActionProvider:", v3, *(_QWORD *)(a1 + 56));

    }
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke_156;
    v8[3] = &unk_1E7AF9298;
    v9 = *(id *)(a1 + 48);
    v5 = *(id *)(a1 + 64);
    v6 = *(_QWORD *)(a1 + 32);
    v10 = v5;
    v11 = v6;
    v12 = *(id *)(a1 + 56);
    dispatch_async(v4, v8);

    v7 = v9;
  }
  else
  {
    getWFActionRegistryLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[WFActionRegistry actionProviderDidChange:updatedActions:removedActions:addedActions:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Ignoring action provider change notification because the registry is not yet filled.", buf, 0xCu);
    }
  }

}

void __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke_156(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  WFActionRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[6];
  id v16;
  _QWORD block[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "setByAddingObjectsFromSet:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = -[WFActionRequest initWithActionIdentifier:serializedParameters:]([WFActionRequest alloc], "initWithActionIdentifier:serializedParameters:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v7), 0);
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v2, "count"))
  {
    v9 = *(void **)(a1 + 56);
    objc_msgSend(v2, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createActionsForRequests:", v10);

    objc_msgSend(v2, "if_compactMap:", &__block_literal_global_158_22415);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(void **)(a1 + 56);
    v14 = *(NSObject **)(v12 + 24);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke_4;
    v15[3] = &unk_1E7AF55D0;
    v15[4] = v12;
    v15[5] = v11;
    v16 = v13;
    dispatch_async(v14, v15);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke_2;
    block[3] = &unk_1E7AF94B0;
    block[4] = *(_QWORD *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WFActionRegistryFilledNotification"), *(_QWORD *)(a1 + 32));

}

void __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke_4(uint64_t a1)
{
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "addActions:fromActionProvider:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke_5;
  block[3] = &unk_1E7AF94B0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WFActionRegistryFilledNotification"), *(_QWORD *)(a1 + 32));

}

uint64_t __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "result");
}

uint64_t __43__WFActionRegistry_setActions_forProvider___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __40__WFActionRegistry_fillActionProviders___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  getWFActionRegistryLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  getWFActionRegistryLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v11;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FillProvider", " enableTelemetry=YES provider=%{public, signpost.telemetry:string1, Name=Provider}@", (uint8_t *)&v18, 0xCu);

  }
  objc_msgSend(v5, "createAllAvailableActions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_opt_new();
  v15 = v14;

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v15, a3);
  getWFActionRegistryLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v17, OS_SIGNPOST_INTERVAL_END, v7, "FillProvider", " enableTelemetry=YES ", (uint8_t *)&v18, 2u);
  }

}

void __40__WFActionRegistry_fillActionProviders___block_invoke_145(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__WFActionRegistry_fillActionProviders___block_invoke_2_146;
  v5[3] = &unk_1E7AEF798;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

}

void __40__WFActionRegistry_fillActionProviders___block_invoke_2_146(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getWFActionRegistryLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315906;
    v9 = "-[WFActionRegistry fillActionProviders:]_block_invoke_2";
    v10 = 2048;
    v11 = objc_msgSend(v6, "count");
    v12 = 2112;
    v13 = v5;
    v14 = 2048;
    v15 = a3;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Found %lu actions for provider %@ at %lu", (uint8_t *)&v8, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 40), "setActions:forProvider:", v6, v5);
}

id __40__WFActionRegistry_fillActionProviders___block_invoke()
{
  return objc_alloc_init(MEMORY[0x1E0C99E60]);
}

void __24__WFActionRegistry_fill__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 8))
  {
    *(_QWORD *)(v1 + 8) = 1;
    objc_msgSend(MEMORY[0x1E0D13FA0], "log:", *MEMORY[0x1E0D14220]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(NSObject **)(v3 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __24__WFActionRegistry_fill__block_invoke_2;
    block[3] = &unk_1E7AF94B0;
    block[4] = v3;
    dispatch_async(v4, block);
  }
}

void __24__WFActionRegistry_fill__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[16];

  getWFActionRegistryLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  getWFActionRegistryLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "Fill", " enableTelemetry=YES ", buf, 2u);
  }

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "actionProvidersForFilling");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fillActionProviders:", v7);

  getWFActionRegistryLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v9, OS_SIGNPOST_INTERVAL_END, v3, "Fill", " enableTelemetry=YES ", buf, 2u);
  }

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__WFActionRegistry_fill__block_invoke_140;
  block[3] = &unk_1E7AF94B0;
  block[4] = v10;
  dispatch_async(v11, block);
}

void __24__WFActionRegistry_fill__block_invoke_140(uint64_t a1)
{
  _QWORD block[5];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__WFActionRegistry_fill__block_invoke_2_141;
  block[3] = &unk_1E7AF94B0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __24__WFActionRegistry_fill__block_invoke_2_141(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WFActionRegistryFilledNotification"), *(_QWORD *)(a1 + 32));

}

uint64_t __48__WFActionRegistry_actionsForAppWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "actionForAppIdentifier:", *(_QWORD *)(a1 + 32));
}

void __27__WFActionRegistry_actions__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allValues");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "initWithArray:", v6);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __72__WFActionRegistry_placeholderForActionIdentifier_serializedParameters___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "definitionForMissingActionWithSerializedParameters:", *(_QWORD *)(a1 + 32));
}

void __96__WFActionRegistry_createActionsWithIdentifiers_serializedParameterArray_forceLocalActionsOnly___block_invoke(_QWORD *a1)
{
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 8) == 2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 56));
}

id __96__WFActionRegistry_createActionsWithIdentifiers_serializedParameterArray_forceLocalActionsOnly___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  WFActionRequest *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  WFActionRequest *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "replacementActionForActionIdentifier:serializedParameters:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "copyWithSerializedParameters:", v6);

    if (!v7)
    {
      v20 = v5;
      v9 = -[WFActionRequest initWithActionIdentifier:serializedParameters:]([WFActionRequest alloc], "initWithActionIdentifier:serializedParameters:", v5, v6);
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(*(id *)(a1 + 40), "actionProvidersForLoading");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v22;
LABEL_5:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v14);
          v29 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "createActionsForRequests:", v16);

          -[WFActionRequest result](v9, "result");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
            break;
          if (v12 == ++v14)
          {
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
            if (v12)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
        -[WFActionRequest result](v9, "result");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v20;
        if (v7)
          goto LABEL_16;
      }
      else
      {
LABEL_11:

        v5 = v20;
      }
      getWFActionRegistryLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[WFActionRegistry createActionsWithIdentifiers:serializedParameterArray:forceLocalActionsOnly:]_block_invoke_2";
        v27 = 2114;
        v28 = v5;
        _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_DEFAULT, "%s Action (%{public}@) is missing", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 40), "placeholderForActionIdentifier:serializedParameters:", v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_16:

  return v7;
}

void __96__WFActionRegistry_createActionsWithIdentifiers_serializedParameterArray_forceLocalActionsOnly___block_invoke_128(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  WFActionRequest *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "replacementActionForActionIdentifier:serializedParameters:", v9, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 48);
  if (v6)
  {
    objc_msgSend(v7, "addObject:", v6);
  }
  else
  {
    v8 = -[WFActionRequest initWithActionIdentifier:serializedParameters:]([WFActionRequest alloc], "initWithActionIdentifier:serializedParameters:", v9, v5);
    objc_msgSend(v7, "addObject:", v8);

  }
}

id __96__WFActionRegistry_createActionsWithIdentifiers_serializedParameterArray_forceLocalActionsOnly___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3 || (objc_opt_class(), v4 = v3, (objc_opt_isKindOfClass() & 1) == 0))
  {

    v5 = v3;
    objc_msgSend(v5, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "result");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      getWFActionRegistryLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "actionIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 136315394;
        v14 = "-[WFActionRegistry createActionsWithIdentifiers:serializedParameterArray:forceLocalActionsOnly:]_block_invoke_3";
        v15 = 2114;
        v16 = v8;
        _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Action %{public}@ is missing", (uint8_t *)&v13, 0x16u);

      }
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v5, "actionIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serializedParameters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "placeholderForActionIdentifier:serializedParameters:", v10, v11);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v4;
}

BOOL __96__WFActionRegistry_createActionsWithIdentifiers_serializedParameterArray_forceLocalActionsOnly___block_invoke_2_130(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

uint64_t __25__WFActionRegistry_state__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

+ (id)sharedRegistry
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__WFActionRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRegistry_onceToken_22479 != -1)
    dispatch_once(&sharedRegistry_onceToken_22479, block);
  return (id)sharedRegistry_sharedRegistry_22480;
}

+ (id)toolKitRegistry
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__WFActionRegistry_toolKitRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (toolKitRegistry_onceToken != -1)
    dispatch_once(&toolKitRegistry_onceToken, block);
  return (id)toolKitRegistry_sharedRegistry;
}

void __35__WFActionRegistry_toolKitRegistry__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithClient:", 1);
  v2 = (void *)toolKitRegistry_sharedRegistry;
  toolKitRegistry_sharedRegistry = v1;

}

void __34__WFActionRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithClient:", 0);
  v2 = (void *)sharedRegistry_sharedRegistry_22480;
  sharedRegistry_sharedRegistry_22480 = v1;

}

- (id)createActionForSelectingContentOfType:(Class)a3 serializedParameters:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v14[0] = a3;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a4;
  objc_msgSend(v5, "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)MEMORY[0x1E0C9AA70];
  if (v6)
    v8 = v6;
  v13 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFActionRegistry createActionsForSelectingContentOfTypes:serializedParameterArray:](self, "createActionsForSelectingContentOfTypes:serializedParameterArray:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)createActionsForSelectingContentOfTypes:(id)a3 serializedParameterArray:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (!v8)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionRegistry+ContentSelection.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentItemClasses"));

    if (!v9)
      goto LABEL_5;
  }
  v10 = objc_msgSend(v7, "count");
  if (v10 != objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionRegistry+ContentSelection.m"), 64, CFSTR("Number of content item classes don't match number of serialized parameters passed in."));

  }
LABEL_5:
  objc_msgSend(v7, "if_compactMap:", &__block_literal_global_29997);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  if (v12 == objc_msgSend(v7, "count"))
  {
    -[WFActionRegistry createActionsWithIdentifiers:serializedParameterArray:](self, "createActionsWithIdentifiers:serializedParameterArray:", v11, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)defaultSerializedParametersForActionSelectingContentOfType:(Class)a3
{
  void *v3;
  void *v4;
  WFVariableString *v5;
  void *v6;
  WFVariableString *v7;
  WFVariableStringParameterState *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  WFActionIdentifierForSelectingContentOfType(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "isEqualToString:", CFSTR("is.workflow.actions.date")))
  {
    v12[0] = CFSTR("WFDateActionMode");
    v12[1] = CFSTR("WFDateActionDate");
    v13[0] = CFSTR("Specified Date");
    v5 = [WFVariableString alloc];
    v6 = (void *)objc_opt_new();
    v7 = -[WFVariableString initWithVariable:](v5, "initWithVariable:", v6);

    v8 = -[WFVariableStringParameterState initWithVariableString:]([WFVariableStringParameterState alloc], "initWithVariableString:", v7);
    -[WFVariableStringParameterState serializedRepresentation](v8, "serializedRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v13[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

const __CFString *__103__WFActionRegistry_ContentSelection__createActionsForSelectingContentOfTypes_serializedParameterArray___block_invoke(uint64_t a1, void *a2)
{
  return WFActionIdentifierForSelectingContentOfType(a2);
}

+ (id)supportedContentItemClassesForContentSelection
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
}

- (id)residentCompatibleActionsForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFActionRegistry actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFActionRegistry residentCompatibleActionsFromActions:inHome:](self, "residentCompatibleActionsFromActions:inHome:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)suggestionsForHome:(id)a3 includingRelatedActions:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  _QWORD v20[2];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[WFActionRegistry createActionWithIdentifier:serializedParameters:](self, "createActionWithIdentifier:serializedParameters:", CFSTR("is.workflow.actions.weather.currentconditions"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFActionRegistry createActionWithIdentifier:serializedParameters:](self, "createActionWithIdentifier:serializedParameters:", CFSTR("is.workflow.actions.conditional"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFActionRegistry createActionWithIdentifier:serializedParameters:](self, "createActionWithIdentifier:serializedParameters:", CFSTR("is.workflow.actions.delay"), 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (a4)
  {
    v21[0] = v7;
    v21[1] = v8;
    v21[2] = v9;
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = v21;
    v13 = 3;
  }
  else
  {
    v20[0] = v8;
    v20[1] = v9;
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = v20;
    v13 = 2;
  }
  objc_msgSend(v11, "arrayWithObjects:count:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __69__WFActionRegistry_Home__suggestionsForHome_includingRelatedActions___block_invoke;
  v18[3] = &unk_1E7AF3028;
  v18[4] = self;
  v19 = v6;
  v15 = v6;
  objc_msgSend(v14, "if_map:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)residentCompatibleActionsFromActions:(id)a3 inHome:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__WFActionRegistry_Home__residentCompatibleActionsFromActions_inHome___block_invoke;
  v10[3] = &unk_1E7AF3050;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a3, "if_compactMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)updatedActionForResidentCompatibility:(id)a3 inHome:(id)a4
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
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "objectForKey:", CFSTR("Parameters"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "if_map:", &__block_literal_global_38283);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = CFSTR("Parameters");
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "definitionByAddingEntriesInDictionary:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v4, "serializedParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v4, "copyWithDefinition:serializedParameters:", v10, v11);

  return v12;
}

id __71__WFActionRegistry_Home__updatedActionForResidentCompatibility_inHome___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "objectForKey:", CFSTR("DisallowedVariableTypes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_opt_new();
  v7 = v6;

  objc_msgSend(v7, "addObject:", CFSTR("Ask"));
  objc_msgSend(v7, "addObject:", CFSTR("Clipboard"));
  v11 = CFSTR("DisallowedVariableTypes");
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "definitionByAddingEntriesInDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __70__WFActionRegistry_Home__residentCompatibleActionsFromActions_inHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(v3, "isResidentCompatible"))
  {
    objc_msgSend(*(id *)(a1 + 32), "updatedActionForResidentCompatibility:inHome:", v3, *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __69__WFActionRegistry_Home__suggestionsForHome_includingRelatedActions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatedActionForResidentCompatibility:inHome:", a2, *(_QWORD *)(a1 + 40));
}

@end
