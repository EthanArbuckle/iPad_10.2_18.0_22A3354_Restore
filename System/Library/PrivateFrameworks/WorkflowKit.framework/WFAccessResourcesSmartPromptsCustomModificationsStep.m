@implementation WFAccessResourcesSmartPromptsCustomModificationsStep

- (BOOL)performModificationsWithContext:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  void *v20;
  id *v21;
  void *context;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  getWFWorkflowMigrationLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep performModificationsWithContext:error:]";
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEBUG, "%s Starting migration of access resources into smart prompts.", buf, 0xCu);
  }
  v21 = a4;

  v20 = (void *)MEMORY[0x1C3BB3598]();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Shortcut"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFetchLimit:", 5);
  v29 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v8, &v29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v29;
  while (objc_msgSend(v9, "count"))
  {
    context = (void *)MEMORY[0x1C3BB3598]();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x1C3BB3598]();
          -[WFAccessResourcesSmartPromptsCustomModificationsStep migrateAccessResourcesToSmartPromptsForWorkflow:context:](self, "migrateAccessResourcesToSmartPromptsForWorkflow:context:", v16, v6);
          objc_autoreleasePoolPop(v17);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v13);
    }

    v24 = v10;
    objc_msgSend(v6, "save:", &v24);
    v18 = v24;

    objc_msgSend(v6, "reset");
    objc_msgSend(v8, "setFetchOffset:", objc_msgSend(v8, "fetchOffset") + objc_msgSend(v8, "fetchLimit"));
    v23 = v18;
    objc_msgSend(v6, "executeFetchRequest:error:", v8, &v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v23;

    objc_autoreleasePoolPop(context);
  }

  objc_autoreleasePoolPop(v20);
  if (v21)
    *v21 = objc_retainAutorelease(v10);

  return v10 == 0;
}

- (void)migrateAccessResourcesToSmartPromptsForWorkflow:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  id v39;
  NSObject *v40;
  uint8_t v41[128];
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[WFAccessResourcesSmartPromptsCustomModificationsStep shortcutHasSmartPromptsData:context:](self, "shortcutHasSmartPromptsData:context:", v6, v7))
  {
    getWFWorkflowMigrationLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v43 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep migrateAccessResourcesToSmartPromptsForWorkflow:context:]";
      v44 = 2112;
      v45 = (uint64_t)v9;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEBUG, "%s Skipping migration of shortcut '%@' as it already has smart prompts data.", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    -[WFAccessResourcesSmartPromptsCustomModificationsStep fetchStatesByAccessResourceIdentifierForWorkflow:context:](self, "fetchStatesByAccessResourceIdentifierForWorkflow:context:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    getWFWorkflowMigrationLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
    if (v11)
    {
      if (v13)
      {
        *(_DWORD *)buf = 136315394;
        v43 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep migrateAccessResourcesToSmartPromptsForWorkflow:context:]";
        v44 = 2048;
        v45 = objc_msgSend(v10, "count");
        _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_DEBUG, "%s Found %lu access resources for migration.", buf, 0x16u);
      }

      objc_msgSend(v10, "allKeys");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v6;
      v16 = v7;
      -[WFAccessResourcesSmartPromptsCustomModificationsStep fetchMigrationEligibleActionUUIDsForWorkflow:context:workflowAccessResourceIdentifiers:](self, "fetchMigrationEligibleActionUUIDsForWorkflow:context:workflowAccessResourceIdentifiers:", v6, v7, v14);
      v17 = objc_claimAutoreleasedReturnValue();

      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __112__WFAccessResourcesSmartPromptsCustomModificationsStep_migrateAccessResourcesToSmartPromptsForWorkflow_context___block_invoke;
      v38[3] = &unk_1E7AF80D8;
      v38[4] = self;
      v31 = v10;
      v39 = v10;
      v32 = v8;
      v18 = v8;
      v40 = v18;
      v30 = v17;
      -[NSObject enumerateKeysAndObjectsUsingBlock:](v17, "enumerateKeysAndObjectsUsingBlock:", v38);
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v19 = v18;
      v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v35 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            v33 = 0;
            objc_msgSend(v24, "databaseDataWithError:", &v33);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v33;
            if (v26)
            {
              getWFWorkflowMigrationLogObject();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315394;
                v43 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep migrateAccessResourcesToSmartPromptsForWorkflow:context:]";
                v44 = 2114;
                v45 = (uint64_t)v26;
                _os_log_impl(&dword_1C15B3000, v27, OS_LOG_TYPE_FAULT, "%s Could not serialize migrated state: %{public}@", buf, 0x16u);
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("SmartPromptPermission"), v16);
              v27 = objc_claimAutoreleasedReturnValue();
              -[NSObject setShortcut:](v27, "setShortcut:", v15);
              objc_msgSend(v24, "actionUUID");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setActionUUID:](v27, "setActionUUID:", v28);

              -[NSObject setData:](v27, "setData:", v25);
            }

          }
          v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
        }
        while (v21);
      }

      v6 = v15;
      v7 = v16;
      v10 = v31;
      v8 = v32;
      v12 = v30;
    }
    else if (v13)
    {
      objc_msgSend(v6, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v43 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep migrateAccessResourcesToSmartPromptsForWorkflow:context:]";
      v44 = 2112;
      v45 = (uint64_t)v29;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_DEBUG, "%s Skipping migration of shortcut '%@' as it doesn't have access resources.", buf, 0x16u);

    }
  }

}

- (id)contentLocationForActionIdentifier:(id)a3 statesByAccessResourceIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  _QWORD v38[5];
  _QWORD v39[4];
  id v40;
  _BYTE *v41;
  _BYTE buf[24];
  char v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D13E00], "locationWithSystemAppBundleIdentifier:", *MEMORY[0x1E0DC7EC0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E7B8D850);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v6);

  if (v10)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WFRemoteServerAccessResource"));
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v43 = 1;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)v11[1];
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __124__WFAccessResourcesSmartPromptsCustomModificationsStep_contentLocationForActionIdentifier_statesByAccessResourceIdentifier___block_invoke;
        v39[3] = &unk_1E7AF8100;
        v41 = buf;
        v14 = v12;
        v40 = v14;
        objc_msgSend(v13, "enumerateObjectsUsingBlock:", v39);
        if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
        {
          v15 = (void *)MEMORY[0x1E0D140C0];
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "locationWithHostnames:", v16);
          v17 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v17 = 0;
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_31;
      }
    }
LABEL_11:

    v17 = 0;
    goto LABEL_31;
  }
  -[WFAccessResourcesSmartPromptsCustomModificationsStep contentDestinationsByActionIdentifier](self, "contentDestinationsByActionIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqual:", v8);

  if (!v20)
  {
    objc_msgSend(v7, "allKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAccessResourcesSmartPromptsCustomModificationsStep bundleIdentifierForIntentBasedActionIdentifier:accessResourceIdentifiers:](self, "bundleIdentifierForIntentBasedActionIdentifier:accessResourceIdentifiers:", v6, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = objc_alloc(MEMORY[0x1E0CBD728]);
      objc_msgSend(v7, "allKeys");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAccessResourcesSmartPromptsCustomModificationsStep bundleIdentifierForIntentBasedActionIdentifier:accessResourceIdentifiers:](self, "bundleIdentifierForIntentBasedActionIdentifier:accessResourceIdentifiers:", v6, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v24, "initWithBundleIdentifier:", v26);

      objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "resolvedAppMatchingDescriptor:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D13E00], "locationWithAppDescriptor:", v29);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_31;
    }
    -[WFAccessResourcesSmartPromptsCustomModificationsStep contentDestinationsByActionIdentifier](self, "contentDestinationsByActionIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKey:", v6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
      v17 = 0;
LABEL_30:

      goto LABEL_31;
    }
    -[WFAccessResourcesSmartPromptsCustomModificationsStep accessResourceIdentifiersByContentDestination](self, "accessResourceIdentifiersByContentDestination");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKey:", v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", v33);
      v34 = objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v17 = v31;
LABEL_29:

        goto LABEL_30;
      }
      getWFWorkflowMigrationLogObject();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[WFAccessResourcesSmartPromptsCustomModificationsStep contentLocationForActionIdentifier:s"
                             "tatesByAccessResourceIdentifier:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v33;
        _os_log_impl(&dword_1C15B3000, v36, OS_LOG_TYPE_DEBUG, "%s Current state for %{public}@ is disabled; won't be migrated.",
          buf,
          0x16u);
      }

      v34 = 0;
    }
    else
    {
      getWFWorkflowMigrationLogObject();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v31, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[WFAccessResourcesSmartPromptsCustomModificationsStep contentLocationForActionIdentifier:s"
                             "tatesByAccessResourceIdentifier:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v35;
        _os_log_impl(&dword_1C15B3000, v34, OS_LOG_TYPE_ERROR, "%s Missing mapping for content destination: what access resource does %{public}@ map to?", buf, 0x16u);

      }
    }
    v17 = 0;
    goto LABEL_29;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WFHealthKitAccessResource"));
  v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v43 = 1;
  v21 = (void *)v11[1];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __124__WFAccessResourcesSmartPromptsCustomModificationsStep_contentLocationForActionIdentifier_statesByAccessResourceIdentifier___block_invoke_2;
  v38[3] = &unk_1E7AF8128;
  v38[4] = buf;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v38);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    v17 = v8;
  else
    v17 = 0;
  _Block_object_dispose(buf, 8);

LABEL_31:
  return v17;
}

- (id)bundleIdentifierForIntentBasedActionIdentifier:(id)a3 accessResourceIdentifiers:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(v7);
      -[WFAccessResourcesSmartPromptsCustomModificationsStep extractBundleIdentifierFromIntentsAccessResourceIdentifier:](self, "extractBundleIdentifierFromIntentsAccessResourceIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        if ((objc_msgSend(v6, "hasPrefix:", v12) & 1) != 0)
          break;
      }

      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v12 = 0;
  }

  return v12;
}

- (id)fetchStatesByAccessResourceIdentifierForWorkflow:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  +[WFCoreDataAccessResourcePermission fetchRequest](WFCoreDataAccessResourcePermission, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("shortcut.workflowID"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v10);

  v19 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v7, &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v19;
  if (v12)
  {
    getWFWorkflowMigrationLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchStatesByAccessResourceIdentifierForWorkflow:context:]";
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_ERROR, "%s Failed to fetch access resources for workflow: %@", buf, 0x16u);
    }
    v14 = MEMORY[0x1E0C9AA70];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __113__WFAccessResourcesSmartPromptsCustomModificationsStep_fetchStatesByAccessResourceIdentifierForWorkflow_context___block_invoke;
    v17[3] = &unk_1E7AF8150;
    v14 = v15;
    v18 = v14;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v17);
    v13 = v18;
  }

  return v14;
}

- (id)fetchMigrationEligibleActionUUIDsForWorkflow:(id)a3 context:(id)a4 workflowAccessResourceIdentifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  int v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  char v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  NSObject *v61;
  NSObject *obj;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[5];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  id v77;
  _BYTE v78[128];
  uint8_t v79[128];
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  id v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[WFCoreDataWorkflowActions fetchRequest](WFCoreDataWorkflowActions, "fetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v8, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("shortcut.workflowID"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v14);

  objc_msgSend(v11, "setFetchLimit:", 1);
  v77 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v11, &v77);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v77;
  objc_msgSend(v15, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "data");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v76 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v19, 1, 0, &v76);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v76;
      if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v54 = v19;
        v55 = v18;
        v56 = v16;
        v57 = v15;
        v58 = v11;
        v59 = v9;
        v60 = v8;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v21 = objc_claimAutoreleasedReturnValue();
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v22 = v20;
        v23 = (void *)v21;
        obj = v22;
        v63 = (void *)v21;
        v65 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
        if (v65)
        {
          v64 = *(_QWORD *)v73;
          do
          {
            for (i = 0; i != v65; ++i)
            {
              if (*(_QWORD *)v73 != v64)
                objc_enumerationMutation(obj);
              v25 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
              objc_msgSend(v25, "objectForKey:", CFSTR("WFWorkflowActionIdentifier"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = (void *)MEMORY[0x1E0C99E60];
              v71[0] = MEMORY[0x1E0C809B0];
              v71[1] = 3221225472;
              v71[2] = __143__WFAccessResourcesSmartPromptsCustomModificationsStep_fetchMigrationEligibleActionUUIDsForWorkflow_context_workflowAccessResourceIdentifiers___block_invoke;
              v71[3] = &unk_1E7AF8178;
              v71[4] = self;
              objc_msgSend(v10, "if_compactMap:", v71);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setWithArray:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              v69 = 0u;
              v70 = 0u;
              v67 = 0u;
              v68 = 0u;
              v30 = v29;
              v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
              if (v31)
              {
                v32 = v31;
                v33 = v10;
                v34 = 0;
                v35 = *(_QWORD *)v68;
                do
                {
                  for (j = 0; j != v32; ++j)
                  {
                    if (*(_QWORD *)v68 != v35)
                      objc_enumerationMutation(v30);
                    v34 |= objc_msgSend(v26, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j));
                  }
                  v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
                }
                while (v32);

                v10 = v33;
                v23 = v63;
                if ((v34 & 1) != 0)
                {
LABEL_21:
                  objc_msgSend(v25, "objectForKey:", CFSTR("WFWorkflowActionParameters"));
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (!v39)
                  {
                    getWFWorkflowMigrationLogObject();
                    v40 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 136315394;
                      v81 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchMigrationEligibleActionUUIDsForW"
                            "orkflow:context:workflowAccessResourceIdentifiers:]";
                      v82 = 2114;
                      v83 = v26;
                      _os_log_impl(&dword_1C15B3000, v40, OS_LOG_TYPE_DEBUG, "%s Action %{public}@ does not have WFWorkflowActionParameters, creating dictionary", buf, 0x16u);
                    }

                    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                    v39 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "setObject:forKey:", v39, CFSTR("WFWorkflowActionParameters"));
                  }
                  -[NSObject objectForKey:](v39, "objectForKey:", CFSTR("UUID"));
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v41)
                  {
                    getWFWorkflowMigrationLogObject();
                    v42 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 136315394;
                      v81 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchMigrationEligibleActionUUIDsForW"
                            "orkflow:context:workflowAccessResourceIdentifiers:]";
                      v82 = 2112;
                      v83 = v26;
                      _os_log_impl(&dword_1C15B3000, v42, OS_LOG_TYPE_DEBUG, "%s Creating UUID for action with identifier %@", buf, 0x16u);
                    }

                    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "UUIDString");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();

                    -[NSObject setObject:forKey:](v39, "setObject:forKey:", v41, CFSTR("UUID"));
                  }
                  objc_msgSend(v23, "objectForKey:", v26);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v44)
                  {
                    objc_msgSend(v23, "objectForKey:", v26);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "addObject:", v41);
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v41);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "setObject:forKey:", v45, v26);
                  }

                  goto LABEL_35;
                }
              }
              else
              {

              }
              -[WFAccessResourcesSmartPromptsCustomModificationsStep actionIdentifiersThatRequireMigrationForAccessResourceIdentifiers:](self, "actionIdentifiersThatRequireMigrationForAccessResourceIdentifiers:", v10);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v37, "containsObject:", v26);

              if ((v38 & 1) != 0)
                goto LABEL_21;
              getWFWorkflowMigrationLogObject();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v81 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchMigrationEligibleActionUUIDsForWorkflo"
                      "w:context:workflowAccessResourceIdentifiers:]";
                v82 = 2112;
                v83 = v26;
                _os_log_impl(&dword_1C15B3000, v39, OS_LOG_TYPE_DEBUG, "%s Action with identifier %@ does not require migration.", buf, 0x16u);
              }
LABEL_35:

            }
            v65 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
          }
          while (v65);
        }

        v66 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", obj, 200, 0, &v66);
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = (void *)v46;
        if (v66 || !v46)
        {
          getWFWorkflowMigrationLogObject();
          v52 = objc_claimAutoreleasedReturnValue();
          v11 = v58;
          v9 = v59;
          v18 = v55;
          v16 = v56;
          v19 = v54;
          v48 = v61;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v81 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchMigrationEligibleActionUUIDsForWorkflow:co"
                  "ntext:workflowAccessResourceIdentifiers:]";
            _os_log_impl(&dword_1C15B3000, v52, OS_LOG_TYPE_ERROR, "%s Failed to serialize mutated actions for save.", buf, 0xCu);
          }

          v8 = v60;
          v15 = v57;
        }
        else
        {
          v18 = v55;
          objc_msgSend(v55, "setData:", v46);
          v9 = v59;
          v8 = v60;
          v15 = v57;
          v11 = v58;
          v16 = v56;
          v19 = v54;
          v48 = v61;
        }

        v51 = obj;
        v49 = v63;
      }
      else
      {

        getWFWorkflowMigrationLogObject();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v81 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchMigrationEligibleActionUUIDsForWorkflow:cont"
                "ext:workflowAccessResourceIdentifiers:]";
          v82 = 2114;
          v83 = v16;
          _os_log_impl(&dword_1C15B3000, v50, OS_LOG_TYPE_ERROR, "%s Could not deserialize actions from plist: %{public}@", buf, 0x16u);
        }
        v51 = v50;
        v49 = (void *)MEMORY[0x1E0C9AA70];
        v48 = v61;
      }

    }
    else
    {
      getWFWorkflowMigrationLogObject();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v81 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchMigrationEligibleActionUUIDsForWorkflow:contex"
              "t:workflowAccessResourceIdentifiers:]";
        _os_log_impl(&dword_1C15B3000, v48, OS_LOG_TYPE_ERROR, "%s No NSData found on WFCoreDataWorkflowActions object.", buf, 0xCu);
      }
      v49 = (void *)MEMORY[0x1E0C9AA70];
    }

  }
  else
  {
    getWFWorkflowMigrationLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v81 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchMigrationEligibleActionUUIDsForWorkflow:context:"
            "workflowAccessResourceIdentifiers:]";
      v82 = 2112;
      v83 = v8;
      _os_log_impl(&dword_1C15B3000, v19, OS_LOG_TYPE_ERROR, "%s No WFCoreDataWorkflowActions object found for workflow: %@.", buf, 0x16u);
    }
    v49 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v49;
}

- (id)extractBundleIdentifierFromIntentsAccessResourceIdentifier:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("WFIntentsAccessResource"));

  if (v5)
  {
    objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)shortcutHasSmartPromptsData:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  +[WFCoreDataSmartPromptPermission fetchRequest](WFCoreDataSmartPromptPermission, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("shortcut.workflowID"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v10);

  v16 = 0;
  v11 = objc_msgSend(v5, "countForFetchRequest:error:", v7, &v16);

  v12 = v16;
  if (v12)
  {
    getWFWorkflowMigrationLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep shortcutHasSmartPromptsData:context:]";
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_DEBUG, "%s Failed to fetch smart prompts count for workflow: %@", buf, 0x16u);
    }

    v14 = 0;
  }
  else
  {
    v14 = v11 != 0;
  }

  return v14;
}

- (id)actionIdentifiersThatRequireMigrationForAccessResourceIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v22;
    *(_QWORD *)&v8 = 136315394;
    v20 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v12, "hasPrefix:", CFSTR("WFIntentsAccessResource."), v20, (_QWORD)v21) & 1) == 0)
        {
          if (objc_msgSend(v12, "isEqualToString:", CFSTR("WFRemoteServerAccessResource")))
          {
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E7B8D850);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "allObjects");
            v14 = objc_claimAutoreleasedReturnValue();
            goto LABEL_11;
          }
          -[WFAccessResourcesSmartPromptsCustomModificationsStep contentDestinationsByAccessResourceIdentifier](self, "contentDestinationsByAccessResourceIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            -[WFAccessResourcesSmartPromptsCustomModificationsStep actionIdentifiersByContentDestination](self, "actionIdentifiersByContentDestination");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", v13);
            v14 = objc_claimAutoreleasedReturnValue();

            if (v14)
            {
LABEL_11:
              objc_msgSend(v5, "addObjectsFromArray:", v14);
            }
            else
            {
              getWFWorkflowMigrationLogObject();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v13, "identifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v20;
                v26 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep actionIdentifiersThatRequireMigrationForAcc"
                      "essResourceIdentifiers:]";
                v27 = 2112;
                v28 = v18;
                _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_ERROR, "%s Content destination %@ doesn't map to any action identifiers", buf, 0x16u);

              }
              v14 = 0;
            }
          }
          else
          {
            getWFWorkflowMigrationLogObject();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v20;
              v26 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep actionIdentifiersThatRequireMigrationForAcces"
                    "sResourceIdentifiers:]";
              v27 = 2112;
              v28 = v12;
              _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_ERROR, "%s Access resource %@ doesn't map to any content destination", buf, 0x16u);
            }
            v13 = 0;
          }

          continue;
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v9);
  }

  return v5;
}

- (NSDictionary)contentDestinationsByAccessResourceIdentifier
{
  NSDictionary *contentDestinationsByAccessResourceIdentifier;
  NSDictionary *v4;
  NSDictionary *v5;

  contentDestinationsByAccessResourceIdentifier = self->_contentDestinationsByAccessResourceIdentifier;
  if (!contentDestinationsByAccessResourceIdentifier)
  {
    WFContentLocationByAccessResourceIdentifier();
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contentDestinationsByAccessResourceIdentifier;
    self->_contentDestinationsByAccessResourceIdentifier = v4;

    contentDestinationsByAccessResourceIdentifier = self->_contentDestinationsByAccessResourceIdentifier;
  }
  return contentDestinationsByAccessResourceIdentifier;
}

- (NSDictionary)actionIdentifiersByContentDestination
{
  NSDictionary *actionIdentifiersByContentDestination;
  NSDictionary *v4;
  NSDictionary *v5;

  actionIdentifiersByContentDestination = self->_actionIdentifiersByContentDestination;
  if (!actionIdentifiersByContentDestination)
  {
    WFContentLocationToActionIdentifierMapping();
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_actionIdentifiersByContentDestination;
    self->_actionIdentifiersByContentDestination = v4;

    actionIdentifiersByContentDestination = self->_actionIdentifiersByContentDestination;
  }
  return actionIdentifiersByContentDestination;
}

- (NSDictionary)accessResourceIdentifiersByContentDestination
{
  NSDictionary *accessResourceIdentifiersByContentDestination;
  void *v4;
  uint64_t v5;
  char *v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  accessResourceIdentifiersByContentDestination = self->_accessResourceIdentifiersByContentDestination;
  if (!accessResourceIdentifiersByContentDestination)
  {
    -[WFAccessResourcesSmartPromptsCustomModificationsStep contentDestinationsByAccessResourceIdentifier](self, "contentDestinationsByAccessResourceIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    v6 = (char *)v11 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v6, 8 * v5);
    bzero(v6, 8 * v5);
    -[WFAccessResourcesSmartPromptsCustomModificationsStep contentDestinationsByAccessResourceIdentifier](self, "contentDestinationsByAccessResourceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getObjects:andKeys:count:", v6, v6, v5);

    v8 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:count:", v6, v6, v5);
    v9 = self->_accessResourceIdentifiersByContentDestination;
    self->_accessResourceIdentifiersByContentDestination = v8;

    accessResourceIdentifiersByContentDestination = self->_accessResourceIdentifiersByContentDestination;
  }
  return accessResourceIdentifiersByContentDestination;
}

- (NSDictionary)contentDestinationsByActionIdentifier
{
  NSDictionary *contentDestinationsByActionIdentifier;
  void *v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  _QWORD v10[4];
  NSDictionary *v11;

  contentDestinationsByActionIdentifier = self->_contentDestinationsByActionIdentifier;
  if (!contentDestinationsByActionIdentifier)
  {
    v4 = (void *)objc_opt_new();
    -[WFAccessResourcesSmartPromptsCustomModificationsStep actionIdentifiersByContentDestination](self, "actionIdentifiersByContentDestination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __93__WFAccessResourcesSmartPromptsCustomModificationsStep_contentDestinationsByActionIdentifier__block_invoke;
    v10[3] = &unk_1E7AF81A8;
    v6 = v4;
    v11 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

    v7 = self->_contentDestinationsByActionIdentifier;
    self->_contentDestinationsByActionIdentifier = v6;
    v8 = v6;

    contentDestinationsByActionIdentifier = self->_contentDestinationsByActionIdentifier;
  }
  return contentDestinationsByActionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentDestinationsByActionIdentifier, 0);
  objc_storeStrong((id *)&self->_accessResourceIdentifiersByContentDestination, 0);
  objc_storeStrong((id *)&self->_actionIdentifiersByContentDestination, 0);
  objc_storeStrong((id *)&self->_contentDestinationsByAccessResourceIdentifier, 0);
}

void __93__WFAccessResourcesSmartPromptsCustomModificationsStep_contentDestinationsByActionIdentifier__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

uint64_t __143__WFAccessResourcesSmartPromptsCustomModificationsStep_fetchMigrationEligibleActionUUIDsForWorkflow_context_workflowAccessResourceIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "extractBundleIdentifierFromIntentsAccessResourceIdentifier:", a2);
}

void __113__WFAccessResourcesSmartPromptsCustomModificationsStep_fetchStatesByAccessResourceIdentifierForWorkflow_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  NSObject *v20;
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v14 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, &v14);
    v7 = v14;
    objc_msgSend(v6, "setClass:forClassName:", objc_opt_class(), CFSTR("WFHealthKitAccessResourcePerWorkflowState"));
    objc_msgSend(v6, "setClass:forClassName:", objc_opt_class(), CFSTR("WFRemoteServerAccessResourcePerWorkflowState"));
    objc_msgSend(v6, "setClass:forClassName:", objc_opt_class(), CFSTR("WFRemoteServerAccessResourcePerWorkflowStateEntry"));
    objc_msgSend(v6, "setClass:forClassName:", objc_opt_class(), CFSTR("WFHealthKitAccessResourcePerWorkflowStateEntry"));
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    v21[3] = objc_opt_class();
    v21[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v9, *MEMORY[0x1E0CB2CD0]);
    v10 = objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      getWFWorkflowMigrationLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v16 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchStatesByAccessResourceIdentifierForWorkflow:co"
              "ntext:]_block_invoke";
        v17 = 2114;
        v18 = v4;
        v19 = 2112;
        v20 = v7;
        _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_ERROR, "%s Failed to unarchive access resource state data with identifier %{public}@: %@", buf, 0x20u);
      }

    }
    else
    {
      objc_msgSend(v6, "finishDecoding");
      getWFWorkflowMigrationLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v10)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v16 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchStatesByAccessResourceIdentifierForWorkflow:"
                "context:]_block_invoke";
          v17 = 2112;
          v18 = v4;
          v19 = 2112;
          v20 = v10;
          _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_DEBUG, "%s Got an access resource to migrate: %@, state = %@", buf, 0x20u);
        }

        objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v10, v4);
      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v16 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchStatesByAccessResourceIdentifierForWorkflow:"
                "context:]_block_invoke";
          v17 = 2114;
          v18 = v4;
          _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_ERROR, "%s Failed to unarchive access resource state data with identifier %{public}@: access resource was nil", buf, 0x16u);
        }

      }
    }

  }
  else
  {
    getWFWorkflowMigrationLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchStatesByAccessResourceIdentifierForWorkflow:cont"
            "ext:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s No NSData found on WFCoreDataAccessResourcePermission.", buf, 0xCu);
    }
  }

}

void __124__WFAccessResourcesSmartPromptsCustomModificationsStep_contentLocationForActionIdentifier_statesByAccessResourceIdentifier___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*((id *)v5 + 1), "isEqual:", MEMORY[0x1E0C9AAA0]))
  {
    *a3 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *((_QWORD *)v5 + 2));
  }

}

uint64_t __124__WFAccessResourcesSmartPromptsCustomModificationsStep_contentLocationForActionIdentifier_statesByAccessResourceIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a2 + 8), "isEqual:", MEMORY[0x1E0C9AAA0]);
  if ((_DWORD)result)
  {
    *a3 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

void __112__WFAccessResourcesSmartPromptsCustomModificationsStep_migrateAccessResourcesToSmartPromptsForWorkflow_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  WFSmartPromptState *v15;
  NSObject *v16;
  WFSmartPromptState *v17;
  id v18;
  NSObject *obj;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v20 = v5;
  objc_msgSend(*(id *)(a1 + 32), "contentLocationForActionIdentifier:statesByAccessResourceIdentifier:", v5, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v6;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    if (v9)
    {
      v10 = v9;
      v18 = v6;
      v11 = *(_QWORD *)v22;
      obj = v8;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          getWFWorkflowMigrationLogObject();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v26 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep migrateAccessResourcesToSmartPromptsForWorkflow"
                  ":context:]_block_invoke";
            v27 = 2112;
            v28 = v20;
            v29 = 2112;
            v30 = v13;
            _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_DEBUG, "%s Ready to create smart prompt state for %@, UUID: %@", buf, 0x20u);
          }

          v15 = -[WFSmartPromptState initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:]([WFSmartPromptState alloc], "initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:", CFSTR("UserWildcard"), 0, v13, v7, CFSTR("Allow"));
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);
          if (objc_msgSend(v7, "promptingBehaviour"))
          {
            getWFWorkflowMigrationLogObject();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315907;
              v26 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep migrateAccessResourcesToSmartPromptsForWorkfl"
                    "ow:context:]_block_invoke";
              v27 = 2113;
              v28 = v7;
              v29 = 2114;
              v30 = v13;
              v31 = 2114;
              v32 = v20;
              _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_INFO, "%s Creating action wildcard for %{private}@, actionUUID: %{public}@, actionIdentifier: %{public}@", buf, 0x2Au);
            }

            v17 = -[WFSmartPromptState initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:]([WFSmartPromptState alloc], "initWithMode:sourceContentAttribution:actionUUID:contentDestination:status:", CFSTR("ActionWildcard"), 0, v13, v7, CFSTR("Allow"));
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v17);

          }
        }
        v8 = obj;
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      }
      while (v10);
      v6 = v18;
    }
  }
  else
  {
    getWFWorkflowMigrationLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep migrateAccessResourcesToSmartPromptsForWorkflow:conte"
            "xt:]_block_invoke";
      v27 = 2112;
      v28 = v20;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_INFO, "%s Skipping migration of %@ because no content destination was found, or permission was previously denied", buf, 0x16u);
    }
  }

}

@end
