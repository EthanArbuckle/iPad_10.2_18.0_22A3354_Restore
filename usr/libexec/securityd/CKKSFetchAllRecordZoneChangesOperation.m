@implementation CKKSFetchAllRecordZoneChangesOperation

- (CKKSFetchAllRecordZoneChangesOperation)init
{

  return 0;
}

- (CKKSFetchAllRecordZoneChangesOperation)initWithContainer:(id)a3 fetchClass:(Class)a4 clientMap:(id)a5 fetchReasons:(id)a6 apnsPushes:(id)a7 forceResync:(BOOL)a8 ckoperationGroup:(id)a9 altDSID:(id)a10 sendMetric:(BOOL)a11
{
  id v18;
  char *v19;
  char *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v36 = a3;
  v35 = a5;
  v34 = a6;
  v33 = a7;
  v32 = a9;
  v18 = a10;
  v37.receiver = self;
  v37.super_class = (Class)CKKSFetchAllRecordZoneChangesOperation;
  v19 = -[CKKSGroupOperation init](&v37, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)(v19 + 142), a3);
    objc_storeStrong((id *)(v20 + 134), a4);
    objc_storeStrong((id *)(v20 + 214), a5);
    objc_storeStrong((id *)(v20 + 222), a9);
    v20[129] = a8;
    objc_storeStrong((id *)(v20 + 158), a6);
    objc_storeStrong((id *)(v20 + 166), a7);
    v21 = objc_alloc_init((Class)NSMutableDictionary);
    v22 = *(void **)(v20 + 174);
    *(_QWORD *)(v20 + 174) = v21;

    v23 = objc_alloc_init((Class)NSMutableDictionary);
    v24 = *(void **)(v20 + 182);
    *(_QWORD *)(v20 + 182) = v23;

    v25 = objc_alloc_init((Class)NSMutableDictionary);
    v26 = *(void **)(v20 + 190);
    *(_QWORD *)(v20 + 190) = v25;

    v27 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v28 = *(void **)(v20 + 262);
    *(_QWORD *)(v20 + 262) = v27;

    *(_QWORD *)(v20 + 246) = 0;
    *(_QWORD *)(v20 + 254) = 0;
    v29 = objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("record-zone-changes-completed"), &stru_1002DCF60));
    v30 = *(void **)(v20 + 270);
    *(_QWORD *)(v20 + 270) = v29;

    v20[130] = 0;
    objc_storeStrong((id *)(v20 + 238), a10);
    v20[131] = a11;
    objc_msgSend(v20, "setQualityOfService:", 25);
  }

  return (CKKSFetchAllRecordZoneChangesOperation *)v20;
}

- (void)queryClientsForChangeTokens
{
  void *v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];

  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation clientMap](self, "clientMap"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v30;
    *(_QWORD *)&v5 = 138412546;
    v26 = v5;
    v27 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      v28 = v6;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation clientMap](self, "clientMap", v26));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "participateInFetch:", v9));
        if (objc_msgSend(v12, "participateInFetch"))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchedZoneIDs](self, "fetchedZoneIDs"));
          objc_msgSend(v13, "addObject:", v9);

          v14 = objc_alloc_init((Class)CKFetchRecordZoneChangesConfiguration);
          if (!-[CKKSFetchAllRecordZoneChangesOperation forceResync](self, "forceResync"))
          {
            v15 = v3;
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation changeTokens](self, "changeTokens"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v9));

            if (v17)
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation changeTokens](self, "changeTokens"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v9));
              objc_msgSend(v14, "setPreviousServerChangeToken:", v19);

              v20 = sub_10000BDF4(CFSTR("ckksfetch"), 0);
              v21 = objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation changeTokens](self, "changeTokens"));
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v9));
                *(_DWORD *)buf = v26;
                v34 = v9;
                v35 = 2112;
                v36 = v23;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Using cached change token for %@: %@", buf, 0x16u);

              }
            }
            else
            {
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "changeToken"));
              objc_msgSend(v14, "setPreviousServerChangeToken:", v21);
            }
            v3 = v15;

            v7 = v27;
          }
          if ((objc_msgSend(v12, "resync") & 1) != 0
            || -[CKKSFetchAllRecordZoneChangesOperation forceResync](self, "forceResync"))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation resyncingZones](self, "resyncingZones"));
            objc_msgSend(v24, "addObject:", v9);

          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation allClientOptions](self, "allClientOptions"));
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v14, v9);

          v6 = v28;
        }

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v6);
  }

}

- (void)groupStart
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[CKKSFetchAllRecordZoneChangesOperation setAllClientOptions:](self, "setAllClientOptions:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[CKKSFetchAllRecordZoneChangesOperation setFetchedZoneIDs:](self, "setFetchedZoneIDs:", v4);

  -[CKKSFetchAllRecordZoneChangesOperation queryClientsForChangeTokens](self, "queryClientsForChangeTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchedZoneIDs](self, "fetchedZoneIDs"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[CKKSFetchAllRecordZoneChangesOperation performFetch](self, "performFetch");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 50, CFSTR("No clients want a fetch right now")));
    -[CKKSResultOperation setError:](self, "setError:", v7);

    v8 = sub_10000BDF4(CFSTR("ckksfetch"), 0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
      v11 = 138412290;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cancelling fetch: %@", (uint8_t *)&v11, 0xCu);

    }
    -[CKKSFetchAllRecordZoneChangesOperation setClientMap:](self, "setClientMap:", &__NSDictionary0__struct);
  }
}

- (void)performFetch
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  AAFAnalyticsEventSecurity *v13;
  void *v14;
  void *v15;
  AAFAnalyticsEventSecurity *v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  AAFAnalyticsEventSecurity *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  void *v65;
  void *v66;
  unsigned __int8 v67;
  _QWORD v68[4];
  AAFAnalyticsEventSecurity *v69;
  id v70;
  _QWORD v71[4];
  AAFAnalyticsEventSecurity *v72;
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id location;
  const __CFString *v89;
  void *v90;
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  void *v94;
  const __CFString *v95;
  void *v96;
  _BYTE v97[128];
  const __CFString *v98;
  void *v99;
  _BYTE v100[128];

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation allClientOptions](self, "allClientOptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v84, v100, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v85;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v85 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation clientMap](self, "clientMap"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));
        v12 = objc_msgSend(v11, "zoneIsReadyForFetching:", v9);

        if ((v12 & 1) == 0)
          objc_msgSend(v3, "addObject:", v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v84, v100, 16);
    }
    while (v6);
  }

  v13 = [AAFAnalyticsEventSecurity alloc];
  v98 = CFSTR("isPrioritized");
  v99 = &__kCFBooleanFalse;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation altDSID](self, "altDSID"));
  v16 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:](v13, "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:", v14, v15, CFSTR("com.apple.security.ckks.zoneChangeFetch"), 0, &off_10030AF70, -[CKKSFetchAllRecordZoneChangesOperation sendMetric](self, "sendMetric"));

  if (objc_msgSend(v3, "count"))
  {
    v17 = sub_10000BDF4(CFSTR("ckksfetch"), 0);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v92 = v3;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Dropping the following zones from this fetch cycle: %@", buf, 0xCu);
    }

    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v19 = v3;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v81;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v81 != v21)
            objc_enumerationMutation(v19);
          v23 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchedZoneIDs](self, "fetchedZoneIDs"));
          objc_msgSend(v24, "removeObject:", v23);

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation allClientOptions](self, "allClientOptions"));
          objc_msgSend(v25, "setObject:forKeyedSubscript:", 0, v23);

          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
      }
      while (v20);
    }

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchedZoneIDs](self, "fetchedZoneIDs"));
  v27 = objc_msgSend(v26, "count") == 0;

  if (!v27)
  {
    v95 = CFSTR("numViews");
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchedZoneIDs](self, "fetchedZoneIDs"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v28, "count")));
    v96 = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1));
    -[AAFAnalyticsEventSecurity addMetrics:](v16, "addMetrics:", v30);

    v31 = sub_10000BDF4(CFSTR("ckksfetch"), 0);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchedZoneIDs](self, "fetchedZoneIDs"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation allClientOptions](self, "allClientOptions"));
      *(_DWORD *)buf = 138412546;
      v92 = v33;
      v93 = 2112;
      v94 = v34;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Beginning fetch: %@ options: %@", buf, 0x16u);

    }
    v35 = -[objc_class alloc](-[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperationClass](self, "fetchRecordZoneChangesOperationClass"), "alloc");
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchedZoneIDs](self, "fetchedZoneIDs"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation allClientOptions](self, "allClientOptions"));
    v38 = -[objc_class initWithRecordZoneIDs:configurationsByRecordZoneID:](v35, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v36, v37);
    -[CKKSFetchAllRecordZoneChangesOperation setFetchRecordZoneChangesOperation:](self, "setFetchRecordZoneChangesOperation:", v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation](self, "fetchRecordZoneChangesOperation"));
    objc_msgSend(v39, "setFetchAllChanges:", 0);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation](self, "fetchRecordZoneChangesOperation"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "configuration"));
    objc_msgSend(v41, "setIsCloudKitSupportOperation:", 1);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation ckoperationGroup](self, "ckoperationGroup"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation](self, "fetchRecordZoneChangesOperation"));
    objc_msgSend(v43, "setGroup:", v42);

    v44 = sub_10000BDF4(CFSTR("ckksfetch"), 0);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation ckoperationGroup](self, "ckoperationGroup"));
      *(_DWORD *)buf = 138412290;
      v92 = v46;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Operation group is %@", buf, 0xCu);

    }
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchReasons](self, "fetchReasons"));
    if ((objc_msgSend(v47, "containsObject:", CFSTR("api")) & 1) == 0)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchReasons](self, "fetchReasons"));
      if ((objc_msgSend(v48, "containsObject:", CFSTR("initialfetch")) & 1) == 0)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchReasons](self, "fetchReasons"));
        if (!objc_msgSend(v49, "containsObject:", CFSTR("more-coming")))
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchReasons](self, "fetchReasons"));
          v67 = objc_msgSend(v66, "containsObject:", CFSTR("keyhierarchy"));

          if ((v67 & 1) == 0)
            goto LABEL_33;
          goto LABEL_32;
        }

      }
    }

LABEL_32:
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation](self, "fetchRecordZoneChangesOperation"));
    objc_msgSend(v50, "setQualityOfService:", 25);

    v89 = CFSTR("isPrioritized");
    v90 = &__kCFBooleanTrue;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1));
    -[AAFAnalyticsEventSecurity addMetrics:](v16, "addMetrics:", v51);

LABEL_33:
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_1000BF640;
    v78[3] = &unk_1002DCF88;
    objc_copyWeak(&v79, &location);
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation](self, "fetchRecordZoneChangesOperation"));
    objc_msgSend(v52, "setRecordChangedBlock:", v78);

    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_1000BF7B4;
    v76[3] = &unk_1002DCFB0;
    objc_copyWeak(&v77, &location);
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation](self, "fetchRecordZoneChangesOperation"));
    objc_msgSend(v53, "setRecordWithIDWasDeletedBlock:", v76);

    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_1000BF91C;
    v74[3] = &unk_1002DCFD8;
    objc_copyWeak(&v75, &location);
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation](self, "fetchRecordZoneChangesOperation"));
    objc_msgSend(v54, "setRecordZoneChangeTokensUpdatedBlock:", v74);

    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_1000BFA4C;
    v71[3] = &unk_1002DD000;
    objc_copyWeak(&v73, &location);
    v55 = v16;
    v72 = v55;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation](self, "fetchRecordZoneChangesOperation"));
    objc_msgSend(v56, "setRecordZoneFetchCompletionBlock:", v71);

    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_1000BFD8C;
    v68[3] = &unk_1002DD028;
    objc_copyWeak(&v70, &location);
    v69 = v55;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation](self, "fetchRecordZoneChangesOperation"));
    objc_msgSend(v57, "setFetchRecordZoneChangesCompletionBlock:", v68);

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchCompletedOperation](self, "fetchCompletedOperation"));
    -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v58);

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation](self, "fetchRecordZoneChangesOperation"));
    -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v59);

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation container](self, "container"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "privateCloudDatabase"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation](self, "fetchRecordZoneChangesOperation"));
    objc_msgSend(v61, "addOperation:", v62);

    objc_destroyWeak(&v70);
    objc_destroyWeak(&v73);
    objc_destroyWeak(&v75);
    objc_destroyWeak(&v77);
    objc_destroyWeak(&v79);
    goto LABEL_37;
  }
  v63 = sub_10000BDF4(CFSTR("ckksfetch"), 0);
  v64 = objc_claimAutoreleasedReturnValue(v63);
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "No zones to fetch. Skipping operation.", buf, 2u);
  }

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchCompletedOperation](self, "fetchCompletedOperation"));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v65);

LABEL_37:
  objc_destroyWeak(&location);
}

- (void)sendChangesToClient:(id)a3 moreComing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  NSObject *v34;
  uint8_t buf[4];
  id v36;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation clientMap](self, "clientMap"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation modifications](self, "modifications"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000BF3E0;
    v32[3] = &unk_1002DD050;
    v12 = v6;
    v33 = v12;
    v13 = v9;
    v34 = v13;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v32);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation deletions](self, "deletions"));
    v26 = _NSConcreteStackBlock;
    v27 = 3221225472;
    v28 = sub_1000BF510;
    v29 = &unk_1002DD078;
    v15 = v12;
    v30 = v15;
    v16 = v10;
    v31 = v16;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", &v26);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation resyncingZones](self, "resyncingZones", v26, v27, v28, v29));
    v18 = objc_msgSend(v17, "containsObject:", v15);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation changeTokens](self, "changeTokens"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v15));
    objc_msgSend(v8, "changesFetched:deletedRecordIDs:zoneID:newChangeToken:moreComing:resync:", v13, v16, v15, v20, v4, v18);

    if ((_DWORD)v18 && !v4)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "zoneName"));
      v22 = sub_10000BDF4(CFSTR("ckksfetch"), v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);

      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No more changes for zone; turning off resync bit",
          buf,
          2u);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation resyncingZones](self, "resyncingZones"));
      objc_msgSend(v24, "removeObject:", v15);

    }
  }
  else
  {
    v25 = sub_10000BDF4(CFSTR("ckksfetch"), 0);
    v13 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "no client registered for %@, so why did we get any data?", buf, 0xCu);
    }
  }

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation](self, "fetchRecordZoneChangesOperation"));
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)CKKSFetchAllRecordZoneChangesOperation;
  -[CKKSGroupOperation cancel](&v4, "cancel");
}

- (Class)fetchRecordZoneChangesOperationClass
{
  return (Class)objc_getProperty(self, a2, 134, 1);
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 142, 1);
}

- (BOOL)resync
{
  return self->_resync;
}

- (void)setResync:(BOOL)a3
{
  self->_resync = a3;
}

- (NSMutableArray)fetchedZoneIDs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 150, 1);
}

- (void)setFetchedZoneIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 150);
}

- (NSSet)fetchReasons
{
  return (NSSet *)objc_getProperty(self, a2, 158, 1);
}

- (void)setFetchReasons:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 158);
}

- (NSSet)apnsPushes
{
  return (NSSet *)objc_getProperty(self, a2, 166, 1);
}

- (void)setApnsPushes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 166);
}

- (NSMutableDictionary)modifications
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 174, 1);
}

- (void)setModifications:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 174);
}

- (NSMutableDictionary)deletions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 182, 1);
}

- (void)setDeletions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 182);
}

- (NSMutableDictionary)changeTokens
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 190, 1);
}

- (void)setChangeTokens:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 190);
}

- (CKKSFetchRecordZoneChangesOperation)fetchRecordZoneChangesOperation
{
  return (CKKSFetchRecordZoneChangesOperation *)objc_getProperty(self, a2, 198, 1);
}

- (void)setFetchRecordZoneChangesOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 198);
}

- (NSMutableDictionary)allClientOptions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 206, 1);
}

- (void)setAllClientOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 206);
}

- (NSDictionary)clientMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 214, 1);
}

- (void)setClientMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 214);
}

- (CKOperationGroup)ckoperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 222, 1);
}

- (void)setCkoperationGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 222);
}

- (unint64_t)fetchedItems
{
  return *(unint64_t *)((char *)&self->_ckoperationGroup + 6);
}

- (void)setFetchedItems:(unint64_t)a3
{
  *(CKOperationGroup **)((char *)&self->_ckoperationGroup + 6) = (CKOperationGroup *)a3;
}

- (BOOL)forceResync
{
  return self->_forceResync;
}

- (void)setForceResync:(BOOL)a3
{
  self->_forceResync = a3;
}

- (BOOL)moreComing
{
  return self->_moreComing;
}

- (void)setMoreComing:(BOOL)a3
{
  self->_moreComing = a3;
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 238, 1);
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 238);
}

- (BOOL)sendMetric
{
  return self->_sendMetric;
}

- (void)setSendMetric:(BOOL)a3
{
  self->_sendMetric = a3;
}

- (unint64_t)totalModifications
{
  return *(unint64_t *)((char *)&self->_altDSID + 6);
}

- (void)setTotalModifications:(unint64_t)a3
{
  *(NSString **)((char *)&self->_altDSID + 6) = (NSString *)a3;
}

- (unint64_t)totalDeletions
{
  return *(unint64_t *)((char *)&self->_totalModifications + 6);
}

- (void)setTotalDeletions:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_totalModifications + 6) = a3;
}

- (NSMutableSet)resyncingZones
{
  return (NSMutableSet *)objc_getProperty(self, a2, 262, 1);
}

- (void)setResyncingZones:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 262);
}

- (CKKSResultOperation)fetchCompletedOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 270, 1);
}

- (void)setFetchCompletedOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 270);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_resyncingZones + 6), 0);
  objc_storeStrong((id *)((char *)&self->_totalDeletions + 6), 0);
  objc_storeStrong((id *)((char *)&self->_fetchedItems + 6), 0);
  objc_storeStrong((id *)((char *)&self->_clientMap + 6), 0);
  objc_storeStrong((id *)((char *)&self->_allClientOptions + 6), 0);
  objc_storeStrong((id *)((char *)&self->_fetchRecordZoneChangesOperation + 6), 0);
  objc_storeStrong((id *)((char *)&self->_changeTokens + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deletions + 6), 0);
  objc_storeStrong((id *)((char *)&self->_modifications + 6), 0);
  objc_storeStrong((id *)((char *)&self->_apnsPushes + 6), 0);
  objc_storeStrong((id *)((char *)&self->_fetchReasons + 6), 0);
  objc_storeStrong((id *)((char *)&self->_fetchedZoneIDs + 6), 0);
  objc_storeStrong((id *)((char *)&self->_container + 6), 0);
  objc_storeStrong((id *)((char *)&self->_fetchRecordZoneChangesOperationClass + 6), 0);
  objc_storeStrong((id *)(&self->_sendMetric + 3), 0);
}

@end
