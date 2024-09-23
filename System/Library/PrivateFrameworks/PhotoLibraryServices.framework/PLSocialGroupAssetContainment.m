@implementation PLSocialGroupAssetContainment

- (PLSocialGroupAssetContainment)initWithPersons:(id)a3 inContext:(id)a4
{
  id v7;
  id v8;
  PLSocialGroupAssetContainment *v9;
  PLSocialGroupAssetContainment *v10;
  PLSocialGroupAssetContainment *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PLSocialGroupAssetContainment;
  v9 = -[PLSocialGroupAssetContainment init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a4);
    objc_storeStrong((id *)&v10->_members, a3);
    v11 = v10;
  }

  return v10;
}

- (PLSocialGroupAssetContainment)initWithSocialGroup:(id)a3
{
  id v5;
  PLSocialGroupAssetContainment *v6;
  PLSocialGroupAssetContainment *v7;
  void *v8;
  uint64_t v9;
  NSManagedObjectContext *context;
  uint64_t v11;
  NSSet *members;
  PLSocialGroupAssetContainment *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLSocialGroupAssetContainment;
  v6 = -[PLSocialGroupAssetContainment init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_socialGroup, a3);
    objc_msgSend(v5, "sourceNode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v9 = objc_claimAutoreleasedReturnValue();
    context = v7->_context;
    v7->_context = (NSManagedObjectContext *)v9;

    objc_msgSend(v5, "members");
    v11 = objc_claimAutoreleasedReturnValue();
    members = v7->_members;
    v7->_members = (NSSet *)v11;

    v13 = v7;
  }

  return v7;
}

- (BOOL)_foundPersonIDsPassingContainmentRequirements:(id)a3
{
  NSSet *members;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;

  members = self->_members;
  v5 = a3;
  -[NSSet valueForKey:](members, "valueForKey:", CFSTR("objectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "intersectSet:", v5);
  if (-[NSSet count](self->_members, "count"))
  {
    v8 = objc_msgSend(v7, "count");
    v9 = v8 >= -[NSSet count](self->_members, "count");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_assetPersonEdgeDictionaries:(id *)a3 forAssetIDs:(id)a4
{
  id v6;
  void *v7;
  NSSet *members;
  void *v9;
  void *v10;
  NSManagedObjectContext *context;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  id v22;
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  id v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  members = self->_members;
  if (v6)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@ AND noindex:(%K) IN %@"), CFSTR("sourceAsset"), v6, CFSTR("targetPerson"), members);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil AND %K IN %@"), CFSTR("sourceAsset"), CFSTR("targetPerson"), members, v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v9);

  objc_msgSend(v7, "setResultType:", 2);
  v27[0] = CFSTR("sourceAsset");
  v27[1] = CFSTR("targetPerson");
  v27[2] = CFSTR("objectID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPropertiesToFetch:", v10);

  context = self->_context;
  v22 = 0;
  -[NSManagedObjectContext executeFetchRequest:error:](context, "executeFetchRequest:error:", v7, &v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v22;
  if (!v12)
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v13;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "runAssetContainment: error fetching asset-person edges %@", buf, 0xCu);
    }

    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D74498];
    v23 = *MEMORY[0x1E0CB2938];
    v24 = CFSTR("runAssetContainment: error fetching asset-person edges");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 41003, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a3)
      *a3 = objc_retainAutorelease(v18);

  }
  return v12;
}

- (id)_fetchEdgeIDsWithLabel:(id)a3 inEdgeIDSet:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSManagedObjectContext *context;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setResultType:", 1);
  v11 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ IN %K"), v9, CFSTR("labels"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v15);

  context = self->_context;
  v22 = 0;
  -[NSManagedObjectContext executeFetchRequest:error:](context, "executeFetchRequest:error:", v10, &v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v22;
  v19 = v18;
  if (!v17 && a5)
    *a5 = objc_retainAutorelease(v18);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_edgeIDSetFromAssetPersonEdgeDictionaries:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "objectForKeyedSubscript:", CFSTR("objectID"), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_assetIDsWithLargeMemberFacesFromAssetPersonEdgeDictionaries:(id)a3 error:(id *)a4
{
  id v6;
  NSManagedObjectContext *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  NSManagedObjectContext *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  const __CFString *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self->_context;
  -[NSManagedObjectContext pl_graphCache](v7, "pl_graphCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "labelWithCode:inContext:", 1200, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "labelWithCode:inContext:", 1201, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D74498];
    v46 = *MEMORY[0x1E0CB2938];
    v47 = CFSTR("_assetIDsWithLargeMemberFacesFromAssetPersonEdgeDictionaries: error fetching small/ large face label");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 41003, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a4)
      *a4 = objc_retainAutorelease(v15);

    v17 = 0;
  }
  else
  {
    v37 = v6;
    -[PLSocialGroupAssetContainment _edgeIDSetFromAssetPersonEdgeDictionaries:](self, "_edgeIDSetFromAssetPersonEdgeDictionaries:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSocialGroupAssetContainment _fetchEdgeIDsWithLabel:inEdgeIDSet:error:](self, "_fetchEdgeIDsWithLabel:inEdgeIDSet:error:", v9, v18, a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSocialGroupAssetContainment _fetchEdgeIDsWithLabel:inEdgeIDSet:error:](self, "_fetchEdgeIDsWithLabel:inEdgeIDSet:error:", v10, v18, a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0C99E20];
    -[NSSet valueForKey:](self->_members, "valueForKey:", CFSTR("objectID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithSet:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20 && v19)
    {
      v39 = v19;
      v33 = v10;
      v34 = v9;
      v35 = v8;
      v36 = v7;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      obj = v37;
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v43 != v26)
              objc_enumerationMutation(obj);
            v28 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("targetPerson"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("sourceAsset"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("objectID"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v23, "containsObject:", v29)
              && ((objc_msgSend(v39, "containsObject:", v31) & 1) != 0
               || (objc_msgSend(v20, "containsObject:", v31) & 1) == 0))
            {
              objc_msgSend(v41, "addObject:", v30);
              objc_msgSend(v38, "removeObject:", v30);
            }
            else if (objc_msgSend(v23, "containsObject:", v29)
                   && objc_msgSend(v20, "containsObject:", v31)
                   && (objc_msgSend(v41, "containsObject:", v30) & 1) == 0)
            {
              objc_msgSend(v38, "addObject:", v30);
            }

          }
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        }
        while (v25);
      }

      v17 = v38;
      v7 = v36;
      v6 = v37;
      v9 = v34;
      v8 = v35;
      v10 = v33;
    }
    else
    {

      v17 = 0;
      v6 = v37;
    }
  }

  return v17;
}

- (id)_personIDsByAssetIDFromAssetPersonEdgeDictionaries:(id)a3 potentialAssetsIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    v11 = CFSTR("sourceAsset");
    do
    {
      v12 = 0;
      v24 = v9;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
        objc_msgSend(v13, "objectForKeyedSubscript:", v11, v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("targetPerson"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "containsObject:", v14))
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v7, "objectForKeyedSubscript:", v14);
            v17 = v7;
            v18 = v10;
            v19 = v6;
            v20 = v11;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)objc_msgSend(v21, "mutableCopy");

            v11 = v20;
            v6 = v19;
            v10 = v18;
            v7 = v17;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }

          objc_msgSend(v22, "addObject:", v15);
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, v14);

          v9 = v24;
        }

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

  return v7;
}

- (id)_fetchEdgeInfosToSmallNonMembersInPotentialAssetIDs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSManagedObjectContext *context;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  uint64_t v28;
  const __CFString *v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;
  const __CFString *v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSManagedObjectContext pl_graphCache](self->_context, "pl_graphCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectIDForLabelWithCode:inContext:", 1200, self->_context);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setResultType:", 2);
  v34[0] = CFSTR("sourceAsset");
  v34[1] = CFSTR("objectID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPropertiesToFetch:", v10);

  if (!v8)
  {
    PLBackendGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "runAssetContainment: error fetching small face label", buf, 2u);
    }

    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D74498];
    v32 = *MEMORY[0x1E0CB2938];
    v33 = CFSTR("runAssetContainment: error fetching small face label");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 41003, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v15 = objc_retainAutorelease(v15);
      v16 = 0;
      *a4 = v15;
      goto LABEL_14;
    }
LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K CONTAINS %@) AND NOT (%K in %@) AND ANY %K in %@"), CFSTR("labels"), v8, CFSTR("targetPerson"), self->_members, CFSTR("sourceAsset"), v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v11);

  context = self->_context;
  v27 = 0;
  -[NSManagedObjectContext executeFetchRequest:error:](context, "executeFetchRequest:error:", v9, &v27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v27;
  if (!v13)
  {
    PLBackendGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v14;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "runAssetContainment: error fetching edges with small non-member persons %@", buf, 0xCu);
    }

    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0D74498];
    v28 = *MEMORY[0x1E0CB2938];
    v29 = CFSTR("runAssetContainment: error fetching edges with small non-member persons");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 41003, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a4)
      *a4 = objc_retainAutorelease(v24);

    v15 = 0;
    goto LABEL_13;
  }
  v15 = v13;
  v16 = v15;
LABEL_14:

  return v16;
}

- (id)_fetchEdgeInfosToMediumAndLargeNonMembersInPotentialAssetIDs:(id)a3 edgeInfosToSmallNonMembers:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSManagedObjectContext *context;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  uint64_t v27;
  const __CFString *v28;
  uint8_t buf[4];
  id v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setResultType:", 2);
  v31[0] = CFSTR("objectID");
  v31[1] = CFSTR("sourceAsset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPropertiesToFetch:", v11);

  v12 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v8, "valueForKey:", CFSTR("objectID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "predicateWithFormat:", CFSTR("NOT (self in %@) AND NOT (%K in %@) AND ANY %K in %@"), v13, CFSTR("targetPerson"), self->_members, CFSTR("sourceAsset"), v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPredicate:", v14);
  context = self->_context;
  v26 = 0;
  -[NSManagedObjectContext executeFetchRequest:error:](context, "executeFetchRequest:error:", v10, &v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v26;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v17;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "runAssetContainment: error fetching edges with non-member persons %@", buf, 0xCu);
    }

    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0D74498];
    v27 = *MEMORY[0x1E0CB2938];
    v28 = CFSTR("runAssetContainment: error fetching edges with non-member persons");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 41003, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a5)
      *a5 = objc_retainAutorelease(v23);

  }
  return v16;
}

- (id)_potentialAssetsIDsExcludingNonMembersFromAssetIDs:(id)a3 assetIDsWithLargeMemberFaces:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PLSocialGroupAssetContainment _fetchEdgeInfosToSmallNonMembersInPotentialAssetIDs:error:](self, "_fetchEdgeInfosToSmallNonMembersInPotentialAssetIDs:error:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PLSocialGroupAssetContainment _fetchEdgeInfosToMediumAndLargeNonMembersInPotentialAssetIDs:edgeInfosToSmallNonMembers:error:](self, "_fetchEdgeInfosToMediumAndLargeNonMembersInPotentialAssetIDs:edgeInfosToSmallNonMembers:error:", v8, v10, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v31 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("sourceAsset"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "removeObject:", v17);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v14);
      }
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v18 = v10;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v27;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v27 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("sourceAsset"), (_QWORD)v26);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v9, "containsObject:", v23) & 1) == 0)
              objc_msgSend(v8, "removeObject:", v23);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        }
        while (v20);
      }

      v24 = v8;
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)_assetIDsWithRequiredPersonsPresentWithAssetIDs:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  PLSocialGroupAssetContainmentResult *v24;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
    v7 = v6;
  else
    v7 = 0;
  -[PLSocialGroupAssetContainment _assetPersonEdgeDictionaries:forAssetIDs:](self, "_assetPersonEdgeDictionaries:forAssetIDs:", a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v26 = v6;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v32 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("sourceAsset"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v9);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[PLSocialGroupAssetContainment _assetIDsWithLargeMemberFacesFromAssetPersonEdgeDictionaries:error:](self, "_assetIDsWithLargeMemberFacesFromAssetPersonEdgeDictionaries:error:", v10, a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[PLSocialGroupAssetContainment _potentialAssetsIDsExcludingNonMembersFromAssetIDs:assetIDsWithLargeMemberFaces:error:](self, "_potentialAssetsIDsExcludingNonMembersFromAssetIDs:assetIDsWithLargeMemberFaces:error:", v16, v17, a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v26;
      if (v18)
      {
        -[PLSocialGroupAssetContainment _personIDsByAssetIDFromAssetPersonEdgeDictionaries:potentialAssetsIDs:](self, "_personIDsByAssetIDFromAssetPersonEdgeDictionaries:potentialAssetsIDs:", v10, v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __87__PLSocialGroupAssetContainment__assetIDsWithRequiredPersonsPresentWithAssetIDs_error___block_invoke;
        v27[3] = &unk_1E3666A18;
        v27[4] = self;
        v28 = v20;
        v16 = v18;
        v29 = v16;
        v30 = v21;
        v22 = v21;
        v23 = v20;
        objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v27);
        v24 = -[PLSocialGroupAssetContainmentResult initWithInclusiveAssetIDs:exclusiveAssetIDs:]([PLSocialGroupAssetContainmentResult alloc], "initWithInclusiveAssetIDs:exclusiveAssetIDs:", v23, v22);

      }
      else
      {
        v16 = 0;
        v24 = 0;
      }
    }
    else
    {
      v24 = 0;
      v6 = v26;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)runAssetContainment:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (-[NSSet count](self->_members, "count") > 1)
  {
    -[PLSocialGroupAssetContainment _assetIDsWithRequiredPersonsPresentWithAssetIDs:error:](self, "_assetIDsWithRequiredPersonsPresentWithAssetIDs:error:", 0, a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0D74498];
    v11 = *MEMORY[0x1E0CB2938];
    v12[0] = CFSTR("unexpected member set size");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 41003, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a3)
      *a3 = objc_retainAutorelease(v8);

    return 0;
  }
}

- (id)runAssetContainmentOnAssetIDs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[NSSet count](self->_members, "count") > 1)
  {
    -[PLSocialGroupAssetContainment _assetIDsWithRequiredPersonsPresentWithAssetIDs:error:](self, "_assetIDsWithRequiredPersonsPresentWithAssetIDs:error:", v6, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0D74498];
    v14 = *MEMORY[0x1E0CB2938];
    v15[0] = CFSTR("unexpected member set size");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 41003, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a4)
      *a4 = objc_retainAutorelease(v10);

    v12 = 0;
  }

  return v12;
}

- (id)assetIDsIncludedInExclusiveContainment:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[NSSet count](self->_members, "count") > 1)
  {
    -[PLSocialGroupAssetContainment _assetIDsWithRequiredPersonsPresentWithAssetIDs:error:](self, "_assetIDsWithRequiredPersonsPresentWithAssetIDs:error:", v6, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "exclusiveAssetIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0D74498];
    v15 = *MEMORY[0x1E0CB2938];
    v16[0] = CFSTR("unexpected member set size");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 41003, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a4)
      *a4 = objc_retainAutorelease(v10);

    v12 = 0;
  }

  return v12;
}

- (PLSocialGroup)socialGroup
{
  return self->_socialGroup;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_socialGroup, 0);
  objc_storeStrong((id *)&self->_members, 0);
}

void __87__PLSocialGroupAssetContainment__assetIDsWithRequiredPersonsPresentWithAssetIDs_error___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a1[4], "_foundPersonIDsPassingContainmentRequirements:", a3))
  {
    objc_msgSend(a1[5], "addObject:", v5);
    if (objc_msgSend(a1[6], "containsObject:", v5))
      objc_msgSend(a1[7], "addObject:", v5);
  }

}

+ (double)assetContainmentSmallFaceThreshold
{
  void *v2;
  float v3;
  float v4;
  double v5;
  double result;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatForKey:", CFSTR("PLAssetContainmentSmallFaceThreshold"));
  v4 = v3;
  v5 = v3;

  result = 0.02;
  if (v4 != 0.0)
    return v5;
  return result;
}

+ (void)setAssetContainmentSmallFaceThreshold:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDouble:forKey:", CFSTR("PLAssetContainmentSmallFaceThreshold"), a3);

}

+ (double)assetContainmentLargeFaceThreshold
{
  void *v2;
  float v3;
  float v4;
  double v5;
  double result;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatForKey:", CFSTR("PLAssetContainmentLargeFaceThreshold"));
  v4 = v3;
  v5 = v3;

  result = 0.07;
  if (v4 != 0.0)
    return v5;
  return result;
}

+ (void)setAssetContainmentLargeFaceThreshold:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDouble:forKey:", CFSTR("PLAssetContainmentLargeFaceThreshold"), a3);

}

+ (double)assetContainmentSmallTorsoThreshold
{
  void *v2;
  float v3;
  float v4;
  double v5;
  double result;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatForKey:", CFSTR("PLAssetContainmentSmallTorsoThreshold"));
  v4 = v3;
  v5 = v3;

  result = 0.008;
  if (v4 != 0.0)
    return v5;
  return result;
}

+ (void)setAssetContainmentSmallTorsoThreshold:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDouble:forKey:", CFSTR("PLAssetContainmentSmallTorsoThreshold"), a3);

}

+ (double)assetContainmentMinPeopleInMomentRatio
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PLAssetContainmentMinPeopleInMomentRatio"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "doubleForKey:", CFSTR("PLAssetContainmentMinPeopleInMomentRatio"));
    v5 = v4;
  }
  else
  {
    v5 = 1.0;
  }

  return v5;
}

+ (int)_detectedFaceSizeFromBodyHeight:(double)a3 bodyWidth:(double)a4 size:(double)a5
{
  double v6;
  double v7;
  double v9;

  if (a5 == 0.0)
  {
    v6 = a3 * a4;
    +[PLSocialGroupAssetContainment assetContainmentSmallTorsoThreshold](PLSocialGroupAssetContainment, "assetContainmentSmallTorsoThreshold");
    if (v6 < a3)
      return 0;
  }
  if (a5 <= 0.0)
    return 1;
  +[PLSocialGroupAssetContainment assetContainmentSmallFaceThreshold](PLSocialGroupAssetContainment, "assetContainmentSmallFaceThreshold", a3, a4);
  if (v7 > a5)
    return 0;
  +[PLSocialGroupAssetContainment assetContainmentLargeFaceThreshold](PLSocialGroupAssetContainment, "assetContainmentLargeFaceThreshold");
  if (v9 >= a5)
    return 1;
  else
    return 2;
}

+ (void)_updateEdgeLabelsIfNeededForEdge:(id)a3 expectedLabel:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  if (v5)
  {
    if ((objc_msgSend(v10, "hasLabel:", v5) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v9 = (void *)v6;
      objc_msgSend(v10, "setLabels:", v6);

    }
  }
  else
  {
    objc_msgSend(v10, "labels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }

}

+ (BOOL)_updateAssetPersonEdgesForAssetWithID:(id)a3 usingPersonFaceSizes:(id)a4 existingEdges:(id)a5 inContext:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  char v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  BOOL v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  _BYTE v59[128];
  uint64_t v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSocialGroupAssetContainment.m"), 391, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  objc_msgSend(v15, "pl_graphCache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "labelWithCode:inContext:", 1200, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v16;
  objc_msgSend(v16, "labelWithCode:inContext:", 1201, v15);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v17)
    v20 = v18 == 0;
  else
    v20 = 1;
  v21 = !v20;
  v41 = v21;
  if (v20)
  {
    v22 = a1;
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0D74498];
    v60 = *MEMORY[0x1E0CB2938];
    v61[0] = CFSTR("_updateAssetPersonEdgesForAssetWithID: error getting small/ large face label");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 41003, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (a7)
      *a7 = objc_retainAutorelease(v26);

    a1 = v22;
  }
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __122__PLSocialGroupAssetContainment__updateAssetPersonEdgesForAssetWithID_usingPersonFaceSizes_existingEdges_inContext_error___block_invoke;
  v52[3] = &unk_1E3666A68;
  v44 = v17;
  v53 = v44;
  v42 = v19;
  v54 = v42;
  v28 = v14;
  v55 = v28;
  v47 = v15;
  v56 = v47;
  v43 = v12;
  v57 = v43;
  v58 = a1;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v52);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v29 = v28;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v49 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        v35 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v34, "objectIDsForRelationshipNamed:", CFSTR("targetPerson"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "firstObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "objectForKeyedSubscript:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v38)
          objc_msgSend(v47, "deleteObject:", v34);

        objc_autoreleasePoolPop(v35);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    }
    while (v31);
  }

  return v41;
}

+ (id)_generateFaceSizesByPersonIDByAssetIDForAssetIDs:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v54;
  SEL v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v63;
  id v64;
  id obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _QWORD v77[2];
  _QWORD v78[8];

  v78[6] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSocialGroupAssetContainment.m"), 438, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v10 = objc_msgSend(v8, "copy");
  +[PLDetectedFace fetchRequest](PLDetectedFace, "fetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setResultType:", 2);
  v78[0] = CFSTR("assetForFace");
  v78[1] = CFSTR("personForFace");
  v78[2] = CFSTR("size");
  v78[3] = CFSTR("bodyWidth");
  v78[4] = CFSTR("bodyHeight");
  v78[5] = CFSTR("objectID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPropertiesToFetch:", v12);

  v13 = (void *)MEMORY[0x1E0CB3528];
  v59 = (void *)v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("assetForFace"), v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = YES"), CFSTR("assetVisible"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v77[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v17);

  v60 = v11;
  objc_msgSend(v11, "setFetchBatchSize:", 100);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v8;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v72 != v21)
          objc_enumerationMutation(obj);
        v23 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, v23);

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
    }
    while (v20);
  }

  v70 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v60, &v70);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v70;
  v27 = v26;
  if (v25)
  {
    v57 = v26;
    v58 = v9;
    v55 = a2;
    v56 = v25;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = v25;
    v28 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v67;
      v61 = *(_QWORD *)v67;
      do
      {
        v31 = 0;
        v63 = v29;
        do
        {
          if (*(_QWORD *)v67 != v30)
            objc_enumerationMutation(v64);
          v32 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v31);
          v33 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("assetForFace"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("personForFace"));
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = (void *)v35;
          if (v34)
            v37 = v35 == 0;
          else
            v37 = 1;
          if (!v37)
          {
            objc_msgSend(v18, "objectForKeyedSubscript:", v34);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v38)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", v55, a1, CFSTR("PLSocialGroupAssetContainment.m"), 489, CFSTR("expected existing collection"));

            }
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("bodyHeight"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "doubleValue");
            v41 = v40;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("bodyWidth"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "doubleValue");
            v44 = v43;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("size"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "doubleValue");
            v47 = objc_msgSend(a1, "_detectedFaceSizeFromBodyHeight:bodyWidth:size:", v41, v44, v46);

            objc_msgSend(v38, "objectForKeyedSubscript:", v36);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v48;
            if (!v48 || (int)v47 > (int)objc_msgSend(v48, "integerValue"))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v47);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "setObject:forKeyedSubscript:", v50, v36);

            }
            v29 = v63;
            v30 = v61;
          }

          objc_autoreleasePoolPop(v33);
          ++v31;
        }
        while (v29 != v31);
        v29 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
      }
      while (v29);
    }

    v52 = v18;
    v27 = v57;
    v9 = v58;
    v25 = v56;
  }
  else
  {
    v52 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v26);
  }

  return v52;
}

+ (BOOL)_updateAssetPersonEdgesForAssetIDsInBatch:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  int v25;
  id v26;
  void *v27;
  BOOL v28;
  id v30;
  void *v31;
  id v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint64_t *v42;
  uint64_t *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  id obj;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  _BYTE v61[128];
  _QWORD v62[3];

  v62[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v30 = v8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSocialGroupAssetContainment.m"), 512, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    v8 = v30;
    v9 = 0;
  }
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__23437;
  v55 = __Block_byref_object_dispose__23438;
  v56 = 0;
  obj = 0;
  v32 = a1;
  v35 = v8;
  v36 = v9;
  objc_msgSend(a1, "_generateFaceSizesByPersonIDByAssetIDForAssetIDs:inContext:error:", v8, v9, &obj);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v56, obj);
  if (v37)
  {
    +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@ AND %K != nil"), CFSTR("sourceAsset"), v8, CFSTR("targetPerson"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setPredicate:", v10);

    objc_msgSend(v38, "setResultType:", 0);
    objc_msgSend(v38, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("sourceAsset"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setSortDescriptors:", v12);

    v13 = (id *)(v52 + 5);
    v49 = (id)v52[5];
    objc_msgSend(v36, "executeFetchRequest:error:", v38, &v49);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v13, v49);
    if (v34)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v15 = v34;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v46 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            v20 = (void *)MEMORY[0x19AEC1554]();
            objc_msgSend(v19, "objectIDsForRelationshipNamed:", CFSTR("sourceAsset"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "firstObject");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              objc_msgSend(v14, "objectForKeyedSubscript:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v23)
              {
                objc_msgSend(MEMORY[0x1E0C99E20], "set");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, v22);
              }
              objc_msgSend(v23, "addObject:", v19);

            }
            objc_autoreleasePoolPop(v20);
          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
        }
        while (v16);
      }

      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __91__PLSocialGroupAssetContainment__updateAssetPersonEdgesForAssetIDsInBatch_inContext_error___block_invoke;
      v39[3] = &unk_1E3666A90;
      v42 = &v57;
      v44 = v32;
      v24 = v14;
      v40 = v24;
      v41 = v36;
      v43 = &v51;
      objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v39);

    }
  }
  v25 = *((unsigned __int8 *)v58 + 24);
  v26 = (id)v52[5];
  v27 = v26;
  if (!v25 && a5)
    *a5 = objc_retainAutorelease(v26);

  v28 = *((_BYTE *)v58 + 24) != 0;
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  return v28;
}

+ (id)_batchAssetIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 200);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__PLSocialGroupAssetContainment__batchAssetIDs___block_invoke;
  v12[3] = &unk_1E3666AB8;
  v13 = v4;
  v14 = v3;
  v6 = v5;
  v15 = v6;
  v7 = v3;
  v8 = v4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);
  v9 = v15;
  v10 = v6;

  return v10;
}

+ (BOOL)updateAndSaveAssetPersonEdgesForAssetsWithIDs:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  id v15;
  void *v16;
  char v17;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSocialGroupAssetContainment.m"), 609, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 1;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__23437;
  v30 = __Block_byref_object_dispose__23438;
  v31 = 0;
  objc_msgSend(a1, "_batchAssetIDs:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __95__PLSocialGroupAssetContainment_updateAndSaveAssetPersonEdgesForAssetsWithIDs_inContext_error___block_invoke;
  v20[3] = &unk_1E366C010;
  v12 = v11;
  v21 = v12;
  v25 = a1;
  v13 = v10;
  v22 = v13;
  v23 = &v26;
  v24 = &v32;
  objc_msgSend(v13, "pl_performBlockAndWait:", v20);
  v14 = *((unsigned __int8 *)v33 + 24);
  v15 = (id)v27[5];
  v16 = v15;
  if (!v14 && a5)
    *a5 = objc_retainAutorelease(v15);

  v17 = *((_BYTE *)v33 + 24);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v17;
}

void __95__PLSocialGroupAssetContainment_updateAndSaveAssetPersonEdgesForAssetsWithIDs_inContext_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x19AEC1554]();
        v9 = *(void **)(a1 + 64);
        v10 = *(_QWORD *)(a1 + 40);
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        obj = *(id *)(v11 + 40);
        v12 = objc_msgSend(v9, "_updateAssetPersonEdgesForAssetIDsInBatch:inContext:error:", v7, v10, &obj);
        objc_storeStrong((id *)(v11 + 40), obj);
        v13 = *(void **)(a1 + 40);
        v17 = 0;
        LOBYTE(v11) = objc_msgSend(v13, "save:", &v17);
        v14 = v17;
        v15 = v14;
        if ((v11 & 1) == 0)
        {
          PLBackendGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v15;
            _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Error saving asset-person edges: %@", buf, 0xCu);
          }

LABEL_14:
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;

          objc_autoreleasePoolPop(v8);
          goto LABEL_15;
        }
        if ((v12 & 1) == 0)
          goto LABEL_14;

        objc_autoreleasePoolPop(v8);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_15:

}

uint64_t __48__PLSocialGroupAssetContainment__batchAssetIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t result;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  v5 = objc_msgSend(*(id *)(a1 + 40), "count");
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result == 200 || v5 - 1 == a3)
  {
    v8 = *(void **)(a1 + 48);
    v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(v8, "addObject:", v9);

    return objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  }
  return result;
}

void __91__PLSocialGroupAssetContainment__updateAssetPersonEdgesForAssetIDsInBatch_inContext_error___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id obj;

  v5 = (void *)a1[8];
  v6 = (void *)a1[4];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = a1[5];
  v11 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v11 + 40);
  LOBYTE(v5) = objc_msgSend(v5, "_updateAssetPersonEdgesForAssetWithID:usingPersonFaceSizes:existingEdges:inContext:error:", v8, v7, v9, v10, &obj);

  objc_storeStrong((id *)(v11 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (_BYTE)v5;

}

void __122__PLSocialGroupAssetContainment__updateAssetPersonEdgesForAssetWithID_usingPersonFaceSizes_existingEdges_inContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(v6, "integerValue"))
  {
    v7 = (id *)(a1 + 32);
    goto LABEL_5;
  }
  if (objc_msgSend(v6, "integerValue") == 2)
  {
    v7 = (id *)(a1 + 40);
LABEL_5:
    v8 = *v7;
    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:
  v9 = *(void **)(a1 + 48);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __122__PLSocialGroupAssetContainment__updateAssetPersonEdgesForAssetWithID_usingPersonFaceSizes_existingEdges_inContext_error___block_invoke_2;
  v14[3] = &unk_1E3666A40;
  v13 = v5;
  v15 = v13;
  objc_msgSend(v9, "_pl_firstObjectPassingTest:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLGraphEdge, "insertInManagedObjectContext:", *(_QWORD *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "objectWithID:", *(_QWORD *)(a1 + 64));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSourceAsset:", v11);

    objc_msgSend(*(id *)(a1 + 56), "objectWithID:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTargetPerson:", v12);

  }
  objc_msgSend(*(id *)(a1 + 72), "_updateEdgeLabelsIfNeededForEdge:expectedLabel:", v10, v8);

}

uint64_t __122__PLSocialGroupAssetContainment__updateAssetPersonEdgesForAssetWithID_usingPersonFaceSizes_existingEdges_inContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "objectIDsForRelationshipNamed:", CFSTR("targetPerson"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));
  return v5;
}

@end
