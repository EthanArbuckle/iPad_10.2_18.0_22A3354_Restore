@implementation WFShortcutsV5CustomModificationsStep

- (BOOL)performModificationsWithContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  BOOL v22;
  NSObject *v23;
  id *v25;
  void *v26;
  void *v27;
  void *context;
  void *v29;
  id obj;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint8_t v38[128];
  uint8_t buf[4];
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1C3BB3598]();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Shortcut"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchLimit:", 5);
  objc_msgSend(v7, "setPropertiesToFetch:", &unk_1E7B8D910);
  v37 = 0;
  v27 = v7;
  objc_msgSend(v5, "executeFetchRequest:error:", v7, &v37);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v37;
  if (!objc_msgSend(v8, "count"))
  {
LABEL_13:

    objc_autoreleasePoolPop(v6);
    if (a4)
      *a4 = objc_retainAutorelease(v9);
    v22 = v9 == 0;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("ShortcutActions"), v5);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    v25 = a4;
    v26 = v6;
    do
    {
      v29 = v9;
      v12 = v5;
      context = (void *)MEMORY[0x1C3BB3598]();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      obj = v8;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v34 != v15)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            v18 = (void *)MEMORY[0x1C3BB3598]();
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B80]), "initWithEntity:insertIntoManagedObjectContext:", v11, v12);
            objc_msgSend(v17, "valueForKey:", CFSTR("actionsData"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setValue:forKey:", v20, CFSTR("data"));
            objc_msgSend(v17, "setValue:forKey:", v19, CFSTR("actions"));
            objc_msgSend(v17, "setValue:forKey:", 0, CFSTR("actionsData"));

            objc_autoreleasePoolPop(v18);
          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v14);
      }

      v32 = v29;
      v5 = v12;
      objc_msgSend(v12, "save:", &v32);
      v21 = v32;

      objc_msgSend(v12, "reset");
      objc_msgSend(v27, "setFetchOffset:", objc_msgSend(v27, "fetchOffset") + objc_msgSend(v27, "fetchLimit"));
      v31 = v21;
      objc_msgSend(v12, "executeFetchRequest:error:", v27, &v31);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v31;

      objc_autoreleasePoolPop(context);
    }
    while (objc_msgSend(v8, "count"));

    a4 = v25;
    v6 = v26;
    goto LABEL_13;
  }
  getWFDatabaseLogObject();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "-[WFShortcutsV5CustomModificationsStep performModificationsWithContext:error:]";
    _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_FAULT, "%s Couldn't make a ShortcutActions entity description", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v6);
  v22 = 0;
LABEL_19:

  return v22;
}

@end
