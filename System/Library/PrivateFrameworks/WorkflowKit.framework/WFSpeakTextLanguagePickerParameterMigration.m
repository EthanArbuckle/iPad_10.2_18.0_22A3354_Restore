@implementation WFSpeakTextLanguagePickerParameterMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("1030")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.speaktext"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WFWorkflowMigration actions](self, "actions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "isEqualToString:", CFSTR("is.workflow.actions.speaktext")))
        {
          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          -[WFSpeakTextLanguagePickerParameterMigration migrateSpeakTextLanguageParameterInParametersDictionary:](self, "migrateSpeakTextLanguageParameterInParametersDictionary:", v12);
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  -[WFWorkflowMigration finish](self, "finish");
}

- (void)migrateSpeakTextLanguageParameterInParametersDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  WFStringSubstitutableState *v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("WFSpeakTextLanguage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFSpeakTextLanguagePickerParameterMigration availableLanguageCodes](self, "availableLanguageCodes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "containsObject:", v5) & 1) == 0)
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        obj = v6;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v20;
          while (2)
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v20 != v9)
                objc_enumerationMutation(obj);
              v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "localizedStringForLocaleIdentifier:", v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "capitalizedStringWithLocale:", v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (!objc_msgSend(v14, "length"))
              {
                getWFWorkflowMigrationLogObject();
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  v24 = "-[WFSpeakTextLanguagePickerParameterMigration migrateSpeakTextLanguageParameterInParametersDictionary:]";
                  v25 = 2114;
                  v26 = v11;
                  v27 = 2114;
                  v28 = v12;
                  _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_FAULT, "%s [Speak Text] Failed to get localized language name from languageCode: %{public}@, languageLocale: %{public}@", buf, 0x20u);
                }

              }
              if (objc_msgSend(v14, "isEqualToString:", v5))
              {
                v16 = -[WFVariableSubstitutableParameterState initWithValue:]([WFStringSubstitutableState alloc], "initWithValue:", v11);
                -[WFVariableSubstitutableParameterState serializedRepresentation](v16, "serializedRepresentation");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("WFSpeakTextLanguage"));

                goto LABEL_18;
              }

            }
            v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
            if (v8)
              continue;
            break;
          }
        }
        v6 = obj;

        objc_msgSend(v4, "removeObjectForKey:", CFSTR("WFSpeakTextLanguage"));
      }
LABEL_18:

    }
  }

}

- (id)availableLanguageCodes
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v2 = (void *)getAVSpeechSynthesisVoiceClass_softClass;
  v11 = getAVSpeechSynthesisVoiceClass_softClass;
  if (!getAVSpeechSynthesisVoiceClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getAVSpeechSynthesisVoiceClass_block_invoke;
    v7[3] = &unk_1E7AF9520;
    v7[4] = &v8;
    __getAVSpeechSynthesisVoiceClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v3, "_speechVoicesIncludingSiri");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_compactMap:", &__block_literal_global_64187);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __69__WFSpeakTextLanguagePickerParameterMigration_availableLanguageCodes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "language");
}

@end
