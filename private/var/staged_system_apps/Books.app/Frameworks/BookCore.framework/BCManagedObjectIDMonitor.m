@implementation BCManagedObjectIDMonitor

- (BCManagedObjectIDMonitor)initWithContext:(id)a3 coordinator:(id)a4 entityName:(id)a5 predicate:(id)a6 mapProperty:(id)a7 propertiesOfInterest:(id)a8 observer:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  os_signpost_id_t v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  unint64_t v26;
  BCManagedObjectIDMonitor *v27;
  BCManagedObjectIDMonitor *v28;
  NSString *v29;
  NSString *entityName;
  void *v31;
  NSString *v32;
  NSString *mapProperty;
  NSSet *v34;
  NSSet *propertiesOfInterest;
  dispatch_queue_t v36;
  OS_dispatch_queue *sync;
  NSMutableSet *v38;
  NSMutableSet *currentObjectIdentifiers;
  uint64_t v40;
  NSMapTable *mocToChangesMap;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  NSObject *v46;
  os_signpost_id_t spid;
  id v49;
  id v50;
  id v51;
  _QWORD v52[4];
  BCManagedObjectIDMonitor *v53;
  id v54;
  objc_super v55;
  uint8_t buf[4];
  id v57;

  v16 = a3;
  v50 = a4;
  v51 = a5;
  v49 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = BCSignpostLibrary();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = os_signpost_id_generate(v21);

  v23 = BCSignpostLibrary();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  v25 = v24;
  spid = v22;
  v26 = v22 - 1;
  if (v26 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_DWORD *)buf = 138412290;
    v57 = v51;
    _os_signpost_emit_with_name_impl(&dword_0, v25, OS_SIGNPOST_INTERVAL_BEGIN, spid, "BCManagedObjectIDMonitor initial fetch", "%@", buf, 0xCu);
  }

  v55.receiver = self;
  v55.super_class = (Class)BCManagedObjectIDMonitor;
  v27 = -[BCManagedObjectIDMonitor init](&v55, "init");
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_context, a3);
    objc_storeStrong((id *)&v28->_coordinator, a4);
    v29 = (NSString *)objc_msgSend(v51, "copy");
    entityName = v28->_entityName;
    v28->_entityName = v29;

    objc_storeStrong((id *)&v28->_predicate, a6);
    v31 = v17;
    v32 = (NSString *)objc_msgSend(v17, "copy");
    mapProperty = v28->_mapProperty;
    v28->_mapProperty = v32;

    v34 = (NSSet *)objc_msgSend(v18, "copy");
    propertiesOfInterest = v28->_propertiesOfInterest;
    v28->_propertiesOfInterest = v34;

    objc_storeWeak((id *)&v28->_observer, v19);
    v36 = dispatch_queue_create("BCManagedObjectIDMonitor.sync", 0);
    sync = v28->_sync;
    v28->_sync = (OS_dispatch_queue *)v36;

    dispatch_suspend((dispatch_object_t)v28->_sync);
    v38 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    currentObjectIdentifiers = v28->_currentObjectIdentifiers;
    v28->_currentObjectIdentifiers = v38;

    v40 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    mocToChangesMap = v28->_mocToChangesMap;
    v28->_mocToChangesMap = (NSMapTable *)v40;

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v42, "addObserver:selector:name:object:", v28, "_managedObjectContextWillSave:", NSManagedObjectContextWillSaveNotification, 0);

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v43, "addObserver:selector:name:object:", v28, "_managedObjectContextDidSave:", NSManagedObjectContextDidSaveNotification, 0);

    if (!v16)
    {
      v16 = objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
      objc_msgSend(v16, "setPersistentStoreCoordinator:", v28->_coordinator);
      objc_msgSend(v16, "setUndoManager:", 0);
      objc_msgSend(v16, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
    }
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_15A790;
    v52[3] = &unk_28B808;
    v53 = v28;
    v16 = v16;
    v54 = v16;
    objc_msgSend(v16, "performBlockAndWait:", v52);

  }
  else
  {
    v31 = v17;
  }
  v44 = BCSignpostLibrary();
  v45 = objc_claimAutoreleasedReturnValue(v44);
  v46 = v45;
  if (v26 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
  {
    *(_DWORD *)buf = 138412290;
    v57 = v51;
    _os_signpost_emit_with_name_impl(&dword_0, v46, OS_SIGNPOST_INTERVAL_BEGIN, spid, "BCManagedObjectIDMonitor initial fetch", "%@", buf, 0xCu);
  }

  return v28;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, NSManagedObjectContextWillSaveNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, NSManagedObjectContextDidSaveNotification, 0);

  v5.receiver = self;
  v5.super_class = (Class)BCManagedObjectIDMonitor;
  -[BCManagedObjectIDMonitor dealloc](&v5, "dealloc");
}

- (BOOL)_objectHasChangesOfInterest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "changedValues"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

  LOBYTE(self) = objc_msgSend(v6, "intersectsSet:", self->_propertiesOfInterest);
  return (char)self;
}

- (void)_managedObjectContextWillSave:(id)a3
{
  NSManagedObjectContext *v4;
  NSManagedObjectContext *context;
  NSManagedObjectContext *v6;
  void *v7;
  unsigned int v8;
  NSObject *sync;
  __CFString *mapProperty;
  __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  NSPredicate *predicate;
  void *v31;
  id v32;
  uint64_t v33;
  void *k;
  void *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  NSPredicate *v40;
  unsigned int v41;
  unsigned int v42;
  void *v43;
  int v44;
  BCManagedObjectIDChanges *v45;
  NSObject *v46;
  BCManagedObjectIDChanges *v47;
  id WeakRetained;
  id v49;
  NSManagedObjectContext *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[5];
  BCManagedObjectIDChanges *v55;
  NSManagedObjectContext *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD block[6];
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];

  v49 = a3;
  v4 = (NSManagedObjectContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "object"));
  v50 = v4;
  context = self->_context;
  v6 = v4;
  if (context == v4
    || !context
    && self->_coordinator
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext persistentStoreCoordinator](v4, "persistentStoreCoordinator")),
        v8 = objc_msgSend(v7, "hasStoreInCommonWith:", self->_coordinator),
        v7,
        v6 = v50,
        v8))
  {
    v70 = 0;
    v71 = &v70;
    v72 = 0x3032000000;
    v73 = sub_15B0E4;
    v74 = sub_15B0F4;
    v75 = 0;
    sync = self->_sync;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_15B0FC;
    block[3] = &unk_28B700;
    block[4] = self;
    block[5] = &v70;
    dispatch_sync(sync, block);
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    mapProperty = (__CFString *)self->_mapProperty;
    if (!mapProperty)
      mapProperty = CFSTR("objectID");
    v11 = mapProperty;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext deletedObjects](v6, "deletedObjects"));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v66 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "entity"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
          v19 = objc_msgSend(v18, "isEqualToString:", self->_entityName);

          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKey:", v11));
            if (v20 && objc_msgSend((id)v71[5], "containsObject:", v20))
              objc_msgSend(v52, "addObject:", v20);

          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
      }
      while (v13);
    }

    v63 = 0u;
    v64 = 0u;
    v62 = 0u;
    v61 = 0u;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext insertedObjects](v50, "insertedObjects"));
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v62;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(_QWORD *)v62 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "entity"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "name"));
          v28 = objc_msgSend(v27, "isEqualToString:", self->_entityName);

          if (v28)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "valueForKey:", v11));
            if (v29)
            {
              predicate = self->_predicate;
              if (!predicate || -[NSPredicate evaluateWithObject:](predicate, "evaluateWithObject:", v25))
                objc_msgSend(v53, "addObject:", v29);
            }

          }
        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
      }
      while (v22);
    }

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext updatedObjects](v50, "updatedObjects"));
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v58;
      do
      {
        for (k = 0; k != v32; k = (char *)k + 1)
        {
          if (*(_QWORD *)v58 != v33)
            objc_enumerationMutation(v31);
          v35 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)k);
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "entity"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "name"));
          v38 = objc_msgSend(v37, "isEqualToString:", self->_entityName);

          if (v38)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "valueForKey:", v11));
            if (v39
              && (!self->_propertiesOfInterest
               || -[BCManagedObjectIDMonitor _objectHasChangesOfInterest:](self, "_objectHasChangesOfInterest:", v35)))
            {
              v40 = self->_predicate;
              v41 = !v40 || -[NSPredicate evaluateWithObject:](v40, "evaluateWithObject:", v35);
              v42 = objc_msgSend((id)v71[5], "containsObject:", v39);
              v43 = v53;
              if (((v41 ^ 1 | v42) & 1) == 0
                || (v44 = v42 ^ 1, v43 = v52, (v41 | v44) != 1)
                || (v43 = v51, ((v41 ^ 1 | v44) & 1) == 0))
              {
                objc_msgSend(v43, "addObject:", v39);
              }
            }

          }
        }
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
      }
      while (v32);
    }

    if (objc_msgSend(v53, "count") || objc_msgSend(v52, "count") || objc_msgSend(v51, "count"))
    {
      v45 = -[BCManagedObjectIDChanges initWithAdded:updated:deleted:context:]([BCManagedObjectIDChanges alloc], "initWithAdded:updated:deleted:context:", v53, v51, v52, v50);
      v46 = self->_sync;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_15B134;
      v54[3] = &unk_28C5F0;
      v54[4] = self;
      v47 = v45;
      v55 = v47;
      v56 = v50;
      dispatch_sync(v46, v54);
      WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
      if ((objc_opt_respondsToSelector(WeakRetained, "managedObjectBackgroundMonitor:willSaveNotify:") & 1) != 0)
        objc_msgSend(WeakRetained, "managedObjectBackgroundMonitor:willSaveNotify:", self, v47);

    }
    _Block_object_dispose(&v70, 8);

    v6 = v50;
  }

}

- (void)_managedObjectContextDidSave:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  NSManagedObjectContext *context;
  void *v8;
  unsigned int v9;
  NSObject *sync;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;
  _QWORD block[5];
  NSManagedObjectContext *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v5 = (NSManagedObjectContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = v5;
  context = self->_context;
  if (context == v5
    || !context
    && self->_coordinator
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext persistentStoreCoordinator](v5, "persistentStoreCoordinator")),
        v9 = objc_msgSend(v8, "hasStoreInCommonWith:", self->_coordinator),
        v8,
        v9))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = sub_15B0E4;
    v23 = sub_15B0F4;
    v24 = 0;
    sync = self->_sync;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_15B318;
    block[3] = &unk_28B7E0;
    v18 = &v19;
    block[4] = self;
    v17 = v6;
    dispatch_sync(sync, block);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v20[5], "addedObjects"));
    if (!objc_msgSend(v11, "count"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v20[5], "deletedObjects"));
      if (!objc_msgSend(v12, "count"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v20[5], "updatedObjects"));
        v15 = objc_msgSend(v14, "count");

        if (!v15)
          goto LABEL_10;
        goto LABEL_9;
      }

    }
LABEL_9:
    WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    objc_msgSend(WeakRetained, "managedObjectBackgroundMonitor:didSaveNotify:", self, v20[5]);

LABEL_10:
    _Block_object_dispose(&v19, 8);

  }
}

- (NSSet)currentIdentifiers
{
  NSObject *sync;
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
  v9 = sub_15B0E4;
  v10 = sub_15B0F4;
  v11 = 0;
  sync = self->_sync;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_15B50C;
  v5[3] = &unk_28B700;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sync, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
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

- (OS_dispatch_queue)sync
{
  return self->_sync;
}

- (BCManagedObjectIDMonitorObserver)observer
{
  return (BCManagedObjectIDMonitorObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (NSMapTable)mocToChangesMap
{
  return self->_mocToChangesMap;
}

- (NSMutableSet)currentObjectIdentifiers
{
  return self->_currentObjectIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentObjectIdentifiers, 0);
  objc_storeStrong((id *)&self->_mocToChangesMap, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_sync, 0);
  objc_storeStrong((id *)&self->_propertiesOfInterest, 0);
  objc_storeStrong((id *)&self->_mapProperty, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
