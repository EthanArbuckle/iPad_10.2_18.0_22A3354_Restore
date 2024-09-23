@implementation PLBackgroundJobWorkItem

- (id)descriptionForSearchIndexingWorkItem
{
  void *v3;
  objc_class *v4;
  void *v5;
  unsigned int v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLBackgroundJobWorkItem jobType](self, "jobType");
  if (v6 > 5)
    v7 = CFSTR("unknown");
  else
    v7 = off_1E366CB00[(unsigned __int16)v6];
  v8 = v7;
  -[PLBackgroundJobWorkItem identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobWorkItem timestamp](self, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLBackgroundJobWorkerSearchJobFlagsDescription(-[PLBackgroundJobWorkItem jobFlags](self, "jobFlags"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobWorkItem delayUntilDate](self, "delayUntilDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@ identifier: %@ timestamp: %@ %@, delay until: %@"), v5, self, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)backgroundJobSearchIndexingEnabled
{
  return _os_feature_enabled_impl();
}

+ (id)insertDeleteFromSearchIndexWorkItemIfNeededWithIdentifier:(id)a3 managedObjectContext:(id)a4
{
  return (id)objc_msgSend(a1, "insertSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", a3, 1, a4);
}

+ (id)insertSearchIndexWorkItemIfNeededWithIdentifier:(id)a3 flags:(int64_t)a4 managedObjectContext:(id)a5
{
  id v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(a1, "backgroundJobSearchIndexingEnabled");
  v11 = 0;
  if (a4 && v10)
  {
    if ((a4 & 1) != 0)
      v12 = 1;
    else
      v12 = +[PLBackgroundJobWorkItem searchJobTypeForCurrentQOS](PLBackgroundJobWorkItem, "searchJobTypeForCurrentQOS");
    +[PLBackgroundJobWorkItem insertBackgroundJobWorkItemIfNeededWithIdentifier:jobType:jobFlags:inManagedObjectContext:](PLBackgroundJobWorkItem, "insertBackgroundJobWorkItemIfNeededWithIdentifier:jobType:jobFlags:inManagedObjectContext:", v8, v12, a4, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)countOfSearchIndexWorkItemsInManagedObjectContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v4 = (void *)MEMORY[0x1E0C97B48];
  v5 = a3;
  objc_msgSend(a1, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("jobType"), &unk_1E3763A40);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  objc_msgSend(v7, "setResultType:", 4);
  v15 = 0;
  v9 = objc_msgSend(v5, "countForFetchRequest:error:", v7, &v15);

  v10 = v15;
  v11 = (void *)MEMORY[0x1E0D732B8];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "successWithResult:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (id)countOfSearchIndexInsertAssetWorkItemsInManagedObjectContext:(id)a3
{
  id v4;
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
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(a1, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("jobType"), &unk_1E3763A58);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  objc_msgSend(v7, "setFetchBatchSize:", 100);
  v25 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v7, &v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v25;
  if (v9)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v11);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "jobFlags") == 14)
            ++v14;
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v13);
    }
    else
    {
      v14 = 0;
    }

    v18 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "successWithResult:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

+ (id)_predicateForJobType:(signed __int16)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("jobType"), a3);
}

+ (id)_predicateForJobFlags:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("jobFlags"), a3);
}

+ (id)nextSearchIndexWorkItemJobFlagsInManagedObjectContext:(id)a3 jobType:(signed __int16)a4
{
  uint64_t v4;
  void *v6;
  id v7;
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
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v25;
  const __CFString *v26;
  _QWORD v27[3];

  v4 = a4;
  v27[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C97B48];
  v7 = a3;
  objc_msgSend(a1, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setResultType:", 2);
  if ((_DWORD)v4 == 3)
  {
    v10 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(a1, "_predicateForJobType:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v11;
    v12 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateWithFormat:", CFSTR("%K < %@"), CFSTR("delayUntilDate"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "andPredicateWithSubpredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v16);

  }
  else
  {
    objc_msgSend(a1, "_predicateForJobType:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v11);
  }

  objc_msgSend(v9, "setFetchLimit:", 1);
  v26 = CFSTR("jobFlags");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPropertiesToFetch:", v17);

  v25 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v9, &v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v25;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v19);
    v23 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v22 = (void *)v23;
    goto LABEL_10;
  }
  if (!objc_msgSend(v18, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", &unk_1E375EC58);
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v18, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", CFSTR("jobFlags"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v22;
}

+ (id)searchIndexWorkItemsForIncrementalUpdatesInManagedObjectContext:(id)a3 jobType:(signed __int16)a4 jobFlags:(int64_t)a5 fetchLimit:(unint64_t)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v23;
  _QWORD v24[3];

  v8 = a4;
  v24[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(a1, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchRequestWithEntityName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "_predicateForJobType:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  objc_msgSend(a1, "_predicateForJobFlags:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "andPredicateWithSubpredicates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPredicate:", v18);

  if (a6)
    objc_msgSend(v13, "setFetchLimit:", a6);
  v23 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v13, &v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v23;
  if (v19)
    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v19);
  else
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)_searchIndexWorkItemManagedObjectIDsInManagedObjectContext:(id)a3 jobType:(signed __int16)a4 fetchLimit:(unint64_t)a5 additionalPredicate:(id)a6
{
  int v7;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v24;
  _QWORD v25[2];

  v7 = a4;
  v25[1] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = (void *)MEMORY[0x1E0C97B48];
  v12 = a3;
  objc_msgSend(a1, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchRequestWithEntityName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setResultType:", 1);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("jobType"), v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);
  if (v10)
    objc_msgSend(v15, "addObject:", v10);
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicate:", v17);
  if (a5)
    objc_msgSend(v14, "setFetchLimit:", a5);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSortDescriptors:", v19);

  v24 = 0;
  objc_msgSend(v12, "executeFetchRequest:error:", v14, &v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v24;
  if (v20)
    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v20);
  else
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)searchIndexWorkItemManagedObjectIDsInManagedObjectContext:(id)a3 jobType:(signed __int16)a4 fetchLimit:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "_searchIndexWorkItemManagedObjectIDsInManagedObjectContext:jobType:fetchLimit:additionalPredicate:", a3, a4, a5, 0);
}

+ (id)searchIndexWorkItemManagedObjectIDsByPriorityInManagedObjectContext:(id)a3 fetchLimit:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a3;
  objc_msgSend(a1, "searchIndexWorkItemManagedObjectIDsInManagedObjectContext:jobType:fetchLimit:", v6, 1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isFailure") & 1) != 0
    || (objc_msgSend(v7, "result"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v9 >= a4))
  {
    v18 = v7;
  }
  else
  {
    objc_msgSend(v7, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = a4 - objc_msgSend(v10, "count");

    objc_msgSend(a1, "searchIndexWorkItemManagedObjectIDsInManagedObjectContext:jobType:fetchLimit:", v6, 2, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isFailure") & 1) != 0
      || (objc_msgSend(v12, "result"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "count"),
          v13,
          v14 >= a4))
    {
      v18 = v12;
    }
    else
    {
      objc_msgSend(v7, "result");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "result");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v17);
      v18 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v18;
}

+ (id)searchIndexWorkItemManagedObjectIDsForIdentifiers:(id)a3 managedObjectContext:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v16;

  v6 = (void *)MEMORY[0x1E0C97B48];
  v7 = a4;
  v8 = a3;
  objc_msgSend(a1, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setResultType:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K == %d OR %K == %d) AND %K in %@"), CFSTR("jobType"), 1, CFSTR("jobType"), 2, CFSTR("identifier"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPredicate:", v11);
  v16 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v10, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v16;
  if (v12)
    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v12);
  else
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)searchIndexWorkItemManagedObjectIDNeedingRepairInManagedObjectContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3880];
  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a3;
  objc_msgSend(v5, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K < %@"), CFSTR("delayUntilDate"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_searchIndexWorkItemManagedObjectIDsInManagedObjectContext:jobType:fetchLimit:additionalPredicate:", v6, 3, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (signed)searchJobTypeForCurrentQOS
{
  qos_class_t v2;

  v2 = qos_class_self();
  if (v2 > QOS_CLASS_USER_INTERACTIVE || ((1 << v2) & 0x220201) != 0 || ((1 << v2) & 0x202000000) == 0)
    return 2;
  else
    return 1;
}

+ (id)deleteAllSearchIndexJobsInManagedObjectContext:(id)a3
{
  id v4;
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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(a1, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("jobType"), &unk_1E3763A70);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  v24 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v7, &v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v24;
  if (v9)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
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
          objc_msgSend(v4, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15++));
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v13);
    }

    v16 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "successWithResult:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLBackgroundJobWorkItem jobType](self, "jobType");
  if (v6 > 5)
    v7 = CFSTR("unknown");
  else
    v7 = off_1E366CB00[(unsigned __int16)v6];
  -[PLBackgroundJobWorkItem identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobWorkItem jobFlagsDescription](self, "jobFlagsDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobWorkItem timestamp](self, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobWorkItem delayUntilDate](self, "delayUntilDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@ %@ flags: %@ timestamp: %@, delay until: %@"), v5, self, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)jobFlagsDescription
{
  if (-[PLBackgroundJobWorkItem jobType](self, "jobType") - 1 > 2)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[PLBackgroundJobWorkItem jobFlags](self, "jobFlags"));
  else
    PLBackgroundJobWorkerSearchJobFlagsDescription(-[PLBackgroundJobWorkItem jobFlags](self, "jobFlags"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)validateForInsert:(id *)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLBackgroundJobWorkItem;
  v4 = -[PLBackgroundJobWorkItem validateForInsert:](&v6, sel_validateForInsert_, a3);
  if (v4)
    LOBYTE(v4) = -[PLBackgroundJobWorkItem jobType](self, "jobType") - 1 > 2
              || -[PLBackgroundJobWorkItem jobFlags](self, "jobFlags") != 0;
  return v4;
}

- (id)jobIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[PLBackgroundJobWorkItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jobIdentifierWithIdentifier:jobType:jobFlags:", v4, -[PLBackgroundJobWorkItem jobType](self, "jobType"), -[PLBackgroundJobWorkItem jobFlags](self, "jobFlags"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)delayInterval
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[PLBackgroundJobWorkItem delayUntilDate](self, "delayUntilDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0.0;
  -[PLBackgroundJobWorkItem delayUntilDate](self, "delayUntilDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobWorkItem timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  return v7;
}

+ (id)entityName
{
  return CFSTR("BackgroundJobWorkItem");
}

+ (id)insertBackgroundJobWorkItemWithIdentifier:(id)a3 jobType:(signed __int16)a4 jobFlags:(int64_t)a5 inManagedObjectContext:(id)a6
{
  uint64_t v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v16;

  v8 = a4;
  v11 = a3;
  v12 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLBackgroundJobWorkItem.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  objc_msgSend(a1, "insertInManagedObjectContext:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIdentifier:", v11);
  objc_msgSend(v13, "setJobType:", v8);
  objc_msgSend(v13, "setJobFlags:", a5);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTimestamp:", v14);

  return v13;
}

+ (id)insertBackgroundJobWorkItemIfNeededWithIdentifier:(id)a3 jobType:(signed __int16)a4 jobFlags:(int64_t)a5 inManagedObjectContext:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  void *v12;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  if ((objc_msgSend(v11, "hasRecordedBackgroundWorkItemWithIdentifier:jobType:jobFlags:", v10, v8, a5) & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(a1, "insertBackgroundJobWorkItemWithIdentifier:jobType:jobFlags:inManagedObjectContext:", v10, v8, a5, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordBackgroundJobWorkItemCreated:", v12);
  }

  return v12;
}

+ (id)workItemsSortedByTimestampWithJobType:(signed __int16)a3 fetchLimit:(id)a4 resultType:(unint64_t)a5 inManagedObjectContext:(id)a6 error:(id *)a7
{
  uint64_t v10;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v10 = a3;
  v19[1] = *MEMORY[0x1E0C80C00];
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = a6;
  v14 = a4;
  objc_msgSend(v12, "numberWithShort:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_workItemsSortedByTimestampWithIdentifier:jobTypes:fetchLimit:resultType:inManagedObjectContext:error:", 0, v16, v14, a5, v13, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)workItemsSortedByTimestampWithIdentifier:(id)a3 jobType:(signed __int16)a4 inManagedObjectContext:(id)a5 error:(id *)a6
{
  uint64_t v7;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v7 = a4;
  v17[1] = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a5;
  v12 = a3;
  objc_msgSend(v10, "numberWithShort:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "workItemsSortedByTimestampWithIdentifier:jobTypes:inManagedObjectContext:error:", v12, v14, v11, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)workItemsSortedByTimestampWithIdentifier:(id)a3 jobTypes:(id)a4 inManagedObjectContext:(id)a5 error:(id *)a6
{
  return (id)objc_msgSend(a1, "_workItemsSortedByTimestampWithIdentifier:jobTypes:fetchLimit:resultType:inManagedObjectContext:error:", a3, a4, 0, 0, a5, a6);
}

+ (id)_workItemsSortedByTimestampWithIdentifier:(id)a3 jobTypes:(id)a4 fetchLimit:(id)a5 resultType:(unint64_t)a6 inManagedObjectContext:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
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
  void *v27;
  void *v29;
  void *v30;
  id v31;
  void *v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v31 = a7;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLBackgroundJobWorkItem.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("jobTypes"));

  }
  if (a6 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLBackgroundJobWorkItem.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultType == NSManagedObjectResultType || resultType == NSManagedObjectIDResultType"));

  }
  v17 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(a1, "entityName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fetchRequestWithEntityName:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0CB3528];
  if (v14)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("identifier"), v14);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v21;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("jobType"), v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "andPredicateWithSubpredicates:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPredicate:", v24);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSortDescriptors:", v26);

  objc_msgSend(v19, "setResultType:", a6);
  if (v16)
    objc_msgSend(v19, "setFetchLimit:", objc_msgSend(v16, "integerValue"));
  objc_msgSend(v31, "executeFetchRequest:error:", v19, a8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)jobIdentifierWithIdentifier:(id)a3 jobType:(signed __int16)a4 jobFlags:(int64_t)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu%lu"), a3, a4, a5);
}

@end
