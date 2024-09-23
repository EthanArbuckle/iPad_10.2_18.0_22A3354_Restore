@implementation WFShortcutsV10CustomModificationStep

- (BOOL)performModificationsWithContext:(id)a3 error:(id *)a4
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  id v34;
  void *v36;
  void *v37;
  id *v38;
  void *context;
  void *contexta;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  getWFDatabaseLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v59 = "-[WFShortcutsV10CustomModificationStep performModificationsWithContext:error:]";
    v60 = 2112;
    v61 = v7;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Performing custom modification step: %@", buf, 0x16u);

  }
  v36 = (void *)MEMORY[0x1C3BB3598]();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Shortcut"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFetchLimit:", 5);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("triggers.@count > 0"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  v55 = 0;
  objc_msgSend(v41, "executeFetchRequest:error:", v8, &v55);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v55;
  v38 = a4;
  if (objc_msgSend(v10, "count"))
  {
    getWFDatabaseLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v59 = "-[WFShortcutsV10CustomModificationStep performModificationsWithContext:error:]";
      v60 = 2112;
      v61 = v10;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_DEFAULT, "%s Associated triggers found for %@ shortcuts. Setting hiddenFromLibraryAndSync flag to YES", buf, 0x16u);
    }

    v13 = MEMORY[0x1E0C9AAB0];
    do
    {
      context = (void *)MEMORY[0x1C3BB3598]();
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v14 = v10;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v52 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            v20 = (void *)MEMORY[0x1C3BB3598]();
            objc_msgSend(v19, "setValue:forKey:", v13, CFSTR("hiddenFromLibraryAndSync"));
            objc_autoreleasePoolPop(v20);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
        }
        while (v16);
      }

      v50 = v11;
      objc_msgSend(v41, "save:", &v50);
      v21 = v50;

      objc_msgSend(v41, "reset");
      objc_msgSend(v8, "setFetchOffset:", objc_msgSend(v8, "fetchOffset") + objc_msgSend(v8, "fetchLimit"));
      v49 = v21;
      objc_msgSend(v41, "executeFetchRequest:error:", v8, &v49);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v49;

      objc_autoreleasePoolPop(context);
    }
    while (objc_msgSend(v10, "count"));
  }

  objc_autoreleasePoolPop(v36);
  v37 = (void *)MEMORY[0x1C3BB3598]();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Trigger"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFetchLimit:", 5);
  v48 = v11;
  objc_msgSend(v41, "executeFetchRequest:error:", v22, &v48);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v48;

  if (objc_msgSend(v23, "count"))
  {
    getWFDatabaseLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v59 = "-[WFShortcutsV10CustomModificationStep performModificationsWithContext:error:]";
      v60 = 2112;
      v61 = v23;
      _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_DEFAULT, "%s Triggers found: %@. Setting editableShortcut flag to YES", buf, 0x16u);
    }

    v26 = MEMORY[0x1E0C9AAB0];
    do
    {
      contexta = (void *)MEMORY[0x1C3BB3598]();
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v27 = v23;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v45;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v45 != v30)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
            v33 = (void *)MEMORY[0x1C3BB3598]();
            objc_msgSend(v32, "setValue:forKey:", v26, CFSTR("editableShortcut"));
            objc_autoreleasePoolPop(v33);
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
        }
        while (v29);
      }

      v43 = v24;
      objc_msgSend(v41, "save:", &v43);
      v34 = v43;

      objc_msgSend(v41, "reset");
      objc_msgSend(v22, "setFetchOffset:", objc_msgSend(v22, "fetchOffset") + objc_msgSend(v22, "fetchLimit"));
      v42 = v34;
      objc_msgSend(v41, "executeFetchRequest:error:", v22, &v42);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v42;

      objc_autoreleasePoolPop(contexta);
    }
    while (objc_msgSend(v23, "count"));
  }

  objc_autoreleasePoolPop(v37);
  if (v38)
    *v38 = objc_retainAutorelease(v24);

  return v24 == 0;
}

@end
