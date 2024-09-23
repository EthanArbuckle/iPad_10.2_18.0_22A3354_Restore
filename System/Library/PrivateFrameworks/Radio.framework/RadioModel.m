@implementation RadioModel

- (RadioModel)init
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("RadioModelUnsupportedException"), CFSTR("-init is not supported, use +sharedModel or +backgroundModel"));

  return 0;
}

- (id)_init
{
  RadioModel *v2;
  RadioModel *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RadioModel;
  v2 = -[RadioModel init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[RadioModel _defaultRadioModelInitialization](v2, "_defaultRadioModelInitialization");
    -[RadioModel _prepareModel](v3, "_prepareModel");
  }
  return v3;
}

- (id)_initBackgroundModelWithPersistentStoreCoordinator:(id)a3
{
  id v5;
  RadioModel *v6;
  RadioModel *v7;
  uint64_t v8;
  NSManagedObjectModel *model;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RadioModel;
  v6 = -[RadioModel init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    -[RadioModel _defaultRadioModelInitialization](v6, "_defaultRadioModelInitialization");
    v7->_isBackgroundModel = 1;
    objc_storeStrong((id *)&v7->_storeCoordinator, a3);
    -[NSPersistentStoreCoordinator managedObjectModel](v7->_storeCoordinator, "managedObjectModel");
    v8 = objc_claimAutoreleasedReturnValue();
    model = v7->_model;
    v7->_model = (NSManagedObjectModel *)v8;

    -[RadioModel _prepareModel](v7, "_prepareModel");
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  NSObject *backgroundTaskInvalidateTimerSource;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDBB458], 0);
  -[NSOperationQueue cancelAllOperations](self->_backgroundCleanupQueue, "cancelAllOperations");
  backgroundTaskInvalidateTimerSource = self->_backgroundTaskInvalidateTimerSource;
  if (backgroundTaskInvalidateTimerSource)
    dispatch_source_cancel(backgroundTaskInvalidateTimerSource);
  -[BKSProcessAssertion invalidate](self->_backgroundProcessAssertion, "invalidate");
  if (self->_modelChangedTokenIsValid)
    notify_cancel(self->_modelChangedToken);
  if (self->_modelDeletedTokenIsValid)
    notify_cancel(self->_modelDeletedToken);
  -[NSFetchedResultsController setDelegate:](self->_stationFetchedResultsController, "setDelegate:", 0);

  v5.receiver = self;
  v5.super_class = (Class)RadioModel;
  -[RadioModel dealloc](&v5, sel_dealloc);
}

- (void)_contextDidSaveNotification:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  void *v6;
  int v7;
  NSManagedObjectContext *context;
  id *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (NSManagedObjectContext *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObjectContext persistentStoreCoordinator](v5, "persistentStoreCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", self->_storeCoordinator);

  if (v7)
  {
    context = self->_context;
    if (v5 == context)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __42__RadioModel__contextDidSaveNotification___block_invoke_3;
      v10[3] = &unk_24CA2E640;
      v10[4] = self;
      v9 = &v11;
      v11 = v4;
      dispatch_async(MEMORY[0x24BDAC9B8], v10);
    }
    else
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __42__RadioModel__contextDidSaveNotification___block_invoke;
      v12[3] = &unk_24CA2E640;
      v12[4] = self;
      v9 = &v13;
      v13 = v4;
      -[NSManagedObjectContext performBlock:](context, "performBlock:", v12);
    }

  }
}

- (NSArray)allStations
{
  NSManagedObjectContext *context;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__94;
  v10 = __Block_byref_object_dispose__95;
  v11 = 0;
  context = self->_context;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __25__RadioModel_allStations__block_invoke;
  v5[3] = &unk_24CA2EB50;
  v5[4] = self;
  v5[5] = &v6;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (unint64_t)authenticatedAccountIdentifier
{
  void *v2;
  unint64_t v3;

  -[RadioModel _databasePropertyValueForKey:](self, "_databasePropertyValueForKey:", CFSTR("accountIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (id)convertObject:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  RadioModel *v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[4];
  id v34;
  RadioModel *v35;
  uint64_t *v36;
  uint64_t v37;
  id *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v5 = a3;
  v37 = 0;
  v38 = (id *)&v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__94;
  v41 = __Block_byref_object_dispose__95;
  v42 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && !objc_msgSend(v6, "isEqual:", self->_context))
    {
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __28__RadioModel_convertObject___block_invoke;
      v33[3] = &unk_24CA2E2A8;
      v35 = self;
      v36 = &v37;
      v34 = v5;
      -[RadioModel performTransactionWithBlock:](self, "performTransactionWithBlock:", v33);
      v10 = v34;
    }
    else
    {
      v8 = v38;
      v9 = v5;
      v10 = v8[5];
      v8[5] = v9;
    }

  }
  else if (objc_msgSend(v5, "conformsToProtocol:", &unk_254A70410))
  {
    if ((objc_msgSend(v5, "isDatabaseBacked") & 1) != 0)
    {
      v27 = 0;
      v28 = &v27;
      v29 = 0x3032000000;
      v30 = __Block_byref_object_copy__94;
      v31 = __Block_byref_object_dispose__95;
      v32 = 0;
      objc_msgSend(v5, "managedObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "managedObjectContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", self->_context);

        if (v14)
        {
          objc_storeStrong(v38 + 5, a3);
        }
        else
        {
          v20 = MEMORY[0x24BDAC760];
          v21 = 3221225472;
          v22 = __28__RadioModel_convertObject___block_invoke_2;
          v23 = &unk_24CA2E2A8;
          v26 = &v27;
          v24 = self;
          v25 = v12;
          -[RadioModel performTransactionWithBlock:](self, "performTransactionWithBlock:", &v20);
          if (v28[5])
          {
            v17 = objc_alloc((Class)objc_opt_class());
            v18 = objc_msgSend(v17, "initWithModel:managedObject:", self, v28[5], v20, v21, v22, v23, v24);
            v19 = v38[5];
            v38[5] = (id)v18;

          }
        }
      }

      _Block_object_dispose(&v27, 8);
    }
    else
    {
      objc_storeStrong(v38 + 5, a3);
    }
  }
  v15 = v38[5];
  _Block_object_dispose(&v37, 8);

  return v15;
}

- (id)convertObjects:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        -[RadioModel convertObject:](self, "convertObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if (!v7)
            v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v7, "addObject:", v10);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)convertObjectsInSet:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        -[RadioModel convertObject:](self, "convertObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if (!v7)
            v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          objc_msgSend(v7, "addObject:", v10);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)deleteAllData
{
  objc_msgSend((id)objc_opt_class(), "deleteAllData");
}

- (void)deleteStationWithID:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __34__RadioModel_deleteStationWithID___block_invoke;
  v3[3] = &unk_24CA2E538;
  v3[4] = self;
  v3[5] = a3;
  -[RadioModel performWriteTransactionWithBlock:](self, "performWriteTransactionWithBlock:", v3);
}

- (void)deleteStation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = os_log_create("com.apple.amp.radio", "Model");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_2105F8000, v5, OS_LOG_TYPE_INFO, "[RadioModel] Deleting station: %@", buf, 0xCu);
    }

    objc_msgSend(v4, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __28__RadioModel_deleteStation___block_invoke;
    v7[3] = &unk_24CA2E640;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v6, "performWriteTransactionWithBlock:", v7);

  }
}

- (NSArray)featuredStations
{
  NSManagedObjectContext *context;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__94;
  v10 = __Block_byref_object_dispose__95;
  v11 = 0;
  context = self->_context;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__RadioModel_featuredStations__block_invoke;
  v5[3] = &unk_24CA2EB50;
  v5[4] = self;
  v5[5] = &v6;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSString)globalHash
{
  void *v2;
  void *v3;

  -[RadioModel _databasePropertyValueForKey:](self, "_databasePropertyValueForKey:", CFSTR("globalHash"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (unint64_t)globalVersion
{
  void *v2;
  unint64_t v3;

  -[RadioModel _databasePropertyValueForKey:](self, "_databasePropertyValueForKey:", CFSTR("globalVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (id)newFeaturedStationWithDictionary:(id)a3
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
  v14 = __Block_byref_object_copy__94;
  v15 = __Block_byref_object_dispose__95;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__RadioModel_newFeaturedStationWithDictionary___block_invoke;
  v8[3] = &unk_24CA2E2A8;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[RadioModel performWriteTransactionWithBlock:](self, "performWriteTransactionWithBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)newPreviewStationWithDictionary:(id)a3
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
  v14 = __Block_byref_object_copy__94;
  v15 = __Block_byref_object_dispose__95;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__RadioModel_newPreviewStationWithDictionary___block_invoke;
  v8[3] = &unk_24CA2E2A8;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[RadioModel performWriteTransactionWithBlock:](self, "performWriteTransactionWithBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)newStationWithDictionary:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  char v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  char v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v49;
  id v50;
  id v51;
  char v52;
  char v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  char v58;
  char v59;
  uint64_t v60;
  char v61;
  char v62;
  char v63;
  char v64;
  char v65;
  int v66;
  char v67;
  char v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  char isKindOfClass;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  id v99;
  void *v100;
  id v101;
  id v103;
  void *v104;
  uint64_t v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  _QWORD v110[5];
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  __int128 *p_buf;
  uint64_t v128;
  uint64_t v129;
  double v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  int v134;
  int v135;
  char v136;
  char v137;
  char v138;
  char v139;
  char v140;
  char v141;
  char v142;
  char v143;
  char v144;
  char v145;
  char v146;
  char v147;
  char v148;
  char v149;
  char v150;
  char v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  uint64_t v156;
  __int128 buf;
  uint64_t v158;
  uint64_t (*v159)(uint64_t, uint64_t);
  void (*v160)(uint64_t);
  id v161;
  _BYTE v162[128];
  uint64_t v163;

  v163 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = os_log_create("com.apple.amp.radio", "Model");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_2105F8000, v4, OS_LOG_TYPE_INFO, "[RadioModel] Adding/updating station with dictionary: %@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v3, "objectForKey:", CFSTR("station-id"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v105 = objc_msgSend(v107, "longLongValue");
  else
    v105 = 0;
  objc_msgSend(v3, "objectForKey:", CFSTR("station-hash"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v108 = 0;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("radio-station-id"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v109 = 0;
  }
  if (!v105 && !v108 && !v109)
  {
    v5 = os_log_create("com.apple.amp.radio", "Model");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_2105F8000, v5, OS_LOG_TYPE_ERROR, "Missing station-id/station-hash/radio-station-id in dictionary: %@", (uint8_t *)&buf, 0xCu);
    }

    v6 = 0;
    goto LABEL_145;
  }
  v156 = 0;
  objc_msgSend(v3, "objectForKey:", CFSTR("persistent-id"));
  v92 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    sscanf((const char *)objc_msgSend(objc_retainAutorelease(v92), "UTF8String"), "%llx", &v156);
  objc_msgSend(v3, "objectForKey:", CFSTR("adam-id"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v71 = objc_msgSend(v91, "longLongValue");
  else
    v71 = 0;
  objc_msgSend(v3, "objectForKey:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = (void *)objc_msgSend(v7, "copy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v100 = 0;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("description"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = (void *)objc_msgSend(v8, "copy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v98 = 0;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("core-seed-name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = (void *)objc_msgSend(v9, "copy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v96 = 0;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("seeds"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v95 = 0;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("mix-type"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = (int)objc_msgSend(v90, "intValue");
  else
    v10 = 1;
  v70 = v10;
  objc_msgSend(v3, "objectForKey:", CFSTR("skip-identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)objc_msgSend(v11, "copy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v94 = 0;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("rules"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v104, "objectForKey:", CFSTR("edit-enabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v69 = objc_msgSend(v12, "BOOLValue");
    else
      v69 = 1;
    objc_msgSend(v104, "objectForKey:", CFSTR("edit-fields"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v154 = 0u;
      v155 = 0u;
      v152 = 0u;
      v153 = 0u;
      v14 = (void *)objc_msgSend(v93, "copy");
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v152, v162, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v153;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v153 != v16)
              objc_enumerationMutation(v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              goto LABEL_51;
            }
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v152, v162, 16);
          if (v15)
            continue;
          break;
        }
      }
    }
    else
    {
      v14 = v93;
LABEL_51:
      v93 = 0;
    }

    objc_msgSend(v104, "objectForKey:", CFSTR("like-enabled"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v68 = objc_msgSend(v18, "BOOLValue");
    else
      v68 = 0;
    objc_msgSend(v104, "objectForKey:", CFSTR("skip-enabled"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v67 = objc_msgSend(v19, "BOOLValue");
    else
      v67 = 1;
    objc_msgSend(v104, "objectForKey:", CFSTR("skip-rules"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v20, "objectForKey:", CFSTR("interval-in-seconds"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0.0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (double)(int)objc_msgSend(v21, "intValue");
      objc_msgSend(v20, "objectForKey:", CFSTR("frequency"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v66 = objc_msgSend(v22, "intValue");
      else
        v66 = 0;

    }
    else
    {
      v66 = 0;
      v13 = 0.0;
    }
    objc_msgSend(v104, "objectForKey:", CFSTR("sharing-enabled"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v65 = objc_msgSend(v23, "BOOLValue");
    else
      v65 = 0;

  }
  else
  {
    isKindOfClass = 0;
    v65 = 0;
    v66 = 0;
    v93 = 0;
    v67 = 1;
    v68 = 0;
    v13 = 0.0;
    v69 = 1;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("artwork"));
  v103 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = 0;
    v24 = v103;
    v103 = 0;
    goto LABEL_74;
  }
  if (v103)
  {
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v103, 200, 0, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = v24;
LABEL_74:

    goto LABEL_75;
  }
  v25 = 0;
  v103 = 0;
LABEL_75:
  objc_msgSend(v3, "objectForKey:", CFSTR("artwork-url"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v89);
    v26 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("virtual-play"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v27 = objc_msgSend(v88, "BOOLValue");
  else
    v27 = 1;
  objc_msgSend(v3, "objectForKey:", CFSTR("ad-data"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v87, 200, 0, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }
  if (!objc_msgSend(v28, "length"))
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("iAd-data"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = v29;
    }
    else
    {

      v28 = 0;
    }
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("is-explicit"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v64 = objc_msgSend(v86, "BOOLValue");
  else
    v64 = 0;
  objc_msgSend(v3, "objectForKey:", CFSTR("is-featured"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v30 = objc_opt_isKindOfClass();
  if ((v30 & 1) != 0)
    v63 = objc_msgSend(v85, "BOOLValue");
  else
    v63 = 0;
  objc_msgSend(v3, "objectForKey:", CFSTR("is-iad-gateway-video-enabled"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v62 = objc_msgSend(v84, "BOOLValue");
  else
    v62 = 0;
  objc_msgSend(v3, "objectForKey:", CFSTR("is-sponsored"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v61 = objc_msgSend(v83, "BOOLValue");
  else
    v61 = 0;
  objc_msgSend(v3, "objectForKey:", CFSTR("impression-threshold"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v60 = objc_msgSend(v82, "unsignedIntegerValue");
  else
    v60 = 0;
  objc_msgSend(v3, "objectForKey:", CFSTR("is-premium-placement"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v59 = objc_msgSend(v81, "BOOLValue");
  else
    v59 = 0;
  objc_msgSend(v3, "objectForKey:", CFSTR("preview-only"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v58 = objc_msgSend(v80, "BOOLValue");
  else
    v58 = 0;
  objc_msgSend(v3, "objectForKey:", CFSTR("requires-subscription"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v57 = objc_msgSend(v79, "BOOLValue");
  else
    v57 = 0;
  objc_msgSend(v3, "objectForKey:", CFSTR("stream-url"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v31);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v56 = 0;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("stream-key-cert-url"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v78);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v55 = 0;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("stream-key-server-url"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v77);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v54 = 0;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("is-shared"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v53 = objc_msgSend(v76, "BOOLValue");
  else
    v53 = 0;
  objc_msgSend(v3, "objectForKey:", CFSTR("is-subscribed"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v52 = objc_msgSend(v75, "BOOLValue");
  else
    v52 = 0;
  objc_msgSend(v3, "objectForKey:", CFSTR("subscriber-count"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v32 = objc_msgSend(v74, "intValue");
  else
    v32 = 0;
  objc_msgSend(v3, "objectForKey:", CFSTR("share-token"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v33 = 0;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("debug-dict"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v34 = 0;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v158 = 0x3032000000;
  v159 = __Block_byref_object_copy__94;
  v160 = __Block_byref_object_dispose__95;
  if (!v105)
  {
    v35 = 0;
    v161 = 0;
LABEL_139:
    if (v156)
    {
      -[RadioModel stationWithPersistentID:](self, "stationWithPersistentID:");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v36;

      v35 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    }
    goto LABEL_141;
  }
  -[RadioModel stationWithID:](self, "stationWithID:");
  v161 = (id)objc_claimAutoreleasedReturnValue();

  v35 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  if (!v35)
    goto LABEL_139;
LABEL_141:
  if (!v35 && v109)
  {
    -[RadioModel stationWithStationStringID:](self, "stationWithStationStringID:", v109);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v38;

  }
  v110[0] = MEMORY[0x24BDAC760];
  v110[1] = 3221225472;
  v110[2] = __39__RadioModel_newStationWithDictionary___block_invoke;
  v110[3] = &unk_24CA2E240;
  p_buf = &buf;
  v110[4] = self;
  v128 = v105;
  v111 = v108;
  v129 = v71;
  v106 = v26;
  v112 = v106;
  v72 = v25;
  v113 = v72;
  v49 = v100;
  v114 = v49;
  v50 = v98;
  v115 = v50;
  v51 = v96;
  v116 = v51;
  v97 = v95;
  v117 = v97;
  v136 = v69;
  v101 = v93;
  v118 = v101;
  v137 = isKindOfClass & 1;
  v138 = v68;
  v139 = v57;
  v140 = v67;
  v134 = v66;
  v99 = v94;
  v119 = v99;
  v130 = v13;
  v141 = v27;
  v131 = v70;
  v40 = v28;
  v41 = v30 & 1;
  v42 = v40;
  v142 = v41;
  v143 = v63;
  v144 = v64;
  v145 = v62;
  v146 = v61;
  v120 = v40;
  v132 = v60;
  v147 = v59;
  v148 = v58;
  v121 = v109;
  v43 = v56;
  v122 = v43;
  v44 = v55;
  v123 = v44;
  v45 = v54;
  v124 = v45;
  v149 = v53;
  v150 = v52;
  v135 = v32;
  v46 = v33;
  v125 = v46;
  v151 = v65;
  v47 = v34;
  v126 = v47;
  v133 = v156;
  -[RadioModel performWriteTransactionWithBlock:](self, "performWriteTransactionWithBlock:", v110);
  v6 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
LABEL_145:

  return v6;
}

- (void)performTransactionWithBlock:(id)a3
{
  -[RadioModel _performTransactionAndSave:withBlock:](self, "_performTransactionAndSave:withBlock:", 0, a3);
}

- (void)performWriteTransactionWithBlock:(id)a3
{
  -[RadioModel _performTransactionAndSave:withBlock:](self, "_performTransactionAndSave:withBlock:", 1, a3);
}

- (NSArray)previewStations
{
  NSManagedObjectContext *context;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__94;
  v10 = __Block_byref_object_dispose__95;
  v11 = 0;
  context = self->_context;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__RadioModel_previewStations__block_invoke;
  v5[3] = &unk_24CA2EB50;
  v5[4] = self;
  v5[5] = &v6;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)reportProblemIssueTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[RadioModel _databasePropertyValueForKey:](self, "_databasePropertyValueForKey:", CFSTR("reportProblemIssueTypes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDD1608];
    objc_msgSend(v2, "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "JSONObjectWithData:options:error:", v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v7 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v7 = 0;
              goto LABEL_14;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v9)
            continue;
          break;
        }
      }
    }
LABEL_14:

  }
  else
  {
    v7 = 0;
  }

  return (NSArray *)v7;
}

- (void)setAuthenticatedAccountIdentifier:(unint64_t)a3
{
  id v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lli"), a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RadioModel _setDatabasePropertyValue:forKey:](self, "_setDatabasePropertyValue:forKey:");
  if (!a3)
    objc_msgSend((id)objc_opt_class(), "_postAccountDidDeauthenticateNotification");

}

- (void)setGlobalHash:(id)a3
{
  -[RadioModel _setDatabasePropertyValue:forKey:](self, "_setDatabasePropertyValue:forKey:", a3, CFSTR("globalHash"));
}

- (void)setGlobalVersion:(unint64_t)a3
{
  id v5;

  if (-[RadioModel globalVersion](self, "globalVersion") != a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lli"), a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[RadioModel _setDatabasePropertyValue:forKey:](self, "_setDatabasePropertyValue:forKey:", v5, CFSTR("globalVersion"));

  }
}

- (void)setReportProblemIssueTypes:(id)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", a3, 0, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4);
    -[RadioModel _setDatabasePropertyValue:forKey:](self, "_setDatabasePropertyValue:forKey:", v4, CFSTR("reportProblemIssueTypes"));

  }
  else
  {
    -[RadioModel _setDatabasePropertyValue:forKey:](self, "_setDatabasePropertyValue:forKey:", 0, CFSTR("reportProblemIssueTypes"));
  }
}

- (void)setStationSortOrdering:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__RadioModel_setStationSortOrdering___block_invoke;
  v9[3] = &unk_24CA2EB28;
  v9[4] = self;
  -[RadioModel performTransactionWithBlock:](self, "performTransactionWithBlock:", v9);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __37__RadioModel_setStationSortOrdering___block_invoke_2;
  v7[3] = &unk_24CA2E640;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[RadioModel performWriteTransactionWithBlock:](self, "performWriteTransactionWithBlock:", v7);

}

- (void)setTrackPlaybackDescriptorQueue:(id)a3 forStation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__RadioModel_setTrackPlaybackDescriptorQueue_forStation___block_invoke;
  v10[3] = &unk_24CA2E640;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "performWriteTransactionWithBlock:", v10);

}

- (NSArray)stationSortOrdering
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[RadioModel userStations](self, "userStations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[RadioModel userStations](self, "userStations", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "stationID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return (NSArray *)v5;
}

- (id)stationWithHash:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v4, CFSTR("stationHash"), 0);
    -[NSManagedObjectModel fetchRequestFromTemplateWithName:substitutionVariables:](self->_model, "fetchRequestFromTemplateWithName:substitutionVariables:", CFSTR("StationHashToStation"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__94;
    v17 = __Block_byref_object_dispose__95;
    v18 = 0;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __30__RadioModel_stationWithHash___block_invoke;
    v10[3] = &unk_24CA2E2A8;
    v10[4] = self;
    v7 = v6;
    v11 = v7;
    v12 = &v13;
    -[RadioModel performTransactionWithBlock:](self, "performTransactionWithBlock:", v10);
    v8 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)stationWithID:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = objc_alloc(MEMORY[0x24BDBCE70]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", v6, CFSTR("stationID"), 0);

  -[NSManagedObjectModel fetchRequestFromTemplateWithName:substitutionVariables:](self->_model, "fetchRequestFromTemplateWithName:substitutionVariables:", CFSTR("StationIDToStation"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__94;
  v19 = __Block_byref_object_dispose__95;
  v20 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __28__RadioModel_stationWithID___block_invoke;
  v12[3] = &unk_24CA2E2A8;
  v12[4] = self;
  v9 = v8;
  v13 = v9;
  v14 = &v15;
  -[RadioModel performTransactionWithBlock:](self, "performTransactionWithBlock:", v12);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (id)stationWithPersistentID:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = objc_alloc_init(MEMORY[0x24BDBB678]);
  -[NSManagedObjectModel entitiesByName](self->_model, "entitiesByName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("Station"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEntity:", v7);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("persistent_id == %lli"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v8);

  +[RadioManagedStation defaultPropertiesToFetch](RadioManagedStation, "defaultPropertiesToFetch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
  v13 = v12;

  if ((objc_msgSend(v13, "containsObject:", CFSTR("persistent_id")) & 1) == 0)
    objc_msgSend(v13, "addObject:", CFSTR("persistent_id"));
  objc_msgSend(v5, "setPropertiesToFetch:", v13);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__94;
  v24 = __Block_byref_object_dispose__95;
  v25 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __38__RadioModel_stationWithPersistentID___block_invoke;
  v17[3] = &unk_24CA2E2A8;
  v17[4] = self;
  v14 = v5;
  v18 = v14;
  v19 = &v20;
  -[RadioModel performTransactionWithBlock:](self, "performTransactionWithBlock:", v17);
  v15 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v15;
}

- (id)stationWithStationStringID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v4, CFSTR("stationStringID"), 0);
    -[NSManagedObjectModel fetchRequestFromTemplateWithName:substitutionVariables:](self->_model, "fetchRequestFromTemplateWithName:substitutionVariables:", CFSTR("StationStringIDToStation"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__94;
    v17 = __Block_byref_object_dispose__95;
    v18 = 0;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __41__RadioModel_stationWithStationStringID___block_invoke;
    v10[3] = &unk_24CA2E2A8;
    v10[4] = self;
    v7 = v6;
    v11 = v7;
    v12 = &v13;
    -[RadioModel performTransactionWithBlock:](self, "performTransactionWithBlock:", v10);
    v8 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSArray)userStations
{
  NSManagedObjectContext *context;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__94;
  v10 = __Block_byref_object_dispose__95;
  v11 = 0;
  context = self->_context;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __26__RadioModel_userStations__block_invoke;
  v5[3] = &unk_24CA2EB50;
  v5[4] = self;
  v5[5] = &v6;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (id)context
{
  return self->_context;
}

- (int64_t)databaseVersion
{
  void *v2;
  int64_t v3;

  -[RadioModel _databasePropertyValueForKey:](self, "_databasePropertyValueForKey:", CFSTR("databaseVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (void)setDatabaseVersion:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lli"), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RadioModel _setDatabasePropertyValue:forKey:](self, "_setDatabasePropertyValue:forKey:", v4, CFSTR("databaseVersion"));

}

- (id)_arrayByReplacingManagedObjectsInArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  RadioStation *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = -[RadioStation initWithModel:managedObject:]([RadioStation alloc], "initWithModel:managedObject:", self, v11);
            objc_msgSend(v5, "addObject:", v12);

          }
          else
          {
            objc_msgSend(v5, "addObject:", v11, (_QWORD)v14);
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_beginBackgroundTaskAssertion
{
  NSObject *accessSerialQueue;
  _QWORD block[5];

  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__RadioModel__beginBackgroundTaskAssertion__block_invoke;
  block[3] = &unk_24CA2EB28;
  block[4] = self;
  dispatch_sync(accessSerialQueue, block);
}

- (void)_defaultRadioModelInitialization
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *accessSerialQueue;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD handler[5];

  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Radio.RadioModel.accessSerialQueue", 0);
  accessSerialQueue = self->_accessSerialQueue;
  self->_accessSerialQueue = v3;

  v5 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __46__RadioModel__defaultRadioModelInitialization__block_invoke;
  handler[3] = &unk_24CA2E318;
  handler[4] = self;
  v6 = MEMORY[0x24BDAC9B8];
  self->_modelChangedTokenIsValid = notify_register_dispatch("com.apple.Radio.model-changed", &self->_modelChangedToken, MEMORY[0x24BDAC9B8], handler) == 0;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __46__RadioModel__defaultRadioModelInitialization__block_invoke_231;
  v8[3] = &unk_24CA2E318;
  v8[4] = self;
  LODWORD(v5) = notify_register_dispatch("com.apple.Radio.model-deleted", &self->_modelDeletedToken, v6, v8);

  self->_modelDeletedTokenIsValid = (_DWORD)v5 == 0;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__contextDidSaveNotification_, *MEMORY[0x24BDBB458], 0);

}

- (unint64_t)_numberOfSkipsUsedWithSkipTimestamps:(id)a3 currentTimestamp:(double)a4 skipInterval:(double)a5 returningEarliestSkipTimestamp:(double *)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  double v16;
  uint64_t v17;
  double v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v10)
  {
    v12 = 0;
    v14 = 1.79769313e308;
    if (!a6)
      goto LABEL_16;
    goto LABEL_13;
  }
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v21;
  v14 = 1.79769313e308;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v21 != v13)
        objc_enumerationMutation(v9);
      objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "doubleValue");
      if (v16 < v14)
        v14 = v16;
      if (a4 - v16 < a5)
        ++v12;
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  }
  while (v11);
  if (a6)
  {
LABEL_13:
    v17 = objc_msgSend(v9, "count");
    v18 = 0.0;
    if (v17)
      v18 = v14;
    *a6 = v18;
  }
LABEL_16:

  return v12;
}

- (void)_createRadioDirectoryAndDatabaseIfNecessary
{
  void *v4;
  uint64_t v5;
  NSManagedObjectModel *v6;
  NSManagedObjectModel *model;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  NSPersistentStoreCoordinator *v35;
  NSPersistentStoreCoordinator *storeCoordinator;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  char v41;
  int v42;
  void *v43;
  int v44;
  NSObject *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  NSPersistentStoreCoordinator *v54;
  void *v55;
  int v56;
  NSObject *v57;
  NSObject *v58;
  const __CFString *v59;
  NSPersistentStoreCoordinator *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  char v68;
  uint8_t buf[4];
  const __CFString *v70;
  __int16 v71;
  NSObject *v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)&__databaseLock);
  if (!self->_storeCoordinator)
  {
    if (!self->_model)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pathForResource:ofType:", CFSTR("Radio"), CFSTR("momd"));
      v5 = objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RadioModel.m"), 1092, CFSTR("unable to find model"));

      }
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v5, 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (NSManagedObjectModel *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6B0]), "initWithContentsOfURL:", v65);
      model = self->_model;
      self->_model = v6;

      -[NSManagedObjectModel entitiesByName](self->_model, "entitiesByName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("Station"));
      v9 = objc_claimAutoreleasedReturnValue();

      v10 = objc_alloc_init(MEMORY[0x24BDBB678]);
      objc_msgSend(v10, "setEntity:", v9);
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("station_id == $stationID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPredicate:", v11);

      v64 = (void *)v5;
      +[RadioManagedStation defaultPropertiesToFetch](RadioManagedStation, "defaultPropertiesToFetch");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPropertiesToFetch:", v12);

      -[NSManagedObjectModel setFetchRequestTemplate:forName:](self->_model, "setFetchRequestTemplate:forName:", v10, CFSTR("StationIDToStation"));
      v13 = objc_alloc_init(MEMORY[0x24BDBB678]);
      v63 = (void *)v9;
      objc_msgSend(v13, "setEntity:", v9);
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("station_hash == $stationHash"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPredicate:", v14);

      +[RadioManagedStation defaultPropertiesToFetch](RadioManagedStation, "defaultPropertiesToFetch");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPropertiesToFetch:", v15);

      -[NSManagedObjectModel setFetchRequestTemplate:forName:](self->_model, "setFetchRequestTemplate:forName:", v13, CFSTR("StationHashToStation"));
      v16 = objc_alloc_init(MEMORY[0x24BDBB678]);
      objc_msgSend(v16, "setEntity:", v9);
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("station_string_id == $stationStringID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPredicate:", v17);

      +[RadioManagedStation defaultPropertiesToFetch](RadioManagedStation, "defaultPropertiesToFetch");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPropertiesToFetch:", v18);

      -[NSManagedObjectModel setFetchRequestTemplate:forName:](self->_model, "setFetchRequestTemplate:forName:", v16, CFSTR("StationStringIDToStation"));
      v19 = objc_alloc_init(MEMORY[0x24BDBB678]);
      -[NSManagedObjectModel entitiesByName](self->_model, "entitiesByName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKey:", CFSTR("SkipHistory"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setEntity:", v21);

      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("skip_identifier == $skipIdentifier"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setPredicate:", v22);

      objc_msgSend(v19, "setPropertiesToFetch:", &unk_24CA35718);
      -[NSManagedObjectModel setFetchRequestTemplate:forName:](self->_model, "setFetchRequestTemplate:forName:", v19, CFSTR("SkipIdentifierToSkipHistory"));
      v23 = objc_alloc_init(MEMORY[0x24BDBB678]);
      -[NSManagedObjectModel entitiesByName](self->_model, "entitiesByName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKey:", CFSTR("SkipHistory"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setEntity:", v25);

      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("station_hash == $stationHash"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setPredicate:", v26);

      objc_msgSend(v23, "setPropertiesToFetch:", &unk_24CA35730);
      -[NSManagedObjectModel setFetchRequestTemplate:forName:](self->_model, "setFetchRequestTemplate:forName:", v23, CFSTR("StationHashToSkipHistory"));
      v27 = objc_alloc_init(MEMORY[0x24BDBB678]);
      -[NSManagedObjectModel entitiesByName](self->_model, "entitiesByName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKey:", CFSTR("SkipHistory"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setEntity:", v29);

      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("station_id == $stationID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setPredicate:", v30);

      objc_msgSend(v27, "setPropertiesToFetch:", &unk_24CA35748);
      -[NSManagedObjectModel setFetchRequestTemplate:forName:](self->_model, "setFetchRequestTemplate:forName:", v27, CFSTR("StationIDToSkipHistory"));
      v31 = objc_alloc_init(MEMORY[0x24BDBB678]);
      -[NSManagedObjectModel entitiesByName](self->_model, "entitiesByName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKey:", CFSTR("DatabaseProperty"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setEntity:", v33);

      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("key == $key"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setPredicate:", v34);

      -[NSManagedObjectModel setFetchRequestTemplate:forName:](self->_model, "setFetchRequestTemplate:forName:", v31, CFSTR("DatabasePropertyKeyToProperty"));
    }
    v35 = (NSPersistentStoreCoordinator *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB738]), "initWithManagedObjectModel:", self->_model);
    storeCoordinator = self->_storeCoordinator;
    self->_storeCoordinator = v35;

  }
  objc_msgSend((id)objc_opt_class(), "_radioDirectoryPath");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_alloc_init(MEMORY[0x24BDD1580]);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bundleIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(&unk_24CA35760, "containsObject:", v40);

  v68 = 0;
  v42 = objc_msgSend(v38, "fileExistsAtPath:isDirectory:", v37, &v68);
  if (!v42 || !v68)
  {
    if (v42)
      objc_msgSend(v38, "removeItemAtPath:error:", v37, 0);
    if ((v41 & 1) != 0
      || (objc_msgSend(v37, "stringByDeletingLastPathComponent"),
          v43 = (void *)objc_claimAutoreleasedReturnValue(),
          v44 = objc_msgSend(v38, "isWritableFileAtPath:", v43),
          v43,
          v44))
    {
      objc_msgSend(v38, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v37, 1, 0, 0);
    }
    else
    {
      v45 = os_log_create("com.apple.amp.radio", "Model");
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v37, "stringByDeletingLastPathComponent");
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v70 = v46;
        _os_log_impl(&dword_2105F8000, v45, OS_LOG_TYPE_ERROR, "[RadioModel] Error: Unable to write to '%@' to create database", buf, 0xCu);

      }
    }
  }
  objc_msgSend((id)objc_opt_class(), "_radioDatabasePath");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v47, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPersistentStoreCoordinator persistentStoreForURL:](self->_storeCoordinator, "persistentStoreForURL:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v49)
  {
    objc_msgSend((id)objc_opt_class(), "_persistentStoreConfigurationOptions");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = *MEMORY[0x24BDBB580];
    -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](self->_storeCoordinator, "addPersistentStoreWithType:configuration:URL:options:error:", *MEMORY[0x24BDBB580], 0, v48, v50, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v52)
    {
      if ((v41 & 1) != 0 || (objc_msgSend(v38, "isWritableFileAtPath:", v47) & 1) != 0)
      {
        v53 = os_log_create("com.apple.amp.radio", "Model");
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2105F8000, v53, OS_LOG_TYPE_ERROR, "[RadioModel] Database missing or corrupt, starting over.", buf, 2u);
        }

        v54 = self->_storeCoordinator;
        objc_msgSend((id)objc_opt_class(), "_persistentStoreConfigurationOptions");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = 0;
        v56 = -[NSPersistentStoreCoordinator _destroyPersistentStoreAtURL:withType:options:error:](v54, "_destroyPersistentStoreAtURL:withType:options:error:", v48, v51, v55, &v67);
        v57 = v67;

        v58 = os_log_create("com.apple.amp.radio", "Model");
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          v59 = CFSTR("NO");
          if (v56)
            v59 = CFSTR("YES");
          *(_DWORD *)buf = 138412546;
          v70 = v59;
          v71 = 2112;
          v72 = v57;
          _os_log_impl(&dword_2105F8000, v58, OS_LOG_TYPE_ERROR, "[RadioModel] Attempted database reset with success: %@ (%@)", buf, 0x16u);
        }

        v60 = self->_storeCoordinator;
        v66 = 0;
        -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v60, "addPersistentStoreWithType:configuration:URL:options:error:", v51, 0, v48, v50, &v66);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v66;
        if (!v52)
          objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Radio: Unable to create database (%@)"), v61);

      }
      else
      {
        v57 = os_log_create("com.apple.amp.radio", "Model");
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2105F8000, v57, OS_LOG_TYPE_ERROR, "[RadioModel] Database missing or corrupt, giving up.", buf, 2u);
        }
        v52 = 0;
      }

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__databaseLock);

}

- (id)_databasePropertyValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v4, CFSTR("key"), 0);
    -[NSManagedObjectModel fetchRequestFromTemplateWithName:substitutionVariables:](self->_model, "fetchRequestFromTemplateWithName:substitutionVariables:", CFSTR("DatabasePropertyKeyToProperty"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__94;
    v17 = __Block_byref_object_dispose__95;
    v18 = 0;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __43__RadioModel__databasePropertyValueForKey___block_invoke;
    v10[3] = &unk_24CA2E2A8;
    v10[4] = self;
    v7 = v6;
    v11 = v7;
    v12 = &v13;
    -[RadioModel performTransactionWithBlock:](self, "performTransactionWithBlock:", v10);
    v8 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_endBackgroundTaskAssertion
{
  NSObject *accessSerialQueue;
  _QWORD block[5];

  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__RadioModel__endBackgroundTaskAssertion__block_invoke;
  block[3] = &unk_24CA2EB28;
  block[4] = self;
  dispatch_async(accessSerialQueue, block);
}

- (void)_performTransactionAndSave:(BOOL)a3 withBlock:(id)a4
{
  id v6;
  NSManagedObjectContext *context;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a4;
  context = self->_context;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__RadioModel__performTransactionAndSave_withBlock___block_invoke;
  v9[3] = &unk_24CA2E368;
  v9[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v9);

}

- (void)_postContextDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
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
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int modelChangedToken;
  pid_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint8_t v39[128];
  uint8_t buf[4];
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.radio", "Model");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v41 = CFSTR("RadioModelDidChangeNotification");
    _os_log_impl(&dword_2105F8000, v5, OS_LOG_TYPE_INFO, "[RadioModel] Posting '%@'", buf, 0xCu);
  }

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "objectForKey:", CFSTR("inserted"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioModel convertObjectsInSet:](self, "convertObjectsInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    -[RadioModel _setByReplacingManagedObjectsInSet:](self, "_setByReplacingManagedObjectsInSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("inserted"));

  }
  objc_msgSend(v7, "objectForKey:", CFSTR("updated"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioModel convertObjectsInSet:](self, "convertObjectsInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    -[RadioModel _setByReplacingManagedObjectsInSet:](self, "_setByReplacingManagedObjectsInSet:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("updated"));

  }
  objc_msgSend(v7, "objectForKey:", CFSTR("deleted"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioModel convertObjectsInSet:](self, "convertObjectsInSet:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    -[RadioModel _setByReplacingManagedObjectsInSet:](self, "_setByReplacingManagedObjectsInSet:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v16, CFSTR("deleted"));

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("RadioModelDidChangeNotification"), self, v7);

  if (self->_modelChangedTokenIsValid)
  {
    v29 = v12;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v18 = v9;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v35;
LABEL_12:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v20 == ++v22)
        {
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          if (v20)
            goto LABEL_12;
          goto LABEL_18;
        }
      }
    }
    else
    {
LABEL_18:

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v18 = v15;
      v23 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (!v23)
      {
LABEL_26:

LABEL_28:
        v12 = v29;
        goto LABEL_29;
      }
      v24 = v23;
      v25 = *(_QWORD *)v31;
LABEL_20:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v24 == ++v26)
        {
          v24 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v24)
            goto LABEL_20;
          goto LABEL_26;
        }
      }
    }

    modelChangedToken = self->_modelChangedToken;
    v28 = getpid();
    notify_set_state(modelChangedToken, v28);
    notify_post("com.apple.Radio.model-changed");
    goto LABEL_28;
  }
LABEL_29:

}

- (void)_prepareModel
{
  NSManagedObjectContext *v3;
  NSManagedObjectContext *context;
  NSManagedObjectContext *v5;
  NSFetchRequest *v6;
  NSFetchRequest *stationFetchRequest;
  NSFetchRequest *v8;
  void *v9;
  NSFetchRequest *v10;
  void *v11;
  void *v12;
  NSFetchRequest *v13;
  void *v14;
  NSFetchedResultsController *v15;
  NSFetchedResultsController *stationFetchedResultsController;
  _QWORD v17[5];

  -[RadioModel _createRadioDirectoryAndDatabaseIfNecessary](self, "_createRadioDirectoryAndDatabaseIfNecessary");
  v3 = (NSManagedObjectContext *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6A0]), "initWithConcurrencyType:", 1);
  context = self->_context;
  self->_context = v3;

  v5 = self->_context;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __27__RadioModel__prepareModel__block_invoke;
  v17[3] = &unk_24CA2EB28;
  v17[4] = self;
  -[NSManagedObjectContext performBlockAndWait:](v5, "performBlockAndWait:", v17);
  v6 = (NSFetchRequest *)objc_alloc_init(MEMORY[0x24BDBB678]);
  stationFetchRequest = self->_stationFetchRequest;
  self->_stationFetchRequest = v6;

  v8 = self->_stationFetchRequest;
  objc_msgSend(MEMORY[0x24BDBB658], "entityForName:inManagedObjectContext:", CFSTR("Station"), self->_context);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSFetchRequest setEntity:](v8, "setEntity:", v9);

  v10 = self->_stationFetchRequest;
  +[RadioManagedStation defaultPropertiesToFetch](RadioManagedStation, "defaultPropertiesToFetch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSFetchRequest setPropertiesToFetch:](v10, "setPropertiesToFetch:", v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("sort_order"), 1);
  v13 = self->_stationFetchRequest;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSFetchRequest setSortDescriptors:](v13, "setSortDescriptors:", v14);

  -[NSFetchRequest setFetchBatchSize:](self->_stationFetchRequest, "setFetchBatchSize:", 10);
  v15 = (NSFetchedResultsController *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB688]), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", self->_stationFetchRequest, self->_context, 0, 0);
  stationFetchedResultsController = self->_stationFetchedResultsController;
  self->_stationFetchedResultsController = v15;

  -[NSFetchedResultsController setDelegate:](self->_stationFetchedResultsController, "setDelegate:", self);
}

- (void)_resetModel
{
  NSFetchedResultsController *stationFetchedResultsController;
  NSFetchRequest *stationFetchRequest;
  void *v5;
  void *v6;
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

  v17 = *MEMORY[0x24BDAC8D0];
  -[NSFetchedResultsController setDelegate:](self->_stationFetchedResultsController, "setDelegate:", 0);
  stationFetchedResultsController = self->_stationFetchedResultsController;
  self->_stationFetchedResultsController = 0;

  stationFetchRequest = self->_stationFetchRequest;
  self->_stationFetchRequest = 0;

  -[NSPersistentStoreCoordinator persistentStores](self->_storeCoordinator, "persistentStores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
          objc_enumerationMutation(v7);
        -[NSPersistentStoreCoordinator removePersistentStore:error:](self->_storeCoordinator, "removePersistentStore:error:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), 0, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)_setByReplacingManagedObjectsInSet:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  RadioStation *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = -[RadioStation initWithModel:managedObject:]([RadioStation alloc], "initWithModel:managedObject:", self, v11);
            objc_msgSend(v5, "addObject:", v12);

          }
          else
          {
            objc_msgSend(v5, "addObject:", v11, (_QWORD)v14);
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_setDatabasePropertyValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v7, CFSTR("key"), 0);
    -[NSManagedObjectModel fetchRequestFromTemplateWithName:substitutionVariables:](self->_model, "fetchRequestFromTemplateWithName:substitutionVariables:", CFSTR("DatabasePropertyKeyToProperty"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __47__RadioModel__setDatabasePropertyValue_forKey___block_invoke;
    v11[3] = &unk_24CA2E390;
    v11[4] = self;
    v12 = v9;
    v13 = v7;
    v14 = v6;
    v10 = v9;
    -[RadioModel performWriteTransactionWithBlock:](self, "performWriteTransactionWithBlock:", v11);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeCoordinator, 0);
  objc_storeStrong((id *)&self->_stationToSkipControllerMapTable, 0);
  objc_storeStrong((id *)&self->_stationFetchRequest, 0);
  objc_storeStrong((id *)&self->_stationFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_backgroundTaskInvalidateTimerSource, 0);
  objc_storeStrong((id *)&self->_backgroundProcessAssertion, 0);
  objc_storeStrong((id *)&self->_backgroundCleanupQueue, 0);
  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
}

void __47__RadioModel__setDatabasePropertyValue_forKey___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1[4] + 48), "executeFetchRequest:error:", a1[5], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "willAccessValueForKey:", CFSTR("value"));
  objc_msgSend(v3, "valueForKey:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didAccessValueForKey:", CFSTR("value"));
  if (!v3)
  {
    v5 = objc_alloc(MEMORY[0x24BDBB698]);
    objc_msgSend(MEMORY[0x24BDBB658], "entityForName:inManagedObjectContext:", CFSTR("DatabaseProperty"), *(_QWORD *)(a1[4] + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, *(_QWORD *)(a1[4] + 48));

    objc_msgSend(v3, "willChangeValueForKey:", CFSTR("key"));
    objc_msgSend(v3, "setValue:forKey:", a1[6], CFSTR("key"));
    objc_msgSend(v3, "didChangeValueForKey:", CFSTR("key"));
  }
  if (v4 != (void *)a1[7] && (objc_msgSend(v4, "isEqualToString:") & 1) == 0)
  {
    v7 = os_log_create("com.apple.amp.radio", "Model");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_2105F8000, v7, OS_LOG_TYPE_INFO, "[RadioModel] Setting database property: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(v3, "willChangeValueForKey:", CFSTR("value"));
    objc_msgSend(v3, "setValue:forKey:", a1[7], CFSTR("value"));
    objc_msgSend(v3, "didChangeValueForKey:", CFSTR("value"));
  }

}

uint64_t __27__RadioModel__prepareModel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  if (*(_BYTE *)(v2 + 56))
    v4 = (_QWORD *)MEMORY[0x24BDBB478];
  else
    v4 = (_QWORD *)MEMORY[0x24BDBB480];
  objc_msgSend(v3, "setMergePolicy:", *v4);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setPersistentStoreCoordinator:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
}

uint64_t __51__RadioModel__performTransactionAndSave_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  _BYTE *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  result = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(result + 120) == 1)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v4 = objc_msgSend(*(id *)(result + 48), "hasChanges");
      result = *(_QWORD *)(a1 + 32);
      if (v4)
      {
        if (*(_BYTE *)(result + 56))
        {
          objc_msgSend((id)result, "_beginBackgroundTaskAssertion");
          result = *(_QWORD *)(a1 + 32);
        }
        objc_msgSend(*(id *)(result + 48), "processPendingChanges");
        v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        v10 = 0;
        v6 = objc_msgSend(v5, "save:", &v10);
        v7 = v10;
        if ((v6 & 1) == 0)
        {
          v8 = os_log_create("com.apple.amp.radio", "Model");
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v12 = v7;
            _os_log_impl(&dword_2105F8000, v8, OS_LOG_TYPE_ERROR, "[RadioModel] Error: Unable to save (%@)", buf, 0xCu);
          }

        }
        v9 = *(_BYTE **)(a1 + 32);
        if (v9[56])
          objc_msgSend(v9, "_endBackgroundTaskAssertion");

        result = *(_QWORD *)(a1 + 32);
      }
    }
  }
  --*(_QWORD *)(result + 120);
  return result;
}

void __41__RadioModel__endBackgroundTaskAssertion__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  _QWORD *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  dispatch_source_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id location;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 32);
  v3 = v2 < 1;
  v4 = v2 - 1;
  if (!v3)
  {
    *(_QWORD *)(v1 + 32) = v4;
    v6 = *(_QWORD **)(a1 + 32);
    if (!v6[4])
    {
      v7 = v6[5];
      if (v7)
      {
        dispatch_source_cancel(v7);
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = 0;

        v6 = *(_QWORD **)(a1 + 32);
      }
      objc_initWeak(&location, v6);
      v10 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
      v14 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
      v15 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __41__RadioModel__endBackgroundTaskAssertion__block_invoke_2;
      v16[3] = &unk_24CA2E340;
      objc_copyWeak(&v17, &location);
      dispatch_source_set_event_handler(v15, v16);
      dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
}

void __41__RadioModel__endBackgroundTaskAssertion__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if (!WeakRetained[4])
    {
      v3 = os_log_create("com.apple.amp.radio", "Model");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v7 = 138412290;
        v8 = v2;
        _os_log_impl(&dword_2105F8000, v3, OS_LOG_TYPE_INFO, "[RadioModel] Invalidating process assertion for model: %@", (uint8_t *)&v7, 0xCu);
      }

      objc_msgSend(*((id *)v2 + 3), "invalidate");
      v4 = (void *)*((_QWORD *)v2 + 3);
      *((_QWORD *)v2 + 3) = 0;

    }
    v5 = *((_QWORD *)v2 + 5);
    if (v5)
    {
      dispatch_source_cancel(v5);
      v6 = (void *)*((_QWORD *)v2 + 5);
      *((_QWORD *)v2 + 5) = 0;

    }
  }

}

void __43__RadioModel__databasePropertyValueForKey___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1[4] + 48), "executeFetchRequest:error:", a1[5], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "willAccessValueForKey:", CFSTR("value"));
    objc_msgSend(v6, "valueForKey:", CFSTR("value"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_msgSend(v6, "didAccessValueForKey:", CFSTR("value"));
  }

}

void __46__RadioModel__defaultRadioModelInitialization__block_invoke(uint64_t a1, int token)
{
  NSObject *v3;
  uint64_t v4;
  pid_t v5;
  uint64_t v6;
  BOOL v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  uint64_t state64;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  state64 = 0;
  notify_get_state(token, &state64);
  v3 = os_log_create("com.apple.amp.radio", "Model");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = state64;
    _os_log_impl(&dword_2105F8000, v3, OS_LOG_TYPE_INFO, "[RadioModel] Model changed with pid: %i", buf, 8u);
  }

  v4 = state64;
  v5 = getpid();
  v6 = v5;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
    v7 = v4 == v5;
  else
    v7 = 0;
  if (!v7)
  {
    v8 = os_log_create("com.apple.amp.radio", "Model");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2105F8000, v8, OS_LOG_TYPE_INFO, "[RadioModel] Rebuilding model for external change...", buf, 2u);
    }

    v9 = *(_QWORD **)(a1 + 32);
    v10 = (void *)v9[6];
    if (v10 && v4 != v6)
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __46__RadioModel__defaultRadioModelInitialization__block_invoke_227;
      v13[3] = &unk_24CA2EB28;
      v13[4] = v9;
      objc_msgSend(v10, "performBlockAndWait:", v13);
      v9 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v9, "_prepareModel");
    v11 = os_log_create("com.apple.amp.radio", "Model");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = CFSTR("RadioModelDidChangeNotification");
      _os_log_impl(&dword_2105F8000, v11, OS_LOG_TYPE_INFO, "[RadioModel] Posting '%@' due to an external change", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("RadioModelDidChangeNotification"), *(_QWORD *)(a1 + 32));

  }
}

void __46__RadioModel__defaultRadioModelInitialization__block_invoke_231(uint64_t a1, int token)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint64_t state64;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  state64 = 0;
  notify_get_state(token, &state64);
  v3 = os_log_create("com.apple.amp.radio", "Model");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = state64;
    _os_log_impl(&dword_2105F8000, v3, OS_LOG_TYPE_INFO, "[RadioModel] Model deleted with pid: %i", buf, 8u);
  }

  v4 = state64;
  v5 = getpid();
  v6 = os_log_create("com.apple.amp.radio", "Model");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2105F8000, v6, OS_LOG_TYPE_INFO, "[RadioModel] Rebuilding model for external deletion...", buf, 2u);
  }

  v7 = *(_QWORD **)(a1 + 32);
  v8 = (void *)v7[6];
  if (v8)
    v9 = v4 == v5;
  else
    v9 = 1;
  if (!v9)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __46__RadioModel__defaultRadioModelInitialization__block_invoke_232;
    v13[3] = &unk_24CA2EB28;
    v13[4] = v7;
    objc_msgSend(v8, "performBlockAndWait:", v13);
    v7 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v7, "_prepareModel");
  v10 = os_log_create("com.apple.amp.radio", "Model");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v16 = CFSTR("RadioModelWasDeletedNotification");
    v17 = 2112;
    v18 = CFSTR("RadioModelDidChangeNotification");
    _os_log_impl(&dword_2105F8000, v10, OS_LOG_TYPE_INFO, "[RadioModel] Posting '%@', '%@' due to an external deletion", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("RadioModelWasDeletedNotification"), *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("RadioModelDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __46__RadioModel__defaultRadioModelInitialization__block_invoke_232(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_resetModel");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

}

void __46__RadioModel__defaultRadioModelInitialization__block_invoke_227(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_resetModel");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

}

void __43__RadioModel__beginBackgroundTaskAssertion__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  dispatch_semaphore_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  intptr_t (*v21)(uint64_t, char);
  void *v22;
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[5];
  if (v3)
  {
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

    v2 = *(_QWORD **)(a1 + 32);
  }
  if ((uint64_t)v2[4] >= 1 && !v2[3])
  {
    v6 = dispatch_semaphore_create(0);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    v7 = objc_alloc(MEMORY[0x24BE08A10]);
    v8 = getpid();
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __43__RadioModel__beginBackgroundTaskAssertion__block_invoke_2;
    v22 = &unk_24CA2E2F0;
    v24 = &v25;
    v9 = v6;
    v23 = v9;
    v10 = objc_msgSend(v7, "initWithPID:flags:reason:name:withHandler:", v8, 21, 4, CFSTR("RadioModelSaveAssertion"), &v19);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 24);
    *(_QWORD *)(v11 + 24) = v10;

    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    v13 = os_log_create("com.apple.amp.radio", "Model");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v30 = v14;
      _os_log_impl(&dword_2105F8000, v13, OS_LOG_TYPE_INFO, "[RadioModel] Obtained process assertion for model %@", buf, 0xCu);
    }

    if (!*((_BYTE *)v26 + 24))
    {
      v15 = os_log_create("com.apple.amp.radio", "Model");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v30 = v16;
        _os_log_impl(&dword_2105F8000, v15, OS_LOG_TYPE_INFO, "[RadioModel] Failed to acquire process assertion for model %@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate", v19, v20, v21, v22);
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(void **)(v17 + 24);
      *(_QWORD *)(v17 + 24) = 0;

    }
    _Block_object_dispose(&v25, 8);

  }
}

intptr_t __43__RadioModel__beginBackgroundTaskAssertion__block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __26__RadioModel_userStations__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "fetchedObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    v21 = 0;
    v4 = objc_msgSend(v3, "performFetch:", &v21);
    v5 = v21;
    if ((v4 & 1) == 0)
    {
      v6 = os_log_create("com.apple.amp.radio", "Model");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v5;
        _os_log_impl(&dword_2105F8000, v6, OS_LOG_TYPE_ERROR, "[RadioModel] Error: Unable to fetch stations (%@.)", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "fetchedObjects");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v2, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v2, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v2;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v13, "stationID", (_QWORD)v17))
            objc_msgSend(v7, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v10);
    }

    objc_msgSend(*(id *)(a1 + 32), "_arrayByReplacingManagedObjectsInArray:", v7);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
}

void __41__RadioModel_stationWithStationStringID___block_invoke(_QWORD *a1)
{
  void *v2;
  RadioStation *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1[4] + 48), "executeFetchRequest:error:", a1[5], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v3 = -[RadioStation initWithModel:managedObject:]([RadioStation alloc], "initWithModel:managedObject:", a1[4], v6);
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __38__RadioModel_stationWithPersistentID___block_invoke(_QWORD *a1)
{
  void *v2;
  RadioStation *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1[4] + 48), "executeFetchRequest:error:", a1[5], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v3 = -[RadioStation initWithModel:managedObject:]([RadioStation alloc], "initWithModel:managedObject:", a1[4], v6);
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __28__RadioModel_stationWithID___block_invoke(_QWORD *a1)
{
  void *v2;
  RadioStation *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1[4] + 48), "executeFetchRequest:error:", a1[5], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v3 = -[RadioStation initWithModel:managedObject:]([RadioStation alloc], "initWithModel:managedObject:", a1[4], v6);
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __30__RadioModel_stationWithHash___block_invoke(_QWORD *a1)
{
  void *v2;
  RadioStation *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1[4] + 48), "executeFetchRequest:error:", a1[5], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v3 = -[RadioStation initWithModel:managedObject:]([RadioStation alloc], "initWithModel:managedObject:", a1[4], v6);
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

uint64_t __57__RadioModel_setTrackPlaybackDescriptorQueue_forStation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTrackPlaybackDescriptorQueue:", *(_QWORD *)(a1 + 40));
}

uint64_t __37__RadioModel_setStationSortOrdering___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "processPendingChanges");
}

void __37__RadioModel_setStationSortOrdering___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userStations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v2);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "stationWithID:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "longLongValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "setSortOrder:", v7);
          objc_msgSend(v3, "removeObject:", v11);
          v7 = (v7 + 1);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }
  else
  {
    LODWORD(v7) = 0;
  }

  objc_msgSend(v3, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_185);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "setSortOrder:", v7 + j, (_QWORD)v19);
      }
      LODWORD(v7) = v7 + j;
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

}

uint64_t __37__RadioModel_setStationSortOrdering___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:options:", v6, 1);
  return v7;
}

void __29__RadioModel_previewStations__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "fetchedObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    v21 = 0;
    v4 = objc_msgSend(v3, "performFetch:", &v21);
    v5 = v21;
    if ((v4 & 1) == 0)
    {
      v6 = os_log_create("com.apple.amp.radio", "Model");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v5;
        _os_log_impl(&dword_2105F8000, v6, OS_LOG_TYPE_ERROR, "[RadioModel] Error: Unable to fetch stations (%@.)", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "fetchedObjects");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v2, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v2, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v2;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v13, "isPreview", (_QWORD)v17))
            objc_msgSend(v7, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v10);
    }

    objc_msgSend(*(id *)(a1 + 32), "_arrayByReplacingManagedObjectsInArray:", v7);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
}

uint64_t __39__RadioModel_newStationWithDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  RadioStation *v6;
  uint64_t v7;
  void *v8;
  uint64_t result;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40);
  if (!v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDBB698]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "entity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithEntity:insertIntoManagedObjectContext:", v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));

    if (v5)
    {
      objc_msgSend(v5, "setSortOrder:", 0xFFFFFFFFLL);
      v6 = -[RadioStation initWithModel:managedObject:]([RadioStation alloc], "initWithModel:managedObject:", *(_QWORD *)(a1 + 32), v5);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 168) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40);
  }
  objc_msgSend(v2, "setStationID:", *(_QWORD *)(a1 + 176));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setStationHash:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setAdamID:", *(_QWORD *)(a1 + 184));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setArtworkURL:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setArtworkURLData:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setName:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setStationDescription:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setCoreSeedName:", *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setSeedTracks:", *(_QWORD *)(a1 + 88));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setEditEnabled:", *(unsigned __int8 *)(a1 + 232));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setEditableFields:", *(_QWORD *)(a1 + 96));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setHasSkipRules:", *(unsigned __int8 *)(a1 + 233));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setLikesEnabled:", *(unsigned __int8 *)(a1 + 234));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setRequiresSubscription:", *(unsigned __int8 *)(a1 + 235));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setSkipEnabled:", *(unsigned __int8 *)(a1 + 236));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setSkipFrequency:", *(unsigned int *)(a1 + 224));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setSkipIdentifier:", *(_QWORD *)(a1 + 104));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setSkipInterval:", *(double *)(a1 + 192));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setVirtualPlayEnabled:", *(unsigned __int8 *)(a1 + 237));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setSongMixType:", *(_QWORD *)(a1 + 200));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setAdData:", *(_QWORD *)(a1 + 112));
  if (*(_BYTE *)(a1 + 238))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setFeatured:", *(unsigned __int8 *)(a1 + 239));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setIsExplicit:", *(unsigned __int8 *)(a1 + 240));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setGatewayVideoAdEnabled:", *(unsigned __int8 *)(a1 + 241));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setSponsored:", *(unsigned __int8 *)(a1 + 242));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setImpressionThreshold:", *(_QWORD *)(a1 + 208));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setPremiumPlacement:", *(unsigned __int8 *)(a1 + 243));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setPreviewOnly:", *(unsigned __int8 *)(a1 + 244));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setStationStringID:", *(_QWORD *)(a1 + 120));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setStreamURL:", *(_QWORD *)(a1 + 128));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setStreamCertificateURL:", *(_QWORD *)(a1 + 136));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setStreamKeyURL:", *(_QWORD *)(a1 + 144));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setShared:", *(unsigned __int8 *)(a1 + 245));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setSubscribed:", *(unsigned __int8 *)(a1 + 246));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setSubscriberCount:", *(unsigned int *)(a1 + 228));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setShareToken:", *(_QWORD *)(a1 + 152));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setSharingEnabled:", *(unsigned __int8 *)(a1 + 247));
  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setDebugDictionary:", *(_QWORD *)(a1 + 160));
  if (*(_QWORD *)(a1 + 216))
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setPersistentID:");
  return result;
}

uint64_t __46__RadioModel_newPreviewStationWithDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "newStationWithDictionary:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setStationID:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setSortOrder:", 0);
}

uint64_t __47__RadioModel_newFeaturedStationWithDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "newStationWithDictionary:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isSponsored");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setFeatured:", 1);
  return result;
}

void __30__RadioModel_featuredStations__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "fetchedObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    v21 = 0;
    v4 = objc_msgSend(v3, "performFetch:", &v21);
    v5 = v21;
    if ((v4 & 1) == 0)
    {
      v6 = os_log_create("com.apple.amp.radio", "Model");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v5;
        _os_log_impl(&dword_2105F8000, v6, OS_LOG_TYPE_ERROR, "[RadioModel] Error: Unable to fetch stations (%@.)", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "fetchedObjects");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v2, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v2, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v2;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (!objc_msgSend(v13, "stationID", (_QWORD)v17)
            && ((objc_msgSend(v13, "isFeatured") & 1) != 0 || objc_msgSend(v13, "isSponsored")))
          {
            objc_msgSend(v7, "addObject:", v13);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v10);
    }

    objc_msgSend(*(id *)(a1 + 32), "_arrayByReplacingManagedObjectsInArray:", v7);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
}

void __28__RadioModel_deleteStation___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(*(id *)(a1 + 40), "managedObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deleteObject:", v2);

}

void __34__RadioModel_deleteStationWithID___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "stationWithID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deleteStation:", v2);

}

void __28__RadioModel_convertObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "existingObjectWithID:error:", v5, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __28__RadioModel_convertObject___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingObjectWithID:error:", v6, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __25__RadioModel_allStations__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "fetchedObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    v10 = 0;
    v4 = objc_msgSend(v3, "performFetch:", &v10);
    v5 = v10;
    if ((v4 & 1) == 0)
    {
      v6 = os_log_create("com.apple.amp.radio", "Model");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v5;
        _os_log_impl(&dword_2105F8000, v6, OS_LOG_TYPE_ERROR, "[RadioModel] Error: Unable to fetch stations (%@.)", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "fetchedObjects");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_arrayByReplacingManagedObjectsInArray:", v2);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

void __42__RadioModel__contextDidSaveNotification___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "mergeChangesFromContextDidSaveNotification:", *(_QWORD *)(a1 + 40));
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__RadioModel__contextDidSaveNotification___block_invoke_2;
  v3[3] = &unk_24CA2E640;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

uint64_t __42__RadioModel__contextDidSaveNotification___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postContextDidChangeNotification:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__RadioModel__contextDidSaveNotification___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postContextDidChangeNotification:", *(_QWORD *)(a1 + 40));
}

+ (id)backgroundModel
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__RadioModel_backgroundModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (backgroundModel___once != -1)
    dispatch_once(&backgroundModel___once, block);
  return (id)backgroundModel___backgroundModel;
}

+ (id)sharedModel
{
  if (sharedModel___once != -1)
    dispatch_once(&sharedModel___once, &__block_literal_global_133);
  return (id)sharedModel___sharedModel;
}

+ (void)deleteAllData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  +[RadioImageCache sharedCache](RadioImageCache, "sharedCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_removeAllCachedImages");

  +[RadioModel sharedModel](RadioModel, "sharedModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RadioModel backgroundModel](RadioModel, "backgroundModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __27__RadioModel_deleteAllData__block_invoke;
  v10[3] = &unk_24CA2E218;
  v11 = v5;
  v12 = v4;
  v13 = a1;
  v7 = v4;
  v9 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v10);

  +[RadioRequest defaultURLCache](RadioRequest, "defaultURLCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllCachedResponses");

}

+ (id)_persistentStoreConfigurationOptions
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[6];
  _QWORD v7[7];

  v7[6] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDBB570];
  v6[0] = *MEMORY[0x24BDBB578];
  v6[1] = v2;
  v7[0] = &unk_24CA35778;
  v7[1] = MEMORY[0x24BDBD1C8];
  v3 = *MEMORY[0x24BDBB420];
  v6[2] = *MEMORY[0x24BDBB488];
  v6[3] = v3;
  v4 = *MEMORY[0x24BDBB500];
  v6[4] = *MEMORY[0x24BDBB4F8];
  v6[5] = v4;
  v7[2] = MEMORY[0x24BDBD1C8];
  v7[3] = MEMORY[0x24BDBD1C8];
  v7[4] = *MEMORY[0x24BDD0CF8];
  v7[5] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)_postAccountDidDeauthenticateNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.Radio.account.did-deauthenticate"), 0, 0, 1u);
}

+ (id)_radioDatabasePath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_radioDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Radio.db"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_radioDirectoryPath
{
  if (_radioDirectoryPath_sOnceToken != -1)
    dispatch_once(&_radioDirectoryPath_sOnceToken, &__block_literal_global_218);
  return (id)_radioDirectoryPath_sRadioDirectory;
}

void __33__RadioModel__radioDirectoryPath__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Media/Radio"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_radioDirectoryPath_sRadioDirectory;
  _radioDirectoryPath_sRadioDirectory = v0;

}

void __27__RadioModel_deleteAllData__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27__RadioModel_deleteAllData__block_invoke_2;
  v5[3] = &unk_24CA2E218;
  v6 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v8 = v4;
  objc_msgSend(v2, "performBlockAndWait:", v5);

}

void __27__RadioModel_deleteAllData__block_invoke_2(id *a1)
{
  NSObject *v2;
  void *v3;
  __CFString *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _DWORD *v18;
  int v19;
  pid_t v20;
  id v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "_resetModel");
  objc_msgSend(a1[5], "_resetModel");
  v2 = os_log_create("com.apple.amp.radio", "Model");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2105F8000, v2, OS_LOG_TYPE_INFO, "[RadioModel] Destroying data...", buf, 2u);
  }

  objc_msgSend(a1[6], "_radioDatabasePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = os_log_create("com.apple.amp.radio", "Model");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v4;
      v24 = 2112;
      v25 = v3;
      _os_log_impl(&dword_2105F8000, v5, OS_LOG_TYPE_INFO, "[RadioModel] Destroying database at URL: %@ (path: %@)", buf, 0x16u);
    }

    if (v4)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&__databaseLock);
      v6 = (void *)*((_QWORD *)a1[4] + 14);
      v7 = *MEMORY[0x24BDBB580];
      objc_msgSend(a1[6], "_persistentStoreConfigurationOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v9 = objc_msgSend(v6, "_destroyPersistentStoreAtURL:withType:options:error:", v4, v7, v8, &v21);
      v10 = v21;

      os_unfair_lock_unlock((os_unfair_lock_t)&__databaseLock);
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }

  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  v11 = os_log_create("com.apple.amp.radio", "Model");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = CFSTR("NO");
    if (v9)
      v12 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v23 = v12;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_2105F8000, v11, OS_LOG_TYPE_INFO, "[RadioModel] Destroy results: success: %@, error: %@", buf, 0x16u);
  }

  v13 = os_log_create("com.apple.amp.radio", "Model");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v23 = CFSTR("RadioModelWasDeletedNotification");
    _os_log_impl(&dword_2105F8000, v13, OS_LOG_TYPE_INFO, "[RadioModel] Posting '%@'", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[RadioModel sharedModel](RadioModel, "sharedModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:", CFSTR("RadioModelWasDeletedNotification"), v15);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[RadioModel backgroundModel](RadioModel, "backgroundModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:", CFSTR("RadioModelWasDeletedNotification"), v17);

  v18 = a1[4];
  if (*((_BYTE *)v18 + 84))
  {
    v19 = v18[20];
    v20 = getpid();
    notify_set_state(v19, v20);
  }
  notify_post("com.apple.Radio.model-deleted");
  objc_msgSend(a1[4], "_postContextDidChangeNotification:", 0);
  objc_msgSend(a1[5], "_postContextDidChangeNotification:", 0);
  objc_msgSend(a1[6], "_postAccountDidDeauthenticateNotification");

}

void __25__RadioModel_sharedModel__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[RadioModel _init]([RadioModel alloc], "_init");
  v1 = (void *)sharedModel___sharedModel;
  sharedModel___sharedModel = (uint64_t)v0;

}

void __29__RadioModel_backgroundModel__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  _QWORD *v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  +[RadioModel sharedModel](RadioModel, "sharedModel");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "_initBackgroundModelWithPersistentStoreCoordinator:", v4[14]);
  v3 = (void *)backgroundModel___backgroundModel;
  backgroundModel___backgroundModel = v2;

}

@end
