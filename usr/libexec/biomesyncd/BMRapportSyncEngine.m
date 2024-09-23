@implementation BMRapportSyncEngine

- (BMRapportSyncEngine)initWithQueue:(id)a3 primarySyncManager:(id)a4 primaryDatabase:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMRapportSyncEngine *v12;
  BMRapportSyncEngine *v13;
  uint64_t v14;
  BMSyncDevicePeerStatusTracker *peerStatusTracker;
  uint64_t v16;
  BMSyncSessionMetricsCollector *metricsCollector;
  BMRapportManager *v18;
  BMRapportManager *rapportManager;
  NSMutableDictionary *v20;
  NSMutableDictionary *requestQueue;
  void *v22;
  void *v23;
  NSString *v24;
  NSString *localDeviceIdentifier;
  BMAtomBatchMaxBytes *v26;
  BMAtomBatchChunkerPolicy *atomBatchChunkerPolicy;
  objc_super v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)BMRapportSyncEngine;
  v12 = -[BMRapportSyncEngine init](&v29, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_primarySyncManager, a4);
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "peerStatusTracker"));
    peerStatusTracker = v13->_peerStatusTracker;
    v13->_peerStatusTracker = (BMSyncDevicePeerStatusTracker *)v14;

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metricsCollector"));
    metricsCollector = v13->_metricsCollector;
    v13->_metricsCollector = (BMSyncSessionMetricsCollector *)v16;

    objc_storeStrong((id *)&v13->_queue, a3);
    v18 = -[BMRapportManager initWithQueue:]([BMRapportManager alloc], "initWithQueue:", v9);
    rapportManager = v13->_rapportManager;
    v13->_rapportManager = v18;

    -[BMRapportManager setDelegate:](v13->_rapportManager, "setDelegate:", v13);
    v20 = objc_opt_new(NSMutableDictionary);
    requestQueue = v13->_requestQueue;
    v13->_requestQueue = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "peerStatusTracker"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localDeviceIdentifierCreatingIfNecessary"));
    v24 = (NSString *)objc_msgSend(v23, "copy");
    localDeviceIdentifier = v13->_localDeviceIdentifier;
    v13->_localDeviceIdentifier = v24;

    v26 = -[BMAtomBatchMaxBytes initWithMaxBytes:]([BMAtomBatchMaxBytes alloc], "initWithMaxBytes:", 0x200000);
    atomBatchChunkerPolicy = v13->_atomBatchChunkerPolicy;
    v13->_atomBatchChunkerPolicy = (BMAtomBatchChunkerPolicy *)v26;

    objc_storeStrong((id *)&v13->_primaryDatabase, a5);
  }

  return v13;
}

- (BMRapportSyncEngine)initWithQueue:(id)a3 primarySyncManager:(id)a4 rapportManager:(id)a5 atomBatchChunkerPolicy:(id)a6 primaryDatabase:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMRapportSyncEngine *v17;
  BMRapportSyncEngine *v18;
  uint64_t v19;
  BMSyncDevicePeerStatusTracker *peerStatusTracker;
  uint64_t v21;
  BMSyncSessionMetricsCollector *metricsCollector;
  NSMutableDictionary *v23;
  NSMutableDictionary *requestQueue;
  void *v25;
  void *v26;
  NSString *v27;
  NSString *localDeviceIdentifier;
  id v30;
  objc_super v31;

  v30 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)BMRapportSyncEngine;
  v17 = -[BMRapportSyncEngine init](&v31, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_primarySyncManager, a4);
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "peerStatusTracker"));
    peerStatusTracker = v18->_peerStatusTracker;
    v18->_peerStatusTracker = (BMSyncDevicePeerStatusTracker *)v19;

    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "metricsCollector"));
    metricsCollector = v18->_metricsCollector;
    v18->_metricsCollector = (BMSyncSessionMetricsCollector *)v21;

    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v18->_rapportManager, a5);
    -[BMRapportManager setDelegate:](v18->_rapportManager, "setDelegate:", v18);
    objc_storeStrong((id *)&v18->_atomBatchChunkerPolicy, a6);
    v23 = objc_opt_new(NSMutableDictionary);
    requestQueue = v18->_requestQueue;
    v18->_requestQueue = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "peerStatusTracker"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localDeviceIdentifierCreatingIfNecessary"));
    v27 = (NSString *)objc_msgSend(v26, "copy");
    localDeviceIdentifier = v18->_localDeviceIdentifier;
    v18->_localDeviceIdentifier = v27;

    objc_storeStrong((id *)&v18->_primaryDatabase, a7);
  }

  return v18;
}

- (void)startClient
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B55C;
  block[3] = &unk_100068B38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)startServer
{
  -[BMRapportSyncEngine startServerWithCompletion:](self, "startServerWithCompletion:", 0);
}

- (void)startServerWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B5E8;
  v7[3] = &unk_100068B60;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);

}

- (void)_startServerWithCompletion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BMRapportSyncEngine registerRequests](self, "registerRequests");
  -[BMRapportManager start](self->_rapportManager, "start");
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (void)syncNowWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000B6FC;
  v13[3] = &unk_100068B88;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async((dispatch_queue_t)queue, v13);

}

- (void)syncNowWithDevices:(id)a3 reason:(unint64_t)a4 activity:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  OS_dispatch_queue *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B7E8;
  block[3] = &unk_100068BB0;
  block[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a4;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async((dispatch_queue_t)queue, block);

}

- (void)completeRequestIfDeliveredToAllNearbyDevices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableSet *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  void *v16;
  NSMutableSet *v17;
  NSMutableSet *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSMutableArray *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  BMRapportSyncEngine *v38;
  _QWORD v39[4];
  id v40;
  NSMutableArray *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  NSMutableSet *v55;
  _BYTE v56[128];
  _BYTE v57[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v38 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportManager discoveredDevices](self->_rapportManager, "discoveredDevices"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

  v7 = objc_opt_new(NSMutableSet);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deliveredToDevices"));
        v15 = objc_msgSend(v14, "containsObject:", v13);

        if (v15)
          -[NSMutableSet addObject:](v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v8, "isSubsetOfSet:", v7))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deliveredToDevices"));
    -[NSMutableSet unionSet:](v7, "unionSet:", v16);

    v17 = objc_opt_new(NSMutableSet);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v18 = v7;
    v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(_QWORD *)v43 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)j);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bmDeviceIdentifier"));

          if (v24)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bmDeviceIdentifier"));
            -[NSMutableSet addObject:](v17, "addObject:", v25);

          }
        }
        v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
      }
      while (v20);
    }

    v26 = __biome_log_for_category(11);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](v38, "siteSuffix"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "inFlightToDevices"));
      *(_DWORD *)buf = 138412546;
      v51 = v28;
      v52 = 2112;
      v53 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: completing request, still inflight: %@", buf, 0x16u);

    }
    v30 = objc_opt_new(NSMutableArray);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "errorFromDevice"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10000BC64;
    v39[3] = &unk_100068BD8;
    v32 = v4;
    v40 = v32;
    v41 = v30;
    v33 = v30;
    objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", v39);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v17, "allObjects"));
    -[BMRapportSyncEngine completeRequest:deliveredToDevices:withErrors:](v38, "completeRequest:deliveredToDevices:withErrors:", v32, v34, v33);

  }
  else
  {
    v17 = (NSMutableSet *)objc_msgSend(v8, "mutableCopy");
    -[NSMutableSet minusSet:](v17, "minusSet:", v7);
    v35 = __biome_log_for_category(11);
    v33 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](v38, "siteSuffix"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "inFlightToDevices"));
      *(_DWORD *)buf = 138412802;
      v51 = v36;
      v52 = 2112;
      v53 = v37;
      v54 = 2112;
      v55 = v17;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: request(s) still inflight: %@, nearbyAndNotDelivered: %@", buf, 0x20u);

    }
  }

}

- (void)completeRequest:(id)a3 deliveredToDevices:(id)a4 withErrors:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  BMSyncSessionMetricsCollector *metricsCollector;
  void *v15;
  void *v16;
  void *v17;
  BMSyncDatabase *primaryDatabase;
  NSDate *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  NSMutableDictionary *requestQueue;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "state") == (id)2)
  {
    v11 = __biome_log_for_category(11);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
      v26 = 138412546;
      v27 = v13;
      v28 = 2112;
      v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: request %@ already finished running", (uint8_t *)&v26, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v8, "setState:", 2);
    metricsCollector = self->_metricsCollector;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sessionContext"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sessionID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase lastRapportSyncDate](self->_primaryDatabase, "lastRapportSyncDate"));
    -[BMSyncSessionMetricsCollector recordSessionEnd:lastSyncDate:](metricsCollector, "recordSessionEnd:lastSyncDate:", v16, v17);

    primaryDatabase = self->_primaryDatabase;
    v19 = objc_opt_new(NSDate);
    -[BMSyncDatabase setLastRapportSyncDate:](primaryDatabase, "setLastRapportSyncDate:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "completionHandler"));
    if (v20)
    {
      v21 = __biome_log_for_category(11);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
        v26 = 138412802;
        v27 = v23;
        v28 = 2112;
        v29 = v9;
        v30 = 2112;
        v31 = v10;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: completeRequest:deliveredToDevices %@ withErrors:%@", (uint8_t *)&v26, 0x20u);

      }
      v24 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "completionHandler"));
      ((void (**)(_QWORD, id, id))v24)[2](v24, v9, v10);

    }
    requestQueue = self->_requestQueue;
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
    -[NSMutableDictionary removeObjectForKey:](requestQueue, "removeObjectForKey:", v12);
  }

}

- (void)runRequest:(id)a3 onDevice:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deliveredToDevices"));
  if (objc_msgSend(v6, "containsObject:", v5))
  {

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "inFlightToDevices"));
    v8 = objc_msgSend(v7, "containsObject:", v5);

    if ((v8 & 1) == 0)
      objc_msgSend(v9, "runRequestOnDevice:", v5);
  }

}

- (void)fetchAtomBatchesIsReciprocal:(BOOL)a3 reason:(unint64_t)a4 activity:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  void *v10;
  id v11;
  BMRapportRequest *v12;
  void *v13;
  BMSyncSessionMetricsCollector *metricsCollector;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  _QWORD *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id from;
  _QWORD v34[5];
  id v35;
  id v36[2];
  BOOL v37;
  id location;
  _BYTE v39[128];

  v8 = a3;
  v23 = a5;
  v24 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10000C59C;
  v34[3] = &unk_100068C00;
  objc_copyWeak(v36, &location);
  v37 = v8;
  v34[4] = self;
  v36[1] = (id)a4;
  v11 = v10;
  v35 = v11;
  v25 = objc_retainBlock(v34);
  v12 = -[BMRapportRequest initWithUUID:activity:requestBlock:queue:completionHandler:]([BMRapportRequest alloc], "initWithUUID:activity:requestBlock:queue:completionHandler:", v11, v23, v25, self->_queue, v24);
  objc_initWeak(&from, v12);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10000C738;
  v30[3] = &unk_100068C28;
  objc_copyWeak(&v31, &location);
  objc_copyWeak(&v32, &from);
  v30[4] = self;
  -[BMRapportRequest setRequestTimeoutHandler:](v12, "setRequestTimeoutHandler:", v30);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncSessionMetricsCollector sessionContext](self->_metricsCollector, "sessionContext"));
  -[BMRapportRequest setSessionContext:](v12, "setSessionContext:", v13);

  metricsCollector = self->_metricsCollector;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportRequest sessionContext](v12, "sessionContext"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sessionID"));
  -[BMSyncSessionMetricsCollector recordSessionStart:transport:reason:isReciprocal:](metricsCollector, "recordSessionStart:transport:reason:isReciprocal:", v16, 2, a4, v8);

  -[NSMutableDictionary setObject:forKey:](self->_requestQueue, "setObject:forKey:", v12, v11);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportManager discoveredDevices](self->_rapportManager, "discoveredDevices"));
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v17);
        v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v22 = objc_autoreleasePoolPush();
        -[BMRapportSyncEngine runRequest:onDevice:](self, "runRequest:onDevice:", v12, v21);
        objc_autoreleasePoolPop(v22);
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
    }
    while (v18);
  }

  -[BMRapportManager start](self->_rapportManager, "start");
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&from);

  objc_destroyWeak(v36);
  objc_destroyWeak(&location);

}

- (void)fetchAtomBatchesFromDevices:(id)a3 isReciprocal:(BOOL)a4 reason:(unint64_t)a5 activity:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v10;
  id v12;
  void *v13;
  void *v14;
  BMSyncSessionMetricsCollector *metricsCollector;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  BMRapportRequest *v34;
  BMRapportSyncEngine *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id from;
  _QWORD v44[5];
  id v45;
  id v46[2];
  BOOL v47;
  id location;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];

  v10 = a4;
  v12 = a3;
  v31 = a6;
  v32 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v35 = self;
  objc_initWeak(&location, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10000CCCC;
  v44[3] = &unk_100068C00;
  objc_copyWeak(v46, &location);
  v47 = v10;
  v44[4] = self;
  v46[1] = (id)a5;
  v30 = v13;
  v45 = v30;
  v33 = objc_retainBlock(v44);
  v34 = -[BMRapportRequest initWithUUID:activity:requestBlock:queue:completionHandler:]([BMRapportRequest alloc], "initWithUUID:activity:requestBlock:queue:completionHandler:", v30, v31, v33, self->_queue, v32);
  objc_initWeak(&from, v34);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10000CE5C;
  v40[3] = &unk_100068C28;
  objc_copyWeak(&v41, &location);
  objc_copyWeak(&v42, &from);
  v40[4] = self;
  -[BMRapportRequest setRequestTimeoutHandler:](v34, "setRequestTimeoutHandler:", v40);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncSessionMetricsCollector sessionContext](self->_metricsCollector, "sessionContext"));
  -[BMRapportRequest setSessionContext:](v34, "setSessionContext:", v14);

  metricsCollector = self->_metricsCollector;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportRequest sessionContext](v34, "sessionContext"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sessionID"));
  -[BMSyncSessionMetricsCollector recordSessionStart:transport:reason:isReciprocal:](metricsCollector, "recordSessionStart:transport:reason:isReciprocal:", v17, 2, a5, v10);

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportManager discoveredDevices](self->_rapportManager, "discoveredDevices"));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v23 = objc_autoreleasePoolPush();
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "rapportIdentifier"));
        v25 = objc_msgSend(v12, "containsObject:", v24);

        if (v25)
        {
          v26 = __biome_log_for_category(11);
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](v35, "siteSuffix"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "rapportIdentifier"));
            *(_DWORD *)buf = 138412546;
            v50 = v28;
            v51 = 2112;
            v52 = v29;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: Specified Rapport device %@ found, sending sync request", buf, 0x16u);

          }
          -[BMRapportSyncEngine runRequest:onDevice:](v35, "runRequest:onDevice:", v34, v22);
        }
        objc_autoreleasePoolPop(v23);
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
    }
    while (v19);
  }

  -[BMRapportManager start](v35->_rapportManager, "start");
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&from);

  objc_destroyWeak(v46);
  objc_destroyWeak(&location);

}

- (void)sendFetchAtomBatchesRequest:(id)a3 toDevice:(id)a4 forRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  BMRapportManager *rapportManager;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dictionaryRepresentation"));
  rapportManager = self->_rapportManager;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000D09C;
  v16[3] = &unk_100068C50;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v8;
  v13 = v8;
  v14 = v10;
  v15 = v9;
  -[BMRapportManager sendRequest:request:toDevice:responseHandler:](rapportManager, "sendRequest:request:toDevice:responseHandler:", CFSTR("com.apple.biomesyncd.fetchAtomBatches"), v11, v15, v16);

}

- (id)buildAtomBatchRequestWithIsReciprocal:(BOOL)a3 syncReason:(unint64_t)a4 sequenceNumber:(unint64_t)a5 transportType:(unint64_t)a6 device:(id)a7
{
  _BOOL8 v10;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BMFetchAtomBatchesRequest *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;

  v10 = a3;
  v12 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "account"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine createDistributedSyncManagerForAccount:](self, "createDistributedSyncManagerForAccount:", v13));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "clockVectorForStreamsSupportingTransportType:direction:device:", a6, 1, v12));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[BMMultiStreamVectorClockConverter multiStreamTimestampClockVectorToVectorClock:](BMMultiStreamVectorClockConverter, "multiStreamTimestampClockVectorToVectorClock:", v15));
    v17 = objc_opt_new(BMFetchAtomBatchesRequest);
    -[BMPeerToPeerMessage setProtocolVersion:](v17, "setProtocolVersion:", -[BMRapportSyncEngine protocolVersion](self, "protocolVersion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "peerStatusTracker"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localDeviceUpdatingIfNeccesaryWithProtocolVersion:", -[BMRapportSyncEngine protocolVersion](self, "protocolVersion")));
    -[BMPeerToPeerMessage setPeer:](v17, "setPeer:", v19);

    -[BMPeerToPeerMessage setWalltime:](v17, "setWalltime:", CFAbsoluteTimeGetCurrent());
    -[BMPeerToPeerMessage setSyncReason:](v17, "setSyncReason:", a4);
    -[BMFetchAtomBatchesRequest setBatchSize:](v17, "setBatchSize:", 0x200000);
    -[BMFetchAtomBatchesRequest setBatchSequenceNumber:](v17, "setBatchSequenceNumber:", a5);
    -[BMFetchAtomBatchesRequest setVectorClock:](v17, "setVectorClock:", v16);
    -[BMFetchAtomBatchesRequest setIsReciprocalRequest:](v17, "setIsReciprocalRequest:", v10);
    -[BMFetchAtomBatchesRequest setAtomBatchVersion:](v17, "setAtomBatchVersion:", 2);

  }
  else
  {
    v20 = __biome_log_for_category(11);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_100041738();

    v17 = 0;
  }

  return v17;
}

- (void)registerRequests
{
  void *v3;
  BMRapportManager *rapportManager;
  void *v5;
  uint64_t v6;
  _UNKNOWN **v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = RPOptionStatusFlags;
  v7 = &off_10006EA80;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  rapportManager = self->_rapportManager;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine fetchAtomBatchesRequestHandler](self, "fetchAtomBatchesRequestHandler"));
  -[BMRapportManager registerRequestID:options:requestHandler:](rapportManager, "registerRequestID:options:requestHandler:", CFSTR("com.apple.biomesyncd.fetchAtomBatches"), v3, v5);

}

- (BOOL)rapportManager:(id)a3 isDeviceSupported:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;

  v5 = a4;
  v6 = +[BMDeviceMetadataUtils platform](BMDeviceMetadataUtils, "platform");
  v7 = objc_msgSend(v5, "platform");
  if (v6 != (id)6)
  {
    if (v7 != (id)6)
      goto LABEL_12;
    if (v6 == (id)2)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device"));
      v15 = objc_msgSend(v14, "statusFlags");

      if ((v15 & 1) != 0)
        goto LABEL_12;
    }
LABEL_9:
    v16 = __biome_log_for_category(11);
    v11 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
      v20 = 138412546;
      v21 = v12;
      v22 = 2112;
      v23 = v5;
      v13 = "BMRapportSyncEngine%@: current platform disallowed from syncing with non-paired watch: %@";
      goto LABEL_16;
    }
LABEL_17:

    v17 = 0;
    goto LABEL_18;
  }
  if (v7 != (id)2
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device")),
        v9 = objc_msgSend(v8, "statusFlags"),
        v8,
        (v9 & 1) == 0))
  {
    v10 = __biome_log_for_category(11);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
      v20 = 138412546;
      v21 = v12;
      v22 = 2112;
      v23 = v5;
      v13 = "BMRapportSyncEngine%@: current watch disallowed from syncing with non-paired device: %@";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v20, 0x16u);

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (objc_msgSend(v5, "platform") == (id)6)
    goto LABEL_9;
LABEL_12:
  if (!-[BMDistributedSyncMultiStreamManager supportsSyncingWithPlatform:overTransport:inDirection:](self->_primarySyncManager, "supportsSyncingWithPlatform:overTransport:inDirection:", objc_msgSend(v5, "platform"), 2, 3))
  {
    v18 = __biome_log_for_category(11);
    v11 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
      v20 = 138412546;
      v21 = v12;
      v22 = 2112;
      v23 = v5;
      v13 = "BMRapportSyncEngine%@: syncing with device platform disallowed for device: %@";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v17 = 1;
LABEL_18:

  return v17;
}

- (void)rapportManager:(id)a3 didDiscoverBMRapportDevice:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_requestQueue, "allValues", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[BMRapportSyncEngine runRequest:onDevice:](self, "runRequest:onDevice:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), v5);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)rapportManagerDiscoveryTimedOut:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  BMRapportSyncEngine *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  _BYTE v20[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v14 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_requestQueue, "allValues"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BMRapportErrorDomain"), 6, 0));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "completionHandler"));

        if (v11)
        {
          v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "completionHandler"));
          v19 = v10;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
          ((void (**)(_QWORD, void *, void *))v12)[2](v12, &__NSArray0__struct, v13);

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary removeAllObjects](v14->_requestQueue, "removeAllObjects");
  -[BMRapportManager stop](v14->_rapportManager, "stop");
}

- (id)fetchAtomBatchesRequestHandler
{
  _QWORD *v3;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D968;
  v5[3] = &unk_100068CA0;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v3 = objc_retainBlock(v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (void)handleFetchAtomBatchesResponse:(id)a3 options:(id)a4 error:(id)a5 fromDevice:(id)a6 forRequest:(id)a7 isReciprocal:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  BMSyncSessionMetricsCollector *metricsCollector;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  _xpc_activity_s *v51;
  _BOOL4 should_defer;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  void *v59;
  void *v60;
  char *v61;
  uint64_t v62;
  NSObject *v63;
  void *v64;
  void *v65;
  id v66;
  char *v67;
  uint64_t v68;
  NSObject *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  char *v74;
  _BOOL4 v75;
  NSObject *v76;
  BMRapportSyncEngine *v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  id v90;
  __int16 v91;
  id v92;

  v8 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v84 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[BMSyncCore resetEagerExitTimer](BMSyncCore, "resetEagerExitTimer");
  v18 = -[BMFetchAtomBatchesResponse initFromDictionary:]([BMFetchAtomBatchesResponse alloc], "initFromDictionary:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "peer"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", RPOptionSenderIDSDeviceID));
  objc_msgSend(v19, "setIdsDeviceIdentifier:", v20);

  v83 = v15;
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine accountFromRapportOptions:](self, "accountFromRapportOptions:", v15));
  v21 = objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine createDistributedSyncManagerForAccount:](self, "createDistributedSyncManagerForAccount:"));
  v22 = (void *)v21;
  if (v21)
  {
    if (v16)
    {
      v23 = (void *)v21;
      v24 = __biome_log_for_category(11);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v81 = v17;
        v71 = v16;
        v72 = v14;
        v73 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
        *(_DWORD *)buf = 138413058;
        v86 = v73;
        v87 = 2112;
        v88 = (uint64_t)v72;
        v89 = 2112;
        v90 = v71;
        v91 = 2112;
        v92 = v81;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "BMRapportSyncEngine%@: handleFetchAtomBatchesResponse %@ error %@ fromDevice: %@", buf, 0x2Au);

        v14 = v72;
        v16 = v71;
        v17 = v81;
      }

      v22 = v23;
      v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "peerStatusTracker"));
      -[BMRapportSyncEngine finishRequest:toDevice:withError:peerInfo:peerStatusTracker:](self, "finishRequest:toDevice:withError:peerInfo:peerStatusTracker:", v84, v17, v16, v19, v26);
      goto LABEL_32;
    }
    v75 = v8;
    v79 = v14;
    v26 = objc_msgSend(v14, "mutableCopy");
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("deletedLocations")));
    if (v29)
      v30 = CFSTR("... redacted due to size ...");
    else
      v30 = 0;
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, CFSTR("deletedLocations"));

    v31 = __biome_log_for_category(11);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    v80 = v17;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "shortenedRapportIdentifier"));
      *(_DWORD *)buf = 138413058;
      v86 = v33;
      v87 = 2112;
      v88 = (uint64_t)v34;
      v89 = 2112;
      v90 = v26;
      v91 = 2112;
      v92 = v15;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: received response from BMRapportDevice[%@] %@ %@", buf, 0x2Au);

      v17 = v80;
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "deviceIdentifier"));
    if (v35)
    {
      objc_msgSend(v17, "setBmDeviceIdentifier:", v35);
      metricsCollector = self->_metricsCollector;
      v37 = objc_msgSend(v18, "atomBatchBytes");
      v77 = self;
      v38 = v19;
      v39 = v26;
      v40 = v18;
      v41 = v17;
      v42 = v37;
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "sessionContext"));
      v44 = v42;
      v17 = v41;
      v18 = v40;
      v26 = v39;
      v19 = v38;
      self = v77;
      -[BMSyncSessionMetricsCollector recordMessageToDeviceIdentifier:reachable:bytes:isReciprocal:sessionContext:](metricsCollector, "recordMessageToDeviceIdentifier:reachable:bytes:isReciprocal:sessionContext:", v35, 1, v44, v75, v43);

      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "sessionContext"));
      objc_msgSend(v45, "setOriginatingSiteIdentifier:", v35);

    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "atomBatches"));
    v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "deletedLocations"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "sessionContext"));
    v78 = (void *)v47;
    objc_msgSend(v22, "mergeAtomBatches:deletedLocations:sessionContext:", v46, v47, v48);

    if (objc_msgSend(v18, "moreComing"))
    {
      v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "activity"));
      if (v49
        && (v50 = (void *)v49,
            v51 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "activity")),
            should_defer = xpc_activity_should_defer(v51),
            v51,
            v50,
            should_defer))
      {
        v53 = __biome_log_for_category(11);
        v54 = objc_claimAutoreleasedReturnValue(v53);
        v17 = v80;
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
          *(_DWORD *)buf = 138412546;
          v86 = v55;
          v87 = 2112;
          v88 = (uint64_t)v80;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: asked to defer activity, won't issue more requests to device %@ even though more data is available", buf, 0x16u);

        }
        v56 = 13;
      }
      else
      {
        v61 = (char *)objc_msgSend(v18, "batchSequenceNumber") + 1;
        v16 = 0;
        if ((unint64_t)v61 < 6)
        {
          v66 = objc_msgSend(v18, "syncReason");
          v74 = v61;
          v67 = v61;
          v17 = v80;
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine buildAtomBatchRequestWithIsReciprocal:syncReason:sequenceNumber:transportType:device:](self, "buildAtomBatchRequestWithIsReciprocal:syncReason:sequenceNumber:transportType:device:", v75, v66, v67, 2, v80));
          v68 = __biome_log_for_category(11);
          v69 = objc_claimAutoreleasedReturnValue(v68);
          v76 = v69;
          if (v60)
          {
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              v70 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
              *(_DWORD *)buf = 138412802;
              v86 = v70;
              v87 = 2112;
              v88 = (uint64_t)v80;
              v89 = 2048;
              v90 = v74;
              _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: sending request to device %@ with sequence number %lu", buf, 0x20u);

              v16 = 0;
            }

            -[BMRapportSyncEngine sendFetchAtomBatchesRequest:toDevice:forRequest:](self, "sendFetchAtomBatchesRequest:toDevice:forRequest:", v60, v80, v84);
          }
          else
          {
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              sub_100041AC4();

          }
          goto LABEL_31;
        }
        v62 = __biome_log_for_category(11);
        v63 = objc_claimAutoreleasedReturnValue(v62);
        v17 = v80;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
          *(_DWORD *)buf = 138412802;
          v86 = v64;
          v87 = 2048;
          v88 = 5;
          v89 = 2112;
          v90 = v80;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: max request depth %lu hit, finishing request to device %@", buf, 0x20u);

        }
        v56 = 12;
      }
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BMRapportErrorDomain"), v56, 0));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "peerStatusTracker"));
      -[BMRapportSyncEngine finishRequest:toDevice:withError:peerInfo:peerStatusTracker:](self, "finishRequest:toDevice:withError:peerInfo:peerStatusTracker:", v84, v17, v60, v19, v65);

    }
    else
    {
      v57 = __biome_log_for_category(11);
      v58 = objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
        *(_DWORD *)buf = 138412546;
        v86 = v59;
        v87 = 2112;
        v88 = (uint64_t)v17;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: no more data coming from device %@ finishing request", buf, 0x16u);

      }
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "peerStatusTracker"));
      -[BMRapportSyncEngine finishRequest:toDevice:withError:peerInfo:peerStatusTracker:](self, "finishRequest:toDevice:withError:peerInfo:peerStatusTracker:", v84, v17, 0, v19, v60);
    }
    v16 = 0;
LABEL_31:

    v14 = v79;
    goto LABEL_32;
  }
  v27 = __biome_log_for_category(11);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    sub_100041A48();

  v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "peerStatusTracker"));
  -[BMRapportSyncEngine finishRequest:toDevice:withError:peerInfo:peerStatusTracker:](self, "finishRequest:toDevice:withError:peerInfo:peerStatusTracker:", v84, v17, v16, v19, v26);
  v22 = 0;
LABEL_32:

}

- (void)finishRequest:(id)a3 toDevice:(id)a4 withError:(id)a5 peerInfo:(id)a6 peerStatusTracker:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a6;
  v12 = a7;
  v13 = a3;
  objc_msgSend(v13, "markAsDeliveredToDevice:withError:", a4, a5);
  -[BMRapportSyncEngine completeRequestIfDeliveredToAllNearbyDevices:](self, "completeRequestIfDeliveredToAllNearbyDevices:", v13);

  if (v17)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceIdentifier"));

    if (v14)
    {
      objc_msgSend(v12, "upsertSyncDevicePeer:", v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceIdentifier"));
      objc_msgSend(v12, "setLastSyncDate:forDeviceWithIdentifier:", v15, v16);

    }
  }

}

- (id)accountFromRapportOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  BMRapportManager *rapportManager;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("senderAccountAltDSID")));
  if (objc_msgSend(v5, "length"))
  {
    v6 = objc_msgSend(objc_alloc((Class)BMAccount), "initWithAccountIdentifier:", v5);
    if (v6)
    {
LABEL_3:
      v7 = v6;
      goto LABEL_10;
    }
  }
  else
  {
    v8 = __biome_log_for_category(11);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
      v17 = 138412546;
      v18 = v10;
      v19 = 2112;
      v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "BMRapportSyncEngine%@: Attempting to use discovered devices cache to identify account for %@", (uint8_t *)&v17, 0x16u);

    }
    rapportManager = self->_rapportManager;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", RPOptionSenderIDSDeviceID));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportManager deviceWithIdentifier:](rapportManager, "deviceWithIdentifier:", v12));

    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "account"));
    if (v6)
      goto LABEL_3;
  }
  v14 = __biome_log_for_category(11);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_100041B40();

LABEL_10:
  return v6;
}

- (id)createDistributedSyncManagerForAccount:(id)a3
{
  return self->_primarySyncManager;
}

- (unsigned)protocolVersion
{
  return 5;
}

- (id)siteSuffix
{
  return &stru_100069AC0;
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

- (id)reciprocalCompletionBlock
{
  return self->_reciprocalCompletionBlock;
}

- (void)setReciprocalCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BMSyncDatabase)primaryDatabase
{
  return self->_primaryDatabase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryDatabase, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_reciprocalCompletionBlock, 0);
  objc_storeStrong((id *)&self->_metricsCollector, 0);
  objc_storeStrong((id *)&self->_peerStatusTracker, 0);
  objc_storeStrong((id *)&self->_atomBatchChunkerPolicy, 0);
  objc_storeStrong((id *)&self->_localDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_rapportManager, 0);
  objc_storeStrong((id *)&self->_primarySyncManager, 0);
}

@end
