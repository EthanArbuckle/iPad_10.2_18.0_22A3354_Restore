@implementation SMConversationMO

+ (id)managedObjectWithSMConversation:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)objc_msgSend(a1, "managedObjectWithSMConversation:managedObject:inManagedObjectContext:", a3, 0, a4);
}

+ (id)managedObjectWithSMConversation:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  const char *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t *v19;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v11 = 0;
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: conversation";
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_7;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: managedObjectContext";
    goto LABEL_10;
  }
  *(_QWORD *)buf = 0;
  v21 = buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__95;
  v24 = __Block_byref_object_dispose__95;
  v25 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__SMConversationMO_managedObjectWithSMConversation_managedObject_inManagedObjectContext___block_invoke;
  v15[3] = &unk_1E92987D0;
  v19 = buf;
  v16 = v8;
  v17 = v10;
  v18 = v7;
  objc_msgSend(v17, "performBlockAndWait:", v15);
  v11 = *((id *)v21 + 5);

  _Block_object_dispose(buf, 8);
LABEL_8:

  return v11;
}

void __89__SMConversationMO_managedObjectWithSMConversation_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  SMConversationMO *v2;
  SMConversationMO *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  void *v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = *(SMConversationMO **)(a1 + 32);
  v3 = v2;
  if (!v2)
    v3 = -[SMConversationMO initWithContext:]([SMConversationMO alloc], "initWithContext:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v3);
  if (!v2)

  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setIdentifier:", v4);

  objc_msgSend(*(id *)(a1 + 48), "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setDisplayName:", v5);

  v6 = objc_alloc(MEMORY[0x1E0C99E10]);
  objc_msgSend(*(id *)(a1 + 48), "receiverHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "receiverHandles");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v8)
  {
    v9 = v8;
    v30 = *(_QWORD *)v33;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v33 != v30)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v10);
        +[SMHandleMO fetchRequest](SMHandleMO, "fetchRequest");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(v11, "primaryHandle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("primaryHandle"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setPredicate:", v15);

        v16 = *(void **)(a1 + 40);
        v31 = 0;
        objc_msgSend(v16, "executeFetchRequest:error:", v12, &v31);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v31;
        if (v18)
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v11, "primaryHandle");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "secondaryHandles");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v37 = "+[SMConversationMO managedObjectWithSMConversation:managedObject:inManagedObjectContext:]_block_invoke";
            v38 = 2112;
            v39 = v25;
            v40 = 2112;
            v41 = v26;
            v42 = 2112;
            v43 = v18;
            _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "SMConversationMO,%s,handle.primaryHandle,%@,handle.secondaryHandles,%@,handle fetch error,%@", buf, 0x2Au);

          }
        }
        objc_msgSend(v17, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[SMHandleMO managedObjectWithSMHandle:managedObject:inManagedObjectContext:](SMHandleMO, "managedObjectWithSMHandle:managedObject:inManagedObjectContext:", v11, v20, *(_QWORD *)(a1 + 40));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v22 = (void *)MEMORY[0x1E0C99E40];
          objc_msgSend(v11, "secondaryHandles");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "orderedSetWithArray:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setSecondaryHandles:", v24);

          objc_msgSend(v29, "addObject:", v21);
        }

        ++v10;
      }
      while (v9 != v10);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v9);
  }

  v27 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setReceiverHandles:", v27);

}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("SMConversationMO"));
}

@end
