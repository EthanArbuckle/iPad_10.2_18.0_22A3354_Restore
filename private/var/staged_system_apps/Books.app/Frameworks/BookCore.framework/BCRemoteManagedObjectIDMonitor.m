@implementation BCRemoteManagedObjectIDMonitor

- (BCRemoteManagedObjectIDMonitor)initWithCoordinator:(id)a3 entityName:(id)a4 historyToken:(id)a5 predicate:(id)a6 mapProperty:(id)a7 propertiesOfInterest:(id)a8 observer:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  BCRemoteManagedObjectIDMonitor *v20;
  BCRemoteManagedObjectIDMonitor *v21;
  NSString *v22;
  NSString *entityName;
  NSString *v24;
  NSString *mapProperty;
  NSSet *v26;
  NSSet *propertiesOfInterest;
  dispatch_queue_attr_t v28;
  NSObject *v29;
  dispatch_queue_t v30;
  OS_dispatch_queue *sync;
  NSMutableSet *v32;
  NSMutableSet *currentObjectIdentifiers;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void *v42;
  void *v43;
  id v44;
  void *v45;
  NSManagedObjectContext *v46;
  NSManagedObjectContext *context;
  dispatch_semaphore_t v48;
  NSObject *v49;
  NSObject *v50;
  BCRemoteManagedObjectIDMonitor *v51;
  NSManagedObjectContext *v52;
  NSObject *v53;
  __CFString *v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  BCRemoteManagedObjectIDMonitor *v60;
  NSObject *v61;
  _BYTE *v62;
  _QWORD block[4];
  NSObject *v64;
  BCRemoteManagedObjectIDMonitor *v65;
  _BYTE *v66;
  objc_super v67;
  _BYTE buf[24];
  uint64_t (*v69)(uint64_t, uint64_t);
  _BYTE v70[20];
  __int16 v71;
  __CFString *v72;
  __int16 v73;
  id v74;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v56 = a6;
  v58 = a7;
  v57 = a8;
  v19 = a9;
  v67.receiver = self;
  v67.super_class = (Class)BCRemoteManagedObjectIDMonitor;
  v20 = -[BCRemoteManagedObjectIDMonitor init](&v67, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_coordinator, a3);
    v22 = (NSString *)objc_msgSend(v17, "copy");
    entityName = v21->_entityName;
    v21->_entityName = v22;

    objc_storeStrong((id *)&v21->_historyToken, a5);
    objc_storeStrong((id *)&v21->_predicate, a6);
    v24 = (NSString *)objc_msgSend(v58, "copy");
    mapProperty = v21->_mapProperty;
    v21->_mapProperty = v24;

    v26 = (NSSet *)objc_msgSend(v57, "copy");
    propertiesOfInterest = v21->_propertiesOfInterest;
    v21->_propertiesOfInterest = v26;

    objc_storeWeak((id *)&v21->_observer, v19);
    v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    v30 = dispatch_queue_create("BCRemoteManagedObjectIDMonitor.sync", v29);
    sync = v21->_sync;
    v21->_sync = (OS_dispatch_queue *)v30;

    v32 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    currentObjectIdentifiers = v21->_currentObjectIdentifiers;
    v21->_currentObjectIdentifiers = v32;

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "persistentStores"));
    v35 = objc_msgSend(v34, "count") == 0;

    if (v35)
    {
      v55 = CFSTR("empty");
    }
    else
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "persistentStores"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "firstObject"));
      v55 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "identifier"));

    }
    v38 = BCRemoteManagedObjectIDMonitorLog();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[BCRemoteManagedObjectIDMonitor observer](v21, "observer"));
      v41 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "remoteManagerObserverId"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[BCRemoteManagedObjectIDMonitor historyToken](v21, "historyToken"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "persistentStores"));
      v44 = objc_msgSend(v43, "count");
      *(_DWORD *)buf = 138413826;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2112;
      v69 = v41;
      *(_WORD *)v70 = 2112;
      *(_QWORD *)&v70[2] = v42;
      *(_WORD *)&v70[10] = 2048;
      *(_QWORD *)&v70[12] = v44;
      v71 = 2112;
      v72 = v55;
      v73 = 2112;
      v74 = v56;
      _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "BCRemoteManagedObjectIDMonitor %@ initialized %@ with observer:%@ token:%@ storeCount:%lu persistentstoreID:(%@), predicate:%@", buf, 0x48u);

    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v45, "addObserver:selector:name:object:", v21, "_persistentStoreRemoteDidChange:", NSPersistentStoreRemoteChangeNotification, v21->_coordinator);

    v46 = (NSManagedObjectContext *)objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
    context = v21->_context;
    v21->_context = v46;

    -[NSManagedObjectContext setPersistentStoreCoordinator:](v21->_context, "setPersistentStoreCoordinator:", v21->_coordinator);
    -[NSManagedObjectContext setUndoManager:](v21->_context, "setUndoManager:", 0);
    -[NSManagedObjectContext setMergePolicy:](v21->_context, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v69 = sub_3CD18;
    *(_QWORD *)v70 = sub_3CD28;
    *(_QWORD *)&v70[8] = 0;
    v48 = dispatch_semaphore_create(0);
    v49 = v21->_sync;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3CD30;
    block[3] = &unk_28C430;
    v50 = v48;
    v64 = v50;
    v51 = v21;
    v65 = v51;
    v66 = buf;
    dispatch_async(v49, block);
    v52 = v21->_context;
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_3CD68;
    v59[3] = &unk_28D240;
    v60 = v51;
    v62 = buf;
    v53 = v50;
    v61 = v53;
    -[NSManagedObjectContext performBlock:](v52, "performBlock:", v59);

    _Block_object_dispose(buf, 8);
  }

  return v21;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, NSPersistentStoreRemoteChangeNotification, self->_coordinator);

  v4.receiver = self;
  v4.super_class = (Class)BCRemoteManagedObjectIDMonitor;
  -[BCRemoteManagedObjectIDMonitor dealloc](&v4, "dealloc");
}

- (BOOL)_objectHasChangesOfInterest:(id)a3
{
  BCRemoteManagedObjectIDMonitor *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!self->_propertiesOfInterest)
    return 1;
  v3 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "changedValues"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

  LOBYTE(v3) = objc_msgSend(v6, "intersectsSet:", v3->_propertiesOfInterest);
  return (char)v3;
}

- (void)_persistentStoreRemoteDidChange:(id)a3
{
  id v4;
  id v5;
  NSObject *activity;
  _QWORD block[4];
  id v8;
  BCRemoteManagedObjectIDMonitor *v9;

  v4 = a3;
  activity = _os_activity_create(&dword_0, "BCRemoteMonitorHistoryProcessing", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3D130;
  block[3] = &unk_28B808;
  v8 = v4;
  v9 = self;
  v5 = v4;
  os_activity_apply(activity, block);

}

- (id)_fetchPersistentHistoryWithHistoryToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:](NSPersistentHistoryChangeRequest, "fetchHistoryAfterToken:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCRemoteManagedObjectIDMonitor context](self, "context"));
  v17 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeRequest:error:", v5, &v17));
  v8 = v17;

  v9 = BCRemoteManagedObjectIDMonitorLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_1B454C((uint64_t)v4, v7);

  if (!v7)
  {
    v11 = BCRemoteManagedObjectIDMonitorLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1B44D4();

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "result"));
  if (objc_msgSend(v13, "count"))
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  return v15;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCRemoteManagedObjectIDMonitor observer](self, "observer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteManagerObserverId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCRemoteManagedObjectIDMonitor entityName](self, "entityName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p observer:%@-%@>"), v5, self, v7, v8));

  return v9;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (NSPersistentStoreCoordinator)coordinator
{
  return self->_coordinator;
}

- (NSString)entityName
{
  return self->_entityName;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSString)mapProperty
{
  return self->_mapProperty;
}

- (NSSet)propertiesOfInterest
{
  return self->_propertiesOfInterest;
}

- (BCRemoteManagedObjectIDMonitorObserver)observer
{
  return (BCRemoteManagedObjectIDMonitorObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (OS_dispatch_queue)sync
{
  return self->_sync;
}

- (NSMutableSet)currentObjectIdentifiers
{
  return self->_currentObjectIdentifiers;
}

- (NSPersistentHistoryToken)historyToken
{
  return self->_historyToken;
}

- (void)setHistoryToken:(id)a3
{
  objc_storeStrong((id *)&self->_historyToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyToken, 0);
  objc_storeStrong((id *)&self->_currentObjectIdentifiers, 0);
  objc_storeStrong((id *)&self->_sync, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_propertiesOfInterest, 0);
  objc_storeStrong((id *)&self->_mapProperty, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
