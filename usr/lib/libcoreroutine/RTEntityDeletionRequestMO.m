@implementation RTEntityDeletionRequestMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("RTEntityDeletionRequestMO"));
}

+ (id)managedObjectWithCloudManagedObjects:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t *v14;
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    *(_QWORD *)buf = 0;
    v16 = buf;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__129;
    v19 = __Block_byref_object_dispose__129;
    v20 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__RTEntityDeletionRequestMO_managedObjectWithCloudManagedObjects_context___block_invoke;
    v11[3] = &unk_1E929E9D0;
    v14 = buf;
    v12 = v6;
    v13 = v5;
    objc_msgSend(v12, "performBlockAndWait:", v11);
    v8 = *((id *)v16 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

uint64_t __74__RTEntityDeletionRequestMO_managedObjectWithCloudManagedObjects_context___block_invoke(_QWORD *a1)
{
  RTEntityDeletionRequestMO *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = -[RTEntityDeletionRequestMO initWithContext:]([RTEntityDeletionRequestMO alloc], "initWithContext:", a1[4]);
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setRecordIDs:", v5);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "buildDeleteRequestFromCloudManagedObjects:context:", a1[5], a1[4]);
}

- (void)buildDeleteRequestFromCloudManagedObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v10 = "Invalid parameter not satisfying: cloudManagedObject";
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
    goto LABEL_7;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v10 = "Invalid parameter not satisfying: context";
    goto LABEL_10;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__RTEntityDeletionRequestMO_buildDeleteRequestFromCloudManagedObject_context___block_invoke;
  v11[3] = &unk_1E9299D78;
  v11[4] = self;
  v12 = v6;
  v13 = v8;
  objc_msgSend(v13, "performBlockAndWait:", v11);

LABEL_8:
}

void __78__RTEntityDeletionRequestMO_buildDeleteRequestFromCloudManagedObject_context___block_invoke(id *a1)
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
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;

  objc_msgSend(a1[4], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setIdentifier:", v3);

  }
  objc_msgSend(a1[4], "creationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setCreationDate:", v5);

  }
  objc_msgSend(a1[4], "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 4838400.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setExpirationDate:", v7);

  }
  objc_msgSend(a1[4], "recordIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setRecordIDs:", v9);

  }
  objc_msgSend(a1[5], "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isEqual:", v13) ^ 1;

  objc_msgSend(a1[4], "identifiersByTypeInSubgraphOfEntity:shouldTombstone:", a1[5], v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __78__RTEntityDeletionRequestMO_buildDeleteRequestFromCloudManagedObject_context___block_invoke_2;
  v19[3] = &unk_1E92A0620;
  v19[4] = a1[4];
  v20 = v15;
  v18 = v15;
  objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v19);
  objc_msgSend(a1[5], "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setTargetDeviceIdentifier:", v17);

}

void __78__RTEntityDeletionRequestMO_buildDeleteRequestFromCloudManagedObject_context___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "recordIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    v4 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v4, "setByAddingObjectsFromSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "recordIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "setObject:forKey:", v9, v13);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setRecordIDs:", v12);

}

- (void)buildDeleteRequestFromCloudManagedObjects:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v6);
        -[RTEntityDeletionRequestMO buildDeleteRequestFromCloudManagedObject:context:](self, "buildDeleteRequestFromCloudManagedObject:context:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v7);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)identifiersByTypeInSubgraphOfEntity:(id)a3 shouldTombstone:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id result;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v4 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0C9AA70];
LABEL_21:

    return v7;
  }
  v7 = (void *)objc_opt_new();
  if (v4)
    objc_msgSend(v6, "setFlags:", objc_msgSend(v6, "flags") | 1);
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithObjects:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setValue:forKey:", v12, v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "inbound");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTEntityDeletionRequestMO identifiersByTypeInSubgraphOfEntity:shouldTombstone:](self, "identifiersByTypeInSubgraphOfEntity:shouldTombstone:", v13, v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "outbound");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTEntityDeletionRequestMO identifiersByTypeInSubgraphOfEntity:shouldTombstone:](self, "identifiersByTypeInSubgraphOfEntity:shouldTombstone:", v15, v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTEntityDeletionRequestMO mergeEntriesFromDictionary:intoDictionary:](self, "mergeEntriesFromDictionary:intoDictionary:", v14, v7);
    -[RTEntityDeletionRequestMO mergeEntriesFromDictionary:intoDictionary:](self, "mergeEntriesFromDictionary:intoDictionary:", v16, v7);

LABEL_20:
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = v9;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v6, "visits");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v17);
          -[RTEntityDeletionRequestMO identifiersByTypeInSubgraphOfEntity:shouldTombstone:](self, "identifiersByTypeInSubgraphOfEntity:shouldTombstone:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), v4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTEntityDeletionRequestMO mergeEntriesFromDictionary:intoDictionary:](self, "mergeEntriesFromDictionary:intoDictionary:", v22, v7);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v19);
    }

    objc_msgSend(v6, "mapItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTEntityDeletionRequestMO identifiersByTypeInSubgraphOfEntity:shouldTombstone:](self, "identifiersByTypeInSubgraphOfEntity:shouldTombstone:", v23, v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTEntityDeletionRequestMO mergeEntriesFromDictionary:intoDictionary:](self, "mergeEntriesFromDictionary:intoDictionary:", v24, v7);
    v9 = v31;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "address");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTEntityDeletionRequestMO identifiersByTypeInSubgraphOfEntity:shouldTombstone:](self, "identifiersByTypeInSubgraphOfEntity:shouldTombstone:", v25, v4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTEntityDeletionRequestMO mergeEntriesFromDictionary:intoDictionary:](self, "mergeEntriesFromDictionary:intoDictionary:", v26, v7);
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_20;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v37 = v30;
    _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Unhandled entity type, %@", buf, 0xCu);

  }
  __break(1u);
  return result;
}

- (void)mergeEntriesFromDictionary:(id)a3 intoDictionary:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__RTEntityDeletionRequestMO_mergeEntriesFromDictionary_intoDictionary___block_invoke;
  v7[3] = &unk_1E92A05D0;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __71__RTEntityDeletionRequestMO_mergeEntriesFromDictionary_intoDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "allObjects");
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObjectsFromArray:", v8);
    v6 = (id)v8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v9);
  }

}

@end
