@implementation PSGNameMentionsHandler

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PSGNameMentionsHandler_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_361 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_361, block);
  return (id)sharedInstance__pasExprOnceResult_362;
}

void __40__PSGNameMentionsHandler_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1DF0B9950]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_362;
  sharedInstance__pasExprOnceResult_362 = v1;

  objc_autoreleasePoolPop(v0);
}

- (id)getNameMentionsTriggerForContext:(id)a3 recipientNames:(id)a4 availableApps:(id)a5 localeIdentifier:(id)a6 explanationSet:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t i;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  PSGProactiveTrigger *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[2];
  _QWORD v48[2];
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  unint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (getNameMentionsTriggerForContext_recipientNames_availableApps_localeIdentifier_explanationSet__once != -1)
    dispatch_once(&getNameMentionsTriggerForContext_recipientNames_availableApps_localeIdentifier_explanationSet__once, &__block_literal_global_379);
  if (objc_msgSend(v12, "count"))
  {
    if ((objc_msgSend(v13, "containsObject:", CFSTR("com.apple.messages.mentions")) & 1) == 0)
    {
      psg_default_log_handle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DBD27000, v35, OS_LOG_TYPE_ERROR, "[PSGNameMentionsHandler] Mini-app for recipientNames not available", buf, 2u);
      }

      objc_msgSend(v15, "pushInternalExplanationCode:", 2);
      goto LABEL_35;
    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v16 = v12;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v44 != v20)
            objc_enumerationMutation(v16);
          v22 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "length");
          if (v19 <= v22)
            v19 = v22;
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      }
      while (v18);

      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v14);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v11, "length");
        v25 = objc_msgSend(v11, "length");
        if (v24 <= v19)
          v26 = 0;
        else
          v26 = v25 + ~v19;
        if (v24 > v19)
          v27 = v19 + 1;
        else
          v27 = v25;
        v28 = objc_msgSend(v11, "rangeOfString:options:range:locale:", CFSTR("@"), 4, v26, v27, v23);
        v29 = v28;
        v31 = v30;
        if (v28)
        {
          if (v28 == 0x7FFFFFFFFFFFFFFFLL)
          {
            psg_default_log_handle();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1DBD27000, v32, OS_LOG_TYPE_DEBUG, "[PSGNameMentionsHandler] No @ symbol found in the input.", buf, 2u);
            }
            v33 = 0;
            goto LABEL_54;
          }
          objc_msgSend(v11, "substringWithRange:", v28 - 1, 1);
          v32 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject rangeOfCharacterFromSet:](v32, "rangeOfCharacterFromSet:", getNameMentionsTriggerForContext_recipientNames_availableApps_localeIdentifier_explanationSet__bannedPredictionCharacterSet) != 0x7FFFFFFFFFFFFFFFLL)
          {
            psg_default_log_handle();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v50 = (uint64_t)v32;
              _os_log_debug_impl(&dword_1DBD27000, v41, OS_LOG_TYPE_DEBUG, "[PSGNameMentionsHandler] Prior is %@, so this @ might be part of an email address", buf, 0xCu);
            }

            v33 = 0;
            goto LABEL_54;
          }

        }
        objc_msgSend(v11, "substringFromIndex:", v29 + v31);
        v32 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject length](v32, "length") > v19)
        {
          psg_default_log_handle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            v38 = -[NSObject length](v32, "length");
            *(_DWORD *)buf = 134218240;
            v50 = v38;
            v51 = 2048;
            v52 = v19;
            _os_log_debug_impl(&dword_1DBD27000, v37, OS_LOG_TYPE_DEBUG, "[PSGNameMentionsHandler] Prefix length %tu > maxLength %tu", buf, 0x16u);
          }
LABEL_52:
          v33 = 0;
          goto LABEL_53;
        }
        if (-[NSObject length](v32, "length"))
        {
          -[NSObject substringToIndex:](v32, "substringToIndex:", 1);
          v37 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = -[NSObject rangeOfCharacterFromSet:](v37, "rangeOfCharacterFromSet:", v39);

          if (v40 != 0x7FFFFFFFFFFFFFFFLL)
          {
            psg_default_log_handle();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1DBD27000, v42, OS_LOG_TYPE_DEBUG, "[PSGNameMentionsHandler] First charactrer of prefix is whitespace", buf, 2u);
            }

            goto LABEL_52;
          }

        }
        v47[0] = *MEMORY[0x1E0D43428];
        v47[1] = CFSTR("NamePrefix");
        v48[0] = CFSTR("NameMentions");
        v48[1] = v32;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
        v37 = objc_claimAutoreleasedReturnValue();
        v33 = -[PSGProactiveTrigger initWithSourceType:category:attributes:]([PSGProactiveTrigger alloc], "initWithSourceType:category:attributes:", 5, CFSTR("nameMentionsTriggerCategory"), v37);
LABEL_53:

LABEL_54:
        goto LABEL_36;
      }
    }
    else
    {

    }
    psg_default_log_handle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DBD27000, v34, OS_LOG_TYPE_ERROR, "[PSGNameMentionsHandler] All names are empty", buf, 2u);
    }
  }
  else
  {
    psg_default_log_handle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1DBD27000, v34, OS_LOG_TYPE_FAULT, "[PSGNameMentionsHandler] Empty recipientNames passed in", buf, 2u);
    }
  }

LABEL_35:
  v33 = 0;
LABEL_36:

  return v33;
}

- (id)getPredictedItemsForTrigger:(id)a3 recipientNames:(id)a4 bundleIdentifier:(id)a5 maxItems:(unint64_t)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  PSGOperationalPredictedItem *v29;
  id v30;
  uint64_t v31;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id obj;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _BYTE v47[128];
  void *v48;
  uint8_t buf[4];
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v40 = a5;
  objc_msgSend(v8, "triggerAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D43428]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("NameMentions")) & 1) != 0)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NamePrefix"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v34 = v11;
      v35 = v10;
      v37 = v8;
      v33 = v12;
      -[NSObject lowercaseString](v12, "lowercaseString");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("self"), 1);
      v48 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v9;
      objc_msgSend(v9, "sortedArrayUsingDescriptors:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)objc_opt_new();
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      obj = v17;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      if (v19)
      {
        v20 = v19;
        v21 = 0;
        v22 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v42 != v22)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            if (objc_msgSend(v21, "length") && objc_msgSend(v24, "hasPrefix:", v21))
            {
              psg_default_log_handle();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1DBD27000, v25, OS_LOG_TYPE_DEBUG, "Ambiguous name preferred. Skipping more specific name.", buf, 2u);
              }

            }
            else if (!-[NSObject length](v14, "length")
                   || (objc_msgSend(v24, "lowercaseString"),
                       v26 = (void *)objc_claimAutoreleasedReturnValue(),
                       v27 = objc_msgSend(v26, "hasPrefix:", v14),
                       v26,
                       v27))
            {
              v45[0] = CFSTR("name");
              v45[1] = CFSTR("bundleID");
              v46[0] = v24;
              v46[1] = CFSTR("com.apple.messages.mentions");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = -[PSGOperationalPredictedItem initWithItemIdentifier:value:bundleIdentifier:operationData:]([PSGOperationalPredictedItem alloc], "initWithItemIdentifier:value:bundleIdentifier:operationData:", CFSTR("NameMentions"), v24, v40, v28);
              objc_msgSend(v18, "addObject:", v29);
              v30 = v24;

              v31 = objc_msgSend(v18, "count");
              v21 = v30;
              if (v31 == a6)
                goto LABEL_26;
            }
          }
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
          v30 = v21;
        }
        while (v20);
      }
      else
      {
        v30 = 0;
      }
LABEL_26:

      v9 = v36;
      v8 = v37;
      v11 = v34;
      v10 = v35;
      v13 = v33;
    }
    else
    {
      psg_default_log_handle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v8;
        _os_log_fault_impl(&dword_1DBD27000, v14, OS_LOG_TYPE_FAULT, "[PSGNameMentionsHandler] Name prefix not set in (%@)", buf, 0xCu);
      }
      v18 = 0;
    }

  }
  else
  {
    psg_default_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v8;
      _os_log_fault_impl(&dword_1DBD27000, v13, OS_LOG_TYPE_FAULT, "[PSGNameMentionsHandler] Unexpected trigger (%@) passed into PSGNameMentionsHandler", buf, 0xCu);
    }
    v18 = 0;
  }

  return v18;
}

void __120__PSGNameMentionsHandler_getNameMentionsTriggerForContext_recipientNames_availableApps_localeIdentifier_explanationSet___block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3780], "decimalDigitCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addCharactersInString:", CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"));
  v1 = (void *)getNameMentionsTriggerForContext_recipientNames_availableApps_localeIdentifier_explanationSet__bannedPredictionCharacterSet;
  getNameMentionsTriggerForContext_recipientNames_availableApps_localeIdentifier_explanationSet__bannedPredictionCharacterSet = (uint64_t)v0;

}

@end
