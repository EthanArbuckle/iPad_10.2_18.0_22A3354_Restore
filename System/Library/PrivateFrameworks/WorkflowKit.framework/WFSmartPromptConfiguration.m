@implementation WFSmartPromptConfiguration

- (WFSmartPromptConfiguration)initWithSmartPromptStates:(id)a3 attributionSet:(id)a4 previousAttributions:(id)a5 contentItemCache:(id)a6 action:(id)a7 contentDestination:(id)a8 reference:(id)a9 workflowName:(id)a10 source:(id)a11 isWebpageCoercion:(BOOL)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  WFSmartPromptConfiguration *v23;
  WFSmartPromptConfiguration *v24;
  NSString *requestType;
  uint64_t v26;
  NSString *actionUUID;
  WFDeletionAuthorizationState *deletionAuthorizationState;
  void *v29;
  void *v30;
  WFSmartPromptConfiguration *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSData *archivedSourceContentCollection;
  uint64_t v40;
  WFContentCollection *cachedSourceContentCollection;
  uint64_t v42;
  NSString *localizedPrompt;
  uint64_t v44;
  NSString *localizedSubtitle;
  NSObject *v46;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  _QWORD v55[5];
  _QWORD v56[4];
  id v57;
  objc_super v58;
  __int128 buf;
  uint64_t v60;
  char v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v54 = a4;
  v53 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v52 = a9;
  v22 = a10;
  v50 = a11;
  v58.receiver = self;
  v58.super_class = (Class)WFSmartPromptConfiguration;
  v23 = -[WFWorkflowAuthorizationConfiguration init](&v58, sel_init);
  v24 = v23;
  if (v23)
  {
    requestType = v23->_requestType;
    v23->_requestType = (NSString *)CFSTR("SmartPrompt");

    objc_storeStrong((id *)&v24->_requestSource, a11);
    objc_msgSend(v20, "UUID");
    v26 = objc_claimAutoreleasedReturnValue();
    actionUUID = v24->_actionUUID;
    v24->_actionUUID = (NSString *)v26;

    objc_storeStrong((id *)&v24->_smartPromptStates, a3);
    deletionAuthorizationState = v24->_deletionAuthorizationState;
    v24->_deletionAuthorizationState = 0;

    objc_storeStrong((id *)&v24->_workflowReference, a9);
    v29 = v22;
    if (!v22)
    {
      objc_msgSend(v52, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v24->_workflowName, v29);
    if (!v22)

    if (objc_msgSend(v21, "promptingBehaviour") == 2)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = (void *)MEMORY[0x1E0C99E40];
      objc_msgSend(v54, "attributions");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "if_flatMap:", &__block_literal_global_35958);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "orderedSetWithArray:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __183__WFSmartPromptConfiguration_initWithSmartPromptStates_attributionSet_previousAttributions_contentItemCache_action_contentDestination_reference_workflowName_source_isWebpageCoercion___block_invoke_2;
      v56[3] = &unk_1E7AF23C8;
      v57 = v19;
      objc_msgSend(v35, "if_compactMap:", v56);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "array");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0D13EA8], "collectionWithItems:", v30);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36F8], "wf_securelyArchivedDataWithRootObject:", v37);
    v38 = objc_claimAutoreleasedReturnValue();
    archivedSourceContentCollection = v24->_archivedSourceContentCollection;
    v24->_archivedSourceContentCollection = (NSData *)v38;

    if (v24->_archivedSourceContentCollection)
    {
      v40 = objc_msgSend(v37, "copy");
      cachedSourceContentCollection = v24->_cachedSourceContentCollection;
      v24->_cachedSourceContentCollection = (WFContentCollection *)v40;

      LOBYTE(v48) = a12;
      +[WFSmartPromptStringGenerator localizedPromptForWorkflowName:attributionSet:contentCollection:contentItemCache:contentDestination:action:isWebpageCoercion:](WFSmartPromptStringGenerator, "localizedPromptForWorkflowName:attributionSet:contentCollection:contentItemCache:contentDestination:action:isWebpageCoercion:", v22, v54, v24->_cachedSourceContentCollection, v19, v21, v20, v48);
      v42 = objc_claimAutoreleasedReturnValue();
      localizedPrompt = v24->_localizedPrompt;
      v24->_localizedPrompt = (NSString *)v42;

      LOBYTE(v49) = a12;
      +[WFSmartPromptStringGenerator localizedSubtitleForWorkflowName:attributionSet:previousAttributions:contentItemCache:contentDestination:action:isWebpageCoercion:](WFSmartPromptStringGenerator, "localizedSubtitleForWorkflowName:attributionSet:previousAttributions:contentItemCache:contentDestination:action:isWebpageCoercion:", v22, v54, v53, v19, v21, v20, v49);
      v44 = objc_claimAutoreleasedReturnValue();
      localizedSubtitle = v24->_localizedSubtitle;
      v24->_localizedSubtitle = (NSString *)v44;

      if (objc_msgSend(v37, "numberOfItems") < 1)
      {
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v60 = 0x2020000000;
        v61 = 1;
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __183__WFSmartPromptConfiguration_initWithSmartPromptStates_attributionSet_previousAttributions_contentItemCache_action_contentDestination_reference_workflowName_source_isWebpageCoercion___block_invoke_133;
        v55[3] = &unk_1E7AF23F0;
        v55[4] = &buf;
        objc_msgSend(v51, "enumerateObjectsUsingBlock:", v55);
        v24->_isSpecialRequest = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24);
        _Block_object_dispose(&buf, 8);
      }
      else
      {
        v24->_isSpecialRequest = 0;
      }
      v31 = v24;
    }
    else
    {
      getWFGeneralLogObject();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = "-[WFSmartPromptConfiguration initWithSmartPromptStates:attributionSet:previousAt"
                                        "tributions:contentItemCache:action:contentDestination:reference:workflowName:sou"
                                        "rce:isWebpageCoercion:]";
        _os_log_impl(&dword_1C15B3000, v46, OS_LOG_TYPE_FAULT, "%s Unable to archive smart prompt source content collection", (uint8_t *)&buf, 0xCu);
      }

      v31 = 0;
    }

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (WFSmartPromptConfiguration)initWithDeletionAuthorizationState:(id)a3 contentCollection:(id)a4 action:(id)a5 reference:(id)a6 source:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  WFSmartPromptConfiguration *v18;
  WFSmartPromptConfiguration *v19;
  NSString *requestType;
  uint64_t v21;
  NSString *actionUUID;
  NSArray *smartPromptStates;
  NSString *v24;
  Class v25;
  Class v26;
  NSObject *v27;
  WFSmartPromptConfiguration *v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSString *localizedPrompt;
  uint64_t v38;
  NSData *archivedSourceContentCollection;
  uint64_t v40;
  WFContentCollection *cachedSourceContentCollection;
  NSObject *v42;
  id v44;
  id v45;
  objc_super v46;
  uint8_t buf[4];
  const char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v46.receiver = self;
  v46.super_class = (Class)WFSmartPromptConfiguration;
  v18 = -[WFWorkflowAuthorizationConfiguration init](&v46, sel_init);
  v19 = v18;
  if (v18)
  {
    requestType = v18->_requestType;
    v18->_requestType = (NSString *)CFSTR("DeletionAuthorization");

    objc_storeStrong((id *)&v19->_requestSource, a7);
    objc_msgSend(v15, "UUID");
    v21 = objc_claimAutoreleasedReturnValue();
    actionUUID = v19->_actionUUID;
    v19->_actionUUID = (NSString *)v21;

    objc_storeStrong((id *)&v19->_deletionAuthorizationState, a3);
    objc_storeStrong((id *)&v19->_workflowReference, a6);
    smartPromptStates = v19->_smartPromptStates;
    v19->_smartPromptStates = 0;

    objc_msgSend(v13, "contentItemClassName");
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (-[NSString length](v24, "length"))
    {
      v25 = NSClassFromString(v24);
      if (v25)
      {
        v26 = v25;
        v44 = v17;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[objc_class localizedCountDescriptionWithValue:](v26, "localizedCountDescriptionWithValue:", objc_msgSend(v14, "numberOfItems"));
          v27 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v30 = (void *)MEMORY[0x1E0CB3940];
          -[objc_class countDescription](v26, "countDescription");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "localizedStringWithFormat:", v31, objc_msgSend(v14, "numberOfItems"));
          v27 = objc_claimAutoreleasedReturnValue();

        }
        v32 = (void *)MEMORY[0x1E0CB3940];
        WFLocalizedString(CFSTR("Allow “%1$@” to delete %2$@?"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v16;
        objc_msgSend(v16, "name");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject localizedLowercaseString](v27, "localizedLowercaseString");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "localizedStringWithFormat:", v33, v34, v35);
        v36 = objc_claimAutoreleasedReturnValue();
        localizedPrompt = v19->_localizedPrompt;
        v19->_localizedPrompt = (NSString *)v36;

        objc_msgSend(MEMORY[0x1E0CB36F8], "wf_securelyArchivedDataWithRootObject:", v14);
        v38 = objc_claimAutoreleasedReturnValue();
        archivedSourceContentCollection = v19->_archivedSourceContentCollection;
        v19->_archivedSourceContentCollection = (NSData *)v38;

        if (v19->_archivedSourceContentCollection)
        {
          v40 = objc_msgSend(v14, "copy");
          cachedSourceContentCollection = v19->_cachedSourceContentCollection;
          v19->_cachedSourceContentCollection = (WFContentCollection *)v40;

          v19->_isSpecialRequest = 0;
          v28 = v19;
          v17 = v44;
          v16 = v45;
        }
        else
        {
          getWFGeneralLogObject();
          v42 = objc_claimAutoreleasedReturnValue();
          v17 = v44;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315138;
            v48 = "-[WFSmartPromptConfiguration initWithDeletionAuthorizationState:contentCollection:action:reference:source:]";
            _os_log_impl(&dword_1C15B3000, v42, OS_LOG_TYPE_FAULT, "%s Unable to archive deletion prompt content collection", buf, 0xCu);
          }

          v28 = 0;
          v16 = v45;
        }
        goto LABEL_19;
      }
      getWFSecurityLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "-[WFSmartPromptConfiguration initWithDeletionAuthorizationState:contentCollection:action:reference:source:]";
        v29 = "%s Failed to init contentItemClass from name";
        goto LABEL_11;
      }
    }
    else
    {
      getWFSecurityLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "-[WFSmartPromptConfiguration initWithDeletionAuthorizationState:contentCollection:action:reference:source:]";
        v29 = "%s No contentItemClassName in WFDeletionAuthorizationState";
LABEL_11:
        _os_log_impl(&dword_1C15B3000, v27, OS_LOG_TYPE_FAULT, v29, buf, 0xCu);
      }
    }
    v28 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v28 = 0;
LABEL_20:

  return v28;
}

- (WFSmartPromptConfiguration)initWithOutputContentCollection:(id)a3 reference:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFSmartPromptConfiguration *v11;
  WFSmartPromptConfiguration *v12;
  NSString *requestType;
  WFDeletionAuthorizationState *deletionAuthorizationState;
  NSArray *smartPromptStates;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *localizedPrompt;
  uint64_t v23;
  NSData *archivedSourceContentCollection;
  uint64_t v25;
  WFContentCollection *cachedSourceContentCollection;
  WFSmartPromptConfiguration *v27;
  NSObject *v28;
  objc_super v30;
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)WFSmartPromptConfiguration;
  v11 = -[WFWorkflowAuthorizationConfiguration init](&v30, sel_init);
  v12 = v11;
  if (v11)
  {
    requestType = v11->_requestType;
    v11->_requestType = (NSString *)CFSTR("SmartPrompt");

    objc_storeStrong((id *)&v12->_requestSource, a5);
    deletionAuthorizationState = v12->_deletionAuthorizationState;
    v12->_deletionAuthorizationState = 0;

    objc_storeStrong((id *)&v12->_workflowReference, a4);
    smartPromptStates = v12->_smartPromptStates;
    v12->_smartPromptStates = 0;

    +[WFSmartPromptStringGenerator localizedOutputContentDescriptionWithContentCollection:](WFSmartPromptStringGenerator, "localizedOutputContentDescriptionWithContentCollection:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("Allow “%1$@” to output %2$@?"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedLowercaseString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringWithFormat:", v18, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    localizedPrompt = v12->_localizedPrompt;
    v12->_localizedPrompt = (NSString *)v21;

    objc_msgSend(MEMORY[0x1E0CB36F8], "wf_securelyArchivedDataWithRootObject:", v8);
    v23 = objc_claimAutoreleasedReturnValue();
    archivedSourceContentCollection = v12->_archivedSourceContentCollection;
    v12->_archivedSourceContentCollection = (NSData *)v23;

    if (v12->_archivedSourceContentCollection)
    {
      v25 = objc_msgSend(v8, "copy");
      cachedSourceContentCollection = v12->_cachedSourceContentCollection;
      v12->_cachedSourceContentCollection = (WFContentCollection *)v25;

      v12->_isSpecialRequest = 0;
      v27 = v12;
    }
    else
    {
      getWFGeneralLogObject();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v32 = "-[WFSmartPromptConfiguration initWithOutputContentCollection:reference:source:]";
        _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_FAULT, "%s Unable to archive output smart prompt content collection", buf, 0xCu);
      }

      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)authorizationDialogRequestWithAttribution:(id)a3
{
  id v4;
  WFSmartPromptDialogRequest *v5;

  v4 = a3;
  v5 = -[WFSmartPromptDialogRequest initWithConfiguration:attribution:]([WFSmartPromptDialogRequest alloc], "initWithConfiguration:attribution:", self, v4);

  return v5;
}

- (BOOL)containsPrivatePreviews
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[WFSmartPromptConfiguration cachedSourceContentCollection](self, "cachedSourceContentCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v2, "items", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "attributionSet");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "derivedDisclosureLevel");

          if (v9 == 1)
          {
            LOBYTE(v5) = 1;
            goto LABEL_15;
          }
        }
        v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          continue;
        break;
      }
    }
  }
  else
  {
    getWFSecurityLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[WFSmartPromptConfiguration containsPrivatePreviews]";
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_FAULT, "%s Programming error: the cached content collection is not available at this time.", buf, 0xCu);
    }
    LOBYTE(v5) = 0;
  }
LABEL_15:

  return v5;
}

- (WFSmartPromptConfiguration)initWithCoder:(id)a3
{
  id v4;
  WFSmartPromptConfiguration *v5;
  uint64_t v6;
  NSString *requestType;
  uint64_t v8;
  NSString *requestSource;
  uint64_t v10;
  NSData *archivedSourceContentCollection;
  uint64_t v12;
  NSString *localizedPrompt;
  uint64_t v14;
  WFDeletionAuthorizationState *deletionAuthorizationState;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *smartPromptStates;
  uint64_t v21;
  WFWorkflowReference *workflowReference;
  uint64_t v23;
  NSString *workflowName;
  uint64_t v25;
  NSString *actionUUID;
  WFSmartPromptConfiguration *v27;
  objc_super v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)WFSmartPromptConfiguration;
  v5 = -[WFWorkflowAuthorizationConfiguration initWithCoder:](&v29, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestType"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestType = v5->_requestType;
    v5->_requestType = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestSource"));
    v8 = objc_claimAutoreleasedReturnValue();
    requestSource = v5->_requestSource;
    v5->_requestSource = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("archivedSourceContentCollection"));
    v10 = objc_claimAutoreleasedReturnValue();
    archivedSourceContentCollection = v5->_archivedSourceContentCollection;
    v5->_archivedSourceContentCollection = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedPrompt"));
    v12 = objc_claimAutoreleasedReturnValue();
    localizedPrompt = v5->_localizedPrompt;
    v5->_localizedPrompt = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deletionAuthorizationState"));
    v14 = objc_claimAutoreleasedReturnValue();
    deletionAuthorizationState = v5->_deletionAuthorizationState;
    v5->_deletionAuthorizationState = (WFDeletionAuthorizationState *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("smartPromptStates"));
    v19 = objc_claimAutoreleasedReturnValue();
    smartPromptStates = v5->_smartPromptStates;
    v5->_smartPromptStates = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workflowReference"));
    v21 = objc_claimAutoreleasedReturnValue();
    workflowReference = v5->_workflowReference;
    v5->_workflowReference = (WFWorkflowReference *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workflowName"));
    v23 = objc_claimAutoreleasedReturnValue();
    workflowName = v5->_workflowName;
    v5->_workflowName = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionUUID"));
    v25 = objc_claimAutoreleasedReturnValue();
    actionUUID = v5->_actionUUID;
    v5->_actionUUID = (NSString *)v25;

    v27 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WFSmartPromptConfiguration;
  v4 = a3;
  -[WFWorkflowAuthorizationConfiguration encodeWithCoder:](&v14, sel_encodeWithCoder_, v4);
  -[WFSmartPromptConfiguration requestType](self, "requestType", v14.receiver, v14.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("requestType"));

  -[WFSmartPromptConfiguration requestSource](self, "requestSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("requestSource"));

  -[WFSmartPromptConfiguration smartPromptStates](self, "smartPromptStates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("smartPromptStates"));

  -[WFSmartPromptConfiguration deletionAuthorizationState](self, "deletionAuthorizationState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("deletionAuthorizationState"));

  -[WFSmartPromptConfiguration workflowReference](self, "workflowReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("workflowReference"));

  -[WFSmartPromptConfiguration workflowName](self, "workflowName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("workflowName"));

  -[WFSmartPromptConfiguration actionUUID](self, "actionUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("actionUUID"));

  -[WFSmartPromptConfiguration archivedSourceContentCollection](self, "archivedSourceContentCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("archivedSourceContentCollection"));

  -[WFSmartPromptConfiguration localizedPrompt](self, "localizedPrompt");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("localizedPrompt"));

}

- (NSString)localizedPrompt
{
  return self->_localizedPrompt;
}

- (NSString)requestType
{
  return self->_requestType;
}

- (NSString)requestSource
{
  return self->_requestSource;
}

- (NSString)actionUUID
{
  return self->_actionUUID;
}

- (NSArray)smartPromptStates
{
  return self->_smartPromptStates;
}

- (WFDeletionAuthorizationState)deletionAuthorizationState
{
  return self->_deletionAuthorizationState;
}

- (WFWorkflowReference)workflowReference
{
  return self->_workflowReference;
}

- (NSString)workflowName
{
  return self->_workflowName;
}

- (BOOL)isSpecialRequest
{
  return self->_isSpecialRequest;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (NSData)archivedSourceContentCollection
{
  return self->_archivedSourceContentCollection;
}

- (WFContentCollection)cachedSourceContentCollection
{
  return self->_cachedSourceContentCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSourceContentCollection, 0);
  objc_storeStrong((id *)&self->_archivedSourceContentCollection, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_workflowName, 0);
  objc_storeStrong((id *)&self->_workflowReference, 0);
  objc_storeStrong((id *)&self->_deletionAuthorizationState, 0);
  objc_storeStrong((id *)&self->_smartPromptStates, 0);
  objc_storeStrong((id *)&self->_actionUUID, 0);
  objc_storeStrong((id *)&self->_requestSource, 0);
  objc_storeStrong((id *)&self->_requestType, 0);
  objc_storeStrong((id *)&self->_localizedPrompt, 0);
}

uint64_t __183__WFSmartPromptConfiguration_initWithSmartPromptStates_attributionSet_previousAttributions_contentItemCache_action_contentDestination_reference_workflowName_source_isWebpageCoercion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "contentItemForUUID:", a2);
}

void __183__WFSmartPromptConfiguration_initWithSmartPromptStates_attributionSet_previousAttributions_contentItemCache_action_contentDestination_reference_workflowName_source_isWebpageCoercion___block_invoke_133(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "mode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("UserWildcard")))
  {

  }
  else
  {
    objc_msgSend(v9, "mode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("ActionWildcard"));

    if ((v8 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      *a4 = 1;
    }
  }

}

id __183__WFSmartPromptConfiguration_initWithSmartPromptStates_attributionSet_previousAttributions_contentItemCache_action_contentDestination_reference_workflowName_source_isWebpageCoercion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "privateItemIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
