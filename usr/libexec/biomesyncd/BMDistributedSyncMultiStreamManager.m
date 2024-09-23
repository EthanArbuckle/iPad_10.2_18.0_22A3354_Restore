@implementation BMDistributedSyncMultiStreamManager

+ (BMDistributedSyncMultiStreamManager)multiStreamManagerWithPrimaryDatabase:(id)a3 account:(id)a4 queue:(id)a5
{
  id v6;
  id v7;
  BMXPCSyncChangeReporter *v8;
  id v9;
  id v10;
  void *i;
  void *v12;
  id v13;
  id v14;
  void *v15;
  unsigned int v16;
  BMStreamCKCRDT *v17;
  BMStreamCRDTLocationDayAssigner *v18;
  NSObject *v19;
  BMDistributedSyncManager *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  BMDistributedSyncMultiStreamManager *v24;
  BMSyncDevicePeerStatusTracker *v26;
  id obj;
  BMSyncSessionMetricsCollector *v28;
  void *v29;
  NSMutableDictionary *v30;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];

  v6 = a3;
  v32 = a4;
  v7 = v6;
  v30 = objc_opt_new(NSMutableDictionary);
  v26 = -[BMSyncDevicePeerStatusTracker initWithDatabase:]([BMSyncDevicePeerStatusTracker alloc], "initWithDatabase:", v7);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDevicePeerStatusTracker localDeviceIdentifierCreatingIfNecessary](v26, "localDeviceIdentifierCreatingIfNecessary"));
  v28 = -[BMSyncSessionMetricsCollector initWithDatabase:]([BMSyncSessionMetricsCollector alloc], "initWithDatabase:", v7);
  v8 = objc_opt_new(BMXPCSyncChangeReporter);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[BMStreamSyncPolicy syncableStreamConfigurations](BMStreamSyncPolicy, "syncableStreamConfigurations"));
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v9)
  {
    v10 = v9;
    v31 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v31)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v13 = v32;
        v14 = v7;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "streamIdentifier"));
        v16 = objc_msgSend(&off_10006E7F8, "containsObject:", v15);

        if (v16)
        {

          v13 = 0;
        }
        if (v7)
        {
          v17 = [BMStreamCKCRDT alloc];
          v18 = objc_opt_new(BMStreamCRDTLocationDayAssigner);
          v19 = -[BMStreamCKCRDT initWithStreamConfiguration:locationAssignerPolicy:localSiteIdentifier:database:changeReporter:account:](v17, "initWithStreamConfiguration:locationAssignerPolicy:localSiteIdentifier:database:changeReporter:account:", v12, v18, v29, v14, v8, v13);

          -[NSObject setMetricsCollector:](v19, "setMetricsCollector:", v28);
          v20 = -[BMDistributedSyncManager initWithStreamConfiguration:streamCRDT:database:localSiteIdentifier:changeReporter:]([BMDistributedSyncManager alloc], "initWithStreamConfiguration:streamCRDT:database:localSiteIdentifier:changeReporter:", v12, v19, v14, v29, v8);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "syncIdentifier"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v30, "setObject:forKeyedSubscript:", v20, v21);

        }
        else
        {
          v22 = __biome_log_for_category(11);
          v19 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "streamIdentifier"));
            *(_DWORD *)buf = 138543362;
            v38 = v23;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Effective database for stream %{public}@ not available for current request", buf, 0xCu);

          }
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v10);
  }

  v24 = -[BMDistributedSyncMultiStreamManager initWithDistributedSyncManagers:peerStatusTracker:accountDatabase:]([BMDistributedSyncMultiStreamManager alloc], "initWithDistributedSyncManagers:peerStatusTracker:accountDatabase:", v30, v26, 0);
  -[BMDistributedSyncMultiStreamManager setMetricsCollector:](v24, "setMetricsCollector:", v28);

  return v24;
}

- (BMDistributedSyncMultiStreamManager)initWithDistributedSyncManagers:(id)a3 peerStatusTracker:(id)a4 accountDatabase:(id)a5
{
  id v8;
  id v9;
  id v10;
  BMDistributedSyncMultiStreamManager *v11;
  NSDictionary *v12;
  NSDictionary *distributedSyncManagers;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMDistributedSyncMultiStreamManager;
  v11 = -[BMDistributedSyncMultiStreamManager init](&v15, "init");
  if (v11)
  {
    v12 = (NSDictionary *)objc_msgSend(v8, "copy");
    distributedSyncManagers = v11->_distributedSyncManagers;
    v11->_distributedSyncManagers = v12;

    objc_storeStrong((id *)&v11->_peerStatusTracker, a4);
    objc_storeStrong((id *)&v11->_accountDatabase, a5);
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[BMSyncDatabase close](self->_accountDatabase, "close");
  v3.receiver = self;
  v3.super_class = (Class)BMDistributedSyncMultiStreamManager;
  -[BMDistributedSyncMultiStreamManager dealloc](&v3, "dealloc");
}

- (id)clockVectorForStreamsSupportingTransportType:(unint64_t)a3 direction:(unint64_t)a4 device:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  BMMultiStreamTimestampClockVector *v23;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v23 = objc_opt_new(BMMultiStreamTimestampClockVector);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_distributedSyncManagers, "allValues"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "streamConfiguration"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "syncPolicy"));
        v13 = objc_msgSend(v12, "supportsTransport:direction:", a3, a4);

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clockVector"));
          if (!objc_msgSend(v14, "timestampCount"))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDevicePeerStatusTracker localDeviceIdentifierCreatingIfNecessary](self->_peerStatusTracker, "localDeviceIdentifierCreatingIfNecessary"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataUsingEncoding:", 4));
            v17 = objc_msgSend(objc_alloc((Class)CKDistributedSiteIdentifier), "initWithIdentifier:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 0));
            objc_msgSend(v14, "addClockValuesInIndexSet:forSiteIdentifier:", v18, v17);

          }
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "streamConfiguration"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "syncIdentifierForTransport:", a3));

          -[BMMultiStreamTimestampClockVector setVectorClockTo:forStreamIdentifier:](v23, "setVectorClockTo:forStreamIdentifier:", v14, v20);
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

  return v23;
}

- (id)atomBatchesInClockVector:(id)a3 targetPlatform:(int64_t)a4 transportType:(unint64_t)a5 direction:(unint64_t)a6 ckFormatVersion:(unsigned __int8)a7 chunker:(id)a8
{
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t Description;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  unsigned int v35;
  NSMutableDictionary *v36;
  id v37;
  id v38;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;

  v35 = a7;
  v38 = a3;
  v37 = a8;
  v13 = a6;
  if (a6 != 2)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMDistributedSyncMultiStreamManager.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("direction == BMStreamSyncDirectionOutbound"));

  }
  v14 = __biome_log_for_category(11);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    Description = BMDevicePlatformGetDescription(a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue(Description);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v35));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "description"));
    *(_DWORD *)buf = 138412802;
    v47 = v17;
    v48 = 2112;
    v49 = v18;
    v50 = 2112;
    v51 = v19;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "atomBatchesInClockVector platform: %@, version: %@, clock: %@", buf, 0x20u);

  }
  v36 = objc_opt_new(NSMutableDictionary);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_distributedSyncManagers, "allValues"));
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v25 = objc_autoreleasePoolPush();
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "streamConfiguration"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "syncPolicy"));
        v28 = objc_msgSend(v27, "supportsSyncingWithPlatform:overTransport:inDirection:", a4, a5, v13);

        if (v28)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "streamConfiguration"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "syncIdentifierForTransport:", a5));

          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "timestampClockVectorForStreamIdentifier:", v30));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "atomBatchesInClockVector:ckFormatVersion:chunker:transportType:", v31, v35, v37, a5));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v32, v30);

        }
        objc_autoreleasePoolPop(v25);
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v21);
  }

  return v36;
}

- (void)mergeAtomBatches:(id)a3 deletedLocations:(id)a4 sessionContext:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSDictionary *distributedSyncManagers;
  void *v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  id obj;
  uint64_t v25;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *context;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint8_t v41[128];
  uint8_t buf[4];
  id v43;

  v7 = a3;
  v28 = a4;
  v27 = a5;
  v29 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  v9 = __biome_log_for_category(11);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v43 = objc_msgSend(v8, "count");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Merging %llu atom batches", buf, 0xCu);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v8;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v30)
  {
    v25 = *(_QWORD *)v37;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v11);
        context = objc_autoreleasePoolPush();
        distributedSyncManagers = self->_distributedSyncManagers;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](distributedSyncManagers, "objectForKeyedSubscript:", v14));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", v12));
        v17 = objc_opt_new(NSMutableArray);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v12));
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v33;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v33 != v21)
                objc_enumerationMutation(v18);
              v23 = -[BMStreamCRDTLocation initFromDictionary:]([BMStreamCRDTLocation alloc], "initFromDictionary:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v22));
              -[NSMutableArray addObject:](v17, "addObject:", v23);

              v22 = (char *)v22 + 1;
            }
            while (v20 != v22);
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v20);
        }
        objc_msgSend(v15, "mergeAtomBatch:deletedLocations:sessionContext:", v16, v17, v27);

        objc_autoreleasePoolPop(context);
        v11 = (char *)v11 + 1;
      }
      while (v11 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v30);
  }

}

- (id)deletedLocationsForTransportType:(unint64_t)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v21;
  NSMutableDictionary *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v23 = objc_opt_new(NSMutableDictionary);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_distributedSyncManagers, "allValues"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v4)
  {
    v5 = v4;
    v21 = *(_QWORD *)v29;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v6);
        v8 = objc_autoreleasePoolPush();
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "streamConfiguration"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "syncIdentifierForTransport:", a3));

        v11 = objc_opt_new(NSMutableArray);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deletedLocations"));
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v25;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v25 != v15)
                objc_enumerationMutation(v12);
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v16), "dictionaryRepresentation"));
              -[NSMutableArray addObject:](v11, "addObject:", v17);

              v16 = (char *)v16 + 1;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v14);
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v11));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v18, v10);

        objc_autoreleasePoolPop(v8);
        v6 = (char *)v6 + 1;
      }
      while (v6 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v5);
  }

  return v23;
}

- (BOOL)supportsSyncingWithPlatform:(int64_t)a3 overTransport:(unint64_t)a4 inDirection:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  BOOL v16;
  NSDictionary *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->_distributedSyncManagers;
  v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_distributedSyncManagers, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i)));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "streamConfiguration"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "syncPolicy"));
        v15 = objc_msgSend(v14, "supportsSyncingWithPlatform:overTransport:inDirection:", a3, a4, a5);

        if ((v15 & 1) != 0)
        {
          v16 = 1;
          goto LABEL_11;
        }
      }
      v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (NSDictionary)distributedSyncManagers
{
  return self->_distributedSyncManagers;
}

- (BMSyncDevicePeerStatusTracker)peerStatusTracker
{
  return self->_peerStatusTracker;
}

- (BMSyncSessionMetricsCollector)metricsCollector
{
  return self->_metricsCollector;
}

- (void)setMetricsCollector:(id)a3
{
  objc_storeStrong((id *)&self->_metricsCollector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsCollector, 0);
  objc_storeStrong((id *)&self->_peerStatusTracker, 0);
  objc_storeStrong((id *)&self->_distributedSyncManagers, 0);
  objc_storeStrong((id *)&self->_accountDatabase, 0);
}

@end
