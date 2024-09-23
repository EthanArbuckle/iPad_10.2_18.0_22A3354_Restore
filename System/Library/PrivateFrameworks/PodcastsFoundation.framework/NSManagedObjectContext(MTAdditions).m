@implementation NSManagedObjectContext(MTAdditions)

- (uint64_t)objectForUuid:()MTAdditions entityName:
{
  return objc_msgSend(a1, "objectForUuid:entityName:returnsObjectAsFault:", a3, a4, 0);
}

- (uint64_t)_objectsInEntity:()MTAdditions predicate:sortDescriptors:resultType:returnsObjectsAsFaults:limit:
{
  return objc_msgSend(a1, "_objectsInEntity:predicate:sortDescriptors:resultType:returnsObjectsAsFaults:limit:propertiesToFetch:batchSize:", 0, 0);
}

- (id)objectForUuid:()MTAdditions entityName:returnsObjectAsFault:
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v16;

  v8 = (void *)MEMORY[0x1E0C97B48];
  v9 = a3;
  objc_msgSend(v8, "fetchRequestWithEntityName:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForUuid:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPredicate:", v11);
  objc_msgSend(v10, "setReturnsObjectsAsFaults:", a5);
  objc_msgSend(v10, "setFetchLimit:", 1);
  v16 = 0;
  objc_msgSend(a1, "executeFetchRequest:error:", v10, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;
  objc_msgSend(v12, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "logAndThrow:", 0);
  return v14;
}

- (id)_objectsInEntity:()MTAdditions predicate:sortDescriptors:resultType:returnsObjectsAsFaults:limit:propertiesToFetch:batchSize:
{
  id v15;
  id v16;
  objc_class *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v27;

  v15 = a5;
  v16 = a9;
  v17 = (objc_class *)MEMORY[0x1E0C97B48];
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend([v17 alloc], "initWithEntityName:", v19);

  objc_msgSend(v20, "setPredicate:", v18);
  objc_msgSend(v20, "setResultType:", a6);
  if (v15)
  {
    objc_msgSend(v20, "setSortDescriptors:", v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSortDescriptors:", v21);

  }
  objc_msgSend(v20, "setFetchLimit:", a8);
  objc_msgSend(v20, "setFetchBatchSize:", a10);
  if (objc_msgSend(v16, "count"))
    objc_msgSend(v20, "setPropertiesToFetch:", v16);
  if (!a6)
    objc_msgSend(v20, "setReturnsObjectsAsFaults:", a7);
  v27 = 0;
  objc_msgSend(a1, "executeFetchRequest:error:", v20, &v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v27;
  v24 = v23;
  if (!v22)
    objc_msgSend(v23, "logAndThrow:", 1);

  return v22;
}

- (uint64_t)_predicateForUuid:()MTAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid = %@"), a3);
}

- (uint64_t)objectsInEntity:()MTAdditions predicate:sortDescriptors:
{
  return objc_msgSend(a1, "_objectsInEntity:predicate:sortDescriptors:resultType:returnsObjectsAsFaults:limit:", a3, a4, a5, 0, 0, 0);
}

- (uint64_t)objectsInEntity:()MTAdditions predicate:sortDescriptors:returnsObjectsAsFaults:limit:
{
  return objc_msgSend(a1, "_objectsInEntity:predicate:sortDescriptors:resultType:returnsObjectsAsFaults:limit:", a3, a4, a5, 0, a6, a7);
}

- (uint64_t)objectDictionariesInEntity:()MTAdditions predicate:sortDescriptors:propertiesToFetch:includeObjectId:
{
  uint64_t v8;

  LOBYTE(v8) = 0;
  return objc_msgSend(a1, "objectDictionariesInEntity:predicate:sortDescriptors:propertiesToFetch:includeObjectId:limit:distinct:groupBy:", a3, a4, a5, a6, a7, 0, v8, 0);
}

- (id)objectDictionariesInEntity:()MTAdditions predicate:sortDescriptors:propertiesToFetch:includeObjectId:limit:distinct:groupBy:
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v30;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a10;
  if (a7)
  {
    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "setName:", CFSTR("objectID"));
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setExpression:", v22);

    objc_msgSend(v21, "setExpressionResultType:", 2000);
    objc_msgSend(v19, "arrayByAddingObject:", v21);
    v23 = objc_claimAutoreleasedReturnValue();

    v19 = (id)v23;
  }
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", v16);
  objc_msgSend(v24, "setPredicate:", v17);
  if (v18)
    v25 = v18;
  else
    v25 = (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(v24, "setSortDescriptors:", v25);
  objc_msgSend(v24, "setPropertiesToFetch:", v19);
  objc_msgSend(v24, "setFetchLimit:", a8);
  objc_msgSend(v24, "setResultType:", 2);
  objc_msgSend(v24, "setReturnsDistinctResults:", a9);
  if (v20)
    objc_msgSend(v24, "setPropertiesToGroupBy:", v20);
  v30 = 0;
  objc_msgSend(a1, "executeFetchRequest:error:", v24, &v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v30;
  v28 = v27;
  if (!v26)
    objc_msgSend(v27, "logAndThrow:", 1);

  return v26;
}

- (uint64_t)saveInCurrentBlock
{
  char v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v7;

  if (!objc_msgSend(a1, "hasChanges"))
  {
    v4 = 0;
    goto LABEL_5;
  }
  v7 = 0;
  v2 = objc_msgSend(a1, "save:", &v7);
  v3 = v7;
  v4 = v3;
  if ((v2 & 1) != 0)
  {
LABEL_5:
    v5 = 1;
    goto LABEL_6;
  }
  objc_msgSend(v3, "logAndThrow:printStackTrace:", 1, 1);
  v5 = 0;
LABEL_6:

  return v5;
}

- (uint64_t)objectsInEntity:()MTAdditions predicate:sortDescriptors:returnsObjectsAsFaults:
{
  return objc_msgSend(a1, "_objectsInEntity:predicate:sortDescriptors:resultType:returnsObjectsAsFaults:limit:", a3, a4, a5, 0, a6, 0);
}

- (void)performBlockAndWaitWithSave:()MTAdditions
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__NSManagedObjectContext_MTAdditions__performBlockAndWaitWithSave___block_invoke;
  v6[3] = &unk_1E54D1148;
  v6[4] = a1;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "performBlockAndWait:", v6);

}

- (uint64_t)objectsInEntity:()MTAdditions predicate:propertiesToFetch:limit:
{
  return objc_msgSend(a1, "_objectsInEntity:predicate:sortDescriptors:resultType:returnsObjectsAsFaults:limit:propertiesToFetch:batchSize:", a3, a4, MEMORY[0x1E0C9AA60], 0, 1, a6, a5, 0);
}

- (id)executeFetchRequest:()MTAdditions
{
  void *v3;
  id v4;
  void *v5;
  id v7;

  v7 = 0;
  objc_msgSend(a1, "executeFetchRequest:error:", a3, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "logAndThrow:", 1);

  return v3;
}

- (id)objectInEntity:()MTAdditions predicate:
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_objectsInEntity:predicate:sortDescriptors:resultType:returnsObjectsAsFaults:limit:", a3, a4, MEMORY[0x1E0C9AA60], 0, 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)objectsInEntity:()MTAdditions predicate:propertiesToFetch:batchSize:
{
  return objc_msgSend(a1, "_objectsInEntity:predicate:sortDescriptors:resultType:returnsObjectsAsFaults:limit:propertiesToFetch:batchSize:", a3, a4, MEMORY[0x1E0C9AA60], 0, 1, 0, a5, a6);
}

- (uint64_t)objectDictionaryForUuid:()MTAdditions entityName:
{
  return objc_msgSend(a1, "objectDictionaryForUuid:propertiesToFetch:entityName:", a3, 0, a4);
}

- (id)objectDictionaryForUuid:()MTAdditions propertiesToFetch:entityName:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a1, "_predicateForUuid:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectDictionariesInEntity:predicate:sortDescriptors:propertiesToFetch:includeObjectId:", v8, v10, 0, v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)valueForProperty:()MTAdditions objectUuid:entityName:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "length") && objc_msgSend(v9, "length"))
  {
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "objectDictionaryForUuid:propertiesToFetch:entityName:", v9, v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "objectForKeyedSubscript:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)objectDictionaryForUuid:()MTAdditions entityName:byAddingComputedProperties:toFetchedObjectDictionary:
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[16];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v24 = a4;
  v11 = a5;
  v26 = a6;
  if (!objc_msgSend(v10, "length"))
  {
    _MTLogCategoryDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A904E000, v12, OS_LOG_TYPE_ERROR, "Episode Uuid expected but is missing", buf, 2u);
    }

  }
  if (objc_msgSend(v10, "length", v24) && objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "objectForUuid:entityName:", v10, v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = v11;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v15);
          v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v14, "valueForKeyPath:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v13, "setObject:forKey:", v20, v19);

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v16);
    }

    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count") + objc_msgSend(v26, "count"));
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addEntriesFromDictionary:", v26);
      objc_msgSend(v21, "addEntriesFromDictionary:", v13);
    }
    else
    {
      v21 = v26;
    }

    v22 = v26;
  }
  else
  {
    v22 = v26;
    v21 = v26;
  }

  return v21;
}

- (uint64_t)countOfObjectsInEntity:()MTAdditions predicate:
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v12;

  v6 = (void *)MEMORY[0x1E0C97B48];
  v7 = a4;
  objc_msgSend(v6, "fetchRequestWithEntityName:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v7);

  objc_msgSend(v8, "setReturnsDistinctResults:", 1);
  objc_msgSend(v8, "setPropertiesToFetch:", &unk_1E55395E8);
  v12 = 0;
  v9 = objc_msgSend(a1, "countForFetchRequest:error:", v8, &v12);
  v10 = v12;
  objc_msgSend(v10, "logAndThrow:", 1);

  return v9;
}

- (BOOL)hasAnyObjectsInEntity:()MTAdditions satisfyingPredicate:
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v12;

  v6 = (void *)MEMORY[0x1E0C97B48];
  v7 = a4;
  objc_msgSend(v6, "fetchRequestWithEntityName:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIncludesPropertyValues:", 0);
  objc_msgSend(v8, "setIncludesSubentities:", 0);
  objc_msgSend(v8, "setFetchLimit:", 1);
  objc_msgSend(v8, "setPredicate:", v7);

  v12 = 0;
  v9 = objc_msgSend(a1, "countForFetchRequest:error:", v8, &v12);
  v10 = v12;
  objc_msgSend(v10, "logAndThrow:", 1);

  return v9 != 0;
}

- (id)titlesOfObjectsInEntity:()MTAdditions predicate:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v7);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("pubDate"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v10);

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__NSManagedObjectContext_MTAdditions__titlesOfObjectsInEntity_predicate___block_invoke;
  v14[3] = &unk_1E54D1170;
  v16 = &v17;
  v14[4] = a1;
  v11 = v8;
  v15 = v11;
  objc_msgSend(a1, "performBlockAndWait:", v14);
  v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (void)batchDeleteObjectsInEntity:()MTAdditions predicate:
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v6 = (objc_class *)MEMORY[0x1E0C97B48];
  v7 = a4;
  v8 = a3;
  v11 = (id)objc_msgSend([v6 alloc], "initWithEntityName:", v8);

  objc_msgSend(v11, "setPredicate:", v7);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v11);
  v10 = (id)objc_msgSend(a1, "executeRequest:error:", v9, 0);

}

@end
