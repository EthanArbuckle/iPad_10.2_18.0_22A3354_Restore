@implementation WFCloudKitItemRequest

void __60__WFCloudKitItemRequest_desiredKeysFromProperties_itemType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if ((objc_msgSend(a3, "isIgnoredByDefault") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (id)fetchConfigurationAssetWithType:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v9;
  __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v24;
  _QWORD v25[4];
  id v26;

  v9 = a5;
  v10 = (__CFString *)a4;
  v11 = a3;
  if (!objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteConfigurationAsset.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetType.length"));

  }
  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applicationBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE90]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v16, "UTF8String");
  if (((v10 != 0) & os_variant_has_internal_content()) != 0)
    v17 = v10;
  else
    v17 = CFSTR("default");
  v18 = v17;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("assetType = %@ AND shortVersion = %@ AND buildNumber = %@ AND configuration = %@"), v11, v14, v15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_opt_class();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __115__WFCloudKitItemRequest_RemoteConfigurationAsset__fetchConfigurationAssetWithType_configuration_completionHandler___block_invoke;
  v25[3] = &unk_1E7AF6C78;
  v26 = v9;
  v21 = v9;
  -[WFCloudKitItemRequest fetchItemsWithPredicate:itemType:groupName:properties:sortDescriptors:resultsLimit:completionHandler:](self, "fetchItemsWithPredicate:itemType:groupName:properties:sortDescriptors:resultsLimit:completionHandler:", v19, v20, CFSTR("ConfigurationAssetQuery"), 0, 0, 1, v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)fetchConfigurationAssetWithType:(id)a3 completionHandler:(id)a4
{
  return -[WFCloudKitItemRequest fetchConfigurationAssetWithType:configuration:completionHandler:](self, "fetchConfigurationAssetWithType:configuration:completionHandler:", a3, 0, a4);
}

- (id)fetchItemsWithPredicate:(id)a3 itemType:(Class)a4 groupName:(id)a5 properties:(id)a6 sortDescriptors:(id)a7 resultsLimit:(unint64_t)a8 completionHandler:(id)a9
{
  return -[WFCloudKitItemRequest fetchItemsWithPredicate:itemType:groupName:properties:sortDescriptors:resultsLimit:qualityOfService:completionHandler:](self, "fetchItemsWithPredicate:itemType:groupName:properties:sortDescriptors:resultsLimit:qualityOfService:completionHandler:", a3, a4, a5, a6, a7, a8, 25, a9);
}

- (id)fetchItemsWithPredicate:(id)a3 itemType:(Class)a4 groupName:(id)a5 properties:(id)a6 sortDescriptors:(id)a7 resultsLimit:(unint64_t)a8 qualityOfService:(int64_t)a9 completionHandler:(id)a10
{
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v50;
  id v52;
  id v53;
  void *v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  WFCloudKitItemRequest *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  Class v67;
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  v53 = a6;
  v52 = a10;
  v16 = a7;
  v17 = a5;
  if ((-[objc_class conformsToProtocol:](a4, "conformsToProtocol:", &unk_1EF72DF08) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCloudKitItemRequest.m"), 150, CFSTR("Item type must conform to WFCloudKitItem protocol"));

  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  getWFGalleryLogObject();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v69 = "-[WFCloudKitItemRequest fetchItemsWithPredicate:itemType:groupName:properties:sortDescriptors:resultsLimit:qua"
          "lityOfService:completionHandler:]";
    v70 = 2114;
    v71 = v18;
    _os_log_impl(&dword_1C15B3000, v19, OS_LOG_TYPE_INFO, "%s Starting task with debugging UUID: %{public}@", buf, 0x16u);
  }

  v20 = (void *)objc_opt_new();
  v21 = objc_alloc(MEMORY[0x1E0C95010]);
  -[objc_class recordType](a4, "recordType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithRecordType:predicate:", v22, v55);

  v54 = v23;
  objc_msgSend(v23, "setSortDescriptors:", v16);

  getWFCloudKitLogObject();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    -[objc_class recordType](a4, "recordType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v69 = "-[WFCloudKitItemRequest fetchItemsWithPredicate:itemType:groupName:properties:sortDescriptors:resultsLimit:qua"
          "lityOfService:completionHandler:]";
    v70 = 2114;
    v71 = v18;
    v72 = 2114;
    v73 = v25;
    v74 = 2112;
    v75 = v55;
    _os_log_impl(&dword_1C15B3000, v24, OS_LOG_TYPE_INFO, "%s Debugging UUID: %{public}@ Searching records of type %{public}@ with predicate: %@", buf, 0x2Au);

  }
  v26 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  objc_msgSend(v26, "setName:", v17);

  objc_msgSend(v26, "defaultConfiguration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setQualityOfService:", a9);

  -[WFCloudKitItemRequest xpcActivity](self, "xpcActivity");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "defaultConfiguration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setXpcActivity:", v28);

  v30 = (void *)objc_opt_new();
  v31 = (void *)objc_opt_new();
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95038]), "initWithQuery:", v54);
  v33 = v32;
  if (a8)
    objc_msgSend(v32, "setResultsLimit:");
  if (!-[WFCloudKitItemRequest performExpensiveFetchOperations](self, "performExpensiveFetchOperations"))
  {
    objc_msgSend((id)objc_opt_class(), "desiredKeysFromProperties:itemType:", v53, a4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setDesiredKeys:", v34);

  }
  objc_msgSend(v33, "setGroup:", v26);
  v35 = objc_alloc(MEMORY[0x1E0C95098]);
  v36 = (void *)objc_msgSend(v35, "initWithZoneName:ownerName:", *MEMORY[0x1E0C94A30], *MEMORY[0x1E0C94730]);
  objc_msgSend(v33, "setZoneID:", v36);

  objc_msgSend(v20, "setCloudOperation:", v33);
  v37 = MEMORY[0x1E0C809B0];
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __143__WFCloudKitItemRequest_fetchItemsWithPredicate_itemType_groupName_properties_sortDescriptors_resultsLimit_qualityOfService_completionHandler___block_invoke;
  v64[3] = &unk_1E7AF1EF0;
  v67 = a4;
  v38 = v30;
  v65 = v38;
  v39 = v31;
  v66 = v39;
  objc_msgSend(v33, "setRecordFetchedBlock:", v64);
  v56[0] = v37;
  v56[1] = 3221225472;
  v56[2] = __143__WFCloudKitItemRequest_fetchItemsWithPredicate_itemType_groupName_properties_sortDescriptors_resultsLimit_qualityOfService_completionHandler___block_invoke_2;
  v56[3] = &unk_1E7AF1F40;
  v40 = v20;
  v57 = v40;
  v58 = v18;
  v62 = v39;
  v63 = v52;
  v59 = self;
  v60 = v38;
  v61 = v26;
  v41 = v39;
  v42 = v26;
  v43 = v38;
  v44 = v52;
  v45 = v18;
  objc_msgSend(v33, "setQueryCompletionBlock:", v56);
  -[WFCloudKitItemRequest database](self, "database");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addOperation:", v33);

  v47 = v62;
  v48 = v40;

  return v48;
}

- (OS_xpc_object)xpcActivity
{
  return self->_xpcActivity;
}

- (BOOL)performExpensiveFetchOperations
{
  return self->_performExpensiveFetchOperations;
}

- (CKDatabase)database
{
  return self->_database;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

+ (id)desiredKeysFromProperties:(id)a3 itemType:(Class)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "setArray:", v5);
  }
  else
  {
    -[objc_class properties](a4, "properties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__WFCloudKitItemRequest_desiredKeysFromProperties_itemType___block_invoke;
    v10[3] = &unk_1E7AF2080;
    v11 = v7;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);

  }
  return v7;
}

void __115__WFCloudKitItemRequest_RemoteConfigurationAsset__fetchConfigurationAssetWithType_configuration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetDataFile");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __143__WFCloudKitItemRequest_fetchItemsWithPredicate_itemType_groupName_properties_sortDescriptors_resultsLimit_qualityOfService_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]) & 1) != 0)
  {
    v6 = objc_msgSend(v4, "code");

    if (v6 == 20)
    {
LABEL_4:
      getWFCloudKitLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315394;
        v25 = "-[WFCloudKitItemRequest fetchItemsWithPredicate:itemType:groupName:properties:sortDescriptors:resultsLimit"
              ":qualityOfService:completionHandler:]_block_invoke_2";
        v26 = 2114;
        v27 = v8;
        _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_INFO, "%s Debugging UUID: %{public}@ cancelled task", buf, 0x16u);
      }

      v9 = *(_QWORD *)(a1 + 80);
      objc_msgSend(*(id *)(a1 + 48), "createTaskCancelledError");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

      goto LABEL_13;
    }
  }
  else
  {

  }
  if (v4)
  {
    getWFCloudKitLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      v25 = "-[WFCloudKitItemRequest fetchItemsWithPredicate:itemType:groupName:properties:sortDescriptors:resultsLimit:q"
            "ualityOfService:completionHandler:]_block_invoke";
      v26 = 2114;
      v27 = v12;
      v28 = 2114;
      v29 = v4;
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_ERROR, "%s Debugging UUID: %{public}@ Unable to complete predicate query: %{public}@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "operationWaitingQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __143__WFCloudKitItemRequest_fetchItemsWithPredicate_itemType_groupName_properties_sortDescriptors_resultsLimit_qualityOfService_completionHandler___block_invoke_210;
    v17[3] = &unk_1E7AF1F18;
    v14 = *(id *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 48);
    v16 = *(void **)(a1 + 56);
    v18 = v14;
    v19 = v15;
    v20 = v16;
    v21 = *(id *)(a1 + 64);
    v23 = *(id *)(a1 + 80);
    v22 = *(id *)(a1 + 72);
    dispatch_async(v13, v17);

  }
LABEL_13:

}

- (OS_dispatch_queue)operationWaitingQueue
{
  return self->_operationWaitingQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_operationWaitingQueue, 0);
  objc_storeStrong((id *)&self->_xpcActivity, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

- (WFCloudKitItemRequest)initWithContainer:(id)a3 database:(id)a4
{
  id v7;
  id v8;
  WFCloudKitItemRequest *v9;
  WFCloudKitItemRequest *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *operationWaitingQueue;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *callbackQueue;
  WFCloudKitItemRequest *v17;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WFCloudKitItemRequest;
  v9 = -[WFCloudKitItemRequest init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_container, a3);
    objc_storeStrong((id *)&v10->_database, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.shortcuts.WFCloutKitItemRequest-operation", v11);
    operationWaitingQueue = v10->_operationWaitingQueue;
    v10->_operationWaitingQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.shortcuts.WFCloudKitItemRequest-callback", v14);
    callbackQueue = v10->_callbackQueue;
    v10->_callbackQueue = (OS_dispatch_queue *)v15;

    v17 = v10;
  }

  return v10;
}

- (id)fetchItemsWithPredicate:(id)a3 itemType:(Class)a4 groupName:(id)a5 properties:(id)a6 completionHandler:(id)a7
{
  return -[WFCloudKitItemRequest fetchItemsWithPredicate:itemType:groupName:properties:sortDescriptors:resultsLimit:completionHandler:](self, "fetchItemsWithPredicate:itemType:groupName:properties:sortDescriptors:resultsLimit:completionHandler:", a3, a4, a5, a6, 0, 0, a7);
}

- (id)fetchItemWithID:(id)a3 itemType:(Class)a4 groupName:(id)a5 properties:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v36;
  _QWORD v37[4];
  id v38;
  WFCloudKitItemRequest *v39;
  id v40;
  id v41;
  id v42;
  Class v43;
  id v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  if ((-[objc_class conformsToProtocol:](a4, "conformsToProtocol:", &unk_1EF72DF08) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCloudKitItemRequest.m"), 221, CFSTR("Item type must conform to WFCloudKitItem protocol"));

  }
  getWFCloudKitLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v12, "recordName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v46 = "-[WFCloudKitItemRequest fetchItemWithID:itemType:groupName:properties:completionHandler:]";
    v47 = 2112;
    v48 = v16;
    _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_INFO, "%s Fetching record with ID: %@", buf, 0x16u);

  }
  v17 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v12, "recordName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("Fetch record and recursive references with ID: %@"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setName:", v20);

  v21 = (void *)objc_opt_new();
  v22 = objc_alloc(MEMORY[0x1E0C94E18]);
  v44 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithRecordIDs:", v23);

  -[WFCloudKitItemRequest xpcActivity](self, "xpcActivity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "configuration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setXpcActivity:", v25);

  if (!-[WFCloudKitItemRequest performExpensiveFetchOperations](self, "performExpensiveFetchOperations"))
  {
    objc_msgSend((id)objc_opt_class(), "desiredKeysFromProperties:itemType:", v13, a4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDesiredKeys:", v27);

  }
  objc_msgSend(v24, "setGroup:", v17);
  objc_msgSend(v21, "setCloudOperation:", v24);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __89__WFCloudKitItemRequest_fetchItemWithID_itemType_groupName_properties_completionHandler___block_invoke;
  v37[3] = &unk_1E7AF1F68;
  v28 = v21;
  v38 = v28;
  v39 = self;
  v42 = v14;
  v43 = a4;
  v40 = v12;
  v41 = v17;
  v29 = v17;
  v30 = v12;
  v31 = v14;
  objc_msgSend(v24, "setFetchRecordsCompletionBlock:", v37);
  -[WFCloudKitItemRequest database](self, "database");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addOperation:", v24);

  v33 = v41;
  v34 = v28;

  return v34;
}

- (id)updateItems:(id)a3 setNilValues:(BOOL)a4 completionHandler:(id)a5
{
  return -[WFCloudKitItemRequest updateItems:setNilValues:qualityOfService:timeoutIntervalForRequest:completionHandler:](self, "updateItems:setNilValues:qualityOfService:timeoutIntervalForRequest:completionHandler:", a3, a4, -1, a5, 0.0);
}

- (id)updateItems:(id)a3 setNilValues:(BOOL)a4 qualityOfService:(int64_t)a5 timeoutIntervalForRequest:(double)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  WFCloudKitItemRequest *v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;
  double v33;
  BOOL v34;
  _QWORD v35[6];

  v13 = a3;
  v14 = a7;
  v15 = (void *)objc_opt_new();
  v16 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __111__WFCloudKitItemRequest_updateItems_setNilValues_qualityOfService_timeoutIntervalForRequest_completionHandler___block_invoke;
  v35[3] = &unk_1E7AF1F90;
  v35[4] = self;
  v35[5] = a2;
  objc_msgSend(v13, "if_map:", v35);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitItemRequest container](self, "container");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v16;
  v26[1] = 3221225472;
  v26[2] = __111__WFCloudKitItemRequest_updateItems_setNilValues_qualityOfService_timeoutIntervalForRequest_completionHandler___block_invoke_2;
  v26[3] = &unk_1E7AF2030;
  v31 = v14;
  v32 = a5;
  v27 = v17;
  v28 = self;
  v33 = a6;
  v19 = v15;
  v29 = v19;
  v30 = v13;
  v34 = a4;
  v20 = v13;
  v21 = v17;
  v22 = v14;
  objc_msgSend(v18, "accountStatusWithCompletionHandler:", v26);

  v23 = v30;
  v24 = v19;

  return v24;
}

- (id)deleteItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  WFCloudKitItemRequest *v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = objc_alloc(MEMORY[0x1E0C94F10]);
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithRecordsToSave:recordIDsToDelete:", 0, v11);

  -[WFCloudKitItemRequest xpcActivity](self, "xpcActivity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setXpcActivity:", v13);

  objc_msgSend(v8, "setCloudOperation:", v12);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __54__WFCloudKitItemRequest_deleteItem_completionHandler___block_invoke;
  v20[3] = &unk_1E7AF32A8;
  v15 = v8;
  v22 = self;
  v23 = v6;
  v21 = v15;
  v16 = v6;
  objc_msgSend(v12, "setModifyRecordsCompletionBlock:", v20);
  -[WFCloudKitItemRequest database](self, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addOperation:", v12);

  v18 = v15;
  return v18;
}

- (id)createTaskCancelledError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFCloudKitErrorDomain"), 0, 0);
}

- (id)fetchRecordIDs:(id)a3 desiredKeys:(id)a4 operationGroup:(id)a5 completionHandler:(id)a6
{
  id v10;
  __CFString *v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  _BOOL4 v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *);
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (__CFString *)a4;
  v12 = a5;
  v13 = a6;
  getWFCloudKitLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = objc_msgSend(v10, "count");
    v16 = -[WFCloudKitItemRequest performExpensiveFetchOperations](self, "performExpensiveFetchOperations");
    v32 = "-[WFCloudKitItemRequest fetchRecordIDs:desiredKeys:operationGroup:completionHandler:]";
    v17 = CFSTR("all");
    *(_DWORD *)buf = 136315650;
    if (!v16)
      v17 = v11;
    v33 = 2048;
    v34 = v15;
    v35 = 2112;
    v36 = v17;
    _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_INFO, "%s Fetching %lu records by ID. Desired keys: %@", buf, 0x20u);
  }

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94E18]), "initWithRecordIDs:", v10);
  if (!-[WFCloudKitItemRequest performExpensiveFetchOperations](self, "performExpensiveFetchOperations"))
    objc_msgSend(v18, "setDesiredKeys:", v11);
  objc_msgSend(v18, "setGroup:", v12);
  -[WFCloudKitItemRequest xpcActivity](self, "xpcActivity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setXpcActivity:", v19);

  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __85__WFCloudKitItemRequest_fetchRecordIDs_desiredKeys_operationGroup_completionHandler___block_invoke;
  v28 = &unk_1E7AF2058;
  v29 = v10;
  v30 = v13;
  v21 = v13;
  v22 = v10;
  objc_msgSend(v18, "setFetchRecordsCompletionBlock:", &v25);
  -[WFCloudKitItemRequest database](self, "database", v25, v26, v27, v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addOperation:", v18);

  return v18;
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setPerformExpensiveFetchOperations:(BOOL)a3
{
  self->_performExpensiveFetchOperations = a3;
}

- (void)setXpcActivity:(id)a3
{
  objc_storeStrong((id *)&self->_xpcActivity, a3);
}

void __85__WFCloudKitItemRequest_fetchRecordIDs_desiredKeys_operationGroup_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  getWFCloudKitLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "count");
    v9 = 136315394;
    v10 = "-[WFCloudKitItemRequest fetchRecordIDs:desiredKeys:operationGroup:completionHandler:]_block_invoke";
    v11 = 2048;
    v12 = v8;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_INFO, "%s Fetching %lu records by ID completed", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __54__WFCloudKitItemRequest_deleteItem_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a4;
  v5 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  v6 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "createTaskCancelledError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
  else
  {
    (*(void (**)(_QWORD, id))(v6 + 16))(*(_QWORD *)(a1 + 48), v8);
  }

}

id __111__WFCloudKitItemRequest_updateItems_setNilValues_qualityOfService_timeoutIntervalForRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(v3, "conformsToProtocol:", &unk_1EF72DF08) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("WFCloudKitItemRequest.m"), 293, CFSTR("Item must conform to WFCloudKitItem protocol: %@"), v3);

  }
  objc_msgSend((id)objc_opt_class(), "createRecordFromItem:zoneID:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __111__WFCloudKitItemRequest_updateItems_setNilValues_qualityOfService_timeoutIntervalForRequest_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  intptr_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (a2 != 1)
  {
    WFLocalizedString(CFSTR("In order to do this, you must be signed into iCloud."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("WFCloudKitErrorDomain"), 2, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_6;
  }
  v3 = *(_QWORD *)(a1 + 72);
  if ((unint64_t)(v3 + 1) > 0x22)
    goto LABEL_9;
  if (((1 << (v3 + 1)) & 0x404040400) == 0)
  {
    if (v3 == -1)
    {
      v3 = 21;
      goto LABEL_4;
    }
LABEL_9:
    v3 = 0;
  }
LABEL_4:
  dispatch_get_global_queue(v3, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__WFCloudKitItemRequest_updateItems_setNilValues_qualityOfService_timeoutIntervalForRequest_completionHandler___block_invoke_3;
  block[3] = &unk_1E7AF2008;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v13 = v5;
  v14 = v6;
  v18 = *(_QWORD *)(a1 + 72);
  v19 = *(_QWORD *)(a1 + 80);
  v15 = v7;
  v17 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 56);
  v20 = *(_BYTE *)(a1 + 88);
  dispatch_async(v4, block);

  v8 = v13;
LABEL_6:

}

void __111__WFCloudKitItemRequest_updateItems_setNilValues_qualityOfService_timeoutIntervalForRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  char v14;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(v2, "setSavePolicy:", 2);
  objc_msgSend(*(id *)(a1 + 40), "xpcActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setXpcActivity:", v3);

  if (*(_QWORD *)(a1 + 72) != -1 || *(double *)(a1 + 80) != 0.0)
  {
    objc_msgSend(v2, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setQualityOfService:", *(_QWORD *)(a1 + 72));
    objc_msgSend(v5, "setTimeoutIntervalForRequest:", *(double *)(a1 + 80));

  }
  objc_msgSend(*(id *)(a1 + 48), "setCloudOperation:", v2);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __111__WFCloudKitItemRequest_updateItems_setNilValues_qualityOfService_timeoutIntervalForRequest_completionHandler___block_invoke_4;
  v9[3] = &unk_1E7AF1FE0;
  v10 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 40);
  v13 = v6;
  v11 = v7;
  v12 = *(id *)(a1 + 56);
  v14 = *(_BYTE *)(a1 + 88);
  objc_msgSend(v2, "setModifyRecordsCompletionBlock:", v9);
  objc_msgSend(*(id *)(a1 + 40), "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v2);

}

void __111__WFCloudKitItemRequest_updateItems_setNilValues_qualityOfService_timeoutIntervalForRequest_completionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t);
  void *v15;
  id v16;
  char v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v8 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "createTaskCancelledError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  }
  else if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __111__WFCloudKitItemRequest_updateItems_setNilValues_qualityOfService_timeoutIntervalForRequest_completionHandler___block_invoke_5;
    v15 = &unk_1E7AF1FB8;
    v16 = *(id *)(a1 + 48);
    v17 = *(_BYTE *)(a1 + 64);
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v12);
    getWFCloudKitLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(v6, "count", v12, v13, v14, v15);
      *(_DWORD *)buf = 136315394;
      v19 = "-[WFCloudKitItemRequest updateItems:setNilValues:qualityOfService:timeoutIntervalForRequest:completionHandle"
            "r:]_block_invoke_4";
      v20 = 2048;
      v21 = v11;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_INFO, "%s Updated %lu items", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __111__WFCloudKitItemRequest_updateItems_setNilValues_qualityOfService_timeoutIntervalForRequest_completionHandler___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[WFCloudKitItemRequest hydrateItem:withRecord:setNilValues:](WFCloudKitItemRequest, "hydrateItem:withRecord:setNilValues:", v7, v6, *(unsigned __int8 *)(a1 + 40));

}

void __89__WFCloudKitItemRequest_fetchItemWithID_itemType_groupName_properties_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  WFCloudKitItemRecord *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  WFCloudKitItemRecord *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  WFCloudKitItemRecord *v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(a1[4], "isCancelled"))
  {
    v7 = (void (**)(id, _QWORD, void *))a1[8];
    objc_msgSend(a1[5], "createTaskCancelledError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v8);

  }
  else
  {
    objc_msgSend(v5, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "recordType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[9], "recordType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if ((v13 & 1) != 0)
      {
        v14 = objc_alloc_init((Class)a1[9]);
        v15 = -[WFCloudKitItemRecord initWithRecord:item:]([WFCloudKitItemRecord alloc], "initWithRecord:item:", v10, v14);
        objc_msgSend(a1[5], "operationWaitingQueue");
        v16 = objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __89__WFCloudKitItemRequest_fetchItemWithID_itemType_groupName_properties_completionHandler___block_invoke_220;
        v26[3] = &unk_1E7AF1F18;
        v17 = a1[4];
        v18 = a1[5];
        v27 = v17;
        v28 = v18;
        v29 = v15;
        v30 = a1[7];
        v19 = a1[8];
        v31 = v14;
        v32 = v19;
        v20 = v14;
        v21 = v15;
        dispatch_async(v16, v26);

      }
      else
      {
        getWFCloudKitLogObject();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(a1[6], "recordName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "recordType");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[9], "recordType");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v34 = "-[WFCloudKitItemRequest fetchItemWithID:itemType:groupName:properties:completionHandler:]_block_invoke";
          v35 = 2114;
          v36 = v23;
          v37 = 2114;
          v38 = v24;
          v39 = 2114;
          v40 = v25;
          _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_FAULT, "%s Record with identifier %{public}@ is type %{public}@, instead of %{public}@", buf, 0x2Au);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFCloudKitErrorDomain"), 1, 0);
        v21 = (WFCloudKitItemRecord *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(void))a1[8] + 2))();
      }

    }
    else
    {
      (*((void (**)(void))a1[8] + 2))();
    }

  }
}

void __89__WFCloudKitItemRequest_fetchItemWithID_itemType_groupName_properties_completionHandler___block_invoke_220(uint64_t a1)
{
  void *v2;
  WFCloudKitResolveReferencesOperation *v3;
  uint64_t v4;
  void *v5;
  WFCloudKitResolveReferencesOperation *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [WFCloudKitResolveReferencesOperation alloc];
  v4 = *(_QWORD *)(a1 + 40);
  v16[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFCloudKitResolveReferencesOperation initWithRequest:records:operationGroup:task:](v3, "initWithRequest:records:operationGroup:task:", v4, v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "addOperation:", v6);

  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "waitUntilAllOperationsAreFinished");

  objc_msgSend(*(id *)(a1 + 40), "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__WFCloudKitItemRequest_fetchItemWithID_itemType_groupName_properties_completionHandler___block_invoke_2;
  v11[3] = &unk_1E7AF8F70;
  v12 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 72);
  v10 = *(_QWORD *)(a1 + 40);
  v15 = v9;
  v13 = v10;
  v14 = *(id *)(a1 + 64);
  dispatch_async(v8, v11);

}

void __89__WFCloudKitItemRequest_fetchItemWithID_itemType_groupName_properties_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v2 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "createTaskCancelledError");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    getWFCloudKitLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "error");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v12 = "-[WFCloudKitItemRequest fetchItemWithID:itemType:groupName:properties:completionHandler:]_block_invoke_2";
        v13 = 2114;
        v14 = v6;
        _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_ERROR, "%s Record fetch and resolve operations encountered error: %{public}@", buf, 0x16u);

      }
      v7 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 32), "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v9 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 136315394;
        v12 = "-[WFCloudKitItemRequest fetchItemWithID:itemType:groupName:properties:completionHandler:]_block_invoke";
        v13 = 2112;
        v14 = v9;
        _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_INFO, "%s Record fetch and resolve operations completed. Item: %@", buf, 0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }
}

void __143__WFCloudKitItemRequest_fetchItemsWithPredicate_itemType_groupName_properties_sortDescriptors_resultsLimit_qualityOfService_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  WFCloudKitItemRecord *v5;
  id v6;

  v3 = *(objc_class **)(a1 + 48);
  v4 = a2;
  v6 = objc_alloc_init(v3);
  v5 = -[WFCloudKitItemRecord initWithRecord:item:]([WFCloudKitItemRecord alloc], "initWithRecord:item:", v4, v6);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void __143__WFCloudKitItemRequest_fetchItemsWithPredicate_itemType_groupName_properties_sortDescriptors_resultsLimit_qualityOfService_completionHandler___block_invoke_210(uint64_t a1)
{
  void *v2;
  WFCloudKitResolveReferencesOperation *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[WFCloudKitResolveReferencesOperation initWithRequest:records:operationGroup:task:]([WFCloudKitResolveReferencesOperation alloc], "initWithRequest:records:operationGroup:task:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "addOperation:", v3);

  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "waitUntilAllOperationsAreFinished");

  objc_msgSend(*(id *)(a1 + 40), "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __143__WFCloudKitItemRequest_fetchItemsWithPredicate_itemType_groupName_properties_sortDescriptors_resultsLimit_qualityOfService_completionHandler___block_invoke_2_212;
  v8[3] = &unk_1E7AF8F70;
  v9 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 40);
  v12 = v6;
  v10 = v7;
  v11 = *(id *)(a1 + 64);
  dispatch_async(v5, v8);

}

void __143__WFCloudKitItemRequest_fetchItemsWithPredicate_itemType_groupName_properties_sortDescriptors_resultsLimit_qualityOfService_completionHandler___block_invoke_2_212(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v2 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "createTaskCancelledError");
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = (id)v3;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 16))(v2, 0, v3);

    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = *(_QWORD *)(a1 + 56);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), 0);
}

+ (void)hydrateItem:(id)a3 withRecord:(id)a4 setNilValues:(BOOL)a5
{
  objc_msgSend(a1, "hydrateItem:withRecord:resolvedReferences:setNilValues:", a3, a4, 0, a5);
}

+ (id)systemFieldsDataFromRecord:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CB36F8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v6, "encodeSystemFieldsWithCoder:", v7);

  objc_msgSend(v7, "finishEncoding");
  objc_msgSend(v7, "encodedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    getWFCloudKitLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "+[WFCloudKitItemRequest systemFieldsDataFromRecord:error:]";
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to encode system fields data from record: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }

  return v8;
}

+ (id)recordFromSystemFieldsData:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CB3710];
  v6 = a3;
  v12 = 0;
  v7 = (void *)objc_msgSend([v5 alloc], "initForReadingFromData:error:", v6, &v12);

  v8 = v12;
  objc_msgSend(v7, "setRequiresSecureCoding:", 1);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithCoder:", v7);
  objc_msgSend(v7, "finishDecoding");
  if (!v9)
  {
    getWFCloudKitLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "+[WFCloudKitItemRequest recordFromSystemFieldsData:error:]";
      v15 = 2114;
      v16 = v8;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to decode record from system fields data: %{public}@", buf, 0x16u);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  return v9;
}

+ (void)hydrateItem:(id)a3 withRecord:(id)a4 resolvedReferences:(id)a5 setNilValues:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend((id)objc_opt_class(), "properties");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v13, CFSTR("identifier"));

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "creationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "modificationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "creatorUserRecordID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recordName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCreatedAt:modifiedAt:createdBy:", v14, v15, v17);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[WFCloudKitItemRequest systemFieldsDataFromRecord:error:](WFCloudKitItemRequest, "systemFieldsDataFromRecord:error:", v11, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRecordSystemFieldsData:", v18);

  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __80__WFCloudKitItemRequest_hydrateItem_withRecord_resolvedReferences_setNilValues___block_invoke;
  v23[3] = &unk_1E7AF20A8;
  v28 = a6;
  v24 = v11;
  v25 = v10;
  v26 = v12;
  v27 = a1;
  v19 = v12;
  v20 = v10;
  v21 = v11;
  objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v23);

}

+ (void)assignRecordValue:(id)a3 toItem:(id)a4 withProperty:(id)a5 resolvedReferences:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __82__WFCloudKitItemRequest_assignRecordValue_toItem_withProperty_resolvedReferences___block_invoke;
    v19[3] = &unk_1E7AF20D0;
    v23 = a1;
    v20 = v10;
    v21 = v11;
    v22 = v12;
    objc_msgSend(v13, "if_compactMap:", v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(a1, "itemValueForRecordValue:item:property:resolvedReferences:", v13, v10, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
LABEL_5:
    v15 = v10;
    objc_msgSend(v11, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "willChangeValueForKey:", v16);

    objc_msgSend(v11, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKey:", v14, v17);

    objc_msgSend(v11, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "didChangeValueForKey:", v18);

  }
LABEL_6:

}

+ (id)createRecordIDWithName:(id)a3 zoneID:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C95070];
  v7 = a3;
  v8 = [v6 alloc];
  if (v5)
    v9 = objc_msgSend(v8, "initWithRecordName:zoneID:", v7, v5);
  else
    v9 = objc_msgSend(v8, "initWithRecordName:", v7);
  v10 = (void *)v9;

  return v10;
}

+ (id)createRecordFromItem:(id)a3 zoneID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_class();
  objc_msgSend(v8, "recordType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = (id)objc_msgSend(v6, "ensureFileAssets");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "recordSystemFieldsData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "recordSystemFieldsData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFCloudKitItemRequest recordFromSystemFieldsData:error:](WFCloudKitItemRequest, "recordFromSystemFieldsData:error:", v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v14, "recordID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_16;
        getWFCloudKitLogObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v6, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "recordID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v38 = "+[WFCloudKitItemRequest createRecordFromItem:zoneID:]";
          v39 = 2114;
          v40 = v19;
          v41 = 2114;
          v42 = v20;
          _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_FAULT, "%s CKRecord created from serialized data has different identifier than the WFCloudKitItem it was created for: WFCloudKitItem's is %{public}@, CKRecord's is %{public}@. Creating CKRecord from scratch", buf, 0x20u);

        }
      }
    }
  }
  objc_msgSend(v6, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_alloc(MEMORY[0x1E0C95048]);
    objc_msgSend(v6, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v22, "initWithRecordType:recordID:", v9, v23);

  }
  else
  {
    v24 = objc_alloc(MEMORY[0x1E0C95048]);
    if (v7)
      v25 = objc_msgSend(v24, "initWithRecordType:zoneID:", v9, v7);
    else
      v25 = objc_msgSend(v24, "initWithRecordType:", v9);
    v14 = (void *)v25;
  }
LABEL_16:
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __53__WFCloudKitItemRequest_createRecordFromItem_zoneID___block_invoke;
  v32[3] = &unk_1E7AF2120;
  v36 = a1;
  v33 = v6;
  v34 = v7;
  v26 = v14;
  v35 = v26;
  v27 = v7;
  v28 = v6;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v32);
  v29 = v35;
  v30 = v26;

  return v30;
}

+ (id)itemValueForRecordValue:(id)a3 item:(id)a4 property:(id)a5 resolvedReferences:(id)a6
{
  void *v6;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  switch(objc_msgSend(v10, "type"))
  {
    case 0:
      if (v9)
        goto LABEL_3;
      objc_msgSend(v10, "nilValue");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 1:
LABEL_3:
      v12 = v9;
LABEL_14:
      v6 = v12;
      break;
    case 2:
      v13 = objc_opt_class();
      WFEnforceClass(v9, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14)
        goto LABEL_11;
      v16 = (void *)MEMORY[0x1E0D13F78];
      objc_msgSend(v14, "fileURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fileType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fileWithURL:options:ofType:", v17, 5, v18);
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      v20 = objc_opt_class();
      WFEnforceClass(v9, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v21;
      if (!v21)
        goto LABEL_11;
      objc_msgSend(v21, "recordID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "item");
      v19 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v6 = (void *)v19;

      goto LABEL_12;
    case 4:
      v22 = objc_opt_class();
      WFEnforceClass(v9, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v23;
      if (v23)
      {
        objc_msgSend(v23, "recordID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_11:
        v6 = 0;
      }
LABEL_12:

      break;
    default:
      break;
  }

  return v6;
}

+ (id)recordValueForItemValue:(id)a3 item:(id)a4 property:(id)a5 recordKey:(id)a6 zoneID:(id)a7
{
  id v7;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  switch(objc_msgSend(a5, "type"))
  {
    case 0:
    case 1:
      v7 = v11;
      break;
    case 2:
      v14 = objc_opt_class();
      WFEnforceClass(v11, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
        goto LABEL_12;
      v16 = objc_alloc(MEMORY[0x1E0C94BB8]);
      objc_msgSend(v15, "fileURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v16, "initWithFileURL:", v17);

      goto LABEL_17;
    case 3:
      v18 = v11;
      v15 = v18;
      if (!v18 || !objc_msgSend(v18, "conformsToProtocol:", &unk_1EF72DF08))
        goto LABEL_12;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v19 = objc_msgSend(v12, "referenceActionForKey:", v13);
      else
        v19 = 0;
      v22 = objc_alloc(MEMORY[0x1E0C950C0]);
      objc_msgSend(v15, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v22, "initWithRecordID:action:", v23, v19);

      goto LABEL_17;
    case 4:
      v20 = objc_opt_class();
      WFEnforceClass(v11, v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v21 = objc_msgSend(v12, "referenceActionForKey:", v13);
        else
          v21 = 0;
        v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecordID:action:", v15, v21);
      }
      else
      {
LABEL_12:
        v7 = 0;
      }
LABEL_17:

      break;
    default:
      break;
  }

  return v7;
}

void __53__WFCloudKitItemRequest_createRecordFromItem_zoneID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "hasConstantValue"))
  {
    objc_msgSend(v6, "constantValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__WFCloudKitItemRequest_createRecordFromItem_zoneID___block_invoke_2;
    v14[3] = &unk_1E7AF20F8;
    v19 = *(_QWORD *)(a1 + 56);
    v15 = *(id *)(a1 + 32);
    v16 = v6;
    v17 = v5;
    v18 = *(id *)(a1 + 40);
    objc_msgSend(v7, "if_compactMap:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v7)
  {
    objc_msgSend(*(id *)(a1 + 56), "recordValueForItemValue:item:property:recordKey:zoneID:", v7, *(_QWORD *)(a1 + 32), v6, v5, *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v11 = objc_msgSend(v6, "isEncrypted");
  v12 = *(void **)(a1 + 48);
  if (v11)
  {
    objc_msgSend(v12, "encryptedValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v10, v5);

  }
  else
  {
    objc_msgSend(v12, "setObject:forKey:", v10, v5);
  }

}

uint64_t __53__WFCloudKitItemRequest_createRecordFromItem_zoneID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 64), "recordValueForItemValue:item:property:recordKey:zoneID:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __82__WFCloudKitItemRequest_assignRecordValue_toItem_withProperty_resolvedReferences___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 56), "itemValueForRecordValue:item:property:resolvedReferences:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __80__WFCloudKitItemRequest_hydrateItem_withRecord_resolvedReferences_setNilValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "isEncrypted");
  v7 = *(void **)(a1 + 32);
  if (!v6)
  {
    objc_msgSend(v7, "objectForKey:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_5;
LABEL_6:
    objc_msgSend(*(id *)(a1 + 56), "assignRecordValue:toItem:withProperty:resolvedReferences:", v9, *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 48));
    goto LABEL_7;
  }
  objc_msgSend(v7, "encryptedValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_6;
LABEL_5:
  if (*(_BYTE *)(a1 + 64))
    goto LABEL_6;
LABEL_7:

}

@end
