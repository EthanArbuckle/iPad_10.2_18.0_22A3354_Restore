@implementation PLGraphNodeValue

- (BOOL)valueDidChange
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[PLGraphNodeValue changedValues](self, "changedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("stringValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    -[PLGraphNodeValue changedValues](self, "changedValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dateValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v5 = 1;
    }
    else
    {
      -[PLGraphNodeValue changedValues](self, "changedValues");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BOOLeanValue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v5 = 1;
      }
      else
      {
        -[PLGraphNodeValue changedValues](self, "changedValues");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("intValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v5 = 1;
        }
        else
        {
          -[PLGraphNodeValue changedValues](self, "changedValues");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("floatValue"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v13 != 0;

        }
      }

    }
  }

  return v5;
}

- (BOOL)isInsertedDeletedOrChanged
{
  return (-[PLGraphNodeValue isInserted](self, "isInserted") & 1) != 0
      || (-[PLGraphNodeValue isDeleted](self, "isDeleted") & 1) != 0
      || -[PLGraphNodeValue valueDidChange](self, "valueDidChange");
}

+ (id)entityName
{
  return CFSTR("GraphNodeValue");
}

+ (id)fetchGraphNodeValuesWithName:(id)a3 andValues:(id)a4 forValueType:(id)a5 inContext:(id)a6 prefetchNode:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  const __CFString *v35;
  _QWORD v36[2];
  _QWORD v37[3];
  _QWORD v38[3];

  v7 = a7;
  v38[2] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0C97B48];
  v14 = a4;
  v15 = a3;
  +[PLGraphNodeValue entityName](PLGraphNodeValue, "entityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchRequestWithEntityName:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("valueName"), v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v38[0] = v19;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), v11, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v38[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "andPredicateWithSubpredicates:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPredicate:", v22);

  v37[0] = CFSTR("valueName");
  v37[1] = v11;
  v37[2] = CFSTR("node");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPropertiesToFetch:", v23);

  if (v7)
  {
    v36[0] = CFSTR("valueName");
    v36[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPropertiesToFetch:", v24);

    v35 = CFSTR("node");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRelationshipKeyPathsForPrefetching:", v25);

  }
  v30 = 0;
  objc_msgSend(v12, "executeFetchRequest:error:", v17, &v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v30;
  if (!v26)
  {
    PLBackendGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v12;
      v33 = 2112;
      v34 = v27;
      _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "Failed to fetch graph node values for context %@ (ERROR: %@)", buf, 0x16u);
    }

  }
  return v26;
}

+ (void)_debug_assertAllValuesAreOfType:(id)a3 inCollection:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
        if (objc_msgSend(v5, "isEqualToString:", CFSTR("stringValue")))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_13;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = v11;
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGraphNodeValue.m"), 84, CFSTR("%@ is not of the type %@"), v14, v5);
          goto LABEL_19;
        }
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("intValue")) & 1) != 0
          || (objc_msgSend(v5, "isEqualToString:", CFSTR("floatValue")) & 1) != 0
          || objc_msgSend(v5, "isEqualToString:", CFSTR("BOOLeanValue")))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_13;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v16 = v11;
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGraphNodeValue.m"), 86, CFSTR("%@ is not of the type %@"), v16, v5);
          goto LABEL_19;
        }
        if (objc_msgSend(v5, "isEqualToString:", CFSTR("dateValue")))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v15 = v11;
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGraphNodeValue.m"), 88, CFSTR("%@ is not of the type %@"), v15, v5);
LABEL_19:

          }
        }
LABEL_13:
        ++v10;
      }
      while (v8 != v10);
      v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v8 = v13;
    }
    while (v13);
  }

}

@end
