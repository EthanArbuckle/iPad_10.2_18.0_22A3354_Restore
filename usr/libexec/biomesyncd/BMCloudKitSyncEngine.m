@implementation BMCloudKitSyncEngine

- (BOOL)isSiriCloudSyncEnabled
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "aa_primaryAppleAccount"));
  v4 = objc_msgSend(v3, "isEnabledForDataclass:", kAccountDataclassSiri);

  return v4;
}

- (id)db
{
  return self->_db;
}

- (BMCloudKitSyncEngine)initWithQueue:(id)a3 multiStreamManager:(id)a4 database:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMCloudKitSyncEngine *v12;
  BMCloudKitSyncEngine *v13;
  uint64_t v14;
  BMSyncSessionMetricsCollector *metricsCollector;
  NSOperationQueue *v16;
  NSOperationQueue *operationQueue;
  NSString *mergeableRecordValueKey;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)BMCloudKitSyncEngine;
  v12 = -[BMCloudKitSyncEngine init](&v20, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_syncManager, a4);
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metricsCollector"));
    metricsCollector = v13->_metricsCollector;
    v13->_metricsCollector = (BMSyncSessionMetricsCollector *)v14;

    objc_storeStrong((id *)&v13->_db, a5);
    objc_storeStrong((id *)&v13->_queue, a3);
    v16 = objc_opt_new(NSOperationQueue);
    operationQueue = v13->_operationQueue;
    v13->_operationQueue = v16;

    -[NSOperationQueue setUnderlyingQueue:](v13->_operationQueue, "setUnderlyingQueue:", v9);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v13->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    mergeableRecordValueKey = v13->_mergeableRecordValueKey;
    v13->_mergeableRecordValueKey = (NSString *)CFSTR("streamCRDT");

  }
  return v13;
}

- (id)streamConfigurationForZoneID:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "zoneName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMCloudKitSyncEngine streamConfigurationFromSyncIdentifier:](self, "streamConfigurationFromSyncIdentifier:", v4));

  return v5;
}

- (id)streamConfigurationFromSyncIdentifier:(id)a3
{
  BMDistributedSyncMultiStreamManager *syncManager;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  syncManager = self->_syncManager;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMDistributedSyncMultiStreamManager distributedSyncManagers](syncManager, "distributedSyncManagers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "streamConfiguration"));
  return v7;
}

- (id)newHighestDeletedLocationRecordIDFor:(id)a3 stream:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BMSyncDatabase *db;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase highestDeletedLocationForSiteIdentifier:inStream:](self->_db, "highestDeletedLocationForSiteIdentifier:inStream:", v6, v7));
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "location"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "day"));
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v13 = (uint64_t)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase ckRecordForRecordName:zoneName:recordType:](self->_db, "ckRecordForRecordName:zoneName:recordType:", v6, v7, 3));
    v15 = v14;
    if (v14
      && (db = self->_db,
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "locationID")),
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase locationRowWithLocationID:](db, "locationRowWithLocationID:", v17)),
          v17,
          v18))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "location"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "day"));
      objc_msgSend(v20, "timeIntervalSinceReferenceDate");
      v22 = (uint64_t)v21;

    }
    else
    {
      v22 = 0;
    }
    if (v22 >= v13)
    {
      v23 = 0;
    }
    else
    {
      -[BMSyncDatabase saveCKRecordHighestDeletedLocationRow:recordName:zoneName:recordExists:](self->_db, "saveCKRecordHighestDeletedLocationRow:recordName:zoneName:recordExists:", v9, v6, v7, v15 != 0);
      v24 = objc_msgSend(objc_alloc((Class)CKRecordZone), "initWithZoneName:", v7);
      v25 = objc_alloc((Class)CKRecordID);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "zoneID"));
      v23 = objc_msgSend(v25, "initWithRecordName:zoneID:", v6, v26);

    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)newZoneVersionRecordIDForZone:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)CKRecordID), "initWithRecordName:zoneID:", CFSTR("zoneVersion"), v3);

  return v4;
}

- (void)syncNowWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  unsigned int v14;
  BMAsyncBlockOperation *v15;
  id v16;
  BMAsyncBlockOperation *v17;
  _QWORD v18[4];
  id v19;
  id v20[2];
  id buf;

  v8 = a4;
  v9 = a5;
  v10 = __biome_log_for_category(11);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "syncNowWithReason", (uint8_t *)&buf, 2u);
  }

  v12 = __biome_log_for_category(11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = -[BMCloudKitSyncEngine isSiriCloudSyncEnabled](self, "isSiriCloudSyncEnabled");
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Sync with iCloud for Siri: %d", (uint8_t *)&buf, 8u);
  }

  objc_initWeak(&buf, self);
  v15 = [BMAsyncBlockOperation alloc];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100026F4C;
  v18[3] = &unk_100069508;
  objc_copyWeak(v20, &buf);
  v20[1] = (id)a3;
  v16 = v9;
  v19 = v16;
  v17 = -[BMAsyncBlockOperation initWithAsyncOperationBlock:](v15, "initWithAsyncOperationBlock:", v18);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v17);

  objc_destroyWeak(v20);
  objc_destroyWeak(&buf);

}

- (void)fetchChangesWithError:(id)a3
{
  id v4;
  CKSyncEngine *ckSyncEngine;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;

  v4 = a3;
  if (-[BMCloudKitSyncEngine isSiriCloudSyncEnabled](self, "isSiriCloudSyncEnabled"))
  {
    -[CKSyncEngine setNeedsToFetchChanges](self->_ckSyncEngine, "setNeedsToFetchChanges");
    ckSyncEngine = self->_ckSyncEngine;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000272D0;
    v9[3] = &unk_100069558;
    v9[4] = self;
    v10 = v4;
    -[CKSyncEngine fetchChangesWithCompletionHandler:](ckSyncEngine, "fetchChangesWithCompletionHandler:", v9);

  }
  else
  {
    v6 = objc_alloc((Class)NSError);
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("Sync to iCloud for Siri disabled, no sync via iCloud performed");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    v8 = objc_msgSend(v6, "initWithDomain:code:userInfo:", NSPOSIXErrorDomain, -1, v7);

    (*((void (**)(id, id))v4 + 2))(v4, v8);
  }

}

- (void)handleTransitionToNewMergeableValueRecordValueKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BMDistributedSyncMultiStreamManager distributedSyncManagers](self->_syncManager, "distributedSyncManagers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase mergeableRecordValueKey](self->_db, "mergeableRecordValueKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BMCloudKitSyncEngine mergeableRecordValueKey](self, "mergeableRecordValueKey"));
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    v8 = __biome_log_for_category(11);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BMCloudKitSyncEngine mergeableRecordValueKey](self, "mergeableRecordValueKey"));
      *(_DWORD *)buf = 138543362;
      v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "transitioning records over to new CKMergeableRecordValue with key %{public}@", buf, 0xCu);

    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v23 = v4;
    v11 = v4;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v15);
          v17 = objc_autoreleasePoolPush();
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "streamConfiguration"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "syncIdentifier"));

          if (!-[BMSyncDatabase clearCKRecordLocalMergeableValueAndSetToSyncForZone:](self->_db, "clearCKRecordLocalMergeableValueAndSetToSyncForZone:", v19))
          {
            v20 = __biome_log_for_category(11);
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543362;
              v30 = v19;
              _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "failed to reset records for stream %{public}@ when transitioning to new CKMergeableRecordValue", buf, 0xCu);
            }

          }
          objc_autoreleasePoolPop(v17);
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }

    -[BMSyncDatabase clearCKSyncEngineMetaData](self->_db, "clearCKSyncEngineMetaData");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BMCloudKitSyncEngine mergeableRecordValueKey](self, "mergeableRecordValueKey"));
    -[BMSyncDatabase setMergeableRecordValueKey:](self->_db, "setMergeableRecordValueKey:", v22);

    v4 = v23;
  }

}

- (void)uploadChangesWithError:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  unsigned int v18;
  BMSyncDatabase *db;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  BMCloudKitSyncEngine *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  id v40;
  uint64_t v41;
  NSObject *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  CKSyncEngine *ckSyncEngine;
  id v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *context;
  void *v55;
  void *v56;
  id v57;
  BMCloudKitSyncEngine *v58;
  void *v59;
  _QWORD v60[5];
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  id v73;
  _BYTE v74[128];
  _BYTE v75[128];

  v48 = a3;
  v57 = objc_alloc_init((Class)NSMutableSet);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMDistributedSyncMultiStreamManager distributedSyncManagers](self->_syncManager, "distributedSyncManagers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  v58 = self;
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v67;
    v49 = *(_QWORD *)v67;
    v50 = v5;
    do
    {
      v9 = 0;
      v51 = v7;
      do
      {
        if (*(_QWORD *)v67 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)v9);
        v11 = objc_autoreleasePoolPush();
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "streamConfiguration"));
        if (sub_1000267D0(v12))
        {
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "syncIdentifier"));
          v56 = v12;
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "streamIdentifier"));
          v59 = v10;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localSiteIdentifier"));
          v16 = __biome_log_for_category(11);
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v71 = v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "ingest events from stream: %{public}@", buf, 0xCu);
          }
          v55 = (void *)v14;

          context = objc_autoreleasePoolPush();
          v18 = -[BMCloudKitSyncEngine isSiriCloudSyncEnabled](self, "isSiriCloudSyncEnabled");
          db = self->_db;
          if (v18)
          {
            -[BMSyncDatabase enableAllCKSyncRecordsPreviouslyDisabledForSite:stream:](self->_db, "enableAllCKSyncRecordsPreviouslyDisabledForSite:stream:", v15, v13);
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "streamCRDT"));
            objc_msgSend(v20, "ingestNewChangesForSite:transportType:", v15, 3);

            v21 = (void *)v13;
            v22 = -[BMCloudKitSyncEngine newHighestDeletedLocationRecordIDFor:stream:](self, "newHighestDeletedLocationRecordIDFor:stream:", v15, v13);
            if (v22)
              objc_msgSend(v57, "addObject:", v22);
            v52 = v11;
            v53 = v9;
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase CKAtomRowSiteIdentifiers](self->_db, "CKAtomRowSiteIdentifiers"));
            v62 = 0u;
            v63 = 0u;
            v64 = 0u;
            v65 = 0u;
            v24 = v23;
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v63;
              do
              {
                for (i = 0; i != v26; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v63 != v27)
                    objc_enumerationMutation(v24);
                  v29 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
                  v30 = objc_autoreleasePoolPush();
                  if ((objc_msgSend(v15, "isEqual:", v29) & 1) == 0)
                  {
                    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "streamCRDT"));
                    objc_msgSend(v31, "ingestNewChangesForSite:transportType:", v29, 3);

                    self = v58;
                    v32 = -[BMCloudKitSyncEngine newHighestDeletedLocationRecordIDFor:stream:](v58, "newHighestDeletedLocationRecordIDFor:stream:", v29, v21);

                    if (v32)
                    {
                      objc_msgSend(v57, "addObject:", v32);
                      v22 = v32;
                    }
                    else
                    {
                      v22 = 0;
                    }
                  }
                  objc_autoreleasePoolPop(v30);
                }
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
              }
              while (v26);
            }

            v8 = v49;
            v5 = v50;
            v7 = v51;
            v11 = v52;
            v9 = v53;
          }
          else
          {
            v21 = (void *)v13;
            v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "localSiteIdentifier"));
            -[BMSyncDatabase disableAllCKSyncRecordsForSite:stream:](db, "disableAllCKSyncRecordsForSite:stream:", v22, v21);
          }

          objc_autoreleasePoolPop(context);
          v12 = v56;
        }

        objc_autoreleasePoolPop(v11);
        v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    }
    while (v7);
  }

  v33 = self;
  v34 = objc_autoreleasePoolPush();
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase ckRecordsToSyncToCloudKitForZone:](v33->_db, "ckRecordsToSyncToCloudKitForZone:", 0));
  objc_msgSend(v57, "addObjectsFromArray:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase gatherAllCKSyncRecordRecordsToBeDeleted](v33->_db, "gatherAllCKSyncRecordRecordsToBeDeleted"));
  objc_autoreleasePoolPop(v34);
  v37 = __biome_log_for_category(11);
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v39 = objc_msgSend(v57, "count");
    v40 = objc_msgSend(v36, "count");
    *(_DWORD *)buf = 134218240;
    v71 = (uint64_t)v39;
    v72 = 2048;
    v73 = v40;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "syncNowWithReason found %lu records to sync and %lu records to delete", buf, 0x16u);
  }

  if (v36)
    objc_msgSend(v57, "minusSet:", v36);
  if (objc_msgSend(v57, "count") || objc_msgSend(v36, "count"))
  {
    v41 = __biome_log_for_category(11);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v43 = objc_msgSend(v57, "count");
      v44 = objc_msgSend(v36, "count");
      *(_DWORD *)buf = 134218240;
      v71 = (uint64_t)v43;
      v72 = 2048;
      v73 = v44;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "syncNowWithReason after removing duplicates, sending CKSyncEngine %lu records to sync and %lu records to delete", buf, 0x16u);
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "allObjects"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "allObjects"));
    -[CKSyncEngine addRecordIDsToSave:recordIDsToDelete:](v58->_ckSyncEngine, "addRecordIDsToSave:recordIDsToDelete:", v45, v46);
    ckSyncEngine = v58->_ckSyncEngine;
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_100027BF4;
    v60[3] = &unk_100069558;
    v60[4] = v58;
    v61 = v48;
    -[CKSyncEngine modifyPendingChangesWithCompletionHandler:](ckSyncEngine, "modifyPendingChangesWithCompletionHandler:", v60);

  }
  else
  {
    (*((void (**)(id, _QWORD))v48 + 2))(v48, 0);
  }

}

- (BOOL)isManateeAvailable:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    switch((unint64_t)objc_msgSend(v3, "accountStatus"))
    {
      case 0uLL:
      case 2uLL:
      case 3uLL:
        v5 = __biome_log_for_category(11);
        v6 = objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          sub_100043370();
        goto LABEL_17;
      case 1uLL:
        v9 = objc_msgSend(v4, "deviceToDeviceEncryptionAvailability");
        if ((v9 & 1) == 0)
          goto LABEL_13;
        v10 = __biome_log_for_category(11);
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "This account is eligible to sync with manatee containers", buf, 2u);
        }

        if ((v9 & 2) == 0)
        {
LABEL_13:
          v12 = __biome_log_for_category(11);
          v6 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            sub_1000433D0();
          goto LABEL_17;
        }
        v16 = __biome_log_for_category(11);
        v6 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Manatee is available on the current device", v17, 2u);
        }
        v14 = 1;
        break;
      case 4uLL:
        v13 = __biome_log_for_category(11);
        v6 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          sub_100043430();
        goto LABEL_17;
      default:
        v8 = __biome_log_for_category(11);
        v6 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          sub_100043310();
        goto LABEL_17;
    }
  }
  else
  {
    v7 = __biome_log_for_category(11);
    v6 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000432E4();
LABEL_17:
    v14 = 0;
  }

  return v14;
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  CKContainer *container;
  _QWORD v7[5];
  id v8;
  _QWORD block[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000281B4;
  block[3] = &unk_1000695A8;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync((dispatch_queue_t)queue, block);
  if (*((_BYTE *)v11 + 24))
  {
    container = self->_container;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100028428;
    v7[3] = &unk_1000695D0;
    v7[4] = self;
    v8 = v4;
    -[CKContainer accountInfoWithCompletionHandler:](container, "accountInfoWithCompletionHandler:", v7);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }
  _Block_object_dispose(&v10, 8);

}

- (void)syncSessionDidStartWithReason:(unint64_t)a3
{
  void *v5;
  BMSyncSessionMetricsCollector *metricsCollector;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncSessionMetricsCollector sessionContext](self->_metricsCollector, "sessionContext"));
  -[BMCloudKitSyncEngine setSessionContext:](self, "setSessionContext:", v5);

  metricsCollector = self->_metricsCollector;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BMCloudKitSyncEngine sessionContext](self, "sessionContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sessionID"));
  -[BMSyncSessionMetricsCollector recordSessionStart:transport:reason:isReciprocal:](metricsCollector, "recordSessionStart:transport:reason:isReciprocal:", v7, 3, a3, 0);

}

- (void)syncSessionDidEnd
{
  BMSyncSessionMetricsCollector *metricsCollector;
  void *v4;
  void *v5;
  void *v6;
  BMSyncDatabase *db;
  NSDate *v8;

  metricsCollector = self->_metricsCollector;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMCloudKitSyncEngine sessionContext](self, "sessionContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase lastCloudKitSyncDate](self->_db, "lastCloudKitSyncDate"));
  -[BMSyncSessionMetricsCollector recordSessionEnd:lastSyncDate:](metricsCollector, "recordSessionEnd:lastSyncDate:", v5, v6);

  -[BMCloudKitSyncEngine setSessionContext:](self, "setSessionContext:", 0);
  db = self->_db;
  v8 = objc_opt_new(NSDate);
  -[BMSyncDatabase setLastCloudKitSyncDate:](db, "setLastCloudKitSyncDate:", v8);

}

- (void)syncEngine:(id)a3 zoneWithIDChanged:(id)a4
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a4;
  v5 = __biome_log_for_category(11);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneName"));
    v8 = 138543362;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "zoneWithIDChanged: %{public}@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)syncEngine:(id)a3 failedToFetchChangesForRecordZoneID:(id)a4 error:(id)a5
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;

  v5 = a4;
  v6 = __biome_log_for_category(11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneName"));
    v9 = 138543362;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "failedToFetchChangesForRecordZoneID: %{public}@", (uint8_t *)&v9, 0xCu);

  }
}

- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BMCloudKitSyncEngine streamConfigurationForZoneID:](self, "streamConfigurationForZoneID:", v5));
  v7 = sub_1000267D0(v6);
  v8 = __biome_log_for_category(11);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneName"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "streamIdentifier"));
    v12 = (void *)v11;
    v13 = CFSTR("NO");
    v15 = 138543874;
    v16 = v10;
    v17 = 2114;
    if (v7)
      v13 = CFSTR("YES");
    v18 = v11;
    v19 = 2114;
    v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "shouldFetchChangesForZoneID: %{public}@ (%{public}@) returning: %{public}@", (uint8_t *)&v15, 0x20u);

  }
  return v7;
}

- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  BMStreamCRDTLocation *v11;
  void *v12;
  void *v13;
  void *v14;
  BMStreamCRDTLocation *v15;
  OS_dispatch_queue *queue;
  BMStreamCRDTLocation *v17;
  _QWORD v18[5];
  BMStreamCRDTLocation *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;

  v5 = a4;
  v6 = __biome_log_for_category(11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
    *(_DWORD *)buf = 138543618;
    v21 = v8;
    v22 = 2114;
    v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "didDeleteRecordWithID: %{public}@ in zone: %{public}@", buf, 0x16u);

  }
  v11 = [BMStreamCRDTLocation alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordName"));
  v15 = -[BMStreamCRDTLocation initWithZoneName:recordName:](v11, "initWithZoneName:recordName:", v13, v14);

  queue = self->_queue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100028A74;
  v18[3] = &unk_100068E08;
  v18[4] = self;
  v19 = v15;
  v17 = v15;
  dispatch_sync((dispatch_queue_t)queue, v18);

}

- (BOOL)isRecordNewerThanMostRecentDeleteForSiteIdentifier:(id)a3
{
  id v4;
  BMStreamCRDTLocation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BMStreamCRDTLocation *v11;
  BMSyncDatabase *db;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  BOOL v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;

  v4 = a3;
  v5 = [BMStreamCRDTLocation alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordName"));
  v11 = -[BMStreamCRDTLocation initWithZoneName:recordName:](v5, "initWithZoneName:recordName:", v8, v10);

  if (v11)
  {
    db = self->_db;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation siteIdentifier](v11, "siteIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation streamName](v11, "streamName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase highestDeletedLocationForSiteIdentifier:inStream:](db, "highestDeletedLocationForSiteIdentifier:inStream:", v13, v14));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "location"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "day"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation day](v11, "day"));
      v19 = objc_msgSend(v17, "compare:", v18);

      v20 = v19 == (id)-1;
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "zoneID"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[BMCloudKitSyncEngine streamConfigurationForZoneID:](self, "streamConfigurationForZoneID:", v24));

      -[BMStreamCRDTLocation secondsUntilExpirationWithStreamConfiguration:](v11, "secondsUntilExpirationWithStreamConfiguration:", v25);
      v20 = v26 > 0.0;

    }
  }
  else
  {
    v21 = __biome_log_for_category(11);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      sub_100043540();

    v20 = 0;
  }

  return v20;
}

- (void)handleSyncRecordDidFetchRecord:(id)a3
{
  OS_dispatch_queue *queue;
  id v5;
  _QWORD block[4];
  id v7;
  BMCloudKitSyncEngine *v8;

  v5 = a3;
  if (-[BMCloudKitSyncEngine isSiriCloudSyncEnabled](self, "isSiriCloudSyncEnabled"))
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100028D24;
    block[3] = &unk_100068E08;
    v7 = v5;
    v8 = self;
    dispatch_sync((dispatch_queue_t)queue, block);

  }
}

- (void)handleZoneVersionDidFetchRecord:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[4];
  id v8;
  BMCloudKitSyncEngine *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002914C;
  block[3] = &unk_100068E08;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)handleHighestDeletedLocationDidFetchRecord:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[4];
  id v8;
  BMCloudKitSyncEngine *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000292D0;
  block[3] = &unk_100068E08;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  void *v15;

  v5 = a4;
  v6 = __biome_log_for_category(11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
    v14 = 138543362;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "didFetchRecord: %{public}@", (uint8_t *)&v14, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordType"));
  v11 = sub_1000268F8(v10);

  switch(v11)
  {
    case 3:
      -[BMCloudKitSyncEngine handleHighestDeletedLocationDidFetchRecord:](self, "handleHighestDeletedLocationDidFetchRecord:", v5);
      break;
    case 2:
      -[BMCloudKitSyncEngine handleZoneVersionDidFetchRecord:](self, "handleZoneVersionDidFetchRecord:", v5);
      break;
    case 1:
      -[BMCloudKitSyncEngine handleSyncRecordDidFetchRecord:](self, "handleSyncRecordDidFetchRecord:", v5);
      break;
    default:
      v12 = __biome_log_for_category(11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        sub_1000436D4(v5, v13);

      break;
  }

}

- (void)handleDidSaveRecordZoneVersionRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  OS_dispatch_queue *queue;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("zoneVersionUUID")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneName"));

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029770;
  block[3] = &unk_1000695F8;
  block[4] = self;
  v14 = v4;
  v15 = v5;
  v16 = v8;
  v10 = v8;
  v11 = v5;
  v12 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)handleDidSaveRecordHighestDeletedLocation:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002983C;
  block[3] = &unk_100068E08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)handleDidSaveRecordSyncRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  OS_dispatch_queue *queue;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneName"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("crdtDeleted")));
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000299B4;
  block[3] = &unk_100069620;
  block[4] = self;
  v17 = v4;
  v18 = v10;
  v19 = v9;
  v20 = v7;
  v12 = v7;
  v13 = v9;
  v14 = v10;
  v15 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)syncEngine:(id)a3 didSaveRecord:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneName"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordName"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordType"));
  v12 = sub_1000268F8(v11);

  v13 = __biome_log_for_category(11);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordType"));
    v19 = 138543874;
    v20 = v10;
    v21 = 2114;
    v22 = v15;
    v23 = 2114;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "didSaveRecord: %{public}@ recordType: %{public}@ zone: %{public}@", (uint8_t *)&v19, 0x20u);

  }
  switch(v12)
  {
    case 3:
      -[BMCloudKitSyncEngine handleDidSaveRecordHighestDeletedLocation:](self, "handleDidSaveRecordHighestDeletedLocation:", v5);
      break;
    case 2:
      -[BMCloudKitSyncEngine handleDidSaveRecordZoneVersionRecord:](self, "handleDidSaveRecordZoneVersionRecord:", v5);
      break;
    case 1:
      -[BMCloudKitSyncEngine handleDidSaveRecordSyncRecord:](self, "handleDidSaveRecordSyncRecord:", v5);
      break;
    default:
      v16 = __biome_log_for_category(11);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordType"));
        v19 = 138543874;
        v20 = v10;
        v21 = 2114;
        v22 = v18;
        v23 = 2114;
        v24 = v8;
        _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "didSaveRecord: %{public}@ unknown recordType: %{public}@ zone: %{public}@", (uint8_t *)&v19, 0x20u);

      }
      break;
  }

}

- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  OS_dispatch_queue *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "zoneID", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneName"));

  v7 = __biome_log_for_category(11);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "didSaveRecordZone: %{public}@", buf, 0xCu);
  }

  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002A154;
  v11[3] = &unk_100068E08;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  dispatch_sync((dispatch_queue_t)queue, v11);

}

- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4
{
  id v5;
  OS_dispatch_queue *queue;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A240;
  block[3] = &unk_100068E08;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v5 = a4;
  v6 = __biome_log_for_category(11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "failedToDeleteRecordWithID: %{public}@, zone:%{public}@", (uint8_t *)&v11, 0x16u);

  }
}

- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  OS_dispatch_queue *queue;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "zoneID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneName"));

  v10 = __biome_log_for_category(11);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v17 = v9;
    v18 = 2114;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "failedToSaveRecordZone:%{public}@ error:%{public}@", buf, 0x16u);
  }

  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002A4B0;
  v14[3] = &unk_100068E08;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  dispatch_sync((dispatch_queue_t)queue, v14);

}

- (void)handleZoneReset:(id)a3
{
  OS_dispatch_queue *queue;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  _BOOL4 v10;
  id v11;

  v11 = a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase ckZoneForZoneName:](self->_db, "ckZoneForZoneName:", v11));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attemptedRecoveryDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "timeIntervalSinceDate:", v6);
    v10 = v9 > 14400.0;
  }
  else
  {
    v10 = 1;
  }
  if (!objc_msgSend(v5, "recoveryState") && v10)
    -[BMSyncDatabase ckZoneSetAttemptedRecoveryDate:state:forZoneName:](self->_db, "ckZoneSetAttemptedRecoveryDate:state:forZoneName:", v8, 1, v11);

}

- (void)handleFailedToSaveSyncRecordUnknownItem:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A710;
  block[3] = &unk_100068E08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)handleFailedToSaveSyncRecordResaveRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  OS_dispatch_queue *queue;
  id v8;
  id v9;
  id v10;
  CKSyncEngine *ckSyncEngine;
  void *v12;
  void *v13;
  id v14;
  CKSyncEngine *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  BMCloudKitSyncEngine *v26;
  id v27;
  _QWORD v28[2];
  id v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));

  if (v6)
  {
    queue = self->_queue;
    v22 = _NSConcreteStackBlock;
    v23 = 3221225472;
    v24 = sub_10002A9D8;
    v25 = &unk_100068E08;
    v26 = self;
    v8 = v4;
    v27 = v8;
    dispatch_sync((dispatch_queue_t)queue, &v22);
    v9 = objc_alloc((Class)CKRecordZone);
    v10 = objc_msgSend(v9, "initWithZoneID:", v6, v22, v23, v24, v25, v26);
    ckSyncEngine = self->_ckSyncEngine;
    v29 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
    -[CKSyncEngine addRecordZonesToSave:recordZoneIDsToDelete:](ckSyncEngine, "addRecordZonesToSave:recordZoneIDsToDelete:", v12, 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));
    v14 = -[BMCloudKitSyncEngine newZoneVersionRecordIDForZone:](self, "newZoneVersionRecordIDForZone:", v13);

    v15 = self->_ckSyncEngine;
    v28[0] = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordID"));
    v28[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 2));
    -[CKSyncEngine addRecordIDsToSave:recordIDsToDelete:](v15, "addRecordIDsToSave:recordIDsToDelete:", v17, 0);

    v18 = __biome_log_for_category(11);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1000439B4(v6, v8);

  }
  else
  {
    v20 = __biome_log_for_category(11);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_100043920(v4, v21);

  }
}

- (void)handleFailedToSaveSyncRecordServerRecordChanged:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  OS_dispatch_queue *queue;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  BMCloudKitSyncEngine *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AB00;
  block[3] = &unk_1000695F8;
  v15 = v7;
  v16 = self;
  v17 = v9;
  v18 = v6;
  v11 = v6;
  v12 = v9;
  v13 = v7;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)handleFailedToSaveSyncRecordServerManateeDecryptionError:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  OS_dispatch_queue *queue;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));

  v10 = __biome_log_for_category(11);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    v17 = v9;
    v18 = 2114;
    v19 = v6;
    v20 = 2114;
    v21 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Manatee identity loss reported: record:%{public}@, zoneID:%{public}@, error:%{public}@", buf, 0x20u);
  }

  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002B0FC;
  v14[3] = &unk_100068E08;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  dispatch_sync((dispatch_queue_t)queue, v14);

}

- (void)handleFailedToSaveRecordSyncRecord:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  v8 = (uint64_t)objc_msgSend(v7, "code");
  if (v8 <= 25)
  {
    if (v8 == 11)
    {
      -[BMCloudKitSyncEngine handleFailedToSaveSyncRecordUnknownItem:](self, "handleFailedToSaveSyncRecordUnknownItem:", v6);
      goto LABEL_14;
    }
    if (v8 == 14)
    {
      -[BMCloudKitSyncEngine handleFailedToSaveSyncRecordServerRecordChanged:error:](self, "handleFailedToSaveSyncRecordServerRecordChanged:error:", v6, v7);
      goto LABEL_14;
    }
  }
  else
  {
    if (v8 == 26 || v8 == 28)
    {
      -[BMCloudKitSyncEngine handleFailedToSaveSyncRecordResaveRecord:](self, "handleFailedToSaveSyncRecordResaveRecord:", v6);
      goto LABEL_14;
    }
    if (v8 == 112)
    {
      -[BMCloudKitSyncEngine handleFailedToSaveSyncRecordServerManateeDecryptionError:error:](self, "handleFailedToSaveSyncRecordServerManateeDecryptionError:error:", v6, v7);
      goto LABEL_14;
    }
  }
  v9 = __biome_log_for_category(11);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    sub_100043BA0();

LABEL_14:
}

- (void)handleFailedToSaveRecordZoneVersion:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  BMCloudKitSyncEngine *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_10002B32C;
  v15 = &unk_100068E08;
  v16 = self;
  v9 = v6;
  v17 = v9;
  dispatch_sync((dispatch_queue_t)queue, &v12);
  if (-[BMCloudKitSyncEngine resaveRecordOnError:](self, "resaveRecordOnError:", objc_msgSend(v7, "code", v12, v13, v14, v15, v16)))
  {
    -[BMCloudKitSyncEngine resaveRecord:](self, "resaveRecord:", v9);
  }
  else
  {
    v10 = __biome_log_for_category(11);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      sub_100043C00();

  }
}

- (void)handleFailedToSaveRecordHighestDeletedLocation:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  BMCloudKitSyncEngine *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_10002B480;
  v15 = &unk_100068E08;
  v16 = self;
  v9 = v6;
  v17 = v9;
  dispatch_sync((dispatch_queue_t)queue, &v12);
  if (-[BMCloudKitSyncEngine resaveRecordOnError:](self, "resaveRecordOnError:", objc_msgSend(v7, "code", v12, v13, v14, v15, v16)))
  {
    -[BMCloudKitSyncEngine resaveRecord:](self, "resaveRecord:", v9);
  }
  else if (objc_msgSend(v7, "code") == (id)14)
  {
    -[BMCloudKitSyncEngine handleServerRecordChangedForHighestDeletedLocationError:](self, "handleServerRecordChangedForHighestDeletedLocationError:", v7);
  }
  else
  {
    v10 = __biome_log_for_category(11);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      sub_100043C60();

  }
}

- (BOOL)resaveRecordOnError:(int64_t)a3
{
  return a3 == 26 || a3 == 28;
}

- (void)resaveRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  CKSyncEngine *ckSyncEngine;
  void *v9;
  CKSyncEngine *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));

  if (v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)CKRecordZone), "initWithZoneID:", v6);
    ckSyncEngine = self->_ckSyncEngine;
    v17 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    -[CKSyncEngine addRecordZonesToSave:recordZoneIDsToDelete:](ckSyncEngine, "addRecordZonesToSave:recordZoneIDsToDelete:", v9, 0);

    v10 = self->_ckSyncEngine;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
    v16 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    -[CKSyncEngine addRecordIDsToSave:recordIDsToDelete:](v10, "addRecordIDsToSave:recordIDsToDelete:", v12, 0);

    v13 = __biome_log_for_category(11);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000439B4(v6, v4);

  }
  else
  {
    v15 = __biome_log_for_category(11);
    v7 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100043920(v4, v7);
  }

}

- (void)handleServerRecordChangedForHighestDeletedLocationError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  CKSyncEngine *ckSyncEngine;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CKRecordChangedErrorServerRecordKey));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CKRecordChangedErrorClientRecordKey));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("day")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("day")));
  v11 = objc_msgSend(v10, "longValue");
  if ((uint64_t)v11 > (uint64_t)objc_msgSend(v9, "longValue"))
  {
    ckSyncEngine = self->_ckSyncEngine;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordID"));
    v15 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    -[CKSyncEngine addRecordIDsToSave:recordIDsToDelete:](ckSyncEngine, "addRecordIDsToSave:recordIDsToDelete:", v14, 0);

  }
}

- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));

  v12 = __biome_log_for_category(11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recordName"));
    v19 = 138543874;
    v20 = v14;
    v21 = 2114;
    v22 = v16;
    v23 = 2114;
    v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "failedToSaveRecord: %{public}@, %{public}@ %{public}@", (uint8_t *)&v19, 0x20u);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordType"));
  v18 = sub_1000268F8(v17);

  __asm { BR              X9 }
}

- (id)handleHighestDeletedLocationRecordToSaveForRecordID:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  BMCloudKitSyncEngine *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_10002BA78;
  v17 = sub_10002BA88;
  v18 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BA90;
  block[3] = &unk_100069648;
  v10 = v4;
  v11 = self;
  v12 = &v13;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)handleZoneVersionRecordToSaveForRecordID:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10002BA78;
  v16 = sub_10002BA88;
  v17 = 0;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002BD78;
  v9[3] = &unk_100069670;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)handleSyncRecordRecordToSaveForRecordID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  OS_dispatch_queue *queue;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  uint64_t *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_10002BA78;
  v29 = sub_10002BA88;
  v30 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_10002BA78;
  v23[4] = sub_10002BA88;
  v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_10002BA78;
  v21[4] = sub_10002BA88;
  v22 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneName"));

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BFEC;
  block[3] = &unk_100069698;
  block[4] = self;
  v15 = v7;
  v16 = v5;
  v17 = v4;
  v18 = &v25;
  v19 = v23;
  v20 = v21;
  v9 = v4;
  v10 = v5;
  v11 = v7;
  dispatch_sync((dispatch_queue_t)queue, block);
  v12 = (id)v26[5];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(&v25, 8);
  return v12;
}

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  void *v14;
  int v16;
  void *v17;

  v5 = a4;
  v6 = __biome_log_for_category(11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordName"));
    v16 = 138543362;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "recordToSaveForRecordID %{public}@", (uint8_t *)&v16, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordName"));
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("zoneVersion"));

  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[BMCloudKitSyncEngine handleZoneVersionRecordToSaveForRecordID:](self, "handleZoneVersionRecordToSaveForRecordID:", v5));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordName"));
    v13 = objc_msgSend(v12, "containsString:", CFSTR(","));

    if (v13)
      v11 = objc_claimAutoreleasedReturnValue(-[BMCloudKitSyncEngine handleSyncRecordRecordToSaveForRecordID:](self, "handleSyncRecordRecordToSaveForRecordID:", v5));
    else
      v11 = objc_claimAutoreleasedReturnValue(-[BMCloudKitSyncEngine handleHighestDeletedLocationRecordToSaveForRecordID:](self, "handleHighestDeletedLocationRecordToSaveForRecordID:", v5));
  }
  v14 = (void *)v11;

  return v14;
}

- (void)syncEngine:(id)a3 failedToDeleteRecordZoneWithID:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  OS_dispatch_queue *queue;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "zoneName"));
  v9 = __biome_log_for_category(11);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2114;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "failedToDeleteRecordZoneWithID: %{public}@ error: %{public}@", buf, 0x16u);
  }

  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002C958;
  v13[3] = &unk_100068E08;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  dispatch_sync((dispatch_queue_t)queue, v13);

}

- (void)syncEngine:(id)a3 didDeleteRecordZoneWithID:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  OS_dispatch_queue *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneName"));
  v7 = __biome_log_for_category(11);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "didDeleteRecordZoneWithID: %{public}@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CAE4;
  block[3] = &unk_1000696C0;
  block[4] = self;
  v13 = v6;
  v14 = v5;
  v10 = v5;
  v11 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  OS_dispatch_queue *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;

  v5 = a4;
  v6 = __biome_log_for_category(11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneName"));
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "zoneWithIDWasDeleted: %{public}@", buf, 0xCu);

  }
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002CEAC;
  v11[3] = &unk_100068E08;
  v11[4] = self;
  v12 = v5;
  v10 = v5;
  dispatch_sync((dispatch_queue_t)queue, v11);

}

- (void)handleRecordWithIDDeletedSyncRecord:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[4];
  id v8;
  BMCloudKitSyncEngine *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CFA0;
  block[3] = &unk_100068E08;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;

  v7 = a4;
  v8 = a5;
  v9 = __biome_log_for_category(11);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordName"));
    v12 = 138543618;
    v13 = v11;
    v14 = 2114;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "recordWithIDWasDeleted: %{public}@, type=%{public}@", (uint8_t *)&v12, 0x16u);

  }
  if (sub_1000268F8(v8) == 1)
    -[BMCloudKitSyncEngine handleRecordWithIDDeletedSyncRecord:](self, "handleRecordWithIDDeletedSyncRecord:", v7);

}

- (void)syncEngineWillBeginFetchingChanges:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = __biome_log_for_category(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "syncEngineWillBeginFetchingChanges", v5, 2u);
  }

}

- (void)syncEngineDidEndFetchingChanges:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  OS_dispatch_queue *queue;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = __biome_log_for_category(11);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "syncEngineDidEndFetchingChanges", buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D344;
  block[3] = &unk_100068B38;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)syncEngineWillBeginModifyingPendingChanges:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = __biome_log_for_category(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "syncEngineWillBeginModifyingPendingChanges", v5, 2u);
  }

}

- (void)syncEngineDidEndModifyingPendingChanges:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  OS_dispatch_queue *queue;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = __biome_log_for_category(11);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "syncEngineDidEndModifyingPendingChanges", buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E0B8;
  block[3] = &unk_100068B38;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (BMSyncSessionMetricsCollector)metricsCollector
{
  return self->_metricsCollector;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CKSyncEngineDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (CKSyncEngineConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (CKSyncEngine)ckSyncEngine
{
  return self->_ckSyncEngine;
}

- (void)setCkSyncEngine:(id)a3
{
  objc_storeStrong((id *)&self->_ckSyncEngine, a3);
}

- (NSString)mergeableRecordValueKey
{
  return self->_mergeableRecordValueKey;
}

- (BMSyncSessionContext)sessionContext
{
  return self->_sessionContext;
}

- (void)setSessionContext:(id)a3
{
  objc_storeStrong((id *)&self->_sessionContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionContext, 0);
  objc_storeStrong((id *)&self->_mergeableRecordValueKey, 0);
  objc_storeStrong((id *)&self->_ckSyncEngine, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_metricsCollector, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_dataReceivedFromSiteIdentifiers, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
}

@end
