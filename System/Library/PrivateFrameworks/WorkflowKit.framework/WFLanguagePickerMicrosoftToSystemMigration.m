@implementation WFLanguagePickerMicrosoftToSystemMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("1146.10")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.text.translate"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  void *v3;
  _QWORD v4[5];

  -[WFWorkflowMigration actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__WFLanguagePickerMicrosoftToSystemMigration_migrateWorkflow__block_invoke;
  v4[3] = &unk_1E7AF9228;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

  -[WFWorkflowMigration finish](self, "finish");
}

- (id)localeIdentifierFromUnmigratedValue:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v4 = a3;
  -[WFLanguagePickerMicrosoftToSystemMigration languagesSupportedByTranslation](self, "languagesSupportedByTranslation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    v7 = v4;
  }
  else
  {
    -[WFLanguagePickerMicrosoftToSystemMigration localizedLanguageDisplayNamesToLocaleIdentifiers](self, "localizedLanguageDisplayNamesToLocaleIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v4);

    if (v10)
      -[WFLanguagePickerMicrosoftToSystemMigration localeIdentifierFromSerializedLocaleDisplayName:](self, "localeIdentifierFromSerializedLocaleDisplayName:", v4);
    else
      -[WFLanguagePickerMicrosoftToSystemMigration localeIdentifierFromLegacySerializedParameterValue:](self, "localeIdentifierFromLegacySerializedParameterValue:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v7;

  return v11;
}

- (id)localeIdentifierFromLegacySerializedParameterValue:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  objc_msgSend(&unk_1E7B8DE50, "objectForKey:", a3);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("en_US");
  v5 = v3;

  return v5;
}

- (id)localeIdentifierFromSerializedLocaleDisplayName:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  v4 = a3;
  -[WFLanguagePickerMicrosoftToSystemMigration localizedLanguageDisplayNamesToLocaleIdentifiers](self, "localizedLanguageDisplayNamesToLocaleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("en_US");
  v8 = v7;

  return v8;
}

- (id)localizedLanguageDisplayNamesToLocaleIdentifiers
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[WFLanguagePickerMicrosoftToSystemMigration languagesSupportedByTranslation](self, "languagesSupportedByTranslation", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "wf_displayName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v9, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

- (id)languagesSupportedByTranslation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E7B8D8F8);
}

void __61__WFLanguagePickerMicrosoftToSystemMigration_migrateWorkflow__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "actionIdentifierKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("is.workflow.actions.text.translate"));

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "actionParametersKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WFSelectedFromLanguage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Detect Language")) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "localeIdentifierFromUnmigratedValue:", v8);
          v9 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v9;
        }
        objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("WFSelectedFromLanguage"));
      }
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WFSelectedLanguage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "localeIdentifierFromUnmigratedValue:", v10);
        v11 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("WFSelectedLanguage"));
        v10 = (void *)v11;
      }
    }

  }
}

@end
