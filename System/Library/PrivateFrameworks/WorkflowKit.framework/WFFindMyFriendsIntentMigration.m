@implementation WFFindMyFriendsIntentMigration

- (void)migrateWorkflow
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  BOOL v19;
  BOOL v20;
  _BOOL4 v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  __int128 v26;
  uint64_t v27;
  id obj;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[WFWorkflowMigration actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v32;
    v7 = CFSTR("is.workflow.actions.sirikit.donation.handle");
    *(_QWORD *)&v4 = 136315394;
    v26 = v4;
    do
    {
      v8 = 0;
      v27 = v5;
      do
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v8);
        -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey", v26);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v7);

        if (v12)
        {
          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          WFExtractDonatedIntentFromSerializedParameters(v14);
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;
            v17 = v6;
            v18 = v7;
            v19 = -[WFFindMyFriendsIntentMigration updateBundleIdentifierForIntent:](self, "updateBundleIdentifierForIntent:", v15);
            v20 = -[WFFindMyFriendsIntentMigration updateClassNameForIntent:](self, "updateClassNameForIntent:", v16);
            v30 = v16;
            v21 = -[WFFindMyFriendsIntentMigration convertParametersAndUpdateIntent:](self, "convertParametersAndUpdateIntent:", &v30);
            v22 = v30;

            if (v19 || v20 || v21)
            {
              v29 = 0;
              objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v22, 1, &v29);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v29;
              if (v23)
              {
                objc_msgSend(v14, "setObject:forKey:", v23, CFSTR("IntentData"));
                v7 = v18;
              }
              else
              {
                getWFWorkflowMigrationLogObject();
                v25 = objc_claimAutoreleasedReturnValue();
                v7 = v18;
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v26;
                  v36 = "-[WFFindMyFriendsIntentMigration migrateWorkflow]";
                  v37 = 2114;
                  v38 = v24;
                  _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_ERROR, "%s Error archiving intent data: %{public}@", buf, 0x16u);
                }

              }
              v6 = v17;

            }
            else
            {
              v7 = v18;
              v6 = v17;
            }
            v5 = v27;
          }
          else
          {
            v22 = 0;
          }

        }
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v5);
  }

  -[WFWorkflowMigration finish](self, "finish");
}

- (BOOL)updateBundleIdentifierForIntent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[WFFindMyFriendsIntentMigration launchIdConversion](WFFindMyFriendsIntentMigration, "launchIdConversion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "launchId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v3, "_setLaunchId:", v6);

  return v6 != 0;
}

- (BOOL)updateClassNameForIntent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v3 = a3;
  +[WFFindMyFriendsIntentMigration classNameConversion](WFFindMyFriendsIntentMigration, "classNameConversion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "launchId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_className");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "_codableDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v9, "setClassName:", v8);
      v10 = 1;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)convertParametersAndUpdateIntent:(id *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  BOOL v35;
  void *v37;
  id *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  uint8_t v52[128];
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = *a3;
  objc_msgSend(v4, "launchId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_className");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFFindMyFriendsIntentMigration parameterConversion](WFFindMyFriendsIntentMigration, "parameterConversion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backingStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v5, 0);
    objc_msgSend(MEMORY[0x1E0CBD960], "sharedConnection");
    v51 = 0;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)v11;
    objc_msgSend(v44, "loadSchemasForBundleIdentifiers:error:", v11, &v51);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v51;
    objc_msgSend(v12, "objectForKey:", v5);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      getWFWorkflowMigrationLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v54 = "-[WFFindMyFriendsIntentMigration convertParametersAndUpdateIntent:]";
        v55 = 2114;
        v56 = v5;
        v57 = 2114;
        v58 = v6;
        v59 = 2114;
        v60 = v13;
        _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_ERROR, "%s Error loading schema for %{public}@ when converting %{public}@: %{public}@", buf, 0x2Au);
      }

    }
    v43 = v13;
    if (v46)
    {
      v38 = a3;
      v39 = v8;
      v40 = v7;
      v42 = v5;
      v15 = objc_alloc(MEMORY[0x1E0CBD970]);
      objc_msgSend(v4, "identifier");
      v16 = v10;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v6;
      v18 = (void *)objc_msgSend(v15, "_initWithIdentifier:schema:name:data:", v17, v46, v6, 0);

      v37 = v16;
      objc_msgSend(v16, "_objectDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "attributes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "allValues");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "valueForKey:", CFSTR("propertyName"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v23 = v22;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v48 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            objc_msgSend(v9, "objectForKeyedSubscript:", v28);
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = (void *)v29;
            if (v29)
              v31 = (void *)v29;
            else
              v31 = v28;
            v32 = v31;

            objc_msgSend(v4, "valueForKey:", v28);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setValue:forKey:", v33, v32);

          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        }
        while (v25);
      }

      v34 = objc_retainAutorelease(v18);
      *v38 = v34;
      v35 = objc_msgSend(v9, "count") != 0;

      v6 = v41;
      v5 = v42;
      v8 = v39;
      v7 = v40;
      v10 = v37;
    }
    else
    {
      v35 = 0;
    }

  }
  else
  {

    v35 = 0;
  }

  return v35;
}

+ (id)launchIdConversion
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.mobileme.fmf1");
  v3[1] = CFSTR("com.apple.mobileme.fmip1");
  v4[0] = CFSTR("com.apple.findmy");
  v4[1] = CFSTR("com.apple.findmy");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)classNameConversion
{
  void *v2;
  void *v3;
  _QWORD v5[3];
  _QWORD v6[3];
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("com.apple.findmy");
  v5[0] = CFSTR("FMIPLocateIntent");
  v5[1] = CFSTR("FMIPPlaySoundIntent");
  v6[0] = CFSTR("LocateDeviceIntent");
  v6[1] = CFSTR("PlaySoundIntent");
  v5[2] = CFSTR("FMFLocateIntent");
  v6[2] = CFSTR("LocateIntent");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)parameterConversion
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[2];
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("LocateDeviceIntent");
  v5[1] = CFSTR("PlaySoundIntent");
  v6[0] = &unk_1E7B8DFE0;
  v6[1] = &unk_1E7B8E008;
  v7 = CFSTR("com.apple.findmy");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  BOOL v6;

  v5 = a4;
  if (WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.sirikit.donation.handle"), a3))
    v6 = WFCompareBundleVersions(v5, CFSTR("900")) == 3;
  else
    v6 = 0;

  return v6;
}

@end
