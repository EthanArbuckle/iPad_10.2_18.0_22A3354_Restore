@implementation REMReplicaManager

+ (id)replicaManagerForAccountID:(id)a3 store:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__REMReplicaManager_replicaManagerForAccountID_store___block_invoke;
  v13[3] = &unk_1E67F7DE8;
  v16 = &v18;
  v17 = a1;
  v14 = v6;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  v10 = (void (**)(_QWORD))MEMORY[0x1B5E3E098](v13);
  os_unfair_lock_lock((os_unfair_lock_t)&managerByAccountIDLock);
  v10[2](v10);
  os_unfair_lock_unlock((os_unfair_lock_t)&managerByAccountIDLock);
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __54__REMReplicaManager_replicaManagerForAccountID_store___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  REMReplicaManager *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  REMStore *v11;
  REMStore *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  REMReplicaManager *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)managerByAccountID, "objectForKeyedSubscript:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if ((objc_msgSend(*(id *)(a1 + 56), "disablesInMemoryOnlyCheck") & 1) != 0
      || !objc_msgSend(*(id *)(a1 + 56), "shouldUseNewInMemoryOnlyReplicaManager"))
    {
      v10 = *(void **)(a1 + 40);
      if (v10)
        v11 = v10;
      else
        v11 = objc_alloc_init(REMStore);
      v12 = v11;
      v13 = *(_QWORD *)(a1 + 32);
      v31 = 0;
      -[REMStore fetchReplicaManagerForAccountID:error:](v11, "fetchReplicaManagerForAccountID:error:", v13, &v31);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v31;
      if (v14)
      {
        +[REMLog crdt](REMLog, "crdt");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v14, "managerData");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "length");
          *(_DWORD *)buf = 138412546;
          v33 = v2;
          v34 = 2048;
          v35 = v18;
          _os_log_impl(&dword_1B4A39000, v16, OS_LOG_TYPE_INFO, "Deserializing existing replica manager {account = %@, size = %lu}", buf, 0x16u);

        }
        v30 = v15;
        +[REMReplicaManager replicaManagerWithSerializedData:error:](REMReplicaManager, "replicaManagerWithSerializedData:error:", v14, &v30);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v30;

        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v22 = *(void **)(v21 + 40);
        *(_QWORD *)(v21 + 40) = v19;

        v15 = v20;
      }
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        +[REMLog crdt](REMLog, "crdt");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v2;
          _os_log_impl(&dword_1B4A39000, v23, OS_LOG_TYPE_INFO, "Creating a new replica manager {account = %@}", buf, 0xCu);
        }

        v24 = objc_alloc_init(REMReplicaManager);
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v26 = *(void **)(v25 + 40);
        *(_QWORD *)(v25 + 40) = v24;

      }
    }
    else
    {
      +[REMLog crdt](REMLog, "crdt");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v2;
        _os_log_impl(&dword_1B4A39000, v6, OS_LOG_TYPE_INFO, "Creating a new, in-memory only replica manager {account = %@}", buf, 0xCu);
      }

      v7 = objc_alloc_init(REMReplicaManager);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setIsPersistable:", 0);
    }
    v27 = (void *)managerByAccountID;
    if (!managerByAccountID)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)managerByAccountID;
      managerByAccountID = v28;

      v27 = (void *)managerByAccountID;
    }
    objc_msgSend(v27, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v2);
  }

}

+ (BOOL)shouldUseNewInMemoryOnlyReplicaManager
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3
    || (objc_msgSend(CFSTR("com.apple.remindd"), "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend(CFSTR("com.apple.dt.xctest.tool"), "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend(CFSTR("com.apple.TestReminderKit.xctrunner"), "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend(CFSTR("com.apple.iOSTestReminders.xctrunner"), "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend(CFSTR("com.apple.macOSTestReminders.xctrunner"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(CFSTR("com.apple.watchOSTestReminders.xctrunner"), "isEqualToString:", v3);
  }

  return v4;
}

- (void)commonInit
{
  self->_ivarLock._os_unfair_lock_opaque = 0;
  self->_isPersistable = 1;
}

- (REMReplicaManager)init
{
  REMReplicaManager *v2;
  REMReplicaManager *v3;
  uint64_t v4;
  NSMutableOrderedSet *replicaUUIDs;
  uint64_t v6;
  NSMutableDictionary *replicaEntries;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)REMReplicaManager;
  v2 = -[REMReplicaManager init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[REMReplicaManager commonInit](v2, "commonInit");
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v4 = objc_claimAutoreleasedReturnValue();
    replicaUUIDs = v3->_replicaUUIDs;
    v3->_replicaUUIDs = (NSMutableOrderedSet *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    replicaEntries = v3->_replicaEntries;
    v3->_replicaEntries = (NSMutableDictionary *)v6;

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMReplicaManager)initWithArchive:(const void *)a3 error:(id *)a4
{
  REMReplicaManager *v5;
  REMReplicaManager *v6;
  unsigned int v7;
  NSMutableOrderedSet *v8;
  int i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  id v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  REMReplicaEntry *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSMutableOrderedSet *replicaUUIDs;
  NSMutableOrderedSet *v33;
  NSMutableOrderedSet *v34;
  NSMutableDictionary *replicaEntries;
  REMReplicaManager *v36;
  void *v37;
  REMReplicaManager *v39;
  _DWORD *v40;
  NSMutableDictionary *v42;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)REMReplicaManager;
  v5 = -[REMReplicaManager init](&v43, sel_init);
  v6 = v5;
  if (v5)
  {
    -[REMReplicaManager commonInit](v5, "commonInit");
    v39 = v6;
    v7 = *((_DWORD *)a3 + 12);
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", v7);
    v8 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      for (i = 0; i != v7; ++i)
      {
        v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
        v11 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)a3 + 40, i);
        if (*(char *)(v11 + 23) >= 0)
          v12 = v11;
        else
          v12 = *(_QWORD *)v11;
        v13 = (void *)objc_msgSend(v10, "initWithUUIDBytes:", v12);
        -[NSMutableOrderedSet addObject:](v8, "addObject:", v13);

      }
    }
    v14 = *((unsigned int *)a3 + 18);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v14);
    v42 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v40 = a3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v14)
    {
      v16 = 0;
      v17 = (char *)a3 + 64;
      while (1)
      {
        v18 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)v17, v16);
        v19 = objc_alloc(MEMORY[0x1E0CB3940]);
        v20 = *(char *)(v18 + 23);
        v21 = v20 >= 0 ? v18 : *(_QWORD *)v18;
        v22 = v20 >= 0 ? *(unsigned __int8 *)(v18 + 23) : *(_QWORD *)(v18 + 8);
        v23 = (REMReplicaEntry *)objc_msgSend(v19, "initWithBytes:length:encoding:", v21, v22, 4);
        if (!-[REMReplicaEntry length](v23, "length"))
          break;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v42, "setObject:forKeyedSubscript:", v24, v23);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, v25);

        v16 = (v16 + 1);
        if ((_DWORD)v14 == (_DWORD)v16)
          goto LABEL_18;
      }
      if (a4)
      {
        +[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", CFSTR("Invalid crdtID"));
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_34;
    }
LABEL_18:
    v26 = v40[24];
    if (v26)
    {
      v27 = 0;
      while (1)
      {
        v28 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<replica_manager::ReplicaEntry>::TypeHandler>((uint64_t)(v40 + 22), v27);
        v23 = -[REMReplicaEntry initWithEntryArchive:]([REMReplicaEntry alloc], "initWithEntryArchive:", v28);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v28 + 40));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[REMReplicaEntry replicaUUIDIndex](v23, "replicaUUIDIndex") >= v7)
        {
          if (!a4)
            goto LABEL_33;
          +[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", CFSTR("Invalid replicaUUIDIndex"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_31;
        }
        if (!v30)
          break;
        -[NSMutableDictionary objectForKeyedSubscript:](v42, "objectForKeyedSubscript:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObject:", v23);

        if (v26 == ++v27)
          goto LABEL_23;
      }
      if (a4)
      {
        v30 = 0;
        +[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", CFSTR("Invalid crdtIDIndex"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
        *a4 = v37;
        goto LABEL_33;
      }
      v30 = 0;
LABEL_33:

LABEL_34:
      v36 = 0;
      v6 = v39;
      goto LABEL_35;
    }
LABEL_23:
    replicaUUIDs = v39->_replicaUUIDs;
    v39->_replicaUUIDs = v8;
    v33 = v8;
    v6 = v39;
    v34 = v33;

    replicaEntries = v39->_replicaEntries;
    v39->_replicaEntries = v42;

  }
  v36 = v6;
LABEL_35:

  return v36;
}

- (void)encodeIntoArchive:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  int32x2_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;
  int *v19;
  int *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  int32x2_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  replica_manager::ReplicaEntry *v37;
  uint64_t v38;
  int32x2_t v39;
  int *v40;
  uint64_t v41;
  id obj;
  id obja;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[16];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  -[REMReplicaManager replicaUUIDs](self, "replicaUUIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v54;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v54 != v5)
          objc_enumerationMutation(obj);
        v7 = (int *)objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v6), "getUUIDBytes:", v59);
        v8 = *((_DWORD *)a3 + 13);
        v9 = *((int *)a3 + 12);
        if ((int)v9 >= v8)
        {
          if (v8 == *((_DWORD *)a3 + 14))
            v7 = google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a3 + 10, v8 + 1);
          v11 = google::protobuf::internal::StringTypeHandlerBase::New((google::protobuf::internal::StringTypeHandlerBase *)v7);
          v12 = *((_QWORD *)a3 + 5);
          v13 = *(int32x2_t *)((char *)a3 + 48);
          *((int32x2_t *)a3 + 6) = vadd_s32(v13, (int32x2_t)0x100000001);
          *(_QWORD *)(v12 + 8 * v13.i32[0]) = v11;
        }
        else
        {
          v10 = *((_QWORD *)a3 + 5);
          *((_DWORD *)a3 + 12) = v9 + 1;
          v11 = *(_QWORD **)(v10 + 8 * v9);
        }
        MEMORY[0x1B5E3DB34](v11, v59, 16);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    }
    while (v4);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[REMReplicaManager replicaEntries](self, "replicaEntries");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v14)
  {
    v40 = (int *)((char *)a3 + 64);
    v41 = *(_QWORD *)v50;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v50 != v41)
          objc_enumerationMutation(obja);
        v16 = *((_DWORD *)a3 + 18);
        v17 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v15));
        v18 = objc_msgSend(v17, "UTF8String");
        v19 = (int *)objc_msgSend(v17, "lengthOfBytesUsingEncoding:", 4);
        v20 = v19;
        v21 = *((_DWORD *)a3 + 19);
        v22 = *((int *)a3 + 18);
        if ((int)v22 >= v21)
        {
          if (v21 == *((_DWORD *)a3 + 20))
            v19 = google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v40, v21 + 1);
          v24 = google::protobuf::internal::StringTypeHandlerBase::New((google::protobuf::internal::StringTypeHandlerBase *)v19);
          v25 = *((_QWORD *)a3 + 8);
          v26 = *(int32x2_t *)((char *)a3 + 72);
          *((int32x2_t *)a3 + 9) = vadd_s32(v26, (int32x2_t)0x100000001);
          *(_QWORD *)(v25 + 8 * v26.i32[0]) = v24;
        }
        else
        {
          v23 = *((_QWORD *)a3 + 8);
          *((_DWORD *)a3 + 18) = v22 + 1;
          v24 = *(_QWORD **)(v23 + 8 * v22);
        }
        MEMORY[0x1B5E3DB34](v24, v18, v20);
        -[REMReplicaManager replicaEntries](self, "replicaEntries");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", v17);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v29 = v28;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
        if (v30)
        {
          v31 = *(_QWORD *)v46;
          do
          {
            v32 = 0;
            do
            {
              if (*(_QWORD *)v46 != v31)
                objc_enumerationMutation(v29);
              v33 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v32);
              v34 = *((_DWORD *)a3 + 25);
              v35 = *((int *)a3 + 24);
              if ((int)v35 >= v34)
              {
                if (v34 == *((_DWORD *)a3 + 26))
                  google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a3 + 22, v34 + 1);
                v37 = google::protobuf::internal::GenericTypeHandler<replica_manager::ReplicaEntry>::New();
                v38 = *((_QWORD *)a3 + 11);
                v39 = *(int32x2_t *)((char *)a3 + 96);
                *((int32x2_t *)a3 + 12) = vadd_s32(v39, (int32x2_t)0x100000001);
                *(_QWORD *)(v38 + 8 * v39.i32[0]) = v37;
              }
              else
              {
                v36 = *((_QWORD *)a3 + 11);
                *((_DWORD *)a3 + 24) = v35 + 1;
                v37 = *(replica_manager::ReplicaEntry **)(v36 + 8 * v35);
              }
              *((_DWORD *)v37 + 8) |= 1u;
              *((_DWORD *)v37 + 10) = v16;
              objc_msgSend(v33, "encodeIntoEntryArchive:", v40);
              ++v32;
            }
            while (v30 != v32);
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
          }
          while (v30);
        }

        ++v15;
      }
      while (v15 != v14);
      v14 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v14);
  }

}

- (void)performLocked:(id)a3
{
  os_unfair_lock_s *p_ivarLock;
  void (**v4)(_QWORD);

  p_ivarLock = &self->_ivarLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_ivarLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_ivarLock);
}

- (id)checkoutReplicaUUIDForClient:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__REMReplicaManager_checkoutReplicaUUIDForClient___block_invoke;
  v8[3] = &unk_1E67F7E10;
  v9 = v4;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  -[REMReplicaManager performLocked:](self, "performLocked:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __50__REMReplicaManager_checkoutReplicaUUIDForClient___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "l_checkoutReplicaUUIDForClient:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)l_checkoutReplicaUUIDForClient:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int64_t v23;
  NSObject *v24;
  id v25;
  void *v26;
  id v27;
  REMReplicaEntry *v28;
  void *v29;
  REMReplicaEntry *v30;
  uint64_t v31;
  void *v32;
  REMReplicaEntry *v33;
  void *v34;
  REMReplicaEntry *v35;
  __int128 v37;
  id obj;
  id v39;
  REMReplicaManager *v40;
  _QWORD v41[6];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint8_t v54[4];
  uint64_t v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v40 = self;
  -[REMReplicaManager replicaEntries](self, "replicaEntries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "crdtID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    -[REMReplicaManager replicaEntries](v40, "replicaEntries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "crdtID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v9);

    v6 = (void *)v7;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[REMReplicaManager replicaUUIDs](v40, "replicaUUIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
  if (v10)
  {
    v12 = *(_QWORD *)v43;
    *(_QWORD *)&v11 = 138413058;
    v37 = v11;
LABEL_5:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v43 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v13);
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __52__REMReplicaManager_l_checkoutReplicaUUIDForClient___block_invoke;
      v41[3] = &unk_1E67F7E38;
      v41[4] = v40;
      v41[5] = v14;
      v15 = objc_msgSend(v6, "indexOfObjectPassingTest:", v41, v37);
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v27 = v14;
        v28 = [REMReplicaEntry alloc];
        -[REMReplicaManager replicaUUIDs](v40, "replicaUUIDs");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[REMReplicaEntry initWithReplicaUUIDIndex:clockElementList:inUse:forClient:](v28, "initWithReplicaUUIDIndex:clockElementList:inUse:forClient:", objc_msgSend(v29, "indexOfObject:", v27), 0, 1, v39);

        objc_msgSend(v6, "addObject:", v30);
        if (v27)
          goto LABEL_25;
        goto LABEL_24;
      }
      objc_msgSend(v6, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "inUse") & 1) == 0)
      {
        objc_msgSend(v39, "clockElementListForReplicaUUID:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "clockElementList");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = +[REMClockElementList list:isCompatibleToList:](REMClockElementList, "list:isCompatibleToList:", v17, v18);

        if (!v19)
        {
          +[REMLog crdt](REMLog, "crdt");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            clientDescription(v39);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMReplicaManager l_checkoutReplicaUUIDForClient:].cold.1(v21, v54, &v55, v20);
          }

        }
        objc_msgSend(v16, "clockElementList");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = +[REMClockElementList compareList:toList:](REMClockElementList, "compareList:toList:", v17, v22);

        if ((unint64_t)(v23 - 2) >= 2)
        {
          if (!v23)
          {
            objc_msgSend(v16, "setClient:", v39);
            objc_msgSend(v16, "setInUse:", 1);
            v27 = v14;

            if (v27)
              goto LABEL_26;
            goto LABEL_24;
          }
        }
        else
        {
          +[REMLog crdt](REMLog, "crdt");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
          {
            clientDescription(v39);
            v25 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "clockElementList");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v37;
            v47 = v25;
            v48 = 2112;
            v49 = v17;
            v50 = 2112;
            v51 = v26;
            v52 = 2112;
            v53 = v14;
            _os_log_fault_impl(&dword_1B4A39000, v24, OS_LOG_TYPE_FAULT, "Client clock newer that replica manager clock {client: %@, clientClockElementList: %@, replicaEntry.clockElementList: %@, replicaUUID: %@}", buf, 0x2Au);

          }
        }

      }
      if (v10 == ++v13)
      {
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
        if (v10)
          goto LABEL_5;
        break;
      }
    }
  }

LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v31 = objc_claimAutoreleasedReturnValue();
  -[REMReplicaManager replicaUUIDs](v40, "replicaUUIDs");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v31);

  v33 = [REMReplicaEntry alloc];
  -[REMReplicaManager replicaUUIDs](v40, "replicaUUIDs");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[REMReplicaEntry initWithReplicaUUIDIndex:clockElementList:inUse:forClient:](v33, "initWithReplicaUUIDIndex:clockElementList:inUse:forClient:", objc_msgSend(v34, "indexOfObject:", v31), 0, 1, v39);

  objc_msgSend(v6, "addObject:", v35);
  v27 = (id)v31;
LABEL_25:
  -[REMReplicaManager setCurrentVersion:](v40, "setCurrentVersion:", -[REMReplicaManager currentVersion](v40, "currentVersion") + 1);
LABEL_26:

  return v27;
}

uint64_t __52__REMReplicaManager_l_checkoutReplicaUUIDForClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "replicaUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v3, "replicaUUIDIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 40));
  return v6;
}

- (void)modifyReplicaEntryForClient:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__REMReplicaManager_modifyReplicaEntryForClient_block___block_invoke;
  v10[3] = &unk_1E67F7E60;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[REMReplicaManager performLocked:](self, "performLocked:", v10);

}

void __55__REMReplicaManager_modifyReplicaEntryForClient_block___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "replicaEntries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "crdtID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "replicaUUIDs", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v9, "replicaUUIDIndex"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "replicaUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v11);

        if (v13)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

          goto LABEL_11;
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)updateVersionForClient:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  REMReplicaManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__REMReplicaManager_updateVersionForClient___block_invoke;
  v6[3] = &unk_1E67F7E88;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[REMReplicaManager modifyReplicaEntryForClient:block:](self, "modifyReplicaEntryForClient:block:", v5, v6);

}

void __44__REMReplicaManager_updateVersionForClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "replicaUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "inUse") & 1) == 0)
  {
    +[REMLog crdt](REMLog, "crdt");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      clientDescription(*(void **)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __44__REMReplicaManager_updateVersionForClient___block_invoke_cold_1(v8, (uint64_t)v4, (uint64_t)v17);
    }

  }
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = v5 == v6;

  if ((v5 & 1) == 0)
  {
    +[REMLog crdt](REMLog, "crdt");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      clientDescription(*(void **)(a1 + 32));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "client");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      clientDescription(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = v12;
      _os_log_fault_impl(&dword_1B4A39000, v9, OS_LOG_TYPE_FAULT, "rem_log_fault_if (client != entry.client) -- Client attempt to update a replica not checked out by it {client: %@, entry.client: %@}", (uint8_t *)&v13, 0x16u);

    }
  }
  if (objc_msgSend(*(id *)(a1 + 40), "l_updateVersionOfEntry:forClient:", v3, *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "setCurrentVersion:", objc_msgSend(*(id *)(a1 + 40), "currentVersion") + 1);

}

- (BOOL)l_updateVersionOfEntry:(id)a3 forClient:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  NSObject *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "replicaUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clockElementListForReplicaUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "clockElementList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[REMClockElementList compareList:toList:](REMClockElementList, "compareList:toList:", v8, v9);

  if (v10)
  {
    if (v10 != 2)
    {
      +[REMLog crdt](REMLog, "crdt");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[REMReplicaManager l_updateVersionOfEntry:forClient:].cold.1(v12);

    }
    objc_msgSend(v5, "setClockElementList:", v8);
  }

  return v10 != 0;
}

- (void)returnReplicaForClient:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  REMReplicaManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__REMReplicaManager_returnReplicaForClient___block_invoke;
  v6[3] = &unk_1E67F7E88;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[REMReplicaManager modifyReplicaEntryForClient:block:](self, "modifyReplicaEntryForClient:block:", v5, v6);

}

void __44__REMReplicaManager_returnReplicaForClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  _BYTE v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "replicaUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "inUse") & 1) == 0)
  {
    +[REMLog crdt](REMLog, "crdt");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      clientDescription(*(void **)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __44__REMReplicaManager_returnReplicaForClient___block_invoke_cold_1(v8, (uint64_t)v4, (uint64_t)v19);
    }

  }
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = v5 == v6;

  if ((v5 & 1) == 0)
  {
    +[REMLog crdt](REMLog, "crdt");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      clientDescription(*(void **)(a1 + 32));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "client");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      clientDescription(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v10;
      v15 = 2112;
      v16 = v4;
      v17 = 2112;
      v18 = v12;
      _os_log_fault_impl(&dword_1B4A39000, v9, OS_LOG_TYPE_FAULT, "rem_log_fault_if (client != entry.client) -- Client attempts to return replicaUUID not checked out by it {client = %@, replicaUUID = %@, checked out by = %@}", (uint8_t *)&v13, 0x20u);

    }
  }
  objc_msgSend(v3, "setInUse:", 0);
  objc_msgSend(v3, "setClient:", 0);
  if (objc_msgSend(*(id *)(a1 + 40), "l_updateVersionOfEntry:forClient:", v3, *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "setCurrentVersion:", objc_msgSend(*(id *)(a1 + 40), "currentVersion") + 1);

}

- (id)description
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__REMReplicaManager_description__block_invoke;
  v4[3] = &unk_1E67F7EB0;
  v4[4] = self;
  v4[5] = &v5;
  -[REMReplicaManager performLocked:](self, "performLocked:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __32__REMReplicaManager_description__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "l_replicaUUIDsDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "l_replicaEntriesDescriptionForPersistence:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> {\n\tcurrentVersion: %llu\n\tmaxLastSavedVersion: %llu\n\tReplica UUIDs: %@\n\tReplica Entries: %@\n}"), objc_opt_class(), *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "currentVersion"), objc_msgSend(*(id *)(a1 + 32), "maxLastSavedVersion"), v6, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)l_replicaUUIDsDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  void *v15;
  id v16;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[REMReplicaManager replicaUUIDs](self, "replicaUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMReplicaManager replicaUUIDs](self, "replicaUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __46__REMReplicaManager_l_replicaUUIDsDescription__block_invoke;
  v15 = &unk_1E67F7ED8;
  v7 = v5;
  v16 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v12);

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("[\n%@\n\t]"), v9, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __46__REMReplicaManager_l_replicaUUIDsDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t\t%lu: %@"), a3, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:");

}

- (id)l_replicaEntriesDescriptionForPersistence:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  BOOL v16;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[REMReplicaManager replicaEntries](self, "replicaEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMReplicaManager replicaEntries](self, "replicaEntries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__REMReplicaManager_l_replicaEntriesDescriptionForPersistence___block_invoke;
  v14[3] = &unk_1E67F7F00;
  v16 = a3;
  v9 = v7;
  v15 = v9;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("[\n%@\n\t]"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __63__REMReplicaManager_l_replicaEntriesDescriptionForPersistence___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  void *v4;
  void *v5;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v29 = v9;
  v30 = v8;
  v10 = 0x1E0CB3000uLL;
  if (objc_msgSend(v9, "count") == 1)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = *(unsigned __int8 *)(a1 + 40);
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(v9, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "persistenceDescription");
    }
    else
    {
      objc_msgSend(v9, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "description");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@"), v13);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    else

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = v9;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v33;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v33 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v17);
          v19 = (void *)MEMORY[0x1E0CB3940];
          v20 = *(unsigned __int8 *)(a1 + 40);
          if (*(_BYTE *)(a1 + 40))
          {
            objc_msgSend(v18, "persistenceDescription");
            v21 = objc_claimAutoreleasedReturnValue();
            v10 = v21;
          }
          else
          {
            objc_msgSend(v18, "description");
            v21 = objc_claimAutoreleasedReturnValue();
            v3 = (void *)v21;
          }
          objc_msgSend(v19, "stringWithFormat:", CFSTR("\t\t\t%@"), v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v22);

          if (v20)
            v23 = (void *)v10;
          else
            v23 = v3;

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v15);
    }

    v24 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("[\n%@\n\t\t]"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v30;
    v10 = 0x1E0CB3000;
  }
  v27 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(v10 + 2368), "stringWithFormat:", CFSTR("\t\t%@: %@"), v8, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v28);

}

- (id)persistenceDescription
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__REMReplicaManager_persistenceDescription__block_invoke;
  v4[3] = &unk_1E67F7EB0;
  v4[4] = self;
  v4[5] = &v5;
  -[REMReplicaManager performLocked:](self, "performLocked:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __43__REMReplicaManager_persistenceDescription__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "l_replicaUUIDsDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "l_replicaEntriesDescriptionForPersistence:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{\n\tversion: %llu\n\tReplica UUIDs: %@\n\tReplica Entries: %@\n}"), objc_msgSend(*(id *)(a1 + 32), "currentVersion"), v6, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)hasUnsavedChanges
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__REMReplicaManager_hasUnsavedChanges__block_invoke;
  v4[3] = &unk_1E67F7F28;
  v4[4] = self;
  v4[5] = &v5;
  -[REMReplicaManager performLocked:](self, "performLocked:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

unint64_t __38__REMReplicaManager_hasUnsavedChanges__block_invoke(uint64_t a1)
{
  unint64_t result;
  unint64_t v3;
  BOOL v4;

  result = objc_msgSend(*(id *)(a1 + 32), "isPersistable");
  if ((_DWORD)result)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "maxLastSavedVersion");
    result = objc_msgSend(*(id *)(a1 + 32), "currentVersion");
    v4 = v3 < result;
  }
  else
  {
    v4 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

+ (id)unsavedReplicaManagersForAccountIDs:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&managerByAccountIDLock);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__REMReplicaManager_unsavedReplicaManagersForAccountIDs___block_invoke;
  v7[3] = &unk_1E67F7EB0;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  __57__REMReplicaManager_unsavedReplicaManagersForAccountIDs___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock((os_unfair_lock_t)&managerByAccountIDLock);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __57__REMReplicaManager_unsavedReplicaManagersForAccountIDs___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        v7 = (void *)managerByAccountID;
        objc_msgSend(v6, "uuid", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "hasUnsavedChanges"))
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v9, v6);

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

}

+ (id)replicaManagerWithSerializedData:(id)a3 error:(id *)a4
{
  id v5;
  REMReplicaManager *v6;
  id v7;
  char *v8;
  void *v9;
  uint64_t v10;
  REMReplicaManager *v11;
  _BYTE v13[112];

  v5 = a3;
  if (objc_msgSend(v5, "isRepresentingDiscardedReplicaManager"))
  {
    v6 = objc_alloc_init(REMReplicaManager);
  }
  else
  {
    replica_manager::ReplicaManager::ReplicaManager((replica_manager::ReplicaManager *)v13);
    objc_msgSend(v5, "managerData");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (char *)objc_msgSend(v7, "bytes");
    objc_msgSend(v5, "managerData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v13, v8, objc_msgSend(v9, "length"));

    if ((v8 & 1) != 0)
    {
      v6 = -[REMReplicaManager initWithArchive:error:]([REMReplicaManager alloc], "initWithArchive:error:", v13, a4);
      if (v6)
      {
        v10 = objc_msgSend(v5, "version");
        -[REMReplicaManager setMaxLastSavedVersion:](v6, "setMaxLastSavedVersion:", v10);
        -[REMReplicaManager setCurrentVersion:](v6, "setCurrentVersion:", v10);
        v11 = v6;
      }

    }
    else if (a4)
    {
      +[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", CFSTR("Cannot deserialize replica manager from input data"));
      v6 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    replica_manager::ReplicaManager::~ReplicaManager((replica_manager::ReplicaManager *)v13);
  }

  return v6;
}

- (id)l_serializedDataWithError:(id *)a3
{
  id v5;
  REMReplicaManagerSerializedData *v6;
  _BYTE v8[112];

  replica_manager::ReplicaManager::ReplicaManager((replica_manager::ReplicaManager *)v8);
  -[REMReplicaManager encodeIntoArchive:](self, "encodeIntoArchive:", v8);
  v5 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (int)replica_manager::ReplicaManager::ByteSize((replica_manager::ReplicaManager *)v8)));
  if (google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v8, (void *)objc_msgSend(v5, "mutableBytes"), objc_msgSend(v5, "length")))
  {
    v6 = -[REMReplicaManagerSerializedData initWithManagerData:version:]([REMReplicaManagerSerializedData alloc], "initWithManagerData:version:", v5, -[REMReplicaManager currentVersion](self, "currentVersion"));
  }
  else if (a3)
  {
    +[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", CFSTR("Cannot serialize replica manager to data"));
    v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  replica_manager::ReplicaManager::~ReplicaManager((replica_manager::ReplicaManager *)v8);
  return v6;
}

- (id)serializedDataCappedAtMaxSize:(BOOL)a3 error:(id *)a4
{
  id v7;
  uint64_t v9;
  void *v10;
  _QWORD v11[7];
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  if (!-[REMReplicaManager isPersistable](self, "isPersistable"))
  {
    +[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", CFSTR("Attempting to serialize a REMReplicaManager that is marked non-persistable"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v14[5];
    v14[5] = v9;

    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__REMReplicaManager_serializedDataCappedAtMaxSize_error___block_invoke;
  v11[3] = &unk_1E67F7F50;
  v12 = a3;
  v11[4] = self;
  v11[5] = &v19;
  v11[6] = &v13;
  -[REMReplicaManager performLocked:](self, "performLocked:", v11);
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease((id)v14[5]);
LABEL_4:
  v7 = (id)v20[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v7;
}

void __57__REMReplicaManager_serializedDataCappedAtMaxSize_error___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id obj;
  id v23;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    if (objc_msgSend(v3, "exceededMaxSerializedSize"))
    {
      +[REMReplicaManagerSerializedData serializedDataRepresentingDiscardedReplicaManager](REMReplicaManagerSerializedData, "serializedDataRepresentingDiscardedReplicaManager");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
    else
    {
      v11 = *(void **)(a1 + 32);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v23 = *(id *)(v12 + 40);
      objc_msgSend(v11, "l_serializedDataWithError:", &v23);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v12 + 40), v23);
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (v16)
      {
        objc_msgSend(v16, "managerData");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "length");

        if (v18 > 0x19000)
        {
          +[REMReplicaManagerSerializedData serializedDataRepresentingDiscardedReplicaManager](REMReplicaManagerSerializedData, "serializedDataRepresentingDiscardedReplicaManager");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = *(void **)(v20 + 40);
          *(_QWORD *)(v20 + 40) = v19;

          objc_msgSend(*(id *)(a1 + 32), "setExceededMaxSerializedSize:", 1);
        }
      }
    }
  }
  else
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v7 + 40);
    objc_msgSend(v3, "l_serializedDataWithError:", &obj);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v7 + 40), obj);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (void)didSaveVersion:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__REMReplicaManager_didSaveVersion___block_invoke;
  v3[3] = &unk_1E67F7F78;
  v3[4] = self;
  v3[5] = a3;
  -[REMReplicaManager performLocked:](self, "performLocked:", v3);
}

unint64_t __36__REMReplicaManager_didSaveVersion___block_invoke(uint64_t a1)
{
  unint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "maxLastSavedVersion");
  if (result < *(_QWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "setMaxLastSavedVersion:");
  return result;
}

+ (BOOL)disablesInMemoryOnlyCheck
{
  return disablesInMemoryOnlyCheck;
}

+ (void)setDisablesInMemoryOnlyCheck:(BOOL)a3
{
  disablesInMemoryOnlyCheck = a3;
}

+ (id)replicaManagerIfLoadedForAccountID:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&managerByAccountIDLock);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__REMReplicaManager_replicaManagerIfLoadedForAccountID___block_invoke;
  v7[3] = &unk_1E67F7F28;
  v8 = v3;
  v9 = &v10;
  v4 = v3;
  __56__REMReplicaManager_replicaManagerIfLoadedForAccountID___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock((os_unfair_lock_t)&managerByAccountIDLock);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __56__REMReplicaManager_replicaManagerIfLoadedForAccountID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)managerByAccountID;
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (void)setReplicaManager:(id)a3 forAccountID:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[6];

  v6 = a3;
  v5 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&managerByAccountIDLock);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__REMReplicaManager_setReplicaManager_forAccountID___block_invoke;
  v7[3] = &unk_1E67F7FA0;
  v7[4] = v5;
  v7[5] = v6;
  __52__REMReplicaManager_setReplicaManager_forAccountID___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock((os_unfair_lock_t)&managerByAccountIDLock);

}

void __52__REMReplicaManager_setReplicaManager_forAccountID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = (void *)managerByAccountID;
  if (!managerByAccountID)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)managerByAccountID;
    managerByAccountID = v3;

    v2 = (void *)managerByAccountID;
  }
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5);

}

- (unint64_t)replicaEntryCount
{
  void *v2;
  unint64_t v3;

  -[REMReplicaManager replicaEntries](self, "replicaEntries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)availabilityOfFirstReplicaForCRDTID:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__REMReplicaManager_availabilityOfFirstReplicaForCRDTID___block_invoke;
  v8[3] = &unk_1E67F7FC8;
  v8[4] = self;
  v9 = v4;
  v10 = &v11;
  v5 = v4;
  -[REMReplicaManager performLocked:](self, "performLocked:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __57__REMReplicaManager_availabilityOfFirstReplicaForCRDTID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "replicaEntries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "inUse") ^ 1);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (id)clockOfFirstReplicaForCRDTID:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__REMReplicaManager_clockOfFirstReplicaForCRDTID___block_invoke;
  v8[3] = &unk_1E67F7FC8;
  v8[4] = self;
  v9 = v4;
  v10 = &v11;
  v5 = v4;
  -[REMReplicaManager performLocked:](self, "performLocked:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __50__REMReplicaManager_clockOfFirstReplicaForCRDTID___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "replicaEntries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "clockElementList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "clockElementList");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "elements");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "numberWithUnsignedLongLong:", objc_msgSend(v3, "clock"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v10);
    if (v8)
    {

    }
  }

}

- (BOOL)hasEqualPersistedEntriesAs:(id)a3
{
  REMReplicaManager *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = (REMReplicaManager *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    -[REMReplicaManager replicaUUIDs](self, "replicaUUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReplicaManager replicaUUIDs](v4, "replicaUUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {

    }
    else
    {
      -[REMReplicaManager replicaUUIDs](self, "replicaUUIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReplicaManager replicaUUIDs](v4, "replicaUUIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

      if ((v9 & 1) == 0)
        goto LABEL_21;
    }
    -[REMReplicaManager replicaEntries](self, "replicaEntries");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    -[REMReplicaManager replicaEntries](v4, "replicaEntries");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v12 != v14)
    {
LABEL_21:
      v10 = 0;
      goto LABEL_25;
    }
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[REMReplicaManager replicaEntries](self, "replicaEntries");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v16)
    {
      v29 = *(_QWORD *)v32;
      obj = v15;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v32 != v29)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          -[REMReplicaManager replicaEntries](self, "replicaEntries", v29);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          -[REMReplicaManager replicaEntries](v4, "replicaEntries");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = objc_msgSend(v20, "count");
          if (v23 != objc_msgSend(v22, "count"))
          {
LABEL_22:

            v10 = 0;
            v15 = obj;
            goto LABEL_24;
          }
          v24 = 0;
          while (v24 < objc_msgSend(v20, "count"))
          {
            objc_msgSend(v20, "objectAtIndexedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectAtIndexedSubscript:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v25, "hasEqualPersistedPropertiesAs:", v26);

            ++v24;
            if ((v27 & 1) == 0)
              goto LABEL_22;
          }

        }
        v15 = obj;
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        v10 = 1;
        if (v16)
          continue;
        break;
      }
    }
    else
    {
      v10 = 1;
    }
LABEL_24:

  }
LABEL_25:

  return v10;
}

- (void)addRandomReplicaEntriesWithCount:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__REMReplicaManager_addRandomReplicaEntriesWithCount___block_invoke;
  v3[3] = &unk_1E67F7F78;
  v3[4] = self;
  v3[5] = a3;
  -[REMReplicaManager performLocked:](self, "performLocked:", v3);
}

uint64_t __54__REMReplicaManager_addRandomReplicaEntriesWithCount___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  REMReplicaEntry *v9;
  void *v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "replicaUUIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "replicaUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  if (*(uint64_t *)(a1 + 40) >= 1)
  {
    v6 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = -[REMReplicaEntry initWithReplicaUUIDIndex:clockElementList:inUse:forClient:]([REMReplicaEntry alloc], "initWithReplicaUUIDIndex:clockElementList:inUse:forClient:", 0, 0, 0, 0);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "replicaEntries");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v8);

      ++v6;
    }
    while (v6 < *(_QWORD *)(a1 + 40));
  }
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentVersion:", objc_msgSend(*(id *)(a1 + 32), "currentVersion") + 1);
}

- (os_unfair_lock_s)ivarLock
{
  return self->_ivarLock;
}

- (void)setIvarLock:(os_unfair_lock_s)a3
{
  self->_ivarLock = a3;
}

- (BOOL)isPersistable
{
  return self->_isPersistable;
}

- (void)setIsPersistable:(BOOL)a3
{
  self->_isPersistable = a3;
}

- (NSMutableOrderedSet)replicaUUIDs
{
  return self->_replicaUUIDs;
}

- (void)setReplicaUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_replicaUUIDs, a3);
}

- (NSMutableDictionary)replicaEntries
{
  return self->_replicaEntries;
}

- (void)setReplicaEntries:(id)a3
{
  objc_storeStrong((id *)&self->_replicaEntries, a3);
}

- (unint64_t)currentVersion
{
  return self->_currentVersion;
}

- (void)setCurrentVersion:(unint64_t)a3
{
  self->_currentVersion = a3;
}

- (unint64_t)maxLastSavedVersion
{
  return self->_maxLastSavedVersion;
}

- (void)setMaxLastSavedVersion:(unint64_t)a3
{
  self->_maxLastSavedVersion = a3;
}

- (BOOL)exceededMaxSerializedSize
{
  return self->_exceededMaxSerializedSize;
}

- (void)setExceededMaxSerializedSize:(BOOL)a3
{
  self->_exceededMaxSerializedSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replicaEntries, 0);
  objc_storeStrong((id *)&self->_replicaUUIDs, 0);
}

- (void)l_checkoutReplicaUUIDForClient:(_QWORD *)a3 .cold.1(void *a1, uint8_t *buf, _QWORD *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_fault_impl(&dword_1B4A39000, log, OS_LOG_TYPE_FAULT, "Clock element list is incompatible with existing list {cliet: %@}", buf, 0xCu);

  OUTLINED_FUNCTION_2_0();
}

void __44__REMReplicaManager_updateVersionForClient___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_1_0((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_0_0(&dword_1B4A39000, v6, v4, "rem_log_fault_if (!entry.inUse) -- Client attempt to update replica while it is not in use {client: %@, replicaUUID: %@}", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)l_updateVersionOfEntry:(os_log_t)log forClient:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B4A39000, log, OS_LOG_TYPE_FAULT, "rem_log_fault_if (comparisonResult != REMClockElementsComparisonResultDescending) -- Can only update with a newer version.", v1, 2u);
}

void __44__REMReplicaManager_returnReplicaForClient___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_1_0((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_0_0(&dword_1B4A39000, v6, v4, "rem_log_fault_if (!entry.inUse) -- Client attempts to return replicaUUID while it is not in use {client = %@, replicaUUID = %@}", v5);

  OUTLINED_FUNCTION_2_0();
}

@end
