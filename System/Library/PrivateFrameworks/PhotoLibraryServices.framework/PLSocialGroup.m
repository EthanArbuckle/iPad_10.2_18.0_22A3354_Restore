@implementation PLSocialGroup

- (id)_insertMemberEdgeForPerson:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSocialGroup.m"), 310, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  }
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLGraphEdge entityName](PLGraphEdge, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v8, (uint64_t)v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSourceNode:", v10);

  objc_msgSend(v9, "setTargetPerson:", v5);
  return v9;
}

- (id)_existingMemberEdgeForPerson:(id)a3 success:(BOOL *)a4 error:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  id v19;
  void *v21;
  id v22;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSocialGroup.m"), 322, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  }
  +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3880];
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K = %@ AND %K = %@"), CFSTR("sourceNode"), v12, CFSTR("targetPerson"), v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v13);

  objc_msgSend(v9, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v14, "executeFetchRequest:error:", v10, &v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v22;

  if (v15)
  {
    objc_msgSend(v15, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 1;
  }
  else if (a5)
  {
    v19 = objc_retainAutorelease(v16);
    v18 = 0;
    v17 = 0;
    *a5 = v19;
  }
  else
  {
    v18 = 0;
    v17 = 0;
  }
  *a4 = v18;

  return v17;
}

- (void)_fetchEdgesOut
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3880];
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("sourceNode"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v6);

  v16[0] = CFSTR("labels");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRelationshipKeyPathsForPrefetching:", v7);

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v10 = (id)objc_msgSend(v9, "executeFetchRequest:error:", v3, &v13);
  v11 = v13;

  if (v11)
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch graph edges with error: %@", buf, 0xCu);
    }

  }
}

- (id)_keyAssetEdgeWithSuccess:(BOOL *)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  *a3 = 1;
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pl_graphCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "labelWithCode:inContext:", 1001, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3528];
  v13 = (void *)MEMORY[0x1E0CB3880];
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithFormat:", CFSTR("noindex:(%K) = %@"), CFSTR("sourceNode"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v15;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) != nil"), CFSTR("targetAsset"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v16;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ in %K"), v10, CFSTR("labels"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v19);

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "managedObjectContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v21, "executeFetchRequest:error:", v11, &v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v28;

  if (v22)
  {
    objc_msgSend(v22, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    *a3 = 0;
    v24 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v23);
  }

  return v24;
}

- (id)_personEdgesOutWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v16;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3880];
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K = %@ AND %K != nil"), CFSTR("sourceNode"), v9, CFSTR("targetPerson"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v10);

  v16 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v7, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  v13 = v12;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v12);
  }

  return v14;
}

- (id)_insertGraphEdgeForAsset:(id)a3 exclusiveLabel:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSocialGroup.m"), 402, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLGraphEdge entityName](PLGraphEdge, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v11, (uint64_t)v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSourceNode:", v13);

  objc_msgSend(v12, "setTargetAsset:", v7);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLabels:", v14);

  }
  return v12;
}

- (id)_inclusiveAssetEdgesOutForSpecificAssetIDs:(id)a3 prefetchEdgeLabels:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  id v26;
  uint8_t buf[4];
  id v28;
  const __CFString *v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v4 = a4;
  v31[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3528];
  v11 = (void *)MEMORY[0x1E0CB3880];
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("sourceNode"), v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v6)
  {
    v30[0] = v13;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("targetAsset"), v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v15;
    v16 = v30;
  }
  else
  {
    v31[0] = v13;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("targetAsset"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v15;
    v16 = v31;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v18);

  if (v4)
  {
    v29 = CFSTR("labels");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v19);

  }
  v26 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v9, &v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v26;
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v20);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLBackendGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v21;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Error fetching social inclusive group asset edges: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v22;

  return v24;
}

- (id)_exclusiveAssetEdgesOutFetch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pl_graphCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labelWithCode:inContext:", 1004, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3528];
  v9 = (void *)MEMORY[0x1E0CB3880];
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("sourceNode"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("targetAsset"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ IN %K"), v6, CFSTR("labels"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v15);

  return v7;
}

- (id)_exclusiveAssetEdgesOut
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLSocialGroup _exclusiveAssetEdgesOutFetch](self, "_exclusiveAssetEdgesOutFetch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v5, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Error fetching social group exclusive asset edges: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v8;

  return v10;
}

- (BOOL)_existingExclusiveAssetEdgeOut
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLSocialGroup _exclusiveAssetEdgesOutFetch](self, "_exclusiveAssetEdgesOutFetch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchLimit:", 1);
  v10 = 0;
  v6 = objc_msgSend(v4, "countForFetchRequest:error:", v5, &v10);
  v7 = v10;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "_existingExclusiveAssetEdgeOut: fetch request failed: %@", buf, 0xCu);
    }

    v6 = 0;
  }

  return v6 != 0;
}

- (PLSocialGroup)initWithNode:(id)a3
{
  id v5;
  PLSocialGroup *v6;
  void *v8;
  objc_super v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSocialGroup.m"), 512, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("node"));

  }
  v9.receiver = self;
  v9.super_class = (Class)PLSocialGroup;
  v6 = -[PLGraphNodeContainer initWithNode:](&v9, sel_initWithNode_, v5);

  return v6;
}

- (NSString)customTitle
{
  void *v2;
  void *v3;
  void *v4;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeValueWithName:", CFSTR("customTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setCustomTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeValueWithName:createIfMissing:", CFSTR("customTitle"), 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setStringValue:", v4);
  -[PLGraphNodeContainer updateChangeFlagsForNodeContainerKey:](self, "updateChangeFlagsForNodeContainerKey:", CFSTR("customTitle"));

}

- (NSNumber)manualOrder
{
  void *v2;
  void *v3;
  void *v4;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeValueWithName:", CFSTR("manualOrder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "intValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setManualOrder:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSocialGroup.m"), 584, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("manualOrder"));

  }
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeValueWithName:createIfMissing:", CFSTR("manualOrder"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIntValue:", objc_msgSend(v8, "integerValue"));
  -[PLGraphNodeContainer updateChangeFlagsForNodeContainerKey:](self, "updateChangeFlagsForNodeContainerKey:", CFSTR("manualOrder"));

}

- (NSNumber)automaticOrder
{
  void *v2;
  void *v3;
  void *v4;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeValueWithName:", CFSTR("automaticOrder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "intValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setAutomaticOrder:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSocialGroup.m"), 598, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("automaticOrder"));

  }
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeValueWithName:createIfMissing:", CFSTR("automaticOrder"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIntValue:", objc_msgSend(v8, "integerValue"));
  -[PLGraphNodeContainer updateChangeFlagsForNodeContainerKey:](self, "updateChangeFlagsForNodeContainerKey:", CFSTR("automaticOrder"));

}

- (signed)socialGroupVerifiedType
{
  void *v2;
  void *v3;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeValueWithName:", CFSTR("socialGroupVerifiedType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v2) = objc_msgSend(v3, "intValue");
  return (__int16)v2;
}

- (BOOL)resetCustomDataWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  char v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  -[PLSocialGroup setCustomTitle:](self, "setCustomTitle:", 0);
  -[PLSocialGroup setManualOrder:](self, "setManualOrder:", &unk_1E375D968);
  v27 = 1;
  if (-[PLSocialGroup keyAssetPickSource](self, "keyAssetPickSource") == 1)
  {
    v26 = 0;
    -[PLSocialGroup _keyAssetEdgeWithSuccess:error:](self, "_keyAssetEdgeWithSuccess:error:", &v27, &v26);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v26;
    v7 = v6;
    if (v27)
    {
      if (v5)
      {
        v25 = v6;
        v8 = -[PLSocialGroup setKeyAssetPickSource:error:](self, "setKeyAssetPickSource:error:", 0, &v25);
        v9 = v25;

        if (!v8)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v9);
          v27 = 0;
        }
        -[PLGraphNodeContainer sourceNode](self, "sourceNode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "managedObjectContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "pl_graphCache");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "labelWithCode:inContext:", 1001, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "removeLabel:", v13);
        -[PLGraphNodeContainer updateChangeFlagsForNodeContainerKey:](self, "updateChangeFlagsForNodeContainerKey:", CFSTR("keyAsset"));

        v7 = v9;
        goto LABEL_20;
      }
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0D74498];
      v30 = *MEMORY[0x1E0CB2938];
      v31[0] = CFSTR("no key asset edge");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 46502, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (a3)
        *a3 = objc_retainAutorelease(v23);

    }
    else if (a3)
    {
      *a3 = objc_retainAutorelease(v6);
    }
    v27 = 0;
LABEL_20:

    return v27 != 0;
  }
  if (-[PLSocialGroup keyAssetPickSource](self, "keyAssetPickSource") != -1)
    return 1;
  v15 = (void *)MEMORY[0x1E0CB35C8];
  v16 = *MEMORY[0x1E0D74498];
  v28 = *MEMORY[0x1E0CB2938];
  v29 = CFSTR("Error fetching key asset pick source during custom data reset");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 46502, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (a3)
    *a3 = objc_retainAutorelease(v18);

  return 0;
}

- (BOOL)setSocialGroupVerifiedType:(signed __int16)a3 error:(id *)a4
{
  int v5;
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v14;

  v5 = a3;
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 1;
  objc_msgSend(v7, "nodeValueWithName:createIfMissing:", CFSTR("socialGroupVerifiedType"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "intValue") != v5)
  {
    v10 = v5;
    if (v5 == -1 && objc_msgSend(v9, "intValue") == 1)
    {
      v14 = 0;
      v8 = -[PLSocialGroup resetCustomDataWithError:](self, "resetCustomDataWithError:", &v14);
      v11 = v14;
      v12 = v11;
      if (!v8 && a4)
        *a4 = objc_retainAutorelease(v11);

    }
    objc_msgSend(v9, "setIntValue:", v10);
    -[PLGraphNodeContainer updateChangeFlagsForNodeContainerKey:](self, "updateChangeFlagsForNodeContainerKey:", CFSTR("socialGroupVerifiedType"));
  }

  return v8;
}

- (PLManagedAsset)keyAsset
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v7;
  char v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 1;
  v7 = 0;
  -[PLSocialGroup _keyAssetEdgeWithSuccess:error:](self, "_keyAssetEdgeWithSuccess:error:", &v8, &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (!v8)
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v3;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Error fetching key asset: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v2, "targetAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLManagedAsset *)v5;
}

- (void)_resetExistingKeyAssetEdge:(id)a3 keyAssetLabel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "pl_graphCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeLabel:", v6);

  objc_msgSend(v9, "labelWithCode:inContext:", 1003, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeLabel:", v10);

}

- (BOOL)setKeyAsset:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  unsigned __int8 v48;
  uint8_t buf[4];
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSocialGroup.m"), 689, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyAsset"));

  }
  v48 = 1;
  v47 = 0;
  -[PLSocialGroup _keyAssetEdgeWithSuccess:error:](self, "_keyAssetEdgeWithSuccess:error:", &v48, &v47);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v47;
  v10 = v9;
  v11 = v48;
  if (v48)
  {
    if (!v8
      || (objc_msgSend(v8, "targetAsset"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "isEqual:", v7),
          v12,
          (v13 & 1) == 0))
    {
      v41 = v10;
      -[PLGraphNodeContainer sourceNode](self, "sourceNode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "managedObjectContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "pl_graphCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "labelWithCode:inContext:", 1001, v15);
      v17 = objc_claimAutoreleasedReturnValue();
      v40 = v16;
      objc_msgSend(v16, "labelWithCode:inContext:", 1004, v15);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[PLSocialGroup _resetExistingKeyAssetEdge:keyAssetLabel:](self, "_resetExistingKeyAssetEdge:keyAssetLabel:", v8, v17);

      }
      v39 = (void *)v17;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      -[PLSocialGroup _inclusiveAssetEdgesOutForSpecificAssetIDs:prefetchEdgeLabels:](self, "_inclusiveAssetEdgesOutForSpecificAssetIDs:prefetchEdgeLabels:", 0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v44;
LABEL_10:
        v22 = 0;
        while (1)
        {
          if (*(_QWORD *)v44 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v22);
          objc_msgSend(v23, "targetAsset");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "isEqual:", v7))
            break;

          if (v20 == ++v22)
          {
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
            if (v20)
              goto LABEL_10;
            goto LABEL_16;
          }
        }
        objc_msgSend(v23, "labels");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "containsObject:", v42);

        v25 = v40;
        if ((v28 & 1) == 0)
        {
          objc_msgSend(0, "addLabel:", v42);
          PLBackendGetLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "uuid");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v50 = v30;
            _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "[PLSocialGroup] Missing exclusive label from social group key asset edge found for key asset with uuid %@", buf, 0xCu);

          }
        }
        v8 = v23;

        v10 = v41;
        v26 = v39;
        if (v8)
          goto LABEL_27;
      }
      else
      {
LABEL_16:

        v25 = v40;
        v10 = v41;
        v26 = v39;
      }
      PLBackendGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "uuid");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v50 = v32;
        _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "[PLSocialGroup] No existing social group key asset edge found for key asset with uuid %@", buf, 0xCu);

      }
      +[PLGraphEdge entityName](PLGraphEdge, "entityName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v33, (uint64_t)v15, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      -[PLGraphNodeContainer sourceNode](self, "sourceNode");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSourceNode:", v34);

      objc_msgSend(v8, "setTargetAsset:", v7);
      objc_msgSend(v25, "labelWithCode:inContext:", 1004, v15);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLabels:", v36);

LABEL_27:
      objc_msgSend(v8, "addLabel:", v26);
      -[PLGraphNodeContainer updateChangeFlagsForNodeContainerKey:](self, "updateChangeFlagsForNodeContainerKey:", CFSTR("keyAsset"));

    }
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease(v9);
  }

  return v11 != 0;
}

- (int64_t)keyAssetPickSource
{
  void *v2;
  id v3;
  int64_t v4;
  NSObject *v5;
  id v7;
  char v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 1;
  v7 = 0;
  -[PLSocialGroup _keyAssetEdgeWithSuccess:error:](self, "_keyAssetEdgeWithSuccess:error:", &v8, &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v8)
  {
    v4 = objc_msgSend(v2, "hasLabelWithCode:", 1003);
  }
  else
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v3;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Error fetching key asset edge: %@", buf, 0xCu);
    }

    v4 = -1;
  }

  return v4;
}

- (BOOL)setKeyAssetPickSource:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString **v19;
  uint64_t *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  char v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "pl_graphCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "labelWithCode:inContext:", 1003, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 1;
  v25 = 0;
  -[PLSocialGroup _keyAssetEdgeWithSuccess:error:](self, "_keyAssetEdgeWithSuccess:error:", &v26, &v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v25;
  v13 = v12;
  if (!v26)
  {
    if (a4)
    {
      v15 = 0;
      *a4 = objc_retainAutorelease(v12);
      goto LABEL_19;
    }
LABEL_15:
    v15 = 0;
    goto LABEL_19;
  }
  if (!v11)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0D74498];
    v29 = *MEMORY[0x1E0CB2938];
    v30[0] = CFSTR("no key asset edge");
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = (const __CFString **)v30;
    v20 = &v29;
LABEL_12:
    objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 46502, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a4)
      *a4 = objc_retainAutorelease(v22);

    goto LABEL_15;
  }
  v14 = objc_msgSend(v11, "hasLabel:", v10);
  if (a3 == -1)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0D74498];
    v27 = *MEMORY[0x1E0CB2938];
    v28 = CFSTR("Invalid key-asset pick source");
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = &v28;
    v20 = &v27;
    goto LABEL_12;
  }
  if (a3 == 1)
  {
    if ((v14 & 1) == 0)
      objc_msgSend(v11, "addLabel:", v10);
  }
  else if (!a3 && v14)
  {
    objc_msgSend(v11, "removeLabel:", v10);
  }
  -[PLGraphNodeContainer updateChangeFlagsForNodeContainerKey:](self, "updateChangeFlagsForNodeContainerKey:", CFSTR("keyAssetPickSource"));
  v15 = 1;
LABEL_19:

  return v15;
}

- (NSSet)members
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  -[PLSocialGroup _personEdgesOutWithError:](self, "_personEdgesOutWithError:", &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "_personsFromEdges:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Failed to fetch member edges with error: %@", buf, 0xCu);
    }

    v4 = 0;
  }

  return (NSSet *)v4;
}

- (BOOL)setMembers:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  id v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSocialGroup.m"), 809, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("members"));

  }
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLSocialGroup _personEdgesOutWithError:](self, "_personEdgesOutWithError:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v9, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v13);
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          v21 = -[PLSocialGroup _insertMemberEdgeForPerson:](self, "_insertMemberEdgeForPerson:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v18);
    }

    -[PLGraphNodeContainer updateChangeFlagsForNodeContainerKey:](self, "updateChangeFlagsForNodeContainerKey:", CFSTR("members"));
  }

  return v11 != 0;
}

- (BOOL)addMember:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  int v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v16;
  id v17;
  unsigned __int8 v18;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSocialGroup.m"), 833, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  }
  v18 = 1;
  v17 = 0;
  -[PLSocialGroup _existingMemberEdgeForPerson:success:error:](self, "_existingMemberEdgeForPerson:success:error:", v7, &v18, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  v10 = v18;
  if (!v8 && v18)
  {
    v11 = -[PLSocialGroup _insertMemberEdgeForPerson:](self, "_insertMemberEdgeForPerson:", v7);
    -[PLGraphNodeContainer updateChangeFlagsForNodeContainerKey:](self, "updateChangeFlagsForNodeContainerKey:", CFSTR("members"));
    v10 = v18;
  }
  v12 = v9;
  v13 = v12;
  if (!v10 && a4)
    *a4 = objc_retainAutorelease(v12);

  v14 = v18;
  return v14;
}

- (BOOL)removeMember:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v17;
  id v18;
  unsigned __int8 v19;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSocialGroup.m"), 849, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  }
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 1;
  v18 = 0;
  -[PLSocialGroup _existingMemberEdgeForPerson:success:error:](self, "_existingMemberEdgeForPerson:success:error:", v7, &v19, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;
  if (v10)
  {
    objc_msgSend(v9, "deleteObject:", v10);
    -[PLGraphNodeContainer updateChangeFlagsForNodeContainerKey:](self, "updateChangeFlagsForNodeContainerKey:", CFSTR("members"));
  }
  v12 = v19;
  v13 = v11;
  v14 = v13;
  if (!v12 && a4)
    *a4 = objc_retainAutorelease(v13);

  v15 = v19;
  return v15;
}

- (id)inclusiveAssetIDs
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PLSocialGroup _inclusiveAssetEdgesOutForSpecificAssetIDs:prefetchEdgeLabels:](self, "_inclusiveAssetEdgesOutForSpecificAssetIDs:prefetchEdgeLabels:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "objectIDsForRelationshipNamed:", CFSTR("targetAsset"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (id)exclusiveAssetIDs
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PLSocialGroup _exclusiveAssetEdgesOut](self, "_exclusiveAssetEdgesOut");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "objectIDsForRelationshipNamed:", CFSTR("targetAsset"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (id)runAssetContainmentWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void (**v15)(id, _QWORD, void *);
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  PLSocialGroup *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  v5 = (void *)MEMORY[0x1E0CB38A8];
  -[PLSocialGroup members](self, "members");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "progressWithTotalUnitCount:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D74498];
    v23 = *MEMORY[0x1E0CB2938];
    v24[0] = CFSTR("asset containment failed: no library");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 46502, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v13);

  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __51__PLSocialGroup_runAssetContainmentWithCompletion___block_invoke;
  v19[3] = &unk_1E3676290;
  v14 = v7;
  v20 = v14;
  v21 = self;
  v22 = v4;
  v15 = v4;
  objc_msgSend(v9, "performTransaction:", v19);
  v16 = v22;
  v17 = v14;

  return v17;
}

- (BOOL)runAssetContainmentWithError:(id *)a3 assetIDsToUpdate:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  PLSocialGroup *v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (-[PLSocialGroup socialGroupVerifiedType](self, "socialGroupVerifiedType") == -1
    || !-[PLSocialGroup socialGroupVerifiedType](self, "socialGroupVerifiedType"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSocialGroup.m"), 910, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.socialGroupVerifiedType != PLSocialGroupVerifiedTypeRejected && self.socialGroupVerifiedType != PLSocialGroupVerifiedTypeNone"));

  }
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 1;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__12949;
    v32 = __Block_byref_object_dispose__12950;
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __63__PLSocialGroup_runAssetContainmentWithError_assetIDsToUpdate___block_invoke;
    v22[3] = &unk_1E366F518;
    v11 = v10;
    v23 = v11;
    v24 = self;
    v25 = v7;
    v26 = &v28;
    v27 = &v34;
    objc_msgSend(v9, "performBlockAndWait:", v22);
    v12 = *((unsigned __int8 *)v35 + 24);
    v13 = (id)v29[5];
    v14 = v13;
    if (!v12 && a3)
      *a3 = objc_retainAutorelease(v13);

    v15 = *((_BYTE *)v35 + 24) != 0;
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2938];
    v39[0] = CFSTR("asset containment failed: no managed object context");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46502, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a3)
      *a3 = objc_retainAutorelease(v18);

    v15 = 0;
  }

  return v15;
}

- (BOOL)_updateAssetEdgesWithAssetContainmentResult:(id)a3 assetIDsToUpdate:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PLEnumerateAndSaveController *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  id v46;
  void *v47;
  char v48;
  void *v50;
  id v51;
  void *v52;
  id v53;
  BOOL v54;
  id v55;
  id v56;
  void *v57;
  id v59;
  void *v60;
  id v61;
  PLSocialGroup *v62;
  void *v63;
  void *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  PLSocialGroup *v75;
  _QWORD v76[4];
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t buf[4];
  void *v83;
  _BYTE v84[128];
  uint64_t v85;
  const __CFString *v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v61 = a3;
  v62 = self;
  v59 = a4;
  -[PLSocialGroup _inclusiveAssetEdgesOutForSpecificAssetIDs:prefetchEdgeLabels:](self, "_inclusiveAssetEdgesOutForSpecificAssetIDs:prefetchEdgeLabels:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v79 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v15, "targetAsset");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v18);
        objc_autoreleasePoolPop(v16);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
    }
    while (v12);
  }

  -[PLGraphNodeContainer sourceNode](v62, "sourceNode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "managedObjectContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v61, "inclusiveAssetIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPredicate:", v23);

  objc_msgSend(v61, "exclusiveAssetIDs");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "pl_graphCache");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "labelWithCode:inContext:", 1004, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = [PLEnumerateAndSaveController alloc];
  NSStringFromSelector(a2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "pathManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x1E0C809B0];
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __84__PLSocialGroup__updateAssetEdgesWithAssetContainmentResult_assetIDsToUpdate_error___block_invoke;
  v76[3] = &unk_1E36700D0;
  v77 = v20;
  v71[0] = v28;
  v71[1] = 3221225472;
  v71[2] = __84__PLSocialGroup__updateAssetEdgesWithAssetContainmentResult_assetIDsToUpdate_error___block_invoke_2;
  v71[3] = &unk_1E3663558;
  v56 = v9;
  v72 = v56;
  v55 = v64;
  v73 = v55;
  v53 = v24;
  v74 = v53;
  v75 = v62;
  v57 = v22;
  v65 = v77;
  v29 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v25, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v26, v22, v77, v27, 0, 0, v76, 0, v71);

  v70 = 0;
  v52 = (void *)v29;
  LOBYTE(v29) = objc_msgSend((id)v29, "processObjectsWithError:", &v70);
  v51 = v70;
  v30 = 0;
  v54 = v29;
  if ((v29 & 1) == 0)
  {
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0D74498];
    v85 = *MEMORY[0x1E0CB2938];
    v86 = CFSTR("runAssetContainmentWithError: error getting asset from assetID");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, 41003, v33);
    v30 = objc_claimAutoreleasedReturnValue();

  }
  v50 = (void *)v30;
  objc_msgSend(v60, "labelWithCode:inContext:", 1003, v65);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v34 = v10;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v67;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v67 != v37)
          objc_enumerationMutation(v34);
        v39 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
        objc_msgSend(v39, "targetAsset");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41 && (objc_msgSend(v21, "containsObject:", v41) & 1) == 0)
        {
          objc_msgSend(v39, "labels");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "containsObject:", v63);

          if (v43)
          {
            PLBackendGetLog();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v40, "uuid");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v83 = v45;
              _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_ERROR, "[PLSocialGroup] Deleting user picked key asset edge for key asset with uuid %@", buf, 0xCu);

            }
          }
          objc_msgSend(v65, "deleteObject:", v39);
        }

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
    }
    while (v36);
  }

  -[PLGraphNodeContainer updateChangeFlagsForNodeContainerKey:](v62, "updateChangeFlagsForNodeContainerKey:", CFSTR("inclusiveAssetIDs"));
  -[PLGraphNodeContainer updateChangeFlagsForNodeContainerKey:](v62, "updateChangeFlagsForNodeContainerKey:", CFSTR("exclusiveAssetIDs"));
  v46 = v50;
  v47 = v46;
  if (a5)
    v48 = v54;
  else
    v48 = 1;
  if ((v48 & 1) == 0)
    *a5 = objc_retainAutorelease(v46);

  return v54;
}

- (BOOL)keyAssetIsNeeded
{
  int v3;
  void *v4;
  int v5;
  BOOL v6;

  v3 = -[PLSocialGroup socialGroupVerifiedType](self, "socialGroupVerifiedType");
  -[PLSocialGroup keyAsset](self, "keyAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLSocialGroup keyAssetPickSource](self, "keyAssetPickSource") == -1)
  {
    v5 = 0;
  }
  else if (v4)
  {
    v5 = objc_msgSend(v4, "isVisibleForSocialGroupKeyAssetFetch") ^ 1;
  }
  else
  {
    v5 = 1;
  }
  v6 = (v3 + 1) >= 2
    && v5
    && -[PLSocialGroup _existingExclusiveAssetEdgeOut](self, "_existingExclusiveAssetEdgeOut");

  return v6;
}

id __84__PLSocialGroup__updateAssetEdgesWithAssetContainmentResult_assetIDsToUpdate_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __84__PLSocialGroup__updateAssetEdgesWithAssetContainmentResult_assetIDsToUpdate_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  v16 = a3;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v16, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 40);
  objc_msgSend(v16, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);
  v10 = v9;
  if (v6)
  {

    objc_msgSend(v6, "labels");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", *(_QWORD *)(a1 + 48));

    if (v10)
    {
      if ((v12 & 1) == 0)
        objc_msgSend(v6, "addLabel:", *(_QWORD *)(a1 + 48));
    }
    else if (v12)
    {
      objc_msgSend(v6, "removeLabel:", *(_QWORD *)(a1 + 48));
    }
  }
  else
  {
    if (v9)
      v13 = *(void **)(a1 + 48);
    else
      v13 = 0;
    v14 = v13;

    v15 = (id)objc_msgSend(*(id *)(a1 + 56), "_insertGraphEdgeForAsset:exclusiveLabel:", v16, v14);
  }

}

void __63__PLSocialGroup_runAssetContainmentWithError_assetIDsToUpdate___block_invoke(uint64_t a1)
{
  PLSocialGroupAssetContainment *v2;
  PLSocialGroupAssetContainment *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  id obj;
  uint64_t v17;
  uint64_t v18;

  objc_msgSend(*(id *)(a1 + 32), "becomeCurrentWithPendingUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  v2 = -[PLSocialGroupAssetContainment initWithSocialGroup:]([PLSocialGroupAssetContainment alloc], "initWithSocialGroup:", *(_QWORD *)(a1 + 40));
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(_QWORD *)(v5 + 40);
  v7 = (id *)(v5 + 40);
  v6 = v8;
  if (v4)
  {
    v18 = v6;
    v9 = (id *)&v18;
    -[PLSocialGroupAssetContainment runAssetContainmentOnAssetIDs:error:](v2, "runAssetContainmentOnAssetIDs:error:", v4, &v18);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = v6;
    v9 = (id *)&v17;
    -[PLSocialGroupAssetContainment runAssetContainment:](v2, "runAssetContainment:", &v17);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
  objc_storeStrong(v7, *v9);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v11 != 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v12 = *(void **)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v14 + 40);
    v15 = objc_msgSend(v12, "_updateAssetEdgesWithAssetContainmentResult:assetIDsToUpdate:error:", v11, v13, &obj);
    objc_storeStrong((id *)(v14 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v15;
  }
  objc_msgSend(*(id *)(a1 + 32), "resignCurrent");

}

void __51__PLSocialGroup_runAssetContainmentWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "becomeCurrentWithPendingUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  v2 = *(void **)(a1 + 40);
  v4 = 0;
  objc_msgSend(v2, "runAssetContainmentWithError:assetIDsToUpdate:", &v4, 0);
  v3 = v4;
  objc_msgSend(*(id *)(a1 + 32), "resignCurrent");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (id)fetchDuplicateSocialGroupIDsWithMemberIDs:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  const __CFString *v46;
  void *v47;
  _QWORD v48[4];

  v48[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "pl_graphCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectIDForLabelWithCode:inContext:", 1000, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v8;
  if (v11)
  {
    v38 = v10;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0C97B48];
    +[PLGraphEdge entityName](PLGraphEdge, "entityName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fetchRequestWithEntityName:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K = %@) AND (%K != nil)"), CFSTR("sourceNode.primaryLabel"), v11, CFSTR("targetPerson"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPredicate:", v16);

    objc_msgSend(v15, "setResultType:", 2);
    v48[0] = CFSTR("sourceNode");
    v48[1] = CFSTR("targetPerson");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPropertiesToFetch:", v17);

    v44 = 0;
    objc_msgSend(v9, "executeFetchRequest:error:", v15, &v44);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v44;
    v20 = v19;
    if (v18)
    {
      objc_msgSend(a1, "_memberIDsByNodeIDFromEdgeDictionaries:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __75__PLSocialGroup_fetchDuplicateSocialGroupIDsWithMemberIDs_inContext_error___block_invoke;
      v41[3] = &unk_1E366C0B0;
      v42 = v8;
      v37 = v12;
      v22 = v12;
      v43 = v22;
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v41);
      +[PLGraphNode fetchRequest](PLGraphNode, "fetchRequest");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setPredicate:", v24);

      objc_msgSend(v23, "setResultType:", 1);
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setSortDescriptors:", v26);

      v40 = v20;
      objc_msgSend(v9, "executeFetchRequest:error:", v23, &v40);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v28 = v40;

      if (!v27 && a5)
        *a5 = objc_retainAutorelease(v28);

      v29 = v37;
    }
    else
    {
      v29 = v12;
      if (a5)
      {
        v28 = objc_retainAutorelease(v19);
        v27 = 0;
        *a5 = v28;
      }
      else
      {
        v27 = 0;
        v28 = v19;
      }
    }

    if (!v18)
    {
      v35 = 0;
      v10 = v38;
      goto LABEL_17;
    }
    v10 = v38;
  }
  else
  {
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0D74498];
    v45 = *MEMORY[0x1E0CB2938];
    v46 = CFSTR("Couldn't retrieve social group labelID");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", v31, 46502, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (a5)
      *a5 = objc_retainAutorelease(v33);

    v27 = 0;
  }
  v27 = v27;
  v35 = v27;
LABEL_17:

  return v35;
}

+ (id)_memberIDsByNodeIDFromEdgeDictionaries:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("sourceNode"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("targetPerson"));
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v11)
          v14 = v12 == 0;
        else
          v14 = 1;
        if (!v14)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v11);
          }
          objc_msgSend(v15, "addObject:", v13);

        }
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)_fetchDuplicateSocialGroupNodes:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id *v26;
  void *v27;
  id v28;
  id v29;
  const __CFString *v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "sourceNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "members");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", CFSTR("objectID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(a1, "fetchDuplicateSocialGroupIDsWithMemberIDs:inContext:error:", v9, v10, &v29);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v29;

    if (v11)
    {
      v26 = a4;
      +[PLGraphNode fetchRequest](PLGraphNode, "fetchRequest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v12;
      v14 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v15;
      v16 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v6, "sourceNode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "predicateWithFormat:", CFSTR("NOT (self = %@)"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "andPredicateWithSubpredicates:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPredicate:", v20);

      v30 = CFSTR("values");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setRelationshipKeyPathsForPrefetching:", v21);

      objc_msgSend(v7, "managedObjectContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      objc_msgSend(v22, "executeFetchRequest:error:", v13, &v28);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v28;

      if (v23)
      {
        v24 = v23;
      }
      else if (v26)
      {
        *v26 = objc_retainAutorelease(v12);
      }

    }
    else if (a4)
    {
      v12 = objc_retainAutorelease(v12);
      v23 = 0;
      *a4 = v12;
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (void)_deleteUserAndGraphGroupsFromDuplicateGroupNodes:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x19AEC1554](v8);
        v14 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSocialGroup, "newNodeContainerWithNode:", v12, (_QWORD)v15);
        if ((objc_msgSend(v14, "socialGroupVerifiedType") | 2) == 2)
          objc_msgSend(v6, "deleteObject:", v12);

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v9 = v8;
    }
    while (v8);
  }

}

+ (BOOL)deleteDuplicateGroupsAfterInsertionOfGroup:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  objc_msgSend(a1, "_fetchDuplicateSocialGroupNodes:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "count"))
  {
    switch(objc_msgSend(v6, "socialGroupVerifiedType"))
    {
      case 0xFFFFFFFF:
      case 1u:
        objc_msgSend(v6, "sourceNode");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "managedObjectContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_deleteUserAndGraphGroupsFromDuplicateGroupNodes:inContext:", v8, v10);
        goto LABEL_6;
      case 0u:
      case 2u:
        objc_msgSend(v6, "sourceNode");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "managedObjectContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sourceNode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "deleteObject:", v11);

LABEL_6:
        break;
      default:
        break;
    }
  }

  return v8 != 0;
}

+ (BOOL)deleteDuplicateGraphAndUnverifiedGroupsInContext:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;
  void *v33;
  void *v34;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  _BYTE v47[128];
  _QWORD v48[2];
  _QWORD v49[5];

  v49[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "pl_graphCache");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "labelWithCode:inContext:", 1000, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  +[PLGraphNodeValue fetchRequest](PLGraphNodeValue, "fetchRequest");
  v6 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x1E0CB3528];
  v38 = (void *)v5;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("node.primaryLabel"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("valueName"), CFSTR("socialGroupVerifiedType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v8;
  v9 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("intValue"), 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("intValue"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v13;
  v14 = (void *)v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicate:", v16);

  v46 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v14, &v46);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v46;
  v19 = v18;
  if (v17)
  {
    objc_msgSend(v17, "valueForKey:", CFSTR("node"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v21)
    {
      v22 = v21;
      v33 = v17;
      v34 = v14;
      v37 = v4;
      v23 = *(_QWORD *)v43;
      v24 = 1;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v43 != v23)
            objc_enumerationMutation(v20);
          v26 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
          v27 = (void *)MEMORY[0x19AEC1554]();
          v28 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSocialGroup, "newNodeContainerWithNode:", v26);
          if ((v24 & 1) != 0)
          {
            v41 = v19;
            v24 = objc_msgSend(a1, "deleteDuplicateGroupsAfterInsertionOfGroup:error:", v28, &v41);
            v29 = v41;

            v19 = v29;
          }
          else
          {
            v24 = 0;
          }

          objc_autoreleasePoolPop(v27);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v22);

      v30 = v19;
      v19 = v30;
      if ((v24 & 1) != 0)
      {
        v31 = 1;
        v4 = v37;
        v14 = v34;
      }
      else
      {
        v4 = v37;
        v14 = v34;
        if (a4)
        {
          v19 = objc_retainAutorelease(v30);
          v31 = 0;
          *a4 = v19;
        }
        else
        {
          v31 = 0;
        }
      }
      v17 = v33;
    }
    else
    {

      v19 = v19;
      v31 = 1;
    }

  }
  else if (a4)
  {
    v19 = objc_retainAutorelease(v18);
    v31 = 0;
    *a4 = v19;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

+ (id)changeFlagsKeysByNodeContainerKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[9];
  _QWORD v14[11];

  v14[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("changeFlag0"), CFSTR("cplChangeFlag"), 0, CFSTR("socialGroupVerifiedType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v2;
  v13[1] = CFSTR("customTitle");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("changeFlag1"), CFSTR("cplChangeFlag"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v3;
  v13[2] = CFSTR("manualOrder");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("changeFlag1"), CFSTR("cplChangeFlag"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v4;
  v13[3] = CFSTR("automaticOrder");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("changeFlag1"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v5;
  v13[4] = CFSTR("members");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("changeFlag2"), CFSTR("cplChangeFlag"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v6;
  v13[5] = CFSTR("keyAssetPickSource");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("changeFlag3"), CFSTR("cplChangeFlag"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v7;
  v13[6] = CFSTR("keyAsset");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("changeFlag3"), CFSTR("cplChangeFlag"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v8;
  v13[7] = CFSTR("inclusiveAssetIDs");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("changeFlag4"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v9;
  v13[8] = CFSTR("exclusiveAssetIDs");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("changeFlag4"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_socialGroupsNodesContainingMember:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint8_t v37[128];
  uint8_t buf[4];
  id v39;
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pl_graphCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labelWithCode:inContext:", 1000, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = CFSTR("sourceNode");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v10);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K = %@) AND (%K = %@)"), CFSTR("sourceNode.primaryLabel"), v7, CFSTR("targetPerson"), v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v11);

    objc_msgSend(v3, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v29 = v9;
    objc_msgSend(v12, "executeFetchRequest:error:", v9, &v36);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v36;

    v30 = v7;
    v31 = v5;
    v28 = v14;
    if (!v13)
    {
      PLBackendGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v14;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Failed to fetch social group edges for person: %@", buf, 0xCu);
      }

      v8 = 0;
    }
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v16 = v13;
    v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v21, "sourceNode");
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v23 = (void *)v22;
            objc_msgSend(v21, "sourceNode");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "isDeleted");

            if ((v25 & 1) == 0)
            {
              objc_msgSend(v21, "sourceNode");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v26);

            }
          }
        }
        v18 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v18);
    }

    v7 = v30;
    v5 = v31;
  }
  else
  {
    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to fetch social group label", buf, 2u);
    }
    v8 = 0;
  }

  return v8;
}

+ (BOOL)deleteSocialGroupsHavingMember:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_socialGroupsNodesContainingMember:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_msgSend(v4, "managedObjectContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deleteObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v5 != 0;
}

+ (BOOL)rejectSocialGroupsHavingMember:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  NSObject *v14;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  objc_msgSend(a1, "_socialGroupsNodesContainingMember:");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x19AEC1554]();
        v11 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSocialGroup, "newNodeContainerWithNode:", v9);
        v17 = 0;
        v12 = objc_msgSend(v11, "setSocialGroupVerifiedType:error:", 0xFFFFFFFFLL, &v17);
        v13 = v17;
        if ((v12 & 1) == 0)
        {
          PLBackendGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v13;
            _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "rejectSocialGroupsHavingMember: error setting social group verified type: %@", buf, 0xCu);
          }

        }
        objc_autoreleasePoolPop(v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v6);
  }

  return v4 != 0;
}

+ (id)_personsFromEdges:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSocialGroup.m"), 296, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("edges"));

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isDeleted") & 1) == 0)
        {
          objc_msgSend(v12, "targetPerson");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)v13;
            objc_msgSend(v12, "targetPerson");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isDeleted");

            if ((v16 & 1) == 0)
            {
              objc_msgSend(v12, "targetPerson");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "addObject:", v17);

            }
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return v6;
}

+ (BOOL)_verifiedTypeChangeFromRejectedToUserWithSourceNode:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  BOOL v6;

  objc_msgSend(a3, "nodeValueWithName:", CFSTR("socialGroupVerifiedType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (objc_msgSend(v3, "valueDidChange"))
  {
    if (objc_msgSend(v3, "intValue") == 1)
    {
      objc_msgSend(v3, "pl_committedValueForKey:", CFSTR("intValue"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (unsigned __int16)~objc_msgSend(v4, "intValue");

      if (!v5)
        v6 = 1;
    }
  }

  return v6;
}

+ (id)newNodeContainerWithManagedObjectContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSocialGroup.m"), 524, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  objc_msgSend(v5, "pl_graphCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "labelWithCode:inContext:", 1000, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGraphNode insertGraphNodeInContext:withPrimaryLabel:](PLGraphNode, "insertGraphNodeInContext:withPrimaryLabel:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNode:", v8);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUuid:", v11);

  return v9;
}

+ (id)requiredNodeValueKeys
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PLSocialGroup;
  objc_msgSendSuper2(&v7, sel_requiredNodeValueKeys);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sortableKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sortableKeys
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PLSocialGroup;
  objc_msgSendSuper2(&v7, sel_sortableKeys);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sortableKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_sortableKeyPaths
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("automaticOrder");
  v3[1] = CFSTR("customTitle");
  v3[2] = CFSTR("manualOrder");
  v3[3] = CFSTR("socialGroupVerifiedType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)defaultValueForRequiredNodeValueKey:(id)a3 forNode:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___PLSocialGroup;
  objc_msgSendSuper2(&v9, sel_defaultValueForRequiredNodeValueKey_forNode_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("automaticOrder")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("manualOrder")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("socialGroupVerifiedType")))
  {
    objc_msgSend(v7, "setIntValue:", 0);
  }

  return v7;
}

+ (BOOL)runAssetContainmentOnAllSocialGroupsInContext:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  int v23;
  id v24;
  void *v25;
  BOOL v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  char v31;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v38;
  void *v39;
  id v40;
  uint8_t buf[16];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "pl_graphCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labelWithCode:inContext:", 1000, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphNode entityName](PLGraphNode, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("primaryLabel"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  v46 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v9, &v46);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v46;
  v38 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", objc_msgSend(v11, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  v39 = v14;
  if (v15)
  {
    v16 = v15;
    v33 = v12;
    v34 = v6;
    v35 = v5;
    v36 = v4;
    v17 = 0;
    v18 = *(_QWORD *)v43;
LABEL_3:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v43 != v18)
        objc_enumerationMutation(v14);
      v20 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v19);
      v21 = (void *)MEMORY[0x19AEC1554]();
      if (objc_msgSend(v13, "isCancelled"))
        break;
      objc_msgSend(v13, "becomeCurrentWithPendingUnitCount:", 1);
      v22 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLGraphNodeContainer, "newNodeContainerWithNode:", v20);
      if (objc_msgSend(v22, "socialGroupVerifiedType") - 3 >= 0xFFFFFFFE)
      {
        v40 = v17;
        v23 = objc_msgSend(v22, "runAssetContainmentWithError:assetIDsToUpdate:", &v40, 0);
        v24 = v40;

        if (!v23)
        {
          objc_msgSend(v13, "resignCurrent");

          objc_autoreleasePoolPop(v21);
          v26 = 0;
LABEL_20:
          v5 = v35;
          v4 = v36;
          v6 = v34;
          v12 = v33;
          goto LABEL_21;
        }
        if (objc_msgSend(v22, "keyAssetIsNeeded"))
        {
          objc_msgSend(v22, "uuid");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v25);

        }
        v17 = v24;
        v14 = v39;
      }
      objc_msgSend(v13, "resignCurrent");

      objc_autoreleasePoolPop(v21);
      if (v16 == ++v19)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        if (v16)
          goto LABEL_3;
        v26 = 1;
        v24 = v17;
        goto LABEL_20;
      }
    }
    PLBackendGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "runAssetContainmentOnAllSocialGroupsInContext: asset containment cancelled", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v21);
    v26 = 0;
    v29 = v14;
    v5 = v35;
    v4 = v36;
    v6 = v34;
    v12 = v33;
  }
  else
  {
    v24 = 0;
    v26 = 1;
LABEL_21:

    objc_msgSend(v4, "photoLibrary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      +[PLSocialGroup updateKeyAssetOfSocialGroupsWithUUIDs:inLibrary:](PLSocialGroup, "updateKeyAssetOfSocialGroupsWithUUIDs:inLibrary:", v38, v29);
    v30 = v24;
    v28 = v30;
    if (a4)
      v31 = v26;
    else
      v31 = 1;
    if ((v31 & 1) == 0)
      *a4 = objc_retainAutorelease(v30);

    v14 = v39;
  }

  return v26;
}

+ (void)updateKeyAssetOfSocialGroupsWithUUIDs:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__PLSocialGroup_updateKeyAssetOfSocialGroupsWithUUIDs_inLibrary___block_invoke;
    v8[3] = &unk_1E3677C18;
    v9 = v6;
    v10 = v5;
    objc_msgSend(v7, "async:identifyingBlock:library:", v8, 0, v9);

  }
}

+ (id)resetAllInLibrary:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSocialGroup.m"), 1102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  objc_msgSend(v7, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__12949;
  v24 = __Block_byref_object_dispose__12950;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __46__PLSocialGroup_resetAllInLibrary_completion___block_invoke;
  v15[3] = &unk_1E3663580;
  v18 = &v20;
  v19 = a1;
  v10 = v9;
  v16 = v10;
  v11 = v8;
  v17 = v11;
  objc_msgSend(v7, "performTransaction:", v15);
  v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v12;
}

+ (BOOL)resetAllInContext:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PLEnumerateAndSaveController *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  PLEnumerateAndSaveController *v18;
  char v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  char v24;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  _QWORD v31[5];
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSocialGroup.m"), 1118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("moc"));

  }
  objc_msgSend(v7, "pl_graphCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectIDForLabelWithCode:inContext:", 1000, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0C97B48];
    +[PLGraphNode entityName](PLGraphNode, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchRequestWithEntityName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("primaryLabel"), v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPredicate:", v13);

    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__12949;
    v38 = __Block_byref_object_dispose__12950;
    v39 = 0;
    v14 = [PLEnumerateAndSaveController alloc];
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __41__PLSocialGroup_resetAllInContext_error___block_invoke;
    v32[3] = &unk_1E36700D0;
    v33 = v7;
    v31[0] = v17;
    v31[1] = 3221225472;
    v31[2] = __41__PLSocialGroup_resetAllInContext_error___block_invoke_2;
    v31[3] = &unk_1E3671178;
    v31[4] = &v34;
    v28[0] = v17;
    v28[1] = 3221225472;
    v28[2] = __41__PLSocialGroup_resetAllInContext_error___block_invoke_3;
    v28[3] = &unk_1E36635A8;
    v29 = v33;
    v30 = &v34;
    v18 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v14, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v15, v12, v29, v16, 0, 0, v32, v31, v28);

    -[PLEnumerateAndSaveController setItemsPerBatch:](v18, "setItemsPerBatch:", 1);
    v27 = 0;
    v19 = -[PLEnumerateAndSaveController processObjectsWithError:](v18, "processObjectsWithError:", &v27);
    v20 = v27;
    v21 = objc_msgSend((id)v35[5], "totalUnitCount");
    objc_msgSend((id)v35[5], "setCompletedUnitCount:", v21);
    v22 = v20;
    v23 = v22;
    if (a4)
      v24 = v19;
    else
      v24 = 1;
    if ((v24 & 1) == 0)
      *a4 = objc_retainAutorelease(v22);

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    v19 = 1;
  }

  return v19;
}

+ (void)willSaveWithNode:(id)a3
{
  PLDirectoryJournal *v4;
  void *v5;
  void *v6;
  PLDirectoryJournal *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  if (objc_msgSend(v19, "shouldUpdatePersistence"))
  {
    v4 = [PLDirectoryJournal alloc];
    objc_msgSend(v19, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLDirectoryJournal initWithPathManager:payloadClass:](v4, "initWithPathManager:payloadClass:", v6, objc_opt_class());

    objc_msgSend(v19, "setNeedsPersistenceUpdate:", -[PLDirectoryJournal shouldPersistManagedObject:](v7, "shouldPersistManagedObject:", v19));
  }
  if ((objc_msgSend(v19, "isDeleted") & 1) == 0)
  {
    objc_opt_class();
    objc_msgSend(v19, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLGraphNodeContainer, "newNodeContainerWithNode:", v19);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "isSyncableChange"))
      objc_msgSend(v10, "recordSyncChangeMarker");
    objc_opt_class();
    if (((objc_opt_isKindOfClass() & 1) != 0 || MEMORY[0x19AEC0720]())
      && ((objc_msgSend(v19, "isInserted") & 1) != 0
       || objc_msgSend(a1, "_verifiedTypeChangeFromRejectedToUserWithSourceNode:", v19)))
    {
      if (objc_msgSend(v19, "isInserted"))
      {
        objc_msgSend(v10, "delayedSaveActions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "recordDeduplicationNeededForNewGroupNode:", v19);

      }
      objc_msgSend(v11, "members");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14)
      {
        objc_msgSend(v19, "managedObjectContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "delayedSaveActions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "members");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "anyObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "recordSocialGroupContainmentUpdateNeededForPerson:", v18);

      }
    }

  }
}

+ (void)didSaveWithNode:(id)a3
{
  PLDirectoryJournal *v3;
  void *v4;
  void *v5;
  PLDirectoryJournal *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "needsPersistenceUpdate"))
  {
    v3 = [PLDirectoryJournal alloc];
    objc_msgSend(v7, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PLDirectoryJournal initWithPathManager:payloadClass:](v3, "initWithPathManager:payloadClass:", v5, objc_opt_class());

    -[PLDirectoryJournal persistManagedObject:error:](v6, "persistManagedObject:error:", v7, 0);
  }

}

+ (void)prepareForDeletionWithNode:(id)a3
{
  PLDirectoryJournal *v3;
  void *v4;
  void *v5;
  PLDirectoryJournal *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "shouldUpdatePersistence"))
  {
    v3 = [PLDirectoryJournal alloc];
    objc_msgSend(v11, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PLDirectoryJournal initWithPathManager:payloadClass:](v3, "initWithPathManager:payloadClass:", v5, objc_opt_class());

    -[PLDirectoryJournal removePersistenceForManagedObject:error:](v6, "removePersistenceForManagedObject:error:", v11, 0);
  }
  objc_opt_class();
  objc_msgSend(v11, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLGraphNodeContainer, "newNodeContainerWithNode:", v11);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v9, "recordCloudDeletionForObject:", v10);

}

+ (id)_primaryLabelPredicateWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "pl_graphCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectIDForLabelWithCode:inContext:", 1000, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("primaryLabel"), v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "No social group label found in context %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;

  return v8;
}

+ (id)predicateForAllVerifiedSocialGroupsInContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "_primaryLabelPredicateWithContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(%K, $v, $v.%K == %@ AND $v.%K > %d).@count > 0"), CFSTR("values"), CFSTR("valueName"), CFSTR("socialGroupVerifiedType"), CFSTR("intValue"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForUserVerifiedSocialGroupsInContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "_primaryLabelPredicateWithContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(%K, $v, $v.%K == %@ AND $v.%K == %d).@count > 0"), CFSTR("values"), CFSTR("valueName"), CFSTR("socialGroupVerifiedType"), CFSTR("intValue"), 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchAssetIDsHavingAssetPersonEdgesToPersonID:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setResultType:", 2);
  v30[0] = CFSTR("sourceAsset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPropertiesToFetch:", v10);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil AND %K = %@"), CFSTR("sourceAsset"), CFSTR("targetPerson"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v11);

  v28 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v9, &v28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v28;
  v14 = v13;
  if (v12)
  {
    v23 = v8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = v12;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("sourceAsset"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v18);
    }

    v8 = v23;
  }
  else
  {
    v15 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v13);
  }

  return v15;
}

id __41__PLSocialGroup_resetAllInContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __41__PLSocialGroup_resetAllInContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", objc_msgSend(a2, "count"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __41__PLSocialGroup_resetAllInContext_error___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "deleteObject:");
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  return objc_msgSend(v2, "setCompletedUnitCount:", objc_msgSend(v2, "completedUnitCount") + 1);
}

void __46__PLSocialGroup_resetAllInLibrary_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "becomeCurrentWithPendingUnitCount:", 1);
  v2 = (void *)a1[7];
  v3 = a1[4];
  v5 = 0;
  objc_msgSend(v2, "resetAllInContext:error:", v3, &v5);
  v4 = v5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "resignCurrent");
  (*(void (**)(void))(a1[5] + 16))();

}

void __65__PLSocialGroup_updateKeyAssetOfSocialGroupsWithUUIDs_inLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  PLPhotoAnalysisPhotoLibraryService *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "photoAnalysisClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PLPhotoAnalysisPhotoLibraryService initWithServiceProvider:]([PLPhotoAnalysisPhotoLibraryService alloc], "initWithServiceProvider:", v2);
  v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__PLSocialGroup_updateKeyAssetOfSocialGroupsWithUUIDs_inLibrary___block_invoke_2;
  v5[3] = &unk_1E3674D50;
  v6 = v4;
  -[PLPhotoAnalysisPhotoLibraryService updateKeyAssetOfSocialGroupsWithUUIDs:reply:](v3, "updateKeyAssetOfSocialGroupsWithUUIDs:reply:", v6, v5);

}

void __65__PLSocialGroup_updateKeyAssetOfSocialGroupsWithUUIDs_inLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v3;
      v7 = "Error updating key asset for social groups: %@, error: %@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 22;
LABEL_6:
      _os_log_impl(&dword_199541000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 138412290;
    v13 = v11;
    v7 = "Updated key asset for social groups: %@";
    v8 = v5;
    v9 = OS_LOG_TYPE_INFO;
    v10 = 12;
    goto LABEL_6;
  }

}

void __75__PLSocialGroup_fetchDuplicateSocialGroupIDsWithMemberIDs_inContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToSet:", a3))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (id)localID
{
  void *v2;
  void *v3;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isSyncableChange
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", CFSTR("cplChangeFlag"));

  return v5;
}

- (BOOL)supportsCloudUpload
{
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_syncablePredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "evaluateWithObject:", self);

  return (char)self;
}

- (id)scopeIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainScopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)scopedIdentifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0D11468]);
  -[PLSocialGroup scopeIdentifier](self, "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGraphNodeContainer uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithScopeIdentifier:identifier:", v4, v5);

  return v6;
}

- (id)cplSocialGroupChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[PLSocialGroup scopedIdentifier](self, "scopedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(MEMORY[0x1E0D11480], "newChangeWithScopedIdentifier:changeType:", v3, 0);
  objc_msgSend(v4, "setVerifiedType:", -[PLSocialGroup socialGroupVerifiedType](self, "socialGroupVerifiedType"));
  -[PLSocialGroup customTitle](self, "customTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCustomTitle:", v5);

  -[PLSocialGroup manualOrder](self, "manualOrder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPosition:", objc_msgSend(v6, "unsignedIntegerValue"));

  if (-[PLSocialGroup keyAssetPickSource](self, "keyAssetPickSource") == 1)
  {
    -[PLSocialGroup keyAsset](self, "keyAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[PLSocialGroup keyAsset](self, "keyAsset");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject cloudAssetGUID](v8, "cloudAssetGUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setKeyAssetIdentifier:", v9);
    }
    else
    {
      PLBackendGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_7:

        goto LABEL_8;
      }
      -[PLGraphNodeContainer uuid](self, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v9;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "cplSocialGroupChange: social group with UUID %@ has user pick source but no key asset", buf, 0xCu);
    }

    goto LABEL_7;
  }
LABEL_8:
  v10 = objc_alloc_init(MEMORY[0x1E0D11490]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PLSocialGroup members](self, "members", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
        v17 = objc_alloc_init(MEMORY[0x1E0D11488]);
        objc_msgSend(v16, "personUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPersonIdentifier:", v18);

        objc_msgSend(v10, "addPerson:", v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  objc_msgSend(v4, "setPersons:", v10);
  return v4;
}

- (void)updateSocialGroupwithCPLSocialGroupChange:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  id v20;
  BOOL v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  id v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;
  uint8_t buf[4];
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v48 = 0;
  v8 = -[PLSocialGroup setSocialGroupVerifiedType:error:](self, "setSocialGroupVerifiedType:error:", objc_msgSend(v6, "verifiedType"), &v48);
  v9 = v48;
  if (!v8)
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "updateSocialGroupwithCPLSocialGroupChange: error setting social group verified type: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v6, "customTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSocialGroup setCustomTitle:](self, "setCustomTitle:", v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "position"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSocialGroup setManualOrder:](self, "setManualOrder:", v12);

  objc_msgSend(v6, "keyAssetIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (!v13)
  {
    v38 = v9;
    goto LABEL_20;
  }
  v50 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetsByCloudAssetUUID:inLibrary:](PLManagedAsset, "assetsByCloudAssetUUID:inLibrary:", v15, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    PLBackendGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v14;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "updateSocialGroupwithCPLSocialGroupChange: couldn't find key asset with keyAssetUUID: %@", buf, 0xCu);
    }
    v20 = v9;
    goto LABEL_18;
  }
  v47 = v9;
  v19 = -[PLSocialGroup setKeyAsset:error:](self, "setKeyAsset:error:", v18, &v47);
  v20 = v47;

  if (!v19)
  {
    PLBackendGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v20;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "updateSocialGroupwithCPLSocialGroupChange: error setting social group key asset: %@", buf, 0xCu);
    }
    goto LABEL_18;
  }
  v46 = v20;
  v21 = -[PLSocialGroup setKeyAssetPickSource:error:](self, "setKeyAssetPickSource:error:", 1, &v46);
  v22 = v46;

  if (!v21)
  {
    PLBackendGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v22;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "updateSocialGroupwithCPLSocialGroupChange: error setting social group key asset pick source: %@", buf, 0xCu);
    }
    v20 = v22;
LABEL_18:

    v22 = v20;
  }
  v38 = v22;

LABEL_20:
  v39 = v14;
  v40 = v6;
  objc_msgSend(v6, "persons");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v37 = v24;
  objc_msgSend(v24, "persons");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v43 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "personIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "managedObjectContext");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
          objc_msgSend(v25, "addObject:", v33);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    }
    while (v28);
  }

  v41 = v38;
  v34 = -[PLSocialGroup setMembers:error:](self, "setMembers:error:", v25, &v41);
  v35 = v41;

  if (!v34)
  {
    PLBackendGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v35;
      _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_ERROR, "updateSocialGroupwithCPLSocialGroupChange: failed to set members with error: %@", buf, 0xCu);
    }

  }
}

- (int64_t)cloudDeletionType
{
  return 13;
}

+ (id)_syncablePredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d || %K == %d"), CFSTR("socialGroupVerifiedType"), 1, CFSTR("socialGroupVerifiedType"), 0xFFFFFFFFLL);
}

+ (id)socialGroupsToUploadInManagedObjectContext:(id)a3 limit:(int64_t)a4
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "pl_graphCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "labelWithCode:inContext:", 1000, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("sourceNode.primaryLabel"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  objc_msgSend(v4, "executeFetchRequest:error:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "sourceNode");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14 && (objc_msgSend(v14, "isDeleted") & 1) == 0)
        {
          v16 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLGraphNodeContainer, "newNodeContainerWithNode:", v15);
          if (objc_msgSend(v16, "supportsCloudUpload")
            && !objc_msgSend(v16, "cloudLocalState"))
          {
            objc_msgSend(v5, "addObject:", v16);
          }

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  return v5;
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  return 13;
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)CFSTR("uuid");
}

@end
