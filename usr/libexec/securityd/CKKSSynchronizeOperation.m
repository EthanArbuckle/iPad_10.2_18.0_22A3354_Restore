@implementation CKKSSynchronizeOperation

- (CKKSSynchronizeOperation)init
{

  return 0;
}

- (CKKSSynchronizeOperation)initWithCKKSKeychainView:(id)a3 dependencies:(id)a4
{
  id v6;
  id v7;
  char *v8;
  char *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKKSSynchronizeOperation;
  v8 = -[CKKSGroupOperation init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)(v8 + 132), v6);
    *((_DWORD *)v9 + 32) = 0;
    objc_storeStrong((id *)(v9 + 140), a4);
  }

  return (CKKSSynchronizeOperation *)v9;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  CKKSScanLocalItemsOperation *v28;
  void *v29;
  CKKSScanLocalItemsOperation *v30;
  void *v31;
  CKKSOutgoingQueueOperation *v32;
  void *v33;
  CKKSOutgoingQueueOperation *v34;
  void *v35;
  CKKSResultOperation *v36;
  void *v37;
  CKKSScanLocalItemsOperation *v38;
  uint64_t v39;
  void *v40;
  CKKSFetchAllRecordZoneChangesOperation *v41;
  CKKSFetchAllRecordZoneChangesOperation *v42;
  NSObject *oslog;
  _QWORD v44[4];
  id v45;
  CKKSScanLocalItemsOperation *v46;
  id v47;
  _QWORD v48[4];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id location;
  uint8_t v55[128];
  uint8_t buf[4];
  unsigned int v57;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSynchronizeOperation ckks](self, "ckks"));
  if (-[CKKSSynchronizeOperation isCancelled](self, "isCancelled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "zoneName"));
    v5 = sub_10000BDF4(CFSTR("ckksresync"), v4);
    oslog = objc_claimAutoreleasedReturnValue(v5);

    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "CKKSSynchronizeOperation cancelled, quitting", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(v3, "setLastSynchronizeOperation:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "zoneName"));
    v7 = sub_10000BDF4(CFSTR("ckksresync"), v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[CKKSSynchronizeOperation restartCount](self, "restartCount");
      *(_DWORD *)buf = 67109120;
      v57 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Beginning resynchronize (attempt %u)", buf, 8u);
    }

    oslog = objc_claimAutoreleasedReturnValue(+[CKOperationGroup CKKSGroupWithName:](CKOperationGroup, "CKKSGroupWithName:", CFSTR("ckks-resync")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "operationDependencies"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allCKKSManagedViews"));

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v51 != v14)
            objc_enumerationMutation(v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i), "zoneID"));
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v3, v16);

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v13);
    }

    v41 = [CKKSFetchAllRecordZoneChangesOperation alloc];
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "container"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cloudKitClassDependencies"));
    v18 = objc_msgSend(v17, "fetchRecordZoneChangesOperationClass");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("resync")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSynchronizeOperation deps](self, "deps"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "activeAccount"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "altDSID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSynchronizeOperation deps](self, "deps"));
    LOBYTE(v39) = objc_msgSend(v23, "sendMetric");
    v42 = -[CKKSFetchAllRecordZoneChangesOperation initWithContainer:fetchClass:clientMap:fetchReasons:apnsPushes:forceResync:ckoperationGroup:altDSID:sendMetric:](v41, "initWithContainer:fetchClass:clientMap:fetchReasons:apnsPushes:forceResync:ckoperationGroup:altDSID:sendMetric:", v40, v18, v10, v19, 0, 1, oslog, v22, v39);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("resync-step%u-fetch"), 5 * -[CKKSSynchronizeOperation restartCount](self, "restartCount") + 1));
    -[CKKSGroupOperation setName:](v42, "setName:", v24);

    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v42);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1000B4600;
    v48[3] = &unk_1002E9468;
    v25 = v3;
    v49 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSGroupOperation named:withBlockTakingSelf:](CKKSGroupOperation, "named:withBlockTakingSelf:", CFSTR("run-incoming"), v48));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("resync-step%u-incoming"), 5 * -[CKKSSynchronizeOperation restartCount](self, "restartCount") + 2));
    objc_msgSend(v26, "setName:", v27);

    objc_msgSend(v26, "addSuccessDependency:", v42);
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v26);
    v28 = [CKKSScanLocalItemsOperation alloc];
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "operationDependencies"));
    v30 = -[CKKSScanLocalItemsOperation initWithDependencies:intending:errorState:ckoperationGroup:](v28, "initWithDependencies:intending:errorState:ckoperationGroup:", v29, CFSTR("ready"), CFSTR("error"), oslog);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("resync-step%u-scan"), 5 * -[CKKSSynchronizeOperation restartCount](self, "restartCount") + 3));
    -[CKKSScanLocalItemsOperation setName:](v30, "setName:", v31);

    -[CKKSResultOperation addSuccessDependency:](v30, "addSuccessDependency:", v26);
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v30);
    v32 = [CKKSOutgoingQueueOperation alloc];
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "operationDependencies"));
    v34 = -[CKKSOutgoingQueueOperation initWithDependencies:intending:ckErrorState:errorState:](v32, "initWithDependencies:intending:ckErrorState:errorState:", v33, CFSTR("ready"), CFSTR("process_outgoing_queue_failed"), CFSTR("error"));

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("resync-step%u-outgoing"), 5 * -[CKKSSynchronizeOperation restartCount](self, "restartCount") + 4));
    -[CKKSGroupOperation setName:](v34, "setName:", v35);

    -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v34);
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v34);
    -[CKKSGroupOperation addDependency:](v34, "addDependency:", v30);
    v36 = objc_alloc_init(CKKSResultOperation);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("resync-step%u-consider-restart"), 5 * -[CKKSSynchronizeOperation restartCount](self, "restartCount") + 5));
    -[CKKSResultOperation setName:](v36, "setName:", v37);

    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1000B4658;
    v44[3] = &unk_1002EB5C0;
    objc_copyWeak(&v47, &location);
    v45 = v25;
    v38 = v30;
    v46 = v38;
    -[CKKSResultOperation addExecutionBlock:](v36, "addExecutionBlock:", v44);
    -[CKKSResultOperation addSuccessDependency:](v36, "addSuccessDependency:", v34);
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v36);

    objc_destroyWeak(&v47);
  }

  objc_destroyWeak(&location);
}

- (CKKSKeychainView)ckks
{
  return (CKKSKeychainView *)objc_loadWeakRetained((id *)(&self->_restartCount + 1));
}

- (void)setCkks:(id)a3
{
  objc_storeWeak((id *)(&self->_restartCount + 1), a3);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 140, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 140);
}

- (int)restartCount
{
  return self->_restartCount;
}

- (void)setRestartCount:(int)a3
{
  self->_restartCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_ckks + 4), 0);
  objc_destroyWeak((id *)(&self->_restartCount + 1));
}

@end
