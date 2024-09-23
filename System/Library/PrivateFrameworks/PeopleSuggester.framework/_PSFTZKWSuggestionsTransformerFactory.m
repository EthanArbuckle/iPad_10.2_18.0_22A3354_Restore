@implementation _PSFTZKWSuggestionsTransformerFactory

- (_PSFTZKWSuggestionsTransformerFactory)init
{
  return -[_PSFTZKWSuggestionsTransformerFactory initWithInteractionStore:](self, "initWithInteractionStore:", 0);
}

- (_PSFTZKWSuggestionsTransformerFactory)initWithInteractionStore:(id)a3
{
  id v5;
  _PSFTZKWSuggestionsTransformerFactory *v6;
  _PSFTZKWSuggestionsTransformerFactory *v7;
  uint64_t v8;
  _PSContactCache *contactCache;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_PSFTZKWSuggestionsTransformerFactory;
  v6 = -[_PSFTZKWSuggestionsTransformerFactory init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_interactionStore, a3);
    +[_PSContactCache sharedInstance](_PSContactCache, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    contactCache = v7->_contactCache;
    v7->_contactCache = (_PSContactCache *)v8;

  }
  return v7;
}

- (id)formatWithSuggestion:(id)a3 bundleIdsForGroupMatching:(id)a4 checkForMessagesGroupIdentifier:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  _BOOL4 v36;
  uint64_t v37;
  _PSSuggestion *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _PSSuggestion *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _PSSuggestion *v57;
  uint64_t j;
  uint64_t v59;
  _PSSuggestion *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _PSSuggestion *v65;
  id v66;
  void *v67;
  void *v68;
  id obj;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _PSSuggestion *v79;
  uint8_t buf[4];
  uint64_t v81;
  __int16 v82;
  id v83;
  uint64_t v84;
  void *v85;
  _BYTE v86[128];
  _BYTE v87[128];
  id v88;
  id v89;
  id v90;
  _QWORD v91[4];

  v5 = a5;
  v91[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    v91[0] = 0;
    v12 = (void *)MEMORY[0x1E0C99D20];
    v13 = (id *)v91;
    goto LABEL_14;
  }
  if (!self->_interactionStore)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_PSFTZKWSuggestionsTransformerFactory formatWithSuggestion:bundleIdsForGroupMatching:checkForMessagesGroupIdentifier:].cold.1(v14);

    v90 = v8;
    v12 = (void *)MEMORY[0x1E0C99D20];
    v13 = &v90;
    goto LABEL_14;
  }
  objc_msgSend(v8, "recipients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 <= 1)
  {
    v89 = v8;
    v12 = (void *)MEMORY[0x1E0C99D20];
    v13 = &v89;
LABEL_14:
    objc_msgSend(v12, "arrayWithObjects:count:", v13, 1);
    v70 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_msgSend(v8, "conversationIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
  {
    objc_msgSend(v8, "groupName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (v17)
    {
      if (!v5
        || (objc_msgSend(v8, "messagesGroupIdentifier"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = objc_msgSend(v18, "length"),
            v18,
            v19))
      {
        v88 = v8;
        v12 = (void *)MEMORY[0x1E0C99D20];
        v13 = &v88;
        goto LABEL_14;
      }
    }
  }
  else
  {

  }
  v21 = (void *)objc_opt_new();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend(v8, "recipients");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v76;
    while (2)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v76 != v24)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        objc_msgSend(v26, "contact");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          objc_msgSend(v26, "contact");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v26, "handle");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
        }

        if (!v29)
        {
          +[_PSLogging generalChannel](_PSLogging, "generalChannel");
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            -[_PSFTZKWSuggestionsTransformerFactory formatWithSuggestion:bundleIdsForGroupMatching:checkForMessagesGroupIdentifier:].cold.2((uint64_t)v8, v34);
          v70 = (id)MEMORY[0x1E0C9AA60];
          goto LABEL_52;
        }
        objc_msgSend(v21, "addObject:", v29);

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
      if (v23)
        continue;
      break;
    }
  }

  -[_PSContactCache getMeContact](self->_contactCache, "getMeContact");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSFTZKWSuggestionsTransformerFactory interactionStore](self, "interactionStore");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v30;
  objc_msgSend(v30, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSInteractionStoreUtils mostRecentInteractionWithExactMatchingIdentifiers:store:bundleIds:meContactIdentifier:](_PSInteractionStoreUtils, "mostRecentInteractionWithExactMatchingIdentifiers:store:bundleIds:meContactIdentifier:", v21, v31, v9, v32);
  v33 = objc_claimAutoreleasedReturnValue();

  v34 = v33;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
  if (v33)
  {
    v68 = v21;
    if (v36)
    {
      *(_DWORD *)buf = 138412546;
      v81 = v33;
      v82 = 2112;
      v83 = v8;
      _os_log_impl(&dword_1A07F4000, v35, OS_LOG_TYPE_DEFAULT, "Found group interaction mapping %@ for %@", buf, 0x16u);
    }

    +[_PSInteractionStoreUtils conversationIdFromInteraction:bundleIds:](_PSInteractionStoreUtils, "conversationIdFromInteraction:bundleIds:", v33, v9);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = [_PSSuggestion alloc];
    objc_msgSend(v8, "bundleID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject groupName](v34, "groupName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recipients");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reason");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reasonType");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)v37;
    v44 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:](v38, "initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:", v39, v37, v40, v41, v42, v43);

    if (formatWithSuggestion_bundleIdsForGroupMatching_checkForMessagesGroupIdentifier___pasOnceToken7 != -1)
      dispatch_once(&formatWithSuggestion_bundleIdsForGroupMatching_checkForMessagesGroupIdentifier___pasOnceToken7, &__block_literal_global_25);
    v45 = (id)formatWithSuggestion_bundleIdsForGroupMatching_checkForMessagesGroupIdentifier___pasExprOnceResult;
    -[NSObject bundleId](v34, "bundleId");
    v46 = objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      v47 = (void *)v46;
      -[NSObject bundleId](v34, "bundleId");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v45, "containsObject:", v48);

      if (v49)
      {
        -[NSObject account](v34, "account");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSSuggestion setMessagesGroupIdentifier:](v44, "setMessagesGroupIdentifier:", v50);

      }
    }
    v79 = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
    v70 = (id)objc_claimAutoreleasedReturnValue();

LABEL_50:
    v21 = v68;
    v51 = v67;
    goto LABEL_51;
  }
  v66 = v9;
  if (v36)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v35, OS_LOG_TYPE_DEFAULT, "Could not map group suggestion to group interaction. Flattening.", buf, 2u);
  }

  v70 = (id)objc_opt_new();
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("handle"), 1);
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  objc_msgSend(v8, "recipients");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "sortedArrayUsingDescriptors:", v53);
  v44 = (_PSSuggestion *)objc_claimAutoreleasedReturnValue();

  v54 = -[_PSSuggestion countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v71, v86, 16);
  if (v54)
  {
    v55 = v54;
    v67 = v51;
    v68 = v21;
    v56 = *(_QWORD *)v72;
    do
    {
      v57 = v44;
      for (j = 0; j != v55; ++j)
      {
        if (*(_QWORD *)v72 != v56)
          objc_enumerationMutation(v57);
        v59 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
        v60 = [_PSSuggestion alloc];
        objc_msgSend(v8, "bundleID");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v59;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "reason");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "reasonType");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:](v60, "initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:", v61, 0, 0, v62, v63, v64);

        objc_msgSend(v70, "addObject:", v65);
      }
      v44 = v57;
      v55 = -[_PSSuggestion countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v71, v86, 16);
    }
    while (v55);
    v34 = 0;
    v9 = v66;
    goto LABEL_50;
  }
  v9 = v66;
LABEL_51:

LABEL_52:
LABEL_15:

  return v70;
}

- (id)formatWithBundleIdsForGroupMatching:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77___PSFTZKWSuggestionsTransformerFactory_formatWithBundleIdsForGroupMatching___block_invoke;
  v8[3] = &unk_1E4400D20;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1A1AFCBF8](v8);

  return v6;
}

- (BOOL)isEligibleRecipient:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  void *v7;
  _PSContactCache *contactCache;
  void *v9;
  unint64_t v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "handleType") == 2)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = 1;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "handle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v7;
      v15 = 1024;
      v16 = 1;
      _os_log_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_DEFAULT, "Recipient %@ is considered reachable and eligible for zkw suggestions %d", (uint8_t *)&v13, 0x12u);

    }
  }
  else
  {
    contactCache = self->_contactCache;
    objc_msgSend(v4, "handle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[_PSContactCache getFaceTimeIDSStatusForHandle:contactType:](contactCache, "getFaceTimeIDSStatusForHandle:contactType:", v9, 2);

    v6 = v10 < 2;
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "handle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v11;
      v15 = 1024;
      v16 = v10 < 2;
      v17 = 2048;
      v18 = v10;
      _os_log_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_DEFAULT, "Recipient %@ is considered reachable and eligible for zkw suggestions %d with IDS status %ld", (uint8_t *)&v13, 0x1Cu);

    }
  }

  return v6;
}

- (id)filterIDSReachable
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59___PSFTZKWSuggestionsTransformerFactory_filterIDSReachable__block_invoke;
  v3[3] = &unk_1E4400D48;
  v3[4] = self;
  return (id)MEMORY[0x1A1AFCBF8](v3, a2);
}

+ (id)getCraftedIdentfierForSuggestion:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  v3 = a3;
  objc_msgSend(v3, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(v3, "recipients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_23);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR("|"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_1E4402490;
  }

  return v9;
}

- (id)deduplicateWithSeedRecipients:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71___PSFTZKWSuggestionsTransformerFactory_deduplicateWithSeedRecipients___block_invoke;
  v7[3] = &unk_1E4400D48;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1A1AFCBF8](v7);

  return v5;
}

- (id)deduplicateWithMaxSuggestions:(unint64_t)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71___PSFTZKWSuggestionsTransformerFactory_deduplicateWithMaxSuggestions___block_invoke;
  v4[3] = &__block_descriptor_40_e26___NSArray_16__0__NSArray_8l;
  v4[4] = a3;
  return (id)MEMORY[0x1A1AFCBF8](v4, a2);
}

- (id)mapRecipientsToContactsWithUnmapped:(BOOL)a3
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke;
  v4[3] = &unk_1E4400E00;
  v4[4] = self;
  v5 = a3;
  return (id)MEMORY[0x1A1AFCBF8](v4, a2);
}

- (id)annotateWithTrialExperimentIdentifiers:(id)a3 rolloutIdentifiers:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __99___PSFTZKWSuggestionsTransformerFactory_annotateWithTrialExperimentIdentifiers_rolloutIdentifiers___block_invoke;
  v11[3] = &unk_1E4400D20;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  v9 = (void *)MEMORY[0x1A1AFCBF8](v11);

  return v9;
}

+ (id)getResultsFromTransformers:(id)a3 suggestions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count") && objc_msgSend(v6, "count"))
  {
    if (getResultsFromTransformers_suggestions___pasOnceToken19 != -1)
      dispatch_once(&getResultsFromTransformers_suggestions___pasOnceToken19, &__block_literal_global_39);
    v7 = (void *)getResultsFromTransformers_suggestions___pasExprOnceResult;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__10;
    v18 = __Block_byref_object_dispose__10;
    v19 = v6;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __80___PSFTZKWSuggestionsTransformerFactory_getResultsFromTransformers_suggestions___block_invoke_41;
    v11[3] = &unk_1E4400E50;
    v12 = v5;
    v13 = &v14;
    v8 = v6;
    v9 = v7;
    dispatch_sync(v9, v11);
    v6 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }

  return v6;
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_contactCache, 0);
}

- (void)formatWithSuggestion:(os_log_t)log bundleIdsForGroupMatching:checkForMessagesGroupIdentifier:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A07F4000, log, OS_LOG_TYPE_ERROR, "_PSFTZKWSuggestionsTransformerFactory: cannot apply format transformation if initialized without interaction store.", v1, 2u);
}

- (void)formatWithSuggestion:(uint64_t)a1 bundleIdsForGroupMatching:(NSObject *)a2 checkForMessagesGroupIdentifier:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_ERROR, "Group suggestion %@ has recipient without any identifier. Proceeding to filter out entire suggestion", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
