@implementation PLGlobalKeyValue

+ (id)entityName
{
  return CFSTR("GlobalKeyValue");
}

+ (void)initialize
{
  pl_dispatch_once();
}

- (BOOL)supportsCloudUpload
{
  return 0;
}

+ (id)attributesForKey
{
  if (attributesForKey_onceToken != -1)
    dispatch_once(&attributesForKey_onceToken, &__block_literal_global_59718);
  return (id)attributesForKey_attributesForKey;
}

+ (signed)typeForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "attributesForKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v4) = objc_msgSend(v6, "type");
  return (__int16)v4;
}

+ (id)_debugDescriptionDateFormatter
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss Z"));
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  return v2;
}

+ (id)debugDescriptionOfValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("LibraryCreateOptions")))
    {
      PLDescriptionForLibraryCreateOptions(objc_msgSend(v6, "integerValue"));
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v10 = (__CFString *)v9;
      goto LABEL_9;
    }
    if (objc_msgSend(a1, "typeForKey:", v8) != 4)
    {
      objc_msgSend(v6, "description");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_msgSend(a1, "_debugDescriptionDateFormatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate:", v6);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = CFSTR("nil");
  }
LABEL_9:

  return v10;
}

+ (id)allDecodeClasses
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(a1, "attributesForKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__PLGlobalKeyValue_allDecodeClasses__block_invoke;
  v7[3] = &unk_1E366E1D8;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

+ (void)checkTypeForKey:(id)a3 andValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v6 = a4;
  switch(objc_msgSend(a1, "typeForKey:", v14))
  {
    case 0u:
      v7 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No type defined for key %@"), v14, v13);
      goto LABEL_18;
    case 1u:
    case 2u:
    case 3u:
      if (!v6)
        goto LABEL_14;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_14;
      v7 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expect number value for key %@"), v14, v13);
      goto LABEL_18;
    case 4u:
      if (!v6)
        goto LABEL_14;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_14;
      v7 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expect date value for key %@"), v14, v13);
      goto LABEL_18;
    case 5u:
      if (!v6)
        goto LABEL_14;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_14;
      v7 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expect string value for key %@"), v14, v13);
      goto LABEL_18;
    case 6u:
      if (!v6)
        goto LABEL_14;
      objc_msgSend(a1, "attributesForKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "anyValueClass");

      if (!v10)
      {
        v7 = (void *)MEMORY[0x1E0C99DA0];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No any-value class defined for key %@"), v14, v13);
        goto LABEL_18;
      }
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = (void *)MEMORY[0x1E0C99DA0];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Value's class not supported for key %@, must confirm to %@"), v14, v10);
LABEL_18:
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "exceptionWithName:reason:userInfo:", CFSTR("GlobalKeyValueTypeMismatchException"), v11, 0);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        objc_exception_throw(v12);
      }
LABEL_14:

      return;
    default:
      goto LABEL_14;
  }
}

+ (void)setGlobalValue:(id)a3 forKey:(id)a4 managedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "checkTypeForKey:andValue:", v9, v10);
  objc_msgSend(a1, "fetchGlobalKeyValueForKey:withManagedObjectContext:createIfMissing:", v9, v8, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_setGlobalValue:forKeyValue:managedObjectContext:", v10, v11, v8);
}

+ (id)globalValueForKey:(id)a3 managedObjectContext:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "fetchGlobalKeyValueForKey:withManagedObjectContext:createIfMissing:", a3, a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_globalValueForKeyValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)globalValuesForKeys:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "fetchGlobalKeyValuesForKeys:withManagedObjectContext:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(a1, "_globalValueForKeyValue:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "key");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v8;
}

+ (id)dictionaryWithManagedObjectContext:(id)a3 forMigrationHistory:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *obj;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint8_t buf[4];
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v4 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(a1, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v9, &v37);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v37;
  if (v10)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v10;
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    if (v12)
    {
      v13 = v12;
      v27 = v11;
      v28 = v10;
      v29 = v9;
      v30 = v6;
      v14 = *(_QWORD *)v34;
      v15 = obj;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(v15);
          v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (!v4)
            goto LABEL_9;
          objc_msgSend(a1, "attributesForKey");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "key");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "includeInMigrationHistory");

          v15 = obj;
          if (v21)
          {
LABEL_9:
            objc_msgSend(a1, "_globalValueForKeyValue:", v17, v27, v28, v29, v30);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "key");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v22, v23);

          }
        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      }
      while (v13);
      v9 = v29;
      v6 = v30;
      v11 = v27;
      v10 = v28;
    }
  }
  else
  {
    PLBackendGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    obj = v24;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v11;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Error fetching GlobalKeyValue for all keys, error: %@", buf, 0xCu);
    }
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v32);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (void)populateWithDictionary:(id)a3 managedObjectContext:(id)a4 replaceExisting:(BOOL)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v12 = a3;
  v8 = a4;
  if (a5)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(a1, "dictionaryWithManagedObjectContext:forMigrationHistory:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__PLGlobalKeyValue_populateWithDictionary_managedObjectContext_replaceExisting___block_invoke;
  v13[3] = &unk_1E366E200;
  v15 = v8;
  v16 = a1;
  v14 = v9;
  v10 = v8;
  v11 = v9;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v13);

}

+ (void)_setGlobalValue:(id)a3 forKeyValue:(id)a4 managedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v12)
      {
        objc_msgSend(v10, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "key");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412802;
        v22 = v13;
        v23 = 2114;
        v24 = v14;
        v25 = 2112;
        v26 = v8;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "GlobalKeyValue: (%@) setting %{public}@ = %@", (uint8_t *)&v21, 0x20u);

      }
      objc_msgSend(v9, "key");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(a1, "typeForKey:", v15);

      objc_msgSend(v9, "setType:", v16);
      switch((int)v16)
      {
        case 0:
          goto LABEL_10;
        case 1:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "BOOLValue"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setBoolValue:", v17);
          goto LABEL_13;
        case 2:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "integerValue"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setIntegerValue:", v17);
          goto LABEL_13;
        case 3:
          v20 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v8, "doubleValue");
          objc_msgSend(v20, "numberWithDouble:");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setDoubleValue:", v17);
LABEL_13:

          break;
        case 4:
          objc_msgSend(v9, "setDateValue:", v8);
          break;
        case 5:
          objc_msgSend(v9, "setStringValue:", v8);
          break;
        case 6:
          objc_msgSend(v9, "setAnyValue:", v8);
          break;
        default:
          break;
      }
    }
    else
    {
      if (v12)
      {
        objc_msgSend(v10, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "key");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412546;
        v22 = v18;
        v23 = 2114;
        v24 = v19;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "GlobalKeyValue: (%@) removing %{public}@", (uint8_t *)&v21, 0x16u);

      }
LABEL_10:
      objc_msgSend(v10, "deleteObject:", v9);
    }
  }

}

+ (id)_globalValueForKeyValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(a1, "typeForKey:", v6);

    switch(v7)
    {
      case 1:
        objc_msgSend(v5, "BOOLValue");
        v8 = objc_claimAutoreleasedReturnValue();
        break;
      case 2:
        objc_msgSend(v5, "integerValue");
        v8 = objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        objc_msgSend(v5, "doubleValue");
        v8 = objc_claimAutoreleasedReturnValue();
        break;
      case 4:
        objc_msgSend(v5, "dateValue");
        v8 = objc_claimAutoreleasedReturnValue();
        break;
      case 5:
        objc_msgSend(v5, "stringValue");
        v8 = objc_claimAutoreleasedReturnValue();
        break;
      case 6:
        objc_msgSend(v5, "anyValue");
        v8 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_4;
    }
    v9 = (void *)v8;
  }
  else
  {
LABEL_4:
    v9 = 0;
  }

  return v9;
}

+ (id)fetchGlobalKeyValueForKey:(id)a3 withManagedObjectContext:(id)a4 createIfMissing:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(a1, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchRequestWithEntityName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("key"), v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v13);

  v19 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v12, &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v19;
  if (v14)
  {
    objc_msgSend(v14, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16 && v5)
    {
      +[PLManagedObject insertInManagedObjectContext:](PLGlobalKeyValue, "insertInManagedObjectContext:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setKey:", v8);
    }
  }
  else
  {
    PLBackendGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v21 = v8;
      v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Error fetching GlobalKeyValue for key %{public}@, error: %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

+ (id)fetchGlobalKeyValuesForKeys:(id)a3 withManagedObjectContext:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C97B48];
  v8 = a4;
  objc_msgSend(a1, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("key"), v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  v16 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v10, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v16;
  if (!v12)
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v18 = v6;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Error fetching GlobalKeyValue for keys %{public}@, error: %@", buf, 0x16u);
    }

  }
  return v12;
}

+ (void)migrateLocaleIdentifierToGlobalKeyValues:(id)a3 withPathManager:(id)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0C99EA0];
  v5 = a3;
  v7 = (id)objc_msgSend([v4 alloc], "initWithSuiteName:", CFSTR("com.apple.mobileslideshow"));
  objc_msgSend(v7, "objectForKey:", CFSTR("com.apple.Photos.LocaleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("LocaleIdentifier"));

}

void __80__PLGlobalKeyValue_populateWithDictionary_managedObjectContext_replaceExisting___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && !v7)
    objc_msgSend(*(id *)(a1 + 48), "setGlobalValue:forKey:managedObjectContext:", v6, v5, *(_QWORD *)(a1 + 40));

}

void __36__PLGlobalKeyValue_allDecodeClasses__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 6 && objc_msgSend(v4, "anyValueClass"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(v4, "anyValueClass"));

}

void __36__PLGlobalKeyValue_attributesForKey__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _QWORD v79[65];

  v79[63] = *MEMORY[0x1E0C80C00];
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("ImportedFileSystemAssets"), 2);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v73;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("ImportedFileSystemAssetsDate"), 4);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v72;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("JournalRebuildRequired"), 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v79[2] = v71;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("BackgroundJobServiceNeedsProcessing"), 1);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v79[3] = v70;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("RebuildCompleteDate"), 4);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v79[4] = v69;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:includeInMigrationHistory:anyValueClass:](PLGlobalKeyValueAttributes, "attributesWithKey:type:includeInMigrationHistory:anyValueClass:", CFSTR("GreenValues"), 6, 0, objc_opt_class());
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v79[5] = v68;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("LocaleIdentifier"), 5);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v79[6] = v67;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("GreenTeaContactsAuthorization"), 2);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v79[7] = v66;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("LibraryCreateOptions"), 2);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v79[8] = v65;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("LastWidgetUpdateDate"), 4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v79[9] = v64;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("LargestWidgetPixelSize"), 2);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v79[10] = v63;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("LargestWidgetSizeDate"), 4);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v79[11] = v62;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("LastFullIndexSyndicationSyncDate"), 4);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v79[12] = v61;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("LastFullIndexSyndicationSyncStartDate"), 4);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v79[13] = v60;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("InProgressFullIndexSyndicationSyncDate"), 4);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v79[14] = v59;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("LastAttachmentSyndicationSyncDate"), 4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v79[15] = v58;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("LastChatSyndicationSyncDate"), 4);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v79[16] = v57;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("LastDeleteSyndicationSyncDateKey"), 4);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v79[17] = v56;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("SyndicationStartDate"), 4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v79[18] = v55;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("PLSyndicationPrefetchDownloadThrottlingDate"), 4);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v79[19] = v54;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("PLSyndicationSyncRangeDenominator"), 3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v79[20] = v53;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:includeInMigrationHistory:anyValueClass:](PLGlobalKeyValueAttributes, "attributesWithKey:type:includeInMigrationHistory:anyValueClass:", CFSTR("LastGuestAssetSyncToken"), 6, 0, objc_opt_class());
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v79[21] = v52;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("GuestAssetSyncStatus"), 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v79[22] = v51;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("GuestAssetInitialSyncResumeMarker"), 5);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v79[23] = v50;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("LastGuestAssetSyncTargetLibraryPath"), 5);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v79[24] = v49;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:includeInMigrationHistory:anyValueClass:](PLGlobalKeyValueAttributes, "attributesWithKey:type:includeInMigrationHistory:anyValueClass:", CFSTR("LastPersonSyncToken"), 6, 0, objc_opt_class());
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v79[25] = v48;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("LastPersonSyncSourceLibraryPath"), 5);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v79[26] = v47;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:includeInMigrationHistory:anyValueClass:](PLGlobalKeyValueAttributes, "attributesWithKey:type:includeInMigrationHistory:anyValueClass:", CFSTR("LastDuplicateDetectorProcessingToken"), 6, 0, objc_opt_class());
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v79[27] = v46;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:includeInMigrationHistory:anyValueClass:](PLGlobalKeyValueAttributes, "attributesWithKey:type:includeInMigrationHistory:anyValueClass:", CFSTR("LastInitialDuplicateDetectorProcessingCompletedToken"), 6, 0, objc_opt_class());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v79[28] = v45;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("AssetStackProcessingStatus"), 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v79[29] = v44;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:includeInMigrationHistory:anyValueClass:](PLGlobalKeyValueAttributes, "attributesWithKey:type:includeInMigrationHistory:anyValueClass:", CFSTR("LastSharedAssetContainerUpdateToken"), 6, 0, objc_opt_class());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v79[30] = v43;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("LockedResourceTransitionAssetUUID"), 5);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v79[31] = v42;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("OrphanedSceneClassificationsCount"), 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v79[32] = v41;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("CloudTrackerLastKnownCloudVersion"), 5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v79[33] = v40;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("CloudTrackerLastKnownTransactionStoreUUID"), 5);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v79[34] = v39;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("CloudTrackerLastKnownTransactionNumber"), 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v79[35] = v38;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("CloudInitialUploadDate"), 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v79[36] = v37;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("LibraryScopeRulesTrackerLastKnownStoreUUID"), 5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v79[37] = v36;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("LibraryScopeRulesTrackerLastKnownTransactionNumber"), 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v79[38] = v35;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("LastCompletePrefetchDate"), 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v79[39] = v34;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("SearchIndexVersion"), 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v79[40] = v33;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("SearchIndexEmbeddingModelVersionKey"), 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v79[41] = v32;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("SearchIndexUtilityTypeClassifierVersion"), 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v79[42] = v31;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("SearchIndexLocaleIdentifier"), 5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v79[43] = v30;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("SearchIndexSceneTaxonomySHA"), 5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v79[44] = v29;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("SearchIndexFeatureSettings"), 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v79[45] = v28;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("SearchIndexStatus"), 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v79[46] = v26;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("SearchIndexRebuildResumeMarker"), 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v79[47] = v25;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:includeInMigrationHistory:anyValueClass:](PLGlobalKeyValueAttributes, "attributesWithKey:type:includeInMigrationHistory:anyValueClass:", CFSTR("SearchIndexSpotlightClientState"), 6, 0, objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v79[48] = v24;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("SearchIndexSpotlightClientStateMissingCount"), 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v79[49] = v23;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("SearchIndexSpotlightClientStateMismatchedCount"), 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v79[50] = v22;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("SearchIndexRebuildRequiredExternalReason"), 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v79[51] = v21;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("SearchIndexRebuildStartDate"), 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v79[52] = v20;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("SearchIndexRebuildEndDate"), 4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v79[53] = v0;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("SearchIndexRebuildCoalescedReasons"), 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v79[54] = v1;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("LastUpdatedGraphLabel"), 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v79[55] = v2;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:includeInMigrationHistory:anyValueClass:](PLGlobalKeyValueAttributes, "attributesWithKey:type:includeInMigrationHistory:anyValueClass:", CFSTR("FeatureAvailabilityKey"), 6, 0, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v79[56] = v3;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("TimeOfLastFeatureAvailabilityJob"), 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v79[57] = v4;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("SearchFeatureReadyDate"), 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v79[58] = v5;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("SearchFeatureReadyFraction"), 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v79[59] = v6;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("MediaAnalysisEmbeddingVersion"), 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v79[60] = v7;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("MediaAnalysisEmbeddingVersionBumpDate"), 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v79[61] = v8;
  +[PLGlobalKeyValueAttributes attributesWithKey:type:](PLGlobalKeyValueAttributes, "attributesWithKey:type:", CFSTR("LibraryReadyForAnalysisDate"), 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v79[62] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 63);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v11 = v27;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v75 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
        objc_msgSend(v16, "key");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
    }
    while (v13);
  }

  v18 = objc_msgSend(v10, "copy");
  v19 = (void *)attributesForKey_attributesForKey;
  attributesForKey_attributesForKey = v18;

}

@end
