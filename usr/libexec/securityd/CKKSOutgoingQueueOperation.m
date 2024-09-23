@implementation CKKSOutgoingQueueOperation

- (CKKSOutgoingQueueOperation)initWithDependencies:(id)a3 intending:(id)a4 ckErrorState:(id)a5 errorState:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CKKSOutgoingQueueOperation *v15;
  CKKSOutgoingQueueOperation *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CKKSOutgoingQueueOperation;
  v15 = -[CKKSGroupOperation init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a3);
    objc_storeStrong((id *)&v16->_nextState, a6);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    objc_storeStrong((id *)&v16->_ckErrorState, a5);
  }

  return v16;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  AAFAnalyticsEventSecurity *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  AAFAnalyticsEventSecurity *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id obj;
  uint64_t v29;
  id v30;
  _QWORD v31[6];
  NSObject *v32;
  id v33;
  id v34;
  uint8_t buf[16];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id location;
  _BYTE v41[128];

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "databaseProvider"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "overallLaunch"));
  objc_msgSend(v5, "addEvent:", CFSTR("process-outgoing-queue-begin"));

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeManagedViews"));

  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v7)
  {
    v29 = *(_QWORD *)v37;
    do
    {
      v30 = v7;
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v29)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "syncingPolicy"));
        if (objc_msgSend(v11, "isInheritedAccount"))
        {

        }
        else
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "syncingPolicy"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "zoneName"));
          v16 = objc_msgSend(v13, "isSyncingEnabledForView:", v15);

          if ((v16 & 1) != 0)
          {
            v17 = [AAFAnalyticsEventSecurity alloc];
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "activeAccount"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "altDSID"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
            v22 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:](v17, "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:", &__NSDictionary0__struct, v20, CFSTR("com.apple.security.ckks.processOutgoingQueue"), 0, &off_10030AF70, objc_msgSend(v21, "sendMetric"));

            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472;
            v31[2] = sub_100081850;
            v31[3] = &unk_1002DC520;
            v31[4] = v9;
            v31[5] = self;
            v23 = v22;
            v32 = v23;
            v33 = v27;
            objc_copyWeak(&v34, &location);
            objc_msgSend(v26, "dispatchSyncWithSQLTransaction:", v31);
            objc_destroyWeak(&v34);

            goto LABEL_12;
          }
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
        v25 = sub_10000BDF4(CFSTR("ckksoutgoing"), v24);
        v23 = objc_claimAutoreleasedReturnValue(v25);

        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Item syncing for this view is disabled", buf, 2u);
        }
LABEL_12:

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v7);
  }

  objc_destroyWeak(&location);
}

- (void)modifyRecordsCompleted:(id)a3 fullUpload:(BOOL)a4 recordsToSave:(id)a5 recordIDsToDelete:(id)a6 recordIDsModified:(id)a7 modifyComplete:(id)a8 savedRecords:(id)a9 deletedRecordIDs:(id)a10 ckerror:(id)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  OctagonPendingFlag *v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned int v46;
  OctagonPendingFlag *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _BOOL4 v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  CKKSOutgoingQueueOperation *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  uint8_t buf[4];
  const __CFString *v65;
  __int16 v66;
  void *v67;

  v54 = a4;
  v15 = a3;
  v16 = a5;
  v17 = a7;
  v50 = a9;
  v18 = a10;
  v19 = a11;
  v20 = a8;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "databaseProvider"));
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_10007FFBC;
  v55[3] = &unk_1002DC548;
  v24 = v19;
  v56 = v24;
  v25 = v15;
  v57 = v25;
  v52 = v21;
  v58 = v52;
  v59 = self;
  v53 = v16;
  v60 = v53;
  v26 = v17;
  v61 = v26;
  v27 = v18;
  v62 = v27;
  v28 = v50;
  v63 = v28;
  objc_msgSend(v23, "dispatchSyncWithSQLTransaction:", v55);

  if (v24)
    v29 = objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation ckErrorState](self, "ckErrorState"));
  else
    v29 = objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation intendedState](self, "intendedState"));
  v30 = (void *)v29;
  -[CKKSOutgoingQueueOperation setNextState:](self, "setNextState:", v29, v50);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation operationQueue](self, "operationQueue"));
  objc_msgSend(v31, "addOperation:", v20);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "zoneID"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "zoneName"));
  v34 = sub_10000BDF4(CFSTR("ckksoutgoing"), v33);
  v35 = objc_claimAutoreleasedReturnValue(v34);

  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    if (v54)
      v36 = CFSTR("full");
    else
      v36 = CFSTR("non-full");
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
    *(_DWORD *)buf = 138412546;
    v65 = v36;
    v66 = 2112;
    v67 = v37;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Considering retry after a %@ upload with error: %@", buf, 0x16u);

  }
  if (v54
    || (v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error")),
        v38,
        v38))
  {
    v51 = v28;
    if (v24)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "reachabilityTracker"));
      if (objc_msgSend(v40, "isNetworkError:", v24))
        v41 = 2;
      else
        v41 = 0;

    }
    else
    {
      v41 = 0;
    }
    v42 = -[OctagonPendingFlag initWithFlag:conditions:delayInSeconds:]([OctagonPendingFlag alloc], "initWithFlag:conditions:delayInSeconds:", CFSTR("process_outgoing_queue"), v41, 0.2);
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "flagHandler"));
    objc_msgSend(v44, "handlePendingFlag:", v42);

    if (!v54 || (v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"))) != 0)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error", v28, v52, v53));
      v46 = -[CKKSOutgoingQueueOperation isCKErrorBadEtagOnly:](self, "isCKErrorBadEtagOnly:", v45);

      if (v54)
      {

        if ((v46 & 1) == 0)
          goto LABEL_24;
      }
      else if (!v46)
      {
LABEL_24:

        v28 = v51;
        goto LABEL_25;
      }
    }
    v47 = -[OctagonPendingFlag initWithFlag:conditions:delayInSeconds:]([OctagonPendingFlag alloc], "initWithFlag:conditions:delayInSeconds:", CFSTR("oqo_token"), 0, 0.2);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "flagHandler"));
    objc_msgSend(v49, "handlePendingFlag:", v47);

    goto LABEL_24;
  }
LABEL_25:

}

- (void)_onqueueModifyRecordAsError:(id)a3 recordError:(id)a4 viewState:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("classA")))
    goto LABEL_6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("classC")))
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
  if (objc_msgSend(v13, "hasPrefix:", CFSTR("Manifest:-:")))
  {

    goto LABEL_5;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
  v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("ManifestLeafRecord:-:"));

  if ((v15 & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contextID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));
    v29 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSOutgoingQueueEntry fromDatabase:state:contextID:zoneID:error:](CKKSOutgoingQueueEntry, "fromDatabase:state:contextID:zoneID:error:", v16, CFSTR("inflight"), v18, v19, &v29));
    v21 = v29;

    v28 = v21;
    objc_msgSend(v20, "intransactionMarkAsError:viewState:error:", v9, v10, &v28);
    v22 = v28;

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "zoneName"));
      v25 = sub_10000BDF4(CFSTR("ckksoutgoing"), v24);
      v26 = objc_claimAutoreleasedReturnValue(v25);

      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
        *(_DWORD *)buf = 138412546;
        v31 = v27;
        v32 = 2112;
        v33 = v22;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Couldn't set OQE %@ as error: %@", buf, 0x16u);

      }
      -[CKKSResultOperation setError:](self, "setError:", v22);
    }

  }
LABEL_7:

}

- (void)_onqueueSaveRecordsWithDelay:(id)a3 viewState:(id)a4
{
  id v5;
  id v6;
  __int128 v7;
  __CFString *v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  __int128 v33;
  void *v34;
  id obj;
  uint64_t v36;
  id v37;
  id v39;
  __CFString *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  __CFString *v50;
  _BYTE v51[128];

  v5 = a3;
  v6 = a4;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 1800.0));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v5;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v37)
  {
    v8 = 0;
    v36 = *(_QWORD *)v42;
    *(_QWORD *)&v7 = 138412802;
    v33 = v7;
    do
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v36)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordName", v33));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contextID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
        v40 = v8;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSOutgoingQueueEntry fromDatabase:state:contextID:zoneID:error:](CKKSOutgoingQueueEntry, "fromDatabase:state:contextID:zoneID:error:", v11, CFSTR("inflight"), v13, v14, &v40));
        v16 = v40;

        if (v16 || !v15)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "zoneName"));
          v30 = sub_10000BDF4(CFSTR("ckksoutgoing"), v29);
          v31 = objc_claimAutoreleasedReturnValue(v30);

          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordName"));
            *(_DWORD *)buf = 138412546;
            v46 = v32;
            v47 = 2112;
            v48 = v16;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Couldn't fetch OQE %@: %@", buf, 0x16u);

          }
          -[CKKSResultOperation setError:](self, "setError:", v16);
          v8 = (__CFString *)v16;
        }
        else
        {
          objc_msgSend(v15, "setWaitUntil:", v34);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneName"));
          v19 = sub_10000BDF4(CFSTR("ckksoutgoing"), v18);
          v20 = objc_claimAutoreleasedReturnValue(v19);

          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordName"));
            v22 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "waitUntil"));
            *(_DWORD *)buf = 138412546;
            v46 = v21;
            v47 = 2112;
            v48 = v22;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Saving OQE %@ scheduled for retry at: %@", buf, 0x16u);

          }
          v39 = 0;
          objc_msgSend(v15, "intransactionMoveToState:viewState:error:", CFSTR("new"), v6, &v39);
          v8 = (__CFString *)v39;
          if (v8)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "zoneName"));
            v25 = sub_10000BDF4(CFSTR("ckksoutgoing"), v24);
            v26 = objc_claimAutoreleasedReturnValue(v25);

            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordName"));
              *(_DWORD *)buf = v33;
              v46 = v27;
              v47 = 2112;
              v48 = CFSTR("new");
              v49 = 2112;
              v50 = v8;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Couldn't save OQE %@ as %@: %@", buf, 0x20u);

            }
            -[CKKSResultOperation setError:](self, "setError:", v8);
          }
        }

      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v37);

  }
}

- (void)_onqueueModifyAllRecords:(id)a3 as:(id)a4 viewState:(id)a5
{
  id v7;
  id v8;
  __int128 v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  uint64_t v33;
  id v34;
  id v35;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  _BYTE v54[128];

  v7 = a3;
  v35 = a4;
  v37 = a5;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (!v8)
  {
    v11 = 0;
    v12 = 0;
    goto LABEL_19;
  }
  v10 = v8;
  v11 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v43;
  *(_QWORD *)&v9 = 138412802;
  v32 = v9;
  v33 = *(_QWORD *)v43;
  v34 = v7;
  do
  {
    v14 = 0;
    v39 = v10;
    do
    {
      if (*(_QWORD *)v43 != v13)
        objc_enumerationMutation(v7);
      v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recordName", v32));
      if ((objc_msgSend(v16, "isEqualToString:", CFSTR("classA")) & 1) == 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recordName"));
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("classC"));

        if ((v18 & 1) != 0)
        {
          v10 = v39;
          goto LABEL_15;
        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recordName"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "contextID"));
        v21 = v12;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "zoneID"));
        v41 = v11;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSOutgoingQueueEntry fromDatabase:state:contextID:zoneID:error:](CKKSOutgoingQueueEntry, "fromDatabase:state:contextID:zoneID:error:", v38, CFSTR("inflight"), v20, v22, &v41));
        v23 = v41;

        v24 = v21;
        v40 = v23;
        objc_msgSend(v16, "intransactionMoveToState:viewState:error:", v35, v37, &v40);
        v11 = v40;

        if (v11)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "zoneID"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "zoneName"));
          v27 = sub_10000BDF4(CFSTR("ckksoutgoing"), v26);
          v28 = objc_claimAutoreleasedReturnValue(v27);

          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recordName"));
            *(_DWORD *)buf = v32;
            v49 = v29;
            v50 = 2112;
            v51 = v35;
            v52 = 2112;
            v53 = v11;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Couldn't set OQE %@ as %@: %@", buf, 0x20u);

          }
          -[CKKSResultOperation setError:](self, "setError:", v11);
        }
        v12 = v24 + 1;
        v13 = v33;
        v7 = v34;
        v10 = v39;
      }

LABEL_15:
      v14 = (char *)v14 + 1;
    }
    while (v10 != v14);
    v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  }
  while (v10);
LABEL_19:
  if (objc_msgSend(v35, "isEqualToString:", CFSTR("reencrypt")))
  {
    v46 = SecCoreAnalyticsValue;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v12));
    v47 = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
    +[SecCoreAnalytics sendEvent:event:](SecCoreAnalytics, "sendEvent:event:", CFSTR("com.apple.security.ckks.reencrypt"), v31);

  }
}

- (BOOL)_onqueueIsErrorMissingSyncKey:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  BOOL v14;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (!objc_msgSend(v4, "isEqualToString:", CKErrorDomain))
  {
LABEL_12:

    goto LABEL_13;
  }
  v5 = objc_msgSend(v3, "code");

  if (v5 == (id)2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v4 = v7;
    v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v4);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v12, (_QWORD)v20));
          if (objc_msgSend(v13, "isCKKSServerPluginError:", 2))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneID"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
            v18 = sub_10000BDF4(CFSTR("ckksoutgoing"), v17);
            v19 = objc_claimAutoreleasedReturnValue(v18);

            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v25 = v13;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Error is a 'missing record' error: %@", buf, 0xCu);
            }

            v14 = 1;
            goto LABEL_14;
          }

        }
        v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
        if (v9)
          continue;
        break;
      }
    }

    goto LABEL_12;
  }
LABEL_13:
  v14 = 0;
LABEL_14:

  return v14;
}

- (BOOL)intransactionIsErrorBadEtagOnKeyPointersOnly:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (!objc_msgSend(v4, "isEqualToString:", CKErrorDomain))
  {

    goto LABEL_17;
  }
  v5 = objc_msgSend(v3, "code");

  if (v5 != (id)2)
  {
LABEL_17:
    v20 = 1;
    goto LABEL_22;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v13, (_QWORD)v22));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "domain"));
        if (!objc_msgSend(v15, "isEqualToString:", CKErrorDomain))
        {

LABEL_20:
          v20 = 0;
          goto LABEL_21;
        }
        v16 = objc_msgSend(v14, "code");

        if (v16 != (id)14)
          goto LABEL_20;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recordName"));
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("classA")))
        {

        }
        else
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recordName"));
          v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("classC"));

          if ((v19 & 1) == 0)
            goto LABEL_20;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v20 = 1;
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v20 = 1;
  }
LABEL_21:

LABEL_22:
  return v20;
}

- (BOOL)isCKErrorBadEtagOnly:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (!objc_msgSend(v4, "isEqualToString:", CKErrorDomain))
  {

    goto LABEL_19;
  }
  v5 = objc_msgSend(v3, "code");

  if (v5 != (id)2)
  {
LABEL_19:
    v18 = 0;
    goto LABEL_25;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

  if (v7)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
LABEL_6:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12), (_QWORD)v20));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "domain"));
        if (!objc_msgSend(v14, "isEqualToString:", CKErrorDomain))
          break;
        v15 = objc_msgSend(v13, "code");

        if (v15 != (id)14)
          goto LABEL_13;
LABEL_15:

        if (v10 == (id)++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v10)
            goto LABEL_6;
          goto LABEL_17;
        }
      }

LABEL_13:
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "domain"));
      if (!objc_msgSend(v16, "isEqualToString:", CKErrorDomain))
      {

LABEL_22:
        v18 = 0;
        goto LABEL_23;
      }
      v17 = objc_msgSend(v13, "code");

      if (v17 != (id)22)
        goto LABEL_22;
      goto LABEL_15;
    }
LABEL_17:
    v18 = 1;
LABEL_23:

  }
  else
  {
    v18 = 0;
  }

LABEL_25:
  return v18;
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136, 1);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (unint64_t)itemsProcessed
{
  return self->_itemsProcessed;
}

- (void)setItemsProcessed:(unint64_t)a3
{
  self->_itemsProcessed = a3;
}

- (OctagonStateString)ckErrorState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCkErrorState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckErrorState, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

+ (id)ontransactionFetchEntries:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  id v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  id *v39;
  void *v40;
  void *v41;
  id v42;
  id obj;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  id v58;
  _BYTE v59[128];

  v39 = a5;
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pendingCallbackUUIDs"));

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  v42 = v7;
  if (v10)
  {
    v11 = v10;
    v44 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v44)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID", v39));
        v49 = 0;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSOutgoingQueueEntry tryFromDatabase:contextID:zoneID:error:](CKKSOutgoingQueueEntry, "tryFromDatabase:contextID:zoneID:error:", v13, v7, v14, &v49));
        v16 = v49;

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneName"));
          v19 = sub_10000BDF4(CFSTR("ckksoutgoing"), v18);
          v20 = objc_claimAutoreleasedReturnValue(v19);

          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v56 = v13;
            v57 = 2112;
            v58 = v16;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Unable to fetch priority uuid %@: %@", buf, 0x16u);
          }
        }
        else
        {
          if (!v15)
            goto LABEL_18;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "state"));
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("new"));

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "zoneName"));
          v25 = sub_10000BDF4(CFSTR("ckksoutgoing"), v24);
          v20 = objc_claimAutoreleasedReturnValue(v25);

          v26 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
          if ((v22 & 1) != 0)
          {
            if (v26)
            {
              *(_DWORD *)buf = 138412546;
              v56 = v13;
              v57 = 2112;
              v58 = 0;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Found OQE  to fetch priority uuid %@: %@", buf, 0x16u);
            }

            objc_msgSend(v40, "addObject:", v15);
            v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uuid"));
            objc_msgSend(v41, "addObject:", v20);
          }
          else if (v26)
          {
            *(_DWORD *)buf = 138412546;
            v56 = v13;
            v57 = 2112;
            v58 = v15;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Priority uuid %@ is not in 'new': %@", buf, 0x16u);
          }
          v7 = v42;
        }

LABEL_18:
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v11);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSOutgoingQueueEntry fetch:state:contextID:zoneID:error:](CKKSOutgoingQueueEntry, "fetch:state:contextID:zoneID:error:", 100, CFSTR("new"), v7, v27, v39));

  if (v28)
  {
    v29 = objc_msgSend(v40, "mutableCopy");
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v30 = v28;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v46;
LABEL_23:
      v34 = 0;
      while (1)
      {
        if (*(_QWORD *)v46 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)v34);
        if ((unint64_t)objc_msgSend(v29, "count", v39) > 0x63)
          break;
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "uuid"));
        v37 = objc_msgSend(v41, "containsObject:", v36);

        if ((v37 & 1) == 0)
          objc_msgSend(v29, "addObject:", v35);
        v34 = (char *)v34 + 1;
        v7 = v42;
        if (v32 == v34)
        {
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
          if (v32)
            goto LABEL_23;
          break;
        }
      }
    }

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

@end
