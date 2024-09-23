@implementation GKUniqueObjectIDLookup

- (GKUniqueObjectIDLookup)initWithObjectClass:(Class)a3 context:(id)a4
{
  id v6;
  void *v7;
  GKUniqueObjectIDLookup *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  v8 = -[GKUniqueObjectIDLookup initWithObjectClass:context:predicate:](self, "initWithObjectClass:context:predicate:", a3, v6, v7);

  return v8;
}

- (GKUniqueObjectIDLookup)initWithObjectClass:(Class)a3 context:(id)a4 predicate:(id)a5
{
  id v7;
  void *v8;
  GKUniqueObjectIDLookup *v9;
  NSString *v10;
  void *v11;
  GKThreadsafeDictionary *v12;
  GKThreadsafeDictionary *lookup;
  dispatch_semaphore_t v14;
  OS_dispatch_semaphore *semaphore;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  objc_super v21;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class uniqueAttributeName](a3, "uniqueAttributeName"));
  if (v8)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Class %@ must define a attribute for uniquing."), a3));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (uniqueKey != nil)\n[%s (%s:%d)]"), v17, "-[GKUniqueObjectIDLookup initWithObjectClass:context:predicate:]", objc_msgSend(v19, "UTF8String"), 58));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v20);
    if (v7)
      goto LABEL_3;
  }
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)GKUniqueObjectIDLookup;
  v9 = -[GKUniqueObjectIDLookup init](&v21, "init");
  if (v9)
  {
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s.%@"), class_getName(a3), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (GKThreadsafeDictionary *)objc_msgSend(objc_alloc((Class)GKThreadsafeDictionary), "initWithName:", v11);
    lookup = v9->_lookup;
    v9->_lookup = v12;

    objc_storeStrong((id *)&v9->_predicate, v7);
    v9->_objectClass = a3;
    v14 = dispatch_semaphore_create(1);
    semaphore = v9->_semaphore;
    v9->_semaphore = (OS_dispatch_semaphore *)v14;

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKUniqueObjectIDLookup;
  -[GKUniqueObjectIDLookup dealloc](&v4, "dealloc");
}

- (void)_populateWithContext:(id)a3
{
  id v4;
  dispatch_queue_t current_queue;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  id v44;
  _BYTE v45[128];
  _QWORD v46[2];

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKUniqueObjectIDLookup _populateWithContext:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKUniqueObjectIDLookup _populateWithContext:]", objc_msgSend(v10, "UTF8String"), 81));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class uniqueAttributeName](self->_objectClass, "uniqueAttributeName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class fetchRequestForContext:](self->_objectClass, "fetchRequestForContext:", v4));
  objc_msgSend(v13, "setPredicate:", self->_predicate);
  objc_msgSend(v13, "setResultType:", 2);
  v14 = objc_alloc_init((Class)NSExpressionDescription);
  objc_msgSend(v14, "setName:", CFSTR("objectID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForEvaluatedObject](NSExpression, "expressionForEvaluatedObject"));
  objc_msgSend(v14, "setExpression:", v15);

  objc_msgSend(v14, "setExpressionResultType:", 2000);
  v46[0] = v12;
  v46[1] = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 2));
  objc_msgSend(v13, "setPropertiesToFetch:", v16);

  objc_msgSend(v13, "setReturnsDistinctResults:", 1);
  v44 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeFetchRequest:error:", v13, &v44));
  v18 = v44;
  v19 = v18;
  if (v18)
  {
    if (!os_log_GKGeneral)
      v20 = (id)GKOSLoggers(v18);
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_1000F6318();
  }
  v35 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m", 101, "-[GKUniqueObjectIDLookup _populateWithContext:]"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v21));

  v23 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v17, "count"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000DC1B4;
  v40[3] = &unk_1002BC3A8;
  v40[4] = self;
  v24 = v17;
  v41 = v24;
  v25 = v12;
  v42 = v25;
  v26 = v23;
  v43 = v26;
  objc_msgSend(v22, "perform:", v40);
  objc_msgSend(v22, "wait");
  if (objc_msgSend(v26, "count"))
  {
    v33 = v24;
    v34 = v25;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v27 = v26;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v37;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v37 != v30)
            objc_enumerationMutation(v27);
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectWithID:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v31)));
          if (v32)
            objc_msgSend(v4, "deleteObject:", v32);

          v31 = (char *)v31 + 1;
        }
        while (v29 != v31);
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v29);
    }

    v24 = v33;
    v25 = v34;
  }

}

- (id)uniqueObjectsForKeys:(id)a3 context:(id)a4 newObject:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  dispatch_queue_t current_queue;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  GKThreadsafeDictionary *lookup;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  dispatch_queue_global_t global_queue;
  NSObject *v47;
  id v48;
  id v50;
  id v51;
  GKThreadsafeDictionary *v52;
  void *v53;
  void *v54;
  NSObject *group;
  void *v56;
  _QWORD block[5];
  _QWORD v58[4];
  id v59;
  NSObject *v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v53 = v10;
  if (!os_log_GKGeneral)
    v11 = (id)GKOSLoggers(v10);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F63D8();
  current_queue = dispatch_get_current_queue();
  v13 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v13, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKUniqueObjectIDLookup uniqueObjectsForKeys:context:newObject:]", v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastPathComponent")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v15, "-[GKUniqueObjectIDLookup uniqueObjectsForKeys:context:newObject:]", objc_msgSend(v17, "UTF8String"), 146));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v18);
  }

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (GKAtomicCompareAndSwap32Barrier(0, 1, &self->_valid))
    -[GKUniqueObjectIDLookup _populateWithContext:](self, "_populateWithContext:", v9);
  v19 = objc_msgSend(v8, "count");
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class uniqueAttributeName](self->_objectClass, "uniqueAttributeName"));
  v51 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v19);
  v20 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", v19);
  group = dispatch_group_create();
  lookup = self->_lookup;
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_1000DCBE4;
  v73[3] = &unk_1002C2360;
  v22 = v8;
  v74 = v22;
  v23 = v20;
  v75 = v23;
  -[GKThreadsafeDictionary readFromDictionary:](lookup, "readFromDictionary:", v73);
  v50 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v19));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allValues"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v25));

  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_1000DCD14;
  v69[3] = &unk_1002C2388;
  v27 = v9;
  v70 = v27;
  v28 = v24;
  v71 = v28;
  v29 = v26;
  v72 = v29;
  objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v69);
  v30 = objc_msgSend(v29, "count");
  if (v30)
  {
    if (!os_log_GKGeneral)
      v31 = (id)GKOSLoggers(v30);
    if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
      sub_1000F6378();
    v32 = objc_alloc((Class)NSFetchRequest);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class entityName](self->_objectClass, "entityName"));
    v34 = objc_msgSend(v32, "initWithEntityName:", v33);

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self IN %@"), v29));
    objc_msgSend(v34, "setPredicate:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class relationshipKeyPathsForPrefetch](self->_objectClass, "relationshipKeyPathsForPrefetch"));
    objc_msgSend(v34, "setRelationshipKeyPathsForPrefetching:", v36);

    objc_msgSend(v34, "setReturnsObjectsAsFaults:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "executeFetchRequest:error:", v34, 0));
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_1000DCD94;
    v66[3] = &unk_1002C23B0;
    v67 = v56;
    v68 = v28;
    objc_msgSend(v37, "enumerateObjectsUsingBlock:", v66);

  }
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_1000DCDEC;
  v61[3] = &unk_1002C23D8;
  v38 = v28;
  v62 = v38;
  v39 = v53;
  v65 = v39;
  v40 = v50;
  v63 = v40;
  v41 = v51;
  v64 = v41;
  v54 = v22;
  objc_msgSend(v22, "enumerateObjectsUsingBlock:", v61);
  if (objc_msgSend(v40, "count"))
  {
    if (objc_msgSend(v27, "obtainPermanentIDsForObjects:error:", v40, 0))
    {
      v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "_gkMapDictionaryWithKeyPath:valueKeyPath:", v56, CFSTR("objectID")));
      if (v42)
      {
        v43 = (void *)v42;
        dispatch_group_enter(group);
        v52 = self->_lookup;
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_1000DCE70;
        v58[3] = &unk_1002C2400;
        v59 = v43;
        v60 = group;
        v44 = v43;
        -[GKThreadsafeDictionary writeToDictionary:](v52, "writeToDictionary:", v58);

      }
    }
  }
  v45 = v41;
  global_queue = dispatch_get_global_queue(0, 0);
  v47 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DCE9C;
  block[3] = &unk_1002BBBD8;
  block[4] = self;
  dispatch_group_notify(group, v47, block);

  v48 = v45;
  return v48;
}

- (id)insertObjectsForServerRepresentations:(id)a3 context:(id)a4 newObject:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_queue_t current_queue;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  GKThreadsafeDictionary *lookup;
  id v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  current_queue = dispatch_get_current_queue();
  v12 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v12, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKUniqueObjectIDLookup insertObjectsForServerRepresentations:context:newObject:]", v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v14, "-[GKUniqueObjectIDLookup insertObjectsForServerRepresentations:context:newObject:]", objc_msgSend(v16, "UTF8String"), 244));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v17);
  }

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000DD15C;
  v29[3] = &unk_1002C2428;
  v18 = v10;
  v30 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_gkMapWithBlock:", v29));
  if (objc_msgSend(v19, "count"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class uniqueAttributeName](self->_objectClass, "uniqueAttributeName"));
    if (objc_msgSend(v9, "obtainPermanentIDsForObjects:error:", v19, 0))
    {
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_gkMapDictionaryWithKeyPath:valueKeyPath:", v20, CFSTR("objectID")));
      if (v21)
      {
        v22 = (void *)v21;
        if (!os_log_GKGeneral)
          v23 = (id)GKOSLoggers(v21);
        if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
          sub_1000F6404();
        lookup = self->_lookup;
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_1000DD168;
        v27[3] = &unk_1002C2450;
        v28 = v22;
        v25 = v22;
        -[GKThreadsafeDictionary writeToDictionary:](lookup, "writeToDictionary:", v27);

      }
    }

  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_lookup, 0);
}

@end
