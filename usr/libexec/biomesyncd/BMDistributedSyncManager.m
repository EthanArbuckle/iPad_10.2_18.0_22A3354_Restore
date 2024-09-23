@implementation BMDistributedSyncManager

- (BMDistributedSyncManager)initWithStreamConfiguration:(id)a3 streamCRDT:(id)a4 database:(id)a5 localSiteIdentifier:(id)a6 changeReporter:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  BMDistributedSyncManager *v18;
  BMDistributedSyncManager *v19;
  NSString *v20;
  NSString *localSiteIdentifier;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)BMDistributedSyncManager;
  v18 = -[BMDistributedSyncManager init](&v23, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_streamConfiguration, a3);
    objc_storeStrong((id *)&v19->_streamCRDT, a4);
    objc_storeStrong((id *)&v19->_db, a5);
    v20 = (NSString *)objc_msgSend(v16, "copy");
    localSiteIdentifier = v19->_localSiteIdentifier;
    v19->_localSiteIdentifier = v20;

    objc_storeStrong((id *)&v19->_changeReporter, a7);
  }

  return v19;
}

- (void)updateClockVectorByUnionWithUnseenSiteIdentifiers:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSIndexSet *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableSet *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSIndexSet *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableSet);
  v6 = objc_opt_new(NSMutableSet);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCKCRDT clockVector](self->_streamCRDT, "clockVector"));
  v8 = objc_alloc((Class)CKDistributedSiteIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](self->_localSiteIdentifier, "dataUsingEncoding:", 4));
  v10 = objc_msgSend(v8, "initWithIdentifier:", v9);

  if (!objc_msgSend(v7, "timestampCount") || !objc_msgSend(v7, "timestampCountForSiteIdentifier:", v10))
  {
    v11 = sub_10000843C(0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v7, "addClockValuesInIndexSet:forSiteIdentifier:", v12, v10);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allSiteIdentifiers"));
  -[NSMutableSet unionSet:](v5, "unionSet:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allSiteIdentifiers"));
  -[NSMutableSet unionSet:](v6, "unionSet:", v14);

  -[NSMutableSet minusSet:](v5, "minusSet:", v6);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = v5;
  v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v19);
        v21 = sub_10000843C(0);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        objc_msgSend(v4, "addClockValuesInIndexSet:forSiteIdentifier:", v22, v20, (_QWORD)v23);

        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }

}

- (id)clockVector
{
  return -[BMStreamCKCRDT clockVector](self->_streamCRDT, "clockVector");
}

- (void)mergeAtomBatch:(id)a3 deletedLocations:(id)a4 sessionContext:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  BMSyncChangeReporter *changeReporter;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  _UNKNOWN **v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  id v38;
  id v39;
  id obj;
  _QWORD block[5];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE buf[24];
  char v52;
  _BYTE v53[128];
  _BYTE v54[128];

  v8 = a3;
  v9 = a4;
  v38 = a5;
  v10 = __biome_log_for_category(11);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = objc_msgSend(v8, "count");
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "mergeAtomBatches: %lu deletedLocations: %@", buf, 0x16u);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v48 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
        v17 = objc_autoreleasePoolPush();
        -[BMStreamCKCRDT handleDeletedLocation:deleteCKRecord:](self->_streamCRDT, "handleDeletedLocation:deleteCKRecord:", v16, 0);
        changeReporter = self->_changeReporter;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "streamName"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "siteIdentifier"));
        -[BMSyncChangeReporter streamUpdatedForStreamName:deviceIdentifier:error:](changeReporter, "streamUpdatedForStreamName:deviceIdentifier:error:", v19, v20, 0);

        objc_autoreleasePoolPop(v17);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v13);
  }

  v21 = __biome_log_for_category(11);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration streamIdentifier](self->_streamConfiguration, "streamIdentifier"));
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Merging atom batches into %@", buf, 0xCu);

  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v39 = v8;
  v24 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v44;
    v27 = &BMDevicePlatformFromModelString_ptr;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v44 != v26)
          objc_enumerationMutation(v39);
        v29 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v28);
        v30 = objc_autoreleasePoolPush();
        v31 = objc_alloc((Class)v27[42]);
        v42 = 0;
        v32 = objc_msgSend(v31, "initWithData:error:", v29, &v42);
        v33 = v42;
        if (v33)
          v34 = 1;
        else
          v34 = v32 == 0;
        if (v34)
        {
          v35 = __biome_log_for_category(11);
          v36 = objc_claimAutoreleasedReturnValue(v35);
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v52 = 16;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10002EBDC;
          block[3] = &unk_100068AA0;
          block[4] = buf;
          if (qword_10007BE70 != -1)
            dispatch_once(&qword_10007BE70, block);
          v37 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
          _Block_object_dispose(buf, 8);
          if (os_log_type_enabled(v36, v37))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v33;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v29;
            _os_log_impl((void *)&_mh_execute_header, v36, v37, "Failed to instantiate CKAtomBatch, %@, %@", buf, 0x16u);
          }

          v27 = &BMDevicePlatformFromModelString_ptr;
        }
        else
        {
          -[BMStreamCKCRDT mergeAtomBatch:sessionContext:](self->_streamCRDT, "mergeAtomBatch:sessionContext:", v32, v38);
        }

        objc_autoreleasePoolPop(v30);
        v28 = (char *)v28 + 1;
      }
      while (v25 != v28);
      v25 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v25);
  }

}

- (id)atomBatchesInClockVector:(id)a3 ckFormatVersion:(unsigned __int8)a4 chunker:(id)a5 transportType:(unint64_t)a6
{
  uint64_t v7;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSMutableArray *v13;
  BMStreamCKCRDT *streamCRDT;
  NSMutableArray *v15;
  void *v16;
  _QWORD v18[4];
  NSMutableArray *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;

  v7 = a4;
  v9 = a3;
  v10 = a5;
  -[BMDistributedSyncManager updateClockVectorByUnionWithUnseenSiteIdentifiers:](self, "updateClockVectorByUnionWithUnseenSiteIdentifiers:", v9);
  v11 = __biome_log_for_category(11);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v9;
    v22 = 2048;
    v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Generating atom batch after clock: %@, version: %lu", buf, 0x16u);
  }

  v13 = objc_opt_new(NSMutableArray);
  streamCRDT = self->_streamCRDT;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002ED6C;
  v18[3] = &unk_100069780;
  v19 = v13;
  v15 = v13;
  -[BMStreamCKCRDT atomsInClockVector:ckFormatVersion:chunker:transportType:enumerateWithBlock:](streamCRDT, "atomsInClockVector:ckFormatVersion:chunker:transportType:enumerateWithBlock:", v9, v7, v10, 2, v18);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v15));
  return v16;
}

- (id)deletedLocations
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration syncIdentifier](self->_streamConfiguration, "syncIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase highestDeletedLocationsForStream:](self->_db, "highestDeletedLocationsForStream:", v3));

  return v4;
}

- (NSString)localSiteIdentifier
{
  return self->_localSiteIdentifier;
}

- (BMStreamConfiguration)streamConfiguration
{
  return self->_streamConfiguration;
}

- (BMStreamCKCRDT)streamCRDT
{
  return self->_streamCRDT;
}

- (BMSyncDatabase)db
{
  return self->_db;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeReporter, 0);
  objc_storeStrong((id *)&self->_localSiteIdentifier, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_streamCRDT, 0);
  objc_storeStrong((id *)&self->_streamConfiguration, 0);
}

@end
