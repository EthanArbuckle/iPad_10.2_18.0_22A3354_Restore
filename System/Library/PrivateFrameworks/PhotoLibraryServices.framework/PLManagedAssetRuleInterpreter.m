@implementation PLManagedAssetRuleInterpreter

- (id)evaluateObjects:(id)a3 forCondition:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  PLQueryChangeDetectionCriteria *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v25;
  uint8_t buf[4];
  id v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(PLQueryChangeDetectionCriteria);
  objc_msgSend(v5, "conditionQuery");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLQueryHandler predicateForQuery:inLibrary:changeDetectionCriteria:](PLQueryHandler, "predicateForQuery:inLibrary:changeDetectionCriteria:", v10, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchRequestWithEntityName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3528];
  v28[0] = v11;
  v28[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "andPredicateWithSubpredicates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPredicate:", v18);

  objc_msgSend(v8, "managedObjectContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v19, "executeFetchRequest:error:", v15, &v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v25;

  if (v21)
  {
    PLBackendGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v21;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Failed to fetch assets passing condition: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

@end
